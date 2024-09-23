@implementation UIFeedbackGenerator

- (BOOL)_isEnabled
{
  void *v3;
  BOOL v4;

  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self->_configuration, "_setupIfNecessary");
  -[UIFeedbackGenerator _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
    v4 = !self->_disabledByView;
  else
    v4 = 0;

  return v4;
}

- (UIFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  id v7;
  id v8;
  UIFeedbackGenerator *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIFeedbackGenerator;
  v9 = -[UIFeedbackGenerator init](&v12, sel_init);
  objc_msgSend((id)objc_opt_class(), "_configurationClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("UIFeedbackGenerator.m"), 142, CFSTR("Invalid configuration class %@ for generator %@"), v7, v9);

  }
  -[UIFeedbackGenerator _setConfiguration:](v9, "_setConfiguration:", v7);
  if (v8)
    objc_msgSend(v8, "addInteraction:", v9);

  return v9;
}

- (void)_setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  id v7;
  _UIFeedbackGeneratorGestureRecognizer *gestureRecognizer;
  _UIFeedbackGeneratorGestureRecognizer *v9;

  p_view = &self->_view;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);

  if (WeakRetained != v5)
  {
    if (self->_traitChangeRegistration)
    {
      v7 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v7, "unregisterForTraitChanges:", self->_traitChangeRegistration);

    }
    gestureRecognizer = self->_gestureRecognizer;
    if (gestureRecognizer)
    {
      -[_UIFeedbackGeneratorGestureRecognizer cleanupGestureRecognizerForFeedbackGenerator:]((id *)&gestureRecognizer->super.super.isa, self);
      v9 = self->_gestureRecognizer;
      self->_gestureRecognizer = 0;

    }
  }
}

- (void)didMoveToView:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  UITraitChangeRegistration *v7;
  UITraitChangeRegistration *traitChangeRegistration;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_view, v4);
    -[UIFeedbackGenerator _updateForViewUserInterfaceIdiom](self, "_updateForViewUserInterfaceIdiom");
    v9[0] = 0x1E1A99498;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_registerForTraitTokenChanges:withTarget:action:", v6, self, sel__updateForViewUserInterfaceIdiom);
    v7 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = self->_traitChangeRegistration;
    self->_traitChangeRegistration = v7;

  }
}

- (void)_updateForViewUserInterfaceIdiom
{
  UIView **p_view;
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _UIFeedbackGeneratorGestureRecognizer *v10;
  _UIFeedbackGeneratorGestureRecognizer *gestureRecognizer;
  _UIFeedbackGeneratorGestureRecognizer *v12;
  _UIFeedbackGeneratorGestureRecognizer *v13;
  _UIFeedbackGeneratorGestureRecognizer *v14;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    self->_disabledByView = v7 == 3;
    if (v7 == 1
      && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = -[UIDevice _peripheralFeedbackSupportLevel]((uint64_t)v8),
          v8,
          v9 >= 1))
    {
      if (self->_gestureRecognizer)
        return;
      v14 = (_UIFeedbackGeneratorGestureRecognizer *)objc_loadWeakRetained((id *)p_view);
      +[_UIFeedbackGeneratorGestureRecognizer gestureRecognizerForView:feedbackGenerator:]((uint64_t)_UIFeedbackGeneratorGestureRecognizer, v14, self);
      v10 = (_UIFeedbackGeneratorGestureRecognizer *)objc_claimAutoreleasedReturnValue();
      gestureRecognizer = self->_gestureRecognizer;
      self->_gestureRecognizer = v10;

      v12 = v14;
    }
    else
    {
      v13 = self->_gestureRecognizer;
      if (!v13)
        return;
      -[_UIFeedbackGeneratorGestureRecognizer cleanupGestureRecognizerForFeedbackGenerator:]((id *)&v13->super.super.isa, self);
      v12 = self->_gestureRecognizer;
      self->_gestureRecognizer = 0;
    }

  }
  else
  {
    self->_disabledByView = 0;
  }
}

- (_UIFeedbackGeneratorConfiguration)_configuration
{
  return self->_configuration;
}

- (UIFeedbackGenerator)initWithConfiguration:(id)a3
{
  return -[UIFeedbackGenerator initWithConfiguration:view:](self, "initWithConfiguration:view:", a3, 0);
}

- (void)_stats_playedFeedback
{
  id v2;

  -[UIFeedbackGenerator _playCountStatistics](self, "_playCountStatistics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementValueBy:", 1);

}

void __47__UIFeedbackGenerator__scheduleFeedbackWarming__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_startFeedbackWarming");
    WeakRetained = v2;
  }

}

- (void)_startFeedbackWarming
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id feedbackWarmingBlock;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_engines;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "_startWarmingFeedbacks:", self->_usedFeedbacks, (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  feedbackWarmingBlock = self->_feedbackWarmingBlock;
  self->_feedbackWarmingBlock = 0;

}

- (void)_setOutputMode:(int64_t)a3
{
  id v4;

  -[UIFeedbackGenerator _configuration](self, "_configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputMode:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engines, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_usedFeedbacks, 0);
  objc_storeStrong(&self->_feedbackWarmingBlock, 0);
  objc_storeStrong((id *)&self->_preparationTimers, 0);
  objc_storeStrong((id *)&self->_autoDeactivateTimer, 0);
}

- (void)_prepareWithStyle:(int64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  NSObject *v15;
  double v16;
  int64_t v17;
  _QWORD handler[4];
  id v19[2];
  _BYTE location[12];
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[UIFeedbackGenerator _preparationTimeoutForStyle:](self, "_preparationTimeoutForStyle:");
  if (v5 > 0.0)
  {
    v6 = v5;
    if (!_UIFeedbackLoggingDisabled)
    {
      v7 = _prepareWithStyle____s_category;
      if (!_prepareWithStyle____s_category)
      {
        v7 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_prepareWithStyle____s_category);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v11 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = v11;
          stringForActivationStyle(a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138412802;
          *(_QWORD *)&location[4] = self;
          v21 = 2112;
          v22 = v13;
          v23 = 2048;
          v24 = v6;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "prepare %@ with style %@, timeout %g sec", location, 0x20u);

        }
      }
    }
    -[UIFeedbackGenerator _preparationTimerForStyle:](self, "_preparationTimerForStyle:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UIFeedbackGenerator _updatePreparationTimer:withTimeout:](self, "_updatePreparationTimer:withTimeout:", v8, v6);
    }
    else
    {
      objc_initWeak((id *)location, self);
      v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v10 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __41__UIFeedbackGenerator__prepareWithStyle___block_invoke;
      handler[3] = &unk_1E16C0530;
      objc_copyWeak(v19, (id *)location);
      v19[1] = (id)a3;
      dispatch_source_set_event_handler(v9, handler);
      -[UIFeedbackGenerator _setPreparationTimer:forStyle:](self, "_setPreparationTimer:forStyle:", v9, a3);
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __41__UIFeedbackGenerator__prepareWithStyle___block_invoke_27;
      v14[3] = &unk_1E16C4F78;
      v14[4] = self;
      v8 = v9;
      v15 = v8;
      v16 = v6;
      v17 = a3;
      -[UIFeedbackGenerator _activateWithStyle:completionBlock:](self, "_activateWithStyle:completionBlock:", a3, v14);

      objc_destroyWeak(v19);
      objc_destroyWeak((id *)location);
    }

  }
}

- (void)_setPreparationTimer:(id)a3 forStyle:(int64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *preparationTimers;
  void *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  if (!self->_preparationTimers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    preparationTimers = self->_preparationTimers;
    self->_preparationTimers = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_preparationTimers;
  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, v8);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v8);

}

- (double)_preparationTimeoutForStyle:(int64_t)a3
{
  return *((double *)&_UIFeedbackGeneratorPreparationTimeouts + a3);
}

- (void)_activateWithStyle:(int64_t)a3 completionBlock:(id)a4
{
  ++self->_externalActivationCount;
  -[UIFeedbackGenerator __activateWithStyle:forFeedback:completionBlock:](self, "__activateWithStyle:forFeedback:completionBlock:", a3, 0, a4);
}

void __71__UIFeedbackGenerator___activateWithStyle_forFeedback_completionBlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (*(uint64_t *)(a1 + 64) >= 1)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (a2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = *(_QWORD *)(a1 + 64);
  if (v3 > v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("UIFeedbackGenerator.m"), 422, CFSTR("The feedback engine activation block was called more times than the number of engines."));

    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v4 = *(_QWORD *)(a1 + 64);
  }
  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_activated");
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 0);
  }
}

- (void)_stats_prepared
{
  id v2;

  -[UIFeedbackGenerator _preparationCountStatistics](self, "_preparationCountStatistics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementValueBy:", 1);

}

- (id)_preparationCountStatistics
{
  void *v2;
  void *v3;

  -[UIFeedbackGenerator _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackGeneratorPreparationCountWithSuffix:](_UIStatistics, "feedbackGeneratorPreparationCountWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_playCountStatistics
{
  void *v2;
  void *v3;

  -[UIFeedbackGenerator _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackGeneratorPlayCountWithSuffix:](_UIStatistics, "feedbackGeneratorPlayCountWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_deactivated
{
  NSSet *usedFeedbacks;

  if (self->_activated)
  {
    -[UIFeedbackGenerator _stopAutoDeactivateTimer](self, "_stopAutoDeactivateTimer");
    -[UIFeedbackGenerator _stats_activationDidChangeTo:](self, "_stats_activationDidChangeTo:", 0);
    -[UIFeedbackGenerator _stopFeedbackWarming](self, "_stopFeedbackWarming");
    if (self->_usesCustomActivation)
    {
      usedFeedbacks = self->_usedFeedbacks;
      self->_usedFeedbacks = 0;

    }
    self->_activated = 0;
  }
}

- (void)_activated
{
  if (!self->_activated)
  {
    -[UIFeedbackGenerator _setupAutoDeactivateTimer](self, "_setupAutoDeactivateTimer");
    -[UIFeedbackGenerator _stats_activationDidChangeTo:](self, "_stats_activationDidChangeTo:", 1);
    -[UIFeedbackGenerator _scheduleFeedbackWarming](self, "_scheduleFeedbackWarming");
    self->_activated = 1;
  }
}

- (void)_stats_activationDidChangeTo:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[UIFeedbackGenerator _activationCountStatistics](self, "_activationCountStatistics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incrementValueBy:", 1);

    -[UIFeedbackGenerator _activationDurationStatistics](self, "_activationDurationStatistics");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startTimingForObject:", self);
  }
  else
  {
    -[UIFeedbackGenerator _activationDurationStatistics](self, "_activationDurationStatistics");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordTimingForObject:", self);
  }

}

- (id)_activationCountStatistics
{
  void *v2;
  void *v3;

  -[UIFeedbackGenerator _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackGeneratorActivationCountWithSuffix:](_UIStatistics, "feedbackGeneratorActivationCountWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_activationDurationStatistics
{
  void *v2;
  void *v3;

  -[UIFeedbackGenerator _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackGeneratorActivationDurationWithSuffix:](_UIStatistics, "feedbackGeneratorActivationDurationWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_statsSuffix
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIFeedbackGenerator _stats_key](self, "_stats_key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFeedbackGenerator _configuration](self, "_configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stats_key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (void)_scheduleFeedbackWarming
{
  dispatch_block_t v3;
  id feedbackWarmingBlock;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__UIFeedbackGenerator__scheduleFeedbackWarming__block_invoke;
  v5[3] = &unk_1E16B3F40;
  objc_copyWeak(&v6, &location);
  v3 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v5);
  feedbackWarmingBlock = self->_feedbackWarmingBlock;
  self->_feedbackWarmingBlock = v3;

  dispatch_async(MEMORY[0x1E0C80D38], self->_feedbackWarmingBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_stopFeedbackWarming
{
  id feedbackWarmingBlock;
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  feedbackWarmingBlock = self->_feedbackWarmingBlock;
  if (feedbackWarmingBlock)
  {
    dispatch_block_cancel(feedbackWarmingBlock);
    v4 = self->_feedbackWarmingBlock;
    self->_feedbackWarmingBlock = 0;

  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_engines;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_stopWarmingFeedbacks:", self->_usedFeedbacks, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_playFeedback:(id)a3 withMinimumIntervalPassed:(double)a4 since:(double *)a5 prefersRegularPace:(BOOL)a6 atLocation:(CGPoint)a7
{
  double y;
  double x;
  id v13;
  _UIFeedbackGeneratorGestureRecognizer *gestureRecognizer;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  _UIFeedbackGeneratorGestureRecognizer *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  UIFeedbackGenerator *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  double currentDelay;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  UIFeedbackGenerator *v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  UIFeedbackGenerator *v53;
  _BYTE *v54;
  double *v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  BOOL v60;
  uint64_t v61;
  _BYTE buf[24];
  double v63;
  uint64_t v64;

  y = a7.y;
  x = a7.x;
  v64 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  kdebug_trace();
  if (v13 && -[UIFeedbackGenerator _isEnabled](self, "_isEnabled"))
  {
    gestureRecognizer = self->_gestureRecognizer;
    if (!gestureRecognizer || x == 1.79769313e308 && y == 1.79769313e308)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        v15 = qword_1ECD7D888;
        if (!qword_1ECD7D888)
        {
          v15 = __UILogCategoryGetNode("FeedbackGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&qword_1ECD7D888);
        }
        v16 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = self->_gestureRecognizer;
          v19 = v16;
          objc_msgSend(v17, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v18), v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "playing feedback without gesture recognizer (%@) or at null point", buf, 0xCu);

        }
      }
    }
    else
    {
      v61 = 0;
      *(_QWORD *)buf = 0;
      if (-[_UIFeedbackGeneratorGestureRecognizer hasDeviceInputForLocation:type:senderID:]((uint64_t)gestureRecognizer, buf, &v61, x, y))
      {
        -[UIFeedbackGenerator _configuration](self, "_configuration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_alternateFeedback:forDevice:senderID:", v13, *(_QWORD *)buf, v61);
        v33 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v33;
      }
    }
    -[UIFeedbackGenerator _configuration](self, "_configuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_updateFeedbackForOutputMode:", v13);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    +[_UIFeedbackEngine engineForFeedback:](_UIFeedbackEngine, "engineForFeedback:", v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      objc_msgSend(v35, "currentTime");
      v38 = v37;
      -[UIFeedbackGenerator _outputMode](self, "_outputMode");
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      currentDelay = self->_currentDelay;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v63 = currentDelay;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke;
      v50[3] = &unk_1E16C4FC8;
      v54 = buf;
      v55 = a5;
      v60 = a6;
      v51 = v36;
      v56 = a4;
      v57 = v38;
      v52 = v28;
      v53 = self;
      v58 = x;
      v59 = y;
      -[UIFeedbackGenerator __activateWithStyle:forFeedback:completionBlock:](self, "__activateWithStyle:forFeedback:completionBlock:", 2, v52, v50);
      -[UIFeedbackGenerator _stopPreparationForStyle:](self, "_stopPreparationForStyle:", 2);
      -[UIFeedbackGenerator _stopPreparationForStyle:](self, "_stopPreparationForStyle:", 1);

      _Block_object_dispose(buf, 8);
    }
    else if (!_UIFeedbackLoggingDisabled)
    {
      v40 = qword_1ECD7D890;
      if (!qword_1ECD7D890)
      {
        v40 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v40, (unint64_t *)&qword_1ECD7D890);
      }
      v41 = *(NSObject **)(v40 + 8);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)MEMORY[0x1E0CB3940];
        v43 = v28;
        v44 = v41;
        objc_msgSend(v42, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v43), v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = (void *)MEMORY[0x1E0CB3940];
        v47 = self;
        v48 = v45;
        objc_msgSend(v46, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v47), v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v49;
        _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_DEFAULT, "no engine to play feedback %@ for generator %@, dropping it", buf, 0x16u);

      }
    }

  }
  else
  {
    if (_UIFeedbackLoggingDisabled)
      goto LABEL_16;
    v21 = qword_1ECD7D880;
    if (!qword_1ECD7D880)
    {
      v21 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&qword_1ECD7D880);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:
      v28 = v13;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = self;
      v25 = v22;
      objc_msgSend(v23, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v24), v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = v13;
      v29 = v26;
      objc_msgSend(v27, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v28), v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v30;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&v63 = -[UIFeedbackGenerator _isEnabled](v24, "_isEnabled");
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_DEFAULT, "generator %@ cannot play feedback %@ (enabled=%ld)", buf, 0x20u);

    }
  }

}

- (void)dealloc
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  UIFeedbackGenerator *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[UIFeedbackGenerator _stopAutoDeactivateTimer](self, "_stopAutoDeactivateTimer");
  -[UIFeedbackGenerator _stopPreparationForAllStyles](self, "_stopPreparationForAllStyles");
  if (self->_activationCount >= 1)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v3 = dealloc___s_category_7;
      if (!dealloc___s_category_7)
      {
        v3 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&dealloc___s_category_7);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = self;
        v7 = v4;
        objc_msgSend(v5, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v6), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        v11 = v8;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%@ is being deallocated while still being active, forcing deactivation", buf, 0xCu);

      }
    }
    -[UIFeedbackGenerator _autoDeactivate](self, "_autoDeactivate");
  }
  v9.receiver = self;
  v9.super_class = (Class)UIFeedbackGenerator;
  -[UIFeedbackGenerator dealloc](&v9, sel_dealloc);
}

- (void)_stopAutoDeactivateTimer
{
  NSObject *autoDeactivateTimer;
  OS_dispatch_source *v4;

  autoDeactivateTimer = self->_autoDeactivateTimer;
  if (autoDeactivateTimer)
  {
    dispatch_source_cancel(autoDeactivateTimer);
    v4 = self->_autoDeactivateTimer;
    self->_autoDeactivateTimer = 0;

  }
}

- (void)_stopPreparationForAllStyles
{
  uint64_t i;

  for (i = 0; i != 3; ++i)
    -[UIFeedbackGenerator _stopPreparationForStyle:](self, "_stopPreparationForStyle:", i);
}

- (void)_stopPreparationForStyle:(int64_t)a3
{
  NSObject *source;

  -[UIFeedbackGenerator _preparationTimerForStyle:](self, "_preparationTimerForStyle:");
  source = objc_claimAutoreleasedReturnValue();
  if (source)
  {
    -[UIFeedbackGenerator _deactivateWithStyle:](self, "_deactivateWithStyle:", a3);
    dispatch_source_cancel(source);
    dispatch_activate(source);
    -[UIFeedbackGenerator _setPreparationTimer:forStyle:](self, "_setPreparationTimer:forStyle:", 0, a3);
  }

}

- (id)_preparationTimerForStyle:(int64_t)a3
{
  void *preparationTimers;
  void *v4;

  preparationTimers = self->_preparationTimers;
  if (preparationTimers)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(preparationTimers, "objectForKeyedSubscript:", v4);
    preparationTimers = (void *)objc_claimAutoreleasedReturnValue();

  }
  return preparationTimers;
}

- (int64_t)_outputMode
{
  void *v2;
  int64_t v3;

  -[UIFeedbackGenerator _configuration](self, "_configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outputMode");

  return v3;
}

void __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke(uint64_t a1, int a2)
{
  double v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a2)
    goto LABEL_21;
  objc_msgSend(*(id *)(a1 + 32), "currentTime");
  v4 = *(double **)(a1 + 64);
  if (v4)
  {
    v5 = v3 - *v4;
    if (v5 < 0.0)
      goto LABEL_21;
    v6 = *(double *)(a1 + 72);
    if (v5 <= v6)
    {
      if (!*(_BYTE *)(a1 + 104))
        goto LABEL_21;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *v4
                                                                  + v6
                                                                  - v3
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24);
      *v4 = *(double *)(a1 + 72) + *v4;
    }
    else
    {
      *v4 = v3;
    }
  }
  else
  {
    v7 = *(double *)(a1 + 72);
    if (v7 > 0.0)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - (v3
                                                               - *(double *)(a1 + 80));
  v8 = *(id *)(a1 + 40);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 0.0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      objc_msgSend(v9, "_delay");
      objc_msgSend(v9, "_setDelay:", v11 + *(double *)(v10 + 24));
    }
    else
    {
      +[_UIFeedbackPattern feedbackPattern](_UIFeedbackPattern, "feedbackPattern");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_category");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setCategory:", v12);

      objc_msgSend(v9, "addFeedback:atTime:", *(_QWORD *)(a1 + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    }

    v8 = v9;
  }
  objc_msgSend(*(id *)(a1 + 48), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setView:", v13);

  objc_msgSend(v8, "_setLocation:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (!_UIFeedbackLoggingDisabled)
  {
    v14 = _UIInternalPreference_EnableFeedbackExceptions_block_invoke_3___s_category;
    if (!_UIInternalPreference_EnableFeedbackExceptions_block_invoke_3___s_category)
    {
      v14 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&_UIInternalPreference_EnableFeedbackExceptions_block_invoke_3___s_category);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = *(id *)(a1 + 48);
      v18 = v15;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v17), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = v8;
      v22 = v19;
      objc_msgSend(v20, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v21), v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412546;
      v33 = v19;
      v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "generator %@ playing feedback %@", buf, 0x16u);

    }
  }
  objc_msgSend(v8, "play");
  objc_msgSend(*(id *)(a1 + 48), "_stats_playedFeedback");

LABEL_21:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke_57;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v24 = *(void **)(*(_QWORD *)(a1 + 48) + 72);
  if (v24)
  {
    v25 = (void *)objc_msgSend(v24, "copy");
    dispatch_block_cancel(*(dispatch_block_t *)(*(_QWORD *)(a1 + 48) + 72));
    v26 = _Block_copy(v25);
    v27 = *(_QWORD *)(a1 + 48);
    v28 = *(void **)(v27 + 72);
    *(_QWORD *)(v27 + 72) = v26;

    v29 = *(void **)(*(_QWORD *)(a1 + 48) + 72);
    v30 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v29);

  }
}

- (UIFeedbackGenerator)init
{
  void *v3;
  UIFeedbackGenerator *v4;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIFeedbackGenerator initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (void)prepare
{
  void *v3;

  if (!-[UIFeedbackGenerator _isAutoDeactivated](self, "_isAutoDeactivated"))
  {
    -[UIFeedbackGenerator _stats_prepared](self, "_stats_prepared");
    if (self->_styleActivationCount[2] >= 1)
    {
      -[UIFeedbackGenerator _preparationTimerForStyle:](self, "_preparationTimerForStyle:", 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        -[UIFeedbackGenerator _prepareWithStyle:](self, "_prepareWithStyle:", 2);
    }
    -[UIFeedbackGenerator _prepareWithStyle:](self, "_prepareWithStyle:", 1);
  }
}

- (void)__deactivateWithStyle:(int64_t)a3
{
  BOOL v6;
  int64_t activationCount;
  int64_t *autoDeactivationCount;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  UIFeedbackGenerator *v15;
  void *v16;
  int64_t *styleActivationCount;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  int64_t v21;
  int64_t v22;
  void *v23;
  UIFeedbackGenerator *v24;
  void *v25;
  int64_t v26;
  NSSet *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  int64_t v34;
  int64_t v35;
  void *v36;
  NSObject *log;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int64_t v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = -[UIFeedbackGenerator _isEnabled](self, "_isEnabled");
  activationCount = self->_activationCount;
  if (v6)
  {
    if (!activationCount)
    {
      autoDeactivationCount = self->_autoDeactivationCount;
      v9 = self->_autoDeactivationCount[a3];
      if (v9 >= 1)
      {
        if (!_UIFeedbackLoggingDisabled)
        {
          v10 = qword_1ECD7D860;
          if (!qword_1ECD7D860)
          {
            v10 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v10, (unint64_t *)&qword_1ECD7D860);
          }
          v11 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v11;
            stringForActivationStyle(a3);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0CB3940];
            v15 = self;
            objc_msgSend(v14, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v15), v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            *(_DWORD *)buf = 138412546;
            v44 = v13;
            v45 = 2112;
            v46 = v16;
            _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "generator was auto-deactivated for style %@ but finally got a deactivate, swallowing it: %@", buf, 0x16u);

          }
          v9 = autoDeactivationCount[a3];
        }
        autoDeactivationCount[a3] = v9 - 1;
        return;
      }
    }
  }
  else if (!activationCount)
  {
    return;
  }
  -[UIFeedbackGenerator setActivationCount:](self, "setActivationCount:", -[UIFeedbackGenerator activationCount](self, "activationCount") - 1);
  styleActivationCount = self->_styleActivationCount;
  --self->_styleActivationCount[a3];
  if (!_UIFeedbackLoggingDisabled)
  {
    v18 = qword_1ECD7D868;
    if (!qword_1ECD7D868)
    {
      v18 = __UILogCategoryGetNode("FeedbackActivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&qword_1ECD7D868);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      log = v19;
      stringForActivationStyle(a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_activationCount;
      v22 = styleActivationCount[a3];
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = self;
      objc_msgSend(v23, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v24), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138413570;
      v44 = v20;
      v45 = 2048;
      v46 = (void *)(v21 + 1);
      v47 = 2048;
      v48 = v21;
      v49 = 2048;
      v50 = v22 + 1;
      v51 = 2048;
      v52 = v22;
      v53 = 2112;
      v54 = v25;
      _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_DEFAULT, "deactivate generator with style: %@; activationCount: %ld -> %ld; styleActivationCount: %ld -> %ld; %@",
        buf,
        0x3Eu);

    }
  }
  if (self->_activationCount < 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Feedback generator was deactivated internally more times than it was activated: %@"), self);
    return;
  }
  v26 = styleActivationCount[a3];
  if (v26 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self->_activationCount;
    v35 = styleActivationCount[a3];
    stringForActivationStyle(a3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFeedbackGenerator.m"), 642, CFSTR("_styleActivationCount shouldn't be negative. activationCount=%ld; styleActivationCount=%ld; style=%@"),
      v34,
      v35,
      v36);

    if (!styleActivationCount[a3])
      goto LABEL_20;
  }
  else if (!v26)
  {
LABEL_20:
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v27 = self->_engines;
    v28 = -[NSSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v39 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (a3 == 2)
          {
            objc_msgSend(v32, "_deactivate");
          }
          else if (a3 == 1)
          {
            objc_msgSend(v32, "_cooldown");
          }
        }
        v29 = -[NSSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v29);
    }

  }
  if (!self->_activationCount)
    -[UIFeedbackGenerator _deactivated](self, "_deactivated");
}

- (void)__activateWithStyle:(int64_t)a3 forFeedback:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  int64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int64_t activationCount;
  void *v16;
  UIFeedbackGenerator *v17;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  NSSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[5];
  id v34;
  _BYTE *v35;
  _QWORD *v36;
  uint64_t v37;
  SEL v38;
  _QWORD v39[4];
  uint8_t v40[128];
  _BYTE buf[24];
  int64_t v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  -[UIFeedbackGenerator _setupForFeedback:](self, "_setupForFeedback:", v9);
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled"))
  {
    -[UIFeedbackGenerator setActivationCount:](self, "setActivationCount:", -[UIFeedbackGenerator activationCount](self, "activationCount") + 1);
    v11 = self->_styleActivationCount[a3];
    self->_styleActivationCount[a3] = v11 + 1;
    if (!_UIFeedbackLoggingDisabled)
    {
      v12 = __activateWithStyle_forFeedback_completionBlock____s_category;
      if (!__activateWithStyle_forFeedback_completionBlock____s_category)
      {
        v12 = __UILogCategoryGetNode("FeedbackActivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&__activateWithStyle_forFeedback_completionBlock____s_category);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        stringForActivationStyle(a3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        activationCount = self->_activationCount;
        v26 = self->_styleActivationCount[a3];
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = self;
        objc_msgSend(v16, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v17), v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = activationCount - 1;
        *(_WORD *)&buf[22] = 2048;
        v42 = activationCount;
        v43 = 2048;
        v44 = v26 - 1;
        v45 = 2048;
        v46 = v26;
        v47 = 2112;
        v48 = v27;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "activate generator with style: %@; activationCount: %ld -> %ld; styleActivationCount: %ld -> %ld; %@",
          buf,
          0x3Eu);

      }
    }
    -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
    v18 = -[NSSet count](self->_engines, "count");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__UIFeedbackGenerator___activateWithStyle_forFeedback_completionBlock___block_invoke;
    aBlock[3] = &unk_1E16C4FA0;
    v36 = v39;
    v37 = v18;
    v38 = a2;
    v35 = buf;
    aBlock[4] = self;
    v34 = v10;
    v19 = _Block_copy(aBlock);
    v20 = (void (**)(_QWORD, _QWORD))v19;
    if (v18 < 1)
    {
      (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v21 = self->_engines;
      v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v30 != v23)
              objc_enumerationMutation(v21);
            if (a3)
            {
              v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              if (a3 == 1)
              {
                objc_msgSend(v25, "_prewarm:andPerformWhenPrewarmed:", v11 == 0, v20);
              }
              else if (a3 == 2)
              {
                objc_msgSend(v25, "_activate:andPerformWhenRunning:", v11 == 0, v20);
              }
            }
            else
            {
              v20[2](v20, 1);
            }
          }
          v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
        }
        while (v22);
      }

    }
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)setActivationCount:(int64_t)a3
{
  self->_activationCount = a3;
}

- (int64_t)activationCount
{
  return self->_activationCount;
}

- (void)_clientDidUpdateGeneratorWithSelector:(SEL)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  UIFeedbackGenerator *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  int64_t *autoDeactivationCount;
  uint64_t v12;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  UIFeedbackGenerator *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[UIFeedbackGenerator _isEnabled](self, "_isEnabled", a3))
  {
    if (-[UIFeedbackGenerator _isAutoDeactivated](self, "_isAutoDeactivated"))
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        v4 = qword_1ECD7D870;
        if (!qword_1ECD7D870)
        {
          v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&qword_1ECD7D870);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = (void *)MEMORY[0x1E0CB3940];
          v7 = self;
          v8 = v5;
          objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138412290;
          v19 = v9;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "auto-deactivated feedback generator was updated again, re-activate it: %@", buf, 0xCu);

        }
      }
      v10 = 0;
      autoDeactivationCount = self->_autoDeactivationCount;
      while (1)
      {
        v12 = autoDeactivationCount[v10];
        autoDeactivationCount[v10] = 0;
        if (v12 >= 1 && _UIFeedbackLoggingDisabled == 0)
          break;
        if (v12)
          goto LABEL_19;
LABEL_20:
        if (++v10 == 3)
          goto LABEL_21;
      }
      v14 = qword_1ECD7D878;
      if (!qword_1ECD7D878)
      {
        v14 = __UILogCategoryGetNode("FeedbackActivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&qword_1ECD7D878);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        stringForActivationStyle(v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v17;
        v20 = 2048;
        v21 = v12;
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "performing re-activation for style: %@; autoDeactivationCount: %ld; %@",
          buf,
          0x20u);

      }
      do
      {
LABEL_19:
        --v12;
        -[UIFeedbackGenerator __activateWithStyle:forFeedback:completionBlock:](self, "__activateWithStyle:forFeedback:completionBlock:", v10, 0, 0);
      }
      while (v12);
      goto LABEL_20;
    }
LABEL_21:
    -[UIFeedbackGenerator _resetAutoDeactivationTimeout](self, "_resetAutoDeactivationTimeout");
  }
}

- (BOOL)_isAutoDeactivated
{
  return self->_autoDeactivationCount[0] > 0
      || self->_autoDeactivationCount[1] > 0
      || self->_autoDeactivationCount[2] > 0;
}

- (void)_setupForFeedback:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self->_configuration, "_setupIfNecessary");
  if (-[_UIFeedbackGeneratorConfiguration isEnabled](self->_configuration, "isEnabled"))
    -[UIFeedbackGenerator _setupEnginesIfNeededForFeedback:](self, "_setupEnginesIfNeededForFeedback:", v4);

}

- (void)_setupEnginesIfNeededForFeedback:(id)a3
{
  id v4;
  NSSet *usedFeedbacks;
  NSSet *v6;
  uint64_t v7;
  BOOL v8;
  NSSet *v9;
  NSSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  NSSet *v19;
  NSSet *v20;
  char v21;
  void *v22;
  NSSet *v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSSet *engines;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSSet *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSSet *v42;
  __int16 v43;
  NSSet *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  usedFeedbacks = self->_usedFeedbacks;
  if (v4)
  {
    if (usedFeedbacks)
    {
      -[NSSet setByAddingObject:](usedFeedbacks, "setByAddingObject:", v4);
      v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSSet count](v6, "count");
      v8 = v7 != -[NSSet count](self->_usedFeedbacks, "count");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
      v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    self->_usesCustomActivation = v8;
  }
  else if (usedFeedbacks)
  {
    v6 = usedFeedbacks;
  }
  else
  {
    -[UIFeedbackGenerator _configuration](self, "_configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "usedFeedbacks");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();

  }
  if (v6 == self->_usedFeedbacks)
    goto LABEL_39;
  v34 = v4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v6;
  v11 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        +[_UIFeedbackEngine engineForFeedback:](_UIFeedbackEngine, "engineForFeedback:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[NSSet addObject:](v9, "addObject:", v15);

      }
      v12 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v12);
  }

  v16 = self->_styleActivationCount[1];
  v17 = self->_styleActivationCount[2];
  if (v16 > 0 || v17 >= 1)
  {
    v18 = self->_engines;
    v19 = v9;
    v20 = v19;
    if (v18 == v19)
    {
      v23 = v19;
    }
    else
    {
      if (v19 && v18)
      {
        v21 = -[NSSet isEqual:](v18, "isEqual:", v19);

        if ((v21 & 1) != 0)
          goto LABEL_30;
      }
      else
      {

      }
      v23 = (NSSet *)-[NSSet mutableCopy](self->_engines, "mutableCopy");
      -[NSSet minusSet:](v23, "minusSet:", v20);
      v20 = (NSSet *)-[NSSet mutableCopy](v20, "mutableCopy");
      -[NSSet minusSet:](v20, "minusSet:", self->_engines);
      -[UIFeedbackGenerator _updateActivationStateForRemovedEngines:addedEngines:prewarmCount:turnOnCount:](self, "_updateActivationStateForRemovedEngines:addedEngines:prewarmCount:turnOnCount:", v23, v20, v16, v17);
    }

  }
LABEL_30:
  v4 = v34;
  if (!_UIFeedbackLoggingDisabled)
  {
    v24 = qword_1ECD7D848;
    if (!qword_1ECD7D848)
    {
      v24 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v24, (unint64_t *)&qword_1ECD7D848);
    }
    if ((*(_BYTE *)v24 & 1) != 0)
    {
      v26 = *(NSObject **)(v24 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        _UIDescriptionBuilderLightDescription(self);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        engines = self->_engines;
        *(_DWORD *)buf = 138412802;
        v40 = v28;
        v41 = 2112;
        v42 = engines;
        v43 = 2112;
        v44 = v9;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "updating engines used for %@: %@ -> %@", buf, 0x20u);

      }
    }
  }
  objc_storeStrong((id *)&self->_engines, v9);
  if (!_UIFeedbackLoggingDisabled)
  {
    v25 = qword_1ECD7D850;
    if (!qword_1ECD7D850)
    {
      v25 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v25, (unint64_t *)&qword_1ECD7D850);
    }
    if ((*(_BYTE *)v25 & 1) != 0)
    {
      v30 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = v30;
        _UIDescriptionBuilderLightDescription(self);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = self->_usedFeedbacks;
        *(_DWORD *)buf = 138412802;
        v40 = v32;
        v41 = 2112;
        v42 = v33;
        v43 = 2112;
        v44 = v10;
        _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "updating feedbacks used for %@: %@ -> %@", buf, 0x20u);

      }
    }
  }
  objc_storeStrong((id *)&self->_usedFeedbacks, v6);

LABEL_39:
}

- (void)_setupAutoDeactivateTimer
{
  double v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *autoDeactivateTimer;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[UIFeedbackGenerator _autoDeactivationTimeout](self, "_autoDeactivationTimeout");
  if (v4 > 0.0)
  {
    if (self->_autoDeactivateTimer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFeedbackGenerator.m"), 696, CFSTR("trying to create an auto-deactivation timer when we already have one"));

    }
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    autoDeactivateTimer = self->_autoDeactivateTimer;
    self->_autoDeactivateTimer = v5;

    objc_initWeak(&location, self);
    v7 = self->_autoDeactivateTimer;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __48__UIFeedbackGenerator__setupAutoDeactivateTimer__block_invoke;
    v12 = &unk_1E16B3F40;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v7, &v9);
    -[UIFeedbackGenerator _resetAutoDeactivationTimeout](self, "_resetAutoDeactivationTimeout", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_resetAutoDeactivationTimeout
{
  NSObject *autoDeactivateTimer;
  double v4;
  dispatch_time_t v5;
  double v6;

  autoDeactivateTimer = self->_autoDeactivateTimer;
  if (autoDeactivateTimer)
  {
    -[UIFeedbackGenerator _autoDeactivationTimeout](self, "_autoDeactivationTimeout");
    v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    -[UIFeedbackGenerator _autoDeactivationTimeout](self, "_autoDeactivationTimeout");
    dispatch_source_set_timer(autoDeactivateTimer, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v6 / 100.0 * 1000000000.0));
    dispatch_activate((dispatch_object_t)self->_autoDeactivateTimer);
  }
}

- (double)_autoDeactivationTimeout
{
  return *(double *)&_UIFeedbackGeneratorAutoDeactivateTimeout;
}

- (BOOL)isActive
{
  return self->_externalActivationCount > 0;
}

- (void)_updatePreparationTimer:(id)a3 withTimeout:(double)a4
{
  int64_t v5;
  dispatch_time_t v6;
  NSObject *source;

  v5 = (uint64_t)(a4 * 1000000000.0);
  source = a3;
  v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(source, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 / 100.0 * 1000000000.0));

}

- (UIFeedbackGenerator)initWithConfiguration:(id)a3 coordinateSpace:(id)a4
{
  id v6;
  void *v7;
  UIFeedbackGenerator *v8;

  v6 = a3;
  _viewFromCoordinateSpace(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIFeedbackGenerator initWithConfiguration:view:](self, "initWithConfiguration:view:", v6, v7);

  return v8;
}

- (UIFeedbackGenerator)initWithView:(id)a3
{
  id v4;
  void *v5;
  UIFeedbackGenerator *v6;

  v4 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIFeedbackGenerator initWithConfiguration:view:](self, "initWithConfiguration:view:", v5, v4);

  return v6;
}

+ (void)_setAutoDeactivateTimeout:(double)a3
{
  _UIFeedbackGeneratorAutoDeactivateTimeout = *(_QWORD *)&a3;
}

+ (void)_resetAutoDeactivateTimeout
{
  _UIFeedbackGeneratorAutoDeactivateTimeout = 0x4014000000000000;
}

+ (void)_setPreparationTimeout:(double)a3 forStyle:(int64_t)a4
{
  *((double *)&_UIFeedbackGeneratorPreparationTimeouts + a4) = a3;
}

+ (void)_resetPreparationTimeouts
{
  qword_1EDD970E8 = 0x3FE0000000000000;
  _UIFeedbackGeneratorPreparationTimeouts = _UIFeedbackGeneratorPreparationDefaultTimeouts;
}

+ (void)_setRunningTests:(BOOL)a3
{
  _MergedGlobals_1026 = a3;
}

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)feedbackGeneratorForView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithView:", v4);

  return v5;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[UIFeedbackGenerator _ui_descriptionBuilder](self, "_ui_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_ui_descriptionBuilder
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  id v10;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)UIFeedbackGenerator;
  -[NSObject _ui_descriptionBuilder](&v11, sel__ui_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    NSStringFromSelector(sel_active);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    NSStringFromSelector(sel_configuration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendKeys:", v7);

    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v10 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", CFSTR("view"), WeakRetained, 1);

  }
  return v3;
}

void __41__UIFeedbackGenerator__prepareWithStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v3 = _UIInternalPreference_EnableFeedbackExceptions_block_invoke___s_category;
      if (!_UIInternalPreference_EnableFeedbackExceptions_block_invoke___s_category)
      {
        v3 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&_UIInternalPreference_EnableFeedbackExceptions_block_invoke___s_category);
      }
      if ((*(_BYTE *)v3 & 1) != 0)
      {
        v4 = *(NSObject **)(v3 + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v5 = *(_QWORD *)(a1 + 40);
          v6 = v4;
          stringForActivationStyle(v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412546;
          v9 = WeakRetained;
          v10 = 2112;
          v11 = v7;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "timed-out preparation of %@ with style %@", (uint8_t *)&v8, 0x16u);

        }
      }
    }
    objc_msgSend(WeakRetained, "_stopPreparationForStyle:", *(_QWORD *)(a1 + 40));
  }

}

void __41__UIFeedbackGenerator__prepareWithStyle___block_invoke_27(uint64_t a1, int a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_updatePreparationTimer:withTimeout:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
    dispatch_activate(*(dispatch_object_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v3, "_stopPreparationForStyle:", *(_QWORD *)(a1 + 56));
  }
}

- (void)activateWithCompletionBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[UIFeedbackGenerator _setupForFeedback:](self, "_setupForFeedback:", 0);
  -[UIFeedbackGenerator _activateWithStyle:completionBlock:](self, "_activateWithStyle:completionBlock:", -[_UIFeedbackGeneratorConfiguration activationStyle](self->_configuration, "activationStyle"), v4);

}

- (void)_updateActivationStateForRemovedEngines:(id)a3 addedEngines:(id)a4 prewarmCount:(int64_t)a5 turnOnCount:(int64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  UIFeedbackGenerator *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  int64_t v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!_UIFeedbackLoggingDisabled)
  {
    v12 = _updateActivationStateForRemovedEngines_addedEngines_prewarmCount_turnOnCount____s_category;
    if (!_updateActivationStateForRemovedEngines_addedEngines_prewarmCount_turnOnCount____s_category)
    {
      v12 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_updateActivationStateForRemovedEngines_addedEngines_prewarmCount_turnOnCount____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = self;
      v16 = v13;
      objc_msgSend(v14, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v15), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 134219010;
      v41 = a5;
      v42 = 2048;
      v43 = a6;
      v44 = 2112;
      v45 = v17;
      v46 = 2112;
      v47 = v10;
      v48 = 2112;
      v49 = v11;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "updating activation state (prewarm: %ld; activation: %ld) for %@ removedEngines=%@; addedEngines=%@",
        buf,
        0x34u);

    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (a5 >= 1)
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "_cooldown");
        if (a6 >= 1)
          objc_msgSend(v23, "_deactivate");
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v20);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = v11;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (a6 >= 1)
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "_activate:andPerformWhenRunning:", 1, 0);
        if (a5 >= 1)
          objc_msgSend(v29, "_prewarm:andPerformWhenPrewarmed:", 1, 0);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v26);
  }

}

- (void)deactivate
{
  -[UIFeedbackGenerator _deactivateWithStyle:](self, "_deactivateWithStyle:", -[_UIFeedbackGeneratorConfiguration activationStyle](self->_configuration, "activationStyle"));
}

- (void)_deactivateWithStyle:(int64_t)a3
{
  BOOL v5;
  int64_t externalActivationCount;
  int v7;
  int v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  UIFeedbackGenerator *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[UIFeedbackGenerator _isEnabled](self, "_isEnabled");
  externalActivationCount = self->_externalActivationCount;
  if (v5 || externalActivationCount)
  {
    self->_externalActivationCount = externalActivationCount - 1;
    if (externalActivationCount <= 0)
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v7 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1)
        goto LABEL_7;
      v8 = _UIInternalPreference_EnableFeedbackExceptions;
      if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableFeedbackExceptions)
        goto LABEL_7;
      while (v7 >= v8)
      {
        _UIInternalPreferenceSync(v7, &_UIInternalPreference_EnableFeedbackExceptions, (uint64_t)CFSTR("EnableFeedbackExceptions"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v8 = _UIInternalPreference_EnableFeedbackExceptions;
        if (v7 == _UIInternalPreference_EnableFeedbackExceptions)
          goto LABEL_7;
      }
      if (byte_1EDDA7F7C | _MergedGlobals_1026)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Feedback generator was deactivated by its client more times than it was activated: %@"), self);
      }
      else if (!_UIFeedbackLoggingDisabled)
      {
        v9 = qword_1ECD7D858;
        if (!qword_1ECD7D858)
        {
          v9 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&qword_1ECD7D858);
        }
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v12 = self;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Feedback generator was deactivated by its client more times than it was activated: %@", buf, 0xCu);
        }
      }
    }
    -[UIFeedbackGenerator __deactivateWithStyle:](self, "__deactivateWithStyle:", a3);
  }
}

- (void)_forceDeactivationForStyle:(int64_t)a3
{
  int64_t v5;
  void *v7;
  void *v8;

  v5 = self->_styleActivationCount[a3];
  if (v5 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    stringForActivationStyle(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFeedbackGenerator.m"), 682, CFSTR("force deactivating %@ with style %@ which is not active (activationCount = %ld)"), self, v8, v5);

  }
  else if (!v5)
  {
    return;
  }
  do
  {
    --v5;
    -[UIFeedbackGenerator __deactivateWithStyle:](self, "__deactivateWithStyle:", a3);
  }
  while (v5);
}

void __48__UIFeedbackGenerator__setupAutoDeactivateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "_isAutoDeactivated") & 1) == 0)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v3 = _UIInternalPreference_EnableFeedbackExceptions_block_invoke_2___s_category;
      if (!_UIInternalPreference_EnableFeedbackExceptions_block_invoke_2___s_category)
      {
        v3 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&_UIInternalPreference_EnableFeedbackExceptions_block_invoke_2___s_category);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        objc_msgSend(v2, "_autoDeactivationTimeout");
        v7 = v6;
        v8 = objc_msgSend(v2, "activationCount");
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = v2;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v10), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 134218498;
        v13 = v7;
        v14 = 2048;
        v15 = v8;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "nothing happened to generator for %g sec, auto-deactivating it with activationCount: %ld; %@",
          buf,
          0x20u);

      }
    }
    objc_msgSend(v2, "_stats_activationTimedOut");
    objc_msgSend(v2, "_autoDeactivate");
  }

}

- (void)_autoDeactivate
{
  unint64_t v3;
  Class *v4;
  objc_class *v5;
  int64_t activationCount;
  _UIFeedbackGeneratorConfiguration *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  objc_class *v21;
  __int16 v22;
  UIFeedbackGenerator *v23;
  uint64_t v24;

  v3 = 0;
  v24 = *MEMORY[0x1E0C80C00];
  do
  {
    v4 = &self->super.isa + v3;
    v5 = v4[1];
    if (v5)
    {
      if (v4[4])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        stringForActivationStyle(v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFeedbackGenerator.m"), 739, CFSTR("Generator is already auto-deactivated for style %@: %@"), v14, self);

      }
      v4[4] = v5;
      activationCount = self->_activationCount;
      v7 = self->_configuration;
      -[NSSet description](self->_engines, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_UIFeedbackLoggingDisabled)
      {
        v9 = _autoDeactivate___s_category;
        if (!_autoDeactivate___s_category)
        {
          v9 = __UILogCategoryGetNode("FeedbackActivation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&_autoDeactivate___s_category);
        }
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          stringForActivationStyle(v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v17 = v12;
          v18 = 2048;
          v19 = activationCount;
          v20 = 2048;
          v21 = v5;
          v22 = 2112;
          v23 = self;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "performing auto-deactivate for style: %@; activationCount: %ld; styleActivationCount: %ld; %@",
            buf,
            0x2Au);

        }
      }
      -[UIFeedbackGenerator _forceDeactivationForStyle:](self, "_forceDeactivationForStyle:", v3);

    }
    ++v3;
  }
  while (v3 != 3);
}

- (void)performFeedbackWithDelay:(double)a3 insideBlock:(id)a4
{
  double currentDelay;

  currentDelay = self->_currentDelay;
  self->_currentDelay = currentDelay + a3;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  self->_currentDelay = currentDelay;
}

- (void)_playFeedback:(id)a3
{
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", a3, 1.79769313e308, 1.79769313e308);
}

- (void)_playFeedback:(id)a3 atLocation:(CGPoint)a4
{
  -[UIFeedbackGenerator _playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:](self, "_playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:", a3, 0, 0, 0.0, a4.x, a4.y);
}

uint64_t __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke_57(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__deactivateWithStyle:", 2);
}

- (void)_stopFeedback:(id)a3
{
  if (a3)
    objc_msgSend(a3, "stop");
}

- (NSString)_stats_key
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)externalActivationCount
{
  return self->_externalActivationCount;
}

- (void)setExternalActivationCount:(int64_t)a3
{
  self->_externalActivationCount = a3;
}

- (BOOL)usesCustomActivation
{
  return self->_usesCustomActivation;
}

- (void)setUsesCustomActivation:(BOOL)a3
{
  self->_usesCustomActivation = a3;
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (_UIFeedbackGeneratorGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (NSSet)engines
{
  return self->_engines;
}

- (UIFeedbackGenerator)initWithCoordinateSpace:(id)a3
{
  void *v4;
  UIFeedbackGenerator *v5;

  _viewFromCoordinateSpace(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIFeedbackGenerator initWithView:](self, "initWithView:", v4);

  return v5;
}

- (UICoordinateSpace)coordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_view);
}

+ (id)behaviorWithConfiguration:(id)a3 coordinateSpace:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Use of _UIFeedbackBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based UIFeedbackGenerator methods.", buf, 2u);
    }

  }
  else
  {
    v8 = behaviorWithConfiguration_coordinateSpace____s_category;
    if (!behaviorWithConfiguration_coordinateSpace____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&behaviorWithConfiguration_coordinateSpace____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Use of _UIFeedbackBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based UIFeedbackGenerator methods.", v13, 2u);
    }
  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:coordinateSpace:", v7, v6);

  return v10;
}

- (void)_setMuted:(BOOL)a3
{
  -[UIFeedbackGenerator _setOutputMode:](self, "_setOutputMode:", !a3);
}

- (BOOL)_isMuted
{
  return -[UIFeedbackGenerator _outputMode](self, "_outputMode") == 0;
}

- (id)_activationTimeOutCountStatistics
{
  void *v2;
  void *v3;

  -[UIFeedbackGenerator _statsSuffix](self, "_statsSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics feedbackGeneratorActivationTimeOutCountWithSuffix:](_UIStatistics, "feedbackGeneratorActivationTimeOutCountWithSuffix:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_stats_activationTimedOut
{
  id v2;

  -[UIFeedbackGenerator _activationTimeOutCountStatistics](self, "_activationTimeOutCountStatistics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementValueBy:", 1);

}

@end

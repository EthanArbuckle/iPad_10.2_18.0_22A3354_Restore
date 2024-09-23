@implementation PUParallaxLayerStackViewModelUpdater

- (PUParallaxLayerStackViewModelUpdater)initWithSegmentationItem:(id)a3
{
  id v5;
  PUParallaxLayerStackViewModelUpdater *v6;
  PUParallaxLayerStackViewModelUpdater *v7;
  dispatch_group_t v8;
  OS_dispatch_group *transactionGroup;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *transactionResponseQueue;
  uint64_t v13;
  PIParallaxLayerStackRequest *mainRenderRequest;
  void *v15;
  id v16;
  uint64_t v17;
  PIParallaxLayerStackRequest *backfillRenderRequest;
  id v19;
  uint64_t v20;
  PIParallaxLayerStackRequest *settlingEffectRenderRequest;
  uint64_t v22;
  PIParallaxClockLayoutRequest *clockOverlapRequest;
  uint64_t v24;
  PIParallaxClockMaterialRequest *clockMaterialRequest;
  uint64_t v26;
  NUCoalescer *styleChangeCoalescer;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PUParallaxLayerStackViewModelUpdater;
  v6 = -[PUParallaxLayerStackViewModelUpdater init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v8 = dispatch_group_create();
    transactionGroup = v7->_transactionGroup;
    v7->_transactionGroup = (OS_dispatch_group *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("ViewModelUpdater transaction queue", v10);
    transactionResponseQueue = v7->_transactionResponseQueue;
    v7->_transactionResponseQueue = (OS_dispatch_queue *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71228]), "initWithSegmentationItem:", v5);
    mainRenderRequest = v7->_mainRenderRequest;
    v7->_mainRenderRequest = (PIParallaxLayerStackRequest *)v13;

    v15 = (void *)MEMORY[0x1E0C80D38];
    -[PIParallaxLayerStackRequest setResponseQueue:](v7->_mainRenderRequest, "setResponseQueue:", MEMORY[0x1E0C80D38]);
    -[PIParallaxLayerStackRequest setShouldCoalesceUpdates:](v7->_mainRenderRequest, "setShouldCoalesceUpdates:", 1);
    -[PIParallaxLayerStackRequest setHeadroomBlurEnabled:](v7->_mainRenderRequest, "setHeadroomBlurEnabled:", 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[PIParallaxLayerStackRequest setCache:](v7->_mainRenderRequest, "setCache:", v16);

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71228]), "initWithSegmentationItem:", v5);
    backfillRenderRequest = v7->_backfillRenderRequest;
    v7->_backfillRenderRequest = (PIParallaxLayerStackRequest *)v17;

    -[PIParallaxLayerStackRequest setResponseQueue:](v7->_backfillRenderRequest, "setResponseQueue:", v15);
    -[PIParallaxLayerStackRequest setShouldCoalesceUpdates:](v7->_backfillRenderRequest, "setShouldCoalesceUpdates:", 1);
    -[PIParallaxLayerStackRequest setHeadroomBlurEnabled:](v7->_backfillRenderRequest, "setHeadroomBlurEnabled:", 0);
    v19 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[PIParallaxLayerStackRequest setCache:](v7->_backfillRenderRequest, "setCache:", v19);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71228]), "initWithSegmentationItem:", v5);
    settlingEffectRenderRequest = v7->_settlingEffectRenderRequest;
    v7->_settlingEffectRenderRequest = (PIParallaxLayerStackRequest *)v20;

    -[PIParallaxLayerStackRequest setResponseQueue:](v7->_settlingEffectRenderRequest, "setResponseQueue:", v15);
    -[PIParallaxLayerStackRequest setShouldCoalesceUpdates:](v7->_settlingEffectRenderRequest, "setShouldCoalesceUpdates:", 1);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71200]), "initWithSegmentationItem:", v5);
    clockOverlapRequest = v7->_clockOverlapRequest;
    v7->_clockOverlapRequest = (PIParallaxClockLayoutRequest *)v22;

    -[PIParallaxClockLayoutRequest setResponseQueue:](v7->_clockOverlapRequest, "setResponseQueue:", v15);
    -[PIParallaxClockLayoutRequest setShouldCoalesceUpdates:](v7->_clockOverlapRequest, "setShouldCoalesceUpdates:", 1);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71208]), "initWithLayerStack:", 0);
    clockMaterialRequest = v7->_clockMaterialRequest;
    v7->_clockMaterialRequest = (PIParallaxClockMaterialRequest *)v24;

    -[PIParallaxClockMaterialRequest setResponseQueue:](v7->_clockMaterialRequest, "setResponseQueue:", v15);
    -[PIParallaxClockMaterialRequest setShouldCoalesceUpdates:](v7->_clockMaterialRequest, "setShouldCoalesceUpdates:", 1);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52060]), "initWithDelay:", 0.25);
    styleChangeCoalescer = v7->_styleChangeCoalescer;
    v7->_styleChangeCoalescer = (NUCoalescer *)v26;

  }
  return v7;
}

- (PUParallaxLayerStackViewModelUpdater)init
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D52380];
    v5 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123_103445);
LABEL_7:
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123_103445);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123_103445);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  PUParallaxLayerStackViewModelUpdater *v4;
  void *v5;
  PUParallaxLayerStackViewModelUpdater *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = [PUParallaxLayerStackViewModelUpdater alloc];
  -[PUParallaxLayerStackViewModelUpdater item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUParallaxLayerStackViewModelUpdater initWithSegmentationItem:](v4, "initWithSegmentationItem:", v5);

  -[PUParallaxLayerStackViewModelUpdater mainRenderRequest](self, "mainRenderRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModelUpdater mainRenderRequest](v6, "mainRenderRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCache:", v8);

  -[PUParallaxLayerStackViewModelUpdater backfillRenderRequest](self, "backfillRenderRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModelUpdater backfillRenderRequest](v6, "backfillRenderRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCache:", v11);

  return v6;
}

- (void)_updatePriorityForRequest:(id)a3 viewModel:(id)a4 highPriority:(BOOL)a5 importanceOrder:(double)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  objc_class *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  PIParallaxClockMaterialRequest *v23;

  v7 = a5;
  v23 = (PIParallaxClockMaterialRequest *)a3;
  v10 = a4;
  v11 = objc_alloc(MEMORY[0x1E0D52230]);
  if (v7)
  {
    v12 = (void *)objc_msgSend(v11, "initWithLevel:order:", 1, a6);
    -[PIParallaxClockMaterialRequest setPriority:](v23, "setPriority:", v12);

    v13 = a6 * 0.1;
  }
  else
  {
    v14 = (void *)objc_msgSend(v11, "initWithLevel:order:", 2, a6);
    -[PIParallaxClockMaterialRequest setPriority:](v23, "setPriority:", v14);

    v13 = a6 * 0.25 + 0.25;
  }
  -[PIParallaxClockMaterialRequest renderContext](v23, "renderContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMinimumRenderInterval:", v13);

  if (self->_mainRenderRequest == v23)
  {
    v17 = CFSTR("Main Layers");
  }
  else if (self->_backfillRenderRequest == v23)
  {
    v17 = CFSTR("Backfill Layers");
  }
  else if (self->_settlingEffectRenderRequest == v23)
  {
    v17 = CFSTR("Settling Effect Layer");
  }
  else if (self->_clockOverlapRequest == v23)
  {
    v17 = CFSTR("Clock Overlap");
  }
  else if (self->_clockMaterialRequest == v23)
  {
    v17 = CFSTR("Clock Luminance");
  }
  else
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "kind");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("Low Priority");
  if (v7)
    v21 = CFSTR("High Priority");
  -[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", CFSTR(" %@ %@"), v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIParallaxClockMaterialRequest setName:](v23, "setName:", v22);
}

- (void)renderMainLayers:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PIParallaxLayerStackRequest *mainRenderRequest;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  objc_msgSend(v10, "currentLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxLayerStackRequest setLayout:](self->_mainRenderRequest, "setLayout:", v12);

  objc_msgSend(v10, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxLayerStackRequest setStyle:](self->_mainRenderRequest, "setStyle:", v13);

  -[PIParallaxLayerStackRequest setLayerStackMode:](self->_mainRenderRequest, "setLayerStackMode:", objc_msgSend(v10, "orientation") == 2);
  -[PUParallaxLayerStackViewModelUpdater _updatePriorityForRequest:viewModel:highPriority:importanceOrder:](self, "_updatePriorityForRequest:viewModel:highPriority:importanceOrder:", self->_mainRenderRequest, v10, v8, a5);
  mainRenderRequest = self->_mainRenderRequest;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke;
  v20 = &unk_1E58AB170;
  v21 = v10;
  v22 = v11;
  v15 = v11;
  v16 = v10;
  -[PIParallaxLayerStackRequest submit:](mainRenderRequest, "submit:", &v17);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction", v17, v18, v19, v20);

}

- (void)renderBackfillLayers:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PIParallaxLayerStackRequest *backfillRenderRequest;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  objc_msgSend(v10, "currentLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxLayerStackRequest setLayout:](self->_backfillRenderRequest, "setLayout:", v12);

  objc_msgSend(v10, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxLayerStackRequest setStyle:](self->_backfillRenderRequest, "setStyle:", v13);

  -[PIParallaxLayerStackRequest setLayerStackMode:](self->_backfillRenderRequest, "setLayerStackMode:", 2);
  -[PUParallaxLayerStackViewModelUpdater _updatePriorityForRequest:viewModel:highPriority:importanceOrder:](self, "_updatePriorityForRequest:viewModel:highPriority:importanceOrder:", self->_backfillRenderRequest, v10, v8, a5);
  backfillRenderRequest = self->_backfillRenderRequest;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke;
  v20 = &unk_1E58AB170;
  v21 = v10;
  v22 = v11;
  v15 = v11;
  v16 = v10;
  -[PIParallaxLayerStackRequest submit:](backfillRenderRequest, "submit:", &v17);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction", v17, v18, v19, v20);

}

- (void)renderSettlingEffectLayerIfNeededForViewModel:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  PIParallaxLayerStackRequest *settlingEffectRenderRequest;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "canEnableSettlingEffect"))
  {
    objc_msgSend(v8, "currentLayerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settlingEffectLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(v8, "style");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "kind");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D75600]);

      if (v13)
      {
        -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
        objc_msgSend(v8, "currentLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIParallaxLayerStackRequest setLayout:](self->_settlingEffectRenderRequest, "setLayout:", v14);

        -[PIParallaxLayerStackRequest setLayerStackMode:](self->_settlingEffectRenderRequest, "setLayerStackMode:", 7);
        -[PUParallaxLayerStackViewModelUpdater _updatePriorityForRequest:viewModel:highPriority:importanceOrder:](self, "_updatePriorityForRequest:viewModel:highPriority:importanceOrder:", self->_settlingEffectRenderRequest, v8, v6, a5);
        settlingEffectRenderRequest = self->_settlingEffectRenderRequest;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke;
        v16[3] = &unk_1E58AB198;
        v17 = v8;
        -[PIParallaxLayerStackRequest submit:](settlingEffectRenderRequest, "submit:", v16);
        -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");

      }
    }
  }

}

- (void)recalculateClockOverlap:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5 allViewModels:(id)a6 intersectionOnly:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  PIParallaxClockLayoutRequest *clockOverlapRequest;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BOOL v24;

  v11 = a4;
  v14 = a6;
  v15 = a8;
  v16 = a3;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  objc_msgSend(v16, "currentLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxClockLayoutRequest setLayout:](self->_clockOverlapRequest, "setLayout:", v17);

  -[PUParallaxLayerStackViewModelUpdater _updatePriorityForRequest:viewModel:highPriority:importanceOrder:](self, "_updatePriorityForRequest:viewModel:highPriority:importanceOrder:", self->_clockOverlapRequest, v16, v11, a5);
  clockOverlapRequest = self->_clockOverlapRequest;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke;
  v21[3] = &unk_1E58AB1E8;
  v24 = a7;
  v22 = v14;
  v23 = v15;
  v19 = v15;
  v20 = v14;
  -[PIParallaxClockLayoutRequest submit:](clockOverlapRequest, "submit:", v21);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");

}

- (void)recalculateClockAreaLuminance:(id)a3 highPriority:(BOOL)a4 importanceOrder:(double)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  PIParallaxClockMaterialRequest *clockMaterialRequest;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v8 = a3;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  objc_msgSend(v8, "currentLayerStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxClockMaterialRequest setLayerStack:](self->_clockMaterialRequest, "setLayerStack:", v9);

  objc_msgSend(v8, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxClockMaterialRequest setStyle:](self->_clockMaterialRequest, "setStyle:", v10);

  -[PUParallaxLayerStackViewModelUpdater _updatePriorityForRequest:viewModel:highPriority:importanceOrder:](self, "_updatePriorityForRequest:viewModel:highPriority:importanceOrder:", self->_clockMaterialRequest, v8, v6, a5);
  clockMaterialRequest = self->_clockMaterialRequest;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke;
  v13[3] = &unk_1E58AB198;
  v14 = v8;
  v12 = v8;
  -[PIParallaxClockMaterialRequest submit:](clockMaterialRequest, "submit:", v13);
  -[PIParallaxClockMaterialRequest setLayerStack:](self->_clockMaterialRequest, "setLayerStack:", 0);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");

}

- (void)beginRenderTransaction
{
  dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
}

- (void)endRenderTransaction
{
  OS_dispatch_queue *transactionResponseQueue;
  _QWORD v3[5];

  transactionResponseQueue = self->_transactionResponseQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PUParallaxLayerStackViewModelUpdater_endRenderTransaction__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D52290], "commitAndNotifyOnQueue:withBlock:", transactionResponseQueue, v3);
}

- (void)cancelPendingRenders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PIParallaxLayerStackRequest renderContext](self->_mainRenderRequest, "renderContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllRequests");

  -[PIParallaxLayerStackRequest renderContext](self->_backfillRenderRequest, "renderContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllRequests");

  -[PIParallaxLayerStackRequest renderContext](self->_settlingEffectRenderRequest, "renderContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllRequests");

  -[PIParallaxClockLayoutRequest renderContext](self->_clockOverlapRequest, "renderContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllRequests");

  -[PIParallaxClockMaterialRequest renderContext](self->_clockMaterialRequest, "renderContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelAllRequests");

}

- (BOOL)waitForInFlightRenders:(double)a3
{
  NSObject *transactionGroup;
  dispatch_time_t v4;

  transactionGroup = self->_transactionGroup;
  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_group_wait(transactionGroup, v4) == 0;
}

- (void)notifyWhenInFlightRendersComplete:(id)a3
{
  dispatch_group_notify((dispatch_group_t)self->_transactionGroup, MEMORY[0x1E0C80D38], a3);
}

- (void)renderModelAfterStyleInitialization:(id)a3 isOnscreen:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id *v7;
  id v8;
  double v9;
  PUParallaxLayerStackViewModelUpdater *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  PUParallaxLayerStackViewModelUpdater *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a4;
  v6 = a3;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  if (v4)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke;
    v19[3] = &unk_1E58ABCA8;
    v7 = &v20;
    v19[4] = self;
    v20 = v6;
    v8 = v6;
    -[PUParallaxLayerStackViewModelUpdater renderMainLayers:highPriority:importanceOrder:completion:](self, "renderMainLayers:highPriority:importanceOrder:completion:", v8, 1, v19, 0.0);
    v9 = 1.0;
    v10 = self;
    v11 = v8;
    v12 = 0;
  }
  else
  {
    -[PUParallaxLayerStackViewModelUpdater ensureOffscreenModelIsUnloaded:](self, "ensureOffscreenModelIsUnloaded:", v6);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke_2;
    v16 = &unk_1E58ABCA8;
    v7 = &v18;
    v17 = self;
    v18 = v6;
    v11 = v6;
    v9 = 0.0;
    v12 = &v13;
    v10 = self;
  }
  -[PUParallaxLayerStackViewModelUpdater renderBackfillLayers:highPriority:importanceOrder:completion:](v10, "renderBackfillLayers:highPriority:importanceOrder:completion:", v11, 1, v12, v9, v13, v14, v15, v16, v17);

  -[PUParallaxLayerStackViewModelUpdater renderSettlingEffectLayerIfNeededForViewModel:highPriority:importanceOrder:](self, "renderSettlingEffectLayerIfNeededForViewModel:highPriority:importanceOrder:", v6, 1, 0.5);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");
}

- (void)renderOnscreenModelAfterStyleChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  PUParallaxLayerStackViewModelUpdater *v10;
  id v11;

  v4 = a3;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke;
  v9 = &unk_1E58ABCA8;
  v10 = self;
  v11 = v4;
  v5 = v4;
  -[PUParallaxLayerStackViewModelUpdater renderMainLayers:highPriority:importanceOrder:completion:](self, "renderMainLayers:highPriority:importanceOrder:completion:", v5, 1, &v6, 0.25);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction", v6, v7, v8, v9, v10);

}

- (void)renderOnscreenModelAfterVisibleFrameChange:(id)a3 allViewModels:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  PUParallaxLayerStackViewModelUpdater *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  -[PUParallaxLayerStackViewModelUpdater renderMainLayers:highPriority:importanceOrder:completion:](self, "renderMainLayers:highPriority:importanceOrder:completion:", v6, 1, 0, 0.0);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __97__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterVisibleFrameChange_allViewModels___block_invoke;
  v12 = &unk_1E58ABCA8;
  v13 = self;
  v14 = v6;
  v8 = v6;
  -[PUParallaxLayerStackViewModelUpdater recalculateClockOverlap:highPriority:importanceOrder:allViewModels:intersectionOnly:completion:](self, "recalculateClockOverlap:highPriority:importanceOrder:allViewModels:intersectionOnly:completion:", v8, 1, v7, 0, &v9, 0.1);

  -[PUParallaxLayerStackViewModelUpdater renderBackfillLayers:highPriority:importanceOrder:completion:](self, "renderBackfillLayers:highPriority:importanceOrder:completion:", v8, 1, 0, 1.0, v9, v10, v11, v12, v13);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");

}

- (void)renderOffscreenModelAfterVisibleFrameChange:(id)a3 highPriority:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  PUParallaxLayerStackViewModelUpdater *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  if ((objc_msgSend(v6, "mainLayersArePruned") & 1) == 0)
    objc_msgSend(v6, "performChanges:", &__block_literal_global_103417);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __97__PUParallaxLayerStackViewModelUpdater_renderOffscreenModelAfterVisibleFrameChange_highPriority___block_invoke_2;
  v11 = &unk_1E58ABCA8;
  v12 = self;
  v13 = v6;
  v7 = v6;
  -[PUParallaxLayerStackViewModelUpdater renderBackfillLayers:highPriority:importanceOrder:completion:](self, "renderBackfillLayers:highPriority:importanceOrder:completion:", v7, v4, &v8, 0.0);
  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction", v8, v9, v10, v11, v12);

}

- (void)recalculateClockOverlap:(id)a3 allViewModels:(id)a4 highPriority:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  -[PUParallaxLayerStackViewModelUpdater recalculateClockOverlap:highPriority:importanceOrder:allViewModels:intersectionOnly:completion:](self, "recalculateClockOverlap:highPriority:importanceOrder:allViewModels:intersectionOnly:completion:", v9, v5, v8, 0, 0, 0.0);

  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");
}

- (void)recalculateClockIntersection:(id)a3 allViewModels:(id)a4 highPriority:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
  -[PUParallaxLayerStackViewModelUpdater recalculateClockOverlap:highPriority:importanceOrder:allViewModels:intersectionOnly:completion:](self, "recalculateClockOverlap:highPriority:importanceOrder:allViewModels:intersectionOnly:completion:", v9, v5, v8, 1, 0, 0.0);

  -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");
}

- (void)ensureOnscreenModelIsLoaded:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "mainLayersArePruned"))
  {
    -[PUParallaxLayerStackViewModelUpdater beginRenderTransaction](self, "beginRenderTransaction");
    -[PUParallaxLayerStackViewModelUpdater renderMainLayers:highPriority:importanceOrder:completion:](self, "renderMainLayers:highPriority:importanceOrder:completion:", v4, 1, 0, 0.0);
    -[PUParallaxLayerStackViewModelUpdater endRenderTransaction](self, "endRenderTransaction");
  }

}

- (void)ensureOffscreenModelIsUnloaded:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "mainLayersArePruned") & 1) == 0)
    objc_msgSend(v3, "performChanges:", &__block_literal_global_35_103416);

}

- (PISegmentationItem)item
{
  return self->_item;
}

- (OS_dispatch_group)transactionGroup
{
  return self->_transactionGroup;
}

- (void)setTransactionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_transactionGroup, a3);
}

- (OS_dispatch_queue)transactionResponseQueue
{
  return self->_transactionResponseQueue;
}

- (void)setTransactionResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionResponseQueue, a3);
}

- (PIParallaxLayerStackRequest)mainRenderRequest
{
  return self->_mainRenderRequest;
}

- (void)setMainRenderRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mainRenderRequest, a3);
}

- (PIParallaxLayerStackRequest)backfillRenderRequest
{
  return self->_backfillRenderRequest;
}

- (void)setBackfillRenderRequest:(id)a3
{
  objc_storeStrong((id *)&self->_backfillRenderRequest, a3);
}

- (PIParallaxLayerStackRequest)settlingEffectRenderRequest
{
  return self->_settlingEffectRenderRequest;
}

- (void)setSettlingEffectRenderRequest:(id)a3
{
  objc_storeStrong((id *)&self->_settlingEffectRenderRequest, a3);
}

- (PIParallaxClockLayoutRequest)clockOverlapRequest
{
  return self->_clockOverlapRequest;
}

- (void)setClockOverlapRequest:(id)a3
{
  objc_storeStrong((id *)&self->_clockOverlapRequest, a3);
}

- (PIParallaxClockMaterialRequest)clockMaterialRequest
{
  return self->_clockMaterialRequest;
}

- (void)setClockMaterialRequest:(id)a3
{
  objc_storeStrong((id *)&self->_clockMaterialRequest, a3);
}

- (NUCoalescer)styleChangeCoalescer
{
  return self->_styleChangeCoalescer;
}

- (void)setStyleChangeCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_styleChangeCoalescer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleChangeCoalescer, 0);
  objc_storeStrong((id *)&self->_clockMaterialRequest, 0);
  objc_storeStrong((id *)&self->_clockOverlapRequest, 0);
  objc_storeStrong((id *)&self->_settlingEffectRenderRequest, 0);
  objc_storeStrong((id *)&self->_backfillRenderRequest, 0);
  objc_storeStrong((id *)&self->_mainRenderRequest, 0);
  objc_storeStrong((id *)&self->_transactionResponseQueue, 0);
  objc_storeStrong((id *)&self->_transactionGroup, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

uint64_t __71__PUParallaxLayerStackViewModelUpdater_ensureOffscreenModelIsUnloaded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pruneMainLayers");
}

uint64_t __97__PUParallaxLayerStackViewModelUpdater_renderOffscreenModelAfterVisibleFrameChange_highPriority___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recalculateClockAreaLuminance:highPriority:importanceOrder:", *(_QWORD *)(a1 + 40), 1, 0.5);
}

uint64_t __97__PUParallaxLayerStackViewModelUpdater_renderOffscreenModelAfterVisibleFrameChange_highPriority___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pruneMainLayers");
}

uint64_t __97__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterVisibleFrameChange_allViewModels___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recalculateClockAreaLuminance:highPriority:importanceOrder:", *(_QWORD *)(a1 + 40), 1, 0.75);
}

void __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "styleChangeCoalescer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke_2;
  v3[3] = &unk_1E58AB210;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "coalesceBlock:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __76__PUParallaxLayerStackViewModelUpdater_renderOnscreenModelAfterStyleChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "recalculateClockAreaLuminance:highPriority:importanceOrder:", *(_QWORD *)(a1 + 32), 1, 0.5);
  objc_msgSend(WeakRetained, "renderBackfillLayers:highPriority:importanceOrder:completion:", *(_QWORD *)(a1 + 32), 1, 0, 1.0);

}

uint64_t __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recalculateClockAreaLuminance:highPriority:importanceOrder:", *(_QWORD *)(a1 + 40), 1, 0.0);
}

uint64_t __87__PUParallaxLayerStackViewModelUpdater_renderModelAfterStyleInitialization_isOnscreen___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recalculateClockAreaLuminance:highPriority:importanceOrder:", *(_QWORD *)(a1 + 40), 1, 0.0);
}

void __60__PUParallaxLayerStackViewModelUpdater_endRenderTransaction__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke_2;
    v7[3] = &unk_1E58AB148;
    v8 = v3;
    objc_msgSend(v5, "performChanges:", v7);
    v6 = v8;
  }
  else
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to compute clock luminance: %@", buf, 0xCu);
    }
  }

}

void __99__PUParallaxLayerStackViewModelUpdater_recalculateClockAreaLuminance_highPriority_importanceOrder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clockAreaLuminance");
  objc_msgSend(v3, "setClockAreaLuminance:");
  PLWallpaperGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "clockAreaLuminance");
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEBUG, "LuminanceForLook: setting luminance of %.2f for view model: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  id obj;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  objc_msgSend(a2, "result:", &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  v5 = v4;
  if (v3)
  {
    v16 = v4;
    objc_msgSend(v3, "clockLayerOrder");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "clockIntersection");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = a1;
    obj = *(id *)(a1 + 32);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v18[0] = v12;
          v18[1] = 3221225472;
          v18[2] = __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke_2;
          v18[3] = &unk_1E58AB1C0;
          v21 = *(_BYTE *)(v8 + 48);
          v19 = v6;
          v20 = v7;
          objc_msgSend(v14, "performChanges:", v18);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v10);
    }

    v5 = v16;
    a1 = v8;
  }
  else
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to compute clock overlap: %@", buf, 0xCu);
    }
  }

  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();

}

void __135__PUParallaxLayerStackViewModelUpdater_recalculateClockOverlap_highPriority_importanceOrder_allViewModels_intersectionOnly_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "setClockLayerOrder:", *(_QWORD *)(a1 + 32));
    v3 = v4;
  }
  objc_msgSend(v3, "setClockIntersection:", *(_QWORD *)(a1 + 40));

}

void __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke_2;
    v7[3] = &unk_1E58AB148;
    v8 = v3;
    objc_msgSend(v5, "performChanges:", v7);
    v6 = v8;
  }
  else
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to render settling effect layer: %@", buf, 0xCu);
    }
  }

}

void __115__PUParallaxLayerStackViewModelUpdater_renderSettlingEffectLayerIfNeededForViewModel_highPriority_importanceOrder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layerStack");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLayerStack:", v4);

}

void __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke_2;
    v11[3] = &unk_1E58AB148;
    v12 = v3;
    objc_msgSend(v5, "performChanges:", v11);
    v6 = v12;
  }
  else
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to render backfill layers: %@", buf, 0xCu);
    }
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v7, v8, v9);

}

void __101__PUParallaxLayerStackViewModelUpdater_renderBackfillLayers_highPriority_importanceOrder_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layerStack");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateBackfillLayersFromLayerStack:", v4);

}

void __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke_2;
    v11[3] = &unk_1E58AB148;
    v12 = v3;
    objc_msgSend(v5, "performChanges:", v11);
    v6 = v12;
  }
  else
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to render main layers: %@", buf, 0xCu);
    }
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v7, v8, v9);

}

void __97__PUParallaxLayerStackViewModelUpdater_renderMainLayers_highPriority_importanceOrder_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layerStack");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLayerStack:", v4);

}

@end

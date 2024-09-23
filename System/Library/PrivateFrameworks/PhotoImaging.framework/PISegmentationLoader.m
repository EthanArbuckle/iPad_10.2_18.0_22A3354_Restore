@implementation PISegmentationLoader

- (PISegmentationLoader)initWithParallaxAsset:(id)a3
{
  PFParallaxAsset *v4;
  PFParallaxAsset *v5;
  PISegmentationLoader *v6;
  PFParallaxAsset *asset;
  PFParallaxAsset *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *loadingHandlerQueue;
  NURenderContext *v15;
  NURenderContext *renderContext;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (PFParallaxAsset *)a3;
  if (!v4)
  {
    NUAssertLogger_17881();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v31.receiver = self;
  v31.super_class = (Class)PISegmentationLoader;
  v6 = -[PISegmentationLoader init](&v31, sel_init);
  asset = v6->_asset;
  v6->_asset = v5;
  v8 = v5;

  v6->_sourceMode = 1;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("PISegmentationItemLoader.state", v9);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create("PISegmentationItemLoader.loading", v12);
  loadingHandlerQueue = v6->_loadingHandlerQueue;
  v6->_loadingHandlerQueue = (OS_dispatch_queue *)v13;

  v6->_signpost = os_signpost_id_make_with_pointer((os_log_t)s_log_17878, v6);
  v15 = (NURenderContext *)objc_alloc_init(MEMORY[0x1E0D52248]);
  renderContext = v6->_renderContext;
  v6->_renderContext = v15;

  v6->_disableSegmentation = !-[PISegmentationLoader _shouldEnableSegmentationByDefault](v6, "_shouldEnableSegmentationByDefault");
  v6->_disableSettlingEffect = !-[PISegmentationLoader _shouldEnableSettlingEffectByDefault](v6, "_shouldEnableSettlingEffectByDefault");
  return v6;
}

- (PISegmentationLoader)initWithSegmentationItem:(id)a3 parallaxAsset:(id)a4
{
  id v7;
  _PISegmentationNullAsset *v8;
  _PISegmentationNullAsset *v9;
  PISegmentationLoader *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PFWallpaperCompoundDeviceConfiguration *layoutConfiguration;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (_PISegmentationNullAsset *)a4;
  if (!v7)
  {
    NUAssertLogger_17881();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "item != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        v31 = 2114;
        v32 = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v9 = v8;
  if (!v8)
    v9 = objc_alloc_init(_PISegmentationNullAsset);
  v10 = -[PISegmentationLoader initWithParallaxAsset:](self, "initWithParallaxAsset:", v9);
  objc_msgSend(v7, "setSegmentationDataURL:", 0);
  objc_storeStrong((id *)&v10->_item, a3);
  objc_msgSend(v7, "contextInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v10->_sourceMode = objc_msgSend(v11, "sourceMode");
    v10->_disableSegmentation = objc_msgSend(v12, "segmentationDisabled");
    objc_msgSend(v12, "layoutConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
    layoutConfiguration = v10->_layoutConfiguration;
    v10->_layoutConfiguration = (PFWallpaperCompoundDeviceConfiguration *)v13;

  }
  return v10;
}

- (BOOL)_shouldEnableSegmentationByDefault
{
  void *v2;
  char v3;
  void *v5;
  char v6;

  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceEnableSegmentation");

  if ((v3 & 1) != 0)
    return 1;
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableSegmentation");

  if ((v6 & 1) != 0)
    return 0;
  else
    return PFPosterDeviceSupportsSegmentation();
}

- (BOOL)_shouldEnableSettlingEffectByDefault
{
  void *v2;
  char v3;

  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceEnableSettlingEffect");

  if ((v3 & 1) != 0)
    return 1;
  else
    return PFPosterEnableSettlingEffect();
}

- (BOOL)shouldUseInteractiveSettlingEffectGating
{
  return -[PISegmentationLoader settlingEffectGatingLevel](self, "settlingEffectGatingLevel") != 2;
}

- (void)loadSegmentationItemWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke;
  block[3] = &unk_1E5018D98;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_didLoad:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(uint64_t, id, _QWORD, uint64_t, uint64_t);
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  self->_isLoading = 0;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __44__PISegmentationLoader__didLoad_completion___block_invoke;
  v16[3] = &unk_1E50198E0;
  v16[4] = self;
  v9 = v7;
  v17 = v9;
  v10 = MEMORY[0x1A85C0174](v16);
  v13 = (void *)v10;
  if (self->_isCancelled)
  {
    v14 = *(void (**)(uint64_t, id, _QWORD, uint64_t, uint64_t))(v10 + 16);
    v15 = 0;
  }
  else
  {
    if (!v6)
    {
      (*(void (**)(uint64_t, _QWORD, NSError *, uint64_t, uint64_t))(v10 + 16))(v10, 0, self->_loadingError, v11, v12);
      goto LABEL_6;
    }
    v14 = *(void (**)(uint64_t, id, _QWORD, uint64_t, uint64_t))(v10 + 16);
    v15 = v6;
  }
  v14(v10, v15, 0, v11, v12);
LABEL_6:

}

- (void)_load:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  PIParallaxSegmentationItem *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_isLoading = 1;
  -[PISegmentationLoader layoutConfiguration](self, "layoutConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parallaxLayoutConfigurationOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (_QWORD *)MEMORY[0x1E0D52390];
    if (v7)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v9 = (os_log_t *)MEMORY[0x1E0D52398];
      v10 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543362;
        v20 = v7;
        _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_DEFAULT, "Warning: PISegmentationLoader layout configuration unspecified! Using override layout configuration '%{public}@'", (uint8_t *)&v19, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D75340], "configurationWithDeviceName:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PISegmentationLoader setLayoutConfiguration:](self, "setLayoutConfiguration:", v11);

      -[PISegmentationLoader layoutConfiguration](self, "layoutConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_19;
      if (*v8 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v13 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543362;
        v20 = v7;
        _os_log_impl(&dword_1A6382000, v13, OS_LOG_TYPE_DEFAULT, "Warning: Override layout configuration '%{public}@' not found, using generic fallback", (uint8_t *)&v19, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D75340], "genericConfiguration");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v15 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_DEFAULT, "Warning: PISegmentationLoader layout configuration unspecified! Using the layout configuration matching this device", (uint8_t *)&v19, 2u);
      }
      objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v14;
    -[PISegmentationLoader setLayoutConfiguration:](self, "setLayoutConfiguration:", v14);

LABEL_19:
  }
  v17 = self->_item;
  -[PIParallaxSegmentationItem contextInfo](v17, "contextInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_26;
  }
  else
  {
    -[PISegmentationLoader currentContextInfo](self, "currentContextInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_26;
  }
  -[PISegmentationLoader _tryLoadSegmentationItemFromCache:](self, "_tryLoadSegmentationItemFromCache:", v18);
  v17 = (PIParallaxSegmentationItem *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = objc_alloc_init(PIParallaxSegmentationItem);
    -[PIParallaxSegmentationItem setContextInfo:](v17, "setContextInfo:", v18);
    -[PIParallaxSegmentationItem setClassification:](v17, "setClassification:", -[PISegmentationLoader classification](self, "classification"));
  }
LABEL_26:
  -[PISegmentationLoader _loadItem:completion:](self, "_loadItem:completion:", v17, v4);

}

- (id)currentContextInfo
{
  void *v3;
  void *v4;

  +[PISegmentationContextInfo currentContextInfo](PISegmentationContextInfo, "currentContextInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceMode:", -[PISegmentationLoader sourceMode](self, "sourceMode"));
  objc_msgSend(v3, "setSegmentationDisabled:", -[PISegmentationLoader disableSegmentation](self, "disableSegmentation"));
  -[PISegmentationLoader layoutConfiguration](self, "layoutConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutConfiguration:", v4);

  objc_msgSend(v3, "setRole:", -[PISegmentationLoader role](self, "role"));
  return v3;
}

- (void)_loadItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t signpost;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = (id)s_log_17878;
  v10 = v9;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.proxy", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke;
  v21[3] = &unk_1E5018DC0;
  v21[4] = self;
  v13 = v6;
  v22 = v13;
  v23 = v8;
  v14 = v8;
  -[PISegmentationLoader _loadProxyResource:completion:](self, "_loadProxyResource:completion:", v13, v21);
  queue = self->_queue;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_66;
  v18[3] = &unk_1E5018E10;
  v19 = v13;
  v20 = v7;
  v18[4] = self;
  v16 = v13;
  v17 = v7;
  dispatch_group_notify(v14, queue, v18);

}

- (void)_handlePartialItem:(id)a3 loadingState:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *loadingHandlerQueue;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PISegmentationLoader loadingHandler](self, "loadingHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(v6, "loadingState");
    v9 = a4 == 128 ? v8 | 0x80 : v8 & 0x80 | a4;
    objc_msgSend(v6, "setLoadingState:", v9);
    objc_msgSend(v6, "defaultLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_6;
    v27 = 0;
    -[PISegmentationLoader _computeDefaultLayoutForItem:error:](self, "_computeDefaultLayoutForItem:error:", v6, &v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;
    if (!v14)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v20 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v13;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Failed to compute default layout, error: %{public}@", buf, 0xCu);
      }
      goto LABEL_7;
    }
    v15 = objc_alloc(MEMORY[0x1E0D52100]);
    objc_msgSend(v6, "composition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithComposition:", v16);

    v26 = 0;
    objc_msgSend(v17, "submitSynchronous:", &v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;

    if (v18)
    {
      objc_msgSend(v6, "setDefaultLayout:", v14);
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v21 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v19;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Failed to compute proxy image size, error: %{public}@", buf, 0xCu);
      }
    }

    if (v18)
    {
LABEL_6:
      v11 = (void *)objc_msgSend(v6, "copy");
      loadingHandlerQueue = self->_loadingHandlerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__PISegmentationLoader__handlePartialItem_loadingState___block_invoke;
      block[3] = &unk_1E5018E38;
      v23 = v11;
      v24 = v7;
      v25 = v9;
      v13 = v11;
      dispatch_async(loadingHandlerQueue, block);

LABEL_7:
    }
  }

}

- (id)_computeDefaultLayoutForItem:(id)a3 error:(id *)a4
{
  id v6;
  PIPosterLayoutRequest *v7;
  void *v8;
  PIPosterLayoutRequest *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = [PIPosterLayoutRequest alloc];
  objc_msgSend(v6, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PIPosterLayoutRequest initWithComposition:](v7, "initWithComposition:", v8);

  -[PISegmentationLoader layoutConfiguration](self, "layoutConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPosterLayoutRequest setLayoutConfiguration:](v9, "setLayoutConfiguration:", v10);

  -[PIPosterLayoutRequest setLayoutRegions:](v9, "setLayoutRegions:", self->_asset);
  -[PIPosterLayoutRequest setSegmentationClassification:](v9, "setSegmentationClassification:", -[PISegmentationLoader classification](self, "classification"));
  -[PIPosterLayoutRequest setShouldComputeAllScores:](v9, "setShouldComputeAllScores:", 0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__17900;
  v30 = __Block_byref_object_dispose__17901;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__17900;
  v24 = __Block_byref_object_dispose__17901;
  v25 = 0;
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__PISegmentationLoader__computeDefaultLayoutForItem_error___block_invoke;
  v16[3] = &unk_1E5018E60;
  v18 = &v26;
  v19 = &v20;
  v12 = v11;
  v17 = v12;
  -[PIPosterLayoutRequest submit:](v9, "submit:", v16);
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v13 = (void *)v27[5];
  if (!v13)
  {
    *a4 = objc_retainAutorelease((id)v21[5]);
    v13 = (void *)v27[5];
  }
  v14 = v13;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (void)cancel
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v3 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6382000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling segmentation loader", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PISegmentationLoader_cancel__block_invoke;
  block[3] = &unk_1E50195F0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_abort:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_loadingError)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_loadingError, a3);
    if (self->_loadRequestID)
      -[PFParallaxAsset cancelParallaxResourceRequest:](self->_asset, "cancelParallaxResourceRequest:");
    if (self->_petsRequestID)
      -[PFParallaxAsset cancelPetsRegionsRequest:](self->_asset, "cancelPetsRegionsRequest:");
    if (self->_loadMotionRequestID)
      -[PFParallaxAsset cancelMotionScoreRequest:](self->_asset, "cancelMotionScoreRequest:");
    if (self->_settlingEffectCropRequestID)
      +[PIPosterSettlingEffectLoader cancelRequest:](PIPosterSettlingEffectLoader, "cancelRequest:");
    if (self->_settlingEffectVideoRequestID)
      +[PIPosterSettlingEffectLoader cancelRequest:](PIPosterSettlingEffectLoader, "cancelRequest:");
    -[NURenderContext cancelAllRequests](self->_renderContext, "cancelAllRequests");
    v5 = v6;
  }

}

- (void)_loadLiveOriginalResource:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "livePhotoResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || self->_isCancelled)
  {
    v7[2](v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__PISegmentationLoader__loadLiveOriginalResource_completion___block_invoke;
    v9[3] = &unk_1E5018E88;
    v10 = v6;
    v11 = v7;
    -[PISegmentationLoader _loadAssetResourceForLiveOriginalWithCompletion:](self, "_loadAssetResourceForLiveOriginalWithCompletion:", v9);

  }
}

- (void)_loadProxyResource:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "resource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || self->_isCancelled)
  {
    v7[2](v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PISegmentationLoader__loadProxyResource_completion___block_invoke;
    v9[3] = &unk_1E5018E88;
    v10 = v6;
    v11 = v7;
    -[PISegmentationLoader _loadAssetResourceForProxy:completion:](self, "_loadAssetResourceForProxy:completion:", 1, v9);

  }
}

- (void)_loadFullSizeResource:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "resource");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(v6, "resource"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isProxyOnly"),
        v10,
        v9,
        (v11 & 1) == 0)
    || self->_isCancelled)
  {
    v7[2](v7, 0);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__PISegmentationLoader__loadFullSizeResource_completion___block_invoke;
    v12[3] = &unk_1E5018E88;
    v13 = v6;
    v14 = v7;
    -[PISegmentationLoader _loadAssetResourceForProxy:completion:](self, "_loadAssetResourceForProxy:completion:", 0, v12);

  }
}

- (void)_loadAssetResourceForLiveOriginalWithCompletion:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0D75168];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setCanHandleAdjustmentData:", &__block_literal_global_18000);
  objc_msgSend(v6, "setResultHandlerQueue:", self->_queue);
  -[PISegmentationLoader _loadAssetResource:options:completion:](self, "_loadAssetResource:options:completion:", 6, v6, v5);

}

- (void)_loadAssetResourceForProxy:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  id v8;
  unint64_t sourceMode;
  uint64_t v10;
  BOOL v11;
  double v12;
  id v13;

  v4 = a3;
  v6 = (objc_class *)MEMORY[0x1E0D75168];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  sourceMode = self->_sourceMode;
  v13 = v8;
  if (sourceMode < 2)
  {
    v10 = v4;
    v11 = !v4;
  }
  else
  {
    if (sourceMode != 2)
    {
      if (sourceMode == 3)
      {
        objc_msgSend(v8, "setCanHandleAdjustmentData:", &__block_literal_global_76);
        v10 = 4;
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_13;
    }
    v11 = !v4;
    if (v4)
      v10 = 3;
    else
      v10 = 2;
  }
  v12 = 3024.0;
  if (!v11)
    v12 = 1536.0;
  objc_msgSend(v8, "setImageSize:", v12, v12);
LABEL_13:
  objc_msgSend(v13, "setResultHandlerQueue:", self->_queue);
  -[PISegmentationLoader _loadAssetResource:options:completion:](self, "_loadAssetResource:options:completion:", v10, v13, v7);

}

- (void)_loadAssetResource:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke;
  v12[3] = &unk_1E5018F18;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  -[PISegmentationLoader _loadAssetResource:allowNetworkAccess:options:completion:](self, "_loadAssetResource:allowNetworkAccess:options:completion:", a3, 0, v11, v12);

}

- (void)_loadAssetResource:(int64_t)a3 allowNetworkAccess:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  PFParallaxAsset *asset;
  NSObject *v14;
  void *v15;
  void *v16;
  PFParallaxAsset *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  uint8_t buf[4];
  int64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v7 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "setNetworkAccessAllowed:", v7);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v12 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
  {
    asset = self->_asset;
    v14 = v12;
    -[PFParallaxAsset localIdentifier](asset, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v25 = a3;
    v26 = 2114;
    v27 = v15;
    v28 = 1024;
    v29 = objc_msgSend(v10, "networkAccessAllowed");
    _os_log_impl(&dword_1A6382000, v14, OS_LOG_TYPE_INFO, "Loading resource %ld for asset %{public}@, allow download? %d", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_asset;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__PISegmentationLoader__loadAssetResource_allowNetworkAccess_options_completion___block_invoke;
  v20[3] = &unk_1E5018F18;
  v20[4] = self;
  v21 = v16;
  v22 = v11;
  v23 = a3;
  v18 = v11;
  v19 = v16;
  self->_loadRequestID = -[PFParallaxAsset loadParallaxResource:options:resultHandler:](v17, "loadParallaxResource:options:resultHandler:", a3, v10, v20);

}

- (void)_loadSegmentationData:(id)a3 layoutGroup:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  dispatch_group_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t signpost;
  uint64_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  NSObject *queue;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  NSObject *v31;
  _QWORD block[4];
  NSObject *v33;
  PISegmentationLoader *v34;
  id v35;
  _QWORD v36[5];
  NSObject *v37;
  id v38;
  NSObject *v39;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_group_create();
  dispatch_group_enter(v9);
  v12 = (id)s_log_17878;
  v13 = v12;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v13, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.classify", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v15 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke;
  v36[3] = &unk_1E5018F68;
  v36[4] = self;
  v16 = v9;
  v37 = v16;
  v17 = v8;
  v38 = v17;
  v18 = v11;
  v39 = v18;
  -[PISegmentationLoader _classify:completion:](self, "_classify:completion:", v17, v36);
  dispatch_group_enter(v18);
  queue = self->_queue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_82;
  block[3] = &unk_1E5019340;
  v20 = v18;
  v33 = v20;
  v34 = self;
  v21 = v17;
  v35 = v21;
  dispatch_group_notify(v16, queue, block);
  dispatch_group_enter(v20);
  v22 = (id)s_log_17878;
  v23 = v22;
  v24 = self->_signpost;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PISegmentationLoader.localLightData", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v30[0] = v15;
  v30[1] = 3221225472;
  v30[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_85;
  v30[3] = &unk_1E5018F40;
  v30[4] = self;
  v31 = v20;
  v25 = v20;
  -[PISegmentationLoader _loadLocalLightData:completion:](self, "_loadLocalLightData:completion:", v21, v30);
  v26 = self->_queue;
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_86;
  v28[3] = &unk_1E5018F90;
  v29 = v10;
  v27 = v10;
  dispatch_group_notify(v25, v26, v28);

}

- (BOOL)_shouldLoadSettlingEffectForItem:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (objc_msgSend(v4, "settlingEffectStatus"))
  {
    if (objc_msgSend(v4, "settlingEffectStatus") == 3)
      v5 = !-[PISegmentationLoader shouldUseInteractiveSettlingEffectGating](self, "shouldUseInteractiveSettlingEffectGating");
    else
      LOBYTE(v5) = 0;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_loadSettlingEffect:(id)a3 layoutGroup:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PISegmentationLoader *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t signpost;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  void (**v31)(id, _QWORD);
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  _WORD v35[9];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[PISegmentationLoader asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PISegmentationLoader _shouldLoadSettlingEffectForItem:](self, "_shouldLoadSettlingEffectForItem:", v8))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v18 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v12;
      _os_log_impl(&dword_1A6382000, v18, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, cached results are sufficient for the current session", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (-[PISegmentationLoader disableSettlingEffect](self, "disableSettlingEffect")
    || -[PISegmentationLoader disableRendering](self, "disableRendering"))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v13 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      *(_DWORD *)buf = 138543874;
      v33 = v12;
      v34 = 1024;
      *(_DWORD *)v35 = -[PISegmentationLoader disableSettlingEffect](self, "disableSettlingEffect");
      v35[2] = 1024;
      *(_DWORD *)&v35[3] = -[PISegmentationLoader disableRendering](self, "disableRendering");
      _os_log_impl(&dword_1A6382000, v14, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, disableSettlingEffect: %d, disableRendering: %d", buf, 0x18u);

    }
    v15 = self;
    v16 = v8;
    v17 = 64;
LABEL_9:
    -[PISegmentationLoader _updateItem:withSettlingEffectGatingFailures:](v15, "_updateItem:withSettlingEffectGatingFailures:", v16, v17);
LABEL_14:
    v10[2](v10, 0);
    goto LABEL_15;
  }
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "forceEnableSettlingEffect");

  if ((v20 & 1) == 0 && (objc_msgSend((id)objc_opt_class(), "currentDeviceSupportsSettlingEffect") & 1) == 0)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v24 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v25 = v24;
      -[PISegmentationLoader settlingEffectGatingLevel](self, "settlingEffectGatingLevel");
      PFPosterSettlingEffectGatingLevelDescription();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v12;
      v34 = 2114;
      *(_QWORD *)v35 = v26;
      _os_log_impl(&dword_1A6382000, v25, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, unsupported device for gating level %{public}@", buf, 0x16u);

    }
    v15 = self;
    v16 = v8;
    v17 = 2048;
    goto LABEL_9;
  }
  objc_msgSend(v8, "resetSettlingEffectGatingFailure");
  v21 = (id)s_log_17878;
  v22 = v21;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v22, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.liveOriginal", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke;
  v27[3] = &unk_1E5019030;
  v27[4] = self;
  v28 = v8;
  v29 = v12;
  v31 = v10;
  v30 = v9;
  -[PISegmentationLoader _loadLiveOriginalResource:completion:](self, "_loadLiveOriginalResource:completion:", v28, v27);

LABEL_15:
}

- (void)_loadMotionScore:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t signpost;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PISegmentationLoader asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NUAssertLogger_17881();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot load motion score for nil asset"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v26;
        v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[PISegmentationLoader asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)s_log_17878;
  v12 = v11;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.settlingEffect.motion", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  -[PISegmentationLoader asset](self, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52__PISegmentationLoader__loadMotionScore_completion___block_invoke;
  v31[3] = &unk_1E5019058;
  v31[4] = self;
  v32 = v6;
  v33 = v10;
  v34 = v7;
  v15 = v7;
  v16 = v10;
  v17 = v6;
  self->_loadMotionRequestID = objc_msgSend(v14, "loadMotionScore:", v31);

}

- (void)_classify:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  void (**v43)(_QWORD);
  _QWORD v44[2];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_msgSend(v6, "classification");
  if ((unint64_t)(v8 - 1) < 4)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v9 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      objc_msgSend(v6, "classification");
      PFPosterClassificationName();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_INFO, "Known classification: %{public}@", buf, 0xCu);

    }
    goto LABEL_18;
  }
  if (v8)
  {
    if (v8 == 5)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v12 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6382000, v12, OS_LOG_TYPE_INFO, "Previous classification attempt yielded 'other'", buf, 2u);
      }
      goto LABEL_18;
    }
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v13 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6382000, v13, OS_LOG_TYPE_INFO, "Current classification is unspecified", buf, 2u);
    }
  }
  if (self->_isCancelled || -[PISegmentationLoader disableRendering](self, "disableRendering"))
  {
LABEL_18:
    v7[2](v7);
    goto LABEL_19;
  }
  objc_msgSend(v6, "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    NUAssertLogger_17881();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing composition"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v34;
        v47 = 2114;
        v48 = v38;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v33;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v15 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
  v16 = objc_alloc_init(MEMORY[0x1E0CEDFD0]);
  v17 = objc_alloc(MEMORY[0x1E0D52350]);
  objc_msgSend(v6, "composition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithComposition:", v18);

  v44[0] = v15;
  v44[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setVisionRequests:", v20);

  objc_msgSend((id)objc_opt_class(), "proxyScalePolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScalePolicy:", v21);

  +[PIPhotoEditHelper pipelineFiltersForShowingOriginalWithGeometry](PIPhotoEditHelper, "pipelineFiltersForShowingOriginalWithGeometry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPipelineFilters:", v22);

  objc_msgSend(v19, "setResponseQueue:", self->_queue);
  objc_msgSend(v19, "setRenderContext:", self->_renderContext);
  objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPriority:", v23);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __45__PISegmentationLoader__classify_completion___block_invoke;
  v39[3] = &unk_1E5019080;
  v40 = v15;
  v41 = v16;
  v42 = v6;
  v43 = v7;
  v24 = v16;
  v25 = v15;
  objc_msgSend(v19, "submit:", v39);

LABEL_19:
}

- (void)_segment:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  id *v18;
  id *v19;
  id v20;
  uint64_t *v21;
  PISegmentationLoader *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  id v43;
  void *v44;
  void (**v45)(_QWORD);
  _QWORD v46[4];
  id v47;
  void *v48;
  void (**v49)(_QWORD);
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "segmentationMatte");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || objc_msgSend(v6, "classification") == 5
    || self->_isCancelled
    || -[PISegmentationLoader disableSegmentation](self, "disableSegmentation")
    || -[PISegmentationLoader disableRendering](self, "disableRendering"))
  {
    v7[2](v7);
  }
  else
  {
    objc_msgSend(v6, "composition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      NUAssertLogger_17881();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing composition"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v27;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v28 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_17881();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v31)
        {
          v34 = dispatch_get_specific(*v28);
          v35 = (void *)MEMORY[0x1E0CB3978];
          v36 = v34;
          objc_msgSend(v35, "callStackSymbols");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v34;
          v54 = 2114;
          v55 = v38;
          _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v33;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler();
    }
    v10 = objc_msgSend(v6, "classification");
    if ((unint64_t)(v10 - 3) < 2)
    {
      v12 = 0;
      v11 = 3;
    }
    else
    {
      v11 = v10;
      if (v10 == 1 || v10 == 2)
      {
        v12 = 0;
      }
      else
      {
        v11 = 0;
        v12 = 1;
      }
    }
    v13 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __44__PISegmentationLoader__segment_completion___block_invoke;
    v50[3] = &unk_1E50190A8;
    v50[4] = self;
    v14 = v6;
    v51 = v14;
    v15 = (void *)MEMORY[0x1A85C0174](v50);
    objc_msgSend(v14, "composition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 & 1) != 0)
    {
      v39 = v13;
      v40 = 3221225472;
      v41 = __44__PISegmentationLoader__segment_completion___block_invoke_3;
      v42 = &unk_1E50190D0;
      v17 = &v44;
      v44 = v15;
      v18 = &v43;
      v43 = v14;
      v19 = (id *)&v45;
      v45 = v7;
      v20 = v15;
      v21 = &v39;
      v22 = self;
      v23 = v16;
      v24 = 3;
    }
    else
    {
      v46[0] = v13;
      v46[1] = 3221225472;
      v46[2] = __44__PISegmentationLoader__segment_completion___block_invoke_2;
      v46[3] = &unk_1E50190D0;
      v17 = &v48;
      v48 = v15;
      v18 = &v47;
      v47 = v14;
      v19 = (id *)&v49;
      v49 = v7;
      v25 = v15;
      v21 = v46;
      v22 = self;
      v23 = v16;
      v24 = v11;
    }
    -[PISegmentationLoader _performSegmentation:type:completion:](v22, "_performSegmentation:type:completion:", v23, v24, v21, v39, v40, v41, v42);

  }
}

- (void)_performSegmentation:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    NUAssertLogger_17881();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2114;
        v33 = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if (self->_isCancelled)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52358]), "initWithComposition:", v8);
    objc_msgSend(v11, "setSegmentationType:", a4);
    objc_msgSend(v11, "setVisionSegmentationPolicy:", 3);
    objc_msgSend((id)objc_opt_class(), "proxyScalePolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScalePolicy:", v12);

    +[PIPhotoEditHelper pipelineFiltersForShowingOriginalWithGeometry](PIPhotoEditHelper, "pipelineFiltersForShowingOriginalWithGeometry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPipelineFilters:", v13);

    objc_msgSend(v11, "setResponseQueue:", self->_queue);
    objc_msgSend(v11, "setRenderContext:", self->_renderContext);
    objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPriority:", v14);

    objc_msgSend(v11, "setProduceConfidenceMap:", a4 == 1);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __61__PISegmentationLoader__performSegmentation_type_completion___block_invoke;
    v28[3] = &unk_1E5019A68;
    v29 = v10;
    objc_msgSend(v11, "submit:", v28);

  }
}

- (BOOL)_isValidSegmentationMatteHistogramForDepth:(id)a3
{
  +[PISegmentationHelper bimodalScoreForHistogram:](PISegmentationHelper, "bimodalScoreForHistogram:", a3);
  return +[PISegmentationGating isValidSegmentationScoreForDepth:](PISegmentationGating, "isValidSegmentationScoreForDepth:");
}

- (void)_analyzeColors:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  PIParallaxColorAnalysisRequest *v29;
  void *v30;
  PIParallaxColorAnalysisRequest *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  BOOL v36;
  PIParallaxColorAnalysisRequest *v37;
  void *v38;
  PIParallaxColorAnalysisRequest *v39;
  void *v40;
  PIParallaxColorAnalysisRequest *v41;
  void *v42;
  PIParallaxColorAnalysisRequest *v43;
  void *v44;
  PIParallaxColorAnalysisRequest *v45;
  void *v46;
  PIParallaxColorAnalysisRequest *v47;
  void *v48;
  OS_dispatch_queue *queue;
  NSObject *v50;
  void *v51;
  const void **v52;
  void *specific;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  void *v57;
  const void **v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  double v74;
  _QWORD v75[4];
  id v76;
  void (**v77)(_QWORD);
  _BYTE *v78;
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[5];
  _BYTE buf[24];
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  PIParallaxColorAnalysis *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "colorAnalysis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || self->_isCancelled || -[PISegmentationLoader disableRendering](self, "disableRendering"))
  {
    v7[2](v7);
    goto LABEL_5;
  }
  objc_msgSend(v6, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    NUAssertLogger_17881();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing composition"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v51;
      _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v52 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v63 = dispatch_get_specific(*v52);
        v64 = (void *)MEMORY[0x1E0CB3978];
        v65 = v63;
        objc_msgSend(v64, "callStackSymbols");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v67;
        _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
LABEL_23:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v62;
      _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_29:

    _NUAssertFailHandler();
    __break(1u);
  }
  objc_msgSend(v6, "originalLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    NUAssertLogger_17881();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing original layout"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v57;
      _os_log_error_impl(&dword_1A6382000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v58 = (const void **)MEMORY[0x1E0D51D48];
    v59 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v54 = objc_claimAutoreleasedReturnValue();
    v60 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (!v59)
    {
      if (!v60)
        goto LABEL_29;
      goto LABEL_23;
    }
    if (v60)
    {
      v68 = dispatch_get_specific(*v58);
      v69 = (void *)MEMORY[0x1E0CB3978];
      v70 = v68;
      objc_msgSend(v69, "callStackSymbols");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v68;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v72;
      _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_29;
  }
  objc_msgSend(v6, "originalLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "portraitLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "imageSize");
  objc_msgSend(v12, "visibleFrame");
  NURectNormalize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "timeFrame");
  NURectNormalize();
  v73 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v84 = __Block_byref_object_copy__17900;
  v85 = __Block_byref_object_dispose__17901;
  v86 = objc_alloc_init(PIParallaxColorAnalysis);
  objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  v29 = [PIParallaxColorAnalysisRequest alloc];
  objc_msgSend(v6, "composition");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PIParallaxColorAnalysisRequest initWithComposition:](v29, "initWithComposition:", v30);

  -[PIParallaxColorAnalysisRequest setSegmentationMatte:](v31, "setSegmentationMatte:", 0);
  -[PIParallaxColorAnalysisRequest setAnalyzeBackground:](v31, "setAnalyzeBackground:", 1);
  -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v31, "setNormalizedClipRect:", v14, v16, v18, v20);
  objc_msgSend(v6, "segmentationMatte");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    v33 = 1;
  else
    v33 = 5;
  -[PIParallaxColorAnalysisRequest setMaxDominantColors:](v31, "setMaxDominantColors:", v33, v73);

  -[NURenderRequest setResponseQueue:](v31, "setResponseQueue:", self->_queue);
  -[NURenderRequest setRenderContext:](v31, "setRenderContext:", self->_renderContext);
  -[NURenderRequest setPriority:](v31, "setPriority:", v28);
  v34 = MEMORY[0x1E0C809B0];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke;
  v82[3] = &unk_1E5019538;
  v82[4] = buf;
  -[PIParallaxColorAnalysisRequest submit:](v31, "submit:", v82);
  objc_msgSend(v6, "segmentationMatte");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 == 0;

  if (!v36)
  {
    v37 = [PIParallaxColorAnalysisRequest alloc];
    objc_msgSend(v6, "composition");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PIParallaxColorAnalysisRequest initWithComposition:](v37, "initWithComposition:", v38);

    objc_msgSend(v6, "segmentationMatte");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxColorAnalysisRequest setSegmentationMatte:](v39, "setSegmentationMatte:", v40);

    -[PIParallaxColorAnalysisRequest setAnalyzeBackground:](v39, "setAnalyzeBackground:", 0);
    -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v39, "setNormalizedClipRect:", v14, v16, v18, v20);
    -[PIParallaxColorAnalysisRequest setMaxDominantColors:](v39, "setMaxDominantColors:", 5);
    -[NURenderRequest setResponseQueue:](v39, "setResponseQueue:", self->_queue);
    -[NURenderRequest setRenderContext:](v39, "setRenderContext:", self->_renderContext);
    -[NURenderRequest setPriority:](v39, "setPriority:", v28);
    v81[0] = v34;
    v81[1] = 3221225472;
    v81[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_118;
    v81[3] = &unk_1E5019538;
    v81[4] = buf;
    -[PIParallaxColorAnalysisRequest submit:](v39, "submit:", v81);
    v41 = [PIParallaxColorAnalysisRequest alloc];
    objc_msgSend(v6, "composition");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[PIParallaxColorAnalysisRequest initWithComposition:](v41, "initWithComposition:", v42);

    objc_msgSend(v6, "segmentationMatte");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxColorAnalysisRequest setSegmentationMatte:](v43, "setSegmentationMatte:", v44);

    -[PIParallaxColorAnalysisRequest setAnalyzeBackground:](v43, "setAnalyzeBackground:", 1);
    -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v43, "setNormalizedClipRect:", v14, v16, v18, v20);
    -[PIParallaxColorAnalysisRequest setMaxDominantColors:](v43, "setMaxDominantColors:", 5);
    -[NURenderRequest setResponseQueue:](v43, "setResponseQueue:", self->_queue);
    -[NURenderRequest setRenderContext:](v43, "setRenderContext:", self->_renderContext);
    -[NURenderRequest setPriority:](v43, "setPriority:", v28);
    v80[0] = v34;
    v80[1] = 3221225472;
    v80[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_119;
    v80[3] = &unk_1E5019538;
    v80[4] = buf;
    -[PIParallaxColorAnalysisRequest submit:](v43, "submit:", v80);

  }
  v45 = [PIParallaxColorAnalysisRequest alloc];
  objc_msgSend(v6, "composition");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[PIParallaxColorAnalysisRequest initWithComposition:](v45, "initWithComposition:", v46);

  -[PIParallaxColorAnalysisRequest setSegmentationMatte:](v47, "setSegmentationMatte:", 0);
  -[PIParallaxColorAnalysisRequest setAnalyzeBackground:](v47, "setAnalyzeBackground:", 1);
  -[PIParallaxColorAnalysisRequest setNormalizedClipRect:](v47, "setNormalizedClipRect:", v74, v23, v25, v27);
  -[PIParallaxColorAnalysisRequest setMaxDominantColors:](v47, "setMaxDominantColors:", 1);
  -[NURenderRequest setResponseQueue:](v47, "setResponseQueue:", self->_queue);
  -[NURenderRequest setRenderContext:](v47, "setRenderContext:", self->_renderContext);
  -[NURenderRequest setPriority:](v47, "setPriority:", v28);
  v79[0] = v34;
  v79[1] = 3221225472;
  v79[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_120;
  v79[3] = &unk_1E5019538;
  v79[4] = buf;
  -[PIParallaxColorAnalysisRequest submit:](v47, "submit:", v79);
  v48 = (void *)MEMORY[0x1E0D52290];
  queue = self->_queue;
  v75[0] = v34;
  v75[1] = 3221225472;
  v75[2] = __50__PISegmentationLoader__analyzeColors_completion___block_invoke_121;
  v75[3] = &unk_1E50190F8;
  v76 = v6;
  v78 = buf;
  v77 = v7;
  objc_msgSend(v48, "commitAndNotifyOnQueue:withBlock:", queue, v75);

  _Block_object_dispose(buf, 8);
LABEL_5:

}

- (void)_loadBackground:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  PIParallaxInfillRequest *v14;
  void *v15;
  PIParallaxInfillRequest *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  void (**v36)(_QWORD);
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "segmentationBackground");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || self->_isCancelled)
    goto LABEL_8;
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "segmentationInfillAlgorithm");

  v11 = v10 == 5 || v10 == 0;
  if (v11
    || (objc_msgSend(v6, "segmentationMatte"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
LABEL_8:
    v7[2](v7);
  }
  else
  {
    objc_msgSend(v6, "composition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      NUAssertLogger_17881();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing composition"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v22;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v23 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_17881();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          v29 = dispatch_get_specific(*v23);
          v30 = (void *)MEMORY[0x1E0CB3978];
          v31 = v29;
          objc_msgSend(v30, "callStackSymbols");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v29;
          v39 = 2114;
          v40 = v33;
          _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v28;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler();
    }
    v14 = [PIParallaxInfillRequest alloc];
    objc_msgSend(v6, "composition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PIParallaxInfillRequest initWithComposition:](v14, "initWithComposition:", v15);

    objc_msgSend(v6, "segmentationMatte");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxInfillRequest setSegmentationMatte:](v16, "setSegmentationMatte:", v17);

    v18 = objc_msgSend(v6, "classification") == 3 || objc_msgSend(v6, "classification") == 4;
    -[PIParallaxInfillRequest setShouldInfillForeground:](v16, "setShouldInfillForeground:", v18);
    objc_msgSend((id)objc_opt_class(), "proxyScalePolicy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxInfillRequest setScalePolicy:](v16, "setScalePolicy:", v19);

    -[NURenderRequest setResponseQueue:](v16, "setResponseQueue:", self->_queue);
    -[NURenderRequest setRenderContext:](v16, "setRenderContext:", self->_renderContext);
    objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPriority:](v16, "setPriority:", v20);

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __51__PISegmentationLoader__loadBackground_completion___block_invoke;
    v34[3] = &unk_1E5019E90;
    v35 = v6;
    v36 = v7;
    -[PIParallaxInfillRequest submit:](v16, "submit:", v34);

  }
}

- (void)_loadRegions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSArray *petsRegions;
  void *v28;
  NSArray *petsFaceRegions;
  void *v30;
  id v31;
  PFParallaxAsset *asset;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *queue;
  NSObject *v40;
  void *v41;
  const void **v42;
  void *specific;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD block[4];
  id v55;
  void (**v56)(_QWORD);
  uint64_t *v57;
  uint64_t *v58;
  _BYTE *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  NSObject *v68;
  _BYTE *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  _QWORD v73[5];
  NSObject *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  id *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  id *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  CGRect *v96;
  uint64_t v97;
  const char *v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  CGRect *v102;
  uint64_t v103;
  const char *v104;
  __int128 v105;
  __int128 v106;
  _BYTE buf[24];
  const char *v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  CGRect v112;

  v111 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "regions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || self->_isCancelled)
  {
    v7[2](v7);
  }
  else
  {
    objc_msgSend(v6, "composition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      NUAssertLogger_17881();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing composition"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v41;
        _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v42 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_17881();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v45)
        {
          v48 = dispatch_get_specific(*v42);
          v49 = (void *)MEMORY[0x1E0CB3978];
          v50 = v48;
          objc_msgSend(v49, "callStackSymbols");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v52;
          _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v45)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v47;
        _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler();
      __break(1u);
    }
    v10 = dispatch_group_create();
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x4010000000;
    v108 = "";
    v109 = 0u;
    v110 = 0u;
    -[PFParallaxAsset acceptableCropRect](self->_asset, "acceptableCropRect");
    *(_QWORD *)&v109 = v12;
    *((_QWORD *)&v109 + 1) = v13;
    *(_QWORD *)&v110 = v14;
    *((_QWORD *)&v110 + 1) = v15;
    if (CGRectIsEmpty(*(CGRect *)(*(_QWORD *)&buf[8] + 32)))
    {
      v16 = objc_alloc_init(MEMORY[0x1E0CEDF28]);
      objc_msgSend(v11, "addObject:", v16);
    }
    else
    {
      v16 = 0;
    }
    v101 = 0;
    v102 = (CGRect *)&v101;
    v103 = 0x4010000000;
    v104 = "";
    v105 = 0u;
    v106 = 0u;
    -[PFParallaxAsset preferredCropRect](self->_asset, "preferredCropRect");
    *(_QWORD *)&v105 = v17;
    *((_QWORD *)&v105 + 1) = v18;
    *(_QWORD *)&v106 = v19;
    *((_QWORD *)&v106 + 1) = v20;
    if (CGRectIsEmpty(v102[1]))
    {
      v21 = objc_alloc_init(MEMORY[0x1E0CEDF08]);
      objc_msgSend(v11, "addObject:", v21);
    }
    else
    {
      v21 = 0;
    }
    v95 = 0;
    v96 = (CGRect *)&v95;
    v97 = 0x4010000000;
    v98 = "";
    v22 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v99 = *MEMORY[0x1E0C9D628];
    v100 = v22;
    if (objc_msgSend(v6, "classification") == 1
      && (-[PFParallaxAsset gazeAreaRect](self->_asset, "gazeAreaRect"), v96[1] = v112, CGRectIsNull(v112)))
    {
      v23 = objc_alloc_init(MEMORY[0x1E0CEDE78]);
      objc_msgSend(v11, "addObject:", v23);
    }
    else
    {
      v23 = 0;
    }
    v89 = 0;
    v90 = &v89;
    v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__17900;
    v93 = __Block_byref_object_dispose__17901;
    v94 = 0;
    if (objc_msgSend(v6, "classification", v16) == 1
      && (-[PFParallaxAsset faceRegions](self->_asset, "faceRegions"),
          v24 = objc_claimAutoreleasedReturnValue(),
          v25 = (void *)v90[5],
          v90[5] = v24,
          v25,
          !v90[5]))
    {
      v26 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
      objc_msgSend(v11, "addObject:", v26);
    }
    else
    {
      v26 = 0;
    }
    v83 = 0;
    v84 = (id *)&v83;
    v85 = 0x3032000000;
    v86 = __Block_byref_object_copy__17900;
    v87 = __Block_byref_object_dispose__17901;
    v88 = 0;
    v77 = 0;
    v78 = (id *)&v77;
    v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__17900;
    v81 = __Block_byref_object_dispose__17901;
    v82 = 0;
    if (objc_msgSend(v6, "classification") == 2)
    {
      petsRegions = self->_petsRegions;
      if (petsRegions)
      {
        v28 = self->_petsRegions;
      }
      else
      {
        -[PFParallaxAsset petRegions](self->_asset, "petRegions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong(v84 + 5, v28);
      if (!petsRegions)

      petsFaceRegions = self->_petsFaceRegions;
      if (petsFaceRegions)
      {
        v30 = self->_petsFaceRegions;
      }
      else
      {
        -[PFParallaxAsset faceRegions](self->_asset, "faceRegions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong(v78 + 5, v30);
      if (!petsFaceRegions)

      if ((!v84[5] || !v78[5]) && !-[PISegmentationLoader disableRendering](self, "disableRendering") && self->_asset)
      {
        dispatch_group_enter(v10);
        v31 = objc_alloc_init(MEMORY[0x1E0D75158]);
        objc_msgSend(v31, "setNeedsInProcessHandling:", -[PISegmentationLoader performMediaAnalysisInProcess](self, "performMediaAnalysisInProcess"));
        asset = self->_asset;
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __48__PISegmentationLoader__loadRegions_completion___block_invoke;
        v73[3] = &unk_1E5019120;
        v73[4] = self;
        v75 = &v83;
        v76 = &v77;
        v74 = v10;
        self->_petsRequestID = -[PFParallaxAsset loadPetsRegionsWithOptions:resultHandler:](asset, "loadPetsRegionsWithOptions:resultHandler:", v31, v73);

      }
    }
    if (objc_msgSend(v11, "count") && !-[PISegmentationLoader disableRendering](self, "disableRendering"))
    {
      dispatch_group_enter(v10);
      v33 = objc_alloc(MEMORY[0x1E0D52350]);
      objc_msgSend(v6, "composition");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithComposition:", v34);

      objc_msgSend(v35, "setVisionRequests:", v11);
      objc_msgSend((id)objc_opt_class(), "proxyScalePolicy");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setScalePolicy:", v36);

      +[PIPhotoEditHelper pipelineFiltersForShowingOriginalWithGeometry](PIPhotoEditHelper, "pipelineFiltersForShowingOriginalWithGeometry");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPipelineFilters:", v37);

      objc_msgSend(v35, "setResponseQueue:", self->_queue);
      objc_msgSend(v35, "setRenderContext:", self->_renderContext);
      objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPriority:", v38);

      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __48__PISegmentationLoader__loadRegions_completion___block_invoke_131;
      v63[3] = &unk_1E5019148;
      v64 = v53;
      v69 = buf;
      v65 = v21;
      v70 = &v101;
      v66 = v26;
      v71 = &v89;
      v67 = v23;
      v72 = &v95;
      v68 = v10;
      objc_msgSend(v35, "submit:", v63);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PISegmentationLoader__loadRegions_completion___block_invoke_134;
    block[3] = &unk_1E5019170;
    v57 = &v89;
    v58 = &v77;
    v59 = buf;
    v60 = &v101;
    v61 = &v95;
    v62 = &v83;
    v55 = v6;
    v56 = v7;
    dispatch_group_notify(v10, queue, block);

    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(&v83, 8);

    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v95, 8);

    _Block_object_dispose(&v101, 8);
    _Block_object_dispose(buf, 8);

  }
}

- (id)_defaultLayoutRequestForItem:(id)a3
{
  id v4;
  void *v5;
  PIPosterLayoutRequest *v6;
  void *v7;
  PIPosterLayoutRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_17881();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing composition"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v29, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v24;
        v31 = 2114;
        v32 = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v29, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v29, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = [PIPosterLayoutRequest alloc];
  objc_msgSend(v4, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PIPosterLayoutRequest initWithComposition:](v6, "initWithComposition:", v7);

  -[PISegmentationLoader layoutProvider](self, "layoutProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPosterLayoutRequest setLayoutProvider:](v8, "setLayoutProvider:", v9);

  -[PISegmentationLoader layoutConfiguration](self, "layoutConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPosterLayoutRequest setLayoutConfiguration:](v8, "setLayoutConfiguration:", v10);

  objc_msgSend(v4, "regions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPosterLayoutRequest setLayoutRegions:](v8, "setLayoutRegions:", v11);

  objc_msgSend(v4, "segmentationMatte");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPosterLayoutRequest setSegmentationMatte:](v8, "setSegmentationMatte:", v12);

  objc_msgSend(v4, "segmentationConfidenceMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPosterLayoutRequest setSegmentationConfidenceMap:](v8, "setSegmentationConfidenceMap:", v13);

  -[PIPosterLayoutRequest setSegmentationClassification:](v8, "setSegmentationClassification:", objc_msgSend(v4, "classification"));
  -[NURenderRequest setResponseQueue:](v8, "setResponseQueue:", self->_queue);
  -[NURenderRequest setRenderContext:](v8, "setRenderContext:", self->_renderContext);
  objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setPriority:](v8, "setPriority:", v14);

  return v8;
}

- (void)refreshSegmentationItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  dispatch_group_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t signpost;
  id v17;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(id, id);
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_17881();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "[item isKindOfClass:PIParallaxSegmentationItem.class]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        v36 = 2114;
        v37 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend(v6, "layoutConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISegmentationLoader layoutConfiguration](self, "layoutConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToLayoutConfiguration:", v9);

  if (v10)
  {
    v7[2](v7, v6);
  }
  else
  {
    v11 = (void *)objc_msgSend(v6, "copy");
    v12 = dispatch_group_create();
    objc_msgSend(v11, "setOriginalLayout:", 0);
    objc_msgSend(v11, "setColorAnalysis:", 0);
    -[PISegmentationLoader currentContextInfo](self, "currentContextInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContextInfo:", v13);

    v14 = (id)s_log_17878;
    v15 = v14;
    signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v15, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.refresh", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __59__PISegmentationLoader_refreshSegmentationItem_completion___block_invoke;
    v31[3] = &unk_1E5018E10;
    v31[4] = self;
    v32 = v11;
    v33 = v7;
    v17 = v11;
    -[PISegmentationLoader _loadSegmentationData:layoutGroup:completion:](self, "_loadSegmentationData:layoutGroup:completion:", v17, v12, v31);

  }
}

- (void)_performLayout:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *queue;
  _QWORD block[4];
  void (**v19)(id, _QWORD);
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "originalLayout");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    if ((PFPosterEnableHeadroom() & 1) != 0)
    {
      objc_msgSend(v6, "headroomLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_4;
    }
    else
    {

    }
LABEL_11:
    v7[2](v7, 0);
    goto LABEL_12;
  }
LABEL_4:
  if (self->_isCancelled || -[PISegmentationLoader disableRendering](self, "disableRendering"))
    goto LABEL_11;
  v11 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__17900;
  v32[4] = __Block_byref_object_dispose__17901;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__17900;
  v30[4] = __Block_byref_object_dispose__17901;
  v31 = 0;
  dispatch_group_enter(v11);
  -[PISegmentationLoader _defaultLayoutRequestForItem:](self, "_defaultLayoutRequestForItem:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __50__PISegmentationLoader__performLayout_completion___block_invoke;
  v26[3] = &unk_1E5019198;
  v14 = v6;
  v27 = v14;
  v29 = v32;
  v15 = v11;
  v28 = v15;
  objc_msgSend(v12, "submit:", v26);

  if (PFPosterEnableHeadroom() && !self->_disableHeadroomLayout)
  {
    dispatch_group_enter(v15);
    -[PISegmentationLoader _defaultLayoutRequestForItem:](self, "_defaultLayoutRequestForItem:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShouldConsiderHeadroom:", 1);
    objc_msgSend(v16, "setShouldComputeAllScores:", 0);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __50__PISegmentationLoader__performLayout_completion___block_invoke_137;
    v22[3] = &unk_1E5019198;
    v23 = v14;
    v25 = v30;
    v24 = v15;
    objc_msgSend(v16, "submit:", v22);

  }
  queue = self->_queue;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __50__PISegmentationLoader__performLayout_completion___block_invoke_138;
  block[3] = &unk_1E5019560;
  v19 = v7;
  v20 = v30;
  v21 = v32;
  dispatch_group_notify(v15, queue, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

LABEL_12:
}

- (void)_performSettlingEffectLayout:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "settlingEffectLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || self->_isCancelled || -[PISegmentationLoader disableRendering](self, "disableRendering"))
  {
    v7[2](v7, 0);
  }
  else
  {
    -[PISegmentationLoader _defaultLayoutRequestForItem:](self, "_defaultLayoutRequestForItem:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldComputeAllScores:", 0);
    objc_msgSend(v9, "setShouldConstrainLayoutToBounds:", 1);
    objc_msgSend(v6, "settlingEffectNormalizedBounds");
    objc_msgSend(v9, "setNormalizedLayoutBounds:");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__PISegmentationLoader__performSettlingEffectLayout_completion___block_invoke;
    v10[3] = &unk_1E5019E90;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v9, "submit:", v10);

  }
}

- (void)_updateItem:(id)a3 withSettlingEffectGatingFailures:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "scores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D75820];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D75820]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 | a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateScores:", v11);

}

- (void)_loadLocalLightData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  void (**v30)(_QWORD);
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NUAssertLogger_17881();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "item.composition != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v23;
        v33 = 2114;
        v34 = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend(v6, "localLightData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || self->_isCancelled || -[PISegmentationLoader disableRendering](self, "disableRendering"))
  {
    v7[2](v7);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0D52140]);
    objc_msgSend(v6, "composition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithComposition:dataExtractor:options:", v11, CFSTR("CILocalLight"), 0);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x40000);
    objc_msgSend(v12, "setScalePolicy:", v13);

    objc_msgSend(v12, "setSampleMode:", 1);
    objc_msgSend(v12, "setResponseQueue:", self->_queue);
    objc_msgSend(v12, "setRenderContext:", self->_renderContext);
    objc_msgSend((id)objc_opt_class(), "renderPriorityForResourcePriority:", -[PISegmentationLoader priority](self, "priority"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPriority:", v14);

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __55__PISegmentationLoader__loadLocalLightData_completion___block_invoke;
    v28[3] = &unk_1E5019E90;
    v29 = v6;
    v30 = v7;
    objc_msgSend(v12, "submit:", v28);

  }
}

- (id)_tryLoadSegmentationItemFromCache:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  PIParallaxSegmentationItem *v8;
  void *specific;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t signpost;
  PIParallaxSegmentationItem *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  int v24;
  int v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  _BYTE v60[10];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_17881();
    v53 = objc_claimAutoreleasedReturnValue();
    v15 = &unk_1A64D6000;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "currentInfo != nil");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v60 = v54;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (PIParallaxSegmentationItem *)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v5 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        specific = dispatch_get_specific(v13->super.isa);
        v56 = (void *)MEMORY[0x1E0CB3978];
        v15 = specific;
        objc_msgSend(v56, "callStackSymbols");
        v13 = (PIParallaxSegmentationItem *)objc_claimAutoreleasedReturnValue();
        -[PIParallaxSegmentationItem componentsJoinedByString:](v13, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v60 = specific;
        *(_WORD *)&v60[8] = 2114;
        v61 = (uint64_t)v57;
        _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (PIParallaxSegmentationItem *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v60 = v13;
      _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    goto LABEL_61;
  }
  v5 = v4;
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "segmentationDisableCaching") & 1) == 0)
  {
    v7 = -[PISegmentationLoader disableCache](self, "disableCache");

    if (v7)
      goto LABEL_5;
    -[PFParallaxAsset segmentationResourceURL](self->_asset, "segmentationResourceURL");
    specific = (void *)objc_claimAutoreleasedReturnValue();
    if (!specific)
    {
      v8 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v10 = (id)s_log_17878;
    v11 = v10;
    signpost = self->_signpost;
    if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v11, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PISegmentationLoader.data.read", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    v13 = objc_alloc_init(PIParallaxSegmentationItem);
    v58 = 0;
    v14 = -[PIParallaxSegmentationItem loadSegmentationDataFromURL:error:](v13, "loadSegmentationDataFromURL:error:", specific, &v58);
    v15 = v58;
    v16 = (id)s_log_17878;
    v17 = v16;
    v18 = self->_signpost;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PISegmentationLoader.data.read", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    if (v14)
    {
      -[PIParallaxSegmentationItem contextInfo](v13, "contextInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "version");
      if (v20 == -[NSObject version](v5, "version"))
      {
        v21 = objc_msgSend(v19, "sourceMode");
        if (v21 == -[NSObject sourceMode](v5, "sourceMode"))
        {
          v22 = objc_msgSend(v19, "segmentationDisabled");
          if (v22 != -[NSObject segmentationDisabled](v5, "segmentationDisabled"))
          {
            NULogger_17889();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = objc_msgSend(v19, "segmentationDisabled");
              v25 = -[NSObject segmentationDisabled](v5, "segmentationDisabled");
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v60 = v24;
              *(_WORD *)&v60[4] = 1024;
              *(_DWORD *)&v60[6] = v25;
              v26 = "Cached segmentation disabled flag mismatch: got %d, expected %d";
              v27 = v23;
              v28 = 14;
LABEL_31:
              _os_log_impl(&dword_1A6382000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
            }
LABEL_32:

LABEL_33:
            v8 = 0;
LABEL_34:

LABEL_35:
            goto LABEL_36;
          }
          v36 = objc_msgSend(v19, "infillAlgorithm");
          if (v36 == -[NSObject infillAlgorithm](v5, "infillAlgorithm"))
          {
            objc_msgSend(v19, "layoutConfiguration");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject layoutConfiguration](v5, "layoutConfiguration");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v37, "isEqualToLayoutConfiguration:", v38);

            if ((v39 & 1) == 0)
            {
              NULogger_17889();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v19, "layoutConfiguration");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject layoutConfiguration](v5, "layoutConfiguration");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)v60 = v46;
                *(_WORD *)&v60[8] = 2114;
                v61 = (uint64_t)v47;
                _os_log_impl(&dword_1A6382000, v23, OS_LOG_TYPE_INFO, "Cached segmentation layout configuration mismatch: got %{public}@, expected %{public}@", buf, 0x16u);

              }
              goto LABEL_32;
            }
            if (-[PISegmentationLoader classification](self, "classification"))
            {
              v40 = -[PISegmentationLoader classification](self, "classification");
              if (v40 != -[PIParallaxSegmentationItem classification](v13, "classification"))
              {
                NULogger_17889();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  -[PIParallaxSegmentationItem classification](v13, "classification");
                  PFPosterClassificationName();
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PISegmentationLoader classification](self, "classification");
                  PFPosterClassificationName();
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)v60 = v51;
                  *(_WORD *)&v60[8] = 2114;
                  v61 = (uint64_t)v52;
                  _os_log_impl(&dword_1A6382000, v50, OS_LOG_TYPE_INFO, "Cached segmentation classification mismatch: got %{public}@, expected %{public}@", buf, 0x16u);

                }
                goto LABEL_33;
              }
            }
            v41 = -[NSObject role](v5, "role");
            if (v41 == objc_msgSend(v19, "role"))
            {
              v8 = v13;
              goto LABEL_34;
            }
            NULogger_17889();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              goto LABEL_32;
            v48 = -[NSObject role](v5, "role");
            v49 = objc_msgSend(v19, "role");
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v60 = v48;
            *(_WORD *)&v60[8] = 2048;
            v61 = v49;
            v26 = "Cached segmentation role mismatch: got %ld, expected %ld";
          }
          else
          {
            NULogger_17889();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              goto LABEL_32;
            v42 = objc_msgSend(v19, "infillAlgorithm");
            v43 = -[NSObject infillAlgorithm](v5, "infillAlgorithm");
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v60 = v42;
            *(_WORD *)&v60[8] = 2048;
            v61 = v43;
            v26 = "Cached segmentation infill algorithm mismatch: got %ld, expected %ld";
          }
        }
        else
        {
          NULogger_17889();
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            goto LABEL_32;
          v33 = objc_msgSend(v19, "sourceMode");
          v34 = -[NSObject sourceMode](v5, "sourceMode");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v60 = v33;
          *(_WORD *)&v60[8] = 2048;
          v61 = v34;
          v26 = "Cached segmentation source mode mismatch: got %ld, expected %ld";
        }
      }
      else
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
        v30 = (void *)*MEMORY[0x1E0D52398];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
          goto LABEL_33;
        v23 = v30;
        v31 = objc_msgSend(v19, "version");
        v32 = -[NSObject version](v5, "version");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v60 = v31;
        *(_WORD *)&v60[8] = 2048;
        v61 = v32;
        v26 = "Cached segmentation version mismatch: got %ld, expected %ld";
      }
      v27 = v23;
      v28 = 22;
      goto LABEL_31;
    }
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_21:
      v29 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v44 = v29;
        objc_msgSend(specific, "path");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v60 = v45;
        *(_WORD *)&v60[8] = 2114;
        v61 = (uint64_t)v15;
        _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Failed to read cached segmentation data from: %{public}@, error: %{public}@", buf, 0x16u);

      }
      v8 = 0;
      goto LABEL_35;
    }
LABEL_61:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    goto LABEL_21;
  }

LABEL_5:
  v8 = 0;
LABEL_37:

  return v8;
}

- (void)_cacheSegmentationDataForItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PISegmentationLoader *v14;

  v4 = a3;
  if (v4 && !self->_isCancelled && !self->_loadingError)
  {
    v11 = v4;
    +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "segmentationDisableCaching") & 1) != 0)
    {
LABEL_5:

      return;
    }
    v6 = -[PISegmentationLoader disableCache](self, "disableCache");

    v4 = v11;
    if (!v6)
    {
      objc_msgSend(v11, "segmentationDataURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v11;
      if (!v7)
      {
        -[PISegmentationLoader asset](self, "asset");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "supportsSegmentationResourceCaching");

        v4 = v11;
        if (v9)
        {
          -[PISegmentationLoader asset](self, "asset");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __54__PISegmentationLoader__cacheSegmentationDataForItem___block_invoke;
          v12[3] = &unk_1E50191E8;
          v13 = v11;
          v14 = self;
          objc_msgSend(v10, "updateSegmentationResource:", v12);

          v5 = v13;
          goto LABEL_5;
        }
      }
    }
  }

}

- (PFParallaxAsset)asset
{
  return self->_asset;
}

- (int64_t)sourceMode
{
  return self->_sourceMode;
}

- (void)setSourceMode:(int64_t)a3
{
  self->_sourceMode = a3;
}

- (unint64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(unint64_t)a3
{
  self->_classification = a3;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConfiguration, a3);
}

- (BOOL)disableSegmentation
{
  return self->_disableSegmentation;
}

- (void)setDisableSegmentation:(BOOL)a3
{
  self->_disableSegmentation = a3;
}

- (BOOL)disableRendering
{
  return self->_disableRendering;
}

- (void)setDisableRendering:(BOOL)a3
{
  self->_disableRendering = a3;
}

- (BOOL)disableSettlingEffect
{
  return self->_disableSettlingEffect;
}

- (void)setDisableSettlingEffect:(BOOL)a3
{
  self->_disableSettlingEffect = a3;
}

- (PIPosterLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (void)setLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_layoutProvider, a3);
}

- (BOOL)disableCache
{
  return self->_disableCache;
}

- (void)setDisableCache:(BOOL)a3
{
  self->_disableCache = a3;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (BOOL)performMediaAnalysisInProcess
{
  return self->_performMediaAnalysisInProcess;
}

- (void)setPerformMediaAnalysisInProcess:(BOOL)a3
{
  self->_performMediaAnalysisInProcess = a3;
}

- (int64_t)settlingEffectGatingLevel
{
  return self->_settlingEffectGatingLevel;
}

- (void)setSettlingEffectGatingLevel:(int64_t)a3
{
  self->_settlingEffectGatingLevel = a3;
}

- (BOOL)proxyOnly
{
  return self->_proxyOnly;
}

- (void)setProxyOnly:(BOOL)a3
{
  self->_proxyOnly = a3;
}

- (BOOL)disableDownload
{
  return self->_disableDownload;
}

- (void)setDisableDownload:(BOOL)a3
{
  self->_disableDownload = a3;
}

- (BOOL)disableHeadroomLayout
{
  return self->_disableHeadroomLayout;
}

- (void)setDisableHeadroomLayout:(BOOL)a3
{
  self->_disableHeadroomLayout = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSArray)petsRegions
{
  return self->_petsRegions;
}

- (void)setPetsRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)petsFaceRegions
{
  return self->_petsFaceRegions;
}

- (void)setPetsFaceRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)downloadProgressHandler
{
  return self->_downloadProgressHandler;
}

- (void)setDownloadProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)loadingHandler
{
  return self->_loadingHandler;
}

- (void)setLoadingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (OS_dispatch_queue)loadingHandlerQueue
{
  return self->_loadingHandlerQueue;
}

- (void)setLoadingHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loadingHandlerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingHandlerQueue, 0);
  objc_storeStrong(&self->_loadingHandler, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong((id *)&self->_petsFaceRegions, 0);
  objc_storeStrong((id *)&self->_petsRegions, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __54__PISegmentationLoader__cacheSegmentationDataForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)s_log_17878;
  v5 = v4;
  v6 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PISegmentationLoader.data.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  v19 = 0;
  v8 = objc_msgSend(v7, "saveSegmentationDataToURL:error:", v3, &v19);
  v9 = v19;
  v10 = (id)s_log_17878;
  v11 = v10;
  v12 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PISegmentationLoader.data.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if ((v8 & 1) == 0)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v13 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 40);
      v16 = v13;
      objc_msgSend(v15, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2114;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Failed to save segmentation data for asset: %{public}@, error:%{public}@", buf, 0x16u);

    }
  }

  return v8;
}

void __55__PISegmentationLoader__loadLocalLightData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Local light data response: %{public}@", buf, 0xCu);
  }
  v11 = 0;
  objc_msgSend(v3, "result:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLocalLightData:", v9);

  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Failed to compute local light data: %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __64__PISegmentationLoader__performSettlingEffectLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Poster settling effect layout response: %{public}@", buf, 0xCu);
  }
  v15 = 0;
  objc_msgSend(v3, "result:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    objc_msgSend(v7, "scores");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D757A0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    v16 = *MEMORY[0x1E0D75828];
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateScores:", v12);

    objc_msgSend(v7, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSettlingEffectLayout:", v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v8;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Failed to layout item: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __50__PISegmentationLoader__performLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Poster original layout response: %{public}@", buf, 0xCu);
  }
  v15 = 0;
  objc_msgSend(v3, "result:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "scores");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateScores:", v10);

    objc_msgSend(v7, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setOriginalLayout:", v11);
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Failed to layout item: %{public}@", buf, 0xCu);
    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = v8;
    v11 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__PISegmentationLoader__performLayout_completion___block_invoke_137(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Poster headroom layout response: %{public}@", buf, 0xCu);
  }
  v13 = 0;
  objc_msgSend(v3, "result:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    objc_msgSend(v7, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHeadroomLayout:", v9);
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Failed to layout item with headroom: %{public}@", buf, 0xCu);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = v8;
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__PISegmentationLoader__performLayout_completion___block_invoke_138(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  if (!v3)
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __59__PISegmentationLoader_refreshSegmentationItem_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.refresh", (const char *)&unk_1A650ABB5, v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __48__PISegmentationLoader__loadRegions_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  os_log_t *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  v11 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v12 = (os_log_t *)MEMORY[0x1E0D52398];
  v13 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1A6382000, v13, OS_LOG_TYPE_DEFAULT, "MAD pets results: %@, pets face results: %@, error: %@", (uint8_t *)&v15, 0x20u);
  }
  if (v8 && v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  else
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v14 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v10;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Failed to load pets regions: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __48__PISegmentationLoader__loadRegions_completion___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  _OWORD *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  CGRect *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  CGRect *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  id v99;
  uint64_t v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v100 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (NSObject **)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v99 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Vision detection response: %@", buf, 0xCu);
  }
  v93 = 0;
  objc_msgSend(v3, "result:", &v93);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v93;
  if (v7)
  {
    v75 = v3;
    v9 = *(void **)(a1 + 32);
    v10 = (_OWORD *)MEMORY[0x1E0C9D628];
    if (v9)
    {
      v11 = v8;
      objc_msgSend(v9, "results");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v15 = v10[1];
      *(_OWORD *)(v14 + 32) = *v10;
      *(_OWORD *)(v14 + 48) = v15;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      objc_msgSend(v13, "salientObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v90 != v19)
              objc_enumerationMutation(v16);
            v21 = *(CGRect **)(*(_QWORD *)(a1 + 72) + 8);
            objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "boundingBox");
            v101.origin.x = v22;
            v101.origin.y = v23;
            v101.size.width = v24;
            v101.size.height = v25;
            *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = CGRectUnion(v21[1], v101);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        }
        while (v18);
      }

      v8 = v11;
    }
    v26 = *(void **)(a1 + 40);
    if (v26)
    {
      objc_msgSend(v26, "results");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v30 = v10[1];
      *(_OWORD *)(v29 + 32) = *v10;
      *(_OWORD *)(v29 + 48) = v30;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      objc_msgSend(v28, "salientObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v86;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v86 != v34)
              objc_enumerationMutation(v31);
            v36 = *(CGRect **)(*(_QWORD *)(a1 + 80) + 8);
            objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "boundingBox");
            v102.origin.x = v37;
            v102.origin.y = v38;
            v102.size.width = v39;
            v102.size.height = v40;
            *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = CGRectUnion(v36[1], v102);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
        }
        while (v33);
      }

    }
    v41 = *(void **)(a1 + 48);
    v3 = v75;
    if (v41)
    {
      v73 = v8;
      v74 = v7;
      objc_msgSend(v41, "results");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v42, "count"));
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v44 = v42;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v82;
        do
        {
          for (k = 0; k != v46; ++k)
          {
            if (*(_QWORD *)v82 != v47)
              objc_enumerationMutation(v44);
            objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * k), "boundingBox");
            v80[0] = v49;
            v80[1] = v50;
            v80[2] = v51;
            v80[3] = v52;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v80, "{CGRect={CGPoint=dd}{CGSize=dd}}");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addObject:", v53);

          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
        }
        while (v46);
      }

      v54 = objc_msgSend(v43, "copy");
      v55 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v56 = *(void **)(v55 + 40);
      *(_QWORD *)(v55 + 40) = v54;

      v8 = v73;
      v7 = v74;
    }
    v57 = *(void **)(a1 + 56);
    if (v57)
    {
      objc_msgSend(v57, "results");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v77;
        do
        {
          for (m = 0; m != v60; ++m)
          {
            if (*(_QWORD *)v77 != v61)
              objc_enumerationMutation(v58);
            objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * m), "gaze");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "locationBounds");
            v65 = v64;
            v67 = v66;
            v69 = v68;
            v71 = v70;

            v103.origin.x = v65;
            v103.origin.y = v67;
            v103.size.width = v69;
            v103.size.height = v71;
            *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 96)+ 8)+ 32), v103);
          }
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
        }
        while (v60);
      }

    }
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v72 = *v5;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v99 = v8;
      _os_log_error_impl(&dword_1A6382000, v72, OS_LOG_TYPE_ERROR, "Failed to run face/saliency detection: %{public}@", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __48__PISegmentationLoader__loadRegions_completion___block_invoke_134(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;
  PISegmentationLayoutRegions *v6;
  double *v7;
  double *v8;
  _QWORD *v9;
  PISegmentationLayoutRegions *v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v4 = v5;
  if (!v5)
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_storeStrong(v3, v4);
  v6 = [PISegmentationLayoutRegions alloc];
  v7 = *(double **)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(double **)(*(_QWORD *)(a1 + 72) + 8);
  v9 = *(_QWORD **)(*(_QWORD *)(a1 + 80) + 8);
  v10 = -[PISegmentationLayoutRegions initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:](v6, "initWithAcceptableRect:preferredRect:gazeAreaRect:faces:pets:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v7[4], v7[5], v7[6], v7[7], v8[4], v8[5], v8[6], v8[7], v9[4], v9[5], v9[6], v9[7]);
  objc_msgSend(*(id *)(a1 + 32), "setRegions:", v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __51__PISegmentationLoader__loadBackground_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Parallax infill response: %@", buf, 0xCu);
  }
  v11 = 0;
  objc_msgSend(v3, "result:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v7, "infilledImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSegmentationBackground:", v9);

  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Parallax infill failed: %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Full Image color analysis response: %@", buf, 0xCu);
  }
  v12 = 0;
  objc_msgSend(v3, "result:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v7, "medianLuminance");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setLuminance:");
    objc_msgSend(v7, "dominantColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setColors:", v9);
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Full Image color analysis failed: %{public}@", buf, 0xCu);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;
  }

}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Foreground color analysis response: %@", buf, 0xCu);
  }
  v12 = 0;
  objc_msgSend(v3, "result:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v7, "medianLuminance");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setForegroundLuminance:");
    objc_msgSend(v7, "dominantColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setForegroundColors:", v9);
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Foreground color analysis failed: %{public}@", buf, 0xCu);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;
  }

}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke_119(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Background color analysis response: %@", buf, 0xCu);
  }
  v12 = 0;
  objc_msgSend(v3, "result:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v7, "medianLuminance");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setBackgroundLuminance:");
    objc_msgSend(v7, "dominantColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setBackgroundColors:", v9);
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Background color analysis failed: %{public}@", buf, 0xCu);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;
  }

}

void __50__PISegmentationLoader__analyzeColors_completion___block_invoke_120(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Clock area Image color analysis response: %@", buf, 0xCu);
  }
  v12 = 0;
  objc_msgSend(v3, "result:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v7, "dominantColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setClockAreaColors:", v9);
  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Full Image color analysis failed: %{public}@", buf, 0xCu);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;
  }

}

uint64_t __50__PISegmentationLoader__analyzeColors_completion___block_invoke_121(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "segmentationMatte");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "luminance");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setBackgroundLuminance:");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "colors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setBackgroundColors:", v3);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "backgroundLuminance");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setForegroundLuminance:");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "backgroundColors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setForegroundColors:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "setColorAnalysis:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61__PISegmentationLoader__performSegmentation_type_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Image segmentation response: %@", buf, 0xCu);
  }
  v13 = 0;
  objc_msgSend(v3, "result:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "matteImageBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confidenceMapBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);

  }
  else
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Image segmentation failed: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

BOOL __44__PISegmentationLoader__segment_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D52110]);
  objc_msgSend(v7, "computeHistogramFromMatteBuffer:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PISegmentationHelper matteHistogramIndicatesSubjectDetected:](PISegmentationHelper, "matteHistogramIndicatesSubjectDetected:", v8);
  if (v9 && objc_msgSend(*(id *)(a1 + 32), "_isValidSegmentationMatteHistogramForDepth:", v8))
  {
    objc_msgSend(*(id *)(a1 + 40), "setSegmentationMatte:", v5);
    objc_msgSend(*(id *)(a1 + 40), "setSegmentationConfidenceMap:", v6);
  }

  return v9;
}

uint64_t __44__PISegmentationLoader__segment_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v6 = (void *)a1[4];
  v5 = a1[5];
  v7 = a3;
  v8 = a2;
  (*(void (**)(uint64_t, id, id, uint64_t))(v5 + 16))(v5, v8, v7, objc_msgSend(v6, "classification"));

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __44__PISegmentationLoader__segment_completion___block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setClassification:", 3);
  }
  else
  {
    objc_msgSend(v3, "setClassification:", 5);
    objc_msgSend(*(id *)(a1 + 32), "setSegmentationMatte:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setSegmentationConfidenceMap:", 0);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __45__PISegmentationLoader__classify_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t j;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  uint64_t v35;
  NSObject **v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v5 = (NSObject **)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Vision detection response: %@", buf, 0xCu);
  }
  v50 = 0;
  objc_msgSend(v3, "result:", &v50);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v50;
  if (v7)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    v11 = (double *)MEMORY[0x1E0D71130];
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v47;
      v14 = *MEMORY[0x1E0D71130];
      v15 = *(double *)(MEMORY[0x1E0D71130] + 8);
      v16 = -1.0;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v47 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "boundingBox");
          if (v18 == 0.0 || v19 == 0.0 || (v19 == v15 ? (v20 = v18 == v14) : (v20 = 0), v20))
            v21 = 0.0;
          else
            v21 = v18 * v19;
          if (v21 > v16)
            v16 = v21;
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v12);
    }
    else
    {
      v16 = -1.0;
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "results", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v43;
      v27 = *v11;
      v28 = v11[1];
      v29 = -1.0;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "boundingBox");
          if (v31 == 0.0 || v32 == 0.0 || (v32 == v28 ? (v33 = v31 == v27) : (v33 = 0), v33))
            v34 = 0.0;
          else
            v34 = v31 * v32;
          if (v34 > v29)
            v29 = v34;
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v25);

      if (v16 <= 0.0)
      {
        v36 = (NSObject **)MEMORY[0x1E0D52398];
        if (v29 <= 0.0)
          goto LABEL_54;
        v35 = 2;
      }
      else
      {
        v35 = 1;
        v36 = (NSObject **)MEMORY[0x1E0D52398];
      }
    }
    else
    {

      v36 = (NSObject **)MEMORY[0x1E0D52398];
      if (v16 <= 0.0)
        goto LABEL_54;
      v35 = 1;
    }
    objc_msgSend(*(id *)(a1 + 48), "setClassification:", v35);
LABEL_54:
    if (objc_msgSend(*(id *)(a1 + 48), "classification"))
    {
      if (*v4 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v37 = *v36;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = *(void **)(a1 + 48);
        v39 = v37;
        objc_msgSend(v38, "classification");
        PFPosterClassificationName();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v40;
        _os_log_impl(&dword_1A6382000, v39, OS_LOG_TYPE_INFO, "Classified image as %{public}@", buf, 0xCu);

      }
    }
    else
    {
      if (*v4 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v41 = *v36;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6382000, v41, OS_LOG_TYPE_INFO, "Detectors failed to classify asset. Falling back to segmentation strategy.", buf, 2u);
      }
    }
    goto LABEL_63;
  }
  if (*v4 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v22 = *v5;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v8;
    _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Vision detection failed: %{public}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 48), "setClassification:", 5);
LABEL_63:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __52__PISegmentationLoader__loadMotionScore_completion___block_invoke(_QWORD *a1, void *a2, float a3)
{
  double v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = COERCE_DOUBLE(a2);
  v6 = (id)s_log_17878;
  v7 = v6;
  v8 = *(_QWORD *)(a1[4] + 8);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PISegmentationLoader.settlingEffect.motion", (const char *)&unk_1A650ABB5, (uint8_t *)&v17, 2u);
  }

  if (v5 == 0.0)
  {
    v12 = (void *)a1[5];
    v21 = *MEMORY[0x1E0D75830];
    *(float *)&v9 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateScores:", v14);

    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v15 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v16 = a1[6];
      v17 = 138543618;
      v18 = v16;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_INFO, "Loaded motion score for asset %{public}@: %.2f", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v11 = a1[6];
      v17 = 138543618;
      v18 = v11;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Failed to load motion score for asset %{public}@: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  PIParallaxAssetSettlingEffectOptions *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  PIParallaxAssetSettlingEffectOptions *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  PIParallaxAssetSettlingEffectOptions *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)s_log_17878;
  v5 = v4;
  v6 = *((_QWORD *)a1[4] + 1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.liveOriginal", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  objc_msgSend(a1[5], "livePhotoResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(PIParallaxAssetSettlingEffectOptions);
    -[PIParallaxAssetSettlingEffectOptions setIsInteractiveRequest:](v8, "setIsInteractiveRequest:", objc_msgSend(a1[4], "shouldUseInteractiveSettlingEffectGating"));
    -[PIParallaxAssetSettlingEffectOptions setNeedsInProcessHandling:](v8, "setNeedsInProcessHandling:", objc_msgSend(a1[4], "performMediaAnalysisInProcess"));
    objc_msgSend(a1[5], "settlingEffectVideoData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxAssetSettlingEffectOptions setLoadVideoStatusOnly:](v8, "setLoadVideoStatusOnly:", v9 != 0);

    v10 = (id)s_log_17878;
    v11 = v10;
    v12 = *((_QWORD *)a1[4] + 1);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PISegmentationLoader.settlingEffect.stabilize", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    objc_msgSend(a1[5], "livePhotoResource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_88;
    v17[3] = &unk_1E5019008;
    v17[4] = a1[4];
    v18 = a1[6];
    v19 = a1[5];
    v22 = a1[8];
    v20 = a1[7];
    v21 = v8;
    v14 = v8;
    *((_DWORD *)a1[4] + 10) = +[PIPosterSettlingEffectLoader loadCropRectWithResource:options:completion:](PIPosterSettlingEffectLoader, "loadCropRectWithResource:options:completion:", v13, v14, v17);

  }
  else
  {
    if (v3)
    {
      objc_msgSend(a1[4], "_updateItem:withSettlingEffectGatingFailures:", a1[5], 128);
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v15 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        v16 = a1[6];
        *(_DWORD *)buf = 138543362;
        v24 = v16;
        _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_INFO, "Skipping settling effect loading for asset %{public}@, not a Live Photo", buf, 0xCu);
      }
      objc_msgSend(a1[5], "setSettlingEffectStatus:", 1);
    }
    (*((void (**)(void))a1[8] + 2))();
  }

}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_88(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  _QWORD *v19;
  os_log_t *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[5];
  id v48;
  NSObject *v49;
  id v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  _QWORD block[5];
  id v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  __CFString *v64;
  uint64_t v65;
  CGRect v66;

  v65 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = (id)s_log_17878;
  v17 = v16;
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PISegmentationLoader.settlingEffect.stabilize", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v19 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v20 = (os_log_t *)MEMORY[0x1E0D52398];
  v21 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
  {
    v22 = v15;
    v23 = *(_QWORD *)(a1 + 40);
    v24 = v21;
    if ((unint64_t)(a2 - 1) > 4)
      v25 = CFSTR("unknown");
    else
      v25 = off_1E5015D58[a2 - 1];
    v26 = v25;
    *(_DWORD *)buf = 138543618;
    v62 = v23;
    v63 = 2114;
    v64 = v26;
    _os_log_impl(&dword_1A6382000, v24, OS_LOG_TYPE_INFO, "Settling effect status after L1 stabilization for asset %{public}@: %{public}@", buf, 0x16u);

    v15 = v22;
  }
  objc_msgSend(*(id *)(a1 + 48), "setSettlingEffectStatus:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_updateItem:withSettlingEffectGatingFailures:", *(_QWORD *)(a1 + 48), a3);
  v66.origin.x = a5;
  v66.origin.y = a6;
  v66.size.width = a7;
  v66.size.height = a8;
  if (CGRectIsNull(v66))
  {
    if (*v19 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v27 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
    {
      v44 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v62 = v44;
      v63 = 2114;
      v64 = v15;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Failed to compute a settling effect crop rect for asset %{public}@: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v28 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 48), "setSettlingEffectNormalizedBounds:", a5, a6, a7, a8);
    v29 = *(void **)(a1 + 48);
    v59 = *MEMORY[0x1E0D75838];
    v60 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "updateScores:", v30);

    dispatch_group_enter(v28);
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(NSObject **)(v31 + 16);
    v33 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_90;
    block[3] = &unk_1E5018F68;
    block[4] = v31;
    v34 = *(NSObject **)(a1 + 56);
    v56 = *(id *)(a1 + 48);
    v57 = *(id *)(a1 + 40);
    v35 = v28;
    v58 = v35;
    dispatch_group_notify(v34, v32, block);
    dispatch_group_enter(v35);
    v36 = (id)s_log_17878;
    v37 = v36;
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v38, "PISegmentationLoader.settlingEffect.video", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "livePhotoResource");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(a1 + 64);
    v47[0] = v33;
    v47[1] = 3221225472;
    v47[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_91;
    v47[3] = &unk_1E5018FE0;
    v47[4] = *(_QWORD *)(a1 + 32);
    v41 = *(id *)(a1 + 48);
    v51 = a5;
    v52 = a6;
    v53 = a7;
    v54 = a8;
    v48 = v41;
    v49 = v35;
    v50 = *(id *)(a1 + 40);
    v42 = v35;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = +[PIPosterSettlingEffectLoader loadVideoWithResource:options:completion:](PIPosterSettlingEffectLoader, "loadVideoWithResource:options:completion:", v39, v40, v47);

    v43 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v45[0] = v33;
    v45[1] = 3221225472;
    v45[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_99;
    v45[3] = &unk_1E5018F90;
    v46 = *(id *)(a1 + 72);
    dispatch_group_notify(v42, v43, v45);

  }
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_90(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_2;
  v4[3] = &unk_1E5018FB8;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_performSettlingEffectLayout:completion:", v3, v4);

}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_91(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  const void **v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t buf[4];
  NSObject *v53;
  __int16 v54;
  id v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  v11 = (id)s_log_17878;
  v12 = v11;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PISegmentationLoader.settlingEffect.video", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  objc_msgSend(*(id *)(a1 + 40), "setSettlingEffectStatus:", a3);
  objc_msgSend(*(id *)(a1 + 32), "_updateItem:withSettlingEffectGatingFailures:", *(_QWORD *)(a1 + 40), a4);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      v16 = objc_msgSend(v15, "removeItemAtURL:error:", v9, &v51);
      v17 = v51;

      if ((v16 & 1) == 0)
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
        v18 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v17;
          _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Failed to clean up settling effect video file: %@", buf, 0xCu);
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "settlingEffectVideoData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(*(id *)(a1 + 40), "setSettlingEffectVideoData:", v14);
        objc_msgSend(*(id *)(a1 + 40), "composition");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PISegmentationLoader livePhotoCompositionForVideoData:cropRect:photoComposition:](PISegmentationLoader, "livePhotoCompositionForVideoData:cropRect:photoComposition:", v14, v20, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setComposition:", v21);

      }
      v22 = objc_msgSend(*(id *)(a1 + 32), "shouldUseInteractiveSettlingEffectGating");
      v23 = objc_msgSend(*(id *)(a1 + 40), "settlingEffectStatus");
      v24 = v23;
      if (v22)
        v25 = 2;
      else
        v25 = 4;
      v26 = *(void **)(a1 + 40);
      v56 = *MEMORY[0x1E0D75840];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 > v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "updateScores:", v28);

      if (v24 > v25)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v29 = *(void **)(a1 + 32);
        v30 = *(_QWORD *)(a1 + 40);
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_95;
        v49[3] = &unk_1E50195F0;
        v50 = *(id *)(a1 + 48);
        objc_msgSend(v29, "_loadMotionScore:completion:", v30, v49);

      }
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v33 = (void *)*MEMORY[0x1E0D52398];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v34 = *(NSObject **)(a1 + 56);
      v17 = v33;
      objc_msgSend(v9, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v34;
      v54 = 2114;
      v55 = v35;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Failed to read settling effect video file for asset %{public}@ from path: %{public}@", buf, 0x16u);

    }
LABEL_27:

    goto LABEL_28;
  }
  if (a3 >= 2)
  {
    NUAssertLogger_17881();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No video should imply 'unknown' or 'unavailable'"));
      v37 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v37;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific(*v38);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v44;
        v54 = 2114;
        v55 = v48;
        _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v43;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v31 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    v32 = *(NSObject **)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    v53 = v32;
    v54 = 2114;
    v55 = v10;
    _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Failed to compute a settling effect for asset %{public}@: %{public}@", buf, 0x16u);
  }
LABEL_28:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_95(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PISegmentationLoader__loadSettlingEffect_layoutGroup_completion___block_invoke_2(uint64_t a1, void *a2)
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
  if (v3)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v4 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Failed to compute a settling effect layout for asset %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.classify", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v5 = (id)s_log_17878;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PISegmentationLoader.segment", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_79;
  v10[3] = &unk_1E5018F68;
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 32);
  v12 = v8;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v11, "_segment:completion:", v9, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_82(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint8_t buf[16];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PISegmentationLoader.layout", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v6 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_83;
  v7[3] = &unk_1E5018DC0;
  v7[4] = v6;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v6, "_performLayout:completion:", v8, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_85(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.localLightData", (const char *)&unk_1A650ABB5, v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id)s_log_17878;
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.layout", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v7 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v7, "_abort:", v3);
  }
  else
  {
    objc_msgSend(v7, "_handlePartialItem:loadingState:", *(_QWORD *)(a1 + 40), 2);
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    v8 = (id)s_log_17878;
    v9 = v8;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PISegmentationLoader.colorAnalysis", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_84;
    v13[3] = &unk_1E5018F40;
    v13[4] = v11;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v11, "_analyzeColors:completion:", v12, v13);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_84(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.colorAnalysis", (const char *)&unk_1A650ABB5, v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_79(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.segment", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v5 = (id)s_log_17878;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PISegmentationLoader.regions", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_80;
  v18[3] = &unk_1E5018F40;
  v9 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v19 = *(id *)(a1 + 32);
  v20 = v9;
  objc_msgSend(v19, "_loadRegions:completion:", v10, v18);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
  v11 = (id)s_log_17878;
  v12 = v11;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PISegmentationLoader.infill", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v14 = *(void **)(a1 + 32);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_81;
  v16[3] = &unk_1E5018F40;
  v16[4] = v14;
  v15 = *(_QWORD *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v14, "_loadBackground:completion:", v15, v16);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_80(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.regions", (const char *)&unk_1A650ABB5, v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__PISegmentationLoader__loadSegmentationData_layoutGroup_completion___block_invoke_81(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.infill", (const char *)&unk_1A650ABB5, v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__PISegmentationLoader__loadAssetResource_allowNetworkAccess_options_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a2;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(a1[4] + 28) = 0;
  if (v7)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v9 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v10 = a1[7];
      v11 = *(void **)(a1[4] + 80);
      v12 = v9;
      objc_msgSend(v11, "localIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", a1[5]);
      v25 = 134218498;
      v26 = v10;
      v27 = 2114;
      v28 = v13;
      v29 = 2048;
      v30 = v14;
      v15 = "Successfully loaded resource %ld for asset %{public}@ in %0.3fs";
LABEL_6:
      _os_log_impl(&dword_1A6382000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v25, 0x20u);
LABEL_7:

    }
  }
  else
  {
    v16 = *MEMORY[0x1E0D52390];
    if (v5)
    {
      if (v16 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v17 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v18 = a1[7];
        v19 = *(void **)(a1[4] + 80);
        v12 = v17;
        objc_msgSend(v19, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceDate:", a1[5]);
        v25 = 134218754;
        v26 = v18;
        v27 = 2114;
        v28 = v13;
        v29 = 2048;
        v30 = v20;
        v31 = 2114;
        v32 = v5;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Failed to load resource %ld for asset %{public}@ after %0.3fs, error: %{public}@", (uint8_t *)&v25, 0x2Au);
        goto LABEL_7;
      }
    }
    else
    {
      if (v16 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v21 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        v22 = a1[7];
        v23 = *(void **)(a1[4] + 80);
        v12 = v21;
        objc_msgSend(v23, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceDate:", a1[5]);
        v25 = 134218498;
        v26 = v22;
        v27 = 2114;
        v28 = v13;
        v29 = 2048;
        v30 = v24;
        v15 = "Cancelled loading resource %ld for asset %{public}@ after %0.3fs";
        goto LABEL_6;
      }
    }
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 || (objc_msgSend(*(id *)(a1 + 32), "disableDownload") & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadProgressHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setDownloadProgressHandler:", v7);

    if (objc_msgSend(*(id *)(a1 + 32), "priority"))
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
      v8 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        v9 = *(void **)(a1 + 32);
        v10 = v8;
        objc_msgSend(v9, "asset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v12;
        _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_INFO, "Triggering non-foreground user initiated download for asset with local identifier: %{public}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "setPriority:", objc_msgSend(*(id *)(a1 + 32), "priority"));
    }
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke_77;
    v16[3] = &unk_1E5018EF0;
    v15 = *(_QWORD *)(a1 + 56);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v13, "_loadAssetResource:allowNetworkAccess:options:completion:", v15, 1, v14, v16);

  }
}

uint64_t __62__PISegmentationLoader__loadAssetResource_options_completion___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __62__PISegmentationLoader__loadAssetResourceForProxy_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PIPhotoEditHelper canInterpretDataWithFormatIdentifier:formatVersion:](PIPhotoEditHelper, "canInterpretDataWithFormatIdentifier:formatVersion:", a2, a3);
}

BOOL __72__PISegmentationLoader__loadAssetResourceForLiveOriginalWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PIPhotoEditHelper canInterpretDataWithFormatIdentifier:formatVersion:](PIPhotoEditHelper, "canInterpretDataWithFormatIdentifier:formatVersion:", a2, a3);
}

void __57__PISegmentationLoader__loadFullSizeResource_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "resource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProxyImage:", objc_msgSend(v3, "proxyImage"));

    +[PISegmentationLoader segmentationCompositionForAssetResource:](PISegmentationLoader, "segmentationCompositionForAssetResource:", v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResource:", v17);
    objc_msgSend(*(id *)(a1 + 32), "setComposition:", v4);
    objc_msgSend(*(id *)(a1 + 32), "settlingEffectVideoData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "settlingEffectVideoData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "settlingEffectNormalizedBounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(*(id *)(a1 + 32), "composition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PISegmentationLoader livePhotoCompositionForVideoData:cropRect:photoComposition:](PISegmentationLoader, "livePhotoCompositionForVideoData:cropRect:photoComposition:", v6, v15, v8, v10, v12, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setComposition:", v16);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __54__PISegmentationLoader__loadProxyResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResource:", v3);
    +[PISegmentationLoader segmentationCompositionForAssetResource:](PISegmentationLoader, "segmentationCompositionForAssetResource:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setComposition:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61__PISegmentationLoader__loadLiveOriginalResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "type") == 6)
      objc_msgSend(*(id *)(a1 + 32), "setLivePhotoResource:", v5);
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

uint64_t __30__PISegmentationLoader_cancel__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_abort:", 0);
}

void __59__PISegmentationLoader__computeDefaultLayoutForItem_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "layout");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = v4;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __56__PISegmentationLoader__handlePartialItem_loadingState___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __45__PISegmentationLoader__loadItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  dispatch_group_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id)s_log_17878;
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.proxy", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "resource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "_handlePartialItem:loadingState:", *(_QWORD *)(a1 + 40), 1);
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    v9 = dispatch_group_create();
    v10 = (id)s_log_17878;
    v11 = v10;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6382000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PISegmentationLoader.properties", (const char *)&unk_1A650ABB5, buf, 2u);
    }

    v13 = MEMORY[0x1E0C809B0];
    v15 = *(void **)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_62;
    v25[3] = &unk_1E5019340;
    v25[4] = v15;
    v26 = v14;
    v27 = *(id *)(a1 + 48);
    objc_msgSend(v15, "_loadSegmentationData:layoutGroup:completion:", v26, v9, v25);
    if ((objc_msgSend(*(id *)(a1 + 32), "proxyOnly") & 1) == 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v16 = (id)s_log_17878;
      v17 = v16;
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6382000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PISegmentationLoader.fullSize", (const char *)&unk_1A650ABB5, buf, 2u);
      }

      v20 = *(void **)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_63;
      v21[3] = &unk_1E5018DE8;
      v21[4] = v20;
      v22 = v19;
      v23 = *(id *)(a1 + 48);
      v24 = v9;
      objc_msgSend(v20, "_loadFullSizeResource:completion:", v22, v21);

    }
  }
  else
  {
    objc_msgSend(v8, "_abort:", v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __45__PISegmentationLoader__loadItem_completion___block_invoke_66(_QWORD *a1)
{
  uint64_t v2;
  uint64_t (*v3)(void);

  v2 = a1[4];
  if (*(_BYTE *)(v2 + 25) || *(_QWORD *)(v2 + 48))
  {
    v3 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    objc_msgSend((id)v2, "_cacheSegmentationDataForItem:", a1[5]);
    v3 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v3();
}

void __45__PISegmentationLoader__loadItem_completion___block_invoke_62(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PISegmentationLoader.properties", (const char *)&unk_1A650ABB5, v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handlePartialItem:loadingState:", *(_QWORD *)(a1 + 40), 4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __45__PISegmentationLoader__loadItem_completion___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id)s_log_17878;
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.fullSize", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "resource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "_handlePartialItem:loadingState:", *(_QWORD *)(a1 + 40), 128);
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    v10 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__PISegmentationLoader__loadItem_completion___block_invoke_64;
    v14[3] = &unk_1E5018DC0;
    v12 = v9;
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v16 = v13;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v10, "_loadSettlingEffect:layoutGroup:completion:", v12, v11, v14);

  }
  else
  {
    objc_msgSend(v8, "_abort:", v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __45__PISegmentationLoader__loadItem_completion___block_invoke_64(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v4 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v3;
      _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Failed to load settling effect: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_abort:", v3);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v5 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      v8 = objc_msgSend(v6, "settlingEffectStatus");
      if ((unint64_t)(v8 - 1) > 4)
        v9 = CFSTR("unknown");
      else
        v9 = off_1E5015D58[v8 - 1];
      v10 = v9;
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1A6382000, v7, OS_LOG_TYPE_INFO, "Loaded settling effect, status: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __44__PISegmentationLoader__didLoad_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "loadingHandlerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PISegmentationLoader__didLoad_completion___block_invoke_2;
  block[3] = &unk_1E5018E10;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __44__PISegmentationLoader__didLoad_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  v2 = (id)s_log_17878;
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PISegmentationLoader.item", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke_56;
  v6[3] = &unk_1E5018D70;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  objc_msgSend(v7, "_load:", v6);

}

void __59__PISegmentationLoader_loadSegmentationItemWithCompletion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = (id)s_log_17878;
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PISegmentationLoader.item", (const char *)&unk_1A650ABB5, v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_didLoad:completion:", v3, *(_QWORD *)(a1 + 40));
}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PISegmentationLoader_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_18187 != -1)
    dispatch_once(&initialize_onceToken_18187, block);
}

+ (void)warmUpResources
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = (id)s_log_17878;
  v4 = v3;
  v5 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PISegmentationLoader.memory.warmUp", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D52358], "warmUp");
  objc_msgSend(a1, "warmUpClassificationDetectors");
  v6 = (id)s_log_17878;
  v7 = v6;
  v8 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PISegmentationLoader.memory.warmUp", (const char *)&unk_1A650ABB5, v9, 2u);
  }

}

+ (void)warmUpClassificationDetectors
{
  id v2;
  id v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
  objc_msgSend(v4, "addObject:", v2);

  v3 = objc_alloc_init(MEMORY[0x1E0CEDFD0]);
  objc_msgSend(v4, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0D52350], "warmUpRequests:", v4);
}

+ (void)ensureResources
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sResourceLock);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v3 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v19 = sResourceCounter;
    _os_log_debug_impl(&dword_1A6382000, v3, OS_LOG_TYPE_DEBUG, "Ensuring segmentation resources with counter %ld", buf, 0xCu);
  }
  v4 = sResourceCounter;
  if (!sResourceCounter)
  {
    objc_msgSend(a1, "_ensureResources");
    v4 = sResourceCounter;
  }
  if (v4 < 0)
  {
    NUAssertLogger_17881();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unbalanced call to ensureResources detected! (%ld)"), sResourceCounter);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v7 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = (uint64_t)v13;
        v20 = 2114;
        v21 = v17;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = (uint64_t)v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  sResourceCounter = v4 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&sResourceLock);
}

+ (void)freeResources
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sResourceLock);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  v3 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v19 = sResourceCounter;
    _os_log_debug_impl(&dword_1A6382000, v3, OS_LOG_TYPE_DEBUG, "Freeing segmentation loader resources with counter %ld", buf, 0xCu);
  }
  v4 = sResourceCounter;
  if (sResourceCounter == 1)
  {
    objc_msgSend(a1, "_freeResources");
    v4 = sResourceCounter;
  }
  if (v4 <= 0)
  {
    NUAssertLogger_17881();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unbalanced call to freeResources detected! (%ld)"), sResourceCounter);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v7 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = (uint64_t)v13;
        v20 = 2114;
        v21 = v17;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = (uint64_t)v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  sResourceCounter = v4 - 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&sResourceLock);
}

+ (void)_ensureResources
{
  id v2;

  v2 = +[PISchema registeredPhotosSchemaIdentifier](PISchema, "registeredPhotosSchemaIdentifier");
}

+ (void)_freeResources
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = (id)s_log_17878;
  v4 = v3;
  v5 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PISegmentationLoader.memory.purge", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if ((objc_msgSend(a1, "clientIsMobileSlideShow") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D520B0], "freeAllResources:", 1);
  v6 = (id)s_log_17878;
  v7 = v6;
  v8 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PISegmentationLoader.memory.purge", (const char *)&unk_1A650ABB5, v9, 2u);
  }

}

+ (BOOL)clientIsMobileSlideShow
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
  return (char)v2;
}

+ (id)proxyScalePolicy
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 3048192);
}

+ (id)renderPriorityForResourcePriority:(int64_t)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", v3);
}

+ (id)segmentationCompositionForProxyImage:(CGImage *)a3 orientation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_17881();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "proxyImage != NULL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v20;
        v29 = 2114;
        v30 = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = +[PIPhotoEditHelper newComposition](PIPhotoEditHelper, "newComposition");
  v7 = (void *)MEMORY[0x1E0C9DDC8];
  v25 = *MEMORY[0x1E0C9E100];
  v26 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithCGImage:options:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PIPhotoEditHelper imageSourceWithCIImage:orientation:](PIPhotoEditHelper, "imageSourceWithCIImage:orientation:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("source"));
  objc_msgSend(v6, "setMediaType:", 1);

  return v6;
}

+ (id)livePhotoCompositionForVideoData:(id)a3 cropRect:(CGRect)a4 photoComposition:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  const void **v21;
  const void **v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  const void **v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  const void **v33;
  void *v34;
  int v35;
  void *v36;
  const void **v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  const __CFString *v52;
  void *v53;
  uint8_t buf[4];
  const void **v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    NUAssertLogger_17881();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoData != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v38 = dispatch_get_specific(*v22);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v22 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = (const void **)v38;
        v56 = 2114;
        v57 = v41;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v22;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v30 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v12 = v11;
  if (!v11)
  {
    NUAssertLogger_17881();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v24 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v22;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_25:

      v35 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v30)
    {
      v42 = dispatch_get_specific(*v22);
      v43 = (void *)MEMORY[0x1E0CB3978];
      v44 = v42;
      objc_msgSend(v43, "callStackSymbols");
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = (const void **)v42;
      v56 = 2114;
      v57 = v45;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if (objc_msgSend(v11, "mediaType") != 1)
  {
    NUAssertLogger_17881();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition.mediaType == NUMediaTypeImage");
      v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    v34 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v24 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v37;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v35)
    {
      v46 = dispatch_get_specific(*v22);
      v47 = (void *)MEMORY[0x1E0CB3978];
      v48 = v46;
      objc_msgSend(v47, "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = (const void **)v46;
      v56 = 2114;
      v57 = v50;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  +[PIPhotoEditHelper videoSourceWithVideoData:orientation:](PIPhotoEditHelper, "videoSourceWithVideoData:orientation:", v10, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = CFSTR("appliedCropRect");
  *(CGFloat *)v51 = x;
  *(CGFloat *)&v51[1] = y;
  *(CGFloat *)&v51[2] = width;
  *(CGFloat *)&v51[3] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v51, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "definition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSourceOptions:", v15);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("source"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:videoSource:](PIPhotoEditHelper, "livePhotoSourceWithPhotoSource:videoSource:", v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("source"));
  objc_msgSend(v12, "setMediaType:", 3);

  return v12;
}

+ (id)segmentationCompositionForImageURL:(id)a3 fileUTI:(id)a4 orientation:(int64_t)a5 proxyImage:(CGImage *)a6
{
  id v6;
  NSObject *v11;
  id v12;
  void *specific;
  id v14;
  const void **v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PICompositionController *v20;
  void *v21;
  NSObject *v23;
  const void **v24;
  NSObject *v25;
  const void **v26;
  _BOOL4 v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  const void **v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    NUAssertLogger_17881();
    v25 = objc_claimAutoreleasedReturnValue();
    v16 = "imageURL != nil";
    v14 = &unk_1A64D6000;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageURL != nil");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v11 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        specific = dispatch_get_specific(*v15);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v14 = specific;
        objc_msgSend(v28, "callStackSymbols");
        v15 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        a5 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = (const void **)specific;
        v33 = 2114;
        v34 = a5;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_17:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    goto LABEL_5;
  }
  specific = v12;
  v14 = +[PIPhotoEditHelper newComposition](PIPhotoEditHelper, "newComposition");
  objc_msgSend(a1, "segmentationSourceForImageURL:fileUTI:orientation:proxyImage:", v11, specific, a5, a6);
  v15 = (const void **)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("source"));
  objc_msgSend(v14, "setMediaType:", 1);
  a5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithComposition:", v14);
  v30 = 0;
  objc_msgSend((id)a5, "submitSynchronous:", &v30);
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  v6 = v30;
  if (v16)
  {
    objc_msgSend(v16, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "orientation");

    goto LABEL_8;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_17;
LABEL_5:
  v19 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    v23 = v19;
    -[NSObject path](v11, "path");
    v24 = (const void **)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v24;
    v33 = 2114;
    v34 = (int64_t)v6;
    _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Failed to read orientation for image file: %@, error: %{public}@", buf, 0x16u);

  }
  v18 = 1;
LABEL_8:
  v20 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v14);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __90__PISegmentationLoader_segmentationCompositionForImageURL_fileUTI_orientation_proxyImage___block_invoke;
  v29[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
  v29[4] = v18;
  -[PICompositionController modifyAdjustmentWithKey:modificationBlock:](v20, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("orientation"), v29);
  -[PICompositionController composition](v20, "composition");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)segmentationSourceForImageURL:(id)a3 fileUTI:(id)a4 orientation:(int64_t)a5 proxyImage:(CGImage *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    NUAssertLogger_17881();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageURL != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIPhotoEditHelper imageSourceWithURL:type:proxyImage:orientation:useEmbeddedPreview:](PIPhotoEditHelper, "imageSourceWithURL:type:proxyImage:orientation:useEmbeddedPreview:", v8, v10, v11, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PIPhotoEditHelper imageSourceWithURL:type:useEmbeddedPreview:](PIPhotoEditHelper, "imageSourceWithURL:type:useEmbeddedPreview:", v8, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (BOOL)saveSegmentationItem:(id)a3 toURL:(id)a4 error:(id *)a5
{
  const void **v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  char v19;
  NSObject *v21;
  NSObject *v22;
  const void **v23;
  NSObject *specific;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  NSObject *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    NUAssertLogger_17881();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "item != nil");
      v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        specific = dispatch_get_specific(*v23);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v5 = specific;
        objc_msgSend(v37, "callStackSymbols");
        v23 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = specific;
        v50 = 2114;
        v51 = v38;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = objc_claimAutoreleasedReturnValue();
      -[NSObject componentsJoinedByString:](specific, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v23;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v29 = _NUAssertFailHandler();
    goto LABEL_34;
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_17881();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v28 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v25 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = objc_claimAutoreleasedReturnValue();
        -[NSObject componentsJoinedByString:](specific, "componentsJoinedByString:", CFSTR("\n"));
        v30 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v30;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_36:

      v34 = _NUAssertFailHandler();
      goto LABEL_37;
    }
LABEL_34:
    if (v29)
    {
      specific = dispatch_get_specific(*v23);
      v39 = (void *)MEMORY[0x1E0CB3978];
      v5 = specific;
      objc_msgSend(v39, "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = specific;
      v50 = 2114;
      v51 = v41;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_17881();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid segmentation item: %@"), v8);
      v32 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v5 = (const void **)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    specific = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(specific, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v36;
        _os_log_error_impl(&dword_1A6382000, specific, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_39;
    }
LABEL_37:
    if (v34)
    {
      v42 = dispatch_get_specific(*v5);
      v43 = (void *)MEMORY[0x1E0CB3978];
      v44 = v42;
      objc_msgSend(v43, "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v42;
      v50 = 2114;
      v51 = v46;
      _os_log_error_impl(&dword_1A6382000, specific, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_39:

    _NUAssertFailHandler();
  }
  v11 = (id)s_log_17878;
  v12 = v11;
  v13 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PISegmentationLoader.archive.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v47 = 0;
  v14 = objc_msgSend(v8, "saveToURL:error:", v10, &v47);
  v15 = v47;
  v16 = (id)s_log_17878;
  v17 = v16;
  v18 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PISegmentationLoader.archive.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if (a5)
    v19 = v14;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
    *a5 = objc_retainAutorelease(v15);

  return v14;
}

+ (id)loadSegmentationItemFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v11;
  void *v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_17881();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        v26 = 2114;
        v27 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(a1, "_loadSegmentationItemFromURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isComplete") & 1) != 0)
  {
    v9 = v8;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Segmentation item is incomplete"), v7);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_loadSegmentationItemFromURL:(id)a3 error:(id *)a4
{
  id v6;
  PIParallaxSegmentationItem *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  char v31;
  PIParallaxSegmentationItem *v32;
  uint8_t v34[8];
  id v35;
  uint8_t buf[16];

  v6 = a3;
  v7 = objc_alloc_init(PIParallaxSegmentationItem);
  v8 = (id)s_log_17878;
  v9 = v8;
  v10 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PISegmentationLoader.archive.read", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v35 = 0;
  v11 = -[PIParallaxSegmentationItem loadFromURL:error:](v7, "loadFromURL:error:", v6, &v35);

  v12 = v35;
  -[PIParallaxSegmentationItem resource](v7, "resource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PIParallaxSegmentationItem resource](v7, "resource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "segmentationCompositionForAssetResource:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxSegmentationItem setComposition:](v7, "setComposition:", v15);

    -[PIParallaxSegmentationItem settlingEffectVideoData](v7, "settlingEffectVideoData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PIParallaxSegmentationItem settlingEffectVideoData](v7, "settlingEffectVideoData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIParallaxSegmentationItem settlingEffectNormalizedBounds](v7, "settlingEffectNormalizedBounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      -[PIParallaxSegmentationItem composition](v7, "composition");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "livePhotoCompositionForVideoData:cropRect:photoComposition:", v17, v26, v19, v21, v23, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIParallaxSegmentationItem setComposition:](v7, "setComposition:", v27);

    }
  }
  v28 = (id)s_log_17878;
  v29 = v28;
  v30 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)v34 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PISegmentationLoader.archive.read", (const char *)&unk_1A650ABB5, v34, 2u);
  }

  if (a4)
    v31 = v11;
  else
    v31 = 1;
  if ((v31 & 1) != 0)
  {
    v32 = v7;
  }
  else
  {
    v32 = 0;
    *a4 = objc_retainAutorelease(v12);
  }

  return v32;
}

+ (id)saveSegmentationItem:(id)a3 layerStackOptions:(unint64_t)a4 configuration:(id)a5 style:(id)a6 layout:(id)a7 toWallpaperURL:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  NSObject *v49;
  const void **v50;
  const void **v51;
  void *specific;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  NSObject *v56;
  const void **v57;
  void *v58;
  int v59;
  void *v60;
  const void **v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t buf[4];
  const void **v79;
  __int16 v80;
  void *v81;
  uint64_t v82;
  CGRect v83;

  v82 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!v15)
  {
    NUAssertLogger_17881();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "item != nil");
      v50 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v50;
      _os_log_error_impl(&dword_1A6382000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v51 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        v62 = dispatch_get_specific(*v51);
        v63 = (void *)MEMORY[0x1E0CB3978];
        v64 = v62;
        objc_msgSend(v63, "callStackSymbols");
        v51 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v79 = (const void **)v62;
        v80 = 2114;
        v81 = v65;
        _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v54)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v51;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v59 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  if (!v19)
  {
    NUAssertLogger_17881();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v57 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v57;
      _os_log_error_impl(&dword_1A6382000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v51 = (const void **)MEMORY[0x1E0D51D48];
    v58 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v53 = objc_claimAutoreleasedReturnValue();
    v59 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (!v58)
    {
      if (v59)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v61;
        _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_33;
    }
LABEL_31:
    if (v59)
    {
      v66 = dispatch_get_specific(*v51);
      v67 = (void *)MEMORY[0x1E0CB3978];
      v68 = v66;
      objc_msgSend(v67, "callStackSymbols");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = (const void **)v66;
      v80 = 2114;
      v81 = v70;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_33:

    _NUAssertFailHandler();
  }
  v21 = v20;
  if (v16 && !v18)
  {
    objc_msgSend(v16, "normalizedVisibleFrame");
    if (!CGRectIsNull(v83))
    {
      objc_msgSend(v16, "normalizedVisibleFrame");
      NURectFlipYOrigin();
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v16, "normalizedLandscapeVisibleFrame");
      NURectFlipYOrigin();
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(v15, "originalLayout");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "layoutByUpdatingNormalizedPortraitVisibleFrame:landscapeVisibleFrame:", v24, v26, v28, v30, v32, v34, v36, v38);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_8;
      goto LABEL_10;
    }
    v18 = 0;
  }
  if (v17)
  {
LABEL_8:
    v22 = v17;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(v16, "style");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
LABEL_11:
    objc_msgSend(v15, "adjustedStyleForHeadroom:", v22);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a4 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v40 = 0;
  if ((a4 & 0x40) == 0)
  {
LABEL_12:
    v41 = 0;
    if (!v16)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_15:
  v41 = objc_msgSend(v15, "isSettlingEffectAvailable");
  if (v16)
LABEL_16:
    v41 = v41 & objc_msgSend(v16, "isSettlingEffectEnabled");
LABEL_17:
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __116__PISegmentationLoader_saveSegmentationItem_layerStackOptions_configuration_style_layout_toWallpaperURL_completion___block_invoke;
  v71[3] = &unk_1E5019210;
  v72 = v16;
  v73 = v15;
  v74 = v40;
  v75 = v19;
  v76 = v21;
  v77 = a1;
  v42 = v21;
  v43 = v19;
  v44 = v40;
  v45 = v15;
  v46 = v16;
  objc_msgSend(a1, "generateLayerStackForItem:style:layout:options:enableSettlingEffect:completion:", v45, v44, v18, a4, v41, v71);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

+ (id)generateLayerStackForItem:(id)a3 style:(id)a4 layout:(id)a5 options:(unint64_t)a6 enableSettlingEffect:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  PIParallaxCompoundLayerStackRequest *v18;
  void *v19;
  int v20;
  void *v21;
  _BOOL8 IsNull;
  uint64_t v23;
  PIParallaxCompoundLayerStackRequest *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v31;
  void *v32;
  const void **v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  CGRect v51;
  CGRect v52;

  v9 = a7;
  v50 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if (!v13)
  {
    NUAssertLogger_17881();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "item != nil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v39 = dispatch_get_specific(*v33);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v39;
        v48 = 2114;
        v49 = v43;
        _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v38;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v17 = v16;
  if (!a6)
  {
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
    v18 = 0;
    goto LABEL_20;
  }
  v18 = -[PIParallaxCompoundLayerStackRequest initWithSegmentationItem:]([PIParallaxCompoundLayerStackRequest alloc], "initWithSegmentationItem:", v13);
  -[PIParallaxCompoundLayerStackRequest setSettlingEffectEnabled:](v18, "setSettlingEffectEnabled:", v9);
  if (v14)
  {
    +[PIParallaxStyle styleWithBakedStyle:](PIParallaxStyle, "styleWithBakedStyle:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIParallaxCompoundLayerStackRequest setStyle:](v18, "setStyle:", v19);

  }
  else
  {
    -[PIParallaxCompoundLayerStackRequest setStyle:](v18, "setStyle:", 0);
  }
  if (!v15)
  {
    -[PIParallaxCompoundLayerStackRequest setUpdateInactiveFrame:](v18, "setUpdateInactiveFrame:", 1);
    goto LABEL_16;
  }
  -[PIParallaxCompoundLayerStackRequest setLayout:](v18, "setLayout:", v15);
  v20 = objc_msgSend(v15, "supportsBothOrientations");
  objc_msgSend(v15, "portraitLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "inactiveFrame");
  IsNull = CGRectIsNull(v51);
  v23 = IsNull;
  if (v20)
  {
    if (!IsNull)
    {
      objc_msgSend(v15, "landscapeLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inactiveFrame");
      -[PIParallaxCompoundLayerStackRequest setUpdateInactiveFrame:](v18, "setUpdateInactiveFrame:", CGRectIsNull(v52));

      goto LABEL_15;
    }
    v24 = v18;
    v23 = 1;
  }
  else
  {
    v24 = v18;
  }
  -[PIParallaxCompoundLayerStackRequest setUpdateInactiveFrame:](v24, "setUpdateInactiveFrame:", v23);
LABEL_15:

LABEL_16:
  -[PIParallaxCompoundLayerStackRequest setUpdateClockAreaLuminance:](v18, "setUpdateClockAreaLuminance:", 1);
  -[PIParallaxCompoundLayerStackRequest setUpdateClockZPosition:](v18, "setUpdateClockZPosition:", 1);
  -[PIParallaxCompoundLayerStackRequest setLayerStackOptions:](v18, "setLayerStackOptions:", a6);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 1);
  -[NURenderRequest setPriority:](v18, "setPriority:", v26);

  v27 = (id)s_log_17878;
  v28 = v27;
  v29 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PISegmentationLoader.layerStack.render", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __103__PISegmentationLoader_generateLayerStackForItem_style_layout_options_enableSettlingEffect_completion___block_invoke;
  v44[3] = &unk_1E5019A68;
  v45 = v17;
  -[PIParallaxCompoundLayerStackRequest submit:](v18, "submit:", v44);

LABEL_20:
  return v18;
}

+ (void)_saveSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 toWallpaperURL:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  v17 = (id)s_log_17878;
  v18 = v17;
  v19 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PISegmentationLoader.wallpaper.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  v28 = 0;
  v20 = objc_msgSend(a1, "saveSegmentationItem:compoundLayerStack:style:toWallpaperURL:error:", v12, v13, v14, v15, &v28);
  v21 = v28;
  v22 = (id)s_log_17878;
  v23 = v22;
  v24 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PISegmentationLoader.wallpaper.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if ((v20 & 1) != 0)
  {
    v25 = 0;
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v26 = *MEMORY[0x1E0D52398];
    v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR);
    v25 = v21;
    if (v27)
    {
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Failed to save segmentation item and layer stack to wallpaper URL: %{public}@", buf, 0xCu);
      v25 = v21;
    }
  }
  ((void (**)(id, id))v16)[2](v16, v25);

}

+ (BOOL)saveSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 toWallpaperURL:(id)a6 error:(id *)a7
{
  void *v7;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v20;
  id specific;
  void *v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  uint64_t v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  BOOL v41;
  NSObject *v42;
  id *v43;
  NSObject *v44;
  void *v45;
  const __CFString *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v51;
  void *v52;
  const void **v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  NSObject *v60;
  id v61;
  id *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v15)
  {
    NUAssertLogger_17881();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v52;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v53 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v12 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        specific = dispatch_get_specific(*v53);
        v56 = (void *)MEMORY[0x1E0CB3978];
        a5 = specific;
        objc_msgSend(v56, "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = specific;
        v69 = 2114;
        v70 = v7;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v54)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v55;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v58 = "wallpaperURL != nil";
    _NUAssertFailHandler();
LABEL_68:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
LABEL_28:
    v42 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v68 = specific;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Failed to create wallpaper directory: %{public}@", buf, 0xCu);
      if (!a7)
        goto LABEL_43;
    }
    else if (!a7)
    {
LABEL_43:
      v41 = 0;
      goto LABEL_51;
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create wallpaper directory"), a5, specific, v58);
    v41 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  a5 = v15;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a5, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v7, "fileExistsAtPath:", v16);

  if ((v17 & 1) != 0)
  {
    v62 = a7;
    v18 = 0;
    if (!v12)
      goto LABEL_9;
    goto LABEL_7;
  }
  v66 = 0;
  v19 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a5, 0, 0, &v66);
  v20 = v66;
  specific = v20;
  if ((v19 & 1) == 0)
  {
    if (*MEMORY[0x1E0D52390] == -1)
      goto LABEL_28;
    goto LABEL_68;
  }
  v62 = a7;
  v18 = v20;
  if (!v12)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(a5, "URLByAppendingPathComponent:", CFSTR("input.segmentation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v18;
  v23 = +[PISegmentationLoader saveSegmentationItem:toURL:error:](PISegmentationLoader, "saveSegmentationItem:toURL:error:", v12, v22, &v65);
  specific = v65;

  if (!v23)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v43 = v62;
    v44 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v68 = specific;
      _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Failed to export segmentation item: %{public}@", buf, 0xCu);
      if (!v62)
        goto LABEL_42;
    }
    else if (!v62)
    {
      goto LABEL_42;
    }
    v45 = (void *)MEMORY[0x1E0D520A0];
    v46 = CFSTR("Failed to export segmentation item");
    v47 = v12;
LABEL_41:
    objc_msgSend(v45, "errorWithCode:reason:object:underlyingError:", 1, v46, v47, specific);
    *v43 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }

  v18 = specific;
LABEL_9:
  v61 = v14;
  if (!v13)
    goto LABEL_18;
  v24 = (id)s_log_17878;
  v25 = v24;
  v26 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PISegmentationLoader.layerStack.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  objc_msgSend(a5, "URLByAppendingPathComponent:", CFSTR("output.layerStack"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v18;
  v27 = v13;
  v28 = objc_msgSend(MEMORY[0x1E0D75198], "saveCompoundLayerStack:toURL:options:error:", v13, v22, 0xFFFFLL, &v64);
  specific = v64;

  v29 = (id)s_log_17878;
  v30 = v29;
  v31 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PISegmentationLoader.layerStack.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if ((v28 & 1) == 0)
  {
    v14 = v61;
    v43 = v62;
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v13 = v27;
    v48 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v68 = specific;
      _os_log_error_impl(&dword_1A6382000, v48, OS_LOG_TYPE_ERROR, "Failed to export layer stack: %{public}@", buf, 0xCu);
      if (!v62)
        goto LABEL_42;
      goto LABEL_40;
    }
    if (v62)
    {
LABEL_40:
      v45 = (void *)MEMORY[0x1E0D520A0];
      v46 = CFSTR("Failed to export layer stack");
      v47 = v13;
      goto LABEL_41;
    }
LABEL_42:

    goto LABEL_43;
  }

  v18 = specific;
  v13 = v27;
  v14 = v61;
LABEL_18:
  if (!v14)
  {
    v41 = 1;
    specific = v18;
    goto LABEL_51;
  }
  v60 = v13;
  v32 = (id)s_log_17878;
  v33 = v32;
  v34 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v34, "PISegmentationLoader.style.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  objc_msgSend(a5, "URLByAppendingPathComponent:", CFSTR("style.plist"));
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D751A0], "dictionaryWithStyle:", v14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v18;
  v59 = (void *)v35;
  v37 = objc_msgSend(v36, "writeToURL:error:", v35, &v63);
  specific = v63;

  v38 = (id)s_log_17878;
  v39 = v38;
  v40 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v39, OS_SIGNPOST_INTERVAL_END, v40, "PISegmentationLoader.style.write", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if ((v37 & 1) == 0)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v49 = *MEMORY[0x1E0D52398];
    v14 = v61;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v68 = specific;
      _os_log_error_impl(&dword_1A6382000, v49, OS_LOG_TYPE_ERROR, "Failed to export style: %{public}@", buf, 0xCu);
      if (!v62)
        goto LABEL_50;
    }
    else if (!v62)
    {
LABEL_50:

      v41 = 0;
      v13 = v60;
      goto LABEL_51;
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to export style"), v61, specific);
    *v62 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }

  v41 = 1;
  v13 = v60;
  v14 = v61;
LABEL_51:

  return v41;
}

+ (id)loadSegmentationItemFromWallpaperURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_17881();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v20;
        v27 = 2114;
        v28 = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(a1, "_loadSegmentationItemFromWallpaperURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_7;
  if ((objc_msgSend(v8, "isComplete") & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Segmentation item from wallpaper is incomplete"), 0);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = v9;
LABEL_8:

  return v10;
}

+ (id)_loadSegmentationItemFromWallpaperURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("input.segmentation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(a1, "_loadSegmentationItemFromURL:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v8)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v11 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Failed to load segmentation item from wallpaper: %{public}@", buf, 0xCu);
      if (!a4)
        goto LABEL_8;
    }
    else if (!a4)
    {
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load segmentation item from wallpaper"), v6, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v10 = v8;
LABEL_8:

  return v8;
}

+ (id)loadCompoundLayerStackFromWallpaperURL:(id)a3 options:(unint64_t)a4 error:(id *)specific
{
  id *v5;
  id v6;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const void **v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const void **v18;
  NSObject *v19;
  NSObject *v21;
  id *v22;
  _BOOL4 v23;
  void *v24;
  const char *v25;
  id v26;
  uint8_t buf[4];
  id *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    NUAssertLogger_17881();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v22 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = (id *)dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v10 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        specific = (id *)dispatch_get_specific(*v14);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v5 = specific;
        objc_msgSend(v24, "callStackSymbols");
        v14 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v6 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = specific;
        v29 = 2114;
        v30 = v6;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = (id *)v14;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v25 = "wallpaperURL != nil";
    _NUAssertFailHandler();
LABEL_25:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
LABEL_11:
    v19 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = (id *)v6;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Failed to load layer stack from wallpaper: %{public}@", buf, 0xCu);
      if (!specific)
        goto LABEL_14;
    }
    else if (!specific)
    {
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load layer stack from wallpaper"), v10, v6, v25);
    *specific = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v10 = v9;
  v11 = (id)s_log_17878;
  v12 = v11;
  v13 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PISegmentationLoader.layerStack.read", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  -[NSObject URLByAppendingPathComponent:](v10, "URLByAppendingPathComponent:", CFSTR("output.layerStack"));
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0D75198], "loadCompoundLayerStackFromURL:options:error:", v5, a4, &v26);
  v14 = (const void **)objc_claimAutoreleasedReturnValue();
  v6 = v26;
  v15 = (id)s_log_17878;
  v16 = v15;
  v17 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PISegmentationLoader.layerStack.read", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if (!v14)
  {
    if (*MEMORY[0x1E0D52390] == -1)
      goto LABEL_11;
    goto LABEL_25;
  }
  v18 = v14;
LABEL_14:

  return v14;
}

+ (id)loadStyleFromWallpaperURL:(id)a3 error:(id *)specific
{
  id *v4;
  id v5;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const void **v12;
  char *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  char *v18;
  NSObject *v19;
  NSObject *v21;
  id *v22;
  _BOOL4 v23;
  void *v24;
  const char *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    NUAssertLogger_17881();
    v21 = objc_claimAutoreleasedReturnValue();
    v13 = "wallpaperURL != nil";
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v22 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = (id *)dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v8 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        specific = (id *)dispatch_get_specific(*v12);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v4 = specific;
        objc_msgSend(v24, "callStackSymbols");
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v5 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = specific;
        v30 = 2114;
        v31 = v5;
        _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = (id *)v12;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v25 = "wallpaperURL != nil";
    _NUAssertFailHandler();
LABEL_28:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
LABEL_14:
    v19 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = (id *)v5;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Failed to load style from wallpaper: %{public}@", buf, 0xCu);
      if (!specific)
        goto LABEL_17;
    }
    else if (!specific)
    {
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load style from wallpaper"), v8, v5, v25);
    *specific = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v8 = v7;
  v9 = (id)s_log_17878;
  v10 = v9;
  v11 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PISegmentationLoader.style.read", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  -[NSObject URLByAppendingPathComponent:](v8, "URLByAppendingPathComponent:", CFSTR("style.plist"));
  v12 = (const void **)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v12, &v27);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  if (v4)
  {
    v26 = v5;
    objc_msgSend(MEMORY[0x1E0D751A0], "styleWithDictionary:error:", v4, &v26);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    v14 = v26;

    v5 = v14;
  }
  else
  {
    v13 = 0;
  }
  v15 = (id)s_log_17878;
  v16 = v15;
  v17 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PISegmentationLoader.style.read", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if (!v13)
  {
    if (*MEMORY[0x1E0D52390] == -1)
      goto LABEL_14;
    goto LABEL_28;
  }
  v18 = v13;
LABEL_17:

  return v13;
}

+ (void)renderPreviewLayerStackFromWallpaperURL:(id)a3 styleCategory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_17881();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        v31 = 2114;
        v32 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v11 = v10;
  objc_msgSend(a1, "ensureResources");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__PISegmentationLoader_renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke;
  v26[3] = &unk_1E5019238;
  v27 = v11;
  v28 = a1;
  v12 = v11;
  objc_msgSend(a1, "_renderPreviewLayerStackFromWallpaperURL:styleCategory:completion:", v8, v9, v26);

}

+ (void)_renderPreviewLayerStackFromWallpaperURL:(id)a3 styleCategory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_17881();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke;
  v27[3] = &unk_1E5019700;
  v29 = v10;
  v30 = a1;
  v28 = v9;
  v11 = v10;
  v12 = v9;
  v13 = (id)objc_msgSend(a1, "reloadSegmentationItemFromWallpaperURL:asset:completion:", v8, 0, v27);

}

+ (id)reloadSegmentationItemFromWallpaperURL:(id)a3 asset:(id)a4 completion:(id)a5
{
  id v5;
  NSObject *v9;
  id specific;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  PISegmentationLoader *v15;
  PISegmentationLoader *v16;
  void *v17;
  void *v18;
  PISegmentationLoader *v19;
  void *v20;
  NSObject *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  const char *v26;
  _QWORD v27[4];
  PISegmentationLoader *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  specific = a4;
  v11 = a5;
  if (!v9)
  {
    NUAssertLogger_17881();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = (uint64_t)v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17881();
    v9 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        specific = dispatch_get_specific(*(const void **)v12);
        v25 = (void *)MEMORY[0x1E0CB3978];
        a1 = specific;
        objc_msgSend(v25, "callStackSymbols");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v12, "componentsJoinedByString:", CFSTR("\n"));
        v5 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = (uint64_t)specific;
        v33 = 2114;
        v34 = v5;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v12 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = "wallpaperURL != nil";
    _NUAssertFailHandler();
    goto LABEL_22;
  }
  v12 = (uint64_t)v11;
  v30 = 0;
  objc_msgSend(a1, "_loadSegmentationItemFromWallpaperURL:error:", v9, &v30);
  a1 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  if (!a1)
  {
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_6:
      v13 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v32 = (uint64_t)v5;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Failed to load segmentation item from wallpaper: %{public}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load segmentation item from wallpaper"), v9, v5, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v14);

      goto LABEL_9;
    }
LABEL_22:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "isComplete"))
  {
    (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, a1, 0);
LABEL_9:
    v15 = 0;
    goto LABEL_13;
  }
  v16 = -[PISegmentationLoader initWithSegmentationItem:parallaxAsset:]([PISegmentationLoader alloc], "initWithSegmentationItem:parallaxAsset:", a1, specific);
  if (!specific)
  {
    objc_msgSend(a1, "resource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PISegmentationLoader setProxyOnly:](v16, "setProxyOnly:", objc_msgSend(v17, "isProxyOnly"));

    objc_msgSend(a1, "livePhotoResource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PISegmentationLoader setDisableSettlingEffect:](v16, "setDisableSettlingEffect:", v18 == 0);

  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __80__PISegmentationLoader_reloadSegmentationItemFromWallpaperURL_asset_completion___block_invoke;
  v27[3] = &unk_1E50198E0;
  v19 = v16;
  v28 = v19;
  v29 = (id)v12;
  -[PISegmentationLoader loadSegmentationItemWithCompletion:](v19, "loadSegmentationItemWithCompletion:", v27);
  v20 = v29;
  v15 = v19;

LABEL_13:
  return v15;
}

+ (BOOL)currentDeviceSupportsSettlingEffect
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D52228], "currentPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = (unint64_t)objc_msgSend(v3, "family") > 4;
  return (char)v2;
}

uint64_t __80__PISegmentationLoader_reloadSegmentationItemFromWallpaperURL_asset_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "suggestedStyleForCategory:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
      v9 = 136;
    else
      v9 = 8;
    v10 = objc_msgSend(v5, "isSettlingEffectAvailable");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke_2;
    v14[3] = &unk_1E5019260;
    v11 = *(void **)(a1 + 48);
    v17 = *(id *)(a1 + 40);
    v15 = v7;
    v16 = v5;
    v12 = v7;
    v13 = (id)objc_msgSend(v11, "generateLayerStackForItem:style:layout:options:enableSettlingEffect:completion:", v16, v12, 0, v9, v10, v14);

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v8 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Failed to reload segmentation item from wallpaper: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __90__PISegmentationLoader__renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v8 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Failed to render layer stack: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

void __89__PISegmentationLoader_renderPreviewLayerStackFromWallpaperURL_styleCategory_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = *(void **)(a1 + 40);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(v9, "freeResources");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __103__PISegmentationLoader_generateLayerStackForItem_style_layout_options_enableSettlingEffect_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = (id)s_log_17878;
  v6 = v5;
  v7 = s_signpost_17879;
  if ((unint64_t)(s_signpost_17879 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6382000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PISegmentationLoader.layerStack.render", (const char *)&unk_1A650ABB5, buf, 2u);
  }

  if (v3)
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "compoundLayerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
    v10 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Failed to render layer stack: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __116__PISegmentationLoader_saveSegmentationItem_layerStackOptions_configuration_style_layout_toWallpaperURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v8, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(v6, "isDepthEnabled"), objc_msgSend(*(id *)(a1 + 32), "isLandscapeDepthEnabled"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "compoundLayerStackByUpdatingParallaxDisabled:", objc_msgSend(*(id *)(a1 + 32), "isPerspectiveZoomEnabled") ^ 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 72), "_saveSegmentationItem:compoundLayerStack:style:toWallpaperURL:completion:", *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

uint64_t __90__PISegmentationLoader_segmentationCompositionForImageURL_fileUTI_orientation_proxyImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientation:", *(_QWORD *)(a1 + 32));
}

os_signpost_id_t __34__PISegmentationLoader_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  os_signpost_id_t result;

  v2 = os_log_create("com.apple.photos.PhotoImaging", "segmentation");
  v3 = (void *)s_log_17878;
  s_log_17878 = (uint64_t)v2;

  result = os_signpost_id_make_with_pointer((os_log_t)s_log_17878, *(const void **)(a1 + 32));
  s_signpost_17879 = result;
  return result;
}

@end

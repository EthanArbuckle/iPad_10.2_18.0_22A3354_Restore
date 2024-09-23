@implementation SBUILegibilityMetalEngine

- (SBUILegibilityMetalEngine)initWithEngineIdentifier:(id)a3
{
  return -[SBUILegibilityMetalEngine initWithEngineIdentifier:algorithm:](self, "initWithEngineIdentifier:algorithm:", a3, 0);
}

- (SBUILegibilityMetalEngine)initWithEngineIdentifier:(id)a3 algorithm:(int64_t)a4
{
  id v6;
  SBUILegibilityMetalEngine *v7;
  uint64_t v8;
  NSString *engineIdentifier;
  SBUILegibilityCache *v10;
  SBUILegibilityCache *legibilityCache;
  uint64_t v12;
  UIScreen *screen;
  NSOperationQueue *v14;
  NSOperationQueue *asyncOperationQueue;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBUILegibilityMetalEngine;
  v7 = -[SBUILegibilityMetalEngine init](&v18, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    engineIdentifier = v7->_engineIdentifier;
    v7->_engineIdentifier = (NSString *)v8;

    v7->_algorithm = a4;
    v10 = -[SBUILegibilityCache initWithEngine:]([SBUILegibilityCache alloc], "initWithEngine:", v7);
    legibilityCache = v7->_legibilityCache;
    v7->_legibilityCache = v10;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v12 = objc_claimAutoreleasedReturnValue();
    screen = v7->_screen;
    v7->_screen = (UIScreen *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    asyncOperationQueue = v7->_asyncOperationQueue;
    v7->_asyncOperationQueue = v14;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_asyncOperationQueue, "setMaxConcurrentOperationCount:", 10);
    -[NSOperationQueue setQualityOfService:](v7->_asyncOperationQueue, "setQualityOfService:", 17);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__teardownCaches_, CFSTR("SBUILegibilityEngineShouldClearCachesNotification"), 0);

  }
  return v7;
}

- (void)executeLegibilityUpdateForContainer:(id)a3 forImage:(id)a4 settings:(id)a5 strength:(double *)a6 engineResult:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  SBUILegibilityMetalEngine *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  UIScreen *v22;
  UIScreen *screen;
  UIScreen *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  uint8_t buf[4];
  SBUILegibilityMetalEngine *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(v13, "size");
  if (self->_useMinFillHeightForTemplateGeneration)
  {
    -[SBUILegibilityCache templateImageForSettings:matchingSize:](self->_legibilityCache, "templateImageForSettings:matchingSize:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;
  if (!self->_useMinFillHeightForTemplateGeneration)
    goto LABEL_9;
  objc_msgSend(v12, "shadowImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!BSEqualObjects())
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v12, "legibilityEngine");
  v18 = (SBUILegibilityMetalEngine *)objc_claimAutoreleasedReturnValue();
  if (v18 != self)
  {

    goto LABEL_8;
  }
  objc_msgSend(v12, "legibilitySettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = BSEqualObjects();

  if (!v28)
  {
LABEL_9:
    if (v16)
    {
      SBLogLegibility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v30 = self;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v13;
        v35 = 2048;
        v36 = v14;
        _os_log_debug_impl(&dword_1A471F000, v19, OS_LOG_TYPE_DEBUG, "(%@) Legibility background image already prepared for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      v20 = v16;
      if (a7)
      {
        a7->var0 = 1;
        v20 = v16;
      }
      if (a6)
      {
LABEL_15:
        -[SBUILegibilityMetalEngine applyStrength:toImage:settings:](self, "applyStrength:toImage:settings:", v20, v14, *a6);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        objc_msgSend(v12, "updateOrigImage:shadowImage:strengthenedShadowImage:settings:engine:isTemplate:withStrength:context:", v13, v20, v21, v14, self, v16 != 0, a6, 0);
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(v12, "_screen");
      v22 = (UIScreen *)objc_claimAutoreleasedReturnValue();
      screen = v22;
      if (!v22)
        screen = self->_screen;
      v24 = screen;

      -[SBUILegibilityMetalEngine _findEngineConfigurationMatchingScreen:settings:](self, "_findEngineConfigurationMatchingScreen:settings:", v24, v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "executeBlurForImage:settings:", v13, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogLegibility();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v30 = self;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v13;
        v35 = 2048;
        v36 = v14;
        _os_log_impl(&dword_1A471F000, v26, OS_LOG_TYPE_DEFAULT, "(%@) Drew legibility background image for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      if (a6)
        goto LABEL_15;
    }
    v21 = 0;
    goto LABEL_22;
  }
  SBLogLegibility();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v30 = self;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2048;
    v36 = v14;
    _os_log_debug_impl(&dword_1A471F000, v21, OS_LOG_TYPE_DEBUG, "(%@) Skipping legibility background image generation for view '%@' / image '%@', settings '%p'; this is redundent",
      buf,
      0x2Au);
  }
  v20 = v16;
LABEL_23:

}

- (id)executeAsyncLegibilityUpdateForContainer:(id)a3 image:(id)a4 settings:(id)a5 strength:(double *)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  UIScreen *v15;
  UIScreen *screen;
  UIScreen *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  double *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  id v45[2];
  id location;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  SBUILegibilityMetalEngine *v51;
  uint64_t *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  double *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[4];
  char v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v34 = a7;
  objc_msgSend(v12, "_screen");
  v15 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  screen = v15;
  if (!v15)
    screen = self->_screen;
  v17 = screen;

  -[SBUILegibilityMetalEngine _findEngineConfigurationMatchingScreen:settings:](self, "_findEngineConfigurationMatchingScreen:settings:", v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__2;
  v69[4] = __Block_byref_object_dispose__2;
  v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__2;
  v67[4] = __Block_byref_object_dispose__2;
  v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__2;
  v65[4] = __Block_byref_object_dispose__2;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2810000000;
  v63[3] = &unk_1A47C033D;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__2;
  v61 = __Block_byref_object_dispose__2;
  v62 = 0;
  v19 = (void *)MEMORY[0x1E0CB34C8];
  v20 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke;
  v47[3] = &unk_1E4C3FE18;
  v52 = &v57;
  v53 = v65;
  v54 = v69;
  v33 = v18;
  v48 = v33;
  v21 = v13;
  v49 = v21;
  v22 = v14;
  v55 = v67;
  v56 = a6;
  v50 = v22;
  v51 = self;
  objc_msgSend(v19, "blockOperationWithBlock:", v47);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = a6;
  v25 = (void *)v58[5];
  v58[5] = v23;

  objc_initWeak(&location, self);
  v26 = (void *)v58[5];
  v35[0] = v20;
  v35[1] = 3221225472;
  v35[2] = __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2;
  v35[3] = &unk_1E4C3FE40;
  v40 = &v57;
  v41 = v65;
  v27 = v12;
  v36 = v27;
  v28 = v21;
  v37 = v28;
  v42 = v69;
  v43 = v67;
  v29 = v22;
  v38 = v29;
  objc_copyWeak(v45, &location);
  v45[1] = v24;
  v30 = v34;
  v39 = v30;
  v44 = v63;
  objc_msgSend(v26, "setCompletionBlock:", v35);
  -[NSOperationQueue addOperation:](self->_asyncOperationQueue, "addOperation:", v58[5]);
  v31 = (id)v58[5];

  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);

  return v31;
}

void __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (objc_msgSend(v10, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SBUILegibilityErrorDomain, 3072, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 72);
LABEL_5:
    v8 = *(_QWORD *)(v3 + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v2;

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "executeBlurForImage:settings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(double **)(a1 + 96);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "applyStrength:toImage:settings:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 48), *v7);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 88);
    goto LABEL_5;
  }
LABEL_6:

}

void __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  id v12[2];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_3;
  block[3] = &unk_1E4C3FE40;
  v9 = *(_OWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 80);
  v7 = *(id *)(a1 + 48);
  objc_copyWeak(v12, (id *)(a1 + 104));
  v12[1] = *(id *)(a1 + 112);
  v2 = *(id *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 96);
  v8 = v2;
  v11 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v12);
}

void __105__SBUILegibilityMetalEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (objc_msgSend(v14, "isCancelled") && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SBUILegibilityErrorDomain, 3072, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v9 = *(_QWORD *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    objc_msgSend(v5, "updateOrigImage:shadowImage:strengthenedShadowImage:settings:engine:isTemplate:withStrength:context:", v6, v7, v8, v9, WeakRetained, 0, *(_QWORD *)(a1 + 112), v14);

  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id, _QWORD))(v11 + 16))(v11, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 112), v14, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6
{
  double width;
  id v10;
  NSObject *v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  double size;
  _QWORD v25[6];
  uint8_t buf[4];
  SBUILegibilityMetalEngine *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGSize v33;

  size = a4.height;
  width = a4.width;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityMetalEngine.m"), 409, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

  }
  if (width > 0.0 && size > 0.0 && self->_useMinFillHeightForTemplateGeneration)
  {
    if (-[SBUILegibilityCache containsTemplateForSettings:](self->_legibilityCache, "containsTemplateForSettings:", v10, size))
    {
      SBLogLegibility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v33.width = width;
        v33.height = size;
        NSStringFromCGSize(v33);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = self;
        v28 = 2048;
        v29 = v10;
        v30 = 2112;
        v31 = v21;
        _os_log_debug_impl(&dword_1A471F000, v11, OS_LOG_TYPE_DEBUG, "(%@) Bailing; templateImageForSettings already exists for settings %p, maxSize %@",
          buf,
          0x20u);

      }
    }
    else
    {
      -[UIScreen scale](self->_screen, "scale");
      if (v12 != a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Screen scale is not what configured with!"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[SBUILegibilityMetalEngine prewarmForSettings:maxSize:minSize:scale:].cold.1(a2, (uint64_t)self, (uint64_t)v23);
        objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A476E0ACLL);
      }
      -[SBUILegibilityCache memoryPoolForGraphicsContextType:matchingSize:scale:](self->_legibilityCache, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, SBUILegibilityImageSizeForContentSizeAndSettings(v10, width));
      v11 = objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 10; ++i)
      {
        UIRoundToScale();
        v15 = v14;
        UIRoundToScale();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __70__SBUILegibilityMetalEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke;
        v25[3] = &__block_descriptor_48_e5_v8__0l;
        *(double *)&v25[4] = v15;
        *(double *)&v25[5] = v16;
        objc_msgSend(MEMORY[0x1E0CEA638], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 4, v11, v25, v15, v16, a6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBUILegibilityMetalEngine _findEngineConfigurationMatchingScreen:settings:](self, "_findEngineConfigurationMatchingScreen:settings:", self->_screen, v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "executeBlurForImage:settings:", v17, v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[SBUILegibilityCache cacheTemplateShadowImage:settings:maxSize:](self->_legibilityCache, "cacheTemplateShadowImage:settings:maxSize:", v19, v10, width, size);
          SBLogLegibility();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v27 = self;
            v28 = 2048;
            v29 = v10;
            _os_log_impl(&dword_1A471F000, v20, OS_LOG_TYPE_DEFAULT, "(%@) Prewarmed legibility background for settings %p", buf, 0x16u);
          }
        }
        else
        {
          SBLogLegibility();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = self;
            v28 = 2048;
            v29 = v10;
            _os_log_error_impl(&dword_1A471F000, v20, OS_LOG_TYPE_ERROR, "(%@) FAILED to Prewarm legibility background for settings %p", buf, 0x16u);
          }
        }

      }
    }

  }
}

void __70__SBUILegibilityMetalEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke(uint64_t a1)
{
  void *v2;
  CGRect v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  v3.size.width = *(CGFloat *)(a1 + 32);
  v3.size.height = *(CGFloat *)(a1 + 40);
  v3.origin.x = 0.0;
  v3.origin.y = 0.0;
  UIRectFill(v3);
}

- (id)applyStrength:(double)a3 toImage:(id)a4 settings:(id)a5
{
  id v8;
  SBUILegibilityCache *legibilityCache;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  legibilityCache = self->_legibilityCache;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SBUILegibilityMetalEngine_applyStrength_toImage_settings___block_invoke;
  v13[3] = &unk_1E4C3FE88;
  v14 = v8;
  v10 = v8;
  -[SBUILegibilityCache cachedStrengthForImage:strength:generator:](legibilityCache, "cachedStrengthForImage:strength:generator:", a4, v13, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __60__SBUILegibilityMetalEngine_applyStrength_toImage_settings___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  void *v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "size");
  objc_msgSend(v5, "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v4, 4, 0, a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBFPreheatImageData();
  return v8;
}

- (CGSize)calculateShadowImageViewSizeForOriginalImage:(id)a3 shadowImage:(id)a4 settings:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v6 = a5;
  objc_msgSend(a3, "size");
  v8 = SBUILegibilityImageSizeForContentSizeAndSettings(v6, v7);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_findEngineConfigurationMatchingScreen:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  NSMapTable *enginesForSettingsForScreen;
  NSMapTable *v9;
  NSMapTable *v10;
  void *v11;
  uint64_t v12;
  _SBUILegibilityMetalEngineConfiguration *v13;
  _SBUILegibilityMetalEngineConfiguration *v14;

  v6 = a3;
  v7 = a4;
  enginesForSettingsForScreen = self->_enginesForSettingsForScreen;
  if (!enginesForSettingsForScreen)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_enginesForSettingsForScreen;
    self->_enginesForSettingsForScreen = v9;

    enginesForSettingsForScreen = self->_enginesForSettingsForScreen;
  }
  -[NSMapTable objectForKey:](enginesForSettingsForScreen, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (_SBUILegibilityMetalEngineConfiguration *)v12;
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_enginesForSettingsForScreen, "setObject:forKey:", v11, v7);
    }
    v13 = -[_SBUILegibilityMetalEngineConfiguration initWithScreen:settings:algo:]([_SBUILegibilityMetalEngineConfiguration alloc], "initWithScreen:settings:algo:", v6, v7, self->_algorithm);
    objc_msgSend(v11, "setObject:forKey:", v13, v6);
  }
  v14 = v13;

  return v14;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_engineIdentifier, CFSTR("engineIdentifier"));
  if (self->_algorithm)
    v4 = CFSTR("Gaussian");
  else
    v4 = CFSTR("Tent");
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("algorithm"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_teardownCaches:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  SBUILegibilityMetalEngine *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSOperationQueue cancelAllOperations](self->_asyncOperationQueue, "cancelAllOperations");
  -[SBUILegibilityCache removeAllObjects](self->_legibilityCache, "removeAllObjects");
  SBLogLegibility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "(%@) Cache teardown complete; requested by %@",
      (uint8_t *)&v6,
      0x16u);
  }

}

- (BOOL)useMinFillHeightForTemplateGeneration
{
  return self->_useMinFillHeightForTemplateGeneration;
}

- (void)setUseMinFillHeightForTemplateGeneration:(BOOL)a3
{
  self->_useMinFillHeightForTemplateGeneration = a3;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncOperationQueue, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_enginesForSettingsForScreen, 0);
  objc_storeStrong((id *)&self->_legibilityCache, 0);
  objc_storeStrong((id *)&self->_engineIdentifier, 0);
}

- (void)prewarmForSettings:(uint64_t)a3 maxSize:minSize:scale:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBUILegibilityMetalEngine.m");
  v16 = 1024;
  v17 = 423;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A471F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end

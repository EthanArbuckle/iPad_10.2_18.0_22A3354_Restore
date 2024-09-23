@implementation SBUILegibilityDefaultEngine

void __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  double Current;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  double v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (objc_msgSend(v2, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SBUILegibilityErrorDomain, 3072, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    SBLogLegibility();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    Current = 0.0;
    if (v7)
      Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(a1 + 32), "size");
    v10 = SBUILegibilityImageSizeForContentSizeAndSettings(*(void **)(a1 + 40), v9);
    v12 = v11;
    v13 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
    objc_msgSend(*(id *)(a1 + 32), "scale");
    objc_msgSend(v13, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, v10, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CEA638];
    v17 = *(double *)(a1 + 88);
    v19 = *(void **)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v19, "size");
    objc_msgSend(v16, "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:strength:type:pool:", v18, v19, 0, 0, 4, v15, v17, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    v25 = *(double **)(a1 + 96);
    if (v25)
    {
      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *v25;
      objc_msgSend(v26, "size");
      objc_msgSend(v26, "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v27, 4, v15, v28, v29, v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

    }
    SBLogLegibility();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);

    if (v35)
    {
      v36 = CFAbsoluteTimeGetCurrent();
      SBLogLegibility();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *(_QWORD *)(a1 + 32);
        v39 = *(_QWORD *)(a1 + 40);
        v40 = 138412802;
        v41 = v38;
        v42 = 2048;
        v43 = v39;
        v44 = 2048;
        v45 = v36 - Current;
        _os_log_impl(&dword_1A471F000, v37, OS_LOG_TYPE_DEFAULT, "Async Shadow Draw time for image '%@', settings '%p': '%f' seconds", (uint8_t *)&v40, 0x20u);
      }

    }
  }

}

- (id)executeAsyncLegibilityUpdateForContainer:(id)a3 image:(id)a4 settings:(id)a5 strength:(double *)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  id v43[2];
  id location;
  _QWORD v45[4];
  id v46;
  id v47;
  SBUILegibilityDefaultEngine *v48;
  uint64_t *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[4];
  char v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v32 = a7;
  objc_msgSend(v12, "_screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v12, "_screen");
  else
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;

  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__4;
  v67[4] = __Block_byref_object_dispose__4;
  v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__4;
  v65[4] = __Block_byref_object_dispose__4;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__4;
  v63[4] = __Block_byref_object_dispose__4;
  v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2810000000;
  v61[3] = &unk_1A47C033D;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__4;
  v59 = __Block_byref_object_dispose__4;
  v60 = 0;
  v19 = (void *)MEMORY[0x1E0CB34C8];
  v20 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke;
  v45[3] = &unk_1E4C401F8;
  v49 = &v55;
  v50 = v63;
  v21 = v13;
  v46 = v21;
  v22 = v14;
  v47 = v22;
  v48 = self;
  v53 = v18;
  v54 = a6;
  v51 = v67;
  v52 = v65;
  objc_msgSend(v19, "blockOperationWithBlock:", v45);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v56[5];
  v56[5] = v23;

  objc_initWeak(&location, self);
  v25 = (void *)v56[5];
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_20;
  v33[3] = &unk_1E4C3FE40;
  v38 = &v55;
  v39 = v63;
  v26 = v12;
  v34 = v26;
  v27 = v21;
  v35 = v27;
  v40 = v67;
  v41 = v65;
  v28 = v22;
  v36 = v28;
  objc_copyWeak(v43, &location);
  v43[1] = a6;
  v29 = v32;
  v37 = v29;
  v42 = v61;
  objc_msgSend(v25, "setCompletionBlock:", v33);
  -[NSOperationQueue addOperation:](self->_asyncOperationQueue, "addOperation:", v56[5]);
  v30 = (id)v56[5];

  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

  return v30;
}

- (void)executeLegibilityUpdateForContainer:(id)a3 forImage:(id)a4 settings:(id)a5 strength:(double *)a6 engineResult:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  SBUILegibilityDefaultEngine *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  int v31;
  uint8_t buf[4];
  SBUILegibilityDefaultEngine *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(v12, "_screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v12, "_screen");
  else
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;

  if (!self->_useMinFillHeightForTemplateGeneration)
    goto LABEL_12;
  objc_msgSend(v12, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!BSEqualObjects())
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v12, "legibilityEngine");
  v22 = (SBUILegibilityDefaultEngine *)objc_claimAutoreleasedReturnValue();
  if (v22 != self)
  {

    goto LABEL_11;
  }
  objc_msgSend(v12, "legibilitySettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = BSEqualObjects();

  if (!v31)
  {
LABEL_12:
    if (v16)
    {
      SBLogLegibility();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v33 = self;
        v34 = 2112;
        v35 = v12;
        v36 = 2112;
        v37 = v13;
        v38 = 2048;
        v39 = v14;
        _os_log_debug_impl(&dword_1A471F000, v23, OS_LOG_TYPE_DEBUG, "(%@) Legibility background image already prepared for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      v24 = v16;
      if (a7)
      {
        a7->var0 = 1;
        v24 = v16;
      }
      if (a6)
      {
LABEL_18:
        -[SBUILegibilityDefaultEngine applyStrength:toImage:settings:](self, "applyStrength:toImage:settings:", v24, v14, *a6);
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        objc_msgSend(v12, "updateOrigImage:shadowImage:strengthenedShadowImage:settings:engine:isTemplate:withStrength:context:", v13, v24, v25, v14, self, v16 != 0, a6, 0);
        goto LABEL_24;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v13, "size");
      objc_msgSend(v26, "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:", v14, v13, 1, 4, 0, v20, v27, v28);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogLegibility();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v33 = self;
        v34 = 2112;
        v35 = v12;
        v36 = 2112;
        v37 = v13;
        v38 = 2048;
        v39 = v14;
        _os_log_impl(&dword_1A471F000, v29, OS_LOG_TYPE_DEFAULT, "(%@) Drew legibility background image for view '%@' / image '%@', settings '%p'", buf, 0x2Au);
      }

      if (a6)
        goto LABEL_18;
    }
    v25 = 0;
    goto LABEL_23;
  }
  SBLogLegibility();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v33 = self;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2048;
    v39 = v14;
    _os_log_debug_impl(&dword_1A471F000, v25, OS_LOG_TYPE_DEBUG, "(%@) Skipping legibility background image generation for view '%@' / image '%@', settings '%p'; this is redundent",
      buf,
      0x2Au);
  }
  v24 = v16;
LABEL_24:

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

void __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2(uint64_t a1)
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

- (id)applyStrength:(double)a3 toImage:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  SBUILegibilityCache *legibilityCache;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  SBUILegibilityDefaultEngine *v18;

  v8 = a4;
  v9 = a5;
  legibilityCache = self->_legibilityCache;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__SBUILegibilityDefaultEngine_applyStrength_toImage_settings___block_invoke;
  v15[3] = &unk_1E4C40248;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v11 = v9;
  v12 = v8;
  -[SBUILegibilityCache cachedStrengthForImage:strength:generator:](legibilityCache, "cachedStrengthForImage:strength:generator:", v12, v15, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __62__SBUILegibilityDefaultEngine_applyStrength_toImage_settings___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "size");
  v8 = SBUILegibilityImageSizeForContentSizeAndSettings(*(void **)(a1 + 40), v7);
  v10 = v9;
  v11 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  objc_msgSend(v11, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "size");
  objc_msgSend(v6, "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v14, 4, v13, a3, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  SBFPreheatImageData();
  return v17;
}

- (SBUILegibilityDefaultEngine)initWithEngineIdentifier:(id)a3
{
  id v5;
  SBUILegibilityDefaultEngine *v6;
  uint64_t v7;
  NSString *engineIdentifier;
  NSOperationQueue *v9;
  NSOperationQueue *asyncOperationQueue;
  void *v11;
  SBUILegibilityCache *v12;
  SBUILegibilityCache *legibilityCache;
  void *v15;
  objc_super v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityDefaultEngine.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("engineIdentifier"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SBUILegibilityDefaultEngine;
  v6 = -[SBUILegibilityDefaultEngine init](&v16, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    engineIdentifier = v6->_engineIdentifier;
    v6->_engineIdentifier = (NSString *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    asyncOperationQueue = v6->_asyncOperationQueue;
    v6->_asyncOperationQueue = v9;

    -[NSOperationQueue setQualityOfService:](v6->_asyncOperationQueue, "setQualityOfService:", 25);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__teardownCaches_, CFSTR("SBUILegibilityEngineShouldClearCachesNotification"), 0);

    v12 = -[SBUILegibilityCache initWithEngine:]([SBUILegibilityCache alloc], "initWithEngine:", v6);
    legibilityCache = v6->_legibilityCache;
    v6->_legibilityCache = v12;

  }
  return v6;
}

void __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke(uint64_t a1)
{
  double v2;
  CGFloat v3;
  CGFloat v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  v21 = *MEMORY[0x1E0C80C00];
  UIRoundToScale();
  v3 = v2;
  UIRoundToScale();
  v22.size.height = v4;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v3;
  v23 = CGRectIntegral(v22);
  objc_msgSend(MEMORY[0x1E0CEA638], "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:", *(_QWORD *)(a1 + 32), 0, 1, 4, *(_QWORD *)(a1 + 40), *(double *)(a1 + 96), v23.size.width, v23.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "cacheTemplateShadowImage:settings:maxSize:", v5, *(_QWORD *)(a1 + 32), *(double *)(a1 + 112), *(double *)(a1 + 120));
    SBLogLegibility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 138413058;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = 10;
      v19 = 2048;
      v20 = v9;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "(%@) Prewarmed %lu / %lu legibility background for settings %p", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    SBLogLegibility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138413058;
      v14 = v10;
      v15 = 2048;
      v16 = v11;
      v17 = 2048;
      v18 = 10;
      v19 = 2048;
      v20 = v12;
      _os_log_error_impl(&dword_1A471F000, v6, OS_LOG_TYPE_ERROR, "(%@) FAILED to Prewarm legibility background %lu / %lu for settings %p", (uint8_t *)&v13, 0x2Au);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)prewarmForSettings:(id)a3 maxSize:(CGSize)a4 minSize:(CGSize)a5 scale:(double)a6
{
  double height;
  double width;
  double v9;
  double v10;
  SBUILegibilityDefaultEngine *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  CFAbsoluteTime Current;
  NSObject *v19;
  void *v20;
  uint64_t i;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  CFAbsoluteTime v31;
  _QWORD block[4];
  id v33;
  id v34;
  SBUILegibilityDefaultEngine *v35;
  NSObject *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint8_t buf[4];
  SBUILegibilityDefaultEngine *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;
  CGSize v52;

  height = a5.height;
  width = a5.width;
  v9 = a4.height;
  v10 = a4.width;
  v51 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUILegibilityDefaultEngine.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

  }
  if (v10 > 0.0 && v9 > 0.0 && self->_useMinFillHeightForTemplateGeneration)
  {
    v13 = self;
    objc_sync_enter(v13);
    if (-[SBUILegibilityCache containsTemplateForSettings:](v13->_legibilityCache, "containsTemplateForSettings:", v28))
    {
      SBLogLegibility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v52.width = v10;
        v52.height = v9;
        NSStringFromCGSize(v52);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v46 = v13;
        v47 = 2048;
        v48 = v28;
        v49 = 2112;
        v50 = v15;
        _os_log_debug_impl(&dword_1A471F000, v14, OS_LOG_TYPE_DEBUG, "(%@) Bailing; templateImageForSettings already exists for settings %p, maxSize %@",
          buf,
          0x20u);

      }
    }
    else
    {
      SBLogLegibility();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

      Current = 0.0;
      if (v17)
        Current = CFAbsoluteTimeGetCurrent();
      v19 = dispatch_group_create();
      -[SBUILegibilityCache memoryPoolForGraphicsContextType:matchingSize:scale:](v13->_legibilityCache, "memoryPoolForGraphicsContextType:matchingSize:scale:", 4, SBUILegibilityImageSizeForContentSizeAndSettings(v28, v10));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 10; ++i)
      {
        dispatch_group_enter(v19);
        dispatch_get_global_queue(0, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke;
        block[3] = &unk_1E4C40220;
        v37 = i;
        v38 = width;
        v39 = height;
        v40 = v10 - width;
        v41 = a6;
        v42 = v9 - height;
        v23 = v28;
        v33 = v23;
        v24 = v20;
        v34 = v24;
        v35 = v13;
        v43 = v10;
        v44 = v9;
        v14 = v19;
        v36 = v14;
        dispatch_async(v22, block);

      }
      SBLogLegibility();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);

      if (v26)
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke_23;
        v29[3] = &unk_1E4C3E600;
        v31 = Current;
        v29[4] = v13;
        v30 = v23;
        dispatch_group_notify(v14, MEMORY[0x1E0C80D38], v29);

      }
    }

    objc_sync_exit(v13);
  }

}

- (void)setUseMinFillHeightForTemplateGeneration:(BOOL)a3
{
  self->_useMinFillHeightForTemplateGeneration = a3;
}

+ (id)defaultEngine
{
  if (defaultEngine_onceToken != -1)
    dispatch_once(&defaultEngine_onceToken, &__block_literal_global_31);
  return (id)defaultEngine_defaultEngine;
}

void __44__SBUILegibilityDefaultEngine_defaultEngine__block_invoke()
{
  SBUILegibilityDefaultEngine *v0;
  void *v1;

  v0 = -[SBUILegibilityDefaultEngine initWithEngineIdentifier:]([SBUILegibilityDefaultEngine alloc], "initWithEngineIdentifier:", CFSTR("Default Engine"));
  -[SBUILegibilityDefaultEngine setUseMinFillHeightForTemplateGeneration:](v0, "setUseMinFillHeightForTemplateGeneration:", 1);
  v1 = (void *)defaultEngine_defaultEngine;
  defaultEngine_defaultEngine = (uint64_t)v0;

}

void __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_20(uint64_t a1)
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
  block[2] = __107__SBUILegibilityDefaultEngine_executeAsyncLegibilityUpdateForContainer_image_settings_strength_completion___block_invoke_2;
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

void __72__SBUILegibilityDefaultEngine_prewarmForSettings_maxSize_minSize_scale___block_invoke_23(uint64_t a1)
{
  double Current;
  double v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(double *)(a1 + 48);
  SBLogLegibility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138413058;
    v8 = v5;
    v9 = 2048;
    v10 = 10;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = Current - v3;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "(%@) Finished prewarm of %lu legibility backgrounds for settings %p in %f seconds", (uint8_t *)&v7, 0x2Au);
  }

}

- (void)_teardownCaches:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  SBUILegibilityDefaultEngine *v7;
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

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_engineIdentifier, CFSTR("engineIdentifier"));
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)useMinFillHeightForTemplateGeneration
{
  return self->_useMinFillHeightForTemplateGeneration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncOperationQueue, 0);
  objc_storeStrong((id *)&self->_engineIdentifier, 0);
  objc_storeStrong((id *)&self->_legibilityCache, 0);
}

@end

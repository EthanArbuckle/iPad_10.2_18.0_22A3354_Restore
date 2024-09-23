@implementation PXAssetVariationRenderProvider

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if ((void *)PXEditSourceLoaderProgressObservationContext != a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetVariationRenderProvider.m"), 99, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v14 = v13;
  NSStringFromSelector(sel_completedUnitCount);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "isEqualToString:", v15);

  if (v16)
    px_dispatch_on_main_queue();

}

- (PXAssetVariationRenderProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetVariationRenderProvider.m"), 113, CFSTR("%s is not available as initializer"), "-[PXAssetVariationRenderProvider init]");

  abort();
}

- (void)dealloc
{
  NSProgress *observedEditSourceLoaderProgress;
  void *v4;
  NSProgress *v5;
  void *v6;
  objc_super v7;

  observedEditSourceLoaderProgress = self->_observedEditSourceLoaderProgress;
  NSStringFromSelector(sel_completedUnitCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress removeObserver:forKeyPath:context:](observedEditSourceLoaderProgress, "removeObserver:forKeyPath:context:", self, v4, PXEditSourceLoaderProgressObservationContext);

  v5 = self->_observedEditSourceLoaderProgress;
  self->_observedEditSourceLoaderProgress = 0;

  -[PXEditSourceLoader progress](self->_editSourceLoader, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[NSOperation cancel](self->__analysisOperation, "cancel");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->__renderingOperationsByVariationType, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_144);
  v7.receiver = self;
  v7.super_class = (Class)PXAssetVariationRenderProvider;
  -[PXAssetVariationRenderProvider dealloc](&v7, sel_dealloc);
}

- (PXAssetVariationRenderProvider)initWithEditSourceLoader:(id)a3 targetSize:(CGSize)a4 desiredVariationTypes:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  PXAssetVariationRenderProvider *v12;
  PXAssetVariationRenderProvider *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXUpdater *updater;
  NSMutableDictionary *v18;
  NSMutableDictionary *resultsByVariationType;
  NSMutableDictionary *v20;
  NSMutableDictionary *progressesByVariationType;
  NSMutableDictionary *v22;
  NSMutableDictionary *renderingOperationsByVariationType;
  NSMutableDictionary *v24;
  NSMutableDictionary *renderingDurationByVariationType;
  uint64_t v26;
  NSProgress *initialLoadingProgress;
  uint64_t v28;
  NSProgress *recipeGenerationProgress;
  void *v30;
  objc_super v32;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PXAssetVariationRenderProvider;
  v12 = -[PXAssetVariationRenderProvider init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_editSourceLoader, a3);
    v13->_targetSize.width = width;
    v13->_targetSize.height = height;
    if (v11)
    {
      v14 = (void *)objc_msgSend(v11, "copy");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "supportedVariationTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    objc_storeStrong((id *)&v13->_desiredVariationTypes, v14);

    v16 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v13);
    updater = v13->_updater;
    v13->_updater = (PXUpdater *)v16;

    -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateCachedAnalysisResult);
    -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateAnalysisResult);
    -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateRenders);
    -[PXUpdater addUpdateSelector:](v13->_updater, "addUpdateSelector:", sel__updateStatus);
    -[PXUpdater setNeedsUpdateOf:](v13->_updater, "setNeedsUpdateOf:", sel__updateCachedAnalysisResult);
    -[PXUpdater setNeedsUpdateOf:](v13->_updater, "setNeedsUpdateOf:", sel__updateRenders);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resultsByVariationType = v13->_resultsByVariationType;
    v13->_resultsByVariationType = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    progressesByVariationType = v13->_progressesByVariationType;
    v13->_progressesByVariationType = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    renderingOperationsByVariationType = v13->__renderingOperationsByVariationType;
    v13->__renderingOperationsByVariationType = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    renderingDurationByVariationType = v13->__renderingDurationByVariationType;
    v13->__renderingDurationByVariationType = v24;

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
    v26 = objc_claimAutoreleasedReturnValue();
    initialLoadingProgress = v13->_initialLoadingProgress;
    v13->_initialLoadingProgress = (NSProgress *)v26;

    v13->_status = 1;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v28 = objc_claimAutoreleasedReturnValue();
    recipeGenerationProgress = v13->_recipeGenerationProgress;
    v13->_recipeGenerationProgress = (NSProgress *)v28;

    objc_msgSend(v10, "progress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSProgress px_appendChild:withPendingUnitCount:](v13->_initialLoadingProgress, "px_appendChild:withPendingUnitCount:", v30, 100);
    -[NSProgress px_appendChild:withPendingUnitCount:](v13->_initialLoadingProgress, "px_appendChild:withPendingUnitCount:", v13->_recipeGenerationProgress, 50);
    v13->_signpostID = 0;

  }
  return v13;
}

- (id)renderResultForVariationType:(int64_t)a3
{
  NSMutableDictionary *resultsByVariationType;
  void *v4;
  void *v5;

  resultsByVariationType = self->_resultsByVariationType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](resultsByVariationType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)beginRendering
{
  _QWORD v2[5];

  if (!self->_hasBegunRendering)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __48__PXAssetVariationRenderProvider_beginRendering__block_invoke;
    v2[3] = &unk_1E51479C8;
    v2[4] = self;
    -[PXAssetVariationRenderProvider performChanges:](self, "performChanges:", v2);
  }
}

- (void)cancelRendering
{
  NSProgress *observedEditSourceLoaderProgress;
  void *v4;
  NSProgress *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_hasBegunRendering = 0;
  observedEditSourceLoaderProgress = self->_observedEditSourceLoaderProgress;
  NSStringFromSelector(sel_completedUnitCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress removeObserver:forKeyPath:context:](observedEditSourceLoaderProgress, "removeObserver:forKeyPath:context:", self, v4, PXEditSourceLoaderProgressObservationContext);

  v5 = self->_observedEditSourceLoaderProgress;
  self->_observedEditSourceLoaderProgress = 0;

  -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[PXAssetVariationRenderProvider _analysisOperation](self, "_analysisOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[PXAssetVariationRenderProvider _setAnalysisOperation:](self, "_setAnalysisOperation:", 0);
  -[PXAssetVariationRenderProvider _renderingOperationsByVariationType](self, "_renderingOperationsByVariationType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_162_87555);

}

- (id)progressForVariationType:(int64_t)a3
{
  NSMutableDictionary *progressesByVariationType;
  void *v4;
  void *v5;

  progressesByVariationType = self->_progressesByVariationType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](progressesByVariationType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTargetSize:(CGSize)a3
{
  double height;
  double width;
  void *v8;
  _QWORD v9[7];

  height = a3.height;
  width = a3.width;
  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetVariationRenderProvider.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetSize.width > 0 && targetSize.height > 0"));

  }
  if (width != self->_targetSize.width || height != self->_targetSize.height)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__PXAssetVariationRenderProvider_setTargetSize___block_invoke;
    v9[3] = &unk_1E51449E0;
    v9[4] = self;
    *(double *)&v9[5] = width;
    *(double *)&v9[6] = height;
    -[PXAssetVariationRenderProvider performChanges:](self, "performChanges:", v9);
  }
}

- (void)didPerformChanges
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXAssetVariationRenderProvider;
  -[PXAssetVariationRenderProvider didPerformChanges](&v2, sel_didPerformChanges);
  px_dispatch_on_main_queue();
}

- (BOOL)_hasAllResults
{
  PXAssetVariationRenderProvider *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[PXAssetVariationRenderProvider desiredVariationTypes](self, "desiredVariationTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PXAssetVariationRenderProvider__hasAllResults__block_invoke;
  v5[3] = &unk_1E5136440;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_invalidateStatus
{
  px_dispatch_on_main_queue();
}

- (void)_updateStatus
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  _QWORD v21[5];
  __CFString *v22;
  uint64_t v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  -[PXAssetVariationRenderProvider error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = CFSTR("Failed");
    v6 = 5;
  }
  else if (self->_hasBegunRendering)
  {
    v8 = -[PXAssetVariationRenderProvider _hasAllResults](self, "_hasAllResults");
    -[PXAssetVariationRenderProvider analysisResult](self, "analysisResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = CFSTR("Finished");
      v6 = 4;
    }
    else
    {
      -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "editSource");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "compositionController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v5 = CFSTR("Generating Recipes");
        else
          v5 = CFSTR("Loading Resources");
        v6 = 2;
        if (v14 && v9)
        {
          v25 = 0;
          v26 = &v25;
          v27 = 0x2020000000;
          v28 = -1;
          -[PXAssetVariationRenderProvider _renderingOperationsByVariationType](self, "_renderingOperationsByVariationType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v4;
          v24[1] = 3221225472;
          v24[2] = __47__PXAssetVariationRenderProvider__updateStatus__block_invoke;
          v24[3] = &unk_1E5124240;
          v24[4] = &v25;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v24);

          v16 = v26[3];
          if (v16 == -1)
          {
            v5 = CFSTR("Rendering");
          }
          else
          {
            v17 = (void *)MEMORY[0x1E0CB3940];
            v18 = v16 + 1;
            if (v18 > 4)
              v19 = CFSTR("Unknown");
            else
              v19 = off_1E5121BA8[v18];
            v20 = v19;
            objc_msgSend(v17, "stringWithFormat:", CFSTR("Rendering %@"), v20);
            v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          _Block_object_dispose(&v25, 8);
          v6 = 3;
        }
      }
      else
      {

        v5 = CFSTR("Loading Resources");
        v6 = 2;
      }
    }
  }
  else
  {
    v5 = &stru_1E5149688;
    v6 = 1;
  }
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __47__PXAssetVariationRenderProvider__updateStatus__block_invoke_2;
  v21[3] = &unk_1E5144A98;
  v22 = v5;
  v23 = v6;
  v21[4] = self;
  v7 = v5;
  -[PXAssetVariationRenderProvider performChanges:](self, "performChanges:", v21);

}

- (void)_invalidateCachedAnalysisResult
{
  px_dispatch_on_main_queue();
}

- (int64_t)_variationSourceType
{
  return 0;
}

- (void)_updateCachedAnalysisResult
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  if (!-[PXAssetVariationRenderProvider _hasAllResults](self, "_hasAllResults"))
  {
    -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeEditSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "contentIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PXAssetVariationRenderProvider _variationSourceType](self, "_variationSourceType");
      if (v5)
      {
        v7 = (void *)v6;
        objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "variationCache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __61__PXAssetVariationRenderProvider__updateCachedAnalysisResult__block_invoke;
        v12[3] = &unk_1E513A518;
        v11 = v9;
        v13 = v11;
        v14 = v5;
        v15[1] = v7;
        objc_copyWeak(v15, &location);
        objc_msgSend(v10, "addOperationWithBlock:", v12);

        objc_destroyWeak(v15);
        objc_destroyWeak(&location);

      }
      else
      {
        -[PXAssetVariationRenderProvider _handleCachedAnalysisResult:](self, "_handleCachedAnalysisResult:", 0);
      }

    }
  }
}

- (void)_handleCachedAnalysisResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PXAssetVariationRenderProvider__handleCachedAnalysisResult___block_invoke;
  v6[3] = &unk_1E5144868;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXAssetVariationRenderProvider performChanges:](self, "performChanges:", v6);

}

- (void)_invalidateAnalysisResult
{
  px_dispatch_on_main_queue();
}

- (void)_updateAnalysisResult
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXAutoloopAnalysisOperation *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  PXAssetVariationRenderProvider *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  +[PXAssetVariationsSettings sharedInstance](PXAssetVariationsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "simulateLoadingFailure");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("Simulated Failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderProviderErrorDomain"), 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetVariationRenderProvider _setError:](self, "_setError:", v7);

  }
  else
  {
    -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeEditSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PXAssetVariationRenderProvider analysisResult](self, "analysisResult");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {

        }
        else
        {
          -[PXAssetVariationRenderProvider _analysisOperation](self, "_analysisOperation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v15 = -[PXAutoloopAnalysisOperation initWithEditSource:]([PXAutoloopAnalysisOperation alloc], "initWithEditSource:", v6);
            objc_initWeak((id *)buf, self);
            objc_initWeak(&location, v15);
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __55__PXAssetVariationRenderProvider__updateAnalysisResult__block_invoke;
            v18[3] = &unk_1E5144DF8;
            objc_copyWeak(&v19, (id *)buf);
            objc_copyWeak(&v20, &location);
            -[PXAutoloopAnalysisOperation setCompletionBlock:](v15, "setCompletionBlock:", v18);
            -[PXAssetVariationRenderProvider _setAnalysisOperation:](self, "_setAnalysisOperation:", v15);
            -[PXAutoloopAnalysisOperation progress](v15, "progress");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSProgress setCompletedUnitCount:](self->_recipeGenerationProgress, "setCompletedUnitCount:", 0);
            -[NSProgress addChild:withPendingUnitCount:](self->_recipeGenerationProgress, "addChild:withPendingUnitCount:", v16, -[NSProgress totalUnitCount](self->_recipeGenerationProgress, "totalUnitCount"));
            objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addOperation:", v15);

            objc_destroyWeak(&v20);
            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);

          }
        }
      }
      else
      {
        PLUIGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v25 = self;
          v26 = 2112;
          v27 = v6;
          _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "%@: expected Live Photo Edit Source, but got %@", buf, 0x16u);
        }

        v11 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2D50];
        v23 = CFSTR("Expected Live Photo Edit Source");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderProviderErrorDomain"), 1, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAssetVariationRenderProvider _setError:](self, "_setError:", v13);

      }
    }
  }

}

- (void)_handleAnalysisOperationCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[2];
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isCancelled") & 1) == 0)
    {
      -[PXAssetVariationRenderProvider _analysisOperation](self, "_analysisOperation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v5)
      {
        objc_msgSend(v5, "duration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAssetVariationRenderProvider _setRecipeGenerationDuration:](self, "_setRecipeGenerationDuration:", v7);

        -[PXAssetVariationRenderProvider _setAnalysisOperation:](self, "_setAnalysisOperation:", 0);
        if (objc_msgSend(v5, "succeeded"))
        {
          objc_msgSend(v5, "analysisResult");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "contentIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = -[PXAssetVariationRenderProvider _variationSourceType](self, "_variationSourceType");
          objc_initWeak(&location, self);
          objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke;
          v18[3] = &unk_1E513A518;
          objc_copyWeak(v21, &location);
          v13 = v8;
          v19 = v13;
          v14 = v10;
          v20 = v14;
          v21[1] = v11;
          objc_msgSend(v12, "addOperationWithBlock:", v18);

          objc_destroyWeak(v21);
          objc_destroyWeak(&location);
        }
        else
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v5, "error");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v5, "error");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);

          }
          objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Failed to generate asset variation recipes."), *MEMORY[0x1E0CB2D50]);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderProviderErrorDomain"), 2, v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v17;
          px_dispatch_on_main_queue();

        }
      }
    }
  }

}

- (void)_invalidateRenders
{
  px_dispatch_on_main_queue();
}

- (void)_updateRenders
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSError *v14;
  NSError *error;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;
  PXAssetVariationRenderProvider *v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  PXAssetVariationRenderProvider *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PXAssetVariationRenderProvider desiredVariationTypes](self, "desiredVariationTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderProvider analysisResult](self, "analysisResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editSource");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_11;
  v7 = (void *)v6;
  -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "compositionController");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

LABEL_10:
LABEL_11:

    goto LABEL_12;
  }
  v10 = (void *)v9;
  v11 = objc_msgSend(v3, "count");

  if (v11 && v4)
  {
    -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PLUIGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v32 = self;
          v33 = 2112;
          v34 = v5;
          _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "%@: expected Live Photo Edit Source, but got %@", buf, 0x16u);
        }

        v17 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2D50];
        v30 = CFSTR("Expected Live Photo Edit Source");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PXAssetVariationRenderProviderErrorDomain"), 1, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAssetVariationRenderProvider _setError:](self, "_setError:", v19);

        goto LABEL_11;
      }
    }
    -[PXAssetVariationRenderProvider editSourceLoader](self, "editSourceLoader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "compositionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PXEditSourceLoader baseVersion](self->_editSourceLoader, "baseVersion"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXEditSourceLoaderErrorDomain"), 0, 0);
      v14 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v14;

    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke;
      aBlock[3] = &unk_1E5124270;
      v25 = v4;
      v26 = v5;
      v27 = v7;
      v28 = self;
      v22[0] = v20;
      v22[1] = 3221225472;
      v22[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_5;
      v22[3] = &unk_1E5135800;
      v23 = _Block_copy(aBlock);
      v21 = v23;
      objc_msgSend(v3, "enumerateIndexesUsingBlock:", v22);

    }
    goto LABEL_10;
  }
LABEL_12:

}

- (void)_handleRenderingOperationStarted:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)_handleRenderingOperationCompleted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v4, "outputImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputVideoURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageWithContentsOfFile:", v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "outputAVAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v6);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v20 = v4;
    v21 = v5;
    v22 = v6;
    v23 = v9;
    v16 = v15;
    v17 = v9;
    v18 = v6;
    v19 = v5;
    px_dispatch_on_main_queue();

  }
}

- (void)_setResult:(id)a3 forVariationType:(int64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  px_dispatch_on_main_queue();

}

- (void)_removeAllResults
{
  px_dispatch_on_main_queue();
}

- (void)_setProgress:(id)a3 forVariationType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PXAssetVariationRenderProvider *v10;
  int64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PXAssetVariationRenderProvider__setProgress_forVariationType___block_invoke;
  v8[3] = &unk_1E5144A98;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  -[PXAssetVariationRenderProvider performChanges:](self, "performChanges:", v8);

}

- (void)_setStatus:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (self->_status != a3)
  {
    self->_status = a3;
    if (a3 == 5)
    {
      v9 = (void *)MEMORY[0x1E0D09910];
      v13 = *MEMORY[0x1E0D09830];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.rendering.livePhotoEffectFailed"), v12);

    }
    else if (a3 == 4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetVariationRenderProvider _beginRenderingDate](self, "_beginRenderingDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v5);
      v7 = v6;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetVariationRenderProvider setTotalRenderingDuration:](self, "setTotalRenderingDuration:", v8);

    }
    -[PXAssetVariationRenderProvider signalChange:](self, "signalChange:", 4);
  }
}

- (void)_setStatusDescription:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *statusDescription;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_statusDescription;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      statusDescription = self->_statusDescription;
      self->_statusDescription = v6;

      -[PXAssetVariationRenderProvider signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)setAnalysisResult:(id)a3
{
  NSDictionary *v5;
  NSDictionary *analysisResult;
  int64_t v7;

  if (self->_analysisResult != a3)
  {
    v5 = (NSDictionary *)objc_msgSend(a3, "copy");
    analysisResult = self->_analysisResult;
    self->_analysisResult = v5;

    -[PXAssetVariationRenderProvider _invalidateRenders](self, "_invalidateRenders");
    -[PXAssetVariationRenderProvider _invalidateStatus](self, "_invalidateStatus");
    if (a3)
      v7 = -[NSProgress totalUnitCount](self->_recipeGenerationProgress, "totalUnitCount");
    else
      v7 = 0;
    -[NSProgress setCompletedUnitCount:](self->_recipeGenerationProgress, "setCompletedUnitCount:", v7);
    -[PXAssetVariationRenderProvider signalChange:](self, "signalChange:", 2);
  }
}

- (void)_setError:(id)a3
{
  NSError *v5;
  NSError *v6;
  NSError *v7;
  char v8;
  NSObject *v9;
  int v10;
  PXAssetVariationRenderProvider *v11;
  __int16 v12;
  NSError *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (NSError *)a3;
  v6 = self->_error;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSError isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      if (v5)
      {
        PLUIGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = 138412546;
          v11 = self;
          v12 = 2112;
          v13 = v5;
          _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "%@ encountered error: %@", (uint8_t *)&v10, 0x16u);
        }

      }
      objc_storeStrong((id *)&self->_error, a3);
      -[PXAssetVariationRenderProvider _invalidateStatus](self, "_invalidateStatus");
    }
  }

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  PXAssetVariationRenderProvider *v24;
  objc_super v25;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v25.receiver = self;
  v25.super_class = (Class)PXAssetVariationRenderProvider;
  -[PXAssetVariationRenderProvider debugDescription](&v25, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXAssetVariationRenderProvider status](self, "status") == 5)
  {
    objc_msgSend(v5, "appendString:", CFSTR("Failed:\n"));
    -[PXAssetVariationRenderProvider error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v7);

  }
  else
  {
    objc_msgSend(v5, "appendString:", CFSTR("Loading Durations\nImage URL: "));
    objc_msgSend(v5, "appendString:", CFSTR("\nEdit Source: "));
    -[PXAssetVariationRenderProvider _editSourceDuration](self, "_editSourceDuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PXAssetVariationRenderProvider _editSourceDuration](self, "_editSourceDuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v5, "appendFormat:", CFSTR("%.2fs"), v10);

    }
    objc_msgSend(v5, "appendString:", CFSTR("\nRecipes: "));
    -[PXAssetVariationRenderProvider _recipeGenerationDuration](self, "_recipeGenerationDuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PXAssetVariationRenderProvider _recipeGenerationDuration](self, "_recipeGenerationDuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v5, "appendFormat:", CFSTR("%.2fs"), v13);

    }
    else
    {
      -[PXAssetVariationRenderProvider analysisResult](self, "analysisResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v5, "appendString:", CFSTR("cached"));
    }
    -[PXAssetVariationRenderProvider desiredVariationTypes](self, "desiredVariationTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __50__PXAssetVariationRenderProvider_debugDescription__block_invoke;
    v22[3] = &unk_1E51460E8;
    v16 = v5;
    v23 = v16;
    v24 = self;
    objc_msgSend(v15, "enumerateIndexesUsingBlock:", v22);

    objc_msgSend(v16, "appendString:", CFSTR("\nTotal duration: "));
    -[PXAssetVariationRenderProvider totalRenderingDuration](self, "totalRenderingDuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PXAssetVariationRenderProvider totalRenderingDuration](self, "totalRenderingDuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      objc_msgSend(v16, "appendFormat:", CFSTR("%.2fs"), v19);

    }
    v6 = v23;
  }

  v20 = (void *)objc_msgSend(v5, "copy");
  return v20;
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (PXEditSourceLoader)editSourceLoader
{
  return self->_editSourceLoader;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSIndexSet)desiredVariationTypes
{
  return self->_desiredVariationTypes;
}

- (BOOL)renderAllResources
{
  return self->_renderAllResources;
}

- (void)setRenderAllResources:(BOOL)a3
{
  self->_renderAllResources = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (NSError)error
{
  return self->_error;
}

- (NSProgress)initialLoadingProgress
{
  return self->_initialLoadingProgress;
}

- (NSNumber)totalRenderingDuration
{
  return self->_totalRenderingDuration;
}

- (void)setTotalRenderingDuration:(id)a3
{
  objc_storeStrong((id *)&self->_totalRenderingDuration, a3);
}

- (NSOperation)_analysisOperation
{
  return self->__analysisOperation;
}

- (void)_setAnalysisOperation:(id)a3
{
  objc_storeStrong((id *)&self->__analysisOperation, a3);
}

- (NSMutableDictionary)_renderingOperationsByVariationType
{
  return self->__renderingOperationsByVariationType;
}

- (NSDate)_beginRenderingDate
{
  return self->__beginRenderingDate;
}

- (void)_setBeginRenderingDate:(id)a3
{
  objc_storeStrong((id *)&self->__beginRenderingDate, a3);
}

- (NSNumber)_editSourceDuration
{
  return self->__editSourceDuration;
}

- (void)_setEditSourceDuration:(id)a3
{
  objc_storeStrong((id *)&self->__editSourceDuration, a3);
}

- (NSNumber)_recipeGenerationDuration
{
  return self->__recipeGenerationDuration;
}

- (void)_setRecipeGenerationDuration:(id)a3
{
  objc_storeStrong((id *)&self->__recipeGenerationDuration, a3);
}

- (NSMutableDictionary)_renderingDurationByVariationType
{
  return self->__renderingDurationByVariationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__renderingDurationByVariationType, 0);
  objc_storeStrong((id *)&self->__recipeGenerationDuration, 0);
  objc_storeStrong((id *)&self->__editSourceDuration, 0);
  objc_storeStrong((id *)&self->__beginRenderingDate, 0);
  objc_storeStrong((id *)&self->__renderingOperationsByVariationType, 0);
  objc_storeStrong((id *)&self->__analysisOperation, 0);
  objc_storeStrong((id *)&self->_totalRenderingDuration, 0);
  objc_storeStrong((id *)&self->_initialLoadingProgress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_desiredVariationTypes, 0);
  objc_storeStrong((id *)&self->_editSourceLoader, 0);
  objc_storeStrong((id *)&self->_analysisResult, 0);
  objc_storeStrong((id *)&self->_observedEditSourceLoaderProgress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_recipeGenerationProgress, 0);
  objc_storeStrong((id *)&self->_progressesByVariationType, 0);
  objc_storeStrong((id *)&self->_resultsByVariationType, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

void __50__PXAssetVariationRenderProvider_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  if ((unint64_t)(a2 + 1) > 4)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E5121BA8[a2 + 1];
  v6 = v5;
  objc_msgSend(v4, "appendFormat:", CFSTR("\n%@: "), v6);

  objc_msgSend(*(id *)(a1 + 40), "_renderingDurationByVariationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (v12)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v10, "appendFormat:", CFSTR("%.2fs"), v11);
    v9 = v12;
  }

}

void __64__PXAssetVariationRenderProvider__setProgress_forVariationType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v7 = (id)v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
    if (v5)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);
    else
      objc_msgSend(v6, "removeObjectForKey:", v7);
    objc_msgSend(*(id *)(a1 + 40), "signalChange:", 2);
  }

}

uint64_t __51__PXAssetVariationRenderProvider__removeAllResults__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXAssetVariationRenderProvider__removeAllResults__block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __51__PXAssetVariationRenderProvider__removeAllResults__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 200);
  *(_QWORD *)(v2 + 200) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
}

void __62__PXAssetVariationRenderProvider__setResult_forVariationType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(a1 + 40);
  if (v3 == v4)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v3, "isEqual:", v4);

    if ((v6 & 1) == 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __62__PXAssetVariationRenderProvider__setResult_forVariationType___block_invoke_2;
      v10[3] = &unk_1E5144A98;
      v8 = *(void **)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v11 = *(id *)(a1 + 32);
      v13 = v7;
      v12 = v8;
      objc_msgSend(v11, "performChanges:", v10);

    }
  }
}

uint64_t __62__PXAssetVariationRenderProvider__setResult_forVariationType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_setProgress:forVariationType:", 0, *(_QWORD *)(a1 + 48));
}

void __69__PXAssetVariationRenderProvider__handleRenderingOperationCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PXAssetVariationRenderResult *v11;
  PXAssetVariationRenderResult *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PXAssetVariationRenderResult *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "variationType");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_renderingDurationByVariationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "_renderingOperationsByVariationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "renderResultForVariationType:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "succeeded");
      v11 = [PXAssetVariationRenderResult alloc];
      v12 = v11;
      if (v10)
      {
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "analysisResult");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "adjustedCompositionController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PXAssetVariationRenderResult initWithVariationType:imageURL:videoURL:analysisResult:compositionController:success:error:](v12, "initWithVariationType:imageURL:videoURL:analysisResult:compositionController:success:error:", v2, v13, v14, v15, v16, 1, 0);

        -[PXAssetVariationRenderResult setImage:](v17, "setImage:", *(_QWORD *)(a1 + 64));
        -[PXAssetVariationRenderResult setVideoAsset:](v17, "setVideoAsset:", *(_QWORD *)(a1 + 72));
        objc_msgSend(*(id *)(a1 + 32), "outputVideoComposition");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAssetVariationRenderResult setVideoComposition:](v17, "setVideoComposition:", v18);

        -[PXAssetVariationRenderResult setFullsizeRender:](v17, "setFullsizeRender:", 1);
      }
      else
      {
        v17 = -[PXAssetVariationRenderResult initWithVariationType:imageURL:videoURL:analysisResult:compositionController:success:error:](v11, "initWithVariationType:imageURL:videoURL:analysisResult:compositionController:success:error:", v2, 0, 0, 0, 0, 0, v3);
        PLUIGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          v22 = v20;
          v23 = 2048;
          v24 = v2;
          v25 = 2112;
          v26 = v3;
          _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "%@: rendering failed for type: %ld error: %@", buf, 0x20u);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "_setResult:forVariationType:", v17, v2);

    }
  }

}

uint64_t __67__PXAssetVariationRenderProvider__handleRenderingOperationStarted___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__PXAssetVariationRenderProvider__handleRenderingOperationStarted___block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __67__PXAssetVariationRenderProvider__handleRenderingOperationStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");
}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXAssetVariationRenderingOperation *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PXAssetVariationRenderingOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id from;
  id location[2];

  if (!a2 || *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "px_tempDirectoryFileURLWithFileName:subdirectory:fileExtension:", v5, CFSTR("PXAssetVariationRenderProvider"), CFSTR("jpg"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "px_tempDirectoryFileURLWithFileName:subdirectory:fileExtension:", v5, CFSTR("PXAssetVariationRenderProvider"), CFSTR("mov"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PXAssetVariationRenderingOperation alloc];
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "targetSize");
    v13 = v12;
    v15 = v14;
    LOBYTE(v26) = objc_msgSend(*(id *)(a1 + 56), "renderAllResources");
    v16 = -[PXAssetVariationRenderingOperation initWithEditSource:variationType:analysisResult:baseCompositionController:outputImageURL:outputVideoURL:targetSize:renderAllResources:](v8, "initWithEditSource:variationType:analysisResult:baseCompositionController:outputImageURL:outputVideoURL:targetSize:renderAllResources:", v9, a2, v10, v11, v6, v7, v13, v15, v26);
    objc_msgSend(*(id *)(a1 + 56), "_renderingOperationsByVariationType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cancel");

    objc_msgSend(*(id *)(a1 + 56), "_renderingOperationsByVariationType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, v21);

    objc_initWeak(location, *(id *)(a1 + 56));
    objc_initWeak(&from, v16);
    v22 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_2;
    v30[3] = &unk_1E5144DF8;
    objc_copyWeak(&v31, location);
    objc_copyWeak(&v32, &from);
    -[PXAssetVariationRenderingOperation setCompletionBlock:](v16, "setCompletionBlock:", v30);
    v27[0] = v22;
    v27[1] = 3221225472;
    v27[2] = __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_3;
    v27[3] = &unk_1E5144DF8;
    objc_copyWeak(&v28, location);
    objc_copyWeak(&v29, &from);
    -[PXAssetVariationRenderingOperation setStartHandler:](v16, "setStartHandler:", v27);
    v23 = *(void **)(a1 + 56);
    -[PXAssetVariationRenderingOperation progress](v16, "progress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setProgress:forVariationType:", v24, a2);

    objc_msgSend((id)objc_opt_class(), "sharedOperationQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addOperation:", v16);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

  }
}

uint64_t __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleRenderingOperationCompleted:", v2);

}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  objc_copyWeak(&v3, (id *)(a1 + 40));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&v2);
}

void __48__PXAssetVariationRenderProvider__updateRenders__block_invoke_4(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleRenderingOperationStarted:", v2);

}

uint64_t __52__PXAssetVariationRenderProvider__invalidateRenders__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setNeedsUpdateOf:", sel__updateRenders);
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v4 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary", v4, 3221225472, __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_2, &unk_1E5147280, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "variationCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "saveAnalysisResult:assetIdentifier:sourceType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

  objc_destroyWeak(&v6);
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_5;
  v2[3] = &unk_1E5144868;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "performChanges:", v2);

}

uint64_t __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setError:", *(_QWORD *)(a1 + 40));
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_3;
  v4[3] = &unk_1E512EF50;
  objc_copyWeak(&v6, v2);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "performChanges:", v4);

  objc_destroyWeak(&v6);
}

void __68__PXAssetVariationRenderProvider__handleAnalysisOperationCompleted___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAnalysisResult:", v1);

}

void __55__PXAssetVariationRenderProvider__updateAnalysisResult__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  objc_copyWeak(&v3, (id *)(a1 + 40));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&v2);
}

void __55__PXAssetVariationRenderProvider__updateAnalysisResult__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAnalysisOperationCompleted:", v2);

}

uint64_t __59__PXAssetVariationRenderProvider__invalidateAnalysisResult__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setNeedsUpdateOf:", sel__updateAnalysisResult);
}

void __62__PXAssetVariationRenderProvider__handleCachedAnalysisResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "analysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v3, "setAnalysisResult:");
    }
    else
    {
      objc_msgSend(v3, "_analysisOperation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        objc_msgSend(*(id *)(a1 + 32), "_invalidateAnalysisResult");
    }
  }
}

void __61__PXAssetVariationRenderProvider__updateCachedAnalysisResult__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "analysisResultForAssetIdentifier:sourceType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v4, (id *)(a1 + 48));
  v3 = v2;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v4);
}

void __61__PXAssetVariationRenderProvider__updateCachedAnalysisResult__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleCachedAnalysisResult:", *(_QWORD *)(a1 + 32));

}

uint64_t __65__PXAssetVariationRenderProvider__invalidateCachedAnalysisResult__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setNeedsUpdateOf:", sel__updateCachedAnalysisResult);
}

void __47__PXAssetVariationRenderProvider__updateStatus__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(a3, "isExecuting"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "integerValue");
    *a4 = 1;
  }

}

uint64_t __47__PXAssetVariationRenderProvider__updateStatus__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setStatus:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_setStatusDescription:", *(_QWORD *)(a1 + 40));
}

uint64_t __51__PXAssetVariationRenderProvider__invalidateStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setNeedsUpdateOf:", sel__updateStatus);
}

void __48__PXAssetVariationRenderProvider__hasAllResults__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "renderResultForVariationType:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

uint64_t __51__PXAssetVariationRenderProvider_didPerformChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "updateIfNeeded");
}

__n128 __48__PXAssetVariationRenderProvider_setTargetSize___block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(a1 + 32) + 272) = result;
  return result;
}

uint64_t __49__PXAssetVariationRenderProvider_cancelRendering__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

uint64_t __48__PXAssetVariationRenderProvider_beginRendering__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "editSourceLoader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginLoading");

  objc_msgSend(*(id *)(a1 + 32), "editSourceLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  NSStringFromSelector(sel_completedUnitCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v5, v6, 4, PXEditSourceLoaderProgressObservationContext);

  objc_msgSend(*(id *)(a1 + 32), "editSourceLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "progress");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 144);
  *(_QWORD *)(v9 + 144) = v8;

  v11 = *(_QWORD **)(a1 + 32);
  if (!v11[30])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 240);
    *(_QWORD *)(v13 + 240) = v12;

    v11 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v11, "analysisResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCachedAnalysisResult");
  result = objc_msgSend(*(id *)(a1 + 32), "_hasAllResults");
  if ((result & 1) == 0)
    result = objc_msgSend(*(id *)(a1 + 32), "_invalidateRenders");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 1;
  return result;
}

uint64_t __41__PXAssetVariationRenderProvider_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

uint64_t __81__PXAssetVariationRenderProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PXAssetVariationRenderProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __81__PXAssetVariationRenderProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCachedAnalysisResult");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAnalysisResult");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateRenders");
}

+ (id)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1)
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_87576);
  return (id)sharedOperationQueue_queue;
}

+ (id)_renderingLog
{
  if (_renderingLog_onceToken != -1)
    dispatch_once(&_renderingLog_onceToken, &__block_literal_global_138_87573);
  return (id)_renderingLog_renderingLog;
}

+ (NSIndexSet)supportedVariationTypes
{
  if (supportedVariationTypes_onceToken != -1)
    dispatch_once(&supportedVariationTypes_onceToken, &__block_literal_global_163_87571);
  return (NSIndexSet *)(id)supportedVariationTypes_indexSet;
}

+ (void)_performSimulatedWorkWithProgress:(id)a3
{
  id v4;
  double v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "completedUnitCount") + 1);
  objc_msgSend(v4, "fractionCompleted");
  if (v5 < 1.0)
  {
    v6 = dispatch_time(0, 250000000);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PXAssetVariationRenderProvider__performSimulatedWorkWithProgress___block_invoke;
    v7[3] = &unk_1E5144EB8;
    v9 = a1;
    v8 = v4;
    dispatch_after(v6, MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __68__PXAssetVariationRenderProvider__performSimulatedWorkWithProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_performSimulatedWorkWithProgress:", *(_QWORD *)(a1 + 32));
}

void __57__PXAssetVariationRenderProvider_supportedVariationTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 0);
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 3);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)supportedVariationTypes_indexSet;
  supportedVariationTypes_indexSet = v0;

}

void __47__PXAssetVariationRenderProvider__renderingLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "AutoLoopGeneration");
  v1 = (void *)_renderingLog_renderingLog;
  _renderingLog_renderingLog = (uint64_t)v0;

}

uint64_t __54__PXAssetVariationRenderProvider_sharedOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)sharedOperationQueue_queue;
  sharedOperationQueue_queue = (uint64_t)v0;

  objc_msgSend((id)sharedOperationQueue_queue, "setQualityOfService:", 25);
  return objc_msgSend((id)sharedOperationQueue_queue, "setMaxConcurrentOperationCount:", 3);
}

@end

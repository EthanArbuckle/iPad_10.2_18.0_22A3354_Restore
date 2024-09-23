@implementation PISmartCopyPasteAutoCalculator

- (PISmartCopyPasteAutoCalculator)initWithComposition:(id)a3
{
  id v4;
  uint64_t *v5;
  os_log_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  void *specific;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  objc_class *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E0D52380];
    v7 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = v7;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v14 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_92_9464);
LABEL_7:
        v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)MEMORY[0x1E0CB3978];
          v17 = v15;
          objc_msgSend(v16, "callStackSymbols");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v19;
          _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_92_9464);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v22 = (void *)MEMORY[0x1E0CB3978];
      v23 = specific;
      v17 = v20;
      objc_msgSend(v22, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = specific;
      v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_92_9464);
  }
}

- (PISmartCopyPasteAutoCalculator)initWithSourceComposition:(id)a3 targetComposition:(id)a4
{
  NUComposition *v6;
  PISmartCopyPasteAutoCalculator *v7;
  NUComposition *targetComposition;
  objc_super v10;

  v6 = (NUComposition *)a4;
  v10.receiver = self;
  v10.super_class = (Class)PISmartCopyPasteAutoCalculator;
  v7 = -[NURenderRequest initWithComposition:](&v10, sel_initWithComposition_, a3);
  targetComposition = v7->_targetComposition;
  v7->_targetComposition = v6;

  v7->_similarityGatingThreshold = -1.0;
  return v7;
}

- (void)submit:(id)a3
{
  void (**v4)(id, _QWORD);
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  IHKSliderNetCPModel *v11;
  id v12;
  IHKSliderNetCPModel *sliderNetModel;
  void *v14;
  _BOOL4 v15;
  PISliderNetLiftRequest *v16;
  uint64_t v17;
  PISliderNetLiftRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  void (**v28)(id, _QWORD);
  uint64_t *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id location;
  uint64_t p_location;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9442;
  v36 = __Block_byref_object_dispose__9443;
  v37 = 0;
  if (!self->_sliderNetModel)
  {
    location = 0;
    p_location = (uint64_t)&location;
    v40 = 0x2020000000;
    v5 = (id *)getkSliderNetGatingMethodSymbolLoc_ptr;
    v41 = (void *)getkSliderNetGatingMethodSymbolLoc_ptr;
    if (!getkSliderNetGatingMethodSymbolLoc_ptr)
    {
      v6 = ImageHarmonizationKitLibrary();
      v5 = (id *)dlsym(v6, "kSliderNetGatingMethod");
      *(_QWORD *)(p_location + 24) = v5;
      getkSliderNetGatingMethodSymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&location, 8);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSliderNetGatingMethod(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PISmartCopyPasteAutoCalculator.m"), 29, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v7 = *v5;
    v47 = v7;
    v48[0] = &unk_1E5051400;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v9 = (void *)getIHKSliderNetCPModelClass_softClass;
    v46 = getIHKSliderNetCPModelClass_softClass;
    if (!getIHKSliderNetCPModelClass_softClass)
    {
      location = (id)MEMORY[0x1E0C809B0];
      p_location = 3221225472;
      v40 = (uint64_t)__getIHKSliderNetCPModelClass_block_invoke;
      v41 = &unk_1E5019948;
      v42 = &v43;
      __getIHKSliderNetCPModelClass_block_invoke((uint64_t)&location);
      v9 = (void *)v44[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v43, 8);
    v31 = 0;
    v11 = (IHKSliderNetCPModel *)objc_msgSend([v10 alloc], "initWithModelType:options:error:", 1, v8, &v31);
    v12 = v31;
    sliderNetModel = self->_sliderNetModel;
    self->_sliderNetModel = v11;

    if (!self->_sliderNetModel)
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v12);
      v24 = (void *)v33[5];
      v33[5] = v23;

      v4[2](v4, v33[5]);
      goto LABEL_13;
    }

  }
  objc_initWeak(&location, self);
  -[PISmartCopyPasteAutoCalculator liftRequest](self, "liftRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = [PISliderNetLiftRequest alloc];
    -[NURenderRequest composition](self, "composition");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[PISliderNetBaseRequest initWithComposition:sliderNetModel:](v16, "initWithComposition:sliderNetModel:", v17, self->_sliderNetModel);
    -[PISmartCopyPasteAutoCalculator setLiftRequest:](self, "setLiftRequest:", v18);

    -[PISmartCopyPasteAutoCalculator sourceAssetScenePrint](self, "sourceAssetScenePrint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v19 == 0;

    if ((v17 & 1) == 0)
    {
      -[PISmartCopyPasteAutoCalculator sourceAssetScenePrint](self, "sourceAssetScenePrint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PISmartCopyPasteAutoCalculator liftRequest](self, "liftRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAssetScenePrint:", v20);

    }
  }
  -[PISmartCopyPasteAutoCalculator liftRequest](self, "liftRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __41__PISmartCopyPasteAutoCalculator_submit___block_invoke;
  v27[3] = &unk_1E50170F0;
  objc_copyWeak(&v30, &location);
  v29 = &v32;
  v27[4] = self;
  v28 = v4;
  objc_msgSend(v22, "submit:", v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
LABEL_13:
  _Block_object_dispose(&v32, 8);

}

- (id)adjustmentsDictionaryWithNetworkOutput:(id)a3 similarity:(float)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "objectForKey:", CFSTR("Exposure"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Exposure"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("Warm Temp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Warm Temp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIWhiteBalanceAdjustmentController warmTempKey](PIWhiteBalanceAdjustmentController, "warmTempKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("Warm Tint"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Warm Tint"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIWhiteBalanceAdjustmentController warmTintKey](PIWhiteBalanceAdjustmentController, "warmTintKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v16);

  }
  *(float *)&v14 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("sourceSimilarity"));

  v18 = (void *)objc_msgSend(v6, "copy");
  return v18;
}

- (id)adjustedCompositionForNetwork:(id)a3 withSourceComposition:(id)a4
{
  id v5;
  id v6;
  PICompositionController *v7;
  uint64_t v8;
  void *v9;
  PICompositionController *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v6);

  v8 = -[PICompositionController mediaType](v7, "mediaType");
  -[PICompositionController source](v7, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v5);

  -[PICompositionController setSource:mediaType:](v10, "setSource:mediaType:", v9, v8);
  -[PICompositionController removeAdjustmentWithKey:](v10, "removeAdjustmentWithKey:", CFSTR("depthEffect"));
  -[PICompositionController removeAdjustmentWithKey:](v10, "removeAdjustmentWithKey:", CFSTR("portraitEffect"));
  -[PICompositionController removeAdjustmentWithKey:](v10, "removeAdjustmentWithKey:", CFSTR("cropStraighten"));
  -[PICompositionController applyChangesFromCompositionController:](v7, "applyChangesFromCompositionController:", v10);
  -[PICompositionController modifyAdjustmentWithKey:modificationBlock:](v7, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("whiteBalance"), &__block_literal_global_9429);
  -[PICompositionController modifyAdjustmentWithKey:modificationBlock:](v7, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("smartTone"), &__block_literal_global_32);
  -[PICompositionController composition](v7, "composition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)similarityGatingThreshold
{
  return self->_similarityGatingThreshold;
}

- (void)setSimilarityGatingThreshold:(double)a3
{
  self->_similarityGatingThreshold = a3;
}

- (NSData)sourceAssetScenePrint
{
  return self->_sourceAssetScenePrint;
}

- (void)setSourceAssetScenePrint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSData)targetAssetScenePrint
{
  return self->_targetAssetScenePrint;
}

- (void)setTargetAssetScenePrint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (PISliderNetLiftRequest)liftRequest
{
  return self->_liftRequest;
}

- (void)setLiftRequest:(id)a3
{
  objc_storeStrong((id *)&self->_liftRequest, a3);
}

- (PISliderNetAdjustmentsRequest)adjustmentsRequest
{
  return self->_adjustmentsRequest;
}

- (void)setAdjustmentsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentsRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentsRequest, 0);
  objc_storeStrong((id *)&self->_liftRequest, 0);
  objc_storeStrong((id *)&self->_targetAssetScenePrint, 0);
  objc_storeStrong((id *)&self->_sourceAssetScenePrint, 0);
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sliderNetModel, 0);
}

uint64_t __86__PISmartCopyPasteAutoCalculator_adjustedCompositionForNetwork_withSourceComposition___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOffsetExposure:", 0.0);
}

void __86__PISmartCopyPasteAutoCalculator_adjustedCompositionForNetwork_withSourceComposition___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setEnabled:", 0);
  objc_msgSend(v2, "setWarmTemp:", 0.0);
  objc_msgSend(v2, "setWarmTint:", 0.0);

}

void __41__PISmartCopyPasteAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PISliderNetAdjustmentsRequest *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  _QWORD v29[5];
  __int128 v30;
  id v31;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  v31 = 0;
  objc_msgSend(v4, "result:", &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v31;
  if (v6)
  {
    v8 = (void *)objc_msgSend(WeakRetained[20], "copy");
    objc_msgSend(WeakRetained, "composition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "adjustedCompositionForNetwork:withSourceComposition:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "adjustmentsRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = -[PISliderNetBaseRequest initWithComposition:sliderNetModel:]([PISliderNetAdjustmentsRequest alloc], "initWithComposition:sliderNetModel:", v10, WeakRetained[19]);
      objc_msgSend(WeakRetained, "setAdjustmentsRequest:", v12);

      objc_msgSend(WeakRetained, "similarityGatingThreshold");
      v14 = v13;
      objc_msgSend(WeakRetained, "adjustmentsRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSimilarityGatingThreshold:", v14);

      objc_msgSend(*(id *)(a1 + 32), "targetAssetScenePrint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 32), "targetAssetScenePrint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "adjustmentsRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAssetScenePrint:", v17);

      }
    }
    objc_msgSend(v6, "styleFeatureVectorData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "adjustmentsRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStyleFeatureVectorData:", v19);

    objc_msgSend(v6, "contentFeatureVectorData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "adjustmentsRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentFeatureVectorData:", v21);

    objc_msgSend(WeakRetained, "adjustmentsRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __41__PISmartCopyPasteAutoCalculator_submit___block_invoke_2;
    v29[3] = &unk_1E50170C8;
    v29[4] = *(_QWORD *)(a1 + 32);
    v28 = *(_OWORD *)(a1 + 40);
    v24 = (id)v28;
    v30 = v28;
    objc_msgSend(v23, "submit:", v29);

  }
  else
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v7);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __41__PISmartCopyPasteAutoCalculator_submit___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    v5 = (void *)a1[4];
    objc_msgSend(v3, "adjustments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "similarityScore");
    objc_msgSend(v5, "adjustmentsDictionaryWithNetworkOutput:similarity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v7);
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    v12 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

  (*(void (**)(void))(a1[5] + 16))();
}

+ (void)applyAdjustmentDictionary:(id)a3 toCompositionController:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke;
  v14[3] = &unk_1E5017198;
  v8 = v6;
  v15 = v8;
  v16 = a1;
  v9 = a4;
  objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("whiteBalance"), v14);

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke_2;
  v11[3] = &unk_1E50171C0;
  v12 = v8;
  v13 = a1;
  v10 = v8;
  objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("smartTone"), v11);

}

+ (double)_clampedValueForValue:(double)a3 adjustmentKey:(id)a4 settingKey:(id)a5 fallbackMinValue:(double)a6 fallbackMaxValue:(double)a7
{
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  double v18;

  +[PICompositionController settingForAdjustmentKey:settingKey:](PICompositionController, "settingForAdjustmentKey:settingKey:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ui_minimumValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "ui_minimumValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    a6 = v13;

  }
  objc_msgSend(v10, "ui_maximumValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v10, "ui_maximumValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    a7 = v16;

  }
  if (a7 <= a3)
    v17 = a7;
  else
    v17 = a3;
  if (a6 <= v17)
    v18 = v17;
  else
    v18 = a6;

  return v18;
}

+ (id)adjustmentsToModifyBasedOnSourceCompositionController:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "smartToneAdjustmentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "smartToneAdjustmentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offsetExposure");
    v8 = v7;

    if (v8 != 0.0)
    {
      +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

    }
  }
  objc_msgSend(v3, "whiteBalanceAdjustmentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "whiteBalanceAdjustmentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "warmTemp");
    if (v12 == 0.0)
    {
      objc_msgSend(v3, "whiteBalanceAdjustmentController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "warmTint");
      v15 = v14;

      if (v15 == 0.0)
        goto LABEL_10;
    }
    else
    {

    }
    +[PIWhiteBalanceAdjustmentController warmTempKey](PIWhiteBalanceAdjustmentController, "warmTempKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

    +[PIWhiteBalanceAdjustmentController warmTintKey](PIWhiteBalanceAdjustmentController, "warmTintKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

  }
LABEL_10:

  return v4;
}

+ (id)descriptionForAdjustmentDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  +[PIWhiteBalanceAdjustmentController warmTempKey](PIWhiteBalanceAdjustmentController, "warmTempKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  +[PIWhiteBalanceAdjustmentController warmTintKey](PIWhiteBalanceAdjustmentController, "warmTintKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Exp(%.2f), Warmth(%.2f), Tint(%.2f)"), v7, v11, v15);
}

+ (id)imageHarmonizationKitVersion
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 20230629);
}

void __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;

  v21 = a2;
  v3 = *(void **)(a1 + 32);
  +[PIWhiteBalanceAdjustmentController warmTempKey](PIWhiteBalanceAdjustmentController, "warmTempKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = *(void **)(a1 + 32);
  +[PIWhiteBalanceAdjustmentController warmTintKey](PIWhiteBalanceAdjustmentController, "warmTintKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v7 != 0.0 || v12 != 0.0)
  {
    objc_msgSend(v21, "setEnabled:", 1);
    objc_msgSend(v21, "setColorType:", 3);
    v13 = *(void **)(a1 + 40);
    +[PIWhiteBalanceAdjustmentController warmTempKey](PIWhiteBalanceAdjustmentController, "warmTempKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_clampedValueForValue:adjustmentKey:settingKey:fallbackMinValue:fallbackMaxValue:", CFSTR("whiteBalance"), v14, v7, -0.5, 0.5);
    v16 = v15;

    objc_msgSend(v21, "setWarmTemp:", v16);
    v17 = *(void **)(a1 + 40);
    +[PIWhiteBalanceAdjustmentController warmTintKey](PIWhiteBalanceAdjustmentController, "warmTintKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_clampedValueForValue:adjustmentKey:settingKey:fallbackMinValue:fallbackMaxValue:", CFSTR("whiteBalance"), v18, v12, -1.0, 1.0);
    v20 = v19;

    objc_msgSend(v21, "setWarmTint:", v20);
  }

}

void __84__PISmartCopyPasteAutoCalculator_applyAdjustmentDictionary_toCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  v3 = *(void **)(a1 + 32);
  +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (v7 != 0.0)
  {
    v8 = *(void **)(a1 + 40);
    +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_clampedValueForValue:adjustmentKey:settingKey:fallbackMinValue:fallbackMaxValue:", CFSTR("smartTone"), v9, v7, -1.0, 1.0);
    v11 = v10;

    objc_msgSend(v12, "setEnabled:", 1);
    objc_msgSend(v12, "setOffsetExposure:", v11);
  }

}

@end

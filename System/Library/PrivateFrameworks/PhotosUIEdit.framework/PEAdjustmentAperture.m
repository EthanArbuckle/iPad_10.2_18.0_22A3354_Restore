@implementation PEAdjustmentAperture

- (PEAdjustmentAperture)initWithModifier:(id)a3
{
  id v4;
  PEAdjustmentAperture *v5;
  void *v6;
  id modifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentAperture;
  v5 = -[PEAdjustmentAperture init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    modifier = v5->_modifier;
    v5->_modifier = v6;

  }
  return v5;
}

- (int64_t)category
{
  return 9;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  PELivePortraitBehaviorController *v32;
  id v33;
  PEAdjustmentAperture *v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  int v42;

  v35 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  if (PECanRenderPortrait_onceToken != -1)
    dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_38);
  if (PECanRenderPortrait_canRenderPortrait)
  {
    objc_msgSend(v12, "portraitValuesWithAccuracy:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE71DD8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[PEAdjustmentAperture _error:description:](PEAdjustmentAperture, "_error:description:", 2, CFSTR("Asset is missing depth data"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v21);
LABEL_17:

      goto LABEL_18;
    }
    v33 = v14;
    v34 = self;
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE71DC0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE71DC8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "depthAdjustmentController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "depthInfo");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    if (v23)
    {
      v25 = (void *)v23;
      objc_msgSend(v22, "depthInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("focusRect"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {

        goto LABEL_12;
      }

    }
    objc_msgSend(v35, "adjustmentConstants");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "PIDepthAdjustmentKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v24;
    v37[1] = 3221225472;
    v37[2] = __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
    v37[3] = &unk_24C618768;
    v38 = v17;
    v42 = v20;
    v39 = v21;
    v40 = v16;
    v41 = v22;
    objc_msgSend(v35, "modifyAdjustmentWithKey:modificationBlock:", v29, v37);

    v25 = v38;
LABEL_12:

    v30 = *MEMORY[0x24BE71DB8];
    v36[0] = v24;
    v36[1] = 3221225472;
    v36[2] = __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2;
    v36[3] = &unk_24C6187C0;
    v36[4] = v34;
    objc_msgSend(v35, "modifyAdjustmentWithKey:modificationBlock:", v30, v36);
    if (objc_msgSend(v35, "mediaType") == 3 || objc_msgSend(v35, "mediaType") == 1)
      v31 = objc_msgSend(v13, "isPhotoIris");
    else
      v31 = 0;
    v14 = v33;
    v32 = -[PELivePortraitBehaviorController initWithAsset:delegate:hasDepth:hasLive:]([PELivePortraitBehaviorController alloc], "initWithAsset:delegate:hasDepth:hasLive:", v13, v33, 1, v31);
    -[PELivePortraitBehaviorController applySideEffectsForAction:compositionController:](v32, "applySideEffectsForAction:compositionController:", 0, v35);
    -[PELivePortraitBehaviorController applySideEffectsForAction:compositionController:](v32, "applySideEffectsForAction:compositionController:", 2, v35);
    v15[2](v15, 1, 0);

    goto LABEL_17;
  }
  +[PEAdjustmentAperture _error:description:](PEAdjustmentAperture, "_error:description:", 1, CFSTR("Rendering depth is not supported on this device"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, 0, v16);
LABEL_18:

}

- (id)modifier
{
  return self->_modifier;
}

- (void)setModifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifier, 0);
}

void __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDepthInfo:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setAperture:", *(float *)(a1 + 64));
  objc_msgSend(v5, "setFocusRect:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE71DD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlassesMatteAllowed:", v3);

  objc_msgSend(*(id *)(a1 + 56), "depthInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v5, "setEnabled:", 0);

}

void __123__PEAdjustmentAperture_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  double (**v3)(_QWORD);
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "modifier");
  v3 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aperture");
  v4 = v3[2](v3);

  objc_msgSend(v8, "minimumAperture");
  v6 = v5;
  objc_msgSend(v8, "maximumAperture");
  if (v4 < v7)
    v7 = v4;
  if (v7 <= v6)
    v7 = v6;
  objc_msgSend(v8, "setAperture:", v7);

}

+ (id)_error:(int64_t)a3 description:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0BA0];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentApertureErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

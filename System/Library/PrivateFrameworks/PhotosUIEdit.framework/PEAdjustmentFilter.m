@implementation PEAdjustmentFilter

- (PEAdjustmentFilter)initWithFilterIdentifier:(id)a3 intensity:(double)a4
{
  id v7;
  PEAdjustmentFilter *v8;
  PEAdjustmentFilter *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEAdjustmentFilter;
  v8 = -[PEAdjustmentFilter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterIdentifier, a3);
    v9->_intensity = a4;
  }

  return v9;
}

- (int64_t)category
{
  return 4;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, void *);
  void *v31;
  id v32;

  v23 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a7;
  if (PISemanticStyleIsRenderSupported()
    && (objc_msgSend(v10, "semanticStyleStatistics"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v13))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentFilterErrorDomain"), 1, 0, v23);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v14);
  }
  else
  {
    -[PEAdjustmentFilter filterIdentifier](self, "filterIdentifier", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE72038], "standardSupportedEffects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
    v31 = &unk_24C618510;
    v14 = v15;
    v32 = v14;
    PFFind();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BE71DE8];
    objc_msgSend(v24, "removeAdjustmentWithKey:", *MEMORY[0x24BE71DE8]);
    v20 = *MEMORY[0x24BE71DE0];
    objc_msgSend(v24, "removeAdjustmentWithKey:", *MEMORY[0x24BE71DE0]);
    if (v18)
    {
      v21 = (void *)MEMORY[0x24BE72038];
      objc_msgSend(v18, "filterIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = objc_msgSend(v21, "isEffectNoneForIdentifier:", v22);

      if ((v21 & 1) == 0)
      {
        if (objc_msgSend(MEMORY[0x24BE71CC8], "is3DEffect:", v14))
          v19 = v20;
        v25[0] = v17;
        v25[1] = 3221225472;
        v25[2] = __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2;
        v25[3] = &unk_24C618538;
        v26 = v14;
        v27 = v18;
        objc_msgSend(v24, "modifyAdjustmentWithKey:modificationBlock:", v19, v25);

      }
    }
    v11[2](v11, 1, 0);

  }
}

- (NSString)filterIdentifier
{
  return self->_filterIdentifier;
}

- (void)setFilterIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_filterIdentifier, a3);
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterIdentifier, 0);
}

uint64_t __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "filterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __121__PEAdjustmentFilter_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setKind:", v3);
  objc_msgSend(v4, "setIntensity:", 1.0);
  objc_msgSend(v4, "setVersion:", objc_msgSend(*(id *)(a1 + 40), "latestVersion"));
  objc_msgSend(v4, "setEnabled:", 1);

}

@end

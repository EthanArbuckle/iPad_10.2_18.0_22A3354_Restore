@implementation PEAdjustmentAutoEnhance

- (int64_t)category
{
  return 0;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a7;
  v12 = (void *)MEMORY[0x24BE71CC8];
  objc_msgSend(v9, "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imagePropertiesRequestWithComposition:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setName:", CFSTR("PEAdjustmentAutoEnhance"));
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v18[3] = &unk_24C618990;
  v20 = v10;
  v21 = v11;
  v19 = v9;
  v15 = v10;
  v16 = v9;
  v17 = v11;
  objc_msgSend(v14, "submit:", v18);

}

void __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  PEAutoAdjustmentController *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  objc_msgSend(v3, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(PEAutoAdjustmentController);
    -[PEAutoAdjustmentController setImageProperties:](v6, "setImageProperties:", v5);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2;
    v9[3] = &unk_24C618E88;
    v10 = *(id *)(a1 + 48);
    -[PEAutoAdjustmentController enableAutoEnhanceOnCompositionController:valuesCalculator:completionHandler:](v6, "enableAutoEnhanceOnCompositionController:valuesCalculator:completionHandler:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __126__PEAdjustmentAutoEnhance_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

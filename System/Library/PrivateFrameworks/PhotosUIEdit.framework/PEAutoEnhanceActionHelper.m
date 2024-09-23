@implementation PEAutoEnhanceActionHelper

+ (void)applyAutoEnhance:(id)a3 replacesAffectedAdjustments:(BOOL)a4 useCompositionIntensity:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PEAutoAdjustmentController *v17;
  PEValuesCalculator *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint8_t v24[8];
  uint64_t v25;
  uint8_t buf[16];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void (**)(_QWORD))a6;
  PLPhotoEditGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v11, OS_LOG_TYPE_INFO, "PEAdjustmentPresetManager applyAutoEnhance", buf, 2u);
  }

  v12 = objc_alloc(MEMORY[0x24BE6C3B8]);
  objc_msgSend(v9, "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithComposition:", v13);

  objc_msgSend(v14, "setName:", CFSTR("PAAutoEnhance-imageProperties"));
  v25 = 0;
  objc_msgSend(v14, "submitSynchronous:", &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc_init(PEAutoAdjustmentController);
    -[PEAutoAdjustmentController setImageProperties:](v17, "setImageProperties:", v16);
    v18 = objc_alloc_init(PEValuesCalculator);
    -[PEValuesCalculator setCompositionController:](v18, "setCompositionController:", v9);
    -[PEValuesCalculator setSkipGeometricCalculations:](v18, "setSkipGeometricCalculations:", 1);
    if (v8)
    {
      objc_msgSend(v9, "adjustmentConstants");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "PISmartToneAdjustmentKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAdjustmentWithKey:", v20);

      objc_msgSend(v9, "adjustmentConstants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "PISmartColorAdjustmentKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAdjustmentWithKey:", v22);

    }
    -[PEAutoAdjustmentController enableAutoEnhanceOnCompositionController:useCompositionIntensity:valuesCalculator:completionHandler:](v17, "enableAutoEnhanceOnCompositionController:useCompositionIntensity:valuesCalculator:completionHandler:", v9, v7, v18, v10);

  }
  else
  {
    PLPhotoEditGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_20D13D000, v23, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to fetch imageProperties for auto-enhance", v24, 2u);
    }

    v10[2](v10);
  }

}

@end

@implementation PEAutoAdjustmentController

- (void)enableAutoEnhanceOnCompositionController:(id)a3 valuesCalculator:(id)a4 completionHandler:(id)a5
{
  -[PEAutoAdjustmentController enableAutoEnhanceOnCompositionController:useCompositionIntensity:valuesCalculator:completionHandler:](self, "enableAutoEnhanceOnCompositionController:useCompositionIntensity:valuesCalculator:completionHandler:", a3, 0, a4, a5);
}

- (void)enableAutoEnhanceOnCompositionController:(id)a3 useCompositionIntensity:(BOOL)a4 valuesCalculator:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  id location;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self->_cachedValuesAreValid)
  {
    -[PEAutoAdjustmentController _enableAutoEnhanceOnCompositionController:valuesCalculator:useCompositionIntensity:completionHandler:](self, "_enableAutoEnhanceOnCompositionController:valuesCalculator:useCompositionIntensity:completionHandler:", v10, v11, v8, v12);
  }
  else
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __130__PEAutoAdjustmentController_enableAutoEnhanceOnCompositionController_useCompositionIntensity_valuesCalculator_completionHandler___block_invoke;
    v13[3] = &unk_24C617E90;
    objc_copyWeak(&v17, &location);
    v14 = v10;
    v15 = v11;
    v18 = v8;
    v16 = v12;
    -[PEAutoAdjustmentController ensureCacheUpToDateForValuesCalculator:completionHandler:](self, "ensureCacheUpToDateForValuesCalculator:completionHandler:", v15, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)_enableAutoEnhanceOnCompositionController:(id)a3 valuesCalculator:(id)a4 useCompositionIntensity:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  double cachedSmartToneLevel;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  os_signpost_id_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  BOOL v31;
  NSArray *cachedRedEyeCorrections;
  NSArray *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  PEAutoAdjustmentController *v37;
  SEL v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  _QWORD block[4];
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t v46;
  uint8_t buf[16];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  PLPhotoEditGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AutoEnhanceEnableOnComposition", (const char *)&unk_20D1A4055, buf, 2u);
  }

  if (-[PEAutoAdjustmentController isBusy](self, "isBusy"))
  {
    v37 = (PEAutoAdjustmentController *)_PFAssertFailHandler();
    -[PEAutoAdjustmentController calculateStatisticsForCompositionController:valuesCalculator:completionHandler:](v37, v38, v39, v40, v41);
  }
  else
  {
    cachedSmartToneLevel = self->_cachedSmartToneLevel;
    if (v7)
    {
      objc_msgSend(v10, "smartToneAdjustmentController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "inputLight");
        cachedSmartToneLevel = v21;
      }

    }
    v22 = (void *)objc_msgSend(v10, "copy");
    -[PEAutoAdjustmentController imageProperties](self, "imageProperties");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      v42 = v22;
      v25 = v16;
      v26 = v12;
      v27 = v14;
      v28 = v14 - 1;
      v29 = v11;
      -[PEAutoAdjustmentController imageProperties](self, "imageProperties");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = +[PESupport photoWasTakenWithoutFlashWithImageProperties:](PESupport, "photoWasTakenWithoutFlashWithImageProperties:", v30);

      if (v31)
        cachedRedEyeCorrections = 0;
      else
        cachedRedEyeCorrections = self->_cachedRedEyeCorrections;
      v11 = v29;
      v17 = v28;
      v14 = v27;
      v12 = v26;
      v16 = v25;
      v22 = v42;
    }
    else
    {
      cachedRedEyeCorrections = 0;
    }
    v33 = cachedRedEyeCorrections;
    PLPhotoEditGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v34, OS_LOG_TYPE_INFO, "Computing auto enhance. Using previously cached values.", buf, 2u);
    }

    -[PEAutoAdjustmentController _applyAutoValuesOnCompositionController:whiteBalanceSettings:redEyeCorrections:smartToneLevel:smartColorLevel:valuesCalculator:](self, "_applyAutoValuesOnCompositionController:whiteBalanceSettings:redEyeCorrections:smartToneLevel:smartColorLevel:valuesCalculator:", v22, self->_cachedWhiteBalanceSettings, v33, v11, cachedSmartToneLevel, self->_cachedSmartColorLevel);
    objc_msgSend(v10, "applyChangesFromCompositionController:", v22);
    if (v12)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __131__PEAutoAdjustmentController__enableAutoEnhanceOnCompositionController_valuesCalculator_useCompositionIntensity_completionHandler___block_invoke;
      block[3] = &unk_24C617EB8;
      v45 = v12;
      v44 = v16;
      v46 = v14;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v35 = v45;
    }
    else
    {
      v36 = v16;
      v35 = v36;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20D13D000, v35, OS_SIGNPOST_INTERVAL_END, v14, "AutoEnhanceEnableOnComposition", (const char *)&unk_20D1A4055, buf, 2u);
      }
    }

  }
}

- (void)calculateStatisticsForCompositionController:(id)a3 valuesCalculator:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  os_signpost_id_t v25;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLPhotoEditGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AutoEnhanceCalculateStatisticsForComposition", (const char *)&unk_20D1A4055, buf, 2u);
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke;
  aBlock[3] = &unk_24C617EE0;
  v21 = v8;
  v22 = v9;
  v23 = v14;
  v24 = v10;
  v25 = v12;
  v15 = v14;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = _Block_copy(aBlock);
  -[PEAutoAdjustmentController ensureCacheUpToDateForValuesCalculator:completionHandler:](self, "ensureCacheUpToDateForValuesCalculator:completionHandler:", v17, v19);

}

- (void)ensureCacheUpToDateForValuesCalculator:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_cachedValuesAreValid)
  {
    if (v7)
      (*((void (**)(id))v7 + 2))(v7);
  }
  else
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_INFO, "Computing auto enhance. No cache, computing it now...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v11 = v10;
    -[PEAutoAdjustmentController _setBusy:](self, "_setBusy:", 1);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __87__PEAutoAdjustmentController_ensureCacheUpToDateForValuesCalculator_completionHandler___block_invoke;
    v12[3] = &unk_24C617F08;
    v14 = v11;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v6, "computeAutoEnhanceWithCompletionHandler:", v12);

  }
}

- (void)disableAutoEnhanceOnCompositionController:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  PEAutoAdjustmentController *v12;
  SEL v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  PLPhotoEditGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AutoEnhanceDisableOnComposition", (const char *)&unk_20D1A4055, buf, 2u);
  }

  if (-[PEAutoAdjustmentController isBusy](self, "isBusy"))
  {
    v12 = (PEAutoAdjustmentController *)_PFAssertFailHandler();
    -[PEAutoAdjustmentController invalidateCachedAdjustments](v12, v13);
  }
  else
  {
    v9 = (void *)objc_msgSend(v4, "copy");
    -[PEAutoAdjustmentController _revertAutoValuesOnCompositionController:](self, "_revertAutoValuesOnCompositionController:", v9);
    objc_msgSend(v4, "applyChangesFromCompositionController:", v9);
    v10 = v8;
    v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_20D13D000, v11, OS_SIGNPOST_INTERVAL_END, v6, "AutoEnhanceDisableOnComposition", (const char *)&unk_20D1A4055, v14, 2u);
    }

  }
}

- (void)invalidateCachedAdjustments
{
  NSArray *cachedRedEyeCorrections;
  NSDictionary *cachedWhiteBalanceSettings;
  PICompositionController *stashedPreviousManualComposition;

  self->_cachedValuesAreValid = 0;
  cachedRedEyeCorrections = self->_cachedRedEyeCorrections;
  self->_cachedRedEyeCorrections = 0;

  cachedWhiteBalanceSettings = self->_cachedWhiteBalanceSettings;
  self->_cachedWhiteBalanceSettings = 0;

  self->_cachedSmartToneLevel = 0.0;
  self->_cachedSmartColorLevel = 0.0;
  stashedPreviousManualComposition = self->_stashedPreviousManualComposition;
  self->_stashedPreviousManualComposition = 0;

}

- (double)defaultAutoEnhanceIntensityForCompositionController:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "smartToneAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputLightDefault");
  v5 = v4;

  return v5;
}

- (void)_applyAutoValuesOnCompositionController:(id)a3 whiteBalanceSettings:(id)a4 redEyeCorrections:(id)a5 smartToneLevel:(double)a6 smartColorLevel:(double)a7 valuesCalculator:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  PICompositionController *v20;
  PICompositionController *stashedPreviousManualComposition;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  double v39;
  _QWORD v40[4];
  id v41;
  double v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  PLPhotoEditGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v44 = v15;
    v45 = 2112;
    v46 = v16;
    v47 = 2048;
    v48 = a6;
    v49 = 2048;
    v50 = a7;
    _os_log_impl(&dword_20D13D000, v18, OS_LOG_TYPE_INFO, "Applying auto enhance. White Balance: %@\nRed Eye: %@\nSmartTone: %f\nSmartColor: %f", buf, 0x2Au);
  }

  objc_msgSend(v14, "adjustmentConstants");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (PICompositionController *)objc_msgSend(v14, "copy");
  stashedPreviousManualComposition = self->_stashedPreviousManualComposition;
  self->_stashedPreviousManualComposition = v20;

  v22 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v19, "PISmartToneAdjustmentKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke;
  v40[3] = &unk_24C617F30;
  v25 = v17;
  v41 = v25;
  v42 = a6;
  objc_msgSend(v22, "modifyAdjustmentWithKey:modificationBlock:", v23, v40);

  objc_msgSend(v19, "PISmartColorAdjustmentKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  v37[1] = 3221225472;
  v37[2] = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_2;
  v37[3] = &unk_24C617F58;
  v27 = v25;
  v38 = v27;
  v39 = a7;
  objc_msgSend(v22, "modifyAdjustmentWithKey:modificationBlock:", v26, v37);

  if (v15)
  {
    objc_msgSend(v19, "PIWhiteBalanceAdjustmentKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v24;
    v35[1] = 3221225472;
    v35[2] = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_3;
    v35[3] = &unk_24C618A40;
    v36 = v15;
    objc_msgSend(v22, "modifyAdjustmentWithKey:modificationBlock:", v28, v35);

  }
  if (v16)
  {
    objc_msgSend(v19, "PIRedEyeAdjustmentKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v24;
    v31 = 3221225472;
    v32 = __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_4;
    v33 = &unk_24C617F80;
    v34 = v16;
    objc_msgSend(v22, "modifyAdjustmentWithKey:modificationBlock:", v29, &v30);

  }
  objc_msgSend(v14, "applyChangesFromCompositionController:", v22, v30, v31, v32, v33);

}

- (void)_revertAutoValuesOnCompositionController:(id)a3
{
  PICompositionController *stashedPreviousManualComposition;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  PICompositionController *v8;
  PICompositionController *v9;
  PICompositionController *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  PICompositionController *v14;
  uint64_t v15;
  PICompositionController *v16;
  uint64_t v17;
  PICompositionController *v18;
  _QWORD v19[4];
  PICompositionController *v20;
  _QWORD v21[4];
  PICompositionController *v22;
  _QWORD v23[4];
  PICompositionController *v24;
  uint8_t buf[16];

  stashedPreviousManualComposition = self->_stashedPreviousManualComposition;
  v5 = a3;
  PLPhotoEditGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (stashedPreviousManualComposition)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v6, OS_LOG_TYPE_INFO, "Removing auto enhance. Reverting to previously saved manual adjustments.", buf, 2u);
    }

    v8 = self->_stashedPreviousManualComposition;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v6, OS_LOG_TYPE_INFO, "Removing auto enhance. Reverting to identity adjustments.", buf, 2u);
    }

    v8 = (PICompositionController *)objc_msgSend(MEMORY[0x24BE71F80], "newIdentityCompositionController");
  }
  v9 = v8;
  v10 = self->_stashedPreviousManualComposition;
  self->_stashedPreviousManualComposition = 0;

  v11 = (void *)objc_msgSend(v5, "copy");
  v12 = *MEMORY[0x24BE71F28];
  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke;
  v23[3] = &unk_24C6182B8;
  v14 = v9;
  v24 = v14;
  objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v12, v23);
  v15 = *MEMORY[0x24BE71F20];
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_2;
  v21[3] = &unk_24C6189B8;
  v16 = v14;
  v22 = v16;
  objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v15, v21);
  v17 = *MEMORY[0x24BE71F50];
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_3;
  v19[3] = &unk_24C618A40;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v17, v19);
  objc_msgSend(v11, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E48]);
  objc_msgSend(v5, "applyChangesFromCompositionController:", v11);

}

- (BOOL)isBusy
{
  return self->_busy;
}

- (void)_setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (NUImageProperties)imageProperties
{
  return self->_imageProperties;
}

- (void)setImageProperties:(id)a3
{
  objc_storeStrong((id *)&self->_imageProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_stashedPreviousManualComposition, 0);
  objc_storeStrong((id *)&self->_cachedWhiteBalanceSettings, 0);
  objc_storeStrong((id *)&self->_cachedRedEyeCorrections, 0);
}

void __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "smartToneAdjustmentController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "enabled"));
  objc_msgSend(v4, "inputLight");
  objc_msgSend(v3, "setInputLight:");
  objc_msgSend(v3, "setIsAuto:", 0);

}

void __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "smartColorAdjustmentController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "enabled"));
  objc_msgSend(v4, "inputColor");
  objc_msgSend(v3, "setInputColor:");
  objc_msgSend(v3, "setIsAuto:", 0);

}

void __71__PEAutoAdjustmentController__revertAutoValuesOnCompositionController___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "whiteBalanceAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorType:", objc_msgSend(v3, "colorType"));
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v3, "enabled"));
  objc_msgSend(v3, "faceStrength");
  objc_msgSend(v5, "setFaceStrength:");
  objc_msgSend(v3, "faceWarmth");
  objc_msgSend(v5, "setFaceWarmth:");
  objc_msgSend(v3, "faceI");
  objc_msgSend(v5, "setFaceI:");
  objc_msgSend(v3, "faceQ");
  objc_msgSend(v5, "setFaceQ:");
  objc_msgSend(v3, "grayStrength");
  objc_msgSend(v5, "setGrayStrength:");
  objc_msgSend(v3, "grayWarmth");
  objc_msgSend(v5, "setGrayWarmth:");
  objc_msgSend(v3, "grayY");
  objc_msgSend(v5, "setGrayY:");
  objc_msgSend(v3, "grayI");
  objc_msgSend(v5, "setGrayI:");
  objc_msgSend(v3, "grayQ");
  objc_msgSend(v5, "setGrayQ:");
  objc_msgSend(v3, "temperature");
  if (v4 > 0.0)
  {
    objc_msgSend(v3, "temperature");
    objc_msgSend(v5, "setTemperature:");
  }
  objc_msgSend(v3, "tint");
  objc_msgSend(v5, "setTint:");
  objc_msgSend(v3, "warmTemp");
  objc_msgSend(v5, "setWarmTemp:");
  objc_msgSend(v3, "warmTint");
  objc_msgSend(v5, "setWarmTint:");
  objc_msgSend(v5, "setWarmFace:", objc_msgSend(v3, "warmFace"));
  objc_msgSend(v5, "setIsAuto:", 0);

}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "updateAdjustmentSmartToneStatistics:withAccuracy:", v4, 0);
  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(v4, "setInputLight:", *(double *)(a1 + 40));
  objc_msgSend(v4, "setIsAuto:", 1);

}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "statistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "smartColorStatisticsWithAccuracy:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStatistics:", v4);

  }
  objc_msgSend(v5, "setEnabled:", 1);
  objc_msgSend(v5, "setInputColor:", *(double *)(a1 + 40));
  objc_msgSend(v5, "setIsAuto:", 1);

}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("faceI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v10, "setFaceI:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("faceQ"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v10, "setFaceQ:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("faceStrength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v10, "setFaceStrength:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("faceWarmth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v10, "setFaceWarmth:");

  objc_msgSend(v10, "setColorType:", 3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("warmTemp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v10, "setWarmTemp:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("warmTint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v10, "setWarmTint:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("warmFace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWarmFace:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(v10, "setIsAuto:", 1);
}

void __157__PEAutoAdjustmentController__applyAutoValuesOnCompositionController_whiteBalanceSettings_redEyeCorrections_smartToneLevel_smartColorLevel_valuesCalculator___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setInputCorrectionInfo:", v2);
  objc_msgSend(v3, "setIsAuto:", 1);
  objc_msgSend(v3, "setEnabled:", 1);

}

void __87__PEAutoAdjustmentController_ensureCacheUpToDateForValuesCalculator_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v13 = v12;
  v14 = *(double *)(a1 + 48);
  PLPhotoEditGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = 134217984;
    v18 = v13 - v14;
    _os_log_impl(&dword_20D13D000, v15, OS_LOG_TYPE_INFO, "Finished computing auto enhance. Took %f s", (uint8_t *)&v17, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a3);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  *(double *)(*(_QWORD *)(a1 + 32) + 24) = a4;
  *(double *)(*(_QWORD *)(a1 + 32) + 32) = a5;
  objc_msgSend(*(id *)(a1 + 32), "_setBusy:", 0);
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(void))(v16 + 16))();

}

void __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(a1 + 32), "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_2;
  v14[3] = &unk_24C6182B8;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v2, "modifyAdjustmentWithKey:modificationBlock:", v4, v14);

  objc_msgSend(v3, "PISmartColorAdjustmentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_3;
  v12[3] = &unk_24C6189B8;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v2, "modifyAdjustmentWithKey:modificationBlock:", v6, v12);

  objc_msgSend(*(id *)(a1 + 32), "applyChangesFromCompositionController:", v2);
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  v8 = *(id *)(a1 + 48);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AutoEnhanceCalculateStatisticsForComposition", (const char *)&unk_20D1A4055, v11, 2u);
  }

}

uint64_t __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAdjustmentSmartToneStatistics:withAccuracy:", a2, 0);
}

void __109__PEAutoAdjustmentController_calculateStatisticsForCompositionController_valuesCalculator_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "statistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "smartColorStatisticsWithAccuracy:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStatistics:", v4);

  }
}

void __131__PEAutoAdjustmentController__enableAutoEnhanceOnCompositionController_valuesCalculator_useCompositionIntensity_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v3, OS_SIGNPOST_INTERVAL_END, v4, "AutoEnhanceEnableOnComposition", (const char *)&unk_20D1A4055, v5, 2u);
  }

}

void __130__PEAutoAdjustmentController_enableAutoEnhanceOnCompositionController_useCompositionIntensity_valuesCalculator_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_enableAutoEnhanceOnCompositionController:valuesCalculator:useCompositionIntensity:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

+ (BOOL)isAutoEnhanceEnabledForAsset:(id)a3
{
  void *v3;
  BOOL v4;
  uint64_t v6;

  v6 = 0;
  +[PEAdjustmentDataCache synchronousCompositionControllerForAsset:networkAccessAllowed:disposition:originalComposition:](PEAdjustmentDataCache, "synchronousCompositionControllerForAsset:networkAccessAllowed:disposition:originalComposition:", a3, 0, &v6, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:](PEAutoAdjustmentController, "isAutoEnhanceEnabledForCompositionController:", v3);

  return v4;
}

+ (BOOL)isAutoEnhanceEnabledForCompositionController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "smartToneAdjustmentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAuto");

    if (v6)
    {
      objc_msgSend(v4, "smartColorAdjustmentController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isAuto");

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "whiteBalanceAdjustmentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canHaveAuto") ^ 1;
    LOBYTE(v9) = v11 & v8;
    if ((v11 & 1) == 0 && v8)
    {
      if (v10 && (objc_msgSend(v10, "isAuto") & 1) == 0)
        v9 = objc_msgSend(v10, "enabled") ^ 1;
      else
        LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

@end

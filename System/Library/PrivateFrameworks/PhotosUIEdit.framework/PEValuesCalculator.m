@implementation PEValuesCalculator

- (PEValuesCalculator)init
{
  PEValuesCalculator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *imageValuesComputationQueue;
  dispatch_group_t v5;
  OS_dispatch_group *computingImageValuesGroup;
  dispatch_queue_t v7;
  OS_dispatch_queue *geometricValuesComputationQueue;
  dispatch_group_t v9;
  OS_dispatch_group *computingGeometricValuesGroup;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PEValuesCalculator;
  v2 = -[PEValuesCalculator init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photos.PUPhotoEditImageValuesCalculator", 0);
    imageValuesComputationQueue = v2->_imageValuesComputationQueue;
    v2->_imageValuesComputationQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_group_create();
    computingImageValuesGroup = v2->_computingImageValuesGroup;
    v2->_computingImageValuesGroup = (OS_dispatch_group *)v5;

    v7 = dispatch_queue_create("com.apple.photos.PUPhotoEditGeometricValuesCalculator", 0);
    geometricValuesComputationQueue = v2->_geometricValuesComputationQueue;
    v2->_geometricValuesComputationQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_group_create();
    computingGeometricValuesGroup = v2->_computingGeometricValuesGroup;
    v2->_computingGeometricValuesGroup = (OS_dispatch_group *)v9;

    -[PEValuesCalculator _updateSettings](v2, "_updateSettings");
  }
  return v2;
}

- (void)_updateSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  id v22;

  -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.enableEnterEditPortraitAutoCalc = objc_msgSend(v4, "enableEnterEditPortraitAutoCalc");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.enableEnterEditCropAutoCalc = objc_msgSend(v5, "enableEnterEditCropAutoCalc");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.enableEnterEditPerspectiveAutoCalc = objc_msgSend(v6, "enableEnterEditPerspectiveAutoCalc");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.enableEnterEditDepthEffectAutoCalc = objc_msgSend(v7, "enableEnterEditDepthEffectAutoCalc");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.enableEnterEditSmartToneAutoCalc = objc_msgSend(v8, "enableEnterEditSmartToneAutoCalc");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.enableEnterEditSmartColorAutoCalc = objc_msgSend(v9, "enableEnterEditSmartColorAutoCalc");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.enableEnterEditSemanticStyleAutoCalc = objc_msgSend(v10, "enableEnterEditSemanticStyleAutoCalc");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "autoStraightenMaxAngle");
    self->_settings.autoStraightenMaxAngle = v12;

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "autoPerspectiveMaxYaw");
    self->_settings.autoPerspectiveMaxYaw = v14;

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "autoPerspectiveMaxPitch");
    self->_settings.autoPerspectiveMaxPitch = v16;

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "autoPerspectiveMaxAngle");
    self->_settings.autoPerspectiveMaxAngle = v18;

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "autoPerspectiveMaxFaceSize");
    self->_settings.autoPerspectiveMaxFaceSize = v20;

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    self->_settings.autoPerspectiveDisableOnPanos = objc_msgSend(v21, "autoPerspectiveDisableOnPanos");

    -[PEValuesCalculator settingsDelegate](self, "settingsDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    self->_settings.autoPerspectiveDisableOnFrontFacingCameraImages = objc_msgSend(v22, "autoPerspectiveDisableOnFrontFacingCameraImages");

  }
  else
  {
    *(_DWORD *)&self->_settings.enableEnterEditDepthEffectAutoCalc = 16843009;
    *(_DWORD *)&self->_settings.enableEnterEditPortraitAutoCalc = 16843009;
    *(_OWORD *)&self->_settings.autoStraightenMaxAngle = xmmword_20D197050;
    *(_OWORD *)&self->_settings.autoPerspectiveMaxPitch = xmmword_20D197060;
    self->_settings.autoPerspectiveMaxFaceSize = 0.0;
    *(_WORD *)&self->_settings.autoPerspectiveDisableOnPanos = 257;
  }
}

- (void)setSettingsDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_settingsDelegate, obj);
    -[PEValuesCalculator _updateSettings](self, "_updateSettings");
    v5 = obj;
  }

}

- (void)setCompositionController:(id)a3
{
  PICompositionController *v5;
  PUPhotoEditImageValues *currentImageValues;
  PUPhotoEditImageValues *currentGeometricValues;
  PUPhotoEditImageValues *initialImageValues;
  PUPhotoEditImageValues *initialGeometricValues;
  PICompositionController *compositionControllerForCurrentValues;
  void *v11;
  PICompositionController *v12;

  v5 = (PICompositionController *)a3;
  if (self->_compositionController != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_compositionController, a3);
    currentImageValues = self->_currentImageValues;
    self->_currentImageValues = 0;

    currentGeometricValues = self->_currentGeometricValues;
    self->_currentGeometricValues = 0;

    initialImageValues = self->_initialImageValues;
    self->_initialImageValues = 0;

    initialGeometricValues = self->_initialGeometricValues;
    self->_initialGeometricValues = 0;

    compositionControllerForCurrentValues = self->_compositionControllerForCurrentValues;
    self->_compositionControllerForCurrentValues = 0;

    -[PEValuesCalculator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "editValuesCalculatorHasChangedImageValues:", self);

    v5 = v12;
  }

}

- (void)setEditSource:(id)a3
{
  PLEditSource *v5;
  PUPhotoEditImageValues *currentImageValues;
  PUPhotoEditImageValues *currentGeometricValues;
  PUPhotoEditImageValues *initialImageValues;
  PUPhotoEditImageValues *initialGeometricValues;
  PICompositionController *compositionControllerForCurrentValues;
  void *v11;
  PLEditSource *v12;

  v5 = (PLEditSource *)a3;
  if (self->_editSource != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_editSource, a3);
    currentImageValues = self->_currentImageValues;
    self->_currentImageValues = 0;

    currentGeometricValues = self->_currentGeometricValues;
    self->_currentGeometricValues = 0;

    initialImageValues = self->_initialImageValues;
    self->_initialImageValues = 0;

    initialGeometricValues = self->_initialGeometricValues;
    self->_initialGeometricValues = 0;

    compositionControllerForCurrentValues = self->_compositionControllerForCurrentValues;
    self->_compositionControllerForCurrentValues = 0;

    -[PEValuesCalculator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "editValuesCalculatorHasChangedImageValues:", self);

    v5 = v12;
  }

}

- (id)portraitValuesWithAccuracy:(int64_t)a3
{
  uint64_t v4;

  if (a3 && !-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator _ensureInitialImageValuesAreComputed](self, "_ensureInitialImageValuesAreComputed");
    v4 = 24;
  }
  else
  {
    -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
    v4 = 8;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "portraitValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)apertureValuesWithAccuracy:(int64_t)a3
{
  uint64_t v4;

  if (a3 && !-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator _ensureInitialImageValuesAreComputed](self, "_ensureInitialImageValuesAreComputed");
    v4 = 24;
  }
  else
  {
    -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
    v4 = 8;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "apertureValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)smartToneStatisticsWithAccuracy:(int64_t)a3
{
  uint64_t v4;

  if (a3 && !-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator _ensureInitialImageValuesAreComputed](self, "_ensureInitialImageValuesAreComputed");
    v4 = 24;
  }
  else
  {
    -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
    v4 = 8;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "smartToneStatistics");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateAdjustmentSmartToneStatistics:(id)a3 withAccuracy:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PEValuesCalculator smartToneStatisticsWithAccuracy:](self, "smartToneStatisticsWithAccuracy:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatistics:", v7);

}

- (id)smartColorStatisticsWithAccuracy:(int64_t)a3
{
  uint64_t v4;

  if (a3 && !-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator _ensureInitialImageValuesAreComputed](self, "_ensureInitialImageValuesAreComputed");
    v4 = 24;
  }
  else
  {
    -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
    v4 = 8;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "smartColorStatistics");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)smartToneAutoSuggestion
{
  double result;

  -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
  -[PUPhotoEditImageValues smartToneAutoSuggestion](self->_currentImageValues, "smartToneAutoSuggestion");
  return result;
}

- (double)smartColorAutoSuggestion
{
  double result;

  -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
  -[PUPhotoEditImageValues smartColorAutoSuggestion](self->_currentImageValues, "smartColorAutoSuggestion");
  return result;
}

- (id)semanticStyleStatistics
{
  uint64_t v3;

  if (-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
    v3 = 8;
  }
  else
  {
    -[PEValuesCalculator _ensureInitialImageValuesAreComputed](self, "_ensureInitialImageValuesAreComputed");
    v3 = 24;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "semanticStyleStatistics");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateAdjustmentSemanticStyleStatistics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PEValuesCalculator semanticStyleStatistics](self, "semanticStyleStatistics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithSemStyleInfo:", v5);

}

- (id)autoCropValuesWithAccuracy:(int64_t)a3
{
  uint64_t v4;

  if (a3 && !-[PEValuesCalculator _geometricCurrentValuesCacheIsValid](self, "_geometricCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator _ensureInitialGeometricValuesAreComputed](self, "_ensureInitialGeometricValuesAreComputed");
    v4 = 32;
  }
  else
  {
    -[PEValuesCalculator _ensureCurrentGeometricValuesAreComputed](self, "_ensureCurrentGeometricValuesAreComputed");
    v4 = 16;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "autoCropValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)autoPerspectiveValuesWithAccuracy:(int64_t)a3
{
  uint64_t v4;

  if (a3 && !-[PEValuesCalculator _geometricCurrentValuesCacheIsValid](self, "_geometricCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator _ensureInitialGeometricValuesAreComputed](self, "_ensureInitialGeometricValuesAreComputed");
    v4 = 32;
  }
  else
  {
    -[PEValuesCalculator _ensureCurrentGeometricValuesAreComputed](self, "_ensureCurrentGeometricValuesAreComputed");
    v4 = 16;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "autoPerspectiveValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_imageCurrentValuesCacheIsValid
{
  void *v3;
  void *v4;
  char v5;

  if (!-[PUPhotoEditImageValues isComplete](self->_currentImageValues, "isComplete")
    || !self->_compositionControllerForCurrentValues)
  {
    return 0;
  }
  v3 = (void *)MEMORY[0x24BE71F80];
  -[PEValuesCalculator compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compositionController:isGeometryEqualToCompositionController:", v4, self->_compositionControllerForCurrentValues);

  return v5;
}

- (BOOL)_geometricCurrentValuesCacheIsValid
{
  void *v3;
  void *v4;
  char v5;

  if (!-[PUPhotoEditImageValues isComplete](self->_currentGeometricValues, "isComplete")
    || !self->_compositionControllerForCurrentValues)
  {
    return 0;
  }
  v3 = (void *)MEMORY[0x24BE71F80];
  -[PEValuesCalculator compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compositionController:isGeometryEqualToCompositionController:", v4, self->_compositionControllerForCurrentValues);

  return v5;
}

- (void)precomputeImageValues
{
  -[PEValuesCalculator precomputeImageValuesWithOptionalCompletion:](self, "precomputeImageValuesWithOptionalCompletion:", 0);
}

- (void)precomputeImageValuesWithOptionalCompletion:(id)a3
{
  id v5;
  PUPhotoEditImageValues *currentImageValues;
  int v7;
  void *v8;
  void *v9;
  PUPhotoEditImageValues *v10;
  PUPhotoEditImageValues *v11;
  void *v12;
  PUPhotoEditImageValues *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  PUPhotoEditImageValues *initialImageValues;
  NSObject *imageValuesComputationQueue;
  PUPhotoEditImageValues *v19;
  PUPhotoEditImageValues *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  PEValuesCalculator *v25;
  PUPhotoEditImageValues *v26;
  PUPhotoEditImageValues *v27;
  id v28;
  SEL v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  currentImageValues = self->_currentImageValues;
  if (currentImageValues && !-[PUPhotoEditImageValues isComplete](currentImageValues, "isComplete"))
  {
    v7 = 1;
    goto LABEL_10;
  }
  if (-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
  {
    v7 = 0;
LABEL_10:
    PLPhotoEditGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (v7)
        v15 = CFSTR("Y");
      else
        v15 = CFSTR("N");
      if (-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
        v16 = CFSTR("Y");
      else
        v16 = CFSTR("N");
      *(_DWORD *)buf = 138412546;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_20D13D000, v14, OS_LOG_TYPE_INFO, "skipping precomputeImageValuesWithOptionalCompletion; request pending? %@, cache valid? %@",
        buf,
        0x16u);
    }

    if (v5)
      dispatch_group_notify((dispatch_group_t)self->_computingImageValuesGroup, (dispatch_queue_t)self->_imageValuesComputationQueue, v5);
    goto LABEL_22;
  }
  -[PEValuesCalculator compositionController](self, "compositionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEValuesCalculator.m"), 409, CFSTR("Need a composition controller to perform this operation"));

  }
  objc_storeStrong((id *)&self->_compositionControllerForCurrentValues, v9);
  v10 = objc_alloc_init(PUPhotoEditImageValues);
  v11 = self->_currentImageValues;
  self->_currentImageValues = v10;

  -[PEValuesCalculator delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "editValuesCalculatorHasChangedImageValues:", self);

  if (self->_initialImageValues)
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(PUPhotoEditImageValues);
    initialImageValues = self->_initialImageValues;
    self->_initialImageValues = v13;

  }
  dispatch_group_enter((dispatch_group_t)self->_computingImageValuesGroup);
  imageValuesComputationQueue = self->_imageValuesComputationQueue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke;
  v23[3] = &unk_24C618B20;
  v24 = v9;
  v25 = self;
  v29 = a2;
  v26 = v10;
  v27 = v13;
  v28 = v5;
  v19 = v13;
  v20 = v10;
  v21 = v9;
  dispatch_sync(imageValuesComputationQueue, v23);

LABEL_22:
}

- (void)precomputeGeometricValues
{
  uint64_t v4;
  void (**v5)(_QWORD);
  PUPhotoEditImageValues *currentGeometricValues;
  int v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  PUPhotoEditImageValues *v15;
  PUPhotoEditImageValues *v16;
  PUPhotoEditImageValues *v17;
  PUPhotoEditImageValues *initialGeometricValues;
  NSObject *computingGeometricValuesGroup;
  NSObject *geometricValuesComputationQueue;
  PUPhotoEditImageValues *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  PEValuesCalculator *v26;
  id v27;
  PUPhotoEditImageValues *v28;
  void (**v29)(_QWORD);
  _QWORD aBlock[5];
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v4 = MEMORY[0x24BDAC760];
  v35 = *MEMORY[0x24BDAC8D0];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke;
  aBlock[3] = &unk_24C618B48;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  currentGeometricValues = self->_currentGeometricValues;
  if (currentGeometricValues && !-[PUPhotoEditImageValues isComplete](currentGeometricValues, "isComplete"))
  {
    v7 = 1;
    goto LABEL_10;
  }
  if (-[PEValuesCalculator _geometricCurrentValuesCacheIsValid](self, "_geometricCurrentValuesCacheIsValid"))
  {
    v7 = 0;
LABEL_10:
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v7)
        v10 = CFSTR("Y");
      else
        v10 = CFSTR("N");
      if (-[PEValuesCalculator _geometricCurrentValuesCacheIsValid](self, "_geometricCurrentValuesCacheIsValid"))
        v11 = CFSTR("Y");
      else
        v11 = CFSTR("N");
      *(_DWORD *)buf = 138412546;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_INFO, "skipping precomputeGeometricValues; request pending? %@, cache valid? %@",
        buf,
        0x16u);
    }

LABEL_19:
    v5[2](v5);
    goto LABEL_20;
  }
  if (self->_skipGeometricCalculations)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "skipping precomputeGeometricValues - skipGeometricCalculations = YES", buf, 2u);
    }

    goto LABEL_19;
  }
  -[PEValuesCalculator currentEditSource](self, "currentEditSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEValuesCalculator.m"), 681, CFSTR("Need an edit source to perform this operation"));

  }
  -[PEValuesCalculator compositionController](self, "compositionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEValuesCalculator.m"), 683, CFSTR("Need a composition controller to perform this operation"));

  }
  objc_storeStrong((id *)&self->_compositionControllerForCurrentValues, v14);
  v15 = objc_alloc_init(PUPhotoEditImageValues);
  v16 = self->_currentGeometricValues;
  self->_currentGeometricValues = v15;

  if ((objc_msgSend((id)objc_opt_class(), "shouldRunGeometricAutoCalculatorForSource:", v12) & 1) != 0)
  {
    if (self->_initialGeometricValues)
    {
      v17 = 0;
    }
    else
    {
      v17 = objc_alloc_init(PUPhotoEditImageValues);
      initialGeometricValues = self->_initialGeometricValues;
      self->_initialGeometricValues = v17;

    }
    dispatch_group_enter((dispatch_group_t)self->_computingGeometricValuesGroup);
    geometricValuesComputationQueue = self->_geometricValuesComputationQueue;
    computingGeometricValuesGroup = self->_computingGeometricValuesGroup;
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_147;
    v24[3] = &unk_24C618B98;
    v25 = v14;
    v26 = self;
    v29 = v5;
    v27 = v12;
    v28 = v17;
    v21 = v17;
    dispatch_group_async(computingGeometricValuesGroup, geometricValuesComputationQueue, v24);

  }
  else
  {
    v5[2](v5);
  }

LABEL_20:
}

- (BOOL)hasImageValues
{
  PUPhotoEditImageValues *currentImageValues;

  currentImageValues = self->_currentImageValues;
  if (currentImageValues)
    LOBYTE(currentImageValues) = -[PUPhotoEditImageValues isComplete](currentImageValues, "isComplete");
  return (char)currentImageValues;
}

- (void)setVideoFrameTime:(id *)a3
{
  __int128 v5;
  CMTime v6;
  CMTime time1;

  time1 = (CMTime)self->_videoFrameTime;
  v6 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &v6))
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_videoFrameTime.epoch = a3->var3;
    *(_OWORD *)&self->_videoFrameTime.value = v5;
    -[PEValuesCalculator invalidate](self, "invalidate");
  }
}

- (void)invalidate
{
  PUPhotoEditImageValues *currentImageValues;
  id v4;

  currentImageValues = self->_currentImageValues;
  self->_currentImageValues = 0;

  -[PEValuesCalculator delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editValuesCalculatorHasChangedImageValues:", self);

}

- (void)computeAutoEnhanceWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *imageValuesComputationQueue;
  id v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  PEValuesCalculator *v14;
  id v15;
  SEL v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEValuesCalculator.m"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PEValuesCalculator precomputeImageValues](self, "precomputeImageValues");
  -[PEValuesCalculator compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  imageValuesComputationQueue = self->_imageValuesComputationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke;
  block[3] = &unk_24C618C10;
  v13 = v7;
  v14 = self;
  v15 = v5;
  v16 = a2;
  v9 = v5;
  v10 = v7;
  dispatch_async(imageValuesComputationQueue, block);

}

- (void)_ensureCurrentImageValuesAreComputed
{
  if (!-[PEValuesCalculator _imageCurrentValuesCacheIsValid](self, "_imageCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator precomputeImageValues](self, "precomputeImageValues");
    dispatch_group_wait((dispatch_group_t)self->_computingImageValuesGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_ensureInitialImageValuesAreComputed
{
  if (!-[PUPhotoEditImageValues isComplete](self->_initialImageValues, "isComplete"))
    -[PEValuesCalculator _ensureCurrentImageValuesAreComputed](self, "_ensureCurrentImageValuesAreComputed");
}

- (void)_ensureCurrentGeometricValuesAreComputed
{
  if (!-[PEValuesCalculator _geometricCurrentValuesCacheIsValid](self, "_geometricCurrentValuesCacheIsValid"))
  {
    -[PEValuesCalculator precomputeGeometricValues](self, "precomputeGeometricValues");
    dispatch_group_wait((dispatch_group_t)self->_computingGeometricValuesGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_ensureInitialGeometricValuesAreComputed
{
  if (!-[PUPhotoEditImageValues isComplete](self->_initialGeometricValues, "isComplete"))
    -[PEValuesCalculator _ensureCurrentGeometricValuesAreComputed](self, "_ensureCurrentGeometricValuesAreComputed");
}

- (PEValuesCalculatorDelegate)delegate
{
  return (PEValuesCalculatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PEValuesCalculatorSettings)settingsDelegate
{
  return (PEValuesCalculatorSettings *)objc_loadWeakRetained((id *)&self->_settingsDelegate);
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (BOOL)skipGeometricCalculations
{
  return self->_skipGeometricCalculations;
}

- (void)setSkipGeometricCalculations:(BOOL)a3
{
  self->_skipGeometricCalculations = a3;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_destroyWeak((id *)&self->_settingsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_computingGeometricValuesGroup, 0);
  objc_storeStrong((id *)&self->_geometricValuesComputationQueue, 0);
  objc_storeStrong((id *)&self->_computingImageValuesGroup, 0);
  objc_storeStrong((id *)&self->_imageValuesComputationQueue, 0);
  objc_storeStrong((id *)&self->_compositionControllerForCurrentValues, 0);
  objc_storeStrong((id *)&self->_initialGeometricValues, 0);
  objc_storeStrong((id *)&self->_initialImageValues, 0);
  objc_storeStrong((id *)&self->_currentGeometricValues, 0);
  objc_storeStrong((id *)&self->_currentImageValues, 0);
}

void __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  dispatch_semaphore_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__1682;
  v34[4] = __Block_byref_object_dispose__1683;
  v35 = 0;
  objc_msgSend(*(id *)(a1 + 32), "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "skipGeometricCalculations") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentEditSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PEValuesCalculator.m"), 860, CFSTR("Need an edit source to perform this operation"));

    }
    v4 = objc_alloc(MEMORY[0x24BE72028]);
    objc_msgSend(*(id *)(a1 + 40), "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEditSource:", v5);

    objc_msgSend(v6, "setCompositionController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "composition");
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v7;
  }
  v8 = dispatch_semaphore_create(0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71CD8]), "initWithComposition:", v2);
  v10 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_2;
  v31[3] = &unk_24C618BC0;
  v33 = v34;
  v11 = v8;
  v32 = v11;
  objc_msgSend(v9, "submit:", v31);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__1682;
  v29[4] = __Block_byref_object_dispose__1683;
  v30 = 0;
  v12 = dispatch_semaphore_create(0);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71CA8]), "initWithComposition:", v2);
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    objc_msgSend(v14, "videoFrameTime");
  }
  else
  {
    v27 = 0uLL;
    v28 = 0;
  }
  v25 = v27;
  v26 = v28;
  objc_msgSend(v13, "setTime:", &v25);
  objc_msgSend(v13, "setName:", CFSTR("PU-PIFaceBalanceAutoCalculator"));
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_3;
  v22[3] = &unk_24C618BC0;
  v24 = v29;
  v15 = v12;
  v23 = v15;
  objc_msgSend(v13, "submit:", v22);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_4;
  v18[3] = &unk_24C618BE8;
  v16 = *(void **)(a1 + 48);
  v18[4] = *(_QWORD *)(a1 + 40);
  v19 = v16;
  v20 = v29;
  v21 = v34;
  dispatch_async(MEMORY[0x24BDAC9B8], v18);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v34, 8);

}

void __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  objc_msgSend(v3, "valueForKey:", CFSTR("inputCorrectionInfo"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = 0;
  objc_msgSend(a2, "result:", &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("OrigI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("faceI"));

    objc_msgSend(v3, "valueForKey:", CFSTR("OrigQ"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("faceQ"));

    objc_msgSend(v3, "valueForKey:", CFSTR("Strength"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("faceStrength"));

    objc_msgSend(v3, "valueForKey:", CFSTR("Warmth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("faceWarmth"));

    objc_msgSend(v3, "valueForKey:", CFSTR("WarmTemp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("warmTemp"));

    objc_msgSend(v3, "valueForKey:", CFSTR("WarmTint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("warmTint"));

    objc_msgSend(v3, "valueForKey:", CFSTR("WarmFace"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("warmFace"));

    v13 = objc_msgSend(v5, "copy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __62__PEValuesCalculator_computeAutoEnhanceWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "smartToneAutoSuggestion");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "smartColorAutoSuggestion");
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(v3, v4);
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2;
  block[3] = &unk_24C618B48;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_147(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  id v35;
  _QWORD *v36;
  uint8_t *v37;
  os_signpost_id_t v38;
  _QWORD block[4];
  id v40;
  NSObject *v41;
  NSObject *v42;
  uint8_t *v43;
  os_signpost_id_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  _QWORD v49[4];
  NSObject *v50;
  NSObject *v51;
  _QWORD *v52;
  os_signpost_id_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[5];
  id v59;
  uint8_t buf[8];
  uint8_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_16;
  v2 = objc_alloc(MEMORY[0x24BE72028]);
  objc_msgSend(*(id *)(a1 + 40), "editSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEditSource:", v3);

  objc_msgSend(v4, "setCompositionController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PLPhotoEditGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);
    v8 = v6;
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20D13D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GeometricAutoCalculators", " enableTelemetry=YES ", buf, 2u);
    }

    v10 = dispatch_group_create();
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v11, OS_LOG_TYPE_INFO, "beginning geometric calculators", buf, 2u);
    }

    if (PECanRenderPortrait_onceToken != -1)
      dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_38);
    if (PECanRenderPortrait_canRenderPortrait && *(_BYTE *)(*(_QWORD *)(a1 + 40) + 80)
      || (v12 = objc_msgSend((id)objc_opt_class(), "shouldRunGeometricAutoCalculatorForSource:", *(_QWORD *)(a1 + 48)),
          v13 = *(_QWORD *)(a1 + 40),
          v12)
      && (*(_BYTE *)(v13 + 81) || *(_BYTE *)(v13 + 82)))
    {
      v14 = (void *)objc_opt_new();
      v13 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v14 = 0;
    }
    *(_QWORD *)buf = 0;
    v61 = buf;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__1682;
    v64 = __Block_byref_object_dispose__1683;
    v65 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = __Block_byref_object_copy__1682;
    v58[4] = __Block_byref_object_dispose__1683;
    v59 = 0;
    v15 = MEMORY[0x24BDAC760];
    if (*(_BYTE *)(v13 + 81))
    {
      dispatch_group_enter(v10);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71C88]), "initWithComposition:", v5);
      objc_msgSend(v16, "setFaceObservationCache:", v14);
      objc_msgSend(v16, "setMaxAutoStraighten:", *(double *)(*(_QWORD *)(a1 + 40) + 88));
      v17 = *(void **)(a1 + 40);
      if (v17)
      {
        objc_msgSend(v17, "videoFrameTime");
      }
      else
      {
        v56 = 0uLL;
        v57 = 0;
      }
      v54 = v56;
      v55 = v57;
      objc_msgSend(v16, "setTime:", &v54);
      objc_msgSend(v16, "setName:", CFSTR("PU-PICropAutoCalculator"));
      v49[0] = v15;
      v49[1] = 3221225472;
      v49[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_151;
      v49[3] = &unk_24C618AD0;
      v52 = v58;
      v50 = v10;
      v51 = v9;
      v53 = v7;
      objc_msgSend(v16, "submit:", v49);

      v13 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v13 + 82))
    {
      dispatch_group_enter(v10);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71CC0]), "initWithComposition:", v5);
      objc_msgSend(v18, "setFaceObservationCache:", v14);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 40) + 96));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMaxAutoYaw:", v19);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 40) + 104));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMaxAutoPitch:", v20);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 40) + 112));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMaxAutoAngle:", v21);

      objc_msgSend(v18, "setDisableOnPanos:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 128));
      objc_msgSend(v18, "setDisableOnFrontFacingCameraImages:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 129));
      objc_msgSend(v18, "setMaxFaceSize:", *(double *)(*(_QWORD *)(a1 + 40) + 120));
      objc_msgSend(v18, "setShouldRunBuildingCheck:", 1);
      objc_msgSend(v18, "setDebugFilesEnabled:", 1);
      objc_msgSend(v18, "setDebugFilesPrefix:", CFSTR("Edit"));
      objc_msgSend(v18, "setName:", CFSTR("PU-PIPerspectiveAutoCalculator"));
      v22 = *(void **)(a1 + 40);
      if (v22)
      {
        objc_msgSend(v22, "videoFrameTime");
      }
      else
      {
        v47 = 0uLL;
        v48 = 0;
      }
      v45 = v47;
      v46 = v48;
      objc_msgSend(v18, "setTime:", &v45);
      dispatch_get_global_queue(0, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_158;
      block[3] = &unk_24C618E10;
      v40 = v18;
      v43 = buf;
      v41 = v10;
      v42 = v9;
      v44 = v7;
      v24 = v18;
      dispatch_async(v23, block);

      v13 = *(_QWORD *)(a1 + 40);
    }
    v25 = *(id *)(v13 + 16);
    v26 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_160;
    v30[3] = &unk_24C618B70;
    v35 = *(id *)(a1 + 64);
    v36 = v58;
    v37 = buf;
    v27 = *(_QWORD *)(a1 + 40);
    v31 = v25;
    v32 = v27;
    v33 = *(id *)(a1 + 56);
    v34 = v9;
    v38 = v7;
    v28 = v9;
    v29 = v25;
    dispatch_group_notify(v10, v26, v30);

    _Block_object_dispose(v58, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "Error in crop autocalculator: %@", buf, 0xCu);
    }

  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PICropAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v10, OS_SIGNPOST_EVENT, v11, "GeometricAutoCalculators", "PICropAutoCalculator Complete", buf, 2u);
  }

}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_158(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_159;
  v5[3] = &unk_24C618AD0;
  v8 = *(_QWORD *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  v9 = v4;
  objc_msgSend(v2, "submit:", v5);

}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_160(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];
  _QWORD block[4];
  id v10;
  uint64_t v11;

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setAutoCropValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAutoPerspectiveValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_161;
  block[3] = &unk_24C618E60;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v10 = v2;
  v11 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    objc_msgSend(v4, "setAutoCropValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setAutoPerspectiveValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setComplete:", 1);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 72));
  v5 = *(id *)(a1 + 56);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 88);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v6, OS_SIGNPOST_INTERVAL_END, v7, "GeometricAutoCalculators", " enableTelemetry=YES ", v8, 2u);
  }

}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_161(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setComplete:", 1);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editValuesCalculatorHasChangedGeometricValues:", *(_QWORD *)(a1 + 40));

}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2_159(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "Error in perspective autocalculator: %@", buf, 0xCu);
    }

  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PIPerspectiveAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v10, OS_SIGNPOST_EVENT, v11, "GeometricAutoCalculators", "PIPerspectiveAutoCalculator Complete", buf, 2u);
  }

}

void __47__PEValuesCalculator_precomputeGeometricValues__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editValuesCalculatorDidFinishComputingGeometricValues:", *(_QWORD *)(a1 + 32));

  }
}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  id v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  os_signpost_id_t v49;
  _QWORD v50[4];
  NSObject *v51;
  NSObject *v52;
  _QWORD *v53;
  os_signpost_id_t v54;
  _QWORD v55[4];
  NSObject *v56;
  NSObject *v57;
  _QWORD *v58;
  os_signpost_id_t v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  _QWORD v64[4];
  NSObject *v65;
  NSObject *v66;
  _QWORD *v67;
  os_signpost_id_t v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  _QWORD v73[4];
  NSObject *v74;
  NSObject *v75;
  _QWORD *v76;
  os_signpost_id_t v77;
  _QWORD v78[4];
  NSObject *v79;
  NSObject *v80;
  _QWORD *v81;
  os_signpost_id_t v82;
  _QWORD v83[5];
  id v84;
  _QWORD v85[5];
  id v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;
  _QWORD v91[5];
  id v92;
  uint8_t buf[4];
  const __CFString *v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "skipGeometricCalculations") & 1) == 0 && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "currentEditSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("PEValuesCalculator.m"), 435, CFSTR("Need an edit source to perform this operation"));

    }
    v4 = objc_alloc(MEMORY[0x24BE72028]);
    objc_msgSend(*(id *)(a1 + 40), "editSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEditSource:", v5);

    objc_msgSend(v6, "setCompositionController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "composition");
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v7;
  }
  if (v2)
  {
    v91[0] = 0;
    v91[1] = v91;
    v91[2] = 0x3032000000;
    v91[3] = __Block_byref_object_copy__1682;
    v91[4] = __Block_byref_object_dispose__1683;
    v92 = 0;
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x3032000000;
    v89[3] = __Block_byref_object_copy__1682;
    v89[4] = __Block_byref_object_dispose__1683;
    v90 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3032000000;
    v87[3] = __Block_byref_object_copy__1682;
    v87[4] = __Block_byref_object_dispose__1683;
    v88 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = __Block_byref_object_copy__1682;
    v85[4] = __Block_byref_object_dispose__1683;
    v86 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = __Block_byref_object_copy__1682;
    v83[4] = __Block_byref_object_dispose__1683;
    v84 = 0;
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);
    v10 = v8;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20D13D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnterEditAutoCalculators", " enableTelemetry=YES ", buf, 2u);
    }

    v12 = dispatch_group_create();
    PLPhotoEditGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v13, OS_LOG_TYPE_INFO, "beginning calculators", buf, 2u);
    }

    if (PECanRenderPortrait_onceToken != -1)
      dispatch_once(&PECanRenderPortrait_onceToken, &__block_literal_global_38);
    v14 = PECanRenderPortrait_canRenderPortrait;
    if (PECanRenderPortrait_canRenderPortrait && *(_BYTE *)(*(_QWORD *)(a1 + 40) + 80)
      || (v15 = (void *)objc_opt_class(),
          objc_msgSend(*(id *)(a1 + 40), "editSource"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v15) = objc_msgSend(v15, "shouldRunGeometricAutoCalculatorForSource:", v16),
          v16,
          (_DWORD)v15)
      && ((v17 = *(_QWORD *)(a1 + 40), *(_BYTE *)(v17 + 81)) || *(_BYTE *)(v17 + 82)))
    {
      v37 = (void *)objc_opt_new();
    }
    else
    {
      v37 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 2);
    PLPhotoEditGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("YES");
      if (!v14)
        v20 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v94 = v20;
      _os_log_impl(&dword_20D13D000, v19, OS_LOG_TYPE_INFO, "will we do the portrait calculator? %@", buf, 0xCu);
    }
    v21 = v14 == 0;

    v22 = *(_QWORD *)(a1 + 40);
    v23 = MEMORY[0x24BDAC760];
    if (!v21)
    {
      if (*(_BYTE *)(v22 + 80))
      {
        dispatch_group_enter(v12);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71CD0]), "initWithComposition:", v2);
        objc_msgSend(v24, "setFaceObservationCache:", v37);
        objc_msgSend(v24, "setName:", CFSTR("PU-PIPortraitAutoCalculator"));
        objc_msgSend(v24, "setPriority:", v18);
        v78[0] = v23;
        v78[1] = 3221225472;
        v78[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_118;
        v78[3] = &unk_24C618AD0;
        v81 = v85;
        v79 = v12;
        v80 = v11;
        v82 = v9;
        objc_msgSend(v24, "submit:", v78);

        v22 = *(_QWORD *)(a1 + 40);
      }
      if (*(_BYTE *)(v22 + 83))
      {
        dispatch_group_enter(v12);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71CA0]), "initWithComposition:", v2);
        objc_msgSend(v25, "setName:", CFSTR("PU-PIDepthEffectApertureAutoCalculator"));
        objc_msgSend(v25, "setPriority:", v18);
        v73[0] = v23;
        v73[1] = 3221225472;
        v73[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_123;
        v73[3] = &unk_24C618AD0;
        v76 = v83;
        v74 = v12;
        v75 = v11;
        v77 = v9;
        objc_msgSend(v25, "submit:", v73);

        v22 = *(_QWORD *)(a1 + 40);
      }
    }
    if (*(_BYTE *)(v22 + 84))
    {
      dispatch_group_enter(v12);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71D28]), "initWithComposition:", v2);
      v27 = *(void **)(a1 + 40);
      if (v27)
      {
        objc_msgSend(v27, "videoFrameTime");
      }
      else
      {
        v71 = 0uLL;
        v72 = 0;
      }
      v69 = v71;
      v70 = v72;
      objc_msgSend(v26, "setTime:", &v69, v37);
      objc_msgSend(v26, "setName:", CFSTR("PU-PISmartToneAutoCalculator"));
      objc_msgSend(v26, "setPriority:", v18);
      v64[0] = v23;
      v64[1] = 3221225472;
      v64[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_127;
      v64[3] = &unk_24C618AD0;
      v67 = v91;
      v65 = v12;
      v66 = v11;
      v68 = v9;
      objc_msgSend(v26, "submit:", v64);

      v22 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v22 + 85))
    {
      dispatch_group_enter(v12);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71D10]), "initWithComposition:", v2);
      v29 = *(void **)(a1 + 40);
      if (v29)
      {
        objc_msgSend(v29, "videoFrameTime");
      }
      else
      {
        v62 = 0uLL;
        v63 = 0;
      }
      v60 = v62;
      v61 = v63;
      objc_msgSend(v28, "setTime:", &v60, v37);
      objc_msgSend(v28, "setName:", CFSTR("PU-PISmartColorAutoCalculator"));
      objc_msgSend(v28, "setPriority:", v18);
      v55[0] = v23;
      v55[1] = 3221225472;
      v55[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_133;
      v55[3] = &unk_24C618AD0;
      v58 = v89;
      v56 = v12;
      v57 = v11;
      v59 = v9;
      objc_msgSend(v28, "submit:", v55);

      v22 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v22 + 86))
    {
      dispatch_group_enter(v12);
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71CF0]), "initWithComposition:", v2);
      v50[0] = v23;
      v50[1] = 3221225472;
      v50[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_135;
      v50[3] = &unk_24C618AD0;
      v53 = v87;
      v51 = v12;
      v52 = v11;
      v54 = v9;
      objc_msgSend(v30, "submit:", v50);

      v22 = *(_QWORD *)(a1 + 40);
    }
    v31 = *(NSObject **)(v22 + 48);
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_136;
    block[3] = &unk_24C618AF8;
    v44 = v91;
    v45 = v89;
    v32 = *(id *)(a1 + 48);
    v46 = v87;
    v47 = v85;
    v48 = v83;
    v33 = *(_QWORD *)(a1 + 40);
    v39 = v32;
    v40 = v33;
    v41 = *(id *)(a1 + 56);
    v34 = *(id *)(a1 + 64);
    v42 = v11;
    v43 = v34;
    v49 = v9;
    v35 = v11;
    dispatch_group_notify(v12, v31, block);

    _Block_object_dispose(v83, 8);
    _Block_object_dispose(v85, 8);

    _Block_object_dispose(v87, 8);
    _Block_object_dispose(v89, 8);

    _Block_object_dispose(v91, 8);
  }

}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "Error in portrait autocalculator: %@", buf, 0xCu);
    }

  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PIPortraitAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PIPortraitAutoCalculator Complete", buf, 2u);
  }

}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_123(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "Error in depth autocalculator: %@", buf, 0xCu);
    }

  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PIDepthEffectApertureAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PIDepthEffectApertureAutoCalculator Complete", buf, 2u);
  }

}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_127(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_msgSend(a2, "result:", &v14);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v14;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if ((objc_msgSend(MEMORY[0x24BE72028], "currentDeviceShouldAllowLocalLight") & 1) != 0)
      goto LABEL_7;
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutableCopy");
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("inputLocalLight"));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_ERROR, "Error in smart tone autocalculator: %@", buf, 0xCu);
    }
  }

LABEL_7:
  PLPhotoEditGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v10, OS_LOG_TYPE_INFO, "PISmartToneAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v11 = *(id *)(a1 + 40);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v12, OS_SIGNPOST_EVENT, v13, "EnterEditAutoCalculators", "PISmartToneAutoCalculator Complete", buf, 2u);
  }

}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "Error in smart color autocalculator: %@", buf, 0xCu);
    }

  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PISmartColorAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PISmartColorAutoCalculator Complete", buf, 2u);
  }

}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "Error in semantic style autocalculator: %@", buf, 0xCu);
    }

  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PISemanticStyleAutoCalculator completed", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v10, OS_SIGNPOST_EVENT, v11, "EnterEditAutoCalculators", "PISemanticStyleAutoCalculator Complete", buf, 2u);
  }

}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_136(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  uint64_t v35;
  uint8_t buf[16];

  PLPhotoEditGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v2, OS_LOG_TYPE_INFO, "All calculators complete", buf, 2u);
  }

  v3 = (void *)MEMORY[0x24BE71F80];
  v4 = *MEMORY[0x24BE71F28];
  objc_msgSend(MEMORY[0x24BE71D20], "inputLightKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForType:adjustmentKey:settingKey:", 1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("autoValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      v8 = v12;
    }

  }
  v13 = (void *)MEMORY[0x24BE71F80];
  v14 = *MEMORY[0x24BE71F20];
  objc_msgSend(MEMORY[0x24BE71D08], "inputColorKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForType:adjustmentKey:settingKey:", 1, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v19)
  {
    objc_msgSend(v19, "objectForKey:", CFSTR("satAutoValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "floatValue");
      v18 = v22;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setSmartToneStatistics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSmartColorStatistics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSemanticStyleStatistics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSmartToneAutoSuggestion:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setSmartColorAutoSuggestion:", v18);
  objc_msgSend(*(id *)(a1 + 32), "setPortraitValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setApertureValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_143;
  v33 = &unk_24C618E60;
  v23 = *(id *)(a1 + 32);
  v24 = *(_QWORD *)(a1 + 40);
  v34 = v23;
  v35 = v24;
  dispatch_async(MEMORY[0x24BDAC9B8], &v30);
  v25 = *(void **)(a1 + 48);
  if (v25)
  {
    objc_msgSend(v25, "setSmartToneStatistics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v30, v31, v32, v33);
    objc_msgSend(*(id *)(a1 + 48), "setSmartColorStatistics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setSemanticStyleStatistics:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setSmartToneAutoSuggestion:", v8);
    objc_msgSend(*(id *)(a1 + 48), "setSmartColorAutoSuggestion:", v18);
    objc_msgSend(*(id *)(a1 + 48), "setPortraitValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setApertureValues:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 48), "setComplete:", 1);
  }
  v26 = *(_QWORD *)(a1 + 64);
  if (v26)
    (*(void (**)(void))(v26 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 56));
  v27 = *(id *)(a1 + 56);
  v28 = v27;
  v29 = *(_QWORD *)(a1 + 112);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D13D000, v28, OS_SIGNPOST_INTERVAL_END, v29, "EnterEditAutoCalculators", " enableTelemetry=YES ", buf, 2u);
  }

}

void __66__PEValuesCalculator_precomputeImageValuesWithOptionalCompletion___block_invoke_143(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setComplete:", 1);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editValuesCalculatorHasChangedImageValues:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)shouldRunGeometricAutoCalculatorForSource:(id)a3
{
  id v3;
  char isKindOfClass;
  char v5;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v5 = isKindOfClass ^ 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

@end

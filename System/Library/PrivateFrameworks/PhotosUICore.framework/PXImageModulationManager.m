@implementation PXImageModulationManager

- (PXImageModulationManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImageModulationManager.m"), 210, CFSTR("%s is not available as initializer"), "-[PXImageModulationManager init]");

  abort();
}

- (PXImageModulationManager)initWithRootViewController:(id)a3 mainScreen:(BOOL)a4
{
  id v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  PXRequestedEDRHeadroomFactorFilter *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXImageModulationManager;
  v7 = -[PXImageModulationManager init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[105] = 1;
    *((_DWORD *)v7 + 24) = 16843009;
    *(_DWORD *)(v7 + 99) = 16843009;
    objc_storeWeak((id *)v7 + 21, v6);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v8 + 17);
    *((_QWORD *)v8 + 17) = v9;

    v8[123] = a4;
    v8[121] = 1;
    *((_QWORD *)v8 + 24) = 0x3FF0000000000000;
    v11 = -[PXRequestedEDRHeadroomFactorFilter initWithInput:]([PXRequestedEDRHeadroomFactorFilter alloc], "initWithInput:", *((double *)v8 + 24));
    v12 = (void *)*((_QWORD *)v8 + 18);
    *((_QWORD *)v8 + 18) = v11;

    objc_msgSend(*((id *)v8 + 18), "registerChangeObserver:context:", v8, PXRequestedEDRHeadroomFactorFilterObservationContext);
    +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v8 + 16);
    *((_QWORD *)v8 + 16) = v13;

    objc_msgSend(*((id *)v8 + 16), "addKeyObserver:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__processInfoPowerStateDidChange_, *MEMORY[0x1E0CB3048], 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__applicationDidResignActive_, *MEMORY[0x1E0DC4868], 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);
    PXRegisterPreferencesObserver(v8);

  }
  return (PXImageModulationManager *)v8;
}

- (void)dealloc
{
  double v2;
  void *v4;
  objc_super v5;

  LODWORD(v2) = 1.0;
  -[CAContext setDesiredDynamicRange:](self->_coreAnimationContext, "setDesiredDynamicRange:", v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  PXUnregisterPreferencesObserver(self);
  v5.receiver = self;
  v5.super_class = (Class)PXImageModulationManager;
  -[PXImageModulationManager dealloc](&v5, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __39__PXImageModulationManager_setEnabled___block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXImageModulationManager performChanges:](self, "performChanges:", v3);
  }
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_lowPowerModeEnabled != a3)
  {
    v3 = a3;
    self->_lowPowerModeEnabled = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] Low power mode: %i", (uint8_t *)v6, 8u);
    }

    -[PXImageModulationManager _invalidateActive](self, "_invalidateActive");
  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] Active: %i", (uint8_t *)v6, 8u);
    }

    -[PXImageModulationManager _invalidateHDRFocus](self, "_invalidateHDRFocus");
    -[PXImageModulationManager _invalidateImageLayerModulators](self, "_invalidateImageLayerModulators");
  }
}

- (void)enableForTesting
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__PXImageModulationManager_enableForTesting__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXImageModulationManager performChanges:](self, "performChanges:", v2);
}

- (void)setEnabledForTesting:(BOOL)a3
{
  if (self->_enabledForTesting != a3)
  {
    self->_enabledForTesting = a3;
    -[PXImageModulationManager _invalidateDesiredDynamicRange](self, "_invalidateDesiredDynamicRange");
  }
}

- (id)checkoutImageLayerModulatorWithOptions:(id)a3
{
  return -[PXImageModulationManager _checkoutImageLayerModulatorWithOptions:contentType:](self, "_checkoutImageLayerModulatorWithOptions:contentType:", a3.var0, *(_QWORD *)&a3.var1, 0);
}

- (id)_checkoutImageLayerModulatorWithOptions:(id)a3 contentType:(int64_t)a4
{
  float var1;
  int64_t var0;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  PXImageLayerModulator *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  float v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  var1 = a3.var1;
  var0 = a3.var0;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[PXImageModulationManager isEnabled](self, "isEnabled"))
    v8 = var0;
  else
    v8 = 0;
  v9 = 0;
  v10 = v8;
  switch(v8)
  {
    case 0:
      -[PXImageModulationManager settings](self, "settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "SDRModulationIntensity");
      v13 = v12;

      if (v13 <= 0.0)
        goto LABEL_8;
      goto LABEL_6;
    case 1:
LABEL_6:
      -[PXImageModulationManager settings](self, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v14, "filterType");

      if (!v10)
        goto LABEL_8;
      v9 = 0;
LABEL_13:
      *(_QWORD *)&v19 = v8;
      *((_QWORD *)&v19 + 1) = v10;
      v20 = var1;
      v21 = 0;
      v22 = v9;
      v23 = 0;
      v15 = -[PXImageLayerModulator initWithOptions:]([PXImageLayerModulator alloc], "initWithOptions:", &v19);
      -[PXImageModulationManager _updateImageLayerModulator:](self, "_updateImageLayerModulator:", v15);
      -[PXImageModulationManager imageLayerModulators](self, "imageLayerModulators");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v15);

      break;
    case 2:
      if (a4)
        v10 = 1;
      else
        v10 = 3;
      v9 = 1;
      goto LABEL_13;
    case 3:
      goto LABEL_13;
    default:
LABEL_8:
      v15 = 0;
      break;
  }
  PLUIGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v19) = 138412290;
    *(_QWORD *)((char *)&v19 + 4) = v15;
    _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEBUG, "[ImageModulation] created image layer modulator %@", (uint8_t *)&v19, 0xCu);
  }

  return v15;
}

- (void)checkInImageLayerModulator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "performChanges_Private:", &__block_literal_global_147817);
  -[PXImageModulationManager imageLayerModulators](self, "imageLayerModulators");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)checkoutLivePhotoViewModulatorWithOptions:(id)a3
{
  uint64_t v3;
  int64_t var0;
  void *v6;
  void *v7;
  PXLivePhotoViewModulator *v8;

  v3 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  -[PXImageModulationManager _checkoutImageLayerModulatorWithOptions:contentType:](self, "_checkoutImageLayerModulatorWithOptions:contentType:", a3.var0, *(_QWORD *)&a3.var1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageModulationManager _checkoutImageLayerModulatorWithOptions:contentType:](self, "_checkoutImageLayerModulatorWithOptions:contentType:", var0, v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXLivePhotoViewModulator initWithImageModulator:videoModulator:]([PXLivePhotoViewModulator alloc], "initWithImageModulator:videoModulator:", v6, v7);

  return v8;
}

- (void)checkInLivePhotoViewModulator:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "performChanges_Private:", &__block_literal_global_40_147814);
  objc_msgSend(v4, "imageModulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageModulationManager checkInImageLayerModulator:](self, "checkInImageLayerModulator:", v5);

  objc_msgSend(v4, "videoModulator");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PXImageModulationManager checkInImageLayerModulator:](self, "checkInImageLayerModulator:", v6);
}

- (void)_updateImageLayerModulator:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = a3;
  v5 = -[PXImageModulationManager isActive](self, "isActive");
  -[PXImageModulationManager imageModulationIntensity](self, "imageModulationIntensity");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PXImageModulationManager__updateImageLayerModulator___block_invoke;
  v7[3] = &__block_descriptor_41_e48_v16__0___PXMutableImageLayerModulator_Private__8l;
  v8 = v5;
  v7[4] = v6;
  objc_msgSend(v4, "performChanges_Private:", v7);

}

- (void)setNeedsHDRFocusUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PXImageModulationManager_setNeedsHDRFocusUpdate__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXImageModulationManager performChanges:](self, "performChanges:", v2);
}

- (void)setNeedsImageModulationIntensityUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__PXImageModulationManager_setNeedsImageModulationIntensityUpdate__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXImageModulationManager performChanges:](self, "performChanges:", v2);
}

- (void)setNeedsEnabledUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PXImageModulationManager_setNeedsEnabledUpdate__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXImageModulationManager performChanges:](self, "performChanges:", v2);
}

- (void)setHDRFocus:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_HDRFocus != a3)
  {
    self->_HDRFocus = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] HDR Focus: %0.6f", (uint8_t *)&v6, 0xCu);
    }

    -[PXImageModulationManager signalChange:](self, "signalChange:", 1);
    -[PXImageModulationManager _invalidateRequestedEDRHeadroomFactor](self, "_invalidateRequestedEDRHeadroomFactor");
  }
}

- (void)setImageModulationIntensity:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_imageModulationIntensity != a3)
  {
    self->_imageModulationIntensity = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[ImageModulation] Intensity: %0.6f", (uint8_t *)&v6, 0xCu);
    }

    -[PXImageModulationManager signalChange:](self, "signalChange:", 2);
    -[PXImageModulationManager _invalidateRequestedEDRHeadroomFactor](self, "_invalidateRequestedEDRHeadroomFactor");
    -[PXImageModulationManager _invalidateImageLayerModulators](self, "_invalidateImageLayerModulators");
  }
}

- (void)setRequestedEDRHeadroomFactor:(double)a3
{
  long double requestedEDRHeadroomFactor;
  double v6;
  double v7;
  double lastRequestedEDRHeadroomChangeTime;
  NSObject *v9;
  int v10;
  long double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  requestedEDRHeadroomFactor = self->_requestedEDRHeadroomFactor;
  if (requestedEDRHeadroomFactor != a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = v6;
    lastRequestedEDRHeadroomChangeTime = self->_lastRequestedEDRHeadroomChangeTime;
    if (self->_requestedEDRHeadroomFactor > 1.0)
      -[PXImageModulationManager _didEndRequestingEDRHeadroomFactor:](self, "_didEndRequestingEDRHeadroomFactor:");
    self->_requestedEDRHeadroomFactor = a3;
    if (a3 > 1.0)
      -[PXImageModulationManager _didStartRequestingEDRHeadroomFactor:](self, "_didStartRequestingEDRHeadroomFactor:", a3);
    self->_lastRequestedEDRHeadroomChangeTime = v7;
    -[PXImageModulationManager signalChange:](self, "signalChange:", 4);
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134217984;
      v11 = log2(a3);
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "[ImageModulation] requestedEDRHeadroom: %f", (uint8_t *)&v10, 0xCu);
    }

    -[PXImageModulationManager _updateCoreAnimationContext](self, "_updateCoreAnimationContext");
    -[PXImageModulationManager _invalidateDesiredDynamicRange](self, "_invalidateDesiredDynamicRange");
    if (requestedEDRHeadroomFactor > 1.0 && v7 - lastRequestedEDRHeadroomChangeTime > 0.0)
    {
      log2(requestedEDRHeadroomFactor);
      PLSAggregateDictionaryKeyForEDRHeadroomRequest();
      PLSAggregateDictionaryAddValueForScalarKey();
    }
  }
}

- (void)_didStartRequestingEDRHeadroomFactor:(double)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[PXImageModulationManager requestedEDRHeadroomSignpost](self, "requestedEDRHeadroomSignpost", a3))
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "did start requesting EDR headroom twice", v5, 2u);
    }

  }
  -[PXImageModulationManager setRequestedEDRHeadroomSignpost:](self, "setRequestedEDRHeadroomSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
}

- (void)_didEndRequestingEDRHeadroomFactor:(double)a3
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = log2(a3);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForDouble:bucketLimits:numberFormatter:", &unk_1E53E9C00, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.EDRHeadroomRequested%@"), v6);

  v8 = (void *)MEMORY[0x1E0D09910];
  v9 = -[PXImageModulationManager requestedEDRHeadroomSignpost](self, "requestedEDRHeadroomSignpost");
  v10 = *MEMORY[0x1E0D09708];
  v12 = *MEMORY[0x1E0D09850];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endSignpost:forEventName:withPayload:", v9, v10, v11);

  -[PXImageModulationManager setRequestedEDRHeadroomSignpost:](self, "setRequestedEDRHeadroomSignpost:", 0);
}

- (void)_updateCoreAnimationContext
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXImageModulationManager rootViewController](self, "rootViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      objc_msgSend(v4, "viewIfLoaded");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        break;
      objc_msgSend(v4, "presentedViewController");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
      if (!v8)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    -[PXImageModulationManager coreAnimationContext](self, "coreAnimationContext");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v7 = (void *)v9;
      v4 = 0;
    }
    else
    {
      PLUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[PXImageModulationManager rootViewController](self, "rootViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "[ImageModulation] context missing for %@", (uint8_t *)&v12, 0xCu);

      }
      v4 = 0;
      v7 = 0;
    }
  }
  -[PXImageModulationManager setCoreAnimationContext:](self, "setCoreAnimationContext:", v7);

}

- (void)setCoreAnimationContext:(id)a3
{
  CAContext *v4;
  CAContext *coreAnimationContext;
  CAContext *v6;
  CAContext *v7;
  CAContext *v8;
  double v9;
  CAContext *v10;

  v4 = (CAContext *)a3;
  coreAnimationContext = self->_coreAnimationContext;
  if (coreAnimationContext != v4)
  {
    v10 = v4;
    v6 = v4;
    v7 = self->_coreAnimationContext;
    self->_coreAnimationContext = v6;
    v8 = coreAnimationContext;

    LODWORD(v9) = 1.0;
    -[CAContext setDesiredDynamicRange:](v8, "setDesiredDynamicRange:", v9);

    -[PXImageModulationManager _invalidateDesiredDynamicRange](self, "_invalidateDesiredDynamicRange");
    v4 = v10;
  }

}

- (void)setApplicationActive:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_applicationActive != a3)
  {
    self->_applicationActive = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__PXImageModulationManager_setApplicationActive___block_invoke;
    v3[3] = &unk_1E5142B28;
    v4 = a3;
    v3[4] = self;
    -[PXImageModulationManager performChanges:](self, "performChanges:", v3);
  }
}

- (void)setCurrentScreenSupportsHDR:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_currentScreenSupportsHDR != a3)
  {
    self->_currentScreenSupportsHDR = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PXImageModulationManager_setCurrentScreenSupportsHDR___block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXImageModulationManager performChanges:](self, "performChanges:", v3);
  }
}

- (void)_processInfoPowerStateDidChange:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)_applicationDidResignActive:(id)a3
{
  -[PXImageModulationManager setApplicationActive:](self, "setApplicationActive:", 0);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[PXImageModulationManager setApplicationActive:](self, "setApplicationActive:", 1);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImageModulationManager;
  -[PXImageModulationManager didPerformChanges](&v3, sel_didPerformChanges);
  -[PXImageModulationManager _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  if (-[PXImageModulationManager _needsUpdate](self, "_needsUpdate"))
  {
    -[PXImageModulationManager _updateEnabledIfNeeded](self, "_updateEnabledIfNeeded");
    -[PXImageModulationManager _updateLowPowerModeEnabledIfNeeded](self, "_updateLowPowerModeEnabledIfNeeded");
    -[PXImageModulationManager _updateCurrentScreenSupportsHDRIfNeeded](self, "_updateCurrentScreenSupportsHDRIfNeeded");
    -[PXImageModulationManager _updateActiveIfNeeded](self, "_updateActiveIfNeeded");
    -[PXImageModulationManager _updateHDRFocusIfNeeded](self, "_updateHDRFocusIfNeeded");
    -[PXImageModulationManager _updateImageModulationIntensityIfNeeded](self, "_updateImageModulationIntensityIfNeeded");
    -[PXImageModulationManager _updateRequestedEDRHeadroomFactorIfNeeded](self, "_updateRequestedEDRHeadroomFactorIfNeeded");
    -[PXImageModulationManager _updateFinalRequestedEDRHeadroomFactorIfNeeded](self, "_updateFinalRequestedEDRHeadroomFactorIfNeeded");
    -[PXImageModulationManager _updateDesiredDynamicRangeIfNeeded](self, "_updateDesiredDynamicRangeIfNeeded");
    -[PXImageModulationManager _updateImageLayerModulatorsIfNeeded](self, "_updateImageLayerModulatorsIfNeeded");
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.enabled
      || self->_needsUpdateFlags.lowPowerModeEnabled
      || self->_needsUpdateFlags.active
      || self->_needsUpdateFlags.HDRFocus
      || self->_needsUpdateFlags.imageModulationIntensity
      || self->_needsUpdateFlags.requestedEDRHeadroomFactor
      || self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor
      || self->_needsUpdateFlags.desiredDynamicRange
      || self->_needsUpdateFlags.imageLayerModulators
      || self->_needsUpdateFlags.currentScreenSupportsHDR;
}

- (void)_setNeedsUpdate
{
  -[PXImageModulationManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateEnabled
{
  self->_needsUpdateFlags.enabled = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateEnabledIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.enabled)
  {
    self->_needsUpdateFlags.enabled = 0;
    if (-[PXImageModulationManager isMainScreen](self, "isMainScreen"))
    {
      -[PXImageModulationManager settings](self, "settings");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[PXImageModulationManager setEnabled:](self, "setEnabled:", objc_msgSend(v3, "isEnabled"));

    }
    else
    {
      -[PXImageModulationManager setEnabled:](self, "setEnabled:", 0);
    }
  }
}

- (void)_invalidateLowPowerModeEnabled
{
  self->_needsUpdateFlags.lowPowerModeEnabled = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLowPowerModeEnabledIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.lowPowerModeEnabled)
  {
    self->_needsUpdateFlags.lowPowerModeEnabled = 0;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXImageModulationManager setLowPowerModeEnabled:](self, "setLowPowerModeEnabled:", objc_msgSend(v3, "isLowPowerModeEnabled"));

  }
}

- (void)_invalidateActive
{
  self->_needsUpdateFlags.active = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateActiveIfNeeded
{
  _BOOL4 v3;
  uint64_t v4;
  int AppBooleanValue;
  BOOL v6;
  Boolean keyExistsAndHasValidFormat;

  if (self->_needsUpdateFlags.active)
  {
    self->_needsUpdateFlags.active = 0;
    v3 = -[PXImageModulationManager isEnabled](self, "isEnabled");
    v4 = 0;
    if (v3)
    {
      if (-[PXImageModulationManager isLowPowerModeEnabled](self, "isLowPowerModeEnabled", 0))
      {
        v4 = 0;
      }
      else
      {
        keyExistsAndHasValidFormat = 0;
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("shouldModulateImages"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
        if (keyExistsAndHasValidFormat)
          v6 = AppBooleanValue == 0;
        else
          v6 = 0;
        v4 = !v6;
      }
    }
    -[PXImageModulationManager setActive:](self, "setActive:", v4);
  }
}

- (void)_invalidateHDRFocus
{
  self->_needsUpdateFlags.HDRFocus = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateHDRFocusIfNeeded
{
  double v3;
  void *v4;
  double v5;

  if (self->_needsUpdateFlags.HDRFocus)
  {
    self->_needsUpdateFlags.HDRFocus = 0;
    v3 = 0.0;
    if (-[PXImageModulationManager isActive](self, "isActive"))
    {
      -[PXImageModulationManager rootViewController](self, "rootViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_effectiveHDRFocus");
      v3 = v5;

    }
    -[PXImageModulationManager setHDRFocus:](self, "setHDRFocus:", v3);
  }
}

- (void)_invalidateImageModulationIntensity
{
  self->_needsUpdateFlags.imageModulationIntensity = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateImageModulationIntensityIfNeeded
{
  void *v3;
  double v4;
  double v5;

  if (self->_needsUpdateFlags.imageModulationIntensity)
  {
    self->_needsUpdateFlags.imageModulationIntensity = 0;
    -[PXImageModulationManager rootViewController](self, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_effectiveImageModulationIntensity");
    v5 = v4;

    if (v5 != -1.79769313e308)
      -[PXImageModulationManager setImageModulationIntensity:](self, "setImageModulationIntensity:", v5);
  }
}

- (void)_invalidateRequestedEDRHeadroomFactor
{
  self->_needsUpdateFlags.requestedEDRHeadroomFactor = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateRequestedEDRHeadroomFactorIfNeeded
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  long double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_needsUpdateFlags.requestedEDRHeadroomFactor)
    return;
  self->_needsUpdateFlags.requestedEDRHeadroomFactor = 0;
  v3 = 0.0;
  if (-[PXImageModulationManager isEnabled](self, "isEnabled")
    && -[PXImageModulationManager isApplicationActive](self, "isApplicationActive"))
  {
    -[PXImageModulationManager settings](self, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "EDRHeadroomRequestScheme");
    if (v5 == 2)
    {
      -[PXImageModulationManager imageModulationIntensity](self, "imageModulationIntensity");
      if (v7 > 0.0)
        goto LABEL_11;
    }
    else
    {
      if (v5 != 1)
      {
        if (v5)
        {
LABEL_13:
          objc_msgSend(v4, "deviceMaximumEDRHeadroomStops");
          v3 = fmin(v3, v11);

          goto LABEL_14;
        }
        objc_msgSend(v4, "manualEDRHeadroomRequestStops");
LABEL_12:
        v3 = v6;
        goto LABEL_13;
      }
      -[PXImageModulationManager HDRFocus](self, "HDRFocus");
      v9 = v8;
      objc_msgSend(v4, "EDRHeadroomRequestHDRThreshold");
      if (v9 >= v10)
      {
LABEL_11:
        objc_msgSend(v4, "highEDRRequestedHeadroomStops");
        goto LABEL_12;
      }
    }
    objc_msgSend(v4, "lowEDRRequestedHeadroomStops");
    goto LABEL_12;
  }
LABEL_14:
  v12 = pow(2.0, v3);
  PLUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v17 = log2(v12);
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "[ImageModulation] unfiltered requestedEDRHeadroomFactor: %f", buf, 0xCu);
  }

  -[PXImageModulationManager requestedEDRHeadroomFactorFilter](self, "requestedEDRHeadroomFactorFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__PXImageModulationManager__updateRequestedEDRHeadroomFactorIfNeeded__block_invoke;
  v15[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
  *(long double *)&v15[4] = v12;
  objc_msgSend(v14, "performChanges:", v15);

}

- (void)_invalidateFinalRequestedEDRHeadroomFactor
{
  self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFinalRequestedEDRHeadroomFactorIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor)
  {
    self->_needsUpdateFlags.finalRequestedEDRHeadroomFactor = 0;
    -[PXImageModulationManager requestedEDRHeadroomFactorFilter](self, "requestedEDRHeadroomFactorFilter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "output");
    -[PXImageModulationManager setRequestedEDRHeadroomFactor:](self, "setRequestedEDRHeadroomFactor:");

  }
}

- (void)_invalidateDesiredDynamicRange
{
  self->_needsUpdateFlags.desiredDynamicRange = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateDesiredDynamicRangeIfNeeded
{
  _BOOL4 v3;
  double v4;
  float v5;
  void *v6;
  double v7;
  id v8;

  if (self->_needsUpdateFlags.desiredDynamicRange)
  {
    self->_needsUpdateFlags.desiredDynamicRange = 0;
    v3 = -[PXImageModulationManager enabledForTesting](self, "enabledForTesting");
    if (v3)
    {
      +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceMaximumEDRHeadroomStops");
    }
    else
    {
      -[PXImageModulationManager requestedEDRHeadroomFactor](self, "requestedEDRHeadroomFactor");
    }
    v5 = v4;
    -[PXImageModulationManager coreAnimationContext](self, "coreAnimationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = v5;
    objc_msgSend(v6, "setDesiredDynamicRange:", v7);

    if (v3)
  }
}

- (void)_invalidateImageLayerModulators
{
  self->_needsUpdateFlags.imageLayerModulators = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateImageLayerModulatorsIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.imageLayerModulators)
  {
    self->_needsUpdateFlags.imageLayerModulators = 0;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[PXImageModulationManager imageLayerModulators](self, "imageLayerModulators", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[PXImageModulationManager _updateImageLayerModulator:](self, "_updateImageLayerModulator:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)_invalidateCurrentScreenSupportsHDR
{
  self->_needsUpdateFlags.currentScreenSupportsHDR = 1;
  -[PXImageModulationManager _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateCurrentScreenSupportsHDRIfNeeded
{
  if (self->_needsUpdateFlags.currentScreenSupportsHDR)
    self->_needsUpdateFlags.currentScreenSupportsHDR = 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXRequestedEDRHeadroomFactorFilterObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImageModulationManager.m"), 854, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 2) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__PXImageModulationManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E51479C8;
    v12[4] = self;
    -[PXImageModulationManager performChanges:](self, "performChanges:", v12);
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXImageModulationManager *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PXImageModulationManager_settings_changedValueForKey___block_invoke;
  v7[3] = &unk_1E5144868;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PXImageModulationManager performChanges:](self, "performChanges:", v7);

}

- (void)preferencesDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PXImageModulationManager_preferencesDidChange__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXImageModulationManager performChanges:](self, "performChanges:", v2);
}

- (PXImageModulationSettings)settings
{
  return self->_settings;
}

- (NSHashTable)imageLayerModulators
{
  return self->_imageLayerModulators;
}

- (PXRequestedEDRHeadroomFactorFilter)requestedEDRHeadroomFactorFilter
{
  return self->_requestedEDRHeadroomFactorFilter;
}

- (int64_t)requestedEDRHeadroomSignpost
{
  return self->_requestedEDRHeadroomSignpost;
}

- (void)setRequestedEDRHeadroomSignpost:(int64_t)a3
{
  self->_requestedEDRHeadroomSignpost = a3;
}

- (CAContext)coreAnimationContext
{
  return self->_coreAnimationContext;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (BOOL)isApplicationActive
{
  return self->_applicationActive;
}

- (BOOL)enabledForTesting
{
  return self->_enabledForTesting;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (BOOL)isMainScreen
{
  return self->_mainScreen;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)currentScreenSupportsHDR
{
  return self->_currentScreenSupportsHDR;
}

- (double)HDRFocus
{
  return self->_HDRFocus;
}

- (double)imageModulationIntensity
{
  return self->_imageModulationIntensity;
}

- (double)requestedEDRHeadroomFactor
{
  return self->_requestedEDRHeadroomFactor;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_storeStrong((id *)&self->_coreAnimationContext, 0);
  objc_storeStrong((id *)&self->_requestedEDRHeadroomFactorFilter, 0);
  objc_storeStrong((id *)&self->_imageLayerModulators, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

uint64_t __48__PXImageModulationManager_preferencesDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateActive");
}

uint64_t __56__PXImageModulationManager_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("enabled")))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateEnabled");
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("EDRHeadroomRequestScheme")) & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "_invalidateRequestedEDRHeadroomFactor");
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("manualEDRHeadroomRequestStops")) & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "_invalidateRequestedEDRHeadroomFactor");
  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("EDRHeadroomRequestHDRThreshold"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_invalidateRequestedEDRHeadroomFactor");
  return result;
}

uint64_t __57__PXImageModulationManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFinalRequestedEDRHeadroomFactor");
}

uint64_t __69__PXImageModulationManager__updateRequestedEDRHeadroomFactorIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

uint64_t __60__PXImageModulationManager__processInfoPowerStateDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PXImageModulationManager__processInfoPowerStateDidChange___block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __60__PXImageModulationManager__processInfoPowerStateDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLowPowerModeEnabled");
}

uint64_t __56__PXImageModulationManager_setCurrentScreenSupportsHDR___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateActive");
}

uint64_t __49__PXImageModulationManager_setApplicationActive___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_updateCoreAnimationContext");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateRequestedEDRHeadroomFactor");
}

uint64_t __49__PXImageModulationManager_setNeedsEnabledUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateEnabled");
}

uint64_t __66__PXImageModulationManager_setNeedsImageModulationIntensityUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateImageModulationIntensity");
}

uint64_t __50__PXImageModulationManager_setNeedsHDRFocusUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateHDRFocus");
}

void __55__PXImageModulationManager__updateImageLayerModulator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setEnabled:", v3);
  objc_msgSend(v4, "setIntensity:", *(double *)(a1 + 32));

}

uint64_t __58__PXImageModulationManager_checkInLivePhotoViewModulator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prepareForReuse");
}

uint64_t __55__PXImageModulationManager_checkInImageLayerModulator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prepareForReuse");
}

uint64_t __44__PXImageModulationManager_enableForTesting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEnabledForTesting:", 1);
}

uint64_t __39__PXImageModulationManager_setEnabled___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateRequestedEDRHeadroomFactor");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateImageLayerModulators");
}

+ (double)HDRValueForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "_contentFormatForAsset:", v4);
  if ((unint64_t)(v5 - 1) >= 4)
  {
    v6 = 0.0;
    if (!v5)
    {
      +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "SDRModulationIntensity");
      v9 = v8;

      if (v9 > 0.0)
        v6 = 1.0;
      else
        v6 = 0.0;
    }
  }
  else
  {
    v6 = 1.0;
  }
  +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "useThresholdForVideos"))
  {
    v11 = objc_msgSend(v4, "mediaSubtypes");

    if ((*(_QWORD *)&v11 & 0x100000) != 0)
      v6 = 1.0;
  }
  else
  {

  }
  return v6;
}

+ ($5A0616AB7869379E861635CACF312FD6)optionsForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  $5A0616AB7869379E861635CACF312FD6 result;

  v4 = a3;
  v5 = objc_msgSend(a1, "_contentFormatForAsset:", v4);
  if ((unint64_t)(v5 - 1) > 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "_hdrGainForAsset:", v4);
    *(float *)&v6 = v6;
    v7 = LODWORD(v6);
  }

  v8 = v5;
  v9 = v7;
  result.var1 = *(float *)&v9;
  result.var0 = v8;
  return result;
}

+ (double)_hdrGainForAsset:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  float v7;

  v3 = a3;
  v4 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "hdrGain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "floatValue");
      v4 = v7;

    }
  }

  return v4;
}

+ (int64_t)_contentFormatForAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  float v8;
  BOOL v9;
  unint64_t v10;
  unsigned int v11;
  int v12;

  v3 = a3;
  +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "HDRConsideration");
  if (v5 == 2)
  {
    v11 = objc_msgSend(v3, "isFavorite");
LABEL_9:
    v10 = v11;
    goto LABEL_24;
  }
  if (v5 == 1)
  {
LABEL_7:
    v10 = 1;
    goto LABEL_24;
  }
  if (v5 || (objc_msgSend(v3, "playbackStyle") & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
LABEL_23:
    v10 = 0;
    goto LABEL_24;
  }
  v6 = objc_msgSend(v3, "mediaSubtypes");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "hdrGain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8 <= 0.0;

    if ((v6 & 2) != 0)
      goto LABEL_7;
  }
  else
  {
    v9 = 1;
    if ((v6 & 2) != 0)
      goto LABEL_7;
  }
  if ((v6 & 0x200) == 0)
  {
    if ((v6 >> 23) & 1 | v9)
    {
      v10 = (v6 & 0x800000) >> 21;
      goto LABEL_24;
    }
    v11 = objc_msgSend(v4, "gainBoostEnabled");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "gainMapEnabled"))
  {
    if ((v6 & 0x10) != 0)
    {
      if ((v6 & 8) != 0)
        v10 = 2;
      else
        v10 = 3;
    }
    else
    {
      v10 = 2;
    }
    goto LABEL_24;
  }
  v12 = objc_msgSend(v4, "toneMapEnabled");
  if (v12)
    v10 = 4;
  else
    v10 = 0;
  if (((v12 | v9) & 1) == 0)
  {
    objc_msgSend(v4, "gainBoostEnabled");
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

@end

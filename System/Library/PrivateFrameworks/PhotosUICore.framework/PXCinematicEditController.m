@implementation PXCinematicEditController

- (void)setAsset:(id)a3 editSource:(id)a4
{
  PHAsset *v7;
  id v8;
  void *v9;
  NSOrderedSet *v10;
  NSOrderedSet *focusEventTimes;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD block[4];
  PHAsset *v21;
  PXCinematicEditController *v22;
  id v23;
  id v24;
  BOOL v25;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v7 = (PHAsset *)a3;
  v8 = a4;
  if (self->_asset != v7)
  {
    -[PXCinematicEditController asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PXCinematicEditController setAsset:](self, "setAsset:", 0);
      -[PXCinematicEditController setEditSource:](self, "setEditSource:", 0);
      -[PXCinematicEditController setCinematographyScript:](self, "setCinematographyScript:", 0);
    }
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_editSource, a4);
    v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    focusEventTimes = self->_focusEventTimes;
    self->_focusEventTimes = v10;

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "videoURL");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[PXCinematicEditController cinematographyState](self, "cinematographyState");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          -[PXCinematicEditController delegate](self, "delegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "disableCinematicUIForLoadingAsset");

          v17 = objc_alloc_init(MEMORY[0x1E0D7F548]);
          -[PXCinematicEditController setCinematographyScript:](self, "setCinematographyScript:", v17);

          objc_initWeak(location, self);
          dispatch_get_global_queue(25, 0);
          v18 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __49__PXCinematicEditController_setAsset_editSource___block_invoke;
          block[3] = &unk_1E5144120;
          v21 = v7;
          v22 = self;
          v23 = v13;
          objc_copyWeak(&v24, location);
          v25 = v15;
          dispatch_async(v18, block);

          objc_destroyWeak(&v24);
          objc_destroyWeak(location);
        }
        else
        {
          PLPhotoEditGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v12;
            _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Couldn't create AVAsset for %@", (uint8_t *)location, 0xCu);
          }

        }
      }
      else
      {
        PLPhotoEditGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v8;
          _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Can't start cinematography for non-video edit source %@", (uint8_t *)location, 0xCu);
        }
      }

    }
  }

}

- (void)_updatePortraitVideoAdjustmentFromCinematography
{
  PTCinematographyScript *cinematographyScript;
  CMTime *v4;
  CMTimeEpoch epoch;
  void *v6;
  void *v7;
  char v8;
  PTCinematographyScript *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  PXCinematicEditController *v18;
  char v19;
  CMTimeRange v20;
  CMTime duration;
  CMTime start;
  CMTimeRange v23;

  cinematographyScript = self->_cinematographyScript;
  v4 = (CMTime *)MEMORY[0x1E0CA2E68];
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  v15 = *(_OWORD *)&duration.value;
  epoch = duration.epoch;
  CMTimeRangeMake(&v23, &start, &duration);
  -[PTCinematographyScript userDecisionsInTimeRange:](cinematographyScript, "userDecisionsInTimeRange:", &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCinematicEditController uneditedUserDecisions](self, "uneditedUserDecisions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToArray:", v7);

  v9 = self->_cinematographyScript;
  start = *v4;
  *(_OWORD *)&duration.value = v15;
  duration.epoch = epoch;
  CMTimeRangeMake(&v20, &start, &duration);
  -[PTCinematographyScript framesInTimeRange:](v9, "framesInTimeRange:", &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[PXCinematicEditController compositionController](self, "compositionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "adjustmentConstants");
    v12 = objc_claimAutoreleasedReturnValue();

    -[PXCinematicEditController compositionController](self, "compositionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject PIPortraitVideoAdjustmentKey](v12, "PIPortraitVideoAdjustmentKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__PXCinematicEditController__updatePortraitVideoAdjustmentFromCinematography__block_invoke;
    v16[3] = &unk_1E5142CB0;
    v19 = v8;
    v17 = v10;
    v18 = self;
    objc_msgSend(v13, "modifyAdjustmentWithKey:modificationBlock:", v14, v16);

  }
  else
  {
    PLPhotoEditGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(start.value) = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "ERROR: Cinematography returned no frames", (uint8_t *)&start, 2u);
    }
  }

}

- (void)updateFocusDecisionsAnimatedAtTime:(id *)a3
{
  px_dispatch_on_main_queue();
}

- (void)updateFocusDecisions
{
  __int128 v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0CA2E18];
  v3 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[PXCinematicEditController updateFocusDecisionsAnimatedAtTime:](self, "updateFocusDecisionsAnimatedAtTime:", &v2);
}

- (void)cinematographyWasEdited
{
  -[PXCinematicEditController _updatePortraitVideoAdjustmentFromCinematography](self, "_updatePortraitVideoAdjustmentFromCinematography");
  -[PXCinematicEditController updateFocusDecisions](self, "updateFocusDecisions");
}

- (void)cinematographyWasEditedAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  -[PXCinematicEditController _updatePortraitVideoAdjustmentFromCinematography](self, "_updatePortraitVideoAdjustmentFromCinematography");
  v5 = *a3;
  -[PXCinematicEditController updateFocusDecisionsAnimatedAtTime:](self, "updateFocusDecisionsAnimatedAtTime:", &v5);
}

- (void)setCinematicAdjustmentActive:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[16];

  -[PXCinematicEditController compositionController](self, "compositionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "adjustmentConstants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PIPortraitVideoAdjustmentKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__PXCinematicEditController_setCinematicAdjustmentActive___block_invoke;
    v9[3] = &__block_descriptor_33_e45_v16__0__PIPortraitVideoAdjustmentController_8l;
    v10 = a3;
    objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v7, v9);

  }
  else
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "_updatePortraitVideoAdjustmentFromCinematography: Could not get composition controller", buf, 2u);
    }

  }
}

- (BOOL)cinematicAdjustmentActive
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint8_t v8[16];

  -[PXCinematicEditController compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "portraitVideoAdjustmentController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enabled");

  }
  else
  {
    PLPhotoEditGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "_updatePortraitVideoAdjustmentFromCinematography: Could not get composition controller", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (double)cinematicAperture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[PXCinematicEditController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "portraitVideoAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aperture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(v4, "aperture"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "doubleValue"),
        v8 = v7,
        v6,
        v8 < 0.8))
  {
    -[PXCinematicEditController originalAperture](self, "originalAperture");
    v8 = v9;
  }

  return v8;
}

- (double)originalAperture
{
  float v2;

  -[PTCinematographyScript userAperture](self->_cinematographyScript, "userAperture");
  return v2;
}

- (int64_t)cinematicDebugMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXCinematicEditController compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "portraitVideoAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "debugMode");

  return v4;
}

- (void)setCinematicDebugMode:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[PXCinematicEditController compositionController](self, "compositionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustmentConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PIPortraitVideoAdjustmentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PXCinematicEditController_setCinematicDebugMode___block_invoke;
  v7[3] = &__block_descriptor_40_e45_v16__0__PIPortraitVideoAdjustmentController_8l;
  v7[4] = a3;
  objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", v5, v7);

}

- (void)removeFocusDecisionAtTime:(id *)a3
{
  PTCinematographyScript *cinematographyScript;
  NSObject *v6;
  PTCinematographyScript *v7;
  _QWORD v8[5];
  __int128 v9;
  int64_t var3;
  uint8_t buf[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  cinematographyScript = self->_cinematographyScript;
  if (cinematographyScript
    && (-[PTCinematographyScript timeRange](cinematographyScript, "timeRange"), (BYTE4(v16) & 1) != 0))
  {
    v7 = self->_cinematographyScript;
    *(_OWORD *)buf = v14;
    v12 = v15;
    v13 = v16;
    -[PTCinematographyScript userDecisionsInTimeRange:](v7, "userDecisionsInTimeRange:", buf);
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PXCinematicEditController_removeFocusDecisionAtTime___block_invoke;
    v8[3] = &unk_1E5142D68;
    v9 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v8[4] = self;
    -[NSObject enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);
  }
  else
  {
    PLPhotoEditGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Cinematography script time range invalid", buf, 2u);
    }
  }

}

- (void)setCinematicAperture:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  -[PXCinematicEditController compositionController](self, "compositionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustmentConstants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PIPortraitVideoAdjustmentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PXCinematicEditController_setCinematicAperture___block_invoke;
  v8[3] = &unk_1E5142D90;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  objc_msgSend(v7, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

}

- (id)compositionController
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  -[PXCinematicEditController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "PXCinematicEditController: Could not get composition controller", v7, 2u);
    }

  }
  return v3;
}

- (double)minimumCinematicAperture
{
  return 2.0;
}

- (double)maximumCinematicAperture
{
  return 16.0;
}

- (void)resetToAsShotState
{
  -[PXCinematicEditController resetToCinematographyState:](self, "resetToCinematographyState:", 0);
}

- (void)toggleAutoFocusState
{
  void *v3;
  void *v4;
  id v5;

  if (-[PXCinematicEditController isInAutoFocusState](self, "isInAutoFocusState"))
  {
    -[PXCinematicEditController savedManualFocusCinematographyState](self, "savedManualFocusCinematographyState");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCinematicEditController resetToCinematographyState:](self, "resetToCinematographyState:", v5);

  }
  else
  {
    -[PXCinematicEditController cinematographyState](self, "cinematographyState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCinematicEditController setSavedManualFocusCinematographyState:](self, "setSavedManualFocusCinematographyState:", v3);

    -[PXCinematicEditController cinematographyScript](self, "cinematographyScript");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllUserDecisions");

    -[PXCinematicEditController cinematographyWasEdited](self, "cinematographyWasEdited");
  }
}

- (BOOL)isInAutoFocusState
{
  void *v2;
  void *v3;
  CMTime v5;
  CMTime start;
  CMTimeRange v7;

  -[PXCinematicEditController cinematographyScript](self, "cinematographyScript");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  CMTimeRangeMake(&v7, &start, &v5);
  objc_msgSend(v2, "userDecisionsInTimeRange:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "count") == 0;
  return (char)v2;
}

- (BOOL)canToggleBackToUserFocusState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;

  -[PXCinematicEditController savedManualFocusCinematographyState](self, "savedManualFocusCinematographyState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("user_decisions"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  if (-[PXCinematicEditController isInAutoFocusState](self, "isInAutoFocusState"))
  {
    if (objc_msgSend(v7, "count"))
    {
      v8 = 1;
    }
    else
    {
      -[PXCinematicEditController uneditedUserDecisions](self, "uneditedUserDecisions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "count") != 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cinematographyState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXCinematicEditController compositionController](self, "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "portraitVideoAdjustmentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cinematographyState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)resetToCinematographyState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXCinematicEditController cinematographyScript](self, "cinematographyScript");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadWithChangesDictionary:", v4);

  -[PXCinematicEditController cinematographyWasEdited](self, "cinematographyWasEdited");
}

- (id)axDescriptionForFocusDecisionAtTime:(id *)a3
{
  PTCinematographyScript *cinematographyScript;
  PTCinematographyScript *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  __int128 v11;
  int64_t var3;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  __CFString *v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__270872;
  v21 = __Block_byref_object_dispose__270873;
  v22 = &stru_1E5149688;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  cinematographyScript = self->_cinematographyScript;
  if (cinematographyScript)
  {
    -[PTCinematographyScript timeRange](cinematographyScript, "timeRange");
    if ((BYTE4(v16) & 1) != 0)
    {
      v6 = self->_cinematographyScript;
      v13[0] = v14;
      v13[1] = v15;
      v13[2] = v16;
      -[PTCinematographyScript userDecisionsInTimeRange:](v6, "userDecisionsInTimeRange:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __65__PXCinematicEditController_axDescriptionForFocusDecisionAtTime___block_invoke;
      v10[3] = &unk_1E5142DB8;
      v11 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v10[4] = self;
      v10[5] = &v17;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    }
  }
  v8 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v8;
}

- (PXCinematicEditControllerDelegate)delegate
{
  return (PXCinematicEditControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PTCinematographyScriptChanges)scriptChangesDelegate
{
  return (PTCinematographyScriptChanges *)objc_loadWeakRetained((id *)&self->_scriptChangesDelegate);
}

- (void)setScriptChangesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scriptChangesDelegate, a3);
}

- (PXFocusTimelineController)focusTimelineDelegate
{
  return (PXFocusTimelineController *)objc_loadWeakRetained((id *)&self->_focusTimelineDelegate);
}

- (void)setFocusTimelineDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusTimelineDelegate, a3);
}

- (PTCinematographyScript)cinematographyScript
{
  return self->_cinematographyScript;
}

- (void)setCinematographyScript:(id)a3
{
  objc_storeStrong((id *)&self->_cinematographyScript, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PLVideoEditSource)editSource
{
  return self->_editSource;
}

- (void)setEditSource:(id)a3
{
  objc_storeStrong((id *)&self->_editSource, a3);
}

- (double)metadataAperture
{
  return self->_metadataAperture;
}

- (void)setMetadataAperture:(double)a3
{
  self->_metadataAperture = a3;
}

- (NSDictionary)savedManualFocusCinematographyState
{
  return self->_savedManualFocusCinematographyState;
}

- (void)setSavedManualFocusCinematographyState:(id)a3
{
  objc_storeStrong((id *)&self->_savedManualFocusCinematographyState, a3);
}

- (NSArray)uneditedUserDecisions
{
  return self->_uneditedUserDecisions;
}

- (void)setUneditedUserDecisions:(id)a3
{
  objc_storeStrong((id *)&self->_uneditedUserDecisions, a3);
}

- (NSOrderedSet)focusEventTimes
{
  return self->_focusEventTimes;
}

- (void)setFocusEventTimes:(id)a3
{
  objc_storeStrong((id *)&self->_focusEventTimes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusEventTimes, 0);
  objc_storeStrong((id *)&self->_uneditedUserDecisions, 0);
  objc_storeStrong((id *)&self->_savedManualFocusCinematographyState, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_cinematographyScript, 0);
  objc_destroyWeak((id *)&self->_focusTimelineDelegate);
  objc_destroyWeak((id *)&self->_scriptChangesDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __65__PXCinematicEditController_axDescriptionForFocusDecisionAtTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[24];
  CMTime time2;
  CMTime time1;
  CMTime v15;

  v3 = a2;
  v4 = v3;
  memset(&v15, 0, sizeof(v15));
  if (v3)
  {
    objc_msgSend(v3, "time");
    if ((v15.flags & 1) != 0)
    {
      time1 = v15;
      time2 = *(CMTime *)(a1 + 48);
      if (!CMTimeCompare(&time1, &time2))
      {
        v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(v4, "time");
        objc_msgSend(v5, "frameNearestTime:", v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          objc_msgSend(v6, "focusDetection");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D7F530], "accessibilityLabelForDetectionType:", objc_msgSend(v8, "detectionType"));
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

        }
      }
    }
  }

}

void __50__PXCinematicEditController_setCinematicAperture___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "originalAperture");
  if (vabdd_f64(v3, *(double *)(a1 + 40)) <= 0.1)
  {
    objc_msgSend(v5, "setAperture:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAperture:", v4);

  }
}

void __55__PXCinematicEditController_removeFocusDecisionAtTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  CMTime v13;
  CMTime time1;
  CMTime v15;

  v3 = a2;
  v4 = v3;
  memset(&v15, 0, sizeof(v15));
  if (v3)
  {
    objc_msgSend(v3, "time");
    if ((v15.flags & 1) != 0)
    {
      time1 = v15;
      v13 = *(CMTime *)(a1 + 40);
      if (!CMTimeCompare(&time1, &v13))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_opt_respondsToSelector();

        v7 = *(id **)(a1 + 32);
        if ((v6 & 1) != 0)
        {
          objc_msgSend(v7, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeUserDecision:", v4);

        }
        else
        {
          objc_msgSend(v7[4], "removeUserDecision:", v4);
        }
        objc_msgSend(*(id *)(a1 + 32), "cinematographyWasEdited");
        objc_msgSend(*(id *)(a1 + 32), "cinematographyState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setSavedManualFocusCinematographyState:", v9);

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "didRemoveUserDecision");

        }
      }
    }
  }

}

uint64_t __51__PXCinematicEditController_setCinematicDebugMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDebugMode:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__PXCinematicEditController_setCinematicAdjustmentActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", *(unsigned __int8 *)(a1 + 32));
}

void __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, NSObject *);
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  objc_msgSend(*(id *)(a1 + 32), "focusTimelineDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetTimeline");

  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v3 && (objc_msgSend(v3, "timeRange"), (BYTE4(v31) & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "focusTimelineDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = v29;
    v27 = v30;
    v28 = v31;
    objc_msgSend(v5, "updateFocusTimelineWithTimeRange:", buf);

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    *(_OWORD *)buf = v29;
    v27 = v30;
    v28 = v31;
    objc_msgSend(v6, "decisionsInTimeRange:", buf);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_2;
    v20 = &unk_1E5142D00;
    v24 = *(_OWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v21 = v7;
    v22 = v9;
    v10 = v8;
    v23 = v10;
    v4 = v7;
    -[NSObject enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", &v17);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 80);
    *(_QWORD *)(v11 + 80) = v10;
    v13 = v10;

    objc_msgSend(*(id *)(a1 + 32), "focusTimelineDelegate", v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateFocusTimeline");

    objc_msgSend(*(id *)(a1 + 32), "focusTimelineDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didUpdateFocusEventsWithTimes:", v16);

  }
  else
  {
    PLPhotoEditGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Cinematography script time range invalid", buf, 2u);
    }
  }

}

void __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_2(uint64_t a1, void *a2, NSObject *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  _OWORD *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  CMTime v18;
  CMTime buf;
  char v20;
  CMTime v21;
  CMTime time2;
  CMTime v23;

  v5 = a2;
  v6 = v5;
  memset(&v23, 0, sizeof(v23));
  if (!v5 || (objc_msgSend(v5, "time"), (v23.flags & 1) == 0))
  {
    PLPhotoEditGetLog();
    a3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1A6789000, a3, OS_LOG_TYPE_ERROR, "Cinematography decision time invalid", (uint8_t *)&buf, 2u);
    }
    goto LABEL_23;
  }
  v7 = objc_msgSend(v6, "isUserDecision");
  v8 = objc_msgSend(v6, "groupIdentifier");
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", (char *)&a3[-1].isa + 7);
    a3 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("disableTimelineAnimations"));

  if ((v10 & 1) != 0)
  {
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v11 = (_OWORD *)(a1 + 56);
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    *(_OWORD *)&buf.value = *v11;
    buf.epoch = *(_QWORD *)(a1 + 72);
    time2 = v23;
    v12 = CMTimeCompare(&buf, &time2) == 0;
    if (!a3)
      goto LABEL_17;
LABEL_12:
    if (v12)
      goto LABEL_17;
    -[NSObject time](a3, "time");
    *(_OWORD *)&buf.value = *v11;
    buf.epoch = *(_QWORD *)(a1 + 72);
    if (!CMTimeCompare(&buf, &v21) && objc_msgSend(v6, "isUserDecision"))
    {
      buf.value = 0;
      *(_QWORD *)&buf.timescale = &buf;
      buf.epoch = 0x2020000000;
      v20 = 0;
      v13 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_3;
      v17[3] = &unk_1E5142CD8;
      v18 = v23;
      v17[4] = &buf;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
      v12 = *(_BYTE *)(*(_QWORD *)&buf.timescale + 24) == 0;
      _Block_object_dispose(&buf, 8);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v12 = 0;
  if (a3)
    goto LABEL_12;
LABEL_17:
  if (!PTGroupIDIsValid()
    || !a3
    || (_DWORD)v7 && !-[NSObject isUserDecision](a3, "isUserDecision")
    || v8 != -[NSObject groupIdentifier](a3, "groupIdentifier"))
  {
    objc_msgSend(*(id *)(a1 + 40), "focusTimelineDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v23;
    objc_msgSend(v14, "updateFocusTimelineWithEvent:userInitiated:shouldAnimate:", &buf, v7, v12);

    v15 = *(void **)(a1 + 48);
    buf = v23;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &buf);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
LABEL_23:

}

void __64__PXCinematicEditController_updateFocusDecisionsAnimatedAtTime___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  CMTime v8;
  CMTime time1;

  v6 = a2;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "CMTimeValue");
  else
    memset(&time1, 0, sizeof(time1));
  v8 = *(CMTime *)(a1 + 40);
  if (!CMTimeCompare(&time1, &v8))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __77__PXCinematicEditController__updatePortraitVideoAdjustmentFromCinematography__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  float v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "setDisparityKeyframes:", 0);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = objc_alloc(MEMORY[0x1E0D71278]);
          if (v11)
            objc_msgSend(v11, "time");
          else
            memset(v16, 0, sizeof(v16));
          objc_msgSend(v11, "focusDistance");
          v14 = (void *)objc_msgSend(v12, "initWithTime:value:", v16, v13);
          objc_msgSend(v5, "addObject:", v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setDisparityKeyframes:", v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "changesDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count") || *(_BYTE *)(a1 + 48))
  {

    v15 = 0;
  }
  objc_msgSend(v4, "setCinematographyState:", v15);

}

void __49__PXCinematicEditController_setAsset_editSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLPhotoEditGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_INFO, "Cinematography script load asset: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cinematographyScript");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "cinematographyState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PXCinematicEditController_setAsset_editSource___block_invoke_23;
  v10[3] = &unk_1E5142C88;
  v8 = v4;
  v11 = v8;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v14 = *(_BYTE *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 40);
  v9 = (id)objc_msgSend(v5, "loadWithAsset:changesDictionary:completion:", v6, v7, v10);

  objc_destroyWeak(&v13);
}

void __49__PXCinematicEditController_setAsset_editSource___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  char v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "Cinematography script load completed with duration: %@", buf, 0xCu);
  }

  objc_copyWeak(&v11, (id *)(a1 + 48));
  v12 = a2;
  v13 = *(_BYTE *)(a1 + 56);
  v10 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v11);
}

void __49__PXCinematicEditController_setAsset_editSource___block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CMTimeValue v11;
  CMTimeRange v12;
  CMTime duration;
  CMTimeRange v14;
  CMTime start;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "cinematographyScript");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (isAppleInternal_onceToken_270914 != -1)
      dispatch_once(&isAppleInternal_onceToken_270914, &__block_literal_global_270915);
    if (isAppleInternal_hasInternalDiagnostics_270916)
    {
      PLPhotoEditGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
        CMTimeRangeMake(&v14, &start, &duration);
        objc_msgSend(v4, "framesInTimeRange:", &v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(start.value) = 138412290;
        *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v6;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "Cinematography script allFrames:%@", (uint8_t *)&start, 0xCu);

      }
    }
    if (*(_BYTE *)(a1 + 57))
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
      CMTimeRangeMake(&v12, &start, &duration);
      objc_msgSend(v7, "userDecisionsInTimeRange:", &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUneditedUserDecisions:", v8);

    }
    objc_msgSend(v3, "_updatePortraitVideoAdjustmentFromCinematography");
    objc_msgSend(v3, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cineScriptBecameAvailable:", v4);

  }
  else
  {
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      LODWORD(start.value) = 138412290;
      *(CMTimeValue *)((char *)&start.value + 4) = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Cinematography script failed to load asset: %@", (uint8_t *)&start, 0xCu);
    }

    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cineScriptCouldNotInitializeWithError:", *(_QWORD *)(a1 + 40));
  }

}

@end

@implementation PEPasteablePreset

+ (BOOL)hasValidAdjustmentsInCompositionController:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  char v6;

  v3 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend((id)objc_opt_class(), "sanitizeCompositionController:", v3);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "slomoAdjustmentController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(MEMORY[0x24BE71F80], "isIdentityCompositionController:", v3) ^ 1 | v5;

  return v6;
}

+ (void)sanitizeCompositionController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  _QWORD v56[10];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v61.receiver = a1;
  v61.super_class = (Class)&OBJC_METACLASS___PEPasteablePreset;
  objc_msgSendSuper2(&v61, sel_sanitizeCompositionController_, v4);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v4, "adjustmentKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v58 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v4, "adjustmentControllerForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "canBeEnabled") && (objc_msgSend(v11, "enabled") & 1) == 0)
          objc_msgSend(v4, "removeAdjustmentWithKey:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "cinematicAudioAdjustmentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "renderingStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)*MEMORY[0x24BE71D88];

    if (v14 == v15)
      objc_msgSend(v4, "removeAdjustmentWithKey:", *MEMORY[0x24BE71D70]);
  }
  v50 = v13;
  objc_msgSend(v4, "cropAdjustmentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (uint64_t *)MEMORY[0x24BE71DA0];
  if (v16)
  {
    objc_msgSend(v4, "orientationAdjustmentController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orientation");

    objc_msgSend(v16, "cropRect");
    NUOrientationTransformSize();
    v20 = v19;
    v22 = v21;
    v23 = objc_msgSend(v16, "constraintWidth");
    if ((objc_msgSend(v16, "constraintHeight") | v23) < 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

    }
    v24 = NUOrientationTransformImageSize();
    v25 = *v17;
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __51__PEPasteablePreset_sanitizeCompositionController___block_invoke;
    v56[3] = &__block_descriptor_80_e36_v16__0__PICropAdjustmentController_8l;
    v56[4] = 0;
    v56[5] = 0;
    v56[6] = v20;
    v56[7] = v22;
    v56[8] = v24;
    v56[9] = v26;
    objc_msgSend(v4, "modifyAdjustmentWithKey:modificationBlock:", v25, v56);
  }
  v27 = objc_msgSend(v4, "userOrientation");
  if (v27 == 1 || (v28 = v27, !NUOrientationIsValid()))
  {
    v29 = *MEMORY[0x24BE71E18];
    objc_msgSend(v4, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E18]);
  }
  else
  {
    v29 = *MEMORY[0x24BE71E18];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __51__PEPasteablePreset_sanitizeCompositionController___block_invoke_2;
    v55[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
    v55[4] = v28;
    objc_msgSend(v4, "modifyAdjustmentWithKey:modificationBlock:", v29, v55);
  }
  objc_msgSend(MEMORY[0x24BE71CC8], "adjustmentConstants");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(MEMORY[0x24BE71CC8], "geometryBasedAdjustmentIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v52;
    v35 = *v17;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(v31);
        v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        if ((objc_msgSend(v37, "isEqualToString:", v35) & 1) == 0
          && (objc_msgSend(v37, "isEqualToString:", v29) & 1) == 0)
        {
          objc_msgSend(v4, "removeAdjustmentWithKey:", v37);
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v33);
  }

  objc_msgSend(v30, "PILivePhotoKeyFrameAdjustmentKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v38);

  objc_msgSend(v30, "PIAutoLoopAdjustmentKey");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v39);

  objc_msgSend(v30, "PIVideoCrossfadeLoopAdjustmentKey");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v40);

  objc_msgSend(v30, "PIVideoPosterFrameAdjustmentKey");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v41);

  objc_msgSend(v30, "PIMuteAdjustmentKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v42);

  objc_msgSend(v30, "PITrimAdjustmentKey");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v43);

  objc_msgSend(v30, "PIVideoStabilizeAdjustmentKey");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v44);

  objc_msgSend(v30, "PINoiseReductionAdjustmentKey");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v45);

  objc_msgSend(v30, "PIRawAdjustmentKey");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v46);

  objc_msgSend(v30, "PIRawNoiseReductionAdjustmentKey");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAdjustmentWithKey:", v47);

}

void __51__PEPasteablePreset_sanitizeCompositionController___block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  objc_msgSend(v7, "setConstraintWidth:", *((_QWORD *)a1 + 8));
  objc_msgSend(v7, "setConstraintHeight:", *((_QWORD *)a1 + 9));

}

uint64_t __51__PEPasteablePreset_sanitizeCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientation:", *(_QWORD *)(a1 + 32));
}

- (PEPasteablePreset)initWithCompositionController:(id)a3 asset:(id)a4 isSmart:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PEPasteablePreset *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v5 = a5;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = CFSTR("PEAdjustmentPresetSmartKey");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PEAdjustmentPreset initWithCompositionController:asset:additionalSerializationEntries:](self, "initWithCompositionController:asset:additionalSerializationEntries:", v10, v9, v12);

  return v13;
}

- (id)resourceManager
{
  PEResourceManager *resourceManager;
  PEResourceManager *v4;
  PEResourceManager *v5;

  resourceManager = self->_resourceManager;
  if (!resourceManager)
  {
    v4 = objc_alloc_init(PEResourceManager);
    v5 = self->_resourceManager;
    self->_resourceManager = v4;

    resourceManager = self->_resourceManager;
  }
  return resourceManager;
}

- (int64_t)actionType
{
  return 2;
}

- (id)sourceAssetUUID
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  -[PEAdjustmentPreset serializedDictionary](self, "serializedDictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[PEAdjustmentPreset serializedDictionary](self, "serializedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("PEAdjustmentsPresetSourceAssetUUIDKey"));

  if (v7)
  {
    -[PEAdjustmentPreset serializedDictionary](self, "serializedDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PEAdjustmentsPresetSourceAssetUUIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v9 = 0;
  }
  return v9;
}

- (BOOL)isEligibleForAsyncProcessingOnAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  BOOL v17;
  __int16 v19;
  __int16 v20;

  v4 = a3;
  -[PEPasteablePreset resourceManager](self, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compositionControllerWithoutSource:originalComposition:editorBundleID:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PEAdjustmentPreset composition](self, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "pixelWidth");
  if ((double)(unint64_t)(objc_msgSend(v4, "pixelHeight") * v9) / 1000000.0 > 20.0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
      if (objc_msgSend(v10, "isPhoto")
        && (objc_msgSend(v10, "mediaSubtypes") & 0x10) != 0
        && (v7 && (objc_msgSend(MEMORY[0x24BE71CC8], "compositionHasAnyStageEffect:", v7) & 1) != 0
         || v8 && objc_msgSend(MEMORY[0x24BE71CC8], "compositionHasAnyStageEffect:", v8)))
      {
        PLPhotoEditGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          goto LABEL_15;
        v20 = 0;
        v15 = "PEPasteablePreset isEligibleForAsyncProcessingOnAsset=NO: Composition has a stage effect that will be rend"
              "ered on the 24MP portrait target asset.";
        v16 = (uint8_t *)&v20;
        goto LABEL_14;
      }

    }
  }
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE71C40]), "initWithComposition:", v7);
  +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "synchronousStylesCopyPaste"))
    goto LABEL_16;
  if (v10)
  {
    objc_msgSend(v10, "semanticStyleAdjustmentController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

      goto LABEL_12;
    }
  }
  if (!v6)
  {
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v6, "semanticStyleAdjustmentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_17:
    v17 = 1;
    goto LABEL_18;
  }
LABEL_12:
  PLPhotoEditGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v19 = 0;
    v15 = "PEPasteablePreset isEligibleForAsyncProcessingOnAsset=NO: Destination composition has a Style.";
    v16 = (uint8_t *)&v19;
LABEL_14:
    _os_log_impl(&dword_20D13D000, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
  }
LABEL_15:

  v17 = 0;
LABEL_18:

  return v17;
}

- (BOOL)isEligibleForSmartPasteWithPhotoLibrary:(id)a3
{
  return -[PEPasteablePreset isEligibleForSmartPasteWithPhotoLibrary:fallbackPayload:](self, "isEligibleForSmartPasteWithPhotoLibrary:fallbackPayload:", a3, 0);
}

- (BOOL)isEligibleForSmartPasteWithPhotoLibrary:(id)a3 fallbackPayload:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v23[16];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[PEPasteablePreset _isSmart](self, "_isSmart"))
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_INFO, "PEPasteablePreset isEligibleForSmartPaste=NO: Not a smart preset.", v23, 2u);
    }

    goto LABEL_11;
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (-[PEAdjustmentPreset isAutoEnhanceEnabled](self, "isAutoEnhanceEnabled"))
    {
      PLPhotoEditGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_INFO, "PEPasteablePreset isEligibleForSmartPaste=NO: AutoEnhance is applied to the source asset.", v23, 2u);
      }

      if (a4)
      {
        v8 = 2;
LABEL_16:
        +[PESCAPReviewPayload legacyPayloadWithReason:](PESCAPReviewPayload, "legacyPayloadWithReason:", v8);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      goto LABEL_11;
    }
    -[PEPasteablePreset sourceAssetUUID](self, "sourceAssetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFetchLimit:", 1);
    if (!v12 || objc_msgSend(v12, "isEqualToString:", &stru_24C619BD0))
    {
      PLPhotoEditGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_20D13D000, v14, OS_LOG_TYPE_ERROR, "PEPasteablePreset isEligibleForSmartPaste=NO: sourceAssetUUID is invalid.", v23, 2u);
      }

      if (a4)
      {
        +[PESCAPReviewPayload legacyPayloadWithReason:](PESCAPReviewPayload, "legacyPayloadWithReason:", 3);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_38;
    }
    v15 = (void *)MEMORY[0x24BDE3488];
    v24[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchAssetsWithLocalIdentifiers:options:", v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (+[PESmartPasteablePreset isAssetTypeEligibleForSmartPaste:](PESmartPasteablePreset, "isAssetTypeEligibleForSmartPaste:", v18))
      {
        v10 = 1;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      PLPhotoEditGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_20D13D000, v21, OS_LOG_TYPE_INFO, "PEPasteablePreset isEligibleForSmartPaste=NO: Source asset is a video.", v23, 2u);
      }

      if (a4)
      {
        v20 = 4;
        goto LABEL_35;
      }
    }
    else
    {
      PLPhotoEditGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_20D13D000, v19, OS_LOG_TYPE_INFO, "PEPasteablePreset isEligibleForSmartPaste=NO: Couldn't fetch the source asset.", v23, 2u);
      }

      if (a4)
      {
        v20 = 3;
LABEL_35:
        +[PESCAPReviewPayload legacyPayloadWithReason:](PESCAPReviewPayload, "legacyPayloadWithReason:", v20);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
    }
    v10 = 0;
    goto LABEL_37;
  }
  PLPhotoEditGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_20D13D000, v11, OS_LOG_TYPE_INFO, "PEPasteablePreset isEligibleForSmartPaste=NO: SmartCopyPaste FF is off.", v23, 2u);
  }

  if (a4)
  {
    v8 = 1;
    goto LABEL_16;
  }
LABEL_11:
  v10 = 0;
LABEL_39:

  return v10;
}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 invalidAdjustmentKeys:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  void *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  NSObject *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  double v90;
  float v91;
  void *v92;
  void *v93;
  float v94;
  float v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  float v99;
  uint64_t v100;
  uint64_t k;
  void *v102;
  float v103;
  float v104;
  id v105;
  int v106;
  float v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  uint64_t v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  uint64_t v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  uint64_t v137;
  _QWORD *v138;
  id v139;
  id v140;
  id v141;
  void (**v142)(_QWORD);
  void *v143;
  void *v144;
  void *v145;
  _BOOL8 v146;
  void *v147;
  double v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  id v157;
  id v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  id obj;
  _QWORD v164[4];
  void (**v165)(_QWORD);
  _QWORD v166[4];
  void (**v167)(_QWORD);
  _QWORD aBlock[4];
  id v169;
  id v170;
  id v171;
  _QWORD v172[5];
  _QWORD v173[5];
  _QWORD v174[4];
  id v175;
  _QWORD v176[4];
  id v177;
  _QWORD v178[4];
  id v179;
  id v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _QWORD v185[10];
  id v186;
  _QWORD v187[12];
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  uint64_t v192;
  uint64_t v193;
  BOOL (*v194)(uint64_t, uint64_t);
  void *v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t (*v199)(uint64_t, uint64_t);
  void *v200;
  id v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _BYTE v206[128];
  _BYTE v207[128];
  _QWORD v208[4];
  uint8_t v209[128];
  uint8_t buf[4];
  double v211;
  __int16 v212;
  double v213;
  __int16 v214;
  uint64_t v215;
  uint64_t v216;
  CGRect v217;
  CGRect v218;

  v216 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v157 = a4;
  v158 = a5;
  v13 = a6;
  v154 = a7;
  -[PEAdjustmentPreset composition](self, "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE71C40]), "initWithComposition:", v14);
  v156 = v14;
  objc_msgSend(v14, "contents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v162 = v12;
  v19 = (void *)objc_msgSend(v12, "copy");
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v205 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v202, v209, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v203;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v203 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v18, "removeObject:", *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * i));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v202, v209, 16);
    }
    while (v22);
  }
  v161 = (void *)v15;

  v151 = *MEMORY[0x24BE71DA0];
  objc_msgSend(v18, "removeObject:");
  v150 = *MEMORY[0x24BE71F10];
  objc_msgSend(v18, "removeObject:");
  v25 = *MEMORY[0x24BE71E18];
  objc_msgSend(v18, "removeObject:", *MEMORY[0x24BE71E18]);
  v26 = *MEMORY[0x24BE71E78];
  objc_msgSend(v19, "adjustmentControllerForKey:", *MEMORY[0x24BE71E78]);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BE71DE8];
  v29 = (uint64_t *)MEMORY[0x24BE71DE0];
  v155 = v20;
  if (!v27)
  {
    v31 = *MEMORY[0x24BE71DE0];
    goto LABEL_14;
  }
  v30 = (void *)v27;
  if ((objc_msgSend(v18, "containsObject:", v28) & 1) != 0)
  {

    v31 = *v29;
  }
  else
  {
    v31 = *v29;
    v32 = objc_msgSend(v18, "containsObject:", *v29);

    if ((v32 & 1) == 0)
      goto LABEL_14;
  }
  objc_msgSend(v18, "removeObject:", v31);
  objc_msgSend(v18, "removeObject:", v28);
LABEL_14:
  v208[0] = v28;
  v208[1] = v31;
  v208[2] = *MEMORY[0x24BE71E20];
  v208[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v208, 4);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v197 = MEMORY[0x24BDAC760];
  v198 = 3221225472;
  v199 = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke;
  v200 = &unk_24C618240;
  v35 = v18;
  v201 = v35;
  PFFind();
  v153 = (void *)v33;
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  if (v160)
  {
    v192 = v34;
    v193 = 3221225472;
    v194 = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2;
    v195 = &unk_24C618240;
    v196 = v19;
    PFFind();
    v159 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "removeAdjustmentWithKey:");

  }
  else
  {
    v159 = 0;
  }
  objc_msgSend(v162, "composition");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "mediaType");

  v190 = 0u;
  v191 = 0u;
  v188 = 0u;
  v189 = 0u;
  obj = v35;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v207, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v189;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v189 != v41)
          objc_enumerationMutation(obj);
        v43 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * j);
        v187[5] = v34;
        v187[6] = 3221225472;
        v187[7] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3;
        v187[8] = &unk_24C618268;
        v187[9] = self;
        v187[10] = v43;
        v187[11] = v38;
        objc_msgSend(v19, "modifyAdjustmentWithKey:modificationBlock:");
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v207, 16);
    }
    while (v40);
  }

  objc_msgSend(v161, "orientationAdjustmentController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "orientation");

  if (v45 != 1 && NUOrientationIsValid())
  {
    objc_msgSend(v19, "imageOrientation");
    v187[0] = v34;
    v187[1] = 3221225472;
    v187[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4;
    v187[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
    v187[4] = NUOrientationConcat();
    objc_msgSend(v19, "modifyAdjustmentWithKey:modificationBlock:", v25, v187);
  }
  objc_msgSend(v161, "cropAdjustmentController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = objc_alloc(MEMORY[0x24BE6C398]);
    objc_msgSend(v19, "composition");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v47, "initWithComposition:", v48);

    v186 = 0;
    objc_msgSend(v49, "submitSynchronous:", &v186);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v186;
    objc_msgSend(v50, "geometry");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v52, "extent");
      NUPixelRectToCGRect();
      v148 = v55;
      v57 = v56;
      v58 = v53;
      v59 = v54;
      if (v53 == 0.0 || v54 == 0.0 || v53 == *MEMORY[0x24BE71BF0] && v54 == *(double *)(MEMORY[0x24BE71BF0] + 8))
      {
        v60 = 1.0;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218496;
          v211 = v58;
          v212 = 2048;
          v213 = v59;
          v214 = 2048;
          v215 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_20D13D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      else
      {
        v60 = fabs(v53 / v54);
      }
      objc_msgSend(v46, "cropRect");
      v64 = v62;
      v65 = v63;
      if (v62 == 0.0 || v63 == 0.0 || v62 == *MEMORY[0x24BE71BF0] && v63 == *(double *)(MEMORY[0x24BE71BF0] + 8))
      {
        v66 = 1.0;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218496;
          v211 = v64;
          v212 = 2048;
          v213 = v65;
          v214 = 2048;
          v215 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_20D13D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      else
      {
        v66 = fabs(v62 / v63);
      }
      if (vabdd_f64(v66, v60) > 0.00000999999975)
      {
        v67 = v57 + v59 * 0.5;
        PFSizeWithAspectRatioFittingSize();
        v69 = v68;
        v71 = v70;
        v72 = v148 + v58 * 0.5 + v68 * -0.5;
        v73 = v67 + v70 * -0.5;
        objc_msgSend(v52, "orientation");
        NUOrientationInverse();
        if (NUOrientationIsValid())
        {
          NUPixelSizeFromCGSize();
          NUOrientationTransformRect();
          v72 = v74;
          v73 = v75;
          v69 = v76;
          v71 = v77;
        }
        objc_msgSend(v19, "cropAdjustmentController");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "cropRect");
        v80 = v79;
        v82 = v81;

        v217.origin.x = v72;
        v217.origin.y = v73;
        v217.size.width = v69;
        v217.size.height = v71;
        v218 = CGRectOffset(v217, v80, v82);
        x = v218.origin.x;
        y = v218.origin.y;
        width = v218.size.width;
        height = v218.size.height;
        v87 = objc_msgSend(v46, "constraintWidth");
        if ((objc_msgSend(v46, "constraintHeight") | v87) < 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "handleFailureInFunction:file:lineNumber:description:", v147, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

        }
        v185[0] = v36;
        v185[1] = 3221225472;
        v185[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5;
        v185[3] = &__block_descriptor_80_e36_v16__0__PICropAdjustmentController_8l;
        *(CGFloat *)&v185[4] = x;
        *(CGFloat *)&v185[5] = y;
        *(CGFloat *)&v185[6] = width;
        *(CGFloat *)&v185[7] = height;
        v185[8] = NUOrientationTransformImageSize();
        v185[9] = v88;
        objc_msgSend(v19, "modifyAdjustmentWithKey:modificationBlock:", v151, v185);
      }
    }
    else
    {
      PLPhotoEditGetLog();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v211 = *(double *)&v51;
        _os_log_impl(&dword_20D13D000, v61, OS_LOG_TYPE_INFO, "PEPasteablePreset: Failed to paste crop: %@", buf, 0xCu);
      }

    }
  }
  v152 = v46;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v161, "slomoAdjustmentController");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "rate");
    v91 = v90;

    if (v91 > 0.0)
    {
      +[PEPlaybackRateOption playbackRateOptionsForEditSource:](PEPlaybackRateOption, "playbackRateOptionsForEditSource:", v158);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "firstObject");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "playbackRate");
      v95 = v94;
      v181 = 0u;
      v182 = 0u;
      v183 = 0u;
      v184 = 0u;
      v96 = v92;
      v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v181, v206, 16);
      if (v97)
      {
        v98 = v97;
        v99 = vabds_f32(v91, v95);
        v100 = *(_QWORD *)v182;
        do
        {
          for (k = 0; k != v98; ++k)
          {
            if (*(_QWORD *)v182 != v100)
              objc_enumerationMutation(v96);
            v102 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * k);
            objc_msgSend(v102, "playbackRate");
            v104 = vabds_f32(v103, v91);
            if (v104 < v99)
            {
              v105 = v102;

              v93 = v105;
              v99 = v104;
            }
          }
          v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v181, v206, 16);
        }
        while (v98);
      }

      if (v93)
      {
        v106 = objc_msgSend(v157, "mediaSubtypes");
        objc_msgSend(v93, "playbackRate");
        if (v107 != 1.0 || (v106 & 0x20000) != 0)
        {
          v178[0] = v36;
          v178[1] = 3221225472;
          v178[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_153;
          v178[3] = &unk_24C618290;
          v179 = v93;
          v180 = v158;
          objc_msgSend(v19, "modifyAdjustmentWithKey:modificationBlock:", v150, v178);

        }
        else
        {
          objc_msgSend(v19, "removeAdjustmentWithKey:", v150);
        }
      }

    }
  }
  objc_msgSend(v19, "smartToneAdjustmentController");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = objc_alloc(MEMORY[0x24BE71C40]);
    v110 = (void *)objc_msgSend(MEMORY[0x24BE71CC8], "newComposition");
    v111 = (void *)objc_msgSend(v109, "initWithComposition:", v110);

    v112 = *MEMORY[0x24BE71F28];
    v176[0] = v36;
    v176[1] = 3221225472;
    v176[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_156;
    v176[3] = &unk_24C6182B8;
    v113 = v108;
    v177 = v113;
    objc_msgSend(v111, "modifyAdjustmentWithKey:modificationBlock:", v112, v176);
    objc_msgSend(v111, "smartToneAdjustmentController");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v113) = objc_msgSend(v114, "isEqualToAdjustmentController:", v113);

    if ((_DWORD)v113)
      objc_msgSend(v19, "removeAdjustmentWithKey:", v112);

  }
  objc_msgSend(v19, "smartColorAdjustmentController");
  v115 = (void *)v159;
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v116)
  {
    v117 = objc_alloc(MEMORY[0x24BE71C40]);
    v118 = (void *)objc_msgSend(MEMORY[0x24BE71CC8], "newComposition");
    v119 = (void *)objc_msgSend(v117, "initWithComposition:", v118);

    v120 = *MEMORY[0x24BE71F20];
    v174[0] = v36;
    v174[1] = 3221225472;
    v174[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3_158;
    v174[3] = &unk_24C6189B8;
    v121 = v116;
    v175 = v121;
    objc_msgSend(v119, "modifyAdjustmentWithKey:modificationBlock:", v120, v174);
    objc_msgSend(v119, "smartColorAdjustmentController");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v121) = objc_msgSend(v122, "isEqualToAdjustmentController:", v121);

    if ((_DWORD)v121)
      objc_msgSend(v19, "removeAdjustmentWithKey:", v120);

  }
  -[PEPasteablePreset _runAutoCalculatorForCompositionController:](self, "_runAutoCalculatorForCompositionController:", v19);
  if (v159)
  {
    objc_msgSend(v19, "adjustmentControllerForKey:", v160);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v123)
    {
      objc_msgSend(v162, "composition");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "objectForKeyedSubscript:", v159);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "replaceAdjustment:withKey:", v125, v159);

    }
  }
  objc_msgSend(v19, "depthAdjustmentController");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if (v126)
  {
    objc_msgSend(v162, "depthAdjustmentController");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "aperture");
    v129 = v128;

    objc_msgSend(v126, "aperture");
    v131 = v130;
    if (!objc_msgSend(v126, "canAdjustApertureValue"))
    {
      if (v131 == v129)
        goto LABEL_92;
      v137 = *MEMORY[0x24BE71DB8];
      v172[0] = v36;
      v172[1] = 3221225472;
      v172[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5_162;
      v172[3] = &__block_descriptor_40_e37_v16__0__PIDepthAdjustmentController_8l;
      *(double *)&v172[4] = v129;
      v138 = v172;
      goto LABEL_91;
    }
    objc_msgSend(v126, "minimumAperture");
    v133 = v132;
    objc_msgSend(v126, "maximumAperture");
    v135 = v134;
    objc_msgSend(v126, "aperture");
    if (v133 >= v136)
      v136 = v133;
    if (v136 >= v135)
      v136 = v135;
    if (v131 != v136)
    {
      v137 = *MEMORY[0x24BE71DB8];
      v173[0] = v36;
      v173[1] = 3221225472;
      v173[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4_160;
      v173[3] = &__block_descriptor_40_e37_v16__0__PIDepthAdjustmentController_8l;
      *(double *)&v173[4] = v136;
      v138 = v173;
LABEL_91:
      objc_msgSend(v19, "modifyAdjustmentWithKey:modificationBlock:", v137, v138);
    }
  }
LABEL_92:
  aBlock[0] = v36;
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_6;
  aBlock[3] = &unk_24C619258;
  v139 = v162;
  v169 = v139;
  v140 = v19;
  v170 = v140;
  v141 = v154;
  v171 = v141;
  v142 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[PEAdjustmentPreset isAutoEnhanceEnabled](self, "isAutoEnhanceEnabled"))
  {
    -[PEPasteablePreset autoDelegate](self, "autoDelegate");
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    if (v143)
    {
      -[PEPasteablePreset autoDelegate](self, "autoDelegate");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v166[0] = v36;
      v166[1] = 3221225472;
      v166[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_164;
      v166[3] = &unk_24C618E88;
      v167 = v142;
      objc_msgSend(v144, "applyAutoEnhance:completion:", v140, v166);

      v145 = v167;
    }
    else
    {
      v146 = -[PEAdjustmentPreset autoType](self, "autoType") == 1;
      v164[0] = v36;
      v164[1] = 3221225472;
      v164[2] = __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_166;
      v164[3] = &unk_24C618E88;
      v165 = v142;
      +[PEAutoEnhanceActionHelper applyAutoEnhance:replacesAffectedAdjustments:useCompositionIntensity:completion:](PEAutoEnhanceActionHelper, "applyAutoEnhance:replacesAffectedAdjustments:useCompositionIntensity:completion:", v140, 0, v146, v164);
      v145 = v165;
    }

    v115 = (void *)v159;
  }
  else
  {
    v142[2](v142);
  }

}

- (void)_runAutoCalculatorForCompositionController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  BOOL v42;
  id v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _BOOL4 v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  __int128 *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  __int128 *v60;
  BOOL v61;
  _QWORD v62[4];
  NSObject *v63;
  __int128 *p_buf;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[4];
  NSObject *v73;
  id v74;
  _QWORD v75[4];
  NSObject *v76;
  id v77;
  uint8_t v78[4];
  uint64_t v79;
  __int128 buf;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "adjustmentConstants");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartToneAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "smartToneAdjustmentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc(MEMORY[0x24BE71D28]);
      objc_msgSend(v3, "composition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithComposition:", v8);

      objc_msgSend(v9, "setName:", CFSTR("PEAdjustmentPresetManager-PISmartToneAutoCalculator"));
      v77 = 0;
      objc_msgSend(v9, "submitSynchronous:", &v77);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v77;
      if (v10)
      {
        objc_msgSend(v52, "PISmartToneAdjustmentKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v75[0] = MEMORY[0x24BDAC760];
        v75[1] = 3221225472;
        v75[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke;
        v75[3] = &unk_24C6182B8;
        v76 = v10;
        objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v12, v75);

        v13 = v76;
      }
      else
      {
        PLPhotoEditGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_20D13D000, v13, OS_LOG_TYPE_INFO, "PEAdjustmentPresetManager smart tone calculator failed: %@", (uint8_t *)&buf, 0xCu);
        }
      }

    }
  }
  objc_msgSend(v3, "smartColorAdjustmentController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v3, "smartColorAdjustmentController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statistics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BE71D10]);
      objc_msgSend(v3, "composition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithComposition:", v19);

      objc_msgSend(v20, "setName:", CFSTR("PEAdjustmentPresetManager-PISmartColorAutoCalculator"));
      v74 = 0;
      objc_msgSend(v20, "submitSynchronous:", &v74);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v74;
      if (v21)
      {
        objc_msgSend(v52, "PISmartColorAdjustmentKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v72[0] = MEMORY[0x24BDAC760];
        v72[1] = 3221225472;
        v72[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_173;
        v72[3] = &unk_24C6189B8;
        v73 = v21;
        objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v23, v72);

        v24 = v73;
      }
      else
      {
        PLPhotoEditGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v22;
          _os_log_impl(&dword_20D13D000, v24, OS_LOG_TYPE_INFO, "PEPasteablePreset smart color calculator failed: %@", (uint8_t *)&buf, 0xCu);
        }
      }

    }
  }
  objc_msgSend(v3, "portraitAdjustmentController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

  }
  else
  {
    objc_msgSend(v3, "depthAdjustmentController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (v27)
      goto LABEL_36;
  }
  objc_msgSend(v3, "portraitAdjustmentController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "PIPortraitAdjustmentKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAdjustmentWithKey:", v28);

  objc_msgSend(v3, "depthAdjustmentController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "PIDepthAdjustmentKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAdjustmentWithKey:", v29);

  v30 = objc_alloc(MEMORY[0x24BE71CD0]);
  objc_msgSend(v3, "composition");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithComposition:", v31);

  objc_msgSend(v32, "setName:", CFSTR("PEPasteablePreset-PIPortraitAutoCalculator"));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy_;
  v83 = __Block_byref_object_dispose_;
  v84 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  v71 = 0;
  v33 = dispatch_group_create();
  dispatch_group_enter(v33);
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_177;
  v62[3] = &unk_24C618300;
  p_buf = &buf;
  v65 = &v66;
  v34 = v33;
  v63 = v34;
  objc_msgSend(v32, "submit:", v62);
  dispatch_group_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    objc_msgSend(v51, "kind");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE71E30]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count") != 0;
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE71E28]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38 && objc_msgSend(v38, "BOOLValue"))
      v37 = objc_msgSend(MEMORY[0x24BE71CC8], "isPortraitStageEffect:", v35) ^ 1;
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE71D68]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "intValue");
    v42 = v41 > 1;
    if (v35)
    {
      objc_msgSend(MEMORY[0x24BE72038], "equivalentEffectForIdentifier:version:", v35, v41);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (v43)
        v44 = v37;
      else
        v44 = 0;
      if (v44 == 1 && v51)
      {
        objc_msgSend(v52, "PIPortraitAdjustmentKey");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x24BDAC760];
        v56[1] = 3221225472;
        v56[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_2;
        v56[3] = &unk_24C618328;
        v57 = v51;
        v43 = v43;
        v58 = v43;
        v59 = v36;
        v60 = &buf;
        v61 = v42;
        objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v45, v56);

      }
    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(v3, "depthAdjustmentController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47 == 0;

    if (v48)
    {
      v49 = *MEMORY[0x24BE71DB8];
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_3;
      v53[3] = &unk_24C618350;
      v55 = &buf;
      v54 = v50;
      objc_msgSend(v3, "modifyAdjustmentWithKey:modificationBlock:", v49, v53);

    }
  }
  else
  {
    PLPhotoEditGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v46 = v67[5];
      *(_DWORD *)v78 = 138412290;
      v79 = v46;
      _os_log_impl(&dword_20D13D000, v35, OS_LOG_TYPE_INFO, "PEPasteablePreset portrait calculator failed: %@", v78, 0xCu);
    }
  }

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&buf, 8);

LABEL_36:
}

- (BOOL)_isSmart
{
  void *v2;
  void *v3;
  char v4;

  -[PEAdjustmentPreset serializedDictionary](self, "serializedDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PEAdjustmentPresetSmartKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (id)expAndWBAdjustmentsDebugDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  -[PEAdjustmentPreset composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71C40]), "initWithComposition:", v2);
  objc_msgSend(v3, "smartToneAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offsetExposure");
  v6 = v5;

  objc_msgSend(v3, "whiteBalanceAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "warmTemp");
  v9 = v8;

  objc_msgSend(v3, "whiteBalanceAdjustmentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "warmTint");
  v12 = v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exp(%.2f), Warmth(%.2f), Tint(%.2f)"), v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PEAdjustmentPresetAutoDelegate)autoDelegate
{
  return (PEAdjustmentPresetAutoDelegate *)objc_loadWeakRetained((id *)&self->_autoDelegate);
}

- (void)setAutoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_autoDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_autoDelegate);
  objc_storeStrong((id *)&self->_resourceManager, 0);
}

uint64_t __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatistics:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_173(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatistics:", *(_QWORD *)(a1 + 32));
}

void __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_177(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 40), "filterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setKind:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setPortraitInfo:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE71E38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSpillMatteAllowed:", v4);

  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v6, "defaultStrength");
    objc_msgSend(*(id *)(a1 + 32), "setStrength:");
  }
  objc_msgSend(*(id *)(a1 + 32), "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromAdjustment:", v5);

}

void __64__PEPasteablePreset__runAutoCalculatorForCompositionController___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE71DD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE71DC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v12, "setDepthInfo:", v3);
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_msgSend(v7, "aperture");
  else
    v8 = v6;
  objc_msgSend(v12, "setAperture:", v8);
  v9 = *(void **)(a1 + 32);
  if (v9)
    v10 = objc_msgSend(v9, "enabled");
  else
    v10 = 1;
  objc_msgSend(v12, "setEnabled:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE71DD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGlassesMatteAllowed:", v11);

}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

BOOL __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "adjustmentControllerForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v5, "pasteAdjustment:forMediaType:", v4, *(_QWORD *)(a1 + 48));

}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientation:", *(_QWORD *)(a1 + 32));
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5(double *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  objc_msgSend(v7, "setConstraintWidth:", *((_QWORD *)a1 + 8));
  objc_msgSend(v7, "setConstraintHeight:", *((_QWORD *)a1 + 9));
  objc_msgSend(v7, "setIsAuto:", 0);
  objc_msgSend(v7, "setEnabled:", 1);

}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMTime v10;
  CMTimeRange range;
  CMTime v12;
  __int128 v13;
  CMTimeEpoch epoch;
  CMTimeRange v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playbackRate");
  objc_msgSend(v3, "setRate:", v4);
  if (v3)
  {
    objc_msgSend(v3, "startTime");
    if ((v18 & 0x100000000) != 0)
    {
      objc_msgSend(v3, "endTime");
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  v5 = (void *)MEMORY[0x24BDB2378];
  objc_msgSend(*(id *)(a1 + 40), "videoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE72470], "defaultSlowMotionAdjustmentsForAsset:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  memset(&v15, 0, sizeof(v15));
  if (v8)
    objc_msgSend(v8, "slowMotionTimeRange");
  v13 = *(_OWORD *)&v15.start.value;
  epoch = v15.start.epoch;
  objc_msgSend(v3, "setStartTime:", &v13);
  range = v15;
  CMTimeRangeGetEnd(&v12, &range);
  v10 = v12;
  objc_msgSend(v3, "setEndTime:", &v10);

LABEL_9:
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_156(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "statistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatistics:", v4);

  objc_msgSend(v5, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
}

void __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_3_158(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "statistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatistics:", v4);

  objc_msgSend(v5, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "enabled"));
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_4_160(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAperture:", *(double *)(a1 + 32));
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_5_162(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAperture:", *(double *)(a1 + 32));
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "applyChangesFromCompositionController:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(MEMORY[0x24BE71F80], "isIdentityCompositionController:", *(_QWORD *)(a1 + 32))
    && (objc_msgSend(*(id *)(a1 + 32), "slomoAdjustmentController"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    PLPhotoEditGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v3, OS_LOG_TYPE_INFO, "PEPasteablePreset: No edits applied to compositionController", buf, 2u);
    }
  }
  else
  {
    PLPhotoEditGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D13D000, v3, OS_LOG_TYPE_INFO, "PEPasteablePreset: Applied edits to compositionController", v5, 2u);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__PEPasteablePreset_applyToCompositionController_asset_editSource_invalidAdjustmentKeys_completion___block_invoke_2_166(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

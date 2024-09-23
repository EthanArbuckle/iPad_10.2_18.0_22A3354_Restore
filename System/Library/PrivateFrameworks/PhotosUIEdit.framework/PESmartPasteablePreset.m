@implementation PESmartPasteablePreset

- (PESmartPasteablePreset)initWithPasteablePreset:(id)a3
{
  id v4;
  void *v5;
  PESmartPasteablePreset *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "serializedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PESmartPasteablePreset;
  v6 = -[PEAdjustmentPreset initWithPropertyListDictionary:](&v9, sel_initWithPropertyListDictionary_, v5);

  if (v6)
  {
    objc_msgSend(v4, "analyticsEventBuilderDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PEEditAction setAnalyticsEventBuilderDelegate:](v6, "setAnalyticsEventBuilderDelegate:", v7);

    -[PESmartPasteablePreset setShouldBypassGating:](v6, "setShouldBypassGating:", 0);
  }

  return v6;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "compositionController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PESmartPasteablePreset applyToCompositionController:asset:editSource:completion:](self, "applyToCompositionController:asset:editSource:completion:", v10, v8, v9, v6);
}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  dispatch_time_t v48;
  NSObject *v49;
  void *v50;
  id VNSceneprintClass;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  double v63;
  id v64;
  id v65;
  _QWORD v66[4];
  NSObject *v67;
  __int128 *p_buf;
  uint8_t v69[4];
  id v70;
  __int16 v71;
  void *v72;
  __int128 buf;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend((id)objc_opt_class(), "isAssetTypeEligibleForSmartPaste:", v11) & 1) != 0)
  {
    v14 = v11;
    -[PESmartPasteablePreset sourceAssetComposition](self, "sourceAssetComposition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v74 = 0x3032000000;
      v75 = __Block_byref_object_copy_;
      v76 = __Block_byref_object_dispose_;
      v77 = 0;
      objc_msgSend(v14, "photoLibrary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke;
      v66[3] = &unk_24C618378;
      p_buf = &buf;
      v18 = v16;
      v67 = v18;
      -[PESmartPasteablePreset _loadResourcesForSourceAssetWithPhotoLibrary:completion:](self, "_loadResourcesForSourceAssetWithPhotoLibrary:completion:", v17, v66);

      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      -[PESmartPasteablePreset sourceAssetComposition](self, "sourceAssetComposition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = v19 == 0;

      if ((_DWORD)v17)
      {
        PLPhotoEditGetLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "localizedDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v69 = 138412546;
          v70 = v14;
          v71 = 2112;
          v72 = v38;
          _os_log_impl(&dword_20D13D000, v37, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: couldn't load source asset (%@) resources for smart paste (error: %@). Falling back on legacy paste", v69, 0x16u);

        }
        +[PESCAPReviewPayload legacyPayloadWithReason:](PESCAPReviewPayload, "legacyPayloadWithReason:", 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PESmartPasteablePreset triggerLegacyPasteFallbackOnCompositionController:editSource:asset:reviewPayload:completion:](self, "triggerLegacyPasteFallbackOnCompositionController:editSource:asset:reviewPayload:completion:", v10, v12, v14, v39, v13);

        _Block_object_dispose(&buf, 8);
        goto LABEL_35;
      }

      _Block_object_dispose(&buf, 8);
    }
    if (objc_msgSend((id)objc_opt_class(), "isAssetTypeEligibleForSmartPaste:", v14)
      && -[PESmartPasteablePreset _shouldPerformSmartPasteOnAsset:](self, "_shouldPerformSmartPasteOnAsset:", v14))
    {
      v20 = objc_alloc(MEMORY[0x24BE71D18]);
      -[PESmartPasteablePreset sourceAssetComposition](self, "sourceAssetComposition");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "composition");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v20, "initWithSourceComposition:targetComposition:", v21, v22);

      +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "smartCopyPasteSimilarityGatingThreshold");
      v25 = v24;

      if (!-[PESmartPasteablePreset shouldBypassGating](self, "shouldBypassGating"))
        -[NSObject setSimilarityGatingThreshold:](v18, "setSimilarityGatingThreshold:", v25);
      +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "fetchAndSendScenePrintsForSliderNet");

      if (v27)
      {
        -[PESmartPasteablePreset sourceAsset](self, "sourceAsset");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 == 0;

        if (!v29)
        {
          v53 = (void *)MEMORY[0x24BDD1620];
          VNSceneprintClass = getVNSceneprintClass();
          -[PESmartPasteablePreset sourceAsset](self, "sourceAsset");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "sceneprintProperties");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sceneprint");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 0;
          objc_msgSend(v53, "unarchivedObjectOfClass:fromData:error:", VNSceneprintClass, v32, &v65);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v65;

          if (v54)
          {
            PLPhotoEditGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v54, "localizedDescription");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v34;
              _os_log_impl(&dword_20D13D000, v33, OS_LOG_TYPE_ERROR, "PESmartPasteablePreset-applyToLoadResult: Failed to get scene print data from the source asset: (%@)", (uint8_t *)&buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(v52, "descriptorData");
            v33 = objc_claimAutoreleasedReturnValue();
            -[NSObject setSourceAssetScenePrint:](v18, "setSourceAssetScenePrint:", v33);
          }

        }
        objc_msgSend(v14, "fetchPropertySetsIfNeeded");
        v55 = (void *)MEMORY[0x24BDD1620];
        v40 = getVNSceneprintClass();
        objc_msgSend(v14, "sceneprintProperties");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sceneprint");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0;
        objc_msgSend(v55, "unarchivedObjectOfClass:fromData:error:", v40, v42, &v64);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v64;

        if (v43)
        {
          PLPhotoEditGetLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v43, "localizedDescription");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v45;
            _os_log_impl(&dword_20D13D000, v44, OS_LOG_TYPE_ERROR, "PESmartPasteablePreset-applyToLoadResult: Failed to get scene print data from the target asset: (%@)", (uint8_t *)&buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v56, "descriptorData");
          v44 = objc_claimAutoreleasedReturnValue();
          -[NSObject setTargetAssetScenePrint:](v18, "setTargetAssetScenePrint:", v44);
        }

      }
      v46 = dispatch_group_create();
      dispatch_group_enter(v46);
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke_212;
      v57[3] = &unk_24C6183A0;
      v63 = v25;
      v57[4] = self;
      v47 = v46;
      v58 = v47;
      v59 = v10;
      v60 = v12;
      v61 = v14;
      v62 = v13;
      -[NSObject submit:](v18, "submit:", v57);
      v48 = dispatch_time(0, 1000000000);
      if (dispatch_group_wait(v47, v48))
      {
        PLPhotoEditGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_20D13D000, v49, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToCompositionController: PISmartCopyPasteAutoCalculator timed out (>1sec)", (uint8_t *)&buf, 2u);
        }

        -[NSObject renderContext](v18, "renderContext");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "cancelAllRequests");

      }
    }
    else
    {
      PLPhotoEditGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_20D13D000, v36, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: asset (%@) isn't eligible for smart paste. Falling back on legacy paste", (uint8_t *)&buf, 0xCu);
      }

      +[PESCAPReviewPayload legacyPayloadWithReason:](PESCAPReviewPayload, "legacyPayloadWithReason:", 5);
      v18 = objc_claimAutoreleasedReturnValue();
      -[PESmartPasteablePreset triggerLegacyPasteFallbackOnCompositionController:editSource:asset:reviewPayload:completion:](self, "triggerLegacyPasteFallbackOnCompositionController:editSource:asset:reviewPayload:completion:", v10, v12, v14, v18, v13);
    }
LABEL_35:

    goto LABEL_36;
  }
  PLPhotoEditGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_20D13D000, v35, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: asset (%@) isn't eligible for smart paste. Falling back on legacy paste", (uint8_t *)&buf, 0xCu);
  }

  +[PESCAPReviewPayload legacyPayloadWithReason:](PESCAPReviewPayload, "legacyPayloadWithReason:", 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PESmartPasteablePreset triggerLegacyPasteFallbackOnCompositionController:editSource:asset:reviewPayload:completion:](self, "triggerLegacyPasteFallbackOnCompositionController:editSource:asset:reviewPayload:completion:", v10, v12, v11, v14, v13);
LABEL_36:

}

- (int64_t)actionType
{
  return 3;
}

- (void)_loadResourcesForSourceAssetWithPhotoLibrary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  PESmartPasteablePreset *v25;
  void (**v26)(id, uint64_t, _QWORD);
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[PESmartPasteablePreset sourceAsset](self, "sourceAsset");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[PESmartPasteablePreset sourceAssetComposition](self, "sourceAssetComposition"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFetchLimit:", 1);
    v12 = *MEMORY[0x24BDE3758];
    v30[0] = *MEMORY[0x24BDE3750];
    v30[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFetchPropertySets:", v13);

    -[PEPasteablePreset sourceAssetUUID](self, "sourceAssetUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToString:", &stru_24C619BD0))
    {
      v19 = (void *)MEMORY[0x24BDE3488];
      v27 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fetchAssetsWithLocalIdentifiers:options:", v20, v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[PESmartPasteablePreset setSourceAsset:](self, "setSourceAsset:", v21);
        -[PESmartPasteablePreset setSourceAssetSceneCharacteristics:](self, "setSourceAssetSceneCharacteristics:", -[PESmartPasteablePreset _imageClassificationsForAsset:](self, "_imageClassificationsForAsset:", v21));
        -[PEPasteablePreset resourceManager](self, "resourceManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_2;
        v23[3] = &unk_24C618410;
        v24 = v21;
        v25 = self;
        v26 = v7;
        objc_msgSend(v22, "loadResourceForAsset:requireLocalResources:forceRunAsUnadjustedAsset:progressHandler:resultHandler:", v24, 1, 0, &__block_literal_global_456, v23);

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      v29 = CFSTR("PEEditAction _loadResourcesForSourceAssetWithPhotoLibrary: no valid source asset UUID");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PEEditActionErrorDomain"), 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v18);
    }

  }
}

- (void)triggerLegacyPasteFallbackOnCompositionController:(id)a3 editSource:(id)a4 asset:(id)a5 reviewPayload:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PEPasteablePreset *v17;
  void *v18;
  PEPasteablePreset *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  v17 = [PEPasteablePreset alloc];
  -[PEAdjustmentPreset serializedDictionary](self, "serializedDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PEAdjustmentPreset initWithPropertyListDictionary:](v17, "initWithPropertyListDictionary:", v18);

  -[PEEditAction analyticsEventBuilderDelegate](self, "analyticsEventBuilderDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEEditAction setAnalyticsEventBuilderDelegate:](v19, "setAnalyticsEventBuilderDelegate:", v20);

  -[PEAdjustmentPreset applyToCompositionController:asset:editSource:completion:](v19, "applyToCompositionController:asset:editSource:completion:", v16, v12, v15, v14);
  -[PEEditAction analyticsEventBuilderDelegate](self, "analyticsEventBuilderDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PEEditAction analyticsEventBuilderDelegate](self, "analyticsEventBuilderDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PEPasteablePreset actionType](v19, "actionType");
    if ((unint64_t)(v23 - 1) > 7)
      v24 = CFSTR("Unknown");
    else
      v24 = off_24C618660[v23 - 1];
    v25 = v24;
    v31[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateAnalyticsEventBuilderActionType:forAssets:", v25, v26);

  }
  +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "smartCopyPasteReviewUIEnabled");

  if (v13 && v28)
  {
    +[PESCAPReviewManager sharedReviewManager](PESCAPReviewManager, "sharedReviewManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PEPasteablePreset expAndWBAdjustmentsDebugDescription](v19, "expAndWBAdjustmentsDebugDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdjustmentsDescription:", v30);

    objc_msgSend(v29, "registerPayload:forAsset:", v13, v12);
  }

}

- (unint64_t)_imageClassificationsForAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDE34F8]);
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPhotoLibrary:", v5);

  objc_msgSend(v3, "fetchPropertySetsIfNeeded");
  objc_msgSend(v3, "sceneAnalysisProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  objc_msgSend(v3, "sceneClassifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v28 = 0;
    v11 = *(_QWORD *)v31;
    v12 = *MEMORY[0x24BDE3770];
    v29 = *MEMORY[0x24BDE3768];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v14, "extendedSceneIdentifier") == v12 || objc_msgSend(v14, "extendedSceneIdentifier") == v29)
        {
          objc_msgSend(v6, "_sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:", objc_msgSend(v14, "extendedSceneIdentifier"), objc_msgSend(v7, "sceneAnalysisVersion"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "doubleValue");
            v18 = v17;
            objc_msgSend(v14, "confidence");
            if (v18 < v19)
            {
              v20 = v7;
              v21 = v6;
              v22 = v8;
              v23 = v28 | (objc_msgSend(v14, "extendedSceneIdentifier") == v12);
              v24 = objc_msgSend(v14, "extendedSceneIdentifier");
              v25 = v23 | 2;
              if (v24 != v29)
                v25 = v23;
              v28 = v25;
              v8 = v22;
              v6 = v21;
              v7 = v20;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)sceneCharacteristicDescription:(unint64_t)a3
{
  void (**v3)(void *, uint64_t, const __CFString *);
  __CFString *v4;
  __CFString *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__PESmartPasteablePreset_sceneCharacteristicDescription___block_invoke;
  v7[3] = &unk_24C618438;
  v7[4] = &v8;
  v7[5] = a3;
  v3 = (void (**)(void *, uint64_t, const __CFString *))_Block_copy(v7);
  v3[2](v3, 1, CFSTR("Outdoor"));
  v3[2](v3, 2, CFSTR("Indoor"));
  v3[2](v3, 4, CFSTR("Daytime"));
  v3[2](v3, 8, CFSTR("Nighttime"));
  v4 = (__CFString *)v9[5];
  if (!v4)
    v4 = CFSTR("(none)");
  v5 = v4;

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)_shouldPerformSmartPasteOnAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  uint8_t v20[16];

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PESmartPasteablePreset sourceAsset](self, "sourceAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) != 0)
    goto LABEL_2;
  if (-[PESmartPasteablePreset shouldBypassGating](self, "shouldBypassGating"))
  {
    v9 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_2:
    v9 = 0;
  }
  else
  {
    v10 = v4;
    +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "smartCopyPasteGateOnCaptureTime");

    if (v12)
    {
      -[PESmartPasteablePreset sourceAsset](self, "sourceAsset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "creationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "creationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v15);
      v17 = fabs(v16);
      v9 = v17 <= 14400.0;
      if (v17 > 14400.0)
      {
        PLPhotoEditGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_20D13D000, v18, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset_shouldPerformSmartPasteOnAsset: capture times are too far apart; not using smart paste",
            v20,
            2u);
        }

      }
    }
    else
    {
      v9 = 1;
    }

  }
LABEL_14:

  return v9;
}

- (id)expAndWBAdjustmentsDebugDescription
{
  return self->_expAndWBDebugDescription;
}

- (void)setShouldBypassGating:(BOOL)a3
{
  void *v5;
  int v6;

  +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "smartCopyPasteReviewUIEnabled");

  if (v6)
    self->_shouldBypassGating = a3;
}

- (NUComposition)sourceAssetComposition
{
  return self->_sourceAssetComposition;
}

- (void)setSourceAssetComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PHAsset)sourceAsset
{
  return self->_sourceAsset;
}

- (void)setSourceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAsset, a3);
}

- (unint64_t)sourceAssetSceneCharacteristics
{
  return self->_sourceAssetSceneCharacteristics;
}

- (void)setSourceAssetSceneCharacteristics:(unint64_t)a3
{
  self->_sourceAssetSceneCharacteristics = a3;
}

- (BOOL)shouldBypassGating
{
  return self->_shouldBypassGating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAsset, 0);
  objc_storeStrong((id *)&self->_sourceAssetComposition, 0);
  objc_storeStrong((id *)&self->_expAndWBDebugDescription, 0);
}

void __57__PESmartPasteablePreset_sceneCharacteristicDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a3;
  if ((*(_QWORD *)(a1 + 40) & a2) != 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    v12 = v5;
    if (v7)
    {
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" | %@"), v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
    }
    else
    {
      v11 = v5;
      v10 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v11;
    }

    v5 = v12;
  }

}

void __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PEPasteablePreset *v8;
  void *v9;
  PEPasteablePreset *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [PEPasteablePreset alloc];
    objc_msgSend(a1[5], "serializedDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PEAdjustmentPreset initWithPropertyListDictionary:](v8, "initWithPropertyListDictionary:", v9);

    v11 = a1[4];
    objc_msgSend(v5, "editSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_220;
    v15[3] = &unk_24C6183E8;
    v15[4] = a1[5];
    v16 = v7;
    v17 = a1[6];
    -[PEAdjustmentPreset applyToCompositionController:asset:editSource:completion:](v10, "applyToCompositionController:asset:editSource:completion:", v16, v11, v12, v15);

  }
  else
  {
    PLPhotoEditGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_20D13D000, v13, OS_LOG_TYPE_ERROR, "PEEditActionBatch failed to fetch resources for asset: %{public}@ error:%@", buf, 0x16u);

    }
    (*((void (**)(void))a1[6] + 2))();
  }

}

uint64_t __82__PESmartPasteablePreset__loadResourcesForSourceAssetWithPhotoLibrary_completion___block_invoke_220(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSourceAssetComposition:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if ((a2 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __83__PESmartPasteablePreset_applyToCompositionController_asset_editSource_completion___block_invoke_212(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  float v7;
  int v8;
  id v9;
  void *v10;
  PESCAPReviewPayload *v11;
  _UNKNOWN **v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  PESCAPReviewPayload *v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  PESCAPReviewPayload *v41;
  void *v42;
  void *v43;
  id v44;
  objc_super v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  double v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v50 = 0;
  objc_msgSend(a2, "result:", &v50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v50;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE71F58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  v6 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "floatValue");
    v6 = v7;
  }
  if (v6 <= *(double *)(a1 + 80))
    v8 = objc_msgSend(*(id *)(a1 + 32), "shouldBypassGating") ^ 1;
  else
    v8 = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  if (v3 && !v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE71C40]);
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (PESCAPReviewPayload *)objc_msgSend(v9, "initWithComposition:", v10);

    v12 = &off_24C615000;
    +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "affectManuallyEditedSlidersOnly");

    if (v14)
    {
      v43 = v5;
      v44 = v4;
      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v16 = objc_alloc(MEMORY[0x24BE71C40]);
      objc_msgSend(*(id *)(a1 + 32), "sourceAssetComposition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "initWithComposition:", v17);

      v42 = (void *)v18;
      objc_msgSend(MEMORY[0x24BE71D18], "adjustmentsToModifyBasedOnSourceCompositionController:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v47 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v3, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v21);
      }

      v5 = v43;
      v4 = v44;
      v12 = &off_24C615000;
    }
    else
    {
      v15 = v3;
    }
    objc_msgSend(MEMORY[0x24BE71D18], "applyAdjustmentDictionary:toCompositionController:", v15, v11);
    -[PESCAPReviewPayload composition](v11, "composition");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setComposition:", v29);

    PLPhotoEditGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v15, "debugDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v53 = v6;
      v54 = 2114;
      v55 = v31;
      _os_log_impl(&dword_20D13D000, v30, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToCompositionController: similarity %f; applying smart paste to composition, with sl"
        "ider net values: %{public}@",
        buf,
        0x16u);

    }
    objc_msgSend(MEMORY[0x24BE71D18], "descriptionForAdjustmentDictionary:", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v32);
    objc_msgSend(v12[104], "globalSettings");
    v33 = (PESCAPReviewPayload *)objc_claimAutoreleasedReturnValue();
    if (-[PESCAPReviewPayload smartCopyPasteReviewUIEnabled](v33, "smartCopyPasteReviewUIEnabled"))
    {
      v34 = objc_msgSend(*(id *)(a1 + 32), "shouldBypassGating");

      if ((v34 & 1) != 0)
      {
LABEL_30:
        v36 = *(_QWORD *)(a1 + 48);
        v37 = *(_QWORD *)(a1 + 56);
        v38 = *(_QWORD *)(a1 + 64);
        v39 = *(_QWORD *)(a1 + 72);
        v45.receiver = *(id *)(a1 + 32);
        v45.super_class = (Class)PESmartPasteablePreset;
        objc_msgSendSuper2(&v45, sel_applyToCompositionController_asset_editSource_completion_, v36, v38, v37, v39);

        v3 = v15;
        goto LABEL_37;
      }
      v33 = -[PESCAPReviewPayload initWithActionType:reason:score:adjustmentsDescription:]([PESCAPReviewPayload alloc], "initWithActionType:reason:score:adjustmentsDescription:", 1, 0, v32, v6);
      +[PESCAPReviewManager sharedReviewManager](PESCAPReviewManager, "sharedReviewManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "registerPayload:forAsset:", v33, *(_QWORD *)(a1 + 64));

    }
    goto LABEL_30;
  }
  PLPhotoEditGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v3)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v28 = *(void **)(a1 + 80);
      *(_DWORD *)buf = 134218240;
      v53 = v6;
      v54 = 2048;
      v55 = v28;
      _os_log_impl(&dword_20D13D000, v27, OS_LOG_TYPE_DEBUG, "PESmartPasteablePreset-applyToLoadResult: Source was not similar enough to destination. Similarity: %f / Threshold: %f. Falling back on legacy paste", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "localizedDescription");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = *(double *)&v40;
    _os_log_impl(&dword_20D13D000, v27, OS_LOG_TYPE_ERROR, "PESmartPasteablePreset-applyToLoadResult: Failed to get slider net adjustment dict with error: %@. Falling back on legacy paste", buf, 0xCu);

  }
  if (objc_msgSend(v4, "code") == 10)
  {
    +[PESCAPReviewPayload legacyPayloadWithReason:](PESCAPReviewPayload, "legacyPayloadWithReason:", 7);
    v41 = (PESCAPReviewPayload *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = -[PESCAPReviewPayload initWithActionType:reason:score:adjustmentsDescription:]([PESCAPReviewPayload alloc], "initWithActionType:reason:score:adjustmentsDescription:", 0, 6, 0, v6);
  }
  v11 = v41;
  objc_msgSend(*(id *)(a1 + 32), "triggerLegacyPasteFallbackOnCompositionController:editSource:asset:reviewPayload:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v41, *(_QWORD *)(a1 + 72));
LABEL_37:

}

+ (BOOL)isAssetTypeEligibleForSmartPaste:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isVideo") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

+ (BOOL)isCompositionControllerEligibleForSmartPaste:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:](PEAutoAdjustmentController, "isAutoEnhanceEnabledForCompositionController:", v3))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "smartToneAdjustmentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "enabled") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "smartColorAdjustmentController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "enabled") & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v3, "whiteBalanceAdjustmentController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "enabled");

      }
    }

  }
  return v4;
}

@end

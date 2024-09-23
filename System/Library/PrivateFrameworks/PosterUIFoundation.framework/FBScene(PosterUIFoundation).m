@implementation FBScene(PosterUIFoundation)

- (uint64_t)pui_sceneIsReadyToSnapshot:()PosterUIFoundation
{
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t result;
  const __CFString *v10;
  void *v11;
  int v12;

  v5 = objc_msgSend(a1, "contentState");
  objc_msgSend(a1, "layerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  result = 0;
  v10 = CFSTR("no content");
  if (v5 == 2 && v8 >= 2)
  {
    objc_msgSend(a1, "clientSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "pui_inExtendedRenderSession");

    v10 = CFSTR("is in extended render session");
    if (!v12)
      v10 = 0;
    result = v12 ^ 1u;
  }
  if (a3)
  {
    if (v10)
      *a3 = v10;
  }
  return result;
}

- (id)pui_posterPath
{
  return objc_getAssociatedObject(a1, &__PUIPosterPathToken);
}

+ (id)pui_createPosterSceneWithRole:()PosterUIFoundation processIdentity:extensionRecord:configureParameters:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  PUIPosterSceneComponent *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BE38110];
  v13 = a5;
  objc_msgSend(v12, "pui_posterWorkspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke;
  v35[3] = &unk_25154CA48;
  v16 = v10;
  v36 = v16;
  objc_msgSend(v14, "createScene:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v15;
  v29 = 3221225472;
  v30 = __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_2;
  v31 = &unk_25154CA98;
  v19 = v9;
  v32 = v19;
  v20 = v18;
  v33 = v20;
  v21 = v11;
  v34 = v21;
  objc_msgSend(v17, "configureParameters:", &v28);
  objc_msgSend(v13, "infoDictionary", v28, v29, v30, v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entitlements");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "pf_wantsLocation"))
    v24 = 2;
  else
    v24 = 0;
  objc_msgSend(v23, "objectForKey:ofClass:", CFSTR("com.apple.posterkit.enhanced-memory-limits"), objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PUIPosterSceneComponent initWithScene:bundleIdentifier:processIdentity:options:]([PUIPosterSceneComponent alloc], "initWithScene:bundleIdentifier:processIdentity:options:", v17, v20, v16, v24 | objc_msgSend(v25, "BOOLValue"));
  objc_msgSend(v17, "pui_setPosterComponent:", v26);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "pr_setupSceneExtensionsForRole:", v19);
  else
    objc_msgSend(v17, "addExtension:", objc_opt_class());

  return v17;
}

- (id)pui_buildSnapshotBundleForLevelSets:()PosterUIFoundation determineColorStatistics:error:
{
  char v6;
  __CFString *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PUIPosterSnapshotBundleBuilder *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  PUIColorStatistics *v52;
  void *v54;
  void *v55;
  void *context;
  void *v57;
  __CFString *v59;
  id v60;
  void *v62;
  id obj;
  void *v64;
  PUIPosterSnapshotBundleBuilder *v65;
  id v66;
  unint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  void *v77;
  _BYTE v78[128];
  void *v79;
  _QWORD v80[2];
  _QWORD v81[4];

  v81[2] = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  BSDispatchQueueAssertMain();
  v73 = 0;
  v6 = objc_msgSend(a1, "pui_sceneIsReadyToSnapshot:", &v73);
  v7 = (__CFString *)v73;
  if ((v6 & 1) != 0)
  {
    v59 = v7;
    v8 = v60;
    if (!objc_msgSend(v8, "count"))
    {
      +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
    if (a4)
    {
      +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "containsObject:", v11);

      if ((v12 & 1) == 0)
      {
        +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayByAddingObject:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v14;
      }
    }
    v64 = (void *)objc_opt_new();
    v62 = (void *)objc_opt_new();
    objc_msgSend(a1, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pui_displayConfigurationIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    context = (void *)MEMORY[0x249515064]();
    v17 = [PUIPosterSnapshotBundleBuilder alloc];
    objc_msgSend(a1, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "pui_userInterfaceStyle");
    objc_msgSend(a1, "settings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "interfaceOrientation");
    objc_msgSend(a1, "settings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:](v17, "initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:", v57, v19, v21, objc_msgSend(v22, "pui_deviceOrientation"));

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v8;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v70 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x249515064]();
          objc_msgSend(a1, "pui_snapshotContextConfiguredForLevelSet:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "createSnapshotWithContext:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "capture");
          v68 = 0;
          v30 = -[PUIPosterSnapshotBundleBuilder captureSnapshot:forLevelSet:error:](v65, "captureSnapshot:forLevelSet:error:", v29, v26, &v68);
          v31 = v68;
          if (v30)
          {
            v32 = v62;
            objc_sync_enter(v32);
            objc_msgSend(v32, "addObject:", v26);
            objc_sync_exit(v32);

          }
          if (v31)
          {
            v33 = v64;
            objc_sync_enter(v33);
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, v26);
            objc_sync_exit(v33);

          }
          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v64, "count"))
    {
      v34 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v64, "allValues");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "arrayWithArray:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x24BDD1540];
      v76 = *MEMORY[0x24BDD10D8];
      v38 = (void *)objc_msgSend(v36, "copy");
      v77 = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "pui_errorWithCode:userInfo:", 7, v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v62, "count"))
      {
        if (a4)
        {
          +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUIPosterSnapshotBundleBuilder capturedSnapshotForLevelSet:](v65, "capturedSnapshotForLevelSet:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            +[PUIColorBoxes colorBoxesForImage:](PUIColorBoxes, "colorBoxesForImage:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 0xBFF0000000000000;
            v47 = *MEMORY[0x24BDBF028];
            v48 = *(double *)(MEMORY[0x24BDBF028] + 8);
            v49 = *(double *)(MEMORY[0x24BDBF028] + 16);
            v50 = *(double *)(MEMORY[0x24BDBF028] + 24);
            PUIAverageColorFromColorBoxes(v46, *MEMORY[0x24BDBF028], v48, v49, v50, 0.0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = -[PUIColorStatistics initWithAverageColor:contrast:]([PUIColorStatistics alloc], "initWithAverageColor:contrast:", v51, PUICalculateContrastFromColorBoxes(v46, 0, (double *)&v67, v47, v48, v49, v50));
            -[PUIPosterSnapshotBundleBuilder captureColorStatistics:error:](v65, "captureColorStatistics:error:", v52, 0);

          }
        }
        v66 = 0;
        -[PUIPosterSnapshotBundleBuilder buildWithError:](v65, "buildWithError:", &v66);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v66;
        goto LABEL_32;
      }
      v54 = (void *)MEMORY[0x24BDD1540];
      v74 = *MEMORY[0x24BDD0FD8];
      v75 = CFSTR("No image data was returned by any capture method.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "pui_errorWithCode:userInfo:", 7, v55);
      v40 = (id)objc_claimAutoreleasedReturnValue();

    }
    v41 = 0;
LABEL_32:

    objc_autoreleasePoolPop(context);
    if (a5 && v40)
      *a5 = objc_retainAutorelease(v40);

LABEL_36:
    v7 = v59;
    goto LABEL_37;
  }
  if (a5)
  {
    v42 = (void *)MEMORY[0x24BDD1540];
    v80[0] = *MEMORY[0x24BDD0FD8];
    v80[1] = CFSTR("reason");
    v43 = CFSTR("(unknown)");
    v59 = v7;
    if (v7)
      v43 = v7;
    v81[0] = CFSTR("Scene is not ready to snapshot.");
    v81[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "pui_errorWithCode:userInfo:", 7, obj);
    v41 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v41 = 0;
LABEL_37:

  return v41;
}

- (id)_emptySnapshotImage
{
  if (_emptySnapshotImage_onceToken != -1)
    dispatch_once(&_emptySnapshotImage_onceToken, &__block_literal_global_23);
  return (id)_emptySnapshotImage_fallbackSnapshotImage;
}

- (void)pui_executeSnapshotForLevelSets:()PosterUIFoundation determineColorStatistics:onQueue:completion:
{
  id v10;
  id v11;
  id v12;
  char v13;
  const __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v34 = 0;
    v13 = objc_msgSend(a1, "pui_sceneIsReadyToSnapshot:", &v34);
    v14 = (const __CFString *)v34;
    v15 = (__CFString *)v14;
    if ((v13 & 1) != 0)
    {
      v16 = v10;
      if (!objc_msgSend(v16, "count"))
      {
        +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
        v18 = objc_claimAutoreleasedReturnValue();

        v16 = (id)v18;
      }
      if (a4)
      {
        +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v16, "containsObject:", v19);

        if ((v20 & 1) == 0)
        {
          +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "arrayByAddingObject:", v21);
          v22 = objc_claimAutoreleasedReturnValue();

          v16 = (id)v22;
        }
      }
      objc_msgSend(a1, "settings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__onceToken != -1)
        dispatch_once(&pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__onceToken, &__block_literal_global_32);
      v24 = (void *)pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__fallbackQueue;
      if (v11)
        v24 = v11;
      v25 = v24;
      v32 = v16;
      v33 = v12;
      v26 = v25;
      v27 = v16;
      v28 = v23;
      BSDispatchMain();

    }
    else
    {
      v29 = (void *)MEMORY[0x24BDD1540];
      v36[0] = *MEMORY[0x24BDD0FD8];
      v36[1] = CFSTR("reason");
      v30 = CFSTR("(unknown)");
      if (v14)
        v30 = v14;
      v37[0] = CFSTR("Scene is not ready to snapshot.");
      v37[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pui_errorWithCode:userInfo:", 7, v31);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, id))v12 + 2))(v12, 0, 0, v28);
    }

  }
}

- (id)pui_snapshotContextConfiguredForLevelSet:()PosterUIFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    BSDispatchQueueAssertMain();
    objc_msgSend(a1, "snapshotContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isCompositeLevelSet") & 1) == 0)
    {
      objc_msgSend(v5, "setOpaque:", 0);
      v6 = (void *)objc_opt_new();
      objc_msgSend(a1, "layerManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v14, "level", (_QWORD)v17);
            if ((objc_msgSend(v4, "containsLevel:", (uint64_t)v15) & 1) == 0)
              objc_msgSend(v6, "addObject:", v14);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v11);
      }

      objc_msgSend(v5, "setLayersToExclude:", v6);
    }
  }
  else
  {
    objc_msgSend(a1, "snapshotContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)pui_invalidateWithCompletion:()PosterUIFoundation
{
  void (**v4)(_QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PUISceneInvalidationAction *v12;
  id v13;
  id v14;
  id v15;
  PUISceneInvalidationAction *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  void *v23;
  void (**v24)(_QWORD);
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (objc_msgSend(a1, "isValid") && objc_msgSend(a1, "isActive"))
  {
    objc_msgSend(a1, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "pui_isInvalidated");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(a1, "pui_shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pui_provider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      PUILogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = v8;
        v27 = 2114;
        v28 = v10;
        _os_log_impl(&dword_24464E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending pui_isInvalidated to %{public}@", buf, 0x16u);
      }

      v12 = [PUISceneInvalidationAction alloc];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke;
      v19[3] = &unk_25154CB78;
      v20 = v7;
      v21 = v8;
      v22 = v10;
      v23 = a1;
      v24 = v4;
      v13 = v10;
      v14 = v8;
      v15 = v7;
      v16 = -[PUISceneInvalidationAction initWithInfo:timeout:forResponseOnQueue:withHandler:](v12, "initWithInfo:timeout:forResponseOnQueue:withHandler:", 0, MEMORY[0x24BDAC9B8], v19, 5.0);
      objc_msgSend(a1, "settings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "setForeground:", 0);
      objc_msgSend(v18, "pui_setInvalidated:", v16);
      objc_msgSend(a1, "updateSettings:withTransitionContext:", v18, 0);

    }
  }
  else
  {
    objc_msgSend(a1, "pui_setPosterPath:", 0);
    objc_msgSend(a1, "pui_setPosterComponent:", 0);
    objc_msgSend(a1, "invalidate");
    if (v4)
      v4[2](v4);
  }

}

- (uint64_t)pui_isLegacyProvider
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pui_provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PaperBoard.LegacyPoster"));

  return v3;
}

- (void)pui_setPosterPath:()PosterUIFoundation
{
  objc_setAssociatedObject(a1, &__PUIPosterPathToken, a3, (void *)1);
}

- (id)pui_posterComponent
{
  return objc_getAssociatedObject(a1, &__PUIPosterComponentToken);
}

- (void)pui_setPosterComponent:()PosterUIFoundation
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "pui_posterComponent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");
  objc_setAssociatedObject(a1, &__PUIPosterComponentToken, v4, (void *)1);

}

- (id)pui_shortDescription
{
  return objc_getAssociatedObject(a1, &__PUIPosterDescriptionToken);
}

- (void)pui_setShortDescription:()PosterUIFoundation
{
  objc_setAssociatedObject(a1, &__PUIPosterDescriptionToken, a3, (void *)1);
}

- (void)pui_postSignificantEvent:()PosterUIFoundation
{
  void *v5;
  _BOOL4 v6;
  _QWORD v7[5];

  objc_msgSend(a1, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PUIPosterSignificantEventOptionsContainsEvent(objc_msgSend(v5, "pui_significantEventOptions"), a3);

  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__FBScene_PosterUIFoundation__pui_postSignificantEvent___block_invoke;
    v7[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    v7[4] = a3;
    objc_msgSend(a1, "performUpdate:", v7);
  }
}

- (void)pui_postUserTapEventWithLocation:()PosterUIFoundation
{
  void *v6;
  int v7;
  _QWORD v8[6];

  objc_msgSend(a1, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pui_userTapEventsRequested");

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__FBScene_PosterUIFoundation__pui_postUserTapEventWithLocation___block_invoke;
    v8[3] = &__block_descriptor_48_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    *(double *)&v8[4] = a2;
    *(double *)&v8[5] = a3;
    objc_msgSend(a1, "performUpdate:", v8);
  }
}

@end

@implementation FBScene

void __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD1880];
  v7 = a2;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v5);

  objc_msgSend(MEMORY[0x24BDF6828], "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpecification:", v6);

  objc_msgSend(v7, "setClientIdentity:", *(_QWORD *)(a1 + 32));
}

void __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_3;
  v5[3] = &unk_25154CA70;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "updateSettingsWithBlock:", v5);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "pui_setRole:", v3);
  objc_msgSend(v4, "pui_setProvider:", *(_QWORD *)(a1 + 40));

}

void __50__FBScene_PosterUIFoundation___emptySnapshotImage__block_invoke()
{
  void *v0;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  __int128 v10;

  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredRange:", 0x7FFFLL);
  objc_msgSend(v8, "setOpaque:", 0);
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", 1.0, 1.0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__FBScene_PosterUIFoundation___emptySnapshotImage__block_invoke_2;
  v9[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  __asm { FMOV            V0.2D, #1.0 }
  v10 = _Q0;
  objc_msgSend(v0, "imageWithActions:", v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_emptySnapshotImage_fallbackSnapshotImage;
  _emptySnapshotImage_fallbackSnapshotImage = v6;

}

void __50__FBScene_PosterUIFoundation___emptySnapshotImage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDF6950];
  v4 = a2;
  objc_msgSend(v2, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  BSRectWithSize();
  objc_msgSend(v4, "fillRect:");

}

void __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke()
{
  uint64_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__fallbackQueue;
  pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__fallbackQueue = Serial;

}

void __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  PUIPosterSnapshotBundleBuilder *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  PUIPosterSnapshotBundleBuilder *v19;
  id v20;
  id v21;
  void *v22;
  id obj;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  PUIPosterSnapshotBundleBuilder *v29;
  id v30;
  char v31;
  _QWORD block[4];
  id v33;
  uint64_t v34;
  PUIPosterSnapshotBundleBuilder *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_3;
  v45[3] = &unk_25154BB88;
  v45[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_onceTokenFallbackImage != -1)
    dispatch_once(&_block_invoke_onceTokenFallbackImage, v45);
  v25 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pui_displayConfigurationIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)v3;
  v4 = -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:]([PUIPosterSnapshotBundleBuilder alloc], "initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:", v3, objc_msgSend(*(id *)(a1 + 40), "pui_userInterfaceStyle"), objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"), objc_msgSend(*(id *)(a1 + 40), "pui_deviceOrientation"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = *(id *)(a1 + 48);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x249515064]();
        objc_msgSend(*(id *)(a1 + 32), "pui_snapshotContextConfiguredForLevelSet:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "createSnapshotWithContext:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_4;
        block[3] = &unk_25154CB00;
        v14 = *(_QWORD *)(a1 + 32);
        v33 = v12;
        v34 = v14;
        v35 = v4;
        v36 = v9;
        v37 = v24;
        v38 = *(id *)(a1 + 48);
        v39 = v11;
        v40 = v25;
        v15 = v11;
        v16 = v12;
        dispatch_async(v13, block);

        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v6);
  }

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_5;
  v26[3] = &unk_25154CB28;
  v27 = v25;
  v28 = v24;
  v17 = *(NSObject **)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v31 = *(_BYTE *)(a1 + 72);
  v29 = v4;
  v30 = v18;
  v19 = v4;
  v20 = v24;
  v21 = v25;
  dispatch_async(v17, v26);

}

id __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_emptySnapshotImage");
}

void __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  if (objc_msgSend(*(id *)(a1 + 32), "capture"))
  {
    objc_msgSend(*(id *)(a1 + 32), "IOSurface");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "interfaceOrientation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAttachment:forKey:", v5, kPaperboardIOSurfaceInterfaceOrientationPropertiesKey);

    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "pui_deviceOrientation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAttachment:forKey:", v8, kPaperboardIOSurfaceDeviceOrientationPropertiesKey);

    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAttachment:forKey:", v11, kPaperboardIOSurfaceDeviceScalePropertiesKey);

  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v26 = 0;
  v15 = objc_msgSend(v13, "captureSnapshot:forLevelSet:error:", v12, v14, &v26);
  v16 = v26;
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 56));
  }
  else if (objc_msgSend(*(id *)(a1 + 72), "count") == 1)
  {
    v17 = *(void **)(a1 + 56);
    +[PUIPosterLevelSet floatingLevelSet](PUIPosterLevelSet, "floatingLevelSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v17, "isEqualToLevelSet:", v18);

    if ((_DWORD)v17)
    {
      objc_msgSend(*(id *)(a1 + 40), "layerManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      objc_msgSend(*(id *)(a1 + 80), "layersToExclude");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v21 == v23)
      {
        v24 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "_emptySnapshotImage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setImage:forLevelSet:", v25, *(_QWORD *)(a1 + 56));

        objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 56));
        goto LABEL_11;
      }
    }
  }
  if (!v16)
    return;
  objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 56));
LABEL_11:

}

void __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  double v18;
  PUIColorStatistics *v19;
  PUIColorStatistics *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(*(id *)(a1 + 32), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arrayWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD10D8];
    v6 = (void *)objc_msgSend(v4, "copy");
    v27[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pui_errorWithCode:userInfo:", 7, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    goto LABEL_13;
  v21 = (void *)MEMORY[0x24BDD1540];
  v24 = *MEMORY[0x24BDD0FD8];
  v25 = CFSTR("No image data was returned by any capture method.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pui_errorWithCode:userInfo:", 7, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
LABEL_13:
    if (*(_BYTE *)(a1 + 64))
    {
      v9 = *(void **)(a1 + 48);
      +[PUIPosterLevelSet compositeLevelSet](PUIPosterLevelSet, "compositeLevelSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "capturedSnapshotForLevelSet:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        +[PUIColorBoxes colorBoxesForImage:](PUIColorBoxes, "colorBoxesForImage:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0xBFF0000000000000;
        v13 = *MEMORY[0x24BDBF028];
        v14 = *(double *)(MEMORY[0x24BDBF028] + 8);
        v15 = *(double *)(MEMORY[0x24BDBF028] + 16);
        v16 = *(double *)(MEMORY[0x24BDBF028] + 24);
        PUIAverageColorFromColorBoxes(v12, *MEMORY[0x24BDBF028], v14, v15, v16, 0.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = PUICalculateContrastFromColorBoxes(v12, 0, (double *)&v23, v13, v14, v15, v16);
        v19 = [PUIColorStatistics alloc];
        v20 = -[PUIColorStatistics initWithAverageColor:contrast:](v19, "initWithAverageColor:contrast:", v17, v18, v23);
        objc_msgSend(*(id *)(a1 + 48), "captureColorStatistics:error:", v20, 0);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    PUILogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke_cold_1(a1, v3, v6);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_24464E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] ack from pui_isInvalidated to %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "pui_setPosterPath:", 0);
    objc_msgSend(*(id *)(a1 + 56), "pui_setPosterComponent:", 0);
    objc_msgSend(*(id *)(a1 + 56), "invalidate");
    v9 = *(_QWORD *)(a1 + 64);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }

}

void __56__FBScene_PosterUIFoundation__pui_postSignificantEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a2;
  objc_msgSend(v5, "pui_setSignificantEventsCounter:", objc_msgSend(v5, "pui_significantEventsCounter") + 1);

  objc_msgSend(v6, "pui_setSignificantEvent:", *(_QWORD *)(a1 + 32));
}

void __64__FBScene_PosterUIFoundation__pui_postUserTapEventWithLocation___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  id v4;

  v2 = *(double *)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "pui_setUserTapEventWithLocation:", v2, v3);
  objc_msgSend(v4, "pui_setUserTapEventsCounter:", objc_msgSend(v4, "pui_userTapEventsCounter") + 1);

}

void __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_24464E000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] ack from pui_isInvalidated to %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);

}

@end

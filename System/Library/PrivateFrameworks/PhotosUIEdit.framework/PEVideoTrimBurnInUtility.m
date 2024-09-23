@implementation PEVideoTrimBurnInUtility

+ (id)burnInTrimToNewAsset:(id)a3 compositionController:(id)a4 asShotCompositionController:(id)a5 cinematographyScript:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[16];
  uint64_t v52;
  _QWORD aBlock[4];
  id v54;
  id v55;

  v13 = a3;
  v41 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = (void *)MEMORY[0x24BDD1768];
  v18 = a4;
  objc_msgSend(v17, "progressWithTotalUnitCount:", 10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "copy");

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke;
  aBlock[3] = &unk_24C619280;
  v21 = v15;
  v54 = v21;
  v42 = v16;
  v55 = v42;
  v22 = _Block_copy(aBlock);
  +[PEVideoTrimBurnInUtility _trimOnlyCompositionControllerFor:](PEVideoTrimBurnInUtility, "_trimOnlyCompositionControllerFor:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filename");
  v52 = 0;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PEVideoTrimBurnInUtility _renderURLForAssetFilename:error:](PEVideoTrimBurnInUtility, "_renderURLForAssetFilename:error:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v39 = v14;
  if (v24)
  {
    v37 = v25;
    v38 = v21;
    PLPhotoEditGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v26, OS_LOG_TYPE_INFO, "PEVideoTrimBurnInUtility beginning render", buf, 2u);
    }

    objc_msgSend(v23, "composition");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_47;
    v43[3] = &unk_24C6192F8;
    v50 = v22;
    v44 = v41;
    v45 = v20;
    v46 = v14;
    v47 = v13;
    v48 = v24;
    v28 = v20;
    v29 = v13;
    v30 = v19;
    v49 = v30;
    v31 = v41;
    +[PEVideoTrimBurnInUtility _renderComposition:toURL:completion:](PEVideoTrimBurnInUtility, "_renderComposition:toURL:completion:", v27, v48, v43);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "addChild:withPendingUnitCount:", v32, 8);
    v33 = v30;
    v13 = v29;
    v20 = v28;

    v34 = v37;
    v21 = v38;
  }
  else
  {
    v34 = v25;
    (*((void (**)(void *, _QWORD, id))v22 + 2))(v22, 0, v25);
    v35 = v19;
    v31 = v41;
  }

  return v19;
}

+ (id)_renderComposition:(id)a3 toURL:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD1580];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v11, "removeItemAtURL:error:", v9, &v21);
  v12 = v21;

  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 0);
  objc_msgSend(v14, "setPriority:", v15);

  objc_msgSend(v14, "setBypassOutputSettingsIfNoComposition:", 1);
  objc_msgSend(v14, "setApplyVideoOrientationAsMetadata:", 1);
  objc_msgSend(v14, "setIncludeCinematicVideoTracks:", 1);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__PEVideoTrimBurnInUtility__renderComposition_toURL_completion___block_invoke;
  v19[3] = &unk_24C619320;
  v20 = v7;
  v16 = v7;
  objc_msgSend(v13, "exportVideoToURL:composition:options:completion:", v9, v10, v14, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)_duplicateAsset:(id)a3 withNewRenderURL:(id)a4 asShotCompositionController:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  void (**v33)(id, _QWORD, id);
  _QWORD *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2379;
  v47 = __Block_byref_object_dispose__2380;
  v48 = 0;
  if (!v11)
    goto LABEL_5;
  v13 = (void *)MEMORY[0x24BE71C68];
  objc_msgSend(v11, "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v13, "adjustmentInformationForComposition:error:", v14, &v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v42;

  if (!v15)
  {
    if (!v16)
    {
      +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 2, CFSTR("Failed to serialize original adjustment data."));
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12[2](v12, 0, v16);
    goto LABEL_10;
  }
  v17 = objc_alloc(MEMORY[0x24BE723D8]);
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE71D40]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE71D48]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE71D38]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v18, v19, v20, 0, 0, 0);

  if (!v21)
  {
    +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 2, CFSTR("Failed to create asset adjustments from original adjustment information."));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v30);

LABEL_10:
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BE72468], "supplementalResourceAAEType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByDeletingPathExtension");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "preferredFilenameExtension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLByAppendingPathExtension:", v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v44[5];
  v44[5] = v25;

  objc_msgSend(v21, "writeToURL:atomically:", v44[5], 0);
LABEL_5:
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__2379;
  v40[4] = __Block_byref_object_dispose__2380;
  v41 = 0;
  objc_msgSend(v9, "photoLibrary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke;
  v35[3] = &unk_24C619348;
  v36 = v9;
  v37 = v10;
  v38 = &v43;
  v39 = v40;
  v31[0] = v28;
  v31[1] = 3221225472;
  v31[2] = __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke_2;
  v31[3] = &unk_24C619370;
  v33 = v12;
  v34 = v40;
  v29 = v27;
  v32 = v29;
  objc_msgSend(v29, "performChanges:completionHandler:", v35, v31);

  _Block_object_dispose(v40, 8);
LABEL_11:
  _Block_object_dispose(&v43, 8);

}

+ (void)_contentEditingInputFor:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setContentMode:", 0);
  objc_msgSend(v7, "setCanHandleRAW:", &__block_literal_global_2373);
  objc_msgSend(v7, "setCanHandleAdjustmentData:", &__block_literal_global_78);
  dispatch_get_global_queue(25, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResultHandlerQueue:", v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke_3;
  v10[3] = &unk_24C619418;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v6, "requestContentEditingInputWithOptions:completionHandler:", v7, v10);

}

+ (id)_compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:(id)a3 trimController:(id)a4 cinematographyScript:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int32_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  CMTime v37;
  CMTime time2;
  CMTime time1;
  _QWORD v40[3];
  CMTime v41;
  _QWORD v42[4];
  id v43;
  _QWORD aBlock[4];
  id v45;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a6)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PEVideoTrimBurnInUtility.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorPointer"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PEVideoTrimBurnInUtility.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trimController"));

LABEL_3:
  v14 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v14, "removeAdjustmentWithKey:", *MEMORY[0x24BE71F38]);
  v15 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke;
  aBlock[3] = &unk_24C619440;
  v16 = v12;
  v45 = v16;
  v17 = _Block_copy(aBlock);
  objc_msgSend(v14, "slomoAdjustmentController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = *MEMORY[0x24BE71F10];
    v42[0] = v15;
    v42[1] = 3221225472;
    v42[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_2;
    v42[3] = &unk_24C619468;
    v43 = v17;
    objc_msgSend(v14, "modifyAdjustmentWithKey:modificationBlock:", v19, v42);

  }
  objc_msgSend(v14, "videoPosterFrameAdjustmentController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    memset(&v41, 0, sizeof(v41));
    objc_msgSend(v14, "videoPosterFrameAdjustmentController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      objc_msgSend(v21, "posterFrameTime");
    else
      memset(v40, 0, sizeof(v40));
    (*((void (**)(CMTime *__return_ptr, void *, _QWORD *))v17 + 2))(&v41, v17, v40);

    time1 = v41;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    v23 = CMTimeCompare(&time1, &time2);
    v24 = *MEMORY[0x24BE71F40];
    if (v23)
    {
      v36[0] = v15;
      v36[1] = 3221225472;
      v36[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_3;
      v36[3] = &__block_descriptor_56_e48_v16__0__PIVideoPosterFrameAdjustmentController_8l;
      v37 = v41;
      objc_msgSend(v14, "modifyAdjustmentWithKey:modificationBlock:", v24, v36);
    }
    else
    {
      objc_msgSend(v14, "removeAdjustmentWithKey:", v24);
    }
  }
  objc_msgSend(v14, "portraitVideoAdjustmentController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v14, "portraitVideoAdjustmentController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cinematographyState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 || !v27)
    {
      v29 = *MEMORY[0x24BE71E40];
      v33[0] = v15;
      v33[1] = 3221225472;
      v33[2] = __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_4;
      v33[3] = &unk_24C6194B0;
      v34 = v16;
      v35 = v13;
      objc_msgSend(v14, "modifyAdjustmentWithKey:modificationBlock:", v29, v33);

      v28 = v34;
    }
    else
    {
      +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 4, CFSTR("Cinematic adjustment is present, but cinematographyScript is nil."));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v14;
      v14 = 0;
    }

  }
  return v14;
}

+ (id)_renderURLForAssetFilename:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("_trim"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PEVideoTrimBurnInUtility _fileExtension](PEVideoTrimBurnInUtility, "_fileExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "temporaryDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v13, 1, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v10, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing asset filename."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 5, v10);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

+ (id)_fileType
{
  return (id)*MEMORY[0x24BDF8548];
}

+ (id)_fileExtension
{
  void *v2;
  void *v3;

  +[PEVideoTrimBurnInUtility _fileType](PEVideoTrimBurnInUtility, "_fileType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFilenameExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_trimOnlyCompositionControllerFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "compositionKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObject:", *MEMORY[0x24BE71F38]);
  objc_msgSend(v8, "removeObject:", *MEMORY[0x24BE71F30]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v4, "removeAdjustmentWithKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), (_QWORD)v15);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BE71F80], "compositionController:setInputOrientation:", v4, objc_msgSend(v3, "imageOrientation"));
  return v4;
}

+ (id)_error:(int64_t)a3 description:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0BA0];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PEVideoTrimBurnInUtilityErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

CMTime *__141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, CMTime *a3@<X8>)
{
  void *v6;
  void *v7;
  void *v8;
  CMTimeRange v10;
  CMTime v11;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime duration;
  CMTimeRange v16;

  memset(&v16, 0, sizeof(v16));
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "endTime");
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v7, "startTime");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&lhs, 0, sizeof(lhs));
  }
  memset(&rhs, 0, sizeof(rhs));
LABEL_6:
  CMTimeSubtract(&duration, &lhs, &rhs);
  *(_OWORD *)&v10.start.value = *MEMORY[0x24BDC0D88];
  v10.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  CMTimeRangeMake(&v16, &v10.start, &duration);
  v8 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v8, "startTime");
  else
    memset(&v11, 0, sizeof(v11));
  *(_OWORD *)&v10.start.value = *(_OWORD *)a2;
  v10.start.epoch = *(_QWORD *)(a2 + 16);
  CMTimeSubtract(&time, &v10.start, &v11);
  v10 = v16;
  return CMTimeClampToRange(a3, &time, &v10);
}

void __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[3];
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  uint64_t v16;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "startTime");
  else
    memset(v14, 0, sizeof(v14));
  (*(void (**)(__int128 *__return_ptr, uint64_t, _QWORD *))(v5 + 16))(&v15, v5, v14);
  v12 = v15;
  v13 = v16;
  objc_msgSend(v4, "setStartTime:", &v12);
  v6 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "endTime");
  else
    memset(v9, 0, sizeof(v9));
  (*(void (**)(__int128 *__return_ptr, uint64_t, _QWORD *))(v6 + 16))(&v10, v6, v9);
  v7 = v10;
  v8 = v11;
  objc_msgSend(v4, "setEndTime:", &v7);

}

uint64_t __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_3(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "setPosterFrameTime:", &v3);
}

void __141__PEVideoTrimBurnInUtility__compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim_trimController_cinematographyScript_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CMTime v6;
  CMTime start;
  CMTimeRange v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    memset(&start, 0, sizeof(start));
    goto LABEL_5;
  }
  objc_msgSend(v4, "startTime");
  v5 = *(void **)(a1 + 32);
  if (!v5)
  {
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  objc_msgSend(v5, "endTime");
LABEL_6:
  CMTimeRangeFromTimeToTime(&v8, &start, &v6);
  objc_msgSend(v3, "trimToTimeRange:usingScript:", &v8, *(_QWORD *)(a1 + 40));

}

void __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDE3790]);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 3, CFSTR("Content editing input request failed."));
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke_2()
{
  return 1;
}

uint64_t __63__PEVideoTrimBurnInUtility__contentEditingInputFor_completion___block_invoke()
{
  return 0;
}

void __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  objc_msgSend(MEMORY[0x24BDE34B8], "creationRequestForAsset");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalFilename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PEVideoTrimBurnInUtility _fileExtension](PEVideoTrimBurnInUtility, "_fileExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setOriginalFilename:", v8);
  +[PEVideoTrimBurnInUtility _fileType](PEVideoTrimBurnInUtility, "_fileType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUniformTypeIdentifier:", v11);

  objc_msgSend(v9, "setShouldMoveFile:", 1);
  objc_msgSend(v21, "addResourceWithType:fileURL:options:", 2, *(_QWORD *)(a1 + 40), v9);
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCreationDate:", v12);

  objc_msgSend(*(id *)(a1 + 32), "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLocation:", v13);

  objc_msgSend(v21, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isHidden"));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE72468], "supplementalResourceAAEType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUniformTypeIdentifier:", v16);

    objc_msgSend(v21, "addResourceWithType:fileURL:options:", 16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v14);
  }
  objc_msgSend(v21, "placeholderForCreatedAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

}

void __100__PEVideoTrimBurnInUtility__duplicateAsset_withNewRenderURL_asShotCompositionController_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDE3488];
    v12[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (!v5)
    {
      +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 2, CFSTR("Failed to create new asset."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __64__PEVideoTrimBurnInUtility__renderComposition_toURL_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void (*v6)(void);
  id v7;

  v7 = 0;
  objc_msgSend(a2, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v4;
  if (v3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (!v4)
    {
      +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 1, CFSTR("Failed to render video."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v9 = "PEVideoTrimBurnInUtility successfully burned in trim to new asset";
    v10 = v8;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 2;
    goto LABEL_8;
  }
  if (!v6)
  {
    +[PEVideoTrimBurnInUtility _error:description:](PEVideoTrimBurnInUtility, "_error:description:", 0, CFSTR("Unknown error."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    v9 = "PEVideoTrimBurnInUtility failed with error: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 12;
LABEL_8:
    _os_log_impl(&dword_20D13D000, v10, v11, v9, buf, v12);
  }
LABEL_9:

  v13 = *(NSObject **)(a1 + 32);
  if (v13)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_44;
    block[3] = &unk_24C619258;
    v17 = *(id *)(a1 + 40);
    v15 = v5;
    v16 = v7;
    dispatch_async(v13, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_47(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[8];
  id v19;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(id *)(a1 + 32);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "trimAdjustmentController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v19 = 0;
      +[PEVideoTrimBurnInUtility _compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:trimController:cinematographyScript:error:](PEVideoTrimBurnInUtility, "_compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:trimController:cinematographyScript:error:", v6, v7, v8, &v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v19;

      if (!v9)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v9 = 0;
    }
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v10, OS_LOG_TYPE_INFO, "PEVideoTrimBurnInUtility creating new asset", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_48;
    v13[3] = &unk_24C6192D0;
    v14 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 80);
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    +[PEVideoTrimBurnInUtility _duplicateAsset:withNewRenderURL:asShotCompositionController:completion:](PEVideoTrimBurnInUtility, "_duplicateAsset:withNewRenderURL:asShotCompositionController:completion:", v11, v12, v9, v13);

    goto LABEL_10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_11:

}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_48(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "setCompletedUnitCount:", 9);
  if (v5)
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_INFO, "PEVideoTrimBurnInUtility requesting content editing input", buf, 2u);
    }

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_49;
    v8[3] = &unk_24C6192A8;
    v9 = a1[4];
    v13 = a1[7];
    v10 = a1[5];
    v11 = a1[6];
    v12 = v5;
    +[PEVideoTrimBurnInUtility _contentEditingInputFor:completion:](PEVideoTrimBurnInUtility, "_contentEditingInputFor:completion:", v12, v8);

  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }

}

void __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 10);
  if (v5)
  {
    v17 = 0;
    +[PESerializationUtility editSourceForContentEditingInput:error:](PESerializationUtility, "editSourceForContentEditingInput:error:", v5, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v7)
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v9, "trimAdjustmentController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v16 = 0;
      +[PEVideoTrimBurnInUtility _compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:trimController:cinematographyScript:error:](PEVideoTrimBurnInUtility, "_compositionControllerWithNormalizedTemporalAdjustmentsForBurnedInTrim:trimController:cinematographyScript:error:", v9, v10, v11, &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;

      if (v12)
      {
        objc_msgSend(v7, "source");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSource:mediaType:", v14, objc_msgSend(v7, "mediaType"));

        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "setAsset:", *(_QWORD *)(a1 + 56));
        objc_msgSend(v15, "setCompositionController:", v12);
        objc_msgSend(v15, "setContentEditingInput:", v5);
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __137__PEVideoTrimBurnInUtility_burnInTrimToNewAsset_compositionController_asShotCompositionController_cinematographyScript_queue_completion___block_invoke_44(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end

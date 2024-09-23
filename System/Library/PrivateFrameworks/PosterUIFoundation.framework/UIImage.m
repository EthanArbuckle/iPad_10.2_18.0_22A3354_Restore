@implementation UIImage

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  PUILogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_cold_1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24464E000, v12, OS_LOG_TYPE_INFO, "pui_determineProminentColorWithCompletion ran successfully", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_23;
  block[3] = &unk_25154BD20;
  v19 = *(id *)(a1 + 32);
  v24 = v6;
  v25 = v19;
  v23 = v5;
  v20 = v6;
  v21 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_23(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getPISchemaClass_softClass;
  v8 = getPISchemaClass_softClass;
  if (!getPISchemaClass_softClass)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getPISchemaClass_block_invoke;
    v4[3] = &unk_25154B958;
    v4[4] = &v5;
    __getPISchemaClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "registerPhotosSchema");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)pui_determineProminentColorWithCompletion__compositionIdentifier;
  pui_determineProminentColorWithCompletion__compositionIdentifier = v2;

}

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BE74D00], "sharedASTCProcessingTransactionQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_4;
    v11[3] = &unk_25154BE60;
    v10 = *(_OWORD *)(a1 + 40);
    v3 = (id)v10;
    v13 = v10;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 56);
    v12 = v4;
    v14 = v5;
    objc_msgSend(v2, "dispatchAsync:", v11);

    v6 = (void *)v13;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FD8];
    v16[0] = CFSTR("source image deallocated before prominent color analysis could be run.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v9);

  }
}

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  id v30;
  dispatch_time_t v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  id v45;
  uint8_t buf[8];
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v2 = (void *)getNUCIImageSourceDefinitionClass_softClass;
  v54 = getNUCIImageSourceDefinitionClass_softClass;
  v3 = MEMORY[0x24BDAC760];
  if (!getNUCIImageSourceDefinitionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v47 = 3221225472;
    v48 = __getNUCIImageSourceDefinitionClass_block_invoke;
    v49 = &unk_25154B958;
    v50 = &v51;
    __getNUCIImageSourceDefinitionClass_block_invoke((uint64_t)buf);
    v2 = (void *)v52[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v51, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithCIImage:orientation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v6 = (void *)getNUGenericCompositionClass_softClass;
  v54 = getNUGenericCompositionClass_softClass;
  if (!getNUGenericCompositionClass_softClass)
  {
    *(_QWORD *)buf = v3;
    v47 = 3221225472;
    v48 = __getNUGenericCompositionClass_block_invoke;
    v49 = &unk_25154B958;
    v50 = &v51;
    __getNUGenericCompositionClass_block_invoke((uint64_t)buf);
    v6 = (void *)v52[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v51, 8);
  v8 = [v7 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithIdentifier:", pui_determineProminentColorWithCompletion__compositionIdentifier);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v10 = (void *)getNUSourceClass_softClass;
  v54 = getNUSourceClass_softClass;
  if (!getNUSourceClass_softClass)
  {
    *(_QWORD *)buf = v3;
    v47 = 3221225472;
    v48 = __getNUSourceClass_block_invoke;
    v49 = &unk_25154B958;
    v50 = &v51;
    __getNUSourceClass_block_invoke((uint64_t)buf);
    v10 = (void *)v52[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v51, 8);
  v12 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAssetIdentifier:", v14);

  objc_msgSend(v12, "setDefinition:", v5);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("source"));
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v42[0] = v3;
  v42[1] = 3221225472;
  v42[2] = __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_5;
  v42[3] = &unk_25154BD70;
  v16 = objc_alloc_init(MEMORY[0x24BE0BDA8]);
  v43 = v16;
  v45 = *(id *)(a1 + 40);
  v17 = v15;
  v44 = v17;
  v18 = (void *)MEMORY[0x2495151FC](v42);
  v26 = (void *)MEMORY[0x249515064]();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v27 = (void *)getPIParallaxColorAnalysisRequestClass_softClass;
  v54 = getPIParallaxColorAnalysisRequestClass_softClass;
  if (!getPIParallaxColorAnalysisRequestClass_softClass)
  {
    *(_QWORD *)buf = v3;
    v47 = 3221225472;
    v48 = __getPIParallaxColorAnalysisRequestClass_block_invoke;
    v49 = &unk_25154B958;
    v50 = &v51;
    __getPIParallaxColorAnalysisRequestClass_block_invoke((uint64_t)buf, v19, v20, v21, v22, v23, v24, v25, v37);
    v27 = (void *)v52[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v51, 8);
  v29 = (void *)objc_msgSend([v28 alloc], "initWithComposition:", v9);
  objc_msgSend(v29, "setSegmentationMatte:", 0);
  objc_msgSend(v29, "setAnalyzeBackground:", 1);
  objc_msgSend(v29, "setMaxDominantColors:", 10);
  objc_msgSend(v29, "setResponseQueue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v29, "setRenderContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v37 = v3;
  v38 = 3221225472;
  v39 = __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_6;
  v40 = &unk_25154BE38;
  v30 = v18;
  v41 = v30;
  objc_msgSend(v29, "submit:", &v37);
  v31 = dispatch_time(0, 20000000000);
  v32 = dispatch_group_wait(v17, v31) == 0;
  PUILogCommon();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v32)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24464E000, v34, OS_LOG_TYPE_INFO, "pui_determineProminentColorWithCompletion finished", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_4_cold_1(v34);

    v35 = (void *)MEMORY[0x24BDD1540];
    v55 = *MEMORY[0x24BDD0FD8];
    v56[0] = CFSTR("Timed out.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1, v37, v38, v39, v40);
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v30 + 2))(v30, 0, v36);

  }
  objc_autoreleasePoolPop(v26);

}

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  objc_msgSend(a2, "result:", &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(v3, "dominantColors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_45);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "bs_filter:", &__block_literal_global_47);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_49);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      v15 = *(_QWORD *)(a1 + 32);
      if (v14)
      {
        objc_msgSend(v13, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);
      }
      else
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v20 = *MEMORY[0x24BDD0FD8];
        v21 = CFSTR("PhotoImaging did not return any colors.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v18);

      }
    }
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FD8];
    v23[0] = CFSTR("PhotoImaging did not return a result.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterUIFoundation"), -1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v9);

  }
}

uint64_t __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", objc_msgSend(a2, "CGColor"));
}

BOOL __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(a2, "pui_hslValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "luminance");
  v4 = v3 > 0.25;

  return v4;
}

uint64_t __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "pui_hsbValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pui_hsbValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "saturation");
  v8 = v7;
  objc_msgSend(v6, "saturation");
  if (v8 > v9)
    v10 = -1;
  else
    v10 = v8 < v9;

  return v10;
}

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24464E000, a2, a3, "pui_determineProminentColorWithCompletion failed to run w/ error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __73__UIImage_PosterUIFoundation__pui_determineProminentColorWithCompletion___block_invoke_4_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24464E000, log, OS_LOG_TYPE_FAULT, "pui_determineProminentColorWithCompletion elapsed 20 second timer.", v1, 2u);
  OUTLINED_FUNCTION_5();
}

@end

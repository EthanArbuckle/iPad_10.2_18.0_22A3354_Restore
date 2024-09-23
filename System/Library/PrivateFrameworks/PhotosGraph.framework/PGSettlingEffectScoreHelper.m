@implementation PGSettlingEffectScoreHelper

+ (float)analyzedSettlingEffectScoreForAsset:(id)a3 requestedOnDemand:(BOOL *)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "mediaAnalysisProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settlingEffectScore");
  v8 = v7;

  if (v8 <= -1.0
    || (objc_msgSend(v5, "mediaAnalysisProperties"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "activityScore"),
        v11 = v10,
        v9,
        v11 == 0.5))
  {
    if (a4)
      *a4 = 1;
    v15 = 0;
    +[PGSettlingEffectScoreHelper requestSettlingEffectScoreForAsset:error:](PGSettlingEffectScoreHelper, "requestSettlingEffectScoreForAsset:error:", v5, &v15);
    v8 = v12;
    v13 = v15;
    if (v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGSettlingEffectScoreHelper] Error requesting settlingEffectScore: %@", buf, 0xCu);
    }

  }
  return v8;
}

+ (float)requestSettlingEffectScoreForAsset:(id)a3 error:(id *)a4
{
  id v5;
  float v6;
  os_log_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  uint64_t v24;
  mach_timebase_info v25;
  NSObject *v26;
  NSObject *v27;
  double v28;
  double v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  _BYTE *v37;
  mach_timebase_info info;
  uint64_t v39;
  float *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  float *v44;
  uint64_t v45;
  int v46;
  uint8_t v47[4];
  double v48;
  __int16 v49;
  double v50;
  id v51;
  _BYTE buf[24];
  double v53;
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[2];
  _QWORD v57[5];

  v57[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0D77EF8], "assetIsEligibleForSettlingEffect:", v5))
  {
    v7 = os_log_create("com.apple.PhotosGraph", "suggestions");
    objc_msgSend(MEMORY[0x1E0D475C0], "analysisService");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = *MEMORY[0x1E0D47630];
    v56[1] = CFSTR("AllowStreaming");
    v57[0] = MEMORY[0x1E0C9AAB0];
    v57[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaAnalysisProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "settlingEffectScore");
      v13 = v12;
      objc_msgSend(v9, "activityScore");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      v53 = v14;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "[PGSettlingEffectScoreHelper] Requesting settlingEffectScore for asset:%@. (current SettlingEffectScore:%.2f, ActivityScore:%.2f)", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v53 = COERCE_DOUBLE(__Block_byref_object_copy__58432);
    v54 = __Block_byref_object_dispose__58433;
    v55 = 0;
    v43 = 0;
    v44 = (float *)&v43;
    v45 = 0x2020000000;
    v46 = 0;
    v39 = 0;
    v40 = (float *)&v39;
    v41 = 0x2020000000;
    v42 = 0;
    v15 = dispatch_semaphore_create(0);
    v16 = v10;
    v17 = os_signpost_id_generate(v16);
    v18 = v16;
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SettingEffectScoreRequest", ", v47, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v20 = mach_absolute_time();
    v51 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __72__PGSettlingEffectScoreHelper_requestSettlingEffectScoreForAsset_error___block_invoke_2;
    v32[3] = &unk_1E8433188;
    v33 = v5;
    v35 = &v43;
    v36 = &v39;
    v37 = buf;
    v22 = v15;
    v34 = v22;
    objc_msgSend(v31, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", 0x40000, v21, v8, &__block_literal_global_58437, v32);

    v23 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v22, v23);
    v24 = mach_absolute_time();
    v25 = info;
    v26 = v19;
    v27 = v26;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_END, v17, "SettingEffectScoreRequest", ", v47, 2u);
    }

    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v47 = 136315394;
      v48 = COERCE_DOUBLE("SettingEffectScoreRequest");
      v49 = 2048;
      v50 = (float)((float)((float)((float)(v24 - v20) * (float)v25.numer) / (float)v25.denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v47, 0x16u);
    }
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = v44[6];
      v29 = v40[6];
      *(_DWORD *)v47 = 134218240;
      v48 = v28;
      v49 = 2048;
      v50 = v29;
      _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[PGSettlingEffectScoreHelper] settlingEffectScore:%.2f, activityScore:%.2f", v47, 0x16u);
    }
    v6 = v44[6];

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(buf, 8);

  }
  return v6;
}

void __72__PGSettlingEffectScoreHelper_requestSettlingEffectScoreForAsset_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D475A8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D47590]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D47548]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RankingLevel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;

  }
  else
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = v5;
    v9 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end

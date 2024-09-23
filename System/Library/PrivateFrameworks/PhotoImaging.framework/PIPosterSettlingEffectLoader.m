@implementation PIPosterSettlingEffectLoader

+ (id)_resolveOptions:(id)a3 forResource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  const __CFAllocator *v17;
  CFDictionaryRef v18;
  id result;
  void *v20;
  void *v21;
  CMTime time;
  CMTime v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "needsInProcessHandling"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23.value = 0;
  *(_QWORD *)&v23.timescale = &v23;
  v23.epoch = 0x2020000000;
  v10 = (_QWORD *)getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  v24 = getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr)
  {
    v11 = MediaAnalysisLibrary();
    v10 = dlsym(v11, "VCPMediaAnalysisService_InProcessOption");
    *(_QWORD *)(*(_QWORD *)&v23.timescale + 24) = v10;
    getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v23, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVCPMediaAnalysisService_InProcessOption(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PIPosterSettlingEffectLoader.m"), 53, CFSTR("%s"), dlerror());
LABEL_16:

    __break(1u);
    return result;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isInteractiveRequest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23.value = 0;
  *(_QWORD *)&v23.timescale = &v23;
  v23.epoch = 0x2020000000;
  v13 = (_QWORD *)getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr;
  v24 = getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr)
  {
    v14 = MediaAnalysisLibrary();
    v13 = dlsym(v14, "VCPMediaAnalysisService_UserInitiatedModeOption");
    *(_QWORD *)(*(_QWORD *)&v23.timescale + 24) = v13;
    getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v23, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVCPMediaAnalysisService_UserInitiatedModeOption(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PIPosterSettlingEffectLoader.m"), 54, CFSTR("%s"), dlerror());
    goto LABEL_16;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *v13);

  v23.value = 0;
  *(_QWORD *)&v23.timescale = &v23;
  v23.epoch = 0x2020000000;
  v15 = (_QWORD *)getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
  v24 = getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr)
  {
    v16 = MediaAnalysisLibrary();
    v15 = dlsym(v16, "VCPMediaAnalysisService_AllowOnDemandOption");
    *(_QWORD *)(*(_QWORD *)&v23.timescale + 24) = v15;
    getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v23, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVCPMediaAnalysisService_AllowOnDemandOption(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PIPosterSettlingEffectLoader.m"), 52, CFSTR("%s"), dlerror());
    goto LABEL_16;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v15);
  memset(&v23, 0, sizeof(v23));
  objc_msgSend(a1, "_livePhotoKeyFrameTimeForResource:", v7);
  if ((v23.flags & 1) != 0)
  {
    v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    time = v23;
    v18 = CMTimeCopyAsDictionary(&time, v17);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("LivePhotoKeyFrameTimestamp"));

  }
  return v8;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_livePhotoKeyFrameTimeForResource:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  PICompositionController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "adjustmentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v18 = 0;
    objc_msgSend(a2, "originalCompositionForResource:error:", v6, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (v8)
    {
      v10 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v8);
      -[PICompositionController livePhotoKeyFrameAdjustmentController](v10, "livePhotoKeyFrameAdjustmentController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        retstr->var0 = 0;
        *(_QWORD *)&retstr->var1 = 0;
        retstr->var3 = 0;
        objc_msgSend(v11, "keyFrameTime");
      }
      else
      {
        v16 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
        retstr->var3 = *(_QWORD *)(v16 + 16);
      }

    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7012);
      v14 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v9;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Failed to load original composition for settling effect resource, error: %{public}@", buf, 0xCu);
      }
      v15 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
      retstr->var3 = *(_QWORD *)(v15 + 16);
    }

  }
  else
  {
    v13 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v13 + 16);
  }

  return result;
}

+ (unint64_t)_gatingFlagsFromMADStatus:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  id *v10;
  void *v11;
  id v12;
  id *v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[5];
  id v47;
  const __CFString *v48;
  const __CFString *v49;
  _QWORD v50[9];

  v50[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v4 = (id *)getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr;
  v45 = getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr)
  {
    v5 = MediaAnalysisLibrary();
    v4 = (id *)dlsym(v5, "MediaAnalysisResultSettlingEffectMissingMetadataKey");
    v43[3] = (uint64_t)v4;
    getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v42, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectMissingMetadataKey(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PIPosterSettlingEffectLoader.m"), 46, CFSTR("%s"), dlerror());

    goto LABEL_26;
  }
  v6 = *v4;
  v46[0] = v6;
  v50[0] = &unk_1E50512E0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v7 = (id *)getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr;
  v45 = getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr)
  {
    v8 = MediaAnalysisLibrary();
    v7 = (id *)dlsym(v8, "MediaAnalysisResultSettlingEffectStabilizationFailureKey");
    v43[3] = (uint64_t)v7;
    getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v42, 8);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectStabilizationFailureKey(void)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PIPosterSettlingEffectLoader.m"), 47, CFSTR("%s"), dlerror());

    goto LABEL_26;
  }
  v9 = *v7;
  v46[1] = v9;
  v50[1] = &unk_1E50512F8;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v10 = (id *)getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr;
  v45 = getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr)
  {
    v11 = MediaAnalysisLibrary();
    v10 = (id *)dlsym(v11, "MediaAnalysisResultSettlingEffectVideoQualityGatingFailureKey");
    v43[3] = (uint64_t)v10;
    getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v42, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKey(void)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PIPosterSettlingEffectLoader.m"), 48, CFSTR("%s"), dlerror());

    goto LABEL_26;
  }
  v12 = *v10;
  v46[2] = v12;
  v50[2] = &unk_1E5051310;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v13 = (id *)getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr;
  v45 = getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr)
  {
    v14 = MediaAnalysisLibrary();
    v13 = (id *)dlsym(v14, "MediaAnalysisResultSettlingEffectMetadataIntegrityFailureKey");
    v43[3] = (uint64_t)v13;
    getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v42, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKey(void)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PIPosterSettlingEffectLoader.m"), 49, CFSTR("%s"), dlerror());

    goto LABEL_26;
  }
  v15 = *v13;
  v46[3] = v15;
  v50[3] = &unk_1E5051328;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v16 = (id *)getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr;
  v45 = getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr)
  {
    v17 = MediaAnalysisLibrary();
    v16 = (id *)dlsym(v17, "MediaAnalysisResultSettlingEffectFRCGatingFailureKey");
    v43[3] = (uint64_t)v16;
    getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v42, 8);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectFRCGatingFailureKey(void)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("PIPosterSettlingEffectLoader.m"), 50, CFSTR("%s"), dlerror());

    goto LABEL_26;
  }
  v18 = *v16;
  v46[4] = v18;
  v50[4] = &unk_1E5051340;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v19 = (id *)getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr;
  v45 = getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr)
  {
    v20 = MediaAnalysisLibrary();
    v19 = (id *)dlsym(v20, "MediaAnalysisResultSettlingEffectStillTransitionGatingFailureKey");
    v43[3] = (uint64_t)v19;
    getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v42, 8);
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKey(void)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("PIPosterSettlingEffectLoader.m"), 51, CFSTR("%s"), dlerror());

LABEL_26:
    __break(1u);
  }
  v47 = *v19;
  v48 = CFSTR("settlingEffectMinSettlingDurationThresholdFailure");
  v50[5] = &unk_1E5051358;
  v50[6] = &unk_1E5051370;
  v49 = CFSTR("settlingEffectLivePhotoKeyFrameTimeOutOfBoundFailure");
  v50[7] = &unk_1E5051370;
  v21 = (void *)MEMORY[0x1E0C99D80];
  v22 = v47;
  objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v50, v46, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __58__PIPosterSettlingEffectLoader__gatingFlagsFromMADStatus___block_invoke;
  v39[3] = &unk_1E50169F0;
  v24 = v23;
  v40 = v24;
  v41 = &v42;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v39);
  v25 = v43[3];

  _Block_object_dispose(&v42, 8);
  return v25;
}

+ (int)loadCropRectWithResource:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t, _QWORD, double, double, double, double);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, uint64_t, uint64_t, _QWORD, double, double, double, double);
  id v32;
  _QWORD v33[4];
  void (**v34)(id, uint64_t, uint64_t, _QWORD, double, double, double, double);
  uint8_t buf[16];
  uint64_t v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t, _QWORD, double, double, double, double))a5;
  objc_msgSend(v8, "imageFileURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        objc_msgSend(v8, "videoFileURL"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_msgSend(v8, "adjustmentData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v36 = 0;
      if ((objc_msgSend(a1, "canHandleEditedLivePhotoResource:error:", v8, &v36) & 1) == 0)
      {
        v10[2](v10, 1, 256, v36, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
        goto LABEL_13;
      }
    }
    +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "disableMADForSettlingEffect");

    if (!v16)
    {
      objc_msgSend(a1, "_resolveOptions:forResource:", v9, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(getVCPMediaAnalysisServiceClass(), "sharedAnalysisService");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageFileURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v26;
      objc_msgSend(v8, "videoFileURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke_2;
      v29[3] = &unk_1E5016A18;
      v30 = v8;
      v31 = v10;
      v32 = a1;
      v22 = objc_msgSend(v25, "requestAnalysisTypes:forAssetWithResourceURLs:withOptions:progressHandler:andCompletionHandler:", 0x10000000000, v28, v24, 0, v29);

      goto LABEL_14;
    }
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7012);
    v17 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6382000, v17, OS_LOG_TYPE_DEFAULT, "MAD for settling effect is disabled", buf, 2u);
    }
    v18 = +[PIPhotoEditHelper newComposition](PIPhotoEditHelper, "newComposition");
    objc_msgSend(v8, "videoFileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIPhotoEditHelper videoSourceWithURL:](PIPhotoEditHelper, "videoSourceWithURL:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("source"));
    objc_msgSend(v18, "setMediaType:", 2);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52330]), "initWithComposition:", v18);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke;
    v33[3] = &unk_1E5019A68;
    v34 = v10;
    objc_msgSend(v21, "submit:", v33);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Resource is missing image and/or video URLs"), v8);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, uint64_t, id, double, double, double, double))v10)[2](v10, 1, 128, v18, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }

LABEL_13:
  v22 = 0;
LABEL_14:

  return v22;
}

+ (BOOL)extractCropRect:(CGRect *)a3 fromStabilizationResultAttributes:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  CGSize v13;
  id v14;
  BOOL v15;
  id v16;
  BOOL v17;
  double height;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  id v24;
  NSObject *v26;
  void *v27;
  void *specific;
  NSObject *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  CGSize size;
  CGRect rect;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    NUAssertLogger_6935();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "outCropRect != NULL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(rect.origin.x) = 138543362;
      *(_QWORD *)((char *)&rect.origin.x + 4) = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);

    }
    v9 = (_QWORD *)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
      goto LABEL_40;
    if (!v30)
      goto LABEL_48;
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    LODWORD(rect.origin.x) = 138543362;
    *(_QWORD *)((char *)&rect.origin.x + 4) = v9;
    _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&rect, 0xCu);

    goto LABEL_48;
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_6935();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "stabResultAttributes != nil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(rect.origin.x) = 138543362;
      *(_QWORD *)((char *)&rect.origin.x + 4) = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);

    }
    v9 = (_QWORD *)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v29 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v34)
      {
        v45 = dispatch_get_specific((const void *)*v9);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(rect.origin.x) = 138543618;
        *(_QWORD *)((char *)&rect.origin.x + 4) = v45;
        WORD2(rect.origin.y) = 2114;
        *(_QWORD *)((char *)&rect.origin.y + 6) = v48;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);

      }
      goto LABEL_48;
    }
    if (!v34)
      goto LABEL_48;
    goto LABEL_37;
  }
  if (!a5)
  {
    NUAssertLogger_6935();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(rect.origin.x) = 138543362;
      *(_QWORD *)((char *)&rect.origin.x + 4) = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);

    }
    v9 = (_QWORD *)MEMORY[0x1E0D51D48];
    v37 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v29 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v38)
      {
        v49 = dispatch_get_specific((const void *)*v9);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(rect.origin.x) = 138543618;
        *(_QWORD *)((char *)&rect.origin.x + 4) = v49;
        WORD2(rect.origin.y) = 2114;
        *(_QWORD *)((char *)&rect.origin.y + 6) = v52;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);

      }
      goto LABEL_48;
    }
    if (!v38)
      goto LABEL_48;
    goto LABEL_37;
  }
  rect.origin.x = 0.0;
  *(_QWORD *)&rect.origin.y = &rect;
  *(_QWORD *)&rect.size.width = 0x2020000000;
  v9 = (_QWORD *)getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr;
  *(_QWORD *)&rect.size.height = getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr)
  {
    v10 = MediaAnalysisLibrary();
    v9 = dlsym(v10, "MediaAnalysisResultsStabilizationCropAttributeKey");
    *(_QWORD *)(*(_QWORD *)&rect.origin.y + 24) = v9;
    getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&rect, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultsStabilizationCropAttributeKey(void)");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInFunction:file:lineNumber:description:](v29, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("PIPosterSettlingEffectLoader.m"), 42, CFSTR("%s"), dlerror());

    while (1)
    {
      __break(1u);
LABEL_40:
      if (v30)
      {
        v41 = dispatch_get_specific((const void *)*v9);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(rect.origin.x) = 138543618;
        *(_QWORD *)((char *)&rect.origin.x + 4) = v41;
        WORD2(rect.origin.y) = 2114;
        *(_QWORD *)((char *)&rect.origin.y + 6) = v44;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);

      }
LABEL_48:

      v30 = _NUAssertFailHandler();
    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SourceSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  rect.size = v13;
  v14 = v11;
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_18;
  }
  v15 = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v14, &rect);

  if (!v15)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid settling effect stabilization crop rect"), v14);
    v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v23 = 0;
    *a5 = v24;
    goto LABEL_20;
  }
  size = (CGSize)*MEMORY[0x1E0C9D820];
  v16 = v12;
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_22;
  }
  v17 = CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)v16, &size);

  if (!v17)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid settling effect stabilization source size"), v16);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (size.width <= size.height)
    height = size.height;
  else
    height = size.width;
  v19 = height / size.height;
  v20 = rect.size.height;
  v21 = rect.origin.y * (height / size.height) + 0.5;
  v22 = rect.size.width * (height / size.width);
  a3->origin.x = rect.origin.x * (height / size.width) + 0.5;
  a3->origin.y = v21;
  a3->size.width = v22;
  a3->size.height = v19 * v20;
  v23 = 1;
LABEL_20:

  return v23;
}

+ (int)loadVideoWithResource:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(id, _QWORD, uint64_t, uint64_t, uint64_t);
  id v31;
  uint64_t v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t, uint64_t, uint64_t))a5;
  objc_msgSend(v8, "imageFileURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        objc_msgSend(v8, "videoFileURL"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_msgSend(v8, "adjustmentData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (v32 = 0, (objc_msgSend(a1, "canHandleEditedLivePhotoResource:error:", v8, &v32) & 1) == 0))
    {
      v10[2](v10, 0, 1, 256, v32);
    }
    else
    {
      +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "disableMADForSettlingEffect");

      if (!v16)
      {
        objc_msgSend(a1, "_resolveOptions:forResource:", v9, v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(getVCPMediaAnalysisServiceClass(), "sharedAnalysisService");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "imageFileURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v24;
        objc_msgSend(v8, "videoFileURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke;
        v27[3] = &unk_1E5016A68;
        v28 = v8;
        v30 = v10;
        v31 = a1;
        v29 = v9;
        v20 = objc_msgSend(v23, "requestAnalysisTypes:forAssetWithResourceURLs:withOptions:progressHandler:andCompletionHandler:", 0x4000000000, v26, v22, 0, v27);

        goto LABEL_12;
      }
      if (objc_msgSend(v9, "isInteractiveRequest"))
        v17 = 3;
      else
        v17 = 5;
      objc_msgSend(v8, "videoFileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, uint64_t, uint64_t, uint64_t))v10)[2](v10, v18, v17, 0, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Resource is missing image and/or video URLs"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, 1, 128, (uint64_t)v19);

  }
  v20 = 0;
LABEL_12:

  return v20;
}

+ (BOOL)_canLoadVideoAtURL:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithData:contentType:options:", v4, *MEMORY[0x1E0C8A2E8], MEMORY[0x1E0C9AA70]);

  return 1;
}

+ (void)cancelRequest:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(getVCPMediaAnalysisServiceClass(), "sharedAnalysisService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequest:", v3);

}

+ (BOOL)canHandleEditedLivePhotoResource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  PICompositionController *v9;
  void *v10;
  char v11;
  const __CFString *v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  id v18;

  v6 = a3;
  v18 = 0;
  objc_msgSend(a1, "originalCompositionForResource:error:", v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (v7)
  {
    v9 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v7);
    -[PICompositionController autoLoopAdjustmentController](v9, "autoLoopAdjustmentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "enabled");

    if ((v11 & 1) != 0)
    {
      v12 = CFSTR("AutoLoop adjustment is not supported");
    }
    else
    {
      -[PICompositionController portraitAdjustmentController](v9, "portraitAdjustmentController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "enabled"))
      {

      }
      else
      {
        -[PICompositionController depthAdjustmentController](v9, "depthAdjustmentController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "enabled");

        if (!v16)
        {
          v13 = 1;
          goto LABEL_10;
        }
      }
      v12 = CFSTR("Portrait and depth adjustments are not supported");
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", v12, v7);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get original composition for live photo resource"), v6, v8);
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

+ (BOOL)adjustCropRect:(CGRect *)a3 forEditedLivePhotoResource:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  NSObject *v15;
  const void **v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  const void **v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  const void **v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  const void **v33;
  void *v34;
  int v35;
  void *v36;
  const void **v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint8_t buf[4];
  const void **v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!a3)
  {
    NUAssertLogger_6935();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inoutCropRect != NULL");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v38 = dispatch_get_specific(*v17);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = (const void **)v38;
        v58 = 2114;
        v59 = v41;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v17;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v25 = _NUAssertFailHandler();
    goto LABEL_32;
  }
  v9 = v8;
  if (!v8)
  {
    NUAssertLogger_6935();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "resource != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v17;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_34:

      v30 = _NUAssertFailHandler();
      goto LABEL_35;
    }
LABEL_32:
    if (v25)
    {
      v42 = dispatch_get_specific(*v17);
      v43 = (void *)MEMORY[0x1E0CB3978];
      v44 = v42;
      objc_msgSend(v43, "callStackSymbols");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v42;
      v58 = 2114;
      v59 = v45;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "type") != 6)
  {
    NUAssertLogger_6935();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "resource.type == PFParallaxAssetResourceTypeLiveOriginal");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v19 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v17;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_37:

      v35 = _NUAssertFailHandler();
      goto LABEL_38;
    }
LABEL_35:
    if (v30)
    {
      v46 = dispatch_get_specific(*v17);
      v47 = (void *)MEMORY[0x1E0CB3978];
      v48 = v46;
      objc_msgSend(v47, "callStackSymbols");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v46;
      v58 = 2114;
      v59 = v49;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_37;
  }
  objc_msgSend(v9, "adjustmentData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    NUAssertLogger_6935();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "resource.adjustmentData != nil");
      v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v34 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v19 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v37;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_40;
    }
LABEL_38:
    if (v35)
    {
      v50 = dispatch_get_specific(*v17);
      v51 = (void *)MEMORY[0x1E0CB3978];
      v52 = v50;
      objc_msgSend(v51, "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v50;
      v58 = 2114;
      v59 = v54;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_40:

    _NUAssertFailHandler();
  }
  v55 = 0;
  objc_msgSend(a1, "originalCompositionForResource:error:", v9, &v55);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v55;
  if (v11)
  {
    v13 = objc_msgSend(a1, "adjustCropRect:outputRect:outputExtent:forComposition:applyOrientation:error:", a3, 0, v11, 1, a5, a3->origin.x, a3->origin.y, a3->size.width, a3->size.height);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get original composition for live photo resource"), v9, v12);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (BOOL)adjustCropRect:(CGRect)a3 outputRect:(CGRect *)a4 outputExtent:(CGRect *)a5 forComposition:(id)a6 applyOrientation:(BOOL)a7 error:(id *)a8
{
  void *v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v13;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *specific;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  const void **v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  CGRect *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  NSObject *v68;
  const void **v69;
  _BOOL4 v70;
  NSObject *v71;
  const void **v72;
  int v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  double v78;
  const void **v79;
  double log;
  NSObject *loga;
  double v82;
  CGRect *v83;
  double v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  id *v95;
  _BOOL4 v96;
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  uint8_t buf[4];
  const void **v105;
  __int16 v106;
  CGRect *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  void *v112;
  _QWORD v113[4];
  CGRect v114;
  CGRect v115;

  v13 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = buf;
  v113[1] = *MEMORY[0x1E0C80C00];
  v21 = a6;
  if (!a4)
  {
    NUAssertLogger_6935();
    v68 = objc_claimAutoreleasedReturnValue();
    v27 = "outCropRect != NULL";
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "outCropRect != NULL");
      v69 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v69;
      _os_log_error_impl(&dword_1A6382000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v22 = objc_claimAutoreleasedReturnValue();
    v70 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v70)
      {
        specific = dispatch_get_specific(*v28);
        v74 = (void *)MEMORY[0x1E0CB3978];
        v75 = specific;
        objc_msgSend(v74, "callStackSymbols");
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        a4 = (CGRect *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v105 = (const void **)specific;
        v106 = 2114;
        v107 = a4;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v70)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v28;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v73 = _NUAssertFailHandler();
    goto LABEL_36;
  }
  v22 = v21;
  if (!v21)
  {
    NUAssertLogger_6935();
    v71 = objc_claimAutoreleasedReturnValue();
    v27 = "composition != nil";
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v72 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v72;
      _os_log_error_impl(&dword_1A6382000, v71, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v22 = objc_claimAutoreleasedReturnValue();
    v73 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v73)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v105 = v28;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_38:

      _NUAssertFailHandler();
      goto LABEL_39;
    }
LABEL_36:
    if (v73)
    {
      specific = dispatch_get_specific(*v28);
      v76 = (void *)MEMORY[0x1E0CB3978];
      v77 = specific;
      objc_msgSend(v76, "callStackSymbols");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      a4 = (CGRect *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v105 = (const void **)specific;
      v106 = 2114;
      v107 = a4;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_38;
  }
  v96 = v13;
  specific = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52100]), "initWithComposition:", v21);
  +[PIPipelineFilters noOrientationFilter](PIPipelineFilters, "noOrientationFilter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(specific, "setPipelineFilters:", v25);

  v103 = 0;
  objc_msgSend(specific, "submitSynchronous:", &v103);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (char *)v103;
  objc_msgSend(v26, "geometry");
  v28 = (const void **)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v95 = a8;
    +[PIPipelineFilters noGeometryFilter](PIPipelineFilters, "noGeometryFilter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(specific, "setPipelineFilters:", v30);

    v102 = 0;
    objc_msgSend(specific, "submitSynchronous:", &v102);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (char *)v102;

    objc_msgSend(v31, "geometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input image geometry"), v22, v32);
      LOBYTE(v55) = 0;
      *v95 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v32;
LABEL_21:

      goto LABEL_22;
    }
    v88 = x;
    v90 = y;
    v92 = width;
    v94 = height;
    objc_msgSend(v8, "extent");
    NUPixelRectToCGRect();
    v10 = v33;
    y = v34;
    x = v35;
    v11 = v36;
    objc_msgSend(v28, "extent");
    NUPixelRectToCGRect();
    v38 = v37;
    v9 = v39;
    v41 = v40;
    v43 = v42;
    v101 = 0;
    objc_msgSend(v28, "transformWithSourceSpace:destinationSpace:error:", CFSTR("/pre-Geometry"), CFSTR("/pre-Orientation"), &v101);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (char *)v101;

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get image geometry transform"), v28, v27);
      LOBYTE(v55) = 0;
      *v95 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v82 = y + v90 * v11;
    v84 = v10 + v88 * x;
    v78 = v94 * v11;
    log = v92 * x;
    objc_msgSend(MEMORY[0x1E0D52080], "adjustCropRect:inputExtent:geometryTransform:", v20, v38, v9, v41, v43);
    v89 = v38;
    v91 = v43;
    v115.origin.x = v38;
    v115.origin.y = v9;
    v93 = v41;
    v115.size.width = v41;
    v115.size.height = v43;
    CGRectIntersection(v114, v115);
    NUPixelRectFromCGRect();
    NUPixelRectToCGRect();
    v86 = v45;
    v87 = v44;
    width = v46;
    height = v47;
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_7:
      v48 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)MEMORY[0x1E0CB3B18];
        *(double *)v100 = v84;
        *(double *)&v100[1] = v82;
        *(double *)&v100[2] = log;
        *(double *)&v100[3] = v78;
        loga = v48;
        v83 = a5;
        objc_msgSend(v49, "valueWithBytes:objCType:", v100, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v79 = (const void **)objc_claimAutoreleasedReturnValue();
        *(double *)v99 = v10;
        *(double *)&v99[1] = y;
        *(double *)&v99[2] = x;
        *(double *)&v99[3] = v11;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v99, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v50 = (CGRect *)objc_claimAutoreleasedReturnValue();
        v98[0] = v87;
        v98[1] = v86;
        *(CGFloat *)&v98[2] = width;
        *(CGFloat *)&v98[3] = height;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v98, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v85 = v20;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)v97 = v89;
        *(double *)&v97[1] = v9;
        *(double *)&v97[2] = v93;
        *(double *)&v97[3] = v91;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v97, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v105 = v79;
        v106 = 2112;
        v107 = v50;
        v108 = 2112;
        v109 = v51;
        v110 = 2112;
        v111 = v52;
        _os_log_impl(&dword_1A6382000, loga, OS_LOG_TYPE_DEFAULT, "Adjust FRC crop rect: %@ [%@], output rect: %@ [%@]", buf, 0x2Au);

        a5 = v83;
        v20 = v85;

      }
      if (!v96)
      {
        v62 = v91;
        v60 = v93;
        v57 = v89;
LABEL_16:
        NURectNormalize();
        a4->origin.x = v63;
        a4->origin.y = v64;
        a4->size.width = v65;
        a4->size.height = v66;
        if (a5)
        {
          a5->origin.x = v57;
          a5->origin.y = v9;
          LOBYTE(v55) = 1;
          a5->size.width = v60;
          a5->size.height = v62;
        }
        else
        {
          LOBYTE(v55) = 1;
        }
        goto LABEL_20;
      }
      v53 = +[PIPhotoEditHelper newCompositionControllerWithComposition:](PIPhotoEditHelper, "newCompositionControllerWithComposition:", v22);
      objc_msgSend(v53, "orientationAdjustmentController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v54)
      {
        objc_msgSend(v54, "orientation");
        objc_msgSend(v28, "size");
        NUOrientationTransformRect();
        objc_msgSend(v28, "size");
        NUOrientationTransformRect();
        v57 = v56;
        v9 = v58;
        v60 = v59;
        v62 = v61;

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Missing orientation adjustment"), v22);
      *v95 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
      goto LABEL_21;
    }
LABEL_39:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7012);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get output image geometry"), v22, v27);
  LOBYTE(v55) = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return (char)v55;
}

+ (CGRect)effectiveCropRect:(CGRect)a3 forResource:(id)a4 error:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  const void **v35;
  void *specific;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint8_t buf[32];
  _QWORD v49[2];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v49[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  if (!a5)
  {
    NUAssertLogger_6935();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v38)
      {
        v41 = dispatch_get_specific(*v35);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v45;
        _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v40;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v12 = v11;
  v47 = 0;
  objc_msgSend(a1, "originalCompositionForResource:error:", v11, &v47);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v47;
  if (v13)
  {
    v15 = +[PIPhotoEditHelper newCompositionControllerWithComposition:](PIPhotoEditHelper, "newCompositionControllerWithComposition:", v13);
    objc_msgSend(v15, "livePhotoKeyFrameAdjustmentController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52330]), "initWithComposition:", v13);
      +[PIPipelineFilters noGeometryFilter](PIPipelineFilters, "noGeometryFilter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPipelineFilters:", v19);

      v46 = 0;
      objc_msgSend(v17, "submitSynchronous:", &v46);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v46;

      objc_msgSend(v20, "properties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        memset(buf, 0, sizeof(buf));
        objc_msgSend(v22, "cleanAperture");
        objc_msgSend(v22, "size");
        NUPixelRectNormalize();
        x = x - v26;
        v27 = 0.0;
        v28 = 0.0;
        if (v24 != 0.0)
        {
          x = x / v24;
          v28 = width / v24;
        }
        y = y - v23;
        if (v25 != 0.0)
        {
          y = y / v25;
          v27 = height / v25;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get video properties"), v13, v21);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        x = *MEMORY[0x1E0C9D628];
        y = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v28 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v27 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }

      v14 = v21;
    }
    else
    {
      v28 = width;
      v27 = height;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load original composition for resource"), v12, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v28 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v29 = x;
  v30 = y;
  v31 = v28;
  v32 = v27;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

+ (void)adjustVideo:(id)a3 cropRect:(CGRect)a4 forResource:(id)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  void (**v39)(id, _QWORD, id);
  _QWORD v40[4];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _OWORD v52[2];
  __int128 v53;
  __int128 v54;
  id v55;
  id v56[2];
  CGRect v57;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, id))a6;
  v56[0] = 0;
  objc_msgSend(a1, "effectiveCropRect:forResource:error:", v14, v56, x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = v56[0];
  v57.origin.x = v17;
  v57.origin.y = v19;
  v57.size.width = v21;
  v57.size.height = v23;
  if (CGRectIsNull(v57))
  {
    v15[2](v15, 0, v24);
  }
  else
  {
    v55 = 0;
    objc_msgSend(a1, "adjustedCompositionForResource:videoURL:cropRect:error:", v14, v13, &v55, v17, v19, v21, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v55;

    if (v25)
    {
      v53 = 0u;
      v54 = 0u;
      memset(v52, 0, sizeof(v52));
      v51 = 0;
      v27 = objc_msgSend(a1, "adjustCropRect:outputRect:outputExtent:forComposition:applyOrientation:error:", v52, &v53, v25, 0, &v51, x, y, width, height);
      v28 = v51;

      if ((v27 & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        NURectDenormalize();
        NUPixelRectFromCGRect();
        v47 = 0u;
        v48 = 0u;
        NUPixelRectFromCGRect();
        v29 = +[PIPhotoEditHelper newCompositionControllerWithComposition:](PIPhotoEditHelper, "newCompositionControllerWithComposition:", v25);
        v30 = MEMORY[0x1E0C809B0];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke;
        v40[3] = &__block_descriptor_128_e36_v16__0__PICropAdjustmentController_8l;
        v41 = 0u;
        v42 = 0u;
        v43 = v53;
        v44 = v54;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v29, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("cropStraighten"), v40);
        objc_msgSend(a1, "temporaryAdjustedVideoURLForURL:", v13);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_alloc(MEMORY[0x1E0D52320]);
        objc_msgSend(v29, "composition");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithComposition:destinationURL:", v33, v31);

        v37[0] = v30;
        v37[1] = 3221225472;
        v37[2] = __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke_2;
        v37[3] = &unk_1E5019E90;
        v38 = v31;
        v39 = v15;
        v35 = v31;
        objc_msgSend(v34, "submit:", v37);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to adjust stabilization crop rect"), v14, v28);
        v36 = objc_claimAutoreleasedReturnValue();

        v15[2](v15, 0, (id)v36);
        v28 = (id)v36;
      }
      v26 = v28;
    }
    else
    {
      v15[2](v15, 0, v26);
    }

    v24 = v26;
  }

}

+ (id)temporaryDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "temporaryDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);
  return v7;
}

+ (id)temporaryAdjustedVideoURLForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("adj-"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "temporaryDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

  return v7;
}

+ (id)originalCompositionForResource:(id)a3 error:(id *)a4
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
  void *v16;
  NSObject *v18;
  const void **v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  const void **v26;
  void *v27;
  int v28;
  void *v29;
  const void **v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  const void **v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_6935();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "resource != nil");
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v31 = dispatch_get_specific(*v20);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v20 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v31;
        v42 = 2114;
        v43 = v34;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v20;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v28 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  v6 = v5;
  if (objc_msgSend(v5, "type") != 6)
  {
    NUAssertLogger_6935();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "resource.type == PFParallaxAssetResourceTypeLiveOriginal");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    v27 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v27)
    {
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_21;
    }
LABEL_19:
    if (v28)
    {
      v35 = dispatch_get_specific(*v20);
      v36 = (void *)MEMORY[0x1E0CB3978];
      v37 = v35;
      objc_msgSend(v36, "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v35;
      v42 = 2114;
      v43 = v39;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_21:

    _NUAssertFailHandler();
  }
  objc_msgSend(v6, "adjustmentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustmentFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustmentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICompositionSerializer deserializeCompositionFromData:formatIdentifier:formatVersion:error:](PICompositionSerializer, "deserializeCompositionFromData:formatIdentifier:formatVersion:error:", v7, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "imageFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIPhotoEditHelper imageSourceWithURL:type:useEmbeddedPreview:](PIPhotoEditHelper, "imageSourceWithURL:type:useEmbeddedPreview:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "videoFileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIPhotoEditHelper videoSourceWithURL:](PIPhotoEditHelper, "videoSourceWithURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:videoSource:](PIPhotoEditHelper, "livePhotoSourceWithPhotoSource:videoSource:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("source"));
    objc_msgSend(v10, "setMediaType:", 3);

  }
  return v10;
}

+ (id)adjustedCompositionForResource:(id)a3 videoURL:(id)a4 cropRect:(CGRect)a5 error:(id *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  const void **v30;
  const void **v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  NSObject *v36;
  const void **v37;
  void *v38;
  int v39;
  void *v40;
  NSObject *v41;
  const void **v42;
  void *v43;
  int v44;
  void *v45;
  const void **v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  const __CFString *v61;
  void *v62;
  uint8_t buf[4];
  const void **v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (!v12)
  {
    NUAssertLogger_6935();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "resource != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v47 = dispatch_get_specific(*v31);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v31 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = (const void **)v47;
        v65 = 2114;
        v66 = v50;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v31;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v39 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  v14 = v13;
  if (!v13)
  {
    NUAssertLogger_6935();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoURL != nil");
      v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v37;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v33 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v31;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_27:

      v44 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v39)
    {
      v51 = dispatch_get_specific(*v31);
      v52 = (void *)MEMORY[0x1E0CB3978];
      v53 = v51;
      objc_msgSend(v52, "callStackSymbols");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = (const void **)v51;
      v65 = 2114;
      v66 = v54;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_27;
  }
  objc_msgSend(v12, "adjustmentData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    NUAssertLogger_6935();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "resource.adjustmentData != nil");
      v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v42;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    v43 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v33 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v43)
    {
      if (v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v46;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_30;
    }
LABEL_28:
    if (v44)
    {
      v55 = dispatch_get_specific(*v31);
      v56 = (void *)MEMORY[0x1E0CB3978];
      v57 = v55;
      objc_msgSend(v56, "callStackSymbols");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = (const void **)v55;
      v65 = 2114;
      v66 = v59;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_30:

    _NUAssertFailHandler();
  }
  objc_msgSend(v12, "adjustmentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustmentFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustmentVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICompositionSerializer deserializeCompositionFromData:formatIdentifier:formatVersion:error:](PICompositionSerializer, "deserializeCompositionFromData:formatIdentifier:formatVersion:error:", v16, v17, v18, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v12, "imageFileURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIPhotoEditHelper imageSourceWithURL:type:useEmbeddedPreview:](PIPhotoEditHelper, "imageSourceWithURL:type:useEmbeddedPreview:", v20, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[PIPhotoEditHelper videoSourceWithURL:](PIPhotoEditHelper, "videoSourceWithURL:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = CFSTR("appliedCropRect");
    *(CGFloat *)v60 = x;
    *(CGFloat *)&v60[1] = y;
    *(CGFloat *)&v60[2] = width;
    *(CGFloat *)&v60[3] = height;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v60, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "definition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSourceOptions:", v25);

    +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:videoSource:](PIPhotoEditHelper, "livePhotoSourceWithPhotoSource:videoSource:", v22, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("source"));
    objc_msgSend(v19, "setMediaType:", 3);

  }
  return v19;
}

void __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  void *specific;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  void *v25;
  const void **v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  NSObject *log;
  os_log_t loga;
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[8];
  __int128 v75;
  _OWORD v76[2];
  _QWORD v77[4];
  _OWORD v78[2];
  _QWORD v79[4];
  _BYTE buf[32];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "cropRect");
  v6 = (uint64_t)v5;
  objc_msgSend(v4, "cropRect");
  v8 = (uint64_t)v7;
  objc_msgSend(v4, "cropRect");
  v10 = (uint64_t)v9;
  objc_msgSend(v4, "cropRect");
  specific = (void *)(uint64_t)v11;
  *(_QWORD *)buf = v6;
  *(_QWORD *)&buf[8] = v8;
  *(_QWORD *)&buf[16] = v10;
  *(_QWORD *)&buf[24] = (uint64_t)v11;
  if ((NUPixelRectIsEmpty() & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    specific = *(void **)(a1 + 56);
  }
  if ((NUPixelSizeEqualToSize() & 1) == 0)
  {
    NUAssertLogger_6935();
    v16 = objc_claimAutoreleasedReturnValue();
    v6 = 0x1E0CB3000uLL;
    v15 = &unk_1A64D6000;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v4, "cropRect");
      v79[0] = v19;
      v79[1] = v20;
      v79[2] = v21;
      v79[3] = v22;
      objc_msgSend(v18, "valueWithBytes:objCType:", v79, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_OWORD *)(a1 + 80);
      v78[0] = *(_OWORD *)(a1 + 64);
      v78[1] = v24;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v78, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Invalid current crop rect: %@ extent: %@"), v23, v2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        specific = dispatch_get_specific(*v26);
        v47 = (void *)MEMORY[0x1E0CB3978];
        v2 = specific;
        objc_msgSend(v47, "callStackSymbols");
        v26 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v48 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v4, "cropRect");
    v77[0] = v49;
    v77[1] = v50;
    v77[2] = v51;
    v77[3] = v52;
    v43 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
    objc_msgSend(v48, "valueWithBytes:objCType:", v77, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v10 = objc_claimAutoreleasedReturnValue();
    v53 = *(_OWORD *)(a1 + 80);
    v76[0] = *(_OWORD *)(a1 + 64);
    v76[1] = v53;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v76, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    objc_claimAutoreleasedReturnValue();
    v44 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  v13 = *(_QWORD *)(a1 + 96);
  v14 = *(_QWORD *)(a1 + 104);
  v75 = *(_OWORD *)(a1 + 112);
  v15 = (void *)(v13 + v6);
  v2 = (id)(v14 + v8);
  v74[4] = v6;
  v74[5] = v8;
  v74[6] = v10;
  v74[7] = specific;
  NUPixelRectIntersection();
  *(_QWORD *)buf = v15;
  *(_QWORD *)&buf[8] = v2;
  *(_OWORD *)&buf[16] = v75;
  if ((NUPixelRectEqualToRect() & 1) == 0)
  {
    NUAssertLogger_6935();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v67 = (void *)MEMORY[0x1E0CB3940];
      v29 = (void *)MEMORY[0x1E0CB3B18];
      *(_QWORD *)buf = v15;
      *(_QWORD *)&buf[8] = v2;
      *(_OWORD *)&buf[16] = v75;
      NUPixelRectToCGRect();
      v74[0] = v30;
      v74[1] = v31;
      v74[2] = v32;
      v74[3] = v33;
      objc_msgSend(v29, "valueWithBytes:objCType:", v74, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB3B18];
      *(_QWORD *)buf = v6;
      *(_QWORD *)&buf[8] = v8;
      *(_QWORD *)&buf[16] = v10;
      *(_QWORD *)&buf[24] = specific;
      NUPixelRectToCGRect();
      v73[0] = v36;
      v73[1] = v37;
      v73[2] = v38;
      v73[3] = v39;
      objc_msgSend(v35, "valueWithBytes:objCType:", v73, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "stringWithFormat:", CFSTR("Invalid adjusted crop rect: %@, current: %@"), v34, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A6382000, log, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6935();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (!v42)
    {
      if (v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v46;
        _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_21;
    }
LABEL_19:
    if (v44)
    {
      v54 = dispatch_get_specific(*v26);
      v55 = (void *)MEMORY[0x1E0CB3978];
      loga = v54;
      objc_msgSend(v55, "callStackSymbols");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v56;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_21:

    v57 = (void *)MEMORY[0x1E0CB3B18];
    *(_QWORD *)buf = v15;
    *(_QWORD *)&buf[8] = v2;
    *(_OWORD *)&buf[16] = v75;
    NUPixelRectToCGRect();
    v72[0] = v58;
    v72[1] = v59;
    v72[2] = v60;
    v72[3] = v61;
    objc_msgSend(v57, "valueWithBytes:objCType:", v72, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    objc_claimAutoreleasedReturnValue();
    v62 = (void *)MEMORY[0x1E0CB3B18];
    *(_QWORD *)buf = v6;
    *(_QWORD *)&buf[8] = v8;
    *(_QWORD *)&buf[16] = v10;
    *(_QWORD *)&buf[24] = specific;
    NUPixelRectToCGRect();
    v71[0] = v63;
    v71[1] = v64;
    v71[2] = v65;
    v71[3] = v66;
    objc_msgSend(v62, "valueWithBytes:objCType:", v71, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
  }
  *(_QWORD *)buf = v15;
  *(_QWORD *)&buf[8] = v2;
  *(_OWORD *)&buf[16] = v75;
  NUPixelRectToCGRect();
  objc_msgSend(v4, "setCropRect:");
  objc_msgSend(v4, "setEnabled:", 1);

}

void __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = 0;
  objc_msgSend(a2, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v3)
    v5 = *(_QWORD *)(a1 + 32);
  else
    v5 = 0;
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v4);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

void __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id *v23;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    getMediaAnalysisResultsKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v68 = 0;
    *((_QWORD *)&v68 + 1) = &v68;
    *(_QWORD *)&v69 = 0x2020000000;
    v9 = (_QWORD *)getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr;
    *((_QWORD *)&v69 + 1) = getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr;
    if (!getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr)
    {
      v10 = MediaAnalysisLibrary();
      v9 = dlsym(v10, "MediaAnalysisSettlingEffectResultsKey");
      *(_QWORD *)(*((_QWORD *)&v68 + 1) + 24) = v9;
      getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v68, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisSettlingEffectResultsKey(void)");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("PIPosterSettlingEffectLoader.m"), 41, CFSTR("%s"), dlerror());
      goto LABEL_43;
    }
    v54 = v6;
    objc_msgSend(v8, "objectForKeyedSubscript:", *v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getMediaAnalysisResultAttributesKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v68 = 0;
    *((_QWORD *)&v68 + 1) = &v68;
    *(_QWORD *)&v69 = 0x2020000000;
    v15 = (id *)getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr;
    *((_QWORD *)&v69 + 1) = getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr;
    if (!getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr)
    {
      v16 = MediaAnalysisLibrary();
      v15 = (id *)dlsym(v16, "MediaAnalysisResultSettlingEffectURLAttributeKey");
      *(_QWORD *)(*((_QWORD *)&v68 + 1) + 24) = v15;
      getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v68, 8);
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectURLAttributeKey(void)");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("PIPosterSettlingEffectLoader.m"), 40, CFSTR("%s"), dlerror());
      goto LABEL_43;
    }
    v52 = v12;
    v53 = v11;
    v17 = *v15;
    objc_msgSend(v14, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    getMediaAnalysisResultSettlingEffectStatusAttributeKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0;
    v65 = &v64;
    v66 = 0x2020000000;
    v67 = 0;
    v67 = objc_msgSend(a1[7], "_gatingFlagsFromMADStatus:", v20);
    v55 = v8;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing settling effect video results"), v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v65[3] |= 0x200uLL;
      (*((void (**)(void))a1[6] + 2))();
LABEL_39:

      _Block_object_dispose(&v64, 8);
      v6 = v54;
      goto LABEL_40;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1[5], "isInteractiveRequest"))
      v22 = 3;
    else
      v22 = 5;
    *(_QWORD *)&v68 = 0;
    *((_QWORD *)&v68 + 1) = &v68;
    *(_QWORD *)&v69 = 0x2020000000;
    v23 = (id *)getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr;
    *((_QWORD *)&v69 + 1) = getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr;
    if (!getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr)
    {
      v24 = MediaAnalysisLibrary();
      v23 = (id *)dlsym(v24, "MediaAnalysisResultSettlingEffectFRCRecommendationAttributeKey");
      *(_QWORD *)(*((_QWORD *)&v68 + 1) + 24) = v23;
      getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr = (uint64_t)v23;
    }
    _Block_object_dispose(&v68, 8);
    if (!v23)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKey(void)");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("PIPosterSettlingEffectLoader.m"), 44, CFSTR("%s"), dlerror());
LABEL_43:

        __break(1u);
      }
    }
    v51 = v22;
    v25 = *v23;
    objc_msgSend(v14, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid FRC Recommendation value"), v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v65[3] |= 0x200uLL;
        (*((void (**)(void))a1[6] + 2))();
        goto LABEL_37;
      }
      v27 = objc_msgSend(v26, "integerValue");
      if (v27 < 5)
        v51 = qword_1A64D6D18[v27];
    }
    objc_msgSend(a1[4], "adjustmentData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 && (v29 = objc_msgSend(a1[5], "loadVideoStatusOnly"), v28, !v29))
    {
      getMediaAnalysisPathConstraintsStabilizationResultsKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "firstObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        getMediaAnalysisResultAttributesKey();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v34;
        if (v34)
        {
          v36 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
          v68 = *MEMORY[0x1E0C9D628];
          v69 = v36;
          v37 = a1[7];
          v63 = 0;
          v49 = (void *)v34;
          v38 = objc_msgSend(v37, "extractCropRect:fromStabilizationResultAttributes:error:", &v68, v34, &v63);
          v39 = v63;
          if ((v38 & 1) != 0)
          {
            v48 = v31;
            v40 = a1[7];
            v41 = a1[4];
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke_2;
            v56[3] = &unk_1E5016A40;
            v57 = v41;
            v60 = &v64;
            v42 = a1[6];
            v43 = a1[7];
            v59 = v42;
            v61 = v43;
            v58 = v21;
            v62 = v51;
            v44 = v40;
            v31 = v48;
            objc_msgSend(v44, "adjustVideo:cropRect:forResource:completion:", v58, v57, v56, v68, v69);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to extract crop rect from stabilization result"), v50);
            v45 = objc_claimAutoreleasedReturnValue();

            (*((void (**)(void))a1[6] + 2))();
            v39 = (id)v45;
          }
          v35 = v49;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing stabilized crop rect attributes"), v5);
          v39 = (id)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void))a1[6] + 2))();
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing stabilized crop rect results"), v5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void))a1[6] + 2))();
      }

    }
    else
    {
      if (objc_msgSend(a1[7], "_canLoadVideoAtURL:", v21))
      {
        (*((void (**)(void))a1[6] + 2))();
LABEL_38:

        goto LABEL_39;
      }
      v65[3] |= 0x2000uLL;
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Failed to load video asset from file"), v21);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))a1[6] + 2))();
    }
LABEL_37:

    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to analyze asset for settling effect"), a1[4], v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))a1[6] + 2))();

LABEL_40:
}

void __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 64), "_canLoadVideoAtURL:", *(_QWORD *)(a1 + 40)))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 0x2000uLL;
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Failed to load video asset from file"), *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to adjust video for edited live photo resource"), *(_QWORD *)(a1 + 32), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 0x400uLL;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = (id)v6;
  }

}

void __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  id v30;

  v30 = 0;
  objc_msgSend(a2, "result:", &v30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v30;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "cleanAperture");
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
    }

    NUPixelRectToCGRect();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v3, "properties", v28, v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    NUPixelSizeToCGRect();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v5.n128_f64[0] = v12 - v21;
    v8.n128_u64[0] = 0;
    v7.n128_u64[0] = 0;
    if (v25 != 0.0)
    {
      v5.n128_f64[0] = v5.n128_f64[0] / v25;
      v7.n128_f64[0] = v16 / v25;
    }
    v6.n128_f64[0] = v14 - v23;
    if (v27 != 0.0)
    {
      v6.n128_f64[0] = v6.n128_f64[0] / v27;
      v8.n128_f64[0] = v18 / v27;
    }
  }
  else
  {
    v5.n128_u64[0] = *MEMORY[0x1E0C9D628];
    v6.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
    v7.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
    v8.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  }
  (*(void (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(v5, v6, v7, v8);

}

void __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
  double *v15;
  __int128 v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;

  v5 = a2;
  if (v5)
  {
    getMediaAnalysisResultsKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    getMediaAnalysisPathConstraintsStabilizationResultsKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      getMediaAnalysisResultAttributesKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        getMediaAnalysisResultSettlingEffectStatusAttributeKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "_gatingFlagsFromMADStatus:", v14);
        v15 = (double *)MEMORY[0x1E0C9D628];
        v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
        v28 = *MEMORY[0x1E0C9D628];
        v29 = v16;
        v17 = *(void **)(a1 + 48);
        v27 = 0;
        v18 = objc_msgSend(v17, "extractCropRect:fromStabilizationResultAttributes:error:", &v28, v12, &v27);
        v19 = v27;
        if ((v18 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "adjustmentData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = *(void **)(a1 + 48);
            v22 = *(_QWORD *)(a1 + 32);
            v26 = 0;
            v23 = objc_msgSend(v21, "adjustCropRect:forEditedLivePhotoResource:error:", &v28, v22, &v26);
            v25 = v26;

            if ((v23 & 1) != 0)
            {
              (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)&v28, *((double *)&v28 + 1), *(double *)&v29, *((double *)&v29 + 1));
              v19 = v25;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to adjust stabilization crop rect"), *(_QWORD *)(a1 + 32), v25);
              v19 = (id)objc_claimAutoreleasedReturnValue();

              (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*v15, v15[1], v15[2], v15[3]);
            }
          }
          else
          {
            (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)&v28, *((double *)&v28 + 1), *(double *)&v29, *((double *)&v29 + 1));
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to extract crop rect from stabilization result"), v10, v19);
          v24 = objc_claimAutoreleasedReturnValue();

          (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*v15, v15[1], v15[2], v15[3]);
          v19 = (id)v24;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing stabilized crop rect attributes"), v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing stabilized crop rect results"), v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to analyze asset for stabilization"), *(_QWORD *)(a1 + 32), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }

}

void __58__PIPosterSettlingEffectLoader__gatingFlagsFromMADStatus___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "unsignedIntegerValue");
  LODWORD(v5) = objc_msgSend(v6, "BOOLValue");

  if ((_DWORD)v5)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v7;

}

@end

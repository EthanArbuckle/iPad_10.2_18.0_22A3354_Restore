@implementation CRNeuralTextRecognizer

- (CRNeuralTextRecognizer)init
{
  CRNeuralTextRecognizer *v2;
  CRPerformanceStatistics *v3;
  CRPerformanceStatistics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRNeuralTextRecognizer;
  v2 = -[CRNeuralTextRecognizer init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Recognition Inference"), 0);
    -[CRNeuralTextRecognizer setInferenceStats:](v2, "setInferenceStats:", v3);

    v4 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Recognizer Decoding"), 0);
    -[CRNeuralTextRecognizer setDecodingStats:](v2, "setDecodingStats:", v4);

    -[CRNeuralTextRecognizer setShouldCancel:](v2, "setShouldCancel:", 0);
    -[CRNeuralTextRecognizer setResourceUsers:](v2, "setResourceUsers:", 0);
    -[CRNeuralTextRecognizer setUnloadResourcesWhenNotInUse:](v2, "setUnloadResourcesWhenNotInUse:", 0);
  }
  return v2;
}

- (void)cancel
{
  CRNeuralTextRecognizer *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CRNeuralTextRecognizer setShouldCancel:](obj, "setShouldCancel:", 1);
  objc_sync_exit(obj);

}

+ (id)recognizerForLocale:(id)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CRNeuralRecognizerConfiguration *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRImageReaderRevisionKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v9, "setDesiredQoS:", 0);
  v12 = -[CRNeuralRecognizerConfiguration initWithLocale:imageReaderOptions:error:]([CRNeuralRecognizerConfiguration alloc], "initWithLocale:imageReaderOptions:error:", v8, v7, a5);

  objc_msgSend(v9, "setConfiguration:", v12);
  objc_msgSend(v9, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableScriptDetection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (!v8 && v11 == 3 && !v15 || (v16 = 0, objc_msgSend(v9, "_loadResourcesWithError:", 0)))
      v16 = v9;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)localeToModelClassMappingForRevision:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[CRRecognizerConfiguration supportedLanguagesForVersion:](CRRecognizerConfiguration, "supportedLanguagesForVersion:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v16 = 0;
        v13 = objc_msgSend(a1, "_modelClassForRevision:language:error:", a3, v12, &v16);
        v14 = v16;
        if (v13)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)recognizeInImage:(id)a3 lineRegions:(id)a4 rectifier:(id)a5 progressHandler:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  qos_class_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  dispatch_group_t v18;
  CRMutableRecognitionResult *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  CRMutableRecognitionResult *v32;
  id v33;
  CRMutableRecognitionResult *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  CRMutableRecognitionResult *v48;
  id v49;
  uint64_t *v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v40 = a6;
  v15 = -[CRNeuralTextRecognizer desiredQoS](self, "desiredQoS");
  if (!-[CRNeuralTextRecognizer desiredQoS](self, "desiredQoS"))
    v15 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], v15, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create("com.apple.CoreRecognition.recognizeText", v16);
  v18 = dispatch_group_create();
  if (-[CRNeuralTextRecognizer _isCancelled](self, "_isCancelled"))
  {
    if (a7)
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
      v19 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    goto LABEL_24;
  }
  v38 = v14;
  v39 = v13;
  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageByConvertingToColorSpace:", objc_msgSend(v20, "colorSpace"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__1;
  v56 = __Block_byref_object_dispose__1;
  v57 = 0;
  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "locale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CRImageReader languageIsLatin:](CRImageReader, "languageIsLatin:", v22))
  {

  }
  else
  {
    -[CRNeuralTextRecognizer configuration](self, "configuration", v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "locale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[CRImageReader languageIsCyrillic:](CRImageReader, "languageIsCyrillic:", v24);

    if (!v25)
    {
      v31 = 0;
      v30 = 0;
      goto LABEL_19;
    }
  }
  -[CRNeuralTextRecognizer configuration](self, "configuration", v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v26, "revision") < 3)
    goto LABEL_16;
  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "decodeWithLM") & 1) == 0)
  {

LABEL_16:
    v30 = 0;
    goto LABEL_17;
  }
  -[CRNeuralTextRecognizer textDecoder](self, "textDecoder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) == 0)
  {
    v30 = 0;
    goto LABEL_18;
  }
  -[CRNeuralTextRecognizer textDecoder](self, "textDecoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v26, "newLanguageRecognizerSession");
LABEL_17:

LABEL_18:
  v31 = 1;
LABEL_19:
  v32 = objc_alloc_init(CRMutableRecognitionResult);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke;
  v41[3] = &unk_1E98D9DC8;
  v41[4] = self;
  v12 = v37;
  v42 = v12;
  v43 = v39;
  v44 = v38;
  v33 = v30;
  v51 = v31;
  v45 = v33;
  v50 = &v52;
  v46 = v18;
  v47 = v17;
  v34 = v32;
  v48 = v34;
  v49 = v40;
  -[CRNeuralTextRecognizer performWithResource:error:](self, "performWithResource:error:", v41, a7);
  if (a7 && (v35 = (void *)v53[5]) != 0)
  {
    v19 = 0;
    *a7 = objc_retainAutorelease(v35);
  }
  else
  {
    v19 = v34;
  }
  v14 = v38;
  v13 = v39;

  _Block_object_dispose(&v52, 8);
LABEL_24:

  return v19;
}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD v21[4];
  int v22;
  _QWORD v23[4];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2810000000;
  v21[3] = &unk_1D5168E96;
  v22 = 0;
  objc_msgSend(*(id *)(a1 + 32), "featureProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2;
  v9[3] = &unk_1E98D9DA0;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v20 = *(_BYTE *)(a1 + 112);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v10 = v6;
  v11 = v7;
  v17 = *(_QWORD *)(a1 + 104);
  v12 = v8;
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 80);
  v15 = *(id *)(a1 + 88);
  v16 = *(id *)(a1 + 96);
  v18 = v21;
  v19 = v23;
  objc_msgSend(v2, "enumerateInputsForImage:lineRegions:rectifier:usingBlock:", v3, v4, v5, v9);

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 72), 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2(uint64_t a1, void *a2, int a3, double a4)
{
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  __int128 v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__1;
  v58 = __Block_byref_object_dispose__1;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__1;
  v52 = __Block_byref_object_dispose__1;
  v53 = 0;
  if (*(_QWORD *)(a1 + 32))
    v7 = *(_BYTE *)(a1 + 112) != 0;
  else
    v7 = 0;
  objc_msgSend(*(id *)(a1 + 40), "inferenceStats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_3;
  v44[3] = &unk_1E98D9D28;
  v10 = *(_QWORD *)(a1 + 40);
  v46 = &v48;
  v44[4] = v10;
  v11 = v6;
  v45 = v11;
  v47 = &v54;
  objc_msgSend(v8, "measureBlock:", v44);

  if (v55[5])
  {
    v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    objc_sync_enter(v12);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), (id)v55[5]);
    objc_sync_exit(v12);

  }
  else
  {
    if (v7)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = (id)v49[5];
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v41 != v15)
              objc_enumerationMutation(v13);
            v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 40), "textDecoder");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 48), "size");
            objc_msgSend(v18, "computeLanguageRecognitionForSession:output:imageSize:", v19, v17);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
        }
        while (v14);
      }

      if (a3)
        objc_msgSend(*(id *)(a1 + 32), "completeSession");
    }
    if (objc_msgSend(*(id *)(a1 + 40), "_isCancelled"))
    {
      v20 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_sync_enter(v20);
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      objc_sync_exit(v20);
    }
    else
    {
      v24 = *(NSObject **)(a1 + 56);
      v25 = *(NSObject **)(a1 + 64);
      block[0] = v9;
      block[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_13;
      block[3] = &unk_1E98D9D78;
      v26 = *(void **)(a1 + 48);
      block[4] = *(_QWORD *)(a1 + 40);
      v35 = &v48;
      v36 = &v54;
      block[1] = 3221225472;
      v32 = v26;
      v27 = *(id *)(a1 + 72);
      v29 = *(void **)(a1 + 80);
      v28 = *(_QWORD *)(a1 + 88);
      v33 = v27;
      v37 = v28;
      v34 = v29;
      v38 = *(_OWORD *)(a1 + 96);
      v39 = a4;
      dispatch_group_async(v24, v25, block);

    }
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[8];
  id obj;
  uint8_t buf[16];

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRRecognizerInferenceTime", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "predictFromInputs:error:", v7, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v12 = (id)CRSignpostLog_signPostOSLog;
  v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v13, OS_SIGNPOST_INTERVAL_END, v3, "OCRRecognizerInferenceTime", ", v14, 2u);
  }

}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "decodingStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2_14;
  v6[3] = &unk_1E98D9D50;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[1] = 3221225472;
  v9 = *(_OWORD *)(a1 + 64);
  v7 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 80);
  v8 = v4;
  v10 = v5;
  objc_msgSend(v2, "measureBlock:", v6);

  if (*(_QWORD *)(a1 + 56))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                            + 24);
    (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                             + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
  }

}

void __87__CRNeuralTextRecognizer_recognizeInImage_lineRegions_rectifier_progressHandler_error___block_invoke_2_14(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id Property;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  unint64_t v33;
  os_signpost_id_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[8];
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  v33 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRRecognizerDecoderTime", ", buf, 2u);
  }
  v34 = v3;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    v35 = *(_QWORD *)v45;
    v36 = v6;
    while (2)
    {
      v10 = 0;
      v37 = v8;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
        if (objc_msgSend(*(id *)(a1 + 32), "_isCancelled", v33))
        {
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;
        }
        else
        {
          v38 = v10;
          objc_msgSend(*(id *)(a1 + 32), "textDecoder");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "size");
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          obj = *(id *)(v16 + 40);
          objc_msgSend(v15, "decodeOutput:imageSize:error:", v11, &obj);
          objc_storeStrong((id *)(v16 + 40), obj);

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v11, "textFeatureInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
          if (v17)
          {
            v19 = v17;
            v20 = *(_QWORD *)v40;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v40 != v20)
                  objc_enumerationMutation(v14);
                v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v21);
                if (v22)
                  Property = objc_getProperty(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v21), v18, 64, 1);
                else
                  Property = 0;
                v24 = Property;

                if (v24)
                {
                  v25 = *(void **)(a1 + 48);
                  if (v22)
                    v26 = objc_getProperty(v22, v18, 64, 1);
                  else
                    v26 = 0;
                  v27 = v26;
                  v49 = v27;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "lineRegion");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "addRecognizedRegions:detectedRegion:", v28, v29);

                }
                ++v21;
              }
              while (v19 != v21);
              v30 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
              v19 = v30;
            }
            while (v30);
            v9 = v35;
            v6 = v36;
          }
          v8 = v37;
          v10 = v38;
        }

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        {
          v32 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          objc_sync_enter(v32);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
          objc_sync_exit(v32);

          goto LABEL_42;
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v31 = (id)CRSignpostLog_signPostOSLog;
  v6 = v31;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v6, OS_SIGNPOST_INTERVAL_END, v34, "OCRRecognizerDecoderTime", ", buf, 2u);
  }
LABEL_42:

}

- (BOOL)shouldUseLM
{
  void *v2;
  char v3;

  -[CRNeuralTextRecognizer textDecoder](self, "textDecoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDecodeWithLM");

  return v3;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
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
  id v18;
  void *v19;
  CRNeuralTextRecognizer *v21;

  v5 = a4;
  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "decodeWithLM");

  confidenceThresholds();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v21 = self;
  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "revision"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v17;
  }
  else
  {
    -[CRNeuralTextRecognizer configuration](v21, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "confidenceThresholds");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (BOOL)_isCancelled
{
  CRNeuralTextRecognizer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CRNeuralTextRecognizer shouldCancel](v2, "shouldCancel");
  objc_sync_exit(v2);

  return v3;
}

+ (Class)_modelClassForRevision:(int64_t)a3 language:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v7 = a4;
  switch(a3)
  {
    case 3:
      if (!+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v7)
        && !+[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v7)
        && !+[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v7)
        && !+[CRImageReader languageIsThai:](CRImageReader, "languageIsThai:", v7))
      {
        +[CRImageReader languageIsArabic:](CRImageReader, "languageIsArabic:", v7);
      }
      goto LABEL_11;
    case 2:
      CROSLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V2 recognizer", v12, 2u);
      }

      +[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v7);
      goto LABEL_11;
    case 1:
      CROSLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V1 recognizer", buf, 2u);
      }

LABEL_11:
      objc_opt_class();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  if (a5)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_12:

  return (Class)v10;
}

+ (id)_modelForRevision:(int64_t)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(v8, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_msgSend(a1, "_modelClassForRevision:language:error:", a3, v9, a5);

  if (v10)
    v11 = (void *)objc_msgSend([v10 alloc], "initWithConfiguration:error:", v8, a5);
  else
    v11 = 0;

  return v11;
}

- (BOOL)preheatWithError:(id *)a3
{
  void *v4;

  -[CRNeuralTextRecognizer model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "preheatWithError:", a3);

  return (char)a3;
}

- (id)_featureProviderWithError:(id *)a3
{
  void *v5;
  unint64_t v6;
  CRRecognizerAsyncFeatureBatchProviderV1 *v7;
  void *v8;
  void *v9;
  CRRecognizerAsyncFeatureBatchProviderV1 *v10;

  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "revision");

  if (v6 > 3)
  {
    if (a3)
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v7 = [CRRecognizerAsyncFeatureBatchProviderV1 alloc];
    -[CRNeuralTextRecognizer configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRNeuralTextRecognizer model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CRRecognizerAsyncFeatureBatchProviderV1 initWithConfiguration:inputProvider:error:](v7, "initWithConfiguration:inputProvider:error:", v8, v9, a3);

  }
  return v10;
}

+ (id)_textDecoderForRevision:(int64_t)a3 configuration:(id)a4 model:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  CRCTCTextDecoderV3 *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  if (a3 != 3)
  {
    if (a3 != 2)
    {
      if (a3 != 1)
      {
        +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
        v13 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      CROSLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V1 decoder", buf, 2u);
      }

    }
    CROSLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_FAULT, "Unexpected attempt to load V2 decoder", v15, 2u);
    }

  }
  v13 = -[CRCTCCVNLPTextDecoder initWithConfiguration:model:error:]([CRCTCTextDecoderV3 alloc], "initWithConfiguration:model:error:", v9, v10, a6);
LABEL_12:

  return v13;
}

- (BOOL)performWithResource:(id)a3 error:(id *)a4
{
  void (**v6)(_QWORD);
  CRNeuralTextRecognizer *v7;
  void *v8;
  CRNeuralTextRecognizer *v9;
  BOOL v10;

  v6 = (void (**)(_QWORD))a3;
  v7 = self;
  objc_sync_enter(v7);
  -[CRNeuralTextRecognizer model](v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || -[CRNeuralTextRecognizer _loadResourcesWithError:](v7, "_loadResourcesWithError:", a4))
  {
    -[CRNeuralTextRecognizer setResourceUsers:](v7, "setResourceUsers:", -[CRNeuralTextRecognizer resourceUsers](v7, "resourceUsers") + 1);
    objc_sync_exit(v7);

    v6[2](v6);
    v9 = v7;
    objc_sync_enter(v9);
    -[CRNeuralTextRecognizer setResourceUsers:](v9, "setResourceUsers:", -[CRNeuralTextRecognizer resourceUsers](v9, "resourceUsers") - 1);
    if (!-[CRNeuralTextRecognizer resourceUsers](v9, "resourceUsers"))
    {
      if (-[CRNeuralTextRecognizer unloadResourcesWhenNotInUse](v9, "unloadResourcesWhenNotInUse"))
        -[CRNeuralTextRecognizer _unloadResources](v9, "_unloadResources");
      else
        -[CRNeuralTextRecognizer _releaseIntermediateResources](v9, "_releaseIntermediateResources");
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(v7);

  return v10;
}

- (BOOL)_loadResourcesWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v24;
  id v25;
  id v26;

  v5 = (void *)objc_opt_class();
  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "revision");
  -[CRNeuralTextRecognizer configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v5, "_modelForRevision:configuration:error:", v7, v8, &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26;
  -[CRNeuralTextRecognizer setModel:](self, "setModel:", v9);

  -[CRNeuralTextRecognizer model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v25 = v10;
    -[CRNeuralTextRecognizer _featureProviderWithError:](self, "_featureProviderWithError:", &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v25;

    -[CRNeuralTextRecognizer setFeatureProvider:](self, "setFeatureProvider:", v12);
    -[CRNeuralTextRecognizer featureProvider](self, "featureProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)objc_opt_class();
      -[CRNeuralTextRecognizer configuration](self, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "revision");
      -[CRNeuralTextRecognizer configuration](self, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRNeuralTextRecognizer model](self, "model");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v13;
      objc_msgSend(v15, "_textDecoderForRevision:configuration:model:error:", v17, v18, v19, &v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v24;

      -[CRNeuralTextRecognizer setTextDecoder:](self, "setTextDecoder:", v20);
      -[CRNeuralTextRecognizer textDecoder](self, "textDecoder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = 1;
LABEL_14:
        v13 = v10;
        goto LABEL_15;
      }
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      -[CRNeuralTextRecognizer _unloadResources](self, "_unloadResources");
LABEL_13:
      v22 = 0;
      goto LABEL_14;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v13);
    -[CRNeuralTextRecognizer _unloadResources](self, "_unloadResources");
    v22 = 0;
  }
  else
  {
    if (!a3)
      goto LABEL_13;
    v13 = objc_retainAutorelease(v10);
    v22 = 0;
    *a3 = v13;
  }
LABEL_15:

  return v22;
}

- (void)_unloadResources
{
  -[CRNeuralTextRecognizer setModel:](self, "setModel:", 0);
  -[CRNeuralTextRecognizer setFeatureProvider:](self, "setFeatureProvider:", 0);
  -[CRNeuralTextRecognizer setTextDecoder:](self, "setTextDecoder:", 0);
}

- (void)_releaseIntermediateResources
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[CRNeuralTextRecognizer model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseIntermediateBuffers");

  -[CRNeuralTextRecognizer textDecoder](self, "textDecoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRNeuralTextRecognizer textDecoder](self, "textDecoder");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "releaseUnusedResources");

  }
}

- (BOOL)shouldModelSupportCharacterBoxes
{
  void *v3;
  _BOOL4 v4;

  -[CRNeuralTextRecognizer model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportCharacterBoxes"))
    v4 = !-[CRNeuralTextRecognizer shouldUseLM](self, "shouldUseLM");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (CRPerformanceStatistics)inferenceStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInferenceStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRPerformanceStatistics)decodingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDecodingStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)unloadResourcesWhenNotInUse
{
  return self->_unloadResourcesWhenNotInUse;
}

- (void)setUnloadResourcesWhenNotInUse:(BOOL)a3
{
  self->_unloadResourcesWhenNotInUse = a3;
}

- (CRRecognizerFeatureProviding)featureProvider
{
  return (CRRecognizerFeatureProviding *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFeatureProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CRTextRecognizerModel)model
{
  return (CRTextRecognizerModel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CRTextDecoding)textDecoder
{
  return (CRTextDecoding *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTextDecoder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int64_t)resourceUsers
{
  return self->_resourceUsers;
}

- (void)setResourceUsers:(int64_t)a3
{
  self->_resourceUsers = a3;
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (unsigned)desiredQoS
{
  return self->_desiredQoS;
}

- (void)setDesiredQoS:(unsigned int)a3
{
  self->_desiredQoS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDecoder, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_decodingStats, 0);
  objc_storeStrong((id *)&self->_inferenceStats, 0);
}

@end

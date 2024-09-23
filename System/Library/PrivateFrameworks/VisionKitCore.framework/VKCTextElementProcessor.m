@implementation VKCTextElementProcessor

+ (id)textElementsFromCRDocumentOutputRegion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  objc_msgSend(v3, "contentsWithTypes:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__VKCTextElementProcessor_textElementsFromCRDocumentOutputRegion___block_invoke;
  v10[3] = &unk_1E9462F50;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "vk_compactMap:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v6;

  return v8;
}

id __66__VKCTextElementProcessor_textElementsFromCRDocumentOutputRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VKCTextElement textElementFromCROutputRegion:parentDocument:](VKCTextElement, "textElementFromCROutputRegion:parentDocument:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)dataDetectorsFromCRDocumentOutputRegion:(id)a3 shouldFilter:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v9 = (void *)getDDDetectionControllerClass_softClass;
  v31 = getDDDetectionControllerClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!getDDDetectionControllerClass_softClass)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __getDDDetectionControllerClass_block_invoke;
    v27[3] = &unk_1E9462330;
    v27[4] = &v28;
    __getDDDetectionControllerClass_block_invoke((uint64_t)v27);
    v9 = (void *)v29[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v28, 8);
  v18 = v10;
  v19 = 3221225472;
  v20 = __80__VKCTextElementProcessor_dataDetectorsFromCRDocumentOutputRegion_shouldFilter___block_invoke;
  v21 = &unk_1E9462F78;
  v26 = a4;
  v25 = v11;
  v22 = v7;
  v12 = v8;
  v23 = v12;
  v13 = v6;
  v24 = v13;
  v14 = v7;
  objc_msgSend(v13, "enumerateContentsWithTypes:usingBlock:", 2048, &v18);
  if (vk_supportsContextAwareDataDetectors())
    objc_msgSend(a1, "addGroupingToDataDetectors:parentDocument:", v12, v13, v18, v19, v20, v21, v22, v23);
  v15 = v24;
  v16 = v12;

  return v16;
}

void __80__VKCTextElementProcessor_dataDetectorsFromCRDocumentOutputRegion_shouldFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_class();
  VKDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_4;
  objc_msgSend(v5, "ddResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_4;
  v7 = *(void **)(a1 + 56);
  objc_msgSend(v5, "ddResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterResults:forTypes:referenceDate:referenceTimeZone:", v9, 0xFFFFLL, *(_QWORD *)(a1 + 32), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
LABEL_4:
    v12 = *(void **)(a1 + 40);
    +[VKCTextDataDetectorElement dataDetectorElementFromCROutputRegion:parentDocument:](VKCTextDataDetectorElement, "dataDetectorElementFromCROutputRegion:parentDocument:", v5, *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
}

+ (void)addGroupingToDataDetectors:(id)a3 parentDocument:(id)a4
{
  id v5;
  id v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _Unwind_Exception *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v8 = (id *)getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr;
  v41 = getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr;
  if (!getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr)
  {
    v9 = (void *)DataDetectorsUILibrary_0();
    v8 = (id *)dlsym(v9, "kDataDetectorsGroupAllResultsKey");
    v39[3] = (uint64_t)v8;
    getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v38, 8);
  if (!v8)
  {
    getkDDRVInteractionDidFinishNotification_cold_1();
LABEL_15:
    getkDDRVInteractionDidFinishNotification_cold_1();
LABEL_16:
    getkDDRVInteractionDidFinishNotification_cold_1();
    goto LABEL_17;
  }
  v10 = *v8;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v11 = (id *)getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr;
  v41 = getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr;
  if (!getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr)
  {
    v12 = (void *)DataDetectorsUILibrary_0();
    v11 = (id *)dlsym(v12, "kDataDetectorsGroupTranscriptKey");
    v39[3] = (uint64_t)v11;
    getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v38, 8);
  if (!v11)
    goto LABEL_15;
  v13 = *v11;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v14 = (id *)getkDataDetectorsGroupCategoryKeySymbolLoc_ptr;
  v41 = getkDataDetectorsGroupCategoryKeySymbolLoc_ptr;
  if (!getkDataDetectorsGroupCategoryKeySymbolLoc_ptr)
  {
    v15 = (void *)DataDetectorsUILibrary_0();
    v14 = (id *)dlsym(v15, "kDataDetectorsGroupCategoryKey");
    v39[3] = (uint64_t)v14;
    getkDataDetectorsGroupCategoryKeySymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v38, 8);
  if (!v14)
    goto LABEL_16;
  v16 = *v14;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v17 = (id *)getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr;
  v41 = getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr;
  if (!getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr)
  {
    v18 = (void *)DataDetectorsUILibrary_0();
    v17 = (id *)dlsym(v18, "kDataDetectorsDocumentLanguageKey");
    v39[3] = (uint64_t)v17;
    getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v38, 8);
  if (!v17)
  {
LABEL_17:
    v28 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v38, 8);
    _Unwind_Resume(v28);
  }
  v19 = *v17;
  v20 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke;
  v31[3] = &unk_1E9462FE8;
  v32 = v10;
  v33 = v13;
  v34 = v16;
  v35 = v6;
  v36 = v19;
  v21 = v7;
  v37 = v21;
  v22 = v19;
  v23 = v6;
  v24 = v16;
  v25 = v13;
  v26 = v10;
  objc_msgSend(v23, "enumerateContentsWithTypes:usingBlock:", 4096, v31);
  v29[0] = v20;
  v29[1] = 3221225472;
  v29[2] = __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_4;
  v29[3] = &unk_1E9463010;
  v30 = v21;
  v27 = v21;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v29);

}

void __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = objc_opt_class();
  VKDynamicCast(v4, (uint64_t)v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataDetectorsOutputRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vk_compactMap:", &__block_literal_global_5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v14, "groupType");
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 56), "recognizedLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(*(id *)(a1 + 56), "confidence") == 2)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 64));
  v12 = (void *)objc_msgSend(v9, "copy");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_3;
  v15[3] = &unk_1E9462FC0;
  v16 = *(id *)(a1 + 72);
  v17 = v12;
  v13 = v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);

}

uint64_t __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ddResult");
}

uint64_t __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a2);
}

void __69__VKCTextElementProcessor_addGroupingToDataDetectors_parentDocument___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "scannerResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupedElementData:", v4);

}

+ (id)dataDetectorElementFromVNBarcodeObservation:(id)a3 loggingIndex:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  VKCMRCDataDetectorElement *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_semaphore_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  VKCMRCDataDetectorElement *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *, void *);
  void *v48;
  NSObject *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  id v64;
  uint8_t buf[4];
  int64_t v66;
  __int16 v67;
  double v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v64 = 0;
  objc_msgSend(v5, "getDataDetectorResults:", &v64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v64;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "detectedBarcodeSupportCode");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__2;
  v62 = __Block_byref_object_dispose__2;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__2;
  v56 = __Block_byref_object_dispose__2;
  v57 = 0;
  if (v7)
  {
    v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:].cold.4((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v66 = a4;
        _os_log_impl(&dword_1D2E0D000, v20, OS_LOG_TYPE_DEFAULT, "Beginning MRC Parsing of element %ld", buf, 0xCu);
      }

      v21 = dispatch_semaphore_create(0);
      v45 = MEMORY[0x1E0C809B0];
      v46 = 3221225472;
      v47 = __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke;
      v48 = &unk_1E9463038;
      v50 = &v52;
      v51 = &v58;
      v22 = v21;
      v49 = v22;
      objc_msgSend(v10, "parseCodeWithCompletion:", &v45);
      v23 = dispatch_time(0, 3000000000);
      dispatch_semaphore_wait(v22, v23);
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v45, v46, v47, v48);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceDate:", v19);
      v26 = v25;

      v27 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v66 = a4;
        v67 = 2048;
        v68 = v26;
        _os_log_impl(&dword_1D2E0D000, v27, OS_LOG_TYPE_DEFAULT, "Completed MRC Parsing of element %ld. Total Time: %f", buf, 0x16u);
      }

      if (!v59[5] && !v53[5])
      {
        v28 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:].cold.3((uint64_t)v10, v28, v26);

      }
    }
    else
    {
      v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:].cold.2(v19, v29, v30, v31, v32, v33, v34, v35);
    }

    if (v59[5])
    {
      v36 = [VKCMRCDataDetectorElement alloc];
      v18 = -[VKCMRCDataDetectorElement initWithBarcodeObservation:action:](v36, "initWithBarcodeObservation:action:", v5, v59[5]);
      goto LABEL_20;
    }
    v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:].cold.1(v11, v38, v39, v40, v41, v42, v43, v44);
  }

  v18 = 0;
LABEL_20:
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  return v18;
}

void __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  void *v16;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v16 = a3;
  }
  else
  {
    v15 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v16 = a2;
  }
  objc_storeStrong(v15, v16);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)dataDetectorElementFromVNBarcodeObservation:(uint64_t)a3 loggingIndex:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, a1, a3, "Processed BCSCode, but there was no resulting action", a5, a6, a7, a8, 0);
}

+ (void)dataDetectorElementFromVNBarcodeObservation:(uint64_t)a3 loggingIndex:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, a1, a3, "Processing a VNBarcodeObservation, but no resulting BCSDetectedCode", a5, a6, a7, a8, 0);
}

+ (void)dataDetectorElementFromVNBarcodeObservation:(double)a3 loggingIndex:.cold.3(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "No Action or error from processing code %@. Processing time: %f", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)dataDetectorElementFromVNBarcodeObservation:(uint64_t)a3 loggingIndex:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Error getting mrc data detector results: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __84__VKCTextElementProcessor_dataDetectorElementFromVNBarcodeObservation_loggingIndex___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2E0D000, a2, a3, "Error parsing BCS code: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end

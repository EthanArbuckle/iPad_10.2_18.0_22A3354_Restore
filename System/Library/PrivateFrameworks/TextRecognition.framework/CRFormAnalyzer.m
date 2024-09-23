@implementation CRFormAnalyzer

- (CRFormAnalyzer)initWithConfiguration:(id)a3 error:(id *)a4 detectionStats:(id)a5 postProcessingStats:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRFormAnalyzer *v14;
  CRFormAnalyzer *v15;
  CRFormAnalyzer *v16;
  CRFormDetector *v17;
  CRFormDetector *modelDetector;
  CRFormContourBasedDetector *v19;
  CRFormContourBasedDetector *contourBasedDetector;
  CRFormTextBasedDetector *v21;
  CRFormTextBasedDetector *textBasedDetector;
  uint64_t v23;
  CRFormPostProcessingManager *postProcessingManager;
  objc_super v26;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CRFormAnalyzer;
  v14 = -[CRFormAnalyzer init](&v26, sel_init);
  v15 = v14;
  v16 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    if (objc_msgSend(v11, "useModelBasedDetection"))
    {
      v17 = -[CRFormDetector initWithConfiguration:error:]([CRFormDetector alloc], "initWithConfiguration:error:", v11, a4);
      modelDetector = v16->_modelDetector;
      v16->_modelDetector = v17;

    }
    if (objc_msgSend(v11, "useContourBasedDetection"))
    {
      v19 = -[CRFormContourBasedDetector initWithConfiguration:error:]([CRFormContourBasedDetector alloc], "initWithConfiguration:error:", v11, a4);
      contourBasedDetector = v16->_contourBasedDetector;
      v16->_contourBasedDetector = v19;

    }
    if (objc_msgSend(v11, "useTextBasedDetection"))
    {
      v21 = -[CRFormTextBasedDetector initWithConfiguration:error:]([CRFormTextBasedDetector alloc], "initWithConfiguration:error:", v11, a4);
      textBasedDetector = v16->_textBasedDetector;
      v16->_textBasedDetector = v21;

    }
    +[CRFormPostProcessingManager postProcessingManagerWithDefaultSequence](CRFormPostProcessingManager, "postProcessingManagerWithDefaultSequence");
    v23 = objc_claimAutoreleasedReturnValue();
    postProcessingManager = v16->_postProcessingManager;
    v16->_postProcessingManager = (CRFormPostProcessingManager *)v23;

    objc_storeStrong((id *)&v15->_formDetectionStats, a5);
    objc_storeStrong((id *)&v15->_formPostProcessingStats, a6);
  }

  return v16;
}

+ (void)_saveDebugImageForRegions:(id)a3 image:(id)a4 suffix:(id)a5 displayTypes:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  __CFString *v30;
  double v31;
  double v32;
  CTFontRef v33;
  CTFontRef v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  CGFloat Size;
  CGFloat v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  CGColorRef GenericRGB;
  CGColorRef v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id obj;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  __CFString *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;
  CGColorRef v87;
  uint64_t v88;
  _QWORD v89[3];

  v6 = a6;
  v89[1] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v9 = a4;
  v66 = a5;
  GenericRGB = CGColorCreateGenericRGB(0.2, 0.2, 1.0, 0.8);
  v65 = CGColorCreateGenericRGB(0.6, 0.6, 0.6, 0.8);
  v10 = v9;
  v69 = v10;
  if (v6)
  {
    v88 = *MEMORY[0x1E0CA8550];
    v11 = v88;
    v89[0] = GenericRGB;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)objc_msgSend(v12, "mutableCopy");

    v86 = v11;
    v87 = v65;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(v13, "mutableCopy");

    v68 = (void *)objc_opt_new();
    v76 = (void *)objc_opt_new();
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    obj = v67;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (v14)
    {
      v71 = 1;
      v74 = *MEMORY[0x1E0CA8188];
      v75 = *(_QWORD *)v82;
      do
      {
        v77 = v14;
        for (i = 0; i != v77; ++i)
        {
          if (*(_QWORD *)v82 != v75)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          CRCastAsClass<CRFormFieldOutputRegion>(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "labelRegion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19 == 0;

            if (!v20)
            {
              objc_msgSend(v18, "labelRegion");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "addObject:", v21);

            }
          }
          if (objc_msgSend(v16, "fieldType") == 1)
            v22 = objc_msgSend(v16, "textContentType");
          else
            v22 = 0;
          +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("CRFormContentType"), &stru_1E98DC948);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v18, "labelRegion");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "text");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "labelRegion");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "text");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "length");
            if (v28 >= 0xA)
              v29 = 10;
            else
              v29 = v28;
            objc_msgSend(v25, "substringToIndex:", v29);
            v79 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v79 = 0;
          }
          v30 = CFSTR("×");
          if (objc_msgSend(v16, "fieldType") == 1)
          {
            objc_msgSend(v16, "suggestedLineHeight");
            v32 = v31 * (double)(unint64_t)objc_msgSend(v69, "height") * 0.75;
            v33 = CTFontCreateWithName(CFSTR("Menlo"), v32, 0);
            if (v33)
            {
              objc_msgSend(v72, "setObject:forKeyedSubscript:", v33, v74);

            }
            v34 = CTFontCreateWithName(CFSTR("Menlo"), v32, 0);
            if (v34)
            {
              objc_msgSend(v78, "setObject:forKeyedSubscript:", v34, v74);

            }
            v35 = v71 + i;
            v36 = (void *)MEMORY[0x1E0CB3940];
            if (v79)
              v37 = v79;
            else
              v37 = &stru_1E98DC948;
            if (v18)
            {
              objc_msgSend(v18, "labelRegion");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "recognizedLocale");
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = (void *)v39;
              v41 = &stru_1E98DC948;
              if (v39)
                v41 = (const __CFString *)v39;
              v73 = v41;
              if (v33)
                Size = CTFontGetSize(v33);
              else
                Size = 0.0;
              objc_msgSend(v36, "stringWithFormat:", CFSTR("%lu: %@ (%@) (%@) %3.1f [%d, %d]"), v35, v80, v37, v73, *(_QWORD *)&Size, objc_msgSend(v16, "hasBoundedWidth"), objc_msgSend(v16, "hasBoundedHeight"));
              v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              if (v33)
                v43 = CTFontGetSize(v33);
              else
                v43 = 0.0;
              objc_msgSend(v36, "stringWithFormat:", CFSTR("%lu: %@ (%@) %3.1f [%d, %d]"), v35, v80, v37, *(_QWORD *)&v43, objc_msgSend(v16, "hasBoundedWidth"), objc_msgSend(v16, "hasBoundedHeight"));
              v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          if (+[CRFormContentTypeUtilities contentTypeIsAutoFillable:](CRFormContentTypeUtilities, "contentTypeIsAutoFillable:", v22)&& (objc_msgSend(v16, "autofillNewContextStart") & 1) == 0)
          {
            v44 = objc_alloc(MEMORY[0x1E0CB3498]);
            v45 = v72;
          }
          else
          {
            v44 = objc_alloc(MEMORY[0x1E0CB3498]);
            v45 = v78;
          }
          v46 = (void *)objc_msgSend(v44, "initWithString:attributes:", v30, v45);
          objc_msgSend(v76, "addObject:", v46);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
        v71 += i;
      }
      while (v14);
    }

    objc_msgSend(v69, "imageByOverlayingRegions:strings:lineWidth:red:green:blue:alpha:", obj, v76, 2.0, 0.2, 0.2, 1.0, 0.8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "imageByOverlayingRegions:strings:lineWidth:red:green:blue:alpha:", v68, 0, 2.0, 0.2, 1.0, 0.2, 0.8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v69, "url");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "URLByDeletingPathExtension");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "lastPathComponent");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      v53 = v51;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("null%lu"), objc_msgSend(v69, "hash"));
      v53 = (id)objc_claimAutoreleasedReturnValue();
    }
    v62 = v53;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_%@.png"), v62, v66);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "writeToFile:", v63);

  }
  else
  {
    v54 = v10;
    objc_msgSend(v10, "imageByOverlayingRegions:strings:lineWidth:red:green:blue:alpha:", v67, 0, 2.0, 0.2, 0.2, 1.0, 0.8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "url");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "URLByDeletingPathExtension");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "lastPathComponent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
    {
      v59 = v57;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("null%lu"), objc_msgSend(v69, "hash"));
      v59 = (id)objc_claimAutoreleasedReturnValue();
    }
    v60 = v59;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/form_%@_%@.png"), v60, v66);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "writeToFile:", v61);

  }
}

+ (void)_saveAllDebugImagesForRegions:(id)a3 image:(id)a4 afterPostProcessing:(BOOL)a5
{
  _BOOL4 v5;
  CRLogger *v7;
  _BYTE *CRLogger;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a5;
  v20 = a3;
  v7 = (CRLogger *)a4;
  CRLogger = CRLogger::getCRLogger(v7);
  if (*CRLogger && (CRLogger[8] & 8) != 0)
  {
    v9 = CFSTR("a_before_pp");
    if (v5)
      v9 = CFSTR("b_after_pp");
    v10 = v9;
    objc_msgSend(v20, "_fieldsOfSource:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_fieldsOfSource:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_fieldsOfSource:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_class();
    objc_msgSend(CFSTR("mlfields_"), "stringByAppendingString:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_saveDebugImageForRegions:image:suffix:displayTypes:", v11, v7, v15, 0);

    v16 = (void *)objc_opt_class();
    objc_msgSend(CFSTR("contourfields_"), "stringByAppendingString:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_saveDebugImageForRegions:image:suffix:displayTypes:", v12, v7, v17, 0);

    v18 = (void *)objc_opt_class();
    objc_msgSend(CFSTR("textBasedfields_"), "stringByAppendingString:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_saveDebugImageForRegions:image:suffix:displayTypes:", v13, v7, v19, 0);

    if (v5)
      objc_msgSend((id)objc_opt_class(), "_saveDebugImageForRegions:image:suffix:displayTypes:", v11, v7, CFSTR("mlfields_with_types"), 1);

  }
}

- (void)analyzeImage:(id)a3 outputRegion:(id)a4
{
  id v6;
  id v7;
  CRPerformanceStatistics *formDetectionStats;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  CRPerformanceStatistics *formPostProcessingStats;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  CRFormAnalyzer *v24;
  id v25;
  id v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t *v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[5];
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  int v65;
  _QWORD v66[2];
  _QWORD v67[3];

  v67[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__15;
  v56[4] = __Block_byref_object_dispose__15;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__15;
  v54 = __Block_byref_object_dispose__15;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__15;
  v48 = __Block_byref_object_dispose__15;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__15;
  v42 = __Block_byref_object_dispose__15;
  v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__15;
  v36[4] = __Block_byref_object_dispose__15;
  v37 = 0;
  formDetectionStats = self->_formDetectionStats;
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke;
  v28[3] = &unk_1E98DB0F0;
  v31 = &v44;
  v28[4] = self;
  v10 = v6;
  v29 = v10;
  v11 = v7;
  v30 = v11;
  v32 = v56;
  v33 = &v38;
  v34 = v36;
  v35 = &v50;
  -[CRPerformanceStatistics measureBlock:](formDetectionStats, "measureBlock:", v28);
  objc_msgSend((id)objc_opt_class(), "_saveAllDebugImagesForRegions:image:afterPostProcessing:", v51[5], v10, 0);
  v66[0] = CFSTR("ShouldSurfaceContourBasedFormFieldsOption");
  v66[1] = CFSTR("ShouldSurfaceTextBasedFormFieldsOption");
  v67[0] = MEMORY[0x1E0C9AAB0];
  v67[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  formPostProcessingStats = self->_formPostProcessingStats;
  v20 = v9;
  v21 = 3221225472;
  v22 = __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke_100;
  v23 = &unk_1E98DB118;
  v27 = &v50;
  v24 = self;
  v14 = v11;
  v25 = v14;
  v15 = v12;
  v26 = v15;
  -[CRPerformanceStatistics measureBlock:](formPostProcessingStats, "measureBlock:", &v20);
  objc_msgSend((id)objc_opt_class(), "_saveAllDebugImagesForRegions:image:afterPostProcessing:", v51[5], v10, 1, v20, v21, v22, v23, v24);
  CROSLogForCategory(6);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend((id)v45[5], "count");
    v18 = objc_msgSend((id)v39[5], "count");
    v19 = objc_msgSend(v14, "formness");
    *(_DWORD *)buf = 136315906;
    v59 = "-[CRFormAnalyzer analyzeImage:outputRegion:]";
    v60 = 2048;
    v61 = v17;
    v62 = 2048;
    v63 = v18;
    v64 = 1024;
    v65 = v19;
    _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEFAULT, "%s: %lu ML fields detected; %lu contour-based fields detected; formness: %d;",
      buf,
      0x26u);
  }

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(v56, 8);
}

void __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint8_t v32[8];
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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRFormDetection", ", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1D826E7B0]();
  objc_msgSend(*(id *)(a1 + 32), "modelDetector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v7, "detectFormFieldsInImage:document:outputCandidateResults:", v8, v9, &obj);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "contourBasedDetector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "detectFormFieldsInImage:", *(_QWORD *)(a1 + 40));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    objc_msgSend(*(id *)(a1 + 32), "textBasedDetector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detectFormFieldsInImage:document:candidateFields:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v22)
      v22 = (void *)MEMORY[0x1E0C9AA60];
    v23 = v22;
    v24 = v23;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      objc_msgSend(v23, "arrayByAddingObjectsFromArray:");
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v25;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      objc_msgSend(v24, "arrayByAddingObjectsFromArray:");
      v26 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v26;
    }
    +[CRFormParser convertDetectedFields:](CRFormParser, "convertDetectedFields:", v24);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    objc_autoreleasePoolPop(v6);
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v30 = (id)CRSignpostLog_signPostOSLog;
    v31 = v30;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v31, OS_SIGNPOST_INTERVAL_END, v3, "OCRFormDetection", ", v32, 2u);
    }

  }
  else
  {
    objc_autoreleasePoolPop(v6);
  }
}

void __44__CRFormAnalyzer_analyzeImage_outputRegion___block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRFormPostProcessing", ", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1D826E7B0]();
  objc_msgSend(*(id *)(a1 + 32), "postProcessingManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "process:document:options:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 40), "setFormFieldRegions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_autoreleasePoolPop(v6);
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v11 = (id)CRSignpostLog_signPostOSLog;
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v12, OS_SIGNPOST_INTERVAL_END, v3, "OCRFormPostProcessing", ", v13, 2u);
  }

}

- (void)exportSerializedResults:(id)a3 forImage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "bufferHash");
  if (qword_1ED0B46F8 != -1)
    dispatch_once(&qword_1ED0B46F8, &__block_literal_global_28);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("form_result_%lX.dat"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "writeToFileInFolder:basename:", _MergedGlobals_28, v8);
  CROSLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[CRFormAnalyzer exportSerializedResults:forImage:]";
    v13 = 2112;
    v14 = _MergedGlobals_28;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEBUG, "%s: Saving serialized result at location: %@/%@", buf, 0x20u);
  }

}

void __51__CRFormAnalyzer_exportSerializedResults_forImage___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_28;
  _MergedGlobals_28 = v1;

}

- (id)fetchSerializedResultsForImage:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CRNormalizedQuad *v25;
  CRFormTextFieldOutputRegion *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v3 = objc_msgSend(v33, "bufferHash");
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/AppleInternal/Library/Frameworks/CoreRecognitionToolkit.framework/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FormSerializedResults/form_result_%lX.dat"), v3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FormSerializedResults/form_result_%lX.dat"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  CROSLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v39 = "-[CRFormAnalyzer fetchSerializedResultsForImage:]";
    v40 = 2112;
    v41 = v7;
    v42 = 2112;
    v43 = v32;
    _os_log_impl(&dword_1D4FB8000, v6, OS_LOG_TYPE_DEBUG, "%s: Attempting to fetch serialized result from location: %@/%@", buf, 0x20u);

  }
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v35, 0, &v37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v37;
  if (v8)
    goto LABEL_6;
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/Resources/"), CFSTR("/AppleInternal/Library/Frameworks/CoreRecognitionToolkit.framework/"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FormSerializedResults/form_result_%lX.dat"), v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v34;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v13, 0, &v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;

  if (v8)
  {
    v4 = v11;
    v34 = v14;
    v35 = v13;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CROSLogForCategory(6);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v35, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v39 = "-[CRFormAnalyzer fetchSerializedResultsForImage:]";
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEBUG, "%s: Successfully fetched serialized result from location: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "size");
    v20 = v19;
    v22 = v21;
    v23 = 0;
    v24 = MEMORY[0x1E0C9AA60];
    do
    {
      v25 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:]([CRNormalizedQuad alloc], "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", (double)v23 * 0.02 + 0.9, 0.9, (double)v23 * 0.02 + 0.91, 0.9, (double)v23 * 0.02 + 0.91, 0.91, (double)v23 * 0.02 + 0.9, 0.91, v20, v22);
      v26 = -[CRFormFieldOutputRegion initWithQuad:labelRegion:subFields:source:]([CRFormTextFieldOutputRegion alloc], "initWithQuad:labelRegion:subFields:source:", v25, 0, v24, 1);
      -[NSObject addObject:](v18, "addObject:", v26);

      ++v23;
    }
    while (v23 != 3);
    objc_msgSend(v15, "formFieldRegions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFormFieldRegions:", v28);

    goto LABEL_11;
  }
  CROSLogForCategory(6);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "absoluteString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v39 = "-[CRFormAnalyzer fetchSerializedResultsForImage:]";
    v40 = 2112;
    v41 = v30;
    v42 = 2112;
    v43 = v31;
    _os_log_impl(&dword_1D4FB8000, v18, OS_LOG_TYPE_DEBUG, "%s: Unable to fetch serialized result from tentative location: %@, error = %@", buf, 0x20u);

  }
  v8 = 0;
  v15 = 0;
  v4 = v11;
  v34 = v14;
  v35 = v13;
LABEL_11:

  return v15;
}

- (BOOL)shouldRunDetectionForDocument:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  float v32;
  float v33;
  double *v34;
  double *v35;
  double *v36;
  int64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  double *v42;
  uint64_t v43;
  unint64_t v44;
  double *v45;
  double *v46;
  double v47;
  char v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  NSObject *v54;
  NSObject *log;
  double v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  void *__p;
  double *v62;
  unint64_t v63;
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CRFormAnalyzer configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "gatingWithOCRResults");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8 <= 0x4F)
    {
      CROSLogForCategory(6);
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        v67 = 2048;
        v68 = COERCE_DOUBLE(objc_msgSend(v9, "length"));
        _os_log_impl(&dword_1D4FB8000, log, OS_LOG_TYPE_DEBUG, "%s: Gated by character count %lu", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_55;
    }
    objc_msgSend(v4, "contentsWithTypes:", 8);
    log = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject count](log, "count") <= 3)
    {
      CROSLogForCategory(6);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        v67 = 2048;
        v68 = COERCE_DOUBLE(-[NSObject count](log, "count"));
        _os_log_impl(&dword_1D4FB8000, v54, OS_LOG_TYPE_DEBUG, "%s: Gated by line count %lu", buf, 0x16u);
      }
LABEL_15:
      v10 = 0;
LABEL_54:

LABEL_55:
      goto LABEL_56;
    }
    objc_msgSend(v4, "contentsWithTypes:", 2);
    v54 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject count](v54, "count") <= 1
      && (unint64_t)-[NSObject count](log, "count") <= 7)
    {
      CROSLogForCategory(6);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        v67 = 2048;
        v68 = COERCE_DOUBLE(-[NSObject count](v54, "count"));
        v69 = 2048;
        v70 = COERCE_DOUBLE(-[NSObject count](log, "count"));
        _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_DEBUG, "%s: Gated by block count %lu and line count %lu", buf, 0x20u);
      }

      goto LABEL_15;
    }
    __p = 0;
    v62 = 0;
    v63 = 0;
    std::vector<double>::reserve(&__p, -[NSObject count](log, "count"));
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v12 = log;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v58;
      v56 = 1.0;
      v15 = 0.0;
      v16 = 0.0;
      v17 = 1.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v58 != v14)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v19, "boundingQuad");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "topLeft");
          v22 = v21;

          objc_msgSend(v19, "boundingQuad");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "topRight");
          v25 = v24;

          objc_msgSend(v19, "boundingQuad");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "topLeft");
          v28 = v27;

          objc_msgSend(v19, "boundingQuad");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "bottomLeft");
          v31 = v30;

          objc_msgSend(v19, "visualTextAngle");
          v33 = fabsf(v32);
          v34 = v62;
          if ((unint64_t)v62 >= v63)
          {
            v36 = (double *)__p;
            v37 = ((char *)v62 - (_BYTE *)__p) >> 3;
            v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 61)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v39 = v63 - (_QWORD)__p;
            if ((uint64_t)(v63 - (_QWORD)__p) >> 2 > v38)
              v38 = v39 >> 2;
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
              v40 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v40 = v38;
            if (v40)
            {
              v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v63, v40);
              v36 = (double *)__p;
              v34 = v62;
            }
            else
            {
              v41 = 0;
            }
            v42 = (double *)&v41[8 * v37];
            *v42 = v33;
            v35 = v42 + 1;
            while (v34 != v36)
            {
              v43 = *((_QWORD *)v34-- - 1);
              *((_QWORD *)v42-- - 1) = v43;
            }
            __p = v42;
            v62 = v35;
            v63 = (unint64_t)&v41[8 * v40];
            if (v36)
              operator delete(v36);
          }
          else
          {
            *v62 = v33;
            v35 = v34 + 1;
          }
          v56 = fmin(v56, v22);
          v15 = fmax(v15, v25);
          v17 = fmin(v17, v28);
          v16 = fmax(v16, v31);
          v62 = v35;
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v13);

      if (v56 <= 0.5 && v17 <= 0.5)
      {
        if (v15 - v56 >= 0.22 && v16 - v17 >= 0.04)
        {
          v44 = ((unint64_t)-[NSObject count](v12, "count") >> 1) - 1;
          v45 = (double *)__p;
          v46 = (double *)((char *)__p + 8 * v44);
          if (v46 != v62)
          {
            std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((uint64_t)__p, v46, v62);
            v45 = (double *)__p;
          }
          v47 = v45[v44];
          if (v47 <= 0.1)
          {
            v48 = 1;
            goto LABEL_53;
          }
          CROSLogForCategory(6);
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
            v67 = 2048;
            v68 = v47;
            v50 = "%s: Gated by insufficient horizontality in the text, median line deviation is %lf";
            v51 = v49;
            v52 = 22;
            goto LABEL_51;
          }
LABEL_52:

          v48 = 0;
          v10 = 0;
          v45 = (double *)__p;
          if (!__p)
            goto LABEL_54;
LABEL_53:
          v62 = v45;
          operator delete(v45);
          v10 = v48;
          goto LABEL_54;
        }
        CROSLogForCategory(6);
        v49 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          goto LABEL_52;
        *(_DWORD *)buf = 136315650;
        v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
        v67 = 2048;
        v68 = v15 - v56;
        v69 = 2048;
        v70 = v16 - v17;
        v50 = "%s: Gated by x-range %lf and y-range %lf";
LABEL_50:
        v51 = v49;
        v52 = 32;
LABEL_51:
        _os_log_impl(&dword_1D4FB8000, v51, OS_LOG_TYPE_DEBUG, v50, buf, v52);
        goto LABEL_52;
      }
    }
    else
    {

      v17 = 1.0;
      v56 = 1.0;
    }
    CROSLogForCategory(6);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      goto LABEL_52;
    *(_DWORD *)buf = 136315650;
    v66 = "-[CRFormAnalyzer shouldRunDetectionForDocument:]";
    v67 = 2048;
    v68 = v56;
    v69 = 2048;
    v70 = v17;
    v50 = "%s: Gated by min-x %lf and min-y %lf";
    goto LABEL_50;
  }
  v10 = 1;
LABEL_56:

  return v10;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return self->_configuration;
}

- (CRFormDetector)modelDetector
{
  return self->_modelDetector;
}

- (CRFormContourBasedDetector)contourBasedDetector
{
  return self->_contourBasedDetector;
}

- (CRFormTextBasedDetector)textBasedDetector
{
  return self->_textBasedDetector;
}

- (CRFormPostProcessingManager)postProcessingManager
{
  return self->_postProcessingManager;
}

- (CRPerformanceStatistics)formDetectionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 48, 1);
}

- (CRPerformanceStatistics)formPostProcessingStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formPostProcessingStats, 0);
  objc_storeStrong((id *)&self->_formDetectionStats, 0);
  objc_storeStrong((id *)&self->_postProcessingManager, 0);
  objc_storeStrong((id *)&self->_textBasedDetector, 0);
  objc_storeStrong((id *)&self->_contourBasedDetector, 0);
  objc_storeStrong((id *)&self->_modelDetector, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

@implementation CREngineFast

- (CREngineFast)initWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  CREngineFast *v6;
  CREngineFast *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  CRLanguageCorrection *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CRLanguageCorrection *v19;
  CRPerformanceStatistics *v20;
  CRPerformanceStatistics *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CREngineFast;
  v6 = -[CREngineFast init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CREngineFast setOptions:](v6, "setOptions:", v5);
    -[CREngineFast setShouldCancel:](v7, "setShouldCancel:", 0);
    -[CREngineFast setRevision:](v7, "setRevision:", +[CRImageReader defaultRevisionNumber](CRImageReader, "defaultRevisionNumber"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CRImageReaderRevisionKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CREngineFast setRevision:](v7, "setRevision:", objc_msgSend(v9, "unsignedIntegerValue"));

    }
    -[CREngineFast options](v7, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableLanguageCorrection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((v12 & 1) == 0)
    {
      +[CRImageReader languageSetFromOptionsDictionary:](CRImageReader, "languageSetFromOptionsDictionary:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = [CRLanguageCorrection alloc];
      v16 = -[CREngineFast revision](v7, "revision");
      -[CREngineFast options](v7, "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CRImageReaderDynamicLexicon"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CRLanguageCorrection initWithRevision:localeCode:customWords:](v15, "initWithRevision:localeCode:customWords:", v16, v14, v18);
      -[CREngineFast setLanguageCorrection:](v7, "setLanguageCorrection:", v19);

    }
    v20 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Text Recognition"), 0);
    -[CREngineFast setTextRecognitionStats:](v7, "setTextRecognitionStats:", v20);

    v21 = -[CRPerformanceStatistics initWithName:measureRecentPeak:]([CRPerformanceStatistics alloc], "initWithName:measureRecentPeak:", CFSTR("Language Correction"), 0);
    -[CREngineFast setLanguageCorrectionStats:](v7, "setLanguageCorrectionStats:", v21);

  }
  return v7;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double width;
  double height;
  CGSize result;

  width = a4.width;
  height = a4.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (id)supportedLanguagesForRevision:(int64_t)a3 error:(id *)a4
{
  return +[CRLanguageCorrection supportedLanguagesForRevision:error:](CRLanguageCorrection, "supportedLanguagesForRevision:error:", a3, a4);
}

+ (id)supportedComputeDevicesForRevision:(int64_t)a3
{
  void *v3;
  void *v4;

  +[CRComputeDeviceUtilities allComputeDevices](CRComputeDeviceUtilities, "allComputeDevices", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRComputeDeviceUtilities computeDevices:ofTypes:](CRComputeDeviceUtilities, "computeDevices:ofTypes:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6
{
  return 1;
}

- (id)thresholdsForTextRegion:(id)a3 withLocale:(id)a4
{
  CRConfidenceThresholds *v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;

  v5 = [CRConfidenceThresholds alloc];
  -[CREngineFast mediumConfidenceThreshold](self, "mediumConfidenceThreshold");
  v7 = v6;
  -[CREngineFast highConfidenceThreshold](self, "highConfidenceThreshold");
  LODWORD(v9) = v8;
  LODWORD(v10) = v7;
  return -[CRConfidenceThresholds initWithMediumThreshold:highThreshold:](v5, "initWithMediumThreshold:highThreshold:", v10, v9);
}

- (float)mediumConfidenceThreshold
{
  void *v2;
  float result;

  -[CREngineFast languageCorrection](self, "languageCorrection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0.8;
  if (v2)
    return 0.25;
  return result;
}

- (float)highConfidenceThreshold
{
  void *v2;
  float result;

  -[CREngineFast languageCorrection](self, "languageCorrection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0.4;
  if (!v2)
    return 1.0;
  return result;
}

- (id)resultDocumentInImage:(id)a3 options:(id)a4 trackingSession:(id)a5 withProgressHandler:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  id v49;
  id *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v54 = a4;
  v52 = v11;
  v53 = a6;
  if (!-[CREngineFast shouldCancel](self, "shouldCancel"))
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__19;
    v72 = __Block_byref_object_dispose__19;
    v73 = 0;
    -[CREngineFast textRecognitionStats](self, "textRecognitionStats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __88__CREngineFast_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke;
    v64[3] = &unk_1E98DBA30;
    v67 = &v68;
    v14 = v11;
    v65 = v14;
    v15 = v54;
    v66 = v15;
    objc_msgSend(v13, "measureBlock:", v64);

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CRImageReaderMinimumTextHeight"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    if (v18 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend((id)v69[5], "detectorResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textFeatures");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = a7;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v61 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v25, "calculateTextBoxHeightForImageWidth:imageHeight:", objc_msgSend(v14, "width"), objc_msgSend(v14, "height"));
            if ((float)(v26 / (float)(unint64_t)objc_msgSend(v14, "height")) >= v18)
              objc_msgSend(v19, "addObject:", v25);
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
        }
        while (v22);
      }

      a7 = v50;
      objc_msgSend((id)v69[5], "detectorResults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTextFeatures:", v19);

    }
    if (-[CREngineFast shouldCancel](self, "shouldCancel"))
    {
      if (a7)
      {
        +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
        v12 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
LABEL_48:

      _Block_object_dispose(&v68, 8);
      goto LABEL_49;
    }
    objc_msgSend(v15, "objectForKey:", CFSTR("CRImageReaderSaveLatticeInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectionOnly"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLValue");

    if (v31)
    {
      objc_msgSend((id)v69[5], "detectorResults");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textFeatures");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
LABEL_33:

      if (v29)
      {
        objc_msgSend((id)v69[5], "recognizerResults");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setLatticeResults:", v49);

      }
      if (-[CREngineFast shouldCancel](self, "shouldCancel"))
      {
        if (a7)
        {
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
          v12 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        objc_msgSend((id)v69[5], "recognizerResults");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setTextFeatures:", v51);

        objc_msgSend((id)v69[5], "setTextFeatures:", v51);
        v40 = (void *)objc_opt_new();
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v41 = v51;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v56 != v43)
                objc_enumerationMutation(v41);
              v45 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
              objc_msgSend(v14, "size");
              +[CRLineOutputRegion lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:](CRLineOutputRegion, "lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:", v45, 32, self, 0);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v46);

            }
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
          }
          while (v42);
        }

        objc_msgSend(v14, "size");
        +[CRDocumentOutputRegion documentWithLines:title:confidence:imageSize:](CRDocumentOutputRegion, "documentWithLines:title:confidence:imageSize:", v40, 0, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v69[5], "detectorResults");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDetectorResults:", v47);

      }
      goto LABEL_48;
    }
    -[CREngineFast languageCorrection](self, "languageCorrection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    v35 = (void *)v69[5];
    if (v34)
    {
      objc_msgSend(v35, "detectorResults");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textFeatures");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CREngineFast filterResultsForTextFeatures:](self, "filterResultsForTextFeatures:", v36);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v35, "detectorResults");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textFeatures");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        v37 = &v59;
      else
        v37 = 0;
      if (v29)
        v59 = 0;
      -[CREngineFast applyLanguageCorrectionToResults:image:latticeResults:progressHandler:](self, "applyLanguageCorrectionToResults:image:latticeResults:progressHandler:", v36, v14, v37, v53);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v49 = v59;
LABEL_32:

        goto LABEL_33;
      }
    }
    v49 = 0;
    goto LABEL_32;
  }
  if (a7)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -3);
    v12 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_49:

  return v12;
}

void __88__CREngineFast_resultDocumentInImage_options_trackingSession_withProgressHandler_error___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
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
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRTextRecognitionTime", ", buf, 2u);
  }

  +[CRFuthark detectAndRecognizeTextInImage:options:](CRFuthark, "detectAndRecognizeTextInImage:options:", a1[4], a1[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v9 = (id)CRSignpostLog_signPostOSLog;
  v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v10, OS_SIGNPOST_INTERVAL_END, v3, "OCRTextRecognitionTime", ", v11, 2u);
  }

}

- (id)computeDevice
{
  void *v2;
  void *v3;

  -[CREngineFast options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CRImageReaderComputeDeviceKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filterResultsForTextFeatures:(id)a3
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  id v33;
  void *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  CREngineFast *v38;
  uint64_t i;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  _BYTE v50[128];
  void *v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v33, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v33;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v46;
    v38 = self;
    while (2)
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (-[CREngineFast shouldCancel](self, "shouldCancel"))
        {

          v31 = 0;
          v30 = v34;
          goto LABEL_27;
        }
        objc_msgSend(v40, "stringValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setStringValueCandidates:", v7);

        objc_msgSend(v40, "subFeatures");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setSubFeatureCandidates:", v9);

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v40, "subFeatures");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v42;
          v13 = 0.0;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v42 != v12)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
              objc_msgSend(v15, "candidateProbs");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "count");
              if (v17)
              {
                objc_msgSend(v15, "candidateProbs");
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
                v4 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v4;
              }
              else
              {
                v18 = &unk_1E9926BC8;
              }
              objc_msgSend(v15, "setConfidence:", v18);
              if (v17)
              {

              }
              objc_msgSend(v15, "confidence");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "doubleValue");
              v21 = v20;

              v13 = v13 + v21;
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v11);
        }
        else
        {
          v13 = 0.0;
        }

        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v40, "subFeatures");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberWithDouble:", v13 / (double)(unint64_t)objc_msgSend(v23, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setConfidence:", v24);

        objc_msgSend(v40, "confidence");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setCandidateProbs:", v26);

        objc_msgSend(v40, "confidence");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CREngineFast options](v38, "options");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[CREngineFast noLMValidateProbability:options:](v38, "noLMValidateProbability:options:", v27, v28);

        if (v29)
          objc_msgSend(v34, "addObject:", v40);
        self = v38;
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v37)
        continue;
      break;
    }
  }

  v30 = v34;
  v31 = v34;
LABEL_27:

  return v31;
}

- (id)applyLanguageCorrectionToResults:(id)a3 image:(id)a4 latticeResults:(id *)a5 progressHandler:(id)a6
{
  NSArray *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  NSArray *v21;
  char v22;
  void *v23;
  id v24;
  NSArray *v26;
  CRLatticeResults *v27;
  id v28;
  void *v29;
  CRImage *v30;
  _QWORD v31[6];
  CRImage *v32;
  CRLatticeResults *v33;
  id v34;
  NSArray *v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[3];
  int v48;
  _QWORD v49[3];
  int v50;
  _QWORD v51[4];
  _QWORD v52[6];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = (NSArray *)a3;
  v30 = (CRImage *)a4;
  v28 = a6;
  v26 = v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v10, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray count](v10, "count"))
    goto LABEL_19;
  if (a5)
  {
    v27 = objc_retainAutorelease(objc_alloc_init(CRLatticeResults));
    *a5 = v27;
  }
  else
  {
    v27 = 0;
  }
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0xB012000000;
  v52[3] = __Block_byref_object_copy__16;
  v52[4] = __Block_byref_object_dispose__17;
  v52[5] = "\"4";
  Segmenter::Segmenter((Segmenter *)v53, v10, v30, 0, 0, 0, 0, 1, 0);
  -[CREngineFast options](self, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CRTextRecognizerNumberResultsNeeded"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");
  if (v13 <= 4)
    v14 = 4;
  else
    v14 = v13;

  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 1060320051;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = v26;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (-[CREngineFast shouldCancel](self, "shouldCancel"))
        {
          v22 = 0;
          goto LABEL_18;
        }
        -[CREngineFast languageCorrectionStats](self, "languageCorrectionStats");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __86__CREngineFast_applyLanguageCorrectionToResults_image_latticeResults_progressHandler___block_invoke;
        v31[3] = &unk_1E98DBA58;
        v31[4] = v19;
        v31[5] = self;
        v32 = v30;
        v37 = v52;
        v38 = v51;
        v41 = v14;
        v33 = v27;
        v34 = v29;
        v36 = v28;
        v39 = v47;
        v40 = v49;
        v21 = v15;
        v35 = v21;
        v42 = 0x3FE6666666666666;
        objc_msgSend(v20, "measureBlock:", v31);

      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      if (v16)
        continue;
      break;
    }
  }
  v22 = 1;
LABEL_18:

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v52, 8);
  Segmenter::~Segmenter((Segmenter *)v53);

  if ((v22 & 1) == 0)
  {
    v24 = 0;
    v23 = v29;
  }
  else
  {
LABEL_19:
    v23 = v29;
    v24 = v29;
  }

  return v24;
}

void __86__CREngineFast_applyLanguageCorrectionToResults_image_latticeResults_progressHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t i;
  void *v26;
  unint64_t v27;
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
  void *v39;
  int v40;
  float v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  os_signpost_id_t v46;
  unint64_t v47;
  uint8_t v48[16];
  uint8_t buf[16];

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v2 = (id)CRSignpostLog_signPostOSLog;
  v3 = os_signpost_id_generate(v2);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v4 = (id)CRSignpostLog_signPostOSLog;
  v5 = v4;
  v47 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "OCRLanguageCorrectionTime", ", buf, 2u);
  }

  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(a1 + 40), "languageCorrection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 72), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  if (*(_BYTE *)(v10 + 162))
  {
    v12 = *(double *)(*(_QWORD *)(v10 + 112) + 8 * v11);
    v13 = v12 + v12;
  }
  else
  {
    v13 = -1.0;
  }
  v14 = *(_QWORD *)(v10 + 136);
  if (v11 >= (*(_QWORD *)(v10 + 144) - v14) >> 3)
    std::vector<double>::__throw_out_of_range[abi:ne180100]();
  v15 = *(_QWORD *)(v10 + 48);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v10 + 56) - v15) >> 3) <= v11)
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  v16 = *(double *)(v14 + 8 * v11);
  objc_msgSend(*(id *)(a1 + 40), "options");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v45) = 2;
  BYTE4(v44) = 1;
  LODWORD(v44) = *(_QWORD *)(a1 + 120);
  objc_msgSend(v7, "correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:", v6, v8, v9, v15 + 24 * v11, v10 + 48, v17, v13, v16, v44, v45, *(_QWORD *)(a1 + 56));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(void **)(a1 + 40);
  objc_msgSend(v18, "confidence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v19, "lmValidateProbability:options:", v20, v21);

  if ((_DWORD)v19)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_new();
    v46 = v3;
    for (i = 0; ; ++i)
    {
      objc_msgSend(v18, "stringValueCandidates");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (i >= v27)
        break;
      v28 = *(void **)(a1 + 40);
      objc_msgSend(v18, "candidateProbs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndex:", i);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "options");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = objc_msgSend(v28, "lmValidateProbability:options:", v30, v31);

      if ((_DWORD)v28)
      {
        objc_msgSend(v18, "candidateProbs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndex:", i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v33);

        objc_msgSend(v18, "stringValueCandidates");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndex:", i);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v35);

        objc_msgSend(v18, "subFeatureCandidates");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndex:", i);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v37);

      }
    }
    v3 = v46;
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v23, "objectAtIndex:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setStringValue:", v38);

      objc_msgSend(v18, "setStringValueCandidates:", v23);
      objc_msgSend(v18, "setCandidateProbs:", v22);
      objc_msgSend(v24, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSubFeatures:", v39);

      objc_msgSend(v18, "setSubFeatureCandidates:", v24);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v18);
    }

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  if (*(_QWORD *)(a1 + 80))
  {
    v40 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    v41 = *(double *)(a1 + 128)
        + (double)v40
        / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 72), "count")
        * (1.0 - *(double *)(a1 + 128));
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v41;
    (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                            + 24));
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v42 = (id)CRSignpostLog_signPostOSLog;
  v43 = v42;
  if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)v48 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v43, OS_SIGNPOST_INTERVAL_END, v3, "OCRLanguageCorrectionTime", ", v48, 2u);
  }

}

- (BOOL)lmValidateProbability:(id)a3 options:(id)a4
{
  return -[CREngineFast validateProbability:validRangeMin:validRangeMax:options:](self, "validateProbability:validRangeMin:validRangeMax:options:", a3, a4, 0.0, 1.0);
}

- (BOOL)noLMValidateProbability:(id)a3 options:(id)a4
{
  return -[CREngineFast validateProbability:validRangeMin:validRangeMax:options:](self, "validateProbability:validRangeMin:validRangeMax:options:", a3, a4, 0.0, 1.0);
}

- (BOOL)validateProbability:(id)a3 validRangeMin:(double)a4 validRangeMax:(double)a5 options:(id)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "objectForKey:", CFSTR("CRImageReaderPrecisionThresholdKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v9, "doubleValue");
  LOBYTE(v11) = v14 >= a4 + v13 * (a5 - a4);

  return (char)v11;
}

- (CRPerformanceStatistics)textRecognitionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTextRecognitionStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRPerformanceStatistics)languageCorrectionStats
{
  return (CRPerformanceStatistics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguageCorrectionStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CRLanguageCorrection)languageCorrection
{
  return self->_languageCorrection;
}

- (void)setLanguageCorrection:(id)a3
{
  objc_storeStrong((id *)&self->_languageCorrection, a3);
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCorrection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_languageCorrectionStats, 0);
  objc_storeStrong((id *)&self->_textRecognitionStats, 0);
}

@end

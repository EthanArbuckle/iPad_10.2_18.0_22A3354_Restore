@implementation CRImageReader

- (CRImageReader)initWithOptions:(id)a3
{
  return -[CRImageReader initWithOptions:error:](self, "initWithOptions:error:", a3, 0);
}

- (CRImageReader)initWithOptions:(id)a3 error:(id *)a4
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  CRImageReader *v13;
  CRImageReader *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  CRImageReader *v24;
  NSObject *v25;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v6 = (id)CRSignpostLog_signPostOSLog;
  v7 = os_signpost_id_generate(v6);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v8 = (id)CRSignpostLog_signPostOSLog;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "OCRInitializationTime", ", buf, 2u);
  }

  CROSLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "_jsonStringFromOptions:", v27);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "UTF8String");
    *(_DWORD *)buf = 136315394;
    v31 = "-[CRImageReader initWithOptions:error:]";
    v32 = 2080;
    v33 = v12;
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEFAULT, "%s: options=%s", buf, 0x16u);

  }
  v29.receiver = self;
  v29.super_class = (Class)CRImageReader;
  v13 = -[CRImageReader init](&v29, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_13;
  -[CRImageReader setShouldCancel:](v13, "setShouldCancel:", 0);
  objc_msgSend((id)objc_opt_class(), "defaultOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "addEntriesFromDictionary:", v27);
  -[CRImageReader setUserOptions:](v14, "setUserOptions:", v16);
  v17 = (void *)objc_opt_class();
  -[CRImageReader userOptions](v14, "userOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v17, "_engineFromOptions:error:", v18, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;
  -[CRImageReader setEngine:](v14, "setEngine:", v19);

  -[CRImageReader engine](v14, "engine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = v21 == 0;

  if (!(_DWORD)v18)
  {

LABEL_13:
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v22 = (id)CRSignpostLog_signPostOSLog;
    v23 = v22;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v23, OS_SIGNPOST_INTERVAL_END, v7, "OCRInitializationTime", ", buf, 2u);
    }

    v24 = v14;
    goto LABEL_24;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v20);
  CROSLogForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (const char *)v16;
    _os_log_impl(&dword_1D4FB8000, v25, OS_LOG_TYPE_FAULT, "Unable to initialize CREngine with options: %@", buf, 0xCu);
  }

  v24 = 0;
LABEL_24:

  return v24;
}

- (NSArray)outputObjectTypes
{
  return self->_outputObjectTypes;
}

- (void)setOutputObjectTypes:(id)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSArray *outputObjectTypes;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CROutputTypeText")) & 1) == 0)
          NSLog(CFSTR("Output object type %@ not supported by CRImageReader"), v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  outputObjectTypes = self->_outputObjectTypes;
  self->_outputObjectTypes = v4;

}

- (id)resultsForPixelBuffer:(__CVBuffer *)a3 options:(id)a4 error:(id *)a5
{
  -[CRImageReader resultsForPixelBuffer:roi:options:error:](self, "resultsForPixelBuffer:roi:options:error:", a3, a4, a5, 0.0, 0.0, 1.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resultsForPixelBuffer:(__CVBuffer *)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6
{
  -[CRImageReader resultsForPixelBuffer:roi:options:error:withProgressHandler:](self, "resultsForPixelBuffer:roi:options:error:withProgressHandler:", a3, a5, a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resultsForPixelBuffer:(__CVBuffer *)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6 withProgressHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  CRImage_PixelBuffer *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a7;
  v17 = -[CRImage_PixelBuffer initWithCVPixelBuffer:]([CRImage_PixelBuffer alloc], "initWithCVPixelBuffer:", a3);
  CROSLogForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = -[CRImage_PixelBuffer width](v17, "width");
    v20 = -[CRImage_PixelBuffer height](v17, "height");
    objc_msgSend((id)objc_opt_class(), "_jsonStringFromOptions:", v15);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = 136316930;
    v25 = "-[CRImageReader resultsForPixelBuffer:roi:options:error:withProgressHandler:]";
    v26 = 2048;
    v27 = v19;
    v28 = 2048;
    v29 = v20;
    v30 = 2048;
    v31 = x;
    v32 = 2048;
    v33 = y;
    v34 = 2048;
    v35 = width;
    v36 = 2048;
    v37 = height;
    v38 = 2080;
    v39 = objc_msgSend(v21, "UTF8String");
    _os_log_impl(&dword_1D4FB8000, v18, OS_LOG_TYPE_DEFAULT, "%s: image={w:%lu,h:%lu} roi={x:%lf,y:%lf,w:%lf,h:%lf} options=%s", (uint8_t *)&v24, 0x52u);

  }
  -[CRImageReader resultsForCRImage:roi:options:error:withProgressHandler:](self, "resultsForCRImage:roi:options:error:withProgressHandler:", v17, v15, a6, v16, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)resultsForCRImage:(id)a3 roi:(CGRect)a4 options:(id)a5 error:(id *)a6 withProgressHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  unint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  uint64_t v50;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v50 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v42 = a5;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v43 = v15;
  -[CRImageReader outputObjectTypes](self, "outputObjectTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", CFSTR("CROutputTypeText"));

  if (v19)
  {
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v20 = (id)CRSignpostLog_signPostOSLog;
    v21 = os_signpost_id_generate(v20);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v22 = (id)CRSignpostLog_signPostOSLog;
    v23 = v22;
    v39 = v21 - 1;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "OCREndToEndTime", ", buf, 2u);
    }

    -[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:](self, "resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:", v41, v42, 0, a6, v43, x, y, width, height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentsWithTypes:", 8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v40, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v26 = v40;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v24, "title", v39);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31 == v30;

          +[CRImageReaderOutput outputWithType:outputRegion:isTitle:](CRImageReaderOutput, "outputWithType:outputRegion:isTitle:", CFSTR("CROutputTypeText"), v30, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v33);

        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v27);
    }

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v34 = (id)CRSignpostLog_signPostOSLog;
    v35 = v34;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v35, OS_SIGNPOST_INTERVAL_END, v21, "OCREndToEndTime", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v43;
  }
  else
  {
    if (a6)
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -1);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v37 = v43;
    if (v43)
      (*((void (**)(id, _QWORD, double))v43 + 2))(v43, 0, 0.0);
    v36 = 0;
  }

  return v36;
}

- (id)documentOutputRegionForImage:(id)a3 options:(id)a4 roi:(CGRect)a5 error:(id *)a6 withProgressHandler:(id)a7
{
  -[CRImageReader documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:](self, "documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:", a3, a4, 0, a6, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)documentOutputRegionForImage:(id)a3 options:(id)a4 roi:(CGRect)a5 trackingSession:(id)a6 error:(id *)a7 withProgressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  int v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v43 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a8;
  CROSLogForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(v17, "width");
    v23 = objc_msgSend(v17, "height");
    objc_msgSend((id)objc_opt_class(), "_jsonStringFromOptions:", v18);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = 136316930;
    v28 = "-[CRImageReader documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:]";
    v29 = 2048;
    v30 = v22;
    v31 = 2048;
    v32 = v23;
    v33 = 2048;
    v34 = x;
    v35 = 2048;
    v36 = y;
    v37 = 2048;
    v38 = width;
    v39 = 2048;
    v40 = height;
    v41 = 2080;
    v42 = objc_msgSend(v24, "UTF8String");
    _os_log_impl(&dword_1D4FB8000, v21, OS_LOG_TYPE_DEFAULT, "%s: image={w:%lu,h:%lu} roi={x:%lf,y:%lf,w:%lf,h:%lf} options=%s", (uint8_t *)&v27, 0x52u);

  }
  -[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:](self, "resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:", v17, v18, v19, a7, v20, x, y, width, height);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (CGSize)smallestImageSizeForTextWithRelativeHeight:(double)a3 originalImageSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[CRImageReader engine](self, "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", a3, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (id)supportedLanguagesForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  v9 = (void *)objc_msgSend(a1, "_engineClassFromOptions:error:", v8, a5);
  if (v9)
  {
    objc_msgSend(v9, "supportedLanguagesForRevision:error:", a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)supportedComputeDevicesForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  v9 = (void *)objc_msgSend(a1, "_engineClassFromOptions:error:", v8, a5);
  if (v9)
  {
    objc_msgSend(v9, "supportedComputeDevicesForRevision:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)computeDevice
{
  void *v2;
  void *v3;

  -[CRImageReader engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "computeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (unint64_t)defaultRevisionNumber
{
  return 3;
}

+ (id)languageSetFromOptionsDictionary:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(v22, "objectForKey:", CFSTR("CRImageReaderLanguageKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "defaultRevisionNumber");
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CRImageReaderRevisionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v22, "objectForKey:", CFSTR("CRImageReaderRevisionKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  objc_msgSend(a1, "supportedLanguagesForOptions:revision:error:", v22, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = v8;
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CB34D0];
      v30[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredLocalizationsFromArray:forPreferences:", v7, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

      }
LABEL_20:

      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = v23;
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v25;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = (void *)MEMORY[0x1E0CB34D0];
            v28 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "preferredLocalizationsFromArray:forPreferences:", v7, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v19, "count"))
            {
              objc_msgSend(v19, "firstObject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v20);

            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v14);
      }
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(v8, "addObject:", CFSTR("en-US"));
  }
LABEL_21:

  return v9;
}

+ (id)supportedChineseLanguages
{
  if (qword_1ED0B43B0 != -1)
    dispatch_once(&qword_1ED0B43B0, &__block_literal_global_7);
  return (id)_MergedGlobals_11;
}

void __42__CRImageReader_supportedChineseLanguages__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("zh-Hans");
  v2[1] = CFSTR("zh-Hant");
  v2[2] = CFSTR("yue-Hans");
  v2[3] = CFSTR("yue-Hant");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v0;

}

+ (BOOL)languageIsChinese:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "supportedChineseLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)languageIsLatin:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("en-US")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("fr-FR")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("it-IT")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("de-DE")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("es-ES")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("pt-BR")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("vi-VT")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("tr-TR")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("id-ID")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("cs-CZ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("da-DK")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("nl-NL")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("no-NO")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("nn-NO")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("nb-NO")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ms-MY")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("pl-PL")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ro-RO")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("sv-SE"));
  }

  return v4;
}

+ (BOOL)languageIsCyrillic:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ru-RU")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("uk-UA"));

  return v4;
}

+ (BOOL)languageIsFrench:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("fr-FR"));
}

+ (BOOL)languageIsKorean:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("ko-KR"));
}

+ (BOOL)languageIsJapanese:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("ja-JP"));
}

+ (BOOL)languageIsThai:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("th-TH"));
}

+ (BOOL)languageIsVietnamese:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("vi-VT"));
}

+ (BOOL)languageIsArabic:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ar-SA")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ars-SA"));

  return v4;
}

+ (BOOL)languageIsNorwegian:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("no-NO")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("nb-NO")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("nn-NO"));
  }

  return v4;
}

+ (BOOL)languageSupportsFullWidthPunctuation:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "languageIsChinese:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "languageIsJapanese:", v4);

  return v5;
}

- (BOOL)purgeCaches:(id)a3
{
  return 1;
}

- (id)documentOutputRegionForTextFeatures:(id)a3 image:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  CRMutableRecognizedTextRegion *v24;
  CRNormalizedQuad *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  CRNormalizedQuad *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  CRDetectionResult *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  CRMutableRecognitionResult *v55;
  id v57;
  uint64_t v58;
  uint64_t v60;
  id obj;
  uint64_t i;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  CRMutableRecognitionResult *v68;
  uint64_t j;
  void *v70;
  CRMutableRecognizedTextRegion *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  CRMutableRecognizedTextRegion *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v57 = v5;
  v66 = (void *)objc_opt_new();
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v5;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  if (!v58)
  {

LABEL_33:
    -[CRImageReader engine](self, "engine");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_opt_respondsToSelector();

    if ((v53 & 1) == 0)
    {
      v55 = 0;
      v51 = 0;
      goto LABEL_38;
    }
    v50 = -[CRDetectionResult initWithLines:]([CRDetectionResult alloc], "initWithLines:", v66);
    -[CRImageReader engine](self, "engine");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "resultDocumentForDetectionResult:image:options:progressHandler:error:", v50, v6, 0, 0, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0;
    goto LABEL_35;
  }
  v68 = 0;
  v60 = *(_QWORD *)v81;
  do
  {
    for (i = 0; i != v58; ++i)
    {
      if (*(_QWORD *)v81 != v60)
        objc_enumerationMutation(obj);
      v87 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
      v7 = v87;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
      v63 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "type") == 1)
      {
        objc_msgSend(v7, "subFeatures");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = v63;
      }
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v64 = v8;
      v67 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
      if (v67)
      {
        v65 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v67; ++j)
          {
            if (*(_QWORD *)v77 != v65)
              objc_enumerationMutation(v64);
            v9 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
            objc_msgSend(v6, "size");
            +[CRNeuralTextDetector _lineRegionFromLineTextFeature:imageSize:](CRNeuralTextDetector, "_lineRegionFromLineTextFeature:imageSize:", v9);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "addObject:");
            objc_msgSend(v9, "stringValue");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10 == 0;

            if (!v11)
            {
              if (!v68)
                v68 = objc_alloc_init(CRMutableRecognitionResult);
              v71 = -[CRRecognizedTextRegion initWithType:detectedLineRegion:]([CRMutableRecognizedTextRegion alloc], "initWithType:detectedLineRegion:", 2, v70);
              objc_msgSend(v9, "stringValue");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRRecognizedTextRegion setText:](v71, "setText:", v12);

              objc_msgSend(v9, "candidateProbs");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "firstObject");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "doubleValue");
              -[CRRecognizedTextRegion setConfidence:](v71, "setConfidence:");

              objc_msgSend(v9, "candidateProbs");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "firstObject");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "doubleValue");
              -[CRRecognizedTextRegion setActivationProbability:](v71, "setActivationProbability:");

              objc_msgSend(v9, "selectedLocale");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRRecognizedTextRegion setLocale:](v71, "setLocale:", v17);

              v18 = (void *)objc_opt_new();
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              objc_msgSend(v9, "subFeatures");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v73;
                do
                {
                  for (k = 0; k != v20; ++k)
                  {
                    if (*(_QWORD *)v73 != v21)
                      objc_enumerationMutation(v19);
                    v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
                    v24 = objc_alloc_init(CRMutableRecognizedTextRegion);
                    v25 = [CRNormalizedQuad alloc];
                    objc_msgSend(v23, "topLeft");
                    v27 = v26;
                    v29 = v28;
                    objc_msgSend(v23, "topRight");
                    v31 = v30;
                    v33 = v32;
                    objc_msgSend(v23, "bottomRight");
                    v35 = v34;
                    v37 = v36;
                    objc_msgSend(v23, "bottomLeft");
                    v39 = v38;
                    v41 = v40;
                    objc_msgSend(v6, "size");
                    v44 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v25, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v27, v29, v31, v33, v35, v37, v39, v41, v42, v43, v57);
                    -[CRRecognizedTextRegion setBoundingQuad:](v24, "setBoundingQuad:", v44);

                    objc_msgSend(v23, "stringValue");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    -[CRRecognizedTextRegion setText:](v24, "setText:", v45);

                    objc_msgSend(v9, "selectedLocale");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    -[CRRecognizedTextRegion setLocale:](v24, "setLocale:", v46);

                    -[CRRecognizedTextRegion setTextRegionType:](v24, "setTextRegionType:", objc_msgSend(v23, "type") == 3);
                    objc_msgSend(v18, "addObject:", v24);

                  }
                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                }
                while (v20);
              }

              -[CRRecognizedTextRegion setSubregions:](v71, "setSubregions:", v18);
              v84 = v71;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRMutableRecognitionResult addRecognizedRegions:detectedRegion:](v68, "addRecognizedRegions:detectedRegion:", v47, v70);

            }
          }
          v67 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        }
        while (v67);
      }

    }
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  }
  while (v58);

  if (!v68)
    goto LABEL_33;
  -[CRImageReader engine](self, "engine");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_opt_respondsToSelector();

  if ((v49 & 1) == 0)
  {
    v51 = 0;
    goto LABEL_36;
  }
  -[CRImageReader engine](self, "engine");
  v50 = (CRDetectionResult *)objc_claimAutoreleasedReturnValue();
  -[CRDetectionResult documentForLineRegions:recognitionResult:](v50, "documentForLineRegions:recognitionResult:", v66, v68);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

LABEL_36:
  v55 = v68;
LABEL_38:

  return v51;
}

- (id)textDetectorResultsForImage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[CRImageReader engine](self, "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textDetectorResultsForImage:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)recognizeDetectedBlocks:(id)a3 inImage:(id)a4 error:(id *)a5 withProgressHandler:(id)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  CRDetectionResult *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id obj;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v31 = a4;
  v32 = a6;
  v36 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v13 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v46[0] = v12;
        v46[1] = 3221225472;
        v46[2] = __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke;
        v46[3] = &unk_1E98DA4C0;
        v47 = v36;
        objc_msgSend(v15, "enumerateContentsWithTypes:usingBlock:", 8, v46);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v11);
  }

  -[CRImageReader engine](self, "engine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v28 = (void *)objc_opt_new();
    v29 = -[CRDetectionResult initWithLines:]([CRDetectionResult alloc], "initWithLines:", v36);
    -[CRImageReader engine](self, "engine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resultDocumentForDetectionResult:image:options:progressHandler:error:", v29, v31, 0, v32, a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v44[0] = v12;
    v44[1] = 3221225472;
    v44[2] = __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_2;
    v44[3] = &unk_1E98DA4C0;
    v19 = v28;
    v45 = v19;
    objc_msgSend(v30, "enumerateContentsWithTypes:usingBlock:", 8, v44);
    v34 = (id)objc_opt_new();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v33 = obj;
    v20 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v33);
          v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          v24 = (void *)objc_opt_new();
          v37[0] = v12;
          v37[1] = 3221225472;
          v37[2] = __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_3;
          v37[3] = &unk_1E98DA4E8;
          v38 = v19;
          v25 = v24;
          v39 = v25;
          objc_msgSend(v23, "enumerateContentsWithTypes:usingBlock:", 8, v37);
          +[CRBlockOutputRegion blockWithBlock:children:](CRBlockOutputRegion, "blockWithBlock:children:", v23, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v26);

        }
        v20 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v20);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Recognition of detected regions is not supported for this CRImageReader configuration"));
    v34 = 0;
  }

  return v34;
}

void __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "detectedLineRegion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "detectedLineRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

void __75__CRImageReader_recognizeDetectedBlocks_inImage_error_withProgressHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "detectedLineRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v9, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUuid:", v8);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }

  }
}

+ (id)errorWithErrorCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[CRImageReader descriptionForErrorCode:](CRImageReader, "descriptionForErrorCode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("CRImageReaderErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 error:(id *)a5
{
  id v7;

  v7 = a3;
  LOBYTE(a5) = objc_msgSend((id)objc_opt_class(), "preheatModelsForOptions:revision:extendedTimeoutBlock:error:", v7, a4, 0, a5);

  return (char)a5;
}

+ (BOOL)preheatModelsForOptions:(id)a3 revision:(int64_t)a4 extendedTimeoutBlock:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v10 = a3;
  v11 = a5;
  objc_msgSend((id)objc_opt_class(), "defaultOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addEntriesFromDictionary:", v10);
  v14 = (void *)objc_msgSend(a1, "_engineClassFromOptions:error:", v13, a6);
  if (v14)
    v15 = objc_msgSend(v14, "preheatModelsForOptions:revision:extendedTimeoutBlock:error:", v13, a4, v11, a6);
  else
    v15 = 0;

  return v15;
}

+ (CGSize)detectorImageSizeForOptions:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  objc_msgSend((id)objc_msgSend(a1, "_engineClassFromOptions:error:", v9, 0), "detectorImageSizeForOptions:imageSize:", v9, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (id)prioritizationForOptions:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  unint64_t v8;
  const __CFString *v9;

  v3 = a3;
  v4 = +[CRComputeDeviceUtilities computeDeviceTypeForOptions:mtlDevice:](CRComputeDeviceUtilities, "computeDeviceTypeForOptions:mtlDevice:", v3, 0);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CRImageReaderPrioritizationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = CFSTR("CRImageReaderPrioritizationAuto");
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("CRImageReaderPrioritizationAuto")))
  {
    v8 = v4 - 1;
    v9 = CFSTR("CRImageReaderPrioritizationPerformance");
    if (v8 >= 2 && deviceHasAppleNeuralEngine())
      v9 = CFSTR("CRImageReaderPrioritizationAccuracy");

    v7 = (__CFString *)v9;
  }

  return v7;
}

+ (id)defaultOptions
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[22];
  _QWORD v21[23];

  v21[22] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.CoreRecognition.disable_language_correction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.CoreRecognition.use_ci_detector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.CoreRecognition.use_futhark_recognizer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = CFSTR("CRImageReaderTextDetectorCR");
  if ((_DWORD)v3)
    v8 = CFSTR("CRImageReaderTextDetectorCI");
  v9 = v8;
  v10 = CFSTR("CRImageReaderTextRecognizerCR");
  if (v7)
    v10 = CFSTR("CRImageReaderTextRecognizerCI");
  v11 = v10;
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.CoreRecognition.use_form_detection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = MEMORY[0x1E0C9AAA0];
  v20[0] = CFSTR("CRImageReaderLanguageKey");
  v20[1] = CFSTR("CRImageReaderImageCaptureOrientation");
  v21[0] = CFSTR("en-US");
  v21[1] = &unk_1E9926790;
  v20[2] = CFSTR("CRImageReaderTextDetector");
  v20[3] = CFSTR("CREnableLogIntermediateDetectorResult");
  v21[2] = v9;
  v21[3] = &unk_1E99267A8;
  v20[4] = CFSTR("CRTextDetectorDisableLineGrouping");
  v20[5] = CFSTR("CRImagePyramidMaxNumScales");
  v21[4] = MEMORY[0x1E0C9AAA0];
  v21[5] = &unk_1E99267C0;
  v20[6] = CFSTR("CRImagePyramidScaleFactor");
  v20[7] = CFSTR("CRImagePyramidMinDim");
  v21[6] = &unk_1E9944968;
  v21[7] = &unk_1E99267D8;
  v20[8] = CFSTR("CRImageReaderTextRecognizer");
  v20[9] = CFSTR("CRImageReaderRecognitionMethod");
  v21[8] = v11;
  v21[9] = CFSTR("CRImageReaderRecognitionMethodSingleChar");
  v21[10] = &unk_1E99267F0;
  v20[10] = CFSTR("CRTextRecognizerNumberResultsNeeded");
  v20[11] = CFSTR("CRImageReaderDisableLanguageCorrection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v15;
  v21[12] = MEMORY[0x1E0C9AAB0];
  v20[12] = CFSTR("CRImageReaderDisableWordLevelModelling");
  v20[13] = CFSTR("CRImageReaderDisableFalsePositivePostFilter");
  v21[13] = v14;
  v21[14] = &unk_1E9926808;
  v20[14] = CFSTR("CRImageReaderRevisionKey");
  v20[15] = CFSTR("CRImageReaderPrecisionThresholdKey");
  v21[15] = &unk_1E9944978;
  v21[16] = CFSTR("CRImageReaderPrioritizationAuto");
  v20[16] = CFSTR("CRImageReaderPrioritizationKey");
  v20[17] = CFSTR("CRImageReaderSkipRecognition");
  v21[17] = v14;
  v20[18] = CFSTR("CRImageReaderRectifyPolygons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[18] = v16;
  v20[19] = CFSTR("CRImageReaderDetectForms");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[19] = v17;
  v21[20] = v14;
  v20[20] = CFSTR("CRImageReaderSkipVerticalText");
  v20[21] = CFSTR("CRImageReaderCoreMode");
  v21[21] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 < 0xFFFFFFFFFFFFFFF8)
    return CFSTR("Unknown error");
  else
    return off_1E98DA528[a3 + 8];
}

+ (id)_jsonStringFromOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CRImageReaderComputeDeviceKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("CRImageReaderComputeDeviceKey"));
  if (v3 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);

  }
  else
  {
    v6 = CFSTR("<not serializable>");
  }

  return v6;
}

- (id)resultDocumentForImage:(id)a3 roi:(CGRect)a4 options:(id)a5 trackingSession:(id)a6 error:(id *)a7 withProgressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, double);
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  BOOL v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  uint64_t v56;
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v64 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a5;
  v57 = a6;
  v19 = (void (**)(id, _QWORD, double))a8;
  if (!os_variant_has_internal_diagnostics()
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "objectForKey:", CFSTR("com.apple.CoreRecognition.save_inputs_outputs")),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "BOOLValue"),
        v21,
        v20,
        !v22))
  {
    v27 = 0;
    v56 = 0;
    if (!v19)
      goto LABEL_11;
    goto LABEL_10;
  }
  v56 = objc_msgSend(v17, "bufferHash");
  if (qword_1ED0B43C0 != -1)
    dispatch_once(&qword_1ED0B43C0, &__block_literal_global_275);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ocr_input_%lX.png"), v56);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED0B43B8, "URLByAppendingPathComponent:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "writeToURL:", v24);
  CROSLogForCategory(6);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v24, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v59 = "-[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:]";
    v60 = 2112;
    v61 = (uint64_t)v26;
    _os_log_impl(&dword_1D4FB8000, v25, OS_LOG_TYPE_DEBUG, "%s: Saving image at location: %@", buf, 0x16u);

  }
  v27 = 1;
  if (v19)
LABEL_10:
    v19[2](v19, 0, 0.0);
LABEL_11:
  v28 = objc_msgSend(v17, "width");
  v29 = objc_msgSend(v17, "height");
  v30 = objc_msgSend(v17, "width");
  v31 = objc_msgSend(v17, "height");
  v65.origin.x = x * (double)v28;
  v65.origin.y = y * (double)v29;
  v65.size.width = width * (double)v30;
  v65.size.height = height * (double)v31;
  v66 = CGRectIntegral(v65);
  v32 = v66.origin.x;
  v33 = v66.origin.y;
  v34 = v66.size.width;
  v35 = v66.size.height;
  v36 = objc_msgSend(v17, "width");
  v37 = objc_msgSend(v17, "height");
  v68.size.width = (double)v36;
  v68.size.height = (double)v37;
  v68.origin.x = 0.0;
  v68.origin.y = 0.0;
  v67.origin.x = v32;
  v67.origin.y = v33;
  v67.size.width = v34;
  v67.size.height = v35;
  v38 = CGRectEqualToRect(v67, v68);
  if (v38)
  {
    v39 = v17;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v17, "imageByCroppingRectangle:iosurfaceBacking:", 1, v32, v33, v34, v35);
    else
      objc_msgSend(v17, "imageByCroppingRectangle:", v32, v33, v34, v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CRImageReader userOptions](self, "userOptions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addEntriesFromDictionary:", v41);

  objc_msgSend(v40, "addEntriesFromDictionary:", v18);
  v42 = v40;

  objc_msgSend(v42, "objectForKey:", CFSTR("CRImageReaderImageCaptureOrientation"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 == 0;

  if (v44)
  {
    objc_msgSend(v42, "objectForKey:", CFSTR("CRImageReaderImageCaptureOrientationPortrait"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "BOOLValue");

    if (!v49)
      goto LABEL_25;
    objc_msgSend(v39, "imageByRotating90CW");
    v47 = objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  objc_msgSend(v42, "objectForKey:", CFSTR("CRImageReaderImageCaptureOrientation"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "intValue");

  if ((v46 - 1) <= 7)
  {
    objc_msgSend(v39, "imageByCorrectingFromOrientation:", v46);
    v47 = objc_claimAutoreleasedReturnValue();

LABEL_22:
    v39 = (void *)v47;
    goto LABEL_25;
  }
  if (a7)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -2);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_25:
  -[CRImageReader engine](self, "engine");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "resultDocumentInImage:options:trackingSession:withProgressHandler:error:", v39, v42, v57, v19, a7);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
    objc_msgSend(v51, "scaleBy:normalizedOffset:", width, height, x, y);
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ocr_output_%lX.dat"), v56);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (id)objc_msgSend(v51, "writeToFileInFolder:basename:", qword_1ED0B43B8, v52);
    CROSLogForCategory(6);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v59 = "-[CRImageReader resultDocumentForImage:roi:options:trackingSession:error:withProgressHandler:]";
      v60 = 2112;
      v61 = qword_1ED0B43B8;
      v62 = 2112;
      v63 = v52;
      _os_log_impl(&dword_1D4FB8000, v54, OS_LOG_TYPE_DEBUG, "%s: Saving OCR output result at location: %@/%@", buf, 0x20u);
    }

  }
  return v51;
}

void __94__CRImageReader_resultDocumentForImage_roi_options_trackingSession_error_withProgressHandler___block_invoke()
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
  v2 = (void *)qword_1ED0B43B8;
  qword_1ED0B43B8 = v1;

}

- (void)cancel
{
  void *v3;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CRImageReader setShouldCancel:](self, "setShouldCancel:", 1);
}

- (id)detectorStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detectorStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)postProcStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postProcStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)recognizerStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recognizerStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)recognizerInferenceStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recognizerInferenceStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)recognizerDecodingStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recognizerDecodingStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)detectorInferenceStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detectorInferenceStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)textGroupingStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textGroupingStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)orientationCorrectionStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orientationCorrectionStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)lineWrappingStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lineWrappingStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)tableStructureRecognitionStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableStructureRecognitionStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)formAnalyzerStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formAnalyzerStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)formDetectionStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formDetectionStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)formPostProcessingStats
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CRImageReader engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CRImageReader engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formPostProcessingStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (Class)_engineClassFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a1, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addEntriesFromDictionary:", v6);
  objc_msgSend(v8, "objectForKey:", CFSTR("CRImageReaderTextDetector"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("CRImageReaderTextDetectorCR"));

  objc_msgSend(v8, "objectForKey:", CFSTR("CRImageReaderTextRecognizer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("CRImageReaderTextRecognizerCR"));

  if ((v12 & v10 & 1) != 0 || ((v12 | v10) & 1) == 0)
  {
    objc_opt_class();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -7);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return (Class)v13;
}

+ (id)_engineFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  void *v8;

  v6 = a3;
  v7 = (objc_class *)objc_msgSend(a1, "_engineClassFromOptions:error:", v6, a4);
  if (v7)
    v8 = (void *)objc_msgSend([v7 alloc], "initWithOptions:error:", v6, a4);
  else
    v8 = 0;

  return v8;
}

+ (unint64_t)_typeForFeature:(id)a3 enginePreferredRegionType:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = v5;
  if (!a4)
  {
    if (objc_msgSend(v5, "subFeatureType") == 4)
      a4 = 32;
    else
      a4 = 16;
  }

  return a4;
}

- (id)documentOutputRegionForImage:(id)a3 roi:(CGRect)a4 error:(id *)a5 withProgressHandler:(id)a6
{
  -[CRImageReader documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:](self, "documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:", a3, MEMORY[0x1E0C9AA70], 0, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)userOptions
{
  return self->_userOptions;
}

- (void)setUserOptions:(id)a3
{
  objc_storeStrong((id *)&self->_userOptions, a3);
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (CREngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_userOptions, 0);
  objc_storeStrong((id *)&self->_outputObjectTypes, 0);
}

@end

@implementation CRFormFieldMinimalSizeEnforcingStep

- (CRFormFieldMinimalSizeEnforcingStep)init
{
  CRFormFieldMinimalSizeEnforcingStep *v2;
  CRFormFieldMinimalSizeEnforcingStep *v3;
  NSDictionary *minCharacterLength;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRFormFieldMinimalSizeEnforcingStep;
  v2 = -[CRFormFieldMinimalSizeEnforcingStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    minCharacterLength = v2->_minCharacterLength;
    v2->_minCharacterLength = (NSDictionary *)&unk_1E993F990;

  }
  return v3;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  CROSLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldMinimalSizeEnforcingStep is running (#input:%lu).", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__CRFormFieldMinimalSizeEnforcingStep_process_externalFields_document_options___block_invoke;
  v10[3] = &unk_1E98D9E10;
  v10[4] = self;
  +[CRFormPostProcessingManager enumerateDetectedFields:block:](CRFormPostProcessingManager, "enumerateDetectedFields:block:", v7, v10);
  return v7;
}

void __79__CRFormFieldMinimalSizeEnforcingStep_process_externalFields_document_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  double v13;
  NSObject *v14;
  int v15;
  double v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "fieldType") == 1 && objc_msgSend(v3, "textContentType") != 1)
  {
    +[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", objc_msgSend(v3, "textContentType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "boundingQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingBox");
    v7 = v6;
    v9 = v8;

    CROSLogForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134218498;
      v16 = v7;
      v17 = 2048;
      v18 = v9;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEBUG, "CRFormFieldMinimalSizeEnforcingStep: field with size %.2fx%.2f has type = %@", (uint8_t *)&v15, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    objc_msgSend(v3, "suggestedLineHeight");
    if (v13 * (double)v12 > v7 * 1.5)
    {
      CROSLogForCategory(6);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138413058;
        v16 = *(double *)&v4;
        v17 = 2048;
        v18 = v9;
        v19 = 2048;
        v20 = (void *)v12;
        v21 = 2048;
        v22 = v7;
        _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_DEBUG, "CRFormFieldMinimalSizeEnforcingStep: %@ -> None because %f * %li > %f", (uint8_t *)&v15, 0x2Au);
      }

      objc_msgSend(v3, "setTextContentType:", 1);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minCharacterLength, 0);
}

@end

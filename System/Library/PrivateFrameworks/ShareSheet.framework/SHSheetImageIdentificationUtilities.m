@implementation SHSheetImageIdentificationUtilities

+ (BOOL)isImageAnalysisFeatureEnabled
{
  NSObject *v3;
  uint8_t v4[16];

  if (_os_feature_enabled_impl() && (_ShareSheetImageAnalysisAllowed() & 1) != 0)
    return 1;
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Feature: PeopleIntelligence is unsupported. No Identification will be performed ", v4, 2u);
  }

  return 0;
}

+ (id)personIdResultsFromImage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 buf;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)getMADPersonIdentificationRequestClass());
  objc_msgSend(v5, "setMaximumFaceCount:", 4);
  v33 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    getMADPersonIdentificationRequestClass();
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || !objc_msgSend(a1, "isImageAnalysisFeatureEnabled"))
    {
      v19 = v4;
    }
    else
    {
      share_sheet_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "Unable to unarchive MADRequest object. Using on-demand MAD SPI", (uint8_t *)&buf, 2u);
      }

      v29 = 0;
      v30 = &v29;
      v31 = 0x2050000000;
      v10 = (void *)getMADServiceClass_softClass;
      v32 = getMADServiceClass_softClass;
      if (!getMADServiceClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v35 = __getMADServiceClass_block_invoke;
        v36 = &unk_1E4001370;
        v37 = &v29;
        __getMADServiceClass_block_invoke((uint64_t)&buf);
        v10 = (void *)v30[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v29, 8);
      if (v11)
      {
        objc_msgSend(v11, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *MEMORY[0x1E0CEC4A0];
        v28 = 0;
        objc_msgSend(v12, "performRequests:onImageData:withUniformTypeIdentifier:andIdentifier:error:", v6, v4, v13, CFSTR("UIActivityViewControllerSharingMediaServiceAnalysis"), &v28);
        v14 = v28;
        if (v14)
        {
          v15 = v14;
          share_sheet_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "localizedDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v17;
            _os_log_impl(&dword_19E419000, v16, OS_LOG_TYPE_DEFAULT, "While processing suggestedImageData, encountered Error: %@", (uint8_t *)&buf, 0xCu);

          }
          v18 = 0;
        }
        else
        {
          objc_msgSend(v6, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "results");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "count"))
          {
            v24 = (void *)MEMORY[0x1E0CB36F8];
            objc_msgSend(v6, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "archivedDataWithRootObject:requiringSecureCoding:error:", v25, 1, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            share_sheet_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = objc_msgSend(v23, "count");
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = v27;
              _os_log_impl(&dword_19E419000, v26, OS_LOG_TYPE_DEFAULT, "Screenshot service: Image data processed, Result count: %ld", (uint8_t *)&buf, 0xCu);
            }

          }
          else
          {
            v18 = 0;
          }

          v15 = 0;
        }
        v21 = v18;

        v19 = v21;
      }
      else
      {
        share_sheet_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[SHSheetImageIdentificationUtilities personIdResultsFromImage:].cold.1(v21);
        v19 = 0;
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (void)personIdResultsFromImage:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "Error: Encountered nil, while linking to MADServiceClass", v1, 2u);
}

+ (void)personIdResultsFromImage:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Encountered exception while trying to perform Media analysis of suggested Image Data : %@", (uint8_t *)&v2, 0xCu);
}

@end

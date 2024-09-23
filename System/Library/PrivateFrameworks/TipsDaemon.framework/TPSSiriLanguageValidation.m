@implementation TPSSiriLanguageValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE buf[24];
  void *v33;
  _BYTE v34[10];
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TPSSiriLanguageValidation targetLanguages](self, "targetLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

    goto LABEL_4;
  }
  -[TPSSiriLanguageValidation excludeLanguages](self, "excludeLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
LABEL_4:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = getAFAssistantRestrictedSymbolLoc_ptr_1;
    v33 = getAFAssistantRestrictedSymbolLoc_ptr_1;
    if (!getAFAssistantRestrictedSymbolLoc_ptr_1)
    {
      v9 = (void *)AssistantServicesLibrary_0();
      v8 = dlsym(v9, "AFAssistantRestricted");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getAFAssistantRestrictedSymbolLoc_ptr_1 = v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
    {
      -[TPSHeySiriEnabledValidation getCurrentState].cold.1();
      __break(1u);
    }
    if ((((uint64_t (*)(void))v8)() & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2050000000;
      v11 = (void *)getAFPreferencesClass_softClass_1;
      v31 = getAFPreferencesClass_softClass_1;
      if (!getAFPreferencesClass_softClass_1)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAFPreferencesClass_block_invoke_1;
        v33 = &unk_1EA1DF510;
        *(_QWORD *)v34 = &v28;
        __getAFPreferencesClass_block_invoke_1((uint64_t)buf);
        v11 = (void *)v29[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v28, 8);
      objc_msgSend(v12, "sharedPreferences", v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "languageCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v10 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject length](v10, "length"))
      {
        -[TPSSiriLanguageValidation targetLanguages](self, "targetLanguages");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          -[TPSSiriLanguageValidation targetLanguages](self, "targetLanguages");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v10);

        }
        else
        {
          v17 = 1;
        }

        -[TPSSiriLanguageValidation excludeLanguages](self, "excludeLanguages");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsObject:", v10);

        v18 = v17 & (v20 ^ 1u);
LABEL_20:
        objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v22 = (void *)objc_opt_class();
          v23 = v22;
          -[TPSSiriLanguageValidation targetLanguages](self, "targetLanguages");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "componentsJoinedByString:", CFSTR(","));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[TPSSiriLanguageValidation excludeLanguages](self, "excludeLanguages");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          *(_WORD *)&buf[22] = 2112;
          v33 = v25;
          *(_WORD *)v34 = 2112;
          *(_QWORD *)&v34[2] = v27;
          v35 = 1024;
          v36 = v18;
          _os_log_debug_impl(&dword_1DAC2F000, v21, OS_LOG_TYPE_DEBUG, "%@ - checking Siri Language: %@, target languages: %@, exclude languages: %@. Valid: %d", buf, 0x30u);

        }
        goto LABEL_23;
      }
    }
    v18 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSSiriLanguageValidation validateWithCompletion:].cold.1((uint64_t)self, v10);
  v18 = 1;
LABEL_23:

  v4[2](v4, v18, 0);
}

- (TPSSiriLanguageValidation)initWithTargetLanguages:(id)a3 excludeLanguages:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  TPSSiriLanguageValidation *v9;
  objc_super v11;

  v6 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("lowercaseString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("lowercaseString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)TPSSiriLanguageValidation;
  v9 = -[TPSInclusivityValidation initWithTargetValues:excludeValues:](&v11, sel_initWithTargetValues_excludeValues_, v7, v8);

  return v9;
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude region(s) is specified.", (uint8_t *)&v4, 0xCu);

}

@end

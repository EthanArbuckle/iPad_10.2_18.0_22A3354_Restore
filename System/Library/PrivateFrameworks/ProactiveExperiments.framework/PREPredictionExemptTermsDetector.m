@implementation PREPredictionExemptTermsDetector

- (PREPredictionExemptTermsDetector)init
{
  PREPredictionExemptTermsDetector *v2;
  PREPredictionExemptTermsDetector *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PREPredictionExemptTermsDetector;
  v2 = -[PREPredictionExemptTermsDetector init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PREPredictionExemptTermsDetector _warmTermsIfNecessary](v2, "_warmTermsIfNecessary");
  return v3;
}

- (BOOL)checkForExemptContentInText:(id)a3 languageCode:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  int v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (self->_languageToExemptTerms && objc_msgSend(v6, "length"))
  {
    if (!v7)
      v7 = CFSTR("en");
    pre_responses_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v7;
      _os_log_impl(&dword_1C35DB000, v8, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment Checking for exempt content with language code: %@", (uint8_t *)&v22, 0xCu);
    }

    -[PREPredictionExemptTermsDetector _warmTermsIfNecessary](self, "_warmTermsIfNecessary");
    -[NSDictionary objectForKeyedSubscript:](self->_languageToExemptTerms, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v6, "localizedLowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeCharactersWithCharacterSet:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "removeApostrophes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByFoldingWithOptions:locale:", 128, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v15, "tokens");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v19, "intersectsSet:", v16);
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)_warmTermsIfNecessary
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  NSObject *p_super;
  _BOOL4 v8;
  NSDictionary *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_languageToExemptTerms)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ProactiveExperiments"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("PredictionExemptTerms"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    pre_responses_handle();
    p_super = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    if ((isKindOfClass & 1) != 0)
    {
      if (v8)
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1C35DB000, p_super, OS_LOG_TYPE_DEFAULT, "ProactiveResponsesExperiment Successfully loaded exempt terms list at path: %@", (uint8_t *)&v11, 0xCu);
      }

      v9 = (NSDictionary *)objc_msgSend(v6, "copy");
      p_super = &self->_languageToExemptTerms->super;
      self->_languageToExemptTerms = v9;
    }
    else if (v8)
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1C35DB000, p_super, OS_LOG_TYPE_DEFAULT, "ProactiveResponsesExperiment ExemptTermsDetection found unexpected plist contents at path: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageToExemptTerms, 0);
}

@end

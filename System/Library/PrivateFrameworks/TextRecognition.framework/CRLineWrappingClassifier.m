@implementation CRLineWrappingClassifier

+ (id)localeToModelMap
{
  if (qword_1ED0B4580 != -1)
    dispatch_once(&qword_1ED0B4580, &__block_literal_global_16);
  return (id)_MergedGlobals_19;
}

void __44__CRLineWrappingClassifier_localeToModelMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[30];
  _QWORD v3[31];

  v3[30] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ar-SA");
  v2[1] = CFSTR("ars-SA");
  v3[0] = CFSTR("cr_lw_ar-SA.mlmodelc");
  v3[1] = CFSTR("cr_lw_ar-SA.mlmodelc");
  v2[2] = CFSTR("de-DE");
  v2[3] = CFSTR("en-US");
  v3[2] = CFSTR("cr_lw_de-DE.mlmodelc");
  v3[3] = CFSTR("cr_lw_en-US.mlmodelc");
  v2[4] = CFSTR("es-ES");
  v2[5] = CFSTR("fr-FR");
  v3[4] = CFSTR("cr_lw_es-ES.mlmodelc");
  v3[5] = CFSTR("cr_lw_fr-FR.mlmodelc");
  v2[6] = CFSTR("it-IT");
  v2[7] = CFSTR("ja-JP");
  v3[6] = CFSTR("cr_lw_it-IT.mlmodelc");
  v3[7] = CFSTR("cr_lw_ja-JP.mlmodelc");
  v2[8] = CFSTR("ko-KR");
  v2[9] = CFSTR("pt-BR");
  v3[8] = CFSTR("cr_lw_ko-KR.mlmodelc");
  v3[9] = CFSTR("cr_lw_pt-BR.mlmodelc");
  v2[10] = CFSTR("ru-RU");
  v2[11] = CFSTR("uk-UA");
  v3[10] = CFSTR("cr_lw_ru-RU.mlmodelc");
  v3[11] = CFSTR("cr_lw_uk-UA.mlmodelc");
  v2[12] = CFSTR("th-TH");
  v2[13] = CFSTR("vi-VT");
  v3[12] = CFSTR("cr_lw_th-TH.mlmodelc");
  v3[13] = CFSTR("cr_lw_vi-VT.mlmodelc");
  v2[14] = CFSTR("tr-TR");
  v2[15] = CFSTR("id-ID");
  v3[14] = CFSTR("cr_lw_en-US.mlmodelc");
  v3[15] = CFSTR("cr_lw_en-US.mlmodelc");
  v2[16] = CFSTR("cs-CZ");
  v2[17] = CFSTR("da-DK");
  v3[16] = CFSTR("cr_lw_en-US.mlmodelc");
  v3[17] = CFSTR("cr_lw_en-US.mlmodelc");
  v2[18] = CFSTR("nl-NL");
  v2[19] = CFSTR("no-NO");
  v3[18] = CFSTR("cr_lw_en-US.mlmodelc");
  v3[19] = CFSTR("cr_lw_en-US.mlmodelc");
  v2[20] = CFSTR("nn-NO");
  v2[21] = CFSTR("nb-NO");
  v3[20] = CFSTR("cr_lw_en-US.mlmodelc");
  v3[21] = CFSTR("cr_lw_en-US.mlmodelc");
  v2[22] = CFSTR("ms-MY");
  v2[23] = CFSTR("pl-PL");
  v3[22] = CFSTR("cr_lw_en-US.mlmodelc");
  v3[23] = CFSTR("cr_lw_en-US.mlmodelc");
  v2[24] = CFSTR("ro-RO");
  v2[25] = CFSTR("sv-SE");
  v3[24] = CFSTR("cr_lw_en-US.mlmodelc");
  v3[25] = CFSTR("cr_lw_en-US.mlmodelc");
  v2[26] = CFSTR("yue-Hans");
  v2[27] = CFSTR("yue-Hant");
  v3[26] = CFSTR("cr_lw_zh-Hans.mlmodelc");
  v3[27] = CFSTR("cr_lw_zh-Hans.mlmodelc");
  v2[28] = CFSTR("zh-Hans");
  v2[29] = CFSTR("zh-Hant");
  v3[28] = CFSTR("cr_lw_zh-Hans.mlmodelc");
  v3[29] = CFSTR("cr_lw_zh-Hans.mlmodelc");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_19;
  _MergedGlobals_19 = v0;

}

+ (BOOL)localeIsSupported:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "localeToModelMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

+ (id)urlOfModelForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "localeToModelMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathForResource:ofType:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CROSLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_FAULT, "Failed to load resource: %@", (uint8_t *)&v14, 0xCu);
      }

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)modelLocaleForLocale:(id)a3
{
  __CFString *v4;
  __CFString **v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if (objc_msgSend(a1, "_lineWrappingShouldFallBackForLocale:", v4))
  {
    v5 = CRImageReaderLanguageEn_US;
LABEL_7:
    v6 = *v5;
    goto LABEL_8;
  }
  if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v4))
  {
    v5 = CRImageReaderLanguageZh_Hans;
    goto LABEL_7;
  }
  if (+[CRImageReader languageIsNorwegian:](CRImageReader, "languageIsNorwegian:", v4))
  {
    v5 = CRImageReaderLanguageNo_NO;
    goto LABEL_7;
  }
  if (+[CRImageReader languageIsArabic:](CRImageReader, "languageIsArabic:", v4))
    v6 = CFSTR("ar-SA");
  else
    v6 = v4;
LABEL_8:
  v7 = v6;

  return v7;
}

- (CRLineWrappingClassifier)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  CRLineWrappingClassifier *v7;
  uint64_t v8;
  MLModel *model;
  CRLineWrappingClassifier *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLineWrappingClassifier;
  v7 = -[CRLineWrappingClassifier init](&v14, sel_init);
  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  model = v7->_model;
  v7->_model = (MLModel *)v8;

  if (!v7->_model)
  {
    CROSLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_FAULT, "Failed to load model: %@", buf, 0xCu);

    }
    goto LABEL_7;
  }
  v10 = v7;
LABEL_8:

  return v10;
}

- (CRLineWrappingClassifier)initWithLocale:(id)a3
{
  id v5;
  void *v6;
  CRLineWrappingClassifier *v7;

  v5 = a3;
  +[CRLineWrappingClassifier urlOfModelForLocale:](CRLineWrappingClassifier, "urlOfModelForLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    self = -[CRLineWrappingClassifier initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v6, 0);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)modelLocale
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CRLineWrappingClassifier locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelLocaleForLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)featureCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[MLModel modelDescription](self->_model, "modelDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDescriptionsByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("input"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiArrayConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongValue");

  return v8;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  MLModel *model;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLineWrappingClassifierOutput *v19;
  CRLineWrappingClassifierOutput *v20;

  model = self->_model;
  v7 = a3;
  -[MLModel modelDescription](model, "modelDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("input"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multiArrayConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "longValue");

  v14 = objc_alloc_init(MEMORY[0x1E0C9E9B0]);
  -[MLModel predictionFromFeatures:options:error:](self->_model, "predictionFromFeatures:options:error:", v7, v14, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "featureValueForName:", CFSTR("classProbability"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E9926A48);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = [CRLineWrappingClassifierOutput alloc];
    objc_msgSend(v18, "doubleValue");
    v20 = -[CRLineWrappingClassifierOutput initWithWrappingProbability:](v19, "initWithWrappingProbability:");
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)_lineWrappingShouldFallBackForLocale:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tr-TR")) & 1) != 0
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

- (MLModel)model
{
  return self->_model;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

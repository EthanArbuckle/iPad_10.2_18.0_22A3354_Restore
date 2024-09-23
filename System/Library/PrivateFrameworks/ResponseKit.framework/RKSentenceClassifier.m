@implementation RKSentenceClassifier

void __46__RKSentenceClassifier_ko_KO_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __45__RKSentenceClassifier_fr_FR_analyzeSentence__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "partOfSpeech");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

  if (!(_DWORD)v6)
    goto LABEL_22;
  v33 = a3;
  v8 = a3 - 1;
  if (a3 < 1)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = *MEMORY[0x24BDD0EA8];
  v12 = *MEMORY[0x24BDD0ED8];
  v13 = *MEMORY[0x24BDD0ED0];
  while (1)
  {
    v35[0] = v11;
    v35[1] = v12;
    v35[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "partOfSpeech");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "containsObject:", v15))
      break;

    if (v8-- < 1)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v8);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
  }

  if (v8 >= 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v8 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_11:
  v20 = 0;
LABEL_12:
  v34[0] = v11;
  v34[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "partOfSpeech");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "containsObject:", v22))
  {

    if (v8 < 2)
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v8 - 2);
    v22 = v20;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  objc_msgSend(v10, "partOfSpeech");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BDD0F98];
  v25 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BDD0F98]);

  if (v25)
  {
    if (!v20
      || (v26 = *(void **)(a1 + 32),
          objc_msgSend(v20, "partOfSpeech"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v26) = objc_msgSend(v26, "containsObject:", v27),
          v27,
          (v26 & 1) == 0))
    {
      objc_msgSend(v20, "partOfSpeech");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", v24);

      if ((v29 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "inversions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v8, v33 - v8 + 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "arrayByAddingObject:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setInversions:", v32);

      }
    }
  }

LABEL_22:
}

void __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("range"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeValue");

  objc_msgSend(*(id *)(a1 + 32), "inversions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "inversions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeValue");
    v13 = v12;

  }
  else
  {
    v13 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v7 < v11 + v13)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("category"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", objc_msgSend(v14, "unsignedIntegerValue"));

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("gender"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setGender:", objc_msgSend(v15, "unsignedIntegerValue"));

  }
  *a4 = 1;

}

uint64_t __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", 2);
  *a4 = 1;
  return result;
}

void __46__RKSentenceClassifier_tr_TR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_el_GR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ar_AE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_th_TH_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

- (NSArray)alternativeConjunctions
{
  -[RKSentenceClassifier doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)languageIdentifierFromClassName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)objc_msgSend(a1, "superclass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (RKSentenceClassifier)init
{
  RKSentenceClassifier *v2;
  uint64_t v3;
  NSString *languageIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RKSentenceClassifier;
  v2 = -[RKSentenceClassifier init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "languageIdentifierFromClassName");
    v3 = objc_claimAutoreleasedReturnValue();
    languageIdentifier = v2->_languageIdentifier;
    v2->_languageIdentifier = (NSString *)v3;

    +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v2->_languageIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_2);
    objc_msgSend((id)partofSpeechAvailabilityByLanguage, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend((id)lemmaAvailabilityByLanguage, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x24BDD1638], "availableTagSchemesForLanguage:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "containsObject:", *MEMORY[0x24BDD0F68]));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)partofSpeechAvailabilityByLanguage, "setObject:forKeyedSubscript:", v9, v5);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "containsObject:", *MEMORY[0x24BDD0F60]));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)lemmaAvailabilityByLanguage, "setObject:forKeyedSubscript:", v10, v5);

    }
LABEL_7:

  }
  return v2;
}

void __28__RKSentenceClassifier_init__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)partofSpeechAvailabilityByLanguage;
  partofSpeechAvailabilityByLanguage = v0;

  v2 = objc_opt_new();
  v3 = (void *)lemmaAvailabilityByLanguage;
  lemmaAvailabilityByLanguage = v2;

}

+ (Class)subclassForLanguageIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "isEqualToString:", CFSTR("und")) & 1) != 0)
  {
LABEL_5:
    if (subclassForLanguageIdentifier__onceToken == -1)
    {
      if (!v4)
        goto LABEL_8;
    }
    else
    {
      dispatch_once(&subclassForLanguageIdentifier__onceToken, &__block_literal_global_109);
      if (!v4)
        goto LABEL_8;
    }
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("und")))
    {
LABEL_9:
      +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)sSubclasses, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_8:
    v8 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "canonicalLanguageIdentifierFromString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
    goto LABEL_9;
  }
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("RKSentenceClassifier_"), "stringByAppendingString:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_opt_class())
  {

    goto LABEL_5;
  }
LABEL_10:

  return (Class)v7;
}

void __54__RKSentenceClassifier_subclassForLanguageIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[33];
  _QWORD v3[34];

  v3[33] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("ar");
  v3[0] = NSClassFromString(CFSTR("RKSentenceClassifier_ar_AE"));
  v2[1] = CFSTR("ca");
  v3[1] = NSClassFromString(CFSTR("RKSentenceClassifier_ca_ES"));
  v2[2] = CFSTR("cs");
  v3[2] = NSClassFromString(CFSTR("RKSentenceClassifier_cs_CZ"));
  v2[3] = CFSTR("da");
  v3[3] = NSClassFromString(CFSTR("RKSentenceClassifier_da_DK"));
  v2[4] = CFSTR("de");
  v3[4] = NSClassFromString(CFSTR("RKSentenceClassifier_de_DE"));
  v2[5] = CFSTR("el");
  v3[5] = NSClassFromString(CFSTR("RKSentenceClassifier_el_GR"));
  v2[6] = CFSTR("en");
  v3[6] = NSClassFromString(CFSTR("RKSentenceClassifier_en_US"));
  v2[7] = CFSTR("es");
  v3[7] = NSClassFromString(CFSTR("RKSentenceClassifier_es_ES"));
  v2[8] = CFSTR("fr");
  v3[8] = NSClassFromString(CFSTR("RKSentenceClassifier_fr_FR"));
  v2[9] = CFSTR("fi");
  v3[9] = NSClassFromString(CFSTR("RKSentenceClassifier_fi_FI"));
  v2[10] = CFSTR("he");
  v3[10] = NSClassFromString(CFSTR("RKSentenceClassifier_he_IL"));
  v2[11] = CFSTR("hi");
  v3[11] = NSClassFromString(CFSTR("RKSentenceClassifier_hi_IN"));
  v2[12] = CFSTR("hr");
  v3[12] = NSClassFromString(CFSTR("RKSentenceClassifier_hr_HR"));
  v2[13] = CFSTR("hu");
  v3[13] = NSClassFromString(CFSTR("RKSentenceClassifier_hu_HU"));
  v2[14] = CFSTR("id");
  v3[14] = NSClassFromString(CFSTR("RKSentenceClassifier_id_ID"));
  v2[15] = CFSTR("it");
  v3[15] = NSClassFromString(CFSTR("RKSentenceClassifier_it_IT"));
  v2[16] = CFSTR("ja");
  v3[16] = NSClassFromString(CFSTR("RKSentenceClassifier_ja_JP"));
  v2[17] = CFSTR("ko-Kore");
  v3[17] = NSClassFromString(CFSTR("RKSentenceClassifier_ko_KO"));
  v2[18] = CFSTR("ms");
  v3[18] = NSClassFromString(CFSTR("RKSentenceClassifier_ms_MY"));
  v2[19] = CFSTR("nl");
  v3[19] = NSClassFromString(CFSTR("RKSentenceClassifier_nl_NL"));
  v2[20] = CFSTR("nb");
  v3[20] = NSClassFromString(CFSTR("RKSentenceClassifier_nb_NO"));
  v2[21] = CFSTR("pl");
  v3[21] = NSClassFromString(CFSTR("RKSentenceClassifier_pl_PL"));
  v2[22] = CFSTR("pt");
  v3[22] = NSClassFromString(CFSTR("RKSentenceClassifier_pt_BR"));
  v2[23] = CFSTR("ro");
  v3[23] = NSClassFromString(CFSTR("RKSentenceClassifier_ro_RO"));
  v2[24] = CFSTR("ru");
  v3[24] = NSClassFromString(CFSTR("RKSentenceClassifier_ru_RU"));
  v2[25] = CFSTR("sk");
  v3[25] = NSClassFromString(CFSTR("RKSentenceClassifier_sk_SK"));
  v2[26] = CFSTR("sv");
  v3[26] = NSClassFromString(CFSTR("RKSentenceClassifier_sv_SE"));
  v2[27] = CFSTR("th");
  v3[27] = NSClassFromString(CFSTR("RKSentenceClassifier_th_TH"));
  v2[28] = CFSTR("tr");
  v3[28] = NSClassFromString(CFSTR("RKSentenceClassifier_tr_TR"));
  v2[29] = CFSTR("vi");
  v3[29] = NSClassFromString(CFSTR("RKSentenceClassifier_vi_VN"));
  v2[30] = CFSTR("uk");
  v3[30] = NSClassFromString(CFSTR("RKSentenceClassifier_uk_UA"));
  v2[31] = CFSTR("zh-Hans");
  v3[31] = NSClassFromString(CFSTR("RKSentenceClassifier_zh_Hans_CN"));
  v2[32] = CFSTR("zh-Hant");
  v3[32] = NSClassFromString(CFSTR("RKSentenceClassifier_zh_Hant_CN"));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 33);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sSubclasses;
  sSubclasses = v0;

}

+ (Class)subclassForLocale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(a3, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalLanguageIdentifierFromString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "subclassForLanguageIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

+ (BOOL)canClassifyLanguageIdentifier:(id)a3
{
  return objc_msgSend(a1, "subclassForLanguageIdentifier:", a3) != 0;
}

+ (id)categoryKeywordMapForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  if (categoryKeywordMapForLanguage__onceToken != -1)
    dispatch_once(&categoryKeywordMapForLanguage__onceToken, &__block_literal_global_244);
  +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)categoryKeywordMapForLanguage__categoryKeywordMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((unint64_t)objc_msgSend((id)categoryKeywordMapForLanguage__categoryKeywordMap, "count") >= 2)
      objc_msgSend((id)categoryKeywordMapForLanguage__categoryKeywordMap, "removeAllObjects");
    +[RKAssets categoryKeywordMap](RKAssets, "categoryKeywordMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__RKSentenceClassifier_categoryKeywordMapForLanguage___block_invoke_2;
    v13[3] = &unk_24C6AF118;
    v14 = v8;
    v9 = v8;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend((id)categoryKeywordMapForLanguage__categoryKeywordMap, "setObject:forKeyedSubscript:", v10, v4);

  }
  objc_msgSend((id)categoryKeywordMapForLanguage__categoryKeywordMap, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __54__RKSentenceClassifier_categoryKeywordMapForLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)categoryKeywordMapForLanguage__categoryKeywordMap;
  categoryKeywordMapForLanguage__categoryKeywordMap = v0;

}

void __54__RKSentenceClassifier_categoryKeywordMapForLanguage___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a2, 19, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  if (!v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

+ (id)sensitiveSubjectRegularExpressionForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v3 = a3;
  if (sensitiveSubjectRegularExpressionForLanguage__onceToken != -1)
    dispatch_once(&sensitiveSubjectRegularExpressionForLanguage__onceToken, &__block_literal_global_248);
  _languageCodeForIdentifier((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((unint64_t)objc_msgSend((id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions, "count") >= 2)objc_msgSend((id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions, "removeAllObjects");
    +[RKAssets sensitiveSubjectRegularExpressionPatterns](RKAssets, "sensitiveSubjectRegularExpressionPatterns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v7, 19, &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12;
      if (!v9)
        objc_msgSend((id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions, "setObject:forKeyedSubscript:", v8, v4);

    }
  }
  objc_msgSend((id)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __69__RKSentenceClassifier_sensitiveSubjectRegularExpressionForLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions;
  sensitiveSubjectRegularExpressionForLanguage__sensitiveSubjectRegularExpressions = v0;

}

+ (id)polarTagRegularExpressionForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a3;
  if (polarTagRegularExpressionForLanguage__onceToken != -1)
    dispatch_once(&polarTagRegularExpressionForLanguage__onceToken, &__block_literal_global_249);
  _languageCodeForIdentifier((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[RKAssets polarTagKeywords](RKAssets, "polarTagKeywords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((unint64_t)objc_msgSend((id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions, "count") >= 2)
        objc_msgSend((id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions, "removeAllObjects");
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __61__RKSentenceClassifier_polarTagRegularExpressionForLanguage___block_invoke_2;
      v18[3] = &unk_24C6AF180;
      v9 = v8;
      v19 = v9;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
      if (objc_msgSend(v9, "count"))
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" | "));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("\\S+ \\s* \\b(%@) \\s* $"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0;
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v12, 19, &v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v17;
        if (!v14)
          objc_msgSend((id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions, "setObject:forKeyedSubscript:", v13, v4);

      }
    }

  }
  objc_msgSend((id)polarTagRegularExpressionForLanguage__polarTagRegularExpressions, "objectForKeyedSubscript:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __61__RKSentenceClassifier_polarTagRegularExpressionForLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)polarTagRegularExpressionForLanguage__polarTagRegularExpressions;
  polarTagRegularExpressionForLanguage__polarTagRegularExpressions = v0;

}

void __61__RKSentenceClassifier_polarTagRegularExpressionForLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  _regExPatternFromKeywords(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" \\s+ \\?"), CFSTR("\\?"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\?"), CFSTR(" \\s* \\?+"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "rangeOfString:", CFSTR("\\?")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ \\s* \\?*"), v7);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");

}

+ (id)alternativeInversionsForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (alternativeInversionsForLanguage__onceToken != -1)
    dispatch_once(&alternativeInversionsForLanguage__onceToken, &__block_literal_global_264);
  objc_msgSend((id)alternativeInversionsForLanguage__alternativeInversions, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[RKAssets alternativeInversions](RKAssets, "alternativeInversions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v23 = v3;
      if ((unint64_t)objc_msgSend((id)alternativeInversionsForLanguage__alternativeInversions, "count") >= 2)
        objc_msgSend((id)alternativeInversionsForLanguage__alternativeInversions, "removeAllObjects");
      objc_msgSend(v6, "allKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_266);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = v8;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            _regExPatternFromKeywords(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\\b %@ \\b"), v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = 0;
            objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v16, 19, &v25);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v25;
            v30[0] = CFSTR("regex");
            v30[1] = CFSTR("original");
            v31[0] = v17;
            v31[1] = v14;
            v30[2] = CFSTR("replacement");
            objc_msgSend(v6, "objectForKeyedSubscript:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v31[2] = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v20);

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v11);
      }

      v3 = v23;
      objc_msgSend((id)alternativeInversionsForLanguage__alternativeInversions, "setObject:forKeyedSubscript:", v9, v23);

    }
  }
  objc_msgSend((id)alternativeInversionsForLanguage__alternativeInversions, "objectForKeyedSubscript:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __57__RKSentenceClassifier_alternativeInversionsForLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)alternativeInversionsForLanguage__alternativeInversions;
  alternativeInversionsForLanguage__alternativeInversions = v0;

}

uint64_t __57__RKSentenceClassifier_alternativeInversionsForLanguage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

+ (id)appreciationKeywordsForLanguage:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = appreciationKeywordsForLanguage__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&appreciationKeywordsForLanguage__onceToken, &__block_literal_global_277);
  objc_msgSend((id)appreciationKeywordsForLanguage__appreciationKeywords, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __56__RKSentenceClassifier_appreciationKeywordsForLanguage___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RKAssets appreciationKeywords](RKAssets, "appreciationKeywords");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appreciationKeywordsForLanguage__appreciationKeywords;
  appreciationKeywordsForLanguage__appreciationKeywords = v0;

}

+ (id)preProcessTextMessageForLinguisticTagger:(id)a3 withLocale:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_msgSend(a1, "subclassForLocale:", a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "preProcessTextMessageForLinguisticTagger:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)lexicalEntitiesFromString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("？"), CFSTR("?"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("。"), CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseFirstWordString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCEA0];
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeWithLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x24BDD0F68];
  v35[0] = *MEMORY[0x24BDD0F88];
  v35[1] = v12;
  v35[2] = *MEMORY[0x24BDD0F58];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)lemmaAvailabilityByLanguage, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    objc_msgSend(v13, "arrayByAddingObject:", *MEMORY[0x24BDD0F60]);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("zh")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("zh-Hans")))
  {
    objc_msgSend(v13, "arrayByAddingObject:", *MEMORY[0x24BDD0F70]);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1638]), "initWithTagSchemes:options:", v13, 4);
  objc_msgSend(v18, "setString:", v7);
  v19 = (void *)MEMORY[0x24BDD1728];
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "defaultOrthographyForLanguage:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOrthography:range:", v21, 0, objc_msgSend(v22, "length"));

  objc_msgSend(v18, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __50__RKSentenceClassifier_lexicalEntitiesFromString___block_invoke;
  v31[3] = &unk_24C6AF228;
  v32 = v18;
  v33 = v11;
  v25 = v6;
  v34 = v25;
  v26 = v11;
  v27 = v18;
  objc_msgSend(v27, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v24, v12, 4, v31);

  v28 = v34;
  v29 = v25;

  return v29;
}

void __50__RKSentenceClassifier_lexicalEntitiesFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  v14 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringWithRange:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setString:", v9);

  objc_msgSend(v14, "setPartOfSpeech:", v7);
  objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x24BDD0F88], 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTokenType:", v10);

  objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x24BDD0F58], 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLanguage:", v11);

  objc_msgSend(v14, "setTokenRange:", a3, a4);
  objc_msgSend((id)lemmaAvailabilityByLanguage, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "BOOLValue");

  if ((_DWORD)v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x24BDD0F60], 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLemma:", v13);

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);

}

+ (id)stringFromLexicalEntities:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "string", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sentenceClassification:(id)a3 withLanguageIdentifier:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(a1, "subclassForLanguageIdentifier:", v9);

  v11 = (void *)objc_opt_new();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "sentenceClassification:options:", v8, a5);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  else
  {
    objc_msgSend(v10, "setLanguage:", CFSTR("und"));
  }

  return v10;
}

- (id)sentenceClassification:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  RKSentenceClassifier *v43;

  v4 = a4;
  v6 = a3;
  -[RKSentenceClassifier setSentenceString:](self, "setSentenceString:", v6);
  -[RKSentenceClassifier setSentenceStringOriginal:](self, "setSentenceStringOriginal:", v6);

  -[RKSentenceClassifier sentenceString](self, "sentenceString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier lexicalEntitiesFromString:](self, "lexicalEntitiesFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier setSentenceEntities:](self, "setSentenceEntities:", v8);

  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("partOfSpeech == %@"), *MEMORY[0x24BDD0F90]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RKSentenceClassifier setSentenceIsTerminated:](self, "setSentenceIsTerminated:", objc_msgSend(v11, "count") != 0);
  -[RKSentenceClassifier setSentenceHasQuestionTerminator:](self, "setSentenceHasQuestionTerminator:", 0);
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("¿?"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __55__RKSentenceClassifier_sentenceClassification_options___block_invoke;
  v41[3] = &unk_24C6AED80;
  v38 = v12;
  v42 = v38;
  v43 = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v41);
  v13 = -[RKSentenceClassifier sentenceIsTerminated](self, "sentenceIsTerminated");
  if ((v4 & 1) != 0 && !v13)
  {
    -[RKSentenceClassifier sentenceString](self, "sentenceString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier addSentenceTerminatorQuestion:](self, "addSentenceTerminatorQuestion:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier setSentenceString:](self, "setSentenceString:", v15);

    -[RKSentenceClassifier sentenceString](self, "sentenceString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier lexicalEntitiesFromString:](self, "lexicalEntitiesFromString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier setSentenceEntities:](self, "setSentenceEntities:", v17);

  }
  -[RKSentenceClassifier analyzeSentence](self, "analyzeSentence");
  -[RKSentenceClassifier classifySentence](self, "classifySentence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[RKSentenceClassifier sentenceString](self, "sentenceString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKResponseCollection responsesForFixedPhrase:withLanguage:](RKResponseCollection, "responsesForFixedPhrase:withLanguage:", v21, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v18, "setSentenceType:", 36);
    objc_msgSend(v18, "setCustomResponses:", v22);
  }
  v23 = (void *)objc_opt_class();
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sensitiveSubjectRegularExpressionForLanguage:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[RKSentenceClassifier sentenceString](self, "sentenceString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier sentenceString](self, "sentenceString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "matchesInString:options:range:", v26, 0, 0, objc_msgSend(v27, "length"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setSensitive:", objc_msgSend(v28, "count") != 0);
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLanguage:", v30);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __55__RKSentenceClassifier_sentenceClassification_options___block_invoke_2;
  v39[3] = &unk_24C6AF250;
  v40 = v31;
  v33 = v31;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v39);

  objc_msgSend(v33, "componentsJoinedByString:", CFSTR(" "));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTaggedText:", v34);

  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSentenceEntities:", v35);

  -[RKSentenceClassifier matchedRanges](self, "matchedRanges");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMatchedRanges:", v36);

  return v18;
}

void __55__RKSentenceClassifier_sentenceClassification_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", *(_QWORD *)(a1 + 32), 128);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "setSentenceHasQuestionTerminator:", 1);
    *a4 = 1;
  }
}

void __55__RKSentenceClassifier_sentenceClassification_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v4, "word");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partOfSpeech");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{%@}"), v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)analyzeSentence
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  BOOL v40;
  int v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i;
  uint64_t v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  unint64_t j;
  void *v138;
  BOOL v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  uint64_t v156;
  _BOOL4 v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  uint64_t v196;
  _QWORD v198[5];
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _QWORD v204[7];
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  char v208;
  _QWORD v209[5];
  id v210;
  _QWORD block[5];
  _QWORD v212[5];
  id v213;
  _QWORD v214[4];
  id v215;
  _QWORD v216[4];
  id v217;
  id v218;
  uint64_t *v219;
  uint64_t v220;
  uint64_t *v221;
  uint64_t v222;
  uint64_t (*v223)(uint64_t, uint64_t);
  void (*v224)(uint64_t);
  id v225;
  _QWORD v226[18];
  _QWORD v227[2];
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const __CFString *v241;
  const __CFString *v242;
  _QWORD v243[2];
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  _QWORD v247[7];
  _BYTE v248[128];
  uint64_t v249;

  v249 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEA0];
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  if (analyzeSentence_onceToken != -1)
    dispatch_once(&analyzeSentence_onceToken, &__block_literal_global_305);
  -[RKSentenceClassifier sentenceStringOriginal](self, "sentenceStringOriginal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier setSentenceIsAllSymbols:](self, "setSentenceIsAllSymbols:", objc_msgSend(v5, "rangeOfCharacterFromSet:", analyzeSentence_notSymbols) == 0x7FFFFFFFFFFFFFFFLL);

  v6 = (void *)objc_opt_class();
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "polarTagRegularExpressionForLanguage:", v7);
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  -[RKSentenceClassifier sentenceStringOriginal](self, "sentenceStringOriginal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier sentenceStringOriginal](self, "sentenceStringOriginal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v184, "count") == 1)
  {
    objc_msgSend(v184, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeAtIndex:", 1);
    v13 = v12;

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RKSentenceClassifier setSentenceTag:](self, "setSentenceTag:", v14);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", CFSTR("word"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[RKUtilities stripDiacritics:](RKUtilities, "stripDiacritics:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_class();
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "categoryKeywordMapForLanguage:", v21);
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  v220 = 0;
  v221 = &v220;
  v222 = 0x3032000000;
  v223 = __Block_byref_object_copy_;
  v224 = __Block_byref_object_dispose_;
  v225 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v216[0] = MEMORY[0x24BDAC760];
  v216[1] = 3221225472;
  v216[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_310;
  v216[3] = &unk_24C6AF2C0;
  v179 = v19;
  v217 = v179;
  v22 = v15;
  v218 = v22;
  v219 = &v220;
  objc_msgSend(v182, "enumerateKeysAndObjectsUsingBlock:", v216);
  -[RKSentenceClassifier setMatchedRanges:](self, "setMatchedRanges:", v221[5]);
  v214[0] = MEMORY[0x24BDAC760];
  v214[1] = 3221225472;
  v214[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_3;
  v214[3] = &unk_24C6AED50;
  v215 = v22;
  v185 = v215;
  objc_msgSend(v215, "enumerateObjectsWithOptions:usingBlock:", 2, v214);
  objc_msgSend(v185, "sortUsingComparator:", &__block_literal_global_319);
  v23 = (void *)objc_msgSend(v185, "copy");
  -[RKSentenceClassifier setInterrogatives:](self, "setInterrogatives:", v23);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v212[0] = 0;
  v212[1] = v212;
  v212[2] = 0x3032000000;
  v212[3] = __Block_byref_object_copy_;
  v212[4] = __Block_byref_object_dispose_;
  v213 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_5;
  block[3] = &unk_24C6AF080;
  block[4] = v212;
  if (analyzeSentence_onceDataDetectorToken != -1)
    dispatch_once(&analyzeSentence_onceDataDetectorToken, block);
  v25 = (void *)analyzeSentence_dataDetector;
  -[RKSentenceClassifier sentenceString](self, "sentenceString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier sentenceString](self, "sentenceString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");
  v209[0] = MEMORY[0x24BDAC760];
  v209[1] = 3221225472;
  v209[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_6;
  v209[3] = &unk_24C6AF350;
  v209[4] = self;
  v181 = v24;
  v210 = v181;
  objc_msgSend(v25, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v28, v209);

  -[RKSentenceClassifier setDataDetected:](self, "setDataDetected:", v181);
  -[RKSentenceClassifier setChoiceDelimiters:](self, "setChoiceDelimiters:", MEMORY[0x24BDBD1A8]);
  -[RKSentenceClassifier setSentenceHasAlternativeConjunction:](self, "setSentenceHasAlternativeConjunction:", 0);
  v29 = 0;
  v30 = 0;
  v186 = 0x7FFFFFFFFFFFFFFFLL;
  v188 = (void *)*MEMORY[0x24BDD0F50];
  while (1)
  {
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v30 < (unint64_t)objc_msgSend(v31, "count");

    if (!v32)
      break;
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", v30);
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30 < 1)
    {
      v192 = 0;
    }
    else
    {
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", v30 - 1);
      v192 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v30 + 1;
    v37 = v30 + 1 < (unint64_t)objc_msgSend(v35, "count");

    if (v37)
    {
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", v30 + 1);
      v190 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v190 = 0;
    }
    objc_msgSend(v194, "word");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v39, "isEqualToString:", CFSTR(",")))
    {

LABEL_20:
      -[RKSentenceClassifier alternativeConjunctions](self, "alternativeConjunctions");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "word");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v43, "containsObject:", v44) & 1) != 0)
      {
        objc_msgSend(v192, "partOfSpeech");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45 == v188;

        if (!v46)
        {
          v42 = 1;
LABEL_28:
          v41 = 1;
          v186 = v30;
          goto LABEL_31;
        }
      }
      else
      {

      }
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v29 + objc_msgSend(v47, "count");
      if (v48 < multiWordOrLength)
      {

        v42 = 0;
        v41 = 0;
LABEL_30:
        v30 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_31;
      }
      -[RKSentenceClassifier alternativeConjunctions](self, "alternativeConjunctions");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "word");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringByAppendingString:", CFSTR(" "));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "word");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringByAppendingString:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v49, "containsObject:", v53);

      if (!v41)
      {
        v42 = 0;
        goto LABEL_30;
      }
      v42 = multiWordOrLength;
      goto LABEL_28;
    }
    v40 = -[RKSentenceClassifier sentenceHasAlternativeConjunction](self, "sentenceHasAlternativeConjunction");

    if (v40)
      goto LABEL_20;
    v41 = 0;
    v42 = 1;
LABEL_31:
    v205 = 0;
    v206 = &v205;
    v207 = 0x2020000000;
    v208 = 0;
    -[RKSentenceClassifier dataDetected](self, "dataDetected");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v204[0] = MEMORY[0x24BDAC760];
    v204[1] = 3221225472;
    v204[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_8;
    v204[3] = &unk_24C6AF378;
    v204[5] = v30;
    v204[6] = v42;
    v204[4] = &v205;
    objc_msgSend(v54, "enumerateObjectsUsingBlock:", v204);

    if (v42 && v42 < RK_QUERY_ALTERNATIVE_MAX_PHRASAL_LENGTH && !*((_BYTE *)v206 + 24))
    {
      -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v30, v42);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "arrayByAddingObject:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[RKSentenceClassifier setChoiceDelimiters:](self, "setChoiceDelimiters:", v57);

      -[RKSentenceClassifier setSentenceHasAlternativeConjunction:](self, "setSentenceHasAlternativeConjunction:", v41 | -[RKSentenceClassifier sentenceHasAlternativeConjunction](self, "sentenceHasAlternativeConjunction"));
    }
    _Block_object_dispose(&v205, 8);

    --v29;
    v30 = v36;
  }
  if (-[RKSentenceClassifier sentenceHasAlternativeConjunction](self, "sentenceHasAlternativeConjunction"))
  {
    -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "count") == 0;

    if (!v59)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      v61 = *MEMORY[0x24BDD0F90];
      while (1)
      {
        -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v60 > objc_msgSend(v62, "count");

        if (v63)
          break;
        if (v60)
        {
          -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v60 < objc_msgSend(v64, "count");

          if (v65)
          {
            -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "objectAtIndexedSubscript:", v60 - 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "rangeValue");
            v70 = v69;

            -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "objectAtIndexedSubscript:", v60);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "rangeValue");

            objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v68 + v70, v73 - (v68 + v70));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "addObject:", v74);
          }
          else
          {
            -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "objectAtIndexedSubscript:", v60 - 1);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "rangeValue");
            v88 = v87;

            -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend(v89, "count");

            v91 = v86 + v88;
            if (v90 == v91)
            {
LABEL_57:
              v102 = 0;
            }
            else
            {
              while (1)
              {
                -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = v90 - 1;
                objc_msgSend(v92, "objectAtIndexedSubscript:", v90 - 1);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "partOfSpeech");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = objc_msgSend(v95, "isEqualToString:", v61);

                if ((v96 & 1) == 0)
                  break;
                --v90;
                if (v93 == v91)
                  goto LABEL_57;
              }
              while (1)
              {
                -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                v98 = v90 - 1;
                objc_msgSend(v97, "objectAtIndexedSubscript:", v90 - 1);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "partOfSpeech");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = objc_msgSend(v100, "isEqualToString:", v188);

                if (!v101)
                  break;
                --v90;
                if (v98 == v91)
                  goto LABEL_57;
              }
              v102 = v90 - v91;
            }
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v91, v102);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "addObject:", v74);
          }
        }
        else
        {
          -[RKSentenceClassifier choiceDelimiters](self, "choiceDelimiters");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "rangeValue");

          if (v77)
          {
            v78 = 0;
            v79 = v77;
            while (1)
            {
              -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "objectAtIndexedSubscript:", v78);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "partOfSpeech");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend(v82, "isEqualToString:", v61);

              if (!v83)
                break;
              ++v78;
              if (!--v79)
                goto LABEL_54;
            }
            v77 = v78;
          }
          else
          {
            v79 = 0;
          }
LABEL_54:
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v77, v79);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v195, "addObject:", v74);
        }

        ++v60;
      }
      v202 = 0u;
      v203 = 0u;
      v200 = 0u;
      v201 = 0u;
      v103 = v195;
      v104 = 0;
      v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v200, v248, 16);
      if (v105)
      {
        v106 = *(_QWORD *)v201;
        do
        {
          for (i = 0; i != v105; ++i)
          {
            if (*(_QWORD *)v201 != v106)
              objc_enumerationMutation(v103);
            objc_msgSend(*(id *)(*((_QWORD *)&v200 + 1) + 8 * i), "rangeValue");
            if (v108 == 1)
              ++v104;
          }
          v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v200, v248, 16);
        }
        while (v105);
      }

      if (v104 == objc_msgSend(v103, "count"))
      {
        -[RKSentenceClassifier setAlternatives:](self, "setAlternatives:", v103);
        goto LABEL_76;
      }
      objc_msgSend((id)partofSpeechAvailabilityByLanguage, "objectForKeyedSubscript:", v180);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v109, "BOOLValue");

      if (v110)
      {
        v111 = (void *)MEMORY[0x24BDBCF20];
        v246 = *MEMORY[0x24BDD0EE0];
        v196 = v246;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v246, 1);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "setWithArray:", v191);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v247[0] = v189;
        v112 = (void *)MEMORY[0x24BDBCF20];
        v245 = *MEMORY[0x24BDD0F40];
        v169 = v245;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v245, 1);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setWithArray:", v187);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v247[1] = v178;
        v113 = (void *)MEMORY[0x24BDBCF20];
        v244 = *MEMORY[0x24BDD0EA0];
        v193 = v244;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v244, 1);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setWithArray:", v177);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        v247[2] = v176;
        v114 = (void *)MEMORY[0x24BDBCF20];
        v115 = *MEMORY[0x24BDD0EA8];
        v243[0] = *MEMORY[0x24BDD0F98];
        v168 = v115;
        v243[1] = v115;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v243, 2);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "setWithArray:", v175);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        v247[3] = v174;
        v116 = (void *)MEMORY[0x24BDBCF20];
        v242 = CFSTR("RKLinguisticTagDataDetected");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v242, 1);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setWithArray:", v173);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v247[4] = v172;
        v117 = (void *)MEMORY[0x24BDBCF20];
        v227[0] = *MEMORY[0x24BDD0EE8];
        v167 = v227[0];
        v227[1] = v193;
        v165 = *MEMORY[0x24BDD0ED8];
        v228 = *MEMORY[0x24BDD0F48];
        v166 = v228;
        v229 = v165;
        v163 = *MEMORY[0x24BDD0EF0];
        v230 = *MEMORY[0x24BDD0F28];
        v164 = v230;
        v231 = v163;
        v118 = *MEMORY[0x24BDD0EB0];
        v232 = v196;
        v233 = v118;
        v120 = *MEMORY[0x24BDD0F00];
        v234 = *MEMORY[0x24BDD0F20];
        v119 = v234;
        v235 = v120;
        v122 = *MEMORY[0x24BDD0F30];
        v236 = *MEMORY[0x24BDD0EC0];
        v121 = v236;
        v237 = v122;
        v124 = *MEMORY[0x24BDD0F08];
        v238 = *MEMORY[0x24BDD0F38];
        v123 = v238;
        v239 = v124;
        v240 = *MEMORY[0x24BDD0ED0];
        v125 = v240;
        v241 = CFSTR("RKLinguisticTagDataDetected");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v227, 16);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setWithArray:", v171);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v247[5] = v170;
        v126 = (void *)MEMORY[0x24BDBCF20];
        v226[0] = v167;
        v226[1] = v193;
        v226[2] = v166;
        v226[3] = v165;
        v226[4] = v164;
        v226[5] = v169;
        v226[6] = v163;
        v226[7] = v196;
        v226[8] = v118;
        v226[9] = v119;
        v226[10] = v120;
        v226[11] = v121;
        v226[12] = v122;
        v226[13] = v123;
        v226[14] = v124;
        v226[15] = v168;
        v226[16] = v125;
        v226[17] = CFSTR("RKLinguisticTagDataDetected");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v226, 18);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "setWithArray:", v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v247[6] = v128;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v247, 7);
        v129 = (void *)objc_claimAutoreleasedReturnValue();

        v198[0] = MEMORY[0x24BDAC760];
        v198[1] = 3221225472;
        v198[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_9;
        v198[3] = &unk_24C6AF3C8;
        v198[4] = self;
        v199 = v103;
        objc_msgSend(v129, "enumerateObjectsUsingBlock:", v198);

        goto LABEL_75;
      }
      objc_msgSend((id)partofSpeechAvailabilityByLanguage, "objectForKeyedSubscript:", v180);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v129, "BOOLValue") & 1) != 0)
      {
LABEL_75:

      }
      else
      {
        v156 = objc_msgSend(v180, "isEqualToString:", CFSTR("nl"));

        if ((v156 & 1) == 0)
        {
          v157 = 0;
          if (v186 && v186 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
            v156 = objc_claimAutoreleasedReturnValue();
            v157 = v186 + 1 < (unint64_t)objc_msgSend((id)v156, "count");
          }
          if (v186 && v186 != 0x7FFFFFFFFFFFFFFFLL)

          if (v157)
          {
            -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "objectAtIndexedSubscript:", v186 + 1);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "partOfSpeech");
            v129 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v129, "isEqualToString:", CFSTR("SentenceTerminator")) & 1) == 0
              && (objc_msgSend(v129, "isEqualToString:", CFSTR("Punctuation")) & 1) == 0)
            {
              v160 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v186 - 1, 1);
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "addObject:", v161);

              objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v186 + 1, 1);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "addObject:", v162);

              -[RKSentenceClassifier setAlternatives:](self, "setAlternatives:", v160);
            }
            goto LABEL_75;
          }
        }
      }
LABEL_76:

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier setAppreciations:](self, "setAppreciations:", v130);

  v131 = (void *)MEMORY[0x24BDBCF20];
  v132 = (void *)objc_opt_class();
  -[RKSentenceClassifier languageIdentifier](self, "languageIdentifier");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  _languageCodeForIdentifier((uint64_t)v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "appreciationKeywordsForLanguage:", v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setWithArray:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = 0; ; ++j)
  {
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = j < objc_msgSend(v138, "count");

    if (!v139)
      break;
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend(v140, "count");

    v142 = v141 - j;
    if (v141 - j >= 3)
      v142 = 3;
    if (v142)
    {
      v143 = v142 - 1;
      do
      {
        -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "subarrayWithRange:", j, v143 + 1);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "valueForKeyPath:", CFSTR("@unionOfObjects.string"));
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "componentsJoinedByString:", CFSTR("+"));
        v147 = (void *)objc_claimAutoreleasedReturnValue();

        +[RKUtilities stripDiacritics:](RKUtilities, "stripDiacritics:", v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        v149 = (void *)MEMORY[0x212BA17B8]();
        objc_msgSend(v148, "lowercaseString");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = objc_msgSend(v136, "containsObject:", v150);

        if (v151)
        {
          -[RKSentenceClassifier appreciations](self, "appreciations");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", j, v143 + 1);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "arrayByAddingObject:", v153);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          -[RKSentenceClassifier setAppreciations:](self, "setAppreciations:", v154);

          j += v143;
        }
        objc_autoreleasePoolPop(v149);

        if (v143)
          v155 = v151;
        else
          v155 = 1;
        --v143;
      }
      while (v155 != 1);
    }
  }

  _Block_object_dispose(v212, 8);
  _Block_object_dispose(&v220, 8);

}

uint64_t __39__RKSentenceClassifier_analyzeSentence__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v0 = objc_opt_new();
  v1 = (void *)analyzeSentence_notSymbols;
  analyzeSentence_notSymbols = v0;

  v2 = (void *)analyzeSentence_notSymbols;
  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  v4 = (void *)analyzeSentence_notSymbols;
  objc_msgSend(MEMORY[0x24BDD14A8], "symbolCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v5);

  v6 = (void *)analyzeSentence_notSymbols;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v7);

  v8 = (void *)analyzeSentence_notSymbols;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 65024, 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formUnionWithCharacterSet:", v9);

  return objc_msgSend((id)analyzeSentence_notSymbols, "invert");
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_310(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_2;
  v12[3] = &unk_24C6AF298;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v15 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "substringToIndex:", objc_msgSend(v4, "range"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v4, "range");
  objc_msgSend(v8, "substringWithRange:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v19 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("range"));

  v15 = *(void **)(a1 + 32);
  v16 = objc_msgSend(v4, "range");
  objc_msgSend(v15, "substringWithRange:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("string"));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v4);

}

unint64_t __39__RKSentenceClassifier_analyzeSentence__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t result;
  unint64_t v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSRange v16;
  NSRange v18;
  NSRange v19;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("range"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    v10 = 0;
    while (1)
    {
      if (a3 != v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("range"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "rangeValue");
        v15 = v14;

        v18.location = v6;
        v18.length = v8;
        v19.location = v13;
        v19.length = v15;
        v16 = NSIntersectionRange(v18, v19);
        if (v16.location == v6 && v16.length == v8)
          break;
      }
      ++v10;
      result = objc_msgSend(*(id *)(a1 + 32), "count");
      if (v10 >= result)
        return result;
    }
    return objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", a3);
  }
  return result;
}

uint64_t __39__RKSentenceClassifier_analyzeSentence__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("range"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("range"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "rangeValue");
  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 6200, &obj);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v1 + 40), obj);
  v3 = (void *)analyzeSentence_dataDetector;
  analyzeSentence_dataDetector = v2;

}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, NSUInteger);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3010000000;
  v16 = "";
  v17 = xmmword_20D3E9090;
  objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __39__RKSentenceClassifier_analyzeSentence__block_invoke_7;
  v10 = &unk_24C6AF328;
  v5 = v3;
  v11 = v5;
  v12 = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v14[4], v14[5], v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  _Block_object_dispose(&v13, 8);
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_7(uint64_t a1, void *a2, NSUInteger location)
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSRange v10;
  id v11;
  NSRange v12;
  NSRange v13;
  NSRange v14;

  v11 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "range");
  v7 = v6;
  v13.location = objc_msgSend(v11, "tokenRange");
  v13.length = v8;
  v12.location = v5;
  v12.length = v7;
  if (NSIntersectionRange(v12, v13).length)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10.location = *(_QWORD *)(v9 + 32);
    v10.length = 1;
    if (v10.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10.length = *(_QWORD *)(v9 + 40);
      v14.location = location;
      v14.length = 1;
      v10 = NSUnionRange(v10, v14);
      location = v10.location;
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    *(_QWORD *)(v9 + 32) = location;
    *(_QWORD *)(v9 + 40) = v10.length;
    objc_msgSend(v11, "setPartOfSpeech:", CFSTR("RKLinguisticTagDataDetected"));
  }

}

NSUInteger __39__RKSentenceClassifier_analyzeSentence__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  NSUInteger v6;
  NSUInteger result;
  NSRange v8;
  NSRange v9;

  v9.location = objc_msgSend(a2, "rangeValue");
  v9.length = v6;
  v8 = NSIntersectionRange(*(NSRange *)(a1 + 40), v9);
  result = v8.location;
  if (v8.length)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  void *v53;
  id v54;
  _QWORD v55[5];
  id v56;

  v54 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "choiceDelimiters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "count");

  v6 = 0;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "choiceDelimiters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v25, "rangeValue");

      if (!v20)
        goto LABEL_24;
      v26 = 0;
      v14 = v20;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v14 - 1;
        objc_msgSend(v27, "objectAtIndexedSubscript:", v14 - 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "partOfSpeech");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v54, "containsObject:", v30);

        if (!v31)
          break;
        ++v26;
        --v14;
        if (!v28)
          goto LABEL_22;
      }
      v20 = v26;
LABEL_22:
      if (!v20)
        goto LABEL_24;
LABEL_23:
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v14, v20);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v37);

      goto LABEL_24;
    }
    v9 = objc_msgSend(v7, "count");

    objc_msgSend(*(id *)(a1 + 32), "choiceDelimiters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v6 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeValue");
    v14 = v12 + v13;

    v15 = *(void **)(a1 + 32);
    if (v6 >= v9)
    {
      objc_msgSend(v15, "sentenceEntities");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 >= objc_msgSend(v32, "count"))
      {
        v20 = 0;
LABEL_20:

      }
      else
      {
        v20 = 0;
        while (1)
        {
          objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", v14 + v20);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "partOfSpeech");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v54, "containsObject:", v35);

          if (!v36)
            break;
          ++v20;
          objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 + v20 >= objc_msgSend(v32, "count"))
            goto LABEL_20;
        }
      }
      goto LABEL_22;
    }
    objc_msgSend(v15, "choiceDelimiters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "rangeValue");

    v19 = v14;
    v20 = v18 - v14;
    if (v18 <= v14)
    {
LABEL_7:
      if (v18 != v14)
        goto LABEL_23;
    }
    else
    {
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "partOfSpeech");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v54, "containsObject:", v23);

        if ((v24 & 1) == 0)
          break;
        if (++v19 >= v18)
          goto LABEL_7;
      }
    }
LABEL_24:
    ++v6;
    objc_msgSend(*(id *)(a1 + 32), "choiceDelimiters");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

  }
  while (v6 <= v39);
  v40 = v53;
  v41 = objc_msgSend(v53, "count");
  if (v41 == objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v42 = (void *)analyzeSentence_dataDetector;
    objc_msgSend(*(id *)(a1 + 32), "sentenceString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sentenceString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_10;
    v55[3] = &unk_24C6AF350;
    v55[4] = *(_QWORD *)(a1 + 32);
    v46 = v53;
    v56 = v46;
    objc_msgSend(v42, "enumerateMatchesInString:options:range:usingBlock:", v43, 0, 0, v45, v55);

    if (objc_msgSend(v46, "count"))
    {
      v47 = 0;
      while (1)
      {
        objc_msgSend(v46, "objectAtIndexedSubscript:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "rangeValue");
        v50 = v49;
        v51 = RK_QUERY_ALTERNATIVE_MAX_PHRASAL_LENGTH;

        if (v50 > v51)
          break;
        if (objc_msgSend(v46, "count") <= (unint64_t)++v47)
          goto LABEL_30;
      }
    }
    else
    {
LABEL_30:
      objc_msgSend(*(id *)(a1 + 32), "setAlternatives:", v46);
    }
    *a4 = 1;

    v40 = v53;
  }

}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  __int128 v15;

  v3 = a2;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = "";
  v15 = xmmword_20D3E9090;
  objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_11;
  v11[3] = &unk_24C6AF328;
  v6 = v3;
  v12 = v6;
  v13 = v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  v7 = *(void **)(a1 + 40);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __39__RKSentenceClassifier_analyzeSentence__block_invoke_12;
  v8[3] = &unk_24C6AF3A0;
  v10 = v14;
  v9 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v8);

  _Block_object_dispose(v14, 8);
}

NSUInteger __39__RKSentenceClassifier_analyzeSentence__block_invoke_11(uint64_t a1, void *a2, NSUInteger location)
{
  void *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  uint64_t v14;
  NSRange v16;
  NSRange v17;
  NSRange v18;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "range");
  v9 = v8;
  v10 = objc_msgSend(v6, "tokenRange");
  v12 = v11;

  v16.location = v7;
  v16.length = v9;
  v17.location = v10;
  v17.length = v12;
  v13 = NSIntersectionRange(v16, v17);
  if (v13.length)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13.location = *(_QWORD *)(v14 + 32);
    v13.length = 1;
    if (v13.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13.length = *(_QWORD *)(v14 + 40);
      v18.location = location;
      v18.length = 1;
      v13 = NSUnionRange(v13, v18);
      location = v13.location;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    *(_QWORD *)(v14 + 32) = location;
    *(_QWORD *)(v14 + 40) = v13.length;
  }
  return v13.location;
}

void __39__RKSentenceClassifier_analyzeSentence__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSRange *v8;
  NSUInteger v9;
  NSRange *v10;
  NSUInteger v11;
  NSRange v12;
  void *v13;
  id v14;
  NSRange v15;
  NSRange v16;

  v7 = a2;
  v8 = *(NSRange **)(*(_QWORD *)(a1 + 40) + 8);
  v14 = v7;
  v15.location = objc_msgSend(v7, "rangeValue");
  v15.length = v9;
  if (NSIntersectionRange(v8[32], v15).length)
  {
    v10 = *(NSRange **)(*(_QWORD *)(a1 + 40) + 8);
    v16.location = objc_msgSend(v14, "rangeValue");
    v16.length = v11;
    v12 = NSUnionRange(v10[2], v16);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v12.location, v12.length);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v13, a3);

    *a4 = 1;
  }

}

- (id)classifySentence
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD v22[10];

  v22[9] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceIsAllSymbols](self, "sentenceIsAllSymbols")
    && !-[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 36);
  }
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier sentenceTag](self, "sentenceTag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v3, "setSentenceType:", 5);
  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceIsTerminated](self, "sentenceIsTerminated")
    && !-[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 31);
  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceHasAlternativeConjunction](self, "sentenceHasAlternativeConjunction"))
  {
    objc_msgSend(v3, "setSentenceType:", 6);
  }
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = *MEMORY[0x24BDD0F00];
  v22[0] = *MEMORY[0x24BDD0F90];
  v22[1] = v6;
  v7 = *MEMORY[0x24BDD0EF8];
  v22[2] = *MEMORY[0x24BDD0EC0];
  v22[3] = v7;
  v8 = *MEMORY[0x24BDD0FB0];
  v22[4] = *MEMORY[0x24BDD0EB8];
  v22[5] = v8;
  v9 = *MEMORY[0x24BDD0F18];
  v22[6] = *MEMORY[0x24BDD0ED0];
  v22[7] = v9;
  v22[8] = *MEMORY[0x24BDD0EE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "sentenceType") || objc_msgSend(v3, "sentenceType") == 31)
  {
    -[RKSentenceClassifier appreciations](self, "appreciations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[RKSentenceClassifier appreciations](self, "appreciations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "rangeValue");

      if (!v16)
        goto LABEL_20;
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v16 - 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "partOfSpeech");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v11, "containsObject:", v19);

      if (v20)
LABEL_20:
        objc_msgSend(v3, "setSentenceType:", 34);
    }
  }

  return v3;
}

- (NSArray)sentenceEntities
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSentenceEntities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)matchedRanges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatchedRanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)languageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)partofSpeechAvailabilityByLanguage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPartofSpeechAvailabilityByLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)lemmaAvailabilityByLanguage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLemmaAvailabilityByLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)sentenceStringOriginal
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSentenceStringOriginal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)sentenceString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSentenceString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)sentenceIsTerminated
{
  return self->_sentenceIsTerminated;
}

- (void)setSentenceIsTerminated:(BOOL)a3
{
  self->_sentenceIsTerminated = a3;
}

- (BOOL)sentenceIsAllSymbols
{
  return self->_sentenceIsAllSymbols;
}

- (void)setSentenceIsAllSymbols:(BOOL)a3
{
  self->_sentenceIsAllSymbols = a3;
}

- (BOOL)sentenceHasQuestionTerminator
{
  return self->_sentenceHasQuestionTerminator;
}

- (void)setSentenceHasQuestionTerminator:(BOOL)a3
{
  self->_sentenceHasQuestionTerminator = a3;
}

- (BOOL)sentenceHasAlternativeConjunction
{
  return self->_sentenceHasAlternativeConjunction;
}

- (void)setSentenceHasAlternativeConjunction:(BOOL)a3
{
  self->_sentenceHasAlternativeConjunction = a3;
}

- (NSValue)sentenceTag
{
  return (NSValue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSentenceTag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)inversions
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInversions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)interrogatives
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInterrogatives:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)choiceDelimiters
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setChoiceDelimiters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)alternatives
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAlternatives:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSArray)appreciations
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAppreciations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSArray)dataDetected
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)RKLinguisticTagDataDetected
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRKLinguisticTagDataDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_RKLinguisticTagDataDetected, 0);
  objc_storeStrong((id *)&self->_dataDetected, 0);
  objc_storeStrong((id *)&self->_appreciations, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_choiceDelimiters, 0);
  objc_storeStrong((id *)&self->_interrogatives, 0);
  objc_storeStrong((id *)&self->_inversions, 0);
  objc_storeStrong((id *)&self->_sentenceTag, 0);
  objc_storeStrong((id *)&self->_sentenceString, 0);
  objc_storeStrong((id *)&self->_sentenceStringOriginal, 0);
  objc_storeStrong((id *)&self->_lemmaAvailabilityByLanguage, 0);
  objc_storeStrong((id *)&self->_partofSpeechAvailabilityByLanguage, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong((id *)&self->_matchedRanges, 0);
  objc_storeStrong((id *)&self->_sentenceEntities, 0);
}

void __46__RKSentenceClassifier_nb_NO_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_uk_UA_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_es_ES_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_hi_IN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_fi_FI_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_he_IL_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __71__RKSentenceClassifier_en_US_preProcessTextMessageForLinguisticTagger___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x24BDD0F60], 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24C7194C8, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", a3, a4, v7);

}

void __45__RKSentenceClassifier_en_US_analyzeSentence__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "lemma");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("oregon")) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v7, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("or"));

  v6 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setLemma:", CFSTR("or"));
LABEL_5:
    v6 = v7;
  }

}

void __45__RKSentenceClassifier_en_US_analyzeSentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  id v36;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v36 = v5;
  objc_msgSend(v5, "partOfSpeech");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

  if (!(_DWORD)v6)
    goto LABEL_33;
  v8 = a3 - 1;
  if (a3 < 1)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = *MEMORY[0x24BDD0EA8];
  v12 = *MEMORY[0x24BDD0ED8];
  while (1)
  {
    objc_msgSend(v10, "partOfSpeech");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", v11) & 1) != 0)
    {

      v14 = v8 - 1;
      if (v8 < 1)
        goto LABEL_12;
      goto LABEL_11;
    }
    objc_msgSend(v10, "partOfSpeech");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "isEqualToString:", v12))
      break;
    v14 = v8 - 1;

    if (v8 <= 0)
    {
LABEL_12:
      v18 = 0;
      goto LABEL_17;
    }
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = v14;
    v10 = (void *)v17;
  }

  if (v8 < 1)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v8 - 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = v8;
LABEL_17:
  objc_msgSend(v18, "partOfSpeech");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", v11))
  {

    if (v14 >= 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v14 - 2);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
      goto LABEL_20;
    }
  }
  else
  {
LABEL_20:

  }
  objc_msgSend(v10, "partOfSpeech");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDD0F98];
  if (!objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD0F98]))
    goto LABEL_31;
  v24 = *(void **)(a1 + 48);
  objc_msgSend(v10, "lemma");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v24, "containsObject:", v25);

  if ((_DWORD)v24)
  {
    if (!v18
      || (v26 = *(void **)(a1 + 32),
          objc_msgSend(v18, "partOfSpeech"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v26) = objc_msgSend(v26, "containsObject:", v27),
          v27,
          (v26 & 1) == 0))
    {
      objc_msgSend(v18, "partOfSpeech");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", v23);

      if ((v29 & 1) == 0)
      {
        objc_msgSend(v10, "string");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lowercaseString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("do")) & 1) != 0)
        {
          objc_msgSend(v36, "lemma");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("it"));

          if ((v33 & 1) != 0)
            goto LABEL_32;
        }
        else
        {

        }
        objc_msgSend(*(id *)(a1 + 40), "inversions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v14, a3 - v14 + 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayByAddingObject:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setInversions:", v35);

LABEL_31:
      }
    }
  }
LABEL_32:

LABEL_33:
}

void __46__RKSentenceClassifier_en_US_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  id v71;
  _QWORD v72[6];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;

  v71 = a2;
  objc_msgSend(v71, "partOfSpeech");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD0EC8]);

  if (v6)
  {
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = 0;
    objc_msgSend(*(id *)(a1 + 32), "choiceDelimiters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_2;
    v72[3] = &unk_24C6AF4A0;
    v72[4] = &v73;
    v72[5] = a3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v72);

    if (!*((_BYTE *)v74 + 24))
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      goto LABEL_43;
    objc_msgSend(*(id *)(a1 + 32), "dataDetected");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v67, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "customResponses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 < 2)
      {
LABEL_43:
        _Block_object_dispose(&v73, 8);
        goto LABEL_44;
      }
      v10 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "customResponses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lexicalEntitiesFromString:", v12);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "customResponses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lexicalEntitiesFromString:", v15);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v67, "count");
      if (v16 <= objc_msgSend(v55, "count"))
        v17 = v67;
      else
        v17 = v55;
      v54 = objc_msgSend(v17, "count");
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v19 = objc_msgSend(v67, "count");
      if (v54)
      {
        v52 = 0;
        v53 = 0;
        v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v69 = v18 - v19;
        v60 = *MEMORY[0x24BDD0F28];
        v58 = *MEMORY[0x24BDD0ED8];
        v59 = *MEMORY[0x24BDD0F40];
        v57 = *MEMORY[0x24BDD0ED0];
        v56 = 1;
        v70 = a1;
LABEL_12:
        v21 = v20 + 1;
        while (1)
        {
          if (v69 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
            goto LABEL_38;
          v68 = v21;
          objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v21 >= v23)
          {
            a1 = v70;
            goto LABEL_38;
          }
          objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectAtIndexedSubscript:", v69);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "partOfSpeech");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          a1 = v70;
          if ((objc_msgSend(v61, "isEqualToString:", v60) & 1) != 0)
            goto LABEL_32;
          objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v69);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "partOfSpeech");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          a1 = v70;
          if ((objc_msgSend(v26, "isEqualToString:", v59) & 1) != 0)
            goto LABEL_31;
          objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", v69);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "partOfSpeech");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v29, "isEqualToString:", v58) & 1) != 0)
          {

            a1 = v70;
LABEL_31:

LABEL_32:
LABEL_33:
            v21 = v68;
            ++v69;
            goto LABEL_26;
          }
          objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v69);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "partOfSpeech");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", v57);

          a1 = v70;
          if ((v33 & 1) != 0)
            goto LABEL_33;
          objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", v68);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "partOfSpeech");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v36, "isEqualToString:", v60) & 1) == 0)
          {
            objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectAtIndexedSubscript:", v68);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "partOfSpeech");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v39, "isEqualToString:", v59) & 1) == 0)
            {
              objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "objectAtIndexedSubscript:", v68);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "partOfSpeech");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v41, "isEqualToString:", v58) & 1) == 0)
              {
                objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "objectAtIndexedSubscript:", v68);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "partOfSpeech");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend(v43, "isEqualToString:", v57);

                if ((v62 & 1) == 0)
                {
                  a1 = v70;
                  objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
                  v20 = v68;
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "objectAtIndexedSubscript:", v69);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "partOfSpeech");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v70 + 32), "sentenceEntities");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectAtIndexedSubscript:", v68);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "partOfSpeech");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v46, "isEqualToString:", v49);

                  v53 += v50 ^ 1u;
                  ++v69;
                  v56 = ++v52 < v54;
                  if (v52 != v54)
                    goto LABEL_12;
                  goto LABEL_38;
                }
                goto LABEL_25;
              }

            }
          }

LABEL_25:
          v21 = v68 + 1;
          a1 = v70;
LABEL_26:
          if (!v56)
            goto LABEL_38;
        }
      }
      v53 = 0;
LABEL_38:
      v51 = objc_msgSend(v67, "count", v52);
      if (v51 != objc_msgSend(v55, "count") && v53)
      {
        objc_msgSend(*(id *)(a1 + 40), "setCustomResponses:", 0);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }

    }
    goto LABEL_43;
  }
LABEL_44:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

}

unint64_t __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  unint64_t result;
  unint64_t v8;

  v6 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(a2, "rangeValue");
  if (v6 >= result && v6 - result < v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("range"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeValue");

  objc_msgSend(*(id *)(a1 + 32), "inversions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {

LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "inversions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rangeValue");
  v13 = v12;

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 + 3 <= (unint64_t)objc_msgSend(v14, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lemma");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("do")))
    {
      objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v11 + 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lemma");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("you")))
      {
        objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", v11 + 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lemma");
        v24 = v15;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v19, "isEqualToString:", CFSTR("know"));

        if (!v25)
          goto LABEL_14;
        objc_msgSend(*(id *)(a1 + 40), "setCustomResponses:", &unk_24C715C38);
        goto LABEL_9;
      }

    }
  }

LABEL_14:
  if (v7 < v13 + v11)
  {
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("category"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", objc_msgSend(v20, "unsignedIntegerValue"));

    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("gender"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setGender:", objc_msgSend(v21, "unsignedIntegerValue"));

  }
  *a4 = 1;

}

void __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a2;
  objc_msgSend(v6, "setWithArray:", &unk_24C715C68);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeValue");
  v11 = v10;

  objc_msgSend(v8, "subarrayWithRange:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lemma");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("can"));

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v14, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("you")) & 1) != 0)
    {
      objc_msgSend(v13, "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v23, "containsObject:", v21);

      if ((v22 & 1) != 0)
      {
        v17 = 3;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v17 = 2;
    goto LABEL_8;
  }
  v17 = 4;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", v17);
  *a4 = 1;

}

void __46__RKSentenceClassifier_vi_VN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_nl_NL_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __51__RKSentenceClassifier_zh_Hans_CN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __51__RKSentenceClassifier_zh_Hant_CN_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_pt_BR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ms_MY_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_pl_PL_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_nl_BE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ru_RU_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_cs_CZ_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_sk_SK_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_fr_BE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ro_RO_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_da_DK_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ca_ES_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_ja_JP_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_hr_HR_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_it_IT_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_sv_SE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __45__RKSentenceClassifier_de_DE_analyzeSentence__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = objc_msgSend(&unk_24C715EA8, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v9;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(&unk_24C715EA8);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v4), "componentsSeparatedByString:", CFSTR("/"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObjectsFromArray:", v5);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(&unk_24C715EA8, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v2);
  }
  v6 = objc_msgSend(v0, "copy");
  v7 = (void *)analyzeSentence_kModalVerbs;
  analyzeSentence_kModalVerbs = v6;

}

void __45__RKSentenceClassifier_de_DE_analyzeSentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v34 = v5;
  objc_msgSend(v5, "partOfSpeech");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

  if (!(_DWORD)v6)
    goto LABEL_31;
  v8 = a3 - 1;
  if (a3 < 1)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = *MEMORY[0x24BDD0EA8];
  v12 = *MEMORY[0x24BDD0ED8];
  while (1)
  {
    objc_msgSend(v10, "partOfSpeech");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", v11) & 1) != 0)
    {

      v14 = v8 - 1;
      if (v8 < 1)
        goto LABEL_12;
      goto LABEL_11;
    }
    objc_msgSend(v10, "partOfSpeech");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "isEqualToString:", v12))
      break;
    v14 = v8 - 1;

    if (v8 <= 0)
    {
LABEL_12:
      v18 = 0;
      goto LABEL_17;
    }
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = v14;
    v10 = (void *)v17;
  }

  if (v8 < 1)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v8 - 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = v8;
LABEL_17:
  objc_msgSend(v18, "partOfSpeech");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", v11))
  {

    if (v14 >= 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "sentenceEntities");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v14 - 2);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
      goto LABEL_20;
    }
  }
  else
  {
LABEL_20:

  }
  objc_msgSend(v10, "partOfSpeech");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDD0F98];
  if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD0F98]))
  {
    v24 = (void *)analyzeSentence_kModalVerbs;
    objc_msgSend(v10, "lemma");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "containsObject:", v25))
    {

      goto LABEL_25;
    }
    v26 = (void *)analyzeSentence_kModalVerbs;
    objc_msgSend(v10, "word");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v26, "containsObject:", v27);

    if ((_DWORD)v26)
    {
LABEL_25:
      if (!v18
        || (v28 = *(void **)(a1 + 32),
            objc_msgSend(v18, "partOfSpeech"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            LOBYTE(v28) = objc_msgSend(v28, "containsObject:", v29),
            v29,
            (v28 & 1) == 0))
      {
        objc_msgSend(v18, "partOfSpeech");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", v23);

        if ((v31 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "inversions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v14, a3 - v14 + 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "arrayByAddingObject:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setInversions:", v33);

          goto LABEL_29;
        }
      }
    }
  }
  else
  {
LABEL_29:

  }
LABEL_31:

}

void __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("range"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeValue");

  objc_msgSend(*(id *)(a1 + 32), "inversions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "inversions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeValue");
    v13 = v12;

  }
  else
  {
    v13 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v7 < v11 + v13)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("category"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", objc_msgSend(v14, "unsignedIntegerValue"));

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("gender"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setGender:", objc_msgSend(v15, "unsignedIntegerValue"));

  }
  *a4 = 1;

}

void __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a2;
  objc_msgSend(v6, "setWithArray:", MEMORY[0x24BDBD1A8]);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sentenceEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeValue");
  v11 = v10;

  objc_msgSend(v8, "subarrayWithRange:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("kann/kannst/kann/können/könnt"), "componentsSeparatedByString:", CFSTR("/"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v13, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("%@ LIKE[cd] SELF"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
  {
    objc_msgSend(v14, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lowercaseString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("you")) & 1) != 0)
    {
      objc_msgSend(v13, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lowercaseString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v27, "containsObject:", v25);

      if ((v26 & 1) != 0)
      {
        v21 = 3;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v21 = 2;
    goto LABEL_8;
  }
  v21 = 4;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "setSentenceType:", v21);
  *a4 = 1;

}

void __46__RKSentenceClassifier_id_ID_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

void __46__RKSentenceClassifier_hu_HU_classifySentence__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSentenceType:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setGender:", objc_msgSend(v8, "unsignedIntegerValue"));
  *a4 = 1;
}

@end

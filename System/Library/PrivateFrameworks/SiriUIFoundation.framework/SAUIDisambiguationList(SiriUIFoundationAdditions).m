@implementation SAUIDisambiguationList(SiriUIFoundationAdditions)

- (id)sruif_combinedSpeakableText
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
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v29[3];
  char v30;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09310], "sruif_speakableUtteranceParserForCurrentLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandleTTSCodes:", 1);
  objc_msgSend(a1, "speakableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_speakableStringFromString:usingParser:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "speakableDelimiter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_speakableStringFromString:usingParser:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "speakableSuffix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_speakableStringFromString:usingParser:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v2, "appendString:", v5);
  objc_msgSend(a1, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 1;
  objc_msgSend(a1, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __80__SAUIDisambiguationList_SiriUIFoundationAdditions__sruif_combinedSpeakableText__block_invoke;
  v22 = &unk_24DC1B940;
  v23 = a1;
  v13 = v3;
  v24 = v13;
  v27 = v29;
  v28 = v11;
  v14 = v2;
  v25 = v14;
  v15 = v7;
  v26 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v19);

  if (objc_msgSend(v9, "length", v19, v20, v21, v22, v23))
    objc_msgSend(v14, "appendString:", v9);
  if (objc_msgSend(v14, "length"))
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  _Block_object_dispose(v29, 8);
  return v17;
}

- (id)_speakableStringFromString:()SiriUIFoundationAdditions usingParser:
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "parseStringWithFormat:error:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (__CFString)_speakableFinalDelimiterForSpeakableString:()SiriUIFoundationAdditions usingParser:
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  SRUIFGetLanguageCode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "hasPrefix:", CFSTR("es")))
  {
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("it"))
      && (FirstCharacterOfStringIsInCharacterSetInString(v6, CFSTR("aeiouıᅡ-ᅵ")) & 1) != 0)
    {
      v9 = CFSTR(" od ");
      goto LABEL_8;
    }
LABEL_7:
    objc_msgSend(a1, "speakableFinalDelimiter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_speakableStringFromString:usingParser:", v10, v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if ((FirstCharacterOfStringIsInCharacterSetInString(v6, CFSTR("oó")) & 1) == 0)
    goto LABEL_7;
  v9 = CFSTR(" u ");
LABEL_8:

  return v9;
}

- (BOOL)sruif_hasButton
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "items");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

@end

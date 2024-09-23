@implementation LTOfflineTranslationEngine

void __65___LTOfflineTranslationEngine_preheatAsynchronously_withContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  _LTOSLogTranslationEngine();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PreheatModels", "Loading all models", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_loadRecognizersWithContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "taskHint");
  _LTTranslationModelTaskString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_loadTranslatorForTask:", v6);
  if (objc_msgSend(*(id *)(a1 + 40), "censorSpeech"))
    objc_msgSend(*(id *)(a1 + 32), "_loadEtiquetteSanitizers");
  v7 = v5;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v8, OS_SIGNPOST_INTERVAL_END, v3, "PreheatModels", "Finished loading models", v9, 2u);
  }

}

id __82___LTOfflineTranslationEngine__handleTranslationResults_withContext_sourceString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  float v23;
  float v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  _QWORD *WeakRetained;
  void *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v38 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v37 = v3;
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v3, "tokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v41 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v10 = objc_alloc(MEMORY[0x24BDF64C8]);
          objc_msgSend(v9, "text");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "confidence");
          v13 = (void *)objc_msgSend(v10, "initWithText:confidence:", v11, v12);

          objc_msgSend(v4, "addObject:", v13);
          objc_msgSend(v9, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length") == 0;

          if (!v15)
          {
            objc_msgSend(v9, "text");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v16);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v6);
    }

    objc_msgSend(v39, "componentsJoinedByString:", CFSTR(" "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v37;
    if (objc_msgSend(*(id *)(v38 + 32), "censorSpeech") && (v19 = (void *)WeakRetained[4]) != 0)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(v38 + 40));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sanitizedStringForString:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v37;
    }
    else
    {
      v21 = 0;
    }
    v22 = objc_alloc(MEMORY[0x24BDF6488]);
    objc_msgSend(v18, "confidence");
    v24 = v23;
    v25 = objc_msgSend(v18, "lowConfidence");
    v26 = (void *)objc_msgSend(v22, "initWithFormattedString:sanitizedFormattedString:confidence:lowConfidence:romanization:tokens:preToPostITN:", v17, v21, v25, 0, v4, MEMORY[0x24BDBD1A8], v24);
    objc_msgSend(v18, "metaInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "updateWithEngineMeta:locale:", v27, *(_QWORD *)(v38 + 40));

    v28 = (void *)MEMORY[0x24BDF63D8];
    if (v21)
    {
      objc_msgSend(v26, "romanization");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "nodeWithText:romanization:", v21, v29);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = *(_QWORD *)(v38 + 48);
      objc_msgSend(v26, "romanization");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "nodeFromEMTResult:sourceText:romanization:", v37, v32, v33);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
LABEL_21:
        objc_msgSend(*(id *)(v38 + 56), "addObject:", v31, WeakRetained);
LABEL_22:

        goto LABEL_23;
      }
      v35 = (void *)MEMORY[0x24BDF63D8];
      objc_msgSend(v26, "romanization");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "nodeWithText:romanization:", v17, v29);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)v30;

    if (!v31)
      goto LABEL_22;
    goto LABEL_21;
  }
  v26 = 0;
LABEL_23:

  return v26;
}

void __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Done translating", buf, 2u);
    }
    v6 = *(id *)(a1 + 32);
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 96);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v7, OS_SIGNPOST_INTERVAL_END, v8, "TranslateTokens", "Offline: Finished translating", buf, 2u);
    }

    v9 = WeakRetained[6];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke_24;
    v10[3] = &unk_251A12E70;
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v3;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    v15 = WeakRetained;
    v16 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 80);
    dispatch_async(v9, v10);

  }
}

void __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke_24(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_handleTranslationResults:withContext:sourceString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Unable to create a translation result from EMT results; returning result without any translations",
        (uint8_t *)&v23,
        2u);
    }
    objc_msgSend(MEMORY[0x24BDF64A8], "resultWithLocale:translations:", *(_QWORD *)(a1 + 64), MEMORY[0x24BDBD1A8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "setRoute:", 1);
  objc_msgSend(v2, "setSourceString:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 48), "censorSpeech"))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 72) + 32);
    if (v4)
    {
      objc_msgSend(v2, "locale");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "sanitizedStringForString:", *(_QWORD *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setSanitizedSourceString:", v7);

    }
  }
  objc_msgSend(v2, "translations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 80);
  v27 = CFSTR("bestConfidence");
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "confidence");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFieldsFromDictionary:", v13);

  v14 = *(void **)(a1 + 80);
  v25 = CFSTR("bestTranslation");
  objc_msgSend(v9, "formattedString");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &stru_251A15610;
  if (v15)
    v17 = (const __CFString *)v15;
  v26 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addFieldsFromDictionary:internalOnly:", v18, 1);

  v19 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "translations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "formattedString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138739971;
    v24 = v22;
    _os_log_impl(&dword_2491B9000, v19, OS_LOG_TYPE_INFO, "Finished translating: %{sensitive}@", (uint8_t *)&v23, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 80), "sendLazy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

id __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "translations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "translations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "romanization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  id v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "translations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sanitizedFormattedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6)
    v9 = 0;
  else
    v9 = *(_BYTE *)(v8 + 24) == 0;
  v10 = !v9;
  *(_BYTE *)(v8 + 24) = v10;
  if (v6)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend(v5, "formattedString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

void __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      v17 = v5;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Translating sentence with offline engine: %{sensitive}@", buf, 0xCu);
    }
    objc_msgSend(v5, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 32), "isFinal");
    v12 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "spans");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_40;
    v14[3] = &unk_251A12F48;
    v15 = v6;
    objc_msgSend(WeakRetained, "_translateString:isFinal:withContext:toLocale:withSpans:completion:", v9, v10, v12, v11, v13, v14);

  }
}

uint64_t __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_paragraphResultFromSentences:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

    objc_msgSend(*(id *)(a1 + 32), "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourceString:", v7);

    if (objc_msgSend(*(id *)(a1 + 40), "censorSpeech"))
    {
      v8 = (void *)*((_QWORD *)v4 + 4);
      if (v8)
      {
        objc_msgSend(*((id *)v4 + 18), "sourceLocale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sanitizedStringForString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setSanitizedSourceString:", v12);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138739971;
    v17 = v8;
    _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Translating paragraph with offline engine: %{sensitive}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_44;
    v12[3] = &unk_251A12FC0;
    v14 = *(id *)(a1 + 48);
    v13 = v5;
    v15 = v6;
    objc_msgSend(WeakRetained, "_translateParagraph:withContext:toLocale:completion:", v13, v10, v11, v12);

  }
}

void __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Finished translating paragraph with offline engine", v7, 2u);
  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, _QWORD))(v5 + 16))(v5, v6, v3, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Finished translation with offline engine, sending analytics event", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "sendLazy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "censorSpeech"))
      objc_msgSend(*(id *)(a1 + 40), "_loadEtiquetteSanitizers");
    v3 = *(_QWORD *)(a1 + 48);
    v4 = objc_msgSend(*(id *)(a1 + 32), "isFinal");
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "localePair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke_2;
    v8[3] = &unk_251A12F48;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(WeakRetained, "_translateString:isFinal:withContext:toLocale:withSpans:completion:", v3, v4, v5, v7, 0, v8);

  }
}

uint64_t __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke(id *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id *v31;
  _QWORD *WeakRetained;
  id obj;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  os_signpost_id_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained)
  {
    if (objc_msgSend(a1[4], "censorSpeech"))
      objc_msgSend(a1[5], "_loadEtiquetteSanitizers");
    _LTOSLogTranslationEngine();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_signpost_id_generate(v2);
    v4 = v2;
    v5 = v4;
    v29 = v4;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      v6 = objc_msgSend(a1[6], "count");
      *(_DWORD *)buf = 134217984;
      v46 = v6;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "TranslateParagraphs", "Offline: Translating %zu paragraphs", buf, 0xCu);
    }
    v31 = a1;

    objc_msgSend(a1[4], "localePair");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v31[6];
    v8 = 0;
    v9 = 0;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v13, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          v16 = objc_alloc(MEMORY[0x24BDD1458]);
          objc_msgSend(v13, "text");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

          objc_msgSend(v18, "lt_sentences");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          v8 += v15;
          v9 += v20;
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v10);
    }

    v21 = (void *)WeakRetained[14];
    objc_msgSend(v31[4], "logIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:", v22, 0, 1, 2, v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v31[4];
    v25 = v31[6];
    v26 = v31[7];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_52;
    v34[3] = &unk_251A13060;
    v27 = v29;
    v35 = v27;
    v36 = v23;
    v38 = v3;
    v39 = v9;
    v37 = v31[8];
    v28 = v23;
    objc_msgSend(WeakRetained, "_translate:withContext:toLocale:paragraphResult:completion:", v25, v24, v30, v26, v34);

  }
}

void __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "TranslateParagraphs", "Offline: Finished translating", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "responseReceived:", *(_QWORD *)(a1 + 64));
  if (v3)
  {
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_52_cold_1();
  }
  else
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Successfully finished all paragraph translations with offline engine", v9, 2u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55___LTOfflineTranslationEngine_cancelSpeechTranslation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "cancelRecognition:", *(unsigned __int8 *)(a1 + 40));

}

void __50___LTOfflineTranslationEngine_addSpeechAudioData___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained[2], "addSpeechAudioData:", *(_QWORD *)(a1 + 32));

}

void __39___LTOfflineTranslationEngine_endpoint__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 96) = 1;
    objc_msgSend(*((id *)WeakRetained + 2), "endAudio");
  }

}

void __62___LTOfflineTranslationEngine_setLanguagesRecognized_context___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;
  int v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v4 = WeakRetained + 10;
    if ((objc_msgSend(WeakRetained[10], "isEqual:", a1[4]) & 1) == 0
      && (objc_msgSend(a1[5], "forceSourceLocale") & 1) == 0)
    {
      objc_msgSend(v6, "_translatePrepare:", a1[4]);
    }
    objc_storeStrong(v4, a1[4]);
    objc_storeStrong(v6 + 11, a1[6]);
    if (!+[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:lidResult:](_LTOfflineTranslationEngine, "_needToWaitForBothFinalTranslationResultsWithContext:lidResult:", a1[5], a1[6]))objc_msgSend(v6[2], "setLanguagesRecognized:", a1[6]);
    v3 = v6;
    if (v6[9])
    {
      v5 = objc_msgSend(v6[11], "isFinal");
      v3 = v6;
      if (v5)
      {
        dispatch_group_leave((dispatch_group_t)v6[9]);
        v3 = v6;
      }
    }
  }

}

void __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  dispatch_group_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (!objc_msgSend(a1[4], "autodetectLanguage") || (objc_msgSend(a1[4], "forceSourceLocale") & 1) != 0)
    {
LABEL_4:
      (*((void (**)(void))a1[5] + 2))();
      goto LABEL_5;
    }
    v3 = (void *)*((_QWORD *)WeakRetained + 11);
    if (v3 && objc_msgSend(v3, "isFinal"))
    {
      v4 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Already got final LID result, forwarding...", buf, 2u);
      }
      goto LABEL_4;
    }
    if (!*((_QWORD *)WeakRetained + 9))
    {
      v5 = dispatch_group_create();
      v6 = (void *)*((_QWORD *)WeakRetained + 9);
      *((_QWORD *)WeakRetained + 9) = v5;

      dispatch_group_enter(*((dispatch_group_t *)WeakRetained + 9));
      v7 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Waiting for LID result", buf, 2u);
      }
      v8 = *((_QWORD *)WeakRetained + 9);
      v9 = *((_QWORD *)WeakRetained + 6);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke_55;
      v10[3] = &unk_251A13150;
      v10[4] = WeakRetained;
      v11 = a1[5];
      dispatch_group_notify(v8, v9, v10);

    }
  }
LABEL_5:

}

uint64_t __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke_55(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v6[16];

  v2 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Received final LID result, continue with wait block", v6, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = *((_QWORD *)WeakRetained + 6);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke_2;
    block[3] = &unk_251A131A0;
    v12 = v6;
    v14 = *(id *)(a1 + 32);
    v13 = v5;
    dispatch_async(v9, block);
    v10 = (void *)v8[3];
    v8[3] = 0;

  }
}

void __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[6];
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x24BDD1540], "lt_offlineTTSErrorWithError:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(a1[6], a1[5]);
  }
}

void __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDF64A8];
  objc_msgSend(*(id *)(a1 + 32), "formattedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sanitizedFormattedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passthroughResultWithString:sanitizedString:locale:", v3, v4, *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "sanitizedFormattedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSanitizedSourceString:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[6];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_3;
    v7[3] = &unk_251A13218;
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    v13 = *(_BYTE *)(a1 + 64);
    v12 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);

  }
}

void __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "bestTranscription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedString");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_handleTranslationResults:withContext:sourceString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "bestTranscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sanitizedFormattedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSanitizedSourceString:", v6);

  objc_msgSend(v3, "setIsFinal:", *(unsigned __int8 *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "translationDidFinishWithError:");
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "addFieldsWithError:", v3);
  objc_msgSend(*(id *)(a1 + 40), "sendLazy");

}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2(id *a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 10);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "taskHint");
    _LTTranslationModelTaskString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_loadTranslatorForTask:", v3);
    if (WeakRetained[13])
    {
      (*((void (**)(void))a1[9] + 2))();
    }
    else
    {
      v4 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Starting TTS translation with offline engine", buf, 2u);
      }
      _LTOSLogTranslationEngine();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_generate(v5);
      v7 = v5;
      v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        v9 = a1[5];
        *(_DWORD *)buf = 138739971;
        v26 = v9;
        _os_signpost_emit_with_name_impl(&dword_2491B9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "OfflineTranslation", "Offline: Translating text: %{sensitive}@", buf, 0xCu);
      }

      objc_msgSend(a1[6], "timestampWithName:", CFSTR("mtStartTime"));
      v10 = (void *)WeakRetained[14];
      objc_msgSend(a1[4], "logIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:", v11, 0, 2, 2, objc_msgSend(a1[5], "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = a1[4];
      v13 = a1[5];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_61;
      v17[3] = &unk_251A13290;
      v15 = v8;
      v18 = v15;
      v24 = v6;
      v19 = a1[7];
      v20 = v12;
      v21 = a1[6];
      v22 = a1[8];
      v23 = a1[9];
      v16 = v12;
      objc_msgSend(WeakRetained, "translateSentence:withContext:completion:", v13, v14, v17);

    }
  }

}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  const __CFString *v27;
  const __CFString *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v26 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v32 = v9;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v7, OS_SIGNPOST_INTERVAL_END, v8, "OfflineTranslation", "Offline: Finished translating speech result, (id: %{public}@)", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "responseReceived:", 0);
  objc_msgSend(*(id *)(a1 + 56), "timestampWithName:", CFSTR("mtResultTime"));
  if (v26)
  {
    v10 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_61_cold_1();
  }
  objc_msgSend(v5, "translations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 56);
  v29[0] = CFSTR("mtLocale");
  objc_msgSend(v5, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_ltLocaleIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_251A15610;
  v29[1] = CFSTR("mtBestConfidence");
  v30[0] = v17;
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "confidence");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addFieldsFromDictionary:", v20);

  v21 = *(void **)(a1 + 56);
  v27 = CFSTR("mtBestText");
  objc_msgSend(v12, "formattedString");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = &stru_251A15610;
  v28 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addFieldsFromDictionary:internalOnly:", v25, 1);

  objc_msgSend(*(id *)(a1 + 64), "translatorDidTranslate:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  _BYTE *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 6));
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count") > 1
      || !+[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:lidResult:](_LTOfflineTranslationEngine, "_needToWaitForBothFinalTranslationResultsWithContext:lidResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88)))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        if (!*(_BYTE *)(v5 + 24))
        {
          *(_BYTE *)(v5 + 24) = 1;
          if (!v4[64] || v4[65])
            objc_msgSend(*(id *)(a1 + 48), "translationDidFinishWithError:", v6);
          if (v6)
            objc_msgSend(*(id *)(a1 + 56), "addFieldsWithError:", v6);
          objc_msgSend(*(id *)(a1 + 56), "sendLazy");
        }
      }
    }
  }

}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  dispatch_queue_t *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  os_signpost_id_t v31;
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 88));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[6]);
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Starting speech translation with offline engine", buf, 2u);
    }
    _LTOSLogTranslationEngine();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);
    v11 = v9;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v34 = v13;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "OfflineTranslation", "Offline: Translating speech result, (id: %{public}@)", buf, 0xCu);
    }

    if (a3)
      objc_msgSend(*(id *)(a1 + 40), "timestampWithName:", CFSTR("mtStartTime"));
    v14 = *(_QWORD *)(a1 + 48);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_74;
    v20[3] = &unk_251A13330;
    v15 = v12;
    v21 = v15;
    v31 = v10;
    v22 = *(id *)(a1 + 32);
    v23 = v7;
    v32 = a3;
    v24 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 72);
    v25 = v16;
    v29 = v17;
    v26 = v5;
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 80);
    v27 = v18;
    v30 = v19;
    v28 = *(id *)(a1 + 64);
    -[dispatch_queue_t _translate:withContext:isFinal:completion:](v7, "_translate:withContext:isFinal:completion:", v26, v14, 1, v20);

  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 112);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "OfflineTranslation", "Offline: Finished translating speech result, (id: %{public}@)", buf, 0xCu);
  }

  v8 = *(void **)(a1 + 56);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 48);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_75;
  v15[3] = &unk_251A13308;
  v25 = *(_BYTE *)(a1 + 120);
  v16 = v8;
  v17 = v3;
  v18 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 96);
  v19 = v10;
  v23 = v11;
  v20 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 104);
  v21 = v12;
  v24 = v13;
  v22 = *(id *)(a1 + 88);
  v14 = v3;
  dispatch_async(v9, v15);

}

uint64_t __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_75(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "timestampWithName:", CFSTR("mtResultTime"));
    objc_msgSend(*(id *)(a1 + 40), "translations");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = CFSTR("mtLocale");
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ltLocaleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_251A15610;
    v23[1] = CFSTR("mtBestConfidence");
    v24[0] = v8;
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "confidence");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addFieldsFromDictionary:", v11);

    v12 = *(void **)(a1 + 32);
    v21 = CFSTR("mtBestText");
    objc_msgSend(v3, "formattedString");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = &stru_251A15610;
    v22 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addFieldsFromDictionary:internalOnly:", v16, 1);

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 48) + 64))
    objc_msgSend(*(id *)(a1 + 56), "translatorDidTranslate:", *(_QWORD *)(a1 + 40));
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 64), "locale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count") == 2
    || !+[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:lidResult:](_LTOfflineTranslationEngine, "_needToWaitForBothFinalTranslationResultsWithContext:lidResult:", *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_77(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[6]);
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Starting partial speech translation with offline engine", buf, 2u);
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_78;
    v8[3] = &unk_251A13380;
    v8[4] = v5;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    -[dispatch_queue_t _translate:withContext:isFinal:completion:](v5, "_translate:withContext:isFinal:completion:", v3, v7, 0, v8);

  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64))
    objc_msgSend(*(id *)(a1 + 40), "translatorDidTranslate:", v3);

}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_80(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_queue_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  dispatch_queue_t v36;
  void *v37;
  dispatch_queue_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  __int128 v43;
  id obj;
  dispatch_queue_t *WeakRetained;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[6]);
    v56 = 0u;
    v54 = 0u;
    v55 = 0u;
    v53 = 0u;
    objc_msgSend(v3, "transcriptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v4)
    {
      v6 = *(_QWORD *)v54;
      *(_QWORD *)&v5 = 134218496;
      v43 = v5;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v54 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v7);
          if (objc_msgSend(v3, "isFinal", v43))
          {
            objc_msgSend(v3, "locale");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = WeakRetained[1];
            objc_msgSend(v3, "locale");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject speechModelVersionForLocale:](v10, "speechModelVersionForLocale:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = _LTPreferencesOfflineASRConfidenceThreshold(v9, v12);

            v14 = (id)_LTOSLogTranslationEngine();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              v22 = WeakRetained[1];
              objc_msgSend(v3, "locale");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject speechModelVersionForLocale:](v22, "speechModelVersionForLocale:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v58 = v24;
              _os_log_debug_impl(&dword_2491B9000, v14, OS_LOG_TYPE_DEBUG, "ModelVersion %{public}@", buf, 0xCu);

            }
            if ((objc_msgSend(*(id *)(a1 + 32), "asrConfidenceThreshold") & 0x8000000000000000) == 0)
              v13 = objc_msgSend(*(id *)(a1 + 32), "asrConfidenceThreshold");
            objc_msgSend(v8, "confidence");
            objc_msgSend(v8, "setLowConfidence:", v15 <= (double)v13);
            v16 = (id)_LTOSLogTranslationEngine();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v8, "confidence");
              v26 = v25;
              v27 = objc_msgSend(v8, "isLowConfidence");
              *(_DWORD *)buf = v43;
              v58 = v26;
              v59 = 1024;
              v60 = v27;
              v61 = 2048;
              v62 = v13;
              _os_log_debug_impl(&dword_2491B9000, v16, OS_LOG_TYPE_DEBUG, "LowConfidence (%f): %d with threshold %ld", buf, 0x1Cu);
            }

          }
          if (objc_msgSend(*(id *)(a1 + 32), "censorSpeech"))
          {
            v17 = WeakRetained[4];
            if (v17)
            {
              objc_msgSend(v8, "locale");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v8, "formattedString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "sanitizedStringForString:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setSanitizedFormattedString:", v21);

            }
          }
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v4);
    }

    if (!*((_BYTE *)WeakRetained + 64))
      objc_msgSend(*(id *)(a1 + 40), "speechRecognitionResult:", v3);
    if ((objc_msgSend(v3, "isFinal") & 1) != 0)
    {
      v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_msgSend(v3, "locale");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v3, v29);

      v30 = *(void **)(a1 + 48);
      v31 = *(void **)(a1 + 32);
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_81;
      v46[3] = &unk_251A133D0;
      v46[4] = WeakRetained;
      v32 = v31;
      v33 = *(_QWORD *)(a1 + 88);
      v47 = v32;
      v51 = v33;
      v34 = *(id *)(a1 + 56);
      v35 = *(_QWORD *)(a1 + 96);
      v48 = v34;
      v52 = v35;
      v49 = *(id *)(a1 + 72);
      v50 = *(id *)(a1 + 80);
      objc_msgSend(v30, "_waitForLIDWithContext:completion:", v32, v46);

    }
    else if (objc_msgSend(v3, "isStable"))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "autodetectLanguage"))
      {
        v36 = WeakRetained[10];
        objc_msgSend(v3, "locale");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSObject _ltEqual:](v36, "_ltEqual:", v37) & 1) != 0
          || (v38 = WeakRetained[11]) != 0 && !-[NSObject isConfident](v38, "isConfident"))
        {

        }
        else
        {
          if (!objc_msgSend(*(id *)(a1 + 32), "forceSourceLocale"))
          {

            goto LABEL_34;
          }
          objc_msgSend(*(id *)(a1 + 32), "localePair");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "sourceLocale");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "locale");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v40, "_ltEqual:", v41);

          if ((v42 & 1) == 0)
            goto LABEL_34;
        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }
LABEL_34:

}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_81(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  _QWORD v41[2];
  _QWORD v42[6];

  v42[4] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = +[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:lidResult:](_LTOfflineTranslationEngine, "_needToWaitForBothFinalTranslationResultsWithContext:lidResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(*(id *)(a1 + 32), "_getBestRecognitionResult:context:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = 1;
  else
    v5 = v2;
  if ((v5 & 1) != 0)
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "timestampWithName:", CFSTR("asrResultTime"));
      v6 = (id)_LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "locale");
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "localeIdentifier");
        objc_claimAutoreleasedReturnValue();
        __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_81_cold_1();
      }

      v7 = *(void **)(a1 + 48);
      v41[0] = CFSTR("asrLocale");
      objc_msgSend(v4, "locale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_ltLocaleIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (const __CFString *)v9;
      else
        v11 = CFSTR("unknown");
      v41[1] = CFSTR("asrBestConfidence");
      v42[0] = v11;
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "bestTranscription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "confidence");
      objc_msgSend(v12, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addFieldsFromDictionary:", v15);

      v16 = *(void **)(a1 + 48);
      v39 = CFSTR("asrBestText");
      objc_msgSend(v4, "bestTranscription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "formattedString");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = &stru_251A15610;
      if (v18)
        v20 = (const __CFString *)v18;
      v40 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addFieldsFromDictionary:internalOnly:", v21, 1);

    }
    if (v2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          objc_msgSend(v28, "locale", (_QWORD)v33);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v29) = objc_msgSend(v29, "containsObject:", v30);

          if ((v29 & 1) == 0)
          {
            (*(void (**)(_QWORD, void *, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v28, v28 == v4);
            v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            objc_msgSend(v28, "locale");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v32);

          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v25);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v23 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_81_cold_2();
  }

}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_92(id *a1)
{
  uint64_t *WeakRetained;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 8);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 64) = 0;
    objc_msgSend(WeakRetained, "_loadRecognizersWithContext:", a1[4]);
    if (objc_msgSend(a1[4], "censorSpeech"))
      objc_msgSend(v3, "_loadEtiquetteSanitizers");
    v4 = v3[13];
    if (v4)
    {
      if (!*((_BYTE *)v3 + 64) || *((_BYTE *)v3 + 65))
      {
        objc_msgSend(a1[5], "translationDidFinishWithError:");
        v4 = v3[13];
      }
      objc_msgSend(a1[6], "addFieldsWithError:", v4);
      objc_msgSend(a1[6], "sendLazy");
    }
    else
    {
      objc_msgSend(a1[4], "taskHint");
      _LTTranslationModelTaskString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_loadTranslatorForTask:", v5);
      v6 = (void *)v3[11];
      v3[11] = 0;

      v7 = (void *)v3[9];
      v3[9] = 0;

      v8 = (void *)v3[10];
      v3[10] = 0;

      *((_BYTE *)v3 + 96) = 0;
      if ((objc_msgSend(a1[4], "autodetectLanguage") & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(a1[4], "localePair");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sourceLocale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!objc_msgSend(a1[4], "autodetectLanguage")
        || objc_msgSend(a1[4], "forceSourceLocale"))
      {
        objc_msgSend(a1[4], "localePair");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sourceLocale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_translatePrepare:", v12);

      }
      v13 = (void *)v3[2];
      v14 = objc_msgSend(a1[4], "autoEndpoint");
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_93;
      v15[3] = &unk_251A13448;
      v15[4] = v3;
      v16 = a1[5];
      v17 = a1[6];
      v18 = a1[7];
      objc_msgSend(v13, "startRecognitionForLocale:autoEndpoint:resultHandler:", v9, v14, v15);

    }
  }

}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_93(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_3;
  v13[3] = &unk_251A13420;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 48);
  v13[1] = 3221225472;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v18 = v5;
  v19 = v10;
  v11 = v5;
  v12 = v6;
  dispatch_async(v9, v13);

}

uint64_t __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v3 + 64) || *(_BYTE *)(v3 + 65))
  {
    objc_msgSend(*(id *)(a1 + 48), "translationDidFinishWithError:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 56), "addFieldsWithError:", v2);
  return objc_msgSend(*(id *)(a1 + 56), "sendLazy");
}

void __39___LTOfflineTranslationEngine_endAudio__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "endAudio");
    objc_msgSend(WeakRetained[3], "cancel");
  }

}

void __49___LTOfflineTranslationEngine_cancelRecognition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 64) = 1;
    *((_BYTE *)WeakRetained + 65) = *(_BYTE *)(a1 + 40);
    objc_msgSend(*((id *)WeakRetained + 2), "cancelRecognition");
  }

}

void __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_52_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Failed to translate paragraphs with offline engine: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Error translating sentence with offline engine: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_81_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_5(&dword_2491B9000, v4, (uint64_t)v4, "Best recognition: %{public}@", v5);

  OUTLINED_FUNCTION_16();
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_81_cold_2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2491B9000, v0, OS_LOG_TYPE_DEBUG, "Unable to request final translation yet missing relevant ASR result based on confident acoustic LID result", v1, 2u);
  OUTLINED_FUNCTION_0();
}

@end

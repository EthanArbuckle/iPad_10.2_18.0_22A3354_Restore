@implementation _LTTranslationResult(Osprey)

- (void)initWithOspreySpeechTranslationMTResponse:()Osprey sourceText:censorSpeech:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  char v27;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(a1, "init");
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setRoute:", 2);
    objc_msgSend(v8, "translation_locale_pair");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "target_locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocale:", v14);

    objc_msgSend(v8, "n_best_translated_phrases");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __98___LTTranslationResult_Osprey__initWithOspreySpeechTranslationMTResponse_sourceText_censorSpeech___block_invoke;
    v25 = &unk_251A13CF0;
    v16 = v11;
    v26 = v16;
    v27 = a5;
    objc_msgSend(v15, "_ltCompactMap:", &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslations:", v17, v22, v23, v24, v25);
    objc_msgSend(v8, "request_id");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIdentifier:", v18);

    objc_msgSend(v16, "setIsFinal:", objc_msgSend(v8, "is_final"));
    objc_msgSend(MEMORY[0x24BDF63C0], "resultFromFTSpeechResponse:sourceText:censorSpeech:", v8, v9, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDisambiguableResult:", v19);

    v20 = v16;
  }

  return v11;
}

- (void)initWithOspreyResponse:()Osprey
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "init");
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRoute:", 2);
    objc_msgSend(v4, "n_best_translated_phrases");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ltCompactMap:", &__block_literal_global_28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslations:", v8);

    objc_msgSend(MEMORY[0x24BDF63C0], "resultFromOspreyResponse:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisambiguableResult:", v9);

    v10 = v6;
  }

  return v6;
}

- (void)initWithOspreyBatchResponse:()Osprey sourceText:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "init");
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setRoute:", 2);
    objc_msgSend(v6, "translated_text_romanized");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {

      v10 = 0;
    }
    v11 = objc_alloc(MEMORY[0x24BDF6488]);
    objc_msgSend(v6, "translated_text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormattedString:sanitizedFormattedString:confidence:lowConfidence:romanization:tokens:preToPostITN:", v12, 0, 0, v10, 0, 0, 1.0);

    v18[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslations:", v14);

    objc_msgSend(MEMORY[0x24BDF63C0], "resultFromOspreyBatchResponse:sourceText:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisambiguableResult:", v15);

    v16 = v9;
  }

  return v9;
}

- (void)updateAlignmentWithSourceSpan:()Osprey targetSpan:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  unint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = a1;
  objc_msgSend(a1, "translations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formattedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v12 = 0;
    v29 = v7;
    v30 = v6;
    do
    {
      if (v12 >= objc_msgSend(v6, "count"))
        break;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v12;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v31 = v14;
      objc_msgSend(v14, "span");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v35;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
            v20 = objc_alloc_init(MEMORY[0x24BDF63B0]);
            objc_msgSend(v13, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setIdentifier:", v21);

            v22 = objc_msgSend(v13, "range");
            objc_msgSend(v20, "setSourceRange:", v22, v23);
            v24 = objc_msgSend(v11, "lt_codeUnitsRangeFromCodePointsRange:", (int)objc_msgSend(v19, "start_index"), (int)(objc_msgSend(v19, "end_index") - objc_msgSend(v19, "start_index") + 1));
            v26 = v25;
            objc_msgSend(v20, "setTargetRange:", v24, v25);
            objc_msgSend(v11, "substringWithRange:", v24, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setText:", v27);

            objc_msgSend(v20, "setShouldTranslate:", objc_msgSend(v19, "do_not_translate") ^ 1);
            objc_msgSend(v8, "addObject:", v20);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v16);
      }

      v12 = v32 + 1;
      v7 = v29;
      v6 = v30;
    }
    while (v32 + 1 < objc_msgSend(v29, "count"));
  }
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_15_0);
  objc_msgSend(v28, "setAlignments:", v8);

}

@end

@implementation _LTDisambiguableResult(Daemon)

+ (id)_resultWithSentences:()Daemon
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDF63C0], "isGenderDisambiguationEnabled") & 1) == 0)
  {
    v6 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      v7 = "Not creating disambiguation result because the feature flag is off";
LABEL_9:
      _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 2u);
    }
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v6 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      v7 = "Not creating disambiguation result because there's no valid sentences in the result";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63C0]), "initWithSentences:joinedWithString:", v3, CFSTR(" "));
  v5 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Created disambiguableResult (from Online Engine): %{public}@", (uint8_t *)&v9, 0xCu);
  }
LABEL_11:

  return v4;
}

+ (id)_resultWithSentence:()Daemon
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "_resultWithSentences:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)resultFromFTSpeechResponse:()Daemon sourceText:censorSpeech:
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF63C8], "sentenceFromFTSpeechResponse:sourceText:censorSpeech:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_resultWithSentence:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)resultFromOspreyResponse:()Daemon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF63C8], "sentenceFromOspreyResponse:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_resultWithSentence:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)resultFromOspreyBatchResponse:()Daemon sourceText:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "translated_sentences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_ltCompactMap:", &__block_literal_global_5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_msgSend(v8, "count");
    if (v10 == objc_msgSend(v9, "count"))
    {
LABEL_10:
      objc_msgSend(a1, "_resultWithSentences:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v11 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      *(_DWORD *)buf = 134218240;
      v28 = objc_msgSend(v9, "count");
      v29 = 2048;
      v30 = objc_msgSend(v8, "count");
        buf,
        0x16u);

    }
  }
  else
  {
    v13 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
        buf,
        2u);
    }
  }
  objc_msgSend(v6, "translated_text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && objc_msgSend(v14, "length"))
  {
    v15 = objc_alloc(MEMORY[0x24BDF63D8]);
    objc_msgSend(v6, "translated_text_romanized");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithText:links:romanization:", v14, MEMORY[0x24BDBD1A8], v16);

    v18 = objc_alloc(MEMORY[0x24BDF63C8]);
    v26 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithSourceText:targetPhrases:selectedPhraseIndex:", v7, v19, 0);

    v25 = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v21 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v21;
    goto LABEL_10;
  }
  v23 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    +[_LTDisambiguableResult(Daemon) resultFromOspreyBatchResponse:sourceText:].cold.1(v23, v7, v14);

  v22 = 0;
LABEL_14:

  return v22;
}

+ (void)resultFromOspreyBatchResponse:()Daemon sourceText:.cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 134218240;
  v7 = objc_msgSend(a2, "length");
  v8 = 2048;
  v9 = objc_msgSend(a3, "length");
  _os_log_error_impl(&dword_2491B9000, v5, OS_LOG_TYPE_ERROR, "Unable to create _LTDisambiguableResult from batch response since provided source or target text is empty; sourceTex"
    "t length: %zu; targetText length: %zu",
    (uint8_t *)&v6,
    0x16u);

}

@end

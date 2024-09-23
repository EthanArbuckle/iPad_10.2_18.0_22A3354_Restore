@implementation _LTDisambiguableSentence(Daemon)

+ (id)_sentenceWithSourceString:()Daemon targetPhrases:expectedNumberOfPhrases:
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x24BDF63C0], "isGenderDisambiguationEnabled") & 1) == 0)
  {
    v11 = _LTOSLogDisambiguation();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_15:
      v10 = 0;
      goto LABEL_16;
    }
    LOWORD(v17) = 0;
    v12 = "Not creating disambiguation sentence because the feature flag is off";
LABEL_8:
    _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 2u);
    goto LABEL_15;
  }
  if (!v8)
  {
    v13 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[_LTDisambiguableSentence(Daemon) _sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:].cold.1();
    goto LABEL_15;
  }
  if (objc_msgSend(v9, "count") != a5)
  {
    v14 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v17 = 134218240;
      v18 = objc_msgSend(v9, "count");
      v19 = 2048;
      v20 = a5;
      _os_log_impl(&dword_2491B9000, v15, OS_LOG_TYPE_INFO, "Not creating disambiguation sentence because only %zu out of %zu candidates could create disambiguation nodes", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_15;
  }
  if (!a5)
  {
    v11 = _LTOSLogDisambiguation();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    LOWORD(v17) = 0;
    v12 = "Not creating a disambiguation sentence as there are no phrases to construct a sentence from";
    goto LABEL_8;
  }
  v10 = (void *)objc_msgSend([a1 alloc], "initWithSourceText:targetPhrases:selectedPhraseIndex:", v8, v9, 0);
LABEL_16:

  return v10;
}

+ (id)sentenceFromFTSpeechResponse:()Daemon sourceText:censorSpeech:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "is_final") & 1) != 0)
  {
    objc_msgSend(v8, "n_best_translated_phrases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __89___LTDisambiguableSentence_Daemon__sentenceFromFTSpeechResponse_sourceText_censorSpeech___block_invoke;
    v16[3] = &unk_251A11B30;
    v17 = v8;
    v11 = v9;
    v18 = v11;
    v19 = a5;
    objc_msgSend(v10, "_ltCompactMap:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:", v11, v12, objc_msgSend(v10, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[_LTDisambiguableSentence(Daemon) sentenceFromFTSpeechResponse:sourceText:censorSpeech:].cold.1();
    v13 = 0;
  }

  return v13;
}

+ (id)sentenceFromOspreyResponse:()Daemon
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "n_best_translated_phrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engine_input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __63___LTDisambiguableSentence_Daemon__sentenceFromOspreyResponse___block_invoke;
    v15 = &unk_251A11B58;
    v16 = v4;
    v7 = v6;
    v17 = v7;
    objc_msgSend(v5, "_ltCompactMap:", &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:", v7, v8, objc_msgSend(v5, "count", v12, v13, v14, v15));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_LTDisambiguableSentence(Daemon) _sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (id)sentenceFromOspreyBatchSentence:()Daemon
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "engine_input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "n_best_choices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __68___LTDisambiguableSentence_Daemon__sentenceFromOspreyBatchSentence___block_invoke;
    v15 = &unk_251A11B80;
    v16 = v4;
    v7 = v5;
    v17 = v7;
    objc_msgSend(v6, "_ltCompactMap:", &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_sentenceWithSourceString:targetPhrases:expectedNumberOfPhrases:", v7, v8, objc_msgSend(v6, "count", v12, v13, v14, v15));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_LTDisambiguableSentence(Daemon) sentenceFromOspreyBatchSentence:].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (void)_sentenceWithSourceString:()Daemon targetPhrases:expectedNumberOfPhrases:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to create disambiguable sentence from speech response because the source string is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)sentenceFromFTSpeechResponse:()Daemon sourceText:censorSpeech:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2491B9000, v0, OS_LOG_TYPE_DEBUG, "Not creating disambiguable sentence because speech response isn't final", v1, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)sentenceFromOspreyBatchSentence:()Daemon .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to create disambiguable sentence from speech response because the source text is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end

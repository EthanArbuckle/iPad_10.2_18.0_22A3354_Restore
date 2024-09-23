@implementation _LTDisambiguationNode(Daemon)

+ (id)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_msgSend(MEMORY[0x24BDF63C0], "isGenderDisambiguationEnabled") & 1) == 0)
  {
    v25 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      v26 = "Not attempting to parse disambiguation objects because the feature flag is disabled";
LABEL_22:
      _os_log_impl(&dword_2491B9000, v25, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v30, 2u);
    }
LABEL_23:
    v28 = 0;
    goto LABEL_24;
  }
  if (!a5)
  {
    v12 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LTDisambiguationNode(Daemon) _nodeWithText:links:numberOfSelectionSpans:romanization:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
      if (v9)
        goto LABEL_5;
LABEL_20:
      v25 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        v26 = "Got nil translation phrase source text; won't create _LTDisambiguationNode";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
  }
  if (!v9)
    goto LABEL_20;
LABEL_5:
  if (objc_msgSend(v10, "count") != a5)
  {
    v20 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      v30 = 134218240;
      v31 = objc_msgSend(v10, "count");
      v32 = 2048;
      v33 = a5;
      _os_log_impl(&dword_2491B9000, v21, OS_LOG_TYPE_INFO, "Only %zu out of %zu link configurations were valid; not adding any links to this disambiguable node",
        (uint8_t *)&v30,
        0x16u);

    }
    v10 = (id)MEMORY[0x24BDBD1A8];
  }
  v22 = v11;
  v23 = v22;
  if (v22 && !objc_msgSend(v22, "length"))
  {

    v27 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      +[_LTDisambiguationNode(Daemon) _nodeWithText:links:numberOfSelectionSpans:romanization:].cold.2(v27);
    v23 = 0;
  }
  else
  {
    v24 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[_LTDisambiguationNode(Daemon) _nodeWithText:links:numberOfSelectionSpans:romanization:].cold.1((uint64_t)v23, v24);
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63D8]), "initWithText:links:romanization:", v9, v10, v23);

LABEL_24:
  return v28;
}

+ (id)nodeFromEMTResult:()Daemon sourceText:romanization:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "alternativeSelectionSpans");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tokens");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_ltCompactMap:", &__block_literal_global_7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __75___LTDisambiguationNode_Daemon__nodeFromEMTResult_sourceText_romanization___block_invoke_2;
    v30 = &unk_251A11C50;
    v31 = v9;
    v32 = v14;
    v15 = v14;
    objc_msgSend(v11, "_ltCompactMap:", &v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v15, v16, objc_msgSend(v11, "count", v27, v28, v29, v30), v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[_LTDisambiguationNode(Daemon) nodeFromEMTResult:sourceText:romanization:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    v17 = 0;
  }

  return v17;
}

+ (uint64_t)nodeWithText:()Daemon romanization:
{
  return objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", a3, MEMORY[0x24BDBD1A8], 0, a4);
}

+ (id)nodeFromFTSpeechTranslationPhrase:()Daemon descriptions:sourceText:censorSpeech:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[16];

  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v12, "meta_info_data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selection_spans");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "translation_phrase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "meta_info_data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "romanization");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6 && objc_msgSend(MEMORY[0x24BDF6478], "stringContainsRedaction:", v15))
  {
    v18 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v18, OS_LOG_TYPE_DEFAULT, "Removing all potential links from node because the target string appears to have redactions, and we don't currently support redactions and disambiguation in the same sentence", buf, 2u);
    }
    objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v15, MEMORY[0x24BDBD1A8], 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __104___LTDisambiguationNode_Daemon__nodeFromFTSpeechTranslationPhrase_descriptions_sourceText_censorSpeech___block_invoke;
    v23[3] = &unk_251A11C78;
    v24 = v10;
    v25 = v11;
    v20 = v15;
    v26 = v20;
    objc_msgSend(v14, "_ltCompactMap:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v20, v21, objc_msgSend(v14, "count"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

+ (id)nodeFromFTTranslationPhrase:()Daemon descriptions:sourceText:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "meta_info_data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selection_spans");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lt_formattedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __85___LTDisambiguationNode_Daemon__nodeFromFTTranslationPhrase_descriptions_sourceText___block_invoke;
  v22[3] = &unk_251A11C78;
  v23 = v8;
  v24 = v9;
  v25 = v13;
  v14 = v13;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v12, "_ltCompactMap:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "meta_info_data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "romanization");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v14, v17, objc_msgSend(v12, "count"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)nodeFromOspreyBatchPhrase:()Daemon descriptions:sourceText:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "meta_info_data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selection_spans");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "translation_phrase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __83___LTDisambiguationNode_Daemon__nodeFromOspreyBatchPhrase_descriptions_sourceText___block_invoke;
  v22[3] = &unk_251A11C78;
  v23 = v8;
  v24 = v9;
  v25 = v13;
  v14 = v13;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v12, "_ltCompactMap:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "meta_info_data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "romanization");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_nodeWithText:links:numberOfSelectionSpans:romanization:", v14, v17, objc_msgSend(v12, "count"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (void)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138739971;
  v3 = a1;
  _os_log_debug_impl(&dword_2491B9000, a2, OS_LOG_TYPE_DEBUG, "Setting romanization from meta_info_data: %{sensitive}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Phrase has no meta_info_data romanization", v1, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)_nodeWithText:()Daemon links:numberOfSelectionSpans:romanization:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Phrase result has nil metadata for link configurations, meaning it likely isn't part of a disambiguable result; allo"
    "wing this to be a node, but this could represent an error in the translation engine",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_0();
}

+ (void)nodeFromEMTResult:()Daemon sourceText:romanization:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2491B9000, a1, a3, "Can't create disambiguation info because the version of EmbeddedAcousticRecognition on the system is too old", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

@end

@implementation _LTTranslationCandidate(Daemon)

- (void)initWithFormattedString:()Daemon sanitizedFormattedString:confidence:lowConfidence:romanization:tokens:preToPostITN:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  objc_super v25;

  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v25.receiver = a1;
  v25.super_class = (Class)&off_257886130;
  v21 = objc_msgSendSuper2(&v25, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "setFormattedString:", v16);
    objc_msgSend(v22, "setSanitizedFormattedString:", v17);
    objc_msgSend(v22, "setConfidence:", a2);
    objc_msgSend(v22, "setLowConfidence:", a6);
    objc_msgSend(v22, "setPreToPostITN:", v20);
    objc_msgSend(v22, "setTokens:", v19);
    objc_msgSend(v22, "setRomanization:", v18);
    v23 = v22;
  }

  return v22;
}

- (void)updateWithEngineMeta:()Daemon locale:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint8_t v29[8];
  id v30;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v30;
    v11 = _LTOSLogTranslationEngine();
    v12 = v11;
    if (!v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_LTTranslationCandidate(Daemon) updateWithEngineMeta:locale:].cold.1((uint64_t)v10, v12);
      goto LABEL_26;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_LTTranslationCandidate(Daemon) updateWithEngineMeta:locale:].cold.3((uint64_t)v9, v12, v13);
    objc_msgSend(MEMORY[0x24BDF64C0], "statisticsWithEngineMeta:locale:", v9, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setStatistics:", v14);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("DisambiguationEnabled"));

    if ((v16 & 1) == 0)
    {
      v19 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_2491B9000, v19, OS_LOG_TYPE_INFO, "Skipping loading sense data from meta because it's disabled in user defaults", v29, 2u);
      }
      objc_msgSend(a1, "setSenses:", 0);
      goto LABEL_26;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("senses"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDF64B0], "sensesFromArray:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("phrasebook_exact"));

      if (!v21)
      {
LABEL_16:
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gender_alternatives"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(MEMORY[0x24BDF6498], "genderAlternativesFromDictionary:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setGenderAlternatives:", v24);

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("romanization"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "sanitizedFormattedString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26 && v25 && objc_msgSend(v25, "length"))
        {
          objc_msgSend(a1, "romanization");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {
            objc_msgSend(a1, "setRomanization:", v25);
            v28 = _LTOSLogTranslationEngine();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[_LTTranslationCandidate(Daemon) updateWithEngineMeta:locale:].cold.2(v28, a1);
          }
        }
        else
        {

        }
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BDF64B0], "senseWithPhrasebookMatchMeta:", v9);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v18;
    objc_msgSend(a1, "setSenses:", v18);

    goto LABEL_16;
  }
LABEL_27:

}

- (void)updateWithEngineMeta:()Daemon locale:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2491B9000, a2, OS_LOG_TYPE_ERROR, "Skipping meta, failed to parse as JSON: %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateWithEngineMeta:()Daemon locale:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "romanization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138739971;
  v7 = v4;
  OUTLINED_FUNCTION_5(&dword_2491B9000, v3, v5, "Setting romanization from meta JSON string: %{sensitive}@", (uint8_t *)&v6);

}

- (void)updateWithEngineMeta:()Daemon locale:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_2491B9000, a2, a3, "Translation candidate meta: %@", (uint8_t *)&v3);
}

@end

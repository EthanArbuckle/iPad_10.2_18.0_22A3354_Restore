@implementation _LTTranslationCandidate(Osprey)

- (id)initWithOspreyPhrase:()Osprey
{
  id v4;
  id v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&off_257886130;
  v5 = objc_msgSendSuper2(&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "confidence");
    objc_msgSend(v5, "setConfidence:", v6);
    objc_msgSend(v4, "translated_tokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ltCompactMap:", &__block_literal_global_27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTokens:", v8);

    objc_msgSend(v4, "lt_formattedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattedString:", v9);

    objc_msgSend(v4, "meta_info_data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithMetaInfoData:", v10);

    v11 = v5;
  }

  return v5;
}

- (id)initWithOspreyMtResponsePhrase:()Osprey locale:censorSpeech:
{
  id v8;
  id v9;
  id v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = a1;
  v20.super_class = (Class)&off_257886130;
  v10 = objc_msgSendSuper2(&v20, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "confidence");
    objc_msgSend(v10, "setConfidence:", v11);
    objc_msgSend(v8, "translation_phrase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFormattedString:", v12);

    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDF6478];
      objc_msgSend(v10, "formattedString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v13, "stringContainsRedaction:", v14);

      if ((_DWORD)v13)
      {
        objc_msgSend(v10, "formattedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSanitizedFormattedString:", v15);

      }
    }
    objc_msgSend(v10, "setLowConfidence:", objc_msgSend(v8, "low_confidence"));
    objc_msgSend(v8, "meta_info_data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithMetaInfoData:", v16);

    objc_msgSend(v8, "meta_info");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithEngineMeta:locale:", v17, v9);

    v18 = v10;
  }

  return v10;
}

- (id)initWithOspreyMtResponsePhrase:()Osprey locale:injectingGenderTranslation:genderInjectedMetaInfo:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  float v15;
  void *v16;
  id v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = a1;
  v19.super_class = (Class)&off_257886130;
  v14 = objc_msgSendSuper2(&v19, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "confidence");
    objc_msgSend(v14, "setConfidence:", v15);
    objc_msgSend(v14, "setFormattedString:", v12);
    objc_msgSend(v14, "setLowConfidence:", objc_msgSend(v10, "low_confidence"));
    objc_msgSend(v10, "meta_info_data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateWithMetaInfoData:", v16);

    objc_msgSend(v14, "updateWithEngineMeta:locale:", v13, v11);
    v17 = v14;
  }

  return v14;
}

- (void)updateWithMetaInfoData:()Osprey
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(a1, "sanitizedFormattedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "romanization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
    {
      objc_msgSend(a1, "setRomanization:", v7);
      v8 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_LTTranslationCandidate(Osprey) updateWithMetaInfoData:].cold.2(v8, a1);
    }
    else
    {
      v9 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_LTTranslationCandidate(Osprey) updateWithMetaInfoData:].cold.1(v9);
    }

  }
}

- (void)updateWithMetaInfoData:()Osprey .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Phrase has no meta_info_data romanization", v1, 2u);
}

- (void)updateWithMetaInfoData:()Osprey .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "romanization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138739971;
  v6 = v4;
  _os_log_debug_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEBUG, "Setting romanization from meta_info_data: %{sensitive}@", (uint8_t *)&v5, 0xCu);

}

@end

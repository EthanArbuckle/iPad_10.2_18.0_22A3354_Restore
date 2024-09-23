@implementation _LTUnvalidatedEdgeInfo(Daemon)

+ (id)unvalidatedEdgeWithEMTAlternative:()Daemon
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "alternativeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "alternativeType");
    if (v6 == 1)
    {
      objc_msgSend(v5, "meaningDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (v10)
      {
        objc_msgSend(v10, "definition");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(a1, "meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:", objc_msgSend(v4, "translationPhraseIndex"), objc_msgSend(v4, "selectionSpanIndex"), v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:].cold.3();
          v8 = 0;
        }

        goto LABEL_22;
      }
      v13 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:].cold.2();
    }
    else
    {
      if (v6)
      {
        v8 = 0;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v5, "genderDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(a1, "genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:", objc_msgSend(v4, "translationPhraseIndex"), objc_msgSend(v4, "selectionSpanIndex"), objc_msgSend(v7, "gender") != 0, objc_msgSend(v7, "defaultGender") != 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
      v12 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:].cold.1();
    }
    v8 = 0;
    goto LABEL_22;
  }
  v9 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithEMTAlternative:].cold.4();
  v8 = 0;
LABEL_24:

  return v8;
}

+ (id)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  v8 = (int)objc_msgSend(v6, "alternative_description_index");
  if (objc_msgSend(v7, "count") > v8)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "alternative_type");
    if (v10)
    {
      if (v10 != 1)
      {
        v14 = 0;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v9, "meaning_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "definition");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(a1, "meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:", (int)objc_msgSend(v6, "translation_phrase_index"), (int)objc_msgSend(v6, "selection_span_index"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:].cold.2();
          v14 = 0;
        }

        goto LABEL_22;
      }
      v16 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:].cold.1();
    }
    else
    {
      objc_msgSend(v9, "gender_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(a1, "genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:", (int)objc_msgSend(v6, "translation_phrase_index"), (int)objc_msgSend(v6, "selection_span_index"), objc_msgSend(v12, "gender") != 0, objc_msgSend(v12, "default_gender") != 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
      v17 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:].cold.3();
    }
    v14 = 0;
    goto LABEL_22;
  }
  v15 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    +[_LTUnvalidatedEdgeInfo(Daemon) unvalidatedEdgeWithFTAlternative:descriptions:].cold.4(v15, v7, v8);
  v14 = 0;
LABEL_24:

  return v14;
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_9(&dword_2491B9000, v0, v1, "Got unexpected EMT Alternative Description where type is gender but there's no gender description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_9(&dword_2491B9000, v0, v1, "Got unexpected EMT Alternative Description where type is meaning but there's no meaning description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Can't create edge from EMTMeaningDescription since the definition is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)unvalidatedEdgeWithEMTAlternative:()Daemon .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Can't create disambiguation info because the version of EmbeddedAcousticRecognition on the system is too old", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_9(&dword_2491B9000, v0, v1, "Got unexpected FT Alternative Description where type is meaning but there's no meaning description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Can't create edge from FTMTAlternativeDescription since the definition is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_9(&dword_2491B9000, v0, v1, "Got unexpected FT Alternative Description where type is gender but there's no gender description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)unvalidatedEdgeWithFTAlternative:()Daemon descriptions:.cold.4(void *a1, void *a2, uint64_t a3)
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
  v7 = a3;
  v8 = 2048;
  v9 = objc_msgSend(a2, "count");
  _os_log_fault_impl(&dword_2491B9000, v5, OS_LOG_TYPE_FAULT, "Can't create unvalidated edge info from FTAlternative because description index %zu doesn't exist; descriptions has %zu items",
    (uint8_t *)&v6,
    0x16u);

}

@end

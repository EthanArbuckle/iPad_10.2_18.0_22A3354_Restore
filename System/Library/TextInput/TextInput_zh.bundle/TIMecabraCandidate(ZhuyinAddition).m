@implementation TIMecabraCandidate(ZhuyinAddition)

- (uint64_t)hasUnsupportedReading
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;

  objc_msgSend(a1, "mecabraCandidatePointerValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsignedLongLongValue");

  v3 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
  if (objc_msgSend(v3, "count"))
  {
    MecabraCandidateGetDictionaryReading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "input");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", v4);

      if (!v6)
      {
LABEL_9:
        v13 = 1;
LABEL_14:

        goto LABEL_15;
      }
    }
    objc_msgSend(a1, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v8);
    v11 = v10;

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (TICanLogMessageAtLevel())
      {
        TIOSLogFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[TIMecabraCandidate(ZhuyinAddition) hasUnsupportedReading].cold.2(a1, v9, v11, v12);

      }
      goto LABEL_9;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v13 = 0;
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[TIMecabraCandidate(ZhuyinAddition) hasUnsupportedReading].cold.1(v4);
    goto LABEL_13;
  }
LABEL_15:

  return v13;
}

- (BOOL)containPunctuationOnly
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (TIStringContainsCharacterFromSet(v4, (uint64_t)v3))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = !TIStringContainsCharacterFromSet(v6, (uint64_t)v3);

  }
  return v5;
}

- (void)hasUnsupportedReading
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "input");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%s Due to incorrect segmentation on reading '%@', '%@' becomes '%@'"), "-[TIMecabraCandidate(ZhuyinAddition) hasUnsupportedReading]", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 138412290;
  v16 = v13;
  OUTLINED_FUNCTION_0_0(&dword_23235B000, a4, v14, "%@", (uint8_t *)&v15);

}

@end

@implementation _LTSpeechRecognitionResult(Daemon)

- (void)initWithPackage:()Daemon locale:modelVersion:isFinal:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33.receiver = a1;
  v33.super_class = (Class)&off_257884F18;
  v13 = objc_msgSendSuper2(&v33, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setLocale:", v11);
    objc_msgSend(v14, "setFinal:", a6);
    objc_msgSend(v14, "setStable:", 1);
    objc_msgSend(v14, "setModelVersion:", v12);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranscriptions:", v15);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v10, "nBestResults", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v14, "_transcriptionWithResult:locale:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20), v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v18);
    }

    v22 = _LTPreferencesOfflineASRWordLevelConfidenceThreshold(v11, v12);
    v23 = _LTOSLogSpeech();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[_LTSpeechRecognitionResult(Daemon) initWithPackage:locale:modelVersion:isFinal:].cold.1(v23, v11, v22);
    v24 = objc_alloc(MEMORY[0x24BDF6450]);
    objc_msgSend(v10, "recognition");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithRecognition:wordConfidenceThreshold:", v25, v22);
    objc_msgSend(v14, "setBestRecognitionAlternatives:", v26);

    v27 = v14;
  }

  return v14;
}

- (void)initWithResult:()Daemon locale:modelVersion:isFinal:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = a1;
  v19.super_class = (Class)&off_257884F18;
  v13 = objc_msgSendSuper2(&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setLocale:", v11);
    objc_msgSend(v14, "setFinal:", a6);
    objc_msgSend(v14, "setStable:", 1);
    objc_msgSend(v14, "setModelVersion:", v12);
    objc_msgSend(v14, "_transcriptionWithResult:locale:", v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranscriptions:", v16);

    v17 = v14;
  }

  return v14;
}

- (void)initEmptyResultWithLocale:()Daemon isFinal:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&off_257884F18;
  v7 = objc_msgSendSuper2(&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setFinal:", a4);
    objc_msgSend(v8, "setStable:", 1);
    objc_msgSend(v8, "setLocale:", v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6460]), "initWithFormattedString:locale:confidence:minConfidence:maxConfidence:", &stru_251A15610, v6, 0.0, 0.0, 0.0);
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranscriptions:", v10);

    v11 = v8;
  }

  return v8;
}

+ (id)resultWithPackage:()Daemon locale:modelVersion:isFinal:
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([a1 alloc], "initWithPackage:locale:modelVersion:isFinal:", v12, v11, v10, a6);

  return v13;
}

+ (id)resultWithResult:()Daemon locale:modelVersion:isFinal:
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([a1 alloc], "initWithResult:locale:modelVersion:isFinal:", v12, v11, v10, a6);

  return v13;
}

+ (id)emptyResultWithLocale:()Daemon isFinal:
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend([a1 alloc], "initEmptyResultWithLocale:isFinal:", v6, a4);

  return v7;
}

- (id)_transcriptionWithResult:()Daemon locale:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v5, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    v12 = 0.0;
    v13 = 1000.0;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v16, "confidence");
        v18 = v17;
        objc_msgSend(v16, "confidence");
        if (v13 >= v19)
          v13 = v19;
        objc_msgSend(v16, "confidence");
        if (v12 < v20)
          v12 = v20;
        objc_msgSend(v16, "tokenName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v21);

        if (objc_msgSend(v16, "hasSpaceAfter"))
          objc_msgSend(v7, "appendString:", CFSTR(" "));
        v14 = v14 + v18;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
    v13 = 1000.0;
    v14 = 0.0;
  }

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isFinal"))
  {
    objc_msgSend(v5, "tokens");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      objc_msgSend(v5, "tokens");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v14 / (double)(unint64_t)objc_msgSend(v26, "count");

    }
    else
    {
      v12 = 0.0;
      v13 = 0.0;
      v27 = 0.0;
    }
  }
  else
  {
    objc_msgSend(v5, "confidence");
    v27 = v28;
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6460]), "initWithFormattedString:locale:confidence:minConfidence:maxConfidence:", v23, v6, v27, v13, v12);

  return v29;
}

- (void)initWithPackage:()Daemon locale:modelVersion:isFinal:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a3;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_2491B9000, v5, OS_LOG_TYPE_DEBUG, "Sausage conf %zd for locale %{public}@", (uint8_t *)&v7, 0x16u);

}

@end

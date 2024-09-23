@implementation LTSpeechRecognitionSausage

id __83___LTSpeechRecognitionSausage_Daemon__initWithRecognition_wordConfidenceThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "confidence", (_QWORD)v21);
        v13 = v12;
        v14 = objc_msgSend(v5, "count");
        if (objc_msgSend(v11, "hasSpaceBefore"))
          objc_msgSend(v4, "appendString:", CFSTR(" "));
        objc_msgSend(v11, "tokenName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v15);

        if (objc_msgSend(v11, "hasSpaceAfter"))
          objc_msgSend(v4, "appendString:", CFSTR(" "));
        v9 = v9 + v13 / (double)v14;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x24BDF6458]);
  objc_msgSend(v18, "setText:", v17);
  objc_msgSend(v18, "setConfidence:", (uint64_t)v9);
  objc_msgSend(v18, "setLowConfidence:", v9 < (double)*(uint64_t *)(a1 + 32));
  objc_msgSend(v5, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHasSpaceAfter:", objc_msgSend(v19, "hasSpaceAfter"));

  return v18;
}

id __83___LTSpeechRecognitionSausage_Daemon__initWithRecognition_wordConfidenceThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "alternatives");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("confidence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __76___LTSpeechRecognitionSausage_Osprey__initWithOspreySausage_choices_locale___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v2, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "confidence");
        objc_msgSend(v2, "tokens");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        objc_msgSend(v10, "token_text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v14);

        if (objc_msgSend(v10, "add_space_after"))
          objc_msgSend(v3, "appendString:", CFSTR(" "));
        v8 = v8 + (double)(v11 / v13);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x24BDF6458]);
  objc_msgSend(v17, "setText:", v16);
  objc_msgSend(v17, "setConfidence:", (uint64_t)v8);
  objc_msgSend(v17, "setLowConfidence:", v8 < (double)_LTPreferencesServerASRWordLevelConfidenceThreshold(*(void **)(a1 + 32)));
  objc_msgSend(v2, "tokens");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHasSpaceAfter:", objc_msgSend(v19, "add_space_after"));

  return v17;
}

id __76___LTSpeechRecognitionSausage_Osprey__initWithOspreySausage_choices_locale___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "alternatives");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("confidence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

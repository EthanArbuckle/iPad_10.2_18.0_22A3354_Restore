@implementation _LTLanguageDetectionResult(Daemon)

- (id)initWithConfidences:()Daemon isConfident:dominantLanguage:isFinal:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
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
  v11 = a5;
  v33.receiver = a1;
  v33.super_class = (Class)&off_257884440;
  v12 = objc_msgSendSuper2(&v33, sel_init);
  if (v12)
  {
    v13 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v12, "setConfidences:", v13);

    objc_msgSend(v12, "setIsConfident:", a4);
    objc_msgSend(v12, "setDominantLanguage:", v11);
    objc_msgSend(v12, "setIsFinal:", a6);
    objc_msgSend(v12, "dominantLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v10, "allKeys", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v30;
        v20 = 0.0;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v15);
            v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "doubleValue");
            v25 = v24;

            if (v25 > v20)
            {
              v26 = v22;

              v18 = v26;
              v20 = v25;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }

      objc_msgSend(v12, "setDominantLanguage:", v18);
    }
    v27 = v12;
  }

  return v12;
}

@end

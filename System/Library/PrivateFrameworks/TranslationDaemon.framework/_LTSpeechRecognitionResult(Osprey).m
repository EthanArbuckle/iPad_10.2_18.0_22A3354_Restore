@implementation _LTSpeechRecognitionResult(Osprey)

- (void)initWithOspreyResponse:()Osprey confidenceThreshold:isSanitized:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t i;
  void *v29;
  void *v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v44.receiver = a1;
  v44.super_class = (Class)&off_257884F18;
  v9 = objc_msgSendSuper2(&v44, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setFinal:", 1);
    objc_msgSend(v10, "setStable:", 1);
    v11 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v8, "source_locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeWithLocaleIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v13);

    objc_msgSend(v10, "setModelVersion:", 0);
    objc_msgSend(v8, "recognition_result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "post_itn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recognition_text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsString:", CFSTR("*"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 && v17)
    {
      objc_msgSend(v14, "post_itn_nbest_choices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6460]), "initWithRecognitionChoice:inSausage:", v20, v15);
        objc_msgSend(v10, "locale");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLocale:", v22);

        objc_msgSend(v21, "confidence");
        objc_msgSend(v21, "setLowConfidence:", v23 <= (double)a4);
        objc_msgSend(v21, "setSanitizedFormattedString:", v16);
        objc_msgSend(v18, "addObject:", v21);

      }
    }
    else
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v14, "post_itn_nbest_choices");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v24)
      {
        v25 = v24;
        v38 = v16;
        v39 = v8;
        v26 = *(_QWORD *)v41;
        v27 = (double)a4;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v41 != v26)
              objc_enumerationMutation(v20);
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6460]), "initWithRecognitionChoice:inSausage:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), v15);
            objc_msgSend(v10, "locale");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setLocale:", v30);

            objc_msgSend(v29, "confidence");
            objc_msgSend(v29, "setLowConfidence:", v31 <= v27);
            objc_msgSend(v18, "addObject:", v29);

          }
          v25 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v25);
        v8 = v39;
        v16 = v38;
      }
    }

    objc_msgSend(v10, "setTranscriptions:", v18);
    v32 = objc_alloc(MEMORY[0x24BDF6450]);
    objc_msgSend(v14, "post_itn_nbest_choices");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locale");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v32, "initWithOspreySausage:choices:locale:", v15, v33, v34);
    objc_msgSend(v10, "setBestRecognitionAlternatives:", v35);

    v36 = v10;
  }

  return v10;
}

- (void)initWithOspreyPartialRecognitionResponse:()Osprey isSanitized:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20.receiver = a1;
  v20.super_class = (Class)&off_257884F18;
  v7 = objc_msgSendSuper2(&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setFinal:", 0);
    objc_msgSend(v8, "setStable:", objc_msgSend(v6, "is_stable_result"));
    v9 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v6, "source_locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeWithLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setLocale:", v11);
    objc_msgSend(v8, "setModelVersion:", 0);
    v12 = objc_alloc_init(MEMORY[0x24BDF6460]);
    objc_msgSend(v12, "setLocale:", v11);
    objc_msgSend(v6, "recognition_text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFormattedString:", v13);

    if (a4)
    {
      objc_msgSend(v12, "formattedString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsString:", CFSTR("*"));

      if (v15)
      {
        objc_msgSend(v12, "formattedString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSanitizedFormattedString:", v16);

      }
    }
    objc_msgSend(v12, "setConfidence:", (double)(int)objc_msgSend(v6, "confidence"));
    objc_msgSend(v12, "setMinConfidence:", 0.0);
    objc_msgSend(v12, "setMaxConfidence:", 0.0);
    objc_msgSend(v12, "setLowConfidence:", 0);
    v21[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranscriptions:", v17);

    v18 = v8;
  }

  return v8;
}

@end

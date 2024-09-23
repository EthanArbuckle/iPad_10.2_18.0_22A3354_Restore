@implementation _LTSpeechTranscription(Osprey)

- (void)initWithRecognitionChoice:()Osprey inSausage:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  int v32;
  int v33;
  double v34;
  double v35;
  double v36;
  id v37;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v46.receiver = a1;
  v46.super_class = (Class)&off_2578855F0;
  v8 = objc_msgSendSuper2(&v46, sel_init);
  v9 = v8;
  if (v8)
  {
    v39 = v8;
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alternative_index");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = 0;
      v13 = 0.0;
      v14 = 1000.0;
      v40 = v7;
      v41 = v6;
      while (1)
      {
        objc_msgSend(v7, "positional_tok_phrase_alt");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v12 >= v16)
          break;
        objc_msgSend(v7, "positional_tok_phrase_alt");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "alternative_index");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "unsignedIntegerValue");

        objc_msgSend(v18, "tok_phrases");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "tokens");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v43 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v30, "token_text");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "appendString:", v31);

              if (objc_msgSend(v30, "add_space_after"))
                objc_msgSend(v10, "appendString:", CFSTR(" "));
              v32 = objc_msgSend(v30, "confidence");
              if (v14 >= (double)v32)
                v14 = (double)v32;
              v33 = objc_msgSend(v30, "confidence");
              if (v13 < (double)v33)
                v13 = (double)v33;
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          }
          while (v27);
        }

        ++v12;
        v6 = v41;
        objc_msgSend(v41, "alternative_index");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v40;
        if (v12 >= objc_msgSend(v11, "count"))
          goto LABEL_21;
      }
    }
    else
    {
      v13 = 0.0;
      v14 = 1000.0;
LABEL_21:

    }
    v9 = v39;
    objc_msgSend(v39, "setConfidence:", (double)(int)objc_msgSend(v6, "confidence"));
    objc_msgSend(v39, "setMinConfidence:", v14);
    objc_msgSend(v39, "setMaxConfidence:", v13);
    objc_msgSend(v39, "setFormattedString:", v10);
    objc_msgSend(v39, "minConfidence");
    v35 = v34;
    objc_msgSend(v39, "maxConfidence");
    if (v35 > v36)
    {
      objc_msgSend(v39, "confidence");
      objc_msgSend(v39, "setMinConfidence:");
      objc_msgSend(v39, "confidence");
      objc_msgSend(v39, "setMaxConfidence:");
    }
    v37 = v39;

  }
  return v9;
}

@end

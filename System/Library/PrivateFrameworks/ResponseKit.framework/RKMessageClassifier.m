@implementation RKMessageClassifier

+ (void)setPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&preferredLanguages, a3);
}

+ (id)preferredLanguages
{
  return (id)preferredLanguages;
}

+ (id)messageClassification:(id)a3 withLanguageIdentifier:(id)a4
{
  return +[RKMessageClassifier messageClassification:withLanguageIdentifier:conversationTurns:](RKMessageClassifier, "messageClassification:withLanguageIdentifier:conversationTurns:", a3, a4, 0);
}

+ (id)messageClassification:(id)a3 withLanguageIdentifier:(id)a4 conversationTurns:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  int v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v52;
  id v53;
  id v54;
  id v55;
  void *context;
  id contexta;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint8_t *v66;
  _QWORD *v67;
  _QWORD v68[4];
  _QWORD v69[4];
  id v70;
  uint8_t v71[128];
  uint8_t buf[8];
  uint8_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v54 = a4;
  v53 = a5;
  v58 = v7;
  if (objc_msgSend(v7, "length"))
  {
    v55 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x212BA17B8]();
    +[RKUtilities getDeviceModel](RKUtilities, "getDeviceModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[RKUtilities isDeviceSupportedForLSTMBasedLanguageIdentification:](RKUtilities, "isDeviceSupportedForLSTMBasedLanguageIdentification:", v9);
    v11 = objc_alloc(MEMORY[0x24BDD1638]);
    v12 = *MEMORY[0x24BDD0F68];
    v13 = *MEMORY[0x24BDD0F58];
    if (v10)
    {
      v79[0] = *MEMORY[0x24BDD0F68];
      v79[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "initWithTagSchemes:options:", v14, 536870916);
    }
    else
    {
      v78[0] = *MEMORY[0x24BDD0F68];
      v78[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "initWithTagSchemes:options:", v14, 4);
    }
    v16 = (void *)v15;

    objc_msgSend(v16, "setString:", v7);
    objc_msgSend(v16, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");
    v19 = MEMORY[0x24BDAC760];
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke;
    v69[3] = &unk_24C6AFE68;
    v20 = v8;
    v70 = v20;
    objc_msgSend(v16, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v18, v12, 4, v69);

    if (+[RKUtilities isLanguageSupportedByNSLinguisticTaggerForLanguageIdentification:](RKUtilities, "isLanguageSupportedByNSLinguisticTaggerForLanguageIdentification:", v54))
    {
      v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v22 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v22, "addObject:", v7);
      *(_QWORD *)buf = 0;
      v73 = buf;
      v74 = 0x3032000000;
      v75 = __Block_byref_object_copy__5;
      v76 = __Block_byref_object_dispose__5;
      v77 = 0;
      if (objc_msgSend(v53, "count"))
      {
        objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timestamp");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)*((_QWORD *)v73 + 5);
        *((_QWORD *)v73 + 5) = v24;

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v27 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)*((_QWORD *)v73 + 5);
        *((_QWORD *)v73 + 5) = v27;
      }

      v68[0] = 0;
      v68[1] = v68;
      v68[2] = 0x2020000000;
      v68[3] = 0;
      v63[0] = v19;
      v63[1] = 3221225472;
      v63[2] = __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke_2;
      v63[3] = &unk_24C6AFE90;
      v66 = buf;
      v67 = v68;
      v28 = v22;
      v64 = v28;
      v29 = v21;
      v65 = v29;
      objc_msgSend(v53, "enumerateObjectsWithOptions:usingBlock:", 0, v63);
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR(" "));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v7, "length");
      if ((objc_msgSend(v7, "isEqualToString:", &stru_24C6B9E08) & 1) != 0)
      {
        v26 = CFSTR("und");
      }
      else
      {
        objc_msgSend(v16, "languageOfRange:withAdditionalContext:withPreferredLanguages:", 0, v31, v30, preferredLanguages);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      _Block_object_dispose(v68, 8);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v26 = CFSTR("und");
    }

    objc_autoreleasePoolPop(context);
    v32 = v26;
    v52 = v32;
    if (v32)
    {
      if ((-[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("und")) & 1) != 0
        || (+[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v54), v33 = (void *)objc_claimAutoreleasedReturnValue(), v34 = -[__CFString isEqualToString:](v52, "isEqualToString:", v33), v33, v35 = v52, v34))
      {
        v35 = (__CFString *)v54;

      }
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    contexta = v20;
    v37 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v60 != v38)
            objc_enumerationMutation(contexta);
          v40 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "rangeValue");
          objc_msgSend(v58, "substringWithRange:", v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v35);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            +[RKSentenceClassifier preProcessTextMessageForLinguisticTagger:withLocale:](RKSentenceClassifier, "preProcessTextMessageForLinguisticTagger:withLocale:", v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            +[RKSentenceClassifier sentenceClassification:withLanguageIdentifier:options:](RKSentenceClassifier, "sentenceClassification:withLanguageIdentifier:options:", v44, v35, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v45);

          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            +[RKMessageClassifier messageClassification:withLanguageIdentifier:conversationTurns:].cold.2(buf, (uint64_t)v58, &buf[4]);
          }

        }
        v37 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      }
      while (v37);
    }

    objc_msgSend(v36, "sortedArrayUsingComparator:", &__block_literal_global_10);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "count"))
    {
      objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
      v47 = objc_claimAutoreleasedReturnValue();

      v55 = (id)v47;
    }
    objc_msgSend(v36, "valueForKeyPath:", CFSTR("@unionOfObjects.taggedText"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "componentsJoinedByString:", CFSTR(" "));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTaggedText:", v49);

    objc_msgSend(v36, "valueForKeyPath:", CFSTR("@max.isSensitive"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setSensitive:", objc_msgSend(v50, "BOOLValue"));

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      +[RKMessageClassifier messageClassification:withLanguageIdentifier:conversationTurns:].cold.1();
    v55 = 0;
  }

  return v55;
}

void __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v7;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(v21, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = (unint64_t)v8;

  objc_msgSend(v21, "timestamp");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (v9 <= 0x12C && *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) < 0x33uLL)
  {
    objc_msgSend(v21, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v15 = (void *)a1[4];
      objc_msgSend(v21, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v15, "containsObject:", v16);

      v13 = v21;
      if ((v15 & 1) != 0)
        goto LABEL_5;
      v17 = (void *)a1[5];
      objc_msgSend(v21, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

      v19 = (void *)a1[4];
      objc_msgSend(v21, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

      objc_msgSend(v21, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v14, "length");
    }

  }
  else
  {
    *a4 = 1;
  }
  v13 = v21;
LABEL_5:

}

uint64_t __86__RKMessageClassifier_messageClassification_withLanguageIdentifier_conversationTurns___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL8 v10;

  v4 = a3;
  v5 = objc_msgSend(a2, "sentenceType");
  if (v5 > 31)
  {
    if ((unint64_t)(v5 - 32) < 3 || v5 == 36)
    {
      v6 = 2;
      goto LABEL_12;
    }
LABEL_10:
    v6 = 1;
    goto LABEL_12;
  }
  if (!v5)
  {
    v6 = 4;
    goto LABEL_12;
  }
  if (v5 != 6)
  {
    if (v5 == 31)
    {
      v6 = 3;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v6 = 0;
LABEL_12:
  v7 = objc_msgSend(v4, "sentenceType");

  if (v7 > 31)
  {
    if ((unint64_t)(v7 - 32) < 3 || v7 == 36)
    {
      v8 = 2;
      goto LABEL_23;
    }
LABEL_21:
    v8 = 1;
    goto LABEL_23;
  }
  if (!v7)
  {
    v8 = 4;
    goto LABEL_23;
  }
  if (v7 != 6)
  {
    if (v7 == 31)
    {
      v8 = 3;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  v8 = 0;
LABEL_23:
  v9 = v6 >= v8;
  v10 = v6 > v8;
  if (v9)
    return v10;
  else
    return -1;
}

+ (BOOL)questionClassification:(id)a3 withLanguageIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x212BA17B8]();
  +[RKMessageClassifier messageClassification:withLanguageIdentifier:](RKMessageClassifier, "messageClassification:withLanguageIdentifier:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[RKUtilities isLanguageSupportedBySmartPunctuation:](RKUtilities, "isLanguageSupportedBySmartPunctuation:", v9);

  if (v10
    && ((v11 = objc_msgSend(v8, "sentenceType"), (unint64_t)(v11 - 7) < 0x18) || (unint64_t)(v11 - 2) <= 2))
  {
    objc_msgSend(v8, "matchedRanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v8, "matchedRanges", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
      {
        v15 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v14);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "range"))
            {
              LOBYTE(v13) = 1;
              goto LABEL_14;
            }
          }
          v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_14:

    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v10 & v13;
}

+ (void)messageClassification:withLanguageIdentifier:conversationTurns:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "(RKMessageClassifier) Trying to classify empty text", v0, 2u);
}

+ (void)messageClassification:(uint8_t *)buf withLanguageIdentifier:(uint64_t)a2 conversationTurns:(_QWORD *)a3 .cold.2(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Sentence Ranges cannot be invalid: %@", buf, 0xCu);
}

@end

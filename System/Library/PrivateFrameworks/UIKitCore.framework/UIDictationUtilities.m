@implementation UIDictationUtilities

+ (id)tokenFromAFToken:(id)a3
{
  id v3;
  double v4;
  UIDictationScoredToken *v5;
  void *v6;
  UIDictationScoredToken *v7;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (double)objc_msgSend(v3, "confidenceScore");
    v5 = [UIDictationScoredToken alloc];
    objc_msgSend(v3, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIDictationScoredToken initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:](v5, "initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:", v6, objc_msgSend(v3, "removeSpaceBefore"), objc_msgSend(v3, "removeSpaceAfter"), v4 / 1000.0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)interpretationFromAFInterpretation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getAFSpeechInterpretationClass_softClass;
  v14 = getAFSpeechInterpretationClass_softClass;
  if (!getAFSpeechInterpretationClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getAFSpeechInterpretationClass_block_invoke;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getAFSpeechInterpretationClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "tokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "interpretationFromAFTokens:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAverageConfidenceScore:", (double)objc_msgSend(v4, "averageConfidenceScore") / 1000.0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)interpretationFromAFTokens:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  double v14;
  UIDictationInterpretation *v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = 0.0;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "tokenFromAFToken:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), (_QWORD)v24);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {

          v15 = 0;
          goto LABEL_17;
        }
        v13 = (void *)v12;
        objc_msgSend(v5, "addObject:", v12);
        objc_msgSend(v13, "confidenceScore");
        v10 = v10 + v14;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0.0;
  }

  if (objc_msgSend(v5, "count"))
  {
    v16 = (double)(unint64_t)objc_msgSend(v5, "count");
    objc_msgSend(v5, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasSuffix:", CFSTR(" "));

    if (v19)
    {
      objc_msgSend(v17, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "text");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "substringToIndex:", objc_msgSend(v21, "length") - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v22);

    }
    v10 = v10 / v16;

  }
  v15 = -[UIDictationInterpretation initWithTokens:score:]([UIDictationInterpretation alloc], "initWithTokens:score:", v5, v10);
LABEL_17:

  return v15;
}

+ (id)phraseFromAFPhrase:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UIDictationInterpretationGroup *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getAFSpeechPhraseClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "interpretations", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "interpretationFromAFInterpretation:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
          {

            v13 = 0;
            goto LABEL_13;
          }
          v12 = (void *)v11;
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    v13 = -[UIDictationInterpretationGroup initWithInterpretations:isLowConfidence:]([UIDictationInterpretationGroup alloc], "initWithInterpretations:isLowConfidence:", v5, objc_msgSend(v4, "isLowConfidence"));
LABEL_13:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)dictationPhrasesFromTokenMatrix:(id)a3
{
  id v3;
  UIDictationSerializableResults *v4;
  UIDictationSerializableResults *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__126;
  v12 = __Block_byref_object_dispose__126;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__UIDictationUtilities_dictationPhrasesFromTokenMatrix___block_invoke;
  v7[3] = &unk_1E16D5380;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v4 = [UIDictationSerializableResults alloc];
  v5 = -[UIDictationSerializableResults initWithPhrases:](v4, "initWithPhrases:", v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__UIDictationUtilities_dictationPhrasesFromTokenMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  UIDictationInterpretationGroup *v9;
  void *v10;
  UIDictationInterpretationGroup *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[UIDictationUtilities interpretationFromAFTokens:](UIDictationUtilities, "interpretationFromAFTokens:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  if (v6)
  {
    v9 = [UIDictationInterpretationGroup alloc];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIDictationInterpretationGroup initWithInterpretations:](v9, "initWithInterpretations:", v10);
    objc_msgSend(v8, "addObject:", v11);

  }
  else
  {
    *(_QWORD *)(v7 + 40) = 0;

    *a4 = 1;
  }

}

+ (id)dictationPhrasesFromPhraseArray:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  UIDictationSerializableResults *v6;
  UIDictationSerializableResults *v7;
  UIDictationSerializableResults *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v8 = objc_alloc_init(UIDictationSerializableResults);
LABEL_6:
    v7 = v8;
    goto LABEL_7;
  }
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getAFSpeechPhraseClass();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[UIDictationUtilities dictationPhrasesFromTokenMatrix:](UIDictationUtilities, "dictationPhrasesFromTokenMatrix:", v3);
    v8 = (UIDictationSerializableResults *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__126;
  v15 = __Block_byref_object_dispose__126;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__UIDictationUtilities_dictationPhrasesFromPhraseArray___block_invoke;
  v10[3] = &unk_1E16D53A8;
  v10[4] = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
  v6 = [UIDictationSerializableResults alloc];
  v7 = -[UIDictationSerializableResults initWithPhrases:](v6, "initWithPhrases:", v12[5]);
  _Block_object_dispose(&v11, 8);

LABEL_7:
  return v7;
}

void __56__UIDictationUtilities_dictationPhrasesFromPhraseArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  +[UIDictationUtilities phraseFromAFPhrase:](UIDictationUtilities, "phraseFromAFPhrase:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v6;
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
  }
  else
  {
    *a4 = 1;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

+ (id)bestInterpretationForDictationResult:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      v9 = &stru_1E16EDF20;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if (objc_msgSend(v11, "count", (_QWORD)v17))
        {
          objc_msgSend(v11, "objectAtIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v15 = v9;

            goto LABEL_20;
          }
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v9 = (__CFString *)v13;
        }
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_18;
        }
      }
      v14 = v9;
LABEL_20:

      goto LABEL_21;
    }
    v9 = &stru_1E16EDF20;
LABEL_18:

    v9 = v9;
LABEL_21:

  }
  else
  {
    v9 = &stru_1E16EDF20;
  }

  return v9;
}

+ (id)bestInterpretationForPhrases:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "indexPathOfInterpretations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIndexPathOfInterpretations:", 0);
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIndexPathOfInterpretations:", v4);

  return v5;
}

+ (id)attributedStringForDictationResult:(id)a3 andCorrectionIdentifier:(id)a4 capturePrefixAndPostfixWordCount:(unint64_t)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  BOOL v62;
  id v63;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v68 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v6, "dictationPhraseArray");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestTextForMultilingualAlternatives");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(v6, "multilingualResultsByLanguageCode");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v78 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "objectForKey:", CFSTR("text"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v15);
  }

  v72 = v13;
  v65 = v12;
  if ((objc_msgSend(v6, "showMultilingualAlternatives") & 1) != 0)
  {
    v19 = objc_msgSend(v13, "count");
    v20 = v19 != 0;
    if (objc_msgSend(v6, "lowConfidenceAboutLanguageDetection") && v19)
    {
      objc_msgSend(v6, "bestText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E1679D20, "attributedText:withAlternativeTexts:style:", v21, v12, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "appendAttributedString:", v22);
      objc_msgSend(a1, "metadataDictionaryForCorrectionIdentifier:", v68);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = a5;
LABEL_26:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "lowConfidenceAboutLanguageDetection"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v36, CFSTR("multilingualIsLowConfidence"));

      objc_msgSend(v23, "setObject:forKey:", v13, CFSTR("bestAlternatives"));
      objc_msgSend(v6, "bestText");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v37, CFSTR("bestText"));

      objc_msgSend(v23, "setObject:forKey:", v66, CFSTR("multilingualResultsForAlternateRecognitions"));
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(v6, "lowConfidenceAboutLanguageDetection");
    v20 = 0;
  }
  v62 = v20;
  v25 = v7;
  v63 = v6;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v26 = v67;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v74 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(v31, "text");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v31, "text");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "alternativeInterpretations");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(off_1E1679D20, "attributedText:withAlternativeTexts:style:", v33, v34, objc_msgSend(v31, "style"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "appendAttributedString:", v35);

          v13 = v72;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIDictationUtilities.m"), 280, CFSTR("All dictation phrases should have at least one interpretation."));
        }

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v28);
  }

  objc_msgSend(a1, "metadataDictionaryForCorrectionIdentifier:", v68);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v63;
  v24 = a5;
  v7 = v25;
  v12 = v65;
  if (v62)
    goto LABEL_26;
LABEL_27:
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "string");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("recognizedText"));

  v40 = objc_msgSend(v7, "length");
  if (objc_msgSend(v6, "addTrailingSpace"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v7, "appendAttributedString:", v41);

  }
  if (v24)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v7;
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v71 = v40;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "inputDelegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "prefixTextForInputDelegate:wordCount:", v45, v24);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "inputDelegate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "postfixTextForInputDelegate:wordCount:", v49, v24);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v43, "string");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringWithFormat:", CFSTR("%@%@%@"), v46, v52, v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setObject:forKey:", v53, CFSTR("relevantTextAfterDictationResult"));
    v54 = (void *)MEMORY[0x1E0CB3B18];
    v55 = v46;
    v56 = objc_msgSend(v46, "length");
    objc_msgSend(v43, "string");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "length");
    v59 = v56;
    v40 = v71;
    objc_msgSend(v54, "valueWithRange:", v59, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setObject:forKey:", v60, CFSTR("recognizedTextPosition"));
    v7 = v43;
    v12 = v65;

  }
  objc_msgSend(v23, "setObject:forKey:", v38, CFSTR("recognizedTextInfo"));
  objc_msgSend(v7, "addAttribute:value:range:", CFSTR("_UITextInputDictationResultMetadata"), v23, 0, v40);

  return v7;
}

+ (id)voiceCommandParameterFromAFVoiceCommandGrammarParamMatch:(id)a3
{
  id v3;
  UIDictationVoiceCommandParameter *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(UIDictationVoiceCommandParameter);
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationVoiceCommandParameter setText:](v4, "setText:", v5);
  return v4;
}

+ (id)dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paramMatches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__UIDictationUtilities_dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate___block_invoke;
  v10[3] = &unk_1E16D53D0;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __95__UIDictationUtilities_dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[UIDictationUtilities voiceCommandParameterFromAFVoiceCommandGrammarParamMatch:](UIDictationUtilities, "voiceCommandParameterFromAFVoiceCommandGrammarParamMatch:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);

}

+ (id)_unsupportedAppsForVoiceEditing
{
  if (qword_1ECD7EE40 != -1)
    dispatch_once(&qword_1ECD7EE40, &__block_literal_global_334);
  return (id)qword_1ECD7EE48;
}

void __55__UIDictationUtilities__unsupportedAppsForVoiceEditing__block_invoke()
{
  void *v0;
  char v1;
  uint64_t v2;
  void *v3;

  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "voiceCommandsInIWorkEnabled");

  if ((v1 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.Numbers"), CFSTR("com.apple.Keynote"), CFSTR("com.apple.Pages"), 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)qword_1ECD7EE48;
    qword_1ECD7EE48 = v2;

  }
}

+ (BOOL)supportsDictationVoiceEditingUIForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_unsupportedAppsForVoiceEditing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

+ (id)metadataDictionaryForCorrectionIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString **v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("correctionIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("alternativesSelectedCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("characterModificationCount"));

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("dictationUIInteractionIdentifier"));
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentInstrumentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("dictationInstrumentationContext"));
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "initialDictationLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("dictationLanguage"));
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "localSpeechRecognitionForced");
  v16 = UITextInputDictationResultSpeechRecognitionSourceLocal;
  if (!v15)
    v16 = UITextInputDictationResultSpeechRecognitionSourceServer;
  objc_msgSend(v5, "setObject:forKey:", *v16, CFSTR("speechRecognitionSource"));

  return v5;
}

+ (BOOL)needsLeadingSpaceForPhrases:(id)a3 secureInput:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a4)
    return 0;
  objc_msgSend(a3, "phrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestInterpretation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "needsLeadingSpaceForText:secureInput:", v11, 0);

  return (char)a1;
}

+ (BOOL)needsLeadingSpaceForText:(id)a3 secureInput:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  unsigned __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  unsigned __int16 v18;

  v5 = a3;
  v6 = v5;
  if (!a4)
  {
    if (objc_msgSend(v5, "length"))
      v8 = objc_msgSend(v6, "characterAtIndex:", 0);
    else
      v8 = 0;
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "_usesAsynchronousProtocol"))
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate");
      v13 = objc_msgSend(v11, "initialPreviousCharacterForAsyncDelegate");

      if ((v12 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(v10, "tokenizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectedTextRange");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "start");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v16, 3, 1);

      v18 = objc_msgSend(v10, "_characterInRelationToRangedSelection:", 0xFFFFFFFFLL);
      if ((v17 & 1) != 0)
        goto LABEL_12;
      v13 = v18;
    }
    if ((objc_msgSend(MEMORY[0x1E0DD97A8], "isCharacterSmartReplaceExempt:isPreviousCharacter:", v13, 1) & 1) == 0)
    {
      v7 = objc_msgSend(MEMORY[0x1E0DD97A8], "isCharacterSmartReplaceExempt:isPreviousCharacter:", v8, 0) ^ 1;
      goto LABEL_14;
    }
LABEL_12:
    LOBYTE(v7) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v7) = 0;
LABEL_15:

  return v7;
}

+ (void)selectionStartInfoWithBlock:(id)a3
{
  void (**v3)(id, _QWORD, uint64_t);
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void (**)(id, _QWORD, uint64_t))a3;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "_usesAsynchronousProtocol"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate");
    v7 = objc_msgSend(v5, "initialPreviousCharacterForAsyncDelegate");

  }
  else
  {
    objc_msgSend(v11, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isPosition:atBoundary:inDirection:", v10, 3, 1);

    v7 = objc_msgSend(v11, "_characterInRelationToRangedSelection:", 0xFFFFFFFFLL);
  }
  v3[2](v3, v7, v6);

}

+ (BOOL)needsLeadingSpaceForText:(id)a3 secureInput:(BOOL)a4 previousCharacter:(unsigned __int16)a5 selectionStartIsStartOfParagraph:(BOOL)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;

  v7 = a5;
  v9 = a3;
  v10 = v9;
  if (a4)
    goto LABEL_7;
  if (objc_msgSend(v9, "length"))
  {
    v11 = objc_msgSend(v10, "characterAtIndex:", 0);
    if (a6)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (a6)
      goto LABEL_7;
  }
  if ((objc_msgSend(MEMORY[0x1E0DD97A8], "isCharacterSmartReplaceExempt:isPreviousCharacter:", v7, 1) & 1) == 0)
  {
    v12 = objc_msgSend(MEMORY[0x1E0DD97A8], "isCharacterSmartReplaceExempt:isPreviousCharacter:", v11, 0) ^ 1;
    goto LABEL_8;
  }
LABEL_7:
  LOBYTE(v12) = 0;
LABEL_8:

  return v12;
}

+ (BOOL)needsTrailingSpaceForPhrases:(id)a3 secureInput:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a4)
    return 0;
  objc_msgSend(a3, "phrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestInterpretation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "needsTrailingSpaceForText:secureInput:", v11, 0);

  return (char)a1;
}

+ (BOOL)needsTrailingSpaceForText:(id)a3 secureInput:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unsigned __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    if (objc_msgSend(v5, "length"))
      v7 = objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "length") - 1);
    else
      v7 = 0;
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "_usesAsynchronousProtocol"))
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate");
      v12 = objc_msgSend(v10, "initialCharacterAfterSelectionForAsyncDelegate");

    }
    else
    {
      objc_msgSend(v9, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedTextRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "end");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "isPosition:atBoundary:inDirection:", v15, 3, 0);

      v12 = objc_msgSend(v9, "_characterInRelationToRangedSelection:", 0);
    }
    v16 = objc_msgSend(MEMORY[0x1E0DD97A8], "isCharacterSmartReplaceExempt:isPreviousCharacter:", v7, 1);
    LOBYTE(v7) = 0;
    if ((v11 & 1) == 0 && (v16 & 1) == 0)
      LODWORD(v7) = objc_msgSend(MEMORY[0x1E0DD97A8], "isCharacterSmartReplaceExempt:isPreviousCharacter:", v12, 0) ^ 1;

  }
  return v7;
}

+ (id)_properNameForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v4 = v3;
  if (qword_1ECD7EE58 == -1)
  {
    if (!v3)
      goto LABEL_14;
  }
  else
  {
    dispatch_once(&qword_1ECD7EE58, &__block_literal_global_78_1);
    if (!v4)
      goto LABEL_14;
  }
  objc_msgSend((id)qword_1ECD7EE50, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "caseInsensitiveCompare:", v4) == -1)
  {
    objc_msgSend((id)qword_1ECD7EE50, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "caseInsensitiveCompare:", v4);

    if (v7 == 1)
    {
      v8 = 0;
      v9 = objc_msgSend((id)qword_1ECD7EE50, "count") - 1;
      do
      {
        v10 = (v9 + v8) >> 1;
        objc_msgSend((id)qword_1ECD7EE50, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "caseInsensitiveCompare:", v4);
        switch(v12)
        {
          case -1:
            v8 = v10 + 1;
            break;
          case 1:
            v9 = v10 - 1;
            break;
          case 0:
            goto LABEL_15;
        }

      }
      while (v8 <= v9);
    }
  }
  else
  {

  }
LABEL_14:
  v11 = 0;
LABEL_15:

  return v11;
}

void __45__UIDictationUtilities__properNameForString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(&unk_1E1A93FB0, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7EE50;
  qword_1ECD7EE50 = v0;

}

+ (unint64_t)characterInsertionCount:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("characterInsertionCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("characterInsertionCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)characterDeletionCount:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("characterDeletionCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("characterDeletionCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)characterSubstitutionCount:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("characterSubstitutionCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("characterSubstitutionCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)updateCharacterDeletionCount:(id)a3 delta:(int)a4
{
  id v4;
  unint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  LODWORD(v5) = a4;
  v4 = a3;
  v5 = (int)v5;
  objc_msgSend(v4, "valueForKey:", CFSTR("characterDeletionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("characterDeletionCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "unsignedIntegerValue") + (int)v5;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("characterDeletionCount"));

  return v5;
}

+ (unint64_t)updateCharacterSubstitutionCount:(id)a3 delta:(int)a4
{
  id v4;
  unint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  LODWORD(v5) = a4;
  v4 = a3;
  v5 = (int)v5;
  objc_msgSend(v4, "valueForKey:", CFSTR("characterSubstitutionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("characterSubstitutionCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "unsignedIntegerValue") + (int)v5;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("characterSubstitutionCount"));

  return v5;
}

+ (unint64_t)updateCharacterInsertionCount:(id)a3 delta:(int)a4
{
  id v4;
  unint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  LODWORD(v5) = a4;
  v4 = a3;
  v5 = (int)v5;
  objc_msgSend(v4, "valueForKey:", CFSTR("characterInsertionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("characterInsertionCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "unsignedIntegerValue") + (int)v5;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("characterInsertionCount"));

  return v5;
}

+ (int64_t)updateCharacterModificationCount:(id)a3 delta:(int)a4
{
  id v4;
  int64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;

  LODWORD(v5) = a4;
  v4 = a3;
  v5 = (int)v5;
  objc_msgSend(v4, "valueForKey:", CFSTR("characterModificationCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("characterModificationCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "integerValue") + (int)v5;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("characterModificationCount"));

  return v5;
}

+ (void)trackInsertion:(id)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger location;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];

  location = a5.location;
  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "valueForKey:", CFSTR("insertion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("insertion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("end"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue") + 1;

    if (location == v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("end"));

      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "objectForKey:", CFSTR("text"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@"), v15, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("text"));
    }
    else
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("insertions"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v7, "objectForKey:", CFSTR("insertions"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "arrayWithArray:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "addObject:", v10);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "setObject:forKey:", v24, CFSTR("insertions"));
      v28 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location + objc_msgSend(v8, "length") - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v8, CFSTR("text"), v25, CFSTR("start"), v26, CFSTR("end"), 0);
      v27 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v27;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location + objc_msgSend(v8, "length") - 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v8, CFSTR("text"), v18, CFSTR("start"), v19, CFSTR("end"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("insertion"));

}

+ (void)trackDeletion:(id)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  _QWORD v35[2];

  length = a5.length;
  location = a5.location;
  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  objc_msgSend(v8, "valueForKey:", CFSTR("deletion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("deletion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("start"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue") - 1;

    if (location == v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("start"));

      v15 = (void *)MEMORY[0x1E0CB3940];
      if (v9)
        v16 = v9;
      else
        v16 = &stru_1E16EDF20;
      objc_msgSend(v11, "objectForKey:", CFSTR("text"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("text"));
    }
    else
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("deletions"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v9;
      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v8, "objectForKey:", CFSTR("deletions"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrayWithArray:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "addObject:", v11);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v26);
        v27 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v35[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v33 = (void *)v27;
      objc_msgSend(v8, "setObject:forKey:", v27, CFSTR("deletions"));
      v28 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (length <= 1)
        v30 = 1;
      else
        v30 = length;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location + v30 - 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v34;
      objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v34, CFSTR("text"), v29, CFSTR("start"), v31, CFSTR("end"), 0);
      v32 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v32;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (length <= 1)
      v21 = 1;
    else
      v21 = length;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location + v21 - 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v9, CFSTR("text"), v20, CFSTR("start"), v22, CFSTR("end"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("deletion"));

}

+ (void)trackSubstitution:(id)a3 originalText:(id)a4 originalTextRange:(_NSRange)a5 replacementText:(id)a6 replacementTextRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[5];

  length = a5.length;
  location = a5.location;
  v35[3] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a6;
  v13 = &stru_1E16EDF20;
  if (v11)
    v13 = v11;
  v35[0] = v13;
  v34[0] = CFSTR("text");
  v34[1] = CFSTR("start");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location, v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v14;
  v34[2] = CFSTR("end");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", length + location - 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = &stru_1E16EDF20;
  if (v12)
    v17 = v12;
  v33[0] = v17;
  v32[0] = CFSTR("text");
  v32[1] = CFSTR("start");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7.location);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v18;
  v32[2] = CFSTR("end");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7.length + a7.location - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = CFSTR("original");
  v30[1] = CFSTR("replacement");
  v31[0] = v16;
  v31[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("substitutions"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v28, "objectForKey:", CFSTR("substitutions"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "arrayWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "addObject:", v21);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v28, "setObject:forKey:", v26, CFSTR("substitutions"));

}

+ (void)logSpeechAlternativeReplacement:(id)a3 originalText:(id)a4 replacementText:(id)a5 index:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27[0] = CFSTR("index");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  v28[1] = v10;
  v27[1] = CFSTR("originalText");
  v27[2] = CFSTR("replacementText");
  v28[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("alternativesSelected"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v9, "objectForKey:", CFSTR("alternativesSelected"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addObject:", v13);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("alternativesSelected"));

  }
  else
  {
    v26 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("alternativesSelected"));
  }

  objc_msgSend(v9, "objectForKey:", CFSTR("correctionIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("dictationUIInteractionIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logAlternativeSelected:correctionIdentifier:interactionIdentifier:", v13, v19, v20);

  objc_msgSend(v9, "objectForKey:", CFSTR("alternativesAvailableCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("dictationLanguage"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("dictationInstrumentationContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController instrumentationDictationAlternativeSelectedWithInstrumentationContext:originalText:replacementText:replacementIndex:alternativesAvailableCount:dictationLanguage:](UIDictationController, "instrumentationDictationAlternativeSelectedWithInstrumentationContext:originalText:replacementText:replacementIndex:alternativesAvailableCount:dictationLanguage:", v25, v10, v11, a6, v23, v24);

}

+ (void)attributedString:(id)a3 withIdentifiersBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, void *, void *, void *);

  v10 = (void (**)(id, void *, void *, void *, void *))a4;
  objc_msgSend(a3, "attribute:atIndex:effectiveRange:", CFSTR("_UITextInputDictationResultMetadata"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correctionIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dictationUIInteractionIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dictationInstrumentationContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dictationLanguage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v6 = 0;
  }
  v10[2](v10, v6, v7, v8, v9);

}

+ (unint64_t)maxLoggableLengthOfInsertionWithoutDeletion:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("speechRecognitionSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("local")))
    v4 = -1;
  else
    v4 = 5;

  return v4;
}

+ (unint64_t)maxLoggableLengthOfInsertionWithDeletion:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("speechRecognitionSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("local")))
    v4 = -1;
  else
    v4 = 12;

  return v4;
}

+ (unint64_t)maxLoggableLengthOfInsertionBySubstitution:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("speechRecognitionSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("local")))
    v4 = -1;
  else
    v4 = 12;

  return v4;
}

+ (id)trackingPunctuations
{
  if (qword_1ECD7EE68 != -1)
    dispatch_once(&qword_1ECD7EE68, &__block_literal_global_145);
  return (id)qword_1ECD7EE60;
}

void __44__UIDictationUtilities_trackingPunctuations__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR(","), CFSTR("."), CFSTR("!"), CFSTR("?"), CFSTR("，"), CFSTR("。"), CFSTR("！"), CFSTR("？"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7EE60;
  qword_1ECD7EE60 = v0;

}

+ (BOOL)shouldLogCorrectionInfoForCurrentBundleId
{
  if (qword_1ECD7EE70 != -1)
    dispatch_once(&qword_1ECD7EE70, &__block_literal_global_162_1);
  return _MergedGlobals_1123;
}

void __65__UIDictationUtilities_shouldLogCorrectionInfoForCurrentBundleId__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.tencent.xin"), CFSTR("net.whatsapp.WhatsApp"), CFSTR("jp.naver.line"), CFSTR("com.facebook.Messenger"), CFSTR("com.burbn.instagram"), CFSTR("com.tencent.mqq"), CFSTR("com.zhiliaoapp.musically"), CFSTR("com.ss.iphone.ugc.Aweme"), CFSTR("com.facebook.Facebook"), CFSTR("ph.telegra.Telegraph"), CFSTR("org.whispersystems.signal"), CFSTR("com.toyopagroup.picaboo"), CFSTR("com.roblox.robloxmobile"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1123 = objc_msgSend(v1, "containsObject:", v0);

}

+ (BOOL)shouldAddDeleteMenuElement
{
  return 0;
}

+ (BOOL)shouldInsertSpaceBetweenStringA:(id)a3 andStringB:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "punctuationCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "characterAtIndex:", 0);

  v11 = objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v7, "length") - 1);
  LOBYTE(v7) = objc_msgSend(v8, "characterIsMember:", v10);
  LOBYTE(v11) = (v7 | objc_msgSend(v9, "characterIsMember:", v11)) ^ 1;

  return v11;
}

+ (BOOL)_isAutomaticKeyboardDownDictationDisabled
{
  if (_isAutomaticKeyboardDownDictationDisabled_onceToken != -1)
    dispatch_once(&_isAutomaticKeyboardDownDictationDisabled_onceToken, &__block_literal_global_190);
  return 1;
}

void __65__UIDictationUtilities__isAutomaticKeyboardDownDictationDisabled__block_invoke()
{
  void *v0;
  id v1;

  _UIKitUserDefaults();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "BOOLForKey:", CFSTR("UIAutomaticKeyboardDownDictationDisabled")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "BOOLForKey:", CFSTR("UIAutomaticKeyboardDownDictationDisabled"));

  }
}

+ (BOOL)_isUsingLargeFormatDictationUI
{
  return 0;
}

+ (BOOL)_isDictationAssetAvailableForLocale:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id SFSpeechAssetManagerClass;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  if (qword_1ECD7EE88 != -1)
    dispatch_once(&qword_1ECD7EE88, &__block_literal_global_194);
  v4 = SpeechLibrary();
  v5 = 0;
  if (v3 && v4)
  {
    objc_msgSend(getSFSpeechAssetManagerClass(), "languageCode:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)qword_1ECD7EE80, "containsObject:", v6) & 1) != 0)
    {
      v5 = 1;
LABEL_13:

      goto LABEL_14;
    }
    if ((objc_msgSend((id)qword_1ECD7EE78, "containsObject:", v6) & 1) == 0)
    {
      v7 = (void *)qword_1ECD7EE80;
      v5 = 1;
      objc_msgSend(getSFSpeechAssetManagerClass(), "installedLanguagesForTaskHint:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unionSet:", v8);

      if ((objc_msgSend((id)qword_1ECD7EE80, "containsObject:", v6) & 1) != 0)
        goto LABEL_13;
      v21 = 0;
      v22 = &v21;
      v23 = 0x2050000000;
      v9 = (void *)qword_1ECD7EE90;
      v24 = qword_1ECD7EE90;
      v10 = MEMORY[0x1E0C809B0];
      if (!qword_1ECD7EE90)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __getSFEntitledAssetConfigClass_block_invoke;
        v20[3] = &unk_1E16B14C0;
        v20[4] = &v21;
        __getSFEntitledAssetConfigClass_block_invoke((uint64_t)v20);
        v9 = (void *)v22[3];
      }
      v11 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v21, 8);
      v12 = (void *)objc_msgSend([v11 alloc], "initWithLanguage:taskHint:", v6, 1);
      SFSpeechAssetManagerClass = getSFSpeechAssetManagerClass();
      objc_msgSend(getSFSpeechAssetManagerClass(), "systemClientId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_2;
      v18[3] = &unk_1E16C3F48;
      v19 = v6;
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_3;
      v16[3] = &unk_1E16D5418;
      v17 = v19;
      objc_msgSend(SFSpeechAssetManagerClass, "fetchAssetWithConfig:clientIdentifier:progress:completion:", v12, v14, v18, v16);

    }
    v5 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

void __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7EE78;
  qword_1ECD7EE78 = v0;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7EE80;
  qword_1ECD7EE80 = v2;

}

uint64_t __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)qword_1ECD7EE78, "addObject:", *(_QWORD *)(a1 + 32));
}

void __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend((id)qword_1ECD7EE80, "addObject:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend((id)qword_1ECD7EE78, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend((id)qword_1ECD7EE78, "removeObject:", *(_QWORD *)(a1 + 32));

}

+ (id)capitalizeFirstWord:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__126;
  v12 = __Block_byref_object_dispose__126;
  v13 = (id)objc_msgSend(v3, "mutableCopy");
  v4 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__UIDictationUtilities_capitalizeFirstWord___block_invoke;
  v7[3] = &unk_1E16BBAB8;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 3, v7);
  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__UIDictationUtilities_capitalizeFirstWord___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v11);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v14, "capitalizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "replaceCharactersInRange:withString:", a3, a4, v13);

  }
  *a7 = 1;

}

@end

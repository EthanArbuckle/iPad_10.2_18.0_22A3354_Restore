@implementation UIDictationMultilingualUtilities

+ (BOOL)hasMultilingualAttributesForAttributedString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 0;
  objc_msgSend(a1, "multilingualAttributesForAttributedString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bestAlternatives"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)multilingualAttributesForAttributedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "attribute:atIndex:effectiveRange:", CFSTR("_UITextInputDictationResultMetadata"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("bestText"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (qword_1ECD7EEA0 != -1)
        dispatch_once(&qword_1ECD7EEA0, &__block_literal_global_602_1);
      objc_msgSend(v6, "stringByTrimmingCharactersInSet:", qword_1ECD7EE98);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v4, "string");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (qword_1ECD7EEA0 != -1)
        dispatch_once(&qword_1ECD7EEA0, &__block_literal_global_602_1);
      objc_msgSend(v9, "stringByTrimmingCharactersInSet:", qword_1ECD7EE98);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    if (objc_msgSend(v10, "isEqualToString:", v7))
      v11 = v5;
    else
      v11 = 0;
    v8 = v11;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)textReplacementFromMultilingualString:(id)a3 replacementRange:(id)a4 stringToReplace:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextReplacement replacementWithRange:original:replacement:menuTitle:](UITextReplacement, "replacementWithRange:original:replacement:menuTitle:", v8, v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dominantLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "correctionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interactionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "phrases");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __107__UIDictationMultilingualUtilities_textReplacementFromMultilingualString_replacementRange_stringToReplace___block_invoke;
  v23[3] = &unk_1E16D5468;
  v24 = v13;
  v25 = v7;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v7;
  v21 = v13;
  objc_msgSend(v12, "setReplacementCompletionBlock:", v23);

  return v12;
}

void __107__UIDictationMultilingualUtilities_textReplacementFromMultilingualString_replacementRange_stringToReplace___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  UIDictationSerializableResults *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a2;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logDidAcceptReplacement:replacementLanguageCode:originalText:correctionIdentifier:interactionIdentifier:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    objc_msgSend(v7, "replaceRange:withText:", v12, &stru_1E16EDF20);
    v10 = -[UIDictationSerializableResults initWithPhrases:]([UIDictationSerializableResults alloc], "initWithPhrases:", *(_QWORD *)(a1 + 64));
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSerializedDictationResult:withCorrectionIdentifier:", v10, *(_QWORD *)(a1 + 48));

  }
}

@end

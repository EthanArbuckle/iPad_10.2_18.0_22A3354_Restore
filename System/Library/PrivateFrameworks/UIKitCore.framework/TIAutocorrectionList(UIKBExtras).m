@implementation TIAutocorrectionList(UIKBExtras)

- (void)updateLabelsWithSmartPunctuation:()UIKBExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "autocorrection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "autocorrection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "smartPunctuationedStringForString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "autocorrection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLabel:", v8);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a1, "predictions", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "smartPunctuationedStringForString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "setLabel:", v17);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
}

- (uint64_t)sourceForAutocorrection
{
  void *v1;
  int v2;

  objc_msgSend(a1, "autocorrection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isContinuousPathConversion");

  if (v2)
    return 6;
  else
    return 0;
}

- (uint64_t)isShowingSuggestionForKeyboardCamera
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "predictions", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "textSuggestion");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)objc_msgSend(v5, "action") == sel_captureTextFromCamera_)
        {

          v2 = 1;
          goto LABEL_12;
        }

      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

- (uint64_t)isShowingSuggestionForWritingTools
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "predictions", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "textSuggestion");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)objc_msgSend(v5, "action") == sel__startWritingTools_)
        {

          v2 = 1;
          goto LABEL_12;
        }

      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

@end

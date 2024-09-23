@implementation TUIEmojiSearchSource

- (TUIEmojiSearchSource)initWithLocale:(id)a3
{
  id v4;
  TUIEmojiSearchSource *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *searchQueue;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIEmojiSearchSource;
  v5 = -[TUIEmojiSearchSource init](&v12, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.TextInputUI.emojiSearchQueue", MEMORY[0x1E0C80D50]);
    searchQueue = v5->_searchQueue;
    v5->_searchQueue = (OS_dispatch_queue *)v6;

    -[TUIEmojiSearchSource setLocale:](v5, "setLocale:", v4);
    v8 = (void *)MEMORY[0x1E0D1F230];
    objc_msgSend(v4, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emojiLocaleDataWithLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchSource setLocaleData:](v5, "setLocaleData:", v10);

  }
  return v5;
}

- (void)beginSearchForExactQuery:(id)a3 autocorrectedQuery:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *exactQuery;
  NSString *v10;
  NSString *autocorrectedQuery;
  NSObject *searchQueue;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (!-[NSString isEqualToString:](self->_exactQuery, "isEqualToString:", v6)
    || !-[NSString isEqualToString:](self->_autocorrectedQuery, "isEqualToString:", v7))
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    exactQuery = self->_exactQuery;
    self->_exactQuery = v8;

    v10 = (NSString *)objc_msgSend(v7, "copy");
    autocorrectedQuery = self->_autocorrectedQuery;
    self->_autocorrectedQuery = v10;

    searchQueue = self->_searchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__TUIEmojiSearchSource_beginSearchForExactQuery_autocorrectedQuery___block_invoke;
    block[3] = &unk_1E24FBDA8;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(searchQueue, block);

  }
}

- (BOOL)shouldSupplyVerbatimResultsFor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "string", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = (void *)shouldSupplyVerbatimResultsFor__verbatimResultSets;
  if (!shouldSupplyVerbatimResultsFor__verbatimResultSets)
  {
    v11 = &unk_1E2517828;
    shouldSupplyVerbatimResultsFor__verbatimResultSets = (uint64_t)&unk_1E2517828;
  }
  v12 = objc_msgSend(v11, "containsObject:", v4, (_QWORD)v14);

  return v12;
}

- (id)_filteredTokensIgnoringModifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsSkinToneVariants", (_QWORD)v19))
        {
          v12 = (void *)MEMORY[0x1E0D1F278];
          objc_msgSend(v11, "string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_baseStringForEmojiString:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v4, "containsObject:", v14))
          {

            continue;
          }
        }
        else
        {
          objc_msgSend(v11, "string");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v4, "containsObject:", v15);

          if ((v16 & 1) != 0)
            continue;
          objc_msgSend(v11, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v4, "addObject:", v14);

        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)suggestedEmojis
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D1F228], "categoryWithIdentifier:", *MEMORY[0x1E0D1F210]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emojiTokensForLocaleData:", self->_localeData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D1F240]);
  objc_msgSend(v5, "recentEmojis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if ((unint64_t)objc_msgSend(v7, "count") <= 0xE)
  {
    v8 = 0;
    do
    {
      v9 = v8 + 1;
      objc_msgSend(v4, "objectAtIndex:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

      v11 = objc_msgSend(v7, "count");
      v8 = v9;
    }
    while (v11 < 0xF);
  }
  -[TUIEmojiSearchSource _filteredTokensIgnoringModifiers:](self, "_filteredTokensIgnoringModifiers:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (id)_emojiResultSetForExactQuery:(id)a3 autocorrectedQuery:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8 + objc_msgSend(v7, "length"))
  {
    -[TUIEmojiSearchSource localeData](self, "localeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emojiTokensForText:phoneticReading:options:searchType:includePrefixMatches:", v6, 0, 17, 2, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (-[TUIEmojiSearchSource shouldSupplyVerbatimResultsFor:](self, "shouldSupplyVerbatimResultsFor:", v11))
    {
      v11 = v11;
      v9 = v11;
    }
    else
    {
      -[TUIEmojiSearchSource languagesForMultilingualSearch](self, "languagesForMultilingualSearch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "count") && v12)
      {
        -[TUIEmojiSearchSource _repeatSearchQuery:forLocales:](self, "_repeatSearchQuery:forLocales:", v6, v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v13;
      }
      -[TUIEmojiSearchSource localeData](self, "localeData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "emojiTokensForText:phoneticReading:options:searchType:includePrefixMatches:", v7, 0, 17, 2, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "count") >= 2)
      {
        -[TUIEmojiSearchSource _repeatSearchQuery:forLocales:](self, "_repeatSearchQuery:forLocales:", v7, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v18;
      }
      -[TUIEmojiSearchSource _filteredTokensIgnoringModifiers:](self, "_filteredTokensIgnoringModifiers:", v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)languagesForMultilingualSearch
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (TIGetMultilingualEmojiSearchValue_onceToken != -1)
    dispatch_once(&TIGetMultilingualEmojiSearchValue_onceToken, &__block_literal_global_7100);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForPreferenceKey:", CFSTR("MultilingualEmojiSearch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "BOOLValue");
  if ((_DWORD)v3
    && (-[TUIEmojiSearchSource multilingualSearchLocales](self, "multilingualSearchLocales"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    -[TUIEmojiSearchSource multilingualSearchLocales](self, "multilingualSearchLocales");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_repeatSearchQuery:(id)a3 forLocales:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        -[TUIEmojiSearchSource locale](self, "locale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = UIKeyboardInputModeLanguageMatchesLocaleLanguage();

        if ((v15 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D1F230], "emojiLocaleDataWithLocaleIdentifier:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "emojiTokensForText:phoneticReading:options:searchType:includePrefixMatches:", v6, 0, 17, 2, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
            objc_msgSend(v19, "addObjectsFromArray:", v17);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v19;
}

- (void)_deliverResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__TUIEmojiSearchSource__deliverResults_forExactQuery_autocorrectedQuery___block_invoke;
  v14[3] = &unk_1E24FBDD0;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (TUIEmojiSearchSourceDelegate)delegate
{
  return (TUIEmojiSearchSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSArray)multilingualSearchLocales
{
  return self->_multilingualSearchLocales;
}

- (void)setMultilingualSearchLocales:(id)a3
{
  objc_storeStrong((id *)&self->_multilingualSearchLocales, a3);
}

- (EMFEmojiLocaleData)localeData
{
  return self->_localeData;
}

- (void)setLocaleData:(id)a3
{
  objc_storeStrong((id *)&self->_localeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeData, 0);
  objc_storeStrong((id *)&self->_multilingualSearchLocales, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_autocorrectedQuery, 0);
  objc_storeStrong((id *)&self->_exactQuery, 0);
}

void __73__TUIEmojiSearchSource__deliverResults_forExactQuery_autocorrectedQuery___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isEqualToString:", *(_QWORD *)(a1 + 40))
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqualToString:", *(_QWORD *)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "emojiSearchSource:didProduceResults:forExactQuery:autocorrectedQuery:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    }
  }
}

void __68__TUIEmojiSearchSource_beginSearchForExactQuery_autocorrectedQuery___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_emojiResultSetForExactQuery:autocorrectedQuery:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_deliverResults:forExactQuery:autocorrectedQuery:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end

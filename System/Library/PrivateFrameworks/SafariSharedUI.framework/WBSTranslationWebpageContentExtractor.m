@implementation WBSTranslationWebpageContentExtractor

- (WBSTranslationWebpageContentExtractor)initWithWebView:(id)a3
{
  id v4;
  WBSTranslationWebpageContentExtractor *v5;
  WBSTranslationWebpageContentExtractor *v6;
  uint64_t v7;
  NSMutableArray *replaceItemsQueue;
  WBSTranslationWebpageContentExtractor *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSTranslationWebpageContentExtractor;
  v5 = -[WBSTranslationWebpageContentExtractor init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    replaceItemsQueue = v6->_replaceItemsQueue;
    v6->_replaceItemsQueue = (NSMutableArray *)v7;

    v6->_replaceItemsLock._os_unfair_lock_opaque = 0;
    v9 = v6;
  }

  return v6;
}

- (void)beginExtractingContent
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke;
  block[3] = &unk_1E5446110;
  block[4] = self;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "_setTextManipulationDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_textManipulationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke_2;
  v7[3] = &unk_1E5441F48;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startTextManipulationsWithConfiguration:completion:", v3, v7);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "sourceLocaleForContentExtractor:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetLocaleForContentExtractor:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_startImageAnalysis:target:", v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "contentExtractorDidBeginExtractingContent:", *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v8);
}

void __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  __int16 v6[8];

  v2 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6[0] = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Finished extracting initial webpage content for translation", (uint8_t *)v6, 2u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "contentExtractorDidFinishExtractingInitialContent:", v4);

  }
}

- (void)stopExtractingContent
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSTranslationWebpageContentExtractor_stopExtractingContent__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__WBSTranslationWebpageContentExtractor_stopExtractingContent__block_invoke(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "contentExtractorDidStopExtractingContent:", *(_QWORD *)(a1 + 32));

}

- (void)replaceExtractedContent:(id)a3 withTranslatedContent:(id)a4 targetLocale:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a5;
  v7 = a4;
  os_unfair_lock_lock(&self->_replaceItemsLock);
  v8 = -[NSMutableArray count](self->_replaceItemsQueue, "count");
  -[NSMutableArray safari_addObjectUnlessNil:](self->_replaceItemsQueue, "safari_addObjectUnlessNil:", v7);

  os_unfair_lock_unlock(&self->_replaceItemsLock);
  if (!v8)
    -[WBSTranslationWebpageContentExtractor _scheduleReplaceItemsWithTargetLocale:](self, "_scheduleReplaceItemsWithTargetLocale:", v9);

}

- (void)_scheduleReplaceItemsWithTargetLocale:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSTranslationWebpageContentExtractor__scheduleReplaceItemsWithTargetLocale___block_invoke;
  block[3] = &unk_1E5442448;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __79__WBSTranslationWebpageContentExtractor__scheduleReplaceItemsWithTargetLocale___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateHTMLLanguageAttributesIfNeeded:", *(_QWORD *)(a1 + 32));
    v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
    v5 = os_signpost_id_generate(v4);
    WBS_LOG_CHANNEL_PREFIXTranslation();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A840B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Replace Items", (const char *)&unk_1A84E7B6B, v8, 2u);
    }

    objc_msgSend(v3, "_replaceItemsWithSignpostID:", v5);
  }

}

- (void)_replaceItemsWithSignpostID:(unint64_t)a3
{
  os_unfair_lock_s *p_replaceItemsLock;
  int v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  unint64_t v15;

  p_replaceItemsLock = &self->_replaceItemsLock;
  os_unfair_lock_lock(&self->_replaceItemsLock);
  if (WBSTranslationIsUnthrottled_onceToken != -1)
    dispatch_once(&WBSTranslationIsUnthrottled_onceToken, &__block_literal_global_147);
  v6 = WBSTranslationIsUnthrottled_translationIsUnthrottled;
  v7 = -[NSMutableArray count](self->_replaceItemsQueue, "count");
  v8 = v7;
  if (!v6)
  {
    if (v7 > 0xB)
      v8 = 12;
    else
      v8 = -[NSMutableArray count](self->_replaceItemsQueue, "count");
  }
  -[NSMutableArray subarrayWithRange:](self->_replaceItemsQueue, "subarrayWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_replaceItemsLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke;
  v12[3] = &unk_1E5447238;
  v14 = v8;
  v15 = a3;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(WeakRetained, "_completeTextManipulationForItems:completion:", v11, v12);

}

void __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[4];
  id v40[2];
  id location[2];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectsInRange:", 0, *(_QWORD *)(a1 + 48));
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (v4)
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    v5 = dispatch_time(0, 20000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke_2;
    block[3] = &unk_1E5447210;
    objc_copyWeak(v40, location);
    v40[1] = *(id *)(a1 + 56);
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(v40);
    objc_destroyWeak(location);
  }
  else
  {
    WBS_LOG_CHANNEL_PREFIXTranslation();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 56);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(location[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A840B000, v7, OS_SIGNPOST_INTERVAL_END, v8, "Replace Items", (const char *)&unk_1A84E7B6B, (uint8_t *)location, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v29 = a1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v3;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      v15 = *MEMORY[0x1E0CEF818];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v17, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v19, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v20);

            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v13);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = *(id *)(v29 + 40);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(WeakRetained, "contentFiller:didCompleteFillingItem:withError:", *(_QWORD *)(v29 + 32), v26, v28);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v23);
    }

    v3 = v30;
  }

}

void __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_replaceItemsWithSignpostID:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_webView:(id)a3 didFindTextManipulationItem:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v5, "tokens");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Extracted _WKTextManipulationItem from webpage with %lu tokens", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_extractionDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "contentExtractor:didExtractContent:", self, v10);

  }
  self->_needsHTMLLangAttributeUpdate = 1;

}

- (void)_webView:(id)a3 didFindTextManipulationItems:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v9 = 134217984;
    v10 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Extracted %lu _WKTextManipulationItem(s) from webpage", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_extractionDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "contentExtractor:didExtractContent:", self, v5);
  self->_needsHTMLLangAttributeUpdate = 1;

}

- (void)_updateHTMLLanguageAttributesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  if (self->_needsHTMLLangAttributeUpdate)
  {
    self->_needsHTMLLangAttributeUpdate = 0;
    objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (void *)objc_msgSend(v4, "initWithBytesNoCopy:length:encoding:freeWhenDone:", "//# sourceURL=__InjectedScript_Translation.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\nfunction updateLanguageAttributesForTranslation(n){document.documentElement.lang&&(document.documentElement.lang=n)}", translationSourceLength, 1, 0);
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n updateLanguageAttributesForTranslation(\"%@\");"), v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(MEMORY[0x1E0CEF5E0], "defaultClientWorld");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_evaluateJavaScript:inFrame:inContentWorld:completionHandler:", v6, 0, v8, &__block_literal_global_53);

  }
}

void __79__WBSTranslationWebpageContentExtractor__updateHTMLLanguageAttributesIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__WBSTranslationWebpageContentExtractor__updateHTMLLanguageAttributesIfNeeded___block_invoke_cold_1(v4, v3);
  }

}

- (id)_textManipulationConfiguration
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CEF6E0]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forElement:", 1, CFSTR("code"));
  v15[0] = v14;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forElement:", 1, CFSTR("var"));
  v15[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forElement:", 1, CFSTR("kbd"));
  v15[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forElement:", 1, CFSTR("samp"));
  v15[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forAttribute:value:", 1, CFSTR("translate"), CFSTR("no"));
  v15[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forAttribute:value:", 0, CFSTR("translate"), CFSTR("yes"));
  v15[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forAttribute:value:", 1, CFSTR("contenteditable"), CFSTR("true"));
  v15[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forAttribute:value:", 0, CFSTR("contenteditable"), CFSTR("false"));
  v15[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6E8]), "initExclusion:forClass:", 1, CFSTR("notranslate"));
  v15[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setExclusionRules:", v11);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeSubframes:", objc_msgSend(v12, "BOOLForKey:", *MEMORY[0x1E0D8A6B8]));

  return v2;
}

- (WBSTranslationContentExtractionDelegate)extractionDelegate
{
  return (WBSTranslationContentExtractionDelegate *)objc_loadWeakRetained((id *)&self->_extractionDelegate);
}

- (void)setExtractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_extractionDelegate, a3);
}

- (WBSTranslationContentFillingDelegate)fillingDelegate
{
  return (WBSTranslationContentFillingDelegate *)objc_loadWeakRetained((id *)&self->_fillingDelegate);
}

- (void)setFillingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_fillingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fillingDelegate);
  objc_destroyWeak((id *)&self->_extractionDelegate);
  objc_storeStrong((id *)&self->_replaceItemsQueue, 0);
  objc_destroyWeak((id *)&self->_webView);
}

void __79__WBSTranslationWebpageContentExtractor__updateHTMLLanguageAttributesIfNeeded___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to update page's language attributes: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end

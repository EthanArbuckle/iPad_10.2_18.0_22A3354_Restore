@implementation WBSBrowsingAssistantResult

- (WBSBrowsingAssistantResult)initWithURL:(id)a3 contentOptions:(unint64_t)a4
{
  id v6;
  WBSBrowsingAssistantResult *v7;
  uint64_t v8;
  NSURL *pageURL;
  WBSBrowsingAssistantResult *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSBrowsingAssistantResult;
  v7 = -[WBSBrowsingAssistantResult init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    pageURL = v7->_pageURL;
    v7->_pageURL = (NSURL *)v8;

    -[WBSBrowsingAssistantResult _setUpWithContentOptions:](v7, "_setUpWithContentOptions:", a4);
    v10 = v7;
  }

  return v7;
}

- (void)_setUpWithContentOptions:(unint64_t)a3
{
  -[WBSBrowsingAssistantResult updateForLocalContentWithOptions:](self, "updateForLocalContentWithOptions:");
  -[WBSBrowsingAssistantResult updateForRemoteContentWithOptions:](self, "updateForRemoteContentWithOptions:", a3);
}

- (void)updateForRemoteContentWithOptions:(unint64_t)a3
{
  char v3;

  v3 = a3;
  -[WBSBrowsingAssistantResult _updateContentOptions:inMask:](self, "_updateContentOptions:inMask:", a3, 31);
  if ((v3 & 0x1F) != 0)
    self->_remoteContentState = 2;
}

- (void)updateForLocalContentWithOptions:(unint64_t)a3
{
  -[WBSBrowsingAssistantResult _updateContentOptions:inMask:](self, "_updateContentOptions:inMask:", a3, 96);
}

- (void)_updateContentOptions:(unint64_t)a3 inMask:(unint64_t)a4
{
  self->_contentOptions |= a4 & a3;
}

- (id)_extractSummaryFromResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(a3, "inlineCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text_elements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "formatted_text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && (objc_msgSend(v11, "text"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "length"),
          v12,
          v13))
    {
      objc_msgSend(v11, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");

    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[WBSBrowsingAssistantResult _extractSummaryFromResult:].cold.1((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);
      -[WBSBrowsingAssistantResult _clearSummaryAndTableOfContents](self, "_clearSummaryAndTableOfContents");
      v15 = 0;
    }

  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[WBSBrowsingAssistantResult _extractSummaryFromResult:].cold.2((uint64_t)self, v16, v6);
    -[WBSBrowsingAssistantResult _clearSummaryAndTableOfContents](self, "_clearSummaryAndTableOfContents");
    v15 = 0;
  }

  return v15;
}

- (id)_extractDisclaimerFromResult:(id)a3
{
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
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(a3, "inlineCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_firstObjectPassingTest:", &__block_literal_global_91);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text_elements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "formatted_text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      && (objc_msgSend(v12, "text"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "length"),
          v13,
          v14))
    {
      objc_msgSend(v12, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");

    }
    else
    {
      v17 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[WBSBrowsingAssistantResult _extractDisclaimerFromResult:].cold.1((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __59__WBSBrowsingAssistantResult__extractDisclaimerFromResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_setUpTableOfContentsDataUsingResult:(id)a3
{
  void *v4;
  void *v5;
  NSArray *tableOfContentsTitles;
  NSArray *v7;
  NSArray *tableOfContentsPaths;
  NSArray *tableOfContentsTrailingText;
  void *v10;
  id v11;
  _QWORD v12[5];

  objc_msgSend(a3, "inlineCard");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cardSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    tableOfContentsTitles = self->_tableOfContentsTitles;
    v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    self->_tableOfContentsTitles = (NSArray *)MEMORY[0x1E0C9AA60];

    tableOfContentsPaths = self->_tableOfContentsPaths;
    self->_tableOfContentsPaths = v7;

    tableOfContentsTrailingText = self->_tableOfContentsTrailingText;
    self->_tableOfContentsTrailingText = v7;

    objc_msgSend(v5, "tableOfContentsItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__WBSBrowsingAssistantResult__setUpTableOfContentsDataUsingResult___block_invoke;
    v12[3] = &unk_1E4B3F558;
    v12[4] = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  }
}

void __67__WBSBrowsingAssistantResult__setUpTableOfContentsDataUsingResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v4 = a2;
  objc_msgSend(v4, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E4B40D18;
  objc_msgSend(v3, "arrayByAddingObject:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 64);
  *(_QWORD *)(v9 + 64) = v8;

  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(v4, "elementPath");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E4B40D18;
  objc_msgSend(v11, "arrayByAddingObject:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 72);
  *(_QWORD *)(v16 + 72) = v15;

  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(v4, "trailingText");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v23)
    v19 = v23;
  else
    v19 = &stru_1E4B40D18;
  objc_msgSend(v18, "arrayByAddingObject:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 80);
  *(_QWORD *)(v21 + 80) = v20;

}

- (void)updateWithSearchResults:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *summaryText;
  NSString *v8;
  NSString *disclaimerText;
  NSArray *v10;
  NSArray *entityResults;
  id v12;

  v4 = a3;
  self->_remoteContentState = 4;
  v12 = v4;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v12, "safari_firstObjectPassingTest:", &__block_literal_global_10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WBSBrowsingAssistantResult _extractSummaryFromResult:](self, "_extractSummaryFromResult:", v5);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      summaryText = self->_summaryText;
      self->_summaryText = v6;

      -[WBSBrowsingAssistantResult _extractDisclaimerFromResult:](self, "_extractDisclaimerFromResult:", v5);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      disclaimerText = self->_disclaimerText;
      self->_disclaimerText = v8;

      -[WBSBrowsingAssistantResult _setUpTableOfContentsDataUsingResult:](self, "_setUpTableOfContentsDataUsingResult:", v5);
      if (self->_summaryText)
        objc_storeStrong((id *)&self->_summaryResult, v5);
      objc_msgSend(v12, "safari_arrayByRemovingObject:", v5);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (NSArray *)v12;
    }
    entityResults = self->_entityResults;
    self->_entityResults = v10;

  }
  else
  {
    self->_tableOfContentsAvailable = 0;
    -[WBSBrowsingAssistantResult _clearAllRemoteContent](self, "_clearAllRemoteContent");
  }

}

uint64_t __54__WBSBrowsingAssistantResult_updateWithSearchResults___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "domainName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_isCaseInsensitiveEqualToString:", CFSTR("sba"));

  return v3;
}

- (void)_clearSummaryAndTableOfContents
{
  NSString *summaryText;
  SFSearchResult *summaryResult;
  NSArray *tableOfContentsTitles;
  NSArray *tableOfContentsPaths;
  NSArray *tableOfContentsTrailingText;

  summaryText = self->_summaryText;
  self->_summaryText = 0;

  summaryResult = self->_summaryResult;
  self->_summaryResult = 0;

  tableOfContentsTitles = self->_tableOfContentsTitles;
  self->_tableOfContentsTitles = 0;

  tableOfContentsPaths = self->_tableOfContentsPaths;
  self->_tableOfContentsPaths = 0;

  tableOfContentsTrailingText = self->_tableOfContentsTrailingText;
  self->_tableOfContentsTrailingText = 0;

  self->_tableOfContentsAvailable = 0;
}

- (void)_clearAllRemoteContent
{
  NSArray *entityResults;

  -[WBSBrowsingAssistantResult _clearSummaryAndTableOfContents](self, "_clearSummaryAndTableOfContents");
  entityResults = self->_entityResults;
  self->_entityResults = 0;

  self->_contentOptions &= 0xFFFFFFFFFFFFFFE0;
}

- (BOOL)remoteContentAvailableForFetching
{
  return (self->_contentOptions & 0x1F) != 0;
}

- (BOOL)remoteContentReady
{
  return self->_remoteContentState == 4;
}

- (NSArray)allResults
{
  void *v3;
  void *v4;
  NSArray *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_summaryResult);
  objc_msgSend(v3, "safari_addObjectsFromArrayUnlessNil:", self->_entityResults);
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (unint64_t)contentOptions
{
  return self->_contentOptions;
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (SFSearchResult)summaryResult
{
  return self->_summaryResult;
}

- (NSArray)entityResults
{
  return self->_entityResults;
}

- (BOOL)tableOfContentsAvailable
{
  return self->_tableOfContentsAvailable;
}

- (void)setTableOfContentsAvailable:(BOOL)a3
{
  self->_tableOfContentsAvailable = a3;
}

- (NSArray)tableOfContentsTitles
{
  return self->_tableOfContentsTitles;
}

- (NSArray)tableOfContentsPaths
{
  return self->_tableOfContentsPaths;
}

- (NSArray)tableOfContentsTrailingText
{
  return self->_tableOfContentsTrailingText;
}

- (int64_t)remoteContentState
{
  return self->_remoteContentState;
}

- (void)setRemoteContentState:(int64_t)a3
{
  self->_remoteContentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableOfContentsTrailingText, 0);
  objc_storeStrong((id *)&self->_tableOfContentsPaths, 0);
  objc_storeStrong((id *)&self->_tableOfContentsTitles, 0);
  objc_storeStrong((id *)&self->_entityResults, 0);
  objc_storeStrong((id *)&self->_summaryResult, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
}

- (void)_extractSummaryFromResult:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Received empty summary for URL %{sensitive}@", a5, a6, a7, a8, 3u);
}

- (void)_extractSummaryFromResult:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 16);
  v5 = a2;
  objc_msgSend(a3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Received unexpected summary card section: URL %{private}@, section %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)_extractDisclaimerFromResult:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Received an empty disclaimer for URL %{sensitive}@", a5, a6, a7, a8, 3u);
}

@end

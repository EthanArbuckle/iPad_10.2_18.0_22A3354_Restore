@implementation ICSearchResult

- (ICSearchResult)initWithObject:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  ICSearchResult *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  ICSearchIndexable *object;
  uint64_t v17;
  void *v18;
  _QWORD v20[4];
  ICSearchResult *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ICSearchResult;
  v9 = -[ICSearchResult init](&v32, sel_init);
  if (v9)
  {
    if (!v7)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "object", "-[ICSearchResult initWithObject:configuration:]", 1, 0, CFSTR("object is nil"));
    objc_msgSend(v7, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ic_isMainThreadContext");

    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      objc_storeStrong((id *)&v9->_object, a3);
      objc_storeStrong((id *)&v9->_currentContextObject, a3);
    }
    else
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__57;
      v30 = __Block_byref_object_dispose__57;
      v31 = 0;
      objc_msgSend(v7, "managedObjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __47__ICSearchResult_initWithObject_configuration___block_invoke;
      v23[3] = &unk_1E5C1D9D0;
      v25 = &v26;
      v24 = v7;
      objc_msgSend(v13, "performBlockAndWait:", v23);

      if (v27[5])
      {
        objc_msgSend(MEMORY[0x1E0D64258], "sharedIndexer");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject mainContextObjectForObjectIDURIString:](v14, "mainContextObjectForObjectIDURIString:", v27[5]);
        v15 = objc_claimAutoreleasedReturnValue();
        object = v9->_object;
        v9->_object = (ICSearchIndexable *)v15;

      }
      else
      {
        v14 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[ICSearchResult initWithObject:configuration:].cold.1(v14);
      }

      _Block_object_dispose(&v26, 8);
    }
    objc_storeStrong((id *)&v9->_configuration, a4);
    v17 = -[ICSearchIndexable hash](v9->_object, "hash");
    v9->_cachedHash = objc_msgSend(v8, "hash") + v17;
    -[ICSearchResult initializeRegexes](v9, "initializeRegexes");
    objc_msgSend(v7, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __47__ICSearchResult_initWithObject_configuration___block_invoke_12;
    v20[3] = &unk_1E5C1D9A8;
    v21 = v9;
    v22 = v7;
    objc_msgSend(v18, "performBlockAndWait:", v20);

  }
  return v9;
}

void __47__ICSearchResult_initWithObject_configuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "searchIndexingIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __47__ICSearchResult_initWithObject_configuration___block_invoke_12(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareDisplayingTitleWithAccessingObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "prepareDisplayingSnippetWithAccessingObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "prepareFirstMatchingRangeWithAccessingObject:", *(_QWORD *)(a1 + 40));
}

- (ICSearchResult)initWithMainContextObject:(id)a3 currentContextObject:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICSearchResult *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  ICSearchResult *v17;
  id v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICSearchResult;
  v12 = -[ICSearchResult init](&v19, sel_init);
  if (v12)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_object, a3);
        objc_storeStrong((id *)&v12->_currentContextObject, a4);
        objc_storeStrong((id *)&v12->_configuration, a5);
        v13 = objc_msgSend(v9, "hash");
        v12->_cachedHash = objc_msgSend(v11, "hash") + v13;
        -[ICSearchResult initializeRegexes](v12, "initializeRegexes");
        objc_msgSend(v10, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __79__ICSearchResult_initWithMainContextObject_currentContextObject_configuration___block_invoke;
        v16[3] = &unk_1E5C1D9A8;
        v17 = v12;
        v18 = v10;
        objc_msgSend(v14, "performBlockAndWait:", v16);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "mainContextObject", "-[ICSearchResult initWithMainContextObject:currentContextObject:configuration:]", 1, 0, CFSTR("mainContextObject is nil"));
      if (v10)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "currentContextObject", "-[ICSearchResult initWithMainContextObject:currentContextObject:configuration:]", 1, 0, CFSTR("currentContextObject is nil"));
    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

uint64_t __79__ICSearchResult_initWithMainContextObject_currentContextObject_configuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareDisplayingTitleWithAccessingObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "prepareDisplayingSnippetWithAccessingObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "prepareFirstMatchingRangeWithAccessingObject:", *(_QWORD *)(a1 + 40));
}

- (void)initializeRegexes
{
  void *v3;
  void *v4;
  ICSearchResultRegexMatchFinder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICSearchResultRegexMatchFinder *v10;
  void *v11;
  ICSearchResultRegexMatchFinder *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ICSearchResultRegexMatchFinder *v17;
  void *v18;
  ICSearchResultRegexMatchFinder *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ICSearchResultRegexMatchFinder *v24;
  void *v25;
  ICSearchResultRegexMatchFinder *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ICSearchResultRegexMatchFinder *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  -[ICSearchResult decomposedHighlightInfo](self, "decomposedHighlightInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E5C71EF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [ICSearchResultRegexMatchFinder alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E5C71F10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E5C71F28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchResult configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICSearchResultRegexMatchFinder initWithPrefixMatchingTokens:substringMatchingTokens:searchString:](v5, "initWithPrefixMatchingTokens:substringMatchingTokens:searchString:", v6, v7, v9);
    -[ICSearchResult setTitleHighlightRegexMatchFinder:](self, "setTitleHighlightRegexMatchFinder:", v10);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E5C71F40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = [ICSearchResultRegexMatchFinder alloc];
    objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E5C71F10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E5C71F28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchResult configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ICSearchResultRegexMatchFinder initWithPrefixMatchingTokens:substringMatchingTokens:searchString:](v12, "initWithPrefixMatchingTokens:substringMatchingTokens:searchString:", v13, v14, v16);
    -[ICSearchResult setParticipantHighlightRegexMatchFinder:](self, "setParticipantHighlightRegexMatchFinder:", v17);

  }
  v37 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E5C71F58);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = [ICSearchResultRegexMatchFinder alloc];
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E5C71F10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E5C71F28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchResult configuration](self, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "searchString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ICSearchResultRegexMatchFinder initWithPrefixMatchingTokens:substringMatchingTokens:searchString:](v19, "initWithPrefixMatchingTokens:substringMatchingTokens:searchString:", v20, v21, v23);
    -[ICSearchResult setSnippetHighlightRegexMatchFinder:](self, "setSnippetHighlightRegexMatchFinder:", v24);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "mergeFieldElement:withElement:", v4, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [ICSearchResultRegexMatchFinder alloc];
  objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E5C71F10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E5C71F28);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchResult configuration](self, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "searchString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[ICSearchResultRegexMatchFinder initWithPrefixMatchingTokens:substringMatchingTokens:searchString:](v26, "initWithPrefixMatchingTokens:substringMatchingTokens:searchString:", v27, v28, v30);
  -[ICSearchResult setHighlightPatternRegexFinder:](self, "setHighlightPatternRegexFinder:", v31);

  v32 = (void *)MEMORY[0x1E0CB38E8];
  -[ICSearchResult configuration](self, "configuration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "searchString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "ic_regexForSearchStrings:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchResult setTipKitCheckRegex:](self, "setTipKitCheckRegex:", v36);

}

- (NSDictionary)decomposedHighlightInfo
{
  NSDictionary *decomposedHighlightInfo;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;

  decomposedHighlightInfo = self->_decomposedHighlightInfo;
  if (!decomposedHighlightInfo)
  {
    v4 = (void *)MEMORY[0x1E0C99D80];
    -[ICSearchResult configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortableSearchableItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highlightInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decomposedHighlightInfo:", v7);
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_decomposedHighlightInfo;
    self->_decomposedHighlightInfo = v8;

    decomposedHighlightInfo = self->_decomposedHighlightInfo;
  }
  return decomposedHighlightInfo;
}

- (void)refreshDisplayTitle
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ICSearchResult object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ICSearchResult_refreshDisplayTitle__block_invoke;
  v5[3] = &unk_1E5C1D540;
  v5[4] = self;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __37__ICSearchResult_refreshDisplayTitle__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepareDisplayingTitleWithAccessingObject:", v2);

}

- (void)refreshDisplaySnippet
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ICSearchResult object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ICSearchResult_refreshDisplaySnippet__block_invoke;
  v5[3] = &unk_1E5C1D540;
  v5[4] = self;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __39__ICSearchResult_refreshDisplaySnippet__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepareDisplayingSnippetWithAccessingObject:", v2);

}

- (void)refreshFirstMatchingRange
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ICSearchResult object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ICSearchResult_refreshFirstMatchingRange__block_invoke;
  v5[3] = &unk_1E5C1D540;
  v5[4] = self;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __43__ICSearchResult_refreshFirstMatchingRange__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepareFirstMatchingRangeWithAccessingObject:", v2);

}

- (void)prepareDisplayingTitleWithAccessingObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[ICSearchResult setTitleAttributedStringInsideFrame:](self, "setTitleAttributedStringInsideFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[ICSearchResult setDisplayingTitle:](self, "setDisplayingTitle:", 0);
  -[ICSearchResult setDisplayingTitleCheckingResult:](self, "setDisplayingTitleCheckingResult:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v13;
  else
    v4 = 0;
  v5 = v4;
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v5, "trimmedTitle");
  else
    objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_whitespaceAndNewlineCoalescedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICSearchResult setDisplayingTitle:](self, "setDisplayingTitle:", v9);
    -[ICSearchResult titleHighlightRegexMatchFinder](self, "titleHighlightRegexMatchFinder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchResult displayingTitle](self, "displayingTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstMatchInDocumentWithGlobalFallback:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchResult setDisplayingTitleCheckingResult:](self, "setDisplayingTitleCheckingResult:", v12);

  }
}

- (void)prepareDisplayingSnippetWithAccessingObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  ICSearchTextCheckingResult *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a3;
  -[ICSearchResult setSnippetAttributedStringInsideFrame:](self, "setSnippetAttributedStringInsideFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[ICSearchResult setDisplayingSnippet:](self, "setDisplayingSnippet:", 0);
  -[ICSearchResult setDisplayingSnippetCheckingResult:](self, "setDisplayingSnippetCheckingResult:", 0);
  -[ICSearchResult setIsDisplayingParticipantMatch:](self, "setIsDisplayingParticipantMatch:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "isPasswordProtected"))
    {
      objc_opt_class();
      ICDynamicCast();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D63BB8], "snippetForPasswordProtectedNote:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchResult setDisplayingSnippet:](self, "setDisplayingSnippet:", v9);
LABEL_14:

      goto LABEL_15;
    }
    -[ICSearchResult participantHighlightRegexMatchFinder](self, "participantHighlightRegexMatchFinder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v28 = 0;
      +[ICSearchResult authorNameToHighlightForNote:fromSearchResult:textCheckingResult:](ICSearchResult, "authorNameToHighlightForNote:fromSearchResult:textCheckingResult:", v7, self, &v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v28;
      if (v11)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared with %@"), CFSTR("Shared with %@"), 0, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v14, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSearchResult setDisplayingSnippet:](self, "setDisplayingSnippet:", v15);

        -[ICSearchResult displayingSnippet](self, "displayingSnippet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "rangeOfString:", v11);

        v18 = [ICSearchTextCheckingResult alloc];
        v19 = objc_msgSend(v12, "range") + v17;
        objc_msgSend(v12, "range");
        v21 = -[ICSearchTextCheckingResult initWithRange:](v18, "initWithRange:", v19, v20);

        -[ICSearchResult setDisplayingSnippetCheckingResult:](self, "setDisplayingSnippetCheckingResult:", v21);
        -[ICSearchResult setIsDisplayingParticipantMatch:](self, "setIsDisplayingParticipantMatch:", 1);
        v12 = (id)v21;
      }

    }
    -[ICSearchResult displayingSnippet](self, "displayingSnippet");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22
      || (v23 = (void *)v22,
          -[ICSearchResult displayingSnippetCheckingResult](self, "displayingSnippetCheckingResult"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          v23,
          !v24))
    {
      objc_msgSend(v7, "noteAsPlainTextWithoutTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ic_whitespaceAndNewlineCoalescedString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchResult setDisplayingSnippet:](self, "setDisplayingSnippet:", v26);

      -[ICSearchResult snippetHighlightRegexMatchFinder](self, "snippetHighlightRegexMatchFinder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchResult displayingSnippet](self, "displayingSnippet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstMatchInDocumentWithGlobalFallback:", v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchResult setDisplayingSnippetCheckingResult:](self, "setDisplayingSnippetCheckingResult:", v27);

      goto LABEL_14;
    }
  }
LABEL_15:

}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_object == (ICSearchIndexable *)*((_QWORD *)v4 + 4)
    && -[ICSearchResultConfiguration isEqual:](self->_configuration, "isEqual:", *((_QWORD *)v4 + 5));

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICSearchResult configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[ICSearchResult object](self, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchIndexingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(searchStringHash = %lu) %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (int64_t)compareByModificationDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[ICSearchResult object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (void)refetchObjectFromContext:(id)a3
{
  void *v4;
  void *v5;
  ICSearchIndexable *v6;
  ICSearchIndexable *object;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[ICSearchIndexable objectID](self->_object, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ICSearchIndexable objectID](self->_object, "objectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "existingObjectWithID:error:", v5, 0);
      v6 = (ICSearchIndexable *)objc_claimAutoreleasedReturnValue();
      object = self->_object;
      self->_object = v6;

    }
  }

}

- (id)attributedSummaryWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  -[ICSearchResult configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "foundAttachmentObjectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Found in attachments"), CFSTR("Found in attachments"), 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v15);

  }
  else
  {
    -[ICSearchResult snippetWithBaseAttributes:highlightColor:insideFrame:](self, "snippetWithBaseAttributes:highlightColor:insideFrame:", v11, v12, x, y, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)prepareFirstMatchingRangeWithAccessingObject:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  ICSearchResult *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a3;
  -[ICSearchResult setFirstMatchingRangeInNote:](self, "setFirstMatchingRangeInNote:", 0);
  v4 = objc_msgSend(v27, "searchResultType");
  if (v4 == 1)
  {
    objc_opt_class();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    if (!v17)
      goto LABEL_19;
    v18 = objc_msgSend(v17, "rangeInNote");
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v18, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self;
    v21 = v7;
    goto LABEL_10;
  }
  if (!v4)
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      objc_msgSend(v5, "searchableString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchResult highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstMatchInDocumentWithGlobalFallback:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_msgSend(v11, "range");
        v14 = objc_msgSend(v5, "textRangeForSearchRange:inSearchableString:", v12, v13, v8);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[ICSearchResult setFirstMatchingRangeInNote:](self, "setFirstMatchingRangeInNote:", v16);

      }
      goto LABEL_17;
    }
    if (!v6)
    {
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    -[ICSearchResult displayingSnippetCheckingResult](self, "displayingSnippetCheckingResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_14;
    objc_msgSend(v7, "contentAsPlainTextPreservingNewlines");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchResult highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstMatchInDocumentWithGlobalFallback:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_14:
      v24 = (void *)MEMORY[0x1E0CB3B18];
      v25 = objc_msgSend(v8, "range");
      objc_msgSend(v24, "valueWithRange:", v25, v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSearchResult setFirstMatchingRangeInNote:](self, "setFirstMatchingRangeInNote:", v11);
LABEL_17:

      goto LABEL_18;
    }
    v20 = self;
    v21 = 0;
LABEL_10:
    -[ICSearchResult setFirstMatchingRangeInNote:](v20, "setFirstMatchingRangeInNote:", v21);
    goto LABEL_18;
  }
LABEL_20:

}

+ (CGRect)boundingRectForAttributedString:(id)a3 fittingSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a3, "boundingRectWithSize:options:context:", 3, 0, a4.width + a4.width, a4.height + a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (BOOL)canFitAttributedString:(id)a3 ellipses:(id)a4 shouldPrefixWithEllipses:(BOOL)a5 insideFrame:(CGRect)a6 centered:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  BOOL v27;
  CGRect v29;
  CGRect v30;

  v7 = a7;
  height = a6.size.height;
  width = a6.size.width;
  v10 = a5;
  v13 = a3;
  v14 = a4;
  v15 = v13;
  v16 = v15;
  v17 = v15;
  if (v10)
  {
    v18 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v18, "insertAttributedString:atIndex:", v14, 0);
    v17 = (void *)objc_msgSend(v18, "copy");

  }
  objc_msgSend(v14, "size");
  objc_msgSend(a1, "boundingRectForAttributedString:fittingSize:", v14, width);
  v20 = 1.0;
  if (v7)
    v20 = 0.5;
  v21 = width * v20;
  v22 = fmax(height, ceil(v19));
  objc_msgSend(a1, "boundingRectForAttributedString:fittingSize:", v17, v21, v22);
  v30.origin.x = v23;
  v30.origin.y = v24;
  v30.size.width = v25;
  v30.size.height = v26;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = v21;
  v29.size.height = v22;
  v27 = CGRectContainsRect(v29, v30);

  return v27;
}

+ (id)attributesByHighlightingAttributes:(id)a3 withHighlightColor:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a4;
  if (v5)
  {
    v6 = v5;
    v7 = a3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DC3658];
    v9 = a3;
    objc_msgSend(v8, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
    v10 = a3;
  else
    v10 = (id)MEMORY[0x1E0C9AA70];
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DC1140]);
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

+ (id)attributedStringWithMatchHighlighted:(id)a3 textCheckingResult:(id)a4 usingAttributes:(id)a5 highlightColor:(id)a6 insideFrame:(CGRect)a7 isSnippetForParticipantMatch:(BOOL)a8 finishingUpRegexMatchFinder:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  const __CFString *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v62;
  id v63;
  const char *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint64_t *v75;
  id v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  id v89;
  uint64_t *v90;
  const char *v91;
  uint64_t v92;
  id v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  BOOL v98;
  CGRect v99;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a9;
  v70 = v21;
  v24 = objc_msgSend(v21, "copy");
  v25 = (void *)v24;
  v26 = (void *)MEMORY[0x1E0C9AA70];
  if (v24)
    v26 = (void *)v24;
  v27 = v26;

  v69 = v22;
  objc_msgSend(a1, "attributesByHighlightingAttributes:withHighlightColor:", v27, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("…"), v27);
  if (v20)
  {
    v68 = v23;
    v29 = a8;
    v30 = objc_msgSend(v20, "range");
    v32 = objc_msgSend(v19, "paragraphRangeForRange:", v30, v31);
    objc_msgSend(v19, "substringWithRange:", v32, v33);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = (const char *)(objc_msgSend(v20, "range") - v32);
    objc_msgSend(v20, "range");
    v37 = v36;
    v38 = objc_alloc(MEMORY[0x1E0CB3778]);
    if (v34)
      v39 = v34;
    else
      v39 = &stru_1E5C2F8C0;
    v40 = (void *)objc_msgSend(v38, "initWithString:attributes:", v39, v27);
    objc_msgSend(v40, "addAttributes:range:", v28, v35, v37);
    v99.origin.x = x;
    v99.origin.y = y;
    v99.size.width = width;
    v99.size.height = height;
    if (CGRectIsInfinite(v99))
    {
      v41 = v40;
      v23 = v68;
    }
    else
    {
      v81 = 0;
      v82 = &v81;
      v83 = 0x2020000000;
      v84 = 0;
      if (v29)
        goto LABEL_19;
      v84 = v35;
      objc_msgSend(v40, "string");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = &v35[v37];
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __174__ICSearchResult_attributedStringWithMatchHighlighted_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke;
      v87[3] = &unk_1E5C23030;
      v91 = v35;
      v92 = v37;
      v45 = v40;
      v88 = v45;
      v93 = a1;
      v46 = v71;
      v94 = x;
      v95 = y;
      v96 = width;
      v97 = height;
      v98 = v29;
      v63 = v46;
      v89 = v46;
      v90 = &v81;
      objc_msgSend(v66, "enumerateSubstringsInRange:options:usingBlock:", 0, v64, 259, v87);

      if (!v82[3])
      {
LABEL_19:
        v41 = v40;
        v23 = v68;
      }
      else
      {
        v67 = v45;
        v47 = objc_msgSend(v45, "length");
        v62 = v82[3];
        v48 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v67, "string");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "ic_isCharacterInlineAttachmentPrefix:", objc_msgSend(v65, "characterAtIndex:", v82[3] - 1));
        v50 = v47 - v62;

        v51 = v82[3];
        if (v49)
        {
          v82[3] = --v51;
          ++v50;
        }
        v23 = v68;
        objc_msgSend(v67, "ic_attributedSubstringFromRange:", v51, v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (id)objc_msgSend(v52, "mutableCopy");

        if (v82[3])
          objc_msgSend(v41, "insertAttributedString:atIndex:", v63, 0);
      }
      _Block_object_dispose(&v81, 8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64238], "snippetForContent:", v19);
    v42 = objc_claimAutoreleasedReturnValue();

    v43 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v42)
      v44 = (const __CFString *)v42;
    else
      v44 = &stru_1E5C2F8C0;
    v41 = (id)objc_msgSend(v43, "initWithString:attributes:", v44, v27);
    v19 = (id)v42;
  }
  if ((unint64_t)objc_msgSend(v41, "length") >= 0x100)
  {
    objc_msgSend(v41, "attributedSubstringFromRange:", 0, 255);
    v53 = objc_claimAutoreleasedReturnValue();

    v41 = (id)v53;
  }
  objc_msgSend(v41, "ic_attributedStringByReplacingNewlineCharactersWithWhiteSpace");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "finishUpHighlightingWithMatchFinder:forAttributedString:inRange:highlightedAttributes:", v23, v54, 0, objc_msgSend(v54, "length"), v28);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0;
  v82 = &v81;
  v83 = 0x3010000000;
  v85 = 0;
  v86 = 0;
  v84 = "";
  objc_msgSend(v55, "string");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v55, "length");
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __174__ICSearchResult_attributedStringWithMatchHighlighted_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke_2;
  v72[3] = &unk_1E5C23058;
  v75 = &v81;
  v58 = v55;
  v73 = v58;
  v76 = a1;
  v59 = v71;
  v74 = v59;
  v77 = x;
  v78 = y;
  v79 = width;
  v80 = height;
  objc_msgSend(v56, "enumerateSubstringsInRange:options:usingBlock:", 0, v57, 5, v72);

  objc_msgSend((id)objc_opt_class(), "finishUpHighlightingWithMatchFinder:forAttributedString:inRange:highlightedAttributes:", v23, v58, v82[4], v82[5], v28);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v81, 8);
  return v60;
}

void __174__ICSearchResult_attributedStringWithMatchHighlighted_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke(uint64_t a1, int a2, NSRange range1, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  NSUInteger location;
  NSRange v9;
  id v10;
  NSRange v11;
  NSRange v12;

  v11.length = range1.length;
  location = range1.location;
  v12 = *(NSRange *)(a1 + 56);
  v11.location = location;
  v9 = NSUnionRange(v11, v12);
  if (v9.length > 0xFF)
  {
    *a6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_attributedSubstringFromRange:", v9.location, v9.length);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 72), "canFitAttributedString:ellipses:shouldPrefixWithEllipses:insideFrame:centered:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104)))*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9.location;
    else
      *a6 = 1;

  }
}

void __174__ICSearchResult_attributedStringWithMatchHighlighted_textCheckingResult_usingAttributes_highlightColor_insideFrame_isSnippetForParticipantMatch_finishingUpRegexMatchFinder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  id v10;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v9 + 32) = 0;
  *(_QWORD *)(v9 + 40) = a3 + a4;
  objc_msgSend(*(id *)(a1 + 32), "ic_attributedSubstringFromRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 56), "canFitAttributedString:ellipses:shouldPrefixWithEllipses:insideFrame:centered:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88)) & 1) == 0)*a7 = 1;

}

+ (id)attributedStringWithMatchHighlighted:(id)a3 textCheckingResult:(id)a4 highlightColor:(id)a5 insideFrame:(CGRect)a6 finishingUpRegexMatchFinder:(id)a7
{
  return +[ICSearchResult attributedStringWithMatchHighlighted:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:](ICSearchResult, "attributedStringWithMatchHighlighted:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:", a3, a4, 0, a5, 0, a7, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

+ (id)finishUpHighlightingWithMatchFinder:(id)a3 forAttributedString:(id)a4 inRange:(_NSRange)a5 highlightedAttributes:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  NSRange v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  NSRange v38;
  NSRange v39;

  length = a5.length;
  location = a5.location;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v11;
  v14 = v13;
  if (location || length != objc_msgSend(v13, "length"))
  {
    v39.length = objc_msgSend(v14, "length");
    v38.location = location;
    v38.length = length;
    v39.location = 0;
    v17 = NSIntersectionRange(v38, v39);
    v15 = v17.location;
    objc_msgSend(v14, "ic_attributedSubstringFromRange:", v17.location, v17.length);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
    v16 = v14;
  }
  objc_msgSend(v16, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matchesInDocumentWithPerTokenFallback:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v14;
  if (objc_msgSend(v19, "count"))
  {
    v31 = v10;
    v21 = (void *)objc_msgSend(v14, "mutableCopy");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v33;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v22);
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v26), "range");
          objc_msgSend(v21, "addAttributes:range:", v12, v27 + v15, v28);
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v24);
    }

    v20 = (void *)objc_msgSend(v21, "copy");
    v10 = v31;
  }
  v29 = v20;

  return v29;
}

- (id)attributedTitleWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  -[ICSearchResult displayingTitle](self, "displayingTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchResult displayingTitleCheckingResult](self, "displayingTitleCheckingResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchResult titleHighlightRegexMatchFinder](self, "titleHighlightRegexMatchFinder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSearchResult attributedStringWithMatchHighlighted:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:](ICSearchResult, "attributedStringWithMatchHighlighted:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:", v13, v14, v12, v11, 0, v15, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSearchResult setTitleAttributedString:](self, "setTitleAttributedString:", v16);
  -[ICSearchResult setTitleAttributedStringInsideFrame:](self, "setTitleAttributedStringInsideFrame:", x, y, width, height);
  return -[ICSearchResult titleAttributedString](self, "titleAttributedString");
}

+ (id)authorNameToHighlightForNote:(id)a3 fromSearchResult:(id)a4 textCheckingResult:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "participantHighlightRegexMatchFinder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v28 = a5;
    objc_msgSend(v8, "displayingTitleCheckingResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v7;
    objc_msgSend(v7, "authorsExcludingCurrentUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v12 = 0;
    if (v34)
    {
      v13 = *(_QWORD *)v40;
      v31 = v11;
      v32 = v10;
      v30 = *(_QWORD *)v40;
      while (2)
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
          objc_msgSend(v16, "ic_localizedNameWithDefaultFormattingStyle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "participantHighlightRegexMatchFinder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstMatchInDocumentWithGlobalFallback:", v17);
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            if (v10)
            {
              v37 = 0u;
              v38 = 0u;
              v35 = 0u;
              v36 = 0u;
              objc_msgSend(v16, "ic_componentsForSearchHighlighting");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v20)
              {
                v33 = v12;
                v21 = *(_QWORD *)v36;
                while (2)
                {
                  for (i = 0; i != v20; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v36 != v21)
                      objc_enumerationMutation(v19);
                    v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
                    objc_msgSend(v8, "configuration");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "searchString");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = objc_msgSend(v23, "compare:options:", v25, 1);

                    if (!v26)
                    {
                      v20 = v17;
                      goto LABEL_20;
                    }
                  }
                  v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                  if (v20)
                    continue;
                  break;
                }
LABEL_20:
                v11 = v31;
                v10 = v32;
                v12 = v33;
                v13 = v30;
              }

            }
            else
            {
              v20 = v17;
            }

            if (v20)
            {

              if (v28)
              {
                v12 = objc_retainAutorelease(v12);
                *v28 = v12;
              }
              goto LABEL_31;
            }
          }
          else
          {

          }
          ++v14;
          v15 = v12;
        }
        while (v14 != v34);
        v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v34)
          continue;
        break;
      }
    }

    v20 = 0;
LABEL_31:
    v7 = v29;

  }
  else
  {
    v20 = 0;
    if (a5)
      *a5 = 0;
  }

  return v20;
}

+ (id)firstTextCheckingResultOfRegex:(id)a3 inDocumentText:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  v8 = 0;
  if (v5 && v7)
  {
    objc_msgSend(v5, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)snippetWithBaseAttributes:(id)a3 highlightColor:(id)a4 insideFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  ICSearchResult *v23;
  id v24;
  id v25;
  uint64_t *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__57;
  v35 = __Block_byref_object_dispose__57;
  v36 = 0;
  -[ICSearchResult displayingSnippet](self, "displayingSnippet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ICSearchResult object](self, "object");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ICSearchResult object](self, "object");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

    -[ICSearchResult object](self, "object");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__ICSearchResult_snippetWithBaseAttributes_highlightColor_insideFrame___block_invoke;
    v21[3] = &unk_1E5C23080;
    v18 = v15;
    v26 = &v31;
    v22 = v18;
    v23 = self;
    v24 = v11;
    v25 = v12;
    v27 = x;
    v28 = y;
    v29 = width;
    v30 = height;
    objc_msgSend(v17, "performBlockAndWait:", v21);

  }
  v19 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v19;
}

void __71__ICSearchResult_snippetWithBaseAttributes_highlightColor_insideFrame___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  if (objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(*(id *)(a1 + 40), "displayingSnippet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "initWithString:attributes:", v3, *(_QWORD *)(a1 + 48));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(*(id *)(a1 + 40), "setSnippetAttributedString:", 0);
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "isDisplayingParticipantMatch");
    v8 = *(void **)(a1 + 40);
    if ((v7 & 1) != 0)
      objc_msgSend(v8, "participantHighlightRegexMatchFinder");
    else
      objc_msgSend(v8, "snippetHighlightRegexMatchFinder");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "displayingSnippet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "displayingSnippetCheckingResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICSearchResult attributedStringWithMatchHighlighted:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:](ICSearchResult, "attributedStringWithMatchHighlighted:textCheckingResult:usingAttributes:highlightColor:insideFrame:isSnippetForParticipantMatch:finishingUpRegexMatchFinder:", v9, v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "isDisplayingParticipantMatch"), v15, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSnippetAttributedString:", v11);

    objc_msgSend(*(id *)(a1 + 40), "setSnippetAttributedStringInsideFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 40), "snippetAttributedString");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

- (ICSearchIndexable)object
{
  return self->_object;
}

- (BOOL)isMathNote
{
  return self->_mathNote;
}

- (void)setMathNote:(BOOL)a3
{
  self->_mathNote = a3;
}

- (ICSearchResultConfiguration)configuration
{
  return self->_configuration;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
}

- (NSRegularExpression)tipKitCheckRegex
{
  return self->_tipKitCheckRegex;
}

- (void)setTipKitCheckRegex:(id)a3
{
  objc_storeStrong((id *)&self->_tipKitCheckRegex, a3);
}

- (NSValue)firstMatchingRangeInNote
{
  return self->_firstMatchingRangeInNote;
}

- (void)setFirstMatchingRangeInNote:(id)a3
{
  objc_storeStrong((id *)&self->_firstMatchingRangeInNote, a3);
}

- (ICSearchIndexable)currentContextObject
{
  return self->_currentContextObject;
}

- (void)setCurrentContextObject:(id)a3
{
  objc_storeStrong((id *)&self->_currentContextObject, a3);
}

- (NSString)displayingTitle
{
  return self->_displayingTitle;
}

- (void)setDisplayingTitle:(id)a3
{
  objc_storeStrong((id *)&self->_displayingTitle, a3);
}

- (ICSearchResultRegexMatchFinder)titleHighlightRegexMatchFinder
{
  return self->_titleHighlightRegexMatchFinder;
}

- (void)setTitleHighlightRegexMatchFinder:(id)a3
{
  objc_storeStrong((id *)&self->_titleHighlightRegexMatchFinder, a3);
}

- (NSTextCheckingResult)displayingTitleCheckingResult
{
  return self->_displayingTitleCheckingResult;
}

- (void)setDisplayingTitleCheckingResult:(id)a3
{
  objc_storeStrong((id *)&self->_displayingTitleCheckingResult, a3);
}

- (NSAttributedString)titleAttributedString
{
  return self->_titleAttributedString;
}

- (void)setTitleAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_titleAttributedString, a3);
}

- (CGRect)titleAttributedStringInsideFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleAttributedStringInsideFrame.origin.x;
  y = self->_titleAttributedStringInsideFrame.origin.y;
  width = self->_titleAttributedStringInsideFrame.size.width;
  height = self->_titleAttributedStringInsideFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTitleAttributedStringInsideFrame:(CGRect)a3
{
  self->_titleAttributedStringInsideFrame = a3;
}

- (NSString)displayingSnippet
{
  return self->_displayingSnippet;
}

- (void)setDisplayingSnippet:(id)a3
{
  objc_storeStrong((id *)&self->_displayingSnippet, a3);
}

- (ICSearchResultRegexMatchFinder)snippetHighlightRegexMatchFinder
{
  return self->_snippetHighlightRegexMatchFinder;
}

- (void)setSnippetHighlightRegexMatchFinder:(id)a3
{
  objc_storeStrong((id *)&self->_snippetHighlightRegexMatchFinder, a3);
}

- (NSTextCheckingResult)displayingSnippetCheckingResult
{
  return self->_displayingSnippetCheckingResult;
}

- (void)setDisplayingSnippetCheckingResult:(id)a3
{
  objc_storeStrong((id *)&self->_displayingSnippetCheckingResult, a3);
}

- (NSAttributedString)snippetAttributedString
{
  return self->_snippetAttributedString;
}

- (void)setSnippetAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_snippetAttributedString, a3);
}

- (CGRect)snippetAttributedStringInsideFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snippetAttributedStringInsideFrame.origin.x;
  y = self->_snippetAttributedStringInsideFrame.origin.y;
  width = self->_snippetAttributedStringInsideFrame.size.width;
  height = self->_snippetAttributedStringInsideFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSnippetAttributedStringInsideFrame:(CGRect)a3
{
  self->_snippetAttributedStringInsideFrame = a3;
}

- (BOOL)isDisplayingParticipantMatch
{
  return self->_isDisplayingParticipantMatch;
}

- (void)setIsDisplayingParticipantMatch:(BOOL)a3
{
  self->_isDisplayingParticipantMatch = a3;
}

- (ICSearchResultRegexMatchFinder)participantHighlightRegexMatchFinder
{
  return self->_participantHighlightRegexMatchFinder;
}

- (void)setParticipantHighlightRegexMatchFinder:(id)a3
{
  objc_storeStrong((id *)&self->_participantHighlightRegexMatchFinder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantHighlightRegexMatchFinder, 0);
  objc_storeStrong((id *)&self->_snippetAttributedString, 0);
  objc_storeStrong((id *)&self->_displayingSnippetCheckingResult, 0);
  objc_storeStrong((id *)&self->_snippetHighlightRegexMatchFinder, 0);
  objc_storeStrong((id *)&self->_displayingSnippet, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_displayingTitleCheckingResult, 0);
  objc_storeStrong((id *)&self->_titleHighlightRegexMatchFinder, 0);
  objc_storeStrong((id *)&self->_displayingTitle, 0);
  objc_storeStrong((id *)&self->_currentContextObject, 0);
  objc_storeStrong((id *)&self->_firstMatchingRangeInNote, 0);
  objc_storeStrong((id *)&self->_tipKitCheckRegex, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_decomposedHighlightInfo, 0);
}

- (void)initWithObject:(os_log_t)log configuration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "No identifier for main context object search result", v1, 2u);
}

@end

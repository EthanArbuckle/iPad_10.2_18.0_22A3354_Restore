@implementation SPUIResultsViewController

- (void)_pushSectionsUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  char v13;
  char v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  SPUIResultsViewController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  int v40;
  BOOL v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  uint64_t v56;
  unsigned int v57;
  void *v58;
  void *v59;
  SPUIResultsViewController *v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  -[SPUIResultsViewController resultSections](self, "resultSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)SPBlueButtonBehavior();
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB06F0]);

  v62 = v4;
  objc_msgSend(v4, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
    v11 = 1;
  else
    v11 = objc_msgSend(v6, "renderHorizontallyWithOtherResultsInCategory");

  if (v7)
    v12 = 0;
  else
    v12 = v11;
  v13 = objc_msgSend(v6, "noGoTakeover");
  if (v7 == (void *)1 || v12)
  {
    if (v9)
    {
      -[SearchUIResultsViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_opt_respondsToSelector();
      if ((v9 & 1) != 0
        && (-[SearchUIResultsViewController delegate](self, "delegate"),
            v11 = objc_claimAutoreleasedReturnValue(),
            (objc_msgSend((id)v11, "optOutOfGoButton") & 1) != 0))
      {
        v14 = 1;
        LOBYTE(v9) = 1;
      }
      else
      {
        if ((v13 & 1) == 0)
        {
          if ((v9 & 1) != 0)

          goto LABEL_31;
        }
        v14 = 1;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    if (v7 == (void *)2)
      goto LABEL_25;
    v14 = 0;
    LOBYTE(v9) = 0;
  }
  -[SPUIResultsViewController asTypedSearchResult](self, "asTypedSearchResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6 == v15 && objc_msgSend(v6, "type") == 29;

  if ((v9 & 1) != 0)
  if ((v14 & 1) != 0)
  {

    if (v16)
      goto LABEL_31;
LABEL_25:
    -[SPUIResultsViewController asTypedSearchResult](self, "asTypedSearchResult");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = self;
    v19 = 6;
    v20 = 0;
    goto LABEL_32;
  }
  if (!v16)
    goto LABEL_25;
LABEL_31:
  v17 = v6;
  v18 = self;
  v19 = 1;
  v20 = v17;
LABEL_32:
  -[SPUIResultsViewController changeTextFieldsReturnKeyType:withGoTakeoverResult:](v18, "changeTextFieldsReturnKeyType:withGoTakeoverResult:", v19, v20);
  if (-[SPUIResultsViewController hasResultsWaitingToUpdate](self, "hasResultsWaitingToUpdate"))
  {
    -[SearchUIResultsViewController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "willUpdateFromResultsWithHighlightedResult:viewController:", v17, self);

    -[SPUIResultsViewController setHasResultsWaitingToUpdate:](self, "setHasResultsWaitingToUpdate:", 0);
  }
  -[SPUIResultsViewController resultSections](self, "resultSections");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = (void *)MEMORY[0x24BDBD1A8];
  if (v22)
    v24 = (void *)v22;
  v25 = v24;

  -[SearchUIResultsViewController searchField](self, "searchField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "searchText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = self;
  v61 = v6;
  v58 = v27;
  v59 = v17;
  if (v6)
  {
    v28 = objc_msgSend(v6, "queryId");
    if (objc_msgSend(v27, "length"))
      v29 = v28 != -[SPUIResultsViewController previousQueryId](self, "previousQueryId");
    else
      v29 = 1;
    v57 = v29;
    -[SPUIResultsViewController setPreviousQueryId:](self, "setPreviousQueryId:", v28);
  }
  else
  {
    v57 = 1;
  }
  v30 = SPSuggestionDetailTextBehavior();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v25;
  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v71 != v64)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        objc_msgSend(v32, "results");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v67;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v67 != v36)
                objc_enumerationMutation(v33);
              objc_msgSend(MEMORY[0x24BE85288], "cardSectionsForRenderingResult:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "firstObject");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v40 = objc_msgSend(v39, "suggestionType");
                v41 = v30 != 1 || v40 == 0;
                v42 = !v41;
                if (!v30 || v42)
                  objc_msgSend(v39, "setDetailText:", 0);
              }

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
          }
          while (v35);
        }

      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v65);
  }

  objc_msgSend(MEMORY[0x24BE85288], "cardForRenderingResult:", v61);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "backgroundColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[SPUIResultsViewController searchEntity](v60, "searchEntity");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "entityBackgroundColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      -[SPUIResultsViewController searchEntity](v60, "searchEntity");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setEntityBackgroundColor:", v44);

      -[SPUIResultsViewController backgroundColorDelegate](v60, "backgroundColorDelegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "didUpdateBackgroundColorForViewController:", v60);

    }
  }
  -[SearchUIResultsViewController updateWithResultSections:resetScrollPoint:animated:](v60, "updateWithResultSections:resetScrollPoint:animated:", obj, v57, -[SPUIResultsViewController shouldAnimateUpdates](v60, "shouldAnimateUpdates"));
  -[SearchUIResultsViewController searchField](v60, "searchField");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isFirstResponder");

  v51 = v59;
  if ((v50 & 1) == 0)
  {

    v51 = 0;
  }
  -[SPUIResultsViewController forceHighlightForResult:](v60, "forceHighlightForResult:", v51);
  v52 = objc_msgSend(obj, "count");
  v53 = MEMORY[0x24BEB0818];
  v54 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
  if (v52)
  {
    if (!v54)
    {
      SPUIInitLogging();
      v54 = *(NSObject **)(v53 + 40);
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = v54;
      v56 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 134217984;
      v75 = v56;
      _os_log_impl(&dword_22E078000, v55, OS_LOG_TYPE_DEFAULT, "update with section count %lu", buf, 0xCu);

    }
  }
  else
  {
    if (!v54)
    {
      SPUIInitLogging();
      v54 = *(NSObject **)(v53 + 40);
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E078000, v54, OS_LOG_TYPE_DEFAULT, "no results", buf, 2u);
    }
  }

}

- (void)setHasResultsWaitingToUpdate:(BOOL)a3
{
  self->_hasResultsWaitingToUpdate = a3;
}

- (NSArray)resultSections
{
  return (NSArray *)objc_getProperty(self, a2, 1088, 1);
}

- (id)asTypedSearchResult
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "type") == 30)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (SFResultSection)suggestionsSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 1096, 1);
}

- (BOOL)shouldAnimateUpdates
{
  return self->_shouldAnimateUpdates;
}

- (void)setPreviousQueryId:(unint64_t)a3
{
  self->_previousQueryId = a3;
}

- (BOOL)isHighlighting
{
  return self->_isHighlighting;
}

- (BOOL)hasResultsWaitingToUpdate
{
  return self->_hasResultsWaitingToUpdate;
}

- (void)forceHighlightForResult:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (-[SPUIResultsViewController allowHighlightingWhenInactive](self, "allowHighlightingWhenInactive")
    || (-[SearchUIResultsViewController delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isActiveViewController:", self),
        v4,
        v5))
  {
    self->_isHighlighting = 1;
    -[SearchUIResultsViewController searchField](self, "searchField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasMarkedText");

    if ((v7 & 1) == 0)
      -[SearchUIResultsViewController highlightResult:](self, "highlightResult:", v8);
    -[SPUIResultsViewController setHighlightedResult:](self, "setHighlightedResult:", v8);
    self->_isHighlighting = 0;
  }

}

- (void)setHighlightedResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (void)changeTextFieldsReturnKeyType:(int64_t)a3 withGoTakeoverResult:(id)a4
{
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  if (-[SPUIResultsViewController allowHighlightingWhenInactive](self, "allowHighlightingWhenInactive")
    || (-[SearchUIResultsViewController delegate](self, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isActiveViewController:", self),
        v6,
        v7))
  {
    if (a3 == 1)
      v8 = v12;
    else
      v8 = 0;
    -[SPUIResultsViewController setGoTakeoverResult:](self, "setGoTakeoverResult:", v8);
    -[SearchUIResultsViewController searchField](self, "searchField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "returnKeyType");

    if (v10 != a3)
    {
      -[SearchUIResultsViewController searchField](self, "searchField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setReturnKeyType:", a3);

      +[SPUITextField updateBlueButton](SPUITextField, "updateBlueButton");
    }
  }

}

- (BOOL)allowHighlightingWhenInactive
{
  return self->_allowHighlightingWhenInactive;
}

- (void)setGoTakeoverResult:(id)a3
{
  objc_storeStrong((id *)&self->_goTakeoverResult, a3);
}

- (SPUISearchModel)model
{
  return (SPUISearchModel *)objc_getProperty(self, a2, 1064, 1);
}

- (id)searchUIBackgroundColor
{
  void *v2;
  void *v3;

  -[SPUIResultsViewController searchEntity](self, "searchEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entityBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SPSearchEntity)searchEntity
{
  return (SPSearchEntity *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setAllowHighlightingWhenInactive:(BOOL)a3
{
  self->_allowHighlightingWhenInactive = a3;
}

- (SPUIResultsViewController)initWithSearchModel:(id)a3
{
  return -[SPUIResultsViewController initWithSearchModel:searchEntity:](self, "initWithSearchModel:searchEntity:", a3, 0);
}

- (SPUIResultsViewController)initWithSearchModel:(id)a3 searchEntity:(id)a4
{
  id v7;
  id v8;
  SPUIResultsViewController *v9;
  SPUIResultsViewController *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPUIResultsViewController;
  v9 = -[SPUIResultsViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[SPUIResultsViewController view](v9, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    -[SearchUIResultsViewController setShouldUseInsetRoundedSections:](v10, "setShouldUseInsetRoundedSections:", 0);
    -[SPUIResultsViewController setHasResultsWaitingToUpdate:](v10, "setHasResultsWaitingToUpdate:", 0);
    objc_msgSend(v7, "setDelegate:", v10);
    objc_msgSend(v7, "setMaxUISuggestions:", 0x7FFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)&v10->_model, a3);
    -[SPUIResultsViewController setSearchEntity:](v10, "setSearchEntity:", v8);
    -[SearchUIResultsViewController setRestorationContextClass:](v10, "setRestorationContextClass:", objc_opt_class());
  }

  return v10;
}

- (void)setSearchEntity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (void)searchAgentUpdatedResults:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  os_signpost_id_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BEB0818];
  v6 = *(NSObject **)(MEMORY[0x24BEB0818] + 32);
  if (!v6)
  {
    SPUIInitLogging();
    v6 = *(NSObject **)(v5 + 32);
  }
  v7 = os_signpost_id_generate(v6);
  v8 = *(void **)(v5 + 32);
  if (!v8)
  {
    SPUIInitLogging();
    v8 = *(void **)(v5 + 32);
  }
  v9 = v8;
  v10 = v9;
  v11 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "tableUpdate", (const char *)&unk_22E0A3E97, buf, 2u);
  }

  if (objc_msgSend(v4, "queryPartiallyComplete"))
  {
    if (self->_startTime)
      sp_analytics_log_timing();
    self->_startTime = 0;
  }
  else if (objc_msgSend(v4, "queryComplete"))
  {
    -[SPUIResultsViewController finishedGettingResults:](self, "finishedGettingResults:", 1);
  }
  else if (self->_startTime)
  {
    sp_analytics_log_timing();
  }
  objc_msgSend(v4, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "wantsCompletions") & 1) != 0)
  {
    v27 = v7 - 1;
    v28 = v7;
    -[SPUIResultsViewController setSuggestionsSection:](self, "setSuggestionsSection:", 0);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v12;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      v17 = *MEMORY[0x24BEB06B8];
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v19, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v17);

          if (v21)
          {
            -[SPUIResultsViewController setSuggestionsSection:](self, "setSuggestionsSection:", v19);
            goto LABEL_28;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_28:

    v11 = v27;
    v7 = v28;
    v5 = MEMORY[0x24BEB0818];
    v12 = v26;
  }
  else
  {
    -[SPUIResultsViewController clearSuggestionSection](self, "clearSuggestionSection");
  }
  -[SPUIResultsViewController setQueryJustHasTopHits:](self, "setQueryJustHasTopHits:", objc_msgSend(v4, "queryJustHasTopHits"));
  if ((objc_msgSend(v4, "queryPartiallyComplete") & 1) != 0 || (objc_msgSend(v4, "queryComplete") & 1) != 0)
  {
    objc_msgSend(v4, "searchThroughSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIResultsViewController setSearchThroughSection:](self, "setSearchThroughSection:", v22);

  }
  else
  {
    -[SPUIResultsViewController setSearchThroughSection:](self, "setSearchThroughSection:", 0);
  }
  -[SPUIResultsViewController setResultSections:](self, "setResultSections:", v12);
  -[SPUIResultsViewController setHasResultsWaitingToUpdate:](self, "setHasResultsWaitingToUpdate:", 1);
  -[SPUIResultsViewController _pushSectionsUpdate](self, "_pushSectionsUpdate");
  v23 = *(void **)(v5 + 32);
  if (!v23)
  {
    SPUIInitLogging();
    v23 = *(void **)(v5 + 32);
  }
  v24 = v23;
  v25 = v24;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v25, OS_SIGNPOST_INTERVAL_END, v7, "tableUpdate", " enableTelemetry=YES ", buf, 2u);
  }

}

- (void)setSuggestionsSection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (void)setSearchThroughSection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (void)setResultSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (void)setQueryJustHasTopHits:(BOOL)a3
{
  self->_queryJustHasTopHits = a3;
}

- (void)clearSuggestionSection
{
  -[SPUIResultsViewController setSuggestionsSection:](self, "setSuggestionsSection:", 0);
}

- (void)finishedGettingResults:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = a3;
  -[SPUIResultsViewController didFinishGettingAllResultsHandler](self, "didFinishGettingAllResultsHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SPUIResultsViewController didFinishGettingAllResultsHandler](self, "didFinishGettingAllResultsHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
  -[SPUIResultsViewController loadingView](self, "loadingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SPUIResultsViewController loadingView](self, "loadingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);

    -[SPUIResultsViewController loadingView](self, "loadingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLoadingState:", 1);

    -[SPUIResultsViewController loadingViewTimer](self, "loadingViewTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[SearchUIResultsViewController contentScrollView](self, "contentScrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    v13[4] = self;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__SPUIResultsViewController_finishedGettingResults___block_invoke;
    v14[3] = &unk_24F9D5CC8;
    v14[4] = self;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__SPUIResultsViewController_finishedGettingResults___block_invoke_2;
    v13[3] = &unk_24F9D5CC8;
    objc_msgSend(MEMORY[0x24BE85288], "performAnimatableChanges:animated:completion:", v14, 1, v13);
  }
}

- (id)didFinishGettingAllResultsHandler
{
  return self->didFinishGettingAllResultsHandler;
}

void __46__SPUIResultsViewController_unhideLoadingView__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)unhideLoadingView
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  -[SPUIResultsViewController loadingView](self, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "loadingState");

  if (!v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __46__SPUIResultsViewController_unhideLoadingView__block_invoke;
    v5[3] = &unk_24F9D5CC8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x24BE85288], "performAnimatableChanges:", v5);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPUIResultsViewController;
  -[SPUIResultsViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[SPUIResultsViewController loadingView](self, "loadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "loadingState");

  if (!v5)
  {
    -[SPUIResultsViewController loadingView](self, "loadingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[SPUIResultsViewController loadingViewTimer](self, "loadingViewTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[SPUIResultsViewController setLoadingViewTimer:](self, "setLoadingViewTimer:", 0);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_unhideLoadingView, 0, 0, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIResultsViewController setLoadingViewTimer:](self, "setLoadingViewTimer:", v8);

  }
}

- (SearchUILoadingView)loadingView
{
  return (SearchUILoadingView *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setLoadingViewTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (NSTimer)loadingViewTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1136, 1);
}

- (SFSearchResult)goTakeoverResult
{
  return self->_goTakeoverResult;
}

- (void)setUseLoadingView:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_useLoadingView = a3;
  if (a3
    && (-[SPUIResultsViewController loadingView](self, "loadingView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v6 = (void *)objc_opt_new();
    -[SPUIResultsViewController setLoadingView:](self, "setLoadingView:", v6);

    -[SPUIResultsViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIResultsViewController loadingView](self, "loadingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", v8, 0);

    v9 = (void *)MEMORY[0x24BE85220];
    -[SPUIResultsViewController loadingView](self, "loadingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fillContainerWithView:", v10);

    -[SearchUIResultsViewController contentScrollView](self, "contentScrollView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);

  }
  else
  {
    -[SPUIResultsViewController loadingView](self, "loadingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[SPUIResultsViewController setLoadingView:](self, "setLoadingView:", 0);
  }
}

- (UISearchToken)searchToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SPUIResultsViewController searchEntity](self, "searchEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPUISearchHeader tokenFromSearchEntity:](SPUISearchHeader, "tokenFromSearchEntity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUIResultsViewController searchEntity](self, "searchEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRepresentedObject:", v6);

  return (UISearchToken *)v4;
}

- (BOOL)isResultOriginalSearchSuggestion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPUIResultsViewController actualSearchSuggestionResult](self, "actualSearchSuggestionResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (BOOL)searchAgentHasWindow:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SPUIResultsViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (unint64_t)currentDeviceAuthenticationState
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x24BEB0840];
  -[SPUIResultsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "deviceAuthenticationStateForView:", v3);

  return v4;
}

void __52__SPUIResultsViewController_finishedGettingResults___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentScrollView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __52__SPUIResultsViewController_finishedGettingResults___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setLoadingView:", 0);
}

- (void)invalidateContentHeight
{
  -[SPUIResultsViewController setQueryJustHasTopHits:](self, "setQueryJustHasTopHits:", 0);
  -[SPUIResultsViewController setOldContentSize:](self, "setOldContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)searchAgentFinishedQueryWithoutAdditionalResults:(id)a3
{
  -[SPUIResultsViewController finishedGettingResults:](self, "finishedGettingResults:", 0);
}

- (void)searchAgentClearedResults:(id)a3
{
  -[SearchUIResultsViewController updateWithResultSections:resetScrollPoint:](self, "updateWithResultSections:resetScrollPoint:", MEMORY[0x24BDBD1A8], 1);
  -[SPUIResultsViewController setSuggestionsSection:](self, "setSuggestionsSection:", 0);
  -[SPUIResultsViewController setResultSections:](self, "setResultSections:", 0);
  -[SPUIResultsViewController setSearchThroughSection:](self, "setSearchThroughSection:", 0);
  -[SPUIResultsViewController setOldContentSize:](self, "setOldContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (SFSearchResult)actualSearchSuggestionResult
{
  void *v2;
  void *v3;
  void *v4;

  -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFSearchResult *)v4;
}

- (id)makeAsYouTypeSuggestionSearchResultWithSearchString:(id)a3 detailText:(id)a4 suggestionIdentifier:(id)a5 queryContext:(id)a6
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v9 = *MEMORY[0x24BE84AD0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  if (objc_msgSend(v11, "isEqualToString:", v9))
    v14 = 6;
  else
    v14 = 14;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F98]), "initWithIdentifier:suggestion:query:score:type:", v11, v13, v13, v14, 1.0);

  objc_msgSend(v15, "setDetailText:", v12);
  objc_msgSend(MEMORY[0x24BEB0318], "buildResultWithSuggestion:queryContext:", v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)searchUpdatedWithString:(id)a3 tokenEntity:(id)a4 queryId:(unint64_t)a5 wantsCompletions:(BOOL)a6 keyboardLanguage:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  SPUIResultsViewController *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id obj;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v8 = a6;
  v78 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  self->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  -[SearchUIResultsViewController setQueryString:](self, "setQueryString:", v12);
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(v13, "tokenText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (!v16)
    {
      -[SPUIResultsViewController clearSuggestionSection](self, "clearSuggestionSection");
      -[SPUIResultsViewController setResultSections:](self, "setResultSections:", 0);
      -[SPUIResultsViewController setSearchThroughSection:](self, "setSearchThroughSection:", 0);
      -[SPUIResultsViewController _pushSectionsUpdate](self, "_pushSectionsUpdate");
      goto LABEL_43;
    }
  }
  if (!v8)
  {
    -[SPUIResultsViewController clearSuggestionSection](self, "clearSuggestionSection");
    goto LABEL_43;
  }
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setSearchString:", v12);
  objc_msgSend(v17, "setKeyboardLanguage:", v14);
  objc_msgSend(v17, "setQueryIdent:", a5);
  -[SPUIResultsViewController makeAsYouTypeSuggestionSearchResultWithSearchString:detailText:suggestionIdentifier:queryContext:](self, "makeAsYouTypeSuggestionSearchResultWithSearchString:detailText:suggestionIdentifier:queryContext:", v12, 0, *MEMORY[0x24BE84AD0], v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_DETAIL_WEB"), &stru_24F9D6A70, CFSTR("Search"));
  v20 = objc_claimAutoreleasedReturnValue();

  v68 = (void *)v20;
  -[SPUIResultsViewController makeAsYouTypeSuggestionSearchResultWithSearchString:detailText:suggestionIdentifier:queryContext:](self, "makeAsYouTypeSuggestionSearchResultWithSearchString:detailText:suggestionIdentifier:queryContext:", v12, v20, *MEMORY[0x24BE84AD8], v17);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v47 = 1;
    goto LABEL_39;
  }
  -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "results");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  v25 = objc_msgSend(v24, "count");
  v67 = v18;
  v66 = v25 == 0;
  v65 = v24;
  if (!v25)
  {
    objc_msgSend(v24, "addObject:", v18);
    objc_msgSend(v24, "addObject:", v70);
    goto LABEL_35;
  }
  v64 = v17;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v26 = v24;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (!v27)
  {

    goto LABEL_35;
  }
  v28 = v27;
  v59 = self;
  v60 = v14;
  v61 = v12;
  v62 = v13;
  v29 = 0;
  obj = v26;
  v72 = *(_QWORD *)v74;
  v30 = *MEMORY[0x24BE84A88];
  v69 = *MEMORY[0x24BE84A90];
  v31 = -1;
  v32 = -1;
  while (2)
  {
    v33 = 0;
    v63 = v29 + v28;
    do
    {
      if (*(_QWORD *)v74 != v72)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v33);
      objc_msgSend(v34, "resultBundleId", v59, v60, v61);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", v30);

      if ((v36 & 1) != 0)
      {
        v32 = v29 + v33;
      }
      else
      {
        objc_msgSend(v34, "resultBundleId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToString:", v69);

        if (v38)
        {
          objc_msgSend(MEMORY[0x24BE85288], "cardSectionsForRenderingResult:", v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BE85288], "cardSectionsForRenderingResult:", v70);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v40, "detailText");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "text");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v42, "detailText");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setText:", v44);

            }
          }

          v31 = v29 + v33;
        }
      }
      if ((v32 & 0x8000000000000000) == 0 && (v31 & 0x8000000000000000) == 0)
      {
        v46 = obj;

        v14 = v60;
        v12 = v61;
        self = v59;
        v17 = v64;
LABEL_28:
        objc_msgSend(v46, "objectAtIndexedSubscript:", v32);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIResultsViewController replaceResult:withResult:](self, "replaceResult:withResult:", v48, v67);

        -[SPUIResultsViewController highlightedResult](self, "highlightedResult");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", v32);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49 == v50)
          -[SPUIResultsViewController forceHighlightForResult:](self, "forceHighlightForResult:", v67);
        objc_msgSend(v46, "replaceObjectAtIndex:withObject:", v32, v67);
        goto LABEL_31;
      }
      ++v33;
    }
    while (v28 != v33);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    v29 = v63;
    if (v28)
      continue;
    break;
  }
  v46 = obj;

  v14 = v60;
  v12 = v61;
  self = v59;
  v17 = v64;
  if ((v32 & 0x8000000000000000) == 0)
    goto LABEL_28;
LABEL_31:
  v13 = v62;
  if ((v31 & 0x8000000000000000) == 0)
  {
    objc_msgSend(obj, "objectAtIndexedSubscript:", v31);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIResultsViewController replaceResult:withResult:](self, "replaceResult:withResult:", v51, v70);

    objc_msgSend(obj, "replaceObjectAtIndex:withObject:", v31, v70);
  }
LABEL_35:
  -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "mutableDeepCopy");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = objc_alloc(MEMORY[0x24BEB0250]);
    -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v55, "initWithSection:", v53);
  }
  v56 = (void *)v54;

  objc_msgSend(v56, "setResults:", v65);
  -[SPUIResultsViewController setSuggestionsSection:](self, "setSuggestionsSection:", v56);

  v18 = v67;
  v47 = v66;
LABEL_39:
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "isRunningTest");

  if (v47 && !v58)
    -[SPUIResultsViewController _pushSectionsUpdate](self, "_pushSectionsUpdate");

LABEL_43:
}

- (CGSize)contentSize
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  if (-[SPUIResultsViewController queryJustHasTopHits](self, "queryJustHasTopHits"))
  {
    -[SPUIResultsViewController oldContentSize](self, "oldContentSize");
  }
  else
  {
    -[SearchUIResultsViewController sections](self, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)SPUIResultsViewController;
      -[SearchUIResultsViewController contentSize](&v9, sel_contentSize);
    }
    else
    {
      v7 = *MEMORY[0x24BDBF148];
      v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }
    -[SPUIResultsViewController setOldContentSize:](self, "setOldContentSize:", v7, v8);
    -[SPUIResultsViewController oldContentSize](self, "oldContentSize");
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)_hasRealSuggestions
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SPUIResultsViewController suggestionsSection](self, "suggestionsSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    -[SPUIResultsViewController asTypedSearchResult](self, "asTypedSearchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIResultsViewController forceHighlightForResult:](self, "forceHighlightForResult:", v4);

  }
  else
  {
    -[SPUIResultsViewController forceHighlightForResult:](self, "forceHighlightForResult:", 0);
  }
  -[SPUIResultsViewController changeTextFieldsReturnKeyType:withGoTakeoverResult:](self, "changeTextFieldsReturnKeyType:withGoTakeoverResult:", 6, 0);
}

- (void)setRestorationContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPUIResultsViewController;
  -[SearchUIResultsViewController setRestorationContext:](&v8, sel_setRestorationContext_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIResultsViewController setSections:](self, "setSections:", v5);

    objc_msgSend(v4, "searchEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIResultsViewController setSearchEntity:](self, "setSearchEntity:", v6);

    objc_msgSend(v4, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIResultsViewController setQueryString:](self, "setQueryString:", v7);

  }
}

- (id)restorationContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPUIResultsViewController;
  -[SearchUIResultsViewController restorationContext](&v8, sel_restorationContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIResultsViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSections:", v4);

  -[SPUIResultsViewController searchEntity](self, "searchEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchEntity:", v5);

  -[SearchUIResultsViewController queryString](self, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchString:", v6);

  return v3;
}

- (void)highlightResultAfterUnmarkingText
{
  id v3;

  -[SPUIResultsViewController highlightedResult](self, "highlightedResult");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SPUIResultsViewController forceHighlightForResult:](self, "forceHighlightForResult:", v3);

}

- (void)purgeMemory
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPUIResultsViewController;
  -[SearchUIResultsViewController purgeMemory](&v3, sel_purgeMemory);
  -[SPUIResultsViewController setResultSections:](self, "setResultSections:", 0);
  -[SPUIResultsViewController setSuggestionsSection:](self, "setSuggestionsSection:", 0);
}

- (void)setDidFinishGettingAllResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (SearchUIBackgroundColorDelegate)backgroundColorDelegate
{
  return (SearchUIBackgroundColorDelegate *)objc_loadWeakRetained((id *)&self->_backgroundColorDelegate);
}

- (void)setBackgroundColorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundColorDelegate, a3);
}

- (BOOL)useLoadingView
{
  return self->_useLoadingView;
}

- (void)setShouldAnimateUpdates:(BOOL)a3
{
  self->_shouldAnimateUpdates = a3;
}

- (SFResultSection)searchThroughSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 1104, 1);
}

- (unint64_t)previousQueryId
{
  return self->_previousQueryId;
}

- (SFSearchResult)highlightedResult
{
  return (SFSearchResult *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setLoadingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (BOOL)queryJustHasTopHits
{
  return self->_queryJustHasTopHits;
}

- (CGSize)oldContentSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_oldContentSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOldContentSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_oldContentSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingViewTimer, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_highlightedResult, 0);
  objc_storeStrong((id *)&self->_searchThroughSection, 0);
  objc_storeStrong((id *)&self->_suggestionsSection, 0);
  objc_storeStrong((id *)&self->_resultSections, 0);
  objc_destroyWeak((id *)&self->_backgroundColorDelegate);
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_goTakeoverResult, 0);
  objc_storeStrong(&self->didFinishGettingAllResultsHandler, 0);
}

@end

@implementation STSSearchDropDownViewController

- (STSSearchDropDownViewController)initWithSearchModel:(id)a3
{
  id v5;
  STSSearchDropDownViewController *v6;
  STSSearchDropDownViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  CategoriesDataSource *v11;
  CategoriesDataSource *categoriesDataSource;
  SuggestionsDataSource *v13;
  SuggestionsDataSource *suggestionsDataSource;
  STSDropDownRootView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)STSSearchDropDownViewController;
  v6 = -[STSSearchDropDownViewController init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    -[STSSearchDropDownViewController view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[STSSearchDropDownViewController view](v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_storeStrong((id *)&v7->_searchModel, a3);
    v11 = -[CategoriesDataSource initWithSearchModel:]([CategoriesDataSource alloc], "initWithSearchModel:", v5);
    categoriesDataSource = v7->_categoriesDataSource;
    v7->_categoriesDataSource = v11;

    v13 = -[SuggestionsDataSource initWithSearchModel:]([SuggestionsDataSource alloc], "initWithSearchModel:", v5);
    suggestionsDataSource = v7->_suggestionsDataSource;
    v7->_suggestionsDataSource = v13;

    -[CategoriesDataSource setSelectionDelegate:](v7->_categoriesDataSource, "setSelectionDelegate:", v7);
    -[CategoriesDataSource setUpdateDelegate:](v7->_categoriesDataSource, "setUpdateDelegate:", v7);
    -[SuggestionsDataSource setSelectionDelegate:](v7->_suggestionsDataSource, "setSelectionDelegate:", v7);
    -[SuggestionsDataSource setUpdateDelgate:](v7->_suggestionsDataSource, "setUpdateDelgate:", v7);
    v15 = objc_alloc_init(STSDropDownRootView);
    -[STSDropDownRootView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 1);
    -[STSSearchDropDownViewController setView:](v7, "setView:", v15);
    -[STSSearchDropDownViewController view](v7, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMasksToBounds:", 1);

    -[STSSearchDropDownViewController view](v7, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerRadius:", 6.0);

    -[STSSearchDropDownViewController view](v7, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "CGColor");
    -[STSSearchDropDownViewController view](v7, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBorderColor:", v23);

  }
  return v7;
}

- (void)setSceneIdentifier:(id)a3
{
  NSString **p_sceneIdentifier;
  id v6;

  p_sceneIdentifier = &self->_sceneIdentifier;
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);
  v6 = a3;
  -[PopUpPlugin setSceneIdentifier:](self->_popUpPlugin, "setSceneIdentifier:", *p_sceneIdentifier);

}

- (void)close
{
  NSString *query;
  id WeakRetained;

  self->_popUpShowing = 3;
  query = self->_query;
  self->_query = 0;

  -[PopUpPlugin close](self->_popUpPlugin, "close");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "searchDropDownViewControllerDidDismiss");

}

- (void)showCategories
{
  void *v3;
  uint64_t v4;
  PopUpPlugin *popUpPlugin;
  id WeakRetained;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sts_legalNoticeCount");

  if (v4 >= 3)
  {
    if (self->_popUpShowing == 1)
    {
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        -[CategoriesDataSource sendRankSectionsFeedback](self->_categoriesDataSource, "sendRankSectionsFeedback");
        -[STSSearchDropDownViewController sendVisibleResultsFeedback](self, "sendVisibleResultsFeedback");
      }
    }
    else
    {
      -[PopUpPlugin setDataSource:](self->_popUpPlugin, "setDataSource:", self->_categoriesDataSource);
      -[PopUpPlugin setDelegate:](self->_popUpPlugin, "setDelegate:", self->_categoriesDataSource);
      popUpPlugin = self->_popUpPlugin;
      if (self->_popUpShowing == 3)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);
        objc_msgSend(WeakRetained, "locationForPopUp");
        -[PopUpPlugin showInRect:](popUpPlugin, "showInRect:");

      }
      else
      {
        -[PopUpPlugin update](popUpPlugin, "update");
      }
      self->_popUpShowing = 1;
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        -[CategoriesDataSource sendRankSectionsFeedback](self->_categoriesDataSource, "sendRankSectionsFeedback");
        -[STSSearchDropDownViewController setSendFeedbackOnViewDidAppear:](self, "setSendFeedbackOnViewDidAppear:", 1);
      }
    }
  }
  else
  {
    -[STSSearchDropDownViewController _showLegalNotice](self, "_showLegalNotice");
  }
}

- (void)showSuggestionsIfNeccessary
{
  PopUpPlugin *popUpPlugin;
  id WeakRetained;

  if ((self->_popUpShowing | 2) != 2)
  {
    -[PopUpPlugin setDataSource:](self->_popUpPlugin, "setDataSource:", self->_suggestionsDataSource);
    -[PopUpPlugin setDelegate:](self->_popUpPlugin, "setDelegate:", self->_suggestionsDataSource);
    -[STSSearchDropDownViewController _updateSuggestions](self, "_updateSuggestions");
    popUpPlugin = self->_popUpPlugin;
    if (self->_popUpShowing == 3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);
      objc_msgSend(WeakRetained, "locationForPopUp");
      -[PopUpPlugin showInRect:](popUpPlugin, "showInRect:");

    }
    else
    {
      -[PopUpPlugin update](self->_popUpPlugin, "update");
    }
    self->_popUpShowing = 0;
  }
}

- (void)showSuggestions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PopUpPlugin *popUpPlugin;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sts_legalNoticeCount");

  if (v4 >= 3)
  {
    if (self->_popUpShowing)
    {
      -[PopUpPlugin setDataSource:](self->_popUpPlugin, "setDataSource:", self->_suggestionsDataSource);
      -[PopUpPlugin setDelegate:](self->_popUpPlugin, "setDelegate:", self->_suggestionsDataSource);
      -[STSSearchDropDownViewController query](self, "query");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (!v6)
      {
        -[STSSearchDropDownViewController suggestionsDataSource](self, "suggestionsDataSource");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "clearSuggestions");

      }
      -[STSSearchDropDownViewController _updateSuggestions](self, "_updateSuggestions");
      popUpPlugin = self->_popUpPlugin;
      if (self->_popUpShowing == 3)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);
        objc_msgSend(WeakRetained, "locationForPopUp");
        -[PopUpPlugin showInRect:](popUpPlugin, "showInRect:");

      }
      else
      {
        -[PopUpPlugin update](self->_popUpPlugin, "update");
      }
      self->_popUpShowing = 0;
      -[STSSearchDropDownViewController query](self, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
      {
        -[STSSearchDropDownViewController suggestionsDataSource](self, "suggestionsDataSource");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clearSuggestions");

      }
    }
  }
  else
  {
    -[STSSearchDropDownViewController _showLegalNotice](self, "_showLegalNotice");
  }
}

- (void)_updateSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  -[STSSearchModel predictedSuggestions](self->_searchModel, "predictedSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[CategoriesDataSource recentQueries](self->_categoriesDataSource, "recentQueries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sts_map:", &__block_literal_global_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_2;
  v12[3] = &unk_24E7460D0;
  v11 = v4;
  v13 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  if (!v11)
  {
    if (!v6)
      goto LABEL_8;
    v8 = v6;
LABEL_7:
    -[STSSearchDropDownViewController suggestionsDataSource](self, "suggestionsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateQuerySuggestions:", v8);

    goto LABEL_8;
  }
  v7 = v11;
  v8 = v7;
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
  v9 = objc_claimAutoreleasedReturnValue();

  v8 = (id)v9;
  if (v9)
    goto LABEL_7;
LABEL_8:

}

id __53__STSSearchDropDownViewController__updateSuggestions__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BE84F98];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSuggestion:query:score:type:", v3, v3, 3, 0.0);

  return v4;
}

void __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_3;
  v8[3] = &unk_24E7457F8;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v6);

}

void __53__STSSearchDropDownViewController__updateSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[STSSearchDropDownViewController showSuggestions](self, "showSuggestions");
  }
  else
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didClearSearchBarInput");

    +[STSSearchModel incrementClientQueryId](STSSearchModel, "incrementClientQueryId");
    -[STSSearchDropDownViewController showCategories](self, "showCategories");
  }
}

- (void)showPickerAndPerformQuery:(id)a3 requestType:(int64_t)a4
{
  CategoriesDataSource *categoriesDataSource;
  id v7;
  id WeakRetained;

  categoriesDataSource = self->_categoriesDataSource;
  v7 = a3;
  -[CategoriesDataSource addQueryToRecents:](categoriesDataSource, "addQueryToRecents:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "searchDropDownViewController:didQueryFor:requestType:", self, v7, a4);

}

- (void)sendVisibleResultsFeedback
{
  void *v3;
  void *v4;
  id v5;

  -[PopUpPlugin indexPathsForVisibleRows](self->_popUpPlugin, "indexPathsForVisibleRows");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CategoriesDataSource visibleResultsForIndexPaths:](self->_categoriesDataSource, "visibleResultsForIndexPaths:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didShowResults:scrolling:", v3, 0);

  }
}

- (void)categoryViewController:(id)a3 didSelectCategory:(id)a4 suggested:(BOOL)a5
{
  id v6;

  v6 = a4;
  -[STSSearchDropDownViewController showPickerAndPerformQuery:requestType:](self, "showPickerAndPerformQuery:requestType:", v6, 5);
  -[CategoriesDataSource addQueryToRecents:](self->_categoriesDataSource, "addQueryToRecents:", v6);

}

- (void)categoryViewController:(id)a3 didSelectRecent:(id)a4
{
  -[STSSearchDropDownViewController showPickerAndPerformQuery:requestType:](self, "showPickerAndPerformQuery:requestType:", a4, 6);
  -[SuggestionsDataSource clearSuggestions](self->_suggestionsDataSource, "clearSuggestions");
}

- (void)clearRecents
{
  id v2;

  -[CategoriesDataSource clearRecents](self->_categoriesDataSource, "clearRecents");
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didClearRecents");

}

- (void)categoryViewControllerDidSelectClearRecentsButton:(id)a3
{
  id v3;

  -[CategoriesDataSource clearRecents](self->_categoriesDataSource, "clearRecents", a3);
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didClearRecents");

}

- (void)suggestionViewController:(id)a3 didSelectSuggestion:(id)a4 suggested:(BOOL)a5
{
  id v6;

  objc_msgSend(a4, "suggestion", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[STSSearchDropDownViewController showPickerAndPerformQuery:requestType:](self, "showPickerAndPerformQuery:requestType:", v6, 1);

}

- (void)dropDownContentViewControllerShouldDismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "searchDropDownViewControllerShouldDismiss");

}

- (void)searchModelUpdated
{
  -[PopUpPlugin update](self->_popUpPlugin, "update");
}

- (void)searchModelUpdatedQuerySuggestions:(id)a3
{
  void *v4;
  uint64_t v5;
  id WeakRetained;

  objc_msgSend(a3, "querySuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "searchDropDownViewControllerShouldDismiss");

  }
  -[PopUpPlugin update](self->_popUpPlugin, "update");
}

- (void)didCloseDropDown
{
  id WeakRetained;

  self->_popUpShowing = 3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "searchDropDownViewControllerDidDismiss");

}

- (BOOL)shouldShowLegalNotice
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sts_legalNoticeCount") < 3;

  return v3;
}

- (void)didPressDownKey
{
  void *v3;
  uint64_t v4;
  id WeakRetained;

  if (self->_popUpShowing == 3)
  {
    -[STSSearchDropDownViewController query](self, "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
      -[STSSearchDropDownViewController showSuggestions](self, "showSuggestions");
    else
      -[STSSearchDropDownViewController showCategories](self, "showCategories");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "searchDropDownViewControllerDidPresent");

  }
  else
  {
    -[PopUpPlugin moveSelectionDown](self->_popUpPlugin, "moveSelectionDown");
  }
}

- (void)didPressReturnKey:(id)a3
{
  id v4;
  unint64_t popUpShowing;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  popUpShowing = self->_popUpShowing;
  v12 = v4;
  if (popUpShowing < 2)
  {
    -[PopUpPlugin getSelection](self->_popUpPlugin, "getSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v4 = v12;
    if (v7)
    {
      -[PopUpPlugin getSelection](self->_popUpPlugin, "getSelection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CategoriesDataSource addQueryToRecents:](self->_categoriesDataSource, "addQueryToRecents:", v8);
      -[STSSearchDropDownViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "searchDropDownViewController:didQueryFor:requestType:", self, v8, 1);

      -[CategoriesDataSource addQueryToRecents:](self->_categoriesDataSource, "addQueryToRecents:", v8);
      goto LABEL_8;
    }
LABEL_5:
    v10 = objc_msgSend(v4, "length");
    -[STSSearchDropDownViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v10)
    {
      objc_msgSend(v11, "searchDropDownViewController:didQueryFor:requestType:", self, v12, 1);

      -[CategoriesDataSource addQueryToRecents:](self->_categoriesDataSource, "addQueryToRecents:", v12);
LABEL_9:
      v4 = v12;
      goto LABEL_10;
    }
    objc_msgSend(v11, "searchDropDownViewControllerShouldPresent");
LABEL_8:

    goto LABEL_9;
  }
  if (popUpShowing != 2)
    goto LABEL_5;
LABEL_10:

}

- (void)didPressUpKey
{
  if (self->_popUpShowing <= 1)
    -[PopUpPlugin moveSelectionUp](self->_popUpPlugin, "moveSelectionUp");
}

- (void)didRequestClose
{
  if (self->_popUpShowing <= 2)
    -[STSSearchDropDownViewController close](self, "close");
}

- (PopUpPlugin)popUpPlugin
{
  return self->_popUpPlugin;
}

- (void)setPopUpPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_popUpPlugin, a3);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (BOOL)sendFeedbackOnViewDidAppear
{
  return self->_sendFeedbackOnViewDidAppear;
}

- (void)setSendFeedbackOnViewDidAppear:(BOOL)a3
{
  self->_sendFeedbackOnViewDidAppear = a3;
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (STSSearchDropDownViewControllerDelegate)delegate
{
  return (STSSearchDropDownViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PopUpSearchViewDelegate)locationDelegate
{
  return (PopUpSearchViewDelegate *)objc_loadWeakRetained((id *)&self->_locationDelegate);
}

- (void)setLocationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_locationDelegate, a3);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (CategoriesDataSource)categoriesDataSource
{
  return self->_categoriesDataSource;
}

- (void)setCategoriesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesDataSource, a3);
}

- (SuggestionsDataSource)suggestionsDataSource
{
  return self->_suggestionsDataSource;
}

- (void)setSuggestionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_categoriesDataSource, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_locationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_popUpPlugin, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
}

@end

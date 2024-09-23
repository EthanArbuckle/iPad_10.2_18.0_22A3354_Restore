@implementation STSSearchBrowserRootViewController

- (STSSearchBrowserRootViewController)initWithSearchModel:(id)a3
{
  id v5;
  STSSearchBrowserRootViewController *v6;
  STSSearchBrowserRootViewController *v7;
  id *p_searchModel;
  STSSuggestionViewController *v9;
  STSSuggestionViewController *suggestionViewController;
  STSPicker *v11;
  STSPicker *pickerViewController;
  STSCategoryViewController *v13;
  STSCategoryViewController *categoryViewController;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *recentQueries;
  uint64_t v21;
  NSMutableArray *v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STSSearchBrowserRootViewController;
  v6 = -[STSSearchBrowserRootViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_searchModel = (id *)&v6->_searchModel;
    objc_storeStrong((id *)&v6->_searchModel, a3);
    v9 = objc_alloc_init(STSSuggestionViewController);
    suggestionViewController = v7->_suggestionViewController;
    v7->_suggestionViewController = v9;

    -[STSSuggestionViewController setSearchModel:](v7->_suggestionViewController, "setSearchModel:", *p_searchModel);
    objc_msgSend(*p_searchModel, "setQuerySuggestionsDelegate:", v7->_suggestionViewController);
    -[STSSuggestionViewController setSelectionDelegate:](v7->_suggestionViewController, "setSelectionDelegate:", v7);
    -[STSSuggestionViewController setAutomaticallyAdjustsScrollViewInsets:](v7->_suggestionViewController, "setAutomaticallyAdjustsScrollViewInsets:", 0);
    v11 = -[STSPicker initWithSearchModel:showSuggestions:]([STSPicker alloc], "initWithSearchModel:showSuggestions:", *p_searchModel, 0);
    pickerViewController = v7->_pickerViewController;
    v7->_pickerViewController = v11;

    objc_msgSend(*p_searchModel, "setDelegate:", v7->_pickerViewController);
    v13 = objc_alloc_init(STSCategoryViewController);
    categoryViewController = v7->_categoryViewController;
    v7->_categoryViewController = v13;

    -[STSCategoryViewController setSelectionDelegate:](v7->_categoryViewController, "setSelectionDelegate:", v7);
    -[STSCategoryViewController setSearchModel:](v7->_categoryViewController, "setSearchModel:", *p_searchModel);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel__keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__keyboardWillHide_, *MEMORY[0x24BEBE578], 0);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("STSRecentQueries"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");
    recentQueries = v7->_recentQueries;
    v7->_recentQueries = (NSMutableArray *)v19;

    if (!v7->_recentQueries)
    {
      v21 = objc_opt_new();
      v22 = v7->_recentQueries;
      v7->_recentQueries = (NSMutableArray *)v21;

    }
    -[STSSearchBrowserRootViewController setRequestedExpandedPresentation:](v7, "setRequestedExpandedPresentation:", 0);
    v7->_didSendCategoryResultFeedback = 0;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)STSSearchBrowserRootViewController;
  -[STSSearchBrowserRootViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  STSSearchBrowserHeaderView *v3;
  void *v4;
  STSSearchBrowserRootView *v5;

  v5 = objc_alloc_init(STSSearchBrowserRootView);
  v3 = objc_alloc_init(STSSearchBrowserHeaderView);
  -[STSSearchBrowserHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STSSearchBrowserHeaderView searchBar](v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[STSSearchBrowserRootView setHeaderView:](v5, "setHeaderView:", v3);
  -[STSSearchBrowserRootViewController setView:](self, "setView:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  void *v27;
  objc_super v28;

  v3 = a3;
  -[STSSearchBrowserRootViewController _updateContentInsets](self, "_updateContentInsets");
  v28.receiver = self;
  v28.super_class = (Class)STSSearchBrowserRootViewController;
  -[STSSearchBrowserRootViewController viewWillAppear:](&v28, sel_viewWillAppear_, v3);
  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    goto LABEL_4;
  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endOfDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "searchTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "endOfDocument");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "searchBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "searchTextField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textRangeFromPosition:toPosition:", v16, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "searchBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "searchTextField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSelectedTextRange:", v24);

  }
  else
  {
LABEL_4:
    -[STSSearchBrowserRootViewController showCategories](self, "showCategories");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  self->_didSendCategoryResultFeedback = 0;
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSSearchBrowserRootViewController;
  -[STSSearchBrowserRootViewController didMoveToParentViewController:](&v3, sel_didMoveToParentViewController_, a3);
}

- (void)suggestionViewController:(id)a3 didSelectSuggestionAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[STSPicker querySuggestions](self->_pickerViewController, "querySuggestions", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resignFirstResponder");

  objc_msgSend(v14, "suggestion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSearchBrowserRootViewController showPickerAndPerformQuery:requestType:](self, "showPickerAndPerformQuery:requestType:", v12, 2);

  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didSearchWithSuggestedQuery:", v14);

  -[STSSearchBrowserRootViewController _clearSuggestions](self, "_clearSuggestions");
}

- (void)suggestionViewControllerDidTapLogo:(id)a3
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
  id v13;

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://www.bing.com/images/search?q=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didEngageProviderLogo");

  -[STSSearchBrowserRootViewController extensionContext](self, "extensionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "openURL:completionHandler:", v10, 0);

}

- (void)categoryViewController:(id)a3 didSelectCategory:(id)a4 suggested:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a5;
  v7 = a4;
  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v7);

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resignFirstResponder");

  if (v5)
    v12 = 3;
  else
    v12 = 5;
  -[STSSearchBrowserRootViewController showPickerAndPerformQuery:requestType:](self, "showPickerAndPerformQuery:requestType:", v7, v12);

  -[STSSearchBrowserRootViewController _clearSuggestions](self, "_clearSuggestions");
}

- (void)categoryViewController:(id)a3 didSelectRecent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resignFirstResponder");

  -[STSSearchBrowserRootViewController showPickerAndPerformQuery:requestType:](self, "showPickerAndPerformQuery:requestType:", v5, 6);
  -[STSSearchBrowserRootViewController _clearSuggestions](self, "_clearSuggestions");
}

- (void)categoryViewControllerDidSelectClearRecentsButton:(id)a3
{
  id v3;

  -[STSSearchBrowserRootViewController _clearRecents](self, "_clearRecents", a3);
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didClearRecents");

}

- (void)categoryViewControllerScrollViewWillBeginDragging:(id)a3
{
  void *v3;
  id v4;

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[STSCategoryViewController sendVisibleResultsFeedback](self->_categoryViewController, "sendVisibleResultsFeedback", a3);
  -[STSSearchBrowserRootViewController selectionDelegate](self, "selectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  -[STSSearchBrowserRootViewController selectionDelegate](self, "selectionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "searchBrowserRootViewControllerSearchBarShouldBeginEditing:", self);

  return v7;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  UIViewController *currentChildViewController;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageDownloads");

  currentChildViewController = self->_currentChildViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
  LOBYTE(currentChildViewController) = -[UIViewController isEqual:](currentChildViewController, "isEqual:", WeakRetained);

  if ((currentChildViewController & 1) == 0)
  {
    objc_msgSend(v11, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performSearchWithQueryString:requestType:", v10, 0);

      -[STSSearchBrowserRootViewController showSuggestions](self, "showSuggestions");
    }
    else
    {
      -[STSSearchBrowserRootViewController showCategories](self, "showCategories");
    }
  }

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageDownloads");

  -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetContent");

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", 0);

  -[STSSearchBrowserRootViewController _clearSuggestions](self, "_clearSuggestions");
  -[STSSearchBrowserRootViewController selectionDelegate](self, "selectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBrowserRootViewControllerDidSelectCancel:", self);

  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBarDidCancel");

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetContent");

  objc_msgSend(v4, "resignFirstResponder");
  objc_msgSend(v4, "text");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[STSSearchBrowserRootViewController showPickerAndPerformQuery:requestType:](self, "showPickerAndPerformQuery:requestType:", v7, 8);
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didSearchWithCustomQuery:", v7);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") <= 0xC7)
  {
    objc_msgSend(v12, "searchTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performSearchWithQueryString:requestType:", v6, 0);

      -[STSSearchBrowserRootViewController showSuggestions](self, "showSuggestions");
    }
    else
    {
      +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didClearSearchBarInput");

      +[STSSearchModel incrementClientQueryId](STSSearchModel, "incrementClientQueryId");
      -[STSSearchBrowserRootViewController _clearSuggestions](self, "_clearSuggestions");
      -[STSSearchBrowserRootViewController showCategories](self, "showCategories");
    }
  }

}

- (void)_clearSuggestions
{
  id v2;

  -[STSSearchBrowserRootViewController suggestionViewController](self, "suggestionViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSuggestions");

}

- (void)showPickerAndPerformQuery:(id)a3 requestType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  UIViewController *currentChildViewController;
  STSPicker *pickerViewController;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  STSSearchBrowserRootViewController *v19;
  int64_t v20;

  v6 = a3;
  -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetContent");

  -[STSSearchBrowserRootViewController _addQueryToRecents:](self, "_addQueryToRecents:", v6);
  if (a4 == 3
    && (objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "sts_legalNoticeCount"),
        v8,
        v9 < 3))
  {
    -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v6);

    -[STSSearchBrowserRootViewController _showLegalNotice](self, "_showLegalNotice");
  }
  else
  {
    if ((-[UIViewController isEqual:](self->_currentChildViewController, "isEqual:", self->_pickerViewController) & 1) != 0)
    {
      if (v6)
      {
        -[STSSearchBrowserRootViewController pickerViewController](self, "pickerViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "performSearchWithQueryString:requestType:", v6, a4);

      }
    }
    else
    {
      currentChildViewController = self->_currentChildViewController;
      pickerViewController = self->_pickerViewController;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __76__STSSearchBrowserRootViewController_showPickerAndPerformQuery_requestType___block_invoke;
      v17[3] = &unk_24E745E48;
      v18 = v6;
      v19 = self;
      v20 = a4;
      -[STSSearchBrowserRootViewController _transitionContentFromViewController:toViewController:completion:](self, "_transitionContentFromViewController:toViewController:completion:", currentChildViewController, pickerViewController, v17);

    }
    -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v6);

  }
}

void __76__STSSearchBrowserRootViewController_showPickerAndPerformQuery_requestType___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "pickerViewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performSearchWithQueryString:requestType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

- (void)showCategories
{
  void *v3;
  uint64_t v4;
  STSCategoryViewController *categoryViewController;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sts_legalNoticeCount");

  if (v4 >= 3)
  {
    categoryViewController = self->_categoryViewController;
    if ((STSCategoryViewController *)self->_currentChildViewController == categoryViewController)
    {
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        -[STSCategoryViewController sendRankSectionsFeedback](self->_categoryViewController, "sendRankSectionsFeedback");
        -[STSCategoryViewController sendVisibleResultsFeedback](self->_categoryViewController, "sendVisibleResultsFeedback");
      }
    }
    else
    {
      -[STSCategoryViewController updateRecents:](categoryViewController, "updateRecents:", self->_recentQueries);
      -[STSSearchBrowserRootViewController _transitionContentFromViewController:toViewController:completion:](self, "_transitionContentFromViewController:toViewController:completion:", self->_currentChildViewController, self->_categoryViewController, 0);
      if (!self->_didSendCategoryResultFeedback)
      {
        self->_didSendCategoryResultFeedback = 1;
        -[STSCategoryViewController sendRankSectionsFeedback](self->_categoryViewController, "sendRankSectionsFeedback");
        -[STSCategoryViewController setSendFeedbackOnViewDidAppear:](self->_categoryViewController, "setSendFeedbackOnViewDidAppear:", 1);
      }
    }
  }
  else
  {
    -[STSSearchBrowserRootViewController _showLegalNotice](self, "_showLegalNotice");
  }
}

- (void)showSuggestions
{
  if (self->_currentChildViewController != &self->_suggestionViewController->super)
    -[STSSearchBrowserRootViewController _transitionContentFromViewController:toViewController:completion:](self, "_transitionContentFromViewController:toViewController:completion:");
}

void __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateContentInsets");
    objc_msgSend(*(id *)(a1 + 32), "searchHeaderView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "pickerViewController");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resetContent");

      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "suggestionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearSuggestions");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "predictedSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "sts_map:", &__block_literal_global_2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_3;
    v16[3] = &unk_24E7460D0;
    v10 = v8;
    v17 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
    if (v10)
    {
      v11 = v10;
      v12 = v11;
      if (v9)
      {
        objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v9);
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v13;
        if (!v13)
          goto LABEL_11;
      }
    }
    else
    {
      if (!v9)
      {
LABEL_11:

        goto LABEL_12;
      }
      v12 = v9;
    }
    objc_msgSend(*(id *)(a1 + 32), "suggestionViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateQuerySuggestions:", v12);

    goto LABEL_11;
  }
}

id __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BE84F98];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSuggestion:query:score:type:", v3, v3, 3, 0.0);

  return v4;
}

void __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_3(uint64_t a1, void *a2)
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
  v8[2] = __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_4;
  v8[3] = &unk_24E7457F8;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v6);

}

void __53__STSSearchBrowserRootViewController_showSuggestions__block_invoke_4(uint64_t a1, void *a2)
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

- (void)_showLegalNotice
{
  UIViewController *currentChildViewController;
  UIViewController **p_legalNoticeViewController;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  STSSearchNoticeView *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  currentChildViewController = self->_currentChildViewController;
  p_legalNoticeViewController = &self->_legalNoticeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
  LOBYTE(currentChildViewController) = -[UIViewController isEqual:](currentChildViewController, "isEqual:", WeakRetained);

  if ((currentChildViewController & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sts_legalNoticeCount") + 1;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sts_setLegalNoticeCount:", v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB08]), "initWithNibName:bundle:", 0, 0);
    v10 = objc_alloc_init(STSSearchNoticeView);
    STSLocalizedString(CFSTR("FTE_NOTICE_LEGAL_TEXT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchNoticeView setText:](v10, "setText:", v11);

    objc_initWeak(&location, self);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __54__STSSearchBrowserRootViewController__showLegalNotice__block_invoke;
    v15 = &unk_24E746118;
    objc_copyWeak(&v16, &location);
    -[STSSearchNoticeView setContinueButtonAction:](v10, "setContinueButtonAction:", &v12);
    objc_msgSend(v9, "setView:", v10, v12, v13, v14, v15);
    objc_storeWeak((id *)p_legalNoticeViewController, v9);
    -[STSSearchBrowserRootViewController _updateContentInsets](self, "_updateContentInsets");
    -[STSSearchBrowserRootViewController _transitionContentFromViewController:toViewController:completion:](self, "_transitionContentFromViewController:toViewController:completion:", self->_currentChildViewController, v9, 0);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __54__STSSearchBrowserRootViewController__showLegalNotice__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sts_setLegalNoticeCount:", 3);

    objc_msgSend(v6, "searchHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
      objc_msgSend(v6, "showPickerAndPerformQuery:requestType:", v5, 3);
    else
      objc_msgSend(v6, "showCategories");

    WeakRetained = v6;
  }

}

- (void)_transitionContentFromViewController:(id)a3 toViewController:(id)a4 completion:(id)a5
{
  id v8;
  UIViewController *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  STSSearchBrowserRootViewController *v17;
  UIViewController *v18;
  void (**v19)(_QWORD);
  _QWORD v20[5];

  v8 = a3;
  v9 = (UIViewController *)a4;
  v10 = (void (**)(_QWORD))a5;
  self->_didSendCategoryResultFeedback = 0;
  if (self->_currentChildViewController != v9)
  {
    objc_storeStrong((id *)&self->_currentChildViewController, a4);
    -[STSSearchBrowserRootViewController addChildViewController:](self, "addChildViewController:", v9);
    objc_msgSend(v8, "parentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "willMoveToParentViewController:", 0);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke;
      v20[3] = &unk_24E7457A8;
      v20[4] = self;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke_2;
      v15[3] = &unk_24E746140;
      v16 = v8;
      v17 = self;
      v18 = v9;
      v19 = v10;
      -[STSSearchBrowserRootViewController transitionFromViewController:toViewController:duration:options:animations:completion:](self, "transitionFromViewController:toViewController:duration:options:animations:completion:", v16, v18, 5242880, v20, v15, 0.0);

      goto LABEL_7;
    }
    -[STSSearchBrowserRootViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentView:", v13);

    -[STSSearchBrowserRootViewController addChildViewController:](self, "addChildViewController:", v9);
    -[UIViewController didMoveToParentViewController:](v9, "didMoveToParentViewController:", self);
    -[STSSearchBrowserRootViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

    -[STSSearchBrowserRootViewController _updateContentInsets](self, "_updateContentInsets");
  }
  if (v10)
    v10[2](v10);
LABEL_7:

}

uint64_t __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentInsets");
}

uint64_t __103__STSSearchBrowserRootViewController__transitionContentFromViewController_toViewController_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentView:", v3);

  objc_msgSend(*(id *)(a1 + 48), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "searchHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateIntrinsicContentSize");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (STSSearchBrowserHeaderView)searchHeaderView
{
  void *v2;
  void *v3;

  -[STSSearchBrowserRootViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STSSearchBrowserHeaderView *)v3;
}

- (void)setPickerSelectionDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  STSPicker *pickerViewController;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pickerSelectionDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_pickerSelectionDelegate, obj);
    pickerViewController = self->_pickerViewController;
    v7 = v5;
    -[STSPicker setSelectionDelegate:](pickerViewController, "setSelectionDelegate:", obj);

  }
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double Height;
  id v36;
  CGRect v37;
  CGRect v38;

  v36 = a3;
  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstResponder");

  if (v6)
  {
    -[STSSearchBrowserRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v36, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BEBE468]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGRectValue");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    -[STSSearchBrowserRootViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertRect:fromView:", 0, v19, v21, v23, v25);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = v15;
    Height = CGRectGetHeight(v37);
    v38.origin.x = v28;
    v38.origin.y = v30;
    v38.size.width = v32;
    v38.size.height = v34;
    self->_keyboardHeight = fmax(Height - CGRectGetMinY(v38), 0.0);
    -[STSSearchBrowserRootViewController _updateContentInsets](self, "_updateContentInsets");
  }

}

- (void)_keyboardWillHide:(id)a3
{
  self->_keyboardHeight = 0.0;
  -[STSSearchBrowserRootViewController _updateContentInsets](self, "_updateContentInsets", a3);
}

- (void)setTopInset:(double)a3
{
  if (self->_topInset != a3)
  {
    self->_topInset = a3;
    -[STSSearchBrowserRootViewController _updateContentInsets](self, "_updateContentInsets");
  }
}

- (void)setBottomInset:(double)a3
{
  if (self->_bottomInset != a3)
  {
    self->_bottomInset = a3;
    -[STSSearchBrowserRootViewController _updateContentInsets](self, "_updateContentInsets");
  }
}

- (void)resetContentOffset
{
  double v3;

  v3 = -(self->_topInset + 58.0);
  -[STSCategoryViewController updateContentOffset:](self->_categoryViewController, "updateContentOffset:", v3);
  -[STSSuggestionViewController updateContentOffset:](self->_suggestionViewController, "updateContentOffset:", v3);
  -[STSPicker updateContentOffset:](self->_pickerViewController, "updateContentOffset:", v3);
}

- (BOOL)isPickerVisible
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[STSSearchBrowserRootViewController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[STSSearchBrowserRootViewController childViewControllers](self, "childViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (void)_updateContentInsets
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MinX;
  double Width;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  CGFloat v34;
  id v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[STSSearchBrowserRootViewController searchHeaderView](self, "searchHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  CGRectGetHeight(v37);

  WeakRetained = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
  if (WeakRetained)
  {
    -[STSSearchBrowserRootViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = *(double *)&v6;
    v34 = v8;
    v35 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v38.origin.x = v7;
    v38.origin.y = v9;
    v38.size.width = v11;
    v38.size.height = v13;
    CGRectGetHeight(v38);
    -[STSSearchBrowserRootViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIFloorToViewScale();
    v16 = v15;

    -[STSSearchBrowserRootViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "readableContentGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutFrame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v39.origin.x = v20;
    v39.origin.y = v22;
    v39.size.width = v24;
    v39.size.height = v26;
    MinX = CGRectGetMinX(v39);
    v40.origin.y = v34;
    *(_QWORD *)&v40.origin.x = v35;
    v40.size.width = v11;
    v40.size.height = v13;
    Width = CGRectGetWidth(v40);
    v41.origin.x = v20;
    v41.origin.y = v22;
    v41.size.width = v24;
    v41.size.height = v26;
    v29 = Width - CGRectGetMaxX(v41);
    if (MinX >= 30.0)
      v30 = MinX;
    else
      v30 = 30.0;
    if (v29 >= 30.0)
      v31 = v29;
    else
      v31 = 30.0;
    if (v16 >= self->_topInset + 0.0 + 58.0)
      v32 = v16;
    else
      v32 = self->_topInset + 0.0 + 58.0;
    v33 = objc_loadWeakRetained((id *)&self->_legalNoticeViewController);
    objc_msgSend(v33, "view");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setContentInsets:", v32, v30, 30.0, v31);
  }
}

- (void)_addQueryToRecents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *recentQueries;
  id v10;
  uint64_t v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v15, "length");
  v8 = v15;
  if (v7)
  {
    recentQueries = self->_recentQueries;
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __57__STSSearchBrowserRootViewController__addQueryToRecents___block_invoke;
    v20 = &unk_24E745848;
    v10 = v15;
    v21 = v10;
    v11 = -[NSMutableArray indexOfObjectPassingTest:](recentQueries, "indexOfObjectPassingTest:", &v17);
    v12 = self->_recentQueries;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray insertObject:atIndex:](v12, "insertObject:atIndex:", v10, 0);
      if ((unint64_t)-[NSMutableArray count](self->_recentQueries, "count") >= 4)
        -[NSMutableArray removeLastObject](self->_recentQueries, "removeLastObject");
    }
    else
    {
      -[NSMutableArray objectAtIndex:](v12, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_recentQueries, "removeObjectAtIndex:", v11);
      -[NSMutableArray insertObject:atIndex:](self->_recentQueries, "insertObject:atIndex:", v13, 0);

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v15, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", self->_recentQueries, CFSTR("STSRecentQueries"));
    objc_msgSend(v14, "synchronize");

    v8 = v16;
  }

}

BOOL __57__STSSearchBrowserRootViewController__addQueryToRecents___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2) == 0;
}

- (void)_clearRecents
{
  id v3;

  -[NSMutableArray removeAllObjects](self->_recentQueries, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_recentQueries, CFSTR("STSRecentQueries"));
  objc_msgSend(v3, "synchronize");

}

- (void)fetchCategories
{
  -[STSSearchModel performCategoryListRequest:](self->_searchModel, "performCategoryListRequest:", &__block_literal_global_38);
}

- (void)sendVisibleResultsFeedback
{
  void *v3;

  -[STSPicker parentViewController](self->_pickerViewController, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[STSPicker sendVisibleResultsFeedback](self->_pickerViewController, "sendVisibleResultsFeedback");
}

- (STSSuggestionViewController)suggestionViewController
{
  return self->_suggestionViewController;
}

- (void)setSuggestionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionViewController, a3);
}

- (STSPicker)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerViewController, a3);
}

- (STSSearchBrowserRootViewControllerDelegate)selectionDelegate
{
  return (STSSearchBrowserRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (STSPickerSelectionDelegate)pickerSelectionDelegate
{
  return (STSPickerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_pickerSelectionDelegate);
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationID, a3);
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (STSFeedbackReporter)feedbackReporter
{
  return self->_feedbackReporter;
}

- (BOOL)requestedExpandedPresentation
{
  return self->_requestedExpandedPresentation;
}

- (void)setRequestedExpandedPresentation:(BOOL)a3
{
  self->_requestedExpandedPresentation = a3;
}

- (STSCategoryViewController)categoryViewController
{
  return self->_categoryViewController;
}

- (void)setCategoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_categoryViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryViewController, 0);
  objc_storeStrong((id *)&self->_feedbackReporter, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_destroyWeak((id *)&self->_pickerSelectionDelegate);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
  objc_storeStrong((id *)&self->_suggestionViewController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_recentQueries, 0);
  objc_destroyWeak((id *)&self->_legalNoticeViewController);
  objc_storeStrong((id *)&self->_currentChildViewController, 0);
}

@end

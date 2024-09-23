@implementation VKVisualSearchViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *loadingIndicator;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKVisualSearchViewController;
  -[VKVisualSearchViewController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKVisualSearchViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  -[UIActivityIndicatorView setHidden:](self->_loadingIndicator, "setHidden:", 1);
  -[VKVisualSearchViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[UIActivityIndicatorView setFrame:](self->_loadingIndicator, "setFrame:");

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_loadingIndicator, "setHidesWhenStopped:", 1);
  -[VKVisualSearchViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_loadingIndicator);

}

- (VKVisualSearchViewController)initWithImage:(CGImage *)a3
{
  VKVisualSearchViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKVisualSearchViewController;
  result = -[VKVisualSearchViewController init](&v4, sel_init, a3);
  if (result)
    result->_didShowResults = 0;
  return result;
}

- (VKVisualSearchViewController)initWithVisualSearchResultItems:(id)a3
{
  id v4;
  VKVisualSearchViewController *v5;
  VKVisualSearchViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKVisualSearchViewController;
  v5 = -[VKVisualSearchViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VKVisualSearchViewController setVisualSearchResultItems:](v5, "setVisualSearchResultItems:", v4);
    v6->_didShowResults = 0;
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKVisualSearchViewController;
  -[VKVisualSearchViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[VKVisualSearchViewController visualSearchResult](self, "visualSearchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[VKVisualSearchViewController visualSearchResultItems](self, "visualSearchResultItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[UIActivityIndicatorView setHidden:](self->_loadingIndicator, "setHidden:", 0);
      -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
      return;
    }
  }
  -[VKVisualSearchViewController _showVisualSearchViewController](self, "_showVisualSearchViewController");
}

- (void)setVisualSearchResultItems:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_visualSearchResultItems, a3);
  v5 = a3;
  -[UIActivityIndicatorView setHidden:](self->_loadingIndicator, "setHidden:", 1);
  -[UIActivityIndicatorView stopAnimating](self->_loadingIndicator, "stopAnimating");

  -[VKVisualSearchViewController _showVisualSearchViewController](self, "_showVisualSearchViewController");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKVisualSearchViewController;
  -[VKVisualSearchViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[VKVisualSearchViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIActivityIndicatorView setFrame:](self->_loadingIndicator, "setFrame:");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKVisualSearchViewController;
  -[VKVisualSearchViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[VKVisualSearchViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDismissViewController");

}

- (void)_showVisualSearchViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[VKVisualSearchViewController visualSearchResult](self, "visualSearchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKVisualSearchViewController visualSearchResult](self, "visualSearchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKVisualSearchViewController _resultSectionsForRecognitionResult:](self, "_resultSectionsForRecognitionResult:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VKVisualSearchViewController visualSearchResultItems](self, "visualSearchResultItems");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6
      || (v7 = (void *)v6,
          -[VKVisualSearchViewController visualSearchResultItems](self, "visualSearchResultItems"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v7,
          !v9))
    {
      v10 = 0;
      goto LABEL_8;
    }
    -[VKVisualSearchViewController visualSearchResultItems](self, "visualSearchResultItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKVisualSearchViewController _resultSectionsForRecognitionResultItems:](self, "_resultSectionsForRecognitionResultItems:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v5;

LABEL_8:
  -[VKVisualSearchViewController presentSearchViewControllerForSections:](self, "presentSearchViewControllerForSections:", v10);

}

- (void)presentSearchViewControllerForSections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = v4;
  if (!self->_didShowResults)
  {
    if (objc_msgSend(v4, "count"))
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v6 = (void *)getSearchUIResultsViewControllerClass_softClass;
      v23 = getSearchUIResultsViewControllerClass_softClass;
      if (!getSearchUIResultsViewControllerClass_softClass)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __getSearchUIResultsViewControllerClass_block_invoke;
        v19[3] = &unk_1E9462330;
        v19[4] = &v20;
        __getSearchUIResultsViewControllerClass_block_invoke((uint64_t)v19);
        v6 = (void *)v21[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v20, 8);
      v8 = objc_alloc_init(v7);
      objc_msgSend(v8, "setSections:", v5);
      objc_msgSend(v8, "setShouldUseInsetRoundedSections:", 1);
      objc_msgSend(v8, "setShouldUseStandardSectionInsets:", 1);
      -[VKVisualSearchViewController addChildViewController:](self, "addChildViewController:", v8);
      objc_msgSend(v8, "didMoveToParentViewController:", self);
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKVisualSearchViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      -[VKVisualSearchViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v12);

      -[VKVisualSearchViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v15);

    }
    else
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
      VKBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("VK_VISUAL_SEARCH_NO_RESULTS_MESSAGE"), CFSTR("VK_VISUAL_SEARCH_NO_RESULTS_MESSAGE"), CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v17);

      -[VKVisualSearchViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "center");
      objc_msgSend(v8, "setCenter:");

      objc_msgSend(v8, "setTextAlignment:", 1);
      -[VKVisualSearchViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v8);
    }

    self->_didShowResults = 1;
  }

}

- (id)_resultSectionsForRecognitionResult:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "resultItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKVisualSearchViewController _resultSectionsForRecognitionResultItems:](self, "_resultSectionsForRecognitionResultItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_resultSectionsForRecognitionResultItems:(id)a3
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
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "searchItem", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "searchSections");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (VKVisualSearchViewControllerDelegate)delegate
{
  return (VKVisualSearchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)visualSearchResultItems
{
  return self->_visualSearchResultItems;
}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (void)setVisualSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchResult, a3);
}

- (BOOL)didShowResults
{
  return self->_didShowResults;
}

- (void)setDidShowResults:(BOOL)a3
{
  self->_didShowResults = a3;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
  objc_storeStrong((id *)&self->_visualSearchResultItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation SKUIProductPageReviewsViewController

- (SKUIProductPageReviewsViewController)initWithProductPage:(id)a3
{
  id v5;
  SKUIProductPageReviewsViewController *v6;
  SKUIProductPageReviewsViewController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageReviewsViewController initWithProductPage:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIProductPageReviewsViewController;
  v6 = -[SKUIProductPageReviewsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isPad = SKUIUserInterfaceIdiom(v6->_clientContext) == 1;
    objc_storeStrong((id *)&v7->_productPage, a3);
    v7->_sortOrder = 1;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[SKComposeReviewViewController setDelegate:](self->_composeViewController, "setDelegate:", 0);
  -[SKUIReviewsHistogramViewController appSupportButton](self->_histogramViewController, "appSupportButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIReviewsHistogramViewController segmentedControl](self->_histogramViewController, "segmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIReviewsHistogramViewController starRatingControl](self->_histogramViewController, "starRatingControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIIPadCustomerReviewsHeaderView removeTarget:action:forControlEvents:](self->_reviewsHeaderView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[SKUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v9.receiver = self;
  v9.super_class = (Class)SKUIProductPageReviewsViewController;
  -[SKUIProductPageReviewsViewController dealloc](&v9, sel_dealloc);
}

- (SKUIFacebookLikeStatus)facebookLikeStatus
{
  return -[SKUIReviewsFacebookViewController facebookLikeStatus](self->_facebookViewController, "facebookLikeStatus");
}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)reloadData
{
  void *v3;
  SSVLoadURLOperation *loadOperation;

  -[SKUIProductPageReviewsViewController _urlStringWithPageNumber:](self, "_urlStringWithPageNumber:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_reviewList)
  {
    loadOperation = self->_loadOperation;

    if (!loadOperation)
      -[SKUIProductPageReviewsViewController _reloadData](self, "_reloadData");
  }
  else
  {

  }
}

- (void)setFacebookLikeStatus:(id)a3
{
  id v4;
  void *v5;
  SKUIReviewsFacebookViewController *facebookViewController;
  SKUIReviewsFacebookViewController *v7;
  SKUIReviewsFacebookViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  SKUIProductPageTableView *tableView;
  void *v17;
  id v18;

  v18 = a3;
  -[SKUIReviewsFacebookViewController facebookLikeStatus](self->_facebookViewController, "facebookLikeStatus");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v18;
  if (v4 != v18)
  {
    facebookViewController = self->_facebookViewController;
    if (v18)
    {
      if (!facebookViewController)
      {
        v7 = objc_alloc_init(SKUIReviewsFacebookViewController);
        v8 = self->_facebookViewController;
        self->_facebookViewController = v7;

        -[SKUIReviewsFacebookViewController setClientContext:](self->_facebookViewController, "setClientContext:", self->_clientContext);
        -[SKUIReviewsFacebookViewController setDelegate:](self->_facebookViewController, "setDelegate:", self);
        -[SKUIReviewsFacebookViewController view](self->_facebookViewController, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIProductPage uber](self->_productPage, "uber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "colorScheme");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setColorScheme:", v11);

        -[SKUIProductPageReviewsViewController addChildViewController:](self, "addChildViewController:", self->_facebookViewController);
        facebookViewController = self->_facebookViewController;
      }
      -[SKUIReviewsFacebookViewController setFacebookLikeStatus:](facebookViewController, "setFacebookLikeStatus:");
      -[SKUIReviewsFacebookViewController view](self->_facebookViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAutoresizingMask:", 2);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v13);

      -[SKUIProductPageReviewsViewController _defaultPageWidth](self, "_defaultPageWidth");
      objc_msgSend(v12, "sizeThatFits:");
      objc_msgSend(v12, "setFrame:", 0.0, 0.0, v14, v15);
    }
    else
    {
      if (!facebookViewController)
      {
LABEL_9:
        tableView = self->_tableView;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIProductPageTableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v17, 100);

        v5 = v18;
        goto LABEL_10;
      }
      -[SKUIReviewsFacebookViewController removeFromParentViewController](facebookViewController, "removeFromParentViewController");
      v12 = self->_facebookViewController;
      self->_facebookViewController = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)setClientContext:(id)a3
{
  SKUIClientContext *v5;
  void **p_clientContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SKUIClientContext *v14;

  v5 = (SKUIClientContext *)a3;
  p_clientContext = (void **)&self->_clientContext;
  if (self->_clientContext != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    self->_isPad = SKUIUserInterfaceIdiom(*p_clientContext) == 1;
    if (*p_clientContext)
      objc_msgSend(*p_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_REVIEWS_TAB"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_REVIEWS_TAB"), 0, CFSTR("ProductPage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageReviewsViewController setTitle:](self, "setTitle:", v7);

    -[SKUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_clientContext, "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v10 == 0);

    -[SKUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_clientContext, "clientInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", v13 == 0);

    v5 = v14;
  }

}

- (void)setAskPermission:(BOOL)a3
{
  id v4;

  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    -[SKUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", !self->_askPermission);

  }
}

- (void)loadView
{
  id v3;

  -[SKUIProductPageReviewsViewController _tableView](self, "_tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageReviewsViewController setView:](self, "setView:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIProductPageTableView contentOffset](self->_tableView, "contentOffset");
  -[SKUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
  v5.receiver = self;
  v5.super_class = (Class)SKUIProductPageReviewsViewController;
  -[SKUIProductPageReviewsViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIProductPageReviewsViewController reloadData](self, "reloadData");
  v5.receiver = self;
  v5.super_class = (Class)SKUIProductPageReviewsViewController;
  -[SKUIProductPageReviewsViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void)setHeaderViewController:(id)a3
{
  SKUIProductPageHeaderViewController **p_headerViewController;
  void *v6;
  SKUIProductPageHeaderViewController *v7;

  p_headerViewController = &self->_headerViewController;
  v7 = (SKUIProductPageHeaderViewController *)a3;
  if (*p_headerViewController != v7)
  {
    -[SKUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", 0);
    -[SKUIProductPageHeaderViewController view](*p_headerViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SKUIProductPageHeaderViewController removeFromParentViewController](*p_headerViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SKUIProductPageReviewsViewController addChildViewController:](self, "addChildViewController:");
      if (-[SKUIProductPageReviewsViewController isViewLoaded](self, "isViewLoaded"))
        -[SKUIProductPageReviewsViewController _addHeaderView](self, "_addHeaderView");
    }
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (self->_tableView)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "productPageChildViewControllerDidLoadScrollView:", self);

      v5 = obj;
    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidScroll:", self);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[SKUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:", a3, a5->x, a5->y);
}

- (void)reviewsFacebookViewControllerDidChange:(id)a3
{
  -[SKUIProductPageTableView beginUpdates](self->_tableView, "beginUpdates", a3);
  -[SKUIProductPageTableView endUpdates](self->_tableView, "endUpdates");
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  -[SKUIProductPageTableView reloadData](self->_tableView, "reloadData", a3);
  -[SKUIProductPageTableView contentOffset](self->_tableView, "contentOffset");
  -[SKUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
}

- (void)reviewComposeViewControllerDidFinish:(id)a3
{
  SKComposeReviewViewController *composeViewController;

  if (self->_composeViewController == a3)
  {
    objc_msgSend(a3, "setDelegate:", 0);
    -[SKComposeReviewViewController dismissViewControllerAnimated:completion:](self->_composeViewController, "dismissViewControllerAnimated:completion:", 1, 0);
    composeViewController = self->_composeViewController;
    self->_composeViewController = 0;

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 3)
  {
    -[SKUIProductPageReviewsViewController _loadMoreCellForTableView:indexPath:](self, "_loadMoreCellForTableView:indexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8 != 2)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[SKUIProductPageReviewsViewController _textBoxCellForTableView:indexPath:](self, "_textBoxCellForTableView:indexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a3;
  if (a4 == 2)
  {
    -[SKUIReviewList reviews](self->_reviewList, "reviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  else if (a4 == 3)
  {
    v7 = -[SKUIProductPageReviewsViewController _shouldShowLoadMoreCell](self, "_shouldShowLoadMoreCell");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  if (objc_msgSend(a5, "section") == 3)
    objc_msgSend(v6, "stopAnimating");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  NSMutableIndexSet *expandedIndexSet;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *v8;
  SKUIProductPageTableView *tableView;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  expandedIndexSet = self->_expandedIndexSet;
  if (!expandedIndexSet)
  {
    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    v8 = self->_expandedIndexSet;
    self->_expandedIndexSet = v7;

    expandedIndexSet = self->_expandedIndexSet;
  }
  -[NSMutableIndexSet addIndex:](expandedIndexSet, "addIndex:", objc_msgSend(v5, "row"));
  tableView = self->_tableView;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageTableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  SKUIReviewsFacebookViewController *facebookViewController;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;

  v6 = a3;
  if (a4 == 2)
  {
    -[SKUIProductPageReviewsViewController _reviewsHeaderView](self, "_reviewsHeaderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
    {
      objc_msgSend(v10, "frame");
      v7 = v11;
    }
    else
    {
      v7 = 0.0;
    }
    goto LABEL_12;
  }
  v7 = 0.0;
  if (a4 == 1)
  {
    if (self->_reviewList)
    {
      -[SKUIProductPageReviewsViewController _histogramViewController](self, "_histogramViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  else if (!a4)
  {
    facebookViewController = self->_facebookViewController;
    if (facebookViewController)
    {
      -[SKUIReviewsFacebookViewController view](facebookViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      -[SKUIProductPageReviewsViewController _defaultPageWidth](self, "_defaultPageWidth");
      objc_msgSend(v9, "sizeThatFits:");
      v7 = v13;
LABEL_12:

    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double *v13;
  double v14;
  double *v15;
  double v16;
  double *v17;

  v5 = a4;
  if (objc_msgSend(v5, "section") == 2)
  {
    v6 = objc_msgSend(v5, "row");
    -[SKUILayoutCache layoutForIndex:](self->_layoutCache, "layoutForIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "requiresTruncation")
        && (-[NSMutableIndexSet containsIndex:](self->_expandedIndexSet, "containsIndex:", v6) & 1) == 0)
      {
        objc_msgSend(v8, "truncatedSize");
      }
      else
      {
        objc_msgSend(v8, "textSize");
      }
      if (self->_isPad)
        v11 = (double *)&kSKUITextBoxLayoutMarginTopIPad;
      else
        v11 = (double *)&kSKUITextBoxLayoutMarginTopIPhone;
      v12 = *v11;
      v13 = (double *)&kSKUITextBoxLayoutTitleHeightIPad;
      if (!self->_isPad)
        v13 = (double *)&kSKUITextBoxLayoutTitleHeightIPhone;
      v14 = v12 + *v13;
      v15 = (double *)&kSKUITextBoxLayoutTextRatingBottomPaddingIPad;
      if (!self->_isPad)
        v15 = (double *)&kSKUITextBoxLayoutTextRatingBottomPaddingIPhone;
      v16 = v14 + *v15 + 14.0 + 5.0;
      v17 = (double *)&kSKUITextBoxLayoutMarginBottomIPad;
      if (!self->_isPad)
        v17 = (double *)&kSKUITextBoxLayoutMarginBottomIPhone;
      v10 = v9 + v16 + *v17;
    }
    else
    {
      v10 = 100.0;
    }

  }
  else
  {
    v10 = 100.0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[SKUIProductPage uber](self->_productPage, "uber", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if (a4 == 2)
  {
    -[SKUIProductPageReviewsViewController _reviewsHeaderView](self, "_reviewsHeaderView");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    if (self->_reviewList)
    {
      -[SKUIProductPageReviewsViewController _histogramViewController](self, "_histogramViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  if (a4)
    goto LABEL_12;
  -[SKUIReviewsFacebookViewController view](self->_facebookViewController, "view");
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v12;
LABEL_13:
  objc_msgSend(v13, "setBackgroundColor:", v11);

  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  SKUIProductPage *productPage;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a4;
  productPage = self->_productPage;
  v10 = a5;
  -[SKUIProductPage uber](productPage, "uber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorScheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v8, "setBackgroundColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v14);

  }
  v15 = objc_msgSend(v10, "section");

  if (v15 == 3)
  {
    objc_msgSend(v8, "startAnimating");
    objc_msgSend(v16, "contentOffset");
    -[SKUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
  }

}

- (void)_appSupportAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SKUIProductPage item](self->_productPage, "item", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportURLString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIMetricsOpenURL(v5);

    v4 = v6;
  }

}

- (void)_sortSelectionAction:(id)a3
{
  int64_t sortOrder;
  unint64_t v5;
  SSVLoadURLOperation *loadOperation;

  sortOrder = self->_sortOrder;
  v5 = -[SKUIIPadCustomerReviewsHeaderView selectedSortIndex](self->_reviewsHeaderView, "selectedSortIndex", a3);
  if (v5 <= 3)
    sortOrder = qword_1BBED1F30[v5];
  if (self->_sortOrder != sortOrder)
  {
    self->_sortOrder = sortOrder;
    -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
    -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
    loadOperation = self->_loadOperation;
    self->_loadOperation = 0;

    -[SKUIProductPageReviewsViewController _reloadData](self, "_reloadData");
  }
}

- (void)_starRatingAction:(id)a3
{
  id v4;
  int64_t v5;
  SKUIStarRatingQueue *v6;
  SKUIClientContext *clientContext;
  void *v8;
  SKUIStarRatingQueue *v9;
  SKUIStarRatingQueue *starRatingQueue;
  SKUIStarRatingQueue *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SKUIStarRatingQueue *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  v5 = -[SKUIReviewsHistogramViewController personalStarRating](self->_histogramViewController, "personalStarRating");
  if (!self->_starRatingQueue)
  {
    v6 = [SKUIStarRatingQueue alloc];
    clientContext = self->_clientContext;
    -[SKUIProductPage reviewConfiguration](self->_productPage, "reviewConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SKUIStarRatingQueue initWithClientContext:reviewConfiguration:](v6, "initWithClientContext:reviewConfiguration:", clientContext, v8);
    starRatingQueue = self->_starRatingQueue;
    self->_starRatingQueue = v9;

    v11 = self->_starRatingQueue;
    -[SKUIProductPageReviewsViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStarRatingQueue setWindow:](v11, "setWindow:", v13);

  }
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[SKUIProductPage item](self->_productPage, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v15, "itemIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = self->_starRatingQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__SKUIProductPageReviewsViewController__starRatingAction___block_invoke;
  v18[3] = &unk_1E73A2028;
  objc_copyWeak(&v19, &location);
  -[SKUIStarRatingQueue setRating:forItemID:completionBlock:](v17, "setRating:forItemID:completionBlock:", v5, v16, v18);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __58__SKUIProductPageReviewsViewController__starRatingAction___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v3;

  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SKUIProductPageReviewsViewController__starRatingAction___block_invoke_2;
    block[3] = &unk_1E739FF68;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v3);
  }
}

void __58__SKUIProductPageReviewsViewController__starRatingAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetPersonalStarRating");

}

- (void)_versionSelectionAction:(id)a3
{
  _BOOL4 v4;
  SSVLoadURLOperation *loadOperation;

  v4 = -[SKUIReviewsHistogramViewController selectedSegmentIndex](self->_histogramViewController, "selectedSegmentIndex", a3) == 1;
  if (self->_showAllVersions != v4)
  {
    self->_showAllVersions = v4;
    -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
    -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
    loadOperation = self->_loadOperation;
    self->_loadOperation = 0;

    -[SKUIProductPageReviewsViewController _reloadData](self, "_reloadData");
  }
}

- (void)_writeAReviewAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (!self->_composeViewController)
  {
    v5 = objc_alloc(MEMORY[0x1E0CD8010]);
    -[SKUIReviewList writeReviewURL](self->_reviewList, "writeReviewURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCompositionURL:", v6);

    objc_msgSend(v7, "setDelegate:", self);
    objc_storeStrong((id *)&self->_composeViewController, v7);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__SKUIProductPageReviewsViewController__writeAReviewAction___block_invoke;
    v9[3] = &unk_1E739FDB0;
    objc_copyWeak(&v11, &location);
    v8 = v7;
    v10 = v8;
    objc_msgSend(v8, "prepareWithCompletionBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __60__SKUIProductPageReviewsViewController__writeAReviewAction___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

  }
}

- (void)_addHeaderView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[SKUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 2);
  objc_msgSend(v8, "frame");
  v4 = v3;
  -[SKUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  -[SKUIProductPageTableView _addContentSubview:atBack:](self->_tableView, "_addContentSubview:atBack:", v8, 0);
  -[SKUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[SKUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  -[SKUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", v5);

}

- (void)_addReviewsFromResponse:(id)a3 error:(id)a4
{
  id v5;
  SSVLoadURLOperation *loadOperation;
  SKUIReviewList *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  SKUIProductPageTableView *tableView;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  SKUIReviewList *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[SKUIReviewList initWithReviewListDictionary:]([SKUIReviewList alloc], "initWithReviewListDictionary:", v5);
    -[SKUIReviewList reviews](v7, "reviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 > 0)
    {
      v28 = v9;
      v31 = v7;
      v32 = v5;
      -[SKUIReviewList reviews](self->_reviewList, "reviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      v29 = -[SKUIProductPageReviewsViewController _shouldShowLoadMoreCell](self, "_shouldShowLoadMoreCell");
      -[SKUIReviewList addReviews:](self->_reviewList, "addReviews:", v8);
      ++self->_loadedPageCount;
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v30 = v8;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "body");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            if (v18)
              v20 = (const __CFString *)v18;
            else
              v20 = &stru_1E73A9FB0;
            -[SKUIProductPageReviewsViewController _textLayoutRequestWithText:](self, "_textLayoutRequestWithText:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v21);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v15);
      }

      -[SKUILayoutCache populateCacheWithLayoutRequests:](self->_layoutCache, "populateCacheWithLayoutRequests:", v12);
      -[SKUIProductPageTableView beginUpdates](self->_tableView, "beginUpdates");
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = v11 + v28;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v24);

        ++v11;
      }
      while (v11 < v23);
      -[SKUIProductPageTableView insertRowsAtIndexPaths:withRowAnimation:](self->_tableView, "insertRowsAtIndexPaths:withRowAnimation:", v22, 5);
      if (v29 && !-[SKUIProductPageReviewsViewController _shouldShowLoadMoreCell](self, "_shouldShowLoadMoreCell"))
      {
        tableView = self->_tableView;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIProductPageTableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v27, 5);

      }
      -[SKUIProductPageTableView endUpdates](self->_tableView, "endUpdates");

      v7 = v31;
      v5 = v32;
      v8 = v30;
    }
    -[SKUIProductPageTableView contentOffset](self->_tableView, "contentOffset");
    -[SKUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");

  }
}

- (id)_bottomBorderColorForScheme:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "primaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (double)_defaultPageWidth
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;

  if (self->_isPad)
    return 630.0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    return 320.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v2 = v6;

  return v2;
}

- (id)_histogramViewController
{
  SKUIReviewsHistogramViewController *histogramViewController;
  SKUIReviewsHistogramViewController *v4;
  SKUIReviewsHistogramViewController *v5;
  void *v6;
  uint64_t v7;
  SKUIClientContext *clientContext;
  id v9;
  void *v10;
  SKUIClientContext *v11;
  id v12;
  void *v13;
  SKUIReviewsHistogramViewController *v14;
  void *v15;
  SKUIReviewsHistogramViewController *v16;
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
  void *v28;
  void *v29;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  histogramViewController = self->_histogramViewController;
  if (!histogramViewController)
  {
    v4 = objc_alloc_init(SKUIReviewsHistogramViewController);
    v5 = self->_histogramViewController;
    self->_histogramViewController = v4;

    -[SKUIReviewsHistogramViewController setClientContext:](self->_histogramViewController, "setClientContext:", self->_clientContext);
    -[SKUIReviewsHistogramViewController setReviewList:](self->_histogramViewController, "setReviewList:", self->_reviewList);
    -[SKUIProductPage item](self->_productPage, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "itemKind");

    if (v7 != 17)
    {
      clientContext = self->_clientContext;
      if (clientContext)
      {
        -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_CURRENT_VERSION"), CFSTR("ProductPage"));
      }
      else
      {
        v9 = 0;
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_CURRENT_VERSION"), 0, CFSTR("ProductPage"));
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = self->_clientContext;
      if (v11)
      {
        -[SKUIClientContext localizedStringForKey:inTable:](v11, "localizedStringForKey:inTable:", CFSTR("REVIEWS_ALL_VERSIONS"), CFSTR("ProductPage"));
      }
      else
      {
        v12 = 0;
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_ALL_VERSIONS"), 0, CFSTR("ProductPage"));
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = self->_histogramViewController;
      v31[0] = v10;
      v31[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewsHistogramViewController setSegmentedControlTitles:](v14, "setSegmentedControlTitles:", v15);

      -[SKUIReviewsHistogramViewController setSelectedSegmentIndex:](self->_histogramViewController, "setSelectedSegmentIndex:", self->_showAllVersions);
      v16 = self->_histogramViewController;
      if (self->_showAllVersions)
      {
        -[SKUIReviewsHistogramViewController setVersionString:](self->_histogramViewController, "setVersionString:", 0);
      }
      else
      {
        -[SKUIProductPage item](self->_productPage, "item");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIReviewsHistogramViewController setVersionString:](v16, "setVersionString:", v18);

      }
    }
    -[SKUIReviewsHistogramViewController view](self->_histogramViewController, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAutoresizingMask:", 2);
    -[SKUIProductPage uber](self->_productPage, "uber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorScheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColorScheme:", v21);

    -[SKUIReviewsHistogramViewController appSupportButton](self->_histogramViewController, "appSupportButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__appSupportAction_, 64);

    -[SKUIReviewsHistogramViewController segmentedControl](self->_histogramViewController, "segmentedControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__versionSelectionAction_, 4096);

    -[SKUIReviewsHistogramViewController starRatingControl](self->_histogramViewController, "starRatingControl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__starRatingAction_, 4096);

    -[SKUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__writeAReviewAction_, 64);

    -[SKUIReviewsHistogramViewController appSupportButton](self->_histogramViewController, "appSupportButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEnabled:", !self->_askPermission);

    -[SKUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIClientContext clientInterface](self->_clientContext, "clientInterface");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "clientIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setEnabled:", v29 == 0);

    -[SKUIProductPageReviewsViewController addChildViewController:](self, "addChildViewController:", self->_histogramViewController);
    histogramViewController = self->_histogramViewController;
  }
  return histogramViewController;
}

- (id)_loadMoreCellForTableView:(id)a3 indexPath:(id)a4
{
  SKUILoadMoreCell *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("1"), a4);
  v4 = (SKUILoadMoreCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = -[SKUILoadMoreCell initWithStyle:reuseIdentifier:]([SKUILoadMoreCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("1"));
  return v4;
}

- (void)_loadNextPageIfNecessaryForOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int64_t loadedPageCount;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  id v15;
  void *v16;
  SSVLoadURLOperation *v17;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v19;
  void *v20;
  SSVLoadURLOperation *v21;
  void *v22;
  void *v23;
  SSVLoadURLOperation *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  y = a3.y;
  x = a3.x;
  if (-[SKUIProductPageReviewsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIProductPageReviewsViewController view](self, "view");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isHidden"))
    {

    }
    else
    {
      objc_msgSend(v27, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (!self->_loadOperation)
        {
          loadedPageCount = self->_loadedPageCount;
          if (loadedPageCount >= 1
            && loadedPageCount < -[SKUIReviewList numberOfPages](self->_reviewList, "numberOfPages"))
          {
            -[SKUIProductPageTableView contentInset](self->_tableView, "contentInset");
            -[SKUIProductPageTableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", x, y + v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              -[SKUIReviewList reviews](self->_reviewList, "reviews");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "count");

              v12 = objc_msgSend(v9, "row");
              if (v11 > v12 && v11 - v12 <= 10)
              {
                -[SKUIProductPageReviewsViewController _urlStringWithPageNumber:](self, "_urlStringWithPageNumber:", self->_loadedPageCount + 1);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_alloc(MEMORY[0x1E0DAF698]);
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = (SSVLoadURLOperation *)objc_msgSend(v15, "initWithURL:", v16);
                loadOperation = self->_loadOperation;
                self->_loadOperation = v17;

                v19 = self->_loadOperation;
                +[SSVURLDataConsumer consumer](SKUIJSONDataConsumer, "consumer");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[SSVLoadURLOperation setDataConsumer:](v19, "setDataConsumer:", v20);

                -[SSVLoadURLOperation setQueuePriority:](self->_loadOperation, "setQueuePriority:", -4);
                v21 = self->_loadOperation;
                -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[SSVLoadURLOperation setStoreFrontSuffix:](v21, "setStoreFrontSuffix:", v22);

                objc_msgSend(MEMORY[0x1E0DAF6F0], "weakReferenceWithObject:", self);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = self->_loadOperation;
                v28[0] = MEMORY[0x1E0C809B0];
                v28[1] = 3221225472;
                v28[2] = __74__SKUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke;
                v28[3] = &unk_1E73A5C50;
                v29 = v23;
                v25 = v23;
                -[SSVLoadURLOperation setOutputBlock:](v24, "setOutputBlock:", v28);
                -[SKUIProductPageReviewsViewController operationQueue](self, "operationQueue");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addOperation:", self->_loadOperation);

              }
            }

          }
        }
      }
    }
  }
}

void __74__SKUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SKUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke_2;
  block[3] = &unk_1E73A02E8;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__SKUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_addReviewsFromResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_reloadData
{
  void *v3;
  id v4;
  void *v5;
  SSVLoadURLOperation *v6;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  void *v11;
  void *v12;
  SSVLoadURLOperation *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  -[SKUIProductPageReviewsViewController _urlStringWithPageNumber:](self, "_urlStringWithPageNumber:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DAF698]);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SSVLoadURLOperation *)objc_msgSend(v4, "initWithURL:", v5);
  loadOperation = self->_loadOperation;
  self->_loadOperation = v6;

  v8 = self->_loadOperation;
  +[SSVURLDataConsumer consumer](SKUIJSONDataConsumer, "consumer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v8, "setDataConsumer:", v9);

  v10 = self->_loadOperation;
  -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setStoreFrontSuffix:](v10, "setStoreFrontSuffix:", v11);

  objc_msgSend(MEMORY[0x1E0DAF6F0], "weakReferenceWithObject:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_loadOperation;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__SKUIProductPageReviewsViewController__reloadData__block_invoke;
  v16[3] = &unk_1E73A5C50;
  v17 = v12;
  v14 = v12;
  -[SSVLoadURLOperation setOutputBlock:](v13, "setOutputBlock:", v16);
  -[SKUIProductPageReviewsViewController operationQueue](self, "operationQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", self->_loadOperation);

}

void __51__SKUIProductPageReviewsViewController__reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SKUIProductPageReviewsViewController__reloadData__block_invoke_2;
  block[3] = &unk_1E73A02E8;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__SKUIProductPageReviewsViewController__reloadData__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setReviewListWithResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_resetPersonalStarRating
{
  -[SKUIReviewsHistogramViewController setPersonalStarRating:](self->_histogramViewController, "setPersonalStarRating:", 0);
}

- (id)_reviewsHeaderView
{
  SKUIIPadCustomerReviewsHeaderView *reviewsHeaderView;
  SKUIIPadCustomerReviewsHeaderView *v4;
  SKUIIPadCustomerReviewsHeaderView *v5;
  SKUIIPadCustomerReviewsHeaderView *v6;
  void *v7;
  void *v8;
  SKUIClientContext *clientContext;
  id v11;
  void *v12;
  SKUIClientContext *v13;
  id v14;
  void *v15;
  SKUIClientContext *v16;
  id v17;
  void *v18;
  SKUIClientContext *v19;
  id v20;
  void *v21;
  SKUIIPadCustomerReviewsHeaderView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  reviewsHeaderView = self->_reviewsHeaderView;
  if (!reviewsHeaderView)
  {
    if (!self->_isPad)
      return 0;
    v4 = -[SKUIIPadCustomerReviewsHeaderView initWithClientContext:]([SKUIIPadCustomerReviewsHeaderView alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_reviewsHeaderView;
    self->_reviewsHeaderView = v4;

    v6 = self->_reviewsHeaderView;
    -[SKUIProductPage uber](self->_productPage, "uber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPadCustomerReviewsHeaderView setColorScheme:](v6, "setColorScheme:", v8);

    -[SKUIIPadCustomerReviewsHeaderView addTarget:action:forControlEvents:](self->_reviewsHeaderView, "addTarget:action:forControlEvents:", self, sel__sortSelectionAction_, 4096);
    -[SKUIIPadCustomerReviewsHeaderView setAutoresizingMask:](self->_reviewsHeaderView, "setAutoresizingMask:", 2);
    clientContext = self->_clientContext;
    if (clientContext)
    {
      -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_CRITICAL"), CFSTR("ProductPage"));
    }
    else
    {
      v11 = 0;
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_CRITICAL"), 0, CFSTR("ProductPage"));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_clientContext;
    if (v13)
    {
      -[SKUIClientContext localizedStringForKey:inTable:](v13, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_FAVORABLE"), CFSTR("ProductPage"));
    }
    else
    {
      v14 = 0;
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_FAVORABLE"), 0, CFSTR("ProductPage"));
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = self->_clientContext;
    if (v16)
    {
      -[SKUIClientContext localizedStringForKey:inTable:](v16, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_RECENT"), CFSTR("ProductPage"));
    }
    else
    {
      v17 = 0;
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_RECENT"), 0, CFSTR("ProductPage"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self->_clientContext;
    if (v19)
    {
      -[SKUIClientContext localizedStringForKey:inTable:](v19, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_HELPFUL"), CFSTR("ProductPage"));
    }
    else
    {
      v20 = 0;
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_HELPFUL"), 0, CFSTR("ProductPage"));
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = self->_reviewsHeaderView;
    v30[0] = v21;
    v30[1] = v18;
    v30[2] = v15;
    v30[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPadCustomerReviewsHeaderView setSortTitles:](v22, "setSortTitles:", v23);

    -[SKUIIPadCustomerReviewsHeaderView sizeToFit](self->_reviewsHeaderView, "sizeToFit");
    -[SKUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__appSupportAction_, 64);

    -[SKUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__writeAReviewAction_, 64);

    -[SKUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEnabled:", !self->_askPermission);

    -[SKUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIClientContext clientInterface](self->_clientContext, "clientInterface");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "clientIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setEnabled:", v29 == 0);

    reviewsHeaderView = self->_reviewsHeaderView;
  }
  return reviewsHeaderView;
}

- (void)_setReviewListWithResponse:(id)a3 error:(id)a4
{
  id v5;
  SSVLoadURLOperation *loadOperation;
  SKUIReviewList *v7;
  SKUIReviewList *reviewList;
  SKUILayoutCache *layoutCache;
  SKUILayoutCache *v10;
  SKUILayoutCache *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  SKUIReviewsHistogramViewController *histogramViewController;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v5;
    v7 = -[SKUIReviewList initWithReviewListDictionary:]([SKUIReviewList alloc], "initWithReviewListDictionary:", v5);
    reviewList = self->_reviewList;
    self->_reviewList = v7;

    self->_loadedPageCount = 1;
    -[SKUILayoutCache setDelegate:](self->_layoutCache, "setDelegate:", 0);
    layoutCache = self->_layoutCache;
    self->_layoutCache = 0;

    v10 = objc_alloc_init(SKUILayoutCache);
    v11 = self->_layoutCache;
    self->_layoutCache = v10;

    -[SKUILayoutCache setDelegate:](self->_layoutCache, "setDelegate:", self);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[SKUIReviewList reviews](self->_reviewList, "reviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "body");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
            v20 = (const __CFString *)v18;
          else
            v20 = &stru_1E73A9FB0;
          -[SKUIProductPageReviewsViewController _textLayoutRequestWithText:](self, "_textLayoutRequestWithText:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    -[SKUILayoutCache populateCacheWithLayoutRequests:](self->_layoutCache, "populateCacheWithLayoutRequests:", v12);
    -[SKUIReviewsHistogramViewController setReviewList:](self->_histogramViewController, "setReviewList:", self->_reviewList);
    histogramViewController = self->_histogramViewController;
    if (self->_showAllVersions)
    {
      -[SKUIReviewsHistogramViewController setVersionString:](self->_histogramViewController, "setVersionString:", 0);
    }
    else
    {
      -[SKUIProductPage item](self->_productPage, "item");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "versionString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReviewsHistogramViewController setVersionString:](histogramViewController, "setVersionString:", v24);

    }
    -[SKUIProductPageTableView reloadData](self->_tableView, "reloadData");

    v5 = v25;
  }

}

- (BOOL)_shouldShowLoadMoreCell
{
  int64_t loadedPageCount;

  loadedPageCount = self->_loadedPageCount;
  return !loadedPageCount || loadedPageCount < -[SKUIReviewList numberOfPages](self->_reviewList, "numberOfPages");
}

- (id)_tableView
{
  SKUIProductPageTableView *tableView;
  SKUIProductPageTableView *v4;
  SKUIProductPageTableView *v5;
  SKUIProductPageTableView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc_init(SKUIProductPageTableView);
    v5 = self->_tableView;
    self->_tableView = v4;

    v6 = self->_tableView;
    -[SKUIProductPage uber](self->_productPage, "uber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SKUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v10);

    }
    -[SKUIProductPageTableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[SKUIProductPageTableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[SKUIProductPageTableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    -[SKUIProductPageTableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
    if (self->_headerViewController)
      -[SKUIProductPageReviewsViewController _addHeaderView](self, "_addHeaderView");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoadScrollView:", self);

    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_textBoxCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  SKUITextBoxTableViewCell *v7;
  SKUITextBoxTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SKUIClientContext *clientContext;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  float v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("0"));
  v7 = (SKUITextBoxTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    -[SKUITextBoxTableViewCell textBoxView](v7, "textBoxView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[SKUITextBoxTableViewCell initWithStyle:reuseIdentifier:]([SKUITextBoxTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("0"));
    -[SKUITextBoxTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
    -[SKUIProductPage uber](self->_productPage, "uber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIProductPageReviewsViewController _bottomBorderColorForScheme:](self, "_bottomBorderColorForScheme:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITableViewCell setBottomBorderColor:](v8, "setBottomBorderColor:", v12);

    -[SKUITextBoxTableViewCell textBoxView](v8, "textBoxView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColorScheme:", v11);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMoreButtonTitle:", v14);

  }
  v15 = objc_msgSend(v6, "row");

  -[SKUILayoutCache layoutForIndex:](self->_layoutCache, "layoutForIndex:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SKUIReviewList reviews](self->_reviewList, "reviews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setFixedWidthTextFrame:", objc_msgSend(v16, "textFrame"));
    if (-[NSMutableIndexSet containsIndex:](self->_expandedIndexSet, "containsIndex:", v15))
      v19 = 0;
    else
      v19 = 5;
    objc_msgSend(v9, "setNumberOfVisibleLines:", v19);
    objc_msgSend(v18, "rating");
    objc_msgSend(v9, "setRating:", (float)(v20 / 5.0));
    objc_msgSend(v18, "formattedBylineWithClientContext:", self->_clientContext);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRatingText:", v21);

    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = v15 + 1;
    objc_msgSend(v18, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%ld. %@"), v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v25);

  }
  else
  {
    objc_msgSend(v9, "reset");
  }

  return v8;
}

- (id)_textLayoutRequestWithText:(id)a3
{
  id v4;
  SKUITextLayoutRequest *v5;
  double v6;

  v4 = a3;
  v5 = objc_alloc_init(SKUITextLayoutRequest);
  -[SKUITextLayoutRequest setNumberOfLines:](v5, "setNumberOfLines:", 5);
  -[SKUITextLayoutRequest setText:](v5, "setText:", v4);

  -[SKUIProductPageReviewsViewController _defaultPageWidth](self, "_defaultPageWidth");
  -[SKUITextLayoutRequest setWidth:](v5, "setWidth:", v6 + -30.0);
  return v5;
}

- (id)_urlStringWithPageNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 showAllVersions;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  -[SKUIProductPage reviewConfiguration](self->_productPage, "reviewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[SKUIProductPage item](self->_productPage, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    showAllVersions = self->_showAllVersions;
    objc_msgSend(v7, "reviewsURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!showAllVersions)
    {
      objc_msgSend(v9, "stringByAppendingString:", CFSTR("&appVersion=current"));
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }

    if (a3)
      goto LABEL_11;
    v12 = 0;
LABEL_13:
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("&sort-key=%ld"), self->_sortOrder, v16, v17);
    goto LABEL_14;
  }
  if (self->_showAllVersions)
    objc_msgSend(v5, "allVersionsURLString");
  else
    objc_msgSend(v5, "currentVersionURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageNumberQueryParameter");
  v13 = objc_claimAutoreleasedReturnValue();
  v12 = (__CFString *)v13;
  if (!a3)
    goto LABEL_13;
  if (!v13)
LABEL_11:
    v12 = CFSTR("page-number");
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("&sort-key=%ld&%@=%ld"), self->_sortOrder, v12, a3);
LABEL_14:
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUIProductPageChildViewControllerDelegate)delegate
{
  return (SKUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (SKUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_starRatingQueue, 0);
  objc_storeStrong((id *)&self->_reviewsHeaderView, 0);
  objc_storeStrong((id *)&self->_reviewList, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_histogramViewController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_facebookViewController, 0);
  objc_storeStrong((id *)&self->_expandedIndexSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithProductPage:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageReviewsViewController initWithProductPage:]";
}

@end

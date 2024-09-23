@implementation SKUIProductPagePlaceholderViewController

- (SKUIProductPagePlaceholderViewController)initWithStyle:(int64_t)a3
{
  SKUIProductPagePlaceholderViewController *result;
  objc_super v6;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPagePlaceholderViewController initWithStyle:].cold.1();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIProductPagePlaceholderViewController;
  result = -[SKUIProductPagePlaceholderViewController init](&v6, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (void)loadView
{
  void *v3;

  -[SKUIProductPagePlaceholderViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPagePlaceholderViewController setView:](self, "setView:", v3);

  -[SKUIProductPagePlaceholderViewController _addHeaderView](self, "_addHeaderView");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPagePlaceholderViewController;
  -[SKUIProductPagePlaceholderViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPagePlaceholderViewController;
  -[SKUIProductPagePlaceholderViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIActivityIndicatorView stopAnimating](self->_indicator, "stopAnimating");
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidScroll:", self);

}

- (UIScrollView)scrollView
{
  SKUIProductPagePlaceholderScrollView *scrollView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *indicator;
  UIActivityIndicatorView *v6;
  double v7;
  SKUIClientContext *clientContext;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SKUIProductPagePlaceholderScrollView *v13;
  SKUIProductPagePlaceholderScrollView *v14;
  SKUIProductPagePlaceholderScrollView *v15;
  void *v16;
  void *v17;
  id WeakRetained;

  scrollView = self->_scrollView;
  if (!scrollView)
  {
    if (self->_style)
    {
      v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
      indicator = self->_indicator;
      self->_indicator = v4;

      -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
      v6 = self->_indicator;
      v7 = 40.0;
    }
    else
    {
      clientContext = self->_clientContext;
      if (clientContext)
        -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_NO_RELATED_CONTENT"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_NO_RELATED_CONTENT"), 0, CFSTR("ProductPage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SKUIProductPagePlaceholderView initWithPlaceholderString:isPad:]([SKUIProductPagePlaceholderView alloc], "initWithPlaceholderString:isPad:", v9, SKUIUserInterfaceIdiom(self->_clientContext) == 1);
      -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setTextColor:](v6, "setTextColor:", v10);

      -[SKUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[UIActivityIndicatorView setBackgroundColor:](v6, "setBackgroundColor:", v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIActivityIndicatorView setBackgroundColor:](v6, "setBackgroundColor:", v12);

      }
      v7 = 0.0;
    }
    v13 = objc_alloc_init(SKUIProductPagePlaceholderScrollView);
    v14 = self->_scrollView;
    self->_scrollView = v13;

    -[SKUIProductPagePlaceholderScrollView setIsPad:](self->_scrollView, "setIsPad:", SKUIUserInterfaceIdiom(self->_clientContext) == 1);
    -[SKUIProductPagePlaceholderScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
    v15 = self->_scrollView;
    -[SKUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[SKUIProductPagePlaceholderScrollView setBackgroundColor:](v15, "setBackgroundColor:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPagePlaceholderScrollView setBackgroundColor:](v15, "setBackgroundColor:", v17);

    }
    -[SKUIProductPagePlaceholderScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
    -[SKUIProductPagePlaceholderScrollView setOffset:](self->_scrollView, "setOffset:", v7);
    -[SKUIProductPagePlaceholderScrollView setPlaceholderView:](self->_scrollView, "setPlaceholderView:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoadScrollView:", self);

    scrollView = self->_scrollView;
  }
  return (UIScrollView *)scrollView;
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
    if (self->_scrollView)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "productPageChildViewControllerDidLoadScrollView:", self);

      v5 = obj;
    }
  }

}

- (void)setHeaderViewController:(id)a3
{
  SKUIProductPageHeaderViewController *v5;
  SKUIProductPageHeaderViewController **p_headerViewController;
  SKUIProductPageHeaderViewController *headerViewController;
  void *v8;
  void *v9;
  SKUIProductPageHeaderViewController *v10;

  v5 = (SKUIProductPageHeaderViewController *)a3;
  p_headerViewController = &self->_headerViewController;
  headerViewController = self->_headerViewController;
  v10 = v5;
  if (headerViewController != v5)
  {
    -[SKUIProductPageHeaderViewController view](headerViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[SKUIProductPageHeaderViewController floatingView](*p_headerViewController, "floatingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[SKUIProductPageHeaderViewController removeFromParentViewController](*p_headerViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SKUIProductPagePlaceholderViewController addChildViewController:](self, "addChildViewController:");
      if (-[SKUIProductPagePlaceholderViewController isViewLoaded](self, "isViewLoaded"))
        -[SKUIProductPagePlaceholderViewController _addHeaderView](self, "_addHeaderView");
    }
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
  -[SKUIProductPagePlaceholderScrollView bounds](self->_scrollView, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  -[SKUIProductPagePlaceholderScrollView addSubview:](self->_scrollView, "addSubview:", v8);
  -[SKUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[SKUIProductPagePlaceholderScrollView bounds](self->_scrollView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  -[SKUIProductPagePlaceholderScrollView addSubview:](self->_scrollView, "addSubview:", v5);

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (SKUIProductPageChildViewControllerDelegate)delegate
{
  return (SKUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithStyle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPagePlaceholderViewController initWithStyle:]";
}

@end

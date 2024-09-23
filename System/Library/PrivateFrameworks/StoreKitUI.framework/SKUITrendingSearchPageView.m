@implementation SKUITrendingSearchPageView

- (SKUITrendingSearchPageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUITrendingSearchPageView *v8;
  SKUITrendingSearchView *v9;
  uint64_t v10;
  SKUITrendingSearchView *trendingSearchView;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrendingSearchPageView initWithFrame:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUITrendingSearchPageView;
  v8 = -[SKUITrendingSearchPageView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUITrendingSearchView alloc];
    -[SKUITrendingSearchPageView bounds](v8, "bounds");
    v10 = -[SKUITrendingSearchView initWithFrame:](v9, "initWithFrame:");
    trendingSearchView = v8->_trendingSearchView;
    v8->_trendingSearchView = (SKUITrendingSearchView *)v10;

    -[SKUITrendingSearchView setAutoresizingMask:](v8->_trendingSearchView, "setAutoresizingMask:", 18);
    -[SKUITrendingSearchPageView addSubview:](v8, "addSubview:", v8->_trendingSearchView);
  }
  return v8;
}

- (UIEdgeInsets)contentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SKUITrendingSearchView layoutMargins](self->_trendingSearchView, "layoutMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SKUITrendingSearchView setLayoutMargins:](self->_trendingSearchView, "setLayoutMargins:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setPage:(id)a3
{
  SKUITrendingSearchPage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  SKUITrendingSearchPage *v15;
  _QWORD v16[5];
  id v17;

  v5 = (SKUITrendingSearchPage *)a3;
  if (self->_page != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_page, a3);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 1)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0DC3990];
      -[SKUITrendingSearchPageView page](self, "page");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "SKUITrending_defaultLabelWithText:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SKUITrendingSearchView setTrendingTitleView:](self->_trendingSearchView, "setTrendingTitleView:", v8);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SKUITrendingSearchPage searches](self->_page, "searches");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__SKUITrendingSearchPageView_setPage___block_invoke;
    v16[3] = &unk_1E73A37C8;
    v16[4] = self;
    v17 = v12;
    v14 = v12;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

    -[SKUITrendingSearchView setTrendingSearchViews:](self->_trendingSearchView, "setTrendingSearchViews:", v14);
    v5 = v15;
  }

}

void __38__SKUITrendingSearchPageView_setPage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3518];
  objc_msgSend(a2, "term");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SKUITrending_searchButtonWithTitle:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 64);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)setBackgroundColor:(id)a3
{
  SKUITrendingSearchView *trendingSearchView;
  id v5;
  objc_super v6;

  trendingSearchView = self->_trendingSearchView;
  v5 = a3;
  -[SKUITrendingSearchView setBackgroundColor:](trendingSearchView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUITrendingSearchPageView;
  -[SKUITrendingSearchPageView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SKUITrendingSearchView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_trendingSearchView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_buttonAction:(id)a3
{
  SKUITrendingSearchPage *page;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  id v10;

  page = self->_page;
  v5 = a3;
  -[SKUITrendingSearchPage searches](page, "searches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUITrendingSearchView trendingSearchViews](self->_trendingSearchView, "trendingSearchViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5);

  objc_msgSend(v6, "objectAtIndex:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "trendingSearchPageView:didSelectSearch:", self, v10);

}

- (SKUITrendingSearchPageViewDelegate)delegate
{
  return (SKUITrendingSearchPageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUITrendingSearchPage)page
{
  return self->_page;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchView, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITrendingSearchPageView initWithFrame:]";
}

@end

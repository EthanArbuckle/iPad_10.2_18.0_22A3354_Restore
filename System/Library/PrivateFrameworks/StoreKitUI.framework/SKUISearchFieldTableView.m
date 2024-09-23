@implementation SKUISearchFieldTableView

- (void)setTrendingSearchProvider:(id)a3
{
  SKUITrendingSearchProvider *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (SKUITrendingSearchProvider *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUISearchFieldTableView setTrendingSearchProvider:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_trendingSearchProvider != v5)
  {
    objc_storeStrong((id *)&self->_trendingSearchProvider, a3);
    if (self->_trendingSearchesVisible && !self->_page)
      -[SKUISearchFieldTableView _reloadData](self, "_reloadData");
  }

}

- (void)setTrendingSearchDelegate:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISearchFieldTableView setTrendingSearchDelegate:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_storeWeak((id *)&self->_trendingSearchDelegate, v4);
  -[SKUITrendingSearchPageView setDelegate:](self->_pageView, "setDelegate:", v4);

}

- (void)setTrendingSearchesVisible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISearchFieldTableView setTrendingSearchesVisible:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_trendingSearchesVisible != v3)
  {
    self->_trendingSearchesVisible = v3;
    if (v3 && !self->_page)
      -[SKUISearchFieldTableView _reloadData](self, "_reloadData");
    else
      -[SKUISearchFieldTableView _reloadView](self, "_reloadView");
  }
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)_reloadData
{
  SKUITrendingSearchPageViewDelegate **p_trendingSearchDelegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (self->_trendingSearchProvider)
  {
    p_trendingSearchDelegate = &self->_trendingSearchDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_trendingSearchDelegate);
      objc_msgSend(v6, "URLForTrendingSearchPageView:", self->_pageView);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    objc_initWeak(&location, self);
    -[SKUISearchFieldTableView trendingSearchProvider](self, "trendingSearchProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__SKUISearchFieldTableView__reloadData__block_invoke;
    v9[3] = &unk_1E73A62B8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "trendingSearchPageWithURL:completionBlock:", v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __39__SKUISearchFieldTableView__reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_setTrendingResponse:error:", v6, v5);

}

- (void)_setTrendingResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_page, a3);
    -[SKUISearchFieldTableView _reloadView](self, "_reloadView");
    v6 = v7;
  }

}

- (void)_reloadView
{
  _BOOL4 trendingSearchesVisible;
  SKUITrendingSearchPageView *pageView;
  SKUITrendingSearchPageView *v5;
  SKUITrendingSearchPageView *v6;
  id WeakRetained;
  double v8;
  double v9;
  id v10;
  id v11;

  trendingSearchesVisible = self->_trendingSearchesVisible;
  pageView = self->_pageView;
  if (trendingSearchesVisible)
  {
    if (!pageView)
    {
      if (self->_page)
      {
        v5 = objc_alloc_init(SKUITrendingSearchPageView);
        v6 = self->_pageView;
        self->_pageView = v5;

        WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
        -[SKUITrendingSearchPageView setDelegate:](self->_pageView, "setDelegate:", WeakRetained);

        -[SKUISearchFieldTableView addSubview:](self, "addSubview:", self->_pageView);
      }
    }
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[SKUISearchFieldTableView frame](self, "frame");
    -[SKUITrendingSearchPageView setFrame:](self->_pageView, "setFrame:", v8, v9);
    -[SKUITrendingSearchPageView setPage:](self->_pageView, "setPage:", self->_page);
    -[SKUITrendingSearchPageView setHidden:](self->_pageView, "setHidden:", 0);
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SKUISearchFieldTableView setTableFooterView:](self, "setTableFooterView:", v11);

  }
  else
  {
    -[SKUITrendingSearchPageView setHidden:](pageView, "setHidden:", 1);
    -[SKUISearchFieldTableView setTableFooterView:](self, "setTableFooterView:", 0);
  }
}

- (SKUITrendingSearchProvider)trendingSearchProvider
{
  return self->_trendingSearchProvider;
}

- (SKUITrendingSearchPageViewDelegate)trendingSearchDelegate
{
  return (SKUITrendingSearchPageViewDelegate *)objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
}

- (BOOL)trendingSearchesVisible
{
  return self->_trendingSearchesVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trendingSearchDelegate);
  objc_storeStrong((id *)&self->_trendingSearchProvider, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_page, 0);
}

- (void)setTrendingSearchProvider:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTrendingSearchDelegate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTrendingSearchesVisible:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end

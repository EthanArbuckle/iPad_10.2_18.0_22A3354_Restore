@implementation SKUIIPhoneDownloadsViewController

- (void)reloadDownloadsAtIndexes:(id)a3
{
  NSArray *downloads;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  downloads = self->_downloads;
  v5 = a3;
  v6 = (void *)-[NSArray copy](downloads, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SKUIIPhoneDownloadsViewController_reloadDownloadsAtIndexes___block_invoke;
  v8[3] = &unk_1E73A25B8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);

}

void __62__SKUIIPhoneDownloadsViewController_reloadDownloadsAtIndexes___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (objc_msgSend(*(id *)(a1 + 40), "count") > a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "cellView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 984));
  objc_msgSend(WeakRetained, "childViewController:artworkForDownload:", *(_QWORD *)(a1 + 32), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIConfigureDownloadsCellView(v7, v6, v9, 0, *(void **)(*(_QWORD *)(a1 + 32) + 1000));

}

- (void)setDownloads:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_downloads != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_downloads, a3);
    -[SKUIIPhoneDownloadsViewController _reload](self, "_reload");
    v5 = v6;
  }

}

- (void)loadView
{
}

- (void)viewDidLayoutSubviews
{
  UITableView *tableView;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  tableView = self->_tableView;
  v4 = SKUILayoutGuideInsets(self);
  SKUIScrollViewSetDefaultContentInsets(tableView, v4, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)SKUIIPhoneDownloadsViewController;
  -[SKUIIPhoneDownloadsViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  SKUIDownloadsChildViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;

  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(v8, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "childViewController:performActionForDownload:", self, v7);

  -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v8, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *downloads;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;

  downloads = self->_downloads;
  v6 = a4;
  -[NSArray objectAtIndex:](downloads, "objectAtIndex:", objc_msgSend(v6, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("a"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cellView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "childViewController:artworkForDownload:", self, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIConfigureDownloadsCellView(v9, v7, v11, 0, self->_clientContext);

  objc_msgSend(v8, "setSelectionStyle:", 0);
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIIPhoneDownloadsViewController tableView:numberOfRowsInSection:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return -[NSArray count](self->_downloads, "count");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 64.0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  if (v6 >= -[NSArray count](self->_downloads, "count"))
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(v5, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCancelable");

  }
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  SKUIDownloadsChildViewControllerDelegate **p_delegate;
  id v7;
  id WeakRetained;
  NSArray *downloads;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    p_delegate = &self->_delegate;
    v7 = a5;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    downloads = self->_downloads;
    v10 = objc_msgSend(v7, "row");

    -[NSArray objectAtIndex:](downloads, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "childViewController:removeDownloads:", self, v12);

  }
}

- (void)_reload
{
  void *v3;
  _UIContentUnavailableView *v4;
  SKUIClientContext *clientContext;
  void *v6;
  SKUIClientContext *v7;
  void *v8;
  id v9;
  _UIContentUnavailableView *v10;
  _UIContentUnavailableView *noContentView;
  _UIContentUnavailableView *v12;
  void *v13;
  id v14;

  if (-[NSArray count](self->_downloads, "count"))
  {
    -[UITableView reloadData](self->_tableView, "reloadData");
    -[SKUIIPhoneDownloadsViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v3;
    v4 = 0;
  }
  else
  {
    if (!self->_noContentView)
    {
      clientContext = self->_clientContext;
      if (clientContext)
        -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("NO_CONTENT_TITLE"), CFSTR("Download"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("NO_CONTENT_TITLE"), 0, CFSTR("Download"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self->_clientContext;
      if (v7)
        -[SKUIClientContext localizedStringForKey:inTable:](v7, "localizedStringForKey:inTable:", CFSTR("NO_CONTENT_MESSAGE"), CFSTR("Download"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("NO_CONTENT_MESSAGE"), 0, CFSTR("Download"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0DC40B8]);
      v10 = (_UIContentUnavailableView *)objc_msgSend(v9, "initWithFrame:title:style:", v6, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      noContentView = self->_noContentView;
      self->_noContentView = v10;

      v12 = self->_noContentView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContentUnavailableView setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[_UIContentUnavailableView setMessage:](self->_noContentView, "setMessage:", v8);
    }
    -[UITableView reloadData](self->_tableView, "reloadData");
    -[SKUIIPhoneDownloadsViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v3;
    v4 = self->_noContentView;
  }
  objc_msgSend(v3, "setOverlayView:", v4);

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIDownloadsChildViewControllerDelegate)delegate
{
  return (SKUIDownloadsChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)downloads
{
  return self->_downloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)tableView:(uint64_t)a3 numberOfRowsInSection:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end

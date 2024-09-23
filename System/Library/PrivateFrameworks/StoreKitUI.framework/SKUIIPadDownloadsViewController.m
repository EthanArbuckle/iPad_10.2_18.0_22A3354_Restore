@implementation SKUIIPadDownloadsViewController

- (void)setDownloads:(id)a3
{
  id v3;
  NSArray *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray **p_downloads;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  NSArray *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIIPadDownloadsViewController setDownloads:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_downloads = &self->_downloads;
  if (self->_downloads != v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_editing)
    {
      v27 = v3;
      v28 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            -[NSArray objectAtIndex:](*p_downloads, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "item"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v21, "persistentIdentifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v18);
      }

      v3 = v27;
      v5 = v28;
    }
    objc_storeStrong((id *)&self->_downloads, v3);
    -[SKUIIPadDownloadsViewController _reload](self, "_reload");
    if (-[NSArray count](*p_downloads, "count"))
    {
      v23 = 0;
      while (1)
      {
        -[NSArray objectAtIndex:](*p_downloads, "objectAtIndex:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v24, "persistentIdentifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "containsObject:", v25))
          goto LABEL_20;
        v26 = objc_msgSend(v24, "isCancelable");

        if (v26)
          break;
LABEL_21:

        if (++v23 >= -[NSArray count](*p_downloads, "count"))
          goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v23, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v25, 0, 0);
LABEL_20:

      goto LABEL_21;
    }
LABEL_22:

  }
}

- (void)reloadDownloadsAtIndexes:(id)a3
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
  _QWORD v13[5];

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIIPadDownloadsViewController reloadDownloadsAtIndexes:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SKUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke;
  v13[3] = &unk_1E73A4750;
  v13[4] = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v13);

}

void __60__SKUIIPadDownloadsViewController_reloadDownloadsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "objectAtIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(WeakRetained, "childViewController:artworkForDownload:", *(_QWORD *)(a1 + 32), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIConfigureDownloadsCellView(v7, v6, v9, 1u, *(void **)(*(_QWORD *)(a1 + 32) + 1008));

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1000))
  {
    if (objc_msgSend(v6, "isCancelable"))
      v10 = 1;
    else
      v10 = 2;
    objc_msgSend(v12, "cellView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setButtonType:", 0);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v12, "setCellState:", v10);

}

- (void)loadView
{
  OUTLINED_FUNCTION_1();
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[SKUIIPadDownloadsViewController _reloadLayout](self, "_reloadLayout");
  v3.receiver = self;
  v3.super_class = (Class)SKUIIPadDownloadsViewController;
  -[SKUIIPadDownloadsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NSArray *downloads;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;

  downloads = self->_downloads;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndex:](downloads, "objectAtIndex:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("a"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "cellView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "childViewController:artworkForDownload:", self, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIConfigureDownloadsCellView(v11, v9, v13, 1u, self->_clientContext);

  if (self->_editing)
  {
    if (objc_msgSend(v9, "isCancelable"))
      v14 = 1;
    else
      v14 = 2;
    objc_msgSend(v10, "cellView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setButtonType:", 0);

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v10, "setCellState:", v14);

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
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
        -[SKUIIPadDownloadsViewController collectionView:numberOfItemsInSection:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return -[NSArray count](self->_downloads, "count");
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(a4, "item", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelable");

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  if (self->_editing)
  {
    -[SKUIIPadDownloadsViewController _reloadNavigationItem](self, "_reloadNavigationItem");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(v7, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "childViewController:performActionForDownload:", self, v6);

  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  if (self->_editing)
  {
    -[SKUIIPadDownloadsViewController _reloadNavigationItem](self, "_reloadNavigationItem");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(v7, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "childViewController:performActionForDownload:", self, v6);

  }
}

- (void)_editAction:(id)a3
{
  self->_editing = 1;
  -[SKUIIPadDownloadsViewController _reload](self, "_reload", a3);
}

- (void)_cancelAction:(id)a3
{
  self->_editing = 0;
  -[SKUIIPadDownloadsViewController _reload](self, "_reload", a3);
}

- (void)_deleteAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "item"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "childViewController:removeDownloads:", self, v4);

  self->_editing = 0;
  -[SKUIIPadDownloadsViewController _reload](self, "_reload");

}

- (void)_reload
{
  void *v3;
  SKUIClientContext *clientContext;
  void *v5;
  SKUIClientContext *v6;
  void *v7;
  id v8;
  _UIContentUnavailableView *v9;
  _UIContentUnavailableView *noContentView;
  _UIContentUnavailableView *v11;
  void *v12;
  void *v13;

  if (-[NSArray count](self->_downloads, "count"))
  {
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    -[SKUIIPadDownloadsViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverlayView:", 0);

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
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = self->_clientContext;
      if (v6)
        -[SKUIClientContext localizedStringForKey:inTable:](v6, "localizedStringForKey:inTable:", CFSTR("NO_CONTENT_MESSAGE"), CFSTR("Download"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("NO_CONTENT_MESSAGE"), 0, CFSTR("Download"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0DC40B8]);
      v9 = (_UIContentUnavailableView *)objc_msgSend(v8, "initWithFrame:title:style:", v5, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      noContentView = self->_noContentView;
      self->_noContentView = v9;

      v11 = self->_noContentView;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContentUnavailableView setBackgroundColor:](v11, "setBackgroundColor:", v12);

      -[_UIContentUnavailableView setMessage:](self->_noContentView, "setMessage:", v7);
    }
    -[SKUIIPadDownloadsViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOverlayView:", self->_noContentView);

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
  -[SKUIIPadDownloadsViewController _reloadNavigationItem](self, "_reloadNavigationItem");
}

- (void)_reloadLayout
{
  UICollectionView *collectionView;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  collectionView = self->_collectionView;
  v4 = SKUILayoutGuideInsets(self);
  SKUIScrollViewSetDefaultContentInsets(collectionView, v4, v5, v6, v7);
  -[SKUIIPadDownloadsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v12 = 2.0;
  if (v10 > 1000.0)
    v12 = 3.0;
  objc_msgSend(v11, "setItemSize:", v10 / v12, 100.0);
  objc_msgSend(v13, "invalidateLayout");

}

- (void)_reloadNavigationItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  SKUIClientContext *clientContext;
  void *v7;
  void *v8;
  void *v9;
  SKUIClientContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[SKUIIPadDownloadsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  if (-[NSArray count](self->_downloads, "count"))
  {
    if (self->_editing)
    {
      -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      clientContext = self->_clientContext;
      if (clientContext)
        -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("CANCEL"), CFSTR("Download"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CANCEL"), 0, CFSTR("Download"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_clientContext;
      if (v5)
      {
        if (v10)
          -[SKUIClientContext localizedStringForKey:inTable:](v10, "localizedStringForKey:inTable:", CFSTR("DELETE_FORMAT"), CFSTR("Download"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DELETE_FORMAT"), 0, CFSTR("Download"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v10)
          -[SKUIClientContext localizedStringForKey:inTable:](v10, "localizedStringForKey:inTable:", CFSTR("DELETE"), CFSTR("Download"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DELETE"), 0, CFSTR("Download"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 2, self, sel__cancelAction_);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v14, 0, self, sel__deleteAction_);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTintColor:", v17);

      objc_msgSend(v16, "setEnabled:", v5 > 0);
      -[SKUIIPadDownloadsViewController navigationItem](self, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v15;
      v21[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLeftBarButtonItems:", v19);

    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__editAction_);
      -[SKUIIPadDownloadsViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItems:", v9);

    }
  }
  else
  {
    -[SKUIIPadDownloadsViewController navigationItem](self, "navigationItem");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeftBarButtonItems:", 0);

  }
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)setDownloads:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadDownloadsAtIndexes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)collectionView:(uint64_t)a3 numberOfItemsInSection:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end

@implementation SKUIQuicklinksViewController

- (void)dealloc
{
  objc_super v3;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIQuicklinksViewController;
  -[SKUIQuicklinksViewController dealloc](&v3, sel_dealloc);
}

- (CGRect)frameForLinkAtIndex:(int64_t)a3
{
  UICollectionView *collectionView;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v5, "convertRect:toView:", 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (NSArray)indexPathsForVisibleItems
{
  return -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
}

- (void)setColoringWithColorScheme:(id)a3
{
  SKUIColorScheme *v4;
  SKUIColorScheme *colorScheme;

  if (self->_colorScheme != a3)
  {
    v4 = (SKUIColorScheme *)objc_msgSend(a3, "copy");
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

  }
}

- (void)setLinks:(id)a3
{
  NSArray *v4;
  NSArray *links;

  if (self->_links != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    links = self->_links;
    self->_links = v4;

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  id v11;

  width = a3.width;
  v6 = (id)-[SKUIQuicklinksViewController view](self, "view", a4, a3.width, a3.height);
  if (width <= 682.0)
    v7 = 1;
  else
    v7 = 3;
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemSize:", floor(width / (double)v7), 44.0);
  objc_msgSend(v11, "setNumberOfColumns:", v7);
  -[UICollectionView frame](self->_collectionView, "frame");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v8, v9, v10, ceilf((float)-[SKUIQuicklinksViewController _numberOfRows](self, "_numberOfRows") * 44.0));
  -[SKUIQuicklinksView sizeToFit](self->_quicklinksView, "sizeToFit");

}

- (void)loadView
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIQuicklinksViewController loadView]";
}

- (void)setTitle:(id)a3
{
  SKUIQuicklinksView *quicklinksView;
  id v5;
  objc_super v6;

  quicklinksView = self->_quicklinksView;
  v5 = a3;
  -[SKUIQuicklinksView setTitle:](quicklinksView, "setTitle:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIQuicklinksViewController;
  -[SKUIQuicklinksViewController setTitle:](&v6, sel_setTitle_, v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SKUIQuicklinksViewController;
  -[SKUIQuicklinksViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  int64_t result;
  int64_t v8;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  result = -[NSArray count](self->_links, "count");
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v8 = result / 3;
    if (result != 3 * (result / 3))
      ++v8;
    return 3 * v8;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("a"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "item");

  if (v9 >= -[NSArray count](self->_links, "count"))
  {
    objc_msgSend(v8, "configureForLink:", 0);
  }
  else
  {
    -[NSArray objectAtIndex:](self->_links, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureForLink:", v10);

  }
  objc_msgSend(v7, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBackgroundColor:", v11);
  objc_msgSend(v8, "setColoringWithColorScheme:", self->_colorScheme);
  -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setSeparatorColor:", v12);
  objc_msgSend(v8, "setSeparatorStyle:", 1);

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  unint64_t v5;
  id WeakRetained;
  char v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v5 = objc_msgSend(v10, "item");
  if (v5 < -[NSArray count](self->_links, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[NSArray objectAtIndex:](self->_links, "objectAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "quicklinksViewController:didSelectLink:atIndex:", self, v8, objc_msgSend(v10, "item"));

    }
  }

}

- (int64_t)_numberOfRows
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[NSArray count](self->_links, "count");
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfColumns");

  if (v3 % v5)
    return v3 / v5 + 1;
  else
    return v3 / v5;
}

- (SKUIQuicklinksViewControllerDelegate)delegate
{
  return (SKUIQuicklinksViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicklinksView, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end

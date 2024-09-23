@implementation SKUIHorizontalScrollingContainerViewController

- (void)dealloc
{
  objc_super v3;

  -[SKUIProxyScrollView setDelegate:](self->_proxyScrollView, "setDelegate:", 0);
  -[UICollectionView setDataSource:](self->_contentCollectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_contentCollectionView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIHorizontalScrollingContainerViewController;
  -[SKUIViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SKUIProxyScrollView *proxyScrollView;
  void *v13;
  double Width;
  double v15;
  double Height;
  double v17;
  void *v19;
  id v20;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)SKUIHorizontalScrollingContainerViewController;
  -[SKUIHorizontalScrollingContainerViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[SKUIHorizontalScrollingContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  proxyScrollView = self->_proxyScrollView;
  if (proxyScrollView)
  {
    -[SKUIProxyScrollView superview](proxyScrollView, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(v3, "addSubview:", self->_proxyScrollView);
  }
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  Width = CGRectGetWidth(v23);
  if (Width >= 2.0)
    v15 = Width;
  else
    v15 = 2.0;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v15;
  v24.size.height = v11;
  Height = CGRectGetHeight(v24);
  if (Height >= 2.0)
    v17 = Height;
  else
    v17 = 2.0;
  -[UICollectionView setFrame:](self->_contentCollectionView, "setFrame:", v5, v7, v15, v17);
  if (self->_contentCollectionViewItemSize.width != v9 || self->_contentCollectionViewItemSize.height != v11)
  {
    self->_contentCollectionViewItemSize.width = v9;
    self->_contentCollectionViewItemSize.height = v11;
    -[UICollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));

    objc_msgSend(v20, "setInvalidateFlowLayoutDelegateMetrics:", 1);
    -[UICollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invalidateLayoutWithContext:", v20);

  }
}

- (void)viewDidLoad
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIHorizontalScrollingContainerViewController viewDidLoad]";
}

- (id)contentScrollView
{
  SKUIProxyScrollView *v3;
  SKUIProxyScrollView *v4;
  SKUIProxyScrollView *proxyScrollView;
  void *v6;

  if (!self->_proxyScrollView
    && -[SKUIHorizontalScrollingContainerViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = [SKUIProxyScrollView alloc];
    v4 = -[SKUIProxyScrollView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    proxyScrollView = self->_proxyScrollView;
    self->_proxyScrollView = v4;

    -[SKUIProxyScrollView setHidden:](self->_proxyScrollView, "setHidden:", 1);
    -[SKUIProxyScrollView setDelegate:](self->_proxyScrollView, "setDelegate:", self);
    -[SKUIProxyScrollView setScrollEnabled:](self->_proxyScrollView, "setScrollEnabled:", 0);
    -[SKUIProxyScrollView setScrollsToTop:](self->_proxyScrollView, "setScrollsToTop:", 0);
    -[SKUIHorizontalScrollingContainerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_proxyScrollView);

  }
  return self->_proxyScrollView;
}

- (void)setClientContext:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKUIHorizontalScrollingContainerViewController;
  -[SKUIViewController setClientContext:](&v15, sel_setClientContext_, v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_viewControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF404628, (_QWORD)v11))
          objc_msgSend(v10, "setClientContext:", v4);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)scrollViewDidChangeContentInset:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  if (self->_proxyScrollView == a3)
  {
    objc_msgSend(a3, "contentInset");
    if (self->_proxyScrollViewContentInsetAdjustment.left != v5
      || self->_proxyScrollViewContentInsetAdjustment.top != v4
      || self->_proxyScrollViewContentInsetAdjustment.right != v7
      || self->_proxyScrollViewContentInsetAdjustment.bottom != v6)
    {
      self->_proxyScrollViewContentInsetAdjustment.top = v4;
      self->_proxyScrollViewContentInsetAdjustment.left = v5;
      self->_proxyScrollViewContentInsetAdjustment.bottom = v6;
      self->_proxyScrollViewContentInsetAdjustment.right = v7;
      -[SKUIHorizontalScrollingContainerViewController viewControllerContentScrollViewContentInset](self, "viewControllerContentScrollViewContentInset");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[SKUIHorizontalScrollingContainerViewController viewControllers](self, "viewControllers");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewControllers:](self, "_applyNewContentInset:toViewControllers:", v19, v12, v14, v16, v18);

    }
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (self->_contentCollectionView == a3)
    return -[NSArray count](self->_viewControllers, "count");
  else
    return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  id v7;
  NSArray *viewControllers;
  unint64_t v9;
  void *v10;
  id v11;

  if (self->_contentCollectionView == a3)
  {
    v7 = a4;
    objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B38F0, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    viewControllers = self->_viewControllers;
    v9 = objc_msgSend(v7, "item");

    -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:", v9 % -[NSArray count](self->_viewControllers, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "view");
    -[SKUIHorizontalScrollingContainerViewController viewControllerContentScrollViewContentInset](self, "viewControllerContentScrollViewContentInset");
    -[SKUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewController:](self, "_applyNewContentInset:toViewController:", v10);
    objc_msgSend(v4, "setViewController:", v10);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    v9 = v7;
    -[SKUIHorizontalScrollingContainerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "horizontalScrollingContainerViewController:willDisplayViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));

    v7 = v9;
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    v9 = v7;
    -[SKUIHorizontalScrollingContainerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "horizontalScrollingContainerViewController:didEndDisplayingViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));

    v7 = v9;
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  CGSize *p_contentCollectionViewItemSize;
  double width;
  double height;
  CGSize result;

  if (self->_contentCollectionView == a3)
    p_contentCollectionViewItemSize = &self->_contentCollectionViewItemSize;
  else
    p_contentCollectionViewItemSize = (CGSize *)MEMORY[0x1E0C9D820];
  width = p_contentCollectionViewItemSize->width;
  height = p_contentCollectionViewItemSize->height;
  if (p_contentCollectionViewItemSize->width < 2.0)
    width = 2.0;
  if (height < 2.0)
    height = 2.0;
  result.height = height;
  result.width = width;
  return result;
}

- (NSIndexPath)indexPathOfFocusedItem
{
  return (NSIndexPath *)-[SKUIHorizontalScrollingContainerViewController _indexPathOfFocusedContentItemWithDistanceToFocusedPosition:layoutAttributes:](self, "_indexPathOfFocusedContentItemWithDistanceToFocusedPosition:layoutAttributes:", 0, 0);
}

- (void)setMenuBarCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView **p_menuBarCollectionView;
  UICollectionView *menuBarCollectionView;
  void *v8;
  void *v9;
  UICollectionView *v10;

  v5 = (UICollectionView *)a3;
  p_menuBarCollectionView = &self->_menuBarCollectionView;
  menuBarCollectionView = self->_menuBarCollectionView;
  if (menuBarCollectionView != v5)
  {
    v10 = v5;
    -[UICollectionView _setContentOffsetRoundingEnabled:](menuBarCollectionView, "_setContentOffsetRoundingEnabled:", 1);
    -[UICollectionView delegate](*p_menuBarCollectionView, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF408B00))
      objc_msgSend(v8, "setScrollViewDelegateObserver:", 0);
    objc_storeStrong((id *)&self->_menuBarCollectionView, a3);
    -[UICollectionView _setContentOffsetRoundingEnabled:](*p_menuBarCollectionView, "_setContentOffsetRoundingEnabled:", 0);
    -[UICollectionView delegate](*p_menuBarCollectionView, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF408B00))
      objc_msgSend(v9, "setScrollViewDelegateObserver:", self);

    v5 = v10;
  }

}

- (void)setViewControllers:(id)a3
{
  SKUIHorizontalScrollingContainerViewController *v4;
  SKUIHorizontalScrollingContainerViewController *v5;
  _QWORD v6[4];
  SKUIHorizontalScrollingContainerViewController *v7;

  v4 = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SKUIHorizontalScrollingContainerViewController_setViewControllers___block_invoke;
  v6[3] = &unk_1E739FD38;
  v7 = v4;
  v5 = v4;
  -[SKUIHorizontalScrollingContainerViewController _setViewControllers:collectionViewsUpdateHandler:](v5, "_setViewControllers:collectionViewsUpdateHandler:", a3, v6);

}

uint64_t __69__SKUIHorizontalScrollingContainerViewController_setViewControllers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "reloadData");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadData");
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewContentOffsetsToTargetContentOffsets");
}

- (void)replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSUInteger v12;
  SKUIHorizontalScrollingContainerViewController *v13;
  SKUIHorizontalScrollingContainerViewController *v14;
  _QWORD v15[4];
  SKUIHorizontalScrollingContainerViewController *v16;
  id v17;
  NSUInteger v18;
  unint64_t v19;

  v6 = a4;
  v7 = (void *)-[NSArray mutableCopy](self->_viewControllers, "mutableCopy");
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, v6);
  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    v12 = -[NSArray count](self->_viewControllers, "count");
    v13 = self;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__SKUIHorizontalScrollingContainerViewController_replaceViewControllerAtIndex_withViewController___block_invoke;
    v15[3] = &unk_1E73A3520;
    v16 = v13;
    v18 = v12;
    v19 = a3;
    v17 = v6;
    v14 = v13;
    -[SKUIHorizontalScrollingContainerViewController _setViewControllers:collectionViewsUpdateHandler:](v14, "_setViewControllers:collectionViewsUpdateHandler:", v7, v15);

  }
  else
  {
    -[SKUIHorizontalScrollingContainerViewController setViewControllers:](self, "setViewControllers:", v7);
  }

}

void __98__SKUIHorizontalScrollingContainerViewController_replaceViewControllerAtIndex_withViewController___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "indexPathsForVisibleItems");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v7, "item", (_QWORD)v12) % *(_QWORD *)(a1 + 48) == *(_QWORD *)(a1 + 56))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "cellForItemAtIndexPath:", v7);
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  v10 = (id)objc_msgSend(*(id *)(a1 + 40), "view");
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "viewControllerContentScrollViewContentInset");
  objc_msgSend(v11, "_applyNewContentInset:toViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "setViewController:", *(_QWORD *)(a1 + 40));

}

- (void)scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double MidX;
  double v17;
  UICollectionView *contentCollectionView;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v4 = a4;
  -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_contentCollectionView, "layoutAttributesForItemAtIndexPath:", a3);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView bounds](self->_contentCollectionView, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UICollectionView contentOffset](self->_contentCollectionView, "contentOffset");
  v15 = v14;
  objc_msgSend(v20, "frame");
  MidX = CGRectGetMidX(v21);
  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  v17 = MidX + CGRectGetWidth(v22) * -0.5;
  contentCollectionView = self->_contentCollectionView;
  -[UICollectionView collectionViewLayout](contentCollectionView, "collectionViewLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "targetContentOffsetForProposedContentOffset:", v17, v15);
  -[UICollectionView setContentOffset:animated:](contentCollectionView, "setContentOffset:animated:", v4);

}

- (void)setNeedsViewControllerContentScrollViewContentInsetUpdate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[SKUIHorizontalScrollingContainerViewController viewControllerContentScrollViewContentInset](self, "viewControllerContentScrollViewContentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SKUIHorizontalScrollingContainerViewController viewControllers](self, "viewControllers");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewControllers:](self, "_applyNewContentInset:toViewControllers:", v11, v4, v6, v8, v10);

}

- (UIEdgeInsets)viewControllerContentScrollViewContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_proxyScrollViewContentInsetAdjustment.top;
  left = self->_proxyScrollViewContentInsetAdjustment.left;
  bottom = self->_proxyScrollViewContentInsetAdjustment.bottom;
  right = self->_proxyScrollViewContentInsetAdjustment.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_applyNewContentInset:(UIEdgeInsets)a3 toViewController:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  BOOL v20;
  void *v22;
  NSMapTable *viewControllerToExistingContentInsetAdjustment;
  NSMapTable *v24;
  NSMapTable *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSMapTable *v37;
  NSMapTable *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  if (v9)
  {
    v49 = v9;
    -[NSMapTable objectForKey:](self->_viewControllerToExistingContentInsetAdjustment, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UIEdgeInsetsValue");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v9 = v49;
    v19 = left == v14 && top == v12;
    v20 = v19 && right == v18;
    if (!v20 || bottom != v16)
    {
      objc_msgSend(v49, "contentScrollView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        viewControllerToExistingContentInsetAdjustment = self->_viewControllerToExistingContentInsetAdjustment;
        if (!viewControllerToExistingContentInsetAdjustment)
        {
          v24 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
          v25 = self->_viewControllerToExistingContentInsetAdjustment;
          self->_viewControllerToExistingContentInsetAdjustment = v24;

          viewControllerToExistingContentInsetAdjustment = self->_viewControllerToExistingContentInsetAdjustment;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", top, left, bottom, right);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](viewControllerToExistingContentInsetAdjustment, "setObject:forKey:", v26, v49);

        objc_msgSend(v22, "contentOffset");
        v47 = v28;
        v48 = v27;
        objc_msgSend(v22, "contentInset");
        v39 = v29;
        v40 = v30;
        v41 = v31;
        v42 = v32;
        objc_msgSend(v22, "scrollIndicatorInsets");
        v43 = v33;
        v44 = v34;
        v45 = v35;
        v46 = v36;
        objc_msgSend(v22, "setContentInset:", top + v39 - v12, left + v40 - v14, bottom + v41 - v16, right + v42 - v18);
        objc_msgSend(v22, "setScrollIndicatorInsets:", top + v43 - v12, left + v44 - v14, bottom + v45 - v16, right + v46 - v18);
        objc_msgSend(v22, "setContentOffset:", v48, v12 + v47 - top);
      }
      v37 = self->_viewControllerToExistingContentInsetAdjustment;
      if (v37 && !-[NSMapTable count](v37, "count"))
      {
        v38 = self->_viewControllerToExistingContentInsetAdjustment;
        self->_viewControllerToExistingContentInsetAdjustment = 0;

      }
      v9 = v49;
    }
  }

}

- (void)_applyNewContentInset:(UIEdgeInsets)a3 toViewControllers:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[SKUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewController:](self, "_applyNewContentInset:toViewController:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), top, left, bottom, right);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (id)_indexPathOfFocusedContentItemWithDistanceToFocusedPosition:(double *)a3 layoutAttributes:(id *)a4
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x1E0C80C00];
  -[UICollectionView layoutIfNeeded](self->_contentCollectionView, "layoutIfNeeded");
  -[UICollectionView bounds](self->_contentCollectionView, "bounds");
  UIRectGetCenter();
  v6 = v5;
  -[UICollectionView visibleCells](self->_contentCollectionView, "visibleCells");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        -[UICollectionView indexPathForCell:](self->_contentCollectionView, "indexPathForCell:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_contentCollectionView, "layoutAttributesForItemAtIndexPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "frame");
          v16 = CGRectGetMidX(v30) - v6;
          if (!v9 || fabs(v16) < fabs(v12))
          {
            v17 = v14;

            v18 = v15;
            v19 = v10;
            v10 = v18;

            v9 = v17;
            v12 = v16;
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v12 = 0.0;
  }
  if (a3)
    *a3 = v12;
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

- (void)_scrollViewDidScroll:(id)a3
{
  UICollectionView *v4;
  UICollectionView *v5;

  v4 = (UICollectionView *)a3;
  if ((UICollectionView *)self->_proxyScrollView != v4 && !self->_isHandlingScrollViewDidScroll)
  {
    self->_isHandlingScrollViewDidScroll = 1;
    if (self->_menuBarCollectionView == v4)
    {
      v5 = v4;
      -[SKUIHorizontalScrollingContainerViewController _synchronizeContentCollectionViewWithMenuBarCollectionView](self, "_synchronizeContentCollectionViewWithMenuBarCollectionView");
    }
    else
    {
      if (self->_contentCollectionView != v4)
      {
LABEL_8:
        self->_isHandlingScrollViewDidScroll = 0;
        goto LABEL_9;
      }
      v5 = v4;
      -[SKUIHorizontalScrollingContainerViewController _synchronizeMenuBarCollectionViewWithContentCollectionView](self, "_synchronizeMenuBarCollectionViewWithContentCollectionView");
    }
    v4 = v5;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_scrollViewWillBeginDecelerating:(id)a3
{
  UICollectionView *v4;
  UICollectionView *contentCollectionView;
  UICollectionView *v6;
  UICollectionView *v7;

  v4 = (UICollectionView *)a3;
  contentCollectionView = self->_contentCollectionView;
  if (self->_menuBarCollectionView == v4)
  {
    v7 = v4;
  }
  else
  {
    if (contentCollectionView != v4)
      goto LABEL_7;
    v7 = v4;
    contentCollectionView = self->_menuBarCollectionView;
  }
  v6 = contentCollectionView;
  v4 = v7;
  if (v6)
  {
    -[UICollectionView contentOffset](v6, "contentOffset");
    -[UICollectionView setContentOffset:animated:](v6, "setContentOffset:animated:", 0);

    v4 = v7;
  }
LABEL_7:

}

- (void)_setViewControllers:(id)a3 collectionViewsUpdateHandler:(id)a4
{
  NSArray *v6;
  void (**v7)(void);
  NSArray *viewControllers;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  SKUIHorizontalScrollingContainerViewController *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  char **v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  SKUIHorizontalScrollingContainerViewController *v29;
  NSArray *v30;
  void *v31;
  id v32;
  char **v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  NSArray *v47;
  void (**v48)(void);
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = (NSArray *)a3;
  v7 = (void (**)(void))a4;
  viewControllers = self->_viewControllers;
  if (viewControllers != v6 && !-[NSArray isEqualToArray:](viewControllers, "isEqualToArray:", v6))
  {
    v48 = v7;
    v9 = (void *)-[NSArray copy](self->_viewControllers, "copy");
    v47 = v6;
    v10 = (NSArray *)-[NSArray copy](v6, "copy");
    v11 = self->_viewControllers;
    self->_viewControllers = v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_viewControllers, "containsObject:", v18))
          {
            objc_msgSend(v12, "addObject:", v18);
            objc_msgSend(v18, "parentViewController");
            v19 = (SKUIHorizontalScrollingContainerViewController *)objc_claimAutoreleasedReturnValue();

            if (v19 == self)
              objc_msgSend(v18, "willMoveToParentViewController:", 0);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v12, "count"))
      -[SKUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewControllers:](self, "_applyNewContentInset:toViewControllers:", v12, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v21 = self->_viewControllers;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    v23 = &selRef_pageConfiguration;
    if (v22)
    {
      v24 = v22;
      v25 = *(_QWORD *)v59;
      do
      {
        v26 = 0;
        v49 = v24;
        do
        {
          if (*(_QWORD *)v59 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v26);
          if ((objc_msgSend(v13, "containsObject:", v27) & 1) == 0)
          {
            objc_msgSend(v20, "addObject:", v27);
            if (objc_msgSend(v27, "conformsToProtocol:", v23[317]))
            {
              -[SKUIViewController clientContext](self, "clientContext");
              v28 = v25;
              v29 = self;
              v30 = v21;
              v31 = v20;
              v32 = v13;
              v33 = v23;
              v34 = v12;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setClientContext:", v35);

              v12 = v34;
              v23 = v33;
              v13 = v32;
              v20 = v31;
              v21 = v30;
              self = v29;
              v25 = v28;
              v24 = v49;
            }
            -[SKUIHorizontalScrollingContainerViewController addChildViewController:](self, "addChildViewController:", v27);
          }
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v24);
    }

    v48[2]();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v36 = v20;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v55 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "didMoveToParentViewController:", self);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v38);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v41 = v12;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v51 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
          objc_msgSend(v46, "removeFromParentViewController");
          if (objc_msgSend(v46, "conformsToProtocol:", v23[317]))
            objc_msgSend(v46, "setClientContext:", 0);
          -[NSMapTable removeObjectForKey:](self->_viewControllerToExistingContentInsetAdjustment, "removeObjectForKey:", v46);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      }
      while (v43);
    }

    v6 = v47;
    v7 = v48;
  }

}

- (void)_synchronizeContentCollectionViewWithMenuBarCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[UICollectionView collectionViewLayout](self->_menuBarCollectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF48C850))
  {
    v10 = 0.0;
    objc_msgSend(v3, "menuBarFocusedItemIndexPathWithTransitionProgress:", &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_contentCollectionView, "layoutAttributesForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    Width = CGRectGetWidth(v11);
    -[UICollectionView contentOffset](self->_contentCollectionView, "contentOffset");
    v8 = v7;
    objc_msgSend(v5, "frame");
    v9 = CGRectGetMidX(v12) - v10 * Width;
    -[UICollectionView bounds](self->_contentCollectionView, "bounds");
    -[UICollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v9 + CGRectGetWidth(v13) * -0.5, v8);

  }
}

- (void)_synchronizeMenuBarCollectionViewWithContentCollectionView
{
  void *v3;
  id v4;
  void *v5;
  double Width;
  double v7;
  void *v8;
  double v9;
  id v10;
  double v11;
  CGRect v12;

  v10 = 0;
  v11 = 0.0;
  -[SKUIHorizontalScrollingContainerViewController _indexPathOfFocusedContentItemWithDistanceToFocusedPosition:layoutAttributes:](self, "_indexPathOfFocusedContentItemWithDistanceToFocusedPosition:layoutAttributes:", &v11, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v4, "frame");
    Width = CGRectGetWidth(v12);
    v7 = v11;
    -[UICollectionView collectionViewLayout](self->_menuBarCollectionView, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF48C850))
    {
      v9 = v7 / Width;
      if (v7 / Width < -1.0)
        v9 = -1.0;
      objc_msgSend(v8, "setMenuBarFocusedItemIndexPath:withTransitionProgress:", v3, fmin(v9, 1.0));
    }

  }
}

- (void)_updateScrollViewContentOffsetsToTargetContentOffsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;

  -[UICollectionView contentOffset](self->_menuBarCollectionView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[UICollectionView collectionViewLayout](self->_menuBarCollectionView, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetContentOffsetForProposedContentOffset:", v4, v6);
  v9 = v8;
  v11 = v10;

  if (v4 != v9 || v6 != v11)
    -[UICollectionView setContentOffset:](self->_menuBarCollectionView, "setContentOffset:", v9, v11);
  -[UICollectionView contentOffset](self->_contentCollectionView, "contentOffset");
  v14 = v13;
  v16 = v15;
  -[UICollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "targetContentOffsetForProposedContentOffset:", v14, v16);
  v19 = v18;
  v21 = v20;

  if (v14 != v19 || v16 != v21)
    -[UICollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v19, v21);
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (SKUIHorizontalScrollingContainerViewControllerDelegate)delegate
{
  return (SKUIHorizontalScrollingContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)menuBarCollectionView
{
  return self->_menuBarCollectionView;
}

- (BOOL)initialScrollWasPerformed
{
  return self->_initialScrollWasPerformed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuBarCollectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllerToExistingContentInsetAdjustment, 0);
  objc_storeStrong((id *)&self->_proxyScrollView, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end

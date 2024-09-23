@implementation MTCollectionView

- (MTCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  MTCollectionView *v4;
  MTCollectionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTCollectionView;
  v4 = -[MTCollectionView initWithFrame:collectionViewLayout:](&v7, "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[MTCollectionView setScrollsToTop:](v4, "setScrollsToTop:", 1);
  return v5;
}

- (void)setEditing:(BOOL)a3
{
  -[MTCollectionView setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (self->_editing != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_editing = a3;
    if (!a3
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView swipedCellIndexPath](self, "swipedCellIndexPath")),
          v7,
          !v7))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView visibleCells](self, "visibleCells", 0));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "setEditing:animated:", v5, v4);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
    -[MTCollectionView updateRefreshEnabledState](self, "updateRefreshEnabledState");
  }
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if ((-[MTCollectionView allowsMultipleSelection](self, "allowsMultipleSelection") & 1) == 0 && v3)
    -[MTCollectionView selectItemAtIndexPath:animated:scrollPosition:](self, "selectItemAtIndexPath:animated:scrollPosition:", 0, 0, 0);
  v5.receiver = self;
  v5.super_class = (Class)MTCollectionView;
  -[MTCollectionView setAllowsMultipleSelection:](&v5, "setAllowsMultipleSelection:", v3);
}

- (void)setDisableRefreshControlWhileEditing:(BOOL)a3
{
  self->_disableRefreshControlWhileEditing = a3;
  -[MTCollectionView updateRefreshEnabledState](self, "updateRefreshEnabledState");
}

- (void)setRefreshControl:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  objc_storeStrong((id *)&self->_refreshControl, a3);
  if (!-[MTCollectionView isEditing](self, "isEditing") || !self->_disableRefreshControlWhileEditing)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTCollectionView;
    -[MTCollectionView setRefreshControl:](&v6, "setRefreshControl:", v5);
  }

}

- (UIEdgeInsets)appliedInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[MTCollectionView contentInset](self, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView refreshControl](self, "refreshControl"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView refreshControl](self, "refreshControl"));
    objc_msgSend(v12, "_appliedInsets");
    v14 = v13;

    v4 = v4 - v14;
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGPoint)appliedContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[MTCollectionView appliedInsets](self, "appliedInsets");
  v4 = v3;
  -[MTCollectionView contentOffset](self, "contentOffset");
  v7 = v4 + v6;
  result.y = v7;
  result.x = v5;
  return result;
}

- (void)updateRefreshEnabledState
{
  UIRefreshControl *refreshControl;
  void *v4;

  if (self->_disableRefreshControlWhileEditing)
  {
    if (-[MTCollectionView isEditing](self, "isEditing"))
    {
      -[MTCollectionView disablePullToRefresh](self, "disablePullToRefresh");
    }
    else
    {
      refreshControl = self->_refreshControl;
      if (refreshControl)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIRefreshControl superview](refreshControl, "superview"));

        if (!v4)
          -[MTCollectionView enablePullToRefresh](self, "enablePullToRefresh");
      }
    }
  }
}

- (void)disablePullToRefresh
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTCollectionView;
  -[MTCollectionView setRefreshControl:](&v2, "setRefreshControl:", 0);
}

- (void)enablePullToRefresh
{
  UIRefreshControl *refreshControl;
  void *v4;

  if (!-[MTCollectionView disableRefreshControlWhileEditing](self, "disableRefreshControlWhileEditing")
    || !-[MTCollectionView isEditing](self, "isEditing"))
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIRefreshControl superview](refreshControl, "superview"));

      if (!v4)
        -[MTCollectionView setRefreshControl:](self, "setRefreshControl:", self->_refreshControl);
    }
  }
}

- (void)setSwipedCellIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath **p_swipedCellIndexPath;
  NSIndexPath *swipedCellIndexPath;
  unsigned __int8 v8;
  void *v9;
  NSIndexPath *v10;

  v5 = (NSIndexPath *)a3;
  p_swipedCellIndexPath = &self->_swipedCellIndexPath;
  swipedCellIndexPath = self->_swipedCellIndexPath;
  if (swipedCellIndexPath != v5)
  {
    v10 = v5;
    v8 = -[NSIndexPath isEqual:](swipedCellIndexPath, "isEqual:", v5);
    v5 = v10;
    if ((v8 & 1) == 0)
    {
      if (*p_swipedCellIndexPath)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:"));
        objc_msgSend(v9, "setEditing:", 0);
        if (!v10)
        {
          -[MTCollectionView setEditing:](self, "setEditing:", 0);
          -[MTCollectionView _sendDidEndEditingForIndexPath:](self, "_sendDidEndEditingForIndexPath:", *p_swipedCellIndexPath);
        }

      }
      objc_storeStrong((id *)&self->_swipedCellIndexPath, a3);
      v5 = v10;
      if (v10)
      {
        -[MTCollectionView _sendWillBeginEditingForIndexPath:](self, "_sendWillBeginEditingForIndexPath:", v10);
        -[MTCollectionView setEditing:](self, "setEditing:", 1);
        v5 = v10;
      }
    }
  }

}

- (void)setSwipeGesture:(id)a3
{
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *swipeGesture;
  UIPanGestureRecognizer *v7;

  v5 = (UIPanGestureRecognizer *)a3;
  swipeGesture = self->_swipeGesture;
  if (swipeGesture != v5)
  {
    v7 = v5;
    if (swipeGesture)
    {
      -[MTCollectionView removeGestureRecognizer:](self, "removeGestureRecognizer:");
      v5 = v7;
    }
    if (v5)
      -[MTCollectionView addGestureRecognizer:](self, "addGestureRecognizer:", v7);
    objc_storeStrong((id *)&self->_swipeGesture, a3);
    v5 = v7;
  }

}

- (void)_sendWillBeginEditingForIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "collectionView:willBeginEditingItemAtIndexPath:");

    v4 = v8;
    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView delegate](self, "delegate"));
      objc_msgSend(v7, "collectionView:willBeginEditingItemAtIndexPath:", self, v8);

      v4 = v8;
    }
  }

}

- (void)_sendDidEndEditingForIndexPath:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "collectionView:didEndEditingItemAtIndexPath:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView delegate](self, "delegate"));
    objc_msgSend(v6, "collectionView:didEndEditingItemAtIndexPath:", self, v7);

  }
}

- (void)swipeBegan:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView indexPathForCell:](self, "indexPathForCell:", a3));
  if (v4)
  {
    v5 = v4;
    -[MTCollectionView setSwipedCellIndexPath:](self, "setSwipedCellIndexPath:", v4);
    v4 = v5;
  }

}

- (void)swipeEnded:(id)a3
{
  -[MTCollectionView setSwipedCellIndexPath:](self, "setSwipedCellIndexPath:", 0);
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[MTCollectionView lockContentOffset](self, "lockContentOffset"))
  {
    v6.receiver = self;
    v6.super_class = (Class)MTCollectionView;
    -[MTCollectionView setContentOffset:](&v6, "setContentOffset:", x, y);
  }
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  objc_super v8;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (!-[MTCollectionView lockContentOffset](self, "lockContentOffset"))
  {
    v8.receiver = self;
    v8.super_class = (Class)MTCollectionView;
    -[MTCollectionView setContentOffset:animated:](&v8, "setContentOffset:animated:", v4, x, y);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v15;
  objc_super v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v16.receiver = self;
  v16.super_class = (Class)MTCollectionView;
  -[MTCollectionView contentInset](&v16, "contentInset");
  if (left != v11 || top != v8 || right != v10 || bottom != v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)MTCollectionView;
    -[MTCollectionView setContentInset:](&v15, "setContentInset:", top, left, bottom, right);
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTCollectionView;
  -[MTCollectionView layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionView refreshControl](self, "refreshControl"));
  -[MTCollectionView sendSubviewToBack:](self, "sendSubviewToBack:", v3);

}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTCollectionView;
  v5 = -[MTCollectionView cellForItemAtIndexPath:](&v8, "cellForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)disableRefreshControlWhileEditing
{
  return self->_disableRefreshControlWhileEditing;
}

- (BOOL)lockContentOffset
{
  return self->_lockContentOffset;
}

- (void)setLockContentOffset:(BOOL)a3
{
  self->_lockContentOffset = a3;
}

- (NSIndexPath)swipedCellIndexPath
{
  return self->_swipedCellIndexPath;
}

- (UIPanGestureRecognizer)swipeGesture
{
  return self->_swipeGesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeGesture, 0);
  objc_storeStrong((id *)&self->_swipedCellIndexPath, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
}

@end

@implementation UITableView

- (CGRect)mf_safeVisibleBounds
{
  double v3;
  double v4;
  double v5;
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
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[UITableView visibleBounds](self, "visibleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITableView safeAreaInsets](self, "safeAreaInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)mf_isIndexPathVisible:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  BOOL v15;
  CGRect v17;
  CGRect v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[UITableView rectForRowAtIndexPath:](self, "rectForRowAtIndexPath:", v4);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UITableView mf_safeVisibleBounds](self, "mf_safeVisibleBounds");
    v18.origin.x = v8;
    v18.origin.y = v10;
    v18.size.width = v12;
    v18.size.height = v14;
    v15 = CGRectContainsRect(v17, v18);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)mf_isIndexPathVisible:(id)a3 overlap:(CGRect)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  char v20;
  BOOL v21;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    -[UITableView rectForRowAtIndexPath:](self, "rectForRowAtIndexPath:", v5);
    -[UITableView convertRect:toView:](self, "convertRect:toView:", self);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[UITableView mf_safeVisibleBounds](self, "mf_safeVisibleBounds");
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    if (CGRectContainsRect(v24, v26))
    {
      v20 = 1;
    }
    else
    {
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v27.origin.x = v9;
      v27.origin.y = v11;
      v27.size.width = v13;
      v27.size.height = v15;
      v20 = CGRectIntersectsRect(v25, v27);
    }
    if (!CGRectIsNull(a4))
    {
      v28.origin.x = v9;
      v28.origin.y = v11;
      v28.size.width = v13;
      v28.size.height = v15;
      v21 = CGRectContainsRect(a4, v28);
      v29.origin.x = v9;
      v29.origin.y = v11;
      v29.size.width = v13;
      v29.size.height = v15;
      CGRectIntersectsRect(a4, v29);
      v20 &= !v21;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end

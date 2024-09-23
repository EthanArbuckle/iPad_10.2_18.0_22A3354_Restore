@implementation MTTableView

- (void)layoutSubviews
{
  _BOOL8 v3;
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double MaxY;
  void *v9;
  double v10;
  double MinY;
  double v12;
  void *v13;
  UIView *bottomFillView;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  UIView *overlayView;
  double v25;
  double v26;
  double v27;
  void *v28;
  unsigned int v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v37.receiver = self;
  v37.super_class = (Class)MTTableView;
  -[MTTableView layoutSubviews](&v37, "layoutSubviews");
  if (self->_bottomFillView)
  {
    v3 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    -[MTTableView bounds](self, "bounds");
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    MaxY = CGRectGetMaxY(v38);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView tableHeaderView](self, "tableHeaderView"));
    objc_msgSend(v9, "frame");
    v10 = CGRectGetMaxY(v39);

    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    MinY = CGRectGetMinY(v40);
    if (v10 >= MinY)
      v12 = v10;
    else
      v12 = MinY;
    v41.origin.x = x;
    v41.origin.y = v12;
    v41.size.width = width;
    v41.size.height = height;
    -[UIView setFrame:](self->_bottomFillView, "setFrame:", x, v12, width, (MaxY - CGRectGetMinY(v41)) * 1.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView backgroundView](self, "backgroundView"));

    bottomFillView = self->_bottomFillView;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView backgroundView](self, "backgroundView"));
      -[MTTableView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", bottomFillView, v15);

    }
    else
    {
      -[MTTableView sendSubviewToBack:](self, "sendSubviewToBack:", self->_bottomFillView);
    }
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v3);
  }
  if (self->_overlayView)
  {
    -[MTTableView bringSubviewToFront:](self, "bringSubviewToFront:");
    -[MTTableView bounds](self, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[MTTableView contentInset](self, "contentInset");
    overlayView = self->_overlayView;
    v26 = -v25;
    v42.origin.x = v17;
    v42.origin.y = v19;
    v42.size.width = v21;
    v42.size.height = v23;
    v27 = CGRectGetWidth(v42);
    v43.origin.x = v17;
    v43.origin.y = v19;
    v43.size.width = v21;
    v43.size.height = v23;
    -[UIView setFrame:](overlayView, "setFrame:", 0.0, v26, v27, CGRectGetHeight(v43));
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView refreshControl](self, "refreshControl"));
  if (objc_msgSend(v28, "isRefreshing"))
  {
    v29 = -[MTTableView adjustContentOffsetForRefreshControlAsNeeded](self, "adjustContentOffsetForRefreshControlAsNeeded");

    if (v29)
    {
      -[MTTableView contentOffset](self, "contentOffset");
      v31 = v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView refreshControl](self, "refreshControl"));
      objc_msgSend(v32, "frame");
      v33 = v31 - CGRectGetHeight(v44);
      -[MTTableView contentInset](self, "contentInset");
      v35 = -v34;

      if (v33 == v35)
      {
        -[MTTableView contentInset](self, "contentInset");
        -[MTTableView setContentOffset:](self, "setContentOffset:", 0.0, -v36);
      }
    }
  }
  else
  {

  }
}

- (void)setTableFooterView:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTableView tableFooterView](self, "tableFooterView"));

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTTableView;
    -[MTTableView setTableFooterView:](&v6, "setTableFooterView:", v4);
  }

}

- (void)setOverlayView:(id)a3
{
  UIView *v4;
  UIView *overlayView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  v6 = v4;

  -[MTTableView addSubview:](self, "addSubview:", v6);
}

- (void)setBottomFillColor:(id)a3
{
  UIView *bottomFillView;
  id v6;
  UIView *v7;
  UIView *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_bottomFillColor, a3);
  -[UIView removeFromSuperview](self->_bottomFillView, "removeFromSuperview");
  bottomFillView = self->_bottomFillView;
  if (!bottomFillView)
  {
    v6 = objc_alloc((Class)UIView);
    -[MTTableView bounds](self, "bounds");
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    v8 = self->_bottomFillView;
    self->_bottomFillView = v7;

    bottomFillView = self->_bottomFillView;
  }
  -[UIView setBackgroundColor:](bottomFillView, "setBackgroundColor:", v9);
  -[MTTableView addSubview:](self, "addSubview:", self->_bottomFillView);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTTableView;
  -[MTTableView setEditing:animated:](&v5, "setEditing:animated:", a3, a4);
  -[MTTableView updateRefreshControlEnabledState](self, "updateRefreshControlEnabledState");
}

- (void)setDisableRefreshControlWhileEditing:(BOOL)a3
{
  if (self->_disableRefreshControlWhileEditing != a3)
  {
    self->_disableRefreshControlWhileEditing = a3;
    -[MTTableView updateRefreshControlEnabledState](self, "updateRefreshControlEnabledState");
  }
}

- (void)updateRefreshControlEnabledState
{
  UIRefreshControl *refreshControl;
  void *v4;

  if (-[MTTableView disableRefreshControlWhileEditing](self, "disableRefreshControlWhileEditing")
    && -[MTTableView isEditing](self, "isEditing"))
  {
    -[MTTableView disablePullToRefresh](self, "disablePullToRefresh");
  }
  else
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIRefreshControl superview](refreshControl, "superview"));

      if (!v4)
        -[MTTableView enablePullToRefresh](self, "enablePullToRefresh");
    }
  }
}

- (void)disablePullToRefresh
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTTableView;
  -[MTTableView setRefreshControl:](&v2, "setRefreshControl:", 0);
}

- (void)enablePullToRefresh
{
  UIRefreshControl *refreshControl;
  void *v4;
  UIRefreshControl *v5;
  objc_super v6;

  if (!-[MTTableView disableRefreshControlWhileEditing](self, "disableRefreshControlWhileEditing")
    || (-[MTTableView isEditing](self, "isEditing") & 1) == 0)
  {
    refreshControl = self->_refreshControl;
    if (refreshControl)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIRefreshControl superview](refreshControl, "superview"));

      if (v4)
      {
        v5 = self->_refreshControl;
        v6.receiver = self;
        v6.super_class = (Class)MTTableView;
        -[MTTableView setRefreshControl:](&v6, "setRefreshControl:", v5);
      }
    }
  }
}

- (void)setRefreshControl:(id)a3
{
  id v5;
  objc_super v6;

  objc_storeStrong((id *)&self->_refreshControl, a3);
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTTableView;
  -[MTTableView setRefreshControl:](&v6, "setRefreshControl:", v5);

  -[MTTableView updateRefreshControlEnabledState](self, "updateRefreshControlEnabledState");
}

- (UIEdgeInsets)insetsFromRefreshControl
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  CGFloat top;
  double v8;
  CGFloat left;
  double v10;
  CGFloat bottom;
  double v12;
  CGFloat right;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView refreshControl](self, "refreshControl"));
  v4 = objc_opt_respondsToSelector(v3, "_appliedInsets");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView refreshControl](self, "refreshControl"));
    objc_msgSend(v5, "_appliedInsets");
    top = v6;
    left = v8;
    bottom = v10;
    right = v12;

  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  v14 = top;
  v15 = left;
  v16 = bottom;
  v17 = right;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView setContentOffset:](&v3, "setContentOffset:", a3.x, a3.y);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView setContentInset:](&v3, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setContentSize:(CGSize)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView setContentSize:](&v3, "setContentSize:", a3.width, a3.height);
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView encodeRestorableStateWithCoder:](&v3, "encodeRestorableStateWithCoder:", a3);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTTableView;
  -[MTTableView decodeRestorableStateWithCoder:](&v3, "decodeRestorableStateWithCoder:", a3);
}

- (id)preferredFocusEnvironments
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTTableView;
  v3 = -[MTTableView preferredFocusEnvironments](&v13, "preferredFocusEnvironments");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView tableHeaderView](self, "tableHeaderView"));
  v9 = objc_msgSend(v8, "canBecomeFocused");

  if (v9)
  {
    v10 = objc_msgSend(v7, "mutableCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableView tableHeaderView](self, "tableHeaderView"));
    objc_msgSend(v10, "insertObject:atIndex:", v11, 0);

    v7 = v10;
  }
  return v7;
}

- (BOOL)allowsFooterViewsToFloat
{
  if (-[MTTableView sectionFooterFloatingDisabled](self, "sectionFooterFloatingDisabled"))
    return 0;
  else
    return -[MTTableView _headerAndFooterViewsFloat](self, "_headerAndFooterViewsFloat");
}

- (UIColor)bottomFillColor
{
  return self->_bottomFillColor;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)sectionFooterFloatingDisabled
{
  return self->_sectionFooterFloatingDisabled;
}

- (void)setSectionFooterFloatingDisabled:(BOOL)a3
{
  self->_sectionFooterFloatingDisabled = a3;
}

- (BOOL)adjustContentOffsetForRefreshControlAsNeeded
{
  return self->_adjustContentOffsetForRefreshControlAsNeeded;
}

- (void)setAdjustContentOffsetForRefreshControlAsNeeded:(BOOL)a3
{
  self->_adjustContentOffsetForRefreshControlAsNeeded = a3;
}

- (BOOL)disableRefreshControlWhileEditing
{
  return self->_disableRefreshControlWhileEditing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_bottomFillColor, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_emptyCircleImage, 0);
  objc_storeStrong((id *)&self->_bottomFillView, 0);
  objc_storeStrong((id *)&self->_presentationPath, 0);
}

@end

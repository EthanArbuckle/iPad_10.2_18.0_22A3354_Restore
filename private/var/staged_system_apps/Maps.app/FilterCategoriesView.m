@implementation FilterCategoriesView

- (void)updateTheme
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_subCategoriesViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[FilterCategoriesView setBackgroundAndTitleColorToButton:](self, "setBackgroundAndTitleColorToButton:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (FilterCategoriesView)initWithFrame:(CGRect)a3
{
  FilterCategoriesView *v3;
  FilterCategoriesView *v4;
  double v5;
  uint64_t v6;
  UIVisualEffectView *blurView;
  UIScrollView *v8;
  UIScrollView *scrollView;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FilterCategoriesView;
  v3 = -[FilterCategoriesView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FilterCategoriesView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("FilterCategoriesView"));
    -[FilterCategoriesView _setHostsLayoutEngine:](v4, "_setHostsLayoutEngine:", 1);
    LODWORD(v5) = 1148846080;
    -[FilterCategoriesView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v5);
    v6 = objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
    blurView = v4->_blurView;
    v4->_blurView = (UIVisualEffectView *)v6;

    -[FilterCategoriesView addSubview:](v4, "addSubview:", v4->_blurView);
    v8 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    scrollView = v4->_scrollView;
    v4->_scrollView = v8;

    -[UIScrollView setAccessibilityIdentifier:](v4->_scrollView, "setAccessibilityIdentifier:", CFSTR("FilterCategoriesScrollView"));
    -[UIScrollView setDelegate:](v4->_scrollView, "setDelegate:", v4);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v4->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[FilterCategoriesView addSubview:](v4, "addSubview:", v4->_scrollView);
    -[UIScrollView _mapkit_addPointerInteractionWithDelegate:](v4->_scrollView, "_mapkit_addPointerInteractionWithDelegate:", v4);
    v10 = -[FilterCategoriesView _maps_addHairlineAtTopWithMargin:](v4, "_maps_addHairlineAtTopWithMargin:", 0.0);
    v4->_lastButtonTrailingPadding = 16.0;
  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[FilterCategoriesView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[FilterCategoriesView safeAreaInsets](self, "safeAreaInsets");
  v3 = v2 + 49.0;
  v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FilterCategoriesView;
  -[FilterCategoriesView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[FilterCategoriesView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[FilterCategoriesView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FilterCategoriesView;
  -[FilterCategoriesView layoutSubviews](&v12, "layoutSubviews");
  -[FilterCategoriesView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  -[FilterCategoriesView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[FilterCategoriesView safeAreaInsets](self, "safeAreaInsets");
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10 - v11);
}

- (void)setSubCategories:(id)a3
{
  NSArray *v5;
  NSArray *subCategories;
  unsigned __int8 v7;
  NSArray *v8;
  _QWORD v9[5];

  v5 = (NSArray *)a3;
  subCategories = self->_subCategories;
  if (subCategories != v5)
  {
    v8 = v5;
    v7 = -[NSArray isEqual:](subCategories, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subCategories, a3);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1005965A0;
      v9[3] = &unk_1011AC860;
      v9[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
      v5 = v8;
    }
  }

}

- (void)setSubCategories:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > a4)
  {
    -[FilterCategoriesView setSubCategories:](self, "setSubCategories:", v6);
    -[FilterCategoriesView setSelectedIndex:](self, "setSelectedIndex:", a4);
  }

}

- (void)resetData
{
  -[FilterCategoriesView setSubCategories:](self, "setSubCategories:", 0);
}

- (void)touchedAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id WeakRetained;

  v4 = objc_msgSend(a3, "tag");
  if ((id)self->_selectedIndex != v4)
  {
    v5 = v4;
    -[FilterCategoriesView setSelectedIndex:](self, "setSelectedIndex:", v4);
    -[RefineSearchSession updateWithSelection:](self->_refineSearchSession, "updateWithSelection:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 2007, 619, 0);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "filterView:indexSelected:", self, v5);

  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *selected;
  void *v10;
  void *v11;
  void *v12;

  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    if ((unint64_t)-[NSMutableArray count](self->_subCategoriesViews, "count") > a3)
    {
      -[UIButton setSelected:](self->_selected, "setSelected:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_selected, "titleLabel"));
      objc_msgSend(v6, "setFont:", v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UIButton setBackgroundColor:](self->_selected, "setBackgroundColor:", v7);

      v8 = (UIButton *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_subCategoriesViews, "objectAtIndexedSubscript:", a3));
      selected = self->_selected;
      self->_selected = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Bold](UIFont, "system15Bold"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_selected, "titleLabel"));
      objc_msgSend(v11, "setFont:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UIButton setBackgroundColor:](self->_selected, "setBackgroundColor:", v12);

      -[UIButton setSelected:](self->_selected, "setSelected:", 1);
      -[FilterCategoriesView layoutIfNeeded](self, "layoutIfNeeded");
      -[FilterCategoriesView updateSelectedVisibility](self, "updateSelectedVisibility");
    }
  }
}

- (NSArray)visibleSuggestions
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[FilterCategoriesView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_subCategoriesViews;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("FilterCategoriesButton"), (_QWORD)v24);
        objc_msgSend(v17, "frame");
        v31.origin.x = v18;
        v31.origin.y = v19;
        v31.size.width = v20;
        v31.size.height = v21;
        v29.origin.x = v10;
        v29.origin.y = v4;
        v29.size.width = v6;
        v29.size.height = v8;
        v30 = CGRectIntersection(v29, v31);
        if (!CGRectIsEmpty(v30))
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  v22 = objc_msgSend(v11, "copy");
  return (NSArray *)v22;
}

- (void)updateSelectedVisibility
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
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxX;
  double v22;
  double v23;
  CGFloat rect;
  CGRect v25;
  CGRect v26;

  -[UIButton frame](self->_selected, "frame");
  if (v5 != 0.0)
  {
    v7 = v4;
    if (v4 >= 0.0)
    {
      v8 = v3;
      v9 = v5;
      v10 = v6;
      -[FilterCategoriesView bounds](self, "bounds");
      v12 = v11;
      v14 = v13;
      rect = v15;
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      v17 = v16;
      v19 = v18;
      -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1, v8, v7, v9, v10);
      if ((-[UIScrollView _isRectFullyVisible:](self->_scrollView, "_isRectFullyVisible:", v8, v7, v9, v10) & 1) == 0)
      {
        v23 = v19;
        v20 = v17 - v8;
        v25.origin.x = v8;
        v25.origin.y = v7;
        v25.size.width = v9;
        v25.size.height = v10;
        MaxX = CGRectGetMaxX(v25);
        v26.origin.x = v17;
        v26.origin.y = v12;
        v26.size.width = v14;
        v26.size.height = rect;
        v22 = v17 + MaxX - CGRectGetMaxX(v26) + 10.0;
        if (v20 > 0.0)
          v22 = v17 - (v20 + 10.0);
        -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, v22, v23);
      }
    }
  }
}

- (void)loadSubCategories
{
  NSMutableArray *v3;
  NSMutableArray *subCategoriesViews;
  uint64_t v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *lastButtonTrailingConstraint;
  unint64_t v28;
  uint64_t v29;
  NSArray *obj;
  uint64_t v31;
  id v32;
  uint64_t v33;
  _QWORD block[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _BYTE v40[128];

  -[NSMutableArray makeObjectsPerformSelector:](self->_subCategoriesViews, "makeObjectsPerformSelector:", "removeFromSuperview");
  -[NSMutableArray removeAllObjects](self->_subCategoriesViews, "removeAllObjects");
  if (!self->_subCategoriesViews)
  {
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    subCategoriesViews = self->_subCategoriesViews;
    self->_subCategoriesViews = v3;

  }
  v5 = 80;
  self->_selectedIndex = -1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = self->_subCategories;
  v32 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v32)
  {
    v8 = v7;
    goto LABEL_16;
  }
  v29 = 80;
  obj = v7;
  v8 = 0;
  v33 = 0;
  v31 = *(_QWORD *)v36;
  do
  {
    v9 = 0;
    v10 = v8;
    do
    {
      if (*(_QWORD *)v36 != v31)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0, v29));
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v12, "setTag:", (char *)v9 + v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleLabel"));
      objc_msgSend(v14, "setFont:", v13);

      objc_msgSend(v12, "setClipsToBounds:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
      objc_msgSend(v15, "setCornerRadius:", 5.0);

      objc_msgSend(v12, "setContentEdgeInsets:", 2.0, 9.0, 2.0, 9.0);
      objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "touchedAction:", 0x2000);
      objc_msgSend(v12, "setTitle:forState:", v11, 0);
      -[FilterCategoriesView setBackgroundAndTitleColorToButton:](self, "setBackgroundAndTitleColorToButton:", v12);
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView centerYAnchor](self->_scrollView, "centerYAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
      v39 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
      objc_msgSend(v6, "addObjectsFromArray:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
      if (v10)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray trailingAnchor](v10, "trailingAnchor"));
        v22 = 10.0;
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
        v22 = 16.0;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, v22));
      objc_msgSend(v6, "addObject:", v23);

      v8 = v12;
      -[NSMutableArray addObject:](self->_subCategoriesViews, "addObject:", v8);

      v9 = (char *)v9 + 1;
      v10 = v8;
    }
    while (v32 != v9);
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v33 += (uint64_t)v9;
  }
  while (v32);

  v5 = v29;
  if (v8)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray trailingAnchor](v8, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
    v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -self->_lastButtonTrailingPadding));
    lastButtonTrailingConstraint = self->_lastButtonTrailingConstraint;
    self->_lastButtonTrailingConstraint = v26;

    objc_msgSend(v6, "addObject:", self->_lastButtonTrailingConstraint);
LABEL_16:

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
  v28 = *(unint64_t *)((char *)&self->super.super.super.super.isa + v5);
  if (v28 < (unint64_t)-[NSMutableArray count](self->_subCategoriesViews, "count"))
    -[FilterCategoriesView setSelectedIndex:](self, "setSelectedIndex:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100596FC4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)setBackgroundAndTitleColorToButton:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor"));
  objc_msgSend(v3, "setTitleColor:forState:", v5, 4);

}

- (void)resetOffset
{
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
}

- (void)setLastButtonTrailingPadding:(double)a3
{
  self->_lastButtonTrailingPadding = a3;
  -[NSLayoutConstraint setConstant:](self->_lastButtonTrailingConstraint, "setConstant:");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  double Height;
  double v12;
  double x;
  double y;
  double width;
  double v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  CGPoint v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v6 = a4;
  v7 = -[NSMutableArray count](self->_subCategoriesViews, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_subCategoriesViews, "objectAtIndexedSubscript:", v9));
      -[UIScrollView frame](self->_scrollView, "frame");
      Height = CGRectGetHeight(v23);
      objc_msgSend(v10, "frame");
      v12 = Height - CGRectGetHeight(v24);
      objc_msgSend(v10, "frame");
      v26 = CGRectInset(v25, -5.0, v12 * -0.5);
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      v16 = v26.size.height;
      objc_msgSend(v6, "location");
      v22.x = v17;
      v22.y = v18;
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = v16;
      if (CGRectContainsPoint(v27, v22))
        break;

      if (v8 == (id)++v9)
        goto LABEL_5;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v20, x, y, width, v16));

  }
  else
  {
LABEL_5:
    v19 = 0;
  }

  return v19;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;
  UIButton *v11;
  id v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    if (v10 >= -[NSMutableArray count](self->_subCategoriesViews, "count"))
    {
      v16 = 0;
    }
    else
    {
      v11 = (UIButton *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_subCategoriesViews, "objectAtIndexedSubscript:", v10));
      v12 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v11);
      if (v11 == self->_selected)
        v13 = (id *)UIPointerLiftEffect_ptr;
      else
        v13 = (id *)UIPointerEffect_ptr;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v13, "effectWithPreview:", v12));
      -[UIButton frame](v11, "frame");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v14, v15));

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  UIButton *selected;

  if (self->_selected)
  {
    selected = self->_selected;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &selected, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return v2;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CGPoint *p_lastScrollViewContentOffset;
  CGFloat v4;
  CGFloat v5;

  p_lastScrollViewContentOffset = &self->_lastScrollViewContentOffset;
  objc_msgSend(a3, "contentOffset");
  p_lastScrollViewContentOffset->x = v4;
  p_lastScrollViewContentOffset->y = v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6;
  double x;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;

  v6 = a3;
  x = self->_lastScrollViewContentOffset.x;
  v14 = v6;
  objc_msgSend(v6, "contentOffset");
  if (x > v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = v9;
    v11 = 13;
LABEL_5:
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v11, 619, 0);

    goto LABEL_6;
  }
  v12 = self->_lastScrollViewContentOffset.x;
  objc_msgSend(v14, "contentOffset");
  if (v12 < v13)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = v9;
    v11 = 12;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)scrollViewDidScroll:(id)a3
{
  -[RefineSearchSession updateWithFilterView:](self->_refineSearchSession, "updateWithFilterView:", self);
}

- (void)initCurrentListSession
{
  RefineSearchSession *v3;
  NSArray *subCategories;
  void *v5;
  RefineSearchSession *v6;
  RefineSearchSession *refineSearchSession;

  if (self->_refineSearchSession)
    -[FilterCategoriesView sendCurrentRefineSession](self, "sendCurrentRefineSession");
  v3 = [RefineSearchSession alloc];
  subCategories = self->_subCategories;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FilterCategoriesView delegate](self, "delegate"));
  v6 = -[RefineSearchSession initWithObjects:forType:](v3, "initWithObjects:forType:", subCategories, objc_msgSend(v5, "refineSearchSessionType"));
  refineSearchSession = self->_refineSearchSession;
  self->_refineSearchSession = v6;

  -[RefineSearchSession updateWithFilterView:](self->_refineSearchSession, "updateWithFilterView:", self);
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)subCategories
{
  return self->_subCategories;
}

- (FilterCategoriesViewDelegate)delegate
{
  return (FilterCategoriesViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subCategories, 0);
  objc_storeStrong((id *)&self->_lastButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_refineSearchSession, 0);
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_subCategoriesViews, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end

@implementation OverflowView

- (OverflowView)initWithContentView:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  OverflowView *v8;
  UIScrollView *v9;
  UIScrollView *scrollView;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OverflowView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[OverflowView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    v9 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    scrollView = v8->_scrollView;
    v8->_scrollView = v9;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v8->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v8->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[OverflowView addSubview:](v8, "addSubview:", v8->_scrollView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView _initialScrollViewConstraints](v8, "_initialScrollViewConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

    -[OverflowView _addContentView:](v8, "_addContentView:", v4);
  }

  return v8;
}

- (id)_initialScrollViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView leadingAnchor](self, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v21[0] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView trailingAnchor](self, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v21[1] = v15;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView widthAnchor](self, "widthAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  v21[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView topAnchor](self, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v21[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OverflowView bottomAnchor](self, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v21[4] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 5));

  return v14;
}

- (id)_initialConstraintsForContentView:(id)a3
{
  UIScrollView *scrollView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  scrollView = self->_scrollView;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView frameLayoutGuide](scrollView, "frameLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));

  LODWORD(v10) = 1132068864;
  objc_msgSend(v9, "setPriority:", v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v29[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v29[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v29[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  v29[3] = v19;
  v29[4] = v9;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 5));

  return v21;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v6;
  CGFloat v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OverflowView;
  -[OverflowView layoutSubviews](&v8, "layoutSubviews");
  -[OverflowView bounds](self, "bounds");
  if (v4 != self->_lastLayoutSize.width || v3 != self->_lastLayoutSize.height)
  {
    -[OverflowView bounds](self, "bounds");
    self->_lastLayoutSize.width = v6;
    self->_lastLayoutSize.height = v7;
    -[UIScrollView layoutIfNeeded](self->_scrollView, "layoutIfNeeded");
    -[UIScrollView flashScrollIndicators](self->_scrollView, "flashScrollIndicators");
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3)
    self->_lastLayoutSize = CGSizeZero;
}

- (void)setContentView:(id)a3
{
  UIView *contentView;
  id v5;

  contentView = self->_contentView;
  if (contentView != a3)
  {
    v5 = a3;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    -[OverflowView _addContentView:](self, "_addContentView:", v5);

  }
}

- (void)resetContentOffset
{
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
}

- (void)_addContentView:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_contentView, a3);
  v5 = a3;
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[OverflowView _initialConstraintsForContentView:](self, "_initialConstraintsForContentView:", v5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end

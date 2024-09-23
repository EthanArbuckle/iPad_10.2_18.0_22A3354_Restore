@implementation STSPickerView

- (STSPickerView)init
{
  STSPickerView *v2;
  STSPickerView *v3;
  STSGridLayout *v4;
  STSGridLayout *gridLayout;
  id v6;
  uint64_t v7;
  UICollectionView *collectionView;
  UICollectionView *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *constraints;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STSPickerView;
  v2 = -[STSPickerView init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STSPickerView setClipsToBounds:](v2, "setClipsToBounds:", 1);
    -[STSPickerView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = objc_alloc_init(STSGridLayout);
    gridLayout = v3->_gridLayout;
    v3->_gridLayout = v4;

    v6 = objc_alloc(MEMORY[0x24BEBD450]);
    -[STSPickerView frame](v3, "frame");
    v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v3->_gridLayout);
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v7;

    -[UICollectionView setAlwaysBounceVertical:](v3->_collectionView, "setAlwaysBounceVertical:", 1);
    v9 = v3->_collectionView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UICollectionView setPrefetchingEnabled:](v3->_collectionView, "setPrefetchingEnabled:", 0);
    -[UICollectionView setAllowsMultipleSelection:](v3->_collectionView, "setAllowsMultipleSelection:", 0);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v3->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STSPickerView addSubview:](v3, "addSubview:", v3->_collectionView);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableArray *)v11;

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  STSSearchNoticeView *overlayView;
  NSMutableArray *constraints;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  UIView *headerView;
  double v22;
  double v23;
  void *v24;
  void *v25;
  NSLayoutConstraint *headerTopConstraint;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *v30;
  NSMutableArray *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UICollectionView *collectionView;
  NSMutableArray *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableArray *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  void *v51;
  void *v52;
  void *v53;
  NSMutableArray *v54;
  void *v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  -[STSPickerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  overlayView = self->_overlayView;
  if (overlayView)
  {
    constraints = self->_constraints;
    -[STSSearchNoticeView topAnchor](overlayView, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](constraints, "addObject:", v8);

    v9 = self->_constraints;
    -[STSSearchNoticeView bottomAnchor](self->_overlayView, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v9, "addObject:", v12);

    v13 = self->_constraints;
    -[STSSearchNoticeView leadingAnchor](self->_overlayView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSPickerView leadingAnchor](self, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v13, "addObject:", v16);

    v17 = self->_constraints;
    -[STSSearchNoticeView trailingAnchor](self->_overlayView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSPickerView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v17, "addObject:", v20);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  }
  headerView = self->_headerView;
  if (headerView)
  {
    if (self->_headerTopConstraint)
    {
      -[NSLayoutConstraint constant](self->_headerTopConstraint, "constant");
      v23 = v22;
      v24 = (void *)MEMORY[0x24BDD1628];
      v59[0] = self->_headerTopConstraint;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deactivateConstraints:", v25);

      headerTopConstraint = self->_headerTopConstraint;
      self->_headerTopConstraint = 0;

      headerView = self->_headerView;
    }
    else
    {
      v23 = 0.0;
    }
    -[UIView topAnchor](headerView, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, v23);
    v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v30 = self->_headerTopConstraint;
    self->_headerTopConstraint = v29;

    v31 = self->_constraints;
    -[UIView leadingAnchor](self->_headerView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSPickerView leadingAnchor](self, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v31, "addObject:", v34);

    v35 = self->_constraints;
    -[UIView trailingAnchor](self->_headerView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSPickerView trailingAnchor](self, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v35, "addObject:", v38);

    v39 = (void *)MEMORY[0x24BDD1628];
    v58 = self->_headerTopConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v40);

  }
  collectionView = self->_collectionView;
  if (collectionView)
  {
    v42 = self->_constraints;
    -[UICollectionView topAnchor](collectionView, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v42, "addObject:", v45);

    v46 = self->_constraints;
    -[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v46, "addObject:", v49);

    v50 = self->_constraints;
    -[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSPickerView leadingAnchor](self, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v50, "addObject:", v53);

    v54 = self->_constraints;
    -[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSPickerView trailingAnchor](self, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v54, "addObject:", v57);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  }

}

- (void)scrollToTopWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;

  v3 = a3;
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  -[UICollectionView setContentOffset:animated:](self->_collectionView, "setContentOffset:animated:", v3, -v5, -v6);
  -[STSPickerView updateHeaderPositionOnScroll](self, "updateHeaderPositionOnScroll");
}

- (void)updateHeaderPositionOnScroll
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
  void *v13;
  double v14;
  double v15;
  double MaxY;
  BOOL v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (self->_headerView)
  {
    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    v4 = v3;
    -[UICollectionView contentInset](self->_collectionView, "contentInset");
    v6 = v4 + v5;
    if (v6 >= 0.0)
      v7 = v6;
    else
      v7 = 0.0;
    v8 = self->_lastContentOffsetY - v7;
    -[NSLayoutConstraint constant](self->_headerTopConstraint, "constant");
    -[STSPickerView layoutMargins](self, "layoutMargins");
    v10 = v9;
    if (self->_isDeceleratingQuickly
      || v8 < 0.0 && (-[UIView frame](self->_headerView, "frame"), v8 > -CGRectGetHeight(v23))
      || v8 > 0.0 && (-[UIView frame](self->_headerView, "frame"), v7 < CGRectGetHeight(v24))
      || ((-[UIView frame](self->_headerView, "frame"), MaxY = CGRectGetMaxY(v25), v8 > 0.0)
        ? (v17 = MaxY <= v10)
        : (v17 = 1),
          !v17))
    {
      -[UIView frame](self->_headerView, "frame");
      -[UIView frame](self->_headerView, "frame", CGRectGetMaxY(v18));
      -[UIView frame](self->_headerView, "frame", CGRectGetHeight(v19));
      -[UIView frame](self->_headerView, "frame", CGRectGetMinY(v20));
      v12 = v11 - v10;
      -[STSPickerView layoutMarginsGuide](self, "layoutMarginsGuide");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = fmin(v8 + v12, 0.0);
      -[UIView frame](self->_headerView, "frame");
      v15 = -CGRectGetHeight(v21);
      if (v14 < v15)
        v14 = v15;
      -[UIView frame](self->_headerView, "frame");
      CGRectGetHeight(v22);
      -[NSLayoutConstraint setConstant:](self->_headerTopConstraint, "setConstant:", v14);
      -[STSPickerView layoutIfNeeded](self, "layoutIfNeeded");

    }
    self->_lastContentOffsetY = v7;
  }
}

- (void)updateHeaderPositionOnDraggingBegan
{
  self->_isDeceleratingQuickly = 0;
}

- (void)updateHeaderPositionOnDraggingEndedWithVelocity:(CGPoint)a3
{
  if (a3.y < -1.15)
    self->_isDeceleratingQuickly = 1;
}

- (void)updateHeaderPositionOnDecelerationEnded
{
  self->_isDeceleratingQuickly = 0;
}

- (void)setOverlayView:(id)a3
{
  STSSearchNoticeView *v5;
  STSSearchNoticeView *overlayView;
  void *activityIndicator;
  STSSearchNoticeView *v8;

  v5 = (STSSearchNoticeView *)a3;
  overlayView = self->_overlayView;
  if (overlayView != v5)
  {
    v8 = v5;
    -[STSSearchNoticeView removeFromSuperview](overlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_overlayView, a3);
    activityIndicator = self->_activityIndicator;
    if (!activityIndicator)
      activityIndicator = self->_collectionView;
    -[STSPickerView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_overlayView, activityIndicator);
    -[STSPickerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  UIView *v7;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[STSPickerView addSubview:](self, "addSubview:", self->_headerView);
    -[STSPickerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setTopInset:(double)a3
{
  CGFloat MinY;
  CGRect v6;

  -[UIView frame](self->_headerView, "frame");
  MinY = CGRectGetMinY(v6);
  self->_topInset = a3;
  -[UICollectionView contentOffset](self->_collectionView, "contentOffset", MinY);
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  -[STSPickerView _updateContentInset](self, "_updateContentInset");
  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:");
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
  -[STSPickerView _updateContentInset](self, "_updateContentInset");
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (self->_showActivityIndicator != a3)
  {
    self->_showActivityIndicator = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
    {
      if (!activityIndicator)
      {
        v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
        v6 = self->_activityIndicator;
        self->_activityIndicator = v5;

        -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        activityIndicator = self->_activityIndicator;
      }
      -[STSPickerView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", activityIndicator, self->_collectionView);
      v7 = (void *)MEMORY[0x24BDD1628];
      -[UIActivityIndicatorView centerXAnchor](self->_activityIndicator, "centerXAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView centerXAnchor](self->_collectionView, "centerXAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      -[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView centerYAnchor](self->_collectionView, "centerYAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activateConstraints:", v14);

      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
      -[STSPickerView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
      -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicator, "removeFromSuperview");
    }
  }
}

- (void)updateContentOffset:(double)a3
{
  void *v5;
  double v6;
  id v7;

  -[STSPickerView collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[STSPickerView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  objc_msgSend(v7, "setContentOffset:", -v6, a3);

}

- (UIEdgeInsets)_updateContentInset
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  UIEdgeInsets result;

  -[UIView frame](self->_headerView, "frame");
  v3 = CGRectGetHeight(v9) + self->_topInset;
  v4 = self->_bottomInset + 0.0;
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v3 + 0.0, 6.0, v4, 6.0);
  -[UICollectionView setScrollIndicatorInsets:](self->_collectionView, "setScrollIndicatorInsets:", v3 + 0.0, 0.0, v4, 0.0);
  -[STSSearchNoticeView setContentInsets:](self->_overlayView, "setContentInsets:", v3 + 20.0, 20.0, self->_bottomInset + 20.0, 20.0);
  -[STSPickerView bounds](self, "bounds");
  -[UIActivityIndicatorView bounds](self->_activityIndicator, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", 0);
  v5 = 6.0;
  v6 = 6.0;
  v7 = v3 + 0.0;
  v8 = v4;
  result.right = v6;
  result.bottom = v8;
  result.left = v5;
  result.top = v7;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (STSSearchNoticeView)overlayView
{
  return self->_overlayView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (double)topInset
{
  return self->_topInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_headerTopConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_gridLayout, 0);
}

@end

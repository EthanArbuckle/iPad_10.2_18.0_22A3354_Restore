@implementation CarSmallWidgetCollectionView

- (CarSmallWidgetCollectionView)initWithFrame:(CGRect)a3
{
  CarSmallWidgetCollectionView *v3;
  CarSmallWidgetCollectionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetCollectionView;
  v3 = -[CarSmallWidgetCollectionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CarSmallWidgetCollectionView _commonInit](v3, "_commonInit");
  return v4;
}

- (CarSmallWidgetCollectionView)initWithCoder:(id)a3
{
  CarSmallWidgetCollectionView *v3;
  CarSmallWidgetCollectionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetCollectionView;
  v3 = -[CarSmallWidgetCollectionView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CarSmallWidgetCollectionView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;
  NSObject *v4;
  CarSmallWidgetCollectionViewFlowLayout *v5;
  CarReloadWithCompletionCollectionView *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *heightConstraint;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CarReloadWithCompletionCollectionView *collectionView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CarSmallWidgetCollectionViewFlowLayout *v31;
  uint8_t buf[8];
  _QWORD v33[6];

  v3 = sub_10043379C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView commonInit", buf, 2u);
  }

  -[CarSmallWidgetCollectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CarSmallWidgetCollectionView"));
  v5 = objc_alloc_init(CarSmallWidgetCollectionViewFlowLayout);
  -[CarSmallWidgetCollectionViewFlowLayout setMinimumLineSpacing:](v5, "setMinimumLineSpacing:", 10.0);
  v31 = v5;
  -[CarSmallWidgetCollectionViewFlowLayout setMinimumInteritemSpacing:](v5, "setMinimumInteritemSpacing:", 10.0);
  v6 = -[CarReloadWithCompletionCollectionView initWithFrame:collectionViewLayout:]([CarReloadWithCompletionCollectionView alloc], "initWithFrame:collectionViewLayout:", v5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarReloadWithCompletionCollectionView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarReloadWithCompletionCollectionView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[CarReloadWithCompletionCollectionView setScrollEnabled:](v6, "setScrollEnabled:", 0);
  v8 = objc_opt_class(CarSmallWidgetCollectionViewCell);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowCollectionViewCell cellReuseIdentifier](CarSmallWidgetCollectionViewCell, "cellReuseIdentifier"));
  -[CarReloadWithCompletionCollectionView registerClass:forCellWithReuseIdentifier:](v6, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  -[CarSmallWidgetCollectionView addSubview:](self, "addSubview:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView heightAnchor](v6, "heightAnchor"));
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 0.0));
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v11;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView leadingAnchor](v6, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView leadingAnchor](self, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v33[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView trailingAnchor](self, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView trailingAnchor](v6, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v33[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView topAnchor](v6, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView topAnchor](self, "topAnchor"));
  +[CarShortcutCollectionViewCell focusRingTopOverhang](CarSmallWidgetCollectionViewCell, "focusRingTopOverhang");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v23));
  v33[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView bottomAnchor](v6, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15));
  v17 = self->_heightConstraint;
  v33[3] = v16;
  v33[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView centerYAnchor](v6, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView centerYAnchor](self, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v33[5] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  -[CarSmallWidgetCollectionView _updateHeightConstraint](self, "_updateHeightConstraint");
  -[CarReloadWithCompletionCollectionView setDataSource:](v6, "setDataSource:", self);
  -[CarReloadWithCompletionCollectionView setDelegate:](v6, "setDelegate:", self);
  collectionView = self->_collectionView;
  self->_collectionView = v6;

}

- (void)_updateHeightConstraint
{
  double v3;
  double v4;
  double v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  -[CarSmallWidgetCollectionView _cellSize](self, "_cellSize");
  v4 = v3;
  +[CarShortcutCollectionViewCell focusRingTopOverhang](CarSmallWidgetCollectionViewCell, "focusRingTopOverhang");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v4 + v5);
  v6 = sub_10043379C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[NSLayoutConstraint constant](self->_heightConstraint, "constant");
    v9 = 134217984;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView updateHeightConstraint %f", (uint8_t *)&v9, 0xCu);
  }

}

- (void)layoutSubviews
{
  id v3;
  NSObject *v4;
  double v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarSmallWidgetCollectionView;
  -[CarSmallWidgetCollectionView layoutSubviews](&v7, "layoutSubviews");
  v3 = sub_10043379C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView layoutSubviews", v6, 2u);
  }

  -[CarSmallWidgetCollectionView _updateHeightConstraint](self, "_updateHeightConstraint");
  -[CarSmallWidgetCollectionView _cellSize](self, "_cellSize");
  if (self->_cellWidth != v5)
  {
    self->_cellWidth = v5;
    -[CarSmallWidgetCollectionView refreshData](self, "refreshData");
  }
}

- (CGSize)_cellSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  CGFloat v19;
  id v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  void *v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  CGSize v36;
  CGSize v37;
  CGSize result;
  CGRect v39;
  CGRect v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView traitCollection](self, "traitCollection"));
  +[ShortcutsRowCollectionViewCell cellSizeWithTraitCollection:](CarSmallWidgetCollectionViewCell, "cellSizeWithTraitCollection:", v3);
  v5 = v4;
  v7 = v6;

  -[CarReloadWithCompletionCollectionView bounds](self->_collectionView, "bounds");
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  v12 = 0.0;
  if (CGRectGetWidth(v39) + -20.0 >= 0.0)
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v12 = CGRectGetWidth(v40) + -20.0;
  }
  v13 = (id)(uint64_t)(v12 / v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView data](self, "data"));
  if ((uint64_t)objc_msgSend(v14, "count") < (uint64_t)v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView data](self, "data"));
    v13 = objc_msgSend(v15, "count");

  }
  v16 = (uint64_t)v13 - 1;
  v17 = (double)((unint64_t)v13 - 1) * 10.0 + (double)(uint64_t)v13 * v5;
  if (v17 <= v12)
    v18 = (uint64_t)v13;
  else
    v18 = (uint64_t)v13 - 1;
  if (v17 > v12)
    v16 = (uint64_t)v13 - 2;
  if (v16 >= 1)
  {
    if (v12 + (double)v16 * -10.0 >= 0.0)
      v12 = v12 + (double)v16 * -10.0;
    else
      v12 = 0.0;
  }
  v19 = UIFloorToViewScale(self->_collectionView, v12 / (double)v18);
  v20 = sub_10043379C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v36.width = v5;
    v36.height = v7;
    v22 = NSStringFromCGSize(v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v37.width = v19;
    v37.height = v7;
    v24 = NSStringFromCGSize(v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v28 = 138413058;
    v29 = v23;
    v30 = 2048;
    v31 = v12;
    v32 = 2048;
    v33 = v18;
    v34 = 2112;
    v35 = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView preferredCellSize: %@, availableWidth: %f, cellsCount: %ld, cellSize: %@", (uint8_t *)&v28, 0x2Au);

  }
  v26 = v19;
  v27 = v7;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)refreshData
{
  id v3;
  NSObject *v4;
  CarReloadWithCompletionCollectionView *collectionView;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = sub_10043379C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView refreshData", buf, 2u);
  }

  collectionView = self->_collectionView;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C2AED0;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  -[CarReloadWithCompletionCollectionView reloadDataWithCompletion:](collectionView, "reloadDataWithCompletion:", v6);
}

- (NSArray)data
{
  return 0;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  return 0;
}

- (void)didSelectFocusableCollectionCell:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", a3));
  -[CarSmallWidgetCollectionView didSelectItemAtIndexPath:](self, "didSelectItemAtIndexPath:", v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[CarSmallWidgetCollectionView didSelectItemAtIndexPath:](self, "didSelectItemAtIndexPath:", a4);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Width;
  double v17;
  double v18;
  int64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v26;
  int64_t v27;
  __int16 v28;
  id v29;
  CGRect v30;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView data](self, "data"));
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v30.origin.x = v9;
  v30.origin.y = v11;
  v30.size.width = v13;
  v30.size.height = v15;
  Width = CGRectGetWidth(v30);
  -[CarSmallWidgetCollectionView _cellSize](self, "_cellSize");
  v18 = Width / v17;
  if ((uint64_t)v7 >= (uint64_t)v18)
    v19 = (uint64_t)v18;
  else
    v19 = (int64_t)v7;
  v20 = sub_10043379C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v26 = 134218240;
    v27 = v19;
    v28 = 2048;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView Showing first %ld of %ld", (uint8_t *)&v26, 0x16u);
  }

  v22 = sub_10043379C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView data](self, "data"));
    v26 = 138412290;
    v27 = (int64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView Data: %@", (uint8_t *)&v26, 0xCu);

  }
  return v19;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = sub_10043379C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v14 = 134217984;
    v15 = objc_msgSend(v6, "row");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView cellForItemAtIndexPath %ld", (uint8_t *)&v14, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowCollectionViewCell cellReuseIdentifier](CarSmallWidgetCollectionViewCell, "cellReuseIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6));

  objc_msgSend(v11, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionView modelForItemAtIndexPath:](self, "modelForItemAtIndexPath:", v6));
  objc_msgSend(v11, "setModel:", v12);

  return v11;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  +[CarShortcutCollectionViewCell focusRingTopOverhang](CarSmallWidgetCollectionViewCell, "focusRingTopOverhang", a3, a4, a5);
  v6 = 10.0;
  v7 = 0.0;
  v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end

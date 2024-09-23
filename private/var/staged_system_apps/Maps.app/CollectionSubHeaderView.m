@implementation CollectionSubHeaderView

- (CollectionSubHeaderView)initWithType:(unint64_t)a3
{
  CollectionSubHeaderView *v4;
  CollectionSubHeaderView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CollectionSubHeaderView;
  v4 = -[CollectionSubHeaderView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    -[CollectionSubHeaderView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[CollectionSubHeaderView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("CollectionSubHeaderView"));
    -[CollectionSubHeaderView loadContent](v5, "loadContent");
  }
  return v5;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
    self->_editing = a3;
}

- (id)_currentFont
{
  void *v2;

  if (self->_type == 1)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13Adaptive](UIFont, "system13Adaptive"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15CompatibleWithTraitCollection:withSymbolicTraits:](UIFont, "system15CompatibleWithTraitCollection:withSymbolicTraits:", 0, 2));
  return v2;
}

- (void)updateFonts
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView _currentFont](self, "_currentFont"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_contentView, "subviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(UIButton);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
          objc_msgSend(v11, "setFont:", v3);

        }
        v12 = objc_opt_class(UILabel);
        if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
          objc_msgSend(v9, "setFont:", v3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 52.0);
  -[NSLayoutConstraint setConstant:](self->_saveButtonHeightConstraint, "setConstant:");
  -[CollectionSubHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)setType:(unint64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[CollectionSubHeaderView loadContent](self, "loadContent");
    -[CollectionSubHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setSortType:(int64_t)a3
{
  if (self->_sortType != a3)
  {
    self->_sortType = a3;
    -[CollectionSubHeaderView _updateSortButton](self, "_updateSortButton");
  }
}

- (void)saveAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "requestsCollectionHeaderSaveActionForView:", self);

}

- (void)loadContent
{
  unint64_t type;
  id v4;

  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  type = self->_type;
  if (type == 1)
  {
    -[CollectionSubHeaderView createEditContent](self, "createEditContent");
  }
  else if (type == 2)
  {
    -[CollectionSubHeaderView createSaveContent](self, "createSaveContent");
  }
  -[CollectionSubHeaderView updateFonts](self, "updateFonts");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "contentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)createSaveContent
{
  id v3;
  UIView *v4;
  UIView *contentView;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *saveButton;
  UIButton *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *saveButtonHeightConstraint;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[8];

  v3 = -[CollectionSubHeaderView _maps_addHairlineAtBottomWithMargin:](self, "_maps_addHairlineAtBottomWithMargin:", 0.0);
  v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  contentView = self->_contentView;
  self->_contentView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("CollectionSubHeaderContent"));
  -[CollectionSubHeaderView addSubview:](self, "addSubview:", self->_contentView);
  v6 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView theme](self, "theme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyColor"));
  -[UIButton setBackgroundColor:](v6, "setBackgroundColor:", v9);

  -[UIButton _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:", 8.0);
  -[UIButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, "saveAction:", 64);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("CollectionSubHeaderSaveButton"));
  -[UIView addSubview:](self->_contentView, "addSubview:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Guide] Save to My Guides"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v6, "setTitle:forState:", v11, 0);

  saveButton = self->_saveButton;
  self->_saveButton = v6;
  v13 = v6;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_saveButton, "heightAnchor"));
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 0.0));
  saveButtonHeightConstraint = self->_saveButtonHeightConstraint;
  self->_saveButtonHeightConstraint = v15;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView leadingAnchor](self, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v40[0] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView trailingAnchor](self, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v40[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView bottomAnchor](self, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v40[2] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v13, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 16.0));
  v40[3] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v13, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -16.0));
  v40[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v13, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 8.0));
  v40[5] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v13, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -16.0));
  v24 = self->_saveButtonHeightConstraint;
  v40[6] = v23;
  v40[7] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

}

- (void)_updateSortButton
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView _titleForSortType:](self, "_titleForSortType:", self->_sortType));
  -[UIButton setTitle:forState:](self->_sortButton, "setTitle:forState:", v3, 0);

}

- (void)createEditContent
{
  id v3;
  id v4;
  double y;
  double width;
  double height;
  UIView *v8;
  UIView *contentView;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id location;
  _QWORD v46[8];

  v3 = -[CollectionSubHeaderView _maps_addHairlineAtBottomWithMargin:](self, "_maps_addHairlineAtBottomWithMargin:", 0.0);
  v4 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentView = self->_contentView;
  self->_contentView = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("CollectionSubHeaderContent"));
  -[CollectionSubHeaderView addSubview:](self, "addSubview:", self->_contentView);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v42, "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v42, "setAccessibilityIdentifier:", CFSTR("CollectionSubHeaderButton"));
  -[UIView addSubview:](self->_contentView, "addSubview:", v42);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView theme](self, "theme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyColor"));
  objc_msgSend(v42, "setTitleColor:forState:", v11, 0);

  objc_initWeak(&location, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100895510;
  v43[3] = &unk_1011BECE8;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v42, "_setMenuProvider:", v43);
  objc_storeStrong((id *)&self->_sortButton, v42);
  -[CollectionSubHeaderView _updateSortButton](self, "_updateSortButton");
  v12 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v12, "setTextColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Collection] Sort by"), CFSTR("localized string not found"), 0));
  objc_msgSend(v12, "setText:", v15);

  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("CollectionSubHeaderLabel"));
  -[UIView addSubview:](self->_contentView, "addSubview:", v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView leadingAnchor](self, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v46[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView bottomAnchor](self, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v46[1] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView trailingAnchor](self, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v46[2] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v46[3] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, -8.0));
  v46[4] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "titleLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstBaselineAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstBaselineAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v46[5] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 5.0));
  v46[6] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -16.0));
  v46[7] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  -[CollectionSubHeaderView updateFonts](self, "updateFonts");
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

- (double)_height
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = 1.0;
  v4 = 1.0 - self->_shrinkFactor;
  -[CollectionSubHeaderView originalHeight](self, "originalHeight");
  if (v4 * v5 >= 1.0)
  {
    v6 = 1.0 - self->_shrinkFactor;
    -[CollectionSubHeaderView originalHeight](self, "originalHeight");
    return v6 * v7;
  }
  return v3;
}

- (double)originalHeight
{
  unint64_t type;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  type = self->_type;
  v3 = 76.0;
  if (type != 2)
    v3 = 0.0;
  if (type == 1)
    v4 = 26.0;
  else
    v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView _currentFont](self, "_currentFont", v3));
  objc_msgSend(v5, "_mapkit_scaledValueForValue:", v4);
  v7 = v6;

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[CollectionSubHeaderView _height](self, "_height");
  v3 = v2;
  v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)setShrinkFactor:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (self->_shrinkFactor != v3)
  {
    self->_shrinkFactor = v3;
    -[CollectionSubHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (id)_createMenuForSortButton
{
  void *v3;
  void *v4;
  id WeakRetained;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView _createUIActionForSortType:](self, "_createUIActionForSortType:", 2));
  objc_msgSend(v3, "addObject:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "collectionSubHeaderViewShouldShowSortByDistance");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView _createUIActionForSortType:](self, "_createUIActionForSortType:", 1));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView _createUIActionForSortType:](self, "_createUIActionForSortType:", 0));
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v3));
  return v9;
}

- (id)_createUIActionForSortType:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9[2];
  id location;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSubHeaderView _titleForSortType:](self, "_titleForSortType:"));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100895880;
  v8[3] = &unk_1011B8278;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v8));
  objc_msgSend(v6, "setState:", self->_sortType == a3);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_titleForSortType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  if (a3)
  {
    if (a3 == 2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Collection] Header Name");
    }
    else
    {
      if (a3 != 1)
      {
        v6 = &stru_1011EB268;
        return v6;
      }
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[Collection] Header Distance");
    }
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("[Collection] Header Date Added");
  }
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (CollectionHeaderActionTypeDelegate)delegate
{
  return (CollectionHeaderActionTypeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (double)shrinkFactor
{
  return self->_shrinkFactor;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_saveButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_sortButton, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

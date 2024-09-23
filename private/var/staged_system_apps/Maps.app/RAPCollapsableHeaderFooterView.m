@implementation RAPCollapsableHeaderFooterView

- (void)_createSubviews
{
  UIButton *v3;
  UIButton *showAllButton;
  UIButton *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RAPCollapsableHeaderFooterView;
  -[RAPHeaderFooterView _createSubviews](&v12, "_createSubviews");
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  showAllButton = self->_showAllButton;
  self->_showAllButton = v3;

  v5 = self->_showAllButton;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCollapsableHeaderFooterView contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tintColor"));
  -[UIButton setTitleColor:forState:](v5, "setTitleColor:forState:", v7, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_showAllButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = self->_showAllButton;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Show More"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

  -[UIButton setAlpha:](self->_showAllButton, "setAlpha:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCollapsableHeaderFooterView contentView](self, "contentView"));
  objc_msgSend(v11, "addSubview:", self->_showAllButton);

}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)RAPCollapsableHeaderFooterView;
  v3 = -[RAPHeaderFooterView _initialConstraints](&v20, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView titleLabel](self, "titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_showAllButton, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintLessThanOrEqualToAnchor:", v7));
  objc_msgSend(v4, "addObject:", v8);

  v9 = _NSDictionaryOfVariableBindings(CFSTR("_showAllButton"), self->_showAllButton, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_showAllButton]-|"), 0, 0, v10));
  objc_msgSend(v4, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastBaselineAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton lastBaselineAnchor](self->_showAllButton, "lastBaselineAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  objc_msgSend(v4, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_showAllButton, "heightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToConstant:", 44.0));
  objc_msgSend(v4, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_showAllButton, "widthAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintGreaterThanOrEqualToConstant:", 44.0));
  objc_msgSend(v4, "addObject:", v18);

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPCollapsableHeaderFooterView;
  -[RAPHeaderFooterView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_showAllButton, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton allTargets](self->_showAllButton, "allTargets", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[UIButton removeTarget:action:forControlEvents:](self->_showAllButton, "removeTarget:action:forControlEvents:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), 0, 64);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[UIButton addTarget:action:forControlEvents:](self->_showAllButton, "addTarget:action:forControlEvents:", v6, a4, 64);
}

- (void)setShowAllButtonVisible:(BOOL)a3
{
  double v4;
  double v5;
  _QWORD v6[6];

  if (a3)
    v4 = 1.0;
  else
    v4 = 0.0;
  -[UIButton alpha](self->_showAllButton, "alpha");
  if (v5 != v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1006D7384;
    v6[3] = &unk_1011AD518;
    v6[4] = self;
    *(double *)&v6[5] = v4;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.3);
  }
}

+ (void)toggleCollapseForTableView:(id)a3 AtSection:(int64_t)a4 withSelectedValue:(id)a5 withSelectedIndex:(int64_t)a6 withAllValues:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;

  v28 = a3;
  v11 = a5;
  v12 = a7;
  if (v28)
  {
    if (v11)
    {
      v13 = objc_alloc_init((Class)NSMutableArray);
    }
    else
    {
      v14 = (uint64_t)objc_msgSend(v12, "count");
      v13 = objc_alloc_init((Class)NSMutableArray);
      if (v14 >= 1)
      {
        for (i = 0; i != v14; ++i)
        {
          if (a6 != i)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, a4));
            objc_msgSend(v13, "addObject:", v16);

          }
        }
      }
    }
    v17 = objc_alloc_init((Class)NSMutableArray);
    if (v11 && a6 >= 1)
    {
      v18 = 0;
      do
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v18, a4));
        objc_msgSend(v17, "addObject:", v19);

        ++v18;
      }
      while (a6 != v18);
    }
    v26 = v12;
    if (v11)
      v20 = objc_msgSend(v12, "count");
    else
      v20 = 0;
    v21 = objc_alloc_init((Class)NSMutableArray);
    v22 = v28;
    if ((uint64_t)v20 > a6)
    {
      v23 = 0;
      v24 = a6 - (_QWORD)v20;
      do
      {
        if (v23)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a6 + v23, a4));
          objc_msgSend(v21, "addObject:", v25);

          v22 = v28;
        }
        ++v23;
      }
      while (v24 + v23);
    }
    objc_msgSend(v22, "beginUpdates", v26);
    objc_msgSend(v28, "deleteRowsAtIndexPaths:withRowAnimation:", v17, 0);
    objc_msgSend(v28, "deleteRowsAtIndexPaths:withRowAnimation:", v21, 3);
    objc_msgSend(v28, "insertRowsAtIndexPaths:withRowAnimation:", v13, 100);
    objc_msgSend(v28, "endUpdates");

    v12 = v27;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showAllButton, 0);
}

@end

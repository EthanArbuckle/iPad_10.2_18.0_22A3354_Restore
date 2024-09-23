@implementation MTGenericSettingsViewController

+ (id)settingFont
{
  void *v2;

  if (objc_msgSend(a1, "isMacIdiom"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  return v2;
}

+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  void *v4;
  uint64_t v6;
  id v7;
  objc_class *v8;
  NSString *v9;

  v7 = a4;
  if ((unint64_t)a3 <= 9)
  {
    v8 = (objc_class *)objc_opt_class(*off_1004AB368[a3], v6);
    v9 = NSStringFromClass(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v4;
}

+ (id)cellIdentifierForSettingType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8)
    return CFSTR("MTSettingSwitchType");
  else
    return *(&off_1004AB3B8 + a3 - 1);
}

+ (double)rowHeight
{
  id v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_msgSend((id)objc_opt_class(a1), "settingFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "lineHeight");
  v5 = v4 + 30.0;

  return v5;
}

- (MTGenericSettingsViewController)init
{
  MTGenericSettingsViewController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTGenericSettingsViewController;
  v2 = -[MTGenericSettingsViewController initWithStyle:](&v6, "initWithStyle:", 2);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "syncControllerOperationCompleted:", CFSTR("MTSyncControllerOperationCompleted"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTGenericSettingsViewController;
  -[MTGenericSettingsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTGenericSettingsViewController;
  -[MTGenericSettingsViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(MTSettingsWithActionHeaderView), CFSTR("MTSettingsWithActionHeaderView"));
  -[MTGenericSettingsViewController updateRowHeight](self, "updateRowHeight");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTGenericSettingsViewController;
  -[MTGenericSettingsViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTGenericSettingsViewController;
  -[MTGenericSettingsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[MTGenericSettingsViewController _scrollEmphasizedCellToVisibleIfNecessary](self, "_scrollEmphasizedCellToVisibleIfNecessary");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController view](self, "view", a3));
  objc_msgSend(v4, "setNeedsLayout");

  -[MTGenericSettingsViewController updateRowHeight](self, "updateRowHeight");
}

- (void)updateRowHeight
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  objc_msgSend((id)objc_opt_class(self), "rowHeight");
  objc_msgSend(v3, "setRowHeight:");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)setEmphasizedSetting:(id)a3 style:(int64_t)a4
{
  MTSetting *emphasizedSetting;
  _BOOL4 v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  MTSetting *v13;

  v13 = (MTSetting *)a3;
  emphasizedSetting = self->_emphasizedSetting;
  v8 = self->_cellEmphasisStyle != a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", emphasizedSetting));
  if (emphasizedSetting == v13)
  {
    v11 = 0;
  }
  else
  {
    if (v9)
      v10 = self->_emphasizedSetting == 0;
    else
      v10 = 1;
    if (v10)
      v11 = 0;
    else
      v11 = v9;
    v8 = 1;
  }
  v12 = v11;
  objc_storeStrong((id *)&self->_emphasizedSetting, a3);
  self->_cellEmphasisStyle = a4;
  if (v8)
  {
    if (v12)
      -[MTGenericSettingsViewController _configureEmphasisForCellAtIndexPath:animated:](self, "_configureEmphasisForCellAtIndexPath:animated:", v12, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
    self->_emphasizedCellNeedsScrollToVisible = 1;
    if (!-[MTGenericSettingsViewController _shouldDelayEmphasizeCellScrollToVisible](self, "_shouldDelayEmphasizeCellScrollToVisible"))-[MTGenericSettingsViewController _scrollEmphasizedCellToVisibleIfNecessary](self, "_scrollEmphasizedCellToVisibleIfNecessary");
  }

}

- (BOOL)_shouldDelayEmphasizeCellScrollToVisible
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController navigationController](self, "navigationController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_scrollEmphasizedCellToVisibleIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL8 v25;
  void *v26;
  CGRect v27;
  CGRect v28;

  if (self->_emphasizedCellNeedsScrollToVisible)
  {
    self->_emphasizedCellNeedsScrollToVisible = 0;
    if (self->_emphasizedSetting)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:"));
      if (v3)
      {
        v26 = v3;
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
        objc_msgSend(v4, "rectForRowAtIndexPath:", v26);
        v6 = v5;
        v8 = v7;
        v10 = v9;
        v12 = v11;
        objc_msgSend(v4, "visibleBounds");
        Height = CGRectGetHeight(v27);
        v28.origin.x = v6;
        v28.origin.y = v8;
        v28.size.width = v10;
        v28.size.height = v12;
        v14 = CGRectGetMaxY(v28) + Height * -0.5;
        objc_msgSend(v4, "adjustedContentInset");
        v16 = v15;
        v18 = -v17;
        objc_msgSend(v4, "contentSize");
        v20 = v16 + v19 - Height;
        objc_msgSend(v4, "contentOffset");
        v22 = v21;
        if (v14 >= v20)
          v23 = v20;
        else
          v23 = v14;
        if (v23 >= v18)
          v24 = v23;
        else
          v24 = v18;
        v25 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
        objc_msgSend(v4, "setContentOffset:animated:", v25, v22, v24);
        -[MTGenericSettingsViewController _configureEmphasisForCellAtIndexPath:animated:](self, "_configureEmphasisForCellAtIndexPath:animated:", v26, v25);

        v3 = v26;
      }

    }
  }
}

- (void)setEmphasizedSetting:(id)a3
{
  if (self->_cellEmphasisStyle)
    -[MTGenericSettingsViewController setEmphasizedSetting:style:](self, "setEmphasizedSetting:style:", a3, self->_cellEmphasisStyle);
  else
    -[MTGenericSettingsViewController setEmphasizedSetting:style:](self, "setEmphasizedSetting:style:", a3, 2);
}

- (void)setCellEmphasisStyle:(int64_t)a3
{
  id v4;

  if (self->_cellEmphasisStyle != a3)
  {
    self->_cellEmphasisStyle = a3;
    if (self->_emphasizedSetting)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:"));
      if (v4)
        -[MTGenericSettingsViewController _configureEmphasisForCellAtIndexPath:animated:](self, "_configureEmphasisForCellAtIndexPath:animated:", v4, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

    }
  }
}

- (BOOL)_isEmphasizedSetting:(id)a3
{
  return self->_emphasizedSetting == a3;
}

- (void)_configureEmphasisForCellAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  -[MTGenericSettingsViewController _configureEmphasisForCell:indexPath:animated:](self, "_configureEmphasisForCell:indexPath:animated:", v8, v6, v4);
}

- (void)_configureEmphasisForCell:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  int64_t cellEmphasisStyle;
  id v14;
  void ***v15;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  int64_t v21;

  v5 = a5;
  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", a4));
  v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
      v11 = objc_opt_class(MTTableViewCell);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        v12 = v8;
        if (-[MTGenericSettingsViewController _isEmphasizedSetting:](self, "_isEmphasizedSetting:", v10))
          cellEmphasisStyle = self->_cellEmphasisStyle;
        else
          cellEmphasisStyle = 0;
        v16 = _NSConcreteStackBlock;
        v17 = 3221225472;
        v18 = sub_1001015F4;
        v19 = &unk_1004A77F8;
        v14 = v12;
        v20 = v14;
        v21 = cellEmphasisStyle;
        v15 = objc_retainBlock(&v16);
        if (v5)
        {
          objc_msgSend(v14, "selectionFadeDuration", v16, v17, v18, v19);
          +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v15, 0);
        }
        else
        {
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15, v16, v17, v18, v19);
        }

      }
    }
  }

}

- (void)setSettingsController:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_settingsController, a3);
  objc_msgSend(v6, "setDelegate:", self);
  if (-[MTGenericSettingsViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    objc_msgSend(v5, "reloadData");

  }
}

- (id)settingAtIndexPath:(id)a3
{
  MTSettingsController *settingsController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  settingsController = self->_settingsController;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupSettings"));

  v11 = objc_msgSend(v5, "row");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));

  return v12;
}

- (id)indexPathForSetting:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100101958;
    v21[3] = &unk_1004AB2F8;
    v6 = v4;
    v22 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keysOfEntriesPassingTest:", v21));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
    v10 = objc_msgSend(v9, "indexOfObject:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "group"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupSettings"));
    v13 = objc_msgSend(v12, "indexOfObject:", v6);

    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL || v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = _MTLogCategoryDefault(v14);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
        *(_DWORD *)buf = 138543874;
        v24 = v6;
        v25 = 2114;
        v26 = v8;
        v27 = 2114;
        v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to locate an index path for setting %{public}@ for key %{public}@. All settings: %{public}@", buf, 0x20u);

      }
      v19 = 0;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v13, v10));
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)setCell:(id)a3 enabled:(BOOL)a4 withDescription:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v8 = a5;
  if (v6)
  {
    objc_msgSend(v15, "setSelectionStyle:", -[MTGenericSettingsViewController _defaultSelectionStyleForSetting:](self, "_defaultSelectionStyleForSetting:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLabel"));
    objc_msgSend(v9, "setEnabled:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "detailTextLabel"));
    v11 = v10;
    v12 = 1;
  }
  else
  {
    objc_msgSend(v15, "setSelectionStyle:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textLabel"));
    objc_msgSend(v13, "setEnabled:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "detailTextLabel"));
    v11 = v10;
    v12 = 0;
  }
  objc_msgSend(v10, "setEnabled:", v12);

  if (objc_msgSend(v8, "type"))
  {
    if (!v6)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v15, "setEnabled:", v6);
    if (!v6)
      goto LABEL_11;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", v8));
  if (v14)
    -[MTGenericSettingsViewController _configureEmphasisForCell:indexPath:animated:](self, "_configureEmphasisForCell:indexPath:animated:", v15, v14, 0);

LABEL_11:
}

- (int64_t)_defaultSelectionStyleForSetting:(id)a3
{
  if (objc_msgSend(a3, "type"))
    return 3;
  else
    return 0;
}

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  return 44.0;
}

+ (BOOL)isMacIdiom
{
  return 0;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
  objc_msgSend(v14, "setText:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v17, "setBaselineAdjustment:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v18, "setMinimumScaleFactor:", 0.9);

  if ((objc_msgSend((id)objc_opt_class(self), "isMacIdiom") & 1) != 0)
    v19 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  else
    v19 = objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody));
  v20 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v21, "setFont:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "detailTextLabel"));
  objc_msgSend(v22, "setFont:", v20);

  objc_initWeak(&location, self);
  switch((unint64_t)objc_msgSend(v12, "type"))
  {
    case 0uLL:
      v23 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
      objc_msgSend(v23, "toggleOn:", objc_msgSend(v24, "BOOLValue"));

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100101FD4;
      v38[3] = &unk_1004AB320;
      objc_copyWeak(&v40, &location);
      v39 = v12;
      objc_msgSend(v23, "setToggleChanged:", v38);

      objc_destroyWeak(&v40);
      goto LABEL_20;
    case 1uLL:
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](UIColor, "cellTextColor"));
      objc_msgSend(v25, "setTextColor:", v26);

      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
      objc_msgSend(v23, "setTextAlignment:", 1);
      goto LABEL_20;
    case 2uLL:
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "detailTextLabel"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
      objc_msgSend(v35, "setText:", v36);

      goto LABEL_17;
    case 3uLL:
LABEL_17:
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
      objc_msgSend(v23, "setTextColor:", v27);
      goto LABEL_19;
    case 4uLL:
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "detailTextLabel"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
      objc_msgSend(v23, "setText:", v27);
      goto LABEL_19;
    case 5uLL:
      v23 = v12;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "detailTextLabel"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentShortTitle"));
      objc_msgSend(v27, "setText:", v28);
      goto LABEL_15;
    case 7uLL:
      v23 = v12;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "radioGroup"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "value"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v37, "value")));
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (v31)
        v32 = 3;
      else
        v32 = 0;
      objc_msgSend(v10, "setAccessoryType:", v32);
      if (-[MTGenericSettingsViewController _radioButtonTintsTextColorOnSelection](self, "_radioButtonTintsTextColorOnSelection"))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](UIColor, "cellTextColor"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
        objc_msgSend(v34, "setTextColor:", v33);

      }
      goto LABEL_20;
    case 9uLL:
      v23 = v10;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "messageLabel"));
      objc_msgSend(v28, "setText:", v27);
LABEL_15:

LABEL_19:
LABEL_20:

      break;
    default:
      break;
  }
  objc_destroyWeak(&location);

}

- (id)newCellForDescriptionType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  Class v9;
  NSString *v10;
  Class v11;
  NSString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  void *v22;
  id v23;

  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(self), "cellClassForSettingType:inGroupWithIdentifier:", a3, v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSClassFromString(v8);

  v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[MTGenericSettingsViewController cellClassForSettingType:inGroupWithIdentifier:](MTGenericSettingsViewController, "cellClassForSettingType:inGroupWithIdentifier:", a3, v6));
  v11 = NSClassFromString(v10);

  if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", v11) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not a subclass of %@"), v9, v11));
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("MTInvalidCellClass"), v22, 0));

    objc_exception_throw(v23);
  }
  v12 = NSStringFromClass(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend((id)objc_opt_class(self), "cellIdentifierForSettingType:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, v15));

  switch(a3)
  {
    case 0:
    case 1:
    case 6:
    case 9:
      v17 = [v9 alloc];
      v18 = 0;
      goto LABEL_5;
    case 2:
    case 3:
    case 8:
      v17 = [v9 alloc];
      v18 = 1;
LABEL_5:
      v9 = (Class)objc_msgSend(v17, "initWithStyle:reuseIdentifier:", v18, v16);
      break;
    case 4:
      v19 = (objc_class *)objc_msgSend([v9 alloc], "initWithStyle:reuseIdentifier:", 1, v16);
      v9 = v19;
      v20 = 1;
      goto LABEL_9;
    case 5:
      v9 = (Class)objc_msgSend([v9 alloc], "initWithStyle:reuseIdentifier:", 1, v16);
      v20 = objc_msgSend((id)objc_opt_class(self), "isMacIdiom") ^ 1;
      v19 = v9;
      goto LABEL_9;
    case 7:
      v19 = (objc_class *)objc_msgSend([v9 alloc], "initWithStyle:reuseIdentifier:", 1, v16);
      v9 = v19;
      v20 = 3;
LABEL_9:
      -[objc_class setAccessoryType:](v19, "setAccessoryType:", v20);
      break;
    default:
      break;
  }

  return v9;
}

- (id)optionsTableViewControllerWithOption:(id)a3
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  v8 = objc_msgSend(v5, "section");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  -[MTGenericSettingsViewController heightForRowWithDescription:inGroupWithIdentifier:](self, "heightForRowWithDescription:inGroupWithIdentifier:", v6, v9);
  v11 = v10;

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  -[MTGenericSettingsViewController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", a3, a4);
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  objc_msgSend(v9, "customHeaderHeight");
  v10 = 30.0;
  if (v11 > 0.0)
  {
    objc_msgSend(v9, "customHeaderHeight");
    v10 = v12;
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  double result;

  -[MTGenericSettingsViewController tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", a3, a4);
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MTGenericSettingsFooterLabelView *v11;
  void *v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupFooter"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = objc_alloc_init(MTGenericSettingsFooterLabelView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](v11, "textView"));
    objc_msgSend(v12, "setAttributedText:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  NSAttributedStringKey v23;
  void *v24;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupFooter"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController view](self, "view"));
    objc_msgSend(v11, "frame");
    v13 = v12;
    +[MTGenericSettingsFooterLabelView labelInset](MTGenericSettingsFooterLabelView, "labelInset");
    v15 = v13 + v14 * -2.0;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "string"));
    v23 = NSFontAttributeName;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont sectionFooterFont](UIFont, "sectionFooterFont"));
    v24 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, v15, 1.79769313e308);
    v20 = v19;

    v21 = ceil(v20) + 32.0;
  }
  else
  {
    v21 = 16.0;
  }

  return v21;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupSettings"));
  v11 = objc_msgSend(v10, "count");

  return (int64_t)v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v6));
  v9 = objc_msgSend((id)objc_opt_class(self), "cellIdentifierForSettingType:", objc_msgSend(v8, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v10));

  if (!v11)
  {
    v12 = objc_msgSend(v8, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
    v11 = -[MTGenericSettingsViewController newCellForDescriptionType:inGroupWithIdentifier:](self, "newCellForDescriptionType:inGroupWithIdentifier:", v12, v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
  -[MTGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:](self, "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:", v11, v6, v8, v16);

  return v11;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController disabledGroups](self->_settingsController, "disabledGroups"));
  if ((objc_msgSend(v9, "containsObject:", v8) & 1) != 0)
  {

LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "enabled");

  if ((v10 & 1) == 0)
    goto LABEL_5;
  v11 = v5;
LABEL_6:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t (**v10)(void);
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  _BYTE v51[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v7));
  switch((unint64_t)objc_msgSend(v8, "type"))
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "changeHandler"));
      v9[2](v9, 0);

      break;
    case 4uLL:
      v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "generator"));
      v11 = v10[2]();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController navigationController](self, "navigationController"));
      objc_msgSend(v13, "pushViewController:animated:", v12, 1);

      break;
    case 5uLL:
      v14 = v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "options"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController optionsTableViewControllerWithOption:](self, "optionsTableViewControllerWithOption:", v14));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "headerTitle"));
      objc_msgSend(v16, "setTitle:", v17);

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100102D64;
      v47[3] = &unk_1004AB348;
      v47[4] = self;
      v48 = v14;
      v49 = v15;
      v50 = v7;
      v18 = v15;
      v19 = v14;
      objc_msgSend(v16, "setOptionSelectedBlock:", v47);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController metricDataSource](self, "metricDataSource"));
      objc_msgSend(v16, "setMetricDataSource:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController navigationController](self, "navigationController"));
      objc_msgSend(v21, "pushViewController:animated:", v16, 1);

      break;
    case 7uLL:
      v41 = v7;
      v42 = v6;
      v40 = v8;
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "radioGroup"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
      objc_msgSend(v23, "setValue:", objc_msgSend(v24, "unsignedIntegerValue"));

      v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "changeHandler"));
      v39 = v22;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
      ((void (**)(_QWORD, id))v25)[2](v25, objc_msgSend(v26, "unsignedIntegerValue"));

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v38 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "settings"));
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", v32));
            if (v33)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cellForRowAtIndexPath:", v33));

              v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(v33, "section")));

              -[MTGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:](self, "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:", v35, v33, v32, v37);
            }

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v29);
      }

      v7 = v41;
      v6 = v42;
      v8 = v40;
      break;
    default:
      break;
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headerAction"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("MTSettingsWithActionHeaderView")));
    objc_msgSend(v12, "setAction:", v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](self->_settingsController, "order", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController groups](self->_settingsController, "groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupTitle"));
  return v10;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend((id)objc_opt_class(self), "isMacIdiom"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  MTSettingsController *settingsController;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  settingsController = self->_settingsController;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController disabledGroups](self->_settingsController, "disabledGroups"));
  if ((objc_msgSend(v12, "containsObject:", v14) & 1) != 0)
    v13 = 0;
  else
    v13 = objc_msgSend(v11, "enabled");

  -[MTGenericSettingsViewController setCell:enabled:withDescription:](self, "setCell:enabled:withDescription:", v9, v13, v11);
}

- (void)settingsController:(id)a3 reloadedGroupWithIdentifier:(id)a4
{
  MTSettingsController *settingsController;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  settingsController = self->_settingsController;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  v10 = objc_msgSend(v9, "numberOfSections");

  if ((uint64_t)v8 < (uint64_t)v10)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v8));
    objc_msgSend(v12, "reloadSections:withRowAnimation:", v11, 100);

  }
}

- (void)settingsController:(id)a3 addedGroup:(id)a4 atIndex:(int64_t)a5
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a5));
  objc_msgSend(v7, "insertSections:withRowAnimation:", v6, 100);

}

- (void)settingsController:(id)a3 didChangeHeaderAction:(id)a4 inGroupWithIdentifier:(id)a5
{
  MTSettingsController *settingsController;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  settingsController = self->_settingsController;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  v11 = v17;
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headerViewForSection:", v10));

    if (v13)
    {
      v14 = objc_opt_class(MTSettingsWithActionHeaderView);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        objc_msgSend(v13, "setAction:", v17);
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v10));
        objc_msgSend(v15, "reloadSections:withRowAnimation:", v16, 100);

      }
    }

    v11 = v17;
  }

}

- (void)settingsController:(id)a3 removedGroupAtIndex:(int64_t)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a4));
  objc_msgSend(v6, "deleteSections:withRowAnimation:", v5, 100);

}

- (void)settingsController:(id)a3 removedSettingAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5
{
  MTSettingsController *settingsController;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  settingsController = self->_settingsController;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, v10));
  v14 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 100);

}

- (void)settingsController:(id)a3 didChangeSettingValueAtIndex:(int64_t)a4 inGroupWithIdentifier:(id)a5
{
  MTSettingsController *settingsController;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  settingsController = self->_settingsController;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSettingsController order](settingsController, "order"));
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, v10));
  if (!-[MTGenericSettingsViewController updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:](self, "updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:", v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    v14 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 100);

  }
}

- (BOOL)updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingAtIndexPath:](self, "settingAtIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v4));

  v8 = objc_opt_class(MTSwitchCell);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);
  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    objc_msgSend(v7, "toggleOn:animated:", objc_msgSend(v10, "BOOLValue"), 1);

  }
  return isKindOfClass & 1;
}

- (void)optionSettingChanged:(id)a3 value:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  objc_msgSend(v5, "setValue:", v6);

  v8 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "changeHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v8[2](v8, v7);

}

- (void)switchSettingChanged:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v6, "setValue:", v8);

  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "changeHandler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  ((void (**)(_QWORD, void *))v9)[2](v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));

  LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", v12);
  if ((v6 & 1) == 0 && v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    v15 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v13, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 5);

  }
}

- (void)textSettingChanged:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "setValue:", v7);
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "changeHandler"));
    ((void (**)(_QWORD, id))v8)[2](v8, v7);
  }
  else
  {
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController indexPathForSetting:](self, "indexPathForSetting:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController tableView](self, "tableView"));
    v10 = v9;
    if (v8)
    {
      v12 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      objc_msgSend(v10, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 5);

    }
    else
    {
      objc_msgSend(v9, "reloadData");
    }

  }
}

- (BOOL)_radioButtonTintsTextColorOnSelection
{
  return 1;
}

- (MTSettingsController)settingsController
{
  return self->_settingsController;
}

- (MTSetting)emphasizedSetting
{
  return self->_emphasizedSetting;
}

- (int64_t)cellEmphasisStyle
{
  return self->_cellEmphasisStyle;
}

- (BOOL)emphasizedCellNeedsScrollToVisible
{
  return self->_emphasizedCellNeedsScrollToVisible;
}

- (void)setEmphasizedCellNeedsScrollToVisible:(BOOL)a3
{
  self->_emphasizedCellNeedsScrollToVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedSetting, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
}

@end

@implementation IdentitySwitcherViewController

- (IdentitySwitcherViewController)initWithModel:(id)a3
{
  id v5;
  IdentitySwitcherViewController *v6;
  IdentitySwitcherViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IdentitySwitcherViewController;
  v6 = -[IdentitySwitcherViewController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (void)loadView
{
  id v3;
  double y;
  double width;
  double height;
  UITableView *v7;
  UITableView *tableView;
  IdentitySwitcherHeaderView *v9;

  v3 = objc_alloc((Class)UITableView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = v7;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  +[IdentitySwitcherCell cellHeight](IdentitySwitcherCell, "cellHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  v9 = -[IdentitySwitcherHeaderView initWithFrame:]([IdentitySwitcherHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[IdentitySwitcherHeaderView setPreservesSuperviewLayoutMargins:](v9, "setPreservesSuperviewLayoutMargins:", 1);
  -[IdentitySwitcherHeaderView sizeToFit](v9, "sizeToFit");
  -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v9);
  -[IdentitySwitcherViewController setView:](self, "setView:", self->_tableView);

}

- (CGSize)preferredContentSize
{
  UITableView *tableView;
  double v3;
  double v4;
  double v5;
  CGSize result;

  tableView = self->_tableView;
  -[UITableView bounds](tableView, "bounds");
  -[UITableView sizeThatFits:](tableView, "sizeThatFits:", v3, 1.79769313e308);
  result.height = v5;
  result.width = v4;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  char *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates", a3, a4));
  v5 = (char *)objc_msgSend(v4, "count") + 2;

  return (int64_t)v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  char *v5;
  void *v6;
  char *v7;
  void *v9;
  double v10;
  double v11;

  v5 = (char *)objc_msgSend(a4, "row", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
  v7 = (char *)objc_msgSend(v6, "count") + 1;

  if (v5 < v7)
    return UITableViewAutomaticDimension;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v9, "_scaledValueForValue:", 52.0);
  v11 = v10;

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  double v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
  v10 = objc_msgSend(v9, "count");

  if (v8 <= v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sourceForSelectedIdentity](self->_model, "sourceForSelectedIdentity"));
    if (objc_msgSend(v7, "row"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", (char *)objc_msgSend(v7, "row") - 1));

      v21 = objc_msgSend(v17, "isEqual:", v18);
    }
    else
    {
      v18 = 0;
      v21 = v17 == 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[IdentitySwitcherCell cellForSource:withModel:inTableView:](IdentitySwitcherCell, "cellForSource:withModel:inTableView:", v18, self->_model, v6));
    v11 = v22;
    if (v21)
      v23 = 3;
    else
      v23 = 0;
    objc_msgSend(v22, "setAccessoryType:", v23);
    v24 = objc_msgSend(v7, "row");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
    v26 = objc_msgSend(v25, "count");

    if (v24 < v26)
    {
      objc_msgSend(v11, "layoutMargins");
      objc_msgSend(v11, "setSeparatorInset:", 0.0, v27 + 65.0, 0.0, 0.0);
    }
  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tintColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v13, "setTextColor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Add Delegate Calendar…"), &stru_1001B67C0, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v16, "setText:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0x8000, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v17, 0.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
    objc_msgSend(v19, "setFont:", v18);

  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CUIKCalendarModel *model;
  void *v15;
  id v16;

  v16 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v16, 1);
  v6 = objc_msgSend(v16, "row");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
  v8 = objc_msgSend(v7, "count");

  if (v6 <= v8)
  {
    if ((uint64_t)objc_msgSend(v16, "row") < 1)
    {
      v13 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel sortedEnabledDelegates](self->_model, "sortedEnabledDelegates"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", (char *)objc_msgSend(v16, "row") - 1));

    }
    model = self->_model;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedCalendars](model, "selectedCalendars"));
    -[CUIKCalendarModel updateSourceForSelectedIdentity:selectedCalendars:](model, "updateSourceForSelectedIdentity:selectedCalendars:", v13, v15);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherViewController presentingViewController](self, "presentingViewController"));
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherViewController presentingViewController](self, "presentingViewController"));
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=CALENDAR&path=DELEGATE_CALENDARS")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v11, "openSensitiveURL:withOptions:error:", v10, 0, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

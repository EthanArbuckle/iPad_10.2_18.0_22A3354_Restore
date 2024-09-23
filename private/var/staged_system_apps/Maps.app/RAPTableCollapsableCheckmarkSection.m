@implementation RAPTableCollapsableCheckmarkSection

- (RAPTableCollapsableCheckmarkSection)initWithOwner:(id)a3 initialValues:(id)a4 initialSelectedValue:(id)a5 configureForValue:(id)a6 selection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RAPTableCollapsableCheckmarkSection *v18;
  objc_super v20;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_msgSend(a6, "copy");
  v17 = objc_msgSend(v12, "copy");

  v20.receiver = self;
  v20.super_class = (Class)RAPTableCollapsableCheckmarkSection;
  v18 = -[RAPTableCheckmarkRadioSection initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:](&v20, "initWithOwner:initialValues:initialSelectedValue:configureForValue:selection:", v15, v14, v13, v16, v17);

  if (v18)
    -[RAPTableCollapsableCheckmarkSection _sharedInit](v18, "_sharedInit");
  return v18;
}

- (void)_sharedInit
{
  RAPCollapsableHeaderFooterView *v3;
  RAPCollapsableHeaderFooterView *collapsableHeaderView;

  v3 = -[RAPHeaderFooterView initWithReuseIdentifier:]([RAPCollapsableHeaderFooterView alloc], "initWithReuseIdentifier:", CFSTR("RAPSearchResultsHeaderView"));
  collapsableHeaderView = self->_collapsableHeaderView;
  self->_collapsableHeaderView = v3;

  -[RAPCollapsableHeaderFooterView setTarget:action:](self->_collapsableHeaderView, "setTarget:action:", self, "_showAll");
  -[RAPTablePartSection setHeaderView:](self, "setHeaderView:", self->_collapsableHeaderView);
}

- (void)setHeaderTitle:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", self->_headerTitle) & 1) == 0)
    -[RAPHeaderFooterView setTitleLabelText:](self->_collapsableHeaderView, "setTitleLabelText:", v4);
  v5.receiver = self;
  v5.super_class = (Class)RAPTableCollapsableCheckmarkSection;
  -[RAPTablePartSection setHeaderTitle:](&v5, "setHeaderTitle:", v4);

}

- (void)setValues:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *originalValues;
  void *v8;
  NSArray *v9;
  void *v10;
  objc_super v11;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->super._values != v4)
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    originalValues = self->_originalValues;
    self->_originalValues = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
    if (v8)
    {
      v9 = self->_originalValues;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
      self->_selectedIndex = -[NSArray indexOfObject:](v9, "indexOfObject:", v10);

    }
    else
    {
      self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)RAPTableCollapsableCheckmarkSection;
  -[RAPTableCheckmarkRadioSection setValues:](&v11, "setValues:", v5);

}

- (Class)defaultCellClass
{
  return (Class)objc_opt_class(RAPCheckmarkTableViewCell);
}

- (void)_showAll
{
  objc_storeStrong((id *)&self->super._values, self->_originalValues);
  -[RAPTableCheckmarkRadioSection setSelectedValue:](self, "setSelectedValue:", 0);
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  if (a3 || self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9.receiver = self;
    v9.super_class = (Class)RAPTableCollapsableCheckmarkSection;
    v8 = a4;
    -[RAPTableCheckmarkRadioSection didSelectCellForRowAtIndex:tableIndexPath:](&v9, "didSelectCellForRowAtIndex:tableIndexPath:", a3, v8);

  }
  else
  {
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

    -[RAPTableCollapsableCheckmarkSection _showAll](self, "_showAll");
  }
}

- (void)selectedValueDidChange
{
  RAPTableCollapsableCheckmarkSection **v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *values;
  NSArray *originalValues;
  void *v9;
  void *v10;
  _BOOL8 v11;
  RAPTableCollapsableCheckmarkSection *v12;
  RAPTableCollapsableCheckmarkSection *v13;
  void *v14;

  if ((id)-[NSArray count](self->_originalValues, "count") == (id)1)
  {
    v13 = self;
    v3 = &v13;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
      v14 = v5;
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      values = self->super._values;
      self->super._values = v6;

      originalValues = self->_originalValues;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
      self->_selectedIndex = -[NSArray indexOfObject:](originalValues, "indexOfObject:", v9);

    }
    if (-[NSArray count](self->_originalValues, "count") < 2)
    {
      v11 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
      v11 = v10 != 0;

    }
    -[RAPCollapsableHeaderFooterView setShowAllButtonVisible:](self->_collapsableHeaderView, "setShowAllButtonVisible:", v11);
    -[RAPTableCollapsableCheckmarkSection toggleCollapse](self, "toggleCollapse");
    v12 = self;
    v3 = &v12;
  }
  v3[1] = (RAPTableCollapsableCheckmarkSection *)RAPTableCollapsableCheckmarkSection;
  objc_msgSendSuper2((objc_super *)v3, "selectedValueDidChange", v12);
}

- (void)toggleCollapse
{
  void *v3;
  int64_t selectedIndex;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableCheckmarkRadioSection selectedValue](self, "selectedValue"));
  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
    selectedIndex = -1;
  else
    selectedIndex = self->_selectedIndex;
  +[RAPCollapsableHeaderFooterView toggleCollapseForTableView:AtSection:withSelectedValue:withSelectedIndex:withAllValues:](RAPCollapsableHeaderFooterView, "toggleCollapseForTableView:AtSection:withSelectedValue:withSelectedIndex:withAllValues:", v5, 0, v3, selectedIndex, self->_originalValues);

}

- (id)headerTitle
{
  return self->_headerTitle;
}

- (NSArray)originalValues
{
  return self->_originalValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_collapsableHeaderView, 0);
}

@end

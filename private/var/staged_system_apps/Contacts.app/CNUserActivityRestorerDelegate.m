@implementation CNUserActivityRestorerDelegate

- (CNUserActivityRestorerDelegate)initWithContactsSplitViewController:(id)a3
{
  id v4;
  CNUserActivityRestorerDelegate *v5;
  CNUserActivityRestorerDelegate *v6;
  CNUserActivityRestorerDelegate *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUserActivityRestorerDelegate;
  v5 = -[CNUserActivityRestorerDelegate init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contactsSplitViewController, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)userActivityRestorer:(id)a3 restoreCreateContact:(id)a4 activity:(id)a5
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController", a3, a4, a5));
  objc_msgSend(v5, "createNewContact");

  return 1;
}

- (BOOL)userActivityRestorer:(id)a3 restoreViewContact:(id)a4 activity:(id)a5
{
  id v7;
  void *v8;

  if (a4)
  {
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    objc_msgSend(v8, "showCardForContact:fallbackToFirstContact:", v7, 0);

  }
  return a4 != 0;
}

- (BOOL)userActivityRestorer:(id)a3 restoreEditContact:(id)a4 activity:(id)a5
{
  id v7;
  void *v8;

  if (a4)
  {
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    objc_msgSend(v8, "showEditingCardForContact:", v7);

  }
  return a4 != 0;
}

- (BOOL)userActivityRestorer:(id)a3 restoreSearch:(id)a4 activity:(id)a5
{
  id v6;
  char v7;
  void *v8;

  v6 = a4;
  v7 = (*(uint64_t (**)(_QWORD, id))(CNIsStringEmpty + 16))(CNIsStringEmpty, v6);
  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    objc_msgSend(v8, "searchForString:", v6);

  }
  return v7 ^ 1;
}

- (BOOL)userActivityRestorer:(id)a3 restoreViewListAtContact:(id)a4 displayedContact:(id)a5 searchString:(id)a6 isShowingGroups:(BOOL)a7 activity:(id)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
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

  v8 = a7;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
  v16 = objc_msgSend(v15, "_isCollapsed");

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contactNavigationController"));
    objc_msgSend(v18, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", v13, 0, 0, 1, 0, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    objc_msgSend(v19, "showContactList");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contactNavigationController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contactListViewController"));
    objc_msgSend(v22, "setCellStateSelected:forContact:animated:", 1, v13, 0);

  }
  if ((*(unsigned int (**)(_QWORD, id))(CNIsStringNonempty + 16))(CNIsStringNonempty, v14))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contactNavigationController"));
    objc_msgSend(v24, "searchForString:", v14);

  }
  if (v12)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contactNavigationController"));
    objc_msgSend(v26, "scrollToContact:animated:", v12, 0);

  }
  if (v8)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController"));
    objc_msgSend(v27, "showGroupsAnimated:", 0);

  }
  return 1;
}

- (BOOL)userActivityRestorer:(id)a3 restoreViewGroupsWithActivity:(id)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNUserActivityRestorerDelegate contactsSplitViewController](self, "contactsSplitViewController", a3, a4));
  objc_msgSend(v4, "showGroupsAnimated:", 0);

  return 1;
}

- (id)userActivityRestorer:(id)a3 keysToFetchWhenRestoringViewContactActivity:(id)a4
{
  NSString *v5;

  v5 = CNContactIdentifierKey;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
}

- (id)userActivityRestorer:(id)a3 keysToFetchWhenRestoringEditContactContactActivity:(id)a4
{
  NSString *v5;

  v5 = CNContactIdentifierKey;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
}

- (ContactsSplitViewController)contactsSplitViewController
{
  return (ContactsSplitViewController *)objc_loadWeakRetained((id *)&self->_contactsSplitViewController);
}

- (void)setContactsSplitViewController:(id)a3
{
  objc_storeWeak((id *)&self->_contactsSplitViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactsSplitViewController);
}

@end

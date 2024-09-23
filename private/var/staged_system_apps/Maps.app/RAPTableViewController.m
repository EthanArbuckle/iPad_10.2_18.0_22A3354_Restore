@implementation RAPTableViewController

- (RAPTableViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPTableViewController;
  return -[RAPTableViewController initWithStyle:](&v3, "initWithStyle:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RAPTableViewController;
  -[RAPTableViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RAPTableView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v6, "setTableView:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setBackButtonTitle:", v8);

}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPTableViewController;
  -[RAPTableViewController infoCardThemeChanged](&v7, "infoCardThemeChanged");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controlBackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];

  v13.receiver = self;
  v13.super_class = (Class)RAPTableViewController;
  -[RAPTableViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableParts"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "presentingViewControllerViewDidLayoutSubviews");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (RAPTablePartsDataSource)dataSource
{
  RAPTablePartsDataSource *dataSource;
  RAPTablePartsDataSource *v4;
  RAPTablePartsDataSource *v5;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = -[RAPTableViewController newDataSource](self, "newDataSource");
    v5 = self->_dataSource;
    self->_dataSource = v4;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (RAPTablePartsDataSource)newDataSource
{
  return -[RAPTablePartsDataSource initWithPresentingViewController:]([RAPTablePartsDataSource alloc], "initWithPresentingViewController:", self);
}

- (void)segueToViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[RAPTableViewController usesNavigationControllerPushForSegue](self, "usesNavigationControllerPushForSegue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
    objc_msgSend(v4, "pushViewController:animated:", v5, 1);

  }
}

- (void)segueToViewController:(id)a3 afterReturningFromViewController:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if (-[RAPTableViewController usesNavigationControllerPushForSegue](self, "usesNavigationControllerPushForSegue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
    v7 = objc_msgSend(v6, "mutableCopy");

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "insertObject:atIndex:", v11, (char *)objc_msgSend(v7, "count") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
      objc_msgSend(v8, "setViewControllers:animated:", v7, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
      v10 = objc_msgSend(v9, "popToViewController:animated:", v11, 1);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
      objc_msgSend(v9, "pushViewController:animated:", v11, 1);
    }

  }
}

- (void)returnFromViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[RAPTableViewController usesNavigationControllerPushForSegue](self, "usesNavigationControllerPushForSegue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
    v6 = objc_msgSend(v5, "indexOfObject:", v15);

    if (v6)
    {
      if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = v15;
        if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___RAPInstrumentableTarget))
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;

        if (objc_msgSend(v9, "analyticTarget"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
          objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 10111, objc_msgSend(v9, "analyticTarget"), 0);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
        v13 = objc_msgSend(v12, "mutableCopy");

        objc_msgSend(v13, "trimToLength:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController navigationController](self, "navigationController"));
        objc_msgSend(v14, "setViewControllers:animated:", v13, 1);

      }
    }
  }

}

- (BOOL)usesNavigationControllerPushForSegue
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionAtIndex:", objc_msgSend(v5, "section")));

  LOBYTE(v6) = objc_msgSend(v7, "shouldHighlightCellForRowAtIndex:tableIndexPath:", objc_msgSend(v5, "row"), v5);
  return (char)v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionAtIndex:", objc_msgSend(v6, "section")));

  objc_msgSend(v9, "didSelectCellForRowAtIndex:tableIndexPath:", objc_msgSend(v6, "row"), v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

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
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headerView"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionAtIndex:", a4));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_groupedHeaderViewWithTitle:", v12));

  }
  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionAtIndex:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "footerView"));

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionAtIndex:", a4));

  objc_msgSend(v6, "headerHeight");
  v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionAtIndex:", a4));

  objc_msgSend(v6, "footerHeight");
  v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)scrollToBottomAnimated
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableParts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sections", 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reverseObjectEnumerator"));

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v17, "rowsCount"))
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
                v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(v18, "indexOfSection:", v17)));

                v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController tableView](self, "tableView"));
                objc_msgSend(v20, "scrollToRowAtIndexPath:atScrollPosition:animated:", v19, 2, 1);

                goto LABEL_18;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }
LABEL_18:

}

- (void)scrollToPartAfterPartAnimated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableParts"));
  v7 = (char *)objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableParts")),
        v10 = (char *)objc_msgSend(v9, "count") - 1,
        v9,
        v8,
        v7 == v10))
  {
LABEL_4:
    -[RAPTableViewController scrollToBottomAnimated](self, "scrollToBottomAnimated");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tableParts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tableParts"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", v7 + 1, (_BYTE *)objc_msgSend(v14, "count") - (v7 + 1)));

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      v31 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sections"));
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v33;
            while (2)
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(_QWORD *)v33 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v27, "rowsCount"))
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController dataSource](self, "dataSource"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(v28, "indexOfSection:", v27)));

                  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTableViewController tableView](self, "tableView"));
                  objc_msgSend(v30, "scrollToRowAtIndexPath:atScrollPosition:animated:", v29, 2, 1);

                  goto LABEL_23;
                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v24)
                continue;
              break;
            }
          }

          v19 = v31;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v18);
    }
LABEL_23:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end

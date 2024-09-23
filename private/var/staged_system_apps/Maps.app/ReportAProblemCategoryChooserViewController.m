@implementation ReportAProblemCategoryChooserViewController

- (ReportAProblemCategoryChooserViewController)initWithPresentationStyle:(int64_t)a3 selectedCategoryNames:(id)a4
{
  id v6;
  ReportAProblemCategoryChooserViewController *v7;
  ReportAProblemCategoryChooserViewController *v8;
  UIColor *v9;
  UIColor *selectedTextColor;
  NSMutableArray *v11;
  NSMutableArray *selectedCategoryNames;
  NSArray *v13;
  NSArray *originalCategoryList;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ReportAProblemCategoryChooserViewController;
  v7 = -[ReportAProblemCategoryChooserViewController initWithStyle:](&v24, "initWithStyle:", 0);
  v8 = v7;
  if (v7)
  {
    v7->_presentationStyle = a3;
    -[ReportAProblemCategoryChooserViewController updateBarButtonItems](v7, "updateBarButtonItems");
    v9 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.984313726, 0.23137255, 0.101960786, 1.0);
    selectedTextColor = v8->_selectedTextColor;
    v8->_selectedTextColor = v9;

    v11 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v6);
    selectedCategoryNames = v8->_selectedCategoryNames;
    v8->_selectedCategoryNames = v11;

    v13 = (NSArray *)-[NSMutableArray copy](v8->_selectedCategoryNames, "copy");
    originalCategoryList = v8->_originalCategoryList;
    v8->_originalCategoryList = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Select a Category"), CFSTR("localized string not found"), 0));
    -[ReportAProblemCategoryChooserViewController setTitle:](v8, "setTitle:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](v8, "tableView"));
    v18 = objc_opt_class(RAPCategorySearchTableViewCell);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCategorySearchTableViewCell identifier](RAPCategorySearchTableViewCell, "identifier"));
    objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", v18, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](v8, "tableView"));
    v21 = objc_opt_class(0x101478000);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MacRAPCheckmarkCell identifier](MacRAPCheckmarkCell, "identifier"));
    objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", v21, v22);

    -[ReportAProblemCategoryChooserViewController fetchLocalizedCategories](v8, "fetchLocalizedCategories");
  }

  return v8;
}

- (int)analyticTarget
{
  return 1156;
}

- (void)fetchLocalizedCategories
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100A3A65C;
  v2[3] = &unk_1011B07A0;
  objc_copyWeak(&v3, &location);
  +[RAPCategoriesDownloader fetchCategories:](RAPCategoriesDownloader, "fetchCategories:", v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updateDoneBarButtonItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->_originalCategoryList));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->_selectedCategoryNames));
  v4 = objc_msgSend(v7, "isEqualToSet:", v3) ^ 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItem"));
  objc_msgSend(v6, "setEnabled:", v4);

}

- (void)_didTapOnRightBarButtonItem
{
  -[ReportAProblemCategoryChooserViewController _captureUserAction:](self, "_captureUserAction:", 10110);
  -[ReportAProblemCategoryChooserViewController saveCategoryAndDismissIfNecessary](self, "saveCategoryAndDismissIfNecessary");
}

- (void)saveCategoryAndDismissIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchController"));
  objc_msgSend(v4, "setActive:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController chooserDelegate](self, "chooserDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController selectedCategoryNames](self, "selectedCategoryNames"));
  objc_msgSend(v5, "categoryChooserViewController:didReceiveSelectedCategories:", self, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == (id)5)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationController](self, "navigationController"));
    v9 = objc_msgSend(v10, "popViewControllerAnimated:", 1);

  }
  else if ((id)-[ReportAProblemCategoryChooserViewController presentationStyle](self, "presentationStyle") == (id)1)
  {
    -[ReportAProblemCategoryChooserViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_cancel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController chooserDelegate](self, "chooserDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "categoryChooserViewController:categoriesDidNotChange:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController chooserDelegate](self, "chooserDelegate"));
    objc_msgSend(v5, "categoryChooserViewController:categoriesDidNotChange:", self, self->_originalCategoryList);

  }
  -[ReportAProblemCategoryChooserViewController _captureUserAction:](self, "_captureUserAction:", 10111);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchController"));
  objc_msgSend(v7, "setActive:", 0);

  -[ReportAProblemCategoryChooserViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewDidLoad
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ReportAProblemCategoryChooserViewController;
  -[ReportAProblemCategoryChooserViewController viewDidLoad](&v17, "viewDidLoad");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setDataSource:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setKeyboardDismissMode:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setRowHeight:", UITableViewAutomaticDimension);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == (id)5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](self, "tableView"));
    objc_msgSend(v9, "setSeparatorStyle:", 0);
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
    objc_msgSend(v9, "setSearchResultsUpdater:", self);
    objc_msgSend(v9, "setObscuresBackgroundDuringPresentation:", 0);
    objc_msgSend(v9, "setHidesNavigationBarDuringPresentation:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController fullCategoryList](self, "fullCategoryList"));
    v11 = objc_msgSend(v10, "count");
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController searchBarDefaultPlaceholder](self, "searchBarDefaultPlaceholder"));
    }
    else
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Loading Categories..."), CFSTR("localized string not found"), 0));
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchBar"));
    objc_msgSend(v13, "setPlaceholder:", v12);

    if (!v11)
    {

      v12 = v2;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchBar"));
    objc_msgSend(v14, "setReturnKeyType:", 9);

    objc_msgSend(v9, "setAutomaticallyShowsCancelButton:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setSearchController:", v9);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setHidesSearchBarWhenScrolling:", 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ReportAProblemCategoryChooserViewController;
  -[ReportAProblemCategoryChooserViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A3ACD0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)searchBarDefaultPlaceholder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search for a category"), CFSTR("localized string not found"), 0));

  return v3;
}

- (void)updateBarButtonItems
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (-[ReportAProblemCategoryChooserViewController presentationStyle](self, "presentationStyle"))
  {
    if ((id)-[ReportAProblemCategoryChooserViewController presentationStyle](self, "presentationStyle") == (id)1)
    {
      v3 = objc_alloc((Class)UIBarButtonItem);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RAPCategory_Cancel"), CFSTR("localized string not found"), 0));
      v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, "_cancel");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v7, "setLeftBarButtonItem:", v6);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v8, "setHidesBackButton:", 1);

      v9 = objc_alloc((Class)UIBarButtonItem);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RAPCategory_Add"), CFSTR("localized string not found"), 0));
      v12 = objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 2, self, "_didTapOnRightBarButtonItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v13, "setRightBarButtonItem:", v12);

      -[ReportAProblemCategoryChooserViewController _updateDoneBarButtonItem](self, "_updateDoneBarButtonItem");
    }
  }
  else
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v15, "setBackButtonTitle:", v14);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)updateSelectedCategoryNames:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *selectedCategoryNames;
  NSArray *v7;
  NSArray *originalCategoryList;
  id v9;

  v4 = a3;
  v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

  selectedCategoryNames = self->_selectedCategoryNames;
  self->_selectedCategoryNames = v5;

  v7 = (NSArray *)-[NSMutableArray copy](self->_selectedCategoryNames, "copy");
  originalCategoryList = self->_originalCategoryList;
  self->_originalCategoryList = v7;

  -[ReportAProblemCategoryChooserViewController _updateDoneBarButtonItem](self, "_updateDoneBarButtonItem");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](self, "tableView"));
  objc_msgSend(v9, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  if (-[ReportAProblemCategoryChooserViewController showingPartialSearchResults](self, "showingPartialSearchResults", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController partialCategoryList](self, "partialCategoryList"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController fullCategoryList](self, "fullCategoryList"));
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "count");

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController categoryNameAtIndexPath:](self, "categoryNameAtIndexPath:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController selectedCategoryNames](self, "selectedCategoryNames"));
  v9 = objc_msgSend(v8, "containsObject:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController traitCollection](self, "traitCollection"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == (id)5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MacRAPCheckmarkCell identifier](MacRAPCheckmarkCell, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v12));

    objc_msgSend(v13, "setChecked:", v9);
    objc_msgSend(v13, "setDisplayText:", v7);
    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setObject:", v7);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCategorySearchTableViewCell identifier](RAPCategorySearchTableViewCell, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v14));

    objc_msgSend(v13, "setChecked:", v9);
    objc_msgSend(v13, "setDisplayText:", v7);
  }

  return v13;
}

- (BOOL)showingPartialSearchResults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationItem](self, "navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchController"));

  if (objc_msgSend(v3, "isActive"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)categoryNameAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (-[ReportAProblemCategoryChooserViewController showingPartialSearchResults](self, "showingPartialSearchResults"))
    v5 = objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController partialCategoryList](self, "partialCategoryList"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController fullCategoryList](self, "fullCategoryList"));
  v6 = (void *)v5;
  v7 = objc_msgSend(v4, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont", a3, a4));
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 55.0);
  v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 != (id)5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController categoryNameAtIndexPath:](self, "categoryNameAtIndexPath:", v7));
    -[ReportAProblemCategoryChooserViewController _categoryNameSelected:](self, "_categoryNameSelected:", v10);
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 0);
    v12 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 100);

  }
}

- (void)_categoryNameSelected:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController selectedCategoryNames](self, "selectedCategoryNames"));
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController selectedCategoryNames](self, "selectedCategoryNames"));
    objc_msgSend(v6, "removeObject:", v9);

    -[ReportAProblemCategoryChooserViewController _captureUserAction:](self, "_captureUserAction:", 10170);
  }
  else
  {
    v7 = -[NSMutableArray count](self->_selectedCategoryNames, "count");
    if ((unint64_t)v7 < GEOConfigGetUInteger(MapsConfig_RAPMaximumNumberOfSelectableCategories, off_1014B4148))
    {
      -[ReportAProblemCategoryChooserViewController _captureUserAction:](self, "_captureUserAction:", 10147);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController selectedCategoryNames](self, "selectedCategoryNames"));
      objc_msgSend(v8, "addObject:", v9);

    }
  }
  -[ReportAProblemCategoryChooserViewController _updateDoneBarButtonItem](self, "_updateDoneBarButtonItem");

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[ReportAProblemCategoryChooserViewController _updateSearchResultsWithString:](self, "_updateSearchResultsWithString:", v4);

}

- (void)_updateSearchResultsWithString:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[ReportAProblemCategoryChooserViewController showingPartialSearchResults](self, "showingPartialSearchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController fullCategoryList](self, "fullCategoryList"));
  v6 = v5;
  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF contains[cd] %@"), v10));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v7));
    -[ReportAProblemCategoryChooserViewController setPartialCategoryList:](self, "setPartialCategoryList:", v8);

  }
  else
  {
    v7 = objc_msgSend(v5, "copy");
    -[ReportAProblemCategoryChooserViewController setPartialCategoryList:](self, "setPartialCategoryList:", v7);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController tableView](self, "tableView"));
  objc_msgSend(v9, "reloadData");

}

- (void)_captureUserAction:(int)a3
{
  if (a3 != 17099)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, -[ReportAProblemCategoryChooserViewController analyticTarget](self, "analyticTarget"), 0);
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  -[ReportAProblemCategoryChooserViewController _cancel](self, "_cancel", a3);
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  -[ReportAProblemCategoryChooserViewController _didTapOnRightBarButtonItem](self, "_didTapOnRightBarButtonItem", a3);
}

- (void)macFooterViewBackButtonTapped:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ReportAProblemCategoryChooserViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[ReportAProblemCategoryChooserViewController _updateSearchResultsWithString:](self, "_updateSearchResultsWithString:", a4);
}

- (void)checkmarkTableViewCell:(id)a3 isSelected:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "object"));
  v6 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "object"));
    -[ReportAProblemCategoryChooserViewController _categoryNameSelected:](self, "_categoryNameSelected:", v8);

  }
}

- (RAPCategoryChooserDelegate)chooserDelegate
{
  return (RAPCategoryChooserDelegate *)objc_loadWeakRetained((id *)&self->_chooserDelegate);
}

- (void)setChooserDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_chooserDelegate, a3);
}

- (NSArray)originalCategoryList
{
  return self->_originalCategoryList;
}

- (void)setOriginalCategoryList:(id)a3
{
  objc_storeStrong((id *)&self->_originalCategoryList, a3);
}

- (NSArray)fullCategoryList
{
  return self->_fullCategoryList;
}

- (void)setFullCategoryList:(id)a3
{
  objc_storeStrong((id *)&self->_fullCategoryList, a3);
}

- (NSArray)partialCategoryList
{
  return self->_partialCategoryList;
}

- (void)setPartialCategoryList:(id)a3
{
  objc_storeStrong((id *)&self->_partialCategoryList, a3);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (UIColor)selectedTextColor
{
  return self->_selectedTextColor;
}

- (void)setSelectedTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTextColor, a3);
}

- (NSMutableArray)selectedCategoryNames
{
  return self->_selectedCategoryNames;
}

- (void)setSelectedCategoryNames:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCategoryNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCategoryNames, 0);
  objc_storeStrong((id *)&self->_selectedTextColor, 0);
  objc_storeStrong((id *)&self->_partialCategoryList, 0);
  objc_storeStrong((id *)&self->_fullCategoryList, 0);
  objc_storeStrong((id *)&self->_originalCategoryList, 0);
  objc_destroyWeak((id *)&self->_chooserDelegate);
}

@end

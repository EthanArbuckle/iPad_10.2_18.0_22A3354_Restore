@implementation MTAAddClockViewController

- (MTAAddClockViewController)init
{
  MTAAddClockViewController *v2;
  uint64_t v3;
  MTAAddClockViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAAddClockViewController;
  v2 = -[MTAAddClockViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0, 0);
  v4 = v2;
  if (v2 && MTUIIsPadIdiom(v2, v3))
    -[MTAAddClockViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UISearchBar *v8;
  UISearchBar *searchBar;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTAAddClockViewController;
  -[MTAAddClockViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
  objc_msgSend(v3, "_setDisplaysCellContentStringsOnTapAndHold:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v3, "setTintColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
  objc_msgSend(v3, "setSectionIndexColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setEstimatedRowHeight:", 48.0);
  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setSectionIndexBackgroundColor:", v7);

  -[MTAAddClockViewController prepopulateSuggestions](self, "prepopulateSuggestions");
  v8 = (UISearchBar *)objc_msgSend(objc_alloc((Class)UISearchBar), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  searchBar = self->_searchBar;
  self->_searchBar = v8;

  -[UISearchBar setSearchBarStyle:](self->_searchBar, "setSearchBarStyle:", 2);
  -[UISearchBar setAutoresizingMask:](self->_searchBar, "setAutoresizingMask:", 2);
  -[UISearchBar setAutocapitalizationType:](self->_searchBar, "setAutocapitalizationType:", 0);
  -[UISearchBar setKeyboardType:](self->_searchBar, "setKeyboardType:", 0);
  -[UISearchBar setAutocorrectionType:](self->_searchBar, "setAutocorrectionType:", 1);
  -[UISearchBar setKeyboardAppearance:](self->_searchBar, "setKeyboardAppearance:", 1);
  -[UISearchBar setTextContentType:](self->_searchBar, "setTextContentType:", UITextContentTypeAddressCityAndState);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_10009A4D0, 0));
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v11);

  -[UISearchBar setBackgroundColor:](self->_searchBar, "setBackgroundColor:", 0);
  -[UISearchBar setBackgroundImage:forBarPosition:barMetrics:](self->_searchBar, "setBackgroundImage:forBarPosition:barMetrics:", 0, 0, 101);
  -[UISearchBar _setBackdropStyle:](self->_searchBar, "_setBackdropStyle:", 2030);
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController navigationItem](self, "navigationItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SEARCH_FOR_CITY"), &stru_10009A4D0, 0));
  objc_msgSend(v12, "setPrompt:", v14);

  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_dismiss");
  objc_msgSend(v12, "setRightBarButtonItem:", v15);

  objc_msgSend(v12, "setTitleView:", self->_searchBar);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTAAddClockViewController;
  v6 = a3;
  -[MTAAddClockViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController traitCollection](self, "traitCollection", v11.receiver, v11.super_class));
  v8 = objc_msgSend(v7, "horizontalSizeClass");
  v9 = objc_msgSend(v6, "horizontalSizeClass");

  if (v8 != v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController delegate](self, "delegate"));
    objc_msgSend(v10, "dismissAddViewController:", self);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTAAddClockViewController;
  -[MTAAddClockViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_keyboardWillDismiss:", UIKeyboardWillHideNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_keyboardDidShow:", UIKeyboardDidShowNotification, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTAAddClockViewController;
  -[MTAAddClockViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardDidShowNotification, 0);

}

- (void)_dismiss
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController delegate](self, "delegate"));
  objc_msgSend(v3, "dismissAddViewController:", self);

}

- (void)_dismissWithoutDefferingTransitions
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004D7A4;
  v2[3] = &unk_100099320;
  v2[4] = self;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v2);
}

- (void)_showNoResultsFound:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *v5;
  UILabel *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController noResultsFoundLabel](self, "noResultsFoundLabel"));
  v6 = v5;
  v7 = !v3;
  if (!v3 || v5)
  {
    if (!v5)
      v7 = 0;
    if (v7 == 1)
    {
      -[UILabel removeFromSuperview](v5, "removeFromSuperview");
      -[MTAAddClockViewController setNoResultsFoundLabel:](self, "setNoResultsFoundLabel:", 0);
      objc_msgSend(v12, "setSeparatorStyle:", 1);
      -[MTAAddClockViewController _removeAutolayoutConstraintsForNoResultsFoundLabel](self, "_removeAutolayoutConstraintsForNoResultsFoundLabel");
    }
  }
  else
  {
    v6 = objc_opt_new(UILabel);
    -[MTAAddClockViewController setNoResultsFoundLabel:](self, "setNoResultsFoundLabel:", v6);
    -[UILabel setOpaque:](v6, "setOpaque:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](v6, "setTextAlignment:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NO_RESULTS_FOUND"), &stru_10009A4D0, 0));
    -[UILabel setText:](v6, "setText:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    -[UILabel setTextColor:](v6, "setTextColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v6, "setFont:", v11);

    -[UILabel setAdjustsFontForContentSizeCategory:](v6, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel sizeToFit](v6, "sizeToFit");
    objc_msgSend(v12, "addSubview:", v6);
    -[MTAAddClockViewController _addAutolayoutConstraintsForNoResultsFoundLabel](self, "_addAutolayoutConstraintsForNoResultsFoundLabel");
    objc_msgSend(v12, "setSeparatorStyle:", 0);
  }

}

- (void)prepopulateSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSArray *v12;
  NSArray *cities;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  char *v18;
  void *v19;
  NSArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  NSArray *v27;
  NSMutableIndexSet *v28;
  NSMutableIndexSet *populatedIndexSet;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *k;
  void *v36;
  NSArray *v37;
  NSArray *sectionIndexTitles;
  NSArray *partitionedCities;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ALCityManager sharedManager](ALCityManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allCities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v3));

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cities"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "alCity"));
        objc_msgSend(v4, "removeObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v8);
  }

  v41 = v4;
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_100099E80));
  cities = self->_cities;
  self->_cities = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sectionTitles"));
  v16 = (char *)objc_msgSend(v15, "count");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v16));
  if (v16)
  {
    v18 = v16;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(v17, "addObject:", v19);

      --v18;
    }
    while (v18);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = self->_cities;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v14, "sectionForObject:collationStringSelector:", v25, "name")));
        objc_msgSend(v26, "addObject:", v25);

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v22);
  }

  v27 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v16);
  v28 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  populatedIndexSet = self->_populatedIndexSet;
  self->_populatedIndexSet = v28;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v30 = v17;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v31)
  {
    v32 = v31;
    v33 = 0;
    v34 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortedArrayFromArray:collationStringSelector:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k), "name"));
        -[NSArray addObject:](v27, "addObject:", v36);
        if (objc_msgSend(v36, "count"))
          -[NSMutableIndexSet addIndex:](self->_populatedIndexSet, "addIndex:", (char *)k + v33);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      v33 += (uint64_t)k;
    }
    while (v32);
  }

  v37 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sectionIndexTitles"));
  sectionIndexTitles = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v37;

  partitionedCities = self->_partitionedCities;
  self->_partitionedCities = v27;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
  objc_msgSend(v40, "reloadData");

}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (self->_partitionedCities)
    return self->_sectionIndexTitles;
  else
    return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_partitionedCities, "objectAtIndex:", a4));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionTitles"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a4));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)contentSizeCategoryDidChange
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
  objc_msgSend(v6, "contentOffset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v6, "reloadData");
  objc_msgSend(v6, "setContentOffset:animated:", 0, v3, v5);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;
  void *v7;
  id v8;

  result = -[NSArray count](self->_cities, "count", a3);
  if (self->_partitionedCities)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_partitionedCities, "objectAtIndex:", a4));
    v8 = objc_msgSend(v7, "count");

    return (int64_t)v8;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  if (!self->_partitionedCities)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sectionTitles"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  void *v7;
  id v8;
  id v9;
  int64_t result;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation", a3, a4));
  v8 = objc_msgSend(v7, "sectionForSectionIndexTitleAtIndex:", a5);

  v9 = -[NSMutableIndexSet indexGreaterThanOrEqualToIndex:](self->_populatedIndexSet, "indexGreaterThanOrEqualToIndex:", v8);
  result = (int64_t)-[NSMutableIndexSet indexLessThanIndex:](self->_populatedIndexSet, "indexLessThanIndex:", v8);
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    return (int64_t)v9;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  MTAClockSearchCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *partitionedCities;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = (MTAClockSearchCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ClockSearchCellIdentifier")));
  if (!v7)
  {
    v7 = -[MTAClockSearchCell initWithStyle:reuseIdentifier:]([MTAClockSearchCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAClockSearchCell textLabel](v7, "textLabel"));
    objc_msgSend(v9, "setFont:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAClockSearchCell textLabel](v7, "textLabel"));
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  }
  if (objc_msgSend(v6, "row") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cities, "objectAtIndex:", objc_msgSend(v6, "row")));
    partitionedCities = self->_partitionedCities;
    if (partitionedCities)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](partitionedCities, "objectAtIndex:", objc_msgSend(v6, "section")));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row")));

      v11 = (void *)v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNameIncludingCountry:", 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAClockSearchCell textLabel](v7, "textLabel"));
    objc_msgSend(v16, "setText:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNameIncludingCountry:withFormat:", 1, CFSTR("%@\n%@")));
    -[MTAClockSearchCell setContentString:](v7, "setContentString:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAClockSearchCell textLabel](v7, "textLabel"));
    objc_msgSend(v19, "setTextColor:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    -[MTAClockSearchCell setBackgroundColor:](v7, "setBackgroundColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    -[MTAClockSearchCell setSelectedBackgroundColor:](v7, "setSelectedBackgroundColor:", v21);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  NSArray *partitionedCities;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  if (objc_msgSend(v14, "row") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:", self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cities, "objectAtIndex:", objc_msgSend(v14, "row")));
    partitionedCities = self->_partitionedCities;
    if (partitionedCities)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](partitionedCities, "objectAtIndex:", objc_msgSend(v14, "section")));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v14, "row")));

      v6 = (void *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController searchBar](self, "searchBar"));
    objc_msgSend(v10, "resignFirstResponder");

    v11 = objc_msgSend(objc_alloc((Class)WorldClockCity), "initWithALCity:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController delegate](self, "delegate"));
    objc_msgSend(v12, "addClockViewController:addCity:", self, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController delegate](self, "delegate"));
    objc_msgSend(v13, "dismissAddViewController:", self);

  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  NSArray *partitionedCities;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *cities;
  NSArray *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  partitionedCities = self->_partitionedCities;
  self->_partitionedCities = 0;

  if (objc_msgSend(v16, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ALCityManager sharedManager](ALCityManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "citiesMatchingName:", v16));

    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_100099EA0));
    cities = self->_cities;
    self->_cities = v8;

  }
  else
  {
    v10 = self->_cities;
    self->_cities = 0;

    -[MTAAddClockViewController prepopulateSuggestions](self, "prepopulateSuggestions");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
  objc_msgSend(v11, "reloadData");

  if (-[NSArray count](self->_cities, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController view](self, "view"));
    objc_msgSend(v13, "safeAreaInsets");
    objc_msgSend(v12, "setContentOffset:animated:", 1, 0.0, -v14);

  }
  if (objc_msgSend(v16, "length") && !-[NSArray count](self->_cities, "count"))
    v15 = objc_msgSend(v16, "isEqualToString:", CFSTR("\n")) ^ 1;
  else
    v15 = 0;
  -[MTAAddClockViewController _showNoResultsFound:](self, "_showNoResultsFound:", v15);

}

- (void)_addAutolayoutConstraintsForNoResultsFoundLabel
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController noResultsFoundLabel](self, "noResultsFoundLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController centerNoResultsFoundLabelConstraints](self, "centerNoResultsFoundLabelConstraints"));

  if (!v4)
  {
    v5 = objc_opt_new(NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerXAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    -[NSMutableArray addObject:](v5, "addObject:", v8);

    -[MTAAddClockViewController _calculateVerticalMultiplierForKeyboard](self, "_calculateVerticalMultiplierForKeyboard");
    if (v9 > 0.0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 10, 0, v12, 10));
      -[NSMutableArray addObject:](v5, "addObject:", v10);

    }
    -[MTAAddClockViewController setCenterNoResultsFoundLabelConstraints:](self, "setCenterNoResultsFoundLabelConstraints:", v5);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController centerNoResultsFoundLabelConstraints](self, "centerNoResultsFoundLabelConstraints"));
  objc_msgSend(v12, "addConstraints:", v11);

}

- (double)_calculateVerticalMultiplierForKeyboard
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  BOOL v11;
  double result;
  CGRect v13;
  CGRect v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[MTAAddClockViewController keyboardFrame](self, "keyboardFrame");
  v14.origin.x = v6;
  v14.origin.y = v7;
  v14.size.width = v8;
  v10 = v9;
  v13.origin.x = CGRectZero.origin.x;
  v13.origin.y = CGRectZero.origin.y;
  v13.size.width = CGRectZero.size.width;
  v13.size.height = CGRectZero.size.height;
  v14.size.height = v10;
  v11 = CGRectEqualToRect(v13, v14);
  result = 1.0;
  if (!v11)
    return fmax(v10 / v5, 0.5);
  return result;
}

- (void)_removeAutolayoutConstraintsForNoResultsFoundLabel
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController centerNoResultsFoundLabelConstraints](self, "centerNoResultsFoundLabelConstraints"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController tableView](self, "tableView"));
    objc_msgSend(v3, "removeConstraints:", v4);

    -[MTAAddClockViewController setCenterNoResultsFoundLabelConstraints:](self, "setCenterNoResultsFoundLabelConstraints:", 0);
  }

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController view](self, "view"));
  objc_msgSend(v13, "convertRect:fromView:", 0, v6, v8, v10, v12);
  -[MTAAddClockViewController setKeyboardFrame:](self, "setKeyboardFrame:");

  -[MTAAddClockViewController _reloadNoResultsFoundLabelForKeyboardNotification:](self, "_reloadNoResultsFoundLabelForKeyboardNotification:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController searchBar](self, "searchBar"));
  objc_msgSend(v15, "setTintColor:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "_keyboardWillResize:", UIKeyboardWillChangeFrameNotification, 0);

}

- (void)_keyboardDidShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UISearchBar appearance](UISearchBar, "appearance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tintColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController searchBar](self, "searchBar"));
  objc_msgSend(v5, "setTintColor:", v4);

}

- (void)_keyboardWillDismiss:(id)a3
{
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  id v9;

  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = a3;
  -[MTAAddClockViewController setKeyboardFrame:](self, "setKeyboardFrame:", CGRectZero.origin.x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

  -[MTAAddClockViewController _reloadNoResultsFoundLabelForKeyboardNotification:](self, "_reloadNoResultsFoundLabelForKeyboardNotification:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:name:object:", self, UIKeyboardWillChangeFrameNotification, 0);

}

- (void)_keyboardWillResize:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController view](self, "view"));
  objc_msgSend(v13, "convertRect:fromView:", 0, v6, v8, v10, v12);
  -[MTAAddClockViewController setKeyboardFrame:](self, "setKeyboardFrame:");

  -[MTAAddClockViewController _reloadNoResultsFoundLabelForKeyboardNotification:](self, "_reloadNoResultsFoundLabelForKeyboardNotification:", v14);
}

- (void)_reloadNoResultsFoundLabelForKeyboardNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController noResultsFoundLabel](self, "noResultsFoundLabel"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", UIKeyboardAnimationDurationUserInfoKey));
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", UIKeyboardAnimationCurveUserInfoKey));
    v9 = objc_msgSend(v8, "integerValue");

    +[UIView beginAnimations:context:](UIView, "beginAnimations:context:", 0, 0);
    +[UIView setAnimationDuration:](UIView, "setAnimationDuration:", v7);
    +[UIView setAnimationCurve:](UIView, "setAnimationCurve:", v9);
    +[UIView setAnimationBeginsFromCurrentState:](UIView, "setAnimationBeginsFromCurrentState:", 1);
    -[MTAAddClockViewController _removeAutolayoutConstraintsForNoResultsFoundLabel](self, "_removeAutolayoutConstraintsForNoResultsFoundLabel");
    -[MTAAddClockViewController _addAutolayoutConstraintsForNoResultsFoundLabel](self, "_addAutolayoutConstraintsForNoResultsFoundLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddClockViewController view](self, "view"));
    objc_msgSend(v10, "layoutIfNeeded");

    +[UIView commitAnimations](UIView, "commitAnimations");
  }

}

+ (void)addCityFromUserActivity:(id)a3 parentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
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
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TimeZone")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Latitude")));
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Longitude")));
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    v15 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v11, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "closestCityToLocation:matchingTimeZone:", v15, v8));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cities"));

    if (!v18)
      objc_msgSend(v16, "loadCities");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cities"));
    v20 = objc_msgSend(v19, "indexOfObject:", v17);

    if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ADD_WORLD_CLOCK_FORMAT"), &stru_10009A4D0, 0));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v24, 0, 1));
      v35 = v5;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = v15;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10009A4D0, 0));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 1, 0));
      objc_msgSend(v25, "addAction:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ADD_CLOCK"), &stru_10009A4D0, 0));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10004F030;
      v39[3] = &unk_100099EC8;
      v31 = v5;
      v40 = v31;
      v41 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v30, 0, v39));
      objc_msgSend(v25, "addAction:", v32);

      v15 = v34;
      v33 = v31;
      v5 = v35;
      objc_msgSend(v33, "presentViewController:animated:completion:", v25, 1, 0);

    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004F064;
      block[3] = &unk_100099EF0;
      v37 = v5;
      v38 = v20;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v24 = v37;
    }

  }
}

- (MTAUpdateClockViewControllerDelegate)delegate
{
  return (MTAUpdateClockViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (NSArray)centerNoResultsFoundLabelConstraints
{
  return self->_centerNoResultsFoundLabelConstraints;
}

- (void)setCenterNoResultsFoundLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_centerNoResultsFoundLabelConstraints, a3);
}

- (UILabel)noResultsFoundLabel
{
  return self->_noResultsFoundLabel;
}

- (void)setNoResultsFoundLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noResultsFoundLabel, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_noResultsFoundLabel, 0);
  objc_storeStrong((id *)&self->_centerNoResultsFoundLabelConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_populatedIndexSet, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_partitionedCities, 0);
  objc_storeStrong((id *)&self->_cities, 0);
}

@end

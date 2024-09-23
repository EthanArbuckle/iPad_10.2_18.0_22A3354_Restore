@implementation THNotesSidebarViewController

- (void)dealloc
{
  objc_super v3;

  -[THNotesSidebarViewController p_cleanup](self, "p_cleanup");
  -[THNotesSidebarViewController setSidebarDelegate:](self, "setSidebarDelegate:", 0);
  -[THNotesSidebarViewController setNotesTableViewController:](self, "setNotesTableViewController:", 0);
  -[THNotesSidebarViewController setSectionProviders:](self, "setSectionProviders:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THNotesSidebarViewController;
  -[THNotesSidebarViewController dealloc](&v3, "dealloc");
}

- (void)p_cleanup
{
  -[THNotesSidebarViewController setTableView:](self, "setTableView:", 0);
  -[THNotesSidebarViewController setSearchBar:](self, "setSearchBar:", 0);
}

- (void)viewDidLoad
{
  NSMutableDictionary *v3;
  NSMutableDictionary *mCellMap;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNotesSidebarViewController;
  -[THNotesSidebarViewController viewDidLoad](&v7, "viewDidLoad");
  -[THNotesSidebarViewController p_setupChildViewControllers](self, "p_setupChildViewControllers");
  if (!self->mCellMap)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mCellMap = self->mCellMap;
    self->mCellMap = v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THNotesSidebarViewController;
  -[THNotesSidebarViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THNotesSidebarViewController;
  -[THNotesSidebarViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
  objc_msgSend(v5, "setBarStyle:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController view](self, "view"));
  v7 = objc_msgSend(v6, "im_isStyleDark");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
    objc_msgSend(v8, "setBarStyle:", 1);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "keyboardDidShow:", UIKeyboardDidShowNotification, 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "p_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25.receiver = self;
  v25.super_class = (Class)THNotesSidebarViewController;
  -[THNotesSidebarViewController viewDidAppear:](&v25, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v5, "accessibilityFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  objc_msgSend(v15, "accessibilityFrame");
  v28.origin.x = v16;
  v28.origin.y = v17;
  v28.size.width = v18;
  v28.size.height = v19;
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  v27 = CGRectIntersection(v26, v28);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v24, "setAccessibilityFrame:", x, y, width, height);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THNotesSidebarViewController;
  -[THNotesSidebarViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
  objc_msgSend(v4, "resignFirstResponder");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)setSectionProviders:(id)a3
{
  id v4;
  id obj;

  obj = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController sectionProviders](self, "sectionProviders"));

  if (v4 != obj)
    objc_storeWeak((id *)&self->mSectionProviders, obj);
  -[THNotesSidebarViewController updateVisibleIndexes](self, "updateVisibleIndexes");

}

- (void)setProviderIndex:(unint64_t)a3
{
  self->mProviderIndex = a3;
  -[THNotesSidebarViewController updateVisibleIndexes](self, "updateVisibleIndexes");
}

- (void)updateVisibleIndexes
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = objc_alloc_init((Class)NSMutableIndexSet);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController sectionProviders](self, "sectionProviders", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9);
        if ((char *)v9 + v7 == (char *)-[THNotesSidebarViewController providerIndex](self, "providerIndex"))
          goto LABEL_7;
        if (objc_msgSend(v10, "wantsVisibility"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchText](self, "searchText"));
          if (!objc_msgSend(v11, "length"))
          {

LABEL_7:
            objc_msgSend(v3, "addIndex:", (char *)v9 + v7);
            goto LABEL_11;
          }
          v12 = objc_msgSend(v10, "annotationCount");

          if (v12)
            goto LABEL_7;
        }
LABEL_11:
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v6 = v13;
      v7 += (uint64_t)v9;
    }
    while (v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchText](self, "searchText"));
  if (objc_msgSend(v14, "length"))
  {
    v15 = -[THNotesSidebarViewController p_numberOfNotes](self, "p_numberOfNotes");

    if (!v15)
      objc_msgSend(v3, "removeAllIndexes");
  }
  else
  {

  }
  objc_storeStrong((id *)&self->mVisibleSectionProviderIndicies, v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v16, "reloadData");
  if (-[NSMutableIndexSet containsIndex:](self->mVisibleSectionProviderIndicies, "containsIndex:", -[THNotesSidebarViewController providerIndex](self, "providerIndex")))
  {
    v17 = -[NSMutableIndexSet countOfIndexesInRange:](self->mVisibleSectionProviderIndicies, "countOfIndexesInRange:", 0, -[THNotesSidebarViewController providerIndex](self, "providerIndex"));
    if (v17 < objc_msgSend(v16, "numberOfSections"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v17));
      objc_msgSend(v16, "selectRowAtIndexPath:animated:scrollPosition:", v18, 0, 1);

    }
  }

}

- (void)cancelSearch
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
  objc_msgSend(v3, "resignFirstResponder");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
  objc_msgSend(v4, "setText:", &stru_43D7D8);

}

- (void)p_contentSizeCategoryDidChange:(id)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  -[THNotesSidebarViewController setCellHeightValid:](self, "setCellHeightValid:", 0);
  -[THNotesSidebarViewController p_cellHeight](self, "p_cellHeight");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setRowHeight:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController view](self, "view"));
  objc_msgSend(v7, "setNeedsLayout");

}

- (id)p_cellForIndexPath:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mCellMap, "objectForKey:", a3);
}

- (id)p_indexPathForCell:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->mCellMap, "allKeysForObject:", a3));
  if (objc_msgSend(v3, "count"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  else
    v4 = 0;

  return v4;
}

- (void)p_setSeparatorsHidden:(BOOL)a3 forCellAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
    v6 = objc_msgSend(v7, "separatorStyle");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForRowPreceedingIndexPath:", v18));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_cellForIndexPath:](self, "p_cellForIndexPath:", v9));
    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"));
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 257, CFSTR("invalid nil value for '%s'"), "previousCell");

    }
    objc_msgSend(v10, "setSeparatorStyle:", v6);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_cellForIndexPath:](self, "p_cellForIndexPath:", v18));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"));
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 262, CFSTR("invalid nil value for '%s'"), "thisCell");

  }
  objc_msgSend(v14, "setSeparatorStyle:", v6);

}

- (id)p_findConstraint:(id)a3 onView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraints", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if ((v16 & 1) != 0)
          break;
        if (v11 == (id)++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v17 = v14;

      if (v17)
        goto LABEL_14;
    }
    else
    {
LABEL_10:

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
    v17 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_findConstraint:onView:](self, "p_findConstraint:onView:", v6, v18));

  }
  else
  {
    v17 = 0;
  }
LABEL_14:

  return v17;
}

- (void)p_setConstraint:(id)a3 onView:(id)a4 toValue:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_findConstraint:onView:](self, "p_findConstraint:onView:"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController p_setConstraint:onView:toValue:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"));
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 294, CFSTR("Constraint not found: %@"), v11);

  }
  objc_msgSend(v7, "setConstant:", a5);

}

- (void)p_setupChildViewControllers
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableIndexSet *v21;
  NSMutableIndexSet *mVisibleSectionProviderIndicies;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController notesTableViewController](self, "notesTableViewController"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)UITableViewController);
    -[THNotesSidebarViewController setNotesTableViewController:](self, "setNotesTableViewController:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController notesTableViewController](self, "notesTableViewController"));
    objc_msgSend(v5, "setClearsSelectionOnViewWillAppear:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController notesTableViewController](self, "notesTableViewController"));
    -[THNotesSidebarViewController addChildViewController:](self, "addChildViewController:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setDataSource:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  +[UIViewController removeViewControllerForView:](UIViewController, "removeViewControllerForView:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController notesTableViewController](self, "notesTableViewController"));
  objc_msgSend(v11, "setTableView:", v10);

  -[THNotesSidebarViewController p_cellHeight](self, "p_cellHeight");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController notesTableViewController](self, "notesTableViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tableView"));
  objc_msgSend(v15, "setRowHeight:", v13);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
  objc_msgSend(v16, "setAutocorrectionType:", 1);

  v17 = THBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Search"), &stru_43D7D8, 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
  objc_msgSend(v20, "setPlaceholder:", v19);

  v21 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  mVisibleSectionProviderIndicies = self->mVisibleSectionProviderIndicies;
  self->mVisibleSectionProviderIndicies = v21;

  v25 = 1.0 / TSUScreenScale(v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBarSeparator](self, "searchBarSeparator"));
  -[THNotesSidebarViewController p_setConstraint:onView:toValue:](self, "p_setConstraint:onView:toValue:", CFSTR("SearchBarSeparatorHeight"), v26, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBarSeparator](self, "searchBarSeparator"));
  -[THNotesSidebarViewController p_setConstraint:onView:toValue:](self, "p_setConstraint:onView:toValue:", CFSTR("SearchBarSeparatorVerticalSpace"), v27, -v25);

  v32 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v32, "setBackgroundColor:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
  objc_msgSend(v29, "setTableFooterView:", v32);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBarSeparator](self, "searchBarSeparator"));
  objc_msgSend(v31, "setBackgroundColor:", v30);

}

- (double)p_cellHeight
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;

  if (!-[THNotesSidebarViewController cellHeightValid](self, "cellHeightValid"))
  {
    v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_cellFontTextStyle](self, "p_cellFontTextStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v4));
    objc_msgSend(v3, "setFont:", v5);

    objc_msgSend(v3, "setText:", CFSTR("One line"));
    objc_msgSend(v3, "setNumberOfLines:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    objc_msgSend(v3, "sizeThatFits:", v7, v8);
    v10 = v9;

    objc_msgSend(v3, "setText:", CFSTR("Two\nlines"));
    objc_msgSend(v3, "setNumberOfLines:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController view](self, "view"));
    objc_msgSend(v11, "bounds");
    objc_msgSend(v3, "sizeThatFits:", v12, v13);
    v15 = v14;

    -[THNotesSidebarViewController setCellHeight:](self, "setCellHeight:", v10 + 3.0 + 3.0 + v15 + 3.0);
  }
  -[THNotesSidebarViewController cellHeight](self, "cellHeight");
  return result;
}

- (id)p_cellFontTextStyle
{
  return UIFontTextStyleSubheadline;
}

- (unint64_t)p_numberOfNotes
{
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController sectionProviders](self, "sectionProviders", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "annotationCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)p_visibleSectionProviderIndexForIndexPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[NSMutableIndexSet firstIndex](self->mVisibleSectionProviderIndicies, "firstIndex");
  if ((uint64_t)objc_msgSend(v4, "section") >= 1)
  {
    v6 = 0;
    do
    {
      v5 = -[NSMutableIndexSet indexGreaterThanIndex:](self->mVisibleSectionProviderIndicies, "indexGreaterThanIndex:", v5);
      ++v6;
    }
    while ((uint64_t)objc_msgSend(v4, "section") > v6);
  }

  return (unint64_t)v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result;

  result = (int64_t)-[NSMutableIndexSet count](self->mVisibleSectionProviderIndicies, "count", a3);
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)emptyCellForTable:(id)a3
{
  THNotesSidebarTableCell *v3;
  void *v4;
  void *v5;

  v3 = (THNotesSidebarTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("emptyCell")));
  if (!v3)
  {
    v3 = -[THNotesSidebarTableCell initWithStyle:reuseIdentifier:]([THNotesSidebarTableCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("emptyCell"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell textLabel](v3, "textLabel"));
    objc_msgSend(v4, "setText:", &stru_43D7D8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[THNotesSidebarTableCell setBackgroundColor:](v3, "setBackgroundColor:", v5);

  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  THNotesSidebarTableCell *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  float v40;
  double v41;
  double v42;
  void *v43;

  v6 = a3;
  v7 = a4;
  if (!-[THNotesSidebarViewController p_numberOfNotes](self, "p_numberOfNotes"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchText](self, "searchText"));
    v24 = objc_msgSend(v23, "length");

    if (v24)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedRow"));
      if (v21)
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v21, 0);
      if (objc_msgSend(v7, "section"))
      {
        v9 = (THNotesSidebarTableCell *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController emptyCellForTable:](self, "emptyCellForTable:", v6));
        goto LABEL_14;
      }
      v9 = (THNotesSidebarTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("noResultCell")));
      if (v9)
        goto LABEL_14;
      v9 = -[THNotesSidebarTableCell initWithStyle:reuseIdentifier:]([THNotesSidebarTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("noResultCell"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[THNotesSidebarTableCell setBackgroundColor:](v9, "setBackgroundColor:", v26);

      v22 = objc_alloc_init((Class)UILabel);
      v27 = THBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("No Results"), &stru_43D7D8, 0));
      objc_msgSend(v22, "setText:", v29);

      objc_msgSend(v22, "setTextAlignment:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_cellFontTextStyle](self, "p_cellFontTextStyle"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", v30));
      objc_msgSend(v22, "setFont:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
      objc_msgSend(v22, "setTextColor:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
      objc_msgSend(v22, "setBackgroundColor:", v33);

      objc_msgSend(v22, "sizeToFit");
      objc_msgSend(v22, "frame");
      v35 = v34;
      v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
      objc_msgSend(v38, "frame");
      v40 = (v39 - v35) * 0.5;
      v41 = ceilf(v40);

      -[THNotesSidebarViewController p_cellHeight](self, "p_cellHeight");
      *(float *)&v42 = (v42 - v37) * 0.5;
      objc_msgSend(v22, "setFrame:", v41, ceilf(*(float *)&v42), v35, v37);
      -[THNotesSidebarTableCell setNoResultsLabel:](v9, "setNoResultsLabel:", v22);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell contentView](v9, "contentView"));
      objc_msgSend(v43, "addSubview:", v22);

      -[THNotesSidebarTableCell setImageBorderVisible:](v9, "setImageBorderVisible:", 0);
      -[THNotesSidebarTableCell setTopBorderVisible:](v9, "setTopBorderVisible:", 0);
      -[THNotesSidebarTableCell setBottomBorderVisible:](v9, "setBottomBorderVisible:", 1);
LABEL_6:

LABEL_14:
      goto LABEL_15;
    }
  }
  v8 = objc_msgSend(v7, "section");
  if (v8 < -[NSMutableIndexSet count](self->mVisibleSectionProviderIndicies, "count"))
  {
    v9 = (THNotesSidebarTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("notesViewCell")));
    if (!v9)
    {
      v10 = THBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (objc_class *)objc_opt_class(THNotesSidebarTableCell);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadNibNamed:owner:options:", v14, self, 0));

      v9 = (THNotesSidebarTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));
      v16 = objc_alloc((Class)UIView);
      -[THNotesSidebarTableCell frame](v9, "frame");
      v17 = objc_msgSend(v16, "initWithFrame:");
      -[THNotesSidebarTableCell setSelectedBackgroundView:](v9, "setSelectedBackgroundView:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell selectedBackgroundView](v9, "selectedBackgroundView"));
      objc_msgSend(v19, "setBackgroundColor:", v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
      -[THNotesSidebarTableCell setBackgroundColor:](v9, "setBackgroundColor:", v20);

      -[THNotesSidebarTableCell setClipsToBounds:](v9, "setClipsToBounds:", 1);
      -[THNotesSidebarTableCell setImageBorderVisible:](v9, "setImageBorderVisible:", 1);
      -[THNotesSidebarTableCell setTopBorderVisible:](v9, "setTopBorderVisible:", 0);
      -[THNotesSidebarTableCell setBottomBorderVisible:](v9, "setBottomBorderVisible:", 0);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController sectionProviders](self, "sectionProviders"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", -[THNotesSidebarViewController p_visibleSectionProviderIndexForIndexPath:](self, "p_visibleSectionProviderIndexForIndexPath:", v7)));
    -[THNotesSidebarTableCell setSectionProvider:](v9, "setSectionProvider:", v22);
    goto LABEL_6;
  }
  v9 = (THNotesSidebarTableCell *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController emptyCellForTable:](self, "emptyCellForTable:", v6));
LABEL_15:
  -[THNotesSidebarTableCell setDelegate:](v9, "setDelegate:", self);

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reuseIdentifier"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("notesViewCell"));

  if (v11)
  {
    -[NSMutableDictionary setObject:forKey:](self->mCellMap, "setObject:forKey:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController highlightedIndexPath](self, "highlightedIndexPath"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController highlightedIndexPath](self, "highlightedIndexPath"));
      v14 = objc_msgSend(v9, "compare:", v13) == 0;

    }
    else
    {
      v14 = 0;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController selectedIndexPath](self, "selectedIndexPath"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController selectedIndexPath](self, "selectedIndexPath"));
      v17 = objc_msgSend(v9, "compare:", v16) == 0;

    }
    else
    {
      v17 = 0;
    }

    if (v14 || v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "indexPathForRowPreceedingIndexPath:", v9));
      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_cellForIndexPath:](self, "p_cellForIndexPath:", v18));
        if (!v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesSidebarViewController tableView:willDisplayCell:forRowAtIndexPath:]"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesSidebarViewController.m"));
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 513, CFSTR("invalid nil value for '%s'"), "previousCell");

        }
        objc_msgSend(v19, "setSeparatorStyle:", 0);

      }
      objc_msgSend(v8, "setSeparatorStyle:", 0);

    }
    else
    {
      objc_msgSend(v8, "setSeparatorStyle:", objc_msgSend(v25, "separatorStyle"));
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController sidebarDelegate](self, "sidebarDelegate"));
    v24 = objc_msgSend(v23, "isCollapsedForSidebarContentViewController:", self);

    objc_msgSend(v8, "setAccessoryType:", v24);
  }

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[NSMutableDictionary removeObjectForKey:](self->mCellMap, "removeObjectForKey:", a5, a4);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  if (((unint64_t)objc_msgSend(v5, "section") & 0x8000000000000000) != 0
    || (v6 = objc_msgSend(v5, "section"),
        v6 >= -[NSMutableIndexSet count](self->mVisibleSectionProviderIndicies, "count")))
  {
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_msgSend(v10, "row");
  if (v5 < -[NSMutableIndexSet count](self->mVisibleSectionProviderIndicies, "count"))
  {
    -[THNotesSidebarViewController setProviderIndex:](self, "setProviderIndex:", -[THNotesSidebarViewController p_visibleSectionProviderIndexForIndexPath:](self, "p_visibleSectionProviderIndexForIndexPath:", v10));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController sectionProviders](self, "sectionProviders"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", -[THNotesSidebarViewController providerIndex](self, "providerIndex")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController sidebarDelegate](self, "sidebarDelegate"));
    objc_msgSend(v8, "sidebarContentViewController:willSelectSectionProvider:", self, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
    objc_msgSend(v9, "resignFirstResponder");

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)notesSidebarCell:(id)a3 highlightDidChange:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_indexPathForCell:](self, "p_indexPathForCell:", a3));
  v11 = (id)v6;
  if (v4)
    v7 = v6;
  else
    v7 = 0;
  -[THNotesSidebarViewController setHighlightedIndexPath:](self, "setHighlightedIndexPath:", v7);
  v8 = v11;
  if (v11)
  {
    -[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:](self, "p_setSeparatorsHidden:forCellAtIndexPath:", v4, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController selectedIndexPath](self, "selectedIndexPath"));

    v8 = v11;
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController selectedIndexPath](self, "selectedIndexPath"));
      -[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:](self, "p_setSeparatorsHidden:forCellAtIndexPath:", 1, v10);

      v8 = v11;
    }
  }

}

- (void)notesSidebarCell:(id)a3 selectionDidChange:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController p_indexPathForCell:](self, "p_indexPathForCell:", a3));
  v11 = (id)v6;
  if (v4)
  {
    if (!v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForSelectedRow"));
      -[THNotesSidebarViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v10);

      goto LABEL_8;
    }
    -[THNotesSidebarViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);
  }
  else
  {
    -[THNotesSidebarViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
    v7 = v11;
    if (!v11)
      goto LABEL_9;
  }
  -[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:](self, "p_setSeparatorsHidden:forCellAtIndexPath:", v4, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController highlightedIndexPath](self, "highlightedIndexPath"));

  v7 = v11;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController highlightedIndexPath](self, "highlightedIndexPath"));
    -[THNotesSidebarViewController p_setSeparatorsHidden:forCellAtIndexPath:](self, "p_setSeparatorsHidden:forCellAtIndexPath:", 1, v9);
LABEL_8:

    v7 = v11;
  }
LABEL_9:

}

- (NSString)searchText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController searchBar](self, "searchBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)keyboardDidShow:(id)a3
{
  id v4;

  if ((-[THNotesSidebarViewController im_isCompactHeight](self, "im_isCompactHeight", a3) & 1) == 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarViewController tableView](self, "tableView"));
    objc_msgSend(v4, "scrollToNearestSelectedRowAtScrollPosition:animated:", 0, 1);

  }
}

- (UITableView)tableView
{
  return self->mNotesTableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->mNotesTableView, a3);
}

- (THNotesSidebarDelegate)sidebarDelegate
{
  return self->mSidebarDelegate;
}

- (void)setSidebarDelegate:(id)a3
{
  self->mSidebarDelegate = (THNotesSidebarDelegate *)a3;
}

- (BOOL)shouldDismissAfterRotate
{
  return self->mShouldDismissAfterRotate;
}

- (UISearchBar)searchBar
{
  return self->mSearchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->mSearchBar, a3);
}

- (unint64_t)providerIndex
{
  return self->mProviderIndex;
}

- (NSArray)sectionProviders
{
  return (NSArray *)objc_loadWeakRetained((id *)&self->mSectionProviders);
}

- (NSIndexPath)selectedIndexPath
{
  return self->mSelectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->mSelectedIndexPath, a3);
}

- (NSIndexPath)highlightedIndexPath
{
  return self->mHighlightedIndexPath;
}

- (void)setHighlightedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->mHighlightedIndexPath, a3);
}

- (UIView)searchBarSeparator
{
  return self->_searchBarSeparator;
}

- (void)setSearchBarSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarSeparator, a3);
}

- (NSLayoutConstraint)searchbarHeightConstraint
{
  return self->_searchbarHeightConstraint;
}

- (void)setSearchbarHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_searchbarHeightConstraint, a3);
}

- (UITableViewController)notesTableViewController
{
  return self->_notesTableViewController;
}

- (void)setNotesTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_notesTableViewController, a3);
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (BOOL)cellHeightValid
{
  return self->_cellHeightValid;
}

- (void)setCellHeightValid:(BOOL)a3
{
  self->_cellHeightValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notesTableViewController, 0);
  objc_storeStrong((id *)&self->_searchbarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_searchBarSeparator, 0);
  objc_destroyWeak((id *)&self->mSectionProviders);
  objc_storeStrong((id *)&self->mSearchBar, 0);
  objc_storeStrong((id *)&self->mNotesTableView, 0);
  objc_storeStrong((id *)&self->mCellMap, 0);
  objc_storeStrong((id *)&self->mHighlightedIndexPath, 0);
  objc_storeStrong((id *)&self->mSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->mVisibleSectionProviderIndicies, 0);
}

@end

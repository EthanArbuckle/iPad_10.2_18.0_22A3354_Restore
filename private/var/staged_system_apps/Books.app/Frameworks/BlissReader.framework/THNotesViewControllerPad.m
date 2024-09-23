@implementation THNotesViewControllerPad

- (THNotesViewControllerPad)initWithNibName:(id)a3 bundle:(id)a4
{
  THNotesViewControllerPad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THNotesViewControllerPad;
  v4 = -[THNotesViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", a3, a4);
  if (v4)
    -[THNotesViewControllerPad registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[THNotesViewControllerPad cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  objc_super v3;

  self->_masterNavigationController = 0;
  self->_detailNavigationController = 0;

  self->_detailParentViewController = 0;
  self->_actionButtonItem = 0;

  self->_deleteButtonItem = 0;
  self->_selectAllButtonItem = 0;

  self->_studyButtonItem = 0;
  self->_selectButtonItem = 0;
  -[UISplitViewController setDelegate:](self->_notesSplitViewController, "setDelegate:", 0);

  self->_notesSplitViewController = 0;
  self->_noSearchResultsViewController = 0;

  self->_pendingBookSearchText = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController cleanup](&v3, "cleanup");
}

- (void)viewDidLoad
{
  UISplitViewController *v3;
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[2];
  THNotesDetailTableViewController *v8;

  v6.receiver = self;
  v6.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController viewDidLoad](&v6, "viewDidLoad");
  v8 = -[THNotesViewController notesDetailViewController](self, "notesDetailViewController");
  -[UINavigationController setViewControllers:](-[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController"), "setViewControllers:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v3 = -[THNotesViewControllerPad notesSplitViewController](self, "notesSplitViewController");
  v4 = -[UISplitViewController view](v3, "view");
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  -[THNotesViewControllerPad addChildViewController:](self, "addChildViewController:", v3);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "insertSubview:atIndex:", v4, 0);
  v7[0] = -[THNotesViewControllerPad masterNavigationController](self, "masterNavigationController");
  v7[1] = -[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController");
  -[UISplitViewController setViewControllers:](v3, "setViewControllers:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  -[THNotesDetailTableViewController setDelegate:](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "setDelegate:", self);
  if (!self->_noSearchResultsViewController)
  {
    self->_noSearchResultsViewController = objc_alloc_init(THNotesNoSearchResultsViewController);
    -[THNotesDetailTableViewController addChildViewController:](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "addChildViewController:", -[THNotesViewControllerPad noSearchResultsViewController](self, "noSearchResultsViewController"));
    v5 = -[THNotesNoSearchResultsViewController view](self->_noSearchResultsViewController, "view");
    objc_msgSend(-[THNotesDetailTableViewController view](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "view"), "addSubview:", v5);
    objc_msgSend(v5, "setHidden:", 1);
  }
  -[THNotesSidebarViewController setTitle:](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Chapters"), &stru_43D7D8, 0));
  -[THNotesViewControllerPad p_layoutViewsForOrientation:duration:](self, "p_layoutViewsForOrientation:duration:", -[THNotesViewControllerPad p_interfaceOrientation](self, "p_interfaceOrientation"), 0.0);
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Height;
  double v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewControllerPad viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  objc_msgSend(-[THNotesDetailTableViewController view](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "view"), "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((-[THNotesViewControllerPad im_isCompactWidth](self, "im_isCompactWidth") & 1) != 0
    || -[THNotesViewControllerPad im_isCompactHeight](self, "im_isCompactHeight"))
  {
    -[UIToolbar bounds](-[UINavigationController toolbar](-[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController"), "toolbar"), "bounds");
    Height = CGRectGetHeight(v14);
    objc_msgSend(-[UINavigationController view](-[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController"), "view"), "safeAreaInsets");
    v10 = v10 - (Height + v12);
  }
  objc_msgSend(-[THNotesNoSearchResultsViewController view](-[THNotesViewControllerPad noSearchResultsViewController](self, "noSearchResultsViewController"), "view"), "setFrame:", v4, v6, v8, v10);
}

- (BOOL)p_isEditing
{
  return -[UITableView isEditing](-[THNotesDetailTableViewController tableView](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "tableView"), "isEditing");
}

- (BOOL)p_isCollapsed
{
  return -[UISplitViewController isCollapsed](-[THNotesViewControllerPad notesSplitViewController](self, "notesSplitViewController"), "isCollapsed");
}

- (BOOL)p_isToolbarHidden:(BOOL)a3
{
  if ((-[THNotesViewControllerPad im_isCompactWidth](self, "im_isCompactWidth", a3) & 1) != 0)
    return 0;
  else
    return -[THNotesViewControllerPad im_isCompactHeight](self, "im_isCompactHeight") ^ 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[UISplitViewController setPreferredDisplayMode:](-[THNotesViewControllerPad notesSplitViewController](self, "notesSplitViewController"), "setPreferredDisplayMode:", 0);
  v4 = -[THNotesViewControllerPad p_isCollapsed](self, "p_isCollapsed");
  objc_msgSend(-[THNotesDetailTableViewController navigationController](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "navigationController"), "setToolbarHidden:", -[THNotesViewControllerPad p_isToolbarHidden:](self, "p_isToolbarHidden:", v4));
  -[THNotesViewControllerPad p_configureToolbarsForEditing:collapsed:](self, "p_configureToolbarsForEditing:collapsed:", 0, v4);
  -[THNotesViewControllerPad p_showCorrectView:](self, "p_showCorrectView:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  __int128 v6;
  UISplitViewController *v7;
  double v8;
  double v9;
  objc_super v10;
  _OWORD v11[3];

  v3 = a3;
  if (-[THNotesViewControllerPad isViewLoaded](self, "isViewLoaded"))
  {
    v5 = -[THNotesViewControllerPad view](self, "view");
    v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v11[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v11[1] = v6;
    v11[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v5, "setTransform:", v11);
  }
  if (-[THNotesViewController shouldDismissAfterRotate](self, "shouldDismissAfterRotate"))
  {
    -[THNotesViewController setShouldDismissAfterRotate:](self, "setShouldDismissAfterRotate:", 0);
    v7 = -[THNotesViewControllerPad notesSplitViewController](self, "notesSplitViewController");
    objc_msgSend(-[UISplitViewController view](v7, "view"), "frame");
    -[UISplitViewController viewWillTransitionToSize:withTransitionCoordinator:](v7, "viewWillTransitionToSize:withTransitionCoordinator:", -[THNotesViewControllerPad transitionCoordinator](self, "transitionCoordinator"), v8, v9);
    -[THNotesViewControllerPad p_layoutViewsForOrientation:duration:](self, "p_layoutViewsForOrientation:duration:", -[THNotesViewControllerPad p_interfaceOrientation](self, "p_interfaceOrientation"), 0.0);
  }
  -[THNotesSidebarViewController cancelSearch](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "cancelSearch");
  v10.receiver = self;
  v10.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewControllerPad viewDidDisappear:](&v10, "viewDidDisappear:", v3);
}

- (int64_t)p_interfaceOrientation
{
  return (int64_t)objc_msgSend(objc_msgSend(-[THNotesViewControllerPad bc_windowForViewController](self, "bc_windowForViewController"), "windowScene"), "interfaceOrientation");
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  _BOOL8 v5;

  v5 = -[THNotesViewControllerPad p_isCollapsed](self, "p_isCollapsed", a3, a4);
  objc_msgSend(-[THNotesDetailTableViewController navigationController](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "navigationController"), "setToolbarHidden:", -[THNotesViewControllerPad p_isToolbarHidden:](self, "p_isToolbarHidden:", v5));
  -[THNotesViewControllerPad p_configureToolbarsForEditing:collapsed:](self, "p_configureToolbarsForEditing:collapsed:", -[THNotesViewControllerPad isEditing](self, "isEditing"), v5);
}

- (void)sectionProvidersDidChange
{
  if (-[THNotesViewControllerPad p_isEditing](self, "p_isEditing"))
  {
    -[THNotesDetailTableViewController deselectAllNotes](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "deselectAllNotes");
    -[THNotesViewControllerPad p_setSelectAllButtonText](self, "p_setSelectAllButtonText");
    -[THNotesViewControllerPad p_updateEditButtons](self, "p_updateEditButtons");
  }
  -[THNotesViewControllerPad p_updateChapterHeader](self, "p_updateChapterHeader");
  -[UIBarButtonItem setEnabled:](self->_studyButtonItem, "setEnabled:", -[THNotesViewControllerPad p_studyButtonShouldBeEnabled](self, "p_studyButtonShouldBeEnabled"));
  -[THNotesViewControllerPad p_showCorrectView:](self, "p_showCorrectView:", 0);
}

- (void)p_showNoResultsView:(BOOL)a3 firstLaunch:(BOOL)a4 allowPush:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v7;
  unint64_t v8;
  id v9;
  UITableView *v10;
  _BOOL8 v11;
  UINavigationController *v12;
  UINavigationController *v13;

  v5 = a5;
  if (a3)
  {
    v7 = a4;
    -[UIView setHidden:](-[THNotesNoSearchResultsViewController firstLaunchView](self->_noSearchResultsViewController, "firstLaunchView"), "setHidden:", !a4);
    -[UIView setHidden:](-[THNotesNoSearchResultsViewController noResultsView](self->_noSearchResultsViewController, "noResultsView"), "setHidden:", v7);
    v8 = -[THNotesSidebarViewController providerIndex](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "providerIndex");
    if (!v7)
    {
      -[THNotesNoSearchResultsViewController setMessageType:](self->_noSearchResultsViewController, "setMessageType:", objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length") == 0);
      -[THNotesNoSearchResultsViewController setChapterIndex:](self->_noSearchResultsViewController, "setChapterIndex:", v8);
      -[THNotesNoSearchResultsViewController setResults:](self->_noSearchResultsViewController, "setResults:", -[THNotesViewController numberOfNotes](self, "numberOfNotes"));
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = -[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v8);
    v11 = !objc_msgSend(v9, "hasGlossaryTerms")
       || !-[THNotesViewControllerPad p_studyButtonShouldBeEnabled](self, "p_studyButtonShouldBeEnabled");
    -[THNotesNoSearchResultsViewController setFooterType:](self->_noSearchResultsViewController, "setFooterType:", v11);
    -[UITableView setHidden:](-[THNotesDetailTableViewController tableView](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "tableView"), "setHidden:", 1);
    v10 = (UITableView *)-[THNotesNoSearchResultsViewController view](self->_noSearchResultsViewController, "view");
  }
  else
  {
    if (-[THNotesNoSearchResultsViewController isViewLoaded](self->_noSearchResultsViewController, "isViewLoaded", a3, a4))objc_msgSend(-[THNotesNoSearchResultsViewController view](self->_noSearchResultsViewController, "view"), "setHidden:", 1);
    v10 = -[THNotesDetailTableViewController tableView](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "tableView");
  }
  -[UITableView setHidden:](v10, "setHidden:", 0);
  if (v5 && -[THNotesViewControllerPad p_isCollapsed](self, "p_isCollapsed"))
  {
    v12 = -[THNotesViewControllerPad masterNavigationController](self, "masterNavigationController");
    v13 = -[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController");
    if (-[UINavigationController topViewController](v12, "topViewController") != (UIViewController *)v13)
      -[UINavigationController pushViewController:animated:](v12, "pushViewController:animated:", v13, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  }
}

- (void)p_configureToolbarsForEditing:(BOOL)a3 collapsed:(BOOL)a4
{
  _BOOL4 v4;
  id *p_studyButtonItem;
  id *p_selectButtonItem;
  THNotesDetailTableViewController *v8;
  id v9;
  uint64_t v10;
  id v11;
  UIBarButtonItem *v12;
  THNotesDetailTableViewController *v13;
  THNotesSidebarViewController *v14;
  unsigned int v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  UIBarButtonItem **p_deleteButtonItem;
  UIBarButtonItem **p_selectAllButtonItem;
  id v27;
  void *v28;
  UIBarButtonItem **v29;
  UIBarButtonItem **v30;
  id v31;
  id v32;
  id v33;
  _BOOL8 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  THNotesSidebarViewController *v37;

  v35 = a4;
  v4 = a3;

  self->_actionButtonItem = 0;
  self->_deleteButtonItem = 0;

  self->_selectAllButtonItem = 0;
  p_studyButtonItem = (id *)&self->_studyButtonItem;

  self->_studyButtonItem = 0;
  p_selectButtonItem = (id *)&self->_selectButtonItem;

  self->_selectButtonItem = 0;
  v37 = -[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController");
  v8 = -[THNotesViewController notesDetailViewController](self, "notesDetailViewController");
  v9 = objc_alloc((Class)UIBarButtonItem);
  v36 = v4;
  if (v4)
  {
    self->_actionButtonItem = (UIBarButtonItem *)objc_msgSend(v9, "initWithBarButtonSystemItem:target:action:", 9, self, "handleAction:");
    self->_deleteButtonItem = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 16, self, "handleDelete:");
    v10 = -[THNotesDetailTableViewController areAllNotesSelected](v8, "areAllNotesSelected");
    v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", -[THNotesViewControllerPad p_textForSelectAllButton:](self, "p_textForSelectAllButton:", 0), -[THNotesViewControllerPad p_textForSelectAllButton:](self, "p_textForSelectAllButton:", 1), 0);
    v12 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", -[THNotesViewControllerPad p_textForSelectAllButton:](self, "p_textForSelectAllButton:", v10), 0, self, "handleSelectAll:");
    self->_selectAllButtonItem = v12;
    -[UIBarButtonItem setPossibleTitles:](v12, "setPossibleTitles:", v11);
    -[UIBarButtonItem setTag:](self->_selectAllButtonItem, "setTag:", v10);

    -[THNotesViewControllerPad p_updateEditButtons](self, "p_updateEditButtons");
  }
  else
  {
    *p_studyButtonItem = objc_msgSend(v9, "initWithTitle:style:target:action:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Study Cards"), &stru_43D7D8, 0), 0, self, "handleStudy:");
    *p_selectButtonItem = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Select"), &stru_43D7D8, 0), 0, self, "handleEdit:");
  }
  v13 = v8;
  v14 = v37;
  v15 = objc_msgSend(-[THNotesDetailTableViewController navigationController](v13, "navigationController"), "isToolbarHidden");
  v16 = -[THNotesSidebarViewController navigationItem](v37, "navigationItem");
  if (v16)
  {
    v17 = v16;
    if (v35)
    {
      v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "handleDone:");
      objc_msgSend(v17, "setRightBarButtonItem:", v18);

    }
    else
    {
      objc_msgSend(v16, "setRightBarButtonItem:", 0);
    }
  }
  v19 = -[THNotesDetailTableViewController navigationItem](v13, "navigationItem");
  if (v19)
  {
    v20 = v19;
    objc_msgSend(v19, "setLeftItemsSupplementBackButton:", 1);
    v21 = objc_alloc_init((Class)NSMutableArray);
    v22 = objc_alloc_init((Class)NSMutableArray);
    v23 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "handleDone:");
    objc_msgSend(v22, "addObject:", v23);

    if (v36)
    {
      if (v15)
      {
        objc_msgSend(v21, "addObject:", self->_actionButtonItem);
        v24 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
        objc_msgSend(v24, "setWidth:", 20.0);
        objc_msgSend(v21, "addObject:", v24);

        p_selectAllButtonItem = &self->_selectAllButtonItem;
        p_deleteButtonItem = &self->_deleteButtonItem;
LABEL_13:
        objc_msgSend(v21, "addObject:", *p_deleteButtonItem);
        objc_msgSend(v22, "addObject:", *p_selectAllButtonItem);
      }
    }
    else
    {
      p_deleteButtonItem = &self->_studyButtonItem;
      p_selectAllButtonItem = &self->_selectButtonItem;
      if (v15)
        goto LABEL_13;
    }
    objc_msgSend(v20, "setLeftBarButtonItems:", v21);
    objc_msgSend(v20, "setRightBarButtonItems:", v22);

    v14 = v37;
  }
  v27 = objc_alloc_init((Class)NSMutableArray);
  v28 = v27;
  if ((v15 & 1) == 0)
  {
    v29 = &self->_studyButtonItem;
    v30 = &self->_selectButtonItem;
    if (v36)
    {
      objc_msgSend(v27, "addObject:", self->_actionButtonItem);
      v31 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      objc_msgSend(v31, "setWidth:", 20.0);
      objc_msgSend(v28, "addObject:", v31);

      v30 = &self->_selectAllButtonItem;
      v29 = &self->_deleteButtonItem;
    }
    objc_msgSend(v28, "addObject:", *v29);
    v32 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(v28, "addObject:", v32);

    objc_msgSend(v28, "addObject:", *v30);
  }
  -[THNotesDetailTableViewController setToolbarItems:](v13, "setToolbarItems:", v28);

  if (*p_studyButtonItem)
    objc_msgSend(*p_studyButtonItem, "setEnabled:", -[THNotesViewControllerPad p_studyButtonShouldBeEnabled](self, "p_studyButtonShouldBeEnabled"));
  if (*p_selectButtonItem)
  {
    v33 = -[THNotesSidebarViewController providerIndex](v14, "providerIndex");
    v34 = v33 != (id)0x7FFFFFFFFFFFFFFFLL
       && objc_msgSend(-[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v33), "annotationCount") != 0;
    objc_msgSend(*p_selectButtonItem, "setEnabled:", v34);
  }
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setTintColor:", +[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
}

- (void)p_layoutViewsForOrientation:(int64_t)a3 duration:(double)a4
{
  -[UISplitViewController setPreferredDisplayMode:](-[THNotesViewControllerPad notesSplitViewController](self, "notesSplitViewController", a3, a4), "setPreferredDisplayMode:", 0);
  -[THNotesViewControllerPad p_updateEditButtons](self, "p_updateEditButtons");
}

- (id)p_noteCountLabelTextForChapter:(id)a3
{
  if (objc_msgSend(a3, "needsMigration"))
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "…");
  else
    return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%lu"), objc_msgSend(a3, "annotationCount"));
}

- (void)p_updateChapterHeader
{
  unint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;
  char *v9;
  void *v10;
  const __CFString *v11;
  NSString *v12;

  v3 = -[THNotesSidebarViewController providerIndex](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "providerIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length"))
    {
      v4 = -[THNotesViewController numberOfNotes](self, "numberOfNotes");
      if (v4 == 1)
      {
        v10 = (void *)THBundle();
        v11 = CFSTR("All Chapters: 1 Result");
        goto LABEL_13;
      }
      v5 = (id)v4;
      if (v4)
      {
        v6 = (void *)THBundle();
        v7 = CFSTR("All Chapters: %lu Results");
LABEL_16:
        v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_43D7D8, 0), v5);
        goto LABEL_14;
      }
      goto LABEL_9;
    }
LABEL_10:
    v10 = (void *)THBundle();
    v11 = CFSTR("My Notes");
    goto LABEL_13;
  }
  v8 = -[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v3);
  if (!objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length"))
    goto LABEL_10;
  v9 = (char *)objc_msgSend(v8, "annotationCount");
  if (v9 == (_BYTE *)&dword_0 + 1)
  {
    v10 = (void *)THBundle();
    v11 = CFSTR("1 Result");
    goto LABEL_13;
  }
  v5 = v9;
  if (v9)
  {
    v6 = (void *)THBundle();
    v7 = CFSTR("%lu Results");
    goto LABEL_16;
  }
LABEL_9:
  v10 = (void *)THBundle();
  v11 = CFSTR("No Results Found");
LABEL_13:
  v12 = (NSString *)objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_43D7D8, 0);
LABEL_14:
  -[THNotesDetailTableViewController setTitle:](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "setTitle:", v12);
}

- (void)endEditingDidDelete:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[THNotesDetailTableViewController setEditing:animated:](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "setEditing:animated:", 0, 1);
  -[THNotesViewControllerPad p_configureToolbarsForEditing:collapsed:](self, "p_configureToolbarsForEditing:collapsed:", 0, -[THNotesViewControllerPad p_isCollapsed](self, "p_isCollapsed"));
  if (v3)
    -[THNotesViewController noteWasDeleted](self, "noteWasDeleted");
}

- (BOOL)p_studyButtonShouldBeEnabled
{
  unint64_t v3;
  id v5;
  unsigned __int8 v6;

  if (objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length"))
    return 0;
  v3 = -[THNotesSidebarViewController providerIndex](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "providerIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = -[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v3);
  if (objc_msgSend(v5, "annotationCountForStudyCards"))
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "hasGlossaryTerms");
  return objc_msgSend(v5, "shouldEnableStudyButton") & v6;
}

- (void)p_showCorrectView:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  unint64_t v6;
  _BOOL8 v7;
  THNotesViewControllerPad *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v5 = -[THNotesSidebarViewController providerIndex](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "providerIndex");
  v6 = -[THNotesViewController numberOfNotes](self, "numberOfNotes");
  v7 = v5 != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(-[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v5), "annotationCount") != 0;
  -[UIBarButtonItem setEnabled:](self->_selectButtonItem, "setEnabled:", v7);
  if (-[THNotesViewController notesExist](self, "notesExist"))
  {
    if (v7 || !v6)
    {
      v8 = self;
      v9 = 0;
    }
    else
    {
      v8 = self;
      v9 = 1;
    }
    v10 = 0;
  }
  else
  {
    v8 = self;
    v9 = 1;
    v10 = 1;
  }
  -[THNotesViewControllerPad p_showNoResultsView:firstLaunch:allowPush:](v8, "p_showNoResultsView:firstLaunch:allowPush:", v9, v10, v3);
}

- (void)p_returnToOriginalViewController
{
  -[THBookViewController hideFullscreenNotesView:andSearchForText:completion:](-[THNotesViewController bookViewController](self, "bookViewController"), "hideFullscreenNotesView:andSearchForText:completion:", -[THNotesViewController originalViewController](self, "originalViewController"), self->_pendingBookSearchText, 0);
  -[THNotesViewController setOriginalViewController:](self, "setOriginalViewController:", 0);

  self->_pendingBookSearchText = 0;
}

- (void)showWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  _QWORD v8[5];

  if (a3)
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setAlpha:", 0.0);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setHidden:", 0);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E3944;
  v8[3] = &unk_427830;
  v8[4] = a5;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v8);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setAlpha:", 1.0);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)hideWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  _QWORD v8[6];

  if (a3)
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E3A10;
  v8[3] = &unk_426E78;
  v8[4] = self;
  v8[5] = a5;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v8);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setAlpha:", 0.0);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)showForExitStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  _QWORD v8[5];

  if (a3)
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setAlpha:", 0.0);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setHidden:", 0);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E3B2C;
  v8[3] = &unk_427830;
  v8[4] = a5;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v8);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setAlpha:", 1.0);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)hideForEnterStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  _QWORD v8[6];

  if (a3)
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E3BF8;
  v8[3] = &unk_426E78;
  v8[4] = self;
  v8[5] = a5;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v8);
  objc_msgSend(-[THNotesViewControllerPad view](self, "view"), "setAlpha:", 0.0);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)finishedDismissing
{
  -[THNotesDetailTableViewController reloadWithSections:](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "reloadWithSections:", 0);
}

- (id)sidebarContentViewController:(id)a3 viewControllerForSectionProvider:(id)a4
{
  if (!-[THNotesViewControllerPad isCollapsedForSidebarContentViewController:](self, "isCollapsedForSidebarContentViewController:", a3, a4))return 0;
  -[THNotesViewController updateSectionProviders](self, "updateSectionProviders");
  -[THNotesViewControllerPad p_showCorrectView:](self, "p_showCorrectView:", 0);
  -[UINavigationController setToolbarHidden:animated:](-[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController"), "setToolbarHidden:animated:", 1, 0);
  -[UINavigationController setNavigationBarHidden:animated:](-[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController"), "setNavigationBarHidden:animated:", 1, 0);
  return -[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController");
}

- (void)sidebarContentViewController:(id)a3 willSelectSectionProvider:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController sidebarContentViewController:willSelectSectionProvider:](&v5, "sidebarContentViewController:willSelectSectionProvider:", a3, a4);
  if (-[THNotesViewControllerPad p_isEditing](self, "p_isEditing"))
    -[THNotesViewControllerPad endEditingDidDelete:](self, "endEditingDidDelete:", 0);
  -[THNotesViewController updateSectionProviders](self, "updateSectionProviders");
  if (-[THNotesViewControllerPad p_isCollapsed](self, "p_isCollapsed"))
    -[THNotesViewControllerPad p_showCorrectView:](self, "p_showCorrectView:", 1);
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  objc_msgSend(-[THNotesDetailTableViewController navigationController](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController", a3, a4, a5), "navigationController"), "setToolbarHidden:", 0);
  -[THNotesViewControllerPad p_configureToolbarsForEditing:collapsed:](self, "p_configureToolbarsForEditing:collapsed:", -[THNotesViewControllerPad p_isEditing](self, "p_isEditing"), 1);
  -[THNotesSidebarViewController updateVisibleIndexes](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "updateVisibleIndexes");
  return 0;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  objc_msgSend(-[THNotesDetailTableViewController navigationController](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController", a3, a4), "navigationController"), "setToolbarHidden:", -[THNotesViewControllerPad p_isToolbarHidden:](self, "p_isToolbarHidden:", 0));
  -[THNotesViewControllerPad p_configureToolbarsForEditing:collapsed:](self, "p_configureToolbarsForEditing:collapsed:", -[THNotesViewControllerPad p_isEditing](self, "p_isEditing"), 0);
  -[THNotesSidebarViewController updateVisibleIndexes](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "updateVisibleIndexes");
  return 0;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E3E5C;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)handleStudy:(id)a3
{
  unint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  THNavigationUnit *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = -[THNotesSidebarViewController providerIndex](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController", a3), "providerIndex");
  if (v4 >= -[NSArray count](-[THNotesViewController sectionProviders](self, "sectionProviders"), "count"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewControllerPad handleStudy:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewControllerPad.m"), 859, CFSTR("Study button should be disabled until a chapter is selected"));
  }
  else
  {
    v5 = -[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v4);
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = objc_msgSend(v5, "navigationUnits");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "contentNodes"));
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v12 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot"), "context");
    if (objc_msgSend(v7, "count") == (char *)&dword_0 + 1)
    {
      v13 = (THNavigationUnit *)objc_msgSend(v7, "lastObject");
      v14 = 0;
    }
    else
    {
      v14 = objc_msgSend(v5, "title");
      v13 = -[THNavigationUnit initWithContext:contentNodes:]([THNavigationUnit alloc], "initWithContext:contentNodes:", v12, v6);
    }
    -[THBookViewController showStudyCardsForNavigationUnit:useChapterTitle:](-[THNotesViewController bookViewController](self, "bookViewController"), "showStudyCardsForNavigationUnit:useChapterTitle:", v13, v14);

  }
}

- (void)handleEdit:(id)a3
{
  -[THNotesDetailTableViewController setEditing:animated:](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController", a3), "setEditing:animated:", 1, 1);
  -[THNotesDetailTableViewController startEditing](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "startEditing");
  -[THNotesViewControllerPad p_configureToolbarsForEditing:collapsed:](self, "p_configureToolbarsForEditing:collapsed:", 1, -[THNotesViewControllerPad p_isCollapsed](self, "p_isCollapsed"));
  -[UIBarButtonItem setEnabled:](self->_actionButtonItem, "setEnabled:", 0);
  -[UIBarButtonItem setEnabled:](self->_deleteButtonItem, "setEnabled:", 0);
}

- (void)handleDone:(id)a3
{
  if (-[THNotesViewControllerPad p_isEditing](self, "p_isEditing", a3))
  {
    -[THNotesViewController dismissActivityController:](self, "dismissActivityController:", 1);
    -[THNotesDetailTableViewController deselectAllNotes](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "deselectAllNotes");
    -[THNotesViewControllerPad endEditingDidDelete:](self, "endEditingDidDelete:", 0);
    -[THNotesViewControllerPad p_showCorrectView:](self, "p_showCorrectView:", 1);
  }
  else
  {
    -[THNotesViewControllerPad p_returnToOriginalViewController](self, "p_returnToOriginalViewController");
  }
}

- (id)p_textForSelectAllButton:(int64_t)a3
{
  void *v4;
  const __CFString *v5;

  v4 = (void *)THBundle();
  if (a3)
    v5 = CFSTR("Deselect All");
  else
    v5 = CFSTR("Select All");
  return objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_43D7D8, 0);
}

- (void)p_setSelectAllButtonText
{
  -[UIBarButtonItem setTag:](self->_selectAllButtonItem, "setTag:", 0);
  -[UIBarButtonItem setTitle:](self->_selectAllButtonItem, "setTitle:", -[THNotesViewControllerPad p_textForSelectAllButton:](self, "p_textForSelectAllButton:", 0));
}

- (void)p_setDeselectAllButtonText
{
  -[UIBarButtonItem setTag:](self->_selectAllButtonItem, "setTag:", 1);
  -[UIBarButtonItem setTitle:](self->_selectAllButtonItem, "setTitle:", -[THNotesViewControllerPad p_textForSelectAllButton:](self, "p_textForSelectAllButton:", 1));
}

- (void)handleSelectAll:(id)a3
{
  id v4;
  THNotesDetailTableViewController *v5;

  -[THNotesViewController dismissActivityController:](self, "dismissActivityController:", 1);
  v4 = -[UIBarButtonItem tag](self->_selectAllButtonItem, "tag");
  v5 = -[THNotesViewController notesDetailViewController](self, "notesDetailViewController");
  if (v4)
  {
    -[THNotesDetailTableViewController deselectAllNotes](v5, "deselectAllNotes");
LABEL_4:
    -[THNotesViewControllerPad p_setDeselectAllButtonText](self, "p_setDeselectAllButtonText");
    goto LABEL_5;
  }
  if (-[THNotesDetailTableViewController selectAllNotes](v5, "selectAllNotes"))
    goto LABEL_4;
LABEL_5:
  -[THNotesViewControllerPad p_updateEditButtons](self, "p_updateEditButtons");
}

- (void)p_updateEditButtons
{
  if (-[NSMutableDictionary count](-[THNotesDetailTableViewController selectedNotes](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "selectedNotes"), "count"))
  {
    -[UIBarButtonItem setEnabled:](self->_deleteButtonItem, "setEnabled:", -[THAnnotationStorageController canModifyAnnotations](-[THNotesViewController annotationController](self, "annotationController"), "canModifyAnnotations"));
    -[UIBarButtonItem setEnabled:](self->_actionButtonItem, "setEnabled:", 1);
  }
  else
  {
    -[UIBarButtonItem setEnabled:](self->_deleteButtonItem, "setEnabled:", 0);
    -[UIBarButtonItem setEnabled:](self->_actionButtonItem, "setEnabled:", 0);
    -[THNotesViewControllerPad p_setSelectAllButtonText](self, "p_setSelectAllButtonText");
  }
}

- (BOOL)p_detailsViewIsCompactWidth
{
  unsigned int v3;

  v3 = -[THBookViewController im_isCompactWidth](-[THNotesViewController bookViewController](self, "bookViewController"), "im_isCompactWidth");
  if (v3 != -[THBookViewController im_isCompactHeight](-[THNotesViewController bookViewController](self, "bookViewController"), "im_isCompactHeight"))LOBYTE(v3) = (char *)-[UISplitViewController displayMode](-[THNotesViewControllerPad notesSplitViewController](self, "notesSplitViewController"), "displayMode") != (char *)&dword_0 + 1;
  return v3;
}

- (void)tableViewControllerDidChangeSelection:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController tableViewControllerDidChangeSelection:](&v5, "tableViewControllerDidChangeSelection:");
  if (objc_msgSend(a3, "areAllNotesSelected"))
    -[THNotesViewControllerPad p_setDeselectAllButtonText](self, "p_setDeselectAllButtonText");
  else
    -[THNotesViewControllerPad p_setSelectAllButtonText](self, "p_setSelectAllButtonText");
  -[THNotesViewControllerPad p_updateEditButtons](self, "p_updateEditButtons");
}

- (void)tableViewControllerDidDeleteNote:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController tableViewControllerDidDeleteNote:](&v4, "tableViewControllerDidDeleteNote:", a3);
  -[THNotesViewController noteWasDeleted](self, "noteWasDeleted");
}

- (void)tableViewController:(id)a3 navigateToNote:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = -[THDocumentViewController documentRoot](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController", a3), "documentViewController"), "documentRoot");
  v7 = objc_msgSend(v6, "modelStorageAnchorForAnnotation:", a4);
  if (objc_msgSend(a4, "annotationAbsolutePhysicalPageIndex") != (id)0x7FFFFFFFFFFFFFFFLL
    && !objc_msgSend(v6, "reflowablePaginationController"))
  {
    objc_msgSend(v7, "setAbsolutePageIndex:", objc_msgSend(a4, "annotationAbsolutePhysicalPageIndex"));
  }
  +[CATransaction begin](CATransaction, "begin");
  -[THBookViewController recordOutgoingMajorNavigationJump](-[THNotesViewController bookViewController](self, "bookViewController"), "recordOutgoingMajorNavigationJump");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E4590;
  v8[3] = &unk_426DD0;
  v8[4] = self;
  -[THBookViewController navigateFromNotesViewToAnchorInDVC:completion:](-[THNotesViewController bookViewController](self, "bookViewController"), "navigateFromNotesViewToAnchorInDVC:completion:", v7, v8);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)tableViewController:(id)a3 searchBookForText:(id)a4
{
  if (self->_pendingBookSearchText)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewControllerPad tableViewController:searchBookForText:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewControllerPad.m"), 1052, CFSTR("expected nil value for '%s'"), "_pendingBookSearchText");
  self->_pendingBookSearchText = (NSString *)objc_msgSend(a4, "copy", a3);
  -[THNotesViewControllerPad handleDone:](self, "handleDone:", 0);
}

- (void)tableViewController:(id)a3 didLoadContentNode:(id)a4
{
  unint64_t v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController tableViewController:didLoadContentNode:](&v7, "tableViewController:didLoadContentNode:", a3, a4);
  v5 = -[THNotesSidebarViewController providerIndex](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "providerIndex");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(-[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v5), "needsMigration"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E4730;
      block[3] = &unk_426DD0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)tableViewController:(id)a3 renderingInProgress:(BOOL)a4
{
  -[UIBarButtonItem setEnabled:](self->_selectAllButtonItem, "setEnabled:", !a4);
}

- (double)marginAboveNote
{
  return 18.0;
}

- (double)rightMargin
{
  return 58.0;
}

- (double)marginAboveSeparator
{
  return 18.0;
}

- (double)highlightColorBarDescent
{
  return 5.0;
}

- (double)sectionTitleHeight
{
  return 44.0;
}

- (double)chapterTitleHeightForAllChapters
{
  return 34.0;
}

- (double)sectionTitleHeightForAllChapters
{
  return 44.0;
}

- (double)highlightEditingWidthAdjustment
{
  return 38.0;
}

- (double)highlightLeftInset
{
  return 61.0;
}

- (double)highlightRightInset
{
  return 58.0;
}

- (double)firstNoteBelowSectionAdjustment
{
  return -8.0;
}

- (double)cellMargin
{
  unsigned int v2;
  double result;

  v2 = -[THNotesViewControllerPad p_detailsViewIsCompactWidth](self, "p_detailsViewIsCompactWidth");
  result = 20.0;
  if (v2)
    return 10.0;
  return result;
}

- (double)activityIndicatorCellHeight
{
  return 40.0;
}

- (unint64_t)maxLines
{
  return 20;
}

- (unint64_t)maxNoteLabelLines
{
  return 0;
}

- (double)noteLabelHorizontalInset
{
  unsigned int v2;
  double result;

  v2 = -[THNotesViewControllerPad p_detailsViewIsCompactWidth](self, "p_detailsViewIsCompactWidth");
  result = 61.0;
  if (v2)
    return 46.0;
  return result;
}

- (double)colorBarHorizontalInset
{
  unsigned int v2;
  double result;

  v2 = -[THNotesViewControllerPad p_detailsViewIsCompactWidth](self, "p_detailsViewIsCompactWidth");
  result = 47.0;
  if (v2)
    return 32.0;
  return result;
}

- (double)dateLabelHorizontalInset
{
  unsigned int v2;
  double result;

  v2 = -[THNotesViewControllerPad p_detailsViewIsCompactWidth](self, "p_detailsViewIsCompactWidth");
  result = 34.0;
  if (v2)
    return 19.0;
  return result;
}

- (UINavigationController)masterNavigationController
{
  return self->_masterNavigationController;
}

- (void)setMasterNavigationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (UINavigationController)detailNavigationController
{
  return self->_detailNavigationController;
}

- (void)setDetailNavigationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (UISplitViewController)notesSplitViewController
{
  return self->_notesSplitViewController;
}

- (void)setNotesSplitViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (UIViewController)detailParentViewController
{
  return self->_detailParentViewController;
}

- (void)setDetailParentViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (THNotesNoSearchResultsViewController)noSearchResultsViewController
{
  return self->_noSearchResultsViewController;
}

- (void)setNoSearchResultsViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSString)pendingBookSearchText
{
  return self->_pendingBookSearchText;
}

- (void)setPendingBookSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (UIBarButtonItem)studyButtonItem
{
  return self->_studyButtonItem;
}

- (void)setStudyButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (UIBarButtonItem)selectButtonItem
{
  return self->_selectButtonItem;
}

- (void)setSelectButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (UIBarButtonItem)selectAllButtonItem
{
  return self->_selectAllButtonItem;
}

- (void)setSelectAllButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (UIBarButtonItem)deleteButtonItem
{
  return self->_deleteButtonItem;
}

- (void)setDeleteButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (UIBarButtonItem)actionButtonItem
{
  return self->_actionButtonItem;
}

- (void)setActionButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

@end

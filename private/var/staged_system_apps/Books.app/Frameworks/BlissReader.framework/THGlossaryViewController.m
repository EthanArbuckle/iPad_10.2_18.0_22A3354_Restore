@implementation THGlossaryViewController

+ (id)newViewController
{
  return -[THGlossaryViewController initWithNibName:bundle:]([THGlossaryViewController alloc], "initWithNibName:bundle:", 0, 0);
}

- (THGlossaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THGlossaryViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THGlossaryViewController;
  result = -[THGlossaryViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
  if (result)
    result->_targetOrientation = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)p_setupChildViewControllers
{
  THGlossaryTermsViewController *v3;
  THGlossaryDefinitionsViewController *v4;
  UINavigationController *detailNavigationController;
  _QWORD v6[2];

  v3 = +[THGlossaryTermsViewController newViewController](THGlossaryTermsViewController, "newViewController");
  self->_termsViewController = v3;
  -[THGlossaryTermsViewController setEdgesForExtendedLayout:](v3, "setEdgesForExtendedLayout:", 15);
  -[THGlossaryTermsViewController setNavigationDelegate:](self->_termsViewController, "setNavigationDelegate:", self);
  -[THGlossaryTermsViewController setGlossaryController:](self->_termsViewController, "setGlossaryController:", self->_glossaryController);
  -[THGlossaryTermsViewController setTitle:](self->_termsViewController, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Index"), &stru_43D7D8, 0));
  self->_masterNavigationController = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_termsViewController);
  v4 = -[THGlossaryDefinitionsViewController initWithNibName:bundle:]([THGlossaryDefinitionsViewController alloc], "initWithNibName:bundle:", 0, 0);
  self->_definitionsViewController = v4;
  -[THGlossaryDefinitionsViewController setEdgesForExtendedLayout:](v4, "setEdgesForExtendedLayout:", 14);
  -[THGlossaryDefinitionsViewController setDelegate:](self->_definitionsViewController, "setDelegate:", self);
  -[THGlossaryDefinitionsViewController setGlossaryViewController:](self->_definitionsViewController, "setGlossaryViewController:", self);
  -[THGlossaryDefinitionsViewController setGlossaryController:](self->_definitionsViewController, "setGlossaryController:", self->_glossaryController);
  -[THGlossaryDefinitionsViewController setTitle:](self->_definitionsViewController, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Glossary"), &stru_43D7D8, 0));
  self->_detailNavigationController = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_definitionsViewController);
  self->_glossarySplitViewController = (UISplitViewController *)objc_alloc_init((Class)UISplitViewController);
  detailNavigationController = self->_detailNavigationController;
  v6[0] = self->_masterNavigationController;
  v6[1] = detailNavigationController;
  -[UISplitViewController setViewControllers:](self->_glossarySplitViewController, "setViewControllers:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  -[UISplitViewController setMinimumPrimaryColumnWidth:](self->_glossarySplitViewController, "setMinimumPrimaryColumnWidth:", 320.0);
  -[UISplitViewController setDelegate:](self->_glossarySplitViewController, "setDelegate:", self);
}

- (void)releaseChildViewControllers
{
  -[THGlossaryViewController setMasterNavigationController:](self, "setMasterNavigationController:", 0);
  -[THGlossaryViewController setDetailNavigationController:](self, "setDetailNavigationController:", 0);
  -[THGlossaryTermsViewController setNavigationDelegate:](-[THGlossaryViewController termsViewController](self, "termsViewController"), "setNavigationDelegate:", 0);
  -[THGlossaryViewController setTermsViewController:](self, "setTermsViewController:", 0);
  -[THGlossaryDefinitionsViewController setDelegate:](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "setDelegate:", 0);
  -[THGlossaryDefinitionsViewController setGlossaryViewController:](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "setGlossaryViewController:", 0);
  -[THGlossaryViewController setDefinitionsViewController:](self, "setDefinitionsViewController:", 0);
  -[UISplitViewController setDelegate:](-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"), "setDelegate:", 0);
  -[THGlossaryViewController setGlossarySplitViewController:](self, "setGlossarySplitViewController:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[THGlossaryViewController setLastDisplayedEntry:](self, "setLastDisplayedEntry:", 0);
  -[THGlossaryViewController setGlossaryController:](self, "setGlossaryController:", 0);
  -[THGlossaryViewController setGlossaryLinkResolver:](self, "setGlossaryLinkResolver:", 0);
  -[THGlossaryViewController releaseChildViewControllers](self, "releaseChildViewControllers");
  -[UIView removeFromSuperview](self->_rotationSnapshot, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryViewController;
  -[THGlossaryViewController dealloc](&v3, "dealloc");
}

- (void)handleDone:(id)a3
{
  -[THBookViewController hideGlossaryWithDestinationViewController:](self->_bookViewController, "hideGlossaryWithDestinationViewController:", -[THGlossaryViewController originalViewController](self, "originalViewController", a3));
}

- (int64_t)p_interfaceOrientation
{
  return (int64_t)objc_msgSend(objc_msgSend(-[THGlossaryViewController bc_windowForViewController](self, "bc_windowForViewController"), "windowScene"), "interfaceOrientation");
}

- (void)furtherInitWithGlossaryController:(id)a3
{
  -[THGlossaryViewController setGlossaryController:](self, "setGlossaryController:");
  -[THGlossaryViewController setGlossaryLinkResolver:](self, "setGlossaryLinkResolver:", +[THGlossaryLinkResolver glossaryLinkResolverWithGlossaryController:](THGlossaryLinkResolver, "glossaryLinkResolverWithGlossaryController:", a3));
}

- (id)documentRoot
{
  return -[THDocumentViewController documentRoot](-[THBookViewController documentViewController](-[THGlossaryViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot");
}

- (BOOL)p_isCompact
{
  if (-[THGlossaryViewController parentViewController](self, "parentViewController"))
  {
    if ((-[THGlossaryViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0)
      return -[THGlossaryViewController im_isCompactHeight](self, "im_isCompactHeight");
    return 1;
  }
  if ((-[THBookViewController im_isCompactHeight](-[THGlossaryViewController bookViewController](self, "bookViewController"), "im_isCompactHeight") & 1) != 0)return 1;
  return -[THBookViewController im_isCompactWidth](-[THGlossaryViewController bookViewController](self, "bookViewController"), "im_isCompactWidth");
}

- (BOOL)p_isCollapsed
{
  return -[UISplitViewController isCollapsed](-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"), "isCollapsed");
}

- (void)p_configureToolbarsForCollapsed:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  UIBarButtonItem *v12;
  id v13;

  v3 = a3;
  v5 = -[IMTheme backgroundColorForTraitEnvironment:](-[THGlossaryViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self);
  if (!v5)
    v5 = +[UIColor bc_booksBackground](UIColor, "bc_booksBackground");
  objc_msgSend(-[UISplitViewController view](-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"), "view"), "setBackgroundColor:", v5);
  v6 = -[THGlossaryTermsViewController navigationItem](-[THGlossaryViewController termsViewController](self, "termsViewController"), "navigationItem");
  if (v6)
  {
    v7 = v6;
    if (v3)
    {
      v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "handleDone:");
      objc_msgSend(v7, "setRightBarButtonItem:", v8);

    }
    else
    {
      objc_msgSend(v6, "setRightBarButtonItem:", 0);
    }
  }
  v9 = -[THGlossaryDefinitionsViewController navigationItem](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "navigationItem");
  if (v9)
  {
    v10 = v9;
    v11 = -[IMTheme contentTextColor](-[THGlossaryViewController theme](self, "theme"), "contentTextColor");
    if (!v11)
      v11 = +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor");
    objc_msgSend(v10, "setLeftItemsSupplementBackButton:", 1);
    v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "handleDone:");
    v12 = -[UISplitViewController displayModeButtonItem](-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"), "displayModeButtonItem");
    -[UIBarButtonItem setTintColor:](v12, "setTintColor:", v11);
    objc_msgSend(v10, "setLeftBarButtonItem:", v12);
    objc_msgSend(v10, "setRightBarButtonItem:", v13);

  }
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryViewController;
  -[THGlossaryViewController loadView](&v3, "loadView");
  -[THGlossaryViewController p_setupChildViewControllers](self, "p_setupChildViewControllers");
  -[THGlossaryViewController addChildViewController:](self, "addChildViewController:", -[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"));
  objc_msgSend(-[THGlossaryViewController view](self, "view"), "addSubview:", -[UISplitViewController view](-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"), "view"));
  -[UISplitViewController didMoveToParentViewController:](-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"), "didMoveToParentViewController:", self);
  -[THGlossaryViewController _applyColors](self, "_applyColors");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryViewController;
  -[THGlossaryViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[THGlossaryViewController pendingShowFirstEntry](self, "pendingShowFirstEntry"))
  {
    -[THGlossaryViewController showEntryAtIndex:](self, "showEntryAtIndex:", 0);
    -[THGlossaryViewController setPendingShowFirstEntry:](self, "setPendingShowFirstEntry:", 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (self->_shouldDismissAfterRotate)
  {
    self->_shouldDismissAfterRotate = 0;
    -[UIView removeFromSuperview](-[THGlossaryViewController rotationSnapshot](self, "rotationSnapshot"), "removeFromSuperview");
    -[THGlossaryViewController setRotationSnapshot:](self, "setRotationSnapshot:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryViewController;
  -[THGlossaryViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (int64_t)layoutOrientation
{
  if (self->_targetOrientation == 0x7FFFFFFFFFFFFFFFLL)
    return -[THGlossaryViewController p_interfaceOrientation](self, "p_interfaceOrientation");
  else
    return self->_targetOrientation;
}

- (BOOL)shouldAnimateShowEntry
{
  return !-[THGlossaryViewController p_isCollapsed](self, "p_isCollapsed");
}

- (BOOL)isGlossaryVisible
{
  unsigned int v3;

  v3 = -[THGlossaryViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[THGlossaryViewController view](self, "view"), "superview") != 0;
  return v3;
}

- (void)setTheme:(id)a3
{
  id v5;

  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    v5 = a3;

    self->_theme = (IMTheme *)a3;
    -[THGlossaryViewController _applyColors](self, "_applyColors");
  }
}

- (void)_applyColors
{
  IMTheme *v3;
  id v4;
  id v5;
  id v6;
  UINavigationController *masterNavigationController;
  UINavigationController *detailNavigationController;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  NSAttributedStringKey v19;
  id v20;
  _QWORD v21[2];
  _BYTE v22[128];

  v3 = -[THGlossaryViewController theme](self, "theme");
  v4 = -[IMTheme backgroundColorForTraitEnvironment:](v3, "backgroundColorForTraitEnvironment:", self);
  if (!v4)
    v4 = +[UIColor bc_booksBackground](UIColor, "bc_booksBackground");
  objc_msgSend(-[THGlossaryViewController view](self, "view"), "setBackgroundColor:", v4);
  v5 = -[IMTheme keyColor](v3, "keyColor");
  if (!v5)
    v5 = +[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor");
  objc_msgSend(-[THGlossaryViewController view](self, "view"), "setTintColor:", v5);
  -[THGlossaryViewController p_configureToolbarsForCollapsed:](self, "p_configureToolbarsForCollapsed:", -[THGlossaryViewController p_isCollapsed](self, "p_isCollapsed"));
  -[THGlossaryTermsViewController setTheme:](self->_termsViewController, "setTheme:", v3);
  -[THGlossaryDefinitionsViewController setTheme:](self->_definitionsViewController, "setTheme:", v3);
  v6 = -[IMTheme contentTextColor](v3, "contentTextColor");
  if (!v6)
    v6 = +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor");
  masterNavigationController = self->_masterNavigationController;
  detailNavigationController = self->_detailNavigationController;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v21[0] = masterNavigationController;
  v21[1] = detailNavigationController;
  v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2, 0);
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(objc_msgSend(v14, "navigationBar"), "setBarTintColor:", v4);
        v19 = NSForegroundColorAttributeName;
        v20 = v6;
        objc_msgSend(objc_msgSend(v14, "navigationBar"), "setTitleTextAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    }
    while (v11);
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  uint64_t v3;
  int64_t result;

  v3 = objc_opt_class(IMThemePage, a2);
  result = (int64_t)objc_msgSend((id)TSUDynamicCast(v3, -[THGlossaryViewController theme](self, "theme")), "userInterfaceStyle");
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  -[THGlossaryViewController p_configureToolbarsForCollapsed:](self, "p_configureToolbarsForCollapsed:", 1, a4, a5);
  return 0;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  -[THGlossaryViewController p_configureToolbarsForCollapsed:](self, "p_configureToolbarsForCollapsed:", 0, a4);
  return 0;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_AB888;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)displayEntry:(id)a3 whenCollapsed:(BOOL)a4
{
  _BOOL4 v6;
  THGlossaryIndex *v7;
  UINavigationController *v8;
  UINavigationController *v9;

  if (a3)
  {
    v6 = a4;
    v7 = -[THGlossaryTermsViewController glossaryIndex](-[THGlossaryViewController termsViewController](self, "termsViewController"), "glossaryIndex");
    if (-[THGlossaryIndex indexForEntry:](v7, "indexForEntry:", a3) == 0x7FFFFFFFFFFFFFFFLL)
      v7 = +[THGlossaryIndex alphabeticalIndexForEntries:](THGlossaryIndex, "alphabeticalIndexForEntries:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
    -[THGlossaryDefinitionsViewController displayIndex:withEntry:animated:](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "displayIndex:withEntry:animated:", v7, a3, -[THGlossaryViewController shouldAnimateShowEntry](self, "shouldAnimateShowEntry"));
    if (v6)
    {
      if (-[THGlossaryViewController p_isCollapsed](self, "p_isCollapsed"))
      {
        v8 = -[THGlossaryViewController masterNavigationController](self, "masterNavigationController");
        v9 = -[THGlossaryViewController detailNavigationController](self, "detailNavigationController");
        if (-[UINavigationController topViewController](v8, "topViewController") != (UIViewController *)v9)
          -[UINavigationController pushViewController:animated:](v8, "pushViewController:animated:", v9, 1);
      }
    }
  }
  -[THGlossaryViewController setLastDisplayedEntry:](self, "setLastDisplayedEntry:", a3, a4);
}

- (void)displayEntry:(id)a3
{
  -[THGlossaryViewController displayEntry:whenCollapsed:](self, "displayEntry:whenCollapsed:", a3, 1);
}

- (void)displayEntryByPath:(id)a3
{
  -[THGlossaryViewController displayEntry:whenCollapsed:](self, "displayEntry:whenCollapsed:", -[THGlossaryController entryForPath:](self->_glossaryController, "entryForPath:", a3), 1);
}

- (id)displayedEntry
{
  return -[THGlossaryDefinitionsViewController displayedEntry](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "displayedEntry");
}

- (void)didScrollToEntry:(id)a3
{
  -[THGlossaryTermsViewController selectEntry:scrollPosition:animated:](-[THGlossaryViewController termsViewController](self, "termsViewController"), "selectEntry:scrollPosition:animated:", a3, 0, 1);
  -[THGlossaryViewController setLastDisplayedEntry:](self, "setLastDisplayedEntry:", a3);
}

- (void)showEntry:(id)a3
{
  -[THGlossaryDefinitionsViewController displayIndex:withEntry:animated:](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "displayIndex:withEntry:animated:", -[THGlossaryController alphabeticalTermIndex](self->_glossaryController, "alphabeticalTermIndex"), a3, 0);
  -[THGlossaryTermsViewController clearSearch](-[THGlossaryViewController termsViewController](self, "termsViewController"), "clearSearch");
  -[THGlossaryTermsViewController selectEntry:scrollPosition:animated:](-[THGlossaryViewController termsViewController](self, "termsViewController"), "selectEntry:scrollPosition:animated:", a3, 1, 0);
  -[THGlossaryViewController setLastDisplayedEntry:](self, "setLastDisplayedEntry:", a3);
}

- (void)showEntryAtPath:(id)a3
{
  -[THGlossaryViewController showEntry:](self, "showEntry:", -[THGlossaryController entryForPath:](self->_glossaryController, "entryForPath:", a3));
}

- (void)showEntryAtIndex:(unint64_t)a3
{
  -[THGlossaryViewController showEntry:](self, "showEntry:", objc_msgSend(-[THGlossaryController alphabeticalTermIndex](self->_glossaryController, "alphabeticalTermIndex"), "entryAtIndex:", a3));
}

- (void)showFirstEntry
{
  -[THGlossaryViewController setPendingShowFirstEntry:](self, "setPendingShowFirstEntry:", 1);
}

- (void)unload
{
  -[THGlossaryDefinitionsViewController unload](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "unload");
}

- (BOOL)followGlossaryAnchor:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  if (!objc_msgSend(a3, "glossaryEntry"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryViewController followGlossaryAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryViewController.m"), 442, CFSTR("Attempt to follow nil glossary anchor."));
  v6 = objc_msgSend(a3, "glossaryEntry");
  if (v6)
  {
    v7 = objc_opt_class(THModelGlossaryEntryAnchor, v5);
    v8 = (id)TSUDynamicCast(v7, a3);
    if (!v8)
      v8 = a3;
    -[THGlossaryViewController showEntry:](self, "showEntry:", objc_msgSend(v8, "glossaryEntry"));
  }
  return v6 != 0;
}

- (id)documentNavigatorForGlossaryDefinitionsViewController:(id)a3
{
  return -[THBookViewController documentNavigator](-[THGlossaryViewController bookViewController](self, "bookViewController", a3), "documentNavigator");
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  _BOOL8 v4;
  BOOL v7;

  if (!a3)
    return 0;
  v4 = a4;
  if (objc_msgSend(a3, "glossaryEntry"))
    return -[THGlossaryViewController followGlossaryAnchor:](self, "followGlossaryAnchor:", a3);
  -[THBookViewController recordOutgoingMajorNavigationJump](-[THGlossaryViewController bookViewController](self, "bookViewController"), "recordOutgoingMajorNavigationJump");
  v7 = -[THBookViewController followAnchor:pulse:](-[THGlossaryViewController bookViewController](self, "bookViewController"), "followAnchor:pulse:", a3, v4);
  -[THBookViewController recordCurrentLocationInHistory](-[THGlossaryViewController bookViewController](self, "bookViewController"), "recordCurrentLocationInHistory");
  -[THBookViewController updateNavigationAffordances](-[THGlossaryViewController bookViewController](self, "bookViewController"), "updateNavigationAffordances");
  return v7;
}

- (BOOL)followLink:(id)a3
{
  return -[THGlossaryViewController followLink:animated:](self, "followLink:animated:", a3, 1);
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  id v7;
  _QWORD block[6];
  BOOL v10;

  v7 = -[THGlossaryLinkResolver anchorFromAbsoluteLink:](-[THGlossaryViewController glossaryLinkResolver](self, "glossaryLinkResolver"), "anchorFromAbsoluteLink:", a3);
  if (v7)
    return -[THGlossaryViewController followAnchor:pulse:](self, "followAnchor:pulse:", v7, 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_ABDBC;
  block[3] = &unk_428E10;
  block[4] = self;
  block[5] = a3;
  v10 = a4;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    sub_ABDBC((uint64_t)block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (int)glossaryEntryLayoutFloatingStyle
{
  if (-[THGlossaryViewController p_isCompact](self, "p_isCompact"))
    return 2;
  if (-[THGlossaryDefinitionsViewController im_isCompactWidth](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "im_isCompactWidth"))return 2;
  return 1;
}

- (CGRect)glossaryEntryLayoutViewFrame
{
  id v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  double width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (-[THGlossaryDefinitionsViewController isViewLoaded](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "isViewLoaded"))
  {
    v3 = -[THGlossaryDefinitionsViewController view](-[THGlossaryViewController definitionsViewController](self, "definitionsViewController"), "view");
    if (v3)
    {
      x = TSDRectWithSize(objc_msgSend(v3, "frame"));
      y = v5;
      width = v7;
      height = v9;
    }
    else
    {
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
    }
    objc_msgSend(-[THGlossaryViewController view](self, "view"), "safeAreaInsets");
    v15 = v14;
    objc_msgSend(-[THGlossaryViewController view](self, "view"), "safeAreaInsets");
    v11 = width - (v15 + v16);
  }
  else
  {
    x = TSDRectWithSize(objc_msgSend(-[THBookViewController view](-[THGlossaryViewController bookViewController](self, "bookViewController"), "view"), "frame"));
    y = v12;
    height = v13;
  }
  v17 = x;
  v18 = y;
  v19 = height;
  result.size.height = v19;
  result.size.width = v11;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGSize)glossaryEntryLayoutContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[THGlossaryViewController glossaryEntryLayoutViewFrame](self, "glossaryEntryLayoutViewFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)glossaryEntryLayoutValueForDistance:(int)a3
{
  char *v5;
  double result;
  double v7;
  _BOOL4 v8;
  double *v9;
  _QWORD v10[5];
  BOOL v11;

  v5 = (char *)-[THGlossaryViewController layoutOrientation](self, "layoutOrientation") - 3;
  if (-[THGlossaryViewController p_isCompact](self, "p_isCompact"))
  {
    result = 0.0;
    switch(a3)
    {
      case 0:
      case 1:
        result = 15.0;
        break;
      case 2:
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
        result = 8.0;
        break;
      default:
        return result;
    }
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_AC09C;
    v10[3] = &unk_428E38;
    v10[4] = self;
    v11 = (unint64_t)v5 < 2;
    switch(a3)
    {
      case 0:
        v7 = dbl_3142F0[(unint64_t)v5 < 2];
        goto LABEL_14;
      case 1:
        v8 = (unint64_t)v5 < 2;
        v9 = dbl_3142F0;
        goto LABEL_10;
      case 2:
LABEL_6:
        v8 = (unint64_t)v5 < 2;
        v9 = (double *)&unk_3142E0;
LABEL_10:
        result = v9[v8];
        break;
      case 3:
        if ((unint64_t)v5 >= 2)
          v7 = 33.0;
        else
          v7 = 0.0;
LABEL_14:
        result = v7 + sub_AC09C((uint64_t)v10);
        break;
      default:
        result = 0.0;
        break;
    }
  }
  return result;
}

- (double)glossaryEntryLayoutDefaultHeightForPortion:(int)a3
{
  return dbl_314320[5
                  * ((char *)-[THGlossaryViewController layoutOrientation](self, "layoutOrientation") - 5 < (char *)0xFFFFFFFFFFFFFFFELL)
                  + a3];
}

- (double)glossaryEntryLayoutTopMarginForPortion:(int)a3
{
  return dbl_314370[5
                  * ((char *)-[THGlossaryViewController layoutOrientation](self, "layoutOrientation") - 5 < (char *)0xFFFFFFFFFFFFFFFELL)
                  + a3];
}

- (id)glossaryEntryLayoutBackgroundColor
{
  id v3;

  v3 = -[IMTheme backgroundColorForTraitEnvironment:](-[THGlossaryViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self);
  if (!v3)
    v3 = objc_msgSend(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"), "resolvedColorWithTraitCollection:", -[THGlossaryViewController traitCollection](self, "traitCollection"));
  return +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", v3);
}

- (id)glossaryEntryLayoutForegroundColor
{
  id v3;

  v3 = -[IMTheme contentTextColor](-[THGlossaryViewController theme](self, "theme"), "contentTextColor");
  if (!v3)
    v3 = +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor");
  return +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", objc_msgSend(v3, "resolvedColorWithTraitCollection:", -[THGlossaryViewController traitCollection](self, "traitCollection")));
}

- (BOOL)glossaryEntryLayoutHasFooter
{
  return 1;
}

- (BOOL)glossaryEntryLayoutIncludePortion:(int)a3
{
  return 1;
}

- (BOOL)touchBarWantsSearch
{
  return 1;
}

- (THGlossaryController)glossaryController
{
  return self->_glossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->_glossaryController = (THGlossaryController *)a3;
}

- (THBookViewController)bookViewController
{
  return self->_bookViewController;
}

- (void)setBookViewController:(id)a3
{
  self->_bookViewController = (THBookViewController *)a3;
}

- (THGlossaryLinkResolver)glossaryLinkResolver
{
  return self->_glossaryLinkResolver;
}

- (void)setGlossaryLinkResolver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THGlossaryTermsViewController)termsViewController
{
  return self->_termsViewController;
}

- (void)setTermsViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THGlossaryDefinitionsViewController)definitionsViewController
{
  return self->_definitionsViewController;
}

- (void)setDefinitionsViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THModelGlossaryEntry)lastDisplayedEntry
{
  return self->_lastDisplayedEntry;
}

- (void)setLastDisplayedEntry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)shouldDismissAfterRotate
{
  return self->_shouldDismissAfterRotate;
}

- (UIViewController)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
  self->_originalViewController = (UIViewController *)a3;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (UINavigationController)masterNavigationController
{
  return self->_masterNavigationController;
}

- (void)setMasterNavigationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (UINavigationController)detailNavigationController
{
  return self->_detailNavigationController;
}

- (void)setDetailNavigationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (UISplitViewController)glossarySplitViewController
{
  return self->_glossarySplitViewController;
}

- (void)setGlossarySplitViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (int64_t)targetOrientation
{
  return self->_targetOrientation;
}

- (void)setTargetOrientation:(int64_t)a3
{
  self->_targetOrientation = a3;
}

- (UIView)rotationSnapshot
{
  return self->_rotationSnapshot;
}

- (void)setRotationSnapshot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (BOOL)pendingShowFirstEntry
{
  return self->_pendingShowFirstEntry;
}

- (void)setPendingShowFirstEntry:(BOOL)a3
{
  self->_pendingShowFirstEntry = a3;
}

@end

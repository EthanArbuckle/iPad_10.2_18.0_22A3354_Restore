@implementation BKThumbnailBookViewController

- (BKThumbnailBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  BKThumbnailBookViewController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewController;
  v4 = -[BKBookViewController initWithBook:storeID:](&v8, "initWithBook:storeID:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[BKThumbnailBookViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)releaseViews
{
  UIView *backgroundView;
  BCNavigationBar *topToolbar;
  NSLayoutConstraint *pageNumberHUDHeightConstraint;
  NSLayoutConstraint *pageNumberHUDTopConstraint;
  BKInfoHUD *pageNumberHUD;
  UIBarButtonItem *libraryBarButtonItem;
  UIBarButtonItem *resumeBarButtonItem;
  UIBarButtonItem *searchBarButtonItem;
  UIBarButtonItem *tocBarButtonItem;
  UIBarButtonItem *brightnessBarButtonItem;
  UIBarButtonItem *editToolboxBarButtonItem;
  UIBarButtonItem *editUndoBarButtonItem;
  UIBarButtonItem *editRedoBarButtonItem;
  UIBarButtonItem *audioBarButtonItem;
  UISegmentedControl *directorySwitch;
  UIBarButtonItem *directorySwitchBarButtonItem;
  UIButton *bookmarkButton;
  UIBarButtonItem *bookmarkBarButtonItem;
  BKThumbnailScrubber *scrubber;
  BKThumbnailScrubber *verticalScrubber;
  objc_super v23;

  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  topToolbar = self->_topToolbar;
  self->_topToolbar = 0;

  pageNumberHUDHeightConstraint = self->_pageNumberHUDHeightConstraint;
  self->_pageNumberHUDHeightConstraint = 0;

  pageNumberHUDTopConstraint = self->_pageNumberHUDTopConstraint;
  self->_pageNumberHUDTopConstraint = 0;

  pageNumberHUD = self->_pageNumberHUD;
  self->_pageNumberHUD = 0;

  libraryBarButtonItem = self->_libraryBarButtonItem;
  self->_libraryBarButtonItem = 0;

  resumeBarButtonItem = self->_resumeBarButtonItem;
  self->_resumeBarButtonItem = 0;

  searchBarButtonItem = self->_searchBarButtonItem;
  self->_searchBarButtonItem = 0;

  tocBarButtonItem = self->_tocBarButtonItem;
  self->_tocBarButtonItem = 0;

  brightnessBarButtonItem = self->_brightnessBarButtonItem;
  self->_brightnessBarButtonItem = 0;

  editToolboxBarButtonItem = self->_editToolboxBarButtonItem;
  self->_editToolboxBarButtonItem = 0;

  editUndoBarButtonItem = self->_editUndoBarButtonItem;
  self->_editUndoBarButtonItem = 0;

  editRedoBarButtonItem = self->_editRedoBarButtonItem;
  self->_editRedoBarButtonItem = 0;

  audioBarButtonItem = self->_audioBarButtonItem;
  self->_audioBarButtonItem = 0;

  -[UISegmentedControl removeTarget:action:forControlEvents:](self->_directorySwitch, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  directorySwitch = self->_directorySwitch;
  self->_directorySwitch = 0;

  directorySwitchBarButtonItem = self->_directorySwitchBarButtonItem;
  self->_directorySwitchBarButtonItem = 0;

  bookmarkButton = self->_bookmarkButton;
  self->_bookmarkButton = 0;

  bookmarkBarButtonItem = self->_bookmarkBarButtonItem;
  self->_bookmarkBarButtonItem = 0;

  -[BKThumbnailScrubber setDelegate:](self->_scrubber, "setDelegate:", 0);
  -[BKThumbnailScrubber removeTarget:action:forControlEvents:](self->_scrubber, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  scrubber = self->_scrubber;
  self->_scrubber = 0;

  -[BKThumbnailScrubber setDelegate:](self->_verticalScrubber, "setDelegate:", 0);
  -[BKThumbnailScrubber removeTarget:action:forControlEvents:](self->_verticalScrubber, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  verticalScrubber = self->_verticalScrubber;
  self->_verticalScrubber = 0;

  v23.receiver = self;
  v23.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController releaseViews](&v23, "releaseViews");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[BKThumbnailBookViewController releaseViews](self, "releaseViews");
  -[BKDirectoryContent setDirectoryDelegate:](self->_pageDirectory, "setDirectoryDelegate:", 0);
  -[BKTOCViewController setDirectoryDelegate:](self->_tocDirectory, "setDirectoryDelegate:", 0);
  -[BKDirectoryContent setDirectoryDelegate:](self->_bookmarkDirectory, "setDirectoryDelegate:", 0);
  -[BKDirectoryContent setDirectoryDelegate:](self->_pdfPageDirectory, "setDirectoryDelegate:", 0);
  -[BKTOCViewController setDirectoryDelegate:](self->_pdfOutlineDirectory, "setDirectoryDelegate:", 0);
  -[BKDirectoryContent setDirectoryDelegate:](self->_pdfBookmarkDirectory, "setDirectoryDelegate:", 0);
  -[IMThumbnailRenderingCache cancelRenderingCacheOperationsForTarget:](self->_imageCache, "cancelRenderingCacheOperationsForTarget:", self);
  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *v12;
  UIView *backgroundView;
  void *v14;
  id v15;
  double y;
  double width;
  double height;
  BCNavigationBar *v19;
  BCNavigationBar *topToolbar;
  BCNavigationBar *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *topBarTopConstraint;
  void *v36;
  void *v37;
  void *v38;
  BKInfoHUD *v39;
  BKInfoHUD *pageNumberHUD;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *pageNumberHUDWidthConstraint;
  void *v58;
  void *v59;
  NSLayoutConstraint *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_super v76;
  _QWORD v77[4];
  void *v78;
  _QWORD v79[3];

  v76.receiver = self;
  v76.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController viewDidLoad](&v76, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v5, v7, v9, v11);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
  -[UIView setOpaque:](self->_backgroundView, "setOpaque:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v14, "insertSubview:atIndex:", self->_backgroundView, 0);

  v15 = objc_alloc((Class)BCNavigationBar);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v19 = (BCNavigationBar *)objc_msgSend(v15, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  topToolbar = self->_topToolbar;
  self->_topToolbar = v19;

  -[BCNavigationBar setTranslatesAutoresizingMaskIntoConstraints:](self->_topToolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCNavigationBar setAlpha:](self->_topToolbar, "setAlpha:", 0.0);
  -[BCNavigationBar setDelegate:](self->_topToolbar, "setDelegate:", self);
  v21 = self->_topToolbar;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController theme](self, "theme"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "headerTextColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v23, NSForegroundColorAttributeName));
  -[BCNavigationBar setTitleTextAttributes:](v21, "setTitleTextAttributes:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController theme](self, "theme"));
  objc_msgSend(v25, "stylizeBCNavigationBarTranslucent:", self->_topToolbar);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v26, "addSubview:", self->_topToolbar);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar leadingAnchor](self->_topToolbar, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v79[0] = v72;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar trailingAnchor](self->_topToolbar, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  v79[1] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar topAnchor](self->_topToolbar, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  topBarTopConstraint = self->_topBarTopConstraint;
  self->_topBarTopConstraint = v34;

  v79[2] = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

  if (-[BKThumbnailBookViewController wantsBottomToolbar](self, "wantsBottomToolbar"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubberBarButtonItem](self, "scrubberBarButtonItem"));
    v78 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
    -[BKThumbnailBookViewController setToolbarItems:](self, "setToolbarItems:", v38);

  }
  -[BKBookViewController setSection:](self, "setSection:", 0);
  -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", 0);
  v39 = -[BKInfoHUD initWithFrame:]([BKInfoHUD alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  pageNumberHUD = self->_pageNumberHUD;
  self->_pageNumberHUD = v39;

  -[BKInfoHUD setUsesMonospacedDigitFont:](self->_pageNumberHUD, "setUsesMonospacedDigitFont:", 1);
  -[BKInfoHUD setTranslatesAutoresizingMaskIntoConstraints:](self->_pageNumberHUD, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKInfoHUD setAlpha:](self->_pageNumberHUD, "setAlpha:", 0.0);
  -[BKInfoHUD setUserInteractionEnabled:](self->_pageNumberHUD, "setUserInteractionEnabled:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v41, "addSubview:", self->_pageNumberHUD);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD trailingAnchor](self->_pageNumberHUD, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "safeAreaLayoutGuide"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v45, -16.0));

  LODWORD(v47) = 1148846080;
  objc_msgSend(v46, "setPriority:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bottomAnchor](self->_topToolbar, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD topAnchor](self->_pageNumberHUD, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 16.0));
  -[BKThumbnailBookViewController setPageNumberHUDTopConstraint:](self, "setPageNumberHUDTopConstraint:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD heightAnchor](self->_pageNumberHUD, "heightAnchor"));
  -[BKThumbnailBookViewController _infoHUDHeight](self, "_infoHUDHeight");
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintGreaterThanOrEqualToConstant:"));
  -[BKThumbnailBookViewController setPageNumberHUDHeightConstraint:](self, "setPageNumberHUDHeightConstraint:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD widthAnchor](self->_pageNumberHUD, "widthAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD superview](self->_pageNumberHUD, "superview"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "widthAnchor"));
  -[BKThumbnailBookViewController defaultPageNumberHUDWidthConstraintConstant](self, "defaultPageNumberHUDWidthConstraintConstant");
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:constant:", v55));
  pageNumberHUDWidthConstraint = self->_pageNumberHUDWidthConstraint;
  self->_pageNumberHUDWidthConstraint = v56;

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUDTopConstraint](self, "pageNumberHUDTopConstraint"));
  v77[0] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUDHeightConstraint](self, "pageNumberHUDHeightConstraint"));
  v60 = self->_pageNumberHUDWidthConstraint;
  v77[1] = v59;
  v77[2] = v60;
  v77[3] = v46;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v61);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location"));
  -[BKThumbnailBookViewController setInitialJumpLocation:](self, "setInitialJumpLocation:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "view"));

  objc_msgSend(v64, "setFrame:", v5, v7, v9, v11);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v65, "insertSubview:aboveSubview:", v64, self->_backgroundView);

  -[BKBookViewController createPaginationControllerIfNeeded:](self, "createPaginationControllerIfNeeded:", 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
  objc_msgSend(v66, "setAccessibilityContainerType:", 4);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController topToolbar](self, "topToolbar"));
  objc_msgSend(v67, "_accessibilitySetSortPriority:", 5000);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
  objc_msgSend(v68, "_accessibilitySetSortPriority:", 4000);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController verticalScrubber](self, "verticalScrubber"));
  objc_msgSend(v69, "_accessibilitySetSortPriority:", 3000);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
  objc_msgSend(v70, "_accessibilitySetSortPriority:", 2000);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _bk_backgroundColor](self, "_bk_backgroundColor"));
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v71);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  void *v26;

  v3 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController viewIsAppearing:](&v24, "viewIsAppearing:");
  v5 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
  -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v5, v6);
  -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController presentedViewController](self, "presentedViewController"));

  if (!v7)
  {
    -[BKBookViewController setControlsVisible:](self, "setControlsVisible:", -[BKThumbnailBookViewController canShowControlsDuringOpenClose](self, "canShowControlsDuringOpenClose"));
    -[BKThumbnailBookViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewControllers"));

  if (!objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController visibleContentViewController](self, "visibleContentViewController"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController visibleContentViewController](self, "visibleContentViewController"));
      v26 = v12;
      v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));

      v10 = (void *)v13;
    }
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v19, "isContentLoaded", (_QWORD)v20))
          -[BKThumbnailBookViewController contentViewReady:](self, "contentViewReady:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v16);
  }

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    -[BKThumbnailBookViewController _updateLibraryBarButtonItem](self, "_updateLibraryBarButtonItem", a3, a4);
    -[BKThumbnailBookViewController _updateToolbarPositionAndBackgroundExtension](self, "_updateToolbarPositionAndBackgroundExtension");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  -[IMThumbnailRenderingCache cancelRenderingCacheOperationsForTarget:](self->_imageCache, "cancelRenderingCacheOperationsForTarget:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController currentLocation](self, "currentLocation"));
  -[BKBookViewController setLocation:](self, "setLocation:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned __int8 v9;
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v9 = objc_msgSend(v8, "inLiveResize");

  if ((v9 & 1) == 0)
  {
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_F1B74;
    v11[3] = &unk_1BE8C8;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_F1BCC;
    v10[3] = &unk_1BE8C8;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v10);
  }

}

- (void)contentSizeCategoryDidChange
{
  double v3;
  double v4;
  void *v5;

  -[BKThumbnailBookViewController _infoHUDHeight](self, "_infoHUDHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUDHeightConstraint](self, "pageNumberHUDHeightConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

  -[BKInfoHUD updateLabelFont](self->_pageNumberHUD, "updateLabelFont");
}

- (NSDictionary)segmentIndexToDirectoryType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[3];

  v14[0] = &off_1CD388;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForPageThumbnails](self, "directoryTypeForPageThumbnails")));
  v15[0] = v3;
  v14[1] = &off_1CD3A0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForTOC](self, "directoryTypeForTOC")));
  v15[1] = v4;
  v14[2] = &off_1CD3B8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForBookmarks](self, "directoryTypeForBookmarks")));
  v15[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  LODWORD(v4) = objc_msgSend(v7, "suppressTOC");

  if ((_DWORD)v4)
  {
    v12[0] = &off_1CD388;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForPageThumbnails](self, "directoryTypeForPageThumbnails")));
    v12[1] = &off_1CD3A0;
    v13[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForBookmarks](self, "directoryTypeForBookmarks")));
    v13[1] = v9;
    v10 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

    v6 = (void *)v10;
  }
  return (NSDictionary *)v6;
}

- (NSDictionary)directoryTypeToSegmentIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForPageThumbnails](self, "directoryTypeForPageThumbnails")));
  v8[0] = v3;
  v9[0] = &off_1CD388;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForTOC](self, "directoryTypeForTOC")));
  v8[1] = v4;
  v9[1] = &off_1CD3A0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKThumbnailBookViewController directoryTypeForBookmarks](self, "directoryTypeForBookmarks")));
  v8[2] = v5;
  v9[2] = &off_1CD3B8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

  return (NSDictionary *)v6;
}

- (int64_t)segmentIndexForDirectoryType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTypeToSegmentIndex](self, "directoryTypeToSegmentIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
    v10 = objc_msgSend(v9, "integerValue");

  }
  else
  {
    v10 = 0;
  }

  return (int64_t)v10;
}

- (unint64_t)directoryTypeForSegmentIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController segmentIndexToDirectoryType](self, "segmentIndexToDirectoryType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

  }
  else
  {
    v10 = 0;
  }

  return (unint64_t)v10;
}

- (void)close:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController close:](&v5, "close:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v4, "cancelActions");

}

- (void)assetViewControllerUpdateToolbars
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController assetViewControllerUpdateToolbars](&v3, "assetViewControllerUpdateToolbars");
  -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", 0);
}

- (void)assetViewControllerWillBeginLiveResize
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController assetViewControllerWillBeginLiveResize](&v5, "assetViewControllerWillBeginLiveResize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
  objc_msgSend(v3, "cancelRenderingCacheOperationsForTarget:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
  objc_msgSend(v4, "suspend");

}

- (void)assetViewControllerDidEndLiveResize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController assetViewControllerDidEndLiveResize](&v2, "assetViewControllerDidEndLiveResize");
}

- (void)assetViewControllerDidFinishUpdateForLiveResize
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
  objc_msgSend(v2, "resume");

}

- (void)assetViewControllerDidExitFullScreen
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
  objc_msgSend(v2, "resume");

}

- (void)assetViewControllerDidEnterFullScreen
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
  objc_msgSend(v2, "resume");

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController themePage](self, "themePage", a3, a4));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childViewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", self));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12), "setTheme:", v5);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController configuration](self, "configuration"));
  objc_msgSend(v13, "invalidate");

  -[BKThumbnailBookViewController _update](self, "_update");
  objc_msgSend(v5, "stylizeBCNavigationBarTranslucent:", self->_topToolbar);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController initialJumpLocation](self, "initialJumpLocation"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController initialJumpLocation](self, "initialJumpLocation"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_F2460;
    v16[3] = &unk_1BEA38;
    v16[4] = self;
    -[BKThumbnailBookViewController jumpToLocation:animated:completion:](self, "jumpToLocation:animated:completion:", v15, 0, v16);

  }
}

- (void)viewWillLayoutSubviews
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController configuration](self, "configuration"));
  objc_msgSend(v2, "invalidate");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailBookViewController;
  -[BKThumbnailBookViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[BKBookViewController rebuildHoverRegions](self, "rebuildHoverRegions");
}

- (BKThumbnailBookViewConfiguration)configuration
{
  BKThumbnailBookViewConfiguration *configuration;
  BKThumbnailBookViewConfiguration *v4;
  BKThumbnailBookViewConfiguration *v5;

  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = -[BKThumbnailBookViewConfiguration initWithContext:]([BKThumbnailBookViewConfiguration alloc], "initWithContext:", self);
    v5 = self->_configuration;
    self->_configuration = v4;

    configuration = self->_configuration;
  }
  return configuration;
}

- (BKPreferredLayoutCache)preferredLayoutCache
{
  BKPreferredLayoutCache *preferredLayoutCache;
  BKPreferredLayoutCache *v4;
  BKPreferredLayoutCache *v5;

  preferredLayoutCache = self->_preferredLayoutCache;
  if (!preferredLayoutCache)
  {
    v4 = objc_alloc_init(BKPreferredLayoutCache);
    v5 = self->_preferredLayoutCache;
    self->_preferredLayoutCache = v4;

    preferredLayoutCache = self->_preferredLayoutCache;
  }
  return preferredLayoutCache;
}

- (NSArray)configurations
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController configuration](self, "configuration"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (void)setLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController setLayout:](&v4, "setLayout:", a3);
  -[BKBookViewController updateToolbarController](self, "updateToolbarController");
}

- (unint64_t)scrollLayoutForBook:(id)a3
{
  return 2;
}

- (BOOL)hasHighlightedText
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int v7;
  void *v8;

  v3 = (char *)-[BKThumbnailBookViewController currentPages](self, "currentPages");
  if (v3 >= &v3[v4])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v5 = v3;
    v6 = v4;
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController contentViewControllerForPageNumber:](self, "contentViewControllerForPageNumber:", v5));
      v7 |= objc_msgSend(v8, "hasHighlightedText");

      ++v5;
      --v6;
    }
    while (v6);
  }
  return v7 & 1;
}

- (void)highlightSearchResult:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController highlightSearchResult:](&v11, "highlightSearchResult:", v4);
  if (v4)
  {
    v5 = (char *)-[BKThumbnailBookViewController currentPages](self, "currentPages");
    if (v5 < &v5[v6])
    {
      v7 = v5;
      v8 = v6;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController contentViewControllerForPageNumber:](self, "contentViewControllerForPageNumber:", v7));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
        objc_msgSend(v9, "highlightSearchLocation:", v10);

        ++v7;
        --v8;
      }
      while (v8);
    }
  }

}

- (id)currentPageLocation
{
  return -[BKBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", (char *)-[BKPageNavigationViewController pageOffset](self->super._pageNavigationViewController, "pageOffset")+ 1);
}

- (BOOL)canOrdinalOnlyLocationsBeVisible
{
  return 0;
}

- (BOOL)canShowControlsDuringOpenClose
{
  return -[BKBookViewController controlsVisible](self, "controlsVisible")
      || UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning();
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  void *v7;
  _BYTE *v8;
  BOOL v9;
  _BYTE *v10;
  unint64_t v11;

  v4 = a3;
  if (v4
    && ((*(_QWORD *)&v5 = objc_opt_class(BKLocation).n128_u64[0],
         !objc_msgSend(v4, "isMemberOfClass:", v6, v5))
     || -[BKThumbnailBookViewController canOrdinalOnlyLocationsBeVisible](self, "canOrdinalOnlyLocationsBeVisible"))
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController")),
        v8 = objc_msgSend(v7, "pageNumberForDocumentOrdinal:", objc_msgSend(v4, "ordinal")),
        v7,
        v8 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
    v9 = v8 >= v10 && v8 - v10 < v11;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isAnnotationVisible:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v6 = -[BKThumbnailBookViewController isLocationOnCurrentPage:](self, "isLocationOnCurrentPage:", v5);

  v7 = _AEAnnotationLocationLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v9 = CFSTR("Visible");
    else
      v9 = CFSTR("Not Visible");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationUuid"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "isAnnotationVisible: Annotation is %@ for: %@", (uint8_t *)&v12, 0x16u);

  }
  return v6;
}

- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", (char *)objc_msgSend(v7, "pageOffset") + a3 + 1, v4);

  return 1;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  -[BKPageNavigationViewController turnToPageNumber:animated:](self->super._pageNavigationViewController, "turnToPageNumber:animated:");
  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController turnToPageNumber:animated:](&v7, "turnToPageNumber:animated:", a3, v4);
}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));

  if (v9)
  {
    -[BKBookViewController clearSelection](self, "clearSelection");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    v11 = objc_msgSend(v10, "pageNumberForLocation:", v15);

    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
      v12 = 1;
    else
      v12 = (uint64_t)v11;
    -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v12, v6);
  }
  v13 = objc_retainBlock(v8);
  v14 = v13;
  if (v13)
    (*((void (**)(id))v13 + 2))(v13);

}

- (void)turnToFirstPage:(BOOL)a3 animated:(BOOL)a4
{
  -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", 1, a4);
}

- (void)turnToInitialPage:(BOOL)a3 animated:(BOOL)a4
{
  -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", 1, a4);
}

- (void)pageCountDidUpdate
{
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController pageCountDidUpdate](&v5, "pageCountDidUpdate");
  -[BKPageNavigationViewController setPageCount:](self->super._pageNavigationViewController, "setPageCount:", -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell"));
  -[BKPageThumbnailDirectory setPageCount:](self->_pageDirectory, "setPageCount:", -[BKBookViewController pageCountExcludingUpsell](self, "pageCountExcludingUpsell"));
  if (-[BKThumbnailBookViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
    -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v3, v4);
    -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", 0);
    -[BKThumbnailBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 1);
  }
}

- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController didChangeLocationClosing:suspending:](&v9, "didChangeLocationClosing:suspending:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController currentLocation](self, "currentLocation"));
  -[BKBookViewController setLocation:](self, "setLocation:", v6);

  -[BKThumbnailBookViewController setInitialJumpLocation:](self, "setInitialJumpLocation:", 0);
  if (!a3)
  {
    v7 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
    -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v7, v8);
    -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", 0);
    -[BKThumbnailBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 0);
    -[BKThumbnailBookViewController _updateBuyButton](self, "_updateBuyButton");
  }
}

- (unint64_t)validLayoutForBook:(id)a3 desiredLayout:(unint64_t)a4
{
  unint64_t result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  result = -[BKBookViewController validLayoutForBook:desiredLayout:](&v6, "validLayoutForBook:desiredLayout:", a3, a4);
  if (result == 2)
  {
    if (-[BKThumbnailBookViewController supportsScrollLayout](self, "supportsScrollLayout"))
      return 2;
    else
      return 1;
  }
  return result;
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_topToolbar == a3)
    return 3;
  else
    return 0;
}

- (void)_update
{
  id v3;
  uint64_t v4;

  v3 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
  -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v3, v4);
  -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", 0);
  -[BKThumbnailBookViewController updateBottomToolbar:](self, "updateBottomToolbar:", 0);
  -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", 0);
  -[BKThumbnailBookViewController _updateDirectorySwitch](self, "_updateDirectorySwitch");
  -[BKThumbnailBookViewController _updateBuyButton](self, "_updateBuyButton");
}

- (BOOL)_shouldShowAudioToolbarButton
{
  return (-[BKBookViewController readAloudState](self, "readAloudState") & 0x80000000) == 0
      || -[BKBookViewController trackState](self, "trackState") >= 0;
}

- (BOOL)supportsDocumentEditing
{
  return 0;
}

- (BOOL)supportsDocumentEditingUndo
{
  return 0;
}

- (BOOL)supportsDocumentEditingUndoAll
{
  return 0;
}

- (BOOL)shouldShowBookmarkControl
{
  return 1;
}

- (void)updateTopToolbar:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  UISegmentedControl *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BCNavigationBar *topToolbar;
  void *v35;
  id v36;

  v3 = a3;
  if (-[BKThumbnailBookViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[BKBookViewController updateToolbarController](self, "updateToolbarController");
    -[BCNavigationBar invalidateIntrinsicContentSize](self->_topToolbar, "invalidateIntrinsicContentSize");
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 7));
    if (-[BKBookViewController section](self, "section"))
    {
      v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      +[BCNavigationBar titlePadding](BCNavigationBar, "titlePadding");
      objc_msgSend(v6, "setWidth:");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v8 = (unint64_t)objc_msgSend(v7, "userInterfaceIdiom");

      if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1
        && (-[BKThumbnailBookViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _directorySwitchBarButtonItem](self, "_directorySwitchBarButtonItem"));
        if (v24)
          objc_msgSend(v36, "addObject:", v24);

        if (v6)
          objc_msgSend(v36, "addObject:", v6);
        v12 = 0;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "barButtonItem"));
        if (v10)
          objc_msgSend(v36, "addObject:", v10);

        v11 = -[BKThumbnailBookViewController _directorySwitchBarButtonItem](self, "_directorySwitchBarButtonItem");
        v12 = self->_directorySwitch;
      }
      v25 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);

      +[BCNavigationBar titlePadding](BCNavigationBar, "titlePadding");
      objc_msgSend(v25, "setWidth:");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _resumeBarButtonItem](self, "_resumeBarButtonItem"));
      if (v26)
        objc_msgSend(v5, "addObject:", v26);

      if (v25)
        objc_msgSend(v5, "addObject:", v25);

      -[BKThumbnailBookViewController _updateToolbarPositionAndBackgroundExtension](self, "_updateToolbarPositionAndBackgroundExtension");
      if (v12)
      {
        -[BCNavigationBar setLeftItems:rightItems:titleView:animated:](self->_topToolbar, "setLeftItems:rightItems:titleView:animated:", v36, v5, v12, 0);
        goto LABEL_74;
      }
    }
    else
    {
      if (self->_libraryBarButtonItem)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _libraryBarButtonItem](self, "_libraryBarButtonItem"));
        if (v13)
          objc_msgSend(v36, "addObject:", v13);

      }
      if (-[BKThumbnailBookViewController shouldShowTOCControl](self, "shouldShowTOCControl"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _tocBarButtonItem](self, "_tocBarButtonItem"));
        if (v14)
          objc_msgSend(v36, "addObject:", v14);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetViewControllerMinifiedBarButtonItem:", self));
      if (v16)
        objc_msgSend(v36, "addObject:", v16);

      if (!-[BKThumbnailBookViewController shouldShowUndoControls](self, "shouldShowUndoControls")
        && (-[BKThumbnailBookViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "barButtonItem"));
        if (v18)
          objc_msgSend(v36, "addObject:", v18);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _buyBarButtonItem](self, "_buyBarButtonItem"));
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "storeFront"));
        v22 = objc_msgSend(v21, "isLoaded");

        if (v22)
          objc_msgSend(v36, "addObject:", v19);
        v23 = 0;
      }
      else
      {
        -[BKThumbnailBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", v3);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _bookmarkBarButtonItem](self, "_bookmarkBarButtonItem"));
      }
      if (-[BKThumbnailBookViewController shouldShowBookmarkControl](self, "shouldShowBookmarkControl") && v23)
        objc_msgSend(v5, "addObject:", v23);
      if ((!v19
         || (-[BKThumbnailBookViewController im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0)
        && !-[BKThumbnailBookViewController isScrolledContinuousFixedLayout](self, "isScrolledContinuousFixedLayout"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _searchBarButtonItem](self, "_searchBarButtonItem"));
        if (v27)
          objc_msgSend(v5, "addObject:", v27);

      }
      if (-[BKThumbnailBookViewController shouldShowBrightnessControl](self, "shouldShowBrightnessControl"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _brightnessBarButtonItem](self, "_brightnessBarButtonItem"));
        if (v28)
          objc_msgSend(v5, "addObject:", v28);

      }
      if (-[BKThumbnailBookViewController supportsScrollLayout](self, "supportsScrollLayout"))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _fontBarButtonItem](self, "_fontBarButtonItem"));
        if (v29)
          objc_msgSend(v5, "addObject:", v29);

      }
      if (-[BKThumbnailBookViewController _shouldShowAudioToolbarButton](self, "_shouldShowAudioToolbarButton"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _audioBarButtonItem](self, "_audioBarButtonItem"));
        if (v30)
          objc_msgSend(v5, "addObject:", v30);

      }
      if (-[BKThumbnailBookViewController supportsDocumentEditing](self, "supportsDocumentEditing"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _editToolboxBarButtonItem](self, "_editToolboxBarButtonItem"));
        if (v31)
          objc_msgSend(v5, "addObject:", v31);

      }
      if (-[BKThumbnailBookViewController shouldShowUndoControls](self, "shouldShowUndoControls"))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController editRedoBarButtonItem](self, "editRedoBarButtonItem"));
        if (v32)
          objc_msgSend(v5, "addObject:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController editUndoBarButtonItem](self, "editUndoBarButtonItem"));
        if (v33)
          objc_msgSend(v5, "addObject:", v33);

        -[BKThumbnailBookViewController _evaluateUndoRedoEnabled](self, "_evaluateUndoRedoEnabled");
      }

      -[BKThumbnailBookViewController _updateToolbarPositionAndBackgroundExtension](self, "_updateToolbarPositionAndBackgroundExtension");
    }
    topToolbar = self->_topToolbar;
    if (!-[BKThumbnailBookViewController _shouldNavBarShowTitle](self, "_shouldNavBarShowTitle"))
    {
      -[BCNavigationBar setLeftItems:rightItems:title:animated:](topToolbar, "setLeftItems:rightItems:title:animated:", v36, v5, 0, 0);
      goto LABEL_76;
    }
    v12 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl bookTitle](v12, "bookTitle"));
    -[BCNavigationBar setLeftItems:rightItems:title:animated:](topToolbar, "setLeftItems:rightItems:title:animated:", v36, v5, v35, 0);

LABEL_74:
LABEL_76:
    -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", v3);

  }
}

- (BOOL)_shouldNavBarShowTitle
{
  void *v3;
  double Width;
  double v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGRect v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v12);
  v5 = kIMConfigurationSize_largePhone[1];

  if (Width < v5)
    return 0;
  if (-[BKBookViewController section](self, "section") != 1)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
    objc_msgSend(v9, "alpha");
    v6 = v10 > 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)wantsBottomToolbar
{
  return 1;
}

- (void)updateBottomToolbar:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  UIToolbarAppearance *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;

  v3 = a3;
  if (-[BKThumbnailBookViewController wantsBottomToolbar](self, "wantsBottomToolbar")
    && !-[BKBookViewController section](self, "section")
    && -[BKBookViewController controlsVisible](self, "controlsVisible"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
    v6 = objc_msgSend(v5, "inLiveResize") ^ 1;

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController toolbarItems](self, "toolbarItems"));
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubberBarButtonItem](self, "scrubberBarButtonItem"));
    v21 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    -[BKThumbnailBookViewController setToolbarItems:](self, "setToolbarItems:", v10);

  }
  if (_os_feature_enabled_impl("UIKit", "chromeless_bars"))
  {
    v11 = objc_opt_new(UIToolbarAppearance);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController navigationController](self, "navigationController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toolbar"));
    objc_msgSend(v13, "setScrollEdgeAppearance:", v11);

  }
  if (v3)
    v14 = UINavigationControllerHideShowBarDuration;
  else
    v14 = 0.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController navigationController](self, "navigationController"));
  objc_msgSend(v15, "_setToolbarHidden:edge:duration:", v6 ^ 1, 15, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
  v17 = v16;
  if (((v6 ^ 1) & 1) != 0)
  {
    objc_msgSend(v16, "cancelPendingRenderRequests");

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
    objc_msgSend(v18, "removeAllAnimations");

    v19 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
    -[BKThumbnailBookViewController updateScrubber:](self, "updateScrubber:", v19, v20);
  }
}

- (id)newGlassButton
{
  BKToolbarButton *v2;

  v2 = -[BKToolbarButton initWithFrame:]([BKToolbarButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BKToolbarButton setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKToolbarButton setMultipleTouchEnabled:](v2, "setMultipleTouchEnabled:", 0);
  -[BKToolbarButton setExclusiveTouch:](v2, "setExclusiveTouch:", 1);
  return v2;
}

- (void)_updateLibraryBarButtonItem
{
  const __CFString *v3;
  void *v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *libraryBarButtonItem;
  void *v8;
  unsigned int v9;
  __CFString *v10;

  v3 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem title](self->_libraryBarButtonItem, "title"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem image](self->_libraryBarButtonItem, "image"));

    if (v4)
      v3 = &stru_1C3088;
    else
      v3 = 0;
  }
  v10 = (__CFString *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v6 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libraryButtonItemForViewController:selector:", self, "showLibrary:"));
  libraryBarButtonItem = self->_libraryBarButtonItem;
  self->_libraryBarButtonItem = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v9 = objc_msgSend(v8, "canUpdateLibraryBarButtonItem:withOldString:", self->_libraryBarButtonItem, v10);

  if (v9)
    -[BKThumbnailBookViewController assetViewControllerUpdateToolbars](self, "assetViewControllerUpdateToolbars");

}

- (id)_libraryBarButtonItem
{
  UIBarButtonItem *libraryBarButtonItem;

  libraryBarButtonItem = self->_libraryBarButtonItem;
  if (!libraryBarButtonItem)
  {
    -[BKThumbnailBookViewController _updateLibraryBarButtonItem](self, "_updateLibraryBarButtonItem");
    libraryBarButtonItem = self->_libraryBarButtonItem;
  }
  return libraryBarButtonItem;
}

- (id)_resumeBarButtonItem
{
  UIBarButtonItem *resumeBarButtonItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  resumeBarButtonItem = self->_resumeBarButtonItem;
  if (!resumeBarButtonItem)
  {
    v4 = AEBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Resume"), &stru_1C3088, 0));

    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v6, 2, self, "resume:");
    v8 = self->_resumeBarButtonItem;
    self->_resumeBarButtonItem = v7;

    resumeBarButtonItem = self->_resumeBarButtonItem;
  }
  return resumeBarButtonItem;
}

- (id)searchButtonItem
{
  return self->_searchBarButtonItem;
}

- (id)fontButton
{
  UIBarButtonItem *brightnessBarButtonItem;

  brightnessBarButtonItem = self->_brightnessBarButtonItem;
  if (!brightnessBarButtonItem)
    brightnessBarButtonItem = self->_editToolboxBarButtonItem;
  return brightnessBarButtonItem;
}

- (id)_fontBarButtonItem
{
  UIBarButtonItem *fontBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  CGRect v7;

  fontBarButtonItem = self->_fontBarButtonItem;
  if (!fontBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("textformat.size"), self, "showFontPicker:"));
    v5 = self->_fontBarButtonItem;
    self->_fontBarButtonItem = v4;

    -[UIButton frame](self->_bookmarkButton, "frame");
    -[UIBarButtonItem setWidth:](self->_fontBarButtonItem, "setWidth:", fmax(CGRectGetWidth(v7), 32.0));
    fontBarButtonItem = self->_fontBarButtonItem;
  }
  return fontBarButtonItem;
}

- (id)_searchBarButtonItem
{
  UIBarButtonItem *searchBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  searchBarButtonItem = self->_searchBarButtonItem;
  if (!searchBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("magnifyingglass"), self, "showSearch:"));
    v5 = self->_searchBarButtonItem;
    self->_searchBarButtonItem = v4;

    searchBarButtonItem = self->_searchBarButtonItem;
  }
  return searchBarButtonItem;
}

- (id)_tocBarButtonItem
{
  UIBarButtonItem *tocBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  tocBarButtonItem = self->_tocBarButtonItem;
  if (!tocBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("list.bullet"), self, "showTOC:"));
    v5 = self->_tocBarButtonItem;
    self->_tocBarButtonItem = v4;

    tocBarButtonItem = self->_tocBarButtonItem;
  }
  return tocBarButtonItem;
}

- (BOOL)shouldShowBrightnessControl
{
  _BOOL4 v3;

  v3 = -[BKThumbnailBookViewController supportsBrightness](self, "supportsBrightness");
  if (v3)
    LOBYTE(v3) = !-[BKThumbnailBookViewController supportsScrollLayout](self, "supportsScrollLayout");
  return v3;
}

- (BOOL)isScrolledContinuousFixedLayout
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fixedLayoutFlow"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("scrolled-continuous"));

  return v4;
}

- (BOOL)supportsScrollLayout
{
  void *v3;
  unsigned int v4;
  void *v5;

  if (+[BKThumbnailBookViewController verticalScrollFeatureEnabled](BKThumbnailBookViewController, "verticalScrollFeatureEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    if ((objc_msgSend(v3, "hasMediaOverlayElements") & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
      v4 = objc_msgSend(v5, "isScrollModeDisabled") ^ 1;

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)supportsBrightness
{
  return +[BEAppearanceViewController canChangeBrightness](BEAppearanceViewController, "canChangeBrightness");
}

- (id)_brightnessBarButtonItem
{
  UIBarButtonItem *brightnessBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  brightnessBarButtonItem = self->_brightnessBarButtonItem;
  if (!brightnessBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("sun.max"), self, "showBrightness:"));
    v5 = self->_brightnessBarButtonItem;
    self->_brightnessBarButtonItem = v4;

    brightnessBarButtonItem = self->_brightnessBarButtonItem;
  }
  return brightnessBarButtonItem;
}

- (BOOL)assetEditingEnabled
{
  return 0;
}

- (BOOL)shouldShowTOCControl
{
  return !-[BKThumbnailBookViewController shouldShowUndoControls](self, "shouldShowUndoControls");
}

- (BOOL)shouldShowUndoControls
{
  return 0;
}

- (id)_editToolboxBarButtonItem
{
  UIBarButtonItem *editToolboxBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  editToolboxBarButtonItem = self->_editToolboxBarButtonItem;
  if (!editToolboxBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("pencil.tip.crop.circle"), self, "toggleEditAssetMode:"));
    v5 = self->_editToolboxBarButtonItem;
    self->_editToolboxBarButtonItem = v4;

    -[UIBarButtonItem setSelected:](self->_editToolboxBarButtonItem, "setSelected:", -[BKThumbnailBookViewController assetEditingEnabled](self, "assetEditingEnabled"));
    editToolboxBarButtonItem = self->_editToolboxBarButtonItem;
  }
  return editToolboxBarButtonItem;
}

- (id)editUndoBarButtonItem
{
  UIBarButtonItem *editUndoBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  editUndoBarButtonItem = self->_editUndoBarButtonItem;
  if (!editUndoBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("arrow.uturn.backward.circle"), self, "handleEditUndo:"));
    v5 = self->_editUndoBarButtonItem;
    self->_editUndoBarButtonItem = v4;

    editUndoBarButtonItem = self->_editUndoBarButtonItem;
  }
  return editUndoBarButtonItem;
}

- (id)editRedoBarButtonItem
{
  UIBarButtonItem *editRedoBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  editRedoBarButtonItem = self->_editRedoBarButtonItem;
  if (!editRedoBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("arrow.uturn.forward.circle"), self, "handleEditRedo:"));
    v5 = self->_editRedoBarButtonItem;
    self->_editRedoBarButtonItem = v4;

    editRedoBarButtonItem = self->_editRedoBarButtonItem;
  }
  return editRedoBarButtonItem;
}

- (id)_audioBarButtonItem
{
  UIBarButtonItem *audioBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  audioBarButtonItem = self->_audioBarButtonItem;
  if (!audioBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem bc_readingExperienceBarItem:target:action:](UIBarButtonItem, "bc_readingExperienceBarItem:target:action:", CFSTR("speaker.wave.2"), self, "showAudio:"));
    v5 = self->_audioBarButtonItem;
    self->_audioBarButtonItem = v4;

    audioBarButtonItem = self->_audioBarButtonItem;
  }
  return audioBarButtonItem;
}

- (id)_bookmarkBarButtonItem
{
  UIBarButtonItem *bookmarkBarButtonItem;
  id v4;
  void *v5;
  id v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  CGRect v10;

  bookmarkBarButtonItem = self->_bookmarkBarButtonItem;
  if (!bookmarkBarButtonItem)
  {
    v4 = objc_alloc((Class)BCUIFullHeightNavWrapper);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _bookmarkButton](self, "_bookmarkButton"));
    v6 = objc_msgSend(v4, "initWithView:", v5);

    objc_msgSend(v6, "setCursorInsets:", 2.0, -8.0, 2.0, -8.0);
    -[UIButton frame](self->_bookmarkButton, "frame");
    objc_msgSend(v6, "setSpecifiedWidth:", fmax(CGRectGetWidth(v10), 32.0));
    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v6);
    v8 = self->_bookmarkBarButtonItem;
    self->_bookmarkBarButtonItem = v7;

    objc_msgSend(v6, "specifiedWidth");
    -[UIBarButtonItem setWidth:](self->_bookmarkBarButtonItem, "setWidth:");

    bookmarkBarButtonItem = self->_bookmarkBarButtonItem;
  }
  return bookmarkBarButtonItem;
}

- (id)_bookmarkButton
{
  UIButton *bookmarkButton;
  UIButton *v4;
  UIButton *v5;

  bookmarkButton = self->_bookmarkButton;
  if (!bookmarkButton)
  {
    v4 = -[BKThumbnailBookViewController newGlassButton](self, "newGlassButton");
    v5 = self->_bookmarkButton;
    self->_bookmarkButton = v4;

    -[UIButton addTarget:action:forControlEvents:](self->_bookmarkButton, "addTarget:action:forControlEvents:", self, "toggleBookmark:", 64);
    -[BKThumbnailBookViewController updateBookmarkButton:](self, "updateBookmarkButton:", 1);
    -[UIButton sizeToFit](self->_bookmarkButton, "sizeToFit");
    bookmarkButton = self->_bookmarkButton;
  }
  return bookmarkButton;
}

- (id)_buyBarButtonItem
{
  UIBarButtonItem *buyBarButtonItem;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  void *v15;

  buyBarButtonItem = self->_buyBarButtonItem;
  if (!buyBarButtonItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sampleContent"));
    v6 = objc_msgSend(v5, "BOOLValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "isPreorder"));
    v9 = objc_msgSend(v8, "BOOLValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storeId"));
    v12 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetViewControllerBuyButtonItem:isSample:isPreorder:storeID:", self, v6, v9, v11));
    v13 = self->_buyBarButtonItem;
    self->_buyBarButtonItem = v12;

    -[BKThumbnailBookViewController _updateBuyButton](self, "_updateBuyButton");
    buyBarButtonItem = self->_buyBarButtonItem;
  }
  return buyBarButtonItem;
}

- (id)_directorySwitchBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImage *v13;
  UIImage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImage *v19;
  UIImage *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  void *v25;
  BKSegmentedControl *v26;
  UISegmentedControl *directorySwitch;
  double v28;
  double v29;
  unint64_t v30;
  UIBarButtonItem *v31;
  UIBarButtonItem *directorySwitchBarButtonItem;
  id v33;
  double v34;
  uint64_t v36;

  if (!self->_directorySwitchBarButtonItem)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("rectangle.grid.3x2")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 13.0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithConfiguration:", v4));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = objc_opt_new(UIImage);
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("list.bullet")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 13.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithConfiguration:", v10));
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = objc_opt_new(UIImage);
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bookmark")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 13.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithConfiguration:", v16));
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = objc_opt_new(UIImage);
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    v22 = objc_msgSend(v21, "suppressTOC");

    v23 = objc_alloc((Class)NSArray);
    if ((v22 & 1) != 0)
      v24 = objc_msgSend(v23, "initWithObjects:", v8, v20, 0, v36);
    else
      v24 = objc_msgSend(v23, "initWithObjects:", v8, v14, v20, 0);
    v25 = v24;
    v26 = -[BKSegmentedControl initWithItems:]([BKSegmentedControl alloc], "initWithItems:", v24);
    directorySwitch = self->_directorySwitch;
    self->_directorySwitch = &v26->super;

    -[UISegmentedControl addTarget:action:forControlEvents:](self->_directorySwitch, "addTarget:action:forControlEvents:", self, "directorySwitchPressed:", 4096);
    -[BKThumbnailBookViewController _updateDirectorySwitch](self, "_updateDirectorySwitch");
    if (objc_msgSend(v25, "count") == (char *)&dword_0 + 3)
      v28 = 132.0;
    else
      v28 = 120.0;
    if (objc_msgSend(v25, "count"))
      v29 = v28 / (double)(unint64_t)objc_msgSend(v25, "count");
    else
      v29 = 40.0;
    if (objc_msgSend(v25, "count"))
    {
      v30 = 0;
      do
        -[UISegmentedControl setWidth:forSegmentAtIndex:](self->_directorySwitch, "setWidth:forSegmentAtIndex:", v30++, v29);
      while ((unint64_t)objc_msgSend(v25, "count") > v30);
    }
    v31 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", self->_directorySwitch);
    directorySwitchBarButtonItem = self->_directorySwitchBarButtonItem;
    self->_directorySwitchBarButtonItem = v31;

    -[UIBarButtonItem setStyle:](self->_directorySwitchBarButtonItem, "setStyle:", 0);
    v33 = objc_msgSend(v25, "count");
    v34 = 0.0;
    if (v33)
      v34 = v28;
    -[UIBarButtonItem setWidth:](self->_directorySwitchBarButtonItem, "setWidth:", v34);

  }
  -[UISegmentedControl sizeToFit](self->_directorySwitch, "sizeToFit");
  return self->_directorySwitchBarButtonItem;
}

- (_NSRange)currentPages
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v3 = -[BKPageNavigationViewController pageOffset](self->super._pageNavigationViewController, "pageOffset");
  v4 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
  if (v3 + 1 < v4)
    v5 = v3 + 1;
  else
    v5 = v4;
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = v5;
  v7 = 1;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)visibleContentViewController
{
  id v3;
  uint64_t v4;

  v3 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
  return -[BKThumbnailBookViewController existingContentViewControllerForPageNumber:](self, "existingContentViewControllerForPageNumber:", -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v3, v4));
}

- (id)existingContentViewControllerForPageNumber:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)contentViewControllerForPageNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController existingContentViewControllerForPageNumber:](self, "existingContentViewControllerForPageNumber:"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllerForLocation:](self, "contentViewControllerForLocation:", v6));
    objc_msgSend(v5, "setDelegate:", self);
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
      objc_msgSend(v5, "setContentViewImageCache:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
      objc_msgSend(v8, "setObject:forKey:", v5, v6);

      -[BKPageNavigationViewController addChildViewController:](self->super._pageNavigationViewController, "addChildViewController:", v5);
    }

  }
  return v5;
}

- (BOOL)_isUsingContent:(id)a3
{
  BKPageNavigationViewController *pageNavigationViewController;
  id v4;
  void *v5;
  unsigned __int8 v6;

  pageNavigationViewController = self->super._pageNavigationViewController;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController allViewControllers](pageNavigationViewController, "allViewControllers"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)pageNavigationDidRemoveContentForPageNumber:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v7));

  if (v5 && !-[BKThumbnailBookViewController _isUsingContent:](self, "_isUsingContent:", v5))
  {
    objc_msgSend(v5, "removeFromParentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (void)pageNavigationDidRemoveContentViewController:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[BKThumbnailBookViewController _isUsingContent:](self, "_isUsingContent:", v4);
    v4 = v9;
    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeysForObject:", v9));

      objc_msgSend(v9, "removeFromParentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController contentViewControllers](self, "contentViewControllers"));
      objc_msgSend(v8, "removeObjectsForKeys:", v7);

      v4 = v9;
    }
  }

}

- (void)pageNavigationDidChangeLocation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController pageNavigationDidChangeLocation:](&v4, "pageNavigationDidChangeLocation:", a3);
  -[BKThumbnailBookViewController didChangeLocationClosing:suspending:](self, "didChangeLocationClosing:suspending:", 0, 0);
}

- (void)pageNavigationToggleControls:(id)a3
{
  -[BKThumbnailBookViewController toggleControls:](self, "toggleControls:", 0);
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void (**v8)(_QWORD);
  unsigned int v9;
  void *v10;
  int v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  objc_super v16;
  _QWORD v17[5];
  char v18;
  BOOL v19;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (-[BKBookViewController section](self, "section") == 1)
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController searchViewController](self, "searchViewController"));
    if ((objc_msgSend(v10, "isVisible") & 1) != 0)
      v9 = 1;
    else
      v9 = -[BKAppearanceViewController isVisible](self->super._appearanceViewController, "isVisible");

  }
  v11 = v9 | v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController assetViewControllerDelegate](self, "assetViewControllerDelegate"));
  v13 = objc_msgSend(v12, "inLiveResize");

  v14 = v11 & ~v13;
  if ((_DWORD)v14 != -[BKBookViewController controlsVisible](self, "controlsVisible")
    || -[BKBookViewController bkaxAccessibilityUserIsRequestingControlsVisibilityToggle](self, "bkaxAccessibilityUserIsRequestingControlsVisibilityToggle")|| (_DWORD)v14 && (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_F481C;
    v17[3] = &unk_1C1E08;
    v17[4] = self;
    v18 = v11 & ~(_BYTE)v13;
    v19 = v5;
    v15 = objc_retainBlock(v17);
    -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", v5);
    v16.receiver = self;
    v16.super_class = (Class)BKThumbnailBookViewController;
    -[BKBookViewController setControlsVisible:animated:animations:completion:](&v16, "setControlsVisible:animated:animations:completion:", v14, v5, v15, v8);

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)setTopToolBarVisible:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (a3)
  {
    -[BCNavigationBar setAlpha:](self->_topToolbar, "setAlpha:", 1.0);
    -[BCNavigationBar setAccessibilityElementsHidden:](self->_topToolbar, "setAccessibilityElementsHidden:", 0);
  }
  else
  {
    -[BKBookViewController dismissCurrentPopoverWithCompletion:animated:](self, "dismissCurrentPopoverWithCompletion:animated:", 0, 1);
  }
  -[BCNavigationBar setAlpha:](self->_topToolbar, "setAlpha:", (double)v3);
  -[BCNavigationBar setAccessibilityElementsHidden:](self->_topToolbar, "setAccessibilityElementsHidden:", !v3);
}

- (void)toggleControls:(id)a3
{
  unsigned int v4;

  v4 = -[BKBookViewController controlsVisible](self, "controlsVisible", a3);
  if ((v4 & 1) != 0 || !-[BKThumbnailBookViewController hasHighlightedText](self, "hasHighlightedText"))
  {
    if (-[BKBookViewController bkaxAccessibilityUserIsRequestingControlsVisibilityToggle](self, "bkaxAccessibilityUserIsRequestingControlsVisibilityToggle")|| !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
    {
      -[BKBookViewController setControlsVisible:animated:](self, "setControlsVisible:animated:", v4 ^ 1, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
    }
  }
  else
  {
    -[BKBookViewController clearSearchResult](self, "clearSearchResult");
    -[BKBookViewController clearSelection](self, "clearSelection");
  }
}

- (void)showTOC:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKThumbnailBookViewController *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v5, "cancelActions");

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_F4A98;
  v7[3] = &unk_1BFDB8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[BKThumbnailBookViewController setControlsVisible:animated:completion:](self, "setControlsVisible:animated:completion:", 1, 1, v7);

}

- (void)toggleEditAssetMode:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v5, "cancelActions");

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController toggleEditAssetMode:](&v6, "toggleEditAssetMode:", v4);

}

- (void)handleEditUndo:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v5, "cancelActions");

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController handleEditUndo:](&v6, "handleEditUndo:", v4);

}

- (void)handleEditRedo:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v5, "cancelActions");

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController handleEditRedo:](&v6, "handleEditRedo:", v4);

}

- (void)handleEditUndoAll:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v5, "cancelActions");

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController handleEditUndoAll:](&v6, "handleEditUndoAll:", v4);

}

- (void)resume:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v5, "cancelActions");

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController resume:](&v6, "resume:", v4);

}

- (void)showLibrary:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKThumbnailBookViewController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_F4D78;
  v4[3] = &unk_1BFDB8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKViewController dismissCurrentPopoverWithCompletion:](v5, "dismissCurrentPopoverWithCompletion:", v4);

}

- (void)showOverlayViewController:(id)a3 fromView:(id)a4 popoverOnPhone:(BOOL)a5 passthroughViews:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController actionController](self, "actionController"));
  objc_msgSend(v13, "cancelActions");

  v14.receiver = self;
  v14.super_class = (Class)BKThumbnailBookViewController;
  -[BKViewController showOverlayViewController:fromItem:popoverOnPhone:passthroughViews:popoverBackgroundColor:](&v14, "showOverlayViewController:fromItem:popoverOnPhone:passthroughViews:popoverBackgroundColor:", v12, v11, v6, v10, 0);

}

- (void)showTOCFromToolbar:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKThumbnailBookViewController canShowTableOfContents](self, "canShowTableOfContents"))
  {
    -[BKThumbnailBookViewController books_showTableOfContents:](self, "books_showTableOfContents:", v4);
  }
  else if (-[BKBookViewController canShowContent](self, "canShowContent"))
  {
    -[BKBookViewController books_showContent:](self, "books_showContent:", v4);
  }

}

- (void)showThumbnailTOCFromToolbar:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKThumbnailBookViewController canShowThumbnails](self, "canShowThumbnails"))
  {
    -[BKThumbnailBookViewController books_showThumbnails:](self, "books_showThumbnails:", v4);
  }
  else if (-[BKBookViewController canShowContent](self, "canShowContent"))
  {
    -[BKBookViewController books_showContent:](self, "books_showContent:", v4);
  }

}

- (void)showBookmarksFromToolbar:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BKThumbnailBookViewController canShowBookmarks](self, "canShowBookmarks"))
  {
    -[BKThumbnailBookViewController books_showBookmarks:](self, "books_showBookmarks:", v4);
  }
  else if (-[BKBookViewController canShowContent](self, "canShowContent"))
  {
    -[BKBookViewController books_showContent:](self, "books_showContent:", v4);
  }

}

- (void)showAudioControlsFromToolbar:(id)a3
{
  -[BKBookViewController showAudio:](self, "showAudio:", a3);
}

- (void)donePressedFromToolbar:(id)a3
{
  -[BKThumbnailBookViewController resume:](self, "resume:", a3);
}

- (int64_t)bookToolbarTransparency
{
  return 1;
}

- (BOOL)shouldDisplayTitleWhenActive
{
  return 1;
}

- (BOOL)shouldDisplayTitleWhenInactive
{
  return 0;
}

- (BOOL)shouldDisplaySearchControls
{
  return !-[BKThumbnailBookViewController isScrolledContinuousFixedLayout](self, "isScrolledContinuousFixedLayout");
}

- (BOOL)shouldDisplayBuyButton
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sampleContent"));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldDisplayContentsButton
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v3 = objc_msgSend(v2, "suppressTOC") ^ 1;

  return v3;
}

- (BOOL)shouldDisplayPageThumbnailsButton
{
  return 1;
}

- (BOOL)shouldDisplayBookmarksButton
{
  return 1;
}

- (BOOL)shouldDisplayHighlightsButton
{
  return 0;
}

- (int64_t)bookToolbarMode
{
  int64_t result;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailBookViewController;
  result = -[BKBookViewController bookToolbarMode](&v5, "bookToolbarMode");
  if (!result)
  {
    v4 = -[BKThumbnailBookViewController directoryType](self, "directoryType");
    if (v4 - 1 > 5)
      return 0;
    else
      return qword_1732D8[v4 - 1];
  }
  return result;
}

- (id)bookToolbarTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController asset](self, "asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayTitle"));

  return v3;
}

- (id)bookToolbarCurrentPageString
{
  return 0;
}

- (id)buttonTitleColor
{
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksWhite](UIColor, "bc_booksWhite"));
  *(_QWORD *)&v4 = objc_opt_class(IMThemePage).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController theme](self, "theme", v4));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buttonColor"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bc_invertedDynamicColor"));

    v3 = (void *)v11;
  }

  return v3;
}

- (id)bookmarkToolTip
{
  id v2;
  void *v3;
  void *v4;

  v2 = AEBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Show bookmarked pages"), &stru_1C3088, 0));

  return v4;
}

- (id)tocToolTip
{
  id v2;
  void *v3;
  void *v4;

  v2 = AEBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Show contents in list view"), &stru_1C3088, 0));

  return v4;
}

- (BOOL)catalystToolbarActive
{
  return 0;
}

- (void)toolbarDidBecomeActive:(id)a3
{
  -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", 1);
}

- (void)toolbarDidBecomeInactive:(id)a3
{
  -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", 1);
}

- (void)validateCommand:(id)a3
{
  id v4;
  const char *v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  int64_t v12;
  id v13;
  int64_t v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController validateCommand:](&v19, "validateCommand:", v4);
  v5 = (const char *)objc_msgSend(v4, "action");
  if (!sel_isEqual(v5, "books_toggleContinuousScroll:"))
  {
    if (sel_isEqual(v5, "books_disableContinuousScroll:"))
    {
      v6 = self->super._layout == 1;
      goto LABEL_5;
    }
    if (sel_isEqual(v5, "books_enableContinuousScroll:"))
    {
      objc_msgSend(v4, "setState:", self->super._layout == 2);
      v8 = AEBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      v11 = CFSTR("Vertical Scrolling");
LABEL_18:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1C3088, 0));
      objc_msgSend(v4, "setTitle:", v16);

      goto LABEL_19;
    }
    if (sel_isEqual(v5, "books_chapterRight:"))
    {
      v12 = -[BKViewController layoutDirection](self, "layoutDirection");
      v13 = AEBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (v12 == 1)
      {
LABEL_13:
        v11 = CFSTR("Previous Chapter");
LABEL_17:
        v9 = v10;
        goto LABEL_18;
      }
    }
    else
    {
      if (!sel_isEqual(v5, "books_chapterLeft:"))
      {
        if (!sel_isEqual(v5, "books_togglePlaying:"))
          goto LABEL_19;
        v17 = -[BKBookViewController isReading](self, "isReading");
        v18 = AEBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (v17)
          v11 = CFSTR("Pause");
        else
          v11 = CFSTR("Play");
        goto LABEL_17;
      }
      v14 = -[BKViewController layoutDirection](self, "layoutDirection");
      v15 = AEBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (v14 != 1)
        goto LABEL_13;
    }
    v11 = CFSTR("Next Chapter");
    goto LABEL_17;
  }
  v6 = self->super._layout == 2;
LABEL_5:
  v7 = v6;
  objc_msgSend(v4, "setState:", v7);
LABEL_19:

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  unsigned int v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  char v14;
  unsigned __int8 v15;
  _BOOL4 isEqual;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BKThumbnailBookViewController;
  v6 = -[BKBookViewController canPerformAction:withSender:](&v18, "canPerformAction:withSender:", a3, a4);
  *(_QWORD *)&v7 = objc_opt_class(BKPictureBookNavigationController).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController", v7));
  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!sel_isEqual(a3, "books_showTableOfContents:"))
  {
    if (sel_isEqual(a3, "books_showThumbnails:"))
    {
      if (v6)
      {
        v13 = -[BKThumbnailBookViewController canShowThumbnails](self, "canShowThumbnails");
        goto LABEL_10;
      }
      goto LABEL_28;
    }
    if (sel_isEqual(a3, "books_showBookmarks:"))
    {
      if (v6)
      {
        v13 = -[BKThumbnailBookViewController canShowBookmarks](self, "canShowBookmarks");
        goto LABEL_10;
      }
      goto LABEL_28;
    }
    if (sel_isEqual(a3, "books_toggleContinuousScroll:")
      || sel_isEqual(a3, "books_disableContinuousScroll:")
      || sel_isEqual(a3, "books_enableContinuousScroll:"))
    {
      v15 = -[BKThumbnailBookViewController shouldDisplayReadaloudControls](self, "shouldDisplayReadaloudControls");
    }
    else
    {
      if (sel_isEqual(a3, "books_increaseZoom:"))
      {
        if (v6)
        {
          v13 = objc_msgSend(v12, "canZoomMore");
          goto LABEL_10;
        }
        goto LABEL_28;
      }
      if (!sel_isEqual(a3, "books_resetZoom:") && !sel_isEqual(a3, "books_decreaseZoom:"))
      {
        if (!sel_isEqual(a3, "books_togglePlaying:"))
        {
          if (sel_isEqual(a3, "books_stopPlaying:"))
          {
            if (!v6)
              goto LABEL_28;
          }
          else
          {
            isEqual = sel_isEqual(a3, "books_skipBackward:");
            if ((isEqual & v6 & 1) == 0)
            {
              v14 = v6 & ~isEqual;
              goto LABEL_29;
            }
          }
          v13 = -[BKBookViewController isReading](self, "isReading");
          goto LABEL_10;
        }
        if (v6)
        {
          v14 = -[BKBookViewController readAloudState](self, "readAloudState") != -1;
          goto LABEL_29;
        }
LABEL_28:
        v14 = 0;
        goto LABEL_29;
      }
      if (!v6)
        goto LABEL_28;
      v15 = objc_msgSend(v12, "isZoomedToSpread");
    }
    v14 = v15 ^ 1;
    goto LABEL_29;
  }
  if (!v6)
    goto LABEL_28;
  v13 = -[BKThumbnailBookViewController canShowTableOfContents](self, "canShowTableOfContents");
LABEL_10:
  v14 = v13;
LABEL_29:

  return v14;
}

- (BOOL)canShowTableOfContents
{
  void *v3;
  unsigned __int8 v4;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  v4 = objc_msgSend(v3, "suppressTOC");

  if ((v4 & 1) != 0)
    return 0;
  if (-[BKBookViewController section](self, "section") != 1)
    return 1;
  v6 = -[BKThumbnailBookViewController directoryType](self, "directoryType");
  return v6 != -[BKThumbnailBookViewController directoryTypeForTOC](self, "directoryTypeForTOC");
}

- (BOOL)canShowThumbnails
{
  unint64_t v3;

  if (-[BKBookViewController section](self, "section") != 1)
    return 1;
  v3 = -[BKThumbnailBookViewController directoryType](self, "directoryType");
  return v3 != -[BKThumbnailBookViewController directoryTypeForPageThumbnails](self, "directoryTypeForPageThumbnails");
}

- (BOOL)canShowBookmarks
{
  unint64_t v3;

  if (-[BKBookViewController section](self, "section") != 1)
    return 1;
  v3 = -[BKThumbnailBookViewController directoryType](self, "directoryType");
  return v3 != -[BKThumbnailBookViewController directoryTypeForBookmarks](self, "directoryTypeForBookmarks");
}

- (void)books_showTableOfContents:(id)a3
{
  id v4;

  v4 = a3;
  -[BKThumbnailBookViewController setDirectoryType:](self, "setDirectoryType:", -[BKThumbnailBookViewController directoryTypeForTOC](self, "directoryTypeForTOC"));
  -[BKThumbnailBookViewController showTOC:](self, "showTOC:", v4);

}

- (void)books_showBookmarks:(id)a3
{
  id v4;

  v4 = a3;
  -[BKThumbnailBookViewController setDirectoryType:](self, "setDirectoryType:", -[BKThumbnailBookViewController directoryTypeForBookmarks](self, "directoryTypeForBookmarks"));
  -[BKThumbnailBookViewController showTOC:](self, "showTOC:", v4);

}

- (void)books_showThumbnails:(id)a3
{
  id v4;

  v4 = a3;
  -[BKThumbnailBookViewController setDirectoryType:](self, "setDirectoryType:", -[BKThumbnailBookViewController directoryTypeForPageThumbnails](self, "directoryTypeForPageThumbnails"));
  -[BKThumbnailBookViewController showTOC:](self, "showTOC:", v4);

}

- (void)books_toggleContinuousScroll:(id)a3
{
  id v4;

  v4 = a3;
  if ((char *)-[BKBookViewController layout](self, "layout") == (char *)&dword_0 + 1)
    -[BKThumbnailBookViewController books_enableContinuousScroll:](self, "books_enableContinuousScroll:", v4);
  else
    -[BKThumbnailBookViewController books_disableContinuousScroll:](self, "books_disableContinuousScroll:", v4);

}

- (void)books_disableContinuousScroll:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location", a3));
  -[BKThumbnailBookViewController setLayout:](self, "setLayout:", 1);
  -[BKBookViewController setLocation:](self, "setLocation:", v4);

}

- (void)books_enableContinuousScroll:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location", a3));
  -[BKThumbnailBookViewController setLayout:](self, "setLayout:", 2);
  -[BKBookViewController setLocation:](self, "setLocation:", v4);

}

- (void)books_togglePlaying:(id)a3
{
  if (-[BKBookViewController isReadAloudPaused](self, "isReadAloudPaused", a3))
  {
    -[BKBookViewController resumeReadAloud](self, "resumeReadAloud");
  }
  else if (self->super._isReading)
  {
    -[BKBookViewController pauseReadAloud](self, "pauseReadAloud");
  }
  else
  {
    -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", 1);
  }
}

- (void)books_stopPlaying:(id)a3
{
  -[BKBookViewController setReadAloudState:](self, "setReadAloudState:", 0);
}

- (void)books_skipBackward:(id)a3
{
  -[BKBookViewController recordedTurnToPreviousChapter](self, "recordedTurnToPreviousChapter", a3);
}

- (void)books_resetZoom:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  *(_QWORD *)&v4 = objc_opt_class(BKPictureBookNavigationController).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController", v4));
  v8 = BUDynamicCast(v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = v10;
  if (v10)
  {
    objc_msgSend(v10, "zoomToSpread:", 1);
    v9 = v10;
  }

}

- (void)books_increaseZoom:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;

  *(_QWORD *)&v4 = objc_opt_class(BKPictureBookNavigationController).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController", v4));
  v8 = BUDynamicCast(v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v9 = v11;
  if (v11)
  {
    v10 = objc_msgSend(v11, "supportsSinglePageMode");
    v9 = v11;
    if (v10)
    {
      objc_msgSend(v11, "zoomToLeadingPageAnimated:", 1);
      v9 = v11;
    }
  }

}

- (void)books_decreaseZoom:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  *(_QWORD *)&v4 = objc_opt_class(BKPictureBookNavigationController).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController", v4));
  v8 = BUDynamicCast(v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = v10;
  if (v10)
  {
    objc_msgSend(v10, "zoomToSpread:", 1);
    v9 = v10;
  }

}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  objc_super v9;

  if (self->super._section != a3)
  {
    v5 = a4;
    v9.receiver = self;
    v9.super_class = (Class)BKThumbnailBookViewController;
    -[BKBookViewController setSection:animated:adjustScrollToReveal:](&v9, "setSection:animated:adjustScrollToReveal:");
    -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", v5);
    if (a3)
    {
      if (a3 == 1)
        -[BKThumbnailBookViewController makeTOCVisible](self, "makeTOCVisible");
    }
    else
    {
      -[BKThumbnailBookViewController makeContentVisible](self, "makeContentVisible");
    }
    -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", v5);
    -[BKThumbnailBookViewController updateBottomToolbar:](self, "updateBottomToolbar:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
    objc_msgSend(v8, "loadAnyMissingThumbnails");

  }
}

- (id)snapshotView:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  if (v4 <= 0.0 || (v6 = v5, v5 <= 0.0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_11D7F8((uint64_t)v3);
    v10 = 0;
  }
  else
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
    v9 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v8, v7, v6);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_F5D88;
    v12[3] = &unk_1C1C50;
    v13 = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithActions:", v12));

  }
  return v10;
}

- (id)bookContentViewControllerView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (id)directoryTOCViewControllerView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (BOOL)directoryTOCIsVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMSegmentedViewController viewIfLoaded](self->_directoryController, "viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));
  v4 = v3 != 0;

  return v4;
}

- (id)bookContentView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentView"));

  return v3;
}

- (void)bookContentViewImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
  objc_msgSend(v5, "contentViewImage:afterScreenUpdates:completion:", 1, 0, v4);

}

- (void)makeTOCVisible
{
  int64_t v3;
  void *v4;
  id v5;
  void *v6;
  BKThumbnailBookViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  BCNavigationBar *topToolbar;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double MidX;
  double v63;
  double y;
  double v65;
  double v66;
  double v67;
  double height;
  unsigned __int8 v69;
  double Width;
  double v71;
  _BOOL4 v72;
  double v73;
  void *v74;
  _UNKNOWN **v75;
  unsigned int v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  double v105;
  void *v106;
  unsigned int v107;
  double v108;
  _BOOL4 v109;
  double v110;
  BKThumbnailBookViewController *v111;
  void *v112;
  _QWORD v113[5];
  id v114;
  _QWORD v115[4];
  id v116;
  id v117;
  double v118;
  double v119;
  double v120;
  double v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;

  v3 = -[BKThumbnailBookViewController segmentIndexForDirectoryType:](self, "segmentIndexForDirectoryType:", -[BKThumbnailBookViewController directoryType](self, "directoryType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v5 = objc_msgSend(v4, "selectedIndex");

  if (v5 != (id)v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
    objc_msgSend(v6, "setSelectedIndex:", v3);

  }
  v7 = (BKThumbnailBookViewController *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewController](self, "bookContentViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewController](self, "directoryTOCViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
  if (-[BKThumbnailBookViewController isViewLoaded](v7, "isViewLoaded"))
    v10 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewControllerView](self, "bookContentViewControllerView"));
  else
    v10 = 0;
  if (v7 == self)
  {
    v12 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    v12 = v10 != (_QWORD)v11;

  }
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAlpha:", 1.0);
  v109 = v12;
  if (v12)
    -[BKThumbnailBookViewController beginAppearanceTransition:animated:](v7, "beginAppearanceTransition:animated:", 0, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  objc_msgSend(v8, "beginAppearanceTransition:animated:", 1, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v13, "insertSubview:aboveSubview:", v9, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leftAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
  objc_msgSend(v26, "setActive:", 1);

  topToolbar = self->_topToolbar;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  if (topToolbar)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar bottomAnchor](self->_topToolbar, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    objc_msgSend(v30, "setActive:", 1);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
    objc_msgSend(v31, "setActive:", 1);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v32, "layoutIfNeeded");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "selectedViewController"));

  objc_opt_class(BKThumbnailDirectory);
  v36 = BUDynamicCast(v35, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  *(_QWORD *)&v38 = objc_opt_class(BKPictureBookVerticalNavigationController).n128_u64[0];
  v40 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController", v38));
  v42 = BUDynamicCast(v40, v41);
  v112 = (void *)objc_claimAutoreleasedReturnValue(v42);

  v111 = v7;
  if ((-[BKBookViewController currentPageNumber](self, "currentPageNumber") & 1) == 0
    && -[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL"))
  {
    v43 = (void *)v10;
    v44 = 1;
    if (!v37)
      goto LABEL_31;
LABEL_20:
    v107 = v44;
    v45 = v9;
    v46 = v37;
    v47 = v34;
    v48 = v8;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController currentLocation](self, "currentLocation"));
    objc_msgSend(v46, "scrollToLocation:", v49);
    objc_msgSend(v46, "frameForThumbnailAtLocation:", v49);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    v59 = v46;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "view"));
    objc_msgSend(v58, "convertRect:fromView:", v60, v51, v53, v55, v57);
    MidX = v61;
    y = v63;
    v66 = v65;
    height = v67;

    if (v112)
    {
      if ((objc_msgSend(v112, "shouldDisplaySpread") & 1) != 0
        || -[BKThumbnailBookViewController hasSpreadPages](self, "hasSpreadPages"))
      {
        v69 = objc_msgSend(v46, "showSpreads");
        v8 = v48;
        v34 = v47;
        v9 = v45;
        if ((v69 & 1) == 0)
        {
          v122.origin.x = MidX;
          v122.origin.y = y;
          v122.size.width = v66;
          v122.size.height = height;
          Width = CGRectGetWidth(v122);
          v71 = MidX - Width;
          v72 = MidX - Width >= 0.0;
          if (v107)
            Width = -0.0;
          v73 = MidX + Width;
          if ((v107 & v72) != 0)
            MidX = v71;
          else
            MidX = v73;
          v123.origin.x = MidX;
          v123.origin.y = y;
          v123.size.width = v66;
          v123.size.height = height;
          y = y + CGRectGetHeight(v123) * -0.5;
          height = height + height;
          v66 = v66 + v66;
        }
      }
      else
      {
        v76 = objc_msgSend(v46, "showSpreads");
        v8 = v48;
        v34 = v47;
        v9 = v45;
        if (v76)
        {
          v74 = v43;
          if (v107)
          {
            v124.origin.x = MidX;
            v124.origin.y = y;
            v124.size.width = v66;
            v124.size.height = height;
            MidX = CGRectGetMidX(v124);
          }
          v7 = v111;
          v75 = &IMAccessibilityIsFKAEnabledWithKeyboardAttached_ptr;
          v37 = v59;
          v125.origin.x = MidX;
          v125.origin.y = y;
          v125.size.width = v66;
          v125.size.height = height;
          v66 = CGRectGetWidth(v125) * 0.5;
          goto LABEL_38;
        }
      }
      v74 = v43;
      v7 = v111;
      v75 = &IMAccessibilityIsFKAEnabledWithKeyboardAttached_ptr;
      v37 = v59;
    }
    else
    {
      v8 = v48;
      v74 = v43;
      v75 = &IMAccessibilityIsFKAEnabledWithKeyboardAttached_ptr;
      v34 = v47;
      v37 = v46;
      v9 = v45;
      v7 = v111;
    }
LABEL_38:

    goto LABEL_39;
  }
  v43 = (void *)v10;
  if ((-[BKBookViewController currentPageNumber](self, "currentPageNumber") & 0x8000000000000001) == 1)
  {
    v44 = !-[BKBookViewController isPageProgressionRTL](self, "isPageProgressionRTL");
    if (v37)
      goto LABEL_20;
  }
  else
  {
    v44 = 0;
    if (v37)
      goto LABEL_20;
  }
LABEL_31:
  MidX = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  v66 = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v74 = v43;
  v75 = &IMAccessibilityIsFKAEnabledWithKeyboardAttached_ptr;
LABEL_39:
  v126.origin.x = MidX;
  v126.origin.y = y;
  v126.size.width = v66;
  v126.size.height = height;
  if (!CGRectIsNull(v126) && v74 && objc_msgSend(v75[327], "areAnimationsEnabled"))
  {
    v77 = v34;
    v106 = v8;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentView](self, "bookContentView"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "snapshotViewAfterScreenUpdates:", 0));
    objc_msgSend(v78, "bounds");
    v81 = v80;
    v83 = v82;
    v85 = v84;
    v87 = v86;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    objc_msgSend(v78, "convertRect:toView:", v88, v81, v83, v85, v87);
    v90 = v89;
    v92 = v91;
    v94 = v93;
    v96 = v95;

    v108 = v92;
    v110 = v90;
    if (!v112)
    {
LABEL_57:
      v98 = v94;
      v100 = v96;
      goto LABEL_58;
    }
    v127.origin.x = v90;
    v127.origin.y = v92;
    v127.size.width = v94;
    v127.size.height = v96;
    v105 = CGRectGetWidth(v127);
    objc_msgSend(v79, "frame");
    v98 = v97;
    v100 = v99;
    if (-[BKThumbnailBookViewController hasSpreadPages](self, "hasSpreadPages")
      && (objc_msgSend(v37, "showSpreads") & 1) == 0)
    {
      if (v98 > v105)
        goto LABEL_58;
    }
    else
    {
      if (!-[BKThumbnailBookViewController hasSpreadPages](self, "hasSpreadPages")
        || !objc_msgSend(v37, "showSpreads"))
      {
        goto LABEL_57;
      }
      if (v105 + v105 == v98 && v110 - v105 >= 0.0)
        v110 = v110 - v105;
      if (v98 > v105)
        goto LABEL_58;
    }
    v128.origin.y = v108;
    v128.origin.x = v110;
    v128.size.width = v94;
    v128.size.height = v96;
    if (v100 <= CGRectGetHeight(v128))
      goto LABEL_57;
LABEL_58:
    objc_msgSend(v79, "setFrame:", v110, v108, v98, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    objc_msgSend(v101, "insertSubview:aboveSubview:", v79, v74);

    objc_msgSend(v74, "removeFromSuperview");
    objc_msgSend(v9, "setAlpha:", 0.0);
    v102 = v75[327];
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_F6844;
    v115[3] = &unk_1C1E30;
    v116 = v9;
    v117 = v79;
    v118 = MidX;
    v119 = y;
    v120 = v66;
    v121 = height;
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_F6878;
    v113[3] = &unk_1BFD90;
    v113[4] = self;
    v114 = v117;
    v103 = v117;
    objc_msgSend(v102, "animateWithDuration:animations:completion:", v115, v113, 0.2);
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    objc_msgSend(v104, "setUserInteractionEnabled:", 0);

    v8 = v106;
    v34 = v77;
    goto LABEL_59;
  }
  objc_msgSend(v74, "removeFromSuperview");
  if (v109)
    -[BKThumbnailBookViewController endAppearanceTransition](v7, "endAppearanceTransition");
  objc_msgSend(v8, "endAppearanceTransition");
LABEL_59:

}

- (void)_zoomOutAnimationDidStop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BKThumbnailBookViewController *v9;

  v4 = a3;
  v9 = (BKThumbnailBookViewController *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewController](self, "bookContentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewController](self, "directoryTOCViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(v4, "removeFromSuperview");
  if (-[BKThumbnailBookViewController isViewLoaded](v9, "isViewLoaded"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewControllerView](self, "bookContentViewControllerView"));
    objc_msgSend(v7, "removeFromSuperview");

  }
  if (v9 != self)
    -[BKThumbnailBookViewController endAppearanceTransition](v9, "endAppearanceTransition");
  objc_msgSend(v5, "endAppearanceTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v8, "setUserInteractionEnabled:", 1);

}

- (BOOL)hasSpreadPages
{
  unint64_t v2;

  -[BKThumbnailBookViewController currentPages](self, "currentPages");
  return v2 > 1;
}

- (void)makeContentVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  BKThumbnailBookViewController *v56;
  id v57;
  id v58[5];
  BOOL v59;
  id location[2];
  CGRect v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewController](self, "bookContentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewController](self, "directoryTOCViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewControllerView](self, "bookContentViewControllerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
  objc_msgSend(v4, "beginAppearanceTransition:animated:", 0, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  objc_msgSend(v3, "beginAppearanceTransition:animated:", 1, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryController](self, "directoryController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedViewController"));

  objc_opt_class(BKThumbnailDirectory);
  v18 = BUDynamicCast(v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location"));
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController currentLocation](self, "currentLocation"));
    v27 = v22;

    objc_msgSend(v19, "frameForThumbnailAtLocation:", v27);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    objc_msgSend(v36, "convertRect:fromView:", v37, v29, v31, v33, v35);
    x = v38;
    y = v39;
    width = v40;
    height = v41;

  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  if (objc_msgSend(v4, "isViewLoaded"))
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
  else
    v42 = 0;
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  if (CGRectIsNull(v61) || !v42)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    if (!v42)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController backgroundView](self, "backgroundView"));
      objc_msgSend(v50, "insertSubview:aboveSubview:", v5, v51);

LABEL_18:
      -[BKThumbnailBookViewController updateBookContentConstraints](self, "updateBookContentConstraints");
      -[BKThumbnailBookViewController updateContentScale](self, "updateContentScale");
      -[BKThumbnailBookViewController updateHUDVisibilityAnimated:](self, "updateHUDVisibilityAnimated:", 0);
      objc_msgSend(v42, "removeFromSuperview");
      objc_msgSend(v4, "endAppearanceTransition");
      objc_msgSend(v3, "endAppearanceTransition");
      goto LABEL_19;
    }
LABEL_17:
    objc_msgSend(v50, "insertSubview:aboveSubview:", v5, v42);
    goto LABEL_18;
  }
  if (!+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    goto LABEL_17;
  }
  *(_QWORD *)&v43 = objc_opt_class(BKPictureBookVerticalNavigationController).n128_u64[0];
  v45 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController", v43));
  v47 = BUDynamicCast(v45, v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

  objc_initWeak(location, self);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_F6D80;
  v52[3] = &unk_1C1E80;
  objc_copyWeak(v58, location);
  v58[1] = *(id *)&x;
  v58[2] = *(id *)&y;
  v58[3] = *(id *)&width;
  v58[4] = *(id *)&height;
  v53 = v42;
  v54 = v5;
  v59 = v48 != 0;
  v49 = v48;
  v55 = v49;
  v56 = self;
  v57 = v19;
  -[BKThumbnailBookViewController bookContentViewImage:](self, "bookContentViewImage:", v52);

  objc_destroyWeak(v58);
  objc_destroyWeak(location);

LABEL_19:
}

- (void)_zoomInAnimationDidStop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewController](self, "directoryTOCViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewController](self, "bookContentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController bookContentViewControllerView](self, "bookContentViewControllerView"));
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(v4, "removeFromSuperview");
  if (objc_msgSend(v9, "isViewLoaded"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController directoryTOCViewControllerView](self, "directoryTOCViewControllerView"));
    objc_msgSend(v7, "removeFromSuperview");

  }
  objc_msgSend(v9, "endAppearanceTransition");
  objc_msgSend(v5, "endAppearanceTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v8, "setUserInteractionEnabled:", 1);

}

- (void)updateBookmarkButton:(BOOL)a3
{
  unsigned int v4;
  __CFString *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  UIButton *bookmarkButton;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;

  v4 = -[BKBookViewController isPageBookmarked](self, "isPageBookmarked", a3);
  if (self->super._pageBookmarksFRC)
  {
    v5 = CFSTR("bookmark.fill");
    if (!v4)
      v5 = CFSTR("bookmark");
    v16 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location"));
    v7 = objc_msgSend(v6, "ordinal");
    v8 = v7 != (id)-[BKBookViewController upsellOrdinal](self, "upsellOrdinal");

  }
  else
  {
    v8 = 0;
    v16 = CFSTR("bookmark");
  }
  if (-[BKThumbnailBookViewController im_isCompactHeight](self, "im_isCompactHeight"))
    v9 = 2;
  else
    v9 = 3;
  -[UIButton setEnabled:](self->_bookmarkButton, "setEnabled:", v8);
  bookmarkButton = self->_bookmarkButton;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v16));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, v9, 17.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithConfiguration:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 0));
  -[UIButton setImage:forState:](bookmarkButton, "setImage:forState:", v14, 0);

  if ((v4 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[UIButton setTintColor:](self->_bookmarkButton, "setTintColor:", v15);

  }
  else
  {
    -[UIButton setTintColor:](self->_bookmarkButton, "setTintColor:", 0);
  }

}

- (void)_updateBuyButton
{
  id v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location"));
  v3 = objc_msgSend(v6, "ordinal");
  v4 = v3 == (id)-[BKBookViewController upsellOrdinal](self, "upsellOrdinal");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem customView](self->_buyBarButtonItem, "customView"));
  objc_msgSend(v5, "setHidden:", v4);

}

- (void)storeChangedNotification:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController storeChangedNotification:](&v4, "storeChangedNotification:", a3);
  -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", 0);
  -[BKThumbnailBookViewController _updateBuyButton](self, "_updateBuyButton");
}

- (id)scrubber
{
  BKThumbnailScrubber *scrubber;
  BKThumbnailScrubber *v4;
  void *v5;
  void *v6;
  BKThumbnailScrubber *v7;

  scrubber = self->_scrubber;
  if (!scrubber)
  {
    v4 = -[BKThumbnailScrubber initWithFrame:]([BKThumbnailScrubber alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[BKThumbnailScrubber setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKThumbnailScrubber setDelegate:](v4, "setDelegate:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    -[BKThumbnailScrubber setHidesSpine:](v4, "setHidesSpine:", objc_msgSend(v5, "hidesSpine"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
    -[BKThumbnailScrubber setStrokeColor:](v4, "setStrokeColor:", v6);

    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrub:", 64);
    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrub:", 128);
    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrubberTouchDown:", 1);
    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrubValueChanged:", 4096);
    -[BKThumbnailScrubber setLayoutDirection:](v4, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    -[BKThumbnailScrubber setBkAccessibilityDelegate:](v4, "setBkAccessibilityDelegate:", self);
    v7 = self->_scrubber;
    self->_scrubber = v4;

    scrubber = self->_scrubber;
  }
  return scrubber;
}

- (BKThumbnailScrubber)verticalScrubber
{
  BKThumbnailScrubber *verticalScrubber;
  BKThumbnailScrubber *v4;
  void *v5;
  void *v6;
  BKThumbnailScrubber *v7;

  verticalScrubber = self->_verticalScrubber;
  if (!verticalScrubber)
  {
    v4 = -[BKThumbnailScrubber initWithFrame:]([BKThumbnailScrubber alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[BKThumbnailScrubber setAutoresizingMask:](v4, "setAutoresizingMask:", 0);
    -[BKThumbnailBookViewController _contentAspectRatio](self, "_contentAspectRatio");
    -[BKThumbnailScrubber setCellAspectRatio:](v4, "setCellAspectRatio:");
    -[BKThumbnailScrubber setShowSpreads:](v4, "setShowSpreads:", 0);
    -[BKThumbnailScrubber setDelegate:](v4, "setDelegate:", self);
    -[BKThumbnailScrubber setHideThumbView:](v4, "setHideThumbView:", 1);
    -[BKThumbnailScrubber setLayoutDirection:](v4, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    -[BKThumbnailScrubber setHidesSpine:](v4, "setHidesSpine:", objc_msgSend(v5, "hidesSpine"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
    -[BKThumbnailScrubber setStrokeColor:](v4, "setStrokeColor:", v6);

    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrub:", 64);
    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrub:", 128);
    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrubberTouchDown:", 1);
    -[BKThumbnailScrubber addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, "scrubValueChanged:", 4096);
    -[BKThumbnailScrubber setBkAccessibilityDelegate:](v4, "setBkAccessibilityDelegate:", self);
    -[BKThumbnailScrubber setOrientation:](v4, "setOrientation:", 1);
    v7 = self->_verticalScrubber;
    self->_verticalScrubber = v4;

    verticalScrubber = self->_verticalScrubber;
  }
  return verticalScrubber;
}

- (id)scrubberBarButtonItem
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
  v5 = objc_msgSend(v3, "initWithCustomView:", v4);

  return v5;
}

- (void)updateScrubber:(_NSRange)a3
{
  int64_t v4;
  unint64_t v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = -[BKBookViewController pageCountExcludingUpsell](self, "pageCountExcludingUpsell", a3.location, a3.length);
  if (v4)
  {
    v5 = v4;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL
      && -[BKBookViewController controlsVisible](self, "controlsVisible")
      && -[BKThumbnailBookViewController wantsBottomToolbar](self, "wantsBottomToolbar"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
      objc_msgSend(v6, "setPageCount:", v5);

      v7 = -[BKPageNavigationViewController pageOffset](self->super._pageNavigationViewController, "pageOffset");
      if (v7 + 1 < v5)
        v8 = v7 + 1;
      else
        v8 = v5;
      if (v8 <= 1)
        v9 = 1;
      else
        v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
      objc_msgSend(v10, "setPageNumber:", v9);

      v11 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
      objc_msgSend(v11, "setProgress:", 1.0);

    }
  }
}

- (id)imageCache
{
  return self->_imageCache;
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4 pageNumber:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  objc_opt_class(BKThumbnailDirectory);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    objc_msgSend(v8, "setThumbnail:forPage:", v11, a5);
  }
  else
  {
    -[BKThumbnailScrubber setThumbnail:forPage:context:](self->_verticalScrubber, "setThumbnail:forPage:context:", v11, a5, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
    objc_msgSend(v10, "setThumbnail:forPage:context:", v11, a5, v8);

  }
}

- (id)thumbnailScrubber:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6
{
  double height;
  double width;
  BKThumbnailScrubber *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  height = a5.height;
  width = a5.width;
  v11 = (BKThumbnailScrubber *)a3;
  v12 = a6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || -[BKBookViewController upsellPageNumber](self, "upsellPageNumber") == a4)
  {
    v13 = 0;
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](v11, "track"));

    v15 = -4;
    if (v14 != v12)
      v15 = 0;
    if (self->_verticalScrubber == v11)
      v16 = 8;
    else
      v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    -[BKThumbnailBookViewController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "thumbnailForPage:asset:size:renderingCacheCallbackTarget:renderingCacheCallbackContext:priority:containerBounds:", a4, v18, self, v12, v16, width, height, v19, v20, v21, v22));

  }
  return v13;
}

- (id)thumbnailScrubber:(id)a3 pageTitleForPageNumber:(int64_t)a4
{
  return -[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", a4);
}

- (void)thumbnailScrubber:(id)a3 cancelPreviousRenderRequestsWithContext:(id)a4
{
  IMThumbnailRenderingCache *imageCache;

  imageCache = self->_imageCache;
  if (imageCache)
    -[IMThumbnailRenderingCache cancelRenderingCacheOperationsForTarget:context:](imageCache, "cancelRenderingCacheOperationsForTarget:context:", self, a4);
}

- (void)setPageNumberHudTextLabelForValidatedPageNumber:(int64_t)a3 visiblePageCount:(unint64_t)a4 validatedPageCount:(unint64_t)a5
{
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BKInfoHUD *pageNumberHUD;
  id v17;
  void *v18;
  BKInfoHUD *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:"));
  v24 = v9;
  if (!v9)
  {
    if (a4 == 2)
      v10 = a3 + 1;
    else
      v10 = a3;
    v11 = AEBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@ of %@"), &stru_1C3088, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v10, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", a5, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v15));

    goto LABEL_9;
  }
  if (a4 == 2)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", a3 + 1));
    v9 = v24;
  }
  else
  {
    v18 = 0;
  }
  if (!objc_msgSend(v9, "length") || !objc_msgSend(v18, "length"))
  {
    if (objc_msgSend(v24, "length") || !objc_msgSend(v18, "length"))
    {
      pageNumberHUD = self->_pageNumberHUD;
      v17 = v24;
      goto LABEL_16;
    }
LABEL_9:
    pageNumberHUD = self->_pageNumberHUD;
    v17 = v18;
LABEL_16:
    -[BKInfoHUD setInfoText:](pageNumberHUD, "setInfoText:", v17);
    goto LABEL_17;
  }
  v19 = self->_pageNumberHUD;
  v20 = AEBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%@-%@"), &stru_1C3088, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v24, v18));
  -[BKInfoHUD setInfoText:](v19, "setInfoText:", v23);

LABEL_17:
}

- (void)scrubValueChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  v5 = v4;
  if (self->_pageNumberHUD)
  {
    v6 = objc_msgSend(v4, "pageNumber");
    v7 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[BKThumbnailBookViewController currentPages](self, "currentPages");
        -[BKThumbnailBookViewController setPageNumberHudTextLabelForValidatedPageNumber:visiblePageCount:validatedPageCount:](self, "setPageNumberHudTextLabelForValidatedPageNumber:visiblePageCount:validatedPageCount:", v6, v9, v8);
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController scrubber](self, "scrubber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "callout"));

    if (v11)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F7D84;
      v12[3] = &unk_1BEA38;
      v12[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.2);
    }
  }

}

- (double)_infoHUDHeight
{
  unsigned int v2;
  double result;
  unsigned int v4;

  v2 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
  result = 30.0;
  if (v2)
  {
    if ((+[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge, 30.0) & 1) != 0)
    {
      return 57.0;
    }
    else
    {
      v4 = +[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityLarge);
      result = 40.0;
      if (v4)
        return 50.0;
    }
  }
  return result;
}

- (void)_updatePageNumberHUDVisible:(BOOL)a3
{
  BKInfoHUD *pageNumberHUD;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;
  id v13;

  pageNumberHUD = self->_pageNumberHUD;
  if (pageNumberHUD)
  {
    -[BKInfoHUD setAlpha:](pageNumberHUD, "setAlpha:", (double)a3);
    v5 = -[BKThumbnailBookViewController currentPages](self, "currentPages");
    v7 = v6;
    v8 = -[BKBookViewController pageCountIncludingUpsell](self, "pageCountIncludingUpsell");
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL || (v9 = v8, v8 == 0x7FFFFFFFFFFFFFFFLL))
    {
      -[BKInfoHUD setAlpha:](self->_pageNumberHUD, "setAlpha:", 0.0);
      return;
    }
    v10 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v5, v7);
    v13 = (id)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", v10));
    if (!v13)
      goto LABEL_7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    if ((objc_msgSend(v11, "hasPhysicalPages") & 1) != 0)
    {
      v12 = objc_msgSend(v13, "length");

      if (v12)
      {
LABEL_7:
        -[BKThumbnailBookViewController setPageNumberHudTextLabelForValidatedPageNumber:visiblePageCount:validatedPageCount:](self, "setPageNumberHudTextLabelForValidatedPageNumber:visiblePageCount:validatedPageCount:", v10, v7, v9);
LABEL_12:

        return;
      }
    }
    else
    {

    }
    -[BKInfoHUD setAlpha:](self->_pageNumberHUD, "setAlpha:", 0.0);
    goto LABEL_12;
  }
}

- (BOOL)shouldShowHUDs
{
  if (-[BKBookViewController section](self, "section"))
    return 0;
  if (-[BKBookViewController controlsVisible](self, "controlsVisible"))
    return 1;
  return -[BKThumbnailBookViewController catalystToolbarActive](self, "catalystToolbarActive");
}

- (void)updateHUDVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD v15[5];
  unsigned __int8 v16;
  CGRect v17;

  v3 = a3;
  if (-[BKThumbnailBookViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = -[BKThumbnailBookViewController shouldShowHUDs](self, "shouldShowHUDs");
    -[BCNavigationBar alpha](self->_topToolbar, "alpha");
    v6 = 16.0;
    if (v7 <= 0.0)
    {
      -[BCNavigationBar bounds](self->_topToolbar, "bounds");
      v6 = 8.0 - CGRectGetHeight(v17);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUDTopConstraint](self, "pageNumberHUDTopConstraint"));
    objc_msgSend(v8, "setConstant:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    objc_msgSend(v9, "setNeedsUpdateConstraints");

    -[BCNavigationBar alpha](self->_topToolbar, "alpha");
    v11 = v10 > 0.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController pageNumberHUD](self, "pageNumberHUD"));
    objc_msgSend(v12, "setIsAccessibilityElement:", v11);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_F8100;
    v15[3] = &unk_1BFD40;
    v15[4] = self;
    v16 = v5;
    v13 = objc_retainBlock(v15);
    v14 = v13;
    if (v3)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.2);
    else
      ((void (*)(_QWORD *))v13[2])(v13);

  }
}

- (id)_bk_backgroundColor
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[BCNavigationBar alpha](self->_topToolbar, "alpha");
  if (v3 > 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController themePage](self, "themePage"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorForTraitEnvironment:", self));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController traitCollection](self, "traitCollection"));
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor bc_darkSystemBackgroundForTraitCollection:](UIColor, "bc_darkSystemBackgroundForTraitCollection:", v4));
  }
  v6 = (void *)v5;

  return v6;
}

- (void)showFontPicker:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIBarButtonItem isEnabled](self->_fontBarButtonItem, "isEnabled"))
    -[BKBookViewController presentAppearanceViewControllerFromItem:](self, "presentAppearanceViewControllerFromItem:", v4);

}

- (BOOL)onlySupportsScrollingLayout
{
  return 0;
}

- (id)appearanceMenuItems
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[BKThumbnailBookViewController supportsBrightness](self, "supportsBrightness"))
    objc_msgSend(v3, "addObject:", CFSTR("BKAppearanceMenuItemBrightness"));
  if (-[BKThumbnailBookViewController supportsScrollLayout](self, "supportsScrollLayout")
    && !-[BKThumbnailBookViewController isScrolledContinuousFixedLayout](self, "isScrolledContinuousFixedLayout"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("BKAppearanceMenuItemVerticalScrollingView"));
  }
  return v3;
}

- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController location](self, "location"));
  v8.receiver = self;
  v8.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController appearanceViewController:didChangeLayout:](&v8, "appearanceViewController:didChangeLayout:", v6, a4);

  -[BKBookViewController setLocation:](self, "setLocation:", v7);
}

- (unint64_t)directoryTypeForPageThumbnails
{
  return 1;
}

- (unint64_t)directoryTypeForTOC
{
  return 2;
}

- (unint64_t)directoryTypeForBookmarks
{
  return 3;
}

- (id)documentForDirectory
{
  return 0;
}

- (id)_directoryController
{
  IMSegmentedViewController *directoryController;
  IMSegmentedViewController *v4;
  IMSegmentedViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  directoryController = self->_directoryController;
  if (!directoryController)
  {
    v4 = (IMSegmentedViewController *)objc_alloc_init((Class)IMSegmentedViewController);
    v5 = self->_directoryController;
    self->_directoryController = v4;

    -[BKThumbnailBookViewController addChildViewController:](self, "addChildViewController:", self->_directoryController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _directoryForType:](self, "_directoryForType:", -[BKThumbnailBookViewController directoryTypeForPageThumbnails](self, "directoryTypeForPageThumbnails")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _directoryForType:](self, "_directoryForType:", -[BKThumbnailBookViewController directoryTypeForTOC](self, "directoryTypeForTOC")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _directoryForType:](self, "_directoryForType:", -[BKThumbnailBookViewController directoryTypeForBookmarks](self, "directoryTypeForBookmarks")));
    v9 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v6, v7, v8, 0);
    -[IMSegmentedViewController setViewControllers:](self->_directoryController, "setViewControllers:", v9);

    directoryController = self->_directoryController;
  }
  return directoryController;
}

- (unint64_t)directoryType
{
  void *v3;
  void *v4;
  unint64_t result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController preferredLayoutCache](self, "preferredLayoutCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  self->_directoryType = (unint64_t)objc_msgSend(v3, "preferredDirectoryTypeForBook:", v4);

  result = self->_directoryType;
  if (!result)
  {
    result = -[BKThumbnailBookViewController defaultDirectoryType](self, "defaultDirectoryType");
    self->_directoryType = result;
  }
  return result;
}

- (unint64_t)defaultDirectoryType
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  if (objc_msgSend(v3, "suppressTOC"))
    v4 = -[BKThumbnailBookViewController directoryTypeForPageThumbnails](self, "directoryTypeForPageThumbnails");
  else
    v4 = -[BKThumbnailBookViewController directoryTypeForTOC](self, "directoryTypeForTOC");
  v5 = v4;

  return v5;
}

- (void)setDirectoryType:(unint64_t)a3
{
  void *v4;
  unint64_t directoryType;
  void *v6;
  int64_t v7;
  void *v8;

  if (self->_directoryType != a3)
  {
    self->_directoryType = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController preferredLayoutCache](self, "preferredLayoutCache"));
    directoryType = self->_directoryType;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    objc_msgSend(v4, "setPreferredDirectoryType:forBook:", directoryType, v6);

    v7 = -[BKThumbnailBookViewController segmentIndexForDirectoryType:](self, "segmentIndexForDirectoryType:", self->_directoryType);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _directoryController](self, "_directoryController"));
    objc_msgSend(v8, "setSelectedIndex:", v7);

    -[BKThumbnailBookViewController _updateDirectorySwitch](self, "_updateDirectorySwitch");
    -[BKBookViewController updateToolbarController](self, "updateToolbarController");
    -[BKBookViewController notifyAppIntentsInfoChanged](self, "notifyAppIntentsInfoChanged");
  }
}

- (double)_contentAspectRatio
{
  return 0.75;
}

- (id)_pageDirectory
{
  BKPageThumbnailDirectory *pageDirectory;
  BKPageThumbnailDirectory *v4;
  BKPageThumbnailDirectory *v5;

  pageDirectory = self->_pageDirectory;
  if (!pageDirectory)
  {
    v4 = objc_alloc_init(BKPageThumbnailDirectory);
    v5 = self->_pageDirectory;
    self->_pageDirectory = v4;

    -[BKPageThumbnailDirectory setPageCount:](self->_pageDirectory, "setPageCount:", -[BKBookViewController pageCountExcludingUpsell](self, "pageCountExcludingUpsell"));
    -[BKThumbnailDirectory setLayoutDirection:](self->_pageDirectory, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    -[BKThumbnailBookViewController _contentAspectRatio](self, "_contentAspectRatio");
    -[BKThumbnailDirectory setCellAspectRatio:](self->_pageDirectory, "setCellAspectRatio:");
    -[BKThumbnailBookViewController addChildViewController:](self, "addChildViewController:", self->_pageDirectory);
    pageDirectory = self->_pageDirectory;
  }
  return pageDirectory;
}

- (id)_tocDirectory
{
  BKTOCViewController *tocDirectory;
  BKTOCContentViewController *v4;
  BKTOCViewController *v5;
  BKTOCContentViewController *v6;
  void *v7;
  CGRect v9;

  tocDirectory = self->_tocDirectory;
  if (!tocDirectory)
  {
    v4 = objc_alloc_init(BKTOCContentViewController);
    -[BKTOCContentViewController setPreferredFontSize:](v4, "setPreferredFontSize:", 19.0);
    v5 = self->_tocDirectory;
    self->_tocDirectory = &v4->super;
    v6 = v4;

    -[BKTOCViewController setTocContentType:](self->_tocDirectory, "setTocContentType:", 0);
    -[BCNavigationBar frame](self->_topToolbar, "frame");
    -[BKTOCViewController setCenteringInsets:](self->_tocDirectory, "setCenteringInsets:", CGRectGetMaxY(v9), 0.0, 0.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    -[BKTOCViewController setPaginationController:](self->_tocDirectory, "setPaginationController:", v7);

    -[BKViewController setLayoutDirection:](self->_tocDirectory, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    -[BKContentViewController setLayoutDelegate:](self->_tocDirectory, "setLayoutDelegate:", self);

    tocDirectory = self->_tocDirectory;
  }
  return tocDirectory;
}

- (id)_bookmarkDirectory
{
  BKBookmarkThumbnailDirectory *bookmarkDirectory;
  BKBookmarkThumbnailDirectory *v4;
  BKBookmarkThumbnailDirectory *v5;

  bookmarkDirectory = self->_bookmarkDirectory;
  if (!bookmarkDirectory)
  {
    v4 = objc_alloc_init(BKBookmarkThumbnailDirectory);
    v5 = self->_bookmarkDirectory;
    self->_bookmarkDirectory = v4;

    -[BKThumbnailDirectory setLayoutDirection:](self->_bookmarkDirectory, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    -[BKThumbnailBookViewController _contentAspectRatio](self, "_contentAspectRatio");
    -[BKThumbnailDirectory setCellAspectRatio:](self->_bookmarkDirectory, "setCellAspectRatio:");
    -[BKThumbnailBookViewController addChildViewController:](self, "addChildViewController:", self->_bookmarkDirectory);
    bookmarkDirectory = self->_bookmarkDirectory;
  }
  return bookmarkDirectory;
}

- (id)_pdfPageDirectory
{
  BKPDFPageThumbnailDirectory *pdfPageDirectory;
  BKPDFPageThumbnailDirectory *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BKPDFPageThumbnailDirectory *v11;

  pdfPageDirectory = self->_pdfPageDirectory;
  if (!pdfPageDirectory)
  {
    v4 = objc_alloc_init(BKPDFPageThumbnailDirectory);
    -[BKThumbnailDirectory setLayoutDirection:](v4, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    -[BKThumbnailBookViewController _contentAspectRatio](self, "_contentAspectRatio");
    -[BKThumbnailDirectory setCellAspectRatio:](v4, "setCellAspectRatio:");
    -[BKPDFPageThumbnailDirectory setShowBookmarksOnly:](v4, "setShowBookmarksOnly:", 0);
    -[BKPDFPageThumbnailDirectory setShowBookmarks:](v4, "setShowBookmarks:", 1);
    *(_QWORD *)&v5 = objc_opt_class(PDFDocument).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController documentForDirectory](self, "documentForDirectory", v5));
    v9 = BUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[BKPDFPageThumbnailDirectory setPdfDocument:](v4, "setPdfDocument:", v10);

    v11 = self->_pdfPageDirectory;
    self->_pdfPageDirectory = v4;

    pdfPageDirectory = self->_pdfPageDirectory;
  }
  return pdfPageDirectory;
}

- (id)_pdfOutlineDirectory
{
  BKPDFTOCViewController *pdfOutlineDirectory;
  BKPDFTOCViewController *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BKPDFTOCViewController *v12;
  CGRect v14;

  pdfOutlineDirectory = self->_pdfOutlineDirectory;
  if (!pdfOutlineDirectory)
  {
    v4 = objc_alloc_init(BKPDFTOCViewController);
    -[BKPDFTOCViewController setPreferredFontSize:](v4, "setPreferredFontSize:", 19.0);
    -[BKTOCViewController setTocContentType:](v4, "setTocContentType:", 0);
    -[BCNavigationBar frame](self->_topToolbar, "frame");
    -[BKTOCViewController setCenteringInsets:](v4, "setCenteringInsets:", CGRectGetMaxY(v14), 0.0, 0.0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
    -[BKTOCViewController setPaginationController:](v4, "setPaginationController:", v5);

    -[BKViewController setLayoutDirection:](v4, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    -[BKContentViewController setLayoutDelegate:](v4, "setLayoutDelegate:", self);
    *(_QWORD *)&v6 = objc_opt_class(PDFDocument).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController documentForDirectory](self, "documentForDirectory", v6));
    v10 = BUDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[BKPDFTOCViewController setPdfDocument:](v4, "setPdfDocument:", v11);

    v12 = self->_pdfOutlineDirectory;
    self->_pdfOutlineDirectory = v4;

    pdfOutlineDirectory = self->_pdfOutlineDirectory;
  }
  return pdfOutlineDirectory;
}

- (id)_pdfBookmarkDirectory
{
  BKPDFPageThumbnailDirectory *pdfBookmarkDirectory;
  BKPDFPageThumbnailDirectory *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BKPDFPageThumbnailDirectory *v11;

  pdfBookmarkDirectory = self->_pdfBookmarkDirectory;
  if (!pdfBookmarkDirectory)
  {
    v4 = objc_alloc_init(BKPDFPageThumbnailDirectory);
    -[BKThumbnailDirectory setLayoutDirection:](v4, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
    -[BKThumbnailBookViewController _contentAspectRatio](self, "_contentAspectRatio");
    -[BKThumbnailDirectory setCellAspectRatio:](v4, "setCellAspectRatio:");
    -[BKPDFPageThumbnailDirectory setShowBookmarksOnly:](v4, "setShowBookmarksOnly:", 1);
    -[BKPDFPageThumbnailDirectory setShowBookmarks:](v4, "setShowBookmarks:", 1);
    *(_QWORD *)&v5 = objc_opt_class(PDFDocument).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController documentForDirectory](self, "documentForDirectory", v5));
    v9 = BUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[BKPDFPageThumbnailDirectory setPdfDocument:](v4, "setPdfDocument:", v10);

    v11 = self->_pdfBookmarkDirectory;
    self->_pdfBookmarkDirectory = v4;

    pdfBookmarkDirectory = self->_pdfBookmarkDirectory;
  }
  return pdfBookmarkDirectory;
}

- (id)_directoryForType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  switch(a3)
  {
    case 1uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _pageDirectory](self, "_pageDirectory"));
      goto LABEL_9;
    case 2uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _tocDirectory](self, "_tocDirectory"));
      goto LABEL_9;
    case 3uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _bookmarkDirectory](self, "_bookmarkDirectory"));
      goto LABEL_9;
    case 4uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _pdfPageDirectory](self, "_pdfPageDirectory"));
      goto LABEL_9;
    case 5uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _pdfOutlineDirectory](self, "_pdfOutlineDirectory"));
      goto LABEL_9;
    case 6uLL:
      v4 = objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController _pdfBookmarkDirectory](self, "_pdfBookmarkDirectory"));
LABEL_9:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
  objc_msgSend(v5, "setBook:", v6);

  *(_QWORD *)&v7 = objc_opt_class(IMTheme).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController theme](self, "theme", v7));
  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v5, "setTheme:", v12);

  objc_msgSend(v5, "setDirectoryDelegate:", self);
  return v5;
}

- (void)directorySwitchPressed:(id)a3
{
  -[BKThumbnailBookViewController setDirectoryType:](self, "setDirectoryType:", -[BKThumbnailBookViewController directoryTypeForSegmentIndex:](self, "directoryTypeForSegmentIndex:", objc_msgSend(a3, "selectedSegmentIndex")));
}

- (void)_updateDirectorySwitch
{
  char *v3;
  UISegmentedControl *directorySwitch;
  char *v5;

  v3 = -[BKThumbnailBookViewController segmentIndexForDirectoryType:](self, "segmentIndexForDirectoryType:", -[BKThumbnailBookViewController directoryType](self, "directoryType"));
  directorySwitch = self->_directorySwitch;
  if (directorySwitch)
  {
    v5 = -[UISegmentedControl numberOfSegments](directorySwitch, "numberOfSegments");
    directorySwitch = self->_directorySwitch;
    if (v3 >= v5)
    {
      v3 = (char *)-[UISegmentedControl numberOfSegments](directorySwitch, "numberOfSegments") - 1;
      directorySwitch = self->_directorySwitch;
    }
  }
  -[UISegmentedControl setSelectedSegmentIndex:](directorySwitch, "setSelectedSegmentIndex:", v3);
}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4
{
  id v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_F8D14;
  v6[3] = &unk_1BEA38;
  v6[4] = self;
  v5 = a4;
  -[BKBookViewController recordedJumpToLocation:animated:completion:](self, "recordedJumpToLocation:animated:completion:", v5, 0, v6);
  -[BKBookViewController setLocation:](self, "setLocation:", v5);

}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v7 = objc_msgSend(v6, "pageNumberForLocation:", v5);

  return (int64_t)v7;
}

- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4
{
  return -[BKBookViewController pageLocationForPageNumber:](self, "pageLocationForPageNumber:", a4);
}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  id v18;
  NSObject *v19;
  _QWORD v20[6];
  uint8_t buf[4];
  int64_t v22;

  v5 = a4;
  *(_QWORD *)&v6 = objc_opt_class(BKPictureBookVerticalNavigationController).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController", v6));
  v10 = BUDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController paginationController](self, "paginationController"));
  v13 = objc_msgSend(v12, "pageRangeForChapter:", v5);
  v15 = v14;

  v16 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v13, v15);
  v17 = v16;
  if ((unint64_t)(v16 - 1) >= 0x7FFFFFFFFFFFFFFELL)
  {
    v18 = _AEBookPluginsPageTurnLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v17;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Received invalid page number %ld", buf, 0xCu);
    }

    -[BKThumbnailBookViewController setSection:animated:adjustScrollToReveal:](self, "setSection:animated:adjustScrollToReveal:", 0, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
  }
  else if (v11)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_F8F8C;
    v20[3] = &unk_1C03B0;
    v20[4] = self;
    v20[5] = v16;
    objc_msgSend(v11, "turnToPageNumber:animated:completion:", v16, 0, v20);
  }
  else
  {
    -[BKThumbnailBookViewController setSection:animated:adjustScrollToReveal:](self, "setSection:animated:adjustScrollToReveal:", 0, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
    -[BKThumbnailBookViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v17, 0);
  }

}

- (id)thumbnailDirectory:(id)a3 thumbnailForPage:(int64_t)a4 size:(CGSize)a5 context:(id)a6
{
  void *v6;
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    height = a5.height;
    width = a5.width;
    v11 = a6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController book](self, "book"));
    -[BKThumbnailBookViewController _containerBoundsForGeometry](self, "_containerBoundsForGeometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "thumbnailForPage:asset:size:renderingCacheCallbackTarget:renderingCacheCallbackContext:priority:containerBounds:", a4, v13, self, v11, 0, width, height, v14, v15, v16, v17));

  }
  return v6;
}

- (void)thumbnailDirectory:(id)a3 cancelPreviousRenderRequestsWithContext:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController imageCache](self, "imageCache"));
  objc_msgSend(v6, "cancelRenderingCacheOperationsForTarget:context:", self, v5);

}

- (void)contentViewReady:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailBookViewController;
  -[BKBookViewController contentViewReady:](&v4, "contentViewReady:", a3);
  -[BKThumbnailBookViewController updateTopToolbar:](self, "updateTopToolbar:", 0);
  -[BKBookViewController readingLocationChanged](self, "readingLocationChanged");
}

- (UIEdgeInsets)edgeInsetsForContentViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController configuration](self, "configuration", a3));
  objc_msgSend(v4, "sideContentInset");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController configuration](self, "configuration"));
  objc_msgSend(v7, "sideContentInset");
  v9 = v8;

  v10 = 0.0;
  v11 = 0.0;
  v12 = v6;
  v13 = v9;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (id)transitionContentView
{
  void *v3;
  void *v4;

  if (-[BKThumbnailBookViewController directoryTOCIsVisible](self, "directoryTOCIsVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookViewController pageNavigationViewController](self, "pageNavigationViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));

  }
  return v3;
}

- (id)transitionContentBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController backgroundView](self, "backgroundView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColor"));

  return v3;
}

- (id)analyticsReadingSettingsData
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "brightness");
  v5 = v4;

  v6 = -[BKBookViewController layout](self, "layout");
  if (v6 - 1 > 2)
    v7 = 0;
  else
    v7 = qword_173308[v6 - 1];
  v8 = objc_alloc((Class)BAReadingSettingsData);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
  v10 = objc_msgSend(v8, "initWithScrollViewStatus:autoNightThemeStatus:backgroundColor:font:fontSize:brightnessLevel:", v7, 0, 4, &stru_1C3088, &off_1CD388, v9);

  return v10;
}

+ (BOOL)verticalScrollFeatureEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKMangaVerticalScrollModeDisabled-v2")) ^ 1;

  return v3;
}

- (BOOL)isInterfaceRTL
{
  void *v3;
  BOOL v4;

  if (!-[BKThumbnailBookViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  v4 = (char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v3, "semanticContentAttribute")) == (char *)&dword_0 + 1;

  return v4;
}

- (double)defaultPageNumberHUDWidthConstraintConstant
{
  return -32.0;
}

- (CGRect)_containerBoundsForGeometry
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController viewIfLoaded](self, "viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = v3;
  if (!v3)
  {
    if (!v2)
    {
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      goto LABEL_5;
    }
    v3 = v2;
  }
  objc_msgSend(v3, "bounds");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
LABEL_5:

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_updateToolbarPositionAndBackgroundExtension
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCNavigationBar window](self->_topToolbar, "window"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "statusBarManager"));
  objc_msgSend(v4, "defaultStatusBarHeightInOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  v6 = v5;

  if (-[BKThumbnailBookViewController im_isCompactHeight](self, "im_isCompactHeight"))
    v6 = 0.0;
  -[BCNavigationBar _setOverrideBackgroundExtension:](self->_topToolbar, "_setOverrideBackgroundExtension:", v6);
  -[NSLayoutConstraint setConstant:](self->_topBarTopConstraint, "setConstant:", v6);

}

- (void)buildHoverControlRegionWithBuilder:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MaxY;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double MinY;
  double v42;
  id v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v43 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  -[BCNavigationBar bounds](self->_topToolbar, "bounds");
  objc_msgSend(v9, "convertRect:fromView:", self->_topToolbar);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  MaxY = CGRectGetMaxY(v44);
  v19 = 0.5;
  if (-[BKBookViewController controlsVisible](self, "controlsVisible"))
    v20 = 1.0;
  else
    v20 = 0.5;
  objc_msgSend(v43, "addRegionWithRect:", v6, 0.0, v8, MaxY * v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v45.origin.x = v23;
  v45.origin.y = v25;
  v45.size.width = v27;
  v45.size.height = v29;
  v30 = CGRectGetMaxY(v45);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber superview](self->_scrubber, "superview"));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailBookViewController view](self, "view"));
    -[BKThumbnailScrubber bounds](self->_scrubber, "bounds");
    objc_msgSend(v32, "convertRect:fromView:", self->_scrubber);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    v46.origin.x = v34;
    v46.origin.y = v36;
    v46.size.width = v38;
    v19 = 0.5;
    v46.size.height = v40;
    MinY = CGRectGetMinY(v46);
  }
  else
  {
    MinY = fmax(v30 + -40.0, 0.0);
  }
  if (-[BKBookViewController controlsVisible](self, "controlsVisible"))
    v42 = 1.0;
  else
    v42 = v19;
  objc_msgSend(v43, "addRegionWithRect:", v23, v29 - (v29 - MinY) * v42, v27);

}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setPreferredLayoutCache:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLayoutCache, a3);
}

- (BCNavigationBar)topToolbar
{
  return self->_topToolbar;
}

- (BKInfoHUD)pageNumberHUD
{
  return self->_pageNumberHUD;
}

- (BKLocation)initialJumpLocation
{
  return self->_initialJumpLocation;
}

- (void)setInitialJumpLocation:(id)a3
{
  objc_storeStrong((id *)&self->_initialJumpLocation, a3);
}

- (void)setVerticalScrubber:(id)a3
{
  objc_storeStrong((id *)&self->_verticalScrubber, a3);
}

- (NSLayoutConstraint)pageNumberHUDWidthConstraint
{
  return self->_pageNumberHUDWidthConstraint;
}

- (NSString)tipContextName
{
  return self->_tipContextName;
}

- (NSLayoutConstraint)pageNumberHUDHeightConstraint
{
  return self->_pageNumberHUDHeightConstraint;
}

- (void)setPageNumberHUDHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageNumberHUDHeightConstraint, a3);
}

- (NSLayoutConstraint)pageNumberHUDTopConstraint
{
  return self->_pageNumberHUDTopConstraint;
}

- (void)setPageNumberHUDTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageNumberHUDTopConstraint, a3);
}

- (NSLayoutConstraint)topBarTopConstraint
{
  return self->_topBarTopConstraint;
}

- (void)setTopBarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topBarTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageNumberHUDTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageNumberHUDHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tipContextName, 0);
  objc_storeStrong((id *)&self->_pageNumberHUDWidthConstraint, 0);
  objc_storeStrong((id *)&self->_initialJumpLocation, 0);
  objc_storeStrong((id *)&self->_pageNumberHUD, 0);
  objc_storeStrong((id *)&self->_preferredLayoutCache, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_verticalScrubber, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_directorySwitchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_directorySwitch, 0);
  objc_storeStrong((id *)&self->_bookmarkBarButtonItem, 0);
  objc_storeStrong((id *)&self->_bookmarkButton, 0);
  objc_storeStrong((id *)&self->_buyBarButtonItem, 0);
  objc_storeStrong((id *)&self->_titleBarButtonItem, 0);
  objc_storeStrong((id *)&self->_audioBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editRedoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editUndoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editToolboxBarButtonItem, 0);
  objc_storeStrong((id *)&self->_brightnessBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tocBarButtonItem, 0);
  objc_storeStrong((id *)&self->_fontBarButtonItem, 0);
  objc_storeStrong((id *)&self->_searchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_resumeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_libraryBarButtonItem, 0);
  objc_storeStrong((id *)&self->_pdfBookmarkDirectory, 0);
  objc_storeStrong((id *)&self->_pdfOutlineDirectory, 0);
  objc_storeStrong((id *)&self->_pdfPageDirectory, 0);
  objc_storeStrong((id *)&self->_bookmarkDirectory, 0);
  objc_storeStrong((id *)&self->_tocDirectory, 0);
  objc_storeStrong((id *)&self->_pageDirectory, 0);
  objc_storeStrong((id *)&self->_directoryController, 0);
  objc_storeStrong((id *)&self->_topToolbar, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

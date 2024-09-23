@implementation DOCItemInfoViewController

- (DOCItemInfoViewController)initWithNodes:(id)a3 configuration:(id)a4 actionReporting:(id)a5
{
  id v9;
  id v10;
  id v11;
  DOCItemInfoViewController *v12;
  DOCItemInfoViewController *v13;
  void *v14;
  uint64_t v15;
  _TtC5Files32DOCItemInfoContentViewController *v16;
  _TtC5Files32DOCItemInfoContentViewController *contentViewController;
  id WeakRetained;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)DOCItemInfoViewController;
  v12 = -[DOCItemInfoViewController initWithNibName:bundle:](&v26, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_nodes, a3);
    if (objc_msgSend(v9, "count") == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      if (v14
        && +[DOCItemInfoContentViewController itemTapDrillsIntoNode:](_TtC5Files32DOCItemInfoContentViewController, "itemTapDrillsIntoNode:", v14))
      {
        v15 = objc_msgSend(v11, "isBrowserCurrentLocation:", v14) ^ 1;
LABEL_8:
        objc_storeWeak((id *)&v13->_actionReporting, v11);
        v16 = -[DOCItemInfoContentViewController initWithConfiguration:nodes:allowOpenButton:documentManager:actionManager:actionDelegate:]([_TtC5Files32DOCItemInfoContentViewController alloc], "initWithConfiguration:nodes:allowOpenButton:documentManager:actionManager:actionDelegate:", v10, v9, v15, 0, 0, 0);
        contentViewController = v13->_contentViewController;
        v13->_contentViewController = v16;

        WeakRetained = objc_loadWeakRetained((id *)&v13->_actionReporting);
        -[DOCItemInfoContentViewController setActionReporting:](v13->_contentViewController, "setActionReporting:", WeakRetained);

        -[DOCItemInfoContentViewController setShowsShareButton:](v13->_contentViewController, "setShowsShareButton:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoContentViewController scrollView](v13->_contentViewController, "scrollView"));
        objc_msgSend(v19, "setShowsVerticalScrollIndicator:", 0);

        -[DOCItemInfoContentViewController layoutMargins](v13->_contentViewController, "layoutMargins");
        -[DOCItemInfoContentViewController setLayoutMargins:](v13->_contentViewController, "setLayoutMargins:");
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoContentViewController view](v13->_contentViewController, "view"));
        objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v22 = _DocumentManagerBundle(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Info [View Controller Title]"), CFSTR("Info"), CFSTR("Localizable")));
        -[DOCItemInfoViewController setTitle:](v13, "setTitle:", v24);

        goto LABEL_9;
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = 1;
    goto LABEL_8;
  }
LABEL_9:

  return v13;
}

- (NSArray)nodes
{
  return self->_nodes;
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
  void *v10;
  void *v11;
  void *v12;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[4];

  v40.receiver = self;
  v40.super_class = (Class)DOCItemInfoViewController;
  -[DOCItemInfoViewController viewDidLoad](&v40, "viewDidLoad");
  self->_needsInitialPreferredContentSize = 1;
  self->_viewDidAppear = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v3, "setTagsWorkflowDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  -[DOCItemInfoViewController addChildViewController:](self, "addChildViewController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v7, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMarginsGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v39));
  v41[0] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layoutMarginsGuide"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v29));
  v41[1] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leftAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutMarginsGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leftAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v12));
  v41[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutMarginsGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
  v41[3] = v20;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v21, "didMoveToParentViewController:", self);

}

- (void)_updatePreferredContentSizeForFirstAppearance
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  objc_msgSend(v3, "layoutIfNeeded");

  -[DOCItemInfoViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  self->_needsInitialPreferredContentSize = 0;
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 viewDidAppear;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCItemInfoViewController;
  -[DOCItemInfoViewController systemLayoutFittingSizeDidChangeForChildContentContainer:](&v7, "systemLayoutFittingSizeDidChangeForChildContentContainer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
  {
    viewDidAppear = self->_viewDidAppear;

    if (viewDidAppear)
      -[DOCItemInfoViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  }
  else
  {

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCItemInfoViewController;
  -[DOCItemInfoViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v6)
    -[DOCItemInfoViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3 && self->_needsInitialPreferredContentSize)
    -[DOCItemInfoViewController _updatePreferredContentSizeForFirstAppearance](self, "_updatePreferredContentSizeForFirstAppearance");
  -[DOCItemInfoViewController _updateNavigationBarVisibilityAnimated:](self, "_updateNavigationBarVisibilityAnimated:", 0, a4);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_viewDidAppear = 1;
  -[DOCItemInfoViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  v5.receiver = self;
  v5.super_class = (Class)DOCItemInfoViewController;
  -[DOCItemInfoViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  self->_viewDidAppear = 0;
  v3.receiver = self;
  v3.super_class = (Class)DOCItemInfoViewController;
  -[DOCItemInfoViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCItemInfoViewController;
  -[DOCItemInfoViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  if (self->_viewDidAppear)
    -[DOCItemInfoViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)updatePreferredContentSize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (v4)
    -[DOCItemInfoViewController forceUpdatePreferredContentSize](self, "forceUpdatePreferredContentSize");
}

- (void)forceUpdatePreferredContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  DOCItemInfoViewController *v16;
  DOCItemInfoViewController *v17;
  double v18;
  double v19;
  DOCItemInfoViewController *v20;

  self->_needsInitialPreferredContentSize = 0;
  -[DOCItemInfoViewController preferredContentSize](self, "preferredContentSize");
  v4 = v3;
  if (v3 == 0.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController traitCollection](self, "traitCollection"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
      objc_msgSend(v7, "preferredContentSize");
      v9 = v8;
      v11 = v10;

      +[DOCItemInfoViewController ensureNonZeroPreferredSize:traits:](DOCItemInfoViewController, "ensureNonZeroPreferredSize:traits:", v6, v9, v11);
      v4 = v12;

    }
  }
  -[DOCItemInfoContentViewController layoutHeightForWidth:](self->_contentViewController, "layoutHeightForWidth:", v4);
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController presentationController](self, "presentationController"));
  v16 = (DOCItemInfoViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));

  if (v16 == self)
    v17 = (DOCItemInfoViewController *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
  else
    v17 = self;
  v20 = v17;
  -[DOCItemInfoViewController preferredContentSize](v17, "preferredContentSize");
  if (v19 != v4 || v18 != v14)
    -[DOCItemInfoViewController setPreferredContentSize:](v20, "setPreferredContentSize:", v4, v14);

}

- (void)_updateNavigationBarVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));

  if (-[DOCItemInfoViewController isInfoInPopoverMode](self, "isInfoInPopoverMode"))
  {
    v6 = objc_opt_class(DOCTagEditorViewController);
    v7 = objc_opt_isKindOfClass(v9, v6) ^ 1;
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
  objc_msgSend(v8, "setNavigationBarHidden:animated:", v7 & 1, v3);

}

- (void)setIsInfoInPopoverMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v3 = a3;
  self->_isInfoInPopoverMode = a3;
  -[DOCItemInfoViewController _updateNavigationBarVisibilityAnimated:](self, "_updateNavigationBarVisibilityAnimated:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
  v6 = objc_opt_class(DOCTagEditorViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));
    objc_msgSend(v8, "setIsInfoInPopoverMode:", v3);

  }
}

- (id)items
{
  return -[NSArray fpfs_syncFPItemsFromNodes](self->_nodes, "fpfs_syncFPItemsFromNodes");
}

- (void)tagsCollectionView:(id)a3 didSelectAddTagButton:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController items](self, "items", a3, a4));
  -[DOCItemInfoViewController displayAddTagsViewWithItems:](self, "displayAddTagsViewWithItems:", v5);

}

- (void)displayTagView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v11 = objc_alloc_init((Class)DOCTagEditorViewController);
  objc_msgSend(v11, "setUseCompactColorPicker:", 1);
  objc_msgSend(v11, "setDelayResizingUntilAppeared:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController items](self, "items"));
  objc_msgSend(v11, "setItems:", v3);

  objc_msgSend(v11, "setIsInfoInPopoverMode:", -[DOCItemInfoViewController isInfoInPopoverMode](self, "isInfoInPopoverMode"));
  objc_msgSend(v11, "setInTagListMode:", 1);
  objc_msgSend(v11, "maxListPresentationHeight");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintLessThanOrEqualToConstant:", v5));

  LODWORD(v9) = 1148829696;
  objc_msgSend(v8, "setPriority:", v9);
  objc_msgSend(v8, "setActive:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "pushViewController:animated:", v11, 0);

  -[DOCItemInfoViewController _updateNavigationBarVisibilityAnimated:](self, "_updateNavigationBarVisibilityAnimated:", 1);
}

- (void)displayAddTagsViewWithItems:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = objc_alloc_init((Class)DOCTagEditorViewController);
  objc_msgSend(v12, "setUseCompactColorPicker:", 1);
  objc_msgSend(v12, "setDelayResizingUntilAppeared:", 1);
  objc_msgSend(v12, "setItems:", v4);

  objc_msgSend(v12, "setIsInfoInPopoverMode:", -[DOCItemInfoViewController isInfoInPopoverMode](self, "isInfoInPopoverMode"));
  objc_msgSend(v12, "setInTagListMode:", 0);
  objc_msgSend(v12, "maxListPresentationHeight");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToConstant:", v6));

  LODWORD(v10) = 1148829696;
  objc_msgSend(v9, "setPriority:", v10);
  objc_msgSend(v9, "setActive:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController navigationController](self, "navigationController"));
  objc_msgSend(v11, "pushViewController:animated:", v12, 1);

  -[DOCItemInfoViewController _updateNavigationBarVisibilityAnimated:](self, "_updateNavigationBarVisibilityAnimated:", 1);
}

- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  void *v30;
  _BYTE v31[128];

  v5 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[DOCItemInfoViewController items](self, "items"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = v6;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tags"));
        v11 = objc_msgSend(v10, "mutableCopy");

        v12 = FPTagFromDOCTag(v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        objc_msgSend(v11, "removeObject:", v13);

        v14 = objc_alloc((Class)DOCSetTagsOperation);
        v30 = v9;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
        v29 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[DOCUndoManager shared](DOCUndoManager, "shared"));
        v18 = objc_msgSend(v14, "initWithItems:tagsLists:isUndoable:shouldClearUndoStack:undoManager:", v15, v16, 1, 0, v17);

        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000BD81C;
        v22[3] = &unk_1005BE918;
        v23 = v5;
        v24 = v9;
        objc_msgSend(v18, "setActionCompletionBlock:", v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
        objc_msgSend(v19, "scheduleAction:", v18);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v7);
  }

}

- (BOOL)isInfoInPopoverMode
{
  return self->_isInfoInPopoverMode;
}

- (BOOL)needsInitialPreferredContentSize
{
  return self->_needsInitialPreferredContentSize;
}

- (void)setNeedsInitialPreferredContentSize:(BOOL)a3
{
  self->_needsInitialPreferredContentSize = a3;
}

- (BOOL)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(BOOL)a3
{
  self->_viewDidAppear = a3;
}

- (_TtC5Files32DOCItemInfoContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_actionReporting);
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (void)doc_startPreheatIfNecessary
{
  _TtC5Files32DOCItemInfoContentViewController *contentViewController;
  _QWORD v3[5];

  contentViewController = self->_contentViewController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BD9E8;
  v3[3] = &unk_1005BE558;
  v3[4] = self;
  -[DOCItemInfoContentViewController objc_doc_preheatForPresentingWithCompletion:](contentViewController, "objc_doc_preheatForPresentingWithCompletion:", v3);
}

+ (CGSize)ensureNonZeroPreferredSize:(CGSize)a3 traits:(id)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a4;
  sub_100314900();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end

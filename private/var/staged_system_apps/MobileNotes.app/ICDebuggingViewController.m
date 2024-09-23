@implementation ICDebuggingViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDebuggingViewController;
  -[ICDebuggingViewController viewDidLoad](&v3, "viewDidLoad");
  -[ICDebuggingViewController setUpDebuggingItems](self, "setUpDebuggingItems");
  -[ICDebuggingViewController setUpDataSource](self, "setUpDataSource");
  -[ICDebuggingViewController setUpSearch](self, "setUpSearch");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDebuggingViewController;
  -[ICDebuggingViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesSearchBarWhenScrolling:", 1);

}

+ (void)setupDebuggingGestureInWindow:(id)a3
{
  id v4;
  ICShowDebugMenuGestureRecognizer *v5;

  v4 = a3;
  v5 = -[ICShowDebugMenuGestureRecognizer initWithTarget:action:]([ICShowDebugMenuGestureRecognizer alloc], "initWithTarget:action:", a1, "presentDebugView:");
  objc_msgSend(v4, "addGestureRecognizer:", v5);

}

+ (void)presentDebugView:(id)a3
{
  ICDebuggingViewController *v4;
  void *v5;
  ICDebuggingViewController *v6;
  id v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;

  v30 = a3;
  v4 = [ICDebuggingViewController alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createLayout"));
  v6 = -[ICDebuggingViewController initWithCollectionViewLayout:](v4, "initWithCollectionViewLayout:", v5);

  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v6, "dismiss:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController navigationItem](v6, "navigationItem"));
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  v9 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v10 = CFSTR("ant.circle");
  if (v9)
    v10 = CFSTR("ant");
  v11 = v10;
  v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v11));

  v14 = objc_msgSend(v12, "initWithImage:style:target:action:", v13, 0, a1, "fileRadar:");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController navigationItem](v6, "navigationItem"));
  objc_msgSend(v15, "setRightBarButtonItem:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController navigationItem](v6, "navigationItem"));
  objc_msgSend(v16, "setTitle:", CFSTR("Debugging"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController ic_embedInNavigationControllerForModalPresentation](v6, "ic_embedInNavigationControllerForModalPresentation"));
  objc_msgSend(v17, "setNavigationBarHidden:", 0);
  v18 = objc_opt_class(UIViewController);
  v19 = ICDynamicCast(v18, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    v23 = objc_opt_class(UIWindow);
    v24 = objc_opt_class(ICShowDebugMenuGestureRecognizer);
    v25 = ICDynamicCast(v24, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
    v28 = ICDynamicCast(v23, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "rootViewController"));

  }
  objc_msgSend(v22, "presentViewController:animated:completion:", v17, 1, 0);

}

+ (id)createLayout
{
  id v2;
  id v3;

  v2 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  v3 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:configuration:", &stru_100552E28, v2);

  return v3;
}

- (void)setUpSearch
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init((Class)UISearchController);
  -[ICDebuggingViewController setSearchController:](self, "setSearchController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController searchController](self, "searchController"));
  objc_msgSend(v4, "setSearchResultsUpdater:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController searchController](self, "searchController"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController searchController](self, "searchController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  objc_msgSend(v7, "setAutocapitalizationType:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController searchController](self, "searchController"));
  objc_msgSend(v8, "setObscuresBackgroundDuringPresentation:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController searchController](self, "searchController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setSearchController:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setHidesSearchBarWhenScrolling:", 0);

  -[ICDebuggingViewController setCanShowRecentItems:](self, "setCanShowRecentItems:", 0);
}

- (void)confirmDestructiveActionWithTitle:(id)a3 message:(id)a4 buttonText:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100096F78;
  v16[3] = &unk_100550B10;
  v17 = v10;
  v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 2, v16));

  objc_msgSend(v12, "addAction:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v12, "addAction:", v15);

  -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)setUpDataSource
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_opt_class(ICDebuggingItemCell);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000971E8;
  v18[3] = &unk_100552E50;
  objc_copyWeak(&v19, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v3, v18));
  v5 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController collectionView](self, "collectionView"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100097354;
  v16[3] = &unk_100552E78;
  v7 = v4;
  v17 = v7;
  v8 = objc_msgSend(v5, "initWithCollectionView:cellProvider:", v6, v16);
  -[ICDebuggingViewController setDiffableDataSource:](self, "setDiffableDataSource:", v8);

  v9 = objc_opt_class(ICDebuggingItemHeader);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100097368;
  v14[3] = &unk_100552EA0;
  objc_copyWeak(&v15, &location);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100097518;
  v12[3] = &unk_100552EC8;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v9, UICollectionElementKindSectionHeader, v14));
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v11, "setSupplementaryViewProvider:", v12);

  -[ICDebuggingViewController reloadDataAnimated:](self, "reloadDataAnimated:", 0);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)reloadDataAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController createSnapshot](self, "createSnapshot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v5, "applySnapshot:animatingDifferences:", v6, v3);

}

- (id)createSnapshot
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  if (-[ICDebuggingViewController shouldShowRecentItems](self, "shouldShowRecentItems"))
  {
    v12 = CFSTR("RECENT");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController recentItems](self, "recentItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_map:", &stru_100552F08));

    objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, CFSTR("RECENT"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController filteredSections](self, "filteredSections"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_map:", &stru_100552F48));

    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController filteredSections](self, "filteredSections"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10009770C;
    v10[3] = &unk_100552F90;
    v11 = v3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
  return v3;
}

- (void)addRecentItemWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController recentItemIdentifiers](self, "recentItemIdentifiers"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = objc_msgSend(v5, "indexOfObject:", v8);
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removeObjectAtIndex:", v6);
  objc_msgSend(v5, "insertObject:atIndex:", v8, 0);
  v7 = objc_msgSend(v5, "copy");
  -[ICDebuggingViewController setRecentItemIdentifiers:](self, "setRecentItemIdentifiers:", v7);

}

- (void)clearRecentItems
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("DebuggingRecentItemIdentifiers"));

  -[ICDebuggingViewController reloadDataAnimated:](self, "reloadDataAnimated:", -[ICDebuggingViewController disableSearchResultsAnimation](self, "disableSearchResultsAnimation") ^ 1);
}

- (void)setRecentItemIdentifiers:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("DebuggingRecentItemIdentifiers"));

}

- (NSArray)recentItemIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayForKey:", CFSTR("DebuggingRecentItemIdentifiers")));
  v4 = v3;
  if (!v3)
    v3 = &__NSArray0__struct;
  v5 = v3;

  return v5;
}

- (NSArray)recentItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController allSections](self, "allSections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_flatMap:", &stru_100552FD0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_map:", &stru_100552FF0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController recentItemIdentifiers](self, "recentItemIdentifiers"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100097A54;
  v11[3] = &unk_100553018;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_compactMap:", v11));

  return (NSArray *)v9;
}

- (void)toggleDebuggingItemWithDefaultsKey:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v8, "BOOLForKey:", v7) ^ 1, v7);

  v9 = objc_opt_class(ICDebuggingItemCell);
  v10 = ICDynamicCast(v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "item"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController diffableDataSource](self, "diffableDataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "snapshot"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v17 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    objc_msgSend(v14, "reconfigureItemsWithIdentifiers:", v16);

  }
}

- (void)dismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController presentingViewController](self, "presentingViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)disableSearchResultsAnimation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DebuggingDisableSearchAnimation"));

  return v3;
}

+ (void)fileRadar:(id)a3
{
  +[ICRadarUtilities createRadarWithTitle:description:](ICRadarUtilities, "createRadarWithTitle:description:", &stru_1005704B8, &stru_1005704B8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (*v12)(ICDebuggingViewController *, id, void *);
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v6 = a3;
  if (-[ICDebuggingViewController shouldShowRecentItems](self, "shouldShowRecentItems"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController recentItems](self, "recentItems"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController filteredSections](self, "filteredSections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v15, "section")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v15, "row")));
  v11 = objc_msgSend(v10, "selector");
  v12 = (void (*)(ICDebuggingViewController *, id, void *))-[ICDebuggingViewController methodForSelector:](self, "methodForSelector:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v15));
  v12(self, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  -[ICDebuggingViewController addRecentItemWithIdentifier:](self, "addRecentItemWithIdentifier:", v14);

  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v15, 1);
}

- (void)willPresentSearchController:(id)a3
{
  -[ICDebuggingViewController setCanShowRecentItems:](self, "setCanShowRecentItems:", 1);
}

- (void)willDismissSearchController:(id)a3
{
  -[ICDebuggingViewController setCanShowRecentItems:](self, "setCanShowRecentItems:", 0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  if (objc_msgSend(v5, "length"))
    v6 = 0;
  else
    v6 = objc_msgSend(v7, "isActive");
  -[ICDebuggingViewController setCanShowRecentItems:](self, "setCanShowRecentItems:", v6);

  -[ICDebuggingViewController reloadDataAnimated:](self, "reloadDataAnimated:", -[ICDebuggingViewController disableSearchResultsAnimation](self, "disableSearchResultsAnimation") ^ 1);
}

- (void)setUpDebuggingItems
{
  void *v2;
  void *v3;
  ICDebuggingItem *v4;
  ICDebuggingItem *v5;
  ICDebuggingItem *v6;
  ICDebuggingItem *v7;
  ICDebuggingItem *v8;
  ICDebuggingItem *v9;
  ICDebuggingItem *v10;
  ICDebuggingItem *v11;
  ICDebuggingItem *v12;
  ICDebuggingItem *v13;
  ICDebuggingItem *v14;
  ICDebuggingItem *v15;
  ICDebuggingItem *v16;
  ICDebuggingItem *v17;
  ICDebuggingItem *v18;
  ICDebuggingItem *v19;
  ICDebuggingItem *v20;
  ICDebuggingItem *v21;
  ICDebuggingItem *v22;
  ICDebuggingItem *v23;
  ICDebuggingItem *v24;
  ICDebuggingItem *v25;
  ICDebuggingItem *v26;
  unsigned int v27;
  __CFString *v28;
  __CFString *v29;
  ICDebuggingItem *v30;
  ICDebuggingItem *v31;
  ICDebuggingItem *v32;
  ICDebuggingItem *v33;
  ICDebuggingItem *v34;
  ICDebuggingItem *v35;
  ICDebuggingItem *v36;
  ICDebuggingItem *v37;
  ICDebuggingItem *v38;
  ICDebuggingItem *v39;
  ICDebuggingItem *v40;
  ICDebuggingItem *v41;
  ICDebuggingItem *v42;
  ICDebuggingItem *v43;
  ICDebuggingItem *v44;
  ICDebuggingItem *v45;
  ICDebuggingItem *v46;
  ICDebuggingItem *v47;
  ICDebuggingItem *v48;
  ICDebuggingItem *v49;
  ICDebuggingItem *v50;
  ICDebuggingSection *v51;
  ICDebuggingItem *v52;
  ICDebuggingItem *v53;
  ICDebuggingItem *v54;
  ICDebuggingItem *v55;
  ICDebuggingItem *v56;
  void *v57;
  ICDebuggingSection *v58;
  ICDebuggingItem *v59;
  ICDebuggingItem *v60;
  void *v61;
  ICDebuggingSection *v62;
  ICDebuggingSection *v63;
  void *v64;
  id v65;
  ICDebuggingItem *v66;
  ICDebuggingItem *v67;
  ICDebuggingItem *v68;
  void *v69;
  ICDebuggingItem *v70;
  void *v71;
  ICDebuggingItem *v72;
  ICDebuggingItem *v73;
  ICDebuggingItem *v74;
  ICDebuggingItem *v75;
  ICDebuggingItem *v76;
  ICDebuggingItem *v77;
  ICDebuggingItem *v78;
  ICDebuggingItem *v79;
  ICDebuggingItem *v80;
  void *v81;
  ICDebuggingItem *v82;
  ICDebuggingItem *v83;
  void *v84;
  ICDebuggingItem *v85;
  void *v86;
  ICDebuggingItem *v87;
  ICDebuggingItem *v88;
  ICDebuggingItem *v89;
  ICDebuggingItem *v90;
  ICDebuggingItem *v91;
  void *v92;
  ICDebuggingItem *v93;
  ICDebuggingItem *v94;
  ICDebuggingItem *v95;
  ICDebuggingItem *v96;
  ICDebuggingItem *v97;
  ICDebuggingItem *v98;
  ICDebuggingItem *v99;
  ICDebuggingItem *v100;
  ICDebuggingItem *v101;
  ICDebuggingItem *v102;
  void *v103;
  ICDebuggingItem *v104;
  void *v105;
  ICDebuggingItem *v106;
  void *v107;
  ICDebuggingItem *v108;
  ICDebuggingItem *v109;
  ICDebuggingItem *v110;
  ICDebuggingItem *v111;
  ICDebuggingItem *v112;
  ICDebuggingItem *v113;
  ICDebuggingItem *v114;
  ICDebuggingItem *v115;
  void *v116;
  ICDebuggingItem *v117;
  ICDebuggingItem *v118;
  void *v119;
  ICDebuggingItem *v120;
  ICDebuggingItem *v121;
  ICDebuggingItem *v122;
  ICDebuggingItem *v123;
  ICDebuggingItem *v124;
  void *v125;
  ICDebuggingItem *v126;
  ICDebuggingItem *v127;
  ICDebuggingItem *v128;
  ICDebuggingItem *v130;
  ICDebuggingItem *v131;
  void *v132;
  ICDebuggingItem *v133;
  ICDebuggingItem *v134;
  ICDebuggingItem *v135;
  ICDebuggingItem *v136;
  ICDebuggingItem *v137;
  ICDebuggingItem *v138;
  void *v139;
  ICDebuggingItem *v140;
  ICDebuggingItem *v141;
  ICDebuggingItem *v142;
  ICDebuggingItem *v143;
  ICDebuggingItem *v144;
  ICDebuggingItem *v145;
  ICDebuggingSection *v146;
  ICDebuggingItem *v147;
  ICDebuggingSection *v148;
  ICDebuggingSection *v149;
  ICDebuggingSection *v150;
  ICDebuggingSection *v151;
  ICDebuggingSection *v152;
  ICDebuggingSection *v153;
  ICDebuggingSection *v154;
  ICDebuggingSection *v155;
  ICDebuggingSection *v156;
  ICDebuggingSection *v157;
  ICDebuggingSection *v158;
  ICDebuggingSection *v159;
  void *v160;
  _QWORD v161[2];
  _QWORD v162[4];
  ICDebuggingItem *v163;
  _QWORD v164[10];
  _QWORD v165[2];
  ICDebuggingItem *v166;
  _QWORD v167[5];
  _QWORD v168[10];
  ICDebuggingItem *v169;
  ICDebuggingItem *v170;
  _QWORD v171[8];
  _QWORD v172[2];
  _QWORD v173[5];
  _QWORD v174[5];
  ICDebuggingItem *v175;
  ICDebuggingItem *v176;
  ICDebuggingItem *v177;
  ICDebuggingItem *v178;
  ICDebuggingItem *v179;
  ICDebuggingItem *v180;
  ICDebuggingItem *v181;
  ICDebuggingItem *v182;
  ICDebuggingItem *v183;
  ICDebuggingItem *v184;
  ICDebuggingItem *v185;
  ICDebuggingItem *v186;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v3));

  v145 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Auto Sort Checklist Alert"), "resetAutoSortChecklistAlert:");
  v181 = v145;
  v182 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Recently Deleted Warning"), "resetRecentlyDeletedWarning:");
  v144 = v182;
  v143 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Update Drawings Alert"), "resetUpdateDrawingsAlert:");
  v183 = v143;
  v184 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Test Allow Notifications Warming Sheet"), "testAllowNotificationsWarmingSheet:");
  v142 = v184;
  v141 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Test Notifications Not Allowed Alert"), "testNotificationsNotAllowedAlert:");
  v185 = v141;
  v186 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Test Notes TTR"), "testTTR:");
  v140 = v186;
  v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v181, 6));
  v159 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Alerts"), v139);
  v138 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Dump Identifiers"), "dumpAnalyticsIdentifiers:");
  v175 = v138;
  v176 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Regenerate Identifiers"), "regenerateAnalyticsIdentifiers:");
  v137 = v176;
  v136 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Clear Identifiers"), "clearAnalyticsIdentifiers:");
  v177 = v136;
  v178 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Simulate Background Snapshot"), "simulateBackgroundSnapshot:");
  v135 = v178;
  v134 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Simulate Background Snapshot Expiration"), "simulateBackgroundSnapshotExpiration:");
  v179 = v134;
  v180 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Fire Cloud Error Domain=nil"), "triggerCloudOperationEndEventWithNilErrorDomain:");
  v133 = v180;
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v175, 6));
  v158 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Analytics"), v132);
  v4 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Refresh From Cloud"), "syncLocalWithCloud:");
  v5 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Push Everything to Cloud"), "pushEverythingToCloud:");
  v6 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Delete Cloud Change Tokens"), "deleteServerChangeTokens:");
  v7 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Cloud Configuration"), "setCloudConfiguration:");
  -[ICDebuggingItem setPresenter:](v7, "setPresenter:", 1);
  v131 = v4;
  v174[0] = v4;
  v174[1] = v5;
  v130 = v5;
  v128 = v6;
  v174[2] = v6;
  v174[3] = v7;
  v127 = v7;
  v126 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Server Side Update Task State"), "resetServerSideUpdateTaskState:");
  v174[4] = v126;
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v174, 5));
  v157 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Cloud"), v125);
  v8 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Delete Data"), "purgeEverything:");
  -[ICDebuggingItem setDestructive:](v8, "setDestructive:", 1);
  -[ICDebuggingItem setPresenter:](v8, "setPresenter:", 1);
  -[ICDebuggingItem setSubtitle:](v8, "setSubtitle:", CFSTR("Keep in Cloud"));
  v9 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Delete Data"), "deleteEverything:");
  -[ICDebuggingItem setDestructive:](v9, "setDestructive:", 1);
  -[ICDebuggingItem setPresenter:](v9, "setPresenter:", 1);
  -[ICDebuggingItem setSubtitle:](v9, "setSubtitle:", CFSTR("Delete From Cloud"));
  v10 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Load Test Data"), "loadTestData:");
  -[ICDebuggingItem setPresenter:](v10, "setPresenter:", 1);
  v11 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Add 1000 Random Notes"), "addSomeRandomNotes:");
  v12 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Add Folders With Random Notes"), "addSomeFoldersWithRandomNotesToAllModernAccounts:");
  -[ICDebuggingItem setSubtitle:](v12, "setSubtitle:", CFSTR("Adds to all ICAccounts"));
  v124 = v8;
  v173[0] = v8;
  v123 = v9;
  v173[1] = v9;
  v122 = v10;
  v173[2] = v10;
  v121 = v11;
  v173[3] = v11;
  v120 = v12;
  v173[4] = v12;
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v173, 5));
  v156 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Data"), v119);
  v13 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Disable Search Results Animation"), "disableDebuggingSearchAnimation:");
  -[ICDebuggingItem setSelectedDefaultsKey:](v13, "setSelectedDefaultsKey:", CFSTR("DebuggingDisableSearchAnimation"));
  v14 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Grey Parrot UI"), "toggleGreyParrotUI:");
  -[ICDebuggingItem setSelectedDefaultsKey:](v14, "setSelectedDefaultsKey:", CFSTR("DebuggingGreyParrotUI"));
  v118 = v13;
  v172[0] = v13;
  v117 = v14;
  v172[1] = v14;
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v172, 2));
  v155 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Debugging UI"), v116);
  v15 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Migrate Primary iCloud Account"), "migratePrimaryICloudAccount:");
  v16 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Migrate Local Account"), "migrateLocalAccount:");
  v17 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Delete Migrated Duplicates"), "deleteMigratedDuplicates:");
  v18 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Local Account Migration"), "resetLocalAccountMigration:");
  v19 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Migration"), "startFresh:");
  v20 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Pencil Unsupported Alert State"), "resetPencilUnsupportedAlertState:");
  v21 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Simplified UITextView Editor"), "showSimplifiedUITextViewEditor:");
  -[ICDebuggingItem setPresenter:](v21, "setPresenter:", 1);
  v22 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Simplified WKWebView Editor"), "showSimplifiedWebEditor:");
  -[ICDebuggingItem setPresenter:](v22, "setPresenter:", 1);
  v114 = v16;
  v115 = v15;
  v171[0] = v15;
  v171[1] = v16;
  v112 = v18;
  v113 = v17;
  v171[2] = v17;
  v171[3] = v18;
  v110 = v20;
  v111 = v19;
  v171[4] = v19;
  v171[5] = v20;
  v108 = v22;
  v109 = v21;
  v171[6] = v21;
  v171[7] = v22;
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v171, 8));
  v154 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Legacy"), v107);
  v23 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Send State of the World"), "sendStateOfTheWorld:");
  -[ICDebuggingItem setPresenter:](v23, "setPresenter:", 1);
  v106 = v23;
  v170 = v23;
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v170, 1));
  v153 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Logging"), v105);
  v24 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Toggle Non-Contiguous Layout"), "toggleNonContiguousLayout:");
  -[ICDebuggingItem setPresenter:](v24, "setPresenter:", 1);
  v104 = v24;
  v169 = v24;
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v169, 1));
  v152 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Note Editor View"), v103);
  v25 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Remove Account Passwords"), "removeAccountPassword:");
  v26 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Locked Notes Mode"), "resetLockedNotesMode:");
  v27 = objc_msgSend(v160, "ic_allSatisfy:", &stru_100553058);
  v28 = CFSTR("Enable v1 Neo Support");
  if (v27)
    v28 = CFSTR("Disable v1 Neo Support");
  v29 = v28;
  v30 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", v29, "toggleSupportsV1Neo:");

  v31 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset v1 Neo Support"), "resetSupportsV1Neo:");
  v32 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Migrate to Custom Password Mode"), "migrateToCustomPasswordMode:");
  v33 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Migrate to Device Passcode Mode"), "migrateToDevicePasscodeMode:");
  v34 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Password"), "resetPassword:");
  v35 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Add Diverged Attachment"), "addDivergedAttachment:");
  v36 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Fix Diverged Attachments"), "fixDivergedAttachments:");
  v101 = v26;
  v102 = v25;
  v168[0] = v25;
  v168[1] = v26;
  v99 = v31;
  v100 = v30;
  v168[2] = v30;
  v168[3] = v31;
  v97 = v33;
  v98 = v32;
  v168[4] = v32;
  v168[5] = v33;
  v95 = v35;
  v96 = v34;
  v168[6] = v34;
  v168[7] = v35;
  v93 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Check Keychain Sync"), "checkiCloudKeychainSyncStatus:");
  v94 = v36;
  v168[8] = v36;
  v168[9] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v168, 10));
  v151 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Password Protected Notes"), v92);
  v37 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Pre-fetch Other-App-Indexed Hashtags"), "prefetchHashtagsIndexedByOtherApps:");
  v38 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Log Other-App-Indexed Hashtags"), "logHashtagsIndexedByOtherApps:");
  v39 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Delete Search Index"), "deleteSearchIndex:");
  v90 = v38;
  v91 = v37;
  v167[0] = v37;
  v167[1] = v38;
  v88 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Refresh Search Index"), "reindexEverything:");
  v89 = v39;
  v167[2] = v39;
  v167[3] = v88;
  v87 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Log Index"), "logSearchIndex:");
  v167[4] = v87;
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v167, 5));
  v150 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Search Index"), v86);
  v40 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Create partially supported Smart Folder"), "createPartiallySupportedSmartFolder:");
  -[ICDebuggingItem setSubtitle:](v40, "setSubtitle:", CFSTR("Uses Pinned Notes Query"));
  v85 = v40;
  v166 = v40;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v166, 1));
  v149 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Smart Folders"), v84);
  v41 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Delete All Tags"), "deleteAllTags:");
  v82 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Regenerate Standardized Contents"), "regenerateStandardizedContentForAllHashtags:");
  v83 = v41;
  v165[0] = v41;
  v165[1] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v165, 2));
  v148 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Tags"), v81);
  v147 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Regenerate Attachment Previews"), "regenerateAllAttachmentPreviewImages:");
  v42 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Regenerate OCR"), "regenerateAllOCR:");
  v43 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Regenerate Image Classifications"), "regenerateAllImageClassifications:");
  v44 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Regenerate Handwriting Summaries"), "regenerateAllHandwritingSummaries:");
  v45 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Purge Handwriting Summaries"), "purgeAllHandwritingSummaries:");
  v46 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Regenerate System Paper Thumbnails"), "regenerateSystemPaperThumbnails:");
  v47 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Generate System Paper Chrome"), "generateSystemPaperChrome:");
  -[ICDebuggingItem setPresenter:](v47, "setPresenter:", 1);
  v48 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Delete Doc Cam PDFs"), "deleteDocCamPDFs:");
  v49 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Generate Fallback Image For Sketches"), "generateFallbackImageForSketches:");
  -[ICDebuggingItem setSelectedDefaultsKey:](v49, "setSelectedDefaultsKey:", ICGenerateFallbackImageForSketchesDefaultKey);
  v50 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Disable Fallback PDF Generation"), "generateFallbackPDFForPaperDocuments:");
  -[ICDebuggingItem setSelectedDefaultsKey:](v50, "setSelectedDefaultsKey:", ICDisableFallbackPDFGenerationDefaultKey);
  v164[0] = v147;
  v79 = v43;
  v80 = v42;
  v164[1] = v42;
  v164[2] = v43;
  v77 = v45;
  v78 = v44;
  v164[3] = v44;
  v164[4] = v45;
  v75 = v47;
  v76 = v46;
  v164[5] = v46;
  v164[6] = v47;
  v73 = v49;
  v74 = v48;
  v164[7] = v48;
  v164[8] = v49;
  v72 = v50;
  v164[9] = v50;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v164, 10));
  v51 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Thumbnails, Previews, and OCR"), v71);
  v52 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Toggle Force Show Bluetooth Keyboard Hint"), "bluetoothKeyboardHint:");
  -[ICDebuggingItem setSubtitle:](v52, "setSubtitle:", CFSTR("After note editor keyboard dismissal"));
  v70 = v52;
  v163 = v52;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v163, 1));
  v146 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("visionOS"), v69);
  v53 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Reset Welcome Screen State"), "resetWelcomeScreenState:");
  v54 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Remove Version"), "removeWhatsNewVersion:");
  v55 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Set to Current OS"), "setWhatsNewToCurrentOS:");
  v56 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Set to iOS 9"), "setWhatsNewToIOS9:");
  v67 = v54;
  v68 = v53;
  v162[0] = v53;
  v162[1] = v54;
  v66 = v55;
  v162[2] = v55;
  v162[3] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v162, 4));
  v58 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Welcome and What's New Screen"), v57);
  v59 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Crash This App"), "crashThisApp:");
  v60 = -[ICDebuggingItem initWithTitle:selector:]([ICDebuggingItem alloc], "initWithTitle:selector:", CFSTR("Run App Removal Service"), "testAppRemoval:");
  -[ICDebuggingItem setPresenter:](v60, "setPresenter:", 1);
  v161[0] = v59;
  v161[1] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v161, 2));
  v62 = -[ICDebuggingSection initWithTitle:items:]([ICDebuggingSection alloc], "initWithTitle:items:", CFSTR("Danger Zone"), v61);
  -[ICDebuggingSection setDestructive:](v62, "setDestructive:", 1);
  v63 = v51;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v159, v158, v157, v156, v155, v154, v153, v152, v151, v150, v149, v148, v51, 0));
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    objc_msgSend(v64, "addObject:", v146);
  objc_msgSend(v64, "addObject:", v58);
  objc_msgSend(v64, "addObject:", v62);
  v65 = objc_msgSend(v64, "copy");
  -[ICDebuggingViewController setAllSections:](self, "setAllSections:", v65);

}

- (NSArray)filteredSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController searchController](self, "searchController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController searchController](self, "searchController"));
  if (!objc_msgSend(v7, "isActive"))
  {

    goto LABEL_17;
  }
  v8 = objc_msgSend(v6, "length");

  if (!v8)
  {
LABEL_17:
    v22 = (id)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController allSections](self, "allSections"));
    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController allSections](self, "allSections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController allSections](self, "allSections"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));

        if (objc_msgSend(v18, "containsString:", v6))
        {
          objc_msgSend(v10, "addObject:", v16);
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000994D8;
          v24[3] = &unk_100553080;
          v25 = v6;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ic_objectsPassingTest:", v24));

          if (objc_msgSend(v20, "count"))
          {
            v21 = objc_msgSend(v16, "copy");
            objc_msgSend(v21, "setItems:", v20);
            objc_msgSend(v10, "addObject:", v21);

          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  v22 = objc_msgSend(v10, "copy");
LABEL_18:

  return (NSArray *)v22;
}

- (void)setCanShowRecentItems:(BOOL)a3
{
  if (self->_canShowRecentItems != a3)
  {
    self->_canShowRecentItems = a3;
    -[ICDebuggingViewController reloadDataAnimated:](self, "reloadDataAnimated:", 0);
  }
}

- (BOOL)shouldShowRecentItems
{
  void *v3;
  BOOL v4;

  if (!-[ICDebuggingViewController canShowRecentItems](self, "canShowRecentItems"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController recentItems](self, "recentItems"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)resetAutoSortChecklistAlert:(id)a3
{
  +[ICTextController setChecklistAutoAlertShown:](ICTextController, "setChecklistAutoAlertShown:", 0);
  +[ICTextController setChecklistAutoSortEnabled:](ICTextController, "setChecklistAutoSortEnabled:", 0);
}

- (void)resetRecentlyDeletedWarning:(id)a3
{
  +[ICDeleteDecision setDidShowMoveToRecentlyDeletedFolderAlert:](ICDeleteDecision, "setDidShowMoveToRecentlyDeletedFolderAlert:", 0);
}

- (void)resetUpdateDrawingsAlert:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  objc_msgSend(v3, "removeObjectForKey:", kICDidAlertAboutUpdatingDrawingsFall2021);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObjectForKey:", kICDidAlertAboutUpdatingDrawingsFall2022);

}

- (void)testAllowNotificationsWarmingSheet:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance", a3));
  objc_msgSend(v3, "showAllowNotificationsWarmingSheet:", &stru_1005530A0);

}

- (void)testNotificationsNotAllowedAlert:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerManagers"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "folderListViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));

  objc_msgSend(v6, "setShouldShowAllowNotificationsView:", 1);
}

- (void)testTTR:(id)a3
{
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICDebuggingViewController testTTR:]", 1, 1, CFSTR("Testing a TTR from iOS"));
}

- (void)dumpAnalyticsIdentifiers:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager", a3));
  objc_msgSend(v3, "debug_dumpIdentifiers");

}

- (void)regenerateAnalyticsIdentifiers:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager", a3));
  objc_msgSend(v3, "debug_forceRegenerateIdentifiers");

}

- (void)clearAnalyticsIdentifiers:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager", a3));
  objc_msgSend(v3, "debug_clearIdentifiers");

}

- (void)simulateBackgroundSnapshot:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[ICNASnapshotBackgroundTask makeTaskRequest](ICNASnapshotBackgroundTask, "makeTaskRequest", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGTaskScheduler sharedScheduler](BGTaskScheduler, "sharedScheduler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v3, "_simulateLaunchForTaskWithIdentifier:", v4);

}

- (void)simulateBackgroundSnapshotExpiration:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[ICNASnapshotBackgroundTask makeTaskRequest](ICNASnapshotBackgroundTask, "makeTaskRequest", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGTaskScheduler sharedScheduler](BGTaskScheduler, "sharedScheduler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v3, "_simulateExpirationForTaskWithIdentifier:", v4);

}

- (void)triggerCloudOperationEndEventWithNilErrorDomain:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];

  v3 = objc_alloc((Class)ICASAccountData);
  v4 = objc_msgSend(objc_alloc((Class)ICASAccountType), "initWithAccountType:", 1);
  v5 = objc_msgSend(v3, "initWithAccountType:accountID:", v4, CFSTR("Test_Account_ID_For_Nil_Error_Domain"));

  v6 = objc_alloc((Class)ICASCloudOperationData);
  v7 = objc_msgSend(objc_alloc((Class)ICASOperationType), "initWithOperationType:", 5);
  v8 = objc_msgSend(v6, "initWithOperationID:operationType:operationGroupName:", CFSTR("Test_Operation_ID_For_Nil_Error_Domain"), v7, CFSTR("Test_Group_Name_For_Nil_Error_Domain"));

  v9 = objc_msgSend(objc_alloc((Class)ICASCloudSyncableData), "initWithSyncableDataSummary:", &__NSArray0__struct);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%ld"), 0, 7));
  v11 = objc_alloc((Class)ICASFullErrorData);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 7));
  v13 = objc_msgSend(v11, "initWithFullErrorCode:errorString:", v12, v10);

  v14 = objc_msgSend(objc_alloc((Class)ICASErrorStatus), "initWithErrorStatus:", 3);
  v15 = objc_msgSend(objc_alloc((Class)ICASCloudErrorData), "initWithErrorStatus:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  v17 = objc_opt_class(ICASCloudOperationEndEvent);
  v19[0] = v5;
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v13;
  v19[4] = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 5));
  objc_msgSend(v16, "submitEventOfType:pushThenPopDataObjects:subTracker:", v17, v18, 0);

}

- (void)syncLocalWithCloud:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext", a3));
  objc_msgSend(v3, "syncWithReason:completionHandler:", CFSTR("DebugMenu-RefreshFromCloud"), 0);

}

- (void)pushEverythingToCloud:(id)a3
{
  +[ICDebugUtilities pushEverythingToCloud](ICDebugUtilities, "pushEverythingToCloud", a3);
}

- (void)deleteServerChangeTokens:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext", a3));
  objc_msgSend(v3, "clearZoneFetchState");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  objc_msgSend(v4, "deleteAllServerChangeTokens");

}

- (void)setCloudConfiguration:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Cloud Configuration"), CFSTR("How often would you like to sync your notes?"), 1));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration availableConfigurationURLs](ICCloudConfiguration, "availableConfigurationURLs"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByDeletingPathExtension"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration defaultConfigurationURL](ICCloudConfiguration, "defaultConfigurationURL"));
        v12 = objc_msgSend(v8, "isEqual:", v11);

        if (v12)
        {
          v13 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("✓ %@"), v10));

          v10 = (void *)v13;
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100099E64;
        v18[3] = &unk_100551128;
        v18[4] = v8;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v18));
        objc_msgSend(v3, "addAction:", v14);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v3, "addAction:", v15);

  -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
}

- (void)resetServerSideUpdateTaskState:(id)a3
{
  void *v3;
  ICServerSideUpdateTaskController *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  v4 = -[ICServerSideUpdateTaskController initWithWorkerContext:]([ICServerSideUpdateTaskController alloc], "initWithWorkerContext:", v5);
  -[ICServerSideUpdateTaskController resetState](v4, "resetState");

}

- (void)purgeEverything:(id)a3
{
  -[ICDebuggingViewController confirmDestructiveActionWithTitle:message:buttonText:block:](self, "confirmDestructiveActionWithTitle:message:buttonText:block:", CFSTR("Delete Everything?"), CFSTR("This will delete all your modern note data locally. Notes in iCloud will re-download, but you will not be able to recover any On My Device notes. Are you sure you want to continue?"), CFSTR("Delete Everything"), &stru_1005530C0);
}

- (void)deleteEverything:(id)a3
{
  -[ICDebuggingViewController confirmDestructiveActionWithTitle:message:buttonText:block:](self, "confirmDestructiveActionWithTitle:message:buttonText:block:", CFSTR("Delete Everything?"), CFSTR("This will delete all your modern note data both locally and in CloudKit. This data will not be recoverable. Are you sure you want to continue?"), CFSTR("Delete Everything"), &stru_1005530E0);
}

- (void)loadTestData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Load Test Data"), CFSTR("Select a set of test data to load"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "popoverPresentationController"));
  v15 = v4;
  objc_msgSend(v6, "setSourceView:", v4);

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController URLsForTestDataDirectories](self, "URLsForTestDataDirectories"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10009A2B8;
        v17[3] = &unk_100551100;
        v17[4] = self;
        v17[5] = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v17));
        objc_msgSend(v5, "addAction:", v13);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v5, "addAction:", v14);

  -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (id)URLsForTestDataDirectories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resourceURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("TestData"), 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  return v7;
}

- (void)importTestDataFromDirectoryAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, 0, 5, 0));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v13 = objc_msgSend(v12, "importNoteFromFileAtURL:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)addSomeRandomNotes:(unint64_t)a3 toFolder:(id)a4
{
  unint64_t v5;
  id v7;
  id v8;

  if (a3)
  {
    v5 = a3;
    do
    {
      v7 = -[ICDebuggingViewController addRandomNoteToFolder:](self, "addRandomNoteToFolder:", a4);
      --v5;
    }
    while (v5);
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v8, "save");

}

- (id)addRandomNoteToFolder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = +[ICNote newEmptyNoteInFolder:](ICNote, "newEmptyNoteInFolder:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setCreationDate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setModificationDate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textStorage"));
  objc_msgSend(v6, "setWantsUndoCommands:", 0);

  v8 = sub_10009A6A0(v7, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = sub_10009A6A0((uint64_t)v9, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@\n%@"), v9, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textStorage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textStorage"));
  objc_msgSend(v13, "replaceCharactersInRange:withString:", 0, objc_msgSend(v14, "length"), v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textStorage"));
  objc_msgSend(v15, "setWantsUndoCommands:", 1);

  objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Created random note"));
  return v3;
}

- (void)addSomeFoldersWithRandomNotesToAllModernAccounts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", v5));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[ICDebuggingViewController addFolders:toAccount:maxNotesInFolder:](self, "addFolders:toAccount:maxNotesInFolder:", 50, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), 100);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v11, "save");

}

- (void)addFolders:(unint64_t)a3 toAccount:(id)a4 maxNotesInFolder:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  if (a3)
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Random Folder %lu"), v8));
      v10 = +[ICFolder newFolderInAccount:](ICFolder, "newFolderInAccount:", v12);
      objc_msgSend(v10, "setTitle:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v10, "setDateForLastTitleModification:", v11);

      -[ICDebuggingViewController addSomeRandomNotes:toFolder:](self, "addSomeRandomNotes:toFolder:", arc4random() % a5, v10);
      ++v8;
    }
    while (a3 != v8);
  }

}

- (void)addSomeRandomNotes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v5));

  v6 = v10;
  if (v10
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext")),
        v11 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v8)),
        v8,
        v7,
        (v6 = v11) != 0))
  {
    v12 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultFolder"));
    -[ICDebuggingViewController addSomeRandomNotes:toFolder:](self, "addSomeRandomNotes:toFolder:", 1000, v9);

  }
}

- (void)disableDebuggingSearchAnimation:(id)a3
{
  -[ICDebuggingViewController toggleDebuggingItemWithDefaultsKey:sender:](self, "toggleDebuggingItemWithDefaultsKey:sender:", CFSTR("DebuggingDisableSearchAnimation"), a3);
}

- (void)toggleGreyParrotUI:(id)a3
{
  -[ICDebuggingViewController toggleDebuggingItemWithDefaultsKey:sender:](self, "toggleDebuggingItemWithDefaultsKey:sender:", CFSTR("DebuggingGreyParrotUI"), a3);
}

- (void)fakeIncompatibleDevices:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[ICCompatibilityController sharedController](ICCompatibilityController, "sharedController", a3));
  v3 = objc_msgSend(v5, "fakesIncompatibleDevicesForDebugging") ^ 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICCompatibilityController sharedController](ICCompatibilityController, "sharedController"));
  objc_msgSend(v4, "setFakesIncompatibleDevicesForDebugging:", v3);

}

- (void)migratePrimaryICloudAccount:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryICloudACAccount"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICMigrationController sharedController](ICMigrationController, "sharedController"));
    objc_msgSend(v5, "startMigrationForICloudAccountID:", v4);

  }
}

- (void)migrateLocalAccount:(id)a3
{
  +[ICMigrationController setDidChooseToMigrateLocalAccount:](ICMigrationController, "setDidChooseToMigrateLocalAccount:", 1);
  +[ICMigrationController setDidMigrateLocalAccount:](ICMigrationController, "setDidMigrateLocalAccount:", 0);
  +[ICMigrationController migrateLocalAccountIfNecessary](ICMigrationController, "migrateLocalAccountIfNecessary");
}

- (void)deleteMigratedDuplicates:(id)a3
{
  ICDebugSpinner *v3;
  ICDebugSpinner *v4;
  _QWORD v5[4];
  ICDebugSpinner *v6;

  v3 = objc_alloc_init(ICDebugSpinner);
  -[ICDebugSpinner show](v3, "show");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009ACA0;
  v5[3] = &unk_100550110;
  v6 = v3;
  v4 = v3;
  +[ICDebugUtilities deleteMigratedDuplicatesWithCompletionHandler:](ICDebugUtilities, "deleteMigratedDuplicatesWithCompletionHandler:", v5);

}

- (void)resetLocalAccountMigration:(id)a3
{
  -[ICDebuggingViewController confirmDestructiveActionWithTitle:message:buttonText:block:](self, "confirmDestructiveActionWithTitle:message:buttonText:block:", CFSTR("Reset Local Migration?"), CFSTR("This will delete all your modern On My Device notes, and you will not be able to recover them. Are you sure you want to continue?"), CFSTR("Reset Local Migration"), &stru_100553100);
}

- (void)resetPencilUnsupportedAlertState:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("hasShownPencilUnsupportedAlertForHTMLNote"));

}

- (void)showSimplifiedUITextViewEditor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  ICUITextViewDebuggingViewController *v7;

  v7 = objc_alloc_init(ICUITextViewDebuggingViewController);
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Done"), 2, v7, "dismiss:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICUITextViewDebuggingViewController navigationItem](v7, "navigationItem"));
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)showSimplifiedWebEditor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  ICWKWebViewDebuggingViewController *v7;

  v7 = objc_alloc_init(ICWKWebViewDebuggingViewController);
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Done"), 2, v7, "dismiss:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController navigationItem](v7, "navigationItem"));
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)startFresh:(id)a3
{
  -[ICDebuggingViewController confirmDestructiveActionWithTitle:message:buttonText:block:](self, "confirmDestructiveActionWithTitle:message:buttonText:block:", CFSTR("Reset Migration?"), CFSTR("This will delete all your modern note data, and you will not be able to recover it. Are you sure you want to continue?"), CFSTR("Reset Migration"), &stru_100553120);
}

- (void)sendStateOfTheWorld:(id)a3
{
  id v4;
  ICDebugSpinner *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  ICDebugSpinner *v9;
  _QWORD block[4];
  ICDebugSpinner *v11;
  id v12;
  ICDebuggingViewController *v13;

  v4 = a3;
  v5 = objc_alloc_init(ICDebugSpinner);
  -[ICDebugSpinner show](v5, "show");
  global_queue = dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B234;
  block[3] = &unk_100550020;
  v11 = v5;
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

- (void)toggleNonContiguousLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  char v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = ICViewControllerUseNonContiguousLayoutDefaultKey;
  v25 = ICViewControllerUseNonContiguousLayoutDefaultKey;
  v26 = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  objc_msgSend(v5, "registerDefaults:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", v6);

  if (v9)
    v10 = CFSTR("on");
  else
    v10 = CFSTR("off");
  if (v9)
    v11 = CFSTR("off");
  else
    v11 = CFSTR("on");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Non-contiguous layout is %@."), v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Would you like to turn it %@?"), v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 0));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10009B874;
  v23[3] = &unk_100553140;
  v24 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Yes"), 0, v23));
  objc_msgSend(v14, "addAction:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("No"), 1, 0));
  objc_msgSend(v14, "addAction:", v16);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v17 = -2;
  else
    v17 = 7;
  objc_msgSend(v14, "setModalPresentationStyle:", v17);
  -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "popoverPresentationController"));
  v19 = objc_opt_class(UIView);
  v20 = ICDynamicCast(v19, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "viewForFirstBaselineLayout"));
  objc_msgSend(v18, "setSourceView:", v22);

  objc_msgSend(v18, "setPermittedArrowDirections:", 3);
}

- (void)removeAccountPassword:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", v4));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(objc_alloc((Class)ICAccountPassphraseManager), "initWithAccount:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9));
        objc_msgSend(v10, "removePassphrase");

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
  objc_msgSend(v11, "syncWithReason:completionHandler:", CFSTR("DebugMenu-RemoveAccountPassword"), &stru_100553160);

}

- (void)resetLockedNotesMode:(id)a3
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", v4));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "setResolvedLockedNotesMode:", 0);
        +[ICAuthenticationAlert resetPresentationsForAccount:](ICAuthenticationAlert, "resetPresentationsForAccount:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));
        objc_msgSend(v11, "ic_save");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)toggleSupportsV1Neo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v5));

  v7 = objc_msgSend(v6, "ic_allSatisfy:", &stru_100553180);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    v12 = v7 ^ 1;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), "accountDataCreateIfNecessary", (_QWORD)v15));
        objc_msgSend(v14, "setSupportsV1Neo:", v12);

        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[ICDebuggingViewController setUpDebuggingItems](self, "setUpDebuggingItems");
}

- (void)resetSupportsV1Neo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v4));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICCompatibilityController sharedController](ICCompatibilityController, "sharedController", (_QWORD)v17));
        objc_msgSend(v12, "clearCachedDevicesForAccount:", v11);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountDataCreateIfNecessary"));
        v14 = ICKeyPathFromSelector("supportsV1Neo");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v13, "setPrimitiveValue:forKey:", 0, v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountDataCreateIfNecessary"));
        objc_msgSend(v16, "updateSupportsV1Neo:", 0);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)migrateToCustomPasswordMode:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", v5));

  -[ICDebuggingViewController migrateAccounts:toMode:](self, "migrateAccounts:toMode:", v6, 1);
}

- (void)migrateToDevicePasscodeMode:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", v5));

  -[ICDebuggingViewController migrateAccounts:toMode:](self, "migrateAccounts:toMode:", v6, 2);
}

- (void)migrateAccounts:(id)a3 toMode:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICDebuggingViewController *v17;
  id v18;
  __int16 v19;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController navigationController](self, "navigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationPrompt promptForChangingMode:account:](ICAuthenticationPrompt, "promptForChangingMode:account:", v4, v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthentication shared](ICAuthentication, "shared"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009C198;
    v14[3] = &unk_1005531F8;
    v19 = v4;
    v15 = v7;
    v16 = v10;
    v17 = self;
    v18 = v6;
    v13 = v10;
    objc_msgSend(v12, "authenticateWithPrompt:displayWindow:completionHandler:", v11, v13, v14);

  }
}

- (void)resetPassword:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContext:](ICAccount, "allActiveAccountsInContext:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationPrompt promptForIntent:object:](ICAuthenticationPrompt, "promptForIntent:object:", 6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthentication shared](ICAuthentication, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009C4EC;
  v13[3] = &unk_100553220;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v9, "authenticateWithPrompt:displayWindow:completionHandler:", v8, v11, v13);

}

- (void)addDivergedAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentNote"));

  if (objc_msgSend(v6, "isPasswordProtected") && objc_msgSend(v6, "isAuthenticated"))
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_10009C7A8;
    v20[4] = sub_10009C7B8;
    v21 = 0;
    v7 = ICUnlocalizedString(CFSTR("Add Diverged Attachment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10009C7C0;
    v19[3] = &unk_100553248;
    v19[4] = v20;
    objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v19);
    v10 = ICUnlocalizedString(CFSTR("Cancel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, 0));
    objc_msgSend(v9, "addAction:", v12);

    v13 = ICUnlocalizedString(CFSTR("Add"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10009C840;
    v16[3] = &unk_100553270;
    v17 = v6;
    v18 = v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v16));
    objc_msgSend(v9, "addAction:", v15);

    -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    _Block_object_dispose(v20, 8);

  }
}

- (void)fixDivergedAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentNote"));

  if (objc_msgSend(v6, "isPasswordProtected") && objc_msgSend(v6, "isAuthenticated"))
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_10009C7A8;
    v20[4] = sub_10009C7B8;
    v21 = 0;
    v7 = ICUnlocalizedString(CFSTR("Fix Diverged Attachments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10009CC48;
    v19[3] = &unk_100553248;
    v19[4] = v20;
    objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v19);
    v10 = ICUnlocalizedString(CFSTR("Cancel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, 0));
    objc_msgSend(v9, "addAction:", v12);

    v13 = ICUnlocalizedString(CFSTR("Fix"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10009CCC8;
    v16[3] = &unk_100553298;
    v18 = v20;
    v17 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v16));
    objc_msgSend(v9, "addAction:", v15);

    -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    _Block_object_dispose(v20, 8);

  }
}

- (void)checkiCloudKeychainSyncStatus:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  void *v12;
  const __CFString *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", v5));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = +[ICKeychain isSyncAvailableForAccount:](ICKeychain, "isSyncAvailableForAccount:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountName"));
        if (v11)
          v13 = CFSTR("Healthy");
        else
          v13 = CFSTR("Unhealthy");
        +[UIAlertController ic_showAlertWithTitle:message:viewController:](UIAlertController, "ic_showAlertWithTitle:message:viewController:", v12, v13, self);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)reindexEverything:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICReindexer reindexer](ICReindexer, "reindexer", a3));
  objc_msgSend(v3, "reindexAllSearchableItemsWithCompletionHandler:", 0);

}

- (void)logSearchIndex:(id)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;

  global_queue = dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1005532B8);

}

- (void)deleteSearchIndex:(id)a3
{
  ICDebugSpinner *v3;
  void *v4;
  ICDebugSpinner *v5;
  _QWORD v6[4];
  ICDebugSpinner *v7;

  v3 = objc_alloc_init(ICDebugSpinner);
  -[ICDebugSpinner show](v3, "show");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICReindexer reindexer](ICReindexer, "reindexer"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009D190;
  v6[3] = &unk_1005532E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "deleteAllSearchableItemsWithCompletionHandler:", v6);

}

- (void)prefetchHashtagsIndexedByOtherApps:(id)a3
{
  NSObject *v3;

  +[ICCrossAppHashtagManager prefetchHashtagDisplayTextsFromOtherApps](ICCrossAppHashtagManager, "prefetchHashtagDisplayTextsFromOtherApps", a3);
  v3 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1004099B8(v3);

}

- (void)logHashtagsIndexedByOtherApps:(id)a3
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICCrossAppHashtagManager hashtagDisplayTextsFromOtherApps](ICCrossAppHashtagManager, "hashtagDisplayTextsFromOtherApps", a3));
  v4 = os_log_create("com.apple.notes", "Internal");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1004099F8();

}

- (void)createPartiallySupportedSmartFolder:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v3));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009D364;
  v9[3] = &unk_100550020;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[ICQuery queryForPinnedNotes:allowsRecentlyDeleted:](ICQuery, "queryForPinnedNotes:allowsRecentlyDeleted:", 1, 0));
  v11 = v4;
  v12 = v3;
  v5 = v3;
  v6 = v4;
  v7 = v10;
  objc_msgSend(v5, "performBlockAndWait:", v9);

}

- (void)deleteAllTags:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009D450;
  v6[3] = &unk_100550110;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

- (void)regenerateStandardizedContentForAllHashtags:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  +[ICHashtag regenerateStandardizedContentForAllHashtagsInContext:hasChanges:](ICHashtag, "regenerateStandardizedContentForAllHashtagsInContext:hasChanges:", v3, 0);

}

- (void)generateFallbackImageForSketches:(id)a3
{
  -[ICDebuggingViewController toggleDebuggingItemWithDefaultsKey:sender:](self, "toggleDebuggingItemWithDefaultsKey:sender:", ICGenerateFallbackImageForSketchesDefaultKey, a3);
}

- (void)generateFallbackPDFForPaperDocuments:(id)a3
{
  -[ICDebuggingViewController toggleDebuggingItemWithDefaultsKey:sender:](self, "toggleDebuggingItemWithDefaultsKey:sender:", ICDisableFallbackPDFGenerationDefaultKey, a3);
}

- (void)regenerateAllAttachmentPreviewImages:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  +[ICAttachmentPreviewImage purgeAllAttachmentPreviewImagesInContext:](ICAttachmentPreviewImage, "purgeAllAttachmentPreviewImagesInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
  objc_msgSend(v5, "generatePreviewsIfNeeded");

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D694;
  v7[3] = &unk_100550110;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (void)regenerateAllOCR:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  +[ICAttachmentPreviewGenerator purgeOCRInContext:](ICAttachmentPreviewGenerator, "purgeOCRInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
  objc_msgSend(v5, "generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:", v4);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D758;
  v7[3] = &unk_100550110;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (void)regenerateAllImageClassifications:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  +[ICAttachmentPreviewGenerator purgeImageClassificationsInContext:](ICAttachmentPreviewGenerator, "purgeImageClassificationsInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator"));
  objc_msgSend(v5, "generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:", v4);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D81C;
  v7[3] = &unk_100550110;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (void)regenerateAllHandwritingSummaries:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workerManagedObjectContext"));

  +[ICAttachment purgeHandwritingSummariesInContext:](ICAttachment, "purgeHandwritingSummariesInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICPaperSearchIndexer shared](ICPaperSearchIndexer, "shared"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D8E4;
  v7[3] = &unk_100550110;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateIndexWithManagedObjectContext:completionHandler:", v6, v7);

}

- (void)purgeAllHandwritingSummaries:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workerManagedObjectContext"));

  +[ICAttachment purgeHandwritingSummariesInContext:](ICAttachment, "purgeHandwritingSummariesInContext:", v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009D9F4;
  v6[3] = &unk_100550110;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

- (void)regenerateSystemPaperThumbnails:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICSystemPaperThumbnailService sharedService](ICSystemPaperThumbnailService, "sharedService", a3));
  objc_msgSend(v3, "invalidate");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[ICSystemPaperThumbnailService sharedService](ICSystemPaperThumbnailService, "sharedService"));
  objc_msgSend(v4, "updateIfNeededForNote:completion:", 0, 0);

}

- (void)generateSystemPaperChrome:(id)a3
{
  id v4;
  _TtC11MobileNotes33ICSystemPaperChromeLayerGenerator *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];

  v4 = a3;
  v5 = objc_alloc_init(_TtC11MobileNotes33ICSystemPaperChromeLayerGenerator);
  v11 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSystemPaperChromeLayerGenerator generateChromeThumbnailsWithError:](v5, "generateChromeThumbnailsWithError:", &v11));
  v7 = v11;
  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "Thumbnails");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100409A64();
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)UIActivityViewController), "initWithActivityItems:applicationActivities:", v6, &__NSArray0__struct);
    v12[0] = UIActivityTypeOpenInIBooks;
    v12[1] = ICActivityTypeShareToNote;
    v12[2] = UIActivityTypeSharePlay;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
    -[NSObject setExcludedActivityTypes:](v8, "setExcludedActivityTypes:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject popoverPresentationController](v8, "popoverPresentationController"));
    objc_msgSend(v10, "setSourceView:", v4);

    -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

- (void)deleteDocCamPDFs:(id)a3
{
  +[ICDocCamPDFGenerator deleteAllDocCamPDFs](ICDocCamPDFGenerator, "deleteAllDocCamPDFs", a3);
}

- (void)bluetoothKeyboardHint:(id)a3
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v4 = ICBluetoothKeyboardHintViewControllerForceShowDefaultsKey;
  v5 = objc_msgSend(v3, "BOOLForKey:", ICBluetoothKeyboardHintViewControllerForceShowDefaultsKey);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setBool:forKey:", v5 ^ 1, v4);

}

- (void)removeWhatsNewVersion:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICStartupController lastShownStartupDefaultsKey](ICStartupController, "lastShownStartupDefaultsKey"));
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

- (void)setWhatsNewToCurrentOS:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo", a3));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "operatingSystemVersion");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v11[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v11[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICStartupController lastShownStartupDefaultsKey](ICStartupController, "lastShownStartupDefaultsKey"));
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

}

- (void)setWhatsNewToIOS9:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICStartupController lastShownStartupDefaultsKey](ICStartupController, "lastShownStartupDefaultsKey"));
  objc_msgSend(v4, "setObject:forKey:", &off_10057C6D8, v3);

}

- (void)resetWelcomeScreenState:(id)a3
{
  +[ICStartupController setHasShownWelcomeScreen:](ICStartupController, "setHasShownWelcomeScreen:", 0);
}

- (void)crashThisApp:(id)a3
{
  +[ICNoteContext crashThisApp](ICNoteContext, "crashThisApp", a3);
}

- (void)testAppRemoval:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Test Notes App Removal"), CFSTR("This will delete all Notes app data. Local notes will be lost!"), 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v4, "addAction:", v5);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009DF94;
  v7[3] = &unk_100551128;
  v7[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Continue"), 0, v7));
  objc_msgSend(v4, "addAction:", v6);

  -[ICDebuggingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (BOOL)canShowRecentItems
{
  return self->_canShowRecentItems;
}

- (NSArray)allSections
{
  return self->_allSections;
}

- (void)setAllSections:(id)a3
{
  objc_storeStrong((id *)&self->_allSections, a3);
}

- (void)setFilteredSections:(id)a3
{
  objc_storeStrong((id *)&self->_filteredSections, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_filteredSections, 0);
  objc_storeStrong((id *)&self->_allSections, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end

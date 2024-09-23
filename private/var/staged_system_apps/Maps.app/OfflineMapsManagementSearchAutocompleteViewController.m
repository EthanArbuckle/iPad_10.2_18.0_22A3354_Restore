@implementation OfflineMapsManagementSearchAutocompleteViewController

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  -[ContaineeViewController viewDidLoad](&v3, "viewDidLoad");
  -[OfflineMapsManagementSearchAutocompleteViewController _setupViews](self, "_setupViews");
  -[OfflineMapsManagementSearchAutocompleteViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  OfflineMapsManagementSearchAutocompleteDataSource *v4;
  void *v5;
  OfflineMapsManagementSearchAutocompleteDataSource *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = [OfflineMapsManagementSearchAutocompleteDataSource alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  v6 = -[OfflineMapsManagementSearchAutocompleteDataSource initWithCollectionView:updateLocation:](v4, "initWithCollectionView:updateLocation:", v5, 1);
  -[OfflineMapsManagementSearchAutocompleteViewController setSearchDataSource:](self, "setSearchDataSource:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchDataSource](self, "searchDataSource"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchDataSource](self, "searchDataSource"));
  objc_msgSend(v8, "setActive:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  -[OfflineMapsManagementSearchAutocompleteViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BD5EAC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSearchAutocompleteViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchDataSource](self, "searchDataSource"));
  objc_msgSend(v4, "setActive:", 0);

}

- (void)_setupViews
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
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
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void **v43;
  uint64_t v44;
  id (*v45)(uint64_t, uint64_t, void *);
  void *v46;
  id v47;
  id location;

  v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  -[OfflineMapsManagementSearchAutocompleteViewController setSubscriptionManager:](self, "setSubscriptionManager:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setPresentedModally:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setTakesAvailableHeight:", 1);

  v6 = objc_alloc((Class)UINavigationItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Download New Map [page title]"), CFSTR("localized string not found"), CFSTR("Offline")));
  v9 = objc_msgSend(v6, "initWithTitle:", v8);

  v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_dismiss");
  objc_msgSend(v9, "setLeftBarButtonItem:", v10);

  v11 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[OfflineMapsManagementSearchAutocompleteViewController setActivityIndicator:](self, "setActivityIndicator:", v11);

  v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController activityIndicator](self, "activityIndicator"));
  v14 = objc_msgSend(v12, "initWithCustomView:", v13);

  objc_msgSend(v9, "setRightBarButtonItem:", v14);
  v15 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
  -[OfflineMapsManagementSearchAutocompleteViewController setSearchController:](self, "setSearchController:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  objc_msgSend(v16, "setSearchResultsUpdater:", self);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  objc_msgSend(v17, "setObscuresBackgroundDuringPresentation:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  objc_msgSend(v18, "setHidesNavigationBarDuringPresentation:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Search city [search bar placeholder]"), CFSTR("localized string not found"), CFSTR("Offline")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchBar"));
  objc_msgSend(v22, "setPlaceholder:", v20);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchBar"));
  objc_msgSend(v24, "setReturnKeyType:", 9);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  objc_msgSend(v25, "setAutomaticallyShowsCancelButton:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  objc_msgSend(v26, "setActive:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  objc_msgSend(v9, "setSearchController:", v27);

  objc_msgSend(v9, "setHidesSearchBarWhenScrolling:", 0);
  v28 = objc_alloc_init((Class)UINavigationBar);
  -[OfflineMapsManagementSearchAutocompleteViewController setNavBar:](self, "setNavBar:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController navBar](self, "navBar"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController navBar](self, "navBar"));
  objc_msgSend(v30, "pushNavigationItem:animated:", v9, 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController navBar](self, "navBar"));
  objc_msgSend(v31, "addSubview:", v32);

  objc_initWeak(&location, self);
  v33 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v43 = _NSConcreteStackBlock;
  v44 = 3221225472;
  v45 = sub_100BD647C;
  v46 = &unk_1011B5F50;
  objc_copyWeak(&v47, &location);
  v34 = objc_msgSend(v33, "initWithSectionProvider:", &v43);
  v35 = objc_alloc((Class)UICollectionView);
  v36 = objc_msgSend(v35, "initWithFrame:collectionViewLayout:", v34, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v43, v44, v45, v46);
  -[OfflineMapsManagementSearchAutocompleteViewController setCollectionView:](self, "setCollectionView:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  objc_msgSend(v39, "setBackgroundColor:", v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  objc_msgSend(v40, "setAccessibilityIdentifier:", CFSTR("OfflineMapsSearchACCollectionView"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  objc_msgSend(v41, "addSubview:", v42);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

}

- (void)_setupConstraints
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[8];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController navBar](self, "navBar"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v44[0] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController navBar](self, "navBar"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v44[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController navBar](self, "navBar"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v44[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController navBar](self, "navBar"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v44[3] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v44[4] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v44[5] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v44[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v44[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_dismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController delegate](self, "delegate"));
  objc_msgSend(v2, "closeAddNewMapSearchAutocomplete");

}

- (void)_addSubscriptionForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  objc_msgSend(v5, "setActive:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "offlineDownloadRegion"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKUserLocation title](MKUserLocation, "title"));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_addressFormattedAsCity"));

    v8 = (void *)v11;
  }
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100BD6D78;
  v19[3] = &unk_1011AFF10;
  objc_copyWeak(&v22, &location);
  v12 = v7;
  v20 = v12;
  v13 = v8;
  v21 = v13;
  v14 = objc_retainBlock(v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchController](self, "searchController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transitionCoordinator"));

  if (v16)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100BD6DCC;
    v17[3] = &unk_1011C56F8;
    v18 = v14;
    objc_msgSend(v16, "animateAlongsideTransition:completion:", &stru_1011E8418, v17);

  }
  else
  {
    ((void (*)(_QWORD *))v14[2])(v14);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  __objc2_prot *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location;

  v6 = a3;
  v7 = a4;
  if (!-[OfflineMapsManagementSearchAutocompleteViewController isSearchLoading](self, "isSearchLoading"))
  {
    v8 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      v10 = objc_msgSend(objc_alloc((Class)MKLocalSearchRequest), "initWithCompletion:", v9);
      v11 = objc_msgSend(objc_alloc((Class)MKLocalSearch), "initWithRequest:", v10);
      -[OfflineMapsManagementSearchAutocompleteViewController setIsSearchLoading:](self, "setIsSearchLoading:", 1);
      objc_initWeak(&location, self);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100BD7074;
      v27[3] = &unk_1011E8440;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v11, "startWithCompletionHandler:", v27);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

    }
    v12 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
      -[OfflineMapsManagementSearchAutocompleteViewController _addSubscriptionForMapItem:](self, "_addSubscriptionForMapItem:", v13);

    }
    v14 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v7, v14) & 1) != 0)
    {
      v15 = v7;
      v16 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      v17 = objc_opt_class(HistoryEntryRecentsItem);
      v18 = v15;
      if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      if (v20
        && (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "historyEntry")),
            v22 = objc_msgSend(v21, "conformsToProtocol:", v16),
            v21,
            v22))
      {
        v23 = v18;
      }
      else
      {
        v23 = 0;
      }

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "historyEntry"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "geoMapItem"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v25));

        -[OfflineMapsManagementSearchAutocompleteViewController _addSubscriptionForMapItem:](self, "_addSubscriptionForMapItem:", v26);
      }

    }
  }

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController searchDataSource](self, "searchDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  objc_msgSend(v7, "updateForSearchQuery:", v6);

}

- (BOOL)isSearchLoading
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315906;
      v10 = "-[OfflineMapsManagementSearchAutocompleteViewController isSearchLoading]";
      v11 = 2080;
      v12 = "OfflineMapsManagementSearchAutocompleteViewController.m";
      v13 = 1024;
      v14 = 247;
      v15 = 2080;
      v16 = "[NSThread isMainThread]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100A70734())
    {
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);

      }
    }
  }
  return self->_isSearchLoading;
}

- (void)setIsSearchLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_isSearchLoading = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteViewController activityIndicator](self, "activityIndicator"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (OfflineMapsManagementActionCoordination)delegate
{
  return (OfflineMapsManagementActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (OfflineMapsManagementSearchAutocompleteDataSource)searchDataSource
{
  return self->_searchDataSource;
}

- (void)setSearchDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_searchDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

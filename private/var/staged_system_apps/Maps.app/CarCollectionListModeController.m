@implementation CarCollectionListModeController

- (CarCollectionListModeController)init
{
  CarCollectionListModeController *v2;
  void *v3;
  uint64_t v4;
  NSArray *collections;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarCollectionListModeController;
  v2 = -[CarCollectionListModeController init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentCollectionsForCarPlay"));
    collections = v2->_collections;
    v2->_collections = (NSArray *)v4;

  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  CarCollectionListCardViewController *v5;
  void *v6;
  CarCollectionListCardViewController *v7;
  id v8;

  v5 = [CarCollectionListCardViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListModeController collections](self, "collections"));
  v7 = -[CarCollectionListCardViewController initWithCollections:delegate:](v5, "initWithCollections:delegate:", v6, self);
  -[CarCollectionListModeController setCollectionListCard:](self, "setCollectionListCard:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  objc_msgSend(v8, "addObserver:", self);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", a3, a4));
  objc_msgSend(v5, "removeObserver:", self);

}

- (id)desiredCards
{
  const __CFString *v3;

  v3 = CFSTR("primary");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("primary")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListModeController collectionListCard](self, "collectionListCard"));
    objc_msgSend(v6, "setContent:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CarPlay_Guides_List_Title"), CFSTR("localized string not found"), 0));
    objc_msgSend(v6, "setTitle:", v9);

    HIDWORD(v25) = 0;
    *(_DWORD *)((char *)&v25 + 1) = 0;
    v15 = xmmword_100E34B90;
    v16 = xmmword_100E2D550;
    v17 = 3;
    v18 = 1148846080;
    v19 = 2;
    LODWORD(v20) = 1148846080;
    v21 = 0;
    v22 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v23 = _Q0;
    v24 = _Q0;
    LOBYTE(v25) = 1;
    v26 = 8;
    LOBYTE(v27) = 0;
    if (v6)
      objc_msgSend(v6, "setLayout:", &v15);
    objc_msgSend(v6, "setAccessory:", 1, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  }

}

- (void)_updateCollections:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListModeController collections](self, "collections"));
  v5 = objc_msgSend(v8, "isEqualToArray:", v4);

  if ((v5 & 1) == 0)
  {
    -[CarCollectionListModeController setCollections:](self, "setCollections:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListModeController collectionListCard](self, "collectionListCard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListModeController collections](self, "collections"));
    objc_msgSend(v6, "setCollections:", v7);

  }
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  -[CarCollectionListModeController _updateCollections:](self, "_updateCollections:", a4);
}

- (void)collectionListCard:(id)a3 didSelectCollection:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a4;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "searchCategoriesCard:didSelectCollection: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v7, "displaySearchResultsWithCollection:", v4);

}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (NSArray)preferredCarFocusEnvironments
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)carFocusOrderSequences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListModeController chromeViewController](self, "chromeViewController", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v7, 5));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v9;
}

- (int)currentUsageTarget
{
  return 0;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (CarCollectionListCardViewController)collectionListCard
{
  return self->_collectionListCard;
}

- (void)setCollectionListCard:(id)a3
{
  objc_storeStrong((id *)&self->_collectionListCard, a3);
}

- (NSArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
  objc_storeStrong((id *)&self->_collections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_collectionListCard, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end

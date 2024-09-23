@implementation CarSearchCategoriesModeController

- (CarSearchCategoriesModeController)init
{
  CarSearchCategoriesModeController *v2;
  id v3;
  void *v4;
  unsigned int v5;
  __CFString **v6;
  __CFString *v7;
  BrowseManager *v8;
  BrowseManager *browseManager;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarSearchCategoriesModeController;
  v2 = -[CarSearchCategoriesModeController init](&v14, "init");
  if (v2)
  {
    v3 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v2->_isNavigating = objc_msgSend(v4, "isCarAppSceneHostingNavigation");

    v5 = -[CarSearchCategoriesModeController isNavigating](v2, "isNavigating");
    v6 = off_1011C6D98;
    if (!v5)
      v6 = off_1011C6D90;
    v7 = *v6;
    v8 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", v7);

    browseManager = v2->_browseManager;
    v2->_browseManager = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager imageManager](v2->_browseManager, "imageManager"));
    objc_msgSend(v10, "setDesiredImageSize:", 29.0, 29.0);

    -[BrowseManager readCategoriesFromDiskIfNeeded](v2->_browseManager, "readCategoriesFromDiskIfNeeded");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController browseManager](v2, "browseManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cachedCategories"));
    -[CarSearchCategoriesModeController _updateCategories:](v2, "_updateCategories:", v12);

  }
  return v2;
}

+ (id)_traitsForNavigation:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTraits"));

  objc_msgSend(v6, "setNavigating:", v3);
  if (objc_msgSend(v6, "navigating"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("EnableCarSARCategoryWorkaround"));

    if (v8)
    {
      objc_msgSend(v6, "setMapRegion:", 0);
      objc_msgSend(v6, "setHasCarHeadunitInteractionModel:", 0);
      objc_msgSend(v6, "setCarHeadunitModel:", 0);
      objc_msgSend(v6, "setHasCarHeadunitPixelWidth:", 0);
      objc_msgSend(v6, "setHasCarHeadunitPixelHeight:", 0);
      objc_msgSend(v6, "setCarHeadunitManufacturer:", 0);
      objc_msgSend(v6, "setHasCarHeadunitConnectionType:", 0);
    }
  }
  return v6;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
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

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CarSearchCategoriesCardViewController *v12;
  void *v13;
  CarSearchCategoriesCardViewController *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(self), "_traitsForNavigation:", -[CarSearchCategoriesModeController isNavigating](self, "isNavigating"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController browseManager](self, "browseManager"));
  objc_msgSend(v10, "setTraits:", v9);

  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController browseManager](self, "browseManager"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10089D85C;
  v18 = &unk_1011AD9D0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v11, "getCategoriesWithCompletion:", &v15);

  v12 = [CarSearchCategoriesCardViewController alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categories](self, "categories", v15, v16, v17, v18));
  v14 = -[CarSearchCategoriesCardViewController initWithCategories:delegate:](v12, "initWithCategories:delegate:", v13, self);
  -[CarSearchCategoriesModeController setCategoriesCard:](self, "setCategoriesCard:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

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
  unsigned __int8 v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("primary")))
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
  objc_msgSend(v6, "setContent:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if ((objc_msgSend(v8, "isUsingOfflineMaps") & 1) == 0)
  {

    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
  v10 = objc_msgSend(v9, "supportFullTextSearch");

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("CarPlay_Search_Title");
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  v13 = CFSTR("CarPlay_Search_Title_Browse_Mode");
LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));
  objc_msgSend(v6, "setTitle:", v14);

  HIDWORD(v30) = 0;
  *(_DWORD *)((char *)&v30 + 1) = 0;
  v20 = xmmword_100E34B90;
  v21 = xmmword_100E2D550;
  v22 = 3;
  v23 = 1148846080;
  v24 = 2;
  LODWORD(v25) = 1148846080;
  v26 = 0;
  v27 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  v28 = _Q0;
  v29 = _Q0;
  LOBYTE(v30) = 1;
  v31 = 8;
  LOBYTE(v32) = 0;
  if (v6)
    objc_msgSend(v6, "setLayout:", &v20);
  objc_msgSend(v6, "setAccessory:", 1, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32);
LABEL_10:

}

- (void)configureFocusContainerGuideController:(id)a3
{
  objc_msgSend(a3, "setActiveEdges:", 0);
}

- (void)checkFullTextSearchSupport
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
    objc_msgSend(v4, "checkFullTextSearchSupport");

  }
}

- (void)_updateCategories:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 7)
    v5 = 8;
  else
    v5 = (uint64_t)objc_msgSend(v4, "count");
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categories](self, "categories"));
  v7 = objc_msgSend(v10, "isEqualToArray:", v6);

  if ((v7 & 1) == 0)
  {
    -[CarSearchCategoriesModeController setCategories:](self, "setCategories:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categories](self, "categories"));
    objc_msgSend(v8, "setCategories:", v9);

  }
}

+ (void)prepareNearby
{
  void *v3;
  id v4;
  void *v5;
  BrowseManager *v6;

  v6 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", CFSTR("Stark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager imageManager](v6, "imageManager"));
  objc_msgSend(v3, "setDesiredImageSize:", 29.0, 29.0);

  v4 = objc_msgSend((id)objc_opt_class(a1), "_traitsForNavigation:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[BrowseManager preCacheWithTraits:](v6, "preCacheWithTraits:", v5);

}

+ (void)prepareNearbySAR
{
  void *v3;
  id v4;
  void *v5;
  BrowseManager *v6;

  v6 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", CFSTR("Stark-SAR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager imageManager](v6, "imageManager"));
  objc_msgSend(v3, "setDesiredImageSize:", 29.0, 29.0);

  v4 = objc_msgSend((id)objc_opt_class(a1), "_traitsForNavigation:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[BrowseManager preCacheWithTraits:](v6, "preCacheWithTraits:", v5);

}

- (void)searchCategoriesCardDidSelectSiriSearch:(id)a3 usingInteractionModel:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  unint64_t v9;

  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "searchCategoriesCardDidSelectSiriSearch, showing siri usingIneractionModel: %ld", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v7, "displaySearchWithInteractionModel:", a4);

}

- (void)searchCategoriesCardDidSelectKeyboardSearch:(id)a3 usingInteractionModel:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  unint64_t v9;

  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "searchCategoriesCardDidSelectKeyboardSearch, showing keyboard usingIneractionModel: %ld", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v7, "displayKeyboardSearchWithInteractionModel:", a4);

}

- (void)searchCategoriesCard:(id)a3 didSelectCategory:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v5 = a4;
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "searchCategoriesCard:didSelectCategory: %@", (uint8_t *)&v15, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categories](self, "categories"));
  v9 = sub_10039DCD4(v8, &stru_1011DA398);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController chromeViewController](self, "chromeViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "category"));
  objc_msgSend(v11, "captureUserActionSelectedSearchCategory:categoriesDisplayed:", v12, v10);

  LODWORD(v11) = -[CarSearchCategoriesModeController isNavigating](self, "isNavigating");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  v14 = v13;
  if ((_DWORD)v11)
    objc_msgSend(v13, "displaySearchAlongTheRouteForCategory:", v5);
  else
    objc_msgSend(v13, "displaySearchResultsWithCategory:", v5);

}

- (void)updateCardViewTitle:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController chromeViewController](self, "chromeViewController", a3));
  objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 0);

}

- (NSArray)preferredCarFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController chromeViewController](self, "chromeViewController", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v7, 5));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v9;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (int)currentUsageTarget
{
  if (-[CarSearchCategoriesModeController isNavigating](self, "isNavigating"))
    return 1010;
  else
    return 1009;
}

- (UIScrollView)pptTestScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pptTestScrollView"));

  return (UIScrollView *)v3;
}

- (void)_ppt_selectFirstCarplayBrowseCategory
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesModeController categoriesCard](self, "categoriesCard"));
  objc_msgSend(v2, "_ppt_selectFirstCarplayBrowseCategory");

}

- (void)_ppt_selectKeyboardMode
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v2, "displayKeyboardSearchWithInteractionModel:", 1);

}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (CarSearchCategoriesCardViewController)categoriesCard
{
  return self->_categoriesCard;
}

- (void)setCategoriesCard:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesCard, a3);
}

- (BrowseManager)browseManager
{
  return self->_browseManager;
}

- (void)setBrowseManager:(id)a3
{
  objc_storeStrong((id *)&self->_browseManager, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_categoriesCard, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end

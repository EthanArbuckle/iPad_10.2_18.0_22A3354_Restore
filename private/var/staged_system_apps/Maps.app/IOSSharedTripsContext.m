@implementation IOSSharedTripsContext

- (int64_t)displayedViewMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = objc_msgSend(v2, "displayedViewMode");

  return (int64_t)v3;
}

- (GEOMapServiceTraits)newTraits
{
  void *v2;
  GEOMapServiceTraits *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v3 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTraits"));

  return v3;
}

- (void)placeCardViewController:(id)a3 didSelectParent:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
  objc_msgSend(v6, "openParentMapItem:", v5);

}

- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appCoordinator"));
  objc_msgSend(v9, "enterRoutePlanningWithDirectionItem:withUserInfo:", v8, v7);

}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (void)placeCardViewController:(id)a3 showCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
  objc_msgSend(v6, "openCollection:", v5);

}

- (void)placeCardViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appCoordinator"));
  objc_msgSend(v15, "openRelatedMapItems:withTitle:originalMapItem:analyticsDelegate:", v14, v13, v12, v11);

}

- (void)placeCardViewController:(id)a3 showCuratedCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = objc_alloc((Class)MKMapItemIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionIdentifier"));

  v10 = objc_msgSend(v6, "initWithGEOMapItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appCoordinator"));
  objc_msgSend(v9, "openCuratedCollectionWithIdentifier:", v10);

}

- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
  objc_msgSend(v6, "openGuidesHomeWithGuideLocation:", v5);

}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appCoordinator"));
  objc_msgSend(v10, "openCuratedCollectionsList:usingTitle:", v9, v8);

}

- (void)placeCardViewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
  -[IOSSharedTripsContext closeStopDetail](self, "closeStopDetail", a3, a4, a5);
}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "copy:", v5);

}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v5;
  MapsWebLinkPresenter *v6;
  void *v7;
  MapsWebLinkPresenter *v8;

  v5 = a4;
  v6 = [MapsWebLinkPresenter alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v8 = -[MapsWebLinkPresenter initWithPresentingViewController:](v6, "initWithPresentingViewController:", v7);

  -[MapsWebLinkPresenter presentWebURL:](v8, "presentWebURL:", v5);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (id)desiredCards
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v4 = v3;
  if (self->_listContaineeController)
    objc_msgSend(v3, "addObject:");
  if (self->_sharedTripInfoController)
    objc_msgSend(v4, "addObject:");
  if (self->_placeCardViewController)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  unsigned __int8 v7;

  v5 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100830730;
  v6[3] = &unk_1011ACE58;
  v7 = objc_msgSend(v5, "isAnimated");
  v6[4] = self;
  objc_msgSend(v5, "addPreparation:", v6);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  unsigned __int8 v7;

  v5 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100830858;
  v6[3] = &unk_1011ACE58;
  v7 = objc_msgSend(v5, "isAnimated");
  v6[4] = self;
  objc_msgSend(v5, "addPreparation:", v6);

}

- (id)windowScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  return v5;
}

- (void)container:(id)a3 containee:(id)a4 didChangeLayout:(unint64_t)a5
{
  -[SharedTripsContext recenterOnRouteAnimated:](self, "recenterOnRouteAnimated:", 1, a4, a5);
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  if (self->_placeCardViewController == a3)
    -[IOSSharedTripsContext closeStopDetail](self, "closeStopDetail");
}

- (void)didSelectStopWithMapItem:(id)a3
{
  PlaceCardItem *v4;
  PlaceCardViewController *placeCardViewController;
  PlaceCardViewController *v6;
  PlaceCardViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  MKMapRect v20;
  MKCoordinateRegion v21;

  v19 = a3;
  v4 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v19);
  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    v6 = objc_alloc_init(PlaceCardViewController);
    v7 = self->_placeCardViewController;
    self->_placeCardViewController = v6;

    -[PlaceCardViewController setExcludedContent:](self->_placeCardViewController, "setExcludedContent:", 0x3FFFLL);
    -[PlaceCardViewController setPlaceCardDelegate:](self->_placeCardViewController, "setPlaceCardDelegate:", self);
    -[InfoCardViewController setContaineeDelegate:](self->_placeCardViewController, "setContaineeDelegate:", self);
    placeCardViewController = self->_placeCardViewController;
  }
  -[PlaceCardViewController setPlaceCardItem:withHistory:](placeCardViewController, "setPlaceCardItem:withHistory:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v8, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_displayMapRegion"));
  v20.origin.x = GEOMapRectForMapRegion(v9, v10);
  v21 = MKCoordinateRegionForMapRect(v20);
  latitude = v21.center.latitude;
  longitude = v21.center.longitude;
  latitudeDelta = v21.span.latitudeDelta;
  longitudeDelta = v21.span.longitudeDelta;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapView"));
  objc_msgSend(v16, "setRegion:animated:", 1, latitude, longitude, latitudeDelta, longitudeDelta);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapSelectionManager"));
  objc_msgSend(v18, "selectMapItem:animated:", v19, 1);

}

- (void)closeStopDetail
{
  PlaceCardViewController *placeCardViewController;
  id v4;

  placeCardViewController = self->_placeCardViewController;
  if (placeCardViewController)
  {
    self->_placeCardViewController = 0;

    v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

  }
}

- (void)closeSharedTripDetail
{
  void *v3;
  SharedTripListContaineeViewController *listContaineeController;
  SharedTripContaineeViewController *sharedTripInfoController;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTrips](self, "sharedTrips"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {

  }
  else
  {
    listContaineeController = self->_listContaineeController;

    if (listContaineeController)
    {
      -[SharedTripsContext setSelectedTrip:](self, "setSelectedTrip:", 0);
      sharedTripInfoController = self->_sharedTripInfoController;
      self->_sharedTripInfoController = 0;

      v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
      objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

      return;
    }
  }
  -[IOSSharedTripsContext dismiss](self, "dismiss");
}

- (id)cameraController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapCameraController"));

  return v3;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (id)personalizedItemManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "personalizedItemManager"));

  return v3;
}

- (id)routeAnnotationsController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeAnnotationsController"));

  return v3;
}

- (id)searchPinsManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchPinsManager"));

  return v3;
}

- (id)sharedTripsAnnotationsController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sharedTripsAnnotationsController"));

  return v3;
}

- (void)presentDetailsForSelectedTrip
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
    -[IOSSharedTripsContext _presentCardForSharedTrip:](self, "_presentCardForSharedTrip:");
  }
  else
  {
    if (!self->_sharedTripInfoController)
      return;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);
  }

}

- (void)presentErrorForChinaTrip:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext delegate](self, "delegate"));
  objc_msgSend(v5, "presentChinaAlertForSharedTrip:", v4);

}

- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext delegate](self, "delegate"));
  objc_msgSend(v5, "presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:", v4);

}

- (BOOL)provideAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTrips](self, "sharedTrips"));
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100830F3C;
    block[3] = &unk_1011AECC0;
    v12 = v6;
    v13 = v8;
    v14 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  return v9 != 0;
}

- (void)_presentCardForSharedTrip:(id)a3
{
  id v4;
  SharedTripContaineeViewController *v5;
  SharedTripContaineeViewController *sharedTripInfoController;
  id v7;

  v4 = a3;
  v5 = -[SharedTripContaineeViewController initWithSharedTrip:]([SharedTripContaineeViewController alloc], "initWithSharedTrip:", v4);

  sharedTripInfoController = self->_sharedTripInfoController;
  self->_sharedTripInfoController = v5;

  -[SharedTripContaineeViewController setActionDelegate:](self->_sharedTripInfoController, "setActionDelegate:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 1);

}

- (void)didRequestDirectionsForSharedTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "popContextAnimated:completion:", 1, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationWaypointMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v6));
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v10 = MKLaunchOptionsDirectionsModeKey;
  v11 = MKLaunchOptionsDirectionsModeDefault;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  +[MKMapItem openMapsWithItems:launchOptions:completionHandler:](MKMapItem, "openMapsWithItems:launchOptions:completionHandler:", v8, v9, &stru_1011D8A90);

}

- (void)didRequestContactsCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIViewController *v11;
  UIViewController *contactsViewController;
  UIViewController *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t v17[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localContactIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactForCNContactIdentifier:", v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v7));
    objc_msgSend(v8, "setDelegate:", self);
    v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "dismissContactsViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
    objc_msgSend(v10, "setBackBarButtonItem:", v9);

    objc_msgSend(v8, "setDisplayMode:", 1);
    v11 = (UIViewController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
    contactsViewController = self->_contactsViewController;
    self->_contactsViewController = v11;
    v13 = v11;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v14, "_maps_topMostPresentViewController:animated:completion:", self->_contactsViewController, 1, 0);

  }
  else
  {
    v15 = sub_10043237C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "didRequestContactsCard called with no contact present", v17, 2u);
    }

  }
}

- (void)dismissContactsViewController
{
  -[UIViewController dismissViewControllerAnimated:completion:](self->_contactsViewController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  return 1;
}

- (void)dismiss
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v4 = objc_msgSend(v3, "isCurrentContext:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
  v10 = v5;
  if (v4)
  {
    objc_msgSend(v5, "popContextAnimated:completion:", 1, 0);
    v6 = v10;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contexts"));
    v8 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeObject:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSSharedTripsContext chromeViewController](self, "chromeViewController"));
    objc_msgSend(v9, "setContexts:animated:completion:", v8, 0, 0);

    v6 = v8;
  }

}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (ActionCoordination)delegate
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_sharedTripInfoController, 0);
  objc_storeStrong((id *)&self->_listContaineeController, 0);
}

@end

@implementation CarDestinationsModeController

- (CarDestinationsModeController)init
{
  CarDestinationsModeController *v2;
  CarDestinationsCardViewController *v3;
  CarDestinationsCardViewController *destinationsCard;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarDestinationsModeController;
  v2 = -[CarDestinationsModeController init](&v6, "init");
  if (v2)
  {
    v3 = -[CarDestinationsCardViewController initWithDelegate:]([CarDestinationsCardViewController alloc], "initWithDelegate:", v2);
    destinationsCard = v2->_destinationsCard;
    v2->_destinationsCard = v3;

  }
  return v2;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsModeController chromeViewController](self, "chromeViewController"));
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsModeController destinationsCard](self, "destinationsCard"));
    objc_msgSend(v6, "setContent:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CarDestinations_Destinations_Title"), CFSTR("localized string not found"), 0));
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

- (void)destinationsCardDidSelectSavedPlaces:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance", a3));
  objc_msgSend(v3, "displayCollectionList");

}

- (void)destinationsCard:(id)a3 didSelectSuggestion:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v5, "displayRoutePlanningForDestination:", v4);

}

- (void)destinationsCard:(id)a3 didSelectRecent:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];

  v4 = a4;
  v5 = objc_opt_class(SharedTripSummary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "receivedTrips"));
    v8 = objc_msgSend(v7, "count");

    if (v8 != (id)1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v19, "displayAllSharedTrips");
      goto LABEL_10;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "receivedTrips"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v4 = (id)v11;
  }
  v12 = objc_opt_class(GEOSharedNavState);
  if ((objc_opt_isKindOfClass(v4, v12) & 1) != 0)
  {
    v13 = v4;
    v4 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "disallowDetailsForChina"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v24[0] = CFSTR("kMapsInterruptionTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertTitleForDisallowedDetails"));
        v24[1] = CFSTR("kMapsInterruptionMessage");
        v25[0] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertMessageForChinaError"));
        v25[1] = v16;
        v17 = v25;
        v18 = v24;
LABEL_14:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v18, 2));
        v21 = objc_msgSend(v14, "presentInterruptionOfKind:userInfo:completionHandler:", 13, v20, 0);

LABEL_16:
        goto LABEL_17;
      }
      if ((objc_msgSend(v4, "disallowDetailsForTransportType") & 1) != 0
        || objc_msgSend(v4, "disallowDetailsForProtocolVersion"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v22[0] = CFSTR("kMapsInterruptionTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertTitleForDisallowedDetails"));
        v22[1] = CFSTR("kMapsInterruptionMessage");
        v23[0] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertMessageForTransportOrProtocolError"));
        v23[1] = v16;
        v17 = v23;
        v18 = v22;
        goto LABEL_14;
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v14, "displaySharedTrip:", v4);
    goto LABEL_16;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v19, "displayRoutePlanningForDestination:", v4);
LABEL_10:

LABEL_17:
}

- (NSArray)preferredCarFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsModeController destinationsCard](self, "destinationsCard"));

  if (!v3)
    return (NSArray *)&__NSArray0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsModeController destinationsCard](self, "destinationsCard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsModeController chromeViewController](self, "chromeViewController", v4));
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
  return 1006;
}

- (UIScrollView)pptTestScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsModeController destinationsCard](self, "destinationsCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tableView"));

  return (UIScrollView *)v3;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (CarDestinationsCardViewController)destinationsCard
{
  return self->_destinationsCard;
}

- (void)setDestinationsCard:(id)a3
{
  objc_storeStrong((id *)&self->_destinationsCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationsCard, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end

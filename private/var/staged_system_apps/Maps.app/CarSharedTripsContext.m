@implementation CarSharedTripsContext

- (CarSharedTripsContext)init
{
  CarSharedTripsContext *v2;
  CarSharedTripsContext *v3;
  void *v4;
  id v5;
  CarSharedTripsCardViewController *v6;
  CarSharedTripsCardViewController *v7;
  CarSharedTripsCardViewController *listCardViewController;
  void *v9;
  id v10;
  CarSharedTripDetailCardViewController *v11;
  void *v12;
  void *v13;
  CarSharedTripDetailCardViewController *v14;
  CarSharedTripDetailCardViewController *selectedSharedTripCardViewController;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CarSharedTripsContext;
  v2 = -[SharedTripsContext init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTrips](v2, "sharedTrips"));
    v5 = objc_msgSend(v4, "count");

    if ((unint64_t)v5 < 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTrips](v3, "sharedTrips"));
      v10 = objc_msgSend(v9, "count");

      if (v10 == (id)1)
      {
        v11 = [CarSharedTripDetailCardViewController alloc];
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext sharedTrips](v3, "sharedTrips"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v14 = -[CarSharedTripDetailCardViewController initWithSharedTrip:delegate:](v11, "initWithSharedTrip:delegate:", v13, v3);
        selectedSharedTripCardViewController = v3->_selectedSharedTripCardViewController;
        v3->_selectedSharedTripCardViewController = v14;

      }
    }
    else
    {
      objc_initWeak(&location, v3);
      v6 = [CarSharedTripsCardViewController alloc];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100AF1104;
      v17[3] = &unk_1011E22C8;
      objc_copyWeak(&v18, &location);
      v7 = -[CarSharedTripsCardViewController initWithSelectionHandler:](v6, "initWithSelectionHandler:", v17);
      listCardViewController = v3->_listCardViewController;
      v3->_listCardViewController = v7;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  return v3;
}

- (void)dismiss
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v3, "popFromContext:", self);

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unsigned __int8 v13;
  uint8_t buf[4];
  CarSharedTripsContext *v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_100AF12E4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Becoming top context", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AF1324;
  v11[3] = &unk_1011AC838;
  v13 = objc_msgSend(v7, "isAnimated");
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "addPreparation:", v11);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  unsigned __int8 v9;
  uint8_t buf[4];
  CarSharedTripsContext *v11;

  v5 = a4;
  v6 = sub_100AF12E4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Resigning top context", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100AF152C;
  v8[3] = &unk_1011ACE58;
  v9 = objc_msgSend(v5, "isAnimated");
  v8[4] = self;
  objc_msgSend(v5, "addPreparation:", v8);

}

- (id)desiredCards
{
  CarSharedTripDetailCardViewController *selectedSharedTripCardViewController;
  const __CFString **v3;
  uint64_t v4;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];

  selectedSharedTripCardViewController = self->_selectedSharedTripCardViewController;
  if (!self->_listCardViewController)
  {
    if (!selectedSharedTripCardViewController)
      return &__NSArray0__struct;
    v6 = CFSTR("SharedTrip.Selected");
    v3 = &v6;
    goto LABEL_7;
  }
  if (!selectedSharedTripCardViewController)
  {
    v7 = CFSTR("SharedTrip.List");
    v3 = &v7;
LABEL_7:
    v4 = 1;
    return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4));
  }
  v8[0] = CFSTR("SharedTrip.List");
  v8[1] = CFSTR("SharedTrip.Selected");
  v3 = (const __CFString **)v8;
  v4 = 2;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4));
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _OWORD *v17;
  CarSharedTripDetailCardViewController **p_selectedSharedTripCardViewController;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  char v35;
  _BYTE v36[7];
  uint64_t v37;
  char v38;
  _OWORD v39[2];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  char v48;
  _BYTE v49[7];
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  CarSharedTripsContext *v53;
  __int16 v54;
  id v55;

  v6 = a3;
  v7 = a4;
  v8 = sub_100AF12E4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v53 = self;
    v54 = 2112;
    v55 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Configuring card for key: %@", buf, 0x16u);
  }

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SharedTrip.List")))
  {
    objc_msgSend(v6, "setContent:", self->_listCardViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CarPlay_SharedTrips_List_Title"), CFSTR("localized string not found"), 0));
    objc_msgSend(v6, "setTitle:", v11);

    objc_msgSend(v6, "setAccessory:", 1);
    v39[0] = xmmword_100E34B90;
    v39[1] = xmmword_100E2D550;
    v40 = 3;
    v41 = 1148846080;
    v42 = 2;
    v43 = 1148846080;
    v44 = 0;
    v45 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v46 = _Q0;
    v47 = _Q0;
    v48 = 1;
    memset(v49, 0, sizeof(v49));
    v50 = 8;
    v51 = 0;
    if (v6)
    {
      v17 = v39;
LABEL_9:
      objc_msgSend(v6, "setLayout:", v17);
    }
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("SharedTrip.Selected")))
  {
    p_selectedSharedTripCardViewController = &self->_selectedSharedTripCardViewController;
    objc_msgSend(v6, "setContent:", self->_selectedSharedTripCardViewController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CarPlay_SharedTrip_Detail_Title"), CFSTR("localized string not found"), 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController sharedTrip](*p_selectedSharedTripCardViewController, "sharedTrip"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "senderInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v23));
    objc_msgSend(v6, "setTitle:", v24);

    objc_msgSend(v6, "setAccessory:", 1);
    v26[0] = xmmword_100E34B90;
    v26[1] = xmmword_100E2D550;
    v27 = 3;
    v28 = 1148846080;
    v29 = 2;
    v30 = 1148846080;
    v31 = 0;
    v32 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v33 = _Q0;
    v34 = _Q0;
    v35 = 1;
    memset(v36, 0, sizeof(v36));
    v37 = 8;
    v38 = 0;
    if (v6)
    {
      v17 = v26;
      goto LABEL_9;
    }
  }

}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  CarSharedTripsContext *v15;

  v4 = sub_100AF12E4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = 134349056;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Close button tapped", (uint8_t *)&v14, 0xCu);
  }

  if (self->_selectedSharedTripCardViewController && self->_listCardViewController)
  {
    v6 = sub_100AF12E4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = 134349056;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Clearing selected trip", (uint8_t *)&v14, 0xCu);
    }

    -[SharedTripsContext setSelectedTrip:](self, "setSelectedTrip:", 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
    v9 = objc_msgSend(v8, "isTopContext:", self);

    if (v9)
    {
      v10 = sub_100AF12E4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v14 = 134349056;
        v15 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Popping context", (uint8_t *)&v14, 0xCu);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v12, "popFromContext:", self);

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v13, "captureUserAction:", 4);

}

- (void)layoutForUnobscuredBoundsChange
{
  -[SharedTripsContext recenterOnRouteAnimated:](self, "recenterOnRouteAnimated:", 1);
}

- (id)personalizedItemSources
{
  SharedTripsAnnotationsController *annotationsController;
  void *v3;
  void *v4;
  void *v6;

  annotationsController = self->_annotationsController;
  if (!annotationsController)
    return &__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController itemSource](annotationsController, "itemSource"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)cameraController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapCameraController"));

  return v3;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (id)routeAnnotationsController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeAnnotationsController"));

  return v3;
}

- (id)searchPinsManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchPinsManager"));

  return v3;
}

- (id)sharedTripsAnnotationsController
{
  SharedTripsAnnotationsController *annotationsController;
  SharedTripsAnnotationsController *v4;
  SharedTripsAnnotationsController *v5;

  annotationsController = self->_annotationsController;
  if (!annotationsController)
  {
    v4 = objc_alloc_init(SharedTripsAnnotationsController);
    v5 = self->_annotationsController;
    self->_annotationsController = v4;

    annotationsController = self->_annotationsController;
  }
  return annotationsController;
}

- (void)presentDetailsForSelectedTrip
{
  void *v3;
  CarSharedTripDetailCardViewController *v4;
  void *v5;
  CarSharedTripDetailCardViewController *v6;
  CarSharedTripDetailCardViewController *selectedSharedTripCardViewController;
  CarSharedTripDetailCardViewController *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));

  if (v3)
  {
    v4 = [CarSharedTripDetailCardViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
    v6 = -[CarSharedTripDetailCardViewController initWithSharedTrip:delegate:](v4, "initWithSharedTrip:delegate:", v5, self);
    selectedSharedTripCardViewController = self->_selectedSharedTripCardViewController;
    self->_selectedSharedTripCardViewController = v6;

  }
  else
  {
    v8 = self->_selectedSharedTripCardViewController;
    if (!v8)
      return;
    self->_selectedSharedTripCardViewController = 0;

    -[CarSharedTripsCardViewController clearSelection](self->_listCardViewController, "clearSelection");
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v9, "updateCardsForContext:animated:", self, 1);

}

- (void)presentErrorForChinaTrip:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9[0] = CFSTR("kMapsInterruptionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertTitleForDisallowedDetails"));
  v9[1] = CFSTR("kMapsInterruptionMessage");
  v10[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertMessageForChinaError"));

  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v8 = objc_msgSend(v4, "presentInterruptionOfKind:userInfo:completionHandler:", 13, v7, 0);

}

- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9[0] = CFSTR("kMapsInterruptionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertTitleForDisallowedDetails"));
  v9[1] = CFSTR("kMapsInterruptionMessage");
  v10[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertMessageForTransportOrProtocolError"));

  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v8 = objc_msgSend(v4, "presentInterruptionOfKind:userInfo:completionHandler:", 13, v7, 0);

}

- (BOOL)usesDefaultTransitions
{
  return 1;
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
    block[2] = sub_100AF20E8;
    block[3] = &unk_1011AECC0;
    v12 = v6;
    v13 = v8;
    v14 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  return v9 != 0;
}

- (void)sharedTripDetailCard:(id)a3 didSelectAction:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  if (a4 == 1)
  {
    v14 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext _transportTypeStringForAnalytics](self, "_transportTypeStringForAnalytics"));
    objc_msgSend(v12, "captureUserAction:eventValue:", 9028, v13);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier"));
    objc_msgSend(v9, "blockSharedTripWithIdentifier:", v11);
    goto LABEL_5;
  }
  if (!a4)
  {
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext _transportTypeStringForAnalytics](self, "_transportTypeStringForAnalytics"));
    objc_msgSend(v7, "captureUserAction:eventValue:", 6003, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsContext selectedTrip](self, "selectedTrip"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destinationWaypointMapItem"));
    objc_msgSend(v9, "displayRoutePlanningForDestination:", v11);
LABEL_5:

    v6 = v14;
  }

}

- (int)backButtonUsageActionToContext:(id)a3
{
  return 4;
}

- (int)currentUsageTarget
{
  if (self->_selectedSharedTripCardViewController)
    return 1020;
  else
    return 268;
}

- (id)_transportTypeStringForAnalytics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripDetailCardViewController sharedTrip](self->_selectedSharedTripCardViewController, "sharedTrip"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_transportTypeStringForAnalytics"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "receivedTrips"));
    v7 = sub_10039DCD4(v6, &stru_1011E22E8);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")));
  }

  return v4;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsContext chromeViewController](self, "chromeViewController", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v7, 5));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v9;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_selectedSharedTripCardViewController, 0);
  objc_storeStrong((id *)&self->_listCardViewController, 0);
  objc_storeStrong((id *)&self->_annotationsController, 0);
}

@end

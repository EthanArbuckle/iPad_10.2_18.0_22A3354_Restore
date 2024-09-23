@implementation CarRouteGeniusModeController

- (CarRouteGeniusModeController)initWithSuggestion:(id)a3
{
  CarRouteGeniusModeController *v3;
  CarActionButtonsCardViewController *v4;
  CarActionButtonsCardViewController *actionButtonsCardController;
  CarRouteGeniusSuggestionsCardViewController *v6;
  CarRouteGeniusSuggestionsCardViewController *suggestionsCard;
  CarRouteGeniusDetailCardViewController *v8;
  CarRouteGeniusDetailCardViewController *detailCard;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarRouteGeniusModeController;
  v3 = -[CarBasicRouteGeniusModeController initWithSuggestion:](&v11, "initWithSuggestion:", a3);
  if (v3)
  {
    v4 = -[CarActionButtonsCardViewController initWithDelegate:]([CarActionButtonsCardViewController alloc], "initWithDelegate:", v3);
    actionButtonsCardController = v3->_actionButtonsCardController;
    v3->_actionButtonsCardController = v4;

    v3->_shouldRecenterOnRoute = 1;
    -[CarRouteGeniusModeController _updateCurrentSuggestionImage](v3, "_updateCurrentSuggestionImage");
    v6 = objc_alloc_init(CarRouteGeniusSuggestionsCardViewController);
    suggestionsCard = v3->_suggestionsCard;
    v3->_suggestionsCard = v6;

    v8 = -[CarRouteGeniusDetailCardViewController initWithDelegate:]([CarRouteGeniusDetailCardViewController alloc], "initWithDelegate:", v3);
    detailCard = v3->_detailCard;
    v3->_detailCard = v8;

  }
  return v3;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (id)trackingController
{
  CarMapTrackingController *trackingController;
  CarMapTrackingController *v4;
  CarMapTrackingController *v5;

  trackingController = self->_trackingController;
  if (!trackingController)
  {
    v4 = objc_alloc_init(CarMapTrackingController);
    v5 = self->_trackingController;
    self->_trackingController = v4;

    -[CarMapTrackingController setDelegate:](self->_trackingController, "setDelegate:", self);
    trackingController = self->_trackingController;
  }
  return trackingController;
}

- (void)setState:(int64_t)a3
{
  int64_t v5;
  void *v6;
  objc_super v7;

  v5 = -[CarBasicRouteGeniusModeController state](self, "state");
  v7.receiver = self;
  v7.super_class = (Class)CarRouteGeniusModeController;
  -[CarBasicRouteGeniusModeController setState:](&v7, "setState:", a3);
  -[CarRouteGeniusModeController _updateFocusGuides](self, "_updateFocusGuides");
  -[CarRouteGeniusModeController _updateHardwareBackButtonBehavior](self, "_updateHardwareBackButtonBehavior");
  if (-[CarRouteGeniusModeController _needsCardUpdateForTransitionFromState:toState:](self, "_needsCardUpdateForTransitionFromState:toState:", v5, a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v6, "updateCardsForContext:animated:", self, 1);

  }
}

- (BOOL)_needsCardUpdateForTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  BOOL v5;
  BOOL v7;
  char v8;
  BOOL v9;
  char v10;

  v5 = a3 == 4 || (unint64_t)(a3 - 1) < 2;
  v7 = a4 == 4 || (unint64_t)(a4 - 1) < 2;
  v8 = v5 ^ v7;
  if (a3)
    v9 = a4 == 0;
  else
    v9 = 1;
  v10 = v9;
  if ((v8 & 1) != 0)
    v10 = 0;
  return v8 | v10;
}

- (void)_updateHardwareBackButtonBehavior
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[CarBasicRouteGeniusModeController state](self, "state");
  if (v3 > 4)
    v4 = 0;
  else
    v4 = qword_100E3F210[v3];
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setHardwareBackButtonBehavior:forContext:", v4, self);

}

- (void)_updateForCurrentRoute
{
  GEOComposedRoute *currentlyDisplayedRoute;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  GEOComposedRoute *v19;
  GEOComposedRoute *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;

  currentlyDisplayedRoute = self->_currentlyDisplayedRoute;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
  v6 = -[GEOComposedRoute _MapsCarPlay_isEqual:](currentlyDisplayedRoute, "_MapsCarPlay_isEqual:", v5);

  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute description](self->_currentlyDisplayedRoute, "description"));
      v29 = 138412546;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RG mode: _updateForCurrentRoute, new route (%@) was considered equal to current route (%@), we're not redrawing. ", (uint8_t *)&v29, 0x16u);

    }
  }
  else
  {
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute description](self->_currentlyDisplayedRoute, "description"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "route"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
      v29 = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RG mode: _updateForCurrentRoute route changed, updating pins and route annotations, previous: (%@), new: (%@)", (uint8_t *)&v29, 0x16u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
    v19 = (GEOComposedRoute *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "route"));
    v20 = self->_currentlyDisplayedRoute;
    self->_currentlyDisplayedRoute = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "route"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "route"));
      v25 = objc_msgSend(v24, "isNavigable");

    }
    else
    {
      v25 = 0;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
    objc_msgSend(v26, "setRouteIsNavigable:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
    objc_msgSend(v27, "setRouteIsNavigable:", v25);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
    objc_msgSend(v28, "updateRouteAdvisories");

    -[CarBasicRouteGeniusModeController updateRouteAnnotations](self, "updateRouteAnnotations");
    -[CarBasicRouteGeniusModeController updateSearchPins](self, "updateSearchPins");
    -[CarRouteGeniusModeController _updateTraffic](self, "_updateTraffic");
  }
}

- (void)_updateTraffic
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeGeniusAnnotationsManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
  objc_msgSend(v3, "updateTrafficForRoute:", v5);

}

- (void)_startNavigation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id buf[2];

  if (-[CarBasicRouteGeniusModeController state](self, "state") >= 4)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
      v7 = objc_msgSend(v6, "isNavigable");

      if (v7)
      {
        v8 = sub_10043364C();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "RG mode: showing prompt to start nav", (uint8_t *)buf, 2u);
        }

        -[CarRouteGeniusModeController setState:](self, "setState:", 2);
        objc_initWeak(buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100BF2C0C;
        block[3] = &unk_1011AEAA0;
        block[4] = self;
        objc_copyWeak(&v12, buf);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v12);
        objc_destroyWeak(buf);
      }
    }
    else
    {

    }
  }
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 2;
}

- (void)showAutohidingContentWithAnimation:(id)a3
{
  id v4;

  if (!-[CarBasicRouteGeniusModeController state](self, "state", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

  }
}

- (void)hideAutohidingContentWithAnimation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController", a3));
  objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

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
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  CarRouteGeniusModeController *v12;
  _QWORD v13[5];
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CarRouteGeniusModeController;
  v7 = a4;
  -[CarBasicRouteGeniusModeController becomeTopContextInChromeViewController:withAnimation:](&v14, "becomeTopContextInChromeViewController:withAnimation:", v6, v7);
  v12 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BF30E4;
  v13[3] = &unk_1011AC860;
  v13[4] = self;
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100BF32BC;
  v10[3] = &unk_1011AC8B0;
  v11 = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100BF3364;
  v9[3] = &unk_1011AE8F8;
  v8 = v6;
  objc_msgSend(v7, "addPreparation:animations:completion:", v13, v10, v9);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarRouteGeniusModeController;
  -[CarBasicRouteGeniusModeController resignTopContextInChromeViewController:withAnimation:](&v10, "resignTopContextInChromeViewController:withAnimation:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController trackingController](self, "trackingController"));
  objc_msgSend(v5, "setUseForcedTrackingMode:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController trackingController](self, "trackingController"));
  objc_msgSend(v6, "setMapView:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nudgerizer"));
  objc_msgSend(v8, "setDelegate:", 0);

  -[CarRouteGeniusModeController setZoomedSettings:](self, "setZoomedSettings:", 0);
  self->_shouldRecenterOnRoute = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
  objc_msgSend(v9, "resignCurrent");

  -[CarRouteGeniusModeController _tearDownFocusGuides](self, "_tearDownFocusGuides");
}

- (id)desiredCards
{
  int64_t v3;
  void *v6;
  const __CFString **v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];
  const __CFString *v12;

  v3 = -[CarBasicRouteGeniusModeController state](self, "state");
  if ((unint64_t)(v3 - 1) < 2 || v3 == 4)
  {
    v10 = CFSTR("primary");
    return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  else if (v3)
  {
    return &__NSArray0__struct;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    if ((objc_msgSend(v6, "isAutohidingContentHiddenForContext:", self) & 1) != 0)
    {
      v12 = CFSTR("SuggestionCard");
      v7 = &v12;
      v8 = 1;
    }
    else
    {
      v11[0] = CFSTR("SuggestionCard");
      v11[1] = CFSTR("ActionButtons");
      v7 = (const __CFString **)v11;
      v8 = 2;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, v8));

    return v9;
  }
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v23;
  void *v25;
  void *v26;
  id v28;
  const __CFString *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  char v57;
  _BYTE v58[7];
  uint64_t v59;
  char v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  char v72;
  _BYTE v73[7];
  uint64_t v74;
  char v75;
  uint8_t buf[4];
  void *v77;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ActionButtons")))
  {
    if (-[CarBasicRouteGeniusModeController state](self, "state"))
    {
      v8 = sub_10043364C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sub_100A75D00(-[CarBasicRouteGeniusModeController state](self, "state"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 138412290;
        v77 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to configure action buttons card, but mode was in state %@.", buf, 0xCu);

      }
LABEL_25:

      goto LABEL_26;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController actionButtonsCardController](self, "actionButtonsCardController"));
    objc_msgSend(v6, "setContent:", v23);

    memset(v73, 0, sizeof(v73));
    v61 = xmmword_100E34B90;
    v62 = 1;
    v63 = 0;
    v64 = 0;
    v65 = 1065353216;
    v66 = 2;
    v67 = 1148846080;
    v68 = 0;
    v69 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v70 = _Q0;
    v71 = _Q0;
    v72 = 1;
    v74 = 8;
    v75 = 0;
    if (v6)
      objc_msgSend(v6, "setLayout:", &v61);
    objc_msgSend(v6, "setAccessory:", 0);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("SuggestionCard")))
  {
    if (-[CarBasicRouteGeniusModeController state](self, "state"))
    {
      v12 = sub_10043364C();
      v9 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = sub_100A75D00(-[CarBasicRouteGeniusModeController state](self, "state"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 138412290;
        v77 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to configure suggestion card, but mode was in state %@.", buf, 0xCu);

      }
      goto LABEL_25;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionIconView](self, "suggestionIconView"));
    objc_msgSend(v6, "setAccessoryView:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
    objc_msgSend(v6, "setContent:", v26);

    memset(v58, 0, sizeof(v58));
    v46 = xmmword_100E2F4D0;
    v47 = 1;
    v48 = 0;
    v49 = 0;
    v50 = 1065353216;
    v51 = 2;
    v52 = 1148846080;
    v53 = 0;
    v54 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v55 = _Q0;
    v56 = _Q0;
    v57 = 1;
    v59 = 8;
    v60 = 0;
    if (v6)
      objc_msgSend(v6, "setLayout:", &v46);
    objc_msgSend(v6, "setAccessory:", 1);
    objc_initWeak((id *)buf, self);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100BF3AE4;
    v44[3] = &unk_1011AE8D0;
    objc_copyWeak(&v45, (id *)buf);
    objc_msgSend(v6, "setSelectionHandler:", v44);
    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("primary")))
  {
    v15 = -[CarBasicRouteGeniusModeController state](self, "state");
    if (v15 <= 4)
    {
      if (((1 << v15) & 0x16) == 0)
      {
        v28 = sub_10043364C();
        v9 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v29 = sub_100A75D00(-[CarBasicRouteGeniusModeController state](self, "state"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          *(_DWORD *)buf = 138412290;
          v77 = v30;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to configure primary card, but was in %@ state.", buf, 0xCu);

        }
        goto LABEL_25;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController _detailCardTitle](self, "_detailCardTitle"));
      objc_msgSend(v6, "setTitle:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
      objc_msgSend(v6, "setContent:", v17);

      HIDWORD(v41) = 0;
      *(_DWORD *)((char *)&v41 + 1) = 0;
      v31 = xmmword_100E34B90;
      v32 = xmmword_100E2D550;
      v33 = 3;
      v34 = 1148846080;
      v35 = 2;
      LODWORD(v36) = 1148846080;
      v37 = 0;
      v38 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      v39 = _Q0;
      v40 = _Q0;
      LOBYTE(v41) = 1;
      v42 = 8;
      LOBYTE(v43) = 0;
      if (v6)
        objc_msgSend(v6, "setLayout:", &v31);
      objc_msgSend(v6, "setAccessory:", 1, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
      objc_msgSend(v6, "setSelectionHandler:", 0);
    }
  }
LABEL_26:

}

- (void)chromeDidStartConfiguringCards:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[CarBasicRouteGeniusModeController state](self, "state", a3);
  if (v4 <= 4 && ((1 << v4) & 0x16) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
    objc_msgSend(v5, "setHasCardFinishedTransitioning:", 0);

  }
}

- (void)chromeDidEndConfiguringCards:(id)a3
{
  unint64_t v4;
  id v5;

  -[CarRouteGeniusModeController _buildFocusGuidesIfNeeded](self, "_buildFocusGuidesIfNeeded", a3);
  v4 = -[CarBasicRouteGeniusModeController state](self, "state");
  if (v4 <= 4 && ((1 << v4) & 0x16) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
    objc_msgSend(v5, "setHasCardFinishedTransitioning:", 1);

  }
}

- (void)_suggestionsCardTapped
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t v9[16];

  if (-[CarBasicRouteGeniusModeController state](self, "state"))
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: card was tapped, but state was not CarRouteGeniusStatePending.", v9, 2u);
    }

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legs"));
    v8 = objc_msgSend(v7, "count");

    if ((unint64_t)v8 < 2)
      -[CarRouteGeniusModeController setState:](self, "setState:", 1);
    else
      -[CarRouteGeniusModeController _presentRoutePlanningForCurrentSuggestion](self, "_presentRoutePlanningForCurrentSuggestion");
  }
}

- (void)_presentRoutePlanningForCurrentSuggestion
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entry"));

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "RouteGeniusModeController: _presentRoutePlanningForCurrentSuggestion: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v6, "displayRoutePlanningForDestination:", v3);

  }
}

- (void)_dismissDetailCard
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if ((id)-[CarBasicRouteGeniusModeController state](self, "state") == (id)1)
  {
    -[CarRouteGeniusModeController setState:](self, "setState:", 0);
  }
  else
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "RouteGeniusModeController: tried to dismiss detail card, but was not in .Expanded state.", v5, 2u);
    }

  }
}

- (id)_detailCardTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entry"));

  if (objc_msgSend(v4, "type") == (id)5 || objc_msgSend(v4, "type") == (id)11)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  }
  else
  {
    v6 = 0;
  }
  if (!-[GEOComposedRoute isEVRoute](self->_currentlyDisplayedRoute, "isEVRoute")
    || objc_msgSend(v4, "type") != (id)11)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

    v6 = (void *)v7;
  }
  if (objc_msgSend(v6, "length"))
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CarPlay_RouteGenius_Destination"), CFSTR("localized string not found"), 0));

  }
  return v8;
}

- (id)suggestionCardView
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v4)
  {
    while (1)
    {
      v5 = objc_opt_class(CarCardView);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
        break;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

      v4 = (id)v6;
      if (!v6)
        goto LABEL_6;
    }
    v4 = v4;
  }
LABEL_6:

  return v4;
}

- (id)preferredCarFocusEnvironments
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));

  if (!v3)
    return &__NSArray0__struct;
  if (-[CarBasicRouteGeniusModeController state](self, "state") < 1)
    v4 = objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
  else
    v4 = objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
  v6 = (void *)v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
  v9 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v8;
}

- (id)carFocusOrderSequences
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
  _QWORD v13[3];
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v13[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemRepresentingMapControls"));
  v13[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v9, 5));
  v14 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

  return v11;
}

- (void)carCardView:(id)a3 didChangeFocus:(BOOL)a4
{
  self->_isSuggestionCardFocused = a4;
  -[CarRouteGeniusModeController _updateFocusGuides](self, "_updateFocusGuides", a3);
}

- (void)_buildFocusGuidesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  NSArray *closeButtonRedirectingFocusGuides;
  id v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  id v23;
  id v24;
  uint8_t v25[8];
  void *v26;
  void *v27;
  _QWORD v28[2];

  if (!self->_closeButtonRedirectingFocusGuides)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionCardView](self, "suggestionCardView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryContainerView"));

    if (v8)
    {
      if (v4 && (objc_msgSend(v6, "isDescendantOfView:", v4) & 1) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

        v27 = v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapsCar_insertFocusGuideWithOriginView:toDestinationFocusEnvironments:forDirection:", v8, v11, 1));
        v28[0] = v12;
        v26 = v8;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
        if (v10 == (id)1)
          v14 = 4;
        else
          v14 = 8;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapsCar_insertFocusGuideWithOriginView:toDestinationFocusEnvironments:forDirection:", v6, v13, v14));
        v28[1] = v15;
        v16 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
        closeButtonRedirectingFocusGuides = self->_closeButtonRedirectingFocusGuides;
        self->_closeButtonRedirectingFocusGuides = v16;

        v18 = sub_10043364C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        *(_WORD *)v25 = 0;
        v20 = "RG mode: _buildFocusGuidesIfNeeded, successfully built focus guides";
        v21 = v19;
        v22 = OS_LOG_TYPE_INFO;
        goto LABEL_15;
      }
      v23 = sub_10043364C();
      v19 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        v20 = "RG mode: _buildFocusGuidesIfNeeded, failed to build focus guides because the originView isn't a descendant"
              " of the hostview.";
LABEL_14:
        v21 = v19;
        v22 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, v25, 2u);
      }
    }
    else
    {
      v24 = sub_10043364C();
      v19 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        v20 = "RG mode: _buildFocusGuidesIfNeeded, failed to build focus guides, because destination view was nil";
        goto LABEL_14;
      }
    }
LABEL_16:

  }
}

- (void)_tearDownFocusGuides
{
  NSArray *closeButtonRedirectingFocusGuides;

  -[NSArray enumerateObjectsUsingBlock:](self->_closeButtonRedirectingFocusGuides, "enumerateObjectsUsingBlock:", &stru_1011E8D80);
  closeButtonRedirectingFocusGuides = self->_closeButtonRedirectingFocusGuides;
  self->_closeButtonRedirectingFocusGuides = 0;

}

- (void)_updateFocusGuides
{
  BOOL isSuggestionCardFocused;
  NSArray *closeButtonRedirectingFocusGuides;
  _QWORD v5[4];
  BOOL v6;

  if (-[CarBasicRouteGeniusModeController state](self, "state"))
  {
    -[CarRouteGeniusModeController _tearDownFocusGuides](self, "_tearDownFocusGuides");
  }
  else
  {
    -[CarRouteGeniusModeController _buildFocusGuidesIfNeeded](self, "_buildFocusGuidesIfNeeded");
    if (-[CarBasicRouteGeniusModeController state](self, "state"))
      isSuggestionCardFocused = 0;
    else
      isSuggestionCardFocused = self->_isSuggestionCardFocused;
    closeButtonRedirectingFocusGuides = self->_closeButtonRedirectingFocusGuides;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100BF4620;
    v5[3] = &unk_1011E8DA0;
    v6 = isSuggestionCardFocused;
    -[NSArray enumerateObjectsUsingBlock:](closeButtonRedirectingFocusGuides, "enumerateObjectsUsingBlock:", v5);
  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  unint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationDisplay"));
  v6 = objc_msgSend(v5, "isCameraPanning");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
  LODWORD(v5) = objc_msgSend(v7, "isIncidentReportingEnabled");

  v9 = 3;
  if (!(_DWORD)v5)
    v9 = 0;
  if (v6)
    v9 = 6;
  retstr->var0 = 1;
  retstr->var1 = v9;
  retstr->var2 = 5;
  return result;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (BOOL)zoomOutButtonPressed
{
  return -[CarRouteGeniusModeController _zoomButtonPressed](self, "_zoomButtonPressed");
}

- (BOOL)zoomInButtonPressed
{
  return -[CarRouteGeniusModeController _zoomButtonPressed](self, "_zoomButtonPressed");
}

- (BOOL)_zoomButtonPressed
{
  void *v3;
  BOOL v4;

  if (-[CarBasicRouteGeniusModeController wantsNavigationDisplay](self, "wantsNavigationDisplay")
    || !-[CarRouteGeniusModeController shouldRecenterOnRoute](self, "shouldRecenterOnRoute"))
  {
    return 0;
  }
  -[CarRouteGeniusModeController setShouldRecenterOnRoute:](self, "setShouldRecenterOnRoute:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController zoomedSettings](self, "zoomedSettings"));
  v4 = 1;
  objc_msgSend(v3, "applyToMapViewAnimated:duration:completion:", 1, 0, -1.0);

  return v4;
}

- (void)handleHardwareBackButtonPressed
{
  int64_t v3;
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;

  v3 = -[CarBasicRouteGeniusModeController state](self, "state");
  if ((unint64_t)(v3 - 2) < 3)
  {
LABEL_4:
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sub_100A75D00(-[CarBasicRouteGeniusModeController state](self, "state"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "RouteGenius mode was asked to handle HW back button press, but the HW back button behavior for state %@ shouldn't be .Custom.", (uint8_t *)&v10, 0xCu);

    }
    return;
  }
  if (v3 != 1)
  {
    if (v3)
      return;
    goto LABEL_4;
  }
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "RG mode: hw back button pressed -> dismissing detail card", (uint8_t *)&v10, 2u);
  }

  -[CarRouteGeniusModeController _dismissDetailCard](self, "_dismissDetailCard");
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));

  if (v5 == v6)
  {
    v12 = sub_10043364C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "RG mode tapped close button accessory on suggestion card. The mode will be popped.", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v14, "captureUserAction:", 6082);

    -[CarRouteGeniusModeController setState:](self, "setState:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "platformController"));
    objc_msgSend(v16, "clearIfCurrentSessionIsKindOfClass:", objc_opt_class(RouteGeniusSession));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeGeniusManager"));
    objc_msgSend(v18, "deactivateForAllChromes");

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));

    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7 == v8)
    {
      if (v11)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "RG mode tapped close button accessory on detail card. Will dismiss detail card and present suggestion card.", v20, 2u);
      }

      -[CarRouteGeniusModeController _dismissDetailCard](self, "_dismissDetailCard");
    }
    else
    {
      if (v11)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "RG mode tapped close button accessory on a card that is not tracked.", v19, 2u);
      }

    }
  }

}

- (void)trackingController:(id)a3 changedToForcedTrackingMode:(int64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  int64_t v9;

  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RG mode: _trackingController:changedToForcedTrackingMode %ld", (uint8_t *)&v8, 0xCu);
  }

  -[CarRouteGeniusModeController setShouldRecenterOnRoute:](self, "setShouldRecenterOnRoute:", a4 == 1);
}

- (BOOL)allowMapZoomAndRecentering
{
  return !-[CarRouteGeniusModeController shouldRecenterOnRoute](self, "shouldRecenterOnRoute");
}

- (void)frameRouteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CarRouteGeniusModeController shouldRecenterOnRoute](self, "shouldRecenterOnRoute"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CarRouteGeniusModeController;
    -[CarBasicRouteGeniusModeController frameRouteAnimated:](&v5, "frameRouteAnimated:", v3);
  }
}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CarRouteGeniusModeController shouldRecenterOnRoute](self, "shouldRecenterOnRoute"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CarRouteGeniusModeController;
    -[CarBasicRouteGeniusModeController recenterCameraOnRouteAnimated:](&v5, "recenterCameraOnRouteAnimated:", v3);
  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  -[CarRouteGeniusModeController _mapViewGestured](self, "_mapViewGestured", a3, a4, a5);
}

- (void)incidentsReportingEnablementDidUpdate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v3, "reloadAccessoriesForContext:animated:", self, 0);

}

- (void)nudgerizer:(id)a3 didGestureMapView:(id)a4 inDirection:(int64_t)a5
{
  -[CarRouteGeniusModeController _mapViewGestured](self, "_mapViewGestured", a3, a4, a5);
}

- (void)_mapViewGestured
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "RG mode: _mapViewGestured", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController trackingController](self, "trackingController"));
  objc_msgSend(v5, "setForcedTrackingMode:", 0);

}

- (void)setCurrentSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarRouteGeniusModeController;
  -[CarBasicRouteGeniusModeController setCurrentSuggestion:](&v11, "setCurrentSuggestion:", v4);
  if (v4)
  {
    -[CarRouteGeniusModeController _updateCurrentSuggestionImage](self, "_updateCurrentSuggestionImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
    objc_msgSend(v5, "setCurrentSuggestion:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
    objc_msgSend(v6, "setCurrentSuggestion:", v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController _guidanceETAFromEntry:](self, "_guidanceETAFromEntry:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
    objc_msgSend(v9, "setCurrentETA:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
    objc_msgSend(v10, "setCurrentETA:", v8);

  }
}

- (void)_updateCurrentSuggestionImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionImageFetchIdentifier](self, "suggestionImageFetchIdentifier"));
  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v6;
    v20 = 2112;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RG mode: _updateCurrentSuggestionImage started fetching (%{public}@) image for suggestion: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCarCache](MapsUIImageCache, "sharedCarCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entry"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100BF4F98;
  v14[3] = &unk_1011B93F0;
  objc_copyWeak(&v17, (id *)buf);
  v12 = v6;
  v15 = v12;
  v13 = v5;
  v16 = v13;
  objc_msgSend(v9, "getImageForSuggestion:completion:", v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (id)suggestionImageFetchIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (void)setCurrentSuggestionImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_currentSuggestionImage != v6)
  {
    objc_storeStrong((id *)&self->_currentSuggestionImage, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionIconView](self, "suggestionIconView"));
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (CarRouteGeniusSuggestionIconView)suggestionIconView
{
  CarRouteGeniusSuggestionIconView *suggestionIconView;
  CarRouteGeniusSuggestionIconView *v4;
  void *v5;
  CarRouteGeniusSuggestionIconView *v6;
  CarRouteGeniusSuggestionIconView *v7;

  suggestionIconView = self->_suggestionIconView;
  if (!suggestionIconView)
  {
    v4 = [CarRouteGeniusSuggestionIconView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController currentSuggestionImage](self, "currentSuggestionImage"));
    v6 = -[CarRouteGeniusSuggestionIconView initWithImage:](v4, "initWithImage:", v5);
    v7 = self->_suggestionIconView;
    self->_suggestionIconView = v6;

    suggestionIconView = self->_suggestionIconView;
  }
  return suggestionIconView;
}

- (BOOL)startNavWithETAOnly
{
  return (id)-[CarRouteGeniusModeController navigationType](self, "navigationType") == (id)2;
}

- (void)setShouldRecenterOnRoute:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;

  if (self->_shouldRecenterOnRoute != a3)
  {
    v3 = a3;
    self->_shouldRecenterOnRoute = a3;
    v5 = -[CarBasicRouteGeniusModeController wantsNavigationDisplay](self, "wantsNavigationDisplay");
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v3)
        v8 = CFSTR("YES");
      v9 = v8;
      v17 = 138412290;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RG mode: shouldRecenterOnRoute set: %@", (uint8_t *)&v17, 0xCu);

    }
    v10 = ((v5 | v3) & 1) == 0
       && +[CarChromeViewController allowOneHandedZooming](CarChromeViewController, "allowOneHandedZooming");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController mapView](self, "mapView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_oneHandedZoomGestureRecognizer"));
    objc_msgSend(v12, "setEnabled:", v10);

    if ((v5 & 1) == 0)
    {
      if (!self->_shouldRecenterOnRoute)
        goto LABEL_14;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController carChromeViewController](self, "carChromeViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routeGeniusAnnotationsManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "destination"));

      if (v15)
      {
        -[CarRouteGeniusModeController frameRouteAnimated:](self, "frameRouteAnimated:", 1);
        return;
      }
      if (!self->_shouldRecenterOnRoute)
      {
LABEL_14:
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController routeGeniusMapSettings](self, "routeGeniusMapSettings"));
        objc_msgSend(v16, "applyToMapViewAnimated:duration:completion:", 1, 0, 0.0);

      }
    }
  }
}

- (void)_startNavigationIfNeededOrFail
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  if (-[CarBasicRouteGeniusModeController state](self, "state") >= 4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));

    v4 = v6;
    if (v6)
    {
      v5 = objc_msgSend(v6, "isNavigable");
      v4 = v6;
      if (v5)
      {
        -[CarRouteGeniusModeController _startNavigation](self, "_startNavigation");
        v4 = v6;
      }
    }

  }
}

- (id)_guidanceETAFromEntry:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  GuidanceETA *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  GuidanceETA *v16;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
  v7 = [GuidanceETA alloc];
  objc_msgSend(v5, "etaInSeconds");
  v9 = v8;

  objc_msgSend(v6, "distance");
  v11 = v10;
  v12 = objc_msgSend(v6, "isEVRoute");
  if (v12)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastEVStep"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "evInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "remainingBatteryPercentage")));
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timezone"));
  v16 = -[GuidanceETA initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:](v7, "initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:", v13, v15, objc_msgSend(v6, "transportType"), v9, v11);

  if (v12)
  {

  }
  return v16;
}

- (void)detailCardDidAccept:(id)a3 navigationType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t Log;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v17 = 134217984;
    v18 = (const char *)a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RouteGenius: detailCardDidAccept, navigationType: %ld", (uint8_t *)&v17, 0xCu);
  }

  if (-[CarBasicRouteGeniusModeController navigationAidedDrivingEnabled](self, "navigationAidedDrivingEnabled"))
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarRouteGeniusModeController");
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Car/CarRouteGeniusModeController.m";
      v19 = 1024;
      v20 = 816;
      v21 = 2082;
      v22 = "-[CarRouteGeniusModeController detailCardDidAccept:navigationType:]";
      v23 = 2082;
      v24 = "self.navigationAidedDrivingEnabled";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. We should only expect Dismiss or Handoff when NAD is enabled.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v17, 0x26u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
  v13 = objc_msgSend(v12, "type");

  if (v13 == (id)10)
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarRouteGeniusModeController");
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Car/CarRouteGeniusModeController.m";
      v19 = 1024;
      v20 = 818;
      v21 = 2082;
      v22 = "-[CarRouteGeniusModeController detailCardDidAccept:navigationType:]";
      v23 = 2082;
      v24 = "[self.currentSuggestion entry].type == MapsSuggestionsEntryTypeCarPlayLowEnergy";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Route genius no longer supports low fuel suggestions";
      goto LABEL_9;
    }
LABEL_10:

    return;
  }
  -[CarRouteGeniusModeController setNavigationType:](self, "setNavigationType:", a4);
  -[CarRouteGeniusModeController setState:](self, "setState:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "route"));

  if (v16)
    -[CarRouteGeniusModeController _startNavigationIfNeededOrFail](self, "_startNavigationIfNeededOrFail");
}

- (void)detailCardDidHandOff:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id buf[2];

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RouteGenius: detailCardDidHandOff", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController currentSuggestion](self, "currentSuggestion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100BF59D4;
  v12[3] = &unk_1011E8DC8;
  objc_copyWeak(&v14, buf);
  v12[4] = self;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "handoffDestination:completion:", v11, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);

}

- (void)actionButtonsCard:(id)a3 didSelectAction:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;

  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v15 = 134217984;
    v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RouteGenius: actionButtonsCard:didSelectAction: %lu", (uint8_t *)&v15, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "platformController"));
  objc_msgSend(v9, "clearIfCurrentSessionIsKindOfClass:", objc_opt_class(RouteGeniusSession));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeGeniusManager"));
  objc_msgSend(v11, "deactivateForAllChromes");

  if (a4 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v14, "captureUserAction:", 9013);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v13, "displayDestinations");
  }
  else
  {
    if (a4)
      return;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicRouteGeniusModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v12, "captureUserAction:", 9006);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v13, "displaySearchCategories");
  }

}

- (int)currentUsageTarget
{
  return 1006;
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
  objc_msgSend(v5, "setCurrentSuggestion:", v4);

  -[CarRouteGeniusModeController setCurrentSuggestion:](self, "setCurrentSuggestion:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController _guidanceETAFromEntry:](self, "_guidanceETAFromEntry:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController suggestionsCard](self, "suggestionsCard"));
  objc_msgSend(v6, "setCurrentETA:", v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusModeController detailCard](self, "detailCard"));
  objc_msgSend(v7, "setCurrentETA:", v8);

  -[CarRouteGeniusModeController _updateCurrentSuggestionImage](self, "_updateCurrentSuggestionImage");
  -[CarRouteGeniusModeController _updateForCurrentRoute](self, "_updateForCurrentRoute");
  -[CarRouteGeniusModeController _startNavigationIfNeededOrFail](self, "_startNavigationIfNeededOrFail");

}

- (BOOL)shouldRecenterOnRoute
{
  return self->_shouldRecenterOnRoute;
}

- (unint64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(unint64_t)a3
{
  self->_navigationType = a3;
}

- (UIImage)currentSuggestionImage
{
  return self->_currentSuggestionImage;
}

- (CarRouteGeniusSuggestionsCardViewController)suggestionsCard
{
  return self->_suggestionsCard;
}

- (void)setSuggestionsCard:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsCard, a3);
}

- (CarRouteGeniusDetailCardViewController)detailCard
{
  return self->_detailCard;
}

- (void)setDetailCard:(id)a3
{
  objc_storeStrong((id *)&self->_detailCard, a3);
}

- (void)setSuggestionIconView:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionIconView, a3);
}

- (ChromeMapSettings)zoomedSettings
{
  return self->_zoomedSettings;
}

- (void)setZoomedSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomedSettings, a3);
}

- (CarActionButtonsCardViewController)actionButtonsCardController
{
  return self->_actionButtonsCardController;
}

- (void)setActionButtonsCardController:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonsCardController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonsCardController, 0);
  objc_storeStrong((id *)&self->_zoomedSettings, 0);
  objc_storeStrong((id *)&self->_suggestionIconView, 0);
  objc_storeStrong((id *)&self->_detailCard, 0);
  objc_storeStrong((id *)&self->_suggestionsCard, 0);
  objc_storeStrong((id *)&self->_currentSuggestionImage, 0);
  objc_storeStrong((id *)&self->_trackingController, 0);
  objc_storeStrong((id *)&self->_closeButtonRedirectingFocusGuides, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedRoute, 0);
}

@end

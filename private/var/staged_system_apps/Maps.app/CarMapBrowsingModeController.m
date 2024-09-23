@implementation CarMapBrowsingModeController

- (CarMapBrowsingModeController)init
{
  CarMapBrowsingModeController *v2;
  CarPreciseLocationOffButtonCardViewController *v3;
  CarPreciseLocationOffButtonCardViewController *preciseLocationOffButtonCardController;
  CarActionButtonsCardViewController *v5;
  CarActionButtonsCardViewController *actionButtonsCardController;
  CarShortcutsCardViewController *v7;
  CarShortcutsCardViewController *shortcutsCardController;
  TrafficIncidentItemSource *v9;
  TrafficIncidentItemSource *incidentItemSource;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CarMapBrowsingModeController;
  v2 = -[CarMapBrowsingModeController init](&v12, "init");
  if (v2)
  {
    v3 = -[CarPreciseLocationOffButtonCardViewController initWithDelegate:]([CarPreciseLocationOffButtonCardViewController alloc], "initWithDelegate:", v2);
    preciseLocationOffButtonCardController = v2->_preciseLocationOffButtonCardController;
    v2->_preciseLocationOffButtonCardController = v3;

    v5 = -[CarActionButtonsCardViewController initWithDelegate:]([CarActionButtonsCardViewController alloc], "initWithDelegate:", v2);
    actionButtonsCardController = v2->_actionButtonsCardController;
    v2->_actionButtonsCardController = v5;

    v7 = objc_alloc_init(CarShortcutsCardViewController);
    shortcutsCardController = v2->_shortcutsCardController;
    v2->_shortcutsCardController = v7;

    -[CarShortcutsCardViewController setDelegate:](v2->_shortcutsCardController, "setDelegate:", v2);
    v9 = objc_alloc_init(TrafficIncidentItemSource);
    incidentItemSource = v2->_incidentItemSource;
    v2->_incidentItemSource = v9;

  }
  return v2;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (id)desiredCards
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v4 = objc_msgSend(v3, "isAutohidingContentHiddenForContext:", self);

  if ((v4 & 1) != 0)
  {
    v5 = &__NSArray0__struct;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
    if (-[CarPreciseLocationOffButtonCardViewController shouldBeVisible](self->_preciseLocationOffButtonCardController, "shouldBeVisible"))
    {
      objc_msgSend(v6, "addObject:", CFSTR("PreciseLocationOffButton"));
    }
    else if (-[CarShortcutsCardViewController shouldBeVisible](self->_shortcutsCardController, "shouldBeVisible"))
    {
      objc_msgSend(v6, "addObject:", CFSTR("Shortcuts"));
    }
    if (!-[CarShortcutsCardViewController expanded](self->_shortcutsCardController, "expanded"))
      objc_msgSend(v6, "addObject:", CFSTR("ActionButtons"));
    v5 = objc_msgSend(v6, "copy");

  }
  return v5;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __int128 *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  char v51;
  _BYTE v52[7];
  uint64_t v53;
  char v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  char v66;
  _BYTE v67[7];
  uint64_t v68;
  char v69;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PreciseLocationOffButton")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController preciseLocationOffButtonCardController](self, "preciseLocationOffButtonCardController"));
    objc_msgSend(v6, "setContent:", v8);

    memset(v67, 0, sizeof(v67));
    v55 = xmmword_100E2F4D0;
    v56 = 1;
    v57 = 0;
    v58 = 0;
    v59 = 1065353216;
    v60 = 2;
    v61 = 1148846080;
    v62 = 0;
    v63 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v64 = _Q0;
    v65 = _Q0;
    v66 = 1;
    v68 = 8;
    v69 = 0;
    if (v6)
    {
      v14 = &v55;
LABEL_17:
      objc_msgSend(v6, "setLayout:", v14, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Shortcuts")))
  {
    v15 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = v16;
    if (v15)
      v18 = CFSTR("CarPlay_Pinned");
    else
      v18 = CFSTR("CarPlay_Favorites");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, CFSTR("localized string not found"), 0));
    objc_msgSend(v6, "setTitle:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController shortcutsCardController](self, "shortcutsCardController"));
    objc_msgSend(v6, "setContent:", v20);

    memset(v52, 0, sizeof(v52));
    v40 = xmmword_100E2F4D0;
    v41 = 1;
    v42 = 0;
    v43 = 0;
    v44 = 1065353216;
    v45 = 2;
    v46 = 1148846080;
    v47 = 0;
    v48 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v49 = _Q0;
    v50 = _Q0;
    v51 = 1;
    v53 = 8;
    v54 = 0;
    if (v6)
      objc_msgSend(v6, "setLayout:", &v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController shortcutsCardController](self, "shortcutsCardController"));
    if (objc_msgSend(v22, "canBeExpanded"))
      v23 = 2;
    else
      v23 = 0;
    objc_msgSend(v6, "setAccessory:", v23);

  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ActionButtons")))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController actionButtonsCardController](self, "actionButtonsCardController"));
    objc_msgSend(v6, "setContent:", v24);

    HIDWORD(v37) = 0;
    *(_DWORD *)((char *)&v37 + 1) = 0;
    v26 = xmmword_100E34B90;
    v27 = 1;
    v28 = 0;
    v29 = 0;
    v30 = 1065353216;
    v31 = 2;
    LODWORD(v32) = 1148846080;
    v33 = 0;
    v34 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v35 = _Q0;
    v36 = _Q0;
    LOBYTE(v37) = 1;
    v38 = 8;
    LOBYTE(v39) = 0;
    if (v6)
    {
      v14 = &v26;
      goto LABEL_17;
    }
LABEL_18:
    objc_msgSend(v6, "setAccessory:", 0, v26, v27, v28, v29, v30, v31, v32);
  }

}

- (id)personalizedItemSources
{
  TrafficIncidentItemSource *incidentItemSource;

  incidentItemSource = self->_incidentItemSource;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &incidentItemSource, 1));
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  unint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
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

- (void)preciseLocationOffButtonCardDidSelectAction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate", a3));
  objc_msgSend(v3, "interruptApplicationWithKind:userInfo:completionHandler:", 15, 0, 0);

}

- (void)preciseLocationOffButtonCard:(id)a3 visibilityUpdated:(BOOL)a4
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3, a4));
  v6 = objc_msgSend(v5, "isCurrentContext:", self);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "updateCardsForContext:animated:", self, 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "setNeedsFocusUpdate");

    v11 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v11, "updateFocusIfNeeded");

  }
  else
  {
    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update precise location off visibility, but it is not the current mode.", buf, 2u);
    }

  }
}

- (void)carShortcutsCardViewController:(id)a3 visibilityUpdated:(BOOL)a4
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3, a4));
  v6 = objc_msgSend(v5, "isCurrentContext:", self);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "updateCardsForContext:animated:", self, 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "setNeedsFocusUpdate");

    v11 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v11, "updateFocusIfNeeded");

  }
  else
  {
    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update shortcuts visibility, but it is not the current mode.", buf, 2u);
    }

  }
}

- (void)carShortcutsCardViewController:(id)a3 canBeExpandedUpdated:(BOOL)a4
{
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3, a4));
  v6 = objc_msgSend(v5, "isCurrentContext:", self);

  if ((v6 & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v9, "updateCardsForContext:animated:", self, 1);

  }
  else
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update shortcuts expanded state, but it is not the current mode.", buf, 2u);
    }

  }
}

- (void)actionButtonsCard:(id)a3 didSelectAction:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;

  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134217984;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "actionButtonsCard:didSelectAction: %lu", (uint8_t *)&v11, 0xCu);
  }

  if (a4 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v10, "captureUserAction:", 9013);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v9, "displayDestinations");
  }
  else
  {
    if (a4)
      return;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "captureUserAction:", 9006);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v9, "displaySearchCategories");
  }

}

- (void)checkFullTextSearchSupport
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController actionButtonsCardController](self, "actionButtonsCardController"));
  objc_msgSend(v2, "checkFullTextSearchSupport");

}

- (void)carCardView:(id)a3 chevronButtonSelected:(id)a4
{
  id v5;

  -[CarShortcutsCardViewController setExpanded:](self->_shortcutsCardController, "setExpanded:", objc_msgSend(a4, "isSelected", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "updateCardsForContext:animated:", self, 1);

}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  self->_didStartUserInteraction = 1;
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  void *v17;
  id v18;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  if (v6)
  {
    v18 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v11, "captureUserActionChangedTrackingMode:", a4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultMapSettings"));
    objc_msgSend(v13, "setTrackingMode:", a4);

    v10 = v18;
    if (a4 != 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "camera"));
      objc_msgSend(v14, "heading");
      if (v15 != 0.0)
      {
        v16 = objc_msgSend(v14, "copy");

        objc_msgSend(v16, "setHeading:", 0.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController mapView](self, "mapView"));
        objc_msgSend(v17, "setCamera:animated:", v16, v7);

        v14 = v16;
      }

      v10 = v18;
    }
  }

}

- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3
{
  return self->_didStartUserInteraction;
}

- (void)mapViewDidStopUserInteraction:(id)a3
{
  self->_didStartUserInteraction = 0;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!objc_msgSend(v11, "userTrackingMode"))
  {
    objc_msgSend(v11, "centerCoordinate");
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultMapSettings"));
    objc_msgSend(v10, "setCenterCoordinate:", v6, v8);

  }
}

- (BOOL)allowMapZoomAndRecentering
{
  return 1;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 2;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (void)showAutohidingContentWithAnimation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3));
  objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

}

- (void)hideAutohidingContentWithAnimation:(id)a3
{
  id v4;

  -[CarShortcutsCardViewController setExpanded:](self->_shortcutsCardController, "setExpanded:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  char v28;
  char v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  _QWORD v32[5];
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CarMapBrowsingModeController;
  -[CarBasicMapBrowsingModeController becomeTopContextInChromeViewController:withAnimation:](&v33, "becomeTopContextInChromeViewController:withAnimation:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v9 = objc_msgSend(v8, "hasDeferredAction:forContext:", CFSTR("SetMapRegion"), self);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousTopContext"));
    v11 = objc_opt_class(CarSearchResultsModeController);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      v13 = objc_opt_class(CarDestinationsModeController);
      isKindOfClass = objc_opt_isKindOfClass(v10, v13);
    }
    v14 = isKindOfClass & 1;
    v15 = objc_opt_class(CarNavigationModeController);
    if ((objc_opt_isKindOfClass(v10, v15) & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      v17 = objc_opt_class(CarRouteGeniusModeController);
      v16 = objc_opt_isKindOfClass(v10, v17);
    }
    v18 = v16 & 1;
    v19 = objc_opt_class(CarMapPanningModeController);
    if ((objc_opt_isKindOfClass(v10, v19) & 1) != 0)
      v20 = objc_msgSend(v10, "mapWasPanned");
    else
      v20 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchSession"));

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100959230;
    v32[3] = &unk_1011AC860;
    v32[4] = self;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1009592A8;
    v25[3] = &unk_1011DCBC8;
    v28 = v18;
    v29 = v14;
    v25[4] = self;
    v26 = v22;
    v30 = objc_msgSend(v7, "isAnimated");
    v27 = v10;
    v31 = v20;
    v23 = v10;
    v24 = v22;
    objc_msgSend(v7, "addPreparation:animations:completion:", v32, &stru_1011DCBA0, v25);

  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  CarMapBrowsingModeController *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = self;
  v12.receiver = self;
  v12.super_class = (Class)CarMapBrowsingModeController;
  v6 = a3;
  -[CarBasicMapBrowsingModeController resignTopContextInChromeViewController:withAnimation:](&v12, "resignTopContextInChromeViewController:withAnimation:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v12.receiver, v12.super_class));
  objc_msgSend(v7, "removeObserver:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextTopContext"));
  v9 = objc_opt_class(CarRouteGeniusModeController);
  LOBYTE(v5) = objc_opt_isKindOfClass(v8, v9);

  if ((v5 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeGeniusManager"));
    objc_msgSend(v11, "deactivateForAllChromes");

  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController", a3));
  v5 = objc_msgSend(v4, "isCurrentContext:", self);

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultMapSettings"));
    objc_msgSend(v6, "applyToMapViewAnimated:duration:completion:", 1, 0, -1.0);

  }
}

- (BOOL)canPresentInterruptionOfKind:(int64_t)a3
{
  return a3 == 10;
}

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    if (a3 == 10)
      v10 = 0x8000000000000001;
    else
      v10 = 0x8000000000000000;
    (*((void (**)(id, unint64_t))v8 + 2))(v8, v10);
  }

  return 0;
}

- (void)incidentsReportingEnablementDidUpdate
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController actionButtonsCardController](self, "actionButtonsCardController"));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), objc_msgSend(v3, "isViewLoaded"));

}

- (void)_offerVehicleDisambiguationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (MapsFeature_IsEnabled_EVRouting(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "auxiliaryTasksManager"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleDisambiguationTask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapBrowsingModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v5, "displayDisambiguationPromptIfNeededFromChromeViewController:", v6);

  }
}

- (int)currentUsageTarget
{
  return 1005;
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
  void *v10;
  void *v11;
  _QWORD v13[3];
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v13[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBasicMapBrowsingModeController chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemRepresentingMapControls"));
  v13[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v9, 5));
  v14 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

  return (NSArray *)v11;
}

- (CarPreciseLocationOffButtonCardViewController)preciseLocationOffButtonCardController
{
  return self->_preciseLocationOffButtonCardController;
}

- (void)setPreciseLocationOffButtonCardController:(id)a3
{
  objc_storeStrong((id *)&self->_preciseLocationOffButtonCardController, a3);
}

- (CarActionButtonsCardViewController)actionButtonsCardController
{
  return self->_actionButtonsCardController;
}

- (void)setActionButtonsCardController:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonsCardController, a3);
}

- (CarShortcutsCardViewController)shortcutsCardController
{
  return self->_shortcutsCardController;
}

- (void)setShortcutsCardController:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutsCardController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsCardController, 0);
  objc_storeStrong((id *)&self->_actionButtonsCardController, 0);
  objc_storeStrong((id *)&self->_preciseLocationOffButtonCardController, 0);
  objc_storeStrong((id *)&self->_incidentItemSource, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
}

@end

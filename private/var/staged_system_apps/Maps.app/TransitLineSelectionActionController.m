@implementation TransitLineSelectionActionController

- (TransitLineSelectionActionController)initWithContainerViewController:(id)a3 actionCoordinator:(id)a4
{
  id v6;
  id v7;
  TransitLineSelectionActionController *v8;
  TransitLineSelectionActionController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TransitLineSelectionActionController;
  v8 = -[TransitLineSelectionActionController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[TransitLineSelectionActionController setContainerViewController:](v8, "setContainerViewController:", v6);
    -[TransitLineSelectionActionController setCoordinator:](v9, "setCoordinator:", v7);
  }

  return v9;
}

- (TransitLineSelectionActionController)init
{
  return -[TransitLineSelectionActionController initWithContainerViewController:actionCoordinator:](self, "initWithContainerViewController:actionCoordinator:", 0, 0);
}

- (id)_traits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsDefaultTraitsForMapRegion:source:", v5, 20));

  return v6;
}

- (void)selectLineForLabelMarker:(id)a3 zoomToMapRegion:(BOOL)a4 onActivation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  TransitLineSelectionActionController *v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  BOOL v29;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "countFeatureIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapRegion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if ((unint64_t)objc_msgSend(v8, "_maps_numLines") < 2)
  {
    if (v10 == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_lineIdentifiers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

      objc_msgSend(v11, "_deselectLabelMarkerAnimated:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      -[TransitLineSelectionActionController _showTransitLineWithName:identifier:mapRegion:](self, "_showTransitLineWithName:identifier:mapRegion:", v16, v15, 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController _traits](self, "_traits"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100A8B41C;
      v19[3] = &unk_1011E1268;
      v25 = a4;
      v20 = v15;
      v21 = self;
      v22 = v12;
      v23 = v13;
      v24 = v9;
      v18 = v15;
      objc_msgSend(v8, "_maps_loadLineInfoUsingTraits:withCompletion:", v17, v19);

    }
    else
    {
      objc_msgSend(v11, "_deselectLabelMarkerAnimated:", 1);
    }
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100A8B350;
    v26[3] = &unk_1011E1240;
    v29 = a4;
    v28 = v9;
    v26[4] = self;
    v27 = v13;
    -[TransitLineSelectionActionController _disambiguateSelectedLineForLabelMarker:onActivation:](self, "_disambiguateSelectedLineForLabelMarker:onActivation:", v8, v26);

  }
}

- (void)selectLine:(id)a3 zoomToMapRegion:(BOOL)a4 onActivation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  BOOL v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  BOOL v30;
  void *v31;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapRegion"));
  v13 = MKMapItemIdentifierFromGEOTransitLine(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  if (a4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapRegion"));
    -[TransitLineSelectionActionController _showTransitLineWithName:identifier:mapRegion:](self, "_showTransitLineWithName:identifier:mapRegion:", v15, v14, v16);

  }
  else
  {
    -[TransitLineSelectionActionController _showTransitLineWithName:identifier:mapRegion:](self, "_showTransitLineWithName:identifier:mapRegion:", v15, v14, 0);
  }

  if (sub_1002589D4(v8))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v31 = v14;
    v24 = a4;
    v18 = v10;
    v19 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v21 = v9;
    v22 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController _traits](self, "_traits"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ticketForTransitLines:traits:", v20, v23));

    v12 = v22;
    v9 = v21;

    v11 = v19;
    v10 = v18;

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100A8B870;
    v26[3] = &unk_1011E1290;
    v30 = v24;
    v29 = v21;
    v26[4] = self;
    v27 = v12;
    v28 = v11;
    objc_msgSend(v25, "submitWithHandler:networkActivity:", v26, 0);

  }
  else if (v9)
  {
    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
  }

}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
  v3 = objc_msgSend(v2, "_applicationState") == 4;

  return v3;
}

- (BOOL)isShowingLineForLabelMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (-[TransitLineSelectionActionController isActive](self, "isActive") && objc_msgSend(v4, "_maps_numLines") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_selectedTransitLineIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_lineIdentifiers"));
    v8 = objc_msgSend(v6, "isEqualToArray:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isShowingLineForLineItem:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = MKMapItemIdentifierFromGEOTransitLine(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  LOBYTE(self) = -[TransitLineSelectionActionController isShowingLineWithIdentifier:](self, "isShowingLineWithIdentifier:", v5);

  return (char)self;
}

- (BOOL)isShowingLineWithIdentifier:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v4 = a3;
  v5 = -[TransitLineSelectionActionController isActive](self, "isActive");
  v6 = 0;
  if (v4 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_selectedTransitLineIDs"));
    v11 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v6 = objc_msgSend(v8, "isEqualToArray:", v9);

  }
  return v6;
}

- (void)deactivateWithContext:(id)a3
{
  -[TransitLineSelectionActionController _clearTransitLineSelectionDeactivate:context:](self, "_clearTransitLineSelectionDeactivate:context:", 1, a3);
}

- (id)mapView
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  return v4;
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
  objc_msgSend(v6, "viewControllerClosed:animated:", v5, 1);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self, "disambiguationVC"));
  objc_msgSend(v7, "setLines:", 0);

}

- (TransitLineDisambiguationViewController)disambiguationVC
{
  TransitLineDisambiguationViewController *disambiguationVC;
  TransitLineDisambiguationViewController *v4;
  TransitLineDisambiguationViewController *v5;

  disambiguationVC = self->_disambiguationVC;
  if (!disambiguationVC)
  {
    v4 = objc_alloc_init(TransitLineDisambiguationViewController);
    v5 = self->_disambiguationVC;
    self->_disambiguationVC = v4;

    -[ContaineeViewController setPreferredPresentationStyle:](self->_disambiguationVC, "setPreferredPresentationStyle:", 3);
    -[ContaineeViewController setContaineeDelegate:](self->_disambiguationVC, "setContaineeDelegate:", self);
    disambiguationVC = self->_disambiguationVC;
  }
  return disambiguationVC;
}

- (void)_disambiguateSelectedLineForLabelMarker:(id)a3 onActivation:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CLLocationDegrees v15;
  CLLocationDegrees v16;
  CLLocationCoordinate2D v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  id v37;
  id location;
  _QWORD v39[3];
  char v40;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "_maps_numLines");
  -[TransitLineSelectionActionController _clearTransitLineSelectionDeactivate:context:](self, "_clearTransitLineSelectionDeactivate:context:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self, "disambiguationVC"));
  v10 = sub_1002A8AA0(v9);

  if (v10 == 5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self, "disambiguationVC"));
    objc_msgSend(v11, "setModalPresentationStyle:", 7);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self, "disambiguationVC"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "macPopoverPresentationController"));

    objc_msgSend(v6, "coordinate");
    v15 = v14;
    objc_msgSend(v6, "coordinate");
    v17 = CLLocationCoordinate2DMake(v15, v16);
    objc_msgSend(v13, "setCoordinate:", v17.latitude, v17.longitude);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController containerViewController](self, "containerViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentViewController"));
  v20 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController containerViewController](self, "containerViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentViewController"));
    v24 = objc_opt_class(LineCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v23, v24);

    v21 = isKindOfClass ^ 1;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController containerViewController](self, "containerViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self, "disambiguationVC"));
  if (v10 == 5 || (v21 & 1) != 0)
    objc_msgSend(v26, "presentController:", v27);
  else
    objc_msgSend(v26, "replaceCurrentWithController:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("number_of_disambiguation_lines"), CFSTR("localized string not found"), 0));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v29, v8));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self, "disambiguationVC"));
  objc_msgSend(v31, "setTitleMessage:", v30);

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  objc_initWeak(&location, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController _traits](self, "_traits"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100A8BFD4;
  v34[3] = &unk_1011E1308;
  v36 = v39;
  objc_copyWeak(&v37, &location);
  v33 = v7;
  v35 = v33;
  objc_msgSend(v6, "_maps_loadLineInfoUsingTraits:withCompletion:", v32, v34);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
  _Block_object_dispose(v39, 8);

}

- (void)_zoomToRegionForLineIfNecessary:(id)a3 region:(id)a4 withStartingRegion:(id)a5 startedShowingLineDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "timeIntervalSinceNow");
  v15 = v14;
  objc_msgSend(v13, "timeIntervalSinceNow");
  v17 = v16;

  v18 = -v17;
  if (v15 >= 0.0)
    v18 = v17;
  if (v18 < 30.0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
    if (-[TransitLineSelectionActionController isActive](self, "isActive"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_selectedTransitLineIDs"));
      v21 = MKMapItemIdentifierFromGEOTransitLine(v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v28 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      v24 = objc_msgSend(v20, "isEqualToArray:", v23);

      if (v24)
      {
        if (!v12
          || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapRegion")),
              v27 = objc_msgSend(v12, "isEqual:", v26),
              v26,
              v27))
        {
          objc_msgSend(v19, "setVisibleMapRect:animated:", 1, GEOMapRectForMapRegion(v11, v25));
        }
      }
    }

  }
}

- (void)_showTransitLineWithName:(id)a3 identifier:(id)a4 mapRegion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
  self->_viewModeToRestore = (int64_t)objc_msgSend(v9, "displayedViewMode");

  if (self->_viewModeToRestore != 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
    objc_msgSend(v10, "updateViewMode:animated:", 3, 1);

  }
  objc_msgSend(v8, "_selectTransitLineMarkerWithIdentifier:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
  objc_msgSend(v11, "updateMapApplicationState:", 4);

  if (v7)
    objc_msgSend(v8, "setVisibleMapRect:animated:", 1, GEOMapRectForMapRegion(v7, v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appCoordinator"));
  objc_msgSend(v14, "setNeedsUserActivityUpdate");

}

- (void)_clearTransitLineSelectionDeactivate:(BOOL)a3 context:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController mapView](self, "mapView"));
  objc_msgSend(v6, "_deselectTransitLineMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
  objc_msgSend(v7, "updateMapApplicationState:", 0);

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
    v9 = objc_msgSend(v8, "displayedViewMode");

    if (-[TransitLineSelectionActionController _shouldRestoreDisplayedViewModeForContext:](self, "_shouldRestoreDisplayedViewModeForContext:", v14)&& v9 == (id)3&& self->_viewModeToRestore != 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
      objc_msgSend(v10, "updateViewMode:animated:", self->_viewModeToRestore, 1);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
    objc_msgSend(v11, "actionControlDidDeactivate:", self);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController coordinator](self, "coordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appCoordinator"));
  objc_msgSend(v13, "setNeedsUserActivityUpdate");

}

- (BOOL)_shouldRestoreDisplayedViewModeForContext:(id)a3
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ActionControllerDeactivationItemKey")));
  v4 = objc_opt_class(PlaceCardItem);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return (isKindOfClass & 1) == 0;
}

- (ActionCoordination)coordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (void)setDisambiguationVC:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationVC, a3);
}

- (ControlContainerViewController)containerViewController
{
  return (ControlContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_disambiguationVC, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end

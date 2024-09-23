@implementation ActionCoordinator

- (id)mapSelectionStateForVenueCardItem:(id)a3 savePlaceCardSelectionState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  MapSelectionManagerState *v8;
  MapSelectionManagerState *routePlanningSelectionRestorationState;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenueRoutePlanningCardItem))
    goto LABEL_2;
  if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenueClusterCardItem) & 1) != 0)
  {
LABEL_4:
    v8 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenuePlaceCardItem))
  {
    routePlanningSelectionRestorationState = self->_routePlanningSelectionRestorationState;
    if (routePlanningSelectionRestorationState)
    {
      v8 = routePlanningSelectionRestorationState;
      goto LABEL_5;
    }
    if (v4)
      goto LABEL_2;
    goto LABEL_4;
  }
  if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenueCategoryCardItem))
    goto LABEL_4;
LABEL_2:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  v8 = (MapSelectionManagerState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionStateIncludingCamera:includeNotCustomLabelMarkers:", 1, 0));

LABEL_5:
  return v8;
}

- (id)searchInfoForVenueCardItem:(id)a3 previousItemInStack:(id)a4
{
  void *v5;
  void *v6;

  if (-[ActionCoordinator _canCaptureSearchStateForCardItem:previousItemInStack:](self, "_canCaptureSearchStateForCardItem:previousItemInStack:", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentResultsSearchInfo"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)searchFieldItemForVenueCardItem:(id)a3 previousItemInStack:(id)a4
{
  void *v5;
  void *v6;

  if (-[ActionCoordinator _canCaptureSearchStateForCardItem:previousItemInStack:](self, "_canCaptureSearchStateForCardItem:previousItemInStack:", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchFieldItem"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_canCaptureSearchStateForCardItem:(id)a3 previousItemInStack:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  void *v11;
  unsigned __int8 v12;

  v6 = a3;
  if (objc_msgSend(a4, "conformsToProtocol:", &OBJC_PROTOCOL___VenuePlaceCardItem))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentResultsSearchInfo"));
    v9 = objc_msgSend(v8, "singleResultMode");

    if ((v9 & 1) != 0)
      goto LABEL_3;
  }
  if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenueRoutePlanningCardItem) & 1) != 0
    || (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenueClusterCardItem) & 1) != 0
    || (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenuePlaceCardItem) & 1) != 0)
  {
    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  if ((objc_msgSend(v11, "isCardStackEmpty") & 1) == 0)
  {
    v12 = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___VenueCategoryCardItem);

    if ((v12 & 1) == 0)
      goto LABEL_3;
LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }

LABEL_3:
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)placeCardViewController:(id)a3 placeCardItemWillChange:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v7 = objc_msgSend(v6, "_hasMUID");

  if (v7)
  {
    v8 = sub_100519348();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
      v12 = 134217984;
      v13 = objc_msgSend(v10, "_muid");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Place Card placeCardItemWillChange to muid %llu.", (uint8_t *)&v12, 0xCu);

    }
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isDroppedPin"))
  {
    v11 = sub_100519348();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Place Card placeCardItemWillChange to dropped pin.", (uint8_t *)&v12, 2u);
    }
    goto LABEL_7;
  }
LABEL_8:
  -[ActionCoordinator _setHikingFeaturesForPlaceCardItem:](self, "_setHikingFeaturesForPlaceCardItem:", v5);

}

- (void)placeCardViewController:(id)a3 mapItemDidChange:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v5 = a4;
  v6 = sub_100519348();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = objc_msgSend(v5, "_muid");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Place Card mapItemDidChange to muid %llu.", (uint8_t *)&v12, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  objc_msgSend(v9, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
  objc_msgSend(v11, "updateComponentsIfNeeded");

}

- (void)placeCardViewController:(id)a3 selectMapItem:(id)a4 address:(id)a5
{
  -[ActionCoordinator viewController:selectMapItem:address:addToHistory:source:](self, "viewController:selectMapItem:address:addToHistory:source:", a3, a4, a5, 0, 4);
}

- (void)placeCardViewController:(id)a3 selectTransitLineItem:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v8 = sub_1002A8AA0(v7) != 5;

  -[ActionCoordinator viewController:selectTransitLineItem:zoomToMapRegion:preferredLayout:](self, "viewController:selectTransitLineItem:zoomToMapRegion:preferredLayout:", v9, v6, v8, 2);
}

- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4
{
  -[ActionCoordinator viewController:openTransitIncidents:fromView:withUserInfo:](self, "viewController:openTransitIncidents:fromView:withUserInfo:", a3, a4, 0, 0);
}

- (void)placeCardViewController:(id)a3 editLocationOfMarkedLocation:(id)a4
{
  -[ActionCoordinator viewController:editLocationOfMarkedLocation:](self, "viewController:editLocationOfMarkedLocation:", a3, a4);
}

- (void)placeCardViewController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a5;
  v9 = a4;
  if (sub_1002A8AA0(v20) == 5)
    -[ActionCoordinator viewControllerGoPreviousState:withSender:](self, "viewControllerGoPreviousState:withSender:", v20, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  objc_msgSend(v8, "bounds");
  objc_msgSend(v10, "convertRect:fromView:", v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:wantsCloseUpView:triggerAction:](MKLookAroundEntryPoint, "entryPointWithMapItem:wantsCloseUpView:triggerAction:", v9, 1, 6060));
  -[ActionCoordinator enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:](self, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v19, v8, 1, v12, v14, v16, v18);

}

- (void)placeCardViewController:(id)a3 displayStoreViewControllerForAppWithiTunesIdentifier:(id)a4
{
  -[ActionCoordinator viewController:displayStoreViewControllerForAppWithiTunesIdentifier:clientIdentifier:](self, "viewController:displayStoreViewControllerForAppWithiTunesIdentifier:clientIdentifier:", a3, a4, 0);
}

- (void)placeCardViewController:(id)a3 presentCategoryPlacesListForMapItem:(id)a4 searchCategory:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (objc_msgSend(v9, "_browseCategory_isVenueItem"))
    -[ActionCoordinator viewController:presentVenueForMapItem:searchCategory:source:](self, "viewController:presentVenueForMapItem:searchCategory:source:", v10, v9, v8, 4);
  else
    -[ActionCoordinator viewController:presentPlacesForMapItem:searchCategory:source:](self, "viewController:presentPlacesForMapItem:searchCategory:source:", v10, v9, v8, 4);

}

- (void)placeCardViewController:(id)a3 didUpdateLinkedPlacesFromPlaceCardItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v6, "showLinkedPlacesAndPolygonForPlaceCardItem:", v5);

}

- (void)placeCardViewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ActionCoordinator viewControllerPresentSearchEndEditing](self, "viewControllerPresentSearchEndEditing");
  -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", v10, v9, v8);

}

- (void)placeCardViewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SearchResult *v17;
  SearchResult *v18;
  SearchResult *v19;
  _QWORD *v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  SearchResult *v31;
  id v32;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(location, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeCardItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchResult"));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v11);
  v18 = v17;

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1005199E4;
  v30[3] = &unk_1011AD1E8;
  objc_copyWeak(&v32, location);
  v19 = v18;
  v31 = v19;
  v20 = objc_retainBlock(v30);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100519A38;
  v27[3] = &unk_1011BA148;
  v21 = v12;
  v28 = v21;
  v29 = v20;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100519A6C;
  v24[3] = &unk_1011BA170;
  v22 = v13;
  v25 = v22;
  v23 = v29;
  v26 = v23;
  -[ActionCoordinator viewController:editNameOfMapItem:saveHandler:cancelHandler:](self, "viewController:editNameOfMapItem:saveHandler:cancelHandler:", v10, v11, v27, v24);

  objc_destroyWeak(&v32);
  objc_destroyWeak(location);

}

- (void)placeCardViewController:(id)a3 showTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  -[ActionCoordinator viewController:displayTransitSchedulesForMapItem:departureSequence:](self, "viewController:displayTransitSchedulesForMapItem:departureSequence:", a3, a4, a5);
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return -[ActionCoordinator viewController:shouldDisplayTransitSchedulesForMapItem:departureSequence:](self, "viewController:shouldDisplayTransitSchedulesForMapItem:departureSequence:", a3, a4, a5);
}

- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
  -[ActionCoordinator viewController:showGuidesHome:](self, "viewController:showGuidesHome:", 0, a4);
}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  -[ActionCoordinator viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:](self, "viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:", a3, a4, a5, a6, 0);
}

- (void)placeCardViewController:(id)a3 presentPOIEnrichmentWithCoordinator:(id)a4
{
  -[ActionCoordinator viewControllerPresentPOIEnrichmentWithCoordinator:](self, "viewControllerPresentPOIEnrichmentWithCoordinator:", a4);
}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  objc_msgSend(v6, "copy:", v5);

}

- (void)placeCardViewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldShowDataManagementAfterDownload:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v15 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "placeCardItem"));
  v13 = objc_msgSend(v12, "isHomeWorkSchoolAddress");

  LOBYTE(v14) = 1;
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:shouldShowDataManagementAfterDownload:shouldShowDataManagementAfterDownloadIfRegionDiffers:dismissalBlock:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:shouldShowDataManagementAfterDownload:shouldShowDataManagementAfterDownloadIfRegionDiffers:dismissalBlock:", v15, v11, v10, 0, v13, v6, v14, 0);

}

- (void)placeCardViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 placeMUID:(unint64_t)a6 completion:(id)a7
{
  -[ActionCoordinator presentEditNoteViewControllerWithInitialText:libraryAccessProvider:placeMUID:completion:](self, "presentEditNoteViewControllerWithInitialText:libraryAccessProvider:placeMUID:completion:", a4, a5, a6, a7);
}

- (void)placeCardViewControllerRemovedObservingHandle:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100519C7C;
  v6[3] = &unk_1011AC860;
  v6[4] = self;
  objc_msgSend(v5, "popToRootContextAnimated:completion:", 0, v6);

}

- (void)placeCardViewController:(id)a3 willReusePlaceCardItem:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a4;
  v6 = sub_100519348();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Place Card is reusing its Place Card Item, will set hiking features for existing mapItem.", v8, 2u);
  }

  -[ActionCoordinator _setHikingFeaturesForPlaceCardItem:](self, "_setHikingFeaturesForPlaceCardItem:", v5);
}

- (void)placeCardViewControllerWillResignCurrent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_100519348();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Place Card is resigning current, will deselect trails and disable topographic features if needed.", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v6, "deselectTrails");

  -[ActionCoordinator _setTopographicalFeaturesForPlaceCardItem:](self, "_setTopographicalFeaturesForPlaceCardItem:", 0);
}

- (void)placeCardViewControllerWillBecomeCurrent:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_100519348();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Place Card is becoming current, will select trails and enable topographic features if needed.", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeCardItem"));
  if (v7)
    -[ActionCoordinator _setHikingFeaturesForPlaceCardItem:](self, "_setHikingFeaturesForPlaceCardItem:", v7);

}

- (void)placeCardViewController:(id)a3 didRequestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  void *v6;
  void *v7;
  id v8;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
  objc_msgSend(v7, "requestHikingToolTipRegionIDForLocation:", latitude, longitude);

}

- (void)placeCardViewControllerDidTapHikingTip:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  objc_msgSend(v6, "enterRouteCreationWithRoute:originMapItem:destinationMapItem:userInfo:completion:", 0, v5, 0, 0, 0);
}

- (void)placeCardViewController:(id)a3 didUpdateForViewMode:(int64_t)a4
{
  id v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = objc_msgSend(v5, "isActive");
  v7 = sub_100519348();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "View mode has changed, so hiking features need to be recalculated.", buf, 2u);
    }

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeCardItem"));
    if (v8)
      -[ActionCoordinator _setHikingFeaturesForPlaceCardItem:](self, "_setHikingFeaturesForPlaceCardItem:", v8);
  }
  else if (v9)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "View mode has changed but place card is inactive, no work to do.", v10, 2u);
  }

}

- (id)_hikingToken
{
  return objc_getAssociatedObject(self, "_hikingToken");
}

- (void)_setHikingToken:(id)a3
{
  objc_setAssociatedObject(self, "_hikingToken", a3, (void *)1);
}

- (void)_setHikingFeaturesForPlaceCardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapsui_trailSelectionInfoForMap"));

  v7 = sub_100519348();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      v15 = 134217984;
      v16 = objc_msgSend(v6, "trailID");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Trail selection info found, selecting trail with ID %llu.", (uint8_t *)&v15, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    v11 = objc_msgSend(v6, "trailID");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localeIdentifier"));
    objc_msgSend(v10, "selectTrailWithId:name:locale:", v11, v12, v14);

  }
  else
  {
    if (v9)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No trail selection info found, deselecting all trails.", (uint8_t *)&v15, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v10, "deselectTrails");
  }

  -[ActionCoordinator _setTopographicalFeaturesForPlaceCardItem:](self, "_setTopographicalFeaturesForPlaceCardItem:", v4);
}

- (void)_setTopographicalFeaturesForPlaceCardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id buf;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v7 = sub_100519348();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Route planning is currently presented, will not toggle topographic lines.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_29;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  if (!v9)
  {
    v12 = sub_100519348();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "PlaceCard is changing to a nil mapItem. Disabling topographic features.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_9;
  }
  if (-[ActionCoordinator displayedViewMode](self, "displayedViewMode"))
  {
    v10 = sub_100519348();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "View mode is not Explore, so disabling topographic features.", (uint8_t *)&buf, 2u);
    }
LABEL_9:

    -[ActionCoordinator _setHikingToken:](self, "_setHikingToken:", 0);
    goto LABEL_29;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_placeData"));

  if (objc_msgSend(v15, "hasMapDisplayType"))
  {
    v16 = objc_msgSend(v15, "mapDisplayType");
    v17 = sub_100519348();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v16 == 1;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "PlaceCard mapItem has a mapDisplayType, toggling topographic features to %d.", (uint8_t *)&buf, 8u);
    }

    if (v16 == 1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator _hikingToken](self, "_hikingToken"));
      v20 = v19 == 0;

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "acquireHikingMapToken"));
        -[ActionCoordinator _setHikingToken:](self, "_setHikingToken:", v21);

      }
    }
    else
    {
      -[ActionCoordinator _setHikingToken:](self, "_setHikingToken:", 0);
    }
  }
  else if ((objc_msgSend(v4, "isDroppedPin") & 1) != 0
         || objc_msgSend(v13, "_isMapItemTypeAddress"))
  {
    v22 = sub_100519348();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "PlaceCard mapItem is a dropped pin, checking if it is inside of a hiking region.", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    objc_msgSend(v13, "_coordinate");
    v25 = v24;
    v27 = v26;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10051A644;
    v30[3] = &unk_1011BA198;
    objc_copyWeak(&v32, &buf);
    v31 = v6;
    objc_msgSend(v31, "checkIfCoordinate:isInHikingContextualRegionWithCompletionHandler:", v30, v25, v27);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&buf);
  }
  else
  {
    v28 = sub_100519348();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "PlaceCard mapItem lacks a mapDisplayType, will not toggle.", (uint8_t *)&buf, 2u);
    }

  }
LABEL_29:

}

- (ActionCoordinator)initWithPlatformController:(id)a3
{
  id v5;
  ActionCoordinator *v6;
  ActionCoordinator *v7;
  RoutePlanningDataCoordinator *v8;
  RoutePlanningDataCoordinator *routePlanningDataCoordinator;
  SearchSessionManager *v10;
  SearchSessionManager *searchSessionManager;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ActionCoordinator;
  v6 = -[ActionCoordinator init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    v8 = -[RoutePlanningDataCoordinator initWithPlatformController:]([RoutePlanningDataCoordinator alloc], "initWithPlatformController:", v7->_platformController);
    routePlanningDataCoordinator = v7->_routePlanningDataCoordinator;
    v7->_routePlanningDataCoordinator = v8;

    -[RoutePlanningDataCoordinator setDelegate:](v7->_routePlanningDataCoordinator, "setDelegate:", v7);
    v10 = objc_alloc_init(SearchSessionManager);
    searchSessionManager = v7->_searchSessionManager;
    v7->_searchSessionManager = v10;

    -[SearchSessionManager setDelegate:](v7->_searchSessionManager, "setDelegate:", v7);
    -[SearchSessionManager setCoordinator:](v7->_searchSessionManager, "setCoordinator:", v7);
    -[SearchSessionManager addObserver:](v7->_searchSessionManager, "addObserver:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, "_carPlayWantsToDisplayEVOnboarding:", CFSTR("EVOnboardingCarPlayHintSelectedNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SearchSessionManager removeObserver:](self->_searchSessionManager, "removeObserver:", self);
  -[ActionCoordinator removeContainerViewControllerObserver](self, "removeContainerViewControllerObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ActionCoordinator;
  -[ActionCoordinator dealloc](&v4, "dealloc");
}

- (void)clearMapSelection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v2, "clearSelection");

}

- (void)clearSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "floatingControlsPresentationController"));
  objc_msgSend(v4, "setSearchSession:", 0);

  -[SearchSessionManager clearSearchSession](self->_searchSessionManager, "clearSearchSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v5, "clearSearchPins");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v6, "cleanSearch");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  LODWORD(v4) = objc_msgSend(v7, "isUsingOfflineMaps");

  if ((_DWORD)v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
    objc_msgSend(v8, "resetOfflineTextSearchSupport");

  }
}

- (void)clearSearchIfOriginatedFromWaypointEditor
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchSessionManager](self, "searchSessionManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSearchSession"));
  v5 = objc_msgSend(v4, "isAddStopFromWaypointEditor");

  if (v5)
    -[ActionCoordinator clearSearch](self, "clearSearch");
}

- (void)clearSearchPins
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v2, "clearSearchPins");

}

- (void)endSearch
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v2, "endSearch");

}

- (void)endSearchForTesting
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v2, "endSearchForTesting");

}

- (void)presentSearchAndRestoreSearchItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ActionCoordinator clearSearch](self, "clearSearch");
  -[ActionCoordinator presentSearch](self, "presentSearch");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "restoreSearchItem:", v4);

}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4
{
  -[ActionCoordinator restoreSearchForItem:withResults:sessionOrigin:](self, "restoreSearchForItem:withResults:sessionOrigin:", a3, a4, 0);
}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4 sessionOrigin:(unint64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isSearchAlongRoute") & 1) == 0)
    -[SearchSessionManager restoreSearchForItem:withResults:sessionOrigin:](self->_searchSessionManager, "restoreSearchForItem:withResults:sessionOrigin:", v9, v8, a5);

}

- (void)setCurrentDirectionItem:(id)a3 withOptions:(id)a4
{
  id v7;
  void *v8;
  DirectionItem *v9;

  v9 = (DirectionItem *)a3;
  v7 = a4;
  if (self->_currentDirectionItem != v9)
  {
    objc_storeStrong((id *)&self->_currentDirectionItem, a3);
    if (-[DirectionItem isVenueItem](self->_currentDirectionItem, "isVenueItem"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      objc_msgSend(v8, "pushVenueCardItem:source:", self->_currentDirectionItem, 4);

    }
    -[ActionCoordinator viewController:doDirectionItem:withUserInfo:](self, "viewController:doDirectionItem:withUserInfo:", 0, self->_currentDirectionItem, v7);
  }

}

- (void)setCurrentTransitLineItem:(id)a3
{
  -[ActionCoordinator setCurrentTransitLineItem:zoomToMapRegion:](self, "setCurrentTransitLineItem:zoomToMapRegion:", a3, 0);
}

- (void)setCurrentTransitLineItem:(id)a3 zoomToMapRegion:(BOOL)a4
{
  -[ActionCoordinator setCurrentTransitLineItem:zoomToMapRegion:preferredLayout:](self, "setCurrentTransitLineItem:zoomToMapRegion:preferredLayout:", a3, a4, 0);
}

- (void)setCurrentTransitLineItem:(id)a3 zoomToMapRegion:(BOOL)a4 preferredLayout:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentTransitLineItem](self, "currentTransitLineItem"));

  v9 = v10;
  if (v8 != v10)
  {
    -[ActionCoordinator viewController:selectTransitLineItem:zoomToMapRegion:preferredLayout:](self, "viewController:selectTransitLineItem:zoomToMapRegion:preferredLayout:", 0, v10, v6, a5);
    v9 = v10;
  }

}

- (GEOTransitLineItem)currentTransitLineItem
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v3 = objc_opt_class(LineCardViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lineItem"));
  else
    v4 = 0;

  return (GEOTransitLineItem *)v4;
}

- (MKMapItem)currentMapItem
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v3 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "placeCardItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  }
  else
  {
    v5 = 0;
  }

  return (MKMapItem *)v5;
}

- (MKLookAroundView)currentLookAroundView
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v3 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lookAroundView"));
  else
    v4 = 0;

  return (MKLookAroundView *)v4;
}

- (ContaineeProtocol)currentViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));

  return (ContaineeProtocol *)v3;
}

- (SearchSession)currentSearchSession
{
  return -[SearchSessionManager currentSearchSession](self->_searchSessionManager, "currentSearchSession");
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  void (**v48)(id, void *);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "errorString"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v7)
  {
    v4[2](v4, v7);
    goto LABEL_23;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentMapItem](self, "currentMapItem"));

  if (v10 && v9 != (id)5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentMapItem](self, "currentMapItem"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    goto LABEL_6;
  }
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented") && v9 != (id)5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem endMapItem](self->_currentDirectionItem, "endMapItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

    if (v15)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Directions to <destination>"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem endMapItem](self->_currentDirectionItem, "endMapItem"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v18));

LABEL_11:
      if (v13)
      {
        v4[2](v4, v13);

        goto LABEL_23;
      }
      goto LABEL_13;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Directions"), CFSTR("localized string not found"), 0));
LABEL_6:
    v13 = (void *)v12;
    goto LABEL_11;
  }
LABEL_13:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v19, "userInterfaceIdiom") == (id)1)
  {

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v21 = objc_msgSend(v20, "userInterfaceIdiom");

    if (v21 != (id)5)
      goto LABEL_23;
  }
  v22 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "headerDisplayName"));
    v26 = v25;
    if (v25)
    {
      v22 = v25;
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "searchFieldItem"));
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "title"));

    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v29, "centerCoordinate");
  v31 = v30;
  v33 = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v34, "visibleMapRect");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  v43 = objc_alloc_init((Class)CLGeocoder);
  v44 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v31, v33);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10059CD4C;
  v46[3] = &unk_1011BC010;
  v47 = v22;
  v48 = v4;
  v49 = v36;
  v50 = v38;
  v51 = v40;
  v52 = v42;
  v45 = v22;
  objc_msgSend(v43, "reverseGeocodeLocation:completionHandler:", v44, v46);

LABEL_23:
}

- (GEOMapServiceTraits)newTraits
{
  void *v2;
  void *v3;
  GEOMapServiceTraits *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTraits"));

  return v4;
}

- (UserLocationSearchResult)userLocationSearchResult
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userLocation"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotation"));
  return (UserLocationSearchResult *)v4;
}

- (RouteAnnotationsController)routeAnnotationsController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeAnnotationsController"));

  return (RouteAnnotationsController *)v4;
}

- (SearchPinsManager)searchPinsManager
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  return (SearchPinsManager *)v4;
}

- (SettingsController)settingsController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settingsController"));

  return (SettingsController *)v4;
}

- (PersonalizedItemManager)personalizedItemManager
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "personalizedItemManager"));

  return (PersonalizedItemManager *)v4;
}

- (PersonalizedItemSource)suggestionsItemSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "suggestionsItemSource"));

  return (PersonalizedItemSource *)v3;
}

- (RoutePlanningOverviewViewController)routePlanningOverviewViewController
{
  RoutePlanningOverviewViewController *routePlanningOverviewViewController;
  void *v4;
  RoutePlanningOverviewViewController *v5;
  RoutePlanningOverviewViewController *v6;

  routePlanningOverviewViewController = self->_routePlanningOverviewViewController;
  if (!routePlanningOverviewViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v5 = (RoutePlanningOverviewViewController *)objc_claimAutoreleasedReturnValue(+[RoutePlanningOverviewViewController routePlanningOverviewViewControllerWithDataCoordinator:](RoutePlanningOverviewViewController, "routePlanningOverviewViewControllerWithDataCoordinator:", v4));
    v6 = self->_routePlanningOverviewViewController;
    self->_routePlanningOverviewViewController = v5;

    -[ControlContaineeViewController setDelegate:](self->_routePlanningOverviewViewController, "setDelegate:", self);
    -[RoutePlanningOverviewViewController loadViewIfNeeded](self->_routePlanningOverviewViewController, "loadViewIfNeeded");
    routePlanningOverviewViewController = self->_routePlanningOverviewViewController;
  }
  return routePlanningOverviewViewController;
}

- (RoutePlanningOverviewViewController)routePlanningOverviewViewControllerIfLoaded
{
  return self->_routePlanningOverviewViewController;
}

- (void)_dismissMacToolTipIfNeeded
{
  void *v3;
  uint64_t v4;
  MacUserProfileTipViewController *profileTipVC;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = sub_1002A8AA0(v3);

  if (v4 == 5)
  {
    profileTipVC = self->_profileTipVC;
    if (profileTipVC)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController presentingViewController](profileTipVC, "presentingViewController"));
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
}

- (void)viewControllerPresentUserProfile:(id)a3
{
  UserProfileContaineeViewController *v4;
  void *v5;
  UserProfileContaineeViewController *v6;
  UserProfileContaineeViewController *userProfileVC;
  id WeakRetained;

  v4 = [UserProfileContaineeViewController alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
  v6 = -[UserProfileContaineeViewController initWithAccount:delegate:](v4, "initWithAccount:delegate:", v5, self);
  userProfileVC = self->_userProfileVC;
  self->_userProfileVC = v6;

  -[ContaineeViewController setContaineeDelegate:](self->_userProfileVC, "setContaineeDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:completion:", self->_userProfileVC, 1, &stru_1011BC030);

}

- (void)presentMacToolTipForLinkType:(int64_t)a3
{
  MacUserProfileTipViewController *v5;
  MacUserProfileTipViewController *profileTipVC;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  -[ActionCoordinator _dismissMacToolTipIfNeeded](self, "_dismissMacToolTipIfNeeded");
  v5 = -[MacUserProfileTipViewController initWithUserProfileLinkType:]([MacUserProfileTipViewController alloc], "initWithUserProfileLinkType:", a3);
  profileTipVC = self->_profileTipVC;
  self->_profileTipVC = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceViewForProfileTipPopoverWithViewController:", self->_profileTipVC));

  if (v23)
  {
    v8 = objc_msgSend(v23, "_mapsui_isRTL");
    -[MacUserProfileTipViewController setModalPresentationStyle:](self->_profileTipVC, "setModalPresentationStyle:", 7);
    if (v8)
      v9 = 8;
    else
      v9 = 4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController popoverPresentationController](self->_profileTipVC, "popoverPresentationController"));
    objc_msgSend(v10, "setPermittedArrowDirections:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController popoverPresentationController](self->_profileTipVC, "popoverPresentationController"));
    objc_msgSend(v11, "setDelegate:", self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController popoverPresentationController](self->_profileTipVC, "popoverPresentationController"));
    objc_msgSend(v12, "setSourceView:", v23);

    objc_msgSend(v23, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacUserProfileTipViewController popoverPresentationController](self->_profileTipVC, "popoverPresentationController"));
    objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v22, "_maps_topMostPresentViewController:animated:completion:", self->_profileTipVC, 1, 0);

  }
}

- (void)viewControllerPresentUserProfilePreferences:(id)a3 withTabType:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  TravelPreferencesViewController *v8;
  TravelPreferencesViewController *travelPreferencesVC;
  id WeakRetained;

  -[ActionCoordinator _dismissMacToolTipIfNeeded](self, "_dismissMacToolTipIfNeeded", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v7 = sub_1002A8AA0(v6);

  if (v7 == 5)
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(WeakRetained, "presentMacPreferencesTabWithType:", a4);
  }
  else
  {
    v8 = -[TravelPreferencesViewController initWithCompletionHandler:]([TravelPreferencesViewController alloc], "initWithCompletionHandler:", &stru_1011BC090);
    travelPreferencesVC = self->_travelPreferencesVC;
    self->_travelPreferencesVC = v8;

    -[ContaineeViewController setContaineeDelegate:](self->_travelPreferencesVC, "setContaineeDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:", self->_travelPreferencesVC, 1);
  }

}

- (void)viewControllerPresentRatingsHistory:(id)a3
{
  RatingsHistoryViewController *v4;
  RatingsHistoryViewController *ratingsHistoryVC;
  id WeakRetained;

  -[ActionCoordinator _dismissMacToolTipIfNeeded](self, "_dismissMacToolTipIfNeeded", a3);
  v4 = -[RatingsHistoryViewController initWithNibName:bundle:]([RatingsHistoryViewController alloc], "initWithNibName:bundle:", 0, 0);
  ratingsHistoryVC = self->_ratingsHistoryVC;
  self->_ratingsHistoryVC = v4;

  -[ContaineeViewController setContaineeDelegate:](self->_ratingsHistoryVC, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](self->_ratingsHistoryVC, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", self->_ratingsHistoryVC, 1);

}

- (void)viewControllerPresentVirtualGarage:(id)a3
{
  VehicleListViewController *v4;
  VehicleListViewController *vehicleListVC;
  id WeakRetained;

  -[ActionCoordinator _dismissMacToolTipIfNeeded](self, "_dismissMacToolTipIfNeeded", a3);
  v4 = objc_alloc_init(VehicleListViewController);
  vehicleListVC = self->_vehicleListVC;
  self->_vehicleListVC = v4;

  -[ContaineeViewController setContaineeDelegate:](self->_vehicleListVC, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](self->_vehicleListVC, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", self->_vehicleListVC, 1);

}

- (void)presentRouteLibraryWithAvailableRoutes:(id)a3 unavailableRoutes:(id)a4
{
  id v6;
  id v7;
  MapsRouteListViewController *v8;
  void *v9;
  id WeakRetained;
  MapsRouteListViewController *v11;

  v6 = a4;
  v7 = a3;
  v8 = [MapsRouteListViewController alloc];
  if (v7)
    v9 = v7;
  else
    v9 = &__NSArray0__struct;
  v11 = -[MapsRouteListViewController initWithAvailableRoutes:unavailableRoutes:isAllSavedRoutes:](v8, "initWithAvailableRoutes:unavailableRoutes:isAllSavedRoutes:", v9, v6, 1);

  -[ContaineeViewController setContaineeDelegate:](v11, "setContaineeDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v11, 1);

}

- (SimpleResultsViewController)simpleListResultsVC
{
  SimpleResultsViewController *simpleListResultsVC;
  SimpleResultsViewController *v4;
  void *v5;
  SimpleResultsViewController *v6;
  SimpleResultsViewController *v7;
  id v8;

  simpleListResultsVC = self->_simpleListResultsVC;
  if (!simpleListResultsVC)
  {
    v4 = [SimpleResultsViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
    v6 = -[SimpleResultsViewController initWithShareDelegate:](v4, "initWithShareDelegate:", v5);
    v7 = self->_simpleListResultsVC;
    self->_simpleListResultsVC = v6;

    -[SimpleResultsViewController setResultsDelegate:](self->_simpleListResultsVC, "setResultsDelegate:", self);
    -[SimpleResultsViewController setCoordinator:](self->_simpleListResultsVC, "setCoordinator:", self);
    -[ContaineeViewController setContaineeDelegate:](self->_simpleListResultsVC, "setContaineeDelegate:", self);
    -[SimpleResultsViewController setEnableQuickActionMenu:](self->_simpleListResultsVC, "setEnableQuickActionMenu:", 1);
    -[ContaineeViewController setPreferredPresentationStyle:](self->_simpleListResultsVC, "setPreferredPresentationStyle:", 3);
    v8 = -[SimpleResultsViewController view](self->_simpleListResultsVC, "view");
    simpleListResultsVC = self->_simpleListResultsVC;
  }
  return simpleListResultsVC;
}

- (BOOL)_shouldPresentAddStopSearchResults
{
  void *v2;
  unsigned __int8 v4;
  void *v5;
  BOOL v6;

  v4 = -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented");
  if ((v4 & 1) != 0
    || (v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController presentingViewController](self->_routeSearchVC, "presentingViewController"))) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self->_currentDirectionItem, "items"));
    v6 = objc_msgSend(v5, "count") != 0;

    if ((v4 & 1) != 0)
      return v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isPresentingAddStopSearchResults
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  if (sub_1002A8AA0(v3) == 5 && -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));

    if (v4)
      return 1;
  }
  else
  {

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController presentingViewController](self->_addStopResultsViewController, "presentingViewController"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self->_currentDirectionItem, "items"));
    v5 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resultsViewController
{
  void *v3;
  id v4;
  ResultsViewController *v5;
  ResultsViewController *addStopResultsViewController;
  ResultsViewController *v7;
  ResultsViewController *v8;
  ResultsViewController *v9;
  ResultsViewController *resultsViewController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v5 = (ResultsViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  }
  else
  {
    if (-[ActionCoordinator _shouldPresentAddStopSearchResults](self, "_shouldPresentAddStopSearchResults"))
    {
      addStopResultsViewController = self->_addStopResultsViewController;
      if (!addStopResultsViewController)
      {
        v7 = objc_alloc_init(ResultsViewController);
        v8 = self->_addStopResultsViewController;
        self->_addStopResultsViewController = v7;

        -[ControlContaineeViewController setDelegate:](self->_addStopResultsViewController, "setDelegate:", self);
        -[ContaineeViewController setContaineeDelegate:](self->_addStopResultsViewController, "setContaineeDelegate:", self);
        -[ResultsViewController setIsPresentingAddStopResultsFromWaypointEditor:](self->_addStopResultsViewController, "setIsPresentingAddStopResultsFromWaypointEditor:", 1);
        addStopResultsViewController = self->_addStopResultsViewController;
      }
    }
    else
    {
      addStopResultsViewController = self->_resultsViewController;
      if (!addStopResultsViewController)
      {
        v9 = objc_alloc_init(ResultsViewController);
        resultsViewController = self->_resultsViewController;
        self->_resultsViewController = v9;

        -[ControlContaineeViewController setDelegate:](self->_resultsViewController, "setDelegate:", self);
        -[ContaineeViewController setContaineeDelegate:](self->_resultsViewController, "setContaineeDelegate:", self);
        addStopResultsViewController = self->_resultsViewController;
      }
    }
    v5 = addStopResultsViewController;
  }
  return v5;
}

- (id)searchModeViewController
{
  SearchViewController *searchModeViewController;
  SearchViewController *v4;
  SearchViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  void *v13;

  searchModeViewController = self->_searchModeViewController;
  if (!searchModeViewController)
  {
    v4 = objc_alloc_init(SearchViewController);
    v5 = self->_searchModeViewController;
    self->_searchModeViewController = v4;

    -[ControlContaineeViewController setDelegate:](self->_searchModeViewController, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator personalizedItemManager](self, "personalizedItemManager"));
    -[SearchViewController setPersonalizedItemManager:](self->_searchModeViewController, "setPersonalizedItemManager:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
    v10 = objc_msgSend(v9, "horizontalSizeClass");

    if (sub_1002A8AA0(v8) == 1 && v10 == (id)2)
      v12 = 3;
    else
      v12 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self->_searchModeViewController, "cardPresentationController"));
    objc_msgSend(v13, "setDefaultContaineeLayout:", v12);

    searchModeViewController = self->_searchModeViewController;
  }
  return searchModeViewController;
}

- (SearchViewController)searchViewControllerIfLoaded
{
  return self->_searchModeViewController;
}

- (id)settingsViewController
{
  SettingsViewController *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  ActionCoordinator *v15;

  v3 = objc_alloc_init(SettingsViewController);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10059DC94;
  v13 = &unk_1011AC8B0;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  v15 = self;
  v4 = v14;
  -[SettingsViewController setDismissSettingsViewControllerHandler:](v3, "setDismissSettingsViewControllerHandler:", &v10);
  self = (ActionCoordinator *)((char *)self + 456);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController", v10, v11, v12, v13));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "settingsController"));
  -[SettingsViewController setSettingsController:](v3, "setSettingsController:", v7);

  -[SettingsViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 4);
  v8 = objc_loadWeakRetained((id *)&self->super.isa);
  -[SettingsViewController setTransitioningDelegate:](v3, "setTransitioningDelegate:", v8);

  return v3;
}

- (id)placeCardForRoutePlanningViewController
{
  PlaceCardViewController *placeCardForRoutePlanningViewController;
  PlaceCardViewController *v4;
  PlaceCardViewController *v5;

  placeCardForRoutePlanningViewController = self->_placeCardForRoutePlanningViewController;
  if (!placeCardForRoutePlanningViewController)
  {
    v4 = objc_alloc_init(PlaceCardViewController);
    v5 = self->_placeCardForRoutePlanningViewController;
    self->_placeCardForRoutePlanningViewController = v4;

    -[PlaceCardViewController setExcludedContent:](self->_placeCardForRoutePlanningViewController, "setExcludedContent:", 22);
    -[PlaceCardViewController setPlaceCardDelegate:](self->_placeCardForRoutePlanningViewController, "setPlaceCardDelegate:", self);
    -[InfoCardViewController setContaineeDelegate:](self->_placeCardForRoutePlanningViewController, "setContaineeDelegate:", self);
    placeCardForRoutePlanningViewController = self->_placeCardForRoutePlanningViewController;
  }
  return placeCardForRoutePlanningViewController;
}

- (id)placeCardForVenuesViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerForCardItem:", v4));

  v7 = v6;
  v8 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "setPlaceCardDelegate:", self);
  objc_msgSend(v10, "setContaineeDelegate:", self);

  return v10;
}

- (PlaceCardViewController)placeCardViewController
{
  PlaceCardViewController *placeCardViewController;
  PlaceCardViewController *v4;
  PlaceCardViewController *v5;

  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    v4 = -[ActionCoordinator _newPlaceCardViewControllerForReuse](self, "_newPlaceCardViewControllerForReuse");
    v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    placeCardViewController = self->_placeCardViewController;
  }
  return placeCardViewController;
}

- (id)_newPlaceCardViewControllerForReuse
{
  PlaceCardViewController *v3;

  v3 = objc_alloc_init(PlaceCardViewController);
  -[PlaceCardViewController setPlaceCardDelegate:](v3, "setPlaceCardDelegate:", self);
  -[InfoCardViewController setContaineeDelegate:](v3, "setContaineeDelegate:", self);
  -[PlaceCardViewController setPlaceCardDismissalDelegate:](v3, "setPlaceCardDismissalDelegate:", self);
  return v3;
}

- (PlaceCardViewController)placeCardViewControllerIfLoaded
{
  return self->_placeCardViewController;
}

- (LineCardViewController)lineCardVC
{
  LineCardViewController *lineCardViewController;
  id *p_lineCardViewController;
  LineCardViewController *v5;
  id v6;

  if (!-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    p_lineCardViewController = (id *)&self->_lineCardViewController;
    lineCardViewController = self->_lineCardViewController;
    if (lineCardViewController)
      return lineCardViewController;
    goto LABEL_3;
  }
  p_lineCardViewController = (id *)&self->_lineCardForRoutePlanningViewController;
  lineCardViewController = self->_lineCardForRoutePlanningViewController;
  if (!lineCardViewController)
  {
LABEL_3:
    v5 = objc_alloc_init(LineCardViewController);
    v6 = *p_lineCardViewController;
    *p_lineCardViewController = v5;

    objc_msgSend(*p_lineCardViewController, "setContaineeDelegate:", self);
    objc_msgSend(*p_lineCardViewController, "setLineCardDelegate:", self);
    objc_msgSend(*p_lineCardViewController, "setPreferredPresentationStyle:", 3);
    lineCardViewController = (LineCardViewController *)*p_lineCardViewController;
  }
  return lineCardViewController;
}

- (void)setContainerViewController:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained != obj)
  {
    -[ActionCoordinator removeContainerViewControllerObserver](self, "removeContainerViewControllerObserver");
    v5 = objc_storeWeak((id *)&self->_containerViewController, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "chromeViewController"));
    objc_msgSend(v6, "setViewModeDelegate:", self);

    -[ActionCoordinator addContainerViewControllerObservers](self, "addContainerViewControllerObservers");
    -[ActionCoordinator presentSearchAnimated:](self, "presentSearchAnimated:", 0);
    -[ActionCoordinator _refreshSettingsTip](self, "_refreshSettingsTip");
  }

}

- (MapSelectionManager)mapSelectionManager
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapSelectionManager"));

  return (MapSelectionManager *)v4;
}

- (MapCameraFraming)mapCameraController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapCameraController"));

  return (MapCameraFraming *)v4;
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

- (RoutePlanningDataCoordinator)routePlanningDataCoordinator
{
  return self->_routePlanningDataCoordinator;
}

- (id)routePlanningMapController
{
  RoutePlanningMapController *routePlanningMapController;
  RoutePlanningMapController *v4;
  void *v5;
  void *v6;
  RoutePlanningMapController *v7;
  RoutePlanningMapController *v8;
  void *v9;
  void *v10;

  routePlanningMapController = self->_routePlanningMapController;
  if (!routePlanningMapController)
  {
    v4 = [RoutePlanningMapController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
    v7 = -[RoutePlanningMapController initWithChromeViewController:](v4, "initWithChromeViewController:", v6);
    v8 = self->_routePlanningMapController;
    self->_routePlanningMapController = v7;

    -[RoutePlanningMapController setActionCoordinator:](self->_routePlanningMapController, "setActionCoordinator:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    -[RoutePlanningMapController setDataCoordinator:](self->_routePlanningMapController, "setDataCoordinator:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator personalizedItemManager](self, "personalizedItemManager"));
    -[RoutePlanningMapController setPersonalizedItemManager:](self->_routePlanningMapController, "setPersonalizedItemManager:", v10);

    routePlanningMapController = self->_routePlanningMapController;
  }
  return routePlanningMapController;
}

- (id)routeSearchVC
{
  RouteSearchViewController *routeSearchVC;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RouteSearchViewController *v8;
  RouteSearchViewController *v9;
  RouteSearchViewController *v10;

  routeSearchVC = self->_routeSearchVC;
  if (!routeSearchVC
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](routeSearchVC, "dataCoordinator")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewController](self, "routePlanningOverviewViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeSearchViewController"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewController](self, "routePlanningOverviewViewController"));
      v8 = (RouteSearchViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeSearchViewController"));
    }
    else
    {
      v9 = [RouteSearchViewController alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
      v8 = -[RouteSearchViewController initWithDelegate:dataCoordinator:](v9, "initWithDelegate:dataCoordinator:", self, v7);
    }
    v10 = self->_routeSearchVC;
    self->_routeSearchVC = v8;

  }
  return self->_routeSearchVC;
}

- (id)routeStepsVC
{
  RouteStepsViewController *routeStepsVC;
  RouteStepsViewController *v4;
  RouteStepsViewController *v5;
  void *v6;

  routeStepsVC = self->_routeStepsVC;
  if (!routeStepsVC)
  {
    v4 = -[RouteStepsViewController initWithNibName:bundle:]([RouteStepsViewController alloc], "initWithNibName:bundle:", 0, 0);
    v5 = self->_routeStepsVC;
    self->_routeStepsVC = v4;

    -[ContaineeViewController setContaineeDelegate:](self->_routeStepsVC, "setContaineeDelegate:", self);
    -[RouteStepsViewController setDelegate:](self->_routeStepsVC, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    -[RouteStepsViewController setDataCoordinator:](self->_routeStepsVC, "setDataCoordinator:", v6);

    routeStepsVC = self->_routeStepsVC;
  }
  return routeStepsVC;
}

- (id)timePickingVC
{
  void *v3;
  void *v4;
  void *v5;
  RoutePlanningTimingViewController *v6;
  void *v7;
  void *v8;
  id v9;
  RoutePlanningTimingViewController *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));

  v6 = [RoutePlanningTimingViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timing"));
  if (v5)
    v9 = objc_msgSend(v5, "shouldShowSchedule");
  else
    v9 = 0;
  v10 = -[RoutePlanningTimingViewController initWithCurrentTiming:shouldShowArriveBy:pickerDelegate:](v6, "initWithCurrentTiming:shouldShowArriveBy:pickerDelegate:", v8, v9, self);

  return v10;
}

- (id)routeOptionsVC
{
  void *v3;
  uint64_t v4;
  uint64_t BOOL;
  RoutePlanningOptionsViewController *v6;
  void *v7;
  RoutePlanningOptionsViewController *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  _QWORD v25[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = sub_1002A8AA0(v3);

  if (v4 == 5)
    BOOL = GEOConfigGetBOOL(MapsConfig_RoutePlanningMacAutomaticallySaveRouteOptions, off_1014B38F8);
  else
    BOOL = 0;
  v6 = [RoutePlanningOptionsViewController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10059E5B4;
  v25[3] = &unk_1011BC0B8;
  v25[4] = self;
  v8 = -[RoutePlanningOptionsViewController initWithDataCoordinator:automaticallySaveChanges:completionHandler:](v6, "initWithDataCoordinator:automaticallySaveChanges:completionHandler:", v7, BOOL, v25);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController traitCollection](v8, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == (id)5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewController](self, "routePlanningOverviewViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeOptionsPopoverSourceView"));

    -[RoutePlanningOptionsViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController popoverPresentationController](v8, "popoverPresentationController"));
    objc_msgSend(v13, "setSourceView:", v12);

    objc_msgSend(v12, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController popoverPresentationController](v8, "popoverPresentationController"));
    objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOptionsViewController popoverPresentationController](v8, "popoverPresentationController"));
    objc_msgSend(v23, "setPermittedArrowDirections:", 12);

  }
  return v8;
}

- (id)incidentsVC
{
  RouteIncidentsViewController *v3;
  void *v4;
  RouteIncidentsViewController *v5;
  RouteIncidentsViewController *incidentsVC;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;

  if (!self->_incidentsVC)
  {
    v3 = [RouteIncidentsViewController alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v5 = -[RouteIncidentsViewController initWithDataCoordination:](v3, "initWithDataCoordination:", v4);
    incidentsVC = self->_incidentsVC;
    self->_incidentsVC = v5;

    -[ContaineeViewController setContaineeDelegate:](self->_incidentsVC, "setContaineeDelegate:", self);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == (id)5)
  {
    -[RouteIncidentsViewController setModalPresentationStyle:](self->_incidentsVC, "setModalPresentationStyle:", 7);
    v10 = objc_loadWeakRetained((id *)&self->_incidentsVCSourceView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController popoverPresentationController](self->_incidentsVC, "popoverPresentationController"));
    objc_msgSend(v11, "setSourceView:", v10);

    v12 = objc_loadWeakRetained((id *)&self->_incidentsVCSourceView);
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController popoverPresentationController](self->_incidentsVC, "popoverPresentationController"));
    objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController popoverPresentationController](self->_incidentsVC, "popoverPresentationController"));
    objc_msgSend(v22, "setPermittedArrowDirections:", 12);

  }
  return self->_incidentsVC;
}

- (id)routingAppsVC
{
  RoutePlanningRoutingAppsController *v3;
  void *v4;
  RoutePlanningRoutingAppsController *v5;

  v3 = [RoutePlanningRoutingAppsController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v5 = -[RoutePlanningRoutingAppsController initWithDataCoordination:](v3, "initWithDataCoordination:", v4);

  -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", self);
  return v5;
}

- (TrafficIncidentContaineeViewController)trafficIncidentVC
{
  TrafficIncidentContaineeViewController *trafficIncidentViewController;
  TrafficIncidentContaineeViewController *v4;
  TrafficIncidentContaineeViewController *v5;
  _QWORD v7[4];
  id v8;
  id location;

  trafficIncidentViewController = self->_trafficIncidentViewController;
  if (!trafficIncidentViewController)
  {
    v4 = objc_alloc_init(TrafficIncidentContaineeViewController);
    v5 = self->_trafficIncidentViewController;
    self->_trafficIncidentViewController = v4;

    -[ContaineeViewController setContaineeDelegate:](self->_trafficIncidentViewController, "setContaineeDelegate:", self);
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10059E860;
    v7[3] = &unk_1011AD260;
    objc_copyWeak(&v8, &location);
    -[TrafficIncidentContaineeViewController setDismissHandler:](self->_trafficIncidentViewController, "setDismissHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    trafficIncidentViewController = self->_trafficIncidentViewController;
  }
  return trafficIncidentViewController;
}

- (RouteAnnotationContaineeViewController)routeAnnotationVC
{
  RouteAnnotationContaineeViewController *routeAnnotationVC;
  RouteAnnotationContaineeViewController *v4;
  RouteAnnotationContaineeViewController *v5;
  _QWORD v7[4];
  id v8;
  id location;

  routeAnnotationVC = self->_routeAnnotationVC;
  if (!routeAnnotationVC)
  {
    v4 = objc_alloc_init(RouteAnnotationContaineeViewController);
    v5 = self->_routeAnnotationVC;
    self->_routeAnnotationVC = v4;

    -[ContaineeViewController setContaineeDelegate:](self->_routeAnnotationVC, "setContaineeDelegate:", self);
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10059E990;
    v7[3] = &unk_1011AD260;
    objc_copyWeak(&v8, &location);
    -[RouteAnnotationContaineeViewController setDismissHandler:](self->_routeAnnotationVC, "setDismissHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    routeAnnotationVC = self->_routeAnnotationVC;
  }
  return routeAnnotationVC;
}

- (id)autosharingVC
{
  SharedTripAutosharingContaineeViewController *autosharingVC;
  SharedTripAutosharingContaineeViewController *v4;
  SharedTripAutosharingContaineeViewController *v5;

  autosharingVC = self->_autosharingVC;
  if (!autosharingVC)
  {
    v4 = -[SharedTripAutosharingContaineeViewController initWithContacts:]([SharedTripAutosharingContaineeViewController alloc], "initWithContacts:", &__NSArray0__struct);
    v5 = self->_autosharingVC;
    self->_autosharingVC = v4;

    -[SharedTripAutosharingContaineeViewController setDelegate:](self->_autosharingVC, "setDelegate:", self);
    autosharingVC = self->_autosharingVC;
  }
  return autosharingVC;
}

- (VenuesManager)venuesManager
{
  VenuesManager *venuesManager;
  VenuesManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VenuesManager *v9;
  VenuesManager *v10;
  VenuesManager *v11;
  void *v12;
  VenuesManager *v13;
  void *v14;

  venuesManager = self->_venuesManager;
  if (!venuesManager)
  {
    v4 = [VenuesManager alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userLocationView"));
    v9 = -[VenuesManager initWithActionCoordinator:mapView:userLocationView:](v4, "initWithActionCoordinator:mapView:userLocationView:", self, v5, v8);
    v10 = self->_venuesManager;
    self->_venuesManager = v9;

    v11 = self->_venuesManager;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v12, "setVenuesManager:", v11);

    v13 = self->_venuesManager;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    -[VenuesManager addChangeObserver:](v13, "addChangeObserver:", v14);

    venuesManager = self->_venuesManager;
  }
  return venuesManager;
}

- (VenueCardCoordinator)venueCardCoordinator
{
  VenueCardCoordinator *venueCardCoordinator;
  VenueCardCoordinator *v4;
  void *v5;
  VenueCardCoordinator *v6;
  VenueCardCoordinator *v7;

  venueCardCoordinator = self->_venueCardCoordinator;
  if (!venueCardCoordinator)
  {
    v4 = [VenueCardCoordinator alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self, "venuesManager"));
    v6 = -[VenueCardCoordinator initWithActionCoordinator:venueChangeNotifier:](v4, "initWithActionCoordinator:venueChangeNotifier:", self, v5);
    v7 = self->_venueCardCoordinator;
    self->_venueCardCoordinator = v6;

    -[VenueCardCoordinator setDataSource:](self->_venueCardCoordinator, "setDataSource:", self);
    venueCardCoordinator = self->_venueCardCoordinator;
  }
  return venueCardCoordinator;
}

- (SearchSessionManager)searchSessionManager
{
  return self->_searchSessionManager;
}

- (void)setIsRoutePlanningPresented:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 isRoutePlanningPresented;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;

  if (self->_isRoutePlanningPresented != a3)
  {
    v3 = a3;
    v5 = sub_10043214C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      isRoutePlanningPresented = self->_isRoutePlanningPresented;
      v9[0] = 67109376;
      v9[1] = isRoutePlanningPresented;
      v10 = 1024;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changing isRoutePlanningPresented from %d to %d", (uint8_t *)v9, 0xEu);
    }

    self->_isRoutePlanningPresented = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("RoutePlanningPresentedDidChangeNotification"), self);

  }
}

- (double)isTouristHere
{
  double result;

  -[SearchViewController isTouristHereValue](self->_searchModeViewController, "isTouristHereValue");
  return result;
}

- (void)presentSimpleList:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentViewController"));

  if (v5 == v19)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v13 = objc_msgSend(v12, "containeeLayout");

    if (v13 != (id)1)
      goto LABEL_10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cardPresentationController"));
    objc_msgSend(v14, "wantsLayout:", 2);
LABEL_9:

    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
  v8 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  v10 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v11 = v10;
  if ((isKindOfClass & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentViewController"));
    v16 = objc_opt_class(SimpleResultsViewController);
    v17 = objc_opt_isKindOfClass(v15, v16);

    v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v14 = v18;
    if ((v17 & 1) != 0)
      objc_msgSend(v18, "replaceCurrentWithController:moveToContaineeLayout:", v19, 2);
    else
      objc_msgSend(v18, "presentController:", v19);
    goto LABEL_9;
  }
  objc_msgSend(v10, "replaceCurrentWithController:moveToContaineeLayout:", v19, 2);

  -[PlaceCardViewController resetState](self->_placeCardViewController, "resetState");
LABEL_10:
  -[ActionCoordinator ensureMapSelectionVisible](self, "ensureMapSelectionVisible");

}

- (void)presentPlaceCard:(id)a3
{
  -[ActionCoordinator presentPlaceCard:canReplaceCurrentIfNecessary:](self, "presentPlaceCard:canReplaceCurrentIfNecessary:", a3, 0);
}

- (void)presentPlaceCard:(id)a3 canReplaceCurrentIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  PlaceCardViewController *v6;
  void *v7;
  PlaceCardViewController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PlaceCardViewController *placeCardViewController;
  PlaceCardViewController *v15;
  PlaceCardViewController *WeakRetained;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  char isKindOfClass;
  id v28;
  id v29;
  char v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;

  v4 = a4;
  v6 = (PlaceCardViewController *)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v8 = (PlaceCardViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
  objc_msgSend(v9, "setHidden:", 0);

  v10 = objc_opt_class(CuratedCollectionViewController);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0 && self->_placeCardViewController)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v11, "removeControllerFromStack:", self->_placeCardViewController);

  }
  -[ActionCoordinator ensureMapSelectionVisible](self, "ensureMapSelectionVisible");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
  objc_msgSend(v13, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController || v8 != placeCardViewController)
  {
    v17 = objc_opt_class(SimpleResultsViewController);
    if ((objc_opt_isKindOfClass(v8, v17) & 1) == 0)
    {
      if (sub_1002A8AA0(v6) != 5)
      {
        v35 = objc_opt_class(TrafficIncidentContaineeViewController);
        if ((objc_opt_isKindOfClass(v8, v35) & 1) != 0
          || (v36 = objc_opt_class(LineCardViewController), (objc_opt_isKindOfClass(v8, v36) & 1) != 0)
          || (v37 = objc_opt_class(TransitLineDisambiguationViewController),
              (objc_opt_isKindOfClass(v8, v37) & 1) != 0))
        {
          WeakRetained = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
          -[PlaceCardViewController replaceCurrentWithController:](WeakRetained, "replaceCurrentWithController:", v6);
          goto LABEL_38;
        }
      }
      if (!v4)
        goto LABEL_50;
      v19 = objc_opt_class(ResultsViewController);
      if ((objc_opt_isKindOfClass(v8, v19) & 1) == 0
        || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession")),
            v21 = objc_msgSend(v20, "singleResultMode"),
            v20,
            !v21))
      {
        v22 = objc_opt_class(ResultsViewController);
        if ((objc_opt_isKindOfClass(v8, v22) & 1) == 0
          || (v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession")),
              v24 = objc_msgSend(v23, "isSingleResultToShowAsPlacecard"),
              v23,
              !v24))
        {
LABEL_50:
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](v6, "placeCardItem"));
          if (objc_msgSend(v25, "isVenueItem"))
          {
            v26 = objc_opt_class(ExtensionFlowViewController);
            isKindOfClass = objc_opt_isKindOfClass(v8, v26);

            if ((isKindOfClass & 1) != 0)
              -[ActionCoordinator presentSearchAnimated:](self, "presentSearchAnimated:", 0);
          }
          else
          {

          }
          if (!v4
            || !v8
            || sub_1002A8AA0(v8) == 5
            || (v38 = objc_opt_class(PlaceCardViewController), (objc_opt_isKindOfClass(v8, v38) & 1) == 0))
          {
            WeakRetained = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
            -[PlaceCardViewController presentController:](WeakRetained, "presentController:", v6);
            goto LABEL_38;
          }
        }
      }
      v15 = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
      WeakRetained = v15;
      goto LABEL_7;
    }
    WeakRetained = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](v6, "placeCardItem"));
    if (objc_msgSend(v18, "isVenueItem"))
    {

    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](v6, "placeCardItem"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mapItem"));
      v33 = -[PlaceCardViewController containsMapItem:](WeakRetained, "containsMapItem:", v32);

      if (v33)
      {
        v34 = objc_loadWeakRetained((id *)&self->_containerViewController);
        objc_msgSend(v34, "presentController:", v6);
LABEL_25:

        goto LABEL_38;
      }
    }
    v34 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v34, "replaceCurrentWithController:moveToContaineeLayout:", v6, 2);
    goto LABEL_25;
  }
  v15 = (PlaceCardViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
  WeakRetained = v15;
  if (v8 != v6)
  {
LABEL_7:
    -[PlaceCardViewController replaceCurrentWithController:moveToContaineeLayout:](v15, "replaceCurrentWithController:moveToContaineeLayout:", v6, 2);
LABEL_38:
    v30 = 1;
    goto LABEL_39;
  }
  -[PlaceCardViewController removeControllerFromStack:](v15, "removeControllerFromStack:", self->_simpleListResultsVC);

  v28 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v29 = objc_msgSend(v28, "containerStyle");

  if (v29 != (id)1)
  {
    v30 = 0;
    goto LABEL_40;
  }
  WeakRetained = (PlaceCardViewController *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
  -[PlaceCardViewController wantsLayout:](WeakRetained, "wantsLayout:", 2);
  v30 = 0;
LABEL_39:

LABEL_40:
  if (-[TransitLineSelectionActionController isActive](self->_lineSelectionAction, "isActive"))
  {
    v39 = objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](v6, "placeCardItem"));
    v40 = (void *)v39;
    if (v39)
    {
      v44 = CFSTR("ActionControllerDeactivationItemKey");
      v45 = v39;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    }
    else
    {
      v41 = 0;
    }
    -[TransitLineSelectionActionController deactivateWithContext:](self->_lineSelectionAction, "deactivateWithContext:", v41);

  }
  if ((v30 & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "chromeViewController"));
    objc_msgSend(v43, "updateComponentsIfNeeded");

  }
}

- (void)presentLineCardForItem:(id)a3 loading:(BOOL)a4 overDisambiguation:(BOOL)a5
{
  -[ActionCoordinator presentLineCardForItem:labelMarker:loading:overDisambiguation:preferredLayout:](self, "presentLineCardForItem:labelMarker:loading:overDisambiguation:preferredLayout:", a3, 0, a4, a5, 0);
}

- (void)presentLineCardForItem:(id)a3 loading:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v11;
  id v13;
  id v14;
  void *v15;
  TransitLineSelectionActionController *lineSelectionAction;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4;
  v13 = a3;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
  objc_msgSend(v15, "setLineItem:labelMarker:loading:preferredLayout:", v13, 0, v11, 0);
  lineSelectionAction = self->_lineSelectionAction;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10059F490;
  v21[3] = &unk_1011BC0E0;
  v21[4] = self;
  v22 = v13;
  v23 = v15;
  v17 = v15;
  v18 = v13;
  -[TransitLineSelectionActionController selectLine:zoomToMapRegion:onActivation:](lineSelectionAction, "selectLine:zoomToMapRegion:onActivation:", v18, 0, v21);
  objc_msgSend(v17, "setModalPresentationStyle:", 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "popoverPresentationController"));
  objc_msgSend(v19, "setDelegate:", self);
  objc_msgSend(v19, "setSourceView:", v14);

  objc_msgSend(v19, "setSourceRect:", x, y, width, height);
  objc_msgSend(v19, "setPermittedArrowDirections:", 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v20, "_maps_topMostPresentViewController:animated:completion:", v17, 1, 0);

}

- (void)presentLineCardForItem:(id)a3 labelMarker:(id)a4 loading:(BOOL)a5 overDisambiguation:(BOOL)a6 preferredLayout:(unint64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CLLocationDegrees v23;
  CLLocationDegrees v24;
  CLLocationCoordinate2D v25;
  uint64_t v26;
  uint64_t v27;
  char isKindOfClass;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v9 = a5;
  v36 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
  v14 = sub_1002A8AA0(v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
  objc_msgSend(v15, "setLineItem:labelMarker:loading:preferredLayout:", v12, v36, v9, a7);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentViewController"));

  if (v14 != 5)
  {
    v26 = objc_opt_class(PlaceCardViewController);
    if ((objc_opt_isKindOfClass(v17, v26) & 1) != 0)
      goto LABEL_9;
    v27 = objc_opt_class(LineCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v17, v27);
    if ((isKindOfClass & 1) == 0 && !a6)
    {
      v29 = objc_opt_class(TransitLineDisambiguationViewController);
      isKindOfClass = objc_opt_isKindOfClass(v17, v29);
    }
    if ((isKindOfClass & 1) != 0)
    {
LABEL_9:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
      objc_msgSend(v20, "replaceCurrentWithController:moveToContaineeLayout:", v30, a7);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
      objc_msgSend(v20, "presentController:", v30);
    }
    goto LABEL_14;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
  objc_msgSend(v18, "setPreferredPresentationStyle:", 3);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "macPopoverPresentationController"));

  if (v36)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
    objc_msgSend(v21, "setModalPresentationStyle:", 7);

    objc_msgSend(v36, "coordinate");
    v23 = v22;
    objc_msgSend(v36, "coordinate");
    v25 = CLLocationCoordinate2DMake(v23, v24);
    objc_msgSend(v20, "setCoordinate:", v25.latitude, v25.longitude);
LABEL_12:
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
    objc_msgSend(v30, "presentController:", v35);

LABEL_14:
    goto LABEL_15;
  }
  v31 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v17, v31) & 1) != 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
    objc_msgSend(v32, "setModalPresentationStyle:", 7);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardViewController](self, "placeCardViewController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "macPopoverPresentationController"));
    objc_msgSend(v34, "coordinate");
    objc_msgSend(v20, "setCoordinate:");

    -[ActionCoordinator dismissPlaceCardViewController:](self, "dismissPlaceCardViewController:", self->_placeCardViewController);
    goto LABEL_12;
  }
LABEL_15:

}

- (void)ensureMapSelectionVisible
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v3, "_edgeInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v13 = objc_msgSend(v12, "containerStyle");

  if (v13 == (id)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentViewController"));
    objc_msgSend(v15, "heightForLayout:", 2);
    v9 = v16;

  }
  +[LookAroundButtonContainerViewController expandedHeight](LookAroundButtonContainerViewController, "expandedHeight");
  v18 = v9 + v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "labelMarker"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self, "venuesManager"));
  v25 = 0;
  v26 = 0;
  objc_msgSend(v21, "getMinZoom:maxZoom:forDisplayingLabelMarker:", &v26, &v25, v20);
  v22 = v26;
  v23 = v25;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapCameraController](self, "mapCameraController"));
  objc_msgSend(v24, "frameLabelMarker:edgeInsets:minZoom:maxZoom:completion:", v20, v22, v23, 0, v5, v7, v18, v11);

  -[VenuesManager displayFloorForSelectedLabelMarker:](self->_venuesManager, "displayFloorForSelectedLabelMarker:", v20);
}

- (void)presentSearch
{
  -[ActionCoordinator presentSearchAnimated:](self, "presentSearchAnimated:", 1);
}

- (void)viewControllerPresentSearchEditing
{
  id v3;

  -[ActionCoordinator exitRoutePlanningIfNeededAnimated:](self, "exitRoutePlanningIfNeededAnimated:", 0);
  -[ActionCoordinator clearSearch](self, "clearSearch");
  -[ActionCoordinator presentSearchAnimated:](self, "presentSearchAnimated:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v3, "searchBarBecomeFirstResponder");

}

- (void)viewControllerPresentSearchEndEditing
{
  -[ActionCoordinator viewControllerPresentSearchEndEditingAnimated:](self, "viewControllerPresentSearchEndEditingAnimated:", 1);
}

- (void)viewControllerPresentSearchEndEditingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[ActionCoordinator exitRoutePlanningIfNeededAnimated:](self, "exitRoutePlanningIfNeededAnimated:", 0);
  -[ActionCoordinator presentSearchAnimated:](self, "presentSearchAnimated:", v3);
  -[ActionCoordinator clearSearch](self, "clearSearch");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "endEditing");

}

- (void)presentSearchAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(WeakRetained, "presentController:animated:useDefaultContaineeLayout:", v5, v3, 1);

}

- (void)presentSharedTrips
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = sub_1002A8AA0(WeakRetained);

  if (v4 != 5)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
    objc_msgSend(v5, "openSharedTrips");

  }
}

- (void)presentSharedTrip:(id)a3
{
  ControlContainerViewController **p_containerViewController;
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  p_containerViewController = &self->_containerViewController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v7 = sub_1002A8AA0(WeakRetained);

  if (v7 == 5)
    -[ActionCoordinator _exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:](self, "_exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:", 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v8, "openSharedTrip:", v5);

}

- (void)presentSharedTrip:(id)a3 inPopoverFromView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SharedTripContaineeViewController *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[SharedTripContaineeViewController initWithSharedTrip:]([SharedTripContaineeViewController alloc], "initWithSharedTrip:", v7);

  -[ControlContaineeViewController setDelegate:](v10, "setDelegate:", self);
  -[SharedTripContaineeViewController setActionDelegate:](v10, "setActionDelegate:", self);
  -[SharedTripContaineeViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContaineeViewController popoverPresentationController](v10, "popoverPresentationController"));
  objc_msgSend(v8, "setSourceView:", v6);

  objc_msgSend(v8, "setPermittedArrowDirections:", 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v9, "_maps_topMostPresentViewController:animated:completion:", v10, 1, 0);

}

- (void)presentChinaAlertForSharedTrip:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v5, "presentChinaAlertForSharedTrip:", v4);

}

- (void)presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v5, "presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:", v4);

}

- (void)clearSharedTrips
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v2, "closeSharedTrips");

}

- (void)presentLoadingResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  RouteSearchViewController *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[5];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
  objc_msgSend(v4, "setHidden:", 0);

  if (!MapsFeature_IsEnabled_SearchAndDiscovery(v5))
    goto LABEL_7;
  v6 = (RouteSearchViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  if (v6 == self->_routeSearchVC
    || -[ActionCoordinator isPresentingAddStopSearchResults](self, "isPresentingAddStopSearchResults"))
  {
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v7, "userInterfaceIdiom") == (id)5)
  {

LABEL_6:
    goto LABEL_7;
  }
  v9 = -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented");

  if ((v9 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10059FF18;
    v12[3] = &unk_1011ACCB8;
    v12[4] = self;
    v13 = v3;
    objc_msgSend(WeakRetained, "presentController:animated:completion:", v11, 1, v12);

    goto LABEL_8;
  }
LABEL_7:
  v8 = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(v8, "presentController:", v3);

LABEL_8:
}

- (void)presentVenueCategoryWithVenueCategoryItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  v6 = objc_opt_class(VenueCategoryViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentDownloader"));
  objc_msgSend(v9, "searchWillStart");

  if (objc_msgSend(v12, "isAutoCompleteCategory"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "venueIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchCategory"));
    -[ActionCoordinator viewController:presentVenueFromAutoCompleteWithVenueIdentifier:searchCategory:source:](self, "viewController:presentVenueFromAutoCompleteWithVenueIdentifier:searchCategory:source:", 0, v10, v11, 2);

  }
}

- (void)presentGuidesHomeWithGuideLocation:(id)a3
{
  id v4;
  GuidesHomeViewController *v5;
  GEOMapServiceTraits *v6;
  GuidesHomeViewController *v7;
  id WeakRetained;
  GuidesHomeViewController *guideHomeVC;

  v4 = a3;
  v5 = [GuidesHomeViewController alloc];
  v6 = -[ActionCoordinator newTraits](self, "newTraits");
  v7 = -[GuidesHomeViewController initWithGuideLocation:withTraits:](v5, "initWithGuideLocation:withTraits:", v4, v6);

  -[ContaineeViewController setContaineeDelegate:](v7, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v7, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v7, 1);

  guideHomeVC = self->_guideHomeVC;
  self->_guideHomeVC = v7;

}

- (void)removeContainerViewControllerObserver
{
  void *v3;
  id containerViewControllerWillPresentContaineeObserver;
  void *v5;
  id containerViewControllerDidResignContaineeObserver;

  if (self->_containerViewControllerWillPresentContaineeObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_containerViewControllerWillPresentContaineeObserver);

    containerViewControllerWillPresentContaineeObserver = self->_containerViewControllerWillPresentContaineeObserver;
    self->_containerViewControllerWillPresentContaineeObserver = 0;

  }
  if (self->_containerViewControllerDidResignContaineeObserver)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:", self->_containerViewControllerDidResignContaineeObserver);

    containerViewControllerDidResignContaineeObserver = self->_containerViewControllerDidResignContaineeObserver;
    self->_containerViewControllerDidResignContaineeObserver = 0;

  }
}

- (void)addContainerViewControllerObservers
{
  ControlContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id containerViewControllerWillPresentContaineeObserver;
  void *v9;
  id v10;
  void *v11;
  id containerViewControllerDidResignContaineeObserver;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = objc_loadWeakRetained((id *)p_containerViewController);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1005A0354;
    v15[3] = &unk_1011AD288;
    objc_copyWeak(&v16, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("ContainerWillPresentContaineeNotification"), v6, 0, v15));
    containerViewControllerWillPresentContaineeObserver = self->_containerViewControllerWillPresentContaineeObserver;
    self->_containerViewControllerWillPresentContaineeObserver = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = objc_loadWeakRetained((id *)p_containerViewController);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1005A0438;
    v13[3] = &unk_1011AD288;
    objc_copyWeak(&v14, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", CFSTR("ContainerDidResignContaineeNotification"), v10, 0, v13));
    containerViewControllerDidResignContaineeObserver = self->_containerViewControllerDidResignContaineeObserver;
    self->_containerViewControllerDidResignContaineeObserver = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)containerViewControllerWillPresentContainee:(id)a3 overContainee:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = objc_opt_class(SearchViewController);
  if ((objc_opt_isKindOfClass(v18, v7) & 1) == 0)
  {
    v8 = objc_opt_class(SearchViewController);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      v9 = objc_opt_class(ResultsViewController);
      if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
        goto LABEL_10;
    }
    v10 = objc_opt_class(PlaceCardViewController);
    if ((objc_opt_isKindOfClass(v18, v10) & 1) == 0)
    {
      v11 = objc_opt_class(RoutePlanningOverviewViewController);
      if ((objc_opt_isKindOfClass(v18, v11) & 1) == 0)
      {
        v12 = objc_opt_class(RouteSearchViewController);
        if ((objc_opt_isKindOfClass(v18, v12) & 1) == 0)
        {
          v13 = objc_opt_class(ResultsViewController);
          if ((objc_opt_isKindOfClass(v18, v13) & 1) == 0)
          {
            v14 = objc_opt_class(CuratedCollectionViewController);
            if ((objc_opt_isKindOfClass(v18, v14) & 1) == 0)
            {
              v15 = objc_opt_class(PublisherViewController);
              if ((objc_opt_isKindOfClass(v18, v15) & 1) == 0)
LABEL_10:
                -[SearchViewController clearRetainedSearchQuery](self->_searchModeViewController, "clearRetainedSearchQuery");
            }
          }
        }
      }
    }
  }
  v16 = objc_opt_class(RoutePlanningTimingViewController);
  if ((objc_opt_isKindOfClass(v18, v16) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v17, "setIgnoreSelectionChanges:", 1);

  }
  -[ActionCoordinator updateRouteAnnotations](self, "updateRouteAnnotations");

}

- (void)containerViewControllerDidResignContainee:(id)a3 toContainee:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**collectionCreateVCDidDismissHandler)(void);
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = objc_opt_class(RoutePlanningTimingViewController);
  if ((objc_opt_isKindOfClass(v14, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v8, "setIgnoreSelectionChanges:", 0);

  }
  v9 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {
    v10 = objc_opt_class(TransitSchedulesViewController);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0)
      -[RoutePlanningMapController setSelectCurrentRoute:](self->_routePlanningMapController, "setSelectCurrentRoute:", 1);
  }
  -[ActionCoordinator updateRouteAnnotations](self, "updateRouteAnnotations");
  v11 = objc_opt_class(CollectionCreateViewController);
  if ((objc_opt_isKindOfClass(v14, v11) & 1) != 0)
  {
    collectionCreateVCDidDismissHandler = (void (**)(void))self->_collectionCreateVCDidDismissHandler;
    if (collectionCreateVCDidDismissHandler)
    {
      collectionCreateVCDidDismissHandler[2]();
      v13 = self->_collectionCreateVCDidDismissHandler;
      self->_collectionCreateVCDidDismissHandler = 0;

    }
  }

}

- (void)viewController:(id)a3 openFavoriteItem:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD *v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  id v33;
  _QWORD v34[4];
  id v35;
  ActionCoordinator *v36;
  id v37;
  id v38;
  id v39;
  char v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  BOOL v43;
  unsigned __int8 v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  _QWORD v49[6];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mkMapItem"));
  v32 = objc_msgSend(v9, "isAlreadyThere");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MSGEntryForceShowPlacecardOnTap")));
  v31 = objc_msgSend(v12, "BOOLValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v30 = objc_msgSend(v13, "isAuthorizedForPreciseLocation");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitCollection"));
  v16 = objc_msgSend(v15, "userInterfaceIdiom") == (id)1;

  LOBYTE(v15) = objc_msgSend(v11, "_canGetDirections");
  v17 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v17, "setObject:forKeyedSubscript:", &off_10126DE28, CFSTR("DirectionsSessionInitiatorKey"));
  v18 = objc_msgSend(v17, "copy");
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1005A0AE4;
  v49[3] = &unk_1011BC108;
  v49[4] = self;
  v19 = objc_retainBlock(v49);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1005A0CB4;
  v45[3] = &unk_1011BC130;
  v45[4] = self;
  v20 = v9;
  v46 = v20;
  v21 = v8;
  v47 = v21;
  v33 = v18;
  v48 = v33;
  v22 = objc_retainBlock(v45);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1005A0F28;
  v34[3] = &unk_1011BC158;
  v23 = v11;
  v35 = v23;
  v36 = self;
  v40 = (char)v15;
  v41 = v32;
  v42 = v30;
  v43 = v16;
  v44 = v31;
  v24 = v19;
  v38 = v24;
  v25 = v20;
  v37 = v25;
  v26 = v22;
  v39 = v26;
  v27 = objc_retainBlock(v34);
  v28 = objc_msgSend(v25, "type");
  if ((unint64_t)v28 >= 4)
  {
    if (v28 == (id)6)
    {
      -[ActionCoordinator viewControllerPresentNearbyTransitDepartures:](self, "viewControllerPresentNearbyTransitDepartures:", v21);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 214, 8, 0);
      goto LABEL_9;
    }
    if (v28 != (id)5)
      goto LABEL_9;
  }
  if (objc_msgSend(v25, "isShortcutForSetup"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v25));
    -[ActionCoordinator viewController:showAddShortcut:](self, "viewController:showAddShortcut:", v21, v29);

  }
  else
  {
    ((void (*)(_QWORD *, id))v27[2])(v27, v25);
  }
LABEL_9:

}

- (void)viewController:(id)a3 openMapsSuggestionEntry:(id)a4 withUserInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  SearchFieldItem *v30;
  void *v31;
  SearchResult *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t Log;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  SearchFieldItem *v47;
  id v48;
  id v49;
  NSObject *v50;
  char *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  id v55;
  SearchFieldItem *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  DirectionItem *v61;
  unsigned int v62;
  uint64_t v63;
  id v64;
  id v65;
  NSObject *v66;
  _BOOL4 v67;
  SearchFieldItem *v68;
  SearchResult *v69;
  void *v70;
  SearchResult *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  SearchResult *v76;
  void *v77;
  void *v78;
  DrivePreferences *v79;
  void *v80;
  void *v81;
  DrivePreferences *v82;
  TransitPreferences *v83;
  void *v84;
  void *v85;
  TransitPreferences *v86;
  WalkPreferences *v87;
  void *v88;
  void *v89;
  WalkPreferences *v90;
  CyclePreferences *v91;
  void *v92;
  void *v93;
  CyclePreferences *v94;
  void *v95;
  DrivePreferences *v96;
  void *v97;
  void *v98;
  DrivePreferences *v99;
  TransitPreferences *v100;
  void *v101;
  void *v102;
  TransitPreferences *v103;
  WalkPreferences *v104;
  void *v105;
  void *v106;
  WalkPreferences *v107;
  CyclePreferences *v108;
  void *v109;
  void *v110;
  CyclePreferences *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  DirectionItem *v117;
  void *v118;
  unsigned int v119;
  char *v120;
  id v121;
  id v122;
  id v123;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD v130[5];
  id v131;
  _QWORD v132[4];
  id v133;
  ActionCoordinator *v134;
  id v135;
  id v136;
  id v137;
  char v138;
  unsigned __int8 v139;
  unsigned __int8 v140;
  BOOL v141;
  char v142;
  _QWORD v143[5];
  id v144;
  id v145;
  id v146;
  _QWORD v147[5];
  id v148;
  id v149;
  uint8_t buf[4];
  char *v151;
  __int16 v152;
  id v153;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "containsKey:", CFSTR("MapsSuggestionsRoutingNotAvailableKey")))
    v119 = objc_msgSend(v8, "BOOLeanForKey:", CFSTR("MapsSuggestionsRoutingNotAvailableKey"));
  else
    v119 = 0;
  v10 = objc_msgSend(v8, "BOOLeanForKey:", CFSTR("MapsSuggestionsAlreadyThereKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v12 = objc_msgSend(v11, "isAuthorizedForPreciseLocation");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));
  v15 = objc_msgSend(v14, "userInterfaceIdiom") == (id)1;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MSGEntryForceShowPlacecardOnTap")));
  LOBYTE(v14) = objc_msgSend(v16, "BOOLValue");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "MKMapItem"));
  v18 = objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v18, "setObject:forKeyedSubscript:", &off_10126DE28);
  v118 = v18;
  v19 = objc_msgSend(v18, "copy");
  v147[0] = _NSConcreteStackBlock;
  v147[1] = 3221225472;
  v147[2] = sub_1005A228C;
  v147[3] = &unk_1011BC180;
  v147[4] = self;
  v20 = v7;
  v148 = v20;
  v21 = v19;
  v149 = v21;
  v22 = objc_retainBlock(v147);
  v143[0] = _NSConcreteStackBlock;
  v143[1] = 3221225472;
  v143[2] = sub_1005A2488;
  v143[3] = &unk_1011BC1A8;
  v143[4] = self;
  v23 = v8;
  v144 = v23;
  v123 = v20;
  v145 = v123;
  v121 = v21;
  v146 = v121;
  v24 = objc_retainBlock(v143);
  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472;
  v132[2] = sub_1005A270C;
  v132[3] = &unk_1011BC1D0;
  v122 = v17;
  v133 = v122;
  v134 = self;
  v138 = v119;
  v139 = v10;
  v140 = v12;
  v141 = v15;
  v142 = (char)v14;
  v25 = v22;
  v136 = v25;
  v26 = v23;
  v135 = v26;
  v27 = v24;
  v137 = v27;
  v28 = objc_retainBlock(v132);
  switch((unint64_t)objc_msgSend(v26, "type"))
  {
    case 1uLL:
    case 2uLL:
    case 0x13uLL:
      if (!objc_msgSend(v26, "isShortcutForSetup"))
        goto LABEL_5;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithSuggestion:](ShortcutEditSession, "editSessionWithSuggestion:", v26));
      -[ActionCoordinator viewController:showAddShortcut:](self, "viewController:showAddShortcut:", v123, v29);

      goto LABEL_6;
    case 3uLL:
    case 4uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x17uLL:
      goto LABEL_5;
    case 5uLL:
    case 0x15uLL:
      ((void (*)(_QWORD *, id))v25[2])(v25, v26);
      goto LABEL_6;
    case 7uLL:
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472;
      v130[2] = sub_1005A29D4;
      v130[3] = &unk_1011BC1F8;
      v130[4] = self;
      v131 = v123;
      objc_msgSend(v36, "fetchParkedCar:", v130);

      goto LABEL_6;
    case 8uLL:
      if (v122)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", objc_msgSend(v122, "_muid"), 1));
        objc_msgSend(v37, "setTappedProactiveTrayItem:", 1);
        objc_msgSend(v37, "setMuid:", objc_msgSend(v122, "_muid"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "_restaurantLink_firstProviderIdentifier"));
        objc_msgSend(v37, "setAppID:", v38);

        ((void (*)(_QWORD *, id))v25[2])(v25, v26);
      }
      goto LABEL_6;
    case 9uLL:
      if (sub_10048286C())
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey")));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringForKey:", CFSTR("MapsSuggestionsRideBookingRideIDKey")));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v39, v40));
        objc_msgSend(v41, "setTappedProactiveTrayItem:", 1);
        Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
        v43 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v120 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m");
          v44 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Continuing the RideBookingSession with identifier: %@"), v39);
          *(_DWORD *)buf = 136315394;
          v151 = v120;
          v152 = 2112;
          v153 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

        }
        if (v39)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
          objc_msgSend(v45, "continueRideBookingSessionWithApplicationIdentifier:", v39);

        }
      }
      goto LABEL_6;
    case 0xAuLL:
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringForKey:", CFSTR("MapsSuggestionsCarPlayEnergyQueryString")));
      v47 = objc_alloc_init(SearchFieldItem);
      -[SearchFieldItem setSearchString:](v47, "setSearchString:", v46);
      -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", v123, v47, &off_101274778);

      goto LABEL_6;
    case 0xBuLL:
      v48 = objc_alloc_init((Class)NSMutableArray);
      v116 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:](SearchFieldItem, "searchFieldItemsForRouteInSuggestionsEntry:", v26));
      objc_msgSend(v48, "addObjectsFromArray:", v116);
      v49 = sub_10043214C();
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = (char *)objc_msgSend(v116, "count");
        *(_DWORD *)buf = 134217984;
        v151 = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Extracted %lu items from MSG entry.", buf, 0xCu);
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "firstObject"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "searchResult"));
      v54 = objc_msgSend(v53, "isDynamicCurrentLocation");

      if ((v54 & 1) != 0)
      {
        v55 = sub_10043214C();
        v56 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(&v56->super, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
        }
      }
      else
      {
        v56 = objc_alloc_init(SearchFieldItem);
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
        -[SearchFieldItem setSearchResult:](v56, "setSearchResult:", v58);

        objc_msgSend(v48, "insertObject:atIndex:", v56, 0);
      }

      v59 = sub_10043214C();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v151 = (char *)v48;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Attempting to resume route to %@", buf, 0xCu);
      }

      v61 = [DirectionItem alloc];
      v62 = objc_msgSend(v26, "transportType") - 1;
      if (v62 > 5)
        v63 = 1;
      else
        v63 = qword_100E392E8[v62];
      v117 = -[DirectionItem initWithItems:transportType:](v61, "initWithItems:transportType:", v48, v63);
      if (!v119)
        goto LABEL_53;
      v64 = objc_msgSend(v48, "count");
      v65 = sub_10043214C();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
      if ((unint64_t)v64 > 2)
      {
        if (v67)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "MPR resume route marked as unroutable, but assuming it actually is.", buf, 2u);
        }

LABEL_53:
        if (objc_msgSend(v26, "containsKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")))
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")));
          v79 = [DrivePreferences alloc];
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "automobileOptions"));
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v82 = -[DrivePreferences initWithAutomobileOptions:defaults:](v79, "initWithAutomobileOptions:defaults:", v80, v81);
          -[DirectionItem setDrivePreferences:](v117, "setDrivePreferences:", v82);

          v83 = [TransitPreferences alloc];
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "transitOptions"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v86 = -[TransitPreferences initWithTransitOptions:defaults:](v83, "initWithTransitOptions:defaults:", v84, v85);
          -[DirectionItem setTransitPreferences:](v117, "setTransitPreferences:", v86);

          v87 = [WalkPreferences alloc];
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "walkingOptions"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v90 = -[WalkPreferences initWithWalkingOptions:defaults:](v87, "initWithWalkingOptions:defaults:", v88, v89);
          -[DirectionItem setWalkPreferences:](v117, "setWalkPreferences:", v90);

          v91 = [CyclePreferences alloc];
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "cyclingOptions"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v94 = -[CyclePreferences initWithCyclingOptions:defaults:](v91, "initWithCyclingOptions:defaults:", v92, v93);
          -[DirectionItem setCyclePreferences:](v117, "setCyclePreferences:", v94);

        }
        v68 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v121));
        -[SearchFieldItem setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("DirectionsBeginNavigationSessionImmediatelyKey"));
        -[SearchFieldItem setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("DirectionsIsResumedNavigationSessionKey"));
        -[SearchFieldItem setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", &off_10126DE28, CFSTR("DirectionsSessionInitiatorKey"));
        if (objc_msgSend(v26, "containsKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")))
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")));
          v96 = [DrivePreferences alloc];
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "automobileOptions"));
          v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v99 = -[DrivePreferences initWithAutomobileOptions:defaults:](v96, "initWithAutomobileOptions:defaults:", v97, v98);
          -[DirectionItem setDrivePreferences:](v117, "setDrivePreferences:", v99);

          v100 = [TransitPreferences alloc];
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "transitOptions"));
          v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v103 = -[TransitPreferences initWithTransitOptions:defaults:](v100, "initWithTransitOptions:defaults:", v101, v102);
          -[DirectionItem setTransitPreferences:](v117, "setTransitPreferences:", v103);

          v104 = [WalkPreferences alloc];
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "walkingOptions"));
          v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v107 = -[WalkPreferences initWithWalkingOptions:defaults:](v104, "initWithWalkingOptions:defaults:", v105, v106);
          -[DirectionItem setWalkPreferences:](v117, "setWalkPreferences:", v107);

          v108 = [CyclePreferences alloc];
          v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "cyclingOptions"));
          v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v111 = -[CyclePreferences initWithCyclingOptions:defaults:](v108, "initWithCyclingOptions:defaults:", v109, v110);
          -[DirectionItem setCyclePreferences:](v117, "setCyclePreferences:", v111);

          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "resumeRouteHandleStorage"));
          -[SearchFieldItem setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v112, CFSTR("DirectionsResumeRouteHandleStorageKey"));

        }
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sharingContacts"));
        -[SearchFieldItem setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v113, CFSTR("DirectionsPreviousContactsForTripSharing"));
        -[ActionCoordinator viewController:doDirectionItem:withUserInfo:](self, "viewController:doDirectionItem:withUserInfo:", v123, v117, v68);
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        if ((unint64_t)objc_msgSend(v48, "count") <= 2)
          v115 = 74;
        else
          v115 = 305;
        objc_msgSend(v114, "captureUserAction:onTarget:eventValue:", v115, 8, 0);

      }
      else
      {
        if (v67)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "NOT Resuming route as it's marked as unroutable", buf, 2u);
        }

        v68 = objc_alloc_init(SearchFieldItem);
        v69 = [SearchResult alloc];
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "MKMapItem"));
        v71 = -[SearchResult initWithMapItem:](v69, "initWithMapItem:", v70);
        -[SearchFieldItem setSearchResult:](v68, "setSearchResult:", v71);

        -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", v123, v68, 0);
      }

LABEL_6:
      return;
    case 0xCuLL:
      v30 = objc_alloc_init(SearchFieldItem);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringForKey:", CFSTR("MapsSuggestionsAppConnectionValueKey")));
      -[SearchFieldItem setAddressString:](v30, "setAddressString:", v31);

      if (v122)
      {
        v32 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v122);
        -[SearchFieldItem setSearchResult:](v30, "setSearchResult:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](v30, "searchResult"));
        objc_msgSend(v33, "setHasIncompleteMetadata:", 1);

        -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", v123, v30, v121);
      }
      else
      {
        v32 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "URLForKey:", CFSTR("MapsSuggestionsAppConnectionMapItemURL")));
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult absoluteString](v32, "absoluteString"));
        v73 = objc_msgSend(v72, "length") == 0;

        if (!v73)
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem mapItemsFromURL:options:](MKMapItem, "mapItemsFromURL:options:", v32, 0));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "firstObject"));
          v76 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v75);
          -[SearchFieldItem setSearchResult:](v30, "setSearchResult:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue(-[SearchFieldItem searchResult](v30, "searchResult"));
          objc_msgSend(v77, "setHasIncompleteMetadata:", 1);

        }
        -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v30, 0);
      }

      goto LABEL_6;
    case 0x14uLL:
      objc_initWeak((id *)buf, self);
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v125[0] = _NSConcreteStackBlock;
      v125[1] = 3221225472;
      v125[2] = sub_1005A2BD8;
      v125[3] = &unk_1011AD9D0;
      objc_copyWeak(&v126, (id *)buf);
      objc_msgSend(v57, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v125);

      objc_destroyWeak(&v126);
      objc_destroyWeak((id *)buf);
      goto LABEL_6;
    case 0x16uLL:
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "uniqueIdentifier"));
      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("NearbyTransit"));

      if (v35)
      {
        -[ActionCoordinator viewControllerPresentNearbyTransitDepartures:](self, "viewControllerPresentNearbyTransitDepartures:", v123);
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 214, 8, 0);
      }
      goto LABEL_6;
    case 0x18uLL:
      if (isLikelyMeetup(v26))
      {
LABEL_5:
        ((void (*)(_QWORD *, id))v28[2])(v28, v26);
      }
      else if (isRecentlyShared(v26))
      {
        objc_initWeak((id *)buf, self);
        v127[0] = _NSConcreteStackBlock;
        v127[1] = 3221225472;
        v127[2] = sub_1005A29F4;
        v127[3] = &unk_1011BC220;
        objc_copyWeak(&v129, (id *)buf);
        v128 = v123;
        +[MapsAutocompletePerson autoCompletePersonFrom:completionHandler:](_TtC4Maps22MapsAutocompletePerson, "autoCompletePersonFrom:completionHandler:", v26, v127);

        objc_destroyWeak(&v129);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_6;
    default:
      goto LABEL_6;
  }
}

- (void)viewController:(id)a3 openCommuteEntry:(id)a4
{
  id v6;
  id v7;
  SearchFieldItem *v8;
  void *v9;
  SearchFieldItem *v10;
  void *v11;
  DirectionItem *v12;
  void *v13;
  DirectionItem *v14;
  void *v15;
  const __CFString *v16;
  _UNKNOWN **v17;
  _QWORD v18[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SearchFieldItem);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
  -[SearchFieldItem setSearchResult:](v8, "setSearchResult:", v9);

  v10 = objc_alloc_init(SearchFieldItem);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator _searchResultFromMapsSuggestionsEntry:](self, "_searchResultFromMapsSuggestionsEntry:", v6));

  -[SearchFieldItem setSearchResult:](v10, "setSearchResult:", v11);
  v12 = [DirectionItem alloc];
  v18[0] = v8;
  v18[1] = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v14 = -[DirectionItem initWithItems:transportType:](v12, "initWithItems:transportType:", v13, 1);

  v16 = CFSTR("DirectionsSessionInitiatorKey");
  v17 = &off_10126DE28;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  -[ActionCoordinator viewController:doDirectionItem:allowToPromptEditing:withUserInfo:](self, "viewController:doDirectionItem:allowToPromptEditing:withUserInfo:", v7, v14, 0, v15);

}

- (id)_searchResultFromMapsSuggestionsEntry:(id)a3
{
  id v3;
  MapsLocationOfInterest *v4;
  SearchResult *v5;
  SearchResult *v6;
  void *v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;

  v3 = a3;
  if (objc_msgSend(v3, "type") == (id)24)
  {
    v4 = (MapsLocationOfInterest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "findMyWaypoint"));
    if (!v4)
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315906;
        v15 = "-[ActionCoordinator _searchResultFromMapsSuggestionsEntry:]";
        v16 = 2080;
        v17 = "ActionCoordinator.m";
        v18 = 1024;
        v19 = 1866;
        v20 = 2080;
        v21 = "findMyWaypoint != nil";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
      }

      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
    v5 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v4);
  }
  else
  {
    v4 = -[MapsLocationOfInterest initWithMapsSuggestionEntry:]([MapsLocationOfInterest alloc], "initWithMapsSuggestionEntry:", v3);
    if (v4)
    {
      v6 = [SearchResult alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest mapItem](v4, "mapItem"));
      v5 = -[SearchResult initWithMapItem:](v6, "initWithMapItem:", v7);

      -[SearchResult setLocationOfInterest:](v5, "setLocationOfInterest:", v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)_searchResultFromMapsFavoriteItem:(id)a3
{
  id v3;
  MapsLocationOfInterest *v4;
  SearchResult *v5;
  void *v6;
  SearchResult *v7;

  v3 = a3;
  v4 = -[MapsLocationOfInterest initWithMapsFavoriteItem:]([MapsLocationOfInterest alloc], "initWithMapsFavoriteItem:", v3);

  if (v4)
  {
    v5 = [SearchResult alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest mapItem](v4, "mapItem"));
    v7 = -[SearchResult initWithMapItem:](v5, "initWithMapItem:", v6);

    -[SearchResult setLocationOfInterest:](v7, "setLocationOfInterest:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewController:(id)a3 openURL:(id)a4
{
  id v5;
  MapsWebLinkPresenter *v6;
  void *v7;
  MapsWebLinkPresenter *v8;

  v5 = a4;
  v6 = [MapsWebLinkPresenter alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v8 = -[MapsWebLinkPresenter initWithPresentingViewController:](v6, "initWithPresentingViewController:", v7);

  -[MapsWebLinkPresenter presentWebURL:](v8, "presentWebURL:", v5);
}

- (void)viewController:(id)a3 openPlainTextFileURL:(id)a4
{
  id v5;
  id v6;
  PlainTextAttributionViewController *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = objc_alloc((Class)UINavigationController);
  v7 = -[PlainTextAttributionViewController initWithFileURL:]([PlainTextAttributionViewController alloc], "initWithFileURL:", v5);

  v9 = objc_msgSend(v6, "initWithRootViewController:", v7);
  if (!sub_1002A8AA0(v9))
    objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v8, "_maps_topMostPresentViewController:animated:completion:", v9, 1, 0);

}

- (void)viewController:(id)a3 openTransitIncidents:(id)a4 fromView:(id)a5 withUserInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  MapsIncidentsViewController *v14;
  void *v15;
  id WeakRetained;
  MapsTransitIncidentsContaineeViewController *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == (id)5)
    {
      if (v10)
      {
        v14 = -[MapsIncidentsViewController initWithTransitIncidents:]([MapsIncidentsViewController alloc], "initWithTransitIncidents:", v9);
        -[MapsIncidentsViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 7);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController popoverPresentationController](v14, "popoverPresentationController"));
        objc_msgSend(v15, "setPermittedArrowDirections:", 12);
        objc_msgSend(v15, "setSourceView:", v10);
        WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
        objc_msgSend(WeakRetained, "_maps_topMostPresentViewController:animated:completion:", v14, 1, 0);

LABEL_10:
        goto LABEL_11;
      }
      v14 = -[MapsTransitIncidentsContaineeViewController initWithTransitIncidents:]([MapsTransitIncidentsContaineeViewController alloc], "initWithTransitIncidents:", v9);
      v19 = objc_opt_class(PlaceCardViewController);
      if ((objc_opt_isKindOfClass(v21, v19) & 1) != 0
        || (v20 = objc_opt_class(LineCardViewController), (objc_opt_isKindOfClass(v21, v20) & 1) != 0))
      {
        objc_msgSend(v21, "_maps_topMostPresentViewController:animated:completion:", v14, 1, 0);
        goto LABEL_10;
      }
      v17 = (MapsTransitIncidentsContaineeViewController *)v14;
    }
    else
    {
      v17 = -[MapsTransitIncidentsContaineeViewController initWithTransitIncidents:]([MapsTransitIncidentsContaineeViewController alloc], "initWithTransitIncidents:", v9);
      v14 = (MapsIncidentsViewController *)v17;
    }
    -[ContaineeViewController setContaineeDelegate:](v17, "setContaineeDelegate:", self);
    -[MapsIncidentsViewController setPreferredPresentationStyle:](v14, "setPreferredPresentationStyle:", 6);
    v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v18, "presentController:animated:completion:", v14, 1, 0);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)viewControllerRemoveSearchResultFocus:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v4, "setIgnoreSelectionChanges:", 1);

  objc_msgSend(v6, "_deselectLabelMarkerAnimated:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v5, "setIgnoreSelectionChanges:", 0);

}

- (void)viewController:(id)a3 focusSearchResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  ActionCoordinator *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "customPOIsController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personalizedItemKey"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005A36B0;
  v13[3] = &unk_1011BC248;
  v14 = v7;
  v15 = v6;
  v16 = self;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "customFeatureForKey:completion:", v10, v13);

}

- (void)viewController:(id)a3 openSearchResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v6, v9));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v8, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:completion:", v7, 1, v5, 1, 0);

}

- (void)viewController:(id)a3 selectPersonalizedItem:(id)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v9;
  PlaceCardItem *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a6;
  v21 = a4;
  if ((objc_opt_respondsToSelector(v21, "parkedCar") & 1) != 0
    && (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "parkedCar"))) != 0)
  {
    v10 = (PlaceCardItem *)v9;
    -[ActionCoordinator viewController:selectParkedCar:andPerformAction:](self, "viewController:selectParkedCar:andPerformAction:", 0, v9, 0);
  }
  else if ((objc_opt_respondsToSelector(v21, "incidentReport") & 1) != 0
         && (v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "incidentReport"))) != 0)
  {
    v10 = (PlaceCardItem *)v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 1031, 511, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
    objc_msgSend(v13, "setIncidentReport:", v10);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentViewController"));
    v16 = objc_opt_class(PlaceCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v18, "replaceCurrentWithController:moveToContaineeDefaultLayout:", v19, 1);
    else
      objc_msgSend(v18, "presentController:animated:useDefaultContaineeLayout:", v19, 1, 1);

  }
  else
  {
    v10 = -[PlaceCardItem initWithPersonalizedItem:]([PlaceCardItem alloc], "initWithPersonalizedItem:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "address"));
    -[ActionCoordinator presentPlaceCardForItem:addToHistory:source:saveSelectionState:](self, "presentPlaceCardForItem:addToHistory:source:saveSelectionState:", v10, v20 == 0, a5, v6);

  }
}

- (void)viewController:(id)a3 selectMapItem:(id)a4 address:(id)a5 addToHistory:(BOOL)a6 source:(unint64_t)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  PlaceCardItem *v13;

  v8 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[PlaceCardItem initWithMapItem:address:]([PlaceCardItem alloc], "initWithMapItem:address:", v12, v11);

  -[ActionCoordinator presentPlaceCardForItem:addToHistory:source:saveSelectionState:](self, "presentPlaceCardForItem:addToHistory:source:saveSelectionState:", v13, v8, a7, 1);
}

- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7
{
  -[ActionCoordinator viewController:selectSearchResult:addToHistory:source:saveSelectionState:replaceCurrentCard:](self, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:replaceCurrentCard:", a3, a4, a5, a6, a7, 0);
}

- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7 replaceCurrentCard:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v11;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  PlaceCardItem *v22;
  void *v23;
  GEOMapServiceTraits *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35[2];
  id location;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = objc_opt_class(ParkedCarSearchResult);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parkedCar"));
    -[ActionCoordinator viewController:selectParkedCar:andPerformAction:](self, "viewController:selectParkedCar:andPerformAction:", 0, v17, 0);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapItem"));
    v19 = objc_msgSend(v18, "_hasHikeInfo");

    if (v19)
    {
      objc_initWeak(&location, self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapItem"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1005A3D3C;
      v34[3] = &unk_1011B72B0;
      objc_copyWeak(v35, &location);
      v35[1] = (id)a6;
      objc_msgSend(v20, "enterRouteCreationWithMapItem:completion:", v21, v34);

      objc_destroyWeak(v35);
      objc_destroyWeak(&location);
    }
    else
    {
      v22 = -[PlaceCardItem initWithSearchResult:]([PlaceCardItem alloc], "initWithSearchResult:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
      v24 = -[ActionCoordinator newTraits](self, "newTraits");
      objc_msgSend(v23, "processSearchResult:traits:", v15, v24);

      if (a6 == 8)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
        v26 = objc_msgSend(v25, "singleResultMode");

        if (v26)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchSessionManager](self, "searchSessionManager"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentSearchSession"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "searchFieldItem"));

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "punchInDetails"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "completedSearchQuery"));

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "retainedSearchMetadata"));
          objc_msgSend(v30, "retainSpotlightQuery:metadata:", v32, v29);

        }
      }
      -[ActionCoordinator presentPlaceCardForItem:addToHistory:source:saveSelectionState:replaceCurrentCard:](self, "presentPlaceCardForItem:addToHistory:source:saveSelectionState:replaceCurrentCard:", v22, v11, a6, v9, v8);

    }
  }

}

- (void)presentPlaceCardForItem:(id)a3 addToHistory:(BOOL)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6
{
  -[ActionCoordinator presentPlaceCardForItem:addToHistory:source:saveSelectionState:replaceCurrentCard:](self, "presentPlaceCardForItem:addToHistory:source:saveSelectionState:replaceCurrentCard:", a3, a4, a5, a6, 0);
}

- (void)presentPlaceCardForItem:(id)a3 addToHistory:(BOOL)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6 replaceCurrentCard:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  unsigned int (**v17)(id, void *, id);
  void *v18;
  void *v19;
  void *v20;
  unsigned int (**v21)(id, void *, id);
  id v22;
  _QWORD *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  PlaceCardViewController *placeCardViewController;
  void *v28;
  unsigned __int8 v29;
  id v30;
  int v31;
  _QWORD v32[4];
  id v33;
  ActionCoordinator *v34;
  unsigned int (**v35)(id, void *, id);
  BOOL v36;
  _QWORD v37[5];

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1005A40A4;
  v37[3] = &unk_1011BC270;
  v37[4] = self;
  v13 = objc_retainBlock(v37);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v15 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1005A4210;
    v32[3] = &unk_1011BC298;
    v21 = v13;
    v35 = v21;
    v22 = v12;
    v33 = v22;
    v34 = self;
    v36 = a4;
    v23 = objc_retainBlock(v32);
    if (objc_msgSend(v22, "isVenueItem") && (objc_msgSend(v22, "isDroppedPin") & 1) == 0)
    {
      -[ActionCoordinator _presentVenuesPlaceCardItem:shouldSaveSelectionState:source:resetPlaceCardViewControllerBlock:](self, "_presentVenuesPlaceCardItem:shouldSaveSelectionState:source:resetPlaceCardViewControllerBlock:", v22, v8, a5, v23);
LABEL_25:

      v17 = v35;
      goto LABEL_26;
    }
    -[ActionCoordinator _cleanUpVenuesStackForNonVenuePlaceCardItem:](self, "_cleanUpVenuesStackForNonVenuePlaceCardItem:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
    if (sub_1002A8AA0(v24) == 5)
    {

    }
    else
    {
      v25 = -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented");

      if (v25)
      {
        v26 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardForRoutePlanningViewController](self, "placeCardForRoutePlanningViewController"));
        goto LABEL_21;
      }
    }
    placeCardViewController = self->_placeCardViewController;
    if (placeCardViewController)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](placeCardViewController, "placeCardItem"));
      if (v21[2](v21, v28, v22))
      {

      }
      else
      {
        v29 = -[ActionCoordinator shouldReusePlaceCardViewController:](self, "shouldReusePlaceCardViewController:", self->_placeCardViewController);

        if ((v29 & 1) == 0)
        {
          if (sub_1002A8AA0(self->_placeCardViewController) != 5)
          {
            v30 = -[ActionCoordinator _newPlaceCardViewControllerForReuse](self, "_newPlaceCardViewControllerForReuse");
            v31 = 1;
            goto LABEL_22;
          }
          -[ActionCoordinator dismissPlaceCardViewController:](self, "dismissPlaceCardViewController:", self->_placeCardViewController);
        }
      }
    }
    v26 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardViewController](self, "placeCardViewController"));
LABEL_21:
    v30 = (id)v26;
    v31 = 0;
LABEL_22:
    ((void (*)(_QWORD *, id))v23[2])(v23, v30);
    -[ActionCoordinator presentPlaceCard:canReplaceCurrentIfNecessary:](self, "presentPlaceCard:canReplaceCurrentIfNecessary:", v30, v7);
    if (v31)
      objc_storeStrong((id *)&self->_placeCardViewController, v30);

    goto LABEL_25;
  }
  v17 = (unsigned int (**)(id, void *, id))objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "placeCardItem"));
  if (!((unsigned int (*)(_QWORD *, id, void *))v13[2])(v13, v12, v18))
  {

    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "searchResult"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "autocompletePerson"));

  if (!v20)
    -[ActionCoordinator ensureMapSelectionVisible](self, "ensureMapSelectionVisible");
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", MKPlaceViewControllerDidShowNotification, v17, 0);

LABEL_26:
}

- (int64_t)_excludedContentForPlaceCardItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PlaceCardViewController *placeCardViewController;
  unsigned __int8 v12;

  v4 = a3;
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    v5 = 18;
  else
    v5 = 16;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self, "venuesManager"));
  if ((objc_msgSend(v6, "isUserAtVenueWithID:", objc_msgSend(v4, "venueID")) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venuesManager](self, "venuesManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personalizedItem"));
    objc_msgSend(v8, "coordinate");
    if ((objc_msgSend(v7, "isUserAtSameVenueAsCoordinate:") & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chargeStationWaypointInfo"));
      if (!v9)
      {
        v12 = objc_msgSend(v4, "isCurrentLocation");

        if ((v12 & 1) == 0)
          goto LABEL_11;
        goto LABEL_10;
      }

    }
  }

LABEL_10:
  v5 |= 1uLL;
LABEL_11:
  placeCardViewController = self->_placeCardViewController;
  if (placeCardViewController && sub_1002A8AA0(placeCardViewController) == 5)
    v5 |= 0x400uLL;

  return v5;
}

- (void)_cleanUpVenuesStackForNonVenuePlaceCardItem:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  id v6;
  void *v7;

  if ((objc_msgSend(a3, "isVenueItem") & 1) == 0)
  {
    v4 = -[ActionCoordinator _isBuildingMultipointRoute](self, "_isBuildingMultipointRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v6 = objc_msgSend(v5, "venueIdForCurrentCardStack");

    if (v6)
    {
      if ((v4 & 1) == 0)
      {
        -[ActionCoordinator _cleanupRoutePlanningIfNeededAnimated:](self, "_cleanupRoutePlanningIfNeededAnimated:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
        objc_msgSend(v7, "removeAllCards");

        -[ActionCoordinator presentSearch](self, "presentSearch");
      }
    }
  }
}

- (void)_presentVenuesPlaceCardItem:(id)a3 shouldSaveSelectionState:(BOOL)a4 source:(unint64_t)a5 resetPlaceCardViewControllerBlock:(id)a6
{
  _BOOL8 v8;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id WeakRetained;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;

  v8 = a4;
  v26 = a3;
  v10 = (void (**)(id, void *))a6;
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topViewController"));

    if (v11 == v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      objc_msgSend(v14, "popVenueCardItem:", 0);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v16 = objc_msgSend(v15, "pushVenueCardItem:source:savePlaceCardSelectionState:", v26, a5, v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if (sub_1002A8AA0(WeakRetained) == 5 || v16 != (id)3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
    v18 = v19 == v20;

  }
  else
  {
    v18 = 1;
  }

  if (!-[ActionCoordinator _isBuildingMultipointRoute](self, "_isBuildingMultipointRoute"))
    -[ActionCoordinator _exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:](self, "_exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:", 0, 0);
  if (a5 == 4 && v8)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v21, "clearSelection");

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v23 = objc_msgSend(v22, "isCardStackEmpty");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v24, "clearLinkedPlacesAndPolygon");

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardForVenuesViewController:](self, "placeCardForVenuesViewController:", v26));
  v10[2](v10, v25);

  -[ActionCoordinator presentPlaceCard:canReplaceCurrentIfNecessary:](self, "presentPlaceCard:canReplaceCurrentIfNecessary:", v25, v18);
}

- (void)viewController:(id)a3 selectTransitLineItem:(id)a4 zoomToMapRegion:(BOOL)a5
{
  -[ActionCoordinator viewController:selectTransitLineItem:zoomToMapRegion:preferredLayout:](self, "viewController:selectTransitLineItem:zoomToMapRegion:preferredLayout:", a3, a4, a5, 0);
}

- (void)viewController:(id)a3 selectTransitLineItem:(id)a4 zoomToMapRegion:(BOOL)a5 preferredLayout:(unint64_t)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  TransitLineSelectionActionController *lineSelectionAction;
  TransitLineSelectionActionController *v13;
  id WeakRetained;
  TransitLineSelectionActionController *v15;
  TransitLineSelectionActionController *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v7 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "labelMarker"));
  -[ActionCoordinator presentLineCardForItem:labelMarker:loading:overDisambiguation:preferredLayout:](self, "presentLineCardForItem:labelMarker:loading:overDisambiguation:preferredLayout:", v9, v11, sub_1002589D4(v9), 0, a6);
  lineSelectionAction = self->_lineSelectionAction;
  if (!lineSelectionAction)
  {
    v13 = [TransitLineSelectionActionController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v15 = -[TransitLineSelectionActionController initWithContainerViewController:actionCoordinator:](v13, "initWithContainerViewController:actionCoordinator:", WeakRetained, self);
    v16 = self->_lineSelectionAction;
    self->_lineSelectionAction = v15;

    lineSelectionAction = self->_lineSelectionAction;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005A4864;
  v20[3] = &unk_1011BC2C0;
  v20[4] = self;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = a6;
  v17 = v11;
  v18 = v10;
  v19 = v9;
  -[TransitLineSelectionActionController selectLine:zoomToMapRegion:onActivation:](lineSelectionAction, "selectLine:zoomToMapRegion:onActivation:", v19, v7, v20);

}

- (void)viewController:(id)a3 enterFlyoverForMapItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("SearchViewPreventAutoPresentingKeyboard_rdar_126940251"), 0);

  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v11, "enterFlyoverForMapItem:", v6);

}

- (void)viewControllerShowMyRecents:(id)a3 includeRecentSearches:(BOOL)a4
{
  id WeakRetained;
  id v6;

  v6 = -[MyRecentsViewController initIncludingRecentSearches:]([MyRecentsViewController alloc], "initIncludingRecentSearches:", a4);
  objc_msgSend(v6, "setContaineeDelegate:", self);
  objc_msgSend(v6, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v6, 1);

}

- (void)viewControllerShowMyShortcuts:(id)a3
{
  id WeakRetained;
  MyShortcutsViewController *v5;

  v5 = -[MyShortcutsViewController initWithNibName:bundle:]([MyShortcutsViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v5, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v5, 1);

}

- (void)viewController:(id)a3 showAddShortcut:(id)a4
{
  void *v5;
  void *v6;
  AddShortcutViewController *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertControllerForAttemptedAddShortcut"));

  if (v6)
  {
    v7 = (AddShortcutViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[AddShortcutViewController chromeViewController](v7, "chromeViewController"));
    objc_msgSend(WeakRetained, "_maps_topMostPresentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v7 = (AddShortcutViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator shortcutEditSessionController](self, "shortcutEditSessionController"));
      -[AddShortcutViewController showAddShortcut:](v7, "showAddShortcut:", v10);
      goto LABEL_7;
    }
    v7 = -[AddShortcutViewController initWithShortcutEditSession:]([AddShortcutViewController alloc], "initWithShortcutEditSession:", v10);
    -[ControlContaineeViewController setDelegate:](v7, "setDelegate:", self);
    -[ContaineeViewController setContaineeDelegate:](v7, "setContaineeDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator shortcutEditSessionController](self, "shortcutEditSessionController"));
    -[AddShortcutViewController setSessionController:](v7, "setSessionController:", v9);

    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:", v7, 1);
  }

LABEL_7:
}

- (void)viewController:(id)a3 editShortcut:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertControllerForAttemptedShowMyShortcut"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
    objc_msgSend(v8, "_maps_topMostPresentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator shortcutEditSessionController](self, "shortcutEditSessionController"));
    objc_msgSend(v7, "editShortcut:", v9);
  }

}

- (void)viewController:(id)a3 removeShortcut:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator shortcutEditSessionController](self, "shortcutEditSessionController"));
  objc_msgSend(v6, "removeShortcut:", v5);

}

- (void)viewController:(id)a3 openTransitLineCard:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  ControlContainerViewController **p_containerViewController;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  p_containerViewController = &self->_containerViewController;
  v13 = a5;
  v14 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v16, "convertRect:fromView:", v13, x, y, width, height);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = sub_1002589D4(v14);
  v27 = objc_loadWeakRetained((id *)p_containerViewController);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
  -[ActionCoordinator presentLineCardForItem:loading:sourceView:sourceRect:](self, "presentLineCardForItem:loading:sourceView:sourceRect:", v14, v25, v26, v18, v20, v22, v24);

}

- (void)viewController:(id)a3 editShortcut:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  ControlContainerViewController **p_containerViewController;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  id v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  p_containerViewController = &self->_containerViewController;
  v13 = a5;
  v14 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v16, "convertRect:fromView:", v13, x, y, width, height);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v27 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator shortcutEditSessionController](self, "shortcutEditSessionController"));
  v25 = objc_loadWeakRetained((id *)p_containerViewController);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  objc_msgSend(v27, "editShortcut:sourceView:sourceRect:", v14, v26, v18, v20, v22, v24);

}

- (id)shortcutEditSessionController
{
  ShortcutEditSessionController *shortcutEditSessionController;
  ShortcutEditSessionController **p_shortcutEditSessionController;
  ShortcutEditSessionControllerImpl *v4;
  id WeakRetained;

  p_shortcutEditSessionController = &self->_shortcutEditSessionController;
  shortcutEditSessionController = self->_shortcutEditSessionController;
  if (shortcutEditSessionController)
  {
    v4 = shortcutEditSessionController;
  }
  else
  {
    v4 = objc_alloc_init(ShortcutEditSessionControllerImpl);
    -[ShortcutEditSessionControllerImpl setDelegate:](v4, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    -[ShortcutEditSessionControllerImpl setContainerViewController:](v4, "setContainerViewController:", WeakRetained);

    objc_storeStrong((id *)p_shortcutEditSessionController, v4);
  }
  return v4;
}

- (void)shortcutEditSessionControllerFinished:(id)a3
{
  ShortcutEditSessionController *shortcutEditSessionController;

  shortcutEditSessionController = self->_shortcutEditSessionController;
  self->_shortcutEditSessionController = 0;

}

- (void)viewControllerShowLibraryRootView:(id)a3
{
  ControlContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  _TtC4Maps21LibraryViewController *v10;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
  v7 = objc_opt_class(_TtC4Maps21LibraryViewController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) == 0)
  {
    v10 = objc_alloc_init(_TtC4Maps21LibraryViewController);
    -[ContaineeViewController setContaineeDelegate:](v10, "setContaineeDelegate:", self);
    -[LibraryViewController setActionDelegate:](v10, "setActionDelegate:", self);
    v9 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v9, "presentController:animated:", v10, 1);

  }
}

- (void)viewControllerShowLibraryPlacesView:(id)a3
{
  id WeakRetained;
  _TtC4Maps27LibraryPlacesViewController *v5;

  v5 = objc_alloc_init(_TtC4Maps27LibraryPlacesViewController);
  -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", self);
  -[LibraryPlacesViewController setActionDelegate:](v5, "setActionDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v5, 1);

}

- (void)viewControllerShowCollections:(id)a3
{
  id WeakRetained;
  CollectionListViewController *v5;

  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  v5 = -[CollectionListViewController initWithNibName:bundle:]([CollectionListViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v5, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v5, 1);

}

- (void)viewController:(id)a3 showCollection:(id)a4
{
  -[ActionCoordinator viewController:showCollection:completion:](self, "viewController:showCollection:completion:", a3, a4, 0);
}

- (void)viewController:(id)a3 showCollection:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  CollectionViewController *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  id WeakRetained;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SearchViewController *v24;

  v24 = (SearchViewController *)a3;
  v7 = a4;
  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  if (objc_msgSend(v7, "handlerType") == (id)1)
  {
    -[ActionCoordinator viewController:createNewCollectionWithSession:](self, "viewController:createNewCollectionWithSession:", v24, 0);
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "handlerType") == (id)4)
  {
    v8 = objc_opt_class(CuratedCollectionHandler);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = (CollectionViewController *)v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController curatedCollectionIdentifier](v9, "curatedCollectionIdentifier"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionViewController curatedCollectionIdentifier](v9, "curatedCollectionIdentifier"));
        -[ActionCoordinator viewController:showCuratedCollectionIdentifier:](self, "viewController:showCuratedCollectionIdentifier:", v24, v11);

      }
LABEL_21:

      goto LABEL_22;
    }
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
    || (v12 = objc_loadWeakRetained((id *)&self->_containerViewController),
        v13 = sub_1002A8AA0(v12),
        v12,
        v13 != 5))
  {
    v9 = -[CollectionViewController initWithCollection:]([CollectionViewController alloc], "initWithCollection:", v7);
    -[ContaineeViewController setContaineeDelegate:](v9, "setContaineeDelegate:", self);
    -[ControlContaineeViewController setDelegate:](v9, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:", v9, 1);

    v19 = objc_msgSend(v7, "showAction");
    if (self->_searchModeViewController == v24)
    {
      LODWORD(v21) = 8;
    }
    else
    {
      v20 = objc_opt_class(CollectionListViewController);
      if ((objc_opt_isKindOfClass(v24, v20) & 1) != 0)
        LODWORD(v21) = 251;
      else
        LODWORD(v21) = 201;
    }
    if (objc_msgSend(v7, "handlerType") == (id)3)
      v21 = 256;
    else
      v21 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "bucketedNumberOfItems")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v22));

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v19, v21, v23);
    goto LABEL_21;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentViewController"));
  v16 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v15, v16);

  if ((isKindOfClass & 1) != 0)
  {
    -[ActionCoordinator dismissPlaceCardViewController:](self, "dismissPlaceCardViewController:", self->_placeCardViewController);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2067, 201, 0);
  }
  -[SearchViewController showCollection:](self->_searchModeViewController, "showCollection:", v7);
LABEL_22:

}

- (void)viewController:(id)a3 editCollection:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));
  v7 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
    -[ActionCoordinator dismissPlaceCardViewController:](self, "dismissPlaceCardViewController:", self->_placeCardViewController);
  -[SearchViewController editCollection:](self->_searchModeViewController, "editCollection:", v9);

}

- (void)viewController:(id)a3 addItemsFromACToCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CollectionAddViewController *v8;
  id WeakRetained;
  id v10;

  v5 = a4;
  if (v5)
  {
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertControllerForAttemptedAddCollection"));

    if (v7)
    {
      v8 = (CollectionAddViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[CollectionAddViewController chromeViewController](v8, "chromeViewController"));
      objc_msgSend(WeakRetained, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);
    }
    else
    {
      v8 = -[AddFromACViewController initWithNibName:bundle:]([CollectionAddViewController alloc], "initWithNibName:bundle:", 0, 0);
      -[ContaineeViewController setContaineeDelegate:](v8, "setContaineeDelegate:", self);
      -[ControlContaineeViewController setDelegate:](v8, "setDelegate:", self);
      -[CollectionAddViewController setEditSession:](v8, "setEditSession:", v10);
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(WeakRetained, "presentController:animated:", v8, 1);
    }

    v5 = v10;
  }

}

- (void)viewControllerShowAddItemsFromACToLibraryView:(id)a3
{
  void *v4;
  _TtC4Maps38LibraryAddCollectionItemViewController *v5;
  id WeakRetained;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertControllerForAttemptedAddCollection"));

  if (v7)
  {
    v5 = (_TtC4Maps38LibraryAddCollectionItemViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[LibraryAddCollectionItemViewController chromeViewController](v5, "chromeViewController"));
    objc_msgSend(WeakRetained, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    v5 = -[LibraryAddCollectionItemViewController initWithNibName:bundle:]([_TtC4Maps38LibraryAddCollectionItemViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", self);
    -[ControlContaineeViewController setDelegate:](v5, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:", v5, 1);
  }

}

- (void)viewController:(id)a3 pickCollectionWithSession:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  CollectionPicker *v16;
  CollectionPicker *collectionPicker;
  CollectionPicker *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = -[CollectionPicker initWithCollectionEditSession:sourceView:sourceRect:]([CollectionPicker alloc], "initWithCollectionEditSession:sourceView:sourceRect:", v14, v15, x, y, width, height);
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = v16;

  -[CollectionPicker setDelegate:](self->_collectionPicker, "setDelegate:", self);
  objc_initWeak(&location, self);
  v18 = self->_collectionPicker;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1005A5860;
  v22[3] = &unk_1011BC2E8;
  objc_copyWeak(&v24, &location);
  v19 = v13;
  v23 = v19;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005A58B4;
  v20[3] = &unk_1011BC310;
  objc_copyWeak(&v21, &location);
  -[CollectionPicker viewControllerToPresentIfContainee:ifAlertController:](v18, "viewControllerToPresentIfContainee:ifAlertController:", v22, v20);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)viewController:(id)a3 createNewCollectionWithSession:(id)a4
{
  SearchViewController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char isKindOfClass;
  unsigned int v18;
  CollectionCreateViewController *v19;
  id collectionCreateVCDidDismissHandler;
  id v21;
  uint64_t v22;
  char v23;
  void *v24;
  _QWORD *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;

  v6 = (SearchViewController *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertControllerForAttemptedAddCollection"));

  if (!v9)
  {
    if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      v13 = sub_1002A8AA0(WeakRetained);

      if (v13 == 5)
      {
        -[ActionCoordinator viewController:addItemsFromACToCollection:](self, "viewController:addItemsFromACToCollection:", v6, v7);
        goto LABEL_22;
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
    if (objc_msgSend(v14, "handlerType") == (id)3)
    {
      v15 = 256;
    }
    else if (self->_searchModeViewController == v6)
    {
      v15 = 8;
    }
    else
    {
      v16 = objc_opt_class(CollectionListViewController);
      isKindOfClass = objc_opt_isKindOfClass(v6, v16);
      if (v6)
        v18 = 0;
      else
        v18 = 201;
      if ((isKindOfClass & 1) != 0)
        v15 = 251;
      else
        v15 = v18;
    }

    v19 = -[CollectionCreateViewController initWithEditSession:]([CollectionCreateViewController alloc], "initWithEditSession:", v7);
    -[ContaineeViewController setContaineeDelegate:](v19, "setContaineeDelegate:", self);
    -[CollectionCreateViewController setTarget:](v19, "setTarget:", v15);
    collectionCreateVCDidDismissHandler = self->_collectionCreateVCDidDismissHandler;
    self->_collectionCreateVCDidDismissHandler = 0;

    v21 = objc_loadWeakRetained((id *)&self->_containerViewController);
    if (sub_1002A8AA0(v21) == 5)
    {
      v22 = objc_opt_class(PlaceCardViewController);
      v23 = objc_opt_isKindOfClass(v6, v22);

      if ((v23 & 1) == 0)
      {
LABEL_21:
        v27 = objc_loadWeakRetained((id *)&self->_containerViewController);
        objc_msgSend(v27, "presentController:animated:", v19, 1);

        goto LABEL_22;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController placeCardItem](v6, "placeCardItem"));
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mapItem"));

      if (v21)
      {
        objc_initWeak(&location, self);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1005A5BC4;
        v28[3] = &unk_1011AD1E8;
        objc_copyWeak(&v30, &location);
        v29 = v21;
        v25 = objc_retainBlock(v28);
        v26 = self->_collectionCreateVCDidDismissHandler;
        self->_collectionCreateVCDidDismissHandler = v25;

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
    }

    goto LABEL_21;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
  objc_msgSend(v11, "_maps_topMostPresentViewController:animated:completion:", v9, 1, 0);

LABEL_22:
}

- (void)viewController:(id)a3 confirmDeleteCollections:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  -[ActionCoordinator confirmDeleteCollections:sourceView:sourceRect:completion:](self, "confirmDeleteCollections:sourceView:sourceRect:completion:", a4, a5, a7, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (void)viewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6
{
  id WeakRetained;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIViewController _maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:](UIViewController, "_maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:", a4, a5, a6));
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0);

}

- (void)viewController:(id)a3 editCollection:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  MacCollectionEditCoordinator *collectionEditCoordinator;
  id WeakRetained;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  MacCollectionEditCoordinator *v30;
  id v31;
  void *v32;
  id v33;
  MacCollectionEditCoordinator *v34;
  MacCollectionEditCoordinator *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  collectionEditCoordinator = self->_collectionEditCoordinator;
  if (collectionEditCoordinator)
    -[MacCollectionEditCoordinator dismiss](collectionEditCoordinator, "dismiss");
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v21, "convertRect:fromView:", v17, x, y, width, height);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  objc_initWeak(&location, self);
  v30 = [MacCollectionEditCoordinator alloc];
  v31 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1005A5E98;
  v36[3] = &unk_1011B0520;
  objc_copyWeak(&v38, &location);
  v33 = v18;
  v37 = v33;
  v34 = -[MacCollectionEditCoordinator initWithCollection:presentingViewController:sourceView:sourceRect:completion:](v30, "initWithCollection:presentingViewController:sourceView:sourceRect:completion:", v16, v31, v32, v36, v23, v25, v27, v29);
  v35 = self->_collectionEditCoordinator;
  self->_collectionEditCoordinator = v34;

  -[MacCollectionEditCoordinator present](self->_collectionEditCoordinator, "present");
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

- (void)viewController:(id)a3 presentCollectionPickerContaineeViewController:(id)a4
{
  id v5;
  id WeakRetained;

  v5 = a4;
  objc_msgSend(v5, "setContaineeDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:completion:", v5, 1, 0);

}

- (void)collectionPickerClosed:(id)a3
{
  CollectionPicker *collectionPicker;

  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;

}

- (void)collectionPickerNewCollection:(id)a3
{
  CollectionPicker *collectionPicker;
  id v5;
  id v6;

  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;
  v5 = a3;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editSession"));
  -[ActionCoordinator viewController:createNewCollectionWithSession:](self, "viewController:createNewCollectionWithSession:", 0, v6);

}

- (void)viewController:(id)a3 showCuratedCollection:(id)a4
{
  -[ActionCoordinator viewController:showCuratedCollection:replaceViewController:completion:](self, "viewController:showCuratedCollection:replaceViewController:completion:", a3, a4, 0, 0);
}

- (void)viewController:(id)a3 showCuratedCollection:(id)a4 replaceViewController:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc((Class)MKMapItemIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionIdentifier"));

  v15 = objc_msgSend(v13, "initWithGEOMapItemIdentifier:", v14);
  -[ActionCoordinator viewController:showCuratedCollectionIdentifier:replaceViewController:completion:](self, "viewController:showCuratedCollectionIdentifier:replaceViewController:completion:", v12, v15, v6, v10);

}

- (void)viewController:(id)a3 showCuratedCollectionIdentifier:(id)a4
{
  -[ActionCoordinator viewController:showCuratedCollectionIdentifier:replaceViewController:completion:](self, "viewController:showCuratedCollectionIdentifier:replaceViewController:completion:", a3, a4, 0, 0);
}

- (void)viewController:(id)a3 showCuratedCollectionIdentifier:(id)a4 replaceViewController:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  CuratedCollectionViewController *v11;
  void *v12;
  CuratedCollectionViewController *curatedCollectionsVC;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = -[CuratedCollectionViewController initWithCuratedCollectionIdentifier:]([CuratedCollectionViewController alloc], "initWithCuratedCollectionIdentifier:", v10);

  -[ActionCoordinator showCuratedCollectionViewController:replaceViewController:completion:](self, "showCuratedCollectionViewController:replaceViewController:completion:", v11, v6, v9);
  if (self->_curatedCollectionsVC)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v12, "removeControllerFromStack:", self->_curatedCollectionsVC);

    curatedCollectionsVC = self->_curatedCollectionsVC;
  }
  else
  {
    curatedCollectionsVC = 0;
  }
  self->_curatedCollectionsVC = v11;

}

- (void)viewController:(id)a3 showFullyClientizedCuratedCollection:(id)a4 replaceViewController:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  CuratedCollectionViewController *v8;
  void *v9;
  CuratedCollectionViewController *curatedCollectionsVC;

  v5 = a5;
  v7 = a4;
  v8 = -[CuratedCollectionViewController initWithFullyClientizedPlaceCollection:]([CuratedCollectionViewController alloc], "initWithFullyClientizedPlaceCollection:", v7);

  -[ActionCoordinator showCuratedCollectionViewController:replaceViewController:completion:](self, "showCuratedCollectionViewController:replaceViewController:completion:", v8, v5, 0);
  if (self->_curatedCollectionsVC)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v9, "removeControllerFromStack:", self->_curatedCollectionsVC);

    curatedCollectionsVC = self->_curatedCollectionsVC;
  }
  else
  {
    curatedCollectionsVC = 0;
  }
  self->_curatedCollectionsVC = v8;

}

- (void)showCuratedCollectionViewController:(id)a3 replaceViewController:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  id WeakRetained;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "setContaineeDelegate:", self);
  objc_msgSend(v8, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v11 = WeakRetained;
  if (v6)
  {
    objc_msgSend(WeakRetained, "replaceCurrentWithController:", v8);

    if (v9)
      v9[2](v9);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1005A62CC;
    v12[3] = &unk_1011B1B90;
    v13 = v9;
    objc_msgSend(v11, "presentController:animated:completion:", v8, 1, v12);

  }
}

- (void)viewController:(id)a3 showCuratedCollectionsList:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CuratedCollectionsListViewController *v15;
  GEOMapServiceTraits *v16;
  CuratedCollectionsListViewController *v17;
  id WeakRetained;
  CuratedCollectionsListViewController *v19;
  id v20;
  void *v21;
  CuratedCollectionsListViewController *collectionsListVC;
  CuratedCollectionsListViewController *v23;
  void **v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, int);
  void *v27;
  CuratedCollectionsListViewController *v28;
  id v29;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = [CuratedCollectionsListViewController alloc];
  v16 = -[ActionCoordinator newTraits](self, "newTraits");
  v17 = -[CuratedCollectionsListViewController initWithCuratedCollections:usingTitle:usingCollectionIds:withTraits:](v15, "initWithCuratedCollections:usingTitle:usingCollectionIds:withTraits:", v14, v13, v12, v16);

  -[ContaineeViewController setContaineeDelegate:](v17, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v17, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_1005A6464;
  v27 = &unk_1011B1EB0;
  v19 = v17;
  v28 = v19;
  v20 = v11;
  v29 = v20;
  objc_msgSend(WeakRetained, "presentController:animated:completion:", v19, 1, &v24);

  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController", v24, v25, v26, v27, v28));
    objc_msgSend(v21, "removeControllerFromStack:", self->_collectionsListVC);

  }
  collectionsListVC = self->_collectionsListVC;
  self->_collectionsListVC = v19;
  v23 = v19;

}

- (void)viewControllerShowPublisher:(id)a3
{
  -[ActionCoordinator viewControllerShowPublisher:replaceViewController:](self, "viewControllerShowPublisher:replaceViewController:", a3, 0);
}

- (void)viewControllerShowPublisher:(id)a3 replaceViewController:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)MKMapItemIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = objc_msgSend(v7, "initWithGEOMapItemIdentifier:", v8);

  v9 = objc_msgSend(v6, "totalCollectionCount");
  -[ActionCoordinator viewControllerShowPublisherWithID:numberOfCollections:replaceViewController:](self, "viewControllerShowPublisherWithID:numberOfCollections:replaceViewController:", v10, v9, v4);

}

- (void)viewController:(id)a3 showGuidesHome:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  GuidesHomeViewController *guideHomeVC;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_opt_class(CitySelectorViewController);
  if ((objc_opt_isKindOfClass(v13, v7) & 1) == 0 || !self->_citySelectorVC)
  {
    v12 = objc_opt_class(GuidesHomeViewController);
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
    {
      guideHomeVC = self->_guideHomeVC;
      if (guideHomeVC)
        goto LABEL_7;
    }
LABEL_8:
    -[ActionCoordinator presentGuidesHomeWithGuideLocation:](self, "presentGuidesHomeWithGuideLocation:", v6);
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v8, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", self->_citySelectorVC, 1, 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v10 = objc_msgSend(v9, "controllerIsInStack:", self->_guideHomeVC);

  if (!v10)
    goto LABEL_8;
  guideHomeVC = self->_guideHomeVC;
LABEL_7:
  -[GuidesHomeViewController setGuideLocation:](guideHomeVC, "setGuideLocation:", v6);
LABEL_9:

}

- (void)viewControllerShowPublisherWithID:(id)a3
{
  -[ActionCoordinator viewControllerShowPublisherWithID:numberOfCollections:replaceViewController:](self, "viewControllerShowPublisherWithID:numberOfCollections:replaceViewController:", a3, 0, 0);
}

- (void)viewControllerShowPublisherWithID:(id)a3 numberOfCollections:(unint64_t)a4 replaceViewController:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  PublisherViewController *v9;
  GEOMapServiceTraits *v10;
  PublisherViewController *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  PublisherViewController *publisherVC;

  v5 = a5;
  v8 = a3;
  v9 = [PublisherViewController alloc];
  v10 = -[ActionCoordinator newTraits](self, "newTraits");
  v11 = -[PublisherViewController initWithPublisherId:numberOfCollections:withTraits:](v9, "initWithPublisherId:numberOfCollections:withTraits:", v8, a4, v10);

  -[ContaineeViewController setContaineeDelegate:](v11, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v11, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v13 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "replaceCurrentWithController:", v11);
  else
    objc_msgSend(WeakRetained, "presentController:animated:", v11, 1);

  if (self->_publisherVC)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v14, "removeControllerFromStack:", self->_publisherVC);

    publisherVC = self->_publisherVC;
  }
  else
  {
    publisherVC = 0;
  }
  self->_publisherVC = v11;

}

- (void)viewControllerShowAllCollections
{
  AllCollectionsViewController *v3;
  GEOMapServiceTraits *v4;
  id WeakRetained;
  void *v6;
  AllCollectionsViewController *allCollectionsVC;

  v3 = objc_alloc_init(AllCollectionsViewController);
  v4 = -[ActionCoordinator newTraits](self, "newTraits");
  -[AllCollectionsViewController setTraits:](v3, "setTraits:", v4);

  -[ContaineeViewController setContaineeDelegate:](v3, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v3, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v3, 1);

  if (self->_allCollectionsVC)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "removeControllerFromStack:", self->_allCollectionsVC);

    allCollectionsVC = self->_allCollectionsVC;
  }
  else
  {
    allCollectionsVC = 0;
  }
  self->_allCollectionsVC = v3;

}

- (void)viewControllerShowCitySelectorFromGuideLocation:(id)a3
{
  id v4;
  CitySelectorViewController *v5;
  GEOMapServiceTraits *v6;
  id WeakRetained;
  void *v8;
  CitySelectorViewController *citySelectorVC;

  v4 = a3;
  v5 = -[CitySelectorViewController initWithSourceGuideLocation:]([CitySelectorViewController alloc], "initWithSourceGuideLocation:", v4);

  v6 = -[ActionCoordinator newTraits](self, "newTraits");
  -[CitySelectorViewController setTraits:](v5, "setTraits:", v6);

  -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v5, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:", v5, 1);

  if (self->_citySelectorVC)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v8, "removeControllerFromStack:", self->_citySelectorVC);

    citySelectorVC = self->_citySelectorVC;
  }
  else
  {
    citySelectorVC = 0;
  }
  self->_citySelectorVC = v5;

}

- (void)viewControllerShowPhotoThumbnailGalleryWithMapItem:(id)a3 albumIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_captionedPhotoAlbums"));
  v9 = objc_msgSend(v8, "count");

  if ((unint64_t)v9 < 2)
    v10 = objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:withStartingIndex:](UGCPOIEnrichmentCoordinator, "photoThumbnailGalleryCoordinatorWithMapItem:withStartingIndex:", v6, 0));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:albumIndex:](UGCPOIEnrichmentCoordinator, "photoThumbnailGalleryCoordinatorWithMapItem:albumIndex:", v6, a4));
  v12 = (id)v10;

  objc_msgSend(v12, "setDelegate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v12, "setPresentingViewController:", v11);

  objc_msgSend(v12, "setPlaceCardDismissalDelegate:", self);
  objc_msgSend(v12, "setPresentationContext:", 1);
  -[ActionCoordinator viewControllerPresentPOIEnrichmentWithCoordinator:](self, "viewControllerPresentPOIEnrichmentWithCoordinator:", v12);

}

- (void)viewControllerShowOfflineMaps:(id)a3
{
  -[ActionCoordinator _viewControllerShowOfflineMaps:completionHandler:](self, "_viewControllerShowOfflineMaps:completionHandler:", a3, 0);
}

- (void)viewControllerShowExpiredOfflineMaps:(id)a3
{
  -[ActionCoordinator _viewControllerShowOfflineMaps:completionHandler:](self, "_viewControllerShowOfflineMaps:completionHandler:", a3, &stru_1011BC350);
}

- (void)_viewControllerShowOfflineMaps:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  OfflineMapsManagementContext *v17;
  void *v18;
  void *v19;
  OfflineMapsManagementContext *v20;
  _QWORD v21[4];
  OfflineMapsManagementContext *v22;
  void (**v23)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertControllerForAttemptedDataManagementDisplay"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "_maps_topMostPresentViewController:animated:completion:", v7, 1, 0);

    if (v5)
      v5[2](v5, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topContext"));
    v12 = objc_opt_class(OfflineMapsManagementContext);
    isKindOfClass = objc_opt_isKindOfClass(v11, v12);

    if ((isKindOfClass & 1) != 0)
    {
      if (v5)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chromeViewController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topContext"));
        ((void (**)(id, void *))v5)[2](v5, v16);

      }
    }
    else
    {
      v17 = objc_alloc_init(OfflineMapsManagementContext);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "chromeViewController"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1005A6BB8;
      v21[3] = &unk_1011ACAD0;
      v22 = v17;
      v23 = v5;
      v20 = v17;
      objc_msgSend(v19, "pushContext:animated:completion:", v20, 1, v21);

    }
  }

}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5
{
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:", a3, a4, a5, 0);
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 dismissalBlock:(id)a6
{
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:", a3, a4, a5, 0, a6, 0);
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldUseSessionlessAnalytics:(BOOL)a6
{
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:", a3, a4, a5, a6, 0, 0);
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 route:(id)a6 shouldUseSessionlessAnalytics:(BOOL)a7 shouldShowDataManagementAfterDownload:(BOOL)a8 shouldShowDataManagementAfterDownloadIfRegionDiffers:(BOOL)a9 dismissalBlock:(id)a10
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  BOOL v30;
  id location;

  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a10;
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1005A6D74;
  v24[3] = &unk_1011BC378;
  objc_copyWeak(&v28, &location);
  v21 = v20;
  v27 = v21;
  v29 = a8;
  v30 = a9;
  v22 = v17;
  v25 = v22;
  v23 = v16;
  v26 = v23;
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:", v23, v22, v18, v19, v11, v24, 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 shouldUseSessionlessAnalytics:(BOOL)a6 dismissalBlock:(id)a7 postDismissalBlock:(id)a8
{
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:dismissalBlock:postDismissalBlock:", a3, a4, a5, 0, a6, a7, a8);
}

- (void)viewController:(id)a3 showOfflineMapRegionSelectorForRegion:(id)a4 name:(id)a5 route:(id)a6 shouldUseSessionlessAnalytics:(BOOL)a7 dismissalBlock:(id)a8 postDismissalBlock:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char isKindOfClass;
  OfflineRegionSelectorContext *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  _BOOL4 v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;

  v34 = a7;
  v14 = a3;
  v15 = a4;
  v35 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  if (GEOSupportsOfflineMaps(v18, v19))
  {
    v20 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "alertControllerForAttemptedRegionDownload"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "chromeViewController"));
    v25 = v24;
    if (v22)
    {
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1005A7120;
      v36[3] = &unk_1011BA170;
      v37 = v17;
      v38 = v18;
      objc_msgSend(v25, "_maps_topMostPresentViewController:animated:completion:", v22, 1, v36);

      v14 = v20;
    }
    else
    {
      v33 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topContext"));
      v27 = objc_opt_class(OfflineRegionSelectorContext);
      isKindOfClass = objc_opt_isKindOfClass(v26, v27);

      v15 = v33;
      v14 = v20;
      if ((isKindOfClass & 1) == 0)
      {
        v29 = -[OfflineRegionSelectorContext initWithRegion:name:]([OfflineRegionSelectorContext alloc], "initWithRegion:name:", v33, v35);
        -[OfflineRegionSelectorContext setShouldUseSessionlessAnalytics:](v29, "setShouldUseSessionlessAnalytics:", v34);
        -[OfflineRegionSelectorContext setRoute:](v29, "setRoute:", v16);
        -[OfflineRegionSelectorContext setDismissalBlock:](v29, "setDismissalBlock:", v17);
        -[OfflineRegionSelectorContext setPostDismissalBlock:](v29, "setPostDismissalBlock:", v18);
        v30 = objc_opt_class(SearchViewController);
        if ((objc_opt_isKindOfClass(v20, v30) & 1) != 0)
          -[OfflineRegionSelectorContext setDownloadDelegate:](v29, "setDownloadDelegate:", v20);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "chromeViewController"));
        objc_msgSend(v32, "pushContext:animated:completion:", v29, 1, 0);

        v15 = v33;
      }
    }

  }
}

- (void)viewController:(id)a3 presentParentMapItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  SearchResult *v8;
  void *v9;
  void *v10;
  void *v11;
  SearchResult *v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_venueInfo"));

  if (v6)
  {
    -[ActionCoordinator viewController:selectMapItem:address:addToHistory:source:](self, "viewController:selectMapItem:address:addToHistory:source:", 0, v5, 0, 1, 4);
LABEL_5:
    v8 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v5);
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v11, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:completion:", v10, 1, v8, 1, 0);

    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "_hasHikeInfo"))
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v7, "enterRouteCreationWithMapItem:completion:", v5, 0);

LABEL_6:
}

- (void)viewController:(id)a3 presentPlacesForMapItem:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PlacesSearchCardItem *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PlacesSearchCardItem initWithMapItem:searchCategory:]([PlacesSearchCardItem alloc], "initWithMapItem:searchCategory:", v11, v10);

  -[ActionCoordinator viewController:presentPlacesWithPlacesCardItem:source:](self, "viewController:presentPlacesWithPlacesCardItem:source:", v12, v13, a6);
}

- (void)viewController:(id)a3 presentRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  VenueSearchCardItem *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  SearchResult *v28;
  SimilarResultsViewController *v29;
  void *v30;
  SimilarResultsViewController *v31;
  id WeakRetained;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (sub_1002A8AA0(v12) == 5
    && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_venueInfo")),
        v18 = objc_msgSend(v17, "venueFeatureType"),
        v17,
        v18 == 1))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_browseCategories"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

    v21 = -[VenueSearchCardItem initWithMapItem:searchCategory:]([VenueSearchCardItem alloc], "initWithMapItem:searchCategory:", v15, v20);
    -[ActionCoordinator viewController:presentVenueWithVenueCardItem:source:](self, "viewController:presentVenueWithVenueCardItem:source:", v12, v21, 4);

  }
  else
  {
    v35 = v14;
    v36 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v23 = v13;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v28 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i));
          if (v28)
            objc_msgSend(v22, "addObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v25);
    }

    v29 = [SimilarResultsViewController alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
    v31 = -[SimpleResultsViewController initWithShareDelegate:](v29, "initWithShareDelegate:", v30);

    -[SimpleResultsViewController setResultsDelegate:](v31, "setResultsDelegate:", self);
    -[SimpleResultsViewController setCoordinator:](v31, "setCoordinator:", self);
    -[ContaineeViewController setContaineeDelegate:](v31, "setContaineeDelegate:", self);
    -[SimpleResultsViewController setEnableQuickActionMenu:](v31, "setEnableQuickActionMenu:", 1);
    v14 = v35;
    -[SimilarResultsViewController setHeaderTitle:](v31, "setHeaderTitle:", v35);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:", v31);

    -[SimpleResultsViewController setSearchResults:](v31, "setSearchResults:", v22);
    -[SimilarResultsViewController setOriginalMapItem:](v31, "setOriginalMapItem:", v15);
    -[SimilarResultsViewController setAnalyticsDelegate:](v31, "setAnalyticsDelegate:", v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v22));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v34, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:completion:", v33, 1, 0, 1, 0);

    v12 = v36;
  }

}

- (void)viewController:(id)a3 showFavoritesType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionForFavoritesType:", a4));

  if (v8)
    -[ActionCoordinator viewController:showCollection:](self, "viewController:showCollection:", v6, v8);
  else
    -[ActionCoordinator viewControllerShowCollections:](self, "viewControllerShowCollections:", v6);

}

- (void)viewController:(id)a3 showCollectionWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionWithIdentifier:", v6));

  if (v9)
    -[ActionCoordinator viewController:showCollection:](self, "viewController:showCollection:", v7, v9);
  else
    -[ActionCoordinator viewControllerShowCollections:](self, "viewControllerShowCollections:", v7);

}

- (void)viewController:(id)a3 displayTableBookingFor:(id)a4
{
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v6 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeCardItem"));
  v10 = objc_msgSend(v12, "isEqual:", v9);

  if (!v10)
  {

LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardViewController](self, "placeCardViewController"));
    objc_msgSend(v8, "resetState");
    objc_msgSend(v8, "setPlaceCardItem:withHistory:", v12, 1);
    objc_msgSend(v8, "setShouldPresentSecondaryActionWhenReady:", 1);
    -[ActionCoordinator presentPlaceCard:](self, "presentPlaceCard:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
    objc_msgSend(v11, "setNeedsUserActivityUpdate");

    goto LABEL_6;
  }
  objc_msgSend(v8, "setShouldPresentSecondaryActionWhenReady:", 1);
LABEL_6:

}

- (void)viewController:(id)a3 selectParkedCar:(id)a4 andPerformAction:(int64_t)a5
{
  -[ActionCoordinator viewController:selectParkedCar:andPerformAction:selectPOIOnMap:](self, "viewController:selectParkedCar:andPerformAction:selectPOIOnMap:", a3, a4, a5, 0);
}

- (void)viewController:(id)a3 selectParkedCar:(id)a4 andPerformAction:(int64_t)a5 selectPOIOnMap:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  ParkedCarInfoCardViewController *parkedCarViewController;
  ParkedCarInfoCardViewController *v12;
  ParkedCarInfoCardViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  id WeakRetained;
  void *v19;
  ParkedCarInfoCardViewController *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  BOOL v44;
  CLLocationDistance v45;
  CLLocationDistance v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  CLLocationCoordinate2D v69;
  CGPoint v70;
  CGRect v71;
  MKCoordinateRegion v72;

  v6 = a6;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  objc_msgSend(v10, "informCoreRoutineOfEngagementWithParkedCar:", v9);

  parkedCarViewController = self->_parkedCarViewController;
  if (!parkedCarViewController)
  {
    v12 = objc_alloc_init(ParkedCarInfoCardViewController);
    v13 = self->_parkedCarViewController;
    self->_parkedCarViewController = v12;

    -[InfoCardViewController setContaineeDelegate:](self->_parkedCarViewController, "setContaineeDelegate:", self);
    parkedCarViewController = self->_parkedCarViewController;
  }
  -[ParkedCarInfoCardViewController setParkedCar:](parkedCarViewController, "setParkedCar:", v9);
  -[ParkedCarInfoCardViewController setDelegate:](self->_parkedCarViewController, "setDelegate:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentViewController"));
  v16 = objc_opt_class(ResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v15, v16);

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v19 = WeakRetained;
  v20 = self->_parkedCarViewController;
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(WeakRetained, "replaceCurrentWithController:moveToContaineeLayout:", v20, 2);
  else
    objc_msgSend(WeakRetained, "presentController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v9, "coordinate");
  v23 = v22;
  v25 = v24;
  objc_msgSend(v21, "convertCoordinate:toPointToView:", v21);
  v27 = v26;
  v29 = v28;
  objc_msgSend(v21, "bounds");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(v21, "_edgeInsets");
  v39 = v33 + v38;
  v42 = v35 - (v40 + v41);
  v71.size.height = v37 - (v38 + v43);
  v71.origin.x = v31 + v40;
  v71.origin.y = v39;
  v71.size.width = v42;
  v70.x = v27;
  v70.y = v29;
  v44 = CGRectContainsPoint(v71, v70);
  objc_msgSend(v9, "horizontalAccuracy");
  v45 = 1000.0;
  v46 = 1000.0;
  if (v47 > 1000.0)
  {
    objc_msgSend(v9, "horizontalAccuracy");
    v46 = v48;
  }
  objc_msgSend(v9, "horizontalAccuracy");
  if (v49 > 1000.0)
  {
    objc_msgSend(v9, "horizontalAccuracy");
    v45 = v50;
  }
  v69.latitude = v23;
  v69.longitude = v25;
  v72 = MKCoordinateRegionMakeWithDistance(v69, v46, v45);
  objc_msgSend(v21, "mapRectThatFits:", MKMapRectForCoordinateRegion((__n128)v72.center, *(__n128 *)&v72.center.longitude, (__n128)v72.span, *(__n128 *)&v72.span.longitudeDelta));
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  objc_msgSend(v21, "visibleMapRect");
  if (v59 <= v56)
    v61 = v56;
  else
    v61 = v59;
  if (v60 >= v58)
    v62 = v58;
  else
    v62 = v60;
  v63 = v61 / v62;
  if (v63 <= 4.0 && v44)
  {
LABEL_23:
    if (!v6)
      goto LABEL_25;
LABEL_24:
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "customPOIsController"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCar personalizedItemKey](ParkedCar, "personalizedItemKey"));
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1005A7C04;
    v68[3] = &unk_1011BC3A0;
    v68[4] = self;
    objc_msgSend(v66, "customFeatureForKey:completion:", v67, v68);

    goto LABEL_25;
  }
  if (v63 <= 4.0)
  {
    objc_msgSend(v21, "setCenterCoordinate:animated:", 1, v23, v25);
    goto LABEL_23;
  }
  objc_msgSend(v21, "setVisibleMapRect:animated:", 1, v52, v54, v56, v58);
  if (v6)
    goto LABEL_24;
LABEL_25:
  -[ParkedCarInfoCardViewController performAction:](self->_parkedCarViewController, "performAction:", a5);

}

- (void)viewController:(id)a3 selectDroppedPin:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "type") == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v8, "selectSearchResult:animated:", v7, 1);

  }
}

- (void)viewController:(id)a3 editLocationForParkedCar:(id)a4
{
  -[ActionCoordinator viewController:selectParkedCar:andPerformAction:](self, "viewController:selectParkedCar:andPerformAction:", a3, a4, 3);
}

- (void)viewController:(id)a3 removeMapsSuggestionsEntry:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 startBlock:(id)a7 completionBlock:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t Log;
  NSObject *v29;
  id WeakRetained;
  void *v31;
  _BOOL8 v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  ActionCoordinator *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD *v50;
  _QWORD *v51;
  id v52;
  uint8_t buf[16];
  _QWORD v54[5];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1005A8120;
  v56[3] = &unk_1011BC418;
  v22 = v20;
  v58 = v22;
  v23 = v18;
  v57 = v23;
  v24 = v21;
  v59 = v24;
  v25 = objc_retainBlock(v56);
  v26 = objc_msgSend(v23, "availableRemovalBehaviors");
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = sub_1005A83A0;
  v54[4] = sub_1005A83B0;
  v55 = 0;
  v27 = 0;
  switch((unint64_t)v26)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 2uLL:
      goto LABEL_3;
    case 4uLL:
    case 8uLL:
      v27 = 1;
LABEL_3:
      ((void (*)(_QWORD *, id, uint64_t))v25[2])(v25, v26, v27);
      break;
    default:
      v42 = v17;
      Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "ActionCoordinator");
      v29 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "More than 1 removalBehavior present. Showing Action Sheet", buf, 2u);
      }

      v44 = self;
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
      v32 = objc_msgSend(v31, "userInterfaceIdiom") == (id)5;

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, v32));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1005A83B8;
      v47[3] = &unk_1011BC468;
      v51 = v54;
      v52 = v26;
      v48 = v23;
      v34 = v33;
      v49 = v34;
      v50 = v25;
      MapsSuggestionsRemovalBehaviorEnumerate(v47);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1005A86F8;
      v45[3] = &unk_1011AD960;
      v46 = v24;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v36, 1, v45));
      objc_msgSend(v34, "addAction:", v37);

      if (v19)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "popoverPresentationController"));
        objc_msgSend(v38, "setSourceView:", v19);

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "popoverPresentationController"));
        objc_msgSend(v39, "setSourceRect:", x, y, width, height);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "popoverPresentationController"));
        objc_msgSend(v40, "setPermittedArrowDirections:", 12);

      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](v44, "containerViewController", v42));
      objc_msgSend(v41, "_maps_topMostPresentViewController:animated:completion:", v34, 1, 0);

      v17 = v43;
      break;
  }
  _Block_object_dispose(v54, 8);

}

- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4
{
  RouteIncidentsViewController *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  RouteIncidentsViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  RouteIncidentsViewController *v20;
  uint64_t v21;
  RouteIncidentsViewController *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD block[5];

  v6 = (RouteIncidentsViewController *)a3;
  v7 = a4;
  if (self->_incidentsVC == v6
    || (RouteIncidentsViewController *)self->_routeStepsVC == v6
    || (v8 = objc_opt_class(RoutePlanningRoutingAppsController), (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
  {
LABEL_4:
    -[ActionCoordinator closeRoutePlanningViewController:withSender:](self, "closeRoutePlanningViewController:withSender:", v6, v7);
    goto LABEL_5;
  }
  v9 = objc_opt_class(UIKeyCommand);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
LABEL_9:
    if ((RouteIncidentsViewController *)self->_placeCardViewController == v6
      || (RouteIncidentsViewController *)self->_placeCardForRoutePlanningViewController == v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
      objc_msgSend(v13, "clearLinkedPlacesAndPolygon");

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
      objc_msgSend(v14, "resetConfiguration");

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
      objc_msgSend(v15, "cancelFetchingPlaceEnrichment");

    }
    if ((RouteIncidentsViewController *)self->_lineCardViewController != v6)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self->_lineSelectionAction, "disambiguationVC"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineSelectionActionController disambiguationVC](self->_lineSelectionAction, "disambiguationVC"));
        objc_msgSend(v17, "removeControllerFromStack:", v18);

      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v20 = (RouteIncidentsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topViewController"));

    if (v20 == v6)
    {
      -[ActionCoordinator closeVenueViewController:](self, "closeVenueViewController:", v6);
      goto LABEL_5;
    }
    if ((RouteIncidentsViewController *)self->_placeCardViewController == v6)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v23, "userInterfaceIdiom") == (id)5)
      {

      }
      else
      {
        v26 = -[SearchSessionManager singleResultMode](self->_searchSessionManager, "singleResultMode");

        if (v26)
          -[ActionCoordinator clearSearch](self, "clearSearch");
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v27, "userInterfaceIdiom") == (id)5)
      {

      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
        v29 = objc_msgSend(v28, "isSingleResultToShowAsPlacecard");

        if (v29)
          -[ActionCoordinator clearSearch](self, "clearSearch");
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "chromeViewController"));
      objc_msgSend(v31, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

    }
    else
    {
      if ((RouteIncidentsViewController *)self->_placeCardForRoutePlanningViewController == v6)
      {
        -[ActionCoordinator _setRouteSelectionMapState](self, "_setRouteSelectionMapState");
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        objc_msgSend(v24, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v6, 1, 0);

        v25 = dispatch_time(0, 250000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1005A8D38;
        block[3] = &unk_1011AC860;
        block[4] = self;
        dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, block);
        goto LABEL_5;
      }
      if ((RouteIncidentsViewController *)self->_routePlanningOverviewViewController == v6)
        goto LABEL_4;
      if ((RouteIncidentsViewController *)self->_autosharingVC == v6)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self->_platformController, "currentSession"));
        v35 = objc_opt_class(RoutePlanningSession);
        if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
          v36 = v34;
        else
          v36 = 0;
        v37 = v36;

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripAutosharingContaineeViewController contacts](self->_autosharingVC, "contacts"));
        objc_msgSend(v37, "setAutomaticSharingContacts:", v32);

        goto LABEL_40;
      }
      if ((RouteIncidentsViewController *)self->_lineCardViewController == v6
        || (RouteIncidentsViewController *)self->_lineCardForRoutePlanningViewController == v6)
      {
        -[TransitLineSelectionActionController deactivateWithContext:](self->_lineSelectionAction, "deactivateWithContext:", 0);
        goto LABEL_5;
      }
      v21 = objc_opt_class(VenueFloorCardViewController);
      if ((objc_opt_isKindOfClass(v6, v21) & 1) != 0)
      {
        -[ActionCoordinator closeVenueFloorCardViewController:](self, "closeVenueFloorCardViewController:", v6);
        goto LABEL_5;
      }
      if ((RouteIncidentsViewController *)self->_simpleListResultsVC != v6)
      {
        v38 = objc_opt_class(TransitSchedulesViewController);
        if ((objc_opt_isKindOfClass(v6, v38) & 1) != 0)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
          objc_msgSend(v39, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v6, 1, 0);

          -[ActionCoordinator updateRouteAnnotations](self, "updateRouteAnnotations");
          goto LABEL_5;
        }
        v40 = objc_opt_class(SimilarResultsViewController);
        if ((objc_opt_isKindOfClass(v6, v40) & 1) != 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
          objc_msgSend(v41, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v6, 1, 0);

          v33 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
          objc_msgSend(v33, "clearSearchPins");
          goto LABEL_42;
        }
        v42 = objc_opt_class(CuratedCollectionViewController);
        if ((objc_opt_isKindOfClass(v6, v42) & 1) == 0)
        {
          v43 = objc_opt_class(PublisherViewController);
          if ((objc_opt_isKindOfClass(v6, v43) & 1) == 0
            || (id)-[SearchViewController currentDataSourceType](self->_searchModeViewController, "currentDataSourceType") == (id)1)
          {
            goto LABEL_41;
          }
          goto LABEL_58;
        }
        if (!-[ResultsViewController hasResults](self->_resultsViewController, "hasResults"))
LABEL_58:
          -[ActionCoordinator clearSearch](self, "clearSearch");
LABEL_41:
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        objc_msgSend(v33, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v6, 1, 0);
LABEL_42:

        goto LABEL_5;
      }
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v32, "clearSelection");
LABEL_40:

    goto LABEL_41;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_maps_mapsSceneDelegate"));
  v12 = (RouteIncidentsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topMostPresentedViewController"));

  if ((-[RouteIncidentsViewController conformsToProtocol:](v12, "conformsToProtocol:", &OBJC_PROTOCOL___ContaineeProtocol) & 1) != 0)
  {

    goto LABEL_9;
  }
  if (v12 != v6)
  {
    v22 = (RouteIncidentsViewController *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController presentedViewController](v6, "presentedViewController"));

    if (v22 == v12)
      -[RouteIncidentsViewController dismissViewControllerAnimated:completion:](v12, "dismissViewControllerAnimated:completion:", 1, 0);
  }

LABEL_5:
}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  SearchSessionManager *searchSessionManager;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v10);

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v13 = sub_1002A8AA0(WeakRetained);

    if (v13 != 5)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented")));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("IsRoutePlanningPresented"));

    }
  }
  v15 = sub_10043230C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    v20 = 138412802;
    v21 = v8;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "doSearchItem viewController: %@ title: %@ userInfo: %@", (uint8_t *)&v20, 0x20u);

  }
  searchSessionManager = self->_searchSessionManager;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController recentAutocompleteSessionData](self->_searchModeViewController, "recentAutocompleteSessionData"));
  -[SearchSessionManager performSearchForSearchItem:withUserInfo:recentAutocompleteSessionData:](searchSessionManager, "performSearchForSearchItem:withUserInfo:recentAutocompleteSessionData:", v9, v11, v19);

}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5 refinementsQuery:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MUPlaceEnrichmentAPIController *placeEnrichmentAPIController;
  MUPlaceEnrichmentAPIController *v25;
  MUPlaceEnrichmentAPIController *v26;
  MUPlaceEnrichmentAPIController *v27;
  void *v28;
  void *v29;
  GEOMapServiceTraits *v30;
  SearchSessionManager *searchSessionManager;
  void *v32;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_10043230C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v33 = 138412802;
    v34 = v10;
    v35 = 2112;
    v36 = v16;
    v37 = 2112;
    v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "doSearchItemWithRefinement viewController: %@ title: %@ userInfo: %@", (uint8_t *)&v33, 0x20u);

  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ResultRefinementsBarSearch")));
  if (v17)
  {
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AutoRedoSearch")));

    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
      objc_msgSend(v20, "clearSearchPins");

    }
  }
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mapItem"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_enrichmentInfo"));

    if (v23)
    {
      placeEnrichmentAPIController = self->_placeEnrichmentAPIController;
      if (placeEnrichmentAPIController)
      {
        -[MUPlaceEnrichmentAPIController resetConfiguration](placeEnrichmentAPIController, "resetConfiguration");
        -[MUPlaceEnrichmentAPIController cancelFetchingPlaceEnrichment](self->_placeEnrichmentAPIController, "cancelFetchingPlaceEnrichment");
      }
      v25 = (MUPlaceEnrichmentAPIController *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
      v26 = self->_placeEnrichmentAPIController;
      self->_placeEnrichmentAPIController = v25;

      v27 = self->_placeEnrichmentAPIController;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completion"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mapItem"));
      v30 = -[ActionCoordinator newTraits](self, "newTraits");
      -[MUPlaceEnrichmentAPIController configureWithMapItem:traits:](v27, "configureWithMapItem:traits:", v29, v30);

      -[MUPlaceEnrichmentAPIController fetchPlaceEnrichment:](self->_placeEnrichmentAPIController, "fetchPlaceEnrichment:", 0);
    }
  }
  searchSessionManager = self->_searchSessionManager;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController recentAutocompleteSessionData](self->_searchModeViewController, "recentAutocompleteSessionData"));
  -[SearchSessionManager performSearchForSearchItem:withUserInfo:refinementsQuery:recentAutocompleteSessionData:](searchSessionManager, "performSearchForSearchItem:withUserInfo:refinementsQuery:recentAutocompleteSessionData:", v11, v12, v13, v32);

}

- (void)viewController:(id)a3 selectClientResolvedItem:(id)a4 fromSearchInfo:(id)a5 withUserInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  ClientTypeResolver *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
    v13 = objc_msgSend(a6, "mutableCopy");
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = v13;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ReuseSearchSession"));
  v15 = objc_msgSend(v14, "copy");
  v16 = objc_alloc_init(ClientTypeResolver);
  switch(objc_msgSend(v11, "itemType"))
  {
    case 1u:
    case 2u:
    case 6u:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver personalizedItemSource](v16, "personalizedItemSource"));
      v18 = objc_msgSend(v11, "itemType");
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1005A9438;
      v30[3] = &unk_1011BC490;
      v30[4] = self;
      v31 = v15;
      objc_msgSend(v17, "addressOrLOIWithType:completion:", v18, v30);

      v19 = v31;
      goto LABEL_7;
    case 3u:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver parkedCarSource](v16, "parkedCarSource"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1005A9518;
      v28[3] = &unk_1011BC1F8;
      v28[4] = self;
      v29 = v10;
      objc_msgSend(v20, "objectWithCompletion:", v28);

      v19 = v29;
LABEL_7:

      goto LABEL_14;
    case 4u:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator userLocationSearchResult](self, "userLocationSearchResult"));

      if (!v21)
        goto LABEL_14;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator userLocationSearchResult](self, "userLocationSearchResult"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v22));

      -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v23, v15);
      goto LABEL_13;
    case 5u:
      v24 = objc_msgSend(v11, "resultIndex");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "results"));
      if (v24 >= objc_msgSend(v23, "count"))
        goto LABEL_13;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "results"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v11, "resultIndex")));

      if (!v26)
        goto LABEL_14;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v26));
      -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v27, v15);

      v23 = (void *)v26;
LABEL_13:

LABEL_14:
      return;
    default:
      goto LABEL_14;
  }
}

- (void)viewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a5;
  v8 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "macPopoverPresentationController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1005A95F8;
    v10[3] = &unk_1011ADA00;
    v11 = v7;
    objc_msgSend(v9, "dismissAnimated:completion:", 1, v10);

  }
}

- (void)updateRouteAnnotations
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  objc_msgSend(v2, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (id)routeAnnotationsProvider
{
  void *v3;
  id v4;
  RoutePlanningMapController *v5;
  RoutePlanningMapController *routePlanningMapController;
  RoutePlanningMapController *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  if ((objc_opt_respondsToSelector(v4, "routeAnnotationsConfiguration") & 1) != 0
    || (objc_opt_respondsToSelector(v4, "updateRouteAnnotationsConfiguration:") & 1) != 0)
  {
    v5 = (RoutePlanningMapController *)v4;
  }
  else
  {
    v5 = 0;
  }

  routePlanningMapController = v5;
  if (!v5)
  {
    if (!-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    {
      v7 = 0;
      goto LABEL_10;
    }
    routePlanningMapController = self->_routePlanningMapController;
  }
  v7 = routePlanningMapController;
LABEL_10:

  return v7;
}

- (BOOL)_isBuildingMultipointRoute
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t IsEnabled_Maps420;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController presentingViewController](self->_routeSearchVC, "presentingViewController")), v3, v3))
  {
    if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
      v5 = objc_msgSend(v4, "transportType");

    }
    else
    {
      v5 = -[DirectionItem transportType](self->_currentDirectionItem, "transportType");
    }
    if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypointRequests"));
      v8 = objc_msgSend(v7, "count");

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self->_currentDirectionItem, "items"));
      v8 = objc_msgSend(v6, "count");
    }

    IsEnabled_Maps420 = 0;
    switch((unint64_t)v5)
    {
      case 0uLL:
        IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(0, v9);
        if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
        {
          IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
          if ((IsEnabled_Maps420 & 1) == 0)
            goto LABEL_13;
        }
        LOBYTE(IsEnabled_Maps420) = 1;
        break;
      case 1uLL:
        LOBYTE(IsEnabled_Maps420) = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(0, v9);
        break;
      case 2uLL:
LABEL_13:
        LOBYTE(IsEnabled_Maps420) = MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
        break;
      case 5uLL:
        LOBYTE(IsEnabled_Maps420) = MapsFeature_IsEnabled_Maps420(0);
        break;
      default:
        break;
    }
    if (!v8)
      LOBYTE(IsEnabled_Maps420) = 0;
  }
  else
  {
    LOBYTE(IsEnabled_Maps420) = 0;
  }
  return IsEnabled_Maps420;
}

- (BOOL)shouldAddStopInRoutePlanning
{
  void *v3;
  unsigned __int8 v4;

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v4 = objc_msgSend(v3, "canAddStop");

  }
  else
  {
    v4 = -[DirectionItem canAddStop](self->_currentDirectionItem, "canAddStop");
  }
  if (!-[ActionCoordinator _isBuildingMultipointRoute](self, "_isBuildingMultipointRoute")
    && !-[ActionCoordinator isPresentingAddStopSearchResults](self, "isPresentingAddStopSearchResults"))
  {
    return 0;
  }
  return v4;
}

- (void)toggleRoutePlanning
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  id v7;
  _QWORD *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v4 = objc_msgSend(v3, "isSuspended");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v9 = v5;
  if (v4)
  {
    objc_msgSend(v5, "resume", v5);
LABEL_5:

    return;
  }
  v6 = objc_msgSend(v5, "isEnabled");

  if (v6)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    objc_msgSend(v10, "suspend");
    goto LABEL_5;
  }
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    -[ActionCoordinator _exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:](self, "_exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:", 1, 1);
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1005A99F0;
    v11[3] = &unk_1011AE8F8;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeSearchVC](self, "routeSearchVC"));
    v7 = v12;
    v8 = objc_retainBlock(v11);
    -[ActionCoordinator _enterRoutePlanningOverviewAnimated:completion:](self, "_enterRoutePlanningOverviewAnimated:completion:", 1, v8);

  }
}

- (void)dismissRoutePlanningPlaceCardIfNeeded
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v4 = sub_1002A8AA0(WeakRetained);
    v5 = 24;
    if (v4 == 5)
      v5 = 16;
    v15 = *(id *)((char *)&self->super.isa + v5);

    v6 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentViewController"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentViewController"));

      v11 = v15;
      if (v10 != v15)
        goto LABEL_13;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
      objc_msgSend(v12, "clearSelectionAnimated:", 1);

      v13 = objc_loadWeakRetained((id *)&self->_containerViewController);
      if (sub_1002A8AA0(v13) != 5)
      {

        goto LABEL_12;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));

      v11 = v15;
      if (!v14)
      {
LABEL_13:

        return;
      }
      -[ActionCoordinator clearSearch](self, "clearSearch");
    }
    else
    {

    }
LABEL_12:
    v11 = v15;
    goto LABEL_13;
  }
}

- (void)viewController:(id)a3 doDirectionIntent:(id)a4 withSearchResults:(id)a5
{
  id v8;
  id v9;
  id v10;
  DirectionIntentItemProvider *v11;
  id v12;
  int Card;
  void *v14;
  void *v15;
  ResultsViewController *v16;
  ResultsViewController **p_resultsViewController;
  ResultsViewController *resultsViewController;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  ActionCoordinator *v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(DirectionIntentItemProvider);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1005A9C84;
  v22 = &unk_1011BC4B8;
  v23 = self;
  v12 = v8;
  v24 = v12;
  -[DirectionIntentItemProvider directionItemWithDirectionIntent:searchResults:completion:](v11, "directionItemWithDirectionIntent:searchResults:completion:", v10, v9, &v19);

  Card = -[ContainerViewController delaysFirstCardPresentation]_0();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController", v19, v20, v21, v22, v23));
  v15 = v14;
  if (!Card)
  {
    p_resultsViewController = &self->_resultsViewController;
    goto LABEL_5;
  }
  v16 = (ResultsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentViewController"));
  p_resultsViewController = &self->_resultsViewController;
  resultsViewController = self->_resultsViewController;

  if (v16 != resultsViewController)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
LABEL_5:
    objc_msgSend(v15, "removeControllerFromStack:", *p_resultsViewController);

  }
}

- (void)viewController:(id)a3 doDirectionIntentWithLocalSearchCompletion:(id)a4
{
  id v6;
  id v7;
  DirectionIntentItemProvider *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(DirectionIntentItemProvider);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005A9DEC;
  v10[3] = &unk_1011BC4B8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[DirectionIntentItemProvider directionItemWithLocalSearchCompletion:completion:](v8, "directionItemWithLocalSearchCompletion:completion:", v7, v10);

}

- (void)viewController:(id)a3 doDirectionItem:(id)a4 withUserInfo:(id)a5
{
  -[ActionCoordinator viewController:doDirectionItem:allowToPromptEditing:withUserInfo:](self, "viewController:doDirectionItem:allowToPromptEditing:withUserInfo:", a3, a4, 1, a5);
}

- (void)viewController:(id)a3 addStopForSearchResult:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", a4));
  -[ActionCoordinator viewController:addStopForSearchFieldItem:withUserInfo:](self, "viewController:addStopForSearchFieldItem:withUserInfo:", v9, v10, v8);

}

- (void)viewController:(id)a3 addStopForSearchFieldItem:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  DirectionItem *v39;
  id v40;
  id v41;
  id v42;
  int v43;
  unint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  const __CFString *v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented")
    || (v11 = objc_claimAutoreleasedReturnValue(-[RouteSearchViewController presentingViewController](self->_routeSearchVC, "presentingViewController"))) == 0
    || (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self->_routeSearchVC, "dataCoordinator")),
        v13,
        v12,
        v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionItemForCurrentSession"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v16));

    v18 = objc_claimAutoreleasedReturnValue(-[RouteSearchViewController presentingViewController](self->_routeSearchVC, "presentingViewController"));
    if (v18
      && (v19 = (void *)v18,
          v20 = -[RouteSearchViewController _currentlySelectedIndexForAddStop](self->_routeSearchVC, "_currentlySelectedIndexForAddStop"), v19, v20 != 0x7FFFFFFFFFFFFFFFLL))
    {
LABEL_12:
      v25 = objc_msgSend(v17, "count");
      v26 = sub_10043214C();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v28 = v27;
      if (v20 >= (unint64_t)v25)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v29 = objc_msgSend(v17, "count");
          v30 = objc_msgSend(v15, "transportType");
          v32 = CFSTR("NO");
          switch((unint64_t)v30)
          {
            case 0uLL:
              IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v30, v31);
              if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
              {
                IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
                if ((IsEnabled_Maps420 & 1) == 0 && !MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
                  goto LABEL_31;
              }
              goto LABEL_33;
            case 1uLL:
              if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v30, v31) & 1) == 0)
                goto LABEL_31;
              goto LABEL_33;
            case 2uLL:
              if ((MapsFeature_IsEnabled_Maps182(v30) & 1) != 0)
                goto LABEL_33;
              goto LABEL_31;
            case 5uLL:
              if ((MapsFeature_IsEnabled_Maps420(v30) & 1) != 0)
LABEL_33:
                v32 = CFSTR("YES");
              else
LABEL_31:
                v32 = CFSTR("NO");
              break;
            default:
              break;
          }
          v43 = 134218498;
          v44 = v20;
          v45 = 2048;
          v46 = v29;
          v47 = 2112;
          v48 = v32;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Will not add or replace stop, index out of bounds (%lu/%lu) or not permitted (mpr permitted: %@)", (uint8_t *)&v43, 0x20u);
        }
        goto LABEL_35;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v43 = 134217984;
        v44 = v20;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Performing fresh directions with replaced stop at index %lu", (uint8_t *)&v43, 0xCu);
      }

      objc_msgSend(v17, "replaceObjectAtIndex:withObject:", v20, v9);
    }
    else
    {
      v21 = objc_msgSend(v15, "transportType");
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      switch((unint64_t)v21)
      {
        case 0uLL:
          v23 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v21, v22);
          if ((v23 & 1) == 0)
          {
            v24 = MapsFeature_IsEnabled_Maps420(v23);
            if ((v24 & 1) == 0 && !MapsFeature_IsEnabled_Maps182(v24))
              goto LABEL_12;
          }
          break;
        case 1uLL:
          if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v21, v22) & 1) == 0)
            goto LABEL_12;
          break;
        case 2uLL:
          if ((MapsFeature_IsEnabled_Maps182(v21) & 1) == 0)
            goto LABEL_12;
          break;
        case 5uLL:
          if ((MapsFeature_IsEnabled_Maps420(v21) & 1) == 0)
            goto LABEL_12;
          break;
        default:
          goto LABEL_12;
      }
      v35 = sub_10043214C();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        LOWORD(v43) = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Performing fresh directions with added stop", (uint8_t *)&v43, 2u);
      }

      objc_msgSend(v17, "addObject:", v9);
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v38 = objc_msgSend(v37, "transportType");

    v39 = [DirectionItem alloc];
    v40 = objc_msgSend(v17, "copy");
    v28 = -[DirectionItem initWithItems:transportType:](v39, "initWithItems:transportType:", v40, v38);

    v41 = objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, CFSTR("AppendDirectionItem"));
    v42 = objc_msgSend(v41, "copy");
    -[ActionCoordinator viewController:doDirectionItem:withUserInfo:](self, "viewController:doDirectionItem:withUserInfo:", v8, v28, v42);

    -[ActionCoordinator clearSearch](self, "clearSearch");
LABEL_35:

    goto LABEL_36;
  }
  -[RouteSearchViewController replaceSelectedFieldWithItem:](self->_routeSearchVC, "replaceSelectedFieldWithItem:", v9);
LABEL_36:

}

- (void)viewController:(id)a3 doDirectionItem:(id)a4 allowToPromptEditing:(BOOL)a5 withUserInfo:(id)a6
{
  _BOOL4 v7;
  RouteSearchViewController *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  DirectionItem *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  DirectionItem *v20;
  DirectionItem *currentDirectionItem;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  char v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  GEOMapServiceTraits *v42;
  int64_t v43;
  id v44;
  NSObject *v45;
  const __CFString *v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  _BOOL4 v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  _BOOL8 v59;
  void *v60;
  void *v61;
  DirectionItem *v62;
  id v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  __int128 *p_buf;
  uint8_t v68[4];
  const __CFString *v69;
  __int128 buf;
  uint64_t v71;
  BOOL v72;

  v7 = a5;
  v10 = (RouteSearchViewController *)a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v15 = (DirectionItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionItemForCurrentSession"));

    if (!v15)
      goto LABEL_7;
  }
  else
  {
    v15 = self->_currentDirectionItem;
    if (!v15)
    {
LABEL_7:
      if ((objc_msgSend(v11, "isEquivalentAsWaypointToDirectionItem:", v15) & 1) == 0)
      {
        -[MKLocationManagerOperation cancel](self->_locationUpdateOperationForRouting, "cancel");
        v20 = (DirectionItem *)objc_msgSend(v11, "copy");
        currentDirectionItem = self->_currentDirectionItem;
        self->_currentDirectionItem = v20;

        if (-[DirectionItem isVenueItem](self->_currentDirectionItem, "isVenueItem"))
        {
          if (!-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
            objc_msgSend(v22, "pushVenueCardItem:source:", self->_currentDirectionItem, 4);

            v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
            objc_msgSend(v23, "clearLinkedPlacesAndPolygon");

          }
        }
      }
      if (objc_msgSend(v13, "count") == (id)1)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AppendDirectionItem")));
        v25 = objc_msgSend(v24, "BOOLValue");

        if ((v25 & 1) == 0)
        {
          v26 = sub_10043214C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "DirectionItem unexpectedly had only 1 waypoint: %@", (uint8_t *)&buf, 0xCu);

          }
        }
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v71 = 0x2020000000;
      v72 = 0;
      v72 = (unint64_t)objc_msgSend(v13, "count") > 1;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_1005AAB48;
      v65[3] = &unk_1011B9628;
      v66 = v13;
      p_buf = &buf;
      objc_msgSend(v66, "enumerateObjectsUsingBlock:", v65);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentData"));
      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentData"));
        v31 = ((unint64_t)objc_msgSend(v30, "source") & 0xFFFFFFFFFFFFFFFELL) == 2;

      }
      else
      {
        v31 = 0;
      }

      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
        v32 = v31;
      else
        v32 = 1;
      if ((v32 & 1) == 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Cannot Provide Directions"), CFSTR("localized string not found"), 0));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Cannot get directions to and from the same location."), CFSTR("localized string not found"), 0));
        -[ActionCoordinator displayAlertWithTitle:message:postAlertSearchType:](self, "displayAlertWithTitle:message:postAlertSearchType:", v38, v40, 2);

LABEL_60:
        _Block_object_dispose(&buf, 8);
        goto LABEL_61;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AllowApproximateCurrentLocation")));
      objc_msgSend(v11, "setAllowApproximateUserLocation:", v33);

      v64 = 0x7FFFFFFFFFFFFFFFLL;
      v34 = objc_msgSend(v11, "editRequired:", &v64);
      v35 = v34;
      if (!v7 || !v34)
      {
        if (v34)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v42 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Cannot Provide Directions"), CFSTR("localized string not found"), 0));

          -[ActionCoordinator displayAlertWithTitle:message:postAlertSearchType:](self, "displayAlertWithTitle:message:postAlertSearchType:", v42, 0, 2);
        }
        else
        {
          v43 = -[DirectionItem transportType](self->_currentDirectionItem, "transportType");
          v44 = sub_10043214C();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            if ((unint64_t)(v43 - 1) > 4)
              v46 = CFSTR("Undefined");
            else
              v46 = *(&off_1011BC900 + v43 - 1);
            *(_DWORD *)v68 = 138412290;
            v69 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Initial transport type from direction item: %@", v68, 0xCu);
          }

          if (v43)
          {
            if (v43 == 4)
            {
              if (sub_10048286C())
              {
                v43 = 4;
              }
              else
              {
                v51 = sub_10043214C();
                v52 = objc_claimAutoreleasedReturnValue(v51);
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v68 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Detected rideshare transport type when ride booking is not enabled; changing to driving",
                    v68,
                    2u);
                }

                v43 = 1;
              }
            }
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
            v54 = v53;
            if ((unint64_t)(v43 - 1) > 4)
              v55 = 4;
            else
              v55 = dword_100E392B4[v43 - 1];
            objc_msgSend(v53, "capturePredictedTransportationMode:", v55);

          }
          -[DirectionItem setTransportType:](self->_currentDirectionItem, "setTransportType:", v43);
          self->_visibleViewModeBeforeDoingDirectionItem = -[ActionCoordinator displayedViewMode](self, "displayedViewMode");
          v42 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits")));
          if (!v42)
            v42 = -[ActionCoordinator newTraits](self, "newTraits");
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits_Source")));

          if (v56)
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits_Source")));
            -[GEOMapServiceTraits setSource:](v42, "setSource:", objc_msgSend(v57, "integerValue"));

          }
          v58 = objc_msgSend(v12, "mutableCopy");
          if (v10)
            v59 = self->_routeSearchVC == v10;
          else
            v59 = 0;
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v59));
          objc_msgSend(v58, "setObject:forKeyedSubscript:", v60, CFSTR("DisableNotReachableErrorInRoutePlanning"));

          v61 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
          v62 = self->_currentDirectionItem;
          v63 = objc_msgSend(v58, "copy");
          objc_msgSend(v61, "startWithDirectionItem:traits:userInfo:", v62, v42, v63);

        }
        goto LABEL_60;
      }
      if (v34 == (id)3)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits_Source")));
        if (objc_msgSend(v36, "integerValue") == (id)1)
        {

          goto LABEL_35;
        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DirectionsSourceKey")));
        v48 = objc_msgSend(v47, "integerValue") == (id)2;

        if (v48)
        {
LABEL_35:
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AllowApproximateCurrentLocation")));
          v50 = v49 == 0;

          if (v50)
          {
            -[ActionCoordinator _promptForCurrentLocationConfirmationWithDirectionItem:userInfo:](self, "_promptForCurrentLocationConfirmationWithDirectionItem:userInfo:", v11, v12);
            goto LABEL_60;
          }
        }
      }
      -[ActionCoordinator _promptForEditRequired:forWaypointAtIndex:inDirectionItem:userInfo:](self, "_promptForEditRequired:forWaypointAtIndex:inDirectionItem:userInfo:", v35, v64, v11, v12);
      goto LABEL_60;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AppendDirectionItem")));
  v17 = objc_msgSend(v16, "BOOLValue");

  if (!v17)
    goto LABEL_7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  -[ActionCoordinator viewController:addStopForSearchFieldItem:withUserInfo:](self, "viewController:addStopForSearchFieldItem:withUserInfo:", v10, v19, v12);
LABEL_61:

}

- (void)_promptForCurrentLocationConfirmationWithDirectionItem:(id)a3 userInfo:(id)a4
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
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  ActionCoordinator *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  ActionCoordinator *v36;
  id v37;
  id v38;

  v27 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Get Directions from Approximate Location"), CFSTR("localized string not found"), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Your current location can’t be used by Maps because of your privacy settings."), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Use Approximate Location"), CFSTR("localized string not found"), 0));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1005AAF04;
  v34[3] = &unk_1011BC4E0;
  v14 = v6;
  v35 = v14;
  v36 = self;
  v15 = v11;
  v37 = v15;
  v16 = v27;
  v38 = v16;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v34));

  objc_msgSend(v15, "addAction:", v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Choose Location"), CFSTR("localized string not found"), 0));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1005AAF84;
  v29[3] = &unk_1011BC4E0;
  v30 = v14;
  v31 = self;
  v32 = v15;
  v33 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, v29));

  objc_msgSend(v20, "addAction:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, 0));

  objc_msgSend(v20, "addAction:", v25);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "_maps_topMostPresentViewController:animated:completion:", v20, 1, 0);

}

- (void)_promptForEditRequired:(unint64_t)a3 forWaypointAtIndex:(unint64_t)a4 inDirectionItem:(id)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  unsigned __int8 v17;
  void *v18;
  RouteSearchViewController *v19;
  void *v20;
  RouteSearchViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v10 = a5;
  v11 = a6;
  if (!a3)
    goto LABEL_20;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v13 = sub_1002A8AA0(v12);

  if (v13 == 5)
  {
    -[ActionCoordinator _presentMacRouteEditingWithEditRequired:index:](self, "_presentMacRouteEditingWithEditRequired:index:", a3, a4);
    goto LABEL_20;
  }
  if (a3 - 2 < 2)
  {
    v17 = objc_msgSend(v10, "hasCurrentLocationOnlyAsOriginWaypoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    if ((v17 & 1) != 0)
      v16 = CFSTR("Choose Start");
    else
      v16 = CFSTR("Set Current Location");
    goto LABEL_13;
  }
  if (a3 == 4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("Choose Destination");
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("Choose Start");
LABEL_13:
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));

    goto LABEL_14;
  }
  v18 = 0;
LABEL_14:
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1005A83A0;
  v39 = sub_1005A83B0;
  v40 = 0;
  v19 = [RouteSearchViewController alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1005AB36C;
  v29[3] = &unk_1011BC530;
  v29[4] = self;
  v32 = &v35;
  v30 = v10;
  v33 = a3;
  v34 = a4;
  v31 = v11;
  v21 = -[RouteSearchViewController initWithDelegate:items:waypointIndex:selectionHandler:](v19, "initWithDelegate:items:waypointIndex:selectionHandler:", self, v20, a4, v29);
  v22 = (void *)v36[5];
  v36[5] = (uint64_t)v21;

  objc_msgSend((id)v36[5], "setTitle:", v18);
  objc_storeStrong((id *)&self->_routeSearchVC, (id)v36[5]);
  if (objc_msgSend((id)v36[5], "modalPresentationStyle") == (id)7)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v36[5], "popoverPresentationController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v36[5], "popoverPresentationController"));
      objc_msgSend(v25, "setDelegate:", self);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v26, "_maps_topMostPresentViewController:animated:completion:", v36[5], 1, 0);
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v27 = v36[5];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1005AB570;
    v28[3] = &unk_1011BC558;
    v28[4] = &v35;
    v28[5] = a4;
    objc_msgSend(v26, "presentController:animated:completion:", v27, 1, v28);
  }

  _Block_object_dispose(&v35, 8);
LABEL_20:

}

- (void)viewController:(id)a3 enterRouteCreationWith:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buildRoute"));
  -[ActionCoordinator viewController:enterRouteCreationWithRoute:withUserInfo:](self, "viewController:enterRouteCreationWithRoute:withUserInfo:", v7, v8, 0);

}

- (void)viewController:(id)a3 enterRouteCreationWithRoute:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapServiceTraits *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = -[ActionCoordinator newTraits](self, "newTraits");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1005AB768;
  v18[3] = &unk_1011B0430;
  v12 = v9;
  v19 = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005AB838;
  v15[3] = &unk_1011BC580;
  objc_copyWeak(&v17, &location);
  v13 = v10;
  v16 = v13;
  v14 = objc_msgSend(v12, "_maps_convertToNavigableRouteWithTraits:errorHandler:completionHandler:", v11, v18, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)viewControllerDoLastDirectionItem:(id)a3
{
  -[ActionCoordinator _enterRoutePlanningOverviewAnimated:completion:](self, "_enterRoutePlanningOverviewAnimated:completion:", 0, 0);
}

- (void)viewController:(id)a3 selectLastDirectionsDestinationComposedWaypoint:(id)a4
{
  id v6;
  id v7;
  DirectionItem *currentDirectionItem;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  SearchResult *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  dispatch_time_t v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  SearchResult *v42;
  ActionCoordinator *v43;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v46;
  char v47;
  SearchResult *v48;

  v6 = a3;
  v7 = a4;
  currentDirectionItem = self->_currentDirectionItem;
  if (currentDirectionItem)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](currentDirectionItem, "items"));
    v10 = objc_msgSend(v9, "count");

    if ((unint64_t)v10 < 3)
    {
      if (v7)
      {
        v15 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v7);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self->_currentDirectionItem, "items"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "waypoint"));
        v15 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pin"));

      }
      v19 = sub_100431C0C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = v20;
      if (v15)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v15;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Asked to select destination for last direction item: %@", (uint8_t *)&buf, 0xCu);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
        objc_msgSend(v22, "clearDirectionsPins");

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        v24 = sub_1002A8AA0(v23) == 5;

        if (v24)
        {
          v21 = objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v15));
          -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v21, 0);
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
          v28 = objc_msgSend(v27, "canSelectPin:", v15);

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
          v30 = v29;
          if (v28)
          {
            objc_msgSend(v29, "selectAndShowSearchResult:animated:", v15, 1);
          }
          else
          {
            v48 = v15;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
            objc_msgSend(v30, "setSearchPins:selectedPin:animated:", v31, v15, 1);

          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v46 = 0x2020000000;
          v47 = 0;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1005ABD6C;
          v40[3] = &unk_1011BC5A8;
          p_buf = &buf;
          v21 = v32;
          v41 = v21;
          v42 = v15;
          v43 = self;
          v33 = objc_retainBlock(v40);
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastLocation](v21, "lastLocation"));

          if (v34)
          {
            ((void (*)(_QWORD *))v33[2])(v33);
          }
          else
          {
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_1005ABEC8;
            v38[3] = &unk_1011B81D0;
            v35 = v33;
            v39 = v35;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject singleLocationUpdateWithHandler:](v21, "singleLocationUpdateWithHandler:", v38));
            objc_msgSend(v36, "start");
            v37 = dispatch_time(0, 3000000000);
            dispatch_after(v37, (dispatch_queue_t)&_dispatch_main_q, v35);

          }
          _Block_object_dispose(&buf, 8);
        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self->_currentDirectionItem, "items"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastObject"));
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Asked to select destination for last direction item, but could not create SearchResult from item: %@", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      v11 = sub_100431C0C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Asked to select destination for last direction item, but it was MPR so popping to Home instead", (uint8_t *)&buf, 2u);
      }

      -[ActionCoordinator viewControllerPresentSearchEndEditing](self, "viewControllerPresentSearchEndEditing");
    }
  }
  else
  {
    v13 = sub_100431C0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Asked to select destination for last direction item, but no direction item found", (uint8_t *)&buf, 2u);
    }

  }
}

- (void)viewControllerOpenNearby:(id)a3 animated:(BOOL)a4
{
  id v5;

  -[ActionCoordinator presentSearchAnimated:](self, "presentSearchAnimated:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "searchBarBecomeFirstResponder");

}

- (void)_refreshSettingsTip
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = sub_1002A8AA0(v3);

  if (v4 != 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "floatingControlsPresentationController"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "settingsTipController"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "observers"));
    objc_msgSend(v8, "registerObserver:", self);

    if (objc_msgSend(v9, "settingsTipState"))
    {
      if (objc_msgSend(v7, "impressionState") != (id)1)
        objc_msgSend(v9, "setSettingsTipState:", 0);
    }
    else if (objc_msgSend(v7, "shouldShowTip"))
    {
      objc_msgSend(v9, "setSettingsTipState:", 1);
      objc_msgSend(v7, "settingsTipShown");
    }

  }
}

- (void)closeSettingsIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  if (v4)
  {
    v5 = objc_opt_class(SettingsViewController);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1005AC10C;
      v9[3] = &unk_1011AC860;
      v10 = v6;
      v8 = v6;
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v9);

    }
  }

}

- (void)viewControllerOpenSettings:(id)a3
{
  ControlContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v7 = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeContext"));
  v9 = objc_msgSend(v6, "isTopContext:", v8);

  if (v9)
  {
    -[ActionCoordinator _cancelUserInteractions](self, "_cancelUserInteractions");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
    objc_msgSend(v10, "setCompassEnabled:", 0);

    v11 = objc_loadWeakRetained((id *)p_containerViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsViewController](self, "settingsViewController"));
    objc_msgSend(v11, "_maps_topMostPresentViewController:animated:completion:", v12, 1, 0);

    v13 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v13, "setUseBackdropFullScreen:", 1);

    v14 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v14, "captureUserAction:onTarget:eventValue:", 5001, -[ActionCoordinator currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics"), 0);

  }
}

- (void)viewControllerCloseSettingsTip:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "settingsTipController"));
  objc_msgSend(v3, "settingsTipClosed");

}

- (void)viewControllerClosed:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  ParkedCarInfoCardViewController *parkedCarViewController;
  void *v13;
  id v14;
  void *v15;
  PlaceCardViewController *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  PlaceCardViewController *v22;

  v4 = a4;
  v22 = (PlaceCardViewController *)a3;
  v6 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v22, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v7, "clearLinkedPlacesAndPolygon");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
    objc_msgSend(v8, "resetConfiguration");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
    objc_msgSend(v9, "cancelFetchingPlaceEnrichment");

  }
  v10 = objc_opt_class(ParkedCarInfoCardViewController);
  if ((objc_opt_isKindOfClass(v22, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v11, "clearSelection");

    -[ActionCoordinator clearSearch](self, "clearSearch");
    parkedCarViewController = self->_parkedCarViewController;
    self->_parkedCarViewController = 0;

  }
  -[ActionCoordinator closeSettingsIfNeeded](self, "closeSettingsIfNeeded");
  if (-[SearchSessionManager singleResultMode](self->_searchSessionManager, "singleResultMode"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (v14 != (id)5)
      -[ActionCoordinator clearSearch](self, "clearSearch");
  }
  if (v22)
  {
    if (self->_placeCardForRoutePlanningViewController == v22)
      -[ActionCoordinator _setRouteSelectionMapState](self, "_setRouteSelectionMapState");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v16 = (PlaceCardViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topViewController"));

    if (v16 == v22)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      objc_msgSend(v17, "popVenueCardItem:", 0);

    }
  }
  v18 = objc_opt_class(RoutePlanningOverviewViewController);
  if ((objc_opt_isKindOfClass(v22, v18) & 1) != 0)
    -[ActionCoordinator _cleanupRoutePlanningIfNeededAnimated:](self, "_cleanupRoutePlanningIfNeededAnimated:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v19, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v22, v4, 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewIfLoaded"));
  objc_msgSend(v21, "endEditing:", 1);

}

- (void)viewController:(id)a3 startNavigationWithRouteCollection:(id)a4 navigationDetailsOptions:(NavigationDetailsOptions *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  _OWORD v12[3];
  unint64_t navigationModeContext;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchSessionManager](self, "searchSessionManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSearchSession"));
  objc_msgSend(v9, "resetEVChargerTimers");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  v11 = *(_OWORD *)&a5->guidanceType;
  v12[0] = *(_OWORD *)&a5->shouldSimulateLocations;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a5->isReconnecting;
  navigationModeContext = a5->navigationModeContext;
  objc_msgSend(v10, "startNavigationWithRouteCollection:navigationDetailsOptions:", v7, v12);

}

- (void)viewController:(id)a3 startRideBookingSessionWithRideBookingRideOption:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ActionCoordinator setIsRoutePlanningPresented:](self, "setIsRoutePlanningPresented:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v6, "startRideBookingSessionWithRideBookingRideOption:", v5);

}

- (void)viewController:(id)a3 continueRideBookingSessionWithApplicationIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v6, "continueRideBookingSessionWithApplicationIdentifier:", v5);

}

- (void)viewController:(id)a3 removeDroppedPin:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (!v14)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v8 = objc_opt_class(PlaceCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    if ((isKindOfClass & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeCardItem"));
      v12 = objc_msgSend(v11, "isDroppedPin");

      if (v12)
        v13 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      else
        v13 = 0;
      v14 = (id)v13;

    }
    else
    {
      v14 = 0;
    }
  }
  -[ActionCoordinator deleteMarkedLocation:](self, "deleteMarkedLocation:", v6);
  -[ActionCoordinator viewControllerClosed:animated:](self, "viewControllerClosed:animated:", v14, 1);

}

- (void)viewController:(id)a3 createDroppedPin:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  v6 = a3;
  if (objc_msgSend(v8, "hasFloorOrdinal"))
    v7 = (uint64_t)objc_msgSend(v8, "floorOrdinal");
  else
    v7 = 0x7FFFFFFFLL;
  objc_msgSend(v8, "coordinate");
  -[ActionCoordinator viewController:createMarkedLocationAtCoordinate:floorOrdinal:](self, "viewController:createMarkedLocationAtCoordinate:floorOrdinal:", v6, v7);

}

- (void)viewController:(id)a3 createMarkedLocationAtCoordinate:(CLLocationCoordinate2D)a4 floorOrdinal:(int)a5
{
  uint64_t v5;
  double longitude;
  double latitude;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = *(_QWORD *)&a5;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v17 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", v5, latitude, longitude));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "customSearchManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapView"));
  objc_msgSend(v12, "setCustomSearchResult:animated:shouldSelectOnMap:", v9, 1, v15);

  if (v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v16, "setDroppedPin:animated:shouldSelect:", v9, 1, 1);

    -[ActionCoordinator viewController:selectSearchResult:addToHistory:source:saveSelectionState:](self, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:", v17, v9, 0, 3, 1);
  }

}

- (void)viewController:(id)a3 editLocationOfMarkedLocation:(id)a4
{
  id v6;
  id v7;
  MarkedLocationRefinementViewController *v8;
  id v9;
  id v10;
  void ***v11;
  uint64_t v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  ActionCoordinator *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = -[MarkedLocationRefinementViewController initWithMarkedLocation:]([MarkedLocationRefinementViewController alloc], "initWithMarkedLocation:", v7);

  -[LocationRefinementViewController setDelegate:](v8, "setDelegate:", self);
  -[MarkedLocationRefinementViewController setOriginalPresenterViewController:](v8, "setOriginalPresenterViewController:", v6);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_1005ACA28;
  v18 = &unk_1011AC8B0;
  v19 = self;
  v10 = v9;
  v20 = v10;
  v11 = objc_retainBlock(&v15);
  if (sub_1002A8AA0(v6) == 5
    && (v12 = objc_opt_class(PlaceCardViewController), (objc_opt_isKindOfClass(v6, v12) & 1) != 0))
  {
    v13 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "placeCardDelegate", v15, v16, v17, v18, v19));
    objc_msgSend(v14, "placeCardViewController:dismissAnimated:completion:", v13, 1, v11);

  }
  else
  {
    ((void (*)(void ***))v11[2])(v11);
  }

}

- (void)viewController:(id)a3 displayStoreViewControllerForAppWithiTunesIdentifier:(id)a4 clientIdentifier:(id)a5
{
  __CFString *v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  id v15;

  if (a4)
  {
    v7 = (__CFString *)a5;
    v8 = a4;
    v9 = objc_alloc_init((Class)SKStoreProductViewController);
    objc_msgSend(v9, "setDelegate:", self);
    if (v7)
      v10 = v7;
    else
      v10 = &stru_1011EB268;
    objc_msgSend(v9, "setClientIdentifier:", v10);

    v14 = SKStoreProductParameterITunesItemIdentifier;
    v15 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

    objc_msgSend(v9, "loadProductWithParameters:completionBlock:", v11, &stru_1011BC5E8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
    objc_msgSend(v13, "_maps_topMostPresentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)viewController:(id)a3 doShareSheetForShareItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));

  objc_msgSend(v12, "shareItem:sourceView:completion:", v9, v11, v8);
}

- (void)viewController:(id)a3 doAudioCallToSearchResult:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  void *v27;
  Block_layout *v28;

  v25 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "phoneNumber"));

  if (!v6 || (v7 = objc_msgSend(v6, "length")) == 0)
  {
    if (!objc_msgSend(v25, "isAddressBookResult"))
      goto LABEL_11;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "address"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contact"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumbers"));
    v11 = objc_msgSend(v10, "count");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumbers"));
    v13 = objc_msgSend(v12, "count");

    if (v11 == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumbers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));
      sub_1005ACEBC(v17, (NSString *)v17);
    }
    else
    {
      if ((unint64_t)v13 < 2)
      {
LABEL_10:

        goto LABEL_11;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumbers"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1005ACF10;
      v26[3] = &unk_1011BC650;
      v27 = v18;
      v28 = &stru_1011BC628;
      v16 = v18;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v26);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, 0));
      objc_msgSend(v16, "addAction:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "chromeViewController"));
      objc_msgSend(v24, "_maps_topMostPresentViewController:animated:completion:", v16, 1, 0);

      v17 = v27;
    }

    goto LABEL_10;
  }
  sub_1005ACEBC(v7, (NSString *)v6);
LABEL_11:

}

- (void)viewController:(id)a3 openWebsiteForSearchResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;

  v6 = a3;
  v7 = a4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1005AD3A0;
  v35[3] = &unk_1011BC678;
  v35[4] = self;
  v8 = v6;
  v36 = v8;
  v9 = objc_retainBlock(v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "url"));

  if (!v11)
  {
    if (!objc_msgSend(v7, "isAddressBookResult"))
      goto LABEL_10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contact"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "urlAddresses"));
    v15 = objc_msgSend(v14, "count");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "urlAddresses"));
    v17 = objc_msgSend(v16, "count");

    if (v15 == (id)1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "urlAddresses"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));

      ((void (*)(_QWORD *, id))v9[2])(v9, v21);
    }
    else
    {
      if ((unint64_t)v17 < 2)
      {
LABEL_9:

        goto LABEL_10;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "urlAddresses"));
      v29 = _NSConcreteStackBlock;
      v30 = 3221225472;
      v31 = sub_1005AD3B0;
      v32 = &unk_1011BC650;
      v33 = v22;
      v34 = v9;
      v21 = v22;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", &v29);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v29, v30, v31, v32));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 1, 0));
      objc_msgSend(v21, "addAction:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "chromeViewController"));
      objc_msgSend(v28, "_maps_topMostPresentViewController:animated:completion:", v21, 1, 0);

    }
    goto LABEL_9;
  }
  ((void (*)(_QWORD *, void *))v9[2])(v9, v11);
LABEL_10:

}

- (void)viewController:(id)a3 presentCluster:(id)a4
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  LabelMarkerVenueCardItem *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a4;
  v5 = objc_msgSend(v34, "isCluster");
  v6 = v34;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "clusterFeatureAnnotations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    if (-[ActionCoordinator clusterIsPartOfVenues:](self, "clusterIsPartOfVenues:", v34))
    {
      v9 = -[LabelMarkerVenueCardItem initWithLabelMarker:]([LabelMarkerVenueCardItem alloc], "initWithLabelMarker:", v34);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));
      v12 = objc_opt_class(SimpleResultsViewController);
      isKindOfClass = objc_opt_isKindOfClass(v11, v12);

      if ((isKindOfClass & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
        objc_msgSend(v14, "popVenueCardItem:", 0);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      objc_msgSend(v15, "pushVenueCardItem:source:", v9, 5);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "viewControllerForCardItem:", v9));

      v18 = v17;
      v19 = objc_opt_class(SimpleResultsViewController);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        v20 = v18;
      else
        v20 = 0;
      v21 = v20;

      objc_msgSend(v21, "setContaineeDelegate:", self);
      objc_msgSend(v21, "setPreferredPresentationStyle:", 3);
      objc_msgSend(v21, "setResultsDelegate:", self);
      objc_msgSend(v21, "setCoordinator:", self);
      objc_msgSend(v21, "setEnableQuickActionMenu:", 1);
      objc_msgSend(v21, "setDisplayDistance:", 0);
      v22 = objc_msgSend(v21, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchInfo"));
      objc_msgSend(v21, "setCluster:sortAlphabetically:originalSearchInfo:", v34, 1, v24);

      -[ActionCoordinator presentSimpleList:](self, "presentSimpleList:", v21);
    }
    else
    {
      if ((objc_opt_respondsToSelector(v8, "searchResult") & 1) == 0)
      {
LABEL_14:

        v6 = v34;
        goto LABEL_15;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cluster"));

      if (v26 != v34)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
        objc_msgSend(v27, "clearCluster");

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      objc_msgSend(v28, "setDisplayDistance:", 1);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController currentLocation](self->_resultsViewController, "currentLocation"));
      objc_msgSend(v29, "updateCurrentLocation:isClusterResult:", v30, 1);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "searchInfo"));
      objc_msgSend(v31, "setCluster:sortAlphabetically:originalSearchInfo:", v34, 0, v33);

      v9 = (LabelMarkerVenueCardItem *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      -[ActionCoordinator presentSimpleList:](self, "presentSimpleList:", v9);
    }

    goto LABEL_14;
  }
LABEL_15:

}

- (void)showVLF
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  VLFContaineeViewController *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(VLFContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentViewController"));
    objc_msgSend(v7, "handleVLFPuckTapped");

  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1005ADAB0;
    v17[3] = &unk_1011AD4F0;
    objc_copyWeak(&v18, &location);
    v9 = objc_msgSend(v8, "showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:", self, self, v17);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userLocationView"));

      if ((objc_msgSend(v12, "isVLFBannerVisible") & 1) != 0)
        v13 = 2;
      else
        v13 = objc_msgSend(v12, "isVLFPuckVisible");
      v14 = -[VLFContaineeViewController initWithEntryPoint:]([VLFContaineeViewController alloc], "initWithEntryPoint:", v13);
      -[ContaineeViewController setContaineeDelegate:](v14, "setContaineeDelegate:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      objc_msgSend(v15, "presentController:", v14);

    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (BOOL)clusterIsPartOfVenues:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v6 = objc_msgSend(v5, "venueIdForCurrentCardStack");

  v20 = v6;
  if (v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterFeatureAnnotations"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v19 = v4;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation, v19))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchResult"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItem"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_venueInfo"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "venueIdentifier"));
            v17 = objc_msgSend(v16, "venueID");

            if (v17 != v20)
            {
              LOBYTE(v6) = 0;
              goto LABEL_13;
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          continue;
        break;
      }
      LOBYTE(v6) = 1;
LABEL_13:
      v4 = v19;
    }
    else
    {
      LOBYTE(v6) = 1;
    }

  }
  return (char)v6;
}

- (BOOL)viewController:(id)a3 shouldDisplayTransitSchedulesForMapItem:(id)a4 departureSequence:(id)a5
{
  return +[TransitSchedulesViewController shouldShowScheduleForTransitMapItem:sequence:](TransitSchedulesViewController, "shouldShowScheduleForTransitMapItem:sequence:", a4, a5);
}

- (void)viewController:(id)a3 displayTransitSchedulesForMapItem:(id)a4 departureSequence:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  TransitSchedulesViewController *v10;

  v7 = a5;
  v8 = a4;
  v10 = -[TransitSchedulesViewController initWithTransitMapItem:departureSequence:]([TransitSchedulesViewController alloc], "initWithTransitMapItem:departureSequence:", v8, v7);

  -[TransitSchedulesViewController setActionCoordinator:](v10, "setActionCoordinator:", self);
  -[ContaineeViewController setContaineeDelegate:](v10, "setContaineeDelegate:", self);
  -[TransitSchedulesViewController setTransitSchedulesDelegate:](v10, "setTransitSchedulesDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v10, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:useDefaultContaineeLayout:", v10, 1, 0);

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    -[RoutePlanningMapController setSelectCurrentRoute:](self->_routePlanningMapController, "setSelectCurrentRoute:", 0);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, -[ActionCoordinator currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)viewControllerPresentNearbyTransitDepartures:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id WeakRetained;
  _TtC4Maps27NearbyTransitViewController *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController", a3));
  v5 = sub_1002A8AA0(v4);

  if (v5 != 5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController")),
        v7 = objc_opt_class(_TtC4Maps27NearbyTransitViewController),
        isKindOfClass = objc_opt_isKindOfClass(v6, v7),
        v6,
        (isKindOfClass & 1) == 0))
  {
    v10 = -[NearbyTransitViewController initWithActionCoordinator:]([_TtC4Maps27NearbyTransitViewController alloc], "initWithActionCoordinator:", self);
    -[ContaineeViewController setContaineeDelegate:](v10, "setContaineeDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:useDefaultContaineeLayout:", v10, 1, 0);

  }
}

- (void)showNearbyTeachableMomentCard
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  id WeakRetained;
  unint64_t v14;
  id v15;
  void *v16;
  _TtC4Maps44NearbyTeachableMomentContaineeViewController *v17;
  uint8_t buf[2];
  __int16 v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(_TtC4Maps44NearbyTeachableMomentContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = sub_100431CEC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v19 = 0;
      v9 = "The Nearby teachable moment card is already visible; can't show twice";
      v10 = (uint8_t *)&v19;
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v14 = (unint64_t)objc_msgSend(WeakRetained, "containerStyle");

  if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    v15 = sub_10043214C();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v9 = "Not showing Nearby teachable moment card because the phone is in landscape";
      v10 = buf;
      v11 = v8;
      v12 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  v17 = objc_alloc_init(_TtC4Maps44NearbyTeachableMomentContaineeViewController);
  -[ContaineeViewController setContaineeDelegate:](v17, "setContaineeDelegate:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v16, "presentController:animated:", v17, 1);

}

- (void)viewController:(id)a3 displayTransitSchedulesForDepartureSequence:(id)a4 withTimeZone:(id)a5 scheduleWindowStartDate:(id)a6 includeAllDirections:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  TransitSchedulesViewController *v15;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v15 = -[TransitSchedulesViewController initWithDepartureSequence:timeZone:scheduleWindowStartDate:includeAllDirections:]([TransitSchedulesViewController alloc], "initWithDepartureSequence:timeZone:scheduleWindowStartDate:includeAllDirections:", v13, v12, v11, v7);

  -[TransitSchedulesViewController setActionCoordinator:](v15, "setActionCoordinator:", self);
  -[ContaineeViewController setContaineeDelegate:](v15, "setContaineeDelegate:", self);
  -[TransitSchedulesViewController setTransitSchedulesDelegate:](v15, "setTransitSchedulesDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v15, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:useDefaultContaineeLayout:", v15, 1, 0);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, -[ActionCoordinator currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
}

- (void)transitSchedulesViewController:(id)a3 wantsToShowInfoForLine:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v8 = sub_1002A8AA0(v7) != 5;

  -[ActionCoordinator viewController:selectTransitLineItem:zoomToMapRegion:](self, "viewController:selectTransitLineItem:zoomToMapRegion:", v9, v6, v8);
}

- (void)transitSchedulesViewController:(id)a3 wantsToDisplayIncidents:(id)a4 fromView:(id)a5
{
  -[ActionCoordinator viewController:openTransitIncidents:fromView:withUserInfo:](self, "viewController:openTransitIncidents:fromView:withUserInfo:", a3, a4, a5, 0);
}

- (void)incidentReportSubmissionContaineeDidFinish:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "popLastViewControllerAnimated:", 1);

}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NavTrafficIncidentReportSubmissionContaineeViewController *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[NavTrafficIncidentReportSubmissionContaineeViewController initWithItem:report:]([NavTrafficIncidentReportSubmissionContaineeViewController alloc], "initWithItem:report:", v7, v6);

  -[ContaineeViewController setContaineeDelegate:](v9, "setContaineeDelegate:", self);
  -[NavTrafficIncidentReportSubmissionContaineeViewController setReportingDelegate:](v9, "setReportingDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:useDefaultContaineeLayout:", v9, 1, 1);

}

- (void)viewController:(id)a3 presentMenuController:(id)a4 animated:(BOOL)a5 fromChrome:(BOOL)a6 completion:(id)a7
{
  void *v7;
  _BOOL4 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id WeakRetained;
  id v18;

  v9 = a6;
  v10 = a5;
  v18 = a3;
  v13 = a4;
  v14 = a7;
  v15 = v18;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "macMenuPresentationController"));
  objc_msgSend(v16, "setContainerViewController:", v15);

  if (v9)
  {

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:completion:", v13, v10, v14);

}

- (void)viewController:(id)a3 dismissMenuControllerAnimated:(BOOL)a4
{
  _BOOL8 v4;
  ControlContainerViewController **p_containerViewController;
  id v6;
  id WeakRetained;

  v4 = a4;
  p_containerViewController = &self->_containerViewController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(WeakRetained, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v6, v4, 0);

}

- (void)viewController:(id)a3 presentVenueFromAutoCompleteWithVenueIdentifier:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  VenueAutoCompleteSearchCardItem *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[VenueAutoCompleteSearchCardItem initWithVenueIdentifier:searchCategory:]([VenueAutoCompleteSearchCardItem alloc], "initWithVenueIdentifier:searchCategory:", v11, v10);

  -[ActionCoordinator viewController:presentVenueWithVenueCardItem:source:](self, "viewController:presentVenueWithVenueCardItem:source:", v12, v13, a6);
}

- (void)viewController:(id)a3 presentVenueForMapItem:(id)a4 searchCategory:(id)a5 source:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  VenueSearchCardItem *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[VenueSearchCardItem initWithMapItem:searchCategory:]([VenueSearchCardItem alloc], "initWithMapItem:searchCategory:", v11, v10);

  -[ActionCoordinator viewController:presentVenueWithVenueCardItem:source:](self, "viewController:presentVenueWithVenueCardItem:source:", v12, v13, a6);
}

- (void)viewController:(id)a3 presentVenueWithVenueCardItem:(id)a4 source:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id WeakRetained;
  id v19;

  v19 = a4;
  if (objc_msgSend(v19, "isVenueItem"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    objc_msgSend(v7, "pushVenueCardItem:source:", v19, a5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v8, "clearSelection");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v9, "clearLinkedPlacesAndPolygon");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v11 = sub_1002A8AA0(v10);

    if (v11 == 5)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
      objc_msgSend(v12, "presentVenueWithVenueCardItem:", v19);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllerForCardItem:", v19));

      v12 = v14;
      v15 = objc_opt_class(VenueCategoryViewController);
      if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
        v16 = v12;
      else
        v16 = 0;
      v17 = v16;

      objc_msgSend(v17, "setContaineeDelegate:", self);
      objc_msgSend(v17, "setDelegate:", self);
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(WeakRetained, "presentController:animated:useDefaultContaineeLayout:", v17, 1, 1);

    }
  }

}

- (void)viewController:(id)a3 presentPlacesWithPlacesCardItem:(id)a4 source:(unint64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  PlaceCategoryItem *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PlaceCategoryItem *v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v7, "clearSelection");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v8, "clearLinkedPlacesAndPolygon");

  v9 = [PlaceCategoryItem alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchCategory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v12 = objc_msgSend(v11, "_muid");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchCategory"));

  v15 = -[PlaceCategoryItem initWithSearchCategory:parentMuid:displayMode:](v9, "initWithSearchCategory:parentMuid:displayMode:", v10, v12, objc_msgSend(v13, "displayMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v15));
  -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v14, 0);

}

- (void)viewController:(id)a3 selectVenueSearchResult:(id)a4 source:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentResultsSearchInfo"));
  v12 = objc_msgSend(v11, "shouldInjectSearchResults");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v13, "selectAndShowSearchResult:animated:", v9, 1);

  }
  else
  {
    -[ActionCoordinator viewController:selectSearchResult:addToHistory:source:saveSelectionState:](self, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:", v8, v9, 1, a5, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    v15 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v13, "setSearchPins:selectedPin:animated:", v14, v9, 1);

  }
}

- (void)viewController:(id)a3 presentVenuesClusteredSearchResult:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005AECC8;
  v8[3] = &unk_1011BC6A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "popVenueCardItem:", v8);

}

- (void)closeVenueViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));

  if (v6 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
    objc_msgSend(v8, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v9, "clearSelection");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v10, "clearLinkedPlacesAndPolygon");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1005AEE54;
    v12[3] = &unk_1011BC6A0;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v11, "popVenueCardItem:", v12);

  }
}

- (void)viewController:(id)a3 presentVenueFloorCardViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v6, "presentController:animated:", v5, 1);

}

- (void)closeVenueFloorCardViewController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentViewController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  if (v5 == v7)
    objc_msgSend(v6, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v7, 1, 0);
  else
    objc_msgSend(v6, "removeControllerFromStack:", v7);

}

- (void)dismissLastVenuePlaceCard
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  v4 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v8, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v5, "clearSelection");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "removeControllerFromStack:", v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    objc_msgSend(v7, "popVenueCardItem:", 0);

  }
}

- (BOOL)shouldReusePlaceCardViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  return v6 == v4 || v5 == 0;
}

- (void)dismissPlaceCardViewController:(id)a3
{
  id v4;
  void *v5;
  PlaceCardViewController *placeCardViewController;

  if (self->_placeCardViewController == a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v5, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v4, 1, 0);

    placeCardViewController = self->_placeCardViewController;
    self->_placeCardViewController = 0;

  }
}

- (BOOL)shouldDismissPlaceCardOnClearMapSelection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));

  v5 = objc_opt_class(OfflineRegionSelectorContext);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_opt_class(OfflineMapsManagementContext);
    v6 = objc_opt_isKindOfClass(v4, v7) ^ 1;
  }

  return v6 & 1;
}

- (void)enterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  ControlContainerViewController **p_containerViewController;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  p_containerViewController = &self->_containerViewController;
  v14 = a4;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v18 = objc_loadWeakRetained((id *)p_containerViewController);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "chromeContext"));
  v20 = objc_msgSend(v17, "isTopContext:", v19);

  if (v20)
    -[ActionCoordinator _cancelUserInteractions](self, "_cancelUserInteractions");
  v21 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v21, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v15, v14, v10, x, y, width, height);

}

- (void)exitLookAround
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v2, "exitLookAround");

}

- (void)_cancelUserInteractions
{
  ControlContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = objc_msgSend(v5, "isUserInteractionEnabled");

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_containerViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);

    v12 = objc_loadWeakRetained((id *)p_containerViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);

  }
}

- (void)didRequestDirectionsForSharedTrip:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "destinationWaypointMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v3));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = MKLaunchOptionsDirectionsModeKey;
  v8 = MKLaunchOptionsDirectionsModeDefault;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  +[MKMapItem openMapsWithItems:launchOptions:completionHandler:](MKMapItem, "openMapsWithItems:launchOptions:completionHandler:", v5, v6, &stru_1011BC6C0);

}

- (void)didSelectStopWithMapItem:(id)a3
{
  id v4;
  PlaceCardItem *v5;
  void *v6;
  PlaceCardItem *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  PlaceCardItem *v11;

  v4 = a3;
  v5 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005AF8AC;
  v9[3] = &unk_1011AD238;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

}

- (void)closeSharedTripDetail
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)closeStopDetail
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)presentAutosharingContactSearchWithContacts:(id)a3 selectionHandler:(id)a4
{
  id v6;
  ContactSearchViewController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v7 = -[ContactSearchViewController initWithInitialContacts:selectionHandler:]([ContactSearchViewController alloc], "initWithInitialContacts:selectionHandler:", v10, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v8, "setPresentedModally:", 1);

    -[ContaineeViewController setContaineeDelegate:](v7, "setContaineeDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v9, "presentController:animated:", v7, 1);

  }
}

- (void)deleteMarkedLocation:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager", a3));
  objc_msgSend(v3, "clearDroppedPin");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
  objc_msgSend(v4, "setCustomSearchResult:animated:shouldSelectOnMap:context:", 0, 1, 0, CFSTR("__internal_MapsDroppedPinContextSwipe"));

}

- (void)confirmDeleteCollections:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  ControlContainerViewController **p_containerViewController;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v22 = a4;
  p_containerViewController = &self->_containerViewController;
  v14 = a6;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController _maps_confirmationAlertControllerForDeletingCollections:userInterfaceIdiom:completion:](UIAlertController, "_maps_confirmationAlertControllerForDeletingCollections:userInterfaceIdiom:completion:", v15, objc_msgSend(v17, "userInterfaceIdiom"), v14));

  if (v22)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "popoverPresentationController"));
    objc_msgSend(v19, "setSourceView:", v22);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "popoverPresentationController"));
    objc_msgSend(v20, "setSourceRect:", x, y, width, height);

  }
  v21 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v21, "_maps_topMostPresentViewController:animated:completion:", v18, 1, 0);

}

- (void)confirmDeleteSharedTripWithSummary:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  ControlContainerViewController **p_containerViewController;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v22 = a4;
  p_containerViewController = &self->_containerViewController;
  v14 = a6;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController _maps_confirmationAlertControllerForBlockingTripInSummary:userInterfaceIdiom:completion:](UIAlertController, "_maps_confirmationAlertControllerForBlockingTripInSummary:userInterfaceIdiom:completion:", v15, objc_msgSend(v17, "userInterfaceIdiom"), v14));

  if (v22)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "popoverPresentationController"));
    objc_msgSend(v19, "setSourceView:", v22);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "popoverPresentationController"));
    objc_msgSend(v20, "setSourceRect:", x, y, width, height);

  }
  v21 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v21, "_maps_topMostPresentViewController:animated:completion:", v18, 1, 0);

}

- (void)placeViewControllerViewContactsClosed
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v3, "clearSelection");

  v4 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005AFE74;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)containeeViewController:(id)a3 didCreateKeyboardProxy:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v6, "keyboardProxyViewCreated:", v5);

}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientIdentifier"));

  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("RidesharingStoreProductClientIdentifier"));
  if (a4 == 4)
  {
    if (v8)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rideOptionStateObserver"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "analyticsBookingSession"));
      objc_msgSend(v10, "setInstalledApp:", 1);

    }
  }
}

- (void)exit3dMode
{
  void *v3;
  void *v4;
  unsigned int v5;
  int64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  *(_WORD *)&self->_is3dModeSelected = 256;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v3, "_exit3DMode");

  if (!+[SettingsController deviceSupportsGlobe](SettingsController, "deviceSupportsGlobe"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController"));
    v5 = objc_msgSend(v4, "in3DMode");

    v6 = -[ActionCoordinator displayedViewMode](self, "displayedViewMode");
    if (v6 == 5 && !v5)
    {
      v7 = 1;
LABEL_10:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController"));
      objc_msgSend(v9, "setMapViewMode:animated:", v7, 0);

      goto LABEL_11;
    }
    if (v6 == 6)
      v8 = v5;
    else
      v8 = 1;
    if ((v8 & 1) == 0)
    {
      v7 = 2;
      goto LABEL_10;
    }
  }
LABEL_11:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 5010, -[ActionCoordinator currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v11, "refreshControls");

}

- (void)finishExitFrom3dMode
{
  self->_isExiting3dMode = 0;
}

- (void)select3dMode
{
  void *v3;
  unsigned int v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  v4 = objc_msgSend(v3, "_isPitched");

  if (v4)
  {
    -[ActionCoordinator exit3dMode](self, "exit3dMode");
    return;
  }
  if (!+[SettingsController deviceSupportsGlobe](SettingsController, "deviceSupportsGlobe"))
  {
    v5 = -[ActionCoordinator displayedViewMode](self, "displayedViewMode");
    if (v5 == 1)
    {
      v6 = 5;
      goto LABEL_8;
    }
    if (v5 == 2)
    {
      v6 = 6;
LABEL_8:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController"));
      objc_msgSend(v7, "setMapViewMode:animated:", v6, 0);

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 5009, -[ActionCoordinator currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v9, "_enter3DMode");

  self->_is3dModeSelected = 1;
}

- (int64_t)displayedViewMode
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = objc_msgSend(v3, "displayedViewMode");

  return (int64_t)v4;
}

- (void)setViewMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  id v9;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController"));
  v8 = objc_msgSend(v7, "bestMapViewModeForViewMode:", a3);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController"));
  objc_msgSend(v9, "setMapViewMode:animated:", v8, v4);

}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  objc_msgSend(v6, "updateViewMode:animated:preserveMapSelection:", a3, v4, 1);

}

- (void)chromeViewController:(id)a3 didUpdateViewMode:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;
  char *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  int64_t v22;
  void *v23;
  id v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  DirectionItem *currentDirectionItem;
  void *v33;
  unsigned int v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38[2];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));

  if (v8 == v6)
  {
    if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
      v10 = (char *)objc_msgSend(v9, "transportType");
      if (v10)
      {
        v11 = v10;
        switch(a4)
        {
          case -1:
            goto LABEL_18;
          case 0:
          case 1:
          case 2:
          case 5:
          case 6:
            if (v10 != (char *)3)
              break;
            if (a4 == 3)
            {
LABEL_18:
              if (a4 == 3)
                v18 = 3;
              else
                v18 = 1;
              if (a4 == -1)
                v19 = 0;
              else
                v19 = v18;
              v20 = sub_10043181C();
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                v22 = a4 + 1;
                if ((unint64_t)(a4 + 1) < 9 && ((0x1DFu >> v22) & 1) != 0)
                  v23 = *(&off_1011BC878 + v22);
                else
                  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a4));
                v24 = v23;
                v25 = v24;
                if ((unint64_t)(v11 - 2) > 3)
                  v26 = CFSTR("Drive");
                else
                  v26 = *(&off_1011BC8E0 + (_QWORD)(v11 - 2));
                v27 = (uint64_t)*(&off_1011BC8C0 + v19);
                *(_DWORD *)buf = 138543874;
                v40 = v24;
                v41 = 2114;
                v42 = v26;
                v43 = 2114;
                v44 = v27;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "view mode %{public}@ isn't supported by transport type %{public}@; will switch to default transport type %{public}@",
                  buf,
                  0x20u);

              }
              -[DirectionItem setTransportType:](self->_currentDirectionItem, "setTransportType:", v19);
              objc_msgSend(v9, "updateTransportType:", v19);
            }
            else
            {
LABEL_7:
              v12 = sub_10043181C();
              v13 = objc_claimAutoreleasedReturnValue(v12);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                if ((unint64_t)a4 < 8 && ((0xEFu >> a4) & 1) != 0)
                  v14 = *(&off_1011BC838 + a4);
                else
                  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a4));
                if ((unint64_t)(v11 - 2) > 3)
                  v28 = CFSTR("Drive");
                else
                  v28 = *(&off_1011BC8E0 + (_QWORD)(v11 - 2));
                *(_DWORD *)buf = 138543618;
                v40 = v14;
                v41 = 2114;
                v42 = v28;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "view mode %{public}@ isn't supported by transport type %{public}@; will attempt to replace the transport type",
                  buf,
                  0x16u);

              }
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "chromeViewController"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "defaultTransportTypeFinder"));

              objc_initWeak((id *)buf, self);
              currentDirectionItem = self->_currentDirectionItem;
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_1005B0730;
              v36[3] = &unk_1011BC6E8;
              objc_copyWeak(v38, (id *)buf);
              v38[1] = (id)a4;
              v37 = v9;
              objc_msgSend(v31, "transportTypeForDirectionItem:ignoreMapType:completion:", currentDirectionItem, 0, v36);

              objc_destroyWeak(v38);
              objc_destroyWeak((id *)buf);

            }
            break;
          case 3:
            if (v10 == (char *)3)
              break;
            goto LABEL_18;
          case 7:
            if (v10 != (char *)1 && v10 != (char *)4)
              goto LABEL_18;
            break;
          default:
            goto LABEL_7;
        }
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator settingsController](self, "settingsController"));
      v34 = objc_msgSend(v33, "userRequestingViewModeChange");

      if (v34)
        -[RoutePlanningMapController saveOriginalMapViewModeAs:](self->_routePlanningMapController, "saveOriginalMapViewModeAs:", a4);

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));
      v16 = objc_msgSend(v15, "isActive");

      if (a4 != 3 && v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));
        objc_msgSend(v17, "deactivateWithContext:", 0);

      }
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardViewController](self, "placeCardViewController"));
    objc_msgSend(v35, "updateForViewMode:", a4);

  }
}

- (void)setUserTrackingViewUserTrackingMode:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v4, "setUserTrackingMode:", a3);

}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4 postAlertSearchType:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interruptionManager"));
  objc_msgSend(v11, "displayAlertWithTitle:message:postAlertSearchType:", v9, v8, v5);

}

- (int)mapApplicationState
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  v5 = objc_msgSend(v4, "_applicationState");

  return v5;
}

- (void)updateMapApplicationState:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  objc_msgSend(v5, "_setApplicationState:", v3);

}

- (void)refreshCurrentSearch
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
  v4 = objc_opt_class(ResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    if (MapsFeature_IsEnabled_SearchAndDiscovery(v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
      objc_msgSend(v8, "setNeedsUpdateComponent:animated:", CFSTR("redoSearchButton"), 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      if (v9 != v10)
      {
        v16 = v11;
        v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));

        if (v16 != v12)
          return;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      }
      goto LABEL_8;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
    v14 = objc_opt_class(SearchViewController);
    v15 = objc_opt_isKindOfClass(v13, v14);

    if ((v15 & 1) == 0)
      return;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
LABEL_8:
  v17 = v11;
  objc_msgSend(v11, "refreshCurrentSearch");

}

- (BOOL)shouldShowSearchOverlay
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != (id)5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v11 = objc_opt_class(ResultsViewController);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v7 = v13;
    if ((isKindOfClass & 1) == 0)
    {
      v14 = objc_opt_class(SearchViewController);
      v15 = objc_opt_isKindOfClass(v7, v14);

      if ((v15 & 1) == 0)
        return 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      v7 = v13;
    }
    v9 = objc_msgSend(v13, "shouldShowSearchOverlay");
LABEL_17:

    return v9;
  }
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchInfo"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchRedoButtonThreshold"));
    if (v8 && (objc_msgSend(v7, "shouldAllowManualRedoButton") & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v7, "canRedoSearch"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchAutoRedoThreshold"));
      v9 = v16 != 0;

    }
    else
    {
      v9 = 0;
    }

    goto LABEL_17;
  }
  return 1;
}

- (void)updateHistoricalLocations
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  objc_msgSend(v2, "updateHistoricalLocations");

}

- (void)defaultZoom
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v3, "centerCoordinate");
  v5 = v4;
  v7 = v6;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v8, "setCenterCoordinate:zoomLevel:animated:", 1, v5, v7, 16.0);

}

- (void)zoomIn
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v3, "startLinearZoomIn:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v4, "stopZoomingWithInertia", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v5, "performSelector:withObject:afterDelay:", "stopZoomingWithInertia", 0, 0.3);

}

- (void)zoomOut
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v3, "startLinearZoomIn:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", v4, "stopZoomingWithInertia", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapView](self, "mapView"));
  objc_msgSend(v5, "performSelector:withObject:afterDelay:", "stopZoomingWithInertia", 0, 0.3);

}

- (void)actionControlDidDeactivate:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = objc_opt_class(TransitLineSelectionActionController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
    v9 = objc_opt_class(LineCardViewController);
    v10 = objc_opt_isKindOfClass(v8, v9);

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
      -[ActionCoordinator viewControllerClosed:animated:](self, "viewControllerClosed:animated:", v11, 1);

    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
    objc_msgSend(v12, "resetNearestStation");

  }
}

- (void)updateRedoSearchFloatingControl:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
  v6 = objc_opt_class(ResultsViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v8 = sub_1002A8AA0(WeakRetained);

    if (v8 != 5)
      return;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chromeViewController"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "redoSearchOverlay"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v11, "didUpdateSearchResults");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
  v15 = objc_msgSend(v14, "count");

  v16 = objc_loadWeakRetained((id *)&self->_containerViewController);
  if (sub_1002A8AA0(v16) != 5)
  {

LABEL_9:
    v17 = 1;
    objc_msgSend(v19, "shouldHideFloatingControl:animated:", 1, 1);
    goto LABEL_10;
  }

  v17 = 2;
  if (!a3)
  {
    v18 = v19;
    if (!v15)
      goto LABEL_11;
    goto LABEL_9;
  }
LABEL_10:
  v18 = v19;
LABEL_11:
  objc_msgSend(v18, "updateSearchOverlayWithState:", v17);

}

- (void)showAnnouncementForFlyover:(id)a3
{
  id v4;
  TopBannerItem *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  TopBannerItem *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  TopBannerItem *v19;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = [TopBannerItem alloc];
    v6 = objc_alloc((Class)NSAttributedString);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "announcement"));
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1011EB268;
    v10 = objc_msgSend(v6, "initWithString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Start"), CFSTR("localized string not found"), 0));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1005B1408;
    v16[3] = &unk_1011BC710;
    objc_copyWeak(&v17, &location);
    v13 = -[TopBannerItem initWithType:layout:userInfo:attributedString:icon:buttonText:buttonAction:](v5, "initWithType:layout:userInfo:attributedString:icon:buttonText:buttonAction:", 1, 0, v4, v10, 0, v12, v16);

    v19 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v15, "updateTopBannerViewWithTopBannerItems:", v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)searchSessionManagerSessionDidReceiveUpdate
{
  void *v3;

  -[ActionCoordinator updateResultsViewContent](self, "updateResultsViewContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v3, "setNeedsUserActivityUpdate");

  -[ActionCoordinator updateRedoSearchFloatingControl:](self, "updateRedoSearchFloatingControl:", 0);
}

- (BOOL)searchSessionShouldUpdateEVChargers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topMostPresentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
  v6 = objc_opt_class(v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  return isKindOfClass & 1;
}

- (void)searchSessionManagerReceiveEVChargersUpdate:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
  v5 = objc_opt_class(ResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
    objc_msgSend(v7, "refreshEVChargers:", v8);

  }
}

- (void)searchSessionManagerSessionDidInvalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  ResultsViewController *addStopResultsViewController;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  v5 = objc_opt_class(VenueCategoryViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentDownloader"));
  objc_msgSend(v8, "searchDidCancel");

  v15 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
  if (v15 == v9)
  {

LABEL_9:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController presentingViewController](self->_addStopResultsViewController, "presentingViewController"));

    if (v13)
    {
      addStopResultsViewController = self->_addStopResultsViewController;
    }
    else
    {
      -[ResultsViewController searchDidCancel:](self->_resultsViewController, "searchDidCancel:", 1);
      addStopResultsViewController = self->_resultsViewController;
    }
    -[ActionCoordinator containeeViewControllerGoToPreviousState:withSender:](self, "containeeViewControllerGoToPreviousState:withSender:", addStopResultsViewController, 0);
    return;
  }
  if ((MapsFeature_IsEnabled_SearchAndDiscovery(v15) & 1) == 0)
  {

    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v11 = objc_opt_class(SearchViewController);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
    goto LABEL_9;
}

- (void)searchSessionManagerSessionDidFail
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  -[ActionCoordinator updateResultsViewContent](self, "updateResultsViewContent");
  -[ActionCoordinator updateRedoSearchFloatingControl:](self, "updateRedoSearchFloatingControl:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  v5 = objc_opt_class(VenueCategoryViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentDownloader"));
  objc_msgSend(v8, "searchDidFail");

}

- (void)updateFloatingControlsWithSearchSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "floatingControlsPresentationController"));
  objc_msgSend(v5, "setSearchSession:", v4);

}

- (void)updateResultsViewContent
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
  v4 = objc_opt_class(ResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator resultsViewController](self, "resultsViewController"));
    objc_msgSend(v6, "updateSearchSession");

  }
}

- (void)presentLPRWithVehicle:(id)a3 scenario:(int64_t)a4 presenter:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  LPRFlowController *v12;
  LPRFlowController *lprOnboardingController;
  LPRFlowController *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(LPRFlowController);
  lprOnboardingController = self->_lprOnboardingController;
  self->_lprOnboardingController = v12;

  v14 = self->_lprOnboardingController;
  if (v10)
  {
    -[LPRFlowController presentLPRFlowWithVehicle:scenario:presenter:completionBlock:](self->_lprOnboardingController, "presentLPRFlowWithVehicle:scenario:presenter:completionBlock:", v16, a4, v10, v11);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    -[LPRFlowController presentLPRFlowWithVehicle:scenario:presenter:completionBlock:](v14, "presentLPRFlowWithVehicle:scenario:presenter:completionBlock:", v16, a4, v15, v11);

  }
}

- (void)retainSearchQueryForSelectedSearchResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "retainSearchQueryForSelectedSearchResult:", v4);

}

- (void)updateSearchFieldWithSearchFieldItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "updateSearchFieldWithItem:", v4);

}

- (void)receivedVenueEVChargersUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
    objc_msgSend(v6, "venueDidReceiveEVChargersUpdate:", v13);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));

    v8 = objc_opt_class(VenueCategoryViewController);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
      v9 = v6;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentDownloader"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentDownloader"));
        objc_msgSend(v12, "searchDidReceiveEVChargerUpdates:", v13);

      }
    }
    else
    {
      v6 = 0;
    }
  }

}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == (id)5)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
    objc_msgSend(v12, "handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:", v22, v9, v8);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topViewController"));

    v15 = objc_opt_class(VenueCategoryViewController);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v12 = v16;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
    -[VenuesManager displayFloorForSelectedSearchResult:](self->_venuesManager, "displayFloorForSelectedSearchResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venueCategoryItem"));

    v19 = objc_msgSend(v18, "isAutoCompleteCategory");
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentDownloader"));
      objc_msgSend(v20, "searchDidReceiveAutoCompleteSubcategories:", v8);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentDownloader"));
    objc_msgSend(v21, "searchDidReceiveResults:", v22);

    v9 = (id)v17;
  }

}

- (void)routePlanningDataCoordinator:(id)a3 isEnabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSession"));

    v8 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "directionItemForCurrentSession"));
    if (!-[DirectionItem isEquivalentAsWaypointToDirectionItem:](self->_currentDirectionItem, "isEquivalentAsWaypointToDirectionItem:", v11))objc_storeStrong((id *)&self->_currentDirectionItem, v11);
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
      -[ActionCoordinator _enterRoutePlanningOverviewAnimated:saveMapCamera:completion:](self, "_enterRoutePlanningOverviewAnimated:saveMapCamera:completion:", 1, objc_msgSend(v12, "shouldRestoreCamera"), 0);

    }
    else
    {
      -[ActionCoordinator _enterRoutePlanningOverviewAnimated:completion:](self, "_enterRoutePlanningOverviewAnimated:completion:", 1, 0);
    }

    goto LABEL_13;
  }
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    -[ActionCoordinator closeRoutePlanningViewController:withSender:](self, "closeRoutePlanningViewController:withSender:", v10, 0);
LABEL_13:

  }
}

- (void)_enterRoutePlanningOverviewAnimated:(BOOL)a3 completion:(id)a4
{
  -[ActionCoordinator _enterRoutePlanningOverviewAnimated:saveMapCamera:completion:](self, "_enterRoutePlanningOverviewAnimated:saveMapCamera:completion:", a3, 0, a4);
}

- (void)_enterRoutePlanningOverviewAnimated:(BOOL)a3 saveMapCamera:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id WeakRetained;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  MapSelectionManagerState *v24;
  MapSelectionManagerState *v25;
  MapSelectionManagerState *routePlanningSelectionRestorationState;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  RouteSearchViewController *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  id v51;
  NSObject *v52;
  ActionCoordinator *v53;
  ActionCoordinator *v54;
  objc_class *v55;
  NSString *v56;
  void *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  int64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  RouteSearchViewController *v73;
  RouteSearchViewController *routeSearchVC;
  RouteSearchViewController *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  unsigned int v86;
  uint64_t v87;
  char isKindOfClass;
  void *v89;
  void *v90;
  id v91;
  id v92;
  unsigned int v93;
  unsigned int v94;
  _QWORD v95[5];
  uint8_t buf[4];
  _BYTE v97[10];
  _BYTE v98[10];
  __int16 v99;
  _BOOL4 v100;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = sub_10043214C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349568;
    *(_QWORD *)v97 = self;
    *(_WORD *)&v97[8] = 1024;
    *(_DWORD *)v98 = v6;
    *(_WORD *)&v98[4] = 1024;
    *(_DWORD *)&v98[6] = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] _enterRoutePlanningOverviewAnimated: %d, saveMapCamera: %d", buf, 0x18u);
  }

  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewController](self, "routePlanningOverviewViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));

  v13 = sub_10043214C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_retainBlock(v8);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v97 = v6;
    *(_WORD *)&v97[4] = 1024;
    *(_DWORD *)&v97[6] = v5;
    *(_WORD *)v98 = 2112;
    *(_QWORD *)&v98[2] = v15;
    v99 = 1024;
    v100 = v12 != v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_enterRoutePlanningOverviewAnimated: %d saveMapCamera: %d completion: %@ presentOverview: %d", buf, 0x1Eu);

  }
  if (v12 != v11 && !-[DirectionItem isVenueItem](self->_currentDirectionItem, "isVenueItem"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v17 = objc_opt_class(PlaceCardViewController);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      v19 = v6;
      v20 = sub_1002A8AA0(WeakRetained);

      v21 = v20 == 5;
      v6 = v19;
      if (!v21)
      {
        v22 = sub_10043214C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "_enterRoutePlanningOverviewAnimated, saving selection state", buf, 2u);
        }

        v24 = (MapSelectionManagerState *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
        v25 = (MapSelectionManagerState *)objc_claimAutoreleasedReturnValue(-[MapSelectionManagerState selectionStateIncludingCamera:includeNotCustomLabelMarkers:](v24, "selectionStateIncludingCamera:includeNotCustomLabelMarkers:", v5, 1));
        routePlanningSelectionRestorationState = self->_routePlanningSelectionRestorationState;
        self->_routePlanningSelectionRestorationState = v25;

        goto LABEL_18;
      }
    }
    else
    {

    }
  }
  v24 = (MapSelectionManagerState *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
  v27 = objc_claimAutoreleasedReturnValue(-[MapSelectionManagerState previousSession](v24, "previousSession"));
  if (!v27)
  {
LABEL_18:

    goto LABEL_19;
  }
  v28 = (void *)v27;
  v93 = v6;
  v91 = v8;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "previousSession"));
  v31 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
  {
LABEL_17:

    v8 = v91;
    v6 = v93;
    goto LABEL_18;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "previousSession"));
  v34 = objc_opt_class(MapsRouteCreationContext);
  if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
  {

    goto LABEL_17;
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
  v90 = v12;
  v62 = v11;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "previousSession"));
  v64 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v63, v64);

  v11 = v62;
  v12 = v90;

  v8 = v91;
  v6 = v93;
  if ((isKindOfClass & 1) == 0)
  {
    v65 = sub_10043214C();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "_enterRoutePlanningOverviewAnimated, deleting selection state", buf, 2u);
    }

    v24 = self->_routePlanningSelectionRestorationState;
    self->_routePlanningSelectionRestorationState = 0;
    goto LABEL_18;
  }
LABEL_19:
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v36 = (unint64_t)-[ActionCoordinator displayedViewMode](self, "displayedViewMode") + 1;
  if (v36 > 7)
    v37 = 1;
  else
    v37 = dword_100E392C8[v36];
  v38 = sub_100B3A5D4();
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend(v39, "setMapType:", v37);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  objc_msgSend(v40, "updateMapsSuggestionsSignalForMapType:", v37);

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v41 = 0;
  }
  else
  {
    v42 = (RouteSearchViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v41 = v42 == self->_routeSearchVC;

  }
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    goto LABEL_47;
  v89 = v12;
  v43 = v11;
  v44 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v45 = sub_1002A8AA0(v44);

  if (v45 == 5)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
    objc_msgSend(v46, "closeSharedTrips");

    -[ActionCoordinator clearSearch](self, "clearSearch");
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topMostPresentedViewController"));
  v49 = objc_opt_class(SFSafariViewController);
  v50 = objc_opt_isKindOfClass(v48, v49);

  if ((v50 & 1) != 0)
  {
    v94 = v6;
    v51 = sub_1004319DC();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
LABEL_43:

      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_1005B271C;
      v95[3] = &unk_1011AC860;
      v95[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v95);
      v6 = v94;
      goto LABEL_44;
    }
    v92 = v8;
    v53 = self;
    v54 = v53;
    if (!v53)
    {
      v60 = CFSTR("<nil>");
      goto LABEL_42;
    }
    v55 = (objc_class *)objc_opt_class(v53);
    v56 = NSStringFromClass(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    if ((objc_opt_respondsToSelector(v54, "accessibilityIdentifier") & 1) != 0)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator performSelector:](v54, "performSelector:", "accessibilityIdentifier"));
      v59 = v58;
      if (v58 && !objc_msgSend(v58, "isEqualToString:", v57))
      {
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v57, v54, v59));

        goto LABEL_36;
      }

    }
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v57, v54));
LABEL_36:

LABEL_42:
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](v54, "containerViewController"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topMostPresentedViewController"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v97 = v60;
    *(_WORD *)&v97[8] = 2112;
    *(_QWORD *)v98 = v68;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@] Need to present a RoutePlanning VC but there is an SFSafariViewController (%@) present. Dismissing it first.", buf, 0x16u);

    v8 = v92;
    goto LABEL_43;
  }
LABEL_44:
  -[ActionCoordinator setIsRoutePlanningPresented:](self, "setIsRoutePlanningPresented:", 1);
  v69 = -[ActionCoordinator displayedViewMode](self, "displayedViewMode");
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningMapController](self, "routePlanningMapController"));
  objc_msgSend(v70, "saveOriginalMapViewModeAs:", v69);

  objc_msgSend(v35, "refreshRidesharingOptionsIfVisible");
  v71 = objc_loadWeakRetained((id *)&self->_containerViewController);
  v72 = sub_1002A8AA0(v71);

  v11 = v43;
  if (v72 == 5)
    objc_msgSend(v35, "refreshVirtualGarage");
  objc_msgSend(v35, "setupDataForCurrentObservers");
  v12 = v89;
LABEL_47:
  if (v12 == v11)
  {
    -[ActionCoordinator _setRouteSelectionMapState](self, "_setRouteSelectionMapState");
    goto LABEL_59;
  }
  v73 = (RouteSearchViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  routeSearchVC = self->_routeSearchVC;

  if (v73 == routeSearchVC)
  {
    v75 = self->_routeSearchVC;
    self->_routeSearchVC = 0;

  }
  -[ActionCoordinator _setRouteSelectionMapState](self, "_setRouteSelectionMapState");
  if (v41)
  {
    v76 = v11;
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsHistoryRecordingHelper destinationGEOMapItemToRecordWithDirectionItem:](DirectionsHistoryRecordingHelper, "destinationGEOMapItemToRecordWithDirectionItem:", self->_currentDirectionItem));
    if (v77)
      +[HistoryEntryRecentsItem saveGeoMapItem:](HistoryEntryRecentsItem, "saveGeoMapItem:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "currentViewController"));
    objc_msgSend(v78, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v80, v6, 0);

    v11 = v76;
  }
  v81 = objc_loadWeakRetained((id *)&self->_containerViewController);
  if (sub_1002A8AA0(v81) == 5 && !objc_msgSend(v35, "desiredTransportType"))
  {
    v83 = objc_msgSend(v35, "requestState");

    if (v83)
      goto LABEL_57;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "chromeViewController"));
    v81 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "defaultTransportTypeFinder"));

    v86 = objc_msgSend(v81, "geoIdealTransportTypeForOrigin:destination:ignoreMapType:", 0, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude)- 1;
    if (v86 > 5)
      v87 = 1;
    else
      v87 = qword_100E392E8[v86];
    objc_msgSend(v35, "updateTransportType:", v87);
  }

LABEL_57:
  v82 = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(v82, "presentController:animated:useDefaultContaineeLayout:completion:", v11, v6, 1, v8);

LABEL_59:
}

- (void)exitRoutePlanningIfNeededAnimated:(BOOL)a3
{
  -[ActionCoordinator _exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:](self, "_exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:", a3, 0);
}

- (void)_exitRoutePlanningIfNeededAnimated:(BOOL)a3 restoreStashedMapSelection:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MapSelectionManagerState *v18;
  void *v19;
  id WeakRetained;
  uint64_t v21;
  id v22;
  NSObject *v23;
  MapSelectionManagerState *routePlanningSelectionRestorationState;
  int v25;
  ActionCoordinator *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;

  v4 = a4;
  v5 = a3;
  v7 = sub_10043214C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v25 = 134349568;
    v26 = self;
    v27 = 1024;
    v28 = v5;
    v29 = 1024;
    v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] _exitRoutePlanningIfNeededAnimated: %d, restoreStashedMapSelection: %d", (uint8_t *)&v25, 0x18u);
  }

  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    -[ActionCoordinator clearSearchIfOriginatedFromWaypointEditor](self, "clearSearchIfOriginatedFromWaypointEditor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resolvedWaypointSet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destination"));

    -[ActionCoordinator _cleanupRoutePlanningIfNeededAnimated:](self, "_cleanupRoutePlanningIfNeededAnimated:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewController](self, "routePlanningOverviewViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController"));

    if (v13 == v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
      objc_msgSend(v16, "popVenueCardItem:", 0);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v17, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v12, v5, 0);

    if (!v4)
      goto LABEL_12;
    v18 = self->_routePlanningSelectionRestorationState;
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
      objc_msgSend(v19, "restoreSelectionState:animated:", v18, v5);

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      v21 = sub_1002A8AA0(WeakRetained);

      if (v21 != 5)
      {
LABEL_11:

LABEL_12:
        v22 = sub_10043214C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v25) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "_exitRoutePlanningIfNeededAnimated, deleting selection state", (uint8_t *)&v25, 2u);
        }

        routePlanningSelectionRestorationState = self->_routePlanningSelectionRestorationState;
        self->_routePlanningSelectionRestorationState = 0;

        return;
      }
    }
    -[ActionCoordinator viewController:selectLastDirectionsDestinationComposedWaypoint:](self, "viewController:selectLastDirectionsDestinationComposedWaypoint:", 0, v11);
    goto LABEL_11;
  }
}

- (void)_cleanupRoutePlanningIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    -[ActionCoordinator setIsRoutePlanningPresented:](self, "setIsRoutePlanningPresented:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSession"));
    v7 = objc_opt_class(NavigationSession);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

    if ((isKindOfClass & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningMapController](self, "routePlanningMapController"));
      objc_msgSend(v9, "clearMapState:", v3);

      -[RoutePlanningMapController restoreOriginalMapViewMode:](self->_routePlanningMapController, "restoreOriginalMapViewMode:", v3);
      -[ActionCoordinator updateMapApplicationState:](self, "updateMapApplicationState:", 0);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    objc_msgSend(v10, "stop");

    v12 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
    objc_msgSend(v11, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

  }
}

- (void)_setRouteSelectionMapState
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  v4 = objc_msgSend(v3, "hasSelection");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v5, "clearSelection");

  }
  -[ActionCoordinator updateMapApplicationState:](self, "updateMapApplicationState:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningMapController](self, "routePlanningMapController"));
  objc_msgSend(v6, "setSelectCurrentRoute:", 1);

}

- (void)routePlanningUpdatedWaypoints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    v17 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));
    v7 = objc_opt_class(RoutePlanningTimingViewController);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

    v4 = v17;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentViewController"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "origin"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoMapItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timezone"));
      objc_msgSend(v10, "setOriginTimeZone:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "destination"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geoMapItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timezone"));
      objc_msgSend(v10, "setDestinationTimeZone:", v16);

      v4 = v17;
    }
  }

}

- (void)presentRoutePlanningViewType:(int64_t)a3
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  RoutePlanningEbikeOptionsViewController *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  RoutePlanningEbikeOptionsViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  int64_t v34;

  v5 = sub_10043214C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v34 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "presentRoutePlanningViewType: %ld", buf, 0xCu);
  }

  switch(a3)
  {
    case 0:
      -[ActionCoordinator _enterRoutePlanningOverviewAnimated:completion:](self, "_enterRoutePlanningOverviewAnimated:completion:", 1, 0);
      return;
    case 1:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeSearchVC](self, "routeSearchVC"));
      objc_msgSend(v9, "setPauseSelectionUpdates:", 1);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1005B3100;
      v31[3] = &unk_1011AE8F8;
      v10 = v9;
      v32 = v10;
      v7 = objc_retainBlock(v31);
      objc_msgSend(v10, "updateFieldsWithCurrentDirectionItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if (v13 != (id)5)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        objc_msgSend(v28, "removeControllerFromStack:", v10);

        v8 = (RoutePlanningEbikeOptionsViewController *)v10;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        objc_msgSend(v29, "captureUserAction:onTarget:eventValue:", 3006, -[ActionCoordinator currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

        break;
      }
      if (-[DirectionItem transportType](self->_currentDirectionItem, "transportType"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
        objc_msgSend(v14, "updateTransportType:", -[DirectionItem transportType](self->_currentDirectionItem, "transportType"));

      }
      -[ActionCoordinator _enterRoutePlanningOverviewAnimated:completion:](self, "_enterRoutePlanningOverviewAnimated:completion:", 1, v7);

      return;
    case 2:
      v15 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeStepsVC](self, "routeStepsVC"));
      goto LABEL_15;
    case 3:
      v15 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator timePickingVC](self, "timePickingVC"));
      goto LABEL_15;
    case 4:
      v15 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeOptionsVC](self, "routeOptionsVC"));
      goto LABEL_15;
    case 5:
      v15 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator incidentsVC](self, "incidentsVC"));
      goto LABEL_15;
    case 6:
      v15 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator routingAppsVC](self, "routingAppsVC"));
LABEL_15:
      v8 = (RoutePlanningEbikeOptionsViewController *)v15;
      goto LABEL_16;
    case 7:
      v8 = (RoutePlanningEbikeOptionsViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator autosharingVC](self, "autosharingVC"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self->_platformController, "currentSession"));
      v21 = objc_opt_class(RoutePlanningSession);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
        v22 = v20;
      else
        v22 = 0;
      v23 = v22;

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "automaticSharingContacts"));
      if (v24)
        v25 = v24;
      else
        v25 = &__NSArray0__struct;
      -[RoutePlanningEbikeOptionsViewController setContacts:](v8, "setContacts:", v25);

      goto LABEL_16;
    case 8:
      v26 = [RoutePlanningEbikeOptionsViewController alloc];
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1005B312C;
      v30[3] = &unk_1011BC0B8;
      v30[4] = self;
      v8 = -[RoutePlanningOptionsViewController initWithDataCoordinator:automaticallySaveChanges:completionHandler:](v26, "initWithDataCoordinator:automaticallySaveChanges:completionHandler:", v27, 0, v30);

LABEL_16:
      v7 = 0;
      break;
    default:
      v7 = 0;
      v8 = 0;
      break;
  }
  if (-[RoutePlanningEbikeOptionsViewController modalPresentationStyle](v8, "modalPresentationStyle") == (id)7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEbikeOptionsViewController popoverPresentationController](v8, "popoverPresentationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));

    if (!v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEbikeOptionsViewController popoverPresentationController](v8, "popoverPresentationController"));
      objc_msgSend(v18, "setDelegate:", self);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v19, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v19, "presentController:animated:completion:", v8, 1, v7);
  }

}

- (void)refreshRoutePlanningTimingIfNeeded
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentOrPendingViewController"));

  v4 = objc_opt_class(RoutePlanningTimingViewController);
  isKindOfClass = objc_opt_isKindOfClass(v12, v4);
  v6 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v12;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeCollection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRoute"));

    if (v10)
      v11 = objc_msgSend(v10, "shouldShowSchedule");
    else
      v11 = 0;
    objc_msgSend(v7, "setShowArriveBy:animated:", v11, 1);

    v6 = v12;
  }

}

- (void)switchRoutePlanningTransportTypeToType:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  objc_msgSend(v4, "updateTransportType:", a3);

}

- (void)_carPlayWantsToDisplayEVOnboarding:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint8_t buf[4];
  NSObject *v22;

  v4 = a3;
  if (-[EVOnboardingController state](self->_vehicleOnboardingController, "state") < 1
    || -[EVOnboardingController state](self->_vehicleOnboardingController, "state") > 4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("EVOnboardingCarPlayVehicleKey")));
    if (v7 && (v8 = objc_opt_class(VGVehicle), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("EVOnboardingCarPlayDictionaryKey")));
      if (v9 && (v10 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
      {
        v11 = sub_10043173C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v7;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_carPlayWantsToDisplayEVOnboarding: will display onboarding for vehicle: %@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v20 = v7;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1005B356C;
        v17[3] = &unk_1011AD1E8;
        objc_copyWeak(&v19, (id *)buf);
        v9 = v9;
        v18 = v9;
        -[ActionCoordinator presentVehicleOnboardingWithVehicles:completion:](self, "presentVehicleOnboardingWithVehicles:completion:", v13, v17);

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v15 = sub_10043173C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "_carPlayWantsToDisplayEVOnboarding: Received invalid dictionaryKey object through notification: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v14 = sub_10043173C();
      v9 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "_carPlayWantsToDisplayEVOnboarding: Received invalid vehicle object through notification: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v5 = sub_10043173C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "_carPlayWantsToDisplayEVOnboarding: will not present another CP onboarding as we have already presented one.", buf, 2u);
    }
  }

}

- (void)presentEditNoteViewControllerWithInitialText:(id)a3 libraryAccessProvider:(id)a4 placeMUID:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id noteEditorCompletionBlock;
  _TtC4Maps27PlaceNoteEditViewController *v15;
  id v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, int, void *);
  void *v22;
  id v23;
  ActionCoordinator *v24;
  id v25;
  id v26[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_retainBlock(v12);
  noteEditorCompletionBlock = self->_noteEditorCompletionBlock;
  self->_noteEditorCompletionBlock = v13;

  v15 = -[PlaceNoteEditViewController initWithNote:]([_TtC4Maps27PlaceNoteEditViewController alloc], "initWithNote:", v10);
  objc_initWeak(&location, self);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1005B3718;
  v22 = &unk_1011BC738;
  objc_copyWeak(v26, &location);
  v16 = v11;
  v23 = v16;
  v24 = self;
  v26[1] = (id)a5;
  v17 = v10;
  v25 = v17;
  -[PlaceNoteEditViewController setDismissHandler:](v15, "setDismissHandler:", &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController", v19, v20, v21, v22));
  objc_msgSend(v18, "presentController:animated:", v15, 1);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

}

- (void)presentVehicleOnboardingWithVehicles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  ActionCoordinator *v10;
  ActionCoordinator *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  EVOnboardingController *v18;
  EVOnboardingController *vehicleOnboardingController;
  EVOnboardingController *v20;
  void *v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043173C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    v23 = v17;
    v24 = 2080;
    v25 = "-[ActionCoordinator presentVehicleOnboardingWithVehicles:completion:]";
    v26 = 2112;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s, vehicles: %@", buf, 0x20u);

  }
  v18 = -[EVOnboardingController initWithUnpairedVehicles:]([EVOnboardingController alloc], "initWithUnpairedVehicles:", v6);
  vehicleOnboardingController = self->_vehicleOnboardingController;
  self->_vehicleOnboardingController = v18;

  v20 = self->_vehicleOnboardingController;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  -[EVOnboardingController presentInViewController:animated:completion:](v20, "presentInViewController:animated:completion:", v21, 1, v7);

}

- (void)presentPreferredNetworksOnboardingForVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  ActionCoordinator *v7;
  ActionCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  PreferredNetworksOnboardingController *v15;
  PreferredNetworksOnboardingController *preferredNetworksOnboardingController;
  PreferredNetworksOnboardingController *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  v4 = a3;
  v5 = sub_10043173C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    v20 = v14;
    v21 = 2080;
    v22 = "-[ActionCoordinator presentPreferredNetworksOnboardingForVehicle:]";
    v23 = 2112;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s, vehicle: %@", buf, 0x20u);

  }
  v15 = -[PreferredNetworksOnboardingController initWithVehicle:]([PreferredNetworksOnboardingController alloc], "initWithVehicle:", v4);
  preferredNetworksOnboardingController = self->_preferredNetworksOnboardingController;
  self->_preferredNetworksOnboardingController = v15;

  v17 = self->_preferredNetworksOnboardingController;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  -[PreferredNetworksOnboardingController presentInViewController:animated:completion:](v17, "presentInViewController:animated:completion:", v18, 1, 0);

}

- (void)_presentMacRouteEditingWithEditRequired:(unint64_t)a3 index:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  -[ActionCoordinator presentRoutePlanningViewType:](self, "presentRoutePlanningViewType:", 1);
  if (a3)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[DirectionItem items](self->_currentDirectionItem, "items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeSearchVC](self, "routeSearchVC"));
    objc_msgSend(v7, "updateWithItems:", v9);

    if ((unint64_t)objc_msgSend(v9, "count") > a4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeSearchVC](self, "routeSearchVC"));
      objc_msgSend(v8, "selectFieldIndex:", a4);

    }
  }
}

- (void)closeRoutePlanningViewController:(id)a3 withSender:(id)a4
{
  RouteIncidentsViewController *v6;
  RouteIncidentsViewController *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  RouteIncidentsViewController *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char isKindOfClass;
  id v22;
  NSObject *v23;
  const char *v24;
  id v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[12];
  __int16 v46;
  RouteIncidentsViewController *v47;

  v6 = (RouteIncidentsViewController *)a3;
  v7 = (RouteIncidentsViewController *)a4;
  v8 = sub_10043214C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v45 = 138412546;
    *(_QWORD *)&v45[4] = v6;
    v46 = 2112;
    v47 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "closeRoutePlanningViewController: %@ sender: %@", v45, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
  if (objc_msgSend(v11, "userInterfaceIdiom") != (id)5)
  {

LABEL_7:
    v13 = (RouteIncidentsViewController *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));

    if (v13 != v6)
    {
      v14 = sub_10043214C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
        *(_DWORD *)v45 = 138412546;
        *(_QWORD *)&v45[4] = v16;
        v46 = 2112;
        v47 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Aborting closing route planning as %@ does not equal %@", v45, 0x16u);

      }
LABEL_42:

      goto LABEL_43;
    }
    v17 = objc_opt_class(UIKeyCommand);
    if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteIncidentsViewController presentedViewController](v6, "presentedViewController"));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 1, 0);

        goto LABEL_43;
      }
    }
    v15 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewControllerIfLoaded](self, "routePlanningOverviewViewControllerIfLoaded"));
    if (v15)
    {
      v20 = objc_opt_class(RoutePlanningOverviewViewController);
      isKindOfClass = objc_opt_isKindOfClass(v6, v20);
      if (v15 == v6 || (isKindOfClass & 1) == 0)
        goto LABEL_22;
      v22 = sub_10043214C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v45 = 0;
        v24 = "The overview VC does not point to the current overview VC being dismissed";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, v45, 2u);
      }
    }
    else
    {
      v25 = sub_10043214C();
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v45 = 0;
        v24 = "The overview VC is not set at the point of closing";
        goto LABEL_20;
      }
    }

LABEL_22:
    v26 = objc_opt_class(RoutePlanningOverviewViewController);
    v27 = objc_opt_isKindOfClass(v6, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentSession"));
    if ((v27 & 1) != 0)
    {
      v30 = objc_opt_class(NavigationSession);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
      {
        v31 = 0;
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "previousSession"));
        v37 = objc_opt_class(NavigationSession);
        if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0)
          v31 = 0;
        else
          v31 = -[SearchViewController shouldRetainSearchQuery](self->_searchModeViewController, "shouldRetainSearchQuery") ^ 1;

      }
      -[ActionCoordinator _exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:](self, "_exitRoutePlanningIfNeededAnimated:restoreStashedMapSelection:", 1, v31);
    }
    else
    {
      v32 = objc_opt_class(RoutePlanningSession);
      v33 = objc_opt_isKindOfClass(v29, v32);

      if ((v33 & 1) != 0)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
        objc_msgSend(v34, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v6, 1, 0);
      }
      else
      {
        v38 = objc_opt_class(RouteStepsViewController);
        if ((objc_opt_isKindOfClass(v6, v38) & 1) != 0
          || (v39 = objc_opt_class(RoutePlanningTimingViewController),
              (objc_opt_isKindOfClass(v6, v39) & 1) != 0)
          || (v40 = objc_opt_class(RoutePlanningOptionsViewController),
              (objc_opt_isKindOfClass(v6, v40) & 1) != 0)
          || (v41 = objc_opt_class(RouteIncidentsViewController),
              (objc_opt_isKindOfClass(v6, v41) & 1) != 0))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController", *(_QWORD *)v45));
          objc_msgSend(v34, "popLastViewControllerAnimated:", 1);
        }
        else
        {
          v42 = -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented");
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
          if (v42)
            v43 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewController](self, "routePlanningOverviewViewController"));
          else
            v43 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeSearchVC](self, "routeSearchVC"));
          v44 = (void *)v43;
          objc_msgSend(v34, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v43, 1, 0, *(_QWORD *)v45);

        }
      }

    }
    if (self->_incidentsVC == v6)
      -[RouteIncidentsViewController resetForDismiss](v6, "resetForDismiss");
    if ((RouteIncidentsViewController *)self->_routeSearchVC == v6)
    {
      self->_routeSearchVC = 0;

    }
    goto LABEL_42;
  }
  v12 = -[RouteIncidentsViewController modalPresentationStyle](v6, "modalPresentationStyle");

  if (v12 != (id)7)
    goto LABEL_7;
  -[RouteIncidentsViewController dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_43:

}

- (void)setRoutePlanningIncidentsSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_incidentsVCSourceView, a3);
}

- (void)setRoutePlanningAdvisoriesInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator incidentsVC](self, "incidentsVC"));
  objc_msgSend(v5, "setAdvisoriesInfo:", v4);

}

- (void)setRoutePlanningAdvisory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator incidentsVC](self, "incidentsVC"));
  objc_msgSend(v5, "setAdvisory:", v4);

}

- (void)presentScheduleForStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TransitSchedulesViewController *v8;

  v4 = a3;
  v8 = -[TransitSchedulesViewController initWithTransitRouteStep:]([TransitSchedulesViewController alloc], "initWithTransitRouteStep:", v4);

  -[TransitSchedulesViewController setActionCoordinator:](v8, "setActionCoordinator:", self);
  -[ContaineeViewController setContaineeDelegate:](v8, "setContaineeDelegate:", self);
  -[TransitSchedulesViewController setTransitSchedulesDelegate:](v8, "setTransitSchedulesDelegate:", self);
  -[ControlContaineeViewController setDelegate:](v8, "setDelegate:", self);
  if (sub_1002A8AA0(v8) != 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v5, "setPresentedModally:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v6, "setTakesAvailableHeight:", 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v7, "presentController:animated:", v8, 1);

}

- (void)selectWaypointSearchFieldIndex:(unint64_t)a3 exitPlanningIfCancelTapped:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeSearchVC](self, "routeSearchVC"));
  objc_msgSend(v6, "setExitRoutePlanningOnCancel:", v4);
  objc_msgSend(v6, "selectFieldIndex:", a3);

}

- (void)ensureRoutePlanningContentIsVisible
{
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
    -[RoutePlanningMapController updateCameraIfPossible](self->_routePlanningMapController, "updateCameraIfPossible");
}

- (void)presentPOIEnrichmentInformedConsentWithPresentationContext:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005B448C;
  v9[3] = &unk_1011B2F88;
  v10 = v6;
  v8 = v6;
  +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:presentationContext:completion:](UGCInformedConsentViewController, "presentIfNeededWithPresentingViewController:presentationContext:completion:", v7, a3, v9);

}

- (void)addRatingsForMapItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:initialOverallState:entryPoint:originTarget:](UGCPOIEnrichmentCoordinator, "ratingsAndPhotosCoordinatorWithMapItem:initialOverallState:entryPoint:originTarget:", v6, 0, 0, CFSTR("SEARCH_TRAY")));
  objc_msgSend(v5, "setSubmissionStatusDelegate:", self);
  objc_msgSend(v5, "setPresentationContext:", 2);
  -[ActionCoordinator viewControllerPresentPOIEnrichmentWithCoordinator:](self, "viewControllerPresentPOIEnrichmentWithCoordinator:", v5);

}

- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4
{
  PlaceCardViewController *placeCardViewController;
  void (**v6)(id, id);
  id v7;

  placeCardViewController = self->_placeCardViewController;
  v6 = (void (**)(id, id))a4;
  -[ActionCoordinator dismissPlaceCardViewController:](self, "dismissPlaceCardViewController:", placeCardViewController);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v6[2](v6, v7);

}

- (void)poiEnrichmentCoordinatorDidFinish:(id)a3
{
  UGCPOIEnrichmentCoordinator *poiEnrichmentCoordinator;

  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = 0;

}

- (void)poiEnrichmentCoordinator:(id)a3 openURL:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentingViewController"));
  -[ActionCoordinator viewController:openURL:](self, "viewController:openURL:", v7, v6);

}

- (void)viewControllerPresentPOIEnrichmentWithCoordinator:(id)a3
{
  UGCPOIEnrichmentCoordinator **p_poiEnrichmentCoordinator;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  p_poiEnrichmentCoordinator = &self->_poiEnrichmentCoordinator;
  objc_storeStrong((id *)&self->_poiEnrichmentCoordinator, a3);
  -[UGCPOIEnrichmentCoordinator setDelegate:](self->_poiEnrichmentCoordinator, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentationDelegate](self->_poiEnrichmentCoordinator, "presentationDelegate"));

  if (!v6)
    -[UGCPOIEnrichmentCoordinator setPresentationDelegate:](self->_poiEnrichmentCoordinator, "setPresentationDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator placeCardDismissalDelegate](*p_poiEnrichmentCoordinator, "placeCardDismissalDelegate"));

  if (!v7)
    -[UGCPOIEnrichmentCoordinator setPlaceCardDismissalDelegate:](self->_poiEnrichmentCoordinator, "setPlaceCardDismissalDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator containerViewController](*p_poiEnrichmentCoordinator, "containerViewController"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    -[UGCPOIEnrichmentCoordinator setContainerViewController:](self->_poiEnrichmentCoordinator, "setContainerViewController:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator containeeDelegate](*p_poiEnrichmentCoordinator, "containeeDelegate"));

  if (!v10)
    -[UGCPOIEnrichmentCoordinator setContaineeDelegate:](self->_poiEnrichmentCoordinator, "setContaineeDelegate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentCoordinator presentingViewController](*p_poiEnrichmentCoordinator, "presentingViewController"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    -[UGCPOIEnrichmentCoordinator setPresentingViewController:](self->_poiEnrichmentCoordinator, "setPresentingViewController:", v12);

  }
  -[UGCPOIEnrichmentCoordinator present](*p_poiEnrichmentCoordinator, "present");

}

- (void)viewControllerShowPhotoCredit:(id)a3
{
  PhotoCreditViewController *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v4 = -[PhotoCreditViewController initWithCompletionHandler:]([PhotoCreditViewController alloc], "initWithCompletionHandler:", &stru_1011BC778);
  -[ContaineeViewController setContaineeDelegate:](v4, "setContaineeDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v6 = sub_1002A8AA0(v5);

  if (v6 == 5)
  {
    objc_msgSend(v8, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:animated:", v4, 1);

  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  id WeakRetained;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  id v28;

  y = a4.y;
  x = a4.x;
  v28 = a3;
  if (-[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
    v9 = objc_opt_class(TransitSchedulesViewController);
    isKindOfClass = objc_opt_isKindOfClass(v8, v9);

    if ((isKindOfClass & 1) == 0)
      -[RoutePlanningMapController didTapMapView:atPoint:](self->_routePlanningMapController, "didTapMapView:atPoint:", v28, x, y);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chromeViewController"));
  if ((objc_opt_respondsToSelector(v12, "mapViewShouldHandleTapToDeselect:") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
    v15 = objc_msgSend(v14, "mapViewShouldHandleTapToDeselect:", v28);

    if (!v15)
      goto LABEL_15;
  }
  else
  {

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  v17 = objc_msgSend(v16, "hasSelection");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "chromeViewController"));
    objc_msgSend(v19, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

    v20 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v20, "clearSelection");
LABEL_14:

    goto LABEL_15;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));
  v22 = objc_msgSend(v21, "isActive");

  if (v22)
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));
    objc_msgSend(v20, "deactivateWithContext:", 0);
    goto LABEL_14;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
  v25 = objc_opt_class(TransitLineDisambiguationViewController);
  v26 = objc_opt_isKindOfClass(v24, v25);

  if ((v26 & 1) != 0)
  {
    v20 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentViewController"));
    -[ActionCoordinator viewControllerClosed:animated:](self, "viewControllerClosed:animated:", v27, 1);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)deferPresentingMapPopoversInsideBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)pptTestPresentPlaceCardForSearchResult:(id)a3 animated:(BOOL)a4
{
  -[ActionCoordinator viewController:selectSearchResult:addToHistory:source:saveSelectionState:](self, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:", 0, a3, 1, 0, 1);
}

- (BOOL)pptTestCanResizePlacecard
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = objc_msgSend(WeakRetained, "containerStyle");

  return (((unint64_t)v3 - 2) & 0xFFFFFFFFFFFFFFFALL) != 0;
}

- (void)pptTestMaximizePlaceCardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "setLayoutIfSupported:animated:", 3, v3);

}

- (void)pptTestMinimizePlaceCardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "setLayoutIfSupported:animated:", 1, v3);

}

- (void)pptTestMediumizePlaceCardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "setLayoutIfSupported:animated:", 2, v3);

}

- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v4, "selectNearbyCategoryAtIndex:", a3);

}

- (void)pptTestSearchRetainQueryForSelectedSearchCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "retainSearchQueryForSelectedAutocompleteItem:forTimeInterval:", v4, 1.79769313e308);

}

- (void)pptTestAutocompleteSearchForFieldItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "updateSearchFieldWithItem:", v4);

}

- (void)pptTestSearchEndEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v2, "endEditing");

}

- (void)pptAssertSearch
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  if (v4 != (id)5)
  {
    v6 = v5;

    v5 = v6;
  }

}

- (void)pptTestSearchForFieldItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[ActionCoordinator pptAssertSearch](self, "pptAssertSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "sendAction:toTarget:fromSender:forEvent:", "resignFirstResponder", 0, 0, 0);

  -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
    objc_msgSend(v8, "pptSetSearchDataSource");

  }
}

- (void)pptTestEnterSearchMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  -[ActionCoordinator pptAssertSearch](self, "pptAssertSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v3, "pptSearchBarShouldProvideTextChangeNotification");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
  objc_msgSend(v5, "wantsLayout:", 3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v6, "searchBarBecomeFirstResponder");

}

- (void)pptTestSearchCancel
{
  id v3;

  -[ActionCoordinator pptAssertSearch](self, "pptAssertSearch");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___UISearchBarDelegate);
  objc_msgSend(v3, "searchBarCancelButtonClicked:", 0);

}

- (void)pptSelectFirstCuratedGuide
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v2, "pptSelectFirstCuratedCollection");

}

- (void)pptSelectACSuggestionMatchingAddress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v5, "pptSelectACSuggestionMatchingAddress:", v4);

}

- (void)pptSelectSeeAllCuratedCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v2, "pptSelectSeeAllCuratedCollections");

}

- (void)pptSelectFirstGuidePublisher
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  objc_msgSend(v2, "pptSelectFirstGuidePublisher");

}

- (void)pptTestCreateCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[SearchResult customSearchResultWithCoordinate:](SearchResult, "customSearchResultWithCoordinate:", a4, a3.latitude, a3.longitude));
  -[ActionCoordinator viewController:removeDroppedPin:](self, "viewController:removeDroppedPin:", 0, 0);
  -[ActionCoordinator viewController:createDroppedPin:](self, "viewController:createDroppedPin:", 0, v5);

}

- (void)pptTestPresentDirectionsDetails
{
  -[ActionCoordinator presentRoutePlanningViewType:](self, "presentRoutePlanningViewType:", 2);
}

- (UIViewController)pptTestContaineeForDirectionsDetails
{
  return (UIViewController *)self->_routeStepsVC;
}

- (UIScrollView)pptTestScrollViewForDirectionsDetails
{
  return -[RouteStepsViewController scrollViewForDirectionsDetailsOfCurrentRoute](self->_routeStepsVC, "scrollViewForDirectionsDetailsOfCurrentRoute");
}

- (void)pptTestDoDirectionItem:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  _UNKNOWN **v7;

  v6 = CFSTR("DirectionsSessionInitiatorKey");
  v7 = &off_10126DE40;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[ActionCoordinator viewController:doDirectionItem:withUserInfo:](self, "viewController:doDirectionItem:withUserInfo:", 0, v4, v5);

}

- (void)pptTestStartNavigation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewController](self, "routePlanningOverviewViewController"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestNavigationProtocol))
    objc_msgSend(v2, "pptTestStartNavigation");

}

- (void)pptTestOpenSettings
{
  -[ActionCoordinator viewControllerOpenSettings:](self, "viewControllerOpenSettings:", 0);
}

- (void)pptTestPresentPlacecardWithMapItem:(id)a3
{
  id v4;
  PlaceCardItem *v5;

  v4 = a3;
  v5 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v4);

  -[ActionCoordinator presentPlaceCardForItem:addToHistory:source:saveSelectionState:](self, "presentPlaceCardForItem:addToHistory:source:saveSelectionState:", v5, 0, 0, 1);
}

- (void)pptTestPresentVenueForMapItem:(id)a3 searchCategory:(id)a4
{
  -[ActionCoordinator viewController:presentVenueForMapItem:searchCategory:source:](self, "viewController:presentVenueForMapItem:searchCategory:source:", 0, a3, a4, 0);
}

- (void)pptTestSelectVenueSearchResult:(id)a3
{
  -[ActionCoordinator viewController:selectVenueSearchResult:source:](self, "viewController:selectVenueSearchResult:source:", 0, a3, 0);
}

- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
  -[ActionCoordinator enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:](self, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", a3, a4, a5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (int)currentUITargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (void)locationRefinementViewController:(id)a3 didSelectCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  uint64_t v7;
  void *v8;
  id v9;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3;
  v7 = objc_opt_class(MarkedLocationRefinementViewController);
  if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0)
  {
    -[ActionCoordinator viewController:createMarkedLocationAtCoordinate:floorOrdinal:](self, "viewController:createMarkedLocationAtCoordinate:floorOrdinal:", v9, 0x7FFFFFFFLL, latitude, longitude);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)markedLocationRefinementViewControllerSelectedRemoveMarkedLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalMarkedLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005B5440;
  v9[3] = &unk_1011AD238;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

}

- (void)markedLocationRefinementViewControllerDidCancel:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentingViewController"));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_prepareToReceiveDrop
{
  -[ActionCoordinator exitRoutePlanningIfNeededAnimated:](self, "exitRoutePlanningIfNeededAnimated:", 0);
  -[ActionCoordinator presentSearchAnimated:](self, "presentSearchAnimated:", 0);
}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapItem:(id)a4
{
  id v5;
  void *v6;
  SearchResult *v7;

  v5 = a4;
  -[ActionCoordinator _prepareToReceiveDrop](self, "_prepareToReceiveDrop");
  v7 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v7));
  -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v6, &__NSDictionary0__struct);

}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveVCard:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  AddressBookAddress *v8;
  void *v9;

  v5 = a4;
  -[ActionCoordinator _prepareToReceiveDrop](self, "_prepareToReceiveDrop");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "postalAddresses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (v7)
  {
    v8 = -[AddressBookAddress initWithContact:addressValue:]([AddressBookAddress alloc], "initWithContact:addressValue:", v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v8));
    -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v9, &__NSDictionary0__struct);

  }
  return v7 != 0;
}

- (BOOL)mapsDragDestinationHandler:(id)a3 didReceiveURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  v5 = a4;
  -[ActionCoordinator _prepareToReceiveDrop](self, "_prepareToReceiveDrop");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryPointsCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windowScene"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v14, "bounds");
  objc_msgSend(v7, "openURL:session:sceneOptions:mkOptions:windowSize:", v5, v12, 0, 0, v15, v16);

  return 1;
}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveString:(id)a4 nearCoordinate:(CLLocationCoordinate2D)a5
{
  double longitude;
  double latitude;
  id v8;
  SearchFieldItem *v9;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v8 = a4;
  -[ActionCoordinator _prepareToReceiveDrop](self, "_prepareToReceiveDrop");
  v9 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v9, "setSearchString:", v8);

  -[SearchFieldItem setCoordinateHint:](v9, "setCoordinateHint:", latitude, longitude);
  -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v9, &__NSDictionary0__struct);

}

- (void)mapsDragDestinationHandler:(id)a3 didReceiveMapKitHandle:(id)a4 title:(id)a5
{
  id v7;
  id v8;
  SearchFieldItem *v9;

  v7 = a5;
  v8 = a4;
  -[ActionCoordinator _prepareToReceiveDrop](self, "_prepareToReceiveDrop");
  v9 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setMapKitHandle:](v9, "setMapKitHandle:", v8);

  -[SearchFieldItem setMapKitHandleTitle:](v9, "setMapKitHandleTitle:", v7);
  -[ActionCoordinator viewController:doSearchItem:withUserInfo:](self, "viewController:doSearchItem:withUserInfo:", 0, v9, &__NSDictionary0__struct);

}

- (UIScrollView)pptTestScrollViewForProactive
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scrollViewForProactive"));

  return (UIScrollView *)v3;
}

- (void)pptTestOpenRecents
{
  -[ActionCoordinator viewControllerShowMyRecents:includeRecentSearches:](self, "viewControllerShowMyRecents:includeRecentSearches:", 0, 0);
}

- (void)pptTestOpenCollections
{
  -[ActionCoordinator viewControllerShowCollections:](self, "viewControllerShowCollections:", 0);
}

- (void)pptTestOpenFirstCollection
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));

  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestPresentCollectionProtocol))
    objc_msgSend(v3, "pptPresentFirstCollection");

}

- (BOOL)pptTestCanUpdateTrayLayout
{
  ControlContainerViewController **p_containerViewController;
  id WeakRetained;
  BOOL v4;
  id v5;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if (objc_msgSend(WeakRetained, "containeeLayout") == (id)5)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_containerViewController);
    v4 = objc_msgSend(v5, "containeeLayout") != (id)4;

  }
  return v4;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  ControlContainerViewController **p_containerViewController;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v4 = a4;
  if (a3 < 3)
    v6 = a3 + 1;
  else
    v6 = 0;
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v9 = objc_msgSend(WeakRetained, "containeeLayout");

  if (v9 == (id)v6)
  {
    v15[0] = CFSTR("ContainerLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
    v15[1] = CFSTR("ContainerContainee");
    v16[0] = v10;
    v11 = objc_loadWeakRetained((id *)p_containerViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentViewController"));
    v16[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), self, v13);

  }
  else
  {
    v14 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v14, "setLayoutIfSupported:animated:", v6, v4);

  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  uint64_t v9;

  switch(a3)
  {
    case 0:
      return 1;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v8 = objc_msgSend(v7, "userInterfaceIdiom");

      v9 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      v4 = (void *)v9;
      if (v8 == (id)5)
      {
        v6 = v9 == 0;
LABEL_11:

        return v6;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchModeViewController](self, "searchModeViewController"));
LABEL_10:
      v6 = v4 == v5;

      goto LABEL_11;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator placeCardViewController](self, "placeCardViewController"));
      goto LABEL_10;
  }
  return 0;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningOverviewViewControllerIfLoaded](self, "routePlanningOverviewViewControllerIfLoaded", a3, a4));
  v6 = objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  v7 = (void *)v6;
  if (v10 && (id)v6 == v10)
  {
    -[ActionCoordinator closeRoutePlanningViewController:withSender:](self, "closeRoutePlanningViewController:withSender:", v10, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "popLastViewControllerAnimated:", v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v9, "popLastViewControllerFromViewController:animated:useDefaultContaineeLayout:", v7, v4, 0);

  }
}

- (UIScrollView)pptTestScrollView
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));

  if ((objc_opt_respondsToSelector(v3, "pptTestScrollView") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pptTestScrollView"));
  else
    v4 = 0;

  return (UIScrollView *)v4;
}

- (void)didDismissViewController:(id)a3 mapItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v6, "selectMapItem:animated:", v5, 1);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  RouteIncidentsViewController *v4;
  RouteIncidentsViewController *incidentsVC;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v4 = (RouteIncidentsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
  incidentsVC = self->_incidentsVC;

  if (v4 == incidentsVC)
  {
    -[RouteIncidentsViewController resetForDismiss](self->_incidentsVC, "resetForDismiss");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
    if (v6 == v7)
    {
      v8 = -[TransitLineSelectionActionController isActive](self->_lineSelectionAction, "isActive");

      if (v8)
        -[TransitLineSelectionActionController deactivateWithContext:](self->_lineSelectionAction, "deactivateWithContext:", 0);
    }
    else
    {

    }
  }

}

- (void)timingViewController:(id)a3 didPickTiming:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  objc_msgSend(v6, "updateTiming:", v5);

}

- (BOOL)isPedestrianARActive
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));
  v5 = objc_opt_class(PedestrianARContext);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v6 = objc_msgSend(v7, "state") == (id)3;

  }
  return v6;
}

- (BOOL)isPedestrianARShowingFailureView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned __int8 v10;

  if (!-[ActionCoordinator isPedestrianARActive](self, "isPedestrianARActive"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fullscreenViewController"));

  v7 = objc_opt_class(PedestrianARViewController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    v10 = objc_msgSend(v9, "isShowingFailureView");
  else
    v10 = 0;

  return v10;
}

- (BOOL)canEnterPedestrianAR
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;

  if (!+[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
  {
    v9 = sub_10043214C();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v10 = "Cannot enter pedestrian AR because it's not supported on the current device";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 2u);
    }
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeCollection"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v11 = sub_10043214C();
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v10 = "Cannot enter pedestrian AR without a route";
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pedestrianARSessionStateManager"));

  if ((-[NSObject shouldShowPedestrianAR](v7, "shouldShowPedestrianAR") & 1) == 0)
  {
    v12 = sub_10043214C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject debugDescription](v7, "debugDescription"));
      v16 = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Cannot enter pedestrian AR for state manager: %@", (uint8_t *)&v16, 0xCu);

    }
    goto LABEL_13;
  }
  v8 = 1;
LABEL_14:

  return v8;
}

- (void)enterPedestrianAR
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v25[3];
  uint64_t v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id location;

  v3 = sub_10043214C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will enter pedestrian AR from route planning", buf, 2u);
  }

  if (-[ActionCoordinator canEnterPedestrianAR](self, "canEnterPedestrianAR"))
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1005B64B0;
    v31[3] = &unk_1011AD4F0;
    objc_copyWeak(&v32, &location);
    v6 = objc_msgSend(v5, "showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:", self, self, v31);

    if ((v6 & 1) != 0)
    {
LABEL_23:
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      return;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));

    v9 = objc_opt_class(PedestrianARFeatureIntroTeachableMomentContaineeViewController);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentViewController"));

    v14 = objc_opt_class(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    if (v11)
    {
      v17 = sub_10043214C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Feature intro teachable moment card is active; dismissing it before entering AR",
          buf,
          2u);
      }
    }
    else
    {
      if (!v16)
      {
LABEL_22:
        v30 = 0;
        v28 = 0u;
        v29 = 0u;
        *(_OWORD *)buf = 0u;
        +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions](StartNavigationDetailsBuilder, "defaultNavigationDetailsOptions");
        *(_QWORD *)&v28 = 2;
        *((_QWORD *)&v29 + 1) = 0;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "routeCollection"));
        v25[0] = *(_OWORD *)buf;
        v25[1] = v28;
        v25[2] = v29;
        v26 = v30;
        objc_msgSend(v22, "startNavigationWithRouteCollection:navigationDetailsOptions:", v24, v25);

        goto LABEL_23;
      }
      v21 = sub_10043214C();
      v18 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Raise to enter teachable moment card is active; dismissing it before entering AR",
          buf,
          2u);
      }
      v8 = v13;
    }

    -[ActionCoordinator containeeViewControllerGoToPreviousState:withSender:](self, "containeeViewControllerGoToPreviousState:withSender:", v8, 0);
    goto LABEL_22;
  }
  v19 = sub_10043214C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Cannot enter pedestrian AR at the moment", buf, 2u);
  }

}

- (void)exitPedestrianAR
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v2, "exitPedestrianAR");

}

- (BOOL)isTeachableMomentCardActive
{
  void *v2;
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentViewController"));
  v4 = objc_opt_class(PedestrianARFeatureIntroTeachableMomentContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BOOL)isWeatherPopoverActive
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_maps_mapsSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topMostPresentedViewController"));
  v5 = objc_opt_class(WUWeatherPlatterViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return isKindOfClass & 1;
}

- (void)showPedestrianARFeatureIntroTeachableMomentCard
{
  id v3;
  NSObject *v4;
  void *v5;
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *v6;
  uint8_t buf[16];

  if (-[ActionCoordinator isTeachableMomentCardActive](self, "isTeachableMomentCardActive"))
  {
    v3 = sub_10043214C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "The Pedestrian AR feature intro teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }

  }
  else
  {
    v6 = -[PedestrianARFeatureIntroTeachableMomentContaineeViewController initWithCoordinator:]([PedestrianARFeatureIntroTeachableMomentContaineeViewController alloc], "initWithCoordinator:", self);
    -[ContaineeViewController setContaineeDelegate:](v6, "setContaineeDelegate:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v5, "presentController:animated:", v6, 1);

  }
}

- (void)showPedestrianARRaiseToEnterTeachableMomentCard
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  NSObject *v8;
  void *v9;
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *v10;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = sub_10043214C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "The Pedestrian AR raise to enter teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }

  }
  else
  {
    v10 = objc_alloc_init(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
    -[ContaineeViewController setContaineeDelegate:](v10, "setContaineeDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v9, "presentController:animated:", v10, 1);

  }
}

- (void)dismissPedestrianARTeachableMomentCardIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  if (-[ActionCoordinator isTeachableMomentCardActive](self, "isTeachableMomentCardActive")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController")),
        v5 = objc_opt_class(PedestrianARRaiseToEnterTeachableMomentContaineeViewController),
        isKindOfClass = objc_opt_isKindOfClass(v4, v5),
        v4,
        v3,
        (isKindOfClass & 1) != 0))
  {
    v7 = sub_10043214C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentViewController"));
      v14 = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Dismissing Pedestrian AR teachable moment card: %@", (uint8_t *)&v14, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentViewController"));
    objc_msgSend(v11, "removeControllerFromStack:", v13);

  }
}

- (void)enterPedestrianAR:(id)a3
{
  _os_activity_label_useraction((void *)&_mh_execute_header, "Tapped pedestrian AR button");
  -[ActionCoordinator enterPedestrianAR](self, "enterPedestrianAR");
}

- (id)reportsHomeViewController
{
  RAPHomeViewController *reportsHomeViewController;
  RAPHomeViewController *v4;
  RAPHomeViewController *v5;

  reportsHomeViewController = self->_reportsHomeViewController;
  if (!reportsHomeViewController)
  {
    v4 = objc_alloc_init(RAPHomeViewController);
    v5 = self->_reportsHomeViewController;
    self->_reportsHomeViewController = v4;

    -[ContaineeViewController setContaineeDelegate:](self->_reportsHomeViewController, "setContaineeDelegate:", self);
    -[ControlContaineeViewController setDelegate:](self->_reportsHomeViewController, "setDelegate:", self);
    reportsHomeViewController = self->_reportsHomeViewController;
  }
  return reportsHomeViewController;
}

- (void)viewControllerShowReports:(id)a3
{
  -[ActionCoordinator viewControllerShowReports:fromEntryPoint:](self, "viewControllerShowReports:fromEntryPoint:");
}

- (void)viewControllerShowReports:(id)a3 fromEntryPoint:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  if (_MKRAPIsAvailable(self))
  {
    if ((sub_1003DDB84() & 1) == 0)
    {
      -[ActionCoordinator _dismissMacToolTipIfNeeded](self, "_dismissMacToolTipIfNeeded");
      +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator reportsHomeViewController](self, "reportsHomeViewController"));
      objc_msgSend(v6, "setEntryPoint:", v4);

      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator reportsHomeViewController](self, "reportsHomeViewController"));
      objc_msgSend(WeakRetained, "presentController:animated:", v7, 1);

    }
  }
}

- (void)viewController:(id)a3 presentReportDetail:(id)a4 fromEntryPoint:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  void *v18;
  _TtC4Maps33RAPNotificationDetailsCoordinator *rapNotificationDetailsCoordinator;
  _TtC4Maps33RAPNotificationDetailsCoordinator *v20;
  _TtC4Maps33RAPNotificationDetailsCoordinator *v21;
  id v22;
  __int16 v23;
  __int16 v24;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_maps_mapsSceneDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rapPresenter"));
  v13 = objc_msgSend(v12, "presentOfflineAlertIfNecessaryWithCompletion:", 0);

  if (v13)
  {
    v14 = sub_100431FFC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v24 = 0;
      v16 = "can't present ReportDetail because Maps is offline";
      v17 = (uint8_t *)&v24;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v16, v17, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v9 || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reportID")), v18, !v18))
  {
    v22 = sub_100431FFC();
    v15 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v23 = 0;
      v16 = "can't present ReportDetail because rapRecord or reportID is nil";
      v17 = (uint8_t *)&v23;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  rapNotificationDetailsCoordinator = self->_rapNotificationDetailsCoordinator;
  if (!rapNotificationDetailsCoordinator)
  {
    v20 = -[RAPNotificationDetailsCoordinator initWithParentViewController:]([_TtC4Maps33RAPNotificationDetailsCoordinator alloc], "initWithParentViewController:", v8);
    v21 = self->_rapNotificationDetailsCoordinator;
    self->_rapNotificationDetailsCoordinator = v20;

    -[RAPNotificationDetailsCoordinator setCoordinator:](self->_rapNotificationDetailsCoordinator, "setCoordinator:", self);
    rapNotificationDetailsCoordinator = self->_rapNotificationDetailsCoordinator;
  }
  -[RAPNotificationDetailsCoordinator presentRAPNotificationDetailsViewControllerWithRapRecord:entryPoint:](rapNotificationDetailsCoordinator, "presentRAPNotificationDetailsViewControllerWithRapRecord:entryPoint:", v9, v5);
LABEL_13:

}

- (void)presentEducationScreenWithAssetURLs:(id)a3 titleText:(id)a4 bodyText:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  TransitPayEducationScreenViewController *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13 = -[TransitPayEducationScreenViewController initWithAssetURLs:titleText:bodyText:]([TransitPayEducationScreenViewController alloc], "initWithAssetURLs:titleText:bodyText:", v10, v9, v8);

  v11 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v12, "_maps_topMostPresentViewController:animated:completion:", v11, 1, 0);

}

- (id)_filteredFeaturesFromTransitSystems:(id)a3 allFeatures:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;
  id obj;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v5 = a3;
  v6 = a4;
  v24 = v5;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v8);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v10 = v24;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifiers"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
              v18 = objc_msgSend(v16, "containsObject:", v17);

              if (v18)
              {
                v19 = objc_msgSend(v9, "copy");
                objc_msgSend(v7, "addObject:", v19);

              }
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v25);
  }

  v20 = objc_msgSend(v7, "copy");
  return v20;
}

- (void)presentWalletDCIViewControllerWithTransitSystems:(id)a3 callbackDelegate:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  id v15;
  NSObject *v16;
  uint64_t Log;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = objc_alloc_init((Class)PKPaymentSetupConfiguration);
      objc_msgSend(v9, "setReferrerIdentifier:", CFSTR("maps"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1005B75B8;
      v18[3] = &unk_1011BC7C8;
      v18[4] = self;
      v19 = v7;
      v20 = v9;
      v21 = v8;
      v22 = a2;
      v10 = v9;
      +[PKPaymentSetupViewController paymentSetupFeaturesForConfiguration:completion:](PKPaymentSetupViewController, "paymentSetupFeaturesForConfiguration:completion:", v10, v18);

      goto LABEL_13;
    }
    v15 = sub_10043253C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      v25 = 1024;
      v26 = 6506;
      v27 = 2082;
      v28 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      v29 = 2082;
      v30 = "transitSystems.count == 0u";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems.count cannot be 0", buf, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      v25 = 1024;
      v26 = 6506;
      v27 = 2082;
      v28 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      v29 = 2082;
      v30 = "transitSystems.count == 0u";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems.count cannot be 0";
      goto LABEL_12;
    }
  }
  else
  {
    v11 = sub_10043253C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      v25 = 1024;
      v26 = 6505;
      v27 = 2082;
      v28 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      v29 = 2082;
      v30 = "transitSystems == nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems cannot be nil", buf, 0x26u);
    }

    v13 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/UI/ActionCoordinator.m";
      v25 = 1024;
      v26 = 6505;
      v27 = 2082;
      v28 = "-[ActionCoordinator presentWalletDCIViewControllerWithTransitSystems:callbackDelegate:]";
      v29 = 2082;
      v30 = "transitSystems == nil";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. transitSystems cannot be nil";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, v14, buf, 0x26u);
    }
  }
LABEL_13:

}

- (void)presentWalletTopUpViewControllerWithTransitIdentifier:(id)a3 callbackDelegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  v8 = sub_10043253C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Showing Wallet Top-Up View Controller", v12, 2u);
  }

  v10 = objc_msgSend(objc_alloc((Class)PKPerformActionSetupViewController), "initWithPassIdentifier:", v7);
  objc_msgSend(v10, "setDelegate:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v11, "_maps_topMostPresentViewController:animated:completion:", v10, 1, 0);

}

- (void)presentOfflineMapsSelectorFromTipWithRegion:(id)a3 name:(id)a4
{
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:shouldUseSessionlessAnalytics:", 0, a3, a4, 1);
}

- (id)traitsForRouteSearchViewController:(id)a3
{
  return -[ActionCoordinator newTraits](self, "newTraits", a3);
}

- (void)routeSearchViewControllerDidDismiss:(id)a3 shouldExitRoutePlanning:(BOOL)a4
{
  if (a4)
    -[ActionCoordinator exitRoutePlanningIfNeededAnimated:](self, "exitRoutePlanningIfNeededAnimated:", 1);
  else
    -[ActionCoordinator closeRoutePlanningViewController:withSender:](self, "closeRoutePlanningViewController:withSender:", a3, 0);
}

- (void)routeStepsViewController:(id)a3 wantsToShareItem:(id)a4 fromView:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v9, "shareItem:sourceView:completion:", v8, v7, 0);

}

- (void)routeStepsViewController:(id)a3 wantsToDisplayScheduleForTransitStep:(id)a4
{
  -[ActionCoordinator presentScheduleForStep:](self, "presentScheduleForStep:", a4);
}

- (void)routeStepsViewController:(id)a3 wantsToDisplayAdvisory:(id)a4
{
  -[ActionCoordinator setRoutePlanningAdvisory:](self, "setRoutePlanningAdvisory:", a4);
  -[ActionCoordinator presentRoutePlanningViewType:](self, "presentRoutePlanningViewType:", 5);
}

- (void)autosharingController:(id)a3 didUpdateContacts:(id)a4
{
  -[ActionCoordinator viewControllerGoPreviousState:withSender:](self, "viewControllerGoPreviousState:withSender:", a3, a3);
}

- (void)autosharingController:(id)a3 wantsToSearchWithExistingContacts:(id)a4 selectionHandler:(id)a5
{
  -[ActionCoordinator presentAutosharingContactSearchWithContacts:selectionHandler:](self, "presentAutosharingContactSearchWithContacts:selectionHandler:", a4, a5);
}

- (void)viewController:(id)a3 startDirectionsToRouteData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005B7B90;
  v11[3] = &unk_1011BC7F0;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  v9 = v7;
  v12 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "singleLocationUpdateWithHandler:", v11));

  objc_msgSend(v10, "start");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)viewController:(id)a3 editRoute:(id)a4
{
  id v6;
  MapsSaveRouteContainee *v7;
  void *v8;
  MapsSaveRouteContainee *v9;

  objc_storeStrong((id *)&self->_routeDataToEdit, a4);
  v6 = a4;
  v7 = [MapsSaveRouteContainee alloc];

  v9 = -[MapsSaveRouteContainee initWithDelegate:isEditing:showInitialKeyboard:](v7, "initWithDelegate:isEditing:showInitialKeyboard:", self, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v8, "presentController:animated:", v9, 1);

}

- (void)viewController:(id)a3 downloadOfflineRegionForRouteData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  unsigned __int8 v27;
  id location;
  _QWORD v29[5];
  id v30;

  v24 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "boundingMapRegion"));
  v8 = objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:](GEOMapRegion, "_maps_offlineDownloadRegionForRouteBounds:", v7));

  v9 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buildRoute"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userProvidedName"));
  v23 = (void *)v8;
  if (objc_msgSend(v11, "length"))
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userProvidedName"));
  else
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeName"));
  v13 = (void *)v12;

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_1005A83A0;
  v29[4] = sub_1005A83B0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "acquireHikingMapToken"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator iosChromeViewController](self, "iosChromeViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_mapLayer"));
  v18 = objc_msgSend(v17, "applicationSubState");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator iosChromeViewController](self, "iosChromeViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mapView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_mapLayer"));
  objc_msgSend(v21, "setApplicationSubState:", 1);

  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1005B836C;
  v25[3] = &unk_1011BC818;
  v25[4] = v29;
  objc_copyWeak(&v26, &location);
  v27 = v18;
  LOBYTE(v22) = 1;
  -[ActionCoordinator viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:shouldShowDataManagementAfterDownload:shouldShowDataManagementAfterDownloadIfRegionDiffers:dismissalBlock:](self, "viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:shouldShowDataManagementAfterDownload:shouldShowDataManagementAfterDownloadIfRegionDiffers:dismissalBlock:", v24, v23, v13, v10, 0, 0, v22, v25);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(v29, 8);

}

- (id)routeData
{
  return self->_routeDataToEdit;
}

- (void)popContainee
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v2, "popLastViewControllerAnimated:", 1);

}

- (void)didSaveCustomRoute:(id)a3
{
  GEOComposedGeometryRoutePersistentData *routeDataToEdit;

  routeDataToEdit = self->_routeDataToEdit;
  self->_routeDataToEdit = 0;

  -[ActionCoordinator popContainee](self, "popContainee");
}

- (BOOL)is3dModeSelected
{
  return self->_is3dModeSelected;
}

- (BOOL)isExiting3dMode
{
  return self->_isExiting3dMode;
}

- (DirectionItem)currentDirectionItem
{
  return self->_currentDirectionItem;
}

- (void)setCurrentDirectionItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentDirectionItem, a3);
}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_appCoordinator, a3);
}

- (TransitLineSelectionActionController)lineSelectionAction
{
  return self->_lineSelectionAction;
}

- (void)setLineSelectionAction:(id)a3
{
  objc_storeStrong((id *)&self->_lineSelectionAction, a3);
}

- (int64_t)visibleViewModeBeforeDoingDirectionItem
{
  return self->_visibleViewModeBeforeDoingDirectionItem;
}

- (void)setVisibleViewModeBeforeDoingDirectionItem:(int64_t)a3
{
  self->_visibleViewModeBeforeDoingDirectionItem = a3;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (ControlContainerViewController)containerViewController
{
  return (ControlContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (BOOL)isRoutePlanningPresented
{
  return self->_isRoutePlanningPresented;
}

- (UIView)incidentsVCSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_incidentsVCSourceView);
}

- (void)setIncidentsVCSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_incidentsVCSourceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_incidentsVCSourceView);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_simpleListResultsVC, 0);
  objc_storeStrong((id *)&self->_lineSelectionAction, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_currentDirectionItem, 0);
  objc_storeStrong(&self->_collectionCreateVCDidDismissHandler, 0);
  objc_storeStrong((id *)&self->_routeDataToEdit, 0);
  objc_storeStrong(&self->_noteEditorCompletionBlock, 0);
  objc_storeStrong((id *)&self->_rapNotificationDetailsCoordinator, 0);
  objc_storeStrong((id *)&self->_reportsHomeViewController, 0);
  objc_storeStrong((id *)&self->_placeEnrichmentAPIController, 0);
  objc_storeStrong((id *)&self->_vehicleListVC, 0);
  objc_storeStrong((id *)&self->_profileTipVC, 0);
  objc_storeStrong((id *)&self->_ratingsHistoryVC, 0);
  objc_storeStrong((id *)&self->_travelPreferencesVC, 0);
  objc_storeStrong((id *)&self->_userProfileVC, 0);
  objc_storeStrong((id *)&self->_guideHomeVC, 0);
  objc_storeStrong((id *)&self->_collectionsListVC, 0);
  objc_storeStrong((id *)&self->_citySelectorVC, 0);
  objc_storeStrong((id *)&self->_allCollectionsVC, 0);
  objc_storeStrong((id *)&self->_publisherVC, 0);
  objc_storeStrong((id *)&self->_curatedCollectionsVC, 0);
  objc_storeStrong((id *)&self->_collectionEditCoordinator, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentCoordinator, 0);
  objc_storeStrong((id *)&self->_searchSessionManager, 0);
  objc_storeStrong((id *)&self->_shortcutEditSessionController, 0);
  objc_storeStrong(&self->_containerViewControllerDidResignContaineeObserver, 0);
  objc_storeStrong(&self->_containerViewControllerWillPresentContaineeObserver, 0);
  objc_storeStrong((id *)&self->_collectionPicker, 0);
  objc_storeStrong((id *)&self->_venuesManager, 0);
  objc_storeStrong((id *)&self->_venueCardCoordinator, 0);
  objc_storeStrong((id *)&self->_locationUpdateOperationForRouting, 0);
  objc_storeStrong((id *)&self->_trafficIncidentViewController, 0);
  objc_storeStrong((id *)&self->_autosharingVC, 0);
  objc_storeStrong((id *)&self->_routeAnnotationVC, 0);
  objc_storeStrong((id *)&self->_addStopResultsViewController, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_incidentsVC, 0);
  objc_storeStrong((id *)&self->_routeStepsVC, 0);
  objc_storeStrong((id *)&self->_routeSearchVC, 0);
  objc_storeStrong((id *)&self->_routePlanningMapController, 0);
  objc_storeStrong((id *)&self->_routePlanningDataCoordinator, 0);
  objc_storeStrong((id *)&self->_lineCardForRoutePlanningViewController, 0);
  objc_storeStrong((id *)&self->_lineCardViewController, 0);
  objc_storeStrong((id *)&self->_parkedCarViewController, 0);
  objc_storeStrong((id *)&self->_mapSelectionManager, 0);
  objc_storeStrong((id *)&self->_searchModeViewController, 0);
  objc_storeStrong((id *)&self->_lprOnboardingController, 0);
  objc_storeStrong((id *)&self->_preferredNetworksOnboardingController, 0);
  objc_storeStrong((id *)&self->_vehicleOnboardingController, 0);
  objc_storeStrong((id *)&self->_routePlanningOverviewViewController, 0);
  objc_storeStrong((id *)&self->_placeCardForRoutePlanningViewController, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_routePlanningSelectionRestorationState, 0);
}

- (void)simpleResultsViewContoller:(id)a3 selectSearchResult:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));

  if (v8 == v10)
  {
    -[ActionCoordinator viewController:presentVenuesClusteredSearchResult:](self, "viewController:presentVenuesClusteredSearchResult:", 0, v6);
  }
  else
  {
    if (sub_1002A8AA0(v10) == 5)
      -[ActionCoordinator viewControllerGoPreviousState:withSender:](self, "viewControllerGoPreviousState:withSender:", v10, 0);
    -[ActionCoordinator viewController:selectSearchResult:addToHistory:source:saveSelectionState:](self, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:", 0, v6, 1, 6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v9, "selectSearchResult:animated:", v6, 1);

  }
}

- (void)simpleResultsViewContoller:(id)a3 selectClusteredLabelMarker:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v6, "selectLabelMarker:animated:", v5, 1);

}

- (void)simpleResultsViewContoller:(id)a3 selectDirectionItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _UNKNOWN **v10;

  v9 = CFSTR("DirectionsSessionInitiatorKey");
  v10 = &off_10126E650;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[ActionCoordinator viewController:doDirectionItem:withUserInfo:](self, "viewController:doDirectionItem:withUserInfo:", v7, v6, v8);

}

- (void)simpleResultsViewContoller:(id)a3 didTapOnLookAroundWithSearchResult:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mapItem", a3));
  if (objc_msgSend(v6, "_hasLookAroundStorefront"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:wantsCloseUpView:](MKLookAroundEntryPoint, "entryPointWithMapItem:wantsCloseUpView:", v6, 1));
    -[ActionCoordinator enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:](self, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v5, 0, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  }
}

- (void)simpleResultsViewContoller:(id)a3 didTapOnCallWithSearchResult:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mapItem", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "phoneNumber"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "phoneNumber"));
    objc_msgSend(v6, "callPhoneNumber:completion:", v7, 0);

  }
}

- (void)simpleResultsViewContoller:(id)a3 didTapOnWebsiteWithSearchResult:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "url"));
  objc_msgSend(v7, "openURL:withCompletionHandler:", v6, 0);

}

- (void)simpleResultsViewContoller:(id)a3 didTapOnFlyoverWithSearchResult:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mapItem"));
  -[ActionCoordinator viewController:enterFlyoverForMapItem:](self, "viewController:enterFlyoverForMapItem:", v6, v7);

}

- (void)simpleResultsViewContoller:(id)a3 selectContainmentParentMapItem:(id)a4 resultsList:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SearchResult *v11;

  v7 = a5;
  v8 = a4;
  v11 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", v11));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v10, "setSearchPins:selectedPin:animated:", v9, v11, 1);

}

- (void)simpleResultsViewContoller:(id)a3 selectTappableEntry:(id)a4 resultsList:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SearchResult *v11;

  v7 = a5;
  v8 = a4;
  v11 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObject:", v11));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v10, "setSearchPins:selectedPin:animated:", v9, v11, 1);

}

- (void)simpleResultsViewContoller:(id)a3 showCuratedCollection:(id)a4
{
  id v5;
  _QWORD v6[4];
  ActionCoordinator *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1006B0848;
  v6[3] = &unk_1011AC8B0;
  v7 = self;
  v8 = a3;
  v5 = v8;
  -[ActionCoordinator viewController:showCuratedCollection:replaceViewController:completion:](v7, "viewController:showCuratedCollection:replaceViewController:completion:", v5, a4, 0, v6);

}

- (void)simpleResultsViewContoller:(id)a3 showCuratedCollectionsList:(id)a4 title:(id)a5
{
  id v7;
  _QWORD v8[4];
  ActionCoordinator *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006B0920;
  v8[3] = &unk_1011AC8B0;
  v9 = self;
  v10 = a3;
  v7 = v10;
  -[ActionCoordinator viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:](v9, "viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:", v7, a4, a5, 0, v8);

}

- (void)simpleResultsViewContoller:(id)a3 showUserGeneratedCollection:(id)a4
{
  id v5;
  _QWORD v6[4];
  ActionCoordinator *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1006B09EC;
  v6[3] = &unk_1011AC8B0;
  v7 = self;
  v8 = a3;
  v5 = v8;
  -[ActionCoordinator viewController:showCollection:completion:](v7, "viewController:showCollection:completion:", v5, a4, v6);

}

- (void)simpleResultsViewContoller:(id)a3 didStapOnAddStopWithSearchResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _UNKNOWN **v10;

  v9 = CFSTR("DirectionsSessionInitiatorKey");
  v10 = &off_10126E650;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[ActionCoordinator viewController:addStopForSearchResult:withUserInfo:](self, "viewController:addStopForSearchResult:withUserInfo:", v7, v6, v8);

}

- (void)lineCardViewController:(id)a3 doDirectionItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _UNKNOWN **v10;

  v9 = CFSTR("DirectionsSessionInitiatorKey");
  v10 = &off_1012711D0;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  -[ActionCoordinator viewController:doDirectionItem:withUserInfo:](self, "viewController:doDirectionItem:withUserInfo:", v7, v6, v8);

}

- (void)lineCardViewController:(id)a3 selectMapItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100BCCB84;
  v15[3] = &unk_1011AD238;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  v10 = objc_retainBlock(v15);
  v11 = objc_opt_class(MacBaseActionCoordinator);
  if ((objc_opt_isKindOfClass(self, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator macContainerViewController](self, "macContainerViewController"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100BCCBE4;
    v13[3] = &unk_1011ADA00;
    v14 = v10;
    objc_msgSend(v12, "deferPresentingMapPopoversInsideBlock:", v13);

  }
  else
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }

}

- (void)lineCardViewController:(id)a3 displayMapRegion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapCameraController](self, "mapCameraController"));
  objc_msgSend(v6, "displayMapRegion:animated:completion:", v5, 1, 0);

}

- (void)lineCardViewController:(id)a3 showIncidents:(id)a4
{
  -[ActionCoordinator viewController:openTransitIncidents:fromView:withUserInfo:](self, "viewController:openTransitIncidents:fromView:withUserInfo:", a3, a4, 0, 0);
}

- (void)lineCardViewControllerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lineItem"));
  v6 = objc_msgSend(v4, "isShowingLineForLineItem:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lineItem"));
    -[ActionCoordinator viewController:selectTransitLineItem:zoomToMapRegion:](self, "viewController:selectTransitLineItem:zoomToMapRegion:", v8, v7, 0);

  }
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;

  v4 = a3;
  if (objc_msgSend(v4, "isTransitLine")
    && -[ActionCoordinator isRoutePlanningPresented](self, "isRoutePlanningPresented")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypointInfo")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoint")),
        v7 = objc_opt_class(GEOComposedWaypointToRoute),
        v8 = objc_opt_isKindOfClass(v6, v7),
        v6,
        v5,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentViewController"));
    v12 = objc_opt_class(VLFContaineeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v11, v12);

    v9 = isKindOfClass ^ 1;
  }

  return v9 & 1;
}

- (BOOL)chromeDidSelectClusteredWaypointMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "isCluster"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterWaypointInfos"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_compactMap:", &stru_1011E8A08));

    v7 = objc_msgSend(v6, "count");
    v8 = v7 != 0;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cluster"));

      if (v10 != v4)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
        objc_msgSend(v11, "clearCluster");

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      objc_msgSend(v12, "setDisplayDistance:", 1);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchInfo"));
      objc_msgSend(v13, "setCluster:sortAlphabetically:originalSearchInfo:searchResults:", v4, 0, v15, v6);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator simpleListResultsVC](self, "simpleListResultsVC"));
      -[ActionCoordinator presentSimpleList:](self, "presentSimpleList:", v16);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  -[ActionCoordinator viewController:presentCluster:](self, "viewController:presentCluster:", 0, a3);
  return 1;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "annotation"));
  -[ActionCoordinator viewController:selectSearchResult:addToHistory:source:saveSelectionState:](self, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:", 0, v4, 0, 1, 0);

  return 1;
}

- (BOOL)chromeDidClearMapSelection
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentOrPendingViewController"));

  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(PlaceCardViewController)))
  {
    if (-[ActionCoordinator shouldDismissPlaceCardOnClearMapSelection](self, "shouldDismissPlaceCardOnClearMapSelection"))
    {
      -[ActionCoordinator viewControllerClosed:animated:](self, "viewControllerClosed:animated:", v4, 1);
    }
  }
  else
  {
    v16[0] = objc_opt_class(SimpleResultsViewController);
    v16[1] = objc_opt_class(ParkedCarViewController);
    v16[2] = objc_opt_class(TrafficIncidentContaineeViewController);
    v16[3] = objc_opt_class(TransitLineDisambiguationViewController);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(v4, "isMemberOfClass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11))
          {
            -[ActionCoordinator viewControllerClosed:animated:](self, "viewControllerClosed:animated:", v4, 1);
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return 1;
}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parkedCar"));
  if (v5)
  {

    v6 = 0;
LABEL_3:
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personalizedItem"));
    -[ActionCoordinator viewController:selectPersonalizedItem:source:saveSelectionState:](self, "viewController:selectPersonalizedItem:source:saveSelectionState:", 0, v7, 1, 0);

    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResult"));
  if (!v6)
    goto LABEL_3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator venueCardCoordinator](self, "venueCardCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
  if (v10 == v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentViewController](self, "currentViewController"));
    v13 = objc_opt_class(SimpleResultsViewController);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    if ((isKindOfClass & 1) != 0)
    {
      -[ActionCoordinator viewController:presentVenuesClusteredSearchResult:](self, "viewController:presentVenuesClusteredSearchResult:", 0, v6);
      goto LABEL_4;
    }
  }
  else
  {

  }
  if (objc_msgSend(v6, "type") == 3)
    goto LABEL_3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
  if ((objc_msgSend(v15, "singleResultMode") & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchFieldItem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "searchResult"));

    if (v18 == v6)
      goto LABEL_4;
  }
  else
  {

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autocompletePerson"));
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "findMyHandle"));
    v20 = v21 == 0;

  }
  if (objc_msgSend(v6, "locationType") == 4)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v22, "captureUserAction:onTarget:eventValue:", 404, 502, 0);

  }
  -[ActionCoordinator viewController:selectSearchResult:addToHistory:source:saveSelectionState:](self, "viewController:selectSearchResult:addToHistory:source:saveSelectionState:", 0, v6, v20, 1, 0);
LABEL_4:

  return 1;
}

- (BOOL)chromeDidSelectRouteWaypointMarker:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  GEOMapServiceTraits *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  ActionCoordinator *v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc((Class)MKMapItemIdentifier);
  v6 = objc_msgSend(v4, "featureID");
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  objc_msgSend(v4, "coordinate");
  v9 = objc_msgSend(v5, "initWithMUID:resultProviderID:coordinate:", v6, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v19 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v12 = -[ActionCoordinator newTraits](self, "newTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForIdentifiers:traits:", v11, v12));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100BE8F9C;
  v16[3] = &unk_1011AE6F0;
  v17 = v4;
  v18 = self;
  v14 = v4;
  objc_msgSend(v13, "submitWithHandler:networkActivity:", v16, 0);

  return 1;
}

- (BOOL)chromeDidSelectWaypointMarkerForFindMyHandleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator currentSearchSession](self, "currentSearchSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchInfo"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autocompletePerson"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "handleIdentifier"));
  if (!objc_msgSend(v4, "isEqualToString:", v10))
  {

    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
LABEL_7:
    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100BE93C4;
    v19[3] = &unk_1011E8A30;
    v20 = v4;
    objc_copyWeak(&v21, (id *)buf);
    +[MapsAutocompletePerson autoCompletePersonWithHandleIdentifier:completionHandler:](_TtC4Maps22MapsAutocompletePerson, "autoCompletePersonWithHandleIdentifier:completionHandler:", v20, v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak((id *)buf);
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator searchPinsManager](self, "searchPinsManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
  objc_msgSend(v13, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:completion:", v6, 1, v15, 1, 0);

  v16 = sub_10043214C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Using the same search session to select a waypoint: %@", buf, 0xCu);
  }

LABEL_8:
  return 1;
}

- (BOOL)chromeDidSelectWaypointMarkerForAddress:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100BE9658;
  v7[3] = &unk_1011E8A58;
  objc_copyWeak(&v8, &location);
  +[MapsAutocompletePerson autoCompletePersonWithContact:completionHandler:](_TtC4Maps22MapsAutocompletePerson, "autoCompletePersonWithContact:completionHandler:", v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)chromeDidSelectFlyoverTourLabelMarker:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  GEOMapServiceTraits *v7;
  void *v8;
  _QWORD v10[5];
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "flyoverTourIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v7 = -[ActionCoordinator newTraits](self, "newTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ticketForIdentifiers:traits:", v6, v7));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100BE98A0;
  v10[3] = &unk_1011AE168;
  v10[4] = self;
  objc_msgSend(v8, "submitWithHandler:networkActivity:", v10, 0);

  return 1;
}

- (BOOL)chromeDidSelectTransitLineMarker:(id)a3
{
  id v4;
  void *v5;
  TransitLineSelectionActionController *v6;
  void *v7;
  TransitLineSelectionActionController *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  char v16;
  IncompleteTransitLineItem *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  BOOL v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));

  if (!v5)
  {
    v6 = [TransitLineSelectionActionController alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v8 = -[TransitLineSelectionActionController initWithContainerViewController:actionCoordinator:](v6, "initWithContainerViewController:actionCoordinator:", v7, self);
    -[ActionCoordinator setLineSelectionAction:](self, "setLineSelectionAction:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));
  v10 = objc_msgSend(v9, "isShowingLineForLabelMarker:", v4);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineCardVC](self, "lineCardVC"));
    v12 = objc_msgSend(v4, "_maps_numLines");
    v13 = (unint64_t)v12 > 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_loadedLineItems"));

    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v15 = (unint64_t)v12 < 2 && v14 == 0;
    v16 = v15;
    if (v15)
    {
      v17 = -[IncompleteTransitLineItem initWithLabelMarker:]([IncompleteTransitLineItem alloc], "initWithLabelMarker:", v4);
      -[ActionCoordinator presentLineCardForItem:labelMarker:loading:overDisambiguation:preferredLayout:](self, "presentLineCardForItem:labelMarker:loading:overDisambiguation:preferredLayout:", v17, v4, 1, (unint64_t)v12 > 1, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lineItem"));
      v19 = objc_msgSend(v18, "muid");
      v32[3] = (uint64_t)v19;

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator lineSelectionAction](self, "lineSelectionAction"));
    v21 = objc_msgSend(v4, "_maps_lineShouldZoomMapRegionOnSelection");
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100BE9B6C;
    v25[3] = &unk_1011E8A80;
    v25[4] = self;
    v29 = v13;
    v22 = v4;
    v26 = v22;
    v23 = v11;
    v27 = v23;
    v28 = &v31;
    v30 = v16;
    objc_msgSend(v20, "selectLineForLabelMarker:zoomToMapRegion:onActivation:", v22, v21, v25);

    objc_msgSend(v22, "set_maps_lineShouldZoomMapRegionOnSelection:", 0);
    _Block_object_dispose(&v31, 8);

  }
  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CLLocationDegrees v19;
  CLLocationDegrees v20;
  CLLocationCoordinate2D v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
  objc_msgSend(v11, "setIncident:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
  v13 = sub_1002A8AA0(v12);

  if (v13 == 5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
    objc_msgSend(v14, "setPreferredPresentationStyle:", 3);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
    objc_msgSend(v15, "setModalPresentationStyle:", 7);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "macPopoverPresentationController"));

    objc_msgSend(v8, "doubleValue");
    v19 = v18;
    objc_msgSend(v9, "doubleValue");
    v21 = CLLocationCoordinate2DMake(v19, v20);
    objc_msgSend(v17, "setCoordinate:", v21.latitude, v21.longitude);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentViewController"));
  v24 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v23, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator trafficIncidentVC](self, "trafficIncidentVC"));
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v26, "replaceCurrentWithController:moveToContaineeDefaultLayout:", v27, 1);
  else
    objc_msgSend(v26, "presentController:animated:useDefaultContaineeLayout:", v27, 1, 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v28, "captureUserAction:onTarget:eventValue:", 1031, 511, 0);

  return 1;
}

- (BOOL)chromeDidSelectETAMarkerForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
  objc_msgSend(v5, "updateCurrentRoute:", v4);

  -[ActionCoordinator presentRoutePlanningViewType:](self, "presentRoutePlanningViewType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v7 = -[ActionCoordinator currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics");
  v8 = objc_msgSend(v4, "_maps_routeIndex");

  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:routeIndex:", 3015, v7, 0, v8);
  return 1;
}

- (BOOL)chromeDidSelectRouteAnnotations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CLLocationDegrees v23;
  CLLocationDegrees v24;
  CLLocationCoordinate2D v25;
  void *v26;
  void *v27;
  uint64_t v28;
  char isKindOfClass;
  void *v30;
  void *v31;
  unsigned int v33;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeAnnotationVC](self, "routeAnnotationVC"));
    objc_msgSend(v6, "setRouteAnnotation:", v5);

    v33 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));
    v8 = FeatureStyleAttributesFind(v7, 90, &v33);

    if (v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33));
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routePlanningDataCoordinator](self, "routePlanningDataCoordinator"));
    v11 = objc_msgSend(v10, "transportType");

    if (v11 == (id)5 || v11 == (id)2)
    {
      if (v11 == (id)2)
        v12 = 312;
      else
        v12 = 67;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v14 = -[ActionCoordinator currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
      objc_msgSend(v13, "captureUserAction:onTarget:eventValue:", v12, v14, v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeAnnotationVC](self, "routeAnnotationVC"));
    v17 = sub_1002A8AA0(v16);

    if (v17 == 5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeAnnotationVC](self, "routeAnnotationVC"));
      objc_msgSend(v18, "setPreferredPresentationStyle:", 3);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeAnnotationVC](self, "routeAnnotationVC"));
      objc_msgSend(v19, "setModalPresentationStyle:", 7);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeAnnotationVC](self, "routeAnnotationVC"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "macPopoverPresentationController"));

      objc_msgSend(v5, "position");
      v23 = v22;
      objc_msgSend(v5, "position");
      v25 = CLLocationCoordinate2DMake(v23, v24);
      objc_msgSend(v21, "setCoordinate:", v25.latitude, v25.longitude);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentViewController"));
    v28 = objc_opt_class(PlaceCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v27, v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator containerViewController](self, "containerViewController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator routeAnnotationVC](self, "routeAnnotationVC"));
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v30, "replaceCurrentWithController:moveToContaineeDefaultLayout:", v31, 1);
    else
      objc_msgSend(v30, "presentController:animated:useDefaultContaineeLayout:", v31, 1, 1);

  }
  return 1;
}

- (BOOL)chromeDidSelectOfflineAnnotationMarker:(id)a3
{
  id v4;
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double width;
  double v14;
  double height;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  MKMapRect v43;
  MKMapRect v44;
  MKMapRect v45;

  v4 = a3;
  x = MKMapRectNull.origin.x;
  y = MKMapRectNull.origin.y;
  v37 = y;
  if (objc_msgSend(v4, "_maps_isOfflineAnnotation"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureAnnotation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "region"));
    x = GEOMapRectForMapRegion(v9, v10);
    y = v11;
    width = v12;
    height = v14;

  }
  else
  {
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
    if (!objc_msgSend(v4, "_maps_isOfflineClusterAnnotation"))
      goto LABEL_14;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterFeatureAnnotations"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v7);
          v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          v21 = objc_opt_class(_MKOfflineRegionCustomFeature);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subscription"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "region"));
            v25 = GEOMapRectForMapRegion(v23, v24);
            v27 = v26;
            v29 = v28;
            v31 = v30;

            v43.origin.x = x;
            v43.origin.y = y;
            v43.size.width = width;
            v43.size.height = height;
            v45.origin.x = v25;
            v45.origin.y = v27;
            v45.size.width = v29;
            v45.size.height = v31;
            v44 = MKMapRectUnion(v43, v45);
            x = v44.origin.x;
            y = v44.origin.y;
            width = v44.size.width;
            height = v44.size.height;
          }
        }
        v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v17);
    }
  }

LABEL_14:
  v32 = y != v37 || x != MKMapRectNull.origin.x;
  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "mapView"));
    objc_msgSend(v34, "setVisibleMapRect:edgePadding:animated:", 1, x, y, width, height, 35.0, 35.0, 35.0, 35.0);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v35, "clearSelection");

  }
  return v32;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  -[ActionCoordinator viewController:selectMapItem:address:addToHistory:source:](self, "viewController:selectMapItem:address:addToHistory:source:", 0, a3, 0, 1, 1);
  return 1;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  _QWORD block[4];
  id v14;

  v4 = a3;
  v5 = objc_opt_class(MapsUserLocationView);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0 && objc_msgSend(v4, "isVLFPuckVisible"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActionCoordinator platformController](self, "platformController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "auxiliaryTasksManager"));
    v8 = objc_msgSend(v7, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BEA5C8;
    block[3] = &unk_1011AC860;
    v14 = v9;
    v10 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

@end

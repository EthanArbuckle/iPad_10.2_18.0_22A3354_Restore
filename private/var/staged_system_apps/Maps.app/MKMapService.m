@implementation MKMapService

+ (unsigned)searchMaxResults
{
  if (qword_1014D4078 != -1)
    dispatch_once(&qword_1014D4078, &stru_1011E32F8);
  return dword_1014D4070;
}

+ (unsigned)venuesCategorySearchMaxResults
{
  return 5000;
}

- (id)_mapsDefaultTraitsForAnalytics
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  -[MKMapService _addCarPlayInfoToTraits:](self, "_addCarPlayInfoToTraits:", v3);
  -[MKMapService _addInVehicleInfoToTraits:](self, "_addInVehicleInfoToTraits:", v3);
  v4 = -[MKMapService defaultTraitsForAnalyticsWithTraits:](self, "defaultTraitsForAnalyticsWithTraits:", v3);
  return v3;
}

- (id)_mapsDefaultTraits
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  DrivePreferences *v15;
  void *v16;
  DrivePreferences *v17;
  void *v18;
  WalkPreferences *v19;
  void *v20;
  WalkPreferences *v21;
  void *v22;
  TransitPreferences *v23;
  void *v24;
  TransitPreferences *v25;
  void *v26;
  CyclePreferences *v27;
  void *v28;
  CyclePreferences *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService mapsDefaultTraits](self, "mapsDefaultTraits"));
  v4 = (unint64_t)+[GEOIdealTransportTypeFinder idealTransportType](GEOIdealTransportTypeFinder, "idealTransportType");
  if (v4 > 4)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v5 = qword_100E3EDF8[v4];
    v6 = dword_100E3EE20[v4];
  }
  objc_msgSend(v3, "addTransportType:", v6);
  v7 = +[_MKQuickRouteManager counterpartForTransportType:](_MKQuickRouteManager, "counterpartForTransportType:", v5);
  v8 = 2;
  switch((unint64_t)v7)
  {
    case 0uLL:
      goto LABEL_9;
    case 2uLL:
      goto LABEL_8;
    case 4uLL:
      v8 = 1;
      goto LABEL_8;
    case 8uLL:
      v8 = 3;
      goto LABEL_8;
    default:
      v8 = 0;
LABEL_8:
      objc_msgSend(v3, "addTransportType:", v8);
LABEL_9:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance", v8));
      v10 = objc_msgSend(v9, "isCurrentlyConnectedToAnyCarScene");

      if ((v10 & 1) == 0)
        objc_msgSend(v3, "addTransportType:", 2);
      -[MKMapService _addCarPlayConnectionToTraits:](self, "_addCarPlayConnectionToTraits:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updatedTraitsForCurrentGarageState:", v3));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentVoiceLanguage"));

      if (objc_msgSend(v14, "length"))
        objc_msgSend(v12, "setDeviceSpokenLocale:", v14);
      v15 = [DrivePreferences alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v17 = -[DrivePreferences initWithDefaults:](v15, "initWithDefaults:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences automobileOptions](v17, "automobileOptions"));
      objc_msgSend(v12, "setAutomobileOptions:", v18);

      v19 = [WalkPreferences alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v21 = -[WalkPreferences initWithDefaults:](v19, "initWithDefaults:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[WalkPreferences walkingOptions](v21, "walkingOptions"));
      objc_msgSend(v12, "setWalkingOptions:", v22);

      v23 = [TransitPreferences alloc];
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v25 = -[WatchSyncedPreferences initWithDefaults:](v23, "initWithDefaults:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences transitOptions](v25, "transitOptions"));
      objc_msgSend(v12, "setTransitOptions:", v26);

      v27 = [CyclePreferences alloc];
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v29 = -[CyclePreferences initWithDefaults:](v27, "initWithDefaults:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CyclePreferences cyclingOptions](v29, "cyclingOptions"));
      objc_msgSend(v12, "setCyclingOptions:", v30);

      objc_msgSend(v12, "setSupportDymSuggestion:", 1);
      return v12;
  }
}

- (id)mapsDefaultTraitsForMapRegion:(id)a3 source:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setMapRegion:", v6);
  if ((_DWORD)v4)
    objc_msgSend(v8, "setSource:", v4);

  return v8;
}

- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  double v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  if (v8)
  {
    objc_msgSend(v8, "visibleMapRect");
    v16 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v12, v13, v14, v15);
    objc_msgSend(v11, "setMapRegion:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueWithFocus"));
    if (v17 && sub_1002A8AA0(v8) != 5)
    {
      v18 = objc_msgSend(objc_alloc((Class)GEOVenueIdentifier), "initWithVenueID:featureID:businessID:", objc_msgSend(v17, "venueID"), objc_msgSend(v17, "featureID"), objc_msgSend(v17, "businessID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "placeDataVenueIdentifierForVenue"));
      objc_msgSend(v11, "setVenueIdentifier:", v19);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v21 = v20;
  if (v9)
  {
    objc_msgSend(v20, "timeIntervalSinceDate:", v9);
    LODWORD(v23) = vcvtad_u64_f64(v22);
    objc_msgSend(v11, "setTimeSinceMapEnteredForeground:", v23);
  }
  if (v10)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:", v10);
    LODWORD(v25) = vcvtad_u64_f64(v24);
    objc_msgSend(v11, "setTimeSinceMapViewportChanged:", v25);
  }
  v26 = objc_msgSend(v8, "mapType");
  v27 = 1;
  switch((unint64_t)v26)
  {
    case 0uLL:
      goto LABEL_16;
    case 1uLL:
    case 3uLL:
      v27 = 2;
      goto LABEL_16;
    case 2uLL:
    case 4uLL:
      v27 = 3;
      goto LABEL_16;
    default:
      if (v26 == (id)102)
        goto LABEL_16;
      if (v26 == (id)104)
      {
        v27 = 4;
LABEL_16:
        objc_msgSend(v11, "setMode:", v27);
      }
      objc_msgSend(v8, "_zoomLevel");
      if (v28 > 0.0)
        objc_msgSend(v11, "setMapZoomLevel:");
      objc_msgSend(v11, "setPhotosCount:", GEOConfigGetUInteger(MapsConfig_DefaultNumberOfPhotosToRequestForMaps, off_1014B47B8));
      objc_msgSend(v11, "setPhotoAlbumCount:", GEOConfigGetUInteger(MapsConfig_DefaultNumberOfPhotoAlbumsToRequestForMaps, off_1014B47A8));
      objc_msgSend(v11, "setWantsRouteCreationTip:", 1);

      return v11;
  }
}

- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5 directionsType:(unint64_t)a6
{
  return -[MKMapService mapsDefaultTraitsForMapView:mapViewEnteredForegroundDate:mapViewportChangedDate:directionsType:includeCarPlayInfo:](self, "mapsDefaultTraitsForMapView:mapViewEnteredForegroundDate:mapViewportChangedDate:directionsType:includeCarPlayInfo:", a3, a4, a5, a6, 0);
}

- (id)mapsDefaultTraitsForMapView:(id)a3 mapViewEnteredForegroundDate:(id)a4 mapViewportChangedDate:(id)a5 directionsType:(unint64_t)a6 includeCarPlayInfo:(BOOL)a7
{
  _BOOL4 v7;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v7 = a7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService mapsDefaultTraitsForMapView:mapViewEnteredForegroundDate:mapViewportChangedDate:](self, "mapsDefaultTraitsForMapView:mapViewEnteredForegroundDate:mapViewportChangedDate:", a3, a4, a5));
  v11 = v10;
  v12 = 2;
  switch(a6)
  {
    case 2uLL:
      break;
    case 4uLL:
      v12 = 1;
      break;
    case 8uLL:
      v12 = 3;
      break;
    default:
      v12 = 0;
      break;
  }
  objc_msgSend(v10, "addTransportType:", v12);
  v13 = +[_MKQuickRouteManager counterpartForTransportType:](_MKQuickRouteManager, "counterpartForTransportType:", a6);
  v14 = 2;
  switch((unint64_t)v13)
  {
    case 2uLL:
      break;
    case 4uLL:
      v14 = 1;
      break;
    case 8uLL:
      v14 = 3;
      break;
    default:
      v14 = 0;
      break;
  }
  objc_msgSend(v11, "addTransportType:", v14);
  if (v7)
    -[MKMapService _addCarPlayInfoToTraits:](self, "_addCarPlayInfoToTraits:", v11);
  return v11;
}

- (GEOMapServiceTraits)mapsDefaultTraitsWithCarPlayInfo
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  -[MKMapService _addCarPlayInfoToTraits:](self, "_addCarPlayInfoToTraits:", v3);
  return (GEOMapServiceTraits *)v3;
}

- (void)_addCarPlayConnectionToTraits:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = objc_msgSend(v3, "isCurrentlyConnectedToAnyCarScene");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v6 = objc_msgSend(v5, "connectionType");
    if (v6 == (id)1)
      v7 = 1;
    else
      v7 = 2 * (v6 == (id)2);
    objc_msgSend(v8, "setCarHeadunitConnectionType:", v7);

  }
}

- (void)_addCarPlayInfoToTraits:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  unsigned int v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = objc_msgSend(v3, "isCurrentlyConnectedToAnyCarScene");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screen"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_capabilityForKey:", _UIScreenCapabilityTouchLevelsKey));
    v8 = objc_msgSend(v7, "integerValue");

    v9 = 3;
    if ((unint64_t)v8 < 3)
      v10 = ((_DWORD)v8 + 1);
    else
      v10 = 3;
    objc_msgSend(v23, "setCarHeadunitInteractionModel:", v10);
    objc_msgSend(v6, "bounds");
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    objc_msgSend(v23, "setCarHeadunitPixelHeight:", CGRectGetHeight(v24));
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    objc_msgSend(v23, "setCarHeadunitPixelWidth:", CGRectGetWidth(v25));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "manufacturer"));
    objc_msgSend(v23, "setCarHeadunitManufacturer:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "model"));
    objc_msgSend(v23, "setCarHeadunitModel:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("CarEVSearchTestingDebug"));

    if ((v19 & 1) == 0)
    {
      v20 = objc_msgSend(v15, "hasEngineType");
      v21 = v23;
      if (!v20)
        goto LABEL_16;
      objc_msgSend(v23, "clearEngineTypes");
      v22 = objc_msgSend(v15, "engineType");
      if ((v22 & 1) != 0)
        objc_msgSend(v23, "addEngineType:", 1);
      if ((v22 & 4) != 0)
        objc_msgSend(v23, "addEngineType:", 3);
      v21 = v23;
      if ((v22 & 2) != 0)
      {
        objc_msgSend(v23, "addEngineType:", 2);
        v21 = v23;
      }
      if ((v22 & 8) == 0)
        goto LABEL_16;
      v9 = 4;
    }
    objc_msgSend(v23, "addEngineType:", v9);
    v21 = v23;
LABEL_16:
    objc_msgSend(v21, "setSupportDirectionIntentAutocomplete:", 0);
    objc_msgSend(v23, "setSupportDirectionIntentSearch:", 0);
    objc_msgSend(v23, "setSupportUnresolvedDirectionIntent:", 0);
    objc_msgSend(v23, "setSupportClientRankingFeatureMetadata:", 0);
    objc_msgSend(v23, "setSupportClientRankingCompositeFeatures:", 0);
    objc_msgSend(v23, "setSupportStructuredRapAffordance:", 0);

  }
}

- (void)_addInVehicleInfoToTraits:(id)a3
{
  _objc_msgSend(a3, "hasDeviceInVehicle");
}

- (id)ticketForReverseGeocodeCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  void *v7;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService ticketForReverseGeocodeCoordinate:traits:](self, "ticketForReverseGeocodeCoordinate:traits:", v6, latitude, longitude));

  return v7;
}

- (id)ticketForReverseGeocodeLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService ticketForReverseGeocodeLocation:traits:](self, "ticketForReverseGeocodeLocation:traits:", v4, v5));

  return v6;
}

- (id)ticketForMapItemToRefine:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService ticketForMapItemToRefine:traits:](self, "ticketForMapItemToRefine:traits:", v4, v5));

  return v6;
}

- (id)_ticketForSearchQuery:(id)a3 completionItem:(id)a4 retainedSearch:(id)a5 traits:(id)a6 searchSessionData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:retainedSearch:maxResults:traits:searchSessionData:", v16, v15, v14, +[MKMapService searchMaxResults](MKMapService, "searchMaxResults"), v13, v12));

  return v17;
}

- (id)ticketForSearchQuery:(id)a3 completionItem:(id)a4 traits:(id)a5 searchSessionData:(id)a6
{
  return -[MKMapService _ticketForSearchQuery:completionItem:retainedSearch:traits:searchSessionData:](self, "_ticketForSearchQuery:completionItem:retainedSearch:traits:searchSessionData:", a3, a4, 0, a5, a6);
}

- (id)ticketForQuerySearch:(id)a3 source:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapRegion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService mapsDefaultTraitsForMapRegion:source:](self, "mapsDefaultTraitsForMapRegion:source:", v7, v4));

  if (objc_msgSend(v6, "hasLanguage"))
  {
    if (objc_msgSend(v8, "deviceDisplayLanguagesCount"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceDisplayLanguages"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "language"));
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceDisplayLanguages"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "language"));
        objc_msgSend(v13, "removeObject:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceDisplayLanguages"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "language"));
        objc_msgSend(v15, "insertObject:atIndex:", v16, 0);

      }
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "query"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService _ticketForSearchQuery:completionItem:retainedSearch:traits:searchSessionData:](self, "_ticketForSearchQuery:completionItem:retainedSearch:traits:searchSessionData:", v17, 0, 0, v8, 0));

  return v18;
}

- (id)ticketForURLQuery:(id)a3 identifier:(id)a4 resultProviderId:(int)a5 contentProvider:(id)a6 traits:(id)a7 source:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a5;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  if (!v14)
    v14 = (id)objc_claimAutoreleasedReturnValue(-[MKMapService _mapsDefaultTraits](self, "_mapsDefaultTraits"));
  objc_msgSend(v14, "setSource:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService ticketForURLQuery:identifier:resultProviderId:contentProvider:maxResults:traits:](self, "ticketForURLQuery:identifier:resultProviderId:contentProvider:maxResults:traits:", v17, v16, v10, v15, +[MKMapService searchMaxResults](MKMapService, "searchMaxResults"), v14));

  return v18;
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 routeIndex:(unint64_t)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v10;
  id v11;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v11 = a5;
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEORouteDetails routeDetailsWithResultIndex:](GEORouteDetails, "routeDetailsWithResultIndex:", a6));
  -[MKMapService captureUserAction:onTarget:eventValue:routeDetails:](self, "captureUserAction:onTarget:eventValue:routeDetails:", v8, v7, v11, v10);

}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 resultIndex:(int)a7
{
  -[MKMapService captureUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:](self, "captureUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, *(_QWORD *)&a7, 0.0);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5 mapItem:(id)a6 timestamp:(double)a7 resultIndex:(int)a8
{
  uint64_t v8;

  LODWORD(v8) = 0;
  -[MKMapService capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:](self, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, *(_QWORD *)&a8, 0, a7, 0, 0, 0, 0, v8, 0, 0, 0);
}

- (id)_maps_ticketForSearchHistoryEntry:(id)a3 source:(int)a4 traits:(id)a5 isRedoOrAutoRedoSearch:(BOOL)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  if (!a6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapRegion"));
    objc_msgSend(v11, "setMapRegion:", v12);

  }
  if ((_DWORD)v8)
    objc_msgSend(v11, "setSource:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "languageCode"));
  if (v13)
  {
    if (objc_msgSend(v11, "deviceDisplayLanguagesCount"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceDisplayLanguages"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
      v16 = objc_msgSend(v15, "isEqualToString:", v13);

      if ((v16 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceDisplayLanguages"));
        objc_msgSend(v17, "removeObject:", v13);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceDisplayLanguages"));
        objc_msgSend(v18, "insertObject:atIndex:", v13, 0);

      }
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "query"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapService ticketForSearchQuery:completionItem:traits:searchSessionData:](self, "ticketForSearchQuery:completionItem:traits:searchSessionData:", v19, 0, v11, 0));

  return v20;
}

@end

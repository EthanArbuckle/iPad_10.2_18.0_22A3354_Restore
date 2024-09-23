@implementation SearchResult

- (SearchResult)initWithDroppedPin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  SearchResult *v13;

  v4 = a3;
  if (objc_msgSend(v4, "hasLatLng"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v5, "lat");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v8, "lng");
    v10 = v9;

    if (self)
    {
      self = -[SearchResult initWithType:](self, "initWithType:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult defaultName](self, "defaultName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      objc_msgSend(v12, "setName:", v11);

      -[SearchResult setCoordinate:](self, "setCoordinate:", v7, v10);
      objc_msgSend(v4, "timestamp");
      -[SearchResultRepr setTimestamp:](self, "setTimestamp:");
      if (objc_msgSend(v4, "hasFloorOrdinal"))
        -[SearchResultRepr setFloorOrdinal:](self, "setFloorOrdinal:", objc_msgSend(v4, "floorOrdinal"));
    }
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (SearchResult)initWithBookmarkStorage:(id)a3
{
  id v5;
  SearchResult *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  SearchResult *v15;

  v5 = a3;
  if (objc_msgSend(v5, "type") == 1)
  {
    v6 = -[SearchResult init](self, "init");
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItemStorage"));
      -[SearchResult updateWithGEOMapItem:](v6, "updateWithGEOMapItem:", v8);

      objc_storeStrong((id *)&v6->_bookmarkStorage, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      -[SearchResultRepr setSyncIdentifier:](v6, "setSyncIdentifier:", v9);

      objc_msgSend(v5, "timestamp");
      -[SearchResultRepr setTimestamp:](v6, "setTimestamp:");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
      LODWORD(v7) = objc_msgSend(v10, "origin");

      if ((_DWORD)v7 == 1)
      {
        -[SearchResult setOriginalType:](v6, "setOriginalType:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
        v12 = objc_msgSend(v11, "hasDroppedPinCoordinate");

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "droppedPinCoordinate"));
          -[SearchResult setCoordinate:](v6, "setCoordinate:", CLLocationCoordinate2DFromGEOLocationCoordinate2D(objc_msgSend(v14, "coordinate")));

        }
      }
      -[SearchResult markAsOriginatingFromBookmarks](v6, "markAsOriginatingFromBookmarks");
    }
    self = v6;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MSPBookmarkStorage)bookmarkStorage
{
  MSPBookmarkStorage **p_bookmarkStorage;
  MSPBookmarkStorage *bookmarkStorage;
  MSPBookmarkStorage *v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  p_bookmarkStorage = &self->_bookmarkStorage;
  bookmarkStorage = self->_bookmarkStorage;
  if (bookmarkStorage)
  {
    v4 = bookmarkStorage;
    return v4;
  }
  v4 = (MSPBookmarkStorage *)objc_alloc_init((Class)MSPBookmarkStorage);
  -[MSPBookmarkStorage setType:](v4, "setType:", 1);
  v6 = objc_alloc_init((Class)MSPPlaceBookmark);
  -[MSPBookmarkStorage setPlaceBookmark:](v4, "setPlaceBookmark:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItemStorageForPersistence"));

  v9 = objc_alloc_init((Class)GEOMapItemStorage);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](v4, "placeBookmark"));
  objc_msgSend(v10, "setMapItemStorage:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeData"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](v4, "placeBookmark"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItemStorage"));
    objc_msgSend(v14, "setPlaceData:", v12);
LABEL_7:

    goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));

  if (v15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](v4, "placeBookmark"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItemStorage"));
    objc_msgSend(v14, "setPlace:", v12);
    goto LABEL_7;
  }
LABEL_8:
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[MSPBookmarkStorage setTimestamp:](v4, "setTimestamp:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  -[MSPBookmarkStorage setIdentifier:](v4, "setIdentifier:", v17);

  if (-[SearchResultRepr originalType](self, "originalType") == 3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](v4, "placeBookmark"));
    objc_msgSend(v18, "setOrigin:", 1);

    -[SearchResult coordinate](self, "coordinate");
    v21 = objc_msgSend(objc_alloc((Class)GEOLatLng), "initWithLatitude:longitude:", v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](v4, "placeBookmark"));
    objc_msgSend(v22, "setDroppedPinCoordinate:", v21);

    if (-[SearchResultRepr hasFloorOrdinal](self, "hasFloorOrdinal"))
    {
      v23 = -[SearchResultRepr floorOrdinal](self, "floorOrdinal");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](v4, "placeBookmark"));
      objc_msgSend(v24, "setDroppedPinFloorOrdinal:", v23);

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](self, "title"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](v4, "placeBookmark"));
  objc_msgSend(v26, "setTitle:", v25);

  objc_storeStrong((id *)p_bookmarkStorage, v4);
  return v4;
}

- (CLLocationCoordinate2D)_offsetCoordinate:(double)a3
{
  MKMapPoint v4;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v7;
  CLLocationCoordinate2D v8;
  MKMapPoint v9;
  CLLocationCoordinate2D result;

  -[SearchResult coordinate](self, "coordinate");
  v4 = MKMapPointForCoordinate(v8);
  v9.x = v4.x * a3 / a3;
  v9.y = (v4.y * a3 + -25.0) / a3;
  v7 = MKCoordinateForMapPoint(v9);
  longitude = v7.longitude;
  latitude = v7.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)updateModel:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SearchResult *v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult composedWaypoint](self, "composedWaypoint"));
  v5 = objc_opt_class(GEOComposedWaypointToRoute);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult composedWaypoint](self, "composedWaypoint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userProvidedName"));
    if (objc_msgSend(v9, "length"))
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userProvidedName"));
    else
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v11 = (void *)v10;
    objc_msgSend(v19, "setFirstLine:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "distanceAndElevationString"));
    objc_msgSend(v19, "setSecondLine:", v12);

    v13 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v13, "mapItem"));
    objc_msgSend(v19, "setMapItem:", v14);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    objc_msgSend(v7, "updateModel:", v19);
  }

  v15 = (objc_class *)objc_opt_class(self);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v17));
  objc_msgSend(v19, "setDebugSubtitle:", v18);

}

- (id)_maps_externalDeviceDictionaryRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_maps_externalDeviceDictionaryRepresentation"));

  return v3;
}

- (unint64_t)customizedLocationType
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;

  if (!-[SearchResult isFindMyPerson](self, "isFindMyPerson"))
  {
    if (-[SearchResultRepr type](self, "type") == 12)
      return 5;
    v4 = objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address"));
    v5 = objc_claimAutoreleasedReturnValue(-[SearchResult locationOfInterest](self, "locationOfInterest"));
    if (v4 | v5)
    {
      if (objc_msgSend((id)v4, "addressType") != 1 && (!v5 || objc_msgSend((id)v5, "type")))
      {
        if (objc_msgSend((id)v4, "addressType") == 2 || v5 && objc_msgSend((id)v5, "type") == (id)1)
        {
          v3 = 2;
        }
        else if (objc_msgSend((id)v4, "addressType") == 3 || v5 && objc_msgSend((id)v5, "type") == (id)2)
        {
          v3 = 3;
        }
        else
        {
          v3 = 0;
        }
        goto LABEL_12;
      }
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
      v7 = objc_msgSend(v6, "_maps_isHome");

      if ((v7 & 1) == 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
        v9 = objc_msgSend(v8, "_maps_isWork");

        if (v9)
          v3 = 2;
        else
          v3 = 0;
        goto LABEL_12;
      }
    }
    v3 = 1;
LABEL_12:

    return v3;
  }
  return 4;
}

- (MKMapItemIdentifier)identifier
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = objc_alloc((Class)MKMapItemIdentifier);
  v4 = -[SearchResult businessID](self, "businessID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v6 = objc_msgSend(v5, "_resultProviderID");
  -[SearchResult coordinate](self, "coordinate");
  v7 = objc_msgSend(v3, "initWithMUID:resultProviderID:coordinate:", v4, v6);

  return (MKMapItemIdentifier *)v7;
}

- (void)tryUpdatingCurrentLocationSearchResultWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (-[SearchResult isDynamicCurrentLocation](self, "isDynamicCurrentLocation")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager")), v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation")), v5, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ticketForReverseGeocodeLocation:", v6));

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100868ECC;
    v9[3] = &unk_1011B21F8;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    objc_msgSend(v8, "submitWithHandler:networkActivity:", v9, 0);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (SearchResult)initWithMapItem:(id)a3 searchResultType:(unsigned int)a4 addressBookAddress:(id)a5 retainedSearchMetadata:(id)a6 resultIndex:(int)a7
{
  uint64_t v7;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  SearchResult *v15;
  SearchResult *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SearchResult *v21;

  v7 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = -[SearchResult initWithMapItem:](self, "initWithMapItem:", v12);
  v16 = v15;
  if (v15)
  {
    if (v13)
    {
      -[SearchResult setAddress:](v15, "setAddress:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](v16, "address"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "compositeName"));
      objc_msgSend(v12, "setName:", v18);

    }
    -[SearchResult setType:](v16, "setType:", v10);
    -[SearchResult setOriginalType:](v16, "setOriginalType:", v10);
    -[SearchResult setRetainedSearchMetadata:](v16, "setRetainedSearchMetadata:", v14);
    if ((v7 & 0x80000000) == 0)
      -[SearchResultRepr setResultIndex:](v16, "setResultIndex:", v7);
    -[SearchResultRepr setHasIncompleteNavData:](v16, "setHasIncompleteNavData:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v16, "mapItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_geoMapItem"));
    -[SearchResult setLocationOfInterestWithGeoMapItem:](v16, "setLocationOfInterestWithGeoMapItem:", v20);

    v21 = v16;
  }

  return v16;
}

- (SearchResult)initWithMapItem:(id)a3 searchResultType:(unsigned int)a4 resultIndex:(int)a5
{
  return -[SearchResult initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:](self, "initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:", a3, *(_QWORD *)&a4, 0, 0, *(_QWORD *)&a5);
}

- (void)updateWithReverseGeocodedMapItem:(id)a3
{
  SearchResult *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[SearchResult isDynamicCurrentLocation](v4, "isDynamicCurrentLocation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult defaultName](v4, "defaultName"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v4, "mapItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v4, "mapItem"));
  objc_msgSend(v7, "_coordinate");
  v9 = v8;
  v11 = v10;

  -[SearchResultRepr setHasIncompleteNavData:](v4, "setHasIncompleteNavData:", 0);
  -[SearchResultRepr setHasIncompleteMetadata:](v4, "setHasIncompleteMetadata:", 0);
  -[SearchResult setMapItem:](v4, "setMapItem:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "place"));
  -[SearchResultRepr setPlace:](v4, "setPlace:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v4, "mapItem"));
  objc_msgSend(v13, "setName:", v5);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](v4, "place"));
  objc_msgSend(v14, "setCenterCoordinate:", v9, v11);

  -[SearchResult setReverseGeocoded:](v4, "setReverseGeocoded:", 1);
  -[SearchResult clearAddressCache](v4, "clearAddressCache");

  objc_sync_exit(v4);
}

- (NSString)findMyHandleName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult findMyHandle](self, "findMyHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));

  return (NSString *)v3;
}

- (int)localSearchProviderID
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  v3 = objc_msgSend(v2, "localSearchProviderID");

  return v3;
}

- (int64_t)source
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  int64_t v10;
  int64_t v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;

  if (-[SearchResult hasOriginatedFromBookmarks](self, "hasOriginatedFromBookmarks"))
    return 5;
  if (-[SearchResult hasOriginatedFromExternal](self, "hasOriginatedFromExternal"))
    return 6;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact _mapkit_sharedLocationContactIdentifer](CNContact, "_mapkit_sharedLocationContactIdentifer"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v9 = v8 == 0;
    v10 = 3;
    v11 = 9;
    goto LABEL_7;
  }
  if (-[SearchResult geoMapServiceTraitSource](self, "geoMapServiceTraitSource"))
  {
    if (-[SearchResult geoMapServiceTraitSource](self, "geoMapServiceTraitSource") == 1)
      return 6;
    if (-[SearchResult geoMapServiceTraitSource](self, "geoMapServiceTraitSource") == 7)
      return 7;
  }
  v12 = -[SearchResultRepr originalType](self, "originalType");
  result = 0;
  if (v12 <= 0xC)
  {
    if (((1 << v12) & 0x1821) != 0)
      return 4;
    if (v12 == 3)
      return 1;
    if (v12 == 9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
      v14 = objc_msgSend(v13, "_isMapItemTypeBrand");

      v9 = v14 == 0;
      v10 = 2;
      v11 = 8;
LABEL_7:
      if (v9)
        return v10;
      else
        return v11;
    }
  }
  return result;
}

- (id)bookmarkRepresentation
{
  SyncedBookmarkRepr *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  v3 = objc_alloc_init(SyncedBookmarkRepr);
  -[SyncedBookmarkRepr setType:](v3, "setType:", 2 * (-[SearchResultRepr type](self, "type") == 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkTitle](self, "bookmarkTitle"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkTitle](self, "bookmarkTitle"));
    -[SyncedBookmarkRepr setTitle:](v3, "setTitle:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self, "singleLineAddress"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self, "singleLineAddress"));
    -[SyncedBookmarkRepr setSingleLineAddress:](v3, "setSingleLineAddress:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v9 = objc_msgSend(v8, "_resultProviderID");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    -[SyncedBookmarkRepr setProviderID:](v3, "setProviderID:", objc_msgSend(v10, "_resultProviderID"));

  }
  if (-[SearchResult businessID](self, "businessID"))
    -[SyncedBookmarkRepr setBusinessID:](v3, "setBusinessID:", -[SearchResult businessID](self, "businessID"));
  -[SearchResult coordinate](self, "coordinate");
  if (v12 >= -180.0 && v12 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
  {
    -[SearchResult coordinate](self, "coordinate");
    -[SyncedBookmarkRepr setLatitude:](v3, "setLatitude:");
    -[SearchResult coordinate](self, "coordinate");
    -[SyncedBookmarkRepr setLongitude:](v3, "setLongitude:", v13);
  }
  return v3;
}

- (SearchResult)initWithSearchResult:(id)a3 address:(id)a4
{
  id v7;
  SearchResult *v8;
  SearchResult *v9;

  v7 = a4;
  v8 = -[SearchResult initWithSearchResult:](self, "initWithSearchResult:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_address, a4);

  return v9;
}

- (SearchResult)initWithSearchResultStrippingName:(id)a3 address:(id)a4
{
  SearchResult *v4;
  SearchResult *v5;
  void *v6;

  v4 = -[SearchResult initWithSearchResult:address:](self, "initWithSearchResult:address:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](v4, "place"));
    objc_msgSend(v6, "setName:", 0);

  }
  return v5;
}

- (void)setAddress:(id)a3
{
  AddressBookAddress *v5;
  AddressBookAddress *v6;

  v5 = (AddressBookAddress *)a3;
  if (self->_address != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_address, a3);
    v5 = v6;
  }

}

- (void)setAutocompletePerson:(id)a3
{
  _TtC4Maps22MapsAutocompletePerson *v5;
  _TtC4Maps22MapsAutocompletePerson *v6;

  v5 = (_TtC4Maps22MapsAutocompletePerson *)a3;
  if (self->_autocompletePerson != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_autocompletePerson, a3);
    v5 = v6;
  }

}

- (BOOL)isAddressBookResult
{
  return -[AddressBookAddress isValid](self->_address, "isValid");
}

- (void)_commonInit
{
  double v3;
  double v4;
  id v5;

  -[SearchResultRepr setZoomLevel:](self, "setZoomLevel:", 0xFFFFFFFFLL);
  v3 = MKCoordinateInvalid[0];
  v4 = MKCoordinateInvalid[1];
  -[SearchResult setCoordinate:](self, "setCoordinate:", MKCoordinateInvalid[0], v4);
  -[SearchResult setLabelCoordinate:](self, "setLabelCoordinate:", v3, v4);
  -[SearchResultRepr setHasIncompleteMetadata:](self, "setHasIncompleteMetadata:", 0);
  -[SearchResultRepr setTimestamp:](self, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  v5 = objc_alloc_init((Class)GEOPlace);
  -[SearchResultRepr setPlace:](self, "setPlace:", v5);
  -[SearchResult _updateTypeAndOriginalTypeIfNeeded](self, "_updateTypeAndOriginalTypeIfNeeded");

}

- (SearchResult)init
{
  SearchResult *v2;
  SearchResult *v3;
  SearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchResult;
  v2 = -[SearchResult init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[SearchResult _commonInit](v2, "_commonInit");
    v4 = v3;
  }

  return v3;
}

- (SearchResult)initWithData:(id)a3
{
  SearchResult *v3;
  SearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchResult;
  v3 = -[SearchResult initWithData:](&v6, "initWithData:", a3);
  v4 = v3;
  if (v3)
    -[SearchResult _updateTypeAndOriginalTypeIfNeeded](v3, "_updateTypeAndOriginalTypeIfNeeded");
  return v4;
}

- (SearchResult)initWithSearchResult:(id)a3
{
  _QWORD *v4;
  SearchResult *v5;
  SearchResult *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MSPBookmarkStorage *v21;
  MSPBookmarkStorage *bookmarkStorage;
  void *v23;
  GEOComposedWaypoint *v24;
  GEOComposedWaypoint *composedWaypoint;
  void *v26;
  void *v27;
  GEORPPlaceInfo *v28;
  GEORPPlaceInfo *placeInfo;
  uint64_t v30;
  _TtC4Maps22MapsAutocompletePerson *autocompletePerson;
  uint64_t v32;
  _TtC4Maps16MapsFindMyHandle *findMyHandle;
  uint64_t v34;
  GEOComposedGeometryRoutePersistentData *routeData;
  SearchResult *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SearchResult;
  v5 = -[SearchResult init](&v38, "init");
  v6 = v5;
  if (v5)
  {
    -[SearchResult _commonInit](v5, "_commonInit");
    if (objc_msgSend(v4, "hasTimestamp"))
    {
      objc_msgSend(v4, "timestamp");
      -[SearchResultRepr setTimestamp:](v6, "setTimestamp:");
    }
    if (objc_msgSend(v4, "hasResultIndex"))
      -[SearchResultRepr setResultIndex:](v6, "setResultIndex:", objc_msgSend(v4, "resultIndex"));
    -[SearchResult setType:](v6, "setType:", objc_msgSend(v4, "type"));
    -[SearchResult setOriginalType:](v6, "setOriginalType:", objc_msgSend(v4, "originalType"));
    -[SearchResultRepr setZoomLevel:](v6, "setZoomLevel:", objc_msgSend(v4, "zoomLevel"));
    objc_msgSend(v4, "coordinate");
    -[SearchResult setCoordinate:](v6, "setCoordinate:");
    objc_msgSend(v4, "labelCoordinate");
    -[SearchResult setLabelCoordinate:](v6, "setLabelCoordinate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
    v8 = objc_msgSend(v7, "copy");

    -[SearchResultRepr setPlace:](v6, "setPlace:", v8);
    if (-[SearchResultRepr type](v6, "type") - 5 <= 0xFFFFFFFD && objc_msgSend(v4, "hasMapsURL"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsURL"));
      -[SearchResultRepr setMapsURL:](v6, "setMapsURL:", v9);

    }
    -[SearchResult clearAddressCache](v6, "clearAddressCache");
    -[SearchResult setReverseGeocoded:](v6, "setReverseGeocoded:", objc_msgSend(v4, "isReverseGeocoded"));
    -[SearchResult setOriginatedFromExternal:](v6, "setOriginatedFromExternal:", objc_msgSend(v4, "hasOriginatedFromExternal"));
    -[SearchResult setGeoMapServiceTraitSource:](v6, "setGeoMapServiceTraitSource:", objc_msgSend(v4, "geoMapServiceTraitSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceURL"));
    -[SearchResult setSourceURL:](v6, "setSourceURL:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceApplication"));
    -[SearchResult setSourceApplication:](v6, "setSourceApplication:", v11);

    if (objc_msgSend(v4, "hasHasIncompleteNavData"))
      -[SearchResultRepr setHasIncompleteNavData:](v6, "setHasIncompleteNavData:", objc_msgSend(v4, "hasIncompleteNavData"));
    if (v4)
    {
      v12 = (void *)v4[49];
      if (v12)
        objc_storeStrong((id *)&v6->_address, v12);
      v13 = (void *)v4[42];
      if (v13)
        objc_storeStrong((id *)&v6->_autocompletePerson, v13);
      v14 = (void *)v4[43];
      if (v14)
        objc_storeStrong((id *)&v6->_findMyHandle, v14);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationOfInterest"));
    -[SearchResult setLocationOfInterest:](v6, "setLocationOfInterest:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    -[SearchResult setMapItem:](v6, "setMapItem:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncIdentifier"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncIdentifier"));
      -[SearchResultRepr setSyncIdentifier:](v6, "setSyncIdentifier:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookmarkStorage"));
    v20 = v19;
    if (v19)
      v21 = (MSPBookmarkStorage *)objc_msgSend(v19, "copy");
    else
      v21 = (MSPBookmarkStorage *)objc_alloc_init((Class)MSPBookmarkStorage);
    bookmarkStorage = v6->_bookmarkStorage;
    v6->_bookmarkStorage = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedWaypoint"));
    v24 = (GEOComposedWaypoint *)objc_msgSend(v23, "copy");
    composedWaypoint = v6->_composedWaypoint;
    v6->_composedWaypoint = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeInfo"));
    v27 = v26;
    if (v26)
    {
      v28 = (GEORPPlaceInfo *)objc_msgSend(v26, "copy");
      placeInfo = v6->_placeInfo;
      v6->_placeInfo = v28;

    }
    if (objc_msgSend(v4, "hasFloorOrdinal"))
      -[SearchResultRepr setFloorOrdinal:](v6, "setFloorOrdinal:", objc_msgSend(v4, "floorOrdinal"));
    v6->_originatedFromBookmarks = objc_msgSend(v4, "hasOriginatedFromBookmarks");
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));
    autocompletePerson = v6->_autocompletePerson;
    v6->_autocompletePerson = (_TtC4Maps22MapsAutocompletePerson *)v30;

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMyHandle"));
    findMyHandle = v6->_findMyHandle;
    v6->_findMyHandle = (_TtC4Maps16MapsFindMyHandle *)v32;

    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeData"));
    routeData = v6->_routeData;
    v6->_routeData = (GEOComposedGeometryRoutePersistentData *)v34;

    v36 = v6;
  }

  return v6;
}

- (SearchResult)initWithMapItem:(id)a3 syncIdentifier:(id)a4
{
  id v6;
  SearchResult *v7;
  SearchResult *v8;
  void *v9;

  v6 = a4;
  v7 = -[SearchResult initWithMapItem:](self, "initWithMapItem:", a3);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkStorage](v7, "bookmarkStorage"));
    objc_msgSend(v9, "setIdentifier:", v6);

    -[SearchResultRepr setSyncIdentifier:](v8, "setSyncIdentifier:", v6);
  }

  return v8;
}

- (SearchResult)initWithMapItem:(id)a3
{
  id v4;
  SearchResult *v5;
  SearchResult *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SearchResult *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SearchResult;
  v5 = -[SearchResult init](&v23, "init");
  v6 = v5;
  if (v5)
  {
    -[SearchResult _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "_coordinate");
    -[SearchResult setCoordinate:](v6, "setCoordinate:");
    objc_msgSend(v4, "_labelCoordinate");
    -[SearchResult setLabelCoordinate:](v6, "setLabelCoordinate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
    -[SearchResultRepr setPlace:](v6, "setPlace:", v7);

    -[SearchResult setMapItem:](v6, "setMapItem:", v4);
    if (objc_msgSend(v4, "_hasMUID"))
      v8 = objc_msgSend(v4, "_muid");
    else
      v8 = 0;
    v6->_businessID = (unint64_t)v8;
    v9 = (objc_msgSend(v4, "_hasResolvablePartialInformation") & 1) != 0
      || -[SearchResult isPartiallyClientized](v6, "isPartiallyClientized");
    -[SearchResultRepr setHasIncompleteMetadata:](v6, "setHasIncompleteMetadata:", v9);
    -[SearchResult setType:](v6, "setType:", 0);
    -[SearchResult setOriginalType:](v6, "setOriginalType:", -[SearchResultRepr type](v6, "type"));
    -[SearchResult clearAddressCache](v6, "clearAddressCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](v6, "place"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "address"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "structuredAddress"));

    v13 = 0;
    if ((objc_msgSend(v12, "hasSubThoroughfare") & 1) == 0)
      v13 = objc_msgSend(v12, "hasFullThoroughfare") ^ 1;
    if (!objc_msgSend(v4, "_hasMUID") || objc_msgSend(v10, "hasSpokenName"))
    {
      -[SearchResult coordinate](v6, "coordinate");
      v16 = v15 < -180.0;
      if (v15 > 180.0)
        v16 = 1;
      if (v14 < -90.0)
        v16 = 1;
      if (v14 > 90.0)
        v16 = 1;
      if (((v16 | v13) & 1) != 0)
      {
        if (!v16)
          goto LABEL_24;
      }
      else if ((objc_msgSend(v10, "hasSpokenAddress") & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entryPoints"));
        v18 = objc_msgSend(v17, "count");

        if (v18)
          goto LABEL_24;
      }
    }
    -[SearchResultRepr setHasIncompleteNavData:](v6, "setHasIncompleteNavData:", 1);
LABEL_24:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v6, "mapItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_geoMapItem"));
    -[SearchResult setLocationOfInterestWithGeoMapItem:](v6, "setLocationOfInterestWithGeoMapItem:", v20);

    v21 = v6;
  }

  return v6;
}

- (SearchResult)initWithGEOPlace:(id)a3
{
  id v4;
  id v5;
  SearchResult *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlace:", v4);

  v6 = -[SearchResult initWithMapItem:](self, "initWithMapItem:", v5);
  return v6;
}

- (SearchResult)initWithGEOMapItem:(id)a3
{
  id v4;
  id v5;
  SearchResult *v6;
  SearchResult *v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v4, 0);

  v6 = -[SearchResult initWithMapItem:](self, "initWithMapItem:", v5);
  if (v6)
    v7 = v6;

  return v6;
}

- (SearchResult)initWithRelatedSection:(id)a3
{
  id v5;
  SearchResult *v6;
  SearchResult *v7;

  v5 = a3;
  v6 = -[SearchResult init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_relatedSection, a3);
    -[SearchResult setType:](v7, "setType:", 11);
    -[SearchResult setOriginalType:](v7, "setOriginalType:", 11);
  }

  return v7;
}

- (SearchResult)initWithSearchSection:(id)a3
{
  id v5;
  SearchResult *v6;
  SearchResult *v7;

  v5 = a3;
  v6 = -[SearchResult init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchSection, a3);
    -[SearchResult setType:](v7, "setType:", 11);
    -[SearchResult setOriginalType:](v7, "setOriginalType:", 11);
  }

  return v7;
}

- (SearchResult)initWithCuratedGuide:(id)a3
{
  id v5;
  SearchResult *v6;
  SearchResult *v7;

  v5 = a3;
  v6 = -[SearchResult init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_placeCollection, a3);

  return v7;
}

- (SearchResult)initWithParkedCar:(id)a3
{
  id v4;
  void *v5;
  SearchResult *v6;
  CLLocationDegrees v7;
  CLLocationDegrees v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  v6 = -[SearchResult initWithMapItem:](self, "initWithMapItem:", v5);

  if (v6)
  {
    -[SearchResult setType:](v6, "setType:", 12);
    -[SearchResult setOriginalType:](v6, "setOriginalType:", 12);
    objc_msgSend(v4, "coordinate");
    v6->_coordinate.latitude = v7;
    v6->_coordinate.longitude = v8;
  }

  return v6;
}

- (SearchResult)initWithComposedWaypoint:(id)a3
{
  return -[SearchResult initWithComposedWaypoint:preserveLocationInfo:](self, "initWithComposedWaypoint:preserveLocationInfo:", a3, 1);
}

- (SearchResult)initWithComposedWaypoint:(id)a3 preserveLocationInfo:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SearchResult *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  SearchResult *v32;

  v4 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v9));
    v11 = -[SearchResult initWithMapItem:](self, "initWithMapItem:", v10);

    if (!v11)
      goto LABEL_30;
LABEL_10:
    if ((objc_msgSend(v7, "isCurrentLocation") & 1) != 0)
    {
      v15 = 4;
    }
    else
    {
      if (!objc_msgSend(v7, "isLocationWaypointType"))
      {
LABEL_15:
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "findMyHandleID"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "findMyHandle"));
          -[SearchResult setFindMyHandle:](v11, "setFindMyHandle:", v17);

          -[SearchResult setLocationType:](v11, "setLocationType:", 4);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressBookAddress"));

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressBookAddress"));
          -[SearchResult setAddress:](v11, "setAddress:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](v11, "address"));
          v21 = objc_msgSend(v20, "isMeCard");

          if ((v21 & 1) == 0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](v11, "address"));
            v23 = objc_msgSend(v22, "addressType");
            if (v23 - 1 >= 3)
              v24 = 0;
            else
              v24 = v23;
            -[SearchResult setLocationType:](v11, "setLocationType:", v24);

          }
        }
        if ((objc_msgSend(v7, "hasLatLng") & 1) != 0 || objc_msgSend(v7, "hasLocation"))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "latLng"));
          v26 = v25;
          if (v25)
          {
            v27 = v25;
          }
          else
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
            v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "latLng"));

          }
          objc_msgSend(v27, "lat");
          v30 = v29;
          objc_msgSend(v27, "lng");
          -[SearchResult setCoordinate:preserveLocationInfo:](v11, "setCoordinate:preserveLocationInfo:", v4, v30, v31);

        }
        objc_storeStrong((id *)&v11->_composedWaypoint, a3);
        v11->_hasExplicitlyProvidedComposedWaypoint = 1;
        goto LABEL_30;
      }
      v15 = 3;
    }
    -[SearchResult setType:](v11, "setType:", v15);
    -[SearchResult setOriginalType:](v11, "setOriginalType:", v15);
    goto LABEL_15;
  }
  if (!objc_msgSend(v7, "isCurrentLocation"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "findMyHandleID"));
    if (v12)
    {

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressBookAddress"));

      if (!v13)
      {
        v14 = objc_opt_class(GEOComposedWaypointToRoute);
        if ((objc_opt_isKindOfClass(v7, v14) & 1) == 0)
        {
          v32 = 0;
          goto LABEL_31;
        }
      }
    }
  }
  v11 = -[SearchResult init](self, "init");
  if (v11)
    goto LABEL_10;
LABEL_30:
  self = v11;
  v32 = self;
LABEL_31:

  return v32;
}

- (void)setLocationOfInterestWithGeoMapItem:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  MapsLocationOfInterest *v8;
  void *v9;
  MapsLocationOfInterest *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  MapsLocationOfInterest *v14;
  void *v15;
  unsigned int v16;
  MapsLocationOfInterest *v17;
  MapsLocationOfInterest *v18;
  id v19;

  v19 = a3;
  v4 = objc_msgSend(v19, "contactIsMe");
  v5 = v19;
  if (v4)
  {
    if (objc_msgSend(v19, "contactAddressType") == 1
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address")),
          v7 = objc_msgSend(v6, "addressType"),
          v6,
          v7 == 1))
    {
      v8 = [MapsLocationOfInterest alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
      v10 = v8;
      v11 = 0;
LABEL_11:
      v18 = -[MapsLocationOfInterest initWithLocationOfInterestType:mapItem:](v10, "initWithLocationOfInterestType:mapItem:", v11, v9);
      -[SearchResult setLocationOfInterest:](self, "setLocationOfInterest:", v18);

      v5 = v19;
      goto LABEL_12;
    }
    if (objc_msgSend(v19, "contactAddressType") == 2
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address")),
          v13 = objc_msgSend(v12, "addressType"),
          v12,
          v13 == 2))
    {
      v14 = [MapsLocationOfInterest alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
      v10 = v14;
      v11 = 1;
      goto LABEL_11;
    }
    if (objc_msgSend(v19, "contactAddressType") == 3
      || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address")),
          v16 = objc_msgSend(v15, "addressType"),
          v15,
          v5 = v19,
          v16 == 3))
    {
      v17 = [MapsLocationOfInterest alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
      v10 = v17;
      v11 = 2;
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)setComposedWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_composedWaypoint, a3);
  self->_hasExplicitlyProvidedComposedWaypoint = a3 != 0;
}

- (GEOComposedWaypoint)composedWaypoint
{
  GEOComposedWaypoint *composedWaypoint;
  void *v4;
  id v5;
  void *v6;
  GEOComposedWaypoint *v7;
  void *v8;
  GEOComposedWaypoint *v9;
  GEOComposedWaypoint *v10;
  GEOComposedWaypoint *v11;

  composedWaypoint = self->_composedWaypoint;
  if (!composedWaypoint)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult routeData](self, "routeData"));

    if (v4)
    {
      v5 = objc_alloc((Class)GEORouteBuilder_PersistentData);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult routeData](self, "routeData"));
      v7 = (GEOComposedWaypoint *)objc_msgSend(v5, "initWithPersistentData:", v6);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint buildRoute](v7, "buildRoute"));
      v9 = (GEOComposedWaypoint *)objc_msgSend(objc_alloc((Class)GEOComposedWaypointToRoute), "initWithRoute:", v8);
      v10 = self->_composedWaypoint;
      self->_composedWaypoint = v9;

    }
    else
    {
      v11 = (GEOComposedWaypoint *)objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithSearchResult:", self);
      v7 = self->_composedWaypoint;
      self->_composedWaypoint = v11;
    }

    composedWaypoint = self->_composedWaypoint;
  }
  return composedWaypoint;
}

- (void)setRouteData:(id)a3
{
  SearchResult *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;

  v4 = self;
  objc_storeStrong((id *)&self->_routeData, a3);
  v5 = a3;
  v4 = (SearchResult *)((char *)v4 + 208);
  objc_msgSend(v5, "originCoordinate");
  v7 = v6;
  v9 = v8;

  *(_QWORD *)v4->super.PBCodable_opaque = v7;
  v4->super._obsoleteCid = v9;
}

- (void)updateWithGEOMapItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_clientAttributes"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_clientAttributes"));
  if (v7 || !v6)
  {
    v9 = v14;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v14, v6));

    v9 = (id)v8;
  }
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:"));
  objc_msgSend(v10, "_coordinate");
  -[SearchResult setCoordinate:](self, "setCoordinate:");
  objc_msgSend(v10, "_labelCoordinate");
  -[SearchResult setLabelCoordinate:](self, "setLabelCoordinate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "place"));
  -[SearchResultRepr setPlace:](self, "setPlace:", v11);

  -[SearchResult setMapItem:](self, "setMapItem:", v10);
  if (objc_msgSend(v10, "_hasMUID"))
    v12 = objc_msgSend(v10, "_muid");
  else
    v12 = 0;
  self->_businessID = (unint64_t)v12;
  v13 = (objc_msgSend(v10, "_hasResolvablePartialInformation") & 1) != 0
     || -[SearchResult isPartiallyClientized](self, "isPartiallyClientized");
  -[SearchResultRepr setHasIncompleteMetadata:](self, "setHasIncompleteMetadata:", v13);
  -[SearchResult setLocationOfInterestWithGeoMapItem:](self, "setLocationOfInterestWithGeoMapItem:", v15);

}

- (SearchResult)initWithType:(unsigned int)a3
{
  uint64_t v3;
  SearchResult *v4;
  SearchResult *v5;
  SearchResult *v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchResult;
  v4 = -[SearchResult init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    -[SearchResult _commonInit](v4, "_commonInit");
    -[SearchResult setType:](v5, "setType:", v3);
    -[SearchResult setOriginalType:](v5, "setOriginalType:", v3);
    v6 = v5;
  }

  return v5;
}

- (void)setType:(unsigned int)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  if (a3 == 4)
  {
LABEL_5:
    v6 = objc_alloc((Class)MKMapItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));
    v9 = objc_msgSend(v6, "initWithGeoMapItemAsCurrentLocation:", v8);
    -[SearchResult setMapItem:](self, "setMapItem:", v9);

    *(_QWORD *)&a3 = 4;
    goto LABEL_6;
  }
  if (a3 == 6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    v5 = objc_msgSend(v4, "isInternalInstall");

    if (v5)
      NSLog(CFSTR("Migrated a search result automatically to a new original type."));
    goto LABEL_5;
  }
LABEL_6:
  v10.receiver = self;
  v10.super_class = (Class)SearchResult;
  -[SearchResultRepr setType:](&v10, "setType:", *(_QWORD *)&a3);
}

- (void)setOriginalType:(unsigned int)a3
{
  void *v4;
  unsigned int v5;
  objc_super v6;

  if (a3 == 6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    v5 = objc_msgSend(v4, "isInternalInstall");

    if (v5)
      NSLog(CFSTR("Migrated a search result automatically to a new original type."));
    *(_QWORD *)&a3 = 4;
  }
  v6.receiver = self;
  v6.super_class = (Class)SearchResult;
  -[SearchResultRepr setOriginalType:](&v6, "setOriginalType:", *(_QWORD *)&a3);
}

- (void)_updateTypeAndOriginalTypeIfNeeded
{
  -[SearchResult setType:](self, "setType:", -[SearchResultRepr type](self, "type"));
  -[SearchResult setOriginalType:](self, "setOriginalType:", -[SearchResultRepr originalType](self, "originalType"));
}

- (void)markAsOriginatingFromBookmarks
{
  self->_originatedFromBookmarks = 1;
}

- (void)setGeoMapServiceTraitSource:(int)a3
{
  if (self->_geoMapServiceTraitSource != a3)
    self->_geoMapServiceTraitSource = a3;
}

- (void)setSourceURL:(id)a3
{
  NSString **p_sourceURL;
  id v5;

  p_sourceURL = &self->_sourceURL;
  v5 = a3;
  if (!-[NSString isEqualToString:](*p_sourceURL, "isEqualToString:"))
    objc_storeStrong((id *)p_sourceURL, a3);

}

- (void)setSourceApplication:(id)a3
{
  NSString **p_sourceApplication;
  id v5;

  p_sourceApplication = &self->_sourceApplication;
  v5 = a3;
  if (!-[NSString isEqualToString:](*p_sourceApplication, "isEqualToString:"))
    objc_storeStrong((id *)p_sourceApplication, a3);

}

- (BOOL)isEqualToSearchResult:(id)a3 forPurpose:(int64_t)a4
{
  SearchResult *v6;
  SearchResult *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 IsEqualToMapItemForPurpose;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  void *v29;

  v6 = (SearchResult *)a3;
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  if (self == v6)
  {
    IsEqualToMapItemForPurpose = 1;
    goto LABEL_10;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[SearchResult autocompletePerson](self, "autocompletePerson"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult autocompletePerson](v7, "autocompletePerson"));
  v10 = (uint64_t)v9;
  if (v8 && v9)
    goto LABEL_5;

  if (v8 | v10)
  {
LABEL_9:
    IsEqualToMapItemForPurpose = 0;
    goto LABEL_10;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[SearchResult findMyHandle](self, "findMyHandle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult findMyHandle](v7, "findMyHandle"));
  v10 = (uint64_t)v13;
  if (!v8 || !v13)
  {

    if (!(v8 | v10))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[SearchResult routeData](self, "routeData"));
      if (v14)
      {
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult routeData](v7, "routeData"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult routeData](self, "routeData"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult routeData](v7, "routeData"));
          IsEqualToMapItemForPurpose = objc_msgSend(v17, "isEqual:", v18);

          goto LABEL_10;
        }
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult routeData](self, "routeData"));
      if (v19)
      {

      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult routeData](v7, "routeData"));

        if (!v20)
        {
          if (-[SearchResultRepr type](v7, "type") == 4 && -[SearchResultRepr type](self, "type") == 4
            || -[SearchResultRepr type](v7, "type") == 3 && -[SearchResultRepr type](self, "type") == 3)
          {
            -[SearchResult coordinate](self, "coordinate");
            v22 = v21;
            v24 = v23;
            v25 = -[SearchResult coordinate](v7, "coordinate");
            IsEqualToMapItemForPurpose = GEOCalculateDistance(v25, v22, v24, v26, v27) < 5.0;
            goto LABEL_10;
          }
          v8 = objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v7, "mapItem"));
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "_geoMapItem"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_geoMapItem"));
          IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v10, v29, a4);

          goto LABEL_6;
        }
      }
    }
    goto LABEL_9;
  }
LABEL_5:
  IsEqualToMapItemForPurpose = objc_msgSend((id)v8, "isEqual:", v10);
LABEL_6:

LABEL_10:
  return IsEqualToMapItemForPurpose;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

+ (id)currentLocationSearchResult
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithType:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "place"));
  objc_msgSend(v4, "setName:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));

  if (v6)
  {
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v2, "setCoordinate:");
  }
  else
  {
    if (qword_1014D3A98 != -1)
      dispatch_once(&qword_1014D3A98, &stru_1011DCDE8);
    v7 = qword_1014D3A90;
    if (os_log_type_enabled((os_log_t)qword_1014D3A90, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No last location available for current location search result", v9, 2u);
    }
  }

  return v2;
}

+ (id)customSearchResultWithCoordinate:(CLLocationCoordinate2D)a3
{
  return objc_msgSend(a1, "customSearchResultWithCoordinate:floorOrdinal:", 0x7FFFFFFFLL, a3.latitude, a3.longitude);
}

+ (id)customSearchResultWithCoordinate:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4
{
  uint64_t v4;
  double longitude;
  double latitude;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));
  objc_msgSend(v9, "setName:", v8);

  objc_msgSend(v7, "setCoordinate:", latitude, longitude);
  if ((_DWORD)v4 != 0x7FFFFFFF)
    objc_msgSend(v7, "setFloorOrdinal:", v4);
  return v7;
}

- (BOOL)readFrom:(id)a3
{
  _BOOL4 v4;
  AddressBookAddress *v5;
  AddressBookAddress *address;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  id v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int64x2_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  CLLocationDegrees v21;
  CLLocationDegrees v22;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  float64x2_t v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)SearchResult;
  v4 = -[SearchResultRepr readFrom:](&v47, "readFrom:", a3);
  if (v4)
  {
    if (-[SearchResultRepr hasAddressRecordID](self, "hasAddressRecordID"))
    {
      v5 = -[AddressBookAddress initWithRecordID:addressID:]([AddressBookAddress alloc], "initWithRecordID:addressID:", -[SearchResultRepr addressRecordID](self, "addressRecordID"), -[SearchResultRepr addressID](self, "addressID"));
      address = self->_address;
      self->_address = v5;

    }
    v7 = -[SearchResultRepr hasObsoleteName](self, "hasObsoleteName");
    if (-[SearchResultRepr hasObsoleteLocality](self, "hasObsoleteLocality")
      || -[SearchResultRepr hasObsoleteRegion](self, "hasObsoleteRegion")
      || -[SearchResultRepr hasObsoletePostalCode](self, "hasObsoletePostalCode")
      || -[SearchResultRepr hasObsoleteCountryCode](self, "hasObsoleteCountryCode")
      || -[SearchResultRepr hasObsoleteCountryName](self, "hasObsoleteCountryName")
      || -[SearchResultRepr hasObsoleteDependentLocality](self, "hasObsoleteDependentLocality"))
    {
      v8 = 1;
    }
    else
    {
      v8 = -[SearchResultRepr hasObsoleteThoroughfare](self, "hasObsoleteThoroughfare");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteAddressLines](self, "obsoleteAddressLines"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
      v11 = 1;
    else
      v11 = v8;
    if (-[SearchResultRepr hasObsoleteInexactPosition](self, "hasObsoleteInexactPosition"))
      v12 = -[SearchResultRepr obsoleteInexactPosition](self, "obsoleteInexactPosition");
    else
      v12 = 0;
    if (-[SearchResultRepr hasObsoletePhone](self, "hasObsoletePhone")
      || -[SearchResultRepr hasObsoleteReferenceURL](self, "hasObsoleteReferenceURL")
      || -[SearchResultRepr hasObsoleteCid](self, "hasObsoleteCid")
      && -[SearchResultRepr obsoleteCid](self, "obsoleteCid")
      || -[SearchResultRepr hasObsoleteUnverifiedListing](self, "hasObsoleteUnverifiedListing"))
    {
      v13 = 1;
    }
    else
    {
      v13 = -[SearchResultRepr hasObsoleteClosedListing](self, "hasObsoleteClosedListing");
    }
    if (-[SearchResultRepr hasObsoleteLatitudeE6Value](self, "hasObsoleteLatitudeE6Value"))
      v14 = -[SearchResultRepr hasObsoleteLongitudeE6Value](self, "hasObsoleteLongitudeE6Value");
    else
      v14 = 0;
    if (((v7 | v8 | v12 | v13 | v11) & 1) != 0 || v14)
    {
      v24 = objc_alloc_init((Class)GEOPlace);
      -[SearchResultRepr setPlace:](self, "setPlace:", v24);

      if (!v7)
      {
LABEL_29:
        if (!v11)
          goto LABEL_30;
        goto LABEL_38;
      }
    }
    else if (!v7)
    {
      goto LABEL_29;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteName](self, "obsoleteName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    objc_msgSend(v26, "setName:", v25);

    if (!v11)
    {
LABEL_30:
      if (!v12)
        goto LABEL_31;
      goto LABEL_57;
    }
LABEL_38:
    v27 = objc_alloc_init((Class)GEOAddress);
    if (v10)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteAddressLines](self, "obsoleteAddressLines"));
      objc_msgSend(v27, "setFormattedAddressLines:", v28);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    objc_msgSend(v29, "setAddress:", v27);

    if (v8)
    {
      v30 = objc_alloc_init((Class)GEOStructuredAddress);
      if (-[SearchResultRepr hasObsoleteLocality](self, "hasObsoleteLocality"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteLocality](self, "obsoleteLocality"));
        objc_msgSend(v30, "setLocality:", v31);

      }
      if (-[SearchResultRepr hasObsoleteRegion](self, "hasObsoleteRegion"))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteRegion](self, "obsoleteRegion"));
        objc_msgSend(v30, "setAdministrativeArea:", v32);

      }
      if (-[SearchResultRepr hasObsoletePostalCode](self, "hasObsoletePostalCode"))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoletePostalCode](self, "obsoletePostalCode"));
        objc_msgSend(v30, "setPostCode:", v33);

      }
      if (-[SearchResultRepr hasObsoleteCountryCode](self, "hasObsoleteCountryCode"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteCountryCode](self, "obsoleteCountryCode"));
        objc_msgSend(v30, "setCountryCode:", v34);

      }
      if (-[SearchResultRepr hasObsoleteCountryName](self, "hasObsoleteCountryName"))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteCountryName](self, "obsoleteCountryName"));
        objc_msgSend(v30, "setCountry:", v35);

      }
      if (-[SearchResultRepr hasObsoleteDependentLocality](self, "hasObsoleteDependentLocality"))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteDependentLocality](self, "obsoleteDependentLocality"));
        objc_msgSend(v30, "setSubLocality:", v36);

      }
      if (-[SearchResultRepr hasObsoleteThoroughfare](self, "hasObsoleteThoroughfare"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteThoroughfare](self, "obsoleteThoroughfare"));
        objc_msgSend(v30, "setThoroughfare:", v37);

      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "address"));
      objc_msgSend(v39, "setStructuredAddress:", v30);

    }
    if (!v12)
    {
LABEL_31:
      if (!v13)
        goto LABEL_32;
      goto LABEL_58;
    }
LABEL_57:
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    objc_msgSend(v40, "setAddressGeocodeAccuracy:", 2);

    if (!v13)
    {
LABEL_32:
      if (!v14)
      {
LABEL_34:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place", *(_OWORD *)&v46));
        objc_msgSend(v20, "mkCoordinate");
        self->_coordinate.latitude = v21;
        self->_coordinate.longitude = v22;

        -[SearchResultRepr setObsoleteName:](self, "setObsoleteName:", 0);
        -[SearchResultRepr setObsoleteLocality:](self, "setObsoleteLocality:", 0);
        -[SearchResultRepr setObsoleteRegion:](self, "setObsoleteRegion:", 0);
        -[SearchResultRepr setObsoletePostalCode:](self, "setObsoletePostalCode:", 0);
        -[SearchResultRepr setObsoleteCountryCode:](self, "setObsoleteCountryCode:", 0);
        -[SearchResultRepr setObsoleteCountryName:](self, "setObsoleteCountryName:", 0);
        -[SearchResultRepr setObsoletePhone:](self, "setObsoletePhone:", 0);
        -[SearchResultRepr setObsoleteReferenceURL:](self, "setObsoleteReferenceURL:", 0);
        -[SearchResultRepr setObsoleteDependentLocality:](self, "setObsoleteDependentLocality:", 0);
        -[SearchResultRepr setObsoleteThoroughfare:](self, "setObsoleteThoroughfare:", 0);
        -[SearchResultRepr setObsoleteLatitudeE6Value:](self, "setObsoleteLatitudeE6Value:", 0);
        -[SearchResultRepr setHasObsoleteLatitudeE6Value:](self, "setHasObsoleteLatitudeE6Value:", 0);
        -[SearchResultRepr setObsoleteLongitudeE6Value:](self, "setObsoleteLongitudeE6Value:", 0);
        -[SearchResultRepr setHasObsoleteLongitudeE6Value:](self, "setHasObsoleteLongitudeE6Value:", 0);
        -[SearchResultRepr setObsoleteInexactPosition:](self, "setObsoleteInexactPosition:", 0);
        -[SearchResultRepr setHasObsoleteInexactPosition:](self, "setHasObsoleteInexactPosition:", 0);
        -[SearchResultRepr setObsoleteCid:](self, "setObsoleteCid:", 0);
        -[SearchResultRepr setHasObsoleteCid:](self, "setHasObsoleteCid:", 0);
        -[SearchResultRepr setObsoleteAddressLines:](self, "setObsoleteAddressLines:", 0);
        -[SearchResultRepr setObsoleteUnverifiedListing:](self, "setObsoleteUnverifiedListing:", 0);
        -[SearchResultRepr setHasObsoleteUnverifiedListing:](self, "setHasObsoleteUnverifiedListing:", 0);
        -[SearchResultRepr setObsoleteClosedListing:](self, "setObsoleteClosedListing:", 0);
        -[SearchResultRepr setHasObsoleteClosedListing:](self, "setHasObsoleteClosedListing:", 0);
        return v4;
      }
LABEL_33:
      v15 = -[SearchResultRepr obsoleteLatitudeE6Value](self, "obsoleteLatitudeE6Value");
      v16 = vshll_n_s32((int32x2_t)__PAIR64__(-[SearchResultRepr obsoleteLongitudeE6Value](self, "obsoleteLongitudeE6Value"), v15), 0x10uLL);
      v16.i64[0] /= 1000000;
      v16.i64[1] /= 1000000;
      v46 = vmulq_f64(vcvtq_f64_s64(v16), (float64x2_t)vdupq_n_s64(0x3EF0000000000000uLL));
      v17 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithLatitude:longitude:");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      objc_msgSend(v18, "setMapRegion:", v17);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      objc_msgSend(v19, "setCenterCoordinate:", *(_OWORD *)&v46);

      goto LABEL_34;
    }
LABEL_58:
    v41 = objc_alloc_init((Class)GEOBusiness);
    if (-[SearchResultRepr hasObsoletePhone](self, "hasObsoletePhone"))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoletePhone](self, "obsoletePhone"));
      objc_msgSend(v41, "setTelephone:", v42);

    }
    if (-[SearchResultRepr hasObsoleteReferenceURL](self, "hasObsoleteReferenceURL"))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr obsoleteReferenceURL](self, "obsoleteReferenceURL"));
      objc_msgSend(v41, "setURL:", v43);

    }
    if (-[SearchResultRepr hasObsoleteClosedListing](self, "hasObsoleteClosedListing"))
      objc_msgSend(v41, "setIsClosed:", -[SearchResultRepr obsoleteClosedListing](self, "obsoleteClosedListing"));
    v44 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
    objc_msgSend(v44, "addObject:", v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    objc_msgSend(v45, "setBusiness:", v44);

    if (!v14)
      goto LABEL_34;
    goto LABEL_33;
  }
  return v4;
}

- (void)writeTo:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[SearchResult isAddressBookResult](self, "isAddressBookResult"))
  {
    -[SearchResultRepr setAddressID:](self, "setAddressID:", -[PersistentAddressBookAddress addressID](self->_address, "addressID"));
    -[SearchResultRepr setAddressRecordID:](self, "setAddressRecordID:", -[PersistentAddressBookAddress recordID](self->_address, "recordID"));
  }
  else
  {
    -[SearchResultRepr setHasAddressID:](self, "setHasAddressID:", 0);
    -[SearchResultRepr setHasAddressRecordID:](self, "setHasAddressRecordID:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)SearchResult;
  -[SearchResultRepr writeTo:](&v5, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithSearchResult:", self);
}

- (BOOL)updateFromBookmarkRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  v4 = a3;
  if (objc_msgSend(v4, "hasTitle"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    objc_msgSend(v6, "setName:", v5);

  }
  if (objc_msgSend(v4, "hasLatitude") && objc_msgSend(v4, "hasLongitude"))
  {
    objc_msgSend(v4, "latitude");
    v8 = v7;
    objc_msgSend(v4, "longitude");
    -[SearchResult setCoordinate:](self, "setCoordinate:", v8, v9);
  }
  if (objc_msgSend(v4, "hasBusinessID"))
    self->_businessID = (unint64_t)objc_msgSend(v4, "businessID");
  if (objc_msgSend(v4, "hasProviderID"))
  {
    if (objc_msgSend(v4, "providerID"))
    {
      v10 = objc_msgSend(v4, "providerID");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      objc_msgSend(v11, "setLocalSearchProviderID:", v10);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      objc_msgSend(v11, "setHasLocalSearchProviderID:", 0);
    }

  }
  if (objc_msgSend(v4, "hasRegionLatitude")
    && objc_msgSend(v4, "hasRegionLatitudeDelta")
    && objc_msgSend(v4, "hasRegionLongitude")
    && objc_msgSend(v4, "hasRegionLongitudeDelta"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    objc_msgSend(v13, "setMapRegion:", v12);

  }
  v14 = objc_msgSend(v4, "type");
  v15 = 0;
  v16 = 0;
  switch(v14)
  {
    case 0u:
      if (objc_msgSend(v4, "hasProviderID", 0) && objc_msgSend(v4, "hasBusinessID"))
      {
        v17 = objc_alloc_init((Class)GEOBusiness);
        objc_msgSend(v17, "setUID:", objc_msgSend(v4, "businessID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
        objc_msgSend(v18, "addBusiness:", v17);

        -[SearchResultRepr setHasIncompleteMetadata:](self, "setHasIncompleteMetadata:", 1);
        if (objc_msgSend(v4, "hasProviderID"))
        {
          v19 = objc_msgSend(v4, "providerID");
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
          objc_msgSend(v20, "setLocalSearchProviderID:", v19);

        }
      }
      v15 = 0;
      goto LABEL_26;
    case 1u:
      goto LABEL_26;
    case 2u:
      v15 = 4;
LABEL_26:
      -[SearchResult setType:](self, "setType:", v15);
      goto LABEL_27;
    case 3u:
    case 4u:
      goto LABEL_28;
    default:
LABEL_27:
      -[SearchResult setOriginalType:](self, "setOriginalType:", -[SearchResultRepr type](self, "type", v15));
      v16 = 1;
LABEL_28:

      return v16;
  }
}

- (SearchResult)initWithBookmarkRepresentation:(id)a3
{
  id v3;
  SearchResult *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  SearchResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchResult;
  v3 = a3;
  v4 = -[SearchResult init](&v10, "init");
  -[SearchResult _commonInit](v4, "_commonInit", v10.receiver, v10.super_class);
  v5 = -[SearchResult updateFromBookmarkRepresentation:](v4, "updateFromBookmarkRepresentation:", v3);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](v4, "place"));
    v7 = objc_msgSend(v6, "hasAddress");

    if ((v7 & 1) == 0)
      -[SearchResultRepr setHasIncompleteMetadata:](v4, "setHasIncompleteMetadata:", 1);
    -[SearchResultRepr setHasIncompleteNavData:](v4, "setHasIncompleteNavData:", 1);
    v8 = v4;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)syncData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkStorage](self, "bookmarkStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return v3;
}

- (BOOL)updateFromSyncData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MSPBookmarkStorage), "initWithData:", v4);

  if (v5 && objc_msgSend(v5, "type") == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItemStorage"));

    -[SearchResult updateWithGEOMapItem:](self, "updateWithGEOMapItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
    v9 = objc_msgSend(v8, "origin");

    if (v9 == 1)
    {
      -[SearchResult setOriginalType:](self, "setOriginalType:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
      v11 = objc_msgSend(v10, "hasDroppedPinCoordinate");

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "droppedPinCoordinate"));
        -[SearchResult setCoordinate:](self, "setCoordinate:", CLLocationCoordinate2DFromGEOLocationCoordinate2D(objc_msgSend(v13, "coordinate")));

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
      v15 = objc_msgSend(v14, "hasDroppedPinFloorOrdinal");

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
        -[SearchResultRepr setFloorOrdinal:](self, "setFloorOrdinal:", objc_msgSend(v16, "droppedPinFloorOrdinal"));

      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeBookmark"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
    -[SearchResult setBookmarkTitle:](self, "setBookmarkTitle:", v18);

  }
  return 0;
}

- (BOOL)isDynamicCurrentLocation
{
  return -[SearchResultRepr originalType](self, "originalType") == 4;
}

- (NSString)defaultName
{
  unsigned int v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = -[SearchResultRepr originalType](self, "originalType");
  if (v2 == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKAnnotationView droppedPinTitle](MKAnnotationView, "droppedPinTitle"));
  }
  else if (v2 == 4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v4 = objc_msgSend(v3, "isLocationServicesApproved");
    if ((_DWORD)v4 && (v4 = objc_msgSend(v3, "isAuthorizedForPreciseLocation"), (v4 & 1) == 0))
    {
      v9 = MKLocalizedStringForApproximateLocation();
      v7 = objc_claimAutoreleasedReturnValue(v9);
    }
    else
    {
      v6 = MKLocalizedStringForCurrentLocation(v4, v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
    }
    v8 = (void *)v7;

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (BOOL)behavesAsAtom
{
  uint64_t v3;
  unsigned int v4;
  BOOL v5;

  v3 = -[SearchResultRepr type](self, "type");
  v4 = v3;
  if (v3 > 9 || (v5 = 1, ((1 << v3) & 0x218) == 0))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[SearchResult locationOfInterest](self, "locationOfInterest"));
    if (v3)
    {
      v5 = 1;
    }
    else
    {
      v5 = -[SearchResult isAddressBookResult](self, "isAddressBookResult");
      v3 = 0;
    }
  }
  if (v4 > 9 || ((1 << v4) & 0x218) == 0)

  return v5;
}

- (BOOL)isPartiallyClientized
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v3 = objc_msgSend(v2, "_isPartiallyClientized");

  return v3;
}

- (void)clearAddressCache
{
  NSString *formattedAddress;
  NSString *formattedAddressMultiline;

  formattedAddress = self->_formattedAddress;
  self->_formattedAddress = 0;

  formattedAddressMultiline = self->_formattedAddressMultiline;
  self->_formattedAddressMultiline = 0;

}

- (id)_formattedAddress
{
  NSString *formattedAddress;
  void *v4;
  NSString *v5;
  NSString *v6;

  formattedAddress = self->_formattedAddress;
  if (!formattedAddress)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_addressFormattedAsSinglelineAddress"));
    v6 = self->_formattedAddress;
    self->_formattedAddress = v5;

    formattedAddress = self->_formattedAddress;
  }
  return formattedAddress;
}

- (id)_formattedAddressMultiline
{
  NSString *formattedAddressMultiline;
  void *v4;
  NSString *v5;
  NSString *v6;

  formattedAddressMultiline = self->_formattedAddressMultiline;
  if (!formattedAddressMultiline)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_addressFormattedAsMultilineAddress"));
    v6 = self->_formattedAddressMultiline;
    self->_formattedAddressMultiline = v5;

    formattedAddressMultiline = self->_formattedAddressMultiline;
  }
  return formattedAddressMultiline;
}

- (BOOL)_hasUID
{
  void *v3;
  unsigned __int8 v4;

  if (self->_businessID)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_hasMUID");

  return v4;
}

- (unint64_t)businessID
{
  void *v3;
  id v4;

  if (self->_businessID)
    return self->_businessID;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_muid");

  return (unint64_t)v4;
}

- (MKMapItem)mapItem
{
  MKMapItem *mapItem;
  id v4;
  void *v5;
  MKMapItem *v6;
  MKMapItem *v7;

  mapItem = self->_mapItem;
  if (!mapItem)
  {
    v4 = objc_alloc((Class)MKMapItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    v6 = (MKMapItem *)objc_msgSend(v4, "initWithPlace:", v5);
    v7 = self->_mapItem;
    self->_mapItem = v6;

    mapItem = self->_mapItem;
  }
  return mapItem;
}

- (id)mapsURL
{
  return -[SearchResult mapsURLfromMapView:](self, "mapsURLfromMapView:", 0);
}

- (id)mapsURLfromMapView:(id)a3
{
  return -[SearchResult _mapsURLfromMapView:](self, "_mapsURLfromMapView:", a3);
}

- (id)_mapsURLfromMapView:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  objc_super v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SearchResult;
  if (-[SearchResultRepr hasMapsURL](&v27, "hasMapsURL"))
  {
    v26.receiver = self;
    v26.super_class = (Class)SearchResult;
    v5 = -[SearchResultRepr mapsURL](&v26, "mapsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_activityURL"));

    if (-[SearchResultRepr type](self, "type") == 3 || -[SearchResult isReverseGeocoded](self, "isReverseGeocoded"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v8, 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queryItems"));
      v11 = objc_msgSend(v10, "mutableCopy");

      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queryItems"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1009673B8;
      v19[3] = &unk_1011DCDC8;
      v13 = v11;
      v20 = v13;
      v21 = &v22;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v19);

      if (*((_BYTE *)v23 + 24))
      {
        v14 = objc_msgSend(v13, "copy");
        objc_msgSend(v9, "setQueryItems:", v14);

        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
        v8 = (void *)v15;
      }

      _Block_object_dispose(&v22, 8);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    if (v4)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKURLSerializer stringForMapType:](MKURLSerializer, "stringForMapType:", objc_msgSend(v4, "mapType")));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("&t=%@"), v16));

      v6 = (void *)v17;
    }

  }
  return v6;
}

- (NSString)debugDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self, "singleLineAddress"));
  v7 = NSStringFromBOOL(-[SearchResultRepr hasIncompleteMetadata](self, "hasIncompleteMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> \"%@\" %@ - (partiallyClientized: %@)"), v3, self, v5, v6, v8));

  return (NSString *)v9;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v3 = objc_alloc((Class)NSMutableString);
  v17.receiver = self;
  v17.super_class = (Class)SearchResult;
  v4 = -[SearchResultRepr description](&v17, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithString:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult name](self, "name"));
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_addressFormattedAsSinglelineAddress"));

  if (objc_msgSend(v9, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  v11 = objc_msgSend(v10, "addressGeocodeAccuracy");

  if (v11 == 2)
    objc_msgSend(v6, "appendString:", CFSTR(" -- Inexact"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](self, "title"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\ntitle: %@"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult subtitle](self, "subtitle"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\nsubtitle: %@"), v13);

  v14 = NSStringFromBOOL(-[SearchResultRepr hasIncompleteMetadata](self, "hasIncompleteMetadata"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v6, "appendFormat:", CFSTR("\npartiallyClientized: %@"), v15);

  return (NSString *)v6;
}

- (void)clearLocationInformation
{
  void *v3;
  MKMapItem *mapItem;

  -[SearchResult setReverseGeocoded:](self, "setReverseGeocoded:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  objc_msgSend(v3, "setAddress:", 0);

  -[SearchResult clearAddressCache](self, "clearAddressCache");
  if (-[SearchResultRepr type](self, "type") == 3)
  {
    mapItem = self->_mapItem;
    self->_mapItem = 0;

  }
}

- (void)_syncGEOPlaceWithCoordinate
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[SearchResult coordinate](self, "coordinate");
  v4 = v3;
  v6 = v5;
  v9 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithLatitude:longitude:", v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  objc_msgSend(v7, "setMapRegion:", v9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  objc_msgSend(v8, "setCenterCoordinate:", v4, v6);

}

- (void)setCoordinate:(CLLocationCoordinate2D)a3 preserveLocationInfo:(BOOL)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationCoordinate2D *p_coordinate;
  uint64_t v8;

  longitude = a3.longitude;
  latitude = a3.latitude;
  p_coordinate = &self->_coordinate;
  if (vabdd_f64(a3.latitude, self->_coordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_coordinate.longitude) >= 0.00000000999999994)
  {
    if (!a4)
      -[SearchResult clearLocationInformation](self, "clearLocationInformation");
    v8 = kAnnotationCoordinateKey;
    -[SearchResult willChangeValueForKey:](self, "willChangeValueForKey:", kAnnotationCoordinateKey);
    p_coordinate->latitude = latitude;
    p_coordinate->longitude = longitude;
    -[SearchResult didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    -[SearchResult _syncGEOPlaceWithCoordinate](self, "_syncGEOPlaceWithCoordinate");
  }
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationCoordinate2D *p_coordinate;

  longitude = a3.longitude;
  latitude = a3.latitude;
  p_coordinate = &self->_coordinate;
  if (vabdd_f64(a3.latitude, self->_coordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_coordinate.longitude) >= 0.00000000999999994)
  {
    -[SearchResult clearLocationInformation](self, "clearLocationInformation");
    p_coordinate->latitude = latitude;
    p_coordinate->longitude = longitude;
    -[SearchResult _syncGEOPlaceWithCoordinate](self, "_syncGEOPlaceWithCoordinate");
  }
}

- (CLLocationCoordinate2D)labelCoordinate
{
  CLLocationCoordinate2D *p_labelCoordinate;
  double longitude;
  double latitude;
  void *v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D result;

  p_labelCoordinate = &self->_labelCoordinate;
  longitude = self->_labelCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (latitude = p_labelCoordinate->latitude, p_labelCoordinate->latitude < -90.0)
    || latitude > 90.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    objc_msgSend(v5, "_labelCoordinate");
    p_labelCoordinate->latitude = v6;
    p_labelCoordinate->longitude = v7;

    latitude = p_labelCoordinate->latitude;
    longitude = p_labelCoordinate->longitude;
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem **p_mapItem;
  char v7;
  PersonalizedCompoundItem *v8;
  PersonalizedCompoundItem *personalizedCompoundItem;
  MKMapItem *v10;

  v5 = (MKMapItem *)a3;
  p_mapItem = &self->_mapItem;
  if (self->_mapItem != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    v7 = objc_opt_respondsToSelector(*p_mapItem, "personalizedCompoundItem");
    v5 = v10;
    if ((v7 & 1) != 0)
    {
      v8 = (PersonalizedCompoundItem *)objc_claimAutoreleasedReturnValue(-[MKMapItem personalizedCompoundItem](*p_mapItem, "personalizedCompoundItem"));
      personalizedCompoundItem = self->_personalizedCompoundItem;
      self->_personalizedCompoundItem = v8;

      v5 = v10;
    }
  }

}

- (unsigned)appearance
{
  unsigned int appearance;
  unsigned int v3;

  appearance = self->_appearance;
  if (!appearance)
  {
    v3 = -[SearchResultRepr type](self, "type");
    if (v3 == 4)
      appearance = 4;
    else
      appearance = 1;
    if (v3 == 3)
      return 3;
  }
  return appearance;
}

- (NSString)locationTitle
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self, "singleLineAddress"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    v6 = objc_msgSend(v5, "isDisputed");

    if (!v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SearchResult_UnknownLocation"), CFSTR("localized string not found"), 0));

      goto LABEL_7;
    }
    -[SearchResult coordinate](self, "coordinate");
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString _mapkit_formattedStringForCoordinate:](NSString, "_mapkit_formattedStringForCoordinate:"));
  }
  v7 = v4;
LABEL_7:

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingLocationTitle
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("place.address.formattedAddressLines"), CFSTR("singleLineAddress"), 0);
}

- (NSString)infoCardTitle
{
  void *v3;

  if (-[SearchResultRepr type](self, "type") == 3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult defaultName](self, "defaultName"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](self, "title"));
  return (NSString *)v3;
}

- (BOOL)isHomeOrWork
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v11;

  v3 = objc_claimAutoreleasedReturnValue(-[SearchResult locationOfInterest](self, "locationOfInterest"));
  if (!v3)
    goto LABEL_13;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult locationOfInterest](self, "locationOfInterest"));
  if (!objc_msgSend(v5, "type"))
  {

    v10 = 1;
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult locationOfInterest](self, "locationOfInterest"));
  v7 = objc_msgSend(v6, "type");

  if (v7 != (id)1)
  {
LABEL_13:
    if (-[SearchResult isAddressBookResult](self, "isAddressBookResult"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address"));
      v9 = objc_msgSend(v8, "isMeCard");

      if ((v9 & 1) != 0)
        return 1;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));

    v10 = objc_msgSend(v4, "contactIsMe");
LABEL_9:

    return v10;
  }
  return 1;
}

- (NSString)name
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  GEOComposedGeometryRoutePersistentData *routeData;
  id v10;
  GEOComposedGeometryRoutePersistentData *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));

  if (objc_msgSend(v4, "contactIsMe"))
  {
    v5 = objc_msgSend(v4, "contactAddressType");
    switch(v5)
    {
      case 3u:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("School");
        goto LABEL_14;
      case 2u:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Work");
        goto LABEL_14;
      case 1u:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v7 = v6;
        v8 = CFSTR("Home");
LABEL_14:
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));
        goto LABEL_15;
    }
  }
  routeData = self->_routeData;
  if (routeData)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData userProvidedName](routeData, "userProvidedName"));
    v10 = objc_msgSend(v7, "length");
    v11 = self->_routeData;
    if (v10)
      v12 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData userProvidedName](v11, "userProvidedName"));
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData routeName](v11, "routeName"));
    goto LABEL_15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult autocompletePersonTitle](self, "autocompletePersonTitle"));
  if (!v13)
  {
    if (-[SearchResult isAddressBookResult](self, "isAddressBookResult"))
    {
      v16 = objc_claimAutoreleasedReturnValue(-[AddressBookAddress compositeName](self->_address, "compositeName"));
      if (v16)
      {
        v14 = (id)v16;
LABEL_30:
        v7 = 0;
        goto LABEL_16;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult findMyHandleName](self, "findMyHandleName"));
    v18 = v17;
    if (v17)
    {
      v14 = v17;
LABEL_29:

      goto LABEL_30;
    }
    if (-[SearchResult hasOriginatedFromBookmarks](self, "hasOriginatedFromBookmarks")
      && (v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](self->_bookmarkStorage, "placeBookmark")),
          v20 = objc_msgSend(v19, "hasTitle"),
          v19,
          v20))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](self->_bookmarkStorage, "placeBookmark"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult locationOfInterest](self, "locationOfInterest"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));

      if (!v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
        LODWORD(v25) = objc_msgSend(v26, "isCurrentLocation");

        if (!(_DWORD)v25)
          goto LABEL_29;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v27 = objc_msgSend(v21, "isLocationServicesApproved");
        v28 = objc_msgSend(v21, "isAuthorizedForPreciseLocation");
        if ((_DWORD)v28)
        {
          v30 = MKLocalizedStringForApproximateLocation();
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v32 = objc_msgSend(v14, "isEqualToString:", v31);

          if (!v32)
            goto LABEL_28;
          v35 = MKLocalizedStringForCurrentLocation(v33, v34);
          v36 = objc_claimAutoreleasedReturnValue(v35);
        }
        else
        {
          if (!v27)
            goto LABEL_28;
          v37 = MKLocalizedStringForCurrentLocation(v28, v29);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          v39 = objc_msgSend(v14, "isEqualToString:", v38);

          if (!v39)
            goto LABEL_28;
          v40 = MKLocalizedStringForApproximateLocation();
          v36 = objc_claimAutoreleasedReturnValue(v40);
        }
        v41 = (void *)v36;

        v14 = v41;
        goto LABEL_28;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult locationOfInterest](self, "locationOfInterest"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
    }
    v14 = (id)v22;
LABEL_28:

    goto LABEL_29;
  }
  v12 = v13;
  v7 = v12;
LABEL_15:
  v14 = v12;
LABEL_16:

  return (NSString *)v14;
}

+ (id)keyPathsForValuesAffectingName
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("place.name"), 0);
}

- (void)setBookmarkTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkStorage](self, "bookmarkStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeBookmark"));
  objc_msgSend(v5, "setTitle:", v4);

}

- (NSString)bookmarkTitle
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](self->_bookmarkStorage, "placeBookmark"));
  v4 = objc_msgSend(v3, "hasTitle");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSPBookmarkStorage placeBookmark](self->_bookmarkStorage, "placeBookmark"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult name](self, "name"));
  }
  return (NSString *)v6;
}

- (NSString)title
{
  void *v3;
  void *v4;
  char v5;
  unsigned int v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult name](self, "name"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult defaultName](self, "defaultName"));
    v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  }
  else
  {
    v5 = 0;
  }
  v6 = -[SearchResultRepr type](self, "type");
  if ((v5 & 1) != 0 || v6 - 3 <= 1)
    v7 = v3;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SearchResult locationTitle](self, "locationTitle"));
  v8 = v7;

  return (NSString *)v8;
}

+ (id)keyPathsForValuesAffectingTitle
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("name"), CFSTR("locationTitle"), 0);
}

- (NSString)subtitle
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  unsigned int v12;

  v3 = -[SearchResultRepr type](self, "type");
  if (v3 == 3)
  {
    if (!-[SearchResult isReverseGeocoded](self, "isReverseGeocoded"))
    {
LABEL_10:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstBusiness"));

      if (objc_msgSend(v5, "isClosed"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("Permanently Closed");
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
        v12 = objc_msgSend(v11, "addressGeocodeAccuracy");

        if (v12 != 2)
        {
          v6 = 0;
          goto LABEL_16;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("Approximate Location");
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

LABEL_16:
      v5 = v6;
      return (NSString *)v5;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self, "singleLineAddress"));
    if (!objc_msgSend(v5, "length"))
    {
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {
    if (v3 != 4 || !-[SearchResult isReverseGeocoded](self, "isReverseGeocoded"))
      goto LABEL_10;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_addressFormattedAsShortenedAddress"));

    if (!objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self, "singleLineAddress"));
      if (objc_msgSend(v6, "length"))
        goto LABEL_16;

      goto LABEL_9;
    }
  }
  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingSubtitle
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("place.addressGeocodeAccuracy"), CFSTR("singleLineAddress"), CFSTR("reverseGeocoded"), 0);
}

- (BOOL)_hasStructuredAddress
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "structuredAddress"));
  v5 = objc_msgSend(v4, "hasThoroughfare");

  return v5;
}

- (NSString)singleLineAddress
{
  void *v3;

  if (-[SearchResult isAddressBookResult](self, "isAddressBookResult"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress singleLineAddress](self->_address, "singleLineAddress"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult _formattedAddress](self, "_formattedAddress"));
  return (NSString *)v3;
}

- (NSString)locality
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "structuredAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locality"));

  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingSingleLineAddress
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("mapItem"), 0);
}

- (BOOL)needsReverseGeocodeCheck
{
  _BOOL4 v3;

  if (-[SearchResultRepr type](self, "type") == 3
    || (v3 = -[SearchResult isDynamicCurrentLocation](self, "isDynamicCurrentLocation")))
  {
    LOBYTE(v3) = !-[SearchResult isReverseGeocoded](self, "isReverseGeocoded");
  }
  return v3;
}

- (BOOL)isReverseGeocoded
{
  return -[SearchResultRepr flags](self, "flags") != 0;
}

- (void)setReverseGeocoded:(BOOL)a3
{
  -[SearchResultRepr setFlags:](self, "setFlags:", a3);
}

- (PersonalizedItemKey)personalizedItemKey
{
  PersonalizedMapItemKey *v3;
  void *v4;
  PersonalizedMapItemKey *v5;

  v3 = [PersonalizedMapItemKey alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v5 = -[PersonalizedMapItemKey initWithMapItem:](v3, "initWithMapItem:", v4);

  return (PersonalizedItemKey *)v5;
}

- (BOOL)isFrequentLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_clientAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loiIdentifier"));
  v7 = v6 != 0;

  return v7;
}

- (NSUUID)impressionElementIdentifier
{
  NSUUID *impressionElementIdentifier;
  NSUUID *v4;
  NSUUID *v5;

  impressionElementIdentifier = self->_impressionElementIdentifier;
  if (!impressionElementIdentifier)
  {
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v5 = self->_impressionElementIdentifier;
    self->_impressionElementIdentifier = v4;

    impressionElementIdentifier = self->_impressionElementIdentifier;
  }
  return impressionElementIdentifier;
}

- (GEORelatedEntitySection)relatedSection
{
  return self->_relatedSection;
}

- (void)setRelatedSection:(id)a3
{
  objc_storeStrong((id *)&self->_relatedSection, a3);
}

- (GEOSearchSection)searchSection
{
  return self->_searchSection;
}

- (void)setSearchSection:(id)a3
{
  objc_storeStrong((id *)&self->_searchSection, a3);
}

- (GEOPlaceCollection)placeCollection
{
  return self->_placeCollection;
}

- (void)setPlaceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollection, a3);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setLabelCoordinate:(CLLocationCoordinate2D)a3
{
  self->_labelCoordinate = a3;
}

- (BOOL)failedToReverseGeocode
{
  return self->_failedToReverseGeocode;
}

- (void)setFailedToReverseGeocode:(BOOL)a3
{
  self->_failedToReverseGeocode = a3;
}

- (BOOL)hasOriginatedFromBookmarks
{
  return self->_originatedFromBookmarks;
}

- (BOOL)hasOriginatedFromExternal
{
  return self->_originatedFromExternal;
}

- (void)setOriginatedFromExternal:(BOOL)a3
{
  self->_originatedFromExternal = a3;
}

- (int)geoMapServiceTraitSource
{
  return self->_geoMapServiceTraitSource;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setAppearance:(unsigned int)a3
{
  self->_appearance = a3;
}

- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson
{
  return self->_autocompletePerson;
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unsigned int)a3
{
  self->_locationType = a3;
}

- (_TtC4Maps16MapsFindMyHandle)findMyHandle
{
  return self->_findMyHandle;
}

- (void)setFindMyHandle:(id)a3
{
  objc_storeStrong((id *)&self->_findMyHandle, a3);
}

- (GEOComposedGeometryRoutePersistentData)routeData
{
  return self->_routeData;
}

- (BOOL)hasExplicitlyProvidedComposedWaypoint
{
  return self->_hasExplicitlyProvidedComposedWaypoint;
}

- (GEORPPlaceInfo)placeInfo
{
  return self->_placeInfo;
}

- (void)setPlaceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_placeInfo, a3);
}

- (RelatedSearchSuggestion)relatedSearchSuggestion
{
  return self->_relatedSearchSuggestion;
}

- (void)setRelatedSearchSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, a3);
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (void)setRetainedSearchMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_retainedSearchMetadata, a3);
}

- (PersonalizedCompoundItem)personalizedCompoundItem
{
  return self->_personalizedCompoundItem;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (BOOL)isPartOfMultipleResultsSet
{
  return self->_partOfMultipleResultsSet;
}

- (void)setPartOfMultipleResultsSet:(BOOL)a3
{
  self->_partOfMultipleResultsSet = a3;
}

- (NSUUID)searchToSupersedeIfRecordedInHistory
{
  return self->_searchToSupersedeIfRecordedInHistory;
}

- (void)setSearchToSupersedeIfRecordedInHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void)setImpressionElementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_impressionElementIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionElementIdentifier, 0);
  objc_storeStrong((id *)&self->_searchToSupersedeIfRecordedInHistory, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_personalizedCompoundItem, 0);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_placeInfo, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_findMyHandle, 0);
  objc_storeStrong((id *)&self->_autocompletePerson, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_searchSection, 0);
  objc_storeStrong((id *)&self->_relatedSection, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_composedWaypoint, 0);
  objc_storeStrong((id *)&self->_formattedAddressMultiline, 0);
  objc_storeStrong((id *)&self->_formattedAddress, 0);
  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
}

- (CNContact)unknownContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_placeCardContact"));
  if ((objc_msgSend(v3, "_hasMUID") & 1) == 0)
  {
    if (-[SearchResult isDynamicCurrentLocation](self, "isDynamicCurrentLocation"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult infoCardTitle](self, "infoCardTitle"));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

      if (!objc_msgSend(v5, "length"))
      {
        v7 = objc_claimAutoreleasedReturnValue(-[SearchResult infoCardTitle](self, "infoCardTitle"));

        v5 = (void *)v7;
      }
    }
    if (objc_msgSend(v5, "length"))
    {
      v8 = objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v8, "setGivenName:", v5);

      v4 = v8;
    }

  }
  return (CNContact *)v4;
}

- (CNContact)contactForSharingToMessages
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self, "address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchResult unknownContact](self, "unknownContact"));
  v7 = v6;

  return (CNContact *)v7;
}

- (BOOL)usePlaceSummaryInSearch
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult relatedSection](self, "relatedSection"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult searchSection](self, "searchSection"));
    v4 = v5 == 0;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult placeCollection](self, "placeCollection"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult personalizedCompoundItem](self, "personalizedCompoundItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  v11 = !v10;
  if (v6)
    v11 = 0;
  return v4 && v11;
}

- (void)setRepresentsIntermediateStop:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_100E3CB63, v4, (void *)1);

}

- (BOOL)representsIntermediateStop
{
  id AssociatedObject;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  AssociatedObject = objc_getAssociatedObject(self, &unk_100E3CB63);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (NSString)autocompletePersonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult autocompletePerson](self, "autocompletePerson"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

- (NSString)routableAddress
{
  void *v3;
  unsigned int v4;
  double v5;
  double v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](self, "singleLineAddress"));
  v4 = -[SearchResultRepr originalType](self, "originalType");
  if (!objc_msgSend(v3, "length") || v4 == 3 || v4 == 4)
  {
    -[SearchResult coordinate](self, "coordinate");
    v7 = 0;
    if (v6 >= -180.0 && v6 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
      v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f, %f"), *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude));

    v3 = (void *)v7;
  }
  return (NSString *)v3;
}

+ (void)newStartWaypointSearchResult:(id *)a3 endWaypointSearchResult:(id *)a4 forRouteHistoryEntry:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  SearchResult *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  SearchResult *v18;
  void *v19;
  id v20;

  v7 = a5;
  v20 = v7;
  if (a3)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startWaypoint"));
    if (v8
      && (v9 = (void *)v8,
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startWaypoint")),
          v11 = objc_msgSend(v10, "isCurrentLocation"),
          v10,
          v9,
          !v11))
    {
      v12 = [SearchResult alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startWaypoint"));
      *a3 = -[SearchResult initWithComposedWaypoint:](v12, "initWithComposedWaypoint:", v13);

    }
    else
    {
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    }
    v7 = v20;
  }
  if (a4)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endWaypoint"));
    if (v14
      && (v15 = (void *)v14,
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "endWaypoint")),
          v17 = objc_msgSend(v16, "isCurrentLocation"),
          v16,
          v15,
          !v17))
    {
      v18 = [SearchResult alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "endWaypoint"));
      *a4 = -[SearchResult initWithComposedWaypoint:](v18, "initWithComposedWaypoint:", v19);

    }
    else
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    }
    v7 = v20;
  }

}

+ (id)carSearchResultFromDestination:(id)a3
{
  id v4;
  SearchResult *v5;
  uint64_t v6;
  id v7;
  MapsLocationOfInterest *v8;
  void *v9;
  MapsLocationOfInterest *v10;
  uint64_t v11;
  void *v12;
  SearchResult *v13;
  void *v14;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v4 = a3;
  if ((objc_opt_isKindOfClass(v4, a1) & 1) == 0)
  {
    v6 = objc_opt_class(MapsSuggestionsEntry);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = v4;
      if (objc_msgSend(v7, "type") == (id)24)
      {
        v8 = (MapsLocationOfInterest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "findMyWaypoint"));
        if (!v8)
        {
          v16 = sub_1004318FC();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v21 = 136315906;
            v22 = "+[SearchResult(CarHelpers) carSearchResultFromDestination:]";
            v23 = 2080;
            v24 = "CarDisplayController.m";
            v25 = 1024;
            v26 = 2320;
            v27 = 2080;
            v28 = "waypoint != nil";
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v21, 0x26u);
          }

          if (sub_100A70734())
          {
            v18 = sub_1004318FC();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v21 = 138412290;
              v22 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

            }
          }
        }
        v5 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v8);
        goto LABEL_14;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MKMapItem"));

      if (v9)
      {
        v10 = -[MapsLocationOfInterest initWithMapsSuggestionEntry:]([MapsLocationOfInterest alloc], "initWithMapsSuggestionEntry:", v7);
LABEL_13:
        v8 = v10;
        v13 = [SearchResult alloc];
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest mapItem](v8, "mapItem"));
        v5 = -[SearchResult initWithMapItem:](v13, "initWithMapItem:", v14);

        -[SearchResult setLocationOfInterest:](v5, "setLocationOfInterest:", v8);
LABEL_14:

LABEL_19:
        goto LABEL_20;
      }

    }
    v11 = objc_opt_class(_TtC4Maps16MapsFavoriteItem);
    if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
    {
      v7 = v4;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mkMapItem"));

      if (v12)
      {
        v10 = -[MapsLocationOfInterest initWithMapsFavoriteItem:]([MapsLocationOfInterest alloc], "initWithMapsFavoriteItem:", v7);
        goto LABEL_13;
      }

    }
    v7 = (id)objc_claimAutoreleasedReturnValue(+[MKMapItem carMapItemFromDestination:](MKMapItem, "carMapItemFromDestination:", v4));
    if (v7)
      v5 = (SearchResult *)objc_msgSend(objc_alloc((Class)a1), "initWithMapItem:", v7);
    else
      v5 = 0;
    goto LABEL_19;
  }
  v5 = (SearchResult *)v4;
LABEL_20:

  return v5;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[SearchResultRepr type](self, "type");
  v4 = 0;
  switch((int)v3)
  {
    case 3:
      v4 = CFSTR("DroppedPin");
      break;
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      return (NSString *)v4;
    case 5:
    case 12:
      goto LABEL_2;
    case 11:
      v4 = CFSTR("Section");
      break;
    default:
      if (!(_DWORD)v3)
      {
        if (MapsFeature_IsEnabled_SearchAndDiscovery(v3)
          && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult placeCollection](self, "placeCollection")),
              v6,
              v6))
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult placeCollection](self, "placeCollection"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionIdentifier"));
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CuratedGuide-%@"), v7));

        }
        else
        {
LABEL_2:
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_diffableDataSourceIdentifier"));
        }

      }
      break;
  }
  return (NSString *)v4;
}

- (Flyover)_flyover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  Flyover *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_flyover"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](self, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_flyoverAnnouncementMessageWithDefaultTitle:", v5));

    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("FlyoverSearchNotificationKey")));
    v10 = objc_msgSend(v9, "mutableCopy");

    if (!v10)
      v10 = objc_alloc_init((Class)NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v7));
    v12 = (char *)objc_msgSend(v11, "unsignedIntegerValue");

    if ((uint64_t)v12 >= GEOConfigGetInteger(MapsConfig_FlyoverMaxSearchNotification, off_1014B2E08))
    {
      v15 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12 + 1));
      objc_msgSend(v10, "setValue:forKey:", v13, v7);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("FlyoverSearchNotificationKey"));

      v15 = -[Flyover initWithAnnouncement:mapItem:animationID:]([Flyover alloc], "initWithAnnouncement:mapItem:animationID:", v7, v3, 0);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isFindMyPerson
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult autocompletePerson](self, "autocompletePerson"));
  v4 = objc_claimAutoreleasedReturnValue(-[SearchResult findMyHandle](self, "findMyHandle"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handle"));
  v6 = (v5 | v4) != 0;

  return v6;
}

@end

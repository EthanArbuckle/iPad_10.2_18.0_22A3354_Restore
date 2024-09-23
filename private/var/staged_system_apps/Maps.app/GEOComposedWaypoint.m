@implementation GEOComposedWaypoint

- (GEOComposedWaypoint)initWithSearchResult:(id)a3
{
  id v4;
  id v5;
  GEOComposedWaypoint *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (objc_msgSend(v4, "hasExplicitlyProvidedComposedWaypoint"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedWaypoint"));
    v6 = (GEOComposedWaypoint *)objc_msgSend(v5, "copy");

    self = v6;
  }
  else if (objc_msgSend(v4, "type") == 3)
  {
    objc_msgSend(v4, "coordinate");
    v8 = v7;
    objc_msgSend(v4, "coordinate");
    v5 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItemStorageForPersistence"));
      self = -[GEOComposedWaypoint initWithMapItem:](self, "initWithMapItem:", v12);

    }
    else
    {
      self = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:](self, "initWithLocation:isCurrentLocation:", v5, 0);
    }
    -[GEOComposedWaypoint setType:](self, "setType:", 1);
    -[GEOComposedWaypoint setLocation:](self, "setLocation:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "latLng"));
    -[GEOComposedWaypoint setLatLng:](self, "setLatLng:", v16);

    v17 = objc_alloc_init((Class)GEOWaypointTyped);
    objc_msgSend(v17, "setWaypointType:", 4);
    v18 = objc_alloc_init((Class)GEOWaypointLocation);
    objc_msgSend(v17, "setWaypointLocation:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "waypointLocation"));
    objc_msgSend(v19, "setLocation:", v5);

    -[GEOComposedWaypoint setWaypoint:](self, "setWaypoint:", v17);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_geoMapItemStorageForPersistence"));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));

      if (!v20)
        goto LABEL_14;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
      v15 = objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForPlace:](GEOMapItemStorage, "mapItemStorageForPlace:", v14));
    }
    v5 = (id)v15;

    self = -[GEOComposedWaypoint initWithMapItem:](self, "initWithMapItem:", v5);
  }

LABEL_14:
  if (objc_msgSend(v4, "type") == 4)
  {
    -[GEOComposedWaypoint setIsCurrentLocation:](self, "setIsCurrentLocation:", 1);
    -[GEOComposedWaypoint recomputeGeoWaypointTyped](self, "recomputeGeoWaypointTyped");
  }

  return self;
}

- (BOOL)shouldOfferAlternateChargersAtArrival
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint chargingInfo](self, "chargingInfo"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self, "geoMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_poiCategory"));
    v4 = v6 == (void *)GEOPOICategoryEVCharger;

  }
  return v4;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v16 = objc_opt_class(self);
  v15 = -[GEOComposedWaypoint muid](self, "muid");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint timezone](self, "timezone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint location](self, "location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint navDisplayName](self, "navDisplayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint navDisplayAddress](self, "navDisplayAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint directionsListAddress](self, "directionsListAddress"));
  v9 = -[GEOComposedWaypoint waypointCategory](self, "waypointCategory");
  if (v9 >= 0xE)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v9));
  else
    v10 = *(&off_1011BE730 + (int)v9);
  v11 = -[GEOComposedWaypoint type](self, "type");
  if (v11 >= 4)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v11));
  else
    v12 = *(&off_1011BE7A0 + (int)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p, muid: %llu, timezone: %@, location: %@, name: %@, navDisplayName: %@, navDisplayAddress: %@, directionsListAddress: %@, waypointCategory: %@, waypointType: %@, isCurrentLocation: %d, isServerProvidedWaypoint: %d>"), v16, self, v15, v3, v4, v5, v6, v7, v8, v10, v12, -[GEOComposedWaypoint isCurrentLocation](self, "isCurrentLocation"), -[GEOComposedWaypoint isServerProvidedWaypoint](self, "isServerProvidedWaypoint")));

  return v13;
}

- (id)hawkQueryRepresentation
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint navDisplayAddress](self, "navDisplayAddress"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint bestLatLng](self, "bestLatLng"));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "coordinate");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v10, v11);

    }
    v5 = CFSTR("<invalid>");
  }

  return v5;
}

- (BOOL)needsAdditionalNavData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  void *v16;
  id v17;
  char v18;
  BOOL v19;
  char v20;
  char v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self, "geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_place"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "structuredAddress"));

  if ((objc_msgSend(v6, "hasSubThoroughfare") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "hasFullThoroughfare");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self, "geoMapItem"));
  if (objc_msgSend(v8, "_hasMUID"))
    v9 = objc_msgSend(v4, "hasSpokenName") ^ 1;
  else
    LOBYTE(v9) = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self, "geoMapItem"));
  objc_msgSend(v10, "coordinate");
  v12 = v11;
  v14 = v13;

  if (v7)
  {
    v15 = objc_msgSend(v4, "hasSpokenAddress") ^ 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryPoints"));
    v17 = objc_msgSend(v16, "count");

    if (v17)
      v18 = v15;
    else
      v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  v19 = v14 < -180.0;
  if (v14 > 180.0)
    v19 = 1;
  v20 = v9 | v19;
  if (v12 < -90.0)
    v20 = 1;
  if (v12 > 90.0)
    v20 = 1;
  v21 = v20 | v18;

  return v21;
}

- (NSString)arrivingDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint navDisplayName](self, "navDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandleID](self, "findMyHandleID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandle](self, "findMyHandle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint addressBookAddress](self, "addressBookAddress"));

    if (!v7)
      return (NSString *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint addressBookAddress](self, "addressBookAddress"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointCompositeName"));
  }
  v8 = (void *)v6;
  if (v6)
    v9 = (void *)v6;
  else
    v9 = v3;
  v10 = v9;

  v3 = v10;
  return (NSString *)v3;
}

- (NSString)parkingDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint arrivingDisplayName](self, "arrivingDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

  if (v5)
  {
    objc_msgSend(v5, "coordinate");
    v7 = v6;
    v9 = v8;
    v10 = -[GEOComposedWaypoint coordinate](self, "coordinate");
    v13 = +[NSString _navigation_localizedStringForDistance:context:extraDetail:](NSString, "_navigation_localizedStringForDistance:context:extraDetail:", 1, 0, GEOCalculateDistance(v10, v7, v9, v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Parking Display Address [Nav Tray Header]"), CFSTR("localized string not found"), 0));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v14, v3));

  }
  else
  {
    v17 = v3;
  }

  return (NSString *)v17;
}

- (MKMapItem)mkMapItem
{
  id AssociatedObject;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v6 = -[GEOComposedWaypoint isCurrentLocation](self, "isCurrentLocation");
    v7 = objc_alloc((Class)MKMapItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint geoMapItem](self, "geoMapItem"));
    if (v6)
      v9 = objc_msgSend(v7, "initWithGeoMapItemAsCurrentLocation:", v8);
    else
      v9 = objc_msgSend(v7, "initWithGeoMapItem:isPlaceHolderPlace:", v8, 0);
    v5 = v9;

    objc_setAssociatedObject(self, a2, v5, (void *)1);
  }
  v10 = v5;

  return (MKMapItem *)v10;
}

- (CNContact)contact
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint addressBookAddress](self, "addressBookAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandle](self, "findMyHandle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));

  }
  return (CNContact *)v4;
}

- (AddressBookAddress)addressBookAddress
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AddressBookAddress *v12;
  id AssociatedObject;
  AddressBookAddress *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressBookAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientAttributes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addressBookAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressIdentifier"));

  v12 = 0;
  if (v7 && v11)
  {
    AssociatedObject = objc_getAssociatedObject(self, a2);
    v14 = (AddressBookAddress *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (!v14)
    {
      v14 = -[AddressBookAddress initWithCNContactIdentifier:addressIdentifier:]([AddressBookAddress alloc], "initWithCNContactIdentifier:addressIdentifier:", v7, v11);
      objc_setAssociatedObject(self, a2, v14, (void *)1);
    }
    v12 = v14;

  }
  return v12;
}

- (_TtC4Maps16MapsFindMyHandle)findMyHandle
{
  void *v4;
  id AssociatedObject;
  _TtC4Maps16MapsFindMyHandle *v6;
  _TtC4Maps16MapsFindMyHandle *v7;
  void *v8;
  _TtC4Maps16MapsFindMyHandle *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandleID](self, "findMyHandleID"));

  if (v4)
  {
    AssociatedObject = objc_getAssociatedObject(self, a2);
    v6 = (_TtC4Maps16MapsFindMyHandle *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if (!v6)
    {
      v7 = [_TtC4Maps16MapsFindMyHandle alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint findMyHandleID](self, "findMyHandleID"));
      v6 = -[MapsFindMyHandle initWithIdentifier:](v7, "initWithIdentifier:", v8);

      objc_setAssociatedObject(self, a2, v6, (void *)1);
    }
    v9 = v6;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)clearFindMyData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEOComposedWaypoint setFindMyHandleID:](self, "setFindMyHandleID:", 0);
  -[GEOComposedWaypoint setStyleAttributes:](self, "setStyleAttributes:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userValues"));
  objc_msgSend(v4, "setName:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientAttributes"));
  objc_msgSend(v6, "setAddressBookAttributes:", 0);

  -[GEOComposedWaypoint recomputeGeoWaypointTyped](self, "recomputeGeoWaypointTyped");
  objc_setAssociatedObject(self, "findMyHandle", 0, (void *)1);
}

- (void)setUserValuesName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userValues"));
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_opt_new(GEOMapItemStorageUserValues);
    v9 = v8;

    v10 = objc_msgSend(v11, "copy");
    objc_msgSend(v9, "setName:", v10);

    objc_msgSend(v5, "setUserValues:", v9);
  }

}

- (void)setAddressBookContactName:(id)a3
{
  void *v4;
  id v5;

  v5 = objc_msgSend(a3, "copy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint _addressBookAttributes](self, "_addressBookAttributes"));
  objc_msgSend(v4, "setName:", v5);

}

- (void)setAddressBookContactSpokenName:(id)a3
{
  void *v4;
  id v5;

  v5 = objc_msgSend(a3, "copy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint _addressBookAttributes](self, "_addressBookAttributes"));
  objc_msgSend(v4, "setSpokenName:", v5);

}

- (id)_addressBookAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  GEOMapItemClientAttributes *v6;
  void *v7;
  GEOMapItemClientAttributes *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientAttributes"));
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = objc_opt_new(GEOMapItemClientAttributes);
    v8 = v6;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemClientAttributes addressBookAttributes](v8, "addressBookAttributes"));
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_opt_new(GEOMapItemAddressBookAttributes);
    v7 = v11;

    -[GEOMapItemClientAttributes setAddressBookAttributes:](v8, "setAddressBookAttributes:", v7);
    objc_msgSend(v3, "setClientAttributes:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

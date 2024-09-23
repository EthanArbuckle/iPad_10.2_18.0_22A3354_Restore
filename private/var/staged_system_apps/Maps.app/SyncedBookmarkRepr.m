@implementation SyncedBookmarkRepr

- (id)richMapsActivity
{
  unsigned int v3;
  double v4;
  CLLocationDegrees v5;
  CLLocationDegrees v6;
  CLLocationCoordinate2D v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  RichMapsActivity *v12;
  void *v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  id v18;
  SearchResult *v19;
  MapsActivity *v20;
  id v21;
  void *v22;
  SearchResult *v23;
  void *v24;
  SearchResult *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  unint64_t v30;
  SearchResult *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  DirectionsPlan *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  NotificationRestorationAction *v48;
  void *v50;
  _QWORD v51[2];

  v3 = -[SyncedBookmarkRepr type](self, "type");
  if (v3 == 4)
  {
    if (-[SyncedBookmarkRepr placesCount](self, "placesCount") < 2)
      goto LABEL_41;
    v19 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[SyncedBookmarkRepr placesAtIndex:](self, "placesAtIndex:", 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SyncedBookmarkRepr places](self, "places"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));

    v23 = -[SearchResult initWithBookmarkRepresentation:]([SearchResult alloc], "initWithBookmarkRepresentation:", v19);
    v25 = -[SearchResult initWithBookmarkRepresentation:]([SearchResult alloc], "initWithBookmarkRepresentation:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult composedWaypoint](v23, "composedWaypoint"));
    v27 = objc_claimAutoreleasedReturnValue(-[SearchResult composedWaypoint](v25, "composedWaypoint"));
    v28 = (void *)v27;
    v20 = 0;
    if (v26 && v27)
    {
      v29 = -[SyncedBookmarkRepr directionsMode](self, "directionsMode") - 2;
      if (v29 > 2)
        v30 = 0;
      else
        v30 = qword_100E3D0D0[v29] - 1;
      v39 = objc_alloc_init(DirectionsPlan);
      v40 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
      -[DirectionsPlan setRouteRequestStorage:](v39, "setRouteRequestStorage:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](v19, "title"));
      -[DirectionsPlan setOriginString:](v39, "setOriginString:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
      -[DirectionsPlan setDestinationString:](v39, "setDestinationString:", v42);

      if (v30 > 7)
        v43 = 0;
      else
        v43 = dword_100E3D0E8[v30];
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v39, "routeRequestStorage"));
      objc_msgSend(v44, "setTransportType:", v43);

      v51[0] = v26;
      v51[1] = v28;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
      v46 = objc_msgSend(v45, "mutableCopy");
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v39, "routeRequestStorage"));
      objc_msgSend(v47, "setWaypoints:", v46);

      -[DirectionsPlan setDisplayMethod:](v39, "setDisplayMethod:", 1);
      v20 = objc_alloc_init(MapsActivity);
      -[MapsActivity setDirectionsPlan:](v20, "setDirectionsPlan:", v39);

    }
    goto LABEL_37;
  }
  if (v3 != 3)
  {
    if (-[SyncedBookmarkRepr type](self, "type") == 2
      && (!-[SyncedBookmarkRepr hasLatitude](self, "hasLatitude")
       || !-[SyncedBookmarkRepr hasLongitude](self, "hasLongitude")))
    {
      -[SyncedBookmarkRepr regionLatitude](self, "regionLatitude");
      -[SyncedBookmarkRepr setLatitude:](self, "setLatitude:");
      -[SyncedBookmarkRepr regionLongitude](self, "regionLongitude");
      -[SyncedBookmarkRepr setLongitude:](self, "setLongitude:");
    }
    v31 = -[SearchResult initWithBookmarkRepresentation:]([SearchResult alloc], "initWithBookmarkRepresentation:", self);
    v19 = v31;
    if (!v31)
      goto LABEL_28;
    -[SearchResult coordinate](v31, "coordinate");
    v20 = 0;
    if (v33 < -180.0 || v33 > 180.0 || v32 < -90.0 || v32 > 90.0)
    {
LABEL_39:

      if (v20)
      {
        v48 = objc_alloc_init(NotificationRestorationAction);
        v12 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", v20, v48);

        return v12;
      }
LABEL_41:
      v12 = 0;
      return v12;
    }
    -[SearchResult coordinate](v19, "coordinate");
    if (fabs(v35) < 0.00000000999999994 && fabs(v34) < 0.00000000999999994)
    {
LABEL_28:
      v20 = 0;
      goto LABEL_39;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v19, "mapItem"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_geoMapItemStorageForPersistence"));

    if (v22)
    {
      v20 = objc_alloc_init(MapsActivity);
      v50 = v22;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
      v38 = objc_msgSend(v37, "mutableCopy");
      -[MapsActivity setSearchPlaces:](v20, "setSearchPlaces:", v38);

      -[MapsActivity setSelectedPlaceIndex:](v20, "setSelectedPlaceIndex:", 0);
    }
    else
    {
      v20 = 0;
    }
LABEL_38:

    goto LABEL_39;
  }
  -[SyncedBookmarkRepr regionLatitude](self, "regionLatitude");
  v5 = v4;
  -[SyncedBookmarkRepr regionLongitude](self, "regionLongitude");
  v7 = CLLocationCoordinate2DMake(v5, v6);
  -[SyncedBookmarkRepr regionLatitudeDelta](self, "regionLatitudeDelta");
  v9 = v8;
  -[SyncedBookmarkRepr regionLongitudeDelta](self, "regionLongitudeDelta");
  v11 = *(_QWORD *)&v10;
  v12 = 0;
  if (v7.longitude >= -180.0 && v7.longitude <= 180.0 && v7.latitude >= -90.0 && v7.latitude <= 90.0)
  {
    v12 = 0;
    if (v9 >= 0.0 && v9 <= 180.0 && v10 >= 0.0 && v10 <= 360.0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v13, "bounds");

      v14.n128_u64[0] = *(_QWORD *)&v7.latitude;
      v15.n128_u64[0] = *(_QWORD *)&v7.longitude;
      v16.n128_f64[0] = v9;
      v17.n128_u64[0] = v11;
      v18 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", MKMapRectForCoordinateRegion(v14, v15, v16, v17));
      v19 = (SearchResult *)objc_claimAutoreleasedReturnValue(v18);
      v20 = objc_alloc_init(MapsActivity);
      v21 = objc_alloc_init((Class)GEOURLOptions);
      -[MapsActivity setDisplayOptions:](v20, "setDisplayOptions:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult geoCamera](v19, "geoCamera"));
      v23 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v20, "displayOptions"));
      -[SearchResult setCamera:](v23, "setCamera:", v22);
LABEL_37:

      goto LABEL_38;
    }
  }
  return v12;
}

- (GEOMapRegion)mapRegion
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SyncedBookmarkRepr regionLatitude](self, "regionLatitude");
  v4 = v3;
  -[SyncedBookmarkRepr regionLongitude](self, "regionLongitude");
  v6 = v5;
  -[SyncedBookmarkRepr regionLatitudeDelta](self, "regionLatitudeDelta");
  v8 = v7;
  -[SyncedBookmarkRepr regionLongitudeDelta](self, "regionLongitudeDelta");
  return (GEOMapRegion *)+[GEOMapRegion _mapkit_mapRegionForLatitude:longitude:latSpan:longSpan:](GEOMapRegion, "_mapkit_mapRegionForLatitude:longitude:latSpan:longSpan:", v4, v6, v8, v9);
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1011EA358[a3];
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIP")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSingleLineAddress
{
  return self->_singleLineAddress != 0;
}

- (void)setLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRegionLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_regionLatitude = a3;
}

- (void)setHasRegionLatitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRegionLatitude
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRegionLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_regionLongitude = a3;
}

- (void)setHasRegionLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRegionLongitude
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRegionLatitudeDelta:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_regionLatitudeDelta = a3;
}

- (void)setHasRegionLatitudeDelta:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRegionLatitudeDelta
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRegionLongitudeDelta:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_regionLongitudeDelta = a3;
}

- (void)setHasRegionLongitudeDelta:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRegionLongitudeDelta
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setProviderID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_providerID = a3;
}

- (void)setHasProviderID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasProviderID
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBusinessID:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_businessID = a3;
}

- (void)setHasBusinessID:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBusinessID
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (int)directionsMode
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_directionsMode;
  else
    return 0;
}

- (void)setDirectionsMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_directionsMode = a3;
}

- (void)setHasDirectionsMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDirectionsMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)directionsModeAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1011EA388[a3];
}

- (int)StringAsDirectionsMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearPlaces
{
  -[NSMutableArray removeAllObjects](self->_places, "removeAllObjects");
}

- (void)addPlaces:(id)a3
{
  id v4;
  NSMutableArray *places;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  places = self->_places;
  v8 = v4;
  if (!places)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_places;
    self->_places = v6;

    v4 = v8;
    places = self->_places;
  }
  -[NSMutableArray addObject:](places, "addObject:", v4);

}

- (unint64_t)placesCount
{
  return (unint64_t)-[NSMutableArray count](self->_places, "count");
}

- (id)placesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_places, "objectAtIndex:", a3);
}

+ (Class)placesType
{
  return (Class)objc_opt_class(SyncedBookmarkRepr);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SyncedBookmarkRepr;
  v3 = -[SyncedBookmarkRepr description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SyncedBookmarkRepr dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  NSString *title;
  NSString *singleLineAddress;
  __int16 has;
  void *v9;
  NSString *contactIdentifier;
  uint64_t directionsMode;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  type = self->_type;
  if (type >= 6)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type));
  else
    v5 = off_1011EA358[type];
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  singleLineAddress = self->_singleLineAddress;
  if (singleLineAddress)
    objc_msgSend(v3, "setObject:forKey:", singleLineAddress, CFSTR("singleLineAddress"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("latitude"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("longitude"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_regionLatitude));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("regionLatitude"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_regionLongitude));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("regionLongitude"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_regionLatitudeDelta));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("regionLatitudeDelta"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_28;
  }
LABEL_27:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_regionLongitudeDelta));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("regionLongitudeDelta"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_28:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_providerID));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("providerID"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_16:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_businessID));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("businessID"));

  }
LABEL_17:
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
    objc_msgSend(v3, "setObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    directionsMode = self->_directionsMode;
    if (directionsMode >= 5)
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_directionsMode));
    else
      v12 = off_1011EA388[directionsMode];
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("directionsMode"));

  }
  if (-[NSMutableArray count](self->_places, "count"))
  {
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_places, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v21 = self->_places;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("places"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100C5C828(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *title;
  NSString *singleLineAddress;
  __int16 has;
  NSString *contactIdentifier;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  PBDataWriterWriteInt32Field(v4, self->_type, 1);
  title = self->_title;
  if (title)
    PBDataWriterWriteStringField(v4, title, 2);
  singleLineAddress = self->_singleLineAddress;
  if (singleLineAddress)
    PBDataWriterWriteStringField(v4, singleLineAddress, 4);
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v4, 10, self->_latitude);
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_28;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField(v4, 11, self->_longitude);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField(v4, 20, self->_regionLatitude);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField(v4, 21, self->_regionLongitude);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField(v4, 22, self->_regionLatitudeDelta);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField(v4, 23, self->_regionLongitudeDelta);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v4, self->_providerID, 30);
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_13:
    PBDataWriterWriteUint64Field(v4, self->_businessID, 31);
LABEL_14:
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
    PBDataWriterWriteStringField(v4, contactIdentifier, 32);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field(v4, self->_directionsMode, 40);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_places;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 41);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;

  v4 = a3;
  v4[28] = self->_type;
  v10 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v10;
  }
  if (self->_singleLineAddress)
  {
    objc_msgSend(v10, "setSingleLineAddress:");
    v4 = v10;
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_latitude;
    *((_WORD *)v4 + 58) |= 2u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_25;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_longitude;
  *((_WORD *)v4 + 58) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_regionLatitude;
  *((_WORD *)v4 + 58) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_regionLongitude;
  *((_WORD *)v4 + 58) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_regionLatitudeDelta;
  *((_WORD *)v4 + 58) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_regionLongitudeDelta;
  *((_WORD *)v4 + 58) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_29:
  v4[22] = self->_providerID;
  *((_WORD *)v4 + 58) |= 0x100u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_13:
    *((_QWORD *)v4 + 1) = self->_businessID;
    *((_WORD *)v4 + 58) |= 1u;
  }
LABEL_14:
  if (self->_contactIdentifier)
  {
    objc_msgSend(v10, "setContactIdentifier:");
    v4 = v10;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v4[18] = self->_directionsMode;
    *((_WORD *)v4 + 58) |= 0x80u;
  }
  if (-[SyncedBookmarkRepr placesCount](self, "placesCount"))
  {
    objc_msgSend(v10, "clearPlaces");
    v6 = -[SyncedBookmarkRepr placesCount](self, "placesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SyncedBookmarkRepr placesAtIndex:](self, "placesAtIndex:", i));
        objc_msgSend(v10, "addPlaces:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  __int16 has;
  id v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[28] = self->_type;
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v6;

  v8 = -[NSString copyWithZone:](self->_singleLineAddress, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 12);
  *((_QWORD *)v5 + 12) = v8;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_latitude;
    *((_WORD *)v5 + 58) |= 2u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_longitude;
  *((_WORD *)v5 + 58) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_regionLatitude;
  *((_WORD *)v5 + 58) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)v5 + 6) = *(_QWORD *)&self->_regionLongitude;
  *((_WORD *)v5 + 58) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)v5 + 5) = *(_QWORD *)&self->_regionLatitudeDelta;
  *((_WORD *)v5 + 58) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)v5 + 7) = *(_QWORD *)&self->_regionLongitudeDelta;
  *((_WORD *)v5 + 58) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_26:
  v5[22] = self->_providerID;
  *((_WORD *)v5 + 58) |= 0x100u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_9:
    *((_QWORD *)v5 + 1) = self->_businessID;
    *((_WORD *)v5 + 58) |= 1u;
  }
LABEL_10:
  v11 = -[NSString copyWithZone:](self->_contactIdentifier, "copyWithZone:", a3);
  v12 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v11;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v5[18] = self->_directionsMode;
    *((_WORD *)v5 + 58) |= 0x80u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_places;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v5, "addPlaces:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *singleLineAddress;
  __int16 has;
  __int16 v8;
  NSString *contactIdentifier;
  NSMutableArray *places;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_57;
  if (self->_type != *((_DWORD *)v4 + 28))
    goto LABEL_57;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_57;
  }
  singleLineAddress = self->_singleLineAddress;
  if ((unint64_t)singleLineAddress | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](singleLineAddress, "isEqual:"))
      goto LABEL_57;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 58);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_latitude != *((double *)v4 + 2))
      goto LABEL_57;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_longitude != *((double *)v4 + 3))
      goto LABEL_57;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_regionLatitude != *((double *)v4 + 4))
      goto LABEL_57;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_regionLongitude != *((double *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_regionLatitudeDelta != *((double *)v4 + 5))
      goto LABEL_57;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_regionLongitudeDelta != *((double *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_providerID != *((_DWORD *)v4 + 22))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_businessID != *((_QWORD *)v4 + 1))
      goto LABEL_57;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_57;
  }
  contactIdentifier = self->_contactIdentifier;
  if ((unint64_t)contactIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](contactIdentifier, "isEqual:"))
    {
LABEL_57:
      v11 = 0;
      goto LABEL_58;
    }
    has = (__int16)self->_has;
    v8 = *((_WORD *)v4 + 58);
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_directionsMode != *((_DWORD *)v4 + 18))
      goto LABEL_57;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  places = self->_places;
  if ((unint64_t)places | *((_QWORD *)v4 + 10))
    v11 = -[NSMutableArray isEqual:](places, "isEqual:");
  else
    v11 = 1;
LABEL_58:

  return v11;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double latitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double longitude;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double regionLatitude;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double regionLongitude;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double regionLatitudeDelta;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double regionLongitudeDelta;
  double v31;
  long double v32;
  double v33;
  uint64_t v34;
  unint64_t v35;
  NSUInteger v36;
  uint64_t v37;
  NSUInteger v39;
  NSUInteger v40;
  uint64_t type;

  type = self->_type;
  v40 = -[NSString hash](self->_title, "hash");
  v39 = -[NSString hash](self->_singleLineAddress, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    latitude = self->_latitude;
    v6 = -latitude;
    if (latitude >= 0.0)
      v6 = self->_latitude;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 4) != 0)
  {
    longitude = self->_longitude;
    v11 = -longitude;
    if (longitude >= 0.0)
      v11 = self->_longitude;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 8) != 0)
  {
    regionLatitude = self->_regionLatitude;
    v16 = -regionLatitude;
    if (regionLatitude >= 0.0)
      v16 = self->_regionLatitude;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 0x20) != 0)
  {
    regionLongitude = self->_regionLongitude;
    v21 = -regionLongitude;
    if (regionLongitude >= 0.0)
      v21 = self->_regionLongitude;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 0x10) != 0)
  {
    regionLatitudeDelta = self->_regionLatitudeDelta;
    v26 = -regionLatitudeDelta;
    if (regionLatitudeDelta >= 0.0)
      v26 = self->_regionLatitudeDelta;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((has & 0x40) != 0)
  {
    regionLongitudeDelta = self->_regionLongitudeDelta;
    v31 = -regionLongitudeDelta;
    if (regionLongitudeDelta >= 0.0)
      v31 = self->_regionLongitudeDelta;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 0x100) != 0)
  {
    v34 = 2654435761 * self->_providerID;
    if ((has & 1) != 0)
      goto LABEL_51;
  }
  else
  {
    v34 = 0;
    if ((has & 1) != 0)
    {
LABEL_51:
      v35 = 2654435761u * self->_businessID;
      goto LABEL_54;
    }
  }
  v35 = 0;
LABEL_54:
  v36 = -[NSString hash](self->_contactIdentifier, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v37 = 2654435761 * self->_directionsMode;
  else
    v37 = 0;
  return v40 ^ v39 ^ v4 ^ v9 ^ v14 ^ (2654435761 * type) ^ v19 ^ v24 ^ v29 ^ v34 ^ v35 ^ v36 ^ v37 ^ (unint64_t)-[NSMutableArray hash](self->_places, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  self->_type = *((_DWORD *)v4 + 28);
  if (*((_QWORD *)v4 + 13))
    -[SyncedBookmarkRepr setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 12))
    -[SyncedBookmarkRepr setSingleLineAddress:](self, "setSingleLineAddress:");
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 2) != 0)
  {
    self->_latitude = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 58);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_28;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_longitude = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_regionLatitude = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_regionLongitude = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_regionLatitudeDelta = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  self->_regionLongitudeDelta = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_32:
  self->_providerID = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 58) & 1) != 0)
  {
LABEL_13:
    self->_businessID = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 8))
    -[SyncedBookmarkRepr setContactIdentifier:](self, "setContactIdentifier:");
  if ((*((_WORD *)v4 + 58) & 0x80) != 0)
  {
    self->_directionsMode = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x80u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 10);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SyncedBookmarkRepr addPlaces:](self, "addPlaces:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)singleLineAddress
{
  return self->_singleLineAddress;
}

- (void)setSingleLineAddress:(id)a3
{
  objc_storeStrong((id *)&self->_singleLineAddress, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)regionLatitude
{
  return self->_regionLatitude;
}

- (double)regionLongitude
{
  return self->_regionLongitude;
}

- (double)regionLatitudeDelta
{
  return self->_regionLatitudeDelta;
}

- (double)regionLongitudeDelta
{
  return self->_regionLongitudeDelta;
}

- (unsigned)providerID
{
  return self->_providerID;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSMutableArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_places, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_singleLineAddress, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end

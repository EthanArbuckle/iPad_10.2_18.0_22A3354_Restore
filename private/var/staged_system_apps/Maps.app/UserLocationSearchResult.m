@implementation UserLocationSearchResult

- (UserLocationSearchResult)init
{
  UserLocationSearchResult *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UserLocationSearchResult;
  v2 = -[SearchResult initWithType:](&v7, "initWithType:", 4);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult defaultName](v2, "defaultName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](v2, "place"));
    objc_msgSend(v5, "setName:", v4);

  }
  return v2;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  CFAbsoluteTime v6;
  uint64_t v7;
  double v8;
  void *v9;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = CFAbsoluteTimeGetCurrent() - self->_reverseGeocodeUpdateTime;
  v8 = GEOCalculateDistance(v7, self->_reverseGeocodeCoordinate.latitude, self->_reverseGeocodeCoordinate.longitude, latitude, longitude);
  if (v6 > 60.0 || v8 > 500.0)
  {
    -[SearchResult clearLocationInformation](self, "clearLocationInformation");
    if (self->_selected && v8 > 500.0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
      objc_msgSend(v9, "processSearchResult:traits:", self, 0);

    }
  }
  self->super._coordinate.latitude = latitude;
  self->super._coordinate.longitude = longitude;
  -[SearchResult _syncGEOPlaceWithCoordinate](self, "_syncGEOPlaceWithCoordinate");
}

- (double)accuracy
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationSearchResult location](self, "location"));
  objc_msgSend(v2, "horizontalAccuracy");
  v4 = v3;

  return v4;
}

- (void)setLocation:(id)a3
{
  CLLocation *location;
  double v6;
  void *v7;
  CLLocation *v8;

  location = (CLLocation *)a3;
  v8 = location;
  if (self->_location != location)
  {
    objc_storeStrong((id *)&self->_location, a3);
    location = self->_location;
  }
  -[UserLocationSearchResult _updateFloorOrdinal:](self, "_updateFloorOrdinal:", GEOLocationFloorOrdinalFromCLLocation(location));
  -[CLLocation horizontalAccuracy](v8, "horizontalAccuracy");
  if (vabdd_f64(v6, self->_reverseGeocodeAccuracy) > 50.0)
  {
    -[SearchResult clearLocationInformation](self, "clearLocationInformation");
    if (self->_selected)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
      objc_msgSend(v7, "processSearchResult:traits:", self, 0);

    }
  }

}

- (void)_updateFloorOrdinal:(int)a3
{
  if (a3 == 0x7FFFFFFF)
    -[SearchResultRepr setHasFloorOrdinal:](self, "setHasFloorOrdinal:", 0);
  else
    -[SearchResultRepr setFloorOrdinal:](self, "setFloorOrdinal:");
}

- (BOOL)needsReverseGeocodeCheck
{
  return !-[SearchResult isReverseGeocoded](self, "isReverseGeocoded");
}

- (void)setReverseGeocoded:(BOOL)a3
{
  _BOOL8 v3;
  CLLocationDegrees v5;
  CLLocationDegrees v6;
  double v7;
  objc_super v8;

  v3 = a3;
  if (a3)
  {
    self->_reverseGeocodeUpdateTime = CFAbsoluteTimeGetCurrent();
    -[SearchResult coordinate](self, "coordinate");
    self->_reverseGeocodeCoordinate.latitude = v5;
    self->_reverseGeocodeCoordinate.longitude = v6;
    -[UserLocationSearchResult accuracy](self, "accuracy");
    self->_reverseGeocodeAccuracy = v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)UserLocationSearchResult;
  -[SearchResult setReverseGeocoded:](&v8, "setReverseGeocoded:", v3);
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SearchResult defaultName](self, "defaultName", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr place](self, "place"));
    objc_msgSend(v7, "setName:", v8);

  }
}

- (CLLocation)location
{
  return self->_location;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end

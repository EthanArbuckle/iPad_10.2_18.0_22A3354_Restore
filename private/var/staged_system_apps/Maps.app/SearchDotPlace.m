@implementation SearchDotPlace

- (SearchDotPlace)init
{
  SearchDotPlace *result;

  result = (SearchDotPlace *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (SearchDotPlace)initWithGEODotPlace:(id)a3
{
  id v4;
  SearchDotPlace *v5;
  uint64_t v6;
  GEOMapItemIdentifier *identifier;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  void *v11;
  CLLocationDegrees v12;
  uint64_t v13;
  GEOStyleAttributes *styleAttributes;
  uint64_t v15;
  NSString *name;
  id v17;
  MKMapItem *v18;
  MKMapItem *mapItem;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchDotPlace;
  v5 = -[SearchDotPlace init](&v21, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v8, "lat");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latLng"));
    objc_msgSend(v11, "lng");
    v5->_coordinate = CLLocationCoordinate2DMake(v10, v12);

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleAttributes"));
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    name = v5->_name;
    v5->_name = (NSString *)v15;

    v17 = objc_msgSend(objc_alloc((Class)GEODotPlaceMapItem), "initWithDotPlace:", v4);
    v18 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v17, 0);
    mapItem = v5->_mapItem;
    v5->_mapItem = v18;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlace identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "muid");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  SearchDotPlace *v4;
  uint64_t v5;
  SearchDotPlace *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (SearchDotPlace *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(SearchDotPlace);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlace identifier](self, "identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlace identifier](v6, "identifier"));

      v9 = objc_msgSend(v7, "isEqualToGEOMapItemIdentifier:", v8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
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

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (NSString)name
{
  return self->_name;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

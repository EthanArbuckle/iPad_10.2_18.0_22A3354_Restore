@implementation ParkedCarPersonalizedItem

- (ParkedCarPersonalizedItem)initWithParkedCar:(id)a3
{
  id v5;
  ParkedCarPersonalizedItem *v6;
  ParkedCarPersonalizedItem *v7;
  uint64_t v8;
  MKMapItem *mapItem;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  uint64_t v12;
  NSString *title;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ParkedCarPersonalizedItem;
  v6 = -[ParkedCarPersonalizedItem init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parkedCar, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    mapItem = v7->_mapItem;
    v7->_mapItem = (MKMapItem *)v8;

    objc_msgSend(v5, "coordinate");
    v7->_coordinate.latitude = v10;
    v7->_coordinate.longitude = v11;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    title = v7->_title;
    v7->_title = (NSString *)v12;

  }
  return v7;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)-[MKMapItem _enhancedPlacement](self->_mapItem, "_enhancedPlacement");
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)-[MKMapItem _labelGeometry](self->_mapItem, "_labelGeometry");
}

- (unint64_t)priority
{
  return 0;
}

- (NSSet)keys
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCar personalizedItemKey](ParkedCar, "personalizedItemKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v2));

  return (NSSet *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", self->_title, 1);
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment");
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment");
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:", v2));

  return (PersonalizedItemStyleAttributesAdornment *)v3;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  void *v3;
  void *v4;
  uint64_t v5;
  double latitude;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double longitude;
  double v16;
  long double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarPersonalizedItem styleAttributes](self, "styleAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "styleAttributes"));
  v5 = (int)objc_msgSend(v4, "poiType");
  latitude = self->_coordinate.latitude;
  v7 = -latitude;
  if (latitude >= 0.0)
    v7 = self->_coordinate.latitude;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = fmod(v8, 1.84467441e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabs(v9);
  if (v9 >= 0.0)
    v13 = v12;
  v14 = v13 ^ v5;
  longitude = self->_coordinate.longitude;
  v16 = -longitude;
  if (longitude >= 0.0)
    v16 = self->_coordinate.longitude;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = fmod(v17, 1.84467441e19);
  v20 = 2654435761u * (unint64_t)v19;
  v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0)
    v21 = 2654435761u * (unint64_t)v19;
  v22 = v20 - (unint64_t)fabs(v18);
  if (v18 >= 0.0)
    v22 = v21;
  v23 = v14 ^ v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));
    v23 ^= (unint64_t)objc_msgSend(v27, "hash");

  }
  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:](PersonalizedItemClientFeatureIDAdornment, "adornmentWithClientFeatureID:", v23);
}

- (unint64_t)sortOrder
{
  return 0;
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeHiddenFromMap
{
  return 0;
}

- (SearchResult)searchResult
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (NSDate)eventDate
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (NSArray)searchableStrings
{
  return (NSArray *)&__NSArray0__struct;
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
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

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->_source, a3);
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

@implementation TrafficIncidentPersonalizedItem

- (TrafficIncidentPersonalizedItem)initWithIncidentReport:(id)a3
{
  id v5;
  TrafficIncidentPersonalizedItem *v6;
  TrafficIncidentPersonalizedItem *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  CLLocationDegrees v12;
  void *v13;
  void *v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  id v17;
  MKMapItem *v18;
  MKMapItem *mapItem;
  void *v20;
  void *v21;
  double v22;
  CLLocationDegrees v23;
  void *v24;
  void *v25;
  CLLocationDegrees v26;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TrafficIncidentPersonalizedItem;
  v6 = -[TrafficIncidentPersonalizedItem init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_report, a3);
    v8 = objc_alloc((Class)MKPlacemark);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItemLocation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "latLng"));
    objc_msgSend(v10, "lat");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItemLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "latLng"));
    objc_msgSend(v14, "lng");
    v16 = CLLocationCoordinate2DMake(v12, v15);
    v17 = objc_msgSend(v8, "initWithCoordinate:", v16.latitude, v16.longitude);

    v18 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v17);
    mapItem = v7->_mapItem;
    v7->_mapItem = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItemLocation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "latLng"));
    objc_msgSend(v21, "lat");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItemLocation"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "latLng"));
    objc_msgSend(v25, "lng");
    v7->_coordinate = CLLocationCoordinate2DMake(v23, v26);

  }
  return v7;
}

- (unint64_t)priority
{
  return 0;
}

- (NSSet)keys
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport uniqueID](self->_report, "uniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v2));

  return (NSSet *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutItem defaultDisplayTextForType:](TrafficIncidentLayoutItem, "defaultDisplayTextForType:", -[TrafficIncidentReport incidentType](self->_report, "incidentType")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v2, 1));

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
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
  void *v4;
  _UNKNOWN **v6;
  _UNKNOWN **v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutItem styleAttributesForType:](TrafficIncidentLayoutItem, "styleAttributesForType:", -[TrafficIncidentReport incidentType](self->_report, "incidentType")));
  v6 = &off_10126E740;
  v7 = &off_10126E758;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v2, v3));

  return (PersonalizedItemStyleAttributesAdornment *)v4;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  long double v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentPersonalizedItem styleAttributes](self, "styleAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "styleAttributes"));
  v5 = (int)objc_msgSend(v4, "poiType");
  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  v7 = -v6;
  if (v6 >= 0.0)
    v7 = v6;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  v11 = v10 + (unint64_t)v9;
  v12 = fabs(v9);
  if (v9 <= 0.0)
    v11 = v10;
  v13 = v10 - (unint64_t)v12;
  if (v9 >= 0.0)
    v13 = v11;
  v14 = v13 ^ v5;
  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  if (v15 < 0.0)
    v15 = -v15;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = fmod(v16, 1.84467441e19);
  v19 = 2654435761u * (unint64_t)v18;
  v20 = v19 + (unint64_t)v17;
  if (v17 <= 0.0)
    v20 = 2654435761u * (unint64_t)v18;
  v21 = v19 - (unint64_t)fabs(v17);
  if (v17 >= 0.0)
    v21 = v20;
  v22 = v14 ^ v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
    v22 ^= (unint64_t)objc_msgSend(v26, "hash");

  }
  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:](PersonalizedItemClientFeatureIDAdornment, "adornmentWithClientFeatureID:", v22);
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentPersonalizedItem mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_enhancedPlacement"));

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)labelGeometry
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentPersonalizedItem mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_labelGeometry"));

  return (GEOLabelGeometry *)v3;
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

- (TrafficIncidentReport)incidentReport
{
  return self->_report;
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

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TrafficIncidentPersonalizedItem %p: %@>"), self, self->_report);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end

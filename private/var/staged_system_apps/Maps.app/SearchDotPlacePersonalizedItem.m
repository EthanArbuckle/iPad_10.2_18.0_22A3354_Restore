@implementation SearchDotPlacePersonalizedItem

- (SearchDotPlacePersonalizedItem)initWithSearchDotPlace:(id)a3
{
  id v5;
  SearchDotPlacePersonalizedItem *v6;
  SearchDotPlaceItemKey *v7;
  SearchDotPlaceItemKey *key;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  uint64_t v11;
  NSString *name;
  id v13;
  void *v14;
  GEOFeatureStyleAttributes *v15;
  GEOFeatureStyleAttributes *style;
  uint64_t v17;
  MKMapItem *mapItem;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SearchDotPlacePersonalizedItem;
  v6 = -[SearchDotPlacePersonalizedItem init](&v20, "init");
  if (v6)
  {
    v7 = -[SearchDotPlaceItemKey initWithSearchDotPlace:]([SearchDotPlaceItemKey alloc], "initWithSearchDotPlace:", v5);
    key = v6->_key;
    v6->_key = v7;

    objc_msgSend(v5, "coordinate");
    v6->_coordinate.latitude = v9;
    v6->_coordinate.longitude = v10;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    name = v6->_name;
    v6->_name = (NSString *)v11;

    v13 = objc_alloc((Class)GEOFeatureStyleAttributes);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));
    v15 = (GEOFeatureStyleAttributes *)objc_msgSend(v13, "initWithGEOStyleAttributes:", v14);
    style = v6->_style;
    v6->_style = v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    mapItem = v6->_mapItem;
    v6->_mapItem = (MKMapItem *)v17;

    objc_storeStrong((id *)&v6->_searchDotPlace, a3);
  }

  return v6;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)-[MKMapItem _enhancedPlacement](self->_mapItem, "_enhancedPlacement");
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)-[MKMapItem _labelGeometry](self->_mapItem, "_labelGeometry");
}

- (NSSet)keys
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlacePersonalizedItem key](self, "key"));
  v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  return (NSSet *)v5;
}

- (unint64_t)priority
{
  return 5;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlacePersonalizedItem name](self, "name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v2, 0));

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
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v9[0] = &off_10126FF58;
  v9[1] = &off_10126FF88;
  v10[0] = &off_10126FF70;
  v10[1] = &off_10126FFA0;
  v9[2] = &off_10126FFB8;
  v9[3] = &off_10126FFD0;
  v10[2] = &off_10126FFA0;
  v10[3] = &off_10126FFA0;
  v9[4] = &off_10126FFE8;
  v10[4] = &off_101270000;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 5));
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlacePersonalizedItem style](self, "style"));
  v6 = objc_msgSend(v3, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v5, v6));

  return (PersonalizedItemStyleAttributesAdornment *)v7;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlacePersonalizedItem styleAttributes](self, "styleAttributes"));
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

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (NSArray)searchableStrings
{
  return 0;
}

- (SearchResult)searchResult
{
  return 0;
}

- (unint64_t)sortOrder
{
  return 0;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->_source, a3);
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

- (SearchDotPlaceItemKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

- (GEOFeatureStyleAttributes)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (SearchDotPlace)searchDotPlace
{
  return self->_searchDotPlace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchDotPlace, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_source);
}

@end

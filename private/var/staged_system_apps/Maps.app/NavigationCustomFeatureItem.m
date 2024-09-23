@implementation NavigationCustomFeatureItem

- (NavigationCustomFeatureItem)initWithMapItem:(id)a3
{
  id v5;
  NavigationCustomFeatureItem *v6;
  NavigationCustomFeatureItem *v7;
  SearchResult *v8;
  SearchResult *searchResult;
  PersonalizedMapItemKey *v10;
  void *v11;
  PersonalizedMapItemKey *v12;
  uint64_t v13;
  NSSet *keys;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  PersonalizedItemStyleAttributesAdornment *styleAttributes;
  objc_super v24;
  __int128 v25;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NavigationCustomFeatureItem;
  v6 = -[NavigationCustomFeatureItem init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v5);
    searchResult = v7->_searchResult;
    v7->_searchResult = v8;

    v10 = [PersonalizedMapItemKey alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem mapItem](v7, "mapItem"));
    v12 = -[PersonalizedMapItemKey initWithMapItem:](v10, "initWithMapItem:", v11);
    v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
    keys = v7->_keys;
    v7->_keys = (NSSet *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem mapItem](v7, "mapItem"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_styleAttributes"));
    v17 = objc_msgSend(v16, "copy");
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (id)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
    v20 = v19;

    v25 = xmmword_100E3CE50;
    objc_msgSend(v20, "replaceAttributes:count:", &v25, 2);
    v21 = objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:", v20));
    styleAttributes = v7->_styleAttributes;
    v7->_styleAttributes = (PersonalizedItemStyleAttributesAdornment *)v21;

  }
  return v7;
}

- (unint64_t)priority
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem mapItem](self, "mapItem"));
  objc_msgSend(v2, "_coordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_enhancedPlacement"));

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)labelGeometry
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_labelGeometry"));

  return (GEOLabelGeometry *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment");
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v3, 1));

  return (PersonalizedItemPrioritizedStringAdornment *)v4;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_maps_detourTextForIdiom:", 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v3, 1));
  return (PersonalizedItemPrioritizedStringAdornment *)v4;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeatureItem styleAttributes](self, "styleAttributes"));
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

- (unint64_t)sortOrder
{
  return 0;
}

- (BOOL)shouldBeClustered
{
  return 1;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeHiddenFromMap
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

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (NSSet)keys
{
  return self->_keys;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->_source, a3);
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end

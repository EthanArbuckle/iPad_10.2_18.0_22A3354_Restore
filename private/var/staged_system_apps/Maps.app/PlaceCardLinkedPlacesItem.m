@implementation PlaceCardLinkedPlacesItem

- (PlaceCardLinkedPlacesItem)init
{
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("init method not supported"));

  return 0;
}

- (PlaceCardLinkedPlacesItem)initWithPersonalizedItem:(id)a3
{
  id v5;
  PlaceCardLinkedPlacesItem *v6;
  PlaceCardLinkedPlacesItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PlaceCardLinkedPlacesItem;
  v6 = -[PlaceCardLinkedPlacesItem init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_personalizedItem, a3);

  return v7;
}

- (PlaceCardLinkedPlacesItem)initWithGEOMapItem:(id)a3
{
  id v5;
  PlaceCardLinkedPlacesItem *v6;
  PlaceCardLinkedPlacesItem *v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  PersonalizedMapItemKey *v10;
  PersonalizedItemKey *key;
  MKMapItem *v12;
  MKMapItem *mapItem;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PlaceCardLinkedPlacesItem;
  v6 = -[PlaceCardLinkedPlacesItem init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoMapItem, a3);
    objc_msgSend(v5, "coordinate");
    v7->_coordinate = CLLocationCoordinate2DMake(v8, v9);
    v10 = -[PersonalizedMapItemKey initWithGeoMapItem:]([PersonalizedMapItemKey alloc], "initWithGeoMapItem:", v5);
    key = v7->_key;
    v7->_key = (PersonalizedItemKey *)v10;

    v12 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v5, objc_msgSend(v5, "_hasResolvablePartialInformation"));
    mapItem = v7->_mapItem;
    v7->_mapItem = v12;

  }
  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  PersonalizedItem *personalizedItem;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    -[PersonalizedItem coordinate](personalizedItem, "coordinate");
  }
  else
  {
    latitude = self->_coordinate.latitude;
    longitude = self->_coordinate.longitude;
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  PersonalizedItem *personalizedItem;
  void *v4;
  void *v5;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem enhancedPlacement](personalizedItem, "enhancedPlacement"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLinkedPlacesItem mapItem](self, "mapItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_enhancedPlacement"));

  }
  return (GEOEnhancedPlacement *)v4;
}

- (GEOLabelGeometry)labelGeometry
{
  PersonalizedItem *personalizedItem;
  void *v4;
  void *v5;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem labelGeometry](personalizedItem, "labelGeometry"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLinkedPlacesItem mapItem](self, "mapItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_labelGeometry"));

  }
  return (GEOLabelGeometry *)v4;
}

- (NSSet)keys
{
  PersonalizedItem *personalizedItem;
  void *v4;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem keys](personalizedItem, "keys"));
  }
  else if (self->_key)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  return (NSSet *)v4;
}

- (MKMapItem)mapItem
{
  PersonalizedItem *personalizedItem;
  MKMapItem *v4;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    v4 = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem mapItem](personalizedItem, "mapItem"));
  else
    v4 = self->_mapItem;
  return v4;
}

- (unint64_t)priority
{
  unint64_t result;

  result = (unint64_t)self->_personalizedItem;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "priority");
  return result;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  PersonalizedItem *personalizedItem;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem title](personalizedItem, "title"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[GEOMapItem name](self->_geoMapItem, "name"));
    v6 = (void *)v5;
    v7 = &stru_1011EB268;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v8, 100));
  }
  return (PersonalizedItemPrioritizedStringAdornment *)v4;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  PersonalizedItem *personalizedItem;
  void *v3;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem subtitle](personalizedItem, "subtitle"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  PersonalizedItem *personalizedItem;
  void *v3;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem prefix](personalizedItem, "prefix"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  GEOFeatureStyleAttributes *styleAttributes;
  PersonalizedItem *personalizedItem;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  GEOFeatureStyleAttributes *v11;
  uint64_t v13;

  styleAttributes = self->_styleAttributes;
  if (!styleAttributes)
  {
    personalizedItem = self->_personalizedItem;
    if (personalizedItem)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem styleAttributes](personalizedItem, "styleAttributes"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));

      if (v6)
        goto LABEL_5;
    }
    else
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[GEOMapItem _styleAttributes](self->_geoMapItem, "_styleAttributes"));
      if (v6)
      {
LABEL_5:
        v7 = objc_msgSend(v6, "copy");

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("__internalChinaAOIInjectPOIsAsSearchResults"));

        if (v9)
        {
          v13 = 0x100010022;
          objc_msgSend(v7, "replaceAttributes:count:", &v13, 1);
        }
        if (-[PlaceCardLinkedPlacesItem isParent](self, "isParent"))
        {
          v10 = 0x200000022;
        }
        else
        {
          if (!-[PlaceCardLinkedPlacesItem isChild](self, "isChild"))
          {
LABEL_12:
            v13 = 0x100010024;
            objc_msgSend(v7, "replaceAttributes:count:", &v13, 1);
            v11 = self->_styleAttributes;
            self->_styleAttributes = (GEOFeatureStyleAttributes *)v7;

            styleAttributes = self->_styleAttributes;
            return (PersonalizedItemStyleAttributesAdornment *)(id)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:", styleAttributes));
          }
          v10 = 0x100000022;
        }
        v13 = v10;
        objc_msgSend(v7, "replaceAttributes:count:", &v13, 1);
        goto LABEL_12;
      }
    }
    v6 = objc_msgSend(objc_alloc((Class)GEOFeatureStyleAttributes), "initWithAttributes:", 4, 226, 5, 3, 6, 348, 10, 2, 0);
    goto LABEL_5;
  }
  return (PersonalizedItemStyleAttributesAdornment *)(id)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:", styleAttributes));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLinkedPlacesItem styleAttributes](self, "styleAttributes"));
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
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    LOBYTE(personalizedItem) = -[PersonalizedItem shouldBeClustered](personalizedItem, "shouldBeClustered");
  return (char)personalizedItem;
}

- (BOOL)showsBalloonCallout
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (self->_personalizedItem)
    return -[PersonalizedItem showsBalloonCallout](self->_personalizedItem, "showsBalloonCallout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLinkedPlacesItem styleAttributes](self, "styleAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "styleAttributes"));
  v5 = objc_msgSend(v4, "isLabelPOI");

  return v5 ^ 1;
}

- (SearchResult)searchResult
{
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    personalizedItem = (PersonalizedItem *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem searchResult](personalizedItem, "searchResult"));
  return (SearchResult *)personalizedItem;
}

- (VKLabelMarker)sourceLabelMarker
{
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    personalizedItem = (PersonalizedItem *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem sourceLabelMarker](personalizedItem, "sourceLabelMarker"));
  return personalizedItem;
}

- (AddressBookAddress)address
{
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    personalizedItem = (PersonalizedItem *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem address](personalizedItem, "address"));
  return (AddressBookAddress *)personalizedItem;
}

- (NSArray)searchableStrings
{
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    personalizedItem = (PersonalizedItem *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem searchableStrings](personalizedItem, "searchableStrings"));
  return (NSArray *)personalizedItem;
}

- (BOOL)mustRefineMapItem
{
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    return -[PersonalizedItem mustRefineMapItem](personalizedItem, "mustRefineMapItem");
  else
    return 1;
}

- (BOOL)shouldBeHiddenFromMap
{
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    LOBYTE(personalizedItem) = -[PersonalizedItem shouldBeHiddenFromMap](personalizedItem, "shouldBeHiddenFromMap");
  return (char)personalizedItem;
}

- (BOOL)wantsDisplayedSearchResultsTypePoints
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("__internalChinaAOIInjectPOIsAsSearchResults"));

  return v3;
}

- (SearchDotPlace)searchDotPlace
{
  PersonalizedItem *personalizedItem;

  personalizedItem = self->_personalizedItem;
  if (personalizedItem)
    personalizedItem = (PersonalizedItem *)objc_claimAutoreleasedReturnValue(-[PersonalizedItem searchDotPlace](personalizedItem, "searchDotPlace"));
  return (SearchDotPlace *)personalizedItem;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_loadWeakRetained((id *)&self->source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->source, a3);
}

- (unint64_t)sortOrder
{
  return self->sortOrder;
}

- (void)setSortOrder:(unint64_t)a3
{
  self->sortOrder = a3;
}

- (BOOL)isParent
{
  return self->_parent;
}

- (void)setParent:(BOOL)a3
{
  self->_parent = a3;
}

- (BOOL)isChild
{
  return self->_child;
}

- (void)setChild:(BOOL)a3
{
  self->_child = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_personalizedItem, 0);
}

@end

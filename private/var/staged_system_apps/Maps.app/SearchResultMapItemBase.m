@implementation SearchResultMapItemBase

- (SearchResultMapItemBase)init
{

  return 0;
}

- (SearchResultMapItemBase)initWithSearchResult:(id)a3
{
  id v5;
  SearchResultMapItemBase *v6;
  SearchResultMapItemBase *v7;
  uint64_t v8;
  PersonalizedItemKey *key;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchResultMapItemBase;
  v6 = -[SearchResultMapItemBase init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchResult, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personalizedItemKey"));
    key = v7->_key;
    v7->_key = (PersonalizedItemKey *)v8;

    v7->_shouldBeHiddenFromMap = 0;
  }

  return v7;
}

- (NSSet)keys
{
  void *v2;

  if (self->_key)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  return (NSSet *)v2;
}

- (unint64_t)priority
{
  return 4;
}

- (CLLocationCoordinate2D)coordinate
{
  _BOOL4 v3;
  SearchResult *searchResult;
  double v5;
  double v6;
  CLLocationCoordinate2D v7;
  CLLocationCoordinate2D result;

  -[SearchResult labelCoordinate](self->_searchResult, "labelCoordinate");
  v3 = CLLocationCoordinate2DIsValid(v7);
  searchResult = self->_searchResult;
  if (v3)
    -[SearchResult labelCoordinate](searchResult, "labelCoordinate");
  else
    -[SearchResult coordinate](searchResult, "coordinate");
  result.longitude = v6;
  result.latitude = v5;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_enhancedPlacement"));

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)labelGeometry
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_labelGeometry"));

  return (GEOLabelGeometry *)v3;
}

- (MKMapItem)mapItem
{
  return -[SearchResult mapItem](self->_searchResult, "mapItem");
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](self->_searchResult, "title"));
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
  return (PersonalizedItemStyleAttributesAdornment *)+[PersonalizedItemStyleAttributesAdornment defaultAdornment](PersonalizedItemStyleAttributesAdornment, "defaultAdornment");
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  return (PersonalizedItemClientFeatureIDAdornment *)+[PersonalizedItemClientFeatureIDAdornment defaultAdornment](PersonalizedItemClientFeatureIDAdornment, "defaultAdornment");
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 1;
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
  return -[SearchResult address](self->_searchResult, "address");
}

- (NSArray)searchableStrings
{
  return 0;
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
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

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

- (int64_t)preferredDisplayedSearchResultType
{
  return self->_preferredDisplayedSearchResultType;
}

- (void)setPreferredDisplayedSearchResultType:(int64_t)a3
{
  self->_preferredDisplayedSearchResultType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_key, 0);
}

@end

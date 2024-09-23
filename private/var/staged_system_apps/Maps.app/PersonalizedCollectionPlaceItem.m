@implementation PersonalizedCollectionPlaceItem

- (PersonalizedCollectionPlaceItem)initWithMapItem:(id)a3 title:(id)a4 libraryBadgeType:(unint64_t)a5
{
  id v9;
  id v10;
  PersonalizedCollectionPlaceItem *v11;
  PersonalizedCollectionPlaceItem *v12;
  NSString *v13;
  NSString *title;
  void *v15;
  PersonalizedMapItemKey *v16;
  id v17;
  PersonalizedMapItemMUIDKey *v18;
  NSSet *v19;
  NSSet *keys;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PersonalizedCollectionPlaceItem;
  v11 = -[PersonalizedCollectionPlaceItem init](&v22, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mapItem, a3);
    if (v10)
      v13 = (NSString *)v10;
    else
      v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](v12->_mapItem, "name"));
    title = v12->_title;
    v12->_title = v13;

    v12->_libraryBadgeType = a5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v16 = -[PersonalizedMapItemKey initWithMapItem:]([PersonalizedMapItemKey alloc], "initWithMapItem:", v9);
    if (v16)
      objc_msgSend(v15, "addObject:", v16);
    v17 = objc_msgSend(v9, "_muid");
    if (v17)
    {
      v18 = -[PersonalizedMapItemMUIDKey initWithMUID:]([PersonalizedMapItemMUIDKey alloc], "initWithMUID:", v17);
      if (v18)
        objc_msgSend(v15, "addObject:", v18);

    }
    v19 = (NSSet *)objc_msgSend(v15, "copy");
    keys = v12->_keys;
    v12->_keys = v19;

  }
  return v12;
}

- (unint64_t)priority
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)-[MKMapItem _enhancedPlacement](self->_mapItem, "_enhancedPlacement");
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)-[MKMapItem _labelGeometry](self->_mapItem, "_labelGeometry");
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", self->_title, 5);
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
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t libraryBadgeType;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _styleAttributes](self->_mapItem, "_styleAttributes"));
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "hasAttributes") & 1) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));

    v4 = (void *)v5;
  }
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    if (self->_libraryBadgeType <= 1)
      libraryBadgeType = 1;
    else
      libraryBadgeType = self->_libraryBadgeType;
  }
  else
  {
    libraryBadgeType = 1;
  }
  v11[0] = &off_10126C820;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", libraryBadgeType));
  v11[1] = &off_10126C838;
  v12[0] = v7;
  v12[1] = &off_10126C850;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v4, v8));

  return (PersonalizedItemStyleAttributesAdornment *)v9;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCollectionPlaceItem styleAttributes](self, "styleAttributes"));
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
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shows
{
  return 1;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (BOOL)needsToPreserveSelection
{
  return 1;
}

- (NSDate)eventDate
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
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
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<PersonalizedCollectionPlaceItem %p: %@>"), self, v3));

  return (NSString *)v4;
}

- (NSSet)keys
{
  return self->_keys;
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

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_autocompletionStrings, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
}

- (id)autocompleteObject
{
  SearchResult *searchResult;
  SearchResult *v4;
  SearchResult *v5;

  searchResult = self->_searchResult;
  if (!searchResult)
  {
    v4 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", self->_mapItem);
    v5 = self->_searchResult;
    self->_searchResult = v4;

    searchResult = self->_searchResult;
  }
  return searchResult;
}

- (int64_t)sourceType
{
  return 3;
}

- (int64_t)sourceSubtype
{
  return 1;
}

- (BOOL)hasPriorityOverride
{
  return 0;
}

- (int64_t)priorityOverride
{
  return 0;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return 0;
}

- (BOOL)hidden
{
  return 0;
}

- (NSArray)autocompletionStrings
{
  NSArray *autocompletionStrings;
  PersonalizedCollectionPlaceItem *v4;
  void *v5;
  AutocompleteStringMatcher *v6;
  NSArray *v7;
  NSArray *v8;
  AutocompleteStringMatcher *v10;

  autocompletionStrings = self->_autocompletionStrings;
  if (!autocompletionStrings)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_autocompletionStrings)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 1));
      v6 = -[AutocompleteStringMatcher initWithPlaceName:matchInfo:]([AutocompleteStringMatcher alloc], "initWithPlaceName:matchInfo:", v4->_title, v5);
      v10 = v6;
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      v8 = self->_autocompletionStrings;
      self->_autocompletionStrings = v7;

    }
    objc_sync_exit(v4);

    autocompletionStrings = self->_autocompletionStrings;
  }
  return autocompletionStrings;
}

- (BOOL)hasServerItemIndex
{
  return 0;
}

- (unint64_t)serverSectionIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)serverItemIndexInSection
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 0;
}

- (id)leafPersonalizedAutocompleteItems
{
  PersonalizedCollectionPlaceItem *v3;

  v3 = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

@end

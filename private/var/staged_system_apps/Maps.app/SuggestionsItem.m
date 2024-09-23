@implementation SuggestionsItem

- (SuggestionsItem)initWithSuggestion:(id)a3 order:(unsigned __int16)a4 sourceType:(int64_t)a5 sourceSubtype:(int64_t)a6 hasPriorityOverride:(BOOL)a7 priorityOverride:(int64_t)a8
{
  id v15;
  void *v16;
  SuggestionsItem *v17;
  SuggestionsItem *v18;
  PersonalizedMapItemKey *v19;
  uint64_t v20;
  NSSet *keys;
  MapsLocationOfInterest *v22;
  MapsLocationOfInterest *v23;
  MKMapItem *v24;
  SuggestionsItem *v25;
  MKMapItem *mapItem;
  void *v27;
  uint64_t v28;
  NSSet *v29;
  void *v30;
  _QWORD v32[4];
  SuggestionsItem *v33;
  objc_super v34;

  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "MKMapItem"));
  if (v16)
  {
    v34.receiver = self;
    v34.super_class = (Class)SuggestionsItem;
    v17 = -[SuggestionsItem init](&v34, "init");
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_suggestion, a3);
      v18->_order = a4;
      v18->_sourceType = a5;
      v18->_sourceSubtype = a6;
      v18->_hasPriorityOverride = a7;
      v18->_priorityOverride = a8;
      v19 = -[PersonalizedMapItemKey initWithMapItem:]([PersonalizedMapItemKey alloc], "initWithMapItem:", v16);
      v20 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v19));
      keys = v18->_keys;
      v18->_keys = (NSSet *)v20;

      v22 = -[MapsLocationOfInterest initWithMapsSuggestionEntry:]([MapsLocationOfInterest alloc], "initWithMapsSuggestionEntry:", v15);
      v23 = v22;
      if (v22)
        v24 = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest mapItem](v22, "mapItem"));
      else
        v24 = v16;
      mapItem = v18->_mapItem;
      v18->_mapItem = v24;

      if (objc_msgSend(v15, "type") == (id)7)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCar personalizedItemKey](ParkedCar, "personalizedItemKey"));
        v28 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v27));
        v29 = v18->_keys;
        v18->_keys = (NSSet *)v28;

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100291F2C;
        v32[3] = &unk_1011AEEE8;
        v33 = v18;
        objc_msgSend(v30, "fetchParkedCar:", v32);

      }
    }
    self = v18;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (unint64_t)priority
{
  return 1;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return 0;
}

- (BOOL)hidden
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

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (SearchResult)searchResult
{
  MapsLocationOfInterest *v3;
  SearchResult *v4;
  SearchResult *v5;
  void *v6;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;

  if (-[MapsSuggestionsEntry type](self->_suggestion, "type") == (id)24
    && -[MapsSuggestionsEntry containsKey:](self->_suggestion, "containsKey:", CFSTR("MapsSuggestionsContactLikelyAppleIDKey")))
  {
    v3 = (MapsLocationOfInterest *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry findMyWaypoint](self->_suggestion, "findMyWaypoint"));
    if (!v3)
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315906;
        v14 = "-[SuggestionsItem searchResult]";
        v15 = 2080;
        v16 = "SuggestionsItemSource.m";
        v17 = 1024;
        v18 = 143;
        v19 = 2080;
        v20 = "findMyWaypoint != nil";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v13, 0x26u);
      }

      if (sub_100A70734())
      {
        v10 = sub_1004318FC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v13 = 138412290;
          v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);

        }
      }
    }
    v4 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v3);
  }
  else
  {
    v3 = -[MapsLocationOfInterest initWithMapsSuggestionEntry:]([MapsLocationOfInterest alloc], "initWithMapsSuggestionEntry:", self->_suggestion);
    if (v3)
    {
      v5 = [SearchResult alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest mapItem](v3, "mapItem"));
      v4 = -[SearchResult initWithMapItem:](v5, "initWithMapItem:", v6);

      -[SearchResult setLocationOfInterest:](v4, "setLocationOfInterest:", v3);
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (id)suggestion
{
  return self->_suggestion;
}

- (AddressBookAddress)address
{
  return 0;
}

- (unint64_t)sortOrder
{
  return self->_order;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry poiTitle](self->_suggestion, "poiTitle"));
  v4 = -[MapsSuggestionsEntry type](self->_suggestion, "type");
  if (v4 == (id)1)
  {
    v5 = 901;
  }
  else if (v4 == (id)2)
  {
    v5 = 1001;
  }
  else
  {
    v5 = 900;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v3, v5));

  return (PersonalizedItemPrioritizedStringAdornment *)v6;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment");
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (unint64_t)-[MapsSuggestionsEntry type](self->_suggestion, "type");
  if (v3 > 0x18)
  {
    v6 = 0;
LABEL_8:
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v6, 700));

    return (PersonalizedItemPrioritizedStringAdornment *)v4;
  }
  if (((1 << v3) & 0x17E9EF7) == 0)
  {
    if (((1 << v3) & 0x814100) != 0)
      v5 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry undecoratedSubtitle](self->_suggestion, "undecoratedSubtitle"));
    else
      v5 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry stringForKey:](self->_suggestion, "stringForKey:", CFSTR("MapsSuggestionsCalendarPersonalizedPOIAdornmentKey")));
    v6 = (void *)v5;
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  return (PersonalizedItemPrioritizedStringAdornment *)v4;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unsigned int v11;
  int v12;
  uint64_t v13;
  _UNKNOWN **v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _UNKNOWN **v20;
  _UNKNOWN **v21;
  MapsSuggestionsEntry *suggestion;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry styleAttributes](self->_suggestion, "styleAttributes"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  suggestion = self->_suggestion;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &suggestion, 1));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10029256C;
  v15[3] = &unk_1011AEF50;
  v15[4] = &v16;
  MapsSuggestionsShortcutSplit(v4, 0, &stru_1011AEF28, v15);

  v20 = &off_10126C898;
  v21 = &off_10126C8B0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (unint64_t)-[MapsSuggestionsEntry type](self->_suggestion, "type");
  v8 = v7;
  if (v7 > 5 || ((1 << v7) & 0x26) == 0)
  {
    v11 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v12 = *((unsigned __int8 *)v17 + 24);
    if (*((_BYTE *)v17 + 24))
    {
      if (v11)
        v13 = 3;
      else
        v13 = 0;
      v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
    }
    else
    {
      v14 = &off_10126C8C8;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, &off_10126C8E0);
    if (v12)

    if (v8 == 3)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10126C8B0, &off_10126C8F8);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10126C8B0, &off_10126C910);
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v3, v6));

  _Block_object_dispose(&v16, 8);
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsItem styleAttributes](self, "styleAttributes"));
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

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)shouldBeHiddenFromMap
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return (char *)-[MapsSuggestionsEntry type](self->_suggestion, "type") - 3 < (char *)0xFFFFFFFFFFFFFFFELL;
}

- (NSDate)eventDate
{
  return (NSDate *)-[MapsSuggestionsEntry dateForKey:](self->_suggestion, "dateForKey:", CFSTR("MapsSuggestionsScheduledTimeKey"));
}

- (NSArray)searchableStrings
{
  return 0;
}

- (id)autocompleteObject
{
  return self->_suggestion;
}

- (NSArray)autocompletionStrings
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  AutocompleteStringMatcher *v7;
  void *v8;
  AutocompleteStringMatcher *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry undecoratedTitle](self->_suggestion, "undecoratedTitle"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    if (-[MapsSuggestionsEntry type](self->_suggestion, "type") == (id)3)
      v5 = 16;
    else
      v5 = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", v5));
    v7 = -[AutocompleteStringMatcher initWithString:requiredMatchLength:matchInfo:]([AutocompleteStringMatcher alloc], "initWithString:requiredMatchLength:matchInfo:", v4, 1, v6);
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return (NSArray *)v8;
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
  SuggestionsItem *v3;

  v3 = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (int64_t)suggestionType
{
  return (int64_t)-[MapsSuggestionsEntry type](self->_suggestion, "type");
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (BOOL)hasPriorityOverride
{
  return self->_hasPriorityOverride;
}

- (int64_t)priorityOverride
{
  return self->_priorityOverride;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_loadWeakRetained((id *)&self->source);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->source, a3);
}

- (ParkedCar)parkedCar
{
  return self->parkedCar;
}

- (void)setParkedCar:(id)a3
{
  objc_storeStrong((id *)&self->parkedCar, a3);
}

- (NSSet)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->parkedCar, 0);
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end

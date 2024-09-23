@implementation CalendarItemSourceMapItem

- (CalendarItemSourceMapItem)init
{

  return 0;
}

- (CalendarItemSourceMapItem)initWithCalendarItem:(id)a3 mapItem:(id)a4
{
  id v7;
  id v8;
  CalendarItemSourceMapItem *v9;
  CalendarItemSourceMapItem *v10;
  id *p_calendarItem;
  PersonalizedMapItemKey *v12;
  PersonalizedItemKey *key;
  void *v14;
  unsigned int v15;
  EKCalendarItem *v16;
  EKCalendarItem *calendarItem;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id *p_title;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  NSString *v38;
  NSString *v39;
  NSString *subtitle;
  id v42;
  objc_super v43;

  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)CalendarItemSourceMapItem;
  v9 = -[CalendarItemSourceMapItem init](&v43, "init");
  v10 = v9;
  if (!v9)
    goto LABEL_25;
  v42 = v7;
  p_calendarItem = (id *)&v9->_calendarItem;
  objc_storeStrong((id *)&v9->_calendarItem, a3);
  objc_storeStrong((id *)&v10->_mapItem, a4);
  v12 = -[PersonalizedMapItemKey initWithMapItem:]([PersonalizedMapItemKey alloc], "initWithMapItem:", v8);
  key = v10->_key;
  v10->_key = (PersonalizedItemKey *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  v15 = objc_msgSend(v8, "_hasMUID");
  v16 = v10->_calendarItem;
  calendarItem = v10->_calendarItem;
  v18 = objc_opt_class(EKEvent);
  if ((objc_opt_isKindOfClass(calendarItem, v18) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarItem title](v16, "title"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CalendarItemSource sharedDateFormatter](CalendarItemSource, "sharedDateFormatter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarItem startDate](v16, "startDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringFromDate:", v21));

  }
  else
  {
    v22 = 0;
    v19 = 0;
  }
  v23 = *p_calendarItem;
  v24 = *p_calendarItem;
  v25 = objc_opt_class(EKReminder);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
  {
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "title"));

    v19 = (void *)v26;
  }
  p_title = (id *)&v10->_title;
  if (!v15)
  {
    objc_storeStrong(p_title, v19);
    v30 = v14;
    if (objc_msgSend(v30, "length"))
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\b%@\b"), v30));
    else
      v31 = v30;
    v32 = v31;

    v33 = v22;
    if (objc_msgSend(v33, "length"))
      goto LABEL_17;
LABEL_18:
    v34 = v33;
    goto LABEL_19;
  }
  objc_storeStrong(p_title, v14);
  v28 = v19;
  if (objc_msgSend(v28, "length"))
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\b%@\b"), v28));
  else
    v29 = v28;
  v32 = v29;

  v33 = v22;
  if (!objc_msgSend(v33, "length"))
    goto LABEL_18;
LABEL_17:
  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\b%@\b"), v33));
LABEL_19:
  v35 = v34;

  v36 = v32;
  v37 = v35;
  if (objc_msgSend(v36, "length"))
  {
    if (objc_msgSend(v37, "length"))
      v38 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v36, v37));
    else
      v38 = (NSString *)v36;
  }
  else
  {
    v38 = (NSString *)v37;
  }
  v39 = v38;

  subtitle = v10->_subtitle;
  v10->_subtitle = v39;

  v7 = v42;
LABEL_25:

  return v10;
}

- (NSSet)keys
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", self->_key);
}

- (unint64_t)priority
{
  return 2;
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

- (unint64_t)sortOrder
{
  return 0;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment");
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  void *v3;

  if (-[NSString length](self->_title, "length"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", self->_title, 800));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  void *v3;

  if (-[NSString length](self->_subtitle, "length"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", self->_subtitle, 800));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  void *v3;
  EKCalendarItem *v4;
  EKCalendarItem *calendarItem;
  uint64_t v6;
  EKCalendarItem *v7;
  EKCalendarItem *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_10126FCE8, &off_10126FD00);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_10126FCE8, &off_10126FD18);
  v4 = self->_calendarItem;
  calendarItem = self->_calendarItem;
  v6 = objc_opt_class(EKEvent);
  if ((objc_opt_isKindOfClass(calendarItem, v6) & 1) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_10126FCE8, &off_10126FD30);
  v7 = self->_calendarItem;
  v8 = self->_calendarItem;
  v9 = objc_opt_class(EKReminder);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &off_10126FD48, &off_10126FD30);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MKMapItem _styleAttributes](self->_mapItem, "_styleAttributes"));
  if (!v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[MKMapItem place](self->_mapItem, "place"));
    v12 = (void *)v11;
    if (byte_1014D3B39)
    {
      v13 = 223;
      if (!v11)
        goto LABEL_16;
    }
    else
    {
      v13 = 353;
      if (v4)
      {
        if (!v11)
        {
LABEL_16:
          NSLog(CFSTR("We have a search result that has no style attributes and is not a 'place'. What is it? How should we display it?"));
          v10 = 0;
          goto LABEL_17;
        }
      }
      else
      {
        if (v7)
          v13 = 353;
        else
          v13 = 348;
        if (!v11)
          goto LABEL_16;
      }
    }
    v10 = objc_msgSend(objc_alloc((Class)GEOFeatureStyleAttributes), "initWithAttributes:", 4, 226, 5, 3, 6, v13, 10, 0, 0);
LABEL_17:

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v10, v3));

  return (PersonalizedItemStyleAttributesAdornment *)v14;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarItemSourceMapItem styleAttributes](self, "styleAttributes"));
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
  return 1;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (NSDate)eventDate
{
  EKCalendarItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self->_calendarItem;
  v3 = objc_opt_class(EKEvent);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = objc_claimAutoreleasedReturnValue(-[EKCalendarItem startDate](v2, "startDate"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v5 = (void *)v4;

  return (NSDate *)v5;
}

- (SearchResult)searchResult
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

- (int64_t)sourceType
{
  return 2;
}

- (int64_t)sourceSubtype
{
  return 0;
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AutocompleteStringMatcher *v7;
  void *v8;
  void *v9;
  void *v10;
  AutocompleteStringMatcher *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarItemSourceMapItem title](self, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 1));
    v7 = -[AutocompleteStringMatcher initWithString:requiredMatchLength:matchInfo:]([AutocompleteStringMatcher alloc], "initWithString:requiredMatchLength:matchInfo:", v5, 1, v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarItemSourceMapItem subtitle](self, "subtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));

  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 4));
    v11 = -[AutocompleteStringMatcher initWithString:requiredMatchLength:matchInfo:]([AutocompleteStringMatcher alloc], "initWithString:requiredMatchLength:matchInfo:", v9, 3, v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  return (NSArray *)v3;
}

- (id)autocompleteObject
{
  return -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", self->_mapItem);
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
  CalendarItemSourceMapItem *v3;

  v3 = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
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

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_calendarItem, 0);
}

@end

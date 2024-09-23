@implementation DroppedPinMapItem

- (DroppedPinMapItem)initWithSearchResult:(id)a3
{
  id v4;
  DroppedPinMapItem *v5;
  DroppedPinMapItemKey *v6;
  DroppedPinMapItemKey *v7;
  DroppedPinMapItemKey *droppedPinKey;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DroppedPinMapItem;
  v5 = -[SearchResultMapItemBase initWithSearchResult:](&v10, "initWithSearchResult:", v4);
  if (v5)
  {
    v6 = [DroppedPinMapItemKey alloc];
    objc_msgSend(v4, "coordinate");
    v7 = -[DroppedPinMapItemKey initWithCoordinate:](v6, "initWithCoordinate:");
    droppedPinKey = v5->_droppedPinKey;
    v5->_droppedPinKey = v7;

  }
  return v5;
}

- (id)keys
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", self->_droppedPinKey);
}

- (id)title
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  v4 = objc_msgSend(v3, "isReverseGeocoded");

  if (!v4)
  {
    v7 = 0;
LABEL_6:
    v8 = objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_addressFormattedAsName"));

  if (!v7 || !objc_msgSend(v7, "length"))
    goto LABEL_6;
  v8 = objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v7, 1));
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

- (id)styleAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _UNKNOWN **v6;
  _UNKNOWN **v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
  v6 = &off_1012700F0;
  v7 = &off_1012700D8;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v2, v3));

  return v4;
}

- (id)clientFeatureID
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  long double v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DroppedPinMapItem styleAttributes](self, "styleAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "styleAttributes"));
  v5 = (int)objc_msgSend(v4, "poiType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
  objc_msgSend(v6, "_coordinate");
  v8 = -v7;
  if (v7 >= 0.0)
    v8 = v7;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = fmod(v9, 1.84467441e19);
  v12 = 2654435761u * (unint64_t)v11;
  v13 = v12 + (unint64_t)v10;
  if (v10 <= 0.0)
    v13 = 2654435761u * (unint64_t)v11;
  v14 = v12 - (unint64_t)fabs(v10);
  if (v10 >= 0.0)
    v14 = v13;
  v15 = v14 ^ v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
  objc_msgSend(v16, "_coordinate");
  if (v17 < 0.0)
    v17 = -v17;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = fmod(v18, 1.84467441e19);
  v21 = 2654435761u * (unint64_t)v20;
  v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0)
    v22 = 2654435761u * (unint64_t)v20;
  v23 = v21 - (unint64_t)fabs(v19);
  if (v19 >= 0.0)
    v23 = v22;
  v24 = v15 ^ v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_geoMapItem"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "name"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_geoMapItem"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
    v24 ^= (unint64_t)objc_msgSend(v30, "hash");

  }
  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:](PersonalizedItemClientFeatureIDAdornment, "adornmentWithClientFeatureID:", v24);
}

- (int64_t)sourceType
{
  return 3;
}

- (int64_t)sourceSubtype
{
  return 2;
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
  DroppedPinMapItem *v4;
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD v15[4];
  id v16;

  autocompletionStrings = self->_autocompletionStrings;
  if (!autocompletionStrings)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_autocompletionStrings)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1009CA618;
      v15[3] = &unk_1011DE7E0;
      v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v16 = v5;
      v6 = objc_retainBlock(v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](v4, "searchResult"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      ((void (*)(_QWORD *, void *, uint64_t, uint64_t))v6[2])(v6, v8, 1, 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](v4, "searchResult"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_addressFormattedAsName"));
      ((void (*)(_QWORD *, void *, uint64_t, uint64_t))v6[2])(v6, v11, 3, 4);

      v12 = (NSArray *)objc_msgSend(v5, "copy");
      v13 = self->_autocompletionStrings;
      self->_autocompletionStrings = v12;

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
  DroppedPinMapItem *v3;

  v3 = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedPinKey, 0);
  objc_storeStrong((id *)&self->_autocompletionStrings, 0);
}

@end

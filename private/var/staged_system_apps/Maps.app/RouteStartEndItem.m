@implementation RouteStartEndItem

- (RouteStartEndItem)init
{

  return 0;
}

- (RouteStartEndItem)initWithSearchResult:(id)a3
{

  return 0;
}

- (RouteStartEndItem)initWithSearchResult:(id)a3 routeFeatureType:(int)a4
{
  RouteStartEndItem *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteStartEndItem;
  result = -[SearchResultMapItemBase initWithSearchResult:](&v6, "initWithSearchResult:", a3);
  if (result)
    result->_routeFeatureType = a4;
  return result;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStartEndItem title](self, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p %@ %@>"), v3, self, v4, v5));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  RouteStartEndItem *v4;
  uint64_t v5;
  RouteStartEndItem *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (RouteStartEndItem *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](v6, "searchResult"));
      if (objc_msgSend(v7, "isEqual:", v8))
        v9 = self->_routeFeatureType == v6->_routeFeatureType;
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)title
{
  PersonalizedItemPrioritizedStringAdornment *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RouteStartEndItem;
  v2 = -[SearchResultMapItemBase title](&v15, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1003128A8;
  v13 = sub_1003128B8;
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003128C0;
  v8[3] = &unk_1011B1600;
  v8[4] = &v9;
  objc_msgSend(v4, "enumerateLinesUsingBlock:", v8);

  if (objc_msgSend((id)v10[5], "length"))
    v5 = (id)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v10[5], (char *)objc_msgSend(v3, "priority") + 1));
  else
    v5 = v3;
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)styleAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForSearchResult:](GEOFeatureStyleAttributes, "styleAttributesForSearchResult:", v3));

  v9[0] = &off_10126CBF8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_routeFeatureType));
  v9[1] = &off_10126CC10;
  v10[0] = v5;
  v10[1] = &off_10126CC28;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v4, v6));
  return v7;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStartEndItem styleAttributes](self, "styleAttributes"));
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

- (BOOL)isRouteStartOrEnd
{
  return 1;
}

- (id)enhancedPlacement
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_enhancedPlacement"));

  return v4;
}

- (BOOL)shouldBeHiddenFromMap
{
  return self->_shouldBeHiddenFromMap;
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  self->_shouldBeHiddenFromMap = a3;
}

@end

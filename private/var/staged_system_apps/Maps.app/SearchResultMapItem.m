@implementation SearchResultMapItem

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PersonalizedItemPrioritizedStringAdornment *v24;
  objc_super v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v3, "locationType") == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("Contact's Home [SearchResultMapItem]");
LABEL_16:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v20));

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v21, 1));
      return v22;
    }
  }
  else
  {

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v9, "locationType") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "autocompletePerson"));

    if (v11)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("Contact's Work [SearchResultMapItem]");
      goto LABEL_16;
    }
  }
  else
  {

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v12, "locationType") == 3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "autocompletePerson"));

    if (v14)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("Contact's School [SearchResultMapItem]");
      goto LABEL_16;
    }
  }
  else
  {

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v15, "locationType") == 4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "autocompletePerson"));

    if (v17)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("Contact's Location [SearchResultMapItem]");
      goto LABEL_16;
    }
  }
  else
  {

  }
  v25.receiver = self;
  v25.super_class = (Class)SearchResultMapItem;
  v24 = -[SearchResultMapItemBase title](&v25, "title");
  return (id)objc_claimAutoreleasedReturnValue(v24);
}

- (id)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressValue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact _mapkit_sharedLocationContactIdentifer](CNContact, "_mapkit_sharedLocationContactIdentifer"));
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "autocompletePerson"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "locationTimestampString:", 1));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "label"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", v11));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "capitalizedString"));
    }
    v14 = (void *)v13;

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem createSubtitle](self, "createSubtitle"));
  }
  if (v14)
    v15 = objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment adornmentWithString:priority:](PersonalizedItemPrioritizedStringAdornment, "adornmentWithString:priority:", v14, 100));
  else
    v15 = objc_claimAutoreleasedReturnValue(+[PersonalizedItemPrioritizedStringAdornment defaultAdornment](PersonalizedItemPrioritizedStringAdornment, "defaultAdornment"));
  v16 = (void *)v15;

  return v16;
}

- (id)createSubtitle
{
  int IsEnabled_RealTimeEVCharger;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  IsEnabled_RealTimeEVCharger = MapsFeature_IsEnabled_RealTimeEVCharger(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  v6 = v5;
  if (IsEnabled_RealTimeEVCharger)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
    v8 = objc_msgSend(v7, "_hasEVCharger");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_realTimeAvailableEVCharger"));

      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[EVChargerUtility realTimeEVChargerDisplayStringWithEvCharger:mapDisplay:](_TtC4Maps16EVChargerUtility, "realTimeEVChargerDisplayStringWithEvCharger:mapDisplay:", v4, 1));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem styleAttributes](self, "styleAttributes"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleAttributes"));
      objc_msgSend(v14, "poiType");

      v11 = &stru_1011EB268;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_firstLocalizedCategoryName"));
    v13 = v12;
    if (v12)
    {
      v11 = v12;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subtitle"));

    }
  }

  return v11;
}

- (id)style
{
  GEOFeatureStyleAttributes *style;
  void *v4;
  GEOFeatureStyleAttributes *v5;
  GEOFeatureStyleAttributes *v6;

  style = self->_style;
  if (!style)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v5 = (GEOFeatureStyleAttributes *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForSearchResult:](GEOFeatureStyleAttributes, "styleAttributesForSearchResult:", v4));
    v6 = self->_style;
    self->_style = v5;

    style = self->_style;
  }
  return style;
}

- (id)styleAttributes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _UNKNOWN **v37;
  void *v38;
  _UNKNOWN **v39;
  _UNKNOWN **v40;
  _QWORD v41[4];
  _QWORD v42[4];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v41[0] = &off_1012700C0;
  v41[1] = &off_1012700F0;
  v42[0] = &off_1012700D8;
  v42[1] = &off_1012700D8;
  v41[2] = &off_101270108;
  v41[3] = &off_101270120;
  v42[2] = &off_1012700D8;
  v42[3] = &off_1012700D8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 4));
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  if (GEOConfigGetBOOL(GeoServicesConfig_VenuesInjectVenueGoInsideStyleAttribute[0], GeoServicesConfig_VenuesInjectVenueGoInsideStyleAttribute[1]))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
    if (objc_msgSend(v5, "_venueFeatureType") == (id)1)
    {

LABEL_5:
      v39 = &off_101270138;
      v40 = &off_1012700D8;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      objc_msgSend(v3, "addEntriesFromDictionary:", v8);

      goto LABEL_6;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
    v7 = objc_msgSend(v6, "_venueFeatureType");

    if (v7 == (id)2)
      goto LABEL_5;
  }
LABEL_6:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem style](self, "style"));
  if (MapsFeature_IsEnabled_RealTimeEVCharger(v9, v10)
    && objc_msgSend(v9, "poiType") == 335)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase mapItem](self, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_realTimeAvailableEVCharger"));

    v13 = +[EVChargerUtility realTimeEVChargerStatusWithEvCharger:](_TtC4Maps16EVChargerUtility, "realTimeEVChargerStatusWithEvCharger:", v12);
    if (v13 > 2)
      v14 = 0;
    else
      v14 = dword_100E3CDDC[v13];
    v37 = &off_101270150;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
    v38 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    objc_msgSend(v3, "addEntriesFromDictionary:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v17, "locationType") == 1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "autocompletePerson"));

    if (v19)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
LABEL_33:
      v31 = (id)v20;
      v35 = objc_msgSend(v3, "copy");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v31, v35));

      goto LABEL_34;
    }
  }
  else
  {

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v21, "locationType") == 2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "autocompletePerson"));

    if (v23)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
      goto LABEL_33;
    }
  }
  else
  {

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v24, "locationType") == 3)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "autocompletePerson"));

    if (v26)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
      goto LABEL_33;
    }
  }
  else
  {

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v27, "locationType") == 4)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "autocompletePerson"));

    if (v29)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes sharedLocationStyleAttributes](GEOFeatureStyleAttributes, "sharedLocationStyleAttributes"));
      goto LABEL_33;
    }
  }
  else
  {

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
  if (objc_msgSend(v30, "locationType"))
  {

  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase searchResult](self, "searchResult"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "autocompletePerson"));

    if (v34)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes addressMarkerStyleAttributes](GEOFeatureStyleAttributes, "addressMarkerStyleAttributes"));
      goto LABEL_33;
    }
  }
  v31 = objc_msgSend(v3, "copy");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:additionalAttributes:](PersonalizedItemStyleAttributesAdornment, "adornmentWithStyleAttributes:additionalAttributes:", v9, v31));
LABEL_34:

  return v32;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem styleAttributes](self, "styleAttributes"));
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

- (BOOL)shouldBeClustered
{
  return 1;
}

- (BOOL)showsBalloonCallout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem style](self, "style"));
  v3 = objc_msgSend(v2, "isLabelPOI");

  return v3 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end

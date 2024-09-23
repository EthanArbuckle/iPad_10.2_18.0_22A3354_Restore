@implementation MKMapItem

- (PersonalizedCompoundItem)personalizedCompoundItem
{
  id AssociatedObject;
  void *v3;
  void *v4;

  AssociatedObject = objc_getAssociatedObject(self, &off_1014A5AA0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "item"));

  return (PersonalizedCompoundItem *)v4;
}

- (void)setPersonalizedCompoundItem:(id)a3
{
  id v4;
  _WeakPersonalizedCompoundItem *value;

  if (a3)
  {
    v4 = a3;
    value = objc_alloc_init(_WeakPersonalizedCompoundItem);
    -[_WeakPersonalizedCompoundItem setItem:](value, "setItem:", v4);

  }
  else
  {
    value = 0;
  }
  objc_setAssociatedObject(self, &off_1014A5AA0, value, (void *)1);

}

- (void)updateModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self, "name"));
  objc_msgSend(v8, "setFirstLine:", v4);

  if ((-[MKMapItem _hasUserRatingScore](self, "_hasUserRatingScore") & 1) != 0)
  {
    -[MKMapItem _normalizedUserRatingScore](self, "_normalizedUserRatingScore");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v8, "setRating:", v5);

  }
  else
  {
    objc_msgSend(v8, "setRating:", 0);
  }
  if ((-[MKMapItem _hasChargerNumberString](self, "_hasChargerNumberString") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _chargerNumberString](self, "_chargerNumberString"));
    objc_msgSend(v8, "setChargerNumberString:", v6);

  }
  else
  {
    objc_msgSend(v8, "setChargerNumberString:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _car_addressFormattedAsStreetOnly](self, "_car_addressFormattedAsStreetOnly"));
  objc_msgSend(v8, "setSecondLine:", v7);

  objc_msgSend(v8, "setMapItem:", self);
  objc_msgSend(v8, "setDebugSubtitle:", CFSTR("[MapItem]"));

}

- (id)_car_addressFormattedAsStreetOnly
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _addressFormattedAsStreetOnly](self, "_addressFormattedAsStreetOnly"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MKMapItem _addressFormattedAsName](self, "_addressFormattedAsName"));
  v6 = v5;

  return v6;
}

- (id)_maps_externalDeviceDictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  CLLocationDegrees v11;
  double v12;
  CLLocationDegrees v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSNumber *v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _BYTE v49[128];
  _QWORD v50[2];
  CLLocationCoordinate2D v51;
  CLLocationCoordinate2D v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self, "name"));
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DisplayName"));
  v5 = objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark")),
        objc_msgSend(v7, "coordinate"),
        v8 = CLLocationCoordinate2DIsValid(v51),
        v7,
        v6,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    objc_msgSend(v9, "coordinate");
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[MKMapItem _coordinate](self, "_coordinate");
    v11 = v14;
    v13 = v15;
  }
  v52.latitude = v11;
  v52.longitude = v13;
  if (CLLocationCoordinate2DIsValid(v52))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    objc_msgSend(v16, "coordinate");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v50[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    objc_msgSend(v18, "coordinate");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
    v50[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("CenterCoordinate"));
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoAddress](self, "_geoAddress"));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "formattedAddressLines"));
  if (v22)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("Address"));
  v43 = v3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem place](self, "place", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "entryPoints"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v24, "count")));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v26 = v24;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v31, "lat");
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v48[0] = v32;
        objc_msgSend(v31, "lng");
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v48[1] = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
        objc_msgSend(v25, "addObject:", v34);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v28);
  }

  objc_msgSend(v43, "setObject:forKeyedSubscript:", v25, CFSTR("EntryPoints"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", NSLocaleLanguageCode));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v36, CFSTR("Locale"));
  v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", GEOConfigGetDouble(MapsConfig_CarPlayDestinationSharing, off_1014B2F48));
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v38, CFSTR("CoordinateThreshold"));

  v39 = objc_msgSend(v43, "copy");
  return v39;
}

- (id)notificationDisplayName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locality"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      objc_msgSend(v3, "addObject:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "locality"));
      objc_msgSend(v3, "addObject:", v12);

      goto LABEL_14;
    }
  }
  else
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "thoroughfare"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "thoroughfare"));
    objc_msgSend(v3, "addObject:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "locality"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "locality"));
    objc_msgSend(v3, "addObject:", v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "administrativeArea"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "administrativeArea"));
    objc_msgSend(v3, "addObject:", v28);

  }
  objc_msgSend(v3, "trimToLength:", 2);
LABEL_14:
  if (!objc_msgSend(v3, "count"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Unknown Location [Report an Issue notification]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v3, "addObject:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",\n")));

  return v31;
}

- (NSArray)venueAreaIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VenueAreaIdentifier *v17;
  VenueAreaIdentifier *v18;
  void *v19;
  id v20;
  void *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  VenueAreaIdentifier *v29;
  _BYTE v30[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_venueInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueIdentifier"));
  if (v4)
  {
    v22 = v3;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v4;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentIdentifiers"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "floorInfo"));

          if (v11)
          {
            if (objc_msgSend(v10, "_hasBuildingID"))
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "buildingID")));
            else
              v12 = 0;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "floorInfo"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "levelID")));

            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "floorInfo"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v15, "ordinal")));

            v17 = -[VenueAreaIdentifier initWithVenueID:buildingID:levelID:floorOrdinal:]([VenueAreaIdentifier alloc], "initWithVenueID:buildingID:levelID:floorOrdinal:", objc_msgSend(v24, "venueID"), v12, v14, v16);
            v18 = v17;
            if (v7)
            {
              objc_msgSend(v7, "addObject:", v17);
            }
            else
            {
              v29 = v17;
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
              v7 = objc_msgSend(v19, "mutableCopy");

            }
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v20 = objc_msgSend(v7, "copy");
    v3 = v22;
    v4 = v24;
  }
  else
  {
    v7 = 0;
    v20 = 0;
  }

  return (NSArray *)v20;
}

- (BOOL)_maps_isVenueOrBuilding
{
  unint64_t v2;

  v2 = (unint64_t)-[MKMapItem _venueFeatureType](self, "_venueFeatureType");
  return (v2 > 4) | (6u >> v2) & 1;
}

- (BOOL)_maps_isIncompleteVenueSearchResult
{
  return -[MKMapItem _responseStatusIsIncomplete](self, "_responseStatusIsIncomplete");
}

- (BOOL)_maps_isLargeAreaPlace
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem place](self, "place"));
  v3 = objc_msgSend(v2, "type");

  return (v3 < 0x3E) & (0x2001580000010016uLL >> v3);
}

- (BOOL)_maps_isEVChargingStation
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_poiCategory"));
  v4 = objc_msgSend(v3, "isEqual:", GEOPOICategoryEVCharger);

  return v4;
}

- (id)_maps_placeTitleWithDefaultTitle:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem place](self, "place"));
  v6 = objc_msgSend(v5, "type");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem place](self, "place"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "structuredAddress"));

  if (v6 == 43)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subLocality"));
    goto LABEL_5;
  }
  if (v6 == 16)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[MKMapItem _addressFormattedAsCity](self, "_addressFormattedAsCity"));
LABEL_5:
    v11 = (void *)v10;
    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:
  if (objc_msgSend(v11, "length"))
    v12 = v11;
  else
    v12 = v4;
  v13 = v12;

  return v13;
}

- (id)_maps_placeAreaNameWithDefaultName:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem place](self, "place"));
  v6 = objc_msgSend(v5, "type");
  v7 = 0;
  if (v6 <= 0x2B)
  {
    if (((1 << v6) & 0x80000010010) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _maps_stateAndCountry](self, "_maps_stateAndCountry"));
    }
    else if (((1 << v6) & 6) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "structuredAddress"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "country"));

      if (!objc_msgSend(v7, "length"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "structuredAddress"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "countryCode"));

        v7 = (void *)v12;
      }
    }
  }
  if (objc_msgSend(v7, "length"))
    v13 = v7;
  else
    v13 = v4;
  v14 = v13;

  return v14;
}

- (id)_maps_stateAndCountry
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  const __CFLocale *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem place](self, "place"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "structuredAddress"));

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "administrativeArea"));
  if (!objc_msgSend(v6, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "administrativeAreaCode"));

    v6 = (void *)v7;
  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("State"));
  if (!qword_1014D2C68)
  {
    v8 = CFLocaleCopyCurrent();
    v9 = objc_msgSend((id)CFLocaleGetValue(v8, kCFLocaleCountryCode), "lowercaseString");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)qword_1014D2C68;
    qword_1014D2C68 = v10;

    CFRelease(v8);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));

  if ((objc_msgSend(v13, "isEqualToString:", qword_1014D2C68) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "country"));
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("Country"));

  }
  v15 = MKAddressStringForAddressDictionary(v5, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (id)_maps_detourTextForIdiom:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _detourInfo](self, "_detourInfo"));
  objc_msgSend(v5, "detourTime");
  v6 = 60.0;
  if (v7 > 60.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _detourInfo](self, "_detourInfo"));
    objc_msgSend(v8, "detourTime");
    v6 = v9;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _detourInfo](self, "_detourInfo"));

  if (v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _maps_detourTextForIdiom:travelTime:](self, "_maps_detourTextForIdiom:travelTime:", a3, v6));
  else
    v11 = 0;
  return v11;
}

- (id)_maps_detourTextForIdiom:(int64_t)a3 travelTime:(double)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForExpectedTravelTime:dateUnitStyle:](NSString, "_navigation_stringForExpectedTravelTime:dateUnitStyle:", 2, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Adds %@"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4));

  return v7;
}

- (id)_maps_distanceStringFromDetourInformation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _detourInfo](self, "_detourInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _detourInfo](self, "_detourInfo"));
    objc_msgSend(v4, "distanceToPlace");
    v6 = v5;

    if (v6 <= 50.0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Less than %@"), CFSTR("localized string not found"), 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0, 50.0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0, v6));
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSUUID)locationOfInterestIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_clientAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routineAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loiIdentifier"));

  return (NSUUID *)v5;
}

+ (id)_maps_markerImageForMapItem:(id)a3 scale:(double)a4 size:(unint64_t)a5 useMarkerFallback:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;

  v6 = a6;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForMapItem:size:forScale:format:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:size:forScale:format:fallbackToBundleIcon:", v9, a5, 0, 0, a4));
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_styleAttributesForMapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v11, a5, 0, a4));

    if (v10)
      v12 = 1;
    else
      v12 = !v6;
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v13, a5, 0, a4));

    }
    if (!v10 && v6)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Pin-Circle")));
  }

  return v10;
}

- (id)_maps_styleAttributesForMapItem
{
  void *v3;

  if (-[MKMapItem _maps_isParkedCar](self, "_maps_isParkedCar"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
  }
  else if (-[MKMapItem _maps_isHome](self, "_maps_isHome"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
  }
  else if (-[MKMapItem _maps_isWork](self, "_maps_isWork"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
  }
  else if (-[MKMapItem _maps_isSchool](self, "_maps_isSchool"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _styleAttributes](self, "_styleAttributes"));
  }
  return v3;
}

- (BOOL)_maps_isHomeWorkOrSchool
{
  if (-[MKMapItem _maps_isHome](self, "_maps_isHome") || -[MKMapItem _maps_isWork](self, "_maps_isWork"))
    return 1;
  else
    return -[MKMapItem _maps_isSchool](self, "_maps_isSchool");
}

- (BOOL)_maps_isHome
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_clientAttributes"));

  if (!v4)
    goto LABEL_13;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressBookAttributes"));
  v6 = objc_msgSend(v5, "isMe");
  if (!v6
    || (v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressBookAttributes")),
        objc_msgSend(v2, "addressType") != 1))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineAttributes"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineAttributes"));
      v10 = objc_msgSend(v9, "loiType");

      if ((v6 & 1) != 0)
      if (v10 == 1)
        goto LABEL_9;
    }
    else
    {
      if (v6)

    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }

LABEL_9:
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_maps_isWork
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_clientAttributes"));

  if (!v4)
    goto LABEL_13;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressBookAttributes"));
  v6 = objc_msgSend(v5, "isMe");
  if (!v6
    || (v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressBookAttributes")),
        objc_msgSend(v2, "addressType") != 2))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineAttributes"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineAttributes"));
      v10 = objc_msgSend(v9, "loiType");

      if ((v6 & 1) != 0)
      if (v10 == 2)
        goto LABEL_9;
    }
    else
    {
      if (v6)

    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }

LABEL_9:
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_maps_isSchool
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_clientAttributes"));

  if (!v4)
    goto LABEL_13;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressBookAttributes"));
  v6 = objc_msgSend(v5, "isMe");
  if (!v6
    || (v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addressBookAttributes")),
        objc_msgSend(v2, "addressType") != 3))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineAttributes"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineAttributes"));
      v10 = objc_msgSend(v9, "loiType");

      if ((v6 & 1) != 0)
      if (v10 == 3)
        goto LABEL_9;
    }
    else
    {
      if (v6)

    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }

LABEL_9:
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_maps_isParkedCar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char IsEqualToMapItemForPurpose;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parkedCar"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
    IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose(v6, v7, 1);

  }
  else
  {
    IsEqualToMapItemForPurpose = 0;
  }

  return IsEqualToMapItemForPurpose;
}

- (BOOL)_maps_canAddToCollections
{
  void *v4;
  unsigned __int8 v5;

  if (-[MKMapItem _hasMUID](self, "_hasMUID") && -[MKMapItem _muid](self, "_muid"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _styleAttributes](self, "_styleAttributes"));
  v5 = objc_msgSend(v4, "isLabelPOI");

  return v5 ^ 1;
}

- (BOOL)_maps_canRenameCollectionItem
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _styleAttributes](self, "_styleAttributes"));
  v4 = objc_msgSend(v3, "isLabelPOI");

  if ((v4 & 1) != 0)
    return 0;
  if ((-[MKMapItem _isMapItemTypeAddress](self, "_isMapItemTypeAddress") & 1) != 0
    || (-[MKMapItem _isMapItemTypeSettlement](self, "_isMapItemTypeSettlement") & 1) != 0)
  {
    return 1;
  }
  return -[MKMapItem _isMapItemTypeUnknown](self, "_isMapItemTypeUnknown");
}

- (id)_maps_defaultCollectionItemTitle
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _styleAttributes](self, "_styleAttributes"));
  v4 = objc_msgSend(v3, "isLabelPOI");

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _addressFormattedAsName](self, "_addressFormattedAsName"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self, "name"));
  return v5;
}

- (id)_maps_intentsRestaurant
{
  INRestaurant *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_new(INRestaurant);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _restaurantLink_firstVendorID](self, "_restaurantLink_firstVendorID"));
  -[INRestaurant setVendorIdentifier:](v3, "setVendorIdentifier:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _restaurantLink_firstProviderPlaceIdentifier](self, "_restaurantLink_firstProviderPlaceIdentifier"));
  -[INRestaurant setRestaurantIdentifier:](v3, "setRestaurantIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self, "name"));
  -[INRestaurant setName:](v3, "setName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
  -[INRestaurant setLocation:](v3, "setLocation:", v8);

  return v3;
}

- (BOOL)needsAdditionalNavData
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  void *v13;
  id v14;
  char v15;
  BOOL v16;
  char v17;
  char v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem place](self, "place"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "structuredAddress"));

  if ((objc_msgSend(v5, "hasSubThoroughfare") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "hasFullThoroughfare");
  if (-[MKMapItem _hasMUID](self, "_hasMUID"))
    v7 = objc_msgSend(v3, "hasSpokenName") ^ 1;
  else
    LOBYTE(v7) = 0;
  -[MKMapItem _coordinate](self, "_coordinate");
  v9 = v8;
  v11 = v10;
  if (v6)
  {
    v12 = objc_msgSend(v3, "hasSpokenAddress") ^ 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryPoints"));
    v14 = objc_msgSend(v13, "count");

    if (v14)
      v15 = v12;
    else
      v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  v16 = v11 < -180.0;
  if (v11 > 180.0)
    v16 = 1;
  v17 = v7 | v16;
  if (v9 < -90.0)
    v17 = 1;
  if (v9 > 90.0)
    v17 = 1;
  v18 = v17 | v15;

  return v18;
}

+ (id)searchResultsForMapItems:(id)a3
{
  return +[MKMapItem searchResultsForMapItems:options:](MKMapItem, "searchResultsForMapItems:options:", a3, 0);
}

+ (id)searchResultsForMapItems:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  SearchResult *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    v25 = MKLaunchOptionsURLKey;
    v11 = MKLaunchOptionsReferralIdentifierKey;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isCurrentLocation", v25))
        {
          v14 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
          if (v14)
            goto LABEL_15;
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addressObject"));

          v17 = v13;
          if (v16)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "addressForAddressObject:", v16));

            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geocodedMapItem"));

              if (v20)
              {
                v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geocodedMapItem"));

                v17 = (id)v21;
              }
            }

          }
          v14 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v17);
          -[SearchResult setOriginatedFromExternal:](v14, "setOriginatedFromExternal:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v25));
          -[SearchResult setSourceURL:](v14, "setSourceURL:", v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11));
          -[SearchResult setSourceApplication:](v14, "setSourceApplication:", v23);

          if (v14)
LABEL_15:
            objc_msgSend(v7, "addObject:", v14);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  return v7;
}

- (CLLocationCoordinate2D)closeUpViewCoordinate
{
  double v3;
  CLLocationDegrees latitude;
  double v5;
  CLLocationDegrees longitude;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  double v14;
  double v15;
  _OWORD v16[2];
  uint64_t v17;
  CLLocationCoordinate2D result;

  -[MKMapItem _coordinate](self, "_coordinate");
  latitude = v3;
  longitude = v5;
  if (-[MKMapItem _hasLookAroundStorefront](self, "_hasLookAroundStorefront"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self, "_geoMapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_storefrontPresentationInfo"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "closeUpView"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "lookAt");
    }
    else
    {
      v17 = 0;
      memset(v16, 0, sizeof(v16));
    }
    v11 = GEOLocationCoordinate2DFromOrientedPosition(v16);
    v13 = CLLocationCoordinate2DMake(v11, v12);
    latitude = v13.latitude;
    longitude = v13.longitude;

  }
  v14 = latitude;
  v15 = longitude;
  result.longitude = v15;
  result.latitude = v14;
  return result;
}

+ (id)carMapItemFromDestination:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v9;
  id v10;
  MapsLocationOfInterest *v11;
  uint64_t v12;
  MapsLocationOfInterest *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  __objc2_prot *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  id v28;

  v3 = a3;
  v4 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v6 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
      goto LABEL_5;
    }
    v9 = objc_opt_class(MapsSuggestionsEntry);
    if ((objc_opt_isKindOfClass(v3, v9) & 1) != 0)
    {
      v10 = v3;
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "MKMapItem"));

      if (v7)
      {
        v11 = -[MapsLocationOfInterest initWithMapsSuggestionEntry:]([MapsLocationOfInterest alloc], "initWithMapsSuggestionEntry:", v10);
LABEL_13:
        v13 = v11;
        v7 = (id)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest mapItem](v11, "mapItem"));
LABEL_14:

      }
    }
    else
    {
      v12 = objc_opt_class(_TtC4Maps16MapsFavoriteItem);
      if ((objc_opt_isKindOfClass(v3, v12) & 1) == 0)
      {
        v14 = objc_opt_class(AddressBookAddress);
        if ((objc_opt_isKindOfClass(v3, v14) & 1) != 0)
        {
          v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geocodedMapItem"));
          goto LABEL_5;
        }
        v15 = objc_opt_class(GEOComposedWaypoint);
        if ((objc_opt_isKindOfClass(v3, v15) & 1) != 0)
        {
          v16 = v3;
          v17 = objc_alloc((Class)MKMapItem);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geoMapItem"));

          v7 = objc_msgSend(v17, "initWithGeoMapItem:isPlaceHolderPlace:", v18, 0);
          goto LABEL_6;
        }
        if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOMapItem))
        {
          v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v3, 0);
          goto LABEL_5;
        }
        v19 = v3;
        v20 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
        v21 = objc_opt_class(HistoryEntryRecentsItem);
        v10 = v19;
        if ((objc_opt_isKindOfClass(v10, v21) & 1) != 0)
          v22 = v10;
        else
          v22 = 0;
        v23 = v22;

        if (v23
          && (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "historyEntry")),
              v25 = objc_msgSend(v24, "conformsToProtocol:", v20),
              v24,
              v25))
        {
          v13 = (MapsLocationOfInterest *)v10;
        }
        else
        {
          v13 = 0;
        }

        if (v13)
        {
          v28 = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLocationOfInterest historyEntry](v13, "historyEntry"));
          +[SearchResult newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:](SearchResult, "newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:", 0, &v28, v26);
          v27 = v28;

          v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
        }
        else
        {
          v7 = 0;
        }
        goto LABEL_14;
      }
      v10 = v3;
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mkMapItem"));

      if (v7)
      {
        v11 = -[MapsLocationOfInterest initWithMapsFavoriteItem:]([MapsLocationOfInterest alloc], "initWithMapsFavoriteItem:", v10);
        goto LABEL_13;
      }
    }

    goto LABEL_6;
  }
  v5 = v3;
LABEL_5:
  v7 = v5;
LABEL_6:

  return v7;
}

- (id)_maps_diffableDataSourceIdentifier
{
  __CFString *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  if (-[MKMapItem isCurrentLocation](self, "isCurrentLocation"))
  {
    v3 = CFSTR("CurrentLocation");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _identifier](self, "_identifier"));
    v5 = v4;
    if (v4)
    {
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_diffableDataSourceIdentifier"));
    }
    else
    {
      -[MKMapItem _coordinate](self, "_coordinate");
      v3 = 0;
      if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&v6, *(_QWORD *)&v7));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MarkedLocation(%@)"), v8));

      }
    }

  }
  return v3;
}

- (id)_flyoverAnnouncementMessageWithDefaultTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _flyoverAnnouncementMessage](self, "_flyoverAnnouncementMessage"));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("3D Flyover Tour"), CFSTR("localized string not found"), 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v7, v4));

  }
  return v5;
}

@end

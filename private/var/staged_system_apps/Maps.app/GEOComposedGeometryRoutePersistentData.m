@implementation GEOComposedGeometryRoutePersistentData

- (MapDataSubscriptionInfo)_maps_existingOfflineSubscription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData boundingMapRegion](self, "boundingMapRegion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:](GEOMapRegion, "_maps_offlineCoverageRegionForRouteBounds:", v2));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionInfoForRegion:", v3));

  }
  else
  {
    v5 = 0;
  }

  return (MapDataSubscriptionInfo *)v5;
}

- (void)prepareForSaving
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData anchorPoints](self, "anchorPoints", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isCurrentLocation"))
          objc_msgSend(v7, "setIsCurrentLocation:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)titleString
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData userProvidedName](self, "userProvidedName"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData userProvidedName](self, "userProvidedName"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData routeName](self, "routeName"));
    v6 = (void *)v5;
    v7 = &stru_1011EB268;
    if (v5)
      v7 = (__CFString *)v5;
    v4 = v7;

  }
  return v4;
}

- (id)addressString
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;

  if (-[GEOComposedGeometryRoutePersistentData isAvailableForCurrentCountry](self, "isAvailableForCurrentCountry"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData address](self, "address"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cityAndAboveNoCurrentCountryWithFallback:", 1));
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData address](self, "address"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v9 = (void *)v8;
      v10 = &stru_1011EB268;
      if (v8)
        v10 = (__CFString *)v8;
      v6 = v10;

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)distanceAndElevationString
{
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;

  -[GEOComposedGeometryRoutePersistentData distance](self, "distance");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData elevationProfile](self, "elevationProfile"));
  v6 = sub_10090091C(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)addressStringWithAttributes:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v4 = a3;
  if (-[GEOComposedGeometryRoutePersistentData isAvailableForCurrentCountry](self, "isAvailableForCurrentCountry"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData address](self, "address"));
    if (v5)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cityAndAboveNoCurrentCountryWithFallback:", 1));
      v8 = v7;
      if (v7)
        v9 = v7;
      else
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      v11 = v9;

      v10 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v11, v6);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)distanceAndElevationDescriptionStringWithAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSTextAttachment *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  NSAttributedString *v25;
  id v26;
  void *v27;
  id v28;
  NSAttributedString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;

  v4 = a3;
  -[GEOComposedGeometryRoutePersistentData distance](self, "distance");
  v6 = v5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData elevationProfile](self, "elevationProfile"));
  v8 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSForegroundColorAttributeName));
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v12 = v11;

  v13 = objc_opt_new(NSTextAttachment);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("base.unit")));
  v34 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithTintColor:", v12));
  -[NSTextAttachment setImage:](v13, "setImage:", v15);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:attributes:](NSAttributedString, "attributedStringWithAttachment:attributes:", v13, v8));
  v16 = GEOStringForDistance(1, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v17);
  if (objc_msgSend(v7, "isValid"))
  {
    v19 = sub_100900338(v7, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

    v23 = objc_alloc((Class)NSAttributedString);
    if (v22 == (id)1)
    {
      v24 = objc_msgSend(v23, "initWithString:attributes:", CFSTR("%@ • %@ %@"), v8);
      v25 = +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v24, v20, v18, v35);
    }
    else
    {
      v24 = objc_msgSend(v23, "initWithString:attributes:", CFSTR("%@ %@ • %@"), v8);
      v25 = +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v24, v35, v18, v20);
    }
    v26 = (id)objc_claimAutoreleasedReturnValue(v25);

    v36 = v26;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v30, 0));
    v32 = v34;
  }
  else
  {
    v26 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("%@ %@"), v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v28 = objc_msgSend(v27, "userInterfaceLayoutDirection");

    if (v28 == (id)1)
      v29 = +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v26, v18, v35);
    else
      v29 = +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v26, v35, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v32 = v34;
    v36 = v20;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v30, 0));
  }

  return v31;
}

- (id)distanceStringWithAttributes:(id)a3
{
  id v4;
  double v5;
  id v6;
  void *v7;

  v4 = a3;
  -[GEOComposedGeometryRoutePersistentData distance](self, "distance");
  v6 = sub_1009005D8(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

@end

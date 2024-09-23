@implementation RouteOverviewStringProvider

+ (id)primaryTextForRoute:(id)a3 font:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  NSAttributedStringKey v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previewDurationString"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previewDurationString"));
    v13 = NSFontAttributeName;
    v14 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100BA1DEC;
    v11[3] = &unk_1011E7930;
    v12 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:argumentOverrideHandler:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:argumentOverrideHandler:", v8, v9, v11));

  }
  return v7;
}

+ (id)secondaryMultiPartTextForRoute:(id)a3 font:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v29;
  NSAttributedStringKey v30;
  id v31;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  if (!objc_msgSend(v5, "transportType"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeAttributes"));
    v9 = objc_msgSend(v8, "hasTimepoint");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeAttributes", 0));
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "timepoint");
      else
        v29 = 0;

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "planningDistanceString", v29));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "planningDistanceString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "optionsWithArgumentHandler:", &stru_1011E7950));
    objc_msgSend(v14, "setShouldUpdateFormatStrings:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "composedStringWithOptions:", v14));
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "planningDistanceString"));
    v18 = v17;

    objc_msgSend(v7, "addObject:", v18);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "planningDescriptionString"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "planningDescriptionString"));
    objc_msgSend(v7, "addObject:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "planningSeparatorString"));
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Route description [separator]"), CFSTR("localized string not found"), 0));

  }
  v25 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v23);
  v30 = NSFontAttributeName;
  v31 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString _mapkit_multiPartAttributedStringForComposedStrings:defaultAttributes:repeatedSeparator:](MKMultiPartAttributedString, "_mapkit_multiPartAttributedStringForComposedStrings:defaultAttributes:repeatedSeparator:", v7, v26, v25));

  return v27;
}

+ (id)artworkDataForRoute:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "adjustedTransportTypeForRoute:", v4) == (id)4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routePlanningArtworks"));
  else
    v5 = 0;

  return v5;
}

+ (unint64_t)adjustedTransportTypeForRoute:(id)a3
{
  id v3;
  unsigned int v4;
  unint64_t v5;
  unsigned int v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "transportType");
  if (v4 > 5)
    v5 = 1;
  else
    v5 = qword_100E3F170[v4];
  v6 = objc_msgSend(v3, "isWalkingOnlyTransitRoute");

  if (v6)
    return 4;
  else
    return v5;
}

@end

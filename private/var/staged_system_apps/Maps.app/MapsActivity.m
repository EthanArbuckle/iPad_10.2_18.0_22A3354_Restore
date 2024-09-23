@implementation MapsActivity

- (id)mapsSiriAction
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  MapsSiriAction *v32;
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];

  v3 = -[MapsActivity type](self, "type");
  if (v3 == 1)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[MapsActivity searchString](self, "searchString"));
    v15 = (void *)v14;
    v16 = &stru_1011EB268;
    if (v14)
      v16 = (__CFString *)v14;
    v7 = v16;

    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[GEOMapURLBuilder URLForSearch:](GEOMapURLBuilder, "URLForSearch:", v7));
    if (!-[__CFString length](v7, "length"))
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_23;
    }
    v36[0] = CFSTR("MapsActionKey");
    v36[1] = CFSTR("MapsActionSearchStringKey");
    v37[0] = CFSTR("MapsSearchActionKey");
    v37[1] = v7;
    v36[2] = CFSTR("MapsActionLaunchURLKey");
    v37[2] = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("SearchActionTitleFor");
LABEL_13:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));

    v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v17, v7);
    goto LABEL_21;
  }
  if (v3 != 4)
  {
    if (v3 != 3)
    {
      v10 = 0;
      v9 = 0;
LABEL_27:
      v32 = 0;
      goto LABEL_28;
    }
    v4 = objc_claimAutoreleasedReturnValue(-[MapsActivity destinationString](self, "destinationString"));
    v5 = (void *)v4;
    v6 = &stru_1011EB268;
    if (v4)
      v6 = (__CFString *)v4;
    v7 = v6;

    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MapsActivity _destinationDirectionsURL](self, "_destinationDirectionsURL"));
    v9 = 0;
    if (!-[__CFString length](v7, "length") || !v8)
    {
      v10 = 0;
      goto LABEL_23;
    }
    v38[0] = CFSTR("MapsActionKey");
    v38[1] = CFSTR("MapsActionDestinationStringKey");
    v39[0] = CFSTR("MapsDirectionsActionKey");
    v39[1] = v7;
    v38[2] = CFSTR("MapsActionLaunchURLKey");
    v39[2] = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = v11;
    v13 = CFSTR("DirectionsActionTitleFor");
    goto LABEL_13;
  }
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MapsActivity presentedMapItem](self, "presentedMapItem"));
  if (-[MapsActivity hasSelectedPlaceIndex](self, "hasSelectedPlaceIndex"))
  {
    v19 = -[MapsActivity selectedPlaceIndex](self, "selectedPlaceIndex");
    if (v19 < -[MapsActivity searchPlacesCount](self, "searchPlacesCount"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity searchPlaces](self, "searchPlaces"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", -[MapsActivity selectedPlaceIndex](self, "selectedPlaceIndex")));

      v7 = (__CFString *)v21;
    }
  }
  v22 = objc_claimAutoreleasedReturnValue(-[__CFString name](v7, "name"));
  v23 = (void *)v22;
  v24 = &stru_1011EB268;
  if (v22)
    v24 = (__CFString *)v22;
  v8 = v24;

  v25 = -[__CFString _muid](v7, "_muid");
  v26 = -[__CFString _resultProviderID](v7, "_resultProviderID");
  -[__CFString coordinate](v7, "coordinate");
  v28 = v27;
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString shortAddress](v7, "shortAddress"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapURLBuilder URLForInternalBusiness:id:provider:coordinate:address:](GEOMapURLBuilder, "URLForInternalBusiness:id:provider:coordinate:address:", v8, v25, v26, v31, v28, v30));

  if (!-[__CFString length](v8, "length"))
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_22;
  }
  v34[0] = CFSTR("MapsActionKey");
  v34[1] = CFSTR("MapsActionMapItemNameKey");
  v35[0] = CFSTR("MapsMapItemActionKey");
  v35[1] = v8;
  v34[2] = CFSTR("MapsActionLaunchURLKey");
  v35[2] = v17;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 3));
  v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v8);
LABEL_21:
  v9 = v18;
LABEL_22:

LABEL_23:
  if (!v9 || !objc_msgSend(v10, "count"))
    goto LABEL_27;
  v32 = -[MapsSiriAction initWithTitle:userInfo:]([MapsSiriAction alloc], "initWithTitle:userInfo:", v9, v10);
LABEL_28:

  return v32;
}

- (int64_t)type
{
  unint64_t v4;

  if (-[MapsActivity hasPresentedMapItem](self, "hasPresentedMapItem"))
    return 4;
  if (-[MapsActivity hasSelectedPlaceIndex](self, "hasSelectedPlaceIndex"))
  {
    v4 = -[MapsActivity selectedPlaceIndex](self, "selectedPlaceIndex");
    if (v4 < -[MapsActivity searchPlacesCount](self, "searchPlacesCount"))
      return 4;
  }
  if (-[MapsActivity hasDirectionsPlan](self, "hasDirectionsPlan"))
    return 3;
  if (-[MapsActivity hasSearchCategoryStorage](self, "hasSearchCategoryStorage"))
    return 2;
  if (-[MapsActivity hasSearchString](self, "hasSearchString"))
    return 1;
  if (-[MapsActivity hasDroppedPin](self, "hasDroppedPin"))
    return 5;
  return 0;
}

- (id)destinationString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationString"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeRequestStorage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waypoints"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_destinationDirectionsURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity destinationString](self, "destinationString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortAddress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destinationString"));

  if (objc_msgSend(v9, "length"))
    v12 = v9;
  else
    v12 = v11;
  v13 = v12;
  if (objc_msgSend(v13, "length"))
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapURLBuilder URLForDirectionsFromHereTo:label:muid:provider:transport:](GEOMapURLBuilder, "URLForDirectionsFromHereTo:label:muid:provider:transport:", v13, v3, objc_msgSend(v8, "_muid"), objc_msgSend(v8, "_resultProviderID"), 4));
  else
    v14 = 0;

  return v14;
}

- (id)categoryString
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (-[MapsActivity hasSearchCategoryStorage](self, "hasSearchCategoryStorage"))
  {
    v3 = objc_alloc((Class)GEOSearchCategory);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity searchCategoryStorage](self, "searchCategoryStorage"));
    v5 = objc_msgSend(v3, "initWithStorage:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "popularTokenString"));
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayString"));
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (void)brandMapsActivityFromUserActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("MKPlaceBrandUserActivity"));

  if (v8)
  {
    v9 = objc_opt_class(NSDictionary);
    v10 = objc_opt_class(NSString);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, objc_opt_class(NSNumber), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MKPlaceBrandUserActivityData")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v12, v14, 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MKPlaceBrandUserActivityID")));
    v17 = objc_msgSend(v16, "longLongValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ticketForSearchPoisForBrandMUID:traits:", v17, 0));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100870980;
    v21[3] = &unk_1011ADA50;
    v22 = v15;
    v23 = v6;
    v20 = v15;
    objc_msgSend(v19, "submitWithHandler:networkActivity:", v21, &stru_1011D9A28);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (BOOL)shouldIndex
{
  if (-[MapsActivity hasDirectionsPlan](self, "hasDirectionsPlan")
    || -[MapsActivity hasSearchCategoryStorage](self, "hasSearchCategoryStorage")
    || -[MapsActivity hasSearchString](self, "hasSearchString")
    || -[MapsActivity hasPresentedMapItem](self, "hasPresentedMapItem"))
  {
    return 1;
  }
  else
  {
    return -[MapsActivity hasDroppedPin](self, "hasDroppedPin");
  }
}

- (NSString)name
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  _QWORD v84[5];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;

  if (!-[MapsActivity hasPresentedMapItem](self, "hasPresentedMapItem"))
  {
    if (!-[MapsActivity hasSelectedPlaceIndex](self, "hasSelectedPlaceIndex")
      || (v3 = -[MapsActivity selectedPlaceIndex](self, "selectedPlaceIndex"),
          v3 >= -[MapsActivity searchPlacesCount](self, "searchPlacesCount")))
    {
      if (-[MapsActivity hasDirectionsPlan](self, "hasDirectionsPlan"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originString"));

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destinationString"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routeRequestStorage"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "waypoints"));
        v15 = objc_msgSend(v14, "count");

        v18 = MKLocalizedStringForCurrentLocation(v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (v9 && !v11 && v15)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "routeRequestStorage"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "waypoints"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

          if ((objc_msgSend(v23, "isCurrentLocation") & 1) != 0)
          {
            v11 = v19;
            goto LABEL_71;
          }
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geoMapItem"));
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
        }
        else
        {
          if (!v11 || v9 || !v15)
          {
            if ((unint64_t)v15 < 2)
            {
              if (v15 != (id)1)
              {
LABEL_72:
                v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("%@\nDirection from %@"), CFSTR("localized string not found"), 0));
                v27 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v82, v11, v9));

                return (NSString *)v27;
              }
              v64 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "routeRequestStorage"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "waypoints"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "firstObject"));

              if ((objc_msgSend(v23, "isCurrentLocation") & 1) != 0)
              {
                v67 = v19;
              }
              else
              {
                v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geoMapItem"));
                v67 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "name"));

                v11 = v79;
              }

              v80 = v19;
              v11 = v67;
              v9 = v80;
            }
            else
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "routeRequestStorage"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "waypoints"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstObject"));

              if ((objc_msgSend(v51, "isCurrentLocation") & 1) != 0)
              {
                v52 = v9;
                v9 = v19;
              }
              else
              {
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "geoMapItem"));
                v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "name"));

                v9 = (id)v73;
              }

              v74 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "routeRequestStorage"));
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "waypoints"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "lastObject"));

              if ((objc_msgSend(v23, "isCurrentLocation") & 1) != 0)
              {
                v77 = v19;
              }
              else
              {
                v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geoMapItem"));
                v77 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "name"));

                v11 = v78;
              }

              v11 = v77;
            }
LABEL_71:

            goto LABEL_72;
          }
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "routeRequestStorage"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "waypoints"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));

          if ((objc_msgSend(v23, "isCurrentLocation") & 1) != 0)
          {
            v9 = v19;
            goto LABEL_71;
          }
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geoMapItem"));
          v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
        }

        goto LABEL_71;
      }
      if (!-[MapsActivity hasSearchCategoryStorage](self, "hasSearchCategoryStorage")
        && !-[MapsActivity hasSearchString](self, "hasSearchString"))
      {
LABEL_47:
        if (-[MapsActivity hasDroppedPin](self, "hasDroppedPin"))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "customSearchResult"));

          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapItem"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "_addressFormattedAsShortenedAddress"));

          v60 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
          if (v59)
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v62 = v61;
            if (v60)
              v63 = CFSTR("Marked Location at %@");
            else
              v63 = CFSTR("Dropped Pin on %@");
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", v63, CFSTR("localized string not found"), 0));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapItem"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "_addressFormattedAsShortenedAddress"));
            v27 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v70, v72));

          }
          else
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v62 = v68;
            if (v60)
              v69 = CFSTR("Marked Location");
            else
              v69 = CFSTR("Dropped Pin");
            v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedStringForKey:value:table:", v69, CFSTR("localized string not found"), 0));
          }

        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Maps"), CFSTR("localized string not found"), 0));
        }
        goto LABEL_25;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "searchFieldItem"));
      v85 = 0;
      v86 = &v85;
      v87 = 0x3032000000;
      v88 = sub_100871624;
      v89 = sub_100871634;
      v90 = 0;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "historyItem"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "historyEntry"));
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_10087163C;
      v84[3] = &unk_1011BF258;
      v84[4] = &v85;
      objc_msgSend(v36, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v84, 0, 0, 0);

      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currentResults"));
      v37 = objc_msgSend(v27, "count");

      if (-[MapsActivity hasSearchCategoryStorage](self, "hasSearchCategoryStorage"))
      {
        v38 = objc_alloc((Class)GEOSearchCategory);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity searchCategoryStorage](self, "searchCategoryStorage"));
        v27 = objc_msgSend(v38, "initWithStorage:", v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "popularTokenString"));
        v41 = v40;
        if (v40)
          v42 = v40;
        else
          v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "displayString"));
        v46 = v42;

        if (!v37)
          goto LABEL_42;
      }
      else
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity searchString](self, "searchString"));
        v37 = -[MapsActivity searchPlacesCount](self, "searchPlacesCount");
        if (!v37)
          goto LABEL_42;
      }
      if (objc_msgSend((id)v86[5], "length"))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Title_for_search_in_maps_history"), CFSTR("localized string not found"), 0));

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v54, v37, v86[5]));
        v27 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v46, v55));

        goto LABEL_44;
      }
LABEL_42:
      if (!v46)
      {
        v56 = 1;
LABEL_46:

        _Block_object_dispose(&v85, 8);
        if ((v56 & 1) == 0)
          return (NSString *)v27;
        goto LABEL_47;
      }
      v27 = v46;
LABEL_44:
      v56 = 0;
      goto LABEL_46;
    }
  }
  if (!-[MapsActivity hasPresentedMapItem](self, "hasPresentedMapItem"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity searchPlaces](self, "searchPlaces"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", -[MapsActivity selectedPlaceIndex](self, "selectedPlaceIndex")));

    v7 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v6, 0);
    goto LABEL_14;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity presentedMapItem](self, "presentedMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForSerializedMapItemStorage:](GEOMapItemStorage, "mapItemStorageForSerializedMapItemStorage:", v5));

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v6));
LABEL_14:
    v25 = v7;
    goto LABEL_15;
  }
  v25 = 0;
LABEL_15:

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Maps"), CFSTR("localized string not found"), 0));

  if (v25)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_addressFormattedAsCity"));
    if (objc_msgSend(v28, "length"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("History_Directions_Title"), CFSTR("localized string not found"), 0));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
      v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v31, v28));

      v27 = v29;
    }
    else
    {
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
    }

    v27 = (id)v32;
  }
LABEL_25:

  return (NSString *)v27;
}

- (MapsActivity)initWithBzip2CompressedData:(id)a3
{
  void *v4;
  MapsActivity *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bzip2UncompressedData"));
  if (v4)
  {
    self = -[MapsActivity initWithData:](self, "initWithData:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSData)bzip2CompressedData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity data](self, "data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bzip2CompressedData"));

  return (NSData *)v3;
}

- (NSData)bzip2DataByIterativelyReducingIfNeeded
{
  MapsActivity *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity bzip2CompressedData](v2, "bzip2CompressedData"));
  if ((unint64_t)objc_msgSend(v3, "length") <= 0x2328)
  {
    v9 = v3;
  }
  else
  {
    v4 = -[MapsActivity copy](v2, "copy");
    while (1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchPlaces"));
      v6 = objc_msgSend(v5, "count");

      if (!v6)
        break;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchPlaces"));
      objc_msgSend(v7, "removeLastObject");

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bzip2CompressedData"));
      v3 = v8;
      if ((unint64_t)objc_msgSend(v8, "length") <= 0x2328)
        goto LABEL_8;
    }
    v8 = v3;
LABEL_8:
    v9 = v8;

  }
  objc_sync_exit(v2);

  return (NSData *)v9;
}

- (BOOL)affectsMapType
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](self, "displayOptions"));
  if ((objc_msgSend(v3, "hasMapType") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](self, "displayOptions"));
    if ((objc_msgSend(v5, "hasTransportType") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](self, "directionsPlan"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeRequestStorage"));
      v4 = objc_msgSend(v7, "hasTransportType");

    }
  }

  return v4;
}

+ (id)mapsActivityPerDefault
{
  MapsActivity *v2;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc_init(MapsActivity);
  v3 = objc_alloc_init((Class)GEOURLOptions);
  -[MapsActivity setDisplayOptions:](v2, "setDisplayOptions:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v2, "displayOptions"));
  objc_msgSend(v4, "setUserTrackingMode:", 1);

  v5 = (unint64_t)+[MapsSettings selectedViewMode](MapsSettings, "selectedViewMode") - 1;
  if (v5 > 6)
    v6 = 0;
  else
    v6 = dword_100E3C310[v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v2, "displayOptions"));
  objc_msgSend(v7, "setMapType:", v6);

  return v2;
}

- (BOOL)hasDisplayOptions
{
  return self->_displayOptions != 0;
}

- (int)collectionsMode
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_collectionsMode;
  else
    return 0;
}

- (void)setCollectionsMode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_collectionsMode = a3;
}

- (void)setHasCollectionsMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCollectionsMode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)collectionsModeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1011E7770[a3];
}

- (int)StringAsCollectionsMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bookmarks")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Recents")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Contacts")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (void)clearSearchPlaces
{
  -[NSMutableArray removeAllObjects](self->_searchPlaces, "removeAllObjects");
}

- (void)addSearchPlaces:(id)a3
{
  id v4;
  NSMutableArray *searchPlaces;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  searchPlaces = self->_searchPlaces;
  v8 = v4;
  if (!searchPlaces)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_searchPlaces;
    self->_searchPlaces = v6;

    v4 = v8;
    searchPlaces = self->_searchPlaces;
  }
  -[NSMutableArray addObject:](searchPlaces, "addObject:", v4);

}

- (unint64_t)searchPlacesCount
{
  return (unint64_t)-[NSMutableArray count](self->_searchPlaces, "count");
}

- (id)searchPlacesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_searchPlaces, "objectAtIndex:", a3);
}

+ (Class)searchPlacesType
{
  return (Class)objc_opt_class(GEOMapItemStorage);
}

- (void)setSelectedPlaceIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_selectedPlaceIndex = a3;
}

- (void)setHasSelectedPlaceIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSelectedPlaceIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsPresentingSelectedPlace:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isPresentingSelectedPlace = a3;
}

- (void)setHasIsPresentingSelectedPlace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPresentingSelectedPlace
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasDirectionsPlan
{
  return self->_directionsPlan != 0;
}

- (BOOL)hasDroppedPin
{
  return self->_droppedPin != 0;
}

- (void)setIsDroppedPinSelected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isDroppedPinSelected = a3;
}

- (void)setHasIsDroppedPinSelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsDroppedPinSelected
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsDroppedPinPresented:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isDroppedPinPresented = a3;
}

- (void)setHasIsDroppedPinPresented:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsDroppedPinPresented
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasPresentedMapItem
{
  return self->_presentedMapItem != 0;
}

- (BOOL)hasSearchCategoryStorage
{
  return self->_searchCategoryStorage != 0;
}

- (void)setSelectedTransitFeatureID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_selectedTransitFeatureID = a3;
}

- (void)setHasSelectedTransitFeatureID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelectedTransitFeatureID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSelectedTransitLineName
{
  return self->_selectedTransitLineName != 0;
}

- (BOOL)hasLineItem
{
  return self->_lineItem != 0;
}

- (BOOL)hasUserCreatedCollectionID
{
  return self->_userCreatedCollectionID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsActivity;
  v3 = -[MapsActivity description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOURLOptions *displayOptions;
  void *v5;
  uint64_t collectionsMode;
  __CFString *v7;
  NSString *searchString;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  char has;
  void *v17;
  void *v18;
  DirectionsPlan *directionsPlan;
  void *v20;
  MSPDroppedPin *droppedPin;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  GEOMapItemStorage *presentedMapItem;
  void *v27;
  GEOSearchCategoryStorage *searchCategoryStorage;
  void *v29;
  void *v30;
  NSString *selectedTransitLineName;
  MSPTransitStorageLineItem *lineItem;
  void *v33;
  NSString *userCreatedCollectionID;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  displayOptions = self->_displayOptions;
  if (displayOptions)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOURLOptions dictionaryRepresentation](displayOptions, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("displayOptions"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    collectionsMode = self->_collectionsMode;
    if (collectionsMode >= 4)
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_collectionsMode));
    else
      v7 = off_1011E7770[collectionsMode];
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("collectionsMode"));

  }
  searchString = self->_searchString;
  if (searchString)
    objc_msgSend(v3, "setObject:forKey:", searchString, CFSTR("searchString"));
  if (-[NSMutableArray count](self->_searchPlaces, "count"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_searchPlaces, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = self->_searchPlaces;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("searchPlaces"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_selectedPlaceIndex));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("selectedPlaceIndex"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPresentingSelectedPlace));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("isPresentingSelectedPlace"));

  }
  directionsPlan = self->_directionsPlan;
  if (directionsPlan)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan dictionaryRepresentation](directionsPlan, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("directionsPlan"));

  }
  droppedPin = self->_droppedPin;
  if (droppedPin)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSPDroppedPin dictionaryRepresentation](droppedPin, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("droppedPin"));

  }
  v23 = (char)self->_has;
  if ((v23 & 0x10) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isDroppedPinSelected));
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("isDroppedPinSelected"));

    v23 = (char)self->_has;
  }
  if ((v23 & 8) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isDroppedPinPresented));
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("isDroppedPinPresented"));

  }
  presentedMapItem = self->_presentedMapItem;
  if (presentedMapItem)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemStorage dictionaryRepresentation](presentedMapItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("presentedMapItem"));

  }
  searchCategoryStorage = self->_searchCategoryStorage;
  if (searchCategoryStorage)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategoryStorage dictionaryRepresentation](searchCategoryStorage, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("searchCategoryStorage"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_selectedTransitFeatureID));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("selectedTransitFeatureID"));

  }
  selectedTransitLineName = self->_selectedTransitLineName;
  if (selectedTransitLineName)
    objc_msgSend(v3, "setObject:forKey:", selectedTransitLineName, CFSTR("selectedTransitLineName"));
  lineItem = self->_lineItem;
  if (lineItem)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSPTransitStorageLineItem dictionaryRepresentation](lineItem, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("lineItem"));

  }
  userCreatedCollectionID = self->_userCreatedCollectionID;
  if (userCreatedCollectionID)
    objc_msgSend(v3, "setObject:forKey:", userCreatedCollectionID, CFSTR("userCreatedCollectionID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  DirectionsPlan *v13;
  uint64_t v14;
  int v15;
  char v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t String;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      while (1)
      {
        v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0)
          goto LABEL_11;
        v5 += 7;
        v10 = v6++ >= 9;
        if (v10)
        {
          v7 = 0;
          v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v7 = 0;
LABEL_13:
      if (v11 || (v7 & 7) == 4)
        break;
      switch((v7 >> 3))
      {
        case 1u:
          v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOURLOptions);
          v14 = 40;
          goto LABEL_73;
        case 2u:
          v16 = 0;
          v17 = 0;
          v18 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v19 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v19 == -1 || v19 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v20 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
              v18 |= (unint64_t)(v20 & 0x7F) << v16;
              if (v20 < 0)
              {
                v16 += 7;
                v10 = v17++ >= 9;
                if (v10)
                {
                  LODWORD(v18) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v18) = 0;
LABEL_82:
          self->_collectionsMode = v18;
          goto LABEL_105;
        case 3u:
          String = PBReaderReadString(a3);
          v22 = objc_claimAutoreleasedReturnValue(String);
          v23 = 88;
          goto LABEL_78;
        case 4u:
          v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOMapItemStorage);
          -[MapsActivity addSearchPlaces:](self, "addSearchPlaces:", v13);
          goto LABEL_74;
        case 5u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v27 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v27 == -1 || v27 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
              v26 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v10 = v25++ >= 9;
                if (v10)
                {
                  v26 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v26 = 0;
LABEL_86:
          v51 = 8;
          goto LABEL_104;
        case 6u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *(_BYTE *)&self->_has |= 0x20u;
          while (2)
          {
            v32 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v32 == -1 || v32 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
              v31 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v10 = v30++ >= 9;
                if (v10)
                {
                  v31 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v31 = 0;
LABEL_90:
          v52 = v31 != 0;
          v53 = 114;
          goto LABEL_99;
        case 7u:
          v13 = objc_alloc_init(DirectionsPlan);
          objc_storeStrong((id *)&self->_directionsPlan, v13);
          v55 = 0;
          v56 = 0;
          if (!PBReaderPlaceMark(a3, &v55) || (sub_1006F1EF4((uint64_t)v13, (uint64_t)a3) & 1) == 0)
            goto LABEL_107;
          goto LABEL_76;
        case 8u:
          v13 = (DirectionsPlan *)objc_alloc_init((Class)MSPDroppedPin);
          v14 = 48;
          goto LABEL_73;
        case 9u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          while (2)
          {
            v37 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v37 == -1 || v37 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v37);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
              v36 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v10 = v35++ >= 9;
                if (v10)
                {
                  v36 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v36 = 0;
LABEL_94:
          v52 = v36 != 0;
          v53 = 113;
          goto LABEL_99;
        case 0xAu:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v42 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v42 == -1 || v42 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
              v41 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                v10 = v40++ >= 9;
                if (v10)
                {
                  v41 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v41 = 0;
LABEL_98:
          v52 = v41 != 0;
          v53 = 112;
LABEL_99:
          self->PBCodable_opaque[v53] = v52;
          goto LABEL_105;
        case 0xBu:
          v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOMapItemStorage);
          v14 = 64;
          goto LABEL_73;
        case 0xCu:
          v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOSearchCategoryStorage);
          v14 = 72;
          goto LABEL_73;
        case 0xDu:
          v44 = 0;
          v45 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v46 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v46);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v46 + 1;
              v26 |= (unint64_t)(v47 & 0x7F) << v44;
              if (v47 < 0)
              {
                v44 += 7;
                v10 = v45++ >= 9;
                if (v10)
                {
                  v26 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v26 = 0;
LABEL_103:
          v51 = 16;
LABEL_104:
          *(_QWORD *)&self->PBCodable_opaque[v51] = v26;
          goto LABEL_105;
        case 0xEu:
          v48 = PBReaderReadString(a3);
          v22 = objc_claimAutoreleasedReturnValue(v48);
          v23 = 96;
          goto LABEL_78;
        case 0xFu:
          v13 = (DirectionsPlan *)objc_alloc_init((Class)MSPTransitStorageLineItem);
          v14 = 56;
LABEL_73:
          objc_storeStrong((id *)&self->PBCodable_opaque[v14], v13);
LABEL_74:
          v55 = 0;
          v56 = 0;
          if (!PBReaderPlaceMark(a3, &v55) || !-[DirectionsPlan readFrom:](v13, "readFrom:", a3))
          {
LABEL_107:

            LOBYTE(v15) = 0;
            return v15;
          }
LABEL_76:
          PBReaderRecallMark(a3, &v55);

LABEL_105:
          if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_106;
          break;
        case 0x10u:
          v49 = PBReaderReadString(a3);
          v22 = objc_claimAutoreleasedReturnValue(v49);
          v23 = 104;
LABEL_78:
          v50 = *(void **)&self->PBCodable_opaque[v23];
          *(_QWORD *)&self->PBCodable_opaque[v23] = v22;

          goto LABEL_105;
        default:
          v15 = PBReaderSkipValueWithTag(a3);
          if (!v15)
            return v15;
          goto LABEL_105;
      }
    }
  }
LABEL_106:
  LOBYTE(v15) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  GEOURLOptions *displayOptions;
  NSString *searchString;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  char has;
  DirectionsPlan *directionsPlan;
  MSPDroppedPin *droppedPin;
  char v16;
  GEOMapItemStorage *presentedMapItem;
  GEOSearchCategoryStorage *searchCategoryStorage;
  NSString *selectedTransitLineName;
  MSPTransitStorageLineItem *lineItem;
  NSString *userCreatedCollectionID;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = v4;
  displayOptions = self->_displayOptions;
  if (displayOptions)
    PBDataWriterWriteSubmessage(v4, displayOptions, 1);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field(v5, self->_collectionsMode, 2);
  searchString = self->_searchString;
  if (searchString)
    PBDataWriterWriteStringField(v5, searchString, 3);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_searchPlaces;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), 4);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_selectedPlaceIndex, 5);
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
    PBDataWriterWriteBOOLField(v5, self->_isPresentingSelectedPlace, 6);
  directionsPlan = self->_directionsPlan;
  if (directionsPlan)
    PBDataWriterWriteSubmessage(v5, directionsPlan, 7);
  droppedPin = self->_droppedPin;
  if (droppedPin)
    PBDataWriterWriteSubmessage(v5, droppedPin, 8);
  v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_isDroppedPinSelected, 9);
    v16 = (char)self->_has;
  }
  if ((v16 & 8) != 0)
    PBDataWriterWriteBOOLField(v5, self->_isDroppedPinPresented, 10);
  presentedMapItem = self->_presentedMapItem;
  if (presentedMapItem)
    PBDataWriterWriteSubmessage(v5, presentedMapItem, 11);
  searchCategoryStorage = self->_searchCategoryStorage;
  if (searchCategoryStorage)
    PBDataWriterWriteSubmessage(v5, searchCategoryStorage, 12);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field(v5, self->_selectedTransitFeatureID, 13);
  selectedTransitLineName = self->_selectedTransitLineName;
  if (selectedTransitLineName)
    PBDataWriterWriteStringField(v5, selectedTransitLineName, 14);
  lineItem = self->_lineItem;
  if (lineItem)
    PBDataWriterWriteSubmessage(v5, lineItem, 15);
  userCreatedCollectionID = self->_userCreatedCollectionID;
  if (userCreatedCollectionID)
    PBDataWriterWriteStringField(v5, userCreatedCollectionID, 16);

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  _BYTE *v10;
  char v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_displayOptions)
  {
    objc_msgSend(v4, "setDisplayOptions:");
    v4 = v12;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_collectionsMode;
    *((_BYTE *)v4 + 116) |= 4u;
  }
  if (self->_searchString)
    objc_msgSend(v12, "setSearchString:");
  if (-[MapsActivity searchPlacesCount](self, "searchPlacesCount"))
  {
    objc_msgSend(v12, "clearSearchPlaces");
    v5 = -[MapsActivity searchPlacesCount](self, "searchPlacesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity searchPlacesAtIndex:](self, "searchPlacesAtIndex:", i));
        objc_msgSend(v12, "addSearchPlaces:", v8);

      }
    }
  }
  has = (char)self->_has;
  v10 = v12;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v12 + 1) = self->_selectedPlaceIndex;
    *((_BYTE *)v12 + 116) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v12 + 114) = self->_isPresentingSelectedPlace;
    *((_BYTE *)v12 + 116) |= 0x20u;
  }
  if (self->_directionsPlan)
  {
    objc_msgSend(v12, "setDirectionsPlan:");
    v10 = v12;
  }
  if (self->_droppedPin)
  {
    objc_msgSend(v12, "setDroppedPin:");
    v10 = v12;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    v10[113] = self->_isDroppedPinSelected;
    v10[116] |= 0x10u;
    v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0)
  {
    v10[112] = self->_isDroppedPinPresented;
    v10[116] |= 8u;
  }
  if (self->_presentedMapItem)
  {
    objc_msgSend(v12, "setPresentedMapItem:");
    v10 = v12;
  }
  if (self->_searchCategoryStorage)
  {
    objc_msgSend(v12, "setSearchCategoryStorage:");
    v10 = v12;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v10 + 2) = self->_selectedTransitFeatureID;
    v10[116] |= 2u;
  }
  if (self->_selectedTransitLineName)
  {
    objc_msgSend(v12, "setSelectedTransitLineName:");
    v10 = v12;
  }
  if (self->_lineItem)
  {
    objc_msgSend(v12, "setLineItem:");
    v10 = v12;
  }
  if (self->_userCreatedCollectionID)
  {
    objc_msgSend(v12, "setUserCreatedCollectionID:");
    v10 = v12;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  char has;
  id v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[GEOURLOptions copyWithZone:](self->_displayOptions, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_collectionsMode;
    *((_BYTE *)v5 + 116) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v9 = (void *)v5[11];
  v5[11] = v8;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_searchPlaces;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend(v5, "addSearchPlaces:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_selectedPlaceIndex;
    *((_BYTE *)v5 + 116) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v5 + 114) = self->_isPresentingSelectedPlace;
    *((_BYTE *)v5 + 116) |= 0x20u;
  }
  v17 = -[DirectionsPlan copyWithZone:](self->_directionsPlan, "copyWithZone:", a3, (_QWORD)v33);
  v18 = (void *)v5[4];
  v5[4] = v17;

  v19 = -[MSPDroppedPin copyWithZone:](self->_droppedPin, "copyWithZone:", a3);
  v20 = (void *)v5[6];
  v5[6] = v19;

  v21 = (char)self->_has;
  if ((v21 & 0x10) != 0)
  {
    *((_BYTE *)v5 + 113) = self->_isDroppedPinSelected;
    *((_BYTE *)v5 + 116) |= 0x10u;
    v21 = (char)self->_has;
  }
  if ((v21 & 8) != 0)
  {
    *((_BYTE *)v5 + 112) = self->_isDroppedPinPresented;
    *((_BYTE *)v5 + 116) |= 8u;
  }
  v22 = -[GEOMapItemStorage copyWithZone:](self->_presentedMapItem, "copyWithZone:", a3);
  v23 = (void *)v5[8];
  v5[8] = v22;

  v24 = -[GEOSearchCategoryStorage copyWithZone:](self->_searchCategoryStorage, "copyWithZone:", a3);
  v25 = (void *)v5[9];
  v5[9] = v24;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[2] = self->_selectedTransitFeatureID;
    *((_BYTE *)v5 + 116) |= 2u;
  }
  v26 = -[NSString copyWithZone:](self->_selectedTransitLineName, "copyWithZone:", a3);
  v27 = (void *)v5[12];
  v5[12] = v26;

  v28 = -[MSPTransitStorageLineItem copyWithZone:](self->_lineItem, "copyWithZone:", a3);
  v29 = (void *)v5[7];
  v5[7] = v28;

  v30 = -[NSString copyWithZone:](self->_userCreatedCollectionID, "copyWithZone:", a3);
  v31 = (void *)v5[13];
  v5[13] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOURLOptions *displayOptions;
  NSString *searchString;
  NSMutableArray *searchPlaces;
  DirectionsPlan *directionsPlan;
  MSPDroppedPin *droppedPin;
  GEOMapItemStorage *presentedMapItem;
  GEOSearchCategoryStorage *searchCategoryStorage;
  NSString *selectedTransitLineName;
  MSPTransitStorageLineItem *lineItem;
  NSString *userCreatedCollectionID;
  unsigned __int8 v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_61;
  displayOptions = self->_displayOptions;
  if ((unint64_t)displayOptions | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOURLOptions isEqual:](displayOptions, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 4) == 0 || self->_collectionsMode != *((_DWORD *)v4 + 6))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    goto LABEL_61;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_61;
  }
  searchPlaces = self->_searchPlaces;
  if ((unint64_t)searchPlaces | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](searchPlaces, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_selectedPlaceIndex != *((_QWORD *)v4 + 1))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 0x20) == 0)
      goto LABEL_61;
    if (self->_isPresentingSelectedPlace)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  directionsPlan = self->_directionsPlan;
  if ((unint64_t)directionsPlan | *((_QWORD *)v4 + 4) && !-[DirectionsPlan isEqual:](directionsPlan, "isEqual:"))
    goto LABEL_61;
  droppedPin = self->_droppedPin;
  if ((unint64_t)droppedPin | *((_QWORD *)v4 + 6))
  {
    if (!-[MSPDroppedPin isEqual:](droppedPin, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 0x10) == 0)
      goto LABEL_61;
    if (self->_isDroppedPinSelected)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 8) != 0)
    {
      if (self->_isDroppedPinPresented)
      {
        if (!*((_BYTE *)v4 + 112))
          goto LABEL_61;
        goto LABEL_46;
      }
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_46;
    }
LABEL_61:
    v15 = 0;
    goto LABEL_62;
  }
  if ((*((_BYTE *)v4 + 116) & 8) != 0)
    goto LABEL_61;
LABEL_46:
  presentedMapItem = self->_presentedMapItem;
  if ((unint64_t)presentedMapItem | *((_QWORD *)v4 + 8)
    && !-[GEOMapItemStorage isEqual:](presentedMapItem, "isEqual:"))
  {
    goto LABEL_61;
  }
  searchCategoryStorage = self->_searchCategoryStorage;
  if ((unint64_t)searchCategoryStorage | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOSearchCategoryStorage isEqual:](searchCategoryStorage, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 2) == 0 || self->_selectedTransitFeatureID != *((_QWORD *)v4 + 2))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 116) & 2) != 0)
  {
    goto LABEL_61;
  }
  selectedTransitLineName = self->_selectedTransitLineName;
  if ((unint64_t)selectedTransitLineName | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](selectedTransitLineName, "isEqual:"))
  {
    goto LABEL_61;
  }
  lineItem = self->_lineItem;
  if ((unint64_t)lineItem | *((_QWORD *)v4 + 7))
  {
    if (!-[MSPTransitStorageLineItem isEqual:](lineItem, "isEqual:"))
      goto LABEL_61;
  }
  userCreatedCollectionID = self->_userCreatedCollectionID;
  if ((unint64_t)userCreatedCollectionID | *((_QWORD *)v4 + 13))
    v15 = -[NSString isEqual:](userCreatedCollectionID, "isEqual:");
  else
    v15 = 1;
LABEL_62:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;

  v19 = (unint64_t)-[GEOURLOptions hash](self->_displayOptions, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v18 = 2654435761 * self->_collectionsMode;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_searchString, "hash");
  v16 = (unint64_t)-[NSMutableArray hash](self->_searchPlaces, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = 2654435761u * self->_selectedPlaceIndex;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_6:
      v3 = 2654435761 * self->_isPresentingSelectedPlace;
      goto LABEL_9;
    }
  }
  v3 = 0;
LABEL_9:
  v4 = -[DirectionsPlan hash](self->_directionsPlan, "hash");
  v5 = (unint64_t)-[MSPDroppedPin hash](self->_droppedPin, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6 = 2654435761 * self->_isDroppedPinSelected;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_11;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_11:
      v7 = 2654435761 * self->_isDroppedPinPresented;
      goto LABEL_14;
    }
  }
  v7 = 0;
LABEL_14:
  v8 = (unint64_t)-[GEOMapItemStorage hash](self->_presentedMapItem, "hash");
  v9 = (unint64_t)-[GEOSearchCategoryStorage hash](self->_searchCategoryStorage, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761u * self->_selectedTransitFeatureID;
  else
    v10 = 0;
  v11 = v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v12 = -[NSString hash](self->_selectedTransitLineName, "hash");
  v13 = v12 ^ (unint64_t)-[MSPTransitStorageLineItem hash](self->_lineItem, "hash");
  return v11 ^ v13 ^ -[NSString hash](self->_userCreatedCollectionID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOURLOptions *displayOptions;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  char v12;
  DirectionsPlan *directionsPlan;
  uint64_t v14;
  MSPDroppedPin *droppedPin;
  uint64_t v16;
  char v17;
  GEOMapItemStorage *presentedMapItem;
  uint64_t v19;
  GEOSearchCategoryStorage *searchCategoryStorage;
  uint64_t v21;
  MSPTransitStorageLineItem *lineItem;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  displayOptions = self->_displayOptions;
  v6 = *((_QWORD *)v4 + 5);
  if (displayOptions)
  {
    if (v6)
      -[GEOURLOptions mergeFrom:](displayOptions, "mergeFrom:");
  }
  else if (v6)
  {
    -[MapsActivity setDisplayOptions:](self, "setDisplayOptions:");
  }
  if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    self->_collectionsMode = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 11))
    -[MapsActivity setSearchString:](self, "setSearchString:");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = *((id *)v4 + 10);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        -[MapsActivity addSearchPlaces:](self, "addSearchPlaces:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), (_QWORD)v24);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v4 + 116);
  if ((v12 & 1) != 0)
  {
    self->_selectedPlaceIndex = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v12 = *((_BYTE *)v4 + 116);
  }
  if ((v12 & 0x20) != 0)
  {
    self->_isPresentingSelectedPlace = *((_BYTE *)v4 + 114);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  directionsPlan = self->_directionsPlan;
  v14 = *((_QWORD *)v4 + 4);
  if (directionsPlan)
  {
    if (v14)
      -[DirectionsPlan mergeFrom:](directionsPlan, "mergeFrom:");
  }
  else if (v14)
  {
    -[MapsActivity setDirectionsPlan:](self, "setDirectionsPlan:");
  }
  droppedPin = self->_droppedPin;
  v16 = *((_QWORD *)v4 + 6);
  if (droppedPin)
  {
    if (v16)
      -[MSPDroppedPin mergeFrom:](droppedPin, "mergeFrom:");
  }
  else if (v16)
  {
    -[MapsActivity setDroppedPin:](self, "setDroppedPin:");
  }
  v17 = *((_BYTE *)v4 + 116);
  if ((v17 & 0x10) != 0)
  {
    self->_isDroppedPinSelected = *((_BYTE *)v4 + 113);
    *(_BYTE *)&self->_has |= 0x10u;
    v17 = *((_BYTE *)v4 + 116);
  }
  if ((v17 & 8) != 0)
  {
    self->_isDroppedPinPresented = *((_BYTE *)v4 + 112);
    *(_BYTE *)&self->_has |= 8u;
  }
  presentedMapItem = self->_presentedMapItem;
  v19 = *((_QWORD *)v4 + 8);
  if (presentedMapItem)
  {
    if (v19)
      -[GEOMapItemStorage mergeFrom:](presentedMapItem, "mergeFrom:");
  }
  else if (v19)
  {
    -[MapsActivity setPresentedMapItem:](self, "setPresentedMapItem:");
  }
  searchCategoryStorage = self->_searchCategoryStorage;
  v21 = *((_QWORD *)v4 + 9);
  if (searchCategoryStorage)
  {
    if (v21)
      -[GEOSearchCategoryStorage mergeFrom:](searchCategoryStorage, "mergeFrom:");
  }
  else if (v21)
  {
    -[MapsActivity setSearchCategoryStorage:](self, "setSearchCategoryStorage:");
  }
  if ((*((_BYTE *)v4 + 116) & 2) != 0)
  {
    self->_selectedTransitFeatureID = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 12))
    -[MapsActivity setSelectedTransitLineName:](self, "setSelectedTransitLineName:");
  lineItem = self->_lineItem;
  v23 = *((_QWORD *)v4 + 7);
  if (lineItem)
  {
    if (v23)
      -[MSPTransitStorageLineItem mergeFrom:](lineItem, "mergeFrom:");
  }
  else if (v23)
  {
    -[MapsActivity setLineItem:](self, "setLineItem:");
  }
  if (*((_QWORD *)v4 + 13))
    -[MapsActivity setUserCreatedCollectionID:](self, "setUserCreatedCollectionID:");

}

- (GEOURLOptions)displayOptions
{
  return self->_displayOptions;
}

- (void)setDisplayOptions:(id)a3
{
  objc_storeStrong((id *)&self->_displayOptions, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSMutableArray)searchPlaces
{
  return self->_searchPlaces;
}

- (void)setSearchPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_searchPlaces, a3);
}

- (unint64_t)selectedPlaceIndex
{
  return self->_selectedPlaceIndex;
}

- (BOOL)isPresentingSelectedPlace
{
  return self->_isPresentingSelectedPlace;
}

- (DirectionsPlan)directionsPlan
{
  return self->_directionsPlan;
}

- (void)setDirectionsPlan:(id)a3
{
  objc_storeStrong((id *)&self->_directionsPlan, a3);
}

- (MSPDroppedPin)droppedPin
{
  return self->_droppedPin;
}

- (void)setDroppedPin:(id)a3
{
  objc_storeStrong((id *)&self->_droppedPin, a3);
}

- (BOOL)isDroppedPinSelected
{
  return self->_isDroppedPinSelected;
}

- (BOOL)isDroppedPinPresented
{
  return self->_isDroppedPinPresented;
}

- (GEOMapItemStorage)presentedMapItem
{
  return self->_presentedMapItem;
}

- (void)setPresentedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentedMapItem, a3);
}

- (GEOSearchCategoryStorage)searchCategoryStorage
{
  return self->_searchCategoryStorage;
}

- (void)setSearchCategoryStorage:(id)a3
{
  objc_storeStrong((id *)&self->_searchCategoryStorage, a3);
}

- (unint64_t)selectedTransitFeatureID
{
  return self->_selectedTransitFeatureID;
}

- (NSString)selectedTransitLineName
{
  return self->_selectedTransitLineName;
}

- (void)setSelectedTransitLineName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTransitLineName, a3);
}

- (MSPTransitStorageLineItem)lineItem
{
  return self->_lineItem;
}

- (void)setLineItem:(id)a3
{
  objc_storeStrong((id *)&self->_lineItem, a3);
}

- (NSString)userCreatedCollectionID
{
  return self->_userCreatedCollectionID;
}

- (void)setUserCreatedCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_userCreatedCollectionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCreatedCollectionID, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineName, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchPlaces, 0);
  objc_storeStrong((id *)&self->_searchCategoryStorage, 0);
  objc_storeStrong((id *)&self->_presentedMapItem, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_droppedPin, 0);
  objc_storeStrong((id *)&self->_displayOptions, 0);
  objc_storeStrong((id *)&self->_directionsPlan, 0);
}

@end

@implementation RouteMarkerFormatterETA

- (RouteMarkerFormatterETA)initWithNavigationService:(id)a3
{
  id v5;
  RouteMarkerFormatterETA *v6;
  RouteMarkerFormatterETA *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RouteMarkerFormatterETA;
  v6 = -[RouteMarkerFormatterETA init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationService, a3);
    -[MNNavigationService registerObserver:](v7->_navigationService, "registerObserver:", v7);
    v7->_similarTimeDelta = GEOConfigGetUint64(MapsConfig_RouteMarkerFormatterETADeltaConsideredSimilarInMinutes, off_1014B2F98);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MNNavigationService unregisterObserver:](self->_navigationService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RouteMarkerFormatterETA;
  -[RouteMarkerFormatterETA dealloc](&v3, "dealloc");
}

- (id)markerInfoForRoute:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  int64_t v7;
  void *v8;
  unsigned __int8 v9;
  RouteMarkerFormatterInfo *v10;
  double v11;
  void *v12;
  RouteMarkerFormatterInfo *v13;
  id v14;
  void *v15;
  MNNavigationService *navigationService;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v4 = a3;
  if (!-[MNNavigationService isInNavigatingState](self->_navigationService, "isInNavigatingState"))
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - (_BYTE *)-[MNNavigationService targetLegIndex](self->_navigationService, "targetLegIndex");

  if (v7 != 1)
  {
    objc_msgSend(v4, "travelAndChargingDuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:andAbbreviationType:](NSString, "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)v11, 1));
    v13 = [RouteMarkerFormatterInfo alloc];
    v14 = objc_msgSend(v4, "tollCurrencyType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advisoriesStyleAttributes"));
    v10 = -[RouteMarkerFormatterInfo initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:](v13, "initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:", v12, 0, v14, v15);
LABEL_6:

    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self->_navigationService, "route"));
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService displayETAInfoForRoute:](self->_navigationService, "displayETAInfoForRoute:", v4));
    navigationService = self->_navigationService;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](navigationService, "route"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService displayETAInfoForRoute:](navigationService, "displayETAInfoForRoute:", v18));

    v10 = 0;
    if (v12 && v15)
    {
      v19 = objc_msgSend(v12, "displayRemainingMinutesToEndOfRoute");
      v20 = objc_msgSend(v15, "displayRemainingMinutesToEndOfRoute");
      v21 = objc_msgSend(v4, "tollCurrencyType");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "advisoriesStyleAttributes"));
      v10 = (RouteMarkerFormatterInfo *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterETA _comparisonInfoForRouteWithRemainingMinutes:comparedToRouteWithRemainingMinutes:tollCurrency:styleAttributes:](self, "_comparisonInfoForRouteWithRemainingMinutes:comparedToRouteWithRemainingMinutes:tollCurrency:styleAttributes:", v19, v20, v21, v22));

    }
    goto LABEL_6;
  }
LABEL_4:
  v10 = 0;
LABEL_7:

  return v10;
}

- (id)markerInfosForLegsInRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  RouteMarkerFormatterInfo *v21;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  char *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;

  v4 = a3;
  if (-[MNNavigationService isInNavigatingState](self->_navigationService, "isInNavigatingState")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        (unint64_t)v6 >= 2))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService displayETAInfoForRoute:](self->_navigationService, "displayETAInfoForRoute:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "legInfos"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1006AA2C0;
    v29[3] = &unk_1011C0048;
    v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
    v30 = v10;
    objc_msgSend(v8, "enumerateLegsWithBlock:", v29);
    v11 = objc_alloc((Class)NSMutableArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
    v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = 0;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
        objc_msgSend(v13, "addObject:", v17);

        ++v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
        v19 = objc_msgSend(v18, "count");

      }
      while (v16 < (unint64_t)v19);
    }
    v20 = objc_msgSend(v13, "count");
    if (v20 < objc_msgSend(v9, "count"))
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("We have more ETA infos than legs: %lu legs, %lu ETA infos"), objc_msgSend(v13, "count"), objc_msgSend(v9, "count")));
        *(_DWORD *)buf = 136316162;
        v32 = "-[RouteMarkerFormatterETA markerInfosForLegsInRoute:]";
        v33 = 2080;
        v34 = "RouteMarkerFormatterETA.m";
        v35 = 1024;
        v36 = 126;
        v37 = 2080;
        v38 = "legIndexes.count >= legInfos.count";
        v39 = 2112;
        v40 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v26 = sub_1004318FC();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v32 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v21 = -[RouteMarkerFormatterInfo initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:]([RouteMarkerFormatterInfo alloc], "initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:", &stru_1011EB268, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectsForKeys:notFoundMarker:", v13, v21));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_comparisonInfoForRouteWithRemainingMinutes:(unint64_t)a3 comparedToRouteWithRemainingMinutes:(unint64_t)a4 tollCurrency:(unsigned __int8)a5 styleAttributes:(id)a6
{
  uint64_t v6;
  id v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  RouteMarkerFormatterInfo *v20;

  v6 = a5;
  v10 = a6;
  if (a3 <= a4)
    v11 = a4;
  else
    v11 = a3;
  if (a3 >= a4)
    v12 = a4;
  else
    v12 = a3;
  if (v11 - v12 <= self->_similarTimeDelta)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Similar ETA [Route Label Marker]"), CFSTR("localized string not found"), 0));
    v18 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithMinutes:andAbbreviationType:](NSString, "_navigation_stringWithMinutes:andAbbreviationType:"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    if (a3 <= a4)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("<# min> faster [Route Label Marker]"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v13));

      v18 = 3;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("<# min> slower [Route Label Marker]"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v13));

      v18 = 2;
    }
  }

  v20 = -[RouteMarkerFormatterInfo initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:]([RouteMarkerFormatterInfo alloc], "initWithRouteDescription:etaComparison:tollCurrency:styleAttributes:", v17, v18, v6, v10);
  return v20;
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alternateRoutes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "setByAddingObject:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteMarkerFormatterETA delegate](self, "delegate"));
  objc_msgSend(v11, "routeMarkerFormatterETA:didUpdateMarkerInfoForRoutes:", self, v12);

}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (RouteMarkerFormatterETADelegate)delegate
{
  return (RouteMarkerFormatterETADelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end

@implementation RouteAnnotationsMutableConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  RouteAnnotationsConfiguration *v4;

  v4 = -[RouteAnnotationsConfiguration initWithRoute:](+[RouteAnnotationsConfiguration allocWithZone:](RouteAnnotationsConfiguration, "allocWithZone:", a3), "initWithRoute:", 0);
  -[RouteAnnotationsConfiguration _copyPropertiesTo:](self, "_copyPropertiesTo:", v4);
  return v4;
}

- (void)clear
{
  RouteAnnotationsConfiguration *v3;

  v3 = objc_opt_new(RouteAnnotationsConfiguration);
  -[RouteAnnotationsConfiguration _copyPropertiesTo:](v3, "_copyPropertiesTo:", self);

}

- (void)filterTransitVehiclePositionsForTripsNotInSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  RouteAnnotationsMutableConfiguration *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration transitVehiclePositions](self, "transitVehiclePositions"));
  v6 = objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration transitVehiclePositions](self, "transitVehiclePositions"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "tripID")));
          v14 = objc_msgSend(v4, "containsObject:", v13);

          if ((v14 & 1) == 0)
            objc_msgSend(v6, "removeObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    self = v15;
  }
  -[RouteAnnotationsConfiguration setTransitVehiclePositions:](self, "setTransitVehiclePositions:", v6);

}

+ (id)navConfigurationWithCurrentRoute:(id)a3 incidentAlert:(id)a4
{
  id v5;
  id v6;
  RouteAnnotationsMutableConfiguration *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(RouteAnnotationsMutableConfiguration);
  -[RouteAnnotationsMutableConfiguration updateNavConfigurationWithCurrentRoute:incidentAlert:](v7, "updateNavConfigurationWithCurrentRoute:incidentAlert:", v6, v5);

  return v7;
}

- (void)updateNavConfigurationWithCurrentRoute:(id)a3 incidentAlert:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableArray);
  v8 = v7;
  if (v15)
  {
    -[NSMutableArray addObject:](v7, "addObject:");
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateRouteToDisplay"));
      if (v9)
      {
        -[NSMutableArray addObject:](v8, "addObject:", v9);
        v10 = objc_msgSend((id)objc_opt_class(self), "_customSelectedRouteTextFromIncidentAlert:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        if (objc_msgSend(v6, "isReroute"))
          v12 = (uint64_t)-[NSMutableArray count](v8, "count") - 1;
        else
          v12 = 0;
        v13 = 4;
        goto LABEL_11;
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "alternateRoutes"));

      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v9);
    }
    v11 = 0;
    v12 = 0;
    v13 = 2;
LABEL_11:

    goto LABEL_12;
  }
  v11 = 0;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 2;
LABEL_12:
  -[RouteAnnotationsConfiguration setStyle:](self, "setStyle:", v13);
  -[RouteAnnotationsConfiguration setSelectedRouteCustomText:](self, "setSelectedRouteCustomText:", v11);
  -[RouteAnnotationsConfiguration setRoutes:](self, "setRoutes:", v8);
  -[RouteAnnotationsConfiguration setSelectedRouteIndex:](self, "setSelectedRouteIndex:", v12);
  -[RouteAnnotationsConfiguration setRouteTrafficFeaturesActive:](self, "setRouteTrafficFeaturesActive:", 1);

}

+ (id)_customSelectedRouteTextFromIncidentAlert:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "alertType");
    if (v5 == (id)4)
      goto LABEL_5;
    if (v5 == (id)3)
    {
      if (objc_msgSend(v4, "secondsSaved") != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:andAbbreviationType:](NSString, "_navigation_stringWithSeconds:andAbbreviationType:", objc_msgSend(v4, "secondsSaved"), 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("<# min> faster [Route Label Marker For Traffic Incident Alert]"), CFSTR("localized string not found"), 0));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v7));

        goto LABEL_10;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("RouteCalloutText_faster");
LABEL_9:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));
LABEL_10:

      goto LABEL_11;
    }
    if (v5 == (id)1)
    {
LABEL_5:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("RouteCalloutText_New_Route");
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

@end

@implementation RAPWebBundleRouteStepContext

- (RAPWebBundleRouteStepContext)initWithRouteStep:(id)a3 isMissedStep:(BOOL)a4 aggregatedData:(id)a5 locales:(id)a6 mapSnapshotId:(id)a7 routeIndex:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unsigned int v20;
  unsigned int v21;
  __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  RAPWebBundleRouteStepContext *v25;
  RAPWebBundleRouteStepContext *v26;
  NSString *v27;
  NSString *aggregatedData;
  NSString *v29;
  NSString *mapSnapshotId;
  RAPWebBundleRouteStepContext *v31;
  id v32;
  objc_super v34;
  uint8_t buf[4];
  id v36;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = v15;
  v20 = objc_msgSend(v19, "transportType");
  switch(v20)
  {
    case 3u:
      v21 = objc_msgSend(v19, "isArrivalStep");
      v22 = CFSTR("navigationCyclingStep");
      v23 = CFSTR("navigationCyclingArrival");
      goto LABEL_7;
    case 2u:
      v21 = objc_msgSend(v19, "isArrivalStep");
      v22 = CFSTR("navigationWalkingStep");
      v23 = CFSTR("navigationWalkingArrival");
      goto LABEL_7;
    case 0u:
      v21 = objc_msgSend(v19, "isArrivalStep");
      v22 = CFSTR("navigationDrivingStep");
      v23 = CFSTR("navigationDrivingArrival");
LABEL_7:
      if (v21)
        v22 = (__CFString *)v23;
      v24 = v22;

      v34.receiver = self;
      v34.super_class = (Class)RAPWebBundleRouteStepContext;
      v25 = -[RAPWebBundleBaseContext initWithType:locales:](&v34, "initWithType:locales:", v24, v17);
      v26 = v25;
      if (v25)
      {
        objc_storeStrong((id *)&v25->_step, a3);
        v26->_isMissedStep = a4;
        v27 = (NSString *)objc_msgSend(v16, "copy");
        aggregatedData = v26->_aggregatedData;
        v26->_aggregatedData = v27;

        v29 = (NSString *)objc_msgSend(v18, "copy");
        mapSnapshotId = v26->_mapSnapshotId;
        v26->_mapSnapshotId = v29;

        v26->_routeIndex = a8;
      }
      self = v26;
      v31 = self;
      goto LABEL_15;
  }

  v32 = sub_100431F8C();
  v24 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Tried to create RAPWebBundleRouteStepContext for unsupported transportType: %@", buf, 0xCu);
  }
  v31 = 0;
LABEL_15:

  return v31;
}

- (id)context
{
  NSDictionary *v3;
  void *v4;
  id v5;
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
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[2];
  const __CFString *v38;
  id v39;

  v35.receiver = self;
  v35.super_class = (Class)RAPWebBundleRouteStepContext;
  v3 = -[RAPWebBundleBaseContext context](&v35, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_aggregatedData, CFSTR("initialData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[GEOComposedRouteStep stepID](self->_step, "stepID")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("stepId"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_routeIndex));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("routeIndex"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep contentsForContext:](self->_step, "contentsForContext:", 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instruction"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForDistance:", -1.0));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("subtitle"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("RAPManeuverIconIdentifier"), CFSTR("icon"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_mapSnapshotId, CFSTR("map"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_mapSnapshotId, CFSTR("routeStepImageId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "indexInResponse")));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("directionsResponseIndex"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep waypoint](self->_step, "waypoint"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "findMyHandleID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15 != 0));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("isRouteToPerson"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("checked"));
  v38 = CFSTR("focused");
  v17 = objc_msgSend(v6, "copy");
  v39 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("navigation"));

  if (self->_isMissedStep)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("navigation.missed.title"), CFSTR("titleOverrideKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
  v20 = objc_msgSend(v19, "legIndexForStepIndex:", -[GEOComposedRouteStep stepIndex](self->_step, "stepIndex"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "legs"));
  v23 = objc_msgSend(v22, "count");

  if (v20 >= v23)
  {
    v36[0] = CFSTR("entityName");
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "legs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v20));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "destination"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "navDisplayName"));

    v36[0] = CFSTR("entityName");
    if (v28)
    {
      v29 = 0;
      v30 = v28;
      goto LABEL_8;
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_step, "composedRoute"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rapDestinationTitle"));
  v28 = 0;
  v29 = 1;
LABEL_8:
  v36[1] = CFSTR("structuredAddressThoroughfare");
  v37[0] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep maneuverRoadName](self->_step, "maneuverRoadName"));
  v37[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("place"));

  if (v29)
  {

  }
  v33 = objc_msgSend(v5, "copy");

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshotId, 0);
  objc_storeStrong((id *)&self->_aggregatedData, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

@end

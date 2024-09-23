@implementation NavigationSessionDirectionsPlanBuilder

- (NavigationSessionDirectionsPlanBuilder)initWithSessionStack:(id)a3 fidelity:(unint64_t)a4
{
  id v6;
  NavigationSessionDirectionsPlanBuilder *v7;
  NavigationSessionDirectionsPlanBuilder *v8;
  RoutePlanningSessionDirectionsPlanBuilder *v9;
  RoutePlanningSessionDirectionsPlanBuilder *routePlanningBuilder;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  uint64_t v14;
  NavigationSession *session;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NavigationSessionDirectionsPlanBuilder;
  v7 = -[NavigationSessionDirectionsPlanBuilder init](&v17, "init");
  v8 = v7;
  if (v7)
  {
    v7->_fidelity = a4;
    v9 = -[RoutePlanningSessionDirectionsPlanBuilder initWithSessionStack:fidelity:]([RoutePlanningSessionDirectionsPlanBuilder alloc], "initWithSessionStack:fidelity:", v6, a4);
    routePlanningBuilder = v8->_routePlanningBuilder;
    v8->_routePlanningBuilder = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v12 = objc_opt_class(NavigationSession);
    isKindOfClass = objc_opt_isKindOfClass(v11, v12);

    if ((isKindOfClass & 1) != 0)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      session = v8->_session;
      v8->_session = (NavigationSession *)v14;

    }
  }

  return v8;
}

- (id)buildDirectionsPlan
{
  void *v3;
  void *v4;
  void *v5;
  DirectionsPlan *v6;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  int IsNavigating;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  NavigationSessionDirectionsPlanBuilder *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  unint64_t v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  NSObject *log;
  void *v61;
  void *v62;
  char *v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  char *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  void *v79;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionDirectionsPlanBuilder routePlanningBuilder](self, "routePlanningBuilder"));
  if (v3)

  if (!self->_session)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionDirectionsPlanBuilder routePlanningBuilder](self, "routePlanningBuilder"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionDirectionsPlanBuilder routePlanningBuilder](self, "routePlanningBuilder"));
    v6 = (DirectionsPlan *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildDirectionsPlan"));

  }
  else
  {
    v6 = objc_alloc_init(DirectionsPlan);
  }

  v8 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  -[DirectionsPlan setRouteRequestStorage:](v6, "setRouteRequestStorage:", v8);
  v9 = (unint64_t)-[NavigationSession currentTransportType](self->_session, "currentTransportType") - 2;
  if (v9 > 3)
    v10 = 0;
  else
    v10 = dword_100E35030[v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v6, "routeRequestStorage"));
  objc_msgSend(v11, "setTransportType:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession currentRouteCollection](self->_session, "currentRouteCollection"));
  v13 = v12;
  if (v12)
    -[DirectionsPlan setCurrentRouteIndex:](v6, "setCurrentRouteIndex:", objc_msgSend(v12, "currentRouteIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentRoute"));
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc((Class)GEOURLRouteHandle), "initWithRoute:fidelity:", v14, -[NavigationSessionDirectionsPlanBuilder fidelity](self, "fidelity"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v6, "routeRequestStorage"));
    objc_msgSend(v16, "setRouteHandle:", v15);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentRoute"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsPlan _maps_expiryDateForRoute:](DirectionsPlan, "_maps_expiryDateForRoute:", v17));
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  -[DirectionsPlan setExpiryTime:](v6, "setExpiryTime:");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionDirectionsPlanBuilder session](self, "session"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "waypointController"));
  v21 = (char *)objc_msgSend(v20, "targetLegIndex");

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "waypoints"));
  v23 = objc_msgSend(v22, "mutableCopy");

  if (v21 && (unint64_t)objc_msgSend(v23, "count") >= 3 && v21 < (char *)objc_msgSend(v23, "count") - 1)
    objc_msgSend(v23, "removeObjectsInRange:", 1, v21);
  v63 = v21;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v6, "routeRequestStorage"));
  objc_msgSend(v24, "setWaypoints:", v23);

  if (((unint64_t)objc_msgSend(v14, "source") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentData"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v6, "routeRequestStorage"));
    objc_msgSend(v26, "setDestinationRouteData:", v25);

  }
  if ((id)-[NavigationSession guidanceType](self->_session, "guidanceType") == (id)2)
    v27 = 1;
  else
    v27 = 2;
  -[DirectionsPlan setDisplayMethod:](v6, "setDisplayMethod:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v29 = objc_msgSend(v28, "state");
  IsNavigating = MNNavigationServiceStateIsNavigating(v29, v30);

  if (IsNavigating)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[DirectionsPlan setShouldRestoreLowGuidance:](v6, "setShouldRestoreLowGuidance:", objc_msgSend(v32, "state") == (id)5);
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession configuration](self->_session, "configuration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "startNavigationDetails"));
    -[DirectionsPlan setShouldRestoreLowGuidance:](v6, "setShouldRestoreLowGuidance:", objc_msgSend(v33, "guidanceType") == (id)1);

  }
  if (GEOConfigGetBOOL(MapsConfig_ShareETAEnableStateRestoration, off_1014B4928))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "receivers"));

    v36 = sub_10039DCD4(v35, &stru_1011BD290);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = v14;
    v39 = objc_msgSend(v37, "mutableCopy");
    -[DirectionsPlan setHandlesForSharingETAs:](v6, "setHandlesForSharingETAs:", v39);

    v14 = v38;
  }
  v40 = sub_10043188C();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    log = v41;
    v61 = v14;
    v42 = self;
    v43 = (objc_class *)objc_opt_class(v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v62 = v13;
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionDirectionsPlanBuilder performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        goto LABEL_35;
      }

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_35:

    v59 = v48;
    v49 = (id)-[DirectionsPlan displayMethod](v6, "displayMethod");
    if (v49 >= 3)
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v49));
    else
      v50 = *(&off_1011BD2B0 + (int)v49);
    v58 = v50;
    v51 = v8;
    v52 = objc_msgSend(v8, "waypointsCount");
    v53 = objc_msgSend(v23, "count");
    -[DirectionsPlan expiryTime](v6, "expiryTime");
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

    v55 = -[DirectionsPlan handlesForSharingETAsCount](v6, "handlesForSharingETAsCount");
    v56 = v23;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan handlesForSharingETAs](v6, "handlesForSharingETAs"));
    *(_DWORD *)buf = 138545154;
    v65 = v59;
    v66 = 2114;
    v67 = v50;
    v68 = 2048;
    v69 = v52;
    v8 = v51;
    v70 = 2048;
    v71 = v53;
    v72 = 2048;
    v73 = v63;
    v74 = 2112;
    v75 = v54;
    v76 = 2048;
    v77 = v55;
    v78 = 2112;
    v79 = v57;
    v41 = log;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] Prepared directions plan (%{public}@, %lu waypoints (%lu in original route, %lu current leg index), expires: %@, %lu sharing handles: %@)", buf, 0x52u);

    v23 = v56;
    v14 = v61;
    v13 = v62;
  }

  return v6;
}

- (NavigationSession)session
{
  return self->_session;
}

- (unint64_t)fidelity
{
  return self->_fidelity;
}

- (void)setFidelity:(unint64_t)a3
{
  self->_fidelity = a3;
}

- (RoutePlanningSessionDirectionsPlanBuilder)routePlanningBuilder
{
  return self->_routePlanningBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningBuilder, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

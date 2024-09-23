@implementation RoutePlanningSessionDirectionsPlanBuilder

- (RoutePlanningSessionDirectionsPlanBuilder)initWithSessionStack:(id)a3 fidelity:(unint64_t)a4
{
  id v6;
  RoutePlanningSessionDirectionsPlanBuilder *v7;
  RoutePlanningSessionDirectionsPlanBuilder *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  char *v16;
  NavigationSession *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  RoutePlanningSessionDirectionsPlanBuilder *v21;
  NavigationSession *navigationSession;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RoutePlanningSessionDirectionsPlanBuilder;
  v7 = -[RoutePlanningSessionDirectionsPlanBuilder init](&v28, "init");
  v8 = v7;
  if (!v7)
  {
LABEL_21:
    v21 = v8;
    goto LABEL_22;
  }
  v7->_fidelity = a4;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v15 = objc_opt_class(RoutePlanningSession);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          objc_storeStrong((id *)&v8->_session, v14);
          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  if (v8->_session)
  {
    v16 = (char *)objc_msgSend(v6, "indexOfObject:") + 1;
    if (v16 < objc_msgSend(v6, "count"))
    {
      while (1)
      {
        v17 = (NavigationSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v16));
        v18 = objc_opt_class(NavigationSession);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
          break;

        if (++v16 >= objc_msgSend(v6, "count"))
          goto LABEL_21;
      }
      navigationSession = v8->_navigationSession;
      v8->_navigationSession = v17;

    }
    goto LABEL_21;
  }
  v19 = sub_10043188C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "No route planning session present in stack: %@", buf, 0xCu);
  }

  v21 = 0;
LABEL_22:

  return v21;
}

- (RoutePlanningSessionDirectionsPlanBuilder)initWithRoutePlanningSession:(id)a3 fidelity:(unint64_t)a4
{
  id v6;
  void *v7;
  RoutePlanningSessionDirectionsPlanBuilder *v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;

  v6 = a3;
  if (!v6)
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[RoutePlanningSessionDirectionsPlanBuilder initWithRoutePlanningSession:fidelity:]";
      v18 = 2080;
      v19 = "RoutePlanningSessionDirectionsPlanBuilder.m";
      v20 = 1024;
      v21 = 72;
      v22 = 2080;
      v23 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v15 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v8 = -[RoutePlanningSessionDirectionsPlanBuilder initWithSessionStack:fidelity:](self, "initWithSessionStack:fidelity:", v7, a4);

  return v8;
}

- (id)buildDirectionsPlan
{
  DirectionsPlan *v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  RoutePlanningSessionDirectionsPlanBuilder *v18;
  RoutePlanningSessionDirectionsPlanBuilder *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;

  v3 = objc_alloc_init(DirectionsPlan);
  v4 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  -[DirectionsPlan setRouteRequestStorage:](v3, "setRouteRequestStorage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  v6 = (unint64_t)objc_msgSend(v5, "currentTransportType") - 2;
  if (v6 > 3)
    v7 = 0;
  else
    v7 = dword_100E35030[v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v3, "routeRequestStorage"));
  objc_msgSend(v8, "setTransportType:", v7);

  -[DirectionsPlan setDisplayMethod:](v3, "setDisplayMethod:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRouteCollection"));

  if (v10)
    -[DirectionsPlan setCurrentRouteIndex:](v3, "setCurrentRouteIndex:", objc_msgSend(v10, "currentRouteIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRoute"));
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc((Class)GEOURLRouteHandle), "initWithRoute:fidelity:", v11, -[RoutePlanningSessionDirectionsPlanBuilder fidelity](self, "fidelity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v3, "routeRequestStorage"));
    objc_msgSend(v13, "setRouteHandle:", v12);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRoute"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsPlan _maps_expiryDateForRoute:](DirectionsPlan, "_maps_expiryDateForRoute:", v14));
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  -[DirectionsPlan setExpiryTime:](v3, "setExpiryTime:");

  -[RoutePlanningSessionDirectionsPlanBuilder _addOriginDestinationToPlan:](self, "_addOriginDestinationToPlan:", v3);
  -[RoutePlanningSessionDirectionsPlanBuilder _addTransitOptionsToPlan:](self, "_addTransitOptionsToPlan:", v3);
  -[RoutePlanningSessionDirectionsPlanBuilder _addTimingToPlan:](self, "_addTimingToPlan:", v3);
  v16 = sub_10043188C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = self;
    v19 = v18;
    if (!v18)
    {
      v25 = CFSTR("<nil>");
      goto LABEL_17;
    }
    v20 = (objc_class *)objc_opt_class(v18);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
      v24 = v23;
      if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
      {
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

        goto LABEL_15;
      }

    }
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_15:

LABEL_17:
    v26 = v25;
    v27 = (id)-[DirectionsPlan displayMethod](v3, "displayMethod");
    if (v27 >= 3)
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v27));
    else
      v28 = *(&off_1011C00D0 + (int)v27);
    v29 = v28;
    v30 = objc_msgSend(v4, "waypointsCount");
    -[DirectionsPlan expiryTime](v3, "expiryTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

    *(_DWORD *)buf = 138544130;
    v34 = v26;
    v35 = 2114;
    v36 = v28;
    v37 = 2048;
    v38 = v30;
    v39 = 2112;
    v40 = v31;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Preparing directions plan (%{public}@, %lu waypoints, expires: %@)", buf, 0x2Au);

  }
  return v3;
}

- (void)_addOriginDestinationToPlan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  RoutePlanningSessionDirectionsPlanBuilder *v21;
  RoutePlanningSessionDirectionsPlanBuilder *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  RoutePlanningSessionDirectionsPlanBuilder *v40;
  RoutePlanningSessionDirectionsPlanBuilder *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  RoutePlanningSessionDirectionsPlanBuilder *v52;
  RoutePlanningSessionDirectionsPlanBuilder *v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  NSObject *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  __CFString *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder navigationSession](self, "navigationSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originWaypoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedWaypoints"));
  if (!objc_msgSend(v8, "count") || !v7)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "resolvedWaypoints"));

    if (-[NSObject areAllValidWaypoints](v20, "areAllValidWaypoints"))
    {
      v68 = v6;
      v70 = v7;
      v30 = v8;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v31 = v20;
      v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(_QWORD *)v76 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
            objc_msgSend(v37, "addWaypoints:", v36);

          }
          v33 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        }
        while (v33);
      }

      v38 = sub_10043188C();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v8 = v30;
        v6 = v68;
        v7 = v70;
LABEL_52:

        goto LABEL_53;
      }
      v40 = self;
      v41 = v40;
      v8 = v30;
      if (!v40)
      {
        v47 = CFSTR("<nil>");
        v6 = v68;
        goto LABEL_48;
      }
      v42 = (objc_class *)objc_opt_class(v40);
      v43 = NSStringFromClass(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      if ((objc_opt_respondsToSelector(v41, "accessibilityIdentifier") & 1) != 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder performSelector:](v41, "performSelector:", "accessibilityIdentifier"));
        v46 = v45;
        if (v45 && !objc_msgSend(v45, "isEqualToString:", v44))
        {
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v44, v41, v46));

          goto LABEL_33;
        }

      }
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v44, v41));
LABEL_33:

      v6 = v68;
LABEL_48:

      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "waypoints"));
      v66 = sub_1006289DC(v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      *(_DWORD *)buf = 138543618;
      v85 = v47;
      v86 = 2112;
      v87 = v67;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}@] Waypoints for directions plan are valid from RPS: %@", buf, 0x16u);

      v7 = v70;
      goto LABEL_52;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "configuration"));

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject waypointRequests](v39, "waypointRequests"));
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1006ADCC0;
    v72[3] = &unk_1011C00B0;
    v73 = v20;
    v74 = v4;
    objc_msgSend(v49, "enumerateObjectsUsingBlock:", v72);

    v50 = sub_10043188C();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
LABEL_51:

      goto LABEL_52;
    }
    v52 = self;
    v53 = v52;
    if (!v52)
    {
      v59 = CFSTR("<nil>");
      goto LABEL_50;
    }
    v71 = v7;
    v54 = (objc_class *)objc_opt_class(v52);
    v55 = NSStringFromClass(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    if ((objc_opt_respondsToSelector(v53, "accessibilityIdentifier") & 1) != 0)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder performSelector:](v53, "performSelector:", "accessibilityIdentifier"));
      v58 = v57;
      if (v57 && !objc_msgSend(v57, "isEqualToString:", v56))
      {
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v56, v53, v58));

        goto LABEL_41;
      }

    }
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v56, v53));
LABEL_41:

    v7 = v71;
LABEL_50:

    *(_DWORD *)buf = 138543362;
    v85 = v59;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "[%{public}@] Waypoints for directions plan are planning waypoints", buf, 0xCu);

    goto LABEL_51;
  }
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
  v69 = v7;
  objc_msgSend(v10, "addWaypoints:", v7);

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v11 = v8;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v80 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)j);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
        objc_msgSend(v18, "addWaypoints:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    }
    while (v14);
  }

  v19 = sub_10043188C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = self;
    v22 = v21;
    if (!v21)
    {
      v28 = CFSTR("<nil>");
      v8 = v11;
      v6 = v9;
      goto LABEL_45;
    }
    v23 = (objc_class *)objc_opt_class(v21);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v8 = v11;
    v6 = v9;
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_17;
      }

    }
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_17:

LABEL_45:
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "waypoints"));
    v62 = sub_1006289DC(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    *(_DWORD *)buf = 138543618;
    v85 = v28;
    v86 = 2112;
    v87 = v63;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] Waypoints for directions plan are from navigation: %@", buf, 0x16u);

    goto LABEL_46;
  }
  v8 = v11;
  v6 = v9;
LABEL_46:
  v7 = v69;
LABEL_53:

}

- (void)_addTransitOptionsToPlan:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  DirectionsPlanTransitPreferences *v7;
  void *v8;
  DirectionsPlanTransitPreferences *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  v5 = objc_msgSend(v4, "currentTransportType");

  if (v5 == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder _transitPreferences](self, "_transitPreferences"));
    if (v6)
    {
      v7 = [DirectionsPlanTransitPreferences alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitOptions"));
      v9 = -[DirectionsPlanTransitPreferences initWithGEOTransitOptions:](v7, "initWithGEOTransitOptions:", v8);
      objc_msgSend(v12, "setTransitPreferences:", v9);

      objc_msgSend(v12, "setTransitPrioritization:", objc_msgSend(v6, "sortOption"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "surchargeOption"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "surchargeOption"));
        objc_msgSend(v12, "setTransitSurchargeOption:", objc_msgSend(v11, "integerValue"));

      }
    }

  }
}

- (void)_addTimingToPlan:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder _timingForTransportType:](self, "_timingForTransportType:", objc_msgSend(v4, "currentTransportType")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "departureDate"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "departureDate"));
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "setDepartureTime:");
LABEL_8:

    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrivalDate"));

  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrivalDate"));
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "setArrivalTime:");
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  if (objc_msgSend(v7, "currentTransportType") != (id)3)
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));

  if (v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "setDepartureTime:");

    goto LABEL_8;
  }
LABEL_9:

}

- (id)_transitPreferences
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeLoadingTaskFactory"));

  v5 = objc_opt_class(NavdRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transportTypeInformation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestInfoProviderForTransportType:", 3));

    v8 = objc_opt_class(TransitRequestInfoProvider);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitPreferences"));
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_timingForTransportType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionDirectionsPlanBuilder session](self, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeLoadingTaskFactory"));

  v7 = objc_opt_class(NavdRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transportTypeInformation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestInfoProviderForTransportType:", a3));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timing"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (RoutePlanningSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void)setNavigationSession:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSession, a3);
}

- (unint64_t)fidelity
{
  return self->_fidelity;
}

- (void)setFidelity:(unint64_t)a3
{
  self->_fidelity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

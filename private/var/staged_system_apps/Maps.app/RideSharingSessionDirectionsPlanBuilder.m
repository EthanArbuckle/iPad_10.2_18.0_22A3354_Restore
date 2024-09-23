@implementation RideSharingSessionDirectionsPlanBuilder

- (RideSharingSessionDirectionsPlanBuilder)initWithRideBookingPlanningSession:(id)a3
{
  id v5;
  RideSharingSessionDirectionsPlanBuilder *v6;
  RideSharingSessionDirectionsPlanBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RideSharingSessionDirectionsPlanBuilder;
  v6 = -[RideSharingSessionDirectionsPlanBuilder init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (id)buildDirectionsPlan
{
  DirectionsPlan *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  RideSharingSessionDirectionsPlanBuilder *v9;
  RideSharingSessionDirectionsPlanBuilder *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;

  v3 = objc_alloc_init(DirectionsPlan);
  v4 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
  -[DirectionsPlan setRouteRequestStorage:](v3, "setRouteRequestStorage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v3, "routeRequestStorage"));
  objc_msgSend(v5, "setTransportType:", 6);

  -[DirectionsPlan setDisplayMethod:](v3, "setDisplayMethod:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsPlan _maps_expiryDateForRoute:](DirectionsPlan, "_maps_expiryDateForRoute:", 0));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  -[DirectionsPlan setExpiryTime:](v3, "setExpiryTime:");

  -[RideSharingSessionDirectionsPlanBuilder _addOriginDestinationToPlan:](self, "_addOriginDestinationToPlan:", v3);
  v7 = sub_10043188C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    goto LABEL_14;
  v9 = self;
  v10 = v9;
  if (!v9)
  {
    v16 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v11 = (objc_class *)objc_opt_class(v9);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideSharingSessionDirectionsPlanBuilder performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

      goto LABEL_8;
    }

  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
  v17 = v16;
  v18 = (id)-[DirectionsPlan displayMethod](v3, "displayMethod");
  if (v18 >= 3)
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v18));
  else
    v19 = off_1011BFBE8[(int)v18];
  v20 = v19;
  v21 = objc_msgSend(v4, "waypointsCount");
  -[DirectionsPlan expiryTime](v3, "expiryTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  *(_DWORD *)buf = 138544130;
  v25 = v17;
  v26 = 2114;
  v27 = v19;
  v28 = 2048;
  v29 = v21;
  v30 = 2112;
  v31 = v22;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Prepared directions plan (%{public}@, %lu waypoints, expires: %@)", buf, 0x2Au);

LABEL_14:
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideSharingSessionDirectionsPlanBuilder session](self, "session"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedWaypoints"));

  if (v16)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "origin"));
    objc_msgSend(v6, "addWaypoints:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeRequestStorage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destination"));
    objc_msgSend(v8, "addWaypoints:", v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideSharingSessionDirectionsPlanBuilder session](self, "session"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "originRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waypointPlaceholder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    objc_msgSend(v4, "setOriginString:", v13);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideSharingSessionDirectionsPlanBuilder session](self, "session"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationRequest"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypointPlaceholder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    objc_msgSend(v4, "setDestinationString:", v15);

  }
}

- (RideBookingPlanningSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end

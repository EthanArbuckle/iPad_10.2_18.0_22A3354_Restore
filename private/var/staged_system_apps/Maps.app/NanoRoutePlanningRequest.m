@implementation NanoRoutePlanningRequest

- (id)routeAttributes
{
  uint64_t v3;
  void *v4;

  v3 = -[NanoRoutePlanningRequest resolvedTransportType](self, "resolvedTransportType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEORouteAttributes defaultRouteAttributesForTransportType:](GEORouteAttributes, "defaultRouteAttributesForTransportType:", v3));
  -[NanoRoutePlanningRequest _populateRouteAttributes:forTransportType:](self, "_populateRouteAttributes:forTransportType:", v4, v3);
  return v4;
}

- (void)_populateRouteAttributes:(id)a3 forTransportType:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = v6;
  switch(a4)
  {
    case 0:
    case 4:
    case 6:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest automobileOptions](self, "automobileOptions"));
      objc_msgSend(v9, "setAutomobileOptions:", v7);
      goto LABEL_5;
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest transitOptions](self, "transitOptions"));
      objc_msgSend(v9, "setTransitOptions:", v7);
LABEL_5:

      -[NanoRoutePlanningRequest _addTimepointIfNeededToRouteAttributes:](self, "_addTimepointIfNeededToRouteAttributes:", v9);
      goto LABEL_8;
    case 2:
    case 5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest walkingOptions](self, "walkingOptions"));
      objc_msgSend(v9, "setWalkingOptions:", v8);
      goto LABEL_7;
    case 3:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest cyclingOptions](self, "cyclingOptions"));
      objc_msgSend(v9, "setCyclingOptions:", v8);
LABEL_7:

LABEL_8:
      v6 = v9;
      break;
    default:
      break;
  }

}

- (void)_addTimepointIfNeededToRouteAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  char v16;
  uint64_t v17;
  __int16 v18;
  char v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest departureDate](self, "departureDate"));

  if (v5)
  {
    v19 = 0;
    v18 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest departureDate](self, "departureDate"));
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7;

    v9 = 0;
    v17 = 0;
    v10 = &v17;
LABEL_5:
    v10[1] = v8;
    *((_DWORD *)v10 + 4) = v9;
    *((_BYTE *)v10 + 20) = 6;
    objc_msgSend(v4, "setTimepoint:", v14);
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest arrivalDate](self, "arrivalDate"));

  if (v11)
  {
    v16 = 0;
    v15 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest arrivalDate](self, "arrivalDate"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v8 = v13;

    v14 = 0;
    v9 = 1;
    v10 = &v14;
    goto LABEL_5;
  }
LABEL_6:

}

- (NanoRoutePlanningRequest)init
{
  NanoRoutePlanningRequest *v2;
  id v3;
  GEOApplicationAuditToken *v4;
  GEOApplicationAuditToken *auditToken;
  uint64_t v6;
  GEOApplicationAuditToken *v7;
  uint64_t v8;
  GEOCompanionRouteContext *companionRouteContext;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  GEOMapServiceTraits *traits;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NanoRoutePlanningRequest;
  v2 = -[NanoRoutePlanningRequest init](&v15, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)GEOApplicationAuditToken);
    v4 = (GEOApplicationAuditToken *)objc_msgSend(v3, "initWithProxiedApplicationBundleId:", MapsAppBundleId);
    auditToken = v2->_auditToken;
    v2->_auditToken = v4;

    v6 = objc_claimAutoreleasedReturnValue(-[GEOApplicationAuditToken overrideTokenWithOfflineCohortId:](v2->_auditToken, "overrideTokenWithOfflineCohortId:", CFSTR("com.apple.Maps")));
    v7 = v2->_auditToken;
    v2->_auditToken = (GEOApplicationAuditToken *)v6;

    v2->_transportType = 4;
    v8 = objc_claimAutoreleasedReturnValue(+[GEOCompanionRouteContext context](GEOCompanionRouteContext, "context"));
    companionRouteContext = v2->_companionRouteContext;
    v2->_companionRouteContext = (GEOCompanionRouteContext *)v8;

    v10 = 3;
    if (v2->_transportType == 1)
      v10 = 5;
    v2->_maximumNumberOfRoutes = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultTraits"));
    traits = v2->_traits;
    v2->_traits = (GEOMapServiceTraits *)v12;

  }
  return v2;
}

+ (id)requestWithWaypoints:(id)a3 viaTransportType:(int)a4 traits:(id)a5 companionRouteContext:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  NanoRoutePlanningMutableRequest *v12;
  id v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  v13 = objc_msgSend(v11, "copy");

  -[NanoRoutePlanningRequest setWaypoints:](v12, "setWaypoints:", v13);
  -[NanoRoutePlanningRequest setTransportType:](v12, "setTransportType:", v7);
  -[NanoRoutePlanningRequest setTraits:](v12, "setTraits:", v10);

  if (v9)
    -[NanoRoutePlanningRequest setCompanionRouteContext:](v12, "setCompanionRouteContext:", v9);
  v14 = -[NanoRoutePlanningMutableRequest copy](v12, "copy");

  return v14;
}

+ (id)requestForDirectionsToCustomRoute:(id)a3 currentLocation:(id)a4 companionRouteContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NanoRoutePlanningMutableRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[2];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v8);

  v11 = objc_opt_new(NanoRoutePlanningMutableRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointForCurrentLocation:](NanoDirectionWaypoint, "directionWaypointForCurrentLocation:", v10));
  v18[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NanoDirectionWaypoint directionWaypointToCustomRoute:](NanoDirectionWaypoint, "directionWaypointToCustomRoute:", v9));
  v18[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  -[NanoRoutePlanningRequest setWaypoints:](v11, "setWaypoints:", v14);

  v15 = objc_msgSend(v9, "transportType");
  -[NanoRoutePlanningRequest setTransportType:](v11, "setTransportType:", v15);
  -[NanoRoutePlanningRequest setCompanionRouteContext:](v11, "setCompanionRouteContext:", v7);

  v16 = -[NanoRoutePlanningMutableRequest copy](v11, "copy");
  return v16;
}

+ (id)requestForDirectionsWithCompanionRouteDetails:(id)a3 companionRouteContext:(id)a4
{
  id v5;
  id v6;
  NanoRoutePlanningMutableRequest *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoints"));
  v9 = sub_10039DCD4(v8, &stru_1011BF540);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  -[NanoRoutePlanningRequest setWaypoints:](v7, "setWaypoints:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest destinationWaypoint](v7, "destinationWaypoint"));
  objc_msgSend(v12, "setName:", v11);

  v13 = objc_msgSend(v6, "transportType");
  -[NanoRoutePlanningRequest setTransportType:](v7, "setTransportType:", v13);
  -[NanoRoutePlanningRequest setCompanionRouteContext:](v7, "setCompanionRouteContext:", v5);

  v14 = -[NanoRoutePlanningMutableRequest copy](v7, "copy");
  return v14;
}

+ (id)requestForPlaceholderDirections
{
  NanoRoutePlanningMutableRequest *v2;
  id v3;

  v2 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  -[NanoRoutePlanningRequest setCompanionRouteContext:](v2, "setCompanionRouteContext:", 0);
  v3 = -[NanoRoutePlanningMutableRequest copy](v2, "copy");

  return v3;
}

- (id)requestedCompanionRouteDetails
{
  void *v3;
  void *v4;
  uint64_t transportType;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest destinationWaypoint](self, "destinationWaypoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  transportType = self->_transportType;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest waypoints](self, "waypoints"));
  v7 = sub_10039DCD4(v6, &stru_1011BF580);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCompanionRouteDetails syntheticRouteDetailsWithWaypoints:transportType:destinationName:](GEOCompanionRouteDetails, "syntheticRouteDetailsWithWaypoints:transportType:destinationName:", v8, transportType, v4));
  return v9;
}

- (NanoDirectionWaypoint)originWaypoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest waypoints](self, "waypoints"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (NanoDirectionWaypoint *)v3;
}

- (NanoDirectionWaypoint)destinationWaypoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest waypoints](self, "waypoints"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return (NanoDirectionWaypoint *)v3;
}

- (NSArray)waypoints
{
  NSArray *waypoints;

  waypoints = self->_waypoints;
  if (!waypoints)
  {
    self->_waypoints = (NSArray *)&__NSArray0__struct;
    waypoints = (NSArray *)&__NSArray0__struct;
  }
  return waypoints;
}

- (int)resolvedTransportType
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NanoRoutePlanningRequest transportType](self, "transportType");
  if ((_DWORD)v3 != 4)
    return -[NanoRoutePlanningRequest transportType](self, "transportType");
  v4 = GEOGetUserTransportTypePreference(v3);
  if ((unint64_t)(v4 - 1) >= 4)
    return 0;
  else
    return dword_100E35030[v4 - 1];
}

- (id)snapshot
{
  NanoRoutePlanningRequestSnapshot *v3;
  void *v4;

  v3 = objc_alloc_init(NanoRoutePlanningRequestSnapshot);
  -[NanoRoutePlanningRequestSnapshot setTransportType:](v3, "setTransportType:", -[NanoRoutePlanningRequest transportType](self, "transportType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest waypoints](self, "waypoints"));
  -[NanoRoutePlanningRequestSnapshot setWaypoints:](v3, "setWaypoints:", v4);

  return v3;
}

+ (id)requestWithTraceAtPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NanoRoutePlanningMutableRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v3 = a3;
  v4 = objc_alloc_init((Class)MNTraceLoader);
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loadTraceWithPath:outError:", v3, &v19));
  if (v5)
  {
    v6 = objc_alloc_init(NanoRoutePlanningMutableRequest);
    -[NanoRoutePlanningRequest setPreferredMode:](v6, "setPreferredMode:", 3);
    -[NanoRoutePlanningRequest setTracePath:](v6, "setTracePath:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoints"));
    v10 = sub_10039DCD4(v9, &stru_1011BF5C0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NanoRoutePlanningRequest setWaypoints:](v6, "setWaypoints:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routeAttributes"));

    -[NanoRoutePlanningRequest setTransportType:](v6, "setTransportType:", objc_msgSend(v13, "mainTransportType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "automobileOptions"));
    -[NanoRoutePlanningRequest setAutomobileOptions:](v6, "setAutomobileOptions:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transitOptions"));
    -[NanoRoutePlanningRequest setTransitOptions:](v6, "setTransitOptions:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "walkingOptions"));
    -[NanoRoutePlanningRequest setWalkingOptions:](v6, "setWalkingOptions:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cyclingOptions"));
    -[NanoRoutePlanningRequest setCyclingOptions:](v6, "setCyclingOptions:", v17);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NanoRoutePlanningRequest *v4;

  v4 = objc_alloc_init(NanoRoutePlanningRequest);
  -[NanoRoutePlanningRequest _populateCopy:](self, "_populateCopy:", v4);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NanoRoutePlanningMutableRequest *v4;

  v4 = objc_alloc_init(NanoRoutePlanningMutableRequest);
  -[NanoRoutePlanningRequest _populateCopy:](self, "_populateCopy:", v4);
  return v4;
}

- (void)_populateCopy:(id)a3
{
  id *v5;

  objc_storeStrong((id *)a3 + 2, self->_auditToken);
  v5 = (id *)a3;
  objc_storeStrong(v5 + 3, self->_companionRouteContext);
  v5[4] = (id)self->_preferredMode;
  objc_storeStrong(v5 + 5, self->_waypoints);
  *((_DWORD *)v5 + 3) = self->_transportType;
  v5[6] = (id)self->_maximumNumberOfRoutes;
  objc_storeStrong(v5 + 7, self->_traits);
  *((_BYTE *)v5 + 8) = self->_startNavigationAutomatically;
  objc_storeStrong(v5 + 8, self->_departureDate);
  objc_storeStrong(v5 + 9, self->_arrivalDate);
  objc_storeStrong(v5 + 10, self->_automobileOptions);
  objc_storeStrong(v5 + 11, self->_transitOptions);
  objc_storeStrong(v5 + 12, self->_walkingOptions);
  objc_storeStrong(v5 + 13, self->_cyclingOptions);
  objc_storeStrong(v5 + 14, self->_tracePath);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NanoRoutePlanningRequest)initWithCoder:(id)a3
{
  id v4;
  NanoRoutePlanningRequest *v5;
  id v6;
  uint64_t v7;
  GEOApplicationAuditToken *auditToken;
  id v9;
  uint64_t v10;
  GEOCompanionRouteContext *companionRouteContext;
  id v12;
  void *v13;
  uint64_t v14;
  NSSet *v15;
  void *v16;
  uint64_t v17;
  NSArray *waypoints;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  GEOMapServiceTraits *traits;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSDate *departureDate;
  id v31;
  uint64_t v32;
  NSDate *arrivalDate;
  id v34;
  uint64_t v35;
  GEOAutomobileOptions *automobileOptions;
  id v37;
  uint64_t v38;
  GEOTransitOptions *transitOptions;
  id v40;
  uint64_t v41;
  GEOWalkingOptions *walkingOptions;
  id v43;
  uint64_t v44;
  GEOCyclingOptions *cyclingOptions;
  id v46;
  uint64_t v47;
  NSString *tracePath;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)NanoRoutePlanningRequest;
  v5 = -[NanoRoutePlanningRequest init](&v50, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOApplicationAuditToken), CFSTR("_auditToken"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    auditToken = v5->_auditToken;
    v5->_auditToken = (GEOApplicationAuditToken *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOCompanionRouteContext), CFSTR("_companionRouteContext"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    companionRouteContext = v5->_companionRouteContext;
    v5->_companionRouteContext = (GEOCompanionRouteContext *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("_preferredMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v5->_preferredMode = (unint64_t)objc_msgSend(v13, "unsignedIntegerValue");

    v14 = objc_opt_class(NSArray);
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(NanoDirectionWaypoint), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_waypoints")));
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v17;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("_transportType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v5->_transportType = objc_msgSend(v20, "integerValue");

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("_maximumNumberOfRoutes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v5->_maximumNumberOfRoutes = (unint64_t)objc_msgSend(v22, "unsignedIntegerValue");

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOMapServiceTraits), CFSTR("_traits"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v24;

    v26 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("_startNavigationAutomatically"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v5->_startNavigationAutomatically = objc_msgSend(v27, "BOOLValue");

    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("_departureDate"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    departureDate = v5->_departureDate;
    v5->_departureDate = (NSDate *)v29;

    v31 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("_arrivalDate"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v32;

    v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOAutomobileOptions), CFSTR("_automobileOptions"));
    v35 = objc_claimAutoreleasedReturnValue(v34);
    automobileOptions = v5->_automobileOptions;
    v5->_automobileOptions = (GEOAutomobileOptions *)v35;

    v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOAutomobileOptions), CFSTR("_transitOptions"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    transitOptions = v5->_transitOptions;
    v5->_transitOptions = (GEOTransitOptions *)v38;

    v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOAutomobileOptions), CFSTR("_walkingOptions"));
    v41 = objc_claimAutoreleasedReturnValue(v40);
    walkingOptions = v5->_walkingOptions;
    v5->_walkingOptions = (GEOWalkingOptions *)v41;

    v43 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOAutomobileOptions), CFSTR("_cyclingOptions"));
    v44 = objc_claimAutoreleasedReturnValue(v43);
    cyclingOptions = v5->_cyclingOptions;
    v5->_cyclingOptions = (GEOCyclingOptions *)v44;

    v46 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("_tracePath"));
    v47 = objc_claimAutoreleasedReturnValue(v46);
    tracePath = v5->_tracePath;
    v5->_tracePath = (NSString *)v47;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOApplicationAuditToken *auditToken;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  auditToken = self->_auditToken;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", auditToken, CFSTR("_auditToken"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_companionRouteContext, CFSTR("_companionRouteContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_preferredMode));
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("_preferredMode"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_waypoints, CFSTR("_waypoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_transportType));
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("_transportType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_maximumNumberOfRoutes));
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("_maximumNumberOfRoutes"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_traits, CFSTR("_traits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_startNavigationAutomatically));
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("_startNavigationAutomatically"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_departureDate, CFSTR("_departureDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_arrivalDate, CFSTR("_arrivalDate"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_automobileOptions, CFSTR("_automobileOptions"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_transitOptions, CFSTR("_transitOptions"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_walkingOptions, CFSTR("_walkingOptions"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_cyclingOptions, CFSTR("_cyclingOptions"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_tracePath, CFSTR("_tracePath"));

}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NanoRoutePlanningRequest;
  v3 = -[NanoRoutePlanningRequest description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[NanoRoutePlanningRequest transportType](self, "transportType");
  if (v5 >= 7)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v5));
  else
    v6 = off_1011BF5E0[(int)v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest waypoints](self, "waypoints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@, %lu waypoints, auto-start: %d)"), v4, v6, objc_msgSend(v7, "count"), -[NanoRoutePlanningRequest startNavigationAutomatically](self, "startNavigationAutomatically")));

  return v8;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NanoRoutePlanningRequest;
  v3 = -[NanoRoutePlanningRequest debugDescription](&v16, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[NanoRoutePlanningRequest transportType](self, "transportType");
  if (v5 >= 7)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v5));
  else
    v6 = off_1011BF5E0[(int)v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest waypoints](self, "waypoints"));
  v8 = objc_msgSend(v7, "count");
  v9 = -[NanoRoutePlanningRequest startNavigationAutomatically](self, "startNavigationAutomatically");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest waypoints](self, "waypoints"));
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", ")));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v11, v12));

    }
    else
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v11));
    }
  }
  else
  {
    v13 = CFSTR("<nil>");
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@, %lu waypoints, auto-start: %d)\n\t%@"), v4, v6, v8, v9, v13));
  return v14;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOCompanionRouteContext)companionRouteContext
{
  return self->_companionRouteContext;
}

- (void)setCompanionRouteContext:(id)a3
{
  objc_storeStrong((id *)&self->_companionRouteContext, a3);
}

- (unint64_t)preferredMode
{
  return self->_preferredMode;
}

- (void)setPreferredMode:(unint64_t)a3
{
  self->_preferredMode = a3;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (unint64_t)maximumNumberOfRoutes
{
  return self->_maximumNumberOfRoutes;
}

- (void)setMaximumNumberOfRoutes:(unint64_t)a3
{
  self->_maximumNumberOfRoutes = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)startNavigationAutomatically
{
  return self->_startNavigationAutomatically;
}

- (void)setStartNavigationAutomatically:(BOOL)a3
{
  self->_startNavigationAutomatically = a3;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (void)setDepartureDate:(id)a3
{
  objc_storeStrong((id *)&self->_departureDate, a3);
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (void)setArrivalDate:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalDate, a3);
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_companionRouteContext, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end

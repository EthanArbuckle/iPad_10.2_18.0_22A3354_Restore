@implementation TraceRouteLoadingTaskFactory

- (TraceRouteLoadingTaskFactory)initWithTracePath:(id)a3 outError:(id *)a4
{
  id v7;
  TraceRouteLoadingTaskFactory *v8;
  TraceRouteLoadingTaskFactory *v9;
  void *v10;
  NSString *tracePath;
  void *v12;
  id v13;
  void *v14;
  TraceWaypointRequest *v15;
  TraceWaypointRequest *v16;
  uint64_t v17;
  NSArray *v18;
  TraceRouteLoadingTaskFactory *v19;
  unsigned int v20;
  uint64_t v21;
  NSArray *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  TraceWaypointRequest *v30;
  NSArray *waypointRequests;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  objc_super v39;
  _QWORD v40[2];
  _BYTE v41[128];

  v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TraceRouteLoadingTaskFactory;
  v8 = -[TraceRouteLoadingTaskFactory init](&v39, "init");
  v9 = v8;
  if (!v8)
  {
LABEL_17:
    v19 = v9;
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v8->_tracePath, a3);
  v10 = (void *)objc_opt_new(MNTraceLoader);
  tracePath = v9->_tracePath;
  v38 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadTraceWithPath:options:outError:", tracePath, 8, &v38));
  v13 = v38;
  if (!v13)
  {
    v20 = objc_msgSend(v12, "mainTransportType") - 1;
    v33 = v7;
    if (v20 > 5)
      v21 = 1;
    else
      v21 = qword_100E39B98[v20];
    v9->_traceTransportType = v21;
    v22 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "directions"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "waypoints"));

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v25);
          v30 = -[TraceWaypointRequest initWithWaypoint:]([TraceWaypointRequest alloc], "initWithWaypoint:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v29));
          -[NSArray addObject:](v22, "addObject:", v30);

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v27);
    }

    waypointRequests = v9->_waypointRequests;
    v9->_waypointRequests = v22;

    v7 = v33;
    goto LABEL_17;
  }
  v14 = v13;
  v9->_traceTransportType = 0;
  v15 = objc_opt_new(TraceWaypointRequest);
  v40[0] = v15;
  v16 = objc_opt_new(TraceWaypointRequest);
  v40[1] = v16;
  v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
  v18 = v9->_waypointRequests;
  v9->_waypointRequests = (NSArray *)v17;

  if (a4)
    *a4 = objc_retainAutorelease(v14);

  v19 = 0;
LABEL_18:

  return v19;
}

- (NSSet)supportedTransportTypes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_traceTransportType));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v2));

  return (NSSet *)v3;
}

- (TraceRouteLoadingTask)traceLoadingTask
{
  TraceRouteLoadingTask *traceLoadingTask;
  void *v4;
  TraceRouteLoadingTask *v5;
  TraceRouteLoadingTask *v6;

  traceLoadingTask = self->_traceLoadingTask;
  if (!traceLoadingTask)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTaskFactory tracePath](self, "tracePath"));
    v5 = -[TraceRouteLoadingTask initWithTracePath:]([TraceRouteLoadingTask alloc], "initWithTracePath:", v4);
    v6 = self->_traceLoadingTask;
    self->_traceLoadingTask = v5;

    traceLoadingTask = self->_traceLoadingTask;
  }
  return traceLoadingTask;
}

- (void)setCountryConfiguration:(id)a3
{
  GEOCountryConfiguration *v5;
  GEOCountryConfiguration **p_countryConfiguration;
  GEOCountryConfiguration *countryConfiguration;
  GEOCountryConfiguration *v8;

  v5 = (GEOCountryConfiguration *)a3;
  countryConfiguration = self->_countryConfiguration;
  p_countryConfiguration = &self->_countryConfiguration;
  if (countryConfiguration != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_countryConfiguration, a3);
    v5 = v8;
  }

}

- (GEOCountryConfiguration)countryConfiguration
{
  GEOCountryConfiguration *countryConfiguration;

  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
    return countryConfiguration;
  else
    return (GEOCountryConfiguration *)(id)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
}

- (id)taskForTransportType:(int64_t)a3 waypointSet:(id)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTaskFactory supportedTransportTypes](self, "supportedTransportTypes", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTaskFactory traceLoadingTask](self, "traceLoadingTask"));
  else
    v9 = 0;
  return v9;
}

- (id)taskForRoutes:(id)a3
{
  id v3;
  RouteUpdatingNavigationServiceTask *v4;

  v3 = a3;
  v4 = -[RouteUpdatingNavigationServiceTask initWithRoutes:]([RouteUpdatingNavigationServiceTask alloc], "initWithRoutes:", v3);

  return v4;
}

- (int64_t)traceTransportType
{
  return self->_traceTransportType;
}

- (unint64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(unint64_t)a3
{
  self->_initiator = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
  objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
  objc_storeStrong((id *)&self->_persistentData, a3);
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (NSArray)waypointRequests
{
  return self->_waypointRequests;
}

- (void)setWaypointRequests:(id)a3
{
  objc_storeStrong((id *)&self->_waypointRequests, a3);
}

- (TraceRouteRequestBuilderFactory)routeRequestBuilderFactory
{
  return self->_routeRequestBuilderFactory;
}

- (void)setRouteRequestBuilderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_routeRequestBuilderFactory, a3);
}

- (void)setTraceLoadingTask:(id)a3
{
  objc_storeStrong((id *)&self->_traceLoadingTask, a3);
}

- (MNNavigationServiceDirectionsRequestTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_traceLoadingTask, 0);
  objc_storeStrong((id *)&self->_routeRequestBuilderFactory, 0);
  objc_storeStrong((id *)&self->_waypointRequests, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
}

@end

@implementation ComposedWaypointTask

- (ComposedWaypointTask)initWithRequest:(id)a3
{
  id v4;
  ClientTypeResolver *v5;
  ComposedWaypointTask *v6;

  v4 = a3;
  v5 = objc_alloc_init(ClientTypeResolver);
  v6 = -[ComposedWaypointTask initWithRequest:resolver:](self, "initWithRequest:resolver:", v4, v5);

  return v6;
}

- (ComposedWaypointTask)initWithRequest:(id)a3 resolver:(id)a4
{
  id v6;
  id v7;
  ComposedWaypointTask *v8;
  ComposedWaypointTask *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  os_activity_t v13;
  OS_os_activity *activity;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ComposedWaypointTask;
  v8 = -[ComposedWaypointTask init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    -[ComposedWaypointTask setRequest:](v8, "setRequest:", v6);
    objc_storeStrong((id *)&v9->_resolver, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    v13 = _os_activity_create((void *)&_mh_execute_header, "Resolve waypoint", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    activity = v9->_activity;
    v9->_activity = (OS_os_activity *)v13;

  }
  return v9;
}

- (BOOL)isLoaded
{
  return self->_result != 0;
}

- (BOOL)isCancelled
{
  return -[GEOMapServiceCorrectableTicket isCancelled](self->_ticket, "isCancelled");
}

- (void)submitWithHandler:(id)a3 traits:(id)a4 networkActivityHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_os_activity *v11;
  id v12;
  NSObject *v13;
  NSString *v14;
  Result *result;
  id v16;
  NSObject *v17;
  NSString *identifier;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  NSString *v23;
  uint32_t v24;
  id v25;
  NSString *v26;
  GEOMapServiceCorrectableTicket *v27;
  NSString *v28;
  OS_os_activity *v29;
  NSString *v30;
  _QWORD *v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  GEOMapServiceCorrectableTicket *v37;
  GEOMapServiceCorrectableTicket *ticket;
  _QWORD *v39;
  _QWORD v40[4];
  OS_os_activity *v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  OS_os_activity *v48;
  NSString *v49;
  id v50;
  id v51;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSString *v54;
  __int16 v55;
  void *v56;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_activity;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)v11, &state);
  if (!v8)
  {
    v16 = sub_1004328BC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543362;
      v54 = identifier;
      v19 = "[%{public}@] A handler is required.";
      v20 = v17;
      v21 = OS_LOG_TYPE_ERROR;
LABEL_11:
      v24 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v24);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!self->_result)
  {
    if (-[ComposedWaypointTask isCancelled](self, "isCancelled"))
    {
      v22 = sub_1004328BC();
      v17 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v23 = self->_identifier;
        *(_DWORD *)buf = 138543362;
        v54 = v23;
        v19 = "[%{public}@] Task was previously cancelled";
        v20 = v17;
        v21 = OS_LOG_TYPE_DEBUG;
        goto LABEL_11;
      }
    }
    else
    {
      if (!self->_ticket)
      {
        if ((objc_msgSend(v9, "hasSource") & 1) == 0)
          objc_msgSend(v9, "setSource:", 18);
        v28 = self->_identifier;
        objc_initWeak((id *)buf, self);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1002E4214;
        v47[3] = &unk_1011B09D0;
        v29 = v11;
        v48 = v29;
        objc_copyWeak(&v51, (id *)buf);
        v30 = v28;
        v49 = v30;
        v50 = v8;
        v31 = objc_retainBlock(v47);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1002E4328;
        v40[3] = &unk_1011B09F8;
        v41 = v29;
        objc_copyWeak(&v46, (id *)buf);
        v17 = v30;
        v42 = v17;
        v32 = v9;
        v43 = v32;
        v39 = v31;
        v44 = v39;
        v33 = v10;
        v45 = v33;
        v34 = objc_retainBlock(v40);
        if (objc_msgSend(v32, "navigating"))
          v35 = 2;
        else
          v35 = 1;
        objc_msgSend(v32, "setSearchOriginationType:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask request](self, "request"));
        v37 = (GEOMapServiceCorrectableTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "loadComposedWaypointWithTraits:clientResolvedCompletionHandler:completionHandler:networkActivityHandler:", v32, v34, v39, v33));
        ticket = self->_ticket;
        self->_ticket = v37;

        objc_destroyWeak(&v46);
        objc_destroyWeak(&v51);

        objc_destroyWeak((id *)buf);
        goto LABEL_13;
      }
      v25 = sub_1004328BC();
      v17 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v26 = self->_identifier;
        v27 = self->_ticket;
        *(_DWORD *)buf = 138543618;
        v54 = v26;
        v55 = 2112;
        v56 = v27;
        v19 = "[%{public}@] Task is in flight: %@";
        v20 = v17;
        v21 = OS_LOG_TYPE_DEBUG;
        v24 = 22;
        goto LABEL_12;
      }
    }
    goto LABEL_13;
  }
  v12 = sub_1004328BC();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = self->_identifier;
    result = self->_result;
    *(_DWORD *)buf = 138543618;
    v54 = v14;
    v55 = 2112;
    v56 = result;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Already have a response: %@", buf, 0x16u);
  }

  (*((void (**)(id, Result *))v8 + 2))(v8, self->_result);
LABEL_14:
  os_activity_scope_leave(&state);

}

- (void)cancel
{
  id v3;
  NSObject *v4;
  NSString *identifier;
  os_activity_scope_state_s v6;
  uint8_t buf[4];
  ComposedWaypointTask *v8;
  __int16 v9;
  NSString *v10;

  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v6);
  v3 = sub_1004328BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2114;
    v10 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cancelling task: %@ (%{public}@)", buf, 0x16u);
  }

  -[GEOMapServiceCorrectableTicket cancel](self->_ticket, "cancel");
  os_activity_scope_leave(&v6);
}

- (void)applyToRAPUserSearch:(id)a3 correctedSearch:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "setOrigin:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask composedWaypoint](self, "composedWaypoint"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask composedWaypoint](self, "composedWaypoint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "latLng"));
    objc_msgSend(v11, "setCoordinate:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask request](self, "request"));
  objc_msgSend(v10, "recordRAPInformation:", v11);

  -[GEOMapServiceCorrectableTicket applyToCorrectedSearch:](self->_ticket, "applyToCorrectedSearch:", v6);
}

- (void)setRequest:(id)a3
{
  WaypointRequest *v5;
  WaypointRequest **p_request;
  MNLPRRuleHelper *v7;
  MNLPRRuleHelper *lprRuleHelper;
  id v9;
  double v10;
  double v11;
  id v12;
  MNLPRRuleHelper *v13;
  void *v14;
  id v15;
  CLLocationCoordinate2D v16;

  v5 = (WaypointRequest *)a3;
  p_request = &self->_request;
  if (self->_request != v5)
  {
    objc_storeStrong((id *)&self->_request, a3);
    if (*p_request)
    {
      -[WaypointRequest coordinate](*p_request, "coordinate");
      if (CLLocationCoordinate2DIsValid(v16))
      {
        if (!self->_lprRuleHelper)
        {
          v7 = (MNLPRRuleHelper *)objc_alloc_init((Class)MNLPRRuleHelper);
          lprRuleHelper = self->_lprRuleHelper;
          self->_lprRuleHelper = v7;

        }
        v9 = objc_alloc((Class)GEOLatLng);
        -[WaypointRequest coordinate](self->_request, "coordinate");
        v11 = v10;
        -[WaypointRequest coordinate](self->_request, "coordinate");
        v12 = objc_msgSend(v9, "initWithLatitude:longitude:", v11);
        v13 = self->_lprRuleHelper;
        v15 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
        -[MNLPRRuleHelper prefetchRulesForWaypoints:](v13, "prefetchRulesForWaypoints:", v14);

      }
    }
  }

}

- (void)setResult:(id)a3
{
  Result *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSString *identifier;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  int v15;
  NSString *v16;
  __int16 v17;
  void *v18;

  v5 = (Result *)a3;
  if (self->_result != v5)
  {
    objc_storeStrong((id *)&self->_result, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[Result value](v5, "value"));

    v7 = sub_1004328BC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v9)
      {
        identifier = self->_identifier;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[Result value](v5, "value"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shortDescription"));
        v15 = 138543619;
        v16 = identifier;
        v17 = 2113;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Composed waypoint loaded successfully: %{private}@", (uint8_t *)&v15, 0x16u);

      }
    }
    else if (v9)
    {
      v13 = self->_identifier;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[Result error](v5, "error"));
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Composed waypoint loading failed: %@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (GEOComposedWaypoint)composedWaypoint
{
  return (GEOComposedWaypoint *)-[Result value](self->_result, "value");
}

- (void)_resolveItem:(id)a3 traits:(id)a4 completion:(id)a5 networkActivityHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a5;
  v12 = a6;
  v13 = objc_msgSend(v18, "itemType");
  switch((int)v13)
  {
    case 0:
    case 5:
      v14 = GEOErrorDomain(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, -8, 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v16));
      v11[2](v11, v17);

      break;
    case 1:
    case 2:
    case 6:
      -[ComposedWaypointTask _resolveAddressForWaypointType:completion:traits:networkActivityHandler:](self, "_resolveAddressForWaypointType:completion:traits:networkActivityHandler:", objc_msgSend(v18, "itemType"), v11, v10, v12);
      break;
    case 3:
      -[ComposedWaypointTask _resolveParkedCarWithCompletion:traits:networkActivityHandler:](self, "_resolveParkedCarWithCompletion:traits:networkActivityHandler:", v11, v10, v12);
      break;
    case 4:
      -[ComposedWaypointTask _resolveCurrentLocationWithCompletion:](self, "_resolveCurrentLocationWithCompletion:", v11);
      break;
    default:
      break;
  }

}

- (void)_resolveCurrentLocationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask resolver](self, "resolver"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentLocationSource"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002E4AE0;
    v7[3] = &unk_1011B0A20;
    v8 = v4;
    objc_msgSend(v6, "objectWithCompletion:", v7);

  }
}

- (void)_resolveParkedCarWithCompletion:(id)a3 traits:(id)a4 networkActivityHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask resolver](self, "resolver"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parkedCarSource"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002E4D24;
  v16[3] = &unk_1011B0A48;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v17 = v14;
  objc_copyWeak(&v20, &location);
  v15 = v10;
  v19 = v15;
  objc_msgSend(v12, "objectWithCompletion:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_resolveAddressForWaypointType:(int)a3 completion:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask resolver](self, "resolver"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "personalizedItemSource"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002E4F84;
  v18[3] = &unk_1011B0A70;
  v15 = v11;
  v19 = v15;
  objc_copyWeak(&v22, &location);
  v16 = v10;
  v20 = v16;
  v17 = v12;
  v21 = v17;
  objc_msgSend(v14, "addressOrLOIWithType:completion:", v8, v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_loadWaypointWithCorrectedMapItem:(id)a3 coordinate:(CLLocationCoordinate2D)a4 handler:(id)a5 traits:(id)a6 networkActivityHandler:(id)a7
{
  double longitude;
  double latitude;
  id v13;
  id v14;
  id v15;
  id v16;
  CorrectedLocationMapItemWaypointRequest *v17;
  GEOMapServiceCorrectableTicket *v18;
  GEOMapServiceCorrectableTicket *ticket;
  id v20;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = -[CorrectedLocationMapItemWaypointRequest initWithCorrectedCoordinate:mapItem:]([CorrectedLocationMapItemWaypointRequest alloc], "initWithCorrectedCoordinate:mapItem:", v16, latitude, longitude);

  -[ComposedWaypointTask setRequest:](self, "setRequest:", v17);
  v20 = (id)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask request](self, "request"));
  v18 = (GEOMapServiceCorrectableTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "loadComposedWaypointWithTraits:clientResolvedCompletionHandler:completionHandler:networkActivityHandler:", v14, 0, v15, v13));

  ticket = self->_ticket;
  self->_ticket = v18;

}

- (void)_loadWaypointWithMapItem:(id)a3 handler:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MapItemWaypointRequest *v14;
  GEOMapServiceCorrectableTicket *v15;
  GEOMapServiceCorrectableTicket *ticket;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[MapItemWaypointRequest initWithMapItem:]([MapItemWaypointRequest alloc], "initWithMapItem:", v13);

  -[ComposedWaypointTask setRequest:](self, "setRequest:", v14);
  v17 = (id)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask request](self, "request"));
  v15 = (GEOMapServiceCorrectableTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "loadComposedWaypointWithTraits:clientResolvedCompletionHandler:completionHandler:networkActivityHandler:", v11, 0, v12, v10));

  ticket = self->_ticket;
  self->_ticket = v15;

}

- (void)_loadWaypointWithAddress:(id)a3 handler:(id)a4 traits:(id)a5 networkActivityHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AddressBookAddressWaypointRequest *v14;
  GEOMapServiceCorrectableTicket *v15;
  GEOMapServiceCorrectableTicket *ticket;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[AddressBookAddressWaypointRequest initWithAddress:]([AddressBookAddressWaypointRequest alloc], "initWithAddress:", v13);

  -[ComposedWaypointTask setRequest:](self, "setRequest:", v14);
  v17 = (id)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask request](self, "request"));
  v15 = (GEOMapServiceCorrectableTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "loadComposedWaypointWithTraits:clientResolvedCompletionHandler:completionHandler:networkActivityHandler:", v11, 0, v12, v10));

  ticket = self->_ticket;
  self->_ticket = v15;

}

- (void)_handleResponseWithHandler:(id)a3 result:(id)a4
{
  void (**v6)(id, id);
  id v7;
  id v8;
  NSObject *v9;
  NSString *identifier;
  int v11;
  NSString *v12;

  v6 = (void (**)(id, id))a3;
  v7 = a4;
  if (-[ComposedWaypointTask isCancelled](self, "isCancelled"))
  {
    v8 = sub_1004328BC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      v11 = 138543362;
      v12 = identifier;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Received result, but task was already canceled", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    -[ComposedWaypointTask setResult:](self, "setResult:", v7);
    if (v6)
      v6[2](v6, v7);
  }

}

- (NSString)description
{
  ComposedWaypointTask *v2;
  id v3;
  void ***v4;
  ComposedWaypointTask *v5;
  ComposedWaypointTask *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1002E5908;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[ComposedWaypointTask _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  ComposedWaypointTask *v2;
  id v3;
  void ***v4;
  ComposedWaypointTask *v5;
  ComposedWaypointTask *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1002E5A88;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[ComposedWaypointTask _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComposedWaypointTask performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, const __CFString *, ClientTypeResolver *))a3 + 2))(v6, CFSTR("resolver"), self->_resolver);
  (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(v6, CFSTR("identifier"), self->_identifier);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (Result)result
{
  return self->_result;
}

- (WaypointRequest)request
{
  return self->_request;
}

- (ClientTypeResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_lprRuleHelper, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end

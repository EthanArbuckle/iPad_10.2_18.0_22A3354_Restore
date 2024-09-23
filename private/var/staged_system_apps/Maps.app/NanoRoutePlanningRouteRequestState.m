@implementation NanoRoutePlanningRouteRequestState

- (void)dealloc
{
  MNNavigationServiceDirectionsRequestTicket *ticket;
  objc_super v4;

  -[MNNavigationServiceDirectionsRequestTicket cancel](self->_ticket, "cancel");
  ticket = self->_ticket;
  self->_ticket = 0;

  v4.receiver = self;
  v4.super_class = (Class)NanoRoutePlanningRouteRequestState;
  -[NanoRoutePlanningRouteRequestState dealloc](&v4, "dealloc");
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MNNavigationServiceDirectionsRequestTicket **p_ticket;
  MNNavigationServiceDirectionsRequestTicket *ticket;
  MNNavigationServiceDirectionsRequestTicket *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  NanoRoutePlanningRouteRequestState *v32;
  id v33;
  uint8_t buf[4];
  void *v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningState manager](self, "manager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypoints"));
  v6 = sub_10039DCD4(v5, &stru_1011DA280);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeAttributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracePath"));
  v10 = objc_msgSend(v9, "length");

  v11 = objc_alloc((Class)MNDirectionsRequestDetails);
  v12 = v11;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracePath"));
    v14 = objc_msgSend(v12, "initWithTracePath:", v13);

  }
  else
  {
    v14 = objc_msgSend(v11, "initWithWaypoints:routeAttributes:", v7, v8);
  }
  v15 = objc_msgSend(objc_alloc((Class)GEODirectionsRequestFeedback), "initWithPurpose:andSource:", 4, 1);
  objc_msgSend(v15, "setAppIdentifier:", MapsAppBundleId);
  objc_msgSend(v14, "setDirectionsRequestFeedback:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "auditToken"));
  objc_msgSend(v14, "setAuditToken:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traits"));
  objc_msgSend(v14, "setTraits:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traits"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "deviceLocation"));

  objc_msgSend(v14, "setCurrentUserLocation:", v19);
  p_ticket = &self->_ticket;
  ticket = self->_ticket;
  if (ticket)
  {
    -[MNNavigationServiceDirectionsRequestTicket cancel](ticket, "cancel");
    v22 = *p_ticket;
    *p_ticket = 0;

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ticketForDirectionsRequest:", v14));

  objc_storeStrong((id *)&self->_ticket, v24);
  v25 = sub_10043214C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = sub_1006289DC(v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138477827;
    v35 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Will submit directions request ticket for waypoints: %{private}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1008996B8;
  v30[3] = &unk_1011DA2A8;
  objc_copyWeak(&v33, (id *)buf);
  v29 = v24;
  v31 = v29;
  v32 = self;
  objc_msgSend(v29, "submitWithHandler:", v30);

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

}

- (void)_processIncomingRoutes:(id)a3 error:(id)a4 directionsError:(id)a5 fromTicket:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  MNNavigationServiceDirectionsRequestTicket *ticket;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  MNNavigationServiceDirectionsRequestTicket *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  void *v36;
  unint64_t v37;
  _BYTE buf[12];
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  NSErrorUserInfoKey v43;

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  if (-[NanoRoutePlanningState isActive](self, "isActive"))
  {
    v14 = sub_10043214C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v11 | v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = objc_msgSend(v10, "count");
        v39 = 2114;
        v40 = v11;
        v41 = 2114;
        v42 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Route request returned with %lu routes and error: %{public}@, directionsError: %{public}@", buf, 0x20u);
      }

      ticket = self->_ticket;
      self->_ticket = 0;

      if (v12)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEODirectionsError key](GEODirectionsError, "key"));
        v36 = v18;
        v37 = v12;
        v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

        v21 = v19;
        if (!v20)
        {
          v22 = sub_1008EFB10(5);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v21 = v19;
          if (v23)
          {
            v31 = v23;
            v24 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v19);
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, NSLocalizedDescriptionKey);
            v21 = objc_msgSend(v24, "copy");

            v23 = v31;
          }

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NanoRoutePlanningSession"), 5, v21, v31));

        goto LABEL_20;
      }
      if (v11)
      {
        v27 = sub_1008EFB10(5);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        v18 = (void *)v28;
        if (v28)
        {
          v43 = NSLocalizedDescriptionKey;
          *(_QWORD *)buf = v28;
          v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v43, 1));
        }
        else
        {
          v19 = 0;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NanoRoutePlanningSession"), 5, v19));
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = objc_msgSend(v10, "count");
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Route request returned %lu routes", buf, 0xCu);
      }

      v26 = self->_ticket;
      self->_ticket = 0;

    }
    v25 = 0;
LABEL_21:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningState manager](self, "manager"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100899BD0;
    v32[3] = &unk_1011DA2D0;
    v33 = v13;
    v34 = v25;
    v35 = v10;
    v30 = v25;
    objc_msgSend(v29, "updateWithBlock:", v32);

  }
}

- (void)cancelRequest
{
  id v3;
  NSObject *v4;
  MNNavigationServiceDirectionsRequestTicket *ticket;
  uint8_t v6[16];

  if (self->_ticket)
  {
    v3 = sub_10043214C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Cancelling in-flight route manager request", v6, 2u);
    }

    -[MNNavigationServiceDirectionsRequestTicket cancel](self->_ticket, "cancel");
    ticket = self->_ticket;
    self->_ticket = 0;

  }
}

- (void)stop
{
  -[NanoRoutePlanningRouteRequestState cancelRequest](self, "cancelRequest");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end

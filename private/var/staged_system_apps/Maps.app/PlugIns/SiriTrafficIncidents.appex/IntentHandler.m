@implementation IntentHandler

- (void)handleReportIncident:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)INReportIncidentIntentResponse), "initWithCode:userActivity:", 2, 0);
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)resolveIncidentTypeForReportIncident:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  IntentHandler *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  v8 = MAPSGetIncidentsReportingLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incidentType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "isClear"));
    v12 = objc_msgSend(v11, "BOOLValue");
    v13 = CFSTR("NO");
    if (v12)
      v13 = CFSTR("YES");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalDetails"));
    *(_DWORD *)buf = 138412802;
    v27 = v10;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received INReportIncidentIntent with type %@ isClear %@ additionalDetails %@", buf, 0x20u);

  }
  v16 = objc_alloc((Class)GEOLocation);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userLocation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "location"));
  v19 = objc_msgSend(v16, "initWithCLLocation:", v18);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100003DA8;
  v22[3] = &unk_100008218;
  v23 = v6;
  v24 = self;
  v25 = v7;
  v20 = v7;
  v21 = v6;
  -[IntentHandler _fetchTrafficIncidentsLayoutForLocation:completion:](self, "_fetchTrafficIncidentsLayoutForLocation:completion:", v19, v22);

}

- (void)_fetchTrafficIncidentsLayoutForLocation:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  TrafficIncidentLayoutFetcher *v9;
  _QWORD v10[4];
  void (**v11)(id, void *);

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutStorage sharedInstance](TrafficIncidentLayoutStorage, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cachedIncidentLayout"));

  if (v8 && (objc_msgSend(v8, "shouldInvalidateLayoutForLocation:", v5) & 1) == 0)
  {
    if (v6)
      v6[2](v6, v8);
  }
  else
  {
    v9 = objc_alloc_init(TrafficIncidentLayoutFetcher);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004168;
    v10[3] = &unk_100008240;
    v11 = v6;
    -[TrafficIncidentLayoutFetcher fetchTrafficIncidentsLayoutForLocation:formType:completion:](v9, "fetchTrafficIncidentsLayoutForLocation:formType:completion:", v5, 7, v10);

  }
}

- (id)_supportedIncidentTypesForIncidentLayout:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutItems"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = +[TrafficIncidentIntentSupport INTrafficIncidentTypeForincidentType:](TrafficIncidentIntentSupport, "INTrafficIncidentTypeForincidentType:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), "incidentType"));
        v11 = objc_alloc((Class)INSupportedTrafficIncidentType);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentIntentSupport localizedTitleForIncidentType:](TrafficIncidentIntentSupport, "localizedTitleForIncidentType:", v10));
        v13 = objc_msgSend(v11, "initWithType:localizedDisplayString:", v10, v12);

        objc_msgSend(v4, "addObject:", v13);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

@end

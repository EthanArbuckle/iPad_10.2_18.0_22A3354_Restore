@implementation RAPRecordMapsSync

+ (RAPRecordMapsSync)sharedInstance
{
  if (qword_1014D3058 != -1)
    dispatch_once(&qword_1014D3058, &stru_1011C5370);
  return (RAPRecordMapsSync *)(id)qword_1014D3050;
}

- (RAPRecordMapsSync)init
{
  RAPRecordMapsSync *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  uint64_t v5;
  _TtC4Maps19CommunityIDMapsSync *communityIDMapsSync;
  void *v7;
  uint64_t v8;
  NSArray *storeSubscriptionTypes;
  objc_super v11;
  _QWORD v12[2];

  v11.receiver = self;
  v11.super_class = (Class)RAPRecordMapsSync;
  v2 = -[RAPRecordMapsSync init](&v11, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___RAPRecordObserver, 0);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[CommunityIDMapsSync shared](_TtC4Maps19CommunityIDMapsSync, "shared"));
    communityIDMapsSync = v2->_communityIDMapsSync;
    v2->_communityIDMapsSync = (_TtC4Maps19CommunityIDMapsSync *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v7, "subscribe:", v2);

    v12[0] = objc_opt_class(MSIncidentReport);
    v12[1] = objc_opt_class(MSRAPRecord);
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v8;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPRecordMapsSync observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPRecordMapsSync observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)fetchAllRAPHistoryObjectsWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1007462B0;
  v9[4] = sub_1007462C0;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)MSRAPRecordRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007462C8;
  v6[3] = &unk_1011B93C8;
  v8 = v9;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "fetchWithCompletionHandler:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)addRAPRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _TtC4Maps19CommunityIDMapsSync *communityIDMapsSync;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "communityIdentifier"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_initWeak(&location, self);
    communityIDMapsSync = self->_communityIDMapsSync;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "communityIdentifier"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100746520;
    v12[3] = &unk_1011C0B68;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    v13 = v6;
    -[CommunityIDMapsSync fetchCommunityIDWithIdentifier:completion:](communityIDMapsSync, "fetchCommunityIDWithIdentifier:completion:", v11, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    -[RAPRecordMapsSync _buildMapsSyncRAPRecord:communityID:completion:](self, "_buildMapsSyncRAPRecord:communityID:completion:", v6, 0, v7);
  }

}

- (void)_buildMapsSyncRAPRecord:(id)a3 communityID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)MSRAPRecord);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reportID"));
  objc_msgSend(v10, "setReportId:", v11);

  objc_msgSend(v10, "setType:", (__int16)objc_msgSend(v9, "reportType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reportSummary"));
  objc_msgSend(v10, "setSummary:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countryCodeUponCreation"));
  objc_msgSend(v10, "setCountryCode:", v13);

  objc_msgSend(v10, "setStatus:", objc_msgSend(v9, "reportStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentData"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 0, 0));

  objc_msgSend(v10, "setContentData:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rapResponse"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 0, 0));

  objc_msgSend(v10, "setRapResponse:", v17);
  objc_msgSend(v10, "setCommunityID:", v7);
  LOWORD(v16) = (unsigned __int16)objc_msgSend(v9, "clientRevision");

  objc_msgSend(v10, "setClientRevision:", (__int16)v16);
  v18 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v18, "addObject:", v10);
  if (v7)
    objc_msgSend(v18, "addObject:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100746890;
  v21[3] = &unk_1011AE218;
  v22 = v8;
  v20 = v8;
  objc_msgSend(v19, "saveWithObjects:completionHandler:", v18, v21);

}

- (void)fetchRAPHistoryWithReportId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  id v16;
  id location;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_1007462B0;
  v18[4] = sub_1007462C0;
  v19 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  v20 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("reportId == %@"), v8));

  v10 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v9, 0, 0);
  v11 = objc_alloc_init((Class)MSRAPRecordRequest);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100746BBC;
  v13[3] = &unk_1011C5398;
  objc_copyWeak(&v16, &location);
  v15 = v18;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "fetchWithOptions:completionHandler:", v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v18, 8);

}

- (void)editStatusOfRAPRecordWithReportID:(id)a3 toStatus:(signed __int16)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  signed __int16 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_1007462B0;
  v25[4] = sub_1007462C0;
  v26 = 0;
  v27 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("reportId == %@"), v10));

  v12 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v11, 0, 0);
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100746F38;
  v21[3] = &unk_1011B0260;
  objc_copyWeak(&v23, &location);
  v13 = v9;
  v22 = v13;
  v14 = objc_retainBlock(v21);
  v15 = objc_alloc_init((Class)MSRAPRecordRequest);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100746F90;
  v17[3] = &unk_1011C53C0;
  v16 = v14;
  v18 = v16;
  v19 = v25;
  v20 = a4;
  objc_msgSend(v15, "fetchWithOptions:completionHandler:", v12, v17);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v25, 8);
}

- (void)fetchAllTrafficIncidentReportsWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1007462B0;
  v9[4] = sub_1007462C0;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)MSIncidentReportRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100747384;
  v6[3] = &unk_1011B93C8;
  v8 = v9;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "fetchWithCompletionHandler:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)addTrafficIncidentReport:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  signed __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)MSIncidentReport);
  v8 = (unsigned __int16)objc_msgSend(v6, "incidentType");

  objc_msgSend(v7, "setType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "countryCode"));
  objc_msgSend(v7, "setCountryCode:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v16 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1007475EC;
  v14[3] = &unk_1011AE218;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v11, "saveWithObjects:completionHandler:", v12, v14);

}

- (void)storeDidChangeWithTypes:(id)a3
{
  -[GEOObserverHashTable rapRecordObjectsDidChange](self->_observers, "rapRecordObjectsDidChange", a3);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_communityIDMapsSync, 0);
}

@end

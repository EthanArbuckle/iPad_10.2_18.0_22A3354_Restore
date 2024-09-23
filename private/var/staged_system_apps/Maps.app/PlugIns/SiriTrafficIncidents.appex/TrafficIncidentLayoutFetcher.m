@implementation TrafficIncidentLayoutFetcher

- (void)fetchTrafficIncidentsLayoutForLocation:(id)a3 formType:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int v24;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultTraits"));

  objc_msgSend(v8, "clearSensitiveFields:", 0);
  objc_msgSend(v11, "setDeviceLocation:", v8);
  v12 = objc_alloc((Class)GEORPFeedbackRequest);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutFetcher _generateRequestParamsForFormType:](self, "_generateRequestParamsForFormType:", v6));
  v14 = objc_msgSend(v12, "initWithFeedbackRequestParameters:traits:", v13, v11);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ticketForFeedbackRequest:traits:", v14, v11));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000044F8;
  v20[3] = &unk_1000082A8;
  v22 = v8;
  v23 = v9;
  v21 = v14;
  v24 = v6;
  v17 = v8;
  v18 = v9;
  v19 = v14;
  objc_msgSend(v16, "submitWithHandler:networkActivity:", v20, 0);

}

- (id)_generateRequestParamsForFormType:(int)a3
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  v5 = objc_alloc_init((Class)GEORPFeedbackLayoutConfigParameters);
  objc_msgSend(v5, "setFormType:", v3);
  objc_msgSend(v4, "setLayoutConfigParameters:", v5);

  return v4;
}

@end

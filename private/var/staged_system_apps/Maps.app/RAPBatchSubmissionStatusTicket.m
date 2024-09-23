@implementation RAPBatchSubmissionStatusTicket

- (void)fetchStatusesForIdentifiers:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = v5;
    v8 = objc_alloc_init((Class)GEORPRapQueryParameters);
    v9 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setFeedbackIds:", v9);
    v10 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
    v11 = objc_alloc_init((Class)GEORPFeedbackQueryParameters);
    objc_msgSend(v10, "setQueryParameters:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "queryParameters"));
    objc_msgSend(v12, "addFeedbackComponentType:", 5);

    v13 = objc_alloc_init((Class)GEORPFeedbackComponentQueryParameters);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "queryParameters"));
    objc_msgSend(v14, "setComponentQueryParameters:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "queryParameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentQueryParameters"));
    objc_msgSend(v16, "setRapQueryParameters:", v8);

    v17 = objc_alloc((Class)GEORPFeedbackRequest);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "defaultTraits"));
    v20 = objc_msgSend(v17, "initWithFeedbackRequestParameters:traits:", v10, v19);

    v21 = sub_1005704E4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Created request %@", buf, 0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "defaultTraits"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ticketForFeedbackRequest:traits:", v20, v25));

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100570524;
    v27[3] = &unk_1011BB680;
    v28 = v6;
    objc_msgSend(v26, "submitWithHandler:networkActivity:", v27, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

@end

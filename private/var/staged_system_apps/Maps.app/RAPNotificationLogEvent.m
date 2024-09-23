@implementation RAPNotificationLogEvent

+ (void)reportNotificationWasShownWithRapId:(id)a3 responseId:(id)a4 notificationType:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v9 = a6;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotificationLogEvent _buildRequestParamsWithRapId:responseId:](RAPNotificationLogEvent, "_buildRequestParamsWithRapId:responseId:", a3, a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logEventParameters"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "details"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rapNotificationLogEvent"));
  objc_msgSend(v14, "setUserShownNotification:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "defaultTraits"));

  v17 = objc_msgSend(objc_alloc((Class)GEORPFeedbackRequest), "initWithFeedbackRequestParameters:traits:", v11, v16);
  objc_msgSend(v17, "setFeedbackRequestType:", 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ticketForFeedbackRequest:traits:", v17, v16));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1009D18E4;
  v21[3] = &unk_1011BB680;
  v22 = v9;
  v20 = v9;
  objc_msgSend(v19, "submitWithHandler:networkActivity:", v21, 0);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, 713, v10);

}

+ (void)reportUserTappedNotificationWithRapId:(id)a3 responseId:(id)a4 notificationType:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v9 = a6;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotificationLogEvent _buildRequestParamsWithRapId:responseId:](RAPNotificationLogEvent, "_buildRequestParamsWithRapId:responseId:", a3, a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logEventParameters"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "details"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rapNotificationLogEvent"));
  objc_msgSend(v14, "setUserInteractedWithNotification:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "defaultTraits"));

  v17 = objc_msgSend(objc_alloc((Class)GEORPFeedbackRequest), "initWithFeedbackRequestParameters:traits:", v11, v16);
  objc_msgSend(v17, "setFeedbackRequestType:", 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ticketForFeedbackRequest:traits:", v17, v16));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1009D1A90;
  v21[3] = &unk_1011BB680;
  v22 = v9;
  v20 = v9;
  objc_msgSend(v19, "submitWithHandler:networkActivity:", v21, 0);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9003, 713, v10);

}

+ (id)_buildRequestParamsWithRapId:(id)a3 responseId:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)GEORPRapNotificationLogEvent);
  objc_msgSend(v7, "setOriginalRapId:", v6);

  objc_msgSend(v7, "setResponseId:", v5);
  v8 = objc_alloc_init((Class)GEORPFeedbackLogEventDetails);
  objc_msgSend(v8, "setRapNotificationLogEvent:", v7);
  v9 = objc_alloc_init((Class)GEORPFeedbackLogEventParameters);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  objc_msgSend(v9, "setClientEventUuid:", v11);

  v12 = objc_alloc_init((Class)GEORPTimestamp);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v13, "timeIntervalSince1970");
  v15 = v14;

  objc_msgSend(v12, "setSeconds:", (uint64_t)v15);
  objc_msgSend(v9, "setCreatedAt:", v12);
  objc_msgSend(v9, "setType:", 1);
  objc_msgSend(v9, "setDetails:", v8);
  v16 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  objc_msgSend(v16, "setLogEventParameters:", v9);

  return v16;
}

@end

@implementation APJourneyDaemonMetricHelper

- (void)receivedForBundleID:(id)a3 elapsedTime:(double)a4 relayValues:(id)a5 internalProperties:(id)a6
{
  -[APJourneyDaemonMetricHelper receivedForBundleID:adServer:elapsedTime:relayValues:internalProperties:](self, "receivedForBundleID:adServer:elapsedTime:relayValues:internalProperties:", a3, -1, a5, a6, a4);
}

- (void)receivedForBundleID:(id)a3 adServer:(int64_t)a4 elapsedTime:(double)a5 relayValues:(id)a6 internalProperties:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  int64_t v22;
  const __CFString *v23;
  void *v24;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v23 = CFSTR("elapsed");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(a5 * 1000.0)));
  v24 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));

  v17 = APLogForCategory(29);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = (int64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Received event for client request %@", buf, 0xCu);
  }

  if ((a4 & 0x8000000000000000) == 0)
  {
    v19 = APLogForCategory(29);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v22 = a4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Received event from adserver %ld", buf, 0xCu);
    }

  }
  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", 1000, 100, v12, 0, v16, v14, v13, 0, 0);

}

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 bundleID:(id)a5 handleOverride:(id)a6 properties:(id)a7 internalProperties:(id)a8 relayData:(id)a9 order:(int64_t)a10 options:(int64_t)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v30;
  id v31;

  v31 = a5;
  v15 = a6;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v19 = +[MetricsModuleClasses metricClass](MetricsModuleClasses, "metricClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[APJourneyDaemonMetricHelper contentData](self, "contentData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contextIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));

  if (v15)
    v24 = v15;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "journeyIdentifier"));
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "adServerEnvironment"));
  v27 = objc_msgSend([v19 alloc], "initWithPurpose:metric:contentIdentifier:contextIdentifier:handle:branch:properties:internalProperties:relayData:environment:order:options:", a4, a3, v21, v23, v25, 0, v18, v17, v16, v26, a10, 0);

  if (objc_msgSend(v31, "length"))
    objc_msgSend(v27, "updateClientBundleID:", v31);
  objc_msgSend(v30, "receivedMetric:", v27);

}

- (APJourneyDaemonMetricHelper)initWithContentData:(id)a3
{
  id v5;
  APJourneyDaemonMetricHelper *v6;
  APJourneyDaemonMetricHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APJourneyDaemonMetricHelper;
  v6 = -[APJourneyDaemonMetricHelper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentData, a3);

  return v7;
}

- (APContentData)contentData
{
  return self->_contentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentData, 0);
}

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", a3, a4, 0, 0, a5, a6, 0, a7, a8);
}

- (void)discardedForBundleID:(id)a3 withCode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v9 = CFSTR("code");
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", 1001, 100, v6, 0, v8, 0, 0, 0, 0, v9);
}

- (void)conversionForBundleID:(id)a3 source:(id)a4 conversionValue:(signed __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v5 = a5;
  v12 = CFSTR("source");
  v13 = CFSTR("conversion_value");
  v14[0] = a4;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v5));
  v14[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, &v12, 2));

  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", 1002, 100, v9, 0, v11, 0, 0, 0, 0, v12, v13, v14[0]);
}

- (void)downloaded
{
  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:properties:internalProperties:order:options:](self, "recordMetric:forPurpose:properties:internalProperties:order:options:", 1003, 100, 0, 0, 0, 0);
}

- (void)requestFailedForBundleID:(id)a3 withCode:(int64_t)a4 requestID:(id)a5 placementType:(int64_t)a6
{
  -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](self, "requestFailedForBundleID:withCode:requestID:placement:placementType:", a3, a4, a5, 0, a6);
}

- (void)requestFailedForBundleID:(id)a3 withCode:(int64_t)a4 requestID:(id)a5 placement:(unint64_t)a6 placementType:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v18 = CFSTR("code");
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v19 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v16 = objc_msgSend(v15, "mutableCopy");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[APJourneyMetricAdapter translateWithPromotedContent:placement:](APJourneyMetricAdapter, "translateWithPromotedContent:placement:", a7, a6));
  objc_msgSend(v16, "addEntriesFromDictionary:", v17);
  -[APJourneyDaemonMetricHelper recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:](self, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:", 1004, 100, v13, v12, v16, 0, 0, 0, 0, v18);

}

@end

@implementation WiFiManagerAnalytics

+ (id)sharedInstance
{
  if (qword_10026DBD8 != -1)
    dispatch_once(&qword_10026DBD8, &stru_100232768);
  if ((objc_msgSend((id)qword_10026DBD0, "hasRegisteredWithDaemon") & 1) == 0)
    objc_msgSend((id)qword_10026DBD0, "_register");
  return (id)qword_10026DBD0;
}

- (void)_register
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  objc_msgSend(v3, "registerMessageGroup:andReply:", 2, &stru_100232788);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  objc_msgSend(v4, "registerMessageGroup:andReply:", 5, &stru_1002327A8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100155DA8;
  v6[3] = &unk_1002327D0;
  v6[4] = self;
  objc_msgSend(v5, "registerMessageGroup:andReply:", 4, v6);

}

- (void)setWiFiManagerQueue:(id)a3
{
  OS_dispatch_queue *v4;
  void *v5;
  OS_dispatch_queue *wifiManagerQueue;

  v4 = (OS_dispatch_queue *)a3;
  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 2, "%s WiFiManagerQueue was set", "-[WiFiManagerAnalytics setWiFiManagerQueue:]");
  objc_autoreleasePoolPop(v5);
  wifiManagerQueue = self->_wifiManagerQueue;
  self->_wifiManagerQueue = v4;

}

- (void)submitWiFiAnalyticsMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metricName"));
    objc_msgSend(v5, "WFLog:message:", 3, "%s Received call to submit WiFi Analytics message with (%@) value", "-[WiFiManagerAnalytics submitWiFiAnalyticsMessage:]", v6);

  }
  objc_autoreleasePoolPop(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  objc_msgSend(v7, "submitWiFiAnalyticsMessageAdvanced:", v8);

}

- (void)submitGeoServicesMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100156004;
  v7[3] = &unk_1002327F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "submitMessage:groupType:andReply:", v6, 2, v7);

}

- (void)triggerDatapathDiagnosticsNoReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100156178;
  v7[3] = &unk_1002327D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:", 0, v6, v7);

}

- (void)setDeviceAnalyticsConfiguration:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10015631C;
  v6[3] = &unk_100232820;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setDeviceAnalyticsConfiguration:andReply:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)getDeviceAnalyticsConfigurationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics waClient](self, "waClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100156458;
  v7[3] = &unk_100232848;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getDeviceAnalyticsConfigurationAndReply:", v7);

}

- (void)triggerDeviceAnalyticsStoreMigrationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001565E8;
  v7[3] = &unk_100232870;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "triggerDeviceAnalyticsStoreMigrationAndReply:", v7);

}

- (void)_runReplyBlock:(id)a3 withMessage:(id)a4 andError:(id)a5
{
  (*((void (**)(id, id, id))a3 + 2))(a3, a4, a5);
}

- (void)prepareMessageForSubmission:(unsigned int)a3 withData:(void *)a4 andReply:(id)a5
{
  uint64_t v6;
  id v8;
  _QWORD *v9;
  OS_dispatch_queue *wifiManagerQueue;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  _QWORD *v16;
  void *v17;
  int v18;
  _QWORD v19[5];
  id v20;
  unsigned int v21;

  v6 = *(_QWORD *)&a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100156940;
  v19[3] = &unk_1002328C0;
  v21 = a3;
  v8 = a5;
  v19[4] = self;
  v20 = v8;
  v9 = objc_retainBlock(v19);
  if ((_DWORD)v6)
  {
    wifiManagerQueue = self->_wifiManagerQueue;
    v11 = objc_autoreleasePoolPush();
    if (wifiManagerQueue)
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s Received call to prepare message with identifier: 0x%x", "-[WiFiManagerAnalytics prepareMessageForSubmission:withData:andReply:]", v6);
      objc_autoreleasePoolPop(v11);
      v12 = objc_claimAutoreleasedReturnValue(-[WiFiManagerAnalytics serialQ](self, "serialQ"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100156BFC;
      block[3] = &unk_1002328E8;
      v18 = v6;
      block[4] = self;
      v17 = a4;
      v16 = v9;
      dispatch_async(v12, block);

    }
    else
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "Nobody set the _wifiManagerQueue, can't prepare metric with id: %u. Bailing", v6);
      objc_autoreleasePoolPop(v11);
    }
  }
  else
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "Zero(0) message identifier, bail.");
    objc_autoreleasePoolPop(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9010, 0));
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v14);

  }
}

- (WiFiManagerAnalytics)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-[WAClient init] unavailable"), 0));
  objc_exception_throw(v2);
}

- (id)_initPrivate
{
  WiFiManagerAnalytics *v2;
  uint64_t v3;
  WAClient *waClient;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQ;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiManagerAnalytics;
  v2 = -[WiFiManagerAnalytics init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[WAClient sharedClientWithIdentifier:](WAClient, "sharedClientWithIdentifier:", CFSTR("wifid")));
    waClient = v2->_waClient;
    v2->_waClient = (WAClient *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.wifid.wifimanageranalytics.serialQ", v6);
    serialQ = v2->_serialQ;
    v2->_serialQ = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)__copyHashOfSSID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  const char *v9;
  __int128 v10;
  size_t v11;
  size_t v12;
  id v13;
  uint64_t i;
  void *v16;
  _OWORD macOut[2];

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifierForVendor"));

  if (v6)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString")));
    v8 = (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4);

    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "cStringUsingEncoding:", 4);
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    macOut[0] = v10;
    macOut[1] = v10;
    v11 = strlen(v8);
    v12 = strlen(v9);
    CCHmac(2u, v8, v11, v9, v12, macOut);
    v13 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 64);
    for (i = 0; i != 32; ++i)
      objc_msgSend(v13, "appendFormat:", CFSTR("%02x"), *((unsigned __int8 *)macOut + i));
  }
  else
  {
    v16 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to get deviceIdentifier", "-[WiFiManagerAnalytics __copyHashOfSSID:]");
    objc_autoreleasePoolPop(v16);
    v13 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v13;
}

- (void)_populateWiFiConnectionQualityMessageWithScorecard:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  WiFiManagerAnalytics *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001570A0;
    v11[3] = &unk_1002329D8;
    v12 = v6;
    v13 = self;
    v14 = v8;
    objc_msgSend(v9, "registerMessageGroup:andReply:", 2, v11);

  }
  else
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s NULL SCORECARD, bail", "-[WiFiManagerAnalytics _populateWiFiConnectionQualityMessageWithScorecard:andReply:]");
    objc_autoreleasePoolPop(v10);
    v8[2](v8, 0, 0);
  }

}

- (int)_getAssociationEventIDForEventTypeString:(id)a3
{
  int v3;
  id v4;
  int v5;
  int v6;
  unsigned int v7;

  v3 = 6;
  if (a3)
  {
    v4 = a3;
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("AUTH")))
      v5 = 0;
    else
      v5 = 6;
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("ASSOC")))
      v5 = 1;
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("ASSOC_DONE")))
      v5 = 2;
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("LINK STATUS EVENT")))
      v5 = 3;
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("LINK CHANGED")))
      v6 = 4;
    else
      v6 = v5;
    v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("SSID CHANGED"));

    if (v7)
      return 5;
    else
      return v6;
  }
  return v3;
}

- (void)_populateDPSNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __CFDictionary *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100158DA4;
  v8[3] = &unk_100232A00;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "getNewMessageForKey:groupType:andReply:", CFSTR("DPSN"), 4, v8);

}

- (void)_populateDPSProbeResultMessage:(id *)a3 andReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  $013A52FC33FE7463712D3AE92CB23096 *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001590C8;
  v8[3] = &unk_100232A00;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "getNewMessageForKey:groupType:andReply:", CFSTR("DPSAPS"), 4, v8);

}

- (void)_populateDPSLinkStateChangeMessage:(id *)a3 andReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  $B897C239C50DAFF7F97DC1C671E57E5E *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100159340;
  v8[3] = &unk_100232A00;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "getNewMessageForKey:groupType:andReply:", CFSTR("WFAAWDWADAAD"), 4, v8);

}

- (void)_populateDPSAPInfoMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __CFDictionary *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001595C8;
  v8[3] = &unk_100232A00;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "getNewMessageForKey:groupType:andReply:", CFSTR("WFAAWDWAAAPI"), 4, v8);

}

- (void)_populateSlowWiFiNotificationMessage:(__CFDictionary *)a3 andReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __CFDictionary *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WAClient sharedClient](WAClient, "sharedClient"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100159858;
  v8[3] = &unk_100232A00;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "getNewMessageForKey:groupType:andReply:", CFSTR("WFAAWDSWFN"), 4, v8);

}

- (OS_dispatch_queue)wifiManagerQueue
{
  return self->_wifiManagerQueue;
}

- (void)setWifiManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManagerQueue, a3);
}

- (WAClient)waClient
{
  return self->_waClient;
}

- (void)setWaClient:(id)a3
{
  objc_storeStrong((id *)&self->_waClient, a3);
}

- (BOOL)hasRegisteredWithDaemon
{
  return self->_hasRegisteredWithDaemon;
}

- (void)setHasRegisteredWithDaemon:(BOOL)a3
{
  self->_hasRegisteredWithDaemon = a3;
}

- (OS_dispatch_queue)serialQ
{
  return self->_serialQ;
}

- (void)setSerialQ:(id)a3
{
  objc_storeStrong((id *)&self->_serialQ, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQ, 0);
  objc_storeStrong((id *)&self->_waClient, 0);
  objc_storeStrong((id *)&self->_wifiManagerQueue, 0);
}

@end

@implementation WiFiHotspotNANInterface

- (BOOL)isClientAssociated
{
  return self->_clientAssociated;
}

- (WiFiHotspotNANInterface)init
{
  WiFiHotspotNANInterface *v2;
  WiFiHotspotNANInterface *v3;
  WiFiAwarePublishConfiguration *wapCfg;
  WiFiAwareSubscribeConfiguration *wasCfg;
  NSString *networkSsid;
  NSString *networkMacAddr;
  NSString *networkSsidNext;
  NSString *networkMacAddrNext;
  NSMutableArray *v10;
  NSMutableArray *pwdList;
  NSMutableDictionary *v12;
  NSMutableDictionary *wapDataSessionHandles;
  WiFiAwarePublisherDataSessionHandle *wapDataSession;
  NSString *subscriber_ifname;
  NSString *lastAssociatedNetworkServiceName;
  WiFiAwareDiscoveryResult *waDiscoveryResult;
  NSDictionary *curNetworkRecord;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WiFiHotspotNANInterface;
  v2 = -[WiFiHotspotNANInterface init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    wapCfg = v2->_wapCfg;
    v2->_wapCfg = 0;

    wasCfg = v3->_wasCfg;
    v3->_wasCfg = 0;

    networkSsid = v3->_networkSsid;
    v3->_networkSsid = 0;

    networkMacAddr = v3->_networkMacAddr;
    v3->_networkMacAddr = 0;

    networkSsidNext = v3->_networkSsidNext;
    v3->_networkSsidNext = 0;

    networkMacAddrNext = v3->_networkMacAddrNext;
    v3->_networkMacAddrNext = 0;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pwdList = v3->_pwdList;
    v3->_pwdList = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    wapDataSessionHandles = v3->_wapDataSessionHandles;
    v3->_wapDataSessionHandles = v12;

    v3->_sessionTerminated = 1;
    wapDataSession = v3->_wapDataSession;
    v3->_wapDataSession = 0;

    v3->_clientAssociated = 0;
    v3->_subscriber_ifindex = 0;
    subscriber_ifname = v3->_subscriber_ifname;
    v3->_subscriber_ifname = 0;

    v3->_subscriberStopped = 1;
    lastAssociatedNetworkServiceName = v3->_lastAssociatedNetworkServiceName;
    v3->_lastAssociatedNetworkServiceName = 0;

    waDiscoveryResult = v3->_waDiscoveryResult;
    v3->_waDiscoveryResult = 0;

    v3->_current_rssi = -128;
    curNetworkRecord = v3->_curNetworkRecord;
    v3->_curNetworkRecord = 0;

    v3->_subscriberHeldOffForPreviousDP = 0;
    v3->_macRandomizationTransactionState = 0;
    v3->_nanPublisherState = 0;
    v3->_subscriberStoppedCallbackRcvd = 0;
  }
  return v3;
}

- (void)publisherStarted:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwarePublisher started with publisher=%@", v5);
  objc_autoreleasePoolPop(v4);
  self->_nanPublisherState = 2;

}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwarePublisher failed to start with errorString=%d", a4, v7);
  objc_autoreleasePoolPop(v6);
  self->_nanPublisherState = 0;
  if (-[WiFiHotspotNANInterface publisherMetricsCallback](self, "publisherMetricsCallback"))
    ((void (*)(_QWORD, _QWORD, void *))-[WiFiHotspotNANInterface publisherMetricsCallback](self, "publisherMetricsCallback"))(0, a4, -[WiFiHotspotNANInterface publisherMetricsCallbackContext](self, "publisherMetricsCallbackContext"));

}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwarePublisher terminated with reasonString=%d", a4, v7);
  objc_autoreleasePoolPop(v6);
  self->_nanPublisherState = 0;
  if (-[WiFiHotspotNANInterface publisherMetricsCallback](self, "publisherMetricsCallback"))
    ((void (*)(uint64_t, _QWORD, void *))-[WiFiHotspotNANInterface publisherMetricsCallback](self, "publisherMetricsCallback"))(2, a4, -[WiFiHotspotNANInterface publisherMetricsCallbackContext](self, "publisherMetricsCallbackContext"));

}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _WORD *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  int v24;
  __int16 v25;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_storeStrong((id *)&self->_wapDataSession, a4);
  self->_sessionTerminated = 0;
  v12 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwarePublisher data session confirmed ");
  objc_autoreleasePoolPop(v12);
  v25 = 0;
  v24 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initiatorDataAddress"));
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data")));
  v15 = objc_msgSend(v14, "bytes");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initiatorDataAddress"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "data"));
  if ((unint64_t)objc_msgSend(v17, "length") >= 6)
  {
    v21 = *(_DWORD *)v15;
    v25 = v15[2];
    v24 = v21;
  }
  else
  {
    v23 = v11;
    v18 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initiatorDataAddress"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "data"));
    __memcpy_chk(&v24, v15, objc_msgSend(v20, "length"), 6);

    v9 = v18;
    v11 = v23;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2X:%.2X:%.2X:%.2X:%.2X:%.2X"), v24, BYTE1(v24), BYTE2(v24), HIBYTE(v24), v25, HIBYTE(v25)));
  -[NSMutableDictionary setObject:forKey:](self->_wapDataSessionHandles, "setObject:forKey:", v10, v22);
  if (-[WiFiHotspotNANInterface staArrivecallback](self, "staArrivecallback"))
    ((void (*)(id, void *, void *))-[WiFiHotspotNANInterface staArrivecallback](self, "staArrivecallback"))(objc_msgSend(v10, "datapathID"), v22, -[WiFiHotspotNANInterface callbackContext](self, "callbackContext"));

}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _WORD *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  __int16 v26;

  v8 = a3;
  v9 = a4;
  v10 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwarePublisher data session terminated for reason %d \n", a5);
  objc_autoreleasePoolPop(v10);
  v26 = 0;
  v25 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "initiatorDataAddress"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data")));
  v13 = objc_msgSend(v12, "bytes");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "initiatorDataAddress"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
  if ((unint64_t)objc_msgSend(v15, "length") >= 6)
  {
    v20 = *(_DWORD *)v13;
    v26 = v13[2];
    v25 = v20;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "initiatorDataAddress"));
    v24 = v9;
    v17 = a5;
    a5 = (int64_t)v8;
    v18 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "data"));
    __memcpy_chk(&v25, v13, objc_msgSend(v19, "length"), 6);

    v8 = (id)a5;
    LOBYTE(a5) = v17;
    v9 = v24;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2X:%.2X:%.2X:%.2X:%.2X:%.2X"), v25, BYTE1(v25), BYTE2(v25), HIBYTE(v25), v26, HIBYTE(v26)));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_wapDataSessionHandles, "objectForKey:", v21));

  if (v22)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_wapDataSessionHandles, "removeObjectForKey:", v21);
    if (-[WiFiHotspotNANInterface staLeavecallback](self, "staLeavecallback"))
      ((void (*)(id, void *, void *))-[WiFiHotspotNANInterface staLeavecallback](self, "staLeavecallback"))(objc_msgSend(v9, "datapathID"), v21, -[WiFiHotspotNANInterface callbackContext](self, "callbackContext"));
  }
  if (-[WiFiHotspotNANInterface publisherMetricsCallback](self, "publisherMetricsCallback"))
    ((void (*)(uint64_t, _QWORD, void *))-[WiFiHotspotNANInterface publisherMetricsCallback](self, "publisherMetricsCallback"))(1, a5, -[WiFiHotspotNANInterface publisherMetricsCallbackContext](self, "publisherMetricsCallbackContext"));
  v23 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "NANPHS: _wapDataSessionHandles count %ld", -[NSMutableDictionary count](self->_wapDataSessionHandles, "count"));
  objc_autoreleasePoolPop(v23);

}

- (void)registerStaLeaveCallback:(void *)a3 withContext:(void *)a4
{
  -[WiFiHotspotNANInterface setStaLeavecallback:](self, "setStaLeavecallback:", a3);
  -[WiFiHotspotNANInterface setCallbackContext:](self, "setCallbackContext:", a4);
}

- (void)registerStaArriveCallback:(void *)a3 withContext:(void *)a4
{
  -[WiFiHotspotNANInterface setStaArrivecallback:](self, "setStaArrivecallback:", a3);
  -[WiFiHotspotNANInterface setCallbackContext:](self, "setCallbackContext:", a4);
}

- (void)registerClientDatapathEstablishedCallback:(void *)a3 withContext:(void *)a4 withNetworkContext:(void *)a5 withAssocData:(void *)a6 isAutoJoined:(unsigned __int8)a7
{
  uint64_t v7;

  v7 = a7;
  -[WiFiHotspotNANInterface setStaDatapathEstablishedcallback:](self, "setStaDatapathEstablishedcallback:", a3);
  -[WiFiHotspotNANInterface setLinkEstablishedCallbackContext:](self, "setLinkEstablishedCallbackContext:", a4);
  -[WiFiHotspotNANInterface setEstablishedLinkNetwork:](self, "setEstablishedLinkNetwork:", a5);
  -[WiFiHotspotNANInterface setNanAssocData:](self, "setNanAssocData:", a6);
  -[WiFiHotspotNANInterface setIsAutoJoined:](self, "setIsAutoJoined:", v7);
}

- (void)registerPublisherMetricCallback:(void *)a3 withContext:(void *)a4
{
  -[WiFiHotspotNANInterface setPublisherMetricsCallback:](self, "setPublisherMetricsCallback:", a3);
  -[WiFiHotspotNANInterface setPublisherMetricsCallbackContext:](self, "setPublisherMetricsCallbackContext:", a4);
}

- (void)registerSubscriberMetricCallback:(void *)a3 withContext:(void *)a4
{
  -[WiFiHotspotNANInterface setSubscriberMetricsCallback:](self, "setSubscriberMetricsCallback:", a3);
  -[WiFiHotspotNANInterface setSubscriberMetricsCallbackContext:](self, "setSubscriberMetricsCallbackContext:", a4);
}

- (void)registerSubscriberTimerCancelCallback:(void *)a3 withContext:(void *)a4
{
  -[WiFiHotspotNANInterface setSubscriberCancelTimerCallback:](self, "setSubscriberCancelTimerCallback:", a3);
  -[WiFiHotspotNANInterface setSubscriberCancelTimerCallbackContext:](self, "setSubscriberCancelTimerCallbackContext:", a4);
}

- (void)registerClientDatapathTerminatedCallback:(void *)a3 withContext:(void *)a4
{
  -[WiFiHotspotNANInterface setStaDatapathTerminatedcallback:](self, "setStaDatapathTerminatedcallback:", a3);
  -[WiFiHotspotNANInterface setLinkTerminatedCallbackContext:](self, "setLinkTerminatedCallbackContext:", a4);
}

- (BOOL)isConnectedToSameNanNetwork:(__CFString *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;

  v5 = objc_autoreleasePoolPush();
  v6 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwareDataSession discoveryResult](self->_waDataSession, "discoveryResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwareDiscoveryResult serviceName](self->_waDiscoveryResult, "serviceName"));
    objc_msgSend(v6, "WFLog:message:", 3, "NANPHS: %d %d _clientAssociated %d \n", v8 == 0, v9 == 0, self->_clientAssociated);

  }
  objc_autoreleasePoolPop(v5);
  if (self->_clientAssociated
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwareDataSession discoveryResult](self->_waDataSession, "discoveryResult")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceName")),
        v11,
        v10,
        v11))
  {
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwareDataSession discoveryResult](self->_waDataSession, "discoveryResult"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serviceName"));
      objc_msgSend(v13, "WFLog:message:", 3, "NANPHS: serviceNameCurrent %@ serviceNameConnectedTo %@", a3, v15);

    }
    objc_autoreleasePoolPop(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwareDataSession discoveryResult](self->_waDataSession, "discoveryResult"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceName"));
    v18 = -[__CFString isEqualToString:](a3, "isEqualToString:", v17);

  }
  else
  {
    v18 = 0;
  }
  v19 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "NANPHS: isSameNetwork %d", v18);
  objc_autoreleasePoolPop(v19);
  return v18;
}

- (void)subscriberStarted:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber started with subscriber=%@", v4);
  objc_autoreleasePoolPop(v3);

}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber failed to start with errorString=%d", a4, v7);
  objc_autoreleasePoolPop(v6);
  if (-[WiFiHotspotNANInterface subscriberMetricsCallback](self, "subscriberMetricsCallback"))
    ((void (*)(_QWORD, _QWORD, void *))-[WiFiHotspotNANInterface subscriberMetricsCallback](self, "subscriberMetricsCallback"))(0, a4, -[WiFiHotspotNANInterface subscriberMetricsCallbackContext](self, "subscriberMetricsCallbackContext"));

}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber terminated with reasonString=%d", a4, v7);
  objc_autoreleasePoolPop(v6);
  *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 257;
  if (-[WiFiHotspotNANInterface subscriberMetricsCallback](self, "subscriberMetricsCallback"))
    ((void (*)(uint64_t, _QWORD, void *))-[WiFiHotspotNANInterface subscriberMetricsCallback](self, "subscriberMetricsCallback"))(2, a4, -[WiFiHotspotNANInterface subscriberMetricsCallbackContext](self, "subscriberMetricsCallbackContext"));

}

- (void)stopSubscriberForPHSOverNAN
{
  void *v3;
  void *v4;

  if (!-[WiFiHotspotNANInterface isSessionTerminated](self, "isSessionTerminated"))
  {
    -[WiFiAwareDataSession stop](self->_waDataSession, "stop");
    self->_sessionTerminated = 1;
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber Stopped datasession over NAN Subscriber");
    objc_autoreleasePoolPop(v3);
  }
  if (!-[WiFiHotspotNANInterface isSubscriberStopped](self, "isSubscriberStopped"))
  {
    -[WiFiAwareSubscriber stop](self->_wasPHSOverNAN, "stop");
    *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 256;
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber Stopped PHS over NAN Subscriber");
    objc_autoreleasePoolPop(v4);
  }
}

- (void)stopSubscriberAsNoNetworkFound
{
  void *v3;
  id v4;
  id location;

  if (!-[WiFiHotspotNANInterface isSubscriberStopped](self, "isSubscriberStopped"))
  {
    -[WiFiAwareSubscriber stop](self->_wasPHSOverNAN, "stop");
    *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 256;
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber stopSubscriberAsNoNetworkFound");
    objc_autoreleasePoolPop(v3);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    v4 = objc_initWeak(&location, self);
    if (-[WiFiHotspotNANInterface staDatapathEstablishedcallback](self, "staDatapathEstablishedcallback"))
      ((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *, void *, _QWORD, _QWORD, int))-[WiFiHotspotNANInterface staDatapathEstablishedcallback](self, "staDatapathEstablishedcallback"))(0, 0, 0, 0, 0, -[WiFiHotspotNANInterface linkEstablishedCallbackContext](self, "linkEstablishedCallbackContext"), -[WiFiHotspotNANInterface nanAssocData](self, "nanAssocData"), -[WiFiHotspotNANInterface isAutoJoined](self, "isAutoJoined"), 0, 3);

    objc_destroyWeak(&location);
  }
}

- (BOOL)isSessionTerminated
{
  return self->_sessionTerminated;
}

- (BOOL)isSubscriberStopped
{
  return self->_subscriberStopped;
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *pwdList;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  WiFiAwareDiscoveryResult *waDiscoveryResult;
  void *v19;
  WiFiAwareDataSession *v20;
  WiFiAwareDataSession *waDataSession;
  void *v22;
  void *v23;
  void *v24;
  WiFiAwareSubscriber *wasPHSOverNAN;
  id v26;

  v26 = a3;
  v6 = a4;
  if (self->_clientAssociated && !self->_subscriberStoppedCallbackRcvd && (wasPHSOverNAN = self->_wasPHSOverNAN) != 0)
  {
    -[WiFiAwareSubscriber stop](wasPHSOverNAN, "stop");
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceSpecificInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
      objc_msgSend(v8, "WFLog:message:", 3, "WiFiAwareSubscriber receivedDiscoveryResult with instance name %@ , service name %@", v10, v11);

    }
    objc_autoreleasePoolPop(v7);
    pwdList = self->_pwdList;
    if (pwdList && -[NSMutableArray count](pwdList, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "configuration"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serviceName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if (v16)
      {
        objc_storeStrong((id *)&self->_waDiscoveryResult, a4);
        v17 = objc_alloc((Class)WiFiAwareDataSession);
        waDiscoveryResult = self->_waDiscoveryResult;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_pwdList, "objectAtIndexedSubscript:", 0));
        v20 = (WiFiAwareDataSession *)objc_msgSend(v17, "initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:", waDiscoveryResult, 1, 0, v19);
        waDataSession = self->_waDataSession;
        self->_waDataSession = v20;

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiAwareInternetSharingConfiguration requestInterentFromResponder](WiFiAwareInternetSharingConfiguration, "requestInterentFromResponder"));
        -[WiFiAwareDataSession setInternetSharingConfiguration:](self->_waDataSession, "setInternetSharingConfiguration:", v22);

        v23 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber requestedInternetFromResponder");
        objc_autoreleasePoolPop(v23);
        -[WiFiAwareDataSession setDelegate:](self->_waDataSession, "setDelegate:", self);
        self->_current_rssi = (int64_t)-[WiFiAwareDiscoveryResult rssi](self->_waDiscoveryResult, "rssi");
        -[WiFiAwareDataSession start](self->_waDataSession, "start");
      }
    }
    else
    {
      v24 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber require passphrase");
      objc_autoreleasePoolPop(v24);
      -[WiFiHotspotNANInterface stopSubscriberForPHSOverNAN](self, "stopSubscriberForPHSOverNAN");
    }
  }

}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a5;
  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber lostDiscoveryResult stopping Subscriber now!");
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "stop");
  self->_subscriberStopped = 1;

}

- (void)dataSessionRequestStarted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_sessionTerminated = 0;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDataAddress"));
    objc_msgSend(v5, "WFLog:message:", 3, "WiFiAwareDataSession started, self nan data macAddress %@", v6);

  }
  objc_autoreleasePoolPop(v4);

}

- (void)dataSession:(id)a3 updatedPeerRSSI:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  self->_current_rssi = (int)v4;
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareDataSession updated Peer RSSI:%d", v4, v7);
  objc_autoreleasePoolPop(v6);

}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareDataSession failed to start with errorString=%d", a4, v7);
  objc_autoreleasePoolPop(v6);
  -[WiFiAwareSubscriber stop](self->_wasPHSOverNAN, "stop");
  *(_WORD *)&self->_subscriberStoppedCallbackRcvd = 256;

}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  void *v6;
  NSDictionary *curNetworkRecord;
  void *v8;
  NSString *v9;
  NSString *networkSsid;
  NSString *v11;
  NSString *networkMacAddr;
  NSString *v13;
  NSString *lastAssociatedNetworkServiceName;
  void *v15;
  id v16;

  v16 = a3;
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareDataSession terminated with reasonString=%d", a4);
  objc_autoreleasePoolPop(v6);
  self->_sessionTerminated = 1;
  if (-[WiFiHotspotNANInterface staDatapathTerminatedcallback](self, "staDatapathTerminatedcallback"))
    ((void (*)(NSString *, NSString *, int64_t, NSString *, int64_t, void *))-[WiFiHotspotNANInterface staDatapathTerminatedcallback](self, "staDatapathTerminatedcallback"))(self->_networkMacAddr, self->_networkSsid, self->_current_rssi, self->_subscriber_ifname, a4, -[WiFiHotspotNANInterface linkTerminatedCallbackContext](self, "linkTerminatedCallbackContext"));
  self->_clientAssociated = 0;
  curNetworkRecord = self->_curNetworkRecord;
  self->_curNetworkRecord = 0;

  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "NANPHS: did we hold off for starting subscriber %d \n", self->_subscriberHeldOffForPreviousDP);
  objc_autoreleasePoolPop(v8);
  if (self->_subscriberHeldOffForPreviousDP && self->_networkSsidNext && self->_networkMacAddrNext)
  {
    v9 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", self->_networkSsidNext);
    networkSsid = self->_networkSsid;
    self->_networkSsid = v9;

    v11 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", self->_networkMacAddrNext);
    networkMacAddr = self->_networkMacAddr;
    self->_networkMacAddr = v11;

    -[WiFiAwareSubscriber start](self->_wasPHSOverNAN, "start");
    self->_subscriberStopped = 0;
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[WiFiAwareSubscribeConfiguration serviceName](self->_wasCfg, "serviceName"));
    lastAssociatedNetworkServiceName = self->_lastAssociatedNetworkServiceName;
    self->_lastAssociatedNetworkServiceName = v13;

    v15 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "NANPHS: Started PHS over NAN Subscribe for SSID [%@] MacAddress [%@]", self->_networkSsid, self->_networkMacAddr);
    objc_autoreleasePoolPop(v15);
    self->_subscriberHeldOffForPreviousDP = 0;
  }

}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSDictionary *curNetworkRecord;
  id v13;
  _WORD *v14;
  void *v15;
  void *v16;
  int v17;
  CFStringRef v18;
  NSString *v19;
  NSString *subscriber_ifname;
  void *v21;
  WiFiAwareDataSession *waDataSession;
  _QWORD v23[5];
  id v24;
  id location;
  int v26;
  __int16 v27;
  char cStr[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareDataSession confirmedForPeer");
  objc_autoreleasePoolPop(v11);
  self->_clientAssociated = 1;
  curNetworkRecord = self->_curNetworkRecord;
  self->_curNetworkRecord = 0;

  v27 = 0;
  v26 = 0;
  memset(cStr, 170, sizeof(cStr));
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data")));
  v14 = objc_msgSend(v13, "bytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
  if ((unint64_t)objc_msgSend(v15, "length") >= 6)
  {
    v17 = *(_DWORD *)v14;
    v27 = v14[2];
    v26 = v17;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    __memcpy_chk(&v26, v14, objc_msgSend(v16, "length"), 6);

  }
  -[WiFiAwareSubscriber stop](self->_wasPHSOverNAN, "stop");
  self->_subscriberStoppedCallbackRcvd = 0;
  if (-[WiFiHotspotNANInterface subscriberCancelTimerCallback](self, "subscriberCancelTimerCallback"))
    ((void (*)(void *))-[WiFiHotspotNANInterface subscriberCancelTimerCallback](self, "subscriberCancelTimerCallback"))(-[WiFiHotspotNANInterface subscriberCancelTimerCallbackContext](self, "subscriberCancelTimerCallbackContext"));
  self->_subscriber_ifindex = objc_msgSend(v8, "localInterfaceIndex");
  if (if_indextoname(-[WiFiHotspotNANInterface subscriber_ifindex](self, "subscriber_ifindex"), cStr))
  {
    v18 = CFStringCreateWithCString(0, cStr, 0x600u);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue(v18);
    subscriber_ifname = self->_subscriber_ifname;
    self->_subscriber_ifname = v19;

  }
  else
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s if_indextoname() Failed to get ifname for index:%d \n", "-[WiFiHotspotNANInterface dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:]", self->_subscriber_ifindex);
    objc_autoreleasePoolPop(v21);
  }
  -[WiFiAwareDataSession setWantsPeerRSSIUpdates:withCompletionHandler:](self->_waDataSession, "setWantsPeerRSSIUpdates:withCompletionHandler:", 1, &stru_100230E80);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  waDataSession = self->_waDataSession;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000BE7F4;
  v23[3] = &unk_100230EA8;
  v23[4] = self;
  objc_copyWeak(&v24, &location);
  -[WiFiAwareDataSession generateCurrentNetworkRecordForInternetSharingSession:](waDataSession, "generateCurrentNetworkRecordForInternetSharingSession:", v23);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (unsigned)isHotspotDeviceSupportNAN:(__CFString *)a3 withCFStringRef:(__CFString *)a4
{
  void *v6;
  unsigned int v7;
  void *v8;
  const char *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("iPhone10,6"), CFSTR("iPhone11,8"), CFSTR("iPhone12,5"), CFSTR("iPhone13,2"), CFSTR("iPhone13,4"), 0));
  v7 = objc_msgSend(v6, "containsObject:", a3);
  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
  {
    if (v7)
      v9 = "Device model %@ with OS version %@ supports NAN based PHS ";
    else
      v9 = "Device model %@ with OS version %@ does not support NAN based PHS ";
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, v9, a3, a4);
  }
  objc_autoreleasePoolPop(v8);

  return v7;
}

- (void)createWAPConfig:(id)a3
{
  WiFiAwarePublishConfiguration *v4;
  WiFiAwarePublishConfiguration *wapCfg;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (WiFiAwarePublishConfiguration *)objc_msgSend(objc_alloc((Class)WiFiAwarePublishConfiguration), "initWithServiceName:", v8);
  wapCfg = self->_wapCfg;
  self->_wapCfg = v4;

  if (self->_wapCfg)
  {
    v6 = objc_alloc_init((Class)WiFiAwarePublishServiceSpecificInfo);
    -[WiFiAwarePublishConfiguration setServiceSpecificInfo:](self->_wapCfg, "setServiceSpecificInfo:", v6);
    -[WiFiAwarePublishConfiguration setFurtherServiceDiscoveryRequired:](self->_wapCfg, "setFurtherServiceDiscoveryRequired:", 0);
    -[WiFiAwarePublishConfiguration setAuthenticationType:](self->_wapCfg, "setAuthenticationType:", 0);

  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to create WiFiAwarePublishConfiguration", "-[WiFiHotspotNANInterface createWAPConfig:]");
    objc_autoreleasePoolPop(v7);
  }

}

- (void)setPasswordForPHSOverNAN:(__CFString *)a3
{
  void *v5;

  if (a3)
  {
    -[NSMutableArray removeAllObjects](self->_pwdList, "removeAllObjects");
    -[NSMutableArray addObject:](self->_pwdList, "addObject:", a3);
  }
  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: null password", "-[WiFiHotspotNANInterface setPasswordForPHSOverNAN:]");
    objc_autoreleasePoolPop(v5);
  }
}

- (void)setDataPathSecCfgForPHSOverNAN:(int64_t)a3
{
  id v5;
  id v6;

  v6 = objc_msgSend(objc_alloc((Class)WiFiAwarePublishDatapathSecurityConfiguration), "initWithPMKList:passphraseList:", &__NSArray0__struct, self->_pwdList);
  v5 = objc_msgSend(objc_alloc((Class)WiFiAwarePublishDatapathConfiguration), "initWithServiceType:securityConfiguration:", a3, v6);
  -[WiFiAwarePublishConfiguration setDatapathConfiguration:](self->_wapCfg, "setDatapathConfiguration:", v5);

}

- (void)setDeviceNameForPHSOverNAN:(__CFString *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwarePublishConfiguration serviceSpecificInfo](self->_wapCfg, "serviceSpecificInfo"));
  objc_msgSend(v4, "setInstanceName:", a3);

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "MIS deviceName set to %@ \n", a3);
  objc_autoreleasePoolPop(v5);
}

- (void)stopPublisherForPHSOverNAN
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  WiFiAwarePublisher *wapPHSOverNAN;
  NSMutableDictionary *wapDataSessionHandles;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_wapDataSessionHandles, "allKeys"));
  self->_nanPublisherState = 3;
  v13 = v3;
  if ((int)objc_msgSend(v3, "count") >= 1)
  {
    v4 = 0;
    do
    {
      v5 = objc_autoreleasePoolPush();
      v6 = (void *)qword_10026DD20;
      if (qword_10026DD20)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v4));
        objc_msgSend(v6, "WFLog:message:", 3, "NANPHS: Stopping NAN-DP of address: %@ ", v7);

      }
      objc_autoreleasePoolPop(v5);
      wapPHSOverNAN = self->_wapPHSOverNAN;
      wapDataSessionHandles = self->_wapDataSessionHandles;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v4));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](wapDataSessionHandles, "objectForKey:", v10));
      -[WiFiAwarePublisher terminateDataSession:completionHandler:](wapPHSOverNAN, "terminateDataSession:completionHandler:", v11, 0);

      ++v4;
    }
    while (v4 < (int)objc_msgSend(v13, "count"));
  }
  -[WiFiAwarePublisher stop](self->_wapPHSOverNAN, "stop");
  v12 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Stopping PHS over NAN Publish");
  objc_autoreleasePoolPop(v12);

}

- (unsigned)isNANPublisherStarted
{
  return self->_nanPublisherState - 1 < 2;
}

- (void)startPublisherForPHSOverNAN
{
  void *v3;
  WiFiAwarePublisher *v4;
  WiFiAwarePublisher *wapPHSOverNAN;
  void *v6;

  self->_nanPublisherState = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiAwareInternetSharingConfiguration provideInternetToInitiatorsFromInterface:](WiFiAwareInternetSharingConfiguration, "provideInternetToInitiatorsFromInterface:", CFSTR("pdp_ip0")));
  -[WiFiAwarePublishConfiguration setInternetSharingConfiguration:](self->_wapCfg, "setInternetSharingConfiguration:", v3);

  v4 = (WiFiAwarePublisher *)objc_msgSend(objc_alloc((Class)WiFiAwarePublisher), "initWithConfiguration:", self->_wapCfg);
  wapPHSOverNAN = self->_wapPHSOverNAN;
  self->_wapPHSOverNAN = v4;

  -[WiFiAwarePublisher setDelegate:](self->_wapPHSOverNAN, "setDelegate:", self);
  -[WiFiAwarePublisher start](self->_wapPHSOverNAN, "start");
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Starting PHS over NAN Publish");
  objc_autoreleasePoolPop(v6);
}

- (void)createWASConfig:(id)a3
{
  WiFiAwareSubscribeConfiguration *v4;
  WiFiAwareSubscribeConfiguration *wasCfg;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (WiFiAwareSubscribeConfiguration *)objc_msgSend(objc_alloc((Class)WiFiAwareSubscribeConfiguration), "initWithServiceName:", v8);
  wasCfg = self->_wasCfg;
  self->_wasCfg = v4;

  v6 = v8;
  if (!self->_wasCfg)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "failed to create WiFiAwareSubscribeConfiguration");
    objc_autoreleasePoolPop(v7);
    v6 = v8;
  }

}

- (void)startSubscriberForPHSOverNAN:(id)a3 networkMacAddress:(id)a4
{
  id v6;
  WiFiAwareSubscriber *v7;
  WiFiAwareSubscriber *wasPHSOverNAN;
  void *v9;
  void *v10;
  NSString *lastAssociatedNetworkServiceName;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  int *p_macRandomizationTransactionState;
  void *v16;
  void *v17;
  void *v18;
  Block_layout *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *networkSsidNext;
  NSString *v27;
  NSString *networkMacAddrNext;
  NSString *v29;
  NSString *networkSsid;
  NSString *v31;
  NSString *networkMacAddr;
  NSString *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  id v40;

  v40 = a3;
  v6 = a4;
  if (!v40)
  {
    v37 = objc_autoreleasePoolPush();
    v38 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v39 = "networkSsid is NULL";
LABEL_34:
      objc_msgSend(v38, "WFLog:message:", 3, v39);
    }
LABEL_35:
    v36 = v37;
LABEL_28:
    objc_autoreleasePoolPop(v36);
    goto LABEL_29;
  }
  if (!v6)
  {
    v37 = objc_autoreleasePoolPush();
    v38 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v39 = "networkMacAddr is NULL";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  -[WiFiAwareSubscribeConfiguration setAuthenticationType:](self->_wasCfg, "setAuthenticationType:", 0);
  v7 = (WiFiAwareSubscriber *)objc_msgSend(objc_alloc((Class)WiFiAwareSubscriber), "initWithConfiguration:", self->_wasCfg);
  wasPHSOverNAN = self->_wasPHSOverNAN;
  self->_wasPHSOverNAN = v7;

  -[WiFiAwareSubscriber setDelegate:](self->_wasPHSOverNAN, "setDelegate:", self);
  v9 = objc_autoreleasePoolPush();
  v10 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    lastAssociatedNetworkServiceName = self->_lastAssociatedNetworkServiceName;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwareSubscribeConfiguration serviceName](self->_wasCfg, "serviceName"));
    objc_msgSend(v10, "WFLog:message:", 3, "WiFiAwareSubscriber _lastAssociatedNetworkServiceName %@ currentServicename %@ ", lastAssociatedNetworkServiceName, v12);

  }
  objc_autoreleasePoolPop(v9);
  if (self->_lastAssociatedNetworkServiceName
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiAwareSubscribeConfiguration serviceName](self->_wasCfg, "serviceName")),
        v14 = objc_msgSend(v13, "isEqualToString:", self->_lastAssociatedNetworkServiceName),
        v13,
        (v14 & 1) != 0))
  {
    p_macRandomizationTransactionState = &self->_macRandomizationTransactionState;
    if ((self->_macRandomizationTransactionState | 2) != 2)
      goto LABEL_21;
    v16 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber Enabling mac randomization, starting P2P transaction");
    objc_autoreleasePoolPop(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiP2PSPITransactionRequestor shared](WiFiP2PSPITransactionRequestor, "shared"));
    v18 = v17;
    v19 = &stru_100230F28;
  }
  else
  {
    p_macRandomizationTransactionState = &self->_macRandomizationTransactionState;
    if ((self->_macRandomizationTransactionState | 2) == 2)
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber Enabling mac randomization, starting P2P transaction");
      objc_autoreleasePoolPop(v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiP2PSPITransactionRequestor shared](WiFiP2PSPITransactionRequestor, "shared"));
      v18 = v17;
      v19 = &stru_100230EC8;
    }
    else
    {
      v21 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber Disabling mac randomization, ending P2P transaction");
      objc_autoreleasePoolPop(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiP2PSPITransactionRequestor shared](WiFiP2PSPITransactionRequestor, "shared"));
      objc_msgSend(v22, "endTransaction:completionHandler:", 16, &stru_100230EE8);

      v23 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "WiFiAwareSubscriber Enabling mac randomization, starting P2P transaction");
      objc_autoreleasePoolPop(v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiP2PSPITransactionRequestor shared](WiFiP2PSPITransactionRequestor, "shared"));
      v18 = v17;
      v19 = &stru_100230F08;
    }
  }
  objc_msgSend(v17, "beginTransaction:completionHandler:", 16, v19);

  *p_macRandomizationTransactionState = 1;
LABEL_21:
  if (!self->_clientAssociated)
  {
    v29 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v40);
    networkSsid = self->_networkSsid;
    self->_networkSsid = v29;

    v31 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v6);
    networkMacAddr = self->_networkMacAddr;
    self->_networkMacAddr = v31;

    -[WiFiAwareSubscriber start](self->_wasPHSOverNAN, "start");
    self->_subscriberStopped = 0;
    v33 = (NSString *)objc_claimAutoreleasedReturnValue(-[WiFiAwareSubscribeConfiguration serviceName](self->_wasCfg, "serviceName"));
    v34 = self->_lastAssociatedNetworkServiceName;
    self->_lastAssociatedNetworkServiceName = v33;

    v35 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "NANPHS: Started PHS over NAN Subscribe for SSID [%@] MacAddress [%@]", self->_networkSsid, self->_networkMacAddr);
    v36 = v35;
    goto LABEL_28;
  }
  v24 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "NANPHS: holding off for starting subscriber until DP terminate \n");
  objc_autoreleasePoolPop(v24);
  v25 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v40);
  networkSsidNext = self->_networkSsidNext;
  self->_networkSsidNext = v25;

  v27 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v6);
  networkMacAddrNext = self->_networkMacAddrNext;
  self->_networkMacAddrNext = v27;

  self->_subscriberHeldOffForPreviousDP = 1;
LABEL_29:

}

- (BOOL)checkDeviceNanCapabilities
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiAwareDeviceCapabilities currentDeviceCapabilities](WiFiAwareDeviceCapabilities, "currentDeviceCapabilities"));
  v3 = v2 != 0;

  return v3;
}

- (void)setLastAssociatedServiceName:(id)a3
{
  -[WiFiHotspotNANInterface setLastAssociatedNetworkServiceName:](self, "setLastAssociatedNetworkServiceName:", a3);
}

- (WiFiAwareSubscriber)wasPHSOverNAN
{
  return (WiFiAwareSubscriber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWasPHSOverNAN:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (WiFiAwareDataSession)waDataSession
{
  return (WiFiAwareDataSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWaDataSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (WiFiAwarePublisher)wapPHSOverNAN
{
  return (WiFiAwarePublisher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWapPHSOverNAN:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (WiFiAwarePublishConfiguration)wapCfg
{
  return (WiFiAwarePublishConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWapCfg:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (WiFiAwareSubscribeConfiguration)wasCfg
{
  return (WiFiAwareSubscribeConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWasCfg:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (WiFiAwareDiscoveryResult)waDiscoveryResult
{
  return (WiFiAwareDiscoveryResult *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWaDiscoveryResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (WiFiAwareDiscoveryResult)waDiscoveryResultCrashRecovery
{
  return (WiFiAwareDiscoveryResult *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWaDiscoveryResultCrashRecovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (WiFiAwarePublisherDataSessionHandle)wapDataSession
{
  return (WiFiAwarePublisherDataSessionHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWapDataSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)wapDataSessionHandles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWapDataSessionHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)pwdList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPwdList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)networkSsid
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNetworkSsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)networkSsidNext
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNetworkSsidNext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)networkMacAddrNext
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNetworkMacAddrNext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)lastAssociatedNetworkServiceName
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastAssociatedNetworkServiceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)networkMacAddr
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNetworkMacAddr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (unsigned)subscriber_ifindex
{
  return self->_subscriber_ifindex;
}

- (int64_t)current_rssi
{
  return self->_current_rssi;
}

- (NSString)subscriber_ifname
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSDictionary)curNetworkRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCurNetworkRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void)setSessionTerminated:(BOOL)a3
{
  self->_sessionTerminated = a3;
}

- (void)setClientAssociated:(BOOL)a3
{
  self->_clientAssociated = a3;
}

- (BOOL)subscriberStoppedCallbackRcvd
{
  return self->_subscriberStoppedCallbackRcvd;
}

- (void)setSubscriberStoppedCallbackRcvd:(BOOL)a3
{
  self->_subscriberStoppedCallbackRcvd = a3;
}

- (void)setSubscriberStopped:(BOOL)a3
{
  self->_subscriberStopped = a3;
}

- (BOOL)subscriberHeldOffForPreviousDP
{
  return self->_subscriberHeldOffForPreviousDP;
}

- (void)setSubscriberHeldOffForPreviousDP:(BOOL)a3
{
  self->_subscriberHeldOffForPreviousDP = a3;
}

- (int)macRandomizationTransactionState
{
  return self->_macRandomizationTransactionState;
}

- (void)setMacRandomizationTransactionState:(int)a3
{
  self->_macRandomizationTransactionState = a3;
}

- (unsigned)nanPublisherState
{
  return self->_nanPublisherState;
}

- (void)setNanPublisherState:(unsigned int)a3
{
  self->_nanPublisherState = a3;
}

- (void)staLeavecallback
{
  return self->_staLeavecallback;
}

- (void)setStaLeavecallback:(void *)a3
{
  self->_staLeavecallback = a3;
}

- (void)staArrivecallback
{
  return self->_staArrivecallback;
}

- (void)setStaArrivecallback:(void *)a3
{
  self->_staArrivecallback = a3;
}

- (void)publisherMetricsCallback
{
  return self->_publisherMetricsCallback;
}

- (void)setPublisherMetricsCallback:(void *)a3
{
  self->_publisherMetricsCallback = a3;
}

- (void)publisherMetricsCallbackContext
{
  return self->_publisherMetricsCallbackContext;
}

- (void)setPublisherMetricsCallbackContext:(void *)a3
{
  self->_publisherMetricsCallbackContext = a3;
}

- (void)subscriberMetricsCallback
{
  return self->_subscriberMetricsCallback;
}

- (void)setSubscriberMetricsCallback:(void *)a3
{
  self->_subscriberMetricsCallback = a3;
}

- (void)subscriberMetricsCallbackContext
{
  return self->_subscriberMetricsCallbackContext;
}

- (void)setSubscriberMetricsCallbackContext:(void *)a3
{
  self->_subscriberMetricsCallbackContext = a3;
}

- (void)subscriberCancelTimerCallback
{
  return self->_subscriberCancelTimerCallback;
}

- (void)setSubscriberCancelTimerCallback:(void *)a3
{
  self->_subscriberCancelTimerCallback = a3;
}

- (void)subscriberCancelTimerCallbackContext
{
  return self->_subscriberCancelTimerCallbackContext;
}

- (void)setSubscriberCancelTimerCallbackContext:(void *)a3
{
  self->_subscriberCancelTimerCallbackContext = a3;
}

- (void)staDatapathEstablishedcallback
{
  return self->_staDatapathEstablishedcallback;
}

- (void)setStaDatapathEstablishedcallback:(void *)a3
{
  self->_staDatapathEstablishedcallback = a3;
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (void)linkEstablishedCallbackContext
{
  return self->_linkEstablishedCallbackContext;
}

- (void)setLinkEstablishedCallbackContext:(void *)a3
{
  self->_linkEstablishedCallbackContext = a3;
}

- (void)establishedLinkNetwork
{
  return self->_establishedLinkNetwork;
}

- (void)setEstablishedLinkNetwork:(void *)a3
{
  self->_establishedLinkNetwork = a3;
}

- (void)nanAssocData
{
  return self->_nanAssocData;
}

- (void)setNanAssocData:(void *)a3
{
  self->_nanAssocData = a3;
}

- (unsigned)isAutoJoined
{
  return self->_isAutoJoined;
}

- (void)setIsAutoJoined:(unsigned __int8)a3
{
  self->_isAutoJoined = a3;
}

- (void)staDatapathTerminatedcallback
{
  return self->_staDatapathTerminatedcallback;
}

- (void)setStaDatapathTerminatedcallback:(void *)a3
{
  self->_staDatapathTerminatedcallback = a3;
}

- (void)linkTerminatedCallbackContext
{
  return self->_linkTerminatedCallbackContext;
}

- (void)setLinkTerminatedCallbackContext:(void *)a3
{
  self->_linkTerminatedCallbackContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curNetworkRecord, 0);
  objc_storeStrong((id *)&self->_subscriber_ifname, 0);
  objc_storeStrong((id *)&self->_networkMacAddr, 0);
  objc_storeStrong((id *)&self->_lastAssociatedNetworkServiceName, 0);
  objc_storeStrong((id *)&self->_networkMacAddrNext, 0);
  objc_storeStrong((id *)&self->_networkSsidNext, 0);
  objc_storeStrong((id *)&self->_networkSsid, 0);
  objc_storeStrong((id *)&self->_pwdList, 0);
  objc_storeStrong((id *)&self->_wapDataSessionHandles, 0);
  objc_storeStrong((id *)&self->_wapDataSession, 0);
  objc_storeStrong((id *)&self->_waDiscoveryResultCrashRecovery, 0);
  objc_storeStrong((id *)&self->_waDiscoveryResult, 0);
  objc_storeStrong((id *)&self->_wasCfg, 0);
  objc_storeStrong((id *)&self->_wapCfg, 0);
  objc_storeStrong((id *)&self->_wapPHSOverNAN, 0);
  objc_storeStrong((id *)&self->_waDataSession, 0);
  objc_storeStrong((id *)&self->_wasPHSOverNAN, 0);
}

@end

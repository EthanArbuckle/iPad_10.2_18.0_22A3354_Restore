@implementation WiFiAIRAgent

+ (id)sharedInstance
{
  void *v2;

  if (_os_feature_enabled_impl("WiFiManager", "AdaptiveInterfaceRanking"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiUserInteractionMonitor sharedInstance](WiFiUserInteractionMonitor, "sharedInstance"));

    if (v2)
    {
      if (qword_10026D530 != -1)
        dispatch_once(&qword_10026D530, &stru_10022E988);
    }
  }
  return (id)qword_10026D538;
}

- (id)_initPrivate
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiAIRAgent;
  result = -[WiFiAIRAgent init](&v3, "init");
  if (result)
    *((_WORD *)result + 12) = 0;
  return result;
}

- (void)setWiFiManagerQueue:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)&self->_sharedMgrQueue, a3);
  }
  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s without managerQueue", "-[WiFiAIRAgent setWiFiManagerQueue:]", 0);
    objc_autoreleasePoolPop(v5);
  }

}

- (void)_userInteractivityChangedCallback:(unint64_t)a3
{
  NSObject *sharedMgrQueue;
  _QWORD v4[6];

  sharedMgrQueue = self->_sharedMgrQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100033AE4;
  v4[3] = &unk_10022E9B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(sharedMgrQueue, v4);
}

- (unint64_t)convertFromNWReliabilityMonitorResult:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_1001BB0C0[a3 - 1];
}

- (void)waitForConfirmationWithTimeout:(__WiFiNetwork *)a3 withBssEnvironment:(int)a4 withMgrCallback:(id)a5
{
  id v8;
  id v9;
  id mgrCallback;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  WiFiNWReliabilityMonitor *v15;
  WiFiNWReliabilityMonitor *monitor;
  WiFiNWReliabilityMonitor *v17;
  void *v18;
  WiFiAIRAgent *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v8 = a5;
  v9 = objc_msgSend(v8, "copy");
  mgrCallback = self->_mgrCallback;
  self->_mgrCallback = v9;

  self->_isEvalInProgress = 1;
  v11 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: AIR agent received a request", "-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]");
  objc_autoreleasePoolPop(v11);
  if (!self->_sharedMgrQueue)
  {
    v18 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: managerQueue is not SET", "-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]");
    objc_autoreleasePoolPop(v18);
    goto LABEL_11;
  }
  if ((a4 & 0xFFFFFFFD) != 4)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: not a multi-AP environment", "-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]");
    objc_autoreleasePoolPop(v21);
    v19 = self;
    v20 = 3;
    goto LABEL_18;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiUserInteractionMonitor sharedInstance](WiFiUserInteractionMonitor, "sharedInstance"));
  v13 = objc_msgSend(v12, "isRealTimeAppActive");

  if ((v13 & 1) == 0)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: no realtime app active", "-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]");
    objc_autoreleasePoolPop(v22);
    v19 = self;
    v20 = 4;
    goto LABEL_18;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiUserInteractionMonitor sharedInstance](WiFiUserInteractionMonitor, "sharedInstance"));
  objc_msgSend(v14, "registerStateChangeCallback:withCallbackContext:", &stru_10022E9F0, self);

  self->_cbRegisteredWithUserActivity = 1;
  v15 = -[WiFiNWReliabilityMonitor initWithManagerQueue:]([WiFiNWReliabilityMonitor alloc], "initWithManagerQueue:", self->_sharedMgrQueue);
  monitor = self->_monitor;
  self->_monitor = v15;

  v17 = self->_monitor;
  if (!v17)
  {
LABEL_11:
    v19 = self;
    v20 = 2;
LABEL_18:
    -[WiFiAIRAgent _evaluationComplete:](v19, "_evaluationComplete:", v20);
    goto LABEL_19;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100033EB8;
  v23[3] = &unk_10022EA18;
  v23[4] = self;
  -[WiFiNWReliabilityMonitor waitForNetworkToBeReliableWithTimeout:withTimeout:withMgrCallback:](v17, "waitForNetworkToBeReliableWithTimeout:withTimeout:withMgrCallback:", a3, 60, v23);
LABEL_19:

}

- (void)terminateRequest
{
  -[WiFiNWReliabilityMonitor terminateNetworkReliabilityEvaluation](self->_monitor, "terminateNetworkReliabilityEvaluation");
  -[WiFiAIRAgent _evaluationComplete:](self, "_evaluationComplete:", 6);
}

- (void)_evaluationComplete:(unint64_t)a3
{
  void *v5;
  void *v6;
  WiFiNWReliabilityMonitor *monitor;
  void (**mgrCallback)(id, unint64_t);

  if (self->_isEvalInProgress)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: AIR agent request complete with result:%lu", "-[WiFiAIRAgent _evaluationComplete:]", a3);
    objc_autoreleasePoolPop(v5);
    self->_isEvalInProgress = 0;
    if (self->_cbRegisteredWithUserActivity)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiUserInteractionMonitor sharedInstance](WiFiUserInteractionMonitor, "sharedInstance"));
      objc_msgSend(v6, "unregisterStateChangeCallback:", self);

      self->_cbRegisteredWithUserActivity = 0;
    }
    monitor = self->_monitor;
    if (monitor)
    {
      self->_monitor = 0;

    }
    mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
    if (mgrCallback)
    {
      if (a3 != 6)
      {
        mgrCallback[2](mgrCallback, a3);
        mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
      }
      self->_mgrCallback = 0;

    }
  }
}

- (BOOL)isInterfaceRankingInProgress
{
  return self->_isEvalInProgress;
}

- (void)processRoamEvent:(__WiFiNetwork *)a3
{
  WiFiNWReliabilityMonitor *monitor;

  if (-[WiFiAIRAgent isInterfaceRankingInProgress](self, "isInterfaceRankingInProgress"))
  {
    monitor = self->_monitor;
    if (monitor)
      -[WiFiNWReliabilityMonitor processRoamEvent:](monitor, "processRoamEvent:", a3);
  }
}

- (void)ingestLQMUpdate:(id)a3
{
  WiFiNWReliabilityMonitor *monitor;
  id v5;

  v5 = a3;
  if (-[WiFiAIRAgent isInterfaceRankingInProgress](self, "isInterfaceRankingInProgress"))
  {
    monitor = self->_monitor;
    if (monitor)
      -[WiFiNWReliabilityMonitor ingestLQMUpdate:](monitor, "ingestLQMUpdate:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mgrCallback, 0);
  objc_storeStrong((id *)&self->_sharedMgrQueue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end

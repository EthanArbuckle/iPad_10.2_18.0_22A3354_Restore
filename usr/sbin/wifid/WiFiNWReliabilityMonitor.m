@implementation WiFiNWReliabilityMonitor

- (WiFiNWReliabilityMonitor)initWithManagerQueue:(id)a3
{
  id v5;
  WiFiNWReliabilityMonitor *v6;
  WiFiNWReliabilityMonitor *v7;
  uint64_t v8;
  NSMutableArray *sessions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiNWReliabilityMonitor;
  v6 = -[WiFiNWReliabilityMonitor init](&v11, "init");
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_sharedMgrQueue, a3), !v7->_sharedMgrQueue)
    || (v7->_metrics = 1,
        *(_WORD *)&v7->_isEvalInProgress = 0,
        v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array")),
        sessions = v7->_sessions,
        v7->_sessions = (NSMutableArray *)v8,
        sessions,
        !v7->_sessions))
  {

    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[WiFiNWReliabilityMonitor _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)WiFiNWReliabilityMonitor;
  -[WiFiNWReliabilityMonitor dealloc](&v3, "dealloc");
}

- (void)waitForNetworkToBeReliableWithTimeout:(__WiFiNetwork *)a3 withTimeout:(unint64_t)a4 withMgrCallback:(id)a5
{
  id v8;
  id v9;
  id mgrCallback;
  void *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *timer;
  NSObject *v14;
  WiFiNWReliabilityMonitorSession *v15;
  NSDate *v16;
  NSDate *learningStartTimestamp;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD v21[7];
  _QWORD handler[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v9 = objc_msgSend(v8, "copy");
  mgrCallback = self->_mgrCallback;
  self->_mgrCallback = v9;

  self->_isEvalInProgress = 1;
  v11 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: kickstarting network reliability learning", "-[WiFiNWReliabilityMonitor waitForNetworkToBeReliableWithTimeout:withTimeout:withMgrCallback:]");
  objc_autoreleasePoolPop(v11);
  v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_sharedMgrQueue);
  timer = self->_timer;
  self->_timer = v12;

  v14 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100032CC0;
  handler[3] = &unk_10022E8F8;
  handler[4] = self;
  dispatch_source_set_cancel_handler(v14, handler);
  v15 = -[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]([WiFiNWReliabilityMonitorSession alloc], "initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:", a3, self->_metrics, 20, 16);
  if (v15)
  {
    -[NSMutableArray insertObject:atIndex:](self->_sessions, "insertObject:atIndex:", v15, 0);
    objc_storeStrong((id *)&self->_activeSession, v15);
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    learningStartTimestamp = self->_learningStartTimestamp;
    self->_learningStartTimestamp = v16;

    v18 = self->_timer;
    v19 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v18, v19, 0x2540BE400uLL, 0xE8D4A51000uLL);
    v20 = self->_timer;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100032CD0;
    v21[3] = &unk_10022E920;
    v21[4] = self;
    v21[5] = &v23;
    v21[6] = a4;
    dispatch_source_set_event_handler(v20, v21);
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  else
  {
    v24[3] = 2;
    -[WiFiNWReliabilityMonitor _evaluationComplete:](self, "_evaluationComplete:", 2);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)terminateNetworkReliabilityEvaluation
{
  -[WiFiNWReliabilityMonitor _evaluationComplete:](self, "_evaluationComplete:", 3);
}

- (void)_cleanup
{
  NSObject *timer;
  WiFiNWReliabilityMonitorSession *activeSession;

  if (self->_isEvalInProgress)
  {
    self->_isEvalInProgress = 0;
    timer = self->_timer;
    if (timer)
      dispatch_source_cancel(timer);
    -[NSMutableArray removeAllObjects](self->_sessions, "removeAllObjects");
    activeSession = self->_activeSession;
    if (activeSession)
    {
      self->_activeSession = 0;

    }
  }
}

- (void)_evaluationComplete:(unint64_t)a3
{
  void *v5;
  void (**mgrCallback)(id, unint64_t);

  if (self->_isEvalInProgress)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: network reliability evaluation complete with result:%lu", "-[WiFiNWReliabilityMonitor _evaluationComplete:]", a3);
    objc_autoreleasePoolPop(v5);
    -[WiFiNWReliabilityMonitor _cleanup](self, "_cleanup");
    mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
    if (a3 != 3)
    {
      if (mgrCallback)
      {
        mgrCallback[2](mgrCallback, a3);
        mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
      }
    }
    self->_mgrCallback = 0;

  }
}

- (void)processRoamEvent:(__WiFiNetwork *)a3
{
  void *v5;
  WiFiNWReliabilityMonitorSession *activeSession;
  WiFiNWReliabilityMonitorSession *v7;
  WiFiNWReliabilityMonitorSession *obj;

  if (self->_isEvalInProgress)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: received roam event", "-[WiFiNWReliabilityMonitor processRoamEvent:]");
    objc_autoreleasePoolPop(v5);
    activeSession = self->_activeSession;
    self->_activeSession = 0;

    v7 = -[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]([WiFiNWReliabilityMonitorSession alloc], "initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:", a3, self->_metrics, 20, 16);
    if (v7)
    {
      obj = v7;
      -[NSMutableArray insertObject:atIndex:](self->_sessions, "insertObject:atIndex:", v7, 0);
      objc_storeStrong((id *)&self->_activeSession, obj);
      v7 = obj;
      self->_isRoamHappended = 1;
    }

  }
}

- (void)ingestLQMUpdate:(id)a3
{
  id v4;
  WiFiNWReliabilityMonitorSession *activeSession;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_isEvalInProgress)
  {
    activeSession = self->_activeSession;
    v7 = v4;
    if (activeSession)
    {
      -[WiFiNWReliabilityMonitorSession ingestLQMUpdate:](activeSession, "ingestLQMUpdate:", v4);
    }
    else
    {
      v6 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: active session is null, unexpected", "-[WiFiNWReliabilityMonitor ingestLQMUpdate:]");
      objc_autoreleasePoolPop(v6);
    }
    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mgrCallback, 0);
  objc_storeStrong((id *)&self->_learningStartTimestamp, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_sharedMgrQueue, 0);
}

@end

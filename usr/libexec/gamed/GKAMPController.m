@implementation GKAMPController

+ (id)controller
{
  if (qword_100318100 != -1)
    dispatch_once(&qword_100318100, &stru_1002C4570);
  return (id)qword_1003180F8;
}

- (GKAMPController)initWithHasAcknowledgedLatestGDPRBlock:(id)a3 bagChanged:(id)a4
{
  id v6;
  id v7;
  GKAMPController *v8;
  id v9;
  id hasAcknowledgedLatestGDPRBlock;
  id v11;
  id bagChanged;
  NSDictionary *metadata;
  dispatch_queue_t v14;
  OS_dispatch_queue *serialQueue;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKAMPController;
  v8 = -[GKAMPController init](&v17, "init");
  if (v8)
  {
    v9 = objc_retainBlock(v6);
    hasAcknowledgedLatestGDPRBlock = v8->_hasAcknowledgedLatestGDPRBlock;
    v8->_hasAcknowledgedLatestGDPRBlock = v9;

    v11 = objc_retainBlock(v7);
    bagChanged = v8->_bagChanged;
    v8->_bagChanged = v11;

    metadata = v8->_metadata;
    v8->_metadata = (NSDictionary *)&__NSDictionary0__struct;

    v14 = dispatch_queue_create("com.apple.GameKit.ampController.serialQueue", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v14;

  }
  return v8;
}

- (void)getBagWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100124420;
  v7[3] = &unk_1002BB758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)createBagIfNecessary
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  NSObject *v5;
  const char *label;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  void (**v19)(void);
  uint8_t buf[16];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  v5 = objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));

  if (v4 != v5)
  {
    label = dispatch_queue_get_label(v4);
    v7 = objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
    v8 = dispatch_queue_get_label(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKAMPController createBagIfNecessary]", label, v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/AMP/GKAMPController.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v10, "-[GKAMPController createBagIfNecessary]", objc_msgSend(v12, "UTF8String"), 91));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController bag](self, "bag"));
  if (!v14)
  {
    v16 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v17 = (id)GKOSLoggers(v15);
      v16 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Creating bag", buf, 2u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", CFSTR("GameCenterD"), CFSTR("1")));
    -[GKAMPController setBag:](self, "setBag:", v18);

    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[GKAMPController bagChanged](self, "bagChanged"));
    v19[2]();

  }
}

- (void)setupAsyncWithStoreBag:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124800;
  block[3] = &unk_1002BB568;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)updateMetadataWithLocalPlayer:(id)a3
{
  id v4;
  GKMetricsIntBucketer *v5;
  GKMetricsIntBucketer *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  int v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v4 = a3;
  if (v4)
  {
    v5 = -[GKMetricsIntBucketer initWithBuckets:]([GKMetricsIntBucketer alloc], "initWithBuckets:", &off_1002DC6E0);
    v6 = -[GKMetricsIntBucketer initWithBuckets:]([GKMetricsIntBucketer alloc], "initWithBuckets:", &off_1002DC6F8);
    v20[0] = CFSTR("friendCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKMetricsIntBucketer clamp:](v5, "clamp:", objc_msgSend(v4, "numberOfFriends"))));
    v20[1] = CFSTR("gameCount");
    v21[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKMetricsIntBucketer clamp:](v6, "clamp:", objc_msgSend(v4, "numberOfGames"))));
    v21[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    -[GKAMPController setMetadata:](self, "setMetadata:", v9);

    v11 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v12 = (id)GKOSLoggers(v10);
      v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metadata](self, "metadata"));
      v18 = 138412290;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updated metrics with metadata: %@", (uint8_t *)&v18, 0xCu);

    }
  }
  else
  {
    v15 = -[GKAMPController setMetadata:](self, "setMetadata:", 0);
    v16 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v17 = (id)GKOSLoggers(v15);
      v16 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Reset metrics metadata", (uint8_t *)&v18, 2u);
    }
  }

}

- (void)tearDown
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  NSObject *v5;
  const char *label;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  v5 = objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));

  if (v4 != v5)
  {
    label = dispatch_queue_get_label(v4);
    v7 = objc_claimAutoreleasedReturnValue(-[GKAMPController serialQueue](self, "serialQueue"));
    v8 = dispatch_queue_get_label(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKAMPController tearDown]", label, v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/AMP/GKAMPController.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]"), v10, "-[GKAMPController tearDown]", objc_msgSend(v12, "UTF8String"), 153));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = -[GKAMPController isSetup](self, "isSetup");
  if (v14)
  {
    v15 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v16 = (id)GKOSLoggers(v14);
      v15 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tearing down metrics", buf, 2u);
    }
    -[GKAMPController setMetricsPipeline:](self, "setMetricsPipeline:", 0);
    -[GKAMPController setMetrics:](self, "setMetrics:", 0);
  }
}

- (BOOL)isSetup
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metricsPipeline](self, "metricsPipeline"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metrics](self, "metrics"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)reportMetricsEventWithTopic:(id)a3 hostAppBundleId:(id)a4 shouldFlush:(id)a5 metricsFields:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint8_t v18[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v15 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v16 = (id)GKOSLoggers(v13);
    v15 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Metrics event added to queue", v18, 2u);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metricsPipeline](self, "metricsPipeline"));
  objc_msgSend(v17, "processEventWithTopic:shouldFlush:metricsFields:hostAppBundleId:completionHandler:", v10, objc_msgSend(v12, "BOOLValue"), v14, v11, &stru_1002C45F0);

}

- (void)reportClickStreamEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
  -[GKAMPController reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:](self, "reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:", GKReporterCSTopic, a3, &__kCFBooleanFalse, a4);
}

- (void)reportPerformanceEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
  -[GKAMPController reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:](self, "reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:", GKReporterClientPerformanceTopic, a3, &__kCFBooleanFalse, a4);
}

- (void)reportMultiplayerActivityEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController mafEventFilter](self, "mafEventFilter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001250C0;
  v10[3] = &unk_1002C2360;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "filterEventWithMetricsFields:completionHandler:", v7, v10);

}

- (void)reportLoadUrlMetricsEventWithMetricsFields:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKAMPController metadata](self, "metadata"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  v6 = GKDaemonIdentifier;
  v9[0] = CFSTR("app");
  v9[1] = CFSTR("topic");
  v7 = GKReporterGCPerformanceTopic;
  v10[0] = GKDaemonIdentifier;
  v10[1] = GKReporterGCPerformanceTopic;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  objc_msgSend(v4, "addEntriesFromDictionary:", v8);

  -[GKAMPController reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:](self, "reportMetricsEventWithTopic:hostAppBundleId:shouldFlush:metricsFields:", v7, v6, &__kCFBooleanFalse, v4);
}

- (AMSBag)bag
{
  return (AMSBag *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AMSMetrics)metrics
{
  return (AMSMetrics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (_TtC14GameDaemonCore17GKMetricsPipeline)metricsPipeline
{
  return (_TtC14GameDaemonCore17GKMetricsPipeline *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetricsPipeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (id)hasAcknowledgedLatestGDPRBlock
{
  return self->_hasAcknowledgedLatestGDPRBlock;
}

- (void)setHasAcknowledgedLatestGDPRBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)bagChanged
{
  return self->_bagChanged;
}

- (void)setBagChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (GKMultiplayerActivityEventFilter)mafEventFilter
{
  return self->_mafEventFilter;
}

- (void)setMafEventFilter:(id)a3
{
  objc_storeStrong((id *)&self->_mafEventFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mafEventFilter, 0);
  objc_storeStrong(&self->_bagChanged, 0);
  objc_storeStrong(&self->_hasAcknowledgedLatestGDPRBlock, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_metricsPipeline, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

- (void)reportURLSessionEventWithTask:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  GKAMPController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001B7D54(v6, v7);

}

@end

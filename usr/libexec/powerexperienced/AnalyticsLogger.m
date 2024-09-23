@implementation AnalyticsLogger

+ (id)logger
{
  if (qword_10001BDC8 != -1)
    dispatch_once(&qword_10001BDC8, &stru_100014400);
  return (id)qword_10001BDC0;
}

- (AnalyticsLogger)init
{
  AnalyticsLogger *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AnalyticsLogger;
  v2 = -[AnalyticsLogger init](&v7, "init");
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.powerexperienced.analytics.logger", v4);
  -[AnalyticsLogger setQueue:](v2, "setQueue:", v5);

  return v2;
}

- (void)logCAEventforMode:(id)a3 startDate:(id)a4 endDate:(id)a5 startingSOC:(id)a6 endingSOC:(id)a7 exitReason:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_claimAutoreleasedReturnValue(-[AnalyticsLogger queue](self, "queue"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100003960;
  v27[3] = &unk_100014450;
  v28 = v16;
  v29 = v15;
  v30 = v14;
  v31 = v19;
  v32 = v17;
  v33 = v18;
  v21 = v18;
  v22 = v17;
  v23 = v19;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  dispatch_async(v20, v27);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

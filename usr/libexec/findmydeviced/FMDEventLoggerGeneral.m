@implementation FMDEventLoggerGeneral

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DF1C;
  block[3] = &unk_1002C1228;
  block[4] = a1;
  if (qword_100306870 != -1)
    dispatch_once(&qword_100306870, block);
  return (id)qword_100306878;
}

- (FMDEventLoggerGeneral)init
{
  FMDEventLoggerGeneral *v2;
  NSMutableArray *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDEventLoggerGeneral;
  v2 = -[FMDEventLoggerGeneral init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    -[FMDEventLoggerGeneral setLoggedEvents:](v2, "setLoggedEvents:", v3);

    v4 = dispatch_queue_create("FMDEventLoggerGeneralQueue", 0);
    -[FMDEventLoggerGeneral setLogQueue:](v2, "setLogQueue:", v4);

  }
  return v2;
}

- (void)sendError:(id)a3 forEventName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[FMDEventLoggerGeneral logQueue](self, "logQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008E0CC;
  v11[3] = &unk_1002C21C8;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (NSMutableArray)loggedEvents
{
  return self->_loggedEvents;
}

- (void)setLoggedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_loggedEvents, a3);
}

- (OS_dispatch_queue)logQueue
{
  return self->_logQueue;
}

- (void)setLogQueue:(id)a3
{
  objc_storeStrong((id *)&self->_logQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_loggedEvents, 0);
}

@end

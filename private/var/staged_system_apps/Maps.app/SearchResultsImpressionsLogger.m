@implementation SearchResultsImpressionsLogger

- (SearchResultsImpressionsLogger)init
{
  SearchResultsImpressionsLogger *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *impressionsLoggingQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchResultsImpressionsLogger;
  v2 = -[SearchResultsImpressionsLogger init](&v7, "init");
  if (v2)
  {
    v3 = geo_dispatch_queue_create_with_qos("com.apple.Maps.SearchResultsImpressionsLogger", 21);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    impressionsLoggingQueue = v2->_impressionsLoggingQueue;
    v2->_impressionsLoggingQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  NSObject *impressionsLoggingQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  impressionsLoggingQueue = self->_impressionsLoggingQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100944A7C;
  v11[3] = &unk_1011AC8B0;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(impressionsLoggingQueue, v11);

}

- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *impressionsLoggingQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  impressionsLoggingQueue = self->_impressionsLoggingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100944CDC;
  block[3] = &unk_1011AD238;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(impressionsLoggingQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionsLoggingQueue, 0);
}

@end

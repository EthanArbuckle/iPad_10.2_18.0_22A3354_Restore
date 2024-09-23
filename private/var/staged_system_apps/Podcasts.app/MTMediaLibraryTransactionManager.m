@implementation MTMediaLibraryTransactionManager

- (MTMediaLibraryTransactionManager)init
{
  MTMediaLibraryTransactionManager *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMediaLibraryTransactionManager;
  v2 = -[MTMediaLibraryTransactionManager init](&v5, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("MTMediaLibraryManager", 0);
    -[MTMediaLibraryTransactionManager setSerialQueue:](v2, "setSerialQueue:", v3);

    -[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:](v2, "setCounterForGeneratingLibraryChangeNotifications:", 0);
  }
  return v2;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)setCounterForGeneratingLibraryChangeNotifications:(int64_t)a3
{
  self->_counterForGeneratingLibraryChangeNotifications = a3;
}

- (void)requestMediaLibraryWriteTransaction:(id)a3
{
  -[MTMediaLibraryTransactionManager requestMediaLibraryWriteTransaction:completion:](self, "requestMediaLibraryWriteTransaction:completion:", a3, 0);
}

- (void)requestMediaLibraryWriteTransaction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FE2E4;
  block[3] = &unk_1004AB258;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)requestMediaLibraryReadTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FE480;
  block[3] = &unk_1004A6378;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)_beginGeneratingLibraryChangeNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  int v9;
  int64_t v10;

  v3 = _MTLogCategoryMediaLibrary(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134217984;
    v10 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "will beginGeneratingLibraryChangeNotifications: %li", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  objc_msgSend(v5, "beginGeneratingLibraryChangeNotifications");

  v6 = _MTLogCategoryMediaLibrary(-[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:](self, "setCounterForGeneratingLibraryChangeNotifications:", (char *)-[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications")+ 1));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    v9 = 134217984;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "did beginGeneratingLibraryChangeNotifications: %li", (uint8_t *)&v9, 0xCu);
  }

}

- (void)_endGeneratingLibraryChangeNotifications
{
  int64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int64_t v12;
  int v13;
  int64_t v14;

  v3 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
  if (!v3)
  {
    v4 = _MTLogCategoryMediaLibrary(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "attempting to endGeneratingLibraryChangeNotifications when already ended -- could result in unbalanced calls", (uint8_t *)&v13, 2u);
    }

  }
  v6 = _MTLogCategoryMediaLibrary(v3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    v13 = 134217984;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "will endGeneratingLibraryChangeNotifications: %ld", (uint8_t *)&v13, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  objc_msgSend(v9, "endGeneratingLibraryChangeNotifications");

  v10 = _MTLogCategoryMediaLibrary(-[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:](self, "setCounterForGeneratingLibraryChangeNotifications:", (char *)-[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications")- 1));
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    v13 = 134217984;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "will endGeneratingLibraryChangeNotifications: %ld", (uint8_t *)&v13, 0xCu);
  }

}

- (void)beginGeneratingLibraryChangeNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FE818;
  v7[3] = &unk_1004A7028;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)endGeneratingLibraryChangeNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FE8E0;
  v7[3] = &unk_1004A63C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (int64_t)counterForGeneratingLibraryChangeNotifications
{
  return self->_counterForGeneratingLibraryChangeNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end

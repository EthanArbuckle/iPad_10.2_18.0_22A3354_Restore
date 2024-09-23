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
  block[2] = sub_100003874;
  block[3] = &unk_100008308;
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
  block[2] = sub_100003A10;
  block[3] = &unk_100008330;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)_beginGeneratingLibraryChangeNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int64_t v10;
  int v11;
  int64_t v12;

  v3 = _MTLogCategoryMediaLibrary(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134217984;
    v12 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "will beginGeneratingLibraryChangeNotifications: %li", (uint8_t *)&v11, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  objc_msgSend(v5, "beginGeneratingLibraryChangeNotifications");

  v6 = -[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:](self, "setCounterForGeneratingLibraryChangeNotifications:", (char *)-[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications")+ 1);
  v8 = _MTLogCategoryMediaLibrary(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    v11 = 134217984;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "did beginGeneratingLibraryChangeNotifications: %li", (uint8_t *)&v11, 0xCu);
  }

}

- (void)_endGeneratingLibraryChangeNotifications
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int64_t v15;
  int v16;
  int64_t v17;

  v3 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
  if (!v3)
  {
    v5 = _MTLogCategoryMediaLibrary(0, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "attempting to endGeneratingLibraryChangeNotifications when already ended -- could result in unbalanced calls", (uint8_t *)&v16, 2u);
    }

  }
  v7 = _MTLogCategoryMediaLibrary(v3, v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    v16 = 134217984;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "will endGeneratingLibraryChangeNotifications: %ld", (uint8_t *)&v16, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  objc_msgSend(v10, "endGeneratingLibraryChangeNotifications");

  v11 = -[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:](self, "setCounterForGeneratingLibraryChangeNotifications:", (char *)-[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications")- 1);
  v13 = _MTLogCategoryMediaLibrary(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications](self, "counterForGeneratingLibraryChangeNotifications");
    v16 = 134217984;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "will endGeneratingLibraryChangeNotifications: %ld", (uint8_t *)&v16, 0xCu);
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
  v7[2] = sub_100003DA8;
  v7[3] = &unk_100008358;
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
  v7[2] = sub_100003E70;
  v7[3] = &unk_100008380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (int64_t)counterForGeneratingLibraryChangeNotifications
{
  return self->_counterForGeneratingLibraryChangeNotifications;
}

- (void)setCounterForGeneratingLibraryChangeNotifications:(int64_t)a3
{
  self->_counterForGeneratingLibraryChangeNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end

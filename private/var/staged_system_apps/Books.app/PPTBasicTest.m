@implementation PPTBasicTest

- (PPTBasicTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PPTBasicTest;
  v14 = -[PPTBasicTest init](&v26, "init");
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("book-type")));
    if (!v15)
    {
LABEL_8:
      objc_storeStrong((id *)v14 + 5, a4);
      objc_storeStrong((id *)v14 + 6, a5);
      objc_storeStrong((id *)v14 + 7, a3);
      v14[8] = a6;
      *((_DWORD *)v14 + 5) = 5;
      *(_QWORD *)(v14 + 12) = 0x100000002;
      *((_QWORD *)v14 + 8) = 1;

      goto LABEL_9;
    }
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10092F570, "objectForKeyedSubscript:", v15));
    v17 = (void *)*((_QWORD *)v14 + 11);
    *((_QWORD *)v14 + 11) = v16;

    if (*((_QWORD *)v14 + 11)
      || (BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/PPT/PPTBasicTests.m", 60, "-[PPTBasicTest initWithName:options:testDefinition:isMainTest:]", "_bookTitle", 0), *((_QWORD *)v14 + 11)))
    {
      v18 = sub_1001DA41C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_7:

        goto LABEL_8;
      }
      v20 = *((_QWORD *)v14 + 11);
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      v21 = "Creating test with book named: %{public}@";
      v22 = v19;
      v23 = 12;
    }
    else
    {
      v25 = sub_1001DA41C();
      v19 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_7;
      *(_WORD *)buf = 0;
      v21 = "Invalid book title when creating test";
      v22 = v19;
      v23 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v21, buf, v23);
    goto LABEL_7;
  }
LABEL_9:

  return (PPTBasicTest *)v14;
}

- (BKLibraryAsset)asset
{
  id *p_asset;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/PPT/PPTBasicTests.m", 83, "-[PPTBasicTest asset]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  p_asset = (id *)&self->_asset;
  if (!self->_asset)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookTitle](self, "bookTitle"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      if (!v5)
      {
        v6 = sub_1001DA41C();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Failed to find the book library", buf, 2u);
        }

      }
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predicateForLocalLibraryAssets"));
      v9 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
      v30 = (void *)v8;
      objc_msgSend(v9, "setPredicate:", v8);
      v31 = v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uiChildContext"));
      v36 = 0;
      v29 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "executeFetchRequest:error:", v9, &v36));
      v28 = v36;

      v12 = sub_1001DA41C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend(v11, "count", v28);
        *(_DWORD *)buf = 134217984;
        v39 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Library contains %lu books", buf, 0xCu);
      }

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title", v28));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookTitle](self, "bookTitle"));
            v23 = objc_msgSend(v21, "isEqualToString:", v22);

            if (v23)
            {
              objc_storeStrong((id *)&self->_asset, v20);
              goto LABEL_21;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_21:

      if (!*p_asset)
      {
        v24 = sub_1001DA41C();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookTitle](self, "bookTitle"));
          *(_DWORD *)buf = 138543362;
          v39 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Failed to find book named: %{public}@", buf, 0xCu);

        }
      }

    }
  }
  return (BKLibraryAsset *)*p_asset;
}

- (BOOL)waitForCACommitBeforeTrackingMetric
{
  return 1;
}

- (void)startPPTTest
{
  void *v3;
  _QWORD v4[4];
  id v5;
  PPTBasicTest *v6;

  if (self->_running && self->_mainTest)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    if (-[PPTBasicTest waitForCACommitBeforeTrackingMetric](self, "waitForCACommitBeforeTrackingMetric"))
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_100187A80;
      v4[3] = &unk_1008E7338;
      v5 = v3;
      v6 = self;
      objc_msgSend(v5, "installCACommitCompletionBlock:", v4);

    }
    else
    {
      objc_msgSend(v3, "startedTest:", self->_name);
    }

  }
}

- (void)finishPPTTestWithResult:(unint64_t)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void (**onTestFinished)(id, SEL);

  if (self->_running)
  {
    self->_result = a3;
    if (!a3 && self->_mainTest)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v5 = objc_msgSend(v4, "isRunningTest:", self->_name);

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        objc_msgSend(v6, "finishedTest:", self->_name);

      }
    }
    onTestFinished = (void (**)(id, SEL))self->_onTestFinished;
    if (onTestFinished)
      onTestFinished[2](onTestFinished, a2);
    self->_running = 0;
  }
}

- (void)subscribeToStartNotification:(id)a3 endNotification:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_handleTestStart:", v7, 0);

  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_handleTestEnd:", v6, 0);
}

- (void)_handleTestEnd:(id)a3
{
  -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 0);
}

- (BOOL)didTestFail
{
  return self->_result == 1;
}

- (BOOL)hasHandler
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKTestDriverDispatcher shared](BKTestDriverDispatcher, "shared"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100187C54;
  v5[3] = &unk_1008ED598;
  v5[4] = self;
  objc_msgSend(v3, "sync:", v5);

  return 1;
}

- (void)onBookViewControllerChange:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100187D54;
  v4[3] = &unk_1008E7338;
  v4[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bookController"));
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)terminate
{
  void *v3;
  id v4;

  self->_running = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKTestDriverDispatcher shared](BKTestDriverDispatcher, "shared"));
  objc_msgSend(v3, "unsubscribe:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (id)bookshelf
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primarySceneController"));

  if (!v3)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/PPT/PPTBasicTests.m", 225, "-[PPTBasicTest bookshelf]", "primarySceneController", 0);
    v10 = sub_1001DA41C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Failed to find primarySceneController", buf, 2u);
    }

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootBarCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedTopViewController"));

  v6 = objc_opt_class(BKLibraryBookshelfCollectionViewController);
  v7 = BUDynamicCast(v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/PPT/PPTBasicTests.m", 231, "-[PPTBasicTest bookshelf]", "bookshelf", 0);
    v12 = sub_1001DA41C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to find bookshelf", v14, 2u);
    }

  }
  return v8;
}

- (int)handlerTimeout
{
  return self->_handlerTimeout;
}

- (id)onReceiveHandler
{
  return self->_onReceiveHandler;
}

- (void)setOnReceiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)onTestFinished
{
  return self->_onTestFinished;
}

- (void)setOnTestFinished:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)timeBeforeTest
{
  return self->_timeBeforeTest;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSDictionary)testDefinition
{
  return self->_testDefinition;
}

- (void)setTestDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_testDefinition, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)mainTest
{
  return self->_mainTest;
}

- (void)setMainTest:(BOOL)a3
{
  self->_mainTest = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (int)testTimeout
{
  return self->_testTimeout;
}

- (void)setTestTimeout:(int)a3
{
  self->_testTimeout = a3;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSObject)bookController
{
  return self->_bookController;
}

- (NSString)bookTitle
{
  return self->_bookTitle;
}

- (void)setBookTitle:(id)a3
{
  objc_storeStrong((id *)&self->_bookTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookTitle, 0);
  objc_storeStrong((id *)&self->_bookController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_testDefinition, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_onTestFinished, 0);
  objc_storeStrong(&self->_onReceiveHandler, 0);
}

@end

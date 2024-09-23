@implementation PPTOpenBookTest

- (void)startTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest asset](self, "asset"));

  if (!v3)
  {
    v21 = sub_1001DA41C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Open book test has no asset to open", buf, 2u);
    }

    goto LABEL_17;
  }
  v25.receiver = self;
  v25.super_class = (Class)PPTOpenBookTest;
  -[PPTSubtestBasedOpenTest startTest](&v25, "startTest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("BKPageTurnStyle")));

  if (!v5)
    objc_msgSend(v4, "setObject:forKey:", CFSTR("curl"), CFSTR("BKPageTurnStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookshelf](self, "bookshelf"));
  if (!v6)
  {
    v7 = sub_1001DA41C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Open book test could not find the bookshelf VC", buf, 2u);
    }

  }
  v9 = sub_1001DA41C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSourceAdaptor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "booksDataSource"));
    v13 = objc_msgSend(v12, "totalNumberOfItems");
    *(_DWORD *)buf = 134217984;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Bookshelf has %ld books", buf, 0xCu);

  }
  v14 = objc_opt_class(BKLibraryAsset);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest asset](self, "asset"));
  v16 = BUDynamicCast(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSourceAdaptor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "booksDataSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "indexPathForRepresentedObject:", v17));

  if (v20)
  {
    objc_msgSend(v6, "bookTapped:completion:", v20, 0);
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/PPT/PPTOpenBookTest.m", 123, "-[PPTOpenBookTest startTest]", "indexPath", 0);
    v23 = sub_1001DA41C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Open book test could not find the book in the bookshelf", buf, 2u);
    }

  }
  if (!v20)
LABEL_17:
    -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 1);
}

@end

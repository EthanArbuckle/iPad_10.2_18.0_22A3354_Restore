@implementation PPTLibraryScrollToBookTest

- (void)startTest
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[16];

  -[PPTBasicTest setTestTimeout:](self, "setTestTimeout:", 120);
  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  -[PPTBasicTest startPPTTest](self, "startPPTTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest asset](self, "asset"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookshelf](self, "bookshelf"));
    if (!v4)
    {
      v5 = sub_1001DA41C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Could not find the bookshelf", buf, 2u);
      }

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest asset](self, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
    objc_msgSend(v4, "scrollToMakeLibraryAssetIDVisible:", v8);

    v9 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000773C0;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v10 = sub_1001DA41C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "We do not have a valid book asset", buf, 2u);
    }

    -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 1);
  }
}

@end

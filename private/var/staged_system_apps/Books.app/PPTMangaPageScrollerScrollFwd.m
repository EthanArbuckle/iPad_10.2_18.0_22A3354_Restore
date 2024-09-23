@implementation PPTMangaPageScrollerScrollFwd

- (void)startTest
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v3 = objc_opt_class(BKBookViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setLayout:", 2);

  -[PPTBasicTest setTestTimeout:](self, "setTestTimeout:", 120);
  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  v7 = objc_opt_class(BKBookViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (!v10)
  {
    v11 = sub_1001DA41C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "BKBookViewController not found", buf, 2u);
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015A1A0;
  v14[3] = &unk_1008E72C0;
  v14[4] = self;
  objc_msgSend(v10, "_performScrollTest:completionHandler:", v13, v14);

}

@end

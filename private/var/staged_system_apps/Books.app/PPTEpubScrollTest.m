@implementation PPTEpubScrollTest

- (void)startTest
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD v15[5];
  unsigned __int8 v16;
  uint8_t buf[16];

  -[PPTBasicTest setTestTimeout:](self, "setTestTimeout:", 60);
  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  v3 = objc_opt_class(BKBookViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
    v8 = objc_msgSend(v6, "_performScrollTest:iterations:delta:", v7, 1, 20);
LABEL_7:

    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v10 = +[RETestDriver isValidWithViewController:](_TtC5Books12RETestDriver, "isValidWithViewController:", v9);

  v11 = sub_1001DA41C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Asking RETestDriver to scroll", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
    v8 = +[RETestDriver performScrollTestWithViewController:name:iterations:delta:](_TtC5Books12RETestDriver, "performScrollTestWithViewController:name:iterations:delta:", v7, v14, 1, 20);

    goto LABEL_7;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "book controller not found", buf, 2u);
  }

  v8 = 0;
LABEL_8:
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100159EA8;
  v15[3] = &unk_1008E83C0;
  v15[4] = self;
  v16 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

}

@end

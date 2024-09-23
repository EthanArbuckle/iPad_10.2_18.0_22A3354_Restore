@implementation PPTCloseBookTest

- (void)startTest
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  NSObject *v18;
  unsigned __int8 v19;
  uint8_t v20[16];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PPTCloseBookTest;
  -[PPTSubtestBasedOpenTest startTest](&v21, "startTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));

  if (!v3)
    goto LABEL_15;
  v4 = objc_opt_class(BKBookViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
    v11 = +[RETestDriver isValidWithViewController:](_TtC5Books12RETestDriver, "isValidWithViewController:", v10);

    if (v11)
    {
      v12 = sub_1001DA41C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Asking RETestDriver to close book", v20, 2u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
      v15 = +[RETestDriver closeBookWithViewController:](_TtC5Books12RETestDriver, "closeBookWithViewController:", v14);
      goto LABEL_14;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));

    if (v16)
    {
      v17 = sub_1001DA41C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Asking THTestDriver to close book", v20, 2u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
      v15 = +[THTestDriver closeBookWithBookController:](THTestDriver, "closeBookWithBookController:", v14);
LABEL_14:
      v19 = v15;

      if ((v19 & 1) != 0)
        return;
    }
LABEL_15:
    -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 1);
    return;
  }
  v8 = sub_1001DA41C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Asking BKBookViewController to show the library", v20, 2u);
  }

  objc_msgSend(v7, "showLibrary:", 0);
}

@end

@implementation PPTTurnToFirstPageTest

- (void)startTest
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  PPTTurnToFirstPageTest *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void (**v15)(void);
  uint8_t v16[16];

  v3 = objc_opt_class(BKBookViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    objc_msgSend(v6, "turnToInitialPage:", 0);
    v7 = self;
    v8 = 0;
LABEL_7:
    -[PPTBasicTest setResult:](v7, "setResult:", v8);
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PPTBasicTest onTestFinished](self, "onTestFinished"));
    v15[2]();

    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v10 = +[RETestDriver isValidWithViewController:](_TtC5Books12RETestDriver, "isValidWithViewController:", v9);

  if (v10)
  {
    v11 = sub_1001DA41C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Asking RETestDriver to turn to initial page", v16, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
    v14 = +[RETestDriver turnToInitialPageWithViewController:](_TtC5Books12RETestDriver, "turnToInitialPageWithViewController:", v13);

    v8 = v14 ^ 1;
    v7 = self;
    goto LABEL_7;
  }
LABEL_8:

}

@end

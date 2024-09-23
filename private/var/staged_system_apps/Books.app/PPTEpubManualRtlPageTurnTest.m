@implementation PPTEpubManualRtlPageTurnTest

- (void)turnPage
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  uint8_t v13[16];

  v3 = objc_opt_class(BKBookViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    if ((objc_msgSend(v6, "simulateManualPageTurn:time:", 0, 2.0) & 1) != 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v8 = +[RETestDriver isValidWithViewController:](_TtC5Books12RETestDriver, "isValidWithViewController:", v7);

  if (!v8)
    goto LABEL_8;
  v9 = sub_1001DA41C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Asking RETestDriver to simulate manual page turn", v13, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v12 = +[RETestDriver simulateManualPageTurnWithViewController:rtl:time:](_TtC5Books12RETestDriver, "simulateManualPageTurnWithViewController:rtl:time:", v11, 0, 2.0);

  if ((v12 & 1) == 0)
LABEL_8:
    -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 1);
LABEL_9:

}

@end

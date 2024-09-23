@implementation PPTEpubForwardPageTurnTest

- (void)turnPage
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  unsigned __int8 v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  NSObject *v36;
  void *v37;
  unsigned __int8 v38;
  _QWORD v39[4];
  id v40;
  id buf[2];

  if (-[PPTTurnPageTest glitchFree](self, "glitchFree"))
  {
    v3 = sub_1001DA41C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Using Recap to run GlitchFree test for turn page PPT", (uint8_t *)buf, 2u);
    }

    v5 = objc_opt_class(UIViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
    v7 = BUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest testDefinition](self, "testDefinition"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("book-type")));

    if (v20)
    {
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("epub-rtl")))
        v21 = 1;
      else
        v21 = 2;
    }
    else
    {
      v21 = 2;
    }
    objc_initWeak(buf, self);
    v29 = objc_alloc((Class)RPTDirectionalSwipeTestParameters);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100159274;
    v39[3] = &unk_1008E74C8;
    objc_copyWeak(&v40, buf);
    v31 = objc_msgSend(v29, "initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:", v30, 1, v21, v39, v12 + 64.0, v14 + 64.0, v16 + -128.0, v18 + -128.0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v10));
    objc_msgSend(v31, "setConversion:", v32);

    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v31);
    objc_destroyWeak(&v40);
    objc_destroyWeak(buf);

    return;
  }
  v22 = objc_opt_class(BKBookViewController);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v24 = BUDynamicCast(v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (v25)
  {
    v26 = sub_1001DA41C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Asking BKBookViewController to turn page", (uint8_t *)buf, 2u);
    }

    v28 = objc_msgSend(v25, "turnPages:animated:", 1, 1);
    if ((v28 & 1) != 0)
      return;
LABEL_19:
    -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 1);
    return;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v34 = +[RETestDriver isValidWithViewController:](_TtC5Books12RETestDriver, "isValidWithViewController:", v33);

  if (!v34)
    goto LABEL_19;
  v35 = sub_1001DA41C();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Asking RETestDriver to turn page", (uint8_t *)buf, 2u);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v38 = +[RETestDriver turnPageWithViewController:forward:](_TtC5Books12RETestDriver, "turnPageWithViewController:forward:", v37, 1);

  if ((v38 & 1) == 0)
    goto LABEL_19;
}

@end

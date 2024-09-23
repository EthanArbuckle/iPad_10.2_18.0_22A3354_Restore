@implementation PPTFXLZoomToSpreadTest

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
  PPTFXLZoomToSpreadTest *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];

  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  v3 = objc_opt_class(BKBookViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(BKPictureBookNavigationController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageNavigationViewController"));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    if (!objc_msgSend(v10, "isZoomedToSpread"))
    {
      -[PPTBasicTest subscribeToStartNotification:endNotification:](self, "subscribeToStartNotification:endNotification:", kBETestDriverFXLZoomToSpreadStart, kBETestDriverFXLZoomToSpreadEnd);
      objc_msgSend(v10, "zoomToSpread:", 1);
      goto LABEL_9;
    }
    v11 = self;
    v12 = 0;
  }
  else
  {
    v13 = sub_1001DA41C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "pictureBookNavController not found", v15, 2u);
    }

    v11 = self;
    v12 = 1;
  }
  -[PPTBasicTest finishPPTTestWithResult:](v11, "finishPPTTestWithResult:", v12);
LABEL_9:

}

@end

@implementation StandardLocatorActions

+ (void)didReceiveLocation:(id)a3 isFinished:(BOOL)a4 inProvider:(id)a5 forCmd:(id)a6 withReason:(int64_t)a7 andAccuracyChange:(double)a8
{
  _BOOL8 v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v12 = a4;
  v16 = a3;
  v13 = a5;
  v14 = a6;
  v15 = objc_autoreleasePoolPush();
  objc_msgSend(v13, "sendCurrentLocation:isFinished:forCmd:withReason:andAccuracyChange:", v16, v12, v14, a7, a8);
  objc_autoreleasePoolPop(v15);

}

+ (void)didStopLocatingInProvider:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardLocator"));

  if (v4)
  {
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100034A00(v3, v6);

    objc_msgSend(v3, "setStandardLocator:", 0);
  }

}

@end

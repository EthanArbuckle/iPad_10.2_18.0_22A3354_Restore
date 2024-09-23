@implementation _PlaceBrandActivityHandlingTask

- (void)performTask
{
  uint64_t v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BrandAction *v13;
  void *v14;
  BrandAction *v15;
  RichMapsActivity *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[16];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = objc_opt_class(NSDictionary);
  v4 = objc_opt_class(NSString);
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(NSNumber), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityHandlingTask userActivity](self, "userActivity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKPlaceBrandUserActivityData")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v6, v9, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MKPlaceBrandUserActivityID")));
  v12 = objc_msgSend(v11, "longLongValue");

  if (v12)
  {
    v13 = [BrandAction alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MKPlaceBrandUserActivityName")));
    v15 = -[BrandAction initWithName:muid:](v13, "initWithName:muid:", v14, v12);

    -[MapsAction setUserLocationAccuracy:](v15, "setUserLocationAccuracy:", kCLLocationAccuracyKilometer);
    v16 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v15);
    -[UserActivityHandlingTask taskFinished:](self, "taskFinished:", v16);

  }
  else
  {
    v17 = sub_100431A4C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "_PlaceBrandActivityHandlingTask no branID", buf, 2u);
    }

    -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");
  }

}

@end

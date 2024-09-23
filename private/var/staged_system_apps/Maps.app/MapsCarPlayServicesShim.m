@implementation MapsCarPlayServicesShim

+ (void)openMapsCarPlayApplicationWithCompletion:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "openMapsCarPlayApplicationWithCompletion", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService dashboardService](FBSOpenApplicationService, "dashboardService"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005C417C;
  v8[3] = &unk_1011BCA78;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "openApplication:withOptions:completion:", CFSTR("com.apple.Maps"), 0, v8);

}

+ (void)openMapsCarPlayApplicationSuspended
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v5 = FBSOpenApplicationOptionKeyActivateSuspended;
  v6 = &__kCFBooleanTrue;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService dashboardService](FBSOpenApplicationService, "dashboardService"));
  objc_msgSend(v4, "openApplication:withOptions:completion:", CFSTR("com.apple.Maps"), v3, &stru_1011BCAB8);

}

@end

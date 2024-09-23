@implementation APAMSBagManager

+ (id)adprivacydBag
{
  if (qword_1002695B0 != -1)
    dispatch_once(&qword_1002695B0, &stru_100213DC0);
  return (id)qword_1002695B8;
}

+ (id)mediaAPIHostURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForKey:", CFSTR("apps-media-api-edge-host")));

  return v3;
}

+ (id)mediaAPICountryCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("countryCode")));

  return v3;
}

+ (BOOL)isSponsoredAdsEnabledForAdTrackingd
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v4 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "BOOLForKey:", CFSTR("isSponsoredAdsEnabledForAdTrackingd")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valuePromise"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AC888;
  v16[3] = &unk_100213DE8;
  v18 = &v20;
  v19 = a1;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v6, "addFinishBlock:", v16);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = APLogForCategory(34);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138477827;
      v25 = v11;
      v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'isSponsoredAdsEnabledForAdTrackingd' status from the bag in time.", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get the 'isSponsoredAdsEnabledForAdTrackingd' status from the bag in time.")));
    CreateDiagnosticReport(v13, 0, CFSTR("Bag load miss"));

  }
  v14 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (BOOL)isSearchLandingAdsEnabled
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v4 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "BOOLForKey:", CFSTR("isSearchLandingAdsEnabled")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valuePromise"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000AC788;
  v16[3] = &unk_100213DE8;
  v18 = &v20;
  v19 = a1;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v6, "addFinishBlock:", v16);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = APLogForCategory(34);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138477827;
      v25 = v11;
      v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'isSearchLandingAdsEnabled' status from the bag in time.", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get the 'isSearchLandingAdsEnabled' status from the bag in time.")));
    CreateDiagnosticReport(v13, 0, CFSTR("Bag load miss"));

  }
  v14 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (NSString)bagSubProfile
{
  if (qword_100269590 != -1)
    dispatch_once(&qword_100269590, &stru_100213D80);
  return (NSString *)(id)qword_100269598;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1002695A0 != -1)
    dispatch_once(&qword_1002695A0, &stru_100213DA0);
  return (NSString *)(id)qword_1002695A8;
}

+ (BOOL)shouldUseAMSMescal
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v4 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "BOOLForKey:", CFSTR("useAMSMescal")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valuePromise"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000ACBA8;
  v16[3] = &unk_100213DE8;
  v18 = &v20;
  v19 = a1;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v6, "addFinishBlock:", v16);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = APLogForCategory(34);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138477827;
      v25 = v11;
      v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'useAMSMescal' key from the bag in time.", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get the 'useAMSMescal' key from the bag in time.")));
    CreateDiagnosticReport(v13, 0, CFSTR("Bag load miss"));

  }
  v14 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (void)shouldUseAMSMescalWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "BOOLForKey:", CFSTR("useAMSMescal")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ACD58;
  v8[3] = &unk_100213E10;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

+ (void)httpUseFixedHttpSessionManagerWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "BOOLForKey:", CFSTR("ap-http-use-fixed-session-manager")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ACF10;
  v8[3] = &unk_100213E38;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

+ (void)httpMaximumConnectionsPerHostWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "integerForKey:", CFSTR("ap-http-max-connections-per-host")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AD020;
  v8[3] = &unk_100213E38;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

+ (void)httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "integerForKey:", CFSTR("ap-http-max-connections-per-host-temp-session")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AD130;
  v8[3] = &unk_100213E38;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

+ (void)httpLookBackWindowWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "doubleForKey:", CFSTR("ap-http-look-back-window")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AD240;
  v8[3] = &unk_100213E38;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

+ (void)cacheSizeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "adprivacydBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "integerForKey:", CFSTR("ap-cache-size")));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AD34C;
  v8[3] = &unk_100213E38;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

@end

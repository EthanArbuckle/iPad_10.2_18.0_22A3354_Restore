void sub_100004D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004DBC(uint64_t a1, int a2)
{
  id *v3;
  id *v5;
  _QWORD v6[4];
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = (id *)(a1 + 40);
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004EA4;
    block[3] = &unk_1000184D8;
    v5 = &v10;
    objc_copyWeak(&v10, v3);
    v9 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004EE0;
    v6[3] = &unk_100018500;
    v5 = &v7;
    objc_copyWeak(&v7, v3);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
  objc_destroyWeak(v5);
}

void sub_100004EA4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_configureWithContextDictionary:", *(_QWORD *)(a1 + 32));

}

void sub_100004EE0(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "extensionContext"));
  objc_msgSend(v1, "dismissNotificationContentExtension");

}

void sub_100005754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;

  v4 = HFLogForCategory(48);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)a2)
      v6 = CFSTR("Succeeded");
    else
      v6 = CFSTR("Failed");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "faceUnknownSignificantEvents"));
    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2048;
    v18 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ opening %@ from HomeNotificationViewController to identify %lu unknown persons", (uint8_t *)&v13, 0x20u);

  }
  v9 = objc_opt_new(NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "faceUnknownSignificantEvents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, HFAnalyticsFaceRecognitionNotificationAssociatePersonCountKey);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, HFAnalyticsFaceRecognitionNotificationAssociatePersonSuccessKey);

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 5, v9);
}

void sub_1000058FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;

  v4 = HFLogForCategory(48);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Failed");
    v7 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v6 = CFSTR("Succeeded");
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ opening %@ from HomeNotificationViewController to identify an unknown person", (uint8_t *)&v12, 0x16u);
  }

  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "faceUnknownSignificantEvents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, HFAnalyticsFaceRecognitionNotificationAssociatePersonCountKey);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, HFAnalyticsFaceRecognitionNotificationAssociatePersonSuccessKey);

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 5, v8);
}

void sub_100005A84(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  _QWORD v27[2];

  v3 = a2;
  if (v3)
  {
    v4 = HFLogForCategory(48);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000E46C();

    v6 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v6, "na_safeSetObject:forKey:", v3, HFAnalyticsDataErrorKey);
    +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 3, v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier"));
    v7 = HFURLComponentsHome;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "home"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v7, v20));
    v27[0] = v8;
    v9 = HFURLComponentsCameraProfile;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cameraProfile"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v9, v12));
    v27[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:", 10, 0, v19, v14));

    v16 = HFLogForCategory(48);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController launching Home for person URL: %@", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "extensionContext"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100005D88;
    v23[3] = &unk_100018578;
    v24 = v15;
    v6 = v15;
    objc_msgSend(v18, "openURL:completionHandler:", v6, v23);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100005D88(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;

  v4 = HFLogForCategory(48);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Failed");
    v7 = *(_QWORD *)(a1 + 32);
    if (a2)
      v6 = CFSTR("Succeeded");
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ opening %@ from HomeNotificationViewController to correct a misidentified person", (uint8_t *)&v8, 0x16u);
  }

}

id sub_100006178(id a1, NSString *a2)
{
  NSString *v2;
  id v3;

  v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v2);

  return v3;
}

void sub_1000061BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = HFLogForCategory(48);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000E4D0((uint64_t)v4, a1);

    objc_msgSend(*(id *)(a1 + 40), "_showErrorText:", v4);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "home"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_serviceWithIdentifier:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(*(id *)(a1 + 40), "setAffectedService:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_configureCameraProfileWithUUID:", *(_QWORD *)(a1 + 56)));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000630C;
    v11[3] = &unk_100018658;
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "addCompletionBlock:", v11);

  }
}

void sub_10000630C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD v31[2];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  v5 = HFLogForCategory(48);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000E584(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(*(id *)(a1 + 32), "_showErrorText:", v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
      v16 = *(_QWORD *)(a1 + 40);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameraProfile"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueIdentifier"));
      *(_DWORD *)buf = 138412802;
      v33 = v15;
      v34 = 2112;
      v35 = v16;
      v36 = 2112;
      v37 = v18;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found home %@. Using UUID:%@ for camera profile:%@. Configure and set instance properties.", buf, 0x20u);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_configureCameraSignificantEventsWithUUIDs:", *(_QWORD *)(a1 + 48)));
    v31[0] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_configureNotificationSnapshot"));
    v31[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:](NAFuture, "combineAllFutures:", v21));

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000655C;
    v30[3] = &unk_100018608;
    v30[4] = *(_QWORD *)(a1 + 32);
    v23 = objc_msgSend(v22, "addSuccessBlock:", v30);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100006584;
    v27[3] = &unk_100018630;
    v24 = *(id *)(a1 + 56);
    v25 = *(_QWORD *)(a1 + 32);
    v28 = v24;
    v29 = v25;
    v26 = objc_msgSend(v22, "addFailureBlock:", v27);

  }
}

id sub_10000655C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupContentViewController");
  return _objc_msgSend(*(id *)(a1 + 32), "_setupNotificationActions");
}

void sub_100006584(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = HFLogForCategory(48);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000E5B8((uint64_t)v3, a1);

  objc_msgSend(*(id *)(a1 + 40), "_showErrorText:", v3);
}

void sub_1000066C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000066DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_homeWithUUID:retryDelay:", *(_QWORD *)(a1 + 40), 1.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006808;
  v12[3] = &unk_1000186A8;
  v5 = v3;
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addFailureBlock:", v12));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006814;
  v9[3] = &unk_1000186D0;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v7 = v5;
  v10 = v7;
  v8 = objc_msgSend(v6, "addSuccessBlock:", v9);

  objc_destroyWeak(&v11);
}

void sub_1000067F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100006808(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void sub_100006814(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setHome:", v4);

  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void sub_10000693C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006958(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_cameraProfileWithUUID:retryDelay:", *(_QWORD *)(a1 + 40), 1.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006A84;
  v12[3] = &unk_1000186A8;
  v5 = v3;
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addFailureBlock:", v12));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006A90;
  v9[3] = &unk_100018720;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v7 = v5;
  v10 = v7;
  v8 = objc_msgSend(v6, "addSuccessBlock:", v9);

  objc_destroyWeak(&v11);
}

void sub_100006A70(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100006A84(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void sub_100006A90(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setCameraProfile:", v4);

  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void sub_100006BB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006BD4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameraProfile"));
  v5 = v4 == 0;

  v6 = HFLogForCategory(48);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000E66C((id *)(a1 + 32));

    objc_msgSend(v3, "finishWithNoResult");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempt to fetch significant events for uuids:%@.", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameraProfile"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clipManager"));
    v13 = *(_QWORD *)(a1 + 40);
    v12 = (id *)(a1 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006DA0;
    v14[3] = &unk_100018770;
    objc_copyWeak(&v17, v12 + 1);
    v15 = *v12;
    v16 = v3;
    objc_msgSend(v11, "fetchSignificantEventsWithUUIDs:completion:", v13, v14);

    objc_destroyWeak(&v17);
  }

}

void sub_100006D84(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006DA0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = HFLogForCategory(48);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000E6EC();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    v25 = 2112;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Did fetch significant events:%@ for uuids:%@.", buf, 0x16u);
  }

  objc_msgSend(WeakRetained, "setCameraSignificantEvents:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "cameraSignificantEvents"));
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_100006F84;
  v20 = &unk_100018748;
  v21 = v12;
  v22 = v13;
  v15 = v13;
  v16 = v12;
  objc_msgSend(v14, "na_each:", &v17);

  objc_msgSend(WeakRetained, "setFaceKnownSignificantEvents:", v16, v17, v18, v19, v20);
  objc_msgSend(WeakRetained, "setFaceUnknownSignificantEvents:", v15);
  objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");

}

void sub_100006F84(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;

  v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "faceClassification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "person"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = (id *)(a1 + 32);
LABEL_5:
    objc_msgSend(*v6, "addObject:", v7);
    goto LABEL_6;
  }
  if (v3)
  {
    v6 = (id *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

}

void sub_1000070B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000070D4(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameraProfile"));
  v6 = v5 == 0;

  v7 = HFLogForCategory(48);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000E750((id *)(a1 + 32));

    objc_msgSend(v3, "finishWithNoResult");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "cameraProfile"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshotControl"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "context"));
      *(_DWORD *)buf = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(NC) Attempt fetch snapshot from control:%@ using bulletionContext:%@.", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cameraProfile"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "snapshotControl"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000072E0;
    v16[3] = &unk_100018798;
    objc_copyWeak(&v18, (id *)(a1 + 40));
    v17 = v3;
    objc_msgSend(v14, "fetchCameraSnapshotForBulletinContext:completionHandler:", v15, v16);

    objc_destroyWeak(&v18);
  }

}

void sub_1000072C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000072E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = HFLogForCategory(48);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController: Configured with snapshot:%@ and error:%@.", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(WeakRetained, "setNotificationSnapshot:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

void sub_1000077FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100007824(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 1.0));
  objc_msgSend(WeakRetained, "setHeightConstraint:", v5);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentViewController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v33[0] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v33[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v6));
  v33[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v33[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "heightConstraint"));
  v33[4] = v14;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 5));

  return v16;
}

void sub_100007F90(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

void sub_100007FE8(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  HomeNotificationStatusView *v5;
  void *v6;
  HomeNotificationStatusView *v7;
  void *v8;
  id v9;
  void *v10;

  v9 = 0;
  v10 = 0;
  +[HFCameraItem getErrorDescription:detailedErrorDescription:forCameraStreamError:](HFCameraItem, "getErrorDescription:detailedErrorDescription:forCameraStreamError:", &v10, &v9, *(_QWORD *)(a1 + 32));
  v2 = v10;
  v3 = v9;
  v4 = v2;
  v5 = [HomeNotificationStatusView alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  objc_msgSend(v6, "bounds");
  v7 = -[HomeNotificationStatusView initWithFrame:](v5, "initWithFrame:");

  -[HomeNotificationStatusView setStatusText:](v7, "setStatusText:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));

  objc_msgSend(v8, "addSubview:", v7);
}

id sub_100008170(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;

  v3 = a2;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000082C8;
  v14 = &unk_100018838;
  v15 = *(id *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_firstObjectPassingTest:", &v11));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v4, v11, v12, v13, v14));
  }
  else
  {
    if (v3)
      v6 = v3;
    else
      v6 = &__NSArray0__struct;
    v16 = CFSTR("HOMES");
    v17 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1, v11, v12, v13, v14));
    v8 = sub_100008308(2, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v9));

  }
  return v5;
}

id sub_1000082C8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uniqueIdentifier"));
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_100008308(uint64_t a1, void *a2)
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  v4 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary na_safeSetObject:forKey:](v4, "na_safeSetObject:forKey:", 0, CFSTR("HomeNotificationErrorContext"));
  if (v3)
    -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Home.HomeNotificationViewController"), a1, v4));
  v6 = HFLogForCategory(48);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10000E804();

  return v5;
}

id sub_10000847C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v3 = a2;
  v4 = HFLogForCategory(48);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000E868();

  v6 = (void *)objc_opt_new(NAFuture);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeManager"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 48)));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000085C4;
  v16[3] = &unk_1000188B0;
  v10 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v11 = v6;
  v18 = v11;
  v12 = objc_msgSend(v8, "_refreshBeforeDate:completionHandler:", v9, v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

void sub_1000085C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_homeWithUUID:", *(_QWORD *)(a1 + 40)));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008678;
  v7[3] = &unk_100018888;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  v6 = objc_msgSend(v4, "addCompletionBlock:", v7);

}

void sub_100008678(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = HFLogForCategory(48);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "HomeNotificationViewController: Found home: %@ Error: %@ Error from refreshing home manager: %@", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6);
}

void sub_100008970(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_cameraProfileWithIdentifier:", *(_QWORD *)(a1 + 40)));

  if (v5)
  {
    v6 = HFLogForCategory(48);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(NC): Home manager refresh. Found camera profile for UUID:%@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v5);
  }
  else
  {
    v9 = sub_100008308(5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = HFLogForCategory(48);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10000E944();

    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v10);
  }

}

void sub_100008E44(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008E58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100008E64(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100008EB0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100008ECC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100009404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009428(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "playerViewController"));

  if (v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "nearbyAccessoriesViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "itemManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allDisplayedItems"));
    v5 = objc_msgSend(v4, "count");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "playerViewController"));
    objc_msgSend(v6, "setNumberOfAssociatedAccessoriesDisplayed:", v5);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tableView"));
  objc_msgSend(v7, "reloadData");

}

id HomeNotificationActionOperationErrorWithContext(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));

    if (v3)
      v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
  }
  v6 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary na_safeSetObject:forKey:](v6, "na_safeSetObject:forKey:", v5, NSUnderlyingErrorKey);
  -[NSMutableDictionary na_safeSetObject:forKey:](v6, "na_safeSetObject:forKey:", v3, NSLocalizedDescriptionKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HomeNotificationActionOperationErrorDomain, v5 == 0, v6));

  return v7;
}

void sub_10000A018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A030(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

uint64_t sub_10000A108(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

void sub_10000A1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A1DC(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t sub_10000A2A4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

id sub_10000A48C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:");
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

void sub_10000A4B8(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  uint64_t v14;
  id v15;

  v2 = objc_alloc((Class)HFSimpleItemManager);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A64C;
  v13[3] = &unk_1000189C8;
  v3 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v4 = objc_msgSend(v2, "initWithDelegate:itemProvidersCreator:", v14, v13);
  objc_msgSend(*(id *)(a1 + 32), "setItemManager:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 56)));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A800;
  v11[3] = &unk_1000189F0;
  a1 += 48;
  objc_copyWeak(&v12, (id *)a1);
  v7 = objc_msgSend(v6, "addFailureBlock:", v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A888;
  v9[3] = &unk_100018A40;
  objc_copyWeak(&v10, (id *)a1);
  v8 = objc_msgSend(v6, "addSuccessBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

}

void sub_10000A628(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10000A64C(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = objc_alloc((Class)HFServiceItemProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
  v4 = objc_msgSend(v2, "initWithHome:serviceTypes:", v3, 0);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A750;
  v7[3] = &unk_1000189A0;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setFilter:", v7);
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

id sub_10000A750(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = objc_opt_class(HMService);
  v5 = v3;
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("Expected an HMService %@"), v5);
  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIdentifier"));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  return v10;
}

void sub_10000A800(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory(48);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10000E9B0((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(WeakRetained, "setError:", v3);
  objc_msgSend(WeakRetained, "setFinished:", 1);

}

void sub_10000A888(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("lightbulb"));

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_toggleLightbulbsForItems:", v3));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "action"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("security-system")))
    {

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "action"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("lock-mechanism"));

      if (!v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "action"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        NSLog(CFSTR("Unknown action identifier %@"), v18);

        goto LABEL_8;
      }
    }
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_unlockLocksAndDisarmSecuritySystemsForItems:", v3));
  }
  v16 = v6;
  v6 = (void *)v10;
LABEL_8:

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000AA90;
  v19[3] = &unk_100018A18;
  objc_copyWeak(&v20, v4);
  v17 = objc_msgSend(v6, "addCompletionBlock:", v19);
  objc_destroyWeak(&v20);

}

void sub_10000AA7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AA90(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setFinished:", 1);

}

id sub_10000AC98(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  v4 = HFLogForCategory(48);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000EA58((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  v12 = HomeNotificationBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("HONActionErrorCameraNotResponding"), &stru_100019150, CFSTR("HONLocalizable")));
  v15 = HomeNotificationActionOperationErrorWithContext(v14, v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v17));

  return v18;
}

BOOL sub_10000AED8(id a1, HFItem *a2)
{
  HFItem *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = a2;
  v3 = objc_opt_class(HFLightbulbServiceItem);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

id sub_10000AF20(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;

  if (*(_QWORD *)(a1 + 48) == 2)
    v2 = CFSTR("HONActionLightTurnedOn");
  else
    v2 = CFSTR("HONActionLightTurnedOff");
  v3 = v2;
  v4 = HomeNotificationBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(*(id *)(a1 + 40), "count");
  v7 = v3;
  if ((unint64_t)v6 >= 2)
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("Plural")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_100019150, CFSTR("HONLocalizable")));
  objc_msgSend(*(id *)(a1 + 32), "setResultString:", v8);

  if ((unint64_t)v6 >= 2)
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v9;
}

id sub_10000B00C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = HomeNotificationBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HONActionErrorLightNotResponding"), &stru_100019150, CFSTR("HONLocalizable")));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HONActionErrorLightNotResponding"), "stringByAppendingString:", CFSTR("Plural")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_100019150, CFSTR("HONLocalizable")));

  }
  v8 = HomeNotificationActionOperationErrorWithContext(v7, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(*(id *)(a1 + 40), "setError:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v3));
  return v10;
}

BOOL sub_10000B370(id a1, HFItem *a2)
{
  HFItem *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = a2;
  v3 = objc_opt_class(HFLockMechanismServiceItem);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

BOOL sub_10000B3B8(id a1, HFItem *a2)
{
  HFItem *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = a2;
  v3 = objc_opt_class(HFSecurityServiceItem);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

BOOL sub_10000B400(id a1, HFItem *a2)
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HFItem latestResults](a2, "latestResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", HFResultPrimaryStateKey));
  v4 = objc_msgSend(v3, "integerValue") != (id)2;

  return v4;
}

BOOL sub_10000B460(id a1, HFItem *a2)
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HFItem latestResults](a2, "latestResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", HFResultPrimaryStateKey));
  v4 = objc_msgSend(v3, "integerValue") != (id)1;

  return v4;
}

id sub_10000B4C0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childItemsForItem:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", &stru_100018BC0));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childItemsForItem:", v3));
    NSLog(CFSTR("No matching control item found on security system item %@ with control items: %@"), v3, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "writeValue:", &off_1000196B8));

  return v9;
}

BOOL sub_10000B598(id a1, HFItem *a2)
{
  HFItem *v2;
  uint64_t v3;
  HFItem *v4;
  HFItem *v5;
  HFItem *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v2 = a2;
  v3 = objc_opt_class(HFControlItem);
  v4 = v2;
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HFItem characteristicOptions](v6, "characteristicOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_1000196A0));
  v9 = objc_msgSend(v8, "containsObject:", HMCharacteristicTypeTargetSecuritySystemState);

  return v9;
}

NAFuture *sub_10000B648(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(a1[4], "count") && objc_msgSend(a1[5], "count"))
  {
    v2 = HomeNotificationBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = objc_msgSend(a1[4], "count");
    if ((unint64_t)v4 >= 2)
    {
      v5 = CFSTR("HONActionLockUnlockedAndSecuritySystemDisarmed");
LABEL_8:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("Plural")));
      goto LABEL_13;
    }
    v7 = CFSTR("HONActionLockUnlockedAndSecuritySystemDisarmed");
    goto LABEL_13;
  }
  if (objc_msgSend(a1[4], "count"))
  {
    v6 = HomeNotificationBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v4 = objc_msgSend(a1[4], "count");
    if ((unint64_t)v4 >= 2)
    {
      v5 = CFSTR("HONActionLockUnlocked");
      goto LABEL_8;
    }
    v7 = CFSTR("HONActionLockUnlocked");
LABEL_13:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v7, &stru_100019150, CFSTR("HONLocalizable")));
    objc_msgSend(a1[6], "setResultString:", v9);

    if ((unint64_t)v4 <= 1)
    {
LABEL_15:

      return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
    }
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(a1[5], "count"))
  {
    v8 = HomeNotificationBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HONActionSecuritySystemDisarmed"), &stru_100019150, CFSTR("HONLocalizable")));
    objc_msgSend(a1[6], "setResultString:", v7);
    goto LABEL_14;
  }
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

id sub_10000B7B0(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char *v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v3 = a1[4];
  v4 = a2;
  if (objc_msgSend(v3, "count") && objc_msgSend(a1[5], "count"))
  {
    v5 = HomeNotificationBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (char *)objc_msgSend(a1[4], "count");
    v8 = &v7[(_QWORD)objc_msgSend(a1[5], "count")];
    if ((unint64_t)v8 < 2)
      v9 = CFSTR("HONActionErrorAccessoryNotResponding");
    else
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HONActionErrorAccessoryNotResponding"), "stringByAppendingString:", CFSTR("Plural")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v9, &stru_100019150, CFSTR("HONLocalizable")));
    if ((unint64_t)v8 >= 2)

  }
  else if (objc_msgSend(a1[4], "count"))
  {
    v10 = HomeNotificationBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v11 = objc_msgSend(a1[4], "count");
    if ((unint64_t)v11 < 2)
      v12 = CFSTR("HONActionErrorLockNotResponding");
    else
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HONActionErrorLockNotResponding"), "stringByAppendingString:", CFSTR("Plural")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v12, &stru_100019150, CFSTR("HONLocalizable")));
    if ((unint64_t)v11 >= 2)

  }
  else
  {
    if (!objc_msgSend(a1[5], "count"))
    {
      NSLog(CFSTR("Action failed despite not writing any values!"));
      v14 = 0;
      goto LABEL_17;
    }
    v13 = HomeNotificationBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HONActionErrorSecuritySystemNotResponding"), &stru_100019150, CFSTR("HONLocalizable")));
  }

LABEL_17:
  v15 = HomeNotificationActionOperationErrorWithContext(v14, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(a1[6], "setError:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v4));
  return v17;
}

id sub_10000BB0C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemManager"));
  v6 = objc_msgSend(v5, "childItemsForItem:ofClass:conformingToProtocol:", v4, objc_opt_class(HFControlItem), &OBJC_PROTOCOL___HFPrimaryStateWriter);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "writePrimaryState:", *(_QWORD *)(a1 + 40)));

  return v9;
}

BOOL sub_10000BCDC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "latestResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", HFResultPrimaryStateKey));
  v5 = objc_msgSend(v4, "integerValue") == *(id *)(a1 + 32);

  return v5;
}

uint64_t sub_10000BD44(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

void sub_10000BEFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000CA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CA88(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusAccessoryImage"));
  objc_msgSend(WeakRetained, "_updateStatusText:accessoryImage:animated:", v2, v3, *(unsigned __int8 *)(a1 + 48));

}

id sub_10000D430()
{
  if (qword_10001F120 != -1)
    dispatch_once(&qword_10001F120, &stru_100018D10);
  return (id)qword_10001F128;
}

void sub_10000D470(id a1)
{
  NSBundle *v1;
  uint64_t v2;
  void *v3;

  v1 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(_HONThisClassReallyShouldNotNeedToExist));
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_10001F128;
  qword_10001F128 = v2;

}

void sub_10000DD18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HomeNotificationAction *v7;

  v3 = a2;
  v7 = -[HomeNotificationAction initWithDictionary:]([HomeNotificationAction alloc], "initWithDictionary:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationAction identifier](v7, "identifier"));
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationAction identifier](v7, "identifier"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

void sub_10000DFAC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("identifier"), CFSTR("itemType"), CFSTR("shouldDismiss"), CFSTR("title"), CFSTR("services.uuid"), 0));
  v2 = (void *)qword_10001F130;
  qword_10001F130 = v1;

}

id sub_10000E014(id a1, NSString *a2)
{
  NSString *v2;
  id v3;

  v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v2);

  return v3;
}

uint64_t FeatureFlagsKey.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v6[5];

  v3 = a1;
  v6[3] = a1;
  v6[4] = a2;
  v4 = sub_10000E238(v6);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v4, v2, v3);
  LOBYTE(v3) = isFeatureEnabled(_:)(v6);
  sub_10000E274(v6);
  return v3 & 1;
}

_QWORD *sub_10000E238(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_10000E274(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id HomeNotificationTableViewController.nearbyAccessoriesViewControllerDidUpdate(viewController:)()
{
  void *v0;

  return objc_msgSend(v0, "updateNearbyAccessoriesViewController");
}

id sub_10000E358(uint64_t a1)
{
  id *v1;

  return objc_msgSend(*v1, "nearbyAccessoriesViewControllerDidUpdateWithViewController:", a1);
}

unint64_t sub_10000E36C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001F110;
  if (!qword_10001F110)
  {
    v1 = objc_opt_self(HomeNotificationTableViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001F110);
  }
  return result;
}

unint64_t sub_10000E3A8()
{
  unint64_t result;
  unint64_t v1;

  result = qword_10001F118;
  if (!qword_10001F118)
  {
    v1 = sub_10000E36C();
    result = swift_getWitnessTable(&protocol conformance descriptor for HomeNotificationTableViewController, v1);
    atomic_store(result, (unint64_t *)&qword_10001F118);
  }
  return result;
}

void sub_10000E3F0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "notificationRequestIdentifier"));
  sub_100008E84();
  sub_100008E44((void *)&_mh_execute_header, v2, v3, "HomeNotificationViewController already active for previous notification with request identifier %@", v4, v5, v6, v7, v8);

  sub_100008E78();
}

void sub_10000E46C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100008EDC();
  sub_100008E64((void *)&_mh_execute_header, v0, v1, "HomeNotificationViewController failed to handle misclassification for significant event %@ (error: %@)");
  sub_100008EC4();
}

void sub_10000E4D0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "objectForKeyedSubscript:", HMBulletinContextHomeIDKey));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "objectForKeyedSubscript:", HMBulletinCameraNotificationIDKey));
  sub_100008E90();
  sub_100008EB0((void *)&_mh_execute_header, v5, v6, "Failed to find home after waiting. Showing error text because configuration failed with error:%@ for homeUUID:%@ cameraProfileUUID:%@.", v7, v8, v9, v10, v11);

  sub_100008EF4();
}

void sub_10000E584(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008ECC((void *)&_mh_execute_header, a1, a3, "Unable to configure camera profile. Displaying error content.", a5, a6, a7, a8, 0);
}

void sub_10000E5B8(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "objectForKeyedSubscript:", HMBulletinContextHomeIDKey));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "objectForKeyedSubscript:", HMBulletinCameraNotificationIDKey));
  sub_100008E90();
  sub_100008EB0((void *)&_mh_execute_header, v5, v6, "Showing error text because configuration failed with error:%@ for homeUUID:%@ cameraProfileUUID:%@.", v7, v8, v9, v10, v11);

  sub_100008EF4();
}

void sub_10000E66C(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "cameraProfile"));
  sub_100008E84();
  sub_100008E44((void *)&_mh_execute_header, v2, v3, "Unable to attempt to fetch the clips with missing camera profile:%@.", v4, v5, v6, v7, v8);

  sub_100008E78();
}

void sub_10000E6EC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100008EDC();
  sub_100008E64((void *)&_mh_execute_header, v0, v1, "HomeNotificationViewController: Failed to fetch significant events for uuids %@ (error: %@)");
  sub_100008EC4();
}

void sub_10000E750(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "cameraProfile"));
  sub_100008E84();
  sub_100008E44((void *)&_mh_execute_header, v2, v3, "Unable to fetch the snapshot with missing camera profile:%@.", v4, v5, v6, v7, v8);

  sub_100008E78();
}

void sub_10000E7D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008ECC((void *)&_mh_execute_header, a1, a3, "Unable to setup camera content for missing profile.", a5, a6, a7, a8, 0);
}

void sub_10000E804()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008E84();
  sub_100008E58((void *)&_mh_execute_header, v0, v1, "Error: %@", v2);
  sub_100008EC4();
}

void sub_10000E868()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008E84();
  sub_100008E58((void *)&_mh_execute_header, v0, v1, "Could not fetch home. Attempting to refresh home manager: %@", v2);
  sub_100008EC4();
}

void sub_10000E8CC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "home"));
  sub_100008E84();
  sub_100008E44((void *)&_mh_execute_header, v2, v3, "Camera profile unavailable for home:%@. Attempting to refresh home manager", v4, v5, v6, v7, v8);

  sub_100008E78();
}

void sub_10000E944()
{
  uint64_t v0;
  os_log_t v1;

  sub_100008E84();
  sub_100008E64((void *)&_mh_execute_header, v0, v1, "(NC): Could not fetch camera profile: %@ Error after refreshing home manager: %@");
  sub_100008EC4();
}

void sub_10000E9B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BEFC((void *)&_mh_execute_header, a2, a3, "HFSimpleItemManager failed to retrieve items: %@", a5, a6, a7, a8, 2u);
}

void sub_10000EA18(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempted to perform a microphone action on a camera that does not have a microphone control!", v1, 2u);
}

void sub_10000EA58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000BEFC((void *)&_mh_execute_header, a2, a3, "Failed to toggle microphone state; error: %@", a5, a6, a7, a8, 2u);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__cameraProfileWithUUID_retryDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cameraProfileWithUUID:retryDelay:");
}

id objc_msgSend__clearUpContentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearUpContentViewController");
}

id objc_msgSend__configureCameraProfileWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureCameraProfileWithUUID:");
}

id objc_msgSend__configureCameraSignificantEventsWithUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureCameraSignificantEventsWithUUIDs:");
}

id objc_msgSend__configureHomeWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureHomeWithUUID:");
}

id objc_msgSend__configureNotificationSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureNotificationSnapshot");
}

id objc_msgSend__configureWithContextDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureWithContextDictionary:");
}

id objc_msgSend__createNearbyAccessoryViewControllerWithSourceItem_supportsQuickControls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNearbyAccessoryViewControllerWithSourceItem:supportsQuickControls:");
}

id objc_msgSend__currentSectionIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentSectionIdentifiers");
}

id objc_msgSend__homeWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeWithUUID:");
}

id objc_msgSend__homeWithUUID_retryDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_homeWithUUID:retryDelay:");
}

id objc_msgSend__identifierForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifierForSection:");
}

id objc_msgSend__itemsToInvertPrimaryStateForItems_preferredPrimaryState_targetPrimaryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemsToInvertPrimaryStateForItems:preferredPrimaryState:targetPrimaryState:");
}

id objc_msgSend__numberOfSectionsToShow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfSectionsToShow");
}

id objc_msgSend__refreshBeforeDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshBeforeDate:completionHandler:");
}

id objc_msgSend__setupContentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupContentViewController");
}

id objc_msgSend__showErrorText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showErrorText:");
}

id objc_msgSend__toggleLightbulbsForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toggleLightbulbsForItems:");
}

id objc_msgSend__toggleMicrophoneState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toggleMicrophoneState:");
}

id objc_msgSend__unlockLocksAndDisarmSecuritySystemsForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unlockLocksAndDisarmSecuritySystemsForItems:");
}

id objc_msgSend__updateStatusText_accessoryImage_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStatusText:accessoryImage:animated:");
}

id objc_msgSend__writePrimaryState_forItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writePrimaryState:forItems:");
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessQueue");
}

id objc_msgSend_accessoryImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryImage");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionResultText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionResultText");
}

id objc_msgSend_actionWithIdentifier_title_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithIdentifier:title:options:");
}

id objc_msgSend_actionWithIdentifier_title_options_icon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithIdentifier:title:options:icon:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateIfNeeded");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletionBlock:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFailureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFailureBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_affectedService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "affectedService");
}

id objc_msgSend_afterDelay_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:performBlock:");
}

id objc_msgSend_allDisplayedItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allDisplayedItems");
}

id objc_msgSend_allHomesFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allHomesFuture");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_aspectRatio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aspectRatio");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachments");
}

id objc_msgSend_backgroundWithBlurEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundWithBlurEffect:");
}

id objc_msgSend_backgroundWithFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundWithFillColor:");
}

id objc_msgSend_beginTransactionWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionWithReason:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "body");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cameraClipUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraClipUUID");
}

id objc_msgSend_cameraFeedbackQueryString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraFeedbackQueryString");
}

id objc_msgSend_cameraNotificationUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraNotificationUUID");
}

id objc_msgSend_cameraProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraProfile");
}

id objc_msgSend_cameraSignificantEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraSignificantEvents");
}

id objc_msgSend_cameraSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraSource");
}

id objc_msgSend_cameraStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraStream");
}

id objc_msgSend_cameraView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraView");
}

id objc_msgSend_canEvaluatePolicy_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canEvaluatePolicy:error:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_characteristicOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characteristicOptions");
}

id objc_msgSend_childItemsForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childItemsForItem:");
}

id objc_msgSend_childItemsForItem_ofClass_conformingToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childItemsForItem:ofClass:conformingToProtocol:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clipManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clipManager");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_combineAllFutures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineAllFutures:");
}

id objc_msgSend_combineAllFutures_ignoringErrors_scheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineAllFutures:ignoringErrors:scheduler:");
}

id objc_msgSend_commitTransactionWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitTransactionWithReason:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraints");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentViewController");
}

id objc_msgSend_contentWithVibrancyEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWithVibrancyEffect:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissNotificationContentExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissNotificationContentExtension");
}

id objc_msgSend_dispatcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatcher");
}

id objc_msgSend_effectForBlurEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectForBlurEffect:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorContent");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluatePolicy_localizedReason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluatePolicy:localizedReason:reply:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_faceClassification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceClassification");
}

id objc_msgSend_faceKnownSignificantEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceKnownSignificantEvents");
}

id objc_msgSend_faceRecognitionSettingsURLForHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceRecognitionSettingsURLForHome:");
}

id objc_msgSend_faceUnknownSignificantEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceUnknownSignificantEvents");
}

id objc_msgSend_fetchCameraSnapshotForBulletinContext_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCameraSnapshotForBulletinContext:completionHandler:");
}

id objc_msgSend_fetchSignificantEventsWithUUIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSignificantEventsWithUUIDs:completion:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithNoResult");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:error:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstBaselineAnchor");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flatMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flatMap:");
}

id objc_msgSend_futureWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithBlock:");
}

id objc_msgSend_futureWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithError:");
}

id objc_msgSend_futureWithNoResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithNoResult");
}

id objc_msgSend_futureWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithResult:");
}

id objc_msgSend_getErrorDescription_detailedErrorDescription_forCameraStreamError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getErrorDescription:detailedErrorDescription:forCameraStreamError:");
}

id objc_msgSend_handleFaceMisclassificationForSignificantEvent_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFaceMisclassificationForSignificantEvent:completion:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_heightConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightConstraint");
}

id objc_msgSend_hf_cameraProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_cameraProfileWithIdentifier:");
}

id objc_msgSend_hf_characteristicValueManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_characteristicValueManager");
}

id objc_msgSend_hf_currentUserIsAdministrator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_currentUserIsAdministrator");
}

id objc_msgSend_hf_errorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_errorWithCode:");
}

id objc_msgSend_hf_keyColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_keyColor");
}

id objc_msgSend_hf_serviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hf_serviceWithIdentifier:");
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "home");
}

id objc_msgSend_homeKitObjectURLForDestination_secondaryDestination_UUID_queryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:");
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeManager");
}

id objc_msgSend_hu_preloadContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hu_preloadContent");
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconWithSystemImageName:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithBadgeView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBadgeView:");
}

id objc_msgSend_initWithCameraProfile_cameraStream_valueManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCameraProfile:cameraStream:valueManager:");
}

id objc_msgSend_initWithCameraProfile_notificationUUID_clipUUID_imageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCameraProfile:notificationUUID:clipUUID:imageURL:");
}

id objc_msgSend_initWithDelegate_itemProvidersCreator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:itemProvidersCreator:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithHome_serviceTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHome:serviceTypes:");
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMode:");
}

id objc_msgSend_initWithNotification_home_cameraProfile_notificationUUID_clipUUID_snapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotification:home:cameraProfile:notificationUUID:clipUUID:snapshot:");
}

id objc_msgSend_initWithOwningView_constraintBuilder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOwningView:constraintBuilder:");
}

id objc_msgSend_initWithProfile_valueSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProfile:valueSource:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceUnlocked");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExecuting");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isOutgoingAudioEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOutgoingAudioEnabled");
}

id objc_msgSend_itemManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemManager");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_latestResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestResults");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainThreadScheduler");
}

id objc_msgSend_microphoneControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "microphoneControl");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mode");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_na_each_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_each:");
}

id objc_msgSend_na_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_filter:");
}

id objc_msgSend_na_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_firstObjectPassingTest:");
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_map:");
}

id objc_msgSend_na_safeSetObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_safeSetObject:forKey:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nearbyAccessoriesViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nearbyAccessoriesViewController");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationRequestIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationRequestIdentifier");
}

id objc_msgSend_notificationSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationSnapshot");
}

id objc_msgSend_numberOfSectionsDisplayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSectionsDisplayed");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:completionHandler:");
}

id objc_msgSend_person(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "person");
}

id objc_msgSend_playerViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerViewController");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_recover_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recover:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_reloadAfterNotificationUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAfterNotificationUpdate");
}

id objc_msgSend_reloadAndUpdateAllItemsFromSenderSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAndUpdateAllItemsFromSenderSelector:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "section");
}

id objc_msgSend_sendEvent_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:withData:");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceType");
}

id objc_msgSend_serviceUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceUUIDs");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessQueue:");
}

id objc_msgSend_setAccessoryImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryImage:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionResultText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionResultText:");
}

id objc_msgSend_setAffectedService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffectedService:");
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSelection:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundEffect:");
}

id objc_msgSend_setBadgeHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeHidden:");
}

id objc_msgSend_setBadgeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeOffset:");
}

id objc_msgSend_setCameraClipUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraClipUUID:");
}

id objc_msgSend_setCameraNotificationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraNotificationUUID:");
}

id objc_msgSend_setCameraProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraProfile:");
}

id objc_msgSend_setCameraSignificantEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraSignificantEvents:");
}

id objc_msgSend_setCameraSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraSource:");
}

id objc_msgSend_setCameraView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraView:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstraints:");
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContent:");
}

id objc_msgSend_setContentEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentEffect:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentInsetAdjustmentBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsetAdjustmentBehavior:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorContent:");
}

id objc_msgSend_setErrorContent_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorContent:animated:");
}

id objc_msgSend_setExecuting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecuting:");
}

id objc_msgSend_setFaceKnownSignificantEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceKnownSignificantEvents:");
}

id objc_msgSend_setFaceUnknownSignificantEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceUnknownSignificantEvents:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHeightConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeightConstraint:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesWhenStopped:");
}

id objc_msgSend_setHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHome:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setItemManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemManager:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setNearbyAccessoriesViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyAccessoriesViewController:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationActions:");
}

id objc_msgSend_setNotificationRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationRequestIdentifier:");
}

id objc_msgSend_setNotificationSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationSnapshot:");
}

id objc_msgSend_setNumberOfAssociatedAccessoriesDisplayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfAssociatedAccessoriesDisplayed:");
}

id objc_msgSend_setNumberOfSectionsDisplayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfSectionsDisplayed:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOutgoingAudioEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoingAudioEnabled:");
}

id objc_msgSend_setOverrideHome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideHome:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setResultString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultString:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSectionContentInsetFollowsLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionContentInsetFollowsLayoutMargins:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setServiceUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceUUIDs:");
}

id objc_msgSend_setShouldDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDismiss:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setSpinner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpinner:");
}

id objc_msgSend_setStaticConstraintSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStaticConstraintSet:");
}

id objc_msgSend_setStatusAccessoryImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusAccessoryImage:");
}

id objc_msgSend_setStatusAccessoryImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusAccessoryImageView:");
}

id objc_msgSend_setStatusBarView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBarView:");
}

id objc_msgSend_setStatusDisplayStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusDisplayStyle:");
}

id objc_msgSend_setStatusLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusLabel:");
}

id objc_msgSend_setStatusText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusText:");
}

id objc_msgSend_setStatusTextOverrideCancellationToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusTextOverrideCancellationToken:");
}

id objc_msgSend_setStatusView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewController:");
}

id objc_msgSend_setWantsPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsPreferredContentSize:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDispatcher");
}

id objc_msgSend_shouldDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDismiss");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshot");
}

id objc_msgSend_snapshotControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotControl");
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spinner");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_staticConstraintSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "staticConstraintSet");
}

id objc_msgSend_statusAccessoryImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusAccessoryImage");
}

id objc_msgSend_statusAccessoryImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusAccessoryImageView");
}

id objc_msgSend_statusBarView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarView");
}

id objc_msgSend_statusDisplayStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusDisplayStyle");
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusLabel");
}

id objc_msgSend_statusText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusText");
}

id objc_msgSend_statusTextOverrideCancellationToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusTextOverrideCancellationToken");
}

id objc_msgSend_statusView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusView");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_streamControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamControl");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBlackColor");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemGrayColor");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_writePrimaryState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writePrimaryState:");
}

id objc_msgSend_writeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeValue:");
}

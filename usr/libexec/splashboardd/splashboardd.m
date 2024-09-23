void sub_1000026EC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_transactionWorkForClient:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextWrapper"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    objc_msgSend(v2, "setContextWrapper:", 0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002A24;
  block[3] = &unk_10000C730;
  v6 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

intptr_t sub_100002A24(uint64_t a1)
{
  +[CATransaction flush](CATransaction, "flush");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100002A8C()
{
  if (qword_100011520 != -1)
    dispatch_once(&qword_100011520, &stru_10000C5A8);
  return (id)qword_100011518;
}

void sub_100002ACC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "Snapshot");
  v2 = (void *)qword_100011518;
  qword_100011518 = (uint64_t)v1;

}

id sub_100002AFC()
{
  if (qword_100011530 != -1)
    dispatch_once(&qword_100011530, &stru_10000C5C8);
  return (id)qword_100011528;
}

void sub_100002B3C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "Memory");
  v2 = (void *)qword_100011528;
  qword_100011528 = (uint64_t)v1;

}

id sub_100002B6C()
{
  if (qword_100011540 != -1)
    dispatch_once(&qword_100011540, &stru_10000C5E8);
  return (id)qword_100011538;
}

void sub_100002BAC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "FetchRequests");
  v2 = (void *)qword_100011538;
  qword_100011538 = (uint64_t)v1;

}

id sub_100002BDC()
{
  if (qword_100011550 != -1)
    dispatch_once(&qword_100011550, &stru_10000C608);
  return (id)qword_100011548;
}

void sub_100002C1C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "SnapshotReaper");
  v2 = (void *)qword_100011548;
  qword_100011548 = (uint64_t)v1;

}

id sub_100002C4C()
{
  if (qword_100011560 != -1)
    dispatch_once(&qword_100011560, &stru_10000C628);
  return (id)qword_100011558;
}

void sub_100002C8C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "DaemonLifecycle");
  v2 = (void *)qword_100011558;
  qword_100011558 = (uint64_t)v1;

}

id sub_100002CBC()
{
  if (qword_100011570 != -1)
    dispatch_once(&qword_100011570, &stru_10000C648);
  return (id)qword_100011568;
}

void sub_100002CFC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "Capture");
  v2 = (void *)qword_100011568;
  qword_100011568 = (uint64_t)v1;

}

id sub_100002D2C()
{
  if (qword_100011580 != -1)
    dispatch_once(&qword_100011580, &stru_10000C668);
  return (id)qword_100011578;
}

void sub_100002D6C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "FileManifest");
  v2 = (void *)qword_100011578;
  qword_100011578 = (uint64_t)v1;

}

id sub_100002D9C()
{
  if (qword_100011590 != -1)
    dispatch_once(&qword_100011590, &stru_10000C688);
  return (id)qword_100011588;
}

void sub_100002DDC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "Purge");
  v2 = (void *)qword_100011588;
  qword_100011588 = (uint64_t)v1;

}

id sub_100002E0C()
{
  if (qword_1000115A0 != -1)
    dispatch_once(&qword_1000115A0, &stru_10000C6A8);
  return (id)qword_100011598;
}

void sub_100002E4C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SplashBoard", "Common");
  v2 = (void *)qword_100011598;
  qword_100011598 = (uint64_t)v1;

}

uint64_t sub_100002FA4(uint64_t result)
{
  if (result)
  {
    if (result == 2)
      return _UIAppStatusBarDefaultDoubleHeight();
    else
      return _UIAppStatusBarDefaultHeight();
  }
  return result;
}

void sub_1000036C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  void *v14;
  id v15;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(exception_object);
    if (a14)
      *a14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_errorForParsingException:bundleID:", v15, a13));

    objc_end_catch();
    JUMPOUT(0x1000035F8);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003CFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  id v23;
  id v24;
  void *v25;
  void *v26;

  if (a2 == 1)
  {
    v23 = objc_begin_catch(exception_object);
    if (a19)
    {
      v24 = objc_alloc((Class)XBLaunchImageError);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exception thrown during configuration load: %@")));
      *a19 = objc_msgSend(v24, "initWithCode:bundleID:reason:fatal:", 2, a21, v25, 0);

    }
    objc_end_catch();
    JUMPOUT(0x100003CA8);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000415C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "subviews"));

  if (v2)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "subviews", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          sub_10000415C(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
  objc_msgSend(v1, "setSemanticContentAttribute:", 4);

}

void sub_1000048B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  if (a2 == 1)
  {
    v10 = objc_begin_catch(exception_object);
    v11 = objc_alloc((Class)XBLaunchImageError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 32), "bundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exception thrown during display: %@")));
    v14 = objc_msgSend(v11, "initWithCode:bundleID:reason:fatal:", 7, v12, v13, 1);

    objc_end_catch();
    if (!v14)
      JUMPOUT(0x100004730);
    JUMPOUT(0x1000046DCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000057E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_autoreleasePoolPush();
  v1 = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[XBLaunchImageProviderServer sharedInstance](XBLaunchImageProviderServer, "sharedInstance"));
  objc_msgSend(v2, "run");

  objc_autoreleasePoolPop(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v3, "run");

  objc_autoreleasePoolPop(v0);
  return 0xFFFFFFFFLL;
}

void sub_1000058DC(id a1)
{
  XBLaunchImageProviderServer *v1;
  void *v2;

  v1 = objc_alloc_init(XBLaunchImageProviderServer);
  v2 = (void *)qword_1000115A8;
  qword_1000115A8 = (uint64_t)v1;

}

void sub_100005A74(id a1)
{
  void *v1;
  void *v2;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[XBLaunchImageProviderServer run]_block_invoke"));
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("XBLaunchImageProviderServer.m"), 96, CFSTR("this call must be made on the main thread"));

  }
  qword_1000115C0 = (uint64_t)pthread_self();
}

void sub_100005B04(id a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  int v12;
  double v13;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v2 = sub_100002C4C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Warming up", (uint8_t *)&v12, 2u);
  }

  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  v6 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v7 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  objc_opt_class(UIApplicationSceneSettings);
  UIAnimationDragCoefficient(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  +[UIWindow setShouldRestrictViewsForSplashboard:](UIWindow, "setShouldRestrictViewsForSplashboard:", 1);
  +[UIWindow setRestrictedSplashboardClasses:](UIWindow, "setRestrictedSplashboardClasses:", &off_10000CC08);

  v8 = sub_100002CBC();
  _XBDebugCaptureIsEnabled(v8);
  v9 = sub_100002C4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v1, "timeIntervalSinceNow");
    v12 = 134217984;
    v13 = -v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warm-up complete after %.3fs", (uint8_t *)&v12, 0xCu);
  }

}

void sub_1000062B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006310(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006320(uint64_t a1)
{

}

void sub_100006328(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  id obj;

  v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(a1 + 96))
  {
    if (*(_BYTE *)(a1 + 97))
      v3 = 3;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v12 = *(id *)(v10 + 40);
  obj = v7;
  v11 = objc_msgSend(v4, "_onMain_createLaunchWindowForClient:withLaunchRequest:appInfo:captureInfo:captureOptions:error:", v5, v8, v9, &obj, v3, &v12);
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v10 + 40), v12);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
  pthread_dependency_fulfill_np(*(_QWORD *)(a1 + 88), 0);
  objc_autoreleasePoolPop(v2);
}

void sub_1000063EC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  xpc_dictionary_set_int64(v7, XBLaunchImageProviderMessageKeyContextID, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_secureEncoded"));
    BSSerializeDataToXPCDictionaryWithKey(v4, v7, XBLaunchImageProviderMessageKeyError);

  }
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_secureEncoded"));
      BSSerializeDataToXPCDictionaryWithKey(v6, v7, XBLaunchImageProviderMessageKeyCaptureInfo);

    }
  }

}

_DWORD *sub_100006B04(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _DWORD *result;
  int v5;
  const __CFString *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 24);
  *(_DWORD *)(v2 + 24) = dispatch_source_get_data(*(dispatch_source_t *)(v2 + 16));
  result = *(_DWORD **)(a1 + 32);
  v5 = result[6];
  if (v3 != v5)
  {
    if (v5 == 16)
    {
      v6 = CFSTR("ProcessMemoryWarning");
      return objc_msgSend(result, "_publishMemoryReportForPressureType:", v6);
    }
    if (v5 == 32)
    {
      v6 = CFSTR("ProcessMemoryCritical");
      return objc_msgSend(result, "_publishMemoryReportForPressureType:", v6);
    }
  }
  return result;
}

void sub_100006D0C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;

  v3 = kSymptomDiagnosticReplySuccess;
  v4 = a2;
  if (objc_msgSend(v4, "bs_BOOLForKey:", v3))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kSymptomDiagnosticReplySessionID));

    v6 = sub_100002AFC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000071DC(a1, (uint64_t)v5, v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("reason")));

    v9 = objc_msgSend(v8, "longValue");
    v10 = sub_100002AFC();
    v5 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100007260(a1, (uint64_t)v9, v5);
  }

}

void sub_100006ED0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006EE8(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%@] unsupported configuration found in xib - ignoring UIWindow", buf, 0xCu);

}

void sub_100006F40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000057FC();
  sub_1000057E4((void *)&_mh_execute_header, v0, v1, "launchInterface: no bundle", v2, v3, v4, v5, v6);
  sub_1000057F4();
}

void sub_100006F6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000057FC();
  sub_1000057E4((void *)&_mh_execute_header, v0, v1, "launchInterface: isStoryboard", v2, v3, v4, v5, v6);
  sub_1000057F4();
}

void sub_100006F98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000057FC();
  sub_1000057E4((void *)&_mh_execute_header, v0, v1, "launchInterface: isXIB", v2, v3, v4, v5, v6);
  sub_1000057F4();
}

void sub_100006FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000057FC();
  sub_1000057E4((void *)&_mh_execute_header, v0, v1, "launchInterface: isConfiguration", v2, v3, v4, v5, v6);
  sub_1000057F4();
}

void sub_100006FF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000057FC();
  sub_1000057E4((void *)&_mh_execute_header, v0, v1, "launchInterface: unsupported", v2, v3, v4, v5, v6);
  sub_1000057F4();
}

void sub_10000701C()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[22];
  __int16 v3;
  uint64_t v4;

  sub_100005808();
  v3 = v0;
  v4 = 25000000;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "[%@] estimated size (%zu) is over limit (%zu); proceeding to capture under set default",
    v2,
    0x20u);
}

void sub_1000070A0()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100005808();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[%@] calculated size: %zu", v1, 0x16u);
}

void sub_100007114(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006ED0((void *)&_mh_execute_header, a2, a3, "Not an allowed client %{public}@", a5, a6, a7, a8, 2u);
  sub_100006EE0();
}

void sub_100007178(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006ED0((void *)&_mh_execute_header, a2, a3, "Error getting process memory while processing bundleID: %{public}@", a5, a6, a7, a8, 2u);
  sub_100006EE0();
}

void sub_1000071DC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Memory pressure event: %{public}@. Published with sessionID: %{public}@", (uint8_t *)&v4, 0x16u);
  sub_100006EE0();
}

void sub_100007260(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
  v7 = 138543874;
  v8 = v5;
  v9 = 2048;
  v10 = a2;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Memory pressure event: %{public}@. Not published for reason code: %ld. Memory history: %{public}@", (uint8_t *)&v7, 0x20u);

}

id objc_msgSend__configureNewWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureNewWindow");
}

id objc_msgSend__configureRootViewForRTL_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureRootViewForRTL:bundle:");
}

id objc_msgSend__errorForParsingException_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorForParsingException:bundleID:");
}

id objc_msgSend__estimatedMemorySizeOfViewHierarchy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_estimatedMemorySizeOfViewHierarchy:");
}

id objc_msgSend__getProcessMemoryUsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getProcessMemoryUsed");
}

id objc_msgSend__handlePreheat_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlePreheat:forClient:");
}

id objc_msgSend__ioSurfaceForLayerContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_ioSurfaceForLayerContents:");
}

id objc_msgSend__launchImageTraitCollectionForInterfaceOrientation_inBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchImageTraitCollectionForInterfaceOrientation:inBounds:");
}

id objc_msgSend__onMain_createLaunchWindowForClient_withLaunchRequest_appInfo_captureInfo_captureOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onMain_createLaunchWindowForClient:withLaunchRequest:appInfo:captureInfo:captureOptions:error:");
}

id objc_msgSend__parseInterfaceConfiguration_bundle_bundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseInterfaceConfiguration:bundle:bundleID:error:");
}

id objc_msgSend__parseInterfaceWithNibName_bundle_bundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseInterfaceWithNibName:bundle:bundleID:error:");
}

id objc_msgSend__parseInterfaceWithStoryboardName_bundle_bundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseInterfaceWithStoryboardName:bundle:bundleID:error:");
}

id objc_msgSend__parseLaunchInterface_bundle_bundlePath_bundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseLaunchInterface:bundle:bundlePath:bundleID:error:");
}

id objc_msgSend__queue_handleGetLaunchImage_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue_handleGetLaunchImage:forClient:");
}

id objc_msgSend__removeTransactionWorkForClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeTransactionWorkForClient:");
}

id objc_msgSend__setCustomSafeAreaInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCustomSafeAreaInsets:");
}

id objc_msgSend__setInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setInterfaceOrientation:");
}

id objc_msgSend__setLocalOverrideTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLocalOverrideTraitCollection:");
}

id objc_msgSend__setRotatableViewOrientation_updateStatusBar_duration_force_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRotatableViewOrientation:updateStatusBar:duration:force:");
}

id objc_msgSend__setTransactionWork_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTransactionWork:forClient:");
}

id objc_msgSend__setUIIBAlwaysProvidePeripheryInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUIIBAlwaysProvidePeripheryInsets:");
}

id objc_msgSend__setWindowInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setWindowInterfaceOrientation:");
}

id objc_msgSend__setupProcessMemoryPressureMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupProcessMemoryPressureMonitor");
}

id objc_msgSend__transactionWorkForClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transactionWorkForClient:");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_update");
}

id objc_msgSend__updateUserInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUserInterfaceIdiom");
}

id objc_msgSend__userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userInterfaceIdiom");
}

id objc_msgSend__verifyMemoryImpactOfViewHierarchy_bundleID_size_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_verifyMemoryImpactOfViewHierarchy:bundleID:size:error:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allocationSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocationSize");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bars(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bars");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bs_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_BOOLForKey:");
}

id objc_msgSend_bs_safeNumberForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_safeNumberForKey:");
}

id objc_msgSend_bs_secureEncoded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_secureEncoded");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundlePath");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_capInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capInsets");
}

id objc_msgSend_captureInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureInformation");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_colorName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorName");
}

id objc_msgSend_colorNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contents");
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextID");
}

id objc_msgSend_contextWrapper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWrapper");
}

id objc_msgSend_contextWrapperForApplicationWithCompatibilityInfo_launchRequest_captureOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWrapperForApplicationWithCompatibilityInfo:launchRequest:captureOptions:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_customSafeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customSafeAreaInsets");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultWritingDirectionForLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWritingDirectionForLanguage:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "height");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageName");
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageRespectsSafeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageRespectsSafeAreaInsets");
}

id objc_msgSend_initWithApplicationCompatibilityInfo_launchRequest_captureOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationCompatibilityInfo:launchRequest:captureOptions:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCode_bundleID_reason_fatal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:bundleID:reason:fatal:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithMatchingView_image_bottom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMatchingView:image:bottom:");
}

id objc_msgSend_instantiateInitialViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instantiateInitialViewController");
}

id objc_msgSend_instantiateWithOwner_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instantiateWithOwner:options:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConfiguration");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFatal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFatal");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isStoryboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStoryboard");
}

id objc_msgSend_isXIB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isXIB");
}

id objc_msgSend_launchInterfaceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchInterfaceIdentifier");
}

id objc_msgSend_launchInterfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchInterfaceWithIdentifier:");
}

id objc_msgSend_launchesOpaque(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchesOpaque");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizations");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "naturalSize");
}

id objc_msgSend_navigationBarImageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBarImageName");
}

id objc_msgSend_nibWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nibWithNibName:bundle:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_realToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "realToken");
}

id objc_msgSend_recordMemoryForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMemoryForBundleID:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_replyForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyForMessage:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screen");
}

id objc_msgSend_sendReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReply:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBottom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottom:");
}

id objc_msgSend_setCaarFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaarFilePath:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContextWrapper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContextWrapper:");
}

id objc_msgSend_setEstimatedMemoryImpact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedMemoryImpact:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageView:");
}

id objc_msgSend_setMatchingView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatchingView:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsDisplay");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setRestrictedSplashboardClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestrictedSplashboardClasses:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSemanticContentAttribute:");
}

id objc_msgSend_setShouldRestrictViewsForSplashboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRestrictViewsForSplashboard:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_signatureWithDomain_type_subType_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:reply:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_statusBarState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusBarState");
}

id objc_msgSend_storyboardWithName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storyboardWithName:bundle:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongToStrongObjectsMapTable");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_succinctDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "succinctDescription");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_tabBarImageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabBarImageName");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_tokenFromXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenFromXPCConnection:");
}

id objc_msgSend_toolbarImageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toolbarImageName");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollectionWithTraitsFromCollections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithTraitsFromCollections:");
}

id objc_msgSend_traitCollectionWithUserInterfaceIdiom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithUserInterfaceIdiom:");
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unload");
}

id objc_msgSend_updateLaunchRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLaunchRequest:");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_usesInputSystemUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usesInputSystemUI");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "width");
}

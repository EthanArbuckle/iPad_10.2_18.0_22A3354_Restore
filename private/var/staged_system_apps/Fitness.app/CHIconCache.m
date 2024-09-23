@implementation CHIconCache

+ (void)initializeCachePathOnMainQueue
{
  id v2;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v2 = sub_1000AA158();

  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_10077A578);
  }
}

+ (void)_fetchIconFromNRGWithParameters:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1000CEBF8;
  v31 = sub_1000CEC08;
  v32 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACXDeviceConnection sharedDeviceConnection](ACXDeviceConnection, "sharedDeviceConnection"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000CEC10;
  v24[3] = &unk_10077A5A0;
  v26 = &v27;
  v10 = v8;
  v25 = v10;
  objc_msgSend(v9, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v7, v24);

  v11 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "traitCollection"));
  objc_msgSend(v13, "displayScale");
  if (v14 <= 2.0)
    v15 = objc_msgSend(v5, "iconVariant2x");
  else
    v15 = objc_msgSend(v5, "iconVariant3x");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NanoResourceGrabber sharedInstance](NanoResourceGrabber, "sharedInstance"));
  if (v28[5])
    v18 = (void *)v28[5];
  else
    v18 = v7;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000CEC5C;
  v21[3] = &unk_10077A5C8;
  v19 = v5;
  v22 = v19;
  v20 = v6;
  v23 = v20;
  objc_msgSend(v17, "getIconForBundleID:iconVariant:block:timeout:", v18, v16, v21, 20.0);

  _Block_object_dispose(&v27, 8);
}

+ (void)_fetchRoundIconWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CED9C;
  v8[3] = &unk_10077A5C8;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  objc_msgSend(a1, "_fetchIconFromNRGWithParameters:completion:", v7, v8);

}

+ (void)_fetchIconFromLaunchServicesWithParameters:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000CEBF8;
  v15 = sub_1000CEC08;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CF054;
  v8[3] = &unk_10077A5F0;
  v7 = v5;
  v9 = v7;
  v10 = &v11;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v8);
  v6[2](v6, v12[5]);

  _Block_object_dispose(&v11, 8);
}

+ (void)_fetchChicletWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CF218;
  v8[3] = &unk_10077A5C8;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  objc_msgSend(a1, "_fetchIconFromLaunchServicesWithParameters:completion:", v7, v8);

}

+ (void)fetchWatchIconWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  void (**v22)(id, uint64_t, _QWORD);
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v7)
  {
    objc_msgSend(a1, "initializeCachePathOnMainQueue");
    objc_msgSend(v6, "setNeedsWatchIcon:", 1);
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_1000CEBF8;
    v29 = sub_1000CEC08;
    v30 = 0;
    v8 = sub_100060C00(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = sub_1000CF624();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));
    v13 = (void *)v26[5];
    v26[5] = v12;

    if (v26[5])
    {
      _HKInitializeLogging(v14, v15);
      v16 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", buf, 0xCu);
      }
      v7[2](v7, v26[5], 0);
    }
    else
    {
      global_queue = dispatch_get_global_queue(25, 0);
      v18 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000CF664;
      block[3] = &unk_10077A668;
      v24 = a1;
      v20 = v6;
      v23 = &v25;
      v21 = v9;
      v22 = v7;
      dispatch_async(v18, block);

    }
    _Block_object_dispose(&v25, 8);

  }
}

+ (id)fetchWatchIconWithParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  dispatch_semaphore_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  dispatch_semaphore_t v24;
  uint64_t *v25;
  __int128 *p_buf;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = a3;
  objc_msgSend(a1, "initializeCachePathOnMainQueue");
  objc_msgSend(v4, "setNeedsWatchIcon:", 1);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1000CEBF8;
  v32 = sub_1000CEC08;
  v33 = 0;
  v5 = sub_100060C00(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = sub_1000CF624();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));
  v10 = (void *)v29[5];
  v29[5] = v9;

  if (v29[5])
  {
    _HKInitializeLogging(v11, v12);
    v13 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", (uint8_t *)&buf, 0xCu);
    }
    v14 = (id)v29[5];
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x3032000000;
    v36 = sub_1000CEBF8;
    v37 = sub_1000CEC08;
    v38 = 0;
    v15 = dispatch_semaphore_create(0);
    v16 = sub_1000CFB74();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000CFBB4;
    v21[3] = &unk_10077A6B8;
    v27 = a1;
    v22 = v4;
    v25 = &v28;
    p_buf = &buf;
    v23 = v6;
    v24 = v15;
    v18 = v15;
    dispatch_async(v17, v21);

    v19 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v18, v19);
    v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }

  _Block_object_dispose(&v28, 8);
  return v14;
}

+ (void)fetchPhoneIconWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  void (**v22)(id, uint64_t, _QWORD);
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v7)
  {
    objc_msgSend(a1, "initializeCachePathOnMainQueue");
    objc_msgSend(v6, "setNeedsWatchIcon:", 0);
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_1000CEBF8;
    v29 = sub_1000CEC08;
    v30 = 0;
    v8 = sub_100060C00(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = sub_1000CF624();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));
    v13 = (void *)v26[5];
    v26[5] = v12;

    if (v26[5])
    {
      _HKInitializeLogging(v14, v15);
      v16 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", buf, 0xCu);
      }
      v7[2](v7, v26[5], 0);
    }
    else
    {
      global_queue = dispatch_get_global_queue(25, 0);
      v18 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000D001C;
      block[3] = &unk_10077A668;
      v24 = a1;
      v20 = v6;
      v23 = &v25;
      v21 = v9;
      v22 = v7;
      dispatch_async(v18, block);

    }
    _Block_object_dispose(&v25, 8);

  }
}

+ (id)fetchPhoneIconWithParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  dispatch_semaphore_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  dispatch_semaphore_t v24;
  uint64_t *v25;
  __int128 *p_buf;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = a3;
  objc_msgSend(a1, "initializeCachePathOnMainQueue");
  objc_msgSend(v4, "setNeedsWatchIcon:", 0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1000CEBF8;
  v32 = sub_1000CEC08;
  v33 = 0;
  v5 = sub_100060C00(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = sub_1000CF624();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));
  v10 = (void *)v29[5];
  v29[5] = v9;

  if (v29[5])
  {
    _HKInitializeLogging(v11, v12);
    v13 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", (uint8_t *)&buf, 0xCu);
    }
    v14 = (id)v29[5];
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x3032000000;
    v36 = sub_1000CEBF8;
    v37 = sub_1000CEC08;
    v38 = 0;
    v15 = dispatch_semaphore_create(0);
    v16 = sub_1000CFB74();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000D052C;
    v21[3] = &unk_10077A6B8;
    v27 = a1;
    v22 = v4;
    v25 = &v28;
    p_buf = &buf;
    v23 = v6;
    v24 = v15;
    v18 = v15;
    dispatch_async(v17, v21);

    v19 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v18, v19);
    v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }

  _Block_object_dispose(&v28, 8);
  return v14;
}

@end

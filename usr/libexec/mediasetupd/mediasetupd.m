uint64_t start()
{
  void *v0;
  id v1;
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v7[16];

  v0 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.mediasetupd") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10002FED4();
  }
  v1 = NSTemporaryDirectory();
  v2 = sub_10002E034();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "mediasetupd launching", v7, 2u);
  }

  v4 = +[MSDManager sharedInstance](MSDManager, "sharedInstance");
  objc_autoreleasePoolPop(v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v5, "run");

  return 0;
}

void sub_100001D14(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDCloudManager sharedManager](MSDCloudManager, "sharedManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](MSDHomeManager, "sharedManager"));
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCloudDataManager:homeManager:", v5, v2);
  v4 = (void *)qword_100052708;
  qword_100052708 = (uint64_t)v3;

}

void sub_100001F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *MSDDataRefreshReasonToString(unint64_t a1)
{
  if (a1 > 9)
    return CFSTR("Unknown");
  else
    return off_100048908[a1];
}

void sub_100001F84(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    LOBYTE(v6[3]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v6 + 2);
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }

}

void sub_1000021BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Hit error when trying to fetch subscription %@", (uint8_t *)&v17, 0xCu);
    }

    if ((objc_msgSend(v6, "CKErrorHasErrorCode:", 3) & 1) != 0
      || (objc_msgSend(v6, "CKErrorHasErrorCode:", 4) & 1) != 0
      || objc_msgSend(v6, "isErrorFatal"))
    {
      v9 = *(_QWORD *)(a1 + 48);
      if (v9)
        (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_addSubscriptionWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32)));
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        v14 = *(void **)(a1 + 32);
        v17 = 138412290;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There exists a subscription for %@", (uint8_t *)&v17, 0xCu);
      }

      v15 = *(_QWORD *)(a1 + 48);
      if (v15)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v15 + 16))(v15, 1, 0);
    }
    else
    {
      if (v13)
      {
        v16 = *(void **)(a1 + 32);
        v17 = 138412290;
        v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding subscription for %@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_addSubscriptionWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }

  }
}

void sub_1000025BC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;

  v6 = a2;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138477827;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Subscription saved %{private}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_100002730((uint64_t)v7, v11);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v6 != 0, v7);

}

void sub_1000026F0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to add subscription, nil CKSubscription object", v1, 2u);
}

void sub_100002730(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to save Subscription, %{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_100002838(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_100052720;
  qword_100052720 = (uint64_t)v1;

}

void sub_100003190(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_100052730;
  qword_100052730 = (uint64_t)v1;

}

void sub_100003248(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000326C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create NSData object, %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000032E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Key/value for defaults cannot be nil", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000330C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Cannot Delete object with Nil key", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100003338()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Cannot retrieve value of nil key", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100003364(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error unarchiving object for key %@, %@", (uint8_t *)&v3, 0x16u);
}

void sub_100003870(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Failed to initialize background activity task on nil identifier", a5, a6, a7, a8, 0);
  sub_100003258();
}

void sub_1000038A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Failed to checkin activity with system", a5, a6, a7, a8, 0);
  sub_100003258();
}

void sub_1000038D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Cant schedule activity on NIL activity block", a5, a6, a7, a8, 0);
  sub_100003258();
}

void sub_100003B48(uint64_t a1)
{
  void *v1;
  double *WeakRetained;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    WeakRetained[2] = (double)(unint64_t)objc_msgSend(v1, "pointScale");

  }
}

void sub_1000041D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000041E8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000041F8(uint64_t a1)
{

}

void sub_100004200(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    v9 = sub_10002E034();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000049A4();

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100004454(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void (*v13)(void);
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t v17[16];

  v7 = a2;
  v8 = a4;
  v9 = objc_msgSend(a3, "statusCode");
  if (!v7 || v8)
  {
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100004A04();

    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      v13 = *(void (**)(void))(v16 + 16);
      goto LABEL_13;
    }
  }
  else
  {
    if (v9 == (id)200)
    {
      v10 = sub_10002E034();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully fetched data from URL", v17, 2u);
      }

    }
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_13:
      v13();
    }
  }

}

void sub_100004770(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004794(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1000047A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Failed to initialize ArtworkManager, Nil serviceID passed", a5, a6, a7, a8, 0);
  sub_100003258();
}

void sub_1000047D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error retrieving NSCachesDirectory URL, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100004830(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Failed to save Nil image data in local cache dir", a5, a6, a7, a8, 0);
  sub_100003258();
}

void sub_100004860(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Failed to dave image, Nil iconImageName", a5, a6, a7, a8, 0);
  sub_100003258();
}

void sub_100004890(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "path"));
  sub_100004788();
  v8 = 2113;
  v9 = a2;
  sub_100004794((void *)&_mh_execute_header, a3, v6, "Error creating directory for icon file path: %{private}@, %{private}@", v7);

}

void sub_100004934(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s RemoteImageURL is nil", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_1000049A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error fetching data from URL %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100004A04()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100004788();
  v3 = 2048;
  v4 = v0;
  sub_100004794((void *)&_mh_execute_header, v1, (uint64_t)v1, "Received error from server %@, status code %ld", v2);
  sub_100004780();
}

void sub_100004A78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error deleting file %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100004AD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "File does not exist at path %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

id sub_1000050BC(id a1, MSDDefaultsInfo *a2)
{
  MSDDefaultsInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  if (objc_msgSend(v5, "isEqualToString:", kAppleMusicServiceIdentifier))
  {

    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordType](v2, "recordType"));
    v8 = objc_msgSend(v7, "isEqualToString:", MSServiceAccountRecordType);

    if (!v8)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  }

LABEL_7:
  return v6;
}

id sub_10000519C(id a1, MSDDefaultsInfo *a2)
{
  MSDDefaultsInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  if (objc_msgSend(v5, "isEqualToString:", kAppleMusicServiceIdentifier))
  {

    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordType](v2, "recordType"));
    v8 = objc_msgSend(v7, "isEqualToString:", MSServiceAccountRecordType);

    if (!v8)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo service](v2, "service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  }

LABEL_7:
  return v6;
}

uint64_t sub_10000527C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSServiceAccountRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceID"));
    if (objc_msgSend(v6, "isEqual:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
      v10 = objc_msgSend(v9, "updateListeningHistoryEnabled");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
      v12 = v10 ^ objc_msgSend(v11, "updateListeningHistoryEnabled");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_10000538C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v11 = objc_msgSend(v2, "copy");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v11, "populateMediaService:homeID:homeUserID:", v6, v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](MSServiceUpdatedHandler, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v9, "mediaServiceChanged:homeUserID:", v11, v10);

}

void sub_10000553C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005630;
  v10[3] = &unk_100048A98;
  v5 = v3;
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", v10));
  if (v6)
  {
    v7 = dispatch_time(0, 500000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000056C8;
    v8[3] = &unk_100048AC0;
    v9 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);

  }
}

id sub_100005630(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSServiceAccountRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceID"));
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1000056C8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v11 = objc_msgSend(v2, "copy");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v11, "populateMediaService:homeID:homeUserID:", v6, v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](MSServiceUpdatedHandler, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v9, "mediaServiceChanged:homeUserID:", v11, v10);

}

void sub_100005878(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000596C;
  v10[3] = &unk_100048A98;
  v5 = v3;
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", v10));
  if (v6)
  {
    v7 = dispatch_time(0, 500000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005A04;
    v8[3] = &unk_100048AC0;
    v9 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);

  }
}

id sub_10000596C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSServiceAccountRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceID"));
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_100005A04(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v11 = objc_msgSend(v2, "copy");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v11, "populateMediaService:homeID:homeUserID:", v6, v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](MSServiceUpdatedHandler, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v9, "mediaServiceRemoved:homeUserID:", v11, v10);

}

id sub_100005D28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSDefaultServiceRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id sub_100005DA8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSServiceAccountRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
    if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceID"));
      v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_100005E68(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v11 = objc_msgSend(v2, "copy");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v11, "populateMediaService:homeID:homeUserID:", v6, v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSServiceUpdatedHandler shared](MSServiceUpdatedHandler, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
  objc_msgSend(v9, "defaultMediaServiceUpdated:homeUserID:", v11, v10);

}

id sub_1000061A8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stopwatch"));
  objc_msgSend(v4, "stop");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stopwatch"));
  objc_msgSend(v5, "toggleLock:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setDidSucceed:", a2);
  return +[MSAnalytics sendServiceEvent:](MSAnalytics, "sendServiceEvent:", *(_QWORD *)(a1 + 32));
}

void sub_10000621C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  dispatch_queue_global_t global_queue;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id obj;
  MSDFetchCKDataOptions *v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  MSDFetchCKDataOptions *v48;
  _QWORD *v49;
  _QWORD *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[3];
  char v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[4];
  id v60;
  _BYTE v61[128];
  uint64_t v62;
  MSDFetchCKDataOptions *v63;

  v32 = a2;
  v31 = a3;
  if (v31)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000C434();

  }
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100006770;
  v59[3] = &unk_100048B60;
  v60 = *(id *)(a1 + 32);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "na_firstObjectPassingTest:", v59));
  if (v33)
  {
    v35 = objc_alloc_init(MSDFetchCKDataOptions);
    -[MSDFetchCKDataOptions setCreateNewZoneIfMissing:](v35, "setCreateNewZoneIfMissing:", 0);
    -[MSDFetchCKDataOptions setUserInitiatedRequest:](v35, "setUserInitiatedRequest:", 0);
    v7 = dispatch_group_create();
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = sub_1000067E0;
    v57[4] = sub_1000067F0;
    v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v56 = 1;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = *(id *)(a1 + 40);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeUserID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));

          v16 = *(void **)(a1 + 48);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1000067F8;
          v42[3] = &unk_100048BB0;
          v49 = v57;
          v50 = v55;
          v43 = v7;
          v44 = *(id *)(a1 + 32);
          v18 = v13;
          v45 = v18;
          v19 = v15;
          v20 = *(_QWORD *)(a1 + 48);
          v46 = v19;
          v47 = v20;
          v48 = v35;
          objc_msgSend(v16, "fetchRecordZoneFor:user:withOptions:withAttribution:completion:", v18, v19, v48, v17, v42);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v8);
    }

    global_queue = dispatch_get_global_queue(2, 0);
    v22 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006C64;
    block[3] = &unk_100048C00;
    v23 = *(id *)(a1 + 64);
    v40 = v55;
    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(void **)(a1 + 56);
    v38 = v23;
    block[4] = v24;
    v37 = v25;
    v39 = *(id *)(a1 + 72);
    v41 = v57;
    dispatch_group_notify(v7, v22, block);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(v57, 8);

    goto LABEL_18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
  v35 = (MSDFetchCKDataOptions *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to retrieve publicInfo for service %@"), v26));

  v27 = sub_10002E034();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    sub_10000C3D4();

  v29 = *(_QWORD *)(a1 + 72);
  if (v29)
  {
    v62 = MSUserInfoErrorStringKey;
    v63 = v35;
    v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 7, v7));
    (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v30);

LABEL_18:
  }

}

void sub_100006734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

id sub_100006770(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "serviceID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

uint64_t sub_1000067E0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000067F0(uint64_t a1)
{

}

void sub_1000067F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  int8x16_t v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serviceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v10 = MSServiceAccountRecordType;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecord createRecordWithName:recordType:recordZone:](CKRecord, "createRecordWithName:recordType:recordZone:", v9, v10, v11));

    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v34[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v34[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v15 = *(_QWORD *)(a1 + 56);
    v35[0] = v13;
    v35[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
    objc_msgSend(v12, "populateCKRecordInfo:userInfo:recordType:", v14, v16, v10);

    if (v12)
    {
      v17 = *(void **)(a1 + 64);
      v33 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
      v20 = *(_QWORD *)(a1 + 72);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100006AB8;
      v26[3] = &unk_100048B88;
      v27 = *(id *)(a1 + 56);
      v21 = *(id *)(a1 + 48);
      v32 = vextq_s8(*(int8x16_t *)(a1 + 80), *(int8x16_t *)(a1 + 80), 8uLL);
      v22 = *(_QWORD *)(a1 + 64);
      v28 = v21;
      v29 = v22;
      v30 = v5;
      v31 = *(id *)(a1 + 32);
      objc_msgSend(v17, "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:", v18, 0, 0, v19, v20, v26);

    }
    else
    {
      v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, 0));
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

  }
}

void sub_100006AB8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6 || !v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000C4C0();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v14 = v6;
    v10 = *(NSObject **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v19 = 136315651;
    v20 = "-[CKDatabase(MediaService) addMediaService:usingSetupBundles:transaction:completion:]_block_invoke_2";
    v21 = 2113;
    v22 = v11;
    v23 = 2113;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Successfully saved record for user: %{private}@ home: %{private}@", (uint8_t *)&v19, 0x20u);
  }

  if (objc_msgSend(v6, "CKErrorHasErrorCode:", 112))
  {
    v15 = sub_10002E034();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10000C494();

    v17 = *(void **)(a1 + 48);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "zoneID"));
    objc_msgSend(v17, "handleCKErrorMissingManateeIdentity:homeUserID:", v18, *(_QWORD *)(a1 + 32));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

uint64_t sub_100006C64(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t result;
  _QWORD v6[4];
  id v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v3 = (void *)objc_opt_new(MSDFetchCKDataOptions, v2);
    objc_msgSend(v3, "setUserInitiatedRequest:", 1);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100006D48;
    v6[3] = &unk_100048BD8;
    v4 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "refreshDatabase:completion:", 0, v6);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  return result;
}

void sub_100006D48(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000C538();

  }
  objc_msgSend(*(id *)(a1 + 32), "releaseTransaction");

}

void sub_100006FCC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v7);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000070E0;
    v13[3] = &unk_100048C50;
    v16 = *(id *)(a1 + 56);
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v8, "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:", v9, v10, v11, v13);

  }
}

void sub_1000070E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  uint64_t v62;
  const __CFString *v63;
  _BYTE v64[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v46 = 0;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100007570;
    v60[3] = &unk_100048A98;
    v61 = *(id *)(a1 + 32);
    v47 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_filter:", v60));
    v48 = (void *)objc_opt_new(NSMutableArray, v9);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v10 = v8;
    v55 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (!v55)
      goto LABEL_18;
    v11 = *(_QWORD *)v57;
    v12 = MSDefaultServiceRecordType;
    v53 = kCKDatabaseAccessUserInfoHomeIDKey;
    v54 = MSPlaceholderRecordType;
    v49 = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v50 = *(_QWORD *)v57;
    v51 = MSDefaultServiceRecordType;
    v52 = a1;
    while (1)
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordType", v46));
        if ((objc_msgSend(v15, "isEqualToString:", v12) & 1) == 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordType"));
          v17 = objc_msgSend(v16, "isEqualToString:", v54);

          if ((v17 & 1) != 0)
            continue;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeID"));
          v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v53));
          if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) != 0)
          {
            v20 = v10;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeUserID"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v49));
            v24 = objc_msgSend(v22, "isEqualToString:", v23);

            a1 = v52;
            v12 = v51;

            v10 = v20;
            v11 = v50;

            if (!v24)
              continue;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "service"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "serviceID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v27));

            v12 = v51;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "service"));
            v18 = objc_msgSend(v28, "copy");

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeID"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeUserID"));
            objc_msgSend(v18, "populateMediaService:homeID:homeUserID:", v15, v29, v30);

            a1 = v52;
            objc_msgSend(v48, "na_safeAddObject:", v18);
          }
          else
          {

          }
        }

      }
      v55 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (!v55)
      {
LABEL_18:

        if (objc_msgSend(v48, "count"))
        {
          v31 = *(_QWORD *)(a1 + 48);
          v7 = v46;
          v5 = v47;
          if (v31)
            (*(void (**)(uint64_t, void *, _QWORD))(v31 + 16))(v31, v48, 0);
        }
        else
        {
          v33 = sub_10002E034();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            sub_10000C5C4(v34, v35, v36, v37, v38, v39, v40, v41);

          v42 = *(_QWORD *)(a1 + 48);
          v7 = v46;
          v5 = v47;
          if (v42)
          {
            v43 = MSErrorDomain;
            v62 = MSUserInfoErrorStringKey;
            v63 = CFSTR("Fetched records but couldn't create valid service objects");
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v43, 2, v44));
            (*(void (**)(uint64_t, _QWORD, void *))(v42 + 16))(v42, 0, v45);

          }
        }

        goto LABEL_28;
      }
    }
  }
  v32 = *(_QWORD *)(a1 + 48);
  if (v32)
    (*(void (**)(uint64_t, _QWORD, void *))(v32 + 16))(v32, 0, v7);
LABEL_28:

}

id sub_100007570(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recordZoneName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

void sub_100007840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000786C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v16 = *(_QWORD *)(a1 + 48);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v7);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v9 = objc_alloc((Class)CKRecordID);
    v10 = MSDefaultServiceRecordName;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v12 = objc_msgSend(v9, "initWithRecordName:zoneID:", v10, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000079BC;
    v17[3] = &unk_100048CA0;
    v15 = *(_QWORD *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(WeakRetained, "_updateDefaultService:serviceID:userInfo:completion:", v12, v14, v15, v17);

  }
}

uint64_t sub_1000079BC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100007AFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100007B18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 || (objc_msgSend(v6, "CKErrorHasErrorCode:", 11) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v9 = objc_msgSend(v5, "copy");
    if (!v9)
    {
      v10 = objc_alloc((Class)CKRecord);
      v9 = objc_msgSend(v10, "initWithRecordType:recordID:", MSDefaultServiceRecordType, *(_QWORD *)(a1 + 32));
      v11 = MSHomeParticipantHomeUserIdentifier;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
      objc_msgSend(v9, "setRecordFieldForKey:value:", v11, v12);

    }
    objc_msgSend(v9, "setRecordFieldForKey:value:", MediaServiceIdentifier, *(_QWORD *)(a1 + 48));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100007D44;
    v17[3] = &unk_100048CF0;
    v20 = *(id *)(a1 + 56);
    v17[4] = WeakRetained;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "saveRecord:completionHandler:", v9, v17);

    v13 = v20;
    goto LABEL_7;
  }
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_10000C660(a1, (uint64_t)v7, v15);

  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(v7, "CKErrorHasErrorCode:", 112))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    objc_msgSend(WeakRetained, "handleCKErrorMissingManateeIdentity:homeUserID:", v9, v13);
LABEL_7:

  }
}

void sub_100007D44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000C6DC();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
    v15 = 138412290;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully updated default service %@", (uint8_t *)&v15, 0xCu);

  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, BOOL, id))(v11 + 16))(v11, v5 != 0, v6);
  if (objc_msgSend(v6, "CKErrorHasErrorCode:", 112))
  {
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    objc_msgSend(v12, "handleCKErrorMissingManateeIdentity:homeUserID:", v13, v14);

  }
}

void sub_10000815C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008188(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v7);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000082A8;
    v13[3] = &unk_100048D40;
    v14 = *(id *)(a1 + 48);
    v15 = v5;
    v16 = *(id *)(a1 + 56);
    objc_msgSend(WeakRetained, "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:", v9, v10, v11, v13);

  }
}

void sub_1000082A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint8_t buf[4];
  void *v38;

  v5 = a3;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000085E8;
  v32[3] = &unk_100048B10;
  v33 = *(id *)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v32));
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceID"));
    *(_DWORD *)buf = 138477827;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found default service record in cached info, serviceID: %{private}@", buf, 0xCu);

  }
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_1000086D8;
  v30 = &unk_100048A98;
  v12 = v7;
  v31 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", &v27));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "service"));
    v15 = objc_msgSend(v14, "copy");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serviceID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeUserID"));
    objc_msgSend(v15, "populateMediaService:homeID:homeUserID:", v18, v19, v20);

    v21 = *(_QWORD *)(a1 + 48);
    if (v21)
      (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v15, v5);
    goto LABEL_10;
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to find default service for user %@"), *(_QWORD *)(a1 + 32), v27, v28, v29, v30));
  v22 = sub_10002E034();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_10000C3D4();

  v24 = *(_QWORD *)(a1 + 48);
  if (v24)
  {
    v25 = MSErrorDomain;
    v35 = MSUserInfoErrorStringKey;
    v36 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, 2, v18));
    (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v26);

LABEL_10:
  }

}

id sub_1000085E8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSDefaultServiceRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordZoneName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneName"));
      v10 = objc_msgSend(v7, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id sub_1000086D8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSServiceAccountRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceID"));
    if (objc_msgSend(v6, "isEqual:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        v15 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordZoneName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordZoneName"));
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        v9 = v15;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id sub_100008B4C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stopwatch"));
  objc_msgSend(v4, "stop");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stopwatch"));
  objc_msgSend(v5, "toggleLock:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setDidSucceed:", a2);
  return +[MSAnalytics sendServiceEvent:](MSAnalytics, "sendServiceEvent:", *(_QWORD *)(a1 + 32));
}

void sub_100008BC0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v14 = *(_QWORD *)(a1 + 72);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v7);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100008D10;
    v15[3] = &unk_100048E08;
    v20 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 72);
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 40);
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    v18 = v12;
    v19 = v13;
    objc_msgSend(v8, "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:", v9, v10, v11, v15);

  }
}

void sub_100008D10(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void (**v33)(id, _QWORD, void *);
  id v34;
  NSObject *v35;
  void (**v36)(id, _QWORD, void *);
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;
  const __CFString *v62;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100009284;
    v53[3] = &unk_100048D90;
    v54 = a1[4];
    v55 = a1[5];
    v56 = a1[6];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", v53));
    if (v8)
    {
      v9 = objc_alloc((Class)CKRecordID);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "zoneID"));
      v12 = objc_msgSend(v9, "initWithRecordName:zoneID:", v10, v11);

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100009408;
      v51[3] = &unk_100048A98;
      v52 = a1[5];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", v51));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000094C4;
      v47[3] = &unk_100048DB8;
      v49 = a1[8];
      v14 = v12;
      v48 = v14;
      v50 = a1[9];
      v15 = objc_retainBlock(v47);
      v40 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "service"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceID"));
      v39 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "service"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "serviceID"));
      LODWORD(v11) = objc_msgSend(v17, "isEqual:", v19);

      if ((_DWORD)v11)
      {
        v20 = sub_10002E034();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "User is removing Default service. Updating Default service to apple music", buf, 2u);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", kAppleMusicServiceIdentifier));
        v23 = objc_alloc((Class)CKRecordID);
        v24 = MSDefaultServiceRecordName;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "zoneID"));
        v26 = objc_msgSend(v23, "initWithRecordName:zoneID:", v24, v25);

        v27 = sub_10002E034();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "serviceID"));
          *(_DWORD *)buf = 136315394;
          v58 = "-[CKDatabase(MediaService) removeMediaService:withUserInfo:completion:]_block_invoke";
          v59 = 2112;
          v60 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s Updating Default service to %@", buf, 0x16u);

        }
        v30 = a1[7];
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "serviceID"));
        v32 = a1[5];
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1000095A0;
        v41[3] = &unk_100048DE0;
        v41[4] = a1[7];
        v42 = v14;
        v44 = v15;
        v43 = a1[4];
        v45 = a1[8];
        v46 = a1[9];
        objc_msgSend(v30, "_updateDefaultService:serviceID:userInfo:completion:", v26, v31, v32, v41);

      }
      else
      {
        objc_msgSend(a1[7], "_deleteRecord:completion:", v14, v15);
      }

      v38 = v52;
      v8 = v39;
    }
    else
    {
      v34 = sub_10002E034();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_10000C734();

      (*((void (**)(void))a1[8] + 2))();
      v36 = (void (**)(id, _QWORD, void *))a1[9];
      if (!v36)
        goto LABEL_19;
      v37 = MSErrorDomain;
      v61 = MSUserInfoErrorStringKey;
      v62 = CFSTR("Failed to remove service, no record found");
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v37, 2, v14));
      v36[2](v36, 0, v38);
    }

LABEL_19:
    goto LABEL_20;
  }
  (*((void (**)(void))a1[8] + 2))();
  v33 = (void (**)(id, _QWORD, void *))a1[9];
  if (v33)
    v33[2](v33, 0, v7);
LABEL_20:

}

id sub_100009284(id *a1, void *a2)
{
  id v3;
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
  id v14;
  void *v16;
  void *v17;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSServiceAccountRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "serviceID"));
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        v16 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordZoneName"));
        v17 = v8;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "zoneID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        v8 = v17;
        v9 = v16;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id sub_100009408(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSDefaultServiceRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1000094C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  v5 = a3;
  if (v5)
    v6 = 0;
  else
    v6 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully removed service", v17, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10000C760(a1, v9, v10, v11, v12, v13, v14, v15);
  }

  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

void sub_1000095A0(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_deleteRecord:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "serviceID"));
      v10 = 138477827;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to update default service, not removing service (%{private}@)", (uint8_t *)&v10, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v9 = *(_QWORD *)(a1 + 72);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

uint64_t sub_1000097F0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100009A50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v16 = *(_QWORD *)(a1 + 64);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v7);
  }
  else
  {
    v8 = objc_alloc((Class)CKRecordID);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v12 = objc_msgSend(v8, "initWithRecordName:zoneID:", v10, v11);

    v13 = *(void **)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009BBC;
    v17[3] = &unk_100048E80;
    v21 = *(id *)(a1 + 64);
    v14 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v12;
    v19 = v14;
    v20 = *(id *)(a1 + 56);
    v15 = v12;
    objc_msgSend(v13, "fetchRecordWithID:completionHandler:", v15, v17);

  }
}

void sub_100009BBC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v8 = *(void **)(a1 + 56);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009D88;
    v24[3] = &unk_100048E58;
    v9 = v5;
    v25 = v9;
    v26 = *(id *)(a1 + 64);
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v24);
    v10 = *(void **)(a1 + 32);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100009F44;
    v20[3] = &unk_100048CF0;
    v11 = *(id *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v23 = v11;
    v20[4] = v12;
    v21 = v13;
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v10, "saveRecord:completionHandler:", v9, v20);

    v14 = v25;
LABEL_10:

    goto LABEL_11;
  }
  v15 = sub_10002E034();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_10000C7F4();

  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v7);
  if (objc_msgSend(v7, "CKErrorHasErrorCode:", 112))
  {
    v18 = *(void **)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    objc_msgSend(v18, "handleCKErrorMissingManateeIdentity:homeUserID:", v14, v19);

    goto LABEL_10;
  }
LABEL_11:

}

void sub_100009D88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  id v17;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unsupported propertyType %lu", buf, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = MSErrorDomain;
      v14 = MSUserInfoErrorStringKey;
      v15 = CFSTR("Unsupported property type passed");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, 1, v12));
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v13);

    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = objc_msgSend(v5, "BOOLValue");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating Listening history enabled : %d", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setRecordFieldForKey:value:", MediaServiceUpdateListeningHistory, v5);
  }

}

void sub_100009F44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000C854();

  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, BOOL, void *))(v10 + 16))(v10, v5 != 0, v7);
  if (objc_msgSend(v7, "CKErrorHasErrorCode:", 112))
  {
    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    objc_msgSend(v11, "handleCKErrorMissingManateeIdentity:homeUserID:", v12, v13);

  }
}

void sub_10000A1F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "CKErrorHasErrorCode:", 112) && CKErrorIsCode(v7, 2))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CKPartialErrorsByItemIDKey));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      v11 = sub_10002E034();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Zones with Manatee Identity Lost %@", buf, 0xCu);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000A3D0;
      v17[3] = &unk_100048ED0;
      v13 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v13;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);

    }
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v7);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ms_objectsPassingTest:", &stru_100048F10));

    objc_msgSend(*(id *)(a1 + 32), "_serviceConfigInfoFor:homeUserIDS:serviceID:completion:", v16, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

id sub_10000A3D0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCKErrorMissingManateeIdentity:homeUserIDS:", a2, *(_QWORD *)(a1 + 40));
}

BOOL sub_10000A3E0(id a1, CKRecordZone *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  char v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](a2, "zoneID", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CKRecordZoneDefaultName) ^ 1;

  return v6;
}

void sub_10000A854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_10000A88C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
LABEL_8:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordFieldForKey:", MSHomeParticipantHomeUserIdentifier));
  v9 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v8);
  v10 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9);
  v11 = sub_10002E034();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 48);
      v19 = 138412546;
      v20 = v9;
      v21 = 2112;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully fetched record for homeUser: %@ matching serviceID: %@", (uint8_t *)&v19, 0x16u);
    }

    v15 = objc_alloc((Class)NSUUID);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordFieldForKey:", MSHomeParticipantHomeIdentifier));
    v17 = objc_msgSend(v15, "initWithUUIDString:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "createMediaServiceObjectFromRecord"));
    objc_msgSend(v18, "populateMediaService:homeID:homeUserID:", *(_QWORD *)(a1 + 56), v17, v9);
    objc_msgSend(*(id *)(a1 + 64), "na_safeSetObject:forKey:", v18, v9);

    goto LABEL_8;
  }
  if (v13)
  {
    v19 = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User did not request info for %@", (uint8_t *)&v19, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_12:

}

uint64_t sub_10000AAAC(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void sub_10000AD50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (!v5 || v6)
  {
    v16 = sub_10002E034();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000C924();

    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v8);
  }
  else
  {
    v9 = (void *)objc_opt_new(NSMutableArray, v7);
    v10 = *(void **)(a1 + 32);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000AF44;
    v21[3] = &unk_100048FB0;
    v11 = v9;
    v22 = v11;
    v23 = v5;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v21);
    v12 = sub_10002E034();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to remove services %@", buf, 0xCu);
    }

    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000AFE0;
    v19[3] = &unk_100048988;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v14, "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:", 0, v11, 0, 0, v15, v19);

  }
}

void sub_10000AF44(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_alloc((Class)CKRecordID);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneID"));
  v7 = objc_msgSend(v5, "initWithRecordName:zoneID:", v8, v6);
  objc_msgSend(v3, "na_safeAddObject:", v7);

}

void sub_10000AFE0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removed services %@", (uint8_t *)&v11, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v6 != 0, v7);

}

void sub_10000B394(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v7);
  }
  else
  {
    v8 = objc_alloc((Class)CKRecordID);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v12 = objc_msgSend(v8, "initWithRecordName:zoneID:", v10, v11);

    v13 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000B4F0;
    v19[3] = &unk_100048CF0;
    v23 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v20 = v15;
    v21 = v16;
    v22 = v17;
    objc_msgSend(v13, "fetchRecordWithID:withOptions:completion:", v12, v14, v19);

  }
}

void sub_10000B4F0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v16 = sub_10002E034();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000C9B4();

    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v6);
  }
  else
  {
    v7 = objc_msgSend(a2, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authCredential"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0));

    if (v11)
      objc_msgSend(v7, "setRecordFieldForKey:value:", MediaServiceAuthCredential, v11);
    if (v9)
      objc_msgSend(v7, "setRecordFieldForKey:value:", MediaServiceAuthConfiguration, v9);
    v12 = MediaServiceAuthFatalError;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "authFatalError")));
    objc_msgSend(v7, "setRecordFieldForKey:value:", v12, v13);

    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000B6E8;
    v19[3] = &unk_100049018;
    v19[4] = v14;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v14, "saveRecord:withOptions:completion:", v7, v15, v19);

  }
}

void sub_10000B6E8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000CA2C();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshDatabase:completion:", 0, &stru_100048FF0);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v5 != 0, v6);

}

void sub_10000B78C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  NSError *v10;

  v2 = a2;
  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v2;
      v6 = "Error updating caches after saving authInfo %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "Successfully updated caches after saving authInfo";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

}

void sub_10000BB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_10000BB2C(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a2;
  if (v4)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000CAA4();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000BC1C;
    v8[3] = &unk_100049040;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    +[MSAuthTokenProvider validateConfigurationResourceForMediaService:networkActivity:completion:](MSAuthTokenProvider, "validateConfigurationResourceForMediaService:networkActivity:completion:", v7, 0, v8);

  }
}

void sub_10000BC1C(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000CB04();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_10000BC9C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_1000067E0;
    v29[4] = sub_1000067F0;
    v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = sub_1000067E0;
    v27[4] = sub_1000067F0;
    v28 = 0;
    v2 = dispatch_group_create();
    dispatch_group_enter(v2);
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "UUIDString"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000BF04;
    v21[3] = &unk_1000490B8;
    v25 = v29;
    v6 = v2;
    v22 = v6;
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v23 = v7;
    v24 = v8;
    v26 = v27;
    objc_msgSend(v3, "fetchRecordZoneFor:user:withOptions:completion:", v4, v5, 0, v21);

    global_queue = dispatch_get_global_queue(33, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000C124;
    v13[3] = &unk_100049128;
    v19 = v27;
    v20 = v29;
    v18 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v16 = v11;
    v17 = v12;
    dispatch_group_notify(v6, v10, v13);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);

  }
}

void sub_10000BEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10000BF04(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10000CB64();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v8 = objc_alloc((Class)CKRecordID);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serviceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v12 = objc_msgSend(v8, "initWithRecordName:zoneID:", v10, v11);

    v13 = *(void **)(a1 + 48);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C070;
    v16[3] = &unk_100049090;
    v18 = *(_OWORD *)(a1 + 56);
    v17 = *(id *)(a1 + 32);
    objc_msgSend(v13, "fetchRecordWithID:withOptions:completion:", v12, 0, v16);

  }
}

void sub_10000C070(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000CBC4();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000C124(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[8];
  _QWORD v14[2];
  _QWORD v15[2];

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) == 0;
  else
    v2 = 0;
  if (!v2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully fetched old user info, switching account info", buf, 2u);
  }

  v14[0] = kCKDatabaseAccessUserInfoHomeIDKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
  v15[0] = v5;
  v14[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  v15[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "populateCKRecordInfo:userInfo:recordType:", *(_QWORD *)(a1 + 48), v7, MSServiceAccountRecordType);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C2E8;
  v11[3] = &unk_100049100;
  v9 = *(void **)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v11[4] = *(_QWORD *)(a1 + 56);
  v12 = v10;
  objc_msgSend(v9, "saveRecord:withOptions:completion:", v8, 0, v11);

}

id sub_10000C2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result;

  result = (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!a3)
    return objc_msgSend(*(id *)(a1 + 32), "refreshDatabase:completion:", 0, &stru_1000490D8);
  return result;
}

void sub_10000C338(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10000CC24();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated local caches post user account switch", v6, 2u);
  }

}

void sub_10000C3D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000C434()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to add service. Error while fetching media services from public db: %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000C494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Encountered CKError Manatee Missing identity when trying to add a service", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000C4C0()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315395;
  v3 = "-[CKDatabase(MediaService) addMediaService:usingSetupBundles:transaction:completion:]_block_invoke";
  sub_10000C3C8();
  sub_100004794((void *)&_mh_execute_header, v0, v1, "%s Failed to save record %{private}@", (uint8_t *)&v2);
  sub_100004780();
}

void sub_10000C538()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to sync cache after adding new service:, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000C598()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to fetch services, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000C5C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_10000C634()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to update default service, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000C660(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  sub_100004794((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to fetch record with ID %@, %@", (uint8_t *)&v4);
  sub_100004780();
}

void sub_10000C6DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to update default service record", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000C708()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to fetch default media service, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000C734()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to remove service, no record found", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000C760(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Failed to delete record %{private}@", a5, a6, a7, a8, 3u);
  sub_100004780();
}

void sub_10000C7C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to updateProperty, NIL HomeID and NIL HomeUserID", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10000C7F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch record %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000C854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving record in updateProperty %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000C8B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_10000C924()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315651;
  v4 = "-[CKDatabase(MediaService) removeMediaServices:withUserInfo:completion:]_block_invoke";
  sub_10000C3C8();
  v5 = v0;
  v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s Fetched recordZone %{private}@, error %{private}@", (uint8_t *)&v3, 0x20u);
}

void sub_10000C9B4()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315394;
  v3 = "-[CKDatabase(MediaService) updateAuthRenewalForMediaService:userInfo:completion:]_block_invoke_2";
  sub_10000C3C8();
  sub_100004794((void *)&_mh_execute_header, v0, v1, "%s Error fetching record, %@", (uint8_t *)&v2);
  sub_100004780();
}

void sub_10000CA2C()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315394;
  v3 = "-[CKDatabase(MediaService) updateAuthRenewalForMediaService:userInfo:completion:]_block_invoke";
  sub_10000C3C8();
  sub_100004794((void *)&_mh_execute_header, v0, v1, "%s Error saving record, %@", (uint8_t *)&v2);
  sub_100004780();
}

void sub_10000CAA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error fetching auth tokens, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000CB04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error validating config info, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000CB64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error fetching recordZone info %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000CBC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error fetching CKRecord info %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000CC24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error updating local caches post user account switch, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000CCF8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100052740;
  qword_100052740 = (uint64_t)v1;

}

void sub_10000CE78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CEE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000D0F4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isHomeKitReady");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "_noteHomesStillLoading");
  return result;
}

void sub_10000D1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000D204(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isHomeKitReady");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "_noteHomesStillLoading");
  return result;
}

void sub_10000D2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000D314(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isHomeKitReady");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "_noteHomesStillLoading");
  return result;
}

void sub_10000D44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D464(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000D474(uint64_t a1)
{

}

void sub_10000D47C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentHome"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queuedAwaitingCurrentHome"));
    v5 = objc_retainBlock(*(id *)(a1 + 40));
    objc_msgSend(v6, "addObject:", v5);

  }
}

void sub_10000D5C8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000EAF0();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138477827;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully registered to accept shared for CloudKitContainer %{private}@", (uint8_t *)&v8, 0xCu);
  }

}

void sub_10000D86C(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully finished refresh after home was added", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000EB50();
  }

}

void sub_10000DF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DFA8(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 26))
    v3 = *(_BYTE *)(v2 + 25) != 0;
  else
    v3 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detected first start up. Finishing initialization steps and refreshing CloudKit.", (uint8_t *)&v15, 2u);
    }

    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "homes"));
      v15 = 138477827;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Homes Loaded: %{private}@", (uint8_t *)&v15, 0xCu);

    }
    v9 = MSDSignpostFacility();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "homes"));
      v14 = objc_msgSend(v13, "count");
      v15 = 134349056;
      v16 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "LookupHomes", "LookupFinishedWithCount=%{signpost.description:attribute,public}lu", (uint8_t *)&v15, 0xCu);

    }
  }
}

uint64_t sub_10000E16C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 26) = 0;
  return result;
}

void sub_10000E178(id a1, BOOL a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000EBB0();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully refreshed data after HomeKit initialization", v7, 2u);
  }

}

void sub_10000E310(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully finished refresh after MultiUserEnablement status changed", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000EC10();
  }

}

void sub_10000E4F4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;

  v6 = a4;
  v7 = v6;
  if (!a3 || v6)
  {
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10000EC70();

    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
    v9 = objc_msgSend(objc_alloc((Class)HMUserCloudShareClientInfo), "initWithAccountAuthToken:", v8);
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v10 + 16))(v10, 1, v9, 0);

  }
}

id sub_10000E63C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void sub_10000E6CC(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully finished refresh after home was removed", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000ECD0();
  }

}

void sub_10000EA00(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentHome"));
  objc_msgSend(v1, "homeManager:didHomeKitSyncComplete:", v2, v3);

}

void sub_10000EAF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error registering CloudKit containers %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000EB50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error refreshing DB after home was added, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000EBB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to refresh after HomeKit initialized, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000EC10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error refreshing DB after MultiUserEnablement status changed, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000EC70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to accept invitation, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000ECD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error refreshing DB after home was removed, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10000F020(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000F0FC;
    v10[3] = &unk_100049338;
    v6 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "acceptShareWithShareMetadata:completion:", a2, v10);

  }
  else
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100010080();

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v9 + 16))(v9, 0, 0, v5);
  }

}

void sub_10000F0FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  void *v15;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138477827;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CKShareAcceptance token %{private}@", (uint8_t *)&v14, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v10 + 16))(v10, 1, v7, 0);

  }
  else
  {
    v11 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000100E0();

    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, v5);
  }

}

void sub_10000F5A4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v16 = objc_msgSend(v6, "CKErrorHasErrorCode:", 11);
    v17 = sub_10002E034();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Share has underlying error of CKErrorUnknownItem", (uint8_t *)&v25, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_saveRecordAndShare:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000101DC(a1, (uint64_t)v7, v19);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
      v25 = 138477827;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched record %{private}@", (uint8_t *)&v25, 0xCu);

    }
    v11 = objc_opt_class(CKShare);
    if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
      v12 = v5;
    else
      v12 = 0;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "participants"));
    v15 = objc_msgSend(v14, "count");

    if ((unint64_t)v15 >= 2)
    {
      if (v15 == (id)2)
      {
        objc_msgSend(*(id *)(a1 + 40), "_handleMultiplePeopleOnShare:completion:", v13, *(_QWORD *)(a1 + 48));
      }
      else
      {
        v20 = sub_10002E034();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100010288();

        v23 = *(_QWORD *)(a1 + 48);
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 29, 0));
          (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "shareRecordWithOwner:completion:", v13, *(_QWORD *)(a1 + 48));
    }

  }
}

void sub_10000F9F0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138477827;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully established share with owner %{private}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100010384();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL sub_10000FDA0(id a1, CKShareParticipant *a2)
{
  return (id)-[CKShareParticipant role](a2, "role") != (id)1;
}

void sub_10000FE90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001043C();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
      v16 = 138477827;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully saved Share %{private}@", (uint8_t *)&v16, 0xCu);

    }
    v11 = objc_opt_class(CKShare);
    if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
      v12 = v5;
    else
      v12 = 0;
    v13 = v12;
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138477827;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Now using share... %{private}@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "shareRecordWithOwner:completion:", v13, *(_QWORD *)(a1 + 40));
  }

}

void sub_100010054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to initialize MSDHomeCloudShare", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100010080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error in fetching meta data %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_1000100E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error in Accepting CKShare %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100010140(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_1000101B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "ShareableRecord is not of expected type", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_1000101DC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordID"));
  sub_100004788();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error fetching CKShare %{private}@, error %@", v6, 0x16u);

}

void sub_100010288()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Unexpected number of participants on share: %lu", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_1000102E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s, nil completion handler", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100010358()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to establish link with owner, NIL CKShare", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100010384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to establish share with owner %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_1000103E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to check participant status - nil CKShare", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100010410()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to find someone with CKParticipantRole : User", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10001043C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving record %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

id MSDSignpostFacility()
{
  if (qword_100052750 != -1)
    dispatch_once(&qword_100052750, &stru_100049430);
  return (id)qword_100052748;
}

void sub_100010A88(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mediasetupd.signposts", "signposts");
  v2 = (void *)qword_100052748;
  qword_100052748 = (uint64_t)v1;

}

os_signpost_id_t MSDGenerateSignpostID()
{
  id v0;
  NSObject *v1;
  os_signpost_id_t v2;

  v0 = MSDSignpostFacility();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  v2 = os_signpost_id_generate(v1);

  return v2;
}

void sub_1000112C4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100052758;
  qword_100052758 = (uint64_t)v1;

}

void sub_100011500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011524(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performStartup");

}

void sub_100011828(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_100011844(uint64_t a1, xpc_object_t xdict)
{
  char *string;
  id v4;
  NSObject *v5;
  _QWORD *WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char *v19;

  string = (char *)xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
    string = (char *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", string);
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138477827;
    v19 = string;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received Darwin Notification %{private}@", (uint8_t *)&v18, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(string, "isEqualToString:", kHomeMultiUserStatusChangedNotification))
  {
    if (!objc_msgSend(string, "isEqualToString:", kHomeUserCloudShareChangedNotification))
      goto LABEL_15;
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Previously registered to accept shares, should receive HomeKit callback on this one", (uint8_t *)&v18, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!WeakRetained)
  {
    v10 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000167F4(v9, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_14;
  }
  v7 = (void *)WeakRetained[6];
  if (v7)
    objc_msgSend(v7, "trigger");
LABEL_15:

}

void sub_100011BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011BD8(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_10002E034();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection to CUCoalescer invalidated", v3, 2u);
  }

}

void sub_100011C3C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  v2 = sub_10002E034();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting action handler on CUCoalescer", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleRefreshTask");

}

void sub_100011CB8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

void sub_100011DA0(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
  objc_msgSend(v1, "refreshDataForReason:completion:", 5, &stru_1000494B8);

}

void sub_100011DE0(id a1, BOOL a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100016864();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully refreshed data after HomeMUStatusChanged", v7, 2u);
  }

}

void sub_10001201C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully saved public DB info", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100016924();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100012120(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 1;
  return result;
}

void sub_100012230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012254(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100012444;
  v22[3] = &unk_100049508;
  v22[4] = &v23;
  objc_msgSend(v3, "setExpirationHandler:", v22);
  if (!*((_BYTE *)v24 + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      if (*((_BYTE *)WeakRetained + 16))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100012458;
        v18[3] = &unk_1000494E0;
        v19 = v3;
        objc_msgSend(v15, "syncDataWithCloudKit:", v18);

        goto LABEL_13;
      }
      v16 = sub_10002E034();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "HomeKit not ready, deferring publicDB refresh", buf, 2u);
      }

    }
    objc_msgSend(v3, "setTaskCompleted");
    goto LABEL_13;
  }
  v21 = 0;
  v4 = objc_msgSend(v3, "setTaskExpiredWithRetryAfter:error:", &v21, 300.0);
  v5 = v21;
  if ((v4 & 1) == 0)
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100016984((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v3, "setTaskCompleted");
  }
LABEL_13:

  _Block_object_dispose(&v23, 8);
}

void sub_10001241C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012444(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_100012458(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduled background sync finished, error: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
}

void sub_100012858(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100016A94();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138477827;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Services configured on account %{private}@", (uint8_t *)&v12, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "translateCKErrorToMSError"));
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v11);

  }
}

void sub_100012B74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100016AF4();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138477827;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Services configured on account in cache %{private}@", (uint8_t *)&v12, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "translateCKErrorToMSError"));
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v11);

  }
}

void sub_100012F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100012F54(id a1, MSSetupBundle *a2)
{
  return -[MSSetupBundle homeID](a2, "homeID");
}

void sub_100012F5C(id *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(id, _QWORD, void *);
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;

  v3 = a2;
  if (v3)
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100016C60();

    (*((void (**)(void))a1[7] + 2))();
    objc_msgSend(a1[4], "releaseTransaction");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    if (WeakRetained)
    {
      v7 = a1[5];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10001317C;
      v21[3] = &unk_1000495E8;
      v25 = a1[7];
      v22 = a1[4];
      v23 = a1[5];
      v24 = a1[6];
      +[MSAuthTokenProvider validateConfigurationResourceForMediaService:networkActivity:completion:](MSAuthTokenProvider, "validateConfigurationResourceForMediaService:networkActivity:completion:", v7, 0, v21);

      v8 = v25;
    }
    else
    {
      v9 = sub_10002E034();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100016BF0(v10, v11, v12, v13, v14, v15, v16, v17);

      v18 = (void (**)(id, _QWORD, void *))a1[7];
      v19 = MSErrorDomain;
      v26 = NSLocalizedDescriptionKey;
      v27 = CFSTR("Nil self");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, 1, v8));
      v18[2](v18, 0, v20);

    }
  }

}

void sub_10001317C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100016CC0();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "releaseTransaction");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000132AC;
    v10[3] = &unk_1000495C0;
    v11 = v7;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v6, "addMediaService:usingSetupBundles:transaction:completion:", v11, v8, v9, v10);

  }
}

void sub_1000132AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v5 = a3;
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100016D20(a1, (uint64_t)v5, v8);

    objc_msgSend(*(id *)(a1 + 40), "releaseTransaction");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
      v12 = 138477827;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully added service %{private}@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = *(_QWORD *)(a1 + 48);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "translateCKErrorToMSError"));
  (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, a2, v11);

}

void sub_1000137D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;

  v5 = a3;
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100016E34();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
      v14 = 138477827;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully removed service %{private}@", (uint8_t *)&v14, 0xCu);

    }
    v10 = *(void **)(a1 + 40);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v8, "UUIDString"));
    objc_msgSend(v10, "_clearCachedIconImage:", v11);

  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "translateCKErrorToMSError"));
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, a2, v13);

  }
}

void sub_100013BD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100016F04();

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "translateCKErrorToMSError"));
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);

  }
}

void sub_100013EE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100016FD4();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceID"));
    v13 = 136315395;
    v14 = "-[MSDManager getDefaultMediaService:homeUserID:completion:]_block_invoke";
    v15 = 2113;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Fetched Default Service (%{private}@)", (uint8_t *)&v13, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "translateCKErrorToMSError"));
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);

  }
}

void sub_1000143B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000170A4();

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "translateCKErrorToMSError"));
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);

  }
}

void sub_100014658(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100017174();

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "translateCKErrorToMSError"));
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10);

  }
}

void sub_1000148A0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  if (!v3)
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138477827;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error fetching publicDB info for %{private}@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100014F50(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "allObjects"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

void sub_1000151F0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v3 = a2;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error switching account info, %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully switched account info for %@", (uint8_t *)&v10, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "translateCKErrorToMSError"));
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

void sub_100015B10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015B64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100015B74(uint64_t a1)
{

}

void sub_100015B7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001722C();

  }
  v9 = objc_msgSend(v5, "mutableCopy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10001610C(id a1, MSPublicDBInfo *a2)
{
  MSPublicDBInfo *v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_alloc((Class)NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo serviceID](v2, "serviceID"));

  v5 = objc_msgSend(v3, "initWithUUIDString:", v4);
  return v5;
}

id sub_100016174(id a1, MSPublicDBInfo *a2)
{
  MSPublicDBInfo *v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_alloc((Class)NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo serviceID](v2, "serviceID"));

  v5 = objc_msgSend(v3, "initWithUUIDString:", v4);
  return v5;
}

id sub_1000161DC(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_alloc((Class)NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v2, "objectForKey:", MediaServiceIdentifier));

  v5 = objc_msgSend(v3, "initWithUUIDString:", v4);
  return v5;
}

void sub_100016250(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully deleted remanent services on account", buf, 2u);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000164B0;
      v22[3] = &unk_1000497C8;
      v10 = *(void **)(a1 + 40);
      v23 = *(id *)(a1 + 48);
      v24 = v9;
      v11 = v9;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      objc_msgSend(v12, "setObjectWithCustomClass:forDefault:", v11, CFSTR("publicDBData"));

    }
    else
    {
      v18 = sub_10002E034();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "There are no valid MediaService Developer profiles installed on device, clearing defaults", buf, 2u);
      }

      v11 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      objc_msgSend(v11, "clearDeveloperDefaults");
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100016544;
    v21[3] = &unk_100048AE8;
    v20 = *(void **)(a1 + 48);
    v21[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v21);
  }
  else
  {
    v13 = objc_msgSend(v5, "CKErrorHasErrorCode:", 11);
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100017328(a1, (uint64_t)v6, v16);

    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "There are no valid MediaService Developer profiles installed on device, clearing defaults", buf, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      objc_msgSend(v17, "clearDeveloperDefaults");

    }
  }

}

void sub_1000164B0(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = objc_alloc((Class)NSUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceID"));
  v6 = objc_msgSend(v4, "initWithUUIDString:", v5);
  LODWORD(v3) = objc_msgSend(v3, "na_safeContainsObject:", v6);

  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectIdenticalTo:", v7);

}

void sub_100016544(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString"));
  objc_msgSend(v2, "_clearCachedIconImage:", v3);

}

id sub_1000165F4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_markHomeKitInitialized");
  v2 = sub_10002E034();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Refreshing public DB info in cache after startup", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_savePublicDBInfoInDefaults");
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Syncing any installed developer profiles", v10, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "syncStatusOfInstalledProfiles");
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finishing setup for multi-user", v9, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setupMultiUser");
  return objc_msgSend(*(id *)(a1 + 32), "_initializeCoalescerObject");
}

void sub_1000167F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s nil strongSelf", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100016864()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to refresh data after HomeMUStatusChanged, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_1000168C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "We waited for %lu sec for the CKPublicDB to be updated, Unknown error occurred, using values in cache", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016924()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving public DB info %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016984(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Failed to expire publicDB refresh task: %@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_1000169F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Error removing cached service icon", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100016A24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100016A94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch services %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016AF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch services from cache: %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016B54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "Encountered unexpected error. No completion handler provided for %s", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100016BC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to setup service. No home information provided", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100016BF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s Nil StrongSelf", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100016C60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error fetching authentication tokens %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016CC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to validate configuration resource: %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016D20(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
  sub_100004788();
  v8 = 2113;
  v9 = a2;
  sub_100004794((void *)&_mh_execute_header, a3, v6, "Error adding service %{private}@ to home: %{private}@", v7);

}

void sub_100016DC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100016E34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to remove service from home %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016E94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100016F04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to update default media service %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100016F64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100016FD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch default service %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100017034(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_1000170A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to updated service property %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100017104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100017174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch service config info %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_1000171D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Error: No cached PublicData present on device", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100017200()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Error: Semaphore timed out: Failed to fetch updated publicInfo", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10001722C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error fetching PublicData %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001728C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s CurrentHome is nil", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_1000172FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "The user and home identifiers is unknown, failed to remove dev profile accounts", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_100017328(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138478083;
  v5 = v3;
  v6 = 2113;
  v7 = a2;
  sub_100004794((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error deleting service %{private}@ from account %{private}@", (uint8_t *)&v4);
  sub_100004780();
}

void sub_1000176D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100017724(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100017734(uint64_t a1)
{

}

void sub_10001773C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  os_unfair_lock_s *WeakRetained;
  id v9;
  NSObject *v10;

  v6 = a2;
  v7 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      v9 = sub_10002E034();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100018094((uint64_t)WeakRetained, (uint64_t)v7, v10);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    os_unfair_lock_unlock(WeakRetained + 2);
  }

}

void sub_100017C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_100017C6C(id a1)
{
  MSDExpireCache *v1;
  void *v2;

  v1 = -[MSDExpireCache initWithExpiration:]([MSDExpireCache alloc], "initWithExpiration:", 60.0);
  v2 = (void *)qword_100052768;
  qword_100052768 = (uint64_t)v1;

}

void sub_100017CA0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id WeakRetained;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  uint64_t v30;
  __CFString *v31;
  int v32;
  const __CFString *v33;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100018180((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(WeakRetained, "_accountHasLocalPlayableContent:", *(_QWORD *)(a1 + 32));

    v16 = sub_10002E034();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        v18 = CFSTR("has");
      else
        v18 = CFSTR("does not have");
      v32 = 138412290;
      v33 = v18;
      v19 = "The account %@ localPlaybackContent";
      v20 = v17;
      v21 = OS_LOG_TYPE_DEFAULT;
      v22 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscriptionStatus"));
    v24 = objc_msgSend(v23, "capabilities") & 1;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v24;
    v25 = sub_10002E034();
    v17 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v32 = 67109120;
      LODWORD(v33) = v24;
      v19 = "Fetched Subscription Status %d";
      v20 = v17;
      v21 = OS_LOG_TYPE_INFO;
      v22 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, (uint8_t *)&v32, v22);
    }
  }

  v26 = MSDSignpostFacility();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  v29 = *(_QWORD *)(a1 + 64);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    v30 = NSStringFromBOOL(*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(v30);
    v32 = 138543362;
    v33 = v31;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v29, "CheckSubscriptionStatus", "LookupFinishedWithStatus=%{signpost.description:attribute,public}@", (uint8_t *)&v32, 0xCu);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_10001802C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Nil homeUserIdentifier provided", a5, a6, a7, a8, 0);
}

void sub_100018060(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Nil homeIdentifier provided", a5, a6, a7, a8, 0);
}

void sub_100018094(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error fetching iTunes account for HomeIdentifier %@, %@", (uint8_t *)&v4, 0x16u);
  sub_100004780();
}

void sub_100018118(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Failed to fetch iTunes Account associated with user %{private}@", a5, a6, a7, a8, 3u);
  sub_100004780();
}

void sub_100018180(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Failed to determine SubscriptionStatus %@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100018B04(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v20 = a1;
    v7 = (void *)objc_opt_new(NSMutableArray, v5);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "service"));
          v14 = objc_msgSend(v13, "copy");

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serviceID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v16));

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeUserID"));
          objc_msgSend(v14, "populateMediaService:homeID:homeUserID:", v17, v18, v19);

          objc_msgSend(v7, "addObject:", v14);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(v20 + 32) + 16))();
  }

}

uint64_t sub_100019048(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  v5 = objc_msgSend(v4, "isEqualToString:", MSServiceAccountRecordType);

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID")),
        v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)),
        v6,
        v7))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serviceID"));
      v12 = (uint64_t)objc_msgSend(v10, "isEqualToString:", v11);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_100019140(os_log_t log)
{
  int v1;
  const __CFString *v2;

  v1 = 138412290;
  v2 = CFSTR("Failed to remove services, NIL identifiers passed");
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void sub_1000193E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001940C(uint64_t a1, char a2, void *a3)
{
  id v5;
  double *WeakRetained;
  double *v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[16];

  v5 = a3;
  if (!v5 && (a2 & 1) != 0)
  {
    WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 48));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      if (WeakRetained[2] == 0.0)
      {
        objc_msgSend(WeakRetained, "_performDataRefresh:", *(_QWORD *)(a1 + 40));
        goto LABEL_18;
      }
      objc_msgSend(WeakRetained, "refreshDataAfterDelay");
      v8 = *(_QWORD *)(a1 + 40);
      if (!v8)
      {
LABEL_18:

        goto LABEL_19;
      }
      v9 = *(void (**)(void))(v8 + 16);
    }
    else
    {
      v13 = sub_10002E034();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10001DAFC(v14, v15, v16, v17, v18, v19, v20, v21);

      v22 = *(_QWORD *)(a1 + 40);
      if (!v22)
        goto LABEL_18;
      v9 = *(void (**)(void))(v22 + 16);
    }
    v9();
    goto LABEL_18;
  }
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CloudKit is not available...returning...", v23, 2u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v5);
  objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "clearLastRefreshTSForHomes");
LABEL_19:

}

BOOL sub_100019854(id a1, HMHome *a2, unint64_t a3, BOOL *a4)
{
  HMHome *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v9;
  HMHome *v10;

  v4 = a2;
  if ((-[HMHome hasAccessoryTypeHomePod](v4, "hasAccessoryTypeHomePod") & 1) != 0
    || (-[HMHome isMultiUserEnabled](v4, "isMultiUserEnabled") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138477827;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{private}@ HomeMUEnabled = NO AND User does not have any HomePods in configured.", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

void sub_100019920(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100019A20;
    v7[3] = &unk_100049930;
    v7[4] = v3;
    v9 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_deleteZombieRecordZonesIfAnyInHomes:completion:", v4, v7);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSCloudKitErrorDomain, 0, 0));
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
    objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "clearLastRefreshTSForHomes");
  }
}

void sub_100019A20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;

  v3 = a2;
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "CKErrorHasErrorCode:", 11) & 1) != 0)
    goto LABEL_10;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10001DB6C();

  if (objc_msgSend(v4, "isErrorFatal"))
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v19 = "-[MSDDataRefresh _performDataRefresh:]_block_invoke";
      v20 = 2113;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Fatal error %{private}@", buf, 0x16u);
    }

    objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "clearLastRefreshTSForHomes");
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v4);
  }
  else
  {
LABEL_10:
    v10 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100019BD4;
    v13[3] = &unk_100049908;
    v11 = v4;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = v11;
    v15 = v12;
    v17 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v10, "_refreshDatabases:", v13);

  }
}

void sub_100019BD4(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;

  v3 = a2;
  if (objc_msgSend(v3, "isErrorFatal"))
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v10 = 136315395;
      v11 = "-[MSDDataRefresh _performDataRefresh:]_block_invoke";
      v12 = 2113;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Fatal error %{private}@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend((id)objc_opt_class(a1[5]), "clearLastRefreshTSForHomes");
    v7 = a1[7];
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_10:
      v8();
    }
  }
  else
  {
    if (!v3)
      objc_msgSend((id)objc_opt_class(a1[5]), "cacheLastRefreshforHomes:", a1[6]);
    v9 = a1[7];
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }

}

void sub_100019FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_10001A028(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "isErrorFatal");
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001DBCC();
  }
  else
  {
    v7 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138477827;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully Validated Service Configuration Info %{private}@", (uint8_t *)&v9, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_10001A130(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0);
  return result;
}

id sub_10001A334(id a1, HMHome *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome currentUser](a2, "currentUser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueIdentifier"));

  return v3;
}

void sub_10001A370(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  dispatch_queue_global_t global_queue;
  NSObject *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *group;
  _QWORD block[4];
  id v38;
  __int128 *v39;
  _QWORD v40[6];
  NSObject *v41;
  id v42;
  id v43;
  __int128 *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v5 = a2;
  v6 = a3;
  v33 = v5;
  v34 = v6;
  if (v5 && !v6)
  {
    group = dispatch_group_create();
    *(_QWORD *)&v57 = 0;
    *((_QWORD *)&v57 + 1) = &v57;
    v58 = 0x3032000000;
    v59 = sub_10001A890;
    v60 = sub_10001A8A0;
    v61 = 0;
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v54 = "-[MSDDataRefresh _deleteZombieRecordZonesIfAnyInHomes:completion:]_block_invoke";
      v55 = 2112;
      v56 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s User is part of homes %@", buf, 0x16u);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v46;
      v35 = MSPlaceholderRecordName;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID", v33));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
          v17 = objc_msgSend(v16, "isEqualToString:", CKRecordZoneDefaultName);

          if ((v17 & 1) == 0)
          {
            dispatch_group_enter(group);
            v18 = objc_alloc((Class)CKRecordID);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID"));
            v20 = objc_msgSend(v18, "initWithRecordName:zoneID:", v35, v19);

            v21 = *(void **)(a1 + 32);
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_10001A8A8;
            v40[3] = &unk_100049A38;
            v22 = *(_QWORD *)(a1 + 56);
            v40[4] = v14;
            v40[5] = v22;
            v44 = &v57;
            v41 = group;
            v42 = *(id *)(a1 + 48);
            v23 = v20;
            v43 = v23;
            objc_msgSend(v21, "fetchRecordWithID:completionHandler:", v23, v40);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v11);
    }

    global_queue = dispatch_get_global_queue(2, 0);
    v25 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001ACBC;
    block[3] = &unk_100049980;
    v38 = *(id *)(a1 + 64);
    v39 = &v57;
    dispatch_group_notify(group, v25, block);

    _Block_object_dispose(&v57, 8);
LABEL_24:

    goto LABEL_25;
  }
  v26 = sub_10002E034();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    sub_10001DC64();

  v28 = *(_QWORD *)(a1 + 64);
  if (v28)
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v34);
  if (objc_msgSend(v34, "CKErrorHasErrorCode:", 112, v33) && CKErrorIsCode(v34, 2))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "userInfo"));
    group = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CKPartialErrorsByItemIDKey));

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](group, "allKeys"));
    v31 = sub_10002E034();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v57) = 138412290;
      *(_QWORD *)((char *)&v57 + 4) = v30;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Zones with ManateeIdentity Lost %@", (uint8_t *)&v57, 0xCu);
    }

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10001A880;
    v49[3] = &unk_100048ED0;
    v50 = *(id *)(a1 + 32);
    v51 = *(id *)(a1 + 40);
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v49);

    goto LABEL_24;
  }
LABEL_25:

}

void sub_10001A850(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_10001A880(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCKErrorMissingManateeIdentity:homeUserIDS:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t sub_10001A890(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001A8A0(uint64_t a1)
{

}

void sub_10001A8A8(uint64_t a1, void *a2, void *a3)
{
  id *v3;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6 && !v7)
  {
    v9 = objc_alloc((Class)NSUUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordFieldForKey:", MSHomeParticipantHomeIdentifier));
    v11 = objc_msgSend(v9, "initWithUUIDString:", v10);

    if (v11
      && (v12 = *(void **)(a1 + 56),
          v28[0] = _NSConcreteStackBlock,
          v28[1] = 3221225472,
          v28[2] = sub_10001AC2C,
          v28[3] = &unk_100049A10,
          v3 = &v29,
          v29 = v11,
          (objc_msgSend(v12, "ms_anyPassingTest:", v28) & 1) != 0))
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    }
    else
    {
      v20 = sub_10002E034();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "recordName"));
        *(_DWORD *)buf = 138477827;
        v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Detected Zombie recordZone %{private}@", buf, 0xCu);

      }
      v23 = *(void **)(a1 + 40);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneID"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10001AC6C;
      v25[3] = &unk_1000499E8;
      v27 = *(_QWORD *)(a1 + 72);
      v26 = *(id *)(a1 + 48);
      objc_msgSend(v23, "_deleteRecordZone:completion:", v24, v25);

      if (!v11)
        goto LABEL_17;
    }

LABEL_17:
    goto LABEL_18;
  }
  v13 = objc_msgSend(v7, "CKErrorHasErrorCode:", 11);
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneID"));
      *(_DWORD *)buf = 138477827;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Possibly a zombie recordZone, deleting %{private}@", buf, 0xCu);

    }
    v18 = *(void **)(a1 + 40);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneID"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001ABDC;
    v30[3] = &unk_1000499E8;
    v32 = *(_QWORD *)(a1 + 72);
    v31 = *(id *)(a1 + 48);
    objc_msgSend(v18, "_deleteRecordZone:completion:", v19, v30);

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10001DCC4();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
LABEL_18:

}

void sub_10001ABDC(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

id sub_10001AC2C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uniqueIdentifier"));
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_10001AC6C(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t sub_10001ACBC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

void sub_10001ADB0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v5 = a3;
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001DD24(a1, (uint64_t)v5, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138477827;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully Zombie deleted recordZone %{private}@", (uint8_t *)&v11, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

void sub_10001B048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10001B06C(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (objc_msgSend(v4, "isErrorFatal"))
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001DDBC();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_10001B104(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  NSObject *v15;
  int8x16_t v16;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharedCloudDatabase"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001B274;
    v14[3] = &unk_100049AB0;
    v16 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    v15 = v3;
    v6 = v3;
    objc_msgSend(v5, "refreshDatabase:completion:", 0, v14);

    global_queue = dispatch_get_global_queue(2, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B320;
    block[3] = &unk_100049980;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = v9;
    v13 = v10;
    dispatch_group_notify(v6, v8, block);

  }
}

void sub_10001B274(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (objc_msgSend(v4, "isErrorFatal"))
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001DE2C();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t sub_10001B320(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

id sub_10001B48C(id a1, HMHome *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uniqueIdentifier](a2, "uniqueIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  return v3;
}

void sub_10001B620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B640(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001B6B0;
    v3[3] = &unk_100049B20;
    v3[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_performDataRefresh:", v3);
  }

}

void sub_10001B6B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *refreshed;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001DED0(a1, (uint64_t)v4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    refreshed = MSDDataRefreshReasonToString(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully updated data after %@", (uint8_t *)&v10, 0xCu);

  }
}

void sub_10001B944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B968(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void (**v10)(id, id);
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = kAppleMusicApplicationIdentifier;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001BAB8;
    v11[3] = &unk_100049B48;
    v14 = a1[5];
    objc_copyWeak(&v15, a1 + 6);
    v12 = v5;
    v13 = a1[4];
    +[MSDPublicDBManager getPublicInfoForServiceName:completion:](MSDPublicDBManager, "getPublicInfoForServiceName:completion:", v7, v11);

    objc_destroyWeak(&v15);
  }
  else
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10001DF6C();

    v10 = (void (**)(id, id))a1[5];
    if (v10)
      v10[2](v10, v6);
  }

}

void sub_10001BAA4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001BAB8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_checkDataSanity:publicDBInfo:home:completion:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_7:

    goto LABEL_8;
  }
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10001DFCC(v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 7, 0));
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, WeakRetained);
    goto LABEL_7;
  }
LABEL_8:

}

void sub_10001BE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001BE70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  id *v18;
  id WeakRetained;
  id *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;

  v5 = a2;
  v6 = a3;
  if (!v6
    || (v7 = objc_loadWeakRetained((id *)(a1 + 80)),
        v8 = objc_msgSend(v7, "_shouldProceedWithExecution:", v6),
        v7,
        (v8 & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32)));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40)));
    v11 = MediaServiceIdentifier;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordFieldForKey:", MediaServiceIdentifier));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordFieldForKey:", v11));
    v14 = (void *)v13;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
    {
      if (v12)
      {
        if (v13)
        {
LABEL_22:

          goto LABEL_23;
        }
        v16 = sub_10002E034();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "User missing default service record, defaulting to Apple Music", buf, 2u);
        }

        v18 = (id *)(a1 + 80);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
        v21 = *(_QWORD *)(a1 + 48);
        v20 = (id *)(a1 + 48);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10001C1D8;
        v31[3] = &unk_100049B98;
        v34 = v20[3];
        objc_copyWeak(&v35, v18);
        v32 = v9;
        v33 = *v20;
        objc_msgSend(WeakRetained, "_updateDefaultService:record:completion:", v21, v32, v31);

        objc_destroyWeak(&v35);
        v22 = v34;
      }
      else
      {
        v28 = sub_10002E034();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "User missing Apple Music record, creating a new one", buf, 2u);
        }

        v22 = objc_loadWeakRetained((id *)(a1 + 80));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "zoneID"));
        objc_msgSend(v22, "_createAndSaveAppleMusicRecord:publicDBInfo:home:completion:", v30, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));

      }
    }
    else
    {
      v23 = sub_10002E034();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordFieldForKey:", MSHomeParticipantHomeUserIdentifier));
        *(_DWORD *)buf = 138477827;
        v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "User's (%{private}@) Apple Music and Default Service are configured correctly", buf, 0xCu);

      }
      v22 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v22, "_shareThisRecordIfApplicable:home:completion:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
    }

    goto LABEL_22;
  }
  v27 = *(_QWORD *)(a1 + 72);
  if (v27)
    (*(void (**)(uint64_t, id))(v27 + 16))(v27, v6);
LABEL_23:

}

void sub_10001C1BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001C1D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  v4 = a3;
  if (!v4)
  {
    v7 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_shareThisRecordIfApplicable:home:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    goto LABEL_5;
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    v7 = v4;
    (*(void (**)(void))(v5 + 16))();
LABEL_5:
    v4 = v7;
  }

}

void sub_10001C5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C5EC(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id WeakRetained;
  id v11;
  void (**v12)(id, id);
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001E110();

    v12 = (void (**)(id, id))a1[5];
    if (v12)
      v12[2](v12, v6);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Now updating default Service to AppleMusic..", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001C790;
    v13[3] = &unk_100049B98;
    v11 = a1[4];
    v16 = a1[5];
    objc_copyWeak(&v17, a1 + 6);
    v14 = v5;
    v15 = a1[4];
    objc_msgSend(WeakRetained, "_updateDefaultService:record:completion:", v11, v14, v13);

    objc_destroyWeak(&v17);
  }

}

void sub_10001C77C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001C790(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138477827;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error creating default service for user %{private}@", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v4);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_shareThisRecordIfApplicable:home:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void sub_10001CA90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentUser"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
      v14 = 138477827;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully shared data with owner for participant %{private}@", (uint8_t *)&v14, 0xCu);

    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_10001E1E0();

  if (objc_msgSend(v6, "isErrorFatal"))
  {
    v10 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10001E170();
LABEL_9:

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);

}

void sub_10001CE40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001E240();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully updated default service", v11, 2u);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, BOOL, id))(v10 + 16))(v10, v5 != 0, v6);

}

void sub_10001D084(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001E2A0();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully saved AppleMusic record", v11, 2u);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void sub_10001D22C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_alloc((Class)NSString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountAuthToken"));
    v11 = objc_msgSend(v8, "initWithData:encoding:", v10, 4);

    if (v11)
      goto LABEL_11;
    v12 = sub_10002E034();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10001E300(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  else if (v6)
  {
    v21 = sub_10002E034();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138477827;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received Nil HMHomeCloudShareResponse, error %{private}@", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_handleCKShareError:home:", v7, *(_QWORD *)(a1 + 40));
  }
  v11 = 0;
LABEL_11:
  v23 = *(_QWORD *)(a1 + 48);
  if (v23)
    (*(void (**)(uint64_t, id, void *))(v23 + 16))(v23, v11, v7);

}

id sub_10001D52C(id a1, HMHome *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uniqueIdentifier](a2, "uniqueIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  return v3;
}

void sub_10001D8E4(id a1, id a2)
{
  void (**v2)(id, uint64_t);
  MSDDataRefresh *v3;

  v2 = (void (**)(id, uint64_t))a2;
  v3 = -[MSDDataRefresh initWithReason:]([MSDDataRefresh alloc], "initWithReason:", 8);
  -[MSDDataRefresh performRefreshWithCompletion:](v3, "performRefreshWithCompletion:", &stru_100049CE0);
  v2[2](v2, 1);

}

void sub_10001D94C(id a1, BOOL a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a3;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001E334();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully synched data with CloudKit", v10, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryRepresentation"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ms_objectsPassingTest:](v6, "ms_objectsPassingTest:", &stru_100049D20));
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &stru_100049D60);

  }
}

BOOL sub_10001DA44(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  return -[NSString rangeOfString:](a2, "rangeOfString:", CFSTR("CKShareErrorRetryCount"), a4) != (id)0x7FFFFFFFFFFFFFFFLL;
}

void sub_10001DA70(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  NSString *v4;
  id v5;

  v4 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v5, "setObject:forDefault:", &off_10004B970, v4);

}

void sub_10001DAFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s StrongSelf is Nil", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_10001DB6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Encountered error when deleting recordZones %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001DBCC()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100004788();
  v3 = 2112;
  v4 = v0;
  sub_100004794((void *)&_mh_execute_header, v1, (uint64_t)v1, "Error creating service config block %{private}@, Error is Fatal %@", v2);
  sub_100004780();
}

void sub_10001DC64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch all recordZones, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001DCC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch recordID %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001DD24(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneName"));
  sub_100004788();
  v8 = 2113;
  v9 = a2;
  sub_100004794((void *)&_mh_execute_header, a3, v6, "Failed to Zombie delete record zoneID %{private}@, error %{private}@", v7);

  sub_10001DAEC();
}

void sub_10001DDBC()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315395;
  sub_10001DAD8();
  sub_100004794((void *)&_mh_execute_header, v0, v1, "%s Fatal error ... %{private}@", (uint8_t *)v2);
  sub_100004780();
}

void sub_10001DE2C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315395;
  sub_10001DAD8();
  sub_100004794((void *)&_mh_execute_header, v0, v1, "%s Fatal error ... %{private}@", (uint8_t *)v2);
  sub_100004780();
}

void sub_10001DE9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Received fatal error, clearing values....", a5, a6, a7, a8, 0);
}

void sub_10001DED0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  const __CFString *refreshed;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;

  refreshed = MSDDataRefreshReasonToString(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(refreshed);
  sub_100004788();
  v9 = 2112;
  v10 = a2;
  sub_100004794((void *)&_mh_execute_header, a3, v7, "Error refreshing data after %@, %@", v8);

  sub_10001DAEC();
}

void sub_10001DF6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch record zone %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001DFCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "Failed to fetch publicDB Info for %{private}@", a5, a6, a7, a8, 3u);
  sub_100004780();
}

void sub_10001E040(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s Failed to fetch data with Nil AppleMusic recordID and Nil defaultService recordID", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_10001E0B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch record, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001E110()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving config information into CloudKit record, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001E170()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315395;
  sub_10001DAD8();
  sub_100004794((void *)&_mh_execute_header, v0, v1, "%s Fatal error ...%{private}@ ", (uint8_t *)v2);
  sub_100004780();
}

void sub_10001E1E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error creating share for record %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001E240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving default record %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001E2A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to save Apple music record %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001E300(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003248((void *)&_mh_execute_header, a1, a3, "Generated Nil token from accountAuthToken", a5, a6, a7, a8, 0);
}

void sub_10001E334()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Encountered error when trying to sync data %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10001E5C0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100052778;
  qword_100052778 = (uint64_t)v1;

}

void sub_10001E734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_10001E760(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  NSObject *v17;
  unint64_t v18;
  double v19;
  id v20;
  NSObject *v21;
  dispatch_time_t v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  double v29;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5 || (a2 & 1) == 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v29 = *(double *)&v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to add subscription to database %@", buf, 0xCu);
    }

    if (objc_msgSend(v5, "CKErrorHasErrorCode:", 15))
    {
      v10 = sub_10002E034();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10001FAF8();

      WeakRetained[1] = 3;
    }
    else if ((objc_msgSend(v5, "CKErrorHasErrorCode:", 6) & 1) != 0
           || objc_msgSend(v5, "CKErrorHasErrorCode:", 7))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CKErrorRetryAfterKey));
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      v16 = sub_10002E034();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CloudKit asked us to re-try after %f", buf, 0xCu);
      }

      v18 = WeakRetained[1] + 1;
      WeakRetained[1] = v18;
      if (v18 <= 2)
      {
        v19 = v15 + 1.0;
        v20 = sub_10002E034();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Retrying...add subscription to database", buf, 2u);
        }

        v22 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
        global_queue = dispatch_get_global_queue(0, 0);
        v24 = objc_claimAutoreleasedReturnValue(global_queue);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10001EA74;
        v25[3] = &unk_100049D88;
        objc_copyWeak(&v26, (id *)(a1 + 32));
        objc_copyWeak(&v27, (id *)(a1 + 40));
        dispatch_after(v22, v24, v25);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&v26);
      }
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully added database subscription", buf, 2u);
    }

  }
}

void sub_10001EA74(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addSubscriptionForDatabase:", v2);

}

void sub_10001EBD8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  if (!objc_msgSend(v5, "accountStatus"))
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "accountStatus") == (id)1 && objc_msgSend(v5, "supportsDeviceToDeviceEncryption"))
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_12:
    v8();
    goto LABEL_13;
  }
  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CKStringFromAccountStatus(objc_msgSend(v5, "accountStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v15 = 138412290;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Current account state %@", (uint8_t *)&v15, 0xCu);

  }
  v13 = *(_QWORD *)(a1 + 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 6, 0));
  (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

LABEL_13:
}

void sub_10001EFF0(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_10002E034();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10001FC34();

  }
}

void sub_10001F044(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_10002E034();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10001FC98();

  }
}

void sub_10001F144(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10001F168(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  _QWORD *WeakRetained;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void ***v12;
  id v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  _QWORD *v27;
  void **block;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  void *v40;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = sub_10002E034();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10001FD54();

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001F45C;
      v34[3] = &unk_100048AC0;
      v34[4] = WeakRetained;
      v12 = (void ***)v34;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
        v16 = CKStringFromAccountStatus(objc_msgSend(v5, "accountStatus"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138412802;
        v36 = v5;
        v37 = 1024;
        v38 = v15;
        v39 = 2112;
        v40 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetched accountInfo %@ : Status of encryption: %d AccountStatus: %@", buf, 0x1Cu);

      }
      v18 = objc_msgSend(v5, "accountStatus");
      if (v18 == (id)3)
      {
        objc_msgSend(WeakRetained, "_handleAccountStatusUnsupported");
      }
      else if (v18 == (id)1)
      {
        if (objc_msgSend(v5, "supportsDeviceToDeviceEncryption"))
        {
          v19 = WeakRetained[4];
          block = _NSConcreteStackBlock;
          v29 = 3221225472;
          v30 = sub_10001F468;
          v31 = &unk_100049E40;
          objc_copyWeak(&v33, v7);
          v32 = v5;
          dispatch_async(v19, &block);

          objc_destroyWeak(&v33);
        }
        else
        {
          v20 = sub_10002E034();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_10001FD28();

          v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
          objc_msgSend(v22, "setObject:forDefault:", &__kCFBooleanFalse, CFSTR("CKAccountSupportsManatee"));

          objc_msgSend(WeakRetained, "setAccountInfo:", 0);
        }
      }
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_10001F4A4;
      v26 = &unk_100048AC0;
      v27 = WeakRetained;
      v12 = &v23;
    }
    objc_msgSend(WeakRetained, "_withAccountCheckLock:", v12, v23, v24, v25, v26, v27, block, v29, v30, v31);
  }
  else
  {
    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10001FCFC();

  }
}

uint64_t sub_10001F45C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 0;
  return result;
}

void sub_10001F468(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDeviceSupportsEncryption:", *(_QWORD *)(a1 + 32));

}

uint64_t sub_10001F4A4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 0;
  return result;
}

void sub_10001F6AC(id a1, BOOL a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001FDE4();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully refreshed data after CKAccountInfo changed", v7, 2u);
  }

}

void sub_10001F870(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001F96C;
    v7[3] = &unk_100049EB0;
    v7[4] = WeakRetained;
    v7[5] = &v8;
    objc_msgSend(WeakRetained, "_withAccountCheckLock:", v7);
    if (*((_BYTE *)v9 + 24))
    {
      v4 = objc_loadWeakRetained(v1);
      objc_msgSend(v4, "_checkAccountStatus");

    }
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10001FCFC();

  }
}

void sub_10001F954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001F96C(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void sub_10001FA2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001FA44(void *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = CKDatabaseScopeString(objc_msgSend(a1, "databaseScope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, a2, v5, "Error adding subscription, unsupported database %@", v6);

  sub_10001FA38();
}

void sub_10001FACC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Unsupported database scope, failed to add subscription", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10001FAF8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, v0, v1, "Received CKError: CKErrorServerRejectedRequest %@", v2);
  sub_100004780();
}

void sub_10001FB5C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userInfo"));
  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, a2, v4, "Failed to create CkNotification from APSIncomingMessage %@", v5);

  sub_10001FA38();
}

void sub_10001FBDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "CKNotification not of type databaseNotification", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10001FC08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "** Error! Data in publicDatabase changed! **", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10001FC34()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, v0, v1, "Error synching contents on PrivateDB %{private}@", v2);
  sub_100004780();
}

void sub_10001FC98()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, v0, v1, "Error synching contents on SharedDB %{private}@", v2);
  sub_100004780();
}

void sub_10001FCFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to check CloudKit account status; missing self",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100003258();
}

void sub_10001FD28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "*** Device does not support Encryption ***", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10001FD54()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, v0, v1, "Failed to fetchAccountInfo %@", v2);
  sub_100004780();
}

void sub_10001FDB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "User does not have valid credentials on account, skipping", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10001FDE4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, v0, v1, "Failed to refresh data after CKAccountInfo changed %@", v2);
  sub_100004780();
}

void sub_10001FF8C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100052788;
  qword_100052788 = (uint64_t)v1;

}

void sub_1000200BC(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  unsigned int v32;
  void *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[1];
    if (v4)
    {
      objc_msgSend(v4, "shutdown");
      v5 = (void *)v3[1];
      v3[1] = 0;

    }
    v6 = *(void **)(a1 + 32);
    if (v6)
      v7 = v6;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_determinePushEnvironment"));
    v17 = v7;
    v18 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v18, "addObject:", kAPSTopic);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "consumers", 0));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v24, "shouldEnablePushTopic"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pushTopic"));
            objc_msgSend(v18, "addObject:", v25);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v21);
    }

    v26 = sub_10002E034();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v17;
      v42 = 2112;
      v43 = v18;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Starting APS connection env - %@, topics %@", buf, 0x16u);
    }

    v28 = objc_alloc((Class)APSConnection);
    v29 = objc_msgSend(v28, "initWithEnvironmentName:namedDelegatePort:queue:", v17, kAPSDelegatePort, v3[3]);
    objc_msgSend(v29, "_setEnabledTopics:", v18);
    objc_msgSend(v29, "setDelegate:", *(_QWORD *)(a1 + 40));
    v30 = sub_10002E034();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v29, "isConnected");
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "ApplePushService Connection Status %d", buf, 8u);
    }

    v33 = (void *)v3[1];
    v3[1] = v29;
    v34 = v29;

    v35 = (void *)v3[2];
    v3[2] = v17;
    v9 = v17;

  }
  else
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100020874(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

void sub_100020874(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s Nil StrongSelf", a5, a6, a7, a8, 2u);
}

void sub_1000208E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Error fetching server preferred push env, %@", a5, a6, a7, a8, 2u);
}

void sub_100020B5C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create os_transaction, Nil transactionID passed", v1, 2u);
}

void sub_100021768(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000219E8((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000217D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s ServiceIdentifier is nil", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100021840(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get publicInfo after re-try", v1, 2u);
}

void sub_100021880(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "recordType"));
  v4 = 138477827;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized record type %{private}@", (uint8_t *)&v4, 0xCu);

}

void sub_100021914(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Failed to get publicDB info for %{private}@", a5, a6, a7, a8, 3u);
  sub_100004780();
}

void sub_100021978(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s Semaphore timed out!", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_1000219E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Error fetching data %@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_100021AC0(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = (id)objc_opt_new(CKContainerOptions, a2);
  objc_msgSend(v9, "setUseZoneWidePCS:", 1);
  v3 = objc_alloc((Class)CKContainerID);
  v4 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "MSDCloudKitContainerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithContainerIdentifier:environment:", v5, 1);

  v7 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:options:", v6, v9);
  v8 = (void *)qword_100052798;
  qword_100052798 = (uint64_t)v7;

}

void sub_100021BEC(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = objc_alloc((Class)CKContainerID);
  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "MSDPublicCloudKitContainerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7 = objc_msgSend(v2, "initWithContainerIdentifier:environment:", v4, 1);

  v5 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:", v7);
  v6 = (void *)qword_1000527A8;
  qword_1000527A8 = (uint64_t)v5;

}

void sub_100021E94(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100022348((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

  }
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v8, v9);

}

void sub_100022200(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000223F0((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

  }
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v8, v9);

}

void sub_1000222A0(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138477827;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fetchShareMetadataCompletionBlock, any errors %{private}@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100022348(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Error accepting shares %{private}@", a5, a6, a7, a8, 3u);
}

void sub_1000223B0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Nil share URL", v1, 2u);
}

void sub_1000223F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Error fetching share meta data %{private}@", a5, a6, a7, a8, 3u);
}

void sub_1000224CC(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_1000527B8;
  qword_1000527B8 = (uint64_t)v1;

}

uint64_t sub_100022694(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100022748(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000254CC();

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_getMatchingObjectForServiceName:serviceName:", v5, *(_QWORD *)(a1 + 32)));
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
}

void sub_100022898(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000254CC();

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_getMatchingObjectForServiceID:serviceID:", v5, *(_QWORD *)(a1 + 32)));
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
}

void sub_1000229E8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000254CC();

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_getMatchingObjectForBundleID:bundleID:", v5, *(_QWORD *)(a1 + 32)));
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
}

void sub_100023674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  uint64_t v50;

  _Block_object_dispose((const void *)(v50 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_100023728(uint64_t a1)
{
  _BYTE *v2;
  id v3;
  id v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[24])
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "queuedPendingRequests"));
      v3 = objc_retainBlock(*(id *)(a1 + 40));
      objc_msgSend(v4, "addObject:", v3);

    }
  }
  else
  {
    v2[24] = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t sub_1000237B0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000237C0(uint64_t a1)
{

}

void sub_1000237C8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138477827;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Public] Deleted RecordID %{private}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "na_safeAddObject:", v3);
}

void sub_100023890(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100025608();

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138477827;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Public] Adding record - %{private}@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "na_safeAddObject:", v8);
  }

}

void sub_1000239B8(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  NSObject *v32;
  dispatch_time_t v33;
  dispatch_queue_global_t global_queue;
  NSObject *v35;
  id v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[7];
  uint8_t buf[4];
  double v45;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished sync with public db", buf, 2u);
    }

    v7 = *(void **)(a1 + 32);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100023E98;
    v43[3] = &unk_10004A030;
    v8 = *(_QWORD *)(a1 + 48);
    v43[5] = v7;
    v43[6] = v8;
    v43[4] = WeakRetained;
    objc_msgSend(v7, "_withLock:", v43);
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v9)
      v9 = v3;
    v10 = v9;
    v11 = v10;
    if (!v10)
    {
      v14 = sub_10002E034();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Public] Returning information stored in defaults", buf, 2u);
      }

      WeakRetained[4] = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));

      v18 = *(_QWORD *)(a1 + 40);
      if (v18)
        (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v17, 0);
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v20 = WeakRetained;
      v21 = v17;
      v22 = 0;
      goto LABEL_24;
    }
    if (CKErrorIsCode(v10, 21))
    {
      v12 = sub_10002E034();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Public] Change token expired clearing cached data and fetching data again", buf, 2u);
      }

      objc_msgSend(WeakRetained, "_clearAllDefaultsData");
      objc_msgSend(WeakRetained, "syncDataWithCloudKit:", &stru_10004A070);
      goto LABEL_21;
    }
    if ((CKErrorIsCode(v11, 26) & 1) != 0 || CKErrorIsCode(v11, 28))
    {
      v23 = sub_10002E034();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v45 = *(double *)&v11;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Public] Received cloud zone deletion error: %{private}@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "_clearAllDefaultsData");
      goto LABEL_21;
    }
    if ((CKErrorIsCode(v11, 6) & 1) != 0 || CKErrorIsCode(v11, 7))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CKErrorRetryAfterKey));
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      v31 = sub_10002E034();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v45 = v30;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Received rate limited error by the server, re-trying after %f", buf, 0xCu);
      }

      if (WeakRetained[4] < 2uLL)
      {
        v33 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
        global_queue = dispatch_get_global_queue(0, 0);
        v35 = objc_claimAutoreleasedReturnValue(global_queue);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100023F5C;
        v42[3] = &unk_100048AC0;
        v42[4] = WeakRetained;
        dispatch_after(v33, v35, v42);

LABEL_21:
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForDefaultWithCustomClass:", CFSTR("publicDBData")));

        v26 = *(_QWORD *)(a1 + 40);
        if (v26)
          (*(void (**)(uint64_t, void *, void *))(v26 + 16))(v26, v17, v11);
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v20 = WeakRetained;
        v21 = v17;
        v22 = v11;
LABEL_24:
        objc_msgSend(v20, "executePendingRequests:forPublicDBInfo:error:", v19, v21, v22);

        goto LABEL_25;
      }
      v36 = sub_10002E034();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v38 = "Retry failed, skipping publicDb Update";
        v39 = v37;
        v40 = 2;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
      }
    }
    else
    {
      v41 = sub_10002E034();
      v37 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v45 = *(double *)&v11;
        v38 = "[Public] Some other error occurred %{private}@";
        v39 = v37;
        v40 = 12;
        goto LABEL_36;
      }
    }

    goto LABEL_21;
  }
LABEL_25:

}

void sub_100023E98(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queuedPendingRequests"));
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queuedPendingRequests"));
  objc_msgSend(v6, "removeAllObjects");

}

void sub_100023F08(id a1, NSArray *a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  if (v3)
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100025674();

  }
}

id sub_100023F5C(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023FC0;
  v3[3] = &unk_1000494E0;
  v3[4] = v1;
  return objc_msgSend(v1, "syncDataWithCloudKit:", v3);
}

void sub_100023FC0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  if (v4)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000256D4();

  }
}

void sub_100024020(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;

  v9 = a2;
  v10 = a3;
  v11 = a6;
  v12 = sub_10002E034();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
    *(_DWORD *)buf = 138478083;
    v35 = v10;
    v36 = 2113;
    v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Public] Fetched all changes, ChangeToken: %{private}@, RecordZoneName: %{private}@", buf, 0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a6);
  if (v11)
  {
    v15 = sub_10002E034();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100025794();

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;

  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")
         || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v21 = *(void **)(a1 + 32);
    v22 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copy");
    v33 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_handleRecordsChanged:deletedRecordIDS:error:", v22, v23, &v33));
    v25 = v33;

    if (v25 || !objc_msgSend(v24, "count"))
    {
      v26 = sub_10002E034();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100025734();

    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      objc_msgSend(v28, "setObjectWithCustomClass:forDefault:", v24, CFSTR("publicDBData"));

      v29 = *(void **)(a1 + 32);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
      objc_msgSend(v29, "_updateDefaultsWithChangeToken:serverChangeToken:", v30, v10);

      notify_post((const char *)objc_msgSend(kMediaSetupServicesChanged, "UTF8String"));
      objc_msgSend(*(id *)(a1 + 32), "_updateLastRefreshTS");
    }

  }
  else
  {
    v31 = sub_10002E034();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "PublicDB records didn't change since last check", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateLastRefreshTS");
  }

}

NSCopying *__cdecl sub_1000246FC(id a1, MSPublicDBInfo *a2)
{
  return (NSCopying *)-[MSPublicDBInfo recordName](a2, "recordName");
}

id sub_100024A44(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "serviceID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceID"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void sub_100024F74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100025828();

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v7);

}

id sub_100025084(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "serviceID"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_100025148(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "bundleIDS"));
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_10002520C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "serviceName"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100025314(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5));
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void sub_1000254AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1000254B8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000254CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch updated public DB values %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002552C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100004788();
  sub_1000254B8((void *)&_mh_execute_header, v0, v1, "[Public] Failed to create MSPublicDBInfo object with serviceName %{private}@ service ID: %{private}@");
  sub_100004780();
}

void sub_100025598(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_1000254AC((void *)&_mh_execute_header, a1, a3, "[Public] Failed to fetch PublicDB Info, Nil RecordZoneID", v3);
}

void sub_1000255D0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_1000254AC((void *)&_mh_execute_header, a1, a3, "Failed to fetch PublicDb Info, Nil FetchRecordZoneChangesConfiguration obj", v3);
}

void sub_100025608()
{
  uint64_t v0;
  os_log_t v1;

  sub_100004788();
  sub_1000254B8((void *)&_mh_execute_header, v0, v1, "[Public] Error fetching record changes, recordID %@ error %@");
  sub_100004780();
}

void sub_100025674()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch publicDB Data again, %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_1000256D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch data from PublicDB again after CKThrottle, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100025734()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Processing resulted in Nil publicInfo : Skipping update %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_100025794()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "[Public] Encountered error while fetching changes, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_1000257F4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000254AC((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to create PublicDB object", a1);
}

void sub_100025828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to fetch updated values of PublicDBInfo, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void MSDUpdateCKOperationForAttribution(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting applicationBundleIdentifierOverrideForNetworkAttribution to %@ for operation %@", (uint8_t *)&v9, 0x16u);
    }

    v8 = (void *)objc_opt_new(CKOperationConfiguration, v7);
    objc_msgSend(v8, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v4);
    objc_msgSend(v3, "setConfiguration:", v8);

  }
}

void sub_100025C64(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;

  v6 = a2;
  v7 = a4;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v22 = 138412290;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] Fetched changes for Database", (uint8_t *)&v22, 0xCu);

  }
  if (v7)
  {
    v12 = sub_10002E034();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002D380(a1, (uint64_t)v7, v13);

    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v7);
  }
  else
  {
    if (v6)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_handleRecordZonesChanged:deletedRecordZones:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
      v16 = sub_10002E034();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_10002D2F8((id *)(a1 + 32), v18);
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v19 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v22 = 138412290;
          v23 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%@] Updating ServerChangeToken for DatabaseOperation", (uint8_t *)&v22, 0xCu);

        }
        v18 = objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
        -[NSObject setObjectWithCustomClass:forDefault:](v18, "setObjectWithCustomClass:forDefault:", v6, *(_QWORD *)(a1 + 56));
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
    v21 = *(_QWORD *)(a1 + 64);
    if (v21)
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v15);

  }
}

id sub_100025E80(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", a2);
}

id sub_100025E8C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", a2);
}

void sub_1000261D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002620C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *log;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[5];
  id v69;
  id v70;
  id v71;
  _BYTE *v72;
  _QWORD v73[5];
  id v74;
  uint64_t v75;
  const __CFString *v76;
  uint8_t v77[4];
  id v78;
  __int16 v79;
  void *v80;
  _BYTE buf[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v17 = sub_10002E034();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fetched RecordZones %@", buf, 0xCu);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
    v21 = objc_msgSend(v20, "copy");

    v23 = (void *)objc_opt_new(NSMutableDictionary, v22);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v82 = sub_100026B50;
    v83 = sub_100026B60;
    v84 = 0;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100026B68;
    v68[3] = &unk_10004A1F8;
    v68[4] = WeakRetained;
    v72 = buf;
    v69 = *(id *)(a1 + 48);
    v70 = *(id *)(a1 + 40);
    v24 = v23;
    v71 = v24;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ms_objectsPassingTest:", v68));

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v25 = *(_QWORD *)(a1 + 72);
      if (v25)
        (*(void (**)(uint64_t, _QWORD))(v25 + 16))(v25, 0);
      goto LABEL_44;
    }
    v26 = sub_10002E034();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v77 = 138477827;
      v78 = v13;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Filtered zoneResult %{private}@", v77, 0xCu);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    if (objc_msgSend(WeakRetained, "databaseScope") == (id)2 && (unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      v29 = sub_10002E034();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "There are duplicate recordZones found with the same account, selecting the one created first", v77, 2u);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allKeys"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sortedArrayUsingSelector:", "compare:"));

      v32 = sub_10002E034();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        log = v33;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "firstObject"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v57));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "zoneID"));
        v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "zoneName"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "firstObject"));
        *(_DWORD *)v77 = 138478083;
        v78 = v34;
        v79 = 2112;
        v80 = v35;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "First zone was created at: %{private}@ created at %@", v77, 0x16u);

        v33 = log;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "firstObject"));
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", v36));

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "firstObject"));
      objc_msgSend(v24, "removeObjectForKey:", v38);

      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100026DDC;
      v66[3] = &unk_10004A240;
      v66[4] = WeakRetained;
      v67 = *(id *)(a1 + 56);
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v66);

      v28 = (void *)v37;
    }
    if (v28)
    {
      v39 = sub_10002E034();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v77 = 138477827;
        v78 = v28;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Successfully fetched record zone %{private}@", v77, 0xCu);
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "zoneID"));
      objc_msgSend(WeakRetained, "_updateUserInfoToRecordZoneIDMap:userID:", v41, *(_QWORD *)(a1 + 40));

      v42 = *(_QWORD *)(a1 + 72);
      if (v42)
        (*(void (**)(uint64_t, void *, _QWORD))(v42 + 16))(v42, v28, 0);
      goto LABEL_43;
    }
    if (objc_msgSend(WeakRetained, "databaseScope") == (id)2)
    {
      if (objc_msgSend(*(id *)(a1 + 56), "createNewZoneIfMissing"))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "UUIDString"));

        v59 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", v44);
        v45 = sub_10002E034();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v77 = 138477827;
          v78 = v59;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Saving Record Zone  %{private}@", v77, 0xCu);
        }

        v47 = *(_QWORD *)(a1 + 56);
        v48 = *(_QWORD *)(a1 + 64);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_100026E84;
        v60[3] = &unk_100048EA8;
        v65 = *(id *)(a1 + 72);
        v61 = *(id *)(a1 + 48);
        v62 = *(id *)(a1 + 40);
        v63 = WeakRetained;
        v49 = v59;
        v64 = v49;
        objc_msgSend(WeakRetained, "_saveRecordZone:withAttribution:andOptions:completion:", v49, v48, v47, v60);

      }
      else
      {
        v53 = *(_QWORD *)(a1 + 72);
        if (!v53)
        {
LABEL_43:

LABEL_44:
          _Block_object_dispose(buf, 8);

LABEL_45:
          goto LABEL_46;
        }
        v75 = MSUserInfoErrorStringKey;
        v76 = CFSTR("No matching zone found and did not create a new one");
        v44 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
        v49 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 3, v44));
        (*(void (**)(uint64_t, _QWORD, id))(v53 + 16))(v53, 0, v49);
      }

    }
    else
    {
      v50 = sub_10002E034();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Zone is missing, but we dont have enough permissions to create", v77, 2u);
      }

      v52 = *(_QWORD *)(a1 + 72);
      if (!v52)
        goto LABEL_43;
      v44 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CKErrorDomain, 12, 0);
      (*(void (**)(uint64_t, _QWORD, id))(v52 + 16))(v52, 0, v44);
    }

    goto LABEL_43;
  }
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_10002D408((uint64_t)v6, v8, v9);

  v10 = *(_QWORD *)(a1 + 72);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
  if (objc_msgSend(v6, "CKErrorHasErrorCode:", 112) && CKErrorIsCode(v6, 2))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CKPartialErrorsByItemIDKey));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "allKeys"));
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CKDatabase(MSDCloudDatabase) fetchRecordZoneFor:user:withOptions:withAttribution:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Zones with ManateeIdentity Lost %@", buf, 0x16u);
    }

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100026B40;
    v73[3] = &unk_100048ED0;
    v16 = *(void **)(a1 + 40);
    v73[4] = *(_QWORD *)(a1 + 32);
    v74 = v16;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v73);

    goto LABEL_45;
  }
LABEL_46:

}

void sub_100026AF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100026B40(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCKErrorMissingManateeIdentity:homeUserID:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t sub_100026B50(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100026B60(uint64_t a1)
{

}

uint64_t sub_100026B68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id obj;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CKRecordZoneDefaultName);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v10 + 40);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_fetchPlaceholderRecordData:error:", v9, &obj));
    objc_storeStrong((id *)(v10 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v12 = sub_10002E034();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10002D484(a1 + 64, v13, v14, v15, v16, v17, v18, v19);
      v7 = 0;
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", MSHomeParticipantHomeIdentifier));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", MSHomeParticipantHomeUserIdentifier));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("PlaceholderRecordCreationDate")));
      v22 = sub_10002E034();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneName"));
        *(_DWORD *)buf = 138478083;
        v29 = v25;
        v30 = 2113;
        v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Placeholder Record for %{private}@ %{private}@", buf, 0x16u);

      }
      if (-[NSObject isEqualToString:](v13, "isEqualToString:", *(_QWORD *)(a1 + 40)))
      {
        v7 = (uint64_t)objc_msgSend(v20, "isEqualToString:", *(_QWORD *)(a1 + 48));
        if ((_DWORD)v7 && v21)
        {
          objc_msgSend(*(id *)(a1 + 56), "na_safeSetObject:forKey:", v3, v21);
          v7 = 1;
        }
      }
      else
      {
        v7 = 0;
      }

    }
  }

  return v7;
}

void sub_100026DDC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "zoneID"));
  objc_msgSend(v4, "deleteRecordZone:withOptions:completion:", v5, *(_QWORD *)(a1 + 40), &stru_10004A218);

}

void sub_100026E30(id a1, BOOL a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  if (v3)
  {
    v4 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10002D4F4();

  }
}

void sub_100026E84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002D554();

    v9 = *(_QWORD *)(a1 + 64);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }
  else
  {
    v10 = MSPlaceholderRecordName;
    v11 = MSPlaceholderRecordType;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKRecord createRecordWithName:recordType:recordZone:](CKRecord, "createRecordWithName:recordType:recordZone:", v10, v11, v12));

    objc_msgSend(v13, "setRecordFieldForKey:value:", MSHomeParticipantHomeIdentifier, *(_QWORD *)(a1 + 32));
    objc_msgSend(v13, "setRecordFieldForKey:value:", MSHomeParticipantHomeUserIdentifier, *(_QWORD *)(a1 + 40));
    v14 = sub_10002E034();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138478083;
      v25 = v16;
      v26 = 2113;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to save PlaceHolder record with HomeID: %{private}@, HomeUserID : %{private}@", buf, 0x16u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000270B0;
    v19[3] = &unk_10004A290;
    v18 = *(void **)(a1 + 56);
    v20 = *(id *)(a1 + 48);
    v21 = v18;
    v23 = *(id *)(a1 + 64);
    v22 = v5;
    objc_msgSend(v20, "saveRecord:completionHandler:", v13, v19);

  }
}

void sub_1000270B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10002D5B4();

    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneID"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100027230;
    v12[3] = &unk_10004A268;
    v14 = *(id *)(a1 + 56);
    v13 = v4;
    objc_msgSend(v8, "deleteRecordZone:withOptions:completion:", v9, 0, v12);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "zoneID"));
      *(_DWORD *)buf = 138477827;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully saved record to Zone %{private}@", buf, 0xCu);

    }
    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v11 + 16))(v11, *(_QWORD *)(a1 + 48), 0);
  }

}

void sub_100027230(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10002D614();

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(a1 + 32));

}

void sub_1000275B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10002D674();

  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v8 != 0, v9);

}

void sub_1000277DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = a3;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKey:", v5));
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

uint64_t sub_1000279F4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100027EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  uint64_t v54;

  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose((const void *)(v54 - 248), 8);
  _Block_object_dispose((const void *)(v54 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_100027F24(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v3 = a2;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000285D0;
  v53[3] = &unk_100048B38;
  v54 = *(id *)(a1 + 32);
  v4 = objc_retainBlock(v53);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v5)
    v5 = v3;
  v6 = v5;
  v7 = v6;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "na_filter:", &stru_10004A320));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(a1 + 40), "_checkShareStatusIfApplicable:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v12);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "na_filter:", &stru_10004A340));
    v16 = objc_msgSend(v15, "mutableCopy");

    if (objc_msgSend(v16, "count") || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "count"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_handleChangedRecords:andDeletedRecordIDS:", v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForDefaultWithCustomClass:", *(_QWORD *)(a1 + 64)));

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "na_map:", &stru_10004A360));
      v20 = sub_10002E034();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v56 = v48;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Services stored in defaults %{private}@", buf, 0xCu);
      }

      if (v17 && objc_msgSend(v17, "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "_notifyObserversDataChanged:cachedData:", v17, v19);
        objc_msgSend(*(id *)(a1 + 40), "_attemptToRecordServiceRequestLapse:fromRecords:", v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
        objc_msgSend(v22, "setObjectWithCustomClass:forDefault:", v17, *(_QWORD *)(a1 + 64));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForDefaultWithCustomClass:", *(_QWORD *)(a1 + 64)));

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "na_map:", &stru_10004A380));
        v25 = sub_10002E034();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v56 = v47;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Services stored in defaults after update %{private}@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_updateServerChangeTokenMap:serverChangeToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
        ((void (*)(_QWORD *, uint64_t))v4[2])(v4, 1);
        v27 = *(_QWORD *)(a1 + 72);
        if (v27)
          (*(void (**)(uint64_t, void *, _QWORD))(v27 + 16))(v27, v17, 0);

      }
      else
      {
        v33 = sub_10002E034();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          sub_10002D79C();

        ((void (*)(_QWORD *, _QWORD))v4[2])(v4, 0);
        v35 = *(_QWORD *)(a1 + 72);
        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 7, 0));
          (*(void (**)(uint64_t, void *, void *))(v35 + 16))(v35, v19, v36);

        }
      }

    }
    else
    {
      ((void (*)(_QWORD *, uint64_t))v4[2])(v4, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForDefaultWithCustomClass:", *(_QWORD *)(a1 + 64)));

      v44 = *(_QWORD *)(a1 + 72);
      if (v44)
        (*(void (**)(uint64_t, void *, _QWORD))(v44 + 16))(v44, v17, 0);
    }

    goto LABEL_36;
  }
  if (!CKErrorIsCode(v6, 21))
  {
    if (objc_msgSend(v7, "code") == (id)112)
    {
      v28 = sub_10002E034();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10002D7F4();

      v30 = *(void **)(a1 + 40);
      v31 = *(_QWORD *)(a1 + 48);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
      objc_msgSend(v30, "handleCKErrorMissingManateeIdentity:homeUserID:", v31, v32);

      goto LABEL_41;
    }
    if (CKErrorIsCode(v7, 26))
    {
      v37 = sub_10002E034();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_10002D820(a1, v38);

      v39 = *(void **)(a1 + 40);
      v58 = *(_QWORD *)(a1 + 48);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
      objc_msgSend(v39, "_purgeDeletedZonesFromDefaults:", v40);

      goto LABEL_41;
    }
    if ((CKErrorIsCode(v7, 3) & 1) == 0 && !CKErrorIsCode(v7, 4))
    {
      v45 = sub_10002E034();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_10002D8A4();

      goto LABEL_41;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForDefaultWithCustomClass:", *(_QWORD *)(a1 + 64)));

    v42 = *(_QWORD *)(a1 + 72);
    if (v42)
      (*(void (**)(uint64_t, void *, _QWORD))(v42 + 16))(v42, v10, 0);
    ((void (*)(_QWORD *, _QWORD))v4[2])(v4, 0);
LABEL_36:

    goto LABEL_43;
  }
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10002D7C8();

  objc_msgSend(*(id *)(a1 + 40), "_handleCKErrorChangeTokenExpired:userInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_41:
  if (*(_QWORD *)(a1 + 72))
  {
    ((void (*)(_QWORD *, _QWORD))v4[2])(v4, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
LABEL_43:

}

id sub_1000285D0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stopwatch"));
  objc_msgSend(v4, "stop");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stopwatch"));
  objc_msgSend(v5, "toggleLock:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setDidSucceed:", a2);
  return +[MSAnalytics sendServiceEvent:](MSAnalytics, "sendServiceEvent:", *(_QWORD *)(a1 + 32));
}

BOOL sub_100028644(id a1, CKRecord *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](a2, "recordID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordName"));
  v4 = objc_msgSend(v3, "isEqualToString:", CKRecordNameZoneWideShare);

  return v4;
}

BOOL sub_1000286A0(id a1, CKRecord *a2)
{
  CKRecord *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v2, "recordType"));
  if ((objc_msgSend(v3, "isEqualToString:", MSServiceAccountRecordType) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v2, "recordType"));
    v4 = objc_msgSend(v5, "isEqualToString:", MSDefaultServiceRecordType);

  }
  return v4;
}

id sub_100028724(id a1, MSDDefaultsInfo *a2)
{
  MSDDefaultsInfo *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordName](v2, "recordName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordZoneName](v2, "recordZoneName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v3, v4));
  return v5;
}

id sub_1000287A4(id a1, MSDDefaultsInfo *a2)
{
  MSDDefaultsInfo *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordName](v2, "recordName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordZoneName](v2, "recordZoneName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v3, v4));
  return v5;
}

void sub_100028824(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v9 = a2;
  v10 = a3;
  v11 = a6;
  v12 = sub_10002E034();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138478083;
    v31 = v9;
    v32 = 2113;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetch Records Completion: recordZoneID %{private}@ serverChangeToken %{private}@", (uint8_t *)&v30, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a6);
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v30 = 138412802;
    v31 = v17;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] Fetched all records for recordZoneID %@, serverChangeToken %@", (uint8_t *)&v30, 0x20u);

  }
  if (v11)
  {
    v18 = sub_10002E034();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10002D904();

    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = 0;

    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = 0;
  }
  else
  {
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v25 = v10;
    v23 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v25;
  }

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v26 = sub_10002E034();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = 138412290;
      v31 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ database did not change since last check", (uint8_t *)&v30, 0xCu);

    }
  }

}

void sub_100028A9C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412803;
    v12 = v10;
    v13 = 2113;
    v14 = v5;
    v15 = 2113;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] Deleted RecordID %{private}@ and type %{private}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "na_safeAddObject:", v5);

}

void sub_100028BA8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = 138412802;
      v18 = v16;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%@] Error fetching record changes for recordID %@, error %@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v17 = 138412547;
      v18 = v14;
      v19 = 2113;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@] Adding recordID %{private}@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "na_safeAddObject:", v8);
  }

}

void sub_100028F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100028FA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  if (v5)
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10002D964(a1, (uint64_t)v5, v7);

    if (objc_msgSend(v5, "CKErrorHasErrorCode:", 112))
      objc_msgSend(*(id *)(a1 + 40), "handleCKErrorMissingManateeIdentity:homeUserID:", *(_QWORD *)(a1 + 32), 0);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

id sub_100029528(id a1, CKRecordZoneID *a2)
{
  return -[CKRecordZoneID zoneName](a2, "zoneName");
}

id sub_100029530(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recordZoneName"));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id sub_100029574(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

void sub_1000295C0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100029664;
  v9[3] = &unk_10004A4D8;
  v7 = v5;
  v10 = v7;
  if (objc_msgSend(v6, "na_any:", v9))
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v8);

}

id sub_100029664(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ownerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ownerName"));
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "zoneName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneName"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_100029938(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10002D9FC((uint64_t)v9, v11, v12);

  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v9);

  }
}

NSCopying *__cdecl sub_100029D70(id a1, MSDDefaultsInfo *a2)
{
  MSDDefaultsInfo *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordName](v2, "recordName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordZoneName](v2, "recordZoneName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v3, v4));
  return (NSCopying *)v5;
}

id sub_10002A338(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  if (objc_msgSend(v4, "isEqualToString:", MSDefaultServiceRecordType))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
    if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordZoneName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recordZoneName"));
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id sub_10002A400(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordType"));
  v5 = objc_msgSend(v4, "isEqualToString:", MSDefaultServiceRecordType);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serviceID"));
    if (objc_msgSend(v8, "isEqual:", v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeID"));
      if (objc_msgSend(v11, "isEqual:", v12))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeUserID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "homeUserID"));
        if (objc_msgSend(v13, "isEqual:", v14))
        {
          v18 = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordZoneName"));
          v19 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordZoneName"));
          v6 = objc_msgSend(v15, "isEqualToString:", v16);

          v13 = v19;
          v14 = v18;
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

void sub_10002A748(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = a4;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

  }
}

uint64_t sub_10002A970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 != 0, a4);
  return result;
}

void sub_10002ABC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Encountered error when modifying record %@", (uint8_t *)&v13, 0xCu);
    }

  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);

}

void sub_10002AE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002AEA0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002DBC4();

  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = MSHomeParticipantHomeIdentifier;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordFieldForKey:", MSHomeParticipantHomeIdentifier));
    objc_msgSend(v9, "na_safeSetObject:forKey:", v11, v10);

    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = MSHomeParticipantHomeUserIdentifier;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordFieldForKey:", MSHomeParticipantHomeUserIdentifier));
    objc_msgSend(v12, "na_safeSetObject:forKey:", v14, v13);

    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "creationDate"));
    objc_msgSend(v15, "na_safeSetObject:forKey:", v16, CFSTR("PlaceholderRecordCreationDate"));

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10002B1D8(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "zoneName"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
    objc_msgSend(v9, "setPreviousServerChangeToken:", v10);
    objc_msgSend(*(id *)(a1 + 40), "na_safeSetObject:forKey:", v9, *(_QWORD *)(a1 + 32));

  }
}

id sub_10002B578(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
}

void sub_10002B760(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_10002E034();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10002DD40();

  }
}

id sub_10002B7B4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recordZoneName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneName"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void sub_10002BA54(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did handle Manatee loss on SharedDatabase %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10002BC54(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10002DDA0(a1, (uint64_t)v4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Successfully deleted share after Manatee Loss detected", (uint8_t *)&v11, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);

}

void sub_10002BE68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10002DE28();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CKDatabaseScopeString(objc_msgSend(*(id *)(a1 + 32), "databaseScope"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneName"));
      *(_DWORD *)buf = 138412546;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Successfully deleted recordZone(%@)", buf, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForDefaultWithCustomClass:", CFSTR("privateDatabaseData")));

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002C12C;
    v23[3] = &unk_100048A98;
    v24 = *(id *)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject na_filter:](v7, "na_filter:", v23));
    if (objc_msgSend(v12, "count"))
    {
      v13 = objc_alloc((Class)CKRecordZone);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
      v16 = objc_msgSend(v13, "initWithZoneName:", v15);

      v17 = *(void **)(a1 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10002C18C;
      v20[3] = &unk_10004A5F8;
      v20[4] = v17;
      v21 = v12;
      v22 = *(id *)(a1 + 40);
      objc_msgSend(v17, "_saveRecordZone:withAttribution:andOptions:completion:", v16, 0, 0, v20);

    }
    else
    {
      v18 = sub_10002E034();
      v16 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "zoneName"));
        *(_DWORD *)buf = 138412290;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No cached Info associated with Zone %@", buf, 0xCu);

      }
    }

  }
}

id sub_10002C12C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recordZoneName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "zoneName"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void sub_10002C18C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully saved new zone %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_populateRecordZoneWithCachedInfo:cachedInfo:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002DE88();

  }
  v10 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 48);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v10, "_purgeDeletedZonesFromDefaults:", v11);

}

BOOL sub_10002C8FC(id a1, MSDDefaultsInfo *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsInfo recordType](a2, "recordType"));
  v3 = objc_msgSend(v2, "isEqualToString:", MSServiceAccountRecordType);

  return v3;
}

void sub_10002C940(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10002DF14();

  }
  v12 = objc_msgSend(v7, "count");
  if (v12 == objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully saved records after manatee loss", v15, 2u);
    }

  }
}

BOOL sub_10002CC60(id a1, CKShareParticipant *a2)
{
  CKShareParticipant *v2;
  BOOL v3;

  v2 = a2;
  v3 = (id)-[CKShareParticipant role](v2, "role") != (id)1
    && -[CKShareParticipant invitationTokenStatus](v2, "invitationTokenStatus") == (id)3;

  return v3;
}

void sub_10002CCAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10002DF74();

  }
  else
  {
    v7 = objc_opt_class(CKShare);
    v8 = *(id *)(a1 + 32);
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](MSDHomeManager, "sharedManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentHome"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeCloudShareCreate cloudShareForHome:](MSDHomeCloudShareCreate, "cloudShareForHome:", v12));

    objc_msgSend(v13, "shareRecordWithOwner:completion:", v10, &stru_10004A6E8);
  }

}

void sub_10002CDB0(id a1, HMHomeCloudShareResponse *a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10002DFD4();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully established share after manatee loss", v7, 2u);
  }

}

id sub_10002D22C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "service"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

BOOL sub_10002D294(id a1, CKRecord *a2)
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](a2, "recordFieldForKey:", MediaServiceIdentifier));
  v3 = v2 != 0;

  return v3;
}

id sub_10002D2EC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "databaseScope");
}

void sub_10002D2F8(id *a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = CKDatabaseScopeString(objc_msgSend(*a1, "databaseScope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, a2, v5, "[%@] Error fetching recordZone changes, skipping server token update", v6);

  sub_10001FA38();
}

void sub_10002D380(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];

  v4 = sub_10002D2EC(a1);
  v5 = CKDatabaseScopeString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10002D2D4();
  sub_100004794((void *)&_mh_execute_header, a3, v7, "[%@] Encountered error when fetching changes for database %@, skipping cachedData update", v8);

  sub_10001DAEC();
}

void sub_10002D408(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "-[CKDatabase(MSDCloudDatabase) fetchRecordZoneFor:user:withOptions:withAttribution:completion:]_block_invoke";
  v5 = 2112;
  v6 = a1;
  sub_100004794((void *)&_mh_execute_header, a2, a3, "%s Error fetching record zones, %@", (uint8_t *)&v3);
  sub_100004780();
}

void sub_10002D484(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a2, a3, "Error fetching placeholder information, aborting...%@", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_10002D4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error deleting duplicate recordZones %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002D554()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving recordZone %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002D5B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving Placeholder Record %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002D614()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error deleting orphaned record, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002D674()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to delete record zone, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002D6D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to fetch records - NIL CKRecordID", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002D700()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to fetch records - NIL CKRecordIDS", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002D72C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s NIL recordZoneID", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_10002D79C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to update the device cache after finding updated records. Returning from items from cache.", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002D7C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "CloudKit Server Change tokens expired", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002D7F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Encountered CloudKit Error Missing Manatee Identity", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002D820(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "zoneName"));
  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, a2, v4, "Encountered RecordZoneNotFound Error, purging local cached copy (recordZoneName : %{private}@)", v5);

  sub_10001FA38();
}

void sub_10002D8A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Unknown CloudKit Error occurred %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002D904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error fetching records %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002D964(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[CKDatabase(MSDCloudDatabase) _handleRecordZonesChanged:deletedRecordZones:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Error updating records for recordZoneID %@, %@", (uint8_t *)&v4, 0x20u);
}

void sub_10002D9FC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315395;
  v4 = "-[CKDatabase(MSDCloudDatabase) _saveRecordZone:withAttribution:andOptions:completion:]_block_invoke";
  v5 = 2113;
  v6 = a1;
  sub_100004794((void *)&_mh_execute_header, a2, a3, "%s Failed to save recordZone, %{private}@", (uint8_t *)&v3);
  sub_100004780();
}

void sub_10002DA78(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  *(_DWORD *)a1 = 138477827;
  *a3 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Failed to create MediaService object from record %{private}@", a1, 0xCu);

}

void sub_10002DB04(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create MSDDefaultsInfo object", buf, 2u);
}

void sub_10002DB40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to save record - NIL CKRecord", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002DB6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to modify records, no records specified", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002DB98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Error: Semaphore timed out !! Placeholder recordData", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002DBC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Could not find record with Name: PlaceholderRecordName %{private}@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002DC24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004770((void *)&_mh_execute_header, a1, a3, "%s Failed to update cached info - NIL recordZoneID", a5, a6, a7, a8, 2u);
  sub_100004780();
}

void sub_10002DC94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Failed to handle CKError Missing Manatee Identity - NIL recordZoneID", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002DCC0(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "zoneName"));
  sub_100004788();
  sub_10001FA2C((void *)&_mh_execute_header, a2, v4, "No cached Info associated with Zone %@", v5);

  sub_10001FA38();
}

void sub_10002DD40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error deleting share while recovering from Manatee loss %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002DDA0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];

  v4 = sub_10002D2EC(a1);
  v5 = CKDatabaseScopeString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10002D2D4();
  sub_100004794((void *)&_mh_execute_header, a3, v7, "[%@] Error deleting Manatee share, %@", v8);

  sub_10001DAEC();
}

void sub_10002DE28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error deleting recordZone, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002DE88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error creating new zone after Manatee key loss, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002DEE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003260();
  sub_100003248((void *)&_mh_execute_header, v0, v1, "Error creating records from cached info", v2, v3, v4, v5, v6);
  sub_100003258();
}

void sub_10002DF14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Failed to save records after manatee loss, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002DF74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Error saving modified share, %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

void sub_10002DFD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004788();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Received error while trying to setup share again after manatee loss %@", v2, v3, v4, v5, v6);
  sub_100004780();
}

id sub_10002E034()
{
  if (qword_1000527D0 != -1)
    dispatch_once(&qword_1000527D0, &stru_10004A750);
  return (id)qword_1000527C8;
}

void sub_10002E074(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mediasetupd", "log");
  v2 = (void *)qword_1000527C8;
  qword_1000527C8 = (uint64_t)v1;

}

void sub_10002E0E4(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("Logging Queue", 0);
  v2 = (void *)qword_1000527E0;
  qword_1000527E0 = (uint64_t)v1;

}

void sub_10002E264(id a1, NSString *a2, NSDictionary *a3)
{
  AnalyticsSendEvent(a2, a3);
}

void sub_10002E314(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  double v4;
  uint64_t v5;
  id v6;
  double v7;
  _QWORD v8[4];
  id v9;

  v2 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (*(double *)(a1 + 40) >= 3600.0)
    v4 = *(double *)(a1 + 40);
  else
    v4 = 3600.0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E424;
  v8[3] = &unk_10004A7D8;
  objc_copyWeak(&v9, v2);
  v5 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v8, v4));
  v6 = WeakRetained[2];
  WeakRetained[2] = (id)v5;

  objc_msgSend(WeakRetained[1], "timeIntervalSinceNow");
  if (*(double *)(a1 + 40) < -v7)
    objc_msgSend(WeakRetained[2], "fire");
  objc_destroyWeak(&v9);

}

void sub_10002E40C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002E424(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fileMetrics");

}

void sub_10002E504(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_retainBlock(*(id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

void sub_10002E888(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7));
  v12 = v10 * (double)(unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v6, "doubleValue");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v15, "unsignedIntegerValue") + 1));
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, v7);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7));
  v18 = (v12 + v14) / (double)(unint64_t)objc_msgSend(v17, "unsignedIntegerValue");

  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v19, v7);

}

void sub_10002E9D0(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
  v9 = (char *)objc_msgSend(v8, "unsignedIntegerValue");

  v10 = objc_msgSend(v6, "unsignedIntegerValue");
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", &v9[(_QWORD)v10]));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v7);

}

void sub_10002EA7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7));

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

void sub_10002EB64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v20 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_opt_new(NSMutableDictionary, v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v8 = objc_opt_new(NSMutableDictionary, v7);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 48);
  *(_QWORD *)(v9 + 48) = v8;

  v12 = objc_opt_new(NSMutableDictionary, v11);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "performanceLog"));
  if (v15)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002ECD0;
    v22[3] = &unk_10004A8C8;
    v22[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v22);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "occuranceLog"));

  if (v16)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002EE5C;
    v21[3] = &unk_10004A8C8;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v21);
  }
  v17 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 8);
  *(_QWORD *)(v18 + 8) = v17;

  objc_msgSend(*(id *)(a1 + 32), "_saveAnalyticsData");
}

void sub_10002ECD0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002EDD4;
  v13[3] = &unk_10004A878;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v12 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v6));
  objc_msgSend(v12, "setValuesForKeysWithDictionary:", v8);

  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[7];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performanceLog"));
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v12);

}

void sub_10002EDD4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v8));
  if (!v7)
    v7 = v8;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

void sub_10002EE5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002EF60;
  v13[3] = &unk_10004A878;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v12 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v6));
  objc_msgSend(v12, "setValuesForKeysWithDictionary:", v8);

  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[7];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "occuranceLog"));
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v12);

}

void sub_10002EF60(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v8));
  if (!v7)
    v7 = v8;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

void sub_10002F1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002F1D0(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_opt_isKindOfClass(a2, a1[5]) & 1) == 0 || (objc_opt_isKindOfClass(v7, a1[6]) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }

}

void sub_10002F73C(uint64_t a1)
{
  id v2;
  id v3;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count")
    && (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Start")) & 1) == 0)
  {
    NSLog(CFSTR("Warning: CMSLoggerSession should start with kMSLoggingEventTypeStart. We have %@. It will be insert for you %s"), *(_QWORD *)(a1 + 40), "-[CMSLoggingSession recordEvent:occuredAt:]_block_invoke");
    v2 = -[MSLoggingEvent initForEventType:atTimestamp:]([MSLoggingEvent alloc], "initForEventType:atTimestamp:", CFSTR("Start"), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v2);

  }
  v3 = -[MSLoggingEvent initForEventType:atTimestamp:]([MSLoggingEvent alloc], "initForEventType:atTimestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v3);

}

void sub_10002FC88(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventDurations"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventOccurance"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "_sumbitFromSessionType:withMetadata:withEventDurations:withEventOccurance:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v4, v2);

}

void sub_10002FED4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "_set_user_dir_suffix failed!", v0, 2u);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CKErrorHasErrorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKErrorHasErrorCode:");
}

id objc_msgSend_MSDCloudKitContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MSDCloudKitContainer");
}

id objc_msgSend_MSDCloudKitContainerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MSDCloudKitContainerID");
}

id objc_msgSend_MSDPublicCloudKitContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MSDPublicCloudKitContainer");
}

id objc_msgSend_MSDPublicCloudKitContainerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MSDPublicCloudKitContainerID");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__LoggingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_LoggingQueue");
}

id objc_msgSend__accountHasLocalPlayableContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accountHasLocalPlayableContent:");
}

id objc_msgSend__addHomeDelegates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addHomeDelegates:");
}

id objc_msgSend__addSubscriptionWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addSubscriptionWithIdentifier:completion:");
}

id objc_msgSend__attemptToLoadPublicInfoAgain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attemptToLoadPublicInfoAgain");
}

id objc_msgSend__attemptToRecordServiceRequestLapse_fromRecords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attemptToRecordServiceRequestLapse:fromRecords:");
}

id objc_msgSend__checkAccountStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkAccountStatus");
}

id objc_msgSend__checkDataSanity_publicDBInfo_home_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkDataSanity:publicDBInfo:home:completion:");
}

id objc_msgSend__checkDictionary_forKeyType_andValueType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkDictionary:forKeyType:andValueType:");
}

id objc_msgSend__checkIfRecordZonePresentForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkIfRecordZonePresentForUser:");
}

id objc_msgSend__checkShareStatusIfApplicable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkShareStatusIfApplicable:");
}

id objc_msgSend__checkZoneAndDefaultRecordInEachHome_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkZoneAndDefaultRecordInEachHome:completion:");
}

id objc_msgSend__clearAllDefaultsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearAllDefaultsData");
}

id objc_msgSend__clearCachedIconImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearCachedIconImage:");
}

id objc_msgSend__createAndSaveAppleMusicRecord_publicDBInfo_home_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createAndSaveAppleMusicRecord:publicDBInfo:home:completion:");
}

id objc_msgSend__decodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_decodeObject:forKey:");
}

id objc_msgSend__deleteRecord_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteRecord:completion:");
}

id objc_msgSend__deleteRecordZone_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteRecordZone:completion:");
}

id objc_msgSend__deleteZombieRecordZonesIfAnyInHomes_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteZombieRecordZonesIfAnyInHomes:completion:");
}

id objc_msgSend__determinePushEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_determinePushEnvironment");
}

id objc_msgSend__endSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endSession");
}

id objc_msgSend__fetchData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchData:");
}

id objc_msgSend__fetchImageFromInternetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchImageFromInternetURL");
}

id objc_msgSend__fetchPlaceholderRecordData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchPlaceholderRecordData:error:");
}

id objc_msgSend__fetchPreviousChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchPreviousChangeToken:");
}

id objc_msgSend__fetchRefreshTokenForRecordZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchRefreshTokenForRecordZoneID:");
}

id objc_msgSend__fileMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileMetrics");
}

id objc_msgSend__findServicesForUser_homeID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findServicesForUser:homeID:completion:");
}

id objc_msgSend__getAppleMusicAccountName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getAppleMusicAccountName:");
}

id objc_msgSend__getLocalIconImagePath_remoteIconURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getLocalIconImagePath:remoteIconURL:");
}

id objc_msgSend__getMatchingObjectForBundleID_bundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMatchingObjectForBundleID:bundleID:");
}

id objc_msgSend__getMatchingObjectForServiceID_serviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMatchingObjectForServiceID:serviceID:");
}

id objc_msgSend__getMatchingObjectForServiceName_serviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMatchingObjectForServiceName:serviceName:");
}

id objc_msgSend__getOperationConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getOperationConfiguration");
}

id objc_msgSend__handleAccountStatusUnsupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleAccountStatusUnsupported");
}

id objc_msgSend__handleCKErrorChangeTokenExpired_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleCKErrorChangeTokenExpired:userInfo:");
}

id objc_msgSend__handleCKShareError_home_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleCKShareError:home:");
}

id objc_msgSend__handleChangedRecords_andDeletedRecordIDS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleChangedRecords:andDeletedRecordIDS:");
}

id objc_msgSend__handleChangedRecords_localCachedCopy_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleChangedRecords:localCachedCopy:error:");
}

id objc_msgSend__handleChangesInChangedRecords_withDataInLocalCopy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleChangesInChangedRecords:withDataInLocalCopy:");
}

id objc_msgSend__handleDefaultServiceChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDefaultServiceChanged:");
}

id objc_msgSend__handleDeletedRecordIDS_localCachedCopy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDeletedRecordIDS:localCachedCopy:");
}

id objc_msgSend__handleDeletedRecordIDS_withDataInLocalCopy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDeletedRecordIDS:withDataInLocalCopy:");
}

id objc_msgSend__handleDeviceSupportsEncryption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDeviceSupportsEncryption:");
}

id objc_msgSend__handleHomeKitFinishedInitialization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleHomeKitFinishedInitialization");
}

id objc_msgSend__handleManateeLossOnPrivateDatabase_homeUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleManateeLossOnPrivateDatabase:homeUserID:");
}

id objc_msgSend__handleManateeLossOnSharedDatabase_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleManateeLossOnSharedDatabase:completion:");
}

id objc_msgSend__handleMultiplePeopleOnShare_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleMultiplePeopleOnShare:completion:");
}

id objc_msgSend__handleRecordZonesChanged_deletedRecordZones_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRecordZonesChanged:deletedRecordZones:");
}

id objc_msgSend__handleRecordsChanged_deletedRecordIDS_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRecordsChanged:deletedRecordIDS:error:");
}

id objc_msgSend__handleServiceAdded_cachedDataIDS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleServiceAdded:cachedDataIDS:");
}

id objc_msgSend__handleServiceRemoved_cachedDataIDS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleServiceRemoved:cachedDataIDS:");
}

id objc_msgSend__hasItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasItems");
}

id objc_msgSend__homeWasRemoved(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_homeWasRemoved");
}

id objc_msgSend__initializeBackgroundActivityTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeBackgroundActivityTask");
}

id objc_msgSend__initializeCKAndServiceInfoForHome_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeCKAndServiceInfoForHome:completion:");
}

id objc_msgSend__initializeCoalescerObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeCoalescerObject");
}

id objc_msgSend__loadAnalyticsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadAnalyticsData");
}

id objc_msgSend__loggerStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loggerStorage");
}

id objc_msgSend__markHomeKitInitialized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_markHomeKitInitialized");
}

id objc_msgSend__notifyObserversDataChanged_cachedData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyObserversDataChanged:cachedData:");
}

id objc_msgSend__performDataRefresh_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performDataRefresh:");
}

id objc_msgSend__performStartup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performStartup");
}

id objc_msgSend__populateRecordZoneWithCachedInfo_cachedInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateRecordZoneWithCachedInfo:cachedInfo:");
}

id objc_msgSend__purgeDeletedZonesFromDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_purgeDeletedZonesFromDefaults:");
}

id objc_msgSend__refreshDatabases_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshDatabases:");
}

id objc_msgSend__returnGenericAppIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_returnGenericAppIcon");
}

id objc_msgSend__saveAnalyticsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveAnalyticsData");
}

id objc_msgSend__saveDataInLocalCacheDir_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveDataInLocalCacheDir:withName:");
}

id objc_msgSend__saveISIconInLocalCacheDir_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveISIconInLocalCacheDir:withName:");
}

id objc_msgSend__saveMediaServiceConfigInfo_record_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveMediaServiceConfigInfo:record:completion:");
}

id objc_msgSend__savePublicDBInfoInDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_savePublicDBInfoInDefaults");
}

id objc_msgSend__saveRecordAndShare_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveRecordAndShare:completion:");
}

id objc_msgSend__saveRecordZone_withAttribution_andOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveRecordZone:withAttribution:andOptions:completion:");
}

id objc_msgSend__scheduleRefreshTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleRefreshTask");
}

id objc_msgSend__serviceConfigInfoFor_homeUserIDS_serviceID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serviceConfigInfoFor:homeUserIDS:serviceID:completion:");
}

id objc_msgSend__servicesForUser_homeID_publicInfo_currentUser_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_servicesForUser:homeID:publicInfo:currentUser:completion:");
}

id objc_msgSend__setAdditionalXPCActivityProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAdditionalXPCActivityProperties:");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__setupMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupMultiUser");
}

id objc_msgSend__setupNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupNotifications");
}

id objc_msgSend__setupShareForParticipant_home_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupShareForParticipant:home:completion:");
}

id objc_msgSend__shareThisRecordIfApplicable_home_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shareThisRecordIfApplicable:home:completion:");
}

id objc_msgSend__shouldProceedWithExecution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldProceedWithExecution:");
}

id objc_msgSend__statConnectionWithEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_statConnectionWithEnvironment:");
}

id objc_msgSend__sumbitFromSessionType_withMetadata_withEventDurations_withEventOccurance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sumbitFromSessionType:withMetadata:withEventDurations:withEventOccurance:");
}

id objc_msgSend__syncDataWithCloudKitWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_syncDataWithCloudKitWithCompletion:");
}

id objc_msgSend__updateDefaultService_record_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDefaultService:record:completion:");
}

id objc_msgSend__updateDefaultService_serviceID_userInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDefaultService:serviceID:userInfo:completion:");
}

id objc_msgSend__updateDefaultsWithChangeToken_serverChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDefaultsWithChangeToken:serverChangeToken:");
}

id objc_msgSend__updateLastRefreshTS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateLastRefreshTS");
}

id objc_msgSend__updateServerChangeTokenMap_serverChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateServerChangeTokenMap:serverChangeToken:");
}

id objc_msgSend__updateUserInfoToRecordZoneIDMap_userID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUserInfoToRecordZoneIDMap:userID:");
}

id objc_msgSend__withAccountCheckLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_withAccountCheckLock:");
}

id objc_msgSend__withLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_withLock:");
}

id objc_msgSend__withReadinessLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_withReadinessLock:");
}

id objc_msgSend__withRequestLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_withRequestLock:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acceptInvitation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptInvitation:completion:");
}

id objc_msgSend_acceptShareWithShareMetadata_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptShareWithShareMetadata:completion:");
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptanceStatus");
}

id objc_msgSend_accountAuthToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountAuthToken");
}

id objc_msgSend_accountInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountInfoWithCompletionHandler:");
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountName");
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountStatus");
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFilterPredicate:");
}

id objc_msgSend_addMediaService_usingSetupBundles_transaction_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMediaService:usingSetupBundles:transaction:completion:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addParticipant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addParticipant:");
}

id objc_msgSend_addSubscriptionForDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubscriptionForDatabase:");
}

id objc_msgSend_addSubscriptionForDatabaseWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubscriptionForDatabaseWithIdentifier:completion:");
}

id objc_msgSend_allHomes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHomes");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_iTunesAccountWithHomeUserIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_iTunesAccountWithHomeUserIdentifier:");
}

id objc_msgSend_ams_mediaAccountForHomeWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_mediaAccountForHomeWithIdentifier:");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authConfiguration");
}

id objc_msgSend_authConfigurationFromMSAuthData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authConfigurationFromMSAuthData:");
}

id objc_msgSend_authCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authCredential");
}

id objc_msgSend_authCredentialFromMSAuthData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authCredentialFromMSAuthData:");
}

id objc_msgSend_authFatalError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authFatalError");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIDS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIDS");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_cacheLastRefreshforHomes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheLastRefreshforHomes:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilities");
}

id objc_msgSend_clearDeveloperDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearDeveloperDefaults");
}

id objc_msgSend_clearLastRefreshTSForHomes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearLastRefreshTSForHomes");
}

id objc_msgSend_clearObjectForDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearObjectForDefault:");
}

id objc_msgSend_clearPrivateAndSharedLocalData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPrivateAndSharedLocalData");
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientInfo");
}

id objc_msgSend_cloudManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudManager");
}

id objc_msgSend_cloudShareForHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudShareForHome:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_configURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configURL");
}

id objc_msgSend_configurationPublicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationPublicKey");
}

id objc_msgSend_consumers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consumers");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_containerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
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

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createMediaServiceObjectFromRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createMediaServiceObjectFromRecord");
}

id objc_msgSend_createNewZoneIfMissing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewZoneIfMissing");
}

id objc_msgSend_createPublicDBInfoObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPublicDBInfoObject:");
}

id objc_msgSend_createPublicDBInfoObjectFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPublicDBInfoObjectFromDictionary:");
}

id objc_msgSend_createRecordWithName_recordType_recordZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRecordWithName:recordType:recordZone:");
}

id objc_msgSend_createTransactionWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTransactionWithIdentifier:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationDate");
}

id objc_msgSend_creationTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationTime");
}

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAccessory");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHome");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_databaseScope(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseScope");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultMediaServiceUpdated_homeUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMediaServiceUpdated:homeUserID:");
}

id objc_msgSend_defaultsForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultsForDomain:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteRecord_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRecord:withOptions:completion:");
}

id objc_msgSend_deleteRecordWithID_missingManateeIdentity_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRecordWithID:missingManateeIdentity:withOptions:completion:");
}

id objc_msgSend_deleteRecordZone_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRecordZone:withOptions:completion:");
}

id objc_msgSend_developerProfilesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "developerProfilesCount");
}

id objc_msgSend_deviceCanManageMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceCanManageMultiUser");
}

id objc_msgSend_deviceMediaLibraryWithUserIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMediaLibraryWithUserIdentity:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domains");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptedValues");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_establishShareWithHomeOwner_container_allowWriteAccess_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "establishShareWithHomeOwner:container:allowWriteAccess:completionHandler:");
}

id objc_msgSend_eventDurations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventDurations");
}

id objc_msgSend_eventOccurance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventOccurance");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_executePendingRequests_forPublicDBInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executePendingRequests:forPublicDBInfo:error:");
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expiration");
}

id objc_msgSend_fetchAllRecordZonesOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllRecordZonesOperation");
}

id objc_msgSend_fetchAllRecordsForRecordZoneID_userInfo_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllRecordsForRecordZoneID:userInfo:withOptions:completion:");
}

id objc_msgSend_fetchAuthTokensForMediaService_networkActivity_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAuthTokensForMediaService:networkActivity:completion:");
}

id objc_msgSend_fetchInstalledMediaSetupProfilesManagedDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchInstalledMediaSetupProfilesManagedDefaults");
}

id objc_msgSend_fetchRecordWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRecordWithID:completionHandler:");
}

id objc_msgSend_fetchRecordWithID_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRecordWithID:withOptions:completion:");
}

id objc_msgSend_fetchRecordWithIDS_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRecordWithIDS:withOptions:completion:");
}

id objc_msgSend_fetchRecordZoneFor_user_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRecordZoneFor:user:withOptions:completion:");
}

id objc_msgSend_fetchRecordZoneFor_user_withOptions_withAttribution_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRecordZoneFor:user:withOptions:withAttribution:completion:");
}

id objc_msgSend_fetchShareMetadataForShareURL_withShareToken_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchShareMetadataForShareURL:withShareToken:completion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishTasksAndInvalidate");
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fire");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fromUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fromUser");
}

id objc_msgSend_genericApplicationIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "genericApplicationIcon");
}

id objc_msgSend_getAvailableServices_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAvailableServices:completion:");
}

id objc_msgSend_getCachedAvailableServices_homeID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCachedAvailableServices:homeID:completion:");
}

id objc_msgSend_getCachedPublicInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCachedPublicInfo");
}

id objc_msgSend_getCachedPublicInfoForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCachedPublicInfoForBundleID:");
}

id objc_msgSend_getCachedPublicInfoForServiceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCachedPublicInfoForServiceID:");
}

id objc_msgSend_getDataFromURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDataFromURL:completionHandler:");
}

id objc_msgSend_getDefaultMediaService_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultMediaService:completion:");
}

id objc_msgSend_getLocalCachedImageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalCachedImageURL");
}

id objc_msgSend_getMediaServiceChoicesForSharedUser_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMediaServiceChoicesForSharedUser:completion:");
}

id objc_msgSend_getPublicInfoForBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPublicInfoForBundleID:completion:");
}

id objc_msgSend_getPublicInfoForServiceName_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPublicInfoForServiceName:completion:");
}

id objc_msgSend_getServiceConfigurationInfo_serviceID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getServiceConfigurationInfo:serviceID:completion:");
}

id objc_msgSend_handleCKErrorMissingManateeIdentity_homeUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCKErrorMissingManateeIdentity:homeUserID:");
}

id objc_msgSend_handlePushNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePushNotification:");
}

id objc_msgSend_hasAccessoryTypeHomePod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAccessoryTypeHomePod");
}

id objc_msgSend_hasValidCredentials(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasValidCredentials");
}

id objc_msgSend_hmf_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hmf_objectsPassingTest:");
}

id objc_msgSend_homeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeID");
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeManager");
}

id objc_msgSend_homeManager_didHomeKitSyncComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeManager:didHomeKitSyncComplete:");
}

id objc_msgSend_homeUserID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeUserID");
}

id objc_msgSend_homeWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeWithIdentifier:");
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homes");
}

id objc_msgSend_iTunesAccountName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesAccountName");
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initForEventType_atTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForEventType:atTimestamp:");
}

id objc_msgSend_initForType_withMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForType:withMetadata:");
}

id objc_msgSend_initWithAccountAuthToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccountAuthToken:");
}

id objc_msgSend_initWithAccountsDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccountsDelegate:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCloudDataManager_homeManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCloudDataManager:homeManager:");
}

id objc_msgSend_initWithContainerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerID:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:");
}

id objc_msgSend_initWithEventType_serviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:serviceID:");
}

id objc_msgSend_initWithExpiration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExpiration:");
}

id objc_msgSend_initWithHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHome:");
}

id objc_msgSend_initWithHomeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHomeIdentifier:");
}

id objc_msgSend_initWithHomeMangerConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHomeMangerConfiguration:");
}

id objc_msgSend_initWithHomeUserID_sharedUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHomeUserID:sharedUserID:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentity:");
}

id objc_msgSend_initWithMediaServiceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaServiceIdentifier:");
}

id objc_msgSend_initWithMediator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediator:");
}

id objc_msgSend_initWithOptions_cachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:cachePolicy:");
}

id objc_msgSend_initWithPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPreviousServerChangeToken:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithReason_withDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:withDelay:");
}

id objc_msgSend_initWithRecordIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordIDs:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordZoneID:");
}

id objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordZoneIDs:configurationsByRecordZoneID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordsToSave:recordIDsToDelete:");
}

id objc_msgSend_initWithService_homeID_homeUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:homeID:homeUserID:");
}

id objc_msgSend_initWithServiceAppInfo_userAccountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceAppInfo:userAccountInfo:");
}

id objc_msgSend_initWithServiceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceID:");
}

id objc_msgSend_initWithServiceID_remoteImageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceID:remoteImageURL:");
}

id objc_msgSend_initWithServiceName_serviceBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:serviceBundleID:");
}

id objc_msgSend_initWithServiceName_serviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:serviceID:");
}

id objc_msgSend_initWithShareMetadatas_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShareMetadatas:");
}

id objc_msgSend_initWithShareURLs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShareURLs:");
}

id objc_msgSend_initWithShareURLs_invitationTokensByShareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShareURLs:invitationTokensByShareURL:");
}

id objc_msgSend_initWithSize_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:scale:");
}

id objc_msgSend_initWithStoreRequestContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStoreRequestContext:");
}

id objc_msgSend_initWithSubscriptionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionID:");
}

id objc_msgSend_initWithSubscriptionIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionIDs:");
}

id objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionsToSave:subscriptionIDsToDelete:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUpdatedData_cachedData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUpdatedData:cachedData:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneID:");
}

id objc_msgSend_initWithZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_installedProfilesWithFilterFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedProfilesWithFilterFlags:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invitationTokenStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invitationTokenStatus");
}

id objc_msgSend_isCloudKitAccessAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudKitAccessAvailable:");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isCurrentUserHomeOwner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCurrentUserHomeOwner");
}

id objc_msgSend_isCurrentUserRestrictedGuest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCurrentUserRestrictedGuest");
}

id objc_msgSend_isDeveloperProfileLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeveloperProfileLoaded");
}

id objc_msgSend_isDeviceAppleTV(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceAppleTV");
}

id objc_msgSend_isDeviceAudioAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceAudioAccessory");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isErrorFatal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isErrorFatal");
}

id objc_msgSend_isHomeKitReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHomeKitReady");
}

id objc_msgSend_isHomeManagerReady_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHomeManagerReady:");
}

id objc_msgSend_isHomeRemovedPermanently_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHomeRemovedPermanently:");
}

id objc_msgSend_isMultiUserEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultiUserEnabled");
}

id objc_msgSend_isServiceRemovable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServiceRemovable");
}

id objc_msgSend_isWaitingForHomesToLoad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWaitingForHomesToLoad");
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainDisplay");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mediaServiceChanged_homeUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaServiceChanged:homeUserID:");
}

id objc_msgSend_mediaServiceRemoved_homeUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaServiceRemoved:homeUserID:");
}

id objc_msgSend_modifyCKRecordWithRecordsToSave_recordIDSToDelete_missingManateeIdentity_withAttribution_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifyCKRecordWithRecordsToSave:recordIDSToDelete:missingManateeIdentity:withAttribution:withOptions:completion:");
}

id objc_msgSend_ms_anyPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ms_anyPassingTest:");
}

id objc_msgSend_ms_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ms_objectsPassingTest:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_na_any_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_any:");
}

id objc_msgSend_na_dictionaryWithKeyGenerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_dictionaryWithKeyGenerator:");
}

id objc_msgSend_na_each_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_each:");
}

id objc_msgSend_na_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_filter:");
}

id objc_msgSend_na_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_firstObjectPassingTest:");
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_map:");
}

id objc_msgSend_na_safeAddObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_safeAddObject:");
}

id objc_msgSend_na_safeContainsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_safeContainsObject:");
}

id objc_msgSend_na_safeSetObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_safeSetObject:forKey:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_notificationFromRemoteNotificationDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationFromRemoteNotificationDictionary:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForDefault:");
}

id objc_msgSend_objectForDefaultWithCustomClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForDefaultWithCustomClass:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyInDefaultDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyInDefaultDomain:");
}

id objc_msgSend_objectForKeyInDeveloperDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyInDeveloperDomain:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_occuranceLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "occuranceLog");
}

id objc_msgSend_operationConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationConfiguration");
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownerName");
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "participants");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloads");
}

id objc_msgSend_performRefreshWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRefreshWithCompletion:");
}

id objc_msgSend_performSubscriptionStatusRequest_withStatusHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSubscriptionStatusRequest:withStatusHandler:");
}

id objc_msgSend_performanceLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performanceLog");
}

id objc_msgSend_permission(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "permission");
}

id objc_msgSend_pointScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointScale");
}

id objc_msgSend_populateCKRecordInfo_userInfo_recordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateCKRecordInfo:userInfo:recordType:");
}

id objc_msgSend_populateMediaService_homeID_homeUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateMediaService:homeID:homeUserID:");
}

id objc_msgSend_predicateWithValue_forProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithValue:forProperty:");
}

id objc_msgSend_prepareImageForDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareImageForDescriptor:");
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateCloudDatabase");
}

id objc_msgSend_processChangesInServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processChangesInServices");
}

id objc_msgSend_profilesEverInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profilesEverInstalled");
}

id objc_msgSend_profilesManager_didAddProfiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profilesManager:didAddProfiles:");
}

id objc_msgSend_profilesManager_didUpdateProfiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profilesManager:didUpdateProfiles:");
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicCloudDatabase");
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushTopic");
}

id objc_msgSend_queuedAwaitingCurrentHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queuedAwaitingCurrentHome");
}

id objc_msgSend_queuedPendingRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queuedPendingRequests");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_recordEvent_occuredAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordEvent:occuredAt:");
}

id objc_msgSend_recordFieldForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordFieldForKey:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordID");
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordName");
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordType");
}

id objc_msgSend_recordZoneName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordZoneName");
}

id objc_msgSend_refreshDataAfterDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshDataAfterDelay");
}

id objc_msgSend_refreshDataForReason_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshDataForReason:completion:");
}

id objc_msgSend_refreshDatabase_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshDatabase:completion:");
}

id objc_msgSend_registerForContainerIDs_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForContainerIDs:completion:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_registerToAcceptCloudSharesForContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerToAcceptCloudSharesForContainers:");
}

id objc_msgSend_releaseTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseTransaction");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCachedIconImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCachedIconImage");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeMediaService_withUserInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMediaService:withUserInfo:completion:");
}

id objc_msgSend_removeMediaServices_withUserInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMediaServices:withUserInfo:completion:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForDefault:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resultWithTimeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultWithTimeout:completion:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_saveRecord_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveRecord:completionHandler:");
}

id objc_msgSend_saveRecord_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveRecord:withOptions:completion:");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schedule");
}

id objc_msgSend_scheduleWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleWithBlock:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_sendServiceRequestLapseEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendServiceRequestLapseEvent:");
}

id objc_msgSend_serverPreferredPushEnvironmentWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverPreferredPushEnvironmentWithError:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceID");
}

id objc_msgSend_serviceIconPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceIconPath");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceType");
}

id objc_msgSend_servicesUpdated_cachedData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "servicesUpdated:cachedData:");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_setAccountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountInfo:");
}

id objc_msgSend_setAccountName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountName:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActivityBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityBlock:");
}

id objc_msgSend_setAllowBattery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowBattery:");
}

id objc_msgSend_setAlternateBundleIDS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateBundleIDS:");
}

id objc_msgSend_setAlternateBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateBundleIdentifiers:");
}

id objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationBundleIdentifierOverrideForNetworkAttribution:");
}

id objc_msgSend_setAuthConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthConfiguration:");
}

id objc_msgSend_setAuthCredential_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthCredential:");
}

id objc_msgSend_setAuthFatalError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthFatalError:");
}

id objc_msgSend_setBelongedLogger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBelongedLogger:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBundleIDS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIDS:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setConfigPublicKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigPublicKey:");
}

id objc_msgSend_setConfigURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigURL:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfigurationPublicKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationPublicKey:");
}

id objc_msgSend_setCountLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCountLimit:");
}

id objc_msgSend_setCreateNewZoneIfMissing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreateNewZoneIfMissing:");
}

id objc_msgSend_setDateOfRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateOfRequest:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateQueue:");
}

id objc_msgSend_setDeveloperProfilesCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeveloperProfilesCount:");
}

id objc_msgSend_setDidSucceed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidSucceed:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setFetchDatabaseChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchDatabaseChangesCompletionBlock:");
}

id objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRecordZoneChangesCompletionBlock:");
}

id objc_msgSend_setFetchRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRecordZonesCompletionBlock:");
}

id objc_msgSend_setFetchRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRecordsCompletionBlock:");
}

id objc_msgSend_setFetchShareMetadataCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchShareMetadataCompletionBlock:");
}

id objc_msgSend_setFetchSubscriptionCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchSubscriptionCompletionBlock:");
}

id objc_msgSend_setIconImageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconImageURL:");
}

id objc_msgSend_setIgnoreSystemFilterPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreSystemFilterPredicates:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMarkAsParticipantNeedsNewInvitationToken:");
}

id objc_msgSend_setMaxDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxDelay:");
}

id objc_msgSend_setMediaLibrary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaLibrary:");
}

id objc_msgSend_setMinDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinDelay:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifyRecordsCompletionBlock:");
}

id objc_msgSend_setModifySubscriptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifySubscriptionsCompletionBlock:");
}

id objc_msgSend_setNotificationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationInfo:");
}

id objc_msgSend_setObject_forDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forDefault:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectWithCustomClass_forDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectWithCustomClass:forDefault:");
}

id objc_msgSend_setPerShareCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerShareCompletionBlock:");
}

id objc_msgSend_setPerShareMetadataBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerShareMetadataBlock:");
}

id objc_msgSend_setPermission_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPermission:");
}

id objc_msgSend_setPreregistered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreregistered:");
}

id objc_msgSend_setPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousServerChangeToken:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setRecordCreationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordCreationDate:");
}

id objc_msgSend_setRecordFieldForKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordFieldForKey:value:");
}

id objc_msgSend_setRecordName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordName:");
}

id objc_msgSend_setRecordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordType:");
}

id objc_msgSend_setRecordWasChangedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordWasChangedBlock:");
}

id objc_msgSend_setRecordWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordWithIDWasDeletedBlock:");
}

id objc_msgSend_setRecordZoneFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordZoneFetchCompletionBlock:");
}

id objc_msgSend_setRecordZoneName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordZoneName:");
}

id objc_msgSend_setRecordZoneWithIDChangedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordZoneWithIDChangedBlock:");
}

id objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordZoneWithIDWasDeletedBlock:");
}

id objc_msgSend_setRemoteIconURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteIconURL:");
}

id objc_msgSend_setRepeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRepeats:");
}

id objc_msgSend_setReportFrequency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReportFrequency:");
}

id objc_msgSend_setRequireInexpensiveNetworkConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequireInexpensiveNetworkConnection:");
}

id objc_msgSend_setRequireNetworkConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequireNetworkConnection:");
}

id objc_msgSend_setServiceIconPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceIconPath:");
}

id objc_msgSend_setServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceName:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setShouldApplyMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldApplyMask:");
}

id objc_msgSend_setShouldReturnLastKnownStatusOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldReturnLastKnownStatusOnly:");
}

id objc_msgSend_setShouldSendContentAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSendContentAvailable:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setTaskExpiredWithRetryAfter_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskExpiredWithRetryAfter:error:");
}

id objc_msgSend_setTimeOfRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeOfRequest:");
}

id objc_msgSend_setUpdateListeningHistoryEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateListeningHistoryEnabled:");
}

id objc_msgSend_setUseZoneWidePCS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseZoneWidePCS:");
}

id objc_msgSend_setUserInitiatedRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInitiatedRequest:");
}

id objc_msgSend_setValuesForKeysWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValuesForKeysWithDictionary:");
}

id objc_msgSend_setWantsNewInvitationToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsNewInvitationToken:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupShareForHomeParticipant_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupShareForHomeParticipant:completion:");
}

id objc_msgSend_shareRecordWithOwner_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareRecordWithOwner:completion:");
}

id objc_msgSend_shareToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareToken");
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareURL");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCloudDatabase");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharedStatusController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStatusController");
}

id objc_msgSend_shouldEnablePushTopic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldEnablePushTopic");
}

id objc_msgSend_shouldUseCloudKit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUseCloudKit");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdown");
}

id objc_msgSend_songsQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "songsQuery");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_specificAccountWithDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specificAccountWithDSID:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startupQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startupQueue");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopwatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopwatch");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscriptionStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionStatus");
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDeviceToDeviceEncryption");
}

id objc_msgSend_switchUserAccountInfo_homeID_homeUserID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchUserAccountInfo:homeID:homeUserID:completion:");
}

id objc_msgSend_syncDataWithCloudKit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncDataWithCloudKit:");
}

id objc_msgSend_syncStatusOfInstalledProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncStatusOfInstalledProfiles");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_timeInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeInterval");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_toggleLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleLock:");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topic");
}

id objc_msgSend_translateCKErrorToMSError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "translateCKErrorToMSError");
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trigger");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterObserver:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateDefaultMediaService_withUserInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDefaultMediaService:withUserInfo:completion:");
}

id objc_msgSend_updateListeningHistoryEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateListeningHistoryEnabled");
}

id objc_msgSend_updateProperty_propertyInfo_withUserInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProperty:propertyInfo:withUserInfo:completion:");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "user");
}

id objc_msgSend_userCloudShareManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userCloudShareManager");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInitiatedRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInitiatedRequest");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_validateConfigurationResourceForMediaService_networkActivity_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateConfigurationResourceForMediaService:networkActivity:completion:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneID");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneName");
}

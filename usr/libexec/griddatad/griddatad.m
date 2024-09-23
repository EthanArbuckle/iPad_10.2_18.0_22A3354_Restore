void sub_100002964(uint64_t a1)
{
  id v2;
  _QWORD v3[4];
  id v4;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[_GDSBalancingAuthority loadRegistrations](_GDSBalancingAuthority, "loadRegistrations"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000029EC;
  v3[3] = &unk_100008308;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

id sub_1000029EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupLocationManagerForPath:identifier:", a3, a2);
}

void sub_100002A38(id a1)
{
  _GDBAManager *v1;
  void *v2;

  if (!qword_10000CE28)
  {
    v1 = objc_alloc_init(_GDBAManager);
    v2 = (void *)qword_10000CE28;
    qword_10000CE28 = (uint64_t)v1;

  }
}

void sub_100003034(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v5 = a2;
  v6 = objc_msgSend(a3, "authorizationStatus");
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v6 == 3)
  {
    if (v8)
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Location bundle %@ authorized for Carbon Awareness", (uint8_t *)&v12, 0xCu);
    }
    v9 = &__kCFBooleanTrue;
  }
  else
  {
    if (v8)
    {
      v10 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Location bundle %@ authorization status: %@", (uint8_t *)&v12, 0x16u);

    }
    v9 = &__kCFBooleanFalse;
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));

}

void sub_100003224(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _QWORD v52[3];
  _QWORD v53[3];
  uint8_t buf[4];
  void *v55;

  objc_msgSend(*(id *)(a1 + 32), "updateBAStatus");
  AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_1000083D8);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = sub_10000388C;
    v46 = sub_10000389C;
    v47 = 0;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000038A4;
    v41[3] = &unk_100008420;
    v41[4] = &v42;
    v41[5] = &v48;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v41);
    if (!*((_BYTE *)v49 + 24))
    {
      if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR))
        sub_100004EB0();
      AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_100008440);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v38 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100003914;
      v39[3] = &unk_100008468;
      v8 = v37;
      v40 = v8;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v39);
      +[_GDSBalancingAuthority saveBalancingAuthorityStatus:](_GDSBalancingAuthority, "saveBalancingAuthorityStatus:", v8);
      v21 = v40;
      goto LABEL_37;
    }
    objc_msgSend((id)v43[5], "coordinate");
    v4 = v3;
    objc_msgSend((id)v43[5], "coordinate");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_GDSBalancingAuthority currentBalancingAuthority](_GDSBalancingAuthority, "currentBalancingAuthority"));
    v8 = v7;
    if (v7)
    {
      if ((objc_msgSend(v7, "latStart"), v9 < v4) && (objc_msgSend(v8, "latEnd"), v4 < v10)
        || (objc_msgSend(v8, "latStart"), v11 > v4) && (objc_msgSend(v8, "latEnd"), v4 > v12))
      {
        if ((objc_msgSend(v8, "longStart"), v13 < v6) && (objc_msgSend(v8, "longEnd"), v6 < v14)
          || (objc_msgSend(v8, "longStart"), v15 > v6) && (objc_msgSend(v8, "longEnd"), v6 > v16))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastUpdatedDate"));
          objc_msgSend(v17, "timeIntervalSinceNow");
          v19 = v18 > -604800.0;

          if (v19)
          {
            v20 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Location still within current bounding box. Last update was less than 7 days ago. No need to update", buf, 2u);
            }
            AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_100008488);
            goto LABEL_38;
          }
        }
      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "boundaryPolygons"));
    v22 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Polygons returned %@", buf, 0xCu);
    }
    if (!v21
      || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys")),
          v24 = objc_msgSend(v23, "count") == 0,
          v23,
          v24))
    {
      if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR))
        sub_100004EDC();
      AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_1000084A8);
      goto LABEL_37;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[_GDBAResolver sharedInstance](_GDBAResolver, "sharedInstance"));
    objc_msgSend((id)v43[5], "coordinate");
    v27 = v26;
    objc_msgSend((id)v43[5], "coordinate");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "balancingAuthorityForLatitude:longitude:polygons:", v21, v27));

    if (!v28)
    {
      AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_1000084C8);
      v8 = 0;
      goto LABEL_37;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v29));

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastUpdatedDate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v31));

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
    v34 = v33;
    if (v33 && v30)
    {

      if (!v32)
      {
LABEL_30:
        +[_GDSBalancingAuthority saveBalancingAuthority:](_GDSBalancingAuthority, "saveBalancingAuthority:", v28);

        v8 = v28;
LABEL_37:

LABEL_38:
        _Block_object_dispose(&v42, 8);

        _Block_object_dispose(&v48, 8);
        return;
      }
      v52[0] = CFSTR("Name");
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
      v53[0] = v35;
      v53[1] = v30;
      v52[1] = CFSTR("Identifier");
      v52[2] = CFSTR("lastUpdatedDate");
      v53[2] = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 3));

      AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_1000084E8);
      v36 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v34;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
    }

    goto LABEL_30;
  }
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR))
    sub_100004E84();
  AnalyticsSendEventLazy(CFSTR("com.apple.gds.badetermination"), &stru_1000083F8);
}

void sub_100003828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_100003874(id a1)
{
  return (NSDictionary *)&off_1000089F8;
}

NSDictionary *__cdecl sub_100003880(id a1)
{
  return (NSDictionary *)&off_100008A20;
}

uint64_t sub_10000388C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000389C(uint64_t a1)
{

}

void sub_1000038A4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "location"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

NSDictionary *__cdecl sub_100003908(id a1)
{
  return (NSDictionary *)&off_100008A48;
}

id sub_100003914(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &__kCFBooleanFalse, a2);
}

NSDictionary *__cdecl sub_100003928(id a1)
{
  return (NSDictionary *)&off_100008A70;
}

NSDictionary *__cdecl sub_100003934(id a1)
{
  return (NSDictionary *)&off_100008A98;
}

NSDictionary *__cdecl sub_100003940(id a1)
{
  return (NSDictionary *)&off_100008AC0;
}

NSDictionary *__cdecl sub_10000394C(id a1)
{
  return (NSDictionary *)&off_100008AE8;
}

uint64_t sub_100003AFC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received request for %@ with bundle %@!", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setupLocationManagerForPath:identifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  +[_GDSBalancingAuthority saveRegisteration:bundlePath:](_GDSBalancingAuthority, "saveRegisteration:bundlePath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_100003F04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100004004(id a1)
{
  _GDBAResolver *v1;
  void *v2;

  if (!qword_10000CE38)
  {
    v1 = objc_alloc_init(_GDBAResolver);
    v2 = (void *)qword_10000CE38;
    qword_10000CE38 = (uint64_t)v1;

  }
}

NSDictionary *__cdecl sub_100004A48(id a1)
{
  return (NSDictionary *)&off_100008B10;
}

void sub_100004AAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004ABC()
{
  if ((_os_feature_enabled_impl("CarbonEmissionsAwareness", "CarbonEnergyAccounting") & 1) != 0)
  {
    xpc_activity_register("com.apple.griddatad.daily", XPC_ACTIVITY_CHECK_IN, &stru_100008590);
  }
  else
  {
    xpc_activity_unregister("com.apple.griddatad.daily");
    xpc_transaction_exit_clean();
  }
}

void sub_100004B14(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;

  v2 = a2;
  if (xpc_activity_get_state(v2) && xpc_activity_get_state(v2) == 2)
  {
    v3 = os_log_create("com.apple.griddatad", "main");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "com.apple.griddatad.daily";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Running activity %s", (uint8_t *)&v5, 0xCu);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[_GDBAManager sharedInstance](_GDBAManager, "sharedInstance"));
    objc_msgSend(v4, "updateBA");

  }
}

void start()
{
  void *v0;
  NSObject *v1;
  id v2;
  void *v3;
  NSObject *v4;
  _QWORD handler[4];
  NSObject *v6;
  uint8_t buf[16];

  v0 = objc_autoreleasePoolPush();
  v1 = os_log_create("com.apple.griddatad", "main");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting griddatad", buf, 2u);
  }
  _set_user_dir_suffix("com.apple.griddatad");
  v2 = NSTemporaryDirectory();
  sub_100004ABC();
  v3 = objc_autoreleasePoolPush();
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004D48;
  handler[3] = &unk_1000085B8;
  v4 = v1;
  v6 = v4;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Initializing com.apple.griddata service\n", buf, 2u);
  }

  objc_autoreleasePoolPop(v3);
  CFRunLoopRun();
  exit(1);
}

void sub_100004D48(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  NSObject *v4;
  int v5;
  const char *v6;

  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = string;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100004DFC(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = CFSTR("/var/db/GridData");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create directory at path %@ -- %@", (uint8_t *)&v2, 0x16u);
}

void sub_100004E84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003F1C();
  sub_100003F04((void *)&_mh_execute_header, v0, v1, "No location bundle registrations for BA fetch", v2, v3, v4, v5, v6);
  sub_100003F14();
}

void sub_100004EB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003F1C();
  sub_100003F04((void *)&_mh_execute_header, v0, v1, "Location not found. Bailing", v2, v3, v4, v5, v6);
  sub_100003F14();
}

void sub_100004EDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003F1C();
  sub_100003F04((void *)&_mh_execute_header, v0, v1, "Error fetching Polygons", v2, v3, v4, v5, v6);
  sub_100003F14();
}

void sub_100004F08(void *a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Listener rejected new connection from PID %d (no entitlement)\n", (uint8_t *)v3, 8u);
}

void sub_100004F90()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100003F1C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Listener received connection!", v1, 2u);
  sub_100003F14();
}

void sub_100004FC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004AAC((void *)&_mh_execute_header, a1, a3, "Failed to convert to GeoJSON %@", a5, a6, a7, a8, 2u);
}

void sub_100005034(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004AAC((void *)&_mh_execute_header, a2, a3, "Error %@", a5, a6, a7, a8, 2u);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_balancingAuthorityForLatitude_longitude_polygons_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balancingAuthorityForLatitude:longitude:polygons:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boundaryPolygons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundaryPolygons");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinate");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentBalancingAuthority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBalancingAuthority");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_fetchBalancingAuthorityPolygons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchBalancingAuthorityPolygons");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_geoJSONObjectsWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "geoJSONObjectsWithData:error:");
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "geometry");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithEffectiveBundle_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundle:delegate:onQueue:");
}

id objc_msgSend_initWithIdentifier_name_latitudeStart_latitudeEnd_longitudeStart_longitudeEnd_updateDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:name:latitudeStart:latitudeEnd:longitudeStart:longitudeEnd:updateDate:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithPolygon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPolygon:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_lastUpdatedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUpdatedDate");
}

id objc_msgSend_latEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latEnd");
}

id objc_msgSend_latStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latStart");
}

id objc_msgSend_loadBalancingAuthorityStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadBalancingAuthorityStatus");
}

id objc_msgSend_loadNumberForPreferenceKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadNumberForPreferenceKey:");
}

id objc_msgSend_loadRegistrations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadRegistrations");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_longEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longEnd");
}

id objc_msgSend_longStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longStart");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pointForMapPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointForMapPoint:");
}

id objc_msgSend_polygons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "polygons");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "properties");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_saveBalancingAuthority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveBalancingAuthority:");
}

id objc_msgSend_saveBalancingAuthorityStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveBalancingAuthorityStatus:");
}

id objc_msgSend_saveNumber_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveNumber:forKey:");
}

id objc_msgSend_saveRegisteration_bundlePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveRegisteration:bundlePath:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setupLocationManagerForPath_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupLocationManagerForPath:identifier:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_updateBA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBA");
}

id objc_msgSend_updateBAStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateBAStatus");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}

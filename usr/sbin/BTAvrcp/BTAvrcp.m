void sub_100003870(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "condition"));
  objc_msgSend(v7, "lock");

  if (objc_msgSend(*(id *)(a1 + 32), "pendingSwitchers"))
  {
    v5[2](v5);
    v8 = *(void **)(a1 + 32);
    v9 = (char *)objc_msgSend(v8, "pendingSwitchers") - 1;
    objc_msgSend(v8, "setPendingSwitchers:", v9);
    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "condition"));
      objc_msgSend(v10, "signal");

    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003990;
    block[3] = &unk_100018780;
    v13 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "condition"));
  objc_msgSend(v11, "unlock");

}

uint64_t sub_100003990(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100003C4C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

void sub_100003C58()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

void sub_100003E64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_1000040C4(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

void sub_100004178(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[4];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_BOOL));
  v7[0] = v1;
  v8[0] = &stru_100018850;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_int64));
  v7[1] = v2;
  v8[1] = &stru_100018870;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_uint64));
  v7[2] = v3;
  v8[2] = &stru_100018890;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_double));
  v7[3] = v4;
  v8[3] = &stru_1000188B0;
  v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v6 = (void *)qword_10001F188;
  qword_10001F188 = v5;

}

NSNumber *__cdecl sub_1000042AC(id a1, OS_xpc_object *a2)
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_BOOL_get_value(a2));
}

NSNumber *__cdecl sub_1000042DC(id a1, OS_xpc_object *a2)
{
  int64_t value;

  value = xpc_int64_get_value(a2);
  return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", value);
}

NSNumber *__cdecl sub_10000430C(id a1, OS_xpc_object *a2)
{
  return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(a2));
}

NSNumber *__cdecl sub_10000433C(id a1, OS_xpc_object *a2)
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", xpc_double_get_value(a2));
}

void sub_1000043F8(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  Block_layout *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_string));
  v4 = v1;
  v5 = &stru_100018910;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)qword_10001F198;
  qword_10001F198 = v2;

}

NSString *__cdecl sub_10000449C(id a1, OS_xpc_object *a2)
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(a2));
}

void sub_10000455C(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  Block_layout *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_dictionary));
  v4 = v1;
  v5 = &stru_100018970;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)qword_10001F1A8;
  qword_10001F1A8 = v2;

}

OS_xpc_object *__cdecl sub_100004600(id a1, OS_xpc_object *a2)
{
  return a2;
}

void sub_100004A14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100004A28(id a1)
{
  return a1;
}

uint64_t sub_100004A30()
{
  uint64_t v0;

  return v0;
}

void sub_100004AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100004B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100004C78(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_timerEvent");
}

id sub_100004C80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
}

void sub_100004D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t start()
{
  BTXpcService *v0;
  void *v1;

  sub_10000AAF8("BTAvrcp");
  v0 = -[BTXpcService initWithName:sessionClass:]([BTXpcService alloc], "initWithName:sessionClass:", "com.apple.BTServer.avrcp", objc_opt_class(BTAVRCP_XpcSession));
  if (v0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v1, "run");

  }
  return 1;
}

void sub_100005B70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  id v7;

  if (a2 == 5)
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = *(void **)(a1 + 32);
      v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v6));
      v7 = (id)v4;
      v5 = CFSTR("kTrackCount");
      goto LABEL_9;
    }
  }
  else
  {
    if (a2 != 4)
    {
      _objc_msgSend(*(id *)(a1 + 40), "setReplyAttributeForID:inReplyAttributes:", a2, *(_QWORD *)(a1 + 32));
      return;
    }
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = *(void **)(a1 + 32);
      v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v2));
      v7 = (id)v4;
      v5 = CFSTR("kTrackNumber");
LABEL_9:
      objc_msgSend(v3, "setValue:forKey:", v4, v5);

    }
  }
}

void sub_1000079BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ContentItemAtOffset;
  uint64_t ArtworkData;
  void *v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    ContentItemAtOffset = MRPlaybackQueueGetContentItemAtOffset(a2, 0);
    ArtworkData = MRContentItemGetArtworkData(ContentItemAtOffset);
    v7 = (id)objc_claimAutoreleasedReturnValue(ArtworkData);
    if (v7)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("kImageData"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

id sub_100007B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _objc_msgSend(*(id *)(a1 + 32), "sendReplyToMsg:status:args:", *(_QWORD *)(a1 + 40), a2, a3);
}

void sub_100008354(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  switch(a2)
  {
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trackTitle"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v5 = *(void **)(a1 + 40);
      v6 = CFSTR("kTitle");
      goto LABEL_19;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trackArtist"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v5 = *(void **)(a1 + 40);
      v6 = CFSTR("kArtist");
      goto LABEL_19;
    case 3:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trackAlbum"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v5 = *(void **)(a1 + 40);
      v6 = CFSTR("kAlbum");
      goto LABEL_19;
    case 4:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trackQueueIndex"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v10 = objc_msgSend(v20, "unsignedIntegerValue");
      v11 = *(void **)(a1 + 40);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v10));
      v13 = CFSTR("kTrackNumber");
      goto LABEL_16;
    case 5:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trackQueueCount"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v15 = objc_msgSend(v20, "unsignedIntegerValue");
      v11 = *(void **)(a1 + 40);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v15));
      v13 = CFSTR("kTrackCount");
      goto LABEL_16;
    case 6:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trackGenre"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v5 = *(void **)(a1 + 40);
      v6 = CFSTR("kGenre");
      goto LABEL_19;
    case 7:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trackDuration"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v18 = objc_msgSend(v20, "unsignedIntegerValue");
      v11 = *(void **)(a1 + 40);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v18));
      v13 = CFSTR("kPlayingTime");
LABEL_16:
      objc_msgSend(v11, "setValue:forKey:", v12, v13);

      break;
    case 8:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trackImageHandle"));

      v4 = v20;
      if (!v20)
        goto LABEL_21;
      v5 = *(void **)(a1 + 40);
      v6 = CFSTR("kImageHandle");
LABEL_19:
      objc_msgSend(v5, "setValue:forKey:", v20, v6);
      break;
    default:
      return;
  }
  v4 = v20;
LABEL_21:

}

void sub_10000AAF8(char *category)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.bluetooth", category);
  v2 = (void *)qword_10001F1C0;
  qword_10001F1C0 = (uint64_t)v1;

}

void sub_10000B6C8(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  signed int v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", kSymptomDiagnosticReplySuccess));
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", kSymptomDiagnosticReplySessionID));
    v6 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_retainAutorelease(v5);
      v7 = v6;
      v15 = 136315138;
      v16 = objc_msgSend(v5, "UTF8String");
      v8 = "ABC Snapshot successful with SessionID %s";
      v9 = v7;
      v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", kSymptomDiagnosticReplyReason));
    v12 = objc_msgSend(v11, "intValue");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", kSymptomDiagnosticReplyReasonString));
    v13 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)v12;
      v5 = objc_retainAutorelease(v5);
      v7 = v13;
      v15 = 134218242;
      v16 = v14;
      v17 = 2080;
      v18 = objc_msgSend(v5, "UTF8String");
      v8 = "ABC Snapshot failed with code %lld and reason: %s";
      v9 = v7;
      v10 = 22;
      goto LABEL_6;
    }
  }

}

void sub_10000C354(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *, _QWORD *);
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C43C;
  v10[3] = &unk_100018AE0;
  v4 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C444;
  v7[3] = &unk_100018AE0;
  v8 = *(id *)(a1 + 32);
  v9 = v12;
  v5 = *(void (**)(uint64_t, _QWORD *, _QWORD *))(v4 + 16);
  v6 = v12;
  v5(v4, v10, v7);

}

id sub_10000C43C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setRecentStations:", *(_QWORD *)(a1 + 40));
}

id sub_10000C444(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setRecentStations:", *(_QWORD *)(a1 + 40));
}

void sub_10000C49C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C51C;
  v5[3] = &unk_100018AE0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

id sub_10000C51C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setRecentStations:", *(_QWORD *)(a1 + 40));
}

void sub_10000C5B4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "stations", (_QWORD)v12));
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = (void *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_1000100B4(v11, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id sub_10000D1CC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setReplyAttributeForID:inReplyAttributes:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t sub_10000D950(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;
  uint64_t v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D9D0;
  v5[3] = &unk_100018B80;
  v2 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D9DC;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v2 + 16))(v2, v5, v4);
}

id sub_10000D9D0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_infoDidChange:", *(_QWORD *)(a1 + 40));
}

id sub_10000D9DC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_refreshInfo");
}

uint64_t sub_10000D9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;
  uint64_t v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DA64;
  v5[3] = &unk_100018B80;
  v2 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DA70;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v2 + 16))(v2, v5, v4);
}

id sub_10000DA64(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_appDidChange:", *(_QWORD *)(a1 + 40));
}

id sub_10000DA70(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_refreshApp");
}

uint64_t sub_10000DA78(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;
  char v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DAFC;
  v5[3] = &unk_100018BF8;
  v2 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DB14;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v2 + 16))(v2, v5, v4);
}

id sub_10000DAFC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_appIsPlayingDidChange:", *(_BYTE *)(a1 + 40) != 0);
}

id sub_10000DB14(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_refreshAppIsPlaying");
}

uint64_t sub_10000DB1C(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t v8;
  char v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DBA0;
  v6[3] = &unk_100018C48;
  v9 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DBB8;
  v5[3] = &unk_100018998;
  v5[4] = v7;
  return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v3 + 16))(v3, v6, v5);
}

id *sub_10000DBA0(id *result)
{
  if (*((_BYTE *)result + 48))
    return (id *)_objc_msgSend(result[4], "_activeOriginDidChange:", result[5]);
  return result;
}

id sub_10000DBB8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_refreshActiveOrigin");
}

uint64_t sub_10000DBC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;
  uint64_t v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DC40;
  v5[3] = &unk_100018B80;
  v2 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DC6C;
  v4[3] = &unk_100018998;
  v4[4] = v6;
  return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(v2 + 16))(v2, v5, v4);
}

void sub_10000DC40(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_supportedCommandsDidChange:");

}

id sub_10000DC6C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_refreshSupportedCommands");
}

id sub_10000DD68(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_infoDidChange:", a2);
}

id sub_10000DDCC(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_appDidChange:", a2);
}

id sub_10000DE30(uint64_t a1, int a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_appIsPlayingDidChange:", a2 != 0);
}

id *sub_10000DE98(id *result, int a2)
{
  if (a2)
    return (id *)_objc_msgSend(result[4], "_activeOriginDidChange:");
  return result;
}

void sub_10000DF00(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_supportedCommandsDidChange:", a2);

}

void sub_10000F2EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000F304(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000FC18(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create XPC server", v1, 2u);
}

void sub_10000FC58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003E64((void *)&_mh_execute_header, a2, a3, "XPC server error: %@", a5, a6, a7, a8, 2u);
}

void sub_10000FCC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003E64((void *)&_mh_execute_header, a2, a3, "Unexpected XPC server event: %@", a5, a6, a7, a8, 2u);
}

void sub_10000FD28(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC connection does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_10000FD68(char a1, void *a2)
{
  NSObject *v2;
  const __CFString *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;

  if ((a1 & 1) != 0)
    v3 = CFSTR("reply");
  else
    v3 = CFSTR("message");
  v4 = a2;
  v5 = objc_msgSend((id)sub_100004A30(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = 138412546;
  v8 = v3;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending XPC %@: %@", (uint8_t *)&v7, 0x16u);

}

void sub_10000FE34(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  int v4;
  void *v5;

  sub_100004A28(a1);
  v2 = objc_msgSend((id)sub_100004A30(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received XPC message: %@", (uint8_t *)&v4, 0xCu);

  sub_100004A08();
}

void sub_10000FEC8(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_100004A28(a1);
  v2 = objc_msgSend((id)sub_100004A30(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100004A14((void *)&_mh_execute_header, v4, v5, "XPC connection error: %@", v6, v7, v8, v9, 2u);

  sub_100004A08();
}

void sub_10000FF4C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_100004A28(a1);
  v2 = objc_msgSend((id)sub_100004A30(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100004A14((void *)&_mh_execute_header, v4, v5, "Unexpected XPC connection event: %@", v6, v7, v8, v9, 2u);

  sub_100004A08();
}

void sub_10000FFD0(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "builtQuery"));
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Built query: %@", (uint8_t *)&v5, 0xCu);

}

void sub_100010074(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out fetching recent stations", v1, 2u);
}

void sub_1000100B4(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  id v5;

  v3 = a1;
  v4 = 134217984;
  v5 = objc_msgSend(a2, "count");
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Found %lu recent stations", (uint8_t *)&v4, 0xCu);

}

void sub_10001014C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out initializing NowPlayingInfo state", v1, 2u);
  sub_10000F320();
}

void sub_100010188(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F304((void *)&_mh_execute_header, a1, a3, "De-allocating now playing information", a5, a6, a7, a8, 0);
  sub_10000F320();
}

void sub_1000101B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F314();
  sub_10000F2EC((void *)&_mh_execute_header, v0, v1, "Info did change: %@", v2, v3, v4, v5, v6);
  sub_10000F2FC();
}

void sub_100010218()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F314();
  sub_10000F2EC((void *)&_mh_execute_header, v0, v1, "AppIdentifier did change: %@", v2, v3, v4, v5, v6);
  sub_10000F2FC();
}

void sub_100010278(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F2EC((void *)&_mh_execute_header, a2, a3, "AppIsPlaying did change: %@", a5, a6, a7, a8, 2u);
  sub_10000F2FC();
}

void sub_1000102F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F304((void *)&_mh_execute_header, a1, a3, "PlaybackQueue did change", a5, a6, a7, a8, 0);
  sub_10000F320();
}

void sub_100010324(void *a1, const void *a2)
{
  NSObject *v3;
  __CFString *v4;
  uint8_t v5[24];

  v3 = a1;
  v4 = (__CFString *)CFCopyDescription(a2);
  sub_10000F314();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ActiveOrigin did change: %@", v5, 0xCu);

}

void sub_1000103C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F314();
  sub_10000F2EC((void *)&_mh_execute_header, v0, v1, "SupportedCommands did change: %@", v2, v3, v4, v5, v6);
  sub_10000F2FC();
}

void sub_100010420(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Missing artwork identifier. CurrentArtworkIdentifier: %@", (uint8_t *)&v3, 0xCu);
  sub_10000F2FC();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__defaultPlaybackRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultPlaybackRate");
}

id objc_msgSend__handleConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnection:");
}

id objc_msgSend__initializeState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeState");
}

id objc_msgSend__objectForKey_dict_optional_converters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_objectForKey:dict:optional:converters:");
}

id objc_msgSend__playbackRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackRate");
}

id objc_msgSend__playbackStateDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackStateDidChange");
}

id objc_msgSend__settingsDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_settingsDidChange:");
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTimer");
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopTimer");
}

id objc_msgSend__supportedCommandsDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportedCommandsDidChange:");
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeout");
}

id objc_msgSend__trackDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackDidChange");
}

id objc_msgSend__trackHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackHash");
}

id objc_msgSend_activeCategories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeCategories");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFilterPredicate:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_albumName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumName:");
}

id objc_msgSend_albumsQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumsQuery");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_archivedDataWithRootObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artistHasSingleAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artistHasSingleAlbum:");
}

id objc_msgSend_artistName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artistName:");
}

id objc_msgSend_artistsQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artistsQuery");
}

id objc_msgSend_attributeIDsFromArgs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeIDsFromArgs:");
}

id objc_msgSend_baseQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseQuery");
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginGeneratingLibraryChangeNotifications");
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransaction");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_browsablePlayers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browsablePlayers");
}

id objc_msgSend_builtQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builtQuery");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_changePath_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changePath:replyBlock:");
}

id objc_msgSend_childrenCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childrenCount");
}

id objc_msgSend_collectionAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionAtIndex:");
}

id objc_msgSend_collectionWithUid_property_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionWithUid:property:");
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collections");
}

id objc_msgSend_composerHasSingleAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "composerHasSingleAlbum:");
}

id objc_msgSend_composersQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "composersQuery");
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "condition");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createFolderWithUid_folder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFolderWithUid:folder:");
}

id objc_msgSend_createSwitcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSwitcher");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentPlaybackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPlaybackState");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSettings");
}

id objc_msgSend_currentTrackHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTrackHash");
}

id objc_msgSend_currentVFSPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentVFSPath");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultMediaLibrary");
}

id objc_msgSend_defaultRadioLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultRadioLibrary");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_effectiveAlbumArtist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveAlbumArtist");
}

id objc_msgSend_encodings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodings");
}

id objc_msgSend_endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endGeneratingLibraryChangeNotifications");
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransaction");
}

id objc_msgSend_enumerateAttributeIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttributeIDs:");
}

id objc_msgSend_fetchRecentStations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecentStations:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_folderNameForUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "folderNameForUid:");
}

id objc_msgSend_folderTypeForUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "folderTypeForUid:");
}

id objc_msgSend_genresQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "genresQuery");
}

id objc_msgSend_getCurrentPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentPath:");
}

id objc_msgSend_getMediaPlayersFromStart_toEnd_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMediaPlayersFromStart:toEnd:replyBlock:");
}

id objc_msgSend_getNowPlayingAttributeIDs_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNowPlayingAttributeIDs:reply:");
}

id objc_msgSend_getNowPlayingItemWithUid_attributeIDs_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNowPlayingItemWithUid:attributeIDs:reply:");
}

id objc_msgSend_getNowPlayingItemsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNowPlayingItemsCount");
}

id objc_msgSend_getNowPlayingItemsFromStart_toEnd_attributeIDs_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNowPlayingItemsFromStart:toEnd:attributeIDs:replyBlock:");
}

id objc_msgSend_getRecentStationGroupsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRecentStationGroupsWithCompletionHandler:");
}

id objc_msgSend_getSearchItemWithUid_attributeIDs_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSearchItemWithUid:attributeIDs:reply:");
}

id objc_msgSend_getSearchItemsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSearchItemsCount");
}

id objc_msgSend_getSearchItemsFromStart_toEnd_attributeIDs_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSearchItemsFromStart:toEnd:attributeIDs:replyBlock:");
}

id objc_msgSend_getVFSItemWithUid_attributeIDs_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getVFSItemWithUid:attributeIDs:reply:");
}

id objc_msgSend_getVFSItemsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getVFSItemsCount");
}

id objc_msgSend_getVFSItemsFromStart_toEnd_attributeIDs_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getVFSItemsFromStart:toEnd:attributeIDs:replyBlock:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMsg:");
}

id objc_msgSend_hasAlbums(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAlbums");
}

id objc_msgSend_hasArtists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasArtists");
}

id objc_msgSend_hasAudiobooks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAudiobooks");
}

id objc_msgSend_hasCompilations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCompilations");
}

id objc_msgSend_hasComposers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasComposers");
}

id objc_msgSend_hasGenres(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasGenres");
}

id objc_msgSend_hasMedia(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasMedia");
}

id objc_msgSend_hasPlaylists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPlaylists");
}

id objc_msgSend_hasPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPodcasts");
}

id objc_msgSend_hasSongs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSongs");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_heights(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heights");
}

id objc_msgSend_indexOfNowPlayingItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfNowPlayingItem");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithName_sessionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:sessionClass:");
}

id objc_msgSend_initWithName_uid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:uid:");
}

id objc_msgSend_initWithName_uid_isRecentlyAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:uid:isRecentlyAdded:");
}

id objc_msgSend_initWithName_uid_parentPlaylistID_isRecentlyAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:uid:parentPlaylistID:isRecentlyAdded:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_isBrowsablePlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBrowsablePlayer");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isForwarding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForwarding");
}

id objc_msgSend_isLocalOrigin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalOrigin");
}

id objc_msgSend_isMusicApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMusicApp");
}

id objc_msgSend_isRecentlyAdded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecentlyAdded");
}

id objc_msgSend_isRewinding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRewinding");
}

id objc_msgSend_isTransacting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTransacting");
}

id objc_msgSend_itemAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemAtIndex:");
}

id objc_msgSend_itemWithUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithUid:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lazyLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lazyLibrary");
}

id objc_msgSend_lazyNowPlayingInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lazyNowPlayingInfo");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "library");
}

id objc_msgSend_libraryDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryDidChange");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lock");
}

id objc_msgSend_mobileBluetoothBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mobileBluetoothBundle");
}

id objc_msgSend_mrActiveOrigin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mrActiveOrigin");
}

id objc_msgSend_mrAppIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mrAppIdentifier");
}

id objc_msgSend_mrAppIsPlaying(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mrAppIsPlaying");
}

id objc_msgSend_mrInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mrInfo");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nowPlayingInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingInfo");
}

id objc_msgSend_nowPlayingItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingItem");
}

id objc_msgSend_nowPlayingItemAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingItemAtIndex:");
}

id objc_msgSend_numberOfItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItems");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parentPlaylistID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentPlaylistID");
}

id objc_msgSend_pendingSwitchers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingSwitchers");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentID");
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "play");
}

id objc_msgSend_playItemWithUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playItemWithUid:");
}

id objc_msgSend_playNowPlayingItemWithUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playNowPlayingItemWithUid:");
}

id objc_msgSend_playSearchItemWithUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playSearchItemWithUid:");
}

id objc_msgSend_playVFSItemWithUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playVFSItemWithUid:");
}

id objc_msgSend_playbackQueueDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueDidChange");
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackState");
}

id objc_msgSend_playbackStateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackStateDidChange:");
}

id objc_msgSend_playerDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerDidChange:");
}

id objc_msgSend_playerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerId");
}

id objc_msgSend_playerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerName");
}

id objc_msgSend_playlistIsFolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistIsFolder:");
}

id objc_msgSend_playlistsQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistsQuery");
}

id objc_msgSend_playlistsRecentlyAddedQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistsRecentlyAddedQuery");
}

id objc_msgSend_predicateForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForProperty:");
}

id objc_msgSend_predicateWithSearchString_forProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithSearchString:forProperties:");
}

id objc_msgSend_predicateWithValue_forProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:forProperty:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicates");
}

id objc_msgSend_propertiesForUid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesForUid");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "query");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_recentStations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentStations");
}

id objc_msgSend_recentlyAddedFolderName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentlyAddedFolderName");
}

id objc_msgSend_refreshActiveCategories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshActiveCategories");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_replyAttributesForIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replyAttributesForIDs:");
}

id objc_msgSend_replyAttributesForUid_attributeIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replyAttributesForUid:attributeIDs:");
}

id objc_msgSend_replyFolderWithType_uid_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replyFolderWithType:uid:name:");
}

id objc_msgSend_replyItemAtIndex_attributeIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replyItemAtIndex:attributeIDs:");
}

id objc_msgSend_replyItemWithAttributeIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replyItemWithAttributeIDs:");
}

id objc_msgSend_replyItemWithUid_name_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replyItemWithUid:name:attributes:");
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representativeItem");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_search_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "search:replyBlock:");
}

id objc_msgSend_sendMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsg:");
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMsg:args:");
}

id objc_msgSend_sendReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendReply:");
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionClass");
}

id objc_msgSend_setActiveCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCategories:");
}

id objc_msgSend_setBuiltQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuiltQuery:");
}

id objc_msgSend_setCloudFilteringType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudFilteringType:");
}

id objc_msgSend_setCurrentPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlaybackState:");
}

id objc_msgSend_setCurrentSearchQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSearchQuery:");
}

id objc_msgSend_setCurrentSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSettings:");
}

id objc_msgSend_setCurrentTrackHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTrackHash:");
}

id objc_msgSend_setCurrentVFSPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentVFSPath:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFilteringDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteringDisabled:");
}

id objc_msgSend_setGroupingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupingType:");
}

id objc_msgSend_setIsForwarding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsForwarding:");
}

id objc_msgSend_setIsRewinding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRewinding:");
}

id objc_msgSend_setIsTransacting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTransacting:");
}

id objc_msgSend_setLazyLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLazyLibrary:");
}

id objc_msgSend_setLazyNowPlayingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLazyNowPlayingInfo:");
}

id objc_msgSend_setMrActiveOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMrActiveOrigin:");
}

id objc_msgSend_setMrAppIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMrAppIdentifier:");
}

id objc_msgSend_setMrAppIsPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMrAppIsPlaying:");
}

id objc_msgSend_setMrInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMrInfo:");
}

id objc_msgSend_setNowPlayingItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNowPlayingItem:");
}

id objc_msgSend_setPendingSwitchers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingSwitchers:");
}

id objc_msgSend_setQueueWithQuery_firstItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueWithQuery:firstItem:");
}

id objc_msgSend_setQueueWithRadioStation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueWithRadioStation:");
}

id objc_msgSend_setShouldIncludeNonLibraryEntities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIncludeNonLibraryEntities:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTimerTransactionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerTransactionCount:");
}

id objc_msgSend_setTransactionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionCount:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settings");
}

id objc_msgSend_settingsDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsDidChange:");
}

id objc_msgSend_showRecentlyAddedFolder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showRecentlyAddedFolder");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signal");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:reply:");
}

id objc_msgSend_stationWithUid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stationWithUid:");
}

id objc_msgSend_stations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stations");
}

id objc_msgSend_storePredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePredicate:");
}

id objc_msgSend_storePredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePredicates:");
}

id objc_msgSend_storedPredicates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storedPredicates");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_systemMusicPlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemMusicPlayer");
}

id objc_msgSend_targetApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetApp");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_timerTransactionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerTransactionCount");
}

id objc_msgSend_trackAlbum(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackAlbum");
}

id objc_msgSend_trackArtist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackArtist");
}

id objc_msgSend_trackDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackDidChange:");
}

id objc_msgSend_trackDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackDuration");
}

id objc_msgSend_trackGenre(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackGenre");
}

id objc_msgSend_trackId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackId");
}

id objc_msgSend_trackImageHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackImageHandle");
}

id objc_msgSend_trackPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackPosition");
}

id objc_msgSend_trackQueueCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackQueueCount");
}

id objc_msgSend_trackQueueIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackQueueIndex");
}

id objc_msgSend_trackTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackTitle");
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCount");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uid");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlock");
}

id objc_msgSend_unplayedEpisodesFolderName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unplayedEpisodesFolderName");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_wait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wait:");
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitUntilDate:");
}

id objc_msgSend_watchdog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "watchdog");
}

id objc_msgSend_widths(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widths");
}

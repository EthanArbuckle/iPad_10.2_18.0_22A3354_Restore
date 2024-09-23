uint64_t sub_100004BEC()
{
  return off_10005E288();
}

uint64_t sub_100004BF8()
{
  return byte_10005E440;
}

uint64_t sub_100004C04(uint64_t result)
{
  byte_10005E440 = result;
  return result;
}

uint64_t sub_100004C10()
{
  return dword_10005E278 | ++dword_10005E444;
}

uint64_t sub_100004C30()
{
  return ++dword_10005E448;
}

uint64_t sub_100004C44()
{
  return ++dword_10005E27C;
}

uint64_t sub_100004C58(void *a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  unsigned int v6;
  void *v7;
  double v8;
  uint64_t v9;

  v1 = a1;
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("throttle_specSwitch")))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentDomainForName:", ICPreferencesDomain));
    v4 = v3;
    v5 = CFSTR("throttle_specSwitch");
  }
  else
  {
    v6 = -[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("throttle_specSlider"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentDomainForName:", ICPreferencesDomain));
    v4 = v3;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("throttle_specSlider")));

      if (!v7)
      {
        v9 = 1024;
        goto LABEL_12;
      }
      objc_msgSend(v7, "doubleValue");
      v9 = (v8 + 0.0);
      goto LABEL_9;
    }
    v5 = v1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v5));

  if (!v7)
  {
    v9 = 0;
    goto LABEL_12;
  }
  v9 = (uint64_t)objc_msgSend(v7, "BOOLValue");
LABEL_9:

LABEL_12:
  return v9;
}

uint64_t sub_100004D90()
{
  return 0;
}

uint64_t sub_100004D98()
{
  uint64_t result;
  uint64_t (*v1)();

  result = os_variant_has_internal_ui("com.apple.imagecapture");
  v1 = sub_100004D90;
  if ((_DWORD)result)
    v1 = (uint64_t (*)())sub_100004C58;
  off_10005E288 = v1;
  return result;
}

void sub_100005AAC(uint64_t a1)
{
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005B10;
  handler[3] = &unk_100048728;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

void sub_100005B10(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64;
  const __CFDictionary *v4;
  uint64_t MatchingService;
  __CFString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  uint64 = xpc_dictionary_get_uint64(xdict, "IOMatchLaunchServiceID");
  v4 = IORegistryEntryIDMatching(uint64);
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  __ICOSLogCreate();
  v6 = CFSTR("<USB>");
  v7 = -[__CFString length](v6, "length");
  if ((_DWORD)MatchingService)
  {
    if ((unint64_t)v7 >= 0x15)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

      v6 = (__CFString *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Adding 0x%x] -->(XPC IOMatchedLaunchServiceID)"), MatchingService));
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v6);
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      v21 = -[__CFString UTF8String](v12, "UTF8String");
      v22 = 2114;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "deviceAdded:", MatchingService);
  }
  else
  {
    if ((unint64_t)v7 >= 0x15)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

      v6 = (__CFString *)v15;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP Service EntryID Failed")));
    v17 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_retainAutorelease(v6);
      v19 = v17;
      *(_DWORD *)buf = 136446466;
      v21 = -[__CFString UTF8String](v18, "UTF8String");
      v22 = 2114;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
}

uint64_t sub_100005D94(void *a1, uint64_t iterator)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  __CFString *v6;
  void (__cdecl **v7)(CFMutableDataRef, CFRange);
  const __CFString *v8;
  os_log_t *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  os_log_t v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  os_log_t *v17;
  void (__cdecl **v18)(CFMutableDataRef, CFRange);
  __CFString *v19;
  NSObject *v20;
  __CFString *v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  v2 = iterator;
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = &stru_100048E60;
    v7 = &CFDataDeleteBytes_ptr;
    v8 = CFSTR("[Adding 0x%x] -->(IOMatchedPublishNotification)");
    v9 = (os_log_t *)&_gICOSLog;
    v23 = v2;
    do
    {
      __ICOSLogCreate();
      v10 = v6;
      if ((unint64_t)-[__CFString length](v6, "length") >= 0x15)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[53], "stringWithFormat:", v8, v2));
      v13 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v6;
        v15 = a1;
        v16 = v8;
        v17 = v9;
        v18 = v7;
        v19 = objc_retainAutorelease(v10);
        v20 = v13;
        v21 = v19;
        v7 = v18;
        v9 = v17;
        v8 = v16;
        a1 = v15;
        v6 = v14;
        v2 = v23;
        v22 = -[__CFString UTF8String](v21, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v25 = v22;
        v26 = 2114;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      objc_msgSend(a1, "deviceAdded:", v5);
      result = IOIteratorNext(v2);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_1000073E4(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD handler[5];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionTimer"));
  v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionTimerQueue"));
      v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
      objc_msgSend(*(id *)(a1 + 40), "setConnectionTimer:", v6);

    }
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100007668;
    handler[3] = &unk_100048750;
    handler[4] = *(_QWORD *)(a1 + 40);
    dispatch_source_set_event_handler(v7, handler);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionTimer"));
    v9 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionTimer"));
    dispatch_activate(v10);
  }
  else
  {

    if (!v4)
      return;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionTimer"));
    dispatch_source_cancel(v11);

    objc_msgSend(*(id *)(a1 + 40), "setConnectionTimer:", 0);
    __ICOSLogCreate();
    v10 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("USB - Cancel Timeout (run)")));
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v10);
      v16 = v14;
      *(_DWORD *)buf = 136446466;
      v19 = -[NSObject UTF8String](v15, "UTF8String");
      v20 = 2114;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

}

void sub_100007668(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionTimer"));
  dispatch_source_cancel(v2);

  objc_msgSend(*(id *)(a1 + 32), "setConnectionTimer:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000076F4;
  block[3] = &unk_100048750;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000076F4(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  SEL v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("USB - Timed Out (term)")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v12 = 136446466;
    v13 = -[__CFString UTF8String](v6, "UTF8String");
    v14 = 2114;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "stop");
  v8 = NSSelectorFromString(CFSTR("stopRunLoop"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v10 = objc_opt_respondsToSelector(v9, v8);

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v11, "performSelector:", v8);

  }
}

void sub_100008784(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  SEL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  SEL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "connected")
    && (objc_msgSend(*(id *)(a1 + 32), "busy") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "range");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "setBytesTransferred:", 0);
    v5 = NSSelectorFromString(CFSTR("usingMTP"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    if (v6
      && (v7 = (void *)v6,
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate")),
          v9 = objc_opt_respondsToSelector(v8, v5),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "performSelector:", v5));

      if (!v4)
      {
LABEL_6:
        v12 = NSSelectorFromString(CFSTR("sentData:responseCode:"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
          v16 = objc_opt_respondsToSelector(v15, v12);

          if ((v16 & 1) != 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
            v18 = *(_QWORD *)(a1 + 40);
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 8199));
            objc_msgSend(v17, "performSelector:withObject:withObject:", v12, v18, v19);

          }
        }
        goto LABEL_13;
      }
    }
    else
    {
      v11 = 0;
      if (!v4)
        goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "setBusy:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setTransactionID:", objc_msgSend(*(id *)(a1 + 40), "transactionID"));
    v20 = objc_msgSend(v11, "BOOLValue");
    v21 = *(void **)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    if (v20)
      objc_msgSend(v21, "sendDataPacketsSplit:", v22);
    else
      objc_msgSend(v21, "sendDataPackets:", v22);
LABEL_13:

  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000091C8(void *a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2));
  objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:", "handleWriteInterruptDataCompletion:", v3, 0);

}

void sub_100009A34(void *a1, int a2, uint64_t a3)
{
  void *v6;
  id v7;
  void *v8;
  unsigned __int16 v9;
  __CFString *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v6 = objc_autoreleasePoolPush();
  byte_10005E488 = 0;
  if (a1)
  {
    v7 = a1;
    v8 = v7;
    if (!a2)
    {
      if (objc_msgSend(v7, "handleBulkData:result:", a3, 0))
        objc_msgSend(v8, "readBulkData");
      goto LABEL_23;
    }
    if (a2 > -536870164)
    {
      if (a2 != -536854449)
      {
        v9 = 749;
LABEL_10:
        if (a2 == (v9 | 0xE0000000))
        {
          __ICOSLogCreate();
          v10 = &stru_100048E60;
          if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

          }
          v12 = "Not Responding";
          if (a2 == -536870165)
            v12 = "Aborted";
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IOReturn: %s\n"), v12));
          v14 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_retainAutorelease(v10);
            v16 = v14;
            *(_DWORD *)buf = 136446466;
            v21 = -[__CFString UTF8String](v15, "UTF8String");
            v22 = 2114;
            v23 = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          objc_msgSend(v8, "setConnected:", 0);
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (a2 != -536870186)
    {
      v9 = 747;
      goto LABEL_10;
    }
    __ICOSLogCreate();
    v17 = "Pipe Stalled\n";
    if (a2 == -536870186)
      v17 = "Timemout";
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IOReturn: %s\n"), v17));
    v19 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_1000308A4((uint64_t)v18, v19);

    objc_msgSend(v8, "setTimedOut:", 1);
    goto LABEL_23;
  }
LABEL_24:
  objc_autoreleasePoolPop(v6);
}

void sub_10000AAAC(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint8_t v20[4];
  id v21;
  __int16 v22;
  void *v23;
  uint8_t buf[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _WORD v31[13];

  v19 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "usbCore");
  memset(v31, 0, sizeof(v31));
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  qmemcpy(buf, "[null]", sizeof(buf));
  IORegistryEntryGetName(*(_DWORD *)(a1 + 40), (char *)buf);
  __ICOSLogCreate();
  v3 = CFSTR("<USB>");
  v4 = v3;
  if ((unint64_t)-[__CFString length](v3, "length") >= 0x15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v3, "substringWithRange:", 0, 18));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("..")));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<device added> received notification for service: %s"), buf));
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v4);
    v9 = v7;
    v10 = -[__CFString UTF8String](v8, "UTF8String");
    *(_DWORD *)v20 = 136446466;
    v21 = v10;
    v22 = 2114;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v20, 0x16u);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "processDeviceInterface:", *(unsigned int *)(a1 + 40)) & 1) == 0)
  {
    __ICOSLogCreate();
    v11 = v3;
    if ((unint64_t)-[__CFString length](v11, "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v11, "substringWithRange:", 0, 18));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

      v11 = (__CFString *)v13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<not activated> and waiting: %2ds for host connection"), 15));
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v11);
      v17 = v15;
      v18 = -[__CFString UTF8String](v16, "UTF8String");
      *(_DWORD *)v20 = 136446466;
      v21 = v18;
      v22 = 2114;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v20, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "waitForHostConnection:", 1);
  }
}

void sub_10000B6B8(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  NSObject *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;

  v4 = a1;
  if ((int)a3 > -536870656)
  {
    if ((_DWORD)a3 == -536870655)
    {
      __ICOSLogCreate();
      v5 = CFSTR("<USB>");
      if ((unint64_t)-[__CFString length](v5, "length") >= 0x15)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18));
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR("..")));

        v5 = (__CFString *)v28;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("📣 Device Notified: kIOMessageServiceIsAttemptingOpen")));
      v9 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
    }
    else
    {
      if ((_DWORD)a3 != -536870640)
      {
LABEL_28:
        __ICOSLogCreate();
        v5 = CFSTR("<USB>");
        if ((unint64_t)-[__CFString length](v5, "length") >= 0x15)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18));
          v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("..")));

          v5 = (__CFString *)v30;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("📣 Device Notified: 0x%x"), a3));
        v9 = (void *)_gICOSLog;
        if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        goto LABEL_31;
      }
      __ICOSLogCreate();
      v5 = CFSTR("<USB>");
      if ((unint64_t)-[__CFString length](v5, "length") >= 0x15)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

        v5 = (__CFString *)v11;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("📣 Device Notified: kIOMessageServiceWasClosed")));
      v9 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
    }
LABEL_31:
    v31 = objc_retainAutorelease(v5);
    v32 = v9;
    *(_DWORD *)buf = 136446466;
    v34 = -[__CFString UTF8String](v31, "UTF8String");
    v35 = 2114;
    v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_32:
    goto LABEL_33;
  }
  if ((_DWORD)a3 != -536870896)
  {
    if ((_DWORD)a3 == -536870656)
    {
      __ICOSLogCreate();
      v5 = CFSTR("<USB>");
      if ((unint64_t)-[__CFString length](v5, "length") >= 0x15)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18));
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

        v5 = (__CFString *)v7;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("📣 Device Notified: kIOMessageServiceIsRequestingClose")));
      v9 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  __ICOSLogCreate();
  v12 = CFSTR("<USB>");
  v13 = v12;
  if ((unint64_t)-[__CFString length](v12, "length") >= 0x15)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("📣 Device Notified: kIOMessageServiceIsTerminated")));
  v16 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_retainAutorelease(v13);
    v18 = v16;
    *(_DWORD *)buf = 136446466;
    v34 = -[__CFString UTF8String](v17, "UTF8String");
    v35 = 2114;
    v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v19 = v12;
  if ((unint64_t)-[__CFString length](v19, "length") >= 0x15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v19, "substringWithRange:", 0, 18));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

    v19 = (__CFString *)v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device removed: %@"), v4));
  v23 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_retainAutorelease(v19);
    v25 = v23;
    v26 = -[__CFString UTF8String](v24, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v34 = v26;
    v35 = 2114;
    v36 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (v4)
    objc_msgSend(v4, "stop");
LABEL_33:

}

void sub_10000C9C0(void *a1, uint64_t a2, uint64_t a3)
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;

  __ICOSLogCreate();
  v6 = CFSTR("<USB>");
  v7 = v6;
  if ((unint64_t)-[__CFString length](v6, "length") >= 0x15)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<callback> (_StaticDeviceInterfaceMessage)")));
  v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v7);
    v12 = v10;
    *(_DWORD *)buf = 136446466;
    v35 = -[__CFString UTF8String](v11, "UTF8String");
    v36 = 2114;
    v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v13 = objc_autoreleasePoolPush();
  v14 = a1;
  v15 = v14;
  if ((_DWORD)a2 == -469794543)
  {
    objc_msgSend(v14, "deactivate");
    __ICOSLogCreate();
    v16 = v6;
    if ((unint64_t)-[__CFString length](v16, "length") >= 0x15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

      v16 = (__CFString *)v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<deactivated> and waiting: %2ds for reactivation before exiting"), 15));
    v20 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    goto LABEL_21;
  }
  if ((_DWORD)a2 == -469794544)
  {
    if (a3)
    {
      objc_msgSend(v14, "waitForHostConnection:", 0);
      objc_msgSend(v15, "activate:", *(unsigned int *)(a3 + 4));
      goto LABEL_23;
    }
    __ICOSLogCreate();
    v16 = v6;
    if ((unint64_t)-[__CFString length](v16, "length") >= 0x15)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("..")));

      v16 = (__CFString *)v30;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<activated> and waiting: %2ds for host connection"), 15));
    v20 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:

      objc_msgSend(v15, "waitForHostConnection:", 1);
      goto LABEL_23;
    }
LABEL_21:
    v31 = objc_retainAutorelease(v16);
    v32 = v20;
    v33 = -[__CFString UTF8String](v31, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v35 = v33;
    v36 = 2114;
    v37 = v19;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    goto LABEL_22;
  }
  __ICOSLogCreate();
  v21 = v6;
  if ((unint64_t)-[__CFString length](v21, "length") >= 0x15)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v21, "substringWithRange:", 0, 18));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

    v21 = (__CFString *)v23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<alt-setting> received: 0x%x"), a2));
  v25 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_retainAutorelease(v21);
    v27 = v25;
    v28 = -[__CFString UTF8String](v26, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v35 = v28;
    v36 = 2114;
    v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_23:

  objc_autoreleasePoolPop(v13);
}

id sub_10000CE4C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "handleDeviceRequest:data:dataSize:status:", a3, a5, a4);
}

void sub_10000D914(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10000D950()
{
  void *v0;

  return objc_msgSend(v0, "UTF8String");
}

id sub_10000D95C()
{
  void *v0;

  return v0;
}

id sub_10000D964(id a1)
{
  return objc_retainAutorelease(a1);
}

void sub_10000D978(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_10000D990()
{
  if (qword_10005E490 != -1)
    dispatch_once(&qword_10005E490, &stru_1000487E0);
  return (id)qword_10005E458;
}

void sub_10000D9D0(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)PHPTPAssetManager);
  v2 = (void *)qword_10005E458;
  qword_10005E458 = (uint64_t)v1;

}

void sub_10000EA0C(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Vend Photo Storage")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v14 = 136446466;
    v15 = -[__CFString UTF8String](v6, "UTF8String");
    v16 = 2114;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v14, 0x16u);

  }
  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoStorage"));
  LOBYTE(v8) = objc_msgSend(v8, "visibleStorage:", v9);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removePlaceholderStorage");
    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "photoStorage"));
    objc_msgSend(v10, "addStorage:", v11);

    objc_msgSend(*(id *)(a1 + 32), "sendEventDeviceUnlocked");
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "photoStorage"));
    objc_msgSend(v12, "sendEventAddStorageWithID:", objc_msgSend(v13, "storageID"));

  }
}

id sub_10000EF88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContent");
}

void sub_10000EF90(uint64_t a1)
{
  void *v2;
  PTPStorage *v3;
  PTPStorage *v4;
  _QWORD v5[5];
  PTPStorage *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photoStorage"));

  if (!v2)
  {
    v3 = -[PTPStorage initWithParent:andOptionalID:forSessionID:]([PTPStorage alloc], "initWithParent:andOptionalID:forSessionID:", *(_QWORD *)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 32), "currentInternalSessionID"));
    -[PTPStorage addContent](v3, "addContent");
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000F064;
    v5[3] = &unk_100048778;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v4 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  }
}

void sub_10000F064(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  unsigned int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SessionID: 0x%x StorageID: 0x%x \n"), objc_msgSend(*(id *)(a1 + 32), "currentInternalSessionID"), objc_msgSend(*(id *)(a1 + 40), "sessionID")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    *(_DWORD *)buf = 136446466;
    v24 = -[__CFString UTF8String](v6, "UTF8String");
    v25 = 2114;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v8 = objc_msgSend(*(id *)(a1 + 40), "sessionID");
  if (v8 == objc_msgSend(*(id *)(a1 + 32), "currentInternalSessionID"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPhotoStorage:", *(_QWORD *)(a1 + 40));
    __ICOSLogCreate();
    v9 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Whole Storage Available: 0x%x \n"), objc_msgSend(*(id *)(a1 + 40), "storageID")));
    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v9);
      v14 = v12;
      v15 = -[__CFString UTF8String](v13, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v24 = v15;
      v25 = 2114;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    notify_post("com.apple.ptpd.photoStorageChanged");
  }
  else
  {
    __ICOSLogCreate();
    v16 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abandoning Storage: 0x%x \n"), objc_msgSend(*(id *)(a1 + 40), "storageID")));
    v19 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_retainAutorelease(v16);
      v21 = v19;
      v22 = -[__CFString UTF8String](v20, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v24 = v22;
      v25 = 2114;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
}

void sub_10000F580(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F5DC;
  block[3] = &unk_100048750;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000F5DC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "photoStorage"));
  LODWORD(v2) = objc_msgSend(v2, "visibleStorage:", v3);

  if ((_DWORD)v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photoStorage"));
    objc_msgSend(v4, "sendEventRemoveStorageWithID:", objc_msgSend(v5, "storageID"));

    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoStorage"));
    objc_msgSend(v6, "removeStorageWithID:", objc_msgSend(v7, "storageID"));

  }
  objc_msgSend(*(id *)(a1 + 32), "setPhotoStorage:", 0);
  notify_post("com.apple.ptpd.photoStorageChanged");
  return objc_msgSend(*(id *)(a1 + 32), "preparePhotoStorage");
}

void sub_1000118E8(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD block[5];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("==|Session Begin|== Adding Storages")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    *(_DWORD *)buf = 136446466;
    v27 = -[__CFString UTF8String](v6, "UTF8String");
    v28 = 2114;
    v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v8 = sub_10000D990();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)v9;
  if (v9 && (objc_opt_respondsToSelector(v9, "ptpOpenSession") & 1) != 0)
  {
    __ICOSLogCreate();
    v11 = CFSTR("challenge");
    if ((unint64_t)objc_msgSend(CFSTR("challenge"), "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("challenge"), "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("🔐 Host opened new session -- requesting auth challenge")));
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v11);
      v16 = v14;
      v17 = -[__CFString UTF8String](v15, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v27 = v17;
      v28 = 2114;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(v10, "performSelector:", "ptpOpenSession");
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentInternalSessionID:", sub_100004C44());
  v18 = objc_msgSend(*(id *)(a1 + 32), "currentInternalSessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "placeholderStorage"));
  objc_msgSend(v19, "setSessionID:", v18);

  v20 = *(void **)(a1 + 32);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "photoStorage"));
  if ((objc_msgSend(v20, "visibleStorage:", v21) & 1) != 0)
    goto LABEL_15;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allStorages"));
  v23 = objc_msgSend(v22, "count");

  if (!v23)
  {
    v24 = *(void **)(a1 + 32);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "placeholderStorage"));
    objc_msgSend(v24, "addStorage:", v21);
LABEL_15:

  }
  objc_msgSend(*(id *)(a1 + 32), "preparePhotoStorage");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011C50;
  block[3] = &unk_100048750;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100011C50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "provokeSecurityCheck");
}

void sub_100011FD4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentInternalSessionID:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentInternalSessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "placeholderStorage"));
  objc_msgSend(v3, "setSessionID:", v2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photoStorage"));
  objc_msgSend(v4, "setAssetGroupIndex:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storages"));
  objc_msgSend(v5, "removeAllObjects");

}

void sub_100012340(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Session Timeout - Removing Storages")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v9 = 136446466;
    v10 = -[__CFString UTF8String](v6, "UTF8String");
    v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "storageTimer"));
  dispatch_source_cancel(v8);

}

id sub_1000124B4(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timer Invalidated")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v9 = 136446466;
    v10 = -[__CFString UTF8String](v6, "UTF8String");
    v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setStorageTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setStorageTimerQ:", 0);
}

void sub_10001292C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012958(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100012968(uint64_t a1)
{

}

void sub_100012970(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "updateUserAssignedName");

  }
}

void sub_1000149B8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;

  if (a2)
  {
    if (a2 == 2)
    {
      v12 = objc_begin_catch(a1);
      __ICOSLogCreate();
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
      {
        v14 = &stru_100048E60;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

      }
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baseName")));
      objc_msgSend(v15, "UTF8String");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to archive the metadata for %s\n")));

      v17 = (id)_gICOSLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = -[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
        LODWORD(buf) = 136446466;
        *(_QWORD *)((char *)&buf + 4) = v18;
        WORD6(buf) = 2114;
        *(_QWORD *)((char *)&buf + 14) = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
      }

      __ICOSLogCreate();
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
      {
        v20 = &stru_100048E60;
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", CFSTR("..")));

      }
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
      objc_msgSend(v21, "UTF8String");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("This is not fatal, we can proceed %s\n")));

      v23 = (id)_gICOSLog;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = -[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
        LODWORD(buf) = 136446466;
        *(_QWORD *)((char *)&buf + 4) = v24;
        WORD6(buf) = 2114;
        *(_QWORD *)((char *)&buf + 14) = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
      }

      objc_end_catch();
      JUMPOUT(0x100014954);
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_1000154E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100015528(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photoStorage"));
  v5 = objc_msgSend(v4, "addAssets:createdObjects:", v8, v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("addedFiles")));
  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("addedFolders")));
  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v7);

}

void sub_100015A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_100015AEC(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "photoStorage"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deleteAssets:", v4));

  v6 = v9;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("removedFiles")));
    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("removedFolders")));
    if (v8)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObjectsFromArray:", v8);

    v6 = v9;
  }

}

id sub_100015E0C(uint64_t a1)
{
  void *v2;
  void *v3;
  id result;

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 40), "processAddedFiles:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 48);
  if (v3 && objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "processDeletedFiles:", *(_QWORD *)(a1 + 48));
  result = *(id *)(a1 + 56);
  if (result)
  {
    result = objc_msgSend(result, "count");
    if (result)
    {
      objc_msgSend(*(id *)(a1 + 40), "processDeletedFiles:", *(_QWORD *)(a1 + 56));
      result = objc_msgSend(*(id *)(a1 + 40), "processAddedFiles:", *(_QWORD *)(a1 + 56));
    }
  }
  if (*(_QWORD *)(a1 + 64))
    return objc_msgSend(*(id *)(a1 + 40), "processDeletedFiles:");
  return result;
}

void sub_10001922C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100019294(id a1)
{
  +[PTPResponder getFilesystemMediaCountForDirectories:media:nonMedia:](PTPResponder, "getFilesystemMediaCountForDirectories:media:nonMedia:", 0, 0, 0);
}

uint64_t sub_1000192AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000192BC(uint64_t a1)
{

}

void sub_1000192C4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  __int128 v11;
  uint64_t v12;

  v5 = a2;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = v6;
  if (v6 && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent")), v8, v8))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000193C0;
    block[3] = &unk_1000488E8;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v11 = *(_OWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 72);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }

}

void sub_1000193C0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addAssets:createdObjects:", *(_QWORD *)(a1 + 40), 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("assetCount")));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v2, "unsignedLongLongValue");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("folderCount")));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v3, "unsignedLongLongValue");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("prunedCount")));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v4, "unsignedLongLongValue");

}

id sub_100019498(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  NSObject *v28;
  id v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  id v36;
  double v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v4 = "Aborted";
  else
    v4 = "Completed";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("------- [%9s] --------"), v4));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v2);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v48 = -[__CFString UTF8String](v7, "UTF8String");
    v49 = 2114;
    v50 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v9 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%9lu] Asset(s)"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)));
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v9);
    v14 = v12;
    v15 = -[__CFString UTF8String](v13, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v48 = v15;
    v49 = 2114;
    v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v16 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%9llu] Folders(s)"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
  v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v16);
    v21 = v19;
    v22 = -[__CFString UTF8String](v20, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v48 = v22;
    v49 = 2114;
    v50 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v23 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", CFSTR("..")));

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%9llu] Pruned"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)));
  v26 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_retainAutorelease(v23);
    v28 = v26;
    v29 = -[__CFString UTF8String](v27, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v48 = v29;
    v49 = 2114;
    v50 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  *(float *)&dword_10005E468 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005E46C)
                                             * (float)*(unsigned int *)(a1 + 72))
                                     / (float)*(unsigned int *)(a1 + 76))
                             / 1000000.0;
  __ICOSLogCreate();
  v30 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingString:", CFSTR("..")));

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[PHPTPAssetManager ptpEnumerateAllAssetsUsingBlock] spent %5.2f seconds building assets for ptpd storageID :0x%x"), *(float *)&dword_10005E468 / 1000.0, *(unsigned int *)(a1 + 80)));
  v33 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_retainAutorelease(v30);
    v35 = v33;
    v36 = -[__CFString UTF8String](v34, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v48 = v36;
    v49 = 2114;
    v50 = v32;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  LODWORD(v37) = dword_10005E468;
  if (*(float *)&dword_10005E468 > 3000.0)
  {
    __ICOSLogCreate();
    v38 = CFSTR("Photos->ptpd");
    if ((unint64_t)objc_msgSend(CFSTR("Photos->ptpd"), "length") >= 0x15)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Photos->ptpd"), "substringWithRange:", 0, 18));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringByAppendingString:", CFSTR("..")));

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("⚠️  Photos PLPTPDAsset generation time of %5.2f seconds significantly impacts user experience."), *(float *)&dword_10005E468 / 1000.0));
    v41 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_100030914(v38, v41);

    __ICOSLogCreate();
    v42 = CFSTR("Photos->ptpd");
    if ((unint64_t)objc_msgSend(CFSTR("Photos->ptpd"), "length") >= 0x15)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Photos->ptpd"), "substringWithRange:", 0, 18));
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingString:", CFSTR("..")));

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("⚠️  Photos generated [%9lu] Asset(s)"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)));
    v45 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_100030914(v42, v45);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setEnumerated:", 1, v37);
}

void sub_100019E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100019EC0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  PTPFile *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  PTPFolder *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  PTPFile *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _BYTE buf[22];

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    if (qword_10005E460 == 1 && objc_msgSend(v7, "conversionGroup") == (id)1)
      v9 = 0;
    else
      v9 = objc_msgSend(v8, "conversionGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filename"));
    v11 = (PTPFile *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%d"), v10, v9));

    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "captureDateString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "virtualDirectoryName:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getDedupedAssetDirectory:increment:", v14, 0));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "folderMatchingName:", v15));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v19 && objc_msgSend(v19, "fileExists:", v11))
    {
      __ICOSLogCreate();
      v20 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("..")));

      }
      v22 = -[PTPFile UTF8String](objc_retainAutorelease(v11), "UTF8String");
      v23 = objc_retainAutorelease(v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%15s - Exists in %15s"), v22, objc_msgSend(v23, "UTF8String")));
      v25 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_retainAutorelease(v20);
        v27 = v25;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = -[__CFString UTF8String](v26, "UTF8String");
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getDedupedAssetDirectory:increment:", v14, 1));

      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = 0;

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v30 = *(void **)(a1 + 32);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "captureDateString"));
      *(_QWORD *)buf = objc_msgSend(v30, "virtualDirectoryDate:", v31);
      *(_QWORD *)&buf[8] = v32;

      v33 = -[PTPFolder initWithName:captureTimeSpec:parent:storage:]([PTPFolder alloc], "initWithName:captureTimeSpec:parent:storage:", v15, buf, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

      v36 = *(_QWORD *)(a1 + 64);
      if (*(_QWORD *)(*(_QWORD *)(v36 + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 40), "addFolder:");
        objc_msgSend(*(id *)(a1 + 32), "addCameraFolderToIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        if (*(_BYTE *)(a1 + 96))
        {
          v37 = *(void **)(a1 + 48);
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectHandle")));
          objc_msgSend(v37, "addObject:", v38);

        }
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v36 = *(_QWORD *)(a1 + 64);
      }
      v39 = *(_QWORD *)(v36 + 8);
      v41 = *(_QWORD *)(v39 + 40);
      v40 = (id *)(v39 + 40);
      if (!v41)
      {
        objc_storeStrong(v40, *(id *)(a1 + 40));
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        {
          *a4 = 1;

          goto LABEL_29;
        }
      }
    }

  }
  v42 = [PTPFile alloc];
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "supportedFormats"));
  v11 = -[PTPFile initWithPHPTPAsset:supportedFormats:andParent:](v42, "initWithPHPTPAsset:supportedFormats:andParent:", v8, v43, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  if (v11)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFile objectInfoDataset](v11, "objectInfoDataset"));
    v14 = v44;
    if (qword_10005E460 == 1)
    {
      v45 = objc_msgSend(v44, "sequenceNumber");
      if (v45)
      {
        if (v45 == 2)
        {
          v46 = *(_QWORD *)(a1 + 80);
LABEL_28:
          ++*(_QWORD *)(*(_QWORD *)(v46 + 8) + 24);
LABEL_29:

          goto LABEL_30;
        }
        objc_msgSend(v14, "setSequenceNumber:", 0);
      }
    }
    v47 = *(void **)(a1 + 56);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[PTPFile objectHandle](v11, "objectHandle")));
    objc_msgSend(v47, "addObject:", v48);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addFile:", v11);
    objc_msgSend(*(id *)(a1 + 32), "addCameraFileToIndex:", v11);
    v46 = *(_QWORD *)(a1 + 88);
    goto LABEL_28;
  }
LABEL_30:

}

void sub_10001A4D4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "assetHandle"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectMatchingAssetHandle:", v4));

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v5 = v6;
  }

}

void sub_10001AA5C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "parent"));
  objc_msgSend(v2, "generatePTPEventsForAddedObjectGroupInStorage:", objc_msgSend(*(id *)(a1 + 32), "storageID"));

}

__CFString *sub_10001AD6C(int a1)
{
  __CFString *v2;

  if (qword_10005E498 != -1)
    dispatch_once(&qword_10005E498, &stru_1000489A8);
  v2 = CFSTR("-");
  if (a1)
    v2 = CFSTR("+");
  return v2;
}

void sub_10001ADCC(id a1)
{
  NSString *v1;
  id v2;

  v1 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), getenv("TERM"));
  v2 = (id)objc_claimAutoreleasedReturnValue(v1);
  objc_msgSend(v2, "isEqualToString:", CFSTR("vt100"));

}

void sub_10001BA34(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Removing Placeholder Media\n")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v9 = 136446466;
    v10 = -[__CFString UTF8String](v6, "UTF8String");
    v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v8, "removePlaceholderStorage");

}

void sub_10001BB9C(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  __ICOSLogCreate();
  v2 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Vending Photo Media\n")));
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    v9 = 136446466;
    v10 = -[__CFString UTF8String](v6, "UTF8String");
    v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setHasVended:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v8, "vendPhotoStorage");

}

void sub_10001C618(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C630(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001C640(uint64_t a1)
{

}

void sub_10001C648(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "handleProtectionStatusChanged:", 3);

  }
}

void sub_10001C690(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "handleProtectionStatusChanged:", 4);

  }
}

void sub_10001C6D8(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "handleProtectionStatusChanged:", 1);

  }
}

void sub_10001C720(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "handleProtectionStatusChanged:", 0);

  }
}

void sub_10001C768(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "handleInternalSettingsChanged");

  }
}

void sub_10001C7AC(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "handleThrottleChanged");

  }
}

int64_t sub_10001DF14(id a1, ICMediaItemProtocol *a2, ICMediaItemProtocol *a3)
{
  ICMediaItemProtocol *v4;
  id v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = -[ICMediaItemProtocol unsignedIntegerValue](a2, "unsignedIntegerValue");
  v6 = -[ICMediaItemProtocol unsignedIntegerValue](v4, "unsignedIntegerValue");

  v7 = -1;
  if (v6 <= v5)
    v7 = 1;
  if (v6 == v5)
    return 0;
  else
    return v7;
}

int64_t sub_10001E450(id a1, NSNumber *a2, NSNumber *a3)
{
  NSNumber *v4;
  NSUInteger v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = -[NSNumber unsignedIntegerValue](a2, "unsignedIntegerValue");
  v6 = -[NSNumber unsignedIntegerValue](v4, "unsignedIntegerValue");

  v7 = -1;
  if ((unint64_t)v6 <= v5)
    v7 = 1;
  if (v6 == (id)v5)
    return 0;
  else
    return v7;
}

time_t sub_10001F51C(void *a1)
{
  tm v2;

  *(_OWORD *)&v2.tm_isdst = 0u;
  v2.tm_isdst = -1;
  strptime_l((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String", 0, 0, 0, 0, *(_QWORD *)&v2.tm_isdst, 0, 0), "%Y%m%dT%H%M%S.0", &v2, 0);
  return mktime(&v2);
}

uint64_t sub_100020518(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  __int16 v3;

  v2 = *a1 + 2;
  if (v2 <= a2)
  {
    v3 = *(_WORD *)*a1;
    *a1 = v2;
  }
  else
  {
    return 0;
  }
  return v3;
}

_WORD **sub_100020540(_WORD **result, __int16 a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_100020558(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(unsigned __int16 *)*a1;
  *a1 += 2;
  return v1;
}

uint64_t sub_10002056C(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *a1 + 2;
  if (v2 > a2)
    return 0;
  v3 = *(unsigned __int16 *)*a1;
  *a1 = v2;
  return v3;
}

uint64_t sub_100020594(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *a1 + 4;
  if (v2 > a2)
    return 0;
  v3 = *(unsigned int *)*a1;
  *a1 = v2;
  return v3;
}

_DWORD **sub_1000205BC(_DWORD **result, int a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_1000205D4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(unsigned int *)*a1;
  *a1 += 4;
  return v1;
}

uint64_t sub_1000205E8(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *a1 + 8;
  if (v2 > a2)
    return 0;
  v3 = *(_QWORD *)*a1;
  *a1 = v2;
  return v3;
}

_QWORD **sub_100020610(_QWORD **result, uint64_t a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_100020628(_QWORD **a1)
{
  return *(*a1)++;
}

id sub_10002063C(const void **a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(unsigned __int8 *)*a1;
  *a1 = (char *)*a1 + 1;
  if (v1)
  {
    v3 = malloc_type_malloc(2 * v1, 0x8B4C94EFuLL);
    memcpy(v3, *a1, 2 * v1);
    *a1 = (char *)*a1 + 2 * v1;
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v3, (2 * v1 - 2), CFStringConvertEncodingToNSStringEncoding(0x14000100u), 1);
  }
  else
  {
    v4 = objc_msgSend(&stru_100048E60, "copy");
  }
  return v4;
}

id sub_1000206E8(const void **a1, unint64_t a2)
{
  id v3;

  if ((unint64_t)*a1 + *(unsigned __int8 *)*a1 > a2)
    return 0;
  v3 = sub_10002063C(a1);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

void sub_10002071C(_BYTE **a1, void *a2)
{
  unsigned int v3;
  id v4;
  void *v5;
  unsigned int v6;
  _BYTE *v7;
  id v8;
  _BYTE *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "length");
  if (v3)
  {
    v4 = objc_msgSend(v10, "dataUsingEncoding:", CFStringConvertEncodingToNSStringEncoding(0x14000100u));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v3 + 1;
    **a1 = v3 + 1;
    v7 = *a1 + 1;
    *a1 = v7;
    v8 = objc_retainAutorelease(v5);
    memcpy(v7, objc_msgSend(v8, "bytes"), 2 * v3);
    v9 = *a1;
    do
    {
      v9 += 2;
      --v3;
    }
    while (v3);
    *(_WORD *)v9 = 0;
    *a1 += 2 * v6;

  }
  else
  {
    *(*a1)++ = 0;
  }

}

id sub_1000207F8(unsigned __int16 **a1)
{
  int v2;
  id v3;
  unsigned __int16 *v4;
  void *v5;

  v2 = *(_DWORD *)*a1;
  *a1 += 2;
  v3 = objc_alloc_init((Class)NSMutableArray);
  if (v2)
  {
    v4 = *a1;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *v4));
      objc_msgSend(v3, "addObject:", v5);

      v4 = *a1 + 1;
      *a1 = v4;
      --v2;
    }
    while (v2);
  }
  return v3;
}

id sub_100020888(unsigned __int16 **a1, unint64_t a2)
{
  id v3;

  if ((unint64_t)*a1 + (2 * *(_DWORD *)*a1 + 4) > a2)
    return 0;
  v3 = sub_1000207F8(a1);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

void sub_1000208C4(unsigned __int16 **a1, void *a2)
{
  unsigned int v3;
  unsigned __int16 *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int16 v8;
  unsigned __int16 *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "count");
  v4 = *a1;
  *(_DWORD *)v4 = v3;
  *a1 = v4 + 2;
  if (v3)
  {
    v5 = 0;
    v6 = v3;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v5));
      v8 = (unsigned __int16)objc_msgSend(v7, "unsignedShortValue");

      v9 = *a1;
      *v9 = v8;
      *a1 = v9 + 1;
      ++v5;
    }
    while (v6 != v5);
  }

}

void sub_100020958(unsigned int **a1, void *a2)
{
  unsigned int v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unsigned int *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "count");
  v4 = *a1;
  *v4 = v3;
  *a1 = v4 + 1;
  if (v3)
  {
    v5 = 0;
    v6 = v3;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v5));
      v8 = objc_msgSend(v7, "unsignedIntValue");

      v9 = *a1;
      *v9 = v8;
      *a1 = v9 + 1;
      ++v5;
    }
    while (v6 != v5);
  }

}

__CFString *sub_1000209EC(uint64_t a1)
{
  __CFString *result;
  __CFString *v3;
  NSString *v4;

  if ((int)a1 <= 37120)
  {
    switch((int)a1)
    {
      case 36865:
        result = CFSTR("PTPOperationCodeGetNumDownloadableObjects_Apple");
        break;
      case 36866:
        result = CFSTR("PTPOperationCodeGetAllObjectInfo32_Apple");
        break;
      case 36867:
        result = CFSTR("PTPOperationCodeGetUserAssignedDeviceName_Apple");
        break;
      case 36868:
        result = CFSTR("PTPOperationCodeAllowKeepAwake_Apple");
        break;
      case 36869:
        result = CFSTR("PTPOperationCodeGetAllObjectInfo64_Apple");
        break;
      case 36870:
        result = CFSTR("PTPOperationCodeGetObjectCompressedSize64_Apple");
        break;
      case 36871:
        result = CFSTR("PTPOperationCodeGetPartialObject64_Apple");
        break;
      case 36872:
        result = CFSTR("Canon_InitiateReleaseControl");
        break;
      case 36873:
        result = CFSTR("PTPOperationCodeGetObjectMetadata_Apple");
        break;
      case 36874:
        result = CFSTR("PTPOperationCodeGetMD5PartialObject64_Apple");
        break;
      case 36875:
        result = CFSTR("PTPOperationCodeSetMediaCapabilities");
        break;
      case 36876:
        result = CFSTR("PTPOperationCodeGetAdjustedThumb_Apple");
        break;
      case 36877:
        result = CFSTR("PTPOperationCodeGetPartialAssetData_Apple");
        break;
      case 36878:
        result = CFSTR("PTPOperationCodeSetHostSupportedFormats_Apple");
        break;
      case 36879:
        result = CFSTR("PTPOperationCodeGetObjectInfosForNextGroup_Apple");
        break;
      case 36880:
        result = CFSTR("PTPOperationCodeSetHostSupportsGroups_Apple");
        break;
      case 36881:
        result = CFSTR("Canon_SetCustomizeData");
        break;
      case 36882:
        result = CFSTR("Canon_GetCaptureStatus");
        break;
      case 36883:
        result = CFSTR("Canon_CheckEvent");
        break;
      case 36884:
        result = CFSTR("Canon_FocusLock");
        break;
      case 36885:
        result = CFSTR("Canon_FocusUnlock");
        break;
      case 36886:
        result = CFSTR("Canon_GetLocalReleaseParam");
        break;
      case 36887:
        result = CFSTR("Canon_SetLocalReleaseParam");
        break;
      case 36888:
        result = CFSTR("Canon_AskAboutPcEvf");
        break;
      case 36889:
LABEL_19:
        result = CFSTR("Canon_SendPartialObject");
        break;
      case 36890:
        result = CFSTR("Canon_InitiateCaptureInMemory");
        break;
      case 36891:
LABEL_49:
        result = CFSTR("Canon_GetPartialObjectEx");
        break;
      case 36892:
LABEL_22:
        result = CFSTR("Canon_SetObjectTime");
        break;
      case 36893:
        result = CFSTR("Canon_GetViewfinderImage");
        break;
      case 36894:
        result = CFSTR("Canon_GetObjectAttributes");
        break;
      case 36895:
        result = CFSTR("Canon_ChangeUSBProtocol");
        break;
      case 36896:
        result = CFSTR("Canon_GetChanges");
        break;
      case 36897:
LABEL_10:
        result = CFSTR("Canon_GetObjectInfoEx");
        break;
      case 36898:
        result = CFSTR("Canon_InitiateDirectTransfer");
        break;
      case 36899:
        result = CFSTR("Canon_TerminateDirectTransfer");
        break;
      case 36900:
        result = CFSTR("Canon_SendObjectInfoByPath");
        break;
      case 36901:
        result = CFSTR("Canon_SendObjectByPath");
        break;
      case 36902:
        result = CFSTR("Canon_InitiateDirectTansferEx");
        break;
      case 36903:
        result = CFSTR("Canon_GetAncillaryObjectHandles");
        break;
      case 36904:
        result = CFSTR("Canon_GetTreeInfo");
        break;
      case 36905:
        result = CFSTR("Canon_GetTreeSize");
        break;
      case 36906:
        result = CFSTR("Canon_NotifyProgress");
        break;
      case 36907:
        result = CFSTR("Canon_NotifyCancelAccepted");
        break;
      case 36908:
        result = CFSTR("Canon_902C");
        break;
      case 36909:
        result = CFSTR("Canon_GetDirectory");
        break;
      case 36910:
        result = CFSTR("Canon_902E");
        break;
      case 36911:
        result = CFSTR("Canon_902F");
        break;
      case 36912:
        result = CFSTR("Canon_SetPairingInfo");
        break;
      case 36913:
        result = CFSTR("Canon_GetPairingInfo");
        break;
      case 36914:
        result = CFSTR("Canon_DeletePairingInfo");
        break;
      case 36915:
        result = CFSTR("Canon_GetMACAddress");
        break;
      case 36916:
        result = CFSTR("Canon_SetDisplayMonitor");
        break;
      case 36917:
        result = CFSTR("Canon_PairingComplete");
        break;
      case 36918:
        result = CFSTR("Canon_GetWirelessMAXChannel");
        break;
      case 36919:
      case 36920:
      case 36921:
      case 36922:
      case 36923:
      case 36924:
      case 36925:
      case 36926:
      case 36927:
      case 36928:
      case 36929:
      case 36930:
      case 36931:
      case 36932:
      case 36933:
      case 36934:
      case 36935:
      case 36936:
      case 36937:
      case 36938:
      case 36939:
      case 36940:
      case 36941:
      case 36942:
      case 36943:
      case 36944:
      case 36945:
      case 36946:
      case 36947:
      case 36948:
      case 36949:
      case 36950:
      case 36951:
      case 36952:
      case 36953:
      case 36954:
      case 36955:
      case 36956:
      case 36957:
      case 36958:
      case 36959:
      case 36960:
      case 36961:
      case 36962:
      case 36963:
      case 36964:
      case 36965:
      case 36966:
      case 36967:
      case 36974:
      case 36976:
      case 36977:
      case 36978:
      case 36979:
      case 36980:
      case 36986:
      case 36987:
      case 36988:
      case 36989:
      case 36990:
      case 36991:
      case 36992:
      case 36993:
      case 36994:
      case 36995:
      case 36996:
      case 36997:
LABEL_214:
        if ((a1 & 0xF000) == 0x9000)
        {
          v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPOperationCodeVendorDefined (0x%04X)"), a1);
        }
        else if ((a1 & 0xF000) == 0x1000)
        {
          v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPOperationCodeReserved (0x%04X)"), a1);
        }
        else
        {
          v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
        }
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
LABEL_220:
        result = v3;
        break;
      case 36968:
        result = CFSTR("Canon_GetWebServiceSpec");
        break;
      case 36969:
        result = CFSTR("Canon_GetWebServiceData");
        break;
      case 36970:
        result = CFSTR("Canon_SetWebServiceData");
        break;
      case 36971:
        result = CFSTR("Canon_DeleteWebServiceData");
        break;
      case 36972:
        result = CFSTR("Canon_GetRootCertificateSpec");
        break;
      case 36973:
        result = CFSTR("Canon_GetRootCertificateData");
        break;
      case 36975:
        result = CFSTR("Canon_SetRootCertificateData");
        break;
      case 36981:
        result = CFSTR("Canon_GetGpsMobilelinkObjectInfo");
        break;
      case 36982:
        result = CFSTR("Canon_SendGpsTagInfo");
        break;
      case 36983:
        result = CFSTR("Canon_GetTranscodeApproxSize");
        break;
      case 36984:
        result = CFSTR("Canon_RequestTranscodeStart");
        break;
      case 36985:
        result = CFSTR("Canon_RequestTranscodeCancel");
        break;
      case 36998:
        result = CFSTR("Canon_SetRemoteShootingMode");
        break;
      default:
        v3 = CFSTR("PTPOperationCodeUndefined");
        switch((int)a1)
        {
          case 4096:
            goto LABEL_220;
          case 4097:
            result = CFSTR("PTPOperationCodeGetDeviceInfo");
            break;
          case 4098:
            result = CFSTR("PTPOperationCodeOpenSession");
            break;
          case 4099:
            result = CFSTR("PTPOperationCodeCloseSession");
            break;
          case 4100:
            result = CFSTR("PTPOperationCodeGetStorageIDs");
            break;
          case 4101:
            result = CFSTR("PTPOperationCodeGetStorageInfo");
            break;
          case 4102:
            result = CFSTR("PTPOperationCodeGetNumObjects");
            break;
          case 4103:
            result = CFSTR("PTPOperationCodeGetObjectHandles");
            break;
          case 4104:
            result = CFSTR("PTPOperationCodeGetObjectInfo");
            break;
          case 4105:
            result = CFSTR("PTPOperationCodeGetObject");
            break;
          case 4106:
            result = CFSTR("PTPOperationCodeGetThumb");
            break;
          case 4107:
            result = CFSTR("PTPOperationCodeDeleteObject");
            break;
          case 4108:
            result = CFSTR("PTPOperationCodeSendObjectInfo");
            break;
          case 4109:
            result = CFSTR("PTPOperationCodeSendObject");
            break;
          case 4110:
            result = CFSTR("PTPOperationCodeInitiateCapture");
            break;
          case 4111:
            result = CFSTR("PTPOperationCodeFormatStore");
            break;
          case 4112:
            result = CFSTR("PTPOperationCodeResetDevice");
            break;
          case 4113:
            result = CFSTR("PTPOperationCodeSelfTest");
            break;
          case 4114:
            result = CFSTR("PTPOperationCodeSetObjectProtection");
            break;
          case 4115:
            result = CFSTR("PTPOperationCodePowerDown");
            break;
          case 4116:
            result = CFSTR("PTPOperationCodeGetDevicePropDesc");
            break;
          case 4117:
            result = CFSTR("PTPOperationCodeGetDevicePropValue");
            break;
          case 4118:
            result = CFSTR("PTPOperationCodeSetDevicePropValue");
            break;
          case 4119:
            result = CFSTR("PTPOperationCodeResetDevicePropValue");
            break;
          case 4120:
            result = CFSTR("PTPOperationCodeTerminateOpenCapture");
            break;
          case 4121:
            result = CFSTR("PTPOperationCodeMoveObject");
            break;
          case 4122:
            result = CFSTR("PTPOperationCodeCopyObject");
            break;
          case 4123:
            result = CFSTR("PTPOperationCodeGetPartialObject");
            break;
          case 4124:
            result = CFSTR("PTPOperationCodeInitiateOpenCapture");
            break;
          case 4131:
            result = CFSTR("PTPOperationCodeGetFilesystemManifest");
            break;
          default:
            goto LABEL_214;
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 37121:
        result = CFSTR("Canon_GetStorageIDs");
        break;
      case 37122:
        result = CFSTR("Canon_GetStorageInfo");
        break;
      case 37123:
        result = CFSTR("Canon_GetObjectInfo");
        break;
      case 37124:
        result = CFSTR("Canon_GetObject");
        break;
      case 37125:
        result = CFSTR("Canon_DeleteObject");
        break;
      case 37126:
        result = CFSTR("Canon_FormatStore");
        break;
      case 37127:
        result = CFSTR("Canon_GetPartialObject");
        break;
      case 37128:
        result = CFSTR("Canon_GetDeviceInfoEx");
        break;
      case 37129:
        goto LABEL_10;
      case 37130:
        result = CFSTR("Canon_GetThumbEx");
        break;
      case 37131:
        goto LABEL_19;
      case 37132:
        result = CFSTR("Canon_SetObjectAttributes");
        break;
      case 37133:
        result = CFSTR("Canon_GetObjectTime");
        break;
      case 37134:
        goto LABEL_22;
      case 37135:
        result = CFSTR("Canon_RemoteRelease");
        break;
      case 37136:
        result = CFSTR("Canon_SetDevicePropValueEx");
        break;
      case 37137:
      case 37138:
      case 37156:
      case 37165:
      case 37166:
      case 37167:
      case 37198:
      case 37214:
      case 37215:
      case 37217:
      case 37218:
      case 37219:
      case 37220:
      case 37221:
      case 37222:
      case 37223:
      case 37224:
      case 37225:
      case 37226:
      case 37229:
      case 37238:
      case 37240:
      case 37241:
      case 37242:
      case 37243:
      case 37244:
      case 37245:
      case 37246:
      case 37247:
      case 37248:
      case 37249:
      case 37254:
      case 37255:
      case 37256:
      case 37257:
      case 37258:
      case 37259:
      case 37260:
      case 37261:
      case 37262:
      case 37263:
      case 37264:
      case 37265:
      case 37266:
      case 37267:
      case 37268:
      case 37269:
      case 37270:
      case 37271:
      case 37272:
      case 37273:
      case 37274:
      case 37275:
      case 37276:
      case 37277:
      case 37278:
      case 37279:
      case 37280:
      case 37281:
      case 37282:
      case 37283:
      case 37284:
      case 37285:
      case 37286:
      case 37287:
      case 37288:
      case 37289:
      case 37290:
      case 37292:
      case 37293:
      case 37294:
      case 37295:
      case 37296:
      case 37297:
      case 37298:
      case 37299:
      case 37300:
      case 37301:
      case 37302:
      case 37303:
      case 37304:
      case 37306:
      case 37307:
      case 37308:
      case 37309:
      case 37312:
      case 37313:
      case 37314:
      case 37315:
      case 37316:
      case 37317:
      case 37318:
      case 37319:
      case 37320:
      case 37321:
      case 37322:
      case 37323:
      case 37324:
      case 37325:
      case 37326:
      case 37327:
      case 37328:
      case 37329:
      case 37330:
      case 37331:
      case 37332:
      case 37333:
      case 37334:
      case 37335:
      case 37336:
      case 37337:
      case 37338:
      case 37339:
      case 37340:
      case 37341:
      case 37342:
      case 37343:
      case 37344:
      case 37345:
      case 37346:
      case 37347:
      case 37348:
      case 37349:
      case 37350:
      case 37351:
      case 37354:
      case 37355:
      case 37356:
      case 37357:
      case 37358:
      case 37359:
      case 37362:
      case 37363:
      case 37364:
      case 37365:
      case 37366:
      case 37367:
      case 37368:
      case 37369:
      case 37370:
      case 37371:
      case 37372:
      case 37373:
        goto LABEL_214;
      case 37139:
        result = CFSTR("Canon_GetRemoteMode");
        break;
      case 37140:
        result = CFSTR("Canon_SetRemoteMode");
        break;
      case 37141:
        result = CFSTR("Canon_SetEventMode");
        break;
      case 37142:
        result = CFSTR("Canon_GetEvent");
        break;
      case 37143:
        result = CFSTR("Canon_TransferComplete");
        break;
      case 37144:
        result = CFSTR("Canon_CancelTransfer");
        break;
      case 37145:
        result = CFSTR("Canon_ResetTransfer");
        break;
      case 37146:
        result = CFSTR("Canon_PCHDDCapacity");
        break;
      case 37147:
        result = CFSTR("Canon_SetUILock");
        break;
      case 37148:
        result = CFSTR("Canon_ResetUILock");
        break;
      case 37149:
        result = CFSTR("Canon_KeepDeviceOn");
        break;
      case 37150:
        result = CFSTR("Canon_SetNullPacketMode");
        break;
      case 37151:
        result = CFSTR("Canon_UpdateFirmware");
        break;
      case 37152:
        result = CFSTR("Canon_TransferCompleteDT");
        break;
      case 37153:
        result = CFSTR("Canon_CancelTransferDT");
        break;
      case 37154:
        result = CFSTR("Canon_SetWftProfile");
        break;
      case 37155:
        result = CFSTR("Canon_GetWftProfile");
        break;
      case 37157:
        result = CFSTR("Canon_BulbStart");
        break;
      case 37158:
        result = CFSTR("Canon_BulbEnd");
        break;
      case 37159:
        result = CFSTR("Canon_RequestDevicePropValue");
        break;
      case 37160:
        result = CFSTR("Canon_RemoteReleaseOn");
        break;
      case 37161:
        result = CFSTR("Canon_RemoteReleaseOff");
        break;
      case 37162:
        result = CFSTR("Canon_RegistBackgroundImage");
        break;
      case 37163:
        result = CFSTR("Canon_ChangePhotoStudioMode");
        break;
      case 37164:
        goto LABEL_49;
      case 37168:
        result = CFSTR("Canon_ResetMirrorLockupState");
        break;
      case 37169:
        result = CFSTR("Canon_PopupBuiltinFlash");
        break;
      case 37170:
        result = CFSTR("Canon_EndGetPartialObjectEx");
        break;
      case 37171:
        result = CFSTR("Canon_MovieSelectSWOn");
        break;
      case 37172:
        result = CFSTR("Canon_MovieSelectSWOff");
        break;
      case 37173:
        result = CFSTR("Canon_GetCTGInfo");
        break;
      case 37174:
        result = CFSTR("Canon_GetLensAdjust");
        break;
      case 37175:
        result = CFSTR("Canon_SetLensAdjust");
        break;
      case 37176:
        result = CFSTR("Canon_ReadyToSendMusic");
        break;
      case 37177:
        result = CFSTR("Canon_CreateHandle");
        break;
      case 37178:
        result = CFSTR("Canon_SendPartialObjectEx");
        break;
      case 37179:
        result = CFSTR("Canon_EndSendPartialObjectEx");
        break;
      case 37180:
        result = CFSTR("Canon_SetCTGInfo");
        break;
      case 37181:
        result = CFSTR("Canon_SetRequestOLCInfoGroup");
        break;
      case 37182:
        result = CFSTR("Canon_SetRequestRollingPitchingLevel");
        break;
      case 37183:
        result = CFSTR("Canon_GetCameraSupport");
        break;
      case 37184:
        result = CFSTR("Canon_SetRating");
        break;
      case 37185:
        result = CFSTR("Canon_RequestInnerDevelopStart");
        break;
      case 37186:
        result = CFSTR("Canon_RequestInnerDevelopParamChange");
        break;
      case 37187:
        result = CFSTR("Canon_RequestInnerDevelopEnd");
        break;
      case 37188:
        result = CFSTR("Canon_GpsLoggingDataMode");
        break;
      case 37189:
        result = CFSTR("Canon_GetGpsLogCurrentHandle");
        break;
      case 37190:
        result = CFSTR("Canon_SetImageRecoveryData");
        break;
      case 37191:
        result = CFSTR("Canon_GetImageRecoveryList");
        break;
      case 37192:
        result = CFSTR("Canon_FormatImageRecoveryData");
        break;
      case 37193:
        result = CFSTR("Canon_GetPresetLensAdjustParam");
        break;
      case 37194:
        result = CFSTR("Canon_GetRawDispImage");
        break;
      case 37195:
        result = CFSTR("Canon_SaveImageRecoveryData");
        break;
      case 37196:
        result = CFSTR("Canon_RequestBLE");
        break;
      case 37197:
        result = CFSTR("Canon_DrivePowerZoom");
        break;
      case 37199:
        result = CFSTR("Canon_GetIptcData");
        break;
      case 37200:
        result = CFSTR("Canon_SetIptcData");
        break;
      case 37201:
        result = CFSTR("Canon_InitiateViewfinder");
        break;
      case 37202:
        result = CFSTR("Canon_TerminateViewfinder");
        break;
      case 37203:
        result = CFSTR("Canon_GetViewFinderData");
        break;
      case 37204:
        result = CFSTR("Canon_DoAf");
        break;
      case 37205:
        result = CFSTR("Canon_DriveLens");
        break;
      case 37206:
        result = CFSTR("Canon_DepthOfFieldPreview");
        break;
      case 37207:
        result = CFSTR("Canon_ClickWB");
        break;
      case 37208:
        result = CFSTR("Canon_Zoom");
        break;
      case 37209:
        result = CFSTR("Canon_ZoomPosition");
        break;
      case 37210:
        result = CFSTR("Canon_SetLiveAfFrame");
        break;
      case 37211:
        result = CFSTR("Canon_TouchAfPosition");
        break;
      case 37212:
        result = CFSTR("Canon_SetLvPcFlavoreditMode");
        break;
      case 37213:
        result = CFSTR("Canon_SetLvPcFlavoreditParam");
        break;
      case 37216:
        result = CFSTR("Canon_AfCancel");
        break;
      case 37227:
        result = CFSTR("Canon_SetImageRecoveryDataEx");
        break;
      case 37228:
        result = CFSTR("Canon_GetImageRecoveryListEx");
        break;
      case 37230:
        result = CFSTR("Canon_NotifyAutoTransferStatus");
        break;
      case 37231:
        result = CFSTR("Canon_GetReducedObject");
        break;
      case 37232:
        result = CFSTR("Canon_GetObjectInfo64");
        break;
      case 37233:
        result = CFSTR("Canon_GetObject64");
        break;
      case 37234:
        result = CFSTR("Canon_GetPartialObject64");
        break;
      case 37235:
        result = CFSTR("Canon_GetObjectInfoEx64");
        break;
      case 37236:
        result = CFSTR("Canon_GetPartialObjectEX64");
        break;
      case 37237:
        result = CFSTR("Canon_CreateHandle64");
        break;
      case 37239:
        result = CFSTR("Canon_NotifySaveComplete");
        break;
      case 37250:
        result = CFSTR("Canon_NotifyEstimateNumberofImport");
        break;
      case 37251:
        result = CFSTR("Canon_NotifyNumberofImported");
        break;
      case 37252:
        result = CFSTR("Canon_NotifySizeOfPartialDataTransfer");
        break;
      case 37253:
        result = CFSTR("Canon_NotifyFinish");
        break;
      case 37291:
        result = CFSTR("Canon_GetObjectURL");
        break;
      case 37305:
        result = CFSTR("Canon_SetFELock");
        break;
      case 37310:
        result = CFSTR("Canon_SetDefaultCameraSetting");
        break;
      case 37311:
        result = CFSTR("Canon_GetAEData");
        break;
      case 37352:
        result = CFSTR("Canon_NotifyNetworkError");
        break;
      case 37353:
        result = CFSTR("Canon_AdapterTransferProgress");
        break;
      case 37360:
        result = CFSTR("Canon_TransferCompleteFTP");
        break;
      case 37361:
        result = CFSTR("Canon_CancelTransferFTP");
        break;
      case 37374:
        result = CFSTR("Canon_FAPIMessageTX");
        break;
      case 37375:
        result = CFSTR("Canon_FAPIMessageRX");
        break;
      default:
        switch((int)a1)
        {
          case 38913:
            result = CFSTR("MTPGetObjectPropsSupported");
            break;
          case 38914:
            result = CFSTR("MTPGetObjectPropDesc");
            break;
          case 38915:
            result = CFSTR("MTPGetObjectPropValue");
            break;
          case 38917:
            result = CFSTR("MTPGetObjectPropList");
            break;
          default:
            goto LABEL_214;
        }
        break;
    }
  }
  return result;
}

__CFString *sub_1000214FC(uint64_t a1)
{
  NSString *v2;

  if ((a1 - 0x2000) < 0x21)
    return off_100048A48[(__int16)(a1 - 0x2000)];
  if ((a1 & 0xF000) == 0xA000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPResponseCodeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) == 0x2000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPResponseCodeReserved (0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

__CFString *sub_100021598(int a1)
{
  int v1;
  __CFString *v2;
  __CFString *result;
  NSString *v4;

  v1 = a1 - 0x4000;
  v2 = CFSTR("PTPEventCodeUndefined");
  switch(v1)
  {
    case 0:
LABEL_28:
      result = v2;
      break;
    case 1:
      result = CFSTR("PTPEventCodeCancelTransaction");
      break;
    case 2:
      result = CFSTR("PTPEventCodeObjectAdded");
      break;
    case 3:
      result = CFSTR("PTPEventCodeObjectRemoved");
      break;
    case 4:
      result = CFSTR("PTPEventCodeStoreAdded");
      break;
    case 5:
      result = CFSTR("PTPEventCodeStoreRemoved");
      break;
    case 6:
      result = CFSTR("PTPEventCodeDevicePropChanged");
      break;
    case 7:
      result = CFSTR("PTPEventCodeObjectInfoChanged");
      break;
    case 8:
      result = CFSTR("PTPEventCodeDeviceInfoChanged");
      break;
    case 9:
      result = CFSTR("PTPEventCodeRequestObjectTransfer");
      break;
    case 10:
      result = CFSTR("PTPEventCodeStoreFull");
      break;
    case 11:
      result = CFSTR("PTPEventCodeDeviceReset");
      break;
    case 12:
      result = CFSTR("PTPEventCodeStorageInfoChanged");
      break;
    case 13:
      result = CFSTR("PTPEventCodeCaptureComplete");
      break;
    case 14:
      result = CFSTR("PTPEventCodeUnreportedStatus");
      break;
    default:
      switch(CFSTR("PTPEventCodeUndefined"))
      {
        case 0xC001u:
          result = CFSTR("PTPEventCodeAppleDeviceUnlocked");
          break;
        case 0xC002u:
          result = CFSTR("PTPEventCodeAppleUserAssignedNameChanged");
          break;
        case 0xC003u:
          result = CFSTR("PTPEventCodeAppleRestartSession");
          break;
        case 0xC004u:
          result = CFSTR("PTPEventCodeAppleGroupAdded");
          break;
        case 0xC005u:
          result = CFSTR("PTPEventCodeAppleGroupEnumerationFinished");
          break;
        default:
          if (((unint64_t)CFSTR("PTPEventCodeUndefined") & 0xF000) == 0xC000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPEventCodeVendorDefined (0x%04X)"), CFSTR("PTPEventCodeUndefined"));
          }
          else if (((unint64_t)CFSTR("PTPEventCodeUndefined") & 0xF000) == 0x4000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPEventCodeReserved (0x%04X)"), CFSTR("PTPEventCodeUndefined"));
          }
          else
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), CFSTR("PTPEventCodeUndefined"));
          }
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
          goto LABEL_28;
      }
      break;
  }
  return result;
}

__CFString *sub_10002174C(uint64_t a1)
{
  NSString *v2;

  if ((unsigned __int16)(a1 - 20480) < 0x20u)
    return off_100048B50[(__int16)(a1 - 20480)];
  if ((a1 & 0xF000) == 0xD000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDevicePropCodeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) == 0x5000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPDevicePropCodeReserved (0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

__CFString *sub_1000217EC(unsigned int a1)
{
  if (a1 >= 5)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPStorageTypeReserved (0x%04X)"), a1));
  else
    return off_100048C50[(__int16)a1];
}

__CFString *sub_100021844(uint64_t a1)
{
  NSString *v2;

  if (a1 < 4)
    return off_100048C78[(__int16)a1];
  if ((a1 & 0xF000) == 0x8000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPFilesystemTypeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) != 0)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPFilesystemTypeReserved (0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

__CFString *sub_1000218D8(unsigned int a1)
{
  if (a1 >= 3)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPAccessCapabilityReserved (0x%04X)"), a1));
  else
    return off_100048C98[(__int16)a1];
}

__CFString *sub_100021930(unsigned int a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("PTPProtectionStatusNoProtection");
  if (a1 == 1)
    v1 = CFSTR("PTPProtectionStatusReadOnly");
  else
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPProtectionStatusReserved (0x%04X)"), a1));
  return v1;
}

__CFString *sub_100021990(int a1)
{
  __CFString *result;
  int v2;
  __CFString *v3;
  NSString *v4;

  switch(a1)
  {
    case 14336:
      result = CFSTR("PTPObjectFormatCodeUnknownImageObject");
      break;
    case 14337:
      result = CFSTR("PTPObjectFormatCodeEXIF_JPEG");
      break;
    case 14338:
      result = CFSTR("PTPObjectFormatCodeTIFF_EP");
      break;
    case 14339:
      result = CFSTR("PTPObjectFormatCodeFlashPix");
      break;
    case 14340:
      result = CFSTR("PTPObjectFormatCodeBMP");
      break;
    case 14341:
      result = CFSTR("PTPObjectFormatCodeCIFF");
      break;
    case 14342:
      result = CFSTR("PTPObjectFormatCodeReserved1");
      break;
    case 14343:
      result = CFSTR("PTPObjectFormatCodeGIF");
      break;
    case 14344:
      result = CFSTR("PTPObjectFormatCodeJFIF");
      break;
    case 14345:
      result = CFSTR("PTPObjectFormatCodePCD");
      break;
    case 14346:
      result = CFSTR("PTPObjectFormatCodePICT");
      break;
    case 14347:
      result = CFSTR("PTPObjectFormatCodePNG");
      break;
    case 14348:
      result = CFSTR("PTPObjectFormatCodeReserved2");
      break;
    case 14349:
      result = CFSTR("PTPObjectFormatCodeTIFF");
      break;
    case 14350:
      result = CFSTR("PTPObjectFormatCodeTIFF_IT");
      break;
    case 14351:
      result = CFSTR("PTPObjectFormatCodeJP2");
      break;
    case 14352:
      result = CFSTR("PTPObjectFormatCodeJPX");
      break;
    default:
      v2 = a1 - 12288;
      v3 = CFSTR("PTPObjectFormatCodeUndefinedNonImageObject");
      switch(v2)
      {
        case 0:
          goto LABEL_40;
        case 1:
          result = CFSTR("PTPObjectFormatCodeAssociation");
          break;
        case 2:
          result = CFSTR("PTPObjectFormatCodeScript");
          break;
        case 3:
          result = CFSTR("PTPObjectFormatCodeExecutable");
          break;
        case 4:
          result = CFSTR("PTPObjectFormatCodeText");
          break;
        case 5:
          result = CFSTR("PTPObjectFormatCodeHTML");
          break;
        case 6:
          result = CFSTR("PTPObjectFormatCodeDPOF");
          break;
        case 7:
          result = CFSTR("PTPObjectFormatCodeAIFF");
          break;
        case 8:
          result = CFSTR("PTPObjectFormatCodeWAV");
          break;
        case 9:
          result = CFSTR("PTPObjectFormatCodeMP3");
          break;
        case 10:
          result = CFSTR("PTPObjectFormatCodeAVI");
          break;
        case 11:
          result = CFSTR("PTPObjectFormatCodeMPEG");
          break;
        case 12:
          result = CFSTR("PTPObjectFormatCodeASF");
          break;
        case 13:
          result = CFSTR("PTPObjectFormatCodeMOV");
          break;
        case 14:
          result = CFSTR("PTPObjectFormatCodeXML");
          break;
        default:
          if (((unint64_t)CFSTR("PTPObjectFormatCodeUndefinedNonImageObject") & 0xF000) == 0xB000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPObjectFormatCodeVendorDefined (0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          else if (((unint64_t)CFSTR("PTPObjectFormatCodeUndefinedNonImageObject") & 0xF000) == 0x3000)
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPObjectFormatCodeReservedForFuture (0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          else
          {
            v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), CFSTR("PTPObjectFormatCodeUndefinedNonImageObject"));
          }
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
LABEL_40:
          result = v3;
          break;
      }
      break;
  }
  return result;
}

__CFString *sub_100021BD4(uint64_t a1)
{
  NSString *v2;

  if (a1 < 8)
    return off_100048CB0[(__int16)a1];
  if ((a1 & 0xF000) == 0x8000)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPAssociationTypeVendorDefined (0x%04X)"), a1);
  }
  else if ((a1 & 0xF000) != 0)
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%04X)"), a1);
  }
  else
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPAssociationTypeReserved (0x%04X)"), a1);
  }
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

uint64_t sub_100021C68()
{
  int v0;
  uint64_t result;

  v0 = *__error();
  if (v0 > 28)
  {
    switch(v0)
    {
      case '6':
        result = fprintf(__stderrp, "Error 'ECONNRESET' (%d) occurred in '%s'.\n");
        break;
      case '7':
        result = fprintf(__stderrp, "Error 'ENOBUFS' (%d) occurred in '%s'.\n");
        break;
      case '8':
      case ':':
      case ';':
        goto LABEL_20;
      case '9':
        result = fprintf(__stderrp, "Error 'ENOTCONN' (%d) occurred in '%s'.\n");
        break;
      case '<':
        result = fprintf(__stderrp, "Error 'ETIMEDOUT' (%d) occurred in '%s'.\n");
        break;
      default:
        if (v0 == 29)
        {
          result = fprintf(__stderrp, "Error 'ESPIPE' (%d) occurred in '%s'.\n");
        }
        else if (v0 == 35)
        {
          result = fprintf(__stderrp, "Error 'EAGAIN' (%d) occurred in '%s'.\n");
        }
        else
        {
LABEL_20:
          result = fprintf(__stderrp, "Error %d occurred in '%s'.\n");
        }
        break;
    }
  }
  else
  {
    switch(v0)
    {
      case 4:
        result = fprintf(__stderrp, "Error 'EINTR' (%d) occurred in '%s'.\n");
        break;
      case 5:
        result = fprintf(__stderrp, "Error 'EIO' (%d) occurred in '%s'.\n");
        break;
      case 6:
        result = fprintf(__stderrp, "Error 'ENXIO' (%d) occurred in '%s'.\n");
        break;
      case 9:
        result = fprintf(__stderrp, "Error 'EBADF' (%d) occurred in '%s'.\n");
        break;
      case 12:
        result = fprintf(__stderrp, "Error 'ENOMEM' (%d) occurred in '%s'.\n");
        break;
      case 14:
        result = fprintf(__stderrp, "Error 'EFAULT' (%d) occurred in '%s'.\n");
        break;
      case 21:
        result = fprintf(__stderrp, "Error 'EISDIR' (%d) occurred in '%s'.\n");
        break;
      case 22:
        result = fprintf(__stderrp, "Error 'EINVAL' (%d) occurred in '%s'.\n");
        break;
      default:
        goto LABEL_20;
    }
  }
  return result;
}

void sub_100023F78(uint64_t a1)
{
  void *v2;
  PTPDataPacket *v3;

  v3 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(*(id *)(a1 + 32), "operationCode"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "transport"));
  objc_msgSend(v2, "sendData:", v3);

}

void sub_100023FEC(uint64_t a1)
{
  void *v2;
  PTPOperationResponsePacket *v3;

  v3 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", *(unsigned __int16 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transport"));
  objc_msgSend(v2, "sendResponse:", v3);

}

void sub_1000241B4(uint64_t a1)
{
  void *v2;
  PTPDataPacket *v3;

  v3 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", objc_msgSend(*(id *)(a1 + 32), "operationCode"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "transport"));
  objc_msgSend(v2, "sendData:", v3);

}

void sub_100024228(uint64_t a1)
{
  void *v2;
  PTPOperationResponsePacket *v3;

  v3 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", *(unsigned __int16 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transport"));
  objc_msgSend(v2, "sendResponse:", v3);

}

id sub_100025C14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getThumb:", *(_QWORD *)(a1 + 40));
}

id sub_100025C20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getObjectMetadata:", *(_QWORD *)(a1 + 40));
}

void sub_100026760(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "setVirtualCamera:", 0);
  objc_msgSend(*(id *)(a1 + 32), "resetUsingMTP");
  objc_msgSend(*(id *)(a1 + 32), "setLastTransactionID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", 0);
  v2 = sub_10000D990();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "ptpCloseSession") & 1) != 0)
  {
    __ICOSLogCreate();
    v5 = CFSTR("challenge");
    if ((unint64_t)objc_msgSend(CFSTR("challenge"), "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("challenge"), "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("🔐 Device disconnected -- requesting auth challenge dismissal")));
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v5);
      v10 = v8;
      v11 = 136446466;
      v12 = -[__CFString UTF8String](v9, "UTF8String");
      v13 = 2114;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(v4, "performSelector:", "ptpCloseSession");
  }

}

void __ICOSLogCreate()
{
  if (qword_10005E4A0 != -1)
    dispatch_once(&qword_10005E4A0, &stru_100048D40);
}

void sub_10002B2A4(id a1)
{
  void *v1;
  const char *v2;
  id v3;
  os_log_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "processName"));
  v2 = (const char *)objc_msgSend(ICLoggingDomain, "UTF8String");
  v3 = objc_retainAutorelease(v1);
  v4 = os_log_create(v2, (const char *)objc_msgSend(v3, "UTF8String"));
  v5 = (void *)_gICOSLog;
  _gICOSLog = (uint64_t)v4;

}

void __ICReadPrefs()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v0 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentDomainForName:", ICPreferencesDomain));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("loggingLevel")));
  if (v2
    && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    && (v4 = objc_msgSend(v2, "unsignedIntegerValue")) != 0)
  {
    ICLoggingLevel = (uint64_t)v4;
  }
  else if (!ICLoggingLevel)
  {
    ICLoggingLevel = 3075;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 3075));
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v5, CFSTR("loggingLevel"));

    CFPreferencesSetMultiple((CFDictionaryRef)v1, 0, ICPreferencesDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(ICPreferencesDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }

}

uint64_t __ICLogTypeEnabled(uint64_t a1)
{
  return ICLoggingLevel & a1;
}

void sub_10002B664(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

void sub_10002B7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B7E8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002B7F8(uint64_t a1)
{

}

id sub_10002B800(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "plAssetReader"));

  if (!v2)
  {
    v3 = sub_10000D990();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "plAssetHandle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ptpAssetReaderForAssetHandle:", v5));
    objc_msgSend(*(id *)(a1 + 32), "setPlAssetReader:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "plAssetReader"));
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSourcePathForDataRange:error:", v8, *(_QWORD *)(a1 + 64), &obj));
  objc_storeStrong((id *)(v9 + 40), obj);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return objc_msgSend(*(id *)(a1 + 32), "boostAssetReaderLifespan");
}

void sub_10002C03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002C0B0(uint64_t a1)
{
  id v2;
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _QWORD block[5];
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;

  if (objc_msgSend(*(id *)(a1 + 32), "fd") == -1)
  {
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataSourcePath")));
    objc_msgSend(*(id *)(a1 + 32), "setFd:", open((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 0, 0));

    __ICOSLogCreate();
    v3 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

    }
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataSourcePath")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  +++ Opening[%s]:[%10lu]"), objc_msgSend(v5, "UTF8String"), objc_msgSend(*(id *)(a1 + 32), "plAssetSize")));

    v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v3);
      v9 = v7;
      *(_DWORD *)buf = 136446466;
      v26 = -[__CFString UTF8String](v8, "UTF8String");
      v27 = 2114;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "fd"))
  {
    v10 = -3;
    do
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = pread((int)objc_msgSend(*(id *)(a1 + 32), "fd"), *(void **)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    while (v11 == -1 && v10++ != 0);
    if (v11 == -1)
    {
      __ICOSLogCreate();
      v14 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

      }
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataSourcePath")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to read bytes from %s"), objc_msgSend(v16, "UTF8String")));

      v18 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_retainAutorelease(v14);
        v20 = v18;
        v21 = -[__CFString UTF8String](v19, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v26 = v21;
        v27 = 2114;
        v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 80) + v11;
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
          + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v13 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "plAssetSize"))
      {
        if (*(_QWORD *)(a1 + 72) < (unint64_t)dword_10005E438
          && (objc_msgSend(*(id *)(a1 + 32), "toggleHeaderOffset") & 1) == 0)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) -= 12;
        }
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (char *)objc_msgSend(*(id *)(a1 + 32), "plAssetSize")- *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24);
      }
      objc_msgSend(*(id *)(a1 + 32), "setToggleHeaderOffset:", 0);
      if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= 1)
      {
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "plAssetQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002C4FC;
        block[3] = &unk_100048D90;
        v24 = *(_OWORD *)(a1 + 48);
        block[4] = *(_QWORD *)(a1 + 32);
        dispatch_async(v22, block);

      }
    }
  }
}

void sub_10002C4FC(_QWORD *a1)
{
  void *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;

  v10 = 0;
  v1 = (void *)a1[4];
  v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  LODWORD(v10) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (fcntl((int)objc_msgSend(v1, "fd"), 44, &v9) < 0)
  {
    __ICOSLogCreate();
    v2 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("F_RDADVISE: Failed to set")));
    v5 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v2);
      v7 = v5;
      v8 = -[__CFString UTF8String](v6, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v12 = v8;
      v13 = 2114;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
}

void sub_10002CA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002CAA8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __ICOSLogCreate();
  v3 = __ICLogTypeEnabled(4);
  if (WeakRetained)
  {
    if (v3)
    {
      v4 = CFSTR("PTPDataSource");
      if ((unint64_t)objc_msgSend(CFSTR("PTPDataSource"), "length") >= 0x15)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataSource"), "substringWithRange:", 0, 18));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("..")));

      }
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queueName")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fired [%s]"), objc_msgSend(v6, "UTF8String")));

      v8 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_retainAutorelease(v4);
        v10 = v8;
        *(_DWORD *)buf = 136446466;
        v31 = -[__CFString UTF8String](v9, "UTF8String");
        v32 = 2114;
        v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "plAssetTimer"));

    if (v11)
    {
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        v12 = CFSTR("PTPDataSource");
        if ((unint64_t)objc_msgSend(CFSTR("PTPDataSource"), "length") >= 0x15)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataSource"), "substringWithRange:", 0, 18));
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

        }
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queueName")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Canceled [%s]"), objc_msgSend(v14, "UTF8String")));

        v16 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_retainAutorelease(v12);
          v18 = v16;
          v19 = -[__CFString UTF8String](v17, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v31 = v19;
          v32 = 2114;
          v33 = v15;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
      }
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "plAssetTimer"));
      dispatch_source_cancel(v20);

      objc_msgSend(WeakRetained, "setPlAssetTimer:", 0);
      objc_msgSend(WeakRetained, "setPlAssetReader:", 0);
      if (objc_msgSend(*(id *)(a1 + 32), "fd") != -1
        && objc_msgSend(WeakRetained, "fd") != -1)
      {
        close((int)objc_msgSend(WeakRetained, "fd"));
        objc_msgSend(WeakRetained, "setFd:", 0xFFFFFFFFLL);
      }
      objc_msgSend(WeakRetained, "setDataSourcePath:", 0);
    }
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v21 = CFSTR("PTPDataSource");
      if ((unint64_t)objc_msgSend(CFSTR("PTPDataSource"), "length") >= 0x15)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataSource"), "substringWithRange:", 0, 18));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

      }
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queueName")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Destroyed [%s]"), objc_msgSend(v23, "UTF8String")));

      v25 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v21 = objc_retainAutorelease(v21);
      v26 = v25;
      v27 = -[__CFString UTF8String](v21, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v31 = v27;
      v32 = 2114;
      v33 = v24;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_30:
    }
  }
  else if (v3)
  {
    v21 = CFSTR("PTPDataSource");
    if ((unint64_t)objc_msgSend(CFSTR("PTPDataSource"), "length") >= 0x15)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataSource"), "substringWithRange:", 0, 18));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingString:", CFSTR("..")));

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("strongSelf is not available, bailing.")));
    v29 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v21 = objc_retainAutorelease(v21);
    v26 = v29;
    *(_DWORD *)buf = 136446466;
    v31 = -[__CFString UTF8String](v21, "UTF8String");
    v32 = 2114;
    v33 = v24;
    goto LABEL_29;
  }

}

uint64_t start(int a1, char *const *a2)
{
  NSString *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PTPResponder *v16;
  void *context;
  _OWORD v19[16];

  context = objc_autoreleasePoolPush();
  v4 = NSHomeDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Media")));

  memset(v19, 0, sizeof(v19));
  __ICReadPrefs();
  sub_100004D98();
  _set_user_dir_suffix("com.apple.ptpd");
  v7 = 0;
  v8 = 1;
LABEL_2:
  v9 = v8;
LABEL_3:
  v8 = v9;
  while (1)
  {
    while (1)
    {
      v10 = getopt(a1, a2, "n:p:t:s:g:");
      if (v10 <= 111)
        break;
      if (v10 == 112)
      {
        LOBYTE(v19[0]) = 0;
        __strlcpy_chk(v19, optarg, 255, 256);
        v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v19, context));

        v6 = (void *)v13;
        goto LABEL_2;
      }
      if (v10 == 116)
      {
        v11 = optarg;
        v12 = strncmp("usb", optarg, 0xFuLL);
        v9 = 1;
        if (v12)
        {
          if (!strncmp("tcpip", v11, 0xFuLL))
            v9 = 3;
          else
            v9 = v8;
        }
        goto LABEL_3;
      }
    }
    if (v10 == -1)
      break;
    if (v10 == 110)
    {
      LOBYTE(v19[0]) = 0;
      __strlcpy_chk(v19, optarg, 31, 256);
      v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v19));

      v7 = (__CFString *)v14;
      goto LABEL_2;
    }
  }
  if (!v7)
  {
    v15 = MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
    if (v15)
      v7 = (__CFString *)v15;
    else
      v7 = CFSTR("iPhone");
  }
  v16 = -[PTPResponder initWithName:path:andTransportType:]([PTPResponder alloc], "initWithName:path:andTransportType:", v7, v6, (unsigned __int16)v8);
  -[PTPResponder start](v16, "start");
  -[PTPResponder runRunLoop](v16, "runRunLoop");
  -[PTPResponder stop](v16, "stop");

  objc_autoreleasePoolPop(context);
  return 0;
}

void sub_1000307C8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000D96C();
  sub_10000D964(v1);
  sub_10000D95C();
  sub_10000D950();
  sub_10000D928();
  sub_10000D914((void *)&_mh_execute_header, v2, v3, "%{public}20s ! %{public}@", v4, v5, v6, v7, v8);

  sub_10000D940();
}

void sub_100030840(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000D978((void *)&_mh_execute_header, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  sub_10000D988();
}

void sub_1000308A4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
  sub_10000D988();
}

void sub_100030914(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  sub_10000D950();
  sub_10000D928();
  sub_10000D914((void *)&_mh_execute_header, v5, v6, "%{public}20s ! %{public}@", v7, v8, v9, v10, v11);

  sub_10000D940();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_abortPendingIO(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abortPendingIO");
}

id objc_msgSend_activate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate:");
}

id objc_msgSend_addAssets_createdObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAssets:createdObjects:");
}

id objc_msgSend_addCameraFileToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCameraFileToIndex:");
}

id objc_msgSend_addCameraFolderToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCameraFolderToIndex:");
}

id objc_msgSend_addContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContent");
}

id objc_msgSend_addCustomKeyword_withIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCustomKeyword:withIdentifier:");
}

id objc_msgSend_addFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFile:");
}

id objc_msgSend_addFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFolder:");
}

id objc_msgSend_addGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGroup:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addMediaItemToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMediaItemToIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStorage:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allStorageIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allStorageIDs");
}

id objc_msgSend_allStorages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allStorages");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowKeepAwake_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowKeepAwake:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendObjectData_forObjectFormatCode_inAssociation_withContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendObjectData:forObjectFormatCode:inAssociation:withContentType:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetHandle");
}

id objc_msgSend_assignHostMediaCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignHostMediaCapabilities:");
}

id objc_msgSend_assignHostSupportedFormats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignHostSupportedFormats:");
}

id objc_msgSend_assignPTPObjectFormatCode_supportedFormats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignPTPObjectFormatCode:supportedFormats:");
}

id objc_msgSend_baseName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseName");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boostAssetReaderLifespan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boostAssetReaderLifespan");
}

id objc_msgSend_bufferSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferSize");
}

id objc_msgSend_burstUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "burstUUID");
}

id objc_msgSend_busy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "busy");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_bytesTransferred(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytesTransferred");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cameraFileWithObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraFileWithObjectID:");
}

id objc_msgSend_cameraFolderWithObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraFolderWithObjectID:");
}

id objc_msgSend_canVendPhotoStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canVendPhotoStorage");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capacity");
}

id objc_msgSend_captureDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDate");
}

id objc_msgSend_captureDateString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDateString");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_catalogPath_dirs_media_nonMedia_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "catalogPath:dirs:media:nonMedia:");
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "charValue");
}

id objc_msgSend_cleanupStorageAfterTimeout_cleanup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupStorageAfterTimeout:cleanup:");
}

id objc_msgSend_clearDeviceInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearDeviceInterface");
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeSession");
}

id objc_msgSend_closeSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeSession:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_connectionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTimer");
}

id objc_msgSend_connectionTimerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTimerQueue");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_content_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content:");
}

id objc_msgSend_contentForUSBUsingBuffer_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentForUSBUsingBuffer:capacity:");
}

id objc_msgSend_contentLength_bufferLength_contentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentLength:bufferLength:contentType:");
}

id objc_msgSend_contentLengthValid_forContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentLengthValid:forContentType:");
}

id objc_msgSend_conversionGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversionGroup");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyDataToWrappedBytes_forTransport_fromOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDataToWrappedBytes:forTransport:fromOffset:");
}

id objc_msgSend_copyHeaderToWrappedBytes_forTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyHeaderToWrappedBytes:forTransport:");
}

id objc_msgSend_copyToBuffer_numBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyToBuffer:numBytes:");
}

id objc_msgSend_copyToWrappedBytes_forTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyToWrappedBytes:forTransport:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cplStorageState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cplStorageState");
}

id objc_msgSend_createdFilename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createdFilename");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentInternalSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentInternalSessionID");
}

id objc_msgSend_customUpdateToStoreInfoDataset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customUpdateToStoreInfoDataset");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSource");
}

id objc_msgSend_dataSourceForObjectHandle_responseCode_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSourceForObjectHandle:responseCode:size:");
}

id objc_msgSend_dataSourcePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSourcePath");
}

id objc_msgSend_dataSourcePathForDataRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSourcePathForDataRange:");
}

id objc_msgSend_dataSourcePathForDataRange_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSourcePathForDataRange:error:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataUsingEncoding_allowLossyConversion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_dcimFolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dcimFolder");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateNeedsData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateNeedsData");
}

id objc_msgSend_delegateNeedsResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateNeedsResponse");
}

id objc_msgSend_deleteAssets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAssets:");
}

id objc_msgSend_deleteFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteFile:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deleteObjectWithObjectHandle_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteObjectWithObjectHandle:responseCode:");
}

id objc_msgSend_dequeueGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueGroup");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_desiredOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "desiredOrientation");
}

id objc_msgSend_deviceAdded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceAdded:");
}

id objc_msgSend_deviceInfoDataset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInfoDataset");
}

id objc_msgSend_devicePropDescDatasetForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePropDescDatasetForProperty:");
}

id objc_msgSend_devicePropValueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePropValueForProperty:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_durationString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationString");
}

id objc_msgSend_embeddedMetadataForObjectHandle_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedMetadataForObjectHandle:responseCode:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerated");
}

id objc_msgSend_eventCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventCode");
}

id objc_msgSend_eventData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventData");
}

id objc_msgSend_eventDataBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventDataBuffer");
}

id objc_msgSend_eventDataBufferSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventDataBufferSize");
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fd");
}

id objc_msgSend_fileExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExists:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filename");
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filepath");
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fingerprint");
}

id objc_msgSend_folderMatchingName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folderMatchingName:");
}

id objc_msgSend_generatePTPEventsForAddedObjectGroupInStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePTPEventsForAddedObjectGroupInStorage:");
}

id objc_msgSend_generatePTPEventsForAddedObjectHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePTPEventsForAddedObjectHandles:");
}

id objc_msgSend_generatePTPEventsForDeletedObjectHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePTPEventsForDeletedObjectHandles:");
}

id objc_msgSend_getDedupedAssetDirectory_increment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDedupedAssetDirectory:increment:");
}

id objc_msgSend_getDeviceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceInfo:");
}

id objc_msgSend_getDevicePropDesc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDevicePropDesc:");
}

id objc_msgSend_getDevicePropValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDevicePropValue:");
}

id objc_msgSend_getFilesystemMediaCountForDirectories_media_nonMedia_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFilesystemMediaCountForDirectories:media:nonMedia:");
}

id objc_msgSend_getNumDownloadableObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNumDownloadableObjects:");
}

id objc_msgSend_getNumObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNumObjects:");
}

id objc_msgSend_getObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObject:");
}

id objc_msgSend_getObjectCompressedSize64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectCompressedSize64:");
}

id objc_msgSend_getObjectHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectHandles:");
}

id objc_msgSend_getObjectInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectInfo:");
}

id objc_msgSend_getObjectInfoForNextObjectGroupInStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectInfoForNextObjectGroupInStorage:");
}

id objc_msgSend_getObjectInfoForObjectsInStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectInfoForObjectsInStorage:");
}

id objc_msgSend_getObjectPropDesc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectPropDesc:");
}

id objc_msgSend_getObjectPropList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectPropList:");
}

id objc_msgSend_getObjectPropValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectPropValue:");
}

id objc_msgSend_getObjectPropsSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObjectPropsSupported:");
}

id objc_msgSend_getPartialObject64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPartialObject64:");
}

id objc_msgSend_getPartialObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPartialObject:");
}

id objc_msgSend_getReturnValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReturnValue:");
}

id objc_msgSend_getStorageIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStorageIDs:");
}

id objc_msgSend_getStorageInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStorageInfo:");
}

id objc_msgSend_getUserAssignedDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUserAssignedDeviceName:");
}

id objc_msgSend_groupUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupUUID");
}

id objc_msgSend_handleBulkData_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleBulkData:result:");
}

id objc_msgSend_handleInternalSettingsChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInternalSettingsChanged");
}

id objc_msgSend_handleProtectionStatusChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleProtectionStatusChanged:");
}

id objc_msgSend_handleResetDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleResetDevice:");
}

id objc_msgSend_handleSetHostMediaCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSetHostMediaCapabilities:");
}

id objc_msgSend_handleSetHostSupportedFormats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSetHostSupportedFormats:");
}

id objc_msgSend_handleSetHostSupportsGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSetHostSupportsGroups:");
}

id objc_msgSend_handleThrottleChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleThrottleChanged");
}

id objc_msgSend_handleUnsupportedRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUnsupportedRequest:");
}

id objc_msgSend_hasThumbnail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasThumbnail");
}

id objc_msgSend_hostIsLegacyOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostIsLegacyOS");
}

id objc_msgSend_hostIsMacOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostIsMacOS");
}

id objc_msgSend_hostIsTrusted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostIsTrusted");
}

id objc_msgSend_hostIsWindows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostIsWindows");
}

id objc_msgSend_hostMediaSupportedFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostMediaSupportedFormats");
}

id objc_msgSend_hostSupportsGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostSupportsGroups");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_imagePixHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imagePixHeight");
}

id objc_msgSend_imagePixSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imagePixSize");
}

id objc_msgSend_imagePixWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imagePixWidth");
}

id objc_msgSend_increaseLengthBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "increaseLengthBy:");
}

id objc_msgSend_indexLessThanIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexLessThanIndex:");
}

id objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSet");
}

id objc_msgSend_indexedMediaSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexedMediaSet");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAssetHandle_assetSize_andQueueName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetHandle:assetSize:andQueueName:");
}

id objc_msgSend_initWithBytes_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:capacity:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChar:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithEventCode_transactionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventCode:transactionID:");
}

id objc_msgSend_initWithEventCode_transactionID_parameter1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventCode:transactionID:parameter1:");
}

id objc_msgSend_initWithFileDescriptor_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:capacity:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithName_andPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:andPath:");
}

id objc_msgSend_initWithName_captureTimeSpec_parent_storage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:captureTimeSpec:parent:storage:");
}

id objc_msgSend_initWithName_path_andTransportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:path:andTransportType:");
}

id objc_msgSend_initWithObjectHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectHandle:");
}

id objc_msgSend_initWithOpaqueRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOpaqueRepresentation:");
}

id objc_msgSend_initWithOperationCode_transactionID_andData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:andData:");
}

id objc_msgSend_initWithOperationCode_transactionID_andDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:andDataSource:");
}

id objc_msgSend_initWithOperationCode_transactionID_andFilepath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOperationCode:transactionID:andFilepath:");
}

id objc_msgSend_initWithPHPTPAsset_supportedFormats_andParent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPHPTPAsset:supportedFormats:andParent:");
}

id objc_msgSend_initWithParent_andOptionalID_forSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParent:andOptionalID:forSessionID:");
}

id objc_msgSend_initWithPropertyCode_andDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPropertyCode:andDataType:");
}

id objc_msgSend_initWithResponseCode_transactionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResponseCode:transactionID:");
}

id objc_msgSend_initWithResponseCode_transactionID_parameter1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResponseCode:transactionID:parameter1:");
}

id objc_msgSend_initWithResponseCode_transactionID_parameter1_parameter2_parameter3_parameter4_parameter5_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResponseCode:transactionID:parameter1:parameter2:parameter3:parameter4:parameter5:");
}

id objc_msgSend_initWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShort:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTypes:");
}

id objc_msgSend_initWithUSBBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUSBBuffer:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedChar:");
}

id objc_msgSend_initWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedInt:");
}

id objc_msgSend_initWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedLongLong:");
}

id objc_msgSend_initWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedShort:");
}

id objc_msgSend_initializeMTPProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeMTPProperties");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_installSecurity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installSecurity");
}

id objc_msgSend_instanceMethodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceMethodSignatureForSelector:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invocationWithMethodSignature:");
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_isBurstFavorite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBurstFavorite");
}

id objc_msgSend_isBurstFirstPicked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBurstFirstPicked");
}

id objc_msgSend_isBurstPicked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBurstPicked");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHighFrameRateVideo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHighFrameRateVideo");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isPhotoStorageAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPhotoStorageAvailable");
}

id objc_msgSend_isTimeLapseVideo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTimeLapseVideo");
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastIndex");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_libraryIsAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "libraryIsAvailable");
}

id objc_msgSend_locationString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationString");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mediaItemType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItemType");
}

id objc_msgSend_mediaItemWithHandle_inTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItemWithHandle:inTypes:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modificationDate");
}

id objc_msgSend_modificationDateString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modificationDateString");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_numParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numParameters");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithChar:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectCompressedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectCompressedSize");
}

id objc_msgSend_objectCompressedSize64(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectCompressedSize64");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForObjectHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForObjectHandle:");
}

id objc_msgSend_objectFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectFormat");
}

id objc_msgSend_objectHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectHandle");
}

id objc_msgSend_objectHandlesForObjectFormatCode_inAssociation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectHandlesForObjectFormatCode:inAssociation:");
}

id objc_msgSend_objectHandlesInStorage_forObjectFormatCode_inAssociation_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectHandlesInStorage:forObjectFormatCode:inAssociation:responseCode:");
}

id objc_msgSend_objectInfoDataset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectInfoDataset");
}

id objc_msgSend_objectInfoDatasetForObjectHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectInfoDatasetForObjectHandle:");
}

id objc_msgSend_objectInfoForNextObjectGroupInStorage_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectInfoForNextObjectGroupInStorage:responseCode:");
}

id objc_msgSend_objectInfoForObjectsInStorage_forObjectFormatCode_inAssociation_withContentType_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectInfoForObjectsInStorage:forObjectFormatCode:inAssociation:withContentType:responseCode:");
}

id objc_msgSend_objectMatchingAssetHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectMatchingAssetHandle:");
}

id objc_msgSend_objectPropDescForObjectPropertyCode_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPropDescForObjectPropertyCode:responseCode:");
}

id objc_msgSend_objectPropListForHandle_withObjectFormatCode_andPropertyCode_andPropertyGroup_andDepth_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPropListForHandle:withObjectFormatCode:andPropertyCode:andPropertyGroup:andDepth:responseCode:");
}

id objc_msgSend_objectPropValueForHandle_withObjectPropertyCode_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPropValueForHandle:withObjectPropertyCode:responseCode:");
}

id objc_msgSend_objectPropertiesSupportedForObjectFormatCode_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPropertiesSupportedForObjectFormatCode:responseCode:");
}

id objc_msgSend_objectPropertyDescriptionDataset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPropertyDescriptionDataset:");
}

id objc_msgSend_objectPropertyListElement_withObject_andHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPropertyListElement:withObject:andHandle:");
}

id objc_msgSend_objectPropertyWithPropertyCode_andDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectPropertyWithPropertyCode:andDataType:");
}

id objc_msgSend_objectValue_withObject_andHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectValue:withObject:andHandle:");
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSession");
}

id objc_msgSend_openSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSession:");
}

id objc_msgSend_operationCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationCode");
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSet");
}

id objc_msgSend_originalFilename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalFilename");
}

id objc_msgSend_originatingAssetID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originatingAssetID");
}

id objc_msgSend_overrideCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideCapabilities");
}

id objc_msgSend_parameter1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter1");
}

id objc_msgSend_parameter2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter2");
}

id objc_msgSend_parameter3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter3");
}

id objc_msgSend_parameter4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter4");
}

id objc_msgSend_parameter5(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameter5");
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parent");
}

id objc_msgSend_parentObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentObject");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathObjectInfoForObjectsInStorage_forObjectFormatCode_inAssociation_withContentType_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathObjectInfoForObjectsInStorage:forObjectFormatCode:inAssociation:withContentType:responseCode:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSelector_withObject_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:withObject:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_photoStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoStorage");
}

id objc_msgSend_photoStorageAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoStorageAvailable");
}

id objc_msgSend_plAssetHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plAssetHandle");
}

id objc_msgSend_plAssetQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plAssetQueue");
}

id objc_msgSend_plAssetReader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plAssetReader");
}

id objc_msgSend_plAssetSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plAssetSize");
}

id objc_msgSend_plAssetTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plAssetTimer");
}

id objc_msgSend_placeholderStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderStorage");
}

id objc_msgSend_preparePhotoStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preparePhotoStorage");
}

id objc_msgSend_prettyAccess_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prettyAccess:value:");
}

id objc_msgSend_processAddedFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAddedFiles:");
}

id objc_msgSend_processDeletedFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDeletedFiles:");
}

id objc_msgSend_processDeviceInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processDeviceInterface:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_propertyCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyCode");
}

id objc_msgSend_ptpAssetReaderForAssetHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpAssetReaderForAssetHandle:");
}

id objc_msgSend_ptpDeletePhotoForAssetHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpDeletePhotoForAssetHandle:");
}

id objc_msgSend_ptpEnumerateAllAssetsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpEnumerateAllAssetsUsingBlock:");
}

id objc_msgSend_ptpEnumerateAssetsWithLocalIdentifiers_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpEnumerateAssetsWithLocalIdentifiers:usingBlock:");
}

id objc_msgSend_ptpImagePropertiesForAssetHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpImagePropertiesForAssetHandle:");
}

id objc_msgSend_ptpSecurityModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpSecurityModel");
}

id objc_msgSend_ptpThumbnailForAssetHandle_size_compressionQuality_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ptpThumbnailForAssetHandle:size:compressionQuality:");
}

id objc_msgSend_queueName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueName");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "range");
}

id objc_msgSend_read_length_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "read:length:offset:");
}

id objc_msgSend_readBulkData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readBulkData");
}

id objc_msgSend_registerForSecurityNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForSecurityNotifications");
}

id objc_msgSend_relatedUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relatedUUID");
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releasePowerAssertion");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCameraFileFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCameraFileFromIndex:");
}

id objc_msgSend_removeCameraFolderFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCameraFolderFromIndex:");
}

id objc_msgSend_removeIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIndex:");
}

id objc_msgSend_removeMediaItemFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMediaItemFromIndex:");
}

id objc_msgSend_removeMediaItemWithHandleFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMediaItemWithHandleFromIndex:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removePlaceholderStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePlaceholderStorage");
}

id objc_msgSend_removeSecurity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSecurity");
}

id objc_msgSend_removeStorageWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeStorageWithID:");
}

id objc_msgSend_removeStorages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeStorages");
}

id objc_msgSend_removeVirtualCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeVirtualCamera");
}

id objc_msgSend_replaceBytesInRange_withBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:");
}

id objc_msgSend_replaceBytesInRange_withBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceBytesInRange:withBytes:length:");
}

id objc_msgSend_resetResponderSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetResponderSession");
}

id objc_msgSend_resetUsingMTP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetUsingMTP");
}

id objc_msgSend_responseCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseCode");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_runRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runRunLoop");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_sendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendData:");
}

id objc_msgSend_sendDataPackets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDataPackets:");
}

id objc_msgSend_sendDataPacketsSplit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDataPacketsSplit:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendEventAddStorageWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventAddStorageWithID:");
}

id objc_msgSend_sendEventDeviceUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventDeviceUnlocked");
}

id objc_msgSend_sendEventRemoveStorageWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventRemoveStorageWithID:");
}

id objc_msgSend_sendNextEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendNextEvent");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequenceNumber");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionID");
}

id objc_msgSend_setAccessCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessCapability:");
}

id objc_msgSend_setAssetGroupIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetGroupIndex:");
}

id objc_msgSend_setAssociationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociationType:");
}

id objc_msgSend_setBusy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBusy:");
}

id objc_msgSend_setBytesTransferred_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBytesTransferred:");
}

id objc_msgSend_setCaptureDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureDate:");
}

id objc_msgSend_setCaptureFormats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureFormats:");
}

id objc_msgSend_setConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnected:");
}

id objc_msgSend_setConnectionTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionTimer:");
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContent:");
}

id objc_msgSend_setCurrentInternalSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentInternalSessionID:");
}

id objc_msgSend_setCurrentValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentValue:");
}

id objc_msgSend_setDataSourcePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSourcePath:");
}

id objc_msgSend_setDataTypeCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataTypeCode:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateNeedsData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateNeedsData:");
}

id objc_msgSend_setDelegateNeedsResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateNeedsResponse:");
}

id objc_msgSend_setDevicePropertiesSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevicePropertiesSupported:");
}

id objc_msgSend_setDevicePropertyCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevicePropertyCode:");
}

id objc_msgSend_setDeviceVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceVersion:");
}

id objc_msgSend_setEnumerated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnumerated:");
}

id objc_msgSend_setEventDataBuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventDataBuffer:");
}

id objc_msgSend_setEventsSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventsSupported:");
}

id objc_msgSend_setFactoryDefaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFactoryDefaultValue:");
}

id objc_msgSend_setFd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFd:");
}

id objc_msgSend_setFileIndices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileIndices:");
}

id objc_msgSend_setFileNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileNames:");
}

id objc_msgSend_setFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilename:");
}

id objc_msgSend_setFilesystemType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilesystemType:");
}

id objc_msgSend_setFolders_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFolders:");
}

id objc_msgSend_setFormFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormFlag:");
}

id objc_msgSend_setFreeSpaceInBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFreeSpaceInBytes:");
}

id objc_msgSend_setFreeSpaceInImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFreeSpaceInImages:");
}

id objc_msgSend_setFunctionalMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFunctionalMode:");
}

id objc_msgSend_setHasVended_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasVended:");
}

id objc_msgSend_setHostCharacteristics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostCharacteristics:");
}

id objc_msgSend_setHostSupportsGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostSupportsGroups:");
}

id objc_msgSend_setImageFormats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageFormats:");
}

id objc_msgSend_setImagePixHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImagePixHeight:");
}

id objc_msgSend_setImagePixWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImagePixWidth:");
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeywords:");
}

id objc_msgSend_setLastTransactionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastTransactionID:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setManufacturer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManufacturer:");
}

id objc_msgSend_setMaxCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxCapacity:");
}

id objc_msgSend_setMaximumValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumValue:");
}

id objc_msgSend_setMinimumValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumValue:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setModificationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModificationDate:");
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonth:");
}

id objc_msgSend_setNumParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumParameters:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectCompressedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectCompressedSize:");
}

id objc_msgSend_setObjectFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectFormat:");
}

id objc_msgSend_setObjectHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectHandle:");
}

id objc_msgSend_setOperationsSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationsSupported:");
}

id objc_msgSend_setOutOfBandHints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutOfBandHints:");
}

id objc_msgSend_setParent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParent:");
}

id objc_msgSend_setParentObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParentObject:");
}

id objc_msgSend_setPeerMediaCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerMediaCapabilities:");
}

id objc_msgSend_setPhotoStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhotoStorage:");
}

id objc_msgSend_setPlAssetHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlAssetHandle:");
}

id objc_msgSend_setPlAssetQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlAssetQueue:");
}

id objc_msgSend_setPlAssetReader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlAssetReader:");
}

id objc_msgSend_setPlAssetSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlAssetSize:");
}

id objc_msgSend_setPlAssetTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlAssetTimer:");
}

id objc_msgSend_setProtectionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtectionStatus:");
}

id objc_msgSend_setQueueName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueueName:");
}

id objc_msgSend_setRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRange:");
}

id objc_msgSend_setReadWriteAttribute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadWriteAttribute:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setSequenceNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSequenceNumber:");
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumber:");
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionID:");
}

id objc_msgSend_setStandardVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardVersion:");
}

id objc_msgSend_setStepSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStepSize:");
}

id objc_msgSend_setStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorage:");
}

id objc_msgSend_setStorageDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorageDescription:");
}

id objc_msgSend_setStorageID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorageID:");
}

id objc_msgSend_setStorageTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorageTimer:");
}

id objc_msgSend_setStorageTimerQ_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorageTimerQ:");
}

id objc_msgSend_setStorageType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorageType:");
}

id objc_msgSend_setSupportedFormats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedFormats:");
}

id objc_msgSend_setThumbCompressedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbCompressedSize:");
}

id objc_msgSend_setThumbFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbFormat:");
}

id objc_msgSend_setThumbOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbOffset:");
}

id objc_msgSend_setThumbPixHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbPixHeight:");
}

id objc_msgSend_setThumbPixWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbPixWidth:");
}

id objc_msgSend_setTimedOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimedOut:");
}

id objc_msgSend_setToggleHeaderOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToggleHeaderOffset:");
}

id objc_msgSend_setTransactionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransactionID:");
}

id objc_msgSend_setUnlinkWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnlinkWhenDone:");
}

id objc_msgSend_setUsingLegacyOS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsingLegacyOS:");
}

id objc_msgSend_setUsingMTP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsingMTP:");
}

id objc_msgSend_setUsingMacOS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsingMacOS:");
}

id objc_msgSend_setUsingPeerMediaCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsingPeerMediaCapabilities:");
}

id objc_msgSend_setUsingWindows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsingWindows");
}

id objc_msgSend_setVendorExtensionDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVendorExtensionDescription:");
}

id objc_msgSend_setVendorExtensionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVendorExtensionID:");
}

id objc_msgSend_setVendorExtensionVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVendorExtensionVersion:");
}

id objc_msgSend_setVirtualCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVirtualCamera:");
}

id objc_msgSend_setVolumeLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeLabel:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setYear:");
}

id objc_msgSend_setupDeviceInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDeviceInterface");
}

id objc_msgSend_setupStorageAfterTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupStorageAfterTimeout:");
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortValue");
}

id objc_msgSend_shouldRemovePlaceholderStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRemovePlaceholderStorage");
}

id objc_msgSend_shouldVendPhotoStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldVendPhotoStorage");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_spatialOverCaptureGroupIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialOverCaptureGroupIdentifier");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startObservers");
}

id objc_msgSend_startResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startResponder");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopObservers");
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storage");
}

id objc_msgSend_storageID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageID");
}

id objc_msgSend_storageInfoDataset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageInfoDataset");
}

id objc_msgSend_storageInfoDatasetForStorageID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageInfoDatasetForStorageID:");
}

id objc_msgSend_storageTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageTimer");
}

id objc_msgSend_storageTimerQ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageTimerQ");
}

id objc_msgSend_storageWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageWithID:");
}

id objc_msgSend_storages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storages");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportedFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedFormats");
}

id objc_msgSend_thumbCompressedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbCompressedSize");
}

id objc_msgSend_thumbFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbFormat");
}

id objc_msgSend_thumbOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbOffset");
}

id objc_msgSend_thumbPixSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbPixSize");
}

id objc_msgSend_thumbnailForMaxPixelSize_compressedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailForMaxPixelSize:compressedSize:");
}

id objc_msgSend_thumbnailForObjectHandle_maxPixelSize_responseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailForObjectHandle:maxPixelSize:responseCode:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_toggleHeaderOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleHeaderOffset");
}

id objc_msgSend_transactionCanceled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionCanceled:");
}

id objc_msgSend_transactionData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionData");
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionID");
}

id objc_msgSend_transferBehaviorUserPreference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transferBehaviorUserPreference");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transport");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unlinkWhenDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlinkWhenDone");
}

id objc_msgSend_unregisterForSecurityNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForSecurityNotifications");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContent");
}

id objc_msgSend_updateDeviceInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDeviceInformation");
}

id objc_msgSend_updateProtectionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProtectionStatus:");
}

id objc_msgSend_updateUserAssignedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUserAssignedName");
}

id objc_msgSend_usbCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usbCore");
}

id objc_msgSend_userAssignedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAssignedName");
}

id objc_msgSend_usingMTP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usingMTP");
}

id objc_msgSend_usingPeerMediaCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usingPeerMediaCapabilities");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vendPhotoStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendPhotoStorage");
}

id objc_msgSend_videoCodec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoCodec");
}

id objc_msgSend_virtualDirectoryDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "virtualDirectoryDate:");
}

id objc_msgSend_virtualDirectoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "virtualDirectoryName:");
}

id objc_msgSend_visibleStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleStorage:");
}

id objc_msgSend_waitForHostConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForHostConnection:");
}

id objc_msgSend_willOverrideCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willOverrideCapabilities");
}

id objc_msgSend_wrappedBytesWithBytes_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrappedBytesWithBytes:capacity:");
}

id objc_msgSend_wrappedBytesWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrappedBytesWithCapacity:");
}

id objc_msgSend_writeBulkData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBulkData:");
}

id objc_msgSend_writeInterruptData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeInterruptData:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}

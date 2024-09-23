void sub_100001AC0(uint64_t a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFString *v11;
  const __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  char buffer[2048];

  bzero(buffer, 0x800uLL);
  if (!a2)
    a2 = "";
  v11 = CFStringCreateWithFormatAndArguments(0, 0, a3, &a9);
  v12 = v11;
  if (v11 && !CFStringGetCString(v11, buffer, 2048, 0x8000100u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve C string.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = a2;
    v15 = 2080;
    v16 = buffer;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
  }
  if (v12)
LABEL_8:
    CFRelease(v12);
}

BOOL sub_100001C28(int a1)
{
  int v1;
  int *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;

  v10 = 1;
  v1 = setsockopt(a1, 0xFFFF, 0x10000, &v10, 4u);
  if (v1 == -1)
  {
    v2 = __error();
    v3 = strerror(*v2);
    sub_100001AC0(0, "_disable_wake_from_sleep", CFSTR("setsockopt(SO_NOWAKEFROMSLEEP) failed: %s"), v4, v5, v6, v7, v8, v3);
  }
  return v1 != -1;
}

BOOL sub_100001CA0(int a1)
{
  _BOOL8 result;
  int *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v10 = 1;
  result = sub_100001C28(a1);
  if (result)
  {
    if (setsockopt(a1, 0xFFFF, 4388, &v10, 4u) == -1)
    {
      v3 = __error();
      v4 = strerror(*v3);
      sub_100001AC0(0, "set_socket_option_want_closed_event_no_wake", CFSTR("setsockopt(SO_WANT_KEV_SOCKET_CLOSED) failed: %s"), v5, v6, v7, v8, v9, v4);
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

BOOL sub_100001D28(int a1, unsigned int a2)
{
  int v2;
  int *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[0] = a2;
  v11[1] = 0;
  v2 = setsockopt(a1, 0xFFFF, 4102, v11, 0x10u);
  if (v2 == -1)
  {
    v3 = __error();
    v4 = strerror(*v3);
    sub_100001AC0(0, "set_socket_option_recv_timeout", CFSTR("setsockopt(SO_RCVTIMEO) failed: %s"), v5, v6, v7, v8, v9, v4);
  }
  return v2 != -1;
}

BOOL sub_100001DA0(int a1, unsigned int a2)
{
  int v2;
  int *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[0] = a2;
  v11[1] = 0;
  v2 = setsockopt(a1, 0xFFFF, 4101, v11, 0x10u);
  if (v2 == -1)
  {
    v3 = __error();
    v4 = strerror(*v3);
    sub_100001AC0(0, "set_socket_option_send_timeout", CFSTR("setsockopt(SO_SNDTIMEO) failed: %s"), v5, v6, v7, v8, v9, v4);
  }
  return v2 != -1;
}

void sub_100001E18(const __CFString *a1, const __CFDictionary *a2)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a1, a1, 0, 1u);
  if (a2)
  {
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v5, a1, a1, a2, 1u);
  }
}

void sub_100001EF0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  uint64_t v7;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cleaning up for closed peer: %{public}@", buf, 0xCu);
  }
  v3 = (void *)qword_100010C10;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100001FE4;
  v4[3] = &unk_10000C4A8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void sub_100001FE4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  uint64_t v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerName"));
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v17 = 138543362;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Host socket closed: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    v10 = 1;
    objc_msgSend(v6, "setLockdownSockConfirmedClosed:", 1);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "servicesAwaitingClose"));
    v10 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v17 = 138543362;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Service socket closed: %{public}@", (uint8_t *)&v17, 0xCu);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "servicesAwaitingClose"));
      objc_msgSend(v13, "removeObject:", *(_QWORD *)(a1 + 32));

      v10 = 1;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100007EB0(v6);
  if (objc_msgSend(v6, "aboutToSleep"))
  {
    if (objc_msgSend(v6, "lockdownSockConfirmedClosed"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "servicesAwaitingClose"));
      v15 = objc_msgSend(v14, "count");

      if (!v15)
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "powerDownTimer"));
        dispatch_source_cancel(v16);

      }
    }
  }
  if (v10)
    *a4 = 1;

}

void sub_100002270(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010C10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  if (v2)
    objc_msgSend(v2, "addService:", v3);
  else
    objc_msgSend(v3, "invalidate");

}

void sub_100002348(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010C10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v2, "removeService:", *(_QWORD *)(a1 + 32));

}

void sub_100002554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002580(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002590(uint64_t a1)
{

}

void sub_100002598(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010C10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostID"));
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

id sub_100002614(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100002674;
  v2[3] = &unk_10000C548;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend((id)qword_100010C10, "enumerateKeysAndObjectsUsingBlock:", v2);
}

id sub_100002674(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:");
}

id sub_1000026E0(uint64_t a1)
{
  _QWORD v2[5];
  int v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100002748;
  v2[3] = &unk_10000C5B0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(a1 + 40);
  return objc_msgSend((id)qword_100010C10, "enumerateKeysAndObjectsUsingBlock:", v2);
}

id sub_100002748(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[5];
  int v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000027AC;
  v4[3] = &unk_10000C590;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_DWORD *)(a1 + 40);
  return objc_msgSend(a3, "enumerateServices:", v4);
}

void sub_1000027AC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "hasHeartbeatRef:pid:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
    v4 = v6;
    if (v5)
    {
      objc_msgSend(v6, "invalidate");
      v4 = v6;
    }
  }

}

void sub_10000290C(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)qword_100010C10;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000297C;
  v2[3] = &unk_10000C4A8;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v2);

}

void sub_10000297C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostID"));
  objc_msgSend(v7, "addObject:", v8);

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watchers for host %{public}@:", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(v6, "enumerateServices:", &stru_10000C610);
  }

}

void sub_100002A70(id a1, WatchedServiceInfo *a2)
{
  if (a2)
    -[WatchedServiceInfo logService:](a2, "logService:", "    ");
}

void sub_1000030EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000310C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  _QWORD block[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hostID"));

  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000319C;
    block[3] = &unk_10000C658;
    v3 = *(_QWORD *)(a1 + 32);
    block[4] = WeakRetained;
    block[5] = v3;
    dispatch_sync((dispatch_queue_t)qword_100010C18, block);
  }

}

void sub_10000319C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IOReturn v10;
  IOReturn v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = (void *)qword_100010C10;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hostID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));

  if (v4 == *(void **)(a1 + 32))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostID"));
    v16 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "description"));
    v17 = v7;
    sub_100001E18(CFSTR("com.apple.heartbeatd.host.detached"), (const __CFDictionary *)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));

    v8 = (void *)qword_100010C10;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hostID"));
    objc_msgSend(v8, "removeObjectForKey:", v9);

    objc_msgSend(*(id *)(a1 + 32), "setHostID:", 0);
  }
  else if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hostID"));
    v12 = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watcher for %{public}@ has already been replaced by %{public}@.", (uint8_t *)&v12, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "sock") != -1)
    shutdown((int)objc_msgSend(*(id *)(a1 + 40), "sock"), 2);
  if (objc_msgSend(*(id *)(a1 + 32), "powerConn"))
  {
    v10 = IODeregisterForSystemPower((io_object_t *)(*(_QWORD *)(a1 + 32) + 20));
    if (v10)
    {
      v11 = v10;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 67109120;
        LODWORD(v13) = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODeregisterForSystemPower failed: %08x", (uint8_t *)&v12, 8u);
      }
    }
    IONotificationPortDestroy((IONotificationPortRef)objc_msgSend(*(id *)(a1 + 32), "powerPort"));
    IOServiceClose((io_connect_t)objc_msgSend(*(id *)(a1 + 32), "powerConn"));
    objc_msgSend(*(id *)(a1 + 32), "setPowerPort:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setPowerNotifier:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setPowerConn:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "enumerateServices:", &stru_10000C630);

}

void sub_100003418(id a1, WatchedServiceInfo *a2)
{
  -[WatchedServiceInfo invalidate](a2, "invalidate");
}

void sub_100003AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location,char a29)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_100003AF8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  if (qword_100010C40 != -1)
    dispatch_once(&qword_100010C40, &stru_10000C858);
  v0 = mach_absolute_time();
  LODWORD(v1) = dword_100010C38;
  LODWORD(v2) = *(_DWORD *)algn_100010C3C;
  return (unint64_t)((double)v0 * (double)v1 / (double)v2 / 1000000000.0);
}

void sub_100003B64(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  unint64_t v9;
  __int16 v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = sub_100003AF8();
  if (v3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 0x14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hostID"));
      v6 = 134218498;
      v7 = v4;
      v8 = 2048;
      v9 = v3;
      v10 = 2114;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lastPing was at %llu, now %llu; timing out host %{public}@",
        (uint8_t *)&v6,
        0x20u);

    }
    objc_msgSend(WeakRetained, "invalidate");
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100007F7C(a1 + 40, WeakRetained);
  }

}

unint64_t sub_100003CAC(uint64_t a1)
{
  unint64_t result;

  result = sub_100003AF8();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100003CD8(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pingSem"));

  if (v1)
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pingSem"));
    dispatch_semaphore_signal(v2);

  }
}

void sub_100004104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000414C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "servicesAwaitingClose"));
    objc_msgSend(v3, "removeAllObjects");

    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000041D4;
    v4[3] = &unk_10000C6F8;
    v4[4] = v2;
    objc_msgSend(v2, "enumerateServices:", v4);
  }

}

void sub_1000041D4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "servicesAwaitingClose"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peerName"));

  objc_msgSend(v5, "addObject:", v4);
}

void sub_100004238(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _BOOL4 v5;
  unsigned int v6;
  _BOOL4 v7;
  int v8;
  int *v9;
  char *v10;
  const char *v11;
  uint32_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  const char *v16;
  uint32_t v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD v20[4];
  id v21[2];
  _QWORD block[5];
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  _QWORD v26[2];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v24 = 256;
  if (WeakRetained)
  {
    v4 = malloc_type_malloc(0x100uLL, 0x732543BFuLL);
    v23 = v4;
    v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (!v4)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate read buffer.", buf, 2u);
      }
      goto LABEL_31;
    }
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v26[0] = 5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Holding off sleep for at most %lld seconds.", buf, 0xCu);
    }
    sub_100001D28((int)objc_msgSend(WeakRetained, "sock"), 1u);
    sub_100001DA0((int)objc_msgSend(WeakRetained, "sock"), 1u);
    if (qword_100010C60 != -1)
      dispatch_once(&qword_100010C60, &stru_10000C898);
    if (!qword_100010C68)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
        || (*(_WORD *)buf = 0,
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create sleep message.", buf, 2u), !qword_100010C68))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = "Failed to create SleepyTime message.";
          v12 = 2;
          goto LABEL_25;
        }
LABEL_30:
        free(v4);
        goto LABEL_31;
      }
    }
    v6 = objc_msgSend(WeakRetained, "sendPacket:size:");
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        v8 = *__error();
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 67109378;
        LODWORD(v26[0]) = v8;
        WORD2(v26[0]) = 2082;
        *(_QWORD *)((char *)v26 + 6) = v10;
        v11 = "Failed to send SleepyTime message: %d %{public}s";
        v12 = 18;
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sent SleepyTime.", buf, 2u);
    }
    v13 = objc_autoreleasePoolPush();
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "receiveMessage:size:", &v23, &v24));
    v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (!v15)
        goto LABEL_29;
      *(_DWORD *)buf = 138543362;
      v26[0] = v14;
      v16 = "Received SleepyTime response: %{public}@";
      v17 = 12;
    }
    else
    {
      if (!v15)
        goto LABEL_29;
      *(_WORD *)buf = 0;
      v16 = "Failed to receive SleepyTime response.";
      v17 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
LABEL_29:

    objc_autoreleasePoolPop(v13);
    v4 = v23;
    if (!v23)
    {
LABEL_31:
      v23 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004738;
      block[3] = &unk_10000C4D0;
      block[4] = WeakRetained;
      dispatch_sync((dispatch_queue_t)qword_100010C18, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting power down timer to monitor sockets closing.", buf, 2u);
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100004798;
      v20[3] = &unk_10000C740;
      objc_copyWeak(v21, v2);
      v21[1] = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "setSleepHandler:", v20);
      objc_msgSend(WeakRetained, "setSleepTimerEnabled:", 1);
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "powerDownTimer"));
      v19 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      objc_destroyWeak(v21);
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid object.", buf, 2u);
  }
LABEL_34:

}

void sub_100004718(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100004738(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "ldConn"))
  {
    lockdown_disconnect(objc_msgSend(*(id *)(a1 + 32), "ldConn"));
    objc_msgSend(*(id *)(a1 + 32), "setLdConn:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setSock:", 0xFFFFFFFFLL);
  }
  return objc_msgSend(*(id *)(a1 + 32), "enumerateServices:", &stru_10000C718);
}

void sub_100004790(id a1, WatchedServiceInfo *a2)
{
  -[WatchedServiceInfo invalidate](a2, "invalidate");
}

void sub_100004798(uint64_t a1)
{
  id WeakRetained;
  IOReturn v3;
  IOReturn v4;
  _DWORD v5[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "sleepTimerEnabled"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Allowing power change for sleep.", (uint8_t *)v5, 2u);
    }
    v3 = IOAllowPowerChange((io_connect_t)objc_msgSend(WeakRetained, "powerConn"), *(_QWORD *)(a1 + 40));
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOAllowPowerChange failed: %08x", (uint8_t *)v5, 8u);
      }
    }
    objc_msgSend(WeakRetained, "setSleepTimerEnabled:", 0);
    objc_msgSend(WeakRetained, "invalidate");
  }

}

id sub_10000520C(int a1)
{
  id v2;
  socklen_t v3;
  sockaddr v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;

  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = (sockaddr)0;
  v5 = 0u;
  v3 = 499;
  if (getpeername(a1, &v4, &v3))
    return 0;
  v2 = sub_100007AB8(&v4);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

id sub_1000052D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, "handleSleepNotification:service:messageArgument:", a3, a2, a4);
}

void sub_1000052DC(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "servicesAwaitingClose"));
    v4 = objc_msgSend(v3, "count");

    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "servicesAwaitingClose"));
      v6 = objc_msgSend(v5, "count");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "peerName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "servicesAwaitingClose"));
      v10 = 134218498;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%ld services never got closed socket event for peer '%{public}@': %{public}@", (uint8_t *)&v10, 0x20u);

    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "powerDownTimer"));
    dispatch_source_cancel(v9);

  }
}

void sub_100005428(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sleepHandler"));

  if (v1)
  {
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sleepHandler"));
    v2[2]();

  }
}

void sub_1000055EC(id a1, id a2, BOOL *a3)
{
  objc_msgSend(a2, "invalidate", a3);
}

uint64_t sub_100005A40(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void sub_10000645C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000648C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void sub_1000065CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000065E0(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "procExitSource"));

    if (v1)
    {
      v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "procExitSource"));
      dispatch_source_cancel(v2);

      objc_msgSend(WeakRetained, "setProcExitSource:", 0);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hostID"));
    +[HostWatcher removeService:forHostID:](HostWatcher, "removeService:forHostID:", WeakRetained, v3);

  }
}

uint64_t start()
{
  void *v0;
  BOOL v1;
  const char *v4;
  int v5;
  unsigned int v6;
  int v7;
  int *v8;
  char *v9;
  const char *v10;
  int v11;
  int *v12;
  char *v13;
  int v14;
  int *v15;
  char *v16;
  uint32_t v17;
  dispatch_source_t v19;
  void *v20;
  xpc_connection_t mach_service;
  _xpc_connection_s *v22;
  _QWORD v23[4];
  _xpc_connection_s *v24;
  _QWORD v25[4];
  unsigned int v26;
  uint8_t handler[8];
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  unsigned int v31;
  uint64_t v32;
  int v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  char *v37;

  v0 = objc_autoreleasePoolPush();
  if (qword_100010C30 != -1)
    dispatch_once(&qword_100010C30, &stru_10000C7E8);
  if (qword_100010C08)
    v1 = qword_100010C18 == 0;
  else
    v1 = 1;
  if (!v1 && qword_100010C10 != 0 && qword_100010C20 != 0)
  {
    v5 = socket(32, 3, 1);
    v6 = v5;
    if (v5 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *__error();
        v12 = __error();
        v13 = strerror(*v12);
        *(_DWORD *)buf = 67109378;
        v35 = v11;
        v36 = 2082;
        v37 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "socket call failed: %d (%{public}s)", buf, 0x12u);
      }
      if (v6 == -1)
      {
LABEL_30:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)handler = 0;
          v4 = "Failed to intialize kevent monitor.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
    }
    else
    {
      v33 = 4;
      v32 = 0x100000001;
      if (ioctl(v5, 0x800C6502uLL, &v32))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *__error();
          v8 = __error();
          v9 = strerror(*v8);
          *(_DWORD *)buf = 67109378;
          v35 = v7;
          v36 = 2082;
          v37 = v9;
          v10 = "ioctl(SIOCSKEVFILT) failed: %d (%{public}s)";
LABEL_27:
          v17 = 18;
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v17);
        }
      }
      else
      {
        if (!ioctl(v6, 0x8004667EuLL, &v32))
        {
          v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v6, 0, (dispatch_queue_t)qword_100010C20);
          v20 = (void *)qword_100010C28;
          qword_100010C28 = (uint64_t)v19;

          if (qword_100010C28)
          {
            *(_QWORD *)handler = _NSConcreteStackBlock;
            v28 = 3221225472;
            v29 = sub_100007C24;
            v30 = &unk_10000C8B8;
            v31 = v6;
            dispatch_source_set_cancel_handler((dispatch_source_t)qword_100010C28, handler);
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_100007C2C;
            v25[3] = &unk_10000C8B8;
            v26 = v6;
            dispatch_source_set_event_handler((dispatch_source_t)qword_100010C28, v25);
            dispatch_resume((dispatch_object_t)qword_100010C28);
            mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", (dispatch_queue_t)qword_100010C08, 1uLL);
            if (mach_service)
            {
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472;
              v23[2] = sub_100006E60;
              v23[3] = &unk_10000C838;
              v22 = mach_service;
              v24 = v22;
              xpc_connection_set_event_handler(v22, v23);

              xpc_connection_resume(v22);
              objc_autoreleasePoolPop(v0);
              CFRunLoopRun();

              return 1;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)handler = 0;
              v4 = "Failed to create xpc listener.";
              goto LABEL_32;
            }
            goto LABEL_33;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_29;
          *(_WORD *)buf = 0;
          v10 = "Failed to dispatch source.";
          v17 = 2;
          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *__error();
          v15 = __error();
          v16 = strerror(*v15);
          *(_DWORD *)buf = 67109378;
          v35 = v14;
          v36 = 2082;
          v37 = v16;
          v10 = "ioctl(FIONBIO) failed: %d (%{public}s)";
          goto LABEL_27;
        }
      }
    }
LABEL_29:
    close(v6);
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)handler = 0;
    v4 = "Failed to intialize globals.";
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, handler, 2u);
  }
LABEL_33:
  objc_autoreleasePoolPop(v0);
  return 1;
}

void sub_100006D88(id a1)
{
  dispatch_queue_attr_t v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  id v13;
  void *v14;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = dispatch_queue_create("com.apple.mobile.heartbeat", v2);
  v4 = (void *)qword_100010C08;
  qword_100010C08 = (uint64_t)v3;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("com.apple.mobile.heartbeat.hostwatchers", v6);
  v8 = (void *)qword_100010C18;
  qword_100010C18 = (uint64_t)v7;

  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = dispatch_queue_create("com.apple.heartbeatd.KernelEventMonitor", v10);
  v12 = (void *)qword_100010C20;
  qword_100010C20 = (uint64_t)v11;

  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = (void *)qword_100010C10;
  qword_100010C10 = (uint64_t)v13;

}

void sub_100006E60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  _QWORD v8[4];
  _xpc_connection_s *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  xpc_type_t type;
  uint8_t buf[4];
  char *v16;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  type = 0;
  type = xpc_get_type(v3);
  v4 = (void *)v12[3];
  if (v4 == &_xpc_type_connection)
  {
    v6 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)qword_100010C08);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007078;
    v8[3] = &unk_10000C810;
    v10 = &v11;
    v7 = v6;
    v9 = v7;
    xpc_connection_set_event_handler(v7, v8);
    xpc_connection_resume(v7);

  }
  else if (v4 == &_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC connection is invalid, verify mach service name is set in xpc plist.", buf, 2u);
      }
    }
    else
    {
      v5 = xpc_copy_description(v3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected XPC event '%{public}s':", buf, 0xCu);
      }
      free(v5);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
  _Block_object_dispose(&v11, 8);

}

void sub_100007050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007078(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  id v5;
  void *v6;
  uint64_t uint64;
  uint64_t v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  const char *v12;
  char *v13;
  char *string;
  id v15;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v17;
  _xpc_connection_s *v18;
  uint64_t pid;
  id v20;
  char *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  dispatch_queue_global_t v26;
  NSObject *v27;
  NSObject *v28;
  xpc_object_t v29;
  xpc_object_t reply;
  void *v31;
  _QWORD block[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  uint8_t buf[4];
  char *v43;
  __int16 v44;
  uint64_t v45;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_get_type(v3);
  if (v3 != &_xpc_error_connection_invalid
    && *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == &_xpc_type_dictionary)
  {
    v38 = 0;
    v39 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = sub_100002580;
    v37 = sub_100002590;
    if (!lockdown_copy_checkin_info(v3, &v39))
    {
      v8 = os_transaction_create("com.apple.mobile.lockdownd");
      v9 = (void *)v34[5];
      v34[5] = v8;

      global_queue = dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007678;
      block[3] = &unk_10000C520;
      block[4] = &v33;
      block[5] = v39;
      dispatch_async(v11, block);

LABEL_24:
      _Block_object_dispose(&v33, 8);

      goto LABEL_25;
    }
    v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    v5 = v3;
    v6 = v5;
    if (v5 && v4)
    {
      uint64 = xpc_dictionary_get_uint64(v5, "HB_PARAM_COMMAND");
      switch(uint64)
      {
        case 1uLL:
          +[WatchedServiceInfo processWatchCommand:](WatchedServiceInfo, "processWatchCommand:", v6);
          goto LABEL_22;
        case 2uLL:
          string = (char *)xpc_dictionary_get_string(v6, "HB_PARAM_HOSTID");
          if (!string
            || (string = (char *)objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", string, 4)) != 0)
          {
            +[HostWatcher invalidateWatcherForHost:](HostWatcher, "invalidateWatcherForHost:", string);

            goto LABEL_22;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          *(_WORD *)buf = 0;
          v12 = "Failed to create string.";
          break;
        case 3uLL:
          v15 = v6;
          remote_connection = xpc_dictionary_get_remote_connection(v15);
          v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
          v18 = v17;
          if (v17)
          {
            pid = xpc_connection_get_pid(v17);
            +[HostWatcher invalidateServiceWithPID:heartBeatRef:](HostWatcher, "invalidateServiceWithPID:heartBeatRef:", pid, xpc_dictionary_get_uint64(v15, "HB_PARAM_REF"));
          }

          goto LABEL_22;
        case 4uLL:
          v41 = 0;
          +[HostWatcher dumpConnectedHosts:](HostWatcher, "dumpConnectedHosts:", &v41);
          v21 = (char *)v41;
          v13 = v21;
          if (!v21 || !objc_msgSend(v21, "count"))
            goto LABEL_38;
          v40 = 0;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v13, 200, 0, &v40));
          v23 = v40;
          if (v22)
          {
            v20 = objc_retainAutorelease(v22);
            v24 = objc_msgSend(v20, "bytes");
            v25 = objc_msgSend(v20, "length");
            v26 = dispatch_get_global_queue(0, 0);
            v27 = objc_claimAutoreleasedReturnValue(v26);
            v28 = dispatch_data_create(v24, (size_t)v25, v27, &stru_10000C8D8);

            if (v28)
            {
              v29 = xpc_data_create_with_dispatch_data(v28);
              if (v29)
              {
                reply = xpc_dictionary_create_reply(v6);
                v31 = reply;
                if (reply)
                {
                  xpc_dictionary_set_value(reply, "HB_PARAM_OBJECT", v29);
                  xpc_connection_send_message(v4, v31);

                }
                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create xpc reply dictionary", buf, 2u);
                  }

                }
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create xpc data", buf, 2u);
                }

              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create dispatch data", buf, 2u);
              }

            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v43 = (char *)v23;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to serialize data: %{public}@", buf, 0xCu);
            }

LABEL_38:
            v20 = 0;
          }
          goto LABEL_23;
        default:
          v13 = xpc_copy_description(v6);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v43 = v13;
            v44 = 2048;
            v45 = uint64;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid command (%{public}s): %lld", buf, 0x16u);
          }
          if (!v13)
            goto LABEL_38;
          free(v13);
          goto LABEL_22;
      }
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v12 = "Invalid input(s).";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
LABEL_22:
    v20 = 0;
    v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

}

void sub_100007658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007678(uint64_t a1)
{
  HostWatcher *v2;
  HostWatcher *v3;
  NSObject *v4;
  HostWatcher *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  HostWatcher *v10;
  _QWORD block[4];
  HostWatcher *v12;

  v2 = -[HostWatcher initWithCheckinGoop:]([HostWatcher alloc], "initWithCheckinGoop:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  if (v2)
  {
    v4 = qword_100010C18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007788;
    block[3] = &unk_10000C4D0;
    v5 = v2;
    v12 = v5;
    dispatch_sync(v4, block);
    v6 = objc_claimAutoreleasedReturnValue(-[HostWatcher pingQueue](v5, "pingQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000078B8;
    v9[3] = &unk_10000C4D0;
    v10 = v5;
    dispatch_async(v6, v9);

  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void sub_100007788(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v2 = (void *)qword_100010C10;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hostID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hostID"));
      v9 = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Replacing old hostWatcher %{public}@ with %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v4, "invalidate");
  }
  v6 = *(void **)(a1 + 32);
  v7 = (void *)qword_100010C10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostID"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

id sub_1000078B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runWatcher");
}

void sub_1000078C0(id a1)
{
  mach_timebase_info((mach_timebase_info_t)&dword_100010C38);
}

void sub_1000078CC(id a1)
{
  qword_100010C50 = (uint64_t)sub_1000078F4(0, &qword_100010C58);
}

_DWORD *sub_1000078F4(int a1, _QWORD *a2)
{
  _UNKNOWN **v3;
  _UNKNOWN **v4;
  void *v5;
  void *v6;
  char *v7;
  _DWORD *v8;
  _DWORD *v9;
  void *v10;
  id v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15[8];
  uint8_t buf[2];
  __int16 v17;

  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v12 = "Invalid input.";
      v13 = (uint8_t *)&v17;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
    return 0;
  }
  v3 = &off_10000CD40;
  if (a1 != 1)
    v3 = 0;
  if (a1)
    v4 = v3;
  else
    v4 = &off_10000CD18;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 100, 0, 0));
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Failed to create data.";
      v13 = buf;
      goto LABEL_14;
    }
    return 0;
  }
  v6 = v5;
  v7 = (char *)objc_msgSend(v5, "length");
  v8 = malloc_type_malloc((size_t)(v7 + 4), 0x72A52E33uLL);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate buffer.", (uint8_t *)v15, 2u);
    }

    return 0;
  }
  v9 = v8;
  *v8 = bswap32(v7);
  v10 = v8 + 1;
  v11 = objc_retainAutorelease(v6);
  memcpy(v10, objc_msgSend(v11, "bytes"), (size_t)v7);
  *a2 = v7 + 4;

  return v9;
}

void sub_100007A90(id a1)
{
  qword_100010C68 = (uint64_t)sub_1000078F4(1, &qword_100010C70);
}

id sub_100007AB8(const sockaddr *a1)
{
  int v2;
  int *v3;
  char *v4;
  const char *v5;
  uint32_t v6;
  id v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  char *v12;
  char v13[16];
  __int128 v14;
  char v15[1025];

  bzero(v15, 0x401uLL);
  *(_OWORD *)v13 = 0u;
  v14 = 0u;
  if (getnameinfo(a1, a1->sa_len, v15, 0x401u, v13, 0x20u, 10))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return 0;
    v2 = *__error();
    v3 = __error();
    v4 = strerror(*v3);
    *(_DWORD *)buf = 67109378;
    v10 = v2;
    v11 = 2082;
    v12 = v4;
    v5 = "getnameinfo failed: %d (%{public}s)";
    v6 = 18;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
    return 0;
  }
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%s"), v15, v13);
  if (!v8)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_WORD *)buf = 0;
    v5 = "Failed to create string.";
    v6 = 2;
    goto LABEL_4;
  }
  return v8;
}

uint64_t sub_100007C24(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100007C2C(uint64_t a1)
{
  ssize_t v2;
  ssize_t v3;
  ssize_t v4;
  _BYTE *v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  int *v10;
  char *v11;
  const char *v12;
  uint32_t v13;
  int v14;
  int v15;
  int v16;
  __int16 v17;
  char *v18;
  _BYTE v19[32768];

  bzero(v19, 0x8000uLL);
  v2 = recv(*(_DWORD *)(a1 + 32), v19, 0x8000uLL, 0);
  if (v2 == -1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return;
    v9 = *__error();
    v10 = __error();
    v11 = strerror(*v10);
    v15 = 67109378;
    v16 = v9;
    v17 = 2082;
    v18 = v11;
    v12 = "Failed to receive kernel event message: %d (%{public}s)";
    v13 = 18;
    goto LABEL_20;
  }
  v3 = v2;
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = v19;
    while (v3 - v4 >= *(unsigned int *)&v19[v4])
    {
      if (v3 - v4 >= 80
        && *((_DWORD *)v5 + 1) == 1
        && *((_DWORD *)v5 + 2) == 1
        && *((_DWORD *)v5 + 3) == 4
        && *((_DWORD *)v5 + 5) == 1)
      {
        v6 = sub_100007AB8((const sockaddr *)(v5 + 52));
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (v7)
        {
          v8 = (void *)v7;
          +[HostWatcher cleanupClosedSocketForPeer:](HostWatcher, "cleanupClosedSocketForPeer:", v7);

        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to copy socket description.", (uint8_t *)&v15, 2u);
        }
      }
      v4 += *(unsigned int *)&v19[v4];
      v5 = &v19[v4];
      if (v4 >= v3)
        return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *((_DWORD *)v5 + 5);
      v15 = 67109120;
      v16 = v14;
      v12 = "Failed to process kernel event message (%d): buffer too small.";
      v13 = 8;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v13);
    }
  }
}

void sub_100007E78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100007E98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_100007EB0(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "servicesAwaitingClose"));
  objc_msgSend(v2, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "peerName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "servicesAwaitingClose"));
  sub_100007E98((void *)&_mh_execute_header, &_os_log_default, v3, "%lu remaining watchers for peer '%{public}@': %{public}@", v4, v5, v6, v7, 2u);

  sub_100007E88();
}

void sub_100007F7C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "hostID"));
  sub_100007E98((void *)&_mh_execute_header, &_os_log_default, v2, "lastPing was at %llu, now %llu, host %{public}@ is still alive", v3, v4, v5, v6, 2u);

  sub_100007E88();
}

void sub_10000802C(void *a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Services awaiting close for peer '%{public}@': %{public}@", buf, 0x16u);

}

void sub_100008098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007E78((void *)&_mh_execute_header, &_os_log_default, a3, "Power notification: kIOMessageSystemWillPowerOn", a5, a6, a7, a8, 0);
  sub_100007EA8();
}

void sub_1000080CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007E78((void *)&_mh_execute_header, &_os_log_default, a3, "Power notification: kIOMessageSystemHasPoweredOn", a5, a6, a7, a8, 0);
  sub_100007EA8();
}

void sub_100008100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007E78((void *)&_mh_execute_header, &_os_log_default, a3, "Power notification: kIOMessageSystemWillNotSleep", a5, a6, a7, a8, 0);
  sub_100007EA8();
}

void sub_100008134(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138543362;
  v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Initialized watch command: %{public}@", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_aboutToSleep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aboutToSleep");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addService:");
}

id objc_msgSend_addService_forHostID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addService:forHostID:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cleanupClosedSocketForPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupClosedSocketForPeer:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionOverride");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dumpConnectedHosts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpConnectedHosts:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateServices:");
}

id objc_msgSend_hasHeartbeatRef_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasHeartbeatRef:pid:");
}

id objc_msgSend_heartbeatRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heartbeatRef");
}

id objc_msgSend_hostClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostClient");
}

id objc_msgSend_hostID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostID");
}

id objc_msgSend_hostName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostName");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCheckinGoop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCheckinGoop:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithWatchCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWatchCommand:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateServiceWithPID_heartBeatRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateServiceWithPID:heartBeatRef:");
}

id objc_msgSend_invalidateWatcherForHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateWatcherForHost:");
}

id objc_msgSend_invalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidated");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_ldConn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ldConn");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lockdownSockConfirmedClosed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockdownSockConfirmedClosed");
}

id objc_msgSend_logService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logService:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_peerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerName");
}

id objc_msgSend_pingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pingQueue");
}

id objc_msgSend_pingSem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pingSem");
}

id objc_msgSend_powerConn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerConn");
}

id objc_msgSend_powerDownTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerDownTimer");
}

id objc_msgSend_powerLogForService_event_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerLogForService:event:");
}

id objc_msgSend_powerPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerPort");
}

id objc_msgSend_procExitSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "procExitSource");
}

id objc_msgSend_processWatchCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processWatchCommand:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_receiveMessage_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveMessage:size:");
}

id objc_msgSend_receivePacket_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivePacket:size:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeService:");
}

id objc_msgSend_removeService_forHostID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeService:forHostID:");
}

id objc_msgSend_sendPacket_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPacket:size:");
}

id objc_msgSend_serviceInstanceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceInstanceID");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceStartTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceStartTime");
}

id objc_msgSend_servicesAwaitingClose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "servicesAwaitingClose");
}

id objc_msgSend_setAboutToSleep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAboutToSleep:");
}

id objc_msgSend_setHostID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostID:");
}

id objc_msgSend_setInvalidated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidated:");
}

id objc_msgSend_setLdConn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLdConn:");
}

id objc_msgSend_setLockdownSockConfirmedClosed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockdownSockConfirmedClosed:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPowerConn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerConn:");
}

id objc_msgSend_setPowerNotifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerNotifier:");
}

id objc_msgSend_setPowerPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerPort:");
}

id objc_msgSend_setProcExitSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcExitSource:");
}

id objc_msgSend_setSleepHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSleepHandler:");
}

id objc_msgSend_setSleepTimerEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSleepTimerEnabled:");
}

id objc_msgSend_setSock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSock:");
}

id objc_msgSend_setSystemSleepNotificationProcessed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemSleepNotificationProcessed:");
}

id objc_msgSend_sleepHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepHandler");
}

id objc_msgSend_sleepTimerEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepTimerEnabled");
}

id objc_msgSend_sock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sock");
}

id objc_msgSend_systemSleepNotificationProcessed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemSleepNotificationProcessed");
}

id objc_msgSend_theirPID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "theirPID");
}

id objc_msgSend_watchedServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchedServices");
}

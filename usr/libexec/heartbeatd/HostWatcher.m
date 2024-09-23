@implementation HostWatcher

+ (void)cleanupClosedSocketForPeer:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = qword_100010C18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001EF0;
  block[3] = &unk_10000C4D0;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

+ (void)addService:(id)a3 forHostID:(__CFString *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  __CFString *v10;

  v5 = a3;
  v6 = qword_100010C18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002270;
  block[3] = &unk_10000C4F8;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  dispatch_sync(v6, block);

}

+ (void)removeService:(id)a3 forHostID:(__CFString *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  __CFString *v10;

  v5 = a3;
  v6 = qword_100010C18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002348;
  block[3] = &unk_10000C4F8;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  dispatch_sync(v6, block);

}

+ (void)invalidateWatcherForHost:(__CFString *)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[5];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100002580;
  v22 = sub_100002590;
  v23 = 0;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)v19[5];
  v19[5] = (uint64_t)v4;

  v6 = qword_100010C18;
  if (a3)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100002598;
    v17[3] = &unk_10000C520;
    v17[5] = a3;
    v7 = v17;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002614;
    block[3] = &unk_10000C570;
    v7 = block;
  }
  v7[4] = &v18;
  dispatch_sync(v6, v7);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = (id)v19[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "invalidate", (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v24, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v18, 8);
}

+ (void)invalidateServiceWithPID:(int)a3 heartBeatRef:(unint64_t)a4
{
  _QWORD v4[5];
  int v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000026E0;
  v4[3] = &unk_10000C5D0;
  v4[4] = a4;
  v5 = a3;
  dispatch_sync((dispatch_queue_t)qword_100010C18, v4);
}

+ (int)dumpConnectedHosts:(id *)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  int v9;
  _QWORD block[4];
  id v12;
  uint8_t buf[16];

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = v4;
  if (v4)
  {
    v6 = qword_100010C18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000290C;
    block[3] = &unk_10000C4D0;
    v7 = v4;
    v12 = v7;
    dispatch_sync(v6, block);

    v8 = objc_msgSend(v7, "count");
    v9 = 0;
    if (a3 && v8)
    {
      v9 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate array.", buf, 2u);
    }
    v9 = -1;
  }

  return v9;
}

- (int)sendPacket:(const char *)a3 size:(unint64_t)a4
{
  unint64_t v7;
  uint64_t v8;

  if (-[HostWatcher ldConn](self, "ldConn"))
  {
    v7 = 0;
    while (a4 > v7)
    {
      v8 = lockdown_send(-[HostWatcher ldConn](self, "ldConn"), &a3[v7], a4 - v7);
      v7 += v8;
      if (v8 == -1)
        return -1;
    }
    return 0;
  }
  else
  {
    *__error() = 22;
    return -1;
  }
}

- (int)receivePacket:(char *)a3 size:(unint64_t)a4
{
  unint64_t v7;
  uint64_t v8;

  if (-[HostWatcher ldConn](self, "ldConn"))
  {
    v7 = 0;
    while (a4 > v7)
    {
      v8 = lockdown_recv(-[HostWatcher ldConn](self, "ldConn"), &a3[v7], a4 - v7);
      v7 += v8;
      if (v8 <= 0)
        return -1;
    }
    return 0;
  }
  else
  {
    *__error() = 22;
    return -1;
  }
}

- (id)receiveMessage:(char *)a3 size:(unint64_t *)a4
{
  int v7;
  int *v8;
  char *v9;
  const char *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v17;
  char *v18;
  char *v19;
  int v20;
  int *v21;
  char *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  unsigned int v28;
  uint8_t buf[4];
  _BYTE v30[18];

  v28 = 0;
  if (!a3 || !a4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v10 = "Invalid inputs.";
LABEL_9:
    v11 = 2;
    goto LABEL_10;
  }
  if (-[HostWatcher receivePacket:size:](self, "receivePacket:size:", &v28, 4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *__error();
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v30 = v7;
      *(_WORD *)&v30[4] = 2082;
      *(_QWORD *)&v30[6] = v9;
      v10 = "Failed to read response message size: %d %{public}s";
LABEL_6:
      v11 = 18;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    }
LABEL_11:
    v12 = 0;
    v13 = 0;
    goto LABEL_12;
  }
  v17 = bswap32(v28);
  v28 = v17;
  if (v17 > 0x2000)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v28;
    v10 = "Message size of %d is too large.";
    v11 = 8;
    goto LABEL_10;
  }
  if (*a4 >= v17)
  {
    v19 = *a3;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v30 = v28;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Growing read buffer size to %d.", buf, 8u);
    }
    *a4 = v28;
    free(*a3);
    v18 = (char *)malloc_type_malloc(*a4, 0xB932DE92uLL);
    *a3 = v18;
    if (!v18)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v26 = *a4;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v30 = v26;
      v10 = "Failed to allocate buffer of size %ld.";
      v11 = 12;
      goto LABEL_10;
    }
    v19 = v18;
    v17 = v28;
  }
  if (-[HostWatcher receivePacket:size:](self, "receivePacket:size:", v19, v17))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v20;
    *(_WORD *)&v30[4] = 2082;
    *(_QWORD *)&v30[6] = v22;
    v10 = "Failed to read message: %d %{public}s";
    goto LABEL_6;
  }
  v23 = objc_alloc((Class)NSData);
  v24 = objc_msgSend(v23, "initWithBytes:length:", *a3, v28);
  if (!v24)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v10 = "Failed to allocate data.";
    goto LABEL_9;
  }
  v12 = v24;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v24, 0, 0, 0));
  v25 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v13, v25) & 1) != 0)
  {
    v14 = v13;
    v13 = v14;
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher hostID](self, "hostID"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v30 = v13;
    *(_WORD *)&v30[8] = 2114;
    *(_QWORD *)&v30[10] = v27;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid message (%{public}@) received from host %{public}@.", buf, 0x16u);

  }
LABEL_12:
  v14 = 0;
LABEL_13:
  v15 = v14;

  return v15;
}

- (void)invalidate
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id location;
  uint8_t buf[4];
  void *v10;

  objc_initWeak(&location, self);
  v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher hostID](self, "hostID"));
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalidating host watcher: %{public}@", buf, 0xCu);

  }
  -[HostWatcher setInvalidated:](self, "setInvalidated:", 1);
  v5 = qword_100010C08;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000310C;
  block[3] = &unk_10000C680;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)runWatcher
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_source_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  __int128 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  dispatch_time_t v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  const char *v18;
  const char *v19;
  id v20;
  int v21;
  int *v22;
  char *v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  _QWORD block[5];
  _QWORD handler[4];
  NSObject *v29;
  uint64_t *v30;
  id v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  size_t v38;
  uint8_t buf[4];
  _BYTE v40[18];

  v37 = 0;
  v38 = 256;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v36 = sub_100003AF8();
  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[HostWatcher pingQueue](self, "pingQueue"));
  dispatch_assert_queue_V2(v3);

  v37 = malloc_type_malloc(v38, 0xB0DBC2F8uLL);
  if (!v37)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Failed to allocate read buffer.";
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
LABEL_31:
    v10 = 0;
    v6 = 0;
LABEL_36:
    -[HostWatcher invalidate](self, "invalidate");
    goto LABEL_37;
  }
  if (qword_100010C48 != -1)
    dispatch_once(&qword_100010C48, &stru_10000C878);
  v4 = qword_100010C50;
  if (qword_100010C50)
  {
    v5 = qword_100010C58;
    goto LABEL_6;
  }
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
    || (*(_WORD *)buf = 0,
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to ping create message.", buf, 2u), (v4 = qword_100010C50) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Failed to allocate write buffer.";
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v5 = 0;
LABEL_6:
  v6 = dispatch_queue_create("com.apple.mobile.heartbeat.lastPing", 0);
  if (!v34[3])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Failed to allocate queue.";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
LABEL_35:
    v10 = 0;
    goto LABEL_36;
  }
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Failed to create timer.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  v8 = v7;
  v9 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v8, v9, 0x2540BE400uLL, 0x12A05F200uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003B64;
  handler[3] = &unk_10000C6A8;
  objc_copyWeak(&v31, &location);
  v30 = &v33;
  v10 = v8;
  v29 = v10;
  dispatch_source_set_event_handler(v10, handler);

  objc_destroyWeak(&v31);
  dispatch_resume(v10);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v40 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting loop for %{public}@", buf, 0xCu);
  }
  LODWORD(v12) = 0;
  *(_QWORD *)&v11 = 134218242;
  v24 = v11;
  while (!-[HostWatcher invalidated](self, "invalidated", v24) && !-[HostWatcher aboutToSleep](self, "aboutToSleep"))
  {
    if (-[HostWatcher sendPacket:size:](self, "sendPacket:size:", v4, v5))
    {
      v20 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *__error();
        v22 = __error();
        v23 = strerror(*v22);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v40 = v21;
        *(_WORD *)&v40[4] = 2082;
        *(_QWORD *)&v40[6] = v23;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send ping: %d %{public}s", buf, 0x12u);
      }

      LODWORD(v12) = 0;
      break;
    }
    v13 = objc_autoreleasePoolPush();
    v12 = objc_claimAutoreleasedReturnValue(-[HostWatcher receiveMessage:size:](self, "receiveMessage:size:", &v37, &v38));
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100003CAC;
      block[3] = &unk_10000C570;
      block[4] = &v33;
      dispatch_sync(v6, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v14 = v34[3];
        *(_DWORD *)buf = v24;
        *(_QWORD *)v40 = v14;
        *(_WORD *)&v40[8] = 2114;
        *(_QWORD *)&v40[10] = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received response at %llu: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive ping response.", buf, 2u);
    }

    objc_autoreleasePoolPop(v13);
    if (!v12)
      break;
    v15 = dispatch_time(0, 10000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue(global_queue);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100003CD8;
    v25[3] = &unk_10000C6D0;
    objc_copyWeak(&v26, &location);
    dispatch_after(v15, v17, v25);

    v12 = objc_claimAutoreleasedReturnValue(-[HostWatcher pingSem](self, "pingSem"));
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&v26);
    LODWORD(v12) = 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v40 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ended loop for %{public}@", buf, 0xCu);
  }
  dispatch_source_cancel(v10);
  if (!(_DWORD)v12)
    goto LABEL_36;
LABEL_37:
  if (v37)
    free(v37);
  v37 = 0;
  objc_destroyWeak(&location);

  _Block_object_dispose(&v33, 8);
}

- (void)handleSleepNotification:(unsigned int)a3 service:(unsigned int)a4 messageArgument:(void *)a5
{
  unint64_t v8;
  IOReturn v9;
  const char *v10;
  IOReturn v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void **v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46[2];
  _QWORD block[4];
  id v48;
  id location;
  uint8_t buf[4];
  unsigned int v51;

  objc_initWeak(&location, self);
  HIDWORD(v8) = a3;
  LODWORD(v8) = a3 + 536870288;
  switch((v8 >> 4))
  {
    case 0u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Power notification: kIOMessageCanSystemSleep", buf, 2u);
      }
      v9 = IOAllowPowerChange(-[HostWatcher powerConn](self, "powerConn"), (intptr_t)a5);
      if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v51 = v9;
        v10 = "IOAllowPowerChange failed: %08x";
        goto LABEL_17;
      }
      break;
    case 1u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Power notification: kIOMessageSystemWillSleep", buf, 2u);
      }
      if (-[HostWatcher systemSleepNotificationProcessed](self, "systemSleepNotificationProcessed"))
      {
        v11 = IOAllowPowerChange(-[HostWatcher powerConn](self, "powerConn"), (intptr_t)a5);
        if (v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v51 = v11;
          v10 = "IOAllowPowerChange failed: %08x";
          goto LABEL_17;
        }
      }
      else
      {
        -[HostWatcher setAboutToSleep:](self, "setAboutToSleep:", 1);
        v36 = objc_claimAutoreleasedReturnValue(-[HostWatcher pingSem](self, "pingSem"));
        dispatch_semaphore_signal(v36);

        v37 = qword_100010C18;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000414C;
        block[3] = &unk_10000C6D0;
        objc_copyWeak(&v48, &location);
        dispatch_sync(v37, block);
        v38 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher peerName](self, "peerName"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher servicesAwaitingClose](self, "servicesAwaitingClose"));
          sub_10000802C(v39, v40, buf);
        }

        v41 = objc_claimAutoreleasedReturnValue(-[HostWatcher pingQueue](self, "pingQueue"));
        v42 = _NSConcreteStackBlock;
        v43 = 3221225472;
        v44 = sub_100004238;
        v45 = &unk_10000C740;
        objc_copyWeak(v46, &location);
        v46[1] = a5;
        dispatch_sync(v41, &v42);

        -[HostWatcher setSystemSleepNotificationProcessed:](self, "setSystemSleepNotificationProcessed:", 1, v42, v43, v44, v45);
        objc_destroyWeak(v46);
        objc_destroyWeak(&v48);
      }
      break;
    case 2u:
      v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v12)
        sub_100008100(v12, v13, v14, v15, v16, v17, v18, v19);
      break;
    case 9u:
      v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v20)
        sub_1000080CC(v20, v21, v22, v23, v24, v25, v26, v27);
      break;
    case 0xBu:
      v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v28)
        sub_100008098(v28, v29, v30, v31, v32, v33, v34, v35);
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v51 = a3;
        v10 = "Unknown power notification: %d";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 8u);
      }
      break;
  }
  objc_destroyWeak(&location);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher descriptionOverride](self, "descriptionOverride"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher descriptionOverride](self, "descriptionOverride"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HostWatcher;
    v5 = -[HostWatcher description](&v7, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (HostWatcher)initWithCheckinGoop:(void *)a3
{
  char *v4;
  void *v5;
  int v6;
  int v7;
  char v8;
  const char *v9;
  uint32_t v10;
  const void *Value;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int socket;
  uint64_t securecontext;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  objc_class *v32;
  id v33;
  void *v34;
  io_connect_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  dispatch_queue_t v40;
  void *v41;
  dispatch_semaphore_t v42;
  void *v43;
  dispatch_source_t v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  char v52;
  IOReturn v53;
  IOReturn v54;
  uint64_t v55;
  const char *v57;
  _QWORD v58[4];
  id v59;
  _QWORD handler[4];
  id v61;
  uint8_t v62[8];
  objc_super v63;
  CFDictionaryRef theDict;
  uint8_t buf[4];
  char *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[2];
  _QWORD v70[2];

  v63.receiver = self;
  v63.super_class = (Class)HostWatcher;
  theDict = 0;
  v4 = -[HostWatcher init](&v63, "init");
  if (!v4)
  {
    v8 = 0;
    goto LABEL_48;
  }
  v69[0] = CFSTR("CheckinConnectionInfo");
  v69[1] = CFSTR("NoHeartBeat");
  v70[0] = a3;
  v70[1] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 2));
  v6 = secure_lockdown_checkin(v4 + 64, v5, &theDict);
  if (!v6)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("HostID"));
    v12 = objc_claimAutoreleasedReturnValue(Value);
    v13 = (void *)*((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 5) = v12;

    v14 = *((_QWORD *)v4 + 5);
    v15 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v16 = CFDictionaryGetValue(theDict, CFSTR("HostName"));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)*((_QWORD *)v4 + 6);
      *((_QWORD *)v4 + 6) = v17;

      v19 = *((_QWORD *)v4 + 6);
      v20 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
      {
        v21 = (void *)*((_QWORD *)v4 + 6);
        *((_QWORD *)v4 + 6) = CFSTR("Unknown host");

      }
      socket = lockdown_get_socket(*((_QWORD *)v4 + 8));
      *((_DWORD *)v4 + 6) = socket;
      if (socket == -1)
      {
        v8 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_47;
        *(_WORD *)buf = 0;
        v9 = "Invalid socket.";
      }
      else
      {
        v4[11] = 0;
        securecontext = lockdown_get_securecontext(*((_QWORD *)v4 + 8));
        *((_QWORD *)v4 + 16) = securecontext;
        if (!securecontext && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SSL not enabled on this connection.", buf, 2u);
        }
        v24 = objc_alloc_init((Class)NSMutableSet);
        v25 = (void *)*((_QWORD *)v4 + 9);
        *((_QWORD *)v4 + 9) = v24;

        if (*((_QWORD *)v4 + 9))
        {
          v26 = objc_alloc_init((Class)NSMutableArray);
          v27 = (void *)*((_QWORD *)v4 + 10);
          *((_QWORD *)v4 + 10) = v26;

          if (*((_QWORD *)v4 + 10))
          {
            if (sub_100001CA0(*((_DWORD *)v4 + 6)))
            {
              v28 = sub_10000520C(*((_DWORD *)v4 + 6));
              v29 = objc_claimAutoreleasedReturnValue(v28);
              v30 = (void *)*((_QWORD *)v4 + 7);
              *((_QWORD *)v4 + 7) = v29;

              if (*((_QWORD *)v4 + 7))
              {
                v31 = objc_alloc((Class)NSString);
                v32 = (objc_class *)objc_opt_class(v4);
                v33 = objc_msgSend(v31, "initWithFormat:", CFSTR("<%s: %p> [%@ %@ '%@'] [fd=%d]"), class_getName(v32), v4, *((_QWORD *)v4 + 5), *((_QWORD *)v4 + 7), *((_QWORD *)v4 + 6), *((unsigned int *)v4 + 6));
                v34 = (void *)*((_QWORD *)v4 + 11);
                *((_QWORD *)v4 + 11) = v33;

                if (*((_QWORD *)v4 + 11))
                {
                  v35 = IORegisterForSystemPower(v4, (IONotificationPortRef *)v4 + 15, (IOServiceInterestCallback)sub_1000052D0, (io_object_t *)v4 + 5);
                  *((_DWORD *)v4 + 4) = v35;
                  if (v35)
                  {
                    v36 = objc_alloc((Class)NSString);
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hostID"));
                    v38 = objc_msgSend(v36, "initWithFormat:", CFSTR("com.apple.mobile.heartbeat.pingQueue.%@"), v37);

                    if (v38)
                    {
                      v39 = objc_retainAutorelease(v38);
                      v40 = dispatch_queue_create((const char *)objc_msgSend(v39, "UTF8String"), 0);
                      v41 = (void *)*((_QWORD *)v4 + 12);
                      *((_QWORD *)v4 + 12) = v40;

                      if (*((_QWORD *)v4 + 12))
                      {
                        v42 = dispatch_semaphore_create(0);
                        v43 = (void *)*((_QWORD *)v4 + 13);
                        *((_QWORD *)v4 + 13) = v42;

                        if (*((_QWORD *)v4 + 13))
                        {
                          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v4 + 15), (dispatch_queue_t)qword_100010C08);
                          objc_initWeak((id *)buf, v4);
                          v44 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100010C08);
                          v45 = (void *)*((_QWORD *)v4 + 14);
                          *((_QWORD *)v4 + 14) = v44;

                          v46 = *((_QWORD *)v4 + 14);
                          if (v46)
                          {
                            dispatch_source_set_timer(v46, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
                            v47 = *((_QWORD *)v4 + 14);
                            handler[0] = _NSConcreteStackBlock;
                            handler[1] = 3221225472;
                            handler[2] = sub_1000052DC;
                            handler[3] = &unk_10000C6D0;
                            objc_copyWeak(&v61, (id *)buf);
                            dispatch_source_set_event_handler(v47, handler);
                            v48 = *((_QWORD *)v4 + 14);
                            v58[0] = _NSConcreteStackBlock;
                            v58[1] = 3221225472;
                            v58[2] = sub_100005428;
                            v58[3] = &unk_10000C6D0;
                            objc_copyWeak(&v59, (id *)buf);
                            dispatch_source_set_cancel_handler(v48, v58);
                            dispatch_resume(*((dispatch_object_t *)v4 + 14));
                            objc_destroyWeak(&v59);
                            objc_destroyWeak(&v61);
                            objc_destroyWeak((id *)buf);
                            v49 = os_transaction_create("com.apple.mobile.heartbeat");
                            v50 = (void *)*((_QWORD *)v4 + 4);
                            *((_QWORD *)v4 + 4) = v49;

                            v51 = *((_QWORD *)v4 + 11);
                            v67 = *((_QWORD *)v4 + 5);
                            v68 = v51;
                            sub_100001E18(CFSTR("com.apple.heartbeatd.host.attached"), (const __CFDictionary *)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138543362;
                              v66 = v4;
                              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initialized host watcher: %{public}@", buf, 0xCu);
                            }

                            v8 = 1;
                            goto LABEL_47;
                          }
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)v62 = 0;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create timer.", v62, 2u);
                          }
                          objc_destroyWeak((id *)buf);
                          goto LABEL_71;
                        }
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          v57 = "Failed to create ping semaphore.";
                          goto LABEL_67;
                        }
                      }
                      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        v57 = "Failed to allocate queue.";
LABEL_67:
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v57, buf, 2u);
                      }
LABEL_71:

                      goto LABEL_46;
                    }
                    v8 = 0;
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_47;
                    *(_WORD *)buf = 0;
                    v9 = "Failed to create string.";
                  }
                  else
                  {
                    v8 = 0;
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_47;
                    *(_WORD *)buf = 0;
                    v9 = "Failed to register for system power notifications.";
                  }
                }
                else
                {
                  v8 = 0;
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_47;
                  *(_WORD *)buf = 0;
                  v9 = "Failed to create string.";
                }
              }
              else
              {
                v8 = 0;
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_47;
                *(_WORD *)buf = 0;
                v9 = "Failed to get _peerName from socket.";
              }
            }
            else
            {
              v8 = 0;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                goto LABEL_47;
              *(_WORD *)buf = 0;
              v9 = "Failed setting _sock options";
            }
          }
          else
          {
            v8 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_47;
            *(_WORD *)buf = 0;
            v9 = "Failed to create set.";
          }
        }
        else
        {
          v8 = 0;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_47;
          *(_WORD *)buf = 0;
          v9 = "Failed to create set.";
        }
      }
    }
    else
    {
      v8 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v9 = "Checkin info did not contain host ID.";
    }
    v10 = 2;
    goto LABEL_45;
  }
  v7 = v6;
  v8 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v66) = v7;
    v9 = "Failed to checkin: %d";
    v10 = 8;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
LABEL_46:
    v8 = 0;
  }
LABEL_47:

LABEL_48:
  if (theDict)
    CFRelease(theDict);
  theDict = 0;
  if (v4)
    v52 = v8;
  else
    v52 = 1;
  if ((v52 & 1) == 0)
  {
    if (*((_DWORD *)v4 + 4))
    {
      v53 = IODeregisterForSystemPower((io_object_t *)v4 + 5);
      if (v53)
      {
        v54 = v53;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v66) = v54;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODeregisterForSystemPower failed: %08x", buf, 8u);
        }
      }
      IONotificationPortDestroy(*((IONotificationPortRef *)v4 + 15));
      IOServiceClose(*((_DWORD *)v4 + 4));
      *((_QWORD *)v4 + 15) = 0;
      *((_QWORD *)v4 + 2) = 0;
    }
    v55 = *((_QWORD *)v4 + 8);
    if (v55)
    {
      lockdown_disconnect(v55);
      *((_QWORD *)v4 + 8) = 0;
    }

    return 0;
  }
  return (HostWatcher *)v4;
}

- (void)dealloc
{
  void *v3;
  _lockdown_connection *ldConn;
  IOReturn v5;
  IOReturn v6;
  OS_dispatch_source *powerDownTimer;
  objc_super v8;
  uint8_t buf[4];
  HostWatcher *v10;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deallocating host watcher: %{public}@", buf, 0xCu);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_10000C780);

  ldConn = self->_ldConn;
  if (ldConn)
    lockdown_disconnect(ldConn);
  if (self->_powerConn)
  {
    v5 = IODeregisterForSystemPower(&self->_powerNotifier);
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v10) = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODeregisterForSystemPower failed: %08x", buf, 8u);
      }
    }
    IONotificationPortDestroy(self->_powerPort);
    IOServiceClose(self->_powerConn);
  }
  powerDownTimer = self->_powerDownTimer;
  if (powerDownTimer)
    dispatch_source_cancel((dispatch_source_t)powerDownTimer);
  v8.receiver = self;
  v8.super_class = (Class)HostWatcher;
  -[HostWatcher dealloc](&v8, "dealloc");
}

- (void)powerLogForService:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  const char *v21;
  uint8_t v22[8];
  _QWORD v23[5];
  _QWORD v24[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)v22 = 0;
    v21 = "Invalid argument(s).";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    goto LABEL_14;
  }
  v9 = objc_alloc((Class)NSMutableDictionary);
  v23[0] = CFSTR("HostName");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher hostName](self, "hostName"));
  v24[0] = v10;
  v23[1] = CFSTR("HostClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostClient"));
  v24[1] = v11;
  v23[2] = CFSTR("Service");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
  v24[2] = v12;
  v23[3] = CFSTR("ServiceInstanceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceInstanceID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
  v23[4] = CFSTR("Transport");
  v24[3] = v14;
  v24[4] = CFSTR("network");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 5));
  v16 = objc_msgSend(v9, "initWithDictionary:", v15);

  if (!v16)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)v22 = 0;
    v21 = "Failed to create dictionary.";
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("com.apple.mobile.heartbeat.ServiceStop")))
  {
    v17 = TMGetKernelMonotonicClock();
    if (v17 <= 0.0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query monotonic clock time.", v22, 2u);
      }
      goto LABEL_8;
    }
    v18 = v17;
    objc_msgSend(v6, "serviceStartTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18 - v19));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("DurationSeconds"));

  }
  PLLogRegisteredEvent(119, v8, v16, 0);
LABEL_8:

LABEL_14:
}

- (void)addService:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  if (v5)
  {
    -[HostWatcher powerLogForService:event:](self, "powerLogForService:event:", v5, CFSTR("com.apple.mobile.heartbeat.ServiceStart"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)removeService:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  if (v5)
  {
    -[HostWatcher powerLogForService:event:](self, "powerLogForService:event:", v5, CFSTR("com.apple.mobile.heartbeat.ServiceStop"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
    objc_msgSend(v4, "removeObject:", v5);

  }
}

- (void)enumerateServices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005A40;
  v7[3] = &unk_10000C7A8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (NSString)hostID
{
  return self->_hostID;
}

- (void)setHostID:(id)a3
{
  objc_storeStrong((id *)&self->_hostID, a3);
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
  objc_storeStrong((id *)&self->_hostName, a3);
}

- (NSString)peerName
{
  return self->_peerName;
}

- (void)setPeerName:(id)a3
{
  objc_storeStrong((id *)&self->_peerName, a3);
}

- (_lockdown_connection)ldConn
{
  return self->_ldConn;
}

- (void)setLdConn:(_lockdown_connection *)a3
{
  self->_ldConn = a3;
}

- (NSMutableSet)watchedServices
{
  return self->_watchedServices;
}

- (void)setWatchedServices:(id)a3
{
  objc_storeStrong((id *)&self->_watchedServices, a3);
}

- (NSMutableArray)servicesAwaitingClose
{
  return self->_servicesAwaitingClose;
}

- (void)setServicesAwaitingClose:(id)a3
{
  objc_storeStrong((id *)&self->_servicesAwaitingClose, a3);
}

- (NSString)descriptionOverride
{
  return self->_descriptionOverride;
}

- (void)setDescriptionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionOverride, a3);
}

- (OS_dispatch_queue)pingQueue
{
  return self->_pingQueue;
}

- (void)setPingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pingQueue, a3);
}

- (OS_dispatch_semaphore)pingSem
{
  return self->_pingSem;
}

- (void)setPingSem:(id)a3
{
  objc_storeStrong((id *)&self->_pingSem, a3);
}

- (OS_dispatch_source)powerDownTimer
{
  return self->_powerDownTimer;
}

- (void)setPowerDownTimer:(id)a3
{
  objc_storeStrong((id *)&self->_powerDownTimer, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)aboutToSleep
{
  return self->_aboutToSleep;
}

- (void)setAboutToSleep:(BOOL)a3
{
  self->_aboutToSleep = a3;
}

- (BOOL)sleepTimerEnabled
{
  return self->_sleepTimerEnabled;
}

- (void)setSleepTimerEnabled:(BOOL)a3
{
  self->_sleepTimerEnabled = a3;
}

- (IONotificationPort)powerPort
{
  return self->_powerPort;
}

- (void)setPowerPort:(IONotificationPort *)a3
{
  self->_powerPort = a3;
}

- (unsigned)powerConn
{
  return self->_powerConn;
}

- (void)setPowerConn:(unsigned int)a3
{
  self->_powerConn = a3;
}

- (unsigned)powerNotifier
{
  return self->_powerNotifier;
}

- (void)setPowerNotifier:(unsigned int)a3
{
  self->_powerNotifier = a3;
}

- (int)sock
{
  return self->_sock;
}

- (void)setSock:(int)a3
{
  self->_sock = a3;
}

- (BOOL)lockdownSockConfirmedClosed
{
  return self->_lockdownSockConfirmedClosed;
}

- (void)setLockdownSockConfirmedClosed:(BOOL)a3
{
  self->_lockdownSockConfirmedClosed = a3;
}

- (SSLContext)sslCtx
{
  return self->_sslCtx;
}

- (void)setSslCtx:(SSLContext *)a3
{
  self->_sslCtx = a3;
}

- (id)sleepHandler
{
  return self->_sleepHandler;
}

- (void)setSleepHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)systemSleepNotificationProcessed
{
  return self->_systemSleepNotificationProcessed;
}

- (void)setSystemSleepNotificationProcessed:(BOOL)a3
{
  self->_systemSleepNotificationProcessed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sleepHandler, 0);
  objc_storeStrong((id *)&self->_powerDownTimer, 0);
  objc_storeStrong((id *)&self->_pingSem, 0);
  objc_storeStrong((id *)&self->_pingQueue, 0);
  objc_storeStrong((id *)&self->_descriptionOverride, 0);
  objc_storeStrong((id *)&self->_servicesAwaitingClose, 0);
  objc_storeStrong((id *)&self->_watchedServices, 0);
  objc_storeStrong((id *)&self->_peerName, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_hostID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end

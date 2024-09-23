void sub_1000017C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100001880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_100001948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100001A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t start(int a1, char *const *a2)
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;
  char *v9;
  MailqUserAgent *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  size_t v16;
  const char *v17;
  void *v18;
  size_t size;
  int v20[4];
  uint64_t v21;

  v4 = objc_autoreleasePoolPush();
  if (!getuid())
  {
    printf("Error: %s\n", "must run as a non-root user");
    exit(1);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentUser"));
  v7 = objc_msgSend(v6, "uid");
  if (v7 != getuid())
  {

    goto LABEL_9;
  }
  v21 = 0;
  *(_OWORD *)v20 = xmmword_100016D18;
  size = 0xAAAAAAAAAAAAAAAALL;
  v8 = sysctl(v20, 3u, 0, &size, 0, 0);
  if (v8)
    goto LABEL_6;
  v9 = (char *)malloc_type_malloc(size, 0x14C1F800uLL);
  v8 = sysctl(v20, 3u, v9, &size, 0, 0);
  if (v8)
  {
    free(v9);
LABEL_6:

    if (v8 > 0)
      goto LABEL_30;
    goto LABEL_9;
  }
  if (size >= 0x288)
  {
    v16 = size / 0x288;
    v17 = v9 + 243;
    while (*(int *)(v17 - 203) < 1 || strncmp("MobileMail", v17, 0x10uLL))
    {
      v17 += 648;
      if (!--v16)
        goto LABEL_26;
    }
    free(v9);

LABEL_30:
    printf("Error: %s\n", "process MobileMail is running");
    exit(1);
  }
LABEL_26:
  free(v9);

LABEL_9:
  v10 = objc_alloc_init(MailqUserAgent);
  MFSetUserAgent();
LABEL_10:

  while (1)
  {
    while (1)
    {
      v11 = getopt_long(a1, a2, "prh", (const option *)&off_10001E900, 0);
      if (v11 <= 103)
        break;
      switch(v11)
      {
        case 'r':
          v10 = (MailqUserAgent *)objc_claimAutoreleasedReturnValue(+[MFUserSyncStakeholder sharedStakeholder](MFUserSyncStakeholder, "sharedStakeholder"));
          -[MailqUserAgent processQueueAndExit](v10, "processQueueAndExit");
          goto LABEL_10;
        case 'h':
          sub_100001E0C();
          exit(0);
        case 'p':
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[MFUserSyncStakeholder sharedStakeholder](MFUserSyncStakeholder, "sharedStakeholder"));
          objc_msgSend(v18, "printDeliveryQueue");

          exit(0);
      }
    }
    if (v11 == -1)
      break;
    if (v11 == 63)
    {
      sub_100001E0C();
      exit(1);
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v13 = objc_msgSend(objc_alloc((Class)MFAttachmentLibraryManager), "initWithPrimaryLibrary:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFUserSyncStakeholder sharedStakeholder](MFUserSyncStakeholder, "sharedStakeholder"));
  CFRunLoopRun();

  objc_autoreleasePoolPop(v4);
  return 1;
}

void sub_100001DC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100001E0C()
{
  void *v0;
  void *v1;
  id v2;
  id v3;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v0 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "processName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("usage: %@ [--print] [--run] [--help]\n"), v0));

  v3 = objc_retainAutorelease(v1);
  printf("%s", (const char *)objc_msgSend(v3, "UTF8String"));

}

void sub_100001EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100001F30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000219C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100002470(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_100002578(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000285C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000028BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000294C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000029D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002A5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002AAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100002B28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002BB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002C38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002D60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_100002E18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100002FF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000030DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100003148(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000031B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100003280(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100003400(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_10001EB68;
  qword_10001EB68 = (uint64_t)v2;

}

void sub_10000345C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000034E4(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_10001EB78;
  qword_10001EB78 = (uint64_t)v2;

}

void sub_100003540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100003AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100003B80(uint64_t a1, void *a2)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = v2[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D10;
  block[3] = &unk_100018618;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void sub_100003BF8(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  objc_msgSend(*(id *)(a1 + 32), "_freeSpaceStatusDidChange:", 0);
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[12])
  {
    v3 = v2[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003C80;
    block[3] = &unk_100018618;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

id sub_100003C80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCounts");
}

void sub_100003CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)MFDeliveryQueue;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100003D98(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10001EB90;
  qword_10001EB90 = (uint64_t)v1;

}

void sub_100003E20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100003F1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  DeliveryOptions *v9;
  __int16 v10;
  __int16 v11;
  uint8_t buf[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 == 2)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v11 = 0;
    v7 = "ignoring request to process queue: state is 'suspended'";
    v8 = (uint8_t *)&v11;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_13;
  }
  if (v3 == 1)
  {
    *(_BYTE *)(v2 + 56) |= 1u;
    v6 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v10 = 0;
    v7 = "ignoring request to process queue: state is 'processing'";
    v8 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  if (v3)
    return;
  objc_msgSend((id)v2, "_updateCounts");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 32))
  {
    *(_QWORD *)(v4 + 24) = 1;
    v9 = objc_alloc_init(DeliveryOptions);
    -[DeliveryOptions setPlaySound:](v9, "setPlaySound:", *(unsigned __int8 *)(a1 + 40));
    -[DeliveryOptions setForceAll:](v9, "setForceAll:", *(unsigned __int8 *)(a1 + 41));
    -[DeliveryOptions setIsUserRequested:](v9, "setIsUserRequested:", *(unsigned __int8 *)(a1 + 42));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation mf_invocationWithSelector:target:object:](MFMonitoredInvocation, "mf_invocationWithSelector:target:object:", "_processQueueWithOptions:", *(_QWORD *)(a1 + 32), v9));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addInvocation:", v5);

    return;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "processQueue: queue is empty (no messages from active accounts)";
    v8 = buf;
    goto LABEL_12;
  }
LABEL_13:

}

void sub_1000040C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000413C(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  switch(v1)
  {
    case 2:
      v4 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ignoring suspend request, we are already suspended", v6, 2u);
      }

      break;
    case 1:
      v5 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "request suspending delivery queue", v7, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) |= 2u;
      break;
    case 0:
      v3 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "suspending delivery queue", buf, 2u);
      }

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 2;
      break;
  }
}

void sub_1000042DC(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 24) == 2 && *(_QWORD *)(v1 + 96))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "resuming delivery queue", v4, 2u);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
}

void sub_10000445C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100004534(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000045E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000046E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000047BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100005220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_10000547C(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;

  if (!a2 && *(_QWORD *)(a1 + 32))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Delivery succeeded, will delete message from Outbox with outboxCopy: %@", buf, 0xCu);
    }

    v5 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    objc_msgSend(v5, "deleteMessages:moveToTrash:", v6, 0);

  }
}

void sub_10000556C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000058A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

double sub_1000059A8(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;

  if (!a1)
    return 0.0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", EMUserDefaultUndoSendDelayTime));

  if (v2)
    v3 = (double)(uint64_t)objc_msgSend(v2, "integerValue");
  else
    v3 = 10.0;

  return v3;
}

void sub_100005A2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100005A48(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 64));
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100005D58;
  v19 = sub_100005D68;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005D70;
  v10[3] = &unk_1000186B8;
  v10[4] = &v15;
  v10[5] = &v11;
  sub_100005DE4(WeakRetained, v10);
  -[os_unfair_lock_s notifyObserversOfDelayedMessagesDidChange:](WeakRetained, "notifyObserversOfDelayedMessagesDidChange:", *((_BYTE *)v12 + 24) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[os_unfair_lock_s _outboxStore](WeakRetained, "_outboxStore"));
  if (v16[5] == *(_QWORD *)(a1 + 32))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[os_unfair_lock_s _deliverSynchronously:outboxCopy:](WeakRetained, "_deliverSynchronously:outboxCopy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 48);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_msgSend(v3, "deleteMessages:moveToTrash:", v4, 0);

    v5 = objc_msgSend(objc_alloc((Class)EMMessageDeliveryResult), "initWithStatus:error:", 4, 0);
  }
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFPowerController sharedInstance](MFPowerController, "sharedInstance"));
  objc_msgSend(v7, "releaseAssertionWithIdentifier:", CFSTR("com.apple.message.delivery"));

  if (objc_msgSend(v6, "status") == (id)9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setRetryCount:", (char *)objc_msgSend(*(id *)(a1 + 40), "retryCount") + 1);
    v8 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "retryCount");
      *(_DWORD *)buf = 134217984;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Retry message delivery. Retry count: %ld", buf, 0xCu);
    }

    -[os_unfair_lock_s deliverAsynchronously:completion:](WeakRetained, "deliverAsynchronously:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

}

void sub_100005CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_100005D58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005D68(uint64_t a1)
{

}

void sub_100005D70(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_removeFirst"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "ef_isEmpty");
}

void sub_100005DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100005DE4(os_unfair_lock_s *a1, void *a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = a2;
  if (a1)
  {
    v3 = a1 + 13;
    os_unfair_lock_lock(a1 + 13);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[os_unfair_lock_s delayedMessages](a1, "delayedMessages"));
    v5[2](v5, v4);

    os_unfair_lock_unlock(v3);
  }

}

void sub_100005E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_s *v10;
  void *v11;

  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

id sub_100005E80(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

void sub_10000607C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose((const void *)(v23 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100006100(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_popElement"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "ef_isEmpty");
}

void sub_100006160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000062B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006484(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL sub_100006520(id a1, MFMailMessage *a2)
{
  return ((unint64_t)-[MFMailMessage messageFlags](a2, "messageFlags") >> 37) & 1;
}

void sub_1000065BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100006668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100006748(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000685C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_100006968(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100006D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100007088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1000074B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100007608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id sub_100007650(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagePersistence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deliveryInfoForMessage:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v3, v5));
  return v6;
}

void sub_1000076C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

int64_t sub_1000076F4(id a1, EFPair *a2, EFPair *a3)
{
  EFPair *v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EFPair second](a2, "second"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EFPair second](v4, "second"));
  v7 = objc_msgSend(v5, "messageSize");
  if (v7 >= objc_msgSend(v6, "messageSize"))
  {
    v9 = objc_msgSend(v5, "messageSize");
    if (v9 <= objc_msgSend(v6, "messageSize"))
      v8 = 0;
    else
      v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void sub_100007790(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

MFLibraryMessage *__cdecl sub_1000077B8(id a1, EFPair *a2)
{
  return (MFLibraryMessage *)(id)objc_claimAutoreleasedReturnValue(-[EFPair first](a2, "first"));
}

void sub_100007988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100007C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100007D34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100007EC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000088CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{

  _Unwind_Resume(a1);
}

void sub_100008B14(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a2)
  {
    v2 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
    objc_msgSend(v2, "deleteMessages:moveToTrash:", v3, 0);

  }
}

void sub_100008B9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_100008C6C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id result;
  uint64_t v5;
  uint8_t v6[16];

  v2 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "processing queue did finish", v6, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 56) & 2) != 0)
  {
    *(_QWORD *)(v3 + 24) = 2;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) &= ~2u;
  }
  else
  {
    *(_QWORD *)(v3 + 24) = 0;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_updateCounts");
  v5 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v5 + 56) & 1) != 0)
  {
    *(_BYTE *)(v5 + 56) &= ~1u;
    return objc_msgSend(*(id *)(a1 + 32), "processQueue");
  }
  return result;
}

id sub_100008DA8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;

  v2 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "change in mail accounts detected: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_updateCounts");
  return objc_msgSend(*(id *)(a1 + 40), "processQueue");
}

void sub_100008EE0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", MailMessageStoreChangedFlagsKey));

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MessageIsDeleted));
  v5 = (void *)v4;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) != 1 && v4 != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "detected deleted flag change of outbox message(s), will updateCounts", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_updateCounts");
  }

}

void sub_100008FC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_100009048(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "detected new outbox message(s)", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateCounts");
}

void sub_100009170(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000918C(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CPNetworkObserverReachable));
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = 4;
  else
    v4 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 0xFB | v4;

  v5 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56) >> 2) & 1;
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "detected change in network reachability: %d", (uint8_t *)v7, 8u);
  }

}

void sub_10000929C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100009368(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL sub_100009384(id a1, MFLibraryMessage *a2)
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFLibraryMessage mailbox](a2, "mailbox"));
  v3 = objc_msgSend(v2, "type") == (id)6;

  return v3;
}

void sub_1000093C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1000093D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCounts");
}

void sub_100009474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id sub_100009498(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 40), "numberOfPendingMessagesChanged:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

void sub_1000094D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100009584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1000095A8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers"));
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void sub_1000095E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100009674(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100009684(uint64_t a1)
{
  void *v2;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), "numberOfPendingMessagesChanged:", *(_QWORD *)(a1 + 40));
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void sub_100009778(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100009814(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100009824(uint64_t a1)
{
  void *v2;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "observers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), "hasDelayedMessagesDidChange:", *(unsigned __int8 *)(a1 + 40));
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void sub_100009918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000099D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_100009B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_100009BA0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagePersistence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deliveryInfoForMessage:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -- %@"), v3, v5));
  return v6;
}

void sub_100009C24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100009D10(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v2 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue log](MFDeliveryQueue, "log"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "locale change detected", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void sub_100009DD0(id a1)
{
  MFDiskFreeSpaceMonitor *v1;
  void *v2;

  v1 = objc_alloc_init(MFDiskFreeSpaceMonitor);
  v2 = (void *)qword_10001EBB0;
  qword_10001EBB0 = (uint64_t)v1;

}

void sub_100009FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id sub_10000A008(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrieveFreeSpaceStatus:", 0);
}

void sub_10000A098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000A2D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000A3A0(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v7 = 0;
  v3 = objc_msgSend(v2, "_retrieveFreeSpaceStatus:", &v7);
  v4 = v7;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (v3)
      v6 = 0;
    else
      v6 = v4;
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v3, v6);
  }

}

void sub_10000A410(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000A5D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000A688(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000A9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

NSArray *__cdecl sub_10000AA70(id a1, MailAccount *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount allMailboxUids](a2, "allMailboxUids"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_map:", &stru_1000189E8));

  return (NSArray *)v3;
}

void sub_10000AAB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10000AAC4(id a1, MFMailboxUid *a2)
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFMailboxUid fullPath](a2, "fullPath"));
}

uint64_t sub_10000AAE0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *a4;
  return result;
}

void sub_10000AB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000AD14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000AEA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000B0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Block_object_dispose((const void *)(v33 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000B110(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", NSFileSize));
  v8 = objc_msgSend(v7, "integerValue");

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v8;
  if (objc_msgSend(v10, "rangeOfString:", CFSTR("/Attachments/")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v10, "rangeOfString:", CFSTR("/Messages/")) == (id)0x7FFFFFFFFFFFFFFFLL)
      v9 = a1[7];
    else
      v9 = a1[6];
  }
  else
  {
    v9 = a1[5];
  }
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) += v8;

}

void sub_10000B1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000B298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B2B0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSFileReferenceCount));
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == (id)1)
    v6 = objc_msgSend(v7, "fileSize");
  else
    v6 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6;

}

void sub_10000B338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000B4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B50C()
{
  JUMPOUT(0x10000B4F8);
}

void sub_10000B514(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileCreationDate"));
  if (objc_msgSend(v6, "ef_isEarlierThanDate:", *(_QWORD *)(a1 + 32)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSFileSize));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v7, "longLongValue");

    objc_msgSend(*(id *)(a1 + 40), "removeItemAtPath:error:", v8, 0);
  }

}

void sub_10000B5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10000B678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B690(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSFileReferenceCount));
  v7 = objc_msgSend(v6, "integerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = objc_msgSend(v8, "removeItemAtPath:error:", v12, 0);

  if (v7 == (id)1)
    v10 = v9;
  else
    v10 = 0;
  if (v10 == 1)
    v11 = objc_msgSend(v5, "fileSize");
  else
    v11 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v11;

}

void sub_10000B764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000B900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000B968(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileModificationDate"));
  v7 = objc_msgSend(v6, "ef_isEarlierThanDate:", *(_QWORD *)(a1 + 32));

  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10000B9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000BA2C(id a1, NSFileManager *a2, NSString *a3, NSDictionary *a4, BOOL *a5)
{
  -[NSFileManager removeItemAtPath:error:](a2, "removeItemAtPath:error:", a3, 0, a5);
}

void sub_10000BA44(id a1, NSFileManager *a2, NSString *a3, NSDictionary *a4, BOOL *a5)
{
  NSString *v6;
  NSFileManager *v7;

  v7 = a2;
  v6 = a3;
  if (-[NSString hasSuffix:](v6, "hasSuffix:", CFSTR("/Messages")))
    -[NSFileManager removeItemAtPath:error:](v7, "removeItemAtPath:error:", v6, 0);

}

void sub_10000BAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000BB34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000BF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  void *v39;
  void *v40;

  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_10000C078(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[24];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = 0;
  v5 = (unint64_t)objc_msgSend(v4, "mf_sizeForDirectoryAtURL:error:", v3, &v11);
  v6 = v11;

  if ((v5 & 0x8000000000000000) != 0)
  {
    v7 = objc_msgSend(v6, "code");
    if (v7 != (id)2)
    {
      v8 = MFLogGeneral(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
        sub_10000D6D0((uint64_t)v3, v10, buf, v9);
      }

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v5;
  }

}

void sub_10000C18C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000C2BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000C45C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000C724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10000C9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000CBAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000CEC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10000CF50(id a1)
{
  MFUserSyncStakeholder *v1;
  void *v2;
  id v3;

  v1 = objc_opt_new(MFUserSyncStakeholder);
  v2 = (void *)qword_10001EBB8;
  qword_10001EBB8 = (uint64_t)v1;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  objc_msgSend(v3, "registerUserSyncStakeholder:withMachServiceName:", qword_10001EBB8, CFSTR("com.apple.mailq.sync.xpc"));

}

void sub_10000CFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000D070(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000D274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000D340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000D3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_10000D430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000D520(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000D5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000D624(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "message delivery failed with error: %{public}@", buf, 0xCu);

}

void sub_10000D67C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to retrieve free space with error: %{public}@", buf, 0xCu);

}

void sub_10000D6D0(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#PurgeableStorage Failed to compute size for %@ with error %{public}@", buf, 0x16u);

}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLString");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__append_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_append:flags:");
}

id objc_msgSend__criterionForFilterType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_criterionForFilterType:");
}

id objc_msgSend__criterionForMessagesFromMailbox_param_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_criterionForMessagesFromMailbox:param:");
}

id objc_msgSend__criterionForMessagesFromMailboxes_param_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_criterionForMessagesFromMailboxes:param:");
}

id objc_msgSend__deliverSynchronously_outboxCopy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deliverSynchronously:outboxCopy:");
}

id objc_msgSend__deliveryResultIfNotHasAdequateFreeSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deliveryResultIfNotHasAdequateFreeSpace");
}

id objc_msgSend__enumerateContentPathsAndAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateContentPathsAndAttributes:");
}

id objc_msgSend__enumerateContentsForAccounts_withType_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateContentsForAccounts:withType:handler:");
}

id objc_msgSend__enumeratePurgeableFileInTemporaryDirectoryWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumeratePurgeableFileInTemporaryDirectoryWithHandler:");
}

id objc_msgSend__filterTypeCriterionForMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterTypeCriterionForMailbox:");
}

id objc_msgSend__freeSpaceStatusDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_freeSpaceStatusDidChange:");
}

id objc_msgSend__logDeliveryResult_forMessage_account_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logDeliveryResult:forMessage:account:");
}

id objc_msgSend__messagesInProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_messagesInProgress");
}

id objc_msgSend__outboxCopyFromMessageDelivery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_outboxCopyFromMessageDelivery:");
}

id objc_msgSend__outboxStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_outboxStore");
}

id objc_msgSend__pathsForContentWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pathsForContentWithType:");
}

id objc_msgSend__retrieveFreeSpaceStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retrieveFreeSpaceStatus:");
}

id objc_msgSend__sendProcessingFinishedNotificationWithSentMessages_failedMessages_playSound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendProcessingFinishedNotificationWithSentMessages:failedMessages:playSound:");
}

id objc_msgSend__sendProcessingStartedNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendProcessingStartedNotification:");
}

id objc_msgSend__setDeliveryFlag_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDeliveryFlag:state:");
}

id objc_msgSend__setErrorForMessage_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setErrorForMessage:error:");
}

id objc_msgSend__setErrorForMessageLibraryID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setErrorForMessageLibraryID:error:");
}

id objc_msgSend__shouldSend_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSend:options:");
}

id objc_msgSend__sortedMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sortedMessages");
}

id objc_msgSend__updateCounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCounts");
}

id objc_msgSend__updateDeliveryInfoFromResult_forMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeliveryInfoFromResult:forMessage:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_accountThatMessageIsFrom_includingInactive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountThatMessageIsFrom:includingInactive:");
}

id objc_msgSend_addDiagnosticsGenerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDiagnosticsGenerator:");
}

id objc_msgSend_addInvocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInvocation:");
}

id objc_msgSend_addNetworkReachableObserver_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNetworkReachableObserver:selector:");
}

id objc_msgSend_addNewMessages_mailboxURL_userInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNewMessages:mailboxURL:userInitiated:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_afterDelay_performBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "afterDelay:performBlock:");
}

id objc_msgSend_allMailboxUids(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allMailboxUids");
}

id objc_msgSend_andCompoundCriterionWithCriteria_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andCompoundCriterionWithCriteria:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_attributesOfFileSystemForPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfFileSystemForPath:error:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_baseMailDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseMailDirectory");
}

id objc_msgSend_beforeDateReceived(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beforeDateReceived");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bytesSent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytesSent");
}

id objc_msgSend_cachedMetadataJSONForKey_messageID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedMetadataJSONForKey:messageID:");
}

id objc_msgSend_canUsePersistence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canUsePersistence");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completion");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentType");
}

id objc_msgSend_contentTypeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentTypeIdentifier");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_conversationFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationFlags");
}

id objc_msgSend_conversationId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationId");
}

id objc_msgSend_conversationPersistence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationPersistence");
}

id objc_msgSend_copyDiagnosticInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDiagnosticInformation");
}

id objc_msgSend_copyOfAllMessagesWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyOfAllMessagesWithOptions:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAndStartTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAndStartTask");
}

id objc_msgSend_created(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "created");
}

id objc_msgSend_criterionForMailboxURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "criterionForMailboxURL:");
}

id objc_msgSend_criterionForMailboxUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "criterionForMailboxUrl:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentMonitor");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateReceivedLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateReceivedLimit");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultInstance");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delayedMessageScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delayedMessageScheduler");
}

id objc_msgSend_delayedMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delayedMessages");
}

id objc_msgSend_deleteMessages_moveToTrash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteMessages:moveToTrash:");
}

id objc_msgSend_deliverAsynchronously_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliverAsynchronously:completion:");
}

id objc_msgSend_deliverSynchronouslyWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliverSynchronouslyWithCompletion:");
}

id objc_msgSend_deliveredMessage_account_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliveredMessage:account:");
}

id objc_msgSend_deliveryAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliveryAccount");
}

id objc_msgSend_deliveryHookResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliveryHookResponder");
}

id objc_msgSend_deliveryInfoForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliveryInfoForMessage:");
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

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_doCompact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doCompact");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_ef_any_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_any:");
}

id objc_msgSend_ef_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_filter:");
}

id objc_msgSend_ef_flatMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_flatMap:");
}

id objc_msgSend_ef_isEarlierThanDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_isEarlierThanDate:");
}

id objc_msgSend_ef_isEmpty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_isEmpty");
}

id objc_msgSend_ef_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_map:");
}

id objc_msgSend_ef_popElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_popElement");
}

id objc_msgSend_ef_publicDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_publicDescription");
}

id objc_msgSend_ef_removeFirst(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_removeFirst");
}

id objc_msgSend_em_internalErrorWithReason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "em_internalErrorWithReason:userInfo:");
}

id objc_msgSend_em_userDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "em_userDefaults");
}

id objc_msgSend_encodedAsJSON(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedAsJSON");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_endTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTask");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_localizedDescription_title_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:localizedDescription:title:userInfo:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_failedCellularAttempts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedCellularAttempts");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModificationDate");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "first");
}

id objc_msgSend_firstHeaderForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstHeaderForKey:");
}

id objc_msgSend_flaggedMessageCriterion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flaggedMessageCriterion");
}

id objc_msgSend_forceAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceAll");
}

id objc_msgSend_freeSpaceMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeSpaceMonitor");
}

id objc_msgSend_freeSpaceStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeSpaceStatus");
}

id objc_msgSend_fullPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullPath");
}

id objc_msgSend_getFreeSpaceStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFreeSpaceStatusWithCompletionHandler:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasAdequateFreeSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAdequateFreeSpace");
}

id objc_msgSend_hasDelayedMessagesDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDelayedMessagesDidChange:");
}

id objc_msgSend_hasFilterType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasFilterType:");
}

id objc_msgSend_hasHeaderForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasHeaderForKey:");
}

id objc_msgSend_hasPlaceholderRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPlaceholderRepresentation:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headers");
}

id objc_msgSend_hookRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hookRegistry");
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostname");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_includesMeCriterion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includesMeCriterion");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithJSON_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithJSON:");
}

id objc_msgSend_initWithPrimaryLibrary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrimaryLibrary:");
}

id objc_msgSend_initWithStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStatus:error:");
}

id objc_msgSend_initWithType_qualifier_expression_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:qualifier:expression:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isBusy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBusy");
}

id objc_msgSend_isCSV(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCSV");
}

id objc_msgSend_isCalendarFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCalendarFile");
}

id objc_msgSend_isCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCertificate");
}

id objc_msgSend_isDXF(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDXF");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExcel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExcel");
}

id objc_msgSend_isFatPipe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFatPipe");
}

id objc_msgSend_isFreeSpaceCritical(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFreeSpaceCritical");
}

id objc_msgSend_isGIF(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGIF");
}

id objc_msgSend_isHTML(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHTML");
}

id objc_msgSend_isImageFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isImageFile");
}

id objc_msgSend_isMSWord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMSWord");
}

id objc_msgSend_isMedia(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMedia");
}

id objc_msgSend_isMobileMail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMobileMail");
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNetworkReachable");
}

id objc_msgSend_isNetworkUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNetworkUp");
}

id objc_msgSend_isPDFFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPDFFile");
}

id objc_msgSend_isPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPass");
}

id objc_msgSend_isPlainText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlainText");
}

id objc_msgSend_isPowerpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPowerpoint");
}

id objc_msgSend_isProcessing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProcessing");
}

id objc_msgSend_isProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProfile");
}

id objc_msgSend_isRFC822(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRFC822");
}

id objc_msgSend_isRTF(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRTF");
}

id objc_msgSend_isUserRequested(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserRequested");
}

id objc_msgSend_isVCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVCard");
}

id objc_msgSend_isVPN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVPN");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isWatchFace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWatchFace");
}

id objc_msgSend_isWifi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWifi");
}

id objc_msgSend_isWorkout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWorkout");
}

id objc_msgSend_isZip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isZip");
}

id objc_msgSend_lastAttempt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastAttempt");
}

id objc_msgSend_lastStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastStatus");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "library");
}

id objc_msgSend_libraryID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "libraryID");
}

id objc_msgSend_loadLibraryMessagesFromLibraryMatchingCriterion_count_protectedDataAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadLibraryMessagesFromLibraryMatchingCriterion:count:protectedDataAvailable:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_loggingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loggingIdentifier");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailAccounts");
}

id objc_msgSend_mailDropDeliveryState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailDropDeliveryState");
}

id objc_msgSend_mailDropDeliveryStateForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailDropDeliveryStateForMessage:");
}

id objc_msgSend_mailDropState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailDropState");
}

id objc_msgSend_mailbox(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailbox");
}

id objc_msgSend_mailboxUidOfType_createIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailboxUidOfType:createIfNeeded:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_messageBasePathForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageBasePathForAccount:");
}

id objc_msgSend_messageChangeManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageChangeManager");
}

id objc_msgSend_messageFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageFlags");
}

id objc_msgSend_messageIDHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageIDHash");
}

id objc_msgSend_messagePersistence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messagePersistence");
}

id objc_msgSend_messageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageSize");
}

id objc_msgSend_mf_enumerateAtPath_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_enumerateAtPath:withBlock:");
}

id objc_msgSend_mf_invocationWithSelector_target_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_invocationWithSelector:target:object:");
}

id objc_msgSend_mf_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_lock");
}

id objc_msgSend_mf_sizeForDirectoryAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_sizeForDirectoryAtURL:error:");
}

id objc_msgSend_mf_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_unlock");
}

id objc_msgSend_mimeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mimeType");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nano_activeMailAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nano_activeMailAccounts");
}

id objc_msgSend_newDeliveryObjectFactoryForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDeliveryObjectFactoryForMessage:");
}

id objc_msgSend_newWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWithMessage:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_notifyObserversOfDelayedMessagesDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyObserversOfDelayedMessagesDidChange:");
}

id objc_msgSend_notifyObserversOfUpdatedPendingMessageCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyObserversOfUpdatedPendingMessageCount:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numberOfFailures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfFailures");
}

id objc_msgSend_numberOfPendingMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfPendingMessages");
}

id objc_msgSend_numberOfPendingMessagesChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfPendingMessagesChanged:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectID");
}

id objc_msgSend_observationScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observationScheduler");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observers");
}

id objc_msgSend_openSynchronously(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSynchronously");
}

id objc_msgSend_orCompoundCriterionWithCriteria_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orCompoundCriterionWithCriteria:");
}

id objc_msgSend_originalConversationId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalConversationId");
}

id objc_msgSend_outboxCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outboxCopy");
}

id objc_msgSend_outboxMessageStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outboxMessageStore:");
}

id objc_msgSend_pairWithFirst_second_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairWithFirst:second:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performSyncBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSyncBlock:");
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistence");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaIdentifier");
}

id objc_msgSend_placeholderDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderDirectory");
}

id objc_msgSend_playSound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playSound");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_powerlog_eventData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerlog:eventData:");
}

id objc_msgSend_preferenceEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferenceEnabled:");
}

id objc_msgSend_printDeliveryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printDeliveryQueue");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_processQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processQueue");
}

id objc_msgSend_processQueueAndExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processQueueAndExit");
}

id objc_msgSend_processQueueAndPlaySoundOnSuccess_forceAll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processQueueAndPlaySoundOnSuccess:forceAll:");
}

id objc_msgSend_purgeableAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeableAccounts");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerUserSyncStakeholder:withMachServiceName:");
}

id objc_msgSend_releaseAssertionWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseAssertionWithIdentifier:");
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadAccounts");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeNetworkReachableObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeNetworkReachableObserver:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retainAssertionWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retainAssertionWithIdentifier:");
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryCount");
}

id objc_msgSend_rootMessageDataDirectoryForBasePath_purgeable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootMessageDataDirectoryForBasePath:purgeable:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_senderIsVIPCriterion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "senderIsVIPCriterion:");
}

id objc_msgSend_serialDispatchQueueSchedulerWithName_qualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialDispatchQueueSchedulerWithName:qualityOfService:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setArchiveAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArchiveAccount:");
}

id objc_msgSend_setCachedMetadataJSON_forKey_messageID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachedMetadataJSON:forKey:messageID:");
}

id objc_msgSend_setCanBeCancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanBeCancelled:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCurrentCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentCount:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeliveryInfo_forMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeliveryInfo:forMessage:");
}

id objc_msgSend_setDisplayName_maxCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:maxCount:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setFailedCellularAttempts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFailedCellularAttempts:");
}

id objc_msgSend_setFlag_state_forMessages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlag:state:forMessages:");
}

id objc_msgSend_setFlagsFromDictionary_forMessages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlagsFromDictionary:forMessages:");
}

id objc_msgSend_setForceAll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceAll:");
}

id objc_msgSend_setFreeSpaceStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFreeSpaceStatus:");
}

id objc_msgSend_setHasAdequateFreeSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasAdequateFreeSpace:");
}

id objc_msgSend_setIsUserRequested_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUserRequested:");
}

id objc_msgSend_setLastAttempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastAttempt:");
}

id objc_msgSend_setLastStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastStatus:");
}

id objc_msgSend_setMailDropDeliveryState_forMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailDropDeliveryState:forMessage:");
}

id objc_msgSend_setMailDropState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailDropState:");
}

id objc_msgSend_setMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailbox:");
}

id objc_msgSend_setMessageSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageSize:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNumberOfFailures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfFailures:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOutboxCopy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutboxCopy:");
}

id objc_msgSend_setPercentDoneOfCurrentItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPercentDoneOfCurrentItem:");
}

id objc_msgSend_setPersistenceConversationFlags_forConversationIDs_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistenceConversationFlags:forConversationIDs:reason:");
}

id objc_msgSend_setPlaySound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaySound:");
}

id objc_msgSend_setProtectedDataAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtectedDataAvailable:");
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetryCount:");
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToken:");
}

id objc_msgSend_setUserInfoObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfoObject:forKey:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedDeliveryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDeliveryQueue");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedNetworkObserver");
}

id objc_msgSend_sharedStakeholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStakeholder");
}

id objc_msgSend_shouldCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCancel");
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signpostID");
}

id objc_msgSend_signpostLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signpostLog");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportsPurge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPurge");
}

id objc_msgSend_supportsThreadOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsThreadOperations");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspend");
}

id objc_msgSend_systemSpaceWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemSpaceWithError:");
}

id objc_msgSend_taskWithName_reason_forBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithName:reason:forBundleID:");
}

id objc_msgSend_threadNotifyMessageCriterion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threadNotifyMessageCriterion");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_todayMessageCriterion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "todayMessageCriterion");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_transactionWithDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionWithDescription:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unreadMessageCriterion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unreadMessageCriterion");
}

id objc_msgSend_unregisterStakeHolder_status_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterStakeHolder:status:reason:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_uploadContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadContent");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

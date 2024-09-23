id sub_1000853A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("gridTransitions");
  v1 = a1 + 32;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", **(unsigned int **)(a1 + 32)));
  v6[1] = CFSTR("slcCount");
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)v1 + 4)));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

void sub_100085474(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t sub_10008549C(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  sub_10001606C(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    sub_10001606C(*(_QWORD *)a1, v2);
  }
  return a1;
}

_QWORD *SALockMonitorProd::SALockMonitorProd(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v13[24];
  _BYTE *v14;
  _BYTE v15[24];
  _BYTE *v16;

  v7 = a2;
  sub_100004F4C((uint64_t)v15, a3);
  sub_100004F4C((uint64_t)v13, a4);
  sub_100084124(a1, v7, (uint64_t)v15, (uint64_t)v13);
  v8 = v14;
  if (v14 == v13)
  {
    v9 = 4;
    v8 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  v10 = v16;
  if (v16 == v15)
  {
    v11 = 4;
    v10 = v15;
    goto LABEL_10;
  }
  if (v16)
  {
    v11 = 5;
LABEL_10:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  *a1 = &off_1000F6450;

  return a1;
}

void sub_1000855F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  void *v17;
  char *v18;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;

  v20 = a13;
  if (a13 == v18)
  {
    v21 = 4;
    v20 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_6:
  v22 = a17;
  if (a17 == &a14)
  {
    v23 = 4;
    v22 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v23 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
LABEL_11:

  _Unwind_Resume(a1);
}

void SALockMonitorProd::start(SALockMonitorProd *this)
{
  BOOL v2;
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  __CFNotificationCenter *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  SALockMonitorProd *v13;
  BOOL v14;

  v2 = sub_10008585C();
  v3 = *((_QWORD *)this + 9);
  v10 = (uint64_t)_NSConcreteStackBlock;
  *(_QWORD *)&v11 = 3221225472;
  *((_QWORD *)&v11 + 1) = sub_100085DEC;
  v12 = &unk_1000F6468;
  v13 = this;
  v14 = v2;
  dispatch_async(v3, &v10);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, this, (CFNotificationCallback)sub_10008592C, kMobileKeyBagLockStatusNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = MKBDeviceUnlockedSinceBoot();
  v6 = SALogObjectGeneral;
  v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 68289026;
      LOWORD(v11) = 2082;
      *(_QWORD *)((char *)&v11 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,firstUnlockedAtStartup\"}", (uint8_t *)&v10, 0x12u);
    }
    v8 = *((_QWORD *)this + 9);
    v10 = (uint64_t)_NSConcreteStackBlock;
    *(_QWORD *)&v11 = 3221225472;
    *((_QWORD *)&v11 + 1) = sub_100085CB8;
    v12 = &unk_1000F1EB8;
    v13 = this;
    dispatch_async(v8, &v10);
  }
  else
  {
    if (v7)
    {
      v10 = 68289026;
      LOWORD(v11) = 2082;
      *(_QWORD *)((char *)&v11 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,neverUnlockedAtStartup\"}", (uint8_t *)&v10, 0x12u);
    }
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, this, (CFNotificationCallback)sub_100085AF8, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

BOOL sub_10008585C()
{
  int v0;
  NSObject *v1;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;

  v0 = MKBGetDeviceLockState(0);
  v1 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289283;
    v3[1] = 0;
    v4 = 2082;
    v5 = "";
    v6 = 1025;
    v7 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,isLockedCheck\", \"lockState\":%{private}d}", (uint8_t *)v3, 0x18u);
  }
  return v0 != 0;
}

void sub_10008592C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  NSObject *v8;
  const char *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _BYTE v14[32];
  BOOL v15;

  v8 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v9 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
    else
      v9 = "Unknown__";
    v13 = 68289539;
    *(_WORD *)v14 = 2082;
    *(_QWORD *)&v14[2] = "";
    *(_WORD *)&v14[10] = 2081;
    *(_QWORD *)&v14[12] = v9;
    *(_WORD *)&v14[20] = 2113;
    *(_QWORD *)&v14[22] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,onKeybagLockStatus\", \"name\":%{private, location:escape_only}s, \"userInfo\":%{private, location:escape_only}@}", (uint8_t *)&v13, 0x26u);
  }

  if (a2)
  {
    v10 = sub_10008585C();
    v11 = *(NSObject **)(a2 + 72);
    v13 = (uint64_t)_NSConcreteStackBlock;
    *(_QWORD *)v14 = 3221225472;
    *(_QWORD *)&v14[8] = sub_100085DEC;
    *(_QWORD *)&v14[16] = &unk_1000F6468;
    *(_QWORD *)&v14[24] = a2;
    v15 = v10;
    dispatch_async(v11, &v13);
  }
  else
  {
    v12 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 68289026;
      *(_WORD *)v14 = 2082;
      *(_QWORD *)&v14[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,invalidObjectOnLockStatus\"}", (uint8_t *)&v13, 0x12u);
    }
  }
}

void sub_100085AE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100085AF8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _BYTE v13[32];

  v8 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v9 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
    else
      v9 = "Unknown__";
    v12 = 68289539;
    *(_WORD *)v13 = 2082;
    *(_QWORD *)&v13[2] = "";
    *(_WORD *)&v13[10] = 2081;
    *(_QWORD *)&v13[12] = v9;
    *(_WORD *)&v13[20] = 2113;
    *(_QWORD *)&v13[22] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,onKeybagFirstUnlock\", \"name\":%{private, location:escape_only}s, \"userInfo\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
  }

  if (a2)
  {
    v10 = *(NSObject **)(a2 + 72);
    v12 = (uint64_t)_NSConcreteStackBlock;
    *(_QWORD *)v13 = 3221225472;
    *(_QWORD *)&v13[8] = sub_100085CB8;
    *(_QWORD *)&v13[16] = &unk_1000F1EB8;
    *(_QWORD *)&v13[24] = a2;
    dispatch_async(v10, &v12);
  }
  else
  {
    v11 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 68289026;
      *(_WORD *)v13 = 2082;
      *(_QWORD *)&v13[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,invalidObjectOnFirstUnlock\"}", (uint8_t *)&v12, 0x12u);
    }
  }
}

void sub_100085CA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100085CB8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_autoreleasePoolPush();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100085D20;
  v3[3] = &unk_1000F1EB8;
  v3[4] = v1;
  sub_100085D20((uint64_t)v3);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100085D20(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,onFirstUnlocked\"}", (uint8_t *)v5, 0x12u);
  }
  v3 = *(_QWORD *)(v1 + 32);
  if (!v3)
    sub_100004FB0();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 48))(v3);
}

void sub_100085DEC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_autoreleasePoolPush();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100085E68;
  v4[3] = &unk_1000F6468;
  v4[4] = v2;
  v5 = *(_BYTE *)(a1 + 40);
  sub_100085E68((uint64_t)v4);
  objc_autoreleasePoolPop(v3);
}

uint64_t sub_100085E68(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = "locked";
    else
      v4 = "unlocked";
    v7[0] = 68289283;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2081;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lockMon,onLockStatus\", \"status\":%{private, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  LOBYTE(v7[0]) = *(_BYTE *)(a1 + 40);
  v5 = *(_QWORD *)(v2 + 64);
  if (!v5)
    sub_100004FB0();
  return (*(uint64_t (**)(uint64_t, _DWORD *))(*(_QWORD *)v5 + 48))(v5, v7);
}

void sub_100085F78(uint64_t a1)
{
  sub_10008420C(a1);
  operator delete();
}

uint64_t SACoreRoutineProd::SACoreRoutineProd(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void **v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *__p[2];
  uint64_t v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  uint64_t v34;
  _QWORD *v35;

  v7 = a2;
  if (a3[23] < 0)
  {
    sub_100004870(__p, *(void **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3;
    v25 = *((_QWORD *)a3 + 2);
  }
  sub_100004F4C((uint64_t)v30, a4);
  v8 = v32;
  sub_100004F4C((uint64_t)v32, a4 + 32);
  v9 = sub_100004F4C((uint64_t)&v34, a4 + 64);
  *(_QWORD *)a1 = off_1000F6678;
  v10 = v35;
  if (v35 == (_QWORD *)v9)
  {
    v11 = 4;
    v10 = (_QWORD *)v9;
  }
  else
  {
    if (!v35)
      goto LABEL_9;
    v11 = 5;
  }
  (*(void (**)(_QWORD *))(*v10 + 8 * v11))(v10);
LABEL_9:
  if (v33 == v32)
  {
    v12 = 4;
  }
  else
  {
    if (!v33)
      goto LABEL_14;
    v12 = 5;
    v8 = v33;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v12))(v8);
LABEL_14:
  v13 = v31;
  if (v31 == v30)
  {
    v14 = 4;
    v13 = v30;
  }
  else
  {
    if (!v31)
      goto LABEL_19;
    v14 = 5;
  }
  (*(void (**)(void))(*v13 + 8 * v14))();
LABEL_19:
  if (SHIBYTE(v25) < 0)
    operator delete(__p[0]);
  *(_QWORD *)a1 = off_1000F64B0;
  *(_QWORD *)(a1 + 8) = 0;
  v15 = (void **)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  v16 = v7;
  *(_QWORD *)(a1 + 32) = v16;
  sub_100004F4C(a1 + 40, a4);
  sub_100004F4C(a1 + 72, a4 + 32);
  sub_100004F4C(a1 + 104, a4 + 64);
  *(_OWORD *)(a1 + 144) = 0u;
  *(_WORD *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  v17 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,SACoreRoutineProd\"}", buf, 0x12u);
  }
  if (a3[23] < 0)
  {
    if (*((_QWORD *)a3 + 1))
      goto LABEL_25;
  }
  else if (a3[23])
  {
LABEL_25:
    v18 = objc_alloc((Class)RTRoutineManager);
    if (a3[23] < 0)
      a3 = *(char **)a3;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
    v20 = objc_msgSend(v18, "initWithRestorationIdentifier:", v19);
    v21 = *v15;
    *v15 = v20;

    goto LABEL_31;
  }
  v22 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,SACoreRoutineProd,failed,invalid UniqueId\"}", buf, 0x12u);
  }
LABEL_31:

  return a1;
}

void sub_1000862CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{

  _Unwind_Resume(a1);
}

uint64_t sub_100086450(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  __int16 v12;
  const char *v13;

  *(_QWORD *)a1 = off_1000F64B0;
  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 68289026;
    v12 = 2082;
    v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,SACoreRoutineProd released\"}", (uint8_t *)&v11, 0x12u);
  }
  v11 = a1 + 168;
  sub_100089234((void ***)&v11);
  v3 = *(void **)(a1 + 144);
  if (v3)
  {
    *(_QWORD *)(a1 + 152) = v3;
    operator delete(v3);
  }
  v4 = *(_QWORD **)(a1 + 128);
  if (v4 == (_QWORD *)(a1 + 104))
  {
    v5 = 4;
    v4 = (_QWORD *)(a1 + 104);
  }
  else
  {
    if (!v4)
      goto LABEL_10;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_10:
  v6 = *(_QWORD **)(a1 + 96);
  if (v6 == (_QWORD *)(a1 + 72))
  {
    v7 = 4;
    v6 = (_QWORD *)(a1 + 72);
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_15:
  v8 = *(_QWORD **)(a1 + 64);
  if (v8 == (_QWORD *)(a1 + 40))
  {
    v9 = 4;
    v8 = (_QWORD *)(a1 + 40);
    goto LABEL_19;
  }
  if (v8)
  {
    v9 = 5;
LABEL_19:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

  return a1;
}

void sub_1000865DC(uint64_t a1)
{
  sub_100086450(a1);
  operator delete();
}

void sub_100086600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  _QWORD block[7];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2050;
    v16 = a2;
    v17 = 2050;
    v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,getHistoricalLocation\", \"starTime\":%{public}llu, \"endTime\":%{public}llu}", buf, 0x26u);
  }
  if (!*(_QWORD *)(a1 + 8))
  {
    v7 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v8 = "{\"msg%{public}.0s\":\"#coreRoutine,getHistoricalLocation,invalid instance\"}";
    goto LABEL_12;
  }
  if (a2 > a3)
  {
    v7 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v8 = "{\"msg%{public}.0s\":\"#coreRoutine,invalid time/duration\"}";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
    return;
  }
  if (*(_BYTE *)(a1 + 136))
  {
    v7 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v8 = "{\"msg%{public}.0s\":\"#coreRoutine,getHistoricalLocation,request in progress\"}";
    goto LABEL_12;
  }
  *(_BYTE *)(a1 + 136) = 1;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a1 + 144);
  v9 = *(NSObject **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086840;
  block[3] = &unk_1000F6508;
  block[4] = a1;
  block[5] = a3;
  block[6] = a2;
  dispatch_async(v9, block);
}

void sub_100086840(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_autoreleasePoolPush();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000868BC;
  v4[3] = &unk_1000F6508;
  v4[4] = v2;
  v5 = *(_OWORD *)(a1 + 40);
  sub_1000868BC((uint64_t)v4);
  objc_autoreleasePoolPop(v3);
}

void sub_1000868BC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;

  v2 = *(_QWORD *)(a1 + 32);
  *(float64x2_t *)(v2 + 16) = vcvtq_f64_s64(*(int64x2_t *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v4 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)*(uint64_t *)(a1 + 48)));
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#coreRoutine,getHistoricalLocation,invalid endTime or startTime\"}", buf, 0x12u);
    }
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v4, v3);
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(objc_alloc((Class)RTStoredLocationEnumerationOptions), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v8, 200, 0, 6378135.0);
      if (v10)
      {
        v11 = *(void **)(v2 + 8);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100086B78;
        v14[3] = &unk_1000F64E8;
        v14[4] = v2;
        objc_msgSend(v11, "enumerateStoredLocationsWithOptions:usingBlock:", v10, v14);
      }
      else
      {
        v13 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289026;
          v16 = 0;
          v17 = 2082;
          v18 = "";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#coreRoutine,getHistoricalLocation,invalid enumerationOptions\"}", buf, 0x12u);
        }
      }

    }
    else
    {
      v12 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#coreRoutine,getHistoricalLocation,invalid interval\"}", buf, 0x12u);
      }
    }

  }
}

void sub_100086B3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100086B78(uint64_t a1, void *a2, void *a3, unsigned __int8 *a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  int v21;
  id v22;
  id v23;
  uint64_t v24;
  void **v25;
  _QWORD *v26;
  void *i;
  void *v28;
  void *v29;
  double v30;
  double v31;
  __int128 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double *v38;
  double v39;
  long double v40;
  double v41;
  long double v42;
  long double v43;
  long double v44;
  long double v45;
  long double v46;
  long double v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  double *v56;
  double *v57;
  double *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  double *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  __int128 v72;
  NSObject *v73;
  double *v74;
  double *v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  double v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t buf;
  __int16 v90;
  const char *v91;
  __int16 v92;
  _BYTE v93[10];
  int v94;

  v81 = a2;
  v7 = a3;
  v80 = v7;
  if (!a4)
  {
    v14 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    buf = 68289026;
    v90 = 2082;
    v91 = "";
    v15 = "{\"msg%{public}.0s\":\"#coreRoutine,received update from CoreRoutine,Stop nil\"}";
    v16 = v14;
    goto LABEL_9;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v9 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "description")));
      v11 = objc_msgSend(v10, "UTF8String");
      v12 = *a4;
      buf = 68289538;
      v90 = 2082;
      v91 = "";
      v92 = 2082;
      *(_QWORD *)v93 = v11;
      *(_WORD *)&v93[8] = 1026;
      v94 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,received update from CoreRoutine\", \"Error\":%{public, location:escape_only}s, \"stop\":%{public}hhd}", (uint8_t *)&buf, 0x22u);

    }
    v13 = *(_QWORD *)(v8 + 64);
    if (!v13)
      sub_100004FB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v13 + 48))(v13, v8 + 144);
    *(_BYTE *)(v8 + 136) = 0;
    goto LABEL_67;
  }
  v18 = SALogObjectGeneral;
  if (!v81)
  {
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    buf = 68289026;
    v90 = 2082;
    v91 = "";
    v15 = "{\"msg%{public}.0s\":\"#coreRoutine,received update from CoreRoutine,locations nil\"}";
    v16 = v18;
LABEL_9:
    v17 = 18;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&buf, v17);
    goto LABEL_67;
  }
  v19 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v81, "count");
    v21 = *a4;
    buf = 68289538;
    v90 = 2082;
    v91 = "";
    v92 = 1026;
    *(_DWORD *)v93 = v20;
    *(_WORD *)&v93[4] = 1026;
    *(_DWORD *)&v93[6] = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,received update from CoreRoutine\", \"locationCount\":%{public}d, \"stop\":%{public}hhd}", (uint8_t *)&buf, 0x1Eu);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v22 = v81;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v85;
    v25 = (void **)(v8 + 144);
    v26 = (_QWORD *)(v8 + 160);
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v85 != v24)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "timestamp", v80));
        objc_msgSend(v29, "timeIntervalSinceReferenceDate");
        v31 = v30;

        *(_QWORD *)&v32 = *(_QWORD *)(v8 + 24);
        if (v31 >= *(double *)&v32)
        {
          *(_QWORD *)&v32 = *(_QWORD *)(v8 + 16);
          if (v31 <= *(double *)&v32)
          {
            if (*(_QWORD *)(v8 + 144) == *(_QWORD *)(v8 + 152))
            {
              objc_msgSend(v28, "coordinate");
              v50 = v49;
              objc_msgSend(v28, "coordinate");
              v52 = v51;
              objc_msgSend(v28, "horizontalAccuracy");
              v54 = v53;
              v56 = *(double **)(v8 + 152);
              v55 = *(_QWORD *)(v8 + 160);
              if ((unint64_t)v56 >= v55)
              {
                v58 = (double *)*v25;
                v59 = ((char *)v56 - (_BYTE *)*v25) >> 5;
                v60 = v59 + 1;
                if ((unint64_t)(v59 + 1) >> 59)
                  sub_100004C50();
                v61 = v55 - (_QWORD)v58;
                if (v61 >> 4 > v60)
                  v60 = v61 >> 4;
                if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFE0)
                  v62 = 0x7FFFFFFFFFFFFFFLL;
                else
                  v62 = v60;
                if (v62)
                {
                  v63 = (char *)sub_10004C040(v8 + 160, v62);
                  v58 = *(double **)(v8 + 144);
                  v56 = *(double **)(v8 + 152);
                }
                else
                {
                  v63 = 0;
                }
                v70 = &v63[32 * v59];
                *(double *)v70 = v31;
                *((_QWORD *)v70 + 1) = v50;
                *((_QWORD *)v70 + 2) = v52;
                *((_QWORD *)v70 + 3) = v54;
                v71 = v70;
                if (v56 != v58)
                {
                  do
                  {
                    v72 = *((_OWORD *)v56 - 1);
                    *((_OWORD *)v71 - 2) = *((_OWORD *)v56 - 2);
                    *((_OWORD *)v71 - 1) = v72;
                    v71 -= 32;
                    v56 -= 4;
                  }
                  while (v56 != v58);
                  v58 = (double *)*v25;
                }
                v57 = (double *)(v70 + 32);
                *(_QWORD *)(v8 + 144) = v71;
                *(_QWORD *)(v8 + 152) = v70 + 32;
                *(_QWORD *)(v8 + 160) = &v63[32 * v62];
                if (v58)
                  operator delete(v58);
              }
              else
              {
                *v56 = v31;
                *((_QWORD *)v56 + 1) = v50;
                v57 = v56 + 4;
                *((_QWORD *)v56 + 2) = v52;
                *((_QWORD *)v56 + 3) = v53;
              }
              *(_QWORD *)(v8 + 152) = v57;
              v73 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                buf = 68289026;
                v90 = 2082;
                v91 = "";
                _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,fHistoricalLocation empty\"}", (uint8_t *)&buf, 0x12u);
              }
            }
            else
            {
              objc_msgSend(v28, "coordinate");
              v34 = v33;
              objc_msgSend(v28, "coordinate");
              v36 = v35;
              objc_msgSend(v28, "horizontalAccuracy");
              v82 = v37;
              v38 = *(double **)(v8 + 152);
              v83 = *(v38 - 4);
              v39 = *(v38 - 3);
              v40 = v39 * 3.14159265 / 180.0;
              v41 = (*(v38 - 2) - v36) * 3.14159265 / 180.0;
              v42 = sin((v39 - v34) * 3.14159265 / 180.0 * 0.5);
              v43 = v42 * v42;
              v44 = sin(v41 * 0.5);
              v45 = cos(v40) * (v44 * v44);
              v46 = cos(v34 * 3.14159265 / 180.0);
              v47 = asin(sqrt(v43 + v45 * v46));
              if ((v47 + v47) * 6371000.0 > 100.0 || (*(double *)&v32 = v31 - v83, v31 - v83 > 180.0))
              {
                if ((unint64_t)v38 >= *v26)
                {
                  v64 = (double *)*v25;
                  v65 = ((char *)v38 - (_BYTE *)*v25) >> 5;
                  v66 = v65 + 1;
                  if ((unint64_t)(v65 + 1) >> 59)
                    sub_100004C50();
                  v67 = *v26 - (_QWORD)v64;
                  if (v67 >> 4 > v66)
                    v66 = v67 >> 4;
                  if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFE0)
                    v68 = 0x7FFFFFFFFFFFFFFLL;
                  else
                    v68 = v66;
                  if (v68)
                  {
                    v69 = (char *)sub_10004C040(v8 + 160, v68);
                    v64 = *(double **)(v8 + 144);
                    v38 = *(double **)(v8 + 152);
                  }
                  else
                  {
                    v69 = 0;
                  }
                  v74 = (double *)&v69[32 * v65];
                  *v74 = v31;
                  v74[1] = v34;
                  *(_QWORD *)&v32 = v82;
                  v74[2] = v36;
                  *((_QWORD *)v74 + 3) = v82;
                  v75 = v74;
                  if (v38 != v64)
                  {
                    do
                    {
                      v32 = *((_OWORD *)v38 - 2);
                      v76 = *((_OWORD *)v38 - 1);
                      *((_OWORD *)v75 - 2) = v32;
                      *((_OWORD *)v75 - 1) = v76;
                      v75 -= 4;
                      v38 -= 4;
                    }
                    while (v38 != v64);
                    v64 = (double *)*v25;
                  }
                  v48 = v74 + 4;
                  *(_QWORD *)(v8 + 144) = v75;
                  *(_QWORD *)(v8 + 152) = v74 + 4;
                  *(_QWORD *)(v8 + 160) = &v69[32 * v68];
                  if (v64)
                    operator delete(v64);
                }
                else
                {
                  *v38 = v31;
                  v38[1] = v34;
                  v48 = v38 + 4;
                  *(_QWORD *)&v32 = v82;
                  v38[2] = v36;
                  *((_QWORD *)v38 + 3) = v82;
                }
                *(_QWORD *)(v8 + 152) = v48;
              }
            }
          }
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v84, v88, 16, *(double *)&v32);
    }
    while (v23);
  }

  if (!objc_msgSend(v22, "count"))
  {
    v77 = *(_QWORD *)(v8 + 64);
    if (!v77)
      sub_100004FB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v77 + 48))(v77, v8 + 144);
    *(_BYTE *)(v8 + 136) = 0;
    v78 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v79 = (uint64_t)(*(_QWORD *)(v8 + 152) - *(_QWORD *)(v8 + 144)) >> 5;
      buf = 68289282;
      v90 = 2082;
      v91 = "";
      v92 = 2050;
      *(_QWORD *)v93 = v79;
      v15 = "{\"msg%{public}.0s\":\"#coreRoutine,fHistoricalLocation\", \"historicalDataLen\":%{public}lu}";
      v16 = v78;
      v17 = 28;
      goto LABEL_10;
    }
  }
LABEL_67:

}

void sub_100087300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100087384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;

  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2050;
    v24 = a2;
    v25 = 2050;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,getPeopleDensity\", \"startTime\":%{public}llu, \"endTime\":%{public}llu}", buf, 0x26u);
  }
  if (!*(_QWORD *)(a1 + 8))
  {
    v7 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v8 = "{\"msg%{public}.0s\":\"#coreRoutine,getPeopleDensity,invalid instance\"}";
    goto LABEL_12;
  }
  if (a2 > a3)
  {
    v7 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v8 = "{\"msg%{public}.0s\":\"#coreRoutine,getPeopleDensity,invalid time/duration\"}";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
    return;
  }
  if (*(_BYTE *)(a1 + 137))
  {
    v7 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 68289026;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v8 = "{\"msg%{public}.0s\":\"#coreRoutine,getPeopleDensity,request in progress\"}";
    goto LABEL_12;
  }
  *(_BYTE *)(a1 + 137) = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)a2));
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#coreRoutine,getPeopleDensity,invalid endTime or startTime\"}", buf, 0x12u);
    }
  }
  else
  {
    v14 = *(void **)(a1 + 8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000876BC;
    v15[3] = &unk_1000F6558;
    v18 = a1;
    v16 = v10;
    v17 = v9;
    objc_msgSend(v14, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v16, v17, v15);

  }
}

void sub_100087688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1000876BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087794;
  block[3] = &unk_1000F6530;
  v16 = v7;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void sub_100087794(uint64_t a1)
{
  unint64_t v1;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  _BOOL4 v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  unint64_t v49;
  char v50;
  NSObject *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  id *v62;
  id *v63;
  char *v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  id *v68;
  id v69;
  uint64_t v70;
  NSObject *v71;
  unint64_t v72;
  void *context;
  id v74;
  _QWORD *v75;
  id v76;
  id v77;
  id obj;
  _QWORD *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[4];
  int v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  unint64_t v90;
  __int16 v91;
  unint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  uint8_t buf[4];
  int v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  id v102;

  v3 = *(_QWORD **)(a1 + 64);
  context = objc_autoreleasePoolPush();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v77 = v7;
  v80 = v8;
  v9 = v5;
  v74 = v6;
  v10 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v98 = 0;
    v99 = 2082;
    v100 = "";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived\"}", buf, 0x12u);
  }
  v79 = v3;
  v11 = v3[21];
  v75 = v3 + 21;
  for (i = v3[22]; i != v11; i -= 48)

  v3[22] = v11;
  v76 = v9;
  if (v74)
  {
    v13 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "description", context)));
      v15 = objc_msgSend(v14, "UTF8String");
      *(_DWORD *)buf = 68289282;
      v98 = 0;
      v99 = 2082;
      v100 = "";
      v101 = 2082;
      v102 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,received update\", \"Error\":%{public, location:escape_only}s}", buf, 0x1Cu);

    }
    v16 = v79[12];
    if (v16)
    {
LABEL_73:
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v16 + 48))(v16, v75);
      *((_BYTE *)v79 + 137) = 0;
      goto LABEL_74;
    }
LABEL_77:
    sub_100004FB0();
  }
  if (!v9)
  {
    v18 = SALogObjectGeneral;
LABEL_70:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v98 = 0;
      v99 = 2082;
      v100 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,received update,no densityEvents\"}", buf, 0x12u);
    }
    v16 = v3[12];
    if (v16)
      goto LABEL_73;
    goto LABEL_77;
  }
  v17 = objc_msgSend(v9, "count", context);
  v18 = SALogObjectGeneral;
  if (!v17)
    goto LABEL_70;
  v19 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 68289282;
    v98 = 0;
    v99 = 2082;
    v100 = "";
    v101 = 1026;
    LODWORD(v102) = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,received update,\", \"count\":%{public}d}", buf, 0x18u);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v9;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v82;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v82 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
        v26 = v25 == 0;

        if (v26)
        {
          v33 = SALogObjectGeneral;
          if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            goto LABEL_60;
          *(_DWORD *)v85 = 68289026;
          v86 = 0;
          v87 = 2082;
          v88 = "";
          v34 = v33;
          v35 = "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,invalid start time,skipping\"}";
          goto LABEL_30;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
        objc_msgSend(v27, "timeIntervalSinceDate:", v80);
        if (v28 > 0.0)
        {

LABEL_28:
          v36 = SALogObjectGeneral;
          if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            goto LABEL_60;
          *(_DWORD *)v85 = 68289026;
          v86 = 0;
          v87 = 2082;
          v88 = "";
          v34 = v36;
          v35 = "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,event out of bound,skipping\"}";
LABEL_30:
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, v85, 0x12u);
          goto LABEL_60;
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
        if (v29)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
          objc_msgSend(v30, "timeIntervalSinceDate:", v77);
          v32 = v31 < 0.0;

          if (v32)
            goto LABEL_28;
        }
        else
        {

        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
        objc_msgSend(v37, "timeIntervalSinceReferenceDate");
        v39 = v38;

        objc_msgSend(v24, "scanDuration");
        objc_msgSend(v24, "densityScore");
        v41 = v40;
        objc_msgSend(v24, "scanDuration");
        v43 = v42;
        v44 = objc_alloc((Class)NSDictionary);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rssiHistogram"));
        v46 = objc_msgSend(v44, "initWithDictionary:", v45);

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
        if (v47)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
          objc_msgSend(v48, "timeIntervalSinceReferenceDate");
          v1 = v49;

          v50 = 1;
        }
        else
        {
          v50 = 0;
          v1 &= 0xFFFFFFFFFFFFFF00;
        }
        v51 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          v52 = v1;
          *(_DWORD *)v85 = 68290051;
          if (!v47)
            v52 = 0xBFF0000000000000;
          v86 = 0;
          v87 = 2082;
          v88 = "";
          v89 = 2049;
          v90 = v39;
          v91 = 2049;
          v92 = v52;
          v93 = 2049;
          v94 = v43;
          v95 = 2049;
          v96 = v41;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,adding density\", \"startTimestamp\":\"%{private}0.2f\", \"endTimestamp\":\"%{private}0.2f\", \"scanDuration\":\"%{private}0.2f\", \"densityScore\":\"%{private}0.2f\"}", v85, 0x3Au);
        }
        objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", &stru_1000F6578);
        v54 = v79[22];
        v53 = v79[23];
        if (v54 >= v53)
        {
          v56 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - *v75) >> 4);
          v57 = v56 + 1;
          if (v56 + 1 > 0x555555555555555)
            sub_100004C50();
          v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - *v75) >> 4);
          if (2 * v58 > v57)
            v57 = 2 * v58;
          if (v58 >= 0x2AAAAAAAAAAAAAALL)
            v59 = 0x555555555555555;
          else
            v59 = v57;
          if (v59)
          {
            if (v59 > 0x555555555555555)
              sub_100004984();
            v60 = (char *)operator new(48 * v59);
          }
          else
          {
            v60 = 0;
          }
          v61 = &v60[48 * v56];
          *(_QWORD *)v61 = v41;
          *((_QWORD *)v61 + 1) = v39;
          *((_QWORD *)v61 + 2) = v1;
          v61[24] = v50;
          *((_QWORD *)v61 + 4) = v43;
          *((_QWORD *)v61 + 5) = v46;
          v62 = (id *)v79[21];
          v63 = (id *)v79[22];
          if (v63 == v62)
          {
            v55 = v61 + 48;
            v79[21] = v61;
            v79[22] = v61 + 48;
            v79[23] = &v60[48 * v59];
          }
          else
          {
            v64 = v61;
            do
            {
              v65 = *((_OWORD *)v63 - 3);
              v66 = *((_OWORD *)v63 - 2);
              *((_QWORD *)v64 - 2) = *(v63 - 2);
              *((_OWORD *)v64 - 3) = v65;
              *((_OWORD *)v64 - 2) = v66;
              v67 = (uint64_t)*(v63 - 1);
              *(v63 - 1) = 0;
              *((_QWORD *)v64 - 1) = v67;
              v64 -= 48;
              v63 -= 6;
            }
            while (v63 != v62);
            v63 = (id *)v79[21];
            v68 = (id *)v79[22];
            v55 = v61 + 48;
            v79[21] = v64;
            v79[22] = v61 + 48;
            v79[23] = &v60[48 * v59];
            if (v68 != v63)
            {
              v9 = v76;
              do
              {

                v68 -= 6;
              }
              while (v68 != v63);
              if (!v63)
                goto LABEL_59;
LABEL_58:
              operator delete(v63);
              goto LABEL_59;
            }
          }
          v9 = v76;
          if (!v63)
            goto LABEL_59;
          goto LABEL_58;
        }
        *(_QWORD *)v54 = v41;
        *(_QWORD *)(v54 + 8) = v39;
        *(_QWORD *)(v54 + 16) = v1;
        *(_BYTE *)(v54 + 24) = v50;
        *(_QWORD *)(v54 + 32) = v43;
        *(_QWORD *)(v54 + 40) = v46;
        v55 = (char *)(v54 + 48);
        v9 = v76;
LABEL_59:
        v79[22] = v55;

LABEL_60:
        v23 = (char *)v23 + 1;
      }
      while (v23 != v21);
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
      v21 = v69;
    }
    while (v69);
  }

  v70 = v79[12];
  if (!v70)
    goto LABEL_77;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v70 + 48))(v70, v75);
  *((_BYTE *)v79 + 137) = 0;
  v71 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v72 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v79[22] - v79[21]) >> 4);
    *(_DWORD *)v85 = 68289282;
    v86 = 0;
    v87 = 2082;
    v88 = "";
    v89 = 2050;
    v90 = v72;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,fetch completed\", \"densityLen\":%{public}lu}", v85, 0x1Cu);
  }
LABEL_74:

  objc_autoreleasePoolPop(context);
}

void sub_1000880B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_10008819C(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0
    && (v8 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
  {
    v9 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "doubleValue");
      v11 = v10;
      objc_msgSend(v6, "doubleValue");
      v14 = 68289539;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 1025;
      v19 = (int)v11;
      v20 = 1025;
      v21 = (int)v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,rssiHist\", \"rssi\":%{private}d, \"numDevices\":%{private}d}", (uint8_t *)&v14, 0x1Eu);
    }

  }
  else
  {
    v13 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onPeopleDensityReceived,rssiHist,invalid Type\"}", (uint8_t *)&v14, 0x12u);
    }
  }

}

void sub_10008834C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100088374(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 68289026;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,startMonitoringForPeopleDensity\"}", (uint8_t *)&v5, 0x12u);
  }
  if (*(_QWORD *)(a1 + 8))
  {
    v3 = objc_msgSend(objc_alloc((Class)RTPeopleDiscoveryServiceConfiguration), "initWithServiceLevel:storageDuration:observationInterval:densityCallbackConfiguration:", 2, 2, 2, 0);
    objc_msgSend(*(id *)(a1 + 8), "startMonitoringForPeopleDiscovery:handler:", v3, &stru_1000F6598);

  }
  else
  {
    v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#coreRoutine,startMonitoringForPeopleDensity,invalid instance\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

void sub_1000884D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000884EC(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;

  v2 = a2;
  if (v2)
  {
    v3 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description")));
      v5[0] = 68289282;
      v5[1] = 0;
      v6 = 2082;
      v7 = "";
      v8 = 2082;
      v9 = objc_msgSend(v4, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,startMonitoringForPeopleDiscovery,\", \"Error\":%{public, location:escape_only}s}", (uint8_t *)v5, 0x1Cu);

    }
  }

}

void sub_1000885E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100088608(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 68289026;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,stopMonitoringForPeopleDensity\"}", (uint8_t *)&v5, 0x12u);
  }
  v3 = *(void **)(a1 + 8);
  if (v3)
  {
    objc_msgSend(v3, "stopMonitoringForPeopleDiscoveryWithHandler:", &stru_1000F65B8);
  }
  else
  {
    v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#coreRoutine,stopMonitoringForPeopleDensity,invalid instance\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

void sub_100088738(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;

  v2 = a2;
  if (v2)
  {
    v3 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description")));
      v5[0] = 68289282;
      v5[1] = 0;
      v6 = 2082;
      v7 = "";
      v8 = 2082;
      v9 = objc_msgSend(v4, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,stopMonitoringForPeopleDensity,\", \"Error\":%{public, location:escape_only}s}", (uint8_t *)v5, 0x1Cu);

    }
  }

}

void sub_10008882C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100088854(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,getCurrentPeopleDensity\"}", buf, 0x12u);
  }
  v3 = *(void **)(a1 + 8);
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000889B0;
    v5[3] = &unk_1000F6600;
    v5[4] = a1;
    objc_msgSend(v3, "fetchCurrentPeopleDensity:", v5);
  }
  else
  {
    v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,getCurrentPeopleDensity,invalid fRoutineManager\"}", buf, 0x12u);
    }
  }
}

void sub_1000889B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088A5C;
  block[3] = &unk_1000F65E0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void sub_100088A5C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = objc_autoreleasePoolPush();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100088AF8;
  v5[3] = &unk_1000F65E0;
  v7 = v2;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  sub_100088AF8((uint64_t)v5);

  objc_autoreleasePoolPop(v3);
}

void sub_100088AE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100088AF8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char isKindOfClass;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  unint64_t v53;

  v1 = *(void **)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onCurrentPeopleDensityReceived\"}", buf, 0x12u);
  }
  v37 = 0xBFF0000000000000;
  LOBYTE(v38) = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  if (v4)
  {
    v6 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
      v8 = objc_msgSend(v7, "UTF8String");
      *(_DWORD *)buf = 68289282;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      v46 = 2082;
      v47 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onCurrentPeopleDensityReceived\", \"Error\":%{public, location:escape_only}s}", buf, 0x1Cu);

    }
    goto LABEL_28;
  }
  if (!v3)
  {
    v32 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 68289026;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v33 = "{\"msg%{public}.0s\":\"#coreRoutine,onCurrentPeopleDensityReceived,event nil\"}";
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0x12u);
    goto LABEL_28;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  if (!v9)
    goto LABEL_25;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  if (v11 <= 0.0 || (objc_msgSend(v3, "scanDuration"), v12 <= 0.0))
  {

    goto LABEL_25;
  }
  objc_msgSend(v3, "densityScore");
  v14 = v13 < 0.0;

  if (v14)
  {
LABEL_25:
    v32 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 68289026;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v33 = "{\"msg%{public}.0s\":\"#coreRoutine,onCurrentPeopleDensityReceived,invalid event values\"}";
    goto LABEL_27;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = (void *)v16;
  v37 = v16;

  objc_msgSend(v3, "scanDuration");
  v19 = v18;
  v40 = v18;
  objc_msgSend(v3, "densityScore");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate", v20, v37));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v38 = v24;
    v39 = 1;

  }
  v25 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v38;
    if (!v22)
      v26 = 0xBFF0000000000000;
    *(_DWORD *)buf = 68290051;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v46 = 2049;
    v47 = v17;
    v48 = 2049;
    v49 = v19;
    v50 = 2049;
    v51 = v21;
    v52 = 2049;
    v53 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,onCurrentPeopleDensityReceived,adding density\", \"startTimestamp\":\"%{private}0.2f\", \"scanDuration\":\"%{private}0.2f\", \"densityScore\":\"%{private}0.2f\", \"endTimestamp\":\"%{private}0.2f\"}", buf, 0x3Au);
  }
  objc_msgSend(v3, "densityScore");
  if (v27 > 0.0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rssiHistogram"));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rssiHistogram"));
      v30 = objc_opt_class(NSDictionary);
      isKindOfClass = objc_opt_isKindOfClass(v29, v30);

      if ((isKindOfClass & 1) != 0)
      {
        v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rssiHistogram"));
        objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", &stru_1000F6620);
      }
    }
  }
LABEL_28:
  v34 = *(_QWORD *)(v2 + 128);
  if (!v34)
    sub_100004FB0();
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v34 + 48))(v34, &v36);

  v35 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,getCurrentPeopleDensity,done\"}", buf, 0x12u);
  }
}

void sub_100088FC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10008905C(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0
    && (v8 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
  {
    v9 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "doubleValue");
      v11 = v10;
      objc_msgSend(v6, "doubleValue");
      v14 = 68289539;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 1025;
      v19 = (int)v11;
      v20 = 1025;
      v21 = (int)v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#coreRoutine,onCurrentPeopleDensityReceived,rssiHist\", \"rssi\":%{private}d, \"numDevices\":%{private}d}", (uint8_t *)&v14, 0x1Eu);
    }

  }
  else
  {
    v13 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v14 = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#coreRoutine,onCurrentPeopleDensityReceived,rssiHist,invalid Type\"}", (uint8_t *)&v14, 0x12u);
    }
  }

}

void sub_10008920C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100089234(void ***a1)
{
  void **v1;
  id *v2;
  id *v4;
  void *v5;
  id *v6;

  v1 = *a1;
  v2 = (id *)**a1;
  if (v2)
  {
    v4 = (id *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 6;

        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void SAMobileAsset::create(void *a1)
{
  id v1;

  v1 = a1;
  if (*((_BYTE *)sub_10003D044() + 104))
    operator new();
  operator new();
}

void sub_1000893C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == v13)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  operator delete();
}

void SACloudChannel::create(void *a1)
{
  a1;
  if (*((_BYTE *)sub_10003D044() + 25))
    sub_10008952C();
  sub_1000896C4();
}

void sub_100089510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_10008952C()
{
  operator new();
}

void sub_100089634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a13;
  if (a13 == v17)
  {
    v19 = 4;
    v18 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  v20 = a17;
  if (a17 == &a14)
  {
    v21 = 4;
    v20 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  operator delete();
}

void sub_1000896C4()
{
  operator new();
}

void sub_1000897E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a13;
  if (a13 == v17)
  {
    v19 = 4;
    v18 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  v20 = a17;
  if (a17 == &a14)
  {
    v21 = 4;
    v20 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  operator delete();
}

void SafetyAlertsDaemonInterface::create(void *a1)
{
  id v1;

  v1 = a1;
  if (*((_BYTE *)sub_10003D044() + 49))
    operator new();
  operator new();
}

void sub_10008996C(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  sub_10007958C((uint64_t *)va);
  operator delete();
}

SafetyAlertsDaemonInterface *SafetyAlertsDaemonInterface::SafetyAlertsDaemonInterface(SafetyAlertsDaemonInterface *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  *(_QWORD *)a1 = off_1000F6350;
  sub_10007931C((uint64_t)a1 + 8, a3);
  v6 = v5;
  *((_QWORD *)a1 + 37) = v6;
  *((_QWORD *)a1 + 38) = 0;
  SafetyAlertsDaemonInterface::setupXpcConnection(a1);

  return a1;
}

void sub_100089A30(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  sub_10007958C(v3);
  _Unwind_Resume(a1);
}

void SafetyAlertsDaemonInterface::setupXpcConnection(SafetyAlertsDaemonInterface *this)
{
  NSObject *v2;
  xpc_connection_t mach_service;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  _QWORD handler[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#daemonInterface,setupXpcConnection\"}", buf, 0x12u);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.safetyalerts", *((dispatch_queue_t *)this + 37), 1uLL);
  v4 = (void *)*((_QWORD *)this + 38);
  *((_QWORD *)this + 38) = mach_service;

  v5 = (_xpc_connection_s *)*((_QWORD *)this + 38);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100089BD8;
  handler[3] = &unk_1000F1DE8;
  handler[4] = this;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_activate(*((xpc_connection_t *)this + 38));
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#daemonInterface,xpc_connection_resumed\"}", buf, 0x12u);
  }
}

void sub_100089BD8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _BYTE v12[24];
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_autoreleasePoolPush();
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    v8 = v3;
    v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289026;
      *(_WORD *)v12 = 2082;
      *(_QWORD *)&v12[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#daemonInterface,handleXpcConnection\"}", (uint8_t *)&v11, 0x12u);
    }
    v11 = (uint64_t)_NSConcreteStackBlock;
    *(_QWORD *)v12 = 3221225472;
    *(_QWORD *)&v12[8] = sub_100089DF0;
    *(_QWORD *)&v12[16] = &unk_1000F66B8;
    v14 = v4;
    v10 = v8;
    v13 = v10;
    xpc_connection_set_event_handler((xpc_connection_t)v10, &v11);
    xpc_connection_activate((xpc_connection_t)v10);

  }
  else
  {
    v6 = xpc_copy_description(v3);
    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289283;
      *(_WORD *)v12 = 2082;
      *(_QWORD *)&v12[2] = "";
      *(_WORD *)&v12[10] = 2081;
      *(_QWORD *)&v12[12] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Received object\", \"description\":%{private, location:escape_only}s}", (uint8_t *)&v11, 0x1Cu);
    }
    free(v6);
  }
  objc_autoreleasePoolPop(v5);

}

void sub_100089DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_100089DF0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL value;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_autoreleasePoolPush();
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    v6 = xpc_copy_description(v3);
    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 68289283;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2081;
      v18 = v6;
      v8 = "{\"msg%{public}.0s\":\"#daemonInterface,Connection received error\", \"description\":%{private, location:escape_only}s}";
      goto LABEL_7;
    }
LABEL_8:
    free(v6);
    goto LABEL_9;
  }
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v6 = xpc_copy_description(v3);
    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 68289283;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2081;
      v18 = v6;
      v8 = "{\"msg%{public}.0s\":\"#daemonInterface,Connection received object\", \"description\":%{private, location:escape_only}s}";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0x1Cu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v9 = (void *)xpc_connection_copy_entitlement_value(*(_QWORD *)(a1 + 32), "com.apple.safetyalerts.spi");
  v10 = v9;
  if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL)
  {
    value = xpc_BOOL_get_value(v10);

    if (value)
    {
      (*(void (**)(uint64_t, id))(*(_QWORD *)v4 + 24))(v4, v3);
      goto LABEL_9;
    }
  }
  else
  {

  }
  v11 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 68289283;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2081;
    v18 = "com.apple.safetyalerts.spi";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#daemonInterface,notEntitled\", \"entitlement\":%{private, location:escape_only}s}", (uint8_t *)&v13, 0x1Cu);
  }
LABEL_9:
  objc_autoreleasePoolPop(v5);

}

void sub_10008A068(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

SafetyAlertsDaemonInterface *SafetyAlertsDaemonInterfaceTest::SafetyAlertsDaemonInterfaceTest(SafetyAlertsDaemonInterface *a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v7[36];

  v5 = a2;
  sub_10007931C((uint64_t)v7, a3);
  SafetyAlertsDaemonInterface::SafetyAlertsDaemonInterface(a1, v5, (uint64_t)v7);
  sub_10007958C(v7);
  *(_QWORD *)a1 = off_1000F66E8;

  return a1;
}

void sub_10008A130(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  sub_10007958C((uint64_t *)va);

  _Unwind_Resume(a1);
}

void SafetyAlertsDaemonInterfaceTest::~SafetyAlertsDaemonInterfaceTest(id *this)
{
  SafetyAlertsDaemonInterfaceProd::~SafetyAlertsDaemonInterfaceProd(this);
  operator delete();
}

void SafetyAlertsDaemonInterfaceTest::processMessage(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  __int128 *v4;
  xpc_object_t reply;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;

  v2 = a2;
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2081;
    v11 = "testMessage";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#daemonInterfaceTest,processMessage\", \"message\":%{private, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  v4 = sub_100017A18();
  sub_100017B10(v4, v2);
  reply = xpc_dictionary_create_reply(v2);
  v6 = reply;
  if (reply)
    xpc_dictionary_send_reply(reply);

}

void sub_10008A278(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

_QWORD *SACoreRoutineTest::SACoreRoutineTest(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v17;
  void *__p[2];
  uint64_t v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  _BYTE v25[24];
  _BYTE *v26;
  _BYTE v27[24];
  _BYTE *v28;
  uint64_t v29;
  _QWORD *v30;

  v7 = a2;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_100004870(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3;
    v20 = *(_QWORD *)(a3 + 16);
  }
  sub_100004F4C((uint64_t)v25, a4);
  v8 = v27;
  sub_100004F4C((uint64_t)v27, a4 + 32);
  v9 = sub_100004F4C((uint64_t)&v29, a4 + 64);
  *a1 = off_1000F6678;
  v12 = v30;
  if (v30 == (_QWORD *)v9)
  {
    v13 = 4;
    v12 = (_QWORD *)v9;
  }
  else
  {
    if (!v30)
      goto LABEL_9;
    v13 = 5;
  }
  (*(void (**)(_QWORD *))(*v12 + 8 * v13))(v12);
LABEL_9:
  if (v28 == v27)
  {
    v14 = 4;
  }
  else
  {
    if (!v28)
      goto LABEL_14;
    v14 = 5;
    v8 = v28;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v14))(v8);
LABEL_14:
  v15 = v26;
  if (v26 == v25)
  {
    v16 = 4;
    v15 = v25;
  }
  else
  {
    if (!v26)
      goto LABEL_19;
    v16 = 5;
  }
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*v15 + 8 * v16))(v15, v10, v11);
LABEL_19:
  if (SHIBYTE(v20) < 0)
    operator delete(__p[0]);
  *a1 = off_1000F6730;
  v17 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,SACoreRoutineTest\"}", buf, 0x12u);
  }

  return a1;
}

void sub_10008A490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  void *v26;

  _Unwind_Resume(a1);
}

void sub_10008A534()
{
  operator delete();
}

void sub_10008A548()
{
  NSObject *v0;
  _DWORD v1[2];
  __int16 v2;
  const char *v3;

  v0 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 68289026;
    v1[1] = 0;
    v2 = 2082;
    v3 = "";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,Test,getHistoricalLocation\"}", (uint8_t *)v1, 0x12u);
  }
}

void sub_10008A5F8()
{
  NSObject *v0;
  _DWORD v1[2];
  __int16 v2;
  const char *v3;

  v0 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 68289026;
    v1[1] = 0;
    v2 = 2082;
    v3 = "";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,Test,getPeopleDensity\"}", (uint8_t *)v1, 0x12u);
  }
}

void sub_10008A6A8()
{
  NSObject *v0;
  _DWORD v1[2];
  __int16 v2;
  const char *v3;

  v0 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 68289026;
    v1[1] = 0;
    v2 = 2082;
    v3 = "";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,Test,getCurrentPeopleDensity\"}", (uint8_t *)v1, 0x12u);
  }
}

void sub_10008A758()
{
  NSObject *v0;
  _DWORD v1[2];
  __int16 v2;
  const char *v3;

  v0 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 68289026;
    v1[1] = 0;
    v2 = 2082;
    v3 = "";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,Test,stopMonitoringForPeopleDensity\"}", (uint8_t *)v1, 0x12u);
  }
}

void sub_10008A808()
{
  NSObject *v0;
  _DWORD v1[2];
  __int16 v2;
  const char *v3;

  v0 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 68289026;
    v1[1] = 0;
    v2 = 2082;
    v3 = "";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreRoutine,Test,startMonitoringForPeopleDensity\"}", (uint8_t *)v1, 0x12u);
  }
}

uint64_t SAGridId::generateGlobalTileIdFromLatLonAndGridSizeInDegrees(SAGridId *this, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  double v17;
  NSObject *v18;
  int v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;

  if (a2 - a5 < -90.0 || a3 - a6 > 180.0 || a2 - a5 > 90.0 || a3 - a6 < -180.0)
  {
    v18 = SALogObjectGeneral;
    v15 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 68289795;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2049;
      v25 = a2;
      v26 = 2049;
      v27 = a3;
      v28 = 2049;
      v29 = a5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#gi,#generateGlobalTileIdFromLatLonAndGridSizeInDegrees,invalidLoc\", \"lat\":\"%{private}0.3f\", \"lon\":\"%{private}0.3f\", \"gridLatOffset\":\"%{private}0.3f\"}", (uint8_t *)&v20, 0x30u);
      return 0;
    }
  }
  else
  {
    LODWORD(v6) = vcvtad_u64_f64(100.0 / (a4 * 100.0));
    LODWORD(v8) = vcvtpd_u64_f64((360.0 - a6) * (double)v6);
    LODWORD(v7) = vcvtmd_u64_f64((a3 + 180.0 - a6) * (double)v6);
    v14 = (floor((a2 + 90.0 - a5) * (double)v6) * (double)LODWORD(v8));
    v15 = (v14 + v7);
    v16 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v17) = vcvtpd_u64_f64((180.0 - a5) * (double)v6);
      v20 = 68291843;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2049;
      v25 = v8;
      v26 = 2049;
      v27 = v17;
      v28 = 2049;
      v29 = a4;
      v30 = 2049;
      v31 = v7;
      v32 = 2049;
      v33 = v14;
      v34 = 2049;
      v35 = (v14 + v7);
      v36 = 2049;
      v37 = v6;
      v38 = 2049;
      v39 = a2;
      v40 = 2049;
      v41 = a3;
      v42 = 2049;
      v43 = a5;
      v44 = 2049;
      v45 = a6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#gi,#generateGlobalTileIdFromLatLonAndGridSizeInDegrees\", \"totalGridsInEachRow\":%{private}lu, \"totalGridsInEachCol\":%{private}lu, \"gridSizeInDegrees\":\"%{private}0.3f\", \"swXIndex\":%{private}lu, \"swYIndex\":%{private}lu, \"curGlobalIndex\":%{private}lu, \"multiplier\":%{private}lu, \"lat\":\"%{private}0.3f\", \"lon\":\"%{private}0.3f\", \"gridLatOffset\":\"%{private}0.3f\", \"gridLonOffset\":\"%{private}0.3f\"}", (uint8_t *)&v20, 0x80u);
    }
  }
  return v15;
}

void SAGeometry::SAGeometry(SAGeometry *this, NSDictionary *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  objc_object *v8;
  SAGeometry *PolygonFromCoordinates;
  SAGeometry *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  SAGeometry *v14;
  NSObject *v15;
  uint64_t v16;
  SAGeometry *v17;
  SAGeometry *v18;
  objc_object *v19;
  SAGeometry *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  NSObject *v35;
  SAGeometry *v36;
  unsigned int v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char isKindOfClass;
  NSObject *v49;
  void *v50;
  double v51;
  CLLocationDegrees v52;
  void *v53;
  double v54;
  CLLocationDegrees v55;
  id v56;
  id v57;
  CLLocationCoordinate2D v58;
  id v59;
  id v60;
  CLLocationCoordinate2D v61;
  id v62;
  id v63;
  CLLocationDegrees v64;
  CLLocationCoordinate2D v65;
  id v66;
  id v67;
  CLLocationCoordinate2D v68;
  id v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *j;
  id v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  SAGeometry *v85;
  void *v86;
  uint64_t v87;
  double v88;
  double v89;
  void *v90;
  uint64_t v91;
  double v92;
  double v93;
  void *v94;
  uint64_t v95;
  double v96;
  double v97;
  int v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  const char *v102;
  NSObject *v103;
  uint64_t v104;
  const char *v105;
  NSObject *v106;
  uint32_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  id v111;
  SAGeometry *v112;
  SAGeometry *obj;
  id v114;
  NSDictionary *v115;
  void *v116;
  uint64_t v117;
  SAGeometry *v118;
  uint64_t v119;
  id v120;
  SAGeometry *v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t buf;
  __int16 v139;
  const char *v140;
  __int16 v141;
  _BYTE v142[18];
  __int16 v143;
  int v144;

  v115 = a2;
  *(_QWORD *)this = 0;
  *((_BYTE *)this + 8) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0xBFF0000000000000;
  *((_DWORD *)this + 10) = 4;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = *(void **)this;
  *(_QWORD *)this = v3;

  if (!*(_QWORD *)this)
  {
    v103 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v139 = 2082;
      v140 = "";
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#geometry,CannotInstantiate\"}", (uint8_t *)&buf, 0x12u);
      v103 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      buf = 68289795;
      v139 = 2082;
      v140 = "";
      v141 = 2081;
      *(_QWORD *)v142 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/geometry/SAGeometry.mm";
      *(_WORD *)&v142[8] = 2081;
      *(_QWORD *)&v142[10] = "SAGeometry";
      v143 = 1026;
      v144 = 43;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
    }
    __assert_rtn("SAGeometry", "SAGeometry.mm", 43, "false && \"#geometry,CannotInstantiate\"");
  }
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v115, "objectForKey:", CFSTR("type")));
  v121 = this;
  v118 = (SAGeometry *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v115, "objectForKey:", CFSTR("coordinates")));
  if (!v122 || !v118)
  {
    v12 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    buf = 68289026;
    v139 = 2082;
    v140 = "";
    v13 = "{\"msg%{public}.0s\":\"#geometry,MissingEntries\"}";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&buf, 0x12u);
    goto LABEL_47;
  }
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v122, v5) & 1) == 0)
  {
    v12 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    buf = 68289026;
    v139 = 2082;
    v140 = "";
    v13 = "{\"msg%{public}.0s\":\"#geometry,BadPolygonType\"}";
    goto LABEL_20;
  }
  v6 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v118, v6) & 1) != 0)
  {
    v111 = v122;
    if (objc_msgSend(v111, "isEqualToString:", CFSTR("Polygon")))
    {
      v7 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        buf = 68289026;
        v139 = 2082;
        v140 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#geometry,Polygon\"}", (uint8_t *)&buf, 0x12u);
      }
      PolygonFromCoordinates = SAGeometry::getPolygonFromCoordinates(v118, v8);
      v10 = (SAGeometry *)objc_claimAutoreleasedReturnValue(PolygonFromCoordinates);
      if (v10)
      {
        v11 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289283;
          v139 = 2082;
          v140 = "";
          v141 = 2113;
          *(_QWORD *)v142 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,CLPolygonCreated\", \"polygon\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
        }
        objc_msgSend(*(id *)this, "addObject:", v10);
      }
      *((_DWORD *)this + 10) = 1;
      goto LABEL_42;
    }
    if (objc_msgSend(v111, "isEqualToString:", CFSTR("MultiPolygon")))
    {
      v14 = v118;
      v112 = v14;
      v114 = -[SAGeometry count](v14, "count");
      v15 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289539;
        v139 = 2082;
        v140 = "";
        v141 = 1025;
        *(_DWORD *)v142 = (_DWORD)v114;
        *(_WORD *)&v142[4] = 2113;
        *(_QWORD *)&v142[6] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,MultiPolygon\", \"count\":%{private}d, \"coordinateObjects\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x22u);
      }
      if (v114)
      {
        v16 = 0;
        do
        {
          v119 = v16;
          v17 = (SAGeometry *)objc_claimAutoreleasedReturnValue(-[SAGeometry objectAtIndex:](v112, "objectAtIndex:"));
          v18 = v17;
          v20 = SAGeometry::getPolygonFromCoordinates(v17, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v21)
          {
            v22 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              buf = 68289283;
              v139 = 2082;
              v140 = "";
              v141 = 2113;
              *(_QWORD *)v142 = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,CLPolygonCreated\", \"polygon\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
            }
            v116 = v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "vertices"));
            v133 = 0u;
            v134 = 0u;
            v131 = 0u;
            v132 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
            if (v25)
            {
              v26 = *(_QWORD *)v132;
              do
              {
                for (i = 0; i != v25; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v132 != v26)
                    objc_enumerationMutation(v24);
                  v28 = *(id *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)i);
                  v29 = SALogObjectGeneral;
                  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                  {
                    buf = 68289283;
                    v139 = 2082;
                    v140 = "";
                    v141 = 2113;
                    *(_QWORD *)v142 = v28;
                    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,vertex\", \"vertex\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
                  }

                }
                v17 = v18;
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v131, v137, 16);
              }
              while (v25);
            }

            objc_msgSend(*(id *)v121, "addObject:", v116);
            v21 = v116;
          }

          this = v121;
          v16 = v119 + 1;
        }
        while ((id)(v119 + 1) != v114);
      }
      *((_DWORD *)this + 10) = 2;
      goto LABEL_41;
    }
    if (objc_msgSend(v111, "isEqualToString:", CFSTR("Grids")))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v115, "objectForKey:", CFSTR("resolution")));
      if (!v31 || (v32 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v31, v32) & 1) == 0))
      {
        v99 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289026;
          v139 = 2082;
          v140 = "";
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,BadPolygonResolution\"}", (uint8_t *)&buf, 0x12u);
        }

        goto LABEL_46;
      }
      v112 = (SAGeometry *)v31;
      objc_msgSend(v31, "doubleValue");
      v34 = v33;
      v35 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        buf = 68289026;
        v139 = 2082;
        v140 = "";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#geometry,Grids\"}", (uint8_t *)&buf, 0x12u);
      }
      v36 = v118;
      v37 = -[SAGeometry count](v36, "count", v36);
      v38 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289539;
        v139 = 2082;
        v140 = "";
        v141 = 1025;
        *(_DWORD *)v142 = v37;
        *(_WORD *)&v142[4] = 2113;
        *(_QWORD *)&v142[6] = v36;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,Grids\", \"count\":%{private}d, \"coordinateObjects\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x22u);
      }
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      obj = v36;
      v39 = -[SAGeometry countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
      if (!v39)
      {
LABEL_96:

        *((_DWORD *)v121 + 10) = 3;
LABEL_41:
        v10 = v112;
LABEL_42:

LABEL_43:
        v30 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289026;
          v139 = 2082;
          v140 = "";
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,created\"}", (uint8_t *)&buf, 0x12u);
        }
        *((_BYTE *)v121 + 8) = *((_DWORD *)v121 + 10) != 4;
        goto LABEL_46;
      }
      v117 = *(_QWORD *)v128;
LABEL_57:
      v120 = v39;
      v40 = 0;
      while (1)
      {
        if (*(_QWORD *)v128 != v117)
          objc_enumerationMutation(obj);
        v41 = *(id *)(*((_QWORD *)&v127 + 1) + 8 * v40);
        v42 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289026;
          v139 = 2082;
          v140 = "";
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,getPolygonFromGridCoordinate\"}", (uint8_t *)&buf, 0x12u);
        }
        v43 = objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v41, v43) & 1) == 0)
          break;
        if ((unint64_t)objc_msgSend(v41, "count") < 2 || (unint64_t)objc_msgSend(v41, "count") > 3)
          goto LABEL_89;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndex:", 0));
        v45 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v44, v45) & 1) == 0)
        {

LABEL_89:
          v84 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            buf = 68289026;
            v139 = 2082;
            v140 = "";
            v82 = v84;
            v83 = "{\"msg%{public}.0s\":\"#geometry,getPolygonFromGridCoordinate,Invalid Args\"}";
LABEL_91:
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, v83, (uint8_t *)&buf, 0x12u);
          }
          goto LABEL_92;
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndex:", 1));
        v47 = objc_opt_class(NSNumber);
        isKindOfClass = objc_opt_isKindOfClass(v46, v47);

        if ((isKindOfClass & 1) == 0)
          goto LABEL_89;
        v49 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289283;
          v139 = 2082;
          v140 = "";
          v141 = 2113;
          *(_QWORD *)v142 = v41;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,getPolygonFromGridCoordinate\", \"object\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
        }
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndex:", 1));
        objc_msgSend(v50, "doubleValue");
        v52 = v51;

        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndex:", 0));
        objc_msgSend(v53, "doubleValue");
        v55 = v54;

        v56 = objc_alloc_init((Class)NSMutableArray);
        v57 = objc_alloc((Class)_CLVertex);
        v58 = CLLocationCoordinate2DMake(v52, v55);
        v59 = objc_msgSend(v57, "initWithCoordinate:", v58.latitude, v58.longitude);
        objc_msgSend(v56, "addObject:", v59);
        v60 = objc_alloc((Class)_CLVertex);
        v61 = CLLocationCoordinate2DMake(v34 + v52, v55);
        v62 = objc_msgSend(v60, "initWithCoordinate:", v61.latitude, v61.longitude);
        objc_msgSend(v56, "addObject:");
        v63 = objc_alloc((Class)_CLVertex);
        v64 = v34 + v55;
        v65 = CLLocationCoordinate2DMake(v34 + v52, v64);
        v66 = objc_msgSend(v63, "initWithCoordinate:", v65.latitude, v65.longitude);
        objc_msgSend(v56, "addObject:", v66);
        v67 = objc_alloc((Class)_CLVertex);
        v68 = CLLocationCoordinate2DMake(v52, v64);
        v69 = objc_msgSend(v67, "initWithCoordinate:", v68.latitude, v68.longitude);
        objc_msgSend(v56, "addObject:", v69);
        objc_msgSend(v56, "addObject:", v59);
        v70 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
        {
          buf = 68289283;
          v139 = 2082;
          v140 = "";
          v141 = 2113;
          *(_QWORD *)v142 = v56;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#geometry,vertices\", \"vertices\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
        }
        v71 = objc_msgSend(objc_alloc((Class)_CLPolygonalRegion), "initWithVertices:identifier:", v56, CFSTR("polygon"));
        v72 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
        {
          buf = 68289283;
          v139 = 2082;
          v140 = "";
          v141 = 2113;
          *(_QWORD *)v142 = v71;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#geometry,region\", \"region\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
        }

        if (!v71)
          goto LABEL_94;
        v73 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289283;
          v139 = 2082;
          v140 = "";
          v141 = 2113;
          *(_QWORD *)v142 = v71;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,Grids,CLPolygonCreated\", \"polygon\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
        }
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "vertices"));
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v75 = v74;
        v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
        if (v76)
        {
          v77 = *(_QWORD *)v124;
          do
          {
            for (j = 0; j != v76; j = (char *)j + 1)
            {
              if (*(_QWORD *)v124 != v77)
                objc_enumerationMutation(v75);
              v79 = *(id *)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)j);
              v80 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                buf = 68289283;
                v139 = 2082;
                v140 = "";
                v141 = 2113;
                *(_QWORD *)v142 = v79;
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,Grids\", \"vertex\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
              }

            }
            v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
          }
          while (v76);
        }

        objc_msgSend(*(id *)v121, "addObject:", v71);
LABEL_93:

LABEL_94:
        if ((id)++v40 == v120)
        {
          v39 = -[SAGeometry countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
          if (!v39)
            goto LABEL_96;
          goto LABEL_57;
        }
      }
      v81 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289026;
        v139 = 2082;
        v140 = "";
        v82 = v81;
        v83 = "{\"msg%{public}.0s\":\"#geometry,getPolygonFromGridCoordinate,invalid Type\"}";
        goto LABEL_91;
      }
LABEL_92:
      v71 = 0;
      v75 = v41;
      goto LABEL_93;
    }
    if (!objc_msgSend(v111, "isEqualToString:", CFSTR("Circle")))
      goto LABEL_43;
    v85 = v118;
    if (-[SAGeometry count](v85, "count") != (id)2)
    {
      v100 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289026;
        v139 = 2082;
        v140 = "";
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,BadCircleCenterCoordCount\"}", (uint8_t *)&buf, 0x12u);
      }

      goto LABEL_46;
    }
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[SAGeometry objectAtIndex:](v85, "objectAtIndex:", 0));
    if (v86 && (v87 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v86, v87) & 1) != 0))
    {
      objc_msgSend(v86, "doubleValue");
      v89 = v88;
      if (v88 >= -90.0 && v88 <= 90.0)
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[SAGeometry objectAtIndex:](v85, "objectAtIndex:", 1));
        if (v90 && (v91 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v90, v91) & 1) != 0))
        {
          objc_msgSend(v90, "doubleValue");
          v93 = v92;
          if (v92 >= -180.0 && v92 <= 180.0)
          {
            if (fabs(fabs(v89) + -0.0000001) > 0.0000001 || fabs(fabs(v92) + -0.0000001) > 0.0000001)
            {
              v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v115, "objectForKey:", CFSTR("radiusMeters")));
              if (v94 && (v95 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v94, v95) & 1) != 0))
              {
                objc_msgSend(v94, "doubleValue");
                v97 = v96;
                if (v96 > 0.0)
                {
                  v98 = 0;
                  *((double *)this + 2) = v89;
                  *((double *)this + 3) = v93;
                  *((double *)this + 4) = v96;
                  *((_DWORD *)this + 10) = 0;
LABEL_143:

LABEL_135:
                  if (!v98)
                    goto LABEL_43;
LABEL_46:

                  goto LABEL_47;
                }
                v108 = SALogObjectGeneral;
                if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                {
                  buf = 68289283;
                  v139 = 2082;
                  v140 = "";
                  v141 = 2049;
                  *(double *)v142 = v97;
                  v109 = "{\"msg%{public}.0s\":\"#geometry,InvalidCircleRadiusValue\", \"value\":\"%{private}0.1f\"}";
                  goto LABEL_141;
                }
              }
              else
              {
                v108 = SALogObjectGeneral;
                if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                {
                  buf = 68289283;
                  v139 = 2082;
                  v140 = "";
                  v141 = 2113;
                  *(_QWORD *)v142 = v94;
                  v109 = "{\"msg%{public}.0s\":\"#geometry,BadCircleRadius\", \"value\":%{private, location:escape_only}@}";
LABEL_141:
                  _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, v109, (uint8_t *)&buf, 0x1Cu);
                }
              }
              v98 = 1;
              goto LABEL_143;
            }
            v110 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              buf = 68289539;
              v139 = 2082;
              v140 = "";
              v141 = 2049;
              *(double *)v142 = v89;
              *(_WORD *)&v142[8] = 2049;
              *(double *)&v142[10] = v93;
              v105 = "{\"msg%{public}.0s\":\"#geometry,InvalidCircleCenter\", \"value\":\"%{private}0.1f\", \"value\":\"%"
                     "{private}0.1f\"}";
              v106 = v110;
              v107 = 38;
              goto LABEL_133;
            }
LABEL_134:
            v98 = 1;
            goto LABEL_135;
          }
          v104 = SALogObjectGeneral;
          if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            goto LABEL_134;
          buf = 68289283;
          v139 = 2082;
          v140 = "";
          v141 = 2049;
          *(double *)v142 = v93;
          v105 = "{\"msg%{public}.0s\":\"#geometry,InvalidCircleLon\", \"value\":\"%{private}0.1f\"}";
        }
        else
        {
          v104 = SALogObjectGeneral;
          if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            goto LABEL_134;
          buf = 68289283;
          v139 = 2082;
          v140 = "";
          v141 = 2113;
          *(_QWORD *)v142 = v90;
          v105 = "{\"msg%{public}.0s\":\"#geometry,BadCircleCenterLon\", \"value\":%{private, location:escape_only}@}";
        }
        v106 = v104;
        v107 = 28;
LABEL_133:
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, v105, (uint8_t *)&buf, v107);
        goto LABEL_134;
      }
      v101 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289283;
        v139 = 2082;
        v140 = "";
        v141 = 2049;
        *(double *)v142 = v89;
        v102 = "{\"msg%{public}.0s\":\"#geometry,InvalidCircleLat\", \"value\":\"%{private}0.1f\"}";
        goto LABEL_121;
      }
    }
    else
    {
      v101 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289283;
        v139 = 2082;
        v140 = "";
        v141 = 2113;
        *(_QWORD *)v142 = v86;
        v102 = "{\"msg%{public}.0s\":\"#geometry,BadCircleCenterLat\", \"value\":%{private, location:escape_only}@}";
LABEL_121:
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, v102, (uint8_t *)&buf, 0x1Cu);
      }
    }

    goto LABEL_46;
  }
  v12 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v139 = 2082;
    v140 = "";
    v13 = "{\"msg%{public}.0s\":\"#geometry,BadCoordinateType\"}";
    goto LABEL_20;
  }
LABEL_47:

}

void sub_10008C0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, uint64_t a18, id *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

SAGeometry *SAGeometry::getPolygonFromCoordinates(SAGeometry *this, objc_object *a2)
{
  SAGeometry *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  int v11;
  NSObject *v12;
  SAGeometry *v13;
  NSObject *v14;
  char *v16;
  _UNKNOWN **v17;
  __int128 v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  _UNKNOWN **v26;
  uint64_t v27;
  char v28;
  double v29;
  CLLocationDegrees v30;
  CLLocationDegrees v31;
  CLLocationCoordinate2D v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  __int128 v38;
  id v39;
  char *v40;
  SAGeometry *v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  SAGeometry *v47;

  v2 = this;
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,getPolygonFromCoordinates\"}", buf, 0x12u);
  }
  v4 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {
    v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    goto LABEL_18;
  }
  if (!-[SAGeometry count](v2, "count")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAGeometry objectAtIndex:](v2, "objectAtIndex:", 0)),
        v6 = objc_opt_class(NSArray),
        isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        (isKindOfClass & 1) == 0))
  {
    v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      *(_DWORD *)buf = 68289026;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,BadLinearRing\"}", buf, 0x12u);
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v8 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v46 = 2113;
    v47 = v2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,linearRingsObject\", \"object\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v41 = (SAGeometry *)objc_claimAutoreleasedReturnValue(-[SAGeometry objectAtIndex:](v2, "objectAtIndex:", 0));
  v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v43 = 0;
    v44 = 2082;
    v45 = "";
    v46 = 2113;
    v47 = v41;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,points\", \"points\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v10 = (char *)-[SAGeometry count](v41, "count");
  v11 = (int)v10;
  if ((unint64_t)(v10 - 101) > 0xFFFFFFFFFFFFFF9ELL)
  {
    v40 = v10;
    v39 = objc_alloc_init((Class)NSMutableArray);
    v16 = 0;
    v17 = &APSEnvironmentDevelopment_ptr;
    *(_QWORD *)&v18 = 68289026;
    v38 = v18;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAGeometry objectAtIndex:](v41, "objectAtIndex:", v16, v38));
      v20 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0 || objc_msgSend(v19, "count") != (id)2)
      {
        v37 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v38;
          v43 = 0;
          v44 = 2082;
          v45 = "";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,InvalidCoordinate\"}", buf, 0x12u);
        }

LABEL_36:
        v13 = 0;
        goto LABEL_37;
      }
      v21 = v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", 0));
      v24 = objc_opt_class(v17[83]);
      v25 = objc_opt_isKindOfClass(v22, v24);
      v26 = v17;
      v27 = objc_opt_class(v17[83]);
      v28 = v25 & objc_opt_isKindOfClass(v23, v27);
      if ((v28 & 1) != 0)
      {
        objc_msgSend(v22, "doubleValue");
        v30 = v29;
        objc_msgSend(v23, "doubleValue");
        v32 = CLLocationCoordinate2DMake(v30, v31);
        v33 = objc_msgSend(objc_alloc((Class)_CLVertex), "initWithCoordinate:", v32.latitude, v32.longitude);
        objc_msgSend(v39, "addObject:", v33);

      }
      else
      {
        v34 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v38;
          v43 = 0;
          v44 = 2082;
          v45 = "";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,CoordinateIsNaN\"}", buf, 0x12u);
        }
      }

      if ((v28 & 1) == 0)
        goto LABEL_36;
      ++v16;
      v17 = v26;
    }
    while (v40 != v16);
    v35 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      v46 = 2113;
      v47 = (SAGeometry *)v39;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#geometry,vertices\", \"vertices\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    v13 = (SAGeometry *)objc_msgSend(objc_alloc((Class)_CLPolygonalRegion), "initWithVertices:identifier:", v39, CFSTR("polygon"));
    v36 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      v46 = 2113;
      v47 = v13;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#geometry,region\", \"region\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
LABEL_37:

  }
  else
  {
    v12 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      v46 = 1026;
      LODWORD(v47) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,InvalidNumberOfPoints\", \"pointsLen\":%{public}d}", buf, 0x18u);
    }
    v13 = 0;
  }

LABEL_19:
  return v13;
}

void sub_10008C9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t SAGeometry::isLocationInCircle(SAGeometry *this, double a2, double a3, double a4, NSArray *a5)
{
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v37;
  SAGeometry *obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t buf;
  __int16 v45;
  const char *v46;

  v8 = this;
  v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v45 = 2082;
    v46 = "";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isLocationInCircle\"}", (uint8_t *)&buf, 0x12u);
  }
  v37 = (void *)v8;
  if (v8)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (SAGeometry *)(id)v8;
    v10 = -[SAGeometry countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v14 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0 && objc_msgSend(v13, "count") == (id)3)
          {
            v15 = 0;
            while (1)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v15));
              v17 = objc_opt_class(NSNumber);
              isKindOfClass = objc_opt_isKindOfClass(v16, v17);

              if ((isKindOfClass & 1) == 0)
                break;
              if (++v15 == 3)
                goto LABEL_19;
            }
            v20 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              buf = 68289026;
              v45 = 2082;
              v46 = "";
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isLocationInCircle,skipping invalid circle\"}", (uint8_t *)&buf, 0x12u);
            }
LABEL_19:
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
            objc_msgSend(v21, "doubleValue");
            v23 = v22;

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 1));
            objc_msgSend(v24, "doubleValue");
            v26 = v25;

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 2));
            objc_msgSend(v27, "doubleValue");
            v29 = v28;

            if (GEOCalculateDistance(v26, v23, a2, a3) + a4 <= v29)
            {
              v35 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
              {
                buf = 68289026;
                v45 = 2082;
                v46 = "";
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#geometry,isLocationInCircle,true\"}", (uint8_t *)&buf, 0x12u);
              }

              v8 = 1;
              goto LABEL_31;
            }
          }
          else
          {
            v19 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              buf = 68289026;
              v45 = 2082;
              v46 = "";
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isLocationInCircle,skipping invalid circle\"}", (uint8_t *)&buf, 0x12u);
            }
          }
        }
        v10 = -[SAGeometry countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v10)
          continue;
        break;
      }
    }

    v30 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
      goto LABEL_27;
    buf = 68289026;
    v45 = 2082;
    v46 = "";
    v31 = "{\"msg%{public}.0s\":\"#geometry,isLocationInCircle,false\"}";
    v32 = v30;
    v33 = OS_LOG_TYPE_DEBUG;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v32, v33, v31, (uint8_t *)&buf, 0x12u);
LABEL_27:
    v8 = 0;
    goto LABEL_31;
  }
  v34 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v45 = 2082;
    v46 = "";
    v31 = "{\"msg%{public}.0s\":\"#geometry,isLocationInCircle,empty circles\"}";
    v32 = v34;
    v33 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_26;
  }
LABEL_31:

  return v8;
}

void sub_10008CECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

uint64_t SAGeometry::isCircleInGeometryHelper(SAGeometry *this, CLLocationDegrees a2, CLLocationDegrees a3, double a4, double *a5, NSArray *a6)
{
  double *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  __int128 v14;
  char *v15;
  void *v16;
  CLLocationCoordinate2D v17;
  unsigned int v18;
  NSObject *v19;
  double v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v32;
  double v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  CLLocationDegrees latitude;
  __int16 v40;
  CLLocationDegrees longitude;
  __int16 v42;
  _QWORD v43[3];

  v10 = a5;
  v11 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    v38 = 2049;
    latitude = a2;
    v40 = 2049;
    longitude = a3;
    v42 = 2049;
    *(double *)v43 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isCircleInGeometry\", \"lat\":\"%{private}0.6f\", \"lon\":\"%{private}0.6f\", \"radiusMeters\":\"%{private}0.6f\"}", buf, 0x30u);
  }
  if (!v10)
  {
    v27 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v28 = "{\"msg%{public}.0s\":\"#geometry,isCircleInGeometry,fPolygons is nil\"}";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x12u);
    }
LABEL_27:
    v29 = 0;
    *(_QWORD *)this = 0xBFF0000000000000;
    goto LABEL_35;
  }
  v12 = (char *)objc_msgSend(v10, "count");
  if (!v12)
  {
    v27 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v28 = "{\"msg%{public}.0s\":\"#geometry,isCircleInGeometry,fPolygons is empty\"}";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  *(_QWORD *)this = 0xBFF0000000000000;
  v13 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    v38 = 2049;
    latitude = a2;
    v40 = 2049;
    longitude = a3;
    v42 = 2049;
    *(double *)v43 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isCircleInGeometry\", \"lat\":\"%{private}0.6f\", \"lon\":\"%{private}0.6f\", \"radiusMeters\":\"%{private}0.6f\"}", buf, 0x30u);
  }
  v15 = 0;
  *(_QWORD *)&v14 = 68289539;
  v32 = v14;
  do
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v15, v32));
    v33 = -1.0;
    v17 = CLLocationCoordinate2DMake(a2, a3);
    v18 = objc_msgSend(v16, "containsCoordinate:withDistanceToBorder:", &v33);
    v19 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290051;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2049;
      latitude = v17.latitude;
      v40 = 2049;
      longitude = v17.longitude;
      v42 = 1025;
      LODWORD(v43[0]) = v18;
      WORD2(v43[0]) = 2049;
      *(double *)((char *)v43 + 6) = v33;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isCircleInPolygonResult\", \"lat\":\"%{private}0.6f\", \"lat\":\"%{private}0.6f\", \"inside\":%{private}hhd, \"distance\":\"%{private}0.6f\"}", buf, 0x36u);
    }
    if (v18)
    {
      v30 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isCircleInGeometry,YES\"}", buf, 0x12u);
      }

      goto LABEL_31;
    }
    v20 = *(double *)this;
    v21 = v33;
    if (*(double *)this == -1.0)
    {
      *(double *)this = v33;
      v22 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2049;
        latitude = v21;
        v40 = 2049;
        longitude = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,initClosestDistance\", \"distance\":\"%{private}0.2f\", \"closestDistance\":\"%{private}0.2f\"}", buf, 0x26u);
      }
    }
    else if (v20 > v33)
    {
      v23 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v32;
        v35 = 0;
        v36 = 2082;
        v37 = "";
        v38 = 2049;
        latitude = v21;
        v40 = 2049;
        longitude = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,adjustClosestDistance\", \"distance\":\"%{private}0.2f\", \"closestDistance\":\"%{private}0.2f\"}", buf, 0x26u);
        v21 = v33;
      }
      *(double *)this = v21;
    }

    ++v15;
  }
  while (v12 != v15);
  v24 = *(double *)this;
  v25 = SALogObjectGeneral;
  v26 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v24 < a4)
  {
    if (v26)
    {
      *(_DWORD *)buf = v32;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2049;
      latitude = a4;
      v40 = 2049;
      longitude = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isCircleInGeometry,closeEnough\", \"radiusMeters\":\"%{private}0.2f\", \"distance\":\"%{private}0.2f\"}", buf, 0x26u);
    }
LABEL_31:
    v29 = 1;
    goto LABEL_35;
  }
  if (v26)
  {
    *(_DWORD *)buf = 68289026;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,isCircleInGeometry,NO\"}", buf, 0x12u);
  }
  v29 = 0;
LABEL_35:

  return v29;
}

void sub_10008D4CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SAGeometry::isCircleInGeometry(SAGeometry *this, CLLocationDegrees a2, CLLocationDegrees a3, double a4, SAGeometry *a5, NSArray *a6)
{
  if (*((_DWORD *)this + 10))
    return SAGeometry::isCircleInGeometryHelper(a5, a2, a3, a4, *(double **)this, a6);
  else
    return SAGeometry::doCirclesOverlap((double *)a5, *((double *)this + 2), *((double *)this + 3), *((double *)this + 4), a2, a3, a4);
}

uint64_t SAGeometry::doCirclesOverlap(double *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v14;
  uint64_t result;
  NSObject *v16;
  _BOOL4 v17;
  double v18[3];
  double v19[3];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;

  v19[0] = a2;
  v19[1] = a3;
  v19[2] = a4;
  v18[0] = a5;
  v18[1] = a6;
  v18[2] = a7;
  *a1 = 0.0;
  if (sub_10008DB60(v19) && (sub_10008DB60(v18) & 1) != 0)
  {
    v14 = CLClientGetDistanceCoordinates(a2, a3, a5, a6) - (a4 + a7);
    if (v14 >= 0.0)
    {
      result = 0;
      *a1 = a7 + v14;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v16 = SALogObjectGeneral;
    v17 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v17)
    {
      *(_DWORD *)buf = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,doCirclesOverlap,invalidCircles\"}", buf, 0x12u);
      return 0;
    }
  }
  return result;
}

void SAGeometry::area(SAGeometry *this)
{
  void *v2;
  id v3;
  __int128 v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  double v13;
  void *v14;
  char *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  __int128 v35;
  id v36;
  double v37;
  void *v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  double v44;

  v2 = *(void **)this;
  if (!*(_QWORD *)this && (sub_10008DB60((double *)this + 2) & 1) == 0)
  {
    v31 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 68289026;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v32 = "{\"msg%{public}.0s\":\"#geometry,area,#warning,fPolygons and fCircle is nil\"}";
    goto LABEL_23;
  }
  if (sub_10008DB60((double *)this + 2))
    return;
  v3 = objc_msgSend(v2, "count");
  if (!v3)
  {
    v31 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 68289026;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v32 = "{\"msg%{public}.0s\":\"#geometry,area,#warning,fPolygons is empty\"}";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x12u);
    return;
  }
  v5 = 0;
  v6 = 0.0;
  *(_QWORD *)&v4 = 68289283;
  v35 = v4;
  v36 = v3;
LABEL_6:
  v37 = v6;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)this, "objectAtIndex:", v5, v35));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "vertices"));
  v8 = v7;
  if (v7)
  {
    v9 = (char *)objc_msgSend(v7, "count");
    v10 = v9;
    if ((unint64_t)(v9 - 3) <= 0x61)
    {
      v11 = 0;
      v12 = v9 - 1;
      v13 = 0.0;
      while (1)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
        if (!v14)
          goto LABEL_25;
        if (v12 == v11)
          v15 = 0;
        else
          v15 = v11 + 1;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v15));
        if (!v16)
        {

          goto LABEL_25;
        }
        v17 = v14;
        objc_msgSend(v17, "coordinate");
        v19 = v18;
        objc_msgSend(v17, "coordinate");
        v21 = v20;
        v22 = cos(v19 * 3.14159265 / 180.0);

        v23 = v16;
        objc_msgSend(v23, "coordinate");
        v25 = v24;
        objc_msgSend(v23, "coordinate");
        v27 = v26;
        v28 = cos(v25 * 3.14159265 / 180.0);

        ++v11;
        v13 = v13 + v22 * (v21 * 111320.119) * (v25 * -111320.119) + v28 * (v27 * 111320.119) * (v19 * 111320.119);
        if (v10 == v11)
        {

          v29 = fabs(v13 * 0.5);
          v30 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v35;
            v40 = 0;
            v41 = 2082;
            v42 = "";
            v43 = 2049;
            v44 = v29;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#geometry,area,subArea\", \"subArea\":\"%{private}0.1f\"}", buf, 0x1Cu);
          }
          v6 = v37 + v29;
          if ((id)++v5 != v36)
            goto LABEL_6;
          return;
        }
      }
    }
    v33 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v34 = "{\"msg%{public}.0s\":\"#geometry,area,#warning,invalidCount\"}";
      goto LABEL_31;
    }
  }
  else
  {
    v33 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v40 = 0;
      v41 = 2082;
      v42 = "";
      v34 = "{\"msg%{public}.0s\":\"#geometry,area,#warning,noVertices\"}";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0x12u);
    }
  }
LABEL_25:

}

void sub_10008DB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t sub_10008DB60(double *a1)
{
  uint64_t result;
  double v3;
  double v4;
  _BOOL4 v5;

  if (a1[2] <= 0.0)
    return 0;
  result = 0;
  v3 = *a1;
  if (*a1 >= -90.0 && v3 <= 90.0)
  {
    result = 0;
    v4 = a1[1];
    if (v4 >= -180.0 && v4 <= 180.0)
    {
      v5 = fabs(fabs(v3) + -0.0000001) > 0.0000001;
      return fabs(fabs(v4) + -0.0000001) > 0.0000001 || v5;
    }
  }
  return result;
}

void SALockMonitor::create(void *a1)
{
  a1;
  if (*((_BYTE *)sub_10003D044() + 232))
    sub_10008DCA4();
  sub_10008DE50();
}

void sub_10008DC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_10008DCA4()
{
  operator new();
}

void sub_10008DDC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a13;
  if (a13 == v17)
  {
    v19 = 4;
    v18 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  v20 = a17;
  if (a17 == &a14)
  {
    v21 = 4;
    v20 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  operator delete();
}

void sub_10008DE50()
{
  operator new();
}

void sub_10008DF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a13;
  if (a13 == v17)
  {
    v19 = 4;
    v18 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  v20 = a17;
  if (a17 == &a14)
  {
    v21 = 4;
    v20 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  operator delete();
}

void SACoreTelephony::create(void *a1)
{
  a1;
  if (*((_BYTE *)sub_10003D044() + 24))
    sub_10008E118();
  sub_10008E2EC();
}

void sub_10008E0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a9)
    (*(void (**)(uint64_t))(*(_QWORD *)a9 + 8))(a9);

  _Unwind_Resume(a1);
}

void sub_10008E118()
{
  operator new();
}

void sub_10008E2B8(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  sub_100074840((uint64_t *)va);
  operator delete();
}

void sub_10008E2EC()
{
  operator new();
}

void sub_10008E48C(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  sub_100074840((uint64_t *)va);
  operator delete();
}

uint64_t SACoreTelephony::onWeaDisplayedNotification(SACoreTelephony *this, const char *a2)
{
  NSObject *v4;
  uint64_t result;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;

  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 68289283;
    v7 = 2082;
    v8 = "";
    v9 = 2081;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saCoreTelephony,onWeaDisplayedNotification\", \"message\":%{private, location:escape_only}s}", (uint8_t *)&v6, 0x1Cu);
  }
  result = *((_QWORD *)this + 5);
  if (result)
  {
    v6 = (uint64_t)a2;
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)result + 48))(result, &v6);
  }
  return result;
}

void SACoreTelephony::onWeaReceivedNotification(SACoreTelephony *this, NSDictionary *a2)
{
  NSDictionary *v3;
  NSDictionary *v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", &stru_1000F6780);
    if (*((_QWORD *)this + 9))
      sub_10008E794((uint64_t)this + 48, v4);
  }
  else
  {
    v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saCoreTelephony,onWeaReceivedNotification,alert does not have any info,ignoring.\"}", (uint8_t *)v6, 0x12u);
    }
  }

}

void sub_10008E694(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_10008E6AC(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v5;
    v13 = 2113;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saCoreTelephony,onWeaReceivedNotification\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }

}

void sub_10008E794(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    sub_100004FB0();
  (*(void (**)(uint64_t, id *))(*(_QWORD *)v3 + 48))(v3, &v4);

}

void sub_10008E7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t SACoreTelephony::onEnhanceDeliveryStateChange(SACoreTelephony *this, int a2)
{
  NSObject *v4;
  uint64_t result;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;

  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onEnhanceDeliveryStateChange,\", \"enhancedDeliveryState,\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  result = *((_QWORD *)this + 17);
  if (result)
  {
    LOBYTE(v6[0]) = a2;
    return (*(uint64_t (**)(uint64_t, _DWORD *))(*(_QWORD *)result + 48))(result, v6);
  }
  return result;
}

void SACoreTelephony::onMotionHarvestWeaTrigger(SACoreTelephony *this, NSDictionary *a2)
{
  NSDictionary *v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  v3 = a2;
  if ((objc_msgSend(*(id *)SAPlatformInfo::instance((SAPlatformInfo *)v3), "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    if (v3)
    {
      if (*((_QWORD *)this + 21))
        sub_10008E794((uint64_t)this + 144, v3);
    }
    else
    {
      v4 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 68289026;
        v5[1] = 0;
        v6 = 2082;
        v7 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saCoreTelephony,onMotionHarvestWeaTrigger,alert does not have any info,ignoring.\"}", (uint8_t *)v5, 0x12u);
      }
    }
  }

}

void sub_10008E9D8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t SACoreTelephony::getEnhancedDeliveryState(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  NSObject *v6;
  uint64_t v7;
  const __CFBoolean *Value;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  const __CFBoolean *v12;
  int v13;
  int v14;
  int v15;
  SAPlatformInfo *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  int v34;
  char v35;
  CFDictionaryRef theDict;
  __int16 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  int v61;

  theDict = 0;
  v35 = 0;
  if ((unint64_t)_CTServerConnectionGetCellBroadcastConfig(a2, &theDict, &v35) >> 32)
    v4 = 1;
  else
    v4 = v35 == 0;
  if (v4 || theDict == 0)
  {
    v6 = SALogObjectGeneral;
    v7 = 0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      return v7;
    *(_DWORD *)buf = 68289026;
    v49 = 0;
    v50 = 2082;
    v51 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,GetCellBroadcastConfig error\"}", buf, 0x12u);
    return 0;
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("EnhancedDeliveryPref"));
  v9 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("AppleSafetyAlertsAvailability"));
  v10 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("EnhancedDeliveryAvailability"));
  v11 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("EmergencyAlertsPref"));
  if (!Value || !v9 || !v10)
  {
    v25 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v49 = 0;
      v50 = 2082;
      v51 = "";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,GetCellBroadcastConfig error\"}", buf, 0x12u);
    }
    CFRelease(theDict);
    return 0;
  }
  v12 = v11;
  v13 = CFBooleanGetValue(Value);
  v14 = CFBooleanGetValue(v10);
  v15 = CFBooleanGetValue(v9);
  v16 = (SAPlatformInfo *)CFBooleanGetValue(v12);
  v17 = (int)v16;
  if ((objc_msgSend(*(id *)SAPlatformInfo::instance(v16), "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Quake"), 0));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, buf, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v39;
      v34 = v15;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          v37 = 0;
          if ((unint64_t)_CTServerConnectionGetCellBroadcastSettingForAlertType(a2, v23, (char *)&v37 + 1, &v37) >> 32)
          {
            v27 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v42 = 68289026;
              v43 = 0;
              v44 = 2082;
              v45 = "";
              v28 = "{\"msg%{public}.0s\":\"#ctsa,onMotionHarvestPref error\"}";
              v29 = v27;
              v30 = 18;
              goto LABEL_37;
            }
LABEL_38:
            v24 = 0;
            v15 = v34;
            goto LABEL_39;
          }
          if ((_BYTE)v37 && !HIBYTE(v37))
          {
            v31 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v42 = 68289282;
              v43 = 0;
              v44 = 2082;
              v45 = "";
              v46 = 2114;
              v47 = v23;
              v28 = "{\"msg%{public}.0s\":\"#ctsa,onMotionHarvestPref\", \"opt out\":%{public, location:escape_only}@}";
              v29 = v31;
              v30 = 28;
LABEL_37:
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, v42, v30);
            }
            goto LABEL_38;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, buf, 16);
        v24 = 1;
        v15 = v34;
        if (v20)
          continue;
        break;
      }
    }
    else
    {
      v24 = 1;
    }
LABEL_39:

  }
  else
  {
    v26 = SALogObjectGeneral;
    v24 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v49 = 0;
      v50 = 2082;
      v51 = "";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onMotionHarvestPref,not phone\"}", buf, 0x12u);
      v24 = 0;
    }
  }
  v32 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    v49 = 0;
    v50 = 2082;
    v51 = "";
    v52 = 1026;
    v53 = v13 != 0;
    v54 = 1026;
    v55 = v14 != 0;
    v56 = 1026;
    v57 = v15 != 0;
    v58 = 1026;
    v59 = v17 != 0;
    v60 = 1026;
    v61 = v24;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,com.apple.CTTelephonyCenter\", \"eDel\":%{public}d, \"eDelAvl\":%{public}d, \"saAvl\":%{public}d, \"saEmergencyAvl\":%{public}d, \"saMotionHarvestPref\":%{public}d}", buf, 0x30u);
  }
  CFRelease(theDict);
  *(CFAbsoluteTime *)(a1 + 8) = CFAbsoluteTimeGetCurrent();
  *((_WORD *)sub_100003038() + 56) = (v17 != 0) | 0x100;
  v7 = (v13 != 0) & (v14 != 0);
  *((_WORD *)sub_100003038() + 57) = v7 | 0x100;
  *((_WORD *)sub_100003038() + 58) = v24 | 0x100;
  return v7;
}

void sub_10008EF5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10008EF88(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_10008EFAC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_10008EFC4(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

void sub_10008F008(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_10008F02C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_10008F044(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

double SACommonUtils::extractCFAbsoluteTimeFromTimeString(unsigned __int8 *a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  double v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  int v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  unsigned __int8 *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  __int16 v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  _BYTE v42[10];
  int v43;
  __int16 v44;
  int v45;

  v1 = a1;
  v2 = a1[23];
  if ((char)a1[23] < 0)
  {
    v4 = *((_QWORD *)a1 + 1);
    if (v4)
    {
      v3 = *(unsigned __int8 **)a1;
      goto LABEL_6;
    }
LABEL_21:
    v10 = SALogObjectGeneral;
    v11 = -1.0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return v11;
    *(_DWORD *)buf = 68289026;
    v38 = 0;
    v39 = 2082;
    v40 = "";
    v12 = "{\"msg%{public}.0s\":\"#sa_util,#warning,failed to compute cfabsolutetime from timestring length is 0\"}";
    v13 = v10;
    v14 = 18;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    return v11;
  }
  if (!a1[23])
    goto LABEL_21;
  v3 = a1;
  v4 = a1[23];
LABEL_6:
  v5 = 0;
  do
  {
    v6 = *v3++;
    if (v6 == 58)
      ++v5;
    --v4;
  }
  while (v4);
  if ((v2 & 0x80u) != 0)
  {
    a1 = *(unsigned __int8 **)a1;
    v2 = *((_QWORD *)v1 + 1);
  }
  if (!v2)
  {
    LODWORD(v8) = 0;
LABEL_24:
    v15 = SALogObjectGeneral;
    v11 = -1.0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return v11;
    *(_DWORD *)buf = 68289538;
    v38 = 0;
    v39 = 2082;
    v40 = "";
    v41 = 1026;
    *(_DWORD *)v42 = v5;
    *(_WORD *)&v42[4] = 1026;
    *(_DWORD *)&v42[6] = v8;
    v12 = "{\"msg%{public}.0s\":\"#sa_util,#warning,timestring format not supported\", \"colonCount\":%{public}d, \"dashC"
          "ount\":%{public}d}";
    v13 = v15;
    v14 = 30;
    goto LABEL_26;
  }
  v7 = 0;
  v8 = 0;
  do
  {
    if (a1[v7] == 45)
      ++v8;
    ++v7;
  }
  while (v2 != v7);
  if ((unint64_t)(v5 - 3) < 0xFFFFFFFFFFFFFFFELL || v8 != 2)
    goto LABEL_24;
  v36 = 0;
  v35 = 0;
  v33 = 0;
  v34 = 0;
  v32 = 0;
  if (v5 == 2)
  {
    sscanf((const char *)a1, "%d-%d-%d%c%d:%d:%d%c", &v35, (char *)&v34 + 4, &v34, (char *)&v36 + 1, (char *)&v33 + 4, &v33, &v32, &v36);
    v9 = v32;
  }
  else
  {
    sscanf((const char *)a1, "%d-%d-%d%c%d:%d%c", &v35, (char *)&v34 + 4, &v34, (char *)&v36 + 1, (char *)&v33 + 4, &v33, &v36);
    v9 = 0;
  }
  v17 = v35;
  v18 = SALogObjectGeneral;
  if ((v35 - 2022) > 0x1B
    || (v19 = HIDWORD(v34), SHIDWORD(v34) < 1)
    || SHIDWORD(v34) > 12
    || (v20 = v34, (int)v34 < 1)
    || (int)v34 > 31
    || (v21 = HIDWORD(v33), v33 < 0)
    || SHIDWORD(v33) > 23
    || (v22 = v33, (v33 & 0x80000000) != 0)
    || (int)v33 > 59
    || v9 < 0
    || v9 > 59)
  {
    v11 = -1.0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      return v11;
    if ((v1[23] & 0x80u) == 0)
      v31 = v1;
    else
      v31 = *(unsigned __int8 **)v1;
    *(_DWORD *)buf = 68289795;
    v38 = 0;
    v39 = 2082;
    v40 = "";
    v41 = 2081;
    *(_QWORD *)v42 = v31;
    *(_WORD *)&v42[8] = 1026;
    v43 = v5;
    v44 = 1026;
    v45 = 2;
    v12 = "{\"msg%{public}.0s\":\"#sa_util,#warning,failed to compute cfabsolutetime from timestring\", \"timeString\":%{"
          "private, location:escape_only}s, \"colonCount\":%{public}d, \"dashCount\":%{public}d}";
    v13 = v18;
    v14 = 40;
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v38 = 0;
    v39 = 2082;
    v40 = "";
    v41 = 1026;
    *(_DWORD *)v42 = v5;
    *(_WORD *)&v42[4] = 1026;
    *(_DWORD *)&v42[6] = 2;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,time extracted from timestring\", \"colonCount\":%{public}d, \"dashCount\":%{public}d}", buf, 0x1Eu);
    v22 = v33;
    v21 = HIDWORD(v33);
    v20 = v34;
    v19 = HIDWORD(v34);
    v17 = v35;
  }
  v23 = v32;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "components:fromDate:", 28, v25));

  if (v20 >= 1 && v19 >= 1 && v17 >= 1)
  {
    objc_msgSend(v26, "setYear:", v17);
    objc_msgSend(v26, "setMonth:", v19);
    objc_msgSend(v26, "setDay:", v20);
  }
  objc_msgSend(v26, "setHour:", v21);
  objc_msgSend(v26, "setMinute:", v22);
  objc_msgSend(v26, "setSecond:", (uint64_t)(float)v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v26, "setTimeZone:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateFromComponents:", v26));
  objc_msgSend(v29, "timeIntervalSinceReferenceDate");
  v11 = v30;

  return v11;
}

void sub_10008F584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void SACommonUtils::getHashForString(char *__s@<X0>, uint64_t *a2@<X8>)
{
  const char *v4;
  CC_LONG v5;
  void *v6;
  uint64_t i;
  id v8;
  NSObject *v9;
  char *v10;
  uint64_t *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  uint64_t *v19;
  unsigned __int8 md[32];

  if (__s[23] < 0)
  {
    if (!*((_QWORD *)__s + 1))
    {
LABEL_17:
      sub_10000E8A0(a2, "");
      return;
    }
    v4 = *(const char **)__s;
  }
  else
  {
    v4 = __s;
    if (!__s[23])
      goto LABEL_17;
  }
  v5 = strlen(v4);
  CC_SHA256(v4, v5, md);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 32));
  for (i = 0; i != 16; ++i)
    objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), md[i]);
  v8 = objc_retainAutorelease(v6);
  sub_10000E8A0(a2, (char *)objc_msgSend(v8, "UTF8String"));
  v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (__s[23] >= 0)
      v10 = __s;
    else
      v10 = *(char **)__s;
    if (*((char *)a2 + 23) >= 0)
      v11 = a2;
    else
      v11 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2081;
    v17 = v10;
    v18 = 2081;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,getHashForString\", \"body\":%{private, location:escape_only}s, \"hash\":%{private, location:escape_only}s}", buf, 0x26u);
  }

}

void sub_10008F7BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::isHashMatch(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  char *v12;
  __int128 v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void **v20;
  int v21;
  size_t v22;
  const void *v23;
  void *v24;
  void **v25;
  size_t v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  void **v35;
  int v36;
  size_t v37;
  const void *v38;
  void *v39;
  void **v40;
  size_t v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  const char *v45;
  NSObject *v46;
  NSObject *v47;
  _BOOL4 v48;
  const char *v49;
  __int128 v51;
  void *v52;
  id v53;
  void *v54[2];
  char v55;
  void *__p[2];
  uint64_t v57;
  _BYTE buf[28];
  __int16 v59;
  void **v60;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 23);
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
  {
    v6 = SALogObjectGeneral;
    v44 = 0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_99;
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    v45 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatchFailed,hashIsEmpty\"}";
    goto LABEL_90;
  }
  v6 = SALogObjectGeneral;
  v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v7)
    {
LABEL_91:
      v44 = 0;
      goto LABEL_99;
    }
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    v45 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatchFailed,dictionaryIsEmpty\"}";
LABEL_90:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v45, buf, 0x12u);
    goto LABEL_91;
  }
  if (v7)
  {
    v8 = *(const void **)a1;
    if (v5 >= 0)
      v8 = (const void *)a1;
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2081;
    *(_QWORD *)&buf[20] = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch\", \"hash\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  v53 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("info")));
  if (v9 && (v52 = v9, v10 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    v11 = v9;
    v12 = (char *)objc_msgSend(v11, "count");
    if (v12)
    {
      v14 = 0;
      *(_QWORD *)&v13 = 68289539;
      v51 = v13;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v14, v51));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("CMAMtext")));

        if (v16 && (v17 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v16, v17) & 1) != 0))
        {
          v18 = objc_retainAutorelease(v16);
          sub_10000E8A0(buf, (char *)objc_msgSend(v18, "UTF8String"));
          SACommonUtils::getHashForString(buf, (uint64_t *)__p);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
          v19 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            v20 = __p;
            if (v57 < 0)
              v20 = (void **)__p[0];
            *(_DWORD *)buf = v51;
            *(_DWORD *)&buf[4] = 0;
            *(_WORD *)&buf[8] = 2082;
            *(_QWORD *)&buf[10] = "";
            *(_WORD *)&buf[18] = 2113;
            *(_QWORD *)&buf[20] = v18;
            v59 = 2081;
            v60 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,element\", \"cmam\":%{private, location:escape_only}@, \"hash\":%{private, location:escape_only}s}", buf, 0x26u);
          }
          v21 = *(char *)(a1 + 23);
          if (v21 >= 0)
            v22 = *(unsigned __int8 *)(a1 + 23);
          else
            v22 = *(_QWORD *)(a1 + 8);
          if (v21 >= 0)
            v23 = (const void *)a1;
          else
            v23 = *(const void **)a1;
          if (v57 >= 0)
            v24 = (void *)HIBYTE(v57);
          else
            v24 = __p[1];
          if (v57 >= 0)
            v25 = __p;
          else
            v25 = (void **)__p[0];
          if ((unint64_t)v24 >= v22)
            v26 = v22;
          else
            v26 = (size_t)v24;
          if (!memcmp(v23, v25, v26) && v24 == (void *)v22)
          {
            v27 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289026;
              *(_DWORD *)&buf[4] = 0;
              *(_WORD *)&buf[8] = 2082;
              *(_QWORD *)&buf[10] = "";
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,cmam,matched\"}", buf, 0x12u);
            }
            v28 = 1;
            v3 = v53;
            v9 = v52;
          }
          else
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v14));
            v3 = v53;
            v9 = v52;
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("CMAMlongtext")));

            if (v31 && (v32 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v31, v32) & 1) != 0))
            {
              v33 = objc_retainAutorelease(v31);
              sub_10000E8A0(v54, (char *)objc_msgSend(v33, "UTF8String"));
              SACommonUtils::getHashForString((char *)v54, (uint64_t *)buf);
              if (SHIBYTE(v57) < 0)
                operator delete(__p[0]);
              *(_OWORD *)__p = *(_OWORD *)buf;
              v57 = *(_QWORD *)&buf[16];
              buf[23] = 0;
              buf[0] = 0;
              if (v55 < 0)
                operator delete(v54[0]);
              v34 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                v35 = __p;
                if (v57 < 0)
                  v35 = (void **)__p[0];
                *(_DWORD *)buf = v51;
                *(_DWORD *)&buf[4] = 0;
                *(_WORD *)&buf[8] = 2082;
                *(_QWORD *)&buf[10] = "";
                *(_WORD *)&buf[18] = 2113;
                *(_QWORD *)&buf[20] = v33;
                v59 = 2081;
                v60 = v35;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,element\", \"cmam_long_text\":%{private, location:escape_only}@, \"hash\":%{private, location:escape_only}s}", buf, 0x26u);
              }
              v36 = *(char *)(a1 + 23);
              if (v36 >= 0)
                v37 = *(unsigned __int8 *)(a1 + 23);
              else
                v37 = *(_QWORD *)(a1 + 8);
              if (v36 >= 0)
                v38 = (const void *)a1;
              else
                v38 = *(const void **)a1;
              if (v57 >= 0)
                v39 = (void *)HIBYTE(v57);
              else
                v39 = __p[1];
              if (v57 >= 0)
                v40 = __p;
              else
                v40 = (void **)__p[0];
              if ((unint64_t)v39 >= v37)
                v41 = v37;
              else
                v41 = (size_t)v39;
              v28 = 0;
              if (!memcmp(v38, v40, v41) && v39 == (void *)v37)
              {
                v42 = SALogObjectGeneral;
                v3 = v53;
                v9 = v52;
                if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 68289026;
                  *(_DWORD *)&buf[4] = 0;
                  *(_WORD *)&buf[8] = 2082;
                  *(_QWORD *)&buf[10] = "";
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,cmam_long,matched\"}", buf, 0x12u);
                }
                v28 = 1;
              }
              else
              {
                v3 = v53;
                v9 = v52;
              }
            }
            else
            {

              v43 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68289026;
                *(_DWORD *)&buf[4] = 0;
                *(_WORD *)&buf[8] = 2082;
                *(_QWORD *)&buf[10] = "";
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,cmam_long_text nil\"}", buf, 0x12u);
              }
              v33 = 0;
              v28 = 14;
            }

          }
          if (SHIBYTE(v57) < 0)
            operator delete(__p[0]);

          if (v28 != 14 && v28)
          {
            v44 = 1;
            goto LABEL_97;
          }
        }
        else
        {

          v29 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289026;
            *(_DWORD *)&buf[4] = 0;
            *(_WORD *)&buf[8] = 2082;
            *(_QWORD *)&buf[10] = "";
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dbg,#sa_util,isHashMatch,cmam_text nil\"}", buf, 0x12u);
          }
        }
        ++v14;
      }
      while (v12 != v14);
      v47 = SALogObjectGeneral;
      v48 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      v44 = 0;
      if (v48)
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        v49 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,noMatch\"}";
        goto LABEL_96;
      }
    }
    else
    {
      v47 = SALogObjectGeneral;
      v44 = 0;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        v49 = "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,invalidInfoCount,noMatch\"}";
LABEL_96:
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v49, buf, 0x12u);
        v44 = 0;
      }
    }
LABEL_97:

  }
  else
  {
    v46 = SALogObjectGeneral;
    v44 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,isHashMatch,noInfoFound,noMatch\"}", buf, 0x12u);
      v44 = 0;
    }
  }

LABEL_99:
  return v44;
}

void sub_10008FFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  void *v34;
  void *v35;
  void *v36;

  if (a21 < 0)
    operator delete(__p);

  if (a27 < 0)
    operator delete(a22);

  _Unwind_Resume(a1);
}

void SACommonUtils::getAnyCmam(SACommonUtils *this@<X0>, _QWORD *a2@<X8>)
{
  SACommonUtils *v4;
  SACommonUtils *v5;
  void *v6;
  uint64_t v7;
  id v8;
  char *v9;
  char *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;

  v4 = this;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SACommonUtils objectForKey:](v4, "objectForKey:", CFSTR("info")));
    if (!v6 || (v7 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
    {
      v18 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,invalidInfo\"}", buf, 0x12u);
      }
      sub_10000E8A0(a2, "");
LABEL_25:

      goto LABEL_26;
    }
    v8 = v6;
    v9 = (char *)objc_msgSend(v8, "count");
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("CMAMtext")));

        if (v12 && (v13 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          || (v12,
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", i)),
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("CMAMlongtext"))),
              v14,
              v12)
          && (v15 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v12, v15) & 1) != 0))
        {
          v20 = objc_retainAutorelease(v12);
          sub_10000E8A0(a2, (char *)objc_msgSend(v20, "UTF8String"));

          goto LABEL_24;
        }

      }
      v16 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 68289026;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v17 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,noCmamFound\"}";
    }
    else
    {
      v16 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 68289026;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v17 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,invalidInfoCount\"}";
    }
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x12u);
LABEL_22:
    sub_10000E8A0(a2, "");
LABEL_24:

    goto LABEL_25;
  }
  v19 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getAnyCmamFailed,dictionaryIsEmpty\"}", buf, 0x12u);
  }
  sub_10000E8A0(a2, "");
LABEL_26:

}

void sub_10009042C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void SACommonUtils::getLongestCmam(SACommonUtils *this@<X0>, _QWORD *a2@<X8>)
{
  SACommonUtils *v4;
  SACommonUtils *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  int v22;
  int v23;
  __int16 v24;
  const char *v25;

  v4 = this;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SACommonUtils objectForKey:](v4, "objectForKey:", CFSTR("info")));
    if (v6 && (v7 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
    {
      v8 = v6;
      v9 = objc_msgSend(v8, "count");
      if (v9)
      {
        v10 = 0;
        while (1)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("CMAMlongtext")));

          if (v12)
          {
            v13 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
              break;
          }

          if (v9 == (id)++v10)
          {
            v14 = 0;
            while (1)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v14));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("CMAMtext")));

              if (v12)
              {
                v16 = objc_opt_class(NSString);
                if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
                  goto LABEL_25;
              }

              if (v9 == (id)++v14)
              {
                v17 = SALogObjectGeneral;
                if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_24;
                v22 = 68289026;
                v23 = 0;
                v24 = 2082;
                v25 = "";
                v18 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,noCmamFound\"}";
                goto LABEL_23;
              }
            }
          }
        }
LABEL_25:
        v21 = objc_retainAutorelease(v12);
        sub_10000E8A0(a2, (char *)objc_msgSend(v21, "UTF8String"));

      }
      else
      {
        v17 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 68289026;
          v23 = 0;
          v24 = 2082;
          v25 = "";
          v18 = "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,invalidInfoCount\"}";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x12u);
        }
LABEL_24:
        sub_10000E8A0(a2, "");
      }

    }
    else
    {
      v19 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 68289026;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,invalidInfo\"}", (uint8_t *)&v22, 0x12u);
      }
      sub_10000E8A0(a2, "");
    }

  }
  else
  {
    v20 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 68289026;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa_util,#warning,getLongestCmam,dictionaryIsEmpty\"}", (uint8_t *)&v22, 0x12u);
    }
    sub_10000E8A0(a2, "");
  }

}

void sub_10009082C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::getStringFromDictionary(void *a1, uint64_t a2, std::string *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKey:", a2));
  if (v4 && (v5 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    sub_10004BE30(a3, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_100090910(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SACommonUtils::getWEAHandling(void *a1, std::string *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  std::string::size_type size;
  NSObject *v14;
  NSObject *v15;
  std::string *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  std::string __str;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  std::string *v27;
  _BYTE v28[128];

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("info")));
    if (v5 && (v6 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    {
      memset(&__str, 0, sizeof(__str));
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v18;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
            if (v11)
            {
              v12 = objc_opt_class(NSDictionary);
              if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
              {
                if (SACommonUtils::getStringFromDictionary(v11, (uint64_t)CFSTR("WEAHandling"), &__str))
                {
                  size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    size = __str.__r_.__value_.__l.__size_;
                  if (size)
                  {
                    std::string::operator=(a2, &__str);
                    v15 = SALogObjectGeneral;
                    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                    {
                      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                        v16 = a2;
                      else
                        v16 = (std::string *)a2->__r_.__value_.__r.__words[0];
                      *(_DWORD *)buf = 68289283;
                      v23 = 0;
                      v24 = 2082;
                      v25 = "";
                      v26 = 2081;
                      v27 = v16;
                      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saanalytics,getWEAHandling\", \"weaHandling\":%{private, location:escape_only}s}", buf, 0x1Cu);
                    }

                    goto LABEL_26;
                  }
                }
              }
            }
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
          if (v8)
            continue;
          break;
        }
      }

      v14 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saanalytics,getWEAHandling,keyword not found\"}", buf, 0x12u);
      }
LABEL_26:

      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);

    }
    else
    {

    }
  }

}

void sub_100090BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;
  void *v24;

  if (a23 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::getWeaHandlingType(unint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  _BOOL4 v8;
  unint64_t v9;
  BOOL v10;
  int v11;
  int v12;
  unint64_t v13;
  int v14;
  _BOOL4 v16;
  unint64_t v17;
  int v18;
  BOOL v20;
  unsigned int v21;

  result = 0;
  v3 = *(unsigned __int8 *)(a1 + 23);
  v4 = (char)v3;
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a1 + 8);
  switch(v3)
  {
    case 5:
      if (v4 < 0)
        a1 = *(_QWORD *)a1;
      v5 = *(_DWORD *)a1;
      v6 = *(unsigned __int8 *)(a1 + 4);
      v8 = v5 == 1700949313 && v6 == 114;
      result = (2 * v8);
      break;
    case 8:
      if (v4 < 0)
        a1 = *(_QWORD *)a1;
      v9 = bswap64(*(_QWORD *)a1);
      v10 = v9 >= 0x5745412054657374;
      v11 = v9 > 0x5745412054657374;
      v12 = !v10;
      if (v11 == v12)
        result = 6;
      else
        result = 0;
      break;
    case 10:
      if (v4 < 0)
        a1 = *(_QWORD *)a1;
      v13 = *(_QWORD *)a1;
      v14 = *(unsigned __int16 *)(a1 + 8);
      v16 = v13 == 0x6175716874726145 && v14 == 25963;
      result = (4 * v16);
      break;
    case 12:
      if (v4 < 0)
        a1 = *(_QWORD *)a1;
      v17 = *(_QWORD *)a1;
      v18 = *(_DWORD *)(a1 + 8);
      result = v17 == 0x6E65646973657250 && v18 == 1818323316;
      break;
    case 13:
      if (v4 < 0)
        a1 = *(_QWORD *)a1;
      v20 = (*(_QWORD *)a1 ^ 0x532063696C627550 | *(_QWORD *)(a1 + 5) ^ 0x7974656661532063) == 0;
      v21 = 5;
      goto LABEL_44;
    case 15:
      if (v4 < 0)
        a1 = *(_QWORD *)a1;
      v20 = (*(_QWORD *)a1 ^ 0x746E656E696D6D49 | *(_QWORD *)(a1 + 7) ^ 0x7461657268542074) == 0;
      v21 = 3;
LABEL_44:
      if (v20)
        result = v21;
      else
        result = 0;
      break;
    default:
      return result;
  }
  return result;
}

id SACommonUtils::SACommonGetRunLoop(SACommonUtils *this)
{
  void *v1;
  id v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v2 = objc_msgSend(v1, "getCFRunLoop");

  return v2;
}

void sub_100090E28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SACommonUtils::isLivabiltyEnabled(SACommonUtils *this)
{
  if (*((_BYTE *)sub_10003D044() + 297))
    return 1;
  else
    return _os_feature_enabled_impl("SafetyAlerts", "SafetyAlertsLivability");
}

uint64_t SACommonUtils::weightedMedian(char **a1, float **a2, _DWORD *a3)
{
  char *v4;
  char *v5;
  float *v6;
  float *v7;
  unint64_t v8;
  unint64_t v9;
  double v12;
  float v13;
  float v14;
  double v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  char *v24;
  char *v25;
  char *v26;
  unint64_t v27;
  int v28;
  float v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  float v39;
  float *v40;
  float v41;
  NSObject *v42;
  int v43;
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  _QWORD v48[2];

  v5 = *a1;
  v4 = a1[1];
  if (*a1 == v4 || (v6 = *a2, v7 = a2[1], *a2 == v7))
  {
    v20 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
      return 0;
    v21 = *a2 == a2[1];
    v43 = 68289539;
    v44 = 0;
    v45 = 2082;
    v46 = "";
    v47 = 1025;
    LODWORD(v48[0]) = v5 == v4;
    WORD2(v48[0]) = 1025;
    *(_DWORD *)((char *)v48 + 6) = v21;
    v17 = "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,empty size\", \"isArrayEmpty\":%{private}d, \"isWe"
          "ightEmpty\":%{private}d}";
LABEL_13:
    v18 = v20;
    v19 = 30;
    goto LABEL_14;
  }
  v8 = (char *)v7 - (char *)v6;
  v9 = v4 - v5;
  if ((char *)v7 - (char *)v6 != v9)
  {
    v20 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
      return 0;
    v43 = 68289539;
    v44 = 0;
    v45 = 2082;
    v46 = "";
    v47 = 1025;
    LODWORD(v48[0]) = v9 >> 2;
    WORD2(v48[0]) = 1025;
    *(_DWORD *)((char *)v48 + 6) = v8 >> 2;
    v17 = "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,unequal size\", \"arraySize\":%{private}d, \"weigh"
          "tsSize\":%{private}d}";
    goto LABEL_13;
  }
  v12 = 0.0;
  do
  {
    v13 = *v6++;
    v12 = v12 + v13;
  }
  while (v6 != v7);
  v14 = v12;
  v15 = v14;
  if (fabs(v14 + -1.0) > 0.001)
  {
    v16 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v43 = 68289283;
      v44 = 0;
      v45 = 2082;
      v46 = "";
      v47 = 2049;
      *(double *)v48 = v15;
      v17 = "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,sumWeights invalid\", \"sumWeights\":\"%{private}.4f\"}";
      v18 = v16;
      v19 = 28;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v43, v19);
    }
    return 0;
  }
  if (v8 == 4)
  {
    *a3 = *(_DWORD *)v5;
    return 1;
  }
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  do
  {
    v28 = *(_DWORD *)&v5[4 * v27];
    v29 = (*a2)[v27];
    if (v25 >= v26)
    {
      v30 = (v25 - v24) >> 3;
      v31 = v30 + 1;
      if ((unint64_t)(v30 + 1) >> 61)
        sub_100004C50();
      if ((v26 - v24) >> 2 > v31)
        v31 = (v26 - v24) >> 2;
      if ((unint64_t)(v26 - v24) >= 0x7FFFFFFFFFFFFFF8)
        v32 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v32 = v31;
      if (v32)
      {
        if (v32 >> 61)
          sub_100004984();
        v33 = (char *)operator new(8 * v32);
      }
      else
      {
        v33 = 0;
      }
      v34 = &v33[8 * v30];
      *(_DWORD *)v34 = v28;
      *((float *)v34 + 1) = v29;
      v35 = v34;
      while (v25 != v24)
      {
        v36 = *((_QWORD *)v25 - 1);
        v25 -= 8;
        *((_QWORD *)v35 - 1) = v36;
        v35 -= 8;
      }
      v26 = &v33[8 * v32];
      v25 = v34 + 8;
      if (v24)
        operator delete(v24);
      v24 = v35;
    }
    else
    {
      *(_DWORD *)v25 = v28;
      *((float *)v25 + 1) = v29;
      v25 += 8;
    }
    ++v27;
    v5 = *a1;
  }
  while (v27 < (a1[1] - *a1) >> 2);
  v37 = 126 - 2 * __clz((v25 - v24) >> 3);
  if (v25 == v24)
    v38 = 0;
  else
    v38 = v37;
  sub_100091EE4((float *)v24, (float *)v25, v38, 1);
  if (((*((_DWORD *)a1 + 2) - *(_DWORD *)a1) & 4) != 0)
  {
    if (v25 != v24)
    {
      v41 = 0.0;
      v40 = (float *)v24;
      while (1)
      {
        v41 = v41 + v40[1];
        if (v41 > 0.5)
          break;
        v40 += 2;
        if (v40 == (float *)v25)
          goto LABEL_52;
      }
LABEL_56:
      *a3 = *(_DWORD *)v40;
      v22 = 1;
      if (!v24)
        return v22;
LABEL_57:
      operator delete(v24);
      return v22;
    }
  }
  else if (v25 != v24)
  {
    v39 = 0.0;
    v40 = (float *)v24;
    do
    {
      v39 = v39 + v40[1];
      if (v39 >= 0.5)
        goto LABEL_56;
      v40 += 2;
    }
    while (v40 != (float *)v25);
  }
LABEL_52:
  v42 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v43 = 68289026;
    v44 = 0;
    v45 = 2082;
    v46 = "";
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#commonUtils,weightedMedian,#warning,median not found\"}", (uint8_t *)&v43, 0x12u);
  }
  v22 = 0;
  if (v24)
    goto LABEL_57;
  return v22;
}

void sub_1000912EC(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

BOOL SACommonUtils::didRebootSince(SACommonUtils *this, double a2)
{
  uint64_t v3;
  double v4;

  v3 = mach_continuous_time();
  v4 = sub_1000842A4(v3);
  return (double)(uint64_t)((double)(uint64_t)(double)time(0) - v4 + -978307200.0) >= a2;
}

uint64_t SACommonUtils::currentHourOfDay(SACommonUtils *this)
{
  __CFCalendar *v1;
  CFAbsoluteTime Current;
  unsigned int v4;

  v4 = 0;
  v1 = CFCalendarCopyCurrent();
  Current = CFAbsoluteTimeGetCurrent();
  CFCalendarDecomposeAbsoluteTime(v1, Current, "H", &v4);
  if (v1)
    CFRelease(v1);
  return v4;
}

void SACommonUtils::convertDictionaryToString(SACommonUtils *this@<X0>, uint64_t a2@<X8>)
{
  SACommonUtils *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _BYTE buf[28];

  v4 = this;
  sub_10000E8A0((_QWORD *)a2, "{}");
  if (v4)
  {
    v12 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v4, 0, &v12));
    v6 = v12;
    if (v6 || !v5)
    {
      v10 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289283;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2113;
        *(_QWORD *)&buf[20] = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#commonUtils,convertDictionaryToString\", \"error\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
      v8 = v7;
      if (v7)
      {
        sub_10000E8A0(buf, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
        if (*(char *)(a2 + 23) < 0)
          operator delete(*(void **)a2);
        *(_OWORD *)a2 = *(_OWORD *)buf;
        *(_QWORD *)(a2 + 16) = *(_QWORD *)&buf[16];
      }
      else
      {
        v11 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289026;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#commonUtils,convertDictionaryToString,str nil\"}", buf, 0x12u);
        }
      }

    }
  }
  else
  {
    v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#commonUtils,convertDictionaryToString,dict nil\"}", buf, 0x12u);
    }
  }

}

void sub_100091624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);

  _Unwind_Resume(a1);
}

id SACommonUtils::convertStringToDictionary(uint64_t *a1)
{
  uint64_t *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v1 = a1;
  if (*((char *)a1 + 23) < 0)
  {
    if (!a1[1])
    {
LABEL_10:
      v6 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary,empty string\"}", buf, 0x12u);
      }
      return 0;
    }
    v1 = (uint64_t *)*a1;
  }
  else if (!*((_BYTE *)a1 + 23))
  {
    goto LABEL_10;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v1));
  if (v2)
  {
    v10 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v2, 1, &v10));
    v4 = v10;
    if (v4 || !v3)
    {
      v9 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2113;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary\", \"error\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      v5 = 0;
    }
    else
    {
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &stru_1000F68E8);
      v5 = v3;
    }

  }
  else
  {
    v8 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary,null data\"}", buf, 0x12u);
    }
    v5 = 0;
  }

  return v5;
}

void sub_1000918AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000918D0(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v5;
    v13 = 2113;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#commonUtils,convertStringToDictionary\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }

}

uint64_t SACommonUtils::convertHexToChar(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4)
{
  unint64_t v4;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t result;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unint64_t v35;

  if (*(char *)(a1 + 23) >= 0)
    v4 = *(unsigned __int8 *)(a1 + 23);
  else
    v4 = *(_QWORD *)(a1 + 8);
  if (a3 < v4 >> 1)
  {
    v6 = SALogObjectGeneral;
    v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v7)
    {
      v28 = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 1025;
      v33 = a3;
      v34 = 2049;
      v35 = v4;
      v9 = "{\"msg%{public}.0s\":\"#commonUtils,convertHexToChar,invalid len\", \"len\":%{private}d, \"hex.size()\":%{private}llu}";
      v10 = v6;
      v11 = 34;
      goto LABEL_7;
    }
    return result;
  }
  *a4 = 0;
  v12 = *(char *)(a1 + 23) < 0;
  v13 = *(unsigned __int8 *)(a1 + 23);
  if ((v13 & 0x80u) != 0)
    v13 = *(_QWORD *)(a1 + 8);
  if (!v13)
  {
    v22 = 0;
LABEL_32:
    *a4 = v22;
    return 1;
  }
  v14 = 0;
  v15 = 0;
  v16 = 2;
  while (1)
  {
    v17 = v12 ? *(_QWORD *)a1 : a1;
    if (*(unsigned __int8 *)(v17 + v14) - 48 >= 0xA)
    {
      if (*(unsigned __int8 *)(v17 + v14) - 97 >= 6)
      {
        if (*(unsigned __int8 *)(v17 + v14) - 65 >= 6)
        {
          v25 = SALogObjectGeneral;
          v26 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
          result = 0;
          if (!v26)
            return result;
          goto LABEL_37;
        }
        v18 = -55;
      }
      else
      {
        v18 = -87;
      }
    }
    else
    {
      v18 = -48;
    }
    v19 = *(_BYTE *)(v17 + v14);
    v20 = v16 - 1;
    if (*(unsigned __int8 *)(v17 + v20) - 48 >= 0xA)
      break;
    v21 = -48;
LABEL_27:
    *(_BYTE *)(a2 + v15) = (*(_BYTE *)(v17 + v20) + v21) | (16 * (v19 + v18));
    v22 = v15 + 1;
    v14 = v16;
    v12 = *(char *)(a1 + 23) < 0;
    v23 = *(unsigned __int8 *)(a1 + 23);
    if ((v23 & 0x80u) != 0)
      v23 = *(_QWORD *)(a1 + 8);
    v24 = v23 > v16;
    v16 += 2;
    v15 = v22;
    if (!v24)
      goto LABEL_32;
  }
  if (*(unsigned __int8 *)(v17 + v20) - 97 < 6)
  {
    v21 = -87;
    goto LABEL_27;
  }
  if (*(unsigned __int8 *)(v17 + v20) - 65 < 6)
  {
    v21 = -55;
    goto LABEL_27;
  }
  v25 = SALogObjectGeneral;
  v27 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (!v27)
    return result;
LABEL_37:
  v28 = 68289026;
  v29 = 0;
  v30 = 2082;
  v31 = "";
  v9 = "{\"msg%{public}.0s\":\"#commonUtils,convertHexToChar,error\"}";
  v10 = v25;
  v11 = 18;
LABEL_7:
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v28, v11);
  return 0;
}

uint64_t SACommonUtils::convertCharToHex(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  int v11;
  char v12;
  __int128 v14;
  uint64_t v15;

  if (a2)
  {
    v5 = 0;
    v6 = a2;
    do
    {
      v7 = 1;
      do
      {
        v8 = *(unsigned __int8 *)(a1 + v5);
        v9 = v7;
        v10 = v8 >> 4;
        v11 = v8 & 0xF;
        if ((v9 & 1) == 0)
          v10 = v11;
        if (v10 > 9)
          v12 = v10 + 87;
        else
          v12 = v10 | 0x30;
        sub_100091D58((const void **)a3, v12, (uint64_t)&v14);
        if (*(char *)(a3 + 23) < 0)
          operator delete(*(void **)a3);
        *(_OWORD *)a3 = v14;
        *(_QWORD *)(a3 + 16) = v15;
        v7 = 0;
      }
      while ((v9 & 1) != 0);
      ++v5;
    }
    while (v5 != v6);
  }
  return 1;
}

uint64_t sub_100091D58@<X0>(const void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  size_t v5;
  uint64_t result;
  char *v7;
  const void *v8;
  char *v9;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  result = sub_1000931F8(a3, v5 + 1);
  if (*(char *)(result + 23) >= 0)
    v7 = (char *)result;
  else
    v7 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v8 = a1;
    else
      v8 = *a1;
    result = (uint64_t)memmove(v7, v8, v5);
  }
  v9 = &v7[v5];
  *v9 = a2;
  v9[1] = 0;
  return result;
}

uint64_t SACommonUtils::copyDataAndReturnNewLen(SACommonUtils *this, void *a2, const void *a3, unsigned int a4, size_t __n, _DWORD *a6, unsigned int *a7)
{
  int v7;
  uint64_t result;
  NSObject *v10;
  _BOOL4 v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;

  if (this && a2 && (v7 = __n, __n <= a4) && *a6 + (int)__n <= a3)
  {
    memcpy(this, a2, __n);
    result = (*a6 + v7);
    *a6 = result;
  }
  else
  {
    v10 = SALogObjectGeneral;
    v11 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v11)
    {
      v12[0] = 68289026;
      v12[1] = 0;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#bletransport,copyDataAndReturnNewLen invalid data\"}", (uint8_t *)v12, 0x12u);
      return 0;
    }
  }
  return result;
}

void sub_100091EE4(float *a1, float *a2, uint64_t a3, char a4)
{
  float *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float *v12;
  float v13;
  int v14;
  float v15;
  int v16;
  float v17;
  float v18;
  unsigned __int8 v19;
  uint64_t v20;
  float v21;
  int v22;
  float v23;
  unsigned __int8 v24;
  float *v25;
  float *v26;
  float *v27;
  int v28;
  float v29;
  unsigned __int8 v30;
  float *v31;
  int v32;
  float v33;
  char v34;
  unsigned __int8 v35;
  int v36;
  float *v37;
  int v38;
  float *v39;
  int v40;
  BOOL v41;
  float v42;
  unsigned __int8 v43;
  float *v44;
  float v45;
  char v46;
  unsigned __int8 v47;
  BOOL v48;
  float v49;
  float v50;
  unsigned __int8 v51;
  float *v52;
  int v53;
  float v54;
  unsigned __int8 v55;
  float *v56;
  float v57;
  unsigned __int8 v58;
  float *v59;
  float *v60;
  int v61;
  BOOL v62;
  float v63;
  unsigned __int8 v64;
  float v65;
  float v66;
  int v67;
  float *v68;
  float v69;
  unsigned __int8 v70;
  float *v71;
  float v72;
  BOOL v73;
  float v74;
  unsigned __int8 v75;
  int v76;
  float v77;
  float v78;
  float v79;
  unsigned __int8 v80;
  float *v81;
  BOOL v83;
  uint64_t v84;
  float *v85;
  float *v86;
  int v87;
  int v88;
  float v89;
  float v90;
  unsigned __int8 v91;
  float v92;
  uint64_t v93;
  char *v94;
  float v95;
  unsigned __int8 v96;
  uint64_t v97;
  int64_t v98;
  int64_t v99;
  int64_t v100;
  uint64_t v101;
  float *v102;
  int v103;
  float v104;
  float v105;
  char v106;
  float *v107;
  int v108;
  int v109;
  float v110;
  float v111;
  unsigned __int8 v112;
  float v113;
  float *v114;
  uint64_t v115;
  int v116;
  float v117;
  float v118;
  char v119;
  float v120;
  unsigned __int8 v121;
  uint64_t v122;
  uint64_t v123;
  float v124;
  float v125;
  uint64_t v126;
  uint64_t v127;
  float *v128;
  uint64_t v129;
  float *v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  float v134;
  float v135;
  char v136;
  uint64_t v137;
  unint64_t v138;
  float *v139;
  int v140;
  float v141;
  float v142;
  float v143;
  unsigned __int8 v144;
  float *v145;
  float v146;
  unsigned __int8 v147;
  int v148;
  float *v149;
  float *v150;
  int v151;
  int v152;
  float v153;
  float v154;
  unsigned __int8 v155;
  float v156;
  float *v157;
  float *v158;
  int v159;
  float v160;
  char v161;
  unsigned __int8 v162;
  float *v163;

LABEL_1:
  v163 = a2 - 2;
  v8 = a1;
  while (2)
  {
    a1 = v8;
    v9 = (char *)a2 - (char *)v8;
    v10 = ((char *)a2 - (char *)v8) >> 3;
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v76 = *((_DWORD *)a2 - 2);
        v77 = *v8;
        if (v76 == *(_DWORD *)v8)
        {
          v78 = *(a2 - 1);
          v79 = v8[1];
          if (v78 == v79)
            v80 = 0;
          else
            v80 = -127;
          if (v78 > v79)
            v80 = 1;
          if (v78 < v79)
            v80 = -1;
        }
        else if (v76 < SLODWORD(v77))
        {
          v80 = -1;
        }
        else
        {
          v80 = 1;
        }
        if (v80 != 129 && (v80 & 0x80) != 0)
        {
          *(_DWORD *)v8 = v76;
          *(a2 - 2) = v77;
          v148 = *((_DWORD *)v8 + 1);
          v8[1] = *(a2 - 1);
          *((_DWORD *)a2 - 1) = v148;
        }
        return;
      case 3uLL:
        sub_100092AF4(v8, v8 + 2, v163);
        return;
      case 4uLL:
        sub_100092EE4(v8, v8 + 2, v8 + 4, (uint64_t)v163);
        return;
      case 5uLL:
        sub_100093038(v8, v8 + 2, v8 + 4, (uint64_t)(v8 + 6), (int *)v163);
        return;
      default:
        if (v9 <= 191)
        {
          v81 = v8 + 2;
          v83 = v8 == a2 || v81 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v83)
            {
              v84 = 0;
              v85 = v8;
              do
              {
                v86 = v85;
                v85 = v81;
                v87 = *((_DWORD *)v86 + 2);
                v88 = *(_DWORD *)v86;
                if (v87 == *(_DWORD *)v86)
                {
                  v89 = v86[3];
                  v90 = v86[1];
                  if (v89 == v90)
                    v91 = 0;
                  else
                    v91 = -127;
                  if (v89 > v90)
                    v91 = 1;
                  if (v89 < v90)
                    v91 = -1;
                }
                else if (v87 < v88)
                {
                  v91 = -1;
                }
                else
                {
                  v91 = 1;
                }
                if (v91 != 129 && (v91 & 0x80) != 0)
                {
                  v92 = v86[3];
                  v93 = v84;
                  while (1)
                  {
                    v94 = (char *)v8 + v93;
                    *((_DWORD *)v94 + 2) = v88;
                    *((float *)v94 + 3) = *(float *)((char *)v8 + v93 + 4);
                    if (!v93)
                      break;
                    v88 = *((_DWORD *)v94 - 2);
                    if (v87 == v88)
                    {
                      v95 = *(float *)((char *)v8 + v93 - 4);
                      if (v92 == v95)
                        v96 = 0;
                      else
                        v96 = -127;
                      if (v92 > v95)
                        v96 = 1;
                      if (v92 < v95)
                        v96 = -1;
                    }
                    else if (v87 < v88)
                    {
                      v96 = -1;
                    }
                    else
                    {
                      v96 = 1;
                    }
                    v93 -= 8;
                    if (v96 == 129 || (v96 & 0x80) == 0)
                    {
                      v97 = (uint64_t)v8 + v93 + 8;
                      goto LABEL_253;
                    }
                  }
                  v97 = (uint64_t)v8;
LABEL_253:
                  *(_DWORD *)v97 = v87;
                  *(float *)(v97 + 4) = v92;
                }
                v81 = v85 + 2;
                v84 += 8;
              }
              while (v85 + 2 != a2);
            }
          }
          else if (!v83)
          {
            v149 = v8 + 3;
            do
            {
              v150 = a1;
              a1 = v81;
              v151 = *((_DWORD *)v150 + 2);
              v152 = *(_DWORD *)v150;
              if (v151 == *(_DWORD *)v150)
              {
                v153 = v150[3];
                v154 = v150[1];
                if (v153 == v154)
                  v155 = 0;
                else
                  v155 = -127;
                if (v153 > v154)
                  v155 = 1;
                if (v153 < v154)
                  v155 = -1;
              }
              else if (v151 < v152)
              {
                v155 = -1;
              }
              else
              {
                v155 = 1;
              }
              if (v155 != 129 && (v155 & 0x80) != 0)
              {
                v156 = v150[3];
                v157 = v149;
                v158 = v149;
                do
                {
                  *((_DWORD *)v157 - 1) = v152;
                  v159 = *((_DWORD *)v158 - 2);
                  v158 -= 2;
                  *(_DWORD *)v157 = v159;
                  v152 = *((_DWORD *)v157 - 5);
                  if (v151 == v152)
                  {
                    v160 = *(v157 - 4);
                    if (v156 == v160)
                      v161 = 0;
                    else
                      v161 = -127;
                    if (v156 > v160)
                      v161 = 1;
                    if (v156 < v160)
                      v162 = -1;
                    else
                      v162 = v161;
                  }
                  else if (v151 < v152)
                  {
                    v162 = -1;
                  }
                  else
                  {
                    v162 = 1;
                  }
                  if (v162 == 129)
                    break;
                  v157 = v158;
                }
                while ((v162 & 0x80) != 0);
                *((_DWORD *)v158 - 1) = v151;
                *v158 = v156;
              }
              v81 = a1 + 2;
              v149 += 2;
            }
            while (a1 + 2 != a2);
          }
          return;
        }
        if (!a3)
        {
          if (v8 == a2)
            return;
          v98 = (v10 - 2) >> 1;
          v99 = v98;
          do
          {
            v100 = v99;
            if (v98 >= v99)
            {
              v101 = (2 * v99) | 1;
              v102 = &v8[2 * v101];
              if (2 * v100 + 2 < (uint64_t)v10)
              {
                v103 = *((_DWORD *)v102 + 2);
                if (*(_DWORD *)v102 == v103)
                {
                  v104 = v8[2 * v101 + 1];
                  v105 = v102[3];
                  if (v104 == v105)
                    v106 = 0;
                  else
                    v106 = -127;
                  if (v104 > v105)
                    v106 = 1;
                  if (v104 < v105)
                    v106 = -1;
                }
                else if (*(_DWORD *)v102 < v103)
                {
                  v106 = -1;
                }
                else
                {
                  v106 = 1;
                }
                if (v106 != 129 && v106 < 0)
                {
                  v102 += 2;
                  v101 = 2 * v100 + 2;
                }
              }
              v107 = &v8[2 * v100];
              v108 = *(_DWORD *)v102;
              v109 = *(_DWORD *)v107;
              if (*(_DWORD *)v102 == *(_DWORD *)v107)
              {
                v110 = v102[1];
                v111 = v8[2 * v100 + 1];
                if (v110 == v111)
                  v112 = 0;
                else
                  v112 = -127;
                if (v110 > v111)
                  v112 = 1;
                if (v110 < v111)
                  v112 = -1;
              }
              else if (v108 < v109)
              {
                v112 = -1;
              }
              else
              {
                v112 = 1;
              }
              if (v112 == 129 || (v112 & 0x80) == 0)
              {
                v113 = v107[1];
                do
                {
                  v114 = v107;
                  v107 = v102;
                  *(_DWORD *)v114 = v108;
                  v114[1] = v102[1];
                  if (v98 < v101)
                    break;
                  v115 = (2 * v101) | 1;
                  v102 = &v8[2 * v115];
                  v101 = 2 * v101 + 2;
                  if (v101 >= (uint64_t)v10)
                  {
                    v101 = v115;
                  }
                  else
                  {
                    v116 = *((_DWORD *)v102 + 2);
                    if (*(_DWORD *)v102 == v116)
                    {
                      v117 = v8[2 * v115 + 1];
                      v118 = v102[3];
                      if (v117 == v118)
                        v119 = 0;
                      else
                        v119 = -127;
                      if (v117 > v118)
                        v119 = 1;
                      if (v117 < v118)
                        v119 = -1;
                    }
                    else
                    {
                      v119 = *(_DWORD *)v102 < v116 ? -1 : 1;
                    }
                    if (v119 != 129 && v119 < 0)
                      v102 += 2;
                    else
                      v101 = v115;
                  }
                  v108 = *(_DWORD *)v102;
                  if (*(_DWORD *)v102 == v109)
                  {
                    v120 = v102[1];
                    if (v120 == v113)
                      v121 = 0;
                    else
                      v121 = -127;
                    if (v120 > v113)
                      v121 = 1;
                    if (v120 < v113)
                      v121 = -1;
                  }
                  else
                  {
                    v121 = v108 < v109 ? -1 : 1;
                  }
                }
                while (v121 == 129 || (v121 & 0x80) == 0);
                *(_DWORD *)v107 = v109;
                v107[1] = v113;
              }
            }
            v99 = v100 - 1;
          }
          while (v100);
          v122 = (unint64_t)v9 >> 3;
          while (2)
          {
            v123 = 0;
            v124 = *v8;
            v125 = v8[1];
            v126 = v122 - 2;
            if (v122 < 2)
              v126 = v122 - 1;
            v127 = v126 >> 1;
            v128 = v8;
            do
            {
              v129 = v123 + 1;
              v130 = &v128[2 * v123 + 2];
              v131 = (2 * v123) | 1;
              v132 = 2 * v123 + 2;
              if (v132 < v122)
              {
                v133 = *((_DWORD *)v130 + 2);
                if (*(_DWORD *)v130 == v133)
                {
                  v134 = v128[2 * v129 + 1];
                  v135 = v130[3];
                  if (v134 == v135)
                    v136 = 0;
                  else
                    v136 = -127;
                  if (v134 > v135)
                    v136 = 1;
                  if (v134 < v135)
                    v136 = -1;
                }
                else if (*(_DWORD *)v130 < v133)
                {
                  v136 = -1;
                }
                else
                {
                  v136 = 1;
                }
                if (v136 != 129 && v136 < 0)
                {
                  v130 += 2;
                  v131 = v132;
                }
              }
              *v128 = *v130;
              v128[1] = v130[1];
              v128 = v130;
              v123 = v131;
            }
            while (v131 <= v127);
            if (v130 != a2 - 2)
            {
              *v130 = *(a2 - 2);
              v130[1] = *(a2 - 1);
              *(a2 - 2) = v124;
              *(a2 - 1) = v125;
              v137 = (char *)v130 - (char *)v8 + 8;
              if (v137 >= 9)
              {
                v138 = (((unint64_t)v137 >> 3) - 2) >> 1;
                v139 = &v8[2 * v138];
                v140 = *(_DWORD *)v139;
                v141 = *v130;
                if (*(_DWORD *)v139 == *(_DWORD *)v130)
                {
                  v142 = v139[1];
                  v143 = v130[1];
                  if (v142 == v143)
                    v144 = 0;
                  else
                    v144 = -127;
                  if (v142 > v143)
                    v144 = 1;
                  if (v142 < v143)
                    v144 = -1;
                }
                else
                {
                  v144 = v140 < SLODWORD(v141) ? -1 : 1;
                }
                if (v144 != 129 && (v144 & 0x80) != 0)
                {
                  v125 = v130[1];
                  do
                  {
                    v145 = v130;
                    v130 = v139;
                    *(_DWORD *)v145 = v140;
                    v145[1] = v139[1];
                    if (!v138)
                      break;
                    v138 = (v138 - 1) >> 1;
                    v139 = &v8[2 * v138];
                    v140 = *(_DWORD *)v139;
                    if (*(_DWORD *)v139 == LODWORD(v141))
                    {
                      v146 = v139[1];
                      if (v146 == v125)
                        v147 = 0;
                      else
                        v147 = -127;
                      if (v146 > v125)
                        v147 = 1;
                      if (v146 < v125)
                        v147 = -1;
                    }
                    else
                    {
                      v147 = v140 < SLODWORD(v141) ? -1 : 1;
                    }
                  }
                  while (v147 != 129 && (v147 & 0x80) != 0);
                  *v130 = v141;
LABEL_370:
                  v130[1] = v125;
                }
              }
              a2 -= 2;
              v41 = v122-- <= 2;
              if (v41)
                return;
              continue;
            }
            break;
          }
          *v130 = v124;
          goto LABEL_370;
        }
        v11 = v10 >> 1;
        v12 = &v8[2 * (v10 >> 1)];
        if ((unint64_t)v9 < 0x401)
        {
          sub_100092AF4(&a1[2 * (v10 >> 1)], a1, v163);
        }
        else
        {
          sub_100092AF4(a1, &a1[2 * (v10 >> 1)], v163);
          sub_100092AF4(a1 + 2, v12 - 2, a2 - 4);
          sub_100092AF4(a1 + 4, &a1[2 * v11 + 2], a2 - 6);
          sub_100092AF4(v12 - 2, v12, &a1[2 * v11 + 2]);
          v13 = *a1;
          *a1 = *v12;
          *v12 = v13;
          v14 = *((_DWORD *)a1 + 1);
          a1[1] = v12[1];
          *((_DWORD *)v12 + 1) = v14;
        }
        --a3;
        v15 = *a1;
        if ((a4 & 1) == 0)
        {
          v16 = *((_DWORD *)a1 - 2);
          if (v16 == LODWORD(v15))
          {
            v17 = *(a1 - 1);
            v18 = a1[1];
            if (v17 == v18)
              v19 = 0;
            else
              v19 = -127;
            if (v17 > v18)
              v19 = 1;
            if (v17 < v18)
              v19 = -1;
          }
          else
          {
            v19 = v16 < SLODWORD(v15) ? -1 : 1;
          }
          if (v19 == 129 || (v19 & 0x80) == 0)
          {
            v49 = a1[1];
            if (LODWORD(v15) == *(_DWORD *)v163)
            {
              v50 = *(a2 - 1);
              if (v49 == v50)
                v51 = 0;
              else
                v51 = -127;
              if (v49 > v50)
                v51 = 1;
              if (v49 < v50)
                v51 = -1;
            }
            else if (SLODWORD(v15) < *(_DWORD *)v163)
            {
              v51 = -1;
            }
            else
            {
              v51 = 1;
            }
            if (v51 == 129 || (v51 & 0x80) == 0)
            {
              v56 = a1 + 2;
              do
              {
                v8 = v56;
                if (v56 >= a2)
                  break;
                if (LODWORD(v15) == *(_DWORD *)v56)
                {
                  v57 = v56[1];
                  if (v49 == v57)
                    v58 = 0;
                  else
                    v58 = -127;
                  if (v49 > v57)
                    v58 = 1;
                  if (v49 < v57)
                    v58 = -1;
                }
                else
                {
                  v58 = SLODWORD(v15) < *(_DWORD *)v56 ? -1 : 1;
                }
                v56 += 2;
              }
              while (v58 == 129 || (v58 & 0x80) == 0);
            }
            else
            {
              v52 = a1;
              while (1)
              {
                v8 = v52 + 2;
                v53 = *((_DWORD *)v52 + 2);
                if (LODWORD(v15) == v53)
                {
                  v54 = v52[3];
                  if (v49 == v54)
                    v55 = 0;
                  else
                    v55 = -127;
                  if (v49 > v54)
                    v55 = 1;
                  if (v49 < v54)
                    v55 = -1;
                }
                else if (SLODWORD(v15) < v53)
                {
                  v55 = -1;
                }
                else
                {
                  v55 = 1;
                }
                v52 += 2;
                if (v55 != 129)
                {
                  v52 = v8;
                  if ((v55 & 0x80) != 0)
                    break;
                }
              }
            }
            v59 = a2;
            if (v8 < a2)
            {
              v60 = a2;
              v59 = a2;
              do
              {
                v61 = *((_DWORD *)v59 - 2);
                v59 -= 2;
                v62 = SLODWORD(v15) < v61;
                if (LODWORD(v15) == v61)
                {
                  v63 = *(v60 - 1);
                  if (v49 == v63)
                    v64 = 0;
                  else
                    v64 = -127;
                  if (v49 > v63)
                    v64 = 1;
                  if (v49 < v63)
                    v64 = -1;
                }
                else if (v62)
                {
                  v64 = -1;
                }
                else
                {
                  v64 = 1;
                }
                if (v64 == 129)
                  break;
                v60 = v59;
              }
              while ((v64 & 0x80) != 0);
            }
            if (v8 < v59)
            {
              v65 = *v8;
              v66 = *v59;
              do
              {
                *v8 = v66;
                *v59 = v65;
                v67 = *((_DWORD *)v8 + 1);
                v8[1] = v59[1];
                *((_DWORD *)v59 + 1) = v67;
                v68 = v8;
                while (1)
                {
                  v8 = v68 + 2;
                  v65 = v68[2];
                  if (LODWORD(v15) == LODWORD(v65))
                  {
                    v69 = v68[3];
                    if (v49 == v69)
                      v70 = 0;
                    else
                      v70 = -127;
                    if (v49 > v69)
                      v70 = 1;
                    if (v49 < v69)
                      v70 = -1;
                  }
                  else if (SLODWORD(v15) < SLODWORD(v65))
                  {
                    v70 = -1;
                  }
                  else
                  {
                    v70 = 1;
                  }
                  v68 += 2;
                  if (v70 != 129)
                  {
                    v68 = v8;
                    if ((v70 & 0x80) != 0)
                      break;
                  }
                }
                v71 = v59;
                do
                {
                  v72 = *(v59 - 2);
                  v59 -= 2;
                  v66 = v72;
                  v73 = SLODWORD(v15) < SLODWORD(v72);
                  if (LODWORD(v15) == LODWORD(v72))
                  {
                    v74 = *(v71 - 1);
                    if (v49 == v74)
                      v75 = 0;
                    else
                      v75 = -127;
                    if (v49 > v74)
                      v75 = 1;
                    if (v49 < v74)
                      v75 = -1;
                  }
                  else if (v73)
                  {
                    v75 = -1;
                  }
                  else
                  {
                    v75 = 1;
                  }
                  if (v75 == 129)
                    break;
                  v71 = v59;
                }
                while ((v75 & 0x80) != 0);
              }
              while (v8 < v59);
            }
            if (v8 - 2 != a1)
            {
              *a1 = *(v8 - 2);
              a1[1] = *(v8 - 1);
            }
            a4 = 0;
            *(v8 - 2) = v15;
            *(v8 - 1) = v49;
            continue;
          }
        }
        v20 = 0;
        v21 = a1[1];
        do
        {
          v22 = LODWORD(a1[v20 + 2]);
          if (v22 == LODWORD(v15))
          {
            v23 = a1[v20 + 3];
            if (v23 == v21)
              v24 = 0;
            else
              v24 = -127;
            if (v23 > v21)
              v24 = 1;
            if (v23 < v21)
              v24 = -1;
          }
          else if (v22 < SLODWORD(v15))
          {
            v24 = -1;
          }
          else
          {
            v24 = 1;
          }
          v20 += 2;
        }
        while (v24 != 129 && (v24 & 0x80) != 0);
        v25 = &a1[v20];
        v26 = a2;
        if (v20 == 2)
        {
          v31 = a2;
          while (v25 < v31)
          {
            v27 = v31 - 2;
            v32 = *((_DWORD *)v31 - 2);
            if (v32 == LODWORD(v15))
            {
              v33 = *(v31 - 1);
              if (v33 == v21)
                v34 = 0;
              else
                v34 = -127;
              if (v33 > v21)
                v34 = 1;
              if (v33 < v21)
                v35 = -1;
              else
                v35 = v34;
            }
            else if (v32 < SLODWORD(v15))
            {
              v35 = -1;
            }
            else
            {
              v35 = 1;
            }
            v31 = v27;
            if (v35 != 129)
            {
              v31 = v27;
              if ((v35 & 0x80) != 0)
                goto LABEL_69;
            }
          }
          v27 = v31;
        }
        else
        {
          while (1)
          {
            v27 = v26 - 2;
            v28 = *((_DWORD *)v26 - 2);
            if (v28 == LODWORD(v15))
            {
              v29 = *(v26 - 1);
              if (v29 == v21)
                v30 = 0;
              else
                v30 = -127;
              if (v29 > v21)
                v30 = 1;
              if (v29 < v21)
                v30 = -1;
            }
            else if (v28 < SLODWORD(v15))
            {
              v30 = -1;
            }
            else
            {
              v30 = 1;
            }
            v26 -= 2;
            if (v30 != 129)
            {
              v26 = v27;
              if ((v30 & 0x80) != 0)
                break;
            }
          }
        }
LABEL_69:
        if (v25 >= v27)
        {
          v8 = v25;
        }
        else
        {
          v36 = *(_DWORD *)v27;
          v8 = v25;
          v37 = v27;
          do
          {
            *(_DWORD *)v8 = v36;
            *(_DWORD *)v37 = v22;
            v38 = *((_DWORD *)v8 + 1);
            v8[1] = v37[1];
            *((_DWORD *)v37 + 1) = v38;
            v39 = v8;
            do
            {
              v40 = *((_DWORD *)v8 + 2);
              v8 += 2;
              v22 = v40;
              v41 = v40 < SLODWORD(v15);
              if (v40 == LODWORD(v15))
              {
                v42 = v39[3];
                if (v42 == v21)
                  v43 = 0;
                else
                  v43 = -127;
                if (v42 > v21)
                  v43 = 1;
                if (v42 < v21)
                  v43 = -1;
              }
              else if (v41)
              {
                v43 = -1;
              }
              else
              {
                v43 = 1;
              }
              if (v43 == 129)
                break;
              v39 = v8;
            }
            while ((v43 & 0x80) != 0);
            while (1)
            {
              v44 = v37 - 2;
              v36 = *((_DWORD *)v37 - 2);
              if (v36 == LODWORD(v15))
              {
                v45 = *(v37 - 1);
                if (v45 == v21)
                  v46 = 0;
                else
                  v46 = -127;
                if (v45 > v21)
                  v46 = 1;
                if (v45 < v21)
                  v47 = -1;
                else
                  v47 = v46;
              }
              else if (v36 < SLODWORD(v15))
              {
                v47 = -1;
              }
              else
              {
                v47 = 1;
              }
              v37 = v44;
              if (v47 != 129)
              {
                v37 = v44;
                if ((v47 & 0x80) != 0)
                  break;
              }
            }
            v37 = v44;
          }
          while (v8 < v44);
        }
        if (v8 - 2 != a1)
        {
          *a1 = *(v8 - 2);
          a1[1] = *(v8 - 1);
        }
        *(v8 - 2) = v15;
        *(v8 - 1) = v21;
        if (v25 < v27)
        {
LABEL_107:
          sub_100091EE4(a1, v8 - 2, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v48 = sub_100092CC4(a1, v8 - 2);
        if (!sub_100092CC4(v8, a2))
        {
          if (v48)
            continue;
          goto LABEL_107;
        }
        a2 = v8 - 2;
        if (!v48)
          goto LABEL_1;
        return;
    }
  }
}

float *sub_100092AF4(float *result, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  char v7;
  unsigned __int8 v8;
  float v9;
  float v10;
  float v11;
  unsigned __int8 v12;
  float v13;
  float v14;
  unsigned __int8 v15;
  float v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  unsigned __int8 v22;
  float v23;
  float v24;
  unsigned __int8 v25;
  int v26;

  v3 = *a2;
  v4 = *result;
  if (*(_DWORD *)a2 == *(_DWORD *)result)
  {
    v5 = a2[1];
    v6 = result[1];
    if (v5 == v6)
      v7 = 0;
    else
      v7 = -127;
    if (v5 > v6)
      v7 = 1;
    if (v5 < v6)
      v8 = -1;
    else
      v8 = v7;
  }
  else if (SLODWORD(v3) < SLODWORD(v4))
  {
    v8 = -1;
  }
  else
  {
    v8 = 1;
  }
  v9 = *a3;
  if (v8 == 129 || (v8 & 0x80) == 0)
  {
    if (LODWORD(v9) == LODWORD(v3))
    {
      v13 = a3[1];
      v14 = a2[1];
      if (v13 == v14)
        v15 = 0;
      else
        v15 = -127;
      if (v13 > v14)
        v15 = 1;
      if (v13 < v14)
        v15 = -1;
    }
    else if (SLODWORD(v9) < SLODWORD(v3))
    {
      v15 = -1;
    }
    else
    {
      v15 = 1;
    }
    if (v15 != 129 && (v15 & 0x80) != 0)
    {
      *a2 = v9;
      *a3 = v3;
      v17 = *((_DWORD *)a2 + 1);
      a2[1] = a3[1];
      *((_DWORD *)a3 + 1) = v17;
      v18 = *a2;
      v19 = *result;
      if (*(_DWORD *)a2 == *(_DWORD *)result)
      {
        v20 = a2[1];
        v21 = result[1];
        if (v20 == v21)
          v22 = 0;
        else
          v22 = -127;
        if (v20 > v21)
          v22 = 1;
        if (v20 < v21)
          v22 = -1;
      }
      else if (SLODWORD(v18) < SLODWORD(v19))
      {
        v22 = -1;
      }
      else
      {
        v22 = 1;
      }
      if (v22 != 129 && (v22 & 0x80) != 0)
      {
        *result = v18;
        *a2 = v19;
        v26 = *((_DWORD *)result + 1);
        result[1] = a2[1];
        *((_DWORD *)a2 + 1) = v26;
      }
    }
  }
  else
  {
    if (LODWORD(v9) == LODWORD(v3))
    {
      v10 = a3[1];
      v11 = a2[1];
      if (v10 == v11)
        v12 = 0;
      else
        v12 = -127;
      if (v10 > v11)
        v12 = 1;
      if (v10 < v11)
        v12 = -1;
    }
    else if (SLODWORD(v9) < SLODWORD(v3))
    {
      v12 = -1;
    }
    else
    {
      v12 = 1;
    }
    if (v12 != 129 && (v12 & 0x80) != 0)
    {
      *result = v9;
      *a3 = v4;
      v16 = result[1];
      result[1] = a3[1];
LABEL_70:
      a3[1] = v16;
      return result;
    }
    *result = v3;
    *a2 = v4;
    v16 = result[1];
    result[1] = a2[1];
    a2[1] = v16;
    v23 = *a3;
    if (*(_DWORD *)a3 == LODWORD(v4))
    {
      v24 = a3[1];
      if (v24 == v16)
        v25 = 0;
      else
        v25 = -127;
      if (v24 > v16)
        v25 = 1;
      if (v24 < v16)
        v25 = -1;
    }
    else if (SLODWORD(v23) < SLODWORD(v4))
    {
      v25 = -1;
    }
    else
    {
      v25 = 1;
    }
    if (v25 != 129 && (v25 & 0x80) != 0)
    {
      *a2 = v23;
      *a3 = v4;
      a2[1] = a3[1];
      goto LABEL_70;
    }
  }
  return result;
}

BOOL sub_100092CC4(float *a1, float *a2)
{
  uint64_t v4;
  _BOOL8 result;
  int v6;
  float v7;
  float v8;
  float v9;
  unsigned __int8 v10;
  float *v11;
  float *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  float v17;
  float v18;
  unsigned __int8 v19;
  float v20;
  uint64_t v21;
  _DWORD *v22;
  float v23;
  unsigned __int8 v24;
  uint64_t v25;
  int v26;

  v4 = ((char *)a2 - (char *)a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *((_DWORD *)a2 - 2);
      v7 = *a1;
      if (v6 == *(_DWORD *)a1)
      {
        v8 = *(a2 - 1);
        v9 = a1[1];
        if (v8 == v9)
          v10 = 0;
        else
          v10 = -127;
        if (v8 > v9)
          v10 = 1;
        if (v8 < v9)
          v10 = -1;
      }
      else if (v6 < SLODWORD(v7))
      {
        v10 = -1;
      }
      else
      {
        v10 = 1;
      }
      if (v10 != 129 && (v10 & 0x80) != 0)
      {
        *(_DWORD *)a1 = v6;
        *(a2 - 2) = v7;
        v26 = *((_DWORD *)a1 + 1);
        a1[1] = *(a2 - 1);
        *((_DWORD *)a2 - 1) = v26;
      }
      return result;
    case 3:
      sub_100092AF4(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      sub_100092EE4(a1, a1 + 2, a1 + 4, (uint64_t)(a2 - 2));
      return 1;
    case 5:
      sub_100093038(a1, a1 + 2, a1 + 4, (uint64_t)(a1 + 6), (int *)a2 - 2);
      return 1;
    default:
      v11 = a1 + 4;
      sub_100092AF4(a1, a1 + 2, a1 + 4);
      v12 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    v15 = *(_DWORD *)v12;
    v16 = *(_DWORD *)v11;
    if (*(_DWORD *)v12 == *(_DWORD *)v11)
    {
      v17 = v12[1];
      v18 = v11[1];
      if (v17 == v18)
        v19 = 0;
      else
        v19 = -127;
      if (v17 > v18)
        v19 = 1;
      if (v17 < v18)
        v19 = -1;
    }
    else
    {
      v19 = v15 < v16 ? -1 : 1;
    }
    if (v19 != 129 && (v19 & 0x80) != 0)
    {
      v20 = v12[1];
      v21 = v13;
      while (1)
      {
        v22 = (_DWORD *)((char *)a1 + v21);
        v22[6] = v16;
        v22[7] = *(_DWORD *)((char *)a1 + v21 + 20);
        if (v21 == -16)
          break;
        v16 = v22[2];
        if (v15 == v16)
        {
          v23 = *(float *)((char *)a1 + v21 + 12);
          if (v20 == v23)
            v24 = 0;
          else
            v24 = -127;
          if (v20 > v23)
            v24 = 1;
          if (v20 < v23)
            v24 = -1;
        }
        else if (v15 < v16)
        {
          v24 = -1;
        }
        else
        {
          v24 = 1;
        }
        v21 -= 8;
        if (v24 == 129 || (v24 & 0x80) == 0)
        {
          v25 = (uint64_t)a1 + v21 + 24;
          goto LABEL_42;
        }
      }
      v25 = (uint64_t)a1;
LABEL_42:
      *(_DWORD *)v25 = v15;
      *(float *)(v25 + 4) = v20;
      if (++v14 == 8)
        return v12 + 2 == a2;
    }
    v11 = v12;
    v13 += 8;
    v12 += 2;
    if (v12 == a2)
      return 1;
  }
}

float sub_100092EE4(float *a1, float *a2, float *a3, uint64_t a4)
{
  float result;
  int v9;
  float v10;
  float v11;
  unsigned __int8 v12;
  float v13;
  float v14;
  float v15;
  unsigned __int8 v16;
  float v17;
  float v18;
  float v19;
  unsigned __int8 v20;

  sub_100092AF4(a1, a2, a3);
  v9 = *(_DWORD *)a4;
  v10 = *a3;
  if (*(_DWORD *)a4 == *(_DWORD *)a3)
  {
    result = *(float *)(a4 + 4);
    v11 = a3[1];
    if (result == v11)
      v12 = 0;
    else
      v12 = -127;
    if (result > v11)
      v12 = 1;
    if (result < v11)
      v12 = -1;
  }
  else if (v9 < SLODWORD(v10))
  {
    v12 = -1;
  }
  else
  {
    v12 = 1;
  }
  if (v12 != 129 && (v12 & 0x80) != 0)
  {
    *(_DWORD *)a3 = v9;
    *(float *)a4 = v10;
    result = a3[1];
    a3[1] = *(float *)(a4 + 4);
    *(float *)(a4 + 4) = result;
    v13 = *a3;
    v14 = *a2;
    if (*(_DWORD *)a3 == *(_DWORD *)a2)
    {
      result = a3[1];
      v15 = a2[1];
      if (result == v15)
        v16 = 0;
      else
        v16 = -127;
      if (result > v15)
        v16 = 1;
      if (result < v15)
        v16 = -1;
    }
    else if (SLODWORD(v13) < SLODWORD(v14))
    {
      v16 = -1;
    }
    else
    {
      v16 = 1;
    }
    if (v16 != 129 && (v16 & 0x80) != 0)
    {
      *a2 = v13;
      *a3 = v14;
      result = a2[1];
      a2[1] = a3[1];
      a3[1] = result;
      v17 = *a2;
      v18 = *a1;
      if (*(_DWORD *)a2 == *(_DWORD *)a1)
      {
        result = a2[1];
        v19 = a1[1];
        if (result == v19)
          v20 = 0;
        else
          v20 = -127;
        if (result > v19)
          v20 = 1;
        if (result < v19)
          v20 = -1;
      }
      else if (SLODWORD(v17) < SLODWORD(v18))
      {
        v20 = -1;
      }
      else
      {
        v20 = 1;
      }
      if (v20 != 129 && (v20 & 0x80) != 0)
      {
        *a1 = v17;
        *a2 = v18;
        result = a1[1];
        a1[1] = a2[1];
        a2[1] = result;
      }
    }
  }
  return result;
}

float sub_100093038(float *a1, float *a2, float *a3, uint64_t a4, int *a5)
{
  float result;
  int v11;
  int v12;
  float v13;
  unsigned __int8 v14;
  int v15;
  float v16;
  float v17;
  unsigned __int8 v18;
  float v19;
  float v20;
  float v21;
  unsigned __int8 v22;
  float v23;
  float v24;
  float v25;
  unsigned __int8 v26;

  result = sub_100092EE4(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *(_DWORD *)a4;
  if (*a5 == *(_DWORD *)a4)
  {
    result = *((float *)a5 + 1);
    v13 = *(float *)(a4 + 4);
    if (result == v13)
      v14 = 0;
    else
      v14 = -127;
    if (result > v13)
      v14 = 1;
    if (result < v13)
      v14 = -1;
  }
  else if (v11 < v12)
  {
    v14 = -1;
  }
  else
  {
    v14 = 1;
  }
  if (v14 != 129 && (v14 & 0x80) != 0)
  {
    *(_DWORD *)a4 = v11;
    *a5 = v12;
    result = *(float *)(a4 + 4);
    *(_DWORD *)(a4 + 4) = a5[1];
    *((float *)a5 + 1) = result;
    v15 = *(_DWORD *)a4;
    v16 = *a3;
    if (*(_DWORD *)a4 == *(_DWORD *)a3)
    {
      result = *(float *)(a4 + 4);
      v17 = a3[1];
      if (result == v17)
        v18 = 0;
      else
        v18 = -127;
      if (result > v17)
        v18 = 1;
      if (result < v17)
        v18 = -1;
    }
    else if (v15 < SLODWORD(v16))
    {
      v18 = -1;
    }
    else
    {
      v18 = 1;
    }
    if (v18 != 129 && (v18 & 0x80) != 0)
    {
      *(_DWORD *)a3 = v15;
      *(float *)a4 = v16;
      result = a3[1];
      a3[1] = *(float *)(a4 + 4);
      *(float *)(a4 + 4) = result;
      v19 = *a3;
      v20 = *a2;
      if (*(_DWORD *)a3 == *(_DWORD *)a2)
      {
        result = a3[1];
        v21 = a2[1];
        if (result == v21)
          v22 = 0;
        else
          v22 = -127;
        if (result > v21)
          v22 = 1;
        if (result < v21)
          v22 = -1;
      }
      else if (SLODWORD(v19) < SLODWORD(v20))
      {
        v22 = -1;
      }
      else
      {
        v22 = 1;
      }
      if (v22 != 129 && (v22 & 0x80) != 0)
      {
        *a2 = v19;
        *a3 = v20;
        result = a2[1];
        a2[1] = a3[1];
        a3[1] = result;
        v23 = *a2;
        v24 = *a1;
        if (*(_DWORD *)a2 == *(_DWORD *)a1)
        {
          result = a2[1];
          v25 = a1[1];
          if (result == v25)
            v26 = 0;
          else
            v26 = -127;
          if (result > v25)
            v26 = 1;
          if (result < v25)
            v26 = -1;
        }
        else if (SLODWORD(v23) < SLODWORD(v24))
        {
          v26 = -1;
        }
        else
        {
          v26 = 1;
        }
        if (v26 != 129 && (v26 & 0x80) != 0)
        {
          *a1 = v23;
          *a2 = v24;
          result = a1[1];
          a1[1] = a2[1];
          a2[1] = result;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000931F8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000048FC();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t SASettings::instance(SASettings *this)
{
  SASettingsProd *v1;
  uint64_t result;

  v1 = (SASettingsProd *)sub_10003D044();
  if (!*((_BYTE *)v1 + 296))
    return SASettingsProd::instance(v1);
  result = SASettingsTest::fInstance;
  if (!SASettingsTest::fInstance)
    operator new();
  return result;
}

uint64_t SASettings::finalize(SASettings *this)
{
  uint64_t *v1;
  uint64_t result;

  if (*((_BYTE *)sub_10003D044() + 296))
    v1 = &SASettingsTest::fInstance;
  else
    v1 = &SASettingsProd::fInstance;
  result = *v1;
  if (*v1)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    *v1 = 0;
  }
  return result;
}

void SACoreRoutine::create(void *a1)
{
  a1;
  if (*((_BYTE *)sub_10003D044() + 240))
    sub_1000933D8();
  sub_100093634();
}

void sub_1000933BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1000933D8()
{
  operator new();
}

void sub_100093574(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  operator delete();
}

void sub_100093634()
{
  operator new();
}

void sub_1000937D0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  operator delete();
}

void sub_100093B4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100093D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1000940D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  sub_100004DBC((uint64_t)&a20);
  if (a18 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_100094234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_100094428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10009460C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10009478C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000948C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100094A9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100094AEC(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v5;
    v13 = 2113;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,userInfoDict\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }

}

void sub_100094BD4(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v5;
    v13 = 2113;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,metaDataDict\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }

}

void sub_100094D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100094E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_100094EBC(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t buf;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v22 = a2;
  v23 = a3;
  v5 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    buf = 68289795;
    v30 = 2082;
    v31 = "";
    v32 = 2113;
    v33 = v22;
    v34 = 2114;
    v35 = v23;
    v36 = 2081;
    v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,getRegisteredChannelsForTopicResult\", \"channels\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"topic\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x30u);
  }

  if (v23)
  {
    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v30 = 2082;
      v31 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,unableToFetchChannels\"}", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v22;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v13 = *(void **)(a1 + 40);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "channelID", v22));
          LOBYTE(v13) = objc_msgSend(v13, "isSubscribedChannel:", v14);

          v15 = (id)SALogObjectGeneral;
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if ((v13 & 1) != 0)
          {
            if (v16)
            {
              v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "channelID")));
              v18 = objc_msgSend(v17, "UTF8String");
              buf = 68289283;
              v30 = 2082;
              v31 = "";
              v32 = 2081;
              v33 = v18;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,isActive\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);

            }
          }
          else
          {
            if (v16)
            {
              v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "channelID")));
              v20 = objc_msgSend(v19, "UTF8String");
              buf = 68289283;
              v30 = 2082;
              v31 = "";
              v32 = 2081;
              v33 = v20;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,unsub\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);

            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "unsubscribeFromChannel:forTopic:", v12, *(_QWORD *)(a1 + 32));
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    v21 = *(_QWORD *)(a1 + 48);
    if (v21)
      (*(void (**)(void))(v21 + 16))();
  }

}

void sub_100095240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t SACloudChannelProd::SACloudChannelProd(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  SACloudChannelsInterface *v14;
  void *v15;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  _BYTE v20[24];
  _BYTE *v21;
  _BYTE v22[24];
  _BYTE *v23;

  v7 = a2;
  sub_100004F4C((uint64_t)v22, a3);
  sub_100004F4C((uint64_t)v20, a4);
  *(_QWORD *)a1 = off_1000F6A68;
  v8 = v21;
  if (v21 == v20)
  {
    v9 = 4;
    v8 = v20;
  }
  else
  {
    if (!v21)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  v10 = v23;
  if (v23 == v22)
  {
    v11 = 4;
    v10 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_11;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_11:
  *(_QWORD *)a1 = &off_1000F6980;
  v12 = v7;
  *(_QWORD *)(a1 + 8) = v12;
  *(_QWORD *)(a1 + 16) = 0;
  sub_100004F4C(a1 + 24, a3);
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v13 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 68289026;
    v17[1] = 0;
    v18 = 2082;
    v19 = "";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,SAChannelManager()\"}", (uint8_t *)v17, 0x12u);
  }
  v14 = -[SACloudChannelsInterface initWithQueue:isProduction:channelType:]([SACloudChannelsInterface alloc], "initWithQueue:isProduction:channelType:", *(_QWORD *)(a1 + 8), *((_BYTE *)sub_10003D044() + 26) == 0, 0);
  v15 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v14;

  objc_msgSend(*(id *)(a1 + 16), "setChannelProxy:", a1);
  return a1;
}

void sub_100095524(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1000955D0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v5;

  *(_QWORD *)a1 = &off_1000F6980;
  objc_msgSend(*(id *)(a1 + 16), "cleanup");
  v5 = (void **)(a1 + 56);
  sub_100004EC0(&v5);
  v2 = *(_QWORD **)(a1 + 48);
  if (v2 == (_QWORD *)(a1 + 24))
  {
    v3 = 4;
    v2 = (_QWORD *)(a1 + 24);
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }

  return a1;
}

void sub_100095664(uint64_t a1)
{
  sub_1000955D0(a1);
  operator delete();
}

const __CFString *sub_100095688(int a1)
{
  NSObject *v1;
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  if (a1 == 2)
  {
    v3 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe\"}", (uint8_t *)&v5, 0x12u);
    }
    return CFSTR("com.apple.aps.mantis.safetyalert");
  }
  else if (a1)
  {
    v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe,invalid type\"}", (uint8_t *)&v5, 0x12u);
    }
    return 0;
  }
  else
  {
    v1 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe,Alert\"}", (uint8_t *)&v5, 0x12u);
    }
    return CFSTR("com.apple.aps.locationd.safetyalert");
  }
}

void sub_100095818(uint64_t a1, uint64_t *a2)
{
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  uint64_t *v7;
  NSObject *v8;
  uint64_t *v9;
  int v10;
  uint64_t *v11;
  NSStringEncoding v12;
  uint64_t *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t *v22;

  v4 = sub_100095688(*((_DWORD *)a2 + 6));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0)
      v7 = a2;
    else
      v7 = (uint64_t *)*a2;
    v17 = 68289283;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2081;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribeRequest\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
  }
  if (sub_1000049AC(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), (unsigned __int8 **)a2) == *(_QWORD *)(a1 + 64))
  {
    v10 = *((char *)a2 + 23);
    v11 = (uint64_t *)*a2;
    v12 = +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding");
    if (v10 >= 0)
      v13 = a2;
    else
      v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, v12));
    objc_msgSend(*(id *)(a1 + 16), "subscribe:topic:", v14, v5);
    v15 = *(_QWORD *)(a1 + 64);
    if (v15 >= *(_QWORD *)(a1 + 72))
    {
      v16 = sub_100004ABC((uint64_t *)(a1 + 56), (__int128 *)a2);
    }
    else
    {
      sub_100004A60((_QWORD *)(a1 + 56), (__int128 *)a2);
      v16 = v15 + 24;
    }
    *(_QWORD *)(a1 + 64) = v16;

  }
  else
  {
    v8 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a2 + 23) >= 0)
        v9 = a2;
      else
        v9 = (uint64_t *)*a2;
      v17 = 68289283;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2081;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,AlreadySubscribed\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
    }
  }

}

void sub_100095A2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100095A50(uint64_t a1, uint64_t *a2)
{
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t *v9;
  NSStringEncoding v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned __int8 *v23;
  uint64_t v24;
  __int128 v25;
  NSObject *v26;
  unsigned __int8 *v27;
  int v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  unsigned __int8 *v33;

  v4 = sub_100095688(*((_DWORD *)a2 + 6));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0)
      v7 = (unsigned __int8 *)a2;
    else
      v7 = (unsigned __int8 *)*a2;
    v28 = 68289283;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2081;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,unsubscribeRequest\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v28, 0x1Cu);
  }
  if (sub_1000049AC(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), (unsigned __int8 **)a2) == *(_QWORD *)(a1 + 64))
  {
    v26 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a2 + 23) >= 0)
        v27 = (unsigned __int8 *)a2;
      else
        v27 = (unsigned __int8 *)*a2;
      v28 = 68289283;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2081;
      v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,NotSubscribed\", \"channel\":%{private, location:escape_only}s}", (uint8_t *)&v28, 0x1Cu);
    }
  }
  else
  {
    v8 = *((char *)a2 + 23);
    v9 = (uint64_t *)*a2;
    v10 = +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding");
    if (v8 >= 0)
      v11 = a2;
    else
      v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, v10));
    objc_msgSend(*(id *)(a1 + 16), "unsubscribe:topic:", v12, v5);
    v13 = *(_QWORD *)(a1 + 64);
    v14 = sub_1000049AC(*(_QWORD *)(a1 + 56), v13, (unsigned __int8 **)a2);
    if (v14 == v13)
    {
      v17 = v13;
    }
    else
    {
      v15 = v14;
      v16 = v14 + 24;
      if (v14 + 24 != v13)
      {
        v17 = v14;
        while (1)
        {
          v18 = v15;
          v15 = v16;
          v19 = *(unsigned __int8 *)(v18 + 47);
          if ((v19 & 0x80u) == 0)
            v20 = *(unsigned __int8 *)(v18 + 47);
          else
            v20 = *(_QWORD *)(v18 + 32);
          v21 = *((unsigned __int8 *)a2 + 23);
          v22 = (char)v21;
          if ((v21 & 0x80u) != 0)
            v21 = a2[1];
          if (v20 != v21)
            goto LABEL_29;
          if (v22 >= 0)
            v23 = (unsigned __int8 *)a2;
          else
            v23 = (unsigned __int8 *)*a2;
          if ((v19 & 0x80) != 0)
          {
            if (memcmp(*(const void **)v15, v23, *(_QWORD *)(v18 + 32)))
              goto LABEL_29;
          }
          else if (*(_BYTE *)(v18 + 47))
          {
            v24 = 0;
            while (*(unsigned __int8 *)(v15 + v24) == v23[v24])
            {
              if (v19 == ++v24)
                goto LABEL_32;
            }
LABEL_29:
            if (*(char *)(v17 + 23) < 0)
              operator delete(*(void **)v17);
            v25 = *(_OWORD *)v15;
            *(_QWORD *)(v17 + 16) = *(_QWORD *)(v15 + 16);
            *(_OWORD *)v17 = v25;
            v17 += 24;
            *(_BYTE *)(v18 + 47) = 0;
            *(_BYTE *)v15 = 0;
          }
LABEL_32:
          v16 = v15 + 24;
          if (v15 + 24 == v13)
            goto LABEL_41;
        }
      }
      v17 = v14;
    }
LABEL_41:
    sub_100041E98(a1 + 56, v17, *(__int128 **)(a1 + 64));

  }
}

void sub_100095D3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100095D64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch ,dict failure\"}", (uint8_t *)&v10, 0x12u);
    }
  }
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &stru_1000F69E0);
  if (*(_QWORD *)(a1 + 48))
  {
    v8 = a1 + 24;
    v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch ,fOnAlertCb\"}", (uint8_t *)&v10, 0x12u);
    }
    sub_100027F5C(v8, v5, v6);
  }

}

void sub_100095ED0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100095EEC(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v5;
    v13 = 2113;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,sendDictionary dict\", \"key\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }

}

void sub_100095FD4(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  uint64_t *v5;
  uint64_t *v6;
  NSObject *v7;
  uint64_t *v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _QWORD v14[2];

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 80);
    v4 = *(unsigned __int8 *)(a1 + 81);
    *(_DWORD *)buf = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 1026;
    LODWORD(v14[0]) = v3;
    WORD2(v14[0]) = 1026;
    *(_DWORD *)((char *)v14 + 6) = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,states\", \"fDidReceivePublicToken\":%{public}hhd, \"fDidReceiveToken\":%{public}hhd}", buf, 0x1Eu);
  }
  v5 = *(uint64_t **)(a1 + 56);
  v6 = *(uint64_t **)(a1 + 64);
  if (v5 != v6)
  {
    v7 = SALogObjectGeneral;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v5;
        if (*((char *)v5 + 23) < 0)
          v8 = (uint64_t *)*v5;
        *(_DWORD *)buf = 68289283;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        v13 = 2081;
        v14[0] = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,channels\", \"channel\":%{private, location:escape_only}s}", buf, 0x1Cu);
        v7 = SALogObjectGeneral;
      }
      v5 += 3;
    }
    while (v5 != v6);
  }
}

_QWORD *sub_100096160(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *result;
  uint64_t v4;
  _QWORD block[4];
  _BYTE v6[24];
  _BYTE *v7;

  v2 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100096224;
  block[3] = &unk_1000F6A00;
  sub_100004F4C((uint64_t)v6, a2);
  dispatch_async(v2, block);
  result = v7;
  if (v7 == v6)
  {
    v4 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

void sub_100096224(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[4];
  _BYTE v6[24];
  _BYTE *v7;

  v2 = objc_autoreleasePoolPush();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_100096350;
  v5[3] = &unk_1000F6A00;
  v3 = v6;
  sub_100004F4C((uint64_t)v6, a1 + 32);
  sub_100096350((uint64_t)v5);
  if (v7 == v6)
  {
    v4 = 4;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
    v3 = v7;
LABEL_5:
    (*(void (**)(_QWORD *))(*v3 + 8 * v4))(v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10009630C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17)
{
  _QWORD *v17;
  uint64_t v19;

  if (a17 == v17)
  {
    v19 = 4;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
    v17 = a17;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_100096350(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[3];
  void **v3;

  memset(v2, 0, sizeof(v2));
  v1 = *(_QWORD *)(a1 + 56);
  if (!v1)
    sub_100004FB0();
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v1 + 48))(v1, v2);
  v3 = (void **)v2;
  sub_100004EC0(&v3);
}

void sub_1000963A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  sub_100004EC0(&a12);
  _Unwind_Resume(a1);
}

uint64_t sub_1000963C4(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 32, a2 + 32);
}

_QWORD *sub_1000963D0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

id sub_100096404(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD *v3;
  id result;
  uint64_t v5;
  _QWORD v6[4];
  _BYTE v7[24];
  _BYTE *v8;

  v2 = *(void **)(a1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3321888768;
  v6[2] = sub_100096510;
  v6[3] = &unk_1000F1008;
  v3 = v7;
  sub_100004F4C((uint64_t)v7, a2);
  result = objc_msgSend(v2, "unsubcribeForgottenChannels:", v6);
  if (v8 == v7)
  {
    v5 = 4;
  }
  else
  {
    if (!v8)
      return result;
    v5 = 5;
    v3 = v8;
  }
  return (id)(*(uint64_t (**)(_QWORD *))(*v3 + 8 * v5))(v3);
}

void sub_1000964CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17)
{
  _QWORD *v17;
  uint64_t v19;

  if (a17 == v17)
  {
    v19 = 4;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
    v17 = a17;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t sub_100096510(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 56);
  if (!v1)
    sub_100004FB0();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
}

void sub_100096534(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2 = (std::__shared_weak_count *)a2[1];
  v8 = *a2;
  v9 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  sub_1000273E4(&v8);
  v5 = v9;
  if (v9)
  {
    v6 = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_1000965B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100028C54((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1000965C8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 81) = a2;
  return result;
}

uint64_t sub_1000965D0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 80) = a2;
  return result;
}

unint64_t sub_1000965D8(uint64_t a1)
{
  return 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 64) - *(_QWORD *)(a1 + 56)) >> 3);
}

uint64_t SASettingsProd::instance(SASettingsProd *this)
{
  uint64_t result;

  result = SASettingsProd::fInstance;
  if (!SASettingsProd::fInstance)
    operator new();
  return result;
}

void SASettingsProd::SASettingsProd(SASettingsProd *this)
{
  NSObject *v1;
  _DWORD v2[2];
  __int16 v3;
  const char *v4;

  *(_QWORD *)this = off_1000F6AD8;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_BYTE *)this + 32) = 0;
  v1 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 68289026;
    v2[1] = 0;
    v3 = 2082;
    v4 = "";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,initialized\"}", (uint8_t *)v2, 0x12u);
  }
}

uint64_t sub_100096704(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  int64x2_t v21;
  char *v22;
  char *v23;
  int64x2_t v24;
  char *v25;
  _QWORD *v26;

  v4 = a1[3];
  v5 = a1[2];
  if (v5 < v4)
  {
    result = sub_100004F4C(a1[2], a2);
    v7 = v5 + 32;
    a1[2] = v5 + 32;
    goto LABEL_24;
  }
  v8 = a1[1];
  v9 = (uint64_t)(v5 - v8) >> 5;
  if ((unint64_t)(v9 + 1) >> 59)
    sub_100004C50();
  v10 = v4 - v8;
  v11 = v10 >> 4;
  if (v10 >> 4 <= (unint64_t)(v9 + 1))
    v11 = v9 + 1;
  if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0)
    v12 = 0x7FFFFFFFFFFFFFFLL;
  else
    v12 = v11;
  v26 = a1 + 3;
  if (v12)
  {
    if (v12 >> 59)
      sub_100004984();
    v13 = (char *)operator new(32 * v12);
  }
  else
  {
    v13 = 0;
  }
  v23 = v13;
  v24.i64[0] = (uint64_t)&v13[32 * v9];
  v25 = &v13[32 * v12];
  sub_100004F4C(v24.i64[0], a2);
  v14 = (_QWORD *)v24.i64[0];
  v7 = v24.i64[0] + 32;
  v24.i64[1] = v24.i64[0] + 32;
  v16 = a1[1];
  v15 = a1[2];
  if (v15 != v16)
  {
    v17 = (_QWORD *)(v24.i64[0] - 8);
    while (1)
    {
      v18 = *(_QWORD *)(v15 - 8);
      v19 = v15 - 32;
      v20 = v17;
      if (v18)
      {
        if (v19 == v18)
        {
          *v17 = v17 - 3;
          (*(void (**)(_QWORD))(**(_QWORD **)(v15 - 8) + 24))(*(_QWORD *)(v15 - 8));
          goto LABEL_20;
        }
        *v17 = v18;
        v20 = (_QWORD *)(v15 - 8);
      }
      *v20 = 0;
LABEL_20:
      v17 -= 4;
      v15 = v19;
      if (v19 == v16)
      {
        v21 = *(int64x2_t *)(a1 + 1);
        v7 = v24.i64[1];
        v14 = v17 + 1;
        goto LABEL_23;
      }
    }
  }
  v21 = vdupq_n_s64(v15);
LABEL_23:
  a1[1] = v14;
  a1[2] = v7;
  v24 = v21;
  v22 = (char *)a1[3];
  a1[3] = v25;
  v25 = v22;
  v23 = (char *)v21.i64[0];
  result = sub_10009763C((uint64_t)&v23);
LABEL_24:
  a1[2] = v7;
  return result;
}

void sub_100096888(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_10009763C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000968AC(uint64_t a1)
{
  unsigned int v2;
  int v3;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1))
    v3 = 256;
  else
    v3 = 0;
  return v3 | v2;
}

BOOL sub_1000968F8()
{
  unsigned int v0;
  NSObject *v1;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;
  __int16 v6;
  _BOOL4 v7;

  v0 = +[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", CFSTR("/System/Library/PrivateFrameworks/WirelessDiagnostics.framework"));
  v1 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289283;
    v3[1] = 0;
    v4 = 2082;
    v5 = "";
    v6 = 1025;
    v7 = v0 == 3;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isIphoneAnalyticsEnabled\":%{private}hhd}", (uint8_t *)v3, 0x18u);
  }
  return v0 == 3;
}

BOOL sub_1000969DC()
{
  unsigned int v0;
  NSObject *v1;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;
  __int16 v6;
  _BOOL4 v7;

  v0 = +[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", CFSTR("/System/Library/LocationBundles/Routine.bundle"));
  v1 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289283;
    v3[1] = 0;
    v4 = 2082;
    v5 = "";
    v6 = 1025;
    v7 = v0 == 3;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isSignificantLocationEnabled\":%{private}hhd}", (uint8_t *)v3, 0x18u);
  }
  return v0 == 3;
}

uint64_t sub_100096AC0()
{
  void *v0;
  const void *v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("CellBroadcastSettingEmergency"), CFSTR("com.apple.commcenter.shared"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    v1 = v0;
    v2 = (uint64_t)objc_msgSend(v0, "BOOLValue");
    CFRelease(v1);
  }
  else
  {
    v2 = 1;
  }
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isEmergencyAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

id sub_100096BCC()
{
  void *v0;
  const void *v1;
  id v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("CellBroadcastSettingAMBER"), CFSTR("com.apple.commcenter.shared"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, "BOOLValue");
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = (int)v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isAmberAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

uint64_t sub_100096CD8()
{
  void *v0;
  const void *v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("CellBroadcastSettingPublicSafety"), CFSTR("com.apple.commcenter.shared"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    v1 = v0;
    v2 = (uint64_t)objc_msgSend(v0, "BOOLValue");
    CFRelease(v1);
  }
  else
  {
    v2 = 1;
  }
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isPublicSafetyAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

uint64_t sub_100096DE4()
{
  void *v0;
  const void *v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("CellBroadcastSettingNational"), CFSTR("com.apple.commcenter.shared"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    v1 = v0;
    v2 = (uint64_t)objc_msgSend(v0, "BOOLValue");
    CFRelease(v1);
  }
  else
  {
    v2 = 1;
  }
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isNationalAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

id sub_100096EF0()
{
  void *v0;
  const void *v1;
  id v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("CellBroadcastSettingWeaTest"), CFSTR("com.apple.commcenter.shared"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, "BOOLValue");
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = (int)v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isTestAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

uint64_t sub_100096FFC()
{
  void *v0;
  const void *v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("CellBroadcastSettingIgneous"), CFSTR("com.apple.commcenter.shared"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v0)
  {
    v1 = v0;
    v2 = (uint64_t)objc_msgSend(v0, "BOOLValue");
    CFRelease(v1);
  }
  else
  {
    v2 = 1;
  }
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1025;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"isIgneousAlertEnabled\":%{private}hhd}", (uint8_t *)v5, 0x18u);
  }
  return v2;
}

BOOL sub_100097108(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  _BOOL8 v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,isBluetoothEnabled\"}", buf, 0x12u);
  }
  v3 = objc_alloc_init((Class)CBController);
  v4 = v3;
  if (v3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100097314;
    v10[3] = &unk_1000F6B48;
    v10[4] = a1;
    objc_msgSend(v3, "getControllerInfoWithCompletion:", v10);
    v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(a1 + 32);
      *(_DWORD *)buf = 68289283;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 1025;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd\", \"fIsBluetoothStateCached\":%{private}hhd}", buf, 0x18u);
    }
    v7 = *(_BYTE *)(a1 + 32) != 0;
  }
  else
  {
    v8 = SALogObjectGeneral;
    v7 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,isBluetoothEnabled invalid controller\"}", buf, 0x12u);
      v7 = 0;
    }
  }

  return v7;
}

void sub_1000972FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100097314(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = v6;
      v8 = "{\"msg%{public}.0s\":\"#saSettingsProd,BTController failed:\", \"inError\":%{private, location:escape_only}@}";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v15, v11);
    }
  }
  else if (v5)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = objc_msgSend(v5, "bluetoothState");
    *(_BYTE *)(v12 + 32) = v13 == (id)5;
    v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 1025;
      LODWORD(v20) = v13 == (id)5;
      v8 = "{\"msg%{public}.0s\":\"#saSettingsProd,cb\", \"fIsBluetoothStateCached\":%{private}hhd}";
      v9 = v14;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 24;
      goto LABEL_7;
    }
  }

}

void sub_100097494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000974AC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  _DWORD *v10;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,settings updated\"}", (uint8_t *)v7, 0x12u);
  }
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  while (v3 != v4)
  {
    sub_100004F4C((uint64_t)v7, v3);
    if (!v10)
      sub_100004FB0();
    (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 48))(v10);
    v5 = v10;
    if (v10 == v7)
    {
      v5 = v7;
      v6 = 4;
    }
    else
    {
      if (!v10)
        goto LABEL_11;
      v6 = 5;
    }
    (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_11:
    v3 += 32;
  }
}

void sub_1000975CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12)
{
  uint64_t *v13;
  uint64_t v14;

  v13 = a12;
  if (a12 == &a9)
  {
    v14 = 4;
    v13 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v14 = 5;
  }
  (*(void (**)(void))(*v13 + 8 * v14))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_100097618(_QWORD *a1)
{
  sub_1000976B8(a1);
  operator delete();
}

uint64_t sub_10009763C(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;

  v3 = *(_QWORD **)(a1 + 8);
  v2 = *(_QWORD **)(a1 + 16);
  if (v2 != v3)
  {
    while (1)
    {
      v4 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      v5 = (_QWORD *)*(v2 - 1);
      if (v5 == v4)
        break;
      if (v5)
      {
        v4 = v5;
        v6 = 5;
LABEL_6:
        (*(void (**)(void))(*v4 + 8 * v6))();
        v4 = *(_QWORD **)(a1 + 16);
      }
      v2 = v4;
      if (v4 == v3)
        goto LABEL_8;
    }
    v6 = 4;
    goto LABEL_6;
  }
LABEL_8:
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *sub_1000976B8(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;

  *a1 = off_1000F6AD8;
  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289026;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saSettingsProd,released\"}", (uint8_t *)v10, 0x12u);
  }
  v3 = a1[1];
  if (!v3)
    return a1;
  v4 = a1[2];
  v5 = (void *)a1[1];
  if (v4 == v3)
    goto LABEL_12;
  do
  {
    v6 = v4 - 32;
    v7 = *(_QWORD **)(v4 - 8);
    if ((_QWORD *)(v4 - 32) == v7)
    {
      v7 = (_QWORD *)(v4 - 32);
      v8 = 4;
    }
    else
    {
      if (!v7)
        goto LABEL_10;
      v8 = 5;
    }
    (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_10:
    v4 = v6;
  }
  while (v6 != v3);
  v5 = (void *)a1[1];
LABEL_12:
  a1[2] = v3;
  operator delete(v5);
  return a1;
}

void sub_100097918(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100097B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100097BA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SANetworkReachabilityProd::SANetworkReachabilityProd(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[4];
  _QWORD v10[3];
  _QWORD *v11;

  v6 = a2;
  sub_100004F4C((uint64_t)v10, a4);
  *a1 = off_1000F6BF0;
  if (!v11)
  {
    a1[4] = 0;
    goto LABEL_11;
  }
  if (v11 == v10)
  {
    a1[4] = a1 + 1;
    (*(void (**)(_QWORD *, _QWORD *))(v10[0] + 24))(v10, a1 + 1);
  }
  else
  {
    a1[4] = (*(uint64_t (**)(void))(*v11 + 16))();
  }
  v7 = v11;
  if (v11 == v10)
  {
    v8 = 4;
    v7 = v10;
  }
  else
  {
    if (!v11)
      goto LABEL_11;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_11:
  *a1 = off_1000F6BA0;
  a1[5] = 0;
  v9[0] = off_1000F6C18;
  v9[1] = a1;
  v9[3] = v9;
  sub_10006DCE8((uint64_t)(a1 + 6), v6, 60.0);
}

void sub_100097E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char *a25)
{
  void *v25;
  char *v27;
  uint64_t v28;

  v27 = a25;
  if (a25 == &a22)
  {
    v28 = 4;
    v27 = &a22;
  }
  else
  {
    if (!a25)
      goto LABEL_6;
    v28 = 5;
  }
  (*(void (**)(char *))(*(_QWORD *)v27 + 8 * v28))(v27);
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_100097EF4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_autoreleasePoolPush();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100097F74;
  v4[3] = &unk_1000F6468;
  v4[4] = v2;
  v5 = *(_BYTE *)(a1 + 40);
  sub_100097F74((uint64_t)v4);
  objc_autoreleasePoolPop(v3);
}

void sub_100097F74(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 68289282;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1026;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,setValueImmediate\", \"isConnected\":%{public}hhd}", (uint8_t *)v5, 0x18u);
  }
  sub_10006DA74((unsigned __int8 *)(v2 + 48), (unsigned __int8 *)(a1 + 40), 0.0);
}

uint64_t sub_100098054(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)a1 = off_1000F6BA0;
  sub_10006DDD8(a1 + 48);

  *(_QWORD *)a1 = off_1000F6BF0;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2 == (_QWORD *)(a1 + 8))
  {
    v3 = 4;
    v2 = (_QWORD *)(a1 + 8);
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

void sub_1000980D0(uint64_t a1)
{
  sub_100098054(a1);
  operator delete();
}

void sub_1000980F4(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2 = (std::__shared_weak_count *)a2[1];
  v8 = *a2;
  v9 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  sub_1000273E4(&v8);
  v5 = v9;
  if (v9)
  {
    v6 = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_100098174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100028C54((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_10009818C()
{
  operator delete();
}

_QWORD *sub_1000981A0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = off_1000F6C18;
  result[1] = v3;
  return result;
}

uint64_t sub_1000981D4(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = off_1000F6C18;
  a2[1] = v2;
  return result;
}

uint64_t sub_1000981F0(uint64_t a1, unsigned __int8 *a2)
{
  int v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;

  v2 = *a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_DWORD *)(v3 + 120);
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 1026;
    v11 = v4;
    v12 = 1026;
    v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,onNetworkReachabilityChangedCb\", \"type\":%{public}d, \"isConnected\":%{public}hhd}", (uint8_t *)v7, 0x1Eu);
  }
  return sub_100082B20(v3 + 8, v4, v2 != 0);
}

uint64_t sub_1000982E0(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_10009831C()
{
}

_QWORD *SATimerProd::SATimerProd(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *__p[2];
  uint64_t v8;

  v5 = a2;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_100004870(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3;
    v8 = *(_QWORD *)(a3 + 16);
  }
  *a1 = off_1000F6D30;
  if (SHIBYTE(v8) < 0)
    operator delete(__p[0]);
  *a1 = off_1000F6C98;
  a1[1] = 0;
  a1[2] = v5;
  a1[3] = 0;
  return a1;
}

void sub_1000983B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SATimerProd::start(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  dispatch_source_t v9;
  dispatch_object_t *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[4];
  _BYTE v21[24];
  _BYTE *v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = SALogObjectGeneral;
  v8 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 68289026;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Timer already running\"}", buf, 0x12u);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 68289282;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 1026;
      v28 = (int)a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting timer\", \"duration\":%{public}d}", buf, 0x18u);
    }
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(a1 + 16));
    v11 = *(void **)(a1 + 8);
    v10 = (dispatch_object_t *)(a1 + 8);
    *v10 = v9;

    v12 = *v10;
    v13 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v14 = *v10;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3321888768;
    v20[2] = sub_1000985DC;
    v20[3] = &unk_1000F1008;
    sub_100004F4C((uint64_t)v21, a2);
    dispatch_source_set_event_handler(v14, v20);
    dispatch_resume(*v10);
    v18 = v22;
    if (v22 == v21)
    {
      v19 = 4;
      v18 = v21;
    }
    else
    {
      if (!v22)
        return;
      v19 = 5;
    }
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*v18 + 8 * v19))(v18, v15, v16, v17);
  }
}

uint64_t sub_1000985DC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 56);
  if (!v1)
    sub_100004FB0();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
}

void SATimerProd::startRepeated(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, double a5)
{
  NSObject *v5;
  NSObject *v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD handler[5];
  _BYTE v19[24];
  _BYTE *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;

  if (*(_QWORD *)(a1 + 8))
  {
    v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Timer already running\"}", buf, 0x12u);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = a4;
    v10 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 1026;
      v26 = (int)a5;
      v27 = 1026;
      v28 = a2;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting timer\", \"durationSeconds\":%{public}d, \"intervalSeconds\":%{public}d}", buf, 0x1Eu);
    }
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(a1 + 16));
    v12 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v11;

    v13 = *(NSObject **)(a1 + 8);
    v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(a5 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 1000000000 * a2, 0x1DCD6500uLL);
    v15 = *(NSObject **)(a1 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3321888768;
    handler[2] = sub_100098854;
    handler[3] = &unk_1000F6CC8;
    handler[4] = a1;
    sub_100004F4C((uint64_t)v19, a3);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 8));
    v16 = v20;
    if (v20 == v19)
    {
      v17 = 4;
      v16 = v19;
    }
    else
    {
      if (!v20)
        return;
      v17 = 5;
    }
    (*(void (**)(void))(*v16 + 8 * v17))();
  }
}

uint64_t sub_100098854(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v1 = *(_QWORD *)(a1 + 64);
  if (!v1)
    sub_100004FB0();
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v1 + 48))(v1, &v3);
}

uint64_t sub_100098894(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 40, a2 + 40);
}

_QWORD *sub_1000988A0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void SATimerProd::stopTimer(dispatch_source_t *this)
{
  dispatch_source_set_timer(this[1], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
}

void SATimerProd::cancel(SATimerProd *this)
{
  NSObject *v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;

  v2 = *((_QWORD *)this + 1);
  v3 = SALogObjectGeneral;
  v4 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Cancelling timer\"}", (uint8_t *)&v6, 0x12u);
      v2 = *((_QWORD *)this + 1);
    }
    dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    v5 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = 0;

  }
  else if (v4)
  {
    v6 = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"No timer to cancel\"}", (uint8_t *)&v6, 0x12u);
  }
}

void sub_100098A2C(id *a1)
{
  sub_100098A58(a1);
  operator delete();
}

id *sub_100098A58(id *a1)
{
  *a1 = off_1000F6C98;
  SATimerProd::cancel((SATimerProd *)a1);

  return a1;
}

void sub_100098A98(_QWORD *a1, unint64_t a2)
{
  id v2;

  if (a2 >= 7)
  {
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MAAssetState%llu"), a2)));
    objc_msgSend(v2, "UTF8String");

    __break(1u);
  }
  else
  {
    sub_10000E8A0(a1, off_1000F6FC8[a2]);
  }
}

void sub_100098AFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100098B0C(_QWORD *a1, uint64_t a2)
{
  char *v3;
  id v4;

  switch(a2)
  {
    case 0:
      v3 = "MADownloadSuccessful";
      goto LABEL_79;
    case 1:
      v3 = "MADownloadXpcError";
      goto LABEL_79;
    case 2:
      v3 = "MADownloadConnectionInterrupted";
      goto LABEL_79;
    case 3:
      v3 = "MADownloadFailed";
      goto LABEL_79;
    case 4:
      v3 = "MADownloadStagingFailed";
      goto LABEL_79;
    case 5:
      v3 = "MADownloadMetaDataProcessFailed";
      goto LABEL_79;
    case 6:
      v3 = "MADownloadUnzipFailed";
      goto LABEL_79;
    case 7:
      v3 = "MADownloadMoveFailed";
      goto LABEL_79;
    case 8:
      v3 = "MADownloadInstallFailed";
      goto LABEL_79;
    case 9:
      v3 = "MADownloadDaemonExit";
      goto LABEL_79;
    case 10:
      v3 = "MADownloadAssetAlreadyInstalled";
      goto LABEL_79;
    case 11:
      v3 = "MADownloadInvalidSZExtractor";
      goto LABEL_79;
    case 12:
      v3 = "MADownloadNotEntitled";
      goto LABEL_79;
    case 13:
      v3 = "MADownloadDaemonNotReady";
      goto LABEL_79;
    case 14:
      v3 = "MADownloadNoChange";
      goto LABEL_79;
    case 15:
      v3 = "MADownloadNotApplicableForRequireByOs";
      goto LABEL_79;
    case 16:
      v3 = "MADownloadNoExtractorFailure";
      goto LABEL_79;
    case 17:
      v3 = "MADownloadTransformFailure";
      goto LABEL_79;
    case 18:
      v3 = "MADownloadNoMatchFound";
      goto LABEL_79;
    case 19:
      v3 = "MADownloadNilAssetType";
      goto LABEL_79;
    case 20:
      v3 = "MADownloadNilAssetId";
      goto LABEL_79;
    case 21:
      v3 = "MADownloadStreamingZipNotSupported";
      goto LABEL_79;
    case 22:
      v3 = "MADownloadBadOptions";
      goto LABEL_79;
    case 23:
      v3 = "MADownloadAssetBadMetaData";
      goto LABEL_79;
    case 24:
      v3 = "MADownloadUnableToCreateMessage";
      goto LABEL_79;
    case 25:
      v3 = "MADownloadFailedNoStandardUrl";
      goto LABEL_79;
    case 26:
      v3 = "MADownloadFailedNoFallBackUrl";
      goto LABEL_79;
    case 27:
      v3 = "MADownloadFailedNoPallasUrl";
      goto LABEL_79;
    case 28:
      v3 = "MADownloadLostTask";
      goto LABEL_79;
    case 29:
      v3 = "MADownloadNotApplicableForInstalledWithOs";
      goto LABEL_79;
    case 30:
      v3 = "MADownloadNoValidSession";
      goto LABEL_79;
    case 31:
      v3 = "MADownloadResponseDeferred";
      goto LABEL_79;
    case 32:
      v3 = "MADownloadIncomplete";
      goto LABEL_79;
    case 33:
      v3 = "MADownloadNoStagingDir";
      goto LABEL_79;
    case 34:
      v3 = "MADownloadNotAllowed";
      goto LABEL_79;
    case 35:
      v3 = "MADownloadUnknownResult";
      goto LABEL_79;
    case 36:
      v3 = "MADownloadAssetNoLongerInCatalog";
      goto LABEL_79;
    case 37:
      v3 = "MADownloadNoSpaceLeft";
      goto LABEL_79;
    case 38:
      v3 = "MADownloadCouldNotReplace";
      goto LABEL_79;
    case 39:
      v3 = "MADownloadMalformedAssetType";
      goto LABEL_79;
    case 40:
      v3 = "MADownloadServerBadRequest";
      goto LABEL_79;
    case 41:
      v3 = "MADownloadServerAuthFailure";
      goto LABEL_79;
    case 42:
      v3 = "MADownloadServerError";
      goto LABEL_79;
    case 43:
      v3 = "MADownloadNotFoundOrDenied";
      goto LABEL_79;
    case 44:
      v3 = "MADownloadNotFound";
      goto LABEL_79;
    case 45:
      v3 = "MADownloadServerInternalError";
      goto LABEL_79;
    case 46:
      v3 = "MADownloadMalformedAssetData";
      goto LABEL_79;
    case 47:
      v3 = "MADownloadNetworkingError";
      goto LABEL_79;
    case 48:
      v3 = "MADownloadCancelled";
      goto LABEL_79;
    case 49:
      v3 = "MADownloadBadUrl";
      goto LABEL_79;
    case 50:
      v3 = "MADownloadBadServerResponse";
      goto LABEL_79;
    case 51:
      v3 = "MADownloadTimedOut";
      goto LABEL_79;
    case 52:
      v3 = "MADownloadTimedOutRequest";
      goto LABEL_79;
    case 53:
      v3 = "MADownloadTimedOutResource";
      goto LABEL_79;
    case 54:
      v3 = "MADownloadTimedOutWatchdog";
      goto LABEL_79;
    case 55:
      v3 = "MADownloadTimedOutStart";
      goto LABEL_79;
    case 56:
      v3 = "MADownloadTimedOutConnection";
      goto LABEL_79;
    case 57:
      v3 = "MADownloadCannotLoadFromNetwork";
      goto LABEL_79;
    case 58:
      v3 = "MADownloadUnsupportedURL";
      goto LABEL_79;
    case 59:
      v3 = "MADownloadCannotFindHost";
      goto LABEL_79;
    case 60:
      v3 = "MADownloadCannotConnectToHost";
      goto LABEL_79;
    case 61:
      v3 = "MADownloadNetworkConnectionLost";
      goto LABEL_79;
    case 62:
      v3 = "MADownloadDNSLookupFailed";
      goto LABEL_79;
    case 63:
      v3 = "MADownloadHTTPTooManyRedirects";
      goto LABEL_79;
    case 64:
      v3 = "MADownloadResourceUnavailable";
      goto LABEL_79;
    case 65:
      v3 = "MADownloadNotConnectedToInternet";
      goto LABEL_79;
    case 66:
      v3 = "MADownloadRedirectToNonExistentLocation";
      goto LABEL_79;
    case 67:
      v3 = "MADownloadInternationalRoamingOff";
      goto LABEL_79;
    case 68:
      v3 = "MADownloadCallIsActive";
      goto LABEL_79;
    case 69:
      v3 = "MADownloadDataNotAllowed";
      goto LABEL_79;
    case 70:
      v3 = "MADownloadSecureConnectionFailed";
      goto LABEL_79;
    case 71:
      v3 = "MADownloadInvalidReceipts";
      goto LABEL_79;
    case 72:
      v3 = "MADownloadFailedNoFallbackAllowed";
      goto LABEL_79;
    case 73:
      v3 = "MADownloadLiveServerDisabledNoFallback";
      goto LABEL_79;
    case 74:
      v3 = "MADownloadMalformedPurpose";
      goto LABEL_79;
    case 75:
      v3 = "MADownloadSSOFailure";
LABEL_79:
      sub_10000E8A0(a1, v3);
      break;
    default:
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MADownloadResult%llu"), a2)));
      sub_10000E8A0(a1, (char *)objc_msgSend(v4, "UTF8String"));

      break;
  }
}

void sub_100098F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t SAMobileAssetProdHelper::SAMobileAssetProdHelper(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  v4 = objc_alloc_init((Class)MADownloadOptions);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;

  objc_msgSend(*(id *)(a1 + 8), "setDiscretionary:", 0);
  objc_msgSend(*(id *)(a1 + 8), "setAllowsCellularAccess:", 1);
  objc_msgSend(*(id *)(a1 + 8), "setAllowsExpensiveAccess:", 1);
  objc_msgSend(*(id *)(a1 + 8), "setRequiresPowerPluggedIn:", 0);
  objc_msgSend(*(id *)(a1 + 8), "setTimeoutIntervalForResource:", 10000);
  objc_msgSend(*(id *)(a1 + 8), "setLiveServerCatalogOnly:", 0);
  objc_msgSend(*(id *)(a1 + 8), "setLiveServerCatalogOnlyIsOverridden:", 1);

  return a1;
}

void sub_100098FF0(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void SAMobileAssetProdHelper::query(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;

  v4 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.SafetyAlertsConfig"));
  objc_msgSend(v4, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v4, "returnTypes:", 2);
  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("Component"), CFSTR("SafetyAlertsConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), 2));
  objc_msgSend(v4, "addKeyValuePair:with:", ASAttributeCompatibilityVersion, v5);

  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("DeviceType"), CFSTR("iPhone"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_10009920C;
  v9[3] = &unk_1000F6DA0;
  v11 = a1;
  v6 = v12;
  sub_100004F4C((uint64_t)v12, a2);
  v7 = v4;
  v10 = v7;
  objc_msgSend(v7, "queryMetaData:", v9);

  if (v13 == v12)
  {
    v8 = 4;
    goto LABEL_5;
  }
  if (v13)
  {
    v8 = 5;
    v6 = v13;
LABEL_5:
    (*(void (**)(_QWORD *))(*v6 + 8 * v8))(v6);
  }

}

void sub_1000991A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19)
{
  void *v19;
  _QWORD *v20;
  uint64_t v22;

  if (a19 == v20)
  {
    v22 = 4;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v22 = 5;
    v20 = a19;
  }
  (*(void (**)(_QWORD *))(*v20 + 8 * v22))(v20);
LABEL_6:

  _Unwind_Resume(a1);
}

_QWORD *sub_10009920C(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD *result;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  _BYTE v9[24];
  _BYTE *v10;
  uint64_t v11;

  v4 = **(NSObject ***)(a1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100099300;
  block[3] = &unk_1000F6D68;
  sub_100004F4C((uint64_t)v9, a1 + 48);
  v11 = a2;
  v8 = *(id *)(a1 + 32);
  dispatch_async(v4, block);

  result = v10;
  if (v10 == v9)
  {
    v6 = 4;
    result = v9;
  }
  else
  {
    if (!v10)
      return result;
    v6 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v6))();
}

void sub_100099300(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _BYTE v7[24];
  _BYTE *v8;
  uint64_t v9;

  v2 = objc_autoreleasePoolPush();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_10009944C;
  v5[3] = &unk_1000F6D68;
  v3 = v7;
  sub_100004F4C((uint64_t)v7, a1 + 40);
  v9 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 32);
  sub_10009944C((uint64_t)v5);

  if (v8 == v7)
  {
    v4 = 4;
    goto LABEL_5;
  }
  if (v8)
  {
    v4 = 5;
    v3 = v8;
LABEL_5:
    (*(void (**)(_QWORD *))(*v3 + 8 * v4))(v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_100099400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, _QWORD *a18)
{
  _QWORD *v18;
  uint64_t v20;

  if (a18 == v18)
  {
    v20 = 4;
  }
  else
  {
    if (!a18)
      goto LABEL_6;
    v20 = 5;
    v18 = a18;
  }
  (*(void (**)(_QWORD *))(*v18 + 8 * v20))(v18);
LABEL_6:
  _Unwind_Resume(a1);
}

void sub_10009944C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "results"));
  v7 = v2;
  v5 = v3;
  v6 = v5;
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    sub_100004FB0();
  (*(void (**)(uint64_t, uint64_t *, id *))(*(_QWORD *)v4 + 48))(v4, &v7, &v6);

}

void sub_1000994BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, void *a11)
{

  _Unwind_Resume(a1);
}

uint64_t sub_1000994D8(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 40, a2 + 40);
}

_QWORD *sub_1000994E4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t sub_100099518(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 48, a2 + 48);
}

_QWORD *sub_100099524(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t (***SAMobileAssetProdHelper::download(uint64_t a1, uint64_t a2))()
{
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t (***result)();
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t (**v15)();
  _QWORD *v16;
  uint64_t (***v17)();
  uint8_t buf[8];
  __int128 v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD *v23;

  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v19) = 2082;
    *(_QWORD *)((char *)&v19 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,download\"}", buf, 0x12u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3321888768;
  v12[2] = sub_100099830;
  v12[3] = &unk_1000F6E38;
  v12[4] = a1;
  v5 = v13;
  sub_100004F4C((uint64_t)v13, a2);
  v15 = off_1000F1E38;
  v16 = objc_retainBlock(v12);
  v17 = &v15;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&v19 = 3321888768;
  *((_QWORD *)&v19 + 1) = sub_10009B934;
  v20 = &unk_1000F6E98;
  v7 = v22;
  v23 = v22;
  v21 = a1;
  v22[0] = off_1000F1E38;
  v22[1] = objc_retainBlock(v16);
  +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.SafetyAlertsConfig"), v6, buf);
  if (v23 == v22)
  {
    v8 = 4;
  }
  else
  {
    if (!v23)
      goto LABEL_8;
    v8 = 5;
    v7 = v23;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v8))(v7);
LABEL_8:
  result = v17;
  if (v17 == &v15)
  {
    v10 = 4;
    result = &v15;
  }
  else
  {
    if (!v17)
      goto LABEL_13;
    v10 = 5;
  }
  result = (uint64_t (***)())(*result)[v10]();
LABEL_13:
  if (v14 == v13)
  {
    v11 = 4;
  }
  else
  {
    if (!v14)
      return result;
    v11 = 5;
    v5 = v14;
  }
  return (uint64_t (***)())(*(uint64_t (**)(_QWORD *))(*v5 + 8 * v11))(v5);
}

void sub_10009978C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _QWORD *a18, char a19, uint64_t a20,uint64_t a21,char *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,_QWORD *a31)
{
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;

  if (a31 == v32)
  {
    v34 = 4;
  }
  else
  {
    if (!a31)
      goto LABEL_6;
    v34 = 5;
    v32 = a31;
  }
  (*(void (**)(_QWORD *))(*v32 + 8 * v34))(v32);
LABEL_6:
  v35 = a22;
  if (a22 == &a19)
  {
    v36 = 4;
    v35 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_11;
    v36 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v35 + 8 * v36))();
LABEL_11:
  if (a18 == v31)
  {
    v37 = 4;
  }
  else
  {
    if (!a18)
      goto LABEL_16;
    v37 = 5;
    v31 = a18;
  }
  (*(void (**)(_QWORD *))(*v31 + 8 * v37))(v31);
LABEL_16:
  _Unwind_Resume(exception_object);
}

void sub_100099830(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[5];
  _BYTE v15[24];
  _BYTE *v16;
  _QWORD v17[3];
  _QWORD *v18;
  const __CFString *v19;
  void *v20;
  uint64_t buf;
  __int16 v22;
  const char *v23;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v22 = 2082;
    v23 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadCatalogCb\"}", (uint8_t *)&buf, 0x12u);
  }
  v19 = CFSTR("status");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2 ^ 1u));
  v20 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  v8 = sub_10004D658();
  sub_10004E620((uint64_t)v8, 0, v7);
  if ((a2 & 1) == 0)
  {
    v12 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v22 = 2082;
      v23 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadCatalog,failed\"}", (uint8_t *)&buf, 0x12u);
    }
    *(_QWORD *)(v4 + 24) = 0;
    sub_100099B44(a1 + 40, 0);
    goto LABEL_17;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3321888768;
  v14[2] = sub_100099BAC;
  v14[3] = &unk_1000F6E08;
  v14[4] = v4;
  v9 = v15;
  sub_100004F4C((uint64_t)v15, a1 + 40);
  v17[0] = off_1000F6F48;
  v17[1] = objc_retainBlock(v14);
  v18 = v17;
  SAMobileAssetProdHelper::query(v4, (uint64_t)v17);
  v10 = v18;
  if (v18 == v17)
  {
    v11 = 4;
    v10 = v17;
    goto LABEL_11;
  }
  if (v18)
  {
    v11 = 5;
LABEL_11:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  if (v16 == v15)
  {
    v13 = 4;
    goto LABEL_16;
  }
  if (v16)
  {
    v13 = 5;
    v9 = v16;
LABEL_16:
    (*(void (**)(_QWORD *))(*v9 + 8 * v13))(v9);
  }
LABEL_17:

}

void sub_100099AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _QWORD *a18, char a19, uint64_t a20,uint64_t a21,char *a22)
{
  void *v22;
  _QWORD *v23;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v25 = a22;
  if (a22 == &a19)
  {
    v26 = 4;
    v25 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_6;
    v26 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v25 + 8 * v26))();
LABEL_6:
  if (a18 == v23)
  {
    v27 = 4;
  }
  else
  {
    if (!a18)
      goto LABEL_11;
    v27 = 5;
    v23 = a18;
  }
  (*(void (**)(_QWORD *))(*v23 + 8 * v27))(v23);
LABEL_11:

  _Unwind_Resume(a1);
}

void sub_100099B44(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    sub_100004FB0();
  (*(void (**)(uint64_t, id *))(*(_QWORD *)v3 + 48))(v3, &v4);

}

void sub_100099B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_100099BAC(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void **v9;
  uint64_t v10;
  id HighestVersion;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  void *v18;
  void **v19;
  int v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  void **v26;
  int v27;
  int v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  _BOOL4 v33;
  const char *v34;
  void *v35;
  int v36;
  void **v37;
  int v38;
  void *v39;
  const char *v40;
  id v41;
  _QWORD *v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v55;
  void *v56[2];
  char v57;
  void *v58[2];
  char v59;
  void *__p[2];
  char v61;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  _BYTE v65[24];
  _BYTE *v66;
  _QWORD v67[3];
  _QWORD *v68;
  uint8_t buf[8];
  _BYTE v70[32];
  void **v71;
  uint64_t v72;
  const char *v73;
  uint64_t *v74;

  v5 = buf;
  v55 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 0xE)
    {
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MAQueryResult%llu"), a2)));
      sub_10000E8A0(__p, (char *)objc_msgSend(v8, "UTF8String"));

    }
    else
    {
      sub_10000E8A0(__p, off_1000F7000[a2]);
    }
    v9 = __p;
    if (v61 < 0)
      v9 = (void **)__p[0];
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v70 = 2082;
    *(_QWORD *)&v70[2] = "";
    *(_WORD *)&v70[10] = 2082;
    *(_QWORD *)&v70[12] = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,queryAtDownloadResponse\", \"queryResult\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v61 < 0)
      operator delete(__p[0]);
  }

  HighestVersion = SAMobileAssetProdHelper::getHighestVersion(v10, v55);
  v12 = (void *)objc_claimAutoreleasedReturnValue(HighestVersion);
  v13 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(v6 + 16);
    if (v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v6 + 16), "assetType"));
      v16 = v15 != 0;
      v53 = (id)v15;
      if (v15)
      {
        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v6 + 16), "assetType")));
        v17 = (const char *)objc_msgSend(v52, "UTF8String");
      }
      else
      {
        v17 = "NULL";
      }
      v18 = *(void **)(v6 + 16);
      if (v18)
      {
        sub_100098A98(__p, (unint64_t)objc_msgSend(v18, "state"));
        if (v61 >= 0)
          v19 = __p;
        else
          v19 = (void **)__p[0];
        v18 = *(void **)(v6 + 16);
        v3 = 1;
      }
      else
      {
        v3 = 0;
        v19 = (void **)"NULL";
      }
    }
    else
    {
      v18 = 0;
      v3 = 0;
      v16 = 0;
      v17 = "NULL";
      v19 = (void **)"NULL";
    }
    v20 = sub_10009ADC4(v18);
    v21 = *(void **)(v6 + 16);
    if (v21)
      v22 = sub_10009AE74(v21);
    else
      v22 = "NULL";
    *(_QWORD *)buf = 68290306;
    *(_WORD *)v70 = 2082;
    *(_QWORD *)&v70[2] = "";
    *(_WORD *)&v70[10] = 2082;
    *(_QWORD *)&v70[12] = "fCurrentAsset";
    *(_WORD *)&v70[20] = 2082;
    *(_QWORD *)&v70[22] = v17;
    *(_WORD *)&v70[30] = 2082;
    v71 = v19;
    LOWORD(v72) = 1026;
    *(_DWORD *)((char *)&v72 + 2) = v20;
    HIWORD(v72) = 2082;
    v73 = v22;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,currentVersion\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
    if ((_DWORD)v3 && v61 < 0)
    {
      operator delete(__p[0]);
      if (!v16)
      {
LABEL_28:
        if (v14)

        goto LABEL_30;
      }
    }
    else if (!v16)
    {
      goto LABEL_28;
    }

    goto LABEL_28;
  }
LABEL_30:

  v23 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
    {
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetType"));
      v24 = v3 != 0;
      if (v3)
      {
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetType")));
        v25 = (const char *)objc_msgSend(v53, "UTF8String");
      }
      else
      {
        v25 = "NULL";
      }
      v26 = v58;
      sub_100098A98(v58, (unint64_t)objc_msgSend(v12, "state"));
      if (v59 < 0)
        v26 = (void **)v58[0];
    }
    else
    {
      v24 = 0;
      v25 = "NULL";
      v26 = (void **)"NULL";
    }
    v27 = sub_10009ADC4(v12);
    v28 = v27;
    if (v12)
    {
      v29 = sub_10009AE74(v12);
      *(_QWORD *)buf = 68290306;
      *(_WORD *)v70 = 2082;
      *(_QWORD *)&v70[2] = "";
      *(_WORD *)&v70[10] = 2082;
      *(_QWORD *)&v70[12] = "asset";
      *(_WORD *)&v70[20] = 2082;
      *(_QWORD *)&v70[22] = v25;
      *(_WORD *)&v70[30] = 2082;
      v71 = v26;
      LOWORD(v72) = 1026;
      *(_DWORD *)((char *)&v72 + 2) = v28;
      HIWORD(v72) = 2082;
      v73 = v29;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,selectedVersion\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (v59 < 0)
        operator delete(v58[0]);
    }
    else
    {
      *(_QWORD *)buf = 68290306;
      *(_WORD *)v70 = 2082;
      *(_QWORD *)&v70[2] = "";
      *(_WORD *)&v70[10] = 2082;
      *(_QWORD *)&v70[12] = "asset";
      *(_WORD *)&v70[20] = 2082;
      *(_QWORD *)&v70[22] = v25;
      *(_WORD *)&v70[30] = 2082;
      v71 = v26;
      LOWORD(v72) = 1026;
      *(_DWORD *)((char *)&v72 + 2) = v27;
      HIWORD(v72) = 2082;
      v73 = "NULL";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,selectedVersion\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
    }
    if (v24)

    if (v12)
  }

  if ((sub_10009AF04(*(void **)(v6 + 16), v12) & 0x80000000) != 0)
  {
    v31 = (id)SALogObjectGeneral;
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_71;
    v32 = *(_QWORD *)(v6 + 16);
    if (v32)
    {
      v5 = (uint8_t *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v6 + 16), "assetType"));
      v33 = v5 != 0;
      if (v5)
      {
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v6 + 16), "assetType")));
        v34 = (const char *)objc_msgSend(v53, "UTF8String");
      }
      else
      {
        v34 = "NULL";
      }
      v35 = *(void **)(v6 + 16);
      if (v35)
      {
        v37 = v56;
        sub_100098A98(v56, (unint64_t)objc_msgSend(v35, "state"));
        if (v57 < 0)
          v37 = (void **)v56[0];
        v35 = *(void **)(v6 + 16);
        v36 = 1;
      }
      else
      {
        v36 = 0;
        v37 = (void **)"NULL";
      }
    }
    else
    {
      v35 = 0;
      v36 = 0;
      v33 = 0;
      v34 = "NULL";
      v37 = (void **)"NULL";
    }
    v38 = sub_10009ADC4(v35);
    v39 = *(void **)(v6 + 16);
    if (v39)
      v40 = sub_10009AE74(v39);
    else
      v40 = "NULL";
    *(_QWORD *)buf = 68290306;
    *(_WORD *)v70 = 2082;
    *(_QWORD *)&v70[2] = "";
    *(_WORD *)&v70[10] = 2082;
    *(_QWORD *)&v70[12] = "fCurrentAsset";
    *(_WORD *)&v70[20] = 2082;
    *(_QWORD *)&v70[22] = v34;
    *(_WORD *)&v70[30] = 2082;
    v71 = v37;
    LOWORD(v72) = 1026;
    *(_DWORD *)((char *)&v72 + 2) = v38;
    HIWORD(v72) = 2082;
    v73 = v40;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,replacingAsset\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
    if (v36 && v57 < 0)
    {
      operator delete(v56[0]);
      if (!v33)
      {
LABEL_69:
        if (v32)

LABEL_71:
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3321888768;
        v62[2] = sub_10009AF64;
        v62[3] = &unk_1000F6DD8;
        v64 = v6;
        v41 = v12;
        v63 = v41;
        v42 = v65;
        sub_100004F4C((uint64_t)v65, a1 + 40);
        v67[0] = off_1000F1E38;
        v67[1] = objc_retainBlock(v62);
        v68 = v67;
        v43 = v41;
        v44 = *(_QWORD *)(v6 + 8);
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)v70 = 3321888768;
        *(_QWORD *)&v70[8] = sub_10009BC7C;
        *(_QWORD *)&v70[16] = &unk_1000F6F08;
        v71 = (void **)v6;
        v45 = v43;
        *(_QWORD *)&v70[24] = v45;
        v46 = &v72;
        v47 = (uint64_t)v68;
        if (v68)
        {
          if (v68 == v67)
          {
            v74 = &v72;
            (*(void (**)(uint64_t, _QWORD *))(v67[0] + 24))((uint64_t)v67, &v72);
LABEL_76:
            objc_msgSend(v45, "startDownload:then:", v44, buf);
            if (v74 == &v72)
            {
              v48 = 4;
            }
            else
            {
              if (!v74)
                goto LABEL_81;
              v48 = 5;
              v46 = v74;
            }
            (*(void (**)(uint64_t *))(*v46 + 8 * v48))(v46);
LABEL_81:

            v49 = v68;
            if (v68 == v67)
            {
              v50 = 4;
              v49 = v67;
            }
            else
            {
              if (!v68)
                goto LABEL_86;
              v50 = 5;
            }
            (*(void (**)(void))(*v49 + 8 * v50))();
LABEL_86:
            if (v66 == v65)
            {
              v51 = 4;
            }
            else
            {
              if (!v66)
              {
LABEL_91:

                goto LABEL_92;
              }
              v51 = 5;
              v42 = v66;
            }
            (*(void (**)(_QWORD *))(*v42 + 8 * v51))(v42);
            goto LABEL_91;
          }
          v47 = (*(uint64_t (**)(_QWORD *))(*v68 + 16))(v68);
        }
        v74 = (uint64_t *)v47;
        goto LABEL_76;
      }
    }
    else if (!v33)
    {
      goto LABEL_69;
    }

    goto LABEL_69;
  }
  v30 = SALogObjectWarning;
  if (os_log_type_enabled((os_log_t)SALogObjectWarning, OS_LOG_TYPE_ERROR))
  {
    *(_QWORD *)buf = 68289026;
    *(_WORD *)v70 = 2082;
    *(_QWORD *)&v70[2] = "";
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#asset,query,Either no asset or asset version same as current asset\"}", buf, 0x12u);
  }
LABEL_92:

}

void sub_10009A4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  void *v45;
  void *v46;
  void *v47;

  _Unwind_Resume(a1);
}

id SAMobileAssetProdHelper::getHighestVersion(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t i;
  uint64_t v4;
  id v5;
  __int128 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  void **v12;
  int v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  void **v24;
  int v25;
  int v26;
  const char *v27;
  __int128 v29;
  id obj;
  id v31;
  uint64_t v32;
  id v33;
  void *v34[2];
  char v35;
  void *__p[2];
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  void **v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;
  _BYTE v56[128];

  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = a2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
  v7 = 0;
  if (v5)
  {
    v32 = *(_QWORD *)v39;
    v4 = 2082;
    *(_QWORD *)&v6 = 68289026;
    v29 = v6;
    do
    {
      v33 = v5;
      for (i = 0; (id)i != v33; ++i)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v9 = (id)SALogObjectGeneral;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          if (v8)
          {
            v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetType"));
            v10 = v2 != 0;
            if (v2)
            {
              v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetType")));
              v11 = (const char *)objc_msgSend(v31, "UTF8String");
            }
            else
            {
              v11 = "NULL";
            }
            sub_100098A98(__p, (unint64_t)objc_msgSend(v8, "state", v29));
            if (v37 >= 0)
              v12 = __p;
            else
              v12 = (void **)__p[0];
          }
          else
          {
            v10 = 0;
            v12 = (void **)"NULL";
            v11 = "NULL";
          }
          v13 = sub_10009ADC4(v8);
          v14 = v13;
          if (v8)
          {
            v15 = sub_10009AE74(v8);
            *(_DWORD *)buf = 68290306;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2082;
            v47 = "asset";
            v48 = 2082;
            v49 = v11;
            v50 = 2082;
            v51 = v12;
            v52 = 1026;
            v53 = v14;
            v54 = 2082;
            v55 = v15;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,assetInList\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
            if (v37 < 0)
              operator delete(__p[0]);
          }
          else
          {
            *(_DWORD *)buf = 68290306;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2082;
            v47 = "asset";
            v48 = 2082;
            v49 = v11;
            v50 = 2082;
            v51 = v12;
            v52 = 1026;
            v53 = v13;
            v54 = 2082;
            v55 = "NULL";
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,assetInList\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
          }
          if (v10)

          if (v8)
        }

        if (v7)
        {
          if ((sub_10009AF04(v7, v8) & 0x80000000) == 0)
            continue;
          v16 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v17 = v16;
            v18 = "{\"msg%{public}.0s\":\"#asset,getHighestVersion,preferThisAsset,versionIsBetter\"}";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x12u);
          }
        }
        else
        {
          v19 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v17 = v19;
            v18 = "{\"msg%{public}.0s\":\"#asset,getHighestVersion,preferThisAsset,assetWithLatestVersion is Nil\"}";
            goto LABEL_29;
          }
        }
        v20 = v8;

        v7 = v20;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
    }
    while (v5);
  }

  v21 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
    {
      i = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetType"));
      v22 = i != 0;
      if (i)
      {
        v4 = (uint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetType")));
        v23 = (const char *)objc_msgSend((id)v4, "UTF8String");
      }
      else
      {
        v23 = "NULL";
      }
      sub_100098A98(v34, (unint64_t)objc_msgSend(v7, "state", v29));
      if (v35 >= 0)
        v24 = v34;
      else
        v24 = (void **)v34[0];
    }
    else
    {
      v22 = 0;
      v23 = "NULL";
      v24 = (void **)"NULL";
    }
    v25 = sub_10009ADC4(v7);
    v26 = v25;
    if (v7)
    {
      v27 = sub_10009AE74(v7);
      *(_DWORD *)buf = 68290306;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      v46 = 2082;
      v47 = "assetWithLatestVersion";
      v48 = 2082;
      v49 = v23;
      v50 = 2082;
      v51 = v24;
      v52 = 1026;
      v53 = v26;
      v54 = 2082;
      v55 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,finalChoice\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (v35 < 0)
        operator delete(v34[0]);
      if (!v22)
        goto LABEL_49;
    }
    else
    {
      *(_DWORD *)buf = 68290306;
      v43 = 0;
      v44 = 2082;
      v45 = "";
      v46 = 2082;
      v47 = "assetWithLatestVersion";
      v48 = 2082;
      v49 = v23;
      v50 = 2082;
      v51 = v24;
      v52 = 1026;
      v53 = v25;
      v54 = 2082;
      v55 = "NULL";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,getHighestVersion,finalChoice\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (!v22)
        goto LABEL_49;
    }

LABEL_49:
    if (v7)

  }
  return v7;
}

void sub_10009ACC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

uint64_t sub_10009ADC4(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "attributes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", ASAttributeContentVersion));

    if (v4)
      v5 = (uint64_t)objc_msgSend(v4, "intValue");
    else
      v5 = 0xFFFFFFFFLL;

  }
  else
  {
    v5 = 0xFFFFFFFFLL;
  }

  return v5;
}

void sub_10009AE48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const char *sub_10009AE74(void *a1)
{
  void *v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  const char *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getLocalFileUrl"));
  v2 = v1;
  if (!v1)
  {
    v3 = CFSTR("NULL");
    goto LABEL_5;
  }
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "absoluteString"));
  if (v3)
  {
LABEL_5:
    v4 = objc_retainAutorelease(v3);
    v5 = (const char *)-[__CFString UTF8String](v4, "UTF8String");
    goto LABEL_6;
  }
  v4 = 0;
  v5 = "NULL";
LABEL_6:

  return v5;
}

void sub_10009AEE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10009AF04(void *a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  v3 = a2;
  v4 = sub_10009ADC4(a1);
  v5 = sub_10009ADC4(v3);
  if (v4 >= v5)
    v6 = 0;
  else
    v6 = -1;
  if (v4 > v5)
    v7 = 1;
  else
    v7 = v6;

  return v7;
}

void sub_10009AF50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10009AF64(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  int v11;
  void **v12;
  int v13;
  void *v14;
  const char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *__p[2];
  char v23;
  _BYTE v24[24];
  _BYTE *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void **v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = (id)SALogObjectGeneral;
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    goto LABEL_22;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetType"));
    v8 = v7 != 0;
    v21 = (void *)v7;
    if (v7)
    {
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetType")));
      v9 = (const char *)objc_msgSend(v20, "UTF8String");
    }
    else
    {
      v9 = "NULL";
    }
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      sub_100098A98(__p, (unint64_t)objc_msgSend(v10, "state"));
      if (v23 >= 0)
        v12 = __p;
      else
        v12 = (void **)__p[0];
      v10 = *(void **)(a1 + 32);
      v11 = 1;
    }
    else
    {
      v11 = 0;
      v12 = (void **)"NULL";
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v8 = 0;
    v9 = "NULL";
    v12 = (void **)"NULL";
  }
  v13 = sub_10009ADC4(v10);
  v14 = *(void **)(a1 + 32);
  if (v14)
    v15 = sub_10009AE74(v14);
  else
    v15 = "NULL";
  *(_DWORD *)buf = 68290562;
  v27 = 0;
  v28 = 2082;
  v29 = "";
  v30 = 1026;
  v31 = a2;
  v32 = 2082;
  v33 = "asset";
  v34 = 2082;
  v35 = v9;
  v36 = 2082;
  v37 = v12;
  v38 = 1026;
  v39 = v13;
  v40 = 2082;
  v41 = v15;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadResponse\", \"isDownloadSuccess\":%{public}hhd, \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x46u);
  if (!v11 || (v23 & 0x80000000) == 0)
  {
    if (!v8)
      goto LABEL_20;
    goto LABEL_19;
  }
  operator delete(__p[0]);
  if (v8)
LABEL_19:

LABEL_20:
  if (v6)

LABEL_22:
  if (a2)
  {
    v16 = *(void **)(a1 + 32);
    sub_100004F4C((uint64_t)v24, a1 + 48);
    SAMobileAssetProdHelper::readAsset(v4, v16, (uint64_t)v24);
    v17 = v25;
    if (v25 == v24)
    {
      v18 = 4;
      v17 = v24;
    }
    else
    {
      if (!v25)
        return;
      v18 = 5;
    }
    (*(void (**)(void))(*v17 + 8 * v18))();
  }
  else
  {
    v19 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadAsset,failed\"}", buf, 0x12u);
    }
    *(_QWORD *)(v4 + 24) = 0;
    sub_100099B44(a1 + 48, 0);
  }
}

void sub_10009B254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void SAMobileAssetProdHelper::readAsset(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  void **v13;
  int v14;
  const char *v15;
  char *v16;
  char *v17;
  NSObject *v18;
  char *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *__p[2];
  char v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void **v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;

  v6 = a2;
  v7 = v6;
  if (*(_QWORD *)(a3 + 24))
  {
    v8 = SALogObjectGeneral;
    if (v6)
    {
      v9 = (id)SALogObjectGeneral;
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getLocalFileUrl"));
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", CFSTR("safetyalerts_channels.plist"), v16));
        v18 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289538;
          v33 = 0;
          v34 = 2082;
          v35 = "";
          v36 = 2114;
          v37 = v16;
          v38 = 2114;
          v39 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset,url\", \"folder\":%{public, location:escape_only}@, \"url\":%{public, location:escape_only}@}", buf, 0x26u);
        }
        v29 = 0;
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v17, &v29));
        v28 = v29;
        v20 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289282;
          v33 = 0;
          v34 = 2082;
          v35 = "";
          v36 = 2114;
          v37 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset,assetContentsData\", \"assetPlist\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        if (v19)
        {
          v21 = SALogObjectGeneral;
          if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289282;
            v33 = 0;
            v34 = 2082;
            v35 = "";
            v36 = 2114;
            v37 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset,plist\", \"assetPlist\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          *(_DWORD *)(a1 + 28) = sub_10009ADC4(v7);
          v22 = v7;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "attributes"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", ASAttributeCompatibilityVersion));

          if (v24)
            v25 = objc_msgSend(v24, "intValue");
          else
            v25 = -1;

          *(_DWORD *)(a1 + 24) = v25;
          objc_storeStrong((id *)(a1 + 16), a2);
          sub_100099B44(a3, v19);
        }
        else
        {
          *(_QWORD *)(a1 + 24) = 0;
          sub_100099B44(a3, 0);
          v26 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = 0;

        }
        goto LABEL_33;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetType"));
      if (v10)
      {
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetType")));
        v11 = (const char *)objc_msgSend(v27, "UTF8String");
      }
      else
      {
        v11 = "NULL";
      }
      v13 = __p;
      sub_100098A98(__p, (unint64_t)objc_msgSend(v7, "state"));
      if (v31 < 0)
        v13 = (void **)__p[0];
      v14 = sub_10009ADC4(v7);
      v15 = sub_10009AE74(v7);
      *(_DWORD *)buf = 68290306;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      v36 = 2082;
      v37 = "asset";
      v38 = 2082;
      v39 = v11;
      v40 = 2082;
      v41 = v13;
      v42 = 1026;
      v43 = v14;
      v44 = 2082;
      v45 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,readAsset\", \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s}", buf, 0x40u);
      if (v31 < 0)
      {
        operator delete(__p[0]);
        if (!v10)
        {
LABEL_19:

          goto LABEL_20;
        }
      }
      else if (!v10)
      {
        goto LABEL_19;
      }

      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#asset,readAsset,emptyAsset\"}", buf, 0x12u);
    }
    *(_QWORD *)(a1 + 24) = 0;
    sub_100099B44(a3, 0);
  }
  else
  {
    v12 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#asset,readAsset,emptyCallback\"}", buf, 0x12u);
    }
  }
LABEL_33:

}

void sub_10009B7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

uint64_t sub_10009B8B4(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 48, a2 + 48);
}

_QWORD *sub_10009B8C0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t sub_10009B8F4(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 40, a2 + 40);
}

_QWORD *sub_10009B900(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

_QWORD *sub_10009B934(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  _QWORD v9[5];
  _BYTE v10[24];
  _BYTE *v11;

  v2 = **(NSObject ***)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_10009BA04;
  v9[3] = &unk_1000F6E68;
  v9[4] = a2;
  sub_100004F4C((uint64_t)v10, a1 + 40);
  dispatch_async(v2, v9);
  result = v11;
  if (v11 == v10)
  {
    v8 = 4;
    result = v10;
  }
  else
  {
    if (!v11)
      return result;
    v8 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(*result + 8 * v8))(result, v3, v4, v5, v6);
}

void sub_10009BA04(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[5];
  _BYTE v6[24];
  _BYTE *v7;

  v2 = objc_autoreleasePoolPush();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_10009BB38;
  v5[3] = &unk_1000F6E68;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = v6;
  sub_100004F4C((uint64_t)v6, a1 + 40);
  sub_10009BB38((uint64_t)v5);
  if (v7 == v6)
  {
    v4 = 4;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
    v3 = v7;
LABEL_5:
    (*(void (**)(_QWORD *))(*v3 + 8 * v4))(v3);
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10009BAF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17)
{
  _QWORD *v17;
  uint64_t v19;

  if (a17 == v17)
  {
    v19 = 4;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
    v17 = a17;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t sub_10009BB38(uint64_t a1)
{
  NSObject *v2;
  void **v3;
  uint64_t v4;
  void *__p[2];
  char v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void **v13;

  v2 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    sub_100098B0C(__p, *(_QWORD *)(a1 + 32));
    v3 = v7 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,downloadCatalogResponse\", \"downloadResult\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v7 < 0)
      operator delete(__p[0]);
  }

  buf[0] = *(_QWORD *)(a1 + 32) == 0;
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    sub_100004FB0();
  return (*(uint64_t (**)(uint64_t, uint8_t *))(*(_QWORD *)v4 + 48))(v4, buf);
}

void sub_10009BC64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10009BC7C(uint64_t a1, uint64_t a2)
{
  NSObject **v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  NSObject **v16;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE *v19;

  v4 = *(void **)(a1 + 32);
  v3 = *(NSObject ***)(a1 + 40);
  v5 = *v3;
  v14[0] = _NSConcreteStackBlock;
  v14[2] = sub_10009BD84;
  v14[3] = &unk_1000F6ED0;
  v14[1] = 3321888768;
  v16 = v3;
  v17 = a2;
  v15 = v4;
  sub_100004F4C((uint64_t)v18, a1 + 48);
  dispatch_async(v5, v14);
  v12 = v19;
  if (v19 == v18)
  {
    v13 = 4;
    v12 = v18;
    goto LABEL_5;
  }
  if (v19)
  {
    v13 = 5;
LABEL_5:
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v12 + 8 * v13))(v12, v6, v7, v8, v9, v10, v11);
  }

}

void sub_10009BD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_10009BD84(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE *v12;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_autoreleasePoolPush();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3321888768;
  v7[2] = sub_10009BEDC;
  v7[3] = &unk_1000F6ED0;
  v4 = *(_QWORD *)(a1 + 48);
  v9 = v2;
  v10 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v11;
  sub_100004F4C((uint64_t)v11, a1 + 56);
  sub_10009BEDC((uint64_t)v7);
  if (v12 == v11)
  {
    v6 = 4;
    goto LABEL_5;
  }
  if (v12)
  {
    v6 = 5;
    v5 = v12;
LABEL_5:
    (*(void (**)(_QWORD *))(*v5 + 8 * v6))(v5);
  }

  objc_autoreleasePoolPop(v3);
}

void sub_10009BE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _QWORD *a19)
{
  _QWORD *v19;
  uint64_t v21;

  if (a19 == v19)
  {
    v21 = 4;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v21 = 5;
    v19 = a19;
  }
  (*(void (**)(_QWORD *))(*v19 + 8 * v21))(v19);
LABEL_6:

  _Unwind_Resume(a1);
}

uint64_t sub_10009BEDC(uint64_t a1)
{
  NSObject *v2;
  void **v3;
  void **v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  int v9;
  void **v10;
  int v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint8_t v17;
  uint64_t v18;
  id v20;
  void *v21[2];
  char v22;
  void *__p[2];
  char v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void **v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  void **v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;

  v2 = (id)SALogObjectGeneral;
  if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    goto LABEL_26;
  v3 = __p;
  sub_100098B0C(__p, *(_QWORD *)(a1 + 48));
  if (v24 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v3 = (void **)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetType"));
    v6 = v3 != 0;
    if (v3)
    {
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetType")));
      v7 = (const char *)objc_msgSend(v20, "UTF8String");
    }
    else
    {
      v7 = "NULL";
    }
    v8 = *(void **)(a1 + 32);
    if (v8)
    {
      v10 = v21;
      sub_100098A98(v21, (unint64_t)objc_msgSend(v8, "state"));
      if (v22 < 0)
        v10 = (void **)v21[0];
      v8 = *(void **)(a1 + 32);
      v9 = 1;
    }
    else
    {
      v9 = 0;
      v10 = (void **)"NULL";
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v6 = 0;
    v7 = "NULL";
    v10 = (void **)"NULL";
  }
  v11 = sub_10009ADC4(v8);
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    v13 = sub_10009AE74(v12);
    v14 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v14 = 0;
    v13 = "NULL";
  }
  *(_DWORD *)buf = 68290818;
  v26 = 0;
  v27 = 2082;
  v28 = "";
  v29 = 2082;
  v30 = v4;
  v31 = 2082;
  v32 = "asset";
  v33 = 2082;
  v34 = v7;
  v35 = 2082;
  v36 = v10;
  v37 = 1026;
  v38 = v11;
  v39 = 2082;
  v40 = v13;
  v41 = 2114;
  v42 = v14;
  _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,startDownloadResponse\", \"downloadResult\":%{public, location:escape_only}s, \"var\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"version\":%{public}d, \"url\":%{public, location:escape_only}s, \"asset\":%{public, location:escape_only}@}", buf, 0x54u);
  if (v9 && v22 < 0)
  {
    operator delete(v21[0]);
    if (!v6)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v6)
LABEL_21:

LABEL_22:
  if (v5)

  if (v24 < 0)
    operator delete(__p[0]);
LABEL_26:

  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    v16 = v15 == 15;
  else
    v16 = 1;
  v17 = v16;
  buf[0] = v17;
  v18 = *(_QWORD *)(a1 + 80);
  if (!v18)
    sub_100004FB0();
  return (*(uint64_t (**)(uint64_t, uint8_t *))(*(_QWORD *)v18 + 48))(v18, buf);
}

void sub_10009C168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;

  if (a22 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t sub_10009C1FC(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 56, a2 + 56);
}

_QWORD *sub_10009C208(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 56);
  result = *(_QWORD **)(a1 + 80);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t sub_10009C23C(uint64_t a1, uint64_t a2)
{
  return sub_100004F4C(a1 + 48, a2 + 48);
}

_QWORD *sub_10009C248(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 48);
  result = *(_QWORD **)(a1 + 72);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t sub_10009C27C(uint64_t a1)
{

  return a1;
}

void sub_10009C2A4(uint64_t a1)
{

  operator delete();
}

uint64_t sub_10009C2DC()
{
  return 0;
}

id sub_10009C2E4(uint64_t a1, _QWORD *a2)
{
  id result;

  *a2 = off_1000F6F48;
  result = objc_retainBlock(*(id *)(a1 + 8));
  a2[1] = result;
  return result;
}

void sub_10009C31C(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

uint64_t sub_10009C32C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t sub_10009C340(uint64_t a1, uint64_t a2)
{
  if (sub_100010690(a2, (uint64_t)&off_1000F6FB8))
    return a1 + 8;
  else
    return 0;
}

_UNKNOWN **sub_10009C37C()
{
  return &off_1000F6FB8;
}

void sub_10009C460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10009C550(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10009C700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SACoreTelephonyClientHelper::SACoreTelephonyClientHelper(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  CTClientDelegate *v8;
  void *v9;
  void *v10;
  id v11;
  SAPlatformInfo *v12;
  id v13;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  uint64_t buf;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  v5 = a2;
  *(_QWORD *)a1 = v5;
  sub_1000791CC(a1 + 8, a3);
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 181) = 0;
  v6 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", *(_QWORD *)a1);
  v7 = *(void **)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v6;

  if (!*(_QWORD *)(a1 + 168))
  {
    v15 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v24 = 2082;
      v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ctsa,fCTClient is nil\"}", (uint8_t *)&buf, 0x12u);
      v15 = SALogObjectGeneral;
    }
    v16 = 54;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      buf = 68289795;
      v24 = 2082;
      v25 = "";
      v26 = 2081;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/coreTelephony/prod/SACoreTelephonyClientHelper.mm";
      v28 = 2081;
      v29 = "SACoreTelephonyClientHelper";
      v30 = 1026;
      v31 = 54;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
    }
    v17 = "false && \"#ctsa,fCTClient is nil\"";
LABEL_16:
    __assert_rtn("SACoreTelephonyClientHelper", "SACoreTelephonyClientHelper.mm", v16, v17);
  }
  v8 = objc_alloc_init(CTClientDelegate);
  v9 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 176) = v8;

  v10 = *(void **)(a1 + 176);
  if (!v10)
  {
    v18 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v24 = 2082;
      v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ctsa,fCTClientDelegate is nil\"}", (uint8_t *)&buf, 0x12u);
      v18 = SALogObjectGeneral;
    }
    v16 = 56;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      buf = 68289795;
      v24 = 2082;
      v25 = "";
      v26 = 2081;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/coreTelephony/prod/SACoreTelephonyClientHelper.mm";
      v28 = 2081;
      v29 = "SACoreTelephonyClientHelper";
      v30 = 1026;
      v31 = 56;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", (uint8_t *)&buf, 0x2Cu);
    }
    v17 = "false && \"#ctsa,fCTClientDelegate is nil\"";
    goto LABEL_16;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10009CD30;
  v22[3] = &unk_1000F7078;
  v22[4] = a1;
  objc_msgSend(v10, "setFCarrierBundleChangeCb:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10009CD3C;
  v21[3] = &unk_1000F7078;
  v21[4] = a1;
  objc_msgSend(*(id *)(a1 + 176), "setFOperatorBundleChangeCb:", v21);
  objc_msgSend(*(id *)(a1 + 176), "setFDefaultBundleChangeCb:", &stru_1000F7098);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009CD4C;
  v20[3] = &unk_1000F7078;
  v20[4] = a1;
  objc_msgSend(*(id *)(a1 + 176), "setFPrefDataSimChangedCb:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10009CE18;
  v19[3] = &unk_1000F1EB8;
  v19[4] = a1;
  objc_msgSend(*(id *)(a1 + 176), "setFTandemCapabilityChangeCb:", v19);
  objc_msgSend(*(id *)(a1 + 168), "setDelegate:", *(_QWORD *)(a1 + 176));
  *(_DWORD *)(a1 + 184) = 0;
  v11 = objc_msgSend(objc_alloc((Class)CTXPCServiceSubscriptionContext), "initWithSlot:", 1);
  sub_10009CF54(a1, v11, 2);
  sub_10009CF54(a1, v11, 1);
  if (*((_BYTE *)SAPlatformInfo::instance(v12) + 10))
  {
    v13 = objc_msgSend(objc_alloc((Class)CTXPCServiceSubscriptionContext), "initWithSlot:", 2);
    sub_10009CF54(a1, v13, 2);
    sub_10009CF54(a1, v13, 1);

  }
  sub_10009D0E8(a1);

  return a1;
}

void sub_10009CCD0(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10009CD30(uint64_t a1, void *a2)
{
  sub_10009CF54(*(_QWORD *)(a1 + 32), a2, 1);
}

void sub_10009CD3C(uint64_t a1, void *a2)
{
  sub_10009CF54(*(_QWORD *)(a1 + 32), a2, 2);
}

void sub_10009CD4C(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  id v8;

  v2 = a2;
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289283;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    v7 = 2113;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onPrefDataSimChanged\", \"context\":%{private, location:escape_only}@}", (uint8_t *)v4, 0x1Cu);
  }

}

void sub_10009CE18(uint64_t a1)
{
  sub_10009D0E8(*(_QWORD *)(a1 + 32));
}

void SACoreTelephonyClientHelper::~SACoreTelephonyClientHelper(SACoreTelephonyClientHelper *this)
{
  void *v2;
  SACoreTelephonyClientHelper *v3;
  uint64_t v4;
  SACoreTelephonyClientHelper *v5;
  uint64_t v6;
  SACoreTelephonyClientHelper *v7;
  uint64_t v8;
  SACoreTelephonyClientHelper *v9;
  uint64_t v10;
  SACoreTelephonyClientHelper *v11;
  uint64_t v12;

  v2 = (void *)*((_QWORD *)this + 21);
  *((_QWORD *)this + 21) = 0;

  v3 = (SACoreTelephonyClientHelper *)*((_QWORD *)this + 20);
  if (v3 == (SACoreTelephonyClientHelper *)((char *)this + 136))
  {
    v4 = 4;
    v3 = (SACoreTelephonyClientHelper *)((char *)this + 136);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (SACoreTelephonyClientHelper *)*((_QWORD *)this + 16);
  if (v5 == (SACoreTelephonyClientHelper *)((char *)this + 104))
  {
    v6 = 4;
    v5 = (SACoreTelephonyClientHelper *)((char *)this + 104);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  v7 = (SACoreTelephonyClientHelper *)*((_QWORD *)this + 12);
  if (v7 == (SACoreTelephonyClientHelper *)((char *)this + 72))
  {
    v8 = 4;
    v7 = (SACoreTelephonyClientHelper *)((char *)this + 72);
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
LABEL_16:
  v9 = (SACoreTelephonyClientHelper *)*((_QWORD *)this + 8);
  if (v9 == (SACoreTelephonyClientHelper *)((char *)this + 40))
  {
    v10 = 4;
    v9 = (SACoreTelephonyClientHelper *)((char *)this + 40);
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    v10 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v9 + 8 * v10))();
LABEL_21:
  v11 = (SACoreTelephonyClientHelper *)*((_QWORD *)this + 4);
  if (v11 == (SACoreTelephonyClientHelper *)((char *)this + 8))
  {
    v12 = 4;
    v11 = (SACoreTelephonyClientHelper *)((char *)this + 8);
    goto LABEL_25;
  }
  if (v11)
  {
    v12 = 5;
LABEL_25:
    (*(void (**)(void))(*(_QWORD *)v11 + 8 * v12))();
  }

}

void sub_10009CF54(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  __CFString *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#cb,onOperatorBundleChangedNotifFromCT\", \"context\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v7 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", a3);
  v8 = objc_msgSend(v5, "slotID");
  v9 = *(void **)(a1 + 168);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009D2A0;
  v10[3] = &unk_1000F70C0;
  v11 = CFSTR("AppleSafetyAlert");
  v12 = a1;
  v13 = v8;
  v14 = a3;
  objc_msgSend(v9, "copyCarrierBundleValueWithDefault:key:bundleType:completion:", v5, CFSTR("CellBroadcast"), v7, v10);

}

void sub_10009D0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10009D0E8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,tandemCapabilityChanged\"}", buf, 0x12u);
  }
  v3 = *(void **)(a1 + 168);
  v8 = 0;
  v4 = objc_msgSend(v3, "getDualSimCapability:", &v8);
  v5 = v8;
  v6 = SALogObjectGeneral;
  v7 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 68289283;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,tandemCapabilityChanged,queryFailed\", \"error\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2050;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,tandemCapabilityChanged,querySuccess\", \"capability\":%{public}lld}", buf, 0x1Cu);
    }
    *(_BYTE *)(a1 + 188) = v4 == (id)2;
  }

}

void sub_10009D2A0(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  int v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _BYTE v35[10];
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;

  v5 = a2;
  v6 = a3;
  v7 = a1[5];
  v8 = objc_autoreleasePoolPush();
  if (!v6)
  {
    if (!v5)
    {
      v18 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      v30 = 68289026;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v10 = "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleChangedNotifFromCT,valueIsNil\"}";
      v11 = v18;
      v12 = 18;
      goto LABEL_4;
    }
    v13 = v5;
    v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 68289283;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2113;
      *(_QWORD *)v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleChangedNotifFromCT\", \"val\":%{private, location:escape_only}@}", (uint8_t *)&v30, 0x1Cu);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", a1[4]));
    if (v15)
    {
      v16 = objc_opt_class(NSDictionary);
      isKindOfClass = objc_opt_isKindOfClass(v15, v16);
    }
    else
    {
      isKindOfClass = 0;
    }
    v19 = a1[6];
    if (v19 == 2)
    {
      v22 = a1[7];
      if (v22 == 1)
      {
        v21 = (_BYTE *)(v7 + 187);
        goto LABEL_23;
      }
      if (v22 == 2)
      {
        v21 = (_BYTE *)(v7 + 185);
        goto LABEL_23;
      }
    }
    else if (v19 == 1)
    {
      v20 = a1[7];
      if (v20 == 1)
      {
        v21 = (_BYTE *)(v7 + 186);
        goto LABEL_23;
      }
      if (v20 == 2)
      {
        v21 = (_BYTE *)(v7 + 184);
LABEL_23:
        *v21 = isKindOfClass & 1;
      }
    }
    if (*(_QWORD *)(v7 + 96))
    {
      v23 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(unsigned __int8 *)(v7 + 186);
        v25 = *(unsigned __int8 *)(v7 + 187);
        v26 = *(unsigned __int8 *)(v7 + 184);
        v27 = *(unsigned __int8 *)(v7 + 185);
        v30 = 68290050;
        v31 = 0;
        v32 = 2082;
        v33 = "";
        v34 = 1026;
        *(_DWORD *)v35 = v24;
        *(_WORD *)&v35[4] = 1026;
        *(_DWORD *)&v35[6] = v25;
        v36 = 1026;
        v37 = v26;
        v38 = 1026;
        v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleSupport\", \"CB1\":%{public}d, \"CB2\":%{public}d, \"OB1\":%{public}d, \"OB2\":%{public}d}", (uint8_t *)&v30, 0x2Au);
      }
      v28 = *(_BYTE *)(v7 + 184) || *(_BYTE *)(v7 + 185) || *(_BYTE *)(v7 + 186) || *(_BYTE *)(v7 + 187) != 0;
      LOBYTE(v30) = v28;
      v29 = *(_QWORD *)(v7 + 96);
      if (!v29)
        sub_100004FB0();
      (*(void (**)(uint64_t, int *))(*(_QWORD *)v29 + 48))(v29, &v30);
    }

    goto LABEL_34;
  }
  v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 68289283;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    v34 = 2113;
    *(_QWORD *)v35 = v6;
    v10 = "{\"msg%{public}.0s\":\"#ctsa,onOperatorBundleChangedNotifFromCT,failed\", \"error\":%{private, location:escape_only}@}";
    v11 = v9;
    v12 = 28;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v30, v12);
  }
LABEL_34:
  objc_autoreleasePoolPop(v8);

}

void sub_10009D618(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void SACoreTelephonyProd::SACoreTelephonyProd(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD handler[5];
  _BYTE v20[24];
  _BYTE *v21;
  _BYTE v22[24];
  _BYTE *v23;
  _BYTE v24[24];
  _BYTE *v25;
  _BYTE v26[24];
  _BYTE *v27;
  _BYTE v28[24];
  _BYTE *v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v5 = a2;
  sub_1000791CC((uint64_t)v20, a3);
  *(_QWORD *)a1 = off_1000F6880;
  *(_QWORD *)(a1 + 8) = 0;
  sub_1000791CC(a1 + 16, (uint64_t)v20);
  v6 = v29;
  if (v29 == v28)
  {
    v7 = 4;
    v6 = v28;
  }
  else
  {
    if (!v29)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  v8 = v27;
  if (v27 == v26)
  {
    v9 = 4;
    v8 = v26;
  }
  else
  {
    if (!v27)
      goto LABEL_11;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_11:
  v10 = v25;
  if (v25 == v24)
  {
    v11 = 4;
    v10 = v24;
  }
  else
  {
    if (!v25)
      goto LABEL_16;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_16:
  v12 = v23;
  if (v23 == v22)
  {
    v13 = 4;
    v12 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_21;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_21:
  v14 = v21;
  if (v21 == v20)
  {
    v15 = 4;
    v14 = v20;
  }
  else
  {
    if (!v21)
      goto LABEL_26;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_26:
  *(_QWORD *)a1 = off_1000F70F0;
  *(_QWORD *)(a1 + 184) = 0;
  *(_BYTE *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 200) = v5;
  v16 = _CTServerConnectionCreateOnTargetQueue(0, CFSTR("com.apple.safetyalertsd"), &_dispatch_main_q, 0);
  *(_QWORD *)(a1 + 176) = v16;
  v17 = SALogObjectGeneral;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,created CT connection\"}", buf, 0x12u);
      v17 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,registering for kCTSMSCellBroadcastTelemetryNotification\"}", buf, 0x12u);
    }
    v18 = *(NSObject **)(a1 + 200);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10009DC28;
    handler[3] = &unk_1000F1DE8;
    handler[4] = a1;
    xpc_set_event_stream_handler("com.apple.CTTelephonyCenter", v18, handler);
    operator new();
  }
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289026;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ctsa,fCTConnection is nil\"}", buf, 0x12u);
    v17 = SALogObjectGeneral;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289795;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    v34 = 2081;
    v35 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/coreTelephony/prod/SACoreTelephonyProd.mm";
    v36 = 2081;
    v37 = "SACoreTelephonyProd";
    v38 = 1026;
    v39 = 34;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
  }
  __assert_rtn("SACoreTelephonyProd", "SACoreTelephonyProd.mm", 34, "false && \"#ctsa,fCTConnection is nil\"");
}

void sub_10009DBA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  sub_100074840(&a35);
  operator delete();
}

void sub_10009DC28(uint64_t a1, void *a2)
{
  id v3;
  SACoreTelephony *v4;
  void *v5;
  const char *string;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  xpc_object_t value;
  void *v11;
  NSDictionary *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  NSObject *v22;
  int v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;

  v3 = a2;
  v4 = *(SACoreTelephony **)(a1 + 32);
  v5 = objc_autoreleasePoolPush();
  string = xpc_dictionary_get_string(v3, "Name");
  if (string)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    v8 = kCTSMSCellBroadcastTelemetryNotification;
    if ((objc_msgSend(v7, "isEqualToString:", kCTSMSCellBroadcastTelemetryNotification) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", kCTEventSMSMessageCellBroadcastStringGeofencingStarted) & 1) != 0)
    {
      v9 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 68289538;
        v24 = 0;
        v25 = 2082;
        v26 = "";
        v27 = 2082;
        v28 = string;
        v29 = 2082;
        v30 = "willProcess";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,com.apple.CTTelephonyCenter\", \"Notification\":%{public, location:escape_only}s, \"result\":%{public, location:escape_only}s}", (uint8_t *)&v23, 0x26u);
      }
      value = xpc_dictionary_get_value(v3, "UserInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue(value);
      v12 = (NSDictionary *)_CFXPCCreateCFObjectFromXPCObject();

      v13 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 68289283;
        v24 = 0;
        v25 = 2082;
        v26 = "";
        v27 = 2113;
        v28 = (const char *)v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,kCTSMSCellBroadcastTelemetryNotification\", \"info\":%{private, location:escape_only}@}", (uint8_t *)&v23, 0x1Cu);
      }
      if (v12)
      {
        if (objc_msgSend(v7, "isEqualToString:", v8))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v12, "objectForKey:", kCTSMSCellBroadcastString));
          if (v14)
          {
            v15 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v12, "objectForKey:", kCTSMSAppleSafetyAlertSupport));
              if (v16 && (v17 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v16, v17) & 1) != 0))
                v18 = v16;
              else
                v18 = 0;

              v21 = objc_msgSend(v18, "unsignedIntValue");
              v22 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                v23 = 68289282;
                v24 = 0;
                v25 = 2082;
                v26 = "";
                v27 = 1026;
                LODWORD(v28) = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onAlertDisplayNotification\", \"weaIdNumber\":%{public}d}", (uint8_t *)&v23, 0x18u);
              }
              if (v21 == 1)
                SACoreTelephony::onWeaDisplayedNotification(v4, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
              SACoreTelephony::onMotionHarvestWeaTrigger(v4, v12);

            }
          }

        }
        else if (objc_msgSend(v7, "isEqualToString:", kCTEventSMSMessageCellBroadcastStringGeofencingStarted))
        {
          SACoreTelephony::onWeaReceivedNotification(v4, v12);
        }
      }

    }
    else
    {
      v20 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 68289538;
        v24 = 0;
        v25 = 2082;
        v26 = "";
        v27 = 2082;
        v28 = string;
        v29 = 2082;
        v30 = "ignored";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,com.apple.CTTelephonyCenter\", \"Notification\":%{public, location:escape_only}s, \"result\":%{public, location:escape_only}s}", (uint8_t *)&v23, 0x26u);
      }
    }

  }
  else
  {
    v19 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 68289538;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = "nil";
      v29 = 2082;
      v30 = "ignored";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,com.apple.CTTelephonyCenter\", \"Notification\":%{public, location:escape_only}s, \"result\":%{public, location:escape_only}s}", (uint8_t *)&v23, 0x26u);
    }
  }
  objc_autoreleasePoolPop(v5);

}

void sub_10009E09C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

_QWORD *sub_10009E11C(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  *a1 = off_1000F6880;
  v2 = a1 + 18;
  v3 = (_QWORD *)a1[21];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = (_QWORD *)a1[17];
  if (v5 == a1 + 14)
  {
    v6 = 4;
    v5 = a1 + 14;
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_11:
  v7 = (_QWORD *)a1[13];
  if (v7 == a1 + 10)
  {
    v8 = 4;
    v7 = a1 + 10;
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_16:
  v9 = (_QWORD *)a1[9];
  if (v9 == a1 + 6)
  {
    v10 = 4;
    v9 = a1 + 6;
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_21:
  v11 = (_QWORD *)a1[5];
  if (v11 == a1 + 2)
  {
    v12 = 4;
    v11 = a1 + 2;
    goto LABEL_25;
  }
  if (v11)
  {
    v12 = 5;
LABEL_25:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  return a1;
}

void sub_10009E23C(_QWORD *a1)
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,start,registering for kCTSMSCellBroadcastTelemetryNotification and kCTEventSMSMessageCellBroadcastStringGeofencingStarted\"}", (uint8_t *)&v9, 0x12u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)sub_10009E3D0, kCTSMSCellBroadcastConfigChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = _CTServerConnectionRegisterForNotification(a1[22], kCTSMSCellBroadcastTelemetryNotification);
  v5 = _CTServerConnectionRegisterForNotification(a1[22], kCTEventSMSMessageCellBroadcastStringGeofencingStarted);
  v6 = HIDWORD(v4);
  v7 = HIDWORD(v5);
  if (v6 | HIDWORD(v5))
  {
    v8 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 1025;
      v14 = v6;
      v15 = 1025;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,start,error in registering to notifications\", \"weaDisplay\":%{private}d, \"weaReceive\":%{private}d}", (uint8_t *)&v9, 0x1Eu);
    }
  }
}

void sub_10009E3D0(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;

  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCellBroadcastSwitchChangedNotification\"}", buf, 0x12u);
  }
  if (a2)
  {
    v4 = *(NSObject **)(a2 + 200);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A0F5C;
    block[3] = &unk_1000F1EB8;
    block[4] = a2;
    dispatch_async(v4, block);
  }
  else
  {
    v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCellBroadcastSwitchChangedNotification invalid observed\"}", buf, 0x12u);
    }
  }
}

CFMutableDictionaryRef sub_10009E52C(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  __CFDictionary *Mutable;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  CFNumberRef v30;
  CFNumberRef v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  CFNumberRef v59;
  id v60;
  int v61;
  NSObject *v62;
  void *v63;
  CFNumberRef v64;
  id v65;
  int v66;
  CFNumberRef v67;
  id v68;
  int v69;
  CFNumberRef v70;
  uint64_t v71;
  __CFArray *v72;
  id v73;
  int v74;
  CFNumberRef v75;
  CFNumberRef v76;
  uint64_t v77;
  __CFArray *v78;
  id v79;
  id v80;
  uint64_t v81;
  void *i;
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  int v87;
  CFNumberRef v88;
  uint64_t v89;
  __CFArray *v90;
  id v91;
  id v92;
  uint64_t v93;
  void *j;
  void *v95;
  uint64_t v96;
  id v97;
  id v98;
  int v99;
  CFNumberRef v100;
  __CFDictionary *v101;
  id v102;
  int v103;
  CFNumberRef v104;
  NSObject *v105;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *key;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  __CFArray *theArray;
  id v126;
  id v127;
  id v128;
  id value;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  CFMutableDictionaryRef theDict;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  __int128 v145;
  __CFDictionary *v146;
  id v147;
  id v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t buf;
  __int16 v161;
  const char *v162;
  __int16 v163;
  id v164;
  __int16 v165;
  id v166;
  __int16 v167;
  id v168;
  __int16 v169;
  id v170;
  __int16 v171;
  id v172;
  __int16 v173;
  id v174;
  __int16 v175;
  id v176;
  __int16 v177;
  id v178;
  __int16 v179;
  id v180;
  __int16 v181;
  id v182;
  __int16 v183;
  id v184;
  __int16 v185;
  id v186;

  v147 = a1;
  v1 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v161 = 2082;
    v162 = "";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,createAppleSafetyAlertDict New\"}", (uint8_t *)&buf, 0x12u);
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("SafetyAlertMissingForHash")));
  if (v2)
  {
    v3 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        theDict = Mutable;
        CFDictionarySetValue(Mutable, CFSTR("SafetyAlertMissingForHash"), v2);
      }
      else
      {
        theDict = 0;
      }
      goto LABEL_395;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("uid")));
  if (v5 && (v6 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    value = v5;
  else
    value = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("session_id")));
  if (v7 && (v8 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    v127 = v7;
  else
    v127 = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("categories")));
  if (v9 && (v10 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
    v139 = v9;
  else
    v139 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("urgency")));
  if (v11 && (v12 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    v135 = v11;
  else
    v135 = 0;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("severity")));
  if (v13 && (v14 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
    v134 = v13;
  else
    v134 = 0;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("certainty")));
  if (v15 && (v16 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v15, v16) & 1) != 0))
    v133 = v15;
  else
    v133 = 0;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("expires")));
  if (v17 && (v18 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v17, v18) & 1) != 0))
    v132 = v17;
  else
    v132 = 0;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("effective")));
  if (v19 && (v20 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v19, v20) & 1) != 0))
    v131 = v19;
  else
    v131 = 0;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("responseTypes")));
  if (v21 && (v22 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v21, v22) & 1) != 0))
    v137 = v21;
  else
    v137 = 0;

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("eventCode")));
  if (v23 && (v24 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v23, v24) & 1) != 0))
    v138 = v23;
  else
    v138 = 0;

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("type")));
  if (v25 && (v26 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v25, v26) & 1) != 0))
    v126 = v25;
  else
    v126 = 0;

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("geometry")));
  if (v27 && (v28 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v27, v28) & 1) != 0))
    v130 = v27;
  else
    v130 = 0;

  if (!value
    || (theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) == 0)
  {
    theDict = 0;
    goto LABEL_394;
  }
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKey:", CFSTR("info")));
  if (!v123 || (v29 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v123, v29) & 1) == 0))
  {
    CFRelease(theDict);
    theDict = 0;
    goto LABEL_393;
  }
  LODWORD(buf) = 1;
  v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
  if (v30)
  {
    CFDictionarySetValue(theDict, kAppleSafetyAlert_Status_Key, v30);
    CFRelease(v30);
  }
  LODWORD(buf) = 1;
  v31 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
  if (v31)
  {
    CFDictionarySetValue(theDict, kAppleSafetyAlert_MessageType_Key, v31);
    CFRelease(v31);
  }
  CFDictionarySetValue(theDict, kAppleSafetyAlert_UniqueID_Key, value);
  if (v127)
    CFDictionarySetValue(theDict, kAppleSafetyAlert_SessionID_Key, v127);
  v32 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68292099;
    v161 = 2082;
    v162 = "";
    v163 = 2113;
    v164 = v127;
    v165 = 2113;
    v166 = v139;
    v167 = 2113;
    v168 = v135;
    v169 = 2113;
    v170 = v132;
    v171 = 2113;
    v172 = v131;
    v173 = 2113;
    v174 = v137;
    v175 = 2113;
    v176 = v133;
    v177 = 2113;
    v178 = v134;
    v179 = 2113;
    v180 = value;
    v181 = 2113;
    v182 = v126;
    v183 = 2113;
    v184 = v138;
    v185 = 2113;
    v186 = v130;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,rootKvPair\", \"session_id\":%{private, location:escape_only}@, \"category\":%{private, location:escape_only}@, \"urgency\":%{private, location:escape_only}@, \"expires\":%{private, location:escape_only}@, \"effective\":%{private, location:escape_only}@, \"responseType\":%{private, location:escape_only}@, \"certainty\":%{private, location:escape_only}@, \"severity\":%{private, location:escape_only}@, \"uid\":%{private, location:escape_only}@, \"type\":%{private, location:escape_only}@, \"eventCode\":%{private, location:escape_only}@, \"geometry\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x8Au);
  }

  v148 = v123;
  v33 = objc_msgSend(v148, "count");
  if (!v33)
  {
    CFRelease(theDict);
LABEL_391:
    theDict = 0;
    goto LABEL_392;
  }
  v128 = v33;
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
  v34 = 0;
  v113 = (void *)kAppleSafetyAlert_Urgency_Key;
  key = (void *)kAppleSafetyAlert_Language_Key;
  v111 = (void *)kAppleSafetyAlert_Certainty_Key;
  v112 = (void *)kAppleSafetyAlert_Severity_Key;
  v122 = (void *)kAppleSafetyAlert_Area_Key;
  v120 = (void *)kAppleSafetyAlert_Description_Key;
  v121 = (void *)kAppleSafetyAlert_Headline_Key;
  v119 = (void *)kAppleSafetyAlert_Instruction_Key;
  v118 = (void *)kAppleSafetyAlert_ExpiryTimestamp_Key;
  v117 = (void *)kAppleSafetyAlert_EffectiveTimestamp_Key;
  v109 = (void *)kAppleSafetyAlert_Category_Key;
  v107 = (void *)kAppleSafetyAlert_EventCode_Key;
  v108 = (void *)kAppleSafetyAlert_ResponseCode_Key;
  v110 = (void *)kAppleSafetyAlert_WeaHandlingType_Key;
  v115 = (void *)kAppleSafetyAlert_CmamLongText_Key;
  v116 = (void *)kAppleSafetyAlert_CmamText_Key;
  v124 = (void *)kAppleSafetyAlert_Parameters_Key;
  do
  {
    v149 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectAtIndexedSubscript:", v107));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("language")));

    if (v36 && (v37 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v36, v37) & 1) != 0))
      v144 = v36;
    else
      v144 = 0;

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectAtIndexedSubscript:", v149));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("headline")));

    if (v39 && (v40 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v39, v40) & 1) != 0))
      v140 = v39;
    else
      v140 = 0;

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectAtIndexedSubscript:", v149));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("description")));

    if (v42 && (v43 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v42, v43) & 1) != 0))
      v141 = v42;
    else
      v141 = 0;

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectAtIndexedSubscript:", v149));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("instruction")));

    if (v45 && (v46 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v45, v46) & 1) != 0))
      v142 = v45;
    else
      v142 = 0;

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectAtIndexedSubscript:", v149));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKey:", CFSTR("WEAHandling")));

    if (v48 && (v49 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v48, v49) & 1) != 0))
      v143 = v48;
    else
      v143 = 0;

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectAtIndexedSubscript:", v149));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", CFSTR("CMAMtext")));

    if (v51 && (v52 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v51, v52) & 1) != 0))
      *((_QWORD *)&v145 + 1) = v51;
    else
      *((_QWORD *)&v145 + 1) = 0;

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectAtIndexedSubscript:", v149));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("CMAMlongtext")));

    if (v54 && (v55 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v54, v55) & 1) != 0))
      *(_QWORD *)&v145 = v54;
    else
      *(_QWORD *)&v145 = 0;

    v56 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68290819;
      v161 = 2082;
      v162 = "";
      v163 = 2113;
      v164 = v144;
      v165 = 2113;
      v166 = v140;
      v167 = 2113;
      v168 = v141;
      v169 = 2113;
      v170 = v142;
      v171 = 2113;
      v172 = v143;
      v173 = 2113;
      v174 = (id)*((_QWORD *)&v145 + 1);
      v175 = 2113;
      v176 = (id)v145;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,infoKvPair\", \"language\":%{private, location:escape_only}@, \"headline\":%{private, location:escape_only}@, \"description\":%{private, location:escape_only}@, \"instruction\":%{private, location:escape_only}@, \"wea_handling\":%{private, location:escape_only}@, \"cmam_text\":%{private, location:escape_only}@, \"cmam_long_text\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x58u);
    }

    if (v145 != 0)
    {
      if (!*((_QWORD *)&v145 + 1))
      {
        v57 = (id)SALogObjectGeneral;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289026;
          v161 = 2082;
          v162 = "";
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,#warning,noCmamTextPresent\"}", (uint8_t *)&buf, 0x12u);
        }

        *((_QWORD *)&v145 + 1) = (id)v145;
      }
      if (!(_QWORD)v145)
      {
        v58 = (id)SALogObjectGeneral;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          buf = 68289026;
          v161 = 2082;
          v162 = "";
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,#warning,noCmamLongTextPresent\"}", (uint8_t *)&buf, 0x12u);
        }

        *(_QWORD *)&v145 = *((id *)&v145 + 1);
      }
      v146 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v144)
      {
        LODWORD(buf) = 0;
        LODWORD(buf) = sub_1000A0844(v144);
        v59 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v59)
        {
          CFDictionarySetValue(v146, key, v59);
          CFRelease(v59);
        }
      }
      if (v135)
      {
        LODWORD(buf) = 0;
        v60 = v135;
        if ((objc_msgSend(v60, "isEqualToString:", CFSTR("Immediate")) & 1) != 0)
        {
          v61 = 1;
        }
        else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("Expected")) & 1) != 0)
        {
          v61 = 2;
        }
        else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("Future")) & 1) != 0)
        {
          v61 = 3;
        }
        else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("Past")) & 1) != 0)
        {
          v61 = 4;
        }
        else
        {
          v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("Unknown")) ? 5 : 0;
        }

        LODWORD(buf) = v61;
        v64 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v64)
        {
          CFDictionarySetValue(v146, v113, v64);
          CFRelease(v64);
        }
      }
      if (v134)
      {
        LODWORD(buf) = 0;
        v65 = v134;
        if ((objc_msgSend(v65, "isEqualToString:", CFSTR("Extreme")) & 1) != 0)
        {
          v66 = 1;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("Severe")) & 1) != 0)
        {
          v66 = 2;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("Moderate")) & 1) != 0)
        {
          v66 = 3;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("Minor")) & 1) != 0)
        {
          v66 = 4;
        }
        else
        {
          v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("Unknown")) ? 5 : 0;
        }

        LODWORD(buf) = v66;
        v67 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v67)
        {
          CFDictionarySetValue(v146, v112, v67);
          CFRelease(v67);
        }
      }
      if (v133)
      {
        LODWORD(buf) = 0;
        v68 = v133;
        if ((objc_msgSend(v68, "isEqualToString:", CFSTR("Observed")) & 1) != 0)
        {
          v69 = 1;
        }
        else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("Likely")) & 1) != 0)
        {
          v69 = 2;
        }
        else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("Possible")) & 1) != 0)
        {
          v69 = 3;
        }
        else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("Unlikely")) & 1) != 0)
        {
          v69 = 4;
        }
        else
        {
          v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("Unknown")) ? 5 : 0;
        }

        LODWORD(buf) = v69;
        v70 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v70)
        {
          CFDictionarySetValue(v146, v111, v70);
          CFRelease(v70);
        }
      }
      if (v130)
        CFDictionarySetValue(v146, v122, v130);
      if (v140)
        CFDictionarySetValue(v146, v121, v140);
      if (v141)
        CFDictionarySetValue(v146, v120, v141);
      if (v142)
        CFDictionarySetValue(v146, v119, v142);
      if (v132)
        CFDictionarySetValue(v146, v118, v132);
      if (v131)
        CFDictionarySetValue(v146, v117, v131);
      if (!v138)
        goto LABEL_198;
      v71 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v138, v71) & 1) == 0)
        goto LABEL_198;
      v72 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      LODWORD(buf) = 0;
      v73 = v138;
      if ((objc_msgSend(v73, "isEqualToString:", CFSTR("ADR")) & 1) != 0)
      {
        v74 = 1;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("AVA")) & 1) != 0)
      {
        v74 = 2;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("AVW")) & 1) != 0)
      {
        v74 = 3;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("BLU")) & 1) != 0)
      {
        v74 = 4;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("BZW")) & 1) != 0)
      {
        v74 = 5;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("CAE")) & 1) != 0)
      {
        v74 = 6;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("CDW")) & 1) != 0)
      {
        v74 = 7;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("CEM")) & 1) != 0)
      {
        v74 = 8;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("CFW")) & 1) != 0)
      {
        v74 = 9;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("DMO")) & 1) != 0
             || (objc_msgSend(v73, "isEqualToString:", CFSTR("DMO")) & 1) != 0)
      {
        v74 = 10;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("DSW")) & 1) != 0)
      {
        v74 = 11;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("EAN")) & 1) != 0)
      {
        v74 = 12;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("EQW")) & 1) != 0)
      {
        v74 = 13;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("EVI")) & 1) != 0)
      {
        v74 = 14;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("FFW")) & 1) != 0)
      {
        v74 = 15;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("FLW")) & 1) != 0)
      {
        v74 = 16;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("FRW")) & 1) != 0)
      {
        v74 = 17;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("HMW")) & 1) != 0)
      {
        v74 = 18;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("HUW")) & 1) != 0)
      {
        v74 = 19;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("HWW")) & 1) != 0)
      {
        v74 = 20;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("LEW")) & 1) != 0)
      {
        v74 = 21;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("LAE")) & 1) != 0)
      {
        v74 = 22;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("NIC")) & 1) != 0)
      {
        v74 = 23;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("NMN")) & 1) != 0)
      {
        v74 = 24;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("NPT")) & 1) != 0)
      {
        v74 = 25;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("NUW")) & 1) != 0)
      {
        v74 = 26;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("RHW")) & 1) != 0)
      {
        v74 = 27;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("RMT")) & 1) != 0)
      {
        v74 = 28;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("RWT")) & 1) != 0)
      {
        v74 = 29;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("SPW")) & 1) != 0)
      {
        v74 = 30;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("SVR")) & 1) != 0)
      {
        v74 = 31;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("SMW")) & 1) != 0)
      {
        v74 = 32;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("TOE")) & 1) != 0)
      {
        v74 = 33;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("TOR")) & 1) != 0)
      {
        v74 = 34;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("TRW")) & 1) != 0)
      {
        v74 = 35;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("TSW")) & 1) != 0)
      {
        v74 = 36;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("VOW")) & 1) != 0)
      {
        v74 = 37;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("WSW")) & 1) != 0)
      {
        v74 = 38;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("EWW")) & 1) != 0)
      {
        v74 = 39;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("FFA")) & 1) != 0)
      {
        v74 = 40;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("FLA")) & 1) != 0)
      {
        v74 = 41;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("FFS")) & 1) != 0)
      {
        v74 = 42;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("HUA")) & 1) != 0)
      {
        v74 = 43;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("NWS")) & 1) != 0)
      {
        v74 = 44;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("SSA")) & 1) != 0)
      {
        v74 = 45;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("SSW")) & 1) != 0)
      {
        v74 = 46;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("SVS")) & 1) != 0)
      {
        v74 = 47;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("SPS")) & 1) != 0)
      {
        v74 = 48;
      }
      else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("TOA")) & 1) != 0)
      {
        v74 = 49;
      }
      else if (objc_msgSend(v73, "isEqualToString:", CFSTR("TRA")))
      {
        v74 = 50;
      }
      else
      {
        v74 = 0;
      }

      LODWORD(buf) = v74;
      v75 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
      v76 = v75;
      if (v72 && v75)
      {
        CFArrayAppendValue(v72, v75);
        CFDictionarySetValue(v146, v107, v72);
      }
      else if (!v75)
      {
        goto LABEL_196;
      }
      CFRelease(v76);
LABEL_196:
      if (v72)
        CFRelease(v72);
LABEL_198:
      if (v139)
      {
        v77 = objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v139, v77) & 1) != 0)
        {
          v78 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          v156 = 0u;
          v157 = 0u;
          v154 = 0u;
          v155 = 0u;
          v79 = v139;
          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v154, v159, 16);
          if (v80)
          {
            v81 = *(_QWORD *)v155;
            do
            {
              for (i = 0; i != v80; i = (char *)i + 1)
              {
                if (*(_QWORD *)v155 != v81)
                  objc_enumerationMutation(v79);
                v83 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)i);
                if (v83)
                {
                  v84 = objc_opt_class(NSString);
                  if ((objc_opt_isKindOfClass(v83, v84) & 1) != 0)
                  {
                    v85 = v83;
                    LODWORD(buf) = 0;
                    v86 = v85;
                    if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Geo")) & 1) != 0)
                    {
                      v87 = 1;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Met")) & 1) != 0)
                    {
                      v87 = 2;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Safety")) & 1) != 0)
                    {
                      v87 = 3;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Security")) & 1) != 0)
                    {
                      v87 = 4;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Rescue")) & 1) != 0)
                    {
                      v87 = 5;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Fire")) & 1) != 0)
                    {
                      v87 = 6;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Health")) & 1) != 0)
                    {
                      v87 = 7;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Env")) & 1) != 0)
                    {
                      v87 = 8;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Transport")) & 1) != 0)
                    {
                      v87 = 9;
                    }
                    else if ((objc_msgSend(v86, "isEqualToString:", CFSTR("Infra")) & 1) != 0)
                    {
                      v87 = 10;
                    }
                    else if (objc_msgSend(v86, "isEqualToString:", CFSTR("CBRNE")))
                    {
                      v87 = 11;
                    }
                    else
                    {
                      v87 = 0;
                    }

                    LODWORD(buf) = v87;
                    v88 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
                    if (v88)
                    {
                      CFArrayAppendValue(v78, v88);
                      CFRelease(v88);
                    }

                  }
                }
              }
              v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v154, v159, 16);
            }
            while (v80);
          }

          CFDictionarySetValue(v146, v109, v78);
          if (v78)
            CFRelease(v78);
        }
      }
      if (v137)
      {
        v89 = objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v137, v89) & 1) != 0)
        {
          v90 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          v152 = 0u;
          v153 = 0u;
          v150 = 0u;
          v151 = 0u;
          v91 = v137;
          v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v150, v158, 16);
          if (v92)
          {
            v93 = *(_QWORD *)v151;
            do
            {
              for (j = 0; j != v92; j = (char *)j + 1)
              {
                if (*(_QWORD *)v151 != v93)
                  objc_enumerationMutation(v91);
                v95 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)j);
                if (v95)
                {
                  v96 = objc_opt_class(NSString);
                  if ((objc_opt_isKindOfClass(v95, v96) & 1) != 0)
                  {
                    v97 = v95;
                    LODWORD(buf) = 0;
                    v98 = v97;
                    if ((objc_msgSend(v98, "isEqualToString:", CFSTR("Shelter")) & 1) != 0)
                    {
                      v99 = 1;
                    }
                    else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("Evacuate")) & 1) != 0)
                    {
                      v99 = 2;
                    }
                    else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("Prepare")) & 1) != 0)
                    {
                      v99 = 3;
                    }
                    else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("Execute")) & 1) != 0)
                    {
                      v99 = 4;
                    }
                    else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("Avoid")) & 1) != 0)
                    {
                      v99 = 5;
                    }
                    else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("Monitor")) & 1) != 0)
                    {
                      v99 = 6;
                    }
                    else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("Assess")) & 1) != 0)
                    {
                      v99 = 7;
                    }
                    else if ((objc_msgSend(v98, "isEqualToString:", CFSTR("AllClear")) & 1) != 0)
                    {
                      v99 = 8;
                    }
                    else if (objc_msgSend(v98, "isEqualToString:", CFSTR("None")))
                    {
                      v99 = 9;
                    }
                    else
                    {
                      v99 = 0;
                    }

                    LODWORD(buf) = v99;
                    v100 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
                    if (v100)
                    {
                      CFArrayAppendValue(v90, v100);
                      CFRelease(v100);
                    }

                  }
                }
              }
              v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v150, v158, 16);
            }
            while (v92);
          }

          CFDictionarySetValue(v146, v108, v90);
          if (v90)
            CFRelease(v90);
        }
      }
      v101 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v143)
      {
        LODWORD(buf) = 0;
        v102 = v143;
        if ((objc_msgSend(v102, "isEqualToString:", CFSTR("Presidential")) & 1) != 0)
        {
          v103 = 1;
        }
        else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("Amber")) & 1) != 0)
        {
          v103 = 2;
        }
        else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("Imminent Threat")) & 1) != 0)
        {
          v103 = 3;
        }
        else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("Earthquake")) & 1) != 0)
        {
          v103 = 4;
        }
        else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("Public Safety")) & 1) != 0)
        {
          v103 = 5;
        }
        else
        {
          v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("WEA Test")) ? 6 : 0;
        }

        LODWORD(buf) = v103;
        v104 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &buf);
        if (v104)
        {
          CFDictionarySetValue(v101, v110, v104);
          CFRelease(v104);
        }
      }
      if (*((_QWORD *)&v145 + 1))
        CFDictionarySetValue(v101, v116, *((const void **)&v145 + 1));
      if ((_QWORD)v145)
        CFDictionarySetValue(v101, v115, (const void *)v145);
      CFDictionarySetValue(v146, v124, v101);
      if (v101)
        CFRelease(v101);
      CFArrayAppendValue(theArray, v146);
      if (v146)
        CFRelease(v146);
      v63 = (void *)v145;
      goto LABEL_297;
    }
    v62 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v161 = 2082;
      v162 = "";
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,#warning,noCmamPresent,droppingInfoBlock\"}", (uint8_t *)&buf, 0x12u);
    }

    *((_QWORD *)&v145 + 1) = 0;
    v63 = 0;
LABEL_297:

    v34 = v149 + 1;
  }
  while ((id)(v149 + 1) != v128);
  if (!-[__CFArray count](theArray, "count"))
  {
    v105 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v161 = 2082;
      v162 = "";
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,#telephony,warning,noInfoBlocksPresent,droppingAlert\"}", (uint8_t *)&buf, 0x12u);
    }

    if (theArray)
      CFRelease(theArray);
    goto LABEL_391;
  }
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Info_Key, theArray);
  if (theArray)
    CFRelease(theArray);
LABEL_392:

LABEL_393:
LABEL_394:

  v2 = 0;
LABEL_395:

  return theDict;
}

void sub_1000A0384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,uint64_t a42,void *a43,void *a44,void *a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *a54)
{

  _Unwind_Resume(a1);
}

uint64_t sub_1000A0844(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("en-US")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("es-US")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1000A08A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SACoreTelephonyProd::isAdditionalDetailsPresent(SACoreTelephonyProd *this, const NSDictionary *a2)
{
  SACoreTelephonyProd *v2;
  SACoreTelephonyProd *v3;
  void *v4;
  uint64_t v5;
  id v6;
  char *v7;
  char *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  int v19;
  __int16 v20;
  const char *v21;

  v2 = this;
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreTelephonyProd objectForKey:](v2, "objectForKey:", CFSTR("info")));
    if (v4 && (v5 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
    {
      v6 = v4;
      v7 = (char *)objc_msgSend(v6, "count");
      if (v7)
      {
        v8 = 0;
        v9 = 0;
        do
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("instruction")));

          if (v11 && (v12 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
            v13 = v11;
          else
            v13 = 0;

          v9 |= v13 != 0;
          ++v8;
        }
        while (v7 != v8);
      }
      else
      {
        v16 = SALogObjectGeneral;
        v9 = 0;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 68289026;
          v19 = 0;
          v20 = 2082;
          v21 = "";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isAddlDetailsPresent,infoCountInvalid\"}", (uint8_t *)&v18, 0x12u);
          v9 = 0;
        }
      }

    }
    else
    {
      v14 = SALogObjectGeneral;
      v9 = 0;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 68289026;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isAddlDetailsPresent,infoMissing\"}", (uint8_t *)&v18, 0x12u);
        v9 = 0;
      }
    }

  }
  else
  {
    v15 = SALogObjectGeneral;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 68289026;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isAddlDetailsPresent,invalidDictionary\"}", (uint8_t *)&v18, 0x12u);
      v9 = 0;
    }
  }

  return v9 & 1;
}

void sub_1000A0B5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL sub_1000A0BA8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  CFMutableDictionaryRef v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  unsigned __int8 v24;
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;

  v3 = a2;
  if (v3)
  {
    v25 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 0, &v25));
    v5 = v25;
    v6 = v5;
    v7 = v4 != 0;
    if (!v4)
    {
      v21 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,null jsonData\"}", buf, 0x12u);
      }
      goto LABEL_19;
    }
    v23 = v5;
    v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v9, 0, 0));
    v11 = sub_10009E52C(v10);
    v24 = 0;
    if (!v11)
    {
      v12 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,invalid rootDict\"}", buf, 0x12u);
      }
    }
    v13 = _CTServerConnectionSendAppleSafetyAlert(*(_QWORD *)(a1 + 176), v11, &v24);
    v14 = v24;
    v15 = SALogObjectGeneral;
    v16 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v17 = "{\"msg%{public}.0s\":\"#ctsa,SafetyAlert sent successfully \"}";
        v18 = v15;
        v19 = 18;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 68289538;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 1026;
      v31 = v13;
      v32 = 1026;
      v33 = HIDWORD(v13);
      v17 = "{\"msg%{public}.0s\":\"#ctsa,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{public}d}";
      v18 = v15;
      v19 = 30;
      goto LABEL_15;
    }
    if (v11)
      CFRelease(v11);

    v6 = v23;
LABEL_19:

    goto LABEL_20;
  }
  v20 = SALogObjectGeneral;
  v7 = 0;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,null alert\"}", buf, 0x12u);
    v7 = 0;
  }
LABEL_20:

  return v7;
}

void sub_1000A0F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1000A0F5C(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  NSObject *v4;
  int EnhancedDeliveryState;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v2 = objc_autoreleasePoolPush();
  v3 = *(uint64_t **)(a1 + 32);
  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCellBroadcastSwitchChangedNotificationCb\"}", (uint8_t *)v6, 0x12u);
  }
  EnhancedDeliveryState = SACoreTelephony::getEnhancedDeliveryState((uint64_t)v3, v3[22]);
  SACoreTelephony::onEnhanceDeliveryStateChange((SACoreTelephony *)v3, EnhancedDeliveryState);
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_1000A1040(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v15;
  NSObject *v16;
  void **v17;
  const char *v18;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  char *v25;
  const char *v26;
  BOOL v27;
  char *v28;
  void **v29;
  BOOL v30;
  char *v31;
  uint64_t v32;
  int v33;
  uint8_t *v34;
  size_t v35;
  uint8_t *v36;
  size_t v37;
  __int128 *v38;
  size_t v39;
  BOOL v40;
  BOOL v41;
  uint64_t v42;
  int v43;
  uint8_t *v44;
  size_t v45;
  uint8_t *v46;
  size_t v47;
  char *v48;
  size_t v49;
  BOOL v50;
  BOOL v51;
  void *v52;
  int v53;
  uint8_t *v54;
  size_t v55;
  uint8_t *v56;
  void *v57;
  void **v58;
  size_t v59;
  BOOL v60;
  BOOL v61;
  SACommonUtils *v62;
  char isLivabiltyEnabled;
  void *__p[2];
  char v65;
  uint8_t v66[8];
  _BYTE v67[10];
  __int16 v68;
  void **v69;
  __int16 v70;
  char *v71;
  __int16 v72;
  char *v73;
  __int16 v74;
  char *v75;
  _BYTE buf[32];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81[6];
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  unint64_t v87;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("alert")));
    if (v4 && (v5 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
      v6 = v4;
    else
      v6 = 0;

    v7 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2113;
      *(_QWORD *)&buf[20] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert,IgneousInformation\", \"jsondict\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("source")));
      if (v8)
      {
        v9 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          v82 = 0u;
          memset(v81, 0, sizeof(v81));
          v79 = 0u;
          v80 = 0u;
          v78 = 0u;
          v77 = 0u;
          memset(buf, 0, sizeof(buf));
          __asm { FMOV            V0.2D, #10.0 }
          v84 = _Q0;
          __asm { FMOV            V0.2D, #-1.0 }
          v85 = _Q0;
          v86 = _Q0;
          v83 = 0;
          v87 = 0xBFF0000000000000;
          v15 = sub_1000687EC();
          sub_10002AEE8((uint64_t)v15, (std::string *)buf);
          v16 = (id)SALogObjectGeneral;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            sub_10000E8A0(__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
            v17 = v65 >= 0 ? __p : (void **)__p[0];
            if (SBYTE7(v79) < 0)
            {
              v18 = (const char *)v78;
              _ZF = *((_QWORD *)&v78 + 1) == 0;
            }
            else
            {
              v18 = (const char *)&v78;
              _ZF = SBYTE7(v79) == 0;
            }
            v25 = _ZF ? "" : (char *)v18;
            if (SHIBYTE(v80) < 0)
            {
              v26 = (const char *)*((_QWORD *)&v79 + 1);
              v27 = (_QWORD)v80 == 0;
            }
            else
            {
              v26 = (char *)&v79 + 8;
              v27 = SHIBYTE(v80) == 0;
            }
            v28 = v27 ? "" : (char *)v26;
            if (SHIBYTE(v81[2]) < 0)
            {
              v29 = (void **)v81[0];
              v30 = v81[1] == 0;
            }
            else
            {
              v29 = v81;
              v30 = SHIBYTE(v81[2]) == 0;
            }
            v31 = v30 ? "" : (char *)v29;
            *(_DWORD *)v66 = 68290051;
            *(_DWORD *)&v66[4] = 0;
            *(_WORD *)v67 = 2082;
            *(_QWORD *)&v67[2] = "";
            v68 = 2081;
            v69 = v17;
            v70 = 2081;
            v71 = v25;
            v72 = 2081;
            v73 = v28;
            v74 = 2081;
            v75 = v31;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert\", \"source\":%{private, location:escape_only}s, \"MASource\":%{private, location:escape_only}s, \"MATestSource\":%{private, location:escape_only}s, \"MAFollowUpSource\":%{private, location:escape_only}s}", v66, 0x3Au);
            if (v65 < 0)
              operator delete(__p[0]);
          }

          v32 = BYTE7(v79);
          if (SBYTE7(v79) < 0)
            v32 = *((_QWORD *)&v78 + 1);
          if (!v32)
            goto LABEL_71;
          sub_10000E8A0(v66, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
          v33 = SBYTE3(v69);
          v34 = *(uint8_t **)v66;
          if (SBYTE3(v69) >= 0)
            v35 = BYTE3(v69);
          else
            v35 = *(_QWORD *)v67;
          if (SBYTE3(v69) >= 0)
            v36 = v66;
          else
            v36 = *(uint8_t **)v66;
          if ((SBYTE7(v79) & 0x80u) == 0)
            v37 = BYTE7(v79);
          else
            v37 = *((_QWORD *)&v78 + 1);
          if ((SBYTE7(v79) & 0x80u) == 0)
            v38 = &v78;
          else
            v38 = (__int128 *)v78;
          if (v37 >= v35)
            v39 = v35;
          else
            v39 = v37;
          v40 = memcmp(v36, v38, v39) == 0;
          v41 = v37 == v35 && v40;
          if (v33 < 0)
            operator delete(v34);
          if (v41)
          {
            v21 = 1;
          }
          else
          {
LABEL_71:
            v42 = HIBYTE(v80);
            if (v80 < 0)
              v42 = v80;
            if (!v42)
              goto LABEL_96;
            sub_10000E8A0(v66, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
            v43 = SBYTE3(v69);
            v44 = *(uint8_t **)v66;
            if (SBYTE3(v69) >= 0)
              v45 = BYTE3(v69);
            else
              v45 = *(_QWORD *)v67;
            if (SBYTE3(v69) >= 0)
              v46 = v66;
            else
              v46 = *(uint8_t **)v66;
            if (v80 >= 0)
              v47 = HIBYTE(v80);
            else
              v47 = v80;
            if (v80 >= 0)
              v48 = (char *)&v79 + 8;
            else
              v48 = (char *)*((_QWORD *)&v79 + 1);
            if (v47 >= v45)
              v49 = v45;
            else
              v49 = v47;
            v50 = memcmp(v46, v48, v49) == 0;
            v51 = v47 == v45 && v50;
            if (v43 < 0)
              operator delete(v44);
            if (v51)
            {
              v21 = 2;
            }
            else
            {
LABEL_96:
              v52 = (void *)HIBYTE(v81[2]);
              if (SHIBYTE(v81[2]) < 0)
                v52 = v81[1];
              if (!v52)
                goto LABEL_121;
              sub_10000E8A0(v66, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
              v53 = SBYTE3(v69);
              v54 = *(uint8_t **)v66;
              if (SBYTE3(v69) >= 0)
                v55 = BYTE3(v69);
              else
                v55 = *(_QWORD *)v67;
              if (SBYTE3(v69) >= 0)
                v56 = v66;
              else
                v56 = *(uint8_t **)v66;
              if (SHIBYTE(v81[2]) >= 0)
                v57 = (void *)HIBYTE(v81[2]);
              else
                v57 = v81[1];
              if (SHIBYTE(v81[2]) >= 0)
                v58 = v81;
              else
                v58 = (void **)v81[0];
              if ((unint64_t)v57 >= v55)
                v59 = v55;
              else
                v59 = (size_t)v57;
              v60 = memcmp(v56, v58, v59) == 0;
              v61 = v57 == (void *)v55 && v60;
              if (v53 < 0)
                operator delete(v54);
              if (!v61)
              {
LABEL_121:
                sub_10000E8A0(v66, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
                v62 = (SACommonUtils *)std::string::compare((const std::string *)v66, (const std::string::value_type *)objc_msgSend(CFSTR("USGSLivability"), "UTF8String"));
                if ((_DWORD)v62)
                {
                  if (SBYTE3(v69) < 0)
                    operator delete(*(void **)v66);
                }
                else
                {
                  isLivabiltyEnabled = SACommonUtils::isLivabiltyEnabled(v62);
                  if (SBYTE3(v69) < 0)
                    operator delete(*(void **)v66);
                  if ((isLivabiltyEnabled & 1) != 0)
                  {
                    v21 = 4;
                    goto LABEL_129;
                  }
                }
                v21 = 5;
                goto LABEL_129;
              }
              v21 = 3;
            }
          }
LABEL_129:
          *(_QWORD *)v66 = &v82;
          sub_100004EC0((void ***)v66);
          *(_QWORD *)v66 = &v81[3];
          sub_100004EC0((void ***)v66);
          if (SHIBYTE(v81[2]) < 0)
            operator delete(v81[0]);
          if (SHIBYTE(v80) < 0)
            operator delete(*((void **)&v79 + 1));
          if (SBYTE7(v79) < 0)
            operator delete((void *)v78);
          if (SHIBYTE(v77) < 0)
            operator delete(*(void **)&buf[24]);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);

          goto LABEL_26;
        }
      }

      v22 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        v23 = "{\"msg%{public}.0s\":\"#ctsa,source nil\"}";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x12u);
      }
    }
    else
    {
      v22 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        v23 = "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert,jsondict nil\"}";
        goto LABEL_24;
      }
    }
    v21 = 5;
LABEL_26:

    goto LABEL_27;
  }
  v20 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,isSaewAlert,null alert\"}", buf, 0x12u);
  }
  v21 = 5;
LABEL_27:

  return v21;
}

void sub_1000A171C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  void *v24;
  void *v25;
  void *v26;

  if (a18 < 0)
    operator delete(__p);
  sub_100032A34((uint64_t)&a24);

  _Unwind_Resume(a1);
}

uint64_t sub_1000A17A0(uint64_t a1, uint64_t a2)
{
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v5;
  void *v12;
  char v13;
  char v14;
  char v15;
  CFMutableArrayRef v16;
  void *v17;
  int v18;
  CFNumberRef v19;
  const char *v20;
  CFStringRef v21;
  const char *v22;
  CFStringRef v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  _BOOL4 v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v40;
  uint64_t v41;
  CFMutableDictionaryRef theDict;
  CFMutableDictionaryRef cf;
  int valuePtr;
  uint8_t buf[8];
  __int16 v46;
  const char *v47;
  __int16 v48;
  _BYTE v49[10];
  __int16 v50;
  CFMutableDictionaryRef v51;
  __int16 v52;
  CFMutableDictionaryRef v53;
  _BYTE v54[32];
  __int128 v55;
  void *__p[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[32];
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  unint64_t v66;

  cf = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    v32 = SALogObjectGeneral;
    v33 = 0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      return v33;
    *(_DWORD *)v54 = 68289026;
    *(_DWORD *)&v54[4] = 0;
    *(_WORD *)&v54[8] = 2082;
    *(_QWORD *)&v54[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,rootDict invalid\"}", v54, 0x12u);
    return 0;
  }
  theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    v34 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v54 = 68289026;
      *(_DWORD *)&v54[4] = 0;
      *(_WORD *)&v54[8] = 2082;
      *(_QWORD *)&v54[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,infoDictMain invalid\"}", v54, 0x12u);
    }
    CFRelease(cf);
    return 0;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    v35 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v54 = 68289026;
      *(_DWORD *)&v54[4] = 0;
      *(_WORD *)&v54[8] = 2082;
      *(_QWORD *)&v54[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,infoDict invalid\"}", v54, 0x12u);
    }
    CFRelease(theDict);
    CFRelease(cf);
    return 0;
  }
  v5 = Mutable;
  v40 = a1;
  v41 = a2;
  v62 = 0;
  v61 = 0u;
  v59 = 0u;
  memset(v60, 0, sizeof(v60));
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  *(_OWORD *)__p = 0u;
  memset(v54, 0, sizeof(v54));
  __asm { FMOV            V0.2D, #10.0 }
  v63 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  v64 = _Q0;
  v65 = _Q0;
  v66 = 0xBFF0000000000000;
  v12 = sub_1000687EC();
  sub_10002AEE8((uint64_t)v12, (std::string *)v54);
  v13 = 0;
  v14 = 1;
  do
  {
    v15 = v14;
    v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (!v16)
    {
      v36 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        v46 = 2082;
        v47 = "";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,infoDictList invalid\"}", buf, 0x12u);
      }
      CFRelease(v5);
      CFRelease(theDict);
      CFRelease(cf);
      goto LABEL_47;
    }
    valuePtr = 0;
    if ((v13 & 1) != 0)
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "es-US"));
    else
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "en-US"));
    v18 = sub_1000A0844(v17);

    valuePtr = v18;
    v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (!v19)
    {
      v37 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        v46 = 2082;
        v47 = "";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,item1 invalid\"}", buf, 0x12u);
      }
LABEL_46:
      CFRelease(v16);
      CFRelease(v5);
      CFRelease(theDict);
      CFRelease(cf);
LABEL_47:
      v33 = 0;
      goto LABEL_52;
    }
    CFArrayAppendValue(v16, v19);
    CFRelease(v19);
    if ((v13 & 1) != 0)
    {
      if (v55 >= 0)
        v20 = &v54[24];
      else
        v20 = *(const char **)&v54[24];
    }
    else if (v54[23] >= 0)
    {
      v20 = v54;
    }
    else
    {
      v20 = *(const char **)v54;
    }
    v21 = CFStringCreateWithCString(kCFAllocatorDefault, v20, 0x8000100u);
    if (!v21)
    {
      v38 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        v46 = 2082;
        v47 = "";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,item2 invalid\"}", buf, 0x12u);
      }
      goto LABEL_46;
    }
    CFArrayAppendValue(v16, v21);
    CFArrayAppendValue(v5, v16);
    CFRelease(v21);
    CFRelease(v16);
    v14 = 0;
    v13 = 1;
  }
  while ((v15 & 1) != 0);
  if (*(char *)(v41 + 23) >= 0)
    v22 = (const char *)v41;
  else
    v22 = *(const char **)v41;
  v23 = CFStringCreateWithCString(kCFAllocatorDefault, v22, 0x8000100u);
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_UniqueID_Key, v23);
  if (v23)
    CFRelease(v23);
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_Info_Key, v5);
  CFDictionarySetValue(cf, kAppleSafetyAlert_Trigger_Earthquake_Key, theDict);
  v24 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    v46 = 2082;
    v47 = "";
    v48 = 2113;
    *(_QWORD *)v49 = cf;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert\", \"rootDict\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  LOBYTE(valuePtr) = 0;
  v25 = _CTServerConnectionSendAppleSafetyAlert(*(_QWORD *)(v40 + 176), cf, &valuePtr);
  v26 = valuePtr;
  v27 = SALogObjectGeneral;
  v28 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v46 = 2082;
      v47 = "";
      v29 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert sent successfully \"}";
      v30 = v27;
      v31 = 18;
      goto LABEL_50;
    }
  }
  else if (v28)
  {
    *(_DWORD *)buf = 68290051;
    v46 = 2082;
    *(_DWORD *)&buf[4] = 0;
    v47 = "";
    v48 = 1026;
    *(_DWORD *)v49 = v25;
    *(_WORD *)&v49[4] = 1026;
    *(_DWORD *)&v49[6] = HIDWORD(v25);
    v50 = 2113;
    v51 = cf;
    v52 = 2113;
    v53 = theDict;
    v29 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousAlert,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{publ"
          "ic}d, \"rootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private, location:escape_only}@}";
    v30 = v27;
    v31 = 50;
LABEL_50:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
  }
  CFRelease(v5);
  CFRelease(theDict);
  CFRelease(cf);
  v33 = 1;
LABEL_52:
  *(_QWORD *)buf = &v61;
  sub_100004EC0((void ***)buf);
  *(_QWORD *)buf = &v60[8];
  sub_100004EC0((void ***)buf);
  if ((v60[7] & 0x80000000) != 0)
    operator delete((void *)v59);
  if (SHIBYTE(v58) < 0)
    operator delete(*((void **)&v57 + 1));
  if (SBYTE7(v57) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v55) < 0)
    operator delete(*(void **)&v54[24]);
  if ((v54[23] & 0x80000000) != 0)
    operator delete(*(void **)v54);
  return v33;
}

void sub_1000A1F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  sub_100032A34((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A1FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v14;
  std::string *v15;
  int v16;
  const std::string::value_type *v17;
  std::string::size_type v18;
  std::string *v19;
  __int128 v20;
  char v21;
  char v22;
  char v23;
  CFMutableArrayRef Mutable;
  void *v25;
  int v26;
  CFNumberRef v27;
  const char **v28;
  char *v29;
  const char *v30;
  CFStringRef v31;
  void **v32;
  CFStringRef v33;
  NSObject *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  _BOOL4 v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v50;
  CFMutableDictionaryRef theDict;
  CFMutableDictionaryRef cf;
  CFMutableArrayRef theArray;
  int valuePtr;
  void *__p[2];
  int64_t v56;
  _BYTE v57[32];
  __int128 v58;
  void *v59[2];
  void *v60[2];
  __int128 v61;
  __int128 v62;
  _BYTE v63[32];
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  unint64_t v69;
  void **buf;
  __int16 v71;
  const char *v72;
  __int16 v73;
  _BYTE v74[10];
  __int16 v75;
  CFMutableDictionaryRef v76;
  __int16 v77;
  CFMutableDictionaryRef v78;

  v65 = 0;
  v64 = 0u;
  v62 = 0u;
  memset(v63, 0, sizeof(v63));
  *(_OWORD *)v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  *(_OWORD *)v59 = 0u;
  memset(v57, 0, sizeof(v57));
  __asm { FMOV            V0.2D, #10.0 }
  v66 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  v67 = _Q0;
  v68 = _Q0;
  v69 = 0xBFF0000000000000;
  v14 = sub_1000687EC();
  sub_10002AEE8((uint64_t)v14, (std::string *)v57);
  cf = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    v42 = SALogObjectGeneral;
    v43 = 0;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_63;
    buf = (void **)68289026;
    v71 = 2082;
    v72 = "";
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,rootDict invalid\"}", (uint8_t *)&buf, 0x12u);
    goto LABEL_46;
  }
  theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    v44 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      buf = (void **)68289026;
      v71 = 2082;
      v72 = "";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,infoDictMain invalid\"}", (uint8_t *)&buf, 0x12u);
    }
    CFRelease(cf);
    goto LABEL_46;
  }
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!theArray)
  {
    v45 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      buf = (void **)68289026;
      v71 = 2082;
      v72 = "";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,infoDict invalid\"}", (uint8_t *)&buf, 0x12u);
    }
    CFRelease(theDict);
    CFRelease(cf);
LABEL_46:
    v43 = 0;
    goto LABEL_63;
  }
  v15 = (std::string *)sub_10000E8A0(&buf, (char *)objc_msgSend(CFSTR("FollowUp"), "UTF8String"));
  v16 = *(char *)(a2 + 23);
  if (v16 >= 0)
    v17 = (const std::string::value_type *)a2;
  else
    v17 = *(const std::string::value_type **)a2;
  if (v16 >= 0)
    v18 = *(unsigned __int8 *)(a2 + 23);
  else
    v18 = *(_QWORD *)(a2 + 8);
  v19 = std::string::insert(v15, 0, v17, v18);
  v50 = a1;
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v56 = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  if ((v74[3] & 0x80000000) != 0)
    operator delete(buf);
  v21 = 0;
  v22 = 1;
  do
  {
    v23 = v22;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (!Mutable)
    {
      v46 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = (void **)68289026;
        v71 = 2082;
        v72 = "";
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,infoDictList invalid\"}", (uint8_t *)&buf, 0x12u);
      }
      CFRelease(theArray);
      CFRelease(theDict);
      CFRelease(cf);
      goto LABEL_56;
    }
    valuePtr = 0;
    if ((v21 & 1) != 0)
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "es-US"));
    else
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "en-US"));
    v26 = sub_1000A0844(v25);

    valuePtr = v26;
    v27 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (!v27)
    {
      v47 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = (void **)68289026;
        v71 = 2082;
        v72 = "";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,item1 invalid\"}", (uint8_t *)&buf, 0x12u);
      }
LABEL_55:
      CFRelease(Mutable);
      CFRelease(theArray);
      CFRelease(theDict);
      CFRelease(cf);
LABEL_56:
      v43 = 0;
      goto LABEL_61;
    }
    CFArrayAppendValue(Mutable, v27);
    CFRelease(v27);
    if ((v21 & 1) != 0)
      v28 = (const char **)a4;
    else
      v28 = (const char **)a3;
    v29 = (char *)(a4 + 23);
    if ((v21 & 1) == 0)
      v29 = (char *)(a3 + 23);
    if (*v29 >= 0)
      v30 = (const char *)v28;
    else
      v30 = *v28;
    v31 = CFStringCreateWithCString(kCFAllocatorDefault, v30, 0x8000100u);
    if (!v31)
    {
      v48 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = (void **)68289026;
        v71 = 2082;
        v72 = "";
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert,item2 invalid\"}", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_55;
    }
    CFArrayAppendValue(Mutable, v31);
    CFArrayAppendValue(theArray, Mutable);
    CFRelease(v31);
    CFRelease(Mutable);
    v22 = 0;
    v21 = 1;
  }
  while ((v23 & 1) != 0);
  if (v56 >= 0)
    v32 = __p;
  else
    v32 = (void **)__p[0];
  v33 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v32, 0x8000100u);
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_UniqueID_Key, v33);
  if (v33)
    CFRelease(v33);
  CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_Info_Key, theArray);
  CFDictionarySetValue(cf, kAppleSafetyAlert_Trigger_Earthquake_Key, theDict);
  v34 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    buf = (void **)68289283;
    v71 = 2082;
    v72 = "";
    v73 = 2113;
    *(_QWORD *)v74 = cf;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert\", \"rootDict\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  LOBYTE(valuePtr) = 0;
  v35 = _CTServerConnectionSendAppleSafetyAlert(*(_QWORD *)(v50 + 176), cf, &valuePtr);
  v36 = valuePtr;
  v37 = SALogObjectGeneral;
  v38 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v36)
  {
    if (v38)
    {
      buf = (void **)68289026;
      v71 = 2082;
      v72 = "";
      v39 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousFollowUpAlert sent successfully \"}";
      v40 = v37;
      v41 = 18;
      goto LABEL_59;
    }
  }
  else if (v38)
  {
    buf = (void **)68290051;
    v71 = 2082;
    v72 = "";
    v73 = 1026;
    *(_DWORD *)v74 = v35;
    *(_WORD *)&v74[4] = 1026;
    *(_DWORD *)&v74[6] = HIDWORD(v35);
    v75 = 2113;
    v76 = cf;
    v77 = 2113;
    v78 = theDict;
    v39 = "{\"msg%{public}.0s\":\"#ctsa,Igneous,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{public}d, \"r"
          "ootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private, location:escape_only}@}";
    v40 = v37;
    v41 = 50;
LABEL_59:
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v39, (uint8_t *)&buf, v41);
  }
  CFRelease(theArray);
  CFRelease(theDict);
  CFRelease(cf);
  v43 = 1;
LABEL_61:
  if (SHIBYTE(v56) < 0)
    operator delete(__p[0]);
LABEL_63:
  buf = (void **)&v64;
  sub_100004EC0(&buf);
  buf = (void **)&v63[8];
  sub_100004EC0(&buf);
  if ((v63[7] & 0x80000000) != 0)
    operator delete((void *)v62);
  if (SHIBYTE(v61) < 0)
    operator delete(v60[1]);
  if (SHIBYTE(v60[0]) < 0)
    operator delete(v59[0]);
  if (SHIBYTE(v58) < 0)
    operator delete(*(void **)&v57[24]);
  if ((v57[23] & 0x80000000) != 0)
    operator delete(*(void **)v57);
  return v43;
}

void sub_1000A2800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22)
{
  if (a20 < 0)
    operator delete(__p);
  sub_100032A34((uint64_t)&a22);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A2894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v10;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v12;
  CFMutableArrayRef v13;
  char v14;
  char v15;
  CFMutableArrayRef v16;
  void *v17;
  int v18;
  CFNumberRef v19;
  const std::string::value_type *v20;
  std::string::size_type v21;
  std::string *v22;
  __int128 v23;
  std::string *v24;
  const std::string::value_type *v25;
  std::string::size_type v26;
  std::string *v27;
  __int128 v28;
  std::string::size_type v29;
  std::string *v31;
  const char *v32;
  CFStringRef v33;
  NSObject *v34;
  const char *v35;
  CFStringRef v36;
  NSObject *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  _BOOL4 v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v52;
  uint64_t v53;
  std::string v54;
  int valuePtr;
  _BYTE v56[32];
  __int128 v57;
  void *v58[2];
  void *v59[2];
  __int128 v60;
  void *__p[2];
  _OWORD v62[2];
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  unint64_t v68;
  _BYTE v69[30];
  __int16 v70;
  CFMutableDictionaryRef v71;
  __int16 v72;
  CFMutableDictionaryRef v73;
  uint8_t buf[8];
  __int16 v75;
  const char *v76;
  char v77;

  v63 = 0u;
  *(_OWORD *)__p = 0u;
  memset(v62, 0, sizeof(v62));
  *(_OWORD *)v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  *(_OWORD *)v58 = 0u;
  memset(v56, 0, sizeof(v56));
  __asm { FMOV            V0.2D, #10.0 }
  v65 = _Q0;
  __asm { FMOV            V0.2D, #-1.0 }
  v66 = _Q0;
  v67 = _Q0;
  v64 = 0;
  v68 = 0xBFF0000000000000;
  v10 = sub_1000687EC();
  sub_10002AEE8((uint64_t)v10, (std::string *)v56);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v12 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v12)
    {
      v13 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      if (v13)
      {
        v52 = a1;
        v53 = a3;
        v14 = 1;
        while (1)
        {
          v15 = v14;
          v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          if (!v16)
          {
            v49 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_QWORD *)v69 = 68289026;
              *(_WORD *)&v69[8] = 2082;
              *(_QWORD *)&v69[10] = "";
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,infoDictList invalid\"}", v69, 0x12u);
            }
            CFRelease(v13);
            CFRelease(v12);
            CFRelease(Mutable);
            goto LABEL_67;
          }
          valuePtr = 0;
          if ((v15 & 1) != 0)
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "en-US"));
          else
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "es-US"));
          v18 = sub_1000A0844(v17);

          valuePtr = v18;
          v19 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
          if (!v19)
          {
            v50 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_QWORD *)v69 = 68289026;
              *(_WORD *)&v69[8] = 2082;
              *(_QWORD *)&v69[10] = "";
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,item1 invalid\"}", v69, 0x12u);
            }
            CFRelease(v16);
            CFRelease(v13);
            CFRelease(v12);
            CFRelease(Mutable);
            goto LABEL_67;
          }
          CFArrayAppendValue(v16, v19);
          CFRelease(v19);
          sub_10000E8A0(&v54, (char *)objc_msgSend(CFSTR("APPLE SAFETY ALERTS LIVABILITY TEST:"), "UTF8String"));
          if (v56[23] >= 0)
            v20 = v56;
          else
            v20 = *(const std::string::value_type **)v56;
          if (v56[23] >= 0)
            v21 = v56[23];
          else
            v21 = *(_QWORD *)&v56[8];
          v22 = std::string::append(&v54, v20, v21);
          v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
          *(_QWORD *)&v69[16] = *((_QWORD *)&v22->__r_.__value_.__l + 2);
          *(_OWORD *)v69 = v23;
          v22->__r_.__value_.__l.__size_ = 0;
          v22->__r_.__value_.__r.__words[2] = 0;
          v22->__r_.__value_.__r.__words[0] = 0;
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v54.__r_.__value_.__l.__data_);
          v24 = (std::string *)sub_10000E8A0(buf, (char *)objc_msgSend(CFSTR("APPLE SAFETY ALERTS LIVABILITY TEST:"), "UTF8String", v52));
          if (v57 >= 0)
            v25 = &v56[24];
          else
            v25 = *(const std::string::value_type **)&v56[24];
          if (v57 >= 0)
            v26 = HIBYTE(v57);
          else
            v26 = v57;
          v27 = std::string::append(v24, v25, v26);
          v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
          v54.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v54.__r_.__value_.__l.__data_ = v28;
          v27->__r_.__value_.__l.__size_ = 0;
          v27->__r_.__value_.__r.__words[2] = 0;
          v27->__r_.__value_.__r.__words[0] = 0;
          if (v77 < 0)
          {
            operator delete(*(void **)buf);
            if ((v15 & 1) == 0)
            {
LABEL_28:
              v29 = v54.__r_.__value_.__r.__words[0];
              _NF = (v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
              v31 = &v54;
              goto LABEL_29;
            }
          }
          else if ((v15 & 1) == 0)
          {
            goto LABEL_28;
          }
          v29 = *(_QWORD *)v69;
          _NF = v69[23] < 0;
          v31 = (std::string *)v69;
LABEL_29:
          if (_NF)
            v32 = (const char *)v29;
          else
            v32 = (const char *)v31;
          v33 = CFStringCreateWithCString(kCFAllocatorDefault, v32, 0x8000100u);
          if (v33)
          {
            CFArrayAppendValue(v16, v33);
            CFArrayAppendValue(v13, v16);
            CFRelease(v33);
          }
          else
          {
            v34 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_QWORD *)buf = 68289026;
              v75 = 2082;
              v76 = "";
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,item2 invalid\"}", buf, 0x12u);
            }
            CFRelease(v16);
            CFRelease(v13);
            CFRelease(v12);
            v16 = Mutable;
          }
          CFRelease(v16);
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v54.__r_.__value_.__l.__data_);
          if ((v69[23] & 0x80000000) != 0)
            operator delete(*(void **)v69);
          if (!v33)
            goto LABEL_67;
          v14 = 0;
          if ((v15 & 1) == 0)
          {
            if (*(char *)(v53 + 31) >= 0)
              v35 = (const char *)(v53 + 8);
            else
              v35 = *(const char **)(v53 + 8);
            v36 = CFStringCreateWithCString(kCFAllocatorDefault, v35, 0x8000100u);
            CFDictionarySetValue(v12, kAppleSafetyAlert_Earthquake_UniqueID_Key, v36);
            if (v36)
              CFRelease(v36);
            CFDictionarySetValue(v12, kAppleSafetyAlert_Earthquake_Info_Key, v13);
            CFDictionarySetValue(Mutable, kAppleSafetyAlert_Trigger_Earthquake_Key, v12);
            v37 = SALogObjectGeneral;
            if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              *(_QWORD *)v69 = 68289283;
              *(_WORD *)&v69[8] = 2082;
              *(_QWORD *)&v69[10] = "";
              *(_WORD *)&v69[18] = 2113;
              *(_QWORD *)&v69[20] = Mutable;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert\", \"rootDict\":%{private, location:escape_only}@}", v69, 0x1Cu);
            }
            v54.__r_.__value_.__s.__data_[0] = 0;
            v38 = _CTServerConnectionSendAppleSafetyAlert(*(_QWORD *)(v52 + 176), Mutable, &v54);
            v39 = v54.__r_.__value_.__s.__data_[0];
            v40 = SALogObjectGeneral;
            v41 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
            if (v39)
            {
              if (v41)
              {
                *(_QWORD *)v69 = 68289026;
                *(_WORD *)&v69[8] = 2082;
                *(_QWORD *)&v69[10] = "";
                v42 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert sent successfully \"}";
                v43 = v40;
                v44 = 18;
                goto LABEL_81;
              }
            }
            else if (v41)
            {
              *(_QWORD *)v69 = 68290051;
              *(_WORD *)&v69[8] = 2082;
              *(_QWORD *)&v69[10] = "";
              *(_WORD *)&v69[18] = 1026;
              *(_DWORD *)&v69[20] = v38;
              *(_WORD *)&v69[24] = 1026;
              *(_DWORD *)&v69[26] = HIDWORD(v38);
              v70 = 2113;
              v71 = Mutable;
              v72 = 2113;
              v73 = v12;
              v42 = "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,didFailWithError\", \"errordomain\":%{public"
                    "}d, \"error\":%{public}d, \"rootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private"
                    ", location:escape_only}@}";
              v43 = v40;
              v44 = 50;
LABEL_81:
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v42, v69, v44);
            }
            CFRelease(v13);
            CFRelease(v12);
            CFRelease(Mutable);
            v46 = 1;
            goto LABEL_68;
          }
        }
      }
      v48 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)v69 = 68289026;
        *(_WORD *)&v69[8] = 2082;
        *(_QWORD *)&v69[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,infoDict invalid\"}", v69, 0x12u);
      }
      CFRelease(v12);
      CFRelease(Mutable);
    }
    else
    {
      v47 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)v69 = 68289026;
        *(_WORD *)&v69[8] = 2082;
        *(_QWORD *)&v69[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,infoDictMain invalid\"}", v69, 0x12u);
      }
      CFRelease(Mutable);
    }
LABEL_67:
    v46 = 0;
  }
  else
  {
    v45 = SALogObjectGeneral;
    v46 = 0;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v69 = 68289026;
      *(_WORD *)&v69[8] = 2082;
      *(_QWORD *)&v69[10] = "";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendIgneousLivabilityAlert,rootDict invalid\"}", v69, 0x12u);
      goto LABEL_67;
    }
  }
LABEL_68:
  *(_QWORD *)v69 = &v63;
  sub_100004EC0((void ***)v69);
  *(_QWORD *)v69 = (char *)v62 + 8;
  sub_100004EC0((void ***)v69);
  if (SBYTE7(v62[0]) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v60) < 0)
    operator delete(v59[1]);
  if (SHIBYTE(v59[0]) < 0)
    operator delete(v58[0]);
  if (SHIBYTE(v57) < 0)
    operator delete(*(void **)&v56[24]);
  if ((v56[23] & 0x80000000) != 0)
    operator delete(*(void **)v56);
  return v46;
}

void sub_1000A3150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  sub_100032A34((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A320C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v12;
  CFMutableDictionaryRef v13;
  char v14;
  char v15;
  char v16;
  __CFArray *v17;
  void *v18;
  int v19;
  CFNumberRef v20;
  _QWORD *v21;
  char *v22;
  const char *v23;
  CFStringRef v24;
  const char *v25;
  CFStringRef v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  _BOOL4 v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t result;
  const char *v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  __CFDictionary *v43;
  __CFDictionary *theDict;
  __CFArray *theArray;
  int valuePtr;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  _BYTE v52[10];
  __int16 v53;
  __CFDictionary *v54;
  __int16 v55;
  __CFDictionary *v56;

  v4 = *(unsigned __int8 *)(a2 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(a2 + 8);
  if (!v4)
    goto LABEL_39;
  v6 = *(unsigned __int8 *)(a3 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a3 + 8);
  if (!v6)
    goto LABEL_39;
  v8 = *(unsigned __int8 *)(a4 + 23);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v12 = Mutable;
      v13 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v13)
      {
        theDict = v13;
        theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
        if (theArray)
        {
          v43 = v12;
          v14 = 0;
          v15 = 1;
          while (1)
          {
            v16 = v15;
            v17 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
            if (!v17)
            {
              v35 = SALogObjectGeneral;
              v42 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
              result = 0;
              if (!v42)
                return result;
              *(_DWORD *)buf = 68289026;
              v48 = 0;
              v49 = 2082;
              v50 = "";
              v38 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,infoDictList invalid\"}";
              goto LABEL_41;
            }
            valuePtr = 0;
            if ((v14 & 1) != 0)
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "es-US"));
            else
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "en-US"));
            v19 = sub_1000A0844(v18);

            valuePtr = v19;
            v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
            if (!v20)
            {
              v35 = SALogObjectGeneral;
              if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
                return 0;
              *(_DWORD *)buf = 68289026;
              v48 = 0;
              v49 = 2082;
              v50 = "";
              v38 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,item1 invalid\"}";
              goto LABEL_41;
            }
            CFArrayAppendValue(v17, v20);
            CFRelease(v20);
            if ((v14 & 1) != 0)
              v21 = (_QWORD *)a4;
            else
              v21 = (_QWORD *)a3;
            v22 = (char *)(a4 + 23);
            if ((v14 & 1) == 0)
              v22 = (char *)(a3 + 23);
            v23 = *v22 >= 0 ? (const char *)v21 : (const char *)*v21;
            v24 = CFStringCreateWithCString(kCFAllocatorDefault, v23, 0x8000100u);
            if (!v24)
              break;
            CFArrayAppendValue(v17, v24);
            CFArrayAppendValue(theArray, v17);
            CFRelease(v24);
            CFRelease(v17);
            v15 = 0;
            v14 = 1;
            if ((v16 & 1) == 0)
            {
              if (*(char *)(a2 + 23) >= 0)
                v25 = (const char *)a2;
              else
                v25 = *(const char **)a2;
              v26 = CFStringCreateWithCString(kCFAllocatorDefault, v25, 0x8000100u);
              CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_UniqueID_Key, v26);
              if (v26)
                CFRelease(v26);
              CFDictionarySetValue(theDict, kAppleSafetyAlert_Earthquake_Info_Key, theArray);
              CFDictionarySetValue(v43, kAppleSafetyAlert_Trigger_Earthquake_Key, theDict);
              v27 = SALogObjectGeneral;
              if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 68289283;
                v48 = 0;
                v49 = 2082;
                v50 = "";
                v51 = 2113;
                *(_QWORD *)v52 = v43;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert\", \"rootDict\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              LOBYTE(valuePtr) = 0;
              v28 = _CTServerConnectionSendAppleSafetyAlert(*(_QWORD *)(a1 + 176), v43, &valuePtr);
              v29 = valuePtr;
              v30 = SALogObjectGeneral;
              v31 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
              if (v29)
              {
                if (v31)
                {
                  *(_DWORD *)buf = 68289026;
                  v48 = 0;
                  v49 = 2082;
                  v50 = "";
                  v32 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert sent successfully \"}";
                  v33 = v30;
                  v34 = 18;
                  goto LABEL_58;
                }
              }
              else if (v31)
              {
                *(_DWORD *)buf = 68290051;
                v49 = 2082;
                v48 = 0;
                v50 = "";
                v51 = 1026;
                *(_DWORD *)v52 = v28;
                *(_WORD *)&v52[4] = 1026;
                *(_DWORD *)&v52[6] = HIDWORD(v28);
                v53 = 2113;
                v54 = v43;
                v55 = 2113;
                v56 = theDict;
                v32 = "{\"msg%{public}.0s\":\"#ctsa,Igneous,didFailWithError\", \"errordomain\":%{public}d, \"error\":%{p"
                      "ublic}d, \"rootDict\":%{private, location:escape_only}@, \"infoDictMain\":%{private, location:escape_only}@}";
                v33 = v30;
                v34 = 50;
LABEL_58:
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
              }
              return 1;
            }
          }
          v35 = SALogObjectGeneral;
          if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            return 0;
          *(_DWORD *)buf = 68289026;
          v48 = 0;
          v49 = 2082;
          v50 = "";
          v38 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,item2 invalid\"}";
        }
        else
        {
          v35 = SALogObjectGeneral;
          v41 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
          result = 0;
          if (!v41)
            return result;
          *(_DWORD *)buf = 68289026;
          v48 = 0;
          v49 = 2082;
          v50 = "";
          v38 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert,infoDict invalid\"}";
        }
      }
      else
      {
        v35 = SALogObjectGeneral;
        v40 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (!v40)
          return result;
        *(_DWORD *)buf = 68289026;
        v48 = 0;
        v49 = 2082;
        v50 = "";
        v38 = "{\"msg%{public}.0s\":\"#ctsa,infoDictMain invalid\"}";
      }
    }
    else
    {
      v35 = SALogObjectGeneral;
      v39 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v39)
        return result;
      *(_DWORD *)buf = 68289026;
      v48 = 0;
      v49 = 2082;
      v50 = "";
      v38 = "{\"msg%{public}.0s\":\"#ctsa,rootDict invalid\"}";
    }
  }
  else
  {
LABEL_39:
    v35 = SALogObjectGeneral;
    v36 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v36)
      return result;
    *(_DWORD *)buf = 68289026;
    v48 = 0;
    v49 = 2082;
    v50 = "";
    v38 = "{\"msg%{public}.0s\":\"#ctsa,displayIgneousBleAlert invalid data\"}";
  }
LABEL_41:
  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v38, buf, 0x12u);
  return 0;
}

void sub_1000A38C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A38E4(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2 = (std::__shared_weak_count *)a2[1];
  v8 = *a2;
  v9 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  sub_1000273E4(&v8);
  v5 = v9;
  if (v9)
  {
    v6 = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_1000A3964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100028C54((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1000A3978(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  CFStringRef v6;
  CFStringRef v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;

  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289026;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,sendPdu\"}", (uint8_t *)v8, 0x12u);
  }
  if (*(char *)(a2 + 23) >= 0)
    v5 = (const char *)a2;
  else
    v5 = *(const char **)a2;
  v6 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
  if (v6)
  {
    v7 = v6;
    _CTServerConnectionInjectCellBroadcastMessageWithWac(*(_QWORD *)(a1 + 176), v6, 0);
    CFRelease(v7);
  }
}

uint64_t sub_1000A3A80(uint64_t a1, int a2)
{
  NSObject *v4;
  int EnhancedDeliveryState;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;

  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 1026;
    v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onCompanionNearby\", \"Companion\":%{public}d}", (uint8_t *)v7, 0x18u);
  }
  *(_BYTE *)(a1 + 192) = a2;
  EnhancedDeliveryState = SACoreTelephony::getEnhancedDeliveryState(a1, *(_QWORD *)(a1 + 176));
  return SACoreTelephony::onEnhanceDeliveryStateChange((SACoreTelephony *)a1, EnhancedDeliveryState);
}

void sub_1000A3B6C(uint64_t a1)
{
  NSObject *v2;
  double Current;
  double v4;
  double v5;
  NSObject *v6;
  int EnhancedDeliveryState;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onLocationChanged\"}", (uint8_t *)&v8, 0x12u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v4 = *(double *)(a1 + 8);
  v5 = Current - v4;
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 68289794;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v5 < 3600.0;
    v14 = 2050;
    v15 = Current;
    v16 = 2050;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,onLocationChanged\", \"isEDRecentlyUpdated\":%{public}d, \"curTime\":\"%{public}0.3f\", \"fLastEDUpdateTime_s\":\"%{public}0.3f\"}", (uint8_t *)&v8, 0x2Cu);
  }
  if (v5 >= 3600.0)
  {
    EnhancedDeliveryState = SACoreTelephony::getEnhancedDeliveryState(a1, *(_QWORD *)(a1 + 176));
    SACoreTelephony::onEnhanceDeliveryStateChange((SACoreTelephony *)a1, EnhancedDeliveryState);
  }
}

void sub_1000A3D00(uint64_t a1)
{
  sub_1000A3D24(a1);
  operator delete();
}

_QWORD *sub_1000A3D24(uint64_t a1)
{
  *(_QWORD *)a1 = off_1000F70F0;

  sub_1000A3D64((SACoreTelephonyClientHelper **)(a1 + 184), 0);
  return sub_10009E11C((_QWORD *)a1);
}

SACoreTelephonyClientHelper *sub_1000A3D64(SACoreTelephonyClientHelper **a1, SACoreTelephonyClientHelper *a2)
{
  SACoreTelephonyClientHelper *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    SACoreTelephonyClientHelper::~SACoreTelephonyClientHelper(result);
    operator delete();
  }
  return result;
}

void SAMobileAssetProd::SAMobileAssetProd(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  void *__p;
  _BYTE v10[24];
  _BYTE *v11;

  v5 = a2;
  sub_100004F4C((uint64_t)v10, a3);
  *a1 = off_1000F7248;
  v6 = v11;
  if (v11 == v10)
  {
    v7 = 4;
    v6 = v10;
  }
  else
  {
    if (!v11)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  *a1 = off_1000F7180;
  v8 = v5;
  a1[1] = v8;
  sub_100004F4C((uint64_t)(a1 + 2), a3);
  SAMobileAssetProdHelper::SAMobileAssetProdHelper((uint64_t)(a1 + 6), v8);
  sub_10000E8A0(&__p, "SaMaSm");
  operator new();
}

void sub_1000A458C()
{
  JUMPOUT(0x1000A4608);
}

void sub_1000A4598(void *a1, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    __cxa_rethrow();
  }
  JUMPOUT(0x1000A46C4);
}

void sub_1000A45B0()
{
  __cxa_end_catch();
  JUMPOUT(0x1000A4640);
}

void sub_1000A45BC(void *a1, int a2)
{
  if (a2)
    sub_100004860(a1);
  JUMPOUT(0x1000A46C4);
}

void sub_1000A45CC()
{
  JUMPOUT(0x1000A4678);
}

void sub_1000A45D8()
{
  JUMPOUT(0x1000A4680);
}

void sub_1000A45E4()
{
  JUMPOUT(0x1000A46ACLL);
}

void sub_1000A45EC()
{
  JUMPOUT(0x1000A46B4);
}

void sub_1000A45F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, id *a11, _QWORD *a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  uint64_t v22;
  void *v23;
  _QWORD *v25;
  uint64_t v26;

  sub_1000A61A4(a14);
  sub_1000A60E8(a11);
  v25 = *(_QWORD **)(v22 + 40);
  if (v25 == a12)
  {
    v26 = 4;
    v25 = a12;
  }
  else
  {
    if (!v25)
      goto LABEL_6;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_6:

  _Unwind_Resume(a1);
}

uint64_t **sub_1000A46CC(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  NSObject *v4;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  void **v12;
  uint64_t **result;
  void *__p[2];
  char v15;
  int v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  _BYTE v24[14];

  v16 = a2;
  v4 = SALogObjectGeneral;
  if (!(a4 & 1 | (unint64_t)a3))
  {
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      v4 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2081;
      v22 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      v23 = 2081;
      *(_QWORD *)v24 = "setStateHandler";
      *(_WORD *)&v24[8] = 1026;
      *(_DWORD *)&v24[10] = 93;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("setStateHandler", "SAStateMachine.h", 93, "false && \"Assertion failed\"");
  }
  v9 = (id)SALogObjectGeneral;
  v10 = *(_BYTE *)(a1 + 120);
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v11 = *(const char **)v11;
    sub_10000E8A0(__p, off_1000F7348[a2]);
    if (v15 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    *(_DWORD *)buf = 68289794;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = v11;
    v23 = 1026;
    *(_DWORD *)v24 = a2;
    *(_WORD *)&v24[4] = 2082;
    *(_QWORD *)&v24[6] = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "{\"msg%{public}.0s\":\"StateMachine,SetState\", \"name\":%{public, location:escape_only}s, \"stateInt\":%{public}d, \"stateStr\":%{public, location:escape_only}s}", buf, 0x2Cu);
    if (v15 < 0)
      operator delete(__p[0]);
  }

  result = sub_1000A6534((uint64_t **)(a1 + 8), a2, &v16);
  result[5] = a3;
  result[6] = a4;
  return result;
}

void sub_1000A4944(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1000A495C(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  NSObject *v15;
  id HighestVersion;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[5];
  _BYTE v21[24];
  _BYTE *v22;
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t buf;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  _QWORD v30[3];
  _QWORD *v31;

  result = 0;
  switch(a2)
  {
    case 0:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000A52D0;
      v20[3] = &unk_1000F71D0;
      v20[4] = a1;
      v30[0] = off_1000F6F48;
      v30[1] = objc_retainBlock(v20);
      v31 = v30;
      SAMobileAssetProdHelper::query(a1 + 48, (uint64_t)v30);
      result = (uint64_t)v31;
      if (v31 == v30)
      {
        v4 = 4;
        result = (uint64_t)v30;
        goto LABEL_21;
      }
      if (v31)
      {
        v4 = 5;
LABEL_21:
        (*(void (**)(void))(*(_QWORD *)result + 8 * v4))();
        return 0;
      }
      return result;
    case 2:
      if (!*(_BYTE *)(a1 + 216)
        || ((v5 = *(_QWORD *)(a1 + 208), (v6 = *(void **)(a1 + 224)) != 0)
          ? (v7 = (v5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
          : (v7 = 0),
            !v7))
      {
        v8 = SALogObjectGeneral;
        if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 208);
          buf = 68289282;
          v26 = 2082;
          v27 = "";
          v28 = 1026;
          v29 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,InitialQueryFailed\", \"result\":%{public}d}", (uint8_t *)&buf, 0x18u);
        }
        sub_100004F4C((uint64_t)v21, a1 + 16);
        SAMobileAssetProdHelper::readAsset(a1 + 48, 0, (uint64_t)v21);
        v10 = v22;
        if (v22 == v21)
        {
          v11 = 4;
          v10 = v21;
        }
        else
        {
          if (!v22)
            return 2;
          v11 = 5;
        }
        (*(void (**)(void))(*v10 + 8 * v11))();
        return 2;
      }
      v15 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        buf = 68289282;
        v26 = 2082;
        v27 = "";
        v28 = 1026;
        v29 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,InitialQuerySucceeded\", \"result\":%{public}d}", (uint8_t *)&buf, 0x18u);
        v6 = *(void **)(a1 + 224);
      }
      HighestVersion = SAMobileAssetProdHelper::getHighestVersion(a1 + 48, v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue(HighestVersion);
      sub_100004F4C((uint64_t)v23, a1 + 16);
      SAMobileAssetProdHelper::readAsset(a1 + 48, v17, (uint64_t)v23);
      v18 = v24;
      if (v24 == v23)
      {
        v19 = 4;
        v18 = v23;
      }
      else
      {
        if (!v24)
          goto LABEL_34;
        v19 = 5;
      }
      (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_34:

      return 1;
    case 3:
      return 2;
    case 4:
      v12 = SALogObjectGeneral;
      v13 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v13)
        return result;
      buf = 68289026;
      v26 = 2082;
      v27 = "";
      goto LABEL_19;
    case 5:
      v12 = SALogObjectGeneral;
      v14 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v14)
        return result;
      buf = 68289026;
      v26 = 2082;
      v27 = "";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,#warning,spuriousMessage\"}", (uint8_t *)&buf, 0x12u);
      return 0;
    default:
      return result;
  }
}

void sub_1000A4D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char *a22)
{
  void *v22;
  char *v23;
  char *v25;
  uint64_t v26;

  v25 = a22;
  if (a22 == v23)
  {
    v26 = 4;
    v25 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_6;
    v26 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v25 + 8 * v26))();
LABEL_6:

  _Unwind_Resume(a1);
}

uint64_t sub_1000A4DB4(uint64_t a1, int a2)
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  switch(a2)
  {
    case 2:
    case 4:
      v2 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        return 1;
      goto LABEL_6;
    case 3:
      return 2;
    case 5:
      v2 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:
        v4[0] = 68289026;
        v4[1] = 0;
        v5 = 2082;
        v6 = "";
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,#warning,spuriousMessage\"}", (uint8_t *)v4, 0x12u);
      }
      return 1;
    default:
      return 1;
  }
}

uint64_t sub_1000A4EE8(uint64_t a1, int a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[5];
  _QWORD v7[3];
  _QWORD *v8;

  switch(a2)
  {
    case 5:
      return 1;
    case 4:
      sub_100099B44(a1 + 16, *(void **)(a1 + 232));
      return 1;
    case 0:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000A5360;
      v6[3] = &unk_1000F71F0;
      v6[4] = a1;
      v7[0] = off_1000F72D8;
      v7[1] = objc_retainBlock(v6);
      v8 = v7;
      SAMobileAssetProdHelper::download(a1 + 48, (uint64_t)v7);
      v3 = v8;
      if (v8 == v7)
      {
        v4 = 4;
        v3 = v7;
        goto LABEL_10;
      }
      if (v8)
      {
        v4 = 5;
LABEL_10:
        (*(void (**)(void))(*v3 + 8 * v4))();
      }
      break;
  }
  return 2;
}

void sub_1000A4FF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v18;
  uint64_t v19;

  v18 = a17;
  if (a17 == &a14)
  {
    v19 = 4;
    v18 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_1000A503C(uint64_t a1, void *a2)
{
  uint64_t v2;
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  uint8_t buf[8];
  __int128 v15;
  void *v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v8 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v15) = 2082;
    *(_QWORD *)((char *)&v15 + 2) = "";
    v9 = "{\"msg%{public}.0s\":\"#asset,activity is nil\"}";
LABEL_13:
    v10 = buf;
    goto LABEL_14;
  }
  state = xpc_activity_get_state(v3);
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v15) = 2082;
    *(_QWORD *)((char *)&v15 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#asset,process_xpcActivity\"}", buf, 0x12u);
  }
  if (!state)
    goto LABEL_15;
  if (state != 2)
  {
    v8 = SALogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    LOWORD(v15) = 2082;
    *(_QWORD *)((char *)&v15 + 2) = "";
    v9 = "{\"msg%{public}.0s\":\"#asset,unexpectedXpcActivity\"}";
    goto LABEL_13;
  }
  v7 = *(NSObject **)(v2 + 8);
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&v15 = 3221225472;
  *((_QWORD *)&v15 + 1) = sub_1000A529C;
  v16 = &unk_1000F1EB8;
  v17 = v2;
  dispatch_async(v7, buf);
  if (!xpc_activity_set_state(v4, 5))
  {
    v8 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289026;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v9 = "{\"msg%{public}.0s\":\"#asset,failedToSetState\"}";
      v10 = (uint8_t *)v11;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 0x12u);
    }
  }
LABEL_15:

}

void sub_1000A5274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1000A528C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void sub_1000A529C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_autoreleasePoolPush();
  sub_1000A53EC(v1 + 80, 3);
  objc_autoreleasePoolPop(v2);
}

void sub_1000A52D0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_storeStrong((id *)(v5 + 224), a3);
  *(_QWORD *)(v5 + 208) = a2;
  *(_BYTE *)(v5 + 216) = 1;
  sub_1000A53EC(v5 + 80, 2);
  v6 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = 0;

  if (*(_BYTE *)(v5 + 216))
    *(_BYTE *)(v5 + 216) = 0;

}

void sub_1000A534C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000A5360(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  if (v5)
  {
    objc_storeStrong((id *)(v3 + 232), a2);
    sub_1000A53EC(v3 + 80, 4);
    v4 = *(void **)(v3 + 232);
    *(_QWORD *)(v3 + 232) = 0;

  }
  else
  {
    sub_1000A53EC(v3 + 80, 5);
  }

}

void sub_1000A53D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000A53EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v4;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  int v9;
  void **v10;
  void **v11;
  void **v12;
  uint64_t v13;
  uint64_t **v14;
  int v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  uint64_t *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *, uint64_t);
  _QWORD *v23;
  int v24;
  int v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  const char *v30;
  void **v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  int v35;
  void **v36;
  void **v37;
  void **v38;
  uint64_t v39;
  uint64_t **v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD *v43;
  NSObject *v44;
  os_log_type_t v45;
  const char *v46;
  int v47;
  void **v48;
  void **v49;
  void **v50;
  uint64_t v51;
  uint64_t **v52;
  uint64_t *v53;
  uint64_t v54;
  _QWORD *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  int v60;
  void *__p[2];
  char v62;
  void *v63[2];
  char v64;
  int v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  void **v75;

  ++*(_DWORD *)(a1 + 88);
  v2 = *(int *)(a1 + 4);
  v65 = *(_DWORD *)(a1 + 4);
  if (!*(_QWORD *)(a1 + 32))
  {
    v56 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      v56 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2081;
      v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      v72 = 2081;
      v73 = "handleEvent";
      v74 = 1026;
      LODWORD(v75) = 115;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 115, "false && \"Assertion failed\"");
  }
  v4 = SALogObjectGeneral;
  if (!*(_BYTE *)(a1 + 48))
  {
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      v4 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2081;
      v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      v72 = 2081;
      v73 = "handleEvent";
      v74 = 1026;
      LODWORD(v75) = 116;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 116, "false && \"Assertion failed\"");
  }
  v6 = (id)SALogObjectGeneral;
  v7 = *(_BYTE *)(a1 + 120);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v8 = *(const char **)v8;
    sub_10000E8A0(v63, off_1000F7348[*(int *)(a1 + 4)]);
    v9 = v64;
    v10 = (void **)v63[0];
    sub_1000A609C(__p, a2);
    v11 = v63;
    if (v9 < 0)
      v11 = v10;
    if (v62 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    *(_DWORD *)buf = 68289794;
    v67 = 0;
    v68 = 2082;
    v69 = "";
    v70 = 2082;
    v71 = v8;
    v72 = 2082;
    v73 = (const char *)v11;
    v74 = 2082;
    v75 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "{\"msg%{public}.0s\":\"StateMachineHandleEvent\", \"name\":%{public, location:escape_only}s, \"current_state\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s}", buf, 0x30u);
    if (v62 < 0)
      operator delete(__p[0]);
    if (v64 < 0)
      operator delete(v63[0]);
  }

  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    goto LABEL_25;
  v14 = (uint64_t **)(a1 + 8);
  v15 = *(_DWORD *)(a1 + 4);
  v16 = a1 + 16;
  do
  {
    v17 = *(_DWORD *)(v13 + 32);
    v18 = v17 < v15;
    if (v17 >= v15)
      v19 = (uint64_t *)v13;
    else
      v19 = (uint64_t *)(v13 + 8);
    if (!v18)
      v16 = v13;
    v13 = *v19;
  }
  while (*v19);
  if (v16 == a1 + 16 || v15 < *(_DWORD *)(v16 + 32))
  {
LABEL_25:
    v20 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      v20 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2081;
      v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      v72 = 2081;
      v73 = "handleEvent";
      v74 = 1026;
      LODWORD(v75) = 123;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 123, "false && \"Assertion failed\"");
  }
  v22 = *(uint64_t (**)(_QWORD *, uint64_t))(v16 + 40);
  v21 = *(_QWORD *)(v16 + 48);
  v23 = (_QWORD *)(*(_QWORD *)(a1 + 32) + (v21 >> 1));
  if ((v21 & 1) != 0)
    v22 = *(uint64_t (**)(_QWORD *, uint64_t))(*v23 + v22);
  v24 = v22(v23, a2);
  v25 = v24;
  v60 = v24;
  if (a2 <= 1 && v24 != (_DWORD)v2)
  {
    v57 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
      v57 = SALogObjectGeneral;
    }
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2081;
      v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
      v72 = 2081;
      v73 = "handleEvent";
      v74 = 1026;
      LODWORD(v75) = 128;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    __assert_rtn("handleEvent", "SAStateMachine.h", 128, "false && \"Assertion failed\"");
  }
  v26 = SALogObjectGeneral;
  if (*(_DWORD *)(a1 + 88) >= 2u && os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v27 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v27 = *(const char **)v27;
    *(_DWORD *)buf = 68289282;
    v67 = 0;
    v68 = 2082;
    v69 = "";
    v70 = 2082;
    v71 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"StateMachineNestedEvent\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    v26 = SALogObjectGeneral;
  }
  v28 = v26;
  v29 = *(_BYTE *)(a1 + 120);
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v30 = *(const char **)v30;
    sub_10000E8A0(v63, off_1000F7348[v25]);
    if (v64 >= 0)
      v31 = v63;
    else
      v31 = (void **)v63[0];
    *(_DWORD *)buf = 68289538;
    v67 = 0;
    v68 = 2082;
    v69 = "";
    v70 = 2082;
    v71 = v30;
    v72 = 2082;
    v73 = (const char *)v31;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "{\"msg%{public}.0s\":\"StateMachineOldState\", \"name\":%{public, location:escape_only}s, \"newState\":%{public, location:escape_only}s}", buf, 0x26u);
    if (v64 < 0)
      operator delete(v63[0]);
  }

  if (v25 != (_DWORD)v2)
  {
    v32 = (id)SALogObjectGeneral;
    v33 = *(_BYTE *)(a1 + 120);
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (const char *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v34 = *(const char **)v34;
      sub_10000E8A0(v63, off_1000F7348[v2]);
      v35 = v64;
      v36 = (void **)v63[0];
      sub_10000E8A0(__p, "Exit");
      v37 = v63;
      if (v35 < 0)
        v37 = v36;
      if (v62 >= 0)
        v38 = __p;
      else
        v38 = (void **)__p[0];
      *(_DWORD *)buf = 68289794;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = v34;
      v72 = 2082;
      v73 = (const char *)v37;
      v74 = 2082;
      v75 = v38;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "{\"msg%{public}.0s\":\"StateMachineTransition\", \"name\":%{public, location:escape_only}s, \"oldState\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s}", buf, 0x30u);
      if (v62 < 0)
        operator delete(__p[0]);
      if (v64 < 0)
        operator delete(v63[0]);
    }

    v39 = *(_QWORD *)(a1 + 32);
    v40 = sub_1000A6534(v14, v2, &v65);
    v41 = v40[5];
    v42 = (uint64_t)v40[6];
    v43 = (_QWORD *)(v39 + (v42 >> 1));
    if ((v42 & 1) != 0)
      v41 = *(uint64_t **)(*v43 + v41);
    if (((unsigned int (*)(_QWORD *, uint64_t))v41)(v43, 1) != (_DWORD)v2)
    {
      v58 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        v67 = 0;
        v68 = 2082;
        v69 = "";
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
        v58 = SALogObjectGeneral;
      }
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289795;
        v67 = 0;
        v68 = 2082;
        v69 = "";
        v70 = 2081;
        v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
        v72 = 2081;
        v73 = "handleEvent";
        v74 = 1026;
        LODWORD(v75) = 146;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
      }
      __assert_rtn("handleEvent", "SAStateMachine.h", 146, "false && \"Assertion failed\"");
    }
    *(_DWORD *)(a1 + 4) = v25;
    v44 = (id)SALogObjectGeneral;
    v45 = *(_BYTE *)(a1 + 120);
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (const char *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v46 = *(const char **)v46;
      sub_10000E8A0(v63, off_1000F7348[v25]);
      v47 = v64;
      v48 = (void **)v63[0];
      sub_10000E8A0(__p, "Enter");
      v49 = v63;
      if (v47 < 0)
        v49 = v48;
      if (v62 >= 0)
        v50 = __p;
      else
        v50 = (void **)__p[0];
      *(_DWORD *)buf = 68289794;
      v67 = 0;
      v68 = 2082;
      v69 = "";
      v70 = 2082;
      v71 = v46;
      v72 = 2082;
      v73 = (const char *)v49;
      v74 = 2082;
      v75 = v50;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "{\"msg%{public}.0s\":\"StateMachineTransition\", \"name\":%{public, location:escape_only}s, \"newState\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s}", buf, 0x30u);
      if (v62 < 0)
        operator delete(__p[0]);
      if (v64 < 0)
        operator delete(v63[0]);
    }

    v51 = *(_QWORD *)(a1 + 32);
    v52 = sub_1000A6534(v14, v25, &v60);
    v53 = v52[5];
    v54 = (uint64_t)v52[6];
    v55 = (_QWORD *)(v51 + (v54 >> 1));
    if ((v54 & 1) != 0)
      v53 = *(uint64_t **)(*v55 + v53);
    if (((unsigned int (*)(_QWORD *, _QWORD))v53)(v55, 0) != v25)
    {
      v59 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        v67 = 0;
        v68 = 2082;
        v69 = "";
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Assertion failed\"}", buf, 0x12u);
        v59 = SALogObjectGeneral;
      }
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289795;
        v67 = 0;
        v68 = 2082;
        v69 = "";
        v70 = 2081;
        v71 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/framework/util/SAStateMachine.h";
        v72 = 2081;
        v73 = "handleEvent";
        v74 = 1026;
        LODWORD(v75) = 153;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
      }
      __assert_rtn("handleEvent", "SAStateMachine.h", 153, "false && \"Assertion failed\"");
    }
  }
  --*(_DWORD *)(a1 + 88);
}

void sub_1000A6030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;

  if (a18 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1000A6090(uint64_t a1)
{
  sub_1000A53EC(a1 + 80, 3);
}

_QWORD *sub_1000A609C(_QWORD *a1, int a2)
{
  return sub_10000E8A0(a1, off_1000F7360[a2]);
}

void sub_1000A60B0(uint64_t a1)
{
  sub_1000A6120(a1);
  operator delete();
}

uint64_t sub_1000A60D4(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  *a2 = *(_DWORD *)(result + 72);
  *a3 = *(_DWORD *)(result + 76);
  return result;
}

id *sub_1000A60E8(id *a1)
{

  return a1;
}

uint64_t sub_1000A6120(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)a1 = off_1000F7180;

  sub_1000A61A4(a1 + 80);
  sub_1000A60E8((id *)(a1 + 48));
  v2 = *(_QWORD **)(a1 + 40);
  if (v2 == (_QWORD *)(a1 + 16))
  {
    v3 = 4;
    v2 = (_QWORD *)(a1 + 16);
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }

  return a1;
}

uint64_t sub_1000A61A4(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  void **v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  os_log_type_t v19;
  uint64_t v20;
  void **v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;
  void *__p[2];
  char v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void **v35;

  v2 = *(_QWORD **)(a1 + 56);
  v3 = (_QWORD *)(a1 + 64);
  if (v2 != (_QWORD *)(a1 + 64))
  {
    v4 = (uint64_t *)(a1 + 96);
    do
    {
      v5 = *((_DWORD *)v2 + 8);
      v6 = *v3;
      if (!*v3)
        goto LABEL_20;
      v7 = v3;
      do
      {
        v8 = *(_DWORD *)(v6 + 32);
        v9 = v8 < v5;
        if (v8 >= v5)
          v10 = (uint64_t *)v6;
        else
          v10 = (uint64_t *)(v6 + 8);
        if (!v9)
          v7 = (_QWORD *)v6;
        v6 = *v10;
      }
      while (*v10);
      if (v7 != v3 && *((_DWORD *)v7 + 8) <= v5 && (v11 = v7[5]) != 0)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 40))(v11);
        v12 = (id)SALogObjectGeneral;
        v13 = *(_BYTE *)(a1 + 120);
        if (os_log_type_enabled(v12, v13))
        {
          v14 = a1 + 96;
          if (*(char *)(a1 + 119) < 0)
            v14 = *v4;
          sub_1000A609C(__p, v5);
          v15 = __p;
          if (v27 < 0)
            v15 = (void **)__p[0];
          *(_DWORD *)buf = 68289538;
          v29 = 0;
          v30 = 2082;
          v31 = "";
          v32 = 2082;
          v33 = v14;
          v34 = 2082;
          v35 = v15;
          v16 = v12;
          v17 = v13;
          v18 = "{\"msg%{public}.0s\":\"StateMachine,CancelTimeout\", \"name\":%{public, location:escape_only}s, \"event\""
                ":%{public, location:escape_only}s}";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v16, v17, v18, buf, 0x26u);
          if (v27 < 0)
            operator delete(__p[0]);
        }
      }
      else
      {
LABEL_20:
        v12 = (id)SALogObjectGeneral;
        v19 = *(_BYTE *)(a1 + 120);
        if (os_log_type_enabled(v12, v19))
        {
          v20 = a1 + 96;
          if (*(char *)(a1 + 119) < 0)
            v20 = *v4;
          sub_1000A609C(__p, v5);
          v21 = __p;
          if (v27 < 0)
            v21 = (void **)__p[0];
          *(_DWORD *)buf = 68289538;
          v29 = 0;
          v30 = 2082;
          v31 = "";
          v32 = 2082;
          v33 = v20;
          v34 = 2082;
          v35 = v21;
          v16 = v12;
          v17 = v19;
          v18 = "{\"msg%{public}.0s\":\"StateMachine,CancelTimeout,TimerNotRunning\", \"name\":%{public, location:escape_"
                "only}s, \"event\":%{public, location:escape_only}s}";
          goto LABEL_26;
        }
      }

      v22 = (_QWORD *)v2[1];
      if (v22)
      {
        do
        {
          v23 = v22;
          v22 = (_QWORD *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          v23 = (_QWORD *)v2[2];
          v24 = *v23 == (_QWORD)v2;
          v2 = v23;
        }
        while (!v24);
      }
      v2 = v23;
    }
    while (v23 != v3);
  }
  if (*(char *)(a1 + 119) < 0)
    operator delete(*(void **)(a1 + 96));

  sub_1000A6478(*(_QWORD **)(a1 + 64));
  sub_100028C54(a1 + 32);
  sub_10005BDFC(*(_QWORD **)(a1 + 16));
  return a1;
}

void sub_1000A6448(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2)
  {

    sub_100004860(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A6478(_QWORD *a1)
{
  uint64_t v2;

  if (a1)
  {
    sub_1000A6478(*a1);
    sub_1000A6478(a1[1]);
    v2 = a1[5];
    a1[5] = 0;
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
    operator delete(a1);
  }
}

void sub_1000A64CC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_1000A64F4(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t **sub_1000A6534(uint64_t **a1, int a2, _DWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  int v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_9:
    v9 = (uint64_t *)v7;
    v7 = (uint64_t **)operator new(0x38uLL);
    *((_DWORD *)v7 + 8) = *a3;
    v7[5] = 0;
    v7[6] = 0;
    *v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    *v6 = (uint64_t *)v7;
    v10 = (uint64_t *)**a1;
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      v11 = *v6;
    }
    sub_100016328(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

uint64_t sub_1000A6600(uint64_t a1)
{

  return a1;
}

void sub_1000A6628(uint64_t a1)
{

  operator delete();
}

uint64_t sub_1000A6660()
{
  return 0;
}

id sub_1000A6668(uint64_t a1, _QWORD *a2)
{
  id result;

  *a2 = off_1000F72D8;
  result = objc_retainBlock(*(id *)(a1 + 8));
  a2[1] = result;
  return result;
}

void sub_1000A669C(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

uint64_t sub_1000A66AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t sub_1000A66BC(uint64_t a1, uint64_t a2)
{
  if (sub_100010690(a2, (uint64_t)&off_1000F7338))
    return a1 + 8;
  else
    return 0;
}

_UNKNOWN **sub_1000A66F8()
{
  return &off_1000F7338;
}

void sub_1000A67B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A6A10(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "updateLocationAuthorized");
  objc_autoreleasePoolPop(v2);
}

void sub_1000A6F6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000A712C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000A7268(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SACoreLocationProd::SACoreLocationProd(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  int64x2_t v13;
  NSObject *v14;
  _QWORD v16[5];
  _BYTE v17[24];
  _BYTE *v18;
  _BYTE v19[24];
  _BYTE *v20;

  v7 = a2;
  sub_100004F4C((uint64_t)v19, a3);
  sub_100004F4C((uint64_t)v17, a4);
  *(_QWORD *)a1 = off_1000F46C8;
  v8 = v18;
  if (v18 == v17)
  {
    v9 = 4;
    v8 = v17;
  }
  else
  {
    if (!v18)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  v10 = v20;
  if (v20 == v19)
  {
    v11 = 4;
    v10 = v19;
    goto LABEL_10;
  }
  if (v20)
  {
    v11 = 5;
LABEL_10:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  *(_QWORD *)a1 = off_1000F73C8;
  v12 = v7;
  *(_QWORD *)(a1 + 8) = v12;
  sub_100004F4C(a1 + 16, a3);
  sub_100004F4C(a1 + 48, a4);
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  v13 = vdupq_n_s64(0xC08F400000000000);
  *(int64x2_t *)(a1 + 96) = v13;
  *(int64x2_t *)(a1 + 112) = v13;
  *(_OWORD *)(a1 + 128) = xmmword_1000B1D00;
  v14 = *(NSObject **)(a1 + 8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A750C;
  v16[3] = &unk_1000F1EB8;
  v16[4] = a1;
  dispatch_async(v14, v16);

  return a1;
}

void sub_1000A7474(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;

  v5 = *(_QWORD **)(v2 + 40);
  if (v5 == v3)
  {
    v6 = 4;
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v6 = 5;
    v3 = *(_QWORD **)(v2 + 40);
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_6:

  _Unwind_Resume(a1);
}

void sub_1000A750C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_autoreleasePoolPush();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A7574;
  v3[3] = &unk_1000F1EB8;
  v3[4] = v1;
  sub_1000A7574((uint64_t)v3);
}

void sub_1000A7574(uint64_t a1)
{
  uint64_t v1;
  SACoreLocationClient *v2;
  void *v3;
  void *v4;
  void *__p;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -[SACoreLocationClient initWithQueue:]([SACoreLocationClient alloc], "initWithQueue:", *(_QWORD *)(v1 + 8));
  v3 = *(void **)(v1 + 80);
  *(_QWORD *)(v1 + 80) = v2;

  objc_msgSend(*(id *)(v1 + 80), "setClProxy:", v1);
  v4 = *(void **)(v1 + 8);
  sub_10000E8A0(&__p, "singleShotFix");
  SATimer::create(v4);
}

void sub_1000A761C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1000A7638(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,scheduleSingleShotLocationRequest\"}", buf, 0x12u);
  }
  v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7978;
  block[3] = &unk_1000F1EB8;
  block[4] = a1;
  dispatch_async(v3, block);
}

uint64_t sub_1000A7728(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,startMonitoring\"}", buf, 0x12u);
  }
  v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A781C;
  block[3] = &unk_1000F1EB8;
  block[4] = a1;
  dispatch_async(v3, block);
  return 1;
}

void sub_1000A781C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(v1 + 80);
  if (v3)
    objc_msgSend(v3, "startMonitoring");
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_1000A7850(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,,stopMonitoring\"}", buf, 0x12u);
  }
  v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7944;
  block[3] = &unk_1000F1EB8;
  block[4] = a1;
  dispatch_async(v3, block);
  return 1;
}

void sub_1000A7944(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(v1 + 80);
  if (v3)
    objc_msgSend(v3, "stopMonitoring");
  objc_autoreleasePoolPop(v2);
}

void sub_1000A7978(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_autoreleasePoolPush();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A79E0;
  v3[3] = &unk_1000F1EB8;
  v3[4] = v1;
  sub_1000A79E0((uint64_t)v3);
  objc_autoreleasePoolPop(v2);
}

_QWORD *sub_1000A79E0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;
  double v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[3];
  _QWORD *v8;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(v1 + 88);
  if (result)
  {
    (*(void (**)(_QWORD *))(*result + 40))(result);
    v3 = *(_QWORD *)(v1 + 88);
    v4 = *((double *)sub_10003D044() + 2);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A7B40;
    v6[3] = &unk_1000F1EB8;
    v6[4] = v1;
    v7[0] = off_1000F0E88;
    v7[1] = objc_retainBlock(v6);
    v8 = v7;
    (*(void (**)(uint64_t, _QWORD *, double))(*(_QWORD *)v3 + 16))(v3, v7, v4);
    result = v8;
    if (v8 == v7)
    {
      v5 = 4;
      result = v7;
    }
    else
    {
      if (!v8)
        return result;
      v5 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
  }
  return result;
}

void sub_1000A7AFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v18;
  uint64_t v19;

  v18 = a17;
  if (a17 == &a14)
  {
    v19 = 4;
    v18 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A7B40(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 80);
  if (v2)
    objc_msgSend(v2, "requestSingleShotLocation");
  return sub_1000A7638(v1);
}

void sub_1000A7B6C(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;

  v2 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,singleShotLocationRequest\"}", buf, 0x12u);
  }
  v3 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7C5C;
  block[3] = &unk_1000F1EB8;
  block[4] = a1;
  dispatch_async(v3, block);
}

void sub_1000A7C5C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(v1 + 80);
  if (v3)
    objc_msgSend(v3, "requestSingleShotLocation");
  objc_autoreleasePoolPop(v2);
}

void sub_1000A7C90(uint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7)
{
  __int128 *v14;
  double v15;
  double v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  __int128 *v20;
  __int16 v21;
  __int128 v22;
  __int128 v23;
  double v24;
  double v25;
  BOOL v26;
  int v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  int v40;
  __int16 v41;
  double v42;

  v14 = (__int128 *)(a1 + 96);
  v15 = *(double *)(a1 + 96);
  if (v15 == -1000.0
    || (v16 = *(double *)(a1 + 104), v16 == -1000.0)
    || v15 == 0.0 && v16 == 0.0
    || (v16 == a4 ? (v17 = v15 == a3) : (v17 = 0),
        !v17 || *(double *)(a1 + 120) <= 0.0 || a7 - *(double *)(a1 + 136) >= 10.0))
  {
    v19 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 68290563;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2049;
      v32 = a3;
      v33 = 2049;
      v34 = a4;
      v35 = 2049;
      v36 = a5;
      v37 = 2049;
      v38 = a6;
      v39 = 1026;
      v40 = a2;
      v41 = 2050;
      v42 = a7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,processLocation,usingLocation\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"alt\":\"%{private}f\", \"unc\":\"%{private}f\", \"isLastKnownLocation\":%{public}hhd, \"ts\":\"%{public}f\"}", (uint8_t *)&v27, 0x4Au);
    }
    if (*(_QWORD *)(a1 + 40))
      sub_1000637B0(a1 + 16, a2, a3, a4, a5, a6, a7);
    *(double *)(a1 + 96) = a3;
    *(double *)(a1 + 104) = a4;
    *(double *)(a1 + 112) = a5;
    *(double *)(a1 + 120) = a6;
    *(_QWORD *)(a1 + 128) = 0;
    *(double *)(a1 + 136) = a7;
    v20 = sub_100003038();
    v21 = 0;
    v23 = v14[1];
    v22 = v14[2];
    *v20 = *v14;
    v20[1] = v23;
    v20[2] = v22;
    v24 = *(double *)v20;
    v25 = *((double *)v20 + 1);
    v26 = *(double *)v20 == 0.0;
    if (v25 != 0.0)
      v26 = 0;
    if (v25 <= 180.0 && v25 >= -180.0 && v24 <= 90.0 && v24 >= -90.0 && !v26)
    {
      if (*((_BYTE *)v20 + 91))
        v21 = *((_BYTE *)v20 + 90) != 0;
    }
    *((_WORD *)v20 + 44) = v21 | 0x100;
  }
  else
  {
    v18 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 68290563;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2049;
      v32 = a3;
      v33 = 2049;
      v34 = a4;
      v35 = 2049;
      v36 = a5;
      v37 = 2049;
      v38 = a6;
      v39 = 1026;
      v40 = a2;
      v41 = 2050;
      v42 = a7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,processLocation,#warning,sameLocation\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"alt\":\"%{private}f\", \"unc\":\"%{private}f\", \"isLastKnownLocation\":%{public}hhd, \"ts\":\"%{public}f\"}", (uint8_t *)&v27, 0x4Au);
    }
  }
}

__int128 *sub_1000A7F80(uint64_t a1, int a2)
{
  NSObject *v4;
  int64x2_t v5;
  uint64_t v6;
  __int128 *result;
  double v8;
  double v9;
  __int16 v10;
  int64x2_t v11;
  _BYTE *v12;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v4 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 68289282;
    v13[1] = 0;
    v14 = 2082;
    v15 = "";
    v16 = 1026;
    v17 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,processLocationAuthorized\", \"isAuthorized\":%{public}hhd}", (uint8_t *)v13, 0x18u);
  }
  if ((a2 & 1) == 0)
  {
    v5 = vdupq_n_s64(0xC08F400000000000);
    *(int64x2_t *)(a1 + 96) = v5;
    *(int64x2_t *)(a1 + 112) = v5;
    *(_OWORD *)(a1 + 128) = xmmword_1000B1D00;
  }
  v6 = *(_QWORD *)(a1 + 72);
  if (v6)
  {
    LOBYTE(v13[0]) = a2;
    (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v6 + 48))(v6, v13);
  }
  result = sub_100003038();
  *((_WORD *)result + 45) = a2 | 0x100;
  if ((a2 & 1) != 0)
  {
    v8 = *(double *)result;
    v9 = *((double *)result + 1);
    v10 = *(double *)result != 0.0;
    if (v9 != 0.0)
      v10 = 1;
    if (v8 < -90.0)
      v10 = 0;
    if (v8 > 90.0)
      v10 = 0;
    if (v9 < -180.0)
      v10 = 0;
    if (v9 > 180.0)
      v10 = 0;
    *((_WORD *)result + 44) = v10 | 0x100;
  }
  else
  {
    if (*((_BYTE *)result + 89))
      *((_BYTE *)result + 89) = 0;
    if (*((_BYTE *)result + 97))
      *((_BYTE *)result + 97) = 0;
    v11 = vdupq_n_s64(0xC08F400000000000);
    *result = (__int128)v11;
    result[1] = (__int128)v11;
    result[2] = xmmword_1000B1D00;
    if (*((char *)result + 87) < 0)
    {
      *((_QWORD *)result + 9) = 0;
      v12 = (_BYTE *)*((_QWORD *)result + 8);
    }
    else
    {
      v12 = result + 4;
      *((_BYTE *)result + 87) = 0;
    }
    *v12 = 0;
  }
  return result;
}

void sub_1000A8150(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2 = (std::__shared_weak_count *)a2[1];
  v8 = *a2;
  v9 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  sub_1000273E4(&v8);
  v5 = v9;
  if (v9)
  {
    v6 = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_1000A81D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100028C54((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1000A81E8(uint64_t a1)
{
  sub_1000A820C(a1);
  operator delete();
}

uint64_t sub_1000A820C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  *(_QWORD *)a1 = off_1000F73C8;
  v2 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);

  v3 = *(_QWORD **)(a1 + 72);
  if (v3 == (_QWORD *)(a1 + 48))
  {
    v4 = 4;
    v3 = (_QWORD *)(a1 + 48);
  }
  else
  {
    if (!v3)
      goto LABEL_8;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_8:
  v5 = *(_QWORD **)(a1 + 40);
  if (v5 == (_QWORD *)(a1 + 16))
  {
    v6 = 4;
    v5 = (_QWORD *)(a1 + 16);
    goto LABEL_12;
  }
  if (v5)
  {
    v6 = 5;
LABEL_12:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }

  return a1;
}

uint64_t SACoreTelephonyTest::SACoreTelephonyTest(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v23[3];
  _QWORD *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  _BYTE v29[24];
  _BYTE *v30;
  _BYTE v31[24];
  _BYTE *v32;
  _BYTE v33[24];
  _BYTE *v34;
  _BYTE v35[24];
  _BYTE *v36;
  _BYTE v37[24];
  _BYTE *v38;

  v5 = a2;
  sub_1000791CC((uint64_t)v29, a3);
  *(_QWORD *)a1 = off_1000F6880;
  *(_QWORD *)(a1 + 8) = 0;
  sub_1000791CC(a1 + 16, (uint64_t)v29);
  v6 = v38;
  if (v38 == v37)
  {
    v7 = 4;
    v6 = v37;
  }
  else
  {
    if (!v38)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  v8 = v36;
  if (v36 == v35)
  {
    v9 = 4;
    v8 = v35;
  }
  else
  {
    if (!v36)
      goto LABEL_11;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_11:
  v10 = v34;
  if (v34 == v33)
  {
    v11 = 4;
    v10 = v33;
  }
  else
  {
    if (!v34)
      goto LABEL_16;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_16:
  v12 = v32;
  if (v32 == v31)
  {
    v13 = 4;
    v12 = v31;
  }
  else
  {
    if (!v32)
      goto LABEL_21;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_21:
  v14 = v30;
  if (v30 == v29)
  {
    v15 = 4;
    v14 = v29;
  }
  else
  {
    if (!v30)
      goto LABEL_26;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_26:
  *(_QWORD *)a1 = off_1000F7430;
  *(_BYTE *)(a1 + 176) = 0;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_BYTE *)(a1 + 376) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_DWORD *)(a1 + 380) = 1;
  *(_QWORD *)(a1 + 496) = 0;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 473) = 0u;
  *(_BYTE *)(a1 + 504) = -1;
  *(_QWORD *)(a1 + 508) = 0;
  *(_WORD *)(a1 + 516) = -4131;
  *(_QWORD *)(a1 + 528) = 0;
  *(_QWORD *)(a1 + 520) = 0;
  v16 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#coreTelephonyTest,init\"}", buf, 0x12u);
  }
  v17 = v5;
  v18 = (uint64_t *)sub_100017A18();
  v19 = v17;
  v23[0] = off_1000F74C0;
  v23[1] = a1;
  v23[2] = v19;
  v24 = v23;
  sub_100017D40(v18, 3, (uint64_t)v23);
  v20 = v24;
  if (v24 == v23)
  {
    v21 = 4;
    v20 = v23;
    goto LABEL_32;
  }
  if (v24)
  {
    v21 = 5;
LABEL_32:
    (*(void (**)(void))(*v20 + 8 * v21))();
  }

  return a1;
}

void sub_1000A85C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12)
{
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t *v18;
  uint64_t v19;

  v18 = a12;
  if (a12 == v16)
  {
    v19 = 4;
    v18 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_6:

  sub_100032ACC(v14);
  sub_10009E11C(v12);

  _Unwind_Resume(a1);
}

_QWORD *sub_1000A8630(_QWORD *a1)
{
  *a1 = off_1000F7430;
  sub_100032ACC((uint64_t)(a1 + 22));
  return sub_10009E11C(a1);
}

void sub_1000A8660(_QWORD *a1)
{
  *a1 = off_1000F7430;
  sub_100032ACC((uint64_t)(a1 + 22));
  sub_10009E11C(a1);
  operator delete();
}

uint64_t sub_1000A86A4()
{
  return 1;
}

void sub_1000A86AC(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  v2 = (std::__shared_weak_count *)a2[1];
  v8 = *a2;
  v9 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  sub_1000273E4(&v8);
  v5 = v9;
  if (v9)
  {
    v6 = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_1000A872C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100028C54((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A8744()
{
  return 0;
}

uint64_t sub_1000A874C()
{
  return 0;
}

uint64_t sub_1000A8754()
{
  return 0;
}

uint64_t sub_1000A875C()
{
  return 0;
}

uint64_t sub_1000A8764()
{
  return 1;
}

uint64_t sub_1000A8778(uint64_t a1)
{

  return a1;
}

void sub_1000A87A0(uint64_t a1)
{

  operator delete();
}

_QWORD *sub_1000A87D8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = operator new(0x18uLL);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  *v2 = off_1000F74C0;
  v2[1] = v3;
  v2[2] = v4;
  return v2;
}

id sub_1000A881C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  *a2 = off_1000F74C0;
  a2[1] = v3;
  result = v4;
  a2[2] = result;
  return result;
}

void sub_1000A8850(uint64_t a1)
{

}

void sub_1000A8858(id *a1)
{

  operator delete(a1);
}

void sub_1000A8880(uint64_t a1, id *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = *a2;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(NSObject **)(a1 + 16);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A8948;
  v7[3] = &unk_1000F2B98;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_1000A8900(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_1000A893C()
{
}

void sub_1000A8948(uint64_t a1)
{
  SACoreTelephony *v2;
  void *v3;
  id v4;
  const char *string;

  v2 = *(SACoreTelephony **)(a1 + 40);
  v3 = objc_autoreleasePoolPush();
  v4 = *(id *)(a1 + 32);
  if (xpc_dictionary_get_int64(v4, "TestMessageType") == 3)
  {
    string = xpc_dictionary_get_string(v4, "WeaText");
    SACoreTelephony::onWeaDisplayedNotification(v2, string);
  }

  objc_autoreleasePoolPop(v3);
}

void sub_1000A89BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SASettingsTest::getCurrentSettings(SASettingsTest *this)
{
  return 0;
}

uint64_t SASettingsTest::isIphoneAnalyticsEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isSignificantLocationEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isEmergencyAlertEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isAmberAlertEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isPublicSafetyAlertEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isNationalAlertEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isTestAlertEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isIgneousAlertEnabled(SASettingsTest *this)
{
  return 1;
}

uint64_t SASettingsTest::isBluetoothEnabled(SASettingsTest *this)
{
  return 1;
}

void sub_1000A8A2C()
{
  operator delete();
}

_QWORD *SAMobileAssetTest::SAMobileAssetTest(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  _QWORD block[5];
  _QWORD v20[3];
  _QWORD *v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _BYTE v32[24];
  _BYTE *v33;

  v5 = a2;
  sub_100004F4C((uint64_t)v32, a3);
  *a1 = off_1000F7248;
  v6 = v33;
  if (v33 == v32)
  {
    v7 = 4;
    v6 = v32;
  }
  else
  {
    if (!v33)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  *a1 = off_1000F75D8;
  v8 = v5;
  a1[1] = v8;
  sub_100004F4C((uint64_t)(a1 + 2), a3);
  v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,init\"}", buf, 0x12u);
  }
  if (!a1[1])
  {
    v15 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,fDispatchQueue is invalid\"}", buf, 0x12u);
      v15 = SALogObjectGeneral;
    }
    v16 = 21;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2081;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/mobileAsset/test/SAMobileAssetTest.mm";
      v28 = 2081;
      v29 = "SAMobileAssetTest";
      v30 = 1026;
      v31 = 21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    v17 = "false && \"#SAMobileAssetTest,fDispatchQueue is invalid\"";
LABEL_26:
    __assert_rtn("SAMobileAssetTest", "SAMobileAssetTest.mm", v16, v17);
  }
  if (!a1[5])
  {
    v18 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,fOnAssetReceived is invalid\"}", buf, 0x12u);
      v18 = SALogObjectGeneral;
    }
    v16 = 22;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289795;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2081;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SafetyAlerts/Sources/Daemon/system/mobileAsset/test/SAMobileAssetTest.mm";
      v28 = 2081;
      v29 = "SAMobileAssetTest";
      v30 = 1026;
      v31 = 22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"AssertionFailure\", \"file\":%{private, location:escape_only}s, \"function\":%{private, location:escape_only}s, \"line\":%{public}d}", buf, 0x2Cu);
    }
    v17 = "false && \"#SAMobileAssetTest,fOnAssetReceived is invalid\"";
    goto LABEL_26;
  }
  v10 = (uint64_t *)sub_100017A18();
  v20[0] = off_1000F7620;
  v20[1] = a1;
  v21 = v20;
  sub_100017D40(v10, 7, (uint64_t)v20);
  v11 = v21;
  if (v21 == v20)
  {
    v12 = 4;
    v11 = v20;
    goto LABEL_14;
  }
  if (v21)
  {
    v12 = 5;
LABEL_14:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  v13 = a1[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8EC0;
  block[3] = &unk_1000F1EB8;
  block[4] = a1;
  dispatch_async(v13, block);

  return a1;
}

void sub_1000A8E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char *a18)
{
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  char *v21;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;

  v23 = a18;
  if (a18 == v21)
  {
    v24 = 4;
    v23 = &a15;
  }
  else
  {
    if (!a18)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_6:
  v25 = *(_QWORD **)(v18 + 40);
  if (v25 == v20)
  {
    v26 = 4;
    v25 = v20;
  }
  else
  {
    if (!v25)
      goto LABEL_11;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_11:

  _Unwind_Resume(a1);
}

void sub_1000A8EC0(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  void *v3;
  NSObject *v4;
  void *__p[2];
  uint64_t v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (char *)sub_10003D044();
  if (v2[135] < 0)
  {
    sub_100004870(__p, *((void **)v2 + 14), *((_QWORD *)v2 + 15));
  }
  else
  {
    *(_OWORD *)__p = *((_OWORD *)v2 + 7);
    v6 = *((_QWORD *)v2 + 16);
  }
  v3 = (void *)HIBYTE(v6);
  if (v6 < 0)
    v3 = __p[1];
  if (!v3)
  {
    v4 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,loadingCodeDefaults\"}", buf, 0x12u);
    }
    sub_100099B44(v1 + 16, 0);
  }
  sub_1000A9008(v1, (uint64_t)__p);
  if (SHIBYTE(v6) < 0)
    operator delete(__p[0]);
}

void sub_1000A8FE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void sub_1000A9008(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
  const std::string::value_type *v6;
  std::string::size_type v7;
  std::string *v8;
  __int128 v9;
  void **v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *__p[2];
  int64_t v23;
  _BYTE v24[28];

  v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2)
  {
    sub_10000E8A0(v24, "file://");
    v5 = *(char *)(a2 + 23);
    if (v5 >= 0)
      v6 = (const std::string::value_type *)a2;
    else
      v6 = *(const std::string::value_type **)a2;
    if (v5 >= 0)
      v7 = *(unsigned __int8 *)(a2 + 23);
    else
      v7 = *(_QWORD *)(a2 + 8);
    v8 = std::string::append((std::string *)v24, v6, v7);
    v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v23 = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    if ((v24[23] & 0x80000000) != 0)
      operator delete(*(void **)v24);
    if (v23 >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));

    v21 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v12, &v21));
    v14 = v21;
    if (v14)
    {
      v15 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:

        if (SHIBYTE(v23) < 0)
          operator delete(__p[0]);

        return;
      }
      *(_QWORD *)v24 = 68289283;
      *(_WORD *)&v24[8] = 2082;
      *(_QWORD *)&v24[10] = "";
      *(_WORD *)&v24[18] = 2113;
      *(_QWORD *)&v24[20] = v14;
      v16 = "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,cantLoadAsset\", \"error\":%{private, location:escape_only}@}";
      v17 = v15;
      v18 = 28;
    }
    else
    {
      if (v13)
      {
        sub_100099B44(a1 + 16, v13);
        goto LABEL_25;
      }
      v20 = SALogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_QWORD *)v24 = 68289026;
      *(_WORD *)&v24[8] = 2082;
      *(_QWORD *)&v24[10] = "";
      v16 = "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,cantLoadAsset,assetIsEmpty\"}";
      v17 = v20;
      v18 = 18;
    }
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, v24, v18);
    goto LABEL_25;
  }
  v19 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v24 = 68289026;
    *(_WORD *)&v24[8] = 2082;
    *(_QWORD *)&v24[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,cantLoadAsset,invalidFilename\"}", v24, 0x12u);
  }
}

void sub_1000A92BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;
  void *v24;

  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A931C(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *(_QWORD *)a1 = off_1000F75D8;
  v2 = (_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)(a1 + 40);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_1000A9384(uint64_t a1)
{
  sub_1000A931C(a1);
  operator delete();
}

void sub_1000A93AC(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = 0;
  *a3 = 0;
}

void sub_1000A93BC()
{
  operator delete();
}

_QWORD *sub_1000A93D0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = off_1000F7620;
  result[1] = v3;
  return result;
}

uint64_t sub_1000A9404(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = off_1000F7620;
  a2[1] = v2;
  return result;
}

void sub_1000A9420(uint64_t a1, id *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = *a2;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A94EC;
  v7[3] = &unk_1000F2B98;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_1000A94A4(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_1000A94E0()
{
}

void sub_1000A94EC(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  char *string;
  NSObject *v5;
  void *__p;
  __int16 v7;
  const char *v8;
  char v9;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  if (v2)
  {
    if (xpc_dictionary_get_int64(v2, "TestMessageType") == 7)
    {
      string = (char *)xpc_dictionary_get_string(v3, "AssetFilename");
      sub_10000E8A0(&__p, string);
      sub_1000A9008(v1, (uint64_t)&__p);
      if (v9 < 0)
        operator delete(__p);
    }
  }
  else
  {
    v5 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      __p = (void *)68289026;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SAMobileAssetTest,#warning,InvalidTestInputObject\"}", (uint8_t *)&__p, 0x12u);
    }
  }

}

void sub_1000A9604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

_QWORD *SANetworkReachabilityTest::SANetworkReachabilityTest(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;

  sub_100004F4C((uint64_t)v8, a4);
  *a1 = off_1000F6BF0;
  if (v9)
  {
    if (v9 == v8)
    {
      a1[4] = a1 + 1;
      (*(void (**)(_QWORD *))(v8[0] + 24))(v8);
    }
    else
    {
      a1[4] = (*(uint64_t (**)(void))(*v9 + 16))();
    }
    v5 = v9;
    if (v9 == v8)
    {
      v6 = 4;
      v5 = v8;
      goto LABEL_10;
    }
    if (v9)
    {
      v6 = 5;
LABEL_10:
      (*(void (**)(void))(*v5 + 8 * v6))();
    }
  }
  else
  {
    a1[4] = 0;
  }
  *a1 = off_1000F76A0;
  return a1;
}

void sub_1000A972C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void SANetworkReachabilityTest::~SANetworkReachabilityTest(SANetworkReachabilityTest *this)
{
  char *v1;
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)this = off_1000F6BF0;
  v1 = (char *)this + 8;
  v2 = (_QWORD *)*((_QWORD *)this + 4);
  if (v2 == (_QWORD *)v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      return;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
}

{
  char *v1;
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)this = off_1000F6BF0;
  v1 = (char *)this + 8;
  v2 = (_QWORD *)*((_QWORD *)this + 4);
  if (v2 == (_QWORD *)v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  operator delete();
}

_QWORD *SACompanionDetectorTest::SACompanionDetectorTest(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  _BYTE v9[24];
  _BYTE *v10;

  v5 = a2;
  sub_100004F4C((uint64_t)v9, a3);
  sub_100082348(a1, v5, (uint64_t)v9);
  v6 = v10;
  if (v10 == v9)
  {
    v7 = 4;
    v6 = v9;
    goto LABEL_5;
  }
  if (v10)
  {
    v7 = 5;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  *a1 = off_1000F76E0;

  return a1;
}

void sub_1000A9908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  void *v13;
  char *v14;
  char *v16;
  uint64_t v17;

  v16 = a13;
  if (a13 == v14)
  {
    v17 = 4;
    v16 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_6:

  _Unwind_Resume(a1);
}

_QWORD *SACloudChannelTest::SACloudChannelTest(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _BYTE v11[24];
  _BYTE *v12;
  _BYTE v13[24];
  _BYTE *v14;

  sub_100004F4C((uint64_t)v13, a3);
  sub_100004F4C((uint64_t)v11, a4);
  *a1 = off_1000F6A68;
  v6 = v12;
  if (v12 == v11)
  {
    v7 = 4;
    v6 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  v8 = v14;
  if (v14 == v13)
  {
    v9 = 4;
    v8 = v13;
    goto LABEL_10;
  }
  if (v14)
  {
    v9 = 5;
LABEL_10:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
  *a1 = off_1000F7720;
  return a1;
}

void sub_1000A9A74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v18;
  uint64_t v19;

  v18 = a17;
  if (a17 == &a14)
  {
    v19 = 4;
    v18 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void SACloudChannelTest::~SACloudChannelTest(SACloudChannelTest *this)
{
  operator delete();
}

uint64_t sub_1000A9AF4()
{
  return 0;
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_APSDInterfaceStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "APSDInterfaceStatus");
}

id objc_msgSend_CCA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CCA");
}

id objc_msgSend_CellularDataEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CellularDataEnabled");
}

id objc_msgSend_CellularQualityStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CellularQualityStatus");
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Device");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SSID");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:relativeToURL:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_WakeOnWiFiStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "WakeOnWiFiStatus");
}

id objc_msgSend_WiFi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "WiFi");
}

id objc_msgSend_WiFiAvailabilityStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "WiFiAvailabilityStatus");
}

id objc_msgSend_Wireless(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Wireless");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_addConfigForIsoList_config_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConfigForIsoList:config:error:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addDiscoveryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDiscoveryType:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addKeyValuePair_with_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addKeyValuePair:with:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addToSubscribedChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToSubscribedChannels:");
}

id objc_msgSend_addWoWClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addWoWClient:");
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "altitude");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetType");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_authorizationStatusForBundlePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationStatusForBundlePath:");
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automotive");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bleRSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bleRSSI");
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothState");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channelID");
}

id objc_msgSend_channelProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channelProxy");
}

id objc_msgSend_clProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clProxy");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanup");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_containsCoordinate_withDistanceToBorder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsCoordinate:withDistanceToBorder:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copyCarrierBundleValueWithDefault_key_bundleType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleValueWithDefault:key:bundleType:completion:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cycling");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCStringEncoding");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSound");
}

id objc_msgSend_densityScore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "densityScore");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceRegistrationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceRegistrationState");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTaskWithRequest:completionHandler:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateStoredLocationsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateStoredLocationsWithOptions:usingBlock:");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBody");
}

id objc_msgSend_fetchCurrentPeopleDensity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchCurrentPeopleDensity:");
}

id objc_msgSend_fetchInfoForLocation_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchInfoForLocation:withReply:");
}

id objc_msgSend_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCFRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCFRunLoop");
}

id objc_msgSend_getControllerInfoWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getControllerInfoWithCompletion:");
}

id objc_msgSend_getDualSimCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDualSimCapability:");
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLocalFileUrl");
}

id objc_msgSend_getPushConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPushConnection");
}

id objc_msgSend_getReachability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReachability");
}

id objc_msgSend_getRegisteredChannelsForTopic_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRegisteredChannelsForTopic:withCompletion:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalAccuracy");
}

id objc_msgSend_iconNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconNamed:");
}

id objc_msgSend_incomingInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingInterface");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithBundleIdentifier_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:queue:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithChannelID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChannelID:");
}

id objc_msgSend_initWithCoordinate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinate:");
}

id objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDateInterval_horizontalAccuracy_batchSize_boundingBoxLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundlePath:delegate:onQueue:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_defaultConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:defaultConfig:");
}

id objc_msgSend_initWithQueue_forNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:forNetwork:");
}

id objc_msgSend_initWithQueue_isProduction_channelType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:isProduction:channelType:");
}

id objc_msgSend_initWithRestorationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRestorationIdentifier:");
}

id objc_msgSend_initWithServiceLevel_storageDuration_observationInterval_densityCallbackConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceLevel:storageDuration:observationInterval:densityCallbackConfiguration:");
}

id objc_msgSend_initWithSlot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSlot:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:maxEvents:lastN:reversed:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithVertices_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVertices:identifier:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAPSDOverCell(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAPSDOverCell");
}

id objc_msgSend_isAPSDOverWiFi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAPSDOverWiFi");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternetReachable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternetReachable");
}

id objc_msgSend_isSafetyDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSafetyDataSubmissionAllowed");
}

id objc_msgSend_isSubscribedChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubscribedChannel:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedUserNotificationStringForKey_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedUserNotificationStringForKey:arguments:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_noteUserViewedEDSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteUserViewedEDSettings");
}

id objc_msgSend_notifyEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyEvent:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
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

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalRequest");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_postNotification_withSilence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotification:withSilence:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publisherWithOptions:");
}

id objc_msgSend_quality(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quality");
}

id objc_msgSend_queryMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryMetaData:");
}

id objc_msgSend_rat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rat");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeFromSubscribedChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSubscribedChannels:");
}

id objc_msgSend_removeWoWClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeWoWClient:");
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLocation");
}

id objc_msgSend_requestSingleShotLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSingleShotLocation");
}

id objc_msgSend_requestTokenForTopic_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTokenForTopic:identifier:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithIdentifier:content:trigger:destinations:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_rrcStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rrcStatus");
}

id objc_msgSend_rssiHistogram(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssiHistogram");
}

id objc_msgSend_rxRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rxRate");
}

id objc_msgSend_safetyAlertsAlertData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsAlertData");
}

id objc_msgSend_safetyAlertsAlertID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsAlertID");
}

id objc_msgSend_safetyAlertsAlertIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsAlertIndex");
}

id objc_msgSend_safetyAlertsSignature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safetyAlertsSignature");
}

id objc_msgSend_scanDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanDuration");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdvertiseRate:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsExpensiveAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsExpensiveAccess:");
}

id objc_msgSend_setBleScanRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleScanRate:");
}

id objc_msgSend_setBleScanRateScreenOff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBleScanRateScreenOff:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setChannelProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannelProxy:");
}

id objc_msgSend_setClProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClProxy:");
}

id objc_msgSend_setCurrentLocationInCoveredRegion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentLocationInCoveredRegion:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceFoundHandler:");
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveryFlags:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setFCarrierBundleChangeCb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFCarrierBundleChangeCb:");
}

id objc_msgSend_setFDefaultBundleChangeCb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFDefaultBundleChangeCb:");
}

id objc_msgSend_setFOperatorBundleChangeCb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFOperatorBundleChangeCb:");
}

id objc_msgSend_setFPrefDataSimChangedCb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFPrefDataSimChangedCb:");
}

id objc_msgSend_setFTandemCapabilityChangeCb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFTandemCapabilityChangeCb:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setLiveServerCatalogOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiveServerCatalogOnly:");
}

id objc_msgSend_setLiveServerCatalogOnlyIsOverridden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiveServerCatalogOnlyIsOverridden:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLocationServicesEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocationServicesEnabled:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonth:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setReachabilityInstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityInstance:");
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresPowerPluggedIn:");
}

id objc_msgSend_setSAEWEnabledState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSAEWEnabledState:");
}

id objc_msgSend_setSafetyAlertsAlertData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSafetyAlertsAlertData:");
}

id objc_msgSend_setSafetyAlertsAlertID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSafetyAlertsAlertID:");
}

id objc_msgSend_setSafetyAlertsSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSafetyAlertsSignature:");
}

id objc_msgSend_setSafetyAlertsVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSafetyAlertsVersion:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setTaskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskDescription:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUptakeCoefficient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUptakeCoefficient:");
}

id objc_msgSend_setUseCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseCase:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setYear:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedInstanceForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstanceForIdentifier:");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startActivityUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startActivityUpdatesToQueue:withHandler:");
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCatalogDownload:options:then:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDownload_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownload:then:");
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoring");
}

id objc_msgSend_startMonitoringEventType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringEventType:error:");
}

id objc_msgSend_startMonitoringForPeopleDiscovery_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringForPeopleDiscovery:handler:");
}

id objc_msgSend_startMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringSignificantLocationChanges");
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "starting");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stationary");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopActivityUpdates");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stopMonitoringEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringEventType:");
}

id objc_msgSend_stopMonitoringForPeopleDiscoveryWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringForPeopleDiscoveryWithHandler:");
}

id objc_msgSend_stopMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringSignificantLocationChanges");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subscribe_topic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribe:topic:");
}

id objc_msgSend_subscribeToChannel_forTopic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribeToChannel:forTopic:");
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threadIdentifier");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topic");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsubcribeForgottenChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsubcribeForgottenChannels:");
}

id objc_msgSend_unsubcribeForgottenChannelsForTopic_topicName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsubcribeForgottenChannelsForTopic:topicName:");
}

id objc_msgSend_unsubscribe_topic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsubscribe:topic:");
}

id objc_msgSend_unsubscribeFromChannel_forTopic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsubscribeFromChannel:forTopic:");
}

id objc_msgSend_updateLocationAuthorized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLocationAuthorized");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vertices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vertices");
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walking");
}

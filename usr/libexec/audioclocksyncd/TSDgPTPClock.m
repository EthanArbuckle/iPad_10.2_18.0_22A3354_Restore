@implementation TSDgPTPClock

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  void *v15;
  unsigned __int8 v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  int64x2_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v31 = vdupq_n_s64(1uLL);
  v32 = -1;
  v33 = -1;
  v34 = -1;
  v35 = 0xFFFFLL;
  v18 = 6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v16 = objc_msgSend(v15, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 51, 0, 0, &v31, &v18, 0);

  if ((v16 & 1) != 0)
  {
    if (a3)
      *a3 = v31.i64[0];
    if (a4)
      *a4 = v31.u64[1];
    if (a5)
      *a5 = v32;
    if (a6)
      *a6 = v33;
    if (a7)
      *a7 = v34;
    if (a8)
      *a8 = v35;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v20 = "result == YES";
    v21 = 2048;
    v22 = 0;
    v23 = 2048;
    v24 = 0;
    v25 = 2080;
    v26 = "";
    v27 = 2080;
    v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v29 = 1024;
    v30 = 653;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v16;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  void *v15;
  unsigned __int8 v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  int64x2_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v31 = vdupq_n_s64(1uLL);
  v32 = -1;
  v33 = -1;
  v34 = -1;
  v35 = 0xFFFFLL;
  v18 = 6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v16 = objc_msgSend(v15, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 40, 0, 0, &v31, &v18, 0);

  if ((v16 & 1) != 0)
  {
    if (a3)
      *a3 = v31.i64[0];
    if (a4)
      *a4 = v31.u64[1];
    if (a5)
      *a5 = v32;
    if (a6)
      *a6 = v33;
    if (a7)
      *a7 = v34;
    if (a8)
      *a8 = v35;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v20 = "result == YES";
    v21 = 2048;
    v22 = 0;
    v23 = 2048;
    v24 = 0;
    v25 = 2080;
    v26 = "";
    v27 = 2080;
    v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v29 = 1024;
    v30 = 369;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v16;
}

- (NSArray)ports
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childIteratorInServicePlaneWithError:", 0));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004648;
  v8[3] = &unk_10003C768;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateWithBlock:", v8);

  return (NSArray *)v6;
}

- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5
{
  uint64_t v7;
  objc_super v9;

  v7 = *(_QWORD *)&a3;
  if (a3 == 2004)
    -[TSDgPTPClock _refreshGrandmasterIdentityOnNotificationQueue](self, "_refreshGrandmasterIdentityOnNotificationQueue");
  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPClock;
  -[TSDKernelClock _handleNotification:withArg1:andArg2:](&v9, "_handleNotification:withArg1:andArg2:", v7, a4, a5);
}

- (unint64_t)grandmasterIdentity
{
  return self->_grandmasterIdentity;
}

+ (id)availablegPTPClockIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService serviceMatching:](IOKService, "serviceMatching:", CFSTR("IOTimeSyncDomain")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingServices:error:](IOKService, "matchingServices:error:", v3, 0));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022B04;
  v7[3] = &unk_10003C768;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "enumerateWithBlock:", v7);

  return v5;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("IOProviderClass");
  v9[1] = CFSTR("IOPropertyMatch");
  v10[0] = CFSTR("IOTimeSyncDomain");
  v7 = CFSTR("ClockIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  return v5;
}

- (TSDgPTPClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4;
  NSPointerArray *v7;
  NSPointerArray *implClocks;
  TSDgPTPClock *v9;
  TSDgPTPClock *v10;
  uint64_t v11;
  NSArray *gptpPath;
  objc_super v14;

  v4 = *(_QWORD *)&a4;
  v7 = (NSPointerArray *)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
  implClocks = self->_implClocks;
  self->_implClocks = v7;

  self->_implClocksLock._os_unfair_lock_opaque = 0;
  v14.receiver = self;
  v14.super_class = (Class)TSDgPTPClock;
  v9 = -[TSDKernelClock initWithClockIdentifier:pid:](&v14, "initWithClockIdentifier:pid:", a3, v4);
  v10 = v9;
  if (v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[TSDgPTPClock _gptpPath](v9, "_gptpPath"));
    gptpPath = v10->_gptpPath;
    v10->_gptpPath = (NSArray *)v11;

    v10->_grandmasterIdentity = -[TSDgPTPClock _grandmasterIdentity](v10, "_grandmasterIdentity");
  }
  return v10;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  void *v3;
  unsigned int v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  unint64_t v19;
  uint64_t v20;

  v6 = 1;
  v19 = -1;
  v20 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 32, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v17 = 1024;
    v18 = 136;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  unsigned int v25;
  char v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _QWORD v40[12];

  v5 = *(_QWORD *)&a5;
  if (a5 < 0xC)
  {
    v19 = 0;
    v20 = 1;
    if (!a5)
      return v20;
    goto LABEL_13;
  }
  v9 = 0;
  v25 = 12 * ((a5 - 12) / 0xC);
  v26 = 1;
  v10 = a3;
  do
  {
    v11 = 0;
    v27 = 12;
    v12 = v10;
    do
    {
      v13 = *(_OWORD *)v12;
      v12 += 4;
      *(_QWORD *)&v14 = v13;
      *((_QWORD *)&v14 + 1) = DWORD1(v13);
      v15 = v14;
      *(_QWORD *)&v14 = DWORD2(v13);
      *((_QWORD *)&v14 + 1) = HIDWORD(v13);
      v16 = &v40[v11];
      *v16 = v15;
      v16[1] = v14;
      v11 += 4;
    }
    while (v11 != 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v18 = objc_msgSend(v17, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 33, v40, 12, &a4[v9], &v27, 0);

    if ((v18 & 1) == 0)
    {
      v26 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 164;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v26 = 0;
      }
    }
    v5 = (v5 - 12);
    v9 += 12;
    v10 += 12;
  }
  while (v5 > 0xB);
  v20 = v26;
  v19 = v25 + 12;
  if ((_DWORD)v5)
  {
LABEL_13:
    v21 = 0;
    v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }
    while (v5 != v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v23 = objc_msgSend(v22, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 33, v40, v5, &a4[v19], &v27, 0);

    if ((v23 & 1) == 0)
    {
      v20 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 184;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v20;
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  TSgPTPTime *v8;
  uint64_t v10;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v24 = -1;
  v25 = -1;
  v27 = 0;
  v28 = 0;
  v26 = -1;
  v11 = 5;
  v29 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 37, &v29, 1, &v24, &v11, 0);

  if ((v4 & 1) != 0)
  {
    v5 = v28 & 1;
    v6 = (v28 >> 1) & 1;
    v7 = (v28 >> 2) & 1;
    v8 = [TSgPTPTime alloc];
    LOBYTE(v10) = v7;
    return -[TSgPTPTime initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:](v8, "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:", v24, v25, v26, (unsigned __int16)v27, v5, v6, v10);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "callResult == YES";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v22 = 1024;
      v23 = 205;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    return 0;
  }
}

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  unint64_t v22;
  _QWORD v23[2];

  v22 = -1;
  v9 = 1;
  v4 = a3;
  v23[0] = objc_msgSend(v4, "seconds");
  v5 = objc_msgSend(v4, "nanoseconds");

  v23[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v7 = objc_msgSend(v6, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 36, v23, 2, &v22, &v9, 0);

  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "callResult == YES";
    v12 = 2048;
    v13 = 0;
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v20 = 1024;
    v21 = 234;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7)
    return v22;
  else
    return -1;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v7 = -1;
  v25 = -1;
  v26 = -1;
  v27 = -1;
  v28 = 0xFFFFLL;
  v12 = 4;
  v29 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 35, &v29, 1, &v25, &v12, 0);

  if ((v9 & 1) != 0)
  {
    v10 = v25;
    v7 = v26;
    if (a4)
      *a4 = v27;
    if (a5)
      *a5 = v28;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = "callResult == YES";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v23 = 1024;
      v24 = 254;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v10 = -1;
  }
  v11 = v7;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27;

  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 34, &v27, 2, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 285;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0;
  v11 = 3;
  v27 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 38, &v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 314;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 39, &v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 343;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  void *v3;
  unsigned int v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  unint64_t v19;
  uint64_t v20;

  v6 = 1;
  v19 = -1;
  v20 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 43, &v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v17 = 1024;
    v18 = 420;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  unsigned int v25;
  char v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _QWORD v40[12];

  v5 = *(_QWORD *)&a5;
  if (a5 < 0xC)
  {
    v19 = 0;
    v20 = 1;
    if (!a5)
      return v20;
    goto LABEL_13;
  }
  v9 = 0;
  v25 = 12 * ((a5 - 12) / 0xC);
  v26 = 1;
  v10 = a3;
  do
  {
    v11 = 0;
    v27 = 12;
    v12 = v10;
    do
    {
      v13 = *(_OWORD *)v12;
      v12 += 4;
      *(_QWORD *)&v14 = v13;
      *((_QWORD *)&v14 + 1) = DWORD1(v13);
      v15 = v14;
      *(_QWORD *)&v14 = DWORD2(v13);
      *((_QWORD *)&v14 + 1) = HIDWORD(v13);
      v16 = &v40[v11];
      *v16 = v15;
      v16[1] = v14;
      v11 += 4;
    }
    while (v11 != 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v18 = objc_msgSend(v17, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 44, v40, 12, &a4[v9], &v27, 0);

    if ((v18 & 1) == 0)
    {
      v26 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 448;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v26 = 0;
      }
    }
    v5 = (v5 - 12);
    v9 += 12;
    v10 += 12;
  }
  while (v5 > 0xB);
  v20 = v26;
  v19 = v25 + 12;
  if ((_DWORD)v5)
  {
LABEL_13:
    v21 = 0;
    v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }
    while (v5 != v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
    v23 = objc_msgSend(v22, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 44, v40, v5, &a4[v19], &v27, 0);

    if ((v23 & 1) == 0)
    {
      v20 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 468;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v20;
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  TSgPTPTime *v8;
  uint64_t v10;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v24 = -1;
  v25 = -1;
  v27 = 0;
  v28 = 0;
  v26 = -1;
  v11 = 5;
  v29 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 48, &v29, 1, &v24, &v11, 0);

  if ((v4 & 1) != 0)
  {
    v5 = v28 & 1;
    v6 = (v28 >> 1) & 1;
    v7 = (v28 >> 2) & 1;
    v8 = [TSgPTPTime alloc];
    LOBYTE(v10) = v7;
    return -[TSgPTPTime initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:](v8, "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:", v24, v25, v26, (unsigned __int16)v27, v5, v6, v10);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "callResult == YES";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v22 = 1024;
      v23 = 489;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    return 0;
  }
}

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  unint64_t v22;
  _QWORD v23[2];

  v22 = -1;
  v9 = 1;
  v4 = a3;
  v23[0] = objc_msgSend(v4, "seconds");
  v5 = objc_msgSend(v4, "nanoseconds");

  v23[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v7 = objc_msgSend(v6, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 47, v23, 2, &v22, &v9, 0);

  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "callResult == YES";
    v12 = 2048;
    v13 = 0;
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v20 = 1024;
    v21 = 518;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7)
    return v22;
  else
    return -1;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v7 = -1;
  v25 = -1;
  v26 = -1;
  v27 = -1;
  v28 = 0xFFFFLL;
  v12 = 4;
  v29 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 46, &v29, 1, &v25, &v12, 0);

  if ((v9 & 1) != 0)
  {
    v10 = v25;
    v7 = v26;
    if (a4)
      *a4 = v27;
    if (a5)
      *a5 = v28;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = "callResult == YES";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v23 = 1024;
      v24 = 538;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v10 = -1;
  }
  v11 = v7;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27;

  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 45, &v27, 2, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 569;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0;
  v11 = 3;
  v27 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 49, &v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 598;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 50, &v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 627;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4
{
  NSObject *v6;
  unint64_t v7;
  id v8;
  os_unfair_lock_s *p_implClocksLock;
  NSPointerArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  TSDgPTPClock *v22;
  _QWORD block[6];
  objc_super v24;
  _BYTE v25[128];

  v24.receiver = self;
  v24.super_class = (Class)TSDgPTPClock;
  -[TSDKernelClock _handleInterestNotification:withArgument:](&v24, "_handleInterestNotification:withArgument:", *(_QWORD *)&a3, a4);
  if (a3 == -536870608)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    if (!v6)
      v6 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue"));
    v7 = -[TSDgPTPClock _grandmasterIdentity](self, "_grandmasterIdentity");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024A78;
    block[3] = &unk_10003C6F0;
    block[4] = self;
    block[5] = v7;
    dispatch_async(v6, block);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100024AC0;
    v20[3] = &unk_10003C610;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock _gptpPath](self, "_gptpPath"));
    v21 = v8;
    v22 = self;
    dispatch_async(v6, v20);
    p_implClocksLock = &self->_implClocksLock;
    os_unfair_lock_lock(&self->_implClocksLock);
    -[NSPointerArray compact](self->_implClocks, "compact");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_implClocks;
    v11 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "conformsToProtocol:", &OBJC_PROTOCOL___TSDgPTPClockImplProtocol, (_QWORD)v16))objc_msgSend(v15, "updateGrandmasterIdentity:andgPTPPath:", v7, v8);
        }
        v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
      }
      while (v12);
    }

    os_unfair_lock_unlock(p_implClocksLock);
  }
}

- (void)_refreshGrandmasterIdentityOnNotificationQueue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  os_unfair_lock_s *p_implClocksLock;
  NSPointerArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  id v24;
  void *v25;
  _BYTE v26[128];

  v3 = -[TSDgPTPClock _grandmasterIdentity](self, "_grandmasterIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock _gptpPath](self, "_gptpPath"));
  v5 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock notificationQueue](self, "notificationQueue")),
        v8,
        v7,
        v6,
        v7 == v8))
  {
    if (v3 != (void *)-[TSDgPTPClock grandmasterIdentity](self, "grandmasterIdentity"))
      -[TSDgPTPClock setGrandmasterIdentity:](self, "setGrandmasterIdentity:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock gptpPath](self, "gptpPath"));
    v11 = objc_msgSend(v4, "isEqual:", v10);

    if ((v11 & 1) == 0)
      -[TSDgPTPClock setGptpPath:](self, "setGptpPath:", v4);
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024D84;
    block[3] = &unk_10003C740;
    v25 = v3;
    block[4] = self;
    v24 = v4;
    dispatch_sync(v9, block);

  }
  p_implClocksLock = &self->_implClocksLock;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_implClocks;
  v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v18, "conformsToProtocol:", &OBJC_PROTOCOL___TSDgPTPClockImplProtocol, (_QWORD)v19))objc_msgSend(v18, "updateGrandmasterIdentity:andgPTPPath:", v3, v4);
      }
      v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_implClocksLock);
}

- (void)_handleRefreshConnection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDgPTPClock;
  -[TSDKernelClock _handleRefreshConnection](&v3, "_handleRefreshConnection");
  -[TSDgPTPClock _refreshGrandmasterIdentityOnNotificationQueue](self, "_refreshGrandmasterIdentityOnNotificationQueue");
}

- (unint64_t)_grandmasterIdentity
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("GrandmasterID")));

  if (v3)
    v4 = (unint64_t)objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (id)_gptpPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ASPath")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));
  else
    v4 = 0;

  return v4;
}

- (unint64_t)clockIdentity
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockIdentity")));

  if (v3)
    v4 = (unint64_t)objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unsigned)clockPriority1
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockPriority1")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)clockPriority2
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockPriority2")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)clockClass
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockClass")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)clockAccuracy
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockAccuracy")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  unsigned __int8 v11;
  unsigned __int16 v12;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = 0;
  v14 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v9, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 18, 0, 0, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), &v27, &v14, a5);

  if ((v11 & 1) != 0)
  {
    if (a4)
    {
      v12 = v27;
LABEL_4:
      *a4 = v12;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "result == YES";
      v17 = 2048;
      v18 = 0;
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v25 = 1024;
      v26 = 982;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a4)
    {
      v12 = -1;
      goto LABEL_4;
    }
  }

  return v11;
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v7, "callMethodWithSelector:structInput:structInputSize:error:", 19, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), a4);

  if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136316418;
    v12 = "result == YES";
    v13 = 2048;
    v14 = 0;
    v15 = 2048;
    v16 = 0;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v21 = 1024;
    v22 = 1009;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
  }

  return v9;
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  unsigned __int16 v15;
  int v17;
  unsigned int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = 0;
  v17 = 1;
  v18 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v18, 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));

  objc_msgSend(v10, "appendData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v12, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 20, 0, 0, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), &v31, &v17, a6);

  if ((v14 & 1) != 0)
  {
    if (a5)
    {
      v15 = v31;
LABEL_4:
      *a5 = v15;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "result == YES";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v29 = 1024;
      v30 = 1025;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v15 = -1;
      goto LABEL_4;
    }
  }

  return v14;
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v14 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v14, 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));

  objc_msgSend(v8, "appendData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v10, "callMethodWithSelector:structInput:structInputSize:error:", 21, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), a5);

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v25 = 1024;
    v26 = 1053;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v12;
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  unsigned __int16 v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = 0;
  v18 = 1;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 16));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));

  objc_msgSend(v11, "appendData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v14 = objc_retainAutorelease(v11);
  v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 22, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), &v31, &v18, a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "result == YES";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v29 = 1024;
      v30 = 1070;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

  objc_msgSend(v9, "appendData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 23, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v25 = 1024;
    v26 = 1098;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v15, 0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  unsigned __int16 v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = 0;
  v18 = 1;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));

  objc_msgSend(v11, "appendData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v14 = objc_retainAutorelease(v11);
  v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 24, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), &v31, &v18, a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "result == YES";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v29 = 1024;
      v30 = 1114;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

  objc_msgSend(v9, "appendData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 25, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v25 = 1024;
    v26 = 1142;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v15, 0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  unsigned __int16 v15;
  int v17;
  unsigned int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = 0;
  v17 = 1;
  v18 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v18, 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));

  objc_msgSend(v10, "appendData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v12, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 26, 0, 0, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), &v31, &v17, a6);

  if ((v14 & 1) != 0)
  {
    if (a5)
    {
      v15 = v31;
LABEL_4:
      *a5 = v15;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "result == YES";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v29 = 1024;
      v30 = 1158;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v15 = -1;
      goto LABEL_4;
    }
  }

  return v14;
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v14 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v14, 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));

  objc_msgSend(v8, "appendData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v10, "callMethodWithSelector:structInput:structInputSize:error:", 27, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), a5);

  if ((v12 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v25 = 1024;
    v26 = 1186;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v12;
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  unsigned __int16 v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = 0;
  v18 = 1;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 16));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));

  objc_msgSend(v11, "appendData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v14 = objc_retainAutorelease(v11);
  v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 28, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), &v31, &v18, a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "result == YES";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v29 = 1024;
      v30 = 1202;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

  objc_msgSend(v9, "appendData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 29, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v25 = 1024;
    v26 = 1230;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v15, 0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  unsigned __int16 v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = 0;
  v18 = 1;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));

  objc_msgSend(v11, "appendData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v14 = objc_retainAutorelease(v11);
  v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 30, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), &v31, &v18, a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      v16 = v31;
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "result == YES";
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
      v29 = 1024;
      v30 = 1246;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", a4, 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

  objc_msgSend(v9, "appendData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 31, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136316418;
    v16 = "result == YES";
    v17 = 2048;
    v18 = 0;
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v25 = 1024;
    v26 = 1274;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v15, 0x3Au);
  }

  return v13;
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  id v10;
  unsigned __int8 v11;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  _QWORD v26[2];

  v26[0] = a4;
  v26[1] = a5;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v9, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 41, v26, 2, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, &v13, a6);

  if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v15 = "result == YES";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v24 = 1024;
    v25 = 1293;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v11;
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = a4;
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 42, &v25, 1, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 0, &v12, a5);

  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v14 = "result == YES";
    v15 = 2048;
    v16 = 0;
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = "";
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v23 = 1024;
    v24 = 1311;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v10;
}

- (BOOL)getSyncInfoWithSyncInfoValid:(BOOL *)a3 syncFlags:(char *)a4 timeSyncTime:(unint64_t *)a5 domainTimeHi:(unint64_t *)a6 domainTimeLo:(unint64_t *)a7 cumulativeScaledRate:(unint64_t *)a8 inverseCumulativeScaledRate:(unint64_t *)a9 grandmasterID:(unint64_t *)a10 localPortNumber:(unsigned __int16 *)a11 error:(id *)a12
{
  void *v18;
  unsigned __int8 v19;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int64x2_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v34 = -1;
  v35 = -1;
  v36 = -1;
  v37 = vdupq_n_s64(1uLL);
  v39 = 0;
  v40 = 0;
  v38 = -1;
  v41 = 0xFFFFLL;
  v21 = 9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock connection](self, "connection"));
  v19 = objc_msgSend(v18, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 52, 0, 0, &v34, &v21, a12);

  if ((v19 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v23 = "result == YES";
    v24 = 2048;
    v25 = 0;
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPClock.m";
    v32 = 1024;
    v33 = 1324;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (a5)
    *a5 = v34;
  if (a6)
    *a6 = v35;
  if (a7)
    *a7 = v36;
  if (a8)
    *a8 = v37.i64[0];
  if (a9)
    *a9 = v37.u64[1];
  if (a10)
    *a10 = v38;
  if (a3)
    *a3 = v39 != 0;
  if (a4)
    *a4 = v40;
  if (a11)
    *a11 = v41;
  return v19;
}

- (id)clockName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gPTP Domain with Clock Identifier 0x%016llx"), -[TSDKernelClock clockIdentifier](self, "clockIdentifier"));
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  unsigned __int16 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100026FDC;
  v14 = sub_100026FEC;
  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childIteratorInServicePlaneWithError:", 0));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026FF4;
  v8[3] = &unk_10003CED0;
  v9 = a3;
  v8[4] = &v10;
  objc_msgSend(v5, "enumerateWithBlock:", v8);
  v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)getMetrics
{
  return -[TSDClockMetrics initWithClock:]([TSDClockMetrics alloc], "initWithClock:", self);
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPClock getMetrics](self, "getMetrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDelta:", v4));

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSDgPTPClock;
  -[TSDgPTPClock dealloc](&v2, "dealloc");
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___TSDgPTPClock;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v12, "diagnosticInfoForService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childIteratorInServicePlaneWithError:", 0));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100027260;
  v10[3] = &unk_10003C768;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateWithBlock:", v10);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Ports"));

  return v5;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gPTP Domain with Clock Identifier 0x%016llx"), a3);
}

- (void)addImplClock:(id)a3
{
  id v4;
  NSPointerArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_implClocks;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9) == v4)
        {

          goto LABEL_11;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_implClocks, "addPointer:", v4, (_QWORD)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);

}

- (void)removeImplClock:(id)a3
{
  id v4;
  NSPointerArray *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_implClocks;
  v6 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      v11 = &v7[(_QWORD)v8];
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_implClocks, "removePointerAtIndex:", &v10[(_QWORD)v8], (_QWORD)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);

}

- (NSArray)gptpPath
{
  return self->_gptpPath;
}

- (void)setGptpPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setGrandmasterIdentity:(unint64_t)a3
{
  self->_grandmasterIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gptpPath, 0);
  objc_storeStrong((id *)&self->_implClocks, 0);
}

@end

uint64_t sub_10000224C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  return 1;
}

void sub_100002924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000293C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000294C(uint64_t a1)
{

}

uint64_t sub_100002954(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void sub_100002990(uint64_t a1, sqlite3_stmt *a2)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sub_100002E18(a2, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t sub_100002A78(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  return sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
}

uint64_t sub_100002B60(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
}

void sub_100002CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002CF0(uint64_t a1, sqlite3_stmt *a2)
{
  NSNumber *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sub_100002E44(a2, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_100002D9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100002DE8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100002DF8()
{
  sqlite3 **v0;

  return sqlite3_errcode(*v0);
}

const char *sub_100002E0C(sqlite3 **a1)
{
  return sqlite3_errmsg(*a1);
}

unsigned __int8 *sub_100002E18(sqlite3_stmt *a1, int a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
  if (v2)
    v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2));
  return v2;
}

NSNumber *sub_100002E44(sqlite3_stmt *a1, int a2)
{
  return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", sqlite3_column_int64(a1, a2));
}

sqlite3 *sub_100002E70(void *a1, int a2)
{
  int v2;
  id v3;
  int v4;
  id v5;
  NSObject *v6;
  sqlite3 *ppDb;

  ppDb = 0;
  if (a2)
    v2 = 65537;
  else
    v2 = 65542;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path")));
  v4 = sqlite3_open_v2((const char *)objc_msgSend(v3, "UTF8String"), &ppDb, v2, 0);

  if (v4)
  {
    v5 = sub_100006C90();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100031EDC(v4, v6);

  }
  return ppDb;
}

BOOL sub_100002F04(sqlite3 *a1, const char *a2)
{
  return sqlite3_db_readonly(a1, a2) == 1;
}

uint64_t sub_100002F20(const char *a1)
{
  return sub_100002F28(a1, 384);
}

uint64_t sub_100002F28(const char *a1, int a2)
{
  int v3;
  int v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  stat v12;

  if (!a1)
    sub_100031F50();
  v3 = open(a1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v3 == -1)
  {
    v6 = sub_100006C90();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100031F78();

    return 0;
  }
  else
  {
    v4 = v3;
    if (fstat(v3, &v12) < 0)
    {
      v8 = sub_100006C90();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100031FE8();
    }
    else
    {
      if ((v12.st_mode & 0x1FF) == a2 || (fchmod(v4, a2) & 0x80000000) == 0)
      {
        v5 = 1;
        if (v4 < 0)
          return v5;
        goto LABEL_16;
      }
      v10 = sub_100006C90();
      v9 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100032058();
    }

    v5 = 0;
    if ((v4 & 0x80000000) == 0)
LABEL_16:
      close(v4);
  }
  return v5;
}

uint64_t sub_100003060(const char *a1)
{
  return sub_100002F28(a1, 420);
}

void sub_100003068(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *sub_1000030A0()
{
  return __error();
}

CFArrayRef sub_1000030A8(__CFReadStream *a1, int a2)
{
  CFPropertyListRef v4;
  const void *v5;
  CFTypeID v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  NSObject *v21;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v25;

  error = 0;
  if (!a1)
  {
    v8 = sub_100006C90();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v5 = 0;
      goto LABEL_19;
    }
    sub_1000320C8(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_16;
  }
  if (!CFReadStreamOpen(a1))
  {
    if ((a2 & 1) != 0)
      goto LABEL_16;
    v16 = sub_100006C90();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v17 = "CreateMISAuthListWithStream: open stream failed (may be non-existing)";
    v18 = v16;
    v19 = OS_LOG_TYPE_INFO;
    v20 = 2;
    goto LABEL_15;
  }
  v4 = CFPropertyListCreateWithStream(0, a1, 0, 0, 0, &error);
  if (!v4)
  {
    v21 = sub_100006C90();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v25 = error;
    v17 = "CreateMISAuthListWithStream: authList parse failed (malformed?), error %@";
    v18 = v21;
    v19 = OS_LOG_TYPE_DEFAULT;
    v20 = 12;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
    goto LABEL_16;
  }
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFArrayGetTypeID())
    goto LABEL_17;
  v7 = sub_100006C90();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CreateMISAuthListWithStream: plist root has wrong type", buf, 2u);
  }
  CFRelease(v5);
LABEL_16:
  v5 = 0;
LABEL_17:
  if (error)
    CFRelease(error);
LABEL_19:
  if (!v5 && a2)
    return CFArrayCreate(0, 0, 0, &kCFTypeArrayCallBacks);
  return (CFArrayRef)v5;
}

CFArrayRef sub_100003280(const __CFString *a1, int a2)
{
  const __CFURL *v3;
  const __CFURL *v4;
  __CFReadStream *v5;
  CFArrayRef v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = sub_10000E514(a1);
  if (v3)
  {
    v4 = v3;
    v5 = CFReadStreamCreateWithFile(0, v3);
    v6 = sub_1000030A8(v5, a2);
    CFRelease(v4);
    if (v5)
      CFRelease(v5);
  }
  else
  {
    v7 = sub_100006C90();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000320F8(v7, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
  return v6;
}

BOOL sub_10000330C(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  BOOL v6;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeID v9;
  NSObject *v10;
  uint8_t v12[16];

  Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    for (i = 0; i != v5; v6 = i >= v5)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID())
      {
        if (!(*(unsigned int (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex))
          return v6;
      }
      else
      {
        v10 = sub_100006C90();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "authListIterate: row with unknown type", v12, 2u);
        }
      }
      ++i;
    }
  }
  return v6;
}

CFArrayRef sub_10000340C()
{
  return sub_100003280(CFSTR("Indeterminates.plist"), 1);
}

BOOL sub_100003420(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  BOOL v6;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID v9;
  const __CFDictionary *v10;
  const void *Value;
  const void *v12;
  const void *v13;
  const void *v14;
  const __CFNumber *v15;
  CFNumberRef v16;
  CFTypeID v17;
  CFTypeID v18;
  CFTypeID v19;
  CFTypeID v20;
  CFTypeID v21;
  NSObject *v22;
  uint8_t *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint64_t v28;
  int valuePtr;
  uint8_t buf[2];
  __int16 v31;

  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v5 = Count;
    v28 = a2;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v7);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFDictionaryGetTypeID())
      {
        v10 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v7);
        Value = CFDictionaryGetValue(v10, CFSTR("cdhash"));
        v12 = CFDictionaryGetValue(v10, CFSTR("upp-uuid"));
        v13 = CFDictionaryGetValue(v10, CFSTR("teamid"));
        v14 = CFDictionaryGetValue(v10, CFSTR("type"));
        v15 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("grace"));
        if (Value
          && (v16 = v15, v17 = CFGetTypeID(Value), v17 == CFStringGetTypeID())
          && v12
          && (v18 = CFGetTypeID(v12), v18 == CFStringGetTypeID())
          && v13
          && (v19 = CFGetTypeID(v13), v19 == CFStringGetTypeID())
          && v14
          && (v20 = CFGetTypeID(v14), v20 == CFNumberGetTypeID()))
        {
          if (!v16 || (v21 = CFGetTypeID(v16), v21 != CFNumberGetTypeID()))
          {
            valuePtr = 0;
            v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          }
          if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, const void *, CFNumberRef))(v28 + 16))(v28, Value, v12, v13, v14, v16))return v6;
        }
        else
        {
          v26 = sub_100006C90();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v23 = buf;
            v24 = v26;
            v25 = "indeterminateListIterate: malformed row";
            goto LABEL_21;
          }
        }
      }
      else
      {
        v22 = sub_100006C90();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 0;
          v23 = (uint8_t *)&v31;
          v24 = v22;
          v25 = "indeterminateListIterate: row with unknown type";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, v23, 2u);
        }
      }
      v6 = ++v7 >= v5;
      if (v5 == v7)
        return v6;
    }
  }
  return 1;
}

CFArrayRef sub_100003674()
{
  return sub_100003280(CFSTR("Rejections.plist"), 1);
}

BOOL sub_100003688(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  BOOL v6;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID v9;
  const __CFDictionary *v10;
  const void *Value;
  const void *v12;
  const void *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  CFTypeID v16;
  CFTypeID v17;
  CFTypeID v18;
  CFTypeID v19;
  NSObject *v20;
  uint8_t *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v27;
  __int16 v28;
  int valuePtr;
  uint8_t buf[2];
  __int16 v31;

  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v5 = Count;
    v27 = a2;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v7);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFDictionaryGetTypeID())
      {
        v10 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v7);
        Value = CFDictionaryGetValue(v10, CFSTR("upp-uuid"));
        v12 = CFDictionaryGetValue(v10, CFSTR("cdhash"));
        v13 = CFDictionaryGetValue(v10, CFSTR("teamid"));
        v14 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("wholeProfile"));
        if (Value
          && (v15 = v14, v16 = CFGetTypeID(Value), v16 == CFStringGetTypeID())
          && v12
          && (v17 = CFGetTypeID(v12), v17 == CFStringGetTypeID())
          && v13
          && (v18 = CFGetTypeID(v13), v18 == CFStringGetTypeID())
          && v15
          && (v19 = CFGetTypeID(v15), v19 == CFNumberGetTypeID()))
        {
          valuePtr = 0;
          if (CFNumberGetValue(v15, kCFNumberIntType, &valuePtr))
          {
            if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, BOOL))(v27 + 16))(v27, Value, v12, v13, valuePtr != 0))return v6;
            goto LABEL_20;
          }
          v25 = sub_100006C90();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v28 = 0;
            v21 = (uint8_t *)&v28;
            v22 = v25;
            v23 = "rejectionListIterate: could not convert wholeProfile";
            goto LABEL_19;
          }
        }
        else
        {
          v24 = sub_100006C90();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v21 = buf;
            v22 = v24;
            v23 = "rejectionListIterate: malformed row";
            goto LABEL_19;
          }
        }
      }
      else
      {
        v20 = sub_100006C90();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 0;
          v21 = (uint8_t *)&v31;
          v22 = v20;
          v23 = "rejectionListIterate: row with unknown type";
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, v21, 2u);
        }
      }
LABEL_20:
      v6 = ++v7 >= v5;
      if (v5 == v7)
        return v6;
    }
  }
  return 1;
}

id sub_1000038F4()
{
  if (qword_10004F020 != -1)
    dispatch_once(&qword_10004F020, &stru_1000454D8);
  return (id)qword_10004F028;
}

void sub_100003934(id a1)
{
  _TtC17online_auth_agent23LaunchWarningOperations *v1;
  void *v2;

  v1 = objc_opt_new(_TtC17online_auth_agent23LaunchWarningOperations);
  v2 = (void *)qword_10004F028;
  qword_10004F028 = (uint64_t)v1;

}

uint64_t sub_10000395C(void *a1, void *a2, uint64_t a3)
{
  _xpc_connection_s *v5;
  id v6;
  void *v7;
  pid_t pid;
  BOOL v9;
  uint64_t v10;
  int v11;
  id v12;
  NSObject *v13;

  v5 = a1;
  v6 = a2;
  v7 = (void *)xpc_connection_copy_entitlement_value(v5, a3);
  pid = xpc_connection_get_pid(v5);
  if (v7)
    v9 = v7 == &_xpc_BOOL_false;
  else
    v9 = 1;
  v10 = !v9;
  if (v9)
  {
    v11 = pid;
    v12 = sub_100006C90();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100032128(a3, v11, v13);

    xpc_dictionary_set_int64(v6, "resu", 16);
    xpc_connection_send_message(v5, v6);
    xpc_connection_cancel(v5);
  }

  return v10;
}

void start()
{
  dispatch_queue_global_t global_queue;
  NSObject *v1;
  _xpc_connection_s *mach_service;
  const __CFString *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  sub_100003B80();
  sub_100003CB0();
  global_queue = dispatch_get_global_queue(0, 0);
  v1 = objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.online-auth-agent.xpc", v1, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_100045518);
  sub_100004130();
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v3 = (const __CFString *)sub_100008EC4((uint64_t)CFSTR("denylist.map"));
  sub_1000089E8(v3, (char **)&v7);
  v4 = v7;
  v5 = v8;
  v6 = v9;
  sub_10000C600((const void **)&v4);
  v4 = v7;
  v5 = v8;
  v6 = v9;
  sub_100008D8C((uint64_t)&v4);
  xpc_activity_register("com.apple.mis.profile-garbage-collection", XPC_ACTIVITY_CHECK_IN, &stru_100045560);
  xpc_activity_register("com.apple.online-auth-agent.check-indeterminates", XPC_ACTIVITY_CHECK_IN, &stru_100045580);
  xpc_activity_register("com.apple.online-auth-agent.reaper", XPC_ACTIVITY_CHECK_IN, &stru_1000455A0);
  xpc_activity_register("com.apple.mis.opportunistic-validation.boot", XPC_ACTIVITY_CHECK_IN, &stru_1000455C0);
  xpc_activity_register("com.apple.online-auth-agent.denylist-update", XPC_ACTIVITY_CHECK_IN, &stru_1000455E0);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

uint64_t sub_100003B80()
{
  mode_t v0;
  CFIndex Length;
  CFIndex v2;
  char *v3;
  char *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;

  v0 = umask(0x12u);
  Length = CFStringGetLength(CFSTR("/private/var/db/MobileIdentityData"));
  v2 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v3 = (char *)CFAllocatorAllocate(0, v2, 0);
  if (v3)
  {
    v4 = v3;
    if (CFStringGetCString(CFSTR("/private/var/db/MobileIdentityData"), v3, v2, 0x8000100u))
    {
      if ((mkdir(v4, 0x1EDu) & 0x80000000) == 0 || *__error() == 17)
        goto LABEL_13;
      v5 = sub_100006C90();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000321FC((uint64_t)v4, v6);
    }
    else
    {
      v9 = sub_100006C90();
      v6 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000321D0();
    }

LABEL_13:
    CFAllocatorDeallocate(0, v4);
    return umask(v0);
  }
  v7 = sub_100006C90();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000321A4();

  return umask(v0);
}

void sub_100003CB0()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = sub_100006C90();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Creating UserTrust.db if it doesn't exist", v2, 2u);
  }

}

void sub_100003D24(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_type_t type;
  xpc_type_t v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  _xpc_connection_s *v9;
  _QWORD handler[4];
  NSObject *v11;

  v2 = a2;
  type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003E14;
    handler[3] = &unk_100045540;
    v9 = v2;
    v11 = v9;
    xpc_connection_set_event_handler(v9, handler);
    xpc_connection_resume(v9);
    v6 = v11;
  }
  else
  {
    v4 = type;
    v5 = sub_100006C90();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid && v4 == (xpc_type_t)&_xpc_type_error)
    {
      if (v7)
        sub_100032290();
    }
    else if (v7)
    {
      sub_1000322BC();
    }
  }

}

void sub_100003E14(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = objc_autoreleasePoolPush();
  sub_10000577C(*(void **)(a1 + 32), v4);
  objc_autoreleasePoolPop(v3);

}

void sub_100003E60(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t state;
  id v4;

  v2 = a2;
  v4 = (id)os_transaction_create("gc profiles");
  state = xpc_activity_get_state(v2);

  if (state)
    sub_10000C794();

}

void sub_100003EB4(id a1, OS_xpc_object *a2)
{
  void *v2;
  OS_xpc_object *activity;

  activity = a2;
  v2 = (void *)os_transaction_create("periodic check");
  if (xpc_activity_get_state(activity))
    sub_10000D550(1, activity);

}

void sub_100003F0C(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2))
    sub_100006D10();
}

void sub_100003F30(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  id v4;
  NSObject *v5;
  char v6;
  int v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t v11[16];
  uint8_t v12[15];
  unsigned __int8 v13;
  uint8_t buf[16];

  v2 = a2;
  v3 = (void *)os_transaction_create("periodic check");
  if (xpc_activity_get_state(v2))
  {
    v4 = sub_100006C90();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Checking whether opportunistic validation is needed", buf, 2u);
    }

    v13 = 0;
    v6 = MISExistsIndeterminateApps(0, 0, &v13);
    v7 = v13;
    v8 = sub_100006C90();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if ((v6 & 1) != 0 || v7)
    {
      if (v10)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Yes, performing opportunistic validation.", v12, 2u);
      }

      sub_10000D550(0, v2);
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Opportunistic validation not necessary.", v11, 2u);
      }

    }
  }

}

void sub_100004078(id a1, OS_xpc_object *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;

  if (xpc_activity_get_state(a2))
  {
    sub_10000BB04();
    if (_os_feature_enabled_impl("MobileIdentityService", "LaunchWarnings"))
    {
      v2 = sub_1000038F4();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      v7 = 0;
      objc_msgSend(v3, "syncLaunchWarningsAndReturnError:", &v7);
      v4 = v7;
      if (v4)
      {
        v5 = sub_100006C90();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_1000322E8((uint64_t)v4, v6);

      }
    }
  }
}

void sub_100004130()
{
  dispatch_queue_attr_t v0;
  NSObject *v1;
  NSObject *targetq;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue(v0);
  targetq = dispatch_queue_create("com.apple.mis.relister", v1);

  xpc_set_event_stream_handler("com.apple.distnoted.matching", targetq, &stru_100045668);
}

void sub_100004198(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  id v4;
  NSObject *v5;
  const char *string;
  id v7;
  NSObject *v8;
  xpc_object_t value;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v2 = a2;
  v3 = (void *)os_transaction_create("online-auth-agent relister");
  v4 = sub_100006C90();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Relister invoked.", buf, 2u);
  }

  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string && !strcmp(string, "Application Installed"))
  {
    v7 = sub_100006C90();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Relister handling app installation.", v19, 2u);
    }

    value = xpc_dictionary_get_value(v2, "UserInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue(value);
    v11 = v10;
    if (v10)
    {
      if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v15 = _CFXPCCreateCFObjectFromXPCObject(v11);
        v13 = v15;
        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("bundleIDs")));
          v17 = v16;
          if (v16)
            -[NSObject enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", &stru_1000456A8);
        }
        else
        {
          v18 = sub_100006C90();
          v17 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_100032388();
        }

      }
      else
      {
        v12 = sub_100006C90();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1000323B4();
      }
    }
    else
    {
      v14 = sub_100006C90();
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10003235C();
    }

  }
}

void sub_100004384(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  CFTypeRef v11;
  id v12;
  NSObject *v13;
  id v14;
  unsigned int v15;
  CFTypeRef cf;
  uint8_t buf[4];
  id v18;

  v4 = a2;
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v4, 0));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bundleURL](v6, "bundleURL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));

      if (v9)
      {
        cf = 0;
        v15 = 26;
        v10 = MISQueryBlacklistForBundle(objc_msgSend(v8, "path"), 0, 0, 0, &cf, &v15, 0);
        v11 = cf;
        if (v10 && cf)
        {
          v12 = sub_100006C90();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v4;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing potential denylist override for '%@'.", buf, 0xCu);
          }

          MISBlacklistSetOverride(cf, v15, 0);
          v11 = cf;
        }
        if (v11)
          CFRelease(v11);
      }

    }
  }
  else
  {
    v14 = sub_100006C90();
    v7 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000323E0();
  }

}

uint64_t sub_100004520()
{
  if (qword_10004F038 != -1)
    dispatch_once(&qword_10004F038, &stru_1000456C8);
  return byte_10004F030;
}

void sub_100004560(id a1)
{
  id v1;
  char v2;
  const __CFString *v3;
  void *v4;
  id v5;

  v1 = sub_10000BABC();
  v5 = (id)objc_claimAutoreleasedReturnValue(v1);
  v2 = sub_10000BADC() ^ 1;
  v3 = sub_10000BAF8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  byte_10004F030 = objc_msgSend(v5, "isEqualToString:", v4) & v2;

}

uint64_t sub_1000045C0(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  const __CFData *v17;
  id v18;
  id v19;
  id v20;
  uint64_t (**v21)(id, uint64_t);
  uint64_t (**v22)(_QWORD);
  __CFString *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t (*v29)(id *);
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  id v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  id v47;
  id v48;
  id v49;
  unsigned int v50;
  unsigned int v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  __CFString *v62;
  id v63;
  _QWORD *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  __CFString *v77;
  id v78;
  uint64_t (**v79)(id, uint64_t);
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  void *v85;
  __int128 buf;
  void *(*v87)(uint64_t);
  void *v88;
  uint64_t *v89;

  v17 = a1;
  v18 = a2;
  v71 = a3;
  v19 = a4;
  v74 = a5;
  v72 = a6;
  v73 = a7;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = sub_10000E704(v17);
  if (v20)
  {
    v24 = sub_100006C90();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "App Path: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (sub_100031C1C(v18))
  {
    v26 = sub_100006C90();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "UPP is ready.", (uint8_t *)&buf, 2u);
    }

    sub_100009194(CFSTR("AuthListReadyCdHashes.plist"), v23);
    sub_100009568(v23, v18);
    v28 = v21[2](v21, 65);
    goto LABEL_21;
  }
  if (_os_feature_enabled_impl("DeviceManagementClient", "HRN"))
    goto LABEL_20;
  v81 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  v29 = (uint64_t (*)(id *))off_10004F040;
  v85 = off_10004F040;
  if (!off_10004F040)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v87 = sub_100006A3C;
    v88 = &unk_100045718;
    v89 = &v82;
    sub_100006A3C((uint64_t)&buf);
    v29 = (uint64_t (*)(id *))v83[3];
  }
  _Block_object_dispose(&v82, 8);
  if (!v29)
    sub_10003240C();
  v30 = v29(&v81);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = v81;
  if (v32 || !v31)
  {

    goto LABEL_23;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags")));
  v34 = (objc_opt_respondsToSelector(v33, "intValue") & 1) != 0
     && (~objc_msgSend(v33, "intValue") & 0x21) == 0;

  if (!v34)
  {
LABEL_23:
    if ((objc_msgSend(v19, "BOOLValue") & 1) == 0)
    {
      *(_QWORD *)&buf = 0;
      MISCopyProvisioningProfile(v18, &buf);
      if ((_QWORD)buf)
      {
        if (MISProvisioningProfileHasPPQExemption())
        {
          CFRelease((CFTypeRef)buf);
          sub_100009568(v23, v18);
          v28 = v21[2](v21, 1);
          goto LABEL_21;
        }
        if ((_QWORD)buf)
          CFRelease((CFTypeRef)buf);
      }
    }
    v37 = sub_100009010((uint64_t)&unk_10004EE20, dword_10004F01C);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = sub_100009010((uint64_t)&unk_10004EDD8, dword_10004EE1C);
    v69 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (sub_1000090E4(v38, v18) || sub_1000090E4(v69, v74))
    {
      v40 = sub_100006C90();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "UPP or Team ID is exempt.", (uint8_t *)&buf, 2u);
      }

      sub_100009568(v23, v18);
      v42 = v21[2](v21, 1);
    }
    else
    {
      if (-[__CFData length](v17, "length") == (id)20 || -[__CFData length](v17, "length") == (id)32)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 16));
        if (v43)
        {
          v68 = objc_retainAutorelease(v43);
          v44 = objc_msgSend(v68, "mutableBytes");
          if (v44 && !SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v44))
          {
            v48 = sub_100004D98();
            v67 = (void *)objc_claimAutoreleasedReturnValue(v48);
            if (v67)
            {
              v49 = sub_100004EEC(v17, v18);
              v66 = (void *)objc_claimAutoreleasedReturnValue(v49);
              if (v66)
              {
                v50 = sub_10000AB98(v23);
                v51 = sub_10000AE10(v18);
                v52 = sub_100005038(v68, v67, v18, v66, v74, v50, v51, v71, v19, v72, v73, v20, a8);
                v65 = (void *)objc_claimAutoreleasedReturnValue(v52);
                if (v65)
                {
                  v75[0] = _NSConcreteStackBlock;
                  v75[1] = 3221225472;
                  v75[2] = sub_100005470;
                  v75[3] = &unk_1000456F0;
                  v63 = v18;
                  v76 = v63;
                  v62 = v23;
                  v77 = v62;
                  v53 = v74;
                  v78 = v53;
                  v80 = a8;
                  v79 = v21;
                  v64 = objc_retainBlock(v75);
                  if (sub_1000075D0(v65, 0, v64))
                  {
                    v35 = 1;
                  }
                  else
                  {
                    v60 = sub_100006C90();
                    v61 = objc_claimAutoreleasedReturnValue(v60);
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                    {
                      LOWORD(buf) = 0;
                      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Could not perform authorization attempt. Forcing indeterminate...", (uint8_t *)&buf, 2u);
                    }

                    sub_10000A230(v62, v63, v53, a8, 0, 0);
                    v35 = v22[2](v22);
                  }

                }
                else
                {
                  v58 = sub_100006C90();
                  v59 = objc_claimAutoreleasedReturnValue(v58);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                    sub_100032504();

                  v35 = v22[2](v22);
                }

              }
              else
              {
                v56 = sub_100006C90();
                v57 = objc_claimAutoreleasedReturnValue(v56);
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  sub_1000324D8();

                v35 = v22[2](v22);
              }

            }
            else
            {
              v54 = sub_100006C90();
              v55 = objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                sub_1000324AC();

              v35 = v22[2](v22);
            }

            goto LABEL_35;
          }

        }
        v45 = sub_100006C90();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_100032480();
      }
      else
      {
        v47 = sub_100006C90();
        v46 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          sub_100032530();
      }

      v42 = v22[2](v22);
    }
    v35 = v42;
LABEL_35:

    goto LABEL_22;
  }
LABEL_20:
  sub_100009568(v23, v18);
  v28 = v21[2](v21, 1);
LABEL_21:
  v35 = v28;
LABEL_22:

  return v35;
}

void sub_100004D78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100004D98()
{
  void *v0;
  void *v1;
  id v2;
  size_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  mach_port_t v8;
  io_connect_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;

  v0 = (void *)sub_10000E448();
  v1 = v0;
  if (!v0)
  {
    v21 = sub_100006C90();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10003255C();

    goto LABEL_14;
  }
  v2 = objc_msgSend(v0, "lengthOfBytesUsingEncoding:", 4);
  v3 = ((_DWORD)v2 + 15) & 0xFFFFFFF0;
  v4 = sub_10000E7F0(objc_msgSend(objc_retainAutorelease(v1), "UTF8String"), (size_t)v2, v3);
  if (!v4)
  {
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = sub_10000E79C(v3);
  if (!v6)
  {
    free(v5);
    goto LABEL_14;
  }
  v7 = v6;
  v8 = sub_10000E840();
  v9 = v8;
  if (!v8)
  {
LABEL_9:
    v20 = 0;
    goto LABEL_17;
  }
  v10 = sub_10000E8D4(v8, (uint64_t)v5, (uint64_t)v7, v3);
  if ((_DWORD)v10)
  {
    v11 = v10;
    v12 = sub_100006C90();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100032588(v11, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_9;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v7, v2));
LABEL_17:
  free(v5);
  free(v7);
  if (v9)
    j__IOServiceClose(v9);
LABEL_15:

  return v20;
}

id sub_100004EEC(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  _BYTE v13[32];

  v3 = a2;
  v4 = a1;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithData:", v4);

  if (!v5)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v6 = objc_retainAutorelease(v3);
  v7 = objc_msgSend(v6, "UTF8String");
  if (!v7)
  {
    v10 = sub_100006C90();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000325EC();

    goto LABEL_7;
  }
  v8 = ccsha256_di(objc_msgSend(v5, "appendBytes:length:", v7, objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4)));
  ccdigest(v8, objc_msgSend(v5, "length"), objc_msgSend(objc_retainAutorelease(v5), "bytes"), v13);
  v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v13, 32);
LABEL_8:

  return v9;
}

id sub_100005038(void *a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, unsigned int a7, void *a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13)
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  _BYTE v56[32];

  v54 = a1;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v55 = a5;
  v53 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = objc_alloc_init((Class)NSMutableDictionary);
  v51 = v23;
  v52 = v22;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("nonce"));

    objc_msgSend(v25, "setObject:forKey:", CFSTR("INSTALL_FINE_GRAINED"), CFSTR("action"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("deviceID"));

    objc_msgSend(v25, "setObject:forKey:", v19, CFSTR("profileID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v25, "setObject:forKey:", v28, CFSTR("appID"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a13));
    objc_msgSend(v25, "setObject:forKey:", v29, CFSTR("checkType"));

    objc_msgSend(v25, "setObject:forKey:", v22, CFSTR("cdVersion"));
    objc_msgSend(v25, "setObject:forKey:", v23, CFSTR("signingTime"));
    v30 = v54;
    v31 = v20;
    v32 = v53;
    v33 = v21;
    if (v24 && a13 == 1)
    {
      v34 = sub_10000DE0C(v24, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = v35;
      if (v35 && objc_msgSend(v35, "count"))
        objc_msgSend(v25, "setObject:forKey:", v36, CFSTR("appIdentity"));

    }
    if (v53)
      objc_msgSend(v25, "setObject:forKey:", v53, CFSTR("universalProfile"));
    if (v21)
      objc_msgSend(v25, "setObject:forKey:", v21, CFSTR("localProfile"));
    if ((objc_msgSend(v55, "isEqual:", &stru_100048628) & 1) != 0)
    {
      objc_msgSend(v25, "setObject:forKey:", &stru_100048628, CFSTR("teamID"));
    }
    else
    {
      v38 = v31;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "dataUsingEncoding:", 4));
      v40 = ccsha256_di(v39);
      v41 = objc_msgSend(v39, "length");
      v42 = objc_retainAutorelease(v39);
      ccdigest(v40, v41, objc_msgSend(v42, "bytes"), v56);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v56, 32));
      if (!v43)
      {

        v37 = 0;
        v31 = v38;
        v32 = v53;
        v30 = v54;
        goto LABEL_18;
      }
      v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "base64EncodedStringWithOptions:", 0));
      objc_msgSend(v25, "setObject:forKey:", v45, CFSTR("teamID"));

      v31 = v38;
      v32 = v53;
      v30 = v54;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a6));
    objc_msgSend(v25, "setObject:forKey:", v46, CFSTR("previousRejected"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a7));
    objc_msgSend(v25, "setObject:forKey:", v47, CFSTR("rejectedApps"));

    v37 = v25;
  }
  else
  {
    v37 = 0;
    v31 = v20;
    v32 = v53;
    v30 = v54;
    v33 = v21;
  }
LABEL_18:

  return v37;
}

void sub_100005470(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint8_t v26[16];
  id v27;
  int v28;

  v3 = a2;
  v4 = v3;
  v28 = 0;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("validity")));
    if (v5)
      sub_10000B384(*(void **)(a1 + 32), v5);

  }
  v7 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v27 = 0;
  sub_10000A230(v6, v7, v8, v9, (uint64_t)&v28, (uint64_t)&v27);
  v10 = v27;
  if (v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("actions")));
    if (objc_msgSend(v11, "containsObject:", CFSTR("AUTHORIZED")))
    {
      v12 = sub_100006C90();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Authorized.", v26, 2u);
      }

      sub_100009568(*(void **)(a1 + 40), *(void **)(a1 + 32));
      sub_100009CB4(*(void **)(a1 + 32), *(void **)(a1 + 40));
    }
    else
    {
      if (objc_msgSend(v11, "containsObject:", CFSTR("REJECT_APP_FOR_PROFILE")))
      {
        v16 = sub_100006C90();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Rejected app/profile combination.", v26, 2u);
        }

        v18 = *(void **)(a1 + 32);
        v19 = *(void **)(a1 + 40);
        v20 = *(void **)(a1 + 48);
        v21 = 0;
      }
      else
      {
        if (!objc_msgSend(v11, "containsObject:", CFSTR("REJECT_APP_AND_PROFILE")))
        {
          if (objc_msgSend(v11, "containsObject:", CFSTR("REJECT_PROFILE")))
          {
            v24 = sub_100006C90();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v26 = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Permanently rejected profile.", v26, 2u);
            }

            sub_100009194(CFSTR("AuthListBannedUpps.plist"), *(void **)(a1 + 32));
            sub_100009194(CFSTR("AuthListBannedCdHashes.plist"), *(void **)(a1 + 40));
            sub_100009568(*(void **)(a1 + 40), *(void **)(a1 + 32));
            sub_100009CB4(*(void **)(a1 + 32), *(void **)(a1 + 40));
          }
          goto LABEL_22;
        }
        v22 = sub_100006C90();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Rejected profile.", v26, 2u);
        }

        v18 = *(void **)(a1 + 32);
        v19 = *(void **)(a1 + 40);
        v20 = *(void **)(a1 + 48);
        v21 = 1;
      }
      sub_10000A9D0(v18, v19, v20, v21);
      sub_100009568(*(void **)(a1 + 40), *(void **)(a1 + 32));
    }
LABEL_22:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    goto LABEL_23;
  }
  v14 = sub_100006C90();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Did not receive a valid response.", v26, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_23:

}

void sub_10000577C(void *a1, void *a2)
{
  _xpc_connection_s *v3;
  id v4;
  xpc_type_t type;
  id v6;
  NSObject *v7;
  xpc_object_t reply;
  id v9;
  const char *string;
  const char *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  const char *v16;
  _xpc_connection_s *v17;
  id v18;
  _xpc_connection_s *v19;
  id v20;
  uint8_t *v21;
  _QWORD *v22;
  const void *data;
  const char *v24;
  const char *v25;
  xpc_object_t value;
  void *v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  NSNumber *v31;
  id v32;
  NSObject *v33;
  NSNumber *v34;
  NSNumber *v35;
  NSNumber *v36;
  void *v37;
  void *v38;
  int int64;
  _UNKNOWN **v40;
  _UNKNOWN **v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  xpc_object_t xint;
  size_t length;
  _QWORD v51[4];
  uint8_t *v52;
  uint8_t buf[8];
  uint64_t v54;
  uint64_t (*v55)(uint64_t, int64_t);
  void *v56;
  id v57;
  _xpc_connection_s *v58;

  v3 = a1;
  v4 = a2;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      v15 = sub_100006C90();
      v7 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v16 = "connection is now invalid.";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v16, buf, 2u);
      }
    }
    else
    {
      if (v4 != &_xpc_error_termination_imminent)
        goto LABEL_7;
      v18 = sub_100006C90();
      v7 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v16 = "termination imminent, canceling connection.";
        goto LABEL_27;
      }
    }
LABEL_28:

    xpc_connection_cancel(v3);
    v9 = 0;
    goto LABEL_29;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    v6 = sub_100006C90();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000326C4();
    goto LABEL_28;
  }
LABEL_7:
  reply = xpc_dictionary_create_reply(v4);
  if (!reply)
    sub_100032618();
  v9 = reply;
  string = xpc_dictionary_get_string(v4, "type");
  if (!string)
  {
    v14 = sub_100006C90();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100032640();
LABEL_20:

    xpc_connection_cancel(v3);
    goto LABEL_29;
  }
  v11 = string;
  if (!strncmp(string, "ping", 4uLL))
  {
    if (sub_10000395C(v3, v9, (uint64_t)"com.apple.private.mis.online_auth_agent"))
    {
      v17 = v3;
      v9 = v9;
      xpc_dictionary_set_int64(v9, "resu", 1);
      xpc_dictionary_set_string(v9, "pong", "pong!");
      xpc_connection_send_message(v17, v9);

    }
  }
  else if (!strncmp(v11, "auth", 4uLL))
  {
    if (sub_10000395C(v3, v9, (uint64_t)"com.apple.private.mis.online_auth_agent"))
    {
      v19 = v3;
      v20 = v4;
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v54 = 3221225472;
      v55 = sub_100006B14;
      v56 = &unk_100045758;
      v9 = v9;
      v57 = v9;
      v58 = v19;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100006B50;
      v51[3] = &unk_100045780;
      v21 = objc_retainBlock(buf);
      v52 = v21;
      v22 = objc_retainBlock(v51);
      length = 0;
      data = xpc_dictionary_get_data(v20, "cdha", &length);
      v24 = xpc_dictionary_get_string(v20, "uuid");
      v25 = xpc_dictionary_get_string(v20, "team");
      v46 = xpc_dictionary_get_string(v20, "apppath");
      value = xpc_dictionary_get_value(v20, "univ");
      v27 = (void *)objc_claimAutoreleasedReturnValue(value);
      v28 = xpc_dictionary_get_value(v20, "locl");
      v48 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v29 = xpc_dictionary_get_value(v20, "cdvr");
      v47 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v30 = xpc_dictionary_get_value(v20, "sgnt");
      xint = (xpc_object_t)objc_claimAutoreleasedReturnValue(v30);
      if (data && v24 && v25)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, length));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v24));
        if (v27)
        {
          v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_BOOL_get_value(v27));
          v43 = (void *)objc_claimAutoreleasedReturnValue(v31);
        }
        else
        {
          v43 = 0;
        }
        if (v48)
        {
          v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_BOOL_get_value(v48));
          v42 = (void *)objc_claimAutoreleasedReturnValue(v34);
        }
        else
        {
          v42 = 0;
        }
        if (v47)
        {
          v35 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v47));
          v41 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v35);
        }
        else
        {
          v41 = &off_100048BD0;
        }
        if (xint)
        {
          v36 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_int64_get_value(xint));
          v40 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v36);
        }
        else
        {
          v40 = &off_100048BD0;
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v25));
        if (v46)
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
        else
          v38 = 0;
        int64 = xpc_dictionary_get_int64(v20, "ckty");
        sub_1000045C0(v45, v44, v43, v42, v37, v41, v40, int64, v38, v21, v22);

      }
      else
      {
        v32 = sub_100006C90();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_10003266C();

        ((void (*)(_QWORD *))v22[2])(v22);
      }

    }
  }
  else if (!strncmp(v11, "trst", 4uLL))
  {
    if (sub_10000395C(v3, v9, (uint64_t)"com.apple.private.mis.trust.set"))
      sub_100005EB8(v3, v4, v9);
  }
  else if (!strncmp(v11, "blov", 4uLL))
  {
    if (sub_10000395C(v3, v9, (uint64_t)"com.apple.private.mis.trust.set"))
      sub_1000062F8(v3, v4, v9);
  }
  else if (!strncmp(v11, "rqup", 4uLL))
  {
    if (sub_10000395C(v3, v9, (uint64_t)"com.apple.private.mis.trust.set"))
      sub_1000064F0(v3, v4, v9);
  }
  else
  {
    if (strncmp(v11, "lwov", 4uLL))
    {
      if (!strncmp(v11, "chlw", 4uLL))
      {
        sub_100006730(v3, v4, v9);
        goto LABEL_29;
      }
      v12 = sub_100006C90();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100032698();
      goto LABEL_20;
    }
    if (sub_10000395C(v3, v9, (uint64_t)"com.apple.private.mis.trust.set"))
      sub_10000656C(v3, v4, v9);
  }
LABEL_29:

}

void sub_100005EB8(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  const char *string;
  _BOOL4 v11;
  _BOOL4 v12;
  char *v13;
  const UInt8 *data;
  void *v15;
  CFDataRef v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  _TtC17online_auth_agent24UserTrustAgentOperations *v24;
  _TtC17online_auth_agent24UserTrustAgentOperations *v25;
  id *v26;
  const __CFString *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  const __CFString *v32;
  char *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  size_t length;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  CFDataRef v51;

  v5 = a1;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100006B74;
  v38[3] = &unk_1000457A8;
  v41 = 0;
  v6 = a3;
  v39 = v6;
  v7 = v5;
  v40 = v7;
  v8 = a2;
  v9 = objc_retainBlock(v38);
  length = 0;
  string = xpc_dictionary_get_string(v8, "uuid");
  v11 = xpc_dictionary_get_BOOL(v8, "trst");
  v12 = xpc_dictionary_get_BOOL(v8, "usdb");
  v13 = (char *)xpc_dictionary_get_string(v8, "team");
  data = (const UInt8 *)xpc_dictionary_get_data(v8, "xsig", &length);

  if (string)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    v34 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v15);
    if (v13)
      v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
    if (data)
    {
      v16 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, data, length, kCFAllocatorNull);
      if (!v16)
      {
        v17 = sub_100006C90();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_10003279C();

        ((void (*)(_QWORD *))v9[2])(v9);
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      v16 = 0;
    }
    v21 = sub_100006C90();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v43 = string;
      v44 = 1024;
      v45 = v11;
      v46 = 1024;
      v47 = v12;
      v48 = 2112;
      v49 = v13;
      v50 = 2112;
      v51 = v16;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting trust for UPP %s: trust: %d, use db: %d, team ID: %@, auxiliary signature: %@", buf, 0x2Cu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (v12)
    {
      v33 = v13;
      v24 = objc_opt_new(_TtC17online_auth_agent24UserTrustAgentOperations);
      v25 = v24;
      if (v11)
      {
        v36 = 0;
        v26 = (id *)&v36;
        -[UserTrustAgentOperations createUserTrustedProfileEntryWithUuid:teamId:signature:error:](v24, "createUserTrustedProfileEntryWithUuid:teamId:signature:error:", v34, v33, v16, &v36);
      }
      else
      {
        v35 = 0;
        v26 = (id *)&v35;
        -[UserTrustAgentOperations deleteTrustedProfileWithUuid:error:](v24, "deleteTrustedProfileWithUuid:error:", v34, &v35);
      }
      v28 = *v26;
      if (v28)
      {
        v29 = v28;
        v30 = sub_100006C90();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_10003271C((uint64_t)string, (uint64_t)v29, v31);

        ((void (*)(_QWORD *))v9[2])(v9);
        v13 = v33;
        goto LABEL_33;
      }
      if (v11)
        v32 = CFSTR("MISUPPTrustSet");
      else
        v32 = CFSTR("MISUPPTrustRevoked");
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v32, 0, 0, 0);

      v13 = v33;
    }
    else
    {
      if (v11)
      {
        sub_100009194(CFSTR("UserTrustedUpps.plist"), v15);
        v27 = CFSTR("MISUPPTrustSet");
      }
      else
      {
        sub_1000093C4(CFSTR("UserTrustedUpps.plist"), v15);
        v27 = CFSTR("MISUPPTrustRevoked");
      }
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v27, 0, 0, 0);
    }
    xpc_dictionary_set_int64(v6, "resu", 256);
    xpc_connection_send_message((xpc_connection_t)v7, v6);
    if (v16)
      CFRelease(v16);
    goto LABEL_33;
  }
  v19 = sub_100006C90();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_1000326F0();

  ((void (*)(_QWORD *))v9[2])(v9);
LABEL_34:

}

void sub_1000062F8(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  const void *data;
  _BOOL4 v11;
  id v12;
  const __CFData *v13;
  const __CFData *v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  int uint64;
  size_t length;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006BBC;
  v22[3] = &unk_1000457D0;
  v6 = a3;
  v23 = v6;
  v7 = v5;
  v24 = v7;
  v8 = a2;
  v9 = objc_retainBlock(v22);
  length = 0;
  data = xpc_dictionary_get_data(v8, "cdha", &length);
  uint64 = xpc_dictionary_get_uint64(v8, "haty");
  v11 = xpc_dictionary_get_BOOL(v8, "ovrr");

  if (data)
  {
    v12 = objc_alloc((Class)NSMutableData);
    v13 = (const __CFData *)objc_msgSend(v12, "initWithBytes:length:", data, length);
    v14 = v13;
    if (v13)
    {
      -[__CFData appendBytes:length:](v13, "appendBytes:length:", &uint64, 4);
      v15 = sub_10000E704(v14);
      if (v11)
        sub_100009194(CFSTR("UserOverriddenCdHashes.plist"), v15);
      else
        sub_1000093C4(CFSTR("UserOverriddenCdHashes.plist"), v15);
      xpc_dictionary_set_int64(v6, "resu", 1024);
      xpc_connection_send_message((xpc_connection_t)v7, v6);

    }
    else
    {
      v18 = sub_100006C90();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000327F4();

      ((void (*)(_QWORD *))v9[2])(v9);
    }

  }
  else
  {
    v16 = sub_100006C90();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000327C8();

    ((void (*)(_QWORD *))v9[2])(v9);
  }

}

void sub_1000064F0(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t uint64;
  _xpc_connection_s *connection;

  v5 = a3;
  connection = a1;
  uint64 = xpc_dictionary_get_uint64(a2, "phas");
  sub_10000B074(uint64);
  xpc_dictionary_set_int64(v5, "resu", 512);
  xpc_connection_send_message(connection, v5);

}

void sub_10000656C(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t uint64;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;

  v5 = a1;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100006BF8;
  v34[3] = &unk_1000457D0;
  v6 = a3;
  v35 = v6;
  v7 = v5;
  v36 = v7;
  v8 = a2;
  v9 = objc_retainBlock(v34);
  uint64 = xpc_dictionary_get_uint64(v8, "lwid");
  v11 = xpc_dictionary_get_BOOL(v8, "ovrr");

  if (v11)
  {
    v12 = notify_post("com.apple.mis.warning.override");
    if ((_DWORD)v12)
    {
      v13 = v12;
      v14 = sub_100006C90();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100032884(v13, v15, v16, v17, v18, v19, v20, v21);

    }
  }
  v22 = sub_1000038F4();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v33 = 0;
  objc_msgSend(v23, "setUserOverride:forID:error:", v11, uint64, &v33);
  v24 = v33;
  if (v24)
  {
    v25 = sub_100006C90();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100032820((uint64_t)v24, v26, v27, v28, v29, v30, v31, v32);

    ((void (*)(_QWORD *))v9[2])(v9);
  }
  else
  {
    xpc_dictionary_set_int64(v6, "resu", 1024);
    xpc_connection_send_message((xpc_connection_t)v7, v6);
  }

}

void sub_100006730(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  const void *data;
  void *v11;
  int64_t int64;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  size_t length;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  int64_t v38;
  __int16 v39;
  id v40;

  v5 = a1;
  v6 = a2;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100006C34;
  v34[3] = &unk_1000457D0;
  v7 = a3;
  v35 = v7;
  v8 = v5;
  v36 = v8;
  v9 = objc_retainBlock(v34);
  length = 0;
  data = xpc_dictionary_get_data(v6, "cdhd", &length);
  if (data && length)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data));
    int64 = xpc_dictionary_get_int64(v6, "cdht");
    v13 = sub_100006C90();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v38 = int64;
      v39 = 2112;
      v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "XPC: checking launch warning data for: %llu, %@", buf, 0x16u);
    }

    v15 = sub_1000038F4();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v32 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lookupLaunchWarningData:cdhashType:error:", v11, int64, &v32));
    v18 = v32;
    v19 = sub_100006C90();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v22 = objc_msgSend(v17, "length");
        *(_DWORD *)buf = 138412546;
        v38 = (int64_t)v17;
        v39 = 2048;
        v40 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "XPC: launch warning data response: %@, %lu", buf, 0x16u);
      }

      v23 = objc_retainAutorelease(v17);
      xpc_dictionary_set_data(v7, "warndata", objc_msgSend(v23, "bytes"), (size_t)objc_msgSend(v23, "length"));
      xpc_dictionary_set_int64(v7, "resu", 0);
      xpc_connection_send_message((xpc_connection_t)v8, v7);
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100032914((uint64_t)v18, v21, v26, v27, v28, v29, v30, v31);

      ((void (*)(_QWORD *))v9[2])(v9);
    }

  }
  else
  {
    v24 = sub_100006C90();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000328E8();

    ((void (*)(_QWORD *))v9[2])(v9);
  }

}

void *sub_100006A3C(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_10004F048)
  {
    v5 = off_100045738;
    v6 = 0;
    qword_10004F048 = _sl_dlopen(&v5, &v4);
  }
  v2 = (void *)qword_10004F048;
  if (!qword_10004F048)
    sub_100032978(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "MAECopyActivationRecordWithError");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_10004F040 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100006B14(uint64_t a1, int64_t value)
{
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "resu", value);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  return 1;
}

uint64_t sub_100006B50(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

uint64_t sub_100006B74(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "resu", 4);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  return 0;
}

uint64_t sub_100006BBC(uint64_t a1)
{
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "resu", 4);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  return 0;
}

uint64_t sub_100006BF8(uint64_t a1)
{
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "resu", 4);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  return 0;
}

uint64_t sub_100006C34(uint64_t a1)
{
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "resu", 4);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  return 0;
}

void sub_100006C70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006C80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_100006C90()
{
  if (qword_10004F058 != -1)
    dispatch_once(&qword_10004F058, &stru_1000457F0);
  if (qword_10004F050)
    return (id)qword_10004F050;
  else
    return &_os_log_default;
}

void sub_100006CE0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mis", "mis");
  v2 = (void *)qword_10004F050;
  qword_10004F050 = (uint64_t)v1;

}

void sub_100006D10()
{
  id v0;
  NSObject *v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  unsigned int *v36;
  unsigned int *v37;
  int v38;
  uint64_t v39;
  unsigned int *v40;
  pid_t v41;
  unsigned int v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  size_t v62;
  int v63;
  uint8_t v64[4];
  pid_t v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  int v72[2];

  v63 = 0;
  *(_QWORD *)v72 = 0x600000001;
  v62 = 4;
  v0 = sub_100006C90();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "The reaper woke up.", buf, 2u);
  }

  *(_DWORD *)buf = 0;
  v2 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  v4 = MatchingService;
  if (MatchingService)
  {
    v5 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)buf);
    if ((_DWORD)v5)
    {
      v6 = v5;
      v7 = sub_100006C90();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100032AE8(v6, v8, v9, v10, v11, v12, v13, v14);
    }
    else
    {
      v23 = IOConnectCallMethod(*(mach_port_t *)buf, 4u, 0, 0, 0, 0, 0, 0, 0, 0);
      if (!(_DWORD)v23)
        goto LABEL_13;
      v24 = v23;
      v25 = sub_100006C90();
      v8 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100032A84(v24, v8, v26, v27, v28, v29, v30, v31);
    }
  }
  else
  {
    v15 = sub_100006C90();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100032A54(v8, v16, v17, v18, v19, v20, v21, v22);
  }

LABEL_13:
  if (*(_DWORD *)buf)
    IOServiceClose(*(io_connect_t *)buf);
  if (v4)
    IOObjectRelease(v4);
  v32 = sysctl(v72, 2u, &v63, &v62, 0, 0);
  v33 = sub_100006C90();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if (v32 == -1)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1000329F4(v35, v47, v48, v49, v50, v51, v52, v53);
    goto LABEL_36;
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    v67 = v63;
    v68 = 2048;
    v69 = 4;
    v70 = 2048;
    v71 = 4 * v63;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "pid space %d*%lu = %lu", buf, 0x1Cu);
  }

  v36 = (unsigned int *)malloc_type_malloc(4 * v63, 0x100004052888210uLL);
  if (!v36)
  {
    v54 = sub_100006C90();
    v35 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_100032A24(v35, v55, v56, v57, v58, v59, v60, v61);
LABEL_36:

    return;
  }
  v37 = v36;
  v38 = proc_listallpids(v36, 4 * v63);
  if (v38 >= 1)
  {
    v39 = v38;
    v40 = v37;
    do
    {
      v42 = *v40++;
      v41 = v42;
      if ((csops(v42, 5, buf, 20) & 0x80000000) != 0)
      {
        v46 = sub_100006C90();
        v43 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v64 = 67109120;
          v65 = v41;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "reaper could not get cdhash for pid %d", v64, 8u);
        }
      }
      else
      {
        v43 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 20));
        if (MISQueryBlacklistForCdHash(v43, 26, 1, 0, 0))
        {
          v44 = sub_100006C90();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 67109120;
            v65 = v41;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "reaping process %d", v64, 8u);
          }

          kill(v41, 9);
        }
      }

      --v39;
    }
    while (v39);
  }
  free(v37);
}

void sub_1000074FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000754C(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v3)
    CFRelease(v3);
}

uint64_t sub_100007598(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL sub_1000075D0(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint32_t v14;
  SecAccessControlRef v15;
  id *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  id v21;
  id *v22;
  void *v23;
  id v24;
  id *v25;
  void *v26;
  id v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  id *v29;
  void *v30;
  id v31;
  id *v32;
  void *v33;
  id v34;
  void *v35;
  dispatch_semaphore_t v36;
  NSObject *v37;
  id v38;
  __int128 *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  BOOL v46;
  id v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  const void *v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  NSObject *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  OnlineAuthAgentURLSessionDelegate *v69;
  void *v70;
  _QWORD *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  int v85;
  void *v86;
  void *v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  __int128 *v92;
  int v93;
  id v94;
  uint8_t v95[16];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[4];
  id v108;
  __int128 buf;
  uint64_t v110;
  void *v111;
  NSObject *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t *v115;
  _QWORD v116[5];
  id v117;
  __int128 v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  SecAccessControlRef v122;
  void *v123;
  void **v124;
  uint64_t v125;
  void *v126;

  v5 = a1;
  v87 = v5;
  v88 = a3;
  v85 = a2;
  if (a2 < 3)
  {
    v94 = 0;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 0, &v94));
    v9 = v94;
    v7 = v9;
    if (!v86)
    {
      v46 = v9 == 0;
      v47 = sub_100006C90();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
      if (v46)
      {
        if (v49)
          sub_100032D0C();
      }
      else if (v49)
      {
        sub_100032D38(v7, v48);
      }
      goto LABEL_63;
    }
    v10 = sub_100006C90();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v86, 4));
      v13 = objc_msgSend(v12, "UTF8String");
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Sending to server: %s", (uint8_t *)&buf, 0xCu);

    }
    v83 = v86;
    v14 = arc4random_uniform(0x2A300u);
    v84 = objc_alloc_init((Class)NSMutableData);
    v15 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, 0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v110 = 0x2020000000;
    v16 = (id *)qword_10004F060;
    v111 = (void *)qword_10004F060;
    if (!qword_10004F060)
    {
      v17 = (void *)sub_10000892C();
      v16 = (id *)dlsym(v17, "kMAOptionsBAAKeychainLabel");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v16;
      qword_10004F060 = (uint64_t)v16;
    }
    _Block_object_dispose(&buf, 8);
    if (!v16)
      sub_100032DC0();
    v18 = *v16;
    v116[0] = v18;
    *(_QWORD *)&v118 = CFSTR("com.apple.online-auth.ppq-identity");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v110 = 0x2020000000;
    v19 = (id *)qword_10004F070;
    v111 = (void *)qword_10004F070;
    if (!qword_10004F070)
    {
      v20 = (void *)sub_10000892C();
      v19 = (id *)dlsym(v20, "kMAOptionsBAAKeychainAccessGroup");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v19;
      qword_10004F070 = (uint64_t)v19;
    }
    _Block_object_dispose(&buf, 8);
    if (!v19)
      sub_100032E30();
    v21 = *v19;
    v116[1] = v21;
    *((_QWORD *)&v118 + 1) = CFSTR("online-auth-agent");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v110 = 0x2020000000;
    v22 = (id *)qword_10004F078;
    v111 = (void *)qword_10004F078;
    if (!qword_10004F078)
    {
      v23 = (void *)sub_10000892C();
      v22 = (id *)dlsym(v23, "kMAOptionsBAANetworkTimeoutInterval");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v22;
      qword_10004F078 = (uint64_t)v22;
    }
    _Block_object_dispose(&buf, 8);
    if (!v22)
      sub_100032EA0();
    v24 = *v22;
    v116[2] = v24;
    v119 = (uint64_t)&off_100048BE8;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v110 = 0x2020000000;
    v25 = (id *)qword_10004F080;
    v111 = (void *)qword_10004F080;
    if (!qword_10004F080)
    {
      v26 = (void *)sub_10000892C();
      v25 = (id *)dlsym(v26, "kMAOptionsBAAValidity");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v25;
      qword_10004F080 = (uint64_t)v25;
    }
    _Block_object_dispose(&buf, 8);
    if (!v25)
      sub_100032F10();
    v27 = *v25;
    v116[3] = v27;
    v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v14 + 172800));
    v120 = v28;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v110 = 0x2020000000;
    v29 = (id *)qword_10004F088;
    v111 = (void *)qword_10004F088;
    if (!qword_10004F088)
    {
      v30 = (void *)sub_10000892C();
      v29 = (id *)dlsym(v30, "kMAOptionsBAASCRTAttestation");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v29;
      qword_10004F088 = (uint64_t)v29;
    }
    _Block_object_dispose(&buf, 8);
    if (!v29)
      sub_100032F80();
    v31 = *v29;
    v116[4] = v31;
    v121 = (void (*)(uint64_t))&__kCFBooleanFalse;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v110 = 0x2020000000;
    v32 = (id *)qword_10004F090;
    v111 = (void *)qword_10004F090;
    if (!qword_10004F090)
    {
      v33 = (void *)sub_10000892C();
      v32 = (id *)dlsym(v33, "kMAOptionsBAAAccessControls");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v32;
      qword_10004F090 = (uint64_t)v32;
    }
    _Block_object_dispose(&buf, 8);
    if (!v32)
      sub_100032FF0();
    v117 = *v32;
    v122 = v15;
    v34 = v117;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v118, v116, 6));

    v36 = dispatch_semaphore_create(0);
    v106 = 0;
    v107[0] = &v106;
    v107[1] = 0x3032000000;
    v107[2] = sub_1000082DC;
    v107[3] = sub_1000082EC;
    v108 = 0;
    v102 = 0;
    v103 = &v102;
    v104 = 0x2020000000;
    v105 = 0;
    v96 = 0;
    v97 = &v96;
    v98 = 0x3032000000;
    v99 = sub_1000082DC;
    v100 = sub_1000082EC;
    v101 = 0;
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v110 = (uint64_t)sub_1000087D0;
    v111 = &unk_100045890;
    v113 = &v106;
    v114 = &v102;
    v115 = &v96;
    v37 = v36;
    v112 = v37;
    v38 = v35;
    v39 = &buf;
    v123 = 0;
    v124 = &v123;
    v125 = 0x2020000000;
    v40 = off_10004F098;
    v126 = off_10004F098;
    if (!off_10004F098)
    {
      v41 = (void *)sub_10000892C();
      v40 = dlsym(v41, "DeviceIdentityIssueClientCertificateWithCompletion");
      v124[3] = v40;
      off_10004F098 = v40;
    }
    _Block_object_dispose(&v123, 8);
    if (!v40)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void wl_DeviceIdentityIssueClientCertificateWithCompletion(__strong dispatch_queue_t, NSDictionary *__strong, __strong MABAACompletionBlock)"));
      objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, CFSTR("online_auth_server.m"), 34, CFSTR("%s"), dlerror());

      __break(1u);
    }
    ((void (*)(_QWORD, id, __int128 *))v40)(0, v38, v39);

    dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
    CFRelease(v15);
    v42 = (void *)v103[3];
    if (*(_QWORD *)(v107[0] + 40))
    {
      v43 = sub_100006C90();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        sub_100033180((uint64_t)v107, v44, v45);
    }
    else if (v42 && (v50 = (void *)v97[5]) != 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectAtIndexedSubscript:", 0));
      v52 = (const void *)SecIdentityCreate(kCFAllocatorDefault, v51, v42);

      if (v52)
      {
        v44 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v97[5], "objectAtIndexedSubscript:", 1));
        v123 = v53;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v123, 1));
        -[NSObject setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v54, kSecCMSAdditionalCerts);

        v55 = SecCMSCreateSignedData(v52, v83, v44, 0, v84);
        if (!v55)
        {
          if (sub_100004520())
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "base64EncodedStringWithOptions:", 33));
            v79 = sub_100006C90();
            v80 = objc_claimAutoreleasedReturnValue(v79);
            if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v95 = 0;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "CMS Blob:", v95, 2u);
            }

            objc_msgSend(v78, "enumerateLinesUsingBlock:", &stru_1000458D0);
          }
          CFRelease(v52);
          v48 = v84;
LABEL_45:

          _Block_object_dispose(&v96, 8);
          _Block_object_dispose(&v102, 8);
          _Block_object_dispose(&v106, 8);

          if (v48)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://ppq.apple.com/v2/authorization")));
            if (sub_100004520())
            {
              v60 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mis"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "stringForKey:", CFSTR("serverUrl")));

              if (v61)
              {
                v62 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v61));

                v59 = (void *)v62;
              }
              v63 = sub_100006C90();
              v64 = objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                LODWORD(v118) = 138412290;
                *(_QWORD *)((char *)&v118 + 4) = v59;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "ppq Server URL is %@", (uint8_t *)&v118, 0xCu);
              }

            }
            if (!v59)
            {
              v73 = sub_100006C90();
              v66 = objc_claimAutoreleasedReturnValue(v73);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                sub_100033060();
              v8 = 0;
              goto LABEL_74;
            }
            v65 = objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v59));
            v66 = v65;
            if (v65)
            {
              -[NSObject setHTTPMethod:](v65, "setHTTPMethod:", CFSTR("POST"));
              -[NSObject addValue:forHTTPHeaderField:](v66, "addValue:forHTTPHeaderField:", CFSTR("8bit"), CFSTR("Content-Transfer-Encoding"));
              -[NSObject addValue:forHTTPHeaderField:](v66, "addValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
              v67 = objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
              v68 = v67;
              if (v67)
              {
                -[NSObject setTimeoutIntervalForRequest:](v67, "setTimeoutIntervalForRequest:", 10.0);
                -[NSObject setTimeoutIntervalForResource:](v68, "setTimeoutIntervalForResource:", 10.0);
                v69 = objc_alloc_init(OnlineAuthAgentURLSessionDelegate);
                v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v68, v69, 0));
                if (v70)
                {
                  *(_QWORD *)&v118 = 0;
                  *((_QWORD *)&v118 + 1) = &v118;
                  v119 = 0x3032000000;
                  v120 = sub_1000082DC;
                  v121 = sub_1000082EC;
                  v122 = (SecAccessControlRef)os_transaction_create("ppq request");
                  v89[0] = _NSConcreteStackBlock;
                  v89[1] = 3221225472;
                  v89[2] = sub_1000082F4;
                  v89[3] = &unk_100045868;
                  v93 = v85;
                  v90 = v87;
                  v91 = v88;
                  v92 = &v118;
                  v71 = objc_retainBlock(v89);
                  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "uploadTaskWithRequest:fromData:completionHandler:", v66, v48, v71));
                  objc_msgSend(v70, "finishTasksAndInvalidate");
                  v8 = v72 != 0;
                  if (v72)
                  {
                    objc_msgSend(v72, "resume");
                  }
                  else
                  {
                    v76 = *(void **)(*((_QWORD *)&v118 + 1) + 40);
                    *(_QWORD *)(*((_QWORD *)&v118 + 1) + 40) = 0;

                  }
                  _Block_object_dispose(&v118, 8);

                }
                else
                {
                  v8 = 0;
                }

                goto LABEL_73;
              }
            }
            else
            {
              v74 = sub_100006C90();
              v68 = objc_claimAutoreleasedReturnValue(v74);
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                sub_10003308C();
            }
            v8 = 0;
LABEL_73:

LABEL_74:
            goto LABEL_75;
          }
LABEL_63:
          v8 = 0;
LABEL_75:

          goto LABEL_76;
        }
        v56 = sub_100006C90();
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          sub_100033110(v55, v57);

        CFRelease(v52);
      }
      else
      {
        v75 = sub_100006C90();
        v44 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          sub_1000330E4();
      }
    }
    else
    {
      v58 = sub_100006C90();
      v44 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        sub_1000330B8();
    }
    v48 = 0;
    goto LABEL_45;
  }
  v6 = sub_100006C90();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v85;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Maximum number of attempts (%d) reached, bailing out.", (uint8_t *)&buf, 8u);
  }
  v8 = 0;
LABEL_76:

  return v8;
}

void sub_100008240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000082DC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000082EC(uint64_t a1)
{

}

void sub_1000082F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t ApplePPQSigning;
  const void *v14;
  int v15;
  int v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  NSObject *v30;
  int v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void (*v43)(void);
  id v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint8_t buf[4];
  _QWORD v52[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v50 = 0;
  v10 = objc_opt_class(NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0 || (v11 = objc_msgSend(v8, "statusCode"), v11 == (id)200))
  {
    v12 = 0;
    if (v7)
      goto LABEL_4;
LABEL_16:
    v26 = sub_100006C90();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Server returned no data", buf, 2u);
    }
    goto LABEL_20;
  }
  v23 = v11;
  v24 = sub_100006C90();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v52[0] = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Server returned HTTP status code %ld", buf, 0xCu);
  }

  v12 = 1;
  if (!v7)
    goto LABEL_16;
LABEL_4:
  ApplePPQSigning = SecPolicyCreateApplePPQSigning();
  if (!ApplePPQSigning)
  {
    v28 = sub_100006C90();
    v27 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100033278();
LABEL_20:

    goto LABEL_21;
  }
  v14 = (const void *)ApplePPQSigning;
  v15 = SecCMSVerifyCopyDataAndAttributes(v7, 0, ApplePPQSigning, 0, &v50, 0);
  if (v15)
  {
    v16 = v15;
    v17 = sub_100006C90();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v52[0]) = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not verify the CMS blob, received error %d", buf, 8u);
    }

    if (sub_100004520())
    {
      v19 = sub_100006C90();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4));
        v22 = objc_msgSend(v21, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v52[0] = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "The server returned: %s", buf, 0xCu);

      }
    }
    CFRelease(v14);
    goto LABEL_21;
  }
  CFRelease(v14);
  if ((v12 & 1) != 0)
  {
LABEL_21:
    v29 = sub_100006C90();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_DWORD *)(a1 + 56) + 1;
      *(_DWORD *)buf = 67109376;
      LODWORD(v52[0]) = v31;
      WORD2(v52[0]) = 1024;
      *(_DWORD *)((char *)v52 + 6) = 3;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Could not complete online authorization (attempt %d/%d).", buf, 0xEu);
    }

    if (v9)
    {
      v32 = sub_100006C90();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_1000331F4(v9, v33);

    }
    if ((sub_1000075D0(*(_QWORD *)(a1 + 32), (*(_DWORD *)(a1 + 56) + 1), *(_QWORD *)(a1 + 40)) & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v35 = *(void **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = 0;
    goto LABEL_30;
  }
  v36 = v50;
  v37 = sub_100006C90();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v36, 4));
    v40 = objc_msgSend(v39, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v52[0] = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "The server returned: %s", buf, 0xCu);

  }
  v49 = 0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v36, 0, &v49));
  v42 = v49;
  v35 = v42;
  if (v41)
  {
    v43 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v42)
    {
      v44 = sub_100006C90();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v52[0] = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Could not convert JSON to Dictionary: %@", buf, 0xCu);

      }
    }
    v43 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v43();
  v47 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v48 = *(void **)(v47 + 40);
  *(_QWORD *)(v47 + 40) = 0;

LABEL_30:
}

void sub_1000087D0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if (v9 && objc_msgSend(v9, "count") == (id)2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10000887C(id a1, NSString *a2, BOOL *a3)
{
  NSString *v4;
  id v5;
  NSObject *v6;
  int v7;
  NSString *v8;

  v4 = a2;
  *a3 = 0;
  v5 = sub_100006C90();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t sub_10000892C()
{
  uint64_t v0;
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = 0;
  if (!qword_10004F068)
  {
    v3 = off_1000458F0;
    v4 = 0;
    qword_10004F068 = _sl_dlopen(&v3, &v2);
  }
  v0 = qword_10004F068;
  if (!qword_10004F068)
    sub_1000332A4(&v2);
  if (v2)
    free(v2);
  return v0;
}

char *sub_1000089D4()
{
  return dlerror();
}

void sub_1000089DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1000089E8(const __CFString *a1@<X0>, char **a2@<X8>)
{
  CFIndex Length;
  CFIndex v5;
  char *v6;
  int v7;
  int v8;
  off_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  off_t v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  off_t v33;

  Length = CFStringGetLength(a1);
  v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v6 = (char *)CFAllocatorAllocate(0, v5, 0);
  if (v6)
  {
    if (CFStringGetCString(a1, v6, v5, 0x8000100u))
    {
      v7 = open(v6, 0);
      if ((v7 & 0x80000000) == 0)
      {
        v8 = v7;
        v9 = lseek(v7, 0, 2);
        if (v9 > 23)
        {
          v17 = (char *)mmap(0, v9, 1, 2, v8, 0);
          if (v17 == (char *)-1)
          {
            v20 = sub_100006C90();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              sub_1000334F8(v20);
            v11 = -1;
          }
          else
          {
            v11 = (uint64_t)v17;
            a2[2] = 0;
            a2[3] = 0;
            *((_DWORD *)a2 + 6) = v8;
            a2[4] = v17;
            a2[5] = (char *)v9;
            *a2 = v17;
            a2[1] = 0;
            if (*(_DWORD *)v17 == 1134124660)
            {
              v18 = *((unsigned int *)v17 + 2);
              if (v9 >= v18)
              {
                v25 = &v17[v18];
                v26 = *((unsigned int *)v17 + 3);
                v27 = &v25[32 * v26];
                a2[1] = v25;
                a2[2] = v27;
                v28 = &v27[4 * v26];
                v29 = v28 - &v17[v9];
                if (v28 <= &v17[v9])
                {
LABEL_35:
                  CFAllocatorDeallocate(0, v6);
                  return;
                }
                v30 = sub_100006C90();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  v32 = 134217984;
                  v33 = v29;
                  _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Denylist is %td bytes short for entry count", (uint8_t *)&v32, 0xCu);
                }
              }
              else
              {
                v19 = sub_100006C90();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  sub_100033574();
              }
            }
            else
            {
              v21 = sub_100006C90();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                sub_1000335F4();
            }
          }
        }
        else
        {
          v10 = sub_100006C90();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            sub_100033478(v9, v10);
          if (v9 < 1)
            goto LABEL_30;
          v11 = 0;
        }
        if ((unint64_t)(v11 + 1) >= 2)
          munmap((void *)v11, v9);
LABEL_30:
        close(v8);
        goto LABEL_31;
      }
      v14 = *__error();
      v15 = sub_100006C90();
      v16 = v15;
      if (v14 == 2)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          sub_1000333D0();
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        sub_1000333FC(v16);
      }
    }
    else
    {
      v13 = sub_100006C90();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000333A4();
    }
  }
  else
  {
    v12 = sub_100006C90();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100033378();
  }
LABEL_31:
  v22 = sub_100006C90();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    sub_10003334C();
  v23 = (char *)mmap(0, 0x18uLL, 3, 4098, -1, 0);
  if (v23 == (char *)-1)
  {
    v31 = sub_100006C90();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_100033320();
    abort();
  }
  v24 = v23;
  *((_QWORD *)v23 + 2) = 0;
  *(_OWORD *)v23 = xmmword_100036B08;
  mprotect(v23, 0x18uLL, 1);
  *a2 = v24;
  a2[1] = 0;
  a2[2] = 0;
  a2[3] = (char *)0xFFFFFFFFLL;
  a2[4] = v24;
  a2[5] = (char *)24;
  if (v6)
    goto LABEL_35;
}

uint64_t sub_100008D8C(uint64_t a1)
{
  size_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    if ((unint64_t)v3 + 1 >= 2)
      munmap(v3, v2);
  }
  result = *(unsigned int *)(a1 + 24);
  if ((result & 0x80000000) == 0)
    return close(result);
  return result;
}

void *sub_100008DD8(uint64_t a1, void *__key)
{
  void *result;

  result = bsearch_b(__key, *(const void **)(a1 + 8), *(unsigned int *)(*(_QWORD *)a1 + 12), 0x20uLL, &stru_100045928);
  if (result)
    return (void *)(*(_QWORD *)(a1 + 16) + (((uint64_t)result - *(_QWORD *)(a1 + 8)) >> 3));
  return result;
}

int sub_100008E24(id a1, const void *a2, const void *a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = bswap64(*(_QWORD *)a2);
  v4 = bswap64(*(_QWORD *)a3);
  if (v3 == v4)
  {
    v3 = bswap64(*((_QWORD *)a2 + 1));
    v4 = bswap64(*((_QWORD *)a3 + 1));
    if (v3 == v4)
    {
      v3 = bswap64(*((_QWORD *)a2 + 2));
      v4 = bswap64(*((_QWORD *)a3 + 2));
      if (v3 == v4)
      {
        v3 = bswap64(*((_QWORD *)a2 + 3));
        v4 = bswap64(*((_QWORD *)a3 + 3));
        if (v3 == v4)
          return 0;
      }
    }
  }
  if (v3 < v4)
    return -1;
  return 1;
}

void sub_100008E9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_100008EA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id sub_100008EC4(uint64_t a1)
{
  return objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", a1);
}

id sub_100008ED4()
{
  if (qword_10004F0A0 != -1)
    dispatch_once(&qword_10004F0A0, &stru_100045A88);
  return (id)qword_10004F0A8;
}

id sub_100008F14(void *a1, int a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a1;
  v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithContentsOfFile:", v3);

  if (v4)
    return v4;
  v5 = sub_100006C90();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "could not read in auth list (may be non-existing)", buf, 2u);
  }

  if (!a2)
  {
    v4 = 0;
    return v4;
  }
  v7 = sub_100006C90();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "creating empty auth list", v10, 2u);
  }

  return objc_alloc_init((Class)NSArray);
}

id sub_100009010(uint64_t a1, unsigned int a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a1, a2, 0));
  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v2, 0, 0, &v15));
  v4 = v15;
  if (!v3 || (v5 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v3, v5) & 1) == 0))
  {
    v6 = sub_100006C90();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003365C((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

  }
  return v3;
}

BOOL sub_1000090E4(void *a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000916C;
  v6[3] = &unk_100045950;
  v7 = a2;
  v3 = v7;
  v4 = objc_msgSend(a1, "indexOfObjectPassingTest:", v6) != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

BOOL sub_10000916C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "compare:options:", a2, 1) == 0;
}

uint64_t sub_100009194(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a1;
  v4 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = sub_100008ED4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009278;
  block[3] = &unk_100045978;
  v12 = v3;
  v13 = v4;
  v14 = &v15;
  v7 = v4;
  v8 = v3;
  dispatch_sync(v6, block);

  v9 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_100009278(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;

  v2 = objc_alloc((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 32)));
  v4 = sub_100008F14(v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = objc_msgSend(v2, "initWithArray:", v5);

  if (sub_1000090E4(v7, *(void **)(a1 + 40)))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));
    sub_100009338(v7, *(_QWORD *)(a1 + 32));
    v6 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

}

void sub_100009338(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", a2));
  v5 = objc_msgSend(v3, "writeToFile:atomically:", v4, 1);

  if ((v5 & 1) == 0)
  {
    v6 = sub_100006C90();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000336C0(v7);

  }
}

uint64_t sub_1000093C4(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a1;
  v4 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = sub_100008ED4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000094A8;
  block[3] = &unk_100045978;
  v12 = v3;
  v13 = v4;
  v14 = &v15;
  v7 = v4;
  v8 = v3;
  dispatch_sync(v6, block);

  v9 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_1000094A8(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;

  v2 = objc_alloc((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 32)));
  v4 = sub_100008F14(v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = objc_msgSend(v2, "initWithArray:", v5);

  if (sub_1000090E4(v7, *(void **)(a1 + 40)))
  {
    objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));
    sub_100009338(v7, *(_QWORD *)(a1 + 32));
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

}

void sub_100009568(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v5 = sub_100008ED4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009618;
  block[3] = &unk_1000459A0;
  v10 = v3;
  v11 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_sync(v6, block);

}

void sub_100009618(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = sub_1000097C8();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v14 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("cdhash")));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("upp-uuid")));
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13
          && (objc_msgSend(v10, "compare:options:", *(_QWORD *)(a1 + 32), 1)
           || objc_msgSend(v12, "compare:options:", *(_QWORD *)(a1 + 40), 1)))
        {
          objc_msgSend(v14, "addObject:", v9);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  sub_100009338(v14, (uint64_t)CFSTR("Indeterminates.plist"));
}

id sub_1000097C8()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  CFDataRef v37;
  void *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[128];

  v0 = objc_alloc((Class)NSMutableArray);
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", CFSTR("Indeterminates.plist")));
  v2 = objc_msgSend(v0, "initWithContentsOfFile:", v1);

  if (v2)
  {
    v32 = v2;
    v3 = v2;
    v33 = objc_alloc_init((Class)NSMutableArray);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v42;
      v7 = &_s10Foundation10POSIXErrorV8_nsErrorSo7NSErrorCvg_ptr;
      do
      {
        v8 = 0;
        v39 = v5;
        do
        {
          if (*(_QWORD *)v42 != v6)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v8);
          v10 = objc_opt_class(v7[337]);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            v11 = objc_msgSend(v9, "mutableCopy");
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("cdhash")));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("upp-uuid")));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("firstFailure")));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("lastCheck")));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("type")));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("grace")));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("attempts")));
            v19 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v12, v19) & 1) != 0
              && (v20 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v13, v20) & 1) != 0)
              && (v21 = objc_opt_class(NSDate), (objc_opt_isKindOfClass(v14, v21) & 1) != 0)
              && (v22 = objc_opt_class(NSDate), (objc_opt_isKindOfClass(v15, v22) & 1) != 0)
              && (v23 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v16, v23) & 1) != 0))
            {
              v37 = sub_10000E570(v12);

              if (v37)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                v36 = v14;
                v35 = v15;
                v34 = v16;
                if (objc_msgSend(v36, "compare:", v38) == (id)1)
                {
                  NSLog(CFSTR("firstFailure in %@ is in the future, throwing away"), v36);
                }
                else if (objc_msgSend(v35, "compare:", v38) == (id)1)
                {
                  NSLog(CFSTR("lastCheck in %@ is in the future, throwing away"), v35);
                }
                else if (objc_msgSend(v34, "intValue") < 2)
                {
                  if (v18)
                  {
                    v24 = objc_opt_class(NSNumber);
                    if ((objc_opt_isKindOfClass(v18, v24) & 1) == 0)
                    {
                      NSLog(CFSTR("attempt in row %@ is not a number, removing"), v11);
                      objc_msgSend(v11, "removeObjectForKey:", CFSTR("attempts"));
                    }
                  }
                  v25 = objc_opt_class(NSNumber);
                  if ((objc_opt_isKindOfClass(v17, v25) & 1) == 0)
                  {
                    v31 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));

                    v17 = (void *)v31;
                    objc_msgSend(v11, "setObject:forKey:", v31, CFSTR("grace"));
                  }
                  objc_msgSend(v33, "addObject:", v11);
                }
                else
                {
                  NSLog(CFSTR("type in row %@ is invalid, throwing away"), v11);
                }

              }
              else
              {
                NSLog(CFSTR("cannot decode cdhash: %@"), v12);
              }
            }
            else
            {
              NSLog(CFSTR("bad or incomplete indeterminates row: %@"), v11);
            }

            v5 = v39;
            v7 = &_s10Foundation10POSIXErrorV8_nsErrorSo7NSErrorCvg_ptr;
          }
          else
          {
            NSLog(CFSTR("indeterminates row is not a dictionary, but %@"), v9);
          }
          v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
        v5 = v26;
      }
      while (v26);
    }

    v2 = v32;
    v27 = v33;
  }
  else
  {
    v28 = sub_100006C90();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "could not read in indeterminates, creating new one", buf, 2u);
    }

    v27 = objc_alloc_init((Class)NSMutableArray);
  }

  return v27;
}

void sub_100009CB4(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v5 = sub_100008ED4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D64;
  block[3] = &unk_1000459A0;
  v10 = v3;
  v11 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_sync(v6, block);

}

void sub_100009D64(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = sub_100009F0C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("cdhash")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("upp-uuid")));
        v12 = v11;
        if (!v11
          || objc_msgSend(v11, "compare:options:", *(_QWORD *)(a1 + 32), 1)
          || objc_msgSend(v10, "compare:options:", *(_QWORD *)(a1 + 40), 1))
        {
          objc_msgSend(v4, "addObject:", v9);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  sub_100009338(v4, (uint64_t)CFSTR("Rejections.plist"));
}

id sub_100009F0C()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFDataRef v20;
  id v21;
  id v22;
  NSObject *v23;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[128];

  v0 = objc_alloc((Class)NSMutableArray);
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", CFSTR("Rejections.plist")));
  v2 = objc_msgSend(v0, "initWithContentsOfFile:", v1);

  if (v2)
  {
    v25 = v2;
    v3 = v2;
    v26 = objc_alloc_init((Class)NSMutableArray);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v27 = v4;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
          v10 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            v11 = objc_msgSend(v9, "mutableCopy");
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("cdhash")));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("upp-uuid")));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("teamid")));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("wholeProfile")));
            v16 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0
              && (v17 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v12, v17) & 1) != 0)
              && (v18 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v14, v18) & 1) != 0)
              && (v19 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v15, v19) & 1) != 0))
            {
              v20 = sub_10000E570(v12);

              if (v20)
                objc_msgSend(v26, "addObject:", v11);
              else
                NSLog(CFSTR("cannot decode rejections cdhash: %@"), v12);
              v4 = v27;
            }
            else
            {
              NSLog(CFSTR("bad or incomplete rejections row: %@"), v11);
            }

          }
          else
          {
            NSLog(CFSTR("rejections row is not a dictionary, but %@"), v9);
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
        v6 = v21;
      }
      while (v21);
    }

    v2 = v25;
  }
  else
  {
    v22 = sub_100006C90();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "could not read in rejections, creating new one", buf, 2u);
    }

    v26 = objc_alloc_init((Class)NSMutableArray);
  }

  return v26;
}

void sub_10000A230(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = sub_100008ED4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A324;
  block[3] = &unk_1000459C8;
  v20 = v11;
  v21 = v12;
  v24 = a5;
  v25 = a6;
  v22 = v13;
  v23 = a4;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_sync(v15, block);

}

void sub_10000A324(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSNumber *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _UNKNOWN **v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  id v27;

  v3 = a1 + 56;
  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 0:
      v4 = 0;
      goto LABEL_6;
    case 2:
      v11 = sub_1000097C8();
      v27 = (id)objc_claimAutoreleasedReturnValue(v11);
      v12 = sub_10000A5D4(*(void **)(a1 + 32), *(void **)(a1 + 40), v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v7 = v13;
      if (v13)
        sub_10000A784(v13, *(_DWORD **)(a1 + 64), *(_QWORD **)(a1 + 72));
      goto LABEL_25;
    case 1:
      v4 = 1;
LABEL_6:
      v5 = sub_1000097C8();
      v27 = (id)objc_claimAutoreleasedReturnValue(v5);
      v6 = sub_10000A5D4(*(void **)(a1 + 32), *(void **)(a1 + 40), v27);
      v7 = (id)objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      if (!v7)
      {
        v7 = objc_alloc_init((Class)NSMutableDictionary);
        objc_msgSend(v7, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("cdhash"));
        objc_msgSend(v7, "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("upp-uuid"));
        objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("firstFailure"));
        objc_msgSend(v7, "setValue:forKey:", *(_QWORD *)(a1 + 48), CFSTR("teamid"));
        if ((v4 & 1) != 0)
        {
          v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", sub_10000A854(*(void **)(a1 + 40)) + 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("grace"));

        }
        else
        {
          objc_msgSend(v7, "setValue:forKey:", 0, CFSTR("grace"));
        }
        objc_msgSend(v7, "setValue:forKey:", &off_100048C00, CFSTR("attempts"));
        objc_msgSend(v27, "addObject:", v7);
      }
      sub_10000A784(v7, *(_DWORD **)(a1 + 64), *(_QWORD **)(a1 + 72));
      objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("lastCheck"));
      if (v4)
        v22 = &off_100048C18;
      else
        v22 = &off_100048C00;
      objc_msgSend(v7, "setValue:forKey:", v22, CFSTR("type"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("grace")));
      v24 = objc_msgSend(v23, "intValue");

      if (v24 > 0)
        v25 = v4;
      else
        v25 = 0;
      if (v25 == 1)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v24 - 1)));
        objc_msgSend(v7, "setValue:forKey:", v26, CFSTR("grace"));

      }
      sub_100009338(v27, (uint64_t)CFSTR("Indeterminates.plist"));

LABEL_25:
      return;
  }
  v14 = sub_100006C90();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100033700(v3, v15, v16, v17, v18, v19, v20, v21);

}

id sub_10000A5D4(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a1;
  v18 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("cdhash")));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("upp-uuid")));
        v14 = (void *)v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (!v15 && !objc_msgSend(v12, "compare:options:", v5, 1) && !objc_msgSend(v14, "compare:options:", v18, 1))
        {
          v16 = v11;

          goto LABEL_16;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_16:

  return v16;
}

void sub_10000A784(void *a1, _DWORD *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("attempts")));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue") + 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    objc_msgSend(v9, "setValue:forKey:", v8, CFSTR("attempts"));

    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  LODWORD(v7) = 0;
  if (a2)
LABEL_3:
    *a2 = v7;
LABEL_4:
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("firstFailure")));

}

uint64_t sub_10000A854(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v1 = a1;
  v2 = sub_10000B7E4();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("upp-uuid"), (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("grace")));
        if (!objc_msgSend(v9, "compare:options:", v1, 1))
        {
          v11 = (uint64_t)objc_msgSend(v10, "intValue");

          goto LABEL_11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 33;
LABEL_11:

  return v11;
}

void sub_10000A9D0(void *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = sub_100008ED4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AAB4;
  block[3] = &unk_1000459F0;
  v16 = v8;
  v17 = v7;
  v18 = v9;
  v19 = a4;
  v12 = v9;
  v13 = v7;
  v14 = v8;
  dispatch_sync(v11, block);

}

void sub_10000AAB4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  _UNKNOWN **v5;
  id v6;

  v2 = sub_100009F0C();
  v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = sub_10000A5D4(*(void **)(a1 + 32), *(void **)(a1 + 40), v6);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("upp-uuid"));
    objc_msgSend(v4, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("cdhash"));
    objc_msgSend(v4, "setValue:forKey:", *(_QWORD *)(a1 + 48), CFSTR("teamid"));
    if (*(_BYTE *)(a1 + 56))
      v5 = &off_100048C18;
    else
      v5 = &off_100048C00;
    objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("wholeProfile"));
    objc_msgSend(v6, "addObject:", v4);
  }
  sub_100009338(v6, (uint64_t)CFSTR("Rejections.plist"));

}

uint64_t sub_10000AB98(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v1 = a1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = sub_100008ED4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AC58;
  v7[3] = &unk_100045A18;
  v8 = v1;
  v9 = &v10;
  v4 = v1;
  dispatch_sync(v3, v7);

  v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_10000AC58(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v1 = sub_100009F0C();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(v1);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("upp-uuid")));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("cdhash")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("wholeProfile")));
        v11 = v10;
        if (v8)
          v12 = v9 == 0;
        else
          v12 = 1;
        v13 = v12 || v10 == 0;
        if (!v13
          && objc_msgSend(v10, "BOOLValue")
          && !objc_msgSend(v9, "compare:options:", *(_QWORD *)(a1 + 32), 1))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_19;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_19:

}

uint64_t sub_10000AE10(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v1 = a1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = sub_100008ED4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AED0;
  v7[3] = &unk_100045A18;
  v8 = v1;
  v9 = &v10;
  v4 = v1;
  dispatch_sync(v3, v7);

  v5 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_10000AED0(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v1 = sub_100009F0C();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("upp-uuid")));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("cdhash")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("wholeProfile")));
        v11 = v10;
        if (v8)
          v12 = v9 == 0;
        else
          v12 = 1;
        v13 = v12 || v10 == 0;
        if (!v13
          && objc_msgSend(v10, "BOOLValue")
          && !objc_msgSend(v8, "compare:options:", *(_QWORD *)(a1 + 32), 1))
        {
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

uint64_t sub_10000B074(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  CFArrayRef v5;
  _TtC17online_auth_agent24UserTrustAgentOperations *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;
  _QWORD v15[4];
  _TtC17online_auth_agent24UserTrustAgentOperations *v16;
  uint8_t buf[4];
  uint64_t v18;

  if (a1 != 1)
    return 1;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", CFSTR("UserTrustedUpps.plist")));
  if ((objc_msgSend(v1, "fileExistsAtPath:", v2) & 1) != 0)
  {
    v3 = sub_100006C90();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = 1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Upgrading MIS data: Migrating old trusted UPP plist to new database (phase %llu)", buf, 0xCu);
    }

    v5 = sub_100003280(CFSTR("UserTrustedUpps.plist"), 1);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000B2CC;
    v15[3] = &unk_100045A40;
    v6 = objc_opt_new(_TtC17online_auth_agent24UserTrustAgentOperations);
    v16 = v6;
    if (sub_10000330C(v5, (uint64_t)v15))
    {
      v7 = sub_100006C90();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing old trusted UPP plist", buf, 2u);
      }

      v14 = 0;
      objc_msgSend(v1, "removeItemAtPath:error:", v2, &v14);
      v9 = v14;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", CFSTR("Version.plist")));
      v13 = v9;
      objc_msgSend(v1, "removeItemAtPath:error:", v10, &v13);
      v11 = v13;

      CFRelease(v5);
      return 1;
    }

  }
  return 0;
}

BOOL sub_10000B2CC(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", a2);
  v5 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v5, "createUserTrustedProfileEntryWithUuid:teamId:signature:error:", v4, 0, 0, &v10);
  v6 = v10;
  if (v6)
  {
    v7 = sub_100006C90();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100033768(a2, (uint64_t)v6, v8);

  }
  return v6 == 0;
}

void sub_10000B384(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  int v14;

  v3 = a1;
  v4 = a2;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v5 = sub_100008ED4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B45C;
  block[3] = &unk_100045A68;
  v11 = v4;
  v12 = v13;
  v10 = v3;
  v7 = v4;
  v8 = v3;
  dispatch_sync(v6, block);

  _Block_object_dispose(v13, 8);
}

void sub_10000B45C(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  signed int v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v2 = sub_10000B7E4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v31 = objc_alloc_init((Class)NSMutableDictionary);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("upp-uuid")));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("grace")));
        if (!objc_msgSend(v10, "compare:options:", *(_QWORD *)(a1 + 32), 1))
        {
          v13 = objc_msgSend(*(id *)(a1 + 40), "intValue");
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13
                                                                      - objc_msgSend(v11, "intValue");
          objc_msgSend(v9, "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("grace"));

          v12 = v31;
          goto LABEL_11;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v6)
        continue;
      break;
    }
  }

  v12 = v31;
  objc_msgSend(v31, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("upp-uuid"));
  objc_msgSend(v31, "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("grace"));
  objc_msgSend(v4, "addObject:", v31);
LABEL_11:
  sub_100009338(v4, (uint64_t)CFSTR("AGP.plist"));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v30 = v4;
    v14 = sub_1000097C8();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      v19 = CFSTR("upp-uuid");
      do
      {
        v20 = 0;
        v32 = v17;
        do
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v19));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("grace")));
          if (!objc_msgSend(v22, "compare:options:", *(_QWORD *)(a1 + 32), 1)
            && (int)objc_msgSend(v23, "intValue") >= 1)
          {
            v24 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
                + objc_msgSend(v23, "intValue");
            v25 = v18;
            v26 = v19;
            v27 = a1;
            v28 = v15;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24 & ~(v24 >> 31)));
            objc_msgSend(v21, "setValue:forKey:", v29, CFSTR("grace"));

            v15 = v28;
            a1 = v27;
            v19 = v26;
            v18 = v25;
            v17 = v32;
          }

          v20 = (char *)v20 + 1;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v17);
    }
    sub_100009338(v15, (uint64_t)CFSTR("Indeterminates.plist"));

    v4 = v30;
    v12 = v31;
  }

}

id sub_10000B7E4()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[128];

  v0 = objc_alloc((Class)NSMutableArray);
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/MobileIdentityData"), "stringByAppendingPathComponent:", CFSTR("AGP.plist")));
  v2 = objc_msgSend(v0, "initWithContentsOfFile:", v1);

  if (v2)
  {
    v19 = v2;
    v3 = v2;
    v20 = objc_alloc_init((Class)NSMutableArray);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8);
          v10 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            v11 = objc_msgSend(v9, "mutableCopy");
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("upp-uuid")));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("grace")));
            v14 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0
              && (v15 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
            {
              objc_msgSend(v20, "addObject:", v11);
            }
            else
            {
              NSLog(CFSTR("bad or incomplete graces row: %@"), v11);
            }

          }
          else
          {
            NSLog(CFSTR("graces row is not a dictionary, but %@"), v9);
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, buf, 16);
      }
      while (v6);
    }

    v2 = v19;
  }
  else
  {
    v16 = sub_100006C90();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "could not read in graces, creating new one", buf, 2u);
    }

    v20 = objc_alloc_init((Class)NSMutableArray);
  }

  return v20;
}

void sub_10000BA6C(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("auth-list-queue", v4);
  v3 = (void *)qword_10004F0A8;
  qword_10004F0A8 = (uint64_t)v2;

}

id sub_10000BABC()
{
  return (id)MGCopyAnswer(CFSTR("ReleaseType"), 0);
}

uint64_t sub_10000BADC()
{
  return MGGetBoolAnswer(CFSTR("SigningFuse"));
}

uint64_t sub_10000BAE8()
{
  return MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
}

const __CFString *sub_10000BAF8()
{
  return CFSTR("Internal");
}

void sub_10000BB04()
{
  void *v0;
  dispatch_time_t v1;
  id v2;
  void *v3;
  _BYTE *v4;
  int ResultFailure;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  const char *v27;
  id v28;
  id v29;
  const char *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  NSObject *dsema;
  id v48;
  NSObject *val;
  id v50;
  id v51;
  uint64_t v52;
  id obj;
  _QWORD v54[5];
  uint8_t v55;
  char v56[15];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  NSObject *v62;
  _BYTE v63[128];
  _BYTE v64[32];
  __int128 v65;
  __int128 buf;
  __int128 v67;
  __int128 v68;

  v0 = (void *)objc_opt_new(MADownloadOptions);
  objc_msgSend(v0, "setAllowsCellularAccess:", 1);
  objc_msgSend(v0, "setAllowsExpensiveAccess:", 1);
  objc_msgSend(v0, "setRequiresPowerPluggedIn:", 0);
  objc_msgSend(v0, "setDiscretionary:", 1);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10000C2BC;
  v61[3] = &unk_100045AB0;
  v46 = v0;
  dsema = dispatch_semaphore_create(0);
  v62 = dsema;
  +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.MobileIdentityService.DenyList"), v0, v61);
  v1 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(dsema, v1);
  v48 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.MobileIdentityService.DenyList"));
  v2 = objc_msgSend(v48, "queryMetaDataSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "results"));
  v4 = v64;
  if (!v3 || (ResultFailure = MAIsQueryResultFailure(v2), v3, ResultFailure))
  {
    v6 = sub_100006C90();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Denylist asset query failed: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_54;
  }
  v67 = 0u;
  v68 = 0u;
  buf = 0u;
  v8 = (const __CFString *)sub_100008EC4((uint64_t)CFSTR("denylist.map"));
  sub_1000089E8(v8, (char **)&buf);
  v50 = *(id *)(buf + 16);
  *(_OWORD *)v64 = buf;
  *(_OWORD *)&v64[16] = v67;
  v65 = v68;
  sub_100008D8C((uint64_t)v64);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "results"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (!v9)
  {

    goto LABEL_46;
  }
  val = 0;
  v10 = *(_QWORD *)v58;
  v11 = ASAttributeCompatibilityVersion;
  v52 = ASAttributeContentVersion;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributes"));
      v15 = v14;
      if (v14)
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11));
        if (v16
          && (v17 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          && -[NSObject intValue](v16, "intValue") == 1)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v52));
          if (v18 && (v19 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v18, v19) & 1) != 0))
          {
            v20 = sub_100006C90();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = objc_msgSend(v13, "state");
              *(_DWORD *)v64 = 138412802;
              *(_QWORD *)&v64[4] = v13;
              *(_WORD *)&v64[12] = 2112;
              *(_QWORD *)&v64[14] = v18;
              *(_WORD *)&v64[22] = 2048;
              *(_QWORD *)&v64[24] = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Seeing denylist asset '%@' (version '%@', state %ld)", v64, 0x20u);
            }

            v23 = -[NSObject unsignedLongLongValue](v18, "unsignedLongLongValue");
            if (v23 > v50)
            {
              v24 = v13;
              v25 = val;
              val = v24;
              v50 = v23;
              goto LABEL_35;
            }
          }
          else
          {
            v29 = sub_100006C90();
            v25 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              if (v18)
              {
                v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject debugDescription](v18, "debugDescription")));
                v30 = (const char *)objc_msgSend(v51, "UTF8String");
              }
              else
              {
                v30 = "NULL";
              }
              *(_DWORD *)v64 = 136315138;
              *(_QWORD *)&v64[4] = v30;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Skipping asset with unparsable content version '%s'.", v64, 0xCu);
              if (v18)

            }
LABEL_35:

          }
        }
        else
        {
          v26 = sub_100006C90();
          v18 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            if (v16)
            {
              v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject debugDescription](v16, "debugDescription")));
              v27 = (const char *)objc_msgSend(v4, "UTF8String");
            }
            else
            {
              v27 = "NULL";
            }
            *(_DWORD *)v64 = 136315138;
            *(_QWORD *)&v64[4] = v27;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping asset with incompatible compatibility version '%s'.", v64, 0xCu);
            if (v16)

          }
        }

        goto LABEL_37;
      }
      v28 = sub_100006C90();
      v16 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100033814(&v55, v56, v16);
LABEL_37:

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  }
  while (v9);

  if (val)
  {
    v31 = sub_100006C90();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetId](val, "assetId"));
      v34 = -[NSObject state](val, "state");
      v35 = MAStringForMAAssetState(-[NSObject state](val, "state"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)v64 = 138412802;
      *(_QWORD *)&v64[4] = v33;
      *(_WORD *)&v64[12] = 2048;
      *(_QWORD *)&v64[14] = v34;
      *(_WORD *)&v64[22] = 2112;
      *(_QWORD *)&v64[24] = v36;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Using latest asset: %@, state: %ld (%@)", v64, 0x20u);

    }
    if (-[NSObject wasLocal](val, "wasLocal"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject getLocalUrl](val, "getLocalUrl"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "path"));

      if (v38)
      {
        v39 = sub_10000C3F4(v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        v41 = sub_10000C45C(v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        sub_10000C324(v40, v42);

      }
      else
      {
        v45 = sub_100006C90();
        v40 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_1000337E8();
      }

    }
    else
    {
      *(_QWORD *)v64 = 0;
      *(_QWORD *)&v64[8] = v64;
      *(_QWORD *)&v64[16] = 0x3042000000;
      *(_QWORD *)&v64[24] = sub_10000C4C4;
      *(_QWORD *)&v65 = sub_10000C4D0;
      objc_initWeak((id *)&v65 + 1, val);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10000C4D8;
      v54[3] = &unk_100045AD8;
      v54[4] = v64;
      -[NSObject startDownload:completionWithError:](val, "startDownload:completionWithError:", v46, v54);
      _Block_object_dispose(v64, 8);
      objc_destroyWeak((id *)&v65 + 1);
    }
    v44 = val;
    goto LABEL_53;
  }
LABEL_46:
  v43 = sub_100006C90();
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v64 = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "No new denylist found.", v64, 2u);
  }
LABEL_53:

LABEL_54:
}

void sub_10000C294(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 224), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

intptr_t sub_10000C2BC(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (MAIsDownloadResultFailure(a2))
  {
    v4 = sub_100006C90();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100033850(a2, v5, v6, v7, v8, v9, v10, v11);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000C324(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  if (qword_10004F0B0 != -1)
    dispatch_once(&qword_10004F0B0, &stru_100045AF8);
  v5 = qword_10004F0B8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C920;
  v8[3] = &unk_1000459A0;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, v8);

}

id sub_10000C3F4(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "denylist.map"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByAppendingPathComponent:", v2));

  return v3;
}

id sub_10000C45C(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "DocumentCheckerDefinition.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByAppendingPathComponent:", v2));

  return v3;
}

void sub_10000C4C4(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_10000C4D0(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_10000C4D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = MAIsDownloadResultFailure(a2);
  v7 = sub_100006C90();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v9)
      sub_1000338B4((uint64_t)v5, v8);
  }
  else
  {
    if (v9)
      sub_100033950();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getLocalUrl"));

    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v8, "path"));
      v12 = v11;
      if (v11)
      {
        v13 = sub_10000C3F4(v11);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        v15 = sub_10000C45C(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        sub_10000C324(v14, v16);

      }
      else
      {
        v17 = sub_100006C90();
        v14 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_100033924();
      }

    }
  }

}

uint64_t sub_10000C600(const void **a1)
{
  id v2;
  NSObject *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t result;
  uint8_t buf[16];
  uint64_t input;
  io_connect_t connect;

  connect = 0;
  input = *((unsigned int *)*a1 + 3);
  v2 = sub_100006C90();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Sending denylist to AMFI....", buf, 2u);
  }

  v4 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  v6 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      v7 = sub_100006C90();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100033A08();
    }
    else
    {
      if (!IOConnectCallMethod(connect, 9u, &input, 1u, a1[1], 32 * *((unsigned int *)*a1 + 3), 0, 0, 0, 0))
        goto LABEL_13;
      v10 = sub_100006C90();
      v8 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000339A8();
    }
  }
  else
  {
    v9 = sub_100006C90();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10003397C();
  }

LABEL_13:
  result = connect;
  if (connect)
    result = IOServiceClose(connect);
  if (v6)
    return IOObjectRelease(v6);
  return result;
}

uint64_t sub_10000C794()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t result;
  io_connect_t connect;

  connect = 0;
  v0 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  v2 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      v3 = sub_100006C90();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_100033A08();
    }
    else
    {
      if (!IOConnectCallMethod(connect, 0xDu, 0, 0, 0, 0, 0, 0, 0, 0))
        goto LABEL_11;
      v6 = sub_100006C90();
      v4 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_1000339A8();
    }
  }
  else
  {
    v5 = sub_100006C90();
    v4 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003397C();
  }

LABEL_11:
  result = connect;
  if (connect)
    result = IOServiceClose(connect);
  if (v2)
    return IOObjectRelease(v2);
  return result;
}

void sub_10000C8D0(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("blacklist-ingest", v4);
  v3 = (void *)qword_10004F0B8;
  qword_10004F0B8 = (uint64_t)v2;

}

void sub_10000C920(uint64_t a1)
{
  __CFString *v2;
  id v3;
  NSObject *v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  const __CFString *v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint8_t *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  id v31;
  id v32;
  __CFString *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  int v43;
  int v44;
  id v45;
  NSObject *v46;
  char *v47;
  std::__fs::filesystem::path *v48;
  std::__fs::filesystem::path *v49;
  int v50;
  int v51;
  int v52;
  id v53;
  id v54;
  const std::__fs::filesystem::path *v55;
  std::error_code *v56;
  int v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  NSObject *v66;
  id v67;
  void *v68;
  char *v69;
  char *v70;
  std::__fs::filesystem::path *v71;
  int v72;
  int v73;
  int v74;
  off_t v75;
  id v76;
  id v77;
  const std::__fs::filesystem::path *v78;
  std::error_code *v79;
  int v80;
  id v81;
  NSObject *v82;
  id v83;
  id v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  id v88;
  NSObject *v89;
  id v90;
  NSObject *v91;
  id v92;
  NSObject *v93;
  id v94;
  NSObject *v95;
  id v96;
  NSObject *v97;
  id v98;
  id v99;
  NSObject *v100;
  __int128 v101;
  int from_fd[4];
  __int128 v103;
  uint8_t v104[16];
  __int128 v105;
  __int128 v106;
  uint8_t buf[32];
  __int128 v108;

  v2 = (__CFString *)*(id *)(a1 + 32);
  v3 = sub_100006C90();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = -[__CFString UTF8String](objc_retainAutorelease(v2), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ingesting denylist '%s'", buf, 0xCu);
  }

  *(_OWORD *)from_fd = 0u;
  v103 = 0u;
  v101 = 0u;
  sub_1000089E8(v2, (char **)&v101);
  if (from_fd[2] < 0)
  {
    v26 = sub_100006C90();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100033D50();
    goto LABEL_34;
  }
  v5 = *(_QWORD *)(v101 + 16);
  v6 = sub_100006C90();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[__CFString UTF8String](objc_retainAutorelease(v2), "UTF8String");
    v9 = *(_DWORD *)(v101 + 12);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Denylist '%s' was issued at %{time_t}lld with %u entries.", buf, 0x1Cu);
  }

  *(_OWORD *)v104 = 0u;
  v105 = 0u;
  v10 = *(unsigned int *)(v101 + 12);
  if ((_DWORD)v10)
  {
    v11 = 0;
    v12 = (unint64_t *)v104;
    v13 = (unint64_t *)*((_QWORD *)&v101 + 1);
    while (1)
    {
      v14 = bswap64(*v13);
      v15 = bswap64(*v12);
      if (v14 != v15)
        goto LABEL_13;
      v14 = bswap64(v13[1]);
      v15 = bswap64(v12[1]);
      if (v14 == v15
        && (v14 = bswap64(v13[2]), v15 = bswap64(v12[2]), v14 == v15)
        && (v14 = bswap64(v13[3]), v15 = bswap64(v12[3]), v14 == v15))
      {
        v16 = 0;
      }
      else
      {
LABEL_13:
        v16 = v14 < v15 ? -1 : 1;
      }
      if (v16 < 0)
        break;
      v12 = (unint64_t *)(*((_QWORD *)&v101 + 1) + 32 * v11++);
      v13 += 4;
      if (v10 == v11)
        goto LABEL_18;
    }
    v28 = sub_100006C90();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = sub_10000D454((uint64_t)v13);
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v30));
      v32 = objc_msgSend(v31, "UTF8String");
      v33 = sub_10000D454((uint64_t)v12);
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v33));
      v35 = objc_msgSend(v34, "UTF8String");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v35;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Denylist entry number %zu smaller than previous entry: %s < %s", buf, 0x20u);

    }
    goto LABEL_32;
  }
LABEL_18:
  *(_OWORD *)buf = v101;
  *(_OWORD *)&buf[16] = *(_OWORD *)from_fd;
  v108 = v103;
  if (!sub_100008DD8((uint64_t)buf, "INTEGRITY_CHECK_SENTINEL_01"))
  {
    v36 = sub_100006C90();
    v29 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_100033DA8();
LABEL_32:

    v37 = sub_100006C90();
    v27 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100033D7C();
LABEL_34:

    *(_OWORD *)buf = v101;
    *(_OWORD *)&buf[16] = *(_OWORD *)from_fd;
    v108 = v103;
    v25 = buf;
LABEL_35:
    sub_100008D8C((uint64_t)v25);
    goto LABEL_36;
  }
  v108 = 0u;
  memset(buf, 0, sizeof(buf));
  v17 = (const __CFString *)sub_100008EC4((uint64_t)CFSTR("denylist.map"));
  sub_1000089E8(v17, (char **)buf);
  v18 = *(_DWORD *)&buf[24];
  v19 = sub_100006C90();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v18 < 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v104 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Currently installed denylist is broken, replacing unconditionally.", v104, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = *(_QWORD *)(*(_QWORD *)buf + 16);
      *(_DWORD *)v104 = 134217984;
      *(_QWORD *)&v104[4] = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Existing denylist was issued at %lld", v104, 0xCu);
    }

    if (v5 < *(_QWORD *)(*(_QWORD *)buf + 16))
    {
      v23 = sub_100006C90();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v104 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Denylist to ingest is older than current denylist, ignoring.", v104, 2u);
      }

      *(_OWORD *)v104 = *(_OWORD *)buf;
      v105 = *(_OWORD *)&buf[16];
      v106 = v108;
      sub_100008D8C((uint64_t)v104);
      *(_OWORD *)v104 = v101;
      v105 = *(_OWORD *)from_fd;
      v106 = v103;
      v25 = v104;
      goto LABEL_35;
    }
  }
  *(_OWORD *)v104 = *(_OWORD *)buf;
  v105 = *(_OWORD *)&buf[16];
  v106 = v108;
  sub_100008D8C((uint64_t)v104);
  *(_OWORD *)v104 = v101;
  v105 = *(_OWORD *)from_fd;
  v106 = v103;
  sub_10000C600((const void **)v104);
  v67 = sub_100008EC4((uint64_t)CFSTR("denylist.map.ingestXXXXXXX"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  v69 = (char *)objc_msgSend(v68, "lengthOfBytesUsingEncoding:", 4) + 1;
  v70 = (char *)malloc_type_malloc((size_t)v69, 0x428FA061uLL);
  if (!v70)
  {
    v86 = sub_100006C90();
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      sub_100033DD4();

    *(_OWORD *)v104 = v101;
    v105 = *(_OWORD *)from_fd;
    v106 = v103;
    sub_100008D8C((uint64_t)v104);
    goto LABEL_98;
  }
  v71 = (std::__fs::filesystem::path *)v70;
  strlcpy(v70, (const char *)objc_msgSend(objc_retainAutorelease(v68), "UTF8String"), (size_t)v69);
  v72 = mkstemp((char *)v71);
  if (v72 < 0)
  {
    v90 = sub_100006C90();
    v91 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      sub_100033E00();

    *(_OWORD *)v104 = v101;
    v105 = *(_OWORD *)from_fd;
    v106 = v103;
    sub_100008D8C((uint64_t)v104);
    goto LABEL_97;
  }
  v73 = v72;
  if (fchmod(v72, 0x1A4u) < 0)
  {
    v94 = sub_100006C90();
    v95 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      sub_100033E74();

    *(_OWORD *)v104 = v101;
    v105 = *(_OWORD *)from_fd;
    v106 = v103;
    sub_100008D8C((uint64_t)v104);
    close(v73);
  }
  else
  {
    lseek(from_fd[2], 0, 0);
    v74 = fcopyfile(from_fd[2], v73, 0, 8u);
    v75 = lseek(v73, 0, 2);
    close(v73);
    *(_OWORD *)v104 = v101;
    v105 = *(_OWORD *)from_fd;
    v106 = v103;
    sub_100008D8C((uint64_t)v104);
    if (v74 < 0)
    {
      v96 = sub_100006C90();
      v97 = objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        sub_100033EE8(v97);
    }
    else
    {
      if (v75 == *((_QWORD *)&v103 + 1))
      {
        v76 = sub_100008EC4((uint64_t)CFSTR("denylist.map"));
        v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v76));
        v78 = (const std::__fs::filesystem::path *)objc_msgSend(v77, "UTF8String");

        rename(v71, v78, v79);
        if ((v80 & 0x80000000) == 0)
        {
          free(v71);
          v81 = sub_100006C90();
          v82 = objc_claimAutoreleasedReturnValue(v81);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            v83 = -[__CFString UTF8String](objc_retainAutorelease(v2), "UTF8String");
            *(_DWORD *)v104 = 136315138;
            *(_QWORD *)&v104[4] = v83;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Successfully ingested new denylist '%s'", v104, 0xCu);
          }

          goto LABEL_98;
        }
        v99 = sub_100006C90();
        v100 = objc_claimAutoreleasedReturnValue(v99);
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          sub_100033F68();

        goto LABEL_96;
      }
      v98 = sub_100006C90();
      v97 = objc_claimAutoreleasedReturnValue(v98);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        sub_100033FE8((uint64_t *)&v103 + 1, v75, v97);
    }

  }
LABEL_96:
  unlink((const char *)v71);
LABEL_97:
  free(v71);
LABEL_98:

LABEL_36:
  v38 = *(id *)(a1 + 40);
  v39 = sub_100006C90();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Ingesting DocumentCheckList '%s'", buf, 0xCu);
  }

  v42 = objc_retainAutorelease(v38);
  v43 = open((const char *)objc_msgSend(v42, "cStringUsingEncoding:", 4), 0);
  if ((v43 & 0x80000000) == 0)
  {
    v44 = v43;
    v45 = sub_100008EC4((uint64_t)CFSTR("DocumentCheckerDefinition.plist.ingestXXXXXXX"));
    v46 = objc_claimAutoreleasedReturnValue(v45);
    v47 = (char *)-[NSObject lengthOfBytesUsingEncoding:](v46, "lengthOfBytesUsingEncoding:", 4) + 1;
    v48 = (std::__fs::filesystem::path *)malloc_type_malloc((size_t)v47, 0xF493F3CEuLL);
    if (v48)
    {
      v49 = v48;
      v46 = objc_retainAutorelease(v46);
      strlcpy((char *)v49, (const char *)-[NSObject UTF8String](v46, "UTF8String"), (size_t)v47);
      v50 = mkstemp((char *)v49);
      if (v50 < 0)
      {
        v65 = sub_100006C90();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          sub_100033B08();

        close(v44);
      }
      else
      {
        v51 = v50;
        if (fchmod(v50, 0x1A4u) < 0)
        {
          v84 = sub_100006C90();
          v85 = objc_claimAutoreleasedReturnValue(v84);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            sub_100033B7C();

          close(v44);
          close(v51);
        }
        else
        {
          v52 = fcopyfile(v44, v51, 0, 8u);
          close(v44);
          close(v51);
          if (v52 < 0)
          {
            v88 = sub_100006C90();
            v89 = objc_claimAutoreleasedReturnValue(v88);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              sub_100033BF0(v89);

          }
          else
          {
            v53 = sub_100008EC4((uint64_t)CFSTR("DocumentCheckerDefinition.plist"));
            v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v53));
            v55 = (const std::__fs::filesystem::path *)objc_msgSend(v54, "UTF8String");

            rename(v49, v55, v56);
            if ((v57 & 0x80000000) == 0)
            {
              if (notify_post("com.apple.mis.doc-check-list-ingested"))
              {
                v58 = sub_100006C90();
                v59 = objc_claimAutoreleasedReturnValue(v58);
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  sub_100033C70();

              }
              free(v49);
              v60 = sub_100006C90();
              v61 = objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                v62 = objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v62;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Successfully ingested new DocCheckList '%s'", buf, 0xCu);
              }
LABEL_54:

              goto LABEL_87;
            }
            v92 = sub_100006C90();
            v93 = objc_claimAutoreleasedReturnValue(v92);
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              sub_100033CD0();

          }
        }
        unlink((const char *)v49);
      }
      free(v49);
      goto LABEL_87;
    }
    v64 = sub_100006C90();
    v61 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_100033ADC();
    goto LABEL_54;
  }
  v63 = sub_100006C90();
  v46 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    sub_100033A68();
LABEL_87:

  sub_100006D10();
}

__CFString *sub_10000D454(uint64_t a1)
{
  const __CFData *v1;
  __CFString *v2;

  v1 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a1, 28));
  v2 = sub_10000E704(v1);

  return v2;
}

void sub_10000D4CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

char *sub_10000D50C(int *a1)
{
  return strerror(*a1);
}

int *sub_10000D514()
{
  return __error();
}

void sub_10000D51C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

int *sub_10000D530()
{
  return __error();
}

void sub_10000D550(int a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  const char *v6;
  const __CFArray *v7;
  id v8;
  const __CFArray *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  xpc_object_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 *v26;
  _QWORD v27[4];
  id v28;
  __int128 *v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint8_t v33[15];
  unsigned __int8 v34;
  _QWORD v35[3];
  _QWORD v36[3];
  __int128 buf;
  uint64_t v38;
  char v39;

  v3 = a2;
  v4 = sub_100006C90();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "";
    if (a1)
      v6 = " (periodic)";
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Revalidating apps.%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x2020000000;
  v39 = 0;
  v7 = sub_10000340C();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000D9BC;
  v30[3] = &unk_100045BA0;
  v8 = v3;
  v31 = v8;
  p_buf = &buf;
  sub_100003420(v7, (uint64_t)v30);
  if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v9 = sub_100003674();
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000DB10;
    v27[3] = &unk_100045C08;
    v10 = v8;
    v28 = v10;
    v29 = &buf;
    sub_100003688(v9, (uint64_t)v27);
    if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v35[0] = kMISValidationOptionValidateSignatureOnly;
      v35[1] = kMISValidationOptionOnlineAuthorization;
      v36[0] = kCFBooleanTrue;
      v36[1] = kCFBooleanTrue;
      v35[2] = kMISValidationOptionOnlineCheckType;
      if (a1)
        v11 = 1;
      else
        v11 = 2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
      v36[2] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 3));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000DC64;
      v23[3] = &unk_100045C30;
      v24 = v10;
      v26 = &buf;
      v15 = v13;
      v25 = v15;
      objc_msgSend(v14, "enumerateBundlesOfType:block:", 1, v23);

      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        v34 = 0;
        v16 = MISExistsIndeterminateApps(0, 0, &v34);
        v17 = v34;
        v18 = sub_100006C90();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = v19;
        if (v17)
          v21 = 1;
        else
          v21 = v16;
        if (v21 == 1)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Scheduling opportunistic validation.", v33, 2u);
          }

          v22 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REPEATING, 0);
          xpc_dictionary_set_string(v22, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_ALLOW_BATTERY, 1);
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
          xpc_dictionary_set_int64(v22, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_8_HOURS);
          xpc_dictionary_set_int64(v22, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
          xpc_activity_register("com.apple.mis.opportunistic-validation.scheduled", v22, &stru_100045C50);

        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Nothing about to go indeterminate, cancelling any opportunistic validation.", v33, 2u);
          }

          xpc_activity_unregister("com.apple.mis.opportunistic-validation.scheduled");
        }
      }

    }
  }

  _Block_object_dispose(&buf, 8);
}

void sub_10000D994(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D9BC(uint64_t a1, const __CFString *a2, void *a3, void *a4)
{
  _xpc_activity_s *v8;
  xpc_activity_t *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFDataRef v21;
  uint8_t buf[16];

  v9 = (xpc_activity_t *)(a1 + 32);
  v8 = *(_xpc_activity_s **)(a1 + 32);
  if (!v8 || !xpc_activity_should_defer(v8))
  {
LABEL_10:
    v21 = sub_10000E570(a2);
    sub_1000045C0(v21, a3, 0, 0, a4, &off_100048C30, &off_100048C30, 2, 0, &stru_100045B38, &stru_100045B78);

    return 1;
  }
  v10 = xpc_activity_set_state(*v9, 3);
  v11 = sub_100006C90();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10003406C((uint64_t)v9, v13, v15, v16, v17, v18, v19, v20);

    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", buf, 2u);
  }

  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

BOOL sub_10000DB00(id a1, int64_t a2)
{
  return 1;
}

BOOL sub_10000DB08(id a1)
{
  return 1;
}

uint64_t sub_10000DB10(uint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  _xpc_activity_s *v8;
  xpc_activity_t *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFDataRef v21;
  uint8_t buf[16];

  v9 = (xpc_activity_t *)(a1 + 32);
  v8 = *(_xpc_activity_s **)(a1 + 32);
  if (!v8 || !xpc_activity_should_defer(v8))
  {
LABEL_10:
    v21 = sub_10000E570(a3);
    sub_1000045C0(v21, a2, 0, 0, a4, &off_100048C30, &off_100048C30, 2, 0, &stru_100045BC0, &stru_100045BE0);

    return 1;
  }
  v10 = xpc_activity_set_state(*v9, 3);
  v11 = sub_100006C90();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10003406C((uint64_t)v9, v13, v15, v16, v17, v18, v19, v20);

    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", buf, 2u);
  }

  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

BOOL sub_10000DC54(id a1, int64_t a2)
{
  return 1;
}

BOOL sub_10000DC5C(id a1)
{
  return 1;
}

void sub_10000DC64(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  _xpc_activity_s *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v5 = a2;
  v6 = *(_xpc_activity_s **)(a1 + 32);
  if (v6 && xpc_activity_should_defer(v6))
  {
    v7 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    v8 = sub_100006C90();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", v19, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_12;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10003406C(a1 + 32, v10, v11, v12, v13, v14, v15, v16);

  }
  if (objc_msgSend(v5, "profileValidated"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleURL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));

    MISValidateSignature(v18, *(_QWORD *)(a1 + 40));
  }
LABEL_12:

}

void sub_10000DD90(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  v3 = sub_100006C90();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Performing opportunistic validation.", v5, 2u);
  }

  sub_10000D550(0, v2);
}

id sub_10000DE0C(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  dispatch_queue_global_t global_queue;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void ***v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  NSObject *v33;
  id v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[16];
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  uint64_t *v48;

  v3 = a1;
  v4 = a2;
  if (!qword_10004F0C0)
  {
    *(_OWORD *)buf = off_100045C98;
    v41 = 0;
    qword_10004F0C0 = _sl_dlopen(buf, 0);
  }
  if (qword_10004F0C0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    v41 = 0x3032000000;
    v42 = sub_10000E268;
    v43 = sub_10000E278;
    v44 = 0;
    v6 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(21, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v29 = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_10000E280;
    v32 = &unk_100045C78;
    v35 = buf;
    v9 = v6;
    v33 = v9;
    v10 = v3;
    v34 = v10;
    v11 = v5;
    v12 = v4;
    v13 = v8;
    v14 = &v29;
    *(_QWORD *)&v45 = 0;
    *((_QWORD *)&v45 + 1) = &v45;
    v46 = 0x2020000000;
    v15 = off_10004F0C8;
    v47 = off_10004F0C8;
    if (!off_10004F0C8)
    {
      v16 = (void *)sub_10000E34C();
      v15 = dlsym(v16, "PVAppIdentity_GenerateDigestWithCompletion");
      *(_QWORD *)(*((_QWORD *)&v45 + 1) + 24) = v15;
      off_10004F0C8 = v15;
    }
    _Block_object_dispose(&v45, 8);
    if (!v15)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void sl_PVAppIdentity_GenerateDigestWithCompletion(NSURL *__strong, NSData *__strong, dispatch_queue_t  _Nullable __strong, void (^__strong)(PVAppIdentityDigest *__strong))"));
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("AppIdentity.m"), 23, CFSTR("%s"), dlerror(), v29, v30, v31, v32, v33, v34, v35);

      __break(1u);
    }
    ((void (*)(NSObject *, id, id, void ***))v15)(v11, v12, v13, v14);

    v17 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v9, v17);
    v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      v21 = sub_100006C90();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LODWORD(v45) = 138412290;
        *(_QWORD *)((char *)&v45 + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Timed out digest calculation for %@", (uint8_t *)&v45, 0xCu);
      }

      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v23 = (void *)qword_10004F0D0;
      v39 = qword_10004F0D0;
      if (!qword_10004F0D0)
      {
        *(_QWORD *)&v45 = _NSConcreteStackBlock;
        *((_QWORD *)&v45 + 1) = 3221225472;
        v46 = (uint64_t)sub_10000E3F4;
        v47 = &unk_100045718;
        v48 = &v36;
        sub_10000E3F4((uint64_t)&v45);
        v23 = (void *)v37[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v36, 8);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "digestWithTimeoutError"));
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "asDictionary"));

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v20 = sub_100006C90();
    v11 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Digest calculation not supported", buf, 2u);
    }
    v19 = &__NSDictionary0__struct;
  }

  return v19;
}

void sub_10000E224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E268(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000E278(uint64_t a1)
{

}

void sub_10000E280(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "asDictionary"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v6 = sub_100006C90();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Succesfully calculated digest for %@", (uint8_t *)&v9, 0xCu);
  }

}

uint64_t sub_10000E34C()
{
  uint64_t v0;
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = 0;
  if (!qword_10004F0C0)
  {
    v3 = off_100045C98;
    v4 = 0;
    qword_10004F0C0 = _sl_dlopen(&v3, &v2);
  }
  v0 = qword_10004F0C0;
  if (!qword_10004F0C0)
    sub_1000340D4(&v2);
  if (v2)
    free(v2);
  return v0;
}

Class sub_10000E3F4(uint64_t a1)
{
  Class result;

  sub_10000E34C();
  result = objc_getClass("PVAppIdentityDigest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100034150();
  qword_10004F0D0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const void *sub_10000E448()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;

  v0 = (const void *)sub_10000BAE8();
  if (!v0)
  {
    v5 = sub_100006C90();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000341C8();

    return 0;
  }
  v1 = v0;
  v2 = CFGetTypeID(v0);
  if (v2 != CFStringGetTypeID())
  {
    v3 = sub_100006C90();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000341F4();

    CFRelease(v1);
    return 0;
  }
  return v1;
}

void sub_10000E4E4(id a1)
{
  qword_10004F0D8 = (uint64_t)CFURLCreateWithFileSystemPath(0, CFSTR("/private/var/db/MobileIdentityData"), kCFURLPOSIXPathStyle, 1u);
}

CFURLRef sub_10000E514(CFStringRef filePath)
{
  if (qword_10004F0E0 != -1)
    dispatch_once(&qword_10004F0E0, &stru_100045CB0);
  return CFURLCreateWithFileSystemPathRelativeToBase(0, filePath, kCFURLPOSIXPathStyle, 0, (CFURLRef)qword_10004F0D8);
}

CFDataRef sub_10000E570(const __CFString *a1)
{
  CFIndex Length;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  UInt8 *v6;
  UInt8 *v7;
  unsigned __int8 *v8;
  UInt8 *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  char v14;
  _BOOL4 v15;
  char v16;
  BOOL v17;
  int v18;
  char v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  char v23;
  BOOL v24;
  char v25;
  BOOL v26;
  char v27;
  char v28;
  char v29;
  CFDataRef v30;

  Length = CFStringGetLength(a1);
  v3 = Length;
  if ((Length & 1) != 0)
    return 0;
  if (Length >= 0)
    v4 = Length;
  else
    v4 = Length + 1;
  v5 = (char *)CFAllocatorAllocate(kCFAllocatorDefault, v4 | 1, 0);
  if (!CFStringGetCString(a1, v5, v4 | 1, 0x600u))
    goto LABEL_36;
  v6 = (UInt8 *)CFAllocatorAllocate(kCFAllocatorDefault, v4 >> 1, 0);
  v7 = v6;
  if (v3 >= 2)
  {
    v8 = (unsigned __int8 *)(v5 + 1);
    v9 = v6;
    v10 = v4 >> 1;
    do
    {
      v11 = *(v8 - 1);
      v12 = v11 - 48;
      v13 = v11 - 97;
      v14 = v11 - 55;
      v15 = (v11 - 65) < 6;
      if ((v11 - 65) >= 6)
        v14 = 0;
      v16 = v11 - 87;
      v17 = v13 > 5;
      v18 = v13 <= 5 || v15;
      if (v17)
        v16 = v14;
      if (v12 < 0xA)
      {
        v18 = 1;
        v16 = v12;
      }
      v19 = 16 * v16;
      v20 = *v8;
      v21 = v20 - 48;
      v22 = v20 - 97;
      v23 = v20 - 55;
      v24 = (v20 - 65) < 6;
      if ((v20 - 65) >= 6)
        v23 = 0;
      v25 = v20 - 87;
      v26 = v22 > 5;
      v27 = v22 <= 5 || v24;
      if (v26)
        v28 = v23;
      else
        v28 = v25;
      if (v21 >= 0xA)
        v29 = v27;
      else
        v29 = 1;
      if (v21 >= 0xA)
        LOBYTE(v21) = v28;
      *v9 = v21 | v19;
      if (!v18 || (v29 & 1) == 0)
        goto LABEL_35;
      ++v9;
      v8 += 2;
    }
    while (--v10);
  }
  v30 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, v4 >> 1, kCFAllocatorDefault);
  if (!v30 && v7)
  {
LABEL_35:
    CFAllocatorDeallocate(kCFAllocatorDefault, v7);
LABEL_36:
    v30 = 0;
  }
  if (v5)
    CFAllocatorDeallocate(kCFAllocatorDefault, v5);
  return v30;
}

__CFString *sub_10000E704(const __CFData *a1)
{
  CFIndex Length;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex v5;
  CFIndex v6;
  unsigned int v7;

  Length = CFDataGetLength(a1);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * Length);
  BytePtr = CFDataGetBytePtr(a1);
  v5 = CFDataGetLength(a1);
  if (v5 >= 1)
  {
    v6 = v5;
    do
    {
      v7 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, CFSTR("%02x"), v7);
      --v6;
    }
    while (v6);
  }
  return Mutable;
}

void *sub_10000E79C(size_t size)
{
  void *memptr;

  memptr = 0;
  if (!malloc_type_posix_memalign(&memptr, 0x10uLL, size, 0xF69F43FDuLL))
    bzero(memptr, size);
  return memptr;
}

void *sub_10000E7F0(const void *a1, size_t a2, size_t size)
{
  void *v5;
  void *v6;

  v5 = sub_10000E79C(size);
  v6 = v5;
  if (v5)
    memcpy(v5, a1, a2);
  return v6;
}

CFMutableDictionaryRef sub_10000E840()
{
  CFMutableDictionaryRef result;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  io_connect_t connect;

  connect = 0;
  result = IOServiceMatching("IOAESAccelerator");
  if (result)
  {
    v1 = result;
    CFRetain(result);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (MatchingService)
    {
      v3 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      CFRelease(v1);
      IOObjectRelease(v3);
      return (CFMutableDictionaryRef)connect;
    }
    else
    {
      CFRelease(v1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000E8D4(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t data;
  CC_SHA256_CTX c;
  size_t outputStructCnt;
  unsigned __int8 md[32];
  _QWORD outputStruct[2];
  int v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[12];

  *(_QWORD *)&v19[4] = 0;
  outputStructCnt = 88;
  memset(&c, 0, sizeof(c));
  data = (unint64_t)CFAbsoluteTimeGetCurrent() & 0xFFFFFFFFFF800000;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 8u);
  CC_SHA256_Final(md, &c);
  v15 = *(_OWORD *)md;
  outputStruct[0] = a2;
  outputStruct[1] = a3;
  v14 = a4;
  v16 = 0x8000000000;
  v17 = 0u;
  v18 = 0u;
  *(_QWORD *)v19 = 2106;
  return IOConnectCallStructMethod(a1, 1u, outputStruct, 0x58uLL, outputStruct, &outputStructCnt);
}

id sub_10000E9E4()
{
  void *v0;
  id v1;
  NSString v2;
  NSString v3;
  NSString v4;
  __CFString *v5;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserTrustDB();
  v1 = objc_msgSendSuper2(&v7, "setupSchema");
  if ((_DWORD)v1)
  {
    v2 = objc_msgSend(v0, "readSetting:", CFSTR("databaseSchemaVersion"));
    if (!v2)
    {
      v3 = String._bridgeToObjectiveC()();
      objc_msgSend(v0, "executeQuery:withBind:withResults:", v3, 0, 0);

      v4 = String._bridgeToObjectiveC()();
      objc_msgSend(v0, "executeQuery:withBind:withResults:", v4, 0, 0);

      v5 = CFSTR("databaseSchemaVersion");
      v2 = String._bridgeToObjectiveC()();
      objc_msgSend(v0, "setSetting:toValue:", v5, v2);

    }
  }
  return v1;
}

id variable initialization expression of UserTrustAgentOperations.utdb()
{
  char v0;

  type metadata accessor for UserTrustDB();
  v0 = sub_1000132E8();
  return sub_100022E74(v0 & 1);
}

uint64_t UserTrustAgentOperations.createUserTrustedProfileEntry(uuid:teamId:signature:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a1;
  v25 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UserTrustedProfileEntry(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0;
  if (a3)
  {
    v24 = a2;
    v16 = a4;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    if (a5 >> 60 != 15)
    {
      swift_bridgeObjectRetain(a3);
      sub_10000EE70(v16, a5);
      v15 = nullsub_1(v24, a3, v16, a5);
      v17 = v20;
      v18 = v21;
      v19 = v22;
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v26, v25);
  sub_10000ED3C(v15, v17, v18, v19);
  sub_1000106F4((uint64_t)v11, v15, v17, v18, v19, (uint64_t)v14);
  sub_1000223A4();
  sub_10000EDB8((uint64_t)v14);
  return sub_10000EDF4(v15, v17, v18, v19);
}

uint64_t sub_10000ED3C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    return sub_10000ED74(a3, a4);
  }
  return result;
}

uint64_t sub_10000ED74(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_retain)();
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000EDB8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UserTrustedProfileEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000EDF4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    return sub_10000EE2C(a3, a4);
  }
  return result;
}

uint64_t sub_10000EE2C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000EE70(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000ED74(a1, a2);
  return a1;
}

uint64_t UserTrustAgentOperations.deleteTrustedProfile(uuid:)(uint64_t a1)
{
  return sub_100022644(a1);
}

id UserTrustAgentOperations.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id UserTrustAgentOperations.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  char v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC17online_auth_agent24UserTrustAgentOperations_utdb;
  type metadata accessor for UserTrustDB();
  v2 = v0;
  v3 = sub_1000132E8();
  *(_QWORD *)&v0[v1] = sub_100022E74(v3 & 1);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t type metadata accessor for UserTrustAgentOperations()
{
  return objc_opt_self(_TtC17online_auth_agent24UserTrustAgentOperations);
}

id UserTrustAgentOperations.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000F2D8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000EE2C(a1, a2);
  return a1;
}

void sub_10000F2EC()
{
  qword_100051670 = -1;
}

uint64_t sub_10000F30C()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 16, v2, 0, 0);
  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_10000F33C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  _BYTE v4[24];

  result = swift_beginAccess(v1 + 16, v4, 1, 0);
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

void *sub_10000F378(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + 16, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_10000F3B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_allocObject(v1, 24, 7);
  *(_QWORD *)(result + 16) = a1;
  return result;
}

void sub_10000F3E8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_10000F43C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  sqlite3_stmt *v6;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v2;
  v9 = v3;
  v10 = BYTE2(v3);
  v11 = BYTE3(v3);
  v12 = BYTE4(v3);
  v13 = BYTE5(v3);
  v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 88);
  v5 = swift_retain(v1);
  v6 = (sqlite3_stmt *)v4(v5);
  if (qword_10004F0E8 != -1)
    swift_once(&qword_10004F0E8, sub_10000F2EC);
  sqlite3_bind_blob(v6, v0, &v8, BYTE6(v3), (void (__cdecl *)(void *))qword_100051670);
  return swift_release(v1);
}

_BYTE *sub_10000F6B8(int a1)
{
  uint64_t v1;
  uint64_t (*v3)(void);
  sqlite3_stmt *v4;
  _BYTE *result;
  _BYTE *v6;
  sqlite3_stmt *v7;
  int v8;

  v3 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 88);
  v4 = (sqlite3_stmt *)v3();
  result = sqlite3_column_blob(v4, a1);
  if (result)
  {
    v6 = result;
    v7 = (sqlite3_stmt *)v3();
    v8 = sqlite3_column_bytes(v7, a1);
    return (_BYTE *)sub_100010070(v6, v8);
  }
  return result;
}

void sub_10000F718(uint64_t a1, int a2)
{
  uint64_t v2;
  double v4;
  sqlite3_int64 v5;
  sqlite3_stmt *v6;

  v4 = Date.timeIntervalSince1970.getter();
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v4 < 9.22337204e18)
  {
    v5 = (uint64_t)v4;
    v6 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v2 + 88))();
    sqlite3_bind_int64(v6, a2, v5);
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_10000F7A4(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;
  sqlite3_int64 v4;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  v4 = sqlite3_column_int64(v3, a1);
  return Date.init(timeIntervalSince1970:)((double)v4);
}

uint64_t sub_10000F7E8(sqlite3_int64 a1, int a2)
{
  uint64_t v2;
  sqlite3_stmt *v5;

  v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v2 + 88))();
  return sqlite3_bind_int64(v5, a2, a1);
}

sqlite3_int64 sub_10000F824(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  return sqlite3_column_int64(v3, a1);
}

uint64_t sub_10000F850(char a1, int a2)
{
  uint64_t v2;
  sqlite3_stmt *v5;

  v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v2 + 88))();
  return sqlite3_bind_int64(v5, a2, a1 & 1);
}

BOOL sub_10000F88C(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  return sqlite3_column_int64(v3, a1) != 0;
}

uint64_t sub_10000F8C4(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v6;

  if (a2)
  {
    v6 = result;
    swift_retain(v3);
    return sub_10000F91C(v6, a2, v3, a3);
  }
  return result;
}

uint64_t sub_10000F91C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  const char *v6;
  sqlite3_stmt *v8;
  _QWORD v9[3];
  int v10;
  char v11[8];
  uint64_t v12;

  v9[2] = a3;
  v10 = a4;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)(sub_100010624, v9, a1, a2, (char *)&type metadata for () + 8);
    return swift_release(a3);
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v6 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v6 = (const char *)_StringObject.sharedUTF8.getter(a1, a2);
    sub_100010624(v6);
    return swift_release(a3);
  }
  *(_QWORD *)v11 = a1;
  v12 = a2 & 0xFFFFFFFFFFFFFFLL;
  v8 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)a3 + 88))();
  if (qword_10004F0E8 != -1)
    swift_once(&qword_10004F0E8, sub_10000F2EC);
  sqlite3_bind_text(v8, a4, v11, -1, (void (__cdecl *)(void *))qword_100051670);
  return swift_release(a3);
}

const unsigned __int8 *sub_10000FA58(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;
  const unsigned __int8 *result;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  result = sqlite3_column_text(v3, a1);
  if (result)
    return (const unsigned __int8 *)String.init(cString:)();
  return result;
}

uint64_t sub_10000FA98()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10000FAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t *v11;
  NSString v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  void **aBlock;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t (*v29)(uint64_t);
  _QWORD *v30;

  v10 = swift_allocObject(&unk_100045DA8, 24, 7);
  *(_QWORD *)(v10 + 16) = 0;
  v11 = (uint64_t *)(v10 + 16);
  v12 = String._bridgeToObjectiveC()();
  v13 = swift_allocObject(&unk_100045DD0, 32, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  v29 = sub_10001016C;
  v30 = (_QWORD *)v13;
  aBlock = _NSConcreteStackBlock;
  v26 = 1107296256;
  v27 = sub_10000FCE0;
  v28 = &unk_100045DE8;
  v14 = _Block_copy(&aBlock);
  v15 = v30;
  sub_1000101FC(a3, a4);
  swift_release(v15);
  v16 = (_QWORD *)swift_allocObject(&unk_100045E20, 40, 7);
  v16[2] = a5;
  v16[3] = a6;
  v16[4] = v10;
  v29 = sub_100010240;
  v30 = v16;
  aBlock = _NSConcreteStackBlock;
  v26 = 1107296256;
  v27 = sub_10000FD1C;
  v28 = &unk_100045E38;
  v17 = _Block_copy(&aBlock);
  v18 = v30;
  sub_1000101FC(a5, a6);
  swift_retain(v10);
  swift_release(v18);
  v19 = objc_msgSend(v24, "executeQuery:withBind:withResults:", v12, v14, v17);
  _Block_release(v17);
  _Block_release(v14);

  if (v19)
  {
    v20 = sub_1000102EC();
    swift_allocError(&type metadata for DBError, v20, 0, 0);
    *(_QWORD *)v21 = v19;
    *(_QWORD *)(v21 + 8) = 0;
    *(_QWORD *)(v21 + 16) = 0;
    *(_QWORD *)(v21 + 24) = 0;
    *(_BYTE *)(v21 + 32) = 0;
LABEL_5:
    swift_willThrow();
    return swift_release(v10);
  }
  swift_beginAccess(v11, &aBlock, 0, 0);
  v22 = *v11;
  if (v22)
  {
    swift_errorRetain(v22);
    goto LABEL_5;
  }
  return swift_release(v10);
}

uint64_t sub_10000FCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10000FD1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  unint64_t v7;
  uint64_t v8;

  v6 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = sub_1000105D8();
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, v7, &protocol witness table for String);
  swift_retain(v5);
  v6(a2, v8);
  swift_release(v5);
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_10000FD94(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t result;

  result = sub_10000FAA8(0xD000000000000011, 0x8000000100039FD0, 0, 0, 0, 0);
  if (!v1)
  {
    a1(result);
    return sub_10000FAA8(0xD000000000000012, 0x800000010003A010, 0, 0, 0, 0);
  }
  return result;
}

uint64_t sub_10000FEA4(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, sqlite3_stmt *a4, int a5)
{
  char *v10;
  uint64_t result;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = (char *)__DataStorage._bytes.getter();
  if (!v10)
  {
LABEL_4:
    v12 = __OFSUB__(a2, a1);
    v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }
    else
    {
      v14 = __DataStorage._length.getter();
      if (v14 < v13)
        v13 = v14;
      a3 = a4;
      v15 = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 88))();
      if (!v10)
        v13 = 0;
      if (v13 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (v13 <= 0x7FFFFFFF)
        {
          a3 = (sqlite3_stmt *)v15;
          if (qword_10004F0E8 == -1)
          {
LABEL_12:
            sqlite3_bind_blob(a3, a5, v10, v13, (void (__cdecl *)(void *))qword_100051670);
            return swift_release(a4);
          }
LABEL_16:
          swift_once(&qword_10004F0E8, sub_10000F2EC);
          goto LABEL_12;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  result = __DataStorage._offset.getter();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000FFB0(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;

  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_100010070(_BYTE *__src, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_10000FFB0(__src, &__src[a2]);
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  __DataStorage.init(bytes:length:)(__src, a2);
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  v6 = type metadata accessor for Data.RangeReference(0);
  result = swift_allocObject(v6, 32, 7);
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_10001011C()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010140()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001016C(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    v3 = result;
    v4 = *(_QWORD *)(v1 + 24);
    v5 = type metadata accessor for SQLStatement();
    v6 = swift_allocObject(v5, 24, 7);
    *(_QWORD *)(v6 + 16) = v3;
    swift_retain(v4);
    v2(v6);
    swift_release(v6);
    return sub_100010614((uint64_t)v2, v4);
  }
  return result;
}

uint64_t sub_1000101E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000101F4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000101FC(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10001020C()
{
  _QWORD *v0;

  if (v0[2])
    swift_release(v0[3]);
  swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100010240(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    v3 = result;
    v4 = *(_QWORD *)(v1 + 24);
    v5 = type metadata accessor for SQLStatement();
    v6 = swift_allocObject(v5, 24, 7);
    *(_QWORD *)(v6 + 16) = v3;
    swift_retain(v4);
    v2(v6);
    swift_release(v6);
    return sub_100010614((uint64_t)v2, v4);
  }
  return result;
}

unint64_t sub_1000102EC()
{
  unint64_t result;

  result = qword_10004DAA0;
  if (!qword_10004DAA0)
  {
    result = swift_getWitnessTable(&unk_100036BD0, &type metadata for DBError);
    atomic_store(result, (unint64_t *)&qword_10004DAA0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DBError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t sub_100010360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRetain(a2);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t destroy for DBError(uint64_t a1)
{
  return sub_1000103A4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_1000103A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t initializeWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_100010360(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_100010360(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_1000103A4(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for DBError(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DBError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_1000103A4(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DBError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DBError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_100010590(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_10001059C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLStatement()
{
  return objc_opt_self(_TtC17online_auth_agent12SQLStatement);
}

unint64_t sub_1000105D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004DBB0;
  if (!qword_10004DBB0)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004DBB0);
  }
  return result;
}

uint64_t sub_100010614(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100010624(const char *a1)
{
  uint64_t v1;
  int v3;
  sqlite3_stmt *v4;

  v3 = *(_DWORD *)(v1 + 24);
  v4 = (sqlite3_stmt *)(*(uint64_t (**)(void))(**(_QWORD **)(v1 + 16) + 88))();
  if (qword_10004F0E8 != -1)
    swift_once(&qword_10004F0E8, sub_10000F2EC);
  return sqlite3_bind_text(v4, v3, a1, -1, (void (__cdecl *)(void *))qword_100051670);
}

uint64_t type metadata accessor for UserTrustedProfileEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_10004F170;
  if (!qword_10004F170)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UserTrustedProfileEntry);
  return result;
}

uint64_t sub_1000106F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;

  v12 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a6, a1, v12);
  result = type metadata accessor for UserTrustedProfileEntry(0);
  v14 = (_QWORD *)(a6 + *(int *)(result + 20));
  *v14 = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  return result;
}

uint64_t destroy for TrustedTeamIdEntry(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  return sub_10000EE2C(a1[2], a1[3]);
}

_QWORD *initializeWithCopy for TrustedTeamIdEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain(v3);
  sub_10000ED74(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

_QWORD *assignWithCopy for TrustedTeamIdEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v7 = a2[2];
  v6 = a2[3];
  sub_10000ED74(v7, v6);
  v8 = a1[2];
  v9 = a1[3];
  a1[2] = v7;
  a1[3] = v6;
  sub_10000EE2C(v8, v9);
  return a1;
}

__n128 initializeWithTake for TrustedTeamIdEntry(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for TrustedTeamIdEntry(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = a1[1];
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_10000EE2C(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedTeamIdEntry()
{
  return &type metadata for TrustedTeamIdEntry;
}

uint64_t *sub_10001092C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    if (v11)
    {
      *v9 = *v10;
      v9[1] = v11;
      v12 = v10[2];
      v13 = v10[3];
      swift_bridgeObjectRetain(v11);
      sub_10000ED74(v12, v13);
      v9[2] = v12;
      v9[3] = v13;
    }
    else
    {
      v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
  }
  return a1;
}

uint64_t sub_1000109E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  result = v5[1];
  if (result)
  {
    swift_bridgeObjectRelease(result);
    return sub_10000EE2C(v5[2], v5[3]);
  }
  return result;
}

uint64_t sub_100010A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  if (v10)
  {
    *v8 = *v9;
    v8[1] = v10;
    v11 = v9[2];
    v12 = v9[3];
    swift_bridgeObjectRetain(v10);
    sub_10000ED74(v11, v12);
    v8[2] = v11;
    v8[3] = v12;
  }
  else
  {
    v13 = *((_OWORD *)v9 + 1);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v13;
  }
  return a1;
}

uint64_t sub_100010AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 8);
  v11 = v9[1];
  if (v10)
  {
    if (v11)
    {
      *v8 = *v9;
      v12 = v9[1];
      v8[1] = v12;
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRelease(v10);
      v13 = v9[2];
      v14 = v9[3];
      sub_10000ED74(v13, v14);
      v15 = v8[2];
      v16 = v8[3];
      v8[2] = v13;
      v8[3] = v14;
      sub_10000EE2C(v15, v16);
    }
    else
    {
      sub_100010BCC(v8);
      v20 = *((_OWORD *)v9 + 1);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v20;
    }
  }
  else if (v11)
  {
    *v8 = *v9;
    v17 = v9[1];
    v8[1] = v17;
    v18 = v9[2];
    v19 = v9[3];
    swift_bridgeObjectRetain(v17);
    sub_10000ED74(v18, v19);
    v8[2] = v18;
    v8[3] = v19;
  }
  else
  {
    v21 = *((_OWORD *)v9 + 1);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v21;
  }
  return a1;
}

_QWORD *sub_100010BCC(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  sub_10000EE2C(a1[2], a1[3]);
  return a1;
}

uint64_t sub_100010BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t sub_100010C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7 + 8);
  if (!v10)
    goto LABEL_5;
  v11 = *(_QWORD *)(v9 + 8);
  if (!v11)
  {
    sub_100010BCC(v8);
LABEL_5:
    v14 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v14;
    return a1;
  }
  *v8 = *(_QWORD *)v9;
  v8[1] = v11;
  swift_bridgeObjectRelease(v10);
  v12 = v8[2];
  v13 = v8[3];
  *((_OWORD *)v8 + 1) = *(_OWORD *)(v9 + 16);
  sub_10000EE2C(v12, v13);
  return a1;
}

uint64_t sub_100010CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010D08);
}

uint64_t sub_100010D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_100010D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010DA0);
}

uint64_t sub_100010DA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t sub_100010E1C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = " ";
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

void sub_100010E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for Data.Iterator(0);
  __chkstk_darwin(v3);
  __asm { BR              X10 }
}

uint64_t sub_100010F10()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String v14;

  sub_10000ED74(v3, v1);
  sub_10000ED74(v3, v1);
  ((void (*)(uint64_t, unint64_t, _QWORD))Data.Iterator.init(_:at:))(v3, v1, (int)v3);
  sub_10000EE2C(v3, v1);
  v5 = sub_10001107C();
  ((void (*)(uint64_t, unint64_t))dispatch thunk of IteratorProtocol.next())(v0, v5);
  if ((*(_BYTE *)(v4 - 81) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
    *(_OWORD *)(v4 - 128) = xmmword_100036CA0;
    do
    {
      v8 = *(_BYTE *)(v4 - 82);
      v9 = sub_1000110C4(&qword_10004DC40);
      v10 = swift_allocObject(v9, 72, 7);
      *(_OWORD *)(v10 + 16) = *(_OWORD *)(v4 - 128);
      *(_QWORD *)(v10 + 56) = &type metadata for UInt8;
      *(_QWORD *)(v10 + 64) = &protocol witness table for UInt8;
      *(_BYTE *)(v10 + 32) = v8;
      v11 = ((uint64_t (*)(uint64_t, unint64_t, uint64_t))String.init(format:_:))(2016555045, 0xE400000000000000, v10);
      v13 = v12;
      *(_QWORD *)(v4 - 104) = v6;
      *(_QWORD *)(v4 - 96) = v7;
      swift_bridgeObjectRetain(v7);
      v14._countAndFlagsBits = v11;
      v14._object = v13;
      String.append(_:)(v14);
      swift_bridgeObjectRelease(v7);
      swift_bridgeObjectRelease(v13);
      v6 = *(_QWORD *)(v4 - 104);
      v7 = *(_QWORD *)(v4 - 96);
      ((void (*)(uint64_t, unint64_t))dispatch thunk of IteratorProtocol.next())(v0, v5);
    }
    while (*(_BYTE *)(v4 - 81) != 1);
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 136) + 8))(v2, v0);
  return v6;
}

unint64_t sub_10001107C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004DC38;
  if (!qword_10004DC38)
  {
    v1 = type metadata accessor for Data.Iterator(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Data.Iterator, v1);
    atomic_store(result, (unint64_t *)&qword_10004DC38);
  }
  return result;
}

uint64_t sub_1000110C4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_100011104(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000110C4(&qword_10004DC48);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100011168(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_1000111AC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000111D0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t type metadata accessor for AppRecord(uint64_t a1)
{
  return sub_100011554(a1, (uint64_t *)&unk_10004F210, (uint64_t)&nominal type descriptor for AppRecord);
}

int *sub_100011208@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  int *result;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v49 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v49 - v13;
  v15 = objc_msgSend(a1, "bundleIdentifier");
  if (v15)
  {
    v16 = v15;
    v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v54 = v17;

    v18 = objc_msgSend(a1, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v19 = sub_100019140();
    if (v2)
    {
      swift_errorRelease(v2);
      v53 = 0;
      v51 = 0;
      v52 = 0xF000000000000000;
    }
    else
    {
      v52 = v21;
      v53 = v20;
      v51 = v19;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    v29 = objc_msgSend(a1, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v30 = objc_msgSend(a1, "teamIdentifier");
    if (v30)
    {
      v31 = v30;
      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v49 = v33;
      v50 = v32;

    }
    else
    {
      v49 = 0;
      v50 = 0;
    }
    v34 = v5;
    v35 = objc_msgSend(a1, "iTunesMetadata", v49, v50);
    v36 = objc_msgSend(v35, "versionIdentifier");

    v37 = objc_msgSend(a1, "uniqueInstallIdentifier");
    if (v37)
    {
      v38 = v37;
      v39 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v37);
      v41 = v40;

    }
    else
    {
      v39 = 0;
      v41 = 0xF000000000000000;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v12, v34);
    result = (int *)type metadata accessor for AppRecord(0);
    v42 = (uint64_t *)(a2 + result[5]);
    v43 = v54;
    *v42 = v55;
    v42[1] = v43;
    v44 = (uint64_t *)(a2 + result[6]);
    v45 = v49;
    *v44 = v50;
    v44[1] = v45;
    *(_QWORD *)(a2 + result[7]) = v36;
    v46 = (uint64_t *)(a2 + result[8]);
    *v46 = v39;
    v46[1] = v41;
    v47 = (_QWORD *)(a2 + result[9]);
    v48 = v53;
    *v47 = v51;
    v47[1] = v48;
    v47[2] = v52;
  }
  else
  {
    v22 = type metadata accessor for AppManagerError(0);
    v23 = sub_1000123E4(&qword_10004DC50, type metadata accessor for AppManagerError, (uint64_t)&unk_100036CD0);
    swift_allocError(v22, v23, 0, 0);
    v25 = v24;
    v26 = objc_msgSend(a1, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v25, v9, v5);
    v27 = swift_storeEnumTagMultiPayload(v25, v22, 0);
    return (int *)swift_willThrow(v27);
  }
  return result;
}

uint64_t type metadata accessor for AppManagerError(uint64_t a1)
{
  return sub_100011554(a1, (uint64_t *)&unk_10004F200, (uint64_t)&nominal type descriptor for AppManagerError);
}

uint64_t sub_100011554(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100011588(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[5];
  uint64_t v11;

  v4 = objc_msgSend((id)objc_opt_self(LSApplicationRecord), "enumeratorWithOptions:", 0);
  v5 = swift_allocObject(&unk_100045FA8, 32, 7);
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = swift_allocObject(&unk_100045FD0, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_100012314;
  *(_QWORD *)(v6 + 24) = v5;
  v10[4] = sub_10001232C;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100011A58;
  v10[3] = &unk_100045FE8;
  v7 = _Block_copy(v10);
  v8 = v11;
  swift_retain(v6);
  swift_release(v8);
  objc_msgSend(v4, "swift_forEach:", v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation(v6, "", 102, 67, 28, 1);
  swift_release(v5);
  result = swift_release(v6);
  if ((v4 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1000116DC(void *a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  char v21;
  _QWORD v22[2];

  v22[1] = a3;
  v5 = type metadata accessor for AppRecord(0);
  __chkstk_darwin(v5);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  v12 = (char *)v22 - v11;
  result = (uint64_t)objc_msgSend(a1, "teamIdentifier");
  if (result)
  {

    v14 = objc_msgSend(a1, "teamIdentifier");
    if (!v14)
      goto LABEL_14;
    v15 = v14;
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v18 = v17;

    if (v16 == 0x3030303030303030 && v18 == 0xEA00000000003030)
      return swift_bridgeObjectRelease(0xEA00000000003030);
    v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, 0x3030303030303030, 0xEA00000000003030, 0);
    result = swift_bridgeObjectRelease(v18);
    if ((v19 & 1) == 0)
    {
LABEL_14:
      if (!objc_msgSend(a1, "isProfileValidated")
        || (result = (uint64_t)objc_msgSend(a1, "isBeta"), (_DWORD)result))
      {
        v20 = objc_msgSend(a1, "URL");
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        v21 = sub_10001423C((uint64_t)v12);
        result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
        if ((v21 & 1) == 0)
        {
          result = (uint64_t)objc_msgSend(a1, "isDeletableSystemApplication");
          if ((result & 1) == 0)
          {
            sub_100011208(a1, (uint64_t)v7);
            a2(v7);
            return sub_100013234((uint64_t)v7, type metadata accessor for AppRecord);
          }
        }
      }
    }
  }
  return result;
}

void sub_100011A58(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

void sub_100011A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  id v32;
  NSString v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  Class isa;
  uint64_t v41;
  Class v42;
  char v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  id v68;

  v5 = type metadata accessor for AppRecord(0);
  v6 = (uint64_t *)(a2 + *(int *)(v5 + 32));
  v7 = v6[1];
  if (v7 >> 60 == 15)
  {
    v8 = static os_log_type_t.error.getter(v5);
    v9 = (void *)*sub_1000185EC();
    v10 = sub_1000110C4(&qword_10004DC40);
    v11 = swift_allocObject(v10, 72, 7);
    *(_OWORD *)(v11 + 16) = xmmword_100036CA0;
    v12 = v9;
    v13 = URL.path.getter();
    v15 = v14;
    *(_QWORD *)(v11 + 56) = &type metadata for String;
    *(_QWORD *)(v11 + 64) = sub_100012364();
    *(_QWORD *)(v11 + 32) = v13;
    *(_QWORD *)(v11 + 40) = v15;
    os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v12, "Unable to add launch warning to app without installation ID: $@", 63, 2, v11);

    swift_bridgeObjectRelease(v11);
    v16 = type metadata accessor for AppManagerError(0);
    v17 = sub_1000123E4(&qword_10004DC50, type metadata accessor for AppManagerError, (uint64_t)&unk_100036CD0);
    swift_allocError(v16, v17, 0, 0);
    v19 = v18;
    v20 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v19, a2, v20);
    v21 = swift_storeEnumTagMultiPayload(v19, v16, 1);
    swift_willThrow(v21);
  }
  else
  {
    v22 = v5;
    v66 = *v6;
    v23 = sub_10000ED74(*v6, v7);
    v24 = static os_log_type_t.default.getter(v23);
    v67 = v7;
    v64 = sub_1000185EC();
    v25 = (void *)*v64;
    v65 = sub_1000110C4(&qword_10004DC40);
    v26 = swift_allocObject(v65, 72, 7);
    *(_OWORD *)(v26 + 16) = xmmword_100036CA0;
    v27 = (uint64_t *)(a2 + *(int *)(v22 + 20));
    v28 = *v27;
    v29 = v27[1];
    *(_QWORD *)(v26 + 56) = &type metadata for String;
    v30 = sub_100012364();
    *(_QWORD *)(v26 + 64) = v30;
    *(_QWORD *)(v26 + 32) = v28;
    *(_QWORD *)(v26 + 40) = v29;
    v31 = v25;
    swift_bridgeObjectRetain(v29);
    os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v31, "Adding launch warning mark to: %@", 33, 2, v26);

    swift_bridgeObjectRelease(v26);
    v32 = objc_allocWithZone((Class)MIAppIdentity);
    swift_bridgeObjectRetain(v29);
    v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v29);
    v34 = objc_msgSend(v32, "initWithBundleID:", v33);

    v35 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 112))();
    if (v2)
    {

      sub_10000F2D8(v66, v67);
    }
    else
    {
      v37 = v35;
      v62 = v30;
      v38 = v36;
      v39 = v34;
      isa = Data._bridgeToObjectiveC()().super.isa;
      v63 = v38;
      v41 = v37;
      v42 = Data._bridgeToObjectiveC()().super.isa;
      v68 = 0;
      v43 = MISetLaunchWarning(v39, isa, v42, &v68);

      if ((v43 & 1) != 0)
      {
        v45 = v68;

        sub_10000F2D8(v66, v67);
        sub_10000EE2C(v41, v63);

      }
      else
      {
        v61 = v41;
        if (v68)
        {
          v46 = v68;
          v47 = static os_log_type_t.default.getter(v46);
          v48 = (void *)*v64;
          v49 = swift_allocObject(v65, 112, 7);
          *(_OWORD *)(v49 + 16) = xmmword_100036CC0;
          *(_QWORD *)(v49 + 56) = &type metadata for String;
          *(_QWORD *)(v49 + 64) = v62;
          *(_QWORD *)(v49 + 32) = v28;
          *(_QWORD *)(v49 + 40) = v29;
          *(_QWORD *)(v49 + 96) = sub_1000123A8();
          *(_QWORD *)(v49 + 104) = sub_1000123E4(&qword_10004DC60, (uint64_t (*)(uint64_t))sub_1000123A8, (uint64_t)&protocol conformance descriptor for NSObject);
          *(_QWORD *)(v49 + 72) = v46;
          swift_bridgeObjectRetain(v29);
          v50 = v46;
          v51 = v48;
          os_log(_:dso:log:_:_:)(v47, &_mh_execute_header, v51, "Failed to add launch warning mark: %@, %@", 41, 2, v49);

          swift_bridgeObjectRelease(v49);
          v52 = v50;
          swift_willThrow(v52);

          sub_10000F2D8(v66, v67);
          sub_10000EE2C(v61, v63);

        }
        else
        {
          v53 = static os_log_type_t.default.getter(v44);
          v54 = (void *)*v64;
          v55 = swift_allocObject(v65, 72, 7);
          *(_OWORD *)(v55 + 16) = xmmword_100036CA0;
          *(_QWORD *)(v55 + 56) = &type metadata for String;
          *(_QWORD *)(v55 + 64) = v62;
          *(_QWORD *)(v55 + 32) = v28;
          *(_QWORD *)(v55 + 40) = v29;
          swift_bridgeObjectRetain(v29);
          v56 = v54;
          os_log(_:dso:log:_:_:)(v53, &_mh_execute_header, v56, "Failed to add launch warning mark with no error: %@", 51, 2, v55);

          swift_bridgeObjectRelease(v55);
          v57 = type metadata accessor for AppManagerError(0);
          v58 = sub_1000123E4(&qword_10004DC50, type metadata accessor for AppManagerError, (uint64_t)&unk_100036CD0);
          swift_allocError(v57, v58, 0, 0);
          v60 = swift_storeEnumTagMultiPayload(v59, v57, 3);
          swift_willThrow(v60);

          sub_10000F2D8(v66, v67);
          sub_10000EE2C(v61, v63);
        }
      }
    }
  }
}

id sub_100012024(uint64_t a1, uint64_t a2)
{
  id v4;
  NSString v5;
  id v6;
  NSString v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v23;

  v4 = objc_allocWithZone((Class)RBSTerminateContext);
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "initWithExplanation:", v5);

  objc_msgSend(v6, "setMaximumTerminationResistance:", 40);
  swift_bridgeObjectRetain(a2);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v8 = objc_msgSend((id)objc_opt_self(RBSProcessPredicate), "predicateMatchingBundleIdentifier:", v7);

  v9 = objc_msgSend(objc_allocWithZone((Class)RBSTerminateRequest), "initWithPredicate:context:", v8, v6);
  v23 = 0;
  v10 = objc_msgSend(v9, "execute:", &v23);
  v11 = v23;
  if ((_DWORD)v10)
  {
    v12 = v23;

  }
  else
  {
    v13 = v23;
    v14 = _convertNSErrorToError(_:)(v11);

    v16 = swift_willThrow(v15);
    v17 = static os_log_type_t.error.getter(v16);
    v18 = (void *)*sub_1000185EC();
    v19 = sub_1000110C4(&qword_10004DC40);
    v20 = swift_allocObject(v19, 72, 7);
    *(_OWORD *)(v20 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v20 + 56) = &type metadata for String;
    *(_QWORD *)(v20 + 64) = sub_100012364();
    *(_QWORD *)(v20 + 32) = a1;
    *(_QWORD *)(v20 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    v21 = v18;
    os_log(_:dso:log:_:_:)(v17, &_mh_execute_header, v21, "Failed to terminate app: %@", 27, 2, v20);

    swift_bridgeObjectRelease(v20);
    swift_errorRelease(v14);
  }
  return v10;
}

uint64_t sub_100012268()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100012278()
{
  uint64_t v0;

  return swift_allocObject(v0, 16, 7);
}

uint64_t sub_100012288()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 80))();
}

uint64_t sub_1000122B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 88))();
}

uint64_t sub_1000122D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 96))() & 1;
}

uint64_t sub_100012304()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012314(void *a1)
{
  uint64_t v1;

  return sub_1000116DC(a1, *(void (**)(char *))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10001231C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001232C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001234C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001235C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100012364()
{
  unint64_t result;

  result = qword_10004E660;
  if (!qword_10004E660)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10004E660);
  }
  return result;
}

unint64_t sub_1000123A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004DC58;
  if (!qword_10004DC58)
  {
    v1 = objc_opt_self(NSError);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004DC58);
  }
  return result;
}

uint64_t sub_1000123E4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100012424(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v10);
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      v11 = type metadata accessor for URL(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v9 = type metadata accessor for URL(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t sub_100012510(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if (result <= 1)
  {
    v4 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_10001255C(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    v8 = type metadata accessor for URL(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, 0);
  }
  return a1;
}

void *sub_100012620(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_100013234((uint64_t)a1, type metadata accessor for AppManagerError);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = type metadata accessor for URL(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = type metadata accessor for URL(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

void *sub_1000126FC(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    v8 = type metadata accessor for URL(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, 0);
  }
  return a1;
}

void *sub_1000127C0(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_100013234((uint64_t)a1, type metadata accessor for AppManagerError);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = type metadata accessor for URL(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = type metadata accessor for URL(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t sub_10001289C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_1000128A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1000128B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_1000128C8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = v4[0];
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

uint64_t *sub_10001292C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v23);
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = a3[7];
    v18 = a3[8];
    v19 = *(uint64_t *)((char *)a2 + v17);
    *v13 = v15;
    v13[1] = v16;
    *(uint64_t *)((char *)a1 + v17) = v19;
    v20 = (char *)a1 + v18;
    v21 = (uint64_t *)((char *)a2 + v18);
    v22 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v16);
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)v20 = *(_OWORD *)v21;
    }
    else
    {
      v24 = *v21;
      sub_10000ED74(*v21, v22);
      *(_QWORD *)v20 = v24;
      *((_QWORD *)v20 + 1) = v22;
    }
    v25 = a3[9];
    v26 = (char *)a1 + v25;
    v27 = (char *)a2 + v25;
    v28 = *((_QWORD *)v27 + 2);
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)v26 = *(_OWORD *)v27;
      *((_QWORD *)v26 + 2) = *((_QWORD *)v27 + 2);
    }
    else
    {
      *(_DWORD *)v26 = *(_DWORD *)v27;
      v29 = *((_QWORD *)v27 + 1);
      sub_10000ED74(v29, v28);
      *((_QWORD *)v26 + 1) = v29;
      *((_QWORD *)v26 + 2) = v28;
    }
  }
  return a1;
}

uint64_t sub_100012A78(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[5] + 8));
  result = swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[6] + 8));
  v6 = (uint64_t *)(a1 + a2[8]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    result = sub_10000EE2C(*v6, v7);
  v8 = a1 + a2[9];
  v9 = *(_QWORD *)(v8 + 16);
  if (v9 >> 60 != 15)
    return sub_10000EE2C(*(_QWORD *)(v8 + 8), v9);
  return result;
}

uint64_t sub_100012B1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (uint64_t *)(a2 + v8);
  v14 = *v13;
  v15 = v13[1];
  v16 = a3[7];
  v17 = a3[8];
  v18 = *(_QWORD *)(a2 + v16);
  *v12 = v14;
  v12[1] = v15;
  *(_QWORD *)(a1 + v16) = v18;
  v19 = a1 + v17;
  v20 = (uint64_t *)(a2 + v17);
  v21 = *(_QWORD *)(a2 + v17 + 8);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v15);
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)v19 = *(_OWORD *)v20;
  }
  else
  {
    v22 = *v20;
    sub_10000ED74(*v20, v21);
    *(_QWORD *)v19 = v22;
    *(_QWORD *)(v19 + 8) = v21;
  }
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = *(_QWORD *)(v25 + 16);
  if (v26 >> 60 == 15)
  {
    *(_OWORD *)v24 = *(_OWORD *)v25;
    *(_QWORD *)(v24 + 16) = *(_QWORD *)(v25 + 16);
  }
  else
  {
    *(_DWORD *)v24 = *(_DWORD *)v25;
    v27 = *(_QWORD *)(v25 + 8);
    sub_10000ED74(v27, v26);
    *(_QWORD *)(v24 + 8) = v27;
    *(_QWORD *)(v24 + 16) = v26;
  }
  return a1;
}

uint64_t sub_100012C3C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 *v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v10 = v9[1];
  v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  *v13 = *v14;
  v15 = v14[1];
  v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v17 = a3[8];
  v18 = (uint64_t *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *(_QWORD *)(a2 + v17 + 8);
  if (*(_QWORD *)(a1 + v17 + 8) >> 60 == 15)
  {
    if (v20 >> 60 != 15)
    {
      v21 = *v19;
      sub_10000ED74(v21, v20);
      *v18 = v21;
      v18[1] = v20;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v20 >> 60 == 15)
  {
    sub_100012E20((uint64_t)v18);
LABEL_6:
    *(_OWORD *)v18 = *(_OWORD *)v19;
    goto LABEL_8;
  }
  v22 = *v19;
  sub_10000ED74(v22, v20);
  v23 = *v18;
  v24 = v18[1];
  *v18 = v22;
  v18[1] = v20;
  sub_10000EE2C(v23, v24);
LABEL_8:
  v25 = a3[9];
  v26 = a1 + v25;
  v27 = (__int128 *)(a2 + v25);
  v28 = *(_QWORD *)(a1 + v25 + 16) >> 60;
  v29 = *(_QWORD *)(a2 + v25 + 16) >> 60;
  if (v28 <= 0xE)
  {
    if (v29 <= 0xE)
    {
      *(_DWORD *)v26 = *(_DWORD *)v27;
      v34 = *((_QWORD *)v27 + 1);
      v35 = *((_QWORD *)v27 + 2);
      sub_10000ED74(v34, v35);
      v36 = *(_QWORD *)(v26 + 8);
      v37 = *(_QWORD *)(v26 + 16);
      *(_QWORD *)(v26 + 8) = v34;
      *(_QWORD *)(v26 + 16) = v35;
      sub_10000EE2C(v36, v37);
    }
    else
    {
      sub_100012E54(v26);
      v31 = *((_QWORD *)v27 + 2);
      *(_OWORD *)v26 = *v27;
      *(_QWORD *)(v26 + 16) = v31;
    }
  }
  else if (v29 <= 0xE)
  {
    *(_DWORD *)v26 = *(_DWORD *)v27;
    v32 = *((_QWORD *)v27 + 1);
    v33 = *((_QWORD *)v27 + 2);
    sub_10000ED74(v32, v33);
    *(_QWORD *)(v26 + 8) = v32;
    *(_QWORD *)(v26 + 16) = v33;
  }
  else
  {
    v30 = *v27;
    *(_QWORD *)(v26 + 16) = *((_QWORD *)v27 + 2);
    *(_OWORD *)v26 = v30;
  }
  return a1;
}

uint64_t sub_100012E20(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for Data - 1) + 8))();
  return a1;
}

uint64_t sub_100012E54(uint64_t a1)
{
  destroy for CDHashInfo(a1);
  return a1;
}

uint64_t sub_100012E88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v11 + 16);
  *(_OWORD *)v10 = *(_OWORD *)v11;
  return a1;
}

uint64_t sub_100012F1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  v12 = v8[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  v18 = v14[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  v19 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_QWORD *)(a1 + v19 + 8);
  if (v22 >> 60 == 15)
    goto LABEL_4;
  v23 = *(_QWORD *)(v21 + 8);
  if (v23 >> 60 == 15)
  {
    sub_100012E20(v20);
LABEL_4:
    *(_OWORD *)v20 = *(_OWORD *)v21;
    goto LABEL_6;
  }
  v24 = *(_QWORD *)v20;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *(_QWORD *)(v20 + 8) = v23;
  sub_10000EE2C(v24, v22);
LABEL_6:
  v25 = a3[9];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = *(_QWORD *)(a1 + v25 + 16);
  if (v28 >> 60 != 15)
  {
    v29 = *(_QWORD *)(v27 + 16);
    if (v29 >> 60 != 15)
    {
      *(_DWORD *)v26 = *(_DWORD *)v27;
      v30 = *(_QWORD *)(v26 + 8);
      *(_QWORD *)(v26 + 8) = *(_QWORD *)(v27 + 8);
      *(_QWORD *)(v26 + 16) = v29;
      sub_10000EE2C(v30, v28);
      return a1;
    }
    sub_100012E54(v26);
  }
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *(_QWORD *)(v26 + 16) = *(_QWORD *)(v27 + 16);
  return a1;
}

uint64_t sub_100013064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013070);
}

uint64_t sub_100013070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000130F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000130FC);
}

uint64_t sub_1000130FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_100013178(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_100036D40;
    v4[2] = &unk_100036D58;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[4] = &unk_100036D70;
    v4[5] = &unk_100036D88;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for AppManager()
{
  return objc_opt_self(_TtC17online_auth_agent10AppManager);
}

uint64_t sub_100013234(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100013270()
{
  uint64_t v0;

  v0 = type metadata accessor for URL(0);
  sub_10001388C(v0, qword_100051678);
  sub_1000132D0(v0, (uint64_t)qword_100051678);
  return URL.init(fileURLWithPath:)(0xD00000000000002BLL, 0x800000010003A3C0);
}

uint64_t sub_1000132D0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1000132E8()
{
  return 0;
}

id sub_1000132F0(char a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;
  NSURL *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  if (qword_10004F220 != -1)
    swift_once(&qword_10004F220, sub_100013270);
  v5 = type metadata accessor for URL(0);
  sub_1000132D0(v5, (uint64_t)qword_100051678);
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  v11.receiver = v4;
  v11.super_class = v2;
  v9 = objc_msgSendSuper2(&v11, "initWithDatabaseURL:asReadOnly:", v7, a1 & 1);

  return v9;
}

uint64_t type metadata accessor for LaunchWarningDB()
{
  return objc_opt_self(_TtC17online_auth_agent15LaunchWarningDB);
}

id sub_100013540()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSString v7;
  __CFString *v8;
  NSString v9;
  char v11;
  NSString v12;
  __CFString *v13;
  NSString v14;
  objc_super v16;

  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for LaunchWarningDB();
  v1 = objc_msgSendSuper2(&v16, "setupSchema");
  if ((_DWORD)v1)
  {
    v2 = objc_msgSend(v0, "readSetting:", CFSTR("databaseSchemaVersion"));
    if (v2)
    {
      v3 = v2;
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
      v6 = v5;

    }
    else
    {
      v7 = String._bridgeToObjectiveC()();
      objc_msgSend(v0, "executeQuery:withBind:withResults:", v7, 0, 0);

      v8 = CFSTR("databaseSchemaVersion");
      v4 = 49;
      v6 = 0xE100000000000000;
      v9 = String._bridgeToObjectiveC()();
      objc_msgSend(v0, "setSetting:toValue:", v8, v9);

    }
    if (v4 == 49 && v6 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease(0xE100000000000000);
    }
    else
    {
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, 49, 0xE100000000000000, 0);
      swift_bridgeObjectRelease(v6);
      if ((v11 & 1) == 0)
        return v1;
    }
    v12 = String._bridgeToObjectiveC()();
    objc_msgSend(v0, "executeQuery:withBind:withResults:", v12, 0, 0);

    v13 = CFSTR("databaseSchemaVersion");
    v14 = String._bridgeToObjectiveC()();
    objc_msgSend(v0, "setSetting:toValue:", v13, v14);

  }
  return v1;
}

id sub_100013858()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningDB();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t *sub_10001388C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

void sub_1000138CC()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  NSURL *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  id v12;
  NSURL *v13;
  void *v14;
  void *v15;
  NSURL *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  Swift::String v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  os_log_type_t v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t *v28;
  uint64_t v29;
  int v30;
  os_log_type_t v31;
  NSObject *v32;
  NSObject *v33;
  uint8_t *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;

  v0 = (void *)objc_opt_self(NSFileManager);
  v1 = objc_msgSend(v0, "defaultManager");
  URL.path.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  LODWORD(v3) = objc_msgSend(v1, "fileExistsAtPath:", v4);

  if ((_DWORD)v3)
  {
    v5 = objc_msgSend(v0, "defaultManager");
    URL._bridgeToObjectiveC()(v6);
    v8 = v7;
    v39 = 0;
    v9 = objc_msgSend(v5, "removeItemAtURL:error:", v7, &v39);

    v10 = v39;
    if (!v9)
    {
LABEL_12:
      v37 = v10;
      _convertNSErrorToError(_:)(v10);

      swift_willThrow(v38);
      return;
    }
    v11 = v39;
  }
  v12 = objc_msgSend(v0, "defaultManager");
  URL._bridgeToObjectiveC()(v13);
  v15 = v14;
  URL._bridgeToObjectiveC()(v16);
  v18 = v17;
  v39 = 0;
  v19 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v15, v17, &v39);

  v10 = v39;
  if (!v19)
    goto LABEL_12;
  v20 = v39;
  v21 = URL.path(percentEncoded:)(1);
  v22 = String.utf8CString.getter(v21._countAndFlagsBits, v21._object);
  swift_bridgeObjectRelease(v21._object);
  v23 = chmod((const char *)(v22 + 32), 0x1A4u);
  v24 = swift_release(v22);
  if (v23)
  {
    v25 = static os_log_type_t.error.getter(v24);
    v26 = *sub_1000185EC();
    if (os_log_type_enabled(v26, v25))
    {
      v27 = v26;
      v28 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v28 = 67109120;
      LODWORD(v39) = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 4, v28 + 4);
      _os_log_impl((void *)&_mh_execute_header, v27, v25, "Failed to chmod document checker: %d", v28, 8u);
      swift_slowDealloc(v28, -1, -1);

    }
  }
  v29 = notify_post("com.apple.mis.doc-check-list-ingested");
  if ((_DWORD)v29)
  {
    v30 = v29;
    v31 = static os_log_type_t.error.getter(v29);
    v32 = *sub_1000185EC();
    v29 = os_log_type_enabled(v32, v31);
    if ((_DWORD)v29)
    {
      v33 = v32;
      v34 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v34 = 67109120;
      LODWORD(v39) = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 4, v34 + 4);
      _os_log_impl((void *)&_mh_execute_header, v33, v31, "Failed to notify about new document checker: %u", v34, 8u);
      swift_slowDealloc(v34, -1, -1);

    }
  }
  v35 = static os_log_type_t.default.getter(v29);
  v36 = (id)*sub_1000185EC();
  os_log(_:dso:log:_:_:)(v35, &_mh_execute_header, v36, "Updated new document checker.", 29, 2, &_swiftEmptyArrayStorage);

}

void sub_100013C74(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for Data.Iterator(0);
  __chkstk_darwin(v3);
  __asm { BR              X10 }
}

unint64_t sub_100013CEC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  sub_10000ED74(v3, v2);
  sub_10000ED74(v3, v2);
  ((void (*)(uint64_t, unint64_t, _QWORD))Data.Iterator.init(_:at:))(v3, v2, (int)v3);
  sub_10000EE2C(v3, v2);
  v6 = sub_1000123E4((unint64_t *)&qword_10004DC38, (uint64_t (*)(uint64_t))&type metadata accessor for Data.Iterator, (uint64_t)&protocol conformance descriptor for Data.Iterator);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of IteratorProtocol.next())(v0, v6);
  if ((*(_BYTE *)(v5 - 49) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      v7 = *(unsigned __int8 *)(v5 - 50) | (v7 << 8);
      ((void (*)(uint64_t, uint64_t))dispatch thunk of IteratorProtocol.next())(v0, v6);
    }
    while (*(_BYTE *)(v5 - 49) != 1);
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
  return v7;
}

void type metadata accessor for FileAttributeKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10004DE80)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_1000460F8);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10004DE80);
  }
}

uint64_t sub_100013E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[6];

  v5[2] = a3;
  v5[3] = a4;
  v5[4] = a1;
  v5[5] = a2;
  return URL.withUnsafeFileSystemRepresentation<A>(_:)(sub_100014CF0, v5, (char *)&type metadata for () + 8);
}

void sub_100013E54(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  char *v5;
  _QWORD v6[2];

  type metadata accessor for POSIXError(0);
  __chkstk_darwin();
  v5 = (char *)&loc_100013EE0 + dword_10001422C[a3 >> 62];
  v6[1] = (char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __asm { BR              X10 }
}

uint64_t sub_100013EF4()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t result;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _DWORD *v20;

  *(_QWORD *)(v7 - 104) = v3;
  *(_WORD *)(v7 - 96) = v6;
  *(_BYTE *)(v7 - 94) = BYTE2(v6);
  *(_BYTE *)(v7 - 93) = BYTE3(v6);
  *(_BYTE *)(v7 - 92) = BYTE4(v6);
  *(_BYTE *)(v7 - 91) = BYTE5(v6);
  v8 = String.utf8CString.getter(v5, v4);
  v9 = setxattr(v2, (const char *)(v8 + 32), (const void *)(v7 - 104), BYTE6(v6), 0, 0);
  result = swift_release(v8);
  if (v9 < 0)
  {
    v11 = ((uint64_t (*)(uint64_t))errno.getter)(result);
    v12 = v11;
    v13 = POSIXErrorCode.init(rawValue:)(v11);
    if ((v13 & 0x100000000) != 0)
    {
      v19 = sub_100014F84();
      v18 = swift_allocError(&type metadata for UtilitiesError, v19, 0, 0);
      *v20 = v12;
    }
    else
    {
      *(_DWORD *)(v7 - 104) = v13;
      v14 = sub_100014924((uint64_t)&_swiftEmptyArrayStorage);
      v15 = sub_1000123E4(&qword_10004DEB0, (uint64_t (*)(uint64_t))&type metadata accessor for POSIXError, (uint64_t)&protocol conformance descriptor for POSIXError);
      v16 = *(_QWORD *)(v7 - 120);
      v17 = _BridgedStoredNSError.init(_:userInfo:)(v7 - 104, v14, v1, v15);
      POSIXError._nsError.getter(v17);
      v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v16, v1);
    }
    return swift_willThrow(v18);
  }
  return result;
}

uint64_t sub_10001423C(uint64_t a1)
{
  uint64_t v1;
  Swift::String v3;
  const char *v4;
  statfs *v5;
  int v6;
  _BYTE v8[64];
  unsigned int v9;
  _QWORD v10[2];
  _BYTE v11[16];
  statfs *v12;
  uint64_t v13;

  bzero(v8, 0x878uLL);
  v3 = URL.path(percentEncoded:)(1);
  v12 = (statfs *)v8;
  v13 = a1;
  if (((uint64_t)v3._object & 0x1000000000000000) != 0
    || !((uint64_t)v3._object & 0x2000000000000000 | v3._countAndFlagsBits & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)(sub_100014D0C, v11, v3._countAndFlagsBits, v3._object, (char *)&type metadata for () + 8);
    if (v1)
      goto LABEL_9;
LABEL_11:
    swift_bridgeObjectRelease(v3._object);
    v6 = (v9 >> 14) & 1;
    return v6 & 1;
  }
  if (((uint64_t)v3._object & 0x2000000000000000) != 0)
  {
    v10[0] = v3._countAndFlagsBits;
    v10[1] = (uint64_t)v3._object & 0xFFFFFFFFFFFFFFLL;
    v4 = (const char *)v10;
    goto LABEL_7;
  }
  if ((v3._countAndFlagsBits & 0x1000000000000000) != 0)
  {
    v4 = (const char *)(((uint64_t)v3._object & 0xFFFFFFFFFFFFFFFLL) + 32);
LABEL_7:
    v5 = (statfs *)v8;
    goto LABEL_8;
  }
  v4 = (const char *)_StringObject.sharedUTF8.getter(v3._countAndFlagsBits, v3._object);
  v5 = v12;
LABEL_8:
  sub_10001437C(v4, v5);
  if (!v1)
    goto LABEL_11;
LABEL_9:
  swift_bridgeObjectRelease(v3._object);
  return v6 & 1;
}

uint64_t sub_10001437C(const char *a1, statfs *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  int v26;

  v4 = type metadata accessor for POSIXError(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = statfs(a1, a2);
  if ((_DWORD)result == -1)
  {
    v9 = errno.getter();
    v10 = static os_log_type_t.error.getter(v9);
    v11 = (void *)*sub_1000185EC();
    v12 = sub_1000110C4(&qword_10004DC40);
    v13 = swift_allocObject(v12, 112, 7);
    *(_OWORD *)(v13 + 16) = xmmword_100036CC0;
    *(_QWORD *)(v13 + 56) = &type metadata for Int32;
    *(_QWORD *)(v13 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v13 + 32) = v9;
    v14 = v11;
    v15 = URL.path.getter();
    v17 = v16;
    *(_QWORD *)(v13 + 96) = &type metadata for String;
    *(_QWORD *)(v13 + 104) = sub_100012364();
    *(_QWORD *)(v13 + 72) = v15;
    *(_QWORD *)(v13 + 80) = v17;
    os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v14, "Unable to statfs app: %d, %@", 28, 2, v13);

    swift_bridgeObjectRelease(v13);
    v18 = POSIXErrorCode.init(rawValue:)(v9);
    if ((v18 & 0x100000000) != 0)
    {
      v23 = sub_100014F84();
      v22 = swift_allocError(&type metadata for UtilitiesError, v23, 0, 0);
      *v24 = v9;
    }
    else
    {
      v26 = v18;
      v19 = sub_100014924((uint64_t)&_swiftEmptyArrayStorage);
      v20 = sub_1000123E4(&qword_10004DEB0, (uint64_t (*)(uint64_t))&type metadata accessor for POSIXError, (uint64_t)&protocol conformance descriptor for POSIXError);
      v21 = _BridgedStoredNSError.init(_:userInfo:)(&v26, v19, v4, v20);
      POSIXError._nsError.getter(v21);
      v22 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    return swift_willThrow(v22);
  }
  return result;
}

uint64_t sub_100014578(uint64_t a1, uint64_t a2)
{
  return sub_100014640(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100014584(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000145C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100014634(uint64_t a1, uint64_t a2)
{
  return sub_100014640(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100014640(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10001467C(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_1000146F0(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10001476C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_1000147AC(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100014834@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100014878@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000148A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000123E4(&qword_10004DE70, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100036F98);
  v3 = sub_1000123E4(&qword_10004DEA0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100036EEC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100014924(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000110C4(&qword_10004DEB8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100014FC8(v7, (uint64_t)&v16);
    v8 = v16;
    v9 = v17;
    result = sub_100014A4C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100015010(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100014A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100014AB0(a1, a2, v5);
}

unint64_t sub_100014AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v17;
  uint64_t v18;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    v11 = v10[1];
    if ((*v10 != a1 || v11 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      i = (i + 1) & v13;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v14 = (_QWORD *)(v9 + 16 * i);
        v15 = v14[1];
        if ((*v14 != a1 || v15 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0)
        {
          for (i = (i + 1) & v13; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v13)
          {
            v17 = (_QWORD *)(v9 + 16 * i);
            v18 = v17[1];
            if (*v17 == a1 && v18 == a2)
              break;
            if ((_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_100014BF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_100014E10(a1, v7);
}

uint64_t sub_100014C74(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000110C4(&qword_10004DE78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100014CF0(uint64_t a1)
{
  uint64_t v1;

  sub_100013E54(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100014D0C(const char *a1)
{
  uint64_t v1;

  return sub_10001437C(a1, *(statfs **)(v1 + 16));
}

_DWORD *initializeBufferWithCopyOfBuffer for UtilitiesError(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UtilitiesError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UtilitiesError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UtilitiesError()
{
  return &type metadata for UtilitiesError;
}

uint64_t sub_100014D8C()
{
  return sub_1000123E4(&qword_10004DE88, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100036EB0);
}

uint64_t sub_100014DB8()
{
  return sub_1000123E4(&qword_10004DE90, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100036E84);
}

uint64_t sub_100014DE4()
{
  return sub_1000123E4(&qword_10004DE98, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100036F20);
}

unint64_t sub_100014E10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100014F84()
{
  unint64_t result;

  result = qword_10004DEA8;
  if (!qword_10004DEA8)
  {
    result = swift_getWitnessTable(&unk_100036DE4, &type metadata for UtilitiesError);
    atomic_store(result, (unint64_t *)&qword_10004DEA8);
  }
  return result;
}

uint64_t sub_100014FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000110C4(&qword_10004DEC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100015010(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100015020(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      v2 = type metadata accessor for __DataStorage(0);
      swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
      __DataStorage.init(length:)(v1);
      if (v1 >= 0x7FFFFFFF)
      {
        v3 = type metadata accessor for Data.RangeReference(0);
        result = swift_allocObject(v3, 32, 7);
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void sub_1000150BC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_10001511C()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  __int16 v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char *v19;

  v13 = v1;
  v14 = v0;
  v15 = BYTE2(v0);
  v16 = BYTE3(v0);
  v17 = BYTE4(v0);
  v18 = BYTE5(v0);
  if ((v0 & 0x3000000000000) != 0)
  {
    v2 = sub_10001556C();
    v3 = swift_allocError(&type metadata for BloomFilterError, v2, 0, 0);
    *(_OWORD *)v4 = xmmword_100037000;
    *(_BYTE *)(v4 + 16) = 2;
    swift_willThrow(v3);
    sub_10000EE2C(v1, v0);
    return swift_bridgeObjectRelease(v19);
  }
  else
  {
    v6 = (v0 >> 50) & 0x3F;
    if (!v6)
      __break(1u);
    v7 = sub_1000155B0(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    v8 = 0;
    v9 = *((_QWORD *)v7 + 2);
    v10 = 4 * v6;
    do
    {
      v11 = *(_DWORD *)((char *)&v13 + v8);
      v12 = *((_QWORD *)v7 + 3);
      if (v9 >= v12 >> 1)
        v7 = sub_1000155B0((char *)(v12 > 1), v9 + 1, 1, v7);
      *((_QWORD *)v7 + 2) = v9 + 1;
      *(_DWORD *)&v7[4 * v9 + 32] = bswap32(v11);
      v8 += 4;
      ++v9;
    }
    while (v10 != v8);
    sub_10000EE2C(v1, v0);
    v19 = v7;
    return (uint64_t)v7;
  }
}

uint64_t sub_10001535C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD);
  uint64_t v7;

  v3 = v2;
  v4 = *(_QWORD *)(result + 16);
  if (v4)
  {
    v5 = result;
    v6 = *(void (**)(_QWORD))(**(_QWORD **)(v1 + 40) + 136);
    swift_bridgeObjectRetain(result);
    v7 = 0;
    do
    {
      v6(*(unsigned int *)(v5 + 4 * v7 + 32));
      if (v3)
        break;
    }
    while (v4 - 1 != v7++);
    return swift_bridgeObjectRelease(v5);
  }
  return result;
}

uint64_t sub_1000153E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;
  unsigned int *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;

  result = __DataStorage._bytes.getter();
  v8 = (unsigned int *)result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v8 = (unsigned int *)((char *)v8 + a1 - result);
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  result = __DataStorage._length.getter();
  if (!v8)
    goto LABEL_25;
  if (result >= v10)
    v11 = v10;
  else
    v11 = result;
  if ((v11 & 3) != 0)
  {
    v12 = sub_10001556C();
    v13 = swift_allocError(&type metadata for BloomFilterError, v12, 0, 0);
    *(_OWORD *)v14 = xmmword_100037000;
    *(_BYTE *)(v14 + 16) = 2;
    return swift_willThrow(v13);
  }
  v15 = v11 + 3;
  if (v11 >= 0)
    v15 = v11;
  if (v11 < 4)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  v16 = (v15 >> 2) - 1;
  v17 = *a4;
  v18 = 0x2000000000000000;
  while (1)
  {
    v20 = *v8++;
    v19 = v20;
    result = swift_isUniquelyReferenced_nonNull_native(v17);
    *a4 = v17;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1000155B0(0, *(_QWORD *)(v17 + 16) + 1, 1, (char *)v17);
      v17 = result;
      *a4 = result;
    }
    v22 = *(_QWORD *)(v17 + 16);
    v21 = *(_QWORD *)(v17 + 24);
    if (v22 >= v21 >> 1)
    {
      result = (uint64_t)sub_1000155B0((char *)(v21 > 1), v22 + 1, 1, (char *)v17);
      v17 = result;
    }
    *(_QWORD *)(v17 + 16) = v22 + 1;
    *(_DWORD *)(v17 + 4 * v22 + 32) = bswap32(v19);
    *a4 = v17;
    if (!v16)
      return result;
    --v16;
    if (!--v18)
    {
      __break(1u);
      goto LABEL_23;
    }
  }
}

unint64_t sub_10001556C()
{
  unint64_t result;

  result = qword_10004DEC8;
  if (!qword_10004DEC8)
  {
    result = swift_getWitnessTable(&unk_10003795C, &type metadata for BloomFilterError);
    atomic_store(result, (unint64_t *)&qword_10004DEC8);
  }
  return result;
}

char *sub_1000155B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000110C4(&qword_10004DED0);
    v11 = (char *)swift_allocObject(v10, 4 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 29;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 2);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[4 * v8])
      memmove(v14, v15, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 4 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

ValueMetadata *type metadata accessor for BloomFilterUpdate()
{
  return &type metadata for BloomFilterUpdate;
}

_QWORD *sub_1000156B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  void (*v7)(uint64_t, uint64_t);
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = v2;
  v6 = (_QWORD *)swift_allocObject(v2, 48, 7);
  v6[2] = a1;
  v6[3] = a2;
  if (a1 == 0x363532616873 && a2 == 0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x363532616873, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = sub_100015DB4;
  }
  else
  {
    if ((a1 != 0x323135616873 || a2 != 0xE600000000000000)
      && (_stringCompareWithSmolCheck(_:_:expecting:)(0x323135616873, 0xE600000000000000, a1, a2, 0) & 1) == 0)
    {
      v9 = sub_10001556C();
      v10 = swift_allocError(&type metadata for BloomFilterError, v9, 0, 0);
      *(_OWORD *)v11 = xmmword_100037030;
      *(_BYTE *)(v11 + 16) = 2;
      swift_willThrow(v10);
      swift_bridgeObjectRelease(v6[3]);
      swift_deallocPartialClassInstance(v6, v3, 48, 7);
      return v6;
    }
    v7 = sub_100016394;
  }
  v6[4] = v7;
  v6[5] = 0;
  return v6;
}

uint64_t sub_10001580C()
{
  return 1;
}

Swift::Int sub_100015814()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 1701667182, 0xE400000000000000);
  return Hasher._finalize()();
}

uint64_t sub_10001585C(uint64_t a1)
{
  return String.hash(into:)(a1, 1701667182, 0xE400000000000000);
}

Swift::Int sub_10001586C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 1701667182, 0xE400000000000000);
  return Hasher._finalize()();
}

uint64_t sub_1000158B0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100046210, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100015900(_QWORD *a1@<X8>)
{
  *a1 = 1701667182;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_100015914()
{
  return 1701667182;
}

uint64_t sub_100015924@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100046248, v3);
  result = swift_bridgeObjectRelease(object);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100015978()
{
  return 0;
}

void sub_100015984(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100015990(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016AB8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000159B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016AB8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000159E0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject(v1, 48, 7);
  sub_100015A2C(a1);
  return v3;
}

_QWORD *sub_100015A2C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void (*v20)(uint64_t, uint64_t);
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = v1;
  v5 = sub_1000110C4(&qword_10004DED8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000111AC(a1, v9);
  v11 = sub_100016AB8();
  v12 = dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BloomFilterAlgorithm.CodingKeys, &type metadata for BloomFilterAlgorithm.CodingKeys, v11, v9, v10);
  if (!v2)
  {
    v13 = KeyedDecodingContainer.decode(_:forKey:)(v12, v5);
    v17 = v13;
    v18 = v14;
    v3[2] = v13;
    v3[3] = v14;
    v19 = v13 == 0x363532616873 && v14 == 0xE600000000000000;
    if (v19
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x363532616873, 0xE600000000000000, v13, v14, 0) & 1) != 0)
    {
      v20 = sub_100015DB4;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v3[4] = v20;
      v3[5] = 0;
      goto LABEL_4;
    }
    v21 = v17 == 0x323135616873 && v18 == 0xE600000000000000;
    if (v21
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x323135616873, 0xE600000000000000, v17, v18, 0) & 1) != 0)
    {
      v20 = sub_100016394;
      goto LABEL_11;
    }
    v22 = sub_10001556C();
    v23 = swift_allocError(&type metadata for BloomFilterError, v22, 0, 0);
    *(_OWORD *)v24 = xmmword_100037030;
    *(_BYTE *)(v24 + 16) = 2;
    swift_willThrow(v23);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease(v3[3]);
  }
  v15 = type metadata accessor for BloomFilterAlgorithm();
  swift_deallocPartialClassInstance(v3, v15, 48, 7);
LABEL_4:
  sub_1000111D0(a1);
  return v3;
}

uint64_t sub_100015C54(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v2 = v1;
  v4 = sub_1000110C4(&qword_10004DEE8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_1000111AC(a1, v8);
  v10 = sub_100016AB8();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BloomFilterAlgorithm.CodingKeys, &type metadata for BloomFilterAlgorithm.CodingKeys, v10, v8, v9);
  KeyedEncodingContainer.encode(_:forKey:)(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100015D34()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t sub_100015D60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_100015D8C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 112))();
}

void sub_100015DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = type metadata accessor for SHA256(0);
  __chkstk_darwin(v3);
  v4 = type metadata accessor for SHA256Digest(0);
  __chkstk_darwin(v4);
  v5 = sub_1000123E4(&qword_10004DEF0, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256, (uint64_t)&protocol conformance descriptor for SHA256);
  dispatch thunk of HashFunction.init()(v3, v5);
  __asm { BR              X10 }
}

uint64_t sub_100015EB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;

  *(_QWORD *)(v8 - 128) = v5;
  *(_WORD *)(v8 - 120) = v4;
  *(_BYTE *)(v8 - 118) = BYTE2(v4);
  *(_BYTE *)(v8 - 117) = BYTE3(v4);
  *(_BYTE *)(v8 - 116) = BYTE4(v4);
  *(_BYTE *)(v8 - 115) = BYTE5(v4);
  dispatch thunk of HashFunction.update(bufferPointer:)(v8 - 128, v8 - 128 + BYTE6(v4), v2, v6);
  sub_10000EE2C(v5, v4);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v2, v6);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 160) + 8))(v3, v2);
  *(_QWORD *)(v8 - 104) = v0;
  v9 = sub_1000123E4(&qword_10004DEF8, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256Digest, (uint64_t)&protocol conformance descriptor for SHA256Digest);
  *(_QWORD *)(v8 - 96) = v9;
  v10 = sub_100016B70((_QWORD *)(v8 - 128));
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 16))(v10, v1, v0);
  sub_1000111AC((_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 104));
  ((void (*)(_BYTE *(*)@<X0>(_BYTE *@<X0>, _BYTE *@<X1>, _QWORD *@<X8>), _QWORD, void *, uint64_t, uint64_t))dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:))(sub_100016AFC, 0, &type metadata for Data._Representation, v0, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v0);
  v11 = *(_QWORD *)(v8 - 144);
  v12 = *(_QWORD *)(v8 - 136);
  sub_1000111D0((_QWORD *)(v8 - 128));
  v13 = sub_1000110C4(&qword_10004DF00);
  v14 = swift_allocObject(v13, 96, 7);
  *(_OWORD *)(v14 + 16) = xmmword_100037040;
  v15 = sub_100016318(0, 3, v11, v12);
  v17 = v16;
  sub_100013C74(v15, v16);
  v19 = v18;
  sub_10000EE2C(v15, v17);
  *(_QWORD *)(v14 + 32) = v19;
  v20 = sub_100016318(4, 7, v11, v12);
  v22 = v21;
  sub_100013C74(v20, v21);
  v24 = v23;
  sub_10000EE2C(v20, v22);
  *(_QWORD *)(v14 + 40) = v24;
  v25 = sub_100016318(8, 11, v11, v12);
  v27 = v26;
  sub_100013C74(v25, v26);
  v29 = v28;
  sub_10000EE2C(v25, v27);
  *(_QWORD *)(v14 + 48) = v29;
  v30 = sub_100016318(12, 15, v11, v12);
  v32 = v31;
  sub_100013C74(v30, v31);
  v34 = v33;
  sub_10000EE2C(v30, v32);
  *(_QWORD *)(v14 + 56) = v34;
  v35 = sub_100016318(16, 19, v11, v12);
  v37 = v36;
  sub_100013C74(v35, v36);
  v39 = v38;
  sub_10000EE2C(v35, v37);
  *(_QWORD *)(v14 + 64) = v39;
  v40 = sub_100016318(20, 23, v11, v12);
  v42 = v41;
  sub_100013C74(v40, v41);
  v44 = v43;
  sub_10000EE2C(v40, v42);
  *(_QWORD *)(v14 + 72) = v44;
  v45 = sub_100016318(24, 27, v11, v12);
  v47 = v46;
  sub_100013C74(v45, v46);
  v49 = v48;
  sub_10000EE2C(v45, v47);
  *(_QWORD *)(v14 + 80) = v49;
  v50 = sub_100016318(28, 31, v11, v12);
  v52 = v51;
  sub_100013C74(v50, v51);
  v54 = v53;
  sub_10000EE2C(v50, v52);
  *(_QWORD *)(v14 + 88) = v54;
  sub_10000EE2C(v11, v12);
  return v14;
}

uint64_t sub_100016318(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_100016328 + dword_100016384[a4 >> 62]))();
}

uint64_t sub_10001633C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (BYTE6(a4) <= a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a2 + 1 < a1)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x100016384);
  }
  return Data._Representation.subscript.getter();
}

void sub_100016394(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = type metadata accessor for SHA512(0);
  __chkstk_darwin(v3);
  v4 = type metadata accessor for SHA512Digest(0);
  __chkstk_darwin(v4);
  v5 = sub_1000123E4(&qword_10004DF08, (uint64_t (*)(uint64_t))&type metadata accessor for SHA512, (uint64_t)&protocol conformance descriptor for SHA512);
  dispatch thunk of HashFunction.init()(v3, v5);
  __asm { BR              X10 }
}

uint64_t sub_100016498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;

  *(_QWORD *)(v8 - 128) = v5;
  *(_WORD *)(v8 - 120) = v4;
  *(_BYTE *)(v8 - 118) = BYTE2(v4);
  *(_BYTE *)(v8 - 117) = BYTE3(v4);
  *(_BYTE *)(v8 - 116) = BYTE4(v4);
  *(_BYTE *)(v8 - 115) = BYTE5(v4);
  dispatch thunk of HashFunction.update(bufferPointer:)(v8 - 128, v8 - 128 + BYTE6(v4), v2, v6);
  sub_10000EE2C(v5, v4);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v2, v6);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 160) + 8))(v3, v2);
  *(_QWORD *)(v8 - 104) = v0;
  v9 = sub_1000123E4(&qword_10004DF10, (uint64_t (*)(uint64_t))&type metadata accessor for SHA512Digest, (uint64_t)&protocol conformance descriptor for SHA512Digest);
  *(_QWORD *)(v8 - 96) = v9;
  v10 = sub_100016B70((_QWORD *)(v8 - 128));
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 16))(v10, v1, v0);
  sub_1000111AC((_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 104));
  ((void (*)(_BYTE *(*)@<X0>(_BYTE *@<X0>, _BYTE *@<X1>, _QWORD *@<X8>), _QWORD, void *, uint64_t, uint64_t))dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:))(sub_100016AFC, 0, &type metadata for Data._Representation, v0, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v0);
  v11 = *(_QWORD *)(v8 - 144);
  v12 = *(_QWORD *)(v8 - 136);
  sub_1000111D0((_QWORD *)(v8 - 128));
  v13 = sub_1000110C4(&qword_10004DF00);
  v14 = swift_allocObject(v13, 160, 7);
  *(_OWORD *)(v14 + 16) = xmmword_100037050;
  v15 = sub_100016318(0, 3, v11, v12);
  v17 = v16;
  sub_100013C74(v15, v16);
  v19 = v18;
  sub_10000EE2C(v15, v17);
  *(_QWORD *)(v14 + 32) = v19;
  v20 = sub_100016318(4, 7, v11, v12);
  v22 = v21;
  sub_100013C74(v20, v21);
  v24 = v23;
  sub_10000EE2C(v20, v22);
  *(_QWORD *)(v14 + 40) = v24;
  v25 = sub_100016318(8, 11, v11, v12);
  v27 = v26;
  sub_100013C74(v25, v26);
  v29 = v28;
  sub_10000EE2C(v25, v27);
  *(_QWORD *)(v14 + 48) = v29;
  v30 = sub_100016318(12, 15, v11, v12);
  v32 = v31;
  sub_100013C74(v30, v31);
  v34 = v33;
  sub_10000EE2C(v30, v32);
  *(_QWORD *)(v14 + 56) = v34;
  v35 = sub_100016318(16, 19, v11, v12);
  v37 = v36;
  sub_100013C74(v35, v36);
  v39 = v38;
  sub_10000EE2C(v35, v37);
  *(_QWORD *)(v14 + 64) = v39;
  v40 = sub_100016318(20, 23, v11, v12);
  v42 = v41;
  sub_100013C74(v40, v41);
  v44 = v43;
  sub_10000EE2C(v40, v42);
  *(_QWORD *)(v14 + 72) = v44;
  v45 = sub_100016318(24, 27, v11, v12);
  v47 = v46;
  sub_100013C74(v45, v46);
  v49 = v48;
  sub_10000EE2C(v45, v47);
  *(_QWORD *)(v14 + 80) = v49;
  v50 = sub_100016318(28, 31, v11, v12);
  v52 = v51;
  sub_100013C74(v50, v51);
  v54 = v53;
  sub_10000EE2C(v50, v52);
  *(_QWORD *)(v14 + 88) = v54;
  v55 = sub_100016318(32, 35, v11, v12);
  v57 = v56;
  sub_100013C74(v55, v56);
  v59 = v58;
  sub_10000EE2C(v55, v57);
  *(_QWORD *)(v14 + 96) = v59;
  v60 = sub_100016318(36, 39, v11, v12);
  v62 = v61;
  sub_100013C74(v60, v61);
  v64 = v63;
  sub_10000EE2C(v60, v62);
  *(_QWORD *)(v14 + 104) = v64;
  v65 = sub_100016318(40, 43, v11, v12);
  v67 = v66;
  sub_100013C74(v65, v66);
  v69 = v68;
  sub_10000EE2C(v65, v67);
  *(_QWORD *)(v14 + 112) = v69;
  v70 = sub_100016318(44, 47, v11, v12);
  v72 = v71;
  sub_100013C74(v70, v71);
  v74 = v73;
  sub_10000EE2C(v70, v72);
  *(_QWORD *)(v14 + 120) = v74;
  v75 = sub_100016318(48, 51, v11, v12);
  v77 = v76;
  sub_100013C74(v75, v76);
  v79 = v78;
  sub_10000EE2C(v75, v77);
  *(_QWORD *)(v14 + 128) = v79;
  v80 = sub_100016318(52, 55, v11, v12);
  v82 = v81;
  sub_100013C74(v80, v81);
  v84 = v83;
  sub_10000EE2C(v80, v82);
  *(_QWORD *)(v14 + 136) = v84;
  v85 = sub_100016318(56, 59, v11, v12);
  v87 = v86;
  sub_100013C74(v85, v86);
  v89 = v88;
  sub_10000EE2C(v85, v87);
  *(_QWORD *)(v14 + 144) = v89;
  v90 = sub_100016318(60, 63, v11, v12);
  v92 = v91;
  sub_100013C74(v90, v91);
  v94 = v93;
  sub_10000EE2C(v90, v92);
  *(_QWORD *)(v14 + 152) = v94;
  sub_10000EE2C(v11, v12);
  return v14;
}

uint64_t type metadata accessor for BloomFilterAlgorithm()
{
  return objc_opt_self(_TtC17online_auth_agent20BloomFilterAlgorithm);
}

unint64_t sub_100016AB8()
{
  unint64_t result;

  result = qword_10004DEE0;
  if (!qword_10004DEE0)
  {
    result = swift_getWitnessTable(&unk_10003710C, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DEE0);
  }
  return result;
}

_BYTE *sub_100016AFC@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_10000FFB0(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_100016E58((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_100016ED0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_100016B70(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_100016BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  result = __DataStorage._bytes.getter();
  v13 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v13 += a1 - result;
  }
  v14 = __OFSUB__(a2, a1);
  v15 = a2 - a1;
  if (v14)
  {
    __break(1u);
    goto LABEL_13;
  }
  v16 = __DataStorage._length.getter();
  if (v16 >= v15)
    v17 = v15;
  else
    v17 = v16;
  v18 = v13 + v17;
  if (v13)
    v19 = v18;
  else
    v19 = 0;
  v20 = a5(0);
  v21 = sub_1000123E4(a6, a5, a7);
  return dispatch thunk of HashFunction.update(bufferPointer:)(v13, v19, v20, v21);
}

unint64_t sub_100016C84()
{
  unint64_t result;

  result = qword_10004DF18;
  if (!qword_10004DF18)
  {
    result = swift_getWitnessTable(&unk_10003706C, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DF18);
  }
  return result;
}

unint64_t sub_100016CCC()
{
  unint64_t result;

  result = qword_10004DF20;
  if (!qword_10004DF20)
  {
    result = swift_getWitnessTable(&unk_100037184, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DF20);
  }
  return result;
}

unint64_t sub_100016D14()
{
  unint64_t result;

  result = qword_10004DF28;
  if (!qword_10004DF28)
  {
    result = swift_getWitnessTable(&unk_10003715C, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DF28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BloomFilterAlgorithm.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for BloomFilterAlgorithm.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_100016DEC + 4 * byte_100037060[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100016E0C + 4 * byte_100037065[v4]))();
}

_BYTE *sub_100016DEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100016E0C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100016E14(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100016E1C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100016E24(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100016E2C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterAlgorithm.CodingKeys()
{
  return &type metadata for BloomFilterAlgorithm.CodingKeys;
}

ValueMetadata *type metadata accessor for HashAlgorithmRegistry()
{
  return &type metadata for HashAlgorithmRegistry;
}

uint64_t sub_100016E58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (a1)
    v3 = a2 - a1;
  else
    v3 = 0;
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = type metadata accessor for Data.RangeReference(0);
    result = swift_allocObject(v6, 32, 7);
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v3;
  }
  return result;
}

uint64_t sub_100016ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  if (a1)
    v3 = a2 - a1;
  else
    v3 = 0;
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v3 & 0x80000000) == 0)
    return v3 << 32;
LABEL_10:
  __break(1u);
  return result;
}

const char *sub_100016F50()
{
  return "ckContainer";
}

const char *sub_100016F5C()
{
  return "ckEnvironment";
}

uint64_t sub_100016F68()
{
  return sub_100017220();
}

id sub_100016F80()
{
  return sub_100017070();
}

void sub_100016FA0()
{
  sub_100017128();
}

void sub_100016FC0()
{
  void *v0;
  NSString v1;

  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "deleteSetting:", v1);

}

uint64_t sub_100017014()
{
  return sub_100017220();
}

void sub_100017030()
{
  sub_1000172B4();
}

id sub_10001704C()
{
  return sub_100017070();
}

id sub_100017070()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "readSetting:", v1);

  if (v2)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v5 = v4;

    v2 = (id)Data.init(base64Encoded:options:)(v3, v5, 0);
    swift_bridgeObjectRelease(v5);
  }
  return v2;
}

void sub_100017104()
{
  sub_100017128();
}

void sub_100017128()
{
  void *v0;
  NSString v1;
  void *object;
  NSString v3;

  v1 = String._bridgeToObjectiveC()();
  object = Data.base64EncodedString(options:)(0)._object;
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v0, "setSetting:toValue:", v1, v3);

}

void sub_1000171AC()
{
  void *v0;
  NSString v1;

  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "deleteSetting:", v1);

}

uint64_t sub_100017204()
{
  return sub_100017220();
}

uint64_t sub_100017220()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;

  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "readSetting:", v1);

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void sub_100017298()
{
  sub_1000172B4();
}

void sub_1000172B4()
{
  void *v0;
  NSString v1;
  NSString v2;

  v1 = String._bridgeToObjectiveC()();
  v2 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "setSetting:toValue:", v1, v2);

}

uint64_t sub_100017324(uint64_t a1)
{
  unsigned int v1;

  if (a1 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (a1)
    return v1;
  else
    return 0;
}

uint64_t sub_10001733C(char a1)
{
  return a1 & 1;
}

BOOL sub_100017344(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10001735C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000173A0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000173C8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

_QWORD *sub_100017408@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_100017428(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void *sub_100017434()
{
  return &unk_100037280;
}

void *sub_100017440()
{
  return &unk_100037288;
}

_QWORD *sub_10001744C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100017458(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100017460@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_100017474@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_100017488@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10001749C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1000174CC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000174F8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_10001751C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100017530(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_100017544(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_100017558@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10001756C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_100017580(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_100017594(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1000175A8()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1000175B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_1000175D0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1000175E4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1000175F4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_100017600(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100017614@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_1000183F8(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t type metadata accessor for LaunchWarningDetails(uint64_t a1)
{
  uint64_t result;

  result = qword_10004FDB0;
  if (!qword_10004FDB0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LaunchWarningDetails);
  return result;
}

uint64_t sub_10001768C@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;

  *(_DWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(_QWORD *)(a8 + 16) = a3;
  v12 = a5 & 1;
  v13 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v14 = a8 + v13[6];
  v15 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a4, v15);
  *(_BYTE *)(a8 + v13[7]) = v12;
  *(_QWORD *)(a8 + v13[8]) = a6;
  return sub_100017728(a7, a8 + v13[9]);
}

uint64_t sub_100017728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000110C4(&qword_10004E810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100017774()
{
  unint64_t result;

  result = qword_10004DFE8;
  if (!qword_10004DFE8)
  {
    result = swift_getWitnessTable(&unk_100037290, &type metadata for LaunchWarningReason);
    atomic_store(result, (unint64_t *)&qword_10004DFE8);
  }
  return result;
}

unint64_t sub_1000177BC()
{
  unint64_t result;

  result = qword_10004DFF0;
  if (!qword_10004DFF0)
  {
    result = swift_getWitnessTable(&unk_100037430, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004DFF0);
  }
  return result;
}

unint64_t sub_100017804()
{
  unint64_t result;

  result = qword_10004DFF8;
  if (!qword_10004DFF8)
  {
    result = swift_getWitnessTable(&unk_100037368, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004DFF8);
  }
  return result;
}

unint64_t sub_10001784C()
{
  unint64_t result;

  result = qword_10004E000;
  if (!qword_10004E000)
  {
    result = swift_getWitnessTable(&unk_100037468, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004E000);
  }
  return result;
}

unint64_t sub_100017894()
{
  unint64_t result;

  result = qword_10004E008;
  if (!qword_10004E008)
  {
    result = swift_getWitnessTable(&unk_100037490, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004E008);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for LaunchWarningReason(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningReason(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchWarningReason(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1000179C0 + 4 * byte_100037275[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000179F4 + 4 * byte_100037270[v4]))();
}

uint64_t sub_1000179F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000179FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100017A04);
  return result;
}

uint64_t sub_100017A10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100017A18);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100017A1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100017A24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100017A30(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100017A38(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningReason()
{
  return &type metadata for LaunchWarningReason;
}

ValueMetadata *type metadata accessor for LaunchWarningFlags()
{
  return &type metadata for LaunchWarningFlags;
}

_QWORD *sub_100017A64(_DWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v20);
  }
  else
  {
    *a1 = *(_DWORD *)a2;
    v7 = a2[1];
    v8 = a2[2];
    sub_10000ED74(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    v9 = a3[6];
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(_QWORD *)((char *)v4 + v13) = *(_QWORD *)((char *)a2 + v13);
    v14 = a3[9];
    v15 = (char *)v4 + v14;
    v16 = (char *)a2 + v14;
    v17 = type metadata accessor for URL(0);
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = sub_1000110C4(&qword_10004E810);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t sub_100017BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  sub_10000EE2C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 36);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

uint64_t sub_100017C4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_10000ED74(v6, v7);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v13 = a3[9];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = type metadata accessor for URL(0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = sub_1000110C4(&qword_10004E810);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_100017D64(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  uint64_t v21;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_10000ED74(v6, v7);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  sub_10000EE2C(v8, v9);
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v14 = a3[9];
  v15 = (void *)(a1 + v14);
  v16 = (void *)(a2 + v14);
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1, v17);
  v20 = v19(v16, 1, v17);
  if (!(_DWORD)v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    v21 = sub_1000110C4(&qword_10004E810);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_100017ED4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v11 = a3[9];
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = type metadata accessor for URL(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = sub_1000110C4(&qword_10004E810);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_100017FE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  uint64_t v20;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_10000EE2C(v6, v7);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v13 = a3[9];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = type metadata accessor for URL(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  v19 = v18(v15, 1, v16);
  if (!(_DWORD)v10)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = sub_1000110C4(&qword_10004E810);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t sub_100018144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018150);
}

uint64_t sub_100018150(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 254)
  {
    v8 = sub_1000110C4(&qword_10004E810);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(unsigned __int8 *)(a1 + a3[7]);
  if (v10 >= 2)
    return v10 - 1;
  else
    return 0;
}

uint64_t sub_1000181F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000181FC);
}

uint64_t sub_1000181FC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[6];
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + a4[7]) = a2 + 1;
      return result;
    }
    v10 = sub_1000110C4(&qword_10004E810);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[9];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_10001829C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[6];

  v6[0] = (char *)&value witness table for Builtin.Int32 + 64;
  v6[1] = &unk_100037518;
  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v6[2] = *(_QWORD *)(v2 - 8) + 64;
    v6[3] = &unk_100037530;
    v6[4] = (char *)&value witness table for Builtin.Int64 + 64;
    sub_100018350(319);
    if (v5 <= 0x3F)
    {
      v6[5] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 6, v6, a1 + 16);
    }
  }
}

void sub_100018350(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10004E068)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10004E068);
  }
}

void type metadata accessor for SecCSDigestAlgorithm()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10004E0A8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_1000464C8);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10004E0A8);
  }
}

uint64_t sub_1000183F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_100018434()
{
  uint64_t result;

  sub_10001864C();
  result = OS_os_log.init(subsystem:category:)(0x6C7070612E6D6F63, 0xED000073696D2E65, 0x6573616261746164, 0xE800000000000000);
  qword_100051690 = result;
  return result;
}

uint64_t *sub_100018498()
{
  if (qword_10004FDC0 != -1)
    swift_once(&qword_10004FDC0, sub_100018434);
  return &qword_100051690;
}

uint64_t sub_1000184D8()
{
  uint64_t result;

  sub_10001864C();
  result = OS_os_log.init(subsystem:category:)(0x6C7070612E6D6F63, 0xED000073696D2E65, 0x74696B64756F6C63, 0xE800000000000000);
  qword_100051698 = result;
  return result;
}

uint64_t *sub_10001853C()
{
  if (qword_10004FDC8 != -1)
    swift_once(&qword_10004FDC8, sub_1000184D8);
  return &qword_100051698;
}

uint64_t sub_10001857C()
{
  uint64_t result;

  sub_10001864C();
  result = OS_os_log.init(subsystem:category:)(0x6C7070612E6D6F63, 0xED000073696D2E65, 0x775F68636E75616CLL, 0xEF73676E696E7261);
  qword_1000516A0 = result;
  return result;
}

uint64_t *sub_1000185EC()
{
  if (qword_10004FDD0 != -1)
    swift_once(&qword_10004FDD0, sub_10001857C);
  return &qword_1000516A0;
}

uint64_t type metadata accessor for Logger()
{
  return objc_opt_self(_TtC17online_auth_agent6Logger);
}

unint64_t sub_10001864C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004E148;
  if (!qword_10004E148)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004E148);
  }
  return result;
}

uint64_t sub_100018688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a1 == 1634564716 && a2 == 0xE400000000000000;
  if (v4 || (_stringCompareWithSmolCheck(_:_:expecting:)(1634564716, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = (unsigned int *)&enum case for Algorithm.lzma(_:);
  }
  else
  {
    if ((a1 != 1651076218 || a2 != 0xE400000000000000)
      && (_stringCompareWithSmolCheck(_:_:expecting:)(1651076218, 0xE400000000000000, a1, a2, 0) & 1) == 0)
    {
      v14 = type metadata accessor for Algorithm(0);
      v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
      v12 = a3;
      v13 = 1;
      return v11(v12, v13, 1, v14);
    }
    v7 = (unsigned int *)&enum case for Algorithm.zlib(_:);
  }
  v8 = *v7;
  v9 = type metadata accessor for Algorithm(0);
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(a3, v8, v9);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v12 = a3;
  v13 = 0;
  v14 = v9;
  return v11(v12, v13, 1, v14);
}

void sub_10001879C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  void (*v16)(char *, id, uint64_t);
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSString v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t i;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  void (*v48)(char *, uint64_t, uint64_t);
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  _QWORD v58[2];
  uint64_t v59;

  v55 = a2;
  v56 = a3;
  v57 = a1;
  v54 = type metadata accessor for Algorithm(0);
  v52 = *(_QWORD *)(v54 - 8);
  __chkstk_darwin(v54);
  v53 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for FilterOperation(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v46 - v13;
  v15 = sub_100018B94();
  v16 = *(void (**)(char *, id, uint64_t))(v9 + 16);
  v16(v14, v57, v8);
  v17 = v59;
  v18 = sub_100018BD0((uint64_t)v14, (SEL *)&selRef_fileHandleForReadingFromURL_error_);
  if (!v17)
  {
    v48 = (void (*)(char *, uint64_t, uint64_t))v16;
    v49 = v15;
    v50 = v12;
    v51 = v8;
    v57 = v18;
    v59 = v5;
    v19 = v54;
    v47 = v7;
    v20 = (void *)objc_opt_self(NSFileManager);
    v21 = objc_msgSend(v20, "defaultManager");
    v22 = v55;
    URL.path.getter();
    v24 = v23;
    v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    LOBYTE(v24) = objc_msgSend(v21, "fileExistsAtPath:", v25);

    if ((v24 & 1) == 0)
    {
      v26 = objc_msgSend(v20, "defaultManager");
      URL.path.getter();
      v28 = v27;
      v29 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v28);
      objc_msgSend(v26, "createFileAtPath:contents:attributes:", v29, 0, 0);

    }
    v30 = (uint64_t)v50;
    v48(v50, v22, v51);
    v31 = sub_100018BD0(v30, (SEL *)&selRef_fileHandleForWritingToURL_error_);
    v32 = v56;
    v33 = v31;
    v34 = v47;
    (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v47, enum case for FilterOperation.decompress(_:), v4);
    v35 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v53, v32, v19);
    v36 = swift_allocObject(&unk_100046628, 24, 7);
    v37 = v57;
    *(_QWORD *)(v36 + 16) = v57;
    v38 = sub_1000110C4(&qword_10004E158);
    swift_allocObject(v38, *(unsigned int *)(v38 + 48), *(unsigned __int16 *)(v38 + 52));
    v39 = v37;
    v40 = InputFilter.init(_:using:bufferCapacity:readingFrom:)(v34, v35, 0x10000, sub_100018D08, v36);
    v41 = dispatch thunk of InputFilter.readData(ofLength:)(0x10000);
    for (i = v42; i >> 60 != 15; i = v45)
    {
      v58[0] = v41;
      v58[1] = i;
      v44 = sub_100018D34();
      NSFileHandle.write<A>(contentsOf:)(v58, &type metadata for Data, v44);
      sub_10000F2D8(v41, i);
      v41 = dispatch thunk of InputFilter.readData(ofLength:)(0x10000);
    }

    swift_release(v40);
  }
}

unint64_t sub_100018B94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004E150;
  if (!qword_10004E150)
  {
    v1 = objc_opt_self(NSFileHandle);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004E150);
  }
  return result;
}

id sub_100018BD0(uint64_t a1, SEL *a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  id v12;
  id v13;
  uint64_t v14;
  id v16;

  v4 = v2;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  v7 = v6;
  v16 = 0;
  v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(v4), *a2, v6, &v16);

  v9 = v16;
  if (v8)
  {
    v10 = type metadata accessor for URL(0);
    v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
    v12 = v9;
    v11(a1, v10);
  }
  else
  {
    v13 = v16;
    _convertNSErrorToError(_:)(v9);

    swift_willThrow();
    v14 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
  }
  return v8;
}

uint64_t sub_100018CE4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018D08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = NSFileHandle.read(upToCount:)();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

unint64_t sub_100018D34()
{
  unint64_t result;

  result = qword_10004E160;
  if (!qword_10004E160)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10004E160);
  }
  return result;
}

void sub_100018D78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for Algorithm(0);
  __chkstk_darwin(v3);
  v4 = type metadata accessor for FilterOperation(0);
  __chkstk_darwin(v4);
  *(_QWORD *)(swift_allocObject(&unk_100046650, 24, 7) + 16) = 0;
  __asm { BR              X10 }
}

uint64_t sub_100018E50()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t i;
  unint64_t v18;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, enum case for FilterOperation.decompress(_:), v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v8 - 112), v6);
  v9 = (_QWORD *)swift_allocObject(&unk_100046678, 48, 7);
  v9[2] = BYTE6(v0);
  v10 = *(_QWORD *)(v8 - 72);
  v9[3] = v10;
  v9[4] = v2;
  v9[5] = v0;
  v11 = sub_1000110C4(&qword_10004E158);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  swift_retain(v10);
  sub_10000ED74(v2, v0);
  v12 = *(_QWORD *)(v8 - 104);
  v13 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>), _QWORD *))InputFilter.init(_:using:bufferCapacity:readingFrom:))(v4, v3, 0x10000, sub_100019060, v9);
  if (v12)
    return swift_release(v10);
  v14 = v13;
  *(_OWORD *)(v8 - 96) = xmmword_100036FF0;
  v15 = ((uint64_t (*)(uint64_t))dispatch thunk of InputFilter.readData(ofLength:))(0x10000);
  for (i = v16; i >> 60 != 15; i = v18)
  {
    ((void (*)(uint64_t, unint64_t))Data.append(_:))(v15, i);
    sub_10000F2D8(v15, i);
    v15 = ((uint64_t (*)(uint64_t))dispatch thunk of InputFilter.readData(ofLength:))(0x10000);
  }
  swift_release(v10);
  swift_release(v14);
  return *(_QWORD *)(v8 - 96);
}

uint64_t sub_100019024()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100019034()
{
  _QWORD *v0;

  swift_release(v0[3]);
  sub_10000EE2C(v0[4], v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100019060@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14[24];

  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v7 = (_QWORD *)(v6 + 16);
  swift_beginAccess(v6 + 16, v14, 0, 0);
  result = *(_QWORD *)(v6 + 16);
  if (__OFSUB__(v5, result))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v5 - result >= a1)
    v9 = a1;
  else
    v9 = v5 - result;
  if (__OFADD__(result, v9))
    goto LABEL_10;
  if (result + v9 < result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v10 = Data.subdata(in:)();
  v12 = v11;
  result = swift_beginAccess(v6 + 16, &v13, 1, 0);
  if (!__OFADD__(*v7, v9))
  {
    *v7 += v9;
    *a2 = v10;
    a2[1] = v12;
    return result;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100019140()
{
  const __CFURL *v0;
  const __CFURL *v1;
  OSStatus v2;
  const __SecCode *v3;
  OSStatus v4;
  CFDictionaryRef v5;
  id v6;
  const __CFDictionary *v7;
  id v8;
  const __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[24];
  uint64_t v71;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode;

  staticCode = 0;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  v1 = v0;
  v2 = SecStaticCodeCreateWithPath(v0, 0, &staticCode);

  if (v2 || !staticCode)
  {
    v13 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
    v14 = (void *)*sub_1000185EC();
    v15 = sub_1000110C4(&qword_10004DC40);
    v16 = swift_allocObject(v15, 112, 7);
    *(_OWORD *)(v16 + 16) = xmmword_100036CC0;
    *(_QWORD *)(v16 + 56) = &type metadata for Int32;
    *(_QWORD *)(v16 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v16 + 32) = v2;
    v17 = v14;
    v18 = URL.path.getter();
    v20 = v19;
    *(_QWORD *)(v16 + 96) = &type metadata for String;
    *(_QWORD *)(v16 + 104) = sub_100012364();
    *(_QWORD *)(v16 + 72) = v18;
    *(_QWORD *)(v16 + 80) = v20;
    os_log(_:dso:log:_:_:)(v13, &_mh_execute_header, v17, "Unable to create code object (%d) for: %@", 41, 2, v16);

    swift_bridgeObjectRelease(v16);
    v21 = sub_1000197EC();
    v22 = swift_allocError(&type metadata for CodeSignatureError, v21, 0, 0);
    *(_DWORD *)v23 = v2;
    *(_BYTE *)(v23 + 4) = 0;
    swift_willThrow(v22);
LABEL_29:

    return v17;
  }
  information = 0;
  v3 = staticCode;
  v4 = SecCodeCopySigningInformation(v3, 0x21u, &information);
  if (v4 || (v5 = information) == 0)
  {
    v24 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
    v25 = (void *)*sub_1000185EC();
    v26 = sub_1000110C4(&qword_10004DC40);
    v17 = swift_allocObject(v26, 112, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100036CC0;
    *(_QWORD *)(v17 + 56) = &type metadata for Int32;
    *(_QWORD *)(v17 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v17 + 32) = v4;
    v27 = v25;
    v28 = URL.path.getter();
    v30 = v29;
    *(_QWORD *)(v17 + 96) = &type metadata for String;
    *(_QWORD *)(v17 + 104) = sub_100012364();
    *(_QWORD *)(v17 + 72) = v28;
    *(_QWORD *)(v17 + 80) = v30;
    os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v27, "Unable to create signing info (%d) for: %@", 42, 2, v17);

    swift_bridgeObjectRelease(v17);
    v31 = sub_1000197EC();
    v32 = swift_allocError(&type metadata for CodeSignatureError, v31, 0, 0);
    *(_DWORD *)v33 = v4;
    *(_BYTE *)(v33 + 4) = 0;
    swift_willThrow(v32);
LABEL_28:

    goto LABEL_29;
  }
  *(_QWORD *)&v68 = kSecCodeInfoCdHashesFull;
  v6 = kSecCodeInfoCdHashesFull;
  v7 = v5;
  v8 = v6;
  v9 = v7;
  v10 = sub_1000110C4(&qword_10004E170);
  v11 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v68, v10);
  v12 = -[__CFDictionary __swift_objectForKeyedSubscript:](v9, "__swift_objectForKeyedSubscript:", v11);
  swift_unknownObjectRelease(v11);
  if (v12)
  {
    _bridgeAnyObjectToAny(_:)(&v68, v12);
    swift_unknownObjectRelease(v12);
  }
  else
  {
    v68 = 0u;
    v69 = 0u;
  }
  sub_100019830((uint64_t)&v68, (uint64_t)v70);
  if (!v71)
  {

    v39 = sub_100014C74((uint64_t)v70);
LABEL_16:
    v40 = static os_log_type_t.error.getter(v39);
    v41 = (void *)*sub_1000185EC();
    v42 = sub_1000110C4(&qword_10004DC40);
    v17 = swift_allocObject(v42, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100036CA0;
    v43 = v41;
    v44 = URL.path.getter();
    v46 = v45;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_100012364();
    *(_QWORD *)(v17 + 32) = v44;
    *(_QWORD *)(v17 + 40) = v46;
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v43, "Unable to get full cdhash information for: %@", 45, 2, v17);
LABEL_27:

    swift_bridgeObjectRelease(v17);
    v63 = sub_1000197EC();
    v64 = swift_allocError(&type metadata for CodeSignatureError, v63, 0, 0);
    *(_DWORD *)v65 = 0;
    *(_BYTE *)(v65 + 4) = 1;
    swift_willThrow(v64);

    goto LABEL_28;
  }
  v34 = sub_1000110C4(&qword_10004E178);
  if ((swift_dynamicCast(&v67, v70, (char *)&type metadata for Any + 8, v34, 6) & 1) == 0)
  {

    goto LABEL_16;
  }
  v35 = v67;

  v36 = (id)kSecCodeInfoDigestAlgorithm;
  v37 = -[__CFDictionary __swift_objectForKeyedSubscript:](v9, "__swift_objectForKeyedSubscript:", v36);
  if (v37)
  {
    v38 = v37;
    _bridgeAnyObjectToAny(_:)(&v68, v37);
    swift_unknownObjectRelease(v38);
  }
  else
  {
    v68 = 0u;
    v69 = 0u;
  }
  sub_100019830((uint64_t)&v68, (uint64_t)v70);
  if (!v71)
  {

    swift_bridgeObjectRelease(v35);
    v49 = sub_100014C74((uint64_t)v70);
LABEL_25:
    v50 = static os_log_type_t.error.getter(v49);
    v51 = (void *)*sub_1000185EC();
    v52 = sub_1000110C4(&qword_10004DC40);
    v17 = swift_allocObject(v52, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100036CA0;
    v43 = v51;
    v53 = URL.path.getter();
    v55 = v54;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_100012364();
    *(_QWORD *)(v17 + 32) = v53;
    *(_QWORD *)(v17 + 40) = v55;
    os_log(_:dso:log:_:_:)(v50, &_mh_execute_header, v43, "Unable to get best cdhash digest algorithm: %@", 46, 2, v17);
    goto LABEL_27;
  }
  if ((swift_dynamicCast(&v67, v70, (char *)&type metadata for Any + 8, &type metadata for UInt32, 6) & 1) == 0)
  {

    v49 = swift_bridgeObjectRelease(v35);
    goto LABEL_25;
  }
  v17 = v67;

  if (!*(_QWORD *)(v35 + 16) || (v47 = sub_100019878(v17), (v48 & 1) == 0))
  {
    v56 = swift_bridgeObjectRelease(v35);
    v57 = static os_log_type_t.error.getter(v56);
    v58 = (void *)*sub_1000185EC();
    v59 = sub_1000110C4(&qword_10004DC40);
    v17 = swift_allocObject(v59, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100036CA0;
    v43 = v58;
    v60 = URL.path.getter();
    v62 = v61;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_100012364();
    *(_QWORD *)(v17 + 32) = v60;
    *(_QWORD *)(v17 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v43, "Unable to get best cdhash data: %@", 34, 2, v17);
    goto LABEL_27;
  }
  sub_10000ED74(*(_QWORD *)(*(_QWORD *)(v35 + 56) + 16 * v47), *(_QWORD *)(*(_QWORD *)(v35 + 56) + 16 * v47 + 8));

  swift_bridgeObjectRelease(v35);
  return v17;
}

unint64_t sub_1000197EC()
{
  unint64_t result;

  result = qword_10004E168;
  if (!qword_10004E168)
  {
    result = swift_getWitnessTable(&unk_100037580, &type metadata for CodeSignatureError);
    atomic_store(result, (unint64_t *)&qword_10004E168);
  }
  return result;
}

uint64_t sub_100019830(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000110C4(&qword_10004DE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100019878(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:bytes:count:)(*(_QWORD *)(v1 + 40), a1, 4);
  return sub_100019B58(a1, v3);
}

uint64_t initializeBufferWithCopyOfBuffer for CodeSignatureError(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeSignatureError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CodeSignatureError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_10001990C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100019928(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CodeSignatureError()
{
  return &type metadata for CodeSignatureError;
}

uint64_t destroy for CDHashInfo(uint64_t a1)
{
  return sub_10000EE2C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t _s17online_auth_agent10CDHashInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_10000ED74(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for CDHashInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_10000ED74(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  sub_10000EE2C(v5, v6);
  return a1;
}

__n128 initializeWithTake for CDHashInfo(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CDHashInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_10000EE2C(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CDHashInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CDHashInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CDHashInfo()
{
  return &type metadata for CDHashInfo;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_100019B14(a1, &qword_10004E180, (uint64_t)&unk_1000467B0);
}

void sub_100019B14(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

unint64_t sub_100019B58(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_100019BF4(char *a1, char *a2)
{
  return sub_100019C00(*a1, *a2);
}

uint64_t sub_100019C00(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 1702521203;
  else
    v3 = 7107189;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE400000000000000;
  if ((a2 & 1) != 0)
    v5 = 1702521203;
  else
    v5 = 7107189;
  if ((a2 & 1) != 0)
    v6 = 0xE400000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_100019C94()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  if (v1)
    v2 = 1702521203;
  else
    v2 = 7107189;
  if (v1)
    v3 = 0xE400000000000000;
  else
    v3 = 0xE300000000000000;
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100019D04(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 1702521203;
  else
    v2 = 7107189;
  if (*v1)
    v3 = 0xE400000000000000;
  else
    v3 = 0xE300000000000000;
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100019D50(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2)
    v3 = 1702521203;
  else
    v3 = 7107189;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE300000000000000;
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100019DBC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000467F8, v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void sub_100019E18(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 7107189;
  if (*v1)
    v2 = 1702521203;
  v3 = 0xE300000000000000;
  if (*v1)
    v3 = 0xE400000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_100019E48()
{
  _BYTE *v0;

  if (*v0)
    return 1702521203;
  else
    return 7107189;
}

uint64_t sub_100019E74@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;
  char v7;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000467F8, v3);
  result = swift_bridgeObjectRelease(object);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void sub_100019ED4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100019EE0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001B1C4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100019F08(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001B1C4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100019F30(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  sub_100019F84(a1, a2);
  return v5;
}

uint64_t sub_100019F84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSString *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  __int128 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSString v33;
  Class isa;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  id v41;
  void (*v42)(uint64_t, uint64_t);
  id v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  __int128 v55;
  __int128 v56;

  v5 = type metadata accessor for URL(0);
  v53 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v51 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)objc_opt_self(NSFileManager);
  v8 = objc_msgSend(v7, "defaultManager");
  URL.path.getter();
  v10 = v9;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  LOBYTE(v10) = objc_msgSend(v8, "fileExistsAtPath:", v11);

  v50 = a2;
  if ((v10 & 1) == 0)
  {
    *(_QWORD *)&v55 = sub_100015020(a2 >> 3);
    *((_QWORD *)&v55 + 1) = v28;
    sub_10001AF20((uint64_t)&v55);
    v26 = v2;
    v29 = v55;
    v30 = objc_msgSend(v7, "defaultManager");
    URL.path.getter();
    v32 = v31;
    v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v32);
    isa = Data._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v30, "createFileAtPath:contents:attributes:", v33, isa, 0);

    sub_10000EE2C(v29, *((unint64_t *)&v29 + 1));
    v35 = v52;
    v25 = v53;
    goto LABEL_15;
  }
  v12 = objc_msgSend(v7, "defaultManager");
  URL.path.getter();
  v14 = v13;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  *(_QWORD *)&v55 = 0;
  v16 = objc_msgSend(v12, "attributesOfItemAtPath:error:", v15, &v55);

  v17 = (void *)v55;
  if (!v16)
  {
    v36 = (id)v55;
    _convertNSErrorToError(_:)(v17);

    swift_willThrow(v37);
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(a1, v5);
    v35 = v52;
LABEL_21:
    v47 = type metadata accessor for BloomFilterDiskStorage(0);
    swift_deallocPartialClassInstance(v35, v47, *(unsigned int *)(*(_QWORD *)v35 + 48), *(unsigned __int16 *)(*(_QWORD *)v35 + 52));
    return v35;
  }
  type metadata accessor for FileAttributeKey();
  v19 = v18;
  v20 = sub_1000123E4(&qword_10004DE70, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100036F98);
  v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v16, v19, (char *)&type metadata for Any + 8, v20);
  v22 = v17;

  if (*(_QWORD *)(v21 + 16))
  {
    v23 = NSFileSize;
    v24 = sub_100014BF4((uint64_t)v23);
    v25 = v53;
    v26 = v2;
    if ((v27 & 1) != 0)
    {
      sub_100014CB4(*(_QWORD *)(v21 + 56) + 32 * v24, (uint64_t)&v55);
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
    }

  }
  else
  {
    v55 = 0u;
    v56 = 0u;
    v25 = v53;
    v26 = v2;
  }
  v35 = v52;
  swift_bridgeObjectRelease(v21);
  if (!*((_QWORD *)&v56 + 1))
  {
    sub_100014C74((uint64_t)&v55);
LABEL_19:
    if (!v50)
      goto LABEL_15;
LABEL_20:
    v44 = sub_10001556C();
    v45 = swift_allocError(&type metadata for BloomFilterError, v44, 0, 0);
    *(_QWORD *)v46 = 0;
    *(_QWORD *)(v46 + 8) = 0;
    *(_BYTE *)(v46 + 16) = 2;
    swift_willThrow(v45);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(a1, v5);
    goto LABEL_21;
  }
  if ((swift_dynamicCast(&v54, &v55, (char *)&type metadata for Any + 8, &type metadata for UInt64, 6) & 1) == 0)
    goto LABEL_19;
  if (v54 >> 61)
    __break(1u);
  if (v50 != 8 * v54)
    goto LABEL_20;
LABEL_15:
  v38 = v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v39(v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url, a1, v5);
  sub_100018B94();
  v40 = (uint64_t)v51;
  v39((uint64_t)v51, a1, v5);
  v41 = sub_10001A424(v40);
  if (v26)
  {
    v42 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v42(a1, v5);
    v42(v38, v5);
    goto LABEL_21;
  }
  v43 = v41;
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(a1, v5);
  *(_QWORD *)(v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh) = v43;
  *(_QWORD *)(v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) = v50;
  return v35;
}

id sub_10001A424(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  id v11;
  uint64_t v12;
  id v14;

  v2 = v1;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  v5 = v4;
  v14 = 0;
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "fileHandleForUpdatingURL:error:", v4, &v14);

  v7 = v14;
  if (v6)
  {
    v8 = type metadata accessor for URL(0);
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v10 = v7;
    v9(a1, v8);
  }
  else
  {
    v11 = v14;
    _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    v12 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_10001A538(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  sub_10001A584(a1);
  return v3;
}

uint64_t sub_10001A584(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[2];
  char *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  char v36;
  char v37;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v32 = (char *)v31 - v7;
  v8 = sub_1000110C4(&qword_10004E188);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v12 = a1[4];
  v33 = a1;
  sub_1000111AC(a1, v13);
  v14 = sub_10001B1C4();
  v15 = v35;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BloomFilterDiskStorage.CodingKeys, &type metadata for BloomFilterDiskStorage.CodingKeys, v14, v13, v12);
  if (v15)
  {
    v23 = v34;
    v19 = v33;
    v20 = type metadata accessor for BloomFilterDiskStorage(0);
    swift_deallocPartialClassInstance(v23, v20, *(unsigned int *)(*(_QWORD *)v23 + 48), *(unsigned __int16 *)(*(_QWORD *)v23 + 52));
    v30 = v19;
  }
  else
  {
    v35 = v6;
    v16 = v9;
    v37 = 0;
    v17 = sub_1000123E4(&qword_10004E198, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v18 = v32;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v2, &v37, v8, v2, v17);
    v22 = v2;
    v23 = v34;
    v24 = v34 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
    v25 = v18;
    v26 = v22;
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v34 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url, v25, v22);
    v36 = 1;
    v27 = KeyedDecodingContainer.decode(_:forKey:)(&v36, v8);
    v31[0] = v26;
    v31[1] = v24;
    v32 = (char *)v8;
    *(_QWORD *)(v23 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) = v27;
    sub_100018B94();
    v28 = (uint64_t)v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v35, v24, v26);
    v29 = sub_10001A424(v28);
    (*(void (**)(char *, char *))(v16 + 8))(v11, v32);
    *(_QWORD *)(v23 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh) = v29;
    v30 = v33;
  }
  sub_1000111D0(v30);
  return v23;
}

uint64_t sub_10001A83C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  char v18;
  char v19;

  v3 = v1;
  v5 = sub_1000110C4(&qword_10004E1A0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000111AC(a1, v9);
  v11 = sub_10001B1C4();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BloomFilterDiskStorage.CodingKeys, &type metadata for BloomFilterDiskStorage.CodingKeys, v11, v9, v10);
  v12 = v3 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  v19 = 0;
  v13 = type metadata accessor for URL(0);
  v14 = sub_1000123E4(&qword_10004E1A8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v12, &v19, v5, v13, v14);
  if (!v2)
  {
    v15 = *(_QWORD *)(v3 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size);
    v18 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v18, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001A994(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  id v23;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) <= a1)
  {
    v15 = sub_10001556C();
    v13 = swift_allocError(&type metadata for BloomFilterError, v15, 0, 0);
    *(_QWORD *)v16 = a1;
    *(_QWORD *)(v16 + 8) = 0;
    *(_BYTE *)(v16 + 16) = 1;
LABEL_8:
    swift_willThrow(v13);
    return v10 & 1;
  }
  v4 = *(void **)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh);
  v23 = 0;
  v5 = objc_msgSend(v4, "seekToOffset:error:", a1 >> 3, &v23);
  v6 = v23;
  if (!v5)
  {
    v17 = v23;
    _convertNSErrorToError(_:)(v6);

    goto LABEL_8;
  }
  v7 = v23;
  v8 = NSFileHandle.read(upToCount:)(1);
  if (!v2)
  {
    v11 = v9;
    if (v9 >> 60 != 15)
    {
      v19 = v8;
      v20 = ~(_BYTE)a1 & 7;
      sub_100013C74(v8, v9);
      v22 = v21;
      sub_10000F2D8(v19, v11);
      v10 = (v22 >> v20) & 1;
      return v10 & 1;
    }
    v12 = sub_10001556C();
    v13 = swift_allocError(&type metadata for BloomFilterError, v12, 0, 0);
    *(_OWORD *)v14 = xmmword_100037600;
    *(_BYTE *)(v14 + 16) = 0;
    goto LABEL_8;
  }
  return v10 & 1;
}

void sub_10001AB28(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  Class isa;
  id v27;
  uint64_t v28;
  id v29;
  id __src;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) <= a1)
  {
    v15 = sub_10001556C();
    v13 = swift_allocError(&type metadata for BloomFilterError, v15, 0, 0);
    *(_QWORD *)v16 = a1;
    *(_QWORD *)(v16 + 8) = 0;
    *(_BYTE *)(v16 + 16) = 1;
    goto LABEL_8;
  }
  v4 = a1 >> 3;
  v5 = *(void **)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh);
  __src = 0;
  v6 = objc_msgSend(v5, "seekToOffset:error:", a1 >> 3, &__src);
  v7 = __src;
  if (!v6)
  {
    v17 = __src;
    _convertNSErrorToError(_:)(v7);

    goto LABEL_8;
  }
  v8 = __src;
  v9 = NSFileHandle.read(upToCount:)(1);
  if (v2)
    return;
  v11 = v10;
  if (v10 >> 60 == 15)
  {
    v12 = sub_10001556C();
    v13 = swift_allocError(&type metadata for BloomFilterError, v12, 0, 0);
    *(_OWORD *)v14 = xmmword_100037600;
    *(_BYTE *)(v14 + 16) = 0;
LABEL_8:
    swift_willThrow(v13);
    return;
  }
  v18 = v9;
  sub_100013C74(v9, v10);
  v29 = 0;
  __src = (id)(v19 | (1 << (~(_BYTE)a1 & 7)));
  v20 = objc_msgSend(v5, "seekToOffset:error:", v4, &v29);
  v21 = v29;
  if ((v20 & 1) != 0)
  {
    v22 = v29;
    v23 = sub_10000FFB0(&__src, (_BYTE *)&__src + 1);
    v25 = v24 & 0xFFFFFFFFFFFFFFLL;
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000EE2C(v23, v25);
    objc_msgSend(v5, "writeData:", isa);
    sub_10000F2D8(v18, v11);

  }
  else
  {
    v27 = v29;
    _convertNSErrorToError(_:)(v21);

    swift_willThrow(v28);
    sub_10000F2D8(v18, v11);
  }
}

id sub_10001AD60()
{
  id v0;
  void *v1;
  void *v2;
  NSURL *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v9;
  id v10;

  v0 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url);
  v2 = v1;
  URL._bridgeToObjectiveC()(v3);
  v5 = v4;
  v10 = 0;
  v6 = objc_msgSend(v0, "copyItemAtURL:toURL:error:", v2, v4, &v10);

  v7 = v10;
  if (v6)
    return v10;
  v9 = v10;
  _convertNSErrorToError(_:)(v7);

  return (id)swift_willThrow();
}

uint64_t sub_10001AE6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  v2 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10001AECC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_10001AEF8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

void sub_10001AF20(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_10001AF7C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_10001B108(int *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  size_t v12;

  Data.InlineSlice.ensureUniqueReference()();
  v4 = *a1;
  v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = __DataStorage._bytes.getter();
  if (!v6)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v7 = v6;
  v8 = __DataStorage._offset.getter();
  v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v10 = v5 - v4;
  v11 = __DataStorage._length.getter();
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  memset((void *)(v7 + v9), a2, v12);
}

uint64_t type metadata accessor for BloomFilterDiskStorage(uint64_t a1)
{
  uint64_t result;

  result = qword_100050260;
  if (!qword_100050260)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BloomFilterDiskStorage);
  return result;
}

unint64_t sub_10001B1C4()
{
  unint64_t result;

  result = qword_10004E190;
  if (!qword_10004E190)
  {
    result = swift_getWitnessTable(&unk_1000376BC, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E190);
  }
  return result;
}

unint64_t sub_10001B20C()
{
  unint64_t result;

  result = qword_10004E1B0;
  if (!qword_10004E1B0)
  {
    result = swift_getWitnessTable(&unk_10003761C, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E1B0);
  }
  return result;
}

unint64_t sub_10001B254()
{
  unint64_t result;

  result = qword_10004E1B8;
  if (!qword_10004E1B8)
  {
    result = swift_getWitnessTable(&unk_100037734, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E1B8);
  }
  return result;
}

unint64_t sub_10001B29C()
{
  unint64_t result;

  result = qword_10004E1C0;
  if (!qword_10004E1C0)
  {
    result = swift_getWitnessTable(&unk_10003770C, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E1C0);
  }
  return result;
}

uint64_t sub_10001B2E0()
{
  return type metadata accessor for BloomFilterDiskStorage(0);
}

uint64_t sub_10001B2E8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BloomFilterDiskStorage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10001B3BC + 4 * byte_100037615[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001B3F0 + 4 * byte_100037610[v4]))();
}

uint64_t sub_10001B3F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B3F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001B400);
  return result;
}

uint64_t sub_10001B40C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001B414);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001B418(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B420(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterDiskStorage.CodingKeys()
{
  return &type metadata for BloomFilterDiskStorage.CodingKeys;
}

uint64_t sub_10001B43C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_allocObject(v1, 32, 7);
  *(_BYTE *)(result + 16) = 1;
  *(_QWORD *)(result + 24) = a1;
  return result;
}

uint64_t sub_10001B474(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = swift_allocObject(v2, 32, 7);
  sub_10001B4C8(a1, a2);
  return v5;
}

void sub_10001B4C8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_10001B514()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  if (!BYTE6(v2))
  {
    v5 = 1;
    goto LABEL_13;
  }
  if (((uint64_t (*)(_QWORD, uint64_t, unint64_t))Data.subscript.getter)(0, v3, v2) != 1)
  {
    v5 = 0;
    goto LABEL_13;
  }
  if (v1)
  {
    if (v1 == 1)
    {
      LODWORD(v4) = HIDWORD(v3) - v3;
      if (!__OFSUB__(HIDWORD(v3), (_DWORD)v3))
      {
        v4 = (int)v4;
        goto LABEL_11;
      }
      __break(1u);
LABEL_15:
      __break(1u);
      JUMPOUT(0x10001B718);
    }
    v7 = *(_QWORD *)(v3 + 16);
    v6 = *(_QWORD *)(v3 + 24);
    v8 = __OFSUB__(v6, v7);
    v4 = v6 - v7;
    if (v8)
      goto LABEL_15;
  }
  else
  {
    v4 = BYTE6(v2);
  }
LABEL_11:
  v5 = 1;
  if (v4 == 9)
  {
    *(_BYTE *)(v0 + 16) = 1;
    v9 = sub_100016318(1, 8, v3, v2);
    sub_10001B7B8(v9, v10);
    __asm { BR              X10 }
  }
LABEL_13:
  v12 = sub_10001B754();
  v13 = swift_allocError(&type metadata for LaunchWarningMarkError, v12, 0, 0);
  *v14 = v5;
  swift_willThrow(v13);
  sub_10000EE2C(v3, v2);
  v15 = type metadata accessor for LaunchWarningMark();
  swift_deallocPartialClassInstance(v0, v15, 32, 7);
  return v0;
}

unint64_t sub_10001B754()
{
  unint64_t result;

  result = qword_10004E2A0;
  if (!qword_10004E2A0)
  {
    result = swift_getWitnessTable(&unk_100037864, &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_10004E2A0);
  }
  return result;
}

uint64_t type metadata accessor for LaunchWarningMark()
{
  return objc_opt_self(_TtC17online_auth_agent17LaunchWarningMark);
}

void sub_10001B7B8(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[5];

  v3[3] = &type metadata for Data;
  v3[4] = &protocol witness table for Data;
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_10001B81C
     + *((int *)qword_10001BA50 + (sub_1000111AC(v3, (uint64_t)&type metadata for Data)[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_10001B82C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_10000ED74(v1, v0);
  sub_100016AFC(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_10000EE2C(v1, v0);
  v4 = v12;
  sub_1000111D0(&v13);
  return v4;
}

uint64_t sub_10001BA60(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = &type metadata for UnsafeRawBufferPointer;
  v8[4] = &protocol witness table for UnsafeRawBufferPointer;
  v8[0] = a1;
  v8[1] = a2;
  v2 = sub_1000111AC(v8, (uint64_t)&type metadata for UnsafeRawBufferPointer);
  v3 = (_BYTE *)*v2;
  if (*v2 && (v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = sub_10000FFB0(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = sub_100016E58((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      v6 = sub_100016ED0((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    v6 = 0;
  }
  sub_1000111D0(v8);
  return v6;
}

uint64_t sub_10001BB18()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  __int128 v6;

  v6 = xmmword_1000377E0;
  v5 = *(_QWORD *)(v0 + 24);
  v1 = sub_10001BA60((uint64_t)&v5, (uint64_t)&v6);
  v3 = v2;
  Data.append(_:)();
  sub_10000EE2C(v1, v3);
  return v6;
}

uint64_t sub_10001BBB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  result = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
  if (!v1)
  {
    v4 = result;
    v5 = v3;
    sub_100013E18(0xD000000000000015, 0x800000010003A610, result, v3);
    return sub_10000EE2C(v4, v5);
  }
  return result;
}

uint64_t sub_10001BC40()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 32, 7);
}

unint64_t sub_10001BC54()
{
  unint64_t result;

  result = qword_10004E2A8;
  if (!qword_10004E2A8)
  {
    result = swift_getWitnessTable(&unk_1000377FC, &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_10004E2A8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningMarkError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10001BCE4 + 4 * byte_1000377F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001BD18 + 4 * byte_1000377F0[v4]))();
}

uint64_t sub_10001BD18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001BD20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001BD28);
  return result;
}

uint64_t sub_10001BD34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001BD3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001BD40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001BD48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningMarkError()
{
  return &type metadata for LaunchWarningMarkError;
}

BOOL sub_10001BD64(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_10001BD74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v17;

  v17 = swift_allocObject(v8, 80, 7);
  sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, a8);
  return v17;
}

_QWORD *sub_10001BE10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v18;
  uint64_t v19;
  uint64_t (*v20)(_QWORD, unint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v10 = v9;
  v11 = v8;
  v11[2] = a7;
  v11[3] = a8;
  v11[5] = a1;
  v11[4] = *(_QWORD *)(a1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size);
  v11[8] = a2;
  v11[9] = a3;
  type metadata accessor for BloomFilterAlgorithm();
  swift_retain(a1);
  sub_10000ED74(a2, a3);
  v18 = sub_1000156B8(a4, a5);
  if (!v9)
  {
    v11[6] = v18;
    v20 = (uint64_t (*)(_QWORD, unint64_t))v18[4];
    v19 = v18[5];
    swift_retain(v19);
    v21 = v20(0, 0xC000000000000000);
    swift_release(v19);
    v22 = *(_QWORD *)(v21 + 16);
    swift_bridgeObjectRelease(v21);
    if (a6 >= 1 && v22 >= a6)
    {
      sub_10000EE2C(a2, a3);
      swift_release(a1);
      v11[7] = a6;
      return v11;
    }
    v23 = sub_10001556C();
    v24 = swift_allocError(&type metadata for BloomFilterError, v23, 0, 0);
    *(_OWORD *)v25 = xmmword_100037900;
    *(_BYTE *)(v25 + 16) = 2;
    swift_willThrow(v24);
  }
  sub_10000EE2C(a2, a3);
  swift_release(a1);
  swift_bridgeObjectRelease(v11[3]);
  swift_release(v11[5]);
  if (!v10)
    swift_release(v11[6]);
  sub_10000EE2C(v11[8], v11[9]);
  v26 = type metadata accessor for BloomFilter();
  swift_deallocPartialClassInstance(v11, v26, 80, 7);
  return v11;
}

uint64_t type metadata accessor for BloomFilter()
{
  return objc_opt_self(_TtC17online_auth_agent11BloomFilter);
}

void sub_10001BFE0(char *a1)
{
  sub_10001BFEC(*a1);
}

void sub_10001BFEC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10001C02C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10001C0B4 + 4 * byte_100037922[a2]))(0x656761726F7473);
}

uint64_t sub_10001C0B4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656761726F7473 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x656761726F7473, 0xE700000000000000, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE700000000000000);
  return v2 & 1;
}

void sub_10001C18C()
{
  char *v0;

  sub_10001C194(*v0);
}

void sub_10001C194(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_10001C1DC()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x656761726F7473, 0xE700000000000000);
  swift_bridgeObjectRelease(0xE700000000000000);
  return Hasher._finalize()();
}

void sub_10001C270()
{
  __asm { BR              X10 }
}

uint64_t sub_10001C2A4(uint64_t a1)
{
  String.hash(into:)(a1, 0x656761726F7473, 0xE700000000000000);
  return swift_bridgeObjectRelease(0xE700000000000000);
}

void sub_10001C324(uint64_t a1)
{
  char *v1;

  sub_10001C32C(a1, *v1);
}

void sub_10001C32C(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_10001C370()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x656761726F7473, 0xE700000000000000);
  swift_bridgeObjectRelease(0xE700000000000000);
  return Hasher._finalize()();
}

unint64_t sub_10001C404@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001CFD0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001C430()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_10001C458 + 4 * byte_10003793A[*v0]))();
}

void sub_10001C458(_QWORD *a1@<X8>)
{
  *a1 = 0x656761726F7473;
  a1[1] = 0xE700000000000000;
}

void sub_10001C474(_QWORD *a1@<X8>)
{
  *a1 = 0x687469726F676C61;
  a1[1] = 0xE90000000000006DLL;
}

void sub_10001C494(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "bitsPerEntry");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_10001C4B8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1953259891;
  a1[1] = v1;
}

void sub_10001C4C8(_QWORD *a1@<X8>)
{
  *a1 = 25705;
  a1[1] = 0xE200000000000000;
}

uint64_t sub_10001C4D8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10001C500 + 4 * byte_100037940[*v0]))(1702521203, 0xE400000000000000);
}

uint64_t sub_10001C500()
{
  return 0x656761726F7473;
}

uint64_t sub_10001C518()
{
  return 0x687469726F676C61;
}

uint64_t sub_10001C534()
{
  return 0x4572655073746962;
}

uint64_t sub_10001C554()
{
  return 1953259891;
}

uint64_t sub_10001C560()
{
  return 25705;
}

unint64_t sub_10001C56C@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001CFD0(a1);
  *a2 = result;
  return result;
}

void sub_10001C590(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10001C59C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001D018();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C5C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001D018();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C5EC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject(v1, 80, 7);
  sub_10001C638(a1);
  return v3;
}

uint64_t sub_10001C638(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  char v21;

  v3 = v1;
  v5 = sub_1000110C4(&qword_10004E370);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000111AC(a1, v9);
  v11 = sub_10001D018();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BloomFilter.CodingKeys, &type metadata for BloomFilter.CodingKeys, v11, v9, v10);
  if (v2)
  {
    v13 = type metadata accessor for BloomFilter();
    swift_deallocPartialClassInstance(v1, v13, 80, 7);
  }
  else
  {
    LOBYTE(v20) = 0;
    *(_QWORD *)(v1 + 32) = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5);
    LOBYTE(v20) = 3;
    *(_QWORD *)(v1 + 56) = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5);
    v21 = 4;
    v12 = sub_10001D05C();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v21, v5, &type metadata for Data, v12);
    *(_OWORD *)(v1 + 64) = v20;
    LOBYTE(v20) = 5;
    *(_QWORD *)(v1 + 16) = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5);
    *(_QWORD *)(v1 + 24) = v15;
    v16 = type metadata accessor for BloomFilterAlgorithm();
    v21 = 2;
    v17 = sub_1000123E4(&qword_10004E388, (uint64_t (*)(uint64_t))type metadata accessor for BloomFilterAlgorithm, (uint64_t)&unk_1000371AC);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v16, &v21, v5, v16, v17);
    *(_QWORD *)(v3 + 48) = v20;
    v18 = type metadata accessor for BloomFilterDiskStorage(0);
    v21 = 1;
    v19 = sub_1000123E4(&qword_10004E390, type metadata accessor for BloomFilterDiskStorage, (uint64_t)&unk_10003775C);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v18, &v21, v5, v18, v19);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)(v3 + 40) = v20;
  }
  sub_1000111D0(a1);
  return v3;
}

uint64_t sub_10001C92C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  __int128 v24;

  v3 = v1;
  v5 = sub_1000110C4(&qword_10004E398);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000111AC(a1, v9);
  v11 = sub_10001D018();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BloomFilter.CodingKeys, &type metadata for BloomFilter.CodingKeys, v11, v9, v10);
  v12 = *(_QWORD *)(v3 + 32);
  LOBYTE(v24) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, &v24, v5);
  if (!v2)
  {
    v13 = *(_QWORD *)(v3 + 56);
    LOBYTE(v24) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v13, &v24, v5);
    v24 = *(_OWORD *)(v3 + 64);
    v23 = 4;
    v14 = sub_10001D0A0();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v5, &type metadata for Data, v14);
    v15 = *(_QWORD *)(v3 + 16);
    v16 = *(_QWORD *)(v3 + 24);
    LOBYTE(v24) = 5;
    KeyedEncodingContainer.encode(_:forKey:)(v15, v16);
    *(_QWORD *)&v24 = *(_QWORD *)(v3 + 48);
    v23 = 2;
    v17 = type metadata accessor for BloomFilterAlgorithm();
    v18 = sub_1000123E4(&qword_10004E3A8, (uint64_t (*)(uint64_t))type metadata accessor for BloomFilterAlgorithm, (uint64_t)&unk_1000371D4);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v5, v17, v18);
    *(_QWORD *)&v24 = *(_QWORD *)(v3 + 40);
    v23 = 1;
    v19 = type metadata accessor for BloomFilterDiskStorage(0);
    v20 = sub_1000123E4(&qword_10004E3B0, type metadata accessor for BloomFilterDiskStorage, (uint64_t)&unk_100037784);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v5, v19, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001CB68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(v2 + 72);
  sub_10000ED74(v6, v5);
  sub_10001B7B8(v6, v5);
  v9 = v7;
  Data.append(_:)(a1, a2);
  return v9;
}

char *sub_10001CBCC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, unint64_t);
  uint64_t v8;
  int64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;

  v1 = (uint64_t)v0;
  v2 = (*(uint64_t (**)(void))(*v0 + 152))();
  v4 = v3;
  v5 = v0[6];
  v7 = *(uint64_t (**)(uint64_t, unint64_t))(v5 + 32);
  v6 = *(_QWORD *)(v5 + 40);
  swift_retain(v6);
  v8 = v7(v2, v4);
  swift_release(v6);
  v9 = sub_10001CCAC(*(_QWORD *)(v1 + 56), v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_retain(v1);
  v16 = sub_10001D0E4(v11, v13, v15, v1);
  swift_release(v1);
  sub_10000EE2C(v2, v4);
  swift_unknownObjectRelease(v9);
  return v16;
}

int64_t sub_10001CCAC(int64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= result)
      v3 = result;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (!result)
      v3 = 0;
    if (v2 >= v3)
      return a2;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001CCF0()
{
  _QWORD **v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  int v8;
  _BOOL4 v10;
  char v11;

  result = ((uint64_t (*)(void))(*v0)[20])();
  if (!v1)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
    {
      v5 = 0;
      v6 = *(uint64_t (**)(_QWORD))(*v0[5] + 128);
      v7 = v4 - 1;
      do
      {
        v8 = v6(*(_QWORD *)(v3 + 8 * v5 + 32));
        v10 = v7 != v5++;
      }
      while ((v8 & v10 & 1) != 0);
      v11 = v8 ^ 1;
    }
    else
    {
      v11 = 0;
    }
    swift_bridgeObjectRelease(v3);
    return v11 & 1;
  }
  return result;
}

uint64_t sub_10001CDA4()
{
  _QWORD **v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD);

  result = ((uint64_t (*)(void))(*v0)[20])();
  if (!v1)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
    {
      v5 = 0;
      v6 = *(void (**)(_QWORD))(*v0[5] + 136);
      do
        v6(*(_QWORD *)(v3 + 8 * v5++ + 32));
      while (v4 != v5);
    }
    return swift_bridgeObjectRelease(v3);
  }
  return result;
}

uint64_t sub_10001CE2C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[5]);
  swift_release(v0[6]);
  sub_10000EE2C(v0[8], v0[9]);
  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t sub_10001CE68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 136))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_10001CE94()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 144))();
}

char *sub_10001CEBC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10001CED8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_10001CED8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000110C4(&qword_10004DF00);
    v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8])
      memmove(v14, v15, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v8);
  }
  swift_release(a4);
  return v11;
}

unint64_t sub_10001CFD0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100046A98, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 6)
    return 6;
  else
    return v3;
}

unint64_t sub_10001D018()
{
  unint64_t result;

  result = qword_10004E378;
  if (!qword_10004E378)
  {
    result = swift_getWitnessTable(&unk_100037AA4, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E378);
  }
  return result;
}

unint64_t sub_10001D05C()
{
  unint64_t result;

  result = qword_10004E380;
  if (!qword_10004E380)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10004E380);
  }
  return result;
}

unint64_t sub_10001D0A0()
{
  unint64_t result;

  result = qword_10004E3A0;
  if (!qword_10004E3A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10004E3A0);
  }
  return result;
}

char *sub_10001D0E4(char *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v17;

  v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
    goto LABEL_15;
  v5 = result;
  result = (char *)&_swiftEmptyArrayStorage;
  if (v4)
  {
    v15 = a3 >> 1;
    result = sub_10001CEBC(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    v7 = *(_QWORD *)(a4 + 32);
    if (!v7)
    {
LABEL_17:
      __break(1u);
      return result;
    }
    v8 = 0;
    result = (char *)&_swiftEmptyArrayStorage;
    v10 = v15;
    v9 = a2;
    while (1)
    {
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
        break;
      if (v9 + v8 >= v10 || v8 >= v4)
        goto LABEL_14;
      v12 = *(_QWORD *)&v5[8 * a2 + 8 * v8];
      v17 = result;
      v14 = *((_QWORD *)result + 2);
      v13 = *((_QWORD *)result + 3);
      if (v14 >= v13 >> 1)
      {
        sub_10001CEBC((char *)(v13 > 1), v14 + 1, 1);
        v10 = v15;
        v9 = a2;
        result = v17;
      }
      *((_QWORD *)result + 2) = v14 + 1;
      *(_QWORD *)&result[8 * v14 + 32] = v12 % v7;
      ++v8;
      if (v11 == v4)
        return result;
    }
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

unint64_t sub_10001D220()
{
  unint64_t result;

  result = qword_10004E3B8;
  if (!qword_10004E3B8)
  {
    result = swift_getWitnessTable(&unk_10003799C, &type metadata for BloomFilterResult);
    atomic_store(result, (unint64_t *)&qword_10004E3B8);
  }
  return result;
}

unint64_t sub_10001D268()
{
  unint64_t result;

  result = qword_10004E3C0;
  if (!qword_10004E3C0)
  {
    result = swift_getWitnessTable(&unk_100037A04, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E3C0);
  }
  return result;
}

unint64_t sub_10001D2B0()
{
  unint64_t result;

  result = qword_10004E3C8;
  if (!qword_10004E3C8)
  {
    result = swift_getWitnessTable(&unk_100037B1C, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E3C8);
  }
  return result;
}

unint64_t sub_10001D2F8()
{
  unint64_t result;

  result = qword_10004E3D0;
  if (!qword_10004E3D0)
  {
    result = swift_getWitnessTable(&unk_100037AF4, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E3D0);
  }
  return result;
}

uint64_t sub_10001D340(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for BloomFilterError(uint64_t a1)
{
  return sub_10001D364(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10001D364(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t _s17online_auth_agent16BloomFilterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10001D340(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for BloomFilterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10001D340(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10001D364(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for BloomFilterError(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BloomFilterError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10001D364(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilterError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10001D4F8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_10001D510(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterError()
{
  return &type metadata for BloomFilterError;
}

uint64_t storeEnumTagSinglePayload for BloomFilterResult(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10001D584 + 4 * byte_10003794B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001D5B8 + 4 * byte_100037946[v4]))();
}

uint64_t sub_10001D5B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D5C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001D5C8);
  return result;
}

uint64_t sub_10001D5D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001D5DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001D5E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D5E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterResult()
{
  return &type metadata for BloomFilterResult;
}

uint64_t getEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_10001D6E0 + 4 * byte_100037955[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10001D714 + 4 * byte_100037950[v4]))();
}

uint64_t sub_10001D714(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D71C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001D724);
  return result;
}

uint64_t sub_10001D730(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001D738);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_10001D73C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D744(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10001D750(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.CodingKeys()
{
  return &type metadata for BloomFilter.CodingKeys;
}

uint64_t sub_10001D768@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  NSString v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;

  v4 = *((_QWORD *)sub_100016F50() + 1);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v6 = objc_msgSend(a1, "readSetting:", v5);

  if (v6)
  {
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v8 = v7;

  }
  else
  {
    v8 = 0x800000010003A6D0;
    v28 = 0xD00000000000001ELL;
  }
  swift_bridgeObjectRetain(v8);
  v9 = *((_QWORD *)sub_100016F5C() + 1);
  swift_bridgeObjectRetain(v9);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v11 = objc_msgSend(a1, "readSetting:", v10);

  if (v11)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v14 = v13;

    if (v12 == 0x786F62646E6173 && v14 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease(0xE700000000000000);
      v15 = 2;
    }
    else
    {
      v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, 0x786F62646E6173, 0xE700000000000000, 0);
      swift_bridgeObjectRelease(v14);
      if ((v16 & 1) != 0)
        v15 = 2;
      else
        v15 = 1;
    }
  }
  else
  {
    v15 = 1;
  }
  v17 = sub_100016F68();
  if (v18)
    v19 = v17;
  else
    v19 = 0xD00000000000001ELL;
  if (v18)
    v20 = v18;
  else
    v20 = 0x800000010003A6F0;
  swift_bridgeObjectRetain(v20);
  v21 = sub_100017204();
  v23 = v22;
  swift_bridgeObjectRetain(v22);
  v24 = sub_100017014();
  v26 = v25;

  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v20);
  result = swift_bridgeObjectRelease(v8);
  *a2 = v28;
  a2[1] = v8;
  a2[2] = v15;
  a2[3] = v19;
  a2[4] = v20;
  a2[5] = v21;
  a2[6] = v23;
  a2[7] = v24;
  a2[8] = v26;
  return result;
}

void sub_10001D998(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSString v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSString v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSString v18;
  uint64_t v19;
  id v20;
  NSString v21;
  id v22;
  id v23;
  id v24;
  _BYTE v25[16];
  uint64_t v26;
  void *v27;

  v4 = a1[1];
  v5 = a1[2];
  v6 = objc_allocWithZone((Class)CKContainerID);
  swift_bridgeObjectRetain(v4);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v8 = objc_msgSend(v6, "initWithContainerIdentifier:environment:", v7, v5);

  v9 = objc_msgSend(objc_allocWithZone((Class)CKContainer), "initWithContainerID:", v8);
  v10 = objc_msgSend(v9, "publicCloudDatabase");
  v11 = a1[4];
  v12 = objc_allocWithZone((Class)CKRecordZone);
  v24 = v10;
  swift_bridgeObjectRetain(v11);
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v14 = objc_msgSend(v12, "initWithZoneName:", v13);

  sub_10001DBE8((uint64_t)(a1 + 5), (uint64_t)v25);
  sub_10001DBE8((uint64_t)v25, (uint64_t)&v26);
  v15 = v27;
  if (!v27)
  {
    v23 = v14;
    v19 = a1[8];
    if (v19)
      goto LABEL_3;
LABEL_5:

    sub_10001DC30(a1);
    v22 = 0;
    goto LABEL_6;
  }
  v16 = objc_allocWithZone((Class)CKRecordZone);
  v17 = v14;
  sub_10001DC84((uint64_t)v25);
  v18 = String._bridgeToObjectiveC()();
  sub_10001DCAC((uint64_t)v25);
  v15 = objc_msgSend(v16, "initWithZoneName:", v18);

  v19 = a1[8];
  if (!v19)
    goto LABEL_5;
LABEL_3:
  swift_bridgeObjectRetain(v19);
  sub_10001DC30(a1);
  v20 = objc_allocWithZone((Class)CKRecordZone);
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  v22 = objc_msgSend(v20, "initWithZoneName:", v21);

LABEL_6:
  *a2 = v9;
  a2[1] = v24;
  a2[2] = v14;
  a2[3] = v22;
  a2[4] = v15;
}

uint64_t sub_10001DBE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000110C4(&qword_10004E4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_10001DC30(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[6];
  v4 = a1[8];
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_10001DC84(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_10001DCAC(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t destroy for CloudKitConfiguration(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(a1[6]);
  return swift_bridgeObjectRelease(a1[8]);
}

uint64_t initializeWithCopy for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v4;
  v7 = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v6;
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v8;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

_QWORD *assignWithCopy for CloudKitConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  a1[3] = a2[3];
  v6 = a2[4];
  v7 = a1[4];
  a1[4] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[5] = a2[5];
  v8 = a2[6];
  v9 = a1[6];
  a1[6] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[7] = a2[7];
  v10 = a2[8];
  v11 = a1[8];
  a1[8] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudKitConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudKitConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudKitConfiguration()
{
  return &type metadata for CloudKitConfiguration;
}

void destroy for CloudKitRuntime(id *a1)
{

}

_QWORD *initializeWithCopy for CloudKitRuntime(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  return a1;
}

uint64_t assignWithCopy for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 16);
  v11 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v10;

  v13 = *(void **)(a1 + 24);
  v14 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v14;
  v15 = v14;

  v16 = *(void **)(a1 + 32);
  v17 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v17;
  v18 = v17;

  return a1;
}

__n128 initializeWithTake for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CloudKitRuntime(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudKitRuntime(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudKitRuntime()
{
  return &type metadata for CloudKitRuntime;
}

void type metadata accessor for CKContainerEnvironment()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10004E4D8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100046F20);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10004E4D8);
  }
}

Swift::Int sub_10001E200()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10001E240()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_10001E264(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_10001E2A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(uint64_t);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v46 = a2;
  v3 = sub_1000110C4(&qword_10004E810);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v44 - v7;
  v9 = type metadata accessor for Date(0);
  v49 = *(_QWORD *)(v9 - 8);
  v50 = v9;
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v44 - v13;
  v15 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160);
  v16 = v15(0);
  v47 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 128))(1);
  v48 = v17;
  v18 = v15(2);
  v19 = v15(3);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 144))(4);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 192))(5);
  if ((v16 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(v16))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v22 = result;
  v23 = v21;
  v24 = sub_100017324(v18);
  if (v24 == 2)
  {
    v25 = swift_bridgeObjectRelease(v23);
    v26 = static os_log_type_t.error.getter(v25);
    v27 = (void *)*sub_100018498();
    v28 = sub_1000110C4(&qword_10004DC40);
    v29 = swift_allocObject(v28, 72, 7);
    *(_OWORD *)(v29 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v29 + 56) = &type metadata for Int64;
    *(_QWORD *)(v29 + 64) = &protocol witness table for Int64;
    *(_QWORD *)(v29 + 32) = v18;
    v30 = v27;
    os_log(_:dso:log:_:_:)(v26, &_mh_execute_header, v30, "Invalid reason in database: %lld", v44);

    swift_bridgeObjectRelease(v29);
    v51 = v18;
    v31 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
    v33 = v32;
    v34 = sub_1000102EC();
    v35 = swift_allocError(&type metadata for DBError, v34, 0, 0);
    *(_OWORD *)v36 = xmmword_100037C70;
    *(_QWORD *)(v36 + 16) = v31;
    *(_QWORD *)(v36 + 24) = v33;
    *(_BYTE *)(v36 + 32) = 1;
    swift_willThrow(v35);
    sub_10000EE2C(v47, v48);
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v14, v50);
  }
  else
  {
    v45 = v24 & 1;
    v37 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v8, 1, 1, v37);
    if (v23)
    {
      URL.init(string:)(v22, v23);
      swift_bridgeObjectRelease(v23);
      sub_100020234((uint64_t)v8, &qword_10004E810);
      sub_100017728((uint64_t)v6, (uint64_t)v8);
    }
    v39 = v49;
    v38 = v50;
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v12, v14, v50);
    v43 = nullsub_1(v19, v40, v41, v42);
    sub_10001E9EC((uint64_t)v8, (uint64_t)v6, &qword_10004E810);
    sub_10001768C(v16, v47, v48, (uint64_t)v12, v45, v43, (uint64_t)v6, v46);
    sub_100020234((uint64_t)v8, &qword_10004E810);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v14, v38);
  }
}

uint64_t _s18LaunchWarningEntryVMa(uint64_t a1)
{
  uint64_t result;

  result = qword_100050AF0;
  if (!qword_100050AF0)
    return swift_getSingletonMetadata(a1, &_s18LaunchWarningEntryVMn);
  return result;
}

uint64_t sub_10001E654(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v4 = sub_1000110C4(&qword_10004E810);
  __chkstk_darwin(v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 152);
  v7(*a2, 1);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)a1 + 120))(*((_QWORD *)a2 + 1), *((_QWORD *)a2 + 2), 2);
  v8 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v9 = sub_10001733C(*((_BYTE *)a2 + v8[7]));
  v7(v9, 3);
  v7(*(_QWORD *)((char *)a2 + v8[8]), 4);
  v7(0, 5);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)a1 + 136))((char *)a2 + v8[6], 6);
  sub_10001E9EC((uint64_t)a2 + v8[9], (uint64_t)v6, &qword_10004E810);
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_100020234((uint64_t)v6, &qword_10004E810);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = URL.absoluteString.getter();
    v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 184))(v12, v13, 7);
  return swift_bridgeObjectRelease(v13);
}

uint64_t sub_10001E7EC@<X0>(int a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  _QWORD v18[5];

  v7 = sub_1000110C4(&qword_10004E4E0);
  v8 = swift_allocBox(v7);
  v10 = v9;
  v11 = _s18LaunchWarningEntryVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(87);
  v12._countAndFlagsBits = 0x205443454C4553;
  v12._object = (void *)0xE700000000000000;
  String.append(_:)(v12);
  v13._object = (void *)0x800000010003A710;
  v13._countAndFlagsBits = 0xD000000000000035;
  String.append(_:)(v13);
  v14._countAndFlagsBits = 0xD00000000000004ELL;
  v14._object = (void *)0x800000010003A810;
  String.append(_:)(v14);
  v15 = swift_allocObject(&unk_100046F40, 40, 7);
  *(_DWORD *)(v15 + 16) = a1;
  *(_QWORD *)(v15 + 24) = a2;
  *(_QWORD *)(v15 + 32) = a3;
  sub_10000ED74(a2, a3);
  swift_retain(v8);
  sub_10000FAA8(0, 0xE000000000000000, (uint64_t)sub_10001E9D0, v15, (uint64_t)sub_10001E9D4, v8);
  swift_bridgeObjectRelease(0xE000000000000000);
  swift_release(v15);
  if (v18[4])
    return swift_release_n(v8, 2);
  swift_release(v8);
  swift_beginAccess(v10, v18, 0, 0);
  sub_10001E9EC(v10, a4, &qword_10004E4E0);
  return swift_release(v8);
}

uint64_t sub_10001E9D4(uint64_t a1)
{
  uint64_t v1;

  return sub_10001EC18(a1, v1);
}

uint64_t sub_10001E9EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000110C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001EA30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  _QWORD v14[3];

  v5 = sub_1000110C4(&qword_10004E4E0);
  v6 = swift_allocBox(v5);
  v8 = v7;
  v9 = _s18LaunchWarningEntryVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(62);
  v10._countAndFlagsBits = 0x205443454C4553;
  v10._object = (void *)0xE700000000000000;
  String.append(_:)(v10);
  v11._object = (void *)0x800000010003A710;
  v11._countAndFlagsBits = 0xD000000000000035;
  String.append(_:)(v11);
  v12._object = (void *)0x800000010003A860;
  v12._countAndFlagsBits = 0xD000000000000035;
  String.append(_:)(v12);
  swift_retain(a1);
  swift_retain(v6);
  sub_10000FAA8(0, 0xE000000000000000, (uint64_t)sub_10001EBDC, a1, (uint64_t)sub_10001E9D4, v6);
  swift_bridgeObjectRelease(0xE000000000000000);
  swift_release(a1);
  if (v2)
    return swift_release_n(v6, 2);
  swift_release(v6);
  swift_beginAccess(v8, v14, 0, 0);
  sub_10001E9EC(v8, a2, &qword_10004E4E0);
  return swift_release(v6);
}

uint64_t sub_10001EBDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = *(_QWORD *)(v1 + 24);
  if ((result & 0x8000000000000000) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)a1 + 152))();
  __break(1u);
  return result;
}

uint64_t sub_10001EC18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v17[24];

  v5 = sub_1000110C4(&qword_10004E4E0);
  __chkstk_darwin(v5);
  v7 = (uint64_t *)&v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = type metadata accessor for LaunchWarningDetails(0);
  __chkstk_darwin(v8);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = swift_projectBox(a2);
  result = sub_10001E2A0(a1, (uint64_t)v10);
  if (!v2)
  {
    v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(6);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(7);
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      v14 = result;
      v15 = _s18LaunchWarningEntryVMa(0);
      sub_10001F600((uint64_t)v10, (uint64_t)v7 + *(int *)(v15 + 20), type metadata accessor for LaunchWarningDetails);
      *v7 = v14;
      *((_BYTE *)v7 + *(int *)(v15 + 24)) = v13 & 1;
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 0, 1, v15);
      swift_beginAccess(v11, v17, 1, 0);
      return sub_1000203C4((uint64_t)v7, v11);
    }
  }
  return result;
}

uint64_t sub_10001ED90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36[24];
  _QWORD aBlock[5];
  uint64_t v38;
  void *v39;

  v34 = a2;
  v3 = sub_1000110C4(&qword_10004E4E0);
  __chkstk_darwin(v3);
  v35 = (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LaunchWarningDetails(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject(&unk_100046F68, 24, 7);
  *(_QWORD *)(v9 + 16) = 0;
  v10 = swift_allocBox(v3);
  v12 = v11;
  v13 = _s18LaunchWarningEntryVMa(0);
  v31 = *(_QWORD *)(v13 - 8);
  v32 = v12;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 56);
  v33 = v13;
  v14(v12, 1, 1);
  sub_10002040C(a1, (uint64_t)v8, type metadata accessor for LaunchWarningDetails);
  v15 = *(unsigned __int8 *)(v6 + 80);
  v16 = (v15 + 24) & ~v15;
  v17 = (v7 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_100046F90, v18 + 8, v15 | 7);
  v20 = v39;
  *(_QWORD *)(v19 + 16) = v39;
  sub_10001F600((uint64_t)v8, v19 + v16, type metadata accessor for LaunchWarningDetails);
  *(_QWORD *)(v19 + v17) = v10;
  *(_QWORD *)(v19 + v18) = v9;
  aBlock[4] = sub_10001F560;
  v38 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001F5B0;
  aBlock[3] = &unk_100046FA8;
  v21 = _Block_copy(aBlock);
  v22 = v38;
  v23 = v20;
  swift_retain(v10);
  swift_retain(v9);
  swift_release(v22);
  objc_msgSend(v23, "transaction:", v21);
  _Block_release(v21);
  swift_beginAccess(v9 + 16, aBlock, 0, 0);
  if (*(_QWORD *)(v9 + 16))
  {
    v24 = swift_errorRetain(*(_QWORD *)(v9 + 16));
    swift_willThrow(v24);
LABEL_5:
    swift_release(v9);
    return swift_release(v10);
  }
  v25 = v34;
  v26 = v32;
  swift_beginAccess(v32, v36, 0, 0);
  v27 = v26;
  v28 = v35;
  sub_10001E9EC(v27, v35, &qword_10004E4E0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v28, 1, v33);
  if ((_DWORD)result != 1)
  {
    sub_10001F600(v28, v25, _s18LaunchWarningEntryVMa);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001F054()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int (*v44)(uint64_t, uint64_t, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  _BYTE v52[32];

  v7 = type metadata accessor for LaunchWarningDetails(0);
  v48 = *(_QWORD *)(v7 - 8);
  v8 = *(_QWORD *)(v48 + 64);
  __chkstk_darwin(v7);
  v51 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000110C4(&qword_10004E4E0);
  v10 = __chkstk_darwin(v9);
  v50 = (uint64_t)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v44 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v44 - v15;
  v17 = _s18LaunchWarningEntryVMa(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v47 = (uint64_t)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v22 = (char *)&v44 - v21;
  v49 = swift_projectBox(a3);
  sub_10001E7EC(*(_DWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)v16);
  v27 = (uint64_t)v51;
  v45 = v14;
  v46 = a4;
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v29 = v28(v16, 1, v17);
  if (v29 == 1)
  {
    v44 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v28;
    sub_100020234((uint64_t)v16, &qword_10004E4E0);
    v30 = a2;
    v31 = v27;
    sub_10002040C(a2, v27, type metadata accessor for LaunchWarningDetails);
    v32 = *(unsigned __int8 *)(v48 + 80);
    v33 = (v32 + 16) & ~v32;
    v34 = swift_allocObject(&unk_100047098, v33 + v8, v32 | 7);
    sub_10001F600(v31, v34 + v33, type metadata accessor for LaunchWarningDetails);
    sub_10000FAA8(0xD000000000000085, 0x800000010003A780, (uint64_t)sub_100020340, v34, 0, 0);
    swift_release(v34);
    v35 = (uint64_t)v45;
    sub_10001E7EC(*(_DWORD *)v30, *(_QWORD *)(v30 + 8), *(_QWORD *)(v30 + 16), (uint64_t)v45);
    if (v44(v35, 1, v17) == 1)
    {
      sub_100020234(v35, &qword_10004E4E0);
      v36 = sub_100020380();
      v37 = swift_allocError(&type metadata for LaunchWarningDBError, v36, 0, 0);
      swift_willThrow(v37);
      v23 = (uint64_t *)(v46 + 16);
      swift_beginAccess(v46 + 16, v52, 1, 0);
      v24 = *v23;
      *v23 = v37;
      swift_errorRelease(v24);
      return 0;
    }
    else
    {
      v40 = v47;
      sub_10001F600(v35, v47, _s18LaunchWarningEntryVMa);
      v41 = v40;
      v42 = v50;
      sub_10001F600(v41, v50, _s18LaunchWarningEntryVMa);
      v25 = 1;
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v42, 0, 1, v17);
      v43 = v49;
      swift_beginAccess(v49, v52, 1, 0);
      sub_1000203C4(v42, v43);
    }
  }
  else
  {
    sub_10001F600((uint64_t)v16, (uint64_t)v22, _s18LaunchWarningEntryVMa);
    v38 = v50;
    sub_10001F600((uint64_t)v22, v50, _s18LaunchWarningEntryVMa);
    v25 = 1;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v38, 0, 1, v17);
    v39 = v49;
    swift_beginAccess(v49, v52, 1, 0);
    sub_1000203C4(v38, v39);
  }
  return v25;
}

uint64_t sub_10001F460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v1 = type metadata accessor for LaunchWarningDetails(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  sub_10000EE2C(*(_QWORD *)(v0 + v4 + 8), *(_QWORD *)(v0 + v4 + 16));
  v6 = v0 + v4 + *(int *)(v1 + 24);
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = v0 + v4 + *(int *)(v1 + 36);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  v11 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + v11));
  swift_release(*(_QWORD *)(v0 + v12));
  return swift_deallocObject(v0, v12 + 8, v3 | 7);
}

uint64_t sub_10001F560()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for LaunchWarningDetails(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_10001F078(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10001F5B0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  LOBYTE(v1) = v1(v3);
  swift_release(v2);
  return v1 & 1;
}

uint64_t sub_10001F5E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001F5F8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001F600(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001F644(char a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject(&unk_100046FE0, 32, 7);
  *(_BYTE *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  sub_10000FAA8(0xD00000000000003ALL, 0x800000010003A8A0, (uint64_t)sub_10001F6E4, v4, 0, 0);
  return swift_release(v4);
}

uint64_t sub_10001F6D4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001F6E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 24);
  result = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)a1 + 168))(*(unsigned __int8 *)(v2 + 16), 1);
  if ((v4 & 0x8000000000000000) == 0)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 152))(v4, 2);
  __break(1u);
  return result;
}

uint64_t sub_10001F738()
{
  uint64_t v0;

  sub_10000EE2C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001F75C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)a1 + 152))(*(unsigned int *)(v1 + 16), 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 120))(v3, v4, 2);
}

unint64_t sub_10001F7B8()
{
  unint64_t result;

  result = qword_10004E4E8;
  if (!qword_10004E4E8)
  {
    result = swift_getWitnessTable(&unk_100037C8C, &type metadata for LaunchWarningDBError);
    atomic_store(result, (unint64_t *)&qword_10004E4E8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningDBError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_10001F83C + 4 * byte_100037C80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10001F85C + 4 * byte_100037C85[v4]))();
}

_BYTE *sub_10001F83C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10001F85C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10001F864(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10001F86C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10001F874(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10001F87C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningDBError()
{
  return &type metadata for LaunchWarningDBError;
}

_QWORD *sub_10001F898(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v23);
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    *(_DWORD *)((char *)a1 + v7) = *(_DWORD *)((char *)a2 + v7);
    v10 = *(_QWORD *)((char *)a2 + v7 + 8);
    v11 = *(_QWORD *)((char *)a2 + v7 + 16);
    sub_10000ED74(v10, v11);
    *((_QWORD *)v8 + 1) = v10;
    *((_QWORD *)v8 + 2) = v11;
    v12 = (int *)type metadata accessor for LaunchWarningDetails(0);
    v13 = v12[6];
    v14 = &v8[v13];
    v15 = &v9[v13];
    v16 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v8[v12[7]] = v9[v12[7]];
    *(_QWORD *)&v8[v12[8]] = *(_QWORD *)&v9[v12[8]];
    v17 = v12[9];
    v18 = &v8[v17];
    v19 = &v9[v17];
    v20 = type metadata accessor for URL(0);
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = sub_1000110C4(&qword_10004E810);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_10001FA14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  sub_10000EE2C(*(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16));
  v3 = type metadata accessor for LaunchWarningDetails(0);
  v4 = v2 + *(int *)(v3 + 24);
  v5 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v2 + *(int *)(v3 + 36);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

_QWORD *sub_10001FAC0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  v10 = *(_QWORD *)((char *)a2 + v6 + 16);
  sub_10000ED74(v9, v10);
  *((_QWORD *)v7 + 1) = v9;
  *((_QWORD *)v7 + 2) = v10;
  v11 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v12 = v11[6];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(_QWORD *)&v7[v11[8]] = *(_QWORD *)&v8[v11[8]];
  v16 = v11[9];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = type metadata accessor for URL(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    v21 = sub_1000110C4(&qword_10004E810);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_10001FC10(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  v10 = *(_QWORD *)((char *)a2 + v6 + 16);
  sub_10000ED74(v9, v10);
  v11 = *((_QWORD *)v7 + 1);
  v12 = *((_QWORD *)v7 + 2);
  *((_QWORD *)v7 + 1) = v9;
  *((_QWORD *)v7 + 2) = v10;
  sub_10000EE2C(v11, v12);
  v13 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v14 = v13[6];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v7[v13[7]] = v8[v13[7]];
  *(_QWORD *)&v7[v13[8]] = *(_QWORD *)&v8[v13[8]];
  v18 = v13[9];
  v19 = &v7[v18];
  v20 = &v8[v18];
  v21 = type metadata accessor for URL(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v7) = v23(v19, 1, v21);
  v24 = v23(v20, 1, v21);
  if (!(_DWORD)v7)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    v25 = sub_1000110C4(&qword_10004E810);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_10001FDB4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)v7 = *(_DWORD *)((char *)a2 + v6);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)((char *)a2 + v6 + 8);
  v9 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v7[v9[7]] = v8[v9[7]];
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  v14 = v9[9];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = sub_1000110C4(&qword_10004E810);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_10001FEF8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)v7 = *(_DWORD *)((char *)a2 + v6);
  v9 = *(_QWORD *)((char *)a1 + v6 + 8);
  v10 = *((_QWORD *)v7 + 2);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v8 + 8);
  sub_10000EE2C(v9, v10);
  v11 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v12 = v11[6];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(_QWORD *)&v7[v11[8]] = *(_QWORD *)&v8[v11[8]];
  v16 = v11[9];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = type metadata accessor for URL(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v7) = v21(v17, 1, v19);
  v22 = v21(v18, 1, v19);
  if (!(_DWORD)v7)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = sub_1000110C4(&qword_10004E810);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100020090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002009C);
}

uint64_t sub_10002009C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for LaunchWarningDetails(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_10002012C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100020138);
}

uint64_t sub_100020138(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for LaunchWarningDetails(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_1000201B4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for LaunchWarningDetails(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_100037D78;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100020234(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000110C4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100020274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for LaunchWarningDetails(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  sub_10000EE2C(*(_QWORD *)(v0 + v4 + 8), *(_QWORD *)(v0 + v4 + 16));
  v6 = v0 + v4 + *(int *)(v1 + 24);
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = v0 + v4 + *(int *)(v1 + 36);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100020344(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LaunchWarningDetails(0) - 8) + 80);
  return sub_10001E654(a1, (unsigned int *)(v1 + ((v3 + 16) & ~v3)));
}

unint64_t sub_100020380()
{
  unint64_t result;

  result = qword_10004E578;
  if (!qword_10004E578)
  {
    result = swift_getWitnessTable(&unk_100037CF4, &type metadata for LaunchWarningDBError);
    atomic_store(result, (unint64_t *)&qword_10004E578);
  }
  return result;
}

uint64_t sub_1000203C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000110C4(&qword_10004E4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002040C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id sub_100020450()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v24;
  objc_super v25;
  __int128 v26;
  uint64_t v27;
  _UNKNOWN **v28;
  uint64_t v29[9];

  v24 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue_serial.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LaunchWarningDB();
  v10 = v0;
  v11 = sub_1000132E8();
  v12 = sub_1000132F0(v11 & 1);
  *(_QWORD *)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_db] = v12;
  v13 = v12;
  sub_10001D768(v13, v29);
  v14 = type metadata accessor for CloudKitOperations();
  v15 = sub_100024CA4(v29);
  type metadata accessor for LaunchWarningController(0);
  v27 = v14;
  v28 = &off_1000475A8;
  *(_QWORD *)&v26 = v15;
  v16 = v13;
  swift_retain(v15);
  *(_QWORD *)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController] = sub_100029700(v16, &v26);
  sub_1000206F8();
  static DispatchQoS.unspecified.getter();
  *(_QWORD *)&v26 = &_swiftEmptyArrayStorage;
  v17 = sub_100020734();
  v18 = sub_1000110C4(&qword_10004E5A0);
  v19 = sub_10002077C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v18, v19, v4, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v24);
  *(_QWORD *)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_syncQueue] = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000016, 0x800000010003A8E0, v9, v6, v3, 0);
  v20 = type metadata accessor for MetricReporter();
  v21 = sub_100012278();
  v27 = v20;
  v28 = &off_100047B08;
  swift_release(v15);
  *(_QWORD *)&v26 = v21;
  sub_1000207C8(&v26, (uint64_t)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics]);

  v22 = (objc_class *)type metadata accessor for LaunchWarningOperations();
  v25.receiver = v10;
  v25.super_class = v22;
  return objc_msgSendSuper2(&v25, "init");
}

unint64_t sub_1000206F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004E590;
  if (!qword_10004E590)
  {
    v1 = objc_opt_self(OS_dispatch_queue_serial);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004E590);
  }
  return result;
}

unint64_t sub_100020734()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004E598;
  if (!qword_10004E598)
  {
    v1 = type metadata accessor for OS_dispatch_queue_serial.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10004E598);
  }
  return result;
}

unint64_t sub_10002077C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004E5A8;
  if (!qword_10004E5A8)
  {
    v1 = sub_100011168(&qword_10004E5A0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10004E5A8);
  }
  return result;
}

uint64_t sub_1000207C8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for LaunchWarningOperations()
{
  return objc_opt_self(_TtC17online_auth_agent23LaunchWarningOperations);
}

uint64_t sub_100020820(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void **v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v4 = sub_1000110C4(&qword_10004E4E0);
  __chkstk_darwin(v4);
  v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = _s18LaunchWarningEntryVMa(0);
  v6 = *(_QWORD *)(v46 - 8);
  v7 = __chkstk_darwin(v46);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static os_log_type_t.default.getter(v7);
  v11 = sub_1000185EC();
  v12 = (void *)*v11;
  v13 = sub_1000110C4(&qword_10004DC40);
  v14 = swift_allocObject(v13, 112, 7);
  *(_OWORD *)(v14 + 16) = xmmword_100036CC0;
  *(_QWORD *)(v14 + 56) = &type metadata for UInt64;
  *(_QWORD *)(v14 + 64) = &protocol witness table for UInt64;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 96) = &type metadata for Bool;
  *(_QWORD *)(v14 + 104) = &protocol witness table for Bool;
  *(_BYTE *)(v14 + 72) = a1;
  v15 = v12;
  os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v15, "Setting user override: %lld to %d", v43, v44);

  v16 = a2;
  v17 = v48;
  swift_bridgeObjectRelease(v14);
  v18 = v49;
  result = sub_10001F644(a1, v16);
  if (!v18)
  {
    v49 = v6;
    v44 = v13;
    v45 = (void **)v11;
    v20 = v46;
    v21 = (uint64_t)v47;
    if ((a1 & 1) != 0)
    {
      type metadata accessor for LaunchWarningMark();
      v43 = v16;
      v22 = sub_10001B43C(v16);
      sub_10001EA30(v22, v21);
      v23 = v20;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v21, 1, v20) == 1)
      {
        v24 = sub_100020234(v21, &qword_10004E4E0);
        v25 = static os_log_type_t.error.getter(v24);
        v26 = *v45;
        v27 = swift_allocObject(v44, 72, 7);
        *(_OWORD *)(v27 + 16) = xmmword_100036CA0;
        *(_QWORD *)(v27 + 56) = &type metadata for UInt64;
        *(_QWORD *)(v27 + 64) = &protocol witness table for UInt64;
        *(_QWORD *)(v27 + 32) = v43;
        v28 = v26;
        os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v28, "Unable to look up launch warning info for ID: %lld", v43);

        swift_bridgeObjectRelease(v27);
        return swift_release(v22);
      }
      else
      {
        v29 = v22;
        v30 = (uint64_t)v9;
        sub_10001F600(v21, (uint64_t)v9, _s18LaunchWarningEntryVMa);
        v31 = &v9[*(int *)(v23 + 20)];
        v32 = *(unsigned int *)v31;
        v33 = *((_QWORD *)v31 + 1);
        v34 = *((_QWORD *)v31 + 2);
        sub_10000ED74(v33, v34);
        v36 = nullsub_1(v32, v33, v34, v35);
        v38 = v37;
        v40 = v39;
        v41 = *(_QWORD *)(v17 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
        v42 = *(_QWORD *)(v17 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
        sub_1000111AC((_QWORD *)(v17 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics), v41);
        (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v42 + 32))(v36, v38, v40, v41, v42);
        sub_10000EE2C(v38, v40);
        swift_release(v29);
        return sub_100013234(v30, _s18LaunchWarningEntryVMa);
      }
    }
  }
  return result;
}

uint64_t sub_100020C40(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, _QWORD);
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int *v72;
  uint64_t *v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int v80;
  uint64_t v81;

  v6 = _s18LaunchWarningEntryVMa(0);
  __chkstk_darwin(v6);
  v73 = (uint64_t *)((char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_1000110C4(&qword_10004E5C0);
  __chkstk_darwin(v8);
  v10 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for LaunchWarningDetails(0);
  v75 = *(_QWORD *)(v78 - 8);
  v11 = __chkstk_darwin(v78);
  v71 = (uint64_t)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v72 = (unsigned int *)((char *)&v70 - v14);
  v15 = static os_log_type_t.default.getter(v13);
  v16 = (id *)sub_1000185EC();
  v17 = *v16;
  v76 = sub_1000110C4(&qword_10004DC40);
  v18 = swift_allocObject(v76, 112, 7);
  v74 = xmmword_100036CC0;
  *(_OWORD *)(v18 + 16) = xmmword_100036CC0;
  *(_QWORD *)(v18 + 56) = &type metadata for UInt32;
  *(_QWORD *)(v18 + 64) = &protocol witness table for UInt32;
  v80 = a3;
  *(_DWORD *)(v18 + 32) = a3;
  v19 = v17;
  v20 = a1;
  v21 = a1;
  v22 = a2;
  sub_100010E8C(v21, a2);
  v24 = v23;
  v26 = v25;
  *(_QWORD *)(v18 + 96) = &type metadata for String;
  v77 = sub_100012364();
  *(_QWORD *)(v18 + 104) = v77;
  *(_QWORD *)(v18 + 72) = v24;
  *(_QWORD *)(v18 + 80) = v26;
  os_log(_:dso:log:_:_:)(v15, &_mh_execute_header, v19, "Looking up launch warning for cdhash: %d, %@", 44, 2, v18);

  v27 = swift_bridgeObjectRelease(v18);
  v28 = *(_QWORD *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController);
  if (v28)
  {
    v29 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v28 + 280);
    swift_retain(*(_QWORD *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController));
    v30 = v80;
    v31 = v79;
    v29(v20, v22, v80);
    if (v31)
    {
      swift_errorRelease(v31);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v75 + 56))(v10, 1, 1, v78);
      v81 = 0;
    }
    else
    {
      v36 = v78;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v10, 1, v78) != 1)
      {
        v46 = v72;
        v47 = sub_10001F600((uint64_t)v10, (uint64_t)v72, type metadata accessor for LaunchWarningDetails);
        v48 = static os_log_type_t.default.getter(v47);
        v49 = *v16;
        v50 = v36;
        v51 = swift_allocObject(v76, 72, 7);
        *(_OWORD *)(v51 + 16) = xmmword_100036CA0;
        v52 = v71;
        sub_10002040C((uint64_t)v46, v71, type metadata accessor for LaunchWarningDetails);
        v53 = v49;
        v54 = String.init<A>(describing:)(v52, v50);
        v55 = v77;
        *(_QWORD *)(v51 + 56) = &type metadata for String;
        *(_QWORD *)(v51 + 64) = v55;
        *(_QWORD *)(v51 + 32) = v54;
        *(_QWORD *)(v51 + 40) = v56;
        os_log(_:dso:log:_:_:)(v48, &_mh_execute_header, v53, "Found launch warning with details: %@", 37, 2, v51);

        swift_bridgeObjectRelease(v51);
        v57 = *v46;
        v58 = *((_QWORD *)v46 + 1);
        v59 = *((_QWORD *)v46 + 2);
        sub_10000ED74(v58, v59);
        v61 = nullsub_1(v57, v58, v59, v60);
        v63 = v62;
        v65 = v64;
        v66 = *(_QWORD *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
        v67 = *(_QWORD *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
        sub_1000111AC((_QWORD *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics), v66);
        (*(void (**)(uint64_t, uint64_t, unint64_t, _QWORD, uint64_t, uint64_t, uint64_t))(v67 + 24))(v61, v63, v65, 0, 1, v66, v67);
        v68 = v73;
        sub_10001ED90((uint64_t)v46, (uint64_t)v73);
        type metadata accessor for LaunchWarningMark();
        v69 = sub_10001B43C(*v68);
        v32 = (*(uint64_t (**)(void))(*(_QWORD *)v69 + 112))();
        swift_release(v69);
        sub_10000EE2C(v63, v65);
        swift_release(v28);
        sub_100013234((uint64_t)v68, _s18LaunchWarningEntryVMa);
        sub_100013234((uint64_t)v46, type metadata accessor for LaunchWarningDetails);
        return v32;
      }
      v81 = 0;
    }
    v37 = sub_100020234((uint64_t)v10, &qword_10004E5C0);
    v38 = static os_log_type_t.info.getter(v37);
    v39 = *v16;
    v40 = swift_allocObject(v76, 112, 7);
    *(_OWORD *)(v40 + 16) = v74;
    *(_QWORD *)(v40 + 56) = &type metadata for UInt32;
    *(_QWORD *)(v40 + 64) = &protocol witness table for UInt32;
    *(_DWORD *)(v40 + 32) = v30;
    v41 = v39;
    sub_100010E8C(v20, v22);
    v42 = v77;
    *(_QWORD *)(v40 + 96) = &type metadata for String;
    *(_QWORD *)(v40 + 104) = v42;
    *(_QWORD *)(v40 + 72) = v43;
    *(_QWORD *)(v40 + 80) = v44;
    os_log(_:dso:log:_:_:)(v38, &_mh_execute_header, v41, "Found no launch warning for cdhash: %d, %@", 42, 2, v40);
    swift_release(v28);

    swift_bridgeObjectRelease(v40);
    return 0;
  }
  else
  {
    v32 = static os_log_type_t.error.getter(v27);
    v33 = *v16;
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Launch warning lookup failed due to missing controller.", 55, 2, &_swiftEmptyArrayStorage);

    v34 = sub_100021254();
    v35 = swift_allocError(&type metadata for LaunchWarningOperationsError, v34, 0, 0);
    swift_willThrow(v35);
  }
  return v32;
}

unint64_t sub_100021254()
{
  unint64_t result;

  result = qword_10004E5C8;
  if (!qword_10004E5C8)
  {
    result = swift_getWitnessTable(&unk_100037E04, &type metadata for LaunchWarningOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004E5C8);
  }
  return result;
}

uint64_t sub_100021398()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD v11[4];

  result = sub_10001580C();
  if ((result & 1) != 0)
  {
    v2 = static os_log_type_t.default.getter(result);
    v3 = sub_1000185EC();
    v4 = (id)*v3;
    os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, v4, "Performing regular launch warning sync.", 39, 2, &_swiftEmptyArrayStorage);

    v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController);
    if (v6)
    {
      __chkstk_darwin(v5);
      v11[2] = v6;
      v11[3] = v0;
      swift_retain(v6);
      OS_dispatch_queue.sync<A>(execute:)(sub_100021BCC, v11, (char *)&type metadata for () + 8);
      return swift_release(v6);
    }
    else
    {
      v7 = static os_log_type_t.error.getter(v5);
      v8 = (id)*v3;
      os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, v8, "Launch warning sync failed due to missing controller.", 53, 2, &_swiftEmptyArrayStorage);

      v9 = sub_100021254();
      v10 = swift_allocError(&type metadata for LaunchWarningOperationsError, v9, 0, 0);
      return swift_willThrow(v10);
    }
  }
  return result;
}

uint64_t sub_10002150C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  __int16 v19;
  __int16 v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  double v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  __int16 v33;
  _QWORD *v34;
  double v35;
  void (*v36)(char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_type_t v50;
  id v51;
  os_log_type_t v52;
  __int128 v53;
  NSObject *v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  unint64_t v84;
  os_log_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  char *v93;
  __int128 v94;
  os_log_t v95;
  NSObject **v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  void (*v103)(char *, uint64_t);
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;

  v105 = a2;
  v4 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v92 - v9;
  v106 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v106 - 8);
  v12 = __chkstk_darwin(v106);
  v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v92 - v16;
  v18 = static Date.now.getter(v15);
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 288))(v18);
  v103 = v21;
  if (v2)
  {
    v22 = *(_QWORD *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
    v23 = *(_QWORD *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
    v24 = sub_1000111AC((_QWORD *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics), v22);
    static Date.now.getter(v24);
    v25 = Date.timeIntervalSince(_:)(v17);
    v26 = *(void (**)(char *, uint64_t))(v11 + 8);
    v27 = v14;
    v28 = v106;
    v26(v27, v106);
    (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v23 + 16))(v2, v22, v23, v25);
    swift_errorRelease(v2);
    return ((uint64_t (*)(char *, uint64_t))v26)(v17, v28);
  }
  v97 = v5;
  v101 = v4;
  v102 = v10;
  v99 = v8;
  v100 = a1;
  v104 = 0;
  v30 = v19;
  v31 = *(_QWORD *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
  v32 = *(_QWORD *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
  v105 = (_QWORD *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics);
  v33 = v20;
  v34 = sub_1000111AC(v105, v31);
  static Date.now.getter(v34);
  v98 = v17;
  v35 = Date.timeIntervalSince(_:)(v17);
  v36 = *(void (**)(char *, uint64_t))(v11 + 8);
  v37 = v14;
  v38 = v106;
  v36(v37, v106);
  v39 = v33 & 0x101;
  v40 = (uint64_t)v103;
  v41 = (*(uint64_t (**)(_QWORD, void (*)(char *, uint64_t), uint64_t, uint64_t, uint64_t, double))(v32 + 8))(v30 & 0x101, v103, v39, v31, v32, v35);
  if ((v30 & 1) == 0 && v40 < 1)
    goto LABEL_5;
  v43 = static os_log_type_t.default.getter(v41);
  v44 = sub_1000185EC();
  v45 = (id)*v44;
  os_log(_:dso:log:_:_:)(v43, &_mh_execute_header, v45, "Launch warning sync triggered an update.", 40, 2, &_swiftEmptyArrayStorage);

  v46 = v104;
  v47 = (*(uint64_t (**)(void))(*(_QWORD *)v100 + 296))();
  if (v46)
  {
    v42 = v98;
    return ((uint64_t (*)(char *, uint64_t))v36)(v42, v38);
  }
  v48 = v47;
  v104 = 0;
  v49 = *(_QWORD *)(v47 + 16);
  if (!v49)
  {
    v89 = swift_bridgeObjectRelease(v47);
    v90 = static os_log_type_t.default.getter(v89);
    v91 = (id)*v44;
    os_log(_:dso:log:_:_:)(v90, &_mh_execute_header, v91, "Launch warning sync found no impacted apps.", 43, 2, &_swiftEmptyArrayStorage);

LABEL_5:
    v42 = v98;
    return ((uint64_t (*)(char *, uint64_t))v36)(v42, v38);
  }
  v50 = static os_log_type_t.default.getter(v47);
  v96 = (NSObject **)v44;
  v51 = (id)*v44;
  v52 = v50;
  if (os_log_type_enabled((os_log_t)*v44, v50))
  {
    swift_bridgeObjectRetain(v48);
    v54 = v51;
    v55 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v55 = 134217984;
    v108 = v49;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, &v109, v55 + 4);
    swift_bridgeObjectRelease(v48);
    _os_log_impl((void *)&_mh_execute_header, v54, v52, "Launch warning sync found %ld local warnings.", v55, 0xCu);
    swift_slowDealloc(v55, -1, -1);

  }
  v56 = *(_QWORD *)(v48 + 16);
  if (!v56)
  {
    swift_bridgeObjectRelease(v48);
    goto LABEL_5;
  }
  v57 = *(unsigned __int8 *)(v97 + 80);
  v92 = v48;
  v58 = v48 + ((v57 + 32) & ~v57);
  v97 = *(_QWORD *)(v97 + 72);
  *(_QWORD *)&v53 = 136315138;
  v94 = v53;
  v93 = (char *)&type metadata for Any + 8;
  v103 = v36;
  v59 = (uint64_t)v102;
  while (1)
  {
    sub_10002040C(v58, v59, type metadata accessor for LaunchWarningController.NewLaunchWarning);
    v72 = (unsigned int *)(v59 + *(int *)(v101 + 20));
    v73 = *(_QWORD *)((char *)v72 + *(int *)(type metadata accessor for LaunchWarningDetails(0) + 32));
    v74 = *(_QWORD *)sub_100017440();
    v107 = v73;
    v108 = v74;
    v75 = sub_100017804();
    v76 = dispatch thunk of SetAlgebra.isSuperset(of:)(&v108, &type metadata for LaunchWarningFlags, v75);
    if ((v76 & 1) == 0)
      break;
    v60 = 0;
LABEL_15:
    v61 = *v72;
    v62 = *((_QWORD *)v72 + 1);
    v63 = *((_QWORD *)v72 + 2);
    sub_10000ED74(v62, v63);
    v65 = nullsub_1(v61, v62, v63, v64);
    v67 = v66;
    v69 = v68;
    v70 = v105[3];
    v71 = v105[4];
    sub_1000111AC(v105, v70);
    (*(void (**)(uint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v71 + 24))(v65, v67, v69, v60 & 1, 0, v70, v71);
    sub_10000EE2C(v67, v69);
    v59 = (uint64_t)v102;
    sub_100013234((uint64_t)v102, type metadata accessor for LaunchWarningController.NewLaunchWarning);
    v58 += v97;
    --v56;
    v36 = v103;
    if (!v56)
    {
      swift_bridgeObjectRelease(v92);
      v38 = v106;
      goto LABEL_5;
    }
  }
  v77 = static os_log_type_t.default.getter(v76);
  v78 = *v96;
  v79 = (uint64_t)v99;
  sub_10002040C(v59, (uint64_t)v99, type metadata accessor for LaunchWarningController.NewLaunchWarning);
  if (os_log_type_enabled(v78, v77))
  {
    v95 = v78;
    v80 = swift_slowAlloc(12, -1);
    v81 = swift_slowAlloc(32, -1);
    v108 = v81;
    *(_DWORD *)v80 = v94;
    v82 = (uint64_t *)(v79 + *(int *)(type metadata accessor for AppRecord(0) + 20));
    v83 = *v82;
    v84 = v82[1];
    swift_bridgeObjectRetain(v84);
    *(_QWORD *)(v80 + 4) = sub_100021DC8(v83, v84, &v108);
    swift_bridgeObjectRelease(v84);
    sub_100013234((uint64_t)v99, type metadata accessor for LaunchWarningController.NewLaunchWarning);
    v85 = v95;
    _os_log_impl((void *)&_mh_execute_header, v95, v77, "Terminating app: %s", (uint8_t *)v80, 0xCu);
    swift_arrayDestroy(v81, 1, v93);
    swift_slowDealloc(v81, -1, -1);
    v86 = v80;
    v59 = (uint64_t)v102;
    swift_slowDealloc(v86, -1, -1);

  }
  else
  {
    sub_100013234(v79, type metadata accessor for LaunchWarningController.NewLaunchWarning);
  }
  v87 = v104;
  v88 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v100 + 304))(v59);
  v104 = v87;
  if (!v87)
  {
    v60 = v88;
    goto LABEL_15;
  }
  sub_100013234(v59, type metadata accessor for LaunchWarningController.NewLaunchWarning);
  swift_bridgeObjectRelease(v92);
  return ((uint64_t (*)(char *, uint64_t))v36)(v98, v106);
}

uint64_t sub_100021BCC()
{
  uint64_t v0;

  return sub_10002150C(*(_QWORD *)(v0 + 16), *(_QWORD **)(v0 + 24));
}

id sub_100021C5C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningOperations();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_100021CE8()
{
  unint64_t result;

  result = qword_10004E5D0;
  if (!qword_10004E5D0)
  {
    result = swift_getWitnessTable(&unk_100037D9C, &type metadata for LaunchWarningOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004E5D0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningOperationsError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_100021D6C + 4 * byte_100037D90[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100021D8C + 4 * byte_100037D95[v4]))();
}

_BYTE *sub_100021D6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100021D8C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100021D94(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100021D9C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100021DA4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100021DAC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningOperationsError()
{
  return &type metadata for LaunchWarningOperationsError;
}

uint64_t sub_100021DC8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100021E98(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100014CB4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100014CB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000111D0(v12);
  return v7;
}

uint64_t sub_100021E98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100022050(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100022050(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000220E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100022258(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100022258(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000220E4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100011104(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100022258(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000110C4(&qword_10004DC48);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000223A4()
{
  return sub_10000FD94((void (*)(uint64_t))sub_10002258C);
}

uint64_t sub_1000223D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = type metadata accessor for UserTrustedProfileEntry(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)(a1 + *(int *)(__chkstk_darwin(v5) + 20));
  v10 = v9[1];
  if (!v10)
    goto LABEL_3;
  v23 = a2;
  v22 = v6;
  v12 = v9[2];
  v11 = v9[3];
  v13 = a1;
  v14 = *v9;
  v15 = (_QWORD *)swift_allocObject(&unk_100047330, 48, 7);
  v15[2] = v14;
  v15[3] = v10;
  a1 = v13;
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[4] = v12;
  v15[5] = v11;
  swift_bridgeObjectRetain(v10);
  v16 = v11;
  v6 = v22;
  sub_10000ED74(v12, v16);
  sub_10000FAA8(0xD000000000000077, 0x800000010003AE20, (uint64_t)sub_100022DAC, (uint64_t)v15, 0, 0);
  result = swift_release(v15);
  if (!v2)
  {
LABEL_3:
    sub_100022BAC(a1, (uint64_t)v8);
    v18 = *(unsigned __int8 *)(v6 + 80);
    v19 = (v18 + 16) & ~v18;
    v20 = swift_allocObject(&unk_100047308, v19 + v7, v18 | 7);
    sub_100022BF0((uint64_t)v8, v20 + v19);
    sub_10000FAA8(0xD00000000000004CLL, 0x800000010003AFB0, (uint64_t)sub_100022CC4, v20, 0, 0);
    return swift_release(v20);
  }
  return result;
}

uint64_t sub_10002258C()
{
  uint64_t v0;

  return sub_1000223D0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000225A4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000225B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000225D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];

  v3 = a2 + 16;
  v4 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 192))(0);
  v6 = v5;
  swift_beginAccess(v3, v9, 1, 0);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v6;
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_100022644(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  _BYTE v31[24];

  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = __chkstk_darwin(v2);
  v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - v6;
  v8 = swift_allocObject(&unk_100047240, 32, 7);
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v28 = a1;
  v26 = v9;
  v9(v7, a1, v2);
  v10 = *(unsigned __int8 *)(v3 + 80);
  v11 = (v10 + 16) & ~v10;
  v12 = v11 + v4;
  v25 = v10 | 7;
  v13 = swift_allocObject(&unk_100047268, v12, v10 | 7);
  v24 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v24(v13 + v11, v7, v2);
  swift_retain(v8);
  v14 = v29;
  sub_10000FAA8(0xD000000000000039, 0x800000010003AEF0, (uint64_t)sub_100022A08, v13, (uint64_t)sub_100022A0C, v8);
  swift_release(v13);
  swift_release(v8);
  if (v14)
    return swift_release(v8);
  swift_beginAccess(v8 + 16, v31, 0, 0);
  v17 = *(_QWORD *)(v8 + 16);
  v16 = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain(v16);
  swift_release(v8);
  v18 = v27;
  v26(v27, v28, v2);
  v19 = swift_allocObject(&unk_100047290, v12, v25);
  v24(v19 + v11, v18, v2);
  sub_10000FAA8(0xD000000000000031, 0x800000010003AF70, (uint64_t)sub_100022A08, v19, 0, 0);
  result = swift_release(v19);
  if (v16)
  {
    v20 = swift_allocObject(&unk_100047218, 24, 7);
    *(_QWORD *)(v20 + 16) = 0;
    v21 = swift_allocObject(&unk_1000472B8, 32, 7);
    *(_QWORD *)(v21 + 16) = v17;
    *(_QWORD *)(v21 + 24) = v16;
    swift_bridgeObjectRetain_n(v16, 2);
    swift_retain(v20);
    sub_10000FAA8(0xD000000000000043, 0x800000010003AEA0, (uint64_t)sub_100022AF8, v21, (uint64_t)sub_100022AFC, v20);
    swift_release(v21);
    swift_release(v20);
    swift_beginAccess(v20 + 16, v30, 0, 0);
    v22 = *(_QWORD *)(v20 + 16);
    swift_bridgeObjectRelease(v16);
    swift_release(v20);
    if (v22)
    {
      return swift_bridgeObjectRelease(v16);
    }
    else
    {
      v23 = swift_allocObject(&unk_1000472E0, 32, 7);
      *(_QWORD *)(v23 + 16) = v17;
      *(_QWORD *)(v23 + 24) = v16;
      swift_bridgeObjectRetain(v16);
      sub_10000FAA8(0xD000000000000033, 0x800000010003AF30, (uint64_t)sub_100022AF8, v23, 0, 0);
      swift_bridgeObjectRelease(v16);
      return swift_release(v23);
    }
  }
  return result;
}

uint64_t sub_100022A0C(uint64_t a1)
{
  uint64_t v1;

  return sub_1000225D8(a1, v1);
}

uint64_t sub_100022A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100022A98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for UUID(0);
  v2 = UUID.uuidString.getter();
  v4 = v3;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 184))(v2);
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_100022AFC(uint64_t a1)
{
  return sub_100022B10(a1);
}

uint64_t sub_100022B10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = v1;
  v3 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 160))(0);
  result = swift_beginAccess(v2 + 16, v5, 1, 0);
  *(_QWORD *)(v2 + 16) = v3;
  return result;
}

uint64_t sub_100022B78(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)a1 + 184))(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), 1);
}

uint64_t sub_100022BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserTrustedProfileEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserTrustedProfileEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v1 = type metadata accessor for UserTrustedProfileEntry(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v4, v6);
  v7 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  v8 = v7[1];
  if (v8)
  {
    swift_bridgeObjectRelease(v8);
    sub_10000EE2C(v7[2], v7[3]);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100022CC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = type metadata accessor for UserTrustedProfileEntry(0);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  v5 = v1 + ((v4 + 16) & ~v4);
  v6 = UUID.uuidString.getter();
  v8 = v7;
  v9 = *(void (**)(uint64_t))(*(_QWORD *)a1 + 184);
  v9(v6);
  swift_bridgeObjectRelease(v8);
  v10 = (uint64_t *)(v5 + *(int *)(v3 + 20));
  v11 = v10[1];
  if (v11)
  {
    v12 = *v10;
    swift_bridgeObjectRetain(v10[1]);
    v13 = v11;
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v12, v11, 2);
  return swift_bridgeObjectRelease(v13);
}

uint64_t sub_100022D80()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  sub_10000EE2C(v0[4], v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022DB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[4];
  v4 = v1[5];
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)a1 + 184))(v1[2], v1[3], 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 120))(v3, v4, 2);
}

uint64_t sub_100022E14()
{
  uint64_t v0;

  v0 = type metadata accessor for URL(0);
  sub_10001388C(v0, qword_1000516C0);
  sub_1000132D0(v0, (uint64_t)qword_1000516C0);
  return URL.init(fileURLWithPath:)(0xD000000000000027, 0x800000010003B060);
}

id sub_100022E74(char a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;
  NSURL *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  if (qword_100050C80 != -1)
    swift_once(&qword_100050C80, sub_100022E14);
  v5 = type metadata accessor for URL(0);
  sub_1000132D0(v5, (uint64_t)qword_1000516C0);
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  v11.receiver = v4;
  v11.super_class = v2;
  v9 = objc_msgSendSuper2(&v11, "initWithDatabaseURL:asReadOnly:", v7, a1 & 1);

  return v9;
}

uint64_t type metadata accessor for UserTrustDB()
{
  return objc_opt_self(_TtC17online_auth_agent11UserTrustDB);
}

uint64_t sub_1000230C4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v1 = v0;
  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, "dbURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v6);

  v7 = URL.path.getter();
  v9 = v8;
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  v11 = String.utf8CString.getter(v7, v9);
  swift_bridgeObjectRelease(v9);
  sub_100003060((const char *)(v11 + 32));
  swift_release(v11);
  v12 = objc_msgSend(v1, "shmURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v12);

  v13 = URL.path.getter();
  v15 = v14;
  v10(v5, v2);
  v16 = String.utf8CString.getter(v13, v15);
  swift_bridgeObjectRelease(v15);
  sub_100003060((const char *)(v16 + 32));
  swift_release(v16);
  v17 = objc_msgSend(v1, "walURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v17);

  v18 = URL.path.getter();
  v20 = v19;
  v10(v5, v2);
  v21 = String.utf8CString.getter(v18, v20);
  swift_bridgeObjectRelease(v20);
  sub_100003060((const char *)(v21 + 32));
  return swift_release(v21);
}

id sub_1000232C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustDB();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL sub_1000232FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

id sub_100023310(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  id v24;
  void *v25;
  char v26;
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  id v30;
  id v31;

  v31 = a1;
  v3 = sub_1000110C4(&qword_10004E630);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v30 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v30 - v17;
  if (!a2)
    return v31;
  v30 = a2;
  v19 = objc_msgSend(v31, "creationDate");
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_10;
  }
  v20 = v19;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(v8, v16, v9);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v22(v8, 0, 1, v9);
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v23(v8, 1, v9) == 1)
  {
LABEL_10:
    v29 = (uint64_t)v8;
LABEL_13:
    sub_100020234(v29, &qword_10004E630);
    return v30;
  }
  v21(v18, v8, v9);
  v24 = objc_msgSend(v31, "creationDate");
  if (!v24)
  {
    v22(v6, 1, 1, v9);
    goto LABEL_12;
  }
  v25 = v24;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v21(v6, v16, v9);
  v22(v6, 0, 1, v9);
  if (v23(v6, 1, v9) == 1)
  {
LABEL_12:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
    v29 = (uint64_t)v6;
    goto LABEL_13;
  }
  v21(v13, v6, v9);
  v26 = static Date.> infix(_:_:)(v18, v13);
  v27 = *(void (**)(char *, uint64_t))(v10 + 8);
  v27(v13, v9);
  v27(v18, v9);
  if ((v26 & 1) != 0)
  {

    return v31;
  }
  return v30;
}

uint64_t sub_1000235E0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[4];
  int v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE *v83;
  int v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v81 = a7;
  v82 = a8;
  v84 = a3;
  v85 = a1;
  v86 = a2;
  v87 = a9;
  v12 = sub_1000110C4(&qword_10004E810);
  v13 = __chkstk_darwin(v12);
  v83 = &v79[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  v16 = &v79[-v15];
  v17 = sub_1000110C4(&qword_10004E630);
  __chkstk_darwin(v17);
  v19 = &v79[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = type metadata accessor for Date(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = __chkstk_darwin(v20);
  v24 = &v79[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v22);
  v26 = &v79[-v25];
  sub_10001E9EC(a6, (uint64_t)v19, &qword_10004E630);
  v27 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20);
  if ((_DWORD)v27 == 1)
  {
    static Date.now.getter(v27);
    v28 = sub_100020234((uint64_t)v19, &qword_10004E630);
    if (!a4)
      goto LABEL_11;
  }
  else
  {
    v28 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v21 + 32))(v26, v19, v20);
    if (!a4)
    {
LABEL_11:
      v50 = static os_log_type_t.error.getter(v28);
      v51 = (void *)*sub_10001853C();
      v52 = sub_1000110C4(&qword_10004DC40);
      v44 = swift_allocObject(v52, 72, 7);
      *(_OWORD *)(v44 + 16) = xmmword_100036CA0;
      v89 = a4;
      swift_unknownObjectRetain(a4, v53);
      v45 = v51;
      v54 = sub_1000110C4((uint64_t *)&unk_10004E840);
      v55 = String.init<A>(describing:)(&v89, v54);
      v57 = v56;
      *(_QWORD *)(v44 + 56) = &type metadata for String;
      *(_QWORD *)(v44 + 64) = sub_100012364();
      *(_QWORD *)(v44 + 32) = v55;
      *(_QWORD *)(v44 + 40) = v57;
      os_log(_:dso:log:_:_:)(v50, &_mh_execute_header, v45, "CloudKit record has invalid flags field: %@", 43, 2, v44);
      goto LABEL_12;
    }
  }
  v89 = a4;
  swift_unknownObjectRetain(a4, v29);
  v30 = sub_1000110C4(&qword_10004E808);
  v28 = swift_dynamicCast(&v88, &v89, v30, &type metadata for Int, 6);
  if ((v28 & 1) == 0)
    goto LABEL_11;
  v34 = nullsub_1(v88, v31, v32, v33);
  if (!a5
    || (v36 = v34,
        v89 = a5,
        swift_unknownObjectRetain(a5, v35),
        v34 = swift_dynamicCast(&v88, &v89, v30, &type metadata for Int, 6),
        (v34 & 1) == 0))
  {
    v59 = static os_log_type_t.error.getter(v34);
    v60 = (void *)*sub_10001853C();
    v61 = sub_1000110C4(&qword_10004DC40);
    v62 = swift_allocObject(v61, 72, 7);
    *(_OWORD *)(v62 + 16) = xmmword_100036CA0;
    v89 = a5;
    swift_unknownObjectRetain(a5, v63);
    v64 = v60;
    v65 = sub_1000110C4((uint64_t *)&unk_10004E840);
    v66 = String.init<A>(describing:)(&v89, v65);
    v68 = v67;
    *(_QWORD *)(v62 + 56) = &type metadata for String;
    *(_QWORD *)(v62 + 64) = sub_100012364();
    *(_QWORD *)(v62 + 32) = v66;
    *(_QWORD *)(v62 + 40) = v68;
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v64, "CloudKit record has invalid reason field: %@", 44, 2, v62);

    v58 = v62;
    goto LABEL_14;
  }
  v37 = sub_100017324(v88);
  if (v37 == 2)
  {
    v38 = *(_QWORD *)sub_100017434();
    v88 = v36;
    v89 = v38;
    v39 = sub_100017804();
    v40 = dispatch thunk of SetAlgebra.isSuperset(of:)(&v89, &type metadata for LaunchWarningFlags, v39);
    if ((v40 & 1) != 0)
    {
      v41 = static os_log_type_t.default.getter(v40);
      v42 = (void *)*sub_10001853C();
      v43 = sub_1000110C4(&qword_10004DC40);
      v44 = swift_allocObject(v43, 112, 7);
      *(_OWORD *)(v44 + 16) = xmmword_100036CC0;
      *(_QWORD *)(v44 + 56) = &type metadata for UInt32;
      *(_QWORD *)(v44 + 64) = &protocol witness table for UInt32;
      *(_DWORD *)(v44 + 32) = v84;
      v45 = v42;
      sub_100010E8C(v85, v86);
      v47 = v46;
      v49 = v48;
      *(_QWORD *)(v44 + 96) = &type metadata for String;
      *(_QWORD *)(v44 + 104) = sub_100012364();
      *(_QWORD *)(v44 + 72) = v47;
      *(_QWORD *)(v44 + 80) = v49;
      os_log(_:dso:log:_:_:)(v41, &_mh_execute_header, v45, "Launch warning has unknown reason and flags indicate to ignore: %d, %@", 70, 2, v44);
LABEL_12:

      v58 = v44;
LABEL_14:
      swift_bridgeObjectRelease(v58);
      (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v26, v20);
      v69 = type metadata accessor for LaunchWarningDetails(0);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v87, 1, 1, v69);
    }
    v71 = 1;
  }
  else
  {
    v71 = v37 & 1;
  }
  v80 = v71;
  v72 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v16, 1, 1, v72);
  v73 = (uint64_t)v83;
  if (v82)
  {
    URL.init(string:)(v81, v82);
    sub_100020234((uint64_t)v16, &qword_10004E810);
    sub_100028E08(v73, (uint64_t)v16, &qword_10004E810);
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v21 + 16))(v24, v26, v20);
  sub_10001E9EC((uint64_t)v16, v73, &qword_10004E810);
  v74 = v73;
  v75 = v85;
  v76 = v86;
  sub_10000ED74(v85, v86);
  v77 = v87;
  sub_10001768C(v84, v75, v76, (uint64_t)v24, v80, v36, v74, v87);
  sub_100020234((uint64_t)v16, &qword_10004E810);
  (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v26, v20);
  v78 = type metadata accessor for LaunchWarningDetails(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v77, 0, 1, v78);
}

uint64_t sub_100023B98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;

  v4 = sub_1000110C4(&qword_10004E810);
  __chkstk_darwin(v4);
  v6 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v98 - v12;
  v14 = CKRecord.subscript.getter(0x64616F6C796170, 0xE700000000000000);
  if (!v14)
    goto LABEL_27;
  v15 = v14;
  v16 = objc_opt_self(CKAsset);
  v17 = (void *)swift_dynamicCastObjCClass(v15, v16);
  if (!v17)
  {
    v14 = swift_unknownObjectRelease(v15);
LABEL_27:
    v41 = static os_log_type_t.error.getter(v14);
    v42 = (void *)*sub_10001853C();
    v43 = sub_1000110C4(&qword_10004DC40);
    v44 = swift_allocObject(v43, 72, 7);
    *(_OWORD *)(v44 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v44 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v44 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v44 + 32) = a1;
    v45 = a1;
    v46 = v42;
    os_log(_:dso:log:_:_:)(v41, &_mh_execute_header, v46, "CloudKit record has invalid payload field: %@", 45, 2, v44);

    swift_bridgeObjectRelease(v44);
    v47 = type metadata accessor for BloomFilterRecord(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(a2, 1, 1, v47);
  }
  v18 = v17;
  v108 = a2;
  v19 = objc_msgSend(v17, "fileURL");
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_29;
  }
  v20 = v19;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

  v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v21(v6, v11, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_29:
    v49 = sub_100020234((uint64_t)v6, &qword_10004E810);
    v50 = static os_log_type_t.error.getter(v49);
    v51 = (void *)*sub_10001853C();
    v52 = sub_1000110C4(&qword_10004DC40);
    v53 = swift_allocObject(v52, 72, 7);
    *(_OWORD *)(v53 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v53 + 56) = sub_100028DD0(0, &qword_10004E818, CKAsset_ptr);
    *(_QWORD *)(v53 + 64) = sub_100028A44(&qword_10004E820, &qword_10004E818, CKAsset_ptr);
    *(_QWORD *)(v53 + 32) = v18;
    v54 = v51;
    swift_unknownObjectRetain(v15, v55);
    os_log(_:dso:log:_:_:)(v50, &_mh_execute_header, v54, "CloudKit asset doesn't have a file URL: %@", 42, 2, v53);

    swift_bridgeObjectRelease(v53);
    swift_unknownObjectRelease(v15);
LABEL_37:
    v72 = type metadata accessor for BloomFilterRecord(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v108, 1, 1, v72);
  }
  v21(v13, v6, v7);
  v22 = CKRecord.subscript.getter(1953259891, 0xE400000000000000);
  if (!v22
    || (v111 = v22,
        v23 = sub_1000110C4(&qword_10004E808),
        v22 = swift_dynamicCast(&v109, &v111, v23, &type metadata for Data, 6),
        (v22 & 1) == 0))
  {
    v56 = static os_log_type_t.error.getter(v22);
    v57 = (void *)*sub_10001853C();
    v58 = sub_1000110C4(&qword_10004DC40);
    v59 = swift_allocObject(v58, 72, 7);
    *(_OWORD *)(v59 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v59 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v59 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v59 + 32) = a1;
    v60 = a1;
    v61 = v57;
    os_log(_:dso:log:_:_:)(v56, &_mh_execute_header, v61, "CloudKit record has invalid salt: %@", 36, 2, v59);
    swift_unknownObjectRelease(v15);

    v62 = v59;
LABEL_36:
    swift_bridgeObjectRelease(v62);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_37;
  }
  v24 = v109;
  v25 = v110;
  v26 = CKRecord.subscript.getter(1702521203, 0xE400000000000000);
  if (!v26 || (v109 = v26, v26 = swift_dynamicCast(&v111, &v109, v23, &type metadata for UInt64, 6), (v26 & 1) == 0))
  {
    LODWORD(v107) = static os_log_type_t.error.getter(v26);
    v106 = (id)*sub_10001853C();
    v63 = sub_1000110C4(&qword_10004DC40);
    v64 = swift_allocObject(v63, 72, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100036CA0;
    v65 = v25;
    *(_QWORD *)(v64 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 32) = a1;
    v66 = a1;
    v67 = v106;
    os_log(_:dso:log:_:_:)(v107, &_mh_execute_header, v67, "CloudKit record has invalid size: %@", 36, 2, v64);
LABEL_33:
    v70 = v24;
    v71 = v65;
LABEL_34:
    sub_10000EE2C(v70, v71);
    swift_unknownObjectRelease(v15);

LABEL_35:
    v62 = v64;
    goto LABEL_36;
  }
  v27 = (void *)v111;
  v28 = CKRecord.subscript.getter(0x5F736C6961746564, 0xEC000000656E6F7ALL);
  if (!v28 || (v111 = v28, v28 = swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6), (v28 & 1) == 0))
  {
    LODWORD(v107) = static os_log_type_t.error.getter(v28);
    v106 = (id)*sub_10001853C();
    v68 = sub_1000110C4(&qword_10004DC40);
    v64 = swift_allocObject(v68, 72, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100036CA0;
    v65 = v25;
    *(_QWORD *)(v64 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 32) = a1;
    v69 = a1;
    v67 = v106;
    os_log(_:dso:log:_:_:)(v107, &_mh_execute_header, v67, "CloudKit record has invalid details zone: %@", 44, 2, v64);
    goto LABEL_33;
  }
  v106 = v27;
  v29 = v110;
  v103 = v109;
  v30 = CKRecord.subscript.getter(0x5F73657461647075, 0xEC000000656E6F7ALL);
  v104 = v24;
  v105 = v25;
  if (!v30)
  {
    v73 = v29;
LABEL_41:
    v74 = swift_bridgeObjectRelease(v73);
    v75 = static os_log_type_t.error.getter(v74);
    v76 = (void *)*sub_10001853C();
    v77 = sub_1000110C4(&qword_10004DC40);
    v64 = swift_allocObject(v77, 72, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v64 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 32) = a1;
    v78 = a1;
    v67 = v76;
    os_log(_:dso:log:_:_:)(v75, &_mh_execute_header, v67, "CloudKit record has invalid update zone: %@", 43, 2, v64);
LABEL_44:
    v70 = v104;
    v71 = v105;
    goto LABEL_34;
  }
  v107 = v29;
  v111 = v30;
  if ((swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6) & 1) == 0)
  {
    v73 = v107;
    goto LABEL_41;
  }
  v31 = v110;
  v102 = v109;
  v32 = CKRecord.subscript.getter(25705, 0xE200000000000000);
  if (!v32 || (v111 = v32, (swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6) & 1) == 0))
  {
    swift_bridgeObjectRelease(v31);
    v79 = swift_bridgeObjectRelease(v107);
    v80 = static os_log_type_t.error.getter(v79);
    v81 = (void *)*sub_10001853C();
    v82 = sub_1000110C4(&qword_10004DC40);
    v64 = swift_allocObject(v82, 72, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v64 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 32) = a1;
    v83 = a1;
    v67 = v81;
    os_log(_:dso:log:_:_:)(v80, &_mh_execute_header, v67, "CloudKit record has invalid id: %@", 34, 2, v64);
    goto LABEL_44;
  }
  v34 = v109;
  v33 = v110;
  v35 = CKRecord.subscript.getter(0x687469726F676C61, 0xEE00656D616E5F6DLL);
  if (!v35 || (v111 = v35, (swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6) & 1) == 0))
  {
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v31);
    v84 = swift_bridgeObjectRelease(v107);
    v85 = static os_log_type_t.error.getter(v84);
    v86 = (void *)*sub_10001853C();
    v87 = sub_1000110C4(&qword_10004DC40);
    v64 = swift_allocObject(v87, 72, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v64 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 32) = a1;
    v88 = a1;
    v67 = v86;
    os_log(_:dso:log:_:_:)(v85, &_mh_execute_header, v67, "CloudKit record has invalid algorithm: %@", 41, 2, v64);
    goto LABEL_44;
  }
  v100 = v109;
  v101 = v110;
  v36 = CKRecord.subscript.getter(0xD000000000000010, 0x800000010003B090);
  if (!v36 || (v109 = v36, (swift_dynamicCast(&v111, &v109, v23, &type metadata for Int, 6) & 1) == 0))
  {
    swift_bridgeObjectRelease(v101);
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v31);
    v89 = swift_bridgeObjectRelease(v107);
    v90 = static os_log_type_t.error.getter(v89);
    v91 = (void *)*sub_10001853C();
    v92 = sub_1000110C4(&qword_10004DC40);
    v64 = swift_allocObject(v92, 72, 7);
    *(_OWORD *)(v64 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v64 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v64 + 32) = a1;
    v93 = v91;
    v94 = a1;
    os_log(_:dso:log:_:_:)(v90, &_mh_execute_header, v93, "CloudKit record has invalid bitsPerEntry count: %@", 50, 2, v64);
    sub_10000EE2C(v104, v105);
    swift_unknownObjectRelease(v15);

    goto LABEL_35;
  }
  v99 = v111;
  v37 = CKRecord.subscript.getter(0x73736572706D6F63, 0xEB000000006E6F69);
  if (v37)
  {
    v111 = v37;
    v38 = swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6);
    if (v38)
      v39 = v109;
    else
      v39 = 0;
    if (v38)
      v40 = v110;
    else
      v40 = 0;
  }
  else
  {
    v39 = 0;
    v40 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v97 = v33;
  v95 = v108;
  sub_10002F800((uint64_t)v11, v104, v105, (uint64_t)v106, v103, v107, v102, v31, v108, v34, v97, v100, v101, v99, v39, v40);
  swift_unknownObjectRelease(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  v96 = type metadata accessor for BloomFilterRecord(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v96 - 8) + 56))(v95, 0, 1, v96);
}

uint64_t sub_1000247B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = sub_1000110C4(&qword_10004E810);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v39 - v12;
  v14 = CKRecord.subscript.getter(0x64616F6C796170, 0xE700000000000000);
  if (!v14)
    goto LABEL_7;
  v15 = v14;
  v16 = objc_opt_self(CKAsset);
  v17 = (void *)swift_dynamicCastObjCClass(v15, v16);
  if (!v17)
  {
    v14 = swift_unknownObjectRelease(v15);
LABEL_7:
    v24 = static os_log_type_t.error.getter(v14);
    v25 = (void *)*sub_10001853C();
    v26 = sub_1000110C4(&qword_10004DC40);
    v27 = swift_allocObject(v26, 72, 7);
    *(_OWORD *)(v27 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v27 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v27 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
    *(_QWORD *)(v27 + 32) = a1;
    v28 = v25;
    v29 = a1;
    os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v28, "CloudKit record has invalid payload field: %@", 45, 2, v27);

    swift_bridgeObjectRelease(v27);
    v30 = type metadata accessor for DocumentCheckerRecord(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(a2, 1, 1, v30);
  }
  v18 = v17;
  v19 = objc_msgSend(v17, "fileURL");
  if (v19)
  {
    v20 = v19;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

    v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v21(v6, v11, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      v21(v13, v6, v7);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      sub_10002F924((uint64_t)v11, a2);
      swift_unknownObjectRelease(v15);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      v22 = type metadata accessor for DocumentCheckerRecord(0);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a2, 0, 1, v22);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  v31 = sub_100020234((uint64_t)v6, &qword_10004E810);
  v32 = static os_log_type_t.error.getter(v31);
  v33 = (void *)*sub_10001853C();
  v34 = sub_1000110C4(&qword_10004DC40);
  v35 = swift_allocObject(v34, 72, 7);
  *(_OWORD *)(v35 + 16) = xmmword_100036CA0;
  *(_QWORD *)(v35 + 56) = sub_100028DD0(0, &qword_10004E818, CKAsset_ptr);
  *(_QWORD *)(v35 + 64) = sub_100028A44(&qword_10004E820, &qword_10004E818, CKAsset_ptr);
  *(_QWORD *)(v35 + 32) = v18;
  v36 = v33;
  swift_unknownObjectRetain(v15, v37);
  os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v36, "CloudKit asset doesn't have a file URL: %@", 42, 2, v35);

  swift_bridgeObjectRelease(v35);
  swift_unknownObjectRelease(v15);
  v38 = type metadata accessor for DocumentCheckerRecord(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(a2, 1, 1, v38);
}

id sub_100024BB4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  _BYTE v13[24];

  swift_beginAccess(v1 + 2, v13, 0, 0);
  v3 = (void *)v1[2];
  v4 = (void *)v1[3];
  v5 = (void *)v1[4];
  v6 = (void *)v1[5];
  v12 = (id)v1[6];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v12;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  return v12;
}

void sub_100024C2C(uint64_t a1)
{
  _QWORD *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  _BYTE v9[24];

  swift_beginAccess(v1 + 2, v9, 1, 0);
  v3 = (void *)v1[2];
  v4 = (void *)v1[3];
  v5 = (void *)v1[4];
  v6 = (void *)v1[5];
  v7 = (void *)v1[6];
  v8 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v1 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v1 + 2) = v8;
  v1[6] = *(_QWORD *)(a1 + 32);

}

uint64_t sub_100024CA4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];
  uint64_t v7;

  v3 = swift_allocObject(v1, 56, 7);
  sub_10001D998(a1, v6);
  v4 = v6[1];
  *(_OWORD *)(v3 + 16) = v6[0];
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v7;
  return v3;
}

__n128 sub_100024D00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = swift_allocObject(v1, 56, 7);
  result = *(__n128 *)a1;
  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(a1 + 32);
  return result;
}

uint64_t sub_100024D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v7;
  NSString v8;
  id v9;
  uint64_t (*v10)(_BYTE *);
  void (*v11)(_BYTE *, _QWORD);
  uint64_t v12;
  void *v13;
  id v14;
  NSString v15;
  id v16;
  uint64_t (*v17)(_BYTE *, _QWORD);
  uint64_t v18;
  void *v19;
  _BYTE v21[32];

  v7 = objc_allocWithZone((Class)CKRecordZone);
  swift_bridgeObjectRetain(a2);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v9 = objc_msgSend(v7, "initWithZoneName:", v8);

  v10 = *(uint64_t (**)(_BYTE *))(*(_QWORD *)v4 + 104);
  v11 = (void (*)(_BYTE *, _QWORD))v10(v21);
  v13 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v9;

  v11(v21, 0);
  v14 = objc_allocWithZone((Class)CKRecordZone);
  swift_bridgeObjectRetain(a4);
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  v16 = objc_msgSend(v14, "initWithZoneName:", v15);

  v17 = (uint64_t (*)(_BYTE *, _QWORD))v10(v21);
  v19 = *(void **)(v18 + 32);
  *(_QWORD *)(v18 + 32) = v16;

  return v17(v21, 0);
}

id sub_100024E64@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id result;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v9 = sub_1000110C4(&qword_10004E630);
  __chkstk_darwin(v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_1000263D8(a1, a2, a3);
  if (!v4)
  {
    v13 = result;
    if (result)
    {
      v26 = CKRecord.subscript.getter(0x7367616C66, 0xE500000000000000);
      v14 = CKRecord.subscript.getter(0x6E6F73616572, 0xE600000000000000);
      v15 = objc_msgSend(v13, "creationDate");
      if (v15)
      {
        v16 = v15;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        v17 = type metadata accessor for Date(0);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 0, 1, v17);
      }
      else
      {
        v19 = type metadata accessor for Date(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v11, 1, 1, v19);
      }
      v20 = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
      CKRecordKeyValueSetting.subscript.getter(&v24, 25195, 0xE200000000000000, v20, &type metadata for String, &protocol witness table for String);
      v21 = v25;
      v22 = a4;
      v23 = v26;
      sub_1000235E0(a1, a2, a3, v26, v14, (uint64_t)v11, v24, v25, v22);

      swift_bridgeObjectRelease(v21);
      swift_unknownObjectRelease(v14);
      swift_unknownObjectRelease(v23);
      return (id)sub_100020234((uint64_t)v11, &qword_10004E630);
    }
    else
    {
      v18 = type metadata accessor for LaunchWarningDetails(0);
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a4, 1, 1, v18);
    }
  }
  return result;
}

void sub_100025070(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  Swift::String v26;
  id v27;
  Class isa;
  id v29;
  uint64_t v30;
  void (*v31)(_QWORD *__return_ptr);
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BOOL8 v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  CKFetchRecordZoneChangesOperation v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  id *v105;
  id *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  __int128 v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  unsigned int v117;
  _BOOL8 v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD v128[3];
  void *v129;
  _QWORD v130[3];
  uint64_t v131;
  uint64_t v132;
  _QWORD v133[3];
  uint64_t v134;
  uint64_t v135;
  _QWORD v136[3];
  uint64_t v137;
  uint64_t v138;
  id v139[3];
  uint64_t v140;
  uint64_t v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148[2];
  id v149;
  Swift::OpaquePointer_optional v150;
  Swift::OpaquePointer_optional v151;

  v110 = a3;
  v4 = v3;
  v7 = sub_1000110C4(&qword_10004E640);
  v8 = __chkstk_darwin(v7);
  v108 = (char *)&v104 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v109 = (char *)&v104 - v10;
  v11 = sub_1000110C4(&qword_10004E648);
  v12 = __chkstk_darwin(v11);
  v111 = (uint64_t)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v116 = (uint64_t)&v104 - v14;
  v15 = swift_allocObject(&unk_100047478, 32, 7);
  v120 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_100036FE0;
  v107 = v15 + 16;
  v16 = swift_allocObject(&unk_1000474A0, 24, 7);
  v121 = v16;
  *(_QWORD *)(v16 + 16) = 0;
  v105 = (id *)(v16 + 16);
  v17 = swift_allocObject(&unk_1000474A0, 24, 7);
  v125 = v17;
  *(_QWORD *)(v17 + 16) = 0;
  v106 = (id *)(v17 + 16);
  v18 = swift_allocObject(&unk_1000474C8, 24, 7);
  v124 = v18;
  *(_QWORD *)(v18 + 16) = 0;
  v119 = (uint64_t *)(v18 + 16);
  v19 = objc_msgSend(objc_allocWithZone((Class)CKFetchRecordZoneChangesConfiguration), "init");
  v122 = v19;
  v123 = v4;
  if (a2 >> 60 != 15)
  {
    v20 = sub_10000ED74(a1, a2);
    v21 = static os_log_type_t.info.getter(v20);
    v22 = (void *)*sub_10001853C();
    v23 = sub_1000110C4(&qword_10004DC40);
    v24 = swift_allocObject(v23, 72, 7);
    *(_OWORD *)(v24 + 16) = xmmword_100036CA0;
    v25 = v22;
    v26 = Data.base64EncodedString(options:)(0);
    *(_QWORD *)(v24 + 56) = &type metadata for String;
    *(_QWORD *)(v24 + 64) = sub_100012364();
    *(Swift::String *)(v24 + 32) = v26;
    os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, v25, "Base asset sync with token: %@", 30, 2, v24);

    swift_bridgeObjectRelease(v24);
    v27 = objc_allocWithZone((Class)CKServerChangeToken);
    sub_10000ED74(a1, a2);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v29 = objc_msgSend(v27, "initWithData:", isa);
    sub_10000F2D8(a1, a2);

    v19 = v122;
    v4 = v123;
    objc_msgSend(v122, "setPreviousServerChangeToken:", v29);

    sub_10000F2D8(a1, a2);
  }
  v30 = CKFetchRecordZoneChangesConfiguration.desiredKeys.setter(&off_100047348);
  v31 = *(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v4 + 88);
  ((void (*)(_QWORD *__return_ptr, uint64_t))v31)(v130, v30);
  v32 = (void *)v130[0];
  v33 = (id)v130[2];

  v34 = (void *)v130[1];
  sub_100028E08((uint64_t)&v131, (uint64_t)&v149, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v149);
  sub_100028E08((uint64_t)&v132, (uint64_t)v148, (uint64_t *)&unk_10004E650);
  sub_100026C30(v148);
  v35 = objc_msgSend(v33, "zoneID");

  if (((unint64_t)&_swiftEmptyDictionarySingleton & 0xC000000000000001) != 0)
  {
    if ((uint64_t)&_swiftEmptyDictionarySingleton < 0)
      v38 = &_swiftEmptyDictionarySingleton;
    else
      v38 = (void *)((unint64_t)&_swiftEmptyDictionarySingleton & 0xFFFFFFFFFFFFFF8);
    v39 = v19;
    v40 = __CocoaDictionary.count.getter(v38);
    if (__OFADD__(v40, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    v37 = (void *)sub_100027058((uint64_t)v38, v40 + 1);
  }
  else
  {
    v36 = v19;
    v37 = &_swiftEmptyDictionarySingleton;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v37);
  v129 = v37;
  sub_1000275A8((uint64_t)v19, v35, isUniquelyReferenced_nonNull_native);
  v118 = (_BOOL8)v129;

  v42 = swift_bridgeObjectRelease(0x8000000000000000);
  v117 = static os_log_type_t.info.getter(v42);
  v115 = sub_10001853C();
  v43 = (void *)*v115;
  v114 = sub_1000110C4(&qword_10004DC40);
  v44 = swift_allocObject(v114, 72, 7);
  v113 = xmmword_100036CA0;
  *(_OWORD *)(v44 + 16) = xmmword_100036CA0;
  v45 = v43;
  v31(v133);
  v46 = (void *)v133[0];
  v47 = (id)v133[2];

  v48 = (void *)v133[1];
  sub_100028E08((uint64_t)&v134, (uint64_t)&v147, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v147);
  sub_100028E08((uint64_t)&v135, (uint64_t)&v146, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v146);
  v49 = objc_msgSend(v47, "zoneID");

  v50 = objc_msgSend(v49, "zoneName");
  v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
  v53 = v52;

  *(_QWORD *)(v44 + 56) = &type metadata for String;
  v112 = sub_100012364();
  *(_QWORD *)(v44 + 64) = v112;
  *(_QWORD *)(v44 + 32) = v51;
  *(_QWORD *)(v44 + 40) = v53;
  os_log(_:dso:log:_:_:)(v117, &_mh_execute_header, v45, "Starting sync of zone: %@", 25, 2, v44);

  swift_bridgeObjectRelease(v44);
  sub_100028DD0(0, &qword_10004E668, CKFetchRecordZoneChangesOperation_ptr);
  v54 = sub_1000110C4((uint64_t *)&unk_10004E670);
  v55 = swift_allocObject(v54, 40, 7);
  *(_OWORD *)(v55 + 16) = xmmword_100037EA0;
  v56 = v118;
  v31(v136);
  v57 = (void *)v136[0];
  v58 = (id)v136[2];

  v59 = (void *)v136[1];
  sub_100028E08((uint64_t)&v137, (uint64_t)&v145, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v145);
  sub_100028E08((uint64_t)&v138, (uint64_t)&v144, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v144);
  v60 = objc_msgSend(v58, "zoneID");

  *(_QWORD *)(v55 + 32) = v60;
  v129 = (void *)v55;
  specialized Array._endMutation()();
  v61 = v129;
  swift_bridgeObjectRetain(v56);
  v150.value._rawValue = v61;
  v150.is_nil = v56;
  v62.super.super.super.super.isa = CKFetchRecordZoneChangesOperation.init(recordZoneIDs:configurationsByRecordZoneID:)(v150, v151).super.super.super.super.isa;
  v63 = (_QWORD *)swift_allocObject(&unk_1000474F0, 40, 7);
  v65 = v124;
  v64 = v125;
  v66 = v121;
  v63[2] = v124;
  v63[3] = v66;
  v63[4] = v64;
  swift_retain(v65);
  swift_retain(v66);
  swift_retain(v64);
  CKFetchRecordZoneChangesOperation.recordWasChangedBlock.setter(sub_10002773C, v63);
  v67 = swift_allocObject(&unk_100047518, 32, 7);
  v68 = v120;
  *(_QWORD *)(v67 + 16) = v120;
  *(_QWORD *)(v67 + 24) = v65;
  swift_retain(v65);
  swift_retain(v68);
  CKFetchRecordZoneChangesOperation.recordZoneFetchResultBlock.setter(sub_100027B04, v67);
  v69 = -[objc_class configuration](v62.super.super.super.super.isa, "configuration");
  if (!v69)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v70 = v69;
  objc_msgSend(v69, "setQualityOfService:", 25);

  v71 = -[objc_class configuration](v62.super.super.super.super.isa, "configuration");
  if (!v71)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v72 = v71;
  objc_msgSend(v71, "setTimeoutIntervalForRequest:", 10.0);

  v73 = -[objc_class configuration](v62.super.super.super.super.isa, "configuration");
  if (!v73)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v74 = v73;
  objc_msgSend(v73, "setTimeoutIntervalForResource:", 60.0);

  v75 = -[objc_class configuration](v62.super.super.super.super.isa, "configuration");
  if (!v75)
  {
LABEL_26:
    __break(1u);
    return;
  }
  v76 = v75;
  swift_bridgeObjectRelease(v56);
  objc_msgSend(v76, "setPreferAnonymousRequests:", 1);

  v31(v139);
  v77 = v139[1];

  sub_100028E08((uint64_t)&v140, (uint64_t)&v143, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v143);
  sub_100028E08((uint64_t)&v141, (uint64_t)&v142, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v142);
  objc_msgSend(v77, "addOperation:", v62.super.super.super.super.isa);

  -[objc_class waitUntilFinished](v62.super.super.super.super.isa, "waitUntilFinished");
  v78 = v119;
  swift_beginAccess(v119, &v129, 0, 0);
  v79 = *v78;
  if (v79)
  {
    v80 = swift_errorRetain(v79);
    v81 = static os_log_type_t.error.getter(v80);
    v82 = (void *)*v115;
    v83 = swift_allocObject(v114, 72, 7);
    *(_OWORD *)(v83 + 16) = v113;
    v128[0] = v79;
    swift_errorRetain(v79);
    v84 = v82;
    v85 = sub_1000110C4(&qword_10004DE40);
    v86 = String.init<A>(describing:)(v128, v85);
    v87 = v112;
    *(_QWORD *)(v83 + 56) = &type metadata for String;
    *(_QWORD *)(v83 + 64) = v87;
    *(_QWORD *)(v83 + 32) = v86;
    *(_QWORD *)(v83 + 40) = v88;
    os_log(_:dso:log:_:_:)(v81, &_mh_execute_header, v84, "Sync error: %@", 14, 2, v83);

    v89 = swift_bridgeObjectRelease(v83);
    swift_willThrow(v89);
    swift_release(v68);
    swift_release(v66);
    swift_release(v125);
    swift_release(v124);

  }
  else
  {
    v90 = type metadata accessor for BloomFilterRecord(0);
    v91 = v116;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v116, 1, 1, v90);
    v92 = v105;
    swift_beginAccess(v105, v128, 0, 0);
    if (*v92)
    {
      v93 = *v92;
      v94 = v111;
      sub_100023B98(v93, v111);

      sub_100020234(v91, &qword_10004E648);
      sub_100028E08(v94, v91, &qword_10004E648);
    }
    v95 = type metadata accessor for DocumentCheckerRecord(0);
    v96 = (uint64_t)v109;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v95 - 8) + 56))(v109, 1, 1, v95);
    v97 = v106;
    swift_beginAccess(v106, &v127, 0, 0);
    v98 = (uint64_t)v108;
    if (*v97)
    {
      v99 = *v97;
      sub_1000247B8(v99, v98);

      sub_100020234(v96, &qword_10004E640);
      sub_100028E08(v98, v96, &qword_10004E640);
    }
    v100 = v116;
    v101 = v111;
    sub_10001E9EC(v116, v111, &qword_10004E648);
    sub_10001E9EC(v96, v98, &qword_10004E640);
    swift_beginAccess(v107, &v126, 0, 0);
    v102 = *(_QWORD *)(v68 + 16);
    v103 = *(_QWORD *)(v68 + 24);
    sub_10000EE70(v102, v103);
    sub_10002F988(v101, v98, v102, v103, v110);

    sub_100020234(v96, &qword_10004E640);
    sub_100020234(v100, &qword_10004E648);
    swift_release(v68);
    swift_release(v121);
    swift_release(v125);
    swift_release(v124);
  }
}

id sub_100025B98(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  Swift::String v17;
  id v18;
  Class isa;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  void *v29;
  id v30;
  id result;
  char isUniquelyReferenced_nonNull_native;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  CKFetchRecordZoneChangesOperation v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  unsigned int v57;
  void *v58;
  void (*v59)(id *__return_ptr);
  _QWORD *v60;
  id v63;
  id v64;
  uint64_t v65;
  _BYTE v66[24];
  _QWORD v67[3];
  uint64_t v68[3];
  _QWORD v69[3];
  uint64_t v70;
  uint64_t v71;
  id v72[3];
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78[2];
  void *v79;
  Swift::OpaquePointer_optional v80;
  Swift::OpaquePointer_optional v81;

  v7 = swift_allocObject(&unk_100047540, 17, 7);
  *(_BYTE *)(v7 + 16) = 0;
  v65 = swift_allocObject(&unk_100047478, 32, 7);
  *(_OWORD *)(v65 + 16) = xmmword_100036FE0;
  v8 = swift_allocObject(&unk_1000474C8, 24, 7);
  *(_QWORD *)(v8 + 16) = 0;
  v60 = (_QWORD *)(v8 + 16);
  v59 = *(void (**)(id *__return_ptr))(*(_QWORD *)v4 + 88);
  v59((id *)v69);
  sub_100028E08((uint64_t)&v70, (uint64_t)v78, (uint64_t *)&unk_10004E650);
  v9 = (void *)v69[0];
  sub_100027B4C(v78);

  sub_100026C30(v78);
  sub_100028E08((uint64_t)&v71, (uint64_t)&v77, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v77);
  v10 = sub_100028E08((uint64_t)v78, (uint64_t)&v79, (uint64_t *)&unk_10004E650);
  v63 = v79;
  if (!v79)
  {
    v24 = static os_log_type_t.default.getter(v10);
    v25 = (id)*sub_10001853C();
    os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Update zone sync with no configured zone", 40, 2, &_swiftEmptyArrayStorage);

    v26 = sub_100027B74();
    v27 = swift_allocError(&type metadata for CloudKitError, v26, 0, 0);
    *v28 = 3;
    swift_willThrow(v27);
    swift_release(v7);
    swift_release(v65);
    swift_release(v8);
    return (id)(v8 & 1);
  }
  v11 = objc_msgSend(objc_allocWithZone((Class)CKFetchRecordZoneChangesConfiguration), "init");
  if (a4 >> 60 != 15)
  {
    v12 = sub_10000ED74(a3, a4);
    v57 = static os_log_type_t.info.getter(v12);
    v13 = (void *)*sub_10001853C();
    v14 = sub_1000110C4(&qword_10004DC40);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_100036CA0;
    v16 = v13;
    v17 = Data.base64EncodedString(options:)(0);
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_100012364();
    *(Swift::String *)(v15 + 32) = v17;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v16, "Update zone sync with token: %@", 31, 2, v15);

    swift_bridgeObjectRelease(v15);
    v18 = objc_allocWithZone((Class)CKServerChangeToken);
    sub_10000ED74(a3, a4);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v20 = objc_msgSend(v18, "initWithData:", isa);
    sub_10000F2D8(a3, a4);

    objc_msgSend(v11, "setPreviousServerChangeToken:", v20);
    sub_10000F2D8(a3, a4);
  }
  CKFetchRecordZoneChangesConfiguration.desiredKeys.setter(&off_1000473F8);
  v21 = objc_msgSend(v63, "zoneID");
  if (((unint64_t)&_swiftEmptyDictionarySingleton & 0xC000000000000001) != 0)
  {
    if ((uint64_t)&_swiftEmptyDictionarySingleton < 0)
      v29 = &_swiftEmptyDictionarySingleton;
    else
      v29 = (void *)((unint64_t)&_swiftEmptyDictionarySingleton & 0xFFFFFFFFFFFFFF8);
    v30 = v11;
    result = (id)__CocoaDictionary.count.getter(v29);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    v23 = (void *)sub_100027058((uint64_t)v29, (uint64_t)result + 1);
  }
  else
  {
    v22 = v11;
    v23 = &_swiftEmptyDictionarySingleton;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v23);
  v58 = v11;
  sub_1000275A8((uint64_t)v11, v21, isUniquelyReferenced_nonNull_native);
  v33 = (_BOOL8)v23;

  swift_bridgeObjectRelease(0x8000000000000000);
  sub_100028DD0(0, &qword_10004E668, CKFetchRecordZoneChangesOperation_ptr);
  v34 = sub_1000110C4((uint64_t *)&unk_10004E670);
  v35 = swift_allocObject(v34, 40, 7);
  *(_OWORD *)(v35 + 16) = xmmword_100037EA0;
  *(_QWORD *)(v35 + 32) = objc_msgSend(v63, "zoneID");
  v68[0] = v35;
  specialized Array._endMutation()();
  swift_bridgeObjectRetain(v33);
  v80.value._rawValue = (void *)v35;
  v80.is_nil = v33;
  v36.super.super.super.super.isa = CKFetchRecordZoneChangesOperation.init(recordZoneIDs:configurationsByRecordZoneID:)(v80, v81).super.super.super.super.isa;
  v37 = (_QWORD *)swift_allocObject(&unk_100047568, 48, 7);
  v37[2] = v8;
  v37[3] = v7;
  v37[4] = a1;
  v37[5] = a2;
  swift_retain(v8);
  swift_retain(v7);
  swift_retain(a2);
  CKFetchRecordZoneChangesOperation.recordWasChangedBlock.setter(sub_100027BEC, v37);
  v38 = swift_allocObject(&unk_100047590, 32, 7);
  *(_QWORD *)(v38 + 16) = v65;
  *(_QWORD *)(v38 + 24) = v8;
  swift_retain(v8);
  swift_retain(v65);
  CKFetchRecordZoneChangesOperation.recordZoneFetchResultBlock.setter(sub_100028400, v38);
  result = -[objc_class configuration](v36.super.super.super.super.isa, "configuration");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v39 = result;
  objc_msgSend(result, "setQualityOfService:", 25);

  result = -[objc_class configuration](v36.super.super.super.super.isa, "configuration");
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v40 = result;
  objc_msgSend(result, "setTimeoutIntervalForRequest:", 10.0);

  result = -[objc_class configuration](v36.super.super.super.super.isa, "configuration");
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v41 = result;
  objc_msgSend(result, "setTimeoutIntervalForResource:", 60.0);

  result = -[objc_class configuration](v36.super.super.super.super.isa, "configuration");
  if (result)
  {
    v42 = result;
    v64 = (id)v8;
    swift_bridgeObjectRelease(v33);
    objc_msgSend(v42, "setPreferAnonymousRequests:", 1);

    v59(v72);
    v43 = v72[1];

    sub_100028E08((uint64_t)&v73, (uint64_t)&v76, (uint64_t *)&unk_10004E650);
    sub_100026C30(&v76);
    sub_100028E08((uint64_t)&v74, (uint64_t)&v75, (uint64_t *)&unk_10004E650);
    sub_100026C30(&v75);
    objc_msgSend(v43, "addOperation:", v36.super.super.super.super.isa);

    -[objc_class waitUntilFinished](v36.super.super.super.super.isa, "waitUntilFinished");
    swift_beginAccess(v60, v68, 0, 0);
    v44 = *v60;
    if (*v60)
    {
      v45 = swift_errorRetain(*v60);
      v8 = static os_log_type_t.error.getter(v45);
      v46 = (void *)*sub_10001853C();
      v47 = sub_1000110C4(&qword_10004DC40);
      v48 = swift_allocObject(v47, 72, 7);
      *(_OWORD *)(v48 + 16) = xmmword_100036CA0;
      v67[0] = v44;
      swift_errorRetain(v44);
      v49 = v46;
      v50 = sub_1000110C4(&qword_10004DE40);
      v51 = v7;
      v52 = String.init<A>(describing:)(v67, v50);
      v54 = v53;
      *(_QWORD *)(v48 + 56) = &type metadata for String;
      *(_QWORD *)(v48 + 64) = sub_100012364();
      *(_QWORD *)(v48 + 32) = v52;
      *(_QWORD *)(v48 + 40) = v54;
      os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v49, "Update sync error: %@", 21, 2, v48);

      v55 = swift_bridgeObjectRelease(v48);
      swift_willThrow(v55);
      sub_100026C30(v78);
      swift_release(v51);
      swift_release(v65);
      swift_release(v64);

    }
    else
    {
      swift_beginAccess(v7 + 16, v67, 0, 0);
      v56 = *(_BYTE *)(v7 + 16);
      swift_beginAccess(v65 + 16, v66, 0, 0);
      sub_10000EE70(*(_QWORD *)(v65 + 16), *(_QWORD *)(v65 + 24));
      LOBYTE(v8) = sub_10002FA00(v56);
      sub_100026C30(v78);
      swift_release(v7);
      swift_release(v65);
      swift_release(v64);

    }
    return (id)(v8 & 1);
  }
LABEL_24:
  __break(1u);
  return result;
}

id sub_1000263D8(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  void *v4;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  Swift::String v12;
  void *object;
  Swift::String v14;
  Swift::String v15;
  void *v16;
  id v17;
  Swift::String v18;
  Class isa;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  objc_class *v27;
  Class v28;
  id v29;
  id result;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSString v36;
  id v37;
  uint64_t v38;
  int v39;
  id v40;
  uint64_t v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  id *v66;
  void (*v67)(id *__return_ptr);
  void *v68;
  void *v69;
  _QWORD v70[3];
  _QWORD v71[3];
  uint64_t v72;
  uint64_t v73;
  id v74[3];
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80[2];
  void *v81;

  v4 = v3;
  v67 = *(void (**)(id *__return_ptr))(*(_QWORD *)v3 + 88);
  v67((id *)v71);
  sub_100028E08((uint64_t)&v73, (uint64_t)v80, (uint64_t *)&unk_10004E650);
  v8 = (void *)v71[0];
  sub_100027B4C(v80);

  sub_100028E08((uint64_t)&v72, (uint64_t)&v79, (uint64_t *)&unk_10004E650);
  sub_100026C30(&v79);
  sub_100026C30(v80);
  v9 = sub_100028E08((uint64_t)v80, (uint64_t)&v81, (uint64_t *)&unk_10004E650);
  v10 = v81;
  if (!v81)
  {
    v41 = static os_log_type_t.error.getter(v9);
    v42 = (id)*sub_10001853C();
    os_log(_:dso:log:_:_:)(v41, &_mh_execute_header, v42, "Attempt to fetch warning details with no zone", 45, 2, &_swiftEmptyArrayStorage);

    v43 = sub_100027B74();
    v44 = swift_allocError(&type metadata for CloudKitError, v43, 0, 0);
    *v45 = 1;
    swift_willThrow(v44);
    return v4;
  }
  v11 = swift_allocObject(&unk_100047670, 25, 7);
  *(_QWORD *)(v11 + 16) = 0;
  *(_BYTE *)(v11 + 24) = -1;
  v70[0] = 0x73616864632F3176;
  v70[1] = 0xEA00000000002F68;
  LODWORD(v69) = a3;
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, &protocol witness table for UInt32);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  v14._countAndFlagsBits = 47;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  sub_100010E8C(a1, a2);
  v16 = v15._object;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v16);
  sub_100028DD0(0, &qword_10004E788, CKRecordID_ptr);
  swift_bridgeObjectRetain(0xEA00000000002F68);
  v17 = objc_msgSend(v10, "zoneID");
  v18._countAndFlagsBits = 0x73616864632F3176;
  v18._object = (void *)0xEA00000000002F68;
  isa = CKRecordID.init(recordName:zoneID:)(v18, (CKRecordZoneID)v17).super.isa;
  v20 = static os_log_type_t.info.getter(isa);
  v66 = (id *)sub_10001853C();
  v21 = *v66;
  v64 = sub_1000110C4(&qword_10004DC40);
  v22 = swift_allocObject(v64, 72, 7);
  *(_OWORD *)(v22 + 16) = xmmword_100036CA0;
  *(_QWORD *)(v22 + 56) = &type metadata for String;
  v65 = sub_100012364();
  *(_QWORD *)(v22 + 64) = v65;
  *(_QWORD *)(v22 + 32) = 0x73616864632F3176;
  *(_QWORD *)(v22 + 40) = 0xEA00000000002F68;
  v23 = v21;
  os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, v23, "CloudKit fetch for warning: %@", 30, 2, v22);

  swift_bridgeObjectRelease(v22);
  v24 = sub_1000110C4((uint64_t *)&unk_10004E670);
  v25 = swift_allocObject(v24, 40, 7);
  *(_OWORD *)(v25 + 16) = xmmword_100037EA0;
  *(_QWORD *)(v25 + 32) = isa;
  v70[0] = v25;
  specialized Array._endMutation()();
  v26 = objc_allocWithZone((Class)CKFetchRecordsOperation);
  v27 = isa;
  v28 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v70[0]);
  v29 = objc_msgSend(v26, "initWithRecordIDs:", v28);

  swift_retain(v11);
  CKFetchRecordsOperation.perRecordResultBlock.setter(sub_100028E80, v11);
  result = objc_msgSend(v29, "configuration");
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }
  v31 = result;
  objc_msgSend(result, "setQualityOfService:", 25);

  result = objc_msgSend(v29, "configuration");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v32 = result;
  objc_msgSend(result, "setTimeoutIntervalForRequest:", 10.0);

  result = objc_msgSend(v29, "configuration");
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v33 = result;
  objc_msgSend(result, "setTimeoutIntervalForResource:", 60.0);

  result = objc_msgSend(v29, "configuration");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v34 = result;
  objc_msgSend(result, "setPreferAnonymousRequests:", 1);

  result = objc_msgSend(v29, "configuration");
  if (result)
  {
    v35 = result;
    v36 = String._bridgeToObjectiveC()();
    objc_msgSend(v35, "set_sourceApplicationSecondaryIdentifier:", v36);

    v67(v74);
    v37 = v74[1];

    sub_100028E08((uint64_t)&v75, (uint64_t)&v78, (uint64_t *)&unk_10004E650);
    sub_100026C30(&v78);
    sub_100028E08((uint64_t)&v76, (uint64_t)&v77, (uint64_t *)&unk_10004E650);
    sub_100026C30(&v77);
    objc_msgSend(v37, "addOperation:", v29);

    objc_msgSend(v29, "waitUntilFinished");
    v38 = swift_beginAccess(v11 + 16, v70, 0, 0);
    v39 = *(unsigned __int8 *)(v11 + 24);
    if (v39 == 255)
    {
      v46 = static os_log_type_t.error.getter(v38);
      v47 = *v66;
      os_log(_:dso:log:_:_:)(v46, &_mh_execute_header, v47, "CloudKit results block never called.", 36, 2, &_swiftEmptyArrayStorage);

      v48 = sub_100027B74();
      v49 = swift_allocError(&type metadata for CloudKitError, v48, 0, 0);
      *v50 = 0;
      swift_willThrow(v49);
      swift_release(v11);

      sub_100026C30(v80);
    }
    else
    {
      v4 = *(void **)(v11 + 16);
      if ((v39 & 1) != 0)
      {
        v69 = *(void **)(v11 + 16);
        sub_100028EE8(v4, v39);
        sub_100028A84(v4, 1);
        sub_100028A84(v4, 1);
        v51 = sub_1000110C4(&qword_10004DE40);
        type metadata accessor for CKError(0);
        v53 = v52;
        v54 = swift_dynamicCast(&v68, &v69, v51, v52, 6);
        if ((v54 & 1) != 0
          && (v55 = v68,
              v56 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120), _BridgedStoredNSError.code.getter(&v69, v53, v56), v55, v69 == (void *)11))
        {
          sub_100028F00(v4, v39);
          sub_100028F00(v4, v39);
          swift_release(v11);

          sub_100026C30(v80);
          return 0;
        }
        else
        {
          v57 = static os_log_type_t.error.getter(v54);
          v58 = *v66;
          v59 = swift_allocObject(v64, 72, 7);
          *(_OWORD *)(v59 + 16) = xmmword_100036CA0;
          v69 = v4;
          sub_100028EE8(v4, v39);
          v60 = v58;
          v61 = String.init<A>(describing:)(&v69, v51);
          *(_QWORD *)(v59 + 56) = &type metadata for String;
          *(_QWORD *)(v59 + 64) = v65;
          *(_QWORD *)(v59 + 32) = v61;
          *(_QWORD *)(v59 + 40) = v62;
          os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v60, "CloudKit unexpected error during fetch: %@", 42, 2, v59);

          v63 = swift_bridgeObjectRelease(v59);
          swift_willThrow(v63);
          sub_100028F00(v4, v39);
          swift_release(v11);

          sub_100026C30(v80);
        }
      }
      else
      {
        v40 = v4;

        sub_100026C30(v80);
        swift_release(v11);

      }
    }
    return v4;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_100026BB4()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 != 15)
    sub_10000EE2C(*(_QWORD *)(v0 + 16), v1);
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026BE8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100026C0C()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

id *sub_100026C30(id *a1)
{

  return a1;
}

uint64_t sub_100026C58()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v0 + 40);
  v4 = *(void **)(v0 + 48);

  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_100026CAC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 136))();
}

uint64_t sub_100026CD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 144))();
}

uint64_t sub_100026CFC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 152))() & 1;
}

uint64_t sub_100026D34()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 128))();
}

id sub_100026D5C()
{
  id *v0;

  return *v0;
}

uint64_t sub_100026D64@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100026D6C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(CKErrorDomain);
}

uint64_t sub_100026D7C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100026DBC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100026DFC(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100026E60()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100026E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100026EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD v7[10];

  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

uint64_t sub_100026F40(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000123E4(&qword_10004E868, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1000380DC);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100026F80(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000123E4(&qword_10004E868, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1000380DC);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100026FC0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100027000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

Swift::Int sub_100027058(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int result;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a2)
  {
    sub_1000110C4(&qword_10004E830);
    v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    v30 = v4;
    v5 = __CocoaDictionary.makeIterator()(a1);
    v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      v8 = v6;
      v9 = v7;
      v10 = sub_100028DD0(0, &qword_10004E828, CKRecordZoneID_ptr);
      do
      {
        v28 = v8;
        swift_dynamicCast(&v29, &v28, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
        v27 = v9;
        v21 = sub_100028DD0(0, &qword_10004E838, CKFetchRecordZoneChangesConfiguration_ptr);
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v21, 7);
        v4 = v30;
        v22 = *(_QWORD *)(v30 + 16);
        if (*(_QWORD *)(v30 + 24) <= v22)
        {
          sub_1000272D8(v22 + 1, 1);
          v4 = v30;
        }
        v12 = v28;
        v11 = v29;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v14 = v4 + 64;
        v15 = -1 << *(_BYTE *)(v4 + 32);
        v16 = result & ~v15;
        v17 = v16 >> 6;
        if (((-1 << v16) & ~*(_QWORD *)(v4 + 64 + 8 * (v16 >> 6))) != 0)
        {
          v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v4 + 64 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v23 = 0;
          v24 = (unint64_t)(63 - v15) >> 6;
          do
          {
            if (++v17 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v25 = v17 == v24;
            if (v17 == v24)
              v17 = 0;
            v23 |= v25;
            v26 = *(_QWORD *)(v14 + 8 * v17);
          }
          while (v26 == -1);
          v18 = __clz(__rbit64(~v26)) + (v17 << 6);
        }
        *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
        v19 = 8 * v18;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + v19) = v11;
        *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v12;
        ++*(_QWORD *)(v4 + 16);
        v8 = __CocoaDictionary.Iterator.next()();
        v9 = v20;
      }
      while (v8);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v4;
}

unint64_t sub_1000272A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100028B14(a1, v4);
}

Swift::Int sub_1000272D8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000110C4(&qword_10004E830);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v3;
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v38 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v37;
          if ((a2 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v12)
              goto LABEL_36;
            v25 = *(_QWORD *)(v38 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v5 + 48) + v31);
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      v35 = v33;
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v37;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

void sub_1000275A8(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  v4 = v3;
  v7 = *v3;
  v9 = sub_1000272A8((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_100028C2C();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_1000272D8(v12, a3 & 1);
  v17 = sub_1000272A8((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  v24 = sub_100028DD0(0, &qword_10004E828, CKRecordZoneID_ptr);
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v24);
  __break(1u);
}

uint64_t sub_100027708()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

void sub_10002773C(void *a1, void *a2, char a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  id *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _QWORD v42[3];

  if ((a3 & 1) != 0)
  {
    v17 = v3[2];
    v18 = swift_errorRetain(a2);
    v19 = static os_log_type_t.default.getter(v18);
    v20 = (void *)*sub_10001853C();
    v21 = sub_1000110C4(&qword_10004DC40);
    v22 = swift_allocObject(v21, 112, 7);
    *(_OWORD *)(v22 + 16) = xmmword_100036CC0;
    *(_QWORD *)(v22 + 56) = sub_100028DD0(0, &qword_10004E788, CKRecordID_ptr);
    *(_QWORD *)(v22 + 64) = sub_100028A44(&qword_10004E790, &qword_10004E788, CKRecordID_ptr);
    *(_QWORD *)(v22 + 32) = a1;
    v42[0] = a2;
    sub_100028A84(a2, 1);
    v23 = v20;
    v24 = a1;
    v25 = sub_1000110C4(&qword_10004DE40);
    v26 = String.init<A>(describing:)(v42, v25);
    v28 = v27;
    *(_QWORD *)(v22 + 96) = &type metadata for String;
    *(_QWORD *)(v22 + 104) = sub_100012364();
    *(_QWORD *)(v22 + 72) = v26;
    *(_QWORD *)(v22 + 80) = v28;
    os_log(_:dso:log:_:_:)(v19, &_mh_execute_header, v23, "Base asset record error: %@, %@", 31, 2, v22);
    swift_bridgeObjectRelease(v22);

    swift_beginAccess(v17 + 16, v42, 1, 0);
    v29 = *(_QWORD *)(v17 + 16);
    *(_QWORD *)(v17 + 16) = a2;
    swift_errorRelease(v29);
    return;
  }
  v6 = v3[3];
  v5 = v3[4];
  v7 = a2;
  v8 = static os_log_type_t.default.getter(v7);
  v9 = (void *)*sub_10001853C();
  v10 = sub_1000110C4(&qword_10004DC40);
  v11 = swift_allocObject(v10, 72, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100036CA0;
  *(_QWORD *)(v11 + 56) = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
  *(_QWORD *)(v11 + 64) = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
  *(_QWORD *)(v11 + 32) = v7;
  sub_100028A84(a2, 0);
  v12 = v9;
  os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v12, "Base asset record changed: %@", 29, 2, v11);
  swift_bridgeObjectRelease(v11);

  v13 = ((uint64_t (*)(void))CKRecord.recordType.getter)();
  v15 = v14;
  if (v13 == 0xD00000000000001DLL && v14 == 0x800000010003B550)
  {
    swift_bridgeObjectRelease(0x800000010003B550);
LABEL_7:
    v32 = (id *)(v6 + 16);
    goto LABEL_8;
  }
  v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, 0xD00000000000001DLL, 0x800000010003B550, 0);
  v31 = swift_bridgeObjectRelease(v15);
  if ((v30 & 1) != 0)
    goto LABEL_7;
  v37 = CKRecord.recordType.getter(v31);
  v39 = v38;
  if (v37 == 0xD000000000000013 && v38 == 0x800000010003B570)
  {
    swift_bridgeObjectRelease(0x800000010003B570);
    v32 = (id *)(v5 + 16);
  }
  else
  {
    v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v38, 0xD000000000000013, 0x800000010003B570, 0);
    swift_bridgeObjectRelease(v39);
    if ((v40 & 1) == 0)
    {
      sub_100028A90(a2, 0);
      sub_100028A90(a2, 0);
      return;
    }
    v32 = (id *)(v5 + 16);
  }
LABEL_8:
  swift_beginAccess(v32, v42, 0, 0);
  v33 = *v32;
  v34 = *v32;
  v35 = sub_100023310(v7, v33);
  sub_100028A90(a2, 0);
  sub_100028A90(a2, 0);

  swift_beginAccess(v32, &v41, 1, 0);
  v36 = *v32;
  *v32 = v35;

}

uint64_t sub_100027B04(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_100028438(a1, a2, a3, a4, a5, "Got updated base sync token: %@", 31, "Base sync completion error: %@", 30);
}

uint64_t sub_100027B3C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

id *sub_100027B4C(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

unint64_t sub_100027B74()
{
  unint64_t result;

  result = qword_10004E680;
  if (!qword_10004E680)
  {
    result = swift_getWitnessTable(&unk_100037F24, &type metadata for CloudKitError);
    atomic_store(result, (unint64_t *)&qword_10004E680);
  }
  return result;
}

uint64_t sub_100027BB8()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

void sub_100027BEC(void *a1, void *a2, char a3)
{
  _QWORD *v3;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  void (*v75)(__int128 *);
  uint64_t v76;
  char v77[24];
  _OWORD v78[2];
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  _OWORD v82[2];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;

  v5 = (uint64_t *)(v3[2] + 16);
  if ((a3 & 1) != 0)
  {
    v19 = swift_errorRetain(a2);
    v20 = static os_log_type_t.default.getter(v19);
    v21 = (void *)*sub_10001853C();
    v22 = sub_1000110C4(&qword_10004DC40);
    v23 = swift_allocObject(v22, 112, 7);
    *(_OWORD *)(v23 + 16) = xmmword_100036CC0;
    *(_QWORD *)(v23 + 56) = sub_100028DD0(0, &qword_10004E788, CKRecordID_ptr);
    *(_QWORD *)(v23 + 64) = sub_100028A44(&qword_10004E790, &qword_10004E788, CKRecordID_ptr);
    *(_QWORD *)(v23 + 32) = a1;
    *(_QWORD *)&v85 = a2;
    sub_100028A84(a2, 1);
    v24 = v21;
    v25 = a1;
    v26 = sub_1000110C4(&qword_10004DE40);
    v27 = String.init<A>(describing:)(&v85, v26);
    v29 = v28;
    *(_QWORD *)(v23 + 96) = &type metadata for String;
    *(_QWORD *)(v23 + 104) = sub_100012364();
    *(_QWORD *)(v23 + 72) = v27;
    *(_QWORD *)(v23 + 80) = v29;
    os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, v24, "Base asset record error: %@, %@", 31, 2, v23);
    swift_bridgeObjectRelease(v23);

    swift_beginAccess(v5, &v85, 1, 0);
    v30 = *v5;
    *v5 = (uint64_t)a2;
    goto LABEL_30;
  }
  v6 = v3[3];
  v75 = (void (*)(__int128 *))v3[4];
  v7 = a2;
  v8 = static os_log_type_t.default.getter(v7);
  v9 = (void *)*sub_10001853C();
  v10 = sub_1000110C4(&qword_10004DC40);
  v11 = swift_allocObject(v10, 72, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100036CA0;
  v76 = sub_100028DD0(0, &qword_10004E638, CKRecord_ptr);
  *(_QWORD *)(v11 + 56) = v76;
  v12 = sub_100028A44(&qword_10004E798, &qword_10004E638, CKRecord_ptr);
  *(_QWORD *)(v11 + 64) = v12;
  *(_QWORD *)(v11 + 32) = v7;
  sub_100028A84(a2, 0);
  v13 = v9;
  os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v13, "Update zone record changed: %@", 30, 2, v11);
  swift_bridgeObjectRelease(v11);

  v15 = CKRecord.recordType.getter(v14);
  v17 = v16;
  if (v15 == 0xD000000000000019 && v16 == 0x800000010003B250)
  {
    swift_bridgeObjectRelease(0x800000010003B250);
  }
  else
  {
    v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, 0xD000000000000019, 0x800000010003B250, 0);
    swift_bridgeObjectRelease(v17);
    if ((v31 & 1) == 0)
    {
      sub_100028A90(a2, 0);
      sub_100028A90(a2, 0);
      return;
    }
  }
  swift_beginAccess(v6 + 16, v77, 1, 0);
  *(_BYTE *)(v6 + 16) = 1;
  v32 = CKRecord.subscript.getter(0x6E5F657461647075, 0xEA00000000006D75);
  if (!v32
    || (*(_QWORD *)&v85 = v32,
        v33 = sub_1000110C4(&qword_10004E808),
        v32 = swift_dynamicCast(v82, &v85, v33, &type metadata for Int64, 6),
        (v32 & 1) == 0))
  {
    v45 = static os_log_type_t.error.getter(v32);
    v46 = (void *)*sub_10001853C();
    v47 = sub_1000110C4(&qword_10004DC40);
    v48 = swift_allocObject(v47, 72, 7);
    *(_OWORD *)(v48 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v48 + 56) = v76;
    *(_QWORD *)(v48 + 64) = v12;
    *(_QWORD *)(v48 + 32) = v7;
    v49 = v7;
    v50 = v46;
    os_log(_:dso:log:_:_:)(v45, &_mh_execute_header, v50, "CloudKit record has invalid update number: %@", 45, 2, v48);
LABEL_25:

    swift_bridgeObjectRelease(v48);
    goto LABEL_26;
  }
  v34 = *(_QWORD *)&v82[0];
  v35 = CKRecord.subscript.getter(1635017060, 0xE400000000000000);
  if (!v35
    || (*(_QWORD *)&v82[0] = v35, v35 = swift_dynamicCast(&v85, v82, v33, &type metadata for Data, 6), (v35 & 1) == 0))
  {
    v51 = static os_log_type_t.error.getter(v35);
    v52 = (void *)*sub_10001853C();
    v53 = sub_1000110C4(&qword_10004DC40);
    v48 = swift_allocObject(v53, 72, 7);
    *(_OWORD *)(v48 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v48 + 56) = v76;
    *(_QWORD *)(v48 + 64) = v12;
    *(_QWORD *)(v48 + 32) = v7;
    v54 = v7;
    v50 = v52;
    os_log(_:dso:log:_:_:)(v51, &_mh_execute_header, v50, "CloudKit record has invalid data: %@", 36, 2, v48);
    goto LABEL_25;
  }
  v36 = v85;
  v37 = CKRecord.subscript.getter(0x6F635F7972746E65, 0xEB00000000746E75);
  if (v37
    && (*(_QWORD *)&v85 = v37, v37 = swift_dynamicCast(v82, &v85, v33, &type metadata for Int64, 6), (v37 & 1) != 0))
  {
    v38 = *(_QWORD *)&v82[0];
    v39 = CKRecord.subscript.getter(0x64695F65736162, 0xE700000000000000);
    if (v39)
    {
      *(_QWORD *)&v82[0] = v39;
      v39 = swift_dynamicCast(&v85, v82, v33, &type metadata for String, 6);
      if ((v39 & 1) != 0)
      {
        v40 = v85;
        v41 = CKRecord.subscript.getter(0x73736572706D6F63, 0xEB000000006E6F69);
        if (v41)
        {
          *(_QWORD *)&v82[0] = v41;
          v42 = swift_dynamicCast(&v85, v82, v33, &type metadata for String, 6);
          if (v42)
            v43 = v85;
          else
            v43 = 0;
          if (v42)
            v44 = *((_QWORD *)&v85 + 1);
          else
            v44 = 0;
        }
        else
        {
          v43 = 0;
          v44 = 0;
        }
        sub_10002F960(v34, v36, *((uint64_t *)&v36 + 1), v38, *((uint64_t *)&v36 + 1), *((uint64_t *)&v40 + 1), v43, v44, &v85);
        v57 = v85;
        v58 = v86;
        v56 = *((_QWORD *)&v87 + 1);
        v55 = v87;
        v59 = v88;
        goto LABEL_27;
      }
    }
    v69 = static os_log_type_t.error.getter(v39);
    v70 = (void *)*sub_10001853C();
    v71 = sub_1000110C4(&qword_10004DC40);
    v72 = swift_allocObject(v71, 72, 7);
    *(_OWORD *)(v72 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v72 + 56) = v76;
    *(_QWORD *)(v72 + 64) = v12;
    *(_QWORD *)(v72 + 32) = v7;
    v73 = v70;
    v74 = v7;
    os_log(_:dso:log:_:_:)(v69, &_mh_execute_header, v73, "CloudKit record has invalid uuid: %@", 36, 2, v72);

    swift_bridgeObjectRelease(v72);
    sub_10000EE2C(v36, *((unint64_t *)&v36 + 1));
  }
  else
  {
    v63 = static os_log_type_t.error.getter(v37);
    v64 = (void *)*sub_10001853C();
    v65 = sub_1000110C4(&qword_10004DC40);
    v66 = swift_allocObject(v65, 72, 7);
    *(_OWORD *)(v66 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v66 + 56) = v76;
    *(_QWORD *)(v66 + 64) = v12;
    *(_QWORD *)(v66 + 32) = v7;
    v67 = v7;
    v68 = v64;
    os_log(_:dso:log:_:_:)(v63, &_mh_execute_header, v68, "CloudKit record has invalid entryCount: %@", 42, 2, v66);

    swift_bridgeObjectRelease(v66);
    sub_10000EE2C(v36, *((unint64_t *)&v36 + 1));
  }
LABEL_26:
  v55 = 0;
  v56 = 0;
  v57 = 0uLL;
  v58 = 0uLL;
  v59 = 0uLL;
LABEL_27:
  v78[0] = v57;
  v78[1] = v58;
  v79 = v55;
  v80 = v56;
  v81 = v59;
  sub_100028A90(a2, 0);
  sub_100028E08((uint64_t)v78, (uint64_t)v82, &qword_10004E7A0);
  if (*((_QWORD *)&v83 + 1))
  {
    v85 = v82[0];
    v86 = v82[1];
    v87 = v83;
    v88 = v84;
    v75(&v85);
    sub_100028A90(a2, 0);
    sub_100028A9C((uint64_t)v78);
    return;
  }
  v60 = sub_100027B74();
  v61 = swift_allocError(&type metadata for CloudKitError, v60, 0, 0);
  *v62 = 2;
  sub_100028A90(a2, 0);
  swift_beginAccess(v5, &v85, 1, 0);
  v30 = *v5;
  *v5 = v61;
LABEL_30:
  swift_errorRelease(v30);
}

uint64_t sub_1000283D4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028400(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_100028438(a1, a2, a3, a4, a5, "Got updated update sync token: %@", 33, "Update sync completion error: %@", 32);
}

uint64_t sub_100028438(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, const char *a6, uint64_t a7, const char *a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  Swift::String v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v55;
  uint64_t *v56;
  _QWORD v57[3];
  void *v58;

  if ((a5 & 0x100) == 0)
  {
    v12 = *(_QWORD *)(v9 + 16);
    v13 = a2;
    v14 = static os_log_type_t.info.getter(v13);
    v15 = (void *)*sub_10001853C();
    v16 = sub_1000110C4(&qword_10004DC40);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100036CA0;
    v18 = v15;
    v19 = objc_msgSend(v13, "data");
    v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v22 = v21;

    v23 = Data.base64EncodedString(options:)(0);
    sub_10000EE2C(v20, v22);
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_100012364();
    *(Swift::String *)(v17 + 32) = v23;
    os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, v18, a6, a7, 2, v17);
    swift_bridgeObjectRelease(v17);

    v24 = objc_msgSend(v13, "data");
    v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v27 = v26;

    swift_beginAccess(v12 + 16, v57, 1, 0);
    v28 = *(_QWORD *)(v12 + 16);
    v29 = *(_QWORD *)(v12 + 24);
    *(_QWORD *)(v12 + 16) = v25;
    *(_QWORD *)(v12 + 24) = v27;
    return sub_10000F2D8(v28, v29);
  }
  v56 = (uint64_t *)(*(_QWORD *)(v9 + 24) + 16);
  v35 = swift_errorRetain(a2);
  v36 = static os_log_type_t.error.getter(v35);
  v37 = (void *)*sub_10001853C();
  v38 = sub_1000110C4(&qword_10004DC40);
  v39 = swift_allocObject(v38, 72, 7);
  *(_OWORD *)(v39 + 16) = xmmword_100036CA0;
  v57[0] = a2;
  sub_100028984(a2, a3, a4, a5, 1);
  v40 = v37;
  v55 = a4;
  v41 = sub_1000110C4(&qword_10004DE40);
  v53 = a3;
  v42 = String.init<A>(describing:)(v57, v41);
  v44 = v43;
  *(_QWORD *)(v39 + 56) = &type metadata for String;
  *(_QWORD *)(v39 + 64) = sub_100012364();
  *(_QWORD *)(v39 + 32) = v42;
  *(_QWORD *)(v39 + 40) = v44;
  os_log(_:dso:log:_:_:)(v36, &_mh_execute_header, v40, a8, a9, 2, v39);
  swift_bridgeObjectRelease(v39);

  v57[0] = a2;
  swift_errorRetain(a2);
  type metadata accessor for CKError(0);
  v46 = v45;
  if (!swift_dynamicCast(&v58, v57, v41, v45, 6))
  {
    v49 = v56;
LABEL_8:
    swift_beginAccess(v49, v57, 1, 0);
    v52 = *v49;
    *v49 = (uint64_t)a2;
    return swift_errorRelease(v52);
  }
  v47 = v58;
  v48 = sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
  _BridgedStoredNSError.code.getter(v57, v46, v48);
  v49 = v56;
  if (v57[0] != 21)
  {

    goto LABEL_8;
  }
  v50 = sub_1000289CC();
  v51 = swift_allocError(&type metadata for CloudKitOperationsError, v50, 0, 0);
  sub_100028A10(a2, v53, v55, a5, 1);

  swift_beginAccess(v56, v57, 1, 0);
  v52 = *v56;
  *v56 = v51;
  return swift_errorRelease(v52);
}

unint64_t sub_1000287C4()
{
  unint64_t result;

  result = qword_10004E688;
  if (!qword_10004E688)
  {
    result = swift_getWitnessTable(&unk_100037EBC, &type metadata for CloudKitError);
    atomic_store(result, (unint64_t *)&qword_10004E688);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CloudKitError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudKitError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1000288E4 + 4 * byte_100037EB5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100028918 + 4 * byte_100037EB0[v4]))();
}

uint64_t sub_100028918(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100028920(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100028928);
  return result;
}

uint64_t sub_100028934(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002893CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100028940(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100028948(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CloudKitError()
{
  return &type metadata for CloudKitError;
}

uint64_t type metadata accessor for CloudKitOperations()
{
  return objc_opt_self(_TtC17online_auth_agent18CloudKitOperations);
}

uint64_t sub_100028984(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  id v8;

  if ((a5 & 1) != 0)
    return swift_errorRetain(a1);
  v8 = a1;
  return sub_10000EE70(a2, a3);
}

void type metadata accessor for CKError(uint64_t a1)
{
  sub_100019B14(a1, &qword_10004E850, (uint64_t)&unk_100047698);
}

unint64_t sub_1000289CC()
{
  unint64_t result;

  result = qword_10004E780;
  if (!qword_10004E780)
  {
    result = swift_getWitnessTable(&unk_1000384E4, &type metadata for CloudKitOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004E780);
  }
  return result;
}

uint64_t sub_100028A10(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    return swift_errorRelease(a1);

  return sub_10000F2D8(a2, a3);
}

uint64_t sub_100028A44(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100028DD0(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_100028A84(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain();
  else
    return a1;
}

void sub_100028A90(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease(a1);
  else

}

uint64_t sub_100028A9C(uint64_t a1)
{
  sub_100028AD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return a1;
}

uint64_t sub_100028AD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if (a6)
  {
    sub_10000EE2C(a2, a3);
    swift_bridgeObjectRelease(a6);
    return swift_bridgeObjectRelease(a8);
  }
  return result;
}

unint64_t sub_100028B14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_100028DD0(0, &qword_10004E828, CKRecordZoneID_ptr);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

id sub_100028C2C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_1000110C4(&qword_10004E830);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100028DD0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100028E08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000110C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100028E4C()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255)
    sub_100028A90(*(void **)(v0 + 16), v1 & 1);
  return swift_deallocObject(v0, 25, 7);
}

id sub_100028E80(uint64_t a1, void *a2, char a3)
{
  uint64_t v3;
  void *v6;
  unsigned __int8 v7;
  _BYTE v9[24];

  swift_beginAccess(v3 + 16, v9, 1, 0);
  v6 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = a2;
  v7 = *(_BYTE *)(v3 + 24);
  a3 &= 1u;
  *(_BYTE *)(v3 + 24) = a3;
  sub_100028F00(v6, v7);
  return sub_100028A84(a2, a3);
}

id sub_100028EE8(id result, unsigned __int8 a2)
{
  if (a2 != 255)
    return sub_100028A84(result, a2 & 1);
  return result;
}

void sub_100028F00(void *a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_100028A90(a1, a2 & 1);
}

uint64_t sub_100028F18()
{
  return sub_1000123E4(&qword_10004E858, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100037FF4);
}

uint64_t sub_100028F44()
{
  return sub_1000123E4(&qword_10004E860, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038020);
}

uint64_t sub_100028F70()
{
  return sub_1000123E4(&qword_10004E868, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1000380DC);
}

uint64_t sub_100028F9C()
{
  return sub_1000123E4(&qword_10004E870, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_1000380A8);
}

uint64_t sub_100028FC8()
{
  return sub_1000123E4(&qword_10004E878, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038064);
}

uint64_t sub_100028FF4()
{
  return sub_1000123E4(&qword_10004E880, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000381C8);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_100019B14(a1, (unint64_t *)&unk_10004E8A0, (uint64_t)&unk_1000476C0);
}

uint64_t sub_100029034()
{
  return sub_1000123E4(&qword_10004E888, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10003818C);
}

unint64_t sub_100029064()
{
  unint64_t result;

  result = qword_10004E890;
  if (!qword_10004E890)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10004E890);
  }
  return result;
}

uint64_t sub_1000290A8()
{
  return sub_1000123E4(&qword_10004E898, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_100038204);
}

uint64_t sub_1000290D4()
{
  return sub_1000123E4(&qword_10004E778, (uint64_t (*)(uint64_t))type metadata accessor for CKError, (uint64_t)&unk_100038120);
}

uint64_t sub_100029100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = type metadata accessor for URL.DirectoryHint(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000110C4(&qword_10004E810);
  __chkstk_darwin(v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  sub_10001388C(v7, qword_1000516D8);
  sub_1000132D0(v7, (uint64_t)qword_1000516D8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
  return URL.init(filePath:directoryHint:relativeTo:)(0xD00000000000001ALL, 0x800000010003BB70, v3, v6);
}

void sub_100029228()
{
  qword_1000516F0 = 0x6C69666D6F6F6C62;
  *(_QWORD *)algn_1000516F8 = 0xEF6E69622E726574;
}

uint64_t sub_100029258@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  swift_beginAccess(v3, v6, 0, 0);
  v4 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1000292BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  swift_beginAccess(v3, v6, 33, 0);
  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess(v6);
}

uint64_t (*sub_100029328(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL, a1, 33, 0);
  return j_j__swift_endAccess;
}

id sub_10002936C()
{
  uint64_t v0;
  id *v1;
  _BYTE v3[24];

  v1 = (id *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db);
  swift_beginAccess(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db, v3, 0, 0);
  return *v1;
}

void sub_1000293B0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_100029400(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100029444()
{
  uint64_t v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  swift_beginAccess(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter, v3, 0, 0);
  return swift_retain(*v1);
}

uint64_t sub_10002948C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_release(v4);
}

uint64_t (*sub_1000294DC(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100029520@<X0>(uint64_t a1@<X8>)
{
  return sub_100029590(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit, a1);
}

uint64_t sub_10002952C(uint64_t a1)
{
  return sub_1000295F0(a1, &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit, (void (*)(uint64_t, _QWORD *))sub_1000207C8);
}

uint64_t (*sub_100029540(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100029584@<X0>(uint64_t a1@<X8>)
{
  return sub_100029590(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager, a1);
}

uint64_t sub_100029590@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[24];

  v4 = v2 + *a1;
  swift_beginAccess(v4, v6, 0, 0);
  return sub_10002D428(v4, a2);
}

uint64_t sub_1000295DC(uint64_t a1)
{
  return sub_1000295F0(a1, &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager, (void (*)(uint64_t, _QWORD *))sub_1000207C8);
}

uint64_t sub_1000295F0(uint64_t a1, _QWORD *a2, void (*a3)(uint64_t, _QWORD *))
{
  uint64_t v3;
  _QWORD *v6;
  _BYTE v8[24];

  v6 = (_QWORD *)(v3 + *a2);
  swift_beginAccess(v6, v8, 33, 0);
  sub_1000111D0(v6);
  a3(a1, v6);
  return swift_endAccess(v8);
}

uint64_t (*sub_100029658(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_10002969C@<X0>(uint64_t a1@<X8>)
{
  return sub_100029590(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics, a1);
}

uint64_t sub_1000296A8(uint64_t a1)
{
  return sub_1000295F0(a1, &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics, (void (*)(uint64_t, _QWORD *))sub_1000207C8);
}

uint64_t (*sub_1000296BC(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100029700(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD v28[5];
  id v29;

  v29 = a1;
  v4 = type metadata accessor for URL.DirectoryHint(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v28[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100051290 != -1)
    swift_once(&qword_100051290, sub_100029100);
  sub_1000132D0(v8, (uint64_t)qword_1000516D8);
  v28[0] = 0xD000000000000011;
  v28[1] = 0x800000010003B740;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for URL.DirectoryHint.inferFromPath(_:), v4);
  v12 = sub_10002D46C();
  URL.appending<A>(path:directoryHint:)(v28, v7, &type metadata for String, v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v13 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL.path.getter();
  v15 = v14;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  LODWORD(v15) = objc_msgSend(v13, "fileExistsAtPath:", v16);

  if (!(_DWORD)v15)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v21 = 0;
LABEL_7:
    sub_10002D428((uint64_t)a2, (uint64_t)v28);
    v18 = (*(uint64_t (**)(id, uint64_t, _QWORD *))(v27 + 272))(v29, v21, v28);
    sub_1000111D0(a2);
    return v18;
  }
  v17 = type metadata accessor for PropertyListDecoder(0);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  v18 = PropertyListDecoder.init()();
  v19 = Data.init(contentsOf:options:)(v11, 0);
  if (!v2)
  {
    v22 = v19;
    v23 = v20;
    v24 = type metadata accessor for BloomFilter();
    v25 = sub_10002D6A8(&qword_10004E918, (uint64_t)&unk_100037B44);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v28, v24, v22, v23, v24, v25);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_10000EE2C(v22, v23);
    swift_release(v18);
    v21 = v28[0];
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  swift_release(v18);
  sub_1000111D0(a2);
  return v18;
}

uint64_t sub_100029A14(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;

  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  v7 = sub_10002D4B0(a1, a2, a3);

  swift_release(a2);
  return v7;
}

uint64_t sub_100029A78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  unsigned int __src;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v6 = v4;
  v11 = sub_1000110C4(&qword_10004E5C0);
  __chkstk_darwin(v11);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = a3;
  __src = bswap32(a3);
  v73 = sub_10000FFB0(&__src, &v73);
  v74 = v14 & 0xFFFFFFFFFFFFFFLL;
  v15 = a1;
  v71 = a2;
  v16 = Data.append(_:)(a1, a2);
  v17 = v73;
  v18 = v74;
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 176))(v16);
  if (v19)
  {
    v20 = v19;
    v69 = a4;
    v21 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v19 + 168))(v17, v18);
    if (v5)
    {
      swift_release(v20);
      return sub_10000EE2C(v17, v18);
    }
    else
    {
      v67 = v18;
      v68 = 0;
      v66 = v17;
      v26 = sub_10001BD64(v21 & 1, 1);
      if (v26)
      {
        v27 = static os_log_type_t.default.getter(v26);
        v28 = (void *)*sub_1000185EC();
        v29 = sub_1000110C4(&qword_10004DC40);
        v30 = swift_allocObject(v29, 112, 7);
        *(_OWORD *)(v30 + 16) = xmmword_100036CC0;
        *(_QWORD *)(v30 + 56) = &type metadata for UInt32;
        *(_QWORD *)(v30 + 64) = &protocol witness table for UInt32;
        *(_DWORD *)(v30 + 32) = v70;
        v31 = v28;
        sub_100010E8C(v15, v71);
        v33 = v32;
        v35 = v34;
        *(_QWORD *)(v30 + 96) = &type metadata for String;
        *(_QWORD *)(v30 + 104) = sub_100012364();
        *(_QWORD *)(v30 + 72) = v33;
        *(_QWORD *)(v30 + 80) = v35;
        os_log(_:dso:log:_:_:)(v27, &_mh_execute_header, v31, "Item not present in bloom filter: %d, %@", 40, 2, v30);
        swift_release(v20);
        sub_10000EE2C(v66, v67);

        swift_bridgeObjectRelease(v30);
        v36 = type metadata accessor for LaunchWarningDetails(0);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v69, 1, 1, v36);
      }
      else
      {
        (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v6 + 200))(&v73);
        v37 = v75;
        v38 = v76;
        sub_1000111AC(&v73, v75);
        v39 = v15;
        v40 = v15;
        v41 = v70;
        v42 = v68;
        (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v38 + 8))(v40, v71, v70, v37, v38);
        if (v42)
        {
          swift_release(v20);
          sub_10000EE2C(v66, v67);
          return sub_1000111D0(&v73);
        }
        else
        {
          v68 = 0;
          v43 = type metadata accessor for LaunchWarningDetails(0);
          v44 = *(_QWORD *)(v43 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v13, 1, v43) == 1)
          {
            sub_100020234((uint64_t)v13, &qword_10004E5C0);
            v45 = sub_1000111D0(&v73);
            v46 = static os_log_type_t.default.getter(v45);
            v47 = (void *)*sub_1000185EC();
            v48 = sub_1000110C4(&qword_10004DC40);
            v49 = swift_allocObject(v48, 112, 7);
            *(_OWORD *)(v49 + 16) = xmmword_100036CC0;
            *(_QWORD *)(v49 + 56) = &type metadata for UInt32;
            *(_QWORD *)(v49 + 64) = &protocol witness table for UInt32;
            *(_DWORD *)(v49 + 32) = v41;
            v50 = v47;
            sub_100010E8C(v39, v71);
            v52 = v51;
            v54 = v53;
            *(_QWORD *)(v49 + 96) = &type metadata for String;
            *(_QWORD *)(v49 + 104) = sub_100012364();
            *(_QWORD *)(v49 + 72) = v52;
            *(_QWORD *)(v49 + 80) = v54;
            os_log(_:dso:log:_:_:)(v46, &_mh_execute_header, v50, "No launch warning present: %d, %@", 33, 2, v49);
            swift_release(v20);
            sub_10000EE2C(v66, v67);

            swift_bridgeObjectRelease(v49);
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v69, 1, 1, v43);
          }
          else
          {
            v55 = v69;
            sub_10001F600((uint64_t)v13, v69, type metadata accessor for LaunchWarningDetails);
            v56 = sub_1000111D0(&v73);
            HIDWORD(v65) = static os_log_type_t.default.getter(v56);
            v57 = (void *)*sub_1000185EC();
            v58 = sub_1000110C4(&qword_10004DC40);
            v59 = swift_allocObject(v58, 112, 7);
            *(_OWORD *)(v59 + 16) = xmmword_100036CC0;
            *(_QWORD *)(v59 + 56) = &type metadata for UInt32;
            *(_QWORD *)(v59 + 64) = &protocol witness table for UInt32;
            *(_DWORD *)(v59 + 32) = v41;
            v60 = v57;
            sub_100010E8C(v39, v71);
            v62 = v61;
            v64 = v63;
            *(_QWORD *)(v59 + 96) = &type metadata for String;
            *(_QWORD *)(v59 + 104) = sub_100012364();
            *(_QWORD *)(v59 + 72) = v62;
            *(_QWORD *)(v59 + 80) = v64;
            os_log(_:dso:log:_:_:)(HIDWORD(v65), &_mh_execute_header, v60, "Launch warning found: %d, %@", 28, 2, v59);
            swift_release(v20);
            sub_10000EE2C(v66, v67);

            swift_bridgeObjectRelease(v59);
            return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v44 + 56))(v55, 0, 1, v43);
          }
        }
      }
    }
  }
  else
  {
    v23 = static os_log_type_t.error.getter(0);
    v24 = (id)*sub_1000185EC();
    os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "No bloom filter configured.", 27, 2, &_swiftEmptyArrayStorage);
    sub_10000EE2C(v17, v18);

    v25 = type metadata accessor for LaunchWarningDetails(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a4, 1, 1, v25);
  }
}

uint64_t sub_100029FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  void (*v42)(id *__return_ptr);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(void);
  void *v67;
  void *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  NSObject *v78;
  os_log_type_t v79;
  NSObject *v80;
  uint8_t *v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  id v86;
  void *v87;
  void *v88;
  unsigned int v89;
  id v90;
  id v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(_QWORD);
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  id v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  char *v135;
  unint64_t v136;
  void (*v137)(char *, uint64_t);
  uint64_t v138;
  uint64_t v139;
  os_log_type_t v140;
  NSObject *v141;
  NSObject *v142;
  uint8_t *v143;
  _QWORD *v144;
  void *v145;
  uint64_t v146;
  _QWORD *v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  NSURL *v153;
  void *v154;
  void *v155;
  NSURL *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  unsigned int v160;
  id v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  id v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void (*v178)(id *__return_ptr);
  _QWORD *v179;
  _QWORD *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  id v185;
  unint64_t v186;
  unint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  int *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t *v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  uint64_t *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  unint64_t v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  uint64_t v239;
  void *v240;
  char *v241;
  char *v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  uint64_t (*v251)(uint64_t);
  uint64_t v252;
  uint64_t v253;
  uint64_t (*v254)(void);
  void *v255;
  char *v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void (*v269)(char *, uint64_t);
  void (*v270)(char *, uint64_t);
  unint64_t v271;
  unsigned int v272;
  void (*v273)(char *, _QWORD, uint64_t);
  void (*v274)(void);
  uint64_t *v275;
  uint64_t *v276;
  unint64_t v277;
  __int128 v278;
  uint64_t v279;
  void (*v280)(char *, uint64_t);
  uint64_t v281;
  uint64_t v282;
  char *v283;
  uint64_t v284;
  char *v285;
  uint64_t *v286;
  char *v287;
  uint64_t v288;
  void (**v289)(char *, uint64_t);
  uint64_t v290;
  char *v291;
  uint64_t v292;
  char *v293;
  char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  char *v302;
  char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void (*v308)(id *__return_ptr);
  uint64_t v309;
  char *v310;
  uint64_t (*v311)(void);
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  char v317[8];
  id v318;
  unint64_t v319;
  uint64_t v320;
  uint64_t v321;

  v1 = v0;
  v2 = sub_1000110C4(&qword_10004E640);
  __chkstk_darwin(v2);
  v299 = (uint64_t)&v270 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v298 = type metadata accessor for DocumentCheckerRecord(0);
  v297 = *(_QWORD *)(v298 - 8);
  __chkstk_darwin(v298);
  v295 = (uint64_t)&v270 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v292 = type metadata accessor for Algorithm(0);
  v291 = *(char **)(v292 - 8);
  __chkstk_darwin(v292);
  v287 = (char *)&v270 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000110C4(&qword_10004E920);
  v7 = __chkstk_darwin(v6);
  v290 = (uint64_t)&v270 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v289 = (void (**)(char *, uint64_t))((char *)&v270 - v10);
  v11 = __chkstk_darwin(v9);
  v288 = (uint64_t)&v270 - v12;
  __chkstk_darwin(v11);
  v300 = (uint64_t)&v270 - v13;
  v305 = type metadata accessor for URL.DirectoryHint(0);
  v301 = *(_QWORD *)(v305 - 8);
  __chkstk_darwin(v305);
  v303 = (char *)&v270 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v307 = type metadata accessor for URL(0);
  v304 = *(_QWORD *)(v307 - 8);
  v15 = __chkstk_darwin(v307);
  v294 = (char *)&v270 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v283 = (char *)&v270 - v18;
  v19 = __chkstk_darwin(v17);
  v285 = (char *)&v270 - v20;
  v21 = __chkstk_darwin(v19);
  v302 = (char *)&v270 - v22;
  __chkstk_darwin(v21);
  v293 = (char *)&v270 - v23;
  v24 = sub_1000110C4(&qword_10004E648);
  __chkstk_darwin(v24);
  v26 = (char *)&v270 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v309 = type metadata accessor for BloomFilterRecord(0);
  v306 = *(_QWORD *)(v309 - 8);
  __chkstk_darwin(v309);
  v310 = (char *)&v270 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v296 = type metadata accessor for BaseZoneSyncResult(0);
  v28 = __chkstk_darwin(v296);
  v30 = (char *)&v270 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __chkstk_darwin(v28);
  v33 = (char *)&v270 - v32;
  __chkstk_darwin(v31);
  v35 = (char *)&v270 - v34;
  v36 = swift_allocObject(&unk_100047818, 24, 7);
  v314 = v36;
  *(_QWORD *)(v36 + 16) = 0;
  v284 = v36 + 16;
  v37 = swift_allocObject(&unk_100047840, 24, 7);
  v315 = v37;
  *(_QWORD *)(v37 + 16) = 0;
  v286 = (uint64_t *)(v37 + 16);
  v311 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 152);
  v38 = (void *)v311();
  v39 = sub_100016F80();
  v41 = v40;

  v42 = *(void (**)(id *__return_ptr))(*(_QWORD *)v1 + 200);
  v313 = v1;
  v308 = v42;
  v42(&v318);
  v43 = v320;
  v44 = v321;
  sub_1000111AC(&v318, v320);
  v45 = v312;
  (*(void (**)(id, unint64_t, uint64_t, uint64_t))(v44 + 16))(v39, v41, v43, v44);
  if (v45)
  {
    sub_10000F2D8((uint64_t)v39, v41);
    sub_1000111D0(&v318);
    v316 = v45;
    swift_errorRetain(v45);
    v46 = sub_1000110C4(&qword_10004DE40);
    if (!swift_dynamicCast(v46, &v316, v46, &type metadata for CloudKitOperationsError, 0))
    {
      swift_errorRelease(v316);
      swift_release(v314);
      return swift_release(v315);
    }
    v47 = swift_errorRelease(v45);
    v48 = v313;
    v49 = (void *)((uint64_t (*)(uint64_t))v311)(v47);
    sub_100016FC0();

    v308(&v318);
    v50 = v320;
    v51 = v321;
    sub_1000111AC(&v318, v320);
    (*(void (**)(_QWORD, unint64_t, uint64_t, uint64_t))(v51 + 16))(0, 0xF000000000000000, v50, v51);
    v52 = 0;
    v312 = v45;
    v53 = (uint64_t)v35;
    sub_10001F600((uint64_t)v30, (uint64_t)v35, type metadata accessor for BaseZoneSyncResult);
    sub_1000111D0(&v318);
    swift_errorRelease(v316);
  }
  else
  {
    sub_10000F2D8((uint64_t)v39, v41);
    sub_10001F600((uint64_t)v33, (uint64_t)v35, type metadata accessor for BaseZoneSyncResult);
    sub_1000111D0(&v318);
    v312 = 0;
    v52 = 0;
    v53 = (uint64_t)v35;
    v48 = v313;
  }
  sub_10001E9EC(v53, (uint64_t)v26, &qword_10004E648);
  v54 = (int *)v309;
  LODWORD(v306) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v306 + 48))(v26, 1, v309);
  v55 = v310;
  v282 = v53;
  if ((_DWORD)v306 == 1)
  {
    sub_100020234((uint64_t)v26, &qword_10004E648);
  }
  else
  {
    v281 = 0;
    v56 = sub_10001F600((uint64_t)v26, (uint64_t)v310, type metadata accessor for BloomFilterRecord);
    v57 = static os_log_type_t.default.getter(v56);
    v58 = (void *)*sub_10001853C();
    v279 = sub_1000110C4(&qword_10004DC40);
    v59 = swift_allocObject(v279, 72, 7);
    v278 = xmmword_100036CA0;
    *(_OWORD *)(v59 + 16) = xmmword_100036CA0;
    v60 = (uint64_t *)&v55[v54[9]];
    v62 = *v60;
    v61 = v60[1];
    v276 = v60;
    *(_QWORD *)(v59 + 56) = &type metadata for String;
    v277 = sub_100012364();
    *(_QWORD *)(v59 + 64) = v277;
    *(_QWORD *)(v59 + 32) = v62;
    *(_QWORD *)(v59 + 40) = v61;
    v63 = v58;
    swift_bridgeObjectRetain(v61);
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v63, "Setting up new base filter: %@", 30, 2, v59);

    v64 = v313;
    v65 = swift_bridgeObjectRelease(v59);
    v66 = v311;
    v67 = (void *)((uint64_t (*)(uint64_t))v311)(v65);
    sub_1000171AC();

    v68 = (void *)v66();
    v69 = &v55[v54[7]];
    v70 = *((_QWORD *)v69 + 1);
    swift_bridgeObjectRetain(v70);
    sub_100017298();

    v71 = swift_bridgeObjectRelease(v70);
    v72 = (void *)((uint64_t (*)(uint64_t))v66)(v71);
    v73 = *(_QWORD *)&v55[v54[8] + 8];
    v275 = (uint64_t *)&v55[v54[8]];
    swift_bridgeObjectRetain(v73);
    sub_100017030();

    v74 = swift_bridgeObjectRelease(v73);
    v75 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v64 + 176))(v74);
    if (v75)
    {
      v76 = v75;
      v77 = static os_log_type_t.info.getter(v75);
      v78 = *sub_1000185EC();
      v79 = v77;
      if (os_log_type_enabled(v78, v77))
      {
        swift_retain_n(v76, 2);
        v80 = v78;
        v81 = (uint8_t *)swift_slowAlloc(12, -1);
        v82 = (void *)swift_slowAlloc(32, -1);
        *(_DWORD *)v81 = 136315138;
        v318 = v82;
        v83 = URL.path.getter();
        v85 = v84;
        v316 = sub_100021DC8(v83, v84, (uint64_t *)&v318);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v316, v317, v81 + 4);
        swift_release_n(v76, 2);
        swift_bridgeObjectRelease(v85);
        _os_log_impl((void *)&_mh_execute_header, v80, v79, "Removing old bloom filter: %s", v81, 0xCu);
        swift_arrayDestroy(v82, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v82, -1, -1);
        swift_slowDealloc(v81, -1, -1);

      }
      v86 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
      URL._bridgeToObjectiveC()(*(NSURL **)(v76 + 40));
      v88 = v87;
      v318 = 0;
      v89 = objc_msgSend(v86, "removeItemAtURL:error:", v87, &v318);

      v90 = v318;
      if (!v89)
      {
        v148 = v318;
        _convertNSErrorToError(_:)(v90);

        swift_willThrow(v149);
        swift_release(v76);
        goto LABEL_27;
      }
      v91 = v318;
      swift_release(v76);
      v64 = v313;
      v55 = v310;
    }
    v92 = v302;
    v274 = *(void (**)(void))(*(_QWORD *)v64 + 128);
    v274();
    if (qword_100051298 != -1)
      swift_once(&qword_100051298, sub_100029228);
    v93 = *(_QWORD *)algn_1000516F8;
    v318 = (id)qword_1000516F0;
    v319 = *(_QWORD *)algn_1000516F8;
    v94 = v301;
    v95 = *(void (**)(_QWORD))(v301 + 104);
    v96 = v303;
    v272 = enum case for URL.DirectoryHint.inferFromPath(_:);
    v97 = v305;
    v273 = (void (*)(char *, _QWORD, uint64_t))v95;
    v95(v303);
    v98 = sub_10002D46C();
    swift_bridgeObjectRetain(v93);
    v99 = (uint64_t)v293;
    v271 = v98;
    URL.appending<A>(path:directoryHint:)(&v318, v96, &type metadata for String, v98);
    v270 = *(void (**)(char *, uint64_t))(v94 + 8);
    v270(v96, v97);
    swift_bridgeObjectRelease(v319);
    v280 = *(void (**)(char *, uint64_t))(v304 + 8);
    v280(v92, v307);
    v100 = v291;
    v101 = v300;
    v102 = v292;
    (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v291 + 7))(v300, 1, 1, v292);
    v103 = (uint64_t *)&v55[*(int *)(v309 + 48)];
    v104 = v103[1];
    v105 = v281;
    if (v104)
    {
      v106 = v69;
      v107 = *v103;
      swift_bridgeObjectRetain(v103[1]);
      v108 = v288;
      sub_100018688(v107, v104, v288);
      sub_100020234(v101, &qword_10004E920);
      sub_10002D72C(v108, v101);
      v109 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v289;
      sub_10001E9EC(v101, (uint64_t)v289, &qword_10004E920);
      if ((*((unsigned int (**)(void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t, uint64_t))v100
            + 6))(v109, 1, v102) == 1)
      {
        v110 = sub_100020234((uint64_t)v109, &qword_10004E920);
        v111 = static os_log_type_t.error.getter(v110);
        v112 = (void *)*sub_1000185EC();
        v113 = v99;
        v114 = swift_allocObject(v279, 72, 7);
        *(_OWORD *)(v114 + 16) = v278;
        v115 = v277;
        *(_QWORD *)(v114 + 56) = &type metadata for String;
        *(_QWORD *)(v114 + 64) = v115;
        *(_QWORD *)(v114 + 32) = v107;
        *(_QWORD *)(v114 + 40) = v104;
        swift_bridgeObjectRetain(v104);
        v116 = v112;
        os_log(_:dso:log:_:_:)(v111, &_mh_execute_header, v116, "Update asset had invalid compression type: %@", 45, 2, v114);

        swift_bridgeObjectRelease(v114);
        v117 = sub_10002D6E8();
        v118 = swift_allocError(&type metadata for LaunchWarningControllerError, v117, 0, 0);
        *(_QWORD *)v119 = v107;
        *(_QWORD *)(v119 + 8) = v104;
        *(_BYTE *)(v119 + 16) = 1;
        swift_willThrow(v118);
        sub_100020234(v101, &qword_10004E920);
        v120 = (char *)v113;
LABEL_16:
        v280(v120, v307);
LABEL_27:
        v150 = (uint64_t)v310;
LABEL_49:
        sub_100013234(v150, type metadata accessor for BloomFilterRecord);
        sub_100013234(v282, type metadata accessor for BaseZoneSyncResult);
        swift_release(v314);
        return swift_release(v315);
      }
      swift_bridgeObjectRelease(v104);
      sub_100020234((uint64_t)v109, &qword_10004E920);
      v55 = v310;
      v69 = v106;
      v105 = v281;
    }
    v151 = v290;
    sub_10001E9EC(v101, v290, &qword_10004E920);
    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v100 + 6))(v151, 1, v102) == 1)
    {
      sub_100020234(v151, &qword_10004E920);
      v152 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
      URL._bridgeToObjectiveC()(v153);
      v155 = v154;
      URL._bridgeToObjectiveC()(v156);
      v158 = v157;
      v318 = 0;
      v159 = v99;
      v160 = objc_msgSend(v152, "copyItemAtURL:toURL:error:", v155, v157, &v318);

      v161 = v318;
      if (!v160)
      {
        v199 = v318;
        _convertNSErrorToError(_:)(v161);

        swift_willThrow(v200);
        sub_100020234(v300, &qword_10004E920);
        v201 = v159;
        v202 = v307;
LABEL_48:
        v280((char *)v201, v202);
        v150 = (uint64_t)v55;
        goto LABEL_49;
      }
      v162 = v318;
      v163 = v307;
      v101 = v300;
      v99 = v159;
    }
    else
    {
      v164 = (uint64_t)v287;
      (*((void (**)(char *, uint64_t, uint64_t))v100 + 4))(v287, v151, v102);
      sub_10001879C(v55, v99, v164);
      if (v105)
      {
        v166 = static os_log_type_t.error.getter(v165);
        v167 = v99;
        v168 = (void *)*sub_1000185EC();
        v169 = swift_allocObject(v279, 72, 7);
        *(_OWORD *)(v169 + 16) = v278;
        v170 = *v276;
        v171 = v276[1];
        v172 = v277;
        *(_QWORD *)(v169 + 56) = &type metadata for String;
        *(_QWORD *)(v169 + 64) = v172;
        *(_QWORD *)(v169 + 32) = v170;
        *(_QWORD *)(v169 + 40) = v171;
        v173 = v168;
        swift_bridgeObjectRetain(v171);
        os_log(_:dso:log:_:_:)(v166, &_mh_execute_header, v173, "Base asset had invalid payload: %@", 34, 2, v169);

        swift_bridgeObjectRelease(v169);
        v174 = sub_10002D6E8();
        v175 = swift_allocError(&type metadata for LaunchWarningControllerError, v174, 0, 0);
        *(_QWORD *)v176 = 0;
        *(_QWORD *)(v176 + 8) = 0;
        *(_BYTE *)(v176 + 16) = 2;
        swift_willThrow(v175);
        swift_errorRelease(v105);
        (*((void (**)(char *, uint64_t))v100 + 1))(v287, v102);
        sub_100020234(v300, &qword_10004E920);
        v280((char *)v167, v307);
        sub_100013234((uint64_t)v55, type metadata accessor for BloomFilterRecord);
LABEL_54:
        sub_100013234(v282, type metadata accessor for BaseZoneSyncResult);
        swift_release(v314);
        return swift_release(v315);
      }
      (*((void (**)(uint64_t, uint64_t))v100 + 1))(v164, v102);
      v163 = v307;
    }
    type metadata accessor for BloomFilterDiskStorage(0);
    v203 = (uint64_t)v285;
    (*(void (**)(char *, uint64_t, uint64_t))(v304 + 16))(v285, v99, v163);
    v204 = (int *)v309;
    v205 = sub_100019F30(v203, *(_QWORD *)&v55[*(int *)(v309 + 24)]);
    if (v105)
    {
      sub_100020234(v101, &qword_10004E920);
      v201 = v99;
      v202 = v163;
      goto LABEL_48;
    }
    v206 = v205;
    v292 = type metadata accessor for BloomFilter();
    v207 = (uint64_t *)&v55[v204[5]];
    v208 = *v207;
    v209 = v207[1];
    v210 = v204[11];
    v211 = (uint64_t *)&v55[v204[10]];
    v281 = 0;
    v212 = *v211;
    v213 = v211[1];
    v214 = *(_QWORD *)&v55[v210];
    v215 = *v276;
    v216 = v276[1];
    swift_retain(v206);
    sub_10000ED74(v208, v209);
    swift_bridgeObjectRetain(v213);
    swift_bridgeObjectRetain(v216);
    v217 = v214;
    v218 = v292;
    v219 = v281;
    v220 = sub_10001BD74(v206, v208, v209, v212, v213, v217, v215, v216);
    if (v219)
    {
      swift_release(v206);
      sub_100020234(v300, &qword_10004E920);
      v120 = v293;
      goto LABEL_16;
    }
    v240 = (void *)v220;
    v309 = v206;
    v291 = v69;
    v241 = v302;
    v274();
    v318 = (id)0xD000000000000011;
    v319 = 0x800000010003B740;
    v242 = v303;
    v243 = v305;
    v273(v303, v272, v305);
    v244 = v283;
    URL.appending<A>(path:directoryHint:)(&v318, v242, &type metadata for String, v271);
    v270(v242, v243);
    swift_bridgeObjectRelease(v319);
    v280(v241, v307);
    v245 = type metadata accessor for PropertyListEncoder(0);
    swift_allocObject(v245, *(unsigned int *)(v245 + 48), *(unsigned __int16 *)(v245 + 52));
    v246 = PropertyListEncoder.init()();
    v318 = v240;
    v247 = sub_10002D6A8(&qword_10004E930, (uint64_t)&unk_100037B6C);
    v248 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(&v318, v218, v247);
    v250 = v249;
    Data.write(to:options:)(v244, 0, v248, v249);
    v281 = 0;
    v251 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v313 + 184);
    v252 = swift_retain(v240);
    v253 = v251(v252);
    v254 = v311;
    v255 = (void *)((uint64_t (*)(uint64_t))v311)(v253);
    v256 = (char *)*((_QWORD *)v291 + 1);
    v292 = *(_QWORD *)v291;
    v291 = v256;
    swift_bridgeObjectRetain(v256);
    sub_100017298();

    v257 = swift_bridgeObjectRelease(v256);
    v258 = (void *)((uint64_t (*)(uint64_t))v254)(v257);
    v259 = v275[1];
    v290 = *v275;
    swift_bridgeObjectRetain(v259);
    sub_100017030();

    v260 = swift_bridgeObjectRelease(v259);
    v261 = (void *)((uint64_t (*)(uint64_t))v254)(v260);
    sub_1000171AC();

    v308(&v318);
    v262 = v320;
    v263 = v321;
    sub_1000111AC(&v318, v320);
    v289 = *(void (***)(char *, uint64_t))(v263 + 32);
    v264 = v291;
    swift_bridgeObjectRetain(v291);
    swift_bridgeObjectRetain(v259);
    v265 = v262;
    v266 = v282;
    ((void (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))v289)(v290, v259, v292, v264, v265, v263);
    swift_bridgeObjectRelease(v259);
    swift_bridgeObjectRelease(v264);
    sub_10000EE2C(v248, v250);
    swift_release(v309);
    v53 = v266;
    swift_release(v240);
    v267 = v246;
    v48 = v313;
    swift_release(v267);
    v268 = v307;
    v269 = v280;
    v280(v283, v307);
    sub_100020234(v300, &qword_10004E920);
    v269(v293, v268);
    sub_100013234((uint64_t)v310, type metadata accessor for BloomFilterRecord);
    sub_1000111D0(&v318);
    v52 = v281;
  }
  v121 = v296;
  v122 = v53 + *(int *)(v296 + 24);
  v123 = *(_QWORD *)(v122 + 8);
  v124 = v305;
  if (v123 >> 60 != 15)
  {
    v125 = v53;
    v126 = *(_QWORD *)v122;
    v127 = sub_10000ED74(*(_QWORD *)v122, *(_QWORD *)(v122 + 8));
    v128 = (void *)((uint64_t (*)(uint64_t))v311)(v127);
    sub_100016FA0();

    v53 = v125;
    sub_10000F2D8(v126, v123);
  }
  v129 = v299;
  sub_10001E9EC(v53 + *(int *)(v121 + 20), v299, &qword_10004E640);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v297 + 48))(v129, 1, v298) == 1)
  {
    v130 = sub_100020234(v129, &qword_10004E640);
    v131 = 0;
  }
  else
  {
    v132 = sub_10001F600(v129, v295, type metadata accessor for DocumentCheckerRecord);
    v133 = v302;
    (*(void (**)(uint64_t))(*(_QWORD *)v48 + 128))(v132);
    v318 = (id)0xD00000000000001FLL;
    v319 = 0x800000010003B720;
    v134 = v301;
    v135 = v303;
    (*(void (**)(char *, _QWORD, uint64_t))(v301 + 104))(v303, enum case for URL.DirectoryHint.inferFromPath(_:), v124);
    v136 = sub_10002D46C();
    URL.appending<A>(path:directoryHint:)(&v318, v135, &type metadata for String, v136);
    (*(void (**)(char *, uint64_t))(v134 + 8))(v135, v124);
    swift_bridgeObjectRelease(v319);
    v137 = *(void (**)(char *, uint64_t))(v304 + 8);
    v138 = v307;
    v137(v133, v307);
    sub_1000138CC();
    if (v52)
    {
      v140 = static os_log_type_t.error.getter(v139);
      v141 = *sub_1000185EC();
      if (os_log_type_enabled(v141, v140))
      {
        swift_errorRetain(v52);
        swift_errorRetain(v52);
        v142 = v141;
        v143 = (uint8_t *)swift_slowAlloc(12, -1);
        v144 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v143 = 138412290;
        swift_errorRetain(v52);
        v145 = (void *)_swift_stdlib_bridgeErrorToNSError(v52);
        v318 = v145;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v318, &v319, v143 + 4);
        *v144 = v145;
        v138 = v307;
        swift_errorRelease(v52);
        swift_errorRelease(v52);
        _os_log_impl((void *)&_mh_execute_header, v142, v140, "Failed to install document checker: %@", v143, 0xCu);
        v146 = sub_1000110C4(&qword_10004E928);
        swift_arrayDestroy(v144, 1, v146);
        v147 = v144;
        v48 = v313;
        swift_slowDealloc(v147, -1, -1);
        swift_slowDealloc(v143, -1, -1);

      }
      swift_errorRelease(v52);
      v131 = 0;
      v52 = 0;
    }
    else
    {
      v131 = 256;
    }
    v137(v294, v138);
    v130 = sub_100013234(v295, type metadata accessor for DocumentCheckerRecord);
  }
  v177 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v48 + 176))(v130);
  v178 = v308;
  if (v177)
  {
    v179 = (_QWORD *)v177;
    LODWORD(v310) = v131;
    v180 = (_QWORD *)swift_allocObject(&unk_100047868, 48, 7);
    v182 = v314;
    v181 = v315;
    v180[2] = v315;
    v180[3] = v48;
    v180[4] = v179;
    v180[5] = v182;
    swift_retain(v181);
    swift_retain(v48);
    swift_retain(v179);
    v183 = swift_retain(v182);
    v184 = (void *)((uint64_t (*)(uint64_t))v311)(v183);
    v185 = sub_10001704C();
    v187 = v186;

    v178(&v318);
    v188 = v52;
    v189 = v320;
    v190 = v321;
    sub_1000111AC(&v318, v320);
    (*(void (**)(uint64_t (*)(_QWORD *), _QWORD *, id, unint64_t, uint64_t, uint64_t))(v190 + 24))(sub_10002D68C, v180, v185, v187, v189, v190);
    if (v188)
    {
      sub_10000F2D8((uint64_t)v185, v187);
      sub_1000111D0(&v318);
      v316 = v188;
      swift_errorRetain(v188);
      v193 = sub_1000110C4(&qword_10004DE40);
      if (!swift_dynamicCast(v193, &v316, v193, &type metadata for CloudKitOperationsError, 0))
      {
        sub_100013234(v282, type metadata accessor for BaseZoneSyncResult);
        swift_release(v180);
        swift_release(v179);
        swift_errorRelease(v316);
        swift_release(v314);
        return swift_release(v315);
      }
      v194 = swift_errorRelease(v188);
      v195 = (void *)((uint64_t (*)(uint64_t))v311)(v194);
      sub_1000171AC();

      v308(&v318);
      v196 = v320;
      v197 = v321;
      sub_1000111AC(&v318, v320);
      (*(void (**)(uint64_t (*)(_QWORD *), _QWORD *, _QWORD, unint64_t, uint64_t, uint64_t))(v197 + 24))(sub_10002D68C, v180, 0, 0xF000000000000000, v196, v197);
      v222 = v221;
      v224 = v223;
      sub_1000111D0(&v318);
      swift_errorRelease(v316);
    }
    else
    {
      v222 = v191;
      v224 = v192;
      sub_10000F2D8((uint64_t)v185, v187);
      sub_1000111D0(&v318);
    }
    v225 = v286;
    swift_beginAccess(v286, &v318, 0, 0);
    v226 = *v225;
    if (v226)
    {
      v227 = swift_errorRetain(v226);
      LODWORD(v313) = static os_log_type_t.error.getter(v227);
      v228 = (void *)*sub_1000185EC();
      v229 = sub_1000110C4(&qword_10004DC40);
      v230 = swift_allocObject(v229, 72, 7);
      *(_OWORD *)(v230 + 16) = xmmword_100036CA0;
      v316 = v226;
      swift_errorRetain(v226);
      v231 = v228;
      v232 = sub_1000110C4(&qword_10004DE40);
      v233 = String.init<A>(describing:)(&v316, v232);
      v235 = v234;
      *(_QWORD *)(v230 + 56) = &type metadata for String;
      *(_QWORD *)(v230 + 64) = sub_100012364();
      *(_QWORD *)(v230 + 32) = v233;
      *(_QWORD *)(v230 + 40) = v235;
      os_log(_:dso:log:_:_:)(v313, &_mh_execute_header, v231, "Update entry sync error: %{public}@", 35, 2, v230);

      v236 = swift_bridgeObjectRelease(v230);
      swift_willThrow(v236);
      swift_release(v179);
      swift_release(v180);
      sub_10000F2D8(v222, v224);
      goto LABEL_54;
    }
    if (v224 >> 60 == 15)
    {
      swift_release(v179);
    }
    else
    {
      v237 = sub_10000EE70(v222, v224);
      v238 = (void *)((uint64_t (*)(uint64_t))v311)(v237);
      sub_100017104();

      swift_release(v180);
      sub_10000F2D8(v222, v224);
      v180 = v179;
    }
    v239 = v282;
    swift_release(v180);
    sub_10000F2D8(v222, v224);
    sub_100013234(v239, type metadata accessor for BaseZoneSyncResult);
    swift_beginAccess(v284, &v316, 0, 0);
    swift_release(v314);
    swift_release(v315);
    v131 = (int)v310;
  }
  else
  {
    sub_100013234(v282, type metadata accessor for BaseZoneSyncResult);
    swift_release(v314);
    swift_release(v315);
  }
  return v131 | ((_DWORD)v306 != 1);
}

uint64_t sub_10002BCE4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t result;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t (*v32)(void);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  unint64_t v65;
  __int128 v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  char *v101;
  char *v102;
  char *v103;
  __int128 v104;
  uint64_t v105;
  char *v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  _QWORD v114[3];
  char v115[24];
  _OWORD v116[2];
  uint64_t v117;

  v110 = a5;
  v111 = a4;
  v112 = a1;
  v113 = a3;
  v6 = type metadata accessor for Algorithm(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000110C4(&qword_10004E920);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v98 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v98 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v98 - v20;
  result = swift_beginAccess(a2 + 16, v115, 0, 0);
  if (*(_QWORD *)(a2 + 16))
    return result;
  v106 = v19;
  v101 = v16;
  v102 = v13;
  v108 = v9;
  v109 = v7;
  v105 = v6;
  v100 = (uint64_t *)(a2 + 16);
  v103 = v21;
  v23 = static os_log_type_t.default.getter(result);
  v24 = (void *)*sub_10001853C();
  v25 = sub_1000110C4(&qword_10004DC40);
  v26 = swift_allocObject(v25, 112, 7);
  v104 = xmmword_100036CC0;
  *(_OWORD *)(v26 + 16) = xmmword_100036CC0;
  v27 = v112;
  v28 = *v112;
  *(_QWORD *)(v26 + 56) = &type metadata for Int64;
  *(_QWORD *)(v26 + 64) = &protocol witness table for Int64;
  *(_QWORD *)(v26 + 32) = v28;
  v116[0] = *((_OWORD *)v27 + 2);
  *(_QWORD *)(v26 + 96) = &type metadata for String;
  v107 = sub_100012364();
  *(_QWORD *)(v26 + 104) = v107;
  *(_OWORD *)(v26 + 72) = *((_OWORD *)v27 + 2);
  v30 = *((_QWORD *)&v116[0] + 1);
  v29 = *(_QWORD *)&v116[0];
  v31 = v24;
  sub_10001DC84((uint64_t)v116);
  os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v31, "Merging in bloom filter update: %d for filter %@", 48, 2, v26);

  swift_bridgeObjectRelease(v26);
  v32 = *(uint64_t (**)(void))(*(_QWORD *)v113 + 176);
  v33 = swift_bridgeObjectRetain(v30);
  v34 = ((uint64_t (*)(uint64_t))v32)(v33);
  if (!v34)
  {
    v41 = sub_10001DCAC((uint64_t)v116);
    goto LABEL_11;
  }
  v35 = v34;
  v36 = v32;
  v99 = v28;
  v37 = *(_QWORD *)(v34 + 16);
  v38 = *(_QWORD *)(v34 + 24);
  swift_bridgeObjectRetain(v38);
  swift_release(v35);
  if (v29 != v37 || v30 != v38)
  {
    v42 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v30, v37, v38, 0);
    swift_bridgeObjectRelease(v38);
    v41 = sub_10001DCAC((uint64_t)v116);
    v39 = v108;
    v40 = (uint64_t)v106;
    v32 = v36;
    if ((v42 & 1) != 0)
      goto LABEL_8;
LABEL_11:
    v62 = static os_log_type_t.error.getter(v41);
    v63 = (void *)*sub_1000185EC();
    v64 = swift_allocObject(v25, 112, 7);
    v65 = v107;
    *(_QWORD *)(v64 + 56) = &type metadata for String;
    *(_QWORD *)(v64 + 64) = v65;
    v66 = v116[0];
    *(_OWORD *)(v64 + 16) = v104;
    *(_OWORD *)(v64 + 32) = v66;
    sub_10001DC84((uint64_t)v116);
    v67 = v63;
    v68 = v32();
    if (v68)
    {
      v69 = v68;
      v71 = *(_QWORD *)(v68 + 16);
      v70 = *(_QWORD *)(v68 + 24);
      swift_bridgeObjectRetain(v70);
      swift_release(v69);
    }
    else
    {
      v71 = 0;
      v70 = 0;
    }
    v114[0] = v71;
    v114[1] = v70;
    v72 = sub_1000110C4(&qword_10004E4D0);
    v73 = String.init<A>(describing:)(v114, v72);
    *(_QWORD *)(v64 + 96) = &type metadata for String;
    *(_QWORD *)(v64 + 104) = v65;
    *(_QWORD *)(v64 + 72) = v73;
    *(_QWORD *)(v64 + 80) = v74;
    os_log(_:dso:log:_:_:)(v62, &_mh_execute_header, v67, "Update asset had incorrect ID: %{public}@, %{public}@", 53, 2, v64);

    return swift_bridgeObjectRelease(v64);
  }
  swift_bridgeObjectRelease(v30);
  sub_10001DCAC((uint64_t)v116);
  v39 = v108;
  v40 = (uint64_t)v106;
LABEL_8:
  v43 = v109;
  v44 = (uint64_t)v103;
  v45 = v105;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v103, 1, 1, v105);
  v46 = v27[7];
  v47 = v117;
  if (v46)
  {
    v48 = v27[6];
    swift_bridgeObjectRetain(v27[7]);
    v113 = v48;
    sub_100018688(v48, v46, v40);
    sub_100020234(v44, &qword_10004E920);
    sub_10002D72C(v40, v44);
    v49 = (uint64_t)v101;
    v43 = v109;
    sub_10001E9EC(v44, (uint64_t)v101, &qword_10004E920);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v49, 1, v45) == 1)
    {
      v50 = sub_100020234(v49, &qword_10004E920);
      v51 = static os_log_type_t.error.getter(v50);
      v52 = (void *)*sub_1000185EC();
      v53 = swift_allocObject(v25, 72, 7);
      *(_OWORD *)(v53 + 16) = xmmword_100036CA0;
      v54 = v107;
      *(_QWORD *)(v53 + 56) = &type metadata for String;
      *(_QWORD *)(v53 + 64) = v54;
      v55 = v113;
      *(_QWORD *)(v53 + 32) = v113;
      *(_QWORD *)(v53 + 40) = v46;
      swift_bridgeObjectRetain(v46);
      v56 = v52;
      os_log(_:dso:log:_:_:)(v51, &_mh_execute_header, v56, "Update asset had invalid compression type: %@", 45, 2, v53);

      swift_bridgeObjectRelease(v53);
      v57 = sub_10002D6E8();
      v58 = swift_allocError(&type metadata for LaunchWarningControllerError, v57, 0, 0);
      *(_QWORD *)v59 = v55;
      *(_QWORD *)(v59 + 8) = v46;
      *(_BYTE *)(v59 + 16) = 1;
      sub_100020234(v44, &qword_10004E920);
      v60 = v100;
      swift_beginAccess(v100, v114, 1, 0);
      v61 = *v60;
      *v60 = v58;
      return swift_errorRelease(v61);
    }
    swift_bridgeObjectRelease(v46);
    sub_100020234(v49, &qword_10004E920);
    v45 = v105;
  }
  v75 = v25;
  v77 = v27[1];
  v76 = v27[2];
  v78 = (uint64_t)v102;
  sub_10001E9EC(v44, (uint64_t)v102, &qword_10004E920);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v78, 1, v45) == 1)
  {
    sub_10000ED74(v77, v76);
    sub_100020234(v78, &qword_10004E920);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v39, v78, v45);
    sub_10000ED74(v77, v76);
    sub_100018D78(v77, v76);
    v81 = v39;
    v82 = v43;
    if (v47)
    {
      v83 = swift_errorRelease(v47);
      v84 = static os_log_type_t.error.getter(v83);
      v85 = (void *)*sub_1000185EC();
      v86 = swift_allocObject(v75, 72, 7);
      *(_OWORD *)(v86 + 16) = xmmword_100036CA0;
      *(_QWORD *)(v86 + 56) = &type metadata for Int64;
      *(_QWORD *)(v86 + 64) = &protocol witness table for Int64;
      *(_QWORD *)(v86 + 32) = v99;
      v87 = v85;
      os_log(_:dso:log:_:_:)(v84, &_mh_execute_header, v87, "Update asset %lld had invalid compressed data", v98);

      swift_bridgeObjectRelease(v86);
      v88 = sub_10002D6E8();
      v89 = swift_allocError(&type metadata for LaunchWarningControllerError, v88, 0, 0);
      *(_QWORD *)v90 = 0;
      *(_QWORD *)(v90 + 8) = 0;
      *(_BYTE *)(v90 + 16) = 2;
      sub_10000EE2C(v77, v76);
      (*(void (**)(char *, uint64_t))(v82 + 8))(v108, v45);
      sub_100020234(v44, &qword_10004E920);
      v91 = v100;
      swift_beginAccess(v100, v114, 1, 0);
      v92 = *v91;
      *v91 = v89;
      return swift_errorRelease(v92);
    }
    v93 = v79;
    v94 = v80;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v45);
    sub_10000EE2C(v77, v76);
    v77 = v93;
    v76 = v94;
  }
  sub_10000ED74(v77, v76);
  sub_1000150BC(v77, v76);
  v96 = v110;
  if (v47)
  {
    sub_10000EE2C(v77, v76);
    return sub_100020234(v44, &qword_10004E920);
  }
  else
  {
    v97 = v95;
    sub_10001535C(v95);
    swift_bridgeObjectRelease(v97);
    sub_10000EE2C(v77, v76);
    sub_100020234(v44, &qword_10004E920);
    result = swift_beginAccess(v96 + 16, v114, 1, 0);
    if (__OFADD__(*(_QWORD *)(v96 + 16), 1))
      __break(1u);
    else
      ++*(_QWORD *)(v96 + 16);
  }
  return result;
}

void *sub_10002C52C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v10 = &_swiftEmptyArrayStorage;
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v0 + 224))(v7);
  v1 = v8;
  v2 = v9;
  sub_1000111AC(v7, v8);
  v5 = v0;
  v6 = &v10;
  (*(void (**)(void (*)(uint64_t), uint64_t *, uint64_t, uint64_t))(v2 + 8))(sub_10002D788, &v4, v1, v2);
  sub_1000111D0(v7);
  return v10;
}

void sub_10002C5C0(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t (*v43)(uint64_t);
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, unint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t *v96;
  unint64_t v97;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void **v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  __int128 v119;
  uint64_t v120;
  _QWORD v121[3];
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;

  v105 = a3;
  v118 = a2;
  v104 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0);
  v106 = *(_QWORD *)(v104 - 8);
  __chkstk_darwin(v104);
  v107 = (uint64_t)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = _s18LaunchWarningEntryVMa(0);
  v115 = *(_QWORD *)(v5 - 8);
  v116 = v5;
  __chkstk_darwin(v5);
  v108 = (uint64_t *)((char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1000110C4(&qword_10004E5C0);
  __chkstk_darwin(v7);
  v114 = (void **)((char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for LaunchWarningDetails(0);
  v112 = *(_QWORD *)(v9 - 8);
  v113 = v9;
  v10 = __chkstk_darwin(v9);
  v109 = (uint64_t)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v111 = (uint64_t)&v101 - v12;
  v13 = sub_1000110C4(&qword_10004E4E0);
  v14 = __chkstk_darwin(v13);
  v110 = (uint64_t)&v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v117 = (uint64_t)&v101 - v16;
  v17 = type metadata accessor for AppRecord(0);
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v120) = static os_log_type_t.info.getter(v18);
  v21 = sub_1000185EC();
  v22 = (void *)*v21;
  v23 = sub_1000110C4(&qword_10004DC40);
  v24 = swift_allocObject(v23, 72, 7);
  v119 = xmmword_100036CA0;
  *(_OWORD *)(v24 + 16) = xmmword_100036CA0;
  sub_10002040C(a1, (uint64_t)v20, type metadata accessor for AppRecord);
  v25 = v22;
  v26 = String.init<A>(describing:)(v20, v17);
  v28 = v27;
  *(_QWORD *)(v24 + 56) = &type metadata for String;
  v29 = sub_100012364();
  *(_QWORD *)(v24 + 64) = v29;
  *(_QWORD *)(v24 + 32) = v26;
  *(_QWORD *)(v24 + 40) = v28;
  os_log(_:dso:log:_:_:)(v120, &_mh_execute_header, v25, "Visiting application: %@", 24, 2, v24);

  v30 = swift_bridgeObjectRelease(v24);
  v31 = (uint64_t *)(a1 + *(int *)(v17 + 36));
  v32 = v31[2];
  if (v32 >> 60 == 15)
  {
    v33 = static os_log_type_t.info.getter(v30);
    v34 = (void *)*v21;
    v35 = swift_allocObject(v23, 72, 7);
    *(_OWORD *)(v35 + 16) = v119;
    v36 = v34;
    v37 = URL.path.getter();
    *(_QWORD *)(v35 + 56) = &type metadata for String;
    *(_QWORD *)(v35 + 64) = v29;
    *(_QWORD *)(v35 + 32) = v37;
    *(_QWORD *)(v35 + 40) = v38;
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v36, "Unable to find cdhash for %@", 28, 2, v35);

    swift_bridgeObjectRelease(v35);
  }
  else
  {
    v102 = v29;
    v39 = (void **)v21;
    v103 = v23;
    v120 = a1;
    v40 = *v31;
    v41 = v31[1];
    v42 = v118;
    v43 = *(uint64_t (**)(uint64_t))(*v118 + 152);
    v44 = sub_10000ED74(v41, v32);
    v45 = (void *)v43(v44);
    sub_10000ED74(v41, v32);
    v46 = v117;
    v47 = v124;
    sub_10001E7EC(v40, v41, v32, v117);
    sub_10002E918(v40, v41, v32);
    if (v47)
    {
      sub_10002E918(v40, v41, v32);

    }
    else
    {

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v115 + 48))(v46, 1, v116) == 1)
      {
        sub_100020234(v46, &qword_10004E4E0);
        v48 = *v42;
        v117 = v40;
        v49 = *(void (**)(uint64_t, unint64_t, uint64_t))(v48 + 280);
        sub_10000ED74(v41, v32);
        v50 = (uint64_t)v114;
        v49(v41, v32, v117);
        sub_10002E918(v117, v41, v32);
        v101 = v41;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v112 + 48))(v50, 1, v113) == 1)
        {
          v51 = sub_100020234(v50, &qword_10004E5C0);
          v52 = static os_log_type_t.info.getter(v51);
          v53 = *v39;
          v54 = swift_allocObject(v103, 72, 7);
          *(_OWORD *)(v54 + 16) = v119;
          v55 = v53;
          v56 = URL.path.getter();
          v57 = v102;
          *(_QWORD *)(v54 + 56) = &type metadata for String;
          *(_QWORD *)(v54 + 64) = v57;
          *(_QWORD *)(v54 + 32) = v56;
          *(_QWORD *)(v54 + 40) = v58;
          os_log(_:dso:log:_:_:)(v52, &_mh_execute_header, v55, "Found no launch warning for %@", 30, 2, v54);

          swift_bridgeObjectRelease(v54);
          sub_10002E918(v117, v101, v32);
        }
        else
        {
          v59 = v111;
          v60 = sub_10001F600(v50, v111, type metadata accessor for LaunchWarningDetails);
          LODWORD(v112) = static os_log_type_t.default.getter(v60);
          v114 = v39;
          v61 = *v39;
          v62 = swift_allocObject(v103, 112, 7);
          *(_OWORD *)(v62 + 16) = xmmword_100036CC0;
          v63 = v61;
          v124 = 0;
          v64 = v63;
          v65 = URL.path.getter();
          v66 = v102;
          *(_QWORD *)(v62 + 56) = &type metadata for String;
          *(_QWORD *)(v62 + 64) = v66;
          *(_QWORD *)(v62 + 32) = v65;
          *(_QWORD *)(v62 + 40) = v67;
          v68 = v109;
          sub_10002040C(v59, v109, type metadata accessor for LaunchWarningDetails);
          v69 = String.init<A>(describing:)(v68, v113);
          *(_QWORD *)(v62 + 96) = &type metadata for String;
          *(_QWORD *)(v62 + 104) = v66;
          *(_QWORD *)(v62 + 72) = v69;
          *(_QWORD *)(v62 + 80) = v70;
          os_log(_:dso:log:_:_:)(v112, &_mh_execute_header, v64, "Found launch warning for %@ with details: %@", 44, 2, v62);

          v71 = swift_bridgeObjectRelease(v62);
          v72 = v43(v71);
          v73 = v59;
          v74 = (void *)v72;
          v75 = v110;
          v76 = v124;
          sub_10001ED90(v73, v110);
          if (v76)
          {
            swift_errorRelease(v76);

            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v115 + 56))(v75, 1, 1, v116);
            v77 = sub_100020234(v75, &qword_10004E4E0);
            v78 = static os_log_type_t.error.getter(v77);
            v79 = *v114;
            v80 = swift_allocObject(v103, 72, 7);
            *(_OWORD *)(v80 + 16) = v119;
            v81 = v79;
            v82 = URL.path.getter();
            *(_QWORD *)(v80 + 56) = &type metadata for String;
            *(_QWORD *)(v80 + 64) = v66;
            *(_QWORD *)(v80 + 32) = v82;
            *(_QWORD *)(v80 + 40) = v83;
            os_log(_:dso:log:_:_:)(v78, &_mh_execute_header, v81, "Error creating new launch warning for %@", 40, 2, v80);

            swift_bridgeObjectRelease(v80);
            sub_10002E918(v117, v101, v32);
            sub_100013234(v73, type metadata accessor for LaunchWarningDetails);
          }
          else
          {

            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v115 + 56))(v75, 0, 1, v116);
            v84 = v108;
            v85 = sub_10001F600(v75, (uint64_t)v108, _s18LaunchWarningEntryVMa);
            v86 = static os_log_type_t.default.getter(v85);
            v87 = *v114;
            v88 = swift_allocObject(v103, 72, 7);
            *(_OWORD *)(v88 + 16) = v119;
            v89 = *v84;
            *(_QWORD *)(v88 + 56) = &type metadata for UInt64;
            *(_QWORD *)(v88 + 64) = &protocol witness table for UInt64;
            *(_QWORD *)(v88 + 32) = v89;
            v90 = v87;
            os_log(_:dso:log:_:_:)(v86, &_mh_execute_header, v90, "Created launch warning entry: %d", v101);

            swift_bridgeObjectRelease(v88);
            type metadata accessor for LaunchWarningMark();
            v91 = sub_10001B43C(v89);
            (*(void (**)(_QWORD *__return_ptr))(*v118 + 224))(v121);
            v92 = v122;
            v93 = v123;
            sub_1000111AC(v121, v122);
            v94 = v120;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v93 + 16))(v91, v120, v92, v93);
            sub_1000111D0(v121);
            v95 = v107;
            sub_10002040C(v94, v107, type metadata accessor for AppRecord);
            sub_10002040C(v73, v95 + *(int *)(v104 + 20), type metadata accessor for LaunchWarningDetails);
            v96 = v105;
            v97 = *v105;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v105);
            *v96 = v97;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v97 = sub_10002D220(0, *(_QWORD *)(v97 + 16) + 1, 1, v97);
              *v96 = v97;
            }
            v100 = *(_QWORD *)(v97 + 16);
            v99 = *(_QWORD *)(v97 + 24);
            if (v100 >= v99 >> 1)
            {
              v97 = sub_10002D220(v99 > 1, v100 + 1, 1, v97);
              *v96 = v97;
            }
            *(_QWORD *)(v97 + 16) = v100 + 1;
            sub_10001F600(v107, v97+ ((*(unsigned __int8 *)(v106 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80))+ *(_QWORD *)(v106 + 72) * v100, type metadata accessor for LaunchWarningController.NewLaunchWarning);
            swift_release(v91);
            sub_10002E918(v117, v101, v32);
            sub_100013234((uint64_t)v84, _s18LaunchWarningEntryVMa);
            sub_100013234(v73, type metadata accessor for LaunchWarningDetails);
          }
        }
      }
      else
      {
        sub_10002E918(v40, v41, v32);
        sub_100020234(v46, &qword_10004E4E0);
      }
    }
  }
}

uint64_t sub_10002CFC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v1 + 224))(v19);
  v3 = v20;
  v4 = v21;
  sub_1000111AC(v19, v20);
  v5 = (_QWORD *)(a1 + *(int *)(type metadata accessor for AppRecord(0) + 20));
  v7 = *v5;
  v6 = v5[1];
  v8 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v4 + 24))(*v5, v6, v3, v4);
  v9 = sub_1000111D0(v19);
  if ((v8 & 1) != 0)
  {
    v10 = static os_log_type_t.default.getter(v9);
    v11 = (void *)*sub_1000185EC();
    v12 = sub_1000110C4(&qword_10004DC40);
    v13 = swift_allocObject(v12, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v13 + 56) = &type metadata for String;
    *(_QWORD *)(v13 + 64) = sub_100012364();
    *(_QWORD *)(v13 + 32) = v7;
    *(_QWORD *)(v13 + 40) = v6;
    v14 = v11;
    swift_bridgeObjectRetain(v6);
    os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v14, "Successfully terminated app: %@", 31, 2, v13);
  }
  else
  {
    v15 = static os_log_type_t.error.getter(v9);
    v16 = (void *)*sub_1000185EC();
    v17 = sub_1000110C4(&qword_10004DC40);
    v13 = swift_allocObject(v17, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_100036CA0;
    *(_QWORD *)(v13 + 56) = &type metadata for String;
    *(_QWORD *)(v13 + 64) = sub_100012364();
    *(_QWORD *)(v13 + 32) = v7;
    *(_QWORD *)(v13 + 40) = v6;
    v14 = v16;
    swift_bridgeObjectRetain(v6);
    os_log(_:dso:log:_:_:)(v15, &_mh_execute_header, v14, "Failed to terminate app: %@", 27, 2, v13);
  }

  swift_bridgeObjectRelease(v13);
  return v8 & 1;
}

uint64_t sub_10002D180()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  v2 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter));
  sub_1000111D0((_QWORD *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit));
  sub_1000111D0((_QWORD *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager));
  sub_1000111D0((_QWORD *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10002D220(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000110C4(&qword_10004EB38);
  v11 = *(_QWORD *)(type metadata accessor for LaunchWarningController.NewLaunchWarning(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002E934(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_10002D428(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10002D46C()
{
  unint64_t result;

  result = qword_10004E910;
  if (!qword_10004E910)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10004E910);
  }
  return result;
}

uint64_t sub_10002D4B0(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 v17;
  uint64_t v18;
  _UNKNOWN **v19;
  _BYTE v20[24];

  v4 = v3;
  v8 = (uint64_t *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  *v8 = 0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db) = a1;
  swift_beginAccess(v8, v20, 1, 0);
  v9 = *v8;
  *v8 = a2;
  v10 = a1;
  swift_retain(a2);
  swift_release(v9);
  sub_10002D428((uint64_t)a3, v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit);
  if (qword_100051290 != -1)
    swift_once(&qword_100051290, sub_100029100);
  v11 = type metadata accessor for URL(0);
  v12 = sub_1000132D0(v11, (uint64_t)qword_1000516D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL, v12, v11);
  v13 = type metadata accessor for AppManager();
  v14 = sub_100012278();
  v15 = (uint64_t *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager);
  v15[3] = v13;
  v15[4] = (uint64_t)&off_100046010;
  *v15 = v14;
  v18 = type metadata accessor for MetricReporter();
  v19 = &off_100047B08;
  *(_QWORD *)&v17 = sub_100012278();
  sub_1000111D0(a3);
  sub_1000207C8(&v17, v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics);
  return v4;
}

uint64_t sub_10002D61C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002D62C()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002D650()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002D68C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_10002BCE4(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_10002D6A8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for BloomFilter();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002D6E8()
{
  unint64_t result;

  result = qword_10004E938;
  if (!qword_10004E938)
  {
    result = swift_getWitnessTable(&unk_100038250, &type metadata for LaunchWarningControllerError);
    atomic_store(result, (unint64_t *)&qword_10004E938);
  }
  return result;
}

uint64_t sub_10002D72C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000110C4(&qword_10004E920);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LaunchWarningController.NewLaunchWarning(uint64_t a1)
{
  return sub_100011554(a1, qword_100051330, (uint64_t)&nominal type descriptor for LaunchWarningController.NewLaunchWarning);
}

void sub_10002D788(uint64_t a1)
{
  uint64_t v1;

  sub_10002C5C0(a1, *(uint64_t **)(v1 + 16), *(unint64_t **)(v1 + 24));
}

uint64_t sub_10002D7A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 1)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for LaunchWarningControllerError(uint64_t a1)
{
  return sub_10002D7CC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10002D7CC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 1)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t _s17online_auth_agent28LaunchWarningControllerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10002D7A4(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LaunchWarningControllerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10002D7A4(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10002D7CC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for LaunchWarningControllerError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10002D7CC(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for LaunchWarningControllerError()
{
  return &type metadata for LaunchWarningControllerError;
}

uint64_t sub_10002D8D4()
{
  return type metadata accessor for LaunchWarningController(0);
}

uint64_t type metadata accessor for LaunchWarningController(uint64_t a1)
{
  return sub_100011554(a1, (uint64_t *)&unk_100051320, (uint64_t)&nominal type descriptor for LaunchWarningController);
}

uint64_t sub_10002D8F0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = "\b";
    v4[3] = &unk_1000382E0;
    v4[4] = &unk_1000382E0;
    v4[5] = &unk_1000382E0;
    result = swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for LaunchWarningController.SyncResult(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningController.SyncResult(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[18])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchWarningController.SyncResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningController.SyncResult()
{
  return &type metadata for LaunchWarningController.SyncResult;
}

uint64_t *sub_10002DA3C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  int *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v44)(uint64_t *, uint64_t *, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v22);
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    v8 = *(_QWORD *)(v7 - 8);
    v44 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v44(a1, a2, v7);
    v9 = (int *)type metadata accessor for AppRecord(0);
    v10 = v9[5];
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = v9[6];
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    *(uint64_t *)((char *)a1 + v9[7]) = *(uint64_t *)((char *)a2 + v9[7]);
    v18 = v9[8];
    v19 = (char *)a1 + v18;
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRetain(v17);
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)v19 = *(_OWORD *)v20;
    }
    else
    {
      v23 = *v20;
      sub_10000ED74(*v20, v21);
      *(_QWORD *)v19 = v23;
      *((_QWORD *)v19 + 1) = v21;
    }
    v24 = v9[9];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    v27 = *((_QWORD *)v26 + 2);
    if (v27 >> 60 == 15)
    {
      *(_OWORD *)v25 = *(_OWORD *)v26;
      *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
    }
    else
    {
      *(_DWORD *)v25 = *(_DWORD *)v26;
      v28 = *((_QWORD *)v26 + 1);
      sub_10000ED74(v28, v27);
      *((_QWORD *)v25 + 1) = v28;
      *((_QWORD *)v25 + 2) = v27;
    }
    v29 = *(int *)(a3 + 20);
    v30 = (char *)a1 + v29;
    v31 = (char *)a2 + v29;
    *(_DWORD *)((char *)a1 + v29) = *(_DWORD *)((char *)a2 + v29);
    v32 = *(uint64_t *)((char *)a2 + v29 + 8);
    v33 = *((_QWORD *)v31 + 2);
    sub_10000ED74(*((_QWORD *)v31 + 1), v33);
    *((_QWORD *)v30 + 1) = v32;
    *((_QWORD *)v30 + 2) = v33;
    v34 = (int *)type metadata accessor for LaunchWarningDetails(0);
    v35 = v34[6];
    v36 = &v30[v35];
    v37 = &v31[v35];
    v38 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v36, v37, v38);
    v30[v34[7]] = v31[v34[7]];
    *(_QWORD *)&v30[v34[8]] = *(_QWORD *)&v31[v34[8]];
    v39 = v34[9];
    v40 = &v30[v39];
    v41 = &v31[v39];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&v31[v39], 1, v7))
    {
      v42 = sub_1000110C4(&qword_10004E810);
      memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    }
    else
    {
      v44((uint64_t *)v40, (uint64_t *)v41, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v40, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_10002DCA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  void (*v17)(uint64_t, uint64_t);

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v17 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v17(a1, v4);
  v6 = (int *)type metadata accessor for AppRecord(0);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v6[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v6[6] + 8));
  v7 = (uint64_t *)(a1 + v6[8]);
  v8 = v7[1];
  if (v8 >> 60 != 15)
    sub_10000EE2C(*v7, v8);
  v9 = a1 + v6[9];
  v10 = *(_QWORD *)(v9 + 16);
  if (v10 >> 60 != 15)
    sub_10000EE2C(*(_QWORD *)(v9 + 8), v10);
  v11 = a1 + *(int *)(a2 + 20);
  sub_10000EE2C(*(_QWORD *)(v11 + 8), *(_QWORD *)(v11 + 16));
  v12 = type metadata accessor for LaunchWarningDetails(0);
  v13 = v11 + *(int *)(v12 + 24);
  v14 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = v11 + *(int *)(v12 + 36);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v15, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v17)(v15, v4);
  return result;
}

uint64_t sub_10002DDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const void *v39;
  uint64_t v40;
  void (*v42)(uint64_t, uint64_t, uint64_t);

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v42(a1, a2, v6);
  v8 = (int *)type metadata accessor for AppRecord(0);
  v9 = v8[5];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = v8[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  *(_QWORD *)(a1 + v8[7]) = *(_QWORD *)(a2 + v8[7]);
  v17 = v8[8];
  v18 = a1 + v17;
  v19 = (uint64_t *)(a2 + v17);
  v20 = *(_QWORD *)(a2 + v17 + 8);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v16);
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  else
  {
    v21 = *v19;
    sub_10000ED74(*v19, v20);
    *(_QWORD *)v18 = v21;
    *(_QWORD *)(v18 + 8) = v20;
  }
  v22 = v8[9];
  v23 = a1 + v22;
  v24 = a2 + v22;
  v25 = *(_QWORD *)(v24 + 16);
  if (v25 >> 60 == 15)
  {
    *(_OWORD *)v23 = *(_OWORD *)v24;
    *(_QWORD *)(v23 + 16) = *(_QWORD *)(v24 + 16);
  }
  else
  {
    *(_DWORD *)v23 = *(_DWORD *)v24;
    v26 = *(_QWORD *)(v24 + 8);
    sub_10000ED74(v26, v25);
    *(_QWORD *)(v23 + 8) = v26;
    *(_QWORD *)(v23 + 16) = v25;
  }
  v27 = *(int *)(a3 + 20);
  v28 = a1 + v27;
  v29 = a2 + v27;
  *(_DWORD *)(a1 + v27) = *(_DWORD *)(a2 + v27);
  v30 = *(_QWORD *)(a2 + v27 + 8);
  v31 = *(_QWORD *)(v29 + 16);
  sub_10000ED74(*(_QWORD *)(v29 + 8), v31);
  *(_QWORD *)(v28 + 8) = v30;
  *(_QWORD *)(v28 + 16) = v31;
  v32 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v33 = v32[6];
  v34 = v28 + v33;
  v35 = v29 + v33;
  v36 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
  *(_BYTE *)(v28 + v32[7]) = *(_BYTE *)(v29 + v32[7]);
  *(_QWORD *)(v28 + v32[8]) = *(_QWORD *)(v29 + v32[8]);
  v37 = v32[9];
  v38 = (void *)(v28 + v37);
  v39 = (const void *)(v29 + v37);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v29 + v37, 1, v6))
  {
    v40 = sub_1000110C4(&qword_10004E810);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    v42((uint64_t)v38, (uint64_t)v39, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v38, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_10002E024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  unint64_t v31;
  unint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t (*v56)(void *, uint64_t, uint64_t);
  int v57;
  uint64_t v58;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for AppRecord(0);
  v10 = v9[5];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v13 = v12[1];
  v14 = v11[1];
  v11[1] = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  v15 = v9[6];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v18 = v17[1];
  v19 = v16[1];
  v16[1] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(_QWORD *)(a1 + v9[7]) = *(_QWORD *)(a2 + v9[7]);
  v20 = v9[8];
  v21 = (uint64_t *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  v23 = *(_QWORD *)(a2 + v20 + 8);
  if (*(_QWORD *)(a1 + v20 + 8) >> 60 == 15)
  {
    if (v23 >> 60 != 15)
    {
      v24 = *v22;
      sub_10000ED74(v24, v23);
      *v21 = v24;
      v21[1] = v23;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v23 >> 60 == 15)
  {
    sub_100012E20((uint64_t)v21);
LABEL_6:
    *(_OWORD *)v21 = *(_OWORD *)v22;
    goto LABEL_8;
  }
  v25 = *v22;
  sub_10000ED74(v25, v23);
  v26 = *v21;
  v27 = v21[1];
  *v21 = v25;
  v21[1] = v23;
  sub_10000EE2C(v26, v27);
LABEL_8:
  v28 = v9[9];
  v29 = a1 + v28;
  v30 = (__int128 *)(a2 + v28);
  v31 = *(_QWORD *)(a1 + v28 + 16) >> 60;
  v32 = *(_QWORD *)(a2 + v28 + 16) >> 60;
  if (v31 <= 0xE)
  {
    if (v32 <= 0xE)
    {
      *(_DWORD *)v29 = *(_DWORD *)v30;
      v37 = *((_QWORD *)v30 + 1);
      v38 = *((_QWORD *)v30 + 2);
      sub_10000ED74(v37, v38);
      v39 = *(_QWORD *)(v29 + 8);
      v40 = *(_QWORD *)(v29 + 16);
      *(_QWORD *)(v29 + 8) = v37;
      *(_QWORD *)(v29 + 16) = v38;
      sub_10000EE2C(v39, v40);
    }
    else
    {
      sub_100012E54(v29);
      v34 = *((_QWORD *)v30 + 2);
      *(_OWORD *)v29 = *v30;
      *(_QWORD *)(v29 + 16) = v34;
    }
  }
  else if (v32 <= 0xE)
  {
    *(_DWORD *)v29 = *(_DWORD *)v30;
    v35 = *((_QWORD *)v30 + 1);
    v36 = *((_QWORD *)v30 + 2);
    sub_10000ED74(v35, v36);
    *(_QWORD *)(v29 + 8) = v35;
    *(_QWORD *)(v29 + 16) = v36;
  }
  else
  {
    v33 = *v30;
    *(_QWORD *)(v29 + 16) = *((_QWORD *)v30 + 2);
    *(_OWORD *)v29 = v33;
  }
  v41 = *(int *)(a3 + 20);
  v42 = a1 + v41;
  v43 = a2 + v41;
  *(_DWORD *)(a1 + v41) = *(_DWORD *)(a2 + v41);
  v44 = *(_QWORD *)(a2 + v41 + 8);
  v45 = *(_QWORD *)(v43 + 16);
  sub_10000ED74(*(_QWORD *)(v43 + 8), v45);
  v46 = *(_QWORD *)(v42 + 8);
  v47 = *(_QWORD *)(v42 + 16);
  *(_QWORD *)(v42 + 8) = v44;
  *(_QWORD *)(v42 + 16) = v45;
  sub_10000EE2C(v46, v47);
  v48 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v49 = v48[6];
  v50 = v42 + v49;
  v51 = v43 + v49;
  v52 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 24))(v50, v51, v52);
  *(_BYTE *)(v42 + v48[7]) = *(_BYTE *)(v43 + v48[7]);
  *(_QWORD *)(v42 + v48[8]) = *(_QWORD *)(v43 + v48[8]);
  v53 = v48[9];
  v54 = (void *)(v42 + v53);
  v55 = (void *)(v43 + v53);
  v56 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v51) = v56(v54, 1, v6);
  v57 = v56(v55, 1, v6);
  if (!(_DWORD)v51)
  {
    if (!v57)
    {
      v8((uint64_t)v54, (uint64_t)v55, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v54, v6);
    goto LABEL_20;
  }
  if (v57)
  {
LABEL_20:
    v58 = sub_1000110C4(&qword_10004E810);
    memcpy(v54, v55, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v54, v55, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v54, 0, 1, v6);
  return a1;
}

char *sub_10002E35C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for AppRecord(0);
  *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
  *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
  *(_QWORD *)&a1[v9[7]] = *(_QWORD *)&a2[v9[7]];
  *(_OWORD *)&a1[v9[8]] = *(_OWORD *)&a2[v9[8]];
  v10 = v9[9];
  v11 = &a1[v10];
  v12 = &a2[v10];
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *((_QWORD *)v11 + 2) = *((_QWORD *)v12 + 2);
  v13 = *(int *)(a3 + 20);
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_DWORD *)v14 = *(_DWORD *)&a2[v13];
  *(_OWORD *)(v14 + 8) = *(_OWORD *)&a2[v13 + 8];
  v16 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v17 = v16[6];
  v18 = &v14[v17];
  v19 = &v15[v17];
  v20 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v14[v16[7]] = v15[v16[7]];
  *(_QWORD *)&v14[v16[8]] = *(_QWORD *)&v15[v16[8]];
  v21 = v16[9];
  v22 = &v14[v21];
  v23 = &v15[v21];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&v15[v21], 1, v6))
  {
    v24 = sub_1000110C4(&qword_10004E810);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v8(v22, v23, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v22, 0, 1, v6);
  }
  return a1;
}

uint64_t sub_10002E4F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t (*v47)(void *, uint64_t, uint64_t);
  int v48;
  uint64_t v49;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = (int *)type metadata accessor for AppRecord(0);
  v10 = v9[5];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  v15 = v11[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease(v15);
  v16 = v9[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  v21 = v17[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease(v21);
  *(_QWORD *)(a1 + v9[7]) = *(_QWORD *)(a2 + v9[7]);
  v22 = v9[8];
  v23 = a1 + v22;
  v24 = a2 + v22;
  v25 = *(_QWORD *)(a1 + v22 + 8);
  if (v25 >> 60 == 15)
    goto LABEL_4;
  v26 = *(_QWORD *)(v24 + 8);
  if (v26 >> 60 == 15)
  {
    sub_100012E20(v23);
LABEL_4:
    *(_OWORD *)v23 = *(_OWORD *)v24;
    goto LABEL_6;
  }
  v27 = *(_QWORD *)v23;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_QWORD *)(v23 + 8) = v26;
  sub_10000EE2C(v27, v25);
LABEL_6:
  v28 = v9[9];
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = *(_QWORD *)(a1 + v28 + 16);
  if (v31 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)v29 = *(_OWORD *)v30;
    *(_QWORD *)(v29 + 16) = *(_QWORD *)(v30 + 16);
    goto LABEL_11;
  }
  v32 = *(_QWORD *)(v30 + 16);
  if (v32 >> 60 == 15)
  {
    sub_100012E54(v29);
    goto LABEL_9;
  }
  *(_DWORD *)v29 = *(_DWORD *)v30;
  v33 = *(_QWORD *)(v29 + 8);
  *(_QWORD *)(v29 + 8) = *(_QWORD *)(v30 + 8);
  *(_QWORD *)(v29 + 16) = v32;
  sub_10000EE2C(v33, v31);
LABEL_11:
  v34 = *(int *)(a3 + 20);
  v35 = a1 + v34;
  v36 = a2 + v34;
  *(_DWORD *)v35 = *(_DWORD *)(a2 + v34);
  v37 = *(_QWORD *)(a1 + v34 + 8);
  v38 = *(_QWORD *)(a1 + v34 + 16);
  *(_OWORD *)(v35 + 8) = *(_OWORD *)(a2 + v34 + 8);
  sub_10000EE2C(v37, v38);
  v39 = (int *)type metadata accessor for LaunchWarningDetails(0);
  v40 = v39[6];
  v41 = v35 + v40;
  v42 = v36 + v40;
  v43 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 40))(v41, v42, v43);
  *(_BYTE *)(v35 + v39[7]) = *(_BYTE *)(v36 + v39[7]);
  *(_QWORD *)(v35 + v39[8]) = *(_QWORD *)(v36 + v39[8]);
  v44 = v39[9];
  v45 = (void *)(v35 + v44);
  v46 = (void *)(v36 + v44);
  v47 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v42) = v47(v45, 1, v6);
  v48 = v47(v46, 1, v6);
  if (!(_DWORD)v42)
  {
    if (!v48)
    {
      v8((uint64_t)v45, (uint64_t)v46, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v45, v6);
    goto LABEL_16;
  }
  if (v48)
  {
LABEL_16:
    v49 = sub_1000110C4(&qword_10004E810);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v45, v46, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v45, 0, 1, v6);
  return a1;
}

uint64_t sub_10002E78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002E798);
}

uint64_t sub_10002E798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for AppRecord(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for LaunchWarningDetails(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_10002E80C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002E818);
}

uint64_t sub_10002E818(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for AppRecord(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for LaunchWarningDetails(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_10002E894(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[2];

  result = type metadata accessor for AppRecord(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for LaunchWarningDetails(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10002E918(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 >> 60 != 15)
    return sub_10000EE2C(a2, a3);
  return result;
}

uint64_t sub_10002E934(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for LaunchWarningController.NewLaunchWarning(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

void sub_10002EA50(__int16 a1, uint64_t a2, __int16 a3, double a4)
{
  NSString v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;

  v8 = String._bridgeToObjectiveC()();
  v9 = swift_allocObject(&unk_1000479D8, 48, 7);
  *(_BYTE *)(v9 + 16) = a1 & 1;
  *(_BYTE *)(v9 + 17) = HIBYTE(a1) & 1;
  *(_QWORD *)(v9 + 24) = a2;
  *(_BYTE *)(v9 + 32) = a3 & 1;
  *(_BYTE *)(v9 + 33) = HIBYTE(a3) & 1;
  *(double *)(v9 + 40) = a4;
  v11[4] = sub_10002EB60;
  v12 = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10002EDE8;
  v11[3] = &unk_1000479F0;
  v10 = _Block_copy(v11);
  swift_release(v12);
  AnalyticsSendEventLazy(v8, v10);
  _Block_release(v10);

}

uint64_t sub_10002EB50()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

unint64_t sub_10002EB60()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v3;

  v0 = sub_1000110C4(&qword_10004EC00);
  inited = swift_initStackObject(v0, &v3);
  *(_OWORD *)(inited + 16) = xmmword_100038330;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x800000010003BCA0;
  *(NSNumber *)(inited + 48) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 56) = 0xD000000000000012;
  *(_QWORD *)(inited + 64) = 0x800000010003BCC0;
  *(NSNumber *)(inited + 72) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 80) = 0xD000000000000012;
  *(_QWORD *)(inited + 88) = 0x800000010003BCE0;
  *(NSNumber *)(inited + 96) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 104) = 0x65746C694677656ELL;
  *(_QWORD *)(inited + 112) = 0xE900000000000072;
  *(NSNumber *)(inited + 120) = Bool._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 128) = 0x70616C45656D6974;
  *(_QWORD *)(inited + 136) = 0xEB00000000646573;
  *(NSNumber *)(inited + 144) = Double._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 152) = 0x6F43657461647075;
  *(_QWORD *)(inited + 160) = 0xEB00000000746E75;
  *(NSNumber *)(inited + 168) = Int._bridgeToObjectiveC()();
  return sub_10002ECD0(inited);
}

unint64_t sub_10002ECD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000110C4(&qword_10004EC08);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_10002F654(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Class sub_10002EDE8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10002F798();
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

uint64_t sub_10002EE5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002EE6C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10002EE74(uint64_t a1, double a2)
{
  NSString v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;

  v4 = String._bridgeToObjectiveC()();
  v5 = swift_allocObject(&unk_100047A28, 32, 7);
  *(_QWORD *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  v8[4] = sub_10002EF7C;
  v9 = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10002EDE8;
  v8[3] = &unk_100047A40;
  v6 = _Block_copy(v8);
  v7 = v9;
  swift_errorRetain(a1);
  swift_release(v7);
  AnalyticsSendEventLazy(v4, v6);
  _Block_release(v6);

}

uint64_t sub_10002EF58()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

id sub_10002EF7C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t inited;
  id result;
  unint64_t v5;
  _BYTE v6[104];

  v1 = (void *)_convertErrorToNSError(_:)(*(_QWORD *)(v0 + 16));
  v2 = sub_1000110C4(&qword_10004EC00);
  inited = swift_initStackObject(v2, v6);
  *(_OWORD *)(inited + 16) = xmmword_100038340;
  *(_QWORD *)(inited + 32) = 1701080931;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  objc_msgSend(v1, "code");
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 56) = 0x6E69616D6F64;
  *(_QWORD *)(inited + 64) = 0xE600000000000000;
  result = objc_msgSend(v1, "domain");
  if (result)
  {
    *(_QWORD *)(inited + 72) = result;
    *(_QWORD *)(inited + 80) = 0x70616C45656D6974;
    *(_QWORD *)(inited + 88) = 0xEB00000000646573;
    *(NSNumber *)(inited + 96) = Double._bridgeToObjectiveC()();
    v5 = sub_10002ECD0(inited);

    return (id)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10002F078(int a1, uint64_t a2, unint64_t a3, char a4, char a5)
{
  char v9;
  NSString v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;

  v9 = a5 & 1;
  v10 = String._bridgeToObjectiveC()();
  v11 = swift_allocObject(&unk_100047A78, 42, 7);
  *(_DWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  *(_QWORD *)(v11 + 32) = a3;
  *(_BYTE *)(v11 + 40) = v9;
  *(_BYTE *)(v11 + 41) = a4;
  v14[4] = sub_10002F17C;
  v15 = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10002EDE8;
  v14[3] = &unk_100047A90;
  v12 = _Block_copy(v14);
  v13 = v15;
  sub_10000ED74(a2, a3);
  swift_release(v13);
  AnalyticsSendEventLazy(v10, v12);
  _Block_release(v12);

}

uint64_t sub_10002F174()
{
  return sub_10002F384(42);
}

unint64_t sub_10002F17C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = sub_1000110C4(&qword_10004EC00);
  inited = swift_initStackObject(v3, &v9);
  *(_OWORD *)(inited + 16) = xmmword_100038350;
  *(_QWORD *)(inited + 32) = 0x687361686463;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  sub_100010E8C(v1, v2);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = 0x7954687361686463;
  *(_QWORD *)(inited + 64) = 0xEA00000000006570;
  *(NSNumber *)(inited + 72) = UInt32._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 80) = 0x6E6F697461636F6CLL;
  *(_QWORD *)(inited + 88) = 0xE800000000000000;
  *(NSNumber *)(inited + 96) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 104) = 0x74616E696D726574;
  *(_QWORD *)(inited + 112) = 0xEA00000000006465;
  *(NSNumber *)(inited + 120) = Bool._bridgeToObjectiveC()();
  return sub_10002ECD0(inited);
}

void sub_10002F290(int a1, uint64_t a2, unint64_t a3)
{
  NSString v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;

  v6 = String._bridgeToObjectiveC()();
  v7 = swift_allocObject(&unk_100047AC8, 40, 7);
  *(_DWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = a3;
  v10[4] = sub_10002F3B4;
  v11 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10002EDE8;
  v10[3] = &unk_100047AE0;
  v8 = _Block_copy(v10);
  v9 = v11;
  sub_10000ED74(a2, a3);
  swift_release(v9);
  AnalyticsSendEventLazy(v6, v8);
  _Block_release(v8);

}

uint64_t sub_10002F37C()
{
  return sub_10002F384(40);
}

uint64_t sub_10002F384(uint64_t a1)
{
  uint64_t v1;

  sub_10000EE2C(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
  return swift_deallocObject(v1, a1, 7);
}

unint64_t sub_10002F3B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = sub_1000110C4(&qword_10004EC00);
  inited = swift_initStackObject(v3, &v9);
  *(_OWORD *)(inited + 16) = xmmword_100036CC0;
  *(_QWORD *)(inited + 32) = 0x687361686463;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  sub_100010E8C(v2, v1);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = 0x7954687361686463;
  *(_QWORD *)(inited + 64) = 0xEA00000000006570;
  *(NSNumber *)(inited + 72) = UInt32._bridgeToObjectiveC()();
  return sub_10002ECD0(inited);
}

unint64_t sub_10002F474()
{
  unint64_t result;

  result = qword_10004EB40;
  if (!qword_10004EB40)
  {
    result = swift_getWitnessTable(&unk_10003836C, &type metadata for WarningLocation);
    atomic_store(result, (unint64_t *)&qword_10004EB40);
  }
  return result;
}

uint64_t sub_10002F4B8(__int16 a1, uint64_t a2, __int16 a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)v3 + 80))(a1 & 0x101, a2, a3 & 0x101);
}

uint64_t sub_10002F4EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 88))();
}

uint64_t sub_10002F514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(**(_QWORD **)v5 + 96))(a1, a2, a3, a4, a5 & 1);
}

uint64_t sub_10002F540()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 104))();
}

uint64_t storeEnumTagSinglePayload for WarningLocation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10002F5B4 + 4 * byte_100038365[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10002F5E8 + 4 * byte_100038360[v4]))();
}

uint64_t sub_10002F5E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002F5F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002F5F8);
  return result;
}

uint64_t sub_10002F604(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002F60CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10002F610(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002F618(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WarningLocation()
{
  return &type metadata for WarningLocation;
}

uint64_t type metadata accessor for MetricReporter()
{
  return objc_opt_self(_TtC17online_auth_agent14MetricReporter);
}

unint64_t sub_10002F654(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10002F6B8(a1, a2, v5);
}

unint64_t sub_10002F6B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002F798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004EC10;
  if (!qword_10004EC10)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004EC10);
  }
  return result;
}

uint64_t type metadata accessor for BloomFilterRecord(uint64_t a1)
{
  return sub_100011554(a1, (uint64_t *)&unk_100051640, (uint64_t)&nominal type descriptor for BloomFilterRecord);
}

int *sub_10002F800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v23;
  int *result;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;

  v23 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(a9, a1, v23);
  result = (int *)type metadata accessor for BloomFilterRecord(0);
  v25 = (_QWORD *)(a9 + result[5]);
  *v25 = a2;
  v25[1] = a3;
  *(_QWORD *)(a9 + result[6]) = a4;
  v26 = (_QWORD *)(a9 + result[7]);
  *v26 = a5;
  v26[1] = a6;
  v27 = (_QWORD *)(a9 + result[8]);
  *v27 = a7;
  v27[1] = a8;
  v28 = (_QWORD *)(a9 + result[9]);
  *v28 = a10;
  v28[1] = a11;
  v29 = (_QWORD *)(a9 + result[10]);
  *v29 = a12;
  v29[1] = a13;
  *(_QWORD *)(a9 + result[11]) = a14;
  v30 = (_QWORD *)(a9 + result[12]);
  *v30 = a15;
  v30[1] = a16;
  return result;
}

uint64_t sub_10002F924@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_10002F960@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t type metadata accessor for BaseZoneSyncResult(uint64_t a1)
{
  return sub_100011554(a1, (uint64_t *)&unk_100051660, (uint64_t)&nominal type descriptor for BaseZoneSyncResult);
}

uint64_t sub_10002F988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t result;
  _QWORD *v11;

  sub_100028E08(a1, a5, &qword_10004E648);
  v9 = type metadata accessor for BaseZoneSyncResult(0);
  result = sub_100028E08(a2, a5 + *(int *)(v9 + 20), &qword_10004E640);
  v11 = (_QWORD *)(a5 + *(int *)(v9 + 24));
  *v11 = a3;
  v11[1] = a4;
  return result;
}

uint64_t sub_10002FA00(char a1)
{
  return a1 & 1;
}

unint64_t sub_10002FA0C()
{
  unint64_t result;

  result = qword_10004EC18;
  if (!qword_10004EC18)
  {
    result = swift_getWitnessTable(&unk_10003847C, &type metadata for CloudKitOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004EC18);
  }
  return result;
}

uint64_t *sub_10002FA50(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v36 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v36);
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = *v10;
    v12 = v10[1];
    sub_10000ED74(*v10, v12);
    v13 = a3[6];
    v14 = a3[7];
    v15 = *(uint64_t *)((char *)a2 + v13);
    *v9 = v11;
    v9[1] = v12;
    *(uint64_t *)((char *)a1 + v13) = v15;
    v16 = (uint64_t *)((char *)a1 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = a3[8];
    v20 = a3[9];
    v21 = (uint64_t *)((char *)a1 + v19);
    v22 = (uint64_t *)((char *)a2 + v19);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = (uint64_t *)((char *)a1 + v20);
    v25 = (uint64_t *)((char *)a2 + v20);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = a3[10];
    v28 = a3[11];
    v29 = (uint64_t *)((char *)a1 + v27);
    v30 = (uint64_t *)((char *)a2 + v27);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    *(uint64_t *)((char *)a1 + v28) = *(uint64_t *)((char *)a2 + v28);
    v32 = a3[12];
    v33 = (uint64_t *)((char *)a1 + v32);
    v34 = (uint64_t *)((char *)a2 + v32);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v23);
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRetain(v35);
  }
  return a1;
}

uint64_t sub_10002FB88(uint64_t a1, int *a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_10000EE2C(*(_QWORD *)(a1 + a2[5]), *(_QWORD *)(a1 + a2[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[7] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[8] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[9] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[10] + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[12] + 8));
}

uint64_t sub_10002FC20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_10000ED74(*v9, v11);
  v12 = a3[6];
  v13 = a3[7];
  v14 = *(_QWORD *)(a2 + v12);
  *v8 = v10;
  v8[1] = v11;
  *(_QWORD *)(a1 + v12) = v14;
  v15 = (_QWORD *)(a1 + v13);
  v16 = (_QWORD *)(a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = a3[8];
  v19 = a3[9];
  v20 = (_QWORD *)(a1 + v18);
  v21 = (_QWORD *)(a2 + v18);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = (_QWORD *)(a1 + v19);
  v24 = (_QWORD *)(a2 + v19);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = a3[10];
  v27 = a3[11];
  v28 = (_QWORD *)(a1 + v26);
  v29 = (_QWORD *)(a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  *(_QWORD *)(a1 + v27) = *(_QWORD *)(a2 + v27);
  v31 = a3[12];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRetain(v34);
  return a1;
}

uint64_t sub_10002FD2C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_10000ED74(*v9, v11);
  v12 = *v8;
  v13 = v8[1];
  *v8 = v10;
  v8[1] = v11;
  sub_10000EE2C(v12, v13);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v17 = v16[1];
  v18 = v15[1];
  v15[1] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v18);
  v19 = a3[8];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  *v20 = *v21;
  v22 = v21[1];
  v23 = v20[1];
  v20[1] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  v24 = a3[9];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v27 = v26[1];
  v28 = v25[1];
  v25[1] = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  v29 = a3[10];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  *v30 = *v31;
  v32 = v31[1];
  v33 = v30[1];
  v30[1] = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v34 = a3[12];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (_QWORD *)(a2 + v34);
  *v35 = *v36;
  v37 = v36[1];
  v38 = v35[1];
  v35[1] = v37;
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRelease(v38);
  return a1;
}

uint64_t sub_10002FEA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  v10 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  return a1;
}

uint64_t sub_10002FF40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(_QWORD *)(a1 + v7);
  v9 = *(_QWORD *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_10000EE2C(v8, v9);
  v10 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  v15 = v11[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease(v15);
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  v21 = v17[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease(v21);
  v22 = a3[9];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  v27 = v23[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease(v27);
  v28 = a3[10];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (uint64_t *)(a2 + v28);
  v32 = *v30;
  v31 = v30[1];
  v33 = v29[1];
  *v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease(v33);
  v34 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v35 = (_QWORD *)(a1 + v34);
  v36 = (uint64_t *)(a2 + v34);
  v38 = *v36;
  v37 = v36[1];
  v39 = v35[1];
  *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease(v39);
  return a1;
}

uint64_t sub_100030044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100030050);
}

uint64_t sub_100030050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000300D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000300DC);
}

uint64_t sub_1000300DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_100030158(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[9];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_100038548;
    v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[3] = &unk_100038560;
    v4[4] = &unk_100038560;
    v4[5] = &unk_100038560;
    v4[6] = &unk_100038560;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = &unk_100038578;
    swift_initStructMetadata(a1, 256, 9, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_1000301F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_100030230(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_100030264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000302A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000302EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100030330(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100030374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100030380);
}

uint64_t sub_100030380(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1000303BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000303C8);
}

uint64_t sub_1000303C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DocumentCheckerRecord(uint64_t a1)
{
  return sub_100011554(a1, (uint64_t *)&unk_100051650, (uint64_t)&nominal type descriptor for DocumentCheckerRecord);
}

uint64_t sub_10003041C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t destroy for BloomFilterUpdateRecord(_QWORD *a1)
{
  sub_10000EE2C(a1[1], a1[2]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_bridgeObjectRelease(a1[7]);
}

uint64_t initializeWithCopy for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 16);
  sub_10000ED74(v4, v5);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  return a1;
}

_QWORD *assignWithCopy for BloomFilterUpdateRecord(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_10000ED74(v4, v5);
  v6 = a1[1];
  v7 = a1[2];
  a1[1] = v4;
  a1[2] = v5;
  sub_10000EE2C(v6, v7);
  a1[3] = a2[3];
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  v10 = a2[7];
  v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10000EE2C(v4, v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterUpdateRecord(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilterUpdateRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterUpdateRecord()
{
  return &type metadata for BloomFilterUpdateRecord;
}

uint64_t *sub_1000306D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  void (*v37)(uint64_t *, _QWORD, uint64_t, int *);
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v10);
  }
  else
  {
    v7 = (int *)type metadata accessor for BloomFilterRecord(0);
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      v9 = sub_1000110C4(&qword_10004E648);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = type metadata accessor for URL(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      v12 = v7[5];
      v13 = (uint64_t *)((char *)a1 + v12);
      v14 = (uint64_t *)((char *)a2 + v12);
      v15 = *v14;
      v16 = v14[1];
      sub_10000ED74(*v14, v16);
      *v13 = v15;
      v13[1] = v16;
      *(uint64_t *)((char *)a1 + v7[6]) = *(uint64_t *)((char *)a2 + v7[6]);
      v17 = v7[7];
      v18 = (uint64_t *)((char *)a1 + v17);
      v19 = (uint64_t *)((char *)a2 + v17);
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      v21 = v7[8];
      v22 = (uint64_t *)((char *)a1 + v21);
      v23 = (uint64_t *)((char *)a2 + v21);
      v24 = v23[1];
      *v22 = *v23;
      v22[1] = v24;
      v25 = v7[9];
      v26 = (uint64_t *)((char *)a1 + v25);
      v27 = (uint64_t *)((char *)a2 + v25);
      v28 = v27[1];
      *v26 = *v27;
      v26[1] = v28;
      v29 = v7[10];
      v30 = (uint64_t *)((char *)a1 + v29);
      v31 = (uint64_t *)((char *)a2 + v29);
      v32 = v31[1];
      *v30 = *v31;
      v30[1] = v32;
      *(uint64_t *)((char *)a1 + v7[11]) = *(uint64_t *)((char *)a2 + v7[11]);
      v33 = v7[12];
      v34 = (uint64_t *)((char *)a1 + v33);
      v35 = (uint64_t *)((char *)a2 + v33);
      v36 = v35[1];
      *v34 = *v35;
      v34[1] = v36;
      v37 = *(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain(v20);
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRetain(v28);
      swift_bridgeObjectRetain(v32);
      swift_bridgeObjectRetain(v36);
      v37(a1, 0, 1, v7);
    }
    v38 = *(int *)(a3 + 20);
    v39 = (char *)a1 + v38;
    v40 = (char *)a2 + v38;
    v41 = type metadata accessor for DocumentCheckerRecord(0);
    v42 = *(_QWORD *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
    {
      v43 = sub_1000110C4(&qword_10004E640);
      memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      v44 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v39, v40, v44);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
    }
    v45 = *(int *)(a3 + 24);
    v46 = (char *)a1 + v45;
    v47 = (char *)a2 + v45;
    v48 = *((_QWORD *)v47 + 1);
    if (v48 >> 60 == 15)
    {
      *(_OWORD *)v46 = *(_OWORD *)v47;
    }
    else
    {
      v49 = *(_QWORD *)v47;
      sub_10000ED74(*(_QWORD *)v47, *((_QWORD *)v47 + 1));
      *(_QWORD *)v46 = v49;
      *((_QWORD *)v46 + 1) = v48;
    }
  }
  return a1;
}

uint64_t sub_10003095C(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;

  v4 = (int *)type metadata accessor for BloomFilterRecord(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v4 - 1) + 48))(a1, 1, v4))
  {
    v5 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    sub_10000EE2C(*(_QWORD *)(a1 + v4[5]), *(_QWORD *)(a1 + v4[5] + 8));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + v4[7] + 8));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + v4[8] + 8));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + v4[9] + 8));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + v4[10] + 8));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + v4[12] + 8));
  }
  v6 = a1 + *(int *)(a2 + 20);
  v7 = type metadata accessor for DocumentCheckerRecord(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    v9 = type metadata accessor for URL(0);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v6, v9);
  }
  v10 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  v11 = v10[1];
  if (v11 >> 60 != 15)
    return sub_10000EE2C(*v10, v11);
  return result;
}

char *sub_100030A9C(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, _QWORD, uint64_t, int *);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;

  v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_1000110C4(&qword_10004E648);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    v10 = v6[5];
    v11 = (uint64_t *)&a1[v10];
    v12 = (uint64_t *)&a2[v10];
    v13 = *v12;
    v14 = v12[1];
    sub_10000ED74(*v12, v14);
    *v11 = v13;
    v11[1] = v14;
    *(_QWORD *)&a1[v6[6]] = *(_QWORD *)&a2[v6[6]];
    v15 = v6[7];
    v16 = &a1[v15];
    v17 = &a2[v15];
    v18 = *((_QWORD *)v17 + 1);
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_QWORD *)v16 + 1) = v18;
    v19 = v6[8];
    v20 = &a1[v19];
    v21 = &a2[v19];
    v22 = *((_QWORD *)v21 + 1);
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *((_QWORD *)v20 + 1) = v22;
    v23 = v6[9];
    v24 = &a1[v23];
    v25 = &a2[v23];
    v26 = *((_QWORD *)v25 + 1);
    *(_QWORD *)v24 = *(_QWORD *)v25;
    *((_QWORD *)v24 + 1) = v26;
    v27 = v6[10];
    v28 = &a1[v27];
    v29 = &a2[v27];
    v30 = *((_QWORD *)v29 + 1);
    *(_QWORD *)v28 = *(_QWORD *)v29;
    *((_QWORD *)v28 + 1) = v30;
    *(_QWORD *)&a1[v6[11]] = *(_QWORD *)&a2[v6[11]];
    v31 = v6[12];
    v32 = &a1[v31];
    v33 = &a2[v31];
    v34 = *((_QWORD *)v33 + 1);
    *(_QWORD *)v32 = *(_QWORD *)v33;
    *((_QWORD *)v32 + 1) = v34;
    v35 = *(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v22);
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v34);
    v35(a1, 0, 1, v6);
  }
  v36 = *(int *)(a3 + 20);
  v37 = &a1[v36];
  v38 = &a2[v36];
  v39 = type metadata accessor for DocumentCheckerRecord(0);
  v40 = *(_QWORD *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    v41 = sub_1000110C4(&qword_10004E640);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    v42 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 16))(v37, v38, v42);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  v43 = *(int *)(a3 + 24);
  v44 = &a1[v43];
  v45 = &a2[v43];
  v46 = *((_QWORD *)v45 + 1);
  if (v46 >> 60 == 15)
  {
    *(_OWORD *)v44 = *(_OWORD *)v45;
  }
  else
  {
    v47 = *(_QWORD *)v45;
    sub_10000ED74(*(_QWORD *)v45, *((_QWORD *)v45 + 1));
    *(_QWORD *)v44 = v47;
    *((_QWORD *)v44 + 1) = v46;
  }
  return a1;
}

char *sub_100030CF4(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, _QWORD, uint64_t, int *);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(char *, uint64_t, uint64_t);
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      v11 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      v12 = v6[5];
      v13 = (uint64_t *)&a1[v12];
      v14 = (uint64_t *)&a2[v12];
      v15 = *v14;
      v16 = v14[1];
      sub_10000ED74(*v14, v16);
      *v13 = v15;
      v13[1] = v16;
      *(_QWORD *)&a1[v6[6]] = *(_QWORD *)&a2[v6[6]];
      v17 = v6[7];
      v18 = &a1[v17];
      v19 = &a2[v17];
      *(_QWORD *)v18 = *(_QWORD *)v19;
      v20 = *((_QWORD *)v19 + 1);
      *((_QWORD *)v18 + 1) = v20;
      v21 = v6[8];
      v22 = &a1[v21];
      v23 = &a2[v21];
      *(_QWORD *)v22 = *(_QWORD *)v23;
      v24 = *((_QWORD *)v23 + 1);
      *((_QWORD *)v22 + 1) = v24;
      v25 = v6[9];
      v26 = &a1[v25];
      v27 = &a2[v25];
      *(_QWORD *)v26 = *(_QWORD *)v27;
      v28 = *((_QWORD *)v27 + 1);
      *((_QWORD *)v26 + 1) = v28;
      v29 = v6[10];
      v30 = &a1[v29];
      v31 = &a2[v29];
      *(_QWORD *)v30 = *(_QWORD *)v31;
      v32 = *((_QWORD *)v31 + 1);
      *((_QWORD *)v30 + 1) = v32;
      *(_QWORD *)&a1[v6[11]] = *(_QWORD *)&a2[v6[11]];
      v33 = v6[12];
      v34 = &a1[v33];
      v35 = &a2[v33];
      *(_QWORD *)v34 = *(_QWORD *)v35;
      v36 = *((_QWORD *)v35 + 1);
      *((_QWORD *)v34 + 1) = v36;
      v37 = *(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56);
      swift_bridgeObjectRetain(v20);
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRetain(v28);
      swift_bridgeObjectRetain(v32);
      swift_bridgeObjectRetain(v36);
      v37(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100013234((uint64_t)a1, type metadata accessor for BloomFilterRecord);
LABEL_6:
    v38 = sub_1000110C4(&qword_10004E648);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_7;
  }
  v58 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v58 - 8) + 24))(a1, a2, v58);
  v59 = v6[5];
  v60 = (uint64_t *)&a1[v59];
  v61 = (uint64_t *)&a2[v59];
  v62 = *v61;
  v63 = v61[1];
  sub_10000ED74(*v61, v63);
  v64 = *v60;
  v65 = v60[1];
  *v60 = v62;
  v60[1] = v63;
  sub_10000EE2C(v64, v65);
  *(_QWORD *)&a1[v6[6]] = *(_QWORD *)&a2[v6[6]];
  v66 = v6[7];
  v67 = &a1[v66];
  v68 = &a2[v66];
  *(_QWORD *)v67 = *(_QWORD *)v68;
  v69 = *((_QWORD *)v68 + 1);
  v70 = *((_QWORD *)v67 + 1);
  *((_QWORD *)v67 + 1) = v69;
  swift_bridgeObjectRetain(v69);
  swift_bridgeObjectRelease(v70);
  v71 = v6[8];
  v72 = &a1[v71];
  v73 = &a2[v71];
  *(_QWORD *)v72 = *(_QWORD *)v73;
  v74 = *((_QWORD *)v73 + 1);
  v75 = *((_QWORD *)v72 + 1);
  *((_QWORD *)v72 + 1) = v74;
  swift_bridgeObjectRetain(v74);
  swift_bridgeObjectRelease(v75);
  v76 = v6[9];
  v77 = &a1[v76];
  v78 = &a2[v76];
  *(_QWORD *)v77 = *(_QWORD *)v78;
  v79 = *((_QWORD *)v78 + 1);
  v80 = *((_QWORD *)v77 + 1);
  *((_QWORD *)v77 + 1) = v79;
  swift_bridgeObjectRetain(v79);
  swift_bridgeObjectRelease(v80);
  v81 = v6[10];
  v82 = &a1[v81];
  v83 = &a2[v81];
  *(_QWORD *)v82 = *(_QWORD *)v83;
  v84 = *((_QWORD *)v83 + 1);
  v85 = *((_QWORD *)v82 + 1);
  *((_QWORD *)v82 + 1) = v84;
  swift_bridgeObjectRetain(v84);
  swift_bridgeObjectRelease(v85);
  *(_QWORD *)&a1[v6[11]] = *(_QWORD *)&a2[v6[11]];
  v86 = v6[12];
  v87 = &a1[v86];
  v88 = &a2[v86];
  *(_QWORD *)v87 = *(_QWORD *)v88;
  v89 = *((_QWORD *)v88 + 1);
  v90 = *((_QWORD *)v87 + 1);
  *((_QWORD *)v87 + 1) = v89;
  swift_bridgeObjectRetain(v89);
  swift_bridgeObjectRelease(v90);
LABEL_7:
  v39 = *(int *)(a3 + 20);
  v40 = &a1[v39];
  v41 = &a2[v39];
  v42 = type metadata accessor for DocumentCheckerRecord(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 48);
  v45 = v44(v40, 1, v42);
  v46 = v44(v41, 1, v42);
  if (v45)
  {
    if (!v46)
    {
      v47 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v40, v41, v47);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v46)
  {
    sub_100013234((uint64_t)v40, type metadata accessor for DocumentCheckerRecord);
LABEL_12:
    v48 = sub_1000110C4(&qword_10004E640);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    goto LABEL_13;
  }
  v91 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v91 - 8) + 24))(v40, v41, v91);
LABEL_13:
  v49 = *(int *)(a3 + 24);
  v50 = (uint64_t *)&a1[v49];
  v51 = (uint64_t *)&a2[v49];
  v52 = *(_QWORD *)&a2[v49 + 8];
  if (*(_QWORD *)&a1[v49 + 8] >> 60 != 15)
  {
    if (v52 >> 60 != 15)
    {
      v54 = *v51;
      sub_10000ED74(v54, v52);
      v55 = *v50;
      v56 = v50[1];
      *v50 = v54;
      v50[1] = v52;
      sub_10000EE2C(v55, v56);
      return a1;
    }
    sub_100012E20((uint64_t)v50);
    goto LABEL_18;
  }
  if (v52 >> 60 == 15)
  {
LABEL_18:
    *(_OWORD *)v50 = *(_OWORD *)v51;
    return a1;
  }
  v53 = *v51;
  sub_10000ED74(v53, v52);
  *v50 = v53;
  v50[1] = v52;
  return a1;
}

char *sub_100031174(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_1000110C4(&qword_10004E648);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(_QWORD *)&a1[v6[6]] = *(_QWORD *)&a2[v6[6]];
    *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
    *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
    *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
    *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
    *(_QWORD *)&a1[v6[11]] = *(_QWORD *)&a2[v6[11]];
    *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = type metadata accessor for DocumentCheckerRecord(0);
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    v15 = sub_1000110C4(&qword_10004E640);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v16 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v11, v12, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_100031334(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v6 = (int *)type metadata accessor for BloomFilterRecord(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      v11 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
      *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
      *(_QWORD *)&a1[v6[6]] = *(_QWORD *)&a2[v6[6]];
      *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
      *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
      *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
      *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
      *(_QWORD *)&a1[v6[11]] = *(_QWORD *)&a2[v6[11]];
      *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100013234((uint64_t)a1, type metadata accessor for BloomFilterRecord);
LABEL_6:
    v12 = sub_1000110C4(&qword_10004E648);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  v30 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 40))(a1, a2, v30);
  v31 = v6[5];
  v32 = *(_QWORD *)&a1[v31];
  v33 = *(_QWORD *)&a1[v31 + 8];
  *(_OWORD *)&a1[v31] = *(_OWORD *)&a2[v31];
  sub_10000EE2C(v32, v33);
  *(_QWORD *)&a1[v6[6]] = *(_QWORD *)&a2[v6[6]];
  v34 = v6[7];
  v35 = &a1[v34];
  v36 = &a2[v34];
  v38 = *(_QWORD *)v36;
  v37 = *((_QWORD *)v36 + 1);
  v39 = *((_QWORD *)v35 + 1);
  *(_QWORD *)v35 = v38;
  *((_QWORD *)v35 + 1) = v37;
  swift_bridgeObjectRelease(v39);
  v40 = v6[8];
  v41 = &a1[v40];
  v42 = &a2[v40];
  v44 = *(_QWORD *)v42;
  v43 = *((_QWORD *)v42 + 1);
  v45 = *((_QWORD *)v41 + 1);
  *(_QWORD *)v41 = v44;
  *((_QWORD *)v41 + 1) = v43;
  swift_bridgeObjectRelease(v45);
  v46 = v6[9];
  v47 = &a1[v46];
  v48 = &a2[v46];
  v50 = *(_QWORD *)v48;
  v49 = *((_QWORD *)v48 + 1);
  v51 = *((_QWORD *)v47 + 1);
  *(_QWORD *)v47 = v50;
  *((_QWORD *)v47 + 1) = v49;
  swift_bridgeObjectRelease(v51);
  v52 = v6[10];
  v53 = &a1[v52];
  v54 = &a2[v52];
  v56 = *(_QWORD *)v54;
  v55 = *((_QWORD *)v54 + 1);
  v57 = *((_QWORD *)v53 + 1);
  *(_QWORD *)v53 = v56;
  *((_QWORD *)v53 + 1) = v55;
  swift_bridgeObjectRelease(v57);
  *(_QWORD *)&a1[v6[11]] = *(_QWORD *)&a2[v6[11]];
  v58 = v6[12];
  v59 = &a1[v58];
  v60 = &a2[v58];
  v62 = *(_QWORD *)v60;
  v61 = *((_QWORD *)v60 + 1);
  v63 = *((_QWORD *)v59 + 1);
  *(_QWORD *)v59 = v62;
  *((_QWORD *)v59 + 1) = v61;
  swift_bridgeObjectRelease(v63);
LABEL_7:
  v13 = *(int *)(a3 + 20);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for DocumentCheckerRecord(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      v21 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v14, v15, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    sub_100013234((uint64_t)v14, type metadata accessor for DocumentCheckerRecord);
LABEL_12:
    v22 = sub_1000110C4(&qword_10004E640);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  v64 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v64 - 8) + 40))(v14, v15, v64);
LABEL_13:
  v23 = *(int *)(a3 + 24);
  v24 = (uint64_t *)&a1[v23];
  v25 = (uint64_t *)&a2[v23];
  v26 = *(_QWORD *)&a1[v23 + 8];
  if (v26 >> 60 != 15)
  {
    v27 = v25[1];
    if (v27 >> 60 != 15)
    {
      v28 = *v24;
      *v24 = *v25;
      v24[1] = v27;
      sub_10000EE2C(v28, v26);
      return a1;
    }
    sub_100012E20((uint64_t)v24);
  }
  *(_OWORD *)v24 = *(_OWORD *)v25;
  return a1;
}

uint64_t sub_10003169C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000316A8);
}

uint64_t sub_1000316A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  BOOL v15;
  unsigned int v16;

  v6 = sub_1000110C4(&qword_10004E648);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1000110C4(&qword_10004E640);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
  v15 = ((4 * (_DWORD)v14) & 0xC) == 0;
  v16 = ((4 * v14) & 0xC | (v14 >> 2)) ^ 0xF;
  if (v15)
    return 0;
  else
    return v16;
}

uint64_t sub_100031764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100031770);
}

uint64_t sub_100031770(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;

  v8 = sub_1000110C4(&qword_10004E648);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_1000110C4(&qword_10004E640);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  v15 = (_QWORD *)(a1 + *(int *)(a4 + 24));
  *v15 = 0;
  v15[1] = (unint64_t)((~(_DWORD)a2 >> 2) & 3 | (4 * ~(_DWORD)a2)) << 60;
  return result;
}

void sub_10003182C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  sub_1000318D8(319, &qword_10004ED98, type metadata accessor for BloomFilterRecord);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000318D8(319, (unint64_t *)&unk_10004EDA0, type metadata accessor for DocumentCheckerRecord);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = &unk_1000385E8;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

void sub_1000318D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t destroy for UpdateZoneSyncResult(uint64_t result)
{
  unint64_t v1;

  v1 = *(_QWORD *)(result + 16);
  if (v1 >> 60 != 15)
    return sub_10000EE2C(*(_QWORD *)(result + 8), v1);
  return result;
}

uint64_t _s17online_auth_agent20UpdateZoneSyncResultVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = (uint64_t *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v3;
  }
  else
  {
    v5 = *v3;
    sub_10000ED74(*v3, *(_QWORD *)(a2 + 16));
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = v4;
  }
  return a1;
}

uint64_t assignWithCopy for UpdateZoneSyncResult(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = (_OWORD *)(a1 + 8);
  v4 = (uint64_t *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_10000ED74(*v4, *(_QWORD *)(a2 + 16));
      v8 = *(_QWORD *)(a1 + 8);
      v9 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 8) = v7;
      *(_QWORD *)(a1 + 16) = v5;
      sub_10000EE2C(v8, v9);
      return a1;
    }
    sub_100012E20(a1 + 8);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *v3 = *(_OWORD *)v4;
    return a1;
  }
  v6 = *v4;
  sub_10000ED74(*v4, *(_QWORD *)(a2 + 16));
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithTake for UpdateZoneSyncResult(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = (_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6 >> 60 != 15)
  {
    v7 = *(_QWORD *)(a2 + 16);
    if (v7 >> 60 != 15)
    {
      v8 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = *v5;
      *(_QWORD *)(a1 + 16) = v7;
      sub_10000EE2C(v8, v6);
      return a1;
    }
    sub_100012E20(a1 + 8);
  }
  *v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateZoneSyncResult(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[24])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateZoneSyncResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateZoneSyncResult()
{
  return &type metadata for UpdateZoneSyncResult;
}

uint64_t storeEnumTagSinglePayload for CloudKitOperationsError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_100031BC0 + 4 * asc_100038470[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100031BE0 + 4 * byte_100038475[v4]))();
}

_BYTE *sub_100031BC0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100031BE0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100031BE8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100031BF0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100031BF8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100031C00(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CloudKitOperationsError()
{
  return &type metadata for CloudKitOperationsError;
}

BOOL sub_100031C1C(void *a1)
{
  unint64_t v2;
  unint64_t v3;
  id v4;

  if (!objc_msgSend(a1, "caseInsensitiveCompare:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "fbe71da1-0834-4d49-9b41-d3fa7f9e4d4f")))return 1;
  v2 = 0;
  do
  {
    v3 = v2;
    if (v2 == 13)
      break;
    v4 = objc_msgSend(a1, "caseInsensitiveCompare:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_100047E18)[v2 + 1]));
    v2 = v3 + 1;
  }
  while (v4);
  return v3 < 0xD;
}

void sub_100031CB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "Database failed to initialize.", a5, a6, a7, a8, 0);
}

void sub_100031CE4()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100002DC0();
  sub_100002D9C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Finalize error (%d) on query: %@", v1);
  sub_100002E04();
}

void sub_100031D4C(sqlite3 **a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_100002E0C(a1);
  sub_100002DF8();
  sub_100002DA8();
  sub_100002D9C((void *)&_mh_execute_header, a2, v3, "SQL error '%s' (%1d)", v4);
  sub_100002DD8();
}

void sub_100031DC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "Query canceled", a5, a6, a7, a8, 0);
}

void sub_100031DFC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100002DC0();
  sub_100002D9C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Prepare error (%d) on query: %@", v1);
  sub_100002E04();
}

void sub_100031E64(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  sub_100002D9C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to table row count for %@: %d", (uint8_t *)&v3);
  sub_100002E04();
}

void sub_100031EDC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error opening DB: %d", (uint8_t *)v2, 8u);
}

void sub_100031F50()
{
  __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
}

void sub_100031F78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000030A0();
  sub_10000307C();
  sub_100003068((void *)&_mh_execute_header, v0, v1, "unable to open file to update permissions: %d, %s", v2, v3, v4, v5, v6);
  sub_100003094();
}

void sub_100031FE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000030A0();
  sub_10000307C();
  sub_100003068((void *)&_mh_execute_header, v0, v1, "unable to check filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
  sub_100003094();
}

void sub_100032058()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000030A0();
  sub_10000307C();
  sub_100003068((void *)&_mh_execute_header, v0, v1, "unable to set filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
  sub_100003094();
}

void sub_1000320C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "CreateMISAuthListWithStream: creating stream failed", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_1000320F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "CreateMISAuthListWithFile: url is NULL", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032128(uint64_t a1, int a2, NSObject *a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2080;
  v5 = a1;
  sub_100002D9C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Caller (pid %d) does not have required entitlement '%s'", (uint8_t *)v3);
}

void sub_1000321A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could not allocate path buffer for MIS data directory (this should not happen).", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000321D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could not get path for MIS data directory (this should not happen).", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000321FC(uint64_t a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;

  v4 = *__error();
  v6 = 136315394;
  v7 = a1;
  v8 = 1024;
  v9 = v4;
  sub_100002D9C((void *)&_mh_execute_header, a2, v5, "Unable to create data directory '%s' (error %{errno}d)!", (uint8_t *)&v6);
}

void sub_100032290()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could not set up service listener, or connection invalid in top-level handler.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000322BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Unexpected listener event.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000322E8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Launch warning sync had error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003235C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Did not get any user info from event, ignoring.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032388()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Failed to convert user info XPC dictionary to CF dictionary, ignoring.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000323B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "User info was not a dictionary, ignoring.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000323E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Seen weird bundle ID.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_10003240C()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSDictionary *wl_MAECopyActivationRecordWithError(NSError *__autoreleasing *)"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("online_auth_agent.m"), 65, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_100032480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "could not create random key!", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000324AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "failure obtaining device ID", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000324D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "failure creating app ID", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032504()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Failed to construct authorization request", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032530()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "bogus cdhash size!", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_10003255C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Failed to get device ID", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032588(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "Could not encrypt the message (status 0x%x)", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_1000325EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Failure converting UPP UUID to UTF8 string", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032618()
{
  __assert_rtn("peerEventHandler", "online_auth_agent.m", 785, "reply != NULL");
}

void sub_100032640()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "no message type provided, canceling connection.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_10003266C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "device_id, cdhash, upp_uuid, or team_id missing from message.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032698()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "unknown message type provided, canceling connection.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000326C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "request is not a dictionary, canceling connection.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000326F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "upp_uuid missing from message.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_10003271C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set trust for UPP %s: %@", (uint8_t *)&v3, 0x16u);
  sub_100002E04();
}

void sub_10003279C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "unable to create CFDataRef for signature data", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000327C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "cdHash missing from message.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000327F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could not initialize key for denylist override.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032820(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C70((void *)&_mh_execute_header, a2, a3, "Set launch warning override failed: %@", a5, a6, a7, a8, 2u);
  sub_100002E04();
}

void sub_100032884(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "Posting launch warning override notification failed: %d", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_1000328E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Caller didn't provide cdhash data", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032914(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C70((void *)&_mh_execute_header, a2, a3, "Get launch warning data failed: %@", a5, a6, a7, a8, 2u);
  sub_100002E04();
}

void sub_100032978(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *MobileActivationLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("online_auth_agent.m"), 64, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1000329F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "reaper sysctl failed.", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032A24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "reaper pid malloc failed.", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032A54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "unable to find AppleMobileFileIntegrity service", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032A84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "AppleMobileFileIntegrity user client call failed: 0x%x", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032AE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "unable to open AppleMobileFileIntegrity user client: 0x%x", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032B4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "server trust for PPQ validation are NULL", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032B7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "policy for PPQ validation is NULL", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032BAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002DE8((void *)&_mh_execute_header, a1, a3, "trust object for PPQ validation is NULL", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032BDC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "PPQ server trust evaluation failure: %d", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032C44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "PPQ server trust evaluation error code: %d", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032CA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "PPQ server trust creation error code: %d", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_100032D0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "No json in request.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100032D38(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v5 = 138412290;
  v6 = v3;
  sub_1000089DC((void *)&_mh_execute_header, a2, v4, "Could not convert dictionary to JSON: %@", (uint8_t *)&v5);

  sub_100003094();
}

void sub_100032DC0()
{
  void *v0;
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "typeof (kMAOptionsBAAKeychainLabel) getkMAOptionsBAAKeychainLabel(void)"));
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("online_auth_server.m"), 28, CFSTR("%s"), sub_1000089D4());

  __break(1u);
}

void sub_100032E30()
{
  void *v0;
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "typeof (kMAOptionsBAAKeychainAccessGroup) getkMAOptionsBAAKeychainAccessGroup(void)"));
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("online_auth_server.m"), 29, CFSTR("%s"), sub_1000089D4());

  __break(1u);
}

void sub_100032EA0()
{
  void *v0;
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "typeof (kMAOptionsBAANetworkTimeoutInterval) getkMAOptionsBAANetworkTimeoutInterval(void)"));
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("online_auth_server.m"), 30, CFSTR("%s"), sub_1000089D4());

  __break(1u);
}

void sub_100032F10()
{
  void *v0;
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "typeof (kMAOptionsBAAValidity) getkMAOptionsBAAValidity(void)"));
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("online_auth_server.m"), 31, CFSTR("%s"), sub_1000089D4());

  __break(1u);
}

void sub_100032F80()
{
  void *v0;
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "typeof (kMAOptionsBAASCRTAttestation) getkMAOptionsBAASCRTAttestation(void)"));
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("online_auth_server.m"), 32, CFSTR("%s"), sub_1000089D4());

  __break(1u);
}

void sub_100032FF0()
{
  void *v0;
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "typeof (kMAOptionsBAAAccessControls) getkMAOptionsBAAAccessControls(void)"));
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("online_auth_server.m"), 33, CFSTR("%s"), sub_1000089D4());

  __break(1u);
}

void sub_100033060()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "ppq Server URL is NULL, not proceeding with authorizing attempt.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_10003308C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "urlRequest is NULL, not proceeding with authorizing attempt.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000330B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could not find device identity certificate", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000330E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could create device identity", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033110(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create CMS blob, got error %d", (uint8_t *)v2, 8u);
  sub_1000038EC();
}

void sub_100033180(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  sub_1000089DC((void *)&_mh_execute_header, a2, a3, "Couldn't get device identity %@", (uint8_t *)&v4);
}

void sub_1000331F4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v5 = 138412290;
  v6 = v3;
  sub_1000089DC((void *)&_mh_execute_header, a2, v4, "session error: %@", (uint8_t *)&v5);

  sub_100003094();
}

void sub_100033278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could not create signing policy", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000332A4(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *DeviceIdentityLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("online_auth_server.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_100033320()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Failed to mmap fallback denylist header. Giving up.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_10003334C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100008EA8((void *)&_mh_execute_header, v0, v1, "Using empty denylist.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Could not allocate buffer for denylist path (this should not happen.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000333A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Denylist path conversion failed (this should not happen.)", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000333D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100008EA8((void *)&_mh_execute_header, v0, v1, "Denylist does not exist.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000333FC(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  __error();
  sub_100008EB8();
  sub_100008E9C((void *)&_mh_execute_header, a1, v2, "Could not open denylist, error %{errno}d", v3);
  sub_100002E04();
}

void sub_100033478(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 24;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Denylist is too short (%lld bytes) for header (%lu bytes)", (uint8_t *)&v2, 0x16u);
  sub_100002E04();
}

void sub_1000334F8(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  __error();
  sub_100008EB8();
  sub_100008E9C((void *)&_mh_execute_header, a1, v2, "Could not map denylist, error %{errno}d", v3);
  sub_100002E04();
}

void sub_100033574()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;

  sub_100008EB8();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Denylist entries offset %u is past denylist size %lld", v2, 0x12u);
  sub_100002E04();
}

void sub_1000335F4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100008EB8();
  sub_100008E9C((void *)&_mh_execute_header, v0, v1, "Wrong denylist magic (0x08%x)", v2);
  sub_1000038EC();
}

void sub_10003365C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C70((void *)&_mh_execute_header, a2, a3, "Could not read in internal auth list, error %@", a5, a6, a7, a8, 2u);
  sub_100002E04();
}

void sub_1000336C0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failure writing out auth list", v1, 2u);
}

void sub_100033700(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C70((void *)&_mh_execute_header, a2, a3, "Unhandled onlineCheckType %ld encountered. (This should not happen.)", a5, a6, a7, a8, 0);
  sub_100002E04();
}

void sub_100033768(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to migrate UPP %@: %@", (uint8_t *)&v3, 0x16u);
  sub_100002E04();
}

void sub_1000337E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Latest asset has no path? (This should not happen, update ignored.)", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033814(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping asset with NULL attributes (this should not happen).", buf, 2u);
}

void sub_100033850(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C80((void *)&_mh_execute_header, a2, a3, "Denylist asset catalog update failed: %i", a5, a6, a7, a8, 0);
  sub_1000038EC();
}

void sub_1000338B4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Downloaded asset failure: %@", (uint8_t *)&v2, 0xCu);
  sub_100002E04();
}

void sub_100033924()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Downloaded asset has no path? (This should not happen, update ignored.)", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033950()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Downloaded asset", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_10003397C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "unable to find AppleMobileFileIntegrity service", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000339A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D544();
  sub_100006C80((void *)&_mh_execute_header, v0, v1, "AppleMobileFileIntegrity user client call failed: 0x%x", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033A08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D544();
  sub_100006C80((void *)&_mh_execute_header, v0, v1, "unable to open AppleMobileFileIntegrity user client: 0x%x", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033A68()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D538();
  sub_10000D514();
  v0 = sub_10000D530();
  sub_10000D50C(v0);
  sub_10000D498();
  sub_10000D4CC((void *)&_mh_execute_header, v1, v2, "DocCheckList: Failed to open new DocCheckList '%s': (%d) %s", v3, v4, v5, v6, v7);
  sub_10000D4BC();
}

void sub_100033ADC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Failed to create docCheckList ingestion path", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033B08()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D538();
  sub_10000D514();
  v0 = sub_10000D530();
  sub_10000D50C(v0);
  sub_10000D498();
  sub_10000D4CC((void *)&_mh_execute_header, v1, v2, "DocCheckList: Failed to create temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
  sub_10000D4BC();
}

void sub_100033B7C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D538();
  sub_10000D514();
  v0 = sub_10000D530();
  sub_10000D50C(v0);
  sub_10000D498();
  sub_10000D4CC((void *)&_mh_execute_header, v1, v2, "DocCheckList: Failed to chmod 0644 temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
  sub_10000D4BC();
}

void sub_100033BF0(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];

  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_100008E9C((void *)&_mh_execute_header, a1, v3, "Copying asset to temporary ingestion DocCheckList failed, error %{errno}d", (uint8_t *)v4);
  sub_100002E04();
}

void sub_100033C70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D544();
  sub_100006C80((void *)&_mh_execute_header, v0, v1, "Posting DocCheckList notification failed: %d", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033CD0()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D514();
  v0 = __error();
  sub_10000D50C(v0);
  sub_10000D4E0();
  sub_10000D51C((void *)&_mh_execute_header, v1, v2, "Failed to rename DocCheckList ingestion file '%s' to actual path '%s': (%d) %s", v3, v4, v5, v6, v7);
  sub_10000D4BC();
}

void sub_100033D50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Opening denylist for ingest failed, not ingesting.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033D7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Denylist integrity check failed, not ingesting.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033DA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Denylist integrity check sentinel not found.", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033DD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "Failed to created ingestion path", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_100033E00()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D538();
  sub_10000D514();
  v0 = sub_10000D530();
  sub_10000D50C(v0);
  sub_10000D498();
  sub_10000D4CC((void *)&_mh_execute_header, v1, v2, "Failed to create temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
  sub_10000D4BC();
}

void sub_100033E74()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D538();
  sub_10000D514();
  v0 = sub_10000D530();
  sub_10000D50C(v0);
  sub_10000D498();
  sub_10000D4CC((void *)&_mh_execute_header, v1, v2, "Failed to chmod 0644 temporary ingestion file '%s': (%d) %s", v3, v4, v5, v6, v7);
  sub_10000D4BC();
}

void sub_100033EE8(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];

  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_100008E9C((void *)&_mh_execute_header, a1, v3, "Copying asset to temporary ingestion denylist failed, error %{errno}d", (uint8_t *)v4);
  sub_100002E04();
}

void sub_100033F68()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D514();
  v0 = __error();
  sub_10000D50C(v0);
  sub_10000D4E0();
  sub_10000D51C((void *)&_mh_execute_header, v1, v2, "Failed rename denylist ingestion file '%s' to actual denylist '%s': (%d) %s", v3, v4, v5, v6, v7);
  sub_10000D4BC();
}

void sub_100033FE8(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Size mismatch while copying denylist, %ld total, %lld copied.", (uint8_t *)&v4, 0x16u);
  sub_100002E04();
}

void sub_10003406C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C70((void *)&_mh_execute_header, a2, a3, "Failed to defer %@", a5, a6, a7, a8, 2u);
  sub_100002E04();
}

void sub_1000340D4(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *ProfileValidatedAppIdentityLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AppIdentity.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_100034150()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getPVAppIdentityDigestClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AppIdentity.m"), 19, CFSTR("Unable to find class %s"), "PVAppIdentityDigest");

  __break(1u);
}

void sub_1000341C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "got NULL when querying UDID", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

void sub_1000341F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004124();
  sub_100002DE8((void *)&_mh_execute_header, v0, v1, "got non-string when querying UDID", v2, v3, v4, v5, v6);
  sub_1000038EC();
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:forHTTPHeaderField:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_applicationProxyForIdentifier_placeholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:placeholder:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asDictionary");
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetId");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributes");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createUserTrustedProfileEntryWithUuid_teamId_signature_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createUserTrustedProfileEntryWithUuid:teamId:signature:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_deleteTrustedProfileWithUuid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteTrustedProfileWithUuid:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_digestWithTimeoutError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "digestWithTimeoutError");
}

id objc_msgSend_enumerateBundlesOfType_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateBundlesOfType:block:");
}

id objc_msgSend_enumerateLinesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLinesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_executeQuery_withBind_withCancellableResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withBind:withCancellableResults:");
}

id objc_msgSend_executeQuery_withBind_withResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withBind:withResults:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishTasksAndInvalidate");
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalUrl");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseURL:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_lookupLaunchWarningData_cdhashType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupLaunchWarningData:cdhashType:error:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileValidated");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMetaDataSync");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "results");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsExpensiveAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsExpensiveAccess:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPowerPluggedIn:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setUserOverride_forID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserOverride:forID:error:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setupPermissions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPermissions");
}

id objc_msgSend_setupSchema(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSchema");
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:options:then:");
}

id objc_msgSend_startDownload_completionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownload:completionWithError:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_syncLaunchWarningsAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncLaunchWarningsAndReturnError:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_uploadTaskWithRequest_fromData_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadTaskWithRequest:fromData:completionHandler:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_wasLocal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasLocal");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

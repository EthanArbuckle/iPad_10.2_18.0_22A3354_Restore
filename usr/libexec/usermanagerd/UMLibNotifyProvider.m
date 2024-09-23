@implementation UMLibNotifyProvider

- (BOOL)post:(id)a3
{
  id v3;
  uint32_t v4;
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  char *v10;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint32_t v16;

  v3 = objc_retainAutorelease(a3);
  v4 = notify_post((const char *)objc_msgSend(v3, "UTF8String"));
  if (v4)
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v5 = (id)qword_1000E0000;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 0;
      v6 = sub_100007750(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        v7 = v6;
      else
        v7 = v6 & 0xFFFFFFFE;
      if ((_DWORD)v7)
      {
        v13 = 138543618;
        v14 = v3;
        v15 = 1024;
        v16 = v4;
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v5 = (id)qword_1000E0000;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v12 = 0;
      v8 = sub_100007750(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        v7 = v8;
      else
        v7 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v7)
      {
        v13 = 138543362;
        v14 = v3;
LABEL_18:
        v9 = (const char *)_os_log_send_and_compose_impl(v7, &v12, 0, 0);
        v10 = (char *)v9;
        if (v9)
          sub_100007780(v9);
        goto LABEL_21;
      }
LABEL_20:
      v10 = 0;
LABEL_21:
      free(v10);
    }
  }

  return v4 == 0;
}

- (int)registerPlain:(id)a3
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  char *v15;
  int v16;
  uint64_t v18;
  int v19;
  int v20;
  id v21;
  __int16 v22;
  int v23;

  v19 = -1;
  v3 = objc_retainAutorelease(a3);
  v4 = notify_register_plain(objc_msgSend(v3, "UTF8String"), &v19);
  if (v4)
  {
    v5 = v4;
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v6 = (id)qword_1000E0000;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v18 = 0;
      v7 = sub_100007750(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        v8 = v7;
      else
        v8 = v7 & 0xFFFFFFFE;
      if ((_DWORD)v8)
      {
        v20 = 138543618;
        v21 = v3;
        v22 = 1024;
        v23 = v5;
        v9 = (const char *)_os_log_send_and_compose_impl(v8, &v18, 0, 0);
        v10 = (char *)v9;
        if (v9)
          sub_100007780(v9);
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

    v16 = -1;
  }
  else
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v11 = (id)qword_1000E0000;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v18 = 0;
      v12 = sub_100007750(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v13)
      {
        v20 = 138543618;
        v21 = v3;
        v22 = 1024;
        v23 = v19;
        v14 = (const char *)_os_log_send_and_compose_impl(v13, &v18, 0, 0);
        v15 = (char *)v14;
        if (v14)
          sub_100007780(v14);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    v16 = v19;
  }

  return v16;
}

- (int)registerCheck:(id)a3
{
  id v3;
  uint32_t v4;
  uint32_t v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  char *v15;
  int v16;
  uint64_t v18;
  int out_token;
  int v20;
  id v21;
  __int16 v22;
  int v23;

  out_token = -1;
  v3 = objc_retainAutorelease(a3);
  v4 = notify_register_check((const char *)objc_msgSend(v3, "UTF8String"), &out_token);
  if (v4)
  {
    v5 = v4;
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v6 = (id)qword_1000E0000;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v18 = 0;
      v7 = sub_100007750(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        v8 = v7;
      else
        v8 = v7 & 0xFFFFFFFE;
      if ((_DWORD)v8)
      {
        v20 = 138543618;
        v21 = v3;
        v22 = 1024;
        v23 = v5;
        v9 = (const char *)_os_log_send_and_compose_impl(v8, &v18, 0, 0);
        v10 = (char *)v9;
        if (v9)
          sub_100007780(v9);
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

    v16 = -1;
  }
  else
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v11 = (id)qword_1000E0000;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v18 = 0;
      v12 = sub_100007750(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v13)
      {
        v20 = 138543618;
        v21 = v3;
        v22 = 1024;
        v23 = out_token;
        v14 = (const char *)_os_log_send_and_compose_impl(v13, &v18, 0, 0);
        v15 = (char *)v14;
        if (v14)
          sub_100007780(v14);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    v16 = out_token;
  }

  return v16;
}

- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4
{
  uint32_t v6;
  uint32_t v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  id v18;
  BOOL result;
  uint64_t v20;
  int check;
  int v22;
  int v23;
  __int16 v24;
  int v25;

  *a4 = 0;
  check = 0;
  v6 = notify_check(a3, &check);
  if (v6)
  {
    v7 = v6;
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v8 = (id)qword_1000E0000;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
      v9 = sub_100007750(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        v22 = 67109376;
        v23 = a3;
        v24 = 1024;
        v25 = v7;
        v11 = (const char *)_os_log_send_and_compose_impl(v10, &v20, 0, 0);
        v12 = (char *)v11;
        if (v11)
          sub_100007780(v11);
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
    result = 0;
    *a4 = v18;
  }
  else
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v13 = (id)qword_1000E0000;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v20 = 0;
      v14 = sub_100007750(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if ((_DWORD)v15)
      {
        v22 = 67109376;
        v23 = a3;
        v24 = 1024;
        v25 = check;
        v16 = (const char *)_os_log_send_and_compose_impl(v15, &v20, 0, 0);
        v17 = (char *)v16;
        if (v16)
          sub_100007780(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

    return check == 1;
  }
  return result;
}

- (BOOL)setState:(unint64_t)a3 forToken:(int)a4
{
  uint32_t v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  char *v12;
  uint64_t v14;
  int v15;
  int v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  uint32_t v20;

  v6 = notify_set_state(a4, a3);
  if (v6)
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v7 = (id)qword_1000E0000;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 0;
      v8 = sub_100007750(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        v15 = 67109632;
        v16 = a4;
        v17 = 2048;
        v18 = a3;
        v19 = 1024;
        v20 = v6;
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v7 = (id)qword_1000E0000;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = 0;
      v10 = sub_100007750(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        v9 = v10;
      else
        v9 = v10 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        v15 = 67109376;
        v16 = a4;
        v17 = 2048;
        v18 = a3;
LABEL_18:
        v11 = (const char *)_os_log_send_and_compose_impl(v9, &v14, 0, 0);
        v12 = (char *)v11;
        if (v11)
          sub_100007780(v11);
        goto LABEL_21;
      }
LABEL_20:
      v12 = 0;
LABEL_21:
      free(v12);
    }
  }

  return v6 == 0;
}

- (unint64_t)stateForToken:(int)a3 error:(id *)a4
{
  uint32_t state;
  uint32_t v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  uint64_t v18;
  uint64_t state64;
  int v20;
  int v21;
  __int16 v22;
  uint64_t v23;

  *a4 = 0;
  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (state)
  {
    v6 = state;
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v7 = (id)qword_1000E0000;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = 0;
      v8 = sub_100007750(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        v20 = 67109376;
        v21 = a3;
        v22 = 1024;
        LODWORD(v23) = v6;
        v10 = (const char *)_os_log_send_and_compose_impl(v9, &v18, 0, 0);
        v11 = (char *)v10;
        if (v10)
          sub_100007780(v10);
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    return 0;
  }
  else
  {
    if (qword_1000E0008 != -1)
      dispatch_once(&qword_1000E0008, &stru_1000D1320);
    v12 = (id)qword_1000E0000;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18 = 0;
      v13 = sub_100007750(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v20 = 67109376;
        v21 = a3;
        v22 = 2048;
        v23 = state64;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v18, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    return state64;
  }
}

@end

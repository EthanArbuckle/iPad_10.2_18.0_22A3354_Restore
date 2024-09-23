@implementation UMLibNotifyProvider

- (BOOL)notificationHasPostedForToken:(int)a3 error:(id *)a4
{
  uint32_t v6;
  uint32_t v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  const char *v16;
  id v17;
  BOOL result;
  int check;
  int v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  check = 0;
  v6 = notify_check(a3, &check);
  if (v6)
  {
    v7 = v6;
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v8 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = sub_18FAED604();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if (v10)
      {
        v20 = 67109376;
        v21 = a3;
        v22 = 1024;
        v23 = v7;
        v11 = (void *)_os_log_send_and_compose_impl();
        if (v11)
          sub_18FAED60C();
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, *MEMORY[0x1E0CB2FE0], 5, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v17;
  }
  else
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v12 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = sub_18FAED604();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if (v14)
      {
        v20 = 67109376;
        v21 = a3;
        v22 = 1024;
        v23 = check;
        v15 = (void *)_os_log_send_and_compose_impl();
        if (v15)
          sub_18FAED60C();
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    return check == 1;
  }
  return result;
}

- (unint64_t)stateForToken:(int)a3 error:(id *)a4
{
  uint32_t state;
  uint32_t v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t state64;
  int v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (state)
  {
    v6 = state;
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v7 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = sub_18FAED604();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if (v9)
      {
        v17 = 67109376;
        v18 = a3;
        v19 = 1024;
        LODWORD(v20) = v6;
        v10 = (void *)_os_log_send_and_compose_impl();
        if (v10)
          sub_18FAED60C();
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

    return 0;
  }
  else
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v11 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = sub_18FAED604();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if (v13)
      {
        v17 = 67109376;
        v18 = a3;
        v19 = 2048;
        v20 = state64;
        v14 = (void *)_os_log_send_and_compose_impl();
        if (v14)
          sub_18FAED60C();
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    return state64;
  }
}

- (int)registerCheck:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint32_t v7;
  uint32_t v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  int v17;
  int out_token;
  int v20;
  id v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  out_token = -1;
  v3 = objc_retainAutorelease(a3);
  v6 = (const char *)objc_msgSend_UTF8String(v3, v4, v5);
  v7 = notify_register_check(v6, &out_token);
  if (v7)
  {
    v8 = v7;
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v9 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sub_18FAED604();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if (v11)
      {
        v20 = 138543618;
        v21 = v3;
        v22 = 1024;
        v23 = v8;
        v12 = (void *)_os_log_send_and_compose_impl();
        if (v12)
          sub_18FAED60C();
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    v17 = -1;
  }
  else
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v13 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = sub_18FAED604();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v20 = 138543618;
        v21 = v3;
        v22 = 1024;
        v23 = out_token;
        v16 = (void *)_os_log_send_and_compose_impl();
        if (v16)
          sub_18FAED60C();
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    v17 = out_token;
  }

  return v17;
}

- (BOOL)post:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint32_t v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;

  v3 = objc_retainAutorelease(a3);
  v6 = (const char *)objc_msgSend_UTF8String(v3, v4, v5);
  v7 = notify_post(v6);
  if (v7)
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v8 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = sub_18FAED604();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if (v10)
      {
LABEL_17:
        v13 = (void *)_os_log_send_and_compose_impl();
        if (v13)
          sub_18FAED60C();
        goto LABEL_20;
      }
LABEL_19:
      v13 = 0;
LABEL_20:
      free(v13);
    }
  }
  else
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v8 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = sub_18FAED604();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if (v12)
        goto LABEL_17;
      goto LABEL_19;
    }
  }

  return v7 == 0;
}

- (int)registerPlain:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend_UTF8String(v3, v4, v5);
  if (notify_register_plain())
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v6 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = sub_18FAED604();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        v8 = v7;
      else
        v8 = v7 & 0xFFFFFFFE;
      if (v8)
      {
        v9 = (void *)_os_log_send_and_compose_impl();
        if (v9)
          sub_18FAED60C();
      }
      else
      {
        v9 = 0;
      }
      free(v9);
    }
  }
  else
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v6 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = sub_18FAED604();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if (v11)
      {
        v12 = (void *)_os_log_send_and_compose_impl();
        if (v12)
          sub_18FAED60C();
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }
  }

  return -1;
}

- (BOOL)setState:(unint64_t)a3 forToken:(int)a4
{
  uint32_t v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;

  v4 = notify_set_state(a4, a3);
  if (v4)
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v5 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sub_18FAED604();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        v7 = v6;
      else
        v7 = v6 & 0xFFFFFFFE;
      if (v7)
      {
LABEL_17:
        v10 = (void *)_os_log_send_and_compose_impl();
        if (v10)
          sub_18FAED60C();
        goto LABEL_20;
      }
LABEL_19:
      v10 = 0;
LABEL_20:
      free(v10);
    }
  }
  else
  {
    if (qword_1EE184F48 != -1)
      dispatch_once(&qword_1EE184F48, &unk_1E2A4A6C8);
    v5 = (id)qword_1EE184F78;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = sub_18FAED604();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if (v9)
        goto LABEL_17;
      goto LABEL_19;
    }
  }

  return v4 == 0;
}

@end

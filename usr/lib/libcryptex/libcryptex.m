SimpleSession *simple_session_create(uint64_t a1)
{
  return -[SimpleSession initWithFlags:]([SimpleSession alloc], "initWithFlags:", a1);
}

uint64_t simple_session_set_homedir_size(void *a1, uint64_t a2, CFErrorRef *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  char *v10;
  CFErrorRef Error;
  void *v12;
  NSObject *v13;
  char *v14;
  uint64_t v15;
  CFErrorRef v16;

  v5 = a1;
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = session_set_homedir_size((uint64_t)v6, a2);

  if (v7)
  {
    _simple_session_log();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      _simple_session_log();
      v9 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("simple_session_set_homedir_size", "simple_session.m", 73, "com.apple.security.cryptex.posix", v7, 0, v10);
    free(v10);
    if (a3 && Error)
    {
      _simple_session_log();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        _simple_session_log();
        v13 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        v14 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        v14 = (char *)_os_log_send_and_compose_impl();
      }
      v16 = createError("simple_session_set_homedir_size", "simple_session.m", 78, "com.apple.security.cryptex", 14, Error, v14);
      free(v14);
      *a3 = v16;
      goto LABEL_13;
    }
    if (Error)
    {
LABEL_13:
      CFRelease(Error);
      v15 = 0;
      goto LABEL_14;
    }
  }
  v15 = 1;
LABEL_14:

  return v15;
}

void sub_2126F96E4(_Unwind_Exception *a1)
{
  const void *v1;
  void *v2;

  free(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

id _simple_session_log()
{
  if (_simple_session_log_onceToken != -1)
    dispatch_once(&_simple_session_log_onceToken, &__block_literal_global);
  return (id)_simple_session_log_trampoline_log;
}

uint64_t simple_session_add_session_environment(void *a1, void *a2, CFErrorRef *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  char *v11;
  CFErrorRef Error;
  void *v13;
  NSObject *v14;
  char *v15;
  uint64_t v16;
  CFErrorRef v17;

  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = session_add_session_environment((uint64_t)v7, v6);

  if (v8)
  {
    _simple_session_log();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _simple_session_log();
      v10 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      v11 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("simple_session_add_session_environment", "simple_session.m", 91, "com.apple.security.cryptex.posix", v8, 0, v11);
    free(v11);
    if (a3 && Error)
    {
      _simple_session_log();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        _simple_session_log();
        v14 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        v15 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        v15 = (char *)_os_log_send_and_compose_impl();
      }
      v17 = createError("simple_session_add_session_environment", "simple_session.m", 96, "com.apple.security.cryptex", 14, Error, v15);
      free(v15);
      *a3 = v17;
      goto LABEL_13;
    }
    if (Error)
    {
LABEL_13:
      CFRelease(Error);
      v16 = 0;
      goto LABEL_14;
    }
  }
  v16 = 1;
LABEL_14:

  return v16;
}

void sub_2126F9A34(_Unwind_Exception *a1)
{
  const void *v1;
  void *v2;

  free(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t simple_session_activate(void *a1, CFErrorRef *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  char *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  CFErrorRef Error;
  CFErrorRef v14;
  void *v15;
  NSObject *v16;
  char *v17;
  uint64_t v18;
  CFErrorRef v19;

  v3 = a1;
  objc_msgSend(v3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = session_activate((uint64_t)v4);

  if (v5)
  {
    _simple_session_log();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _simple_session_log();
      v7 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      v8 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v8 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("simple_session_activate", "simple_session.m", 110, "com.apple.security.cryptex.posix", v5, 0, v8);
  }
  else
  {
    objc_msgSend(v3, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = session_start((uint64_t)v9);

    if (!v10)
      goto LABEL_16;
    _simple_session_log();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _simple_session_log();
      v12 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      v8 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v8 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("simple_session_activate", "simple_session.m", 117, "com.apple.security.cryptex.posix", v10, 0, v8);
  }
  v14 = Error;
  free(v8);
  if (a2 && v14)
  {
    _simple_session_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      _simple_session_log();
      v16 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      v17 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v17 = (char *)_os_log_send_and_compose_impl();
    }
    v19 = createError("simple_session_activate", "simple_session.m", 124, "com.apple.security.cryptex", 14, v14, v17);
    free(v17);
    *a2 = v19;
    goto LABEL_19;
  }
  if (v14)
  {
LABEL_19:
    CFRelease(v14);
    v18 = 0;
    goto LABEL_20;
  }
LABEL_16:
  v18 = 1;
LABEL_20:

  return v18;
}

void sub_2126F9E58(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

uint64_t simple_session_stop(void *a1, CFErrorRef *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  char *v8;
  CFErrorRef Error;
  void *v10;
  NSObject *v11;
  char *v12;
  uint64_t v13;
  CFErrorRef v14;

  v3 = a1;
  objc_msgSend(v3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = session_stop((uint64_t)v4);

  if (v5)
  {
    _simple_session_log();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _simple_session_log();
      v7 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      v8 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v8 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("simple_session_stop", "simple_session.m", 139, "com.apple.security.cryptex.posix", v5, 0, v8);
    free(v8);
    if (a2 && Error)
    {
      _simple_session_log();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        _simple_session_log();
        v11 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
        v12 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        v12 = (char *)_os_log_send_and_compose_impl();
      }
      v14 = createError("simple_session_stop", "simple_session.m", 146, "com.apple.security.cryptex", 14, Error, v12);
      free(v12);
      *a2 = v14;
      goto LABEL_13;
    }
    if (Error)
    {
LABEL_13:
      CFRelease(Error);
      v13 = 0;
      goto LABEL_14;
    }
  }
  v13 = 1;
LABEL_14:

  return v13;
}

void sub_2126FA154(_Unwind_Exception *a1)
{
  const void *v1;
  void *v2;

  free(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

char *simple_session_copy_homedir(void *a1)
{
  void *v1;
  const char *homedir;
  char *v3;

  objc_msgSend(a1, "session");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  homedir = (const char *)session_get_homedir((uint64_t)v1);
  v3 = strdup(homedir);

  return v3;
}

uint64_t simple_session_get_uuid(void *a1, unsigned __int8 *a2)
{
  void *v3;
  uint64_t uuid;

  objc_msgSend(a1, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = session_get_uuid((uint64_t)v3, a2);

  return uuid;
}

uint64_t simple_session_get_uid(void *a1)
{
  void *v1;
  uint64_t uid;

  objc_msgSend(a1, "session");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uid = session_get_uid((uint64_t)v1);

  return uid;
}

char *simple_session_copy_name(void *a1)
{
  void *v1;
  const char *name;
  char *v3;

  objc_msgSend(a1, "session");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  name = (const char *)session_get_name((uint64_t)v1);
  v3 = strdup(name);

  return v3;
}

uint64_t simple_session_iter_list()
{
  return 0;
}

uint64_t cryptex_simple_run_cmd()
{
  return 0;
}

uint64_t cryptex_simple_run_cmd_custom()
{
  return 0;
}

void ___simple_session_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libcryptex", "simple_session_spi");
  v1 = (void *)_simple_session_log_trampoline_log;
  _simple_session_log_trampoline_log = (uint64_t)v0;

}

CFErrorRef img4_chip_instance_from_xpc(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  char *v5;
  CFErrorRef Error;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  CFErrorRef v11;
  uint64_t v13;
  char *v14;
  CFErrorRef v15;
  char v16;
  char v17;
  int v18;
  CFErrorRef v19;
  __int128 v20;
  __int128 v21;
  int v22;
  int v23;
  int v24;
  int v25;
  char v26;
  int v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  int v33;
  uint64_t v34;
  int v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  v43[0] = 0;
  *(_QWORD *)((char *)v43 + 6) = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  memset(v42, 0, 19);
  if (!v3)
  {
    LOWORD(v35) = 0;
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 94, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v3, "img4_chip_omit", &v34))
  {
    v35 = 136315138;
    v36 = "img4_chip_omit";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 98, "com.apple.security.cryptex", 11, 0, v5);
LABEL_23:
    v11 = Error;
    free(v5);
    goto LABEL_24;
  }
  v7 = v34;
  v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_cepo", &v34))
  {
    v35 = 136315138;
    v36 = "img4_chip_cepo";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 99, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v8 = v34;
  if (HIDWORD(v34))
  {
    v35 = 134218242;
    v36 = (const char *)v34;
    v37 = 2080;
    v38 = "img4_chip_cepo";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 99, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_bord", &v34))
  {
    v35 = 136315138;
    v36 = "img4_chip_bord";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 100, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v9 = v34;
  if (HIDWORD(v34))
  {
    v35 = 134218242;
    v36 = (const char *)v34;
    v37 = 2080;
    v38 = "img4_chip_bord";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 100, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_chip", &v34))
  {
    v35 = 136315138;
    v36 = "img4_chip_chip";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 101, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v10 = v34;
  if (HIDWORD(v34))
  {
    v35 = 134218242;
    v36 = (const char *)v34;
    v37 = 2080;
    v38 = "img4_chip_chip";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 101, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_sdom", &v34))
  {
    v35 = 136315138;
    v36 = "img4_chip_sdom";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 102, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  if (HIDWORD(v34))
  {
    v35 = 134218242;
    v36 = (const char *)v34;
    v37 = 2080;
    v38 = "img4_chip_sdom";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 102, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v33 = v34;
  v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_ecid", &v34))
  {
    v35 = 136315138;
    v36 = "img4_chip_ecid";
    v5 = (char *)_os_log_send_and_compose_impl();
    Error = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 103, "com.apple.security.cryptex", 11, 0, v5);
    goto LABEL_23;
  }
  v13 = v34;
  v34 = 0;
  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_cpro", &v34))
  {
    v35 = 136315138;
    v36 = "img4_chip_cpro";
    v14 = (char *)_os_log_send_and_compose_impl();
    v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 104, "com.apple.security.cryptex", 11, 0, v14);
  }
  else
  {
    v16 = v34;
    if (v34 < 2)
    {
      v34 = 0;
      if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_csec", &v34))
      {
        v35 = 136315138;
        v36 = "img4_chip_csec";
        v14 = (char *)_os_log_send_and_compose_impl();
        v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 105, "com.apple.security.cryptex", 11, 0, v14);
      }
      else
      {
        v17 = v34;
        if (v34 < 2)
        {
          v34 = 0;
          if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_epro", &v34))
          {
            v35 = 136315138;
            v36 = "img4_chip_epro";
            v14 = (char *)_os_log_send_and_compose_impl();
            v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 106, "com.apple.security.cryptex", 11, 0, v14);
          }
          else
          {
            v32 = v34;
            if (v34 < 2)
            {
              v34 = 0;
              if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_esec", &v34))
              {
                v35 = 136315138;
                v36 = "img4_chip_esec";
                v14 = (char *)_os_log_send_and_compose_impl();
                v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 107, "com.apple.security.cryptex", 11, 0, v14);
              }
              else
              {
                v31 = v34;
                if (v34 < 2)
                {
                  v34 = 0;
                  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_iuou", &v34))
                  {
                    v35 = 136315138;
                    v36 = "img4_chip_iuou";
                    v14 = (char *)_os_log_send_and_compose_impl();
                    v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 108, "com.apple.security.cryptex", 11, 0, v14);
                  }
                  else
                  {
                    v30 = v34;
                    if (v34 < 2)
                    {
                      v34 = 0;
                      if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_rsch", &v34))
                      {
                        v35 = 136315138;
                        v36 = "img4_chip_rsch";
                        v14 = (char *)_os_log_send_and_compose_impl();
                        v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 109, "com.apple.security.cryptex", 11, 0, v14);
                      }
                      else
                      {
                        v29 = v34;
                        if (v34 < 2)
                        {
                          v34 = 0;
                          if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_euou", &v34))
                          {
                            v35 = 136315138;
                            v36 = "img4_chip_euou";
                            v14 = (char *)_os_log_send_and_compose_impl();
                            v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 110, "com.apple.security.cryptex", 11, 0, v14);
                          }
                          else
                          {
                            v28 = v34;
                            if (v34 < 2)
                            {
                              v34 = 0;
                              if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_esdm", &v34))
                              {
                                v35 = 136315138;
                                v36 = "img4_chip_esdm";
                                v14 = (char *)_os_log_send_and_compose_impl();
                                v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 111, "com.apple.security.cryptex", 11, 0, v14);
                              }
                              else
                              {
                                v27 = v34;
                                if (HIDWORD(v34))
                                {
                                  v35 = 134218242;
                                  v36 = (const char *)v34;
                                  v37 = 2080;
                                  v38 = "img4_chip_esdm";
                                  v14 = (char *)_os_log_send_and_compose_impl();
                                  v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 111, "com.apple.security.cryptex", 11, 0, v14);
                                }
                                else
                                {
                                  v34 = 0;
                                  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_fpgt", &v34))
                                  {
                                    v35 = 136315138;
                                    v36 = "img4_chip_fpgt";
                                    v14 = (char *)_os_log_send_and_compose_impl();
                                    v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 112, "com.apple.security.cryptex", 11, 0, v14);
                                  }
                                  else
                                  {
                                    v26 = v34;
                                    if (v34 < 2)
                                    {
                                      v34 = 0;
                                      if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_fchp", &v34))
                                      {
                                        v35 = 136315138;
                                        v36 = "img4_chip_fchp";
                                        v14 = (char *)_os_log_send_and_compose_impl();
                                        v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 113, "com.apple.security.cryptex", 11, 0, v14);
                                      }
                                      else
                                      {
                                        v25 = v34;
                                        if (HIDWORD(v34))
                                        {
                                          v35 = 134218242;
                                          v36 = (const char *)v34;
                                          v37 = 2080;
                                          v38 = "img4_chip_fchp";
                                          v14 = (char *)_os_log_send_and_compose_impl();
                                          v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 113, "com.apple.security.cryptex", 11, 0, v14);
                                        }
                                        else
                                        {
                                          v34 = 0;
                                          if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_type", &v34))
                                          {
                                            v35 = 136315138;
                                            v36 = "img4_chip_type";
                                            v14 = (char *)_os_log_send_and_compose_impl();
                                            v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 114, "com.apple.security.cryptex", 11, 0, v14);
                                          }
                                          else
                                          {
                                            v24 = v34;
                                            if (HIDWORD(v34))
                                            {
                                              v35 = 134218242;
                                              v36 = (const char *)v34;
                                              v37 = 2080;
                                              v38 = "img4_chip_type";
                                              v14 = (char *)_os_log_send_and_compose_impl();
                                              v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 114, "com.apple.security.cryptex", 11, 0, v14);
                                            }
                                            else
                                            {
                                              v34 = 0;
                                              if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_styp", &v34))
                                              {
                                                v35 = 136315138;
                                                v36 = "img4_chip_styp";
                                                v14 = (char *)_os_log_send_and_compose_impl();
                                                v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 115, "com.apple.security.cryptex", 11, 0, v14);
                                              }
                                              else
                                              {
                                                v23 = v34;
                                                if (HIDWORD(v34))
                                                {
                                                  v35 = 134218242;
                                                  v36 = (const char *)v34;
                                                  v37 = 2080;
                                                  v38 = "img4_chip_styp";
                                                  v14 = (char *)_os_log_send_and_compose_impl();
                                                  v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 115, "com.apple.security.cryptex", 11, 0, v14);
                                                }
                                                else
                                                {
                                                  v34 = 0;
                                                  if (_xpc_dictionary_try_get_uint64(v4, "img4_chip_clas", &v34))
                                                  {
                                                    v35 = 136315138;
                                                    v36 = "img4_chip_clas";
                                                    v14 = (char *)_os_log_send_and_compose_impl();
                                                    v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 116, "com.apple.security.cryptex", 11, 0, v14);
                                                  }
                                                  else
                                                  {
                                                    v18 = v34;
                                                    if (!HIDWORD(v34))
                                                    {
                                                      v20 = v39;
                                                      *(_OWORD *)(a2 + 77) = v40;
                                                      v21 = v42[0];
                                                      *(_OWORD *)(a2 + 93) = v41;
                                                      *(_OWORD *)(a2 + 109) = v21;
                                                      *(_WORD *)a2 = 6;
                                                      *(_QWORD *)(a2 + 2) = v43[0];
                                                      *(_QWORD *)(a2 + 8) = *(_QWORD *)((char *)v43 + 6);
                                                      *(_QWORD *)(a2 + 16) = v7;
                                                      *(_DWORD *)(a2 + 24) = v8;
                                                      *(_DWORD *)(a2 + 28) = v9;
                                                      *(_DWORD *)(a2 + 32) = v10;
                                                      *(_DWORD *)(a2 + 36) = v33;
                                                      *(_QWORD *)(a2 + 40) = v13;
                                                      *(_BYTE *)(a2 + 48) = v16 & 1;
                                                      *(_BYTE *)(a2 + 49) = v17 & 1;
                                                      *(_BYTE *)(a2 + 50) = v32 & 1;
                                                      *(_BYTE *)(a2 + 51) = v31 & 1;
                                                      *(_BYTE *)(a2 + 52) = v30 & 1;
                                                      *(_BYTE *)(a2 + 53) = v29 & 1;
                                                      *(_WORD *)(a2 + 54) = v28 & 1;
                                                      *(_DWORD *)(a2 + 56) = v27;
                                                      *(_BYTE *)(a2 + 60) = v26 & 1;
                                                      v22 = *(_DWORD *)((char *)v42 + 15);
                                                      *(_OWORD *)(a2 + 61) = v20;
                                                      *(_DWORD *)(a2 + 124) = v22;
                                                      *(_DWORD *)(a2 + 128) = v25;
                                                      *(_DWORD *)(a2 + 132) = v24;
                                                      *(_DWORD *)(a2 + 136) = v23;
                                                      *(_DWORD *)(a2 + 140) = v18;
                                                      v11 = 0;
                                                      goto LABEL_24;
                                                    }
                                                    v35 = 134218242;
                                                    v36 = (const char *)v34;
                                                    v37 = 2080;
                                                    v38 = "img4_chip_clas";
                                                    v14 = (char *)_os_log_send_and_compose_impl();
                                                    v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 116, "com.apple.security.cryptex", 11, 0, v14);
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v35 = 134218242;
                                      v36 = (const char *)v34;
                                      v37 = 2080;
                                      v38 = "img4_chip_fpgt";
                                      v14 = (char *)_os_log_send_and_compose_impl();
                                      v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 112, "com.apple.security.cryptex", 11, 0, v14);
                                    }
                                  }
                                }
                              }
                            }
                            else
                            {
                              v35 = 134218242;
                              v36 = (const char *)v34;
                              v37 = 2080;
                              v38 = "img4_chip_euou";
                              v14 = (char *)_os_log_send_and_compose_impl();
                              v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 110, "com.apple.security.cryptex", 11, 0, v14);
                            }
                          }
                        }
                        else
                        {
                          v35 = 134218242;
                          v36 = (const char *)v34;
                          v37 = 2080;
                          v38 = "img4_chip_rsch";
                          v14 = (char *)_os_log_send_and_compose_impl();
                          v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 109, "com.apple.security.cryptex", 11, 0, v14);
                        }
                      }
                    }
                    else
                    {
                      v35 = 134218242;
                      v36 = (const char *)v34;
                      v37 = 2080;
                      v38 = "img4_chip_iuou";
                      v14 = (char *)_os_log_send_and_compose_impl();
                      v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 108, "com.apple.security.cryptex", 11, 0, v14);
                    }
                  }
                }
                else
                {
                  v35 = 134218242;
                  v36 = (const char *)v34;
                  v37 = 2080;
                  v38 = "img4_chip_esec";
                  v14 = (char *)_os_log_send_and_compose_impl();
                  v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 107, "com.apple.security.cryptex", 11, 0, v14);
                }
              }
            }
            else
            {
              v35 = 134218242;
              v36 = (const char *)v34;
              v37 = 2080;
              v38 = "img4_chip_epro";
              v14 = (char *)_os_log_send_and_compose_impl();
              v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 106, "com.apple.security.cryptex", 11, 0, v14);
            }
          }
        }
        else
        {
          v35 = 134218242;
          v36 = (const char *)v34;
          v37 = 2080;
          v38 = "img4_chip_csec";
          v14 = (char *)_os_log_send_and_compose_impl();
          v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 105, "com.apple.security.cryptex", 11, 0, v14);
        }
      }
    }
    else
    {
      v35 = 134218242;
      v36 = (const char *)v34;
      v37 = 2080;
      v38 = "img4_chip_cpro";
      v14 = (char *)_os_log_send_and_compose_impl();
      v15 = createError("img4_chip_instance_from_xpc", "img4_xpc.m", 104, "com.apple.security.cryptex", 11, 0, v14);
    }
  }
  v19 = v15;
  free(v14);
  v11 = v19;
LABEL_24:

  return v11;
}

void sub_2126FBBCC(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

uint64_t _IORegistryExchangeWithFirstChildOfClass(io_object_t *a1, const char *a2)
{
  uint64_t v2;
  io_object_t v6;
  io_object_t v7;
  io_object_t object;

  object = 0;
  v2 = 2;
  if (a1 && a2)
  {
    if (!MEMORY[0x212BF0CBC](*a1, "IOService", &object))
    {
      v6 = IOIteratorNext(object);
      if (v6)
      {
        v7 = v6;
        while (!IOObjectConformsTo(v7, a2))
        {
          IOObjectRelease(v7);
          v7 = IOIteratorNext(object);
          if (!v7)
          {
            v2 = 2;
            goto LABEL_4;
          }
        }
        IOObjectRelease(*a1);
        v2 = 0;
        *a1 = v7;
      }
    }
LABEL_4:
    if (object)
      IOObjectRelease(object);
  }
  return v2;
}

char *_cryptex_version()
{
  return __darwin_version_string;
}

uint64_t _cryptex_install_core(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  _QWORD *v16;
  xpc_object_t v17;
  uint64_t result;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[22];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = _g;
  v60 = 0;
  memset(v59, 0, sizeof(v59));
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  v51 = 0u;
  v50 = 0u;
  v49 = 0u;
  v48 = 0u;
  v47 = 0u;
  v46 = 0u;
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 32;
  if (a2 && *(_QWORD *)(a2 + 48) >= 3uLL)
  {
    v4 = *(const char **)(a1 + 16);
    v5 = *__error();
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "[anonymous]";
      if (v4)
        v7 = v4;
      *(_DWORD *)buf = 136446210;
      v31 = v7;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Installing as ephemeral", buf, 0xCu);
    }
    *__error() = v5;
  }
  if (!cryptex_core_get_image_asset())
  {
    v8 = *(const char **)(a1 + 16);
    v9 = *__error();
    v10 = *(NSObject **)(a1 + 32);
    v11 = 22;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = "[anonymous]";
      if (v8)
        v12 = v8;
      *(_DWORD *)buf = 136446466;
      v31 = v12;
      v32 = 1024;
      LODWORD(v33) = 22;
      v13 = "%{public}s: cryptex doesn't contain image asset: %{darwin.errno}d";
      goto LABEL_21;
    }
LABEL_22:
    v16 = 0;
    v17 = 0;
    goto LABEL_40;
  }
  if (!cryptex_core_get_tc_asset())
  {
    v14 = *(const char **)(a1 + 16);
    v9 = *__error();
    v10 = *(NSObject **)(a1 + 32);
    v11 = 22;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = "[anonymous]";
      if (v14)
        v15 = v14;
      *(_DWORD *)buf = 136446466;
      v31 = v15;
      v32 = 1024;
      LODWORD(v33) = 22;
      v13 = "%{public}s: cryptex doesn't contain trust cache: %{darwin.errno}d";
LABEL_21:
      _os_log_impl(&dword_2126F8000, v10, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  cryptex_core_get_info_asset();
  cryptex_core_get_volumehash_asset();
  cryptex_core_get_asset();
  cryptex_core_get_asset();
  v17 = xpc_dictionary_create(0, 0, 0);
  result = MEMORY[0x212BF18F8]();
  if (result != MEMORY[0x24BDACFA0])
  {
    __break(1u);
    return result;
  }
  v16 = _cryptex_copy_connected_actor(v3, MEMORY[0x24BEDBC90]);
  _cryptex_actor_init_invoke_u64();
  codex_install_pack();
  v19 = cryptex_actor_trap();
  if ((_DWORD)v19)
  {
    v11 = v19;
    v20 = (const char *)v16[2];
    v9 = *__error();
    v21 = v16[4];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = "[anonymous]";
      if (v20)
        v22 = v20;
      *(_DWORD *)buf = 136446466;
      v31 = v22;
      v32 = 1024;
      LODWORD(v33) = v11;
      v23 = "%{public}s: install rpc: %{darwin.errno}d";
LABEL_34:
      _os_log_impl(&dword_2126F8000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x12u);
    }
  }
  else
  {
    v24 = codex_install_reply_unpack();
    if (!(_DWORD)v24)
    {
      __strlcpy_chk();
      __strlcpy_chk();
      __strlcpy_chk();
      __strlcpy_chk();
      __strlcpy_chk();
      v27 = (const char *)v16[2];
      v9 = *__error();
      v28 = v16[4];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = "[anonymous]";
        if (v27)
          v29 = v27;
        *(_DWORD *)buf = 136446722;
        v31 = v29;
        v32 = 2080;
        v33 = 0;
        v34 = 2080;
        v35 = 0;
        _os_log_impl(&dword_2126F8000, v28, OS_LOG_TYPE_DEBUG, "%{public}s: installed cryptex: name = %s, mount path = %s", buf, 0x20u);
      }
      v11 = 0;
      goto LABEL_40;
    }
    v11 = v24;
    v25 = (const char *)v16[2];
    v9 = *__error();
    v21 = v16[4];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = "[anonymous]";
      if (v25)
        v26 = v25;
      *(_DWORD *)buf = 136446466;
      v31 = v26;
      v32 = 1024;
      LODWORD(v33) = v11;
      v23 = "%{public}s: bad reply from daemon: %{darwin.errno}d";
      goto LABEL_34;
    }
  }
LABEL_40:
  *__error() = v9;
  rpc_destroy(&v36);
  rpc_destroy(v59);
  if (v17)
    os_release(v17);
  if (v16)
    os_release(v16);
  return v11;
}

uint64_t _cryptex_uninstall_by_name()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[22];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  memset(v38, 0, sizeof(v38));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  v15 = 32;
  v0 = _cryptex_copy_connected_actor(_g, MEMORY[0x24BEDBCA0]);
  _cryptex_actor_init_invoke_cstr();
  cryptex_uninstall_pack();
  v1 = cryptex_actor_trap();
  if ((_DWORD)v1)
  {
    v2 = v1;
    v3 = (const char *)v0[2];
    v4 = *__error();
    v5 = v0[4];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = "[anonymous]";
      if (v3)
        v6 = v3;
      *(_DWORD *)buf = 136446466;
      v12 = v6;
      v13 = 1024;
      v14 = v2;
      v7 = "%{public}s: uninstall rpc: %{darwin.errno}d";
LABEL_11:
      _os_log_impl(&dword_2126F8000, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
    }
  }
  else
  {
    v2 = cryptex_uninstall_reply_unpack();
    if (!(_DWORD)v2)
      goto LABEL_13;
    v8 = (const char *)v0[2];
    v4 = *__error();
    v5 = v0[4];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = "[anonymous]";
      if (v8)
        v9 = v8;
      *(_DWORD *)buf = 136446466;
      v12 = v9;
      v13 = 1024;
      v14 = v2;
      v7 = "%{public}s: bad reply from daemon: %{darwin.errno}d";
      goto LABEL_11;
    }
  }
  *__error() = v4;
LABEL_13:
  rpc_destroy(&v15);
  rpc_destroy(v38);
  if (v0)
    os_release(v0);
  return v2;
}

uint64_t _cryptex_copy_list_lossy(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  int v9;
  const char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
  char *v15;
  const char *v16;
  const char *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  char *v21;
  char *v22;
  int v23;
  int v24;
  _BOOL4 v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  size_t v34;
  void *v35;
  uint64_t v36;
  char *__src[2];
  char *v38[2];
  uint8_t buf[3600];
  uint8_t v40[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v35 = 0;
  v4 = (_QWORD *)cryptex_actor_create();
  v5 = v4[4];
  v6 = hdi_copy_mounted(&v35, &v34, v5);
  if ((_DWORD)v6)
  {
    v7 = v6;
    v8 = (const char *)v4[2];
    v9 = *__error();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = "[anonymous]";
      if (v8)
        v10 = v8;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      _os_log_impl(&dword_2126F8000, v5, OS_LOG_TYPE_ERROR, "%{public}s: copy attached dmgs: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v9;
LABEL_38:
    os_release(v4);
    v29 = v7;
    goto LABEL_39;
  }
  v11 = v34;
  if (_dispatch_is_multithreaded())
  {
    v12 = (char *)malloc_type_calloc(v11, 0xE10uLL, 0x1B044E25uLL);
    if (!v12)
    {
      do
      {
        __os_temporary_resource_shortage();
        v13 = (char *)malloc_type_calloc(v11, 0xE10uLL, 0x1B044E25uLL);
      }
      while (!v13);
      v12 = v13;
    }
  }
  else
  {
    v12 = (char *)malloc_type_calloc(v11, 0xE10uLL, 0x61D5536CuLL);
    if (!v12)
      _cryptex_copy_list_lossy_cold_2(v40, buf);
  }
  v31 = a1;
  v32 = a2;
  if (v34)
  {
    v14 = 0;
    v33 = 0;
    do
    {
      v15 = (char *)v35;
      v16 = (char *)v35 + 3582 * v14;
      bzero(buf, 0xE10uLL);
      *(_OWORD *)__src = 0u;
      *(_OWORD *)v38 = 0u;
      v17 = (const char *)v4[2];
      v18 = *__error();
      v19 = v4[4];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v40 = 136446466;
        v20 = "[anonymous]";
        if (v17)
          v20 = v17;
        v41 = v20;
        v42 = 2080;
        v43 = v16;
        _os_log_impl(&dword_2126F8000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: mount: %s", v40, 0x16u);
      }
      *__error() = v18;
      if (_dispatch_is_multithreaded())
      {
        v21 = strdup(v16);
        if (!v21)
        {
          do
          {
            __os_temporary_resource_shortage();
            v22 = strdup(v16);
          }
          while (!v22);
          v21 = v22;
        }
      }
      else
      {
        v21 = strdup(v16);
        if (!v21)
          _cryptex_copy_list_lossy_cold_1(v16, &v36, v40);
      }
      v23 = cryptex_core_parse_hdiid();
      v24 = *__error();
      v25 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v25)
        {
          *(_DWORD *)v40 = 136446466;
          v26 = "[anonymous]";
          if (v17)
            v26 = v17;
          v41 = v26;
          v42 = 2080;
          v43 = v16;
          _os_log_impl(&dword_2126F8000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: not a cryptex: %s", v40, 0x16u);
        }
        *__error() = v24;
      }
      else
      {
        if (v25)
        {
          *(_DWORD *)v40 = 136446466;
          v27 = "[anonymous]";
          if (v17)
            v27 = v17;
          v41 = v27;
          v42 = 2080;
          v43 = v16;
          _os_log_impl(&dword_2126F8000, v19, OS_LOG_TYPE_DEBUG, "%{public}s: found cryptex: %s", v40, 0x16u);
        }
        *__error() = v24;
        strncpy((char *)&buf[8], __src[1], 0xFFuLL);
        strncpy((char *)&buf[263], v38[0], 0xFFuLL);
        v28 = &v15[3582 * v14];
        strncpy((char *)&buf[518], v28 + 510, 0x400uLL);
        strncpy((char *)&buf[1542], v28 + 1534, 0x400uLL);
        strncpy((char *)&buf[2566], v28 + 2558, 0x400uLL);
        memcpy(&v12[3600 * v33++], buf, 0xE10uLL);
      }
      free(v21);
      ++v14;
    }
    while (v14 < v34);
  }
  else
  {
    v33 = 0;
  }
  v7 = 0;
  v29 = 0;
  *v31 = v12;
  *v32 = v33;
  if (v4)
    goto LABEL_38;
LABEL_39:
  free(v35);
  return v29;
}

uint64_t _cryptex_copy_list(_QWORD *a1, size_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  size_t count;
  char *v17;
  char *v18;
  uint64_t v19;
  size_t v20;
  xpc_object_t value;
  void *v22;
  xpc_object_t v23;
  void *v24;
  xpc_object_t v25;
  void *v26;
  xpc_object_t v27;
  void *v28;
  xpc_object_t v29;
  int v30;
  const char *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  int v36;
  NSObject *v37;
  const char *v38;
  const char *v39;
  int v40;
  NSObject *v41;
  const char *v42;
  const char *v43;
  int v44;
  NSObject *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  int v51;
  NSObject *v52;
  const char *v53;
  _QWORD *v54;
  size_t *v55;
  xpc_object_t v56;
  int v57;
  xpc_object_t object;
  size_t v59;
  xpc_object_t xstring;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _OWORD v85[22];
  uint64_t v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  size_t v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  int v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v86 = 0;
  memset(v85, 0, sizeof(v85));
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v69 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v62 = 32;
  v4 = _cryptex_copy_connected_actor(_g, MEMORY[0x24BEDBC90]);
  _cryptex_actor_init_invoke_u64();
  codex_list_pack();
  v5 = cryptex_actor_trap();
  if ((_DWORD)v5)
  {
    v6 = v5;
    v7 = (const char *)v4[2];
    v8 = *__error();
    v9 = v4[4];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = "[anonymous]";
      if (v7)
        v10 = v7;
      *(_DWORD *)buf = 136446466;
      v88 = v10;
      v89 = 1024;
      LODWORD(v90) = v6;
      v11 = "%{public}s: list rpc: %{darwin.errno}d";
LABEL_11:
      _os_log_impl(&dword_2126F8000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v12 = codex_list_reply_unpack();
  if ((_DWORD)v12)
  {
    v6 = v12;
    v13 = (const char *)v4[2];
    v8 = *__error();
    v9 = v4[4];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = "[anonymous]";
      if (v13)
        v14 = v13;
      *(_DWORD *)buf = 136446466;
      v88 = v14;
      v89 = 1024;
      LODWORD(v90) = v6;
      v11 = "%{public}s: bad reply from daemon: %{darwin.errno}d";
      goto LABEL_11;
    }
LABEL_12:
    *__error() = v8;
    goto LABEL_13;
  }
  v54 = a1;
  v55 = a2;
  count = xpc_array_get_count(0);
  if (_dispatch_is_multithreaded())
  {
    v17 = (char *)malloc_type_calloc(count, 0xE10uLL, 0x1B044E25uLL);
    if (!v17)
    {
      do
      {
        __os_temporary_resource_shortage();
        v18 = (char *)malloc_type_calloc(count, 0xE10uLL, 0x1B044E25uLL);
      }
      while (!v18);
      v17 = v18;
    }
  }
  else
  {
    v17 = (char *)malloc_type_calloc(count, 0xE10uLL, 0x61D5536CuLL);
    if (!v17)
      _cryptex_copy_list_lossy_cold_2(&v61, buf);
  }
  if (!count)
  {
LABEL_52:
    v6 = 0;
    *v54 = v17;
    *v55 = count;
    v17 = 0;
    goto LABEL_69;
  }
  v19 = 0;
  v6 = 0;
  v20 = 0;
  v59 = count;
  while (1)
  {
    value = xpc_array_get_value(0, v20);
    v22 = value;
    if (!value || MEMORY[0x212BF18F8](value) != MEMORY[0x24BDACF78])
    {
      v43 = (const char *)v4[2];
      v44 = *__error();
      v45 = v4[4];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v46 = "[anonymous]";
        if (v43)
          v46 = v43;
        v88 = v46;
        v89 = 2048;
        v90 = v20;
        v91 = 2112;
        v92 = v22;
        v93 = 1024;
        v94 = 72;
        v47 = "%{public}s: bad reply from daemon: i = %lu, entry = %@: %{darwin.errno}d";
        goto LABEL_61;
      }
LABEL_62:
      *__error() = v44;
      goto LABEL_68;
    }
    v23 = _xpc_plist_value_copy((uint64_t)&_codex_list_name, v22);
    if (!v23)
    {
      v48 = (const char *)v4[2];
      v44 = *__error();
      v45 = v4[4];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v49 = "[anonymous]";
        if (v48)
          v49 = v48;
        v88 = v49;
        v89 = 2048;
        v90 = v20;
        v91 = 2112;
        v92 = 0;
        v93 = 1024;
        v94 = 72;
        v47 = "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d";
LABEL_61:
        _os_log_impl(&dword_2126F8000, v45, OS_LOG_TYPE_ERROR, v47, buf, 0x26u);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    v24 = v23;
    v25 = _xpc_plist_value_copy((uint64_t)&_codex_list_version, v22);
    if (!v25)
      break;
    v26 = v25;
    v27 = _xpc_plist_value_copy((uint64_t)&_codex_list_devpath, v22);
    if (v27)
    {
      v28 = v27;
      xstring = _xpc_plist_value_copy((uint64_t)&_codex_list_subdevpath, v22);
      if (xstring)
      {
        v29 = _xpc_plist_value_copy((uint64_t)&_codex_list_mntpath, v22);
        if (v29)
        {
          object = v29;
          v56 = _xpc_plist_value_copy((uint64_t)&_codex_list_error, v22);
          v57 = xpc_int64_get_value(v56);
          *(_QWORD *)&v17[v19] = 0;
          xpc_string_get_string_ptr(v24);
          __strlcpy_chk();
          xpc_string_get_string_ptr(v26);
          __strlcpy_chk();
          xpc_string_get_string_ptr(v28);
          __strlcpy_chk();
          xpc_string_get_string_ptr(xstring);
          __strlcpy_chk();
          xpc_string_get_string_ptr(object);
          __strlcpy_chk();
          *(_DWORD *)&v17[v19 + 3592] = v57;
          if (v56)
            os_release(v56);
          os_release(object);
          v30 = 0;
        }
        else
        {
          v39 = (const char *)v4[2];
          v40 = *__error();
          v41 = v4[4];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v42 = "[anonymous]";
            if (v39)
              v42 = v39;
            v88 = v42;
            v89 = 2048;
            v90 = v20;
            v91 = 2112;
            v92 = 0;
            v93 = 1024;
            v94 = 72;
            _os_log_impl(&dword_2126F8000, v41, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
          }
          *__error() = v40;
          v30 = 6;
          v6 = 72;
        }
        os_release(xstring);
      }
      else
      {
        v35 = (const char *)v4[2];
        v36 = *__error();
        v37 = v4[4];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v38 = "[anonymous]";
          if (v35)
            v38 = v35;
          v88 = v38;
          v89 = 2048;
          v90 = v20;
          v91 = 2112;
          v92 = 0;
          v93 = 1024;
          v94 = 72;
          _os_log_impl(&dword_2126F8000, v37, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
        }
        *__error() = v36;
        v30 = 6;
        v6 = 72;
      }
      os_release(v28);
    }
    else
    {
      v31 = (const char *)v4[2];
      v32 = *__error();
      v33 = v4[4];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v34 = "[anonymous]";
        if (v31)
          v34 = v31;
        v88 = v34;
        v89 = 2048;
        v90 = v20;
        v91 = 2112;
        v92 = 0;
        v93 = 1024;
        v94 = 72;
        _os_log_impl(&dword_2126F8000, v33, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
      }
      *__error() = v32;
      v6 = 72;
      v30 = 6;
    }
    os_release(v26);
    os_release(v24);
    if (v30)
      goto LABEL_69;
    ++v20;
    v19 += 3600;
    count = v59;
    if (v59 == v20)
      goto LABEL_52;
  }
  v50 = (const char *)v4[2];
  v51 = *__error();
  v52 = v4[4];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v53 = "[anonymous]";
    if (v50)
      v53 = v50;
    v88 = v53;
    v89 = 2048;
    v90 = v20;
    v91 = 2112;
    v92 = 0;
    v93 = 1024;
    v94 = 72;
    _os_log_impl(&dword_2126F8000, v52, OS_LOG_TYPE_ERROR, "%{public}s: bad reply from daemon: i = %lu, list = %@: %{darwin.errno}d", buf, 0x26u);
  }
  *__error() = v51;
  os_release(v24);
LABEL_68:
  v6 = 72;
LABEL_69:
  free(v17);
LABEL_13:
  rpc_destroy(&v62);
  rpc_destroy(v85);
  if (v4)
    os_release(v4);
  return v6;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_3(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

char *OUTLINED_FUNCTION_4(int *a1)
{
  return strerror(*a1);
}

void _cryptex_signing_service_dealloc(uint64_t a1)
{
  uint64_t v2;
  char v3;
  char v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  v2 = 0;
  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 1;
  do
  {
    v4 = v3;
    close_drop_optional_np();
    v5 = *(void **)(a1 + 40 * v2 + 296);
    if (v5 != (void *)-1 && munmap(v5, *(_QWORD *)(a1 + 40 * v2 + 304)) == -1)
      _cryptex_signing_service_dealloc_cold_1(&v9, v10);
    v6 = a1 + 40 * v2;
    free(*(void **)(v6 + 320));
    v3 = 0;
    *(_QWORD *)(v6 + 320) = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
  free(*(void **)(a1 + 48));
  *(_QWORD *)(a1 + 48) = 0;
  v7 = *(NSObject **)(a1 + 280);
  if (v7)
    dispatch_release(v7);
  img4_buff_dealloc();
  v8 = *(void **)(a1 + 56);
  if (v8)
    os_release(v8);
  object_proto_destroy(a1 + 16);
}

uint64_t cryptex_signing_service_create(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = _cryptex_signing_service_alloc();
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 40) = a1;
  v3 = img4_chip_select_personalized_ap();
  v4 = MEMORY[0x24BEDC3C0];
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 72) = v4;
  *(_QWORD *)(v2 + 80) = ccsha384_di();
  *(_WORD *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 112) = 0;
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 280) = dispatch_semaphore_create(0);
  *(_DWORD *)(v2 + 316) = -1;
  *(_QWORD *)(v2 + 296) = -1;
  *(_DWORD *)(v2 + 356) = -1;
  *(_QWORD *)(v2 + 336) = -1;
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex", "signing-service");
  return v2;
}

CFErrorRef cryptex_signing_service_set_cryptex_core(uint64_t a1, void *object)
{
  _QWORD *v3;
  uint64_t v4;
  int nonce_domain;
  int v6;
  const char *v7;
  int v8;
  int v9;
  const char *v10;
  const char *v11;
  char *v12;
  CFIndex v13;
  int v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  CFErrorRef Error;
  const char *v20;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = os_retain(object);
  *(_QWORD *)(a1 + 56) = v3;
  v4 = v3[21];
  if (v4 && (*(_BYTE *)(v4 + 40) & 1) != 0)
    cryptex_signing_service_set_tss_url(a1, "https://diavlo.apple.com:443");
  nonce_domain = cryptex_core_get_nonce_domain();
  if (nonce_domain)
  {
    v6 = nonce_domain;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v7 = *(const char **)(a1 + 16);
      if (!v7)
        v7 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v23 = v7;
      v24 = 1024;
      LODWORD(v25) = v6;
    }
    else
    {
      v11 = *(const char **)(a1 + 16);
      if (!v11)
        v11 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v23 = v11;
      v24 = 1024;
      LODWORD(v25) = nonce_domain;
    }
    v12 = (char *)_os_log_send_and_compose_impl();
    v13 = v6;
    v14 = 382;
LABEL_27:
    Error = createError("cryptex_signing_service_set_cryptex_core", "signing_service.c", v14, "com.apple.security.cryptex.posix", v13, 0, v12);
    free(v12);
    goto LABEL_28;
  }
  v8 = cryptex_core_copy_nonce_domain_desc();
  if (v8)
  {
    v9 = v8;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v10 = *(const char **)(a1 + 16);
      if (!v10)
        v10 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v23 = v10;
      v24 = 1024;
      LODWORD(v25) = v9;
    }
    else
    {
      v20 = *(const char **)(a1 + 16);
      if (!v20)
        v20 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v23 = v20;
      v24 = 1024;
      LODWORD(v25) = v8;
    }
    v12 = (char *)_os_log_send_and_compose_impl();
    v13 = v9;
    v14 = 389;
    goto LABEL_27;
  }
  v15 = *(const char **)(a1 + 16);
  v16 = *__error();
  v17 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = "[anonymous]";
    if (v15)
      v18 = v15;
    *(_DWORD *)buf = 136446466;
    v23 = v18;
    v24 = 2080;
    v25 = 0;
    _os_log_impl(&dword_2126F8000, v17, OS_LOG_TYPE_DEBUG, "%{public}s: signing with nonce from %s", buf, 0x16u);
  }
  Error = 0;
  *__error() = v16;
LABEL_28:
  free(0);
  return Error;
}

char *cryptex_signing_service_set_tss_url(uint64_t a1, const char *a2)
{
  char *result;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  free(*(void **)(a1 + 48));
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = strdup(a2);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = strdup(a2);
    if (!result)
      cryptex_signing_service_set_tss_url_cold_1(a2, &v5, v6);
  }
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

uint64_t cryptex_signing_service_set_image(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 40 * *(_QWORD *)(a2 + 40);
  v4 = *(_DWORD *)(v3 + 316);
  *(_QWORD *)(v3 + 288) = a2;
  result = _xferfd_unguarded(a3);
  *(_DWORD *)(v3 + 316) = result;
  if ((v4 & 0x80000000) == 0)
  {
    result = close(v4);
    if ((_DWORD)result == -1)
      cryptex_signing_service_set_image_cold_1(&v6, v7);
  }
  return result;
}

void cryptex_signing_service_set_image_bytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v6 = a1 + 40 * *(_QWORD *)(a2 + 40);
  v7 = *(void **)(v6 + 320);
  v8 = memdup2_np();
  *(_QWORD *)(v6 + 288) = a2;
  *(_QWORD *)(v6 + 320) = v8;
  *(_QWORD *)(v6 + 304) = a4;
  *(_DWORD *)(v6 + 312) = a4;
  free(v7);
}

void *cryptex_signing_service_set_sso_ticket(_QWORD *a1, const void *a2, size_t a3)
{
  void *v6;
  void *result;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v6 = malloc_type_malloc(a3, 0x2D5C015EuLL);
      if (v6)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v6 = malloc_type_malloc(a3, 0x18EC0261uLL);
    if (!v6)
      cryptex_signing_service_set_sso_ticket_cold_1(&v8, v9);
  }
  a1[12] = v6;
  a1[13] = a3;
  a1[14] = _cryptex_signing_service_buff_dealloc;
  result = memcpy(v6, a2, a3);
  a1[15] = a1 + 11;
  a1[5] &= ~1uLL;
  return result;
}

void _cryptex_signing_service_buff_dealloc(int a1, void *a2)
{
  free(a2);
}

CFErrorRef cryptex_signing_service_sign(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char **v5;
  const char *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  int v17;
  NSObject *v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *v22;
  char *v23;
  CFErrorRef Error;
  const char *v25;
  int v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const __CFNumber *v30;
  const __CFNumber *v31;
  const __CFData *v32;
  const char *v33;
  char *v34;
  CFIndex v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  int v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  int generic_digest;
  const char *v45;
  int v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  const char *v51;
  int v52;
  NSObject *v53;
  const char *v54;
  const char *v55;
  int v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  NSObject *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint8_t v66[4];
  const char *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  int v71;
  uint8_t buf[32];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v76 = 0u;
  v77 = 0u;
  v75 = 0u;
  v78 = 0x3000000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (!v2 || (v3 = *(_QWORD *)(v2 + 168)) == 0)
  {
    v16 = *(const char **)(a1 + 16);
    v17 = *__error();
    v18 = *(NSObject **)(a1 + 32);
    v19 = 1;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = "[anonymous]";
      if (v16)
        v20 = v16;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1;
      v21 = "%{public}s: caller did not provide chip instance: %{darwin.errno}d";
      goto LABEL_18;
    }
LABEL_19:
    *__error() = v17;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v22 = *(const char **)(a1 + 16);
      if (!v22)
        v22 = "[anonymous]";
    }
    else
    {
      v22 = *(const char **)(a1 + 16);
      if (!v22)
        v22 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v19;
    v23 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_signing_service_sign", "signing_service.c", 571, "com.apple.security.cryptex.posix", v19, 0, v23);
    free(v23);
    MEMORY[0x212BF1094](0);
    return Error;
  }
  v4 = *(_QWORD *)(v3 + 192);
  v5 = (const char **)(a1 + 16);
  v6 = *(const char **)(a1 + 16);
  v7 = *__error();
  v8 = *(NSObject **)(a1 + 32);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v4)
  {
    if (v9)
    {
      v25 = "[anonymous]";
      if (v6)
        v25 = v6;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_2126F8000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip environment", buf, 0xCu);
    }
    *__error() = v7;
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 168) + 1160);
    v26 = img4_chip_instantiate();
    if (!v26)
    {
      *(_QWORD *)(a1 + 272) = a1 + 128;
      goto LABEL_9;
    }
    v19 = v26;
    v27 = *(const char **)(a1 + 16);
    v17 = *__error();
    v18 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v28 = "[anonymous]";
      if (v27)
        v28 = v27;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      v21 = "%{public}s: failed to instantiate chip: %{darwin.errno}d";
LABEL_18:
      _os_log_impl(&dword_2126F8000, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    v10 = "[anonymous]";
    if (v6)
      v10 = v6;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_2126F8000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: using caller-provided chip instance", buf, 0xCu);
  }
  *__error() = v7;
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 168) + 192);
LABEL_9:
  cryptex_core_is_cryptex1();
  v11 = (void *)cryptex_tss_create();
  v12 = img4_nonce_domain_copy_nonce();
  if (!v12)
  {
    if (*(_QWORD *)(a1 + 48))
      cryptex_tss_set_url();
    if (*(_QWORD *)(a1 + 120))
      cryptex_tss_set_data();
    if (!cryptex_core_is_cryptex1())
    {
      v73 = 0u;
      memset(buf, 0, sizeof(buf));
      *(_QWORD *)&v74 = 0x3000000000;
      _cryptex_signing_service_populate_ap_board_chip_sdom_cpro();
      cryptex_tss_set_u64();
      cryptex_tss_set_BOOL();
      cryptex_tss_set_dgst();
      cryptex_tss_set_dgst();
LABEL_50:
      if ((*(_BYTE *)(a1 + 40) & 2) != 0)
        cryptex_tss_set_BOOL();
      v37 = 0;
      while (1)
      {
        v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v37 + 64);
        v73 = 0u;
        v74 = 0u;
        memset(buf, 0, sizeof(buf));
        if (v38)
        {
          if ((**(_BYTE **)(v38 + 8) & 0x14) == 0)
          {
            v39 = *(const char **)(a1 + 16);
            v40 = *__error();
            v41 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v42 = "[anonymous]";
              if (v39)
                v42 = v39;
              v43 = *(_QWORD *)(*(_QWORD *)(v38 + 8) + 40);
              *(_DWORD *)v66 = 136446466;
              v67 = v42;
              v68 = 2080;
              v69 = v43;
              _os_log_impl(&dword_2126F8000, v41, OS_LOG_TYPE_DEBUG, "%{public}s: stamping asset: %s", v66, 0x16u);
            }
            *__error() = v40;
            generic_digest = cryptex_asset_create_generic_digest();
            if (generic_digest)
            {
              v56 = generic_digest;
              v57 = *(NSObject **)(a1 + 32);
              if (v57)
              {
                os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
                v58 = *v5;
                if (!*v5)
                  v58 = "[anonymous]";
                v59 = *(_QWORD *)(*(_QWORD *)(v38 + 8) + 40);
                *(_DWORD *)v66 = 136446722;
                v67 = v58;
                v68 = 2080;
                v69 = v59;
                v70 = 1024;
                v71 = v56;
              }
              else
              {
                v64 = *v5;
                if (!*v5)
                  v64 = "[anonymous]";
                v65 = *(_QWORD *)(*(_QWORD *)(v38 + 8) + 40);
                *(_DWORD *)v66 = 136446722;
                v67 = v64;
                v68 = 2080;
                v69 = v65;
                v70 = 1024;
                v71 = generic_digest;
              }
              v34 = (char *)_os_log_send_and_compose_impl();
              v35 = v56;
              v36 = 644;
              goto LABEL_48;
            }
            cryptex_tss_set_object_dgst();
            if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 176) != MEMORY[0x24BEDBA48])
            {
              cryptex_tss_set_object_BOOL();
              cryptex_tss_set_object_BOOL();
              cryptex_tss_set_object_BOOL();
            }
          }
        }
        else
        {
          v45 = *(const char **)(a1 + 16);
          v46 = *__error();
          v47 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v48 = "[anonymous]";
            if (v45)
              v48 = v45;
            v49 = *(_QWORD *)(*(_QWORD *)(MEMORY[0x24BEDBAB8] + v37) + 40);
            *(_DWORD *)v66 = 136446466;
            v67 = v48;
            v68 = 2080;
            v69 = v49;
            _os_log_impl(&dword_2126F8000, v47, OS_LOG_TYPE_DEBUG, "%{public}s: no asset of type: %s", v66, 0x16u);
          }
          *__error() = v46;
        }
        v37 += 8;
        if (v37 == 96)
        {
          if (cryptex_core_get_asset())
            cryptex_tss_set_c411_from_file();
          cryptex_tss_set_im4m_array();
          cryptex_tss_submit();
          Error = 0;
          goto LABEL_71;
        }
      }
    }
    v29 = *(_QWORD *)(a1 + 56);
    if (v29)
    {
      if (*(_QWORD *)(v29 + 216))
      {
        v30 = CFNumberCreate(0, kCFNumberLongType, (const void *)(*(_QWORD *)(a1 + 272) + 32));
        v31 = CFNumberCreate(0, kCFNumberLongLongType, (const void *)(*(_QWORD *)(a1 + 272) + 40));
        v32 = _AMAuthInstallCryptex1CopyUDID(v30, v31);
        CFDataGetBytePtr(v32);
        CFDataGetLength(v32);
        cryptex_tss_set_data();
        cryptex_tss_set_u32();
        cryptex_tss_set_u32();
        cryptex_tss_set_u32();
        cryptex_tss_set_u32();
        cryptex_tss_set_BOOL();
        cryptex_tss_set_dgst();
        cryptex_tss_set_u32();
        cryptex_tss_set_string();
        cryptex_tss_set_string();
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 216) + 65))
          cryptex_tss_set_BOOL();
        else
          _cryptex_signing_service_populate_ap_board_chip_sdom_cpro();
        if (v32)
          CFRelease(v32);
        if (v31)
          CFRelease(v31);
        if (v30)
          CFRelease(v30);
        goto LABEL_50;
      }
      v60 = *(const char **)(a1 + 16);
      v52 = *__error();
      v53 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v61 = "[anonymous]";
        if (v60)
          v61 = v60;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 22;
        v55 = "%{public}s: Invalid core Cryptex1 properties.: %{darwin.errno}d";
LABEL_87:
        _os_log_impl(&dword_2126F8000, v53, OS_LOG_TYPE_ERROR, v55, buf, 0x12u);
      }
    }
    else
    {
      v51 = *(const char **)(a1 + 16);
      v52 = *__error();
      v53 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = "[anonymous]";
        if (v51)
          v54 = v51;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 22;
        v55 = "%{public}s: Invalid cryptex core.: %{darwin.errno}d";
        goto LABEL_87;
      }
    }
    *__error() = v52;
    v62 = *(NSObject **)(a1 + 32);
    if (v62)
    {
      os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
      v63 = *v5;
      if (!*v5)
        v63 = "[anonymous]";
    }
    else
    {
      v63 = *v5;
      if (!*v5)
        v63 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v63;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 22;
    v34 = (char *)_os_log_send_and_compose_impl();
    v36 = 606;
    v35 = 22;
    goto LABEL_48;
  }
  v13 = v12;
  v14 = *(NSObject **)(a1 + 32);
  if (v14)
  {
    os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    v15 = *v5;
    if (!*v5)
      v15 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
  }
  else
  {
    v33 = *v5;
    if (!*v5)
      v33 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v33;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
  }
  v34 = (char *)_os_log_send_and_compose_impl();
  v35 = v13;
  v36 = 587;
LABEL_48:
  Error = createError("cryptex_signing_service_sign", "signing_service.c", v36, "com.apple.security.cryptex.posix", v35, 0, v34);
  free(v34);
LABEL_71:
  MEMORY[0x212BF1094](v11);
  if (v11)
    os_release(v11);
  return Error;
}

CFIndex cryptex_signing_service_trust(uint64_t a1)
{
  uint64_t v2;
  CFIndex TopLevelPosixError;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  char v19;
  char ***v20;
  char v21;
  char **v22;
  uint64_t v23;
  const char *v24;
  int v25;
  NSObject *v26;
  char *v27;
  const char *v28;
  uint64_t (*v29)(uint64_t, uint64_t **, uint64_t);
  char ***v30;
  uint64_t v31;
  const char *v32;
  NSObject *v33;
  _BOOL4 v34;
  char *v35;
  const char *v36;
  uint64_t v37;
  char *v38;
  const char *v39;
  void **v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  char *v44;
  uint8_t v46[4];
  const char *v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  int v51;
  uint8_t buf[32];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0x3000000000;
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  v58 = 0x3000000000;
  v2 = img4_chip_instantiate();
  if ((_DWORD)v2)
  {
    TopLevelPosixError = v2;
    v4 = *(const char **)(a1 + 16);
    v5 = *__error();
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = "[anonymous]";
      if (v4)
        v7 = v4;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = TopLevelPosixError;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_ERROR, "%{public}s: failed to instantiate chip: %{darwin.errno}d", buf, 0x12u);
    }
    v8 = __error();
    v9 = 0;
    goto LABEL_46;
  }
  *(_QWORD *)(a1 + 272) = a1 + 128;
  v9 = (void *)cryptex_tss_create();
  if (*(_QWORD *)(a1 + 72))
  {
    v10 = img4_nonce_domain_copy_nonce();
    if ((_DWORD)v10)
    {
      TopLevelPosixError = v10;
      v11 = *(const char **)(a1 + 16);
      v5 = *__error();
      v12 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = "[anonymous]";
        if (v11)
          v13 = v11;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = TopLevelPosixError;
        v14 = "%{public}s: failed to copy nonce: %{darwin.errno}d";
        v15 = buf;
        v16 = v12;
        v17 = 18;
        goto LABEL_44;
      }
      goto LABEL_45;
    }
  }
  else
  {
    cryptex_tss_set_BOOL();
  }
  if (*(_QWORD *)(a1 + 48))
    cryptex_tss_set_url();
  if (*(_QWORD *)(a1 + 120))
    cryptex_tss_set_data();
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();
  cryptex_tss_set_u64();
  cryptex_tss_set_BOOL();
  cryptex_tss_set_BOOL();
  cryptex_tss_set_dgst();
  cryptex_tss_set_dgst();
  MEMORY[0x212BF1094](v9);
  v18 = 0;
  v19 = 1;
  v20 = _image_specs;
  while (1)
  {
    v21 = v19;
    v22 = v20[v18];
    v23 = a1 + 40 * v18;
    v53 = 0u;
    v54 = 0u;
    memset(buf, 0, sizeof(buf));
    if ((*(_DWORD *)(v23 + 316) & 0x80000000) != 0)
    {
      v30 = v20;
      v31 = *(_QWORD *)(a1 + 40 * v18 + 320);
      v32 = *(const char **)(a1 + 16);
      v25 = *__error();
      v33 = *(NSObject **)(a1 + 32);
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
      if (!v31)
      {
        if (v34)
        {
          v38 = *v22;
          v39 = "[anonymous]";
          if (v32)
            v39 = v32;
          *(_DWORD *)v46 = 136446466;
          v47 = v39;
          v48 = 2080;
          v49 = v38;
          _os_log_impl(&dword_2126F8000, v33, OS_LOG_TYPE_DEBUG, "%{public}s: object not present: %s", v46, 0x16u);
        }
        *__error() = v25;
        v20 = v30;
        goto LABEL_33;
      }
      if (v34)
      {
        v35 = *v22;
        v36 = "[anonymous]";
        if (v32)
          v36 = v32;
        *(_DWORD *)v46 = 136446466;
        v47 = v36;
        v48 = 2080;
        v49 = v35;
        _os_log_impl(&dword_2126F8000, v33, OS_LOG_TYPE_DEBUG, "%{public}s: object is a buffer: %s", v46, 0x16u);
      }
      v29 = _cryptex_signing_service_read_buff;
      v20 = v30;
    }
    else
    {
      v24 = *(const char **)(a1 + 16);
      v25 = *__error();
      v26 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = *v22;
        v28 = "[anonymous]";
        if (v24)
          v28 = v24;
        *(_DWORD *)v46 = 136446466;
        v47 = v28;
        v48 = 2080;
        v49 = v27;
        _os_log_impl(&dword_2126F8000, v26, OS_LOG_TYPE_DEBUG, "%{public}s: object is a fd: %s", v46, 0x16u);
      }
      v29 = _cryptex_signing_service_read_fd;
    }
    *__error() = v25;
    v37 = v29(a1, (uint64_t **)(v23 + 288), (uint64_t)buf);
    if ((_DWORD)v37)
      break;
    cryptex_tss_set_object_dgst();
    cryptex_tss_set_object_BOOL();
    cryptex_tss_set_object_BOOL();
    cryptex_tss_set_object_BOOL();
LABEL_33:
    v19 = 0;
    v18 = 1;
    if ((v21 & 1) == 0)
    {
      v40 = (void **)ctx_new((void *)a1, 0x18uLL);
      cryptex_tss_submit();
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 280), 0xFFFFFFFFFFFFFFFFLL);
      TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)v40[2]);
      goto LABEL_47;
    }
  }
  TopLevelPosixError = v37;
  v41 = *(const char **)(a1 + 16);
  v5 = *__error();
  v42 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v43 = "[anonymous]";
    if (v41)
      v43 = v41;
    v44 = **(char ***)(v23 + 288);
    *(_DWORD *)v46 = 136446722;
    v47 = v43;
    v48 = 2080;
    v49 = v44;
    v50 = 1024;
    v51 = TopLevelPosixError;
    v14 = "%{public}s: failed to compute digest: %s: %{darwin.errno}d";
    v15 = v46;
    v16 = v42;
    v17 = 28;
LABEL_44:
    _os_log_impl(&dword_2126F8000, v16, OS_LOG_TYPE_ERROR, v14, v15, v17);
  }
LABEL_45:
  v8 = __error();
LABEL_46:
  v40 = 0;
  *v8 = v5;
LABEL_47:
  MEMORY[0x212BF1094](v9);
  ctx_destroy(v40);
  if (v9)
    os_release(v9);
  return TopLevelPosixError;
}

uint64_t _cryptex_signing_service_read_fd(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  off_t st_size;
  uint64_t *v16;
  uint64_t *v17;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  stat v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  memset(&v24, 0, sizeof(v24));
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v22 - v6, v7);
  if (**(_QWORD **)(a1 + 80) >= 0x31uLL)
    _cryptex_signing_service_read_fd_cold_1(&v23, buf);
  if (fstat(*((_DWORD *)a2 + 7), &v24))
  {
    v8 = *__error();
    v9 = *(const char **)(a1 + 16);
    v10 = *__error();
    v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = "[anonymous]";
      if (v9)
        v12 = v9;
      v13 = **a2;
      *(_DWORD *)buf = 136446722;
      v26 = v12;
      v27 = 2080;
      v28 = v13;
      v29 = 1024;
      v30 = v8;
      v14 = "%{public}s: failed to stat object: %s: %{darwin.errno}d";
LABEL_7:
      _os_log_impl(&dword_2126F8000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x1Cu);
    }
  }
  else
  {
    st_size = v24.st_size;
    if (v24.st_size < 0)
      _cryptex_signing_service_read_fd_cold_2();
    v16 = (uint64_t *)mmap(0, v24.st_size, 1, 1, *((_DWORD *)a2 + 7), 0);
    if (v16 != (uint64_t *)-1)
    {
      v17 = v16;
      ccdigest_init();
      ccdigest_update();
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 56))();
      v8 = 0;
      *(_QWORD *)(a3 + 8) = **(_QWORD **)(a1 + 80);
      a2[1] = v17;
      a2[2] = (uint64_t *)st_size;
      *((_DWORD *)a2 + 6) = st_size;
      return v8;
    }
    v8 = *__error();
    v19 = *(const char **)(a1 + 16);
    v10 = *__error();
    v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = "[anonymous]";
      if (v19)
        v20 = v19;
      v21 = **a2;
      *(_DWORD *)buf = 136446722;
      v26 = v20;
      v27 = 2080;
      v28 = v21;
      v29 = 1024;
      v30 = v8;
      v14 = "%{public}s: failed to map asset into memory: %s: %{darwin.errno}d";
      goto LABEL_7;
    }
  }
  *__error() = v10;
  return v8;
}

uint64_t _cryptex_signing_service_read_buff(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  _BYTE v41[10];
  _QWORD v42[9];

  v42[8] = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v36 = 0;
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v34 - v6, v7);
  v8 = *((unsigned int *)a2 + 5);
  v9 = *(const char **)(a1 + 16);
  v10 = *__error();
  v11 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = "[anonymous]";
      v13 = a2[2];
      if (v9)
        v12 = v9;
      *(_DWORD *)buf = 136446978;
      v39 = v12;
      v40 = 2048;
      *(_QWORD *)v41 = v13;
      *(_WORD *)&v41[8] = 1024;
      LODWORD(v42[0]) = -1;
      WORD2(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 6) = 34;
      _os_log_impl(&dword_2126F8000, v11, OS_LOG_TYPE_ERROR, "%{public}s: payload too large: actual = %lu, expected <= %u: %{darwin.errno}d", buf, 0x22u);
    }
    *__error() = v10;
    v14 = 34;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = "[anonymous]";
      if (v9)
        v15 = v9;
      v16 = (*a2)[2];
      v17 = a2[2];
      *(_DWORD *)buf = 136446722;
      v39 = v15;
      v40 = 2080;
      *(_QWORD *)v41 = v16;
      *(_WORD *)&v41[8] = 2048;
      v42[0] = v17;
      _os_log_impl(&dword_2126F8000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: wrapping object: 4cc = %s, length = %lu", buf, 0x20u);
    }
    *__error() = v10;
    v18 = Img4EncodeCreatePayload((const char *)(*a2)[2], "1", a2[4], *((_DWORD *)a2 + 6), 0, 0, &v37, &v36);
    v14 = 22;
    switch(v18)
    {
      case 'd':
        v19 = (uint64_t *)mmap(0, v36, 3, 4098, -1, 0);
        if (v19 == (uint64_t *)-1)
        {
          v14 = *__error();
          v30 = *(const char **)(a1 + 16);
          v23 = *__error();
          v31 = *(NSObject **)(a1 + 32);
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          v32 = "[anonymous]";
          if (v30)
            v32 = v30;
          v33 = **a2;
          *(_DWORD *)buf = 136446722;
          v39 = v32;
          v40 = 2080;
          *(_QWORD *)v41 = v33;
          *(_WORD *)&v41[8] = 1024;
          LODWORD(v42[0]) = v14;
          v26 = "%{public}s: failed to map anonymous buffer for object: %s: %{darwin.errno}d";
          v27 = v31;
          v28 = 28;
          goto LABEL_23;
        }
        v20 = v19;
        memcpy(v19, v37, v36);
        ccdigest_init();
        if (**(_QWORD **)(a1 + 80) >= 0x31uLL)
          _cryptex_signing_service_read_fd_cold_1(&v35, buf);
        ccdigest_update();
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 56))();
        v14 = 0;
        *(_QWORD *)(a3 + 8) = **(_QWORD **)(a1 + 80);
        v21 = (uint64_t *)v36;
        a2[1] = v20;
        a2[2] = v21;
        *((_DWORD *)a2 + 6) = (_DWORD)v21;
        break;
      case 'e':
        goto LABEL_19;
      case 'f':
        v14 = 12;
        goto LABEL_19;
      case 'h':
        v14 = 14;
        goto LABEL_19;
      case 'i':
        v14 = 78;
        goto LABEL_19;
      default:
        v14 = 104;
LABEL_19:
        v22 = *(const char **)(a1 + 16);
        v23 = *__error();
        v24 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = "[anonymous]";
          *(_DWORD *)buf = 136446722;
          if (v22)
            v25 = v22;
          v39 = v25;
          v40 = 1024;
          *(_DWORD *)v41 = v18;
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = v14;
          v26 = "%{public}s: failed to wrap object: %d: %{darwin.errno}d";
          v27 = v24;
          v28 = 24;
LABEL_23:
          _os_log_impl(&dword_2126F8000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
        }
LABEL_24:
        *__error() = v23;
        break;
    }
  }
  free(v37);
  return v14;
}

intptr_t _cryptex_signing_service_trust_continue(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v5;
  const char *v7;
  const char *v8;
  const char *v9;
  char *v10;
  const char *v11;
  int v12;
  CFIndex v13;
  const void *v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  char v19;
  uint64_t **v20;
  int v21;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  CFErrorRef Error;
  int v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  _BYTE v40[24];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = *a4;
  if (a3)
  {
    if (*(_QWORD *)(v5 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v5 + 32), OS_LOG_TYPE_ERROR);
      v7 = *(const char **)(v5 + 16);
      if (!v7)
        v7 = "[anonymous]";
      *(_DWORD *)v40 = 136446210;
      *(_QWORD *)&v40[4] = v7;
    }
    else
    {
      v9 = *(const char **)(v5 + 16);
      if (!v9)
        v9 = "[anonymous]";
      *(_DWORD *)v40 = 136446210;
      *(_QWORD *)&v40[4] = v9;
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    v11 = "com.apple.security.cryptex";
    v12 = 280;
    v13 = 5;
    v14 = a3;
    goto LABEL_38;
  }
  if (!MEMORY[0x24BEDC490])
  {
    if (*(_QWORD *)(v5 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v5 + 32), OS_LOG_TYPE_ERROR);
      v8 = *(const char **)(v5 + 16);
      if (!v8)
        v8 = "[anonymous]";
    }
    else
    {
      v8 = *(const char **)(v5 + 16);
      if (!v8)
        v8 = "[anonymous]";
    }
    *(_DWORD *)v40 = 136446466;
    *(_QWORD *)&v40[4] = v8;
    *(_WORD *)&v40[12] = 1024;
    *(_DWORD *)&v40[14] = 78;
    v10 = (char *)_os_log_send_and_compose_impl();
    v11 = "com.apple.security.cryptex.posix";
    v12 = 287;
    v13 = 78;
    goto LABEL_37;
  }
  v15 = 0;
  v16 = 1;
  while (1)
  {
    v17 = (_QWORD *)(v5 + 40 * v15);
    v18 = v17[36];
    *(_QWORD *)v40 = 0;
    *(_QWORD *)&v40[8] = v17[37];
    v19 = v16;
    *(_QWORD *)&v40[16] = v17[38];
    v41 = 0;
    if (v18)
    {
      if (*(_QWORD *)(v18 + 32))
        break;
    }
LABEL_24:
    v16 = 0;
    v15 = 1;
    if ((v19 & 1) == 0)
    {
      Error = 0;
      goto LABEL_39;
    }
  }
  v20 = (uint64_t **)(v17 + 36);
  v21 = img4_runtime_execute_object();
  if (!v21)
  {
    v22 = *(const char **)(v5 + 16);
    v23 = *__error();
    v24 = *(NSObject **)(v5 + 32);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = "[anonymous]";
      if (v22)
        v25 = v22;
      v26 = **v20;
      *(_DWORD *)buf = 136446466;
      v35 = v25;
      v36 = 2080;
      v37 = v26;
      _os_log_impl(&dword_2126F8000, v24, OS_LOG_TYPE_DEBUG, "%{public}s: executed object: %s", buf, 0x16u);
    }
    *__error() = v23;
    goto LABEL_24;
  }
  v28 = v21;
  if (*(_QWORD *)(v5 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(v5 + 32), OS_LOG_TYPE_ERROR);
    v29 = *(const char **)(v5 + 16);
    if (!v29)
      v29 = "[anonymous]";
    v30 = **v20;
    *(_DWORD *)buf = 136446722;
    v35 = v29;
    v36 = 2080;
    v37 = v30;
    v38 = 1024;
    v39 = v28;
  }
  else
  {
    v31 = *(const char **)(v5 + 16);
    if (!v31)
      v31 = "[anonymous]";
    v32 = **v20;
    *(_DWORD *)buf = 136446722;
    v35 = v31;
    v36 = 2080;
    v37 = v32;
    v38 = 1024;
    v39 = v21;
  }
  v10 = (char *)_os_log_send_and_compose_impl();
  v13 = v28;
  v11 = "com.apple.security.cryptex.posix";
  v12 = 319;
LABEL_37:
  v14 = 0;
LABEL_38:
  Error = createError("_cryptex_signing_service_trust_continue", "signing_service.c", v12, v11, v13, v14, v10);
  free(v10);
LABEL_39:
  a4[2] = (uint64_t)Error;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v5 + 280));
}

uint64_t _cryptex_signing_service_populate_ap_board_chip_sdom_cpro()
{
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();
  cryptex_tss_set_u32();
  return cryptex_tss_set_BOOL();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_2_0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

double OUTLINED_FUNCTION_3_0(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_5()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return _os_crash_msg();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return _os_crash_msg();
}

uint64_t _hdi_copy_device_nodes(NSObject *a1, io_object_t object, const char **a3, _QWORD *a4, _QWORD *a5)
{
  io_registry_entry_t v8;
  const char *v10;
  const __CFAllocator *v11;
  CFTypeRef CFProperty;
  CFTypeRef v13;
  CFTypeID v14;
  int v15;
  int *v16;
  const void **v17;
  const void *v18;
  const __CFString *v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeID v22;
  const void *v23;
  int v24;
  _BOOL4 v25;
  io_registry_entry_t v26;
  kern_return_t ParentEntry;
  kern_return_t v28;
  int v29;
  char v30;
  uint64_t v31;
  CFTypeRef v32;
  CFTypeRef v33;
  CFTypeID v34;
  CFTypeRef v35;
  const void *v36;
  const __CFString *v37;
  _QWORD *v38;
  int v39;
  int v40;
  const char *v42;
  CFTypeRef v43;
  const char **v44;
  _QWORD *v45;
  const __CFAllocator *v46;
  CFTypeRef v47;
  io_object_t objecta;
  io_registry_entry_t entry;
  uint64_t v50;
  uint8_t buf[80];
  uint64_t v52;

  v8 = object;
  v52 = *MEMORY[0x24BDAC8D0];
  if (IOObjectRetain(object))
    _hdi_copy_device_nodes_cold_5(&v50, buf);
  entry = v8;
  if (IOObjectRetain(v8))
    _hdi_copy_device_nodes_cold_5(&v50, buf);
  objecta = v8;
  if (_IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSContainerScheme")
    || _IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSMedia"))
  {
    v10 = "hfs";
  }
  else
  {
    v10 = "hfs";
    if (!_IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSContainer")
      && !_IORegistryExchangeWithFirstChildOfClass(&objecta, "AppleAPFSVolume"))
    {
      v10 = "apfs";
      v8 = objecta;
    }
  }
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = IORegistryEntryCreateCFProperty(v8, CFSTR("BSD Name"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty || (v13 = CFProperty, v14 = CFGetTypeID(CFProperty), v14 != CFStringGetTypeID()))
    _hdi_copy_device_nodes_cold_1();
  v42 = v10;
  v44 = a3;
  v45 = a5;
  v15 = *__error();
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_2126F8000, a1, OS_LOG_TYPE_DEBUG, "subdevice node = %@", buf, 0xCu);
  }
  v43 = v13;
  v16 = __error();
  v47 = 0;
  v17 = (const void **)MEMORY[0x24BDBD270];
  *v16 = v15;
  v18 = *v17;
  v19 = CFSTR("Whole");
  v46 = v11;
  do
  {
    v20 = IORegistryEntryCreateCFProperty(entry, v19, v11, 0);
    v21 = v20;
    if (v20)
    {
      v22 = CFGetTypeID(v20);
      if (v22 == CFBooleanGetTypeID())
        v23 = v21;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v24 = *__error();
    v25 = os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG);
    if (v23 == v18)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2126F8000, a1, OS_LOG_TYPE_DEBUG, "found whole disk node", buf, 2u);
      }
      *__error() = v24;
      v32 = IORegistryEntryCreateCFProperty(entry, CFSTR("BSD Name"), v11, 0);
      if (v32)
      {
        v33 = v32;
        v34 = CFGetTypeID(v32);
        if (v34 == CFStringGetTypeID())
          v35 = v33;
        else
          v35 = 0;
        if (!a4)
LABEL_57:
          _hdi_copy_device_nodes_cold_2();
      }
      else
      {
        v35 = 0;
        if (!a4)
          goto LABEL_57;
      }
      v40 = *__error();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v35;
        _os_log_impl(&dword_2126F8000, a1, OS_LOG_TYPE_DEBUG, "devnode = %@", buf, 0xCu);
      }
      v47 = v35;
      v30 = 0;
      v31 = 0;
      *__error() = v40;
      v26 = entry;
    }
    else
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2126F8000, a1, OS_LOG_TYPE_DEBUG, "not whole disk node", buf, 2u);
      }
      *__error() = v24;
      v26 = entry;
      ParentEntry = IORegistryEntryGetParentEntry(entry, "IOService", &entry);
      if (ParentEntry)
      {
        v28 = ParentEntry;
        if (ParentEntry == -536870208)
        {
          v29 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2126F8000, a1, OS_LOG_TYPE_DEBUG, "found root node, stopping", buf, 2u);
          }
          v30 = 0;
          *__error() = v29;
          v31 = 2;
        }
        else
        {
          v36 = v18;
          v37 = v19;
          v38 = a4;
          v39 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v28;
            _os_log_impl(&dword_2126F8000, a1, OS_LOG_TYPE_ERROR, "IORegistryEntryGetParentEntry: %{mach.errno}x", buf, 8u);
          }
          v30 = 0;
          *__error() = v39;
          v31 = 83;
          a4 = v38;
          v19 = v37;
          v18 = v36;
          v11 = v46;
        }
      }
      else
      {
        v31 = 35;
        v30 = 1;
      }
    }
    if (v21)
      CFRelease(v21);
    if (v26 && IOObjectRelease(v26))
      _hdi_copy_device_nodes_cold_3(&v50, buf);
  }
  while ((v30 & 1) != 0);
  if (v23 == v18)
  {
    if (v44)
      *v44 = v42;
    *a4 = v47;
    *v45 = v43;
  }
  if (objecta && IOObjectRelease(objecta))
    _hdi_copy_device_nodes_cold_3(&v50, buf);
  return v31;
}

uint64_t hdi_copy_mounted(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  unsigned int v6;
  unsigned int v7;
  size_t v8;
  statfs *v9;
  statfs *v10;
  uint64_t v11;
  int v12;
  int *v13;
  char *v14;
  char *v15;
  IONotificationPortRef v16;
  IONotificationPort *v17;
  const __CFDictionary *v18;
  kern_return_t v19;
  kern_return_t v20;
  int v21;
  io_registry_entry_t v22;
  io_object_t v23;
  const __CFString *v24;
  int v25;
  int v26;
  CFTypeRef v27;
  size_t v28;
  const char *f_mntfromname;
  char *v31;
  int v32;
  NSObject *v33;
  unsigned int v34;
  _QWORD *v35;
  uint64_t v36;
  CFTypeRef cf;
  CFTypeRef v38;
  io_iterator_t notification;
  _OWORD v40[16];
  char v41[256];
  _QWORD v42[32];
  uint8_t buf[4];
  CFTypeRef v44;
  __int16 v45;
  CFTypeRef v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  notification = 0;
  v6 = getfsstat(0, 0, 2);
  if ((v6 & 0x80000000) != 0)
  {
    v11 = *__error();
    v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl(&dword_2126F8000, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    v13 = __error();
    v9 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  v8 = v6;
  if (_dispatch_is_multithreaded())
  {
    v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
    if (!v9)
    {
      do
      {
        __os_temporary_resource_shortage();
        v10 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
      }
      while (!v10);
      v9 = v10;
    }
  }
  else
  {
    v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x61D5536CuLL);
    if (!v9)
      hdi_copy_mounted_cold_8(v42, buf);
  }
  if (getfsstat(v9, 2168 * v7, 2) < 0)
  {
    v11 = *__error();
    v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl(&dword_2126F8000, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    v13 = __error();
LABEL_18:
    *v13 = v12;
    goto LABEL_61;
  }
  if (_dispatch_is_multithreaded())
  {
    v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
    if (!v14)
    {
      do
      {
        __os_temporary_resource_shortage();
        v15 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
      }
      while (!v15);
      v14 = v15;
    }
  }
  else
  {
    v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x61D5536CuLL);
    if (!v14)
      hdi_copy_mounted_cold_7(v42, buf);
  }
  v16 = IONotificationPortCreate(0);
  if (!v16)
    hdi_copy_mounted_cold_2();
  v17 = v16;
  v18 = IOServiceMatching("IOMedia");
  v19 = IOServiceAddMatchingNotification(v17, "IOServiceMatched", v18, 0, 0, &notification);
  if (!v19)
  {
    v35 = a1;
    v34 = v7;
    v36 = 0;
    while (1)
    {
      v22 = IOIteratorNext(notification);
      if (!v22)
      {
        v11 = 0;
        *v35 = v14;
        *a2 = v36;
        goto LABEL_60;
      }
      v23 = v22;
      cf = 0;
      v38 = 0;
      memset(v42, 0, 255);
      memset(v41, 0, 255);
      memset(v40, 0, 255);
      v24 = (const __CFString *)IORegistryEntrySearchCFProperty(v22, "IOService", CFSTR("hdik-unique-identifier"), 0, 3u);
      if (!v24
        || IOObjectConformsTo(v23, "AppleAPFSVolume")
        || IOObjectConformsTo(v23, "AppleAPFSMedia")
        || IOObjectConformsTo(v23, "AppleAPFSContainerScheme")
        || IOObjectConformsTo(v23, "AppleAPFSContainer"))
      {
        goto LABEL_38;
      }
      v25 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v24;
        _os_log_impl(&dword_2126F8000, a3, OS_LOG_TYPE_DEBUG, "found property: %@", buf, 0xCu);
      }
      *__error() = v25;
      v26 = _hdi_copy_device_nodes(a3, v23, 0, &v38, &cf);
      v32 = *__error();
      if (v26)
        break;
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v38;
        v45 = 2112;
        v46 = cf;
        _os_log_impl(&dword_2126F8000, a3, OS_LOG_TYPE_DEBUG, "found dev nodes: dev = %@, sub = %@", buf, 0x16u);
      }
      *__error() = v32;
      if (!_CFStringGetUTF8String(v24, (char *)v42, 255))
        hdi_copy_mounted_cold_4();
      if (!_CFStringGetUTF8String((const __CFString *)v38, v41, 255))
        hdi_copy_mounted_cold_4();
      v27 = cf;
      if (!_CFStringGetUTF8String((const __CFString *)cf, (char *)v40, 255))
        hdi_copy_mounted_cold_4();
      if (v34)
      {
        v33 = a3;
        v28 = v8;
        f_mntfromname = v9->f_mntfromname;
        while (1)
        {
          bzero(buf, 0x400uLL);
          snprintf((char *)buf, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
          if (!strcmp(f_mntfromname, (const char *)buf))
            break;
          f_mntfromname += 2168;
          if (!--v28)
          {
            a3 = v33;
            goto LABEL_38;
          }
        }
        a3 = v33;
        v31 = &v14[3582 * v36];
        __strlcpy_chk();
        snprintf(v31 + 510, 0x400uLL, "%s%s", "/dev/", v41);
        snprintf(v31 + 1534, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
        strlcpy(v31 + 2558, f_mntfromname - 1024, 0x400uLL);
        ++v36;
        goto LABEL_38;
      }
LABEL_39:
      if (v27)
        CFRelease(v27);
      if (v38)
        CFRelease(v38);
      if (v24)
        CFRelease(v24);
      if (IOObjectRelease(v23))
        _hdi_copy_device_nodes_cold_3(v42, buf);
    }
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v26;
      _os_log_impl(&dword_2126F8000, a3, OS_LOG_TYPE_ERROR, "failed to get device nodes: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v32;
LABEL_38:
    v27 = cf;
    goto LABEL_39;
  }
  v20 = v19;
  *__error() = 83;
  v21 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = v20;
    _os_log_impl(&dword_2126F8000, a3, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification: %{mach.errno}x", buf, 8u);
  }
  *__error() = v21;
  v11 = 0xFFFFFFFFLL;
LABEL_60:
  IONotificationPortDestroy(v17);
LABEL_61:
  if (notification && IOObjectRelease(notification))
    _hdi_copy_device_nodes_cold_3(v42, buf);
  free(v9);
  return v11;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return _os_log_send_and_compose_impl();
}

void sub_21270109C(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

uint64_t cryptex_event_mask_ext_to_int(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v18[0] = &unk_24CE0D138;
  v18[1] = &unk_24CE0D150;
  v19[0] = &unk_24CE0D138;
  v19[1] = &unk_24CE0D150;
  v18[2] = &unk_24CE0D168;
  v18[3] = &unk_24CE0D180;
  v19[2] = &unk_24CE0D168;
  v19[3] = &unk_24CE0D180;
  v18[4] = &unk_24CE0D198;
  v19[4] = &unk_24CE0D198;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "unsignedLongLongValue") & a1) != 0)
        {
          v16[0] = &unk_24CE0D138;
          v16[1] = &unk_24CE0D150;
          v17[0] = &unk_24CE0D138;
          v17[1] = &unk_24CE0D150;
          v16[2] = &unk_24CE0D168;
          v16[3] = &unk_24CE0D180;
          v17[2] = &unk_24CE0D168;
          v17[3] = &unk_24CE0D180;
          v16[4] = &unk_24CE0D198;
          v17[4] = &unk_24CE0D198;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v4 |= objc_msgSend(v9, "unsignedLongLongValue");

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_2127019E4(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

uint64_t cryptex_event_type_int_to_ext(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  _OWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v11[0] = &unk_24CE0D138;
  v11[1] = &unk_24CE0D150;
  v12[0] = &unk_24CE0D138;
  v12[1] = &unk_24CE0D150;
  v11[2] = &unk_24CE0D168;
  v11[3] = &unk_24CE0D180;
  v12[2] = &unk_24CE0D168;
  v12[3] = &unk_24CE0D180;
  v11[4] = &unk_24CE0D198;
  v12[4] = &unk_24CE0D198;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeysForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    cryptex_event_type_int_to_ext_cold_1(&v9, v10);
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedLongLongValue");
  else
    v7 = 0;

  return v7;
}

CryptexEventSubscriber *cryptex_event_subscribe_with_name(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, CFErrorRef *a6)
{
  id v11;
  id v12;
  CryptexEventSubscriber *v13;
  void *v14;
  CryptexEventSubscriber *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  char *v20;
  CFErrorRef Error;
  void *v22;
  NSObject *v23;
  CFErrorRef v24;
  _BOOL4 v25;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  if (!a1)
  {
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    LOWORD(v28) = 0;
    v20 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_event_subscribe_with_name", "event.m", 275, "com.apple.security.cryptex", 3, 0, v20);
LABEL_16:
    v24 = Error;
    free(v20);
    v15 = 0;
LABEL_17:
    v25 = v24 != 0;
    if (!a6)
      goto LABEL_20;
    goto LABEL_18;
  }
  v13 = [CryptexEventSubscriber alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CryptexEventSubscriber initWithFlags:name:](v13, "initWithFlags:name:", a3, v14);

  if (!v15)
  {
    objc_msgSend(0, "log");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(0, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      LOWORD(v28) = 0;
      v20 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(v28) = 0;
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_event_subscribe_with_name", "event.m", 283, "com.apple.security.cryptex", 3, 0, v20);
    goto LABEL_16;
  }
  -[CryptexEventSubscriber registerForEvents:onQueue:withCompletion:](v15, "registerForEvents:onQueue:withCompletion:", a2, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v24 = 0;
    goto LABEL_17;
  }
  -[CryptexEventSubscriber log](v15, "log");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CryptexEventSubscriber log](v15, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    v28 = 136315650;
    v29 = a1;
    v30 = 2048;
    v31 = a2;
    v32 = 2112;
    v33 = v16;
    LODWORD(v27) = 32;
    v19 = (char *)_os_log_send_and_compose_impl();

  }
  else
  {
    v28 = 136315650;
    v29 = a1;
    v30 = 2048;
    v31 = a2;
    v32 = 2112;
    v33 = v16;
    LODWORD(v27) = 32;
    v19 = (char *)_os_log_send_and_compose_impl();
  }
  v24 = createError("cryptex_event_subscribe_with_name", "event.m", 293, "com.apple.security.cryptex", 3, v16, v19);
  free(v19);

  if (v24)
  {
    -[CryptexEventSubscriber cancel](v15, "cancel", &v28, v27);

    v15 = 0;
    v25 = 1;
    if (a6)
    {
LABEL_18:
      if (v25)
      {
        v24 = v24;
        *a6 = v24;
      }
    }
  }
LABEL_20:

  return v15;
}

void sub_2127021A8(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

uint64_t cryptex_msm_get_string(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))((char *)sub_2127021F8 + 4 * byte_21271ED70[a2]))();
}

uint64_t sub_2127021F8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t cryptex_msm_get_int(uint64_t a1)
{
  return *(int *)(a1 + 40);
}

void cryptex_msm_destroy(void ***a1)
{
  void **v1;

  v1 = *a1;
  if (*a1)
  {
    free(*v1);
    free(v1[1]);
    free(v1[2]);
    free(v1[3]);
    free(v1[4]);
    free(v1);
    *a1 = 0;
  }
}

void cryptex_msm_array_destroy(void ***a1, uint64_t a2)
{
  uint64_t v3;
  void ***v4;
  void **v5;
  void **v6;

  if (a2)
  {
    v3 = a2;
    v4 = a1;
    do
    {
      v5 = *v4++;
      v6 = v5;
      cryptex_msm_destroy(&v6);
      --v3;
    }
    while (v3);
  }
  free(a1);
}

uint64_t cryptex_install_4MSM(_DWORD *a1, char a2, char ***a3)
{
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  char v10[3600];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2 & 1;
  v6 = (_QWORD *)cryptex_attr_create();
  cryptex_attr_set_persistence(v6, 2 * v5);
  cryptex_attr_set_nonce_persistence(v6, v5);
  bzero(v10, 0xE10uLL);
  if ((*a1 & 0x80000000) != 0 || (a1[1] & 0x80000000) != 0)
  {
    v7 = 0;
    v8 = 22;
  }
  else
  {
    v7 = (void *)cryptex_core_create();
    cryptex_asset_new_borrowed();
    cryptex_core_set_asset();
    cryptex_asset_new_borrowed();
    cryptex_core_set_asset();
    if ((a1[2] & 0x80000000) == 0)
    {
      cryptex_asset_new_borrowed();
      cryptex_core_set_asset();
    }
    if ((a1[3] & 0x80000000) == 0)
    {
      cryptex_asset_new_borrowed();
      cryptex_core_set_asset();
    }
    v8 = _cryptex_install_core((uint64_t)v7, (uint64_t)v6);
    if (!(_DWORD)v8)
      *a3 = _cryptex_msm_new_from_info(v10);
  }
  if (v6)
    os_release(v6);
  if (v7)
    os_release(v7);
  return v8;
}

char **_cryptex_msm_new_from_info(const char *a1)
{
  char **v2;
  char **v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  const char *v8;
  char *v9;
  uint64_t v11;
  __int128 v12[5];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (char **)malloc_type_calloc(1uLL, 0x30uLL, 0x61D5536CuLL);
  if (!v2)
    _cryptex_msm_new_from_info_cold_1(&v11, v12);
  v3 = v2;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v4 = strdup(a1 + 8);
      if (v4)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v4 = strdup(a1 + 8);
    if (!v4)
      _cryptex_msm_new_from_info_cold_2(a1 + 8);
  }
  *v3 = v4;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v5 = strdup(a1 + 263);
      if (v5)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v5 = strdup(a1 + 263);
    if (!v5)
      _cryptex_msm_new_from_info_cold_2(a1 + 263);
  }
  v3[1] = v5;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v6 = strdup(a1 + 518);
      if (v6)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v6 = strdup(a1 + 518);
    if (!v6)
      _cryptex_msm_new_from_info_cold_2(a1 + 518);
  }
  v3[2] = v6;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v7 = strdup(a1 + 1542);
      if (v7)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v7 = strdup(a1 + 1542);
    if (!v7)
      _cryptex_msm_new_from_info_cold_2(a1 + 1542);
  }
  v3[3] = v7;
  v8 = a1 + 2566;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v9 = strdup(v8);
      if (v9)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v9 = strdup(v8);
    if (!v9)
      _cryptex_msm_new_from_info_cold_2(v8);
  }
  v3[4] = v9;
  return v3;
}

uint64_t cryptex_uninstall_4MSM()
{
  return _cryptex_uninstall_by_name();
}

uint64_t cryptex_copy_list_4MSM(uint64_t a1, _QWORD *a2, size_t *a3)
{
  _QWORD *v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;
  size_t v10;
  _QWORD *v11;
  _QWORD *v12;
  size_t v13;
  uint64_t v14;
  size_t j;
  uint64_t v16;
  size_t i;
  size_t v19;
  void *v20;
  size_t v21;
  void *v22;
  uint64_t v23;
  _OWORD v24[5];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v20 = 0;
  v5 = _cryptex_copy_connected_actor(_g, MEMORY[0x24BEDBC90]);
  if (_cryptex_copy_list(&v20, &v19))
  {
    v21 = 0;
    v22 = 0;
    v6 = _cryptex_copy_list_lossy(&v22, &v21);
    if (!(_DWORD)v6)
    {
      v7 = v21;
      if (_dispatch_is_multithreaded())
      {
        v8 = malloc_type_calloc(v7, 8uLL, 0x1B044E25uLL);
        if (!v8)
        {
          do
          {
            __os_temporary_resource_shortage();
            v9 = malloc_type_calloc(v7, 8uLL, 0x1B044E25uLL);
          }
          while (!v9);
          v8 = v9;
        }
      }
      else
      {
        v8 = malloc_type_calloc(v7, 8uLL, 0x61D5536CuLL);
        if (!v8)
          cryptex_copy_list_4MSM_cold_1(&v23, v24);
      }
      if (v21)
      {
        v16 = 0;
        for (i = 0; i < v21; ++i)
        {
          v8[i] = _cryptex_msm_new_from_info((const char *)v22 + v16);
          v16 += 3600;
        }
      }
      free(v22);
      v6 = 0;
      *a3 = v21;
      *a2 = v8;
    }
  }
  else
  {
    v10 = v19;
    if (_dispatch_is_multithreaded())
    {
      v11 = malloc_type_calloc(v10, 8uLL, 0x1B044E25uLL);
      if (!v11)
      {
        do
        {
          __os_temporary_resource_shortage();
          v12 = malloc_type_calloc(v10, 8uLL, 0x1B044E25uLL);
        }
        while (!v12);
        v11 = v12;
      }
    }
    else
    {
      v11 = malloc_type_calloc(v10, 8uLL, 0x61D5536CuLL);
      if (!v11)
        cryptex_copy_list_4MSM_cold_1(&v23, v24);
    }
    v13 = v19;
    if (v19)
    {
      v14 = 0;
      for (j = 0; j < v19; ++j)
      {
        v11[j] = _cryptex_msm_new_from_info((const char *)v20 + v14);
        v13 = v19;
        v14 += 3600;
      }
    }
    v6 = 0;
    *a2 = v11;
    *a3 = v13;
  }
  free(v20);
  if (v5)
    os_release(v5);
  return v6;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_5_0()
{
  _QWORD *v0;
  _OWORD *v1;
  double result;

  *v0 = 0;
  result = 0.0;
  *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  return result;
}

size_t OUTLINED_FUNCTION_7_0(const char *__s)
{
  return strlen(__s);
}

double OUTLINED_FUNCTION_10(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t session_create_from_core(uint64_t a1)
{
  uint64_t v2;

  v2 = _session_alloc();
  object_proto_init(v2 + 16, (int)"com.apple.security.libcryptex", "cryptex.session");
  *(_QWORD *)(v2 + 88) = dispatch_queue_create("com.apple.security.libcryptex.session_handler", 0);
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 40) = a1;
  *(_DWORD *)(v2 + 104) = 0;
  return v2;
}

uint64_t daemon_for_session_subsystem(_DWORD *a1)
{
  uint64_t actor;
  int v3;

  actor = cryptex_subsystem_create_actor();
  v3 = cryptex_actor_connect();
  *a1 = v3;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      daemon_for_session_subsystem_cold_1();
    return 0;
  }
  return actor;
}

void session_activate_endpoint(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  _QWORD handler[5];

  v2 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(*(_QWORD *)(a1 + 40) + 88));
  v3 = MEMORY[0x24BDAC760];
  *(_QWORD *)(a1 + 80) = v2;
  handler[0] = v3;
  handler[1] = 0x40000000;
  handler[2] = __session_activate_endpoint_block_invoke;
  handler[3] = &__block_descriptor_tmp_10;
  handler[4] = a1;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 80), *(dispatch_queue_t *)(a1 + 88));
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 80));
}

void __session_activate_endpoint_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *string;
  xpc_object_t value;
  int64_t int64;
  uint64_t uint64;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x212BF18F8](a2);
  if (v4 == MEMORY[0x24BDACFA0])
  {
    value = xpc_dictionary_get_value(a2, "object");
    int64 = xpc_dictionary_get_int64(a2, "event");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = xpc_dictionary_get_int64(a2, "reason");
    uint64 = xpc_dictionary_get_uint64(a2, "code");
    v10 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v10 + 72) = uint64;
    if (int64 == 32)
    {
      v11 = xpc_dictionary_get_int64(a2, "error_event");
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)(v10 + 104) = v11;
    }
    if (value)
    {
      v12 = cryptex_session_core_create_from_xpc();
      v10 = *(_QWORD *)(a1 + 32);
      if (v12)
      {
        v13 = (void *)v12;
        if (*(_QWORD *)(v10 + 40))
          cryptex_session_core_merge();
        os_release(v13);
        v10 = *(_QWORD *)(a1 + 32);
      }
    }
    v14 = *(_QWORD *)(v10 + 48);
    if (v14)
    {
      v15 = *(_QWORD *)(v10 + 56);
      if (v15 == 64 || (v15 & int64) >= 1)
      {
        v17 = *(NSObject **)(v10 + 96);
        if (v17)
        {
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 0x40000000;
          v18[2] = __session_activate_endpoint_block_invoke_2;
          v18[3] = &__block_descriptor_tmp;
          v18[4] = v10;
          v18[5] = int64;
          dispatch_sync(v17, v18);
        }
        else
        {
          (*(void (**)(uint64_t, int64_t))(v14 + 16))(v14, int64);
        }
      }
    }
  }
  else if (v4 == MEMORY[0x24BDACFB8] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    *(_DWORD *)buf = 134218242;
    v20 = v5;
    v21 = 2080;
    v22 = string;
    _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection %p error: %s", buf, 0x16u);
  }
}

uint64_t __session_activate_endpoint_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
}

char *_CFStringCopyUTF8String(const __CFString *a1)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  CFIndex v4;
  char *v5;
  char *v6;
  int CString;
  char *v8;

  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding <= -2)
    _CFStringCopyUTF8String_cold_1();
  v4 = MaximumSizeForEncoding + 1;
  v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeForEncoding + 1, 0x7906B74DuLL);
  if (v5)
  {
    v6 = v5;
    CString = CFStringGetCString(a1, v5, v4, 0x8000100u);
    if (CString)
      v8 = v6;
    else
      v8 = 0;
    if (CString)
      v5 = 0;
    else
      v5 = v6;
  }
  else
  {
    v8 = 0;
  }
  free(v5);
  return v8;
}

CFStringRef _CFStringCreateFromUTF8String(char *cStr)
{
  return CFStringCreateWithCString(0, cStr, 0x8000100u);
}

char *_CFStringGetUTF8String(const __CFString *a1, char *a2, CFIndex a3)
{
  if (a3 < 0)
    _CFStringGetUTF8String_cold_1();
  if (CFStringGetCString(a1, a2, a3, 0x8000100u))
    return a2;
  else
    return 0;
}

CFMutableDictionaryRef _CFDictionaryCreateMutableForCFTypes()
{
  CFMutableDictionaryRef result;
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  result = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!result)
    _CFDictionaryCreateMutableForCFTypes_cold_1(&v1, v2);
  return result;
}

CFErrorRef createError(const char *a1, const char *a2, int a3, const char *a4, CFIndex a5, const void *a6, char *cStr)
{
  CFStringRef v12;
  CFStringRef v13;
  const __CFString *v14;
  CFStringRef v15;
  CFNumberRef v16;
  __CFDictionary *MutableForCFTypes;
  CFErrorRef v18;
  int valuePtr;

  valuePtr = a3;
  v12 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  v14 = CFStringCreateWithCString(0, a4, 0x8000100u);
  v15 = CFStringCreateWithCString(0, a2, 0x8000100u);
  v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  MutableForCFTypes = _CFDictionaryCreateMutableForCFTypes();
  CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x24BDBD3A0], v12);
  if (os_variant_allows_internal_security_policies())
  {
    CFDictionarySetValue(MutableForCFTypes, CFSTR("FunctionName"), v13);
    CFDictionarySetValue(MutableForCFTypes, CFSTR("FileName"), v15);
    CFDictionarySetValue(MutableForCFTypes, CFSTR("LineNumber"), v16);
  }
  if (a6)
    CFDictionarySetValue(MutableForCFTypes, (const void *)*MEMORY[0x24BDBD3B0], a6);
  v18 = CFErrorCreate(0, v14, a5, MutableForCFTypes);
  CFRelease(MutableForCFTypes);
  CFRelease(v12);
  CFRelease(v13);
  CFRelease(v14);
  CFRelease(v15);
  CFRelease(v16);
  return v18;
}

CFIndex _CFErrorGetTopLevelPosixError(CFIndex result)
{
  __CFError *v1;
  CFTypeID v2;
  const void *v3;
  __CFError *Value;
  CFErrorDomain Domain;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CFErrorDomain v8;
  CFErrorDomain v9;
  unsigned int Code;

  if (result)
  {
    v1 = (__CFError *)result;
    v2 = CFGetTypeID((CFTypeRef)result);
    if (v2 != CFErrorGetTypeID())
      return 0xFFFFFFFFLL;
    v3 = (const void *)*MEMORY[0x24BDBD3B0];
    Value = v1;
    while (1)
    {
      Domain = CFErrorGetDomain(Value);
      if (CFEqual(Domain, CFSTR("com.apple.security.cryptex.posix")))
        break;
      v6 = CFErrorCopyUserInfo(Value);
      if (!v6)
        break;
      v7 = v6;
      Value = (__CFError *)CFDictionaryGetValue(v6, v3);
      CFRelease(v7);
      if (!Value)
        goto LABEL_10;
    }
    v8 = CFErrorGetDomain(Value);
    if (CFEqual(v8, CFSTR("com.apple.security.cryptex.posix")))
      return CFErrorGetCode(Value);
LABEL_10:
    v9 = CFErrorGetDomain(v1);
    if (CFEqual(v9, CFSTR("com.apple.security.cryptex")) && (Code = CFErrorGetCode(v1), Code <= 0x24))
      return dword_21271ED80[Code];
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

CFDictionaryRef _CFErrorHasDomainAndCode(CFDictionaryRef result, const void *a2, uint64_t a3)
{
  __CFError *Value;
  CFTypeID v6;
  CFTypeID TypeID;
  const void *v8;
  CFErrorDomain Domain;
  const void *v10;

  if (result)
  {
    Value = result;
    v6 = CFGetTypeID(result);
    TypeID = CFErrorGetTypeID();
    result = 0;
    if (a2)
    {
      if (v6 == TypeID)
      {
        v8 = (const void *)*MEMORY[0x24BDBD3B0];
        while (1)
        {
          Domain = CFErrorGetDomain(Value);
          if (CFEqual(Domain, a2))
          {
            if (CFErrorGetCode(Value) == a3)
              break;
          }
          result = CFErrorCopyUserInfo(Value);
          if (!result)
            return result;
          v10 = result;
          Value = (__CFError *)CFDictionaryGetValue(result, v8);
          CFRelease(v10);
          if (!Value)
            return 0;
        }
        return (CFDictionaryRef)1;
      }
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1_3(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t _cryptex_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_alloc_cold_1();
  return result;
}

uint64_t _cryptex_attr_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_attr_alloc_cold_1();
  return result;
}

uint64_t _cryptex_bundle_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_bundle_alloc_cold_1();
  return result;
}

uint64_t _cryptex_su_preboot_bundle_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_su_preboot_bundle_alloc_cold_1();
  return result;
}

uint64_t _cryptex_signing_service_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_signing_service_alloc_cold_1();
  return result;
}

uint64_t _session_alloc()
{
  uint64_t result;

  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _session_alloc_cold_1();
  return result;
}

void _cryptex_set_actor(_QWORD **a1)
{
  uint64_t v2;
  id v3;

  v2 = _g + 24 * *a1[6];
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
  v3 = *(id *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  if (v3)

}

void sub_2127036A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a10)

  _Unwind_Resume(exception_object);
}

_QWORD *_cryptex_copy_connected_actor(uint64_t a1, _QWORD *a2)
{
  os_unfair_lock_s *v4;
  _QWORD *v5;

  v4 = (os_unfair_lock_s *)(a1 + 24 * *a2 + 16);
  os_unfair_lock_lock(v4);
  v5 = _cryptex_copy_connected_actor_locked(a1, a2);
  os_unfair_lock_unlock(v4);
  return v5;
}

_QWORD *_cryptex_copy_connected_actor_locked(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *actor;
  _QWORD *v4;
  _QWORD *v5;
  int v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  const char *v17;
  uint64_t v18;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 24 * *a2;
  v5 = *(_QWORD **)(v2 + 24);
  v4 = (_QWORD *)(v2 + 24);
  actor = v5;
  if (!v5)
  {
    actor = (_QWORD *)cryptex_subsystem_create_actor();
    *v4 = actor;
    v7 = cryptex_actor_connect();
    v8 = (const char *)actor[2];
    v9 = *__error();
    v10 = actor[4];
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = "[anonymous]";
        v12 = a2[2];
        if (v8)
          v11 = v8;
        v20 = 136446722;
        v21 = v11;
        v22 = 2080;
        v23 = v12;
        v24 = 1024;
        v25 = v7;
        v13 = "%{public}s: connect: %s: %{darwin.errno}d";
        v14 = v10;
        v15 = OS_LOG_TYPE_ERROR;
        v16 = 28;
LABEL_11:
        _os_log_impl(&dword_2126F8000, v14, v15, v13, (uint8_t *)&v20, v16);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = "[anonymous]";
      v18 = a2[2];
      if (v8)
        v17 = v8;
      v20 = 136446466;
      v21 = v17;
      v22 = 2080;
      v23 = v18;
      v13 = "%{public}s: connect: %s: success";
      v14 = v10;
      v15 = OS_LOG_TYPE_DEBUG;
      v16 = 22;
      goto LABEL_11;
    }
    *__error() = v9;
  }
  return actor;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2_2(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void _cryptex_bundle_dealloc(_QWORD *a1)
{
  void *v2;
  void **v3;
  void **v4;
  void **v5;
  void **v6;
  void **v7;
  void ***v8;
  void **v9;
  void ***v10;
  void **v11;
  void **v12;
  void **v13;
  void **v14;

  close_drop_optional_np();
  close_drop_optional_np();
  v2 = (void *)a1[10];
  if (v2)
    os_release(v2);
  v3 = (void **)a1[8];
  v14 = v3;
  if (v3)
  {
    do
    {
      v4 = (void **)a1[8];
      v5 = (void **)(a1 + 8);
      while (v4 != v3)
      {
        v5 = v4;
        v4 = (void **)*v4;
      }
      v6 = (void **)*v3;
      *v5 = *v3;
      *v3 = (void *)-1;
      _cryptex_list_elm_destroy(&v14);
      v14 = v6;
      v3 = v6;
    }
    while (v6);
  }
  v8 = (void ***)(a1 + 9);
  v7 = (void **)a1[9];
  v13 = v7;
  if (v7)
  {
    do
    {
      v9 = *v8;
      v10 = (void ***)(a1 + 9);
      if (*v8 != v7)
      {
        do
        {
          v11 = v9;
          v9 = (void **)v9[2];
        }
        while (v9 != v7);
        v10 = (void ***)(v11 + 2);
      }
      v12 = (void **)v7[2];
      *v10 = v12;
      v7[2] = (void *)-1;
      _cryptex_bundle_asset_destroy(&v13);
      v13 = v12;
      v7 = v12;
    }
    while (v12);
  }
  object_proto_destroy((uint64_t)(a1 + 2));
}

void _cryptex_list_elm_destroy(void ***a1)
{
  void **v1;

  v1 = *a1;
  if (*a1)
  {
    os_release(v1[1]);
    free(v1);
    *a1 = 0;
  }
}

void _cryptex_bundle_asset_destroy(void ***a1)
{
  void **v1;

  v1 = *a1;
  if (*a1)
  {
    cryptex_asset_destroy();
    free(*v1);
    free(v1[1]);
    free(v1);
    *a1 = 0;
  }
}

uint64_t _cryptex_bundle_new_asset_from_object(int a1, uint64_t a2, void *a3, uint64_t *a4)
{
  xpc_object_t v7;
  void *v8;
  const char *string_ptr;
  int v10;
  const char *v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = _xpc_plist_value_copy((uint64_t)&_path, a3);
  if (v7)
  {
    v8 = v7;
    string_ptr = xpc_string_get_string_ptr(v7);
    v10 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v11 = *(const char **)(a2 + 40);
      *(_DWORD *)buf = 136315394;
      v21 = v11;
      v22 = 2080;
      v23 = string_ptr;
      _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s => %s", buf, 0x16u);
    }
    *__error() = v10;
    v12 = openat(a1, string_ptr, 0);
    v18 = v12;
    if (v12 < 0)
    {
      v14 = v12;
      v13 = *__error();
      v16 = *__error();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v13;
        _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "openat: %{darwin.errno}d", buf, 8u);
      }
      *__error() = v16;
    }
    else
    {
      v13 = 0;
      *a4 = cryptex_asset_new();
      v14 = v18;
    }
    if (v14 != -1 && close(v14) == -1)
      _cryptex_bundle_new_asset_from_object_cold_1(&v19, buf);
    os_release(v8);
  }
  else
  {
    v15 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "Path";
      v22 = 1024;
      LODWORD(v23) = 212;
      _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "missing property: %s: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v15;
    return 212;
  }
  return v13;
}

_QWORD *_cryptex_list_find_cryptex_elm(_QWORD *a1, uint64_t a2, const char *a3, int a4)
{
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  _QWORD *v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  unint64_t v17;
  int v18;
  _BOOL4 v19;
  int v20;
  int v21;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v7 = v6[1];
      v8 = _cryptex_identity_copy_description(v7 + 56);
      v9 = *(const char **)(v7 + 16);
      v10 = *__error();
      v11 = *(NSObject **)(v7 + 32);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "[anonymous]";
        if (v9)
          v12 = v9;
        v26 = v12;
        v27 = 2080;
        v28 = v8;
        _os_log_impl(&dword_2126F8000, v11, OS_LOG_TYPE_DEBUG, "%{public}s: cryptex identity: %s", buf, 0x16u);
      }
      *__error() = v10;
      if (_cryptex_identity_matches_host(v7 + 56, a2))
      {
        if (a3)
        {
          if (!strcmp(a3, *(const char **)(v7 + 16)))
            goto LABEL_47;
        }
        else if ((*(_BYTE *)(v7 + 40) & 1) != 0)
        {
LABEL_47:
          free(v8);
          return v6;
        }
      }
      free(v8);
      v6 = (_QWORD *)*v6;
    }
    while (v6);
  }
  if (a4)
  {
    v13 = (_QWORD *)*a1;
    if (*a1)
    {
      v6 = 0;
      while (1)
      {
        v14 = v13[1];
        v15 = _cryptex_identity_matches_host(v14 + 56, a2);
        if (a3)
        {
          v16 = strcmp(a3, *(const char **)(v14 + 16)) == 0;
          if (a2)
            goto LABEL_19;
        }
        else
        {
          v16 = 0;
          if (a2)
          {
LABEL_19:
            if (*(_DWORD *)(v14 + 56))
            {
              v17 = *(_QWORD *)(v14 + 64);
              if ((v17 & 2) != 0)
                v18 = (v17 >> 2) & 1;
              else
                v18 = 0;
            }
            else
            {
              v18 = 0;
            }
            if (*(_DWORD *)a2)
              v19 = (*(_QWORD *)(a2 + 8) & 2) == 0 || (*(_QWORD *)(a2 + 8) & 4) == 0;
            else
              v19 = 1;
            if ((_cryptex_identity_matches_host(v14 + 56, a2)
               || ((v19 | v18 ^ 1) & 1) == 0
               && (*(_BYTE *)(v14 + 64) & 1) != 0
               && _cryptex_identity_equal_cryptex1((unsigned int *)a2, (unsigned int *)(v14 + 56))
               && _cryptex_identity_equal_cryptex1_chipid((unsigned int *)a2, (unsigned int *)(v14 + 56))
               || (v18 & 1) == 0 && (*(_BYTE *)(v14 + 64) & 1) != 0)
              && ((*(unsigned __int8 *)(v14 + 40) | v16) & 1) != 0)
            {
              v20 = *__error();
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "found a generic cryptex match", buf, 2u);
              }
              *__error() = v20;
              v21 = v15 || v16;
              if (!v6)
                v21 = 1;
              if (v21)
                v6 = v13;
            }
          }
        }
        v13 = (_QWORD *)*v13;
        if (!v13)
          return v6;
      }
    }
  }
  return 0;
}

BOOL _cryptex_identity_matches_host(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = _cryptex_identity_equal_device(a2, a1);
      if (result)
      {
        if (!*(_DWORD *)a2 || !*(_DWORD *)a1)
          return 1;
        if ((*(_BYTE *)(a2 + 8) & 2) != 0 && (*(_BYTE *)(a1 + 8) & 2) != 0)
        {
          result = _cryptex_identity_equal_cryptex1((unsigned int *)a2, (unsigned int *)a1);
          if (!result)
            return result;
          if (!*(_DWORD *)a2)
            return 1;
        }
        if (!*(_DWORD *)a1)
          return 1;
        if ((*(_BYTE *)(a2 + 8) & 4) == 0)
          return 1;
        if ((*(_BYTE *)(a1 + 8) & 4) == 0)
          return 1;
        result = _cryptex_identity_equal_cryptex1_chipid((unsigned int *)a2, (unsigned int *)a1);
        if (result)
          return 1;
      }
    }
  }
  return result;
}

char **_cryptex_bundle_asset_new(uint64_t a1, const char *a2, const char *a3)
{
  char **v5;
  char **v6;
  char *v7;
  char *v8;
  uint64_t v10;
  __int128 v11[5];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
  if (!v5)
    _cryptex_bundle_asset_new_cold_1(&v10, v11);
  v6 = v5;
  v5[3] = (char *)cryptex_asset_copy();
  *((_DWORD *)v6[3] + 4) = dup_np();
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v7 = strdup(a2);
      if (v7)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v7 = strdup(a2);
    if (!v7)
      _cryptex_bundle_asset_new_cold_2(a2);
  }
  *v6 = v7;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v8 = strdup(a3);
      if (v8)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v8 = strdup(a3);
    if (!v8)
      _cryptex_bundle_asset_new_cold_2(a3);
  }
  v6[1] = v8;
  return v6;
}

_QWORD *_cryptex_list_elm_new(void *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  __int128 v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = malloc_type_calloc(1uLL, 0x10uLL, 0x61D5536CuLL);
  if (!v2)
    _cryptex_list_elm_new_cold_1(&v5, v6);
  v3 = v2;
  v2[1] = os_retain(a1);
  return v3;
}

_QWORD *cryptex_bundle_create(uint64_t a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)_cryptex_bundle_alloc();
  v2[5] = a1;
  v2[6] = -1;
  v2[8] = 0;
  v2[9] = 0;
  object_proto_init((uint64_t)(v2 + 2), (int)"com.apple.security.libcryptex", "bundle");
  return v2;
}

_QWORD *cryptex_bundle_create_with_directory(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)_cryptex_bundle_alloc();
  v3[5] = a2;
  v3[6] = -1;
  v3[8] = 0;
  v3[9] = 0;
  object_proto_init((uint64_t)(v3 + 2), (int)"com.apple.security.libcryptex", "bundle");
  *((_DWORD *)v3 + 12) = claimfd_np();
  return v3;
}

uint64_t cryptex_bundle_copy_cryptex2(uint64_t a1, _OWORD *a2, const char *a3, void **a4, CFTypeRef *a5)
{
  void *v10;
  const char *v11;
  char *v12;
  __int128 v13;
  _QWORD *cryptex_elm;
  uint64_t v15;
  const char *v16;
  char *v17;
  CFErrorRef Error;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  _BYTE v24[32];
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = _cryptex_bundle_init(a1);
  if (v10)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v11 = *(const char **)(a1 + 16);
      if (!v11)
        v11 = "[anonymous]";
      *(_DWORD *)v24 = 136446210;
      *(_QWORD *)&v24[4] = v11;
    }
    else
    {
      v16 = *(const char **)(a1 + 16);
      if (!v16)
        v16 = "[anonymous]";
      *(_DWORD *)v24 = 136446210;
      *(_QWORD *)&v24[4] = v16;
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_copy_cryptex2", "bundle.c", 1332, "com.apple.security.cryptex", 6, v10, v17);
    v12 = 0;
  }
  else
  {
    v12 = _cryptex_identity_copy_description((uint64_t)a2);
    v13 = a2[1];
    *(_OWORD *)v24 = *a2;
    *(_OWORD *)&v24[16] = v13;
    v25 = a2[2];
    cryptex_elm = _cryptex_list_find_cryptex_elm((_QWORD *)(a1 + 64), (uint64_t)v24, a3, 1);
    if (cryptex_elm)
    {
      *a4 = os_retain((void *)cryptex_elm[1]);
      free(v12);
      return 1;
    }
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v20 = *(const char **)(a1 + 16);
      if (!v20)
        v20 = "[anonymous]";
      v21 = "default";
      *(_DWORD *)v24 = 136446722;
      *(_QWORD *)&v24[4] = v20;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = v12;
      if (a3)
        v21 = a3;
      *(_WORD *)&v24[22] = 2080;
      *(_QWORD *)&v24[24] = v21;
    }
    else
    {
      v22 = *(const char **)(a1 + 16);
      if (!v22)
        v22 = "[anonymous]";
      v23 = "default";
      *(_DWORD *)v24 = 136446722;
      *(_QWORD *)&v24[4] = v22;
      *(_WORD *)&v24[12] = 2080;
      if (a3)
        v23 = a3;
      *(_QWORD *)&v24[14] = v12;
      *(_WORD *)&v24[22] = 2080;
      *(_QWORD *)&v24[24] = v23;
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_copy_cryptex2", "bundle.c", 1345, "com.apple.security.cryptex", 8, 0, v17);
  }
  free(v17);
  if (a5 && Error)
  {
    *a5 = CFRetain(Error);
    free(v12);
  }
  else
  {
    free(v12);
    if (!Error)
    {
      v15 = 1;
      if (!v10)
        return v15;
      goto LABEL_17;
    }
  }
  CFRelease(Error);
  v15 = 0;
  if (v10)
LABEL_17:
    CFRelease(v10);
  return v15;
}

void *_cryptex_bundle_init(uint64_t a1)
{
  void *empty;
  int *v3;
  CFErrorRef v4;
  CFErrorRef Error;
  const char *v6;
  xpc_object_t v7;
  void *v8;
  CFErrorRef v9;
  _QWORD *v10;
  const char *v11;
  char *v12;
  int v13;
  _BOOL4 v14;
  int v15;
  const char *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  int file;
  int v21;
  const char *v22;
  const char *v23;
  char *v24;
  void *v25;
  void *v26;
  const char *v27;
  char *v28;
  const char *v29;
  xpc_object_t v30;
  void *v31;
  size_t v32;
  xpc_object_t v33;
  void *v34;
  int v35;
  int v36;
  const char *v37;
  const char *v38;
  char *v39;
  char *v40;
  xpc_object_t v41;
  uint64_t v42;
  xpc_object_t v43;
  const char *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  char *v51;
  char *v52;
  const char *v53;
  int v54;
  CFIndex v55;
  int v56;
  const char *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  int *v61;
  const char *v62;
  int v63;
  NSObject *v64;
  const char *v65;
  char *string_ptr;
  const char *v67;
  int v68;
  NSObject *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  xpc_object_t v73;
  void *v74;
  size_t v75;
  const char *string;
  int v77;
  int v78;
  size_t st_size;
  void *v80;
  void *v81;
  xpc_object_t v82;
  const char *v83;
  int v84;
  NSObject *v85;
  const char *v86;
  const char *v87;
  int v88;
  NSObject *v89;
  size_t count;
  CFErrorRef v91;
  const char *v92;
  int v93;
  CFIndex v94;
  const char *v95;
  const char *v96;
  const char *v97;
  int v98;
  NSObject *v99;
  const char *v100;
  const char *v101;
  int v102;
  NSObject *v103;
  const char *v104;
  const char *v105;
  int v106;
  const char *v107;
  int v108;
  const char *v109;
  const char *v110;
  int v111;
  const char *v112;
  const char *v113;
  char *v114;
  CFIndex v115;
  int v116;
  const char *v117;
  const char *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  xpc_object_t dictionary;
  xpc_object_t v124;
  void *v125;
  dev_t v126;
  int *v127;
  const char *v128;
  int v129;
  NSObject *v130;
  __darwin_ino64_t v131;
  const char *v132;
  const char *v133;
  int v134;
  NSObject *v135;
  __darwin_ino64_t v136;
  const char *v137;
  NSObject *v138;
  const char *v139;
  const char *v140;
  NSObject *v141;
  __darwin_ino64_t v142;
  const char *v143;
  _BOOL4 v144;
  const char *v145;
  int v146;
  NSObject *v147;
  const char *v148;
  CFIndex v149;
  const char *v150;
  char *v151;
  void *v152;
  const char *v153;
  dev_t v154;
  const char *v155;
  __darwin_ino64_t v156;
  const char *v157;
  const char *v158;
  char *v159;
  const char *v160;
  char *v161;
  CFErrorRef v162;
  const char *v163;
  __darwin_ino64_t v164;
  char *v165;
  const char *v166;
  const char *v167;
  BOOL v168;
  void *v169;
  unsigned int v170;
  unsigned int v171;
  const char *v172;
  const char *v173;
  int v174;
  NSObject *v175;
  const char *v176;
  dev_t v177;
  const char *v178;
  int v179;
  NSObject *v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  int v184;
  NSObject *v185;
  const char *v186;
  uint64_t v187;
  _QWORD *v188;
  const char *v189;
  char *v190;
  const char *v191;
  const char *v192;
  const char *v193;
  char *v194;
  const char *v195;
  const char *v196;
  char *v198;
  int *v199;
  const char *v200;
  xpc_object_t v201;
  CFErrorRef xarray;
  xpc_object_t xarraya;
  _QWORD *v204;
  _QWORD *v205;
  xpc_object_t xdict;
  char *v207;
  void *v208;
  void *v209;
  void *v210;
  void *object;
  uint64_t v212;
  stat v213[7];
  _BYTE buf[48];
  uint8_t v215[48];
  uint64_t v216;
  uint64_t v217;

  v217 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 80))
    return 0;
  if ((*(_DWORD *)(a1 + 48) & 0x80000000) == 0)
  {
    v3 = (int *)(a1 + 52);
    v4 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_restore, 0, 0, (_DWORD *)(a1 + 52));
    if (v4)
    {
      Error = v4;
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v6 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v6 = *(const char **)(a1 + 16);
      }
      else
      {
        v6 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v6 = *(const char **)(a1 + 16);
      }
      v213[0].st_dev = 136446466;
      *(_QWORD *)&v213[0].st_mode = v6;
      WORD2(v213[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)"Restore";
      v12 = (char *)_os_log_send_and_compose_impl();
      v13 = 894;
      goto LABEL_350;
    }
    LODWORD(v212) = -1;
    v216 = 0;
    memset(v215, 0, sizeof(v215));
    v9 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_manifest, 0, 0, &v212);
    v10 = &loc_21271E000;
    if (v9)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v11 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v11 = *(const char **)(a1 + 16);
        v213[0].st_dev = 136446210;
        *(_QWORD *)&v213[0].st_mode = v11;
      }
      else
      {
        v23 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v23 = *(const char **)(a1 + 16);
        v213[0].st_dev = 136446210;
        *(_QWORD *)&v213[0].st_mode = v23;
      }
      v24 = (char *)_os_log_send_and_compose_impl();
      Error = createError("_cryptex_bundle_read_manifest", "bundle.c", 89, "com.apple.security.cryptex", 6, v9, v24);
      free(v24);
      v15 = v212;
    }
    else
    {
      v14 = os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG);
      v15 = v212;
      if (v14)
      {
        bzero(v213, 0x400uLL);
        if (!realpath_np())
        {
          v16 = *(const char **)(a1 + 16);
          v17 = *__error();
          v18 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = "[anonymous]";
            if (v16)
              v19 = v16;
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v213;
            _os_log_impl(&dword_2126F8000, v18, OS_LOG_TYPE_DEBUG, "%{public}s: reading manifest: %s", buf, 0x16u);
          }
          *__error() = v17;
          v10 = &loc_21271E000;
        }
      }
      file = _read_file(v15, v215);
      if (file)
      {
        v21 = file;
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v22 = *(const char **)(a1 + 16);
          if (!v22)
            v22 = "[anonymous]";
          v213[0].st_dev = 136446466;
          *(_QWORD *)&v213[0].st_mode = v22;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = v21;
        }
        else
        {
          v27 = *(const char **)(a1 + 16);
          if (!v27)
            v27 = "[anonymous]";
          v213[0].st_dev = 136446466;
          *(_QWORD *)&v213[0].st_mode = v27;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = file;
        }
        v28 = (char *)_os_log_send_and_compose_impl();
        Error = createError("_cryptex_bundle_read_manifest", "bundle.c", 105, "com.apple.security.cryptex.posix", v21, 0, v28);
        free(v28);
        v10 = &loc_21271E000;
      }
      else
      {
        v25 = (void *)xpc_create_from_plist();
        if (v25)
        {
          v26 = v25;
          *(_QWORD *)(a1 + 80) = xpc_retain(v25);
          buff_destroy(v215);
          os_release(v26);
          Error = 0;
          goto LABEL_45;
        }
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v193 = *(const char **)(a1 + 16);
          if (!v193)
            v193 = "[anonymous]";
        }
        else
        {
          v193 = *(const char **)(a1 + 16);
          if (!v193)
            v193 = "[anonymous]";
        }
        v213[0].st_dev = 136446466;
        *(_QWORD *)&v213[0].st_mode = v193;
        WORD2(v213[0].st_ino) = 1024;
        *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
        v198 = (char *)_os_log_send_and_compose_impl();
        Error = createError("_cryptex_bundle_read_manifest", "bundle.c", 112, "com.apple.security.cryptex.posix", 212, 0, v198);
        free(v198);
      }
    }
    buff_destroy(v215);
LABEL_45:
    if (v15 != -1 && close(v15) == -1)
      _cryptex_bundle_new_asset_from_object_cold_1(v215, v213);
    if (v9)
      CFRelease(v9);
    if (Error)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v29 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v29 = *(const char **)(a1 + 16);
        v213[0].st_dev = 136446210;
        *(_QWORD *)&v213[0].st_mode = v29;
      }
      else
      {
        v191 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v191 = *(const char **)(a1 + 16);
        v213[0].st_dev = 136446210;
        *(_QWORD *)&v213[0].st_mode = v191;
      }
      v12 = (char *)_os_log_send_and_compose_impl();
      v13 = 903;
      goto LABEL_350;
    }
    v30 = _xpc_plist_value_copy((uint64_t)&_build_identities, *(void **)(a1 + 80));
    if (!v30)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v192 = *(const char **)(a1 + 16);
        if (!v192)
          v192 = "[anonymous]";
      }
      else
      {
        v192 = *(const char **)(a1 + 16);
        if (!v192)
          v192 = "[anonymous]";
      }
      v213[0].st_dev = 136446466;
      *(_QWORD *)&v213[0].st_mode = v192;
      WORD2(v213[0].st_ino) = 1024;
      *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
      v194 = (char *)_os_log_send_and_compose_impl();
      Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 739, "com.apple.security.cryptex.posix", 212, 0, v194);
      free(v194);
LABEL_341:
      if (!Error)
        return 0;
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v195 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v195 = *(const char **)(a1 + 16);
        v213[0].st_dev = v10[417];
        *(_QWORD *)&v213[0].st_mode = v195;
      }
      else
      {
        v196 = "[anonymous]";
        if (*(_QWORD *)(a1 + 16))
          v196 = *(const char **)(a1 + 16);
        v213[0].st_dev = v10[417];
        *(_QWORD *)&v213[0].st_mode = v196;
      }
      v12 = (char *)_os_log_send_and_compose_impl();
      v13 = 912;
LABEL_350:
      empty = createError("_cryptex_bundle_init", "bundle.c", v13, "com.apple.security.cryptex", 6, Error, v12);
      free(v12);
      CFRelease(Error);
      return empty;
    }
    v31 = v30;
    if (xpc_array_get_count(v30))
    {
      Error = 0;
      v32 = 0;
      xarray = 0;
      v204 = (_QWORD *)(a1 + 64);
      v208 = v31;
      while (1)
      {
        *(_QWORD *)buf = 1;
        memset(&buf[8], 0, 40);
        v33 = _xpc_plist_value_copy_at(_build_identity, v31, v32);
        v34 = v33;
        if (!v33)
        {
          if (*(_QWORD *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v38 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v38)
              v38 = "[anonymous]";
            *(_QWORD *)&v213[0].st_mode = v38;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          else
          {
            v53 = *(const char **)(a1 + 16);
            if (!v53)
              v53 = "[anonymous]";
            v213[0].st_dev = 136446466;
            *(_QWORD *)&v213[0].st_mode = v53;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          v51 = (char *)_os_log_send_and_compose_impl();
          v54 = 760;
          v55 = 212;
LABEL_82:
          Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", v54, "com.apple.security.cryptex.posix", v55, 0, v51);
          v210 = 0;
          object = 0;
          v52 = 0;
LABEL_83:
          free(v51);
          free(v52);
          v56 = 2;
          goto LABEL_84;
        }
        v35 = _cryptex_identity_init_from_dict(v33, *(NSObject **)(a1 + 32), (uint64_t)buf, 1);
        v209 = v34;
        if (v35)
        {
          v36 = v35;
          if (*(_QWORD *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v37 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v37)
              v37 = "[anonymous]";
            *(_QWORD *)&v213[0].st_mode = v37;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v36;
          }
          else
          {
            v50 = *(const char **)(a1 + 16);
            if (!v50)
              v50 = "[anonymous]";
            v213[0].st_dev = 136446466;
            *(_QWORD *)&v213[0].st_mode = v50;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v35;
          }
          v51 = (char *)_os_log_send_and_compose_impl();
          Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 767, "com.apple.security.cryptex.posix", v36, 0, v51);
          v210 = 0;
          object = 0;
          v52 = 0;
          goto LABEL_83;
        }
        v39 = _cryptex_identity_copy_description((uint64_t)buf);
        if (!v39)
        {
          if (*(_QWORD *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v57 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v57)
              v57 = "[anonymous]";
            *(_QWORD *)&v213[0].st_mode = v57;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 12;
          }
          else
          {
            v95 = *(const char **)(a1 + 16);
            if (!v95)
              v95 = "[anonymous]";
            v213[0].st_dev = 136446466;
            *(_QWORD *)&v213[0].st_mode = v95;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 12;
          }
          v51 = (char *)_os_log_send_and_compose_impl();
          v54 = 775;
          v55 = 12;
          goto LABEL_82;
        }
        v40 = v39;
        v41 = _xpc_plist_value_copy((uint64_t)&_info, v34);
        v42 = (uint64_t)v10;
        v210 = v41;
        v207 = v40;
        if (v41)
        {
          v43 = _xpc_plist_value_copy((uint64_t)&_variant, v41);
          if (v43)
            goto LABEL_103;
          v44 = *(const char **)(a1 + 16);
          v45 = *__error();
          v46 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            v47 = "[anonymous]";
            if (v44)
              v47 = v44;
            v213[0].st_dev = 136446210;
            *(_QWORD *)&v213[0].st_mode = v47;
            v48 = v46;
            v49 = "%{public}s: no variant, using generic variant";
LABEL_101:
            _os_log_impl(&dword_2126F8000, v48, OS_LOG_TYPE_DEBUG, v49, (uint8_t *)v213, 0xCu);
          }
        }
        else
        {
          v58 = *(const char **)(a1 + 16);
          v45 = *__error();
          v59 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            v60 = "[anonymous]";
            if (v58)
              v60 = v58;
            v213[0].st_dev = 136446210;
            *(_QWORD *)&v213[0].st_mode = v60;
            v48 = v59;
            v49 = "%{public}s: no info, using generic variant";
            goto LABEL_101;
          }
        }
        v61 = __error();
        v43 = 0;
        *v61 = v45;
LABEL_103:
        object = v43;
        v62 = *(const char **)(a1 + 16);
        v63 = *__error();
        v64 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          v213[0].st_dev = 136446722;
          v65 = "[anonymous]";
          if (v62)
            v65 = v62;
          *(_QWORD *)&v213[0].st_mode = v65;
          WORD2(v213[0].st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
          HIWORD(v213[0].st_gid) = 2080;
          *(_QWORD *)&v213[0].st_rdev = v207;
          _os_log_impl(&dword_2126F8000, v64, OS_LOG_TYPE_DEBUG, "%{public}s: identity[%lu]: %s", (uint8_t *)v213, 0x20u);
        }
        *__error() = v63;
        if (object)
          string_ptr = (char *)xpc_string_get_string_ptr(object);
        else
          string_ptr = 0;
        v67 = *(const char **)(a1 + 16);
        v68 = *__error();
        v69 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          v70 = "[anonymous]";
          if (v67)
            v70 = v67;
          v213[0].st_dev = 136446722;
          *(_QWORD *)&v213[0].st_mode = v70;
          v71 = "generic";
          if (string_ptr)
            v71 = string_ptr;
          WORD2(v213[0].st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
          HIWORD(v213[0].st_gid) = 2080;
          *(_QWORD *)&v213[0].st_rdev = v71;
          _os_log_impl(&dword_2126F8000, v69, OS_LOG_TYPE_DEBUG, "%{public}s: variant[%lu] = %s", (uint8_t *)v213, 0x20u);
        }
        *__error() = v68;
        *(_OWORD *)&v213[0].st_dev = *(_OWORD *)buf;
        *(_OWORD *)&v213[0].st_uid = *(_OWORD *)&buf[16];
        v213[0].st_atimespec = *(timespec *)&buf[32];
        if (_cryptex_list_find_cryptex_elm(v204, (uint64_t)v213, string_ptr, 0))
        {
          v10 = (_QWORD *)v42;
          v34 = v209;
          if (*(_QWORD *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v72 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136447234;
            if (!v72)
              v72 = "[anonymous]";
            *(_QWORD *)&v213[0].st_mode = v72;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            *(_QWORD *)&v213[0].st_rdev = v207;
            LOWORD(v213[0].st_atimespec.tv_sec) = 2080;
            *(__darwin_time_t *)((char *)&v213[0].st_atimespec.tv_sec + 2) = (__darwin_time_t)string_ptr;
            WORD1(v213[0].st_atimespec.tv_nsec) = 1024;
            HIDWORD(v213[0].st_atimespec.tv_nsec) = 22;
            v52 = v207;
          }
          else
          {
            v92 = *(const char **)(a1 + 16);
            if (!v92)
              v92 = "[anonymous]";
            v213[0].st_dev = 136447234;
            *(_QWORD *)&v213[0].st_mode = v92;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            v52 = v207;
            *(_QWORD *)&v213[0].st_rdev = v207;
            LOWORD(v213[0].st_atimespec.tv_sec) = 2080;
            *(__darwin_time_t *)((char *)&v213[0].st_atimespec.tv_sec + 2) = (__darwin_time_t)string_ptr;
            WORD1(v213[0].st_atimespec.tv_nsec) = 1024;
            HIDWORD(v213[0].st_atimespec.tv_nsec) = 22;
          }
          v51 = (char *)_os_log_send_and_compose_impl();
          v31 = v208;
          v93 = 804;
          v94 = 22;
          goto LABEL_148;
        }
        v34 = v209;
        xdict = _xpc_plist_value_copy((uint64_t)&_manifest, v209);
        if (!xdict)
        {
          v10 = (_QWORD *)v42;
          if (*(_QWORD *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v96 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v96)
              v96 = "[anonymous]";
            *(_QWORD *)&v213[0].st_mode = v96;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          else
          {
            v105 = *(const char **)(a1 + 16);
            if (!v105)
              v105 = "[anonymous]";
            v213[0].st_dev = 136446466;
            *(_QWORD *)&v213[0].st_mode = v105;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 212;
          }
          v51 = (char *)_os_log_send_and_compose_impl();
          v52 = v207;
          v31 = v208;
          v93 = 812;
          v94 = 212;
LABEL_148:
          Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", v93, "com.apple.security.cryptex.posix", v94, 0, v51);
          goto LABEL_83;
        }
        *(_OWORD *)&v213[0].st_dev = *(_OWORD *)buf;
        *(_OWORD *)&v213[0].st_uid = *(_OWORD *)&buf[16];
        v213[0].st_atimespec = *(timespec *)&buf[32];
        v205 = (_QWORD *)_cryptex_create(v213, string_ptr, string_ptr == 0);
        v73 = _xpc_plist_value_copy((uint64_t)&_signatures, v209);
        v201 = v73;
        if (v73)
        {
          v74 = v73;
          xarraya = xpc_array_create(0, 0);
          if (xpc_array_get_count(v74))
          {
            if (xpc_array_get_count(v74))
            {
              v75 = 0;
              v199 = v3;
              while (1)
              {
                memset(v213, 0, 144);
                string = xpc_array_get_string(v74, v75);
                v77 = openat(*v3, string, 0);
                if (v77 < 0)
                  break;
                v78 = v77;
                if (fstat(v77, v213) == -1)
                {
                  v108 = *__error();
                  if (*(_QWORD *)(a1 + 32))
                  {
                    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                    v109 = *(const char **)(a1 + 16);
                    *(_DWORD *)v215 = 136446722;
                    if (!v109)
                      v109 = "[anonymous]";
                    *(_QWORD *)&v215[4] = v109;
                    *(_WORD *)&v215[12] = 2080;
                    *(_QWORD *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v108;
                  }
                  else
                  {
                    v117 = *(const char **)(a1 + 16);
                    if (!v117)
                      v117 = "[anonymous]";
                    *(_DWORD *)v215 = 136446722;
                    *(_QWORD *)&v215[4] = v117;
                    *(_WORD *)&v215[12] = 2080;
                    *(_QWORD *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v108;
                  }
                  v114 = (char *)_os_log_send_and_compose_impl();
                  v10 = (_QWORD *)v42;
                  v115 = v108;
                  v116 = 582;
                  goto LABEL_204;
                }
                st_size = v213[0].st_size;
                if (v213[0].st_size < 0)
                  _cryptex_signing_service_read_fd_cold_2();
                if (HIDWORD(v213[0].st_size))
                {
                  if (*(_QWORD *)(a1 + 32))
                  {
                    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                    v110 = *(const char **)(a1 + 16);
                    *(_DWORD *)v215 = 136446978;
                    if (!v110)
                      v110 = "[anonymous]";
                    *(_QWORD *)&v215[4] = v110;
                    *(_WORD *)&v215[12] = 2048;
                    *(_QWORD *)&v215[14] = st_size;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = -1;
                    *(_WORD *)&v215[28] = 1024;
                    *(_DWORD *)&v215[30] = 34;
                  }
                  else
                  {
                    v118 = *(const char **)(a1 + 16);
                    if (!v118)
                      v118 = "[anonymous]";
                    *(_DWORD *)v215 = 136446978;
                    *(_QWORD *)&v215[4] = v118;
                    *(_WORD *)&v215[12] = 2048;
                    *(_QWORD *)&v215[14] = v213[0].st_size;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = -1;
                    *(_WORD *)&v215[28] = 1024;
                    *(_DWORD *)&v215[30] = 34;
                  }
                  v114 = (char *)_os_log_send_and_compose_impl();
                  v10 = (_QWORD *)v42;
                  v116 = 593;
                  v115 = 34;
                  goto LABEL_204;
                }
                v80 = mmap(0, v213[0].st_size, 1, 1, v78, 0);
                if (v80 == (void *)-1)
                {
                  v111 = *__error();
                  if (*(_QWORD *)(a1 + 32))
                  {
                    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                    v112 = *(const char **)(a1 + 16);
                    *(_DWORD *)v215 = 136446722;
                    if (!v112)
                      v112 = "[anonymous]";
                    *(_QWORD *)&v215[4] = v112;
                    *(_WORD *)&v215[12] = 2080;
                    *(_QWORD *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v111;
                  }
                  else
                  {
                    v119 = *(const char **)(a1 + 16);
                    if (!v119)
                      v119 = "[anonymous]";
                    *(_DWORD *)v215 = 136446722;
                    *(_QWORD *)&v215[4] = v119;
                    *(_WORD *)&v215[12] = 2080;
                    *(_QWORD *)&v215[14] = string;
                    *(_WORD *)&v215[22] = 1024;
                    *(_DWORD *)&v215[24] = v111;
                  }
                  v114 = (char *)_os_log_send_and_compose_impl();
                  v10 = (_QWORD *)v42;
                  v115 = v111;
                  v116 = 602;
                  goto LABEL_204;
                }
                v81 = v80;
                v200 = string;
                v82 = xpc_data_create(v80, st_size);
                xpc_array_append_value(xarraya, v82);
                v83 = *(const char **)(a1 + 16);
                v84 = *__error();
                v85 = *(NSObject **)(a1 + 32);
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v215 = 136446466;
                  v86 = "[anonymous]";
                  if (v83)
                    v86 = v83;
                  *(_QWORD *)&v215[4] = v86;
                  *(_WORD *)&v215[12] = 2080;
                  *(_QWORD *)&v215[14] = v200;
                  _os_log_impl(&dword_2126F8000, v85, OS_LOG_TYPE_DEFAULT, "%{public}s: added %s to ccx_im4m_array", v215, 0x16u);
                }
                *__error() = v84;
                if (munmap(v81, st_size) == -1)
                  _cryptex_bundle_init_cold_2(&v212, v215);
                v3 = v199;
                v74 = v201;
                if (v82)
                  os_release(v82);
                ++v75;
                v42 = 0x21271E000;
                if (v75 >= xpc_array_get_count(v201))
                  goto LABEL_139;
              }
              v106 = *__error();
              if (*(_QWORD *)(a1 + 32))
              {
                os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
                v107 = *(const char **)(a1 + 16);
                *(_DWORD *)v215 = 136446722;
                if (!v107)
                  v107 = "[anonymous]";
                *(_QWORD *)&v215[4] = v107;
                *(_WORD *)&v215[12] = 2080;
                *(_QWORD *)&v215[14] = string;
                *(_WORD *)&v215[22] = 1024;
                *(_DWORD *)&v215[24] = v106;
              }
              else
              {
                v113 = *(const char **)(a1 + 16);
                if (!v113)
                  v113 = "[anonymous]";
                *(_DWORD *)v215 = 136446722;
                *(_QWORD *)&v215[4] = v113;
                *(_WORD *)&v215[12] = 2080;
                *(_QWORD *)&v215[14] = string;
                *(_WORD *)&v215[22] = 1024;
                *(_DWORD *)&v215[24] = v106;
              }
              v114 = (char *)_os_log_send_and_compose_impl();
              v10 = (_QWORD *)v42;
              v115 = v106;
              v116 = 574;
LABEL_204:
              v91 = createError("_cryptex_bundle_populate_signatures", "bundle.c", v116, "com.apple.security.cryptex.posix", v115, 0, v114);
              v31 = v208;
              v34 = v209;
              free(v114);
              *(_QWORD *)(v205[6] + 208) = 0;
              goto LABEL_205;
            }
LABEL_139:
            *(_QWORD *)(v205[6] + 208) = xpc_copy(xarraya);
            v87 = *(const char **)(a1 + 16);
            v88 = *__error();
            v89 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              if (!v87)
                v87 = "[anonymous]";
              count = xpc_array_get_count(xarraya);
              v213[0].st_dev = 136446466;
              *(_QWORD *)&v213[0].st_mode = v87;
              WORD2(v213[0].st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = count;
              _os_log_impl(&dword_2126F8000, v89, OS_LOG_TYPE_DEFAULT, "%{public}s: added %lu signatures", (uint8_t *)v213, 0x16u);
            }
            v91 = 0;
            *__error() = v88;
          }
          else
          {
            v101 = *(const char **)(a1 + 16);
            v102 = *__error();
            v103 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              v104 = "[anonymous]";
              if (v101)
                v104 = v101;
              v213[0].st_dev = 136446210;
              *(_QWORD *)&v213[0].st_mode = v104;
              _os_log_impl(&dword_2126F8000, v103, OS_LOG_TYPE_DEFAULT, "%{public}s: Signatures array empty", (uint8_t *)v213, 0xCu);
            }
            v91 = 0;
            *__error() = v102;
            *(_QWORD *)(v205[6] + 208) = 0;
          }
          v10 = (_QWORD *)v42;
          v31 = v208;
          v34 = v209;
LABEL_205:
          if (xarraya)
            os_release(xarraya);
          if (v91)
          {
            xarray = v91;
            if (*(_QWORD *)(a1 + 32))
            {
              os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
              v120 = *(const char **)(a1 + 16);
              if (!v120)
                v120 = "[anonymous]";
              v213[0].st_dev = 136446210;
              *(_QWORD *)&v213[0].st_mode = v120;
            }
            else
            {
              v150 = *(const char **)(a1 + 16);
              if (!v150)
                v150 = "[anonymous]";
              v213[0].st_dev = 136446210;
              *(_QWORD *)&v213[0].st_mode = v150;
            }
            v151 = (char *)_os_log_send_and_compose_impl();
            Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 831, "com.apple.security.cryptex", 6, v91, v151);
            free(v151);
            v56 = 2;
            goto LABEL_254;
          }
          goto LABEL_212;
        }
        v97 = *(const char **)(a1 + 16);
        v98 = *__error();
        v99 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          v213[0].st_dev = 136446722;
          v100 = "[anonymous]";
          if (v97)
            v100 = v97;
          *(_QWORD *)&v213[0].st_mode = v100;
          WORD2(v213[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)v207;
          HIWORD(v213[0].st_gid) = 2080;
          *(_QWORD *)&v213[0].st_rdev = string_ptr;
          _os_log_impl(&dword_2126F8000, v99, OS_LOG_TYPE_DEFAULT, "%{public}s: no Signatures found for:\nidentity: %s\nvariant = %s", (uint8_t *)v213, 0x20u);
        }
        *__error() = v98;
        *(_QWORD *)(v205[6] + 208) = 0;
        v31 = v208;
LABEL_212:
        v121 = 0;
        while (1)
        {
          v122 = *(_QWORD *)(MEMORY[0x24BEDBAB8] + v121);
          *(_QWORD *)v215 = 0;
          if ((*(_BYTE *)v122 & 0x10) != 0)
          {
            v133 = *(const char **)(a1 + 16);
            v134 = *__error();
            v135 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
            {
              v136 = *(_QWORD *)(v122 + 40);
              v137 = "[anonymous]";
              if (v133)
                v137 = v133;
              v213[0].st_dev = 136446466;
              *(_QWORD *)&v213[0].st_mode = v137;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v136;
              v138 = v135;
              v139 = "%{public}s: skipping internal asset type: %s";
LABEL_230:
              _os_log_impl(&dword_2126F8000, v138, OS_LOG_TYPE_DEBUG, v139, (uint8_t *)v213, 0x16u);
            }
LABEL_231:
            *__error() = v134;
            goto LABEL_232;
          }
          dictionary = xpc_dictionary_get_dictionary(xdict, *(const char **)(v122 + 48));
          if (!dictionary)
          {
            v140 = *(const char **)(a1 + 16);
            v134 = *__error();
            v141 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
            {
              v142 = *(_QWORD *)(v122 + 48);
              v143 = "[anonymous]";
              if (v140)
                v143 = v140;
              v213[0].st_dev = 136446466;
              *(_QWORD *)&v213[0].st_mode = v143;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v142;
              v138 = v141;
              v139 = "%{public}s: object not present; skipping: %s";
              goto LABEL_230;
            }
            goto LABEL_231;
          }
          v124 = _xpc_plist_value_copy((uint64_t)&_info, dictionary);
          if (!v124)
            break;
          v125 = v124;
          v126 = _cryptex_bundle_new_asset_from_object(*v3, v122, v124, (uint64_t *)v215);
          if (v126)
          {
            v154 = v126;
            if (*(_QWORD *)(a1 + 32))
            {
              os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
              v155 = *(const char **)(a1 + 16);
              v156 = *(_QWORD *)(v122 + 40);
              if (!v155)
                v155 = "[anonymous]";
              v213[0].st_dev = 136446722;
              *(_QWORD *)&v213[0].st_mode = v155;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v156;
              HIWORD(v213[0].st_gid) = 1024;
              v213[0].st_rdev = v154;
            }
            else
            {
              v163 = *(const char **)(a1 + 16);
              if (!v163)
                v163 = "[anonymous]";
              v164 = *(_QWORD *)(v122 + 40);
              v213[0].st_dev = 136446722;
              *(_QWORD *)&v213[0].st_mode = v163;
              WORD2(v213[0].st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v164;
              HIWORD(v213[0].st_gid) = 1024;
              v213[0].st_rdev = v126;
            }
            v165 = (char *)_os_log_send_and_compose_impl();
            v162 = createError("_cryptex_bundle_populate_assets", "bundle.c", 499, "com.apple.security.cryptex.posix", v154, 0, v165);
            free(v165);
            os_release(v125);
            goto LABEL_280;
          }
          v127 = v3;
          v128 = *(const char **)(a1 + 16);
          v129 = *__error();
          v130 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
          {
            v131 = *(_QWORD *)(v122 + 40);
            v132 = "[anonymous]";
            if (v128)
              v132 = v128;
            v213[0].st_dev = 136446466;
            *(_QWORD *)&v213[0].st_mode = v132;
            WORD2(v213[0].st_ino) = 2080;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v131;
            _os_log_impl(&dword_2126F8000, v130, OS_LOG_TYPE_DEBUG, "%{public}s: adding asset: %s", (uint8_t *)v213, 0x16u);
          }
          *__error() = v129;
          cryptex_core_set_asset();
          os_release(v125);
          v3 = v127;
LABEL_232:
          v31 = v208;
          v121 += 8;
          if (v121 == 96)
            goto LABEL_233;
        }
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v153 = *(const char **)(a1 + 16);
          v213[0].st_dev = 136446722;
          if (!v153)
            v153 = "[anonymous]";
          *(_QWORD *)&v213[0].st_mode = v153;
          WORD2(v213[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)"Info";
          HIWORD(v213[0].st_gid) = 1024;
          v213[0].st_rdev = 212;
        }
        else
        {
          v160 = *(const char **)(a1 + 16);
          if (!v160)
            v160 = "[anonymous]";
          v213[0].st_dev = 136446722;
          *(_QWORD *)&v213[0].st_mode = v160;
          WORD2(v213[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = (__darwin_ino64_t)"Info";
          HIWORD(v213[0].st_gid) = 1024;
          v213[0].st_rdev = 212;
        }
        v161 = (char *)_os_log_send_and_compose_impl();
        v162 = createError("_cryptex_bundle_populate_assets", "bundle.c", 490, "com.apple.security.cryptex.posix", 212, 0, v161);
        free(v161);
LABEL_280:
        if (v162)
        {
          xarray = v162;
          v10 = (_QWORD *)&loc_21271E000;
          if (*(_QWORD *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v166 = *(const char **)(a1 + 16);
            if (!v166)
              v166 = "[anonymous]";
            v213[0].st_dev = 136446210;
            *(_QWORD *)&v213[0].st_mode = v166;
          }
          else
          {
            v167 = *(const char **)(a1 + 16);
            if (!v167)
              v167 = "[anonymous]";
            v213[0].st_dev = 136446210;
            *(_QWORD *)&v213[0].st_mode = v167;
          }
          v159 = (char *)_os_log_send_and_compose_impl();
          Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 841, "com.apple.security.cryptex", 6, xarray, v159);
          goto LABEL_289;
        }
LABEL_233:
        if (!v205)
        {
          v149 = 22;
          goto LABEL_249;
        }
        v10 = (_QWORD *)&loc_21271E000;
        if (!v205[6])
        {
          v149 = 22;
          goto LABEL_264;
        }
        v144 = cryptex_core_get_asset()
            || cryptex_core_get_asset()
            || cryptex_core_get_asset()
            || cryptex_core_get_asset() != 0;
        if (!cryptex_core_get_asset() && !cryptex_core_get_asset() && !cryptex_core_get_asset())
        {
          if (cryptex_core_get_asset())
            v168 = v144;
          else
            v168 = 0;
          if (!v168)
            goto LABEL_299;
LABEL_243:
          v145 = *(const char **)(a1 + 16);
          v146 = *__error();
          v147 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
          {
            v213[0].st_dev = 136446466;
            v148 = "[anonymous]";
            if (v145)
              v148 = v145;
            *(_QWORD *)&v213[0].st_mode = v148;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = 45;
            _os_log_impl(&dword_2126F8000, v147, OS_LOG_TYPE_ERROR, "%{public}s: Invalid bundle contents: mixed Cryptex1 and legacy assets.: %{darwin.errno}d", (uint8_t *)v213, 0x12u);
          }
          *__error() = v146;
          v149 = 45;
LABEL_249:
          v10 = (_QWORD *)&loc_21271E000;
LABEL_264:
          if (*(_QWORD *)(a1 + 32))
          {
            os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
            v157 = *(const char **)(a1 + 16);
            v213[0].st_dev = 136446466;
            if (!v157)
              v157 = "[anonymous]";
            *(_QWORD *)&v213[0].st_mode = v157;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v149;
          }
          else
          {
            v158 = *(const char **)(a1 + 16);
            if (!v158)
              v158 = "[anonymous]";
            v213[0].st_dev = 136446466;
            *(_QWORD *)&v213[0].st_mode = v158;
            WORD2(v213[0].st_ino) = 1024;
            *(_DWORD *)((char *)&v213[0].st_ino + 6) = v149;
          }
          v159 = (char *)_os_log_send_and_compose_impl();
          Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 848, "com.apple.security.cryptex.posix", v149, 0, v159);
          xarray = 0;
LABEL_289:
          free(v159);
          v56 = 2;
          v34 = v209;
          v152 = v205;
          if (!v205)
            goto LABEL_291;
          goto LABEL_290;
        }
        if (v144)
          goto LABEL_243;
LABEL_299:
        v169 = v205;
        _cryptex_bundle_add_cryptex_assets((_QWORD *)a1, (uint64_t)v205);
        if (!cryptex_core_is_cryptex1())
          goto LABEL_318;
        v170 = _cryptex_populate_cryptex1_properties(a1, (uint64_t)v205, v209);
        if (!v170)
        {
          v173 = *(const char **)(a1 + 16);
          v174 = *__error();
          v175 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v175, OS_LOG_TYPE_DEBUG))
          {
            v176 = "[anonymous]";
            if (v173)
              v176 = v173;
            v177 = *(_DWORD *)(*(_QWORD *)(v205[6] + 216) + 40);
            v213[0].st_dev = 136446722;
            *(_QWORD *)&v213[0].st_mode = v176;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 1024;
            v213[0].st_rdev = v177;
            _os_log_impl(&dword_2126F8000, v175, OS_LOG_TYPE_DEBUG, "%{public}s: nonce domain handle[%lu]: %u", (uint8_t *)v213, 0x1Cu);
          }
          *__error() = v174;
          v178 = *(const char **)(a1 + 16);
          v179 = *__error();
          v180 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
          {
            v181 = "[anonymous]";
            if (v178)
              v181 = v178;
            v182 = *(_QWORD *)(*(_QWORD *)(v205[6] + 216) + 48);
            v213[0].st_dev = 136446722;
            *(_QWORD *)&v213[0].st_mode = v181;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            *(_QWORD *)&v213[0].st_rdev = v182;
            _os_log_impl(&dword_2126F8000, v180, OS_LOG_TYPE_DEBUG, "%{public}s: Cryptex1 version[%lu]: %s", (uint8_t *)v213, 0x20u);
          }
          *__error() = v179;
          v183 = *(const char **)(a1 + 16);
          v184 = *__error();
          v185 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
          {
            v186 = "[anonymous]";
            if (v183)
              v186 = v183;
            v187 = *(_QWORD *)(*(_QWORD *)(v205[6] + 216) + 56);
            v213[0].st_dev = 136446722;
            *(_QWORD *)&v213[0].st_mode = v186;
            WORD2(v213[0].st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v213[0].st_ino + 6) = v32;
            HIWORD(v213[0].st_gid) = 2080;
            *(_QWORD *)&v213[0].st_rdev = v187;
            _os_log_impl(&dword_2126F8000, v185, OS_LOG_TYPE_DEBUG, "%{public}s: Cryptex1 preauth version[%lu]: %s", (uint8_t *)v213, 0x20u);
          }
          *__error() = v184;
          v10 = (_QWORD *)&loc_21271E000;
          v31 = v208;
          v169 = v205;
LABEL_318:
          v188 = _cryptex_list_elm_new(v169);
          v56 = 0;
          xarray = 0;
          *v188 = *v204;
          *v204 = v188;
          v34 = v209;
          v152 = v169;
          goto LABEL_290;
        }
        v171 = v170;
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v172 = *(const char **)(a1 + 16);
          v213[0].st_dev = 136446466;
          if (!v172)
            v172 = "[anonymous]";
          *(_QWORD *)&v213[0].st_mode = v172;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = v171;
        }
        else
        {
          v189 = *(const char **)(a1 + 16);
          if (!v189)
            v189 = "[anonymous]";
          v213[0].st_dev = 136446466;
          *(_QWORD *)&v213[0].st_mode = v189;
          WORD2(v213[0].st_ino) = 1024;
          *(_DWORD *)((char *)&v213[0].st_ino + 6) = v170;
        }
        v190 = (char *)_os_log_send_and_compose_impl();
        Error = createError("_cryptex_bundle_find_cryptexes", "bundle.c", 859, "com.apple.security.cryptex.posix", v171, 0, v190);
        free(v190);
        xarray = 0;
        v56 = 2;
        v34 = v209;
LABEL_254:
        v152 = v205;
LABEL_290:
        os_release(v152);
LABEL_291:
        free(v207);
        if (v201)
          os_release(v201);
        os_release(xdict);
LABEL_84:
        if (object)
          os_release(object);
        if (v210)
          os_release(v210);
        if (v34)
          os_release(v34);
        if (!v56 && ++v32 < xpc_array_get_count(v31))
          continue;
        os_release(v31);
        if (xarray)
          CFRelease(xarray);
        goto LABEL_341;
      }
    }
    v8 = v31;
LABEL_13:
    os_release(v8);
    return 0;
  }
  empty = xpc_dictionary_create_empty();
  v7 = xpc_array_create_empty();
  xpc_dictionary_set_value(empty, "BuildIdentities", v7);
  *(_QWORD *)(a1 + 80) = xpc_retain(empty);
  if (v7)
    os_release(v7);
  if (empty)
  {
    v8 = empty;
    goto LABEL_13;
  }
  return empty;
}

uint64_t cryptex_bundle_copy_cryptex_for_chip2(uint64_t a1, uint64_t a2, const char *a3, void **a4, CFTypeRef *a5)
{
  int v9;
  int v10;
  const char *v11;
  const char *v12;
  const char *v13;
  char *v14;
  CFIndex v15;
  const char *v16;
  int v17;
  CFTypeRef v18;
  const char *v19;
  CFErrorRef Error;
  uint64_t v21;
  _OWORD v23[3];
  CFTypeRef cf;
  _BYTE v25[32];
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  *(_QWORD *)&v23[0] = 1;
  memset((char *)v23 + 8, 0, 40);
  v9 = cryptex_identity_set_chip((unsigned int *)v23, a2);
  if (v9)
  {
    v10 = v9;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v11 = *(const char **)(a1 + 16);
      *(_DWORD *)v25 = 136446722;
      if (!v11)
        v11 = "[anonymous]";
      *(_QWORD *)&v25[4] = v11;
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = v10;
      *(_WORD *)&v25[18] = 1024;
      *(_DWORD *)&v25[20] = v10;
    }
    else
    {
      v13 = "[anonymous]";
      if (*(_QWORD *)(a1 + 16))
        v13 = *(const char **)(a1 + 16);
      *(_DWORD *)v25 = 136446722;
      *(_QWORD *)&v25[4] = v13;
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = v9;
      *(_WORD *)&v25[18] = 1024;
      *(_DWORD *)&v25[20] = v9;
    }
    v14 = (char *)_os_log_send_and_compose_impl();
    v15 = v10;
    v16 = "com.apple.security.cryptex.posix";
    v17 = 1377;
    v18 = 0;
  }
  else
  {
    *(_OWORD *)v25 = v23[0];
    *(_OWORD *)&v25[16] = v23[1];
    v26 = v23[2];
    if (cryptex_bundle_copy_cryptex2(a1, v25, a3, a4, &cf))
      goto LABEL_24;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v12 = *(const char **)(a1 + 16);
      if (!v12)
        v12 = "[anonymous]";
      *(_DWORD *)v25 = 136446210;
      *(_QWORD *)&v25[4] = v12;
    }
    else
    {
      v19 = *(const char **)(a1 + 16);
      if (!v19)
        v19 = "[anonymous]";
      *(_DWORD *)v25 = 136446210;
      *(_QWORD *)&v25[4] = v19;
    }
    v14 = (char *)_os_log_send_and_compose_impl();
    v18 = cf;
    v16 = "com.apple.security.cryptex";
    v17 = 1384;
    v15 = 8;
  }
  Error = createError("cryptex_bundle_copy_cryptex_for_chip2", "bundle.c", v17, v16, v15, v18, v14);
  free(v14);
  if (a5 && Error)
  {
    *a5 = CFRetain(Error);
LABEL_23:
    CFRelease(Error);
    v21 = 0;
    goto LABEL_25;
  }
  if (Error)
    goto LABEL_23;
LABEL_24:
  v21 = 1;
LABEL_25:
  if (cf)
    CFRelease(cf);
  return v21;
}

uint64_t cryptex_bundle_set_cryptex2(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  void *v6;
  const void *v7;
  const char *v8;
  const char *v9;
  void **v10;
  const char *v11;
  __int128 v12;
  void **cryptex_elm;
  void **v14;
  void *v15;
  xpc_object_t value;
  xpc_object_t empty;
  void **i;
  const char *v19;
  char *v20;
  CFErrorRef Error;
  const char *v22;
  uint64_t v23;
  __int128 v24;
  xpc_object_t v25;
  char *v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  const char *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t v44;
  const char *v45;
  int v46;
  NSObject *v47;
  const char *v48;
  char *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t j;
  xpc_object_t v54;
  xpc_object_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  int v59;
  NSObject *v60;
  _BOOL4 v61;
  const char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  xpc_object_t v66;
  const char *v67;
  NSObject *v68;
  const char *v69;
  char *v70;
  NSObject *v71;
  const char *v72;
  const char *v73;
  char *v74;
  char *v75;
  const char *v76;
  int v77;
  NSObject *v78;
  const char *v79;
  xpc_object_t v80;
  _QWORD *v81;
  xpc_object_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *object;
  xpc_object_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char *v94;
  void *v95;
  xpc_object_t v96;
  xpc_object_t xdict;
  void **v98;
  char v99;
  __int128 applier;
  __int128 v101;
  __int128 v102;
  xpc_object_t v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  char *v107;
  __int16 v108;
  uint64_t v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a2 + 40) & 2) != 0)
  {
    if (*(_QWORD *)(a2 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 32), OS_LOG_TYPE_ERROR);
      v9 = *(const char **)(a2 + 16);
      if (!v9)
        v9 = "[anonymous]";
      LODWORD(applier) = 136446210;
      *(_QWORD *)((char *)&applier + 4) = v9;
    }
    else
    {
      v19 = *(const char **)(a2 + 16);
      if (!v19)
        v19 = "[anonymous]";
      LODWORD(applier) = 136446210;
      *(_QWORD *)((char *)&applier + 4) = v19;
    }
    v20 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_set_cryptex2", "bundle.c", 1408, "com.apple.security.cryptex", 10, 0, v20);
    v7 = 0;
LABEL_25:
    free(v20);
    if (a3 && Error)
    {
      *a3 = CFRetain(Error);
    }
    else if (!Error)
    {
      v23 = 1;
      if (!v7)
        return v23;
      goto LABEL_30;
    }
    CFRelease(Error);
    v23 = 0;
    if (!v7)
      return v23;
LABEL_30:
    CFRelease(v7);
    return v23;
  }
  v6 = _cryptex_bundle_init(a1);
  if (v6)
  {
    v7 = v6;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v8 = *(const char **)(a1 + 16);
      if (!v8)
        v8 = "[anonymous]";
      LODWORD(applier) = 136446210;
      *(_QWORD *)((char *)&applier + 4) = v8;
    }
    else
    {
      v22 = *(const char **)(a1 + 16);
      if (!v22)
        v22 = "[anonymous]";
      LODWORD(applier) = 136446210;
      *(_QWORD *)((char *)&applier + 4) = v22;
    }
    v20 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_set_cryptex2", "bundle.c", 1417, "com.apple.security.cryptex", 6, v7, v20);
    goto LABEL_25;
  }
  v10 = (void **)(a1 + 64);
  v11 = *(const char **)(a2 + 16);
  v12 = *(_OWORD *)(a2 + 72);
  applier = *(_OWORD *)(a2 + 56);
  v101 = v12;
  v102 = *(_OWORD *)(a2 + 88);
  cryptex_elm = (void **)_cryptex_list_find_cryptex_elm((_QWORD *)(a1 + 64), (uint64_t)&applier, v11, 0);
  v98 = cryptex_elm;
  if (cryptex_elm)
  {
    v14 = cryptex_elm;
    v15 = cryptex_elm[1];
    value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 80), "BuildIdentities");
    empty = xpc_array_create_empty();
    *(_QWORD *)&applier = MEMORY[0x24BDAC760];
    *((_QWORD *)&applier + 1) = 0x40000000;
    *(_QWORD *)&v101 = ___cryptex_bundle_manifest_remove_build_identity_block_invoke;
    *((_QWORD *)&v101 + 1) = &__block_descriptor_tmp_0;
    *(_QWORD *)&v102 = a1;
    *((_QWORD *)&v102 + 1) = v15;
    v103 = empty;
    xpc_array_apply(value, &applier);
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 80), "BuildIdentities", empty);
    if (empty)
      os_release(empty);
    for (i = (void **)*v10; i != v14; i = (void **)*i)
      v10 = i;
    *v10 = *v14;
    *v14 = (void *)-1;
    _cryptex_list_elm_destroy(&v98);
  }
  v24 = *(_OWORD *)(a2 + 72);
  applier = *(_OWORD *)(a2 + 56);
  v101 = v24;
  v102 = *(_OWORD *)(a2 + 88);
  v99 = 0;
  v25 = xpc_dictionary_create_empty();
  v26 = _cryptex_identity_copy_description((uint64_t)&applier);
  if ((BYTE8(applier) & 1) != 0)
  {
    v34 = *(const char **)(a1 + 16);
    v31 = *__error();
    v35 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = "[anonymous]";
      if (v34)
        v36 = v34;
      *(_DWORD *)buf = 136446210;
      v105 = v36;
      _os_log_impl(&dword_2126F8000, v35, OS_LOG_TYPE_DEBUG, "%{public}s: skip adding generic identity to manifest", buf, 0xCu);
    }
    v95 = 0;
    v92 = 0;
    v93 = 0;
  }
  else
  {
    v27 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 72));
    v28 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 76));
    v29 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 80));
    v95 = v27;
    xpc_dictionary_set_value(v25, "ApBoardID", v27);
    v93 = v28;
    xpc_dictionary_set_value(v25, "ApChipID", v28);
    v92 = v29;
    xpc_dictionary_set_value(v25, "ApSecurityDomain", v29);
    v30 = *(const char **)(a1 + 16);
    v31 = *__error();
    v32 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = "[anonymous]";
      if (v30)
        v33 = v30;
      *(_DWORD *)buf = 136446466;
      v105 = v33;
      v106 = 2080;
      v107 = v26;
      _os_log_impl(&dword_2126F8000, v32, OS_LOG_TYPE_DEBUG, "%{public}s: identity: %s", buf, 0x16u);
    }
  }
  *__error() = v31;
  v37 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 216);
  if (v37)
  {
    v38 = xpc_int64_create(*(unsigned int *)(v37 + 40));
    v39 = xpc_string_create(*(const char **)(v37 + 56));
    v40 = xpc_string_create(*(const char **)(v37 + 48));
    v91 = v38;
    xpc_dictionary_set_value(v25, "Cryptex1,NonceDomain", v38);
    v90 = v39;
    xpc_dictionary_set_value(v25, "Cryptex1,PreauthorizationVersion", v39);
    object = v40;
    xpc_dictionary_set_value(v25, "Cryptex1,Version", v40);
    xpc_dictionary_set_BOOL(v25, "Cryptex1,UseProductClass", *(_BYTE *)(v37 + 65));
    if ((BYTE8(applier) & 4) != 0)
    {
      v89 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 84));
      xpc_dictionary_set_value(v25, "Cryptex1,ChipID", v89);
      if ((BYTE8(applier) & 2) != 0)
        goto LABEL_47;
    }
    else
    {
      v89 = 0;
      if ((BYTE8(applier) & 2) != 0)
      {
LABEL_47:
        v41 = xpc_int64_create(*(unsigned int *)(a2 + 92));
        v42 = xpc_int64_create(*(unsigned int *)(a2 + 88));
        v43 = xpc_string_create_with_format("%#x", *(_DWORD *)(a2 + 96));
        v87 = v42;
        xpc_dictionary_set_value(v25, "Cryptex1,Type", v42);
        v86 = v41;
        xpc_dictionary_set_value(v25, "Cryptex1,SubType", v41);
        v85 = v43;
        xpc_dictionary_set_value(v25, "Cryptex1,ProductClass", v43);
        goto LABEL_51;
      }
    }
    v86 = 0;
    v87 = 0;
    v85 = 0;
  }
  else
  {
    v89 = 0;
    v90 = 0;
    v86 = 0;
    v87 = 0;
    v85 = 0;
    v91 = 0;
    object = 0;
  }
LABEL_51:
  if (cryptex_core_get_info_asset())
  {
    cryptex_core_parse_info_asset();
    if (v99)
      xpc_dictionary_set_BOOL(v25, "Cryptex1,DataOnly", 1);
  }
  v96 = v25;
  v94 = v26;
  if ((*(_BYTE *)(a2 + 40) & 1) != 0)
  {
    v50 = *(const char **)(a1 + 16);
    v46 = *__error();
    v51 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      v52 = "[anonymous]";
      if (v50)
        v52 = v50;
      *(_DWORD *)buf = 136446210;
      v105 = v52;
      _os_log_impl(&dword_2126F8000, v51, OS_LOG_TYPE_DEBUG, "%{public}s: skip adding generic variant to manifest", buf, 0xCu);
    }
    v83 = 0;
    v84 = 0;
  }
  else
  {
    v44 = xpc_dictionary_create_empty();
    v83 = xpc_string_create(*(const char **)(a2 + 16));
    xpc_dictionary_set_value(v44, "Variant", v83);
    v84 = v44;
    xpc_dictionary_set_value(v25, "Info", v44);
    v45 = *(const char **)(a1 + 16);
    v46 = *__error();
    v47 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v48 = "[anonymous]";
      v49 = *(char **)(a2 + 16);
      if (v45)
        v48 = v45;
      *(_DWORD *)buf = 136446466;
      v105 = v48;
      v106 = 2080;
      v107 = v49;
      _os_log_impl(&dword_2126F8000, v47, OS_LOG_TYPE_DEBUG, "%{public}s: variant: %s", buf, 0x16u);
    }
  }
  *__error() = v46;
  xdict = xpc_dictionary_create_empty();
  for (j = 0; j != 96; j += 8)
  {
    v54 = xpc_dictionary_create_empty();
    v55 = xpc_dictionary_create_empty();
    v56 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + j + 64);
    if (!v56)
    {
      v67 = *(const char **)(a2 + 16);
      v59 = *__error();
      v68 = *(NSObject **)(a2 + 32);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v69 = "[anonymous]";
        if (v67)
          v69 = v67;
        v70 = *(char **)(*(_QWORD *)(MEMORY[0x24BEDBAB8] + j) + 40);
        *(_DWORD *)buf = 136446466;
        v105 = v69;
        v106 = 2080;
        v107 = v70;
        v71 = v68;
        v72 = "%{public}s: no asset of type: %s";
        goto LABEL_81;
      }
LABEL_82:
      *__error() = v59;
      goto LABEL_83;
    }
    v57 = **(_QWORD **)(v56 + 8);
    v58 = *(const char **)(a1 + 16);
    v59 = *__error();
    v60 = *(NSObject **)(a1 + 32);
    v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG);
    if ((v57 & 0x10) != 0)
    {
      if (v61)
      {
        v73 = "[anonymous]";
        if (v58)
          v73 = v58;
        v74 = *(char **)(*(_QWORD *)(v56 + 8) + 40);
        *(_DWORD *)buf = 136446466;
        v105 = v73;
        v106 = 2080;
        v107 = v74;
        v71 = v60;
        v72 = "%{public}s: skip adding internal asset %s";
LABEL_81:
        _os_log_impl(&dword_2126F8000, v71, OS_LOG_TYPE_DEBUG, v72, buf, 0x16u);
        goto LABEL_82;
      }
      goto LABEL_82;
    }
    if (v61)
    {
      v62 = "[anonymous]";
      if (v58)
        v62 = v58;
      v63 = *(char **)(*(_QWORD *)(v56 + 8) + 40);
      v64 = *(_QWORD *)(v56 + 24);
      *(_DWORD *)buf = 136446722;
      v105 = v62;
      v106 = 2080;
      v107 = v63;
      v108 = 2080;
      v109 = v64;
      _os_log_impl(&dword_2126F8000, v60, OS_LOG_TYPE_DEBUG, "%{public}s: adding asset: type = %s, name = %s", buf, 0x20u);
    }
    *__error() = v59;
    v65 = _cryptex_bundle_default_asset_path(a2, v56);
    v66 = xpc_string_create(v65);
    xpc_dictionary_set_value(v55, "Path", v66);
    xpc_dictionary_set_value(v54, "Info", v55);
    xpc_dictionary_set_value(xdict, *(const char **)(*(_QWORD *)(MEMORY[0x24BEDBAB8] + j) + 48), v54);
    free(v65);
    if (v66)
      os_release(v66);
LABEL_83:
    if (v55)
      os_release(v55);
    if (v54)
      os_release(v54);
  }
  xpc_dictionary_set_value(v96, "Manifest", xdict);
  v75 = (char *)xpc_copy_clean_description();
  v76 = *(const char **)(a1 + 16);
  v77 = *__error();
  v78 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
  {
    v79 = "[anonymous]";
    if (v76)
      v79 = v76;
    *(_DWORD *)buf = 136446466;
    v105 = v79;
    v106 = 2080;
    v107 = v75;
    _os_log_impl(&dword_2126F8000, v78, OS_LOG_TYPE_DEBUG, "%{public}s: adding build identity:\n%s", buf, 0x16u);
  }
  *__error() = v77;
  v80 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 80), "BuildIdentities");
  xpc_array_append_value(v80, v96);
  free(v94);
  free(v75);
  if (object)
    os_release(object);
  if (v90)
    os_release(v90);
  if (v91)
    os_release(v91);
  if (v85)
    os_release(v85);
  if (v86)
    os_release(v86);
  if (v87)
    os_release(v87);
  if (v89)
    os_release(v89);
  if (v92)
    os_release(v92);
  if (v93)
    os_release(v93);
  if (v95)
    os_release(v95);
  if (xdict)
    os_release(xdict);
  if (v83)
    os_release(v83);
  if (v84)
    os_release(v84);
  if (v96)
    os_release(v96);
  v81 = _cryptex_list_elm_new((void *)a2);
  *v81 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v81;
  _cryptex_bundle_add_cryptex_assets((_QWORD *)a1, a2);
  return 1;
}

void _cryptex_bundle_add_cryptex_assets(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  const char *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  char **v15;
  const char *v16;
  int v17;
  NSObject *v18;
  char *v19;
  const char *v20;
  char *__s2;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v4 = 0;
  v5 = MEMORY[0x24BEDBAB8];
  v27 = *MEMORY[0x24BDAC8D0];
  do
  {
    v6 = *(_QWORD *)(v5 + 8 * v4);
    if ((*(_BYTE *)v6 & 0x10) != 0)
    {
      v16 = (const char *)a1[2];
      v17 = *__error();
      v18 = a1[4];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(char **)(v6 + 40);
        v20 = "[anonymous]";
        if (v16)
          v20 = v16;
        *(_DWORD *)buf = 136446466;
        v24 = v20;
        v25 = 2080;
        v26 = v19;
        _os_log_impl(&dword_2126F8000, v18, OS_LOG_TYPE_DEBUG, "%{public}s: skip adding internal asset %s", buf, 0x16u);
      }
      *__error() = v17;
    }
    else
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v4 + 64);
      if (v7)
      {
        __s2 = 0;
        if (asprintf(&__s2, "__%s_%s", *(const char **)(a2 + 16), *(const char **)(*(_QWORD *)(v7 + 8) + 40)) < 0)
          _cryptex_bundle_add_cryptex_assets_cold_1(&v22, buf);
        v8 = __s2;
        v9 = a1[9];
        if (v9)
        {
          while (strcmp(*(const char **)v9, v8))
          {
            v9 = *(_QWORD *)(v9 + 16);
            if (!v9)
              goto LABEL_8;
          }
        }
        else
        {
LABEL_8:
          v10 = _cryptex_bundle_default_asset_path(a2, v7);
          v11 = (const char *)a1[2];
          v12 = *__error();
          v13 = a1[4];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446466;
            v14 = "[anonymous]";
            if (v11)
              v14 = v11;
            v24 = v14;
            v25 = 2080;
            v26 = v8;
            _os_log_impl(&dword_2126F8000, v13, OS_LOG_TYPE_DEBUG, "%{public}s: adding cryptex bundle asset: %s", buf, 0x16u);
          }
          *__error() = v12;
          v15 = _cryptex_bundle_asset_new(v7, v8, v10);
          v15[2] = (char *)a1[9];
          a1[9] = v15;
          free(v10);
        }
        free(v8);
      }
    }
    ++v4;
  }
  while (v4 != 12);
}

uint64_t cryptex_bundle_write2(uint64_t a1, _DWORD *a2, CFTypeRef *a3)
{
  _DWORD *v5;
  int *v6;
  __CFError *v7;
  CFErrorRef v8;
  const char *v9;
  const char *v10;
  CFErrorRef v11;
  const char *v12;
  const char *v13;
  char *v14;
  int v15;
  const char *v16;
  char *v17;
  CFErrorRef Error;
  CFErrorRef v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int v25;
  BOOL v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v32;
  const char *v33;
  int v34;
  const char *v35;
  int v36;
  const char *v37;
  int v38;
  const char *v39;
  char *v40;
  int v41;
  CFIndex v42;
  char *v43;
  char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  char v49[4];
  const char *v50;
  __int16 v51;
  int v52;
  int v53;
  const char *v54;
  __int16 v55;
  char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = (_DWORD *)(a1 + 48);
  v47 = *(_QWORD *)(a1 + 48);
  v6 = (int *)(a1 + 52);
  if ((*a2 & 0x80000000) != 0)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v10 = *(const char **)(a1 + 16);
      if (!v10)
        v10 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v10;
    }
    else
    {
      v16 = *(const char **)(a1 + 16);
      if (!v16)
        v16 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v16;
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_write2", "bundle.c", 1461, "com.apple.security.cryptex", 11, 0, v17);
    free(v17);
    v8 = 0;
    goto LABEL_52;
  }
  v7 = (__CFError *)_cryptex_bundle_init(a1);
  if (v7)
  {
    v8 = v7;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v9 = *(const char **)(a1 + 16);
      if (!v9)
        v9 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v9;
    }
    else
    {
      v13 = *(const char **)(a1 + 16);
      if (!v13)
        v13 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v13;
    }
    v14 = (char *)_os_log_send_and_compose_impl();
    v15 = 1470;
    goto LABEL_51;
  }
  *(_DWORD *)(a1 + 48) = claimfd_np();
  v11 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_restore, 512, 0x1EDu, v6);
  if (v11)
  {
    v8 = v11;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v12 = *(const char **)(a1 + 16);
      if (!v12)
        v12 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v12;
    }
    else
    {
      v21 = *(const char **)(a1 + 16);
      if (!v21)
        v21 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v21;
    }
    v14 = (char *)_os_log_send_and_compose_impl();
    v15 = 1481;
    goto LABEL_51;
  }
  v19 = _cryptex_bundle_write_manifest(a1);
  if (v19)
  {
    v8 = v19;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v20 = *(const char **)(a1 + 16);
      if (!v20)
        v20 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v20;
    }
    else
    {
      v28 = *(const char **)(a1 + 16);
      if (!v28)
        v28 = "[anonymous]";
      *(_DWORD *)v49 = 136446210;
      v50 = v28;
    }
    v14 = (char *)_os_log_send_and_compose_impl();
    v15 = 1490;
    goto LABEL_51;
  }
  v22 = *(_QWORD *)(a1 + 72);
  if (!v22)
  {
LABEL_46:
    v8 = 0;
    goto LABEL_101;
  }
  bzero(v49, 0x400uLL);
  while (1)
  {
    v23 = dirname_r(*(const char **)(v22 + 8), v49);
    if (!v23)
    {
      v32 = *__error();
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v33 = *(const char **)(a1 + 16);
        if (!v33)
          v33 = "[anonymous]";
      }
      else
      {
        v33 = *(const char **)(a1 + 16);
        if (!v33)
          v33 = "[anonymous]";
      }
      v53 = 136446466;
      v54 = v33;
      v55 = 1024;
      LODWORD(v56) = v32;
      v40 = (char *)_os_log_send_and_compose_impl();
      v41 = 1081;
      v42 = v32;
      goto LABEL_95;
    }
    v24 = v23;
    v25 = mkpathat_np(*v6, v23, 0x1EDu);
    if (v25)
      v26 = v25 == 17;
    else
      v26 = 1;
    if (!v26)
    {
      v38 = v25;
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v39 = *(const char **)(a1 + 16);
        v53 = 136446722;
        if (!v39)
          v39 = "[anonymous]";
        v54 = v39;
        v55 = 2080;
        v56 = v24;
        v57 = 1024;
        v58 = v38;
      }
      else
      {
        v45 = *(const char **)(a1 + 16);
        if (!v45)
          v45 = "[anonymous]";
        v53 = 136446722;
        v54 = v45;
        v55 = 2080;
        v56 = v24;
        v57 = 1024;
        v58 = v25;
      }
      v40 = (char *)_os_log_send_and_compose_impl();
      v42 = v38;
      v41 = 1092;
LABEL_95:
      v8 = createError("_cryptex_bundle_write_assets", "bundle.c", v41, "com.apple.security.cryptex.posix", v42, 0, v40);
      free(v40);
      goto LABEL_96;
    }
    v27 = openat(*v6, *(const char **)(v22 + 8), 514, 438);
    if (v27 < 0)
    {
      v34 = *__error();
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v35 = *(const char **)(a1 + 16);
        if (!v35)
          v35 = "[anonymous]";
      }
      else
      {
        v35 = *(const char **)(a1 + 16);
        if (!v35)
          v35 = "[anonymous]";
      }
      v53 = 136446466;
      v54 = v35;
      v55 = 1024;
      LODWORD(v56) = v34;
      v43 = (char *)_os_log_send_and_compose_impl();
      v8 = createError("_cryptex_bundle_write_assets", "bundle.c", 1101, "com.apple.security.cryptex.posix", v34, 0, v43);
      free(v43);
      if (v27 != -1)
        goto LABEL_89;
      goto LABEL_96;
    }
    if (lseek(*(_DWORD *)(*(_QWORD *)(v22 + 24) + 16), 0, 0) == -1)
      cryptex_bundle_write2_cold_1(&v48, &v53);
    if (fcopyfile(*(_DWORD *)(*(_QWORD *)(v22 + 24) + 16), v27, 0, 0xFu) < 0)
      break;
    if (close(v27) == -1)
      goto LABEL_90;
    v22 = *(_QWORD *)(v22 + 16);
    if (!v22)
      goto LABEL_46;
  }
  v36 = *__error();
  if (*(_QWORD *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v37 = *(const char **)(a1 + 16);
    if (!v37)
      v37 = "[anonymous]";
  }
  else
  {
    v37 = *(const char **)(a1 + 16);
    if (!v37)
      v37 = "[anonymous]";
  }
  v53 = 136446466;
  v54 = v37;
  v55 = 1024;
  LODWORD(v56) = v36;
  v44 = (char *)_os_log_send_and_compose_impl();
  v8 = createError("_cryptex_bundle_write_assets", "bundle.c", 1113, "com.apple.security.cryptex.posix", v36, 0, v44);
  free(v44);
LABEL_89:
  if (close(v27) == -1)
LABEL_90:
    _cryptex_bundle_new_asset_from_object_cold_1(&v48, &v53);
LABEL_96:
  if (!v8)
  {
LABEL_101:
    Error = 0;
    goto LABEL_52;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v46 = *(const char **)(a1 + 16);
    if (!v46)
      v46 = "[anonymous]";
  }
  else
  {
    v46 = *(const char **)(a1 + 16);
    if (!v46)
      v46 = "[anonymous]";
  }
  *(_DWORD *)v49 = 136446466;
  v50 = v46;
  v51 = 1024;
  v52 = -1;
  v14 = (char *)_os_log_send_and_compose_impl();
  v15 = 1501;
LABEL_51:
  Error = createError("cryptex_bundle_write2", "bundle.c", v15, "com.apple.security.cryptex", 7, v8, v14);
  free(v14);
LABEL_52:
  v29 = v47;
  if (*v5 != (_DWORD)v47)
  {
    close_drop_np();
    close_drop_optional_np();
    v29 = v47;
  }
  *(_QWORD *)v5 = v29;
  if (a3 && Error)
  {
    *a3 = CFRetain(Error);
    goto LABEL_58;
  }
  if (Error)
  {
LABEL_58:
    CFRelease(Error);
    v30 = 0;
    if (v8)
      goto LABEL_59;
  }
  else
  {
    v30 = 1;
    if (v8)
LABEL_59:
      CFRelease(v8);
  }
  return v30;
}

CFErrorRef _cryptex_bundle_open(uint64_t a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  int v6;
  int v10;
  int v11;
  int v12;
  int v13;
  CFErrorRef Error;
  int v15;
  CFIndex v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char *v22;
  const char *v23;
  uint64_t v24;
  char *v25;
  int v27;
  uint64_t v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = *(_DWORD *)(a1 + *(_QWORD *)(a2 + 8));
  if (v6 < 0)
    _cryptex_bundle_open_cold_2(&v28, &v29);
  v10 = ((*(_DWORD *)a2 & 1) << 20) | a3;
  if ((a3 & 0x200) == 0 || (v10 & 0x100000) == 0)
    goto LABEL_9;
  v11 = mkdirat(v6, *(const char **)(a2 + 16), a4);
  if ((v11 & 0x80000000) == 0)
    *__error() = 0;
  v12 = *__error();
  if (!v12 || v12 == 17)
  {
    v10 &= ~0x200u;
LABEL_9:
    v13 = openat(v6, *(const char **)(a2 + 16), v10, a4);
    v27 = v13;
    if (v13 < 0)
    {
      v15 = v13;
      v16 = *__error();
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        if (*(_QWORD *)(a1 + 16))
          v17 = *(const char **)(a1 + 16);
        else
          v17 = "[anonymous]";
      }
      else if (*(_QWORD *)(a1 + 16))
      {
        v17 = *(const char **)(a1 + 16);
      }
      else
      {
        v17 = "[anonymous]";
      }
      v20 = *(_QWORD *)(a2 + 16);
      v21 = *__error();
      v29 = 136446722;
      v30 = v17;
      v31 = 2080;
      v32 = v20;
      v33 = 1024;
      v34 = v21;
      v22 = (char *)_os_log_send_and_compose_impl();
      Error = createError("_cryptex_bundle_open", "bundle.c", 1220, "com.apple.security.cryptex.posix", v16, 0, v22);
      free(v22);
    }
    else
    {
      Error = 0;
      *a5 = claimfd_np();
      v15 = v27;
    }
    if (v15 != -1 && close(v15) == -1)
      _cryptex_bundle_new_asset_from_object_cold_1(&v28, &v29);
    return Error;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v18 = *(const char **)(a1 + 16);
    v19 = *(_QWORD *)(a2 + 16);
    v29 = 136446722;
    if (!v18)
      v18 = "[anonymous]";
    v30 = v18;
    v31 = 2080;
    v32 = v19;
    v33 = 1024;
    v34 = v11;
  }
  else
  {
    v23 = *(const char **)(a1 + 16);
    if (!v23)
      v23 = "[anonymous]";
    v24 = *(_QWORD *)(a2 + 16);
    v29 = 136446722;
    v30 = v23;
    v31 = 2080;
    v32 = v24;
    v33 = 1024;
    v34 = v11;
  }
  v25 = (char *)_os_log_send_and_compose_impl();
  Error = createError("_cryptex_bundle_open", "bundle.c", 1210, "com.apple.security.cryptex.posix", v11, 0, v25);
  free(v25);
  return Error;
}

CFErrorRef _cryptex_bundle_write_manifest(uint64_t a1)
{
  const void *v2;
  const __CFData *v3;
  const __CFData *v4;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFErrorRef v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  const __CFString *v13;
  const __CFString *v14;
  char *v15;
  const char *v16;
  int v17;
  int v18;
  int v19;
  const char *v20;
  const char *v21;
  char *v22;
  CFErrorRef v23;
  const char *v24;
  char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  char *v29;
  const char *v30;
  char *v31;
  int __fd;
  CFErrorRef error;
  int v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  _OWORD v41[3];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  error = 0;
  __fd = -1;
  v42 = 0;
  memset(v41, 0, sizeof(v41));
  v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v2)
  {
    v9 = xpc_copy_debug_description();
    v10 = (void *)v9;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v11 = *(const char **)(a1 + 16);
      v35 = 136446722;
      if (v11)
        v12 = v11;
      else
        v12 = "[anonymous]";
      v36 = v12;
      v37 = 2080;
      v38 = (uint64_t)v10;
      v39 = 1024;
      v40 = 214;
    }
    else
    {
      v21 = "[anonymous]";
      if (*(_QWORD *)(a1 + 16))
        v21 = *(const char **)(a1 + 16);
      v35 = 136446722;
      v36 = v21;
      v37 = 2080;
      v38 = v9;
      v39 = 1024;
      v40 = 214;
    }
    v22 = (char *)_os_log_send_and_compose_impl();
    v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 373, "com.apple.security.cryptex.posix", 214, 0, v22);
    free(v22);
    free(v10);
    goto LABEL_39;
  }
  v3 = CFPropertyListCreateData(0, v2, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (!v3)
  {
    v13 = CFErrorCopyFailureReason(error);
    v14 = v13;
    if (v13)
    {
      v15 = _CFStringCopyUTF8String(v13);
      v16 = v15;
    }
    else
    {
      v15 = 0;
      v16 = "unknown failure";
    }
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v26 = *(const char **)(a1 + 16);
      v35 = 136446722;
      if (v26)
        v27 = v26;
      else
        v27 = "[anonymous]";
      v36 = v27;
      v37 = 2080;
      v38 = (uint64_t)v16;
      v39 = 1024;
      v40 = 222;
    }
    else
    {
      v28 = "[anonymous]";
      if (*(_QWORD *)(a1 + 16))
        v28 = *(const char **)(a1 + 16);
      v35 = 136446722;
      v36 = v28;
      v37 = 2080;
      v38 = (uint64_t)v16;
      v39 = 1024;
      v40 = 222;
    }
    v29 = (char *)_os_log_send_and_compose_impl();
    v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 393, "com.apple.security.cryptex.posix", 222, 0, v29);
    free(v29);
    free(v15);
    if (v14)
      CFRelease(v14);
LABEL_39:
    buff_destroy(v41);
    v4 = 0;
    v7 = 0;
    goto LABEL_47;
  }
  v4 = v3;
  BytePtr = CFDataGetBytePtr(v3);
  Length = CFDataGetLength(v4);
  buff_init_signed(v41, 0, 0, (uint64_t)BytePtr, Length);
  v7 = _cryptex_bundle_open(a1, (uint64_t)&_cryptex_bundle_object_manifest, 513, 0x1B6u, &__fd);
  if (v7)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v8 = *(const char **)(a1 + 16);
      if (!v8)
        v8 = "[anonymous]";
      v35 = 136446210;
      v36 = v8;
    }
    else
    {
      v24 = *(const char **)(a1 + 16);
      if (!v24)
        v24 = "[anonymous]";
      v35 = 136446210;
      v36 = v24;
    }
    v25 = (char *)_os_log_send_and_compose_impl();
    v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 406, "com.apple.security.cryptex", 6, v7, v25);
    free(v25);
    v17 = __fd;
  }
  else
  {
    v17 = __fd;
    v18 = _write_file(__fd, (uint64_t)v41);
    if (v18)
    {
      v19 = v18;
      if (*(_QWORD *)(a1 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
        v20 = *(const char **)(a1 + 16);
        if (!v20)
          v20 = "[anonymous]";
        v35 = 136446466;
        v36 = v20;
        v37 = 1024;
        LODWORD(v38) = v19;
      }
      else
      {
        v30 = *(const char **)(a1 + 16);
        if (!v30)
          v30 = "[anonymous]";
        v35 = 136446466;
        v36 = v30;
        v37 = 1024;
        LODWORD(v38) = v18;
      }
      v31 = (char *)_os_log_send_and_compose_impl();
      v23 = createError("_cryptex_bundle_write_manifest", "bundle.c", 413, "com.apple.security.cryptex.posix", v19, 0, v31);
      free(v31);
    }
    else
    {
      v23 = 0;
    }
  }
  buff_destroy(v41);
  if (v17 != -1 && close(v17) == -1)
    _cryptex_bundle_new_asset_from_object_cold_1(&v35, v41);
LABEL_47:
  if (error)
    CFRelease(error);
  if (v2)
    CFRelease(v2);
  if (v4)
    CFRelease(v4);
  if (v7)
    CFRelease(v7);
  return v23;
}

uint64_t cryptex_bundle_copy_build_manifest2(uint64_t a1, xpc_object_t *a2, CFTypeRef *a3)
{
  void *v6;
  const void *v7;
  uint64_t v8;
  char *v9;
  CFErrorRef Error;

  v6 = _cryptex_bundle_init(a1);
  if (v6)
  {
    v7 = v6;
    if (*(_QWORD *)(a1 + 32))
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v9 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_copy_build_manifest2", "bundle.c", 1533, "com.apple.security.cryptex", 6, v7, v9);
    free(v9);
    if (a3 && Error)
    {
      *a3 = CFRetain(Error);
    }
    else if (!Error)
    {
      v8 = 1;
      goto LABEL_10;
    }
    CFRelease(Error);
    v8 = 0;
LABEL_10:
    CFRelease(v7);
    return v8;
  }
  *a2 = xpc_retain(*(xpc_object_t *)(a1 + 80));
  return 1;
}

uint64_t cryptex_bundle_update_build_manifest2(uint64_t a1, void *a2, int a3, CFTypeRef *a4)
{
  void *v6;
  CFErrorRef v9;
  CFErrorRef v10;
  uint64_t v11;
  char *v12;
  CFErrorRef Error;

  v6 = *(void **)(a1 + 80);
  if (v6)
  {
    if (v6 != a2)
    {
      xpc_release(v6);
      *(_QWORD *)(a1 + 80) = a2;
    }
    if (!a3)
      return 1;
    v9 = _cryptex_bundle_write_manifest(a1);
    if (!v9)
      return 1;
    v10 = v9;
    if (*(_QWORD *)(a1 + 32))
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v12 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_update_build_manifest2", "bundle.c", 1576, "com.apple.security.cryptex", 7, v10, v12);
  }
  else
  {
    if (*(_QWORD *)(a1 + 32))
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
    v12 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_bundle_update_build_manifest2", "bundle.c", 1561, "com.apple.security.cryptex", 6, 0, v12);
    v10 = 0;
  }
  free(v12);
  if (a4 && Error)
  {
    *a4 = CFRetain(Error);
  }
  else if (!Error)
  {
    v11 = 1;
    if (!v10)
      return v11;
    goto LABEL_18;
  }
  CFRelease(Error);
  v11 = 0;
  if (v10)
LABEL_18:
    CFRelease(v10);
  return v11;
}

CFIndex cryptex_bundle_copy_cryptex(uint64_t a1, _OWORD *a2, const char *a3, void **a4)
{
  __int128 v4;
  CFIndex TopLevelPosixError;
  _OWORD v7[3];
  CFTypeRef v8;

  v8 = 0;
  v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  v7[2] = a2[2];
  if ((cryptex_bundle_copy_cryptex2(a1, v7, a3, a4, &v8) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)v8);
  if (v8)
    CFRelease(v8);
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_copy_cryptex_for_chip(uint64_t a1, uint64_t a2, const char *a3, void **a4)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_bundle_copy_cryptex_for_chip2(a1, a2, a3, a4, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_set_cryptex(uint64_t a1, uint64_t a2)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_bundle_set_cryptex2(a1, a2, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_write(uint64_t a1, _DWORD *a2)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_bundle_write2(a1, a2, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_copy_build_manifest(uint64_t a1, xpc_object_t *a2)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_bundle_copy_build_manifest2(a1, a2, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

CFIndex cryptex_bundle_update_build_manifest(uint64_t a1, void *a2, int a3)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_bundle_update_build_manifest2(a1, a2, a3, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

uint64_t _cryptex_populate_cryptex1_properties(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v6;
  void *v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  int v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  int v34;
  NSObject *v35;
  const char *v36;
  xpc_object_t v37;
  void *v38;
  xpc_object_t v39;
  void *v40;
  const char *v41;
  int v42;
  NSObject *v43;
  const char *v44;
  const char *v45;
  int v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  int v52;
  NSObject *v53;
  const char *v54;
  void *object;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = _xpc_plist_value_copy((uint64_t)&_cryptex1_nonce_domain, a3);
  if (v6)
  {
    v7 = v6;
    if ((unint64_t)xpc_int64_get_value(v6) >> 32)
    {
      v8 = *(const char **)(a1 + 16);
      v9 = *__error();
      v10 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = "[anonymous]";
        if (v8)
          v11 = v8;
        *(_DWORD *)buf = 136446722;
        v58 = v11;
        v59 = 2080;
        v60 = "Cryptex1,NonceDomain";
        v61 = 1024;
        v62 = 84;
        _os_log_impl(&dword_2126F8000, v10, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v9;
      v12 = 84;
      goto LABEL_64;
    }
    v17 = _xpc_plist_value_copy((uint64_t)&_cryptex1_version, a3);
    if (!v17)
    {
      v25 = *(const char **)(a1 + 16);
      v26 = *__error();
      v27 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = "[anonymous]";
        if (v25)
          v28 = v25;
        *(_DWORD *)buf = 136446722;
        v58 = v28;
        v59 = 2080;
        v60 = "Cryptex1,Version";
        v61 = 1024;
        v62 = 22;
        _os_log_impl(&dword_2126F8000, v27, OS_LOG_TYPE_ERROR, "%{public}s: Manifest missing required key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v26;
      v12 = 22;
      goto LABEL_64;
    }
    v18 = v17;
    if (!xpc_string_get_string_ptr(v17))
    {
      v29 = *(const char **)(a1 + 16);
      v30 = *__error();
      v31 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = "[anonymous]";
        if (v29)
          v32 = v29;
        *(_DWORD *)buf = 136446722;
        v58 = v32;
        v59 = 2080;
        v60 = "Cryptex1,Version";
        v61 = 1024;
        v62 = 22;
        _os_log_impl(&dword_2126F8000, v31, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v30;
      v12 = 22;
      goto LABEL_63;
    }
    v19 = _xpc_plist_value_copy((uint64_t)&_cryptex1_styp, a3);
    object = v19;
    if (v19)
    {
      if ((unint64_t)xpc_int64_get_value(v19) >> 32)
      {
        v20 = *(const char **)(a1 + 16);
        v21 = *__error();
        v22 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = "[anonymous]";
          if (v20)
            v23 = v20;
          *(_DWORD *)buf = 136446722;
          v58 = v23;
          v59 = 2080;
          v60 = "Cryptex1,SubType";
          v61 = 1024;
          v62 = 22;
          _os_log_impl(&dword_2126F8000, v22, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v21;
        v12 = 22;
        v24 = object;
LABEL_62:
        os_release(v24);
LABEL_63:
        os_release(v18);
LABEL_64:
        os_release(v7);
        return v12;
      }
    }
    else
    {
      v33 = *(const char **)(a1 + 16);
      v34 = *__error();
      v35 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = "[anonymous]";
        if (v33)
          v36 = v33;
        *(_DWORD *)buf = 136446466;
        v58 = v36;
        v59 = 1024;
        LODWORD(v60) = 0;
        _os_log_impl(&dword_2126F8000, v35, OS_LOG_TYPE_INFO, "%{public}s: Assuming default SubType: %u", buf, 0x12u);
      }
      *__error() = v34;
    }
    v37 = _xpc_plist_value_copy((uint64_t)&_cryptex1_preauthorization_version, a3);
    if (v37)
    {
      v38 = v37;
      if (xpc_string_get_string_ptr(v37))
      {
        v39 = _xpc_plist_value_copy((uint64_t)&_cryptex1_use_product_class, a3);
        v40 = v39;
        if (v39)
          xpc_BOOL_get_value(v39);
        v49 = cryptex_core_cx1_properties_create();
        if (v49)
        {
          v50 = (void *)v49;
          cryptex_core_set_cryptex1_properties();
          os_release(v50);
          v12 = 0;
        }
        else
        {
          v51 = *(const char **)(a2 + 16);
          v52 = *__error();
          v53 = *(NSObject **)(a2 + 32);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v54 = "[anonymous]";
            if (v51)
              v54 = v51;
            *(_DWORD *)buf = 136446466;
            v58 = v54;
            v59 = 1024;
            LODWORD(v60) = 12;
            _os_log_impl(&dword_2126F8000, v53, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create Cryptex1 properties.: %{darwin.errno}d", buf, 0x12u);
          }
          *__error() = v52;
          v12 = 12;
        }
        if (v40)
          os_release(v40);
      }
      else
      {
        v45 = *(const char **)(a1 + 16);
        v46 = *__error();
        v47 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = "[anonymous]";
          if (v45)
            v48 = v45;
          *(_DWORD *)buf = 136446722;
          v58 = v48;
          v59 = 2080;
          v60 = "Cryptex1,PreauthorizationVersion";
          v61 = 1024;
          v62 = 22;
          _os_log_impl(&dword_2126F8000, v47, OS_LOG_TYPE_ERROR, "%{public}s: Manifest value is invalid at key: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v46;
        v12 = 22;
      }
      os_release(v38);
    }
    else
    {
      v41 = *(const char **)(a1 + 16);
      v42 = *__error();
      v43 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = "[anonymous]";
        if (v41)
          v44 = v41;
        *(_DWORD *)buf = 136446722;
        v58 = v44;
        v59 = 2080;
        v60 = "Cryptex1,PreauthorizationVersion";
        v61 = 1024;
        v62 = 22;
        _os_log_impl(&dword_2126F8000, v43, OS_LOG_TYPE_ERROR, "%{public}s: Manifest missing required key: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v42;
      v12 = 22;
    }
    v24 = object;
    if (!object)
      goto LABEL_63;
    goto LABEL_62;
  }
  v13 = *(const char **)(a1 + 16);
  v14 = *__error();
  v15 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = "[anonymous]";
    if (v13)
      v16 = v13;
    *(_DWORD *)buf = 136446722;
    v58 = v16;
    v59 = 2080;
    v60 = "Cryptex1,NonceDomain";
    v61 = 1024;
    v62 = 22;
    _os_log_impl(&dword_2126F8000, v15, OS_LOG_TYPE_ERROR, "%{public}s: Manifest missing required key: %s: %{darwin.errno}d", buf, 0x1Cu);
  }
  *__error() = v14;
  return 22;
}

uint64_t ___cryptex_bundle_manifest_remove_build_identity_block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  xpc_object_t value;
  const char *string;
  const char *v7;
  const char *v8;
  const char *v9;
  int v10;
  const char *v11;
  int v12;
  NSObject *v13;
  int v14;
  const char *v15;
  int v16;
  const char *v17;
  int v18;
  int v19;
  const char *v20;
  int v21;
  uint64_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  value = xpc_dictionary_get_value(xdict, "Info");
  string = xpc_dictionary_get_string(value, "Variant");
  v7 = xpc_dictionary_get_string(xdict, "ApBoardID");
  v8 = xpc_dictionary_get_string(xdict, "ApChipID");
  v9 = xpc_dictionary_get_string(xdict, "ApSecurityDomain");
  v10 = _strtou32(v7, 0, 0);
  if (*__error())
  {
    v11 = *(const char **)(*(_QWORD *)(a1 + 32) + 16);
    v12 = *__error();
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (!v11)
        v11 = "[anonymous]";
      v14 = *__error();
      v24 = 136446722;
      v25 = v11;
      v26 = 2080;
      v27 = v7;
      v28 = 1024;
      v29 = v14;
      v15 = "%{public}s: unable to convert to uint for BORD: %s: %{darwin.errno}d";
LABEL_16:
      _os_log_impl(&dword_2126F8000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v24, 0x1Cu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v16 = _strtou32(v8, 0, 0);
  if (*__error())
  {
    v17 = *(const char **)(*(_QWORD *)(a1 + 32) + 16);
    v12 = *__error();
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (!v17)
        v17 = "[anonymous]";
      v18 = *__error();
      v24 = 136446722;
      v25 = v17;
      v26 = 2080;
      v27 = v8;
      v28 = 1024;
      v29 = v18;
      v15 = "%{public}s: unable to convert to uint for CHIP: %s: %{darwin.errno}d";
      goto LABEL_16;
    }
LABEL_17:
    *__error() = v12;
    return 1;
  }
  v19 = _strtou32(v9, 0, 0);
  if (*__error())
  {
    v20 = *(const char **)(*(_QWORD *)(a1 + 32) + 16);
    v12 = *__error();
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (!v20)
        v20 = "[anonymous]";
      v21 = *__error();
      v24 = 136446722;
      v25 = v20;
      v26 = 2080;
      v27 = v9;
      v28 = 1024;
      v29 = v21;
      v15 = "%{public}s: unable to convert to uint for SDOM: %s: %{darwin.errno}d";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v23 = *(_QWORD *)(a1 + 40);
  if (strcmp(*(const char **)(v23 + 16), string)
    || *(_DWORD *)(v23 + 72) != v10
    || *(_DWORD *)(v23 + 76) != v16
    || *(_DWORD *)(v23 + 80) != v19)
  {
    xpc_array_append_value(*(xpc_object_t *)(a1 + 48), xdict);
  }
  return 1;
}

char *_cryptex_bundle_default_asset_path(uint64_t a1, uint64_t a2)
{
  const char *v2;
  const char *v4;
  char *v5;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(const char **)(a1 + 16);
  v4 = *(const char **)(*(_QWORD *)(a2 + 8) + 40);
  v5 = 0;
  if (asprintf(&v5, "%s/%s/%s", "Cryptex", v2, v4) < 0)
    _cryptex_bundle_add_cryptex_assets_cold_1(&v6, v7);
  return v5;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return _os_log_send_and_compose_impl();
}

Collation *collation_create()
{
  return objc_alloc_init(Collation);
}

id collation_create_for_user(uint64_t a1)
{
  return -[Collation initForUser:]([Collation alloc], "initForUser:", a1);
}

uint64_t collation_get_id(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ccore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "getID");

  return v2;
}

void collation_foreach(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(a1, "ccore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateElements:", v3);

}

void *collation_get_description(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;

  v1 = a1;
  v2 = objc_msgSend(v1, "package");
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v1, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      collation_get_description_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  objc_msgSend(v1, "setColl_description:", v12);

  objc_msgSend(v1, "coll_description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v1, "coll_description");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (void *)objc_msgSend(v14, "UTF8String");

  }
  else
  {
    v15 = &unk_212724B05;
  }

  return v15;
}

char *collation_copy_mount_point_for_cryptex_bundle_id(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  char *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mountPointOfBundleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = strdup((const char *)objc_msgSend(v7, "UTF8String"));

  return v8;
}

char *collation_copy_search_path(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  char *v8;

  v5 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "getValidPaths:forLabels:", v6, a3);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = strdup((const char *)objc_msgSend(v7, "UTF8String"));

  return v8;
}

uint64_t collation_element_scope_get_description(uint64_t a1)
{
  id v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BEDBA30], "scopeToString:", a1);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "UTF8String");

  return v2;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t cryptex_mount(void *a1, void *a2, char **a3, CFTypeRef *a4)
{
  id v6;
  uint64_t core;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  CFErrorRef Error;
  void *v16;
  NSObject *v17;
  CFErrorRef v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  const void *mount_request;
  id v32;
  void *v33;
  NSObject *v34;
  _xpc_connection_s *connection;
  _xpc_connection_s *v36;
  xpc_object_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  CFErrorRef v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  CFErrorRef v50;
  int cferr;
  char *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  char *v60;
  NSObject *v61;
  id v62;
  int *v63;
  char *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  __CFError *v69;
  char *__s1;
  char *__s1a;
  char *__s1b;
  void *v73;
  CFTypeRef cf[2];
  int v76;
  const char *v77;
  __int16 v78;
  char *v79;
  __int16 v80;
  char *v81;
  uint8_t buf[16];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  cf[0] = 0;
  dispatch_get_global_queue(0, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  core = _cryptex_get_core((uint64_t)v6);
  if (core)
  {
    _mount_log();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      _mount_log();
      v9 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = core;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = core;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_mount", "cryptex_mount.m", 49, "com.apple.security.cryptex", 2, 0, v10);
    v14 = 0;
    v13 = 0;
    v11 = 0;
    goto LABEL_54;
  }
  _cryptex_get_core((uint64_t)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((cryptex_core_is_cryptex1() & 1) == 0)
  {
    _mount_log();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      _mount_log();
      v17 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    v18 = createError("cryptex_mount", "cryptex_mount.m", 57, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_asset())
  {
    _mount_log();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      _mount_log();
      v20 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    v18 = createError("cryptex_mount", "cryptex_mount.m", 64, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_image_asset())
  {
    _mount_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      _mount_log();
      v22 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    v18 = createError("cryptex_mount", "cryptex_mount.m", 71, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_tc_asset())
  {
    _mount_log();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      _mount_log();
      v24 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    v18 = createError("cryptex_mount", "cryptex_mount.m", 78, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_info_asset())
  {
    _mount_log();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      _mount_log();
      v26 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    v18 = createError("cryptex_mount", "cryptex_mount.m", 85, "com.apple.security.cryptex", 2, 0, v10);
    goto LABEL_53;
  }
  if (!cryptex_core_get_volumehash_asset())
  {
    _mount_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126F8000, v12, OS_LOG_TYPE_INFO, "No volume root hash present.", buf, 2u);
    }

  }
  cryptex_core_get_cryptex1_properties();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    _mount_log();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      _mount_log();
      v28 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    v18 = createError("cryptex_mount", "cryptex_mount.m", 97, "com.apple.security.cryptex", 2, 0, v10);
LABEL_53:
    Error = v18;
    v14 = 0;
    v13 = 0;
LABEL_54:
    v38 = 0;
    v32 = 0;
LABEL_55:
    v36 = 0;
    goto LABEL_56;
  }
  v14 = (void *)cryptex_core_cx1_copy_xpc_dictionary();
  if (!v14)
  {
    _mount_log();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      _mount_log();
      v30 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_mount", "cryptex_mount.m", 104, "com.apple.security.cryptex", 2, 0, v10);
    v14 = 0;
    goto LABEL_54;
  }
  mount_request = (const void *)mount_interface_create_mount_request();
  v32 = 0;
  if (mount_request)
  {
    _mount_log();
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      _mount_log();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    v43 = createError("cryptex_mount", "cryptex_mount.m", 122, "com.apple.security.cryptex", 2, mount_request, v10);
    v38 = 0;
    v36 = 0;
LABEL_66:
    Error = v43;
    goto LABEL_56;
  }
  connection = (_xpc_connection_s *)cryptex_xpc_create_connection();
  v36 = connection;
  if (!connection)
  {
    _mount_log();
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      _mount_log();
      v45 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_mount", "cryptex_mount.m", 129, "com.apple.security.cryptex", 2, 0, v10);
    v38 = 0;
    goto LABEL_55;
  }
  v37 = xpc_connection_send_message_with_reply_sync(connection, v32);
  v38 = v37;
  if (v37)
  {
    if (MEMORY[0x212BF18F8](v37) == MEMORY[0x24BDACFB8])
    {
      v10 = (char *)xpc_copy_debug_description();
      _mount_log();
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        _mount_log();
        v49 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();
      }
      v50 = createError("cryptex_mount", "cryptex_mount.m", 141, "com.apple.security.cryptex", 2, 0, __s1);
    }
    else
    {
      if (MEMORY[0x212BF18F8](v38) == MEMORY[0x24BDACFA0])
      {
        cferr = _xpc_dictionary_try_get_cferr(v38, "MOUNT:ERROR_DICT", (CFErrorRef *)cf);
        if ((cferr | 2) == 2)
        {
          Error = (CFErrorRef)cf[0];
          if (cf[0]
            && (_CFErrorHasDomainAndCode((CFDictionaryRef)cf[0], CFSTR("com.apple.security.cryptex"), 1) & 1) == 0)
          {
            _mount_log();
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (v56)
            {
              _mount_log();
              v57 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
              *(_DWORD *)buf = 138543362;
              *(CFTypeRef *)&buf[4] = cf[0];
              v10 = (char *)_os_log_send_and_compose_impl();

            }
            else
            {
              *(_DWORD *)buf = 138543362;
              *(CFTypeRef *)&buf[4] = cf[0];
              v10 = (char *)_os_log_send_and_compose_impl();
            }
            v43 = createError("cryptex_mount", "cryptex_mount.m", 173, "com.apple.security.cryptex", 2, cf[0], v10);
          }
          else
          {
            __s1a = (char *)xpc_dictionary_get_string(v38, "MOUNT:MOUNTPATH_STR");
            if (__s1a)
            {
              if (a3)
              {
                v69 = Error;
                if (_dispatch_is_multithreaded())
                {
                  while (1)
                  {
                    v52 = strdup(__s1a);
                    if (v52)
                      break;
                    __os_temporary_resource_shortage();
                  }
                  v60 = v52;
                }
                else
                {
                  v60 = strdup(__s1a);
                  __s1b = (char *)strlen(__s1a);
                  if (!v60)
                  {
                    cf[1] = 0;
                    v85 = 0u;
                    v86 = 0u;
                    v83 = 0u;
                    v84 = 0u;
                    *(_OWORD *)buf = 0u;
                    v61 = MEMORY[0x24BDACB70];
                    v62 = MEMORY[0x24BDACB70];
                    os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
                    v63 = __error();
                    v64 = strerror(*v63);
                    v76 = 136315650;
                    v77 = "known-constant allocation";
                    v78 = 2048;
                    v79 = __s1b;
                    v80 = 2080;
                    v81 = v64;
                    v65 = (void *)MEMORY[0x24BDACB70];
                    _os_log_send_and_compose_impl();

                    v66 = _os_crash_msg();
                    cryptex_mount_cold_1(v66);
                  }
                }
                *a3 = v60;
                Error = v69;
              }
              if (!Error)
              {
                v41 = 1;
                goto LABEL_59;
              }
              _mount_log();
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (v67)
              {
                _mount_log();
                v68 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
                *(_WORD *)buf = 0;
                v10 = (char *)_os_log_send_and_compose_impl();

              }
              else
              {
                *(_WORD *)buf = 0;
                v10 = (char *)_os_log_send_and_compose_impl();
              }
              v43 = createError("cryptex_mount", "cryptex_mount.m", 192, "com.apple.security.cryptex", 1, 0, v10);
            }
            else
            {
              _mount_log();
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              if (v58)
              {
                _mount_log();
                v59 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = "MOUNT:MOUNTPATH_STR";
                v10 = (char *)_os_log_send_and_compose_impl();

              }
              else
              {
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = "MOUNT:MOUNTPATH_STR";
                v10 = (char *)_os_log_send_and_compose_impl();
              }
              v43 = createError("cryptex_mount", "cryptex_mount.m", 181, "com.apple.security.cryptex", 2, 0, v10);
            }
          }
        }
        else
        {
          _mount_log();
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            _mount_log();
            v54 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = cferr;
            v55 = v54;
            v10 = (char *)_os_log_send_and_compose_impl();

          }
          else
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = cferr;
            v10 = (char *)_os_log_send_and_compose_impl();
          }
          v43 = createError("cryptex_mount", "cryptex_mount.m", 160, "com.apple.security.cryptex", 2, 0, v10);
        }
        goto LABEL_66;
      }
      v10 = (char *)xpc_copy_debug_description();
      _mount_log();
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        _mount_log();
        v40 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v10;
        __s1 = (char *)_os_log_send_and_compose_impl();
      }
      v50 = createError("cryptex_mount", "cryptex_mount.m", 146, "com.apple.security.cryptex", 2, 0, __s1);
    }
    Error = v50;
    free(__s1);
    goto LABEL_56;
  }
  _mount_log();
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    _mount_log();
    v47 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    *(_WORD *)buf = 0;
    v10 = (char *)_os_log_send_and_compose_impl();

  }
  else
  {
    *(_WORD *)buf = 0;
    v10 = (char *)_os_log_send_and_compose_impl();
  }
  Error = createError("cryptex_mount", "cryptex_mount.m", 136, "com.apple.security.cryptex", 2, 0, v10);
  v38 = 0;
LABEL_56:
  free(v10);
  v41 = 0;
  if (a4 && Error)
  {
    v41 = 0;
    *a4 = CFRetain(Error);
  }
LABEL_59:

  if (Error)
    CFRelease(Error);
  if (cf[0])
    CFRelease(cf[0]);

  return v41;
}

void sub_21270CA24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

id _mount_log()
{
  if (_mount_log_onceToken != -1)
    dispatch_once(&_mount_log_onceToken, &__block_literal_global_1);
  return (id)_mount_log_osl;
}

uint64_t cryptex_unmount(void *a1, void *a2, CFTypeRef *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t info_asset;
  const void *unmount_request;
  id v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  NSObject *v15;
  CFErrorRef Error;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _xpc_connection_s *connection;
  _xpc_connection_s *v22;
  xpc_object_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  CFErrorRef v28;
  CFErrorRef v29;
  uint64_t v30;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  char *v38;
  int cferr;
  void *v40;
  NSObject *v41;
  CFErrorRef v42;
  void *v43;
  NSObject *v44;
  char *v45;
  id v46;
  char *v47;
  char *cStra;
  char *cStrb;
  char *cStr;
  CFTypeRef cf;
  int v52;
  _DWORD v53[7];

  *(_QWORD *)&v53[5] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  cf = 0;
  dispatch_get_global_queue(0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    _cryptex_attr_get_mount_flags((uint64_t)v5);
  _cryptex_get_core((uint64_t)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((cryptex_core_is_cryptex1() & 1) == 0)
  {
    _mount_log();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      _mount_log();
      v15 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      LOWORD(v52) = 0;
      v13 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(v52) = 0;
      v13 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_unmount", "cryptex_mount.m", 229, "com.apple.security.cryptex", 2, 0, v13);
    goto LABEL_30;
  }
  info_asset = cryptex_core_get_info_asset();
  if (!info_asset)
  {
    _mount_log();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      _mount_log();
      v18 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      v52 = 136315138;
      *(_QWORD *)v53 = MEMORY[0x28];
      v13 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v52 = 136315138;
      *(_QWORD *)v53 = MEMORY[0x28];
      v13 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_unmount", "cryptex_mount.m", 236, "com.apple.security.cryptex", 2, 0, v13);
    goto LABEL_30;
  }
  if ((*(_DWORD *)(info_asset + 16) & 0x80000000) != 0)
  {
    _mount_log();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      _mount_log();
      v20 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      v52 = 136315138;
      *(_QWORD *)v53 = MEMORY[0x28];
      v13 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v52 = 136315138;
      *(_QWORD *)v53 = MEMORY[0x28];
      v13 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_unmount", "cryptex_mount.m", 243, "com.apple.security.cryptex", 2, 0, v13);
LABEL_30:
    v29 = Error;
    v24 = 0;
    v10 = 0;
LABEL_31:
    v22 = 0;
    goto LABEL_32;
  }
  unmount_request = (const void *)mount_interface_create_unmount_request();
  v10 = 0;
  if (unmount_request)
  {
    _mount_log();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _mount_log();
      v12 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      LOWORD(v52) = 0;
      v13 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(v52) = 0;
      v13 = (char *)_os_log_send_and_compose_impl();
    }
    v28 = createError("cryptex_unmount", "cryptex_mount.m", 250, "com.apple.security.cryptex", 2, unmount_request, v13);
    v24 = 0;
    v22 = 0;
LABEL_27:
    v29 = v28;
    goto LABEL_32;
  }
  connection = (_xpc_connection_s *)cryptex_xpc_create_connection();
  v22 = connection;
  if (!connection)
  {
    _mount_log();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      _mount_log();
      v33 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
      LOWORD(v52) = 0;
      v13 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(v52) = 0;
      v13 = (char *)_os_log_send_and_compose_impl();
    }
    v29 = createError("cryptex_unmount", "cryptex_mount.m", 257, "com.apple.security.cryptex", 2, 0, v13);
    v24 = 0;
    goto LABEL_31;
  }
  v23 = xpc_connection_send_message_with_reply_sync(connection, v10);
  v24 = v23;
  if (v23)
  {
    if (MEMORY[0x212BF18F8](v23) == MEMORY[0x24BDACFB8])
    {
      v13 = (char *)xpc_copy_debug_description();
      _mount_log();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        _mount_log();
        v37 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
        v52 = 136315138;
        *(_QWORD *)v53 = v13;
        cStrb = (char *)_os_log_send_and_compose_impl();

        v38 = cStrb;
      }
      else
      {
        v52 = 136315138;
        *(_QWORD *)v53 = v13;
        v38 = (char *)_os_log_send_and_compose_impl();
      }
      cStr = v38;
      v42 = createError("cryptex_unmount", "cryptex_mount.m", 269, "com.apple.security.cryptex", 2, 0, v38);
    }
    else
    {
      if (MEMORY[0x212BF18F8](v24) == MEMORY[0x24BDACFA0])
      {
        cferr = _xpc_dictionary_try_get_cferr(v24, "UNMOUNT:ERROR_DICT", (CFErrorRef *)&cf);
        if ((cferr | 2) == 2)
        {
          if (!cf)
          {
            v29 = 0;
            v30 = 1;
            goto LABEL_35;
          }
          _mount_log();
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            _mount_log();
            v41 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
            v52 = 138543362;
            *(_QWORD *)v53 = cf;
            v13 = (char *)_os_log_send_and_compose_impl();

          }
          else
          {
            v52 = 138543362;
            *(_QWORD *)v53 = cf;
            v13 = (char *)_os_log_send_and_compose_impl();
          }
          v28 = createError("cryptex_unmount", "cryptex_mount.m", 297, "com.apple.security.cryptex", 2, cf, v13);
        }
        else
        {
          _mount_log();
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            _mount_log();
            v44 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
            v45 = strerror(cferr);
            v52 = 67109378;
            v53[0] = cferr;
            LOWORD(v53[1]) = 2080;
            *(_QWORD *)((char *)&v53[1] + 2) = v45;
          }
          else
          {
            v46 = MEMORY[0x24BDACB70];
            v47 = strerror(cferr);
            v52 = 67109378;
            v53[0] = cferr;
            LOWORD(v53[1]) = 2080;
            *(_QWORD *)((char *)&v53[1] + 2) = v47;
            v44 = MEMORY[0x24BDACB70];
          }
          v13 = (char *)_os_log_send_and_compose_impl();

          v28 = createError("cryptex_unmount", "cryptex_mount.m", 288, "com.apple.security.cryptex", 2, 0, v13);
        }
        goto LABEL_27;
      }
      v13 = (char *)xpc_copy_debug_description();
      _mount_log();
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        _mount_log();
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        v52 = 136315138;
        *(_QWORD *)v53 = v13;
        cStra = (char *)_os_log_send_and_compose_impl();

        v27 = cStra;
      }
      else
      {
        v52 = 136315138;
        *(_QWORD *)v53 = v13;
        v27 = (char *)_os_log_send_and_compose_impl();
      }
      cStr = v27;
      v42 = createError("cryptex_unmount", "cryptex_mount.m", 274, "com.apple.security.cryptex", 2, 0, v27);
    }
    v29 = v42;
    free(cStr);
    goto LABEL_32;
  }
  _mount_log();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    _mount_log();
    v35 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    LOWORD(v52) = 0;
    v13 = (char *)_os_log_send_and_compose_impl();

  }
  else
  {
    LOWORD(v52) = 0;
    v13 = (char *)_os_log_send_and_compose_impl();
  }
  v29 = createError("cryptex_unmount", "cryptex_mount.m", 264, "com.apple.security.cryptex", 2, 0, v13);
  v24 = 0;
LABEL_32:
  free(v13);
  v30 = 0;
  if (a3 && v29)
  {
    v30 = 0;
    *a3 = CFRetain(v29);
  }
LABEL_35:

  if (v29)
    CFRelease(v29);
  if (cf)
    CFRelease(cf);

  return v30;
}

void sub_21270D7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, CFTypeRef cf)
{
  free(0);
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(a1);
}

void ___mount_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libcryptex", "mount");
  v1 = (void *)_mount_log_osl;
  _mount_log_osl = (uint64_t)v0;

}

uint64_t cryptex_identity_set_host_identity(unsigned int *a1)
{
  uint64_t result;
  _OWORD v3[9];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(v3, 0, sizeof(v3));
  LOWORD(v3[0]) = 6;
  if (!a1)
    return 22;
  result = img4_chip_instantiate();
  if (!(_DWORD)result)
    return cryptex_identity_set_chip(a1, (uint64_t)v3);
  return result;
}

uint64_t cryptex_identity_set_chip(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 22;
  if (a1)
  {
    if (a2)
    {
      *((_QWORD *)a1 + 1) = 0;
      *((_QWORD *)a1 + 2) = *(_QWORD *)(a2 + 28);
      a1[6] = *(_DWORD *)(a2 + 36);
      v2 = *a1;
      if ((_DWORD)v2)
      {
        v3 = *(_QWORD *)(a2 + 16);
        if ((v3 & 0x58000) != 0)
          return 0;
        *((_QWORD *)a1 + 1) = 6;
        a1[10] = *(_DWORD *)(a2 + 140);
        *(_QWORD *)(a1 + 7) = *(_QWORD *)(a2 + 128);
        if ((v3 & 0x20000) != 0)
        {
          return 0;
        }
        else
        {
          v2 = 0;
          a1[9] = *(_DWORD *)(a2 + 136);
        }
      }
    }
  }
  return v2;
}

void _cryptex_dealloc(uint64_t a1)
{
  void *v2;

  os_release(*(void **)(a1 + 48));
  v2 = *(void **)(a1 + 104);
  if (v2)
    os_release(v2);
  object_proto_destroy(a1 + 16);
}

uint64_t _cryptex_create(_OWORD *a1, char *a2, uint64_t a3)
{
  char *v5;
  char *v6;
  uint32_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  char *v12;
  uint64_t v13;
  _OWORD v14[5];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v5 = a2;
    v6 = 0;
  }
  else
  {
    if ((a3 & 1) == 0)
      _cryptex_create_cold_1();
    v12 = 0;
    v7 = arc4random();
    if (asprintf(&v12, "%s.%#x", "default", v7) < 0)
      _cryptex_bundle_add_cryptex_assets_cold_1(&v13, v14);
    v6 = v12;
    v5 = v12;
  }
  v8 = _cryptex_alloc();
  *(_QWORD *)(v8 + 40) = a3;
  *(_QWORD *)(v8 + 48) = cryptex_core_create();
  v10 = a1[1];
  v9 = a1[2];
  *(_OWORD *)(v8 + 56) = *a1;
  *(_OWORD *)(v8 + 72) = v10;
  *(_OWORD *)(v8 + 88) = v9;
  object_proto_init(v8 + 16, (int)"com.apple.security.libcryptex", "cryptex");
  object_set_name(v8 + 16, v5);
  object_set_name_nocopy(*(_QWORD *)(v8 + 48) + 16, v5);
  free(v6);
  return v8;
}

BOOL _cryptex_identity_equal_device(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a1 + 8) & 1;
    if (v3 != (*(_QWORD *)(a2 + 8) & 1))
      return 0;
    if (v3)
      return 1;
    return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16)
        && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20)
        && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
  }
  return v2;
}

BOOL _cryptex_identity_equal_cryptex1_chipid(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  if (a1)
  {
    if (a2)
    {
      v2 = *a1;
      if ((_DWORD)v2)
      {
        v2 = *a2;
        if ((_DWORD)v2)
        {
          v3 = *((_QWORD *)a1 + 1) & 4;
          if (v3 == (*((_QWORD *)a2 + 1) & 4))
            return !v3 || a1[7] == a2[7];
          else
            return 0;
        }
      }
    }
  }
  return v2;
}

BOOL _cryptex_identity_equal_cryptex1(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  if (a1)
  {
    if (a2)
    {
      v2 = *a1;
      if ((_DWORD)v2)
      {
        v2 = *a2;
        if ((_DWORD)v2)
        {
          v3 = *((_QWORD *)a1 + 1) & 2;
          if (v3 == (*((_QWORD *)a2 + 1) & 2))
          {
            if (!v3)
              return 1;
            if (a1[8] == a2[8])
              return a1[10] == a2[10];
          }
          return 0;
        }
      }
    }
  }
  return v2;
}

char *_cryptex_identity_copy_description(uint64_t a1)
{
  size_t v2;
  char *v3;
  unsigned int v4;
  char *result;
  int v6;
  NSObject *v7;
  const char *v8;
  int *v9;
  uint64_t v10;
  char __dst[512];
  uint8_t buf[88];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = 512;
  v3 = __dst;
  memcpy(__dst, "generic", sizeof(__dst));
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    v4 = snprintf(__dst, 0x200uLL, "device(bord = %#x, chip = %#x, sdom = %#x) ", *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 24));
    if ((v4 & 0x80000000) != 0)
    {
      v6 = *__error();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 12;
        v7 = MEMORY[0x24BDACB70];
        v8 = "Failed to write device identifiers.: %{darwin.errno}d";
LABEL_16:
        _os_log_impl(&dword_2126F8000, v7, OS_LOG_TYPE_ERROR, v8, buf, 8u);
      }
LABEL_17:
      v9 = __error();
      result = 0;
      *v9 = v6;
      return result;
    }
    v3 = &__dst[v4];
    v2 = 512 - v4;
  }
  if (*(_DWORD *)a1
    && (*(_BYTE *)(a1 + 8) & 2) != 0
    && snprintf(v3, v2, "cryptex1(fchp = %#x, type = %#x, styp = %#x, clas = %#x)", *(_DWORD *)(a1 + 28), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 40)) < 0)
  {
    v6 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 12;
      v7 = MEMORY[0x24BDACB70];
      v8 = "Failed to write cryptex1 identifiers.: %{darwin.errno}d";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = strdup(__dst);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = strdup(__dst);
    if (!result)
      _cryptex_identity_copy_description_cold_1(__dst, &v10, buf);
  }
  return result;
}

uint64_t _cryptex_get_core(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

char *cryptex_system_cx_copy_name(uint64_t a1)
{
  char *result;
  uint64_t v2;
  _OWORD v3[5];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (a1 == 1)
  {
    result = strdup("com.apple.system.nextos");
    if (!result)
      cryptex_system_cx_copy_name_cold_2(&v2, v3);
  }
  else if (a1)
  {
    return 0;
  }
  else
  {
    result = strdup("com.apple.system.app");
    if (!result)
      cryptex_system_cx_copy_name_cold_1(&v2, v3);
  }
  return result;
}

__n128 cryptex_get_identity@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 16) = v2;
  result = *(__n128 *)(a1 + 88);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

uint64_t cryptex_get_variant(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    return 0;
  else
    return *(_QWORD *)(a1 + 16);
}

uint64_t cryptex_get_image_type()
{
  uint64_t v0;
  uint64_t v2;
  _OWORD v3[5];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = *(_QWORD *)(cryptex_core_get_image_asset() + 8);
  if (v0 == MEMORY[0x24BEDBA40])
    return 0;
  if (v0 == MEMORY[0x24BEDBA78])
    return 1;
  if (v0 != MEMORY[0x24BEDBA48])
    cryptex_get_image_type_cold_1(&v2, v3);
  return 2;
}

uint64_t cryptex_lockdown()
{
  uint64_t v0;
  NSObject *v1;
  _QWORD *v2;
  uint64_t v3;
  int v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;
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
  _BYTE v31[352];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v0 = _g;
  v32 = 0;
  memset(v31, 0, sizeof(v31));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v8 = 32;
  v1 = os_log_create("com.apple.libcryptex", "cryptex");
  v2 = _cryptex_copy_connected_actor(v0, MEMORY[0x24BEDBC90]);
  _cryptex_actor_init_invoke_u64();
  codex_lockdown_pack();
  v3 = cryptex_actor_trap();
  if ((_DWORD)v3)
  {
    v4 = *__error();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v7 = v3;
      _os_log_impl(&dword_2126F8000, v1, OS_LOG_TYPE_ERROR, "lockdown rpc: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v4;
  }
  rpc_destroy(&v8);
  rpc_destroy(v31);
  if (v1)
    os_release(v1);
  if (v2)
    os_release(v2);
  return v3;
}

uint64_t cryptex_install2(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v5;
  uint64_t info_asset;
  int file;
  int v9;
  const char *v10;
  const char *v11;
  const char *v12;
  char *v13;
  int v14;
  CFIndex v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  const char *v20;
  CFErrorRef Error;
  _QWORD *v22;
  const void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  char *v27;
  CFErrorRef v28;
  uint64_t result;
  const char *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  int v37;
  int v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  int v43;
  CFIndex v44;
  const char *v45;
  const char *v46;
  int v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  _OWORD v51[3];
  uint64_t v52;
  BOOL v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[22];
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v5 = _g;
  v53 = 0;
  v52 = 0;
  memset(v51, 0, sizeof(v51));
  v82 = 0;
  memset(v81, 0, sizeof(v81));
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v74 = 0u;
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v69 = 0u;
  v68 = 0u;
  v67 = 0u;
  v66 = 0u;
  v65 = 0u;
  v64 = 0u;
  v63 = 0u;
  v62 = 0u;
  v61 = 0u;
  v60 = 0u;
  v59 = 0u;
  v58 = 32;
  if ((*(_BYTE *)(a1 + 40) & 2) != 0)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v11 = *(const char **)(a1 + 16);
      if (!v11)
        v11 = "[anonymous]";
    }
    else
    {
      v11 = *(const char **)(a1 + 16);
      if (!v11)
        v11 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v55 = v11;
    v56 = 1024;
    LODWORD(v57) = 45;
    v13 = (char *)_os_log_send_and_compose_impl();
    v14 = 785;
    v15 = 45;
    goto LABEL_39;
  }
  if (!cryptex_core_get_image_asset())
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v12 = *(const char **)(a1 + 16);
      if (!v12)
        v12 = "[anonymous]";
    }
    else
    {
      v12 = *(const char **)(a1 + 16);
      if (!v12)
        v12 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v55 = v12;
    v56 = 1024;
    LODWORD(v57) = 22;
    v13 = (char *)_os_log_send_and_compose_impl();
    v14 = 793;
    goto LABEL_30;
  }
  info_asset = cryptex_core_get_info_asset();
  if (!info_asset)
  {
    v16 = 0;
    goto LABEL_21;
  }
  file = _read_file(*(_DWORD *)(info_asset + 16), v51);
  if (file)
  {
    v9 = file;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v10 = *(const char **)(a1 + 16);
      if (!v10)
        v10 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v55 = v10;
      v56 = 1024;
      LODWORD(v57) = v9;
    }
    else
    {
      v20 = *(const char **)(a1 + 16);
      if (!v20)
        v20 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v55 = v20;
      v56 = 1024;
      LODWORD(v57) = file;
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    v15 = v9;
    v14 = 805;
    goto LABEL_39;
  }
  v17 = (void *)xpc_create_from_plist();
  if (!v17)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v40 = *(const char **)(a1 + 16);
      if (!v40)
        v40 = "[anonymous]";
    }
    else
    {
      v40 = *(const char **)(a1 + 16);
      if (!v40)
        v40 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v55 = v40;
    v56 = 1024;
    LODWORD(v57) = 22;
    v13 = (char *)_os_log_send_and_compose_impl();
    v14 = 813;
LABEL_30:
    v15 = 22;
LABEL_39:
    Error = createError("cryptex_install2", "cryptex.c", v14, "com.apple.security.cryptex.posix", v15, 0, v13);
    v22 = 0;
    v23 = 0;
    v16 = 0;
LABEL_40:
    v24 = 0;
    goto LABEL_41;
  }
  v16 = v17;
  v18 = _xpc_dictionary_try_get_BOOL(v17, "NoCode", &v53);
  if (v18 == 79)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v45 = *(const char **)(a1 + 16);
      if (!v45)
        v45 = "[anonymous]";
    }
    else
    {
      v45 = *(const char **)(a1 + 16);
      if (!v45)
        v45 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v55 = v45;
    v56 = 2080;
    v57 = "NoCode";
    v13 = (char *)_os_log_send_and_compose_impl();
    v42 = "com.apple.security.cryptex";
    v43 = 825;
    v44 = 11;
    goto LABEL_114;
  }
  if (v18 == 2)
  {
    v53 = 0;
  }
  else if (v53)
  {
    goto LABEL_22;
  }
LABEL_21:
  if (!cryptex_core_get_tc_asset())
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v19 = *(const char **)(a1 + 16);
      if (!v19)
        v19 = "[anonymous]";
    }
    else
    {
      v19 = *(const char **)(a1 + 16);
      if (!v19)
        v19 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v55 = v19;
    v56 = 1024;
    LODWORD(v57) = 22;
    v13 = (char *)_os_log_send_and_compose_impl();
    v42 = "com.apple.security.cryptex.posix";
    v43 = 835;
    v44 = 22;
LABEL_114:
    Error = createError("cryptex_install2", "cryptex.c", v43, v42, v44, 0, v13);
    v22 = 0;
    v23 = 0;
    goto LABEL_40;
  }
LABEL_22:
  cryptex_core_get_volumehash_asset();
  cryptex_core_get_asset();
  if (*(_QWORD *)(a2 + 48) >= 3uLL)
  {
    v30 = *(const char **)(*(_QWORD *)(a1 + 48) + 16);
    v31 = *__error();
    v32 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 32);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = "[anonymous]";
      if (v30)
        v33 = v30;
      *(_DWORD *)buf = 136446210;
      v55 = v33;
      _os_log_impl(&dword_2126F8000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s: Installing as ephemeral", buf, 0xCu);
    }
    *__error() = v31;
  }
  if (cryptex_core_is_cryptex1())
    v34 = cryptex_core_cx1_copy_xpc_dictionary();
  else
    v34 = (uint64_t)xpc_dictionary_create(0, 0, 0);
  v24 = (void *)v34;
  result = MEMORY[0x212BF18F8]();
  if (result != MEMORY[0x24BDACFA0])
  {
    __break(1u);
    return result;
  }
  v22 = _cryptex_copy_connected_actor(v5, MEMORY[0x24BEDBC90]);
  _cryptex_actor_init_invoke_u64();
  codex_install_pack();
  v35 = cryptex_actor_trap_with_cferr();
  if (v35)
  {
    v23 = (const void *)v35;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v36 = *(const char **)(a1 + 16);
      if (!v36)
        v36 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v55 = v36;
    }
    else
    {
      v41 = *(const char **)(a1 + 16);
      if (!v41)
        v41 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v55 = v41;
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_install2", "cryptex.c", 911, "com.apple.security.cryptex", 14, v23, v13);
  }
  else
  {
    v37 = codex_install_reply_unpack();
    if (!v37)
    {
      v46 = *(const char **)(a1 + 16);
      v47 = *__error();
      v48 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v49 = "[anonymous]";
        if (v46)
          v49 = v46;
        *(_DWORD *)buf = 136446466;
        v55 = v49;
        v56 = 2080;
        v57 = 0;
        _os_log_impl(&dword_2126F8000, v48, OS_LOG_TYPE_DEBUG, "%{public}s: installed as: %s", buf, 0x16u);
      }
      Error = 0;
      v23 = 0;
      *__error() = v47;
      goto LABEL_51;
    }
    v38 = v37;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v39 = *(const char **)(a1 + 16);
      if (!v39)
        v39 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v55 = v39;
      v56 = 1024;
      LODWORD(v57) = v38;
    }
    else
    {
      v50 = *(const char **)(a1 + 16);
      if (!v50)
        v50 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v55 = v50;
      v56 = 1024;
      LODWORD(v57) = v37;
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_install2", "cryptex.c", 918, "com.apple.security.cryptex.posix", v38, 0, v13);
    v23 = 0;
  }
LABEL_41:
  free(v13);
  if (a3 && Error)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v25 = *(const char **)(a1 + 16);
      if (!v25)
        v25 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v55 = v25;
    }
    else
    {
      v26 = *(const char **)(a1 + 16);
      if (!v26)
        v26 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v55 = v26;
    }
    v27 = (char *)_os_log_send_and_compose_impl();
    v28 = createError("cryptex_install2", "cryptex.c", 928, "com.apple.security.cryptex", 14, Error, v27);
    free(v27);
    *a3 = v28;
  }
LABEL_51:
  buff_destroy(v51);
  rpc_destroy(&v58);
  rpc_destroy(v81);
  if (v24)
    os_release(v24);
  if (v16)
    os_release(v16);
  if (Error)
    CFRelease(Error);
  if (v23)
    CFRelease(v23);
  if (v22)
    os_release(v22);
  return Error == 0;
}

void cryptex_uninstall()
{
  _os_crash();
  __break(1u);
}

BOOL cryptex_personalize2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CFErrorRef *a5, NSObject *a6, const void *a7)
{
  void *v9;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  char *v19;
  const char *v20;
  int v21;
  CFIndex v22;
  const char *v23;
  int v24;
  NSObject *v25;
  const char *v26;
  CFErrorRef Error;
  CFErrorRef v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  const char *v33;
  char *v34;
  CFErrorRef v35;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  const char *v41;
  int v42;
  NSObject *v43;
  size_t count;
  CFErrorRef v45;
  const char *v46;
  const char *v47;
  int v48;
  NSObject *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  int nonce_domain;
  int v54;
  int v55;
  int v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  NSObject *v62;
  uint32_t v63;
  int v64;
  const char *v65;
  const char *v66;
  const char *v67;
  int v68;
  int v69;
  CFIndex v70;
  const char *v71;
  int v72;
  NSObject *v73;
  const char *v74;
  int v75;
  int v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  NSObject *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  CFErrorRef *v86;
  uint64_t v87;
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  size_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v9 = *(void **)(a1 + 48);
  v99 = 0;
  v97 = 0u;
  v98 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v92 = 0u;
  v95 = 0x3000000000;
  v87 = MEMORY[0x24BEDC3C0];
  if (!a6)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v16 = *(const char **)(a1 + 16);
      if (!v16)
        v16 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v16;
    }
    else
    {
      v18 = *(const char **)(a1 + 16);
      if (!v18)
        v18 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v18;
    }
    v19 = (char *)_os_log_send_and_compose_impl();
    v20 = "com.apple.security.cryptex";
    v21 = 969;
    v22 = 11;
    goto LABEL_32;
  }
  if ((*(_BYTE *)(a1 + 40) & 2) != 0)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v17 = *(const char **)(a1 + 16);
      if (!v17)
        v17 = "[anonymous]";
    }
    else
    {
      v17 = *(const char **)(a1 + 16);
      if (!v17)
        v17 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v89 = v17;
    v90 = 1024;
    LODWORD(v91) = 45;
    v19 = (char *)_os_log_send_and_compose_impl();
    v20 = "com.apple.security.cryptex.posix";
    v21 = 975;
    v22 = 45;
    goto LABEL_32;
  }
  if (cryptex_core_get_asset())
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v15 = *(const char **)(a1 + 16);
      if (!v15)
        v15 = "[anonymous]";
    }
    else
    {
      v15 = *(const char **)(a1 + 16);
      if (!v15)
        v15 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v89 = v15;
    v90 = 1024;
    LODWORD(v91) = 17;
    v19 = (char *)_os_log_send_and_compose_impl();
    v20 = "com.apple.security.cryptex.posix";
    v21 = 982;
    v22 = 17;
LABEL_32:
    Error = createError("cryptex_personalize2", "cryptex.c", v21, v20, v22, 0, v19);
    v28 = 0;
    v29 = 0;
LABEL_33:
    v30 = 0;
LABEL_34:
    v31 = 0;
    goto LABEL_35;
  }
  v86 = a5;
  if (cryptex_core_is_cryptex1())
  {
    v23 = *(const char **)(a1 + 16);
    v24 = *__error();
    v25 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = "[anonymous]";
      if (v23)
        v26 = v23;
      *(_DWORD *)buf = 136446210;
      v89 = v26;
      _os_log_impl(&dword_2126F8000, v25, OS_LOG_TYPE_DEBUG, "%{public}s: Will personalize Cryptex1 dmg with a Cryptex1 TSS request.", buf, 0xCu);
    }
    *__error() = v24;
  }
  v85 = (*(_QWORD *)(a2 + 96) >> 1) & 1;
  v37 = *(_QWORD *)(a2 + 64);
  v38 = a2;
  v39 = ctx_new((void *)a1, 0x28uLL);
  dispatch_retain(a6);
  v39[3] = a6;
  v39[4] = _Block_copy(a7);
  v29 = (void *)cryptex_host_create();
  cryptex_core_attach_host();
  v40 = *(_QWORD *)(v38 + 64);
  if (v40 == 2)
  {
    v30 = (void *)cryptex_scrivener_create();
LABEL_109:
    cryptex_scrivener_sign();
    cryptex_activate();
    v31 = 0;
    Error = 0;
    v28 = 0;
    goto LABEL_45;
  }
  if (v40 != 1)
  {
    v30 = (void *)cryptex_scrivener_create();
    if (*(_QWORD *)(v38 + 72))
      cryptex_scrivener_set_url();
    a5 = v86;
    if (a3)
    {
      if (a4)
      {
        cryptex_scrivener_set_nonce();
        v47 = *(const char **)(a1 + 16);
        v48 = *__error();
        v49 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v50 = "[anonymous]";
          if (v47)
            v50 = v47;
          *(_DWORD *)buf = 136446210;
          v89 = v50;
          v51 = "%{public}s: personalizing with client provided nonce";
LABEL_99:
          v62 = v49;
          v63 = 12;
LABEL_100:
          _os_log_impl(&dword_2126F8000, v62, OS_LOG_TYPE_DEBUG, v51, buf, v63);
        }
      }
      else
      {
        cryptex_scrivener_set_nonce();
        v60 = *(const char **)(a1 + 16);
        v48 = *__error();
        v49 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v61 = "[anonymous]";
          if (v60)
            v61 = v60;
          *(_DWORD *)buf = 136446210;
          v89 = v61;
          v51 = "%{public}s: personalizing with zero nonce";
          goto LABEL_99;
        }
      }
    }
    else
    {
      nonce_domain = cryptex_core_get_nonce_domain();
      v54 = nonce_domain;
      if (nonce_domain || !v87)
      {
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v66 = *(const char **)(a1 + 16);
          if (!v66)
            v66 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v89 = v66;
          v90 = 1024;
          LODWORD(v91) = v54;
        }
        else
        {
          v78 = *(const char **)(a1 + 16);
          if (!v78)
            v78 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v89 = v78;
          v90 = 1024;
          LODWORD(v91) = nonce_domain;
        }
        v19 = (char *)_os_log_send_and_compose_impl();
        v70 = v54;
        v69 = 1065;
        goto LABEL_155;
      }
      v55 = cryptex_core_copy_nonce_domain_desc();
      if (v55)
      {
        v56 = v55;
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v57 = *(const char **)(a1 + 16);
          if (!v57)
            v57 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v89 = v57;
          v90 = 1024;
          LODWORD(v91) = v56;
        }
        else
        {
          v80 = *(const char **)(a1 + 16);
          if (!v80)
            v80 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v89 = v80;
          v90 = 1024;
          LODWORD(v91) = v55;
        }
        v19 = (char *)_os_log_send_and_compose_impl();
        v70 = v56;
        v69 = 1072;
        goto LABEL_155;
      }
      v71 = *(const char **)(a1 + 16);
      v72 = *__error();
      v73 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        v74 = "[anonymous]";
        if (v71)
          v74 = v71;
        *(_DWORD *)buf = 136446466;
        v89 = v74;
        v90 = 2080;
        v91 = 0;
        _os_log_impl(&dword_2126F8000, v73, OS_LOG_TYPE_DEBUG, "%{public}s: copying nonce from domain %s", buf, 0x16u);
      }
      *__error() = v72;
      v75 = img4_nonce_domain_copy_nonce();
      if (v75)
      {
        v76 = v75;
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v77 = *(const char **)(a1 + 16);
          if (!v77)
            v77 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v89 = v77;
          v90 = 1024;
          LODWORD(v91) = v76;
        }
        else
        {
          v84 = *(const char **)(a1 + 16);
          if (!v84)
            v84 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v89 = v84;
          v90 = 1024;
          LODWORD(v91) = v75;
        }
        v19 = (char *)_os_log_send_and_compose_impl();
        v70 = v76;
        v69 = 1082;
        goto LABEL_155;
      }
      cryptex_scrivener_set_nonce();
      v81 = *(const char **)(a1 + 16);
      v48 = *__error();
      v82 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        v83 = "[anonymous]";
        if (v81)
          v83 = v81;
        *(_DWORD *)buf = 136446466;
        v89 = v83;
        v90 = 2080;
        v91 = 0;
        v51 = "%{public}s: personalizing with host nonce from %s";
        v62 = v82;
        v63 = 22;
        goto LABEL_100;
      }
    }
    *__error() = v48;
    v64 = *(_DWORD *)(v38 + 88);
    if (*(_QWORD *)(v38 + 80))
    {
      if (v64)
      {
        cryptex_scrivener_set_socks_proxy();
        goto LABEL_109;
      }
    }
    else if (v64 < 1)
    {
      goto LABEL_109;
    }
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v65 = *(const char **)(a1 + 16);
      if (!v65)
        v65 = "[anonymous]";
    }
    else
    {
      v65 = *(const char **)(a1 + 16);
      if (!v65)
        v65 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v89 = v65;
    v90 = 1024;
    LODWORD(v91) = 22;
    v19 = (char *)_os_log_send_and_compose_impl();
    v69 = 1104;
    v70 = 22;
LABEL_155:
    Error = createError("cryptex_personalize2", "cryptex.c", v69, "com.apple.security.cryptex.posix", v70, 0, v19);
    v28 = 0;
    goto LABEL_34;
  }
  if (!xpc_array_get_count(*(xpc_object_t *)(*(_QWORD *)(a1 + 48) + 208)))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v52 = *(const char **)(a1 + 16);
      if (!v52)
        v52 = "[anonymous]";
    }
    else
    {
      v52 = *(const char **)(a1 + 16);
      if (!v52)
        v52 = "[anonymous]";
    }
    *(_DWORD *)buf = 136446466;
    v89 = v52;
    v90 = 1024;
    LODWORD(v91) = 22;
    v19 = (char *)_os_log_send_and_compose_impl();
    a5 = v86;
    Error = createError("cryptex_personalize2", "cryptex.c", 1022, "com.apple.security.cryptex.posix", 22, 0, v19);
    v28 = 0;
    goto LABEL_33;
  }
  v41 = *(const char **)(a1 + 16);
  v42 = *__error();
  v43 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    if (!v41)
      v41 = "[anonymous]";
    count = xpc_array_get_count(*(xpc_object_t *)(*(_QWORD *)(a1 + 48) + 208));
    *(_DWORD *)buf = 136446466;
    v89 = v41;
    v90 = 2048;
    v91 = count;
    _os_log_impl(&dword_2126F8000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s: requesting Diavlo personalization with %lu signatures", buf, 0x16u);
  }
  *__error() = v42;
  v31 = (void *)cryptex_signing_service_create(v85 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v37 & 1)));
  v45 = cryptex_signing_service_set_cryptex_core((uint64_t)v31, v9);
  a5 = v86;
  if (v45)
  {
    v28 = v45;
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v46 = *(const char **)(a1 + 16);
      if (!v46)
        v46 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v46;
    }
    else
    {
      v67 = *(const char **)(a1 + 16);
      if (!v67)
        v67 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v67;
    }
    v19 = (char *)_os_log_send_and_compose_impl();
    v68 = 1033;
  }
  else
  {
    v58 = *(const char **)(v38 + 72);
    if (v58)
      cryptex_signing_service_set_tss_url((uint64_t)v31, v58);
    v28 = cryptex_signing_service_sign((uint64_t)v31);
    if (!v28)
    {
      v30 = 0;
      Error = 0;
      goto LABEL_45;
    }
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v59 = *(const char **)(a1 + 16);
      if (!v59)
        v59 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v59;
    }
    else
    {
      v79 = *(const char **)(a1 + 16);
      if (!v79)
        v79 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v79;
    }
    v19 = (char *)_os_log_send_and_compose_impl();
    v68 = 1045;
  }
  Error = createError("cryptex_personalize2", "cryptex.c", v68, "com.apple.security.cryptex", 5, v28, v19);
  v30 = 0;
LABEL_35:
  free(v19);
  if (a5 && Error)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v32 = *(const char **)(a1 + 16);
      if (!v32)
        v32 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v32;
    }
    else
    {
      v33 = *(const char **)(a1 + 16);
      if (!v33)
        v33 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v89 = v33;
    }
    v34 = (char *)_os_log_send_and_compose_impl();
    v35 = createError("cryptex_personalize2", "cryptex.c", 1115, "com.apple.security.cryptex", 5, Error, v34);
    free(v34);
    *a5 = v35;
  }
LABEL_45:
  free(0);
  if (v31)
    os_release(v31);
  if (v30)
    os_release(v30);
  if (v29)
    os_release(v29);
  if (Error)
    CFRelease(Error);
  if (v28)
    CFRelease(v28);
  return Error == 0;
}

uint64_t _cryptex_personalize2_continue_tss(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *v14;
  char *v15;
  CFErrorRef Error;
  int v17;
  const char *v18;
  const char *v19;
  const char *v20;
  int v21;
  int v22;
  int v23;
  const char *v24;
  const char *v25;
  CFIndex v26;
  int v27;
  const char *v28;
  uint64_t result;
  int v30;
  const char *v31;
  CFErrorRef v32;
  const char *v33;
  char *v34;
  char *v35;
  char *v36;
  CFErrorRef v37;
  int v38;
  const char *v39;
  char *v40;
  int v41;
  uint64_t v42;
  char __dst[1024];
  char v44[1024];
  int v45;
  const char *v46;
  __int16 v47;
  char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = *a4;
  bzero(v44, 0x400uLL);
  memcpy(__dst, "cryptex.personalize.XXXXXX", sizeof(__dst));
  v41 = -1;
  v42 = 0;
  if (a3)
  {
    if (*(_QWORD *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      v7 = *(const char **)(v6 + 16);
      if (!v7)
        v7 = "[anonymous]";
      v45 = 136446210;
      v46 = v7;
    }
    else
    {
      v14 = *(const char **)(v6 + 16);
      if (!v14)
        v14 = "[anonymous]";
      v45 = 136446210;
      v46 = v14;
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    Error = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 196, "com.apple.security.cryptex", 5, a3, v15);
    v9 = -1;
    goto LABEL_37;
  }
  _confstr(65537, v44);
  v8 = open(v44, 0x100000);
  v9 = v8;
  if (v8 < 0)
  {
    v17 = *__error();
    if (*(_QWORD *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      v18 = *(const char **)(v6 + 16);
      v45 = 136446722;
      if (v18)
        v19 = v18;
      else
        v19 = "[anonymous]";
      v46 = v19;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v17;
    }
    else
    {
      v28 = "[anonymous]";
      if (*(_QWORD *)(v6 + 16))
        v28 = *(const char **)(v6 + 16);
      v45 = 136446722;
      v46 = v28;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v17;
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    v27 = 205;
    v26 = v17;
    goto LABEL_36;
  }
  v10 = _mkodtempat(v8, __dst, &v41);
  if (v10)
  {
    v11 = v10;
    if (*(_QWORD *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      v12 = *(const char **)(v6 + 16);
      v45 = 136446722;
      if (v12)
        v13 = v12;
      else
        v13 = "[anonymous]";
      v46 = v13;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v11;
    }
    else
    {
      v25 = "[anonymous]";
      if (*(_QWORD *)(v6 + 16))
        v25 = *(const char **)(v6 + 16);
      v45 = 136446722;
      v46 = v25;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v10;
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    v26 = v11;
    v27 = 213;
LABEL_36:
    Error = createError("_cryptex_personalize2_continue_tss", "cryptex.c", v27, "com.apple.security.cryptex.posix", v26, 0, v15);
LABEL_37:
    free(v15);
    a4[2] = (uint64_t)Error;
    cryptex_tss_async();
    goto LABEL_38;
  }
  v20 = *(const char **)(MEMORY[0x24BEDBA68] + 40);
  v21 = openat(v41, v20, 513, 438);
  if ((v21 & 0x80000000) == 0)
  {
    v22 = cryptex_signature_write();
    if (v22)
    {
      v23 = v22;
      if (*(_QWORD *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        v24 = *(const char **)(v6 + 16);
        if (!v24)
          v24 = "[anonymous]";
        v45 = 136446466;
        v46 = v24;
        v47 = 1024;
        LODWORD(v48) = v23;
      }
      else
      {
        v33 = *(const char **)(v6 + 16);
        if (!v33)
          v33 = "[anonymous]";
        v45 = 136446466;
        v46 = v33;
        v47 = 1024;
        LODWORD(v48) = v22;
      }
      v34 = (char *)_os_log_send_and_compose_impl();
      v32 = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 229, "com.apple.security.cryptex.posix", v23, 0, v34);
      v35 = v34;
    }
    else
    {
      if ((openat(v41, v20, 0) & 0x80000000) == 0)
      {
        v42 = cryptex_asset_new();
        cryptex_core_set_asset();
        v32 = 0;
LABEL_54:
        a4[2] = (uint64_t)v32;
        cryptex_tss_async();
LABEL_58:
        if (close(v21) == -1)
          _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
        goto LABEL_38;
      }
      v38 = *__error();
      if (*(_QWORD *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        v39 = *(const char **)(v6 + 16);
        if (!v39)
          v39 = "[anonymous]";
      }
      else
      {
        v39 = *(const char **)(v6 + 16);
        if (!v39)
          v39 = "[anonymous]";
      }
      v45 = 136446466;
      v46 = v39;
      v47 = 1024;
      LODWORD(v48) = v38;
      v40 = (char *)_os_log_send_and_compose_impl();
      v32 = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 238, "com.apple.security.cryptex.posix", v38, 0, v40);
      v35 = v40;
    }
    free(v35);
    goto LABEL_54;
  }
  v30 = *__error();
  if (*(_QWORD *)(v6 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
    v31 = *(const char **)(v6 + 16);
    if (!v31)
      v31 = "[anonymous]";
  }
  else
  {
    v31 = *(const char **)(v6 + 16);
    if (!v31)
      v31 = "[anonymous]";
  }
  v45 = 136446466;
  v46 = v31;
  v47 = 1024;
  LODWORD(v48) = v30;
  v36 = (char *)_os_log_send_and_compose_impl();
  v37 = createError("_cryptex_personalize2_continue_tss", "cryptex.c", 222, "com.apple.security.cryptex.posix", v30, 0, v36);
  free(v36);
  a4[2] = (uint64_t)v37;
  cryptex_tss_async();
  if (v21 != -1)
    goto LABEL_58;
LABEL_38:
  result = v41;
  if (v41 != -1)
  {
    result = close(v41);
    if ((_DWORD)result == -1)
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
  }
  if (v9 != -1)
  {
    result = close(v9);
    if ((_DWORD)result == -1)
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
  }
  return result;
}

uint64_t _cryptex_personalize2_continue(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *v14;
  char *v15;
  CFErrorRef Error;
  int v17;
  const char *v18;
  const char *v19;
  const char *v20;
  int v21;
  int v22;
  int v23;
  const char *v24;
  const char *v25;
  CFIndex v26;
  int v27;
  const char *v28;
  uint64_t result;
  int v30;
  const char *v31;
  CFErrorRef v32;
  const char *v33;
  char *v34;
  char *v35;
  char *v36;
  CFErrorRef v37;
  int v38;
  const char *v39;
  char *v40;
  int v41;
  uint64_t v42;
  char __dst[1024];
  char v44[1024];
  int v45;
  const char *v46;
  __int16 v47;
  char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = *a4;
  bzero(v44, 0x400uLL);
  memcpy(__dst, "cryptex.personalize.XXXXXX", sizeof(__dst));
  v41 = -1;
  v42 = 0;
  if (a3)
  {
    if (*(_QWORD *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      v7 = *(const char **)(v6 + 16);
      if (!v7)
        v7 = "[anonymous]";
      v45 = 136446210;
      v46 = v7;
    }
    else
    {
      v14 = *(const char **)(v6 + 16);
      if (!v14)
        v14 = "[anonymous]";
      v45 = 136446210;
      v46 = v14;
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    Error = createError("_cryptex_personalize2_continue", "cryptex.c", 123, "com.apple.security.cryptex", 5, a3, v15);
    v9 = -1;
    goto LABEL_37;
  }
  _confstr(65537, v44);
  v8 = open(v44, 0x100000);
  v9 = v8;
  if (v8 < 0)
  {
    v17 = *__error();
    if (*(_QWORD *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      v18 = *(const char **)(v6 + 16);
      v45 = 136446722;
      if (v18)
        v19 = v18;
      else
        v19 = "[anonymous]";
      v46 = v19;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v17;
    }
    else
    {
      v28 = "[anonymous]";
      if (*(_QWORD *)(v6 + 16))
        v28 = *(const char **)(v6 + 16);
      v45 = 136446722;
      v46 = v28;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v17;
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    v27 = 132;
    v26 = v17;
    goto LABEL_36;
  }
  v10 = _mkodtempat(v8, __dst, &v41);
  if (v10)
  {
    v11 = v10;
    if (*(_QWORD *)(v6 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
      v12 = *(const char **)(v6 + 16);
      v45 = 136446722;
      if (v12)
        v13 = v12;
      else
        v13 = "[anonymous]";
      v46 = v13;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v11;
    }
    else
    {
      v25 = "[anonymous]";
      if (*(_QWORD *)(v6 + 16))
        v25 = *(const char **)(v6 + 16);
      v45 = 136446722;
      v46 = v25;
      v47 = 2080;
      v48 = v44;
      v49 = 1024;
      v50 = v10;
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    v26 = v11;
    v27 = 140;
LABEL_36:
    Error = createError("_cryptex_personalize2_continue", "cryptex.c", v27, "com.apple.security.cryptex.posix", v26, 0, v15);
LABEL_37:
    free(v15);
    a4[2] = (uint64_t)Error;
    cryptex_target_async_f();
    goto LABEL_38;
  }
  v20 = *(const char **)(MEMORY[0x24BEDBA68] + 40);
  v21 = openat(v41, v20, 513, 438);
  if ((v21 & 0x80000000) == 0)
  {
    v22 = cryptex_signature_write();
    if (v22)
    {
      v23 = v22;
      if (*(_QWORD *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        v24 = *(const char **)(v6 + 16);
        if (!v24)
          v24 = "[anonymous]";
        v45 = 136446466;
        v46 = v24;
        v47 = 1024;
        LODWORD(v48) = v23;
      }
      else
      {
        v33 = *(const char **)(v6 + 16);
        if (!v33)
          v33 = "[anonymous]";
        v45 = 136446466;
        v46 = v33;
        v47 = 1024;
        LODWORD(v48) = v22;
      }
      v34 = (char *)_os_log_send_and_compose_impl();
      v32 = createError("_cryptex_personalize2_continue", "cryptex.c", 156, "com.apple.security.cryptex.posix", v23, 0, v34);
      v35 = v34;
    }
    else
    {
      if ((openat(v41, v20, 0) & 0x80000000) == 0)
      {
        v42 = cryptex_asset_new();
        cryptex_core_set_asset();
        v32 = 0;
LABEL_54:
        a4[2] = (uint64_t)v32;
        cryptex_target_async_f();
LABEL_58:
        if (close(v21) == -1)
          _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
        goto LABEL_38;
      }
      v38 = *__error();
      if (*(_QWORD *)(v6 + 32))
      {
        os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
        v39 = *(const char **)(v6 + 16);
        if (!v39)
          v39 = "[anonymous]";
      }
      else
      {
        v39 = *(const char **)(v6 + 16);
        if (!v39)
          v39 = "[anonymous]";
      }
      v45 = 136446466;
      v46 = v39;
      v47 = 1024;
      LODWORD(v48) = v38;
      v40 = (char *)_os_log_send_and_compose_impl();
      v32 = createError("_cryptex_personalize2_continue", "cryptex.c", 165, "com.apple.security.cryptex.posix", v38, 0, v40);
      v35 = v40;
    }
    free(v35);
    goto LABEL_54;
  }
  v30 = *__error();
  if (*(_QWORD *)(v6 + 32))
  {
    os_log_type_enabled(*(os_log_t *)(v6 + 32), OS_LOG_TYPE_ERROR);
    v31 = *(const char **)(v6 + 16);
    if (!v31)
      v31 = "[anonymous]";
  }
  else
  {
    v31 = *(const char **)(v6 + 16);
    if (!v31)
      v31 = "[anonymous]";
  }
  v45 = 136446466;
  v46 = v31;
  v47 = 1024;
  LODWORD(v48) = v30;
  v36 = (char *)_os_log_send_and_compose_impl();
  v37 = createError("_cryptex_personalize2_continue", "cryptex.c", 149, "com.apple.security.cryptex.posix", v30, 0, v36);
  free(v36);
  a4[2] = (uint64_t)v37;
  cryptex_target_async_f();
  if (v21 != -1)
    goto LABEL_58;
LABEL_38:
  result = v41;
  if (v41 != -1)
  {
    result = close(v41);
    if ((_DWORD)result == -1)
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
  }
  if (v9 != -1)
  {
    result = close(v9);
    if ((_DWORD)result == -1)
      _cryptex_bundle_new_asset_from_object_cold_1(&v42, &v45);
  }
  return result;
}

CFErrorRef cryptex_fcopy_personalized_manifest2(uint64_t a1, int a2)
{
  uint64_t asset;
  uint64_t v5;
  int v6;
  int v7;
  CFIndex v8;
  const char *v9;
  const char *v10;
  CFIndex v11;
  const char *v12;
  const char *v13;
  const char *v14;
  char *v15;
  CFErrorRef Error;
  int v17;
  char *v18;
  int v19;
  char *v20;
  int v21;
  CFIndex v22;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  asset = cryptex_core_get_asset();
  if (asset)
  {
    v5 = asset;
    v6 = dup(a2);
    if ((v6 & 0x80000000) == 0)
    {
      v7 = *(_DWORD *)(v5 + 16);
      if (v7 < 0)
      {
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          v13 = *(const char **)(a1 + 16);
          if (!v13)
            v13 = "[anonymous]";
        }
        else
        {
          v13 = *(const char **)(a1 + 16);
          if (!v13)
            v13 = "[anonymous]";
        }
        v25 = 136446466;
        v26 = v13;
        v27 = 1024;
        v28 = 9;
        v20 = (char *)_os_log_send_and_compose_impl();
        v21 = 1144;
        v22 = 9;
      }
      else
      {
        if (!fcopyfile(v7, a2, 0, 0xFu))
        {
          Error = 0;
          goto LABEL_39;
        }
        v8 = *__error();
        if (*(_QWORD *)(a1 + 32))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
          if (*(_QWORD *)(a1 + 16))
            v9 = *(const char **)(a1 + 16);
          else
            v9 = "[anonymous]";
        }
        else if (*(_QWORD *)(a1 + 16))
        {
          v9 = *(const char **)(a1 + 16);
        }
        else
        {
          v9 = "[anonymous]";
        }
        v19 = *__error();
        v25 = 136446466;
        v26 = v9;
        v27 = 1024;
        v28 = v19;
        v20 = (char *)_os_log_send_and_compose_impl();
        v21 = 1150;
        v22 = v8;
      }
      Error = createError("cryptex_fcopy_personalized_manifest2", "cryptex.c", v21, "com.apple.security.cryptex.posix", v22, 0, v20);
      free(v20);
LABEL_39:
      if (close(v6) == -1)
        _cryptex_bundle_new_asset_from_object_cold_1(&v24, &v25);
      return Error;
    }
    v11 = *__error();
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      if (*(_QWORD *)(a1 + 16))
        v12 = *(const char **)(a1 + 16);
      else
        v12 = "[anonymous]";
    }
    else if (*(_QWORD *)(a1 + 16))
    {
      v12 = *(const char **)(a1 + 16);
    }
    else
    {
      v12 = "[anonymous]";
    }
    v17 = *__error();
    v25 = 136446466;
    v26 = v12;
    v27 = 1024;
    v28 = v17;
    v18 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_fcopy_personalized_manifest2", "cryptex.c", 1138, "com.apple.security.cryptex.posix", v11, 0, v18);
    free(v18);
    if (v6 != -1)
      goto LABEL_39;
  }
  else
  {
    if (*(_QWORD *)(a1 + 32))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR);
      v10 = *(const char **)(a1 + 16);
      if (!v10)
        v10 = "[anonymous]";
      v25 = 136446466;
      v26 = v10;
      v27 = 1024;
      v28 = 2;
    }
    else
    {
      v14 = *(const char **)(a1 + 16);
      if (!v14)
        v14 = "[anonymous]";
      v25 = 136446466;
      v26 = v14;
      v27 = 1024;
      v28 = 2;
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    Error = createError("cryptex_fcopy_personalized_manifest2", "cryptex.c", 1131, "com.apple.security.cryptex.posix", 2, 0, v15);
    free(v15);
  }
  return Error;
}

uint64_t cryptex_attach_personalized_manifest(uint64_t a1, int a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = -1;
  if (cryptex_core_get_asset())
  {
    v4 = *(const char **)(a1 + 16);
    v5 = *__error();
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = "[anonymous]";
      if (v4)
        v7 = v4;
      *(_DWORD *)buf = 136446466;
      v21 = v7;
      v22 = 1024;
      v23 = 17;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_ERROR, "%{public}s: This cryptex is already personalized.: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v5;
    v8 = 17;
  }
  else
  {
    v18 = dup(a2);
    if (v18 < 0)
    {
      v8 = *__error();
      v10 = *(const char **)(a1 + 16);
      v11 = *__error();
      v12 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = "[anonymous]";
        if (v10)
          v13 = v10;
        *(_DWORD *)buf = 136446466;
        v21 = v13;
        v22 = 1024;
        v23 = v8;
        _os_log_impl(&dword_2126F8000, v12, OS_LOG_TYPE_ERROR, "%{public}s: Failed to dup manifest fd.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v11;
    }
    else
    {
      v19 = cryptex_asset_new();
      if (v19)
      {
        cryptex_core_set_asset();
        v8 = 0;
      }
      else
      {
        v14 = *(const char **)(a1 + 16);
        v15 = *__error();
        v16 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = "[anonymous]";
          if (v14)
            v17 = v14;
          *(_DWORD *)buf = 136446466;
          v21 = v17;
          v22 = 1024;
          v23 = 12;
          _os_log_impl(&dword_2126F8000, v16, OS_LOG_TYPE_ERROR, "%{public}s: Failed to create new asset.: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v15;
        v8 = 12;
      }
    }
  }
  if (v18 != -1 && close(v18) == -1)
    _cryptex_bundle_new_asset_from_object_cold_1(&v19, buf);
  return v8;
}

uint64_t cryptex_copy_installed_cryptex()
{
  int v0;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2[0] = 67109120;
    v2[1] = 45;
    _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Not supported on this platform.: %{darwin.errno}d", (uint8_t *)v2, 8u);
  }
  *__error() = v0;
  return 45;
}

uint64_t cryptex_upgrade_stage2(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4)
{
  char *v5;
  CFErrorRef Error;

  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v5 = (char *)_os_log_send_and_compose_impl();
  Error = createError("cryptex_upgrade_stage2", "cryptex.c", 1220, "com.apple.security.cryptex", 10, 0, v5);
  free(v5);
  if (a4 && Error)
  {
    *a4 = CFRetain(Error);
LABEL_5:
    CFRelease(Error);
    return 0;
  }
  if (Error)
    goto LABEL_5;
  return 1;
}

uint64_t cryptex_upgrade_commit2(uint64_t a1, CFTypeRef *a2)
{
  char *v3;
  CFErrorRef Error;

  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v3 = (char *)_os_log_send_and_compose_impl();
  Error = createError("cryptex_upgrade_commit2", "cryptex.c", 1242, "com.apple.security.cryptex", 10, 0, v3);
  free(v3);
  if (a2 && Error)
  {
    *a2 = CFRetain(Error);
LABEL_5:
    CFRelease(Error);
    return 0;
  }
  if (Error)
    goto LABEL_5;
  return 1;
}

uint64_t cryptex_upgrade_abort2(uint64_t a1, CFTypeRef *a2)
{
  char *v3;
  CFErrorRef Error;

  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v3 = (char *)_os_log_send_and_compose_impl();
  Error = createError("cryptex_upgrade_abort2", "cryptex.c", 1264, "com.apple.security.cryptex", 10, 0, v3);
  free(v3);
  if (a2 && Error)
  {
    *a2 = CFRetain(Error);
LABEL_5:
    CFRelease(Error);
    return 0;
  }
  if (Error)
    goto LABEL_5;
  return 1;
}

uint64_t _cryptex_identity_init_from_dict(void *a1, NSObject *a2, uint64_t a3, int a4)
{
  unint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  xpc_object_t v13;
  int v14;
  xpc_object_t v15;
  int v16;
  xpc_object_t v17;
  int v18;
  xpc_object_t v19;
  void *v20;
  int v21;
  int v22;
  BOOL v23;
  int v25;
  int v26;
  const char *v27;
  const char *string_ptr;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  int *v34;
  int v35;
  int value;
  int v37;
  int v38;
  uint64_t v39;
  const char *v40;
  int v41;
  const char *v42;
  int v43;
  uint64_t v44;
  const char *v45;
  int v46;
  const char *v47;
  xpc_object_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  char *v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v55 = 0;
  v8 = (unint64_t)_xpc_plist_value_copy((uint64_t)&_ap_boardid, a1);
  if (!v8)
  {
    v9 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "ApBoardID";
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v9;
  }
  v10 = (unint64_t)_xpc_plist_value_copy((uint64_t)&_ap_chipid, a1);
  if (!v10)
  {
    v11 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "ApChipID";
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v11;
  }
  v12 = (unint64_t)_xpc_plist_value_copy((uint64_t)&_ap_security_domain, a1);
  if (!v12)
  {
    v21 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "ApSecurityDomain";
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v21;
    if (a4)
      goto LABEL_11;
LABEL_28:
    v13 = 0;
    v15 = 0;
    v17 = 0;
    v20 = 0;
    goto LABEL_32;
  }
  if (!a4)
    goto LABEL_28;
LABEL_11:
  v13 = _xpc_plist_value_copy((uint64_t)&_cryptex1_chip, a1);
  if (!v13)
  {
    v14 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "Cryptex1,ChipID";
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v14;
  }
  v15 = _xpc_plist_value_copy((uint64_t)&_cryptex1_type, a1);
  if (!v15)
  {
    v16 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "Cryptex1,Type";
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v16;
  }
  v17 = _xpc_plist_value_copy((uint64_t)&_cryptex1_styp_0, a1);
  if (!v17)
  {
    v18 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "Cryptex1,SubType";
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    *__error() = v18;
  }
  v19 = _xpc_plist_value_copy((uint64_t)&_cryptex1_product_class, a1);
  if (v19)
  {
    v20 = v19;
  }
  else
  {
    v22 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "Cryptex1,ProductClass";
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "missing property: %s", buf, 0xCu);
    }
    v20 = 0;
    *__error() = v22;
  }
LABEL_32:
  if (v8)
    v23 = v10 == 0;
  else
    v23 = 1;
  v25 = !v23 && v12 != 0;
  if (v25 != ((v8 | v10 | v12) != 0))
  {
    v26 = *__error();
    if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 67109120;
    LODWORD(v57) = 22;
    v27 = "build identity device identifiers incomplete: %{darwin.errno}d";
    goto LABEL_67;
  }
  if ((!v15 || !v17 || !v20) && (v13 || v15 || v17 || v20))
  {
    v26 = *__error();
    if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 67109120;
    LODWORD(v57) = 22;
    v27 = "build identity cryptex1 identifiers incomplete: %{darwin.errno}d";
LABEL_67:
    _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_ERROR, v27, buf, 8u);
LABEL_68:
    *__error() = v26;
    v39 = 22;
    if (!v20)
      goto LABEL_92;
LABEL_91:
    os_release(v20);
    goto LABEL_92;
  }
  if (v8 | v10 | v12)
  {
    string_ptr = xpc_string_get_string_ptr((xpc_object_t)v8);
    v29 = _strtou32(string_ptr, &v55, 0);
    if (v55 && *v55)
    {
      v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      *(_DWORD *)buf = 136315650;
      v57 = "ApBoardID";
      v58 = 2112;
      v59 = v8;
      v60 = 1024;
      v61 = 214;
      goto LABEL_89;
    }
    v40 = xpc_string_get_string_ptr((xpc_object_t)v10);
    v41 = _strtou32(v40, &v55, 0);
    if (v55 && *v55)
    {
      v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      *(_DWORD *)buf = 136315650;
      v57 = "ApChipID";
      v58 = 2112;
      v59 = v10;
      v60 = 1024;
      v61 = 214;
      goto LABEL_89;
    }
    HIDWORD(v54) = v41;
    v42 = xpc_string_get_string_ptr((xpc_object_t)v12);
    v43 = _strtou32(v42, &v55, 0);
    if (v55 && *v55)
    {
      v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      *(_DWORD *)buf = 136315650;
      v57 = "ApSecurityDomain";
      v58 = 2112;
      v59 = v12;
      v60 = 1024;
      v61 = 214;
      goto LABEL_89;
    }
    v53 = v43;
    LODWORD(v54) = v29;
    v32 = 0;
    if (v13)
      goto LABEL_79;
  }
  else
  {
    v31 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "build identity has no device identifiers", buf, 2u);
    }
    v54 = 0;
    v53 = 0;
    *__error() = v31;
    v32 = 1;
    if (v13)
      goto LABEL_79;
  }
  if (!v15 && !v17 && !v20)
  {
    v51 = v32;
    v52 = a3;
    v49 = v13;
    v33 = *__error();
    if (os_log_type_enabled(a2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_DEBUG, "build identity has no cryptex1 identifiers", buf, 2u);
    }
    v34 = __error();
    v35 = 0;
    value = 0;
    v37 = 0;
    v38 = 0;
    *v34 = v33;
    v13 = v49;
    goto LABEL_106;
  }
LABEL_79:
  if (v13)
  {
    v44 = v32 | 6;
    v45 = xpc_string_get_string_ptr(v13);
    v46 = _strtou32(v45, &v55, 0);
    if (v55 && *v55)
    {
      v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      *(_DWORD *)buf = 136315650;
      v57 = "Cryptex1,ChipID";
      v58 = 2112;
      v59 = (unint64_t)v13;
      v60 = 1024;
      v61 = 214;
      goto LABEL_89;
    }
  }
  else
  {
    v46 = 0;
    v44 = v32 | 2;
  }
  v50 = v46;
  v51 = v44;
  v52 = a3;
  value = xpc_int64_get_value(v15);
  v37 = xpc_int64_get_value(v17);
  v47 = xpc_string_get_string_ptr(v20);
  v38 = _strtou32(v47, &v55, 0);
  if (v55)
  {
    v35 = v50;
    if (*v55)
    {
      v30 = *__error();
      if (!os_log_type_enabled(a2, OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      *(_DWORD *)buf = 136315650;
      v57 = "Cryptex1,ProductClass";
      v58 = 2112;
      v59 = (unint64_t)v20;
      v60 = 1024;
      v61 = 214;
LABEL_89:
      _os_log_impl(&dword_2126F8000, a2, OS_LOG_TYPE_ERROR, "invalid %s value: %@: %{darwin.errno}d", buf, 0x1Cu);
LABEL_90:
      *__error() = v30;
      v39 = 214;
      if (!v20)
        goto LABEL_92;
      goto LABEL_91;
    }
  }
  else
  {
    v35 = v50;
  }
LABEL_106:
  v39 = 0;
  *(_QWORD *)v52 = 1;
  *(_QWORD *)(v52 + 8) = v51;
  *(_QWORD *)(v52 + 16) = v54;
  *(_DWORD *)(v52 + 24) = v53;
  *(_DWORD *)(v52 + 28) = v35;
  *(_DWORD *)(v52 + 32) = value;
  *(_DWORD *)(v52 + 36) = v37;
  *(_DWORD *)(v52 + 40) = v38;
  *(_DWORD *)(v52 + 44) = 0;
  if (v20)
    goto LABEL_91;
LABEL_92:
  if (v17)
    os_release(v17);
  if (v15)
    os_release(v15);
  if (v13)
    os_release(v13);
  if (v12)
    os_release((void *)v12);
  if (v10)
    os_release((void *)v10);
  if (v8)
    os_release((void *)v8);
  return v39;
}

CFIndex cryptex_install(uint64_t a1, uint64_t a2)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_install2(a1, a2, (CFErrorRef *)&cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

CFIndex cryptex_personalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, uint64_t a7)
{
  CFIndex TopLevelPosixError;
  _QWORD v9[6];
  CFErrorRef v10;

  v10 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = __cryptex_personalize_block_invoke;
  v9[3] = &__block_descriptor_tmp_1;
  v9[4] = a7;
  v9[5] = a6;
  if (cryptex_personalize2(a1, a2, a3, a4, &v10, a5, v9))
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)v10);
  if (v10)
    CFRelease(v10);
  return TopLevelPosixError;
}

uint64_t __cryptex_personalize_block_invoke(uint64_t a1, CFIndex TopLevelPosixError, uint64_t a3)
{
  if (TopLevelPosixError)
    TopLevelPosixError = _CFErrorGetTopLevelPosixError(TopLevelPosixError);
  return (*(uint64_t (**)(uint64_t, CFIndex, _QWORD))(a1 + 32))(a3, TopLevelPosixError, *(_QWORD *)(a1 + 40));
}

CFErrorRef cryptex_fcopy_personalized_manifest(uint64_t a1, int a2)
{
  CFErrorRef result;
  CFErrorRef v3;
  CFIndex TopLevelPosixError;

  result = cryptex_fcopy_personalized_manifest2(a1, a2);
  if (result)
  {
    v3 = result;
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)result);
    CFRelease(v3);
    return (CFErrorRef)TopLevelPosixError;
  }
  return result;
}

CFIndex cryptex_upgrade_abort(uint64_t a1)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_upgrade_abort2(a1, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

CFIndex cryptex_upgrade_stage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_upgrade_stage2(a1, a2, a3, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

CFIndex cryptex_upgrade_commit(uint64_t a1)
{
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  cf = 0;
  if ((cryptex_upgrade_commit2(a1, &cf) & 1) != 0)
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);
  return TopLevelPosixError;
}

void _cryptex_personalize2_callback(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[8];

  v1 = *a1;
  v3 = a1[3];
  v2 = a1[4];
  v4 = a1[2];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = ___cryptex_personalize2_callback_block_invoke;
  v5[3] = &unk_24CE0BBD8;
  v5[4] = v2;
  v5[5] = v4;
  v5[6] = v1;
  v5[7] = a1;
  dispatch_async(v3, v5);
  if (v3)
    os_release(v3);
}

void ___cryptex_personalize2_callback_block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(void **)(a1 + 32);
  if (v2)
    os_release(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  ctx_destroy(*(void ***)(a1 + 56));
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return _os_log_send_and_compose_impl();
}

CFDataRef _AMAuthInstallCryptex1CopyUDID(const __CFNumber *a1, const __CFNumber *a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = 0;
  v5 = 0;
  CFNumberGetValue(a1, kCFNumberSInt32Type, (char *)&v4 + 4);
  CFNumberGetValue(a2, kCFNumberSInt64Type, &v5);
  HIDWORD(v4) = bswap32(HIDWORD(v4));
  v5 = bswap64(v5);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&v4, 16);
}

id _remote_service_log()
{
  if (_remote_service_log_onceToken != -1)
    dispatch_once(&_remote_service_log_onceToken, &__block_literal_global_139);
  return (id)_remote_service_log_osl;
}

void sub_212713A84(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_212713BD4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_2127142AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, CFTypeRef cf)
{
  void *v12;

  free(v12);
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(a1);
}

uint64_t cryptex_remote_service_nonce_get_nonce(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (!v1)
    cryptex_remote_service_nonce_get_nonce_cold_1();
  v2 = v1;
  v3 = objc_msgSend(v1, "nonce");

  return v3;
}

CryptexRemoteServiceNonceAttr *cryptex_remote_service_nonce_attr_create()
{
  return objc_alloc_init(CryptexRemoteServiceNonceAttr);
}

void cryptex_remote_service_nonce_attr_set_image_type(void *a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = a1;
  if (!v3)
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  v4 = v3;
  objc_msgSend(v3, "setImage_type:", a2);

}

void cryptex_remote_service_nonce_attr_set_persistence(void *a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = a1;
  if (!v3)
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  v4 = v3;
  objc_msgSend(v3, "setPersistence:", a2);

}

void cryptex_remote_service_nonce_attr_set_cryptex(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (!v3)
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  v5 = v4;
  if (!v4)
    cryptex_remote_service_nonce_attr_set_cryptex_cold_2();
  _cryptex_get_core((uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage_type:", cryptex_get_image_type());
  if (objc_msgSend(v3, "image_type") == 2)
  {
    if (cryptex_core_get_nonce_domain_handle())
      cryptex_remote_service_nonce_attr_set_cryptex_cold_3();
    objc_msgSend(v3, "setNdom_handle:", 0);
  }

}

uint64_t cryptex_remote_service_nonce_attr_get_nonce_domain(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t nonce_domain_from_index;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (!v1)
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  v2 = v1;
  v3 = objc_msgSend(v1, "getNonceDomainIndex");
  v4 = *__error();
  _remote_service_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218496;
    v9 = objc_msgSend(v2, "image_type");
    v10 = 2048;
    v11 = objc_msgSend(v2, "persistence");
    v12 = 2048;
    v13 = v3;
    _os_log_impl(&dword_2126F8000, v5, OS_LOG_TYPE_DEBUG, "nonce attr [image_type = %llu, persistence = %llu] => domain index: %llu", (uint8_t *)&v8, 0x20u);
  }

  *__error() = v4;
  nonce_domain_from_index = _img4_get_nonce_domain_from_index(v3);

  return nonce_domain_from_index;
}

BOOL cryptex_remote_service_copy_device_identifier2(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *personalization_identifiers_request;
  NSObject *v8;
  id v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t name;
  uint64_t v26;
  uint64_t v27;
  CFErrorRef v28;
  id v29;
  void *v30;
  uint64_t v31;
  CFErrorRef Error;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  char *v37;
  CFErrorRef v38;
  uint64_t *v39;
  CFTypeRef v40;
  uint64_t v41;
  const void *v42;
  _QWORD block[4];
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD v59[9];
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (!v5)
    cryptex_remote_service_copy_device_identifier2_cold_1();
  if (!a2)
    cryptex_remote_service_copy_device_identifier2_cold_2();
  v6 = v5;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  memset(v59, 0, sizeof(v59));
  LOWORD(v59[0]) = 6;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  v54 = 0;
  if (objc_msgSend(v5, "supportsFeature:", "ReadIdentifiers"))
  {
    personalization_identifiers_request = (void *)remote_service_create_personalization_identifiers_request();
    objc_msgSend(v6, "internal_queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __cryptex_remote_service_copy_device_identifier2_block_invoke;
    block[3] = &unk_24CE0BC20;
    v47 = &v55;
    v45 = v6;
    v9 = personalization_identifiers_request;
    v46 = v9;
    v48 = &v49;
    dispatch_sync(v8, block);

    if (v56[3])
    {
      v10 = *__error();
      _remote_service_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v56[3];
        *(_DWORD *)buf = 138412290;
        v61 = v12;
        _os_log_impl(&dword_2126F8000, v11, OS_LOG_TYPE_ERROR, "personalization identifier request failed: %@", buf, 0xCu);
      }
LABEL_18:

      *__error() = v10;
      v28 = 0;
      goto LABEL_38;
    }
    img4_chip_instance_from_xpc((void *)v50[5], (uint64_t)v59);
    v26 = objc_claimAutoreleasedReturnValue();
    v56[3] = v26;
    if (v26)
    {
      v10 = *__error();
      _remote_service_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v27 = v56[3];
        *(_DWORD *)buf = 138412290;
        v61 = v27;
        _os_log_impl(&dword_2126F8000, v11, OS_LOG_TYPE_ERROR, "failed to decode AppleImage4 chip instance.: %@", buf, 0xCu);
      }
      goto LABEL_18;
    }

    v13 = v45;
    goto LABEL_25;
  }
  v13 = v6;
  objc_msgSend(v13, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = remote_device_get_state() == 2;

  if (!v15)
  {
    _remote_service_log();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      _remote_service_log();
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      objc_msgSend(v13, "device");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      name = remote_device_get_name();
      *(_DWORD *)buf = 136315138;
      v61 = name;
      v21 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v29 = MEMORY[0x24BDACB70];
      objc_msgSend(v13, "device");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = remote_device_get_name();
      *(_DWORD *)buf = 136315138;
      v61 = v31;
      v21 = (char *)_os_log_send_and_compose_impl();

      v23 = MEMORY[0x24BDACB70];
    }

    Error = createError("_cryptex_remote_service_copy_device_identifier_from_rsd", "remote_service.m", 396, "com.apple.security.cryptex", 19, 0, v21);
    goto LABEL_30;
  }
  objc_msgSend(v13, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)remote_device_copy_properties();

  if (!v17)
  {
    _remote_service_log();
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      _remote_service_log();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v21 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v21 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("_cryptex_remote_service_copy_device_identifier_from_rsd", "remote_service.m", 405, "com.apple.security.cryptex", 19, 0, v21);
LABEL_30:
    v28 = Error;
    v17 = 0;
    goto LABEL_31;
  }
  v18 = _img4_chip_instance_from_remote_device_properties(v17, (uint64_t)v59);
  if (!v18)
  {

    v9 = 0;
LABEL_25:

LABEL_35:
    v28 = 0;
    *a2 = -[CryptexRemoteDeviceIdentifier initWithChipInstance:]([CryptexRemoteDeviceIdentifier alloc], "initWithChipInstance:", v59);
    goto LABEL_38;
  }
  _remote_service_log();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    _remote_service_log();
    v20 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v18;
    v21 = (char *)_os_log_send_and_compose_impl();

  }
  else
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v18;
    v21 = (char *)_os_log_send_and_compose_impl();
  }
  v28 = createError("_cryptex_remote_service_copy_device_identifier_from_rsd", "remote_service.m", 416, "com.apple.security.cryptex.posix", v18, 0, v21);
LABEL_31:
  free(v21);

  if (!v28)
  {
    v9 = 0;
    goto LABEL_35;
  }
  _remote_service_log();
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    _remote_service_log();
    v36 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    *(_WORD *)buf = 0;
    v37 = (char *)_os_log_send_and_compose_impl();

  }
  else
  {
    *(_WORD *)buf = 0;
    v37 = (char *)_os_log_send_and_compose_impl();
  }
  v38 = createError("cryptex_remote_service_copy_device_identifier2", "remote_service.m", 541, "com.apple.security.cryptex", 19, v28, v37);
  free(v37);
  v9 = 0;
  v56[3] = (uint64_t)v38;
LABEL_38:
  v39 = v56;
  if (a3)
  {
    v40 = (CFTypeRef)v56[3];
    if (v40)
    {
      v40 = CFRetain(v40);
      v39 = v56;
    }
    *a3 = v40;
  }
  v41 = v39[3];
  _Block_object_dispose(&v49, 8);

  if (v28)
    CFRelease(v28);
  _Block_object_dispose(&v55, 8);
  v42 = (const void *)v56[3];
  if (v42)
    CFRelease(v42);

  return v41 == 0;
}

void sub_2127150B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26)
{
  void *v26;
  const void *v28;

  free(v26);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  v28 = *(const void **)(a26 + 24);
  if (v28)
    CFRelease(v28);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __cryptex_remote_service_copy_device_identifier2_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "sendRequestSync:response:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t cryptex_remote_device_identifier_get_chip_inst(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (!v1)
    cryptex_remote_service_copy_device_identifier2_cold_2();
  v2 = v1;
  v3 = objc_msgSend(v1, "inst");

  return v3;
}

uint64_t cryptex_remote_cryptex_get_identifier(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (!v1)
    cryptex_remote_cryptex_get_identifier_cold_1();
  v2 = v1;
  v3 = objc_msgSend(v1, "identifier");

  return v3;
}

uint64_t cryptex_remote_cryptex_get_version_string(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (!v1)
    cryptex_remote_cryptex_get_identifier_cold_1();
  v2 = v1;
  v3 = objc_msgSend(v1, "version");

  return v3;
}

void cryptex_remote_array_apply(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a1;
  v3 = a2;
  if (!v7)
    cryptex_remote_array_apply_cold_1();
  v4 = v3;
  if (!v3)
    cryptex_remote_array_apply_cold_2();
  objc_msgSend(v7, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __cryptex_remote_array_apply_block_invoke;
  v8[3] = &unk_24CE0BC48;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __cryptex_remote_array_apply_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = result ^ 1;
  return result;
}

CryptexRemoteService *cryptex_remote_service_create(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  CryptexRemoteService *v8;

  v5 = a1;
  v6 = a2;
  if (!v5)
    cryptex_remote_service_create_cold_1();
  v7 = v6;
  if (!v6)
    cryptex_remote_service_create_cold_2();
  v8 = -[CryptexRemoteService initWithDevice:queue:flags:]([CryptexRemoteService alloc], "initWithDevice:queue:flags:", v5, v6, a3);

  return v8;
}

BOOL cryptex_remote_service_copy_nonce2(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t nonce_handle_request;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  _WORD *data;
  void *v19;
  NSObject *v20;
  int v21;
  char *v22;
  int v23;
  CFErrorRef Error;
  uint64_t *v25;
  CFTypeRef v26;
  _BOOL8 v27;
  size_t length;
  _QWORD block[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  if (!v7)
    cryptex_remote_service_copy_device_identifier2_cold_1();
  v9 = v8;
  if (!v8)
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  if (!a3)
    cryptex_remote_service_nonce_get_nonce_cold_1();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  if (objc_msgSend(v8, "image_type") == 2)
  {
    objc_msgSend(v9, "ndom_handle");
    nonce_handle_request = remote_service_create_nonce_handle_request();
  }
  else
  {
    objc_msgSend(v9, "getNonceDomainIndex");
    nonce_handle_request = remote_service_create_nonce_index_request();
  }
  v11 = (void *)nonce_handle_request;
  objc_msgSend(v7, "internal_queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __cryptex_remote_service_copy_nonce2_block_invoke;
  block[3] = &unk_24CE0BC20;
  v33 = &v41;
  v13 = v7;
  v31 = v13;
  v14 = v11;
  v32 = v14;
  v34 = &v35;
  dispatch_sync(v12, block);

  if (v42[3])
  {
    v15 = *__error();
    _remote_service_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v42[3];
      *(_DWORD *)buf = 138412290;
      v46 = v17;
      _os_log_impl(&dword_2126F8000, v16, OS_LOG_TYPE_ERROR, "remote service copy nonce request failed: %@", buf, 0xCu);
    }

    *__error() = v15;
  }
  else
  {
    length = 0;
    data = xpc_dictionary_get_data((xpc_object_t)v36[5], "nonce", &length);
    if (*data)
    {
      _remote_service_log();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        _remote_service_log();
        v20 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        v21 = (unsigned __int16)*data;
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v21;
        v22 = (char *)_os_log_send_and_compose_impl();

      }
      else
      {
        v23 = (unsigned __int16)*data;
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v23;
        v22 = (char *)_os_log_send_and_compose_impl();
      }
      Error = createError("cryptex_remote_service_copy_nonce2", "remote_service.m", 650, "com.apple.security.cryptex", 10, 0, v22);
      free(v22);
      v42[3] = (uint64_t)Error;
    }
    else
    {
      *a3 = -[CryptexRemoteServiceNonce initWithNonce:]([CryptexRemoteServiceNonce alloc], "initWithNonce:", data);
    }
  }
  v25 = v42;
  if (a4)
  {
    v26 = (CFTypeRef)v42[3];
    if (v26)
    {
      v26 = CFRetain(v26);
      v25 = v42;
    }
    *a4 = v26;
  }
  v27 = v25[3] == 0;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v27;
}

void sub_2127157C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  void *v21;
  uint64_t v22;

  free(v21);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_copy_nonce2_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "sendRequestSync:response:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_roll_nonce2(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t roll_nonce_handle_request;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  CFTypeRef v17;
  uint64_t v18;
  const void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (!v5)
    cryptex_remote_service_copy_device_identifier2_cold_1();
  v7 = v6;
  if (!v6)
    cryptex_remote_service_roll_nonce2_cold_2();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v27 = 0;
  if (objc_msgSend(v6, "image_type") == 2)
  {
    objc_msgSend(v7, "ndom_handle");
    roll_nonce_handle_request = remote_service_create_roll_nonce_handle_request();
  }
  else
  {
    objc_msgSend(v7, "getNonceDomainIndex");
    roll_nonce_handle_request = remote_service_create_roll_nonce_index_request();
  }
  v9 = (void *)roll_nonce_handle_request;
  objc_msgSend(v5, "internal_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __cryptex_remote_service_roll_nonce2_block_invoke;
  v21[3] = &unk_24CE0BC20;
  v24 = &v28;
  v11 = v5;
  v22 = v11;
  v12 = v9;
  v23 = v12;
  v25 = v26;
  dispatch_sync(v10, v21);

  v13 = v29;
  if (v29[3])
  {
    v14 = *__error();
    _remote_service_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v29[3];
      *(_DWORD *)buf = 138412290;
      v33 = v16;
      _os_log_impl(&dword_2126F8000, v15, OS_LOG_TYPE_ERROR, "remote service roll nonce request failed: %@", buf, 0xCu);
    }

    *__error() = v14;
    v13 = v29;
  }
  if (a3)
  {
    v17 = (CFTypeRef)v13[3];
    if (v17)
    {
      v17 = CFRetain(v17);
      v13 = v29;
    }
    *a3 = v17;
  }
  v18 = v13[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
  v19 = (const void *)v29[3];
  if (v19)
    CFRelease(v19);

  return v18 == 0;
}

void sub_212715AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24)
{
  const void *v25;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  v25 = *(const void **)(a24 + 24);
  if (v25)
    CFRelease(v25);
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_roll_nonce2_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "sendRequestSync:response:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_install2(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  CFErrorRef Error;
  void *v21;
  void *v22;
  uint64_t core;
  uint64_t v24;
  uint64_t nonce_persistence;
  uint64_t install_request;
  id v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  int *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  CFErrorRef v36;
  uint64_t *v37;
  CFTypeRef v38;
  uint64_t v39;
  const void *v40;
  void *v42;
  void *v44;
  _QWORD block[4];
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v42 = v9;
  if (!v9)
    cryptex_remote_service_copy_device_identifier2_cold_1();
  if (!v10)
    cryptex_remote_service_nonce_attr_set_cryptex_cold_2();
  if (!v11)
    cryptex_remote_service_nonce_attr_set_image_type_cold_1();
  v44 = v11;
  if (!a5)
    cryptex_remote_cryptex_get_identifier_cold_1();
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  v56 = 0;
  _cryptex_get_core((uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!cryptex_core_get_image_asset())
  {
    _remote_service_log();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _remote_service_log();
      v14 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v15 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v15 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_remote_service_install2", "remote_service.m", 746, "com.apple.security.cryptex", 11, 0, v15);
    goto LABEL_39;
  }
  dup_np();
  if (!cryptex_core_get_tc_asset())
  {
    _remote_service_log();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      _remote_service_log();
      v17 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v15 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v15 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_remote_service_install2", "remote_service.m", 757, "com.apple.security.cryptex", 11, 0, v15);
    goto LABEL_39;
  }
  dup_np();
  if (!cryptex_core_get_asset())
  {
    _remote_service_log();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      _remote_service_log();
      v19 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      v15 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_WORD *)buf = 0;
      v15 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_remote_service_install2", "remote_service.m", 767, "com.apple.security.cryptex", 11, 0, v15);
LABEL_39:
    v36 = Error;
    free(v15);
    v21 = 0;
    v22 = 0;
    v27 = 0;
    v35 = 0;
    v58[3] = (uint64_t)v36;
    goto LABEL_40;
  }
  dup_np();
  if (cryptex_core_get_info_asset())
    dup_np();
  if (cryptex_core_get_volumehash_asset())
    dup_np();
  if (cryptex_core_is_cryptex1())
  {
    cryptex_core_get_cryptex1_properties();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)cryptex_core_cx1_copy_xpc_dictionary();
  }
  else
  {
    v22 = xpc_dictionary_create(0, 0, 0);
    v21 = 0;
  }
  core = _cryptex_get_core((uint64_t)v44);
  if (core == 2)
    v24 = 2;
  else
    v24 = core == 1;
  nonce_persistence = _cryptex_attr_get_nonce_persistence((uint64_t)v44);
  _cryptex_attr_get_authentication((uint64_t)v44);
  v50 = 0;
  install_request = remote_service_create_install_request();
  v27 = 0;
  v58[3] = install_request;
  if (install_request)
  {
    v28 = *__error();
    _remote_service_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = v58[3];
      *(_DWORD *)buf = 138412290;
      v62 = v30;
      _os_log_impl(&dword_2126F8000, v29, OS_LOG_TYPE_ERROR, "failed to create remote service install request: %@", buf, 0xCu);
    }

    v31 = __error();
LABEL_34:
    v35 = 0;
    *v31 = v28;
    goto LABEL_40;
  }
  objc_msgSend(v42, "internal_queue", v24, nonce_persistence == 1, v22);
  v32 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __cryptex_remote_service_install2_block_invoke;
  block[3] = &unk_24CE0BC20;
  v48 = &v57;
  v46 = v42;
  v27 = v27;
  v47 = v27;
  v49 = &v51;
  dispatch_sync(v32, block);

  if (v58[3])
  {
    v28 = *__error();
    _remote_service_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = v58[3];
      *(_DWORD *)buf = 138412290;
      v62 = v34;
      _os_log_impl(&dword_2126F8000, v33, OS_LOG_TYPE_ERROR, "remote service install request failed: %@", buf, 0xCu);
    }

    v31 = __error();
    goto LABEL_34;
  }
  xpc_dictionary_get_dictionary((xpc_object_t)v52[5], "remote-cryptex");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = -[CryptexRemoteObject initWithDesc:]([CryptexRemoteObject alloc], "initWithDesc:", v35);
LABEL_40:
  v37 = v58;
  if (a6)
  {
    v38 = (CFTypeRef)v58[3];
    if (v38)
    {
      v38 = CFRetain(v38);
      v37 = v58;
    }
    *a6 = v38;
  }
  v39 = v37[3];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
  v40 = (const void *)v58[3];
  if (v40)
    CFRelease(v40);

  return v39 == 0;
}

void sub_212716328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;
  const void *v29;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  v29 = *(const void **)(*(_QWORD *)(v27 - 152) + 24);
  if (v29)
    CFRelease(v29);
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_install2_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "sendRequestSync:response:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_uninstall2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v7;
  void *v8;
  void *uninstall_request;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  CFTypeRef v17;
  uint64_t v18;
  const void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  if (!v7)
    cryptex_remote_service_copy_device_identifier2_cold_1();
  if (!a2)
    cryptex_remote_service_uninstall2_cold_2();
  v8 = v7;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v27 = 0;
  uninstall_request = (void *)remote_service_create_uninstall_request();
  objc_msgSend(v8, "internal_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __cryptex_remote_service_uninstall2_block_invoke;
  v21[3] = &unk_24CE0BC20;
  v24 = &v28;
  v11 = v8;
  v22 = v11;
  v12 = uninstall_request;
  v23 = v12;
  v25 = v26;
  dispatch_sync(v10, v21);

  v13 = v29;
  if (v29[3])
  {
    v14 = *__error();
    _remote_service_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = v29[3];
      *(_DWORD *)buf = 138412290;
      v33 = v16;
      _os_log_impl(&dword_2126F8000, v15, OS_LOG_TYPE_ERROR, "remote service uninstall request failed: %@", buf, 0xCu);
    }

    *__error() = v14;
    v13 = v29;
  }
  if (a5)
  {
    v17 = (CFTypeRef)v13[3];
    if (v17)
    {
      v17 = CFRetain(v17);
      v13 = v29;
    }
    *a5 = v17;
  }
  v18 = v13[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
  v19 = (const void *)v29[3];
  if (v19)
    CFRelease(v19);

  return v18 == 0;
}

void sub_21271662C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24)
{
  const void *v25;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  v25 = *(const void **)(a24 + 24);
  if (v25)
    CFRelease(v25);
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_uninstall2_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "sendRequestSync:response:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

BOOL cryptex_remote_service_copy_installed2(void *a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *copy_installed_request;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  char *v21;
  CFErrorRef Error;
  uint64_t *v23;
  CFTypeRef v24;
  uint64_t v25;
  const void *v26;
  _QWORD applier[4];
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  if (!v6)
    cryptex_remote_service_copy_device_identifier2_cold_1();
  if (!a3)
    cryptex_remote_service_copy_installed2_cold_2();
  v7 = v6;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  copy_installed_request = (void *)remote_service_create_copy_installed_request();
  objc_msgSend(v7, "internal_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __cryptex_remote_service_copy_installed2_block_invoke;
  block[3] = &unk_24CE0BC20;
  v33 = &v41;
  v12 = v7;
  v31 = v12;
  v13 = copy_installed_request;
  v32 = v13;
  v34 = &v35;
  dispatch_sync(v10, block);

  if (v42[3])
  {
    v14 = *__error();
    _remote_service_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (const char *)v42[3];
      *(_DWORD *)buf = 138412290;
      v46 = v16;
      _os_log_impl(&dword_2126F8000, v15, OS_LOG_TYPE_ERROR, "remote service install request failed: %@", buf, 0xCu);
    }

    v17 = 0;
    *__error() = v14;
  }
  else if ((_xpc_dictionary_key_with_type_exists((void *)v36[5], "remote-cryptex-array", MEMORY[0x24BDACF78]) & 1) != 0)
  {
    xpc_dictionary_get_array((xpc_object_t)v36[5], "remote-cryptex-array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = v11;
    applier[1] = 3221225472;
    applier[2] = __cryptex_remote_service_copy_installed2_block_invoke_136;
    applier[3] = &unk_24CE0BC70;
    v18 = v8;
    v29 = v18;
    xpc_array_apply(v17, applier);

    *a3 = -[CryptexRemoteObjectArray initWithArray:]([CryptexRemoteObjectArray alloc], "initWithArray:", v18);
  }
  else
  {
    _remote_service_log();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      _remote_service_log();
      v20 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136315138;
      v46 = "remote-cryptex-array";
      v21 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      *(_DWORD *)buf = 136315138;
      v46 = "remote-cryptex-array";
      v21 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_remote_service_copy_installed2", "remote_service.m", 934, "com.apple.security.cryptex", 16, 0, v21);
    free(v21);
    v17 = 0;
    v42[3] = (uint64_t)Error;
  }
  v23 = v42;
  if (a4)
  {
    v24 = (CFTypeRef)v42[3];
    if (v24)
    {
      v24 = CFRetain(v24);
      v23 = v42;
    }
    *a4 = v24;
  }
  v25 = v23[3];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);
  v26 = (const void *)v42[3];
  if (v26)
    CFRelease(v26);

  return v25 == 0;
}

void sub_212716B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;
  uint64_t v26;
  const void *v28;

  free(v25);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 160), 8);
  v28 = *(const void **)(*(_QWORD *)(v26 - 152) + 24);
  if (v28)
    CFRelease(v28);
  _Unwind_Resume(a1);
}

void __cryptex_remote_service_copy_installed2_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "sendRequestSync:response:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __cryptex_remote_service_copy_installed2_block_invoke_136(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CryptexRemoteObject *v5;

  v4 = a3;
  v5 = -[CryptexRemoteObject initWithDesc:]([CryptexRemoteObject alloc], "initWithDesc:", v4);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  return 1;
}

CFIndex cryptex_remote_service_copy_device_identifier(void *a1, _QWORD *a2)
{
  id v3;
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  v3 = a1;
  cf = 0;
  if (cryptex_remote_service_copy_device_identifier2(v3, a2, &cf))
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);

  return TopLevelPosixError;
}

void sub_212716C8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_copy_nonce(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  v5 = a1;
  v6 = a2;
  cf = 0;
  if (cryptex_remote_service_copy_nonce2(v5, v6, a3, &cf))
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);

  return TopLevelPosixError;
}

void sub_212716D30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_roll_nonce(void *a1, void *a2)
{
  id v3;
  id v4;
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  v3 = a1;
  v4 = a2;
  cf = 0;
  if (cryptex_remote_service_roll_nonce2(v3, v4, &cf))
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);

  return TopLevelPosixError;
}

void sub_212716DCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_install(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  v8 = a1;
  v9 = a2;
  v10 = a3;
  cf = 0;
  if (cryptex_remote_service_install2(v8, v9, v10, v11, a5, &cf))
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);

  return TopLevelPosixError;
}

void sub_212716E84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_uninstall(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  v5 = a1;
  cf = 0;
  if (cryptex_remote_service_uninstall2(v5, a2, a3, v6, &cf))
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);

  return TopLevelPosixError;
}

void sub_212716F18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

CFIndex cryptex_remote_service_copy_installed(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  CFIndex TopLevelPosixError;
  CFTypeRef cf;

  v4 = a1;
  cf = 0;
  if (cryptex_remote_service_copy_installed2(v4, v5, a3, &cf))
    TopLevelPosixError = 0;
  else
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)cf);
  if (cf)
    CFRelease(cf);

  return TopLevelPosixError;
}

void sub_212716F9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

uint64_t cryptex_remote_service_supports_feature(void *a1, const char *a2)
{
  return objc_msgSend(a1, "supportsFeature:", a2);
}

void ___remote_service_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libcryptex", "remote_service_client");
  v1 = (void *)_remote_service_log_osl;
  _remote_service_log_osl = (uint64_t)v0;

}

uint64_t session_create()
{
  uint64_t v0;

  v0 = session_core_create();
  return session_create_from_core(v0);
}

uint64_t session_set_homedir_size(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
    return 22;
  result = 0;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

void _session_dealloc(uint64_t a1)
{
  _xpc_connection_s *v2;
  const void *v3;
  void *v4;
  NSObject *v5;

  v2 = *(_xpc_connection_s **)(a1 + 80);
  if (v2)
  {
    session_send_exit_message(v2);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 80));
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    _Block_release(v3);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v4 = *(void **)(a1 + 80);
  if (v4)
    xpc_release(v4);
  v5 = *(NSObject **)(a1 + 88);
  if (v5)
    dispatch_release(v5);
  os_release(*(void **)(a1 + 40));
  object_proto_destroy(a1 + 16);
}

void session_send_exit_message(_xpc_connection_s *a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "REMOVE", 1);
  xpc_connection_send_message(a1, v2);
  if (v2)
    os_release(v2);
}

uint64_t session_activate(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  xpc_object_t *v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  unsigned int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[352];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v15 = -1;
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)cryptex_session_core_copy_xpc_object();
  if (MEMORY[0x212BF18F8]() != MEMORY[0x24BDACFA0])
    __break(1u);
  v44 = 0;
  memset(v43, 0, sizeof(v43));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v20 = 32;
  v4 = (_QWORD *)daemon_for_session_subsystem(&v15);
  v5 = 0;
  if (!v15)
  {
    _cryptex_actor_init_invoke_u64();
    session_activate_pack();
    v15 = cryptex_actor_trap();
    if (v15)
    {
      v6 = (const char *)v4[2];
      v7 = *__error();
      v8 = v4[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = "[anonymous]";
        if (v6)
          v9 = v6;
        *(_DWORD *)buf = 136446466;
        v17 = v9;
        v18 = 1024;
        v19 = v15;
        v10 = "%{public}s: rpc failed for session create: %{darwin.errno}d";
LABEL_13:
        _os_log_impl(&dword_2126F8000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v15 = session_activate_reply_unpack();
    if (v15)
    {
      v11 = (const char *)v4[2];
      v7 = *__error();
      v8 = v4[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = "[anonymous]";
        if (v11)
          v12 = v11;
        *(_DWORD *)buf = 136446466;
        v17 = v12;
        v18 = 1024;
        v19 = v15;
        v10 = "%{public}s: rpc_unpack failed for session_create_reply: %{darwin.errno}d";
        goto LABEL_13;
      }
LABEL_14:
      v5 = 0;
      *__error() = v7;
      goto LABEL_15;
    }
    v5 = (xpc_object_t *)cryptex_session_core_create_from_xpc();
    cryptex_session_core_merge();
    *(_QWORD *)(v2 + 88) = xpc_copy(v5[11]);
    session_activate_endpoint(a1);
    xpc_release(0);
  }
LABEL_15:
  v13 = v15;
  rpc_destroy(&v20);
  rpc_destroy(v43);
  if (v3)
    os_release(v3);
  if (v4)
    os_release(v4);
  if (v5)
    os_release(v5);
  return v13;
}

uint64_t session_iter_list()
{
  _QWORD *v0;
  const char *v1;
  int v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  xpc_object_t xarray;
  unsigned int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[352];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v11 = -1;
  xarray = 0;
  v40 = 0;
  memset(v39, 0, sizeof(v39));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  v16 = 32;
  v0 = (_QWORD *)daemon_for_session_subsystem(&v11);
  if (!v11)
  {
    _cryptex_actor_init_invoke_u64();
    session_list_pack();
    v11 = cryptex_actor_trap();
    if (v11)
    {
      v1 = (const char *)v0[2];
      v2 = *__error();
      v3 = v0[4];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = "[anonymous]";
        if (v1)
          v4 = v1;
        *(_DWORD *)buf = 136446466;
        v13 = v4;
        v14 = 1024;
        v15 = v11;
        v5 = "%{public}s: rpc failed for session list: %{darwin.errno}d";
LABEL_12:
        _os_log_impl(&dword_2126F8000, v3, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    v11 = session_list_reply_unpack();
    if (v11)
    {
      v6 = (const char *)v0[2];
      v2 = *__error();
      v3 = v0[4];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v7 = "[anonymous]";
        if (v6)
          v7 = v6;
        *(_DWORD *)buf = 136446466;
        v13 = v7;
        v14 = 1024;
        v15 = v11;
        v5 = "%{public}s: rpc_unpack failed for session_list_reply: %{darwin.errno}d";
        goto LABEL_12;
      }
LABEL_13:
      *__error() = v2;
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_14:
  v8 = v11;
  rpc_destroy(&v16);
  rpc_destroy(v39);
  if (v0)
    os_release(v0);
  return v8;
}

uint64_t __session_iter_list_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = cryptex_session_core_create_from_xpc();
  v3 = (_QWORD *)session_create_from_core(v2);
  session_activate_endpoint((uint64_t)v3);
  if (!*(_BYTE *)(v3[5] + 120))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  os_release(v3);
  return 1;
}

uint64_t session_set_event_handler(uint64_t a1, uint64_t a2, NSObject *a3, void *aBlock)
{
  xpc_object_t empty;
  uint8_t v8[16];

  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 48) = _Block_copy(aBlock);
  *(_QWORD *)(a1 + 96) = a3;
  if (a3)
    dispatch_retain(a3);
  if (*(_QWORD *)(a1 + 80))
  {
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, "ACTIVATE", *(const char **)(*(_QWORD *)(a1 + 40) + 96));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), empty);
    xpc_release(empty);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "session does not have a valid connection", v8, 2u);
  }
  return 0;
}

int64_t session_send_message(_xpc_connection_s *a1, int64_t a2, void *a3)
{
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  int64_t int64;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "COMMAND", a2);
  if (a3)
    xpc_dictionary_set_value(v6, "PAYLOAD", a3);
  v7 = xpc_connection_send_message_with_reply_sync(a1, v6);
  if (v7)
  {
    v8 = v7;
    if (xpc_dictionary_get_int64(v7, "STATE") == 1)
    {
      v9 = (void *)xpc_copy_debug_description();
      int64 = xpc_dictionary_get_int64(v8, "ERROR");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 67109378;
        v12[1] = int64;
        v13 = 2080;
        v14 = v9;
        _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "XPC error (code %d) in response to session message: %s", (uint8_t *)v12, 0x12u);
      }
      free(v9);
    }
    else
    {
      int64 = 0;
    }
    xpc_release(v8);
    if (v6)
LABEL_14:
      os_release(v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to get response to session message.", (uint8_t *)v12, 2u);
    }
    int64 = 61;
    if (v6)
      goto LABEL_14;
  }
  return int64;
}

void *cryptex_pack_core_cryptex(uint64_t a1, const char *a2)
{
  uint64_t image_asset;
  uint64_t tc_asset;
  uint64_t info_asset;
  uint64_t volumehash_asset;
  uint64_t asset;
  uint64_t cryptex1_properties;
  xpc_object_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int64_t v15;
  int v16;
  int v17;
  void *v18;

  image_asset = cryptex_core_get_image_asset();
  tc_asset = cryptex_core_get_tc_asset();
  info_asset = cryptex_core_get_info_asset();
  volumehash_asset = cryptex_core_get_volumehash_asset();
  asset = cryptex_core_get_asset();
  cryptex1_properties = cryptex_core_get_cryptex1_properties();
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = v10;
  if (image_asset)
  {
    v12 = *(_DWORD *)(image_asset + 16);
    if (tc_asset)
    {
LABEL_3:
      v13 = *(_DWORD *)(tc_asset + 16);
      goto LABEL_6;
    }
  }
  else
  {
    v12 = -1;
    if (tc_asset)
      goto LABEL_3;
  }
  v13 = -1;
LABEL_6:
  if (info_asset)
    v14 = *(_DWORD *)(info_asset + 16);
  else
    v14 = -1;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 176) + 24);
  if (!volumehash_asset)
  {
    v16 = -1;
    if (asset)
      goto LABEL_11;
LABEL_13:
    v17 = -1;
    goto LABEL_14;
  }
  v16 = *(_DWORD *)(volumehash_asset + 16);
  if (!asset)
    goto LABEL_13;
LABEL_11:
  v17 = *(_DWORD *)(asset + 16);
LABEL_14:
  xpc_dictionary_set_fd(v10, "DMG", v12);
  xpc_dictionary_set_fd(v11, "TCH", v13);
  xpc_dictionary_set_fd(v11, "INF", v14);
  xpc_dictionary_set_fd(v11, "VOLHASH", v16);
  xpc_dictionary_set_fd(v11, "IM4", v17);
  xpc_dictionary_set_int64(v11, "TYPE", v15);
  xpc_dictionary_set_string(v11, "BUNDLEID", a2);
  if (cryptex1_properties)
  {
    v18 = (void *)cryptex_core_cx1_copy_xpc_dictionary();
    xpc_dictionary_set_value(v11, "CRYPTEX1_PROPERTIES", v18);
    if (v18)
      os_release(v18);
  }
  return v11;
}

xpc_object_t cryptex_array_pack_from_path(const char *a1, const char *a2, int *a3)
{
  const char *v5;
  xpc_object_t v6;
  _QWORD *v7;
  void *v8;
  int v9;
  uint64_t v10;
  int v11;
  __int128 v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *object;
  _OWORD v20[9];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  object = 0;
  v18 = -1;
  memset(v20, 0, sizeof(v20));
  if (a2)
    v5 = a2;
  else
    v5 = "default";
  LOWORD(v20[0]) = 6;
  v6 = xpc_array_create(0, 0);
  img4_chip_select_personalized_ap();
  if (img4_chip_instantiate())
  {
    v7 = 0;
    v8 = 0;
    v9 = 71;
  }
  else
  {
    v10 = *(_QWORD *)((char *)&v20[1] + 12);
    v11 = DWORD1(v20[2]);
    v18 = open(a1, 0x100000);
    if (v18 == -1)
    {
      v9 = *__error();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        cryptex_array_pack_from_path_cold_2((uint64_t)a1);
      v7 = 0;
    }
    else
    {
      v7 = cryptex_bundle_create_with_directory((uint64_t)&v18, 0);
      LODWORD(v13) = 1;
      *((_QWORD *)&v13 + 1) = 0;
      v14 = v10;
      v15 = v11;
      v17 = 0;
      v16 = 0;
      v9 = cryptex_bundle_copy_cryptex((uint64_t)v7, &v13, v5, &object);
      if (!v9)
      {
        v8 = cryptex_pack_core_cryptex(*((_QWORD *)object + 6), v5);
        xpc_array_append_value(v6, v8);
        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        cryptex_array_pack_from_path_cold_3();
    }
    v8 = 0;
  }
LABEL_15:
  *a3 = v9;
  if (v18 != -1 && close(v18) == -1)
    cryptex_array_pack_from_path_cold_1(&v13, v20);
  if (v7)
    os_release(v7);
  if (object)
    os_release(object);
  if (v8)
    os_release(v8);
  return v6;
}

int64_t session_start(uint64_t a1)
{
  _xpc_connection_s *v1;

  v1 = *(_xpc_connection_s **)(a1 + 80);
  if (v1)
    return session_send_message(v1, 1, 0);
  else
    return 57;
}

int64_t session_stop(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
    return session_send_message(*(_xpc_connection_s **)(a1 + 80), 2, 0);
  else
    return 6;
}

uint64_t session_get_stop_reason(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) == 5)
    return *(_QWORD *)(a1 + 64);
  else
    return 0;
}

uint64_t session_get_stop_code(_QWORD *a1)
{
  if (*(_QWORD *)(a1[5] + 48) == 5 && a1[8] == 2)
    return a1[9];
  else
    return 0;
}

int64_t session_add_cryptex(uint64_t a1, const char *a2, const char *a3)
{
  xpc_object_t v6;
  xpc_object_t v7;
  int64_t v8;
  size_t count;
  uint64_t v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v20 = -1;
  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = cryptex_array_pack_from_path(a2, a3, (int *)&v20);
  v8 = v20;
  if (!v20)
  {
    xpc_dictionary_set_string(v6, "NAME", *(const char **)(*(_QWORD *)(a1 + 40) + 96));
    xpc_dictionary_set_value(v6, "CRYPTEXES", v7);
    count = xpc_array_get_count(v7);
    v11 = *(_QWORD *)(a1 + 40);
    if (count)
    {
      if (*(_QWORD *)(v11 + 48) == 1)
      {
        v8 = session_send_message(*(_xpc_connection_s **)(a1 + 80), 3, v6);
      }
      else
      {
        v16 = *(const char **)(v11 + 16);
        v17 = *__error();
        v18 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          if (!v16)
            v16 = "[anonymous]";
          v19 = cryptex_session_state_to_string();
          *(_DWORD *)buf = 136446722;
          v22 = v16;
          v23 = 2080;
          v24 = v19;
          v25 = 1024;
          LODWORD(v26) = 36;
          _os_log_impl(&dword_2126F8000, v18, OS_LOG_TYPE_ERROR, "%{public}s: Cryptexes cannot be added to session in the %s state.: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v17;
        v8 = 36;
      }
    }
    else
    {
      v12 = *(const char **)(v11 + 16);
      v13 = *__error();
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = "[anonymous]";
        *(_DWORD *)buf = 136446978;
        if (v12)
          v15 = v12;
        v22 = v15;
        v23 = 2080;
        v24 = (uint64_t)a3;
        v25 = 2080;
        v26 = a2;
        v27 = 1024;
        v28 = 2;
        _os_log_impl(&dword_2126F8000, v14, OS_LOG_TYPE_ERROR, "%{public}s: Variant %s not found in %s: %{darwin.errno}d", buf, 0x26u);
      }
      *__error() = v13;
      v8 = 2;
    }
  }
  if (v7)
    os_release(v7);
  if (v6)
    os_release(v6);
  return v8;
}

uint64_t session_add_job_override(uint64_t a1, const char *a2, const char *a3, void *a4)
{
  uint64_t v5;
  const char *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  xpc_object_t empty;
  void *v14;
  xpc_object_t dictionary;
  xpc_object_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v5 + 48))
  {
    empty = xpc_dictionary_create_empty();
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
    xpc_dictionary_set_value(empty, a3, a4);
    dictionary = xpc_dictionary_get_dictionary(v14, a2);
    if (dictionary)
    {
      v9 = _xpc_plist_merge((uint64_t)dictionary, empty);
      if (!empty)
        return v9;
    }
    else
    {
      v17 = xpc_dictionary_create_empty();
      v9 = _xpc_plist_merge((uint64_t)v17, empty);
      xpc_dictionary_set_value(v14, a2, v17);
      xpc_release(v17);
      if (!empty)
        return v9;
    }
    os_release(empty);
    return v9;
  }
  v6 = *(const char **)(v5 + 16);
  v7 = *__error();
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    if (!v6)
      v6 = "[anonymous]";
    v18 = 136446722;
    v19 = v6;
    v20 = 2080;
    v21 = cryptex_session_state_to_string();
    v22 = 1024;
    v23 = 36;
    _os_log_impl(&dword_2126F8000, v8, OS_LOG_TYPE_ERROR, "%{public}s: Job Overrides only allowed in LOCAL, currently in %s: %{darwin.errno}d", (uint8_t *)&v18, 0x1Cu);
  }
  *__error() = v7;
  return 36;
}

uint64_t session_add_session_environment(uint64_t a1, void *a2)
{
  uint64_t v3;
  const char *v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v3 + 48))
    return session_add_job_override(a1, "CRYPTEX_SESSION", "EnvironmentVariables", a2);
  v4 = *(const char **)(v3 + 16);
  v5 = *__error();
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (!v4)
      v4 = "[anonymous]";
    v8 = 136446722;
    v9 = v4;
    v10 = 2080;
    v11 = cryptex_session_state_to_string();
    v12 = 1024;
    v13 = 36;
    _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_ERROR, "%{public}s: ENV Variables only allowed in LOCAL, currently in %s: %{darwin.errno}d", (uint8_t *)&v8, 0x1Cu);
  }
  *__error() = v5;
  return 36;
}

uint64_t session_set_job_environment_override(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v4 + 48))
    return session_add_job_override(a1, a2, "EnvironmentVariables", a3);
  v5 = *(const char **)(v4 + 16);
  v6 = *__error();
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (!v5)
      v5 = "[anonymous]";
    v9 = 136446722;
    v10 = v5;
    v11 = 2080;
    v12 = cryptex_session_state_to_string();
    v13 = 1024;
    v14 = 36;
    _os_log_impl(&dword_2126F8000, v7, OS_LOG_TYPE_ERROR, "%{public}s: ENV Variables only allowed in LOCAL, currently in %s: %{darwin.errno}d", (uint8_t *)&v9, 0x1Cu);
  }
  *__error() = v6;
  return 36;
}

uint64_t session_get_uuid(uint64_t a1, uuid_t uu)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = 36;
  if (v2)
  {
    if (*(_QWORD *)(v2 + 48) == 3)
      v3 = 0;
    else
      v3 = 36;
  }
  uuid_clear(uu);
  return v3;
}

uint64_t session_get_homedir(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    return *(_QWORD *)(v1 + 112);
  else
    return 0;
}

uint64_t session_get_uid(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 40) + 40);
}

uint64_t session_get_name(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    return *(_QWORD *)(v1 + 96);
  else
    return 0;
}

uint64_t session_get_state(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
}

uint64_t session_get_cryptex_array(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
}

uint64_t session_has_overrides()
{
  return 0;
}

void _cryptex_attr_dealloc(uint64_t a1)
{
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 80));
}

uint64_t _cryptex_attr_get_nonce_persistence(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t _cryptex_attr_get_authentication(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t _cryptex_attr_get_mount_flags(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

uint64_t cryptex_attr_create()
{
  uint64_t v0;

  v0 = _cryptex_attr_alloc();
  object_proto_init(v0 + 16, (int)"com.apple.security.libcryptex", "attr");
  return v0;
}

int *cryptex_attr_set_persistence(_QWORD *a1, uint64_t a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int *result;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (const char *)a1[2];
  v5 = *__error();
  v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v9 = 136446466;
    v10 = v7;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting persistence: %#llx", (uint8_t *)&v9, 0x16u);
  }
  result = __error();
  *result = v5;
  a1[6] = a2;
  return result;
}

int *cryptex_attr_set_nonce_persistence(_QWORD *a1, uint64_t a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int *result;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (const char *)a1[2];
  v5 = *__error();
  v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v9 = 136446466;
    v10 = v7;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting nonce persistence: %#llx", (uint8_t *)&v9, 0x16u);
  }
  result = __error();
  *result = v5;
  a1[7] = a2;
  return result;
}

int *cryptex_attr_set_authentication(_QWORD *a1, uint64_t a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int *result;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (const char *)a1[2];
  v5 = *__error();
  v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v9 = 136446466;
    v10 = v7;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting authentication: %#llx", (uint8_t *)&v9, 0x16u);
  }
  result = __error();
  *result = v5;
  a1[8] = a2;
  return result;
}

char *cryptex_attr_set_tss_url(uint64_t a1, const char *a2)
{
  char *result;

  free(*(void **)(a1 + 72));
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = strdup(a2);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = strdup(a2);
    if (!result)
      cryptex_attr_set_tss_url_cold_1(a2);
  }
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

int *cryptex_attr_set_personalization_flags(_QWORD *a1, uint64_t a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int *result;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (const char *)a1[2];
  v5 = *__error();
  v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v9 = 136446466;
    v10 = v7;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting personalization flags: %#llx", (uint8_t *)&v9, 0x16u);
  }
  result = __error();
  *result = v5;
  a1[12] = a2;
  return result;
}

char *cryptex_attr_set_socks_proxy(uint64_t a1, const char *a2, int a3)
{
  char *result;

  free(*(void **)(a1 + 80));
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = strdup(a2);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = strdup(a2);
    if (!result)
      cryptex_attr_set_tss_url_cold_1(a2);
  }
  *(_QWORD *)(a1 + 80) = result;
  *(_DWORD *)(a1 + 88) = a3;
  return result;
}

int *cryptex_attr_set_mount_flags(_QWORD *a1, uint64_t a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int *result;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (const char *)a1[2];
  v5 = *__error();
  v6 = a1[4];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v9 = 136446466;
    v10 = v7;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting mount flags: %#llx", (uint8_t *)&v9, 0x16u);
  }
  result = __error();
  *result = v5;
  a1[13] = a2;
  return result;
}

uint64_t cryptex_attr_set_limit_load_to_rem(uint64_t result)
{
  *(_QWORD *)(result + 40) |= 1uLL;
  return result;
}

void _cryptex_su_preboot_bundle_dealloc(uint64_t a1)
{
  void *v2;
  void **v3;
  void **v4;
  void **v5;
  void ***v6;
  void **v7;

  v2 = *(void **)(a1 + 56);
  if (v2)
    xpc_release(v2);
  v3 = *(void ***)(a1 + 48);
  v7 = v3;
  if (v3)
  {
    do
    {
      v4 = (void **)*v3;
      v5 = *(void ***)(a1 + 48);
      if (v5 == v3)
      {
        *(_QWORD *)(a1 + 48) = v4;
      }
      else
      {
        do
        {
          v6 = (void ***)v5;
          v5 = (void **)*v5;
        }
        while (v5 != v3);
        *v6 = v4;
        v3 = v7;
      }
      *v3 = (void *)-1;
      _cryptex_list_elm_destroy(&v7);
      v7 = v4;
      v3 = v4;
    }
    while (v4);
  }
  object_proto_destroy(a1 + 24);
}

void cryptex_su_preboot_bundle_create_with_directory_and_manifest()
{
  _os_crash();
  __break(1u);
}

uint64_t cryptex_su_preboot_bundle_copy_cryptex()
{
  int v0;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2[0] = 67109120;
    v2[1] = 45;
    _os_log_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported on this platform.: %{darwin.errno}d", (uint8_t *)v2, 8u);
  }
  *__error() = v0;
  return 45;
}

uint64_t cryptex_su_preboot_bundle_create()
{
  uint64_t v0;

  v0 = _cryptex_su_preboot_bundle_alloc();
  object_proto_init(v0 + 24, (int)"com.apple.security.libcryptex", "su_preboot_bundle");
  return v0;
}

uint64_t _img4_get_nonce_domain_from_index(unint64_t a1)
{
  if (a1 > 0xA || a1 - 1 > 9)
    return 0;
  else
    return qword_24CE0BD18[a1 - 1];
}

uint64_t _img4_chip_instance_from_remote_device_properties(void *a1, uint64_t a2)
{
  const char *string;
  const char *v5;
  int v6;
  NSObject *v7;
  uint64_t result;
  int v9;
  NSObject *v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  const char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, "Image4CryptoHashMethod");
  if (!string)
  {
    v9 = *__error();
    if (_img4_log_onceToken != -1)
      dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
    v10 = _img4_log_osl;
    if (os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2126F8000, v10, OS_LOG_TYPE_INFO, "no image4 hash method advertised, falling back to use sha2-384 by default", (uint8_t *)&v16, 2u);
    }
    *__error() = v9;
    goto LABEL_14;
  }
  v5 = string;
  if (!strcmp(string, "sha1"))
  {
    v11 = MEMORY[0x24BEDC398];
LABEL_16:
    *(_QWORD *)(a2 + 8) = v11;
    if (_xpc_dictionary_key_with_type_exists(a1, "BoardId", MEMORY[0x24BDACFF8]))
    {
      *(_DWORD *)(a2 + 28) = xpc_dictionary_get_uint64(a1, "BoardId");
      if ((_xpc_dictionary_key_with_type_exists(a1, "ChipID", MEMORY[0x24BDACFF8]) & 1) != 0)
      {
        *(_DWORD *)(a2 + 32) = xpc_dictionary_get_uint64(a1, "ChipID");
        if ((_xpc_dictionary_key_with_type_exists(a1, "SecurityDomain", MEMORY[0x24BDACFF8]) & 1) != 0)
        {
          *(_DWORD *)(a2 + 36) = xpc_dictionary_get_uint64(a1, "SecurityDomain");
          if ((_xpc_dictionary_key_with_type_exists(a1, "UniqueChipID", MEMORY[0x24BDACFF8]) & 1) != 0)
          {
            *(_QWORD *)(a2 + 40) = xpc_dictionary_get_uint64(a1, "UniqueChipID");
            if ((_xpc_dictionary_key_with_type_exists(a1, "CertificateProductionStatus", MEMORY[0x24BDACF80]) & 1) != 0)
            {
              *(_BYTE *)(a2 + 48) = xpc_dictionary_get_BOOL(a1, "CertificateProductionStatus");
              if ((_xpc_dictionary_key_with_type_exists(a1, "CertificateSecurityMode", MEMORY[0x24BDACF80]) & 1) != 0)
              {
                *(_BYTE *)(a2 + 49) = xpc_dictionary_get_BOOL(a1, "CertificateSecurityMode");
                if ((_xpc_dictionary_key_with_type_exists(a1, "EffectiveProductionStatusAp", MEMORY[0x24BDACF80]) & 1) != 0)
                {
                  *(_BYTE *)(a2 + 50) = xpc_dictionary_get_BOOL(a1, "EffectiveProductionStatusAp");
                  if ((_xpc_dictionary_key_with_type_exists(a1, "EffectiveSecurityModeAp", MEMORY[0x24BDACF80]) & 1) != 0)
                  {
                    v12 = xpc_dictionary_get_BOOL(a1, "EffectiveSecurityModeAp");
                    result = 0;
                    *(_BYTE *)(a2 + 51) = v12;
                    *(_DWORD *)(a2 + 24) = 1;
                    return result;
                  }
                  v13 = *__error();
                  if (_img4_log_onceToken != -1)
                    dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
                  v14 = _img4_log_osl;
                  if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
                    goto LABEL_58;
                  v16 = 67109120;
                  LODWORD(v17) = 2;
                  v15 = "effective security mode not found: %{darwin.errno}d";
                }
                else
                {
                  v13 = *__error();
                  if (_img4_log_onceToken != -1)
                    dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
                  v14 = _img4_log_osl;
                  if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
                    goto LABEL_58;
                  v16 = 67109120;
                  LODWORD(v17) = 2;
                  v15 = "effective production status not found: %{darwin.errno}d";
                }
              }
              else
              {
                v13 = *__error();
                if (_img4_log_onceToken != -1)
                  dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
                v14 = _img4_log_osl;
                if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
                  goto LABEL_58;
                v16 = 67109120;
                LODWORD(v17) = 2;
                v15 = "security mode not found: %{darwin.errno}d";
              }
            }
            else
            {
              v13 = *__error();
              if (_img4_log_onceToken != -1)
                dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
              v14 = _img4_log_osl;
              if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
                goto LABEL_58;
              v16 = 67109120;
              LODWORD(v17) = 2;
              v15 = "production status not found: %{darwin.errno}d";
            }
          }
          else
          {
            v13 = *__error();
            if (_img4_log_onceToken != -1)
              dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
            v14 = _img4_log_osl;
            if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
              goto LABEL_58;
            v16 = 67109120;
            LODWORD(v17) = 2;
            v15 = "ecid not found: %{darwin.errno}d";
          }
        }
        else
        {
          v13 = *__error();
          if (_img4_log_onceToken != -1)
            dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
          v14 = _img4_log_osl;
          if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
            goto LABEL_58;
          v16 = 67109120;
          LODWORD(v17) = 2;
          v15 = "security domain not found: %{darwin.errno}d";
        }
      }
      else
      {
        v13 = *__error();
        if (_img4_log_onceToken != -1)
          dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
        v14 = _img4_log_osl;
        if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v16 = 67109120;
        LODWORD(v17) = 2;
        v15 = "chip id not found: %{darwin.errno}d";
      }
    }
    else
    {
      v13 = *__error();
      if (_img4_log_onceToken != -1)
        dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
      v14 = _img4_log_osl;
      if (!os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
        goto LABEL_58;
      v16 = 67109120;
      LODWORD(v17) = 2;
      v15 = "board id not found: %{darwin.errno}d";
    }
    _os_log_impl(&dword_2126F8000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 8u);
LABEL_58:
    *__error() = v13;
    return 2;
  }
  if (!strcmp(v5, "sha2-384"))
  {
LABEL_14:
    v11 = MEMORY[0x24BEDC3A0];
    goto LABEL_16;
  }
  v6 = *__error();
  if (_img4_log_onceToken != -1)
    dispatch_once(&_img4_log_onceToken, &__block_literal_global_3);
  v7 = _img4_log_osl;
  if (os_log_type_enabled((os_log_t)_img4_log_osl, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = v5;
    v18 = 1024;
    v19 = 22;
    _os_log_impl(&dword_2126F8000, v7, OS_LOG_TYPE_ERROR, "invalid crypto hash method: %s: %{darwin.errno}d", (uint8_t *)&v16, 0x12u);
  }
  *__error() = v6;
  return 22;
}

os_log_t ___img4_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.libcryptex", "img4");
  _img4_log_osl = (uint64_t)result;
  return result;
}

void rpc_destroy(_BYTE *a1)
{
  if ((*a1 & 1) != 0)
  {
    if (*((_QWORD *)a1 + 4) == 2)
      mach_right_send_release();
    xpc_release(*((xpc_object_t *)a1 + 37));
    os_release(*((void **)a1 + 1));
    if ((*a1 & 0x40) != 0)
      free(a1);
  }
}

os_log_t object_proto_init(uint64_t a1, int a2, char *category)
{
  os_log_t result;

  result = os_log_create("com.apple.libcryptex", category);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

char *object_set_name(uint64_t a1, const char *a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  char *result;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = *(const char **)a1;
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 16);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      v8 = *(const char **)a1;
      *(_DWORD *)buf = 136446722;
      v12 = v4;
      v13 = 2080;
      v14 = v8;
      v15 = 2080;
      v16 = a2;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", buf, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136446466;
      v12 = "[anonymous]";
      v13 = 2080;
      v14 = a2;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", buf, 0x16u);
    }
    *__error() = v5;
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = strdup(a2);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = strdup(a2);
    if (!result)
      object_set_name_cold_1(a2, &v10, buf);
  }
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void object_set_name_nocopy(uint64_t a1, const char *a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(const char **)a1;
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 16);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      v8 = *(const char **)a1;
      v9 = 136446722;
      v10 = v4;
      v11 = 2080;
      v12 = v8;
      v13 = 2080;
      v14 = a2;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", (uint8_t *)&v9, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      v9 = 136446466;
      v10 = "[anonymous]";
      v11 = 2080;
      v12 = a2;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", (uint8_t *)&v9, 0x16u);
    }
    *__error() = v5;
  }
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 0;
}

void object_proto_destroy(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  os_release(*(void **)(a1 + 16));
}

void object_set_name_cold_1(const char *a1, _QWORD *a2, _OWORD *a3)
{
  int *v5;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

uint64_t _xferfd_unguarded(_DWORD *a1)
{
  uint64_t v1;

  v1 = *a1;
  *a1 = -1;
  return v1;
}

uint64_t _mkodtempat(int a1, char *a2, int *a3)
{
  char *v5;
  int v6;
  int v7;
  uint64_t result;

  v5 = mkdtempat_np(a1, a2);
  if (!v5)
    return *__error();
  v6 = openat(a1, v5, 1048832);
  if (v6 < 0)
    return *__error();
  v7 = v6;
  result = 0;
  *a3 = v7;
  return result;
}

size_t _confstr(int a1, char *a2)
{
  size_t result;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  result = confstr(a1, a2, 0x400uLL);
  if (!result)
    _confstr_cold_1(&v3, v4);
  if (result >= 0x401)
    _confstr_cold_2();
  return result;
}

unint64_t _strtou32(const char *a1, char **a2, int a3)
{
  unint64_t result;
  char *__endptr;

  __endptr = 0;
  *__error() = 0;
  result = strtoul(a1, &__endptr, a3);
  if (__endptr && *__endptr)
  {
    result = 0;
    if (a2)
      *a2 = __endptr;
  }
  else if (HIDWORD(result))
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _read_file(int a1, _QWORD *a2)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  off_t st_size;
  void *v8;
  void *v10;
  ssize_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  ssize_t v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  stat v20;
  uint8_t buf[4];
  off_t v22;
  __int16 v23;
  off_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20))
  {
    v4 = *__error();
    v5 = *__error();
    v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_ERROR, "stat: %{darwin.errno}d", buf, 8u);
    }
    st_size = 0;
LABEL_5:
    v8 = 0;
    *__error() = v5;
LABEL_6:
    if (!(_DWORD)v4)
      goto LABEL_7;
    goto LABEL_8;
  }
  st_size = v20.st_size;
  if (v20.st_size < 0)
    _cryptex_signing_service_read_fd_cold_2();
  v10 = malloc_type_malloc(v20.st_size, 0xD8A116BDuLL);
  if (!v10)
  {
    v4 = *__error();
    v5 = *__error();
    v15 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_2126F8000, v15, OS_LOG_TYPE_ERROR, "malloc: %{darwin.errno}d", buf, 8u);
    }
    goto LABEL_5;
  }
  v8 = v10;
  while (1)
  {
    v11 = pread(a1, v8, st_size, 0);
    if ((v11 & 0x8000000000000000) == 0)
      break;
    v12 = *__error();
    v13 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v14;
      _os_log_impl(&dword_2126F8000, v13, OS_LOG_TYPE_ERROR, "pread: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    v4 = *__error();
    if ((_DWORD)v4 != 4)
      goto LABEL_6;
  }
  v16 = v11;
  v17 = *__error();
  v18 = os_log_create("com.apple.libcryptex", "utility");
  v19 = v18;
  if (v16 == st_size)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v22 = st_size;
      _os_log_impl(&dword_2126F8000, v19, OS_LOG_TYPE_DEBUG, "read %ld bytes", buf, 0xCu);
    }
    *__error() = v17;
LABEL_7:
    buff_init(a2, 0, (uint64_t)_buff_destructor_free, (uint64_t)v8, st_size);
    v4 = 0;
    v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v22 = v16;
    v23 = 2048;
    v24 = st_size;
    _os_log_impl(&dword_2126F8000, v19, OS_LOG_TYPE_ERROR, "truncated read: actual = %ld, expected = %lu", buf, 0x16u);
  }
  *__error() = v17;
  v4 = 5;
LABEL_8:
  free(v8);
  return v4;
}

uint64_t _write_file(int __fd, uint64_t a2)
{
  ssize_t v4;
  int v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  ssize_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  ssize_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  while (1)
  {
    v4 = pwrite(__fd, *(const void **)a2, *(_QWORD *)(a2 + 8), 0);
    if ((v4 & 0x8000000000000000) == 0)
      break;
    v5 = *__error();
    v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v7;
      _os_log_impl(&dword_2126F8000, v6, OS_LOG_TYPE_ERROR, "write: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v5;
    v8 = *__error();
    if ((_DWORD)v8 != 4)
      return v8;
  }
  v9 = v4;
  v10 = *(_QWORD *)(a2 + 8);
  v11 = *__error();
  v12 = os_log_create("com.apple.libcryptex", "utility");
  v13 = v12;
  if (v9 == v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v9;
      _os_log_impl(&dword_2126F8000, v13, OS_LOG_TYPE_DEBUG, "wrote %ld bytes", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = 5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a2 + 8);
      *(_DWORD *)buf = 134218496;
      v17 = v9;
      v18 = 2048;
      v19 = v14;
      v20 = 1024;
      v21 = 5;
      _os_log_impl(&dword_2126F8000, v13, OS_LOG_TYPE_ERROR, "truncated write: actual = %ld, expected = %ld: %{darwin.errno}d", buf, 0x1Cu);
    }
  }
  *__error() = v11;
  return v8;
}

void _confstr_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  __error();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void _confstr_cold_2()
{
  _os_crash();
  __break(1u);
}

_QWORD *buff_init(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *result = a4;
  result[1] = a5;
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  if (a5 < 0)
    buff_init_cold_1(&v5, v6);
  return result;
}

_QWORD *buff_init_signed(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a5 < 0)
    buff_init_signed_cold_1(&v6, v7);
  return buff_init(a1, a2, a3, a4, a5);
}

_QWORD *buff_destroy(_QWORD *result)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD);

  if (result)
  {
    if (*result)
    {
      v1 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result[5];
      if (v1)
      {
        if (result[6])
          buff_destroy_cold_1();
        return (_QWORD *)v1(result[2], result[3], result[4]);
      }
    }
  }
  return result;
}

void buff_init_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void buff_init_signed_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void buff_destroy_cold_1()
{
  _os_crash();
  __break(1u);
}

_QWORD *ctx_new(void *a1, size_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2 <= 0x17)
    ctx_new_cold_1(&v7, v8);
  if (_dispatch_is_multithreaded())
  {
    v4 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
    if (!v4)
    {
      do
      {
        __os_temporary_resource_shortage();
        v5 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      }
      while (!v5);
      v4 = v5;
    }
  }
  else
  {
    v4 = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (!v4)
      ctx_new_cold_2(&v7, v8);
  }
  if (a1)
    *v4 = os_retain(a1);
  return v4;
}

void ctx_destroy(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      os_release(v2);
    free(a1);
  }
}

void ctx_new_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

void ctx_new_cold_2(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

xpc_object_t _xpc_plist_value_copy(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  xpc_object_t value;
  size_t v9;
  void *v10;

  v2 = MEMORY[0x24BDACF78];
  if (*(_QWORD *)a1 != MEMORY[0x24BDACF78] && *(_QWORD *)a1 != MEMORY[0x24BDACFA0])
    _xpc_plist_value_copy_cold_1();
  v6 = MEMORY[0x212BF18F8](a2);
  if (v6 != *(_QWORD *)a1)
    return 0;
  if (v6 == v2)
  {
    v9 = *(_QWORD *)(a1 + 24);
    if (v9 >= xpc_array_get_count(a2))
      return 0;
    value = xpc_array_get_value(a2, *(_QWORD *)(a1 + 24));
  }
  else
  {
    value = xpc_dictionary_get_value(a2, *(const char **)(a1 + 16));
  }
  v10 = value;
  if (!value || MEMORY[0x212BF18F8](value) != *(_QWORD *)(a1 + 8))
    return 0;
  return xpc_retain(v10);
}

xpc_object_t _xpc_plist_value_copy_at(_QWORD *a1, void *a2, size_t a3)
{
  uint64_t v3;
  xpc_object_t value;
  void *v8;

  v3 = MEMORY[0x24BDACF78];
  if (*a1 != MEMORY[0x24BDACF78])
    _xpc_plist_value_copy_at_cold_1();
  if (MEMORY[0x212BF18F8](a2) != v3)
    _xpc_plist_value_copy_at_cold_1();
  if (xpc_array_get_count(a2) > a3
    && (value = xpc_array_get_value(a2, a3)) != 0
    && (v8 = value, MEMORY[0x212BF18F8]() == a1[1]))
  {
    return xpc_retain(v8);
  }
  else
  {
    return 0;
  }
}

uint64_t _xpc_plist_merge(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  if (xdict)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___xpc_plist_merge_block_invoke;
    v4[3] = &unk_24CE0BD90;
    v4[4] = &v5;
    v4[5] = a1;
    xpc_dictionary_apply(xdict, v4);
    v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___xpc_plist_merge_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t value;
  xpc_object_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  int v11;
  _QWORD applier[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), a2);
  if (!value)
  {
LABEL_9:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), a2, a3);
    return 1;
  }
  v7 = value;
  v8 = MEMORY[0x212BF18F8]();
  if (v8 == MEMORY[0x212BF18F8](a3))
  {
    if (v8 == MEMORY[0x24BDACFA0])
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 0x40000000;
      applier[2] = ___xpc_plist_merge_block_invoke_2;
      applier[3] = &__block_descriptor_tmp_4;
      applier[4] = v7;
      xpc_dictionary_apply(a3, applier);
      return 1;
    }
    goto LABEL_9;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 79;
  v9 = *__error();
  if (_xpc_log_onceToken != -1)
    dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
  v10 = _xpc_log_osl;
  if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_DWORD *)buf = 136315394;
    v15 = a2;
    v16 = 1024;
    v17 = v11;
    _os_log_impl(&dword_2126F8000, v10, OS_LOG_TYPE_ERROR, "Error merging override for key %s: %{darwin.errno}d", buf, 0x12u);
  }
  *__error() = v9;
  return 1;
}

uint64_t ___xpc_plist_merge_block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

uint64_t _xpc_dictionary_try_get_uint64(void *a1, const char *a2, uint64_t *a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  uint64_t v7;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BF18F8]() != MEMORY[0x24BDACFF8])
    return 79;
  v7 = xpc_uint64_get_value(v5);
  result = 0;
  *a3 = v7;
  return result;
}

uint64_t _xpc_dictionary_try_get_string(void *a1, const char *a2, const char **a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  const char *string_ptr;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BF18F8]() != MEMORY[0x24BDACFF0])
    return 79;
  string_ptr = xpc_string_get_string_ptr(v5);
  result = 0;
  *a3 = string_ptr;
  return result;
}

uint64_t _xpc_dictionary_try_get_BOOL(void *a1, const char *a2, BOOL *a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  BOOL v7;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BF18F8]() != MEMORY[0x24BDACF80])
    return 79;
  v7 = xpc_BOOL_get_value(v5);
  result = 0;
  *a3 = v7;
  return result;
}

uint64_t _xpc_dictionary_key_with_type_exists(void *a1, const char *a2, const _xpc_type_s *a3)
{
  int v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  int *v11;
  uint64_t result;
  int v13;
  const char *v14;
  __int16 v15;
  const char *name;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!xpc_dictionary_get_value(a1, a2))
  {
    v5 = *__error();
    if (_xpc_log_onceToken != -1)
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    v10 = _xpc_log_osl;
    if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v13 = 136315138;
    v14 = a2;
    v7 = "key %s doesn't exist";
    v8 = v10;
    v9 = 12;
    goto LABEL_11;
  }
  if ((const _xpc_type_s *)MEMORY[0x212BF18F8]() != a3)
  {
    v5 = *__error();
    if (_xpc_log_onceToken != -1)
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    v6 = _xpc_log_osl;
    if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v13 = 136315394;
    v14 = a2;
    v15 = 2080;
    name = xpc_type_get_name(a3);
    v7 = "key %s isn't of type %s";
    v8 = v6;
    v9 = 22;
LABEL_11:
    _os_log_impl(&dword_2126F8000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, v9);
LABEL_12:
    v11 = __error();
    result = 0;
    *v11 = v5;
    return result;
  }
  return 1;
}

uint64_t _xpc_dictionary_try_get_cferr(void *a1, const char *a2, CFErrorRef *a3)
{
  xpc_object_t value;
  void *v5;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BF18F8]() == MEMORY[0x24BDACFA0])
    return _xpc_dictionary_to_cferr(v5, a3);
  else
    return 79;
}

uint64_t _xpc_dictionary_to_cferr(void *a1, CFErrorRef *a2)
{
  xpc_object_t dictionary;
  void *v5;
  char *string;
  CFStringRef v7;
  const __CFString *v8;
  int64_t int64;
  xpc_object_t v10;
  int v11;
  NSObject *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v20;
  CFErrorRef v21;
  int v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  void *value;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  value = 0;
  dictionary = xpc_dictionary_get_dictionary(a1, "cferr_userinfo");
  if (dictionary)
  {
    v5 = dictionary;
    string = (char *)xpc_dictionary_get_string(a1, "cferr_domain");
    v7 = _CFStringCreateFromUTF8String(string);
    if (v7)
    {
      v8 = v7;
      int64 = xpc_dictionary_get_int64(a1, "cferr_code");
      v10 = xpc_dictionary_get_dictionary(v5, "underlying_cferr");
      if (v10 && _xpc_dictionary_to_cferr(v10, &value))
      {
        v11 = *__error();
        if (_xpc_log_onceToken != -1)
          dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
        v12 = _xpc_log_osl;
        if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_DWORD *)buf = 67109120;
        v31 = 22;
        v13 = "Failed to unpack underlying error.: %{darwin.errno}d";
      }
      else
      {
        xpc_dictionary_set_value(v5, "underlying_cferr", 0);
        v17 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
        if (v17)
        {
          v18 = v17;
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v17);
          if (MutableCopy)
          {
            v20 = MutableCopy;
            if (value)
              CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD3B0], value);
            v21 = CFErrorCreate(0, v8, int64, v20);
            if (v21)
            {
              if (a2)
              {
                v16 = 0;
                *a2 = v21;
              }
              else
              {
                CFRelease(v21);
                v16 = 0;
              }
            }
            else
            {
              v26 = *__error();
              if (_xpc_log_onceToken != -1)
                dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
              v27 = _xpc_log_osl;
              if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v31 = 12;
                _os_log_impl(&dword_2126F8000, v27, OS_LOG_TYPE_ERROR, "Failed to create CFError.: %{darwin.errno}d", buf, 8u);
              }
              *__error() = v26;
              v16 = 12;
            }
            CFRelease(v20);
          }
          else
          {
            v24 = *__error();
            if (_xpc_log_onceToken != -1)
              dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
            v25 = _xpc_log_osl;
            if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              v31 = 12;
              _os_log_impl(&dword_2126F8000, v25, OS_LOG_TYPE_ERROR, "Failed to create mutable dictionary.: %{darwin.errno}d", buf, 8u);
            }
            *__error() = v24;
            v16 = 12;
          }
          CFRelease(v18);
          goto LABEL_45;
        }
        v11 = *__error();
        if (_xpc_log_onceToken != -1)
          dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
        v12 = _xpc_log_osl;
        if (!os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          *__error() = v11;
          v16 = 22;
LABEL_45:
          CFRelease(v8);
          goto LABEL_46;
        }
        *(_DWORD *)buf = 67109120;
        v31 = 22;
        v13 = "Failed to convert CF to XPC.: %{darwin.errno}d";
      }
      _os_log_impl(&dword_2126F8000, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
      goto LABEL_31;
    }
    v22 = *__error();
    if (_xpc_log_onceToken != -1)
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    v23 = _xpc_log_osl;
    if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 12;
      _os_log_impl(&dword_2126F8000, v23, OS_LOG_TYPE_ERROR, "Failed to create string.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v22;
    v16 = 12;
  }
  else
  {
    v14 = *__error();
    if (_xpc_log_onceToken != -1)
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_4);
    v15 = _xpc_log_osl;
    if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 22;
      _os_log_impl(&dword_2126F8000, v15, OS_LOG_TYPE_ERROR, "CFError XPC dictionary is missing user info.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v14;
    v16 = 22;
  }
LABEL_46:
  if (value)
    CFRelease(value);
  return v16;
}

uint64_t _xpc_reply_get_error(void *a1, _DWORD *a2)
{
  int uint64;
  uint64_t result;

  if (!_xpc_dictionary_key_with_type_exists(a1, "error", MEMORY[0x24BDACFF8]))
    return 22;
  uint64 = xpc_dictionary_get_uint64(a1, "error");
  result = 0;
  *a2 = uint64;
  return result;
}

uint64_t _xpc_reply_get_cferr(void *a1, _QWORD *a2)
{
  uint64_t cferr;
  CFIndex v5;
  char *v6;
  __CFError *Error;
  CFTypeRef v8;
  int v10;
  CFErrorRef v11;
  int v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v10 = -1;
  cferr = _xpc_dictionary_try_get_cferr(a1, "cferr", &v11);
  if ((_DWORD)cferr == 2 && (cferr = 0, !_xpc_reply_get_error(a1, &v10)) && v10)
  {
    v5 = v10;
    v12 = 67109120;
    v13 = v10;
    v6 = (char *)_os_log_send_and_compose_impl();
    Error = createError("_xpc_reply_get_cferr", "xpc.c", 474, "com.apple.security.cryptex.posix", v5, 0, v6);
    free(v6);
    cferr = 0;
    v11 = Error;
    if (!a2)
      goto LABEL_12;
  }
  else
  {
    Error = v11;
    if (!a2)
      goto LABEL_12;
  }
  if (!(_DWORD)cferr)
  {
    if (Error)
    {
      v8 = CFRetain(Error);
      Error = v11;
    }
    else
    {
      v8 = 0;
    }
    *a2 = v8;
  }
LABEL_12:
  if (Error)
    CFRelease(Error);
  return cferr;
}

uint64_t _xpc_reply_get_argv(void *a1, _QWORD *a2)
{
  xpc_object_t value;
  uint64_t result;

  if (!_xpc_dictionary_key_with_type_exists(a1, "argv", MEMORY[0x24BDACFA0]))
    return 22;
  value = xpc_dictionary_get_value(a1, "argv");
  result = 0;
  *a2 = value;
  return result;
}

os_log_t ___xpc_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.libcryptex", "xpc");
  _xpc_log_osl = (uint64_t)result;
  return result;
}

void _xpc_plist_value_copy_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_plist_value_copy_at_cold_1()
{
  _os_crash();
  __break(1u);
}

_DWORD *DEREncoderCreate(int a1)
{
  _DWORD *result;

  result = calloc(1uLL, 0x10uLL);
  if (result)
    result[3] = a1;
  return result;
}

void DEREncoderDestroy(_QWORD **a1)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)*v2;
        _EncodedDataRelease((uint64_t)v2);
        v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t DEREncoderAddData(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  char *v7;

  v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t _DEREncoderAddEncodedData(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  size_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v2 = a2;
  if (!a1)
  {
    v22 = 1;
    if (!a2)
      return v22;
    goto LABEL_30;
  }
  if (!a2)
    return 2;
  v4 = *((_DWORD *)a1 + 2);
  v5 = a2;
  do
  {
    v6 = *(_DWORD *)(v5 + 20);
    v7 = __CFADD__(v4, v6);
    v8 = v4 + v6;
    if (v7 || (v9 = *(_DWORD *)(v5 + 24), v4 = v8 + v9, __CFADD__(v8, v9)))
    {
      v22 = 2;
      do
      {
LABEL_30:
        v23 = *(_QWORD *)v2;
        _EncodedDataRelease(v2);
        v2 = v23;
      }
      while (v23);
      return v22;
    }
    v5 = *(_QWORD *)v5;
  }
  while (v5);
  v10 = (uint64_t *)*a1;
  v11 = a1;
  if (!*a1)
    goto LABEL_26;
  v12 = *((_DWORD *)a1 + 3);
  v11 = a1;
  while (2)
  {
    v13 = v11;
    v11 = v10;
    if (!v12)
      goto LABEL_20;
    v14 = bswap64(*(_QWORD *)(v2 + 28));
    v15 = bswap64(*(uint64_t *)((char *)v11 + 28));
    if (v14 != v15 || (v14 = bswap64(*(_QWORD *)(v2 + 36)), v15 = bswap64(*(uint64_t *)((char *)v11 + 36)), v14 != v15))
    {
      if (v14 < v15)
        v16 = -1;
      else
        v16 = 1;
LABEL_19:
      if (v16 < 0)
        break;
      goto LABEL_20;
    }
    v17 = *(_DWORD *)(v2 + 24);
    v18 = *((_DWORD *)v11 + 6);
    if (v17 >= v18)
      v19 = v18;
    else
      v19 = v17;
    v16 = memcmp(*(const void **)(v2 + 8), (const void *)v11[1], v19);
    if (v16)
      goto LABEL_19;
    if (v17 >= v18)
    {
LABEL_20:
      v10 = (uint64_t *)*v11;
      if (!*v11)
        goto LABEL_26;
      continue;
    }
    break;
  }
  v20 = (_QWORD *)v2;
  do
  {
    v21 = v20;
    v20 = (_QWORD *)*v20;
  }
  while (v20);
  *v21 = v11;
  v11 = v13;
LABEL_26:
  v22 = 0;
  *v11 = v2;
  *((_DWORD *)a1 + 2) = v4;
  return v22;
}

char *_EncodedDataCreate(unsigned int a1, unsigned int a2, const void *a3, unsigned int a4, int a5, int a6)
{
  char *v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  _BYTE *v19;
  uint64_t v20;
  int v21;
  char *v22;
  _BYTE *v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (!a3 && a4 && a6)
    return 0;
  v12 = (char *)calloc(1uLL, 0x38uLL);
  v13 = v12;
  if (!v12)
    return v13;
  *((_DWORD *)v12 + 4) = 1;
  v14 = v12 + 28;
  if (a1 == 259)
  {
    v15 = 0;
    goto LABEL_7;
  }
  if (a1 > 3)
    goto LABEL_40;
  if (a2 > 0x1E)
  {
    v17 = 0;
    v28[0] = 0;
    do
    {
      *((_BYTE *)v28 + v17++) = a2 & 0x7F;
      v18 = a2 > 0x7F;
      a2 >>= 7;
    }
    while (v18);
    v16 = (_DWORD)v13 + 28;
    if ((v17 & 0xFFFFFFF0) == 0)
    {
      v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | 0x1F;
      v19 = v13 + 29;
      if (v17 >= 2)
      {
        v20 = v17 - 1;
        do
          *v19++ = *((_BYTE *)v28 + v20--) | 0x80;
        while ((_DWORD)v20);
      }
      *v19 = v28[0];
      v16 = (_DWORD)v19 + 1;
    }
  }
  else
  {
    v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | a2;
    v16 = (_DWORD)v13 + 29;
  }
  v21 = v16 - (_DWORD)v14;
  if (!v21)
    goto LABEL_40;
  v22 = &v14[v21];
  if (a4 > 0x7F)
  {
    v24 = 0;
    v28[0] = 0;
    v25 = a4;
    do
    {
      *((_BYTE *)v28 + v24++) = v25;
      v18 = v25 > 0xFF;
      v25 >>= 8;
    }
    while (v18);
    if (16 - v21 <= v24)
    {
      LODWORD(v23) = (_DWORD)v14 + v21;
    }
    else
    {
      *v22 = v24 | 0x80;
      v23 = v22 + 1;
      if ((_DWORD)v24)
      {
        do
          *v23++ = *((_BYTE *)&v28[-1] + v24-- + 7);
        while (v24);
      }
    }
  }
  else
  {
    LODWORD(v23) = (_DWORD)v14 + v21;
    if (v21 != 16)
    {
      *v22 = a4;
      LODWORD(v23) = (_DWORD)v22 + 1;
    }
  }
  v26 = (_DWORD)v23 - (_DWORD)v22;
  if ((_DWORD)v23 == (_DWORD)v22)
  {
LABEL_40:
    free(v13);
    return 0;
  }
  v14 = &v22[v26];
  v15 = v21 + v26;
LABEL_7:
  *((_DWORD *)v13 + 5) = v15;
  switch(a6)
  {
    case 0:
      *((_QWORD *)v13 + 1) = 0;
      *((_QWORD *)v13 + 6) = 0;
      *((_DWORD *)v13 + 6) = 0;
      return v13;
    case 1:
      *((_QWORD *)v13 + 1) = a3;
      *((_QWORD *)v13 + 6) = 0;
      goto LABEL_25;
    case 2:
      *((_QWORD *)v13 + 1) = a3;
      *((_QWORD *)v13 + 6) = v13;
LABEL_25:
      *((_DWORD *)v13 + 6) = a4;
      return v13;
    case 3:
      if (v13 + 56 - v14 >= a4)
      {
        *((_QWORD *)v13 + 1) = v14;
        *((_DWORD *)v13 + 6) = a4;
      }
      else
      {
        v14 = (char *)malloc(a4);
        *((_QWORD *)v13 + 1) = v14;
        *((_QWORD *)v13 + 6) = v13;
        *((_DWORD *)v13 + 6) = a4;
        if (!v14)
          goto LABEL_40;
      }
      memcpy(v14, a3, a4);
      break;
    default:
      return v13;
  }
  return v13;
}

uint64_t DEREncoderAddDataNoCopy(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  char *v7;

  v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 1);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t DEREncoderCreateEncodedBuffer(uint64_t **a1, _QWORD *a2, unsigned int *a3)
{
  unsigned int v6;
  char *v7;
  void *v8;
  uint64_t **v9;
  char *v10;
  char *v11;
  uint64_t result;

  if (!a1)
    return 1;
  v6 = *((_DWORD *)a1 + 2);
  v7 = (char *)malloc(v6);
  if (!v7)
    return 2;
  v8 = v7;
  v9 = (uint64_t **)*a1;
  if (*a1)
  {
    v10 = v7;
    do
    {
      memcpy(v10, (char *)v9 + 28, *((unsigned int *)v9 + 5));
      v11 = &v10[*((unsigned int *)v9 + 5)];
      memcpy(v11, v9[1], *((unsigned int *)v9 + 6));
      v10 = &v11[*((unsigned int *)v9 + 6)];
      v9 = (uint64_t **)*v9;
    }
    while (v9);
  }
  if (a3)
    *a3 = v6;
  if (a2)
  {
    result = 0;
    *a2 = v8;
  }
  else
  {
    free(v8);
    return 0;
  }
  return result;
}

uint64_t _DEREncoderAddDataFromEncoderByEncoding(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v9;
  char *v10;
  void *v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v12 = 0;
  v9 = DEREncoderCreateEncodedBuffer(a1, &v12, &v13);
  if (!(_DWORD)v9)
  {
    v9 = 2;
    v10 = _EncodedDataCreate(a3, a4, v12, v13, a5, 2);
    if (v10)
    {
      v12 = 0;
      v9 = _DEREncoderAddEncodedData(a2, (uint64_t)v10);
    }
  }
  if (v12)
    free(v12);
  return v9;
}

uint64_t DEREncoderAddDataFromEncoderNoCopy(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t result;
  char *v8;
  char *v9;
  uint64_t *v10;
  _QWORD *i;
  _QWORD *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;

  result = 1;
  if (!a1 || !a2)
    return result;
  if (*(_DWORD *)(a2 + 12))
    return _DEREncoderAddDataFromEncoderByEncoding((uint64_t **)a1, (uint64_t *)a2, a3, a4, a5);
  v8 = _EncodedDataCreate(a3, a4, 0, *(_DWORD *)(a1 + 8), 1, 0);
  if (!v8)
    return 2;
  v9 = v8;
  v10 = *(uint64_t **)a1;
  v21 = 0;
  for (i = &v21; ; i = v12)
  {
    if (!v10)
    {
      v19 = v21;
      *(_QWORD *)v9 = v21;
      if (!v19)
        goto LABEL_20;
      return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
    }
    v12 = malloc(0x38uLL);
    if (!v12)
      break;
    v13 = v10[6];
    v15 = *((_OWORD *)v10 + 1);
    v14 = *((_OWORD *)v10 + 2);
    *(_OWORD *)v12 = *(_OWORD *)v10;
    *((_OWORD *)v12 + 1) = v15;
    v12[6] = v13;
    *((_OWORD *)v12 + 2) = v14;
    *v12 = 0;
    *((_DWORD *)v12 + 4) = 1;
    v16 = v10[1];
    if ((unint64_t)v10 + 28 > v16 || v16 >= (unint64_t)(v10 + 7))
    {
      if (v13)
        ++*(_DWORD *)(v13 + 16);
    }
    else
    {
      v12[1] = (char *)v12 + v16 - (_QWORD)v10;
    }
    *i = v12;
    v10 = (uint64_t *)*v10;
  }
  v17 = v21;
  if (v21)
  {
    do
    {
      v18 = (_QWORD *)*v17;
      _EncodedDataRelease((uint64_t)v17);
      v17 = v18;
    }
    while (v18);
  }
  *(_QWORD *)v9 = 0;
LABEL_20:
  if (!*(_QWORD *)a1)
    return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
  do
  {
    v20 = *(char **)v9;
    _EncodedDataRelease((uint64_t)v9);
    v9 = v20;
  }
  while (v20);
  return 2;
}

void _EncodedDataRelease(uint64_t a1)
{
  int v1;
  void *v3;
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v1;
  if (!v1)
  {
    v3 = *(void **)(a1 + 8);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (((unint64_t)v3 >= a1 + 56 || a1 + 28 > (unint64_t)v3) && v4 != 0)
      {
        if (v4 == a1)
          free(v3);
        else
          _EncodedDataRelease(*(_QWORD *)(a1 + 48));
      }
    }
    free((void *)a1);
  }
}

uint64_t Img4EncodeCreatePayload(const char *a1, const char *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, _QWORD *a7, unsigned int *a8)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t **v12;
  uint64_t v18;
  unsigned int v19;
  unsigned int EncodedBuffer;

  v8 = 0;
  v9 = 101;
  if (!a1 || !a2)
  {
    v12 = 0;
    goto LABEL_16;
  }
  v12 = 0;
  if (a3)
  {
    if (strlen(a1) != 4)
    {
      v8 = 0;
      v12 = 0;
      goto LABEL_16;
    }
    v8 = (uint64_t *)DEREncoderCreate(0);
    if (v8)
    {
      v12 = (uint64_t **)DEREncoderCreate(0);
      if (v12)
      {
        v18 = DEREncoderAddData(v8, 0, 0x16u, "IM4P", 4u, 0);
        if ((_DWORD)v18
          || (v18 = DEREncoderAddData(v8, 0, 0x16u, a1, 4u, 0), (_DWORD)v18)
          || (v19 = strlen(a2), v18 = DEREncoderAddData(v8, 0, 0x16u, a2, v19, 0), (_DWORD)v18)
          || (v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a3, a4, 0), (_DWORD)v18)
          || a5 && (v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a5, a6, 0), (_DWORD)v18)
          || (v18 = DEREncoderAddDataFromEncoderNoCopy((uint64_t)v8, (uint64_t)v12, 0, 0x10u, 1), (_DWORD)v18))
        {
          v9 = v18;
        }
        else
        {
          EncodedBuffer = DEREncoderCreateEncodedBuffer(v12, a7, a8);
          if (EncodedBuffer)
            v9 = EncodedBuffer;
          else
            v9 = 100;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v12 = 0;
    }
    v9 = 2;
  }
LABEL_16:
  DEREncoderDestroy((_QWORD **)v8);
  DEREncoderDestroy(v12);
  return v9;
}

void _cryptex_copy_list_lossy_cold_1(const char *a1, _QWORD *a2, _OWORD *a3)
{
  int *v5;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  v5 = __error();
  OUTLINED_FUNCTION_4(v5);
  _os_log_send_and_compose_impl();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_copy_list_lossy_cold_2(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_signing_service_dealloc_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_5();
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void cryptex_signing_service_set_tss_url_cold_1(const char *a1, _QWORD *a2, _OWORD *a3)
{
  int *v5;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_2_0();
  v5 = __error();
  strerror(*v5);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void cryptex_signing_service_set_image_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_5();
  __error();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void cryptex_signing_service_set_sso_ticket_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_signing_service_read_fd_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void _cryptex_signing_service_read_fd_cold_2()
{
  _os_crash();
  __break(1u);
}

void _hdi_copy_device_nodes_cold_1()
{
  _os_crash();
  __break(1u);
}

void _hdi_copy_device_nodes_cold_2()
{
  _os_crash();
  __break(1u);
}

void _hdi_copy_device_nodes_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void _hdi_copy_device_nodes_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void hdi_copy_mounted_cold_2()
{
  _os_crash();
  __break(1u);
}

void hdi_copy_mounted_cold_4()
{
  _os_crash();
  __break(1u);
}

void hdi_copy_mounted_cold_7(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_5();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void hdi_copy_mounted_cold_8(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_5();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void cryptex_event_type_int_to_ext_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _cryptex_msm_new_from_info_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_10(a1, a2);
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_msm_new_from_info_cold_2(const char *a1)
{
  int *v1;

  OUTLINED_FUNCTION_7_0(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0();
  v1 = __error();
  OUTLINED_FUNCTION_4(v1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void cryptex_copy_list_4MSM_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_10(a1, a2);
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void daemon_for_session_subsystem_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "could not connect to daemon", v0, 2u);
}

void _CFStringCopyUTF8String_cold_1()
{
  _os_crash();
  __break(1u);
}

void _CFStringGetUTF8String_cold_1()
{
  _os_crash();
  __break(1u);
}

void _CFDictionaryCreateMutableForCFTypes_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void _cryptex_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_attr_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_bundle_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_su_preboot_bundle_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_signing_service_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _session_alloc_cold_1()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(v0, v1);
  OUTLINED_FUNCTION_2_0();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_bundle_new_asset_from_object_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_5();
  __error();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void _cryptex_bundle_asset_new_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_bundle_asset_new_cold_2(const char *a1)
{
  _QWORD *v1;
  _OWORD *v2;
  int *v3;

  OUTLINED_FUNCTION_7_0(a1);
  *v1 = 0;
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  v3 = __error();
  OUTLINED_FUNCTION_4(v3);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_list_elm_new_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _cryptex_bundle_init_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_5();
  __error();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void _cryptex_bundle_add_cryptex_assets_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_5();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void cryptex_bundle_write2_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_5();
  __error();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7();
  __break(1u);
}

void _cryptex_bundle_open_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3(MEMORY[0x24BDACB70]);
  OUTLINED_FUNCTION_6_1();
  _os_crash_msg();
  __break(1u);
}

void collation_get_description_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2126F8000, a1, a3, "NSJSONSerialization error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_5();
}

void _cryptex_create_cold_1()
{
  _os_crash();
  __break(1u);
}

void _cryptex_identity_copy_description_cold_1(const char *a1, _QWORD *a2, _OWORD *a3)
{
  int *v5;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  OUTLINED_FUNCTION_2_0();
  v5 = __error();
  OUTLINED_FUNCTION_4(v5);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void cryptex_system_cx_copy_name_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void cryptex_system_cx_copy_name_cold_2(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_5();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void cryptex_get_image_type_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1();
  _os_crash_msg();
  __break(1u);
}

void cryptex_remote_service_nonce_get_nonce_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_nonce_attr_set_image_type_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_nonce_attr_set_cryptex_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_nonce_attr_set_cryptex_cold_3()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_copy_device_identifier2_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_copy_device_identifier2_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_cryptex_get_identifier_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_array_apply_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_array_apply_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_create_cold_1()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_create_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_roll_nonce2_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_uninstall2_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_remote_service_copy_installed2_cold_2()
{
  _os_crash();
  __break(1u);
}

void cryptex_array_pack_from_path_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void cryptex_array_pack_from_path_cold_2(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = a1;
  _os_log_error_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to open %s", (uint8_t *)&v1, 0xCu);
}

void cryptex_array_pack_from_path_cold_3()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to copy cryptex from bundle", v0, 2u);
}

void cryptex_attr_set_tss_url_cold_1(const char *a1)
{
  _QWORD *v1;
  _OWORD *v2;
  int *v3;

  OUTLINED_FUNCTION_7_0(a1);
  *v1 = 0;
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  OUTLINED_FUNCTION_2_0();
  v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE78](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBE80](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x24BDBBEA8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x24BDAC868]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _cryptex_actor_init_invoke_cstr()
{
  return MEMORY[0x24BEDBC30]();
}

uint64_t _cryptex_actor_init_invoke_u64()
{
  return MEMORY[0x24BEDBC38]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x24BDAC9B0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x24BDACBD0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

uint64_t claimfd_np()
{
  return MEMORY[0x24BDAD9A0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t close_drop_np()
{
  return MEMORY[0x24BDAD9E0]();
}

uint64_t close_drop_optional_np()
{
  return MEMORY[0x24BDAD9E8]();
}

uint64_t codex_install_pack()
{
  return MEMORY[0x24BEDBC40]();
}

uint64_t codex_install_reply_unpack()
{
  return MEMORY[0x24BEDBC48]();
}

uint64_t codex_list_pack()
{
  return MEMORY[0x24BEDBC50]();
}

uint64_t codex_list_reply_unpack()
{
  return MEMORY[0x24BEDBC58]();
}

uint64_t codex_lockdown_pack()
{
  return MEMORY[0x24BEDBC60]();
}

uint64_t collation_interface_request_endpoint_for_user()
{
  return MEMORY[0x24BEDBC68]();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

uint64_t cryptex_activate()
{
  return MEMORY[0x24BEDBA88]();
}

uint64_t cryptex_actor_connect()
{
  return MEMORY[0x24BEDBC70]();
}

uint64_t cryptex_actor_create()
{
  return MEMORY[0x24BEDBC78]();
}

uint64_t cryptex_actor_trap()
{
  return MEMORY[0x24BEDBC80]();
}

uint64_t cryptex_actor_trap_with_cferr()
{
  return MEMORY[0x24BEDBC88]();
}

uint64_t cryptex_asset_copy()
{
  return MEMORY[0x24BEDBA90]();
}

uint64_t cryptex_asset_create_generic_digest()
{
  return MEMORY[0x24BEDBA98]();
}

uint64_t cryptex_asset_destroy()
{
  return MEMORY[0x24BEDBAA0]();
}

uint64_t cryptex_asset_new()
{
  return MEMORY[0x24BEDBAA8]();
}

uint64_t cryptex_asset_new_borrowed()
{
  return MEMORY[0x24BEDBAB0]();
}

uint64_t cryptex_core_attach_host()
{
  return MEMORY[0x24BEDBAC0]();
}

uint64_t cryptex_core_copy_nonce_domain_desc()
{
  return MEMORY[0x24BEDBAC8]();
}

uint64_t cryptex_core_create()
{
  return MEMORY[0x24BEDBAD0]();
}

uint64_t cryptex_core_cx1_copy_xpc_dictionary()
{
  return MEMORY[0x24BEDBAD8]();
}

uint64_t cryptex_core_cx1_properties_create()
{
  return MEMORY[0x24BEDBAE0]();
}

uint64_t cryptex_core_get_asset()
{
  return MEMORY[0x24BEDBAE8]();
}

uint64_t cryptex_core_get_cryptex1_properties()
{
  return MEMORY[0x24BEDBAF0]();
}

uint64_t cryptex_core_get_image_asset()
{
  return MEMORY[0x24BEDBAF8]();
}

uint64_t cryptex_core_get_info_asset()
{
  return MEMORY[0x24BEDBB00]();
}

uint64_t cryptex_core_get_nonce_domain()
{
  return MEMORY[0x24BEDBB08]();
}

uint64_t cryptex_core_get_nonce_domain_handle()
{
  return MEMORY[0x24BEDBB10]();
}

uint64_t cryptex_core_get_tc_asset()
{
  return MEMORY[0x24BEDBB18]();
}

uint64_t cryptex_core_get_volumehash_asset()
{
  return MEMORY[0x24BEDBB20]();
}

uint64_t cryptex_core_is_cryptex1()
{
  return MEMORY[0x24BEDBB28]();
}

uint64_t cryptex_core_parse_hdiid()
{
  return MEMORY[0x24BEDBB30]();
}

uint64_t cryptex_core_parse_info_asset()
{
  return MEMORY[0x24BEDBB38]();
}

uint64_t cryptex_core_set_asset()
{
  return MEMORY[0x24BEDBB40]();
}

uint64_t cryptex_core_set_cryptex1_properties()
{
  return MEMORY[0x24BEDBB48]();
}

uint64_t cryptex_host_create()
{
  return MEMORY[0x24BEDBB50]();
}

uint64_t cryptex_scrivener_create()
{
  return MEMORY[0x24BEDBB58]();
}

uint64_t cryptex_scrivener_set_nonce()
{
  return MEMORY[0x24BEDBB60]();
}

uint64_t cryptex_scrivener_set_socks_proxy()
{
  return MEMORY[0x24BEDBB68]();
}

uint64_t cryptex_scrivener_set_url()
{
  return MEMORY[0x24BEDBB70]();
}

uint64_t cryptex_scrivener_sign()
{
  return MEMORY[0x24BEDBB78]();
}

uint64_t cryptex_session_core_copy_xpc_object()
{
  return MEMORY[0x24BEDBB80]();
}

uint64_t cryptex_session_core_create_from_xpc()
{
  return MEMORY[0x24BEDBB88]();
}

uint64_t cryptex_session_core_merge()
{
  return MEMORY[0x24BEDBB90]();
}

uint64_t cryptex_session_state_to_string()
{
  return MEMORY[0x24BEDBB98]();
}

uint64_t cryptex_signature_write()
{
  return MEMORY[0x24BEDBBA0]();
}

uint64_t cryptex_subsystem_create_actor()
{
  return MEMORY[0x24BEDBC98]();
}

uint64_t cryptex_target_async_f()
{
  return MEMORY[0x24BEDBBA8]();
}

uint64_t cryptex_tss_activate()
{
  return MEMORY[0x24BEDBBB0]();
}

uint64_t cryptex_tss_async()
{
  return MEMORY[0x24BEDBBB8]();
}

uint64_t cryptex_tss_create()
{
  return MEMORY[0x24BEDBBC0]();
}

uint64_t cryptex_tss_set_BOOL()
{
  return MEMORY[0x24BEDBBC8]();
}

uint64_t cryptex_tss_set_c411_from_file()
{
  return MEMORY[0x24BEDBBD0]();
}

uint64_t cryptex_tss_set_data()
{
  return MEMORY[0x24BEDBBD8]();
}

uint64_t cryptex_tss_set_dgst()
{
  return MEMORY[0x24BEDBBE0]();
}

uint64_t cryptex_tss_set_im4m_array()
{
  return MEMORY[0x24BEDBBE8]();
}

uint64_t cryptex_tss_set_object_BOOL()
{
  return MEMORY[0x24BEDBBF0]();
}

uint64_t cryptex_tss_set_object_dgst()
{
  return MEMORY[0x24BEDBBF8]();
}

uint64_t cryptex_tss_set_string()
{
  return MEMORY[0x24BEDBC00]();
}

uint64_t cryptex_tss_set_u32()
{
  return MEMORY[0x24BEDBC08]();
}

uint64_t cryptex_tss_set_u64()
{
  return MEMORY[0x24BEDBC10]();
}

uint64_t cryptex_tss_set_url()
{
  return MEMORY[0x24BEDBC18]();
}

uint64_t cryptex_tss_submit()
{
  return MEMORY[0x24BEDBC20]();
}

uint64_t cryptex_uninstall_pack()
{
  return MEMORY[0x24BEDBCB8]();
}

uint64_t cryptex_uninstall_reply_unpack()
{
  return MEMORY[0x24BEDBCC0]();
}

uint64_t cryptex_xpc_create_connection()
{
  return MEMORY[0x24BEDBCC8]();
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDADC48](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

uint64_t dup_np()
{
  return MEMORY[0x24BDAE0C8]();
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x24BDAE2F0](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x24BDAE608](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

uint64_t img4_buff_dealloc()
{
  return MEMORY[0x24BEDC410]();
}

uint64_t img4_chip_instantiate()
{
  return MEMORY[0x24BEDC428]();
}

uint64_t img4_chip_select_personalized_ap()
{
  return MEMORY[0x24BEDC430]();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return MEMORY[0x24BEDC480]();
}

uint64_t img4_runtime_execute_object()
{
  return MEMORY[0x24BEDC490]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_right_send_release()
{
  return MEMORY[0x24BDAEC40]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t memdup2_np()
{
  return MEMORY[0x24BDAEE88]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x24BDAEF30](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl mkdtempat_np(int dfd, char *path)
{
  return (char *)MEMORY[0x24BDAEF40](*(_QWORD *)&dfd, path);
}

int mkpathat_np(int dfd, const char *path, mode_t omode)
{
  return MEMORY[0x24BDAEF68](*(_QWORD *)&dfd, path, omode);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint64_t mount_interface_create_mount_request()
{
  return MEMORY[0x24BEDBCD0]();
}

uint64_t mount_interface_create_unmount_request()
{
  return MEMORY[0x24BEDBCD8]();
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x24BDAF240](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x24BDAF3F8](object);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

uint64_t realpath_np()
{
  return MEMORY[0x24BDAFAC8]();
}

uint64_t remote_device_copy_properties()
{
  return MEMORY[0x24BE7ED20]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x24BE7ED30]();
}

uint64_t remote_device_get_name()
{
  return MEMORY[0x24BE7ED48]();
}

uint64_t remote_device_get_state()
{
  return MEMORY[0x24BE7ED50]();
}

uint64_t remote_service_create_copy_installed_request()
{
  return MEMORY[0x24BEDBCE0]();
}

uint64_t remote_service_create_install_request()
{
  return MEMORY[0x24BEDBCE8]();
}

uint64_t remote_service_create_nonce_handle_request()
{
  return MEMORY[0x24BEDBCF0]();
}

uint64_t remote_service_create_nonce_index_request()
{
  return MEMORY[0x24BEDBCF8]();
}

uint64_t remote_service_create_personalization_identifiers_request()
{
  return MEMORY[0x24BEDBD00]();
}

uint64_t remote_service_create_roll_nonce_handle_request()
{
  return MEMORY[0x24BEDBD08]();
}

uint64_t remote_service_create_roll_nonce_index_request()
{
  return MEMORY[0x24BEDBD10]();
}

uint64_t remote_service_create_uninstall_request()
{
  return MEMORY[0x24BEDBD18]();
}

uint64_t remote_service_supports_feature()
{
  return MEMORY[0x24BE7ED70]();
}

uint64_t session_activate_pack()
{
  return MEMORY[0x24BEDBD20]();
}

uint64_t session_activate_reply_unpack()
{
  return MEMORY[0x24BEDBD28]();
}

uint64_t session_core_create()
{
  return MEMORY[0x24BEDBC28]();
}

uint64_t session_list_pack()
{
  return MEMORY[0x24BEDBD30]();
}

uint64_t session_list_reply_unpack()
{
  return MEMORY[0x24BEDBD38]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
}

uint64_t xpc_copy_clean_description()
{
  return MEMORY[0x24BDB0808]();
}

uint64_t xpc_copy_debug_description()
{
  return MEMORY[0x24BDB0818]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x24BDB0850]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x24BDB09A0](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x24BE7EE90]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x24BE7EEA0]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x24BE7EEB0]();
}

uint64_t xpc_remote_connection_send_message_with_reply_sync()
{
  return MEMORY[0x24BE7EEC8]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x24BE7EED8]();
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

xpc_object_t xpc_string_create_with_format(const char *fmt, ...)
{
  return (xpc_object_t)MEMORY[0x24BDB0B90](fmt);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x24BDB0BD0](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}


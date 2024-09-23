_xpc_connection_s *cryptex_xpc_create_connection(dispatch_queue_t targetq)
{
  _xpc_connection_s *mach_service;

  mach_service = xpc_connection_create_mach_service("com.apple.security.cryptex.xpc", targetq, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  xpc_connection_activate(mach_service);
  return mach_service;
}

void __cryptex_xpc_create_connection_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x212BE6E54](a2) != MEMORY[0x24BDACFB8])
    __cryptex_xpc_create_connection_block_invoke_cold_1();
  v3 = (void *)MEMORY[0x212BE6D7C](a2);
  v4 = *__error();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = v3;
    _os_log_impl(&dword_211B06000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Received error: %s", (uint8_t *)&v5, 0xCu);
  }
  *__error() = v4;
  free(v3);
}

void _cryptex_actor_dealloc(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 56);
  if (v2)
    os_release(v2);
  object_proto_destroy(a1 + 16);
}

_QWORD *cryptex_actor_create(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  v4 = (_QWORD *)_cryptex_actor_alloc();
  v4[5] = a2;
  v4[6] = a1;
  v4[7] = 0;
  object_proto_init((uint64_t)(v4 + 2), (int)"com.apple.security.libcryptex.interface", "actor");
  object_set_name((uint64_t)(v4 + 2), *(const char **)(a1 + 16));
  return v4;
}

uint64_t cryptex_actor_connect(_QWORD *a1, int a2)
{
  void *v3;
  int v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  void *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((a2 - 1) <= 0xFFFFFFFD)
  {
    v3 = (void *)xpc_pipe_create_from_port();
    goto LABEL_14;
  }
  v4 = bootstrap_look_up2();
  v5 = (const char *)a1[2];
  v6 = *__error();
  v7 = a1[4];
  if (v4)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v8 = "[anonymous]";
    if (v5)
      v8 = v5;
    *(_DWORD *)buf = 136446466;
    v16 = v8;
    v17 = 1024;
    v18 = v4;
    v9 = "%{public}s: bootstrap_look_up: %{mach.errno}x";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    v12 = "[anonymous]";
    if (v5)
      v12 = v5;
    *(_DWORD *)buf = 136446466;
    v16 = v12;
    v17 = 1024;
    v18 = 0;
    v9 = "%{public}s: looked up port: %#x";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
  }
  _os_log_impl(&dword_211B06000, v10, v11, v9, buf, 0x12u);
LABEL_13:
  *__error() = v6;
  v3 = (void *)xpc_pipe_create_from_port();
  if (!v3)
    return 74;
LABEL_14:
  v13 = (void *)a1[7];
  if (v13)
    os_release(v13);
  a1[7] = os_retain(v3);
  if (v3)
    os_release(v3);
  return 0;
}

void _cryptex_actor_init_invoke_u64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _rpc_target_init_u64((_QWORD *)(a4 + 16), **(_QWORD **)(a1 + 48), a3, a2);
  rpc_init_remote(a4, 0, *(void **)(a1 + 32));
}

void _cryptex_actor_init_invoke_cstr(uint64_t a1, char *__source, uint64_t a3, uint64_t a4)
{
  _rpc_target_init_cstr(a4 + 16, **(_QWORD **)(a1 + 48), a3, __source);
  rpc_init_remote(a4, 0, *(void **)(a1 + 32));
}

void _cryptex_actor_init_invoke_port(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _rpc_target_init_port(a4 + 16, **(_QWORD **)(a1 + 48), a3);
  rpc_init_remote(a4, 0, *(void **)(a1 + 32));
}

uint64_t cryptex_actor_trap(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  CFErrorRef v4;
  CFErrorRef v5;
  CFIndex TopLevelPosixError;
  uint64_t v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int *v12;
  uint64_t result;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = rpc_call(a1[7], a2, a3);
  v5 = v4;
  if (v4)
  {
    TopLevelPosixError = _CFErrorGetTopLevelPosixError((CFIndex)v4);
    if ((_DWORD)TopLevelPosixError == 5)
    {
      v14 = (const char *)a1[2];
      v15 = *__error();
      v16 = a1[4];
      v7 = 57;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = "[anonymous]";
        if (v14)
          v17 = v14;
        v21 = 136446466;
        v22 = v17;
        v23 = 1024;
        v24 = 57;
        v18 = "%{public}s: pipe went dead: %{darwin.errno}d";
        goto LABEL_18;
      }
    }
    else
    {
      v7 = TopLevelPosixError;
      if (!(_DWORD)TopLevelPosixError)
        goto LABEL_4;
      v19 = (const char *)a1[2];
      v15 = *__error();
      v16 = a1[4];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = "[anonymous]";
        if (v19)
          v20 = v19;
        v21 = 136446466;
        v22 = v20;
        v23 = 1024;
        v24 = v7;
        v18 = "%{public}s: ipc failure: %{darwin.errno}d";
LABEL_18:
        _os_log_impl(&dword_211B06000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v21, 0x12u);
      }
    }
    *__error() = v15;
LABEL_20:
    CFRelease(v5);
    return v7;
  }
LABEL_4:
  v8 = (const char *)a1[2];
  v9 = *__error();
  v10 = a1[4];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = "[anonymous]";
    if (v8)
      v11 = v8;
    v21 = 136446210;
    v22 = v11;
    _os_log_impl(&dword_211B06000, v10, OS_LOG_TYPE_DEBUG, "%{public}s: ipc routine succeeded", (uint8_t *)&v21, 0xCu);
  }
  v12 = __error();
  v7 = 0;
  result = 0;
  *v12 = v9;
  if (v5)
    goto LABEL_20;
  return result;
}

CFErrorRef cryptex_actor_trap_with_cferr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFErrorRef v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v12;
  CFErrorRef v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = rpc_call(*(_QWORD *)(a1 + 56), a2, a3);
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v4;
      v7 = "ipc: %@";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 12;
LABEL_6:
      _os_log_impl(&dword_211B06000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    v7 = "ipc [no error]";
    v8 = v6;
    v9 = OS_LOG_TYPE_DEBUG;
    v10 = 2;
    goto LABEL_6;
  }
  *__error() = v5;
  return v4;
}

void codex_install_pack(uint64_t a1, uint64_t a2)
{
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)a1);
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 4));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 8));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 12));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 16));
  _rpc_pack_int64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 24));
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 32));
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 40));
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 48));
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 56));
  _rpc_pack_array(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(xpc_object_t *)(a1 + 64));
}

uint64_t codex_install_unpack(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  size_t v5;

  v5 = 0;
  result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)a2);
  if (!(_DWORD)result)
  {
    result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 4));
    if (!(_DWORD)result)
    {
      result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 8));
      if ((_DWORD)result)
      {
        if ((_DWORD)result != 2)
          return result;
        *(_DWORD *)(a2 + 8) = -1;
        ++v5;
      }
      result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 12));
      if (!(_DWORD)result)
      {
        result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 16));
        if ((_DWORD)result)
        {
          if ((_DWORD)result != 2)
            return result;
          *(_DWORD *)(a2 + 16) = -1;
          ++v5;
        }
        result = _rpc_unpack_int64(*(void **)(a1 + 304), &v5, (int64_t *)(a2 + 24));
        if (!(_DWORD)result)
        {
          result = _rpc_unpack_uint64(*(void **)(a1 + 304), &v5, (uint64_t *)(a2 + 32));
          if (!(_DWORD)result)
          {
            result = _rpc_unpack_uint64(*(void **)(a1 + 304), &v5, (uint64_t *)(a2 + 40));
            if (!(_DWORD)result)
            {
              result = _rpc_unpack_uint64(*(void **)(a1 + 304), &v5, (uint64_t *)(a2 + 48));
              if (!(_DWORD)result)
              {
                result = _rpc_unpack_uint64(*(void **)(a1 + 304), &v5, (uint64_t *)(a2 + 56));
                if ((int)result <= 33)
                {
                  if (!(_DWORD)result)
                    return _rpc_unpack_dictionary(*(void **)(a1 + 304), &v5, (void **)(a2 + 64));
                  if ((_DWORD)result != 2)
                    return result;
LABEL_21:
                  *(_QWORD *)(a2 + 56) = 0;
                  ++v5;
                  return _rpc_unpack_dictionary(*(void **)(a1 + 304), &v5, (void **)(a2 + 64));
                }
                if ((_DWORD)result == 79 || (_DWORD)result == 34)
                  goto LABEL_21;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void codex_install_reply_pack(const char **a1, uint64_t a2)
{
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, a1[1]);
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, a1[2]);
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, a1[3]);
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, a1[4]);
}

uint64_t codex_install_reply_unpack(uint64_t a1, const char **a2)
{
  uint64_t result;
  size_t v5;

  v5 = 0;
  result = _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2);
  if (!(_DWORD)result)
  {
    result = _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2 + 1);
    if (!(_DWORD)result)
    {
      result = _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2 + 2);
      if (!(_DWORD)result)
      {
        result = _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2 + 3);
        if (!(_DWORD)result)
          return _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2 + 4);
      }
    }
  }
  return result;
}

uint64_t codex_list_unpack()
{
  return 0;
}

void codex_list_reply_pack(xpc_object_t *a1, uint64_t a2)
{
  _rpc_pack_array(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t codex_list_reply_unpack(uint64_t a1, void **a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_array(*(void **)(a1 + 304), &v3, a2);
}

uint64_t codex_lockdown_unpack()
{
  return 0;
}

uint64_t codex_lockdown_reply_unpack()
{
  return 0;
}

void codex_upgrade_stage_semi_splat_pack(uint64_t a1, uint64_t a2)
{
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(const char **)a1);
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 8));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 16));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 20));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 24));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 28));
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_DWORD *)(a1 + 32));
  _rpc_pack_int64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 40));
}

uint64_t codex_upgrade_stage_semi_splat_unpack(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  size_t v5;

  v5 = 0;
  result = _rpc_unpack_string(*(void **)(a1 + 304), &v5, (const char **)a2);
  if (!(_DWORD)result)
  {
    result = _rpc_unpack_uint64(*(void **)(a1 + 304), &v5, (uint64_t *)(a2 + 8));
    if (!(_DWORD)result)
    {
      result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 16));
      if (!(_DWORD)result)
      {
        result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 20));
        if (!(_DWORD)result)
        {
          result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 24));
          if (!(_DWORD)result)
          {
            result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 28));
            if ((_DWORD)result)
            {
              if ((_DWORD)result != 2)
                return result;
              *(_DWORD *)(a2 + 28) = -1;
              ++v5;
            }
            result = _rpc_unpack_fd(*(void **)(a1 + 304), &v5, (int *)(a2 + 32));
            if (!(_DWORD)result)
              return _rpc_unpack_int64(*(void **)(a1 + 304), &v5, (int64_t *)(a2 + 40));
          }
        }
      }
    }
  }
  return result;
}

void codex_upgrade_stage_semi_splat_reply_pack(const char **a1, uint64_t a2)
{
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, a1[1]);
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, a1[2]);
}

uint64_t codex_upgrade_stage_semi_splat_reply_unpack(uint64_t a1, const char **a2)
{
  uint64_t result;
  size_t v5;

  v5 = 0;
  result = _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2);
  if (!(_DWORD)result)
  {
    result = _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2 + 1);
    if (!(_DWORD)result)
      return _rpc_unpack_string(*(void **)(a1 + 304), &v5, a2 + 2);
  }
  return result;
}

void codex_upgrade_commit_semi_splat_pack(uint64_t *a1, uint64_t a2)
{
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t codex_upgrade_commit_semi_splat_unpack(uint64_t a1, uint64_t *a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_uint64(*(void **)(a1 + 304), &v3, a2);
}

uint64_t codex_upgrade_commit_semi_splat_reply_unpack()
{
  return 0;
}

uint64_t cryptex_trampoline_upgrade_interface_wait(const char *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  xpc_object_t empty;
  xpc_object_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BYTE v21[24];
  void *v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (cryptex_trampoline_upgrade_xpc_get_queue_once_q_token != -1)
    dispatch_once(&cryptex_trampoline_upgrade_xpc_get_queue_once_q_token, &__block_literal_global_0);
  v2 = (id)cryptex_trampoline_upgrade_xpc_get_queue_local;
  *(_QWORD *)v21 = MEMORY[0x24BDAC760];
  *(_QWORD *)&v21[8] = 3221225472;
  *(_QWORD *)&v21[16] = __cryptex_trampoline_upgrade_xpc_get_connection_block_invoke;
  v22 = &unk_24CCF59D8;
  v23 = v2;
  v3 = cryptex_trampoline_upgrade_xpc_get_connection_once_con_token;
  v4 = v2;
  v5 = v4;
  if (v3 == -1)
  {
    v6 = v4;
  }
  else
  {
    dispatch_once(&cryptex_trampoline_upgrade_xpc_get_connection_once_con_token, v21);
    v6 = v23;
  }
  v7 = (_xpc_connection_s *)(id)cryptex_trampoline_upgrade_xpc_get_connection_conn;

  if (!v7)
  {
    empty = 0;
    v13 = 0;
    v14 = 3;
    goto LABEL_21;
  }
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "SUBSYSTEM", "UPGRADE_WAIT");
  if (a1)
    xpc_dictionary_set_string(empty, "cryptex_name", a1);
  if (!empty)
  {
    v13 = 0;
    v14 = 12;
    goto LABEL_21;
  }
  v9 = xpc_connection_send_message_with_reply_sync(v7, empty);
  if (!v9)
  {
    v15 = *__error();
    cryptex_upgrade_trampoline_osl();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)v21 = 0x504000100;
      _os_log_impl(&dword_211B06000, v16, OS_LOG_TYPE_ERROR, "No reply from cryptexd while waiting on upgrade.: %{darwin.errno}d", v21, 8u);
    }

    v13 = 0;
    *__error() = v15;
    goto LABEL_20;
  }
  v13 = v9;
  if (MEMORY[0x212BE6E54](v9, v10, v11, v12) == MEMORY[0x24BDACFB8])
  {
    v17 = (void *)MEMORY[0x212BE6D7C](v13);
    v18 = *__error();
    cryptex_upgrade_trampoline_osl();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 136446466;
      *(_QWORD *)&v21[4] = v17;
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 5;
      _os_log_impl(&dword_211B06000, v19, OS_LOG_TYPE_ERROR, "Error from cryptexd while waiting on upgrade: %{public}s: %{darwin.errno}d", v21, 0x12u);
    }

    *__error() = v18;
    free(v17);
LABEL_20:
    v14 = 5;
    goto LABEL_21;
  }
  v14 = 0;
LABEL_21:

  return v14;
}

void sub_211B087A4(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

id cryptex_upgrade_trampoline_osl()
{
  if (cryptex_upgrade_trampoline_osl_onceToken != -1)
    dispatch_once(&cryptex_upgrade_trampoline_osl_onceToken, &__block_literal_global_5);
  return (id)cryptex_upgrade_trampoline_osl_trampoline_log;
}

void __cryptex_trampoline_upgrade_xpc_get_connection_block_invoke(uint64_t a1)
{
  _xpc_connection_s *connection;
  void *v2;

  connection = cryptex_xpc_create_connection(*(dispatch_queue_t *)(a1 + 32));
  v2 = (void *)cryptex_trampoline_upgrade_xpc_get_connection_conn;
  cryptex_trampoline_upgrade_xpc_get_connection_conn = (uint64_t)connection;

}

void __cryptex_trampoline_upgrade_xpc_get_queue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.security.libcryptex.interface.upgrade_trampoline", 0);
  v1 = (void *)cryptex_trampoline_upgrade_xpc_get_queue_local;
  cryptex_trampoline_upgrade_xpc_get_queue_local = (uint64_t)v0;

}

void __cryptex_upgrade_trampoline_osl_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libcryptex", "upgrade_trampoline");
  v1 = (void *)cryptex_upgrade_trampoline_osl_trampoline_log;
  cryptex_upgrade_trampoline_osl_trampoline_log = (uint64_t)v0;

}

xpc_object_t remote_service_create_nonce_index_request(uint64_t a1)
{
  void *v2;
  xpc_object_t request;

  _remote_service_create_argv();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v2, "nonce-domain", a1);
  request = _xpc_create_request("get-nonce", v2);

  return request;
}

id _remote_service_create_argv()
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "client-version", 3uLL);
  return empty;
}

xpc_object_t remote_service_create_nonce_handle_request(unsigned int a1)
{
  xpc_object_t empty;
  xpc_object_t request;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "nonce-domain-handle", a1);
  request = _xpc_create_request("get-nonce", empty);

  return request;
}

xpc_object_t remote_service_create_roll_nonce_index_request(uint64_t a1)
{
  void *v2;
  xpc_object_t request;

  _remote_service_create_argv();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v2, "nonce-domain", a1);
  request = _xpc_create_request("roll-nonce", v2);

  return request;
}

xpc_object_t remote_service_create_roll_nonce_handle_request(unsigned int a1)
{
  xpc_object_t empty;
  xpc_object_t request;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "nonce-domain-handle", a1);
  request = _xpc_create_request("roll-nonce", empty);

  return request;
}

CFErrorRef remote_service_create_install_request(_QWORD *a1, int a2, int64_t a3, int a4, int a5, int a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CFErrorRef v28;
  void *v29;
  NSObject *v30;
  char *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  CFErrorRef Error;
  _QWORD *v38;

  v19 = a11;
  _remote_service_create_argv();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a2 < 0)
  {
    _rsi_log();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      _rsi_log();
      v30 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      v31 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v31 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("remote_service_create_install_request", "remote_service_interface.m", 112, "com.apple.security.cryptex", 15, 0, v31);
    goto LABEL_21;
  }
  if (a4 < 0)
  {
    _rsi_log();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      _rsi_log();
      v33 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
      v31 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v31 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("remote_service_create_install_request", "remote_service_interface.m", 120, "com.apple.security.cryptex", 15, 0, v31);
    goto LABEL_21;
  }
  if (a6 < 0)
  {
    _rsi_log();
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      _rsi_log();
      v35 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      v31 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v31 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("remote_service_create_install_request", "remote_service_interface.m", 128, "com.apple.security.cryptex", 15, 0, v31);
LABEL_21:
    v28 = Error;
    free(v31);
    goto LABEL_22;
  }
  v38 = a1;
  xpc_dictionary_set_int64(v20, "image-type-index", a3);
  xpc_dictionary_set_uint64(v21, "auth", a8);
  xpc_dictionary_set_uint64(v21, "persistence", a9);
  xpc_dictionary_set_uint64(v21, "nonce-persistence", a10);
  v22 = v19;
  xpc_dictionary_set_value(v21, "cryptex1-properties", v19);
  if ((a5 & 0x80000000) == 0)
  {
    v23 = (void *)xpc_file_transfer_create_with_fd();
    xpc_dictionary_set_value(v21, "info", v23);

  }
  if ((a7 & 0x80000000) == 0)
  {
    v24 = (void *)xpc_file_transfer_create_with_fd();
    xpc_dictionary_set_value(v21, "volumehash", v24);

  }
  v25 = (void *)xpc_file_transfer_create_with_fd();
  xpc_dictionary_set_value(v21, "image", v25);
  v26 = (void *)xpc_file_transfer_create_with_fd();
  xpc_dictionary_set_value(v21, "trustcache", v26);
  v27 = (void *)xpc_file_transfer_create_with_fd();
  xpc_dictionary_set_value(v21, "im4m", v27);
  *v38 = _xpc_create_request("install", v21);

  v28 = 0;
  v19 = v22;
LABEL_22:

  return v28;
}

void sub_211B08EE8(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

id _rsi_log()
{
  if (_rsi_log_onceToken != -1)
    dispatch_once(&_rsi_log_onceToken, &__block_literal_global_33);
  return (id)_rsi_log_osl;
}

int *__remote_service_create_install_request_block_invoke(uint64_t a1, int a2)
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int *result;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *__error();
  _rsi_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a2;
      v6 = "c411 transfer: %{darwin.errno}d";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 8;
LABEL_6:
      _os_log_impl(&dword_211B06000, v7, v8, v6, (uint8_t *)v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    v6 = "c411 transfer [no error]";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 2;
    goto LABEL_6;
  }

  result = __error();
  *result = v3;
  return result;
}

int *__remote_service_create_install_request_block_invoke_13(uint64_t a1, int a2)
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int *result;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *__error();
  _rsi_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a2;
      v6 = "volume hash transfer: %{darwin.errno}d";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 8;
LABEL_6:
      _os_log_impl(&dword_211B06000, v7, v8, v6, (uint8_t *)v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    v6 = "volume hash transfer [no error]";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 2;
    goto LABEL_6;
  }

  result = __error();
  *result = v3;
  return result;
}

int *__remote_service_create_install_request_block_invoke_16(uint64_t a1, int a2)
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int *result;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *__error();
  _rsi_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a2;
      v6 = "image transfer: %{darwin.errno}d";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 8;
LABEL_6:
      _os_log_impl(&dword_211B06000, v7, v8, v6, (uint8_t *)v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    v6 = "image transfer [no error]";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 2;
    goto LABEL_6;
  }

  result = __error();
  *result = v3;
  return result;
}

int *__remote_service_create_install_request_block_invoke_19(uint64_t a1, int a2)
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int *result;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *__error();
  _rsi_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a2;
      v6 = "trustcache transfer: %{darwin.errno}d";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 8;
LABEL_6:
      _os_log_impl(&dword_211B06000, v7, v8, v6, (uint8_t *)v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    v6 = "trustcache transfer [no error]";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 2;
    goto LABEL_6;
  }

  result = __error();
  *result = v3;
  return result;
}

int *__remote_service_create_install_request_block_invoke_22(uint64_t a1, int a2)
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int *result;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *__error();
  _rsi_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a2;
      v6 = "im4m transfer: %{darwin.errno}d";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 8;
LABEL_6:
      _os_log_impl(&dword_211B06000, v7, v8, v6, (uint8_t *)v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    v6 = "im4m transfer [no error]";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 2;
    goto LABEL_6;
  }

  result = __error();
  *result = v3;
  return result;
}

uint64_t remote_service_install_request_valid(void *a1)
{
  int argv;
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;
  id v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  argv = _xpc_request_get_argv(a1, &v12);
  v2 = v12;
  v3 = v2;
  if (argv)
  {
    v4 = *__error();
    _rsi_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = argv;
      _os_log_impl(&dword_211B06000, v5, OS_LOG_TYPE_ERROR, "failed to get argv: %{darwin.errno}d", buf, 8u);
    }

    v6 = 0;
    v7 = 0;
    *__error() = v4;
  }
  else
  {
    if (_xpc_dictionary_key_with_type_exists(v2, "image", MEMORY[0x24BDACFC8])
      && _xpc_dictionary_key_with_type_exists(v3, "trustcache", MEMORY[0x24BDACFC8])
      && _xpc_dictionary_key_with_type_exists(v3, "im4m", MEMORY[0x24BDACFC8])
      && _xpc_dictionary_key_with_type_exists(v3, "image-type-index", MEMORY[0x24BDACFD0])
      && _xpc_dictionary_key_with_type_exists(v3, "persistence", MEMORY[0x24BDACFF8])
      && _xpc_dictionary_key_with_type_exists(v3, "nonce-persistence", MEMORY[0x24BDACFF8]))
    {
      v8 = _xpc_dictionary_key_with_type_exists(v3, "auth", MEMORY[0x24BDACFF8]);
    }
    else
    {
      v8 = 0;
    }
    xpc_dictionary_get_value(v3, "info");
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v9;
    if (v9)
      v6 = 0;
    else
      v6 = v8;
    if (v9)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (!v10)
      v6 = _xpc_dictionary_key_with_type_exists(v3, "info", MEMORY[0x24BDACFC8]);
  }

  return v6;
}

xpc_object_t remote_service_create_uninstall_request(const char *a1, const char *a2)
{
  void *v4;
  xpc_object_t request;

  _remote_service_create_argv();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v4, "remote-cryptex-identifier", a1);
  if (a2)
    xpc_dictionary_set_string(v4, "remote-cryptex-version", a2);
  request = _xpc_create_request("uninstall", v4);

  return request;
}

xpc_object_t remote_service_create_copy_installed_request()
{
  void *v0;
  xpc_object_t request;

  _remote_service_create_argv();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  request = _xpc_create_request("copy-installed", v0);

  return request;
}

xpc_object_t remote_service_create_personalization_identifiers_request()
{
  void *v0;
  xpc_object_t request;

  _remote_service_create_argv();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  request = _xpc_create_request("read-personalization-id", v0);

  return request;
}

void ___rsi_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libcryptex", "remote_service_interface");
  v1 = (void *)_rsi_log_osl;
  _rsi_log_osl = (uint64_t)v0;

}

void cryptex_uninstall_pack(uint64_t *a1, uint64_t a2)
{
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t cryptex_uninstall_unpack(uint64_t a1, uint64_t *a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_uint64(*(void **)(a1 + 304), &v3, a2);
}

uint64_t cryptex_uninstall_reply_unpack()
{
  return 0;
}

CFStringRef _CFStringCreateFromUTF8String(char *cStr)
{
  return CFStringCreateWithCString(0, cStr, 0x8000100u);
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
      return dword_211B0ED28[Code];
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(_QWORD *a1, _OWORD *a2)
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

BOOL OUTLINED_FUNCTION_3()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return _os_crash_msg();
}

uint64_t daemon_version_unpack()
{
  return 0;
}

void daemon_version_reply_pack(const char **a1, uint64_t a2)
{
  _rpc_pack_string(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t daemon_version_reply_unpack(uint64_t a1, char **a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_string_copy(*(void **)(a1 + 304), &v3, a2);
}

void daemon_async_pack(uint64_t *a1, uint64_t a2)
{
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t daemon_async_unpack(uint64_t a1, uint64_t *a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_uint64(*(void **)(a1 + 304), &v3, a2);
}

void daemon_async_reply_pack(uint64_t *a1, uint64_t a2)
{
  _rpc_pack_uint64(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t daemon_async_reply_unpack(uint64_t a1, uint64_t *a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_uint64(*(void **)(a1 + 304), &v3, a2);
}

uint64_t daemon_open_mountable_unpack()
{
  return 0;
}

void daemon_open_mountable_reply_pack(int *a1, uint64_t a2)
{
  _rpc_pack_fd(*(void **)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t daemon_open_mountable_reply_unpack(uint64_t a1, int *a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_fd(*(void **)(a1 + 304), &v3, a2);
}

id collation_xpc_get_queue()
{
  if (collation_xpc_get_queue_once_q_token != -1)
    dispatch_once(&collation_xpc_get_queue_once_q_token, &__block_literal_global_2);
  return (id)collation_xpc_get_queue_local;
}

void __collation_xpc_get_queue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)collation_xpc_get_queue_local;
  collation_xpc_get_queue_local = (uint64_t)v0;

}

id collation_xpc_get_connection()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  _QWORD block[4];
  id v6;

  collation_xpc_get_queue();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __collation_xpc_get_connection_block_invoke;
  block[3] = &unk_24CCF59D8;
  v6 = v0;
  v1 = collation_xpc_get_connection_once_con_token;
  v2 = v0;
  if (v1 != -1)
    dispatch_once(&collation_xpc_get_connection_once_con_token, block);
  v3 = (id)collation_xpc_get_connection_conn;

  return v3;
}

void __collation_xpc_get_connection_block_invoke(uint64_t a1)
{
  _xpc_connection_s *connection;
  void *v2;

  connection = cryptex_xpc_create_connection(*(dispatch_queue_t *)(a1 + 32));
  v2 = (void *)collation_xpc_get_connection_conn;
  collation_xpc_get_connection_conn = (uint64_t)connection;

}

id collation_xpc_endpoint_request(unsigned int a1)
{
  uint64_t v1;
  xpc_object_t empty;

  v1 = a1;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "SUBSYSTEM", "COLLATION");
  xpc_dictionary_set_uint64(empty, "user", v1);
  return empty;
}

id collation_interface_request_endpoint_for_user(unsigned int a1)
{
  _xpc_connection_s *v2;
  void *v3;
  xpc_object_t v4;
  void *v5;

  collation_xpc_get_connection();
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  collation_xpc_endpoint_request(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
  xpc_dictionary_get_value(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t _cryptex_actor_alloc()
{
  uint64_t result;
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  result = _os_object_alloc();
  if (!result)
    _cryptex_actor_alloc_cold_1(&v1, v2);
  return result;
}

_QWORD *cryptex_subsystem_create_actor(uint64_t a1)
{
  return cryptex_actor_create(a1, 0);
}

void sub_211B0A0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_211B0A228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_211B0A3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_211B0AE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef cf)
{
  free(0);
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(a1);
}

void sub_211B0B148(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

uint64_t cryptex_upgrade_interface_acquire_lock()
{
  void *v0;
  uint64_t v1;

  +[UpgradeInterfaceLock getSharedInstance](UpgradeInterfaceLock, "getSharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "acquireLock");
  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

CFErrorRef mount_interface_create_mount_request(_QWORD *a1, int a2, int64_t a3, int a4, int a5, int a6, int a7, void *a8)
{
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  CFErrorRef Error;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  CFErrorRef v31;
  void *v33;
  NSObject *v34;

  v15 = a8;
  v16 = v15;
  if (a2 < 0)
  {
    _mnt_intf_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      _mnt_intf_log();
      v21 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      v19 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v19 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_mount_request", "mount_interface.m", 40, "com.apple.security.cryptex", 2, 0, v19);
    goto LABEL_31;
  }
  if (a5 < 0)
  {
    _mnt_intf_log();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      _mnt_intf_log();
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v19 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v19 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_mount_request", "mount_interface.m", 46, "com.apple.security.cryptex", 2, 0, v19);
    goto LABEL_31;
  }
  if (a6 < 0)
  {
    _mnt_intf_log();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      _mnt_intf_log();
      v25 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      v19 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v19 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_mount_request", "mount_interface.m", 52, "com.apple.security.cryptex", 2, 0, v19);
    goto LABEL_31;
  }
  if (a7 < 0)
  {
    _mnt_intf_log();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      _mnt_intf_log();
      v28 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      v19 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v19 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_mount_request", "mount_interface.m", 58, "com.apple.security.cryptex", 2, 0, v19);
    goto LABEL_31;
  }
  if (MEMORY[0x212BE6E54](v15) != MEMORY[0x24BDACFA0])
  {
    _mnt_intf_log();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      _mnt_intf_log();
      v18 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      v19 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v19 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_mount_request", "mount_interface.m", 64, "com.apple.security.cryptex", 2, 0, v19);
LABEL_31:
    v31 = Error;
    free(v19);
    v30 = 0;
    goto LABEL_32;
  }
  mount_interface_create_request("REQ:MOUNT");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    _mnt_intf_log();
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      _mnt_intf_log();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      v19 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v19 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_mount_request", "mount_interface.m", 71, "com.apple.security.cryptex", 2, 0, v19);
    goto LABEL_31;
  }
  v30 = v29;
  if ((a4 & 0x80000000) == 0)
    xpc_dictionary_set_fd(v29, "MOUNT:VOLHASH_FD", a4);
  xpc_dictionary_set_fd(v30, "MOUNT:DMG_FD", a2);
  xpc_dictionary_set_fd(v30, "MOUNT:LTRS_FD", a5);
  xpc_dictionary_set_fd(v30, "MOUNT:INFO_FD", a6);
  xpc_dictionary_set_fd(v30, "MOUNT:IM4M_FD", a7);
  xpc_dictionary_set_value(v30, "MOUNT:CX1_PROPERTIES", v16);
  xpc_dictionary_set_int64(v30, "MOUNT:DMG_ASSET_IDX_INT64", a3);
  if (a1)
  {
    v30 = objc_retainAutorelease(v30);
    v31 = 0;
    *a1 = v30;
  }
  else
  {
    v31 = 0;
  }
LABEL_32:

  return v31;
}

void sub_211B0BA80(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

id _mnt_intf_log()
{
  if (_mnt_intf_log_onceToken != -1)
    dispatch_once(&_mnt_intf_log_onceToken, &__block_literal_global_4);
  return (id)_mnt_intf_log_osl;
}

id mount_interface_create_request(const char *a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "SUBSYSTEM", "MOUNT");
  xpc_dictionary_set_string(v2, "MOUNT_SUB_REQ", a1);
  return v2;
}

CFErrorRef mount_interface_create_unmount_request(_QWORD *a1, int a2, BOOL a3)
{
  void *v6;
  id v7;
  CFErrorRef v8;
  void *v9;
  NSObject *v10;
  char *v11;
  void *v12;
  NSObject *v13;
  CFErrorRef Error;

  if (a2 < 0)
  {
    _mnt_intf_log();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _mnt_intf_log();
      v10 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      v11 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_unmount_request", "mount_interface.m", 105, "com.apple.security.cryptex", 2, 0, v11);
    goto LABEL_14;
  }
  mount_interface_create_request("REQ:UNMOUNT");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _mnt_intf_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      _mnt_intf_log();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      v11 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("mount_interface_create_unmount_request", "mount_interface.m", 112, "com.apple.security.cryptex", 2, 0, v11);
LABEL_14:
    v8 = Error;
    free(v11);
    v7 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  xpc_dictionary_set_fd(v6, "UNMOUNT:INFO_FD", a2);
  xpc_dictionary_set_BOOL(v7, "UNMOUNT:FORCE", a3);
  if (a1)
  {
    v7 = objc_retainAutorelease(v7);
    v8 = 0;
    *a1 = v7;
  }
  else
  {
    v8 = 0;
  }
LABEL_15:

  return v8;
}

void sub_211B0BDD0(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void ___mnt_intf_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libcryptex", "mount_interface");
  v1 = (void *)_mnt_intf_log_osl;
  _mnt_intf_log_osl = (uint64_t)v0;

}

void session_activate_pack(xpc_object_t *a1, uint64_t a2)
{
  _rpc_pack_array(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t session_activate_unpack(uint64_t a1, void **a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_dictionary(*(void **)(a1 + 304), &v3, a2);
}

void session_activate_reply_pack(xpc_object_t *a1, uint64_t a2)
{
  _rpc_pack_array(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t session_activate_reply_unpack(uint64_t a1, void **a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_dictionary(*(void **)(a1 + 304), &v3, a2);
}

uint64_t session_list_unpack()
{
  return 0;
}

void session_list_reply_pack(xpc_object_t *a1, uint64_t a2)
{
  _rpc_pack_array(*(xpc_object_t *)(a2 + 304), 0xFFFFFFFFFFFFFFFFLL, *a1);
}

uint64_t session_list_reply_unpack(uint64_t a1, void **a2)
{
  size_t v3;

  v3 = 0;
  return _rpc_unpack_array(*(void **)(a1 + 304), &v3, a2);
}

CFErrorRef cryptex_upgrade_interface_abort()
{
  id v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  _xpc_connection_s *v5;
  xpc_object_t empty;
  xpc_object_t v7;
  void *v8;
  CFErrorRef v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  CFErrorRef Error;
  void *v18;
  NSObject *v19;
  char *v20;
  __int128 block;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (cryptex_upgrade_interface_abort_xpc_get_queue_once_q_token != -1)
    dispatch_once(&cryptex_upgrade_interface_abort_xpc_get_queue_once_q_token, &__block_literal_global_5);
  v0 = (id)cryptex_upgrade_interface_abort_xpc_get_queue_local;
  *(_QWORD *)&block = MEMORY[0x24BDAC760];
  *((_QWORD *)&block + 1) = 3221225472;
  v23 = __cryptex_upgrade_interface_abort_xpc_get_connection_block_invoke;
  v24 = &unk_24CCF59D8;
  v25 = v0;
  v1 = cryptex_upgrade_interface_abort_xpc_get_connection_once_con_token;
  v2 = v0;
  v3 = v2;
  if (v1 == -1)
  {
    v4 = v2;
  }
  else
  {
    dispatch_once(&cryptex_upgrade_interface_abort_xpc_get_connection_once_con_token, &block);
    v4 = v25;
  }
  v5 = (_xpc_connection_s *)(id)cryptex_upgrade_interface_abort_xpc_get_connection_conn;

  if (!v5)
  {
    cryptex_upgrade_abort_osl();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      cryptex_upgrade_abort_osl();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      LOWORD(block) = 0;
      v12 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(block) = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_upgrade_interface_abort", "upgrade_abort_interface.m", 64, "com.apple.security.cryptex", 23, 0, v12);
    goto LABEL_22;
  }
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "SUBSYSTEM", "UPGRADE_ABORT");
  if (!empty)
  {
    cryptex_upgrade_abort_osl();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      cryptex_upgrade_abort_osl();
      v14 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      LOWORD(block) = 0;
      v12 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(block) = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("cryptex_upgrade_interface_abort", "upgrade_abort_interface.m", 73, "com.apple.security.cryptex", 24, 0, v12);
LABEL_22:
    v9 = Error;
    v8 = 0;
    empty = 0;
LABEL_23:
    free(v12);
    goto LABEL_24;
  }
  v7 = xpc_connection_send_message_with_reply_sync(v5, empty);
  if (!v7)
  {
    cryptex_upgrade_abort_osl();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      cryptex_upgrade_abort_osl();
      v16 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      LOWORD(block) = 0;
      v12 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LOWORD(block) = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
    }
    v9 = createError("cryptex_upgrade_interface_abort", "upgrade_abort_interface.m", 82, "com.apple.security.cryptex", 16, 0, v12);
    v8 = 0;
    goto LABEL_23;
  }
  v8 = v7;
  if (MEMORY[0x212BE6E54]() == MEMORY[0x24BDACFB8])
  {
    v12 = (char *)MEMORY[0x212BE6D7C](v8);
    cryptex_upgrade_abort_osl();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      cryptex_upgrade_abort_osl();
      v19 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      LODWORD(block) = 136446210;
      *(_QWORD *)((char *)&block + 4) = v12;
      v20 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      LODWORD(block) = 136446210;
      *(_QWORD *)((char *)&block + 4) = v12;
      v20 = (char *)_os_log_send_and_compose_impl();
    }
    v9 = createError("cryptex_upgrade_interface_abort", "upgrade_abort_interface.m", 90, "com.apple.security.cryptex", 16, 0, v20);
    free(v20);
    goto LABEL_23;
  }
  v9 = 0;
LABEL_24:

  return v9;
}

void sub_211B0C460(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  free(v2);
  free(v1);
  _Unwind_Resume(a1);
}

id cryptex_upgrade_abort_osl()
{
  if (cryptex_upgrade_abort_osl_onceToken != -1)
    dispatch_once(&cryptex_upgrade_abort_osl_onceToken, &__block_literal_global_4);
  return (id)cryptex_upgrade_abort_osl_trampoline_log;
}

void __cryptex_upgrade_interface_abort_xpc_get_connection_block_invoke(uint64_t a1)
{
  _xpc_connection_s *connection;
  void *v2;

  connection = cryptex_xpc_create_connection(*(dispatch_queue_t *)(a1 + 32));
  v2 = (void *)cryptex_upgrade_interface_abort_xpc_get_connection_conn;
  cryptex_upgrade_interface_abort_xpc_get_connection_conn = (uint64_t)connection;

}

void __cryptex_upgrade_interface_abort_xpc_get_queue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.security.libcryptex.interface.upgrade_abort", 0);
  v1 = (void *)cryptex_upgrade_interface_abort_xpc_get_queue_local;
  cryptex_upgrade_interface_abort_xpc_get_queue_local = (uint64_t)v0;

}

void __cryptex_upgrade_abort_osl_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libcryptex", "upgrade_trampoline");
  v1 = (void *)cryptex_upgrade_abort_osl_trampoline_log;
  cryptex_upgrade_abort_osl_trampoline_log = (uint64_t)v0;

}

_QWORD *_rpc_target_init_u64(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *result = a2;
  result[1] = a3;
  result[2] = 0;
  result[3] = a4;
  return result;
}

size_t _rpc_target_init_cstr(uint64_t a1, uint64_t a2, uint64_t a3, char *__source)
{
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = 1;
  return strlcpy((char *)(a1 + 24), __source, 0xFFuLL);
}

uint64_t _rpc_target_init_port(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = 2;
  result = mach_right_send_retain();
  *(_DWORD *)(a1 + 24) = result;
  return result;
}

void rpc_init_remote(uint64_t a1, xpc_object_t a2, void *a3)
{
  xpc_object_t v6;
  uint64_t v7;
  void *v8;

  v6 = xpc_array_create(0, 0);
  if (a2)
    xpc_retain(a2);
  else
    a2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(a2, "argv", v6);
  xpc_dictionary_set_uint64(a2, "subsystem", *(_QWORD *)(a1 + 16));
  xpc_dictionary_set_uint64(a2, "routine", *(_QWORD *)(a1 + 24));
  xpc_dictionary_set_uint64(a2, "target-type", *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 32);
  switch(v7)
  {
    case 2:
      xpc_dictionary_set_mach_send();
      break;
    case 1:
      xpc_dictionary_set_string(a2, "target", (const char *)(a1 + 40));
      break;
    case 0:
      xpc_dictionary_set_uint64(a2, "target", *(_QWORD *)(a1 + 40));
      break;
  }
  *(_QWORD *)a1 = 1;
  if (a3)
    v8 = os_retain(a3);
  else
    v8 = (void *)MEMORY[0x24BDACB70];
  *(_QWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 296) = a2;
  *(_QWORD *)(a1 + 304) = v6;
  *(_DWORD *)(a1 + 312) = -1;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  if (v6)
    os_release(v6);
}

CFErrorRef rpc_init_local(uint64_t a1, xpc_object_t xdict, NSObject *a3)
{
  xpc_object_t value;
  xpc_object_t v7;
  char *v8;
  const char *v9;
  int v10;
  CFIndex v11;
  CFTypeRef v12;
  CFErrorRef Error;
  xpc_object_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19;
  void *v20;
  xpc_object_t v21;
  void *v22;
  xpc_object_t v23;
  uint64_t v24;
  const char *string_ptr;
  void *v26;
  _OWORD v27[2];
  CFTypeRef cf;
  int v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  memset(v27, 0, sizeof(v27));
  value = xpc_dictionary_get_value(xdict, "argv");
  if (!value || (v7 = value, MEMORY[0x212BE6E54]() != MEMORY[0x24BDACF78]))
  {
    if (a3)
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    v29 = 67109120;
    v30 = 94;
    v8 = (char *)_os_log_send_and_compose_impl();
    v9 = "com.apple.security.cryptex.posix";
    v10 = 105;
LABEL_6:
    v11 = 94;
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v15 = xpc_dictionary_get_value(xdict, "subsystem");
  if (!v15 || (v16 = v15, v17 = MEMORY[0x212BE6E54](), v18 = MEMORY[0x24BDACFF8], v17 != MEMORY[0x24BDACFF8]))
  {
    if (a3)
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    v29 = 67109120;
    v30 = 94;
    v8 = (char *)_os_log_send_and_compose_impl();
    v9 = "com.apple.security.cryptex.posix";
    v10 = 113;
    goto LABEL_6;
  }
  v19 = xpc_dictionary_get_value(xdict, "routine");
  if (!v19 || (v20 = v19, MEMORY[0x212BE6E54]() != v18))
  {
    if (a3)
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    v29 = 67109120;
    v30 = 94;
    v8 = (char *)_os_log_send_and_compose_impl();
    v9 = "com.apple.security.cryptex.posix";
    v10 = 121;
    goto LABEL_6;
  }
  v21 = xpc_dictionary_get_value(xdict, "target-type");
  if (!v21 || (v22 = v21, MEMORY[0x212BE6E54]() != v18))
  {
    if (a3)
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    v29 = 67109120;
    v30 = 94;
    v8 = (char *)_os_log_send_and_compose_impl();
    v9 = "com.apple.security.cryptex.posix";
    v10 = 129;
    goto LABEL_6;
  }
  v23 = xpc_dictionary_get_value(xdict, "target");
  v24 = xpc_uint64_get_value(v22);
  if (v24 == 2)
  {
    if (MEMORY[0x212BE6E54](v23) != MEMORY[0x24BDACFD8])
    {
      if (a3)
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      v29 = 67109120;
      v30 = 22;
      v8 = (char *)_os_log_send_and_compose_impl();
      v9 = "com.apple.security.cryptex.posix";
      v10 = 167;
      goto LABEL_60;
    }
    *(_DWORD *)(a1 + 40) = xpc_mach_send_copy_right();
  }
  else if (v24 == 1)
  {
    if (MEMORY[0x212BE6E54](v23) != MEMORY[0x24BDACFF0])
    {
      if (a3)
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      v29 = 67109120;
      v30 = 22;
      v8 = (char *)_os_log_send_and_compose_impl();
      v9 = "com.apple.security.cryptex.posix";
      v10 = 148;
      goto LABEL_60;
    }
    if (xpc_string_get_length(v23) >= 0xFF)
    {
      if (a3)
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      v29 = 67109120;
      v30 = 22;
      v8 = (char *)_os_log_send_and_compose_impl();
      v9 = "com.apple.security.cryptex.posix";
      v10 = 156;
      goto LABEL_60;
    }
    string_ptr = xpc_string_get_string_ptr(v23);
    strlcpy((char *)(a1 + 40), string_ptr, 0xFFuLL);
  }
  else
  {
    if (v24)
    {
      if (a3)
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      v29 = 67109120;
      v30 = 22;
      v8 = (char *)_os_log_send_and_compose_impl();
      v9 = "com.apple.security.cryptex.posix";
      v10 = 175;
      goto LABEL_60;
    }
    if (MEMORY[0x212BE6E54](v23) != v18)
    {
      if (a3)
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      v29 = 67109120;
      v30 = 22;
      v8 = (char *)_os_log_send_and_compose_impl();
      v9 = "com.apple.security.cryptex.posix";
      v10 = 139;
LABEL_60:
      v11 = 22;
      goto LABEL_7;
    }
    *(_QWORD *)(a1 + 40) = xpc_uint64_get_value(v23);
  }
  if (_xpc_dictionary_try_get_cferr(xdict, "cferror", (CFErrorRef *)&cf))
  {
    *(_QWORD *)a1 = 1;
    if (a3)
      v26 = os_retain(a3);
    else
      v26 = (void *)MEMORY[0x24BDACB70];
    *(_QWORD *)(a1 + 8) = v26;
    *(_QWORD *)(a1 + 16) = xpc_uint64_get_value(v16);
    *(_QWORD *)(a1 + 24) = xpc_uint64_get_value(v20);
    *(_QWORD *)(a1 + 32) = xpc_uint64_get_value(v22);
    *(_QWORD *)(a1 + 296) = xpc_retain(xdict);
    *(_QWORD *)(a1 + 304) = v7;
    xpc_dictionary_get_audit_token();
    rpc_cred_init_with_audit_token((uid_t *)(a1 + 328), v27);
    Error = 0;
    goto LABEL_9;
  }
  if (a3)
    os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
  LOWORD(v29) = 0;
  v8 = (char *)_os_log_send_and_compose_impl();
  v12 = cf;
  v9 = "com.apple.security.cryptex";
  v10 = 181;
  v11 = 16;
LABEL_8:
  Error = createError("rpc_init_local", "rpc.c", v10, v9, v11, v12, v8);
  free(v8);
LABEL_9:
  if (cf)
    CFRelease(cf);
  return Error;
}

uint64_t rpc_cred_init_with_audit_token(uid_t *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t result;
  audit_token_t v13;

  v4 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v4;
  *a1 = audit_token_to_auid(&v13);
  v5 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v5;
  a1[1] = audit_token_to_euid(&v13);
  v6 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v6;
  a1[2] = audit_token_to_egid(&v13);
  v7 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v7;
  a1[3] = audit_token_to_ruid(&v13);
  v8 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v8;
  a1[4] = audit_token_to_rgid(&v13);
  v9 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v9;
  a1[5] = audit_token_to_pid(&v13);
  v10 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v10;
  a1[6] = audit_token_to_asid(&v13);
  v11 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v11;
  result = audit_token_to_pidversion(&v13);
  a1[7] = result;
  return result;
}

CFErrorRef rpc_call(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  CFErrorRef Error;
  int v15;
  NSObject *v16;
  char *v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(*(os_log_t *)(a2 + 8), OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)MEMORY[0x212BE6D7C](*(_QWORD *)(a2 + 296));
    v6 = *__error();
    v7 = *(NSObject **)(a2 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v20 = v5;
      _os_log_impl(&dword_211B06000, v7, OS_LOG_TYPE_DEBUG, "sending request: %s", buf, 0xCu);
    }
    *__error() = v6;
    free(v5);
  }
  v8 = xpc_pipe_routine();
  v9 = *(NSObject **)(a2 + 8);
  if (v8)
  {
    v10 = v8;
    if (v9)
    {
      os_log_type_enabled(*(os_log_t *)(a2 + 8), OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v10;
    }
    else
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v8;
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    Error = createError("rpc_call", "rpc.c", 332, "com.apple.security.cryptex.posix", v10, 0, v17);
    free(v17);
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a2 + 8), OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)MEMORY[0x212BE6D7C](0);
      v12 = *__error();
      v13 = *(NSObject **)(a2 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v20 = v11;
        _os_log_impl(&dword_211B06000, v13, OS_LOG_TYPE_DEBUG, "got reply: %s", buf, 0xCu);
      }
      *__error() = v12;
      free(v11);
      v9 = *(NSObject **)(a2 + 8);
    }
    Error = rpc_init_local(a3, 0, v9);
    if (!Error)
    {
      v15 = *__error();
      v16 = *(NSObject **)(a2 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211B06000, v16, OS_LOG_TYPE_DEBUG, "routine succeeded", buf, 2u);
      }
      Error = 0;
      *__error() = v15;
    }
  }
  return Error;
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
      _os_log_impl(&dword_211B06000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", buf, 0x20u);
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
      _os_log_impl(&dword_211B06000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", buf, 0x16u);
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

void _rpc_pack_fd(void *a1, size_t a2, int fd)
{
  xpc_object_t v5;
  void *v6;
  xpc_object_t v7;

  v5 = xpc_fd_create(fd);
  if (v5)
  {
    v6 = v5;
    xpc_array_set_value(a1, a2, v5);
    os_release(v6);
  }
  else
  {
    v7 = xpc_null_create();
    xpc_array_set_value(a1, a2, v7);
    if (v7)
      os_release(v7);
  }
}

uint64_t _rpc_unpack_expected(void *a1, size_t a2, uint64_t a3, _QWORD *a4)
{
  xpc_object_t value;
  uint64_t result;

  if (xpc_array_get_count(a1) <= a2)
    return 34;
  value = xpc_array_get_value(a1, a2);
  if (MEMORY[0x212BE6E54]() == MEMORY[0x24BDACFE0])
    return 2;
  if (MEMORY[0x212BE6E54](value) != a3)
    return 79;
  result = 0;
  *a4 = value;
  return result;
}

uint64_t _rpc_unpack_int64(void *a1, size_t *a2, int64_t *a3)
{
  size_t v5;
  uint64_t v6;
  xpc_object_t xint;

  xint = 0;
  v5 = *a2;
  v6 = _rpc_unpack_expected(a1, *a2, MEMORY[0x24BDACFD0], &xint);
  if (!(_DWORD)v6)
  {
    *a3 = xpc_int64_get_value(xint);
    *a2 = v5 + 1;
  }
  return v6;
}

uint64_t _rpc_unpack_uint64(void *a1, size_t *a2, uint64_t *a3)
{
  size_t v5;
  uint64_t v6;
  xpc_object_t xuint;

  xuint = 0;
  v5 = *a2;
  v6 = _rpc_unpack_expected(a1, *a2, MEMORY[0x24BDACFF8], &xuint);
  if (!(_DWORD)v6)
  {
    *a3 = xpc_uint64_get_value(xuint);
    *a2 = v5 + 1;
  }
  return v6;
}

uint64_t _rpc_unpack_string(void *a1, size_t *a2, const char **a3)
{
  size_t v5;
  uint64_t v6;
  xpc_object_t xstring;

  xstring = 0;
  v5 = *a2;
  v6 = _rpc_unpack_expected(a1, *a2, MEMORY[0x24BDACFF0], &xstring);
  if (!(_DWORD)v6)
  {
    *a3 = xpc_string_get_string_ptr(xstring);
    *a2 = v5 + 1;
  }
  return v6;
}

uint64_t _rpc_unpack_string_copy(void *a1, size_t *a2, char **a3)
{
  uint64_t result;
  char *v5;
  char *v6;
  char *__s1;

  __s1 = 0;
  result = _rpc_unpack_string(a1, a2, (const char **)&__s1);
  if (!(_DWORD)result)
  {
    v5 = strdup(__s1);
    if (v5)
    {
      v6 = v5;
      result = 0;
      *a3 = v6;
    }
    else
    {
      return *__error();
    }
  }
  return result;
}

uint64_t _rpc_unpack_array(void *a1, size_t *a2, void **a3)
{
  size_t v5;
  uint64_t v6;
  void *object;

  object = 0;
  v5 = *a2;
  v6 = _rpc_unpack_expected(a1, *a2, MEMORY[0x24BDACF78], &object);
  if (!(_DWORD)v6)
  {
    *a3 = os_retain(object);
    *a2 = v5 + 1;
  }
  return v6;
}

uint64_t _rpc_unpack_dictionary(void *a1, size_t *a2, void **a3)
{
  size_t v5;
  uint64_t v6;
  void *object;

  object = 0;
  v5 = *a2;
  v6 = _rpc_unpack_expected(a1, *a2, MEMORY[0x24BDACFA0], &object);
  if (!(_DWORD)v6)
  {
    *a3 = os_retain(object);
    *a2 = v5 + 1;
  }
  return v6;
}

uint64_t _rpc_unpack_fd(void *a1, size_t *a2, int *a3)
{
  size_t v5;
  uint64_t v6;
  xpc_object_t xfd;

  xfd = 0;
  v5 = *a2;
  v6 = _rpc_unpack_expected(a1, *a2, MEMORY[0x24BDACFC0], &xfd);
  if (!(_DWORD)v6)
  {
    *a3 = xpc_fd_dup(xfd);
    *a2 = v5 + 1;
  }
  return v6;
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
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
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
  if ((const _xpc_type_s *)MEMORY[0x212BE6E54]() != a3)
  {
    v5 = *__error();
    if (_xpc_log_onceToken != -1)
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
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
    _os_log_impl(&dword_211B06000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, v9);
LABEL_12:
    v11 = __error();
    result = 0;
    *v11 = v5;
    return result;
  }
  return 1;
}

xpc_object_t _xpc_create_request(const char *a1, void *a2)
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "routine", a1);
  xpc_dictionary_set_value(empty, "argv", a2);
  return empty;
}

uint64_t _xpc_dictionary_try_get_cferr(void *a1, const char *a2, CFErrorRef *a3)
{
  xpc_object_t value;
  void *v5;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (MEMORY[0x212BE6E54]() == MEMORY[0x24BDACFA0])
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
          dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
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
                dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
              v27 = _xpc_log_osl;
              if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v31 = 12;
                _os_log_impl(&dword_211B06000, v27, OS_LOG_TYPE_ERROR, "Failed to create CFError.: %{darwin.errno}d", buf, 8u);
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
              dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
            v25 = _xpc_log_osl;
            if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              v31 = 12;
              _os_log_impl(&dword_211B06000, v25, OS_LOG_TYPE_ERROR, "Failed to create mutable dictionary.: %{darwin.errno}d", buf, 8u);
            }
            *__error() = v24;
            v16 = 12;
          }
          CFRelease(v18);
          goto LABEL_45;
        }
        v11 = *__error();
        if (_xpc_log_onceToken != -1)
          dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
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
      _os_log_impl(&dword_211B06000, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
      goto LABEL_31;
    }
    v22 = *__error();
    if (_xpc_log_onceToken != -1)
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
    v23 = _xpc_log_osl;
    if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 12;
      _os_log_impl(&dword_211B06000, v23, OS_LOG_TYPE_ERROR, "Failed to create string.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v22;
    v16 = 12;
  }
  else
  {
    v14 = *__error();
    if (_xpc_log_onceToken != -1)
      dispatch_once(&_xpc_log_onceToken, &__block_literal_global_6);
    v15 = _xpc_log_osl;
    if (os_log_type_enabled((os_log_t)_xpc_log_osl, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 22;
      _os_log_impl(&dword_211B06000, v15, OS_LOG_TYPE_ERROR, "CFError XPC dictionary is missing user info.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v14;
    v16 = 22;
  }
LABEL_46:
  if (value)
    CFRelease(value);
  return v16;
}

uint64_t _xpc_request_get_argv(void *a1, _QWORD *a2)
{
  xpc_object_t dictionary;
  uint64_t result;

  if (!_xpc_dictionary_key_with_type_exists(a1, "argv", MEMORY[0x24BDACFA0]))
    return 22;
  dictionary = xpc_dictionary_get_dictionary(a1, "argv");
  result = 0;
  *a2 = dictionary;
  return result;
}

os_log_t ___xpc_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.libcryptex", "xpc");
  _xpc_log_osl = (uint64_t)result;
  return result;
}

void __cryptex_xpc_create_connection_block_invoke_cold_1()
{
  _os_crash();
  __break(1u);
}

void _CFDictionaryCreateMutableForCFTypes_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

void _cryptex_actor_alloc_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;
  const __CFAllocator *v3;
  CFIndex v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  v3 = (const __CFAllocator *)_os_crash_msg();
  __break(1u);
  CFDictionaryCreateMutable(v3, v4, v5, v6);
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

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8D0](atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8E0](atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8E8](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F0](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA900](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA908](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA910](atoken);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x24BDAD2E8]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB0](queue);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_right_send_retain()
{
  return MEMORY[0x24BDAEC48]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
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

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x24BDB06B8](xarray, index, value);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x24BDB06C8](xarray, index, value);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x24BDB0900]();
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

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x24BDB09B8]();
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

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x24BDB0A40](*(_QWORD *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x24BDB0A48](xfd);
}

uint64_t xpc_file_transfer_create_with_fd()
{
  return MEMORY[0x24BDB0A50]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x24BDB0A90]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

uint64_t xpc_pipe_create_from_port()
{
  return MEMORY[0x24BDB0AC8]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x24BDB0AD8]();
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x24BDB0BA0](xstring);
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


int64_t _xpc_interface_routine(uint64_t a1, xpc_object_t xdict, xpc_object_t *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  int64_t int64;
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t uint64;
  uint64_t v18;
  int v19;
  uint64_t self_audit_token;
  int v21;
  int v22;
  xpc_object_t xdicta;
  __int128 v24;
  __int128 v25;

  v10 = MEMORY[0x24BDACB38];
  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 16) == -1)
    v11 = *(_QWORD *)(MEMORY[0x24BDACB38] + 24);
  else
    v11 = _os_alloc_once();
  if (*(_BYTE *)v11 || *(_BYTE *)(v11 + 4))
    return 141;
  xdicta = 0;
  if (!*(_BYTE *)(v11 + 41))
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  v14 = 2;
  if (!*(_BYTE *)(v11 + 88))
    v14 = 6;
  int64 = MEMORY[0x212BED7C0](*(_QWORD *)(v11 + 24), a1, xdict, &xdicta, v14 | a5);
  if (xdicta && xpc_dictionary_get_string(xdicta, "xpc-fault"))
    _XPC_MISUSE_FAULT();
  v15 = xdicta;
  if ((_DWORD)int64 || (int64 = xpc_dictionary_get_int64(xdicta, "error"), v15 = xdicta, (_DWORD)int64))
  {
    if (v15)
      xpc_release(v15);
  }
  else
  {
    if (*(_QWORD *)(v10 + 16) == -1)
      v16 = *(_QWORD *)(v10 + 24);
    else
      v16 = _os_alloc_once();
    if (!*(_BYTE *)(v16 + 88))
    {
      v24 = 0u;
      v25 = 0u;
      xpc_dictionary_get_audit_token();
      if (DWORD1(v25) != 1)
        _xpc_interface_routine_cold_6(SDWORD1(v25));
      if (DWORD1(v24))
        _xpc_interface_routine_cold_5();
      if (a4)
      {
        uint64 = xpc_dictionary_get_uint64(v15, "req_pid");
        v18 = xpc_dictionary_get_uint64(v15, "rec_execcnt");
        if (uint64 >> 31 || (v19 = v18, v18 >> 31))
          _xpc_interface_routine_cold_1();
        self_audit_token = _xpc_get_self_audit_token();
        v21 = *(_DWORD *)(self_audit_token + 20);
        if (!v21 || (v22 = *(_DWORD *)(self_audit_token + 28)) == 0)
          _xpc_interface_routine_cold_2();
        if (v21 != (_DWORD)uint64)
          _xpc_interface_routine_cold_4();
        if (v22 != v19)
          _xpc_interface_routine_cold_3();
      }
    }
    int64 = 0;
    *a3 = xdicta;
  }
  return int64;
}

uint64_t _xpc_interface_routine_async(int a1, xpc_object_t xdict)
{
  _BYTE *v3;

  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 16) == -1)
    v3 = *(_BYTE **)(MEMORY[0x24BDACB38] + 24);
  else
    v3 = (_BYTE *)_os_alloc_once();
  if (!*v3 && !v3[4])
  {
    if (!v3[41])
      xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
    JUMPOUT(0x212BED7CCLL);
  }
  return 141;
}

int64_t _xpc_service_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _xpc_domain_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _launch_job_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _launch_job_query_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _launch_server_test_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

uint64_t _XPC_MISUSE_FAULT()
{
  int v0;
  char **v1;
  char **v2;
  uint64_t v3;
  char **v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if ((_dyld_get_image_uuid() & 1) == 0)
  {
    v6 = 0;
    v7 = 0;
  }
  if ((_dyld_get_shared_cache_uuid() & 1) != 0)
  {
    _dyld_get_shared_cache_range();
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  _os_log_simple();
  bzero(&v6, 0x400uLL);
  v0 = backtrace(&v6, 128);
  v1 = backtrace_symbols(&v6, v0);
  if (v1)
  {
    v2 = v1;
    if (v0 >= 1)
    {
      v3 = v0;
      v4 = v1;
      do
      {
        if (!*v4)
          break;
        v8 = 0;
        v9 = 0;
        if ((_dyld_get_image_uuid() & 1) == 0)
        {
          v8 = 0;
          v9 = 0;
        }
        if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          _dyld_get_shared_cache_range();
        ++v4;
        _os_log_simple();
        --v3;
      }
      while (v3);
    }
    free(v2);
  }
  result = os_fault_with_payload();
  if ((_DWORD)result)
  {
    v8 = 0;
    v9 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      v8 = 0;
      v9 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      _dyld_get_shared_cache_range();
    __error();
    __error();
    xpc_strerror();
    return _os_log_simple();
  }
  return result;
}

const char *_xpc_get_embedded_crash_message(void)
{
  return (const char *)qword_254B508B8;
}

uint64_t _der_vm_context_to_xpc(__int128 *a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v2 = a1[1];
  v5 = *a1;
  v6 = v2;
  v7 = a1[2];
  v8 = *((_QWORD *)a1 + 6);
  if (!der_vm_context_is_valid())
    return 0;
  v3 = a1[1];
  v5 = *a1;
  v6 = v3;
  v7 = a1[2];
  v8 = *((_QWORD *)a1 + 6);
  return _objectForActiveContext((uint64_t *)&v5);
}

uint64_t _objectForActiveContext(uint64_t *a1)
{
  uint64_t v1;
  xpc_object_t empty;
  uint64_t v3;
  int64_t v4;
  uint64_t no_copy;
  char v6;
  const void *v7;
  size_t v8;
  uint64_t result;
  uint64_t v10;

  v1 = *a1;
  switch(der_vm_CEType_from_context())
  {
    case 1u:
      empty = xpc_dictionary_create_empty();
      goto LABEL_4;
    case 2u:
      empty = xpc_array_create_empty();
LABEL_4:
      v3 = (uint64_t)empty;
      der_vm_iterate();
      goto LABEL_10;
    case 3u:
      v4 = der_vm_integer_from_context();
      no_copy = (uint64_t)xpc_int64_create(v4);
      goto LABEL_9;
    case 4u:
      string_for_context();
      no_copy = xpc_string_create_no_copy();
      goto LABEL_9;
    case 5u:
      v6 = der_vm_BOOL_from_context();
      no_copy = (uint64_t)xpc_BOOL_create(v6);
      goto LABEL_9;
    case 6u:
      v7 = (const void *)der_vm_data_from_context();
      no_copy = (uint64_t)xpc_data_create(v7, v8);
LABEL_9:
      v3 = no_copy;
LABEL_10:
      result = v3;
      break;
    default:
      v10 = (*(uint64_t (**)(uint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "_objectForActiveContext", "CoreEntitlements: unknown DER type");
      result = xpc_create_from_ce_der(v10);
      break;
  }
  return result;
}

uint64_t xpc_create_from_ce_der()
{
  uint64_t v0;
  uint64_t result;
  _QWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v11 = 0uLL;
  v12 = 0;
  v0 = CEValidate();
  result = 0;
  v2 = (_QWORD *)MEMORY[0x24BED3CF0];
  if (v0 == *MEMORY[0x24BED3CF0])
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = v11;
    *(_QWORD *)&v4 = v12;
    if (CEAcquireUnmanagedContext() == *v2)
    {
      v3 = v7;
      v4 = v8;
      v5 = v9;
      v6 = v10;
      return _der_vm_context_to_xpc(&v3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t xpc_create_from_ce_der_with_key(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD *v6;
  __int128 v7[3];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  size_t v18;
  __int128 v19;
  size_t v20;
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
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v17 = 0uLL;
  v18 = 0;
  v4 = CEValidate();
  result = 0;
  v6 = (_QWORD *)MEMORY[0x24BED3CF0];
  if (v4 == *MEMORY[0x24BED3CF0])
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v19 = v17;
    v20 = v18;
    if (CEAcquireUnmanagedContext() == *v6)
    {
      v35 = 0;
      v34 = 0u;
      v33 = 0u;
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
      *(_QWORD *)&v19 = 0x4000000000000001;
      *((_QWORD *)&v19 + 1) = a3;
      v20 = strlen(a3);
      v12 = 0;
      v10 = 0u;
      v11 = 0u;
      v9 = 0u;
      der_vm_execute_nocopy();
      memset(v7, 0, sizeof(v7));
      v8 = 0;
      return _der_vm_context_to_xpc(v7);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _manufacturingCallback(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  char *v9;
  xpc_object_t active;
  __int128 v11;
  _OWORD v13[3];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[16];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = *((_DWORD *)a1 + 29);
  if (v3 == 2)
  {
    if (*((_DWORD *)a1 + 28) == 1)
    {
      v7 = (void *)a1[15];
      v18 = 0;
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
      memset((char *)v19 + 8, 0, 248);
      v8 = *(_OWORD *)(a1 + 9);
      v13[0] = *(_OWORD *)(a1 + 7);
      v13[1] = v8;
      v13[2] = *(_OWORD *)(a1 + 11);
      v14 = a1[13];
      der_vm_execute();
      v9 = (char *)string_for_context();
      v19[0] = xmmword_212551A70;
      der_vm_execute();
      active = (xpc_object_t)_objectForActiveContext(v13);
      xpc_dictionary_set_value(v7, v9, active);
      free(v9);
    }
    else
    {
      active = xpc_array_create_empty();
      v11 = *(_OWORD *)(a1 + 9);
      v19[0] = *(_OWORD *)(a1 + 7);
      v19[1] = v11;
      v19[2] = *(_OWORD *)(a1 + 11);
      *(_QWORD *)&v19[3] = a1[13];
      if (der_vm_iterate() != *MEMORY[0x24BED3CF0])
      {
        (*(void (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: Couldn't iterate over DER entitlements\n");
        return (uint64_t)string_for_context();
      }
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, active);
    }
    v6 = active;
    goto LABEL_10;
  }
  if (v3)
  {
    if (*((_DWORD *)a1 + 28) == 2)
    {
      v4 = *(_OWORD *)(a1 + 9);
      v19[0] = *(_OWORD *)(a1 + 7);
      v19[1] = v4;
      v19[2] = *(_OWORD *)(a1 + 11);
      *(_QWORD *)&v19[3] = a1[13];
      v5 = (void *)_objectForActiveContext(v19);
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, v5);
      v6 = v5;
LABEL_10:
      xpc_release(v6);
      return 1;
    }
    (*(void (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: not a sequence");
  }
  else
  {
    (*(void (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: unknown DER type");
  }
  return (uint64_t)string_for_context();
}

void *string_for_context()
{
  const void *v0;
  size_t v1;
  size_t v2;
  void *v3;

  v0 = (const void *)der_vm_string_from_context();
  v2 = v1;
  v3 = _xpc_alloc(v1 + 1);
  memcpy(v3, v0, v2);
  return v3;
}

void *_ce_malloc(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x78220757uLL);
}

void _ce_free(int a1, void *a2)
{
  free(a2);
}

void _ce_log(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(7, a2, &a9);
}

void _ce_abort(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(2, a2, &a9);
  qword_254B508B8 = (uint64_t)"Data corruption: CoreEntitlements has aborted due to an unrecoverable error";
  __break(1u);
}

void *_xpc_alloc(size_t size)
{
  void *v2;

  do
  {
    v2 = malloc_type_calloc(1uLL, size, 0x5C63E6C5uLL);
    if (v2)
      break;
    if (*__error() != 12 && *__error())
      _xpc_alloc_cold_1();
  }
  while (_waiting4memory());
  return v2;
}

int64_t set_enabled_state(const char *a1, int a2)
{
  uint64_t v3;
  void *launchd_request;
  xpc_object_t v5;
  int64_t v6;
  xpc_object_t v8;

  if (a2)
    v3 = 808;
  else
    v3 = 809;
  launchd_request = _create_launchd_request(7);
  v5 = xpc_array_create(0, 0);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, a1);
  xpc_dictionary_set_value(launchd_request, "names", v5);
  v8 = 0;
  v6 = _xpc_domain_routine(v3, launchd_request, &v8);

  return v6;
}

void *_create_launchd_request(int a1)
{
  xpc_object_t v2;
  void *v3;
  uint64_t v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (a1 == 1)
    v4 = 1;
  else
    v4 = 7;
  xpc_dictionary_set_uint64(v2, "type", v4);
  xpc_dictionary_set_uint64(v3, "handle", 0);
  return v3;
}

BOOL get_enabled_state(int a1, const char *a2, _BYTE *a3)
{
  void *launchd_request;
  _BOOL8 v6;
  _BOOL4 v7;
  xpc_object_t xdict;

  launchd_request = _create_launchd_request(a1);
  xpc_dictionary_set_string(launchd_request, "name", a2);
  xdict = 0;
  if (_xpc_domain_routine(811, launchd_request, &xdict))
  {
    _os_assumes_log();
    v6 = 0;
  }
  else
  {
    v6 = xpc_dictionary_get_BOOL(xdict, "loaded");
    v7 = xpc_dictionary_get_BOOL(xdict, "enabled");
    if (v6 && v7)
    {
      v6 = 1;
      *a3 = 1;
    }
    else if (!v6 && !v7)
    {
      v6 = 0;
      *a3 = 1;
    }
  }

  return v6;
}

uint64_t submit_job(void *a1, int a2)
{
  id v3;
  void *v4;
  xpc_object_t v5;
  _launch_data *v6;
  uint64_t errno;

  v3 = a1;
  v4 = v3;
  if (a2)
    xpc_dictionary_set_BOOL(v3, "ForceEnableHack", 1);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v5, "SubmitJob", v4);
  v6 = (_launch_data *)_launch_msg2();
  errno = launch_data_get_errno(v6);
  xpc_release(v6);

  return errno;
}

int64_t remove_job(const char *a1, char a2)
{
  void *v2;
  int64_t v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  xpc_object_t v10;

  _remove_job_create_request(a1, 7, 0, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v3 = _xpc_domain_routine(801, v2, &v10);
  if (!(_DWORD)v3)
  {
    v4 = dispatch_semaphore_create(0);
    v5 = (uint64_t)v10;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __remove_job_block_invoke;
    v8[3] = &unk_24CDD0E30;
    v9 = v4;
    v6 = v4;
    _remove_job_wait_for_completion(v5, v8);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  }
  return v3;
}

id _remove_job_create_request(const char *a1, int a2, uint64_t a3, char a4)
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", a2);
  xpc_dictionary_set_uint64(empty, "handle", a3);
  xpc_dictionary_set_string(empty, "name", a1);
  xpc_dictionary_set_BOOL(empty, "legacy-service-lookup", 1);
  if ((a4 & 1) != 0)
    xpc_dictionary_set_BOOL(empty, "attempt-unload-protected", 1);
  if ((a4 & 2) != 0)
    xpc_dictionary_set_BOOL(empty, "wait", 1);
  return empty;
}

void _remove_job_wait_for_completion(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD);
  unsigned int v3;
  uintptr_t v4;
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  _QWORD handler[4];
  dispatch_source_t v9;
  void (**v10)(_QWORD);

  v2 = a2;
  v3 = xpc_dictionary_copy_mach_send();
  if (v3 - 1 >= 0xFFFFFFFE)
  {
    v2[2](v2);
  }
  else
  {
    v4 = v3;
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_source_create(MEMORY[0x24BDAC9E8], v4, 1uLL, v5);

    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = ___remove_job_wait_for_completion_block_invoke;
    handler[3] = &unk_24CDD0E58;
    v9 = v6;
    v10 = v2;
    v7 = v6;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v7);

  }
}

intptr_t __remove_job_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___remove_job_wait_for_completion_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

uint64_t ___remove_job_wait_for_completion_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = _xpc_mach_port_release(*(_DWORD *)(a1 + 32));
  if ((_DWORD)result)
    return _os_assumes_log();
  return result;
}

char *CFStringJustCopyTheUTF8String(const __CFString *a1)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  CFIndex v4;
  char *v5;

  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v4 = MaximumSizeForEncoding + 1;
  if (__OFADD__(MaximumSizeForEncoding, 1))
    return 0;
  v5 = (char *)_xpc_alloc(MaximumSizeForEncoding + 1);
  if (!CFStringGetCString(a1, v5, v4, 0x8000100u))
    CFStringJustCopyTheUTF8String_cold_1();
  return v5;
}

CFNumberRef CFCreateFromLaunchData(_launch_data *a1)
{
  launch_data_type_t type;
  CFNumberRef result;
  CFMutableDictionaryRef Mutable;
  CFDictionaryRef Copy;
  unint64_t v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  CFDictionaryRef v10;
  uint64_t *v11;
  CFNumberType v12;
  int v13;
  uint64_t v14;
  const char *v15;
  int v16;
  int v17;
  uint64_t v18;

  v16 = 0;
  v17 = -1;
  type = launch_data_get_type(a1);
  result = 0;
  switch(type)
  {
    case LAUNCH_DATA_DICTIONARY:
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      launch_data_dict_iterate(a1, (launch_data_dict_iterator_t)_ldval2cf, Mutable);
      Copy = CFDictionaryCreateCopy(0, Mutable);
      goto LABEL_9;
    case LAUNCH_DATA_ARRAY:
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      if (MEMORY[0x212BED940](a1))
      {
        v6 = 0;
        do
        {
          v7 = MEMORY[0x212BED94C](a1, v6);
          v8 = (const void *)CFCreateFromLaunchData(v7);
          if (v8)
          {
            v9 = v8;
            CFArrayAppendValue(Mutable, v8);
            CFRelease(v9);
          }
          ++v6;
        }
        while (v6 < MEMORY[0x212BED940](a1));
      }
      Copy = CFArrayCreateCopy(0, Mutable);
LABEL_9:
      v10 = Copy;
      CFRelease(Mutable);
      return v10;
    case LAUNCH_DATA_FD:
      v11 = (uint64_t *)&v17;
      goto LABEL_18;
    case LAUNCH_DATA_INTEGER:
      v18 = MEMORY[0x212BED988](a1);
      v11 = &v18;
      v12 = kCFNumberLongLongType;
      goto LABEL_19;
    case LAUNCH_DATA_REAL:
      v18 = MEMORY[0x212BED994](a1);
      v11 = &v18;
      v12 = kCFNumberDoubleType;
      goto LABEL_19;
    case LAUNCH_DATA_BOOL:
      v13 = MEMORY[0x212BED970](a1);
      v14 = MEMORY[0x24BDBD270];
      if (!v13)
        v14 = MEMORY[0x24BDBD268];
      return *(CFNumberRef *)v14;
    case LAUNCH_DATA_STRING:
      v15 = (const char *)MEMORY[0x212BED9A0](a1);
      return (CFNumberRef)CFStringCreateWithCString(0, v15, 0x8000100u);
    case LAUNCH_DATA_MACHPORT:
      v11 = (uint64_t *)&v16;
LABEL_18:
      v12 = kCFNumberIntType;
LABEL_19:
      result = CFNumberCreate(0, v12, v11);
      break;
    default:
      return result;
  }
  return result;
}

CFArrayRef CFArrayCreateFromDictionaryValues(const __CFDictionary *a1)
{
  CFMutableArrayRef Mutable;
  CFArrayRef Copy;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_add_array_value, Mutable);
  Copy = CFArrayCreateCopy(0, Mutable);
  CFRelease(Mutable);
  return Copy;
}

void _add_array_value(int a1, const void *a2, CFMutableArrayRef theArray)
{
  CFArrayAppendValue(theArray, a2);
}

void _ldval2cf(uint64_t a1, const char *a2, __CFDictionary *a3)
{
  CFStringRef v5;
  const void *v6;
  const void *v7;

  v5 = CFStringCreateWithCString(0, a2, 0x8000100u);
  v6 = (const void *)CFCreateFromLaunchData(a1);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a3, v5, v6);
    CFRelease(v7);
  }
  CFRelease(v5);
}

uint64_t _waiting4memory()
{
  sleep(1u);
  return 1;
}

char *_xpc_strdup(const char *a1)
{
  const char *i;
  char *result;

  for (i = a1; ; a1 = i)
  {
    result = strdup(a1);
    if (result)
      break;
    if (*__error() != 12)
    {
      if (*__error())
        _xpc_strdup_cold_1();
    }
    _waiting4memory();
  }
  return result;
}

char *_xpc_asprintf(char *a1, ...)
{
  char *result;
  char *v3;
  va_list va;

  va_start(va, a1);
  v3 = 0;
  while (1)
  {
    vasprintf(&v3, a1, va);
    result = v3;
    if (v3)
      break;
    if (*__error() != 12)
    {
      if (*__error())
        _xpc_strdup_cold_1();
    }
    _waiting4memory();
  }
  return result;
}

BOOL _xpc_has_suffix(const char *a1, const char *a2)
{
  const char *v4;
  const char *v5;

  v4 = &a1[strlen(a1)];
  v5 = &v4[-strlen(a2)];
  return v5 >= a1 && strcmp(v5, a2) == 0;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

uint64_t _xpc_mach_port_release(mach_port_name_t name)
{
  return mach_port_deallocate(*MEMORY[0x24BDAEC58], name);
}

uint64_t _xpc_get_self_audit_token()
{
  uint64_t v0;

  if (*(_QWORD *)(MEMORY[0x24BDACB38] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x24BDACB38] + 24);
  else
    v0 = _os_alloc_once();
  if (*(_BYTE *)(v0 + 41))
  {
    if (*(_QWORD *)(v0 + 48) != -1)
      dispatch_once_f((dispatch_once_t *)(v0 + 48), (void *)(v0 + 56), (dispatch_function_t)_fetch_self_token);
  }
  else
  {
    _fetch_self_token((task_info_t)(v0 + 56));
  }
  return v0 + 56;
}

uint64_t _fetch_self_token(task_info_t task_info_out)
{
  integer_t v2;
  uint64_t result;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x24BDAEC58], 0xFu, task_info_out, &task_info_outCnt))
    _xpc_interface_routine_cold_2();
  v2 = task_info_out[5];
  result = getpid();
  if (v2 != (_DWORD)result || !task_info_out[7])
    _xpc_interface_routine_cold_2();
  return result;
}

void *_xpc_copy_plist(const char *a1)
{
  int *v1;
  int *v2;
  void *v3;
  stat v5;

  v1 = (int *)open(a1, 0);
  if ((_DWORD)v1 == -1)
    return 0;
  v2 = v1;
  memset(&v5, 0, sizeof(v5));
  if (fstat((int)v1, &v5))
    v3 = 0;
  else
    v3 = _copy_plist_from_fd((int)v2, (uint64_t)&v5, 0, 0);
  _xpc_strict_close(v2);
  return v3;
}

void *_copy_plist_from_fd(int a1, uint64_t a2, _QWORD *a3, ssize_t *a4)
{
  void *v8;
  ssize_t v9;
  ssize_t v10;
  uint64_t v11;
  void *v12;

  v8 = _xpc_alloc(*(_QWORD *)(a2 + 96));
  v9 = read(a1, v8, *(_QWORD *)(a2 + 96));
  v10 = v9;
  if (v9 != *(_QWORD *)(a2 + 96))
  {
    if (v9 && (v9 != -1 || *__error()))
      _os_assumes_log();
    goto LABEL_8;
  }
  v11 = xpc_create_from_plist();
  v12 = (void *)v11;
  if (v11)
  {
    if (MEMORY[0x212BEDC10](v11) != MEMORY[0x24BDACFA0])
    {
      xpc_release(v12);
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    if (a3 && a4)
    {
      *a4 = v10;
      *a3 = v8;
      return v12;
    }
  }
LABEL_9:
  free(v8);
  return v12;
}

int *_xpc_strict_close(int *result)
{
  if ((result & 0x80000000) == 0)
  {
    result = (int *)close((int)result);
    if ((_DWORD)result)
    {
      if (*__error())
        _os_assumes_log();
      result = __error();
      if (*result == 9)
        _xpc_strict_close_cold_1();
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_assert_log();
}

BOOL SMJobIsEnabled(__CFString *a1, const __CFString *a2, _BYTE *a3)
{
  int v4;
  char *v5;
  _BOOL8 enabled_state;
  char v8;

  if (a1 == CFSTR("kSMDomainSystemLaunchd"))
    v4 = 1;
  else
    v4 = 7;
  v5 = CFStringJustCopyTheUTF8String(a2);
  v8 = 0;
  enabled_state = get_enabled_state(v4, v5, &v8);
  if (a3)
    *a3 = v8;
  free(v5);
  return enabled_state;
}

BOOL SMJobSetEnabled()
{
  CFErrorRef *v0;
  CFErrorRef *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  const __CFString *v6;
  char *v7;
  char *v8;
  int v9;
  int v10;
  char *v11;
  void *v12;
  uint64_t started;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  FTS *v21;
  FTS *v22;
  uint64_t v23;
  uint64_t v24;
  FTSENT *v25;
  int fts_info;
  void *v27;
  void *v28;
  const char *string;
  int v30;
  int *v31;
  char *v32;
  void *v33;
  CFErrorRef cferror_from_code;
  int v36;
  CFErrorRef *v38;
  char v39[1024];
  char __str[2048];
  char v41[1024];
  char *v42[4];

  MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v42[2] = *(char **)MEMORY[0x24BDAC8D0];
  v7 = CFStringJustCopyTheUTF8String(v6);
  v8 = v7;
  if (v3)
  {
    v9 = set_enabled_state(v7, v5 != 0);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      goto LABEL_41;
    }
  }
  os_variant_has_internal_content();
  bzero(v39, 0x400uLL);
  started = sysdir_start_search_path_enumeration_private();
  v14 = MEMORY[0x212BEDAE4](started, v39);
  if (!(_DWORD)v14)
  {
LABEL_12:
    v38 = v1;
    os_variant_has_internal_content();
    bzero(v41, 0x400uLL);
    v19 = sysdir_start_search_path_enumeration_private();
    while (1)
    {
      v20 = MEMORY[0x212BEDAE4](v19, v41);
      if (!(_DWORD)v20)
        break;
      v19 = v20;
      bzero(__str, 0x800uLL);
      snprintf(__str, 0x800uLL, "%s/%s", v41, "LaunchDaemons");
      v42[0] = __str;
      v42[1] = 0;
      v21 = fts_open(v42, 92, 0);
      if (v21)
      {
        v22 = v21;
        v23 = 0;
LABEL_16:
        v24 = v23;
        while (1)
        {
          v25 = fts_read(v22);
          v11 = (char *)v25;
          if (!v25)
            break;
          fts_info = v25->fts_info;
          if (fts_info != 11)
          {
            switch(fts_info)
            {
              case 7:
                if (v25->fts_errno)
                  _os_assumes_log();
                break;
              case 6:
                --v23;
                break;
              case 1:
                v23 = 1;
                if (v24)
                {
                  v23 = v24 + 1;
                  fts_set(v22, v25, 4);
                }
                break;
            }
            goto LABEL_16;
          }
          if (_xpc_has_suffix(v25->fts_path, ".plist"))
          {
            v27 = _xpc_copy_plist(*((const char **)v11 + 6));
            if (!v27)
              goto LABEL_16;
            v28 = v27;
            if (MEMORY[0x212BEDC10]() != MEMORY[0x24BDACFA0]
              || (string = xpc_dictionary_get_string(v28, "Label")) == 0
              || strcmp(string, v8))
            {
              xpc_release(v28);
              goto LABEL_16;
            }
            v11 = _xpc_strdup(*((const char **)v11 + 6));
            xpc_release(v28);
            break;
          }
        }
        fts_close(v22);
        if (v11)
        {
          v1 = v38;
          goto LABEL_37;
        }
      }
      else
      {
        v30 = *__error();
        v31 = __error();
        v32 = strerror(*v31);
        syslog(4, "failed to fts_open(%s, 0x%x): %d: %s", __str, 92, v30, v32);
      }
    }
    v11 = 0;
    v12 = 0;
    v10 = 110;
    v1 = v38;
    goto LABEL_41;
  }
  v15 = v14;
  while (1)
  {
    bzero(__str, 0x800uLL);
    snprintf(__str, 0x800uLL, "%s/%s/%s.plist", v39, "LaunchDaemons", v8);
    v16 = _xpc_copy_plist(__str);
    if (v16)
      break;
LABEL_11:
    v15 = MEMORY[0x212BEDAE4](v15, v39);
    if (!(_DWORD)v15)
      goto LABEL_12;
  }
  v17 = v16;
  if (MEMORY[0x212BEDC10]() != MEMORY[0x24BDACFA0]
    || (v18 = xpc_dictionary_get_string(v17, "Label")) == 0
    || strcmp(v8, v18))
  {
    xpc_release(v17);
    goto LABEL_11;
  }
  v11 = _xpc_strdup(__str);
  xpc_release(v17);
  if (!v11)
    goto LABEL_12;
LABEL_37:
  v33 = _xpc_copy_plist(v11);
  v12 = v33;
  if (v33 && MEMORY[0x212BEDC10](v33) == MEMORY[0x24BDACFA0])
  {
    if (v5)
    {
      v10 = submit_job(v12, 1);
    }
    else
    {
      v36 = remove_job(v8, 2);
      if ((v36 & 0xFFFFFFDF) == 3 || v36 == 37)
        v10 = 0;
      else
        v10 = v36;
    }
  }
  else
  {
    v10 = 109;
  }
LABEL_41:
  if (v1 && v10)
  {
    cferror_from_code = _create_cferror_from_code(v10);
    goto LABEL_46;
  }
  if (v1)
  {
    cferror_from_code = 0;
LABEL_46:
    *v1 = cferror_from_code;
  }
  if (v12)
    xpc_release(v12);
  free(v11);
  free(v8);
  return v10 == 0;
}

CFErrorRef _create_cferror_from_code(int a1)
{
  CFIndex v1;

  if (a1 <= 106)
  {
    if (a1 > 21)
    {
      if (a1 == 22)
      {
        v1 = 3;
        return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
      }
      if (a1 == 32)
      {
        v1 = 7;
        return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
      }
      if (a1 != 81)
        goto LABEL_22;
      goto LABEL_16;
    }
    if (a1 == 1)
    {
LABEL_16:
      v1 = 4;
      return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
    }
    if (a1 == 3)
    {
      v1 = 6;
      return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
    }
LABEL_22:
    v1 = 2;
    return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
  }
  if (a1 <= 109)
  {
    if (a1 == 107)
    {
      v1 = 5;
      return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
    }
    if (a1 == 109)
    {
      v1 = 8;
      return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
    }
    goto LABEL_22;
  }
  if ((a1 - 110) >= 2)
  {
    if (a1 == 119)
    {
      v1 = 9;
      return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
    }
    goto LABEL_22;
  }
  v1 = 10;
  return CFErrorCreate(0, CFSTR("CFErrorDomainLaunchd"), v1, 0);
}

uint64_t _SMLoginItemSetEnabledWithURL()
{
  return 0;
}

uint64_t SMLoginItemSetUserAllowed_4BTM()
{
  return 0;
}

uint64_t SMLaunchdPlistSetUserAllowed_4BTM()
{
  return 0;
}

uint64_t SMCopyEnabledLoginItems_4BTM()
{
  return 0;
}

CFDictionaryRef SMJobCopyDictionary(CFStringRef domain, CFStringRef jobLabel)
{
  char *v2;
  xpc_object_t v3;
  _launch_data *v4;
  const __CFDictionary *v5;

  v2 = CFStringJustCopyTheUTF8String(jobLabel);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "GetJob", v2);
  v4 = (_launch_data *)_launch_msg2();
  v5 = 0;
  if (launch_data_get_type(v4) == LAUNCH_DATA_DICTIONARY)
    v5 = CFCreateFromLaunchData(v4);
  xpc_release(v4);
  xpc_release(v3);
  free(v2);
  return v5;
}

CFArrayRef SMCopyAllJobDictionaries(CFStringRef domain)
{
  xpc_object_t v1;
  _launch_data *v2;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFArray *v5;

  v1 = xpc_string_create("GetJobs");
  v2 = (_launch_data *)_launch_msg2();
  if (launch_data_get_type(v2) == LAUNCH_DATA_DICTIONARY && (v3 = CFCreateFromLaunchData(v2)) != 0)
  {
    v4 = v3;
    v5 = CFArrayCreateFromDictionaryValues(v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  xpc_release(v2);
  xpc_release(v1);
  return v5;
}

Boolean SMJobSubmit(CFStringRef domain, CFDictionaryRef job, AuthorizationRef auth, CFErrorRef *outError)
{
  void *v5;
  int v6;
  int v7;
  __CFError *cferror_from_code;

  v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v6 = submit_job(v5, 0);
  v7 = v6;
  if (outError && v6)
  {
    cferror_from_code = _create_cferror_from_code(v6);
  }
  else
  {
    if (!outError)
      goto LABEL_7;
    cferror_from_code = 0;
  }
  *outError = cferror_from_code;
LABEL_7:
  if (v5)
    xpc_release(v5);
  return v7 == 0;
}

Boolean SMJobRemove(CFStringRef domain, CFStringRef jobLabel, AuthorizationRef auth, Boolean wait, CFErrorRef *outError)
{
  int v6;
  char *v7;
  char *v8;
  char v9;
  int v10;
  int v13;
  __CFError *cferror_from_code;

  v6 = wait;
  v7 = CFStringJustCopyTheUTF8String(jobLabel);
  v8 = v7;
  if (v6)
    v9 = 3;
  else
    v9 = 1;
  v10 = remove_job(v7, v9);
  if ((v10 & 0xFFFFFFFE) == 0x24 || v10 == 3 || v10 == 89)
    v13 = 0;
  else
    v13 = v10;
  free(v8);
  if (outError && v13)
  {
    cferror_from_code = _create_cferror_from_code(v13);
LABEL_18:
    *outError = cferror_from_code;
    return v13 == 0;
  }
  if (outError)
  {
    cferror_from_code = 0;
    goto LABEL_18;
  }
  return v13 == 0;
}

void _xpc_interface_routine_cold_1()
{
  qword_254B508B8 = (uint64_t)"Configuration error: unreasonably large PID or execcnt";
  __break(1u);
}

void _xpc_interface_routine_cold_2()
{
  qword_254B508B8 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void _xpc_interface_routine_cold_3()
{
  _os_crash();
  __break(1u);
}

void _xpc_interface_routine_cold_4()
{
  _os_crash();
  __break(1u);
}

void _xpc_interface_routine_cold_5()
{
  _os_crash();
  __break(1u);
}

void _xpc_interface_routine_cold_6(int a1)
{
  _xpc_asprintf("bootstrap port must lead to PID 1 [actual pid = %d]", a1);
  _os_crash();
  __break(1u);
}

void _xpc_alloc_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void CFStringJustCopyTheUTF8String_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void _xpc_strdup_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_crash();
  __break(1u);
}

void _xpc_strict_close_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  _os_crash();
  __break(1u);
  CEAcquireUnmanagedContext();
}

uint64_t CEAcquireUnmanagedContext()
{
  return MEMORY[0x24BED3C30]();
}

uint64_t CEValidate()
{
  return MEMORY[0x24BED3C90]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
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

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x24BDACA50]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x24BDACA68]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x24BDACA70]();
}

uint64_t _launch_msg2()
{
  return MEMORY[0x24BDACAE8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x24BDACB30]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x24BDACB48]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x24BDACBB0]();
}

uint64_t _xpc_pipe_interface_routine()
{
  return MEMORY[0x24BDACF58]();
}

uint64_t _xpc_pipe_interface_routine_async()
{
  return MEMORY[0x24BDACF60]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x24BED3C98]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x24BED3CA0]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x24BED3CA8]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x24BED3CB0]();
}

uint64_t der_vm_execute()
{
  return MEMORY[0x24BED3CB8]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x24BED3CC0]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x24BED3CC8]();
}

uint64_t der_vm_iterate()
{
  return MEMORY[0x24BED3CD0]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x24BED3CE8]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x24BDADFC0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x24BDAE570](a1, a2, *(_QWORD *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

size_t launch_data_array_get_count(const launch_data_t larray)
{
  return MEMORY[0x24BDAE9A8](larray);
}

launch_data_t launch_data_array_get_index(const launch_data_t larray, size_t idx)
{
  return (launch_data_t)MEMORY[0x24BDAE9B0](larray, idx);
}

void launch_data_dict_iterate(const launch_data_t ldict, launch_data_dict_iterator_t iterator, void *ctx)
{
  MEMORY[0x24BDAE9B8](ldict, iterator, ctx);
}

void launch_data_free(launch_data_t ld)
{
  MEMORY[0x24BDAE9C0](ld);
}

BOOL launch_data_get_BOOL(const launch_data_t ld)
{
  return MEMORY[0x24BDAE9C8](ld);
}

int launch_data_get_errno(const launch_data_t ld)
{
  return MEMORY[0x24BDAE9D0](ld);
}

uint64_t launch_data_get_integer(const launch_data_t ld)
{
  return MEMORY[0x24BDAE9D8](ld);
}

double launch_data_get_real(const launch_data_t ld)
{
  double result;

  MEMORY[0x24BDAE9E0](ld);
  return result;
}

const char *__cdecl launch_data_get_string(const launch_data_t ld)
{
  return (const char *)MEMORY[0x24BDAE9E8](ld);
}

launch_data_type_t launch_data_get_type(const launch_data_t ld)
{
  return MEMORY[0x24BDAE9F0](ld);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x24BDAF360]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x24BDB0110](*(_QWORD *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x24BDB0120]();
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x24BDB0460](*(_QWORD *)&a1, a2, a3);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x24BDB0850]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x24BDB08B8]();
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

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
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

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x24BDB0B78]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}


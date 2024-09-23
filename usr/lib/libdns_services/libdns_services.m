uint64_t dnssd_getaddrinfo_result_get_interface_index(uint64_t a1)
{
  return *(unsigned int *)(a1 + 188);
}

uint64_t dnssd_getaddrinfo_result_get_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 192);
}

uint64_t dnssd_getaddrinfo_result_get_address(uint64_t a1)
{
  return a1 + 32;
}

const char *dnssd_getaddrinfo_result_get_provider_name(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 88));
}

uint64_t dnssd_getaddrinfo_result_get_protocol(uint64_t a1)
{
  return *(unsigned int *)(a1 + 196);
}

const char *dnssd_getaddrinfo_result_get_hostname(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 64));
}

const char *dnssd_getaddrinfo_result_get_actual_hostname(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 72));
}

char *dnssd_getaddrinfo_result_get_tracker_hostname(uint64_t a1)
{
  char *result;

  result = *(char **)(a1 + 152);
  if (result)
    return (char *)xpc_string_get_string_ptr(result);
  return result;
}

uint64_t dnssd_getaddrinfo_result_is_from_cache(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 206);
}

uint64_t dnssd_getaddrinfo_result_has_extended_dns_error(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 210);
}

uint64_t dnssd_getaddrinfo_result_get_tracker_is_approved(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 208);
}

uint64_t dnssd_getaddrinfo_result_get_tracker_can_block_request(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 209);
}

char *dnssd_cname_array_get_cname(uint64_t a1, size_t a2)
{
  char *result;

  result = *(char **)(a1 + 24);
  if (result)
    return (char *)xpc_array_get_string(result, a2);
  return result;
}

char *dnssd_getaddrinfo_result_get_tracker_owner(uint64_t a1)
{
  char *result;

  result = *(char **)(a1 + 160);
  if (result)
    return (char *)xpc_string_get_string_ptr(result);
  return result;
}

void *dnssd_cname_array_get_count(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 24);
  if (result)
    return (void *)xpc_array_get_count(result);
  return result;
}

uint64_t dnssd_getaddrinfo_result_get_negative_reason(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

void ___dnssd_getaddrinfo_activate_block_invoke_2(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
}

uint64_t dnssd_getaddrinfo_result_service_is_valid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 207);
}

uint64_t ___dnssd_getaddrinfo_take_results_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 96);
  *(_QWORD *)(*(_QWORD *)(result + 40) + 96) = 0;
  return result;
}

uint64_t ___dnssd_getaddrinfo_append_results_block_invoke(uint64_t result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = (_QWORD *)(*(_QWORD *)(result + 32) + 96);
  do
  {
    v2 = v1;
    v3 = *v1;
    v1 = (_QWORD *)(*v1 + 24);
  }
  while (v3);
  *v2 = *(_QWORD *)(result + 40);
  return result;
}

void dnssd_getaddrinfo_set_use_failover(uint64_t a1, BOOL value)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 56), "use_failover", value);
}

void dnssd_getaddrinfo_set_protocols(uint64_t a1, uint64_t value)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 56), "protocols", value);
}

void dnssd_getaddrinfo_set_interface_index(uint64_t a1, uint64_t value)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 56), "interface_index", value);
}

void dnssd_getaddrinfo_set_hostname(uint64_t a1, char *string)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "hostname", string);
}

void dnssd_getaddrinfo_set_flags(uint64_t a1, uint64_t value)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 56), "flags", value);
}

void dnssd_getaddrinfo_set_log_privacy_level(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 56), "log_privacy_level", a2);
}

uint64_t dnssd_getaddrinfo_result_get_cnames(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 80);
  if (!result)
  {
    if (_dnssd_get_empty_cname_array_s_once != -1)
      dispatch_once(&_dnssd_get_empty_cname_array_s_once, &__block_literal_global_61);
    return _dnssd_get_empty_cname_array_s_empty_cname_array;
  }
  return result;
}

dispatch_queue_t ___dnssd_client_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.dnssd.client", 0);
  _dnssd_client_queue_queue = (uint64_t)result;
  return result;
}

void *dnssd_getaddrinfo_result_enumerate_alpn_values(uint64_t a1, uint64_t a2)
{
  void *result;
  _QWORD applier[5];

  result = *(void **)(a1 + 136);
  if (result)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 0x40000000;
    applier[2] = __dnssd_getaddrinfo_result_enumerate_alpn_values_block_invoke;
    applier[3] = &unk_1EA96F650;
    applier[4] = a2;
    return (void *)xpc_array_apply(result, applier);
  }
  return result;
}

uint64_t __dnssd_getaddrinfo_result_enumerate_alpn_values_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  xpc_string_get_string_ptr(xstring);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___dnssd_client_connection_block_invoke()
{
  if (_dnssd_client_queue_once != -1)
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_53);
  _dnssd_client_connection_connection = (uint64_t)xpc_connection_create_mach_service("com.apple.dnssd.service", (dispatch_queue_t)_dnssd_client_queue_queue, 2uLL);
  xpc_connection_set_event_handler((xpc_connection_t)_dnssd_client_connection_connection, &__block_literal_global_19);
  xpc_connection_activate((xpc_connection_t)_dnssd_client_connection_connection);
}

void dnssd_getaddrinfo_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  v4 = *(const void **)(a1 + 112);
  if (v4)
    _Block_release(v4);
  *(_QWORD *)(a1 + 112) = v3;
}

void dnssd_getaddrinfo_set_result_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  v4 = *(const void **)(a1 + 104);
  if (v4)
    _Block_release(v4);
  *(_QWORD *)(a1 + 104) = v3;
}

void dnssd_getaddrinfo_set_queue(uint64_t a1, dispatch_object_t object)
{
  NSObject *v4;

  if (*(_BYTE *)(a1 + 144))
  {
    if (!*(_QWORD *)(a1 + 40))
    {
      *(_QWORD *)(a1 + 40) = object;
      dispatch_retain(object);
      _dnssd_client_activate_getaddrinfo_async((void *)a1);
    }
  }
  else
  {
    dispatch_retain(object);
    v4 = *(NSObject **)(a1 + 40);
    if (v4)
      dispatch_release(v4);
    *(_QWORD *)(a1 + 40) = object;
  }
}

void ___dnssd_client_send_getaddrinfo_command_block_invoke(uint64_t a1, void *a2)
{
  _DWORD *v3;
  int v5;
  int int32;

  v3 = *(_DWORD **)(a1 + 32);
  if (v3[34] == 1)
  {
    if (MEMORY[0x1DF0F31F4](a2) == MEMORY[0x1E0C812F8])
    {
      int32 = mdns_xpc_dictionary_get_int32(a2, "error", 0);
      if (!int32)
      {
        v3[34] = 2;
        goto LABEL_10;
      }
      v5 = int32;
      goto LABEL_9;
    }
    if (a2 != (void *)MEMORY[0x1E0C81258])
    {
      if (a2 == (void *)MEMORY[0x1E0C81260])
        v5 = -65563;
      else
        v5 = -65537;
LABEL_9:
      _dnssd_client_fail_getaddrinfo(v3, v5);
    }
  }
LABEL_10:
  os_release(*(void **)(a1 + 32));
}

void dnssd_getaddrinfo_invalidate(void *a1)
{
  _QWORD block[5];

  os_retain(a1);
  if (_dnssd_client_queue_once != -1)
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_53);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __dnssd_getaddrinfo_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_93;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_dnssd_client_queue_queue, block);
}

void dnssd_getaddrinfo_activate(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 144))
  {
    if (*(_QWORD *)(a1 + 40))
      _dnssd_client_activate_getaddrinfo_async((void *)a1);
    *(_BYTE *)(a1 + 144) = 1;
  }
}

void _dnssd_client_activate_getaddrinfo_async(void *a1)
{
  _QWORD block[5];

  os_retain(a1);
  if (_dnssd_client_queue_once != -1)
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_53);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___dnssd_client_activate_getaddrinfo_async_block_invoke;
  block[3] = &__block_descriptor_tmp_55;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_dnssd_client_queue_queue, block);
}

_QWORD *dnssd_getaddrinfo_create()
{
  uint64_t v0;
  _QWORD *v1;
  xpc_object_t v2;
  dispatch_queue_t v3;

  objc_opt_class();
  v0 = _os_object_alloc();
  v1 = (_QWORD *)v0;
  if (v0)
  {
    *(_QWORD *)(v0 + 16) = &_dnssd_getaddrinfo_kind;
    v2 = xpc_dictionary_create(0, 0, 0);
    v1[7] = v2;
    if (!v2 || (v3 = dispatch_queue_create("com.apple.dnssd.getaddrinfo.mutex", 0), (v1[6] = v3) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

char *_dnssd_getaddrinfo_copy_description(uint64_t a1, int a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  const char *string_ptr;
  const char *v13;
  char *v14;
  size_t v15;
  const char *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  char *result;
  char *v22;

  v10 = *(void **)(a1 + 64);
  if (v10)
  {
    string_ptr = xpc_string_get_string_ptr(v10);
    if ((a3 & (string_ptr != 0)) != 0)
      v13 = "<redacted hostname>";
    else
      v13 = string_ptr;
  }
  else
  {
    v13 = 0;
  }
  v14 = 0;
  v15 = 0;
  if (v13)
    LOBYTE(v16) = (_BYTE)v13;
  else
    v16 = "<NO HOSTNAME>";
  while (1)
  {
    v22 = v14;
    v17 = (uint64_t)&v14[v15];
    if (a2)
    {
      v18 = _dnssd_snprintf(&v22, v17, "dnssd_%s (%p): ", a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8));
      if ((v18 & 0x80000000) != 0)
        goto LABEL_17;
      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    v20 = _dnssd_snprintf(&v22, v17, "hostname: %s", a4, a5, a6, a7, a8, (char)v16);
    if ((v20 & 0x80000000) != 0)
    {
LABEL_17:
      if (v14)
      {
        free(v14);
        return 0;
      }
      return v14;
    }
    if (v14)
      return v14;
    v15 = v19 + v20 + 1;
    result = (char *)malloc_type_malloc(v15, 0xA172743EuLL);
    if (!result)
      break;
    v14 = result;
    *result = 0;
  }
  __break(1u);
  return result;
}

uint64_t _dnssd_snprintf(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  size_t v11;
  uint64_t result;
  size_t v13;

  v10 = *a1;
  v11 = a2 - (_QWORD)*a1;
  result = vsnprintf(*a1, v11, a3, &a9);
  if ((result & 0x80000000) == 0)
  {
    v13 = result;
    if (v11 < result)
      v13 = v11;
    *a1 = &v10[v13];
  }
  return result;
}

void __dnssd_getaddrinfo_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  xpc_object_t v8;
  void *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 136);
  if (v2 != 4)
  {
    v4 = &g_gai_list;
    do
    {
      v5 = v4;
      v6 = *v4;
      v4 = (uint64_t *)(*v4 + 24);
      if (v6)
        v7 = v6 == v1;
      else
        v7 = 1;
    }
    while (!v7);
    if (v6)
    {
      *v5 = *(_QWORD *)(v1 + 24);
      *(_QWORD *)(v1 + 24) = 0;
      os_release((void *)v1);
      v2 = *(_DWORD *)(v1 + 136);
    }
    if ((v2 - 1) <= 1)
    {
      v8 = xpc_dictionary_create(0, 0, 0);
      if (v8)
      {
        v9 = v8;
        xpc_dictionary_set_uint64(v8, "id", *(_QWORD *)(v1 + 32));
        xpc_dictionary_set_string(v9, "command", "stop");
        if (_dnssd_client_connection_once != -1)
          dispatch_once(&_dnssd_client_connection_once, &__block_literal_global_16);
        v10 = (_xpc_connection_s *)_dnssd_client_connection_connection;
        if (_dnssd_client_queue_once != -1)
          dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_53);
        xpc_connection_send_message_with_reply(v10, v9, (dispatch_queue_t)_dnssd_client_queue_queue, &__block_literal_global);
        xpc_release(v9);
      }
    }
    v11 = *(NSObject **)(v1 + 88);
    if (v11)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v1 + 88));
      dispatch_release(v11);
      *(_QWORD *)(v1 + 88) = 0;
    }
    _dnssd_getaddrinfo_remove_all_results((_QWORD *)v1);
    if (*(_QWORD *)(v1 + 40))
    {
      os_retain((void *)v1);
      v12 = *(NSObject **)(v1 + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = ___dnssd_getaddrinfo_invalidate_block_invoke;
      block[3] = &__block_descriptor_tmp_51;
      block[4] = v1;
      dispatch_async(v12, block);
    }
    *(_DWORD *)(v1 + 136) = 4;
    v1 = *(_QWORD *)(a1 + 32);
  }
  os_release((void *)v1);
}

void _dnssd_getaddrinfo_remove_all_results(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;

  v2 = (void *)a1[9];
  if (v2)
  {
    os_release(v2);
    a1[9] = 0;
  }
  v3 = (void *)a1[10];
  if (v3)
  {
    os_release(v3);
    a1[10] = 0;
  }
  v4 = (_QWORD *)_dnssd_getaddrinfo_take_results((uint64_t)a1);
  v5 = a1[11];
  if (v5)
    dispatch_source_merge_data(v5, 2uLL);
  if (v4)
  {
    do
    {
      v6 = (_QWORD *)v4[3];
      os_release(v4);
      v4 = v6;
    }
    while (v6);
  }
}

void ___dnssd_client_activate_getaddrinfo_async_block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t value;
  xpc_object_t v4;
  dispatch_source_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  _QWORD block[5];
  int v14;
  _QWORD v15[5];
  _QWORD handler[6];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 136))
    goto LABEL_7;
  value = _dnssd_xpc_dictionary_get_value(*(void **)(v2 + 56), "hostname", MEMORY[0x1E0C81390]);
  if (!value)
  {
    v11 = -6705;
    goto LABEL_10;
  }
  v4 = xpc_copy(value);
  *(_QWORD *)(v2 + 64) = v4;
  if (!v4
    || (v5 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *(dispatch_queue_t *)(v2 + 40)),
        (*(_QWORD *)(v2 + 88) = v5) == 0))
  {
    v11 = -6729;
LABEL_10:
    os_retain((void *)v2);
    v12 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = ___dnssd_getaddrinfo_activate_block_invoke_3;
    block[3] = &__block_descriptor_tmp_58;
    block[4] = v2;
    v14 = v11;
    dispatch_async(v12, block);
    *(_DWORD *)(v2 + 136) = 3;
    goto LABEL_7;
  }
  os_retain((void *)v2);
  v6 = *(NSObject **)(v2 + 88);
  v7 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___dnssd_getaddrinfo_activate_block_invoke;
  handler[3] = &__block_descriptor_tmp_56;
  handler[4] = v2;
  handler[5] = v6;
  dispatch_source_set_event_handler(v6, handler);
  v8 = *(NSObject **)(v2 + 88);
  v15[0] = v7;
  v15[1] = 0x40000000;
  v15[2] = ___dnssd_getaddrinfo_activate_block_invoke_2;
  v15[3] = &__block_descriptor_tmp_57;
  v15[4] = v2;
  dispatch_source_set_cancel_handler(v8, v15);
  dispatch_activate(*(dispatch_object_t *)(v2 + 88));
  v9 = ++_dnssd_client_get_new_id_last_id;
  *(_DWORD *)(v2 + 136) = 1;
  *(_QWORD *)(v2 + 24) = g_gai_list;
  *(_QWORD *)(v2 + 32) = v9;
  g_gai_list = v2;
  os_retain((void *)v2);
  v10 = _dnssd_client_send_getaddrinfo_command(v2);
  if (v10)
    _dnssd_client_fail_getaddrinfo((void *)v2, v10);
LABEL_7:
  os_release(*(void **)(a1 + 32));
}

uint64_t _dnssd_client_send_getaddrinfo_command(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  _QWORD handler[5];

  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
    return 4294960567;
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "id", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_string(v3, "command", "getaddrinfo");
  xpc_dictionary_set_value(v3, "params", *(xpc_object_t *)(a1 + 56));
  os_retain((void *)a1);
  if (_dnssd_client_connection_once != -1)
    dispatch_once(&_dnssd_client_connection_once, &__block_literal_global_16);
  v4 = (_xpc_connection_s *)_dnssd_client_connection_connection;
  if (_dnssd_client_queue_once != -1)
    dispatch_once(&_dnssd_client_queue_once, &__block_literal_global_53);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___dnssd_client_send_getaddrinfo_command_block_invoke;
  handler[3] = &__block_descriptor_tmp_49;
  handler[4] = a1;
  xpc_connection_send_message_with_reply(v4, v3, (dispatch_queue_t)_dnssd_client_queue_queue, handler);
  xpc_release(v3);
  return 0;
}

void ___dnssd_client_connection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  const char *string;
  xpc_object_t value;
  uint64_t uint64_limited;
  uint64_t v10;
  int int32;
  xpc_object_t reply;
  void *v13;
  xpc_object_t array;
  uint64_t v15;
  NSObject *v16;
  _QWORD applier[6];
  _QWORD v18[4];
  uint64_t v19;
  _QWORD block[6];

  if (MEMORY[0x1DF0F31F4](a2) == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(a2, "command");
    if (string && !strcmp(string, "keepalive"))
    {
      reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        v13 = reply;
        xpc_dictionary_send_reply();
        xpc_release(v13);
      }
    }
    else
    {
      value = xpc_dictionary_get_value(a2, "id");
      uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFFFFFFFFFLL);
      v10 = g_gai_list;
      if (g_gai_list)
      {
        while (*(_QWORD *)(v10 + 32) != uint64_limited)
        {
          v10 = *(_QWORD *)(v10 + 24);
          if (!v10)
            return;
        }
        int32 = mdns_xpc_dictionary_get_int32(a2, "error", 0);
        if (int32)
        {
          _dnssd_client_fail_getaddrinfo((void *)v10, int32);
        }
        else
        {
          array = xpc_dictionary_get_array(a2, "results");
          if (array)
          {
            v18[0] = 0;
            v18[1] = v18;
            v18[2] = 0x2000000000;
            v18[3] = &v19;
            v19 = 0;
            v15 = MEMORY[0x1E0C809B0];
            applier[0] = MEMORY[0x1E0C809B0];
            applier[1] = 0x40000000;
            applier[2] = ___dnssd_client_handle_message_block_invoke;
            applier[3] = &unk_1EA96F760;
            applier[4] = v18;
            applier[5] = v10;
            xpc_array_apply(array, applier);
            if (v19)
            {
              v16 = *(NSObject **)(v10 + 48);
              block[0] = v15;
              block[1] = 0x40000000;
              block[2] = ___dnssd_getaddrinfo_append_results_block_invoke;
              block[3] = &__block_descriptor_tmp_47;
              block[4] = v10;
              block[5] = v19;
              dispatch_sync(v16, block);
              dispatch_source_merge_data(*(dispatch_source_t *)(v10 + 88), 1uLL);
              v19 = 0;
            }
            _Block_object_dispose(v18, 8);
          }
        }
      }
    }
  }
  else
  {
    v3 = g_gai_list;
    if (a2 == (void *)MEMORY[0x1E0C81258] && g_gai_list != 0)
    {
      do
      {
        v5 = *(_QWORD *)(v3 + 24);
        *(_DWORD *)(v3 + 136) = 1;
        v6 = _dnssd_client_send_getaddrinfo_command(v3);
        if (v6)
          _dnssd_client_fail_getaddrinfo((void *)v3, v6);
        else
          _dnssd_getaddrinfo_remove_all_results((_QWORD *)v3);
        v3 = v5;
      }
      while (v5);
    }
  }
}

void ___dnssd_getaddrinfo_activate_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  char data;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void **p_block;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  __int128 block;
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
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 40));
  if ((data & 2) != 0)
  {
    v3 = v1[14];
    if (v3)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 2, 0);
  }
  if ((data & 1) != 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    block = 0u;
    v22 = 0u;
    v4 = _dnssd_getaddrinfo_take_results((uint64_t)v1);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      do
      {
        v7 = v5;
        v5 = *(_QWORD *)(v5 + 24);
        *(_QWORD *)(v7 + 24) = 0;
        *((_QWORD *)&block + v6++) = v7;
        if (v6 == 32 || v5 == 0)
        {
          v9 = v1[13];
          if (v9)
            (*(void (**)(uint64_t, __int128 *, uint64_t))(v9 + 16))(v9, &block, v6);
          if (v6)
          {
            p_block = (void **)&block;
            do
            {
              v11 = *p_block++;
              os_release(v11);
              --v6;
            }
            while (v6);
          }
        }
      }
      while (v5);
    }
  }
  if ((data & 4) != 0)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v12 = v1[6];
    *(_QWORD *)&block = MEMORY[0x1E0C809B0];
    *((_QWORD *)&block + 1) = 0x40000000;
    *(_QWORD *)&v22 = ___dnssd_getaddrinfo_process_events_block_invoke;
    *((_QWORD *)&v22 + 1) = &unk_1EA96F958;
    *(_QWORD *)&v23 = &v17;
    *((_QWORD *)&v23 + 1) = v1;
    dispatch_sync(v12, &block);
    v13 = v1[14];
    if (v13)
    {
      v14 = *((_DWORD *)v18 + 6);
      if (v14)
      {
        v15 = v14 + 6729;
        if (v14 == -6705)
          v14 = -65540;
        if (v15 >= 2)
          v16 = v14;
        else
          v16 = 4294901757;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, 1, v16);
      }
    }
    _Block_object_dispose(&v17, 8);
  }
}

void _dnssd_getaddrinfo_result_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = (void *)a1[8];
  if (v2)
  {
    xpc_release(v2);
    a1[8] = 0;
  }
  v3 = (void *)a1[9];
  if (v3)
  {
    xpc_release(v3);
    a1[9] = 0;
  }
  v4 = (void *)a1[10];
  if (v4)
  {
    os_release(v4);
    a1[10] = 0;
  }
  v5 = (void *)a1[11];
  if (v5)
  {
    xpc_release(v5);
    a1[11] = 0;
  }
  v6 = (void *)a1[14];
  if (v6)
  {
    xpc_release(v6);
    a1[14] = 0;
  }
  v7 = (void *)a1[15];
  if (v7)
  {
    xpc_release(v7);
    a1[15] = 0;
  }
  v8 = (void *)a1[16];
  if (v8)
  {
    xpc_release(v8);
    a1[16] = 0;
  }
  v9 = (void *)a1[17];
  if (v9)
  {
    xpc_release(v9);
    a1[17] = 0;
  }
  v10 = (void *)a1[18];
  if (v10)
  {
    xpc_release(v10);
    a1[18] = 0;
  }
  v11 = (void *)a1[19];
  if (v11)
  {
    xpc_release(v11);
    a1[19] = 0;
  }
  v12 = (void *)a1[20];
  if (v12)
  {
    xpc_release(v12);
    a1[20] = 0;
  }
  v13 = (void *)a1[12];
  if (v13)
  {
    xpc_release(v13);
    a1[12] = 0;
  }
  v14 = (void *)a1[13];
  if (v14)
  {
    xpc_release(v14);
    a1[13] = 0;
  }
  v15 = (void *)a1[21];
  if (v15)
  {
    xpc_release(v15);
    a1[21] = 0;
  }
  v16 = (void *)a1[22];
  if (v16)
  {
    xpc_release(v16);
    a1[22] = 0;
  }
}

uint64_t ___dnssd_client_handle_message_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  void *v8;
  int int32;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  unsigned __int16 v13;
  xpc_object_t v14;
  unsigned __int16 v15;
  uint64_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  unsigned int v19;
  BOOL v20;
  unsigned int v21;
  int v22;
  int v23;
  xpc_object_t array;
  void *v25;
  void **v26;
  void *v27;
  unsigned __int16 *v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  xpc_object_t v34;
  uint64_t v35;
  unsigned int v36;
  char v37;
  int v38;
  int v39;
  size_t v40;
  void *v41;
  int v42;
  void **v43;
  void *v44;
  _OWORD *bytes_ptr;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  xpc_object_t v53;
  xpc_object_t v54;
  uint64_t v55;
  __int16 v56;
  char *v57;
  char *v58;
  void *v59;
  void *v60;
  xpc_object_t v61;
  xpc_object_t v62;
  uint64_t result;
  _BYTE *v64;
  _BYTE *v65;
  BOOL v66;
  char *v67;
  uint64_t v68;
  _BYTE *v69;
  unsigned __int8 *v70;
  unint64_t v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  _BYTE *v75;
  int v76;
  xpc_object_t v77;
  xpc_object_t v78;
  xpc_object_t object;
  xpc_object_t xdict;
  BOOL v81;
  BOOL v82;
  int v84;
  xpc_object_t v85;
  xpc_object_t v86;
  int uint64_limited;
  _QWORD v88[5];
  _QWORD v89[5];
  size_t v90;
  size_t length;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  _QWORD *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t *v102;
  size_t *p_length;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  char v107;

  v4 = *(_QWORD *)(a1 + 40);
  value = _dnssd_xpc_dictionary_get_value(a3, "rname", MEMORY[0x1E0C81390]);
  if (!value)
    return 1;
  v6 = value;
  v7 = _dnssd_xpc_dictionary_get_value(a3, "rdata", MEMORY[0x1E0C812E8]);
  if (!v7)
    return 1;
  v8 = v7;
  int32 = mdns_xpc_dictionary_get_int32(a3, "error", 0);
  v10 = xpc_dictionary_get_value(a3, "flags");
  uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)v10, 0xFFFFFFFFuLL);
  v11 = xpc_dictionary_get_value(a3, "interface_index");
  v84 = _mdns_xpc_object_get_uint64_limited((uint64_t)v11, 0xFFFFFFFFuLL);
  v12 = xpc_dictionary_get_value(a3, "rtype");
  v13 = _mdns_xpc_object_get_uint64_limited((uint64_t)v12, 0xFFFFuLL);
  v14 = xpc_dictionary_get_value(a3, "rprotocol");
  v15 = _mdns_xpc_object_get_uint64_limited((uint64_t)v14, 0xFFFFuLL);
  v16 = MEMORY[0x1E0C81390];
  v85 = _dnssd_xpc_dictionary_get_value(a3, "provider_name", MEMORY[0x1E0C81390]);
  v17 = _mdns_xpc_dictionary_get_object(a3, "tracker_hostname", v16);
  v18 = _mdns_xpc_dictionary_get_object(a3, "tracker_owner", v16);
  v82 = xpc_dictionary_get_BOOL(a3, "tracker_approved");
  v81 = xpc_dictionary_get_BOOL(a3, "tracker_can_block_request");
  LOBYTE(v98) = 0;
  v19 = mdns_xpc_dictionary_get_int32(a3, "negative_reason", (BOOL *)&v98);
  v20 = v19 >= 6 || v98 == 0;
  v21 = v20 ? 0 : v19;
  v86 = _dnssd_xpc_dictionary_get_value(a3, "validation_data", MEMORY[0x1E0C812E8]);
  xdict = _dnssd_xpc_dictionary_get_value(a3, "extended_dns_error", MEMORY[0x1E0C812F8]);
  if (int32)
  {
    if (int32 != -65554)
      return 1;
  }
  if (v17)
  {
    mdns_xpc_string_replace_if_different((xpc_object_t *)(v4 + 120), v17);
    object = *(xpc_object_t *)(v4 + 120);
  }
  else
  {
    object = 0;
  }
  v22 = v15;
  v23 = v13;
  if (v18)
  {
    mdns_xpc_string_replace_if_different((xpc_object_t *)(v4 + 128), v18);
    v78 = *(xpc_object_t *)(v4 + 128);
  }
  else
  {
    v78 = 0;
  }
  if (v13 - 64 >= 2)
  {
    if (v13 != 28 && v13 != 1)
      return 1;
    array = xpc_dictionary_get_array(a3, "cname_update");
    if (array)
    {
      v25 = array;
      if (v13 == 28)
        v26 = (void **)(v4 + 80);
      else
        v26 = (void **)(v4 + 72);
      LODWORD(v98) = 0;
      if (*v26)
      {
        os_release(*v26);
        *v26 = 0;
      }
      *v26 = _dnssd_cname_array_create(v25, (int *)&v98);
    }
    if (int32 == -65554)
    {
      v38 = 3;
    }
    else
    {
      if (uint64_limited >= 0)
        v39 = 1;
      else
        v39 = 4;
      if ((uint64_limited & 2) != 0)
        v38 = v39;
      else
        v38 = 2;
      v40 = xpc_data_get_length(v8);
      if (v13 == 1)
      {
        if (v40 != 4)
          return 1;
        v41 = *(void **)(v4 + 64);
        v42 = 2;
        goto LABEL_57;
      }
      if (v40 != 16)
        return 1;
    }
    if (v13 == 1)
      v42 = 2;
    else
      v42 = 30;
    v41 = *(void **)(v4 + 64);
    if (v23 == 28)
    {
      v43 = (void **)(v4 + 80);
LABEL_59:
      v44 = *v43;
      bytes_ptr = xpc_data_get_bytes_ptr(v8);
      objc_opt_class();
      v46 = _os_object_alloc();
      if (v46)
      {
        v31 = v46;
        *(_QWORD *)(v46 + 16) = &_dnssd_getaddrinfo_result_kind;
        *(_DWORD *)(v46 + 188) = v84;
        *(_DWORD *)(v46 + 192) = v38;
        *(_DWORD *)(v46 + 196) = v22;
        *(_DWORD *)(v46 + 200) = v21;
        v47 = MEMORY[0x1DF0F31F4](v41);
        v48 = MEMORY[0x1E0C81390];
        if (v47 == MEMORY[0x1E0C81390])
        {
          v49 = xpc_copy(v41);
          *(_QWORD *)(v31 + 64) = v49;
          if (v49)
          {
            if (MEMORY[0x1DF0F31F4](v6) == v48)
            {
              v50 = xpc_copy(v6);
              *(_QWORD *)(v31 + 72) = v50;
              if (v50)
              {
                if (!v44)
                {
                  if (_dnssd_get_empty_cname_array_s_once != -1)
                    dispatch_once(&_dnssd_get_empty_cname_array_s_once, &__block_literal_global_61);
                  v44 = (void *)_dnssd_get_empty_cname_array_s_empty_cname_array;
                }
                *(_QWORD *)(v31 + 80) = v44;
                os_retain(v44);
                if (v42 == 30)
                {
                  *(_WORD *)(v31 + 32) = 7708;
                  if (*(_DWORD *)(v31 + 192) != 3)
                  {
                    *(_OWORD *)(v31 + 40) = *bytes_ptr;
                    if (*(unsigned __int8 *)(v31 + 40) == 254 && (*(_BYTE *)(v31 + 41) & 0xC0) == 0x80)
                      *(_DWORD *)(v31 + 56) = *(_DWORD *)(v31 + 188);
                  }
                }
                else
                {
                  *(_WORD *)(v31 + 32) = 528;
                  if (*(_DWORD *)(v31 + 192) != 3)
                    *(_DWORD *)(v31 + 36) = *(_DWORD *)bytes_ptr;
                }
                if (!v85
                  || MEMORY[0x1DF0F31F4](v85) == v48 && (v51 = xpc_copy(v85), (*(_QWORD *)(v31 + 88) = v51) != 0))
                {
                  if (object)
                  {
                    *(_QWORD *)(v31 + 152) = xpc_retain(object);
                    if (v78)
                      *(_QWORD *)(v31 + 160) = xpc_retain(v78);
                    *(_BYTE *)(v31 + 208) = v82;
                    *(_BYTE *)(v31 + 209) = v81;
                  }
                  if (!v86
                    || MEMORY[0x1DF0F31F4](v86) == MEMORY[0x1E0C812E8]
                    && (v52 = xpc_copy(v86), (*(_QWORD *)(v31 + 168) = v52) != 0))
                  {
                    if (xdict)
                    {
                      v53 = xpc_dictionary_get_value(xdict, "code");
                      *(_WORD *)(v31 + 204) = _mdns_xpc_object_get_uint64_limited((uint64_t)v53, 0xFFFFuLL);
                      v54 = _mdns_xpc_dictionary_get_object(xdict, "text", MEMORY[0x1E0C81390]);
                      *(_QWORD *)(v31 + 176) = v54;
                      v55 = a1;
                      if (v54)
                        xpc_retain(v54);
                      *(_BYTE *)(v31 + 210) = 1;
                      goto LABEL_113;
                    }
LABEL_112:
                    v55 = a1;
LABEL_113:
                    if ((~uint64_limited & 0x40000002) == 0)
                      *(_BYTE *)(v31 + 206) = 1;
                    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(v55 + 32) + 8) + 24) = v31;
                    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v55 + 32) + 8) + 24) = v31 + 24;
                    return 1;
                  }
                }
              }
            }
          }
        }
        goto LABEL_148;
      }
      return 1;
    }
LABEL_57:
    v43 = (void **)(v4 + 72);
    goto LABEL_59;
  }
  if (int32 != -65554 && !xpc_data_get_length(v8))
    return 1;
  v27 = *(void **)(v4 + 64);
  v28 = (unsigned __int16 *)xpc_data_get_bytes_ptr(v8);
  v29 = xpc_data_get_length(v8);
  objc_opt_class();
  v30 = _os_object_alloc();
  if (!v30)
    return 1;
  v31 = v30;
  *(_QWORD *)(v30 + 16) = &_dnssd_getaddrinfo_result_kind;
  *(_DWORD *)(v30 + 188) = v84;
  *(_DWORD *)(v30 + 192) = 5;
  *(_DWORD *)(v30 + 196) = v22;
  *(_DWORD *)(v30 + 200) = v21;
  v32 = MEMORY[0x1DF0F31F4](v27);
  v33 = MEMORY[0x1E0C81390];
  if (v32 != MEMORY[0x1E0C81390])
    goto LABEL_148;
  *(_QWORD *)(v31 + 64) = xpc_copy(v27);
  if (MEMORY[0x1DF0F31F4](v6) != v33)
    goto LABEL_148;
  v34 = xpc_copy(v6);
  *(_QWORD *)(v31 + 72) = v34;
  if (!v34)
    goto LABEL_148;
  if (!v28 || !v29)
  {
    *(_BYTE *)(v31 + 207) = 0;
    if (!v85)
      goto LABEL_105;
LABEL_103:
    if (MEMORY[0x1DF0F31F4](v85) == v33)
    {
      v61 = xpc_copy(v85);
      *(_QWORD *)(v31 + 88) = v61;
      if (v61)
        goto LABEL_105;
    }
LABEL_148:
    os_release((void *)v31);
    return 1;
  }
  v35 = MEMORY[0x1E0C809B0];
  if (v29 >= 2)
  {
    if (*v28)
    {
      v92 = 0;
      v93 = (uint64_t)&v92;
      v94 = 0x2000000000;
      LOBYTE(v95) = 0;
      v98 = MEMORY[0x1E0C809B0];
      v99 = 0x40000000;
      v100 = __dnssd_svcb_is_valid_block_invoke;
      v101 = &unk_1EA96F9E8;
      v102 = &v92;
      _dnssd_svcb_extract_values(v28, v29, 0, (uint64_t)&v98);
      v37 = *(_BYTE *)(v93 + 24) == 0;
      _Block_object_dispose(&v92, 8);
    }
    else
    {
      v37 = dnssd_svcb_service_name_is_empty((uint64_t)v28, v29) ^ 1;
    }
    *(_BYTE *)(v31 + 207) = v37;
    v36 = bswap32(*v28) >> 16;
  }
  else
  {
    LOWORD(v36) = 0;
    *(_BYTE *)(v31 + 207) = 0;
  }
  *(_WORD *)(v31 + 186) = v36;
  v92 = 0;
  v93 = (uint64_t)&v92;
  v94 = 0x2000000000;
  LOWORD(v95) = 0;
  v98 = v35;
  v99 = 0x40000000;
  v100 = __dnssd_svcb_get_port_block_invoke;
  v101 = &unk_1EA96FA10;
  v102 = &v92;
  _dnssd_svcb_extract_values(v28, v29, 3, (uint64_t)&v98);
  v56 = *(_WORD *)(v93 + 24);
  _Block_object_dispose(&v92, 8);
  *(_WORD *)(v31 + 184) = v56;
  if (v29 < 2)
    goto LABEL_92;
  v64 = v28 + 1;
  if (v28 == (unsigned __int16 *)-2 || (char *)v28 + v29 <= v64)
    goto LABEL_92;
  v65 = v28 + 1;
  while (*v65)
  {
    v65 += *v65 + 1;
    if (v65)
      v66 = v65 >= (_BYTE *)v28 + v29;
    else
      v66 = 1;
    if (v66)
      goto LABEL_92;
  }
  if ((unsigned __int16)((_WORD)v65 - (_WORD)v64 + 1) > 0x100uLL)
    goto LABEL_92;
  result = (uint64_t)malloc_type_calloc(1uLL, 0x3F1uLL, 0xF1748037uLL);
  if (result)
  {
    v67 = (char *)result;
    LODWORD(v68) = *((unsigned __int8 *)v28 + 2);
    v69 = (_BYTE *)result;
    if (*((_BYTE *)v28 + 2)
      || (*(_BYTE *)result = 46, v69 = (_BYTE *)(result + 1), LODWORD(v68) = *v64, *v64))
    {
      while (v68 <= 0x3F)
      {
        v70 = v64 + 1;
        v71 = (unint64_t)&v64[v68 + 1];
        if (v71 >= (unint64_t)(v28 + 129))
          break;
        if ((unint64_t)v70 < v71)
        {
          v68 = v68;
          do
          {
            v73 = *v70++;
            v72 = v73;
            if (v73 == 92 || v72 == 46)
            {
              *v69++ = 92;
            }
            else if (v72 <= 0x20)
            {
              *(_WORD *)v69 = 12380;
              v74 = (205 * v72) >> 11;
              v69[2] = v74 | 0x30;
              v69 += 3;
              LOBYTE(v72) = (v72 - 10 * v74) | 0x30;
            }
            *v69++ = v72;
            --v68;
          }
          while (v68);
        }
        *v69 = 0;
        v75 = &v64[*v64];
        *v69++ = 46;
        v76 = v75[1];
        v64 = v75 + 1;
        LODWORD(v68) = v76;
        if (!v76)
          goto LABEL_142;
      }
    }
    else
    {
LABEL_142:
      *v69 = 0;
      if (v69 != (_BYTE *)-1)
      {
        if (dnssd_svcb_service_name_is_empty((uint64_t)v28, v29))
          v77 = xpc_copy(*(xpc_object_t *)(v31 + 64));
        else
          v77 = xpc_string_create(v67);
        *(_QWORD *)(v31 + 144) = v77;
        free(v67);
        if (!*(_QWORD *)(v31 + 144))
          goto LABEL_148;
        goto LABEL_92;
      }
    }
    free(v67);
LABEL_92:
    v92 = 0;
    v93 = (uint64_t)&v92;
    v94 = 0x2000000000;
    v95 = 0;
    v98 = v35;
    v99 = 0x40000000;
    v100 = __dnssd_svcb_copy_doh_uri_block_invoke;
    v101 = &unk_1EA96FA38;
    v102 = &v92;
    _dnssd_svcb_extract_values(v28, v29, 0x8000, (uint64_t)&v98);
    v57 = *(char **)(v93 + 24);
    _Block_object_dispose(&v92, 8);
    if (v57)
    {
      *(_QWORD *)(v31 + 112) = xpc_string_create(v57);
      free(v57);
      if (!*(_QWORD *)(v31 + 112))
        goto LABEL_148;
    }
    v92 = 0;
    v93 = (uint64_t)&v92;
    v94 = 0x2000000000;
    v95 = 0;
    v98 = v35;
    v99 = 0x40000000;
    v100 = __dnssd_svcb_copy_doh_path_block_invoke;
    v101 = &unk_1EA96FA60;
    v102 = &v92;
    _dnssd_svcb_extract_values(v28, v29, 7, (uint64_t)&v98);
    v58 = *(char **)(v93 + 24);
    _Block_object_dispose(&v92, 8);
    if (v58)
    {
      *(_QWORD *)(v31 + 120) = xpc_string_create(v58);
      free(v58);
      if (!*(_QWORD *)(v31 + 120))
        goto LABEL_148;
    }
    length = 0;
    v92 = 0;
    v93 = (uint64_t)&v92;
    v94 = 0x2000000000;
    v95 = 0;
    v98 = v35;
    v99 = 0x40000000;
    v100 = __dnssd_svcb_copy_ech_config_block_invoke;
    v101 = &unk_1EA96FA88;
    v102 = &v92;
    p_length = &length;
    _dnssd_svcb_extract_values(v28, v29, 5, (uint64_t)&v98);
    v59 = *(void **)(v93 + 24);
    _Block_object_dispose(&v92, 8);
    if (v59)
    {
      *(_QWORD *)(v31 + 96) = xpc_data_create(v59, length);
      free(v59);
      if (!*(_QWORD *)(v31 + 96))
        goto LABEL_148;
    }
    v90 = 0;
    v92 = 0;
    v93 = (uint64_t)&v92;
    v94 = 0x2000000000;
    v95 = 0;
    v98 = v35;
    v99 = 0x40000000;
    v100 = __dnssd_svcb_copy_odoh_config_block_invoke;
    v101 = &unk_1EA96FAB0;
    v102 = &v92;
    p_length = &v90;
    _dnssd_svcb_extract_values(v28, v29, 32769, (uint64_t)&v98);
    v60 = *(void **)(v93 + 24);
    _Block_object_dispose(&v92, 8);
    if (v60)
    {
      *(_QWORD *)(v31 + 128) = xpc_data_create(v60, v90);
      free(v60);
      if (!*(_QWORD *)(v31 + 128))
        goto LABEL_148;
    }
    v89[0] = v35;
    v89[1] = 0x40000000;
    v89[2] = ___dnssd_getaddrinfo_result_create_svcb_block_invoke;
    v89[3] = &__block_descriptor_tmp_44;
    v89[4] = v31;
    v98 = v35;
    v99 = 0x40000000;
    v100 = __dnssd_svcb_access_alpn_values_block_invoke;
    v101 = &unk_1EA96FAD8;
    v102 = v89;
    _dnssd_svcb_extract_values(v28, v29, 1, (uint64_t)&v98);
    v88[0] = v35;
    v88[1] = 0x40000000;
    v88[2] = ___dnssd_getaddrinfo_result_create_svcb_block_invoke_2;
    v88[3] = &__block_descriptor_tmp_46;
    v88[4] = v31;
    v104 = 0;
    v105 = &v104;
    v106 = 0x2000000000;
    v107 = 1;
    v98 = v35;
    v99 = 0x40000000;
    v100 = __dnssd_svcb_access_address_hints_block_invoke;
    v101 = &unk_1EA96FB00;
    v102 = v88;
    p_length = (size_t *)&v104;
    _dnssd_svcb_extract_values(v28, v29, 4, (uint64_t)&v98);
    if (*((_BYTE *)v105 + 24))
    {
      v92 = v35;
      v93 = 0x40000000;
      v94 = (uint64_t)__dnssd_svcb_access_address_hints_block_invoke_2;
      v95 = &unk_1EA96FB28;
      v96 = v88;
      v97 = &v104;
      _dnssd_svcb_extract_values(v28, v29, 6, (uint64_t)&v92);
    }
    _Block_object_dispose(&v104, 8);
    if (!v85)
    {
LABEL_105:
      if (object)
      {
        *(_QWORD *)(v31 + 152) = xpc_retain(object);
        if (v78)
          *(_QWORD *)(v31 + 160) = xpc_retain(v78);
        *(_BYTE *)(v31 + 208) = v82;
        *(_BYTE *)(v31 + 209) = v81;
      }
      if (!v86)
        goto LABEL_112;
      if (MEMORY[0x1DF0F31F4](v86) == MEMORY[0x1E0C812E8])
      {
        v62 = xpc_copy(v86);
        *(_QWORD *)(v31 + 168) = v62;
        if (v62)
          goto LABEL_112;
      }
      goto LABEL_148;
    }
    goto LABEL_103;
  }
  __break(1u);
  return result;
}

xpc_object_t _dnssd_xpc_dictionary_get_value(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t result;
  xpc_object_t v5;

  result = xpc_dictionary_get_value(a1, a2);
  if (result)
  {
    v5 = result;
    if (MEMORY[0x1DF0F31F4]() == a3)
      return v5;
    else
      return 0;
  }
  return result;
}

uint64_t _mdns_xpc_object_get_uint64_limited(uint64_t result, uint64_t a2)
{
  void *v3;

  if (result)
  {
    v3 = (void *)result;
    if (MEMORY[0x1DF0F31F4]() == MEMORY[0x1E0C81398])
    {
      result = xpc_uint64_get_value(v3);
      if (result > a2)
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

int64_t mdns_xpc_dictionary_get_int32(void *a1, const char *a2, BOOL *a3)
{
  int64_t result;
  BOOL v5;

  result = (int64_t)_mdns_xpc_dictionary_get_object(a1, a2, MEMORY[0x1E0C81328]);
  if (!result)
  {
    v5 = 0;
    if (!a3)
      return result;
    goto LABEL_6;
  }
  result = xpc_int64_get_value((xpc_object_t)result);
  v5 = (int)result == result;
  if ((int)result == result)
    result = result;
  else
    result = 0;
  if (a3)
LABEL_6:
    *a3 = v5;
  return result;
}

xpc_object_t _mdns_xpc_dictionary_get_object(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t value;
  xpc_object_t v5;

  value = xpc_dictionary_get_value(a1, a2);
  v5 = value;
  if (value && MEMORY[0x1DF0F31F4](value) != a3)
    return 0;
  return v5;
}

_QWORD *_dnssd_cname_array_create(void *a1, int *a2)
{
  uint64_t v4;
  _QWORD *v5;
  xpc_object_t v6;
  int v7;
  _QWORD *v8;

  objc_opt_class();
  v4 = _os_object_alloc();
  v5 = (_QWORD *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 16) = &_dnssd_cname_array_kind;
    if (a1 && (v6 = xpc_copy(a1), (v5[3] = v6) == 0))
    {
      v8 = 0;
      v7 = -6729;
    }
    else
    {
      v7 = 0;
      v8 = v5;
      v5 = 0;
    }
  }
  else
  {
    v8 = 0;
    v7 = -6728;
  }
  if (a2)
    *a2 = v7;
  if (v5)
    os_release(v5);
  return v8;
}

uint64_t _dnssd_getaddrinfo_take_results(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___dnssd_getaddrinfo_take_results_block_invoke;
  v4[3] = &unk_1EA96F850;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void _dnssd_cname_array_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

_WORD *_dnssd_svcb_extract_values(_WORD *result, unint64_t a2, int a3, uint64_t a4)
{
  _WORD *v4;
  _BYTE *v7;
  BOOL v8;
  unint64_t v9;
  unsigned __int16 *v10;
  unint64_t v11;
  unint64_t v13;
  unsigned __int16 *v14;

  if (a2 >= 2)
  {
    if (*result)
    {
      v4 = result + 1;
      if (result != (_WORD *)-2 && (_WORD *)((char *)result + a2) > v4)
      {
        v7 = result + 1;
        while (*v7)
        {
          v7 += *v7 + 1;
          if (v7)
            v8 = v7 >= (_BYTE *)result + a2;
          else
            v8 = 1;
          if (v8)
            return result;
        }
        v9 = (unsigned __int16)((_WORD)v7 - (_WORD)v4 + 1);
        if (v9 <= 0x100)
        {
          v10 = (_WORD *)((char *)v4 + v9);
          v11 = a2 - 2 - v9;
          while (v11 >= 4 && v10 != 0)
          {
            v13 = bswap32(v10[1]) >> 16;
            v8 = v11 - 4 >= v13;
            v11 = v11 - 4 - v13;
            if (!v8)
              break;
            v14 = v10 + 2;
            if (a3 == bswap32(*v10) >> 16)
            {
              result = (_WORD *)(*(uint64_t (**)(uint64_t, unsigned __int16 *, unint64_t))(a4 + 16))(a4, v10 + 2, v13);
              if (!(_DWORD)result)
                break;
            }
            v10 = (unsigned __int16 *)((char *)v14 + v13);
          }
        }
      }
    }
  }
  return result;
}

void _dnssd_getaddrinfo_finalize(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  const void *v9;
  void *v10;
  void *v11;

  v2 = a1[5];
  if (v2)
  {
    dispatch_release(v2);
    a1[5] = 0;
  }
  v3 = a1[6];
  if (v3)
  {
    dispatch_release(v3);
    a1[6] = 0;
  }
  v4 = (void *)a1[7];
  if (v4)
  {
    xpc_release(v4);
    a1[7] = 0;
  }
  v5 = (void *)a1[8];
  if (v5)
  {
    xpc_release(v5);
    a1[8] = 0;
  }
  v6 = (void *)a1[9];
  if (v6)
  {
    os_release(v6);
    a1[9] = 0;
  }
  v7 = (void *)a1[10];
  if (v7)
  {
    os_release(v7);
    a1[10] = 0;
  }
  v8 = (const void *)a1[13];
  if (v8)
  {
    _Block_release(v8);
    a1[13] = 0;
  }
  v9 = (const void *)a1[14];
  if (v9)
  {
    _Block_release(v9);
    a1[14] = 0;
  }
  v10 = (void *)a1[15];
  if (v10)
  {
    xpc_release(v10);
    a1[15] = 0;
  }
  v11 = (void *)a1[16];
  if (v11)
  {
    xpc_release(v11);
    a1[16] = 0;
  }
}

uint64_t mdns_xpc_string_replace_if_different(xpc_object_t *a1, xpc_object_t object)
{
  uint64_t result;

  result = (uint64_t)*a1;
  if ((xpc_object_t)result != object)
  {
    if (result)
    {
      result = xpc_equal((xpc_object_t)result, object);
      if ((result & 1) != 0)
        return result;
      if (*a1)
      {
        xpc_release(*a1);
        *a1 = 0;
      }
    }
    result = (uint64_t)xpc_retain(object);
    *a1 = (xpc_object_t)result;
  }
  return result;
}

uint64_t dnssd_svcb_service_name_is_empty(uint64_t a1, unint64_t a2)
{
  _BOOL4 v3;
  unint64_t v4;
  _BOOL4 v5;
  _BYTE *v6;
  BOOL v7;
  unint64_t v8;

  if (a2 < 2)
    return 0;
  v3 = 0;
  v4 = a1 + 2;
  if (a1 == -2)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if (a1 + a2 > v4)
    {
      v6 = (_BYTE *)(a1 + 2);
      while (*v6)
      {
        v6 += *v6 + 1;
        if (v6)
          v7 = (unint64_t)v6 >= a1 + a2;
        else
          v7 = 1;
        if (v7)
        {
          v3 = 0;
          v5 = 0;
          return v3 & v5;
        }
      }
      v8 = (unsigned __int16)((_WORD)v6 - v4 + 1);
      v5 = v8 < 0x101;
      v3 = v8 == 1;
    }
  }
  return v3 & v5;
}

uint64_t __dnssd_svcb_access_alpn_values_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[16];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    v6 = 0;
    do
    {
      v6 += 1 + *(unsigned __int8 *)(a2 + v6);
      memset(v14, 0, 255);
      if (v6 > a3)
        break;
      __memcpy_chk();
      if (((*(uint64_t (**)(_QWORD, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v14, v7, v8, v9, v10, v11, v12) & 1) == 0)break;
    }
    while (v6 < a3);
  }
  return 0;
}

uint64_t ___dnssd_getaddrinfo_result_create_svcb_block_invoke(uint64_t a1, char *string)
{
  xpc_object_t v3;
  void *v4;

  v3 = xpc_string_create(string);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = xpc_array_create(0, 0);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  xpc_array_append_value(v4, v3);
  if (v3)
    xpc_release(v3);
  return 1;
}

void dnssd_getaddrinfo_set_service_scheme(uint64_t a1, char *string)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "service_scheme", string);
}

const void *dnssd_getaddrinfo_result_get_validation_data(uint64_t a1, _QWORD *a2)
{
  void *length;
  const void *bytes_ptr;

  length = *(void **)(a1 + 168);
  if (!length)
  {
    bytes_ptr = 0;
    if (!a2)
      return bytes_ptr;
    goto LABEL_3;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(length);
  length = (void *)xpc_data_get_length(*(xpc_object_t *)(a1 + 168));
  if (a2)
LABEL_3:
    *a2 = length;
  return bytes_ptr;
}

uint64_t dnssd_getaddrinfo_result_get_service_priority(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 186);
}

uint64_t dnssd_getaddrinfo_result_get_service_port(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 184);
}

const char *dnssd_getaddrinfo_result_get_service_name(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 144));
}

const char *dnssd_getaddrinfo_result_get_doh_uri(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 112));
}

void ___dnssd_getaddrinfo_invalidate_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[14];
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(v2[14], 3, 0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  os_release(v2);
}

void dnssd_getaddrinfo_set_delegate_audit_token(uint64_t a1, void *bytes)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 56), "delegate_id", bytes, 0x20uLL);
}

const void *dnssd_getaddrinfo_result_get_ech_config(uint64_t a1, _QWORD *a2)
{
  void *length;
  const void *bytes_ptr;

  length = *(void **)(a1 + 96);
  if (!length)
  {
    bytes_ptr = 0;
    if (!a2)
      return bytes_ptr;
    goto LABEL_3;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(length);
  length = (void *)xpc_data_get_length(*(xpc_object_t *)(a1 + 96));
  if (a2)
LABEL_3:
    *a2 = length;
  return bytes_ptr;
}

void *dnssd_getaddrinfo_result_enumerate_service_address_hints(uint64_t a1, uint64_t a2)
{
  void *result;
  _QWORD applier[5];

  result = *(void **)(a1 + 104);
  if (result)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 0x40000000;
    applier[2] = __dnssd_getaddrinfo_result_enumerate_service_address_hints_block_invoke;
    applier[3] = &unk_1EA96F678;
    applier[4] = a2;
    return (void *)xpc_array_apply(result, applier);
  }
  return result;
}

void dnssd_getaddrinfo_set_delegate_uuid(uint64_t a1, unsigned __int8 *uuid)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_uuid(*(xpc_object_t *)(a1 + 56), "delegate_id", uuid);
}

void dnssd_getaddrinfo_set_account_id(uint64_t a1, char *string)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "account_id", string);
}

void advertising_proxy_ref_dealloc(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  v1 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __advertising_proxy_ref_dealloc_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a1;
  dispatch_async(v1, block);
}

void __advertising_proxy_ref_dealloc_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  _xpc_connection_s *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _BYTE v16[34];
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    *(_QWORD *)(v1 + 16) = 0;
    v3 = *(void **)(a1 + 32);
    v4 = (_xpc_connection_s *)*((_QWORD *)v3 + 1);
    if (v4)
    {
      xpc_connection_cancel(v4);
      v3 = *(void **)(a1 + 32);
      if (!v3)
      {
LABEL_12:
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          return;
        LOWORD(v13) = 0;
        v8 = MEMORY[0x1E0C81028];
        v9 = "dns_services: advertising_proxy_ref_dealloc successfully released conn_ref";
        goto LABEL_16;
      }
    }
    v5 = *(_DWORD *)v3;
    if (*(_DWORD *)v3)
    {
      v6 = global_os_log;
      if (v5 < 10001)
      {
        if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136447490;
          v14 = "advertising_proxy_ref_dealloc_block_invoke";
          v15 = 1024;
          *(_DWORD *)v16 = v5;
          *(_WORD *)&v16[4] = 2048;
          *(_QWORD *)&v16[6] = v3;
          *(_WORD *)&v16[14] = 2080;
          *(_QWORD *)&v16[16] = "conn_ref";
          *(_WORD *)&v16[24] = 2080;
          *(_QWORD *)&v16[26] = "advertising_proxy_services.c";
          v17 = 1024;
          v18 = 280;
          _os_log_impl(&dword_1DEF5C000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", (uint8_t *)&v13, 0x36u);
          v3 = *(void **)(a1 + 32);
          v5 = *(_DWORD *)v3;
        }
        *(_DWORD *)v3 = v5 - 1;
        if (v5 == 1)
        {
          v7 = global_os_log;
          if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 136447234;
            v14 = "advertising_proxy_ref_dealloc_block_invoke";
            v15 = 2048;
            *(_QWORD *)v16 = v3;
            *(_WORD *)&v16[8] = 2080;
            *(_QWORD *)&v16[10] = "conn_ref";
            *(_WORD *)&v16[18] = 2080;
            *(_QWORD *)&v16[20] = "advertising_proxy_services.c";
            *(_WORD *)&v16[28] = 1024;
            *(_DWORD *)&v16[30] = 280;
            _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", (uint8_t *)&v13, 0x30u);
            v3 = *(void **)(a1 + 32);
          }
          ++advertising_proxy_conn_ref_finalized;
          free(v3);
        }
        goto LABEL_12;
      }
      if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
LABEL_23:
        abort();
      v13 = 136447490;
      v14 = "advertising_proxy_ref_dealloc_block_invoke";
      v15 = 1024;
      *(_DWORD *)v16 = v5;
      *(_WORD *)&v16[4] = 2048;
      *(_QWORD *)&v16[6] = v3;
      *(_WORD *)&v16[14] = 2080;
      *(_QWORD *)&v16[16] = "conn_ref";
      *(_WORD *)&v16[24] = 2080;
      *(_QWORD *)&v16[26] = "advertising_proxy_services.c";
      v17 = 1024;
      v18 = 280;
      v11 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
      v12 = v6;
    }
    else
    {
      v10 = global_os_log;
      if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
        goto LABEL_23;
      v13 = 136447490;
      v14 = "advertising_proxy_ref_dealloc_block_invoke";
      v15 = 1024;
      *(_DWORD *)v16 = 0;
      *(_WORD *)&v16[4] = 2048;
      *(_QWORD *)&v16[6] = v3;
      *(_WORD *)&v16[14] = 2080;
      *(_QWORD *)&v16[16] = "conn_ref";
      *(_WORD *)&v16[24] = 2080;
      *(_QWORD *)&v16[26] = "advertising_proxy_services.c";
      v17 = 1024;
      v18 = 280;
      v11 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
      v12 = v10;
    }
    _os_log_impl(&dword_1DEF5C000, v12, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v13, 0x36u);
    goto LABEL_23;
  }
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    return;
  LOWORD(v13) = 0;
  v8 = MEMORY[0x1E0C81028];
  v9 = "dns_services: advertising_proxy_ref_dealloc called with NULL advertising_proxy_conn_ref";
LABEL_16:
  _os_log_impl(&dword_1DEF5C000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 2u);
}

uint64_t advertising_proxy_enable(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_enable", "enable", a3, 0, 0, 477);
}

uint64_t adv_send_command_with_dict_(_QWORD *a1, NSObject *a2, const char *a3, char *string, uint64_t a5, uint64_t a6, xpc_object_t xdict, int a8)
{
  xpc_object_t v16;
  int *v17;
  int *v18;
  xpc_connection_t mach_service;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint32_t v28;
  char v29;
  uint64_t v30;
  _xpc_connection_s *v31;
  _xpc_connection_s *v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  int v36;
  int v37;
  _QWORD v39[5];
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (global_os_log)
  {
    if (a2)
      goto LABEL_3;
LABEL_14:
    v25 = 4294901756;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = a3;
      v26 = MEMORY[0x1E0C81028];
      v27 = "%s: NULL cti_connection_t OR Callback OR Client_Queue parameter";
      v28 = 12;
      goto LABEL_38;
    }
    return v25;
  }
  global_os_log = (uint64_t)os_log_create("com.apple.srp-mdns-proxy", "0");
  if (!a2)
    goto LABEL_14;
LABEL_3:
  v16 = xdict;
  if (xdict || (v16 = xpc_dictionary_create(0, 0, 0)) != 0)
  {
    xpc_dictionary_set_string(v16, "xpc-command", string);
    v17 = (int *)malloc_type_calloc(1uLL, 0x48uLL, 0x10F0040DDE7724DuLL);
    if (v17)
    {
      v18 = v17;
      dispatch_retain(a2);
      *((_QWORD *)v18 + 6) = a2;
      *((_QWORD *)v18 + 7) = a3;
      *((_QWORD *)v18 + 2) = a5;
      *((_QWORD *)v18 + 5) = a6;
      mach_service = xpc_connection_create_mach_service("com.apple.srp-mdns-proxy.proxy", a2, 2uLL);
      *((_QWORD *)v18 + 1) = mach_service;
      if (mach_service)
      {
        v20 = global_os_log;
        if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *v18;
          *(_DWORD *)buf = 136447490;
          v42 = "adv_init_connection";
          v43 = 1024;
          v44 = v21;
          v45 = 2048;
          v46 = v18;
          v47 = 2080;
          v48 = "conn_ref";
          v49 = 2080;
          v50 = "advertising_proxy_services.c";
          v51 = 1024;
          v52 = 379;
          _os_log_impl(&dword_1DEF5C000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:  retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
        }
        v22 = *v18;
        if (*v18)
        {
          v23 = v22 + 1;
          *v18 = v22 + 1;
          if (v22 + 1 >= 10001)
          {
            v24 = global_os_log;
            if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
              goto LABEL_43;
            *(_DWORD *)buf = 136447490;
            v42 = "adv_init_connection";
            v43 = 1024;
            v44 = v23;
            v45 = 2048;
            v46 = v18;
            v47 = 2080;
            v48 = "conn_ref";
            v49 = 2080;
            v50 = "advertising_proxy_services.c";
            v51 = 1024;
            v52 = 379;
            goto LABEL_42;
          }
        }
        else
        {
          ++advertising_proxy_conn_ref_created;
          *v18 = 1;
        }
        v30 = MEMORY[0x1E0C809B0];
        v31 = (_xpc_connection_s *)*((_QWORD *)v18 + 1);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 0x40000000;
        handler[2] = __adv_init_connection_block_invoke;
        handler[3] = &__block_descriptor_tmp_63;
        handler[4] = v18;
        xpc_connection_set_event_handler(v31, handler);
        xpc_connection_set_finalizer_f(*((xpc_connection_t *)v18 + 1), (xpc_finalizer_t)adv_connection_finalize);
        xpc_connection_set_context(*((xpc_connection_t *)v18 + 1), v18);
        xpc_connection_resume(*((xpc_connection_t *)v18 + 1));
        v32 = (_xpc_connection_s *)*((_QWORD *)v18 + 1);
        v33 = *((_QWORD *)v18 + 6);
        v39[0] = v30;
        v39[1] = 0x40000000;
        v39[2] = __adv_init_connection_block_invoke_2;
        v39[3] = &__block_descriptor_tmp_64;
        v39[4] = v18;
        xpc_connection_send_message_with_reply(v32, v16, v33, v39);
        if (a1)
        {
          *a1 = v18;
          v34 = global_os_log;
          if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *v18;
            *(_DWORD *)buf = 136447490;
            v42 = "adv_init_connection";
            v43 = 1024;
            v44 = v35;
            v45 = 2048;
            v46 = v18;
            v47 = 2080;
            v48 = "conn_ref";
            v49 = 2080;
            v50 = "advertising_proxy_services.c";
            v51 = 1024;
            v52 = a8;
            _os_log_impl(&dword_1DEF5C000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:  retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
          }
          v36 = *v18;
          if (!*v18)
          {
            v25 = 0;
            ++advertising_proxy_conn_ref_created;
            v29 = 1;
            *v18 = 1;
            goto LABEL_32;
          }
          v37 = v36 + 1;
          *v18 = v36 + 1;
          if (v36 + 1 >= 10001)
          {
            v24 = global_os_log;
            if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
              goto LABEL_43;
            *(_DWORD *)buf = 136447490;
            v42 = "adv_init_connection";
            v43 = 1024;
            v44 = v37;
            v45 = 2048;
            v46 = v18;
            v47 = 2080;
            v48 = "conn_ref";
            v49 = 2080;
            v50 = "advertising_proxy_services.c";
            v51 = 1024;
            v52 = a8;
LABEL_42:
            _os_log_impl(&dword_1DEF5C000, v24, OS_LOG_TYPE_FAULT, "%{public}s: ALLOC: retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
LABEL_43:
            abort();
          }
        }
        v25 = 0;
        v29 = 1;
LABEL_32:
        if (v16 != xdict)
          xpc_release(v16);
        if ((v29 & 1) != 0)
          return 0;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          return v25;
        *(_DWORD *)buf = 136315394;
        v42 = a3;
        v43 = 1024;
        v44 = v25;
        v26 = MEMORY[0x1E0C81028];
        v27 = "%s: Since init_connection() returned %d error returning w/o sending msg";
        v28 = 18;
LABEL_38:
        _os_log_impl(&dword_1DEF5C000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
        return v25;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dns_services: init_connection() conn_ref/lib_q is NULL", buf, 2u);
      }
      v25 = 4294901757;
      free(v18);
    }
    else
    {
      v25 = 4294901757;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dns_services: init_connection() No memory to allocate!", buf, 2u);
      }
    }
    v29 = 0;
    goto LABEL_32;
  }
  v25 = 4294901757;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v26 = MEMORY[0x1E0C81028];
    v27 = "dns_services: init_connection() No memory to allocate!";
    v28 = 2;
    goto LABEL_38;
  }
  return v25;
}

void __adv_init_connection_block_invoke(uint64_t a1, void *a2)
{
  adv_event_handler(a2, *(_QWORD *)(a1 + 32));
}

void adv_connection_finalize(int *a1)
{
  int v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BYTE v10[34];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *a1;
    v7 = 67109120;
    LODWORD(v8) = v2;
    _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adv_connection_finalize: releasing conn_ref at %d", (uint8_t *)&v7, 8u);
  }
  else if (!a1)
  {
    return;
  }
  v3 = *a1;
  if (!*a1)
  {
    v4 = global_os_log;
    if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    v7 = 136447490;
    v8 = "adv_connection_finalize";
    v9 = 1024;
    *(_DWORD *)v10 = 0;
    *(_WORD *)&v10[4] = 2048;
    *(_QWORD *)&v10[6] = a1;
    *(_WORD *)&v10[14] = 2080;
    *(_QWORD *)&v10[16] = "conn_ref";
    *(_WORD *)&v10[24] = 2080;
    *(_QWORD *)&v10[26] = "advertising_proxy_services.c";
    v11 = 1024;
    v12 = 290;
    v6 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
    goto LABEL_17;
  }
  v4 = global_os_log;
  if (v3 >= 10001)
  {
    if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    v7 = 136447490;
    v8 = "adv_connection_finalize";
    v9 = 1024;
    *(_DWORD *)v10 = v3;
    *(_WORD *)&v10[4] = 2048;
    *(_QWORD *)&v10[6] = a1;
    *(_WORD *)&v10[14] = 2080;
    *(_QWORD *)&v10[16] = "conn_ref";
    *(_WORD *)&v10[24] = 2080;
    *(_QWORD *)&v10[26] = "advertising_proxy_services.c";
    v11 = 1024;
    v12 = 290;
    v6 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
LABEL_17:
    _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v7, 0x36u);
LABEL_18:
    abort();
  }
  if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136447490;
    v8 = "adv_connection_finalize";
    v9 = 1024;
    *(_DWORD *)v10 = v3;
    *(_WORD *)&v10[4] = 2048;
    *(_QWORD *)&v10[6] = a1;
    *(_WORD *)&v10[14] = 2080;
    *(_QWORD *)&v10[16] = "conn_ref";
    *(_WORD *)&v10[24] = 2080;
    *(_QWORD *)&v10[26] = "advertising_proxy_services.c";
    v11 = 1024;
    v12 = 290;
    _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", (uint8_t *)&v7, 0x36u);
    v3 = *a1;
  }
  *a1 = v3 - 1;
  if (v3 == 1)
  {
    v5 = global_os_log;
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136447234;
      v8 = "adv_connection_finalize";
      v9 = 2048;
      *(_QWORD *)v10 = a1;
      *(_WORD *)&v10[8] = 2080;
      *(_QWORD *)&v10[10] = "conn_ref";
      *(_WORD *)&v10[18] = 2080;
      *(_QWORD *)&v10[20] = "advertising_proxy_services.c";
      *(_WORD *)&v10[28] = 1024;
      *(_DWORD *)&v10[30] = 290;
      _os_log_impl(&dword_1DEF5C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", (uint8_t *)&v7, 0x30u);
    }
    ++advertising_proxy_conn_ref_finalized;
    free(a1);
  }
}

void __adv_init_connection_block_invoke_2(uint64_t a1, void *a2)
{
  adv_event_handler(a2, *(_QWORD *)(a1 + 32));
}

void adv_event_handler(void *a1, uint64_t a2)
{
  const char *string;
  void (*v5)(uint64_t, _QWORD, uint64_t);
  void (*v6)(uint64_t, void *, uint64_t);
  uint64_t v7;
  _BOOL4 v8;
  const char *v9;
  void (*v10)(uint64_t, _QWORD, uint64_t);
  void (*v11)(uint64_t, _QWORD, uint64_t);
  void (*v12)(uint64_t, void *, _QWORD);
  const char *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1 == (void *)MEMORY[0x1E0C81260])
  {
    v7 = *(_QWORD *)(a2 + 8);
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      if (!v8)
        return;
      v13 = *(const char **)(a2 + 56);
      v18 = 136315650;
      v19 = v13;
      v20 = 2048;
      v21 = a2;
      v22 = 2048;
      v23 = 0;
      v14 = MEMORY[0x1E0C81028];
      v15 = "adv_event_handler (%s): spurious invalid callback %p %p";
      v16 = 32;
LABEL_22:
      _os_log_impl(&dword_1DEF5C000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v16);
      return;
    }
    if (v8)
    {
      v9 = *(const char **)(a2 + 56);
      v18 = 136315650;
      v19 = v9;
      v20 = 2048;
      v21 = a2;
      v22 = 2048;
      v23 = v7;
      _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adv_event_handler (%s): cleanup %p %p", (uint8_t *)&v18, 0x20u);
    }
    v10 = *(void (**)(uint64_t, _QWORD, uint64_t))(a2 + 16);
    if (v10)
    {
      v11 = *(void (**)(uint64_t, _QWORD, uint64_t))(a2 + 40);
      if (v11)
        v11(a2, MEMORY[0x1E0C81260], 4294901727);
      else
        v10(a2, 0, 4294901727);
      *(_QWORD *)(a2 + 16) = 0;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No callback", (uint8_t *)&v18, 2u);
    }
    xpc_release(*(xpc_object_t *)(a2 + 8));
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    if (MEMORY[0x1DF0F31F4]() != MEMORY[0x1E0C812F8])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
        v18 = 136315138;
        v19 = string;
        _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adv_event_handler: Unexpected Connection Error [%s]", (uint8_t *)&v18, 0xCu);
      }
      v5 = *(void (**)(uint64_t, _QWORD, uint64_t))(a2 + 16);
      if (v5)
      {
        v6 = *(void (**)(uint64_t, void *, uint64_t))(a2 + 40);
        if (v6)
          v6(a2, a1, 4294901733);
        else
          v5(a2, 0, 4294901733);
        *(_QWORD *)(a2 + 16) = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adv_event_handler: no callback", (uint8_t *)&v18, 2u);
        }
        xpc_connection_cancel(*(xpc_connection_t *)(a2 + 8));
      }
      return;
    }
    v12 = *(void (**)(uint64_t, void *, _QWORD))(a2 + 40);
    if (v12 || (v12 = *(void (**)(uint64_t, void *, _QWORD))(a2 + 16)) != 0)
    {
      v12(a2, a1, 0);
      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(const char **)(a2 + 56);
      v18 = 136315138;
      v19 = v17;
      v14 = MEMORY[0x1E0C81028];
      v15 = "adv_event_handler (%s): no callback";
      v16 = 12;
      goto LABEL_22;
    }
  }
}

uint64_t advertising_proxy_enable_with_interfaces(_QWORD *a1, NSObject *a2, uint64_t a3, const char **a4, int a5)
{
  uint64_t v5;
  uint64_t v10;
  xpc_object_t empty;
  void *v12;
  xpc_object_t v13;
  void *v14;

  LODWORD(v5) = a5;
  v10 = 4294901757;
  empty = xpc_array_create_empty();
  if (empty)
  {
    v12 = empty;
    if ((int)v5 < 1)
    {
LABEL_6:
      v13 = xpc_dictionary_create_empty();
      if (v13)
      {
        v14 = v13;
        xpc_dictionary_set_value(v13, "permitted-interfaces", v12);
        v10 = adv_send_command_with_dict_(a1, a2, "advertising_proxy_enable", "enable", a3, 0, v14, 506);
        xpc_release(v12);
        v12 = v14;
      }
    }
    else
    {
      v5 = v5;
      while (*a4)
      {
        xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, *a4++);
        if (!--v5)
          goto LABEL_6;
      }
      v10 = 4294901747;
    }
    xpc_release(v12);
  }
  return v10;
}

uint64_t advertising_proxy_set_service_needed(_QWORD *a1, NSObject *a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6, BOOL a7)
{
  xpc_object_t empty;
  void *v15;
  uint64_t result;

  empty = xpc_dictionary_create_empty();
  if (!empty)
    return 4294901757;
  v15 = empty;
  if (a5)
    xpc_dictionary_set_string(empty, "name", a5);
  if (a6)
    xpc_dictionary_set_string(v15, "service-type", a6);
  xpc_dictionary_set_BOOL(v15, "needed", a7);
  result = adv_send_command_with_dict_(a1, a2, "advertising_proxy_set_service_needed", "need service instance", 0, (uint64_t)adv_set_service_needed_callback, v15, 545);
  if (*a1)
  {
    *(_QWORD *)(*a1 + 64) = a4;
    *(_QWORD *)(*a1 + 24) = a3;
  }
  return result;
}

uint64_t adv_set_service_needed_callback(uint64_t result)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  v1 = *(uint64_t (**)(uint64_t, _QWORD))(result + 24);
  if (v1)
    return v1(result, *(_QWORD *)(result + 64));
  return result;
}

uint64_t advertising_proxy_flush_entries(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_flush_entries", "flush entries", a3, 0, 0, 799);
}

uint64_t advertising_proxy_get_service_list(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_get_service_list", "list services", a3, (uint64_t)adv_service_list_callback, 0, 809);
}

void adv_service_list_callback(uint64_t a1, xpc_object_t xdict, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  xpc_object_t value;
  void *v9;
  int *v10;
  void (*v11)(uint64_t, _QWORD, uint64_t);
  int v12;
  NSObject *v13;
  NSObject *v14;
  size_t v15;
  xpc_object_t v16;
  void *v17;
  int *v18;
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  const char *string;
  const char *v24;
  char *v25;
  const char *v26;
  char *v27;
  char *v28;
  void *v29;
  const char *v30;
  char **v31;
  const char *v32;
  const char *v33;
  int v34;
  uint64_t v35;
  xpc_object_t v36;
  void *v37;
  size_t v38;
  void *v39;
  uint64_t v40;
  size_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, int *, _QWORD);
  int v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  const char *v50;
  const char *v51;
  NSObject *v52;
  size_t count;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  _BYTE v58[34];
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a3)
  {
    v4 = a3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v56) = v4;
      v5 = MEMORY[0x1E0C81028];
      v6 = "adv_service_list_callback: error response code %d";
      v7 = 8;
LABEL_11:
      _os_log_impl(&dword_1DEF5C000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  value = xpc_dictionary_get_value(xdict, "instances");
  if (!value)
  {
    v4 = 4294901727;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "adv_service_list_callback: non-error response doesn't contain an instances key";
    goto LABEL_10;
  }
  v9 = value;
  if (MEMORY[0x1DF0F31F4]() != MEMORY[0x1E0C812C8])
  {
    v4 = 4294901727;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "adv_service_list_callback: Non-error response instances value is not an array";
LABEL_10:
    v7 = 2;
    goto LABEL_11;
  }
  count = xpc_array_get_count(v9);
  if (!count)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adv_service_list_callback: No registered services.", buf, 2u);
    }
    v10 = 0;
    v4 = 0;
    goto LABEL_13;
  }
  v15 = 0;
  while (1)
  {
    v16 = xpc_array_get_value(v9, v15);
    if (!v16 || (v17 = v16, MEMORY[0x1DF0F31F4]() != MEMORY[0x1E0C812F8]))
    {
      v4 = 4294901727;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 134217984;
      v56 = (const char *)v15;
      v5 = MEMORY[0x1E0C81028];
      v6 = "adv_service_list_callback: services array[%zd] is not a dictionary";
      v7 = 12;
      goto LABEL_11;
    }
    v18 = (int *)malloc_type_calloc(1uLL, 0x48uLL, 0x10700407CE2CC6FuLL);
    if (!v18)
    {
      v4 = 4294901727;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "adv_ctl_list_callback: no memory for host object";
      goto LABEL_10;
    }
    v10 = v18;
    v19 = global_os_log;
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *v10;
      *(_DWORD *)buf = 136447490;
      v56 = "adv_host_allocate_";
      v57 = 1024;
      *(_DWORD *)v58 = v20;
      *(_WORD *)&v58[4] = 2048;
      *(_QWORD *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(_QWORD *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
      v59 = 1024;
      v60 = 161;
      _os_log_impl(&dword_1DEF5C000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:  retain at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
    }
    v21 = *v10;
    if (*v10)
    {
      v22 = v21 + 1;
      *v10 = v21 + 1;
      if (v21 + 1 >= 10001)
      {
        v13 = global_os_log;
        if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
          goto LABEL_108;
        *(_DWORD *)buf = 136447490;
        v56 = "adv_host_allocate_";
        v57 = 1024;
        *(_DWORD *)v58 = v22;
        *(_WORD *)&v58[4] = 2048;
        *(_QWORD *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(_QWORD *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
        v59 = 1024;
        v60 = 161;
        v51 = "%{public}s: ALLOC: retain at %2.2d: %p (%10s): %s:%d";
LABEL_106:
        v52 = v13;
LABEL_107:
        _os_log_impl(&dword_1DEF5C000, v52, OS_LOG_TYPE_FAULT, v51, buf, 0x36u);
        goto LABEL_108;
      }
    }
    else
    {
      ++adv_host_created;
      *v10 = 1;
    }
    string = xpc_dictionary_get_string(v17, "regname");
    if (string)
      string = strdup(string);
    *((_QWORD *)v10 + 2) = string;
    v24 = xpc_dictionary_get_string(v17, "hostname");
    if (!v24)
      break;
    v25 = strdup(v24);
    *((_QWORD *)v10 + 1) = v25;
    if (!*((_QWORD *)v10 + 2) || !v25)
      goto LABEL_85;
    *((_BYTE *)v10 + 56) = xpc_dictionary_get_BOOL(v17, "removed");
    *((_QWORD *)v10 + 8) = xpc_dictionary_get_int64(v17, "update-server-id");
    v26 = xpc_dictionary_get_string(v17, "name");
    if (v26 && (v27 = strdup(v26)) != 0)
    {
      v28 = v27;
      *((_WORD *)v10 + 20) = 1;
      v29 = malloc_type_calloc(1uLL, 0x30uLL, 0x1050040D8A327FFuLL);
      *((_QWORD *)v10 + 6) = v29;
      if (!v29)
      {
        v4 = 4294901727;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        *(_WORD *)buf = 0;
        v49 = MEMORY[0x1E0C81028];
        v50 = "adv_service_list_callback: no memory for instance object.";
        goto LABEL_87;
      }
      v30 = xpc_dictionary_get_string(v17, "regtype");
      if (v30)
        v30 = strdup(v30);
      v31 = (char **)*((_QWORD *)v10 + 6);
      v31[2] = (char *)v30;
      *v31 = v28;
      v32 = xpc_dictionary_get_string(v17, "type");
      if (v32)
        v32 = strdup(v32);
      *(_QWORD *)(*((_QWORD *)v10 + 6) + 8) = v32;
      v33 = xpc_dictionary_get_string(v17, "port");
      if (v33)
      {
        v34 = atoi(v33);
        if (v34 >= 0x10000)
        {
          v4 = 4294901727;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_13;
          *(_WORD *)buf = 0;
          v49 = MEMORY[0x1E0C81028];
          v50 = "adv_service_list_callback: invalid port.";
LABEL_87:
          _os_log_impl(&dword_1DEF5C000, v49, OS_LOG_TYPE_DEFAULT, v50, buf, 2u);
          goto LABEL_13;
        }
        v35 = *((_QWORD *)v10 + 6);
        *(_WORD *)(v35 + 24) = v34;
      }
      else
      {
        v35 = *((_QWORD *)v10 + 6);
      }
      if (!*(_QWORD *)(v35 + 8))
      {
        v4 = 4294901727;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        *(_WORD *)buf = 0;
        v49 = MEMORY[0x1E0C81028];
        v50 = "adv_ctl_list_callback: service type not provided";
        goto LABEL_87;
      }
    }
    else
    {
      *((_WORD *)v10 + 20) = 0;
    }
    v36 = xpc_dictionary_get_value(v17, "addresses");
    if (v36)
    {
      v37 = v36;
      v38 = xpc_array_get_count(v36);
      if (v38 >= 0x65)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v56 = (const char *)v38;
          _os_log_error_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "adv_services_list_callback: too many addresses: %zd", buf, 0xCu);
        }
        v38 = 100;
      }
      *((_WORD *)v10 + 12) = v38;
      v39 = malloc_type_calloc(v38, 0x18uLL, 0x105004022079F3DuLL);
      *((_QWORD *)v10 + 4) = v39;
      if (!v39)
      {
        v4 = 4294901727;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "adv_service_list_callback: no memory for address object.", buf, 2u);
        }
        goto LABEL_13;
      }
      if (*((_WORD *)v10 + 12))
      {
        v40 = 0;
        v41 = 0;
        do
        {
          v42 = xpc_array_get_string(v37, v41);
          v43 = *((_QWORD *)v10 + 4);
          *(_WORD *)(v43 + v40) = 0;
          if (v42)
            v42 = strdup(v42);
          v44 = v43 + v40;
          *(_QWORD *)(v44 + 8) = v42;
          *(_WORD *)(v44 + 16) = 0;
          ++v41;
          v40 += 24;
        }
        while (v41 < *((unsigned __int16 *)v10 + 12));
      }
    }
    v10[7] = xpc_dictionary_get_int64(v17, "lease");
    v45 = *(void (**)(uint64_t, int *, _QWORD))(a1 + 16);
    if (v45)
      v45(a1, v10, 0);
    v46 = *v10;
    if (!*v10)
    {
      v13 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136447490;
        v56 = "adv_service_list_callback";
        v57 = 1024;
        *(_DWORD *)v58 = 0;
        *(_WORD *)&v58[4] = 2048;
        *(_QWORD *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(_QWORD *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
        v59 = 1024;
        v60 = 227;
        v51 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
        goto LABEL_106;
      }
LABEL_108:
      abort();
    }
    v47 = global_os_log;
    if (v46 >= 10001)
    {
      if (!os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
        goto LABEL_108;
      *(_DWORD *)buf = 136447490;
      v56 = "adv_service_list_callback";
      v57 = 1024;
      *(_DWORD *)v58 = v46;
      *(_WORD *)&v58[4] = 2048;
      *(_QWORD *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(_QWORD *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
      v59 = 1024;
      v60 = 227;
      v51 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
      v52 = v47;
      goto LABEL_107;
    }
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447490;
      v56 = "adv_service_list_callback";
      v57 = 1024;
      *(_DWORD *)v58 = v46;
      *(_WORD *)&v58[4] = 2048;
      *(_QWORD *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(_QWORD *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
      v59 = 1024;
      v60 = 227;
      _os_log_impl(&dword_1DEF5C000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
      v46 = *v10;
    }
    *v10 = v46 - 1;
    if (v46 == 1)
    {
      v48 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v56 = "adv_service_list_callback";
        v57 = 2048;
        *(_QWORD *)v58 = v10;
        *(_WORD *)&v58[8] = 2080;
        *(_QWORD *)&v58[10] = "host";
        *(_WORD *)&v58[18] = 2080;
        *(_QWORD *)&v58[20] = "advertising_proxy_services.c";
        *(_WORD *)&v58[28] = 1024;
        *(_DWORD *)&v58[30] = 227;
        _os_log_impl(&dword_1DEF5C000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", buf, 0x30u);
      }
      ++adv_host_finalized;
      adv_host_finalize(v10);
    }
    v10 = 0;
    v4 = 0;
    if (++v15 == count)
      goto LABEL_13;
  }
  *((_QWORD *)v10 + 1) = 0;
LABEL_85:
  v4 = 4294901727;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v49 = MEMORY[0x1E0C81028];
    v50 = "adv_ctl_list_callback: regname or hostname not provided";
    goto LABEL_87;
  }
LABEL_13:
  v11 = *(void (**)(uint64_t, _QWORD, uint64_t))(a1 + 16);
  if (v11)
    v11(a1, 0, v4);
  if (v10)
  {
    v12 = *v10;
    if (!*v10)
    {
      v13 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136447490;
        v56 = "adv_service_list_callback";
        v57 = 1024;
        *(_DWORD *)v58 = 0;
        *(_WORD *)&v58[4] = 2048;
        *(_QWORD *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(_QWORD *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
        v59 = 1024;
        v60 = 237;
        v51 = "%{public}s: ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d";
        goto LABEL_106;
      }
      goto LABEL_108;
    }
    v13 = global_os_log;
    if (v12 >= 10001)
    {
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136447490;
        v56 = "adv_service_list_callback";
        v57 = 1024;
        *(_DWORD *)v58 = v12;
        *(_WORD *)&v58[4] = 2048;
        *(_QWORD *)&v58[6] = v10;
        *(_WORD *)&v58[14] = 2080;
        *(_QWORD *)&v58[16] = "host";
        *(_WORD *)&v58[24] = 2080;
        *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
        v59 = 1024;
        v60 = 237;
        v51 = "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d";
        goto LABEL_106;
      }
      goto LABEL_108;
    }
    if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447490;
      v56 = "adv_service_list_callback";
      v57 = 1024;
      *(_DWORD *)v58 = v12;
      *(_WORD *)&v58[4] = 2048;
      *(_QWORD *)&v58[6] = v10;
      *(_WORD *)&v58[14] = 2080;
      *(_QWORD *)&v58[16] = "host";
      *(_WORD *)&v58[24] = 2080;
      *(_QWORD *)&v58[26] = "advertising_proxy_services.c";
      v59 = 1024;
      v60 = 237;
      _os_log_impl(&dword_1DEF5C000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC: release at %2.2d: %p (%10s): %s:%d", buf, 0x36u);
      v12 = *v10;
    }
    *v10 = v12 - 1;
    if (v12 == 1)
    {
      v14 = global_os_log;
      if (os_log_type_enabled((os_log_t)global_os_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v56 = "adv_service_list_callback";
        v57 = 2048;
        *(_QWORD *)v58 = v10;
        *(_WORD *)&v58[8] = 2080;
        *(_QWORD *)&v58[10] = "host";
        *(_WORD *)&v58[18] = 2080;
        *(_QWORD *)&v58[20] = "advertising_proxy_services.c";
        *(_WORD *)&v58[28] = 1024;
        *(_DWORD *)&v58[30] = 237;
        _os_log_impl(&dword_1DEF5C000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: ALLOC:      finalize: %p (%10s): %s:%d", buf, 0x30u);
      }
      ++adv_host_finalized;
      adv_host_finalize(v10);
    }
  }
}

void adv_host_finalize(_QWORD *a1)
{
  void *v2;

  v2 = (void *)a1[4];
  if (v2)
    free(v2);
  free(a1);
}

uint64_t advertising_proxy_block_service(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_block_service", "block service", a3, 0, 0, 819);
}

uint64_t advertising_proxy_unblock_service(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_unblock_service", "unblock service", a3, 0, 0, 829);
}

uint64_t advertising_proxy_regenerate_ula(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_regenerate_ula", "regenerate ULA", a3, 0, 0, 839);
}

uint64_t advertising_proxy_advertise_prefix(_QWORD *a1, int a2, NSObject *a3, uint64_t a4)
{
  char *v5;
  NSObject *v6;
  int v7;

  if (a2)
  {
    v5 = "advertise prefix high priority";
    v6 = a3;
    v7 = 850;
  }
  else
  {
    v5 = "advertise prefix";
    v6 = a3;
    v7 = 853;
  }
  return adv_send_command_with_dict_(a1, v6, "advertising_proxy_advertise_prefix", v5, a4, 0, 0, v7);
}

uint64_t advertising_proxy_add_prefix(_QWORD *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_add_prefix", "add prefix", a3, 0, a4, a5, 865);
}

uint64_t adv_send_command_with_data_(_QWORD *a1, NSObject *a2, const char *a3, char *a4, uint64_t a5, uint64_t a6, const void *a7, size_t a8, int a9)
{
  xpc_object_t v17;
  void *v18;
  uint64_t v19;
  uint8_t v21[16];

  v17 = xpc_dictionary_create(0, 0, 0);
  if (v17)
  {
    v18 = v17;
    if (a7)
    {
      if (a8)
        xpc_dictionary_set_data(v17, "data", a7, a8);
    }
    v19 = adv_send_command_with_dict_(a1, a2, a3, a4, a5, a6, v18, a9);
    xpc_release(v18);
    return v19;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dns_services: init_connection() No memory to allocate!", v21, 2u);
    }
    return 4294901757;
  }
}

uint64_t advertising_proxy_remove_prefix(_QWORD *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_remove_prefix", "remove prefix", a3, 0, a4, a5, 876);
}

uint64_t advertising_proxy_add_nat64_prefix(_QWORD *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_add_nat64_prefix", "add nat64 prefix", a3, 0, a4, a5, 887);
}

uint64_t advertising_proxy_remove_nat64_prefix(_QWORD *a1, NSObject *a2, uint64_t a3, const void *a4, size_t a5)
{
  return adv_send_command_with_data_(a1, a2, "advertising_proxy_remove_nat64_prefix", "remove nat64 prefix", a3, 0, a4, a5, 898);
}

uint64_t advertising_proxy_stop(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_stop", "stop", a3, 0, 0, 908);
}

uint64_t advertising_proxy_get_ula(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_get_ula", "get ula", a3, (uint64_t)adv_ula_callback, 0, 918);
}

void adv_ula_callback(uint64_t a1, xpc_object_t xdict, uint64_t a3)
{
  void (*v5)(uint64_t, _QWORD *, uint64_t);
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!(_DWORD)a3)
  {
    v9[0] = xpc_dictionary_get_uint64(xdict, "ula");
    v5 = *(void (**)(uint64_t, _QWORD *, uint64_t))(a1 + 16);
    if (!v5)
      return;
    v7 = v9;
    v6 = a1;
    v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v9[0]) = 67109120;
    HIDWORD(v9[0]) = a3;
    _os_log_impl(&dword_1DEF5C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "adv_service_list_callback: error response code %d", (uint8_t *)v9, 8u);
  }
  v5 = *(void (**)(uint64_t, _QWORD *, uint64_t))(a1 + 16);
  if (v5)
  {
    v6 = a1;
    v7 = 0;
    v8 = a3;
LABEL_8:
    v5(v6, v7, v8);
  }
}

uint64_t advertising_proxy_disable_srp_replication(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_srp_replication", "disable SRP replication", a3, 0, 0, 928);
}

uint64_t advertising_proxy_drop_srpl_connection(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_drop_srpl_connection", "drop srpl connection", a3, 0, 0, 938);
}

uint64_t advertising_proxy_undrop_srpl_connection(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_undrop_srpl_connection", "undrop srpl connection", a3, 0, 0, 948);
}

uint64_t advertising_proxy_drop_srpl_advertisement(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_drop_srpl_advertisement", "drop srpl advertisement", a3, 0, 0, 958);
}

uint64_t advertising_proxy_undrop_srpl_advertisement(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_undrop_srpl_advertisement", "undrop srpl advertisement", a3, 0, 0, 968);
}

uint64_t advertising_proxy_start_dropping_push_connections(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_start_dropping_push_connections", "start dropping push connections", a3, 0, 0, 978);
}

uint64_t advertising_proxy_start_breaking_time_validation(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_start_breaking_time_validation", "start breaking time validation", a3, 0, 0, 988);
}

uint64_t advertising_proxy_block_anycast_service(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_block_anycast_service", "block anycast service", a3, 0, 0, 998);
}

uint64_t advertising_proxy_unblock_anycast_service(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_disable_unblock_anycast_service", "unblock anycast service", a3, 0, 0, 1008);
}

uint64_t advertising_proxy_start_thread_shutdown(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  return adv_send_command_with_dict_(a1, a2, "advertising_proxy_start_thread_shutdown", "start thread shutdown", a3, 0, 0, 1018);
}

uint64_t advertising_proxy_set_variable(_QWORD *a1, NSObject *a2, uint64_t a3, uint64_t a4, char *__s, const char *a6)
{
  size_t v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  size_t v17;
  uint64_t v18;

  v12 = strlen(__s);
  v13 = strlen(a6);
  v14 = v12 + v13 + 2;
  v15 = (char *)malloc_type_malloc(v14, 0x916CC240uLL);
  if (!v15)
    return 4294901757;
  v16 = v15;
  v17 = v12 + 1;
  memcpy(v15, __s, v17);
  memcpy(&v16[v17], a6, v13 + 1);
  v18 = adv_send_command_with_data_(a1, a2, "advertising_proxy_get_service_list", "set variable", 0, (uint64_t)adv_set_variable_callback, v16, v14, 1046);
  free(v16);
  if (!(_DWORD)v18)
  {
    *(_QWORD *)(*a1 + 64) = a4;
    *(_QWORD *)(*a1 + 32) = a3;
  }
  return v18;
}

uint64_t adv_set_variable_callback(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, _QWORD, uint64_t, uint64_t);

  v3 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(result + 32);
  if (v3)
    return v3(result, *(_QWORD *)(result + 64), a2, a3);
  return result;
}

uint64_t dnssd_copy_description(uint64_t a1)
{
  _QWORD *v1;
  uint64_t (*v2)(void);

  v1 = (_QWORD *)(a1 + 16);
  while (1)
  {
    v1 = (_QWORD *)*v1;
    if (!v1)
      break;
    v2 = (uint64_t (*)(void))v1[2];
    if (v2)
      return v2();
  }
  return 0;
}

void ___dnssd_getaddrinfo_activate_block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[14];
  if (v3)
  {
    v4 = *(_DWORD *)(a1 + 40);
    v5 = v4 + 6729;
    if (v4 == -6705)
      v4 = -65540;
    if (v5 >= 2)
      v6 = v4;
    else
      v6 = 4294901757;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, 1, v6);
    v2 = *(_QWORD **)(a1 + 32);
  }
  os_release(v2);
}

void _dnssd_client_fail_getaddrinfo(void *object, int a2)
{
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  _QWORD v9[5];
  int v10;

  v4 = &g_gai_list;
  do
  {
    v5 = v4;
    v6 = (void *)*v4;
    v4 = (uint64_t *)(*v4 + 24);
    if (v6)
      v7 = v6 == object;
    else
      v7 = 1;
  }
  while (!v7);
  if (v6)
  {
    *v5 = *((_QWORD *)object + 3);
    *((_QWORD *)object + 3) = 0;
    os_release(object);
  }
  *((_DWORD *)object + 34) = 3;
  v8 = *((_QWORD *)object + 6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___dnssd_getaddrinfo_post_error_event_block_invoke;
  v9[3] = &__block_descriptor_tmp_48;
  v9[4] = object;
  v10 = a2;
  dispatch_sync(v8, v9);
  dispatch_source_merge_data(*((dispatch_source_t *)object + 11), 4uLL);
}

uint64_t ___dnssd_getaddrinfo_post_error_event_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 140) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t ___dnssd_getaddrinfo_result_create_svcb_block_invoke_2(uint64_t a1, unsigned __int8 *bytes)
{
  xpc_object_t v3;
  void *v4;

  v3 = xpc_data_create(bytes, *bytes);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = xpc_array_create(0, 0);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  }
  xpc_array_append_value(v4, v3);
  if (v3)
    xpc_release(v3);
  return 1;
}

_QWORD *___dnssd_get_empty_cname_array_block_invoke()
{
  _QWORD *result;

  result = _dnssd_cname_array_create(0, 0);
  _dnssd_get_empty_cname_array_s_empty_cname_array = (uint64_t)result;
  *((_DWORD *)result + 2) = 0x7FFFFFFF;
  *((_DWORD *)result + 3) = 0x7FFFFFFF;
  return result;
}

void *_dnssd_getaddrinfo_result_copy_description(uint64_t a1, int a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v11;
  const char *string_ptr;
  const char *v13;
  int v14;
  unsigned int v15;
  size_t v16;
  char *v17;
  char *v18;
  size_t v19;
  void *v20;
  size_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  _BYTE *v26;
  char v28[8];
  char __s[64];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = *(void **)(a1 + 64);
  if (v11)
  {
    string_ptr = xpc_string_get_string_ptr(v11);
    if ((a3 & (string_ptr != 0)) != 0)
      v13 = "<redacted hostname>";
    else
      v13 = string_ptr;
  }
  else
  {
    v13 = 0;
  }
  v14 = *(unsigned __int8 *)(a1 + 33);
  if (v14 == 30)
  {
    if ((a3 & 1) == 0)
    {
      if (inet_ntop(30, (const void *)(a1 + 40), __s, 0x40u))
      {
        v15 = *(_DWORD *)(a1 + 56);
        if (v15)
        {
          v16 = strlen(__s);
          v17 = &__s[v16];
          v18 = if_indextoname(v15, v28);
          v19 = 64 - v16;
          if (v18)
            snprintf(v17, v19, "%%%s");
          else
            snprintf(v17, v19, "%%%u");
        }
      }
    }
  }
  else if (v14 == 2 && (a3 & 1) == 0)
  {
    inet_ntop(2, (const void *)(a1 + 36), __s, 0x40u);
  }
  v20 = 0;
  v21 = 0;
  if (!v13)
    v13 = "<NO HOSTNAME>";
  while (1)
  {
    *(_QWORD *)v28 = v20;
    v22 = (uint64_t)v20 + v21;
    if (a2)
    {
      v23 = _dnssd_snprintf((char **)v28, v22, "dnssd_%s (%p): ", a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8));
      if ((v23 & 0x80000000) != 0)
        break;
      v24 = v23;
    }
    else
    {
      v24 = 0;
    }
    v25 = _dnssd_snprintf((char **)v28, v22, "hostname: %s, address: %s, type: %s, ifindex: %lu", a4, a5, a6, a7, a8, (char)v13);
    if ((v25 & 0x80000000) != 0)
      break;
    if (v20)
      return v20;
    v21 = v24 + v25 + 1;
    v26 = malloc_type_malloc(v21, 0xA172743EuLL);
    if (!v26)
      __break(1u);
    v20 = v26;
    *v26 = 0;
  }
  if (v20)
  {
    free(v20);
    return 0;
  }
  return v20;
}

uint64_t _dnssd_cname_array_copy_description(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  char **v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  char **v24;
  void *v25;
  unsigned int v26;
  void *v27;
  uint64_t result;
  uint64_t v29;
  char v30;
  char v31;
  _QWORD applier[8];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char **v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;

  v11 = 0;
  v12 = 0;
  v13 = "[";
  while (1)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2000000000;
    v44 = 0;
    v37 = 0;
    v38 = (char **)&v37;
    v39 = 0x2000000000;
    v40 = v11;
    v14 = (uint64_t)&v11[v12];
    v33 = 0;
    v34 = &v33;
    v35 = 0x2000000000;
    v15 = &v40;
    v36 = 0;
    if (a2)
    {
      v16 = _dnssd_snprintf(&v40, v14, "dnssd_%s (%p): ", a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8));
      *((_DWORD *)v42 + 6) = v16;
      if ((v16 & 0x80000000) != 0)
        goto LABEL_20;
      v34[3] += v16;
      v15 = v38 + 3;
    }
    v17 = _dnssd_snprintf(v15, v14, v13, a4, a5, a6, a7, a8, v30);
    *((_DWORD *)v42 + 6) = v17;
    if ((v17 & 0x80000000) != 0)
    {
LABEL_20:
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);
      if (v11)
      {
        free(v11);
        return 0;
      }
      return (uint64_t)v11;
    }
    v34[3] += v17;
    if (a3)
    {
      v23 = v13;
      v24 = v38;
      v25 = *(void **)(a1 + 24);
      if (v25)
        LOBYTE(v25) = xpc_array_get_count(v25);
      v26 = _dnssd_snprintf(v24 + 3, v14, "<%zu redacted cnames>", v18, v19, v20, v21, v22, (char)v25);
      *((_DWORD *)v42 + 6) = v26;
      v13 = v23;
      if ((v26 & 0x80000000) != 0)
        goto LABEL_20;
      v34[3] += v26;
    }
    else
    {
      v27 = *(void **)(a1 + 24);
      if (v27)
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 0x40000000;
        applier[2] = ___dnssd_cname_array_copy_description_block_invoke;
        applier[3] = &unk_1EA96F788;
        applier[4] = &v41;
        applier[5] = &v37;
        applier[6] = &v33;
        applier[7] = v14;
        if (!xpc_array_apply(v27, applier))
          goto LABEL_20;
      }
    }
    result = _dnssd_snprintf(v38 + 3, v14, "]", v18, v19, v20, v21, v22, v31);
    *((_DWORD *)v42 + 6) = result;
    if ((result & 0x80000000) != 0)
      goto LABEL_20;
    v29 = v34[3] + result;
    v34[3] = v29;
    if (v11)
    {
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);
      return (uint64_t)v11;
    }
    v12 = v29 + 1;
    if (v29 == -1)
      break;
    result = (uint64_t)malloc_type_malloc(v29 + 1, 0xA172743EuLL);
    if (!result)
      break;
    v11 = (char *)result;
    *(_BYTE *)result = 0;
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }
  __break(1u);
  return result;
}

BOOL ___dnssd_cname_array_copy_description_block_invoke(_QWORD *a1, uint64_t a2, xpc_object_t xstring)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  xpc_string_get_string_ptr(xstring);
  v10 = (const char *)&unk_1DEF6A44F;
  if (a2)
    v10 = ", ";
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = _dnssd_snprintf((char **)(*(_QWORD *)(a1[5] + 8) + 24), a1[7], "%s%s", v5, v6, v7, v8, v9, (char)v10);
  v11 = *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24);
  if ((v11 & 0x80000000) == 0)
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v11;
  return (int)v11 >= 0;
}

uint64_t ___dnssd_getaddrinfo_process_events_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(v1 + 140);
  *(_DWORD *)(v1 + 140) = 0;
  return result;
}

void dnssd_getaddrinfo_set_delegate_pid(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 56), "delegate_id", a2);
}

void dnssd_getaddrinfo_set_need_encrypted_query(uint64_t a1, BOOL value, void *a3)
{
  void *v4;

  if (!*(_BYTE *)(a1 + 144))
  {
    v4 = *(void **)(a1 + 56);
    xpc_dictionary_set_BOOL(v4, "need_encryption", value);
    if (a3)
      xpc_dictionary_set_value(v4, "fallback_config", a3);
  }
}

void dnssd_getaddrinfo_add_resolver_uuid(uint64_t a1, const unsigned __int8 *a2)
{
  void *v3;
  xpc_object_t value;

  if (!*(_BYTE *)(a1 + 144))
  {
    v3 = *(void **)(a1 + 56);
    value = xpc_dictionary_get_value(v3, "resolver_uuids");
    if (!value)
    {
      value = xpc_array_create(0, 0);
      xpc_dictionary_set_value(v3, "resolver_uuids", value);
      if (value)
        xpc_release(value);
    }
    xpc_array_set_uuid(value, 0xFFFFFFFFFFFFFFFFLL, a2);
  }
}

void dnssd_getaddrinfo_set_validation_data(uint64_t a1, void *bytes, size_t length)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 56), "validation_data", bytes, length);
}

void dnssd_getaddrinfo_prohibit_encrypted_dns(uint64_t a1, BOOL value)
{
  if (!*(_BYTE *)(a1 + 144))
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 56), "prohibit_encrypted_dns", value);
}

const char *dnssd_getaddrinfo_result_get_doh_path(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 120));
}

uint64_t __dnssd_getaddrinfo_result_enumerate_service_address_hints_block_invoke(uint64_t a1, int a2, xpc_object_t xdata)
{
  xpc_data_get_bytes_ptr(xdata);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const void *dnssd_getaddrinfo_result_get_odoh_config(uint64_t a1, _QWORD *a2)
{
  void *length;
  const void *bytes_ptr;

  length = *(void **)(a1 + 128);
  if (!length)
  {
    bytes_ptr = 0;
    if (!a2)
      return bytes_ptr;
    goto LABEL_3;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(length);
  length = (void *)xpc_data_get_length(*(xpc_object_t *)(a1 + 128));
  if (a2)
LABEL_3:
    *a2 = length;
  return bytes_ptr;
}

uint64_t dnssd_getaddrinfo_result_get_extended_dns_error_code(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 204);
}

char *dnssd_getaddrinfo_result_get_extended_dns_error_text(uint64_t a1)
{
  char *result;

  result = *(char **)(a1 + 176);
  if (result)
    result = (char *)xpc_string_get_string_ptr(result);
  if (!result)
    return (char *)&unk_1DEF6A44F;
  return result;
}

uint64_t __dnssd_svcb_is_valid_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  if (a2 && a3)
  {
    if ((a3 & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
    else
    {
      v3 = (unsigned __int16)(a3 >> 1);
      if ((unsigned __int16)(a3 >> 1))
      {
        do
        {
          v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          if (*(_BYTE *)(v4 + 24))
            break;
          v5 = bswap32(*a2) >> 16;
          if (v5 - 1 >= 7 && v5 - 0x8000 >= 2)
            *(_BYTE *)(v4 + 24) = 1;
          ++a2;
          --v3;
        }
        while (v3);
      }
    }
  }
  return 0;
}

uint64_t __dnssd_svcb_get_port_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3 == 2)
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = bswap32(*a2) >> 16;
  return 0;
}

uint64_t __dnssd_svcb_copy_doh_uri_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3)
    asprintf((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "%.*s", a3, a2);
  return 0;
}

uint64_t __dnssd_svcb_copy_doh_path_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3)
    asprintf((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "%.*s", a3, a2);
  return 0;
}

void *__dnssd_svcb_copy_ech_config_block_invoke(uint64_t a1, const void *a2, size_t size)
{
  void *result;

  if (!a2 || !size)
    return 0;
  result = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    **(_QWORD **)(a1 + 40) = size;
    memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, size);
    return 0;
  }
  __break(1u);
  return result;
}

void *__dnssd_svcb_copy_odoh_config_block_invoke(uint64_t a1, const void *a2, size_t size)
{
  void *result;

  if (!a2 || !size)
    return 0;
  result = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    **(_QWORD **)(a1 + 40) = size;
    memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, size);
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t __dnssd_svcb_access_address_hints_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 3) == 0)
  {
    v6 = 0;
    do
    {
      if (v6 >= a3)
        break;
      v9 = 0;
      v8 = 528;
      HIDWORD(v8) = *(_DWORD *)(a2 + v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v6 += 4;
    }
    while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  return 0;
}

uint64_t __dnssd_svcb_access_address_hints_block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v9;
  __int128 v10;
  int v11;

  if (a2 && (a3 & 0xF) == 0)
  {
    v7 = 0;
    do
    {
      if (v7 >= a3)
        break;
      v10 = 0uLL;
      v11 = 0;
      v9 = 7708;
      v10 = *(_OWORD *)(a2 + v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(_QWORD, uint64_t *, unint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), &v9, a3, a4);
      v7 += 16;
    }
    while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  return 0;
}

uint64_t advertising_proxy_resolver_init(uint64_t a1)
{
  uint64_t v1;

  v1 = MEMORY[0x1E0C81028];
  if (a1)
    v1 = a1;
  advertising_proxy_global_os_log = v1;
  return 0;
}

uint64_t advertising_proxy_subscription_retain_(int *a1, char *a2, int a3)
{
  NSObject *v6;
  int v7;
  int v8;
  NSObject *v9;
  char *v10;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v7 = *a1;
      *(_DWORD *)buf = 136447490;
      v14 = "advertising_proxy_subscription_retain_";
      v15 = 1024;
      v16 = v7;
      v17 = 2048;
      v18 = a1;
      v19 = 2080;
      v20 = "subscription";
      v21 = 2080;
      v22 = strrchr(a2, 47) + 1;
      v23 = 1024;
      v24 = a3;
      _os_log_impl(&dword_1DEF5C000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    }
    if (*a1)
    {
      v8 = *a1 + 1;
      *a1 = v8;
      if (v8 >= 10001)
      {
        v12 = v8;
        v9 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          v10 = strrchr(a2, 47);
          *(_DWORD *)buf = 136447490;
          v14 = "advertising_proxy_subscription_retain_";
          v15 = 1024;
          v16 = v12;
          v17 = 2048;
          v18 = a1;
          v19 = 2080;
          v20 = "subscription";
          v21 = 2080;
          v22 = v10 + 1;
          v23 = 1024;
          v24 = a3;
          _os_log_impl(&dword_1DEF5C000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
        }
        abort();
      }
    }
    else
    {
      ++advertising_proxy_subscription_created;
      *a1 = 1;
    }
  }
  return 0;
}

uint64_t advertising_proxy_subscription_release_(_QWORD *a1, char *a2, int a3)
{
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  char *v10;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _BYTE v16[34];
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    v7 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v13 = 136447490;
    v14 = "advertising_proxy_subscription_release_";
    v15 = 1024;
    *(_DWORD *)v16 = 0;
    *(_WORD *)&v16[4] = 2048;
    *(_QWORD *)&v16[6] = a1;
    *(_WORD *)&v16[14] = 2080;
    *(_QWORD *)&v16[16] = "subscription";
    *(_WORD *)&v16[24] = 2080;
    *(_QWORD *)&v16[26] = strrchr(a2, 47) + 1;
    v17 = 1024;
    v18 = a3;
    v12 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_15;
  }
  v7 = advertising_proxy_global_os_log;
  v8 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v6 >= 10001)
  {
    if (!v8)
      goto LABEL_16;
    v13 = 136447490;
    v14 = "advertising_proxy_subscription_release_";
    v15 = 1024;
    *(_DWORD *)v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(_QWORD *)&v16[6] = a1;
    *(_WORD *)&v16[14] = 2080;
    *(_QWORD *)&v16[16] = "subscription";
    *(_WORD *)&v16[24] = 2080;
    *(_QWORD *)&v16[26] = strrchr(a2, 47) + 1;
    v17 = 1024;
    v18 = a3;
    v12 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_15:
    _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 0x36u);
LABEL_16:
    abort();
  }
  if (v8)
  {
    v13 = 136447490;
    v14 = "advertising_proxy_subscription_release_";
    v15 = 1024;
    *(_DWORD *)v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(_QWORD *)&v16[6] = a1;
    *(_WORD *)&v16[14] = 2080;
    *(_QWORD *)&v16[16] = "subscription";
    *(_WORD *)&v16[24] = 2080;
    *(_QWORD *)&v16[26] = strrchr(a2, 47) + 1;
    v17 = 1024;
    v18 = a3;
    _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v13, 0x36u);
    v6 = *(_DWORD *)a1;
  }
  *(_DWORD *)a1 = v6 - 1;
  if (v6 == 1)
  {
    v9 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v10 = strrchr(a2, 47);
      v13 = 136447234;
      v14 = "advertising_proxy_subscription_release_";
      v15 = 2048;
      *(_QWORD *)v16 = a1;
      *(_WORD *)&v16[8] = 2080;
      *(_QWORD *)&v16[10] = "subscription";
      *(_WORD *)&v16[18] = 2080;
      *(_QWORD *)&v16[20] = v10 + 1;
      *(_WORD *)&v16[28] = 1024;
      *(_DWORD *)&v16[30] = a3;
      _os_log_impl(&dword_1DEF5C000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v13, 0x30u);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(a1);
  }
  return 0;
}

void advertising_proxy_subscription_finalize(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a1[3];
  if (v2)
  {
    v3 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v8 = 136446466;
      v9 = "advertising_proxy_subscription_finalize";
      v10 = 2048;
      v11 = v2;
      _os_log_impl(&dword_1DEF5C000, v3, OS_LOG_TYPE_INFO, "%{public}s: \"subscription->local_instance is not NULL (%p)\"", (uint8_t *)&v8, 0x16u);
    }
  }
  v4 = a1[4];
  if (v4)
  {
    v5 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v8 = 136446466;
      v9 = "advertising_proxy_subscription_finalize";
      v10 = 2048;
      v11 = v4;
      _os_log_impl(&dword_1DEF5C000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"subscription->push_instance is not NULL (%p)\"", (uint8_t *)&v8, 0x16u);
    }
  }
  v6 = a1[5];
  if (v6)
  {
    v7 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v8 = 136446466;
      v9 = "advertising_proxy_subscription_finalize";
      v10 = 2048;
      v11 = v6;
      _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"subscription->service is not NULL (%p)\"", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t advertising_proxy_subscription_cancel(_QWORD *a1)
{
  _QWORD *v2;
  int *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _QWORD *v8;
  int *v9;
  int v10;
  _BOOL4 v11;
  NSObject *v12;
  _QWORD *v13;
  _DNSServiceRef_t *v14;
  _DNSServiceRef_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  _QWORD *v22;
  NSObject *v23;
  int *v24;
  int v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  int v32;
  const char *v33;
  __int16 v34;
  _BYTE v35[34];
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)a1[3];
  if (v2)
  {
    adv_instance_unsubscribe(v2, a1);
    v3 = (int *)a1[3];
    if (v3)
    {
      v4 = *v3;
      if (!*v3)
      {
        v29 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_70;
        v32 = 136447490;
        v33 = "advertising_proxy_subscription_cancel";
        v34 = 1024;
        *(_DWORD *)v35 = 0;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = v3;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "subscription->local_instance";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 309;
        v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_65;
      }
      v5 = advertising_proxy_global_os_log;
      v6 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v4 >= 10001)
      {
        if (!v6)
          goto LABEL_70;
        v32 = 136447490;
        v33 = "advertising_proxy_subscription_cancel";
        v34 = 1024;
        *(_DWORD *)v35 = v4;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = v3;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "subscription->local_instance";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 309;
        v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_68;
      }
      if (v6)
      {
        v32 = 136447490;
        v33 = "advertising_proxy_subscription_cancel";
        v34 = 1024;
        *(_DWORD *)v35 = v4;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = v3;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "subscription->local_instance";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 309;
        _os_log_impl(&dword_1DEF5C000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
        v3 = (int *)a1[3];
        v4 = *v3;
      }
      *v3 = v4 - 1;
      if (v4 == 1)
      {
        v7 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          v32 = 136447234;
          v33 = "advertising_proxy_subscription_cancel";
          v34 = 2048;
          *(_QWORD *)v35 = v3;
          *(_WORD *)&v35[8] = 2080;
          *(_QWORD *)&v35[10] = "subscription->local_instance";
          *(_WORD *)&v35[18] = 2080;
          *(_QWORD *)&v35[20] = "adv-resolve.c";
          *(_WORD *)&v35[28] = 1024;
          *(_DWORD *)&v35[30] = 309;
          _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
          v3 = (int *)a1[3];
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize((uint64_t)v3);
      }
    }
    a1[3] = 0;
  }
  v8 = (_QWORD *)a1[4];
  if (v8)
  {
    adv_instance_unsubscribe(v8, a1);
    v9 = (int *)a1[4];
    if (v9)
    {
      v10 = *v9;
      if (!*v9)
      {
        v29 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_70;
        v32 = 136447490;
        v33 = "advertising_proxy_subscription_cancel";
        v34 = 1024;
        *(_DWORD *)v35 = 0;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = v9;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "subscription->push_instance";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 314;
        v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_65;
      }
      v5 = advertising_proxy_global_os_log;
      v11 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v10 >= 10001)
      {
        if (!v11)
          goto LABEL_70;
        v32 = 136447490;
        v33 = "advertising_proxy_subscription_cancel";
        v34 = 1024;
        *(_DWORD *)v35 = v10;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = v9;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "subscription->push_instance";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 314;
        v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_68;
      }
      if (v11)
      {
        v32 = 136447490;
        v33 = "advertising_proxy_subscription_cancel";
        v34 = 1024;
        *(_DWORD *)v35 = v10;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = v9;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "subscription->push_instance";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 314;
        _os_log_impl(&dword_1DEF5C000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
        v9 = (int *)a1[4];
        v10 = *v9;
      }
      *v9 = v10 - 1;
      if (v10 == 1)
      {
        v12 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          v32 = 136447234;
          v33 = "advertising_proxy_subscription_cancel";
          v34 = 2048;
          *(_QWORD *)v35 = v9;
          *(_WORD *)&v35[8] = 2080;
          *(_QWORD *)&v35[10] = "subscription->push_instance";
          *(_WORD *)&v35[18] = 2080;
          *(_QWORD *)&v35[20] = "adv-resolve.c";
          *(_WORD *)&v35[28] = 1024;
          *(_DWORD *)&v35[30] = 314;
          _os_log_impl(&dword_1DEF5C000, v12, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
          v9 = (int *)a1[4];
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize((uint64_t)v9);
      }
    }
    a1[4] = 0;
  }
  v13 = (_QWORD *)a1[5];
  if (v13)
  {
    v14 = (_DNSServiceRef_t *)v13[3];
    if (v14)
    {
      DNSServiceRefDeallocate(v14);
      v13[3] = 0;
    }
    v15 = (_DNSServiceRef_t *)v13[4];
    if (v15)
    {
      DNSServiceRefDeallocate(v15);
      v13[4] = 0;
    }
    v16 = v13[6];
    if (!v16)
      goto LABEL_44;
    v17 = 0;
    v18 = v13[7];
    while (*(_QWORD **)(v18 + 8 * v17) != a1)
    {
      if (v16 == ++v17)
        goto LABEL_44;
    }
    if (a1)
    {
      v19 = *(_DWORD *)a1;
      if (*(_DWORD *)a1)
      {
        v20 = advertising_proxy_global_os_log;
        v21 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
        if (v19 < 10001)
        {
          if (v21)
          {
            v32 = 136447490;
            v33 = "adv_service_unsubscribe";
            v34 = 1024;
            *(_DWORD *)v35 = v19;
            *(_WORD *)&v35[4] = 2048;
            *(_QWORD *)&v35[6] = a1;
            *(_WORD *)&v35[14] = 2080;
            *(_QWORD *)&v35[16] = "service->subscribers[i]";
            *(_WORD *)&v35[24] = 2080;
            *(_QWORD *)&v35[26] = "adv-resolve.c";
            v36 = 1024;
            v37 = 283;
            _os_log_impl(&dword_1DEF5C000, v20, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
            v18 = v13[7];
            v22 = *(_QWORD **)(v18 + 8 * v17);
            v19 = *(_DWORD *)v22;
          }
          else
          {
            v22 = a1;
          }
          *(_DWORD *)v22 = v19 - 1;
          if (v19 == 1)
          {
            v23 = advertising_proxy_global_os_log;
            if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
            {
              v32 = 136447234;
              v33 = "adv_service_unsubscribe";
              v34 = 2048;
              *(_QWORD *)v35 = v22;
              *(_WORD *)&v35[8] = 2080;
              *(_QWORD *)&v35[10] = "service->subscribers[i]";
              *(_WORD *)&v35[18] = 2080;
              *(_QWORD *)&v35[20] = "adv-resolve.c";
              *(_WORD *)&v35[28] = 1024;
              *(_DWORD *)&v35[30] = 283;
              _os_log_impl(&dword_1DEF5C000, v23, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
              v22 = *(_QWORD **)(v13[7] + 8 * v17);
            }
            ++advertising_proxy_subscription_finalized;
            advertising_proxy_subscription_finalize(v22);
            v18 = v13[7];
          }
          goto LABEL_43;
        }
        if (!v21)
          goto LABEL_70;
        v32 = 136447490;
        v33 = "adv_service_unsubscribe";
        v34 = 1024;
        *(_DWORD *)v35 = v19;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = a1;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "service->subscribers[i]";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 283;
        v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      }
      else
      {
        v20 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_70;
        v32 = 136447490;
        v33 = "adv_service_unsubscribe";
        v34 = 1024;
        *(_DWORD *)v35 = 0;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = a1;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "service->subscribers[i]";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 283;
        v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      }
      v31 = v20;
      goto LABEL_69;
    }
LABEL_43:
    *(_QWORD *)(v18 + 8 * v17) = 0;
LABEL_44:
    v24 = (int *)a1[5];
    if (!v24)
    {
LABEL_53:
      a1[5] = 0;
      return 0;
    }
    v25 = *v24;
    if (*v24)
    {
      v5 = advertising_proxy_global_os_log;
      v26 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v25 < 10001)
      {
        if (v26)
        {
          v32 = 136447490;
          v33 = "advertising_proxy_subscription_cancel";
          v34 = 1024;
          *(_DWORD *)v35 = v25;
          *(_WORD *)&v35[4] = 2048;
          *(_QWORD *)&v35[6] = v24;
          *(_WORD *)&v35[14] = 2080;
          *(_QWORD *)&v35[16] = "subscription->service";
          *(_WORD *)&v35[24] = 2080;
          *(_QWORD *)&v35[26] = "adv-resolve.c";
          v36 = 1024;
          v37 = 319;
          _os_log_impl(&dword_1DEF5C000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x36u);
          v24 = (int *)a1[5];
          v25 = *v24;
        }
        *v24 = v25 - 1;
        if (v25 == 1)
        {
          v27 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            v32 = 136447234;
            v33 = "advertising_proxy_subscription_cancel";
            v34 = 2048;
            *(_QWORD *)v35 = v24;
            *(_WORD *)&v35[8] = 2080;
            *(_QWORD *)&v35[10] = "subscription->service";
            *(_WORD *)&v35[18] = 2080;
            *(_QWORD *)&v35[20] = "adv-resolve.c";
            *(_WORD *)&v35[28] = 1024;
            *(_DWORD *)&v35[30] = 319;
            _os_log_impl(&dword_1DEF5C000, v27, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v32, 0x30u);
            v24 = (int *)a1[5];
          }
          ++adv_service_state_finalized;
          adv_service_state_finalize((uint64_t)v24);
        }
        goto LABEL_53;
      }
      if (v26)
      {
        v32 = 136447490;
        v33 = "advertising_proxy_subscription_cancel";
        v34 = 1024;
        *(_DWORD *)v35 = v25;
        *(_WORD *)&v35[4] = 2048;
        *(_QWORD *)&v35[6] = v24;
        *(_WORD *)&v35[14] = 2080;
        *(_QWORD *)&v35[16] = "subscription->service";
        *(_WORD *)&v35[24] = 2080;
        *(_QWORD *)&v35[26] = "adv-resolve.c";
        v36 = 1024;
        v37 = 319;
        v30 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_68:
        v31 = v5;
        goto LABEL_69;
      }
LABEL_70:
      abort();
    }
    v29 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_70;
    v32 = 136447490;
    v33 = "advertising_proxy_subscription_cancel";
    v34 = 1024;
    *(_DWORD *)v35 = 0;
    *(_WORD *)&v35[4] = 2048;
    *(_QWORD *)&v35[6] = v24;
    *(_WORD *)&v35[14] = 2080;
    *(_QWORD *)&v35[16] = "subscription->service";
    *(_WORD *)&v35[24] = 2080;
    *(_QWORD *)&v35[26] = "adv-resolve.c";
    v36 = 1024;
    v37 = 319;
    v30 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
LABEL_65:
    v31 = v29;
LABEL_69:
    _os_log_impl(&dword_1DEF5C000, v31, OS_LOG_TYPE_INFO, v30, (uint8_t *)&v32, 0x36u);
    goto LABEL_70;
  }
  return 0;
}

void adv_instance_unsubscribe(_QWORD *a1, _QWORD *a2)
{
  _DNSServiceRef_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[34];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (_DNSServiceRef_t *)a1[6];
  if (v4)
  {
    DNSServiceRefDeallocate(v4);
    a1[6] = 0;
  }
  v5 = a1[7];
  if (v5)
  {
    v6 = 0;
    v7 = a1[8];
    while (*(_QWORD **)(v7 + 8 * v6) != a2)
    {
      if (v5 == ++v6)
        return;
    }
    if (!a2)
      goto LABEL_17;
    v8 = *(_DWORD *)a2;
    if (*(_DWORD *)a2)
    {
      v9 = advertising_proxy_global_os_log;
      v10 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v8 < 10001)
      {
        if (v10)
        {
          v15 = 136447490;
          v16 = "adv_instance_unsubscribe";
          v17 = 1024;
          *(_DWORD *)v18 = v8;
          *(_WORD *)&v18[4] = 2048;
          *(_QWORD *)&v18[6] = a2;
          *(_WORD *)&v18[14] = 2080;
          *(_QWORD *)&v18[16] = "instance->subscribers[i]";
          *(_WORD *)&v18[24] = 2080;
          *(_QWORD *)&v18[26] = "adv-resolve.c";
          v19 = 1024;
          v20 = 263;
          _os_log_impl(&dword_1DEF5C000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v15, 0x36u);
          v7 = a1[8];
          a2 = *(_QWORD **)(v7 + 8 * v6);
          v8 = *(_DWORD *)a2;
        }
        *(_DWORD *)a2 = v8 - 1;
        if (v8 == 1)
        {
          v11 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            v15 = 136447234;
            v16 = "adv_instance_unsubscribe";
            v17 = 2048;
            *(_QWORD *)v18 = a2;
            *(_WORD *)&v18[8] = 2080;
            *(_QWORD *)&v18[10] = "instance->subscribers[i]";
            *(_WORD *)&v18[18] = 2080;
            *(_QWORD *)&v18[20] = "adv-resolve.c";
            *(_WORD *)&v18[28] = 1024;
            *(_DWORD *)&v18[30] = 263;
            _os_log_impl(&dword_1DEF5C000, v11, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v15, 0x30u);
            a2 = *(_QWORD **)(a1[8] + 8 * v6);
          }
          ++advertising_proxy_subscription_finalized;
          advertising_proxy_subscription_finalize(a2);
          v7 = a1[8];
        }
LABEL_17:
        *(_QWORD *)(v7 + 8 * v6) = 0;
        return;
      }
      if (!v10)
LABEL_24:
        abort();
      v15 = 136447490;
      v16 = "adv_instance_unsubscribe";
      v17 = 1024;
      *(_DWORD *)v18 = v8;
      *(_WORD *)&v18[4] = 2048;
      *(_QWORD *)&v18[6] = a2;
      *(_WORD *)&v18[14] = 2080;
      *(_QWORD *)&v18[16] = "instance->subscribers[i]";
      *(_WORD *)&v18[24] = 2080;
      *(_QWORD *)&v18[26] = "adv-resolve.c";
      v19 = 1024;
      v20 = 263;
      v13 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      v14 = v9;
    }
    else
    {
      v12 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      v15 = 136447490;
      v16 = "adv_instance_unsubscribe";
      v17 = 1024;
      *(_DWORD *)v18 = 0;
      *(_WORD *)&v18[4] = 2048;
      *(_QWORD *)&v18[6] = a2;
      *(_WORD *)&v18[14] = 2080;
      *(_QWORD *)&v18[16] = "instance->subscribers[i]";
      *(_WORD *)&v18[24] = 2080;
      *(_QWORD *)&v18[26] = "adv-resolve.c";
      v19 = 1024;
      v20 = 263;
      v13 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      v14 = v12;
    }
    _os_log_impl(&dword_1DEF5C000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v15, 0x36u);
    goto LABEL_24;
  }
}

void adv_instance_state_finalize(uint64_t a1)
{
  _DNSServiceRef_t *v2;
  NSObject *v3;
  unint64_t i;
  _QWORD *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  _BYTE v20[34];
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  free(*(void **)(a1 + 24));
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 40));
  v2 = *(_DNSServiceRef_t **)(a1 + 48);
  if (v2)
  {
    v3 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "adv_instance_state_finalize";
      v19 = 2048;
      *(_QWORD *)v20 = v2;
      _os_log_impl(&dword_1DEF5C000, v3, OS_LOG_TYPE_INFO, "%{public}s: \"state->resolve_ref is non-null: %p\"", buf, 0x16u);
      v2 = *(_DNSServiceRef_t **)(a1 + 48);
    }
    DNSServiceRefDeallocate(v2);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    for (i = 0; i < *(_QWORD *)(a1 + 56); ++i)
    {
      v5 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8 * i);
      if (v5)
      {
        v6 = *(_DWORD *)v5;
        if (!*(_DWORD *)v5)
        {
          v14 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447490;
            v18 = "adv_instance_state_finalize";
            v19 = 1024;
            *(_DWORD *)v20 = 0;
            *(_WORD *)&v20[4] = 2048;
            *(_QWORD *)&v20[6] = v5;
            *(_WORD *)&v20[14] = 2080;
            *(_QWORD *)&v20[16] = "state->subscribers[i]";
            *(_WORD *)&v20[24] = 2080;
            *(_QWORD *)&v20[26] = "adv-resolve.c";
            v21 = 1024;
            v22 = 153;
            v15 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
            v16 = v14;
            goto LABEL_28;
          }
LABEL_29:
          abort();
        }
        v7 = advertising_proxy_global_os_log;
        v8 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
        if (v6 >= 10001)
        {
          if (v8)
          {
            *(_DWORD *)buf = 136447490;
            v18 = "adv_instance_state_finalize";
            v19 = 1024;
            *(_DWORD *)v20 = v6;
            *(_WORD *)&v20[4] = 2048;
            *(_QWORD *)&v20[6] = v5;
            *(_WORD *)&v20[14] = 2080;
            *(_QWORD *)&v20[16] = "state->subscribers[i]";
            *(_WORD *)&v20[24] = 2080;
            *(_QWORD *)&v20[26] = "adv-resolve.c";
            v21 = 1024;
            v22 = 153;
            v15 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
            v16 = v7;
LABEL_28:
            _os_log_impl(&dword_1DEF5C000, v16, OS_LOG_TYPE_INFO, v15, buf, 0x36u);
          }
          goto LABEL_29;
        }
        if (v8)
        {
          *(_DWORD *)buf = 136447490;
          v18 = "adv_instance_state_finalize";
          v19 = 1024;
          *(_DWORD *)v20 = v6;
          *(_WORD *)&v20[4] = 2048;
          *(_QWORD *)&v20[6] = v5;
          *(_WORD *)&v20[14] = 2080;
          *(_QWORD *)&v20[16] = "state->subscribers[i]";
          *(_WORD *)&v20[24] = 2080;
          *(_QWORD *)&v20[26] = "adv-resolve.c";
          v21 = 1024;
          v22 = 153;
          _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
          v5 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8 * i);
          v6 = *(_DWORD *)v5;
        }
        *(_DWORD *)v5 = v6 - 1;
        if (v6 == 1)
        {
          v9 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447234;
            v18 = "adv_instance_state_finalize";
            v19 = 2048;
            *(_QWORD *)v20 = v5;
            *(_WORD *)&v20[8] = 2080;
            *(_QWORD *)&v20[10] = "state->subscribers[i]";
            *(_WORD *)&v20[18] = 2080;
            *(_QWORD *)&v20[20] = "adv-resolve.c";
            *(_WORD *)&v20[28] = 1024;
            *(_DWORD *)&v20[30] = 153;
            _os_log_impl(&dword_1DEF5C000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
            v5 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8 * i);
          }
          ++advertising_proxy_subscription_finalized;
          advertising_proxy_subscription_finalize(v5);
        }
      }
    }
  }
  free(*(void **)(a1 + 64));
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v11 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "adv_instance_state_finalize";
      v19 = 2048;
      *(_QWORD *)v20 = v10;
      _os_log_impl(&dword_1DEF5C000, v11, OS_LOG_TYPE_INFO, "%{public}s: \"state->nsn is not NULL (%p)\"", buf, 0x16u);
    }
  }
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "adv_instance_state_finalize";
      v19 = 2048;
      *(_QWORD *)v20 = v12;
      _os_log_impl(&dword_1DEF5C000, v13, OS_LOG_TYPE_INFO, "%{public}s: \"state->next is not NULL (%p)\"", buf, 0x16u);
    }
  }
}

void adv_service_state_finalize(uint64_t a1)
{
  _DNSServiceRef_t *v2;
  NSObject *v3;
  _DNSServiceRef_t *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t i;
  _QWORD *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[34];
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  free(*(void **)(a1 + 16));
  v2 = *(_DNSServiceRef_t **)(a1 + 24);
  if (v2)
  {
    v3 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "adv_service_state_finalize";
      v21 = 2048;
      *(_QWORD *)v22 = v2;
      _os_log_impl(&dword_1DEF5C000, v3, OS_LOG_TYPE_INFO, "%{public}s: \"state->null_browse_ref is non-null: %p\"", buf, 0x16u);
      v2 = *(_DNSServiceRef_t **)(a1 + 24);
    }
    DNSServiceRefDeallocate(v2);
  }
  v4 = *(_DNSServiceRef_t **)(a1 + 32);
  if (v4)
  {
    v5 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "adv_service_state_finalize";
      v21 = 2048;
      *(_QWORD *)v22 = v4;
      _os_log_impl(&dword_1DEF5C000, v5, OS_LOG_TYPE_INFO, "%{public}s: \"state->null_browse_ref is non-null: %p\"", buf, 0x16u);
      v4 = *(_DNSServiceRef_t **)(a1 + 32);
    }
    DNSServiceRefDeallocate(v4);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v7 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "adv_service_state_finalize";
      v21 = 2048;
      *(_QWORD *)v22 = v6;
      _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"state->instances not NULL (%p)\"", buf, 0x16u);
    }
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "adv_service_state_finalize";
      v21 = 2048;
      *(_QWORD *)v22 = v8;
      _os_log_impl(&dword_1DEF5C000, v9, OS_LOG_TYPE_INFO, "%{public}s: \"state->next not NULL (%p)\"", buf, 0x16u);
    }
  }
  if (*(_QWORD *)(a1 + 48))
  {
    for (i = 0; i < *(_QWORD *)(a1 + 48); ++i)
    {
      v11 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * i);
      if (v11)
      {
        v12 = *(_DWORD *)v11;
        if (!*(_DWORD *)v11)
        {
          v16 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447490;
            v20 = "adv_service_state_finalize";
            v21 = 1024;
            *(_DWORD *)v22 = 0;
            *(_WORD *)&v22[4] = 2048;
            *(_QWORD *)&v22[6] = v11;
            *(_WORD *)&v22[14] = 2080;
            *(_QWORD *)&v22[16] = "state->subscribers[i]";
            *(_WORD *)&v22[24] = 2080;
            *(_QWORD *)&v22[26] = "adv-resolve.c";
            v23 = 1024;
            v24 = 107;
            v17 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
            v18 = v16;
            goto LABEL_32;
          }
LABEL_33:
          abort();
        }
        v13 = advertising_proxy_global_os_log;
        v14 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
        if (v12 >= 10001)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136447490;
            v20 = "adv_service_state_finalize";
            v21 = 1024;
            *(_DWORD *)v22 = v12;
            *(_WORD *)&v22[4] = 2048;
            *(_QWORD *)&v22[6] = v11;
            *(_WORD *)&v22[14] = 2080;
            *(_QWORD *)&v22[16] = "state->subscribers[i]";
            *(_WORD *)&v22[24] = 2080;
            *(_QWORD *)&v22[26] = "adv-resolve.c";
            v23 = 1024;
            v24 = 107;
            v17 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
            v18 = v13;
LABEL_32:
            _os_log_impl(&dword_1DEF5C000, v18, OS_LOG_TYPE_INFO, v17, buf, 0x36u);
          }
          goto LABEL_33;
        }
        if (v14)
        {
          *(_DWORD *)buf = 136447490;
          v20 = "adv_service_state_finalize";
          v21 = 1024;
          *(_DWORD *)v22 = v12;
          *(_WORD *)&v22[4] = 2048;
          *(_QWORD *)&v22[6] = v11;
          *(_WORD *)&v22[14] = 2080;
          *(_QWORD *)&v22[16] = "state->subscribers[i]";
          *(_WORD *)&v22[24] = 2080;
          *(_QWORD *)&v22[26] = "adv-resolve.c";
          v23 = 1024;
          v24 = 107;
          _os_log_impl(&dword_1DEF5C000, v13, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
          v11 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * i);
          v12 = *(_DWORD *)v11;
        }
        *(_DWORD *)v11 = v12 - 1;
        if (v12 == 1)
        {
          v15 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447234;
            v20 = "adv_service_state_finalize";
            v21 = 2048;
            *(_QWORD *)v22 = v11;
            *(_WORD *)&v22[8] = 2080;
            *(_QWORD *)&v22[10] = "state->subscribers[i]";
            *(_WORD *)&v22[18] = 2080;
            *(_QWORD *)&v22[20] = "adv-resolve.c";
            *(_WORD *)&v22[28] = 1024;
            *(_DWORD *)&v22[30] = 107;
            _os_log_impl(&dword_1DEF5C000, v15, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
            v11 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8 * i);
          }
          ++advertising_proxy_subscription_finalized;
          advertising_proxy_subscription_finalize(v11);
        }
      }
    }
  }
  free(*(void **)(a1 + 56));
}

uint64_t advertising_proxy_registrar_create(int **a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int *v9;
  int *v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  _QWORD v17[8];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = 4294901747;
  if (a1 && a3)
  {
    v9 = advertising_proxy_subscription_create();
    if (v9)
    {
      v10 = v9;
      v11 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        v12 = *v10;
        *(_DWORD *)buf = 136447490;
        v19 = "advertising_proxy_registrar_create";
        v20 = 1024;
        v21 = v12;
        v22 = 2048;
        v23 = v10;
        v24 = 2080;
        v25 = "subscription";
        v26 = 2080;
        v27 = "adv-resolve.c";
        v28 = 1024;
        v29 = 348;
        _os_log_impl(&dword_1DEF5C000, v11, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      }
      v13 = *v10;
      if (*v10)
      {
        v14 = v13 + 1;
        *v10 = v13 + 1;
        if (v13 + 1 >= 10001)
        {
          v15 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136447490;
            v19 = "advertising_proxy_registrar_create";
            v20 = 1024;
            v21 = v14;
            v22 = 2048;
            v23 = v10;
            v24 = 2080;
            v25 = "subscription";
            v26 = 2080;
            v27 = "adv-resolve.c";
            v28 = 1024;
            v29 = 348;
            _os_log_impl(&dword_1DEF5C000, v15, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
          }
          abort();
        }
      }
      else
      {
        ++advertising_proxy_subscription_created;
        *v10 = 1;
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 0x40000000;
      v17[2] = __advertising_proxy_registrar_create_block_invoke;
      v17[3] = &__block_descriptor_tmp_278;
      v17[4] = a3;
      v17[5] = v10;
      v17[6] = a4;
      v17[7] = v10;
      dispatch_async(a2, v17);
      v4 = 0;
      *a1 = v10;
    }
    else
    {
      return 4294901757;
    }
  }
  return v4;
}

int *advertising_proxy_subscription_create()
{
  int *v0;
  NSObject *v1;
  int v2;
  int v3;
  NSObject *v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v0 = (int *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A0040BC42D5E1uLL);
  if (v0)
  {
    v1 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v2 = *v0;
      *(_DWORD *)buf = 136447490;
      v8 = "advertising_proxy_subscription_create";
      v9 = 1024;
      v10 = v2;
      v11 = 2048;
      v12 = v0;
      v13 = 2080;
      v14 = "subscription";
      v15 = 2080;
      v16 = "adv-resolve.c";
      v17 = 1024;
      v18 = 248;
      _os_log_impl(&dword_1DEF5C000, v1, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    }
    if (*v0)
    {
      v3 = *v0 + 1;
      *v0 = v3;
      if (v3 >= 10001)
      {
        v6 = v3;
        v4 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136447490;
          v8 = "advertising_proxy_subscription_create";
          v9 = 1024;
          v10 = v6;
          v11 = 2048;
          v12 = v0;
          v13 = 2080;
          v14 = "subscription";
          v15 = 2080;
          v16 = "adv-resolve.c";
          v17 = 1024;
          v18 = 248;
          _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
        }
        abort();
      }
    }
    else
    {
      ++advertising_proxy_subscription_created;
      *v0 = 1;
    }
  }
  return v0;
}

void __advertising_proxy_registrar_create_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BYTE v13[34];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD **)(a1 + 56);
  if (!v2)
    return;
  v3 = *(_DWORD *)v2;
  if (!*(_DWORD *)v2)
  {
    v7 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v10 = 136447490;
    v11 = "advertising_proxy_registrar_create_block_invoke";
    v12 = 1024;
    *(_DWORD *)v13 = 0;
    *(_WORD *)&v13[4] = 2048;
    *(_QWORD *)&v13[6] = v2;
    *(_WORD *)&v13[14] = 2080;
    *(_QWORD *)&v13[16] = "subscription";
    *(_WORD *)&v13[24] = 2080;
    *(_QWORD *)&v13[26] = "adv-resolve.c";
    v14 = 1024;
    v15 = 351;
    v8 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    v9 = v7;
    goto LABEL_15;
  }
  v4 = advertising_proxy_global_os_log;
  v5 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v3 >= 10001)
  {
    if (!v5)
      goto LABEL_16;
    v10 = 136447490;
    v11 = "advertising_proxy_registrar_create_block_invoke";
    v12 = 1024;
    *(_DWORD *)v13 = v3;
    *(_WORD *)&v13[4] = 2048;
    *(_QWORD *)&v13[6] = v2;
    *(_WORD *)&v13[14] = 2080;
    *(_QWORD *)&v13[16] = "subscription";
    *(_WORD *)&v13[24] = 2080;
    *(_QWORD *)&v13[26] = "adv-resolve.c";
    v14 = 1024;
    v15 = 351;
    v8 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    v9 = v4;
LABEL_15:
    _os_log_impl(&dword_1DEF5C000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 0x36u);
LABEL_16:
    abort();
  }
  if (v5)
  {
    v10 = 136447490;
    v11 = "advertising_proxy_registrar_create_block_invoke";
    v12 = 1024;
    *(_DWORD *)v13 = v3;
    *(_WORD *)&v13[4] = 2048;
    *(_QWORD *)&v13[6] = v2;
    *(_WORD *)&v13[14] = 2080;
    *(_QWORD *)&v13[16] = "subscription";
    *(_WORD *)&v13[24] = 2080;
    *(_QWORD *)&v13[26] = "adv-resolve.c";
    v14 = 1024;
    v15 = 351;
    _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v10, 0x36u);
    v2 = *(_QWORD **)(a1 + 56);
    v3 = *(_DWORD *)v2;
  }
  *(_DWORD *)v2 = v3 - 1;
  if (v3 == 1)
  {
    v6 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v10 = 136447234;
      v11 = "advertising_proxy_registrar_create_block_invoke";
      v12 = 2048;
      *(_QWORD *)v13 = v2;
      *(_WORD *)&v13[8] = 2080;
      *(_QWORD *)&v13[10] = "subscription";
      *(_WORD *)&v13[18] = 2080;
      *(_QWORD *)&v13[20] = "adv-resolve.c";
      *(_WORD *)&v13[28] = 1024;
      *(_DWORD *)&v13[30] = 351;
      _os_log_impl(&dword_1DEF5C000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v10, 0x30u);
      v2 = *(_QWORD **)(a1 + 56);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(v2);
  }
}

uint64_t advertising_proxy_browse_create(int **a1, NSObject *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  NSObject *v10;
  int *v11;
  int *v12;
  DNSServiceRef *v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;
  const char *v19;
  char *v20;
  NSObject *v21;
  _BOOL4 v22;
  _DWORD *v23;
  int v24;
  int v25;
  int v26;
  _DWORD *v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  DNSServiceErrorType v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  int v38;
  _BOOL4 v39;
  NSObject *v40;
  NSObject *v42;
  int v43;
  int v44;
  int v45;
  DNSServiceErrorType v46;
  const char *v47;
  NSObject *v48;
  int v49;
  int v50;
  int v51;
  NSObject *v52;
  int v53;
  const char *v54;
  __int16 v55;
  _BYTE v56[34];
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = 4294901747;
  if (!a1 || !a3 || !a4)
    return v5;
  if (a2)
    v10 = a2;
  else
    v10 = MEMORY[0x1E0C80D38];
  v11 = advertising_proxy_subscription_create();
  if (!v11)
    return 4294901757;
  v12 = v11;
  v13 = (DNSServiceRef *)malloc_type_calloc(1uLL, 0x40uLL, 0x10B004038106158uLL);
  v14 = advertising_proxy_global_os_log;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v15 = *(_DWORD *)v13;
      v53 = 136447490;
      v54 = "adv_service_state_create";
      v55 = 1024;
      *(_DWORD *)v56 = v15;
      *(_WORD *)&v56[4] = 2048;
      *(_QWORD *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(_QWORD *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(_QWORD *)&v56[26] = "adv-resolve.c";
      v57 = 1024;
      v58 = 196;
      _os_log_impl(&dword_1DEF5C000, v14, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    }
    v16 = *(_DWORD *)v13;
    if (*(_DWORD *)v13)
    {
      v17 = v16 + 1;
      *(_DWORD *)v13 = v16 + 1;
      if (v16 + 1 >= 10001)
      {
        v18 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_95;
        v53 = 136447490;
        v54 = "adv_service_state_create";
        v55 = 1024;
        *(_DWORD *)v56 = v17;
        *(_WORD *)&v56[4] = 2048;
        *(_QWORD *)&v56[6] = v13;
        *(_WORD *)&v56[14] = 2080;
        *(_QWORD *)&v56[16] = "state";
        *(_WORD *)&v56[24] = 2080;
        *(_QWORD *)&v56[26] = "adv-resolve.c";
        v57 = 1024;
        v58 = 196;
        v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
LABEL_93:
        v52 = v18;
        goto LABEL_94;
      }
    }
    else
    {
      ++adv_service_state_created;
      *(_DWORD *)v13 = 1;
    }
  }
  else if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
  {
    v53 = 136446466;
    v54 = "adv_service_state_create";
    v55 = 2082;
    *(_QWORD *)v56 = a3;
    _os_log_error_impl(&dword_1DEF5C000, v14, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for service state %{public}s\"", (uint8_t *)&v53, 0x16u);
  }
  v20 = strdup(a3);
  v13[2] = (DNSServiceRef)v20;
  if (!v20)
  {
    v29 = *(_DWORD *)v13;
    if (!*(_DWORD *)v13)
    {
      v18 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        goto LABEL_95;
      v53 = 136447490;
      v54 = "adv_service_state_create";
      v55 = 1024;
      *(_DWORD *)v56 = 0;
      *(_WORD *)&v56[4] = 2048;
      *(_QWORD *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(_QWORD *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(_QWORD *)&v56[26] = "adv-resolve.c";
      v57 = 1024;
      v58 = 199;
      v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_93;
    }
    v30 = advertising_proxy_global_os_log;
    v31 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v29 >= 10001)
    {
      if (!v31)
LABEL_95:
        abort();
      v53 = 136447490;
      v54 = "adv_service_state_create";
      v55 = 1024;
      *(_DWORD *)v56 = v29;
      *(_WORD *)&v56[4] = 2048;
      *(_QWORD *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(_QWORD *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(_QWORD *)&v56[26] = "adv-resolve.c";
      v57 = 1024;
      v58 = 199;
      v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      v52 = v30;
LABEL_94:
      _os_log_impl(&dword_1DEF5C000, v52, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v53, 0x36u);
      goto LABEL_95;
    }
    if (v31)
    {
      v53 = 136447490;
      v54 = "adv_service_state_create";
      v55 = 1024;
      *(_DWORD *)v56 = v29;
      *(_WORD *)&v56[4] = 2048;
      *(_QWORD *)&v56[6] = v13;
      *(_WORD *)&v56[14] = 2080;
      *(_QWORD *)&v56[16] = "state";
      *(_WORD *)&v56[24] = 2080;
      *(_QWORD *)&v56[26] = "adv-resolve.c";
      v57 = 1024;
      v58 = 199;
      _os_log_impl(&dword_1DEF5C000, v30, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
      v29 = *(_DWORD *)v13;
      v30 = advertising_proxy_global_os_log;
    }
    *(_DWORD *)v13 = v29 - 1;
    if (v29 == 1)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v53 = 136447234;
        v54 = "adv_service_state_create";
        v55 = 2048;
        *(_QWORD *)v56 = v13;
        *(_WORD *)&v56[8] = 2080;
        *(_QWORD *)&v56[10] = "state";
        *(_WORD *)&v56[18] = 2080;
        *(_QWORD *)&v56[20] = "adv-resolve.c";
        *(_WORD *)&v56[28] = 1024;
        *(_DWORD *)&v56[30] = 199;
        _os_log_impl(&dword_1DEF5C000, v30, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x30u);
      }
      ++adv_service_state_finalized;
      adv_service_state_finalize((uint64_t)v13);
      v30 = advertising_proxy_global_os_log;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v53 = 136446466;
      v54 = "adv_service_state_create";
      v55 = 2082;
      *(_QWORD *)v56 = a3;
      _os_log_error_impl(&dword_1DEF5C000, v30, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for service_type %{public}s\"", (uint8_t *)&v53, 0x16u);
    }
    v13 = 0;
    v5 = 4294901757;
    goto LABEL_42;
  }
  adv_subscriber_add((size_t *)v13 + 6, (void **)v13 + 7, v12);
  *((_QWORD *)v12 + 5) = v13;
  v21 = advertising_proxy_global_os_log;
  v22 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  v23 = v13;
  if (v22)
  {
    v24 = *(_DWORD *)v13;
    v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    v55 = 1024;
    *(_DWORD *)v56 = v24;
    *(_WORD *)&v56[4] = 2048;
    *(_QWORD *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(_QWORD *)&v56[16] = "subscription->service";
    *(_WORD *)&v56[24] = 2080;
    *(_QWORD *)&v56[26] = "adv-resolve.c";
    v57 = 1024;
    v58 = 456;
    _os_log_impl(&dword_1DEF5C000, v21, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    v23 = (_DWORD *)*((_QWORD *)v12 + 5);
  }
  v25 = *v23;
  if (*v23)
  {
    v26 = v25 + 1;
    *v23 = v25 + 1;
    if (v25 + 1 >= 10001)
    {
      v27 = v23;
      v28 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        goto LABEL_95;
      v53 = 136447490;
      v54 = "advertising_proxy_browse_create";
      v55 = 1024;
      *(_DWORD *)v56 = v26;
      *(_WORD *)&v56[4] = 2048;
      *(_QWORD *)&v56[6] = v27;
      *(_WORD *)&v56[14] = 2080;
      *(_QWORD *)&v56[16] = "subscription->service";
      *(_WORD *)&v56[24] = 2080;
      *(_QWORD *)&v56[26] = "adv-resolve.c";
      v57 = 1024;
      v58 = 456;
      v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
LABEL_84:
      v52 = v28;
      goto LABEL_94;
    }
  }
  else
  {
    ++adv_service_state_created;
    *v23 = 1;
  }
  *((_QWORD *)v12 + 2) = a4;
  *((_QWORD *)v12 + 6) = a5;
  v32 = DNSServiceBrowse(v13 + 3, 0, 0, a3, 0, (DNSServiceBrowseReply)advertising_proxy_browse_callback, v13);
  if (!v32)
  {
    v32 = DNSServiceSetDispatchQueue(v13[3], v10);
    if (!v32)
    {
      v42 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        v43 = *(_DWORD *)v13;
        v53 = 136447490;
        v54 = "advertising_proxy_browse_create";
        v55 = 1024;
        *(_DWORD *)v56 = v43;
        *(_WORD *)&v56[4] = 2048;
        *(_QWORD *)&v56[6] = v13;
        *(_WORD *)&v56[14] = 2080;
        *(_QWORD *)&v56[16] = "service";
        *(_WORD *)&v56[24] = 2080;
        *(_QWORD *)&v56[26] = "adv-resolve.c";
        v57 = 1024;
        v58 = 471;
        _os_log_impl(&dword_1DEF5C000, v42, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
      }
      v44 = *(_DWORD *)v13;
      if (*(_DWORD *)v13)
      {
        v45 = v44 + 1;
        *(_DWORD *)v13 = v44 + 1;
        if (v44 + 1 >= 10001)
        {
          v18 = advertising_proxy_global_os_log;
          if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
            goto LABEL_95;
          v53 = 136447490;
          v54 = "advertising_proxy_browse_create";
          v55 = 1024;
          *(_DWORD *)v56 = v45;
          *(_WORD *)&v56[4] = 2048;
          *(_QWORD *)&v56[6] = v13;
          *(_WORD *)&v56[14] = 2080;
          *(_QWORD *)&v56[16] = "service";
          *(_WORD *)&v56[24] = 2080;
          *(_QWORD *)&v56[26] = "adv-resolve.c";
          v57 = 1024;
          v58 = 471;
          v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
          goto LABEL_93;
        }
      }
      else
      {
        ++adv_service_state_created;
        *(_DWORD *)v13 = 1;
      }
      v46 = DNSServiceBrowse(v13 + 4, 0, 0, a3, "default.service.arpa", (DNSServiceBrowseReply)advertising_proxy_browse_callback, v13);
      if (!v46)
      {
        v46 = DNSServiceSetDispatchQueue(v13[4], v10);
        if (!v46)
        {
          v48 = advertising_proxy_global_os_log;
          if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          {
            v49 = *(_DWORD *)v13;
            v53 = 136447490;
            v54 = "advertising_proxy_browse_create";
            v55 = 1024;
            *(_DWORD *)v56 = v49;
            *(_WORD *)&v56[4] = 2048;
            *(_QWORD *)&v56[6] = v13;
            *(_WORD *)&v56[14] = 2080;
            *(_QWORD *)&v56[16] = "service";
            *(_WORD *)&v56[24] = 2080;
            *(_QWORD *)&v56[26] = "adv-resolve.c";
            v57 = 1024;
            v58 = 483;
            _os_log_impl(&dword_1DEF5C000, v48, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
          }
          v50 = *(_DWORD *)v13;
          if (*(_DWORD *)v13)
          {
            v51 = v50 + 1;
            *(_DWORD *)v13 = v50 + 1;
            if (v50 + 1 >= 10001)
            {
              v18 = advertising_proxy_global_os_log;
              if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
                goto LABEL_95;
              v53 = 136447490;
              v54 = "advertising_proxy_browse_create";
              v55 = 1024;
              *(_DWORD *)v56 = v51;
              *(_WORD *)&v56[4] = 2048;
              *(_QWORD *)&v56[6] = v13;
              *(_WORD *)&v56[14] = 2080;
              *(_QWORD *)&v56[16] = "service";
              *(_WORD *)&v56[24] = 2080;
              *(_QWORD *)&v56[26] = "adv-resolve.c";
              v57 = 1024;
              v58 = 483;
              v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
              goto LABEL_93;
            }
          }
          else
          {
            ++adv_service_state_created;
            *(_DWORD *)v13 = 1;
          }
          v5 = 0;
          *a1 = v12;
          return v5;
        }
      }
      v33 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
        goto LABEL_41;
      v53 = 136446722;
      v54 = "advertising_proxy_browse_create";
      v55 = 2082;
      *(_QWORD *)v56 = a3;
      *(_WORD *)&v56[8] = 1024;
      *(_DWORD *)&v56[10] = v46;
      v47 = "%{public}s: \"browse on service %{public}s in the push domain failed with %d\"";
      goto LABEL_73;
    }
  }
  v33 = advertising_proxy_global_os_log;
  if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
  {
    v53 = 136446722;
    v54 = "advertising_proxy_browse_create";
    v55 = 2082;
    *(_QWORD *)v56 = a3;
    *(_WORD *)&v56[8] = 1024;
    *(_DWORD *)&v56[10] = v32;
    v47 = "%{public}s: \"browse for service %{public}s in the default domains failed with %d\"";
LABEL_73:
    _os_log_error_impl(&dword_1DEF5C000, v33, OS_LOG_TYPE_ERROR, v47, (uint8_t *)&v53, 0x1Cu);
  }
LABEL_41:
  v5 = 4294901759;
LABEL_42:
  advertising_proxy_subscription_cancel(v12);
  v34 = *v12;
  if (!*v12)
  {
    v28 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_95;
    v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    v55 = 1024;
    *(_DWORD *)v56 = 0;
    *(_WORD *)&v56[4] = 2048;
    *(_QWORD *)&v56[6] = v12;
    *(_WORD *)&v56[14] = 2080;
    *(_QWORD *)&v56[16] = "subscription";
    *(_WORD *)&v56[24] = 2080;
    *(_QWORD *)&v56[26] = "adv-resolve.c";
    v57 = 1024;
    v58 = 491;
    v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_84;
  }
  v35 = advertising_proxy_global_os_log;
  v36 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v34 >= 10001)
  {
    if (!v36)
      goto LABEL_95;
    v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    v55 = 1024;
    *(_DWORD *)v56 = v34;
    *(_WORD *)&v56[4] = 2048;
    *(_QWORD *)&v56[6] = v12;
    *(_WORD *)&v56[14] = 2080;
    *(_QWORD *)&v56[16] = "subscription";
    *(_WORD *)&v56[24] = 2080;
    *(_QWORD *)&v56[26] = "adv-resolve.c";
    v57 = 1024;
    v58 = 491;
    v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    v52 = v35;
    goto LABEL_94;
  }
  if (v36)
  {
    v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    v55 = 1024;
    *(_DWORD *)v56 = v34;
    *(_WORD *)&v56[4] = 2048;
    *(_QWORD *)&v56[6] = v12;
    *(_WORD *)&v56[14] = 2080;
    *(_QWORD *)&v56[16] = "subscription";
    *(_WORD *)&v56[24] = 2080;
    *(_QWORD *)&v56[26] = "adv-resolve.c";
    v57 = 1024;
    v58 = 491;
    _os_log_impl(&dword_1DEF5C000, v35, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    v34 = *v12;
  }
  *v12 = v34 - 1;
  if (v34 == 1)
  {
    v37 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v53 = 136447234;
      v54 = "advertising_proxy_browse_create";
      v55 = 2048;
      *(_QWORD *)v56 = v12;
      *(_WORD *)&v56[8] = 2080;
      *(_QWORD *)&v56[10] = "subscription";
      *(_WORD *)&v56[18] = 2080;
      *(_QWORD *)&v56[20] = "adv-resolve.c";
      *(_WORD *)&v56[28] = 1024;
      *(_DWORD *)&v56[30] = 491;
      _os_log_impl(&dword_1DEF5C000, v37, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x30u);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(v12);
    if (!v13)
      return v5;
  }
  else if (!v13)
  {
    return v5;
  }
  adv_service_state_cancel((uint64_t)v13);
  v38 = *(_DWORD *)v13;
  if (!*(_DWORD *)v13)
  {
    v18 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_95;
    v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    v55 = 1024;
    *(_DWORD *)v56 = 0;
    *(_WORD *)&v56[4] = 2048;
    *(_QWORD *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(_QWORD *)&v56[16] = "service";
    *(_WORD *)&v56[24] = 2080;
    *(_QWORD *)&v56[26] = "adv-resolve.c";
    v57 = 1024;
    v58 = 495;
    v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_93;
  }
  v18 = advertising_proxy_global_os_log;
  v39 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v38 >= 10001)
  {
    if (!v39)
      goto LABEL_95;
    v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    v55 = 1024;
    *(_DWORD *)v56 = v38;
    *(_WORD *)&v56[4] = 2048;
    *(_QWORD *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(_QWORD *)&v56[16] = "service";
    *(_WORD *)&v56[24] = 2080;
    *(_QWORD *)&v56[26] = "adv-resolve.c";
    v57 = 1024;
    v58 = 495;
    v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_93;
  }
  if (v39)
  {
    v53 = 136447490;
    v54 = "advertising_proxy_browse_create";
    v55 = 1024;
    *(_DWORD *)v56 = v38;
    *(_WORD *)&v56[4] = 2048;
    *(_QWORD *)&v56[6] = v13;
    *(_WORD *)&v56[14] = 2080;
    *(_QWORD *)&v56[16] = "service";
    *(_WORD *)&v56[24] = 2080;
    *(_QWORD *)&v56[26] = "adv-resolve.c";
    v57 = 1024;
    v58 = 495;
    _os_log_impl(&dword_1DEF5C000, v18, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x36u);
    v38 = *(_DWORD *)v13;
  }
  *(_DWORD *)v13 = v38 - 1;
  if (v38 == 1)
  {
    v40 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v53 = 136447234;
      v54 = "advertising_proxy_browse_create";
      v55 = 2048;
      *(_QWORD *)v56 = v13;
      *(_WORD *)&v56[8] = 2080;
      *(_QWORD *)&v56[10] = "service";
      *(_WORD *)&v56[18] = 2080;
      *(_QWORD *)&v56[20] = "adv-resolve.c";
      *(_WORD *)&v56[28] = 1024;
      *(_DWORD *)&v56[30] = 495;
      _os_log_impl(&dword_1DEF5C000, v40, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v53, 0x30u);
    }
    ++adv_service_state_finalized;
    adv_service_state_finalize((uint64_t)v13);
  }
  return v5;
}

void adv_subscriber_add(size_t *a1, void **a2, int *a3)
{
  int *v3;
  size_t v6;
  _QWORD *v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  _BYTE v25[14];
  __int16 v26;
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = *a1;
  v7 = *a2;
  if (*a1)
  {
    v8 = 0;
    while (v7[v8])
    {
      if (v6 == ++v8)
        goto LABEL_5;
    }
    v7[v8] = a3;
    v17 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v18 = *v3;
      v22 = 136447490;
      v23 = "adv_subscriber_add";
      v24 = 1024;
      *(_DWORD *)v25 = v18;
      *(_WORD *)&v25[4] = 2048;
      *(_QWORD *)&v25[6] = v3;
      v26 = 2080;
      v27 = "subscribers[i]";
      v28 = 2080;
      v29 = "adv-resolve.c";
      v30 = 1024;
      v31 = 373;
      _os_log_impl(&dword_1DEF5C000, v17, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v22, 0x36u);
      v3 = (int *)v7[v8];
    }
    v19 = *v3;
    if (*v3)
    {
      v20 = v19 + 1;
      *v3 = v19 + 1;
      if (v19 + 1 >= 10001)
      {
        v16 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_24;
        v22 = 136447490;
        v23 = "adv_subscriber_add";
        v24 = 1024;
        *(_DWORD *)v25 = v20;
        *(_WORD *)&v25[4] = 2048;
        *(_QWORD *)&v25[6] = v3;
        v26 = 2080;
        v27 = "subscribers[i]";
        v28 = 2080;
        v29 = "adv-resolve.c";
        v30 = 1024;
        v31 = 373;
LABEL_23:
        _os_log_impl(&dword_1DEF5C000, v16, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v22, 0x36u);
LABEL_24:
        abort();
      }
    }
    else
    {
      ++advertising_proxy_subscription_created;
      *v3 = 1;
    }
  }
  else
  {
LABEL_5:
    if (v7)
      v9 = 2 * v6;
    else
      v9 = 10;
    v10 = malloc_type_calloc(v9, 8uLL, 0x2004093837F09uLL);
    if (v10)
    {
      v11 = v10;
      if (*a2)
      {
        memcpy(v10, v7, 8 * v6);
        free(*a2);
      }
      *a2 = v11;
      *((_QWORD *)v11 + v6) = v3;
      v12 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        v13 = *v3;
        v22 = 136447490;
        v23 = "adv_subscriber_add";
        v24 = 1024;
        *(_DWORD *)v25 = v13;
        *(_WORD *)&v25[4] = 2048;
        *(_QWORD *)&v25[6] = v3;
        v26 = 2080;
        v27 = "new_subscribers[max_subscribers]";
        v28 = 2080;
        v29 = "adv-resolve.c";
        v30 = 1024;
        v31 = 389;
        _os_log_impl(&dword_1DEF5C000, v12, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v22, 0x36u);
        v3 = (int *)*((_QWORD *)v11 + v6);
      }
      v14 = *v3;
      if (*v3)
      {
        v15 = v14 + 1;
        *v3 = v14 + 1;
        if (v14 + 1 >= 10001)
        {
          v16 = advertising_proxy_global_os_log;
          if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
            goto LABEL_24;
          v22 = 136447490;
          v23 = "adv_subscriber_add";
          v24 = 1024;
          *(_DWORD *)v25 = v15;
          *(_WORD *)&v25[4] = 2048;
          *(_QWORD *)&v25[6] = v3;
          v26 = 2080;
          v27 = "new_subscribers[max_subscribers]";
          v28 = 2080;
          v29 = "adv-resolve.c";
          v30 = 1024;
          v31 = 389;
          goto LABEL_23;
        }
      }
      else
      {
        ++advertising_proxy_subscription_created;
        *v3 = 1;
      }
      *a1 = v9;
    }
    else
    {
      v21 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        v22 = 136446466;
        v23 = "adv_subscriber_add";
        v24 = 2048;
        *(_QWORD *)v25 = v9;
        _os_log_error_impl(&dword_1DEF5C000, v21, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for %zu subscribers\"", (uint8_t *)&v22, 0x16u);
      }
    }
  }
}

void advertising_proxy_browse_callback(uint64_t a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BOOL4 v26;
  NSObject *v27;
  int v28;
  const char *v29;
  __int16 v30;
  _BYTE v31[34];
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a8)
  {
    v14 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v15 = *(_DWORD *)a8;
      v28 = 136447490;
      v29 = "advertising_proxy_browse_callback";
      v30 = 1024;
      *(_DWORD *)v31 = v15;
      *(_WORD *)&v31[4] = 2048;
      *(_QWORD *)&v31[6] = a8;
      *(_WORD *)&v31[14] = 2080;
      *(_QWORD *)&v31[16] = "service";
      *(_WORD *)&v31[24] = 2080;
      *(_QWORD *)&v31[26] = "adv-resolve.c";
      v32 = 1024;
      v33 = 407;
      _os_log_impl(&dword_1DEF5C000, v14, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v28, 0x36u);
    }
    v16 = *(_DWORD *)a8;
    if (*(_DWORD *)a8)
    {
      v17 = v16 + 1;
      *(_DWORD *)a8 = v16 + 1;
      if (v16 + 1 >= 10001)
      {
        v18 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_33;
        v28 = 136447490;
        v29 = "advertising_proxy_browse_callback";
        v30 = 1024;
        *(_DWORD *)v31 = v17;
        *(_WORD *)&v31[4] = 2048;
        *(_QWORD *)&v31[6] = a8;
        *(_WORD *)&v31[14] = 2080;
        *(_QWORD *)&v31[16] = "service";
        *(_WORD *)&v31[24] = 2080;
        *(_QWORD *)&v31[26] = "adv-resolve.c";
        v32 = 1024;
        v33 = 407;
        v19 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_32;
      }
    }
    else
    {
      ++adv_service_state_created;
      *(_DWORD *)a8 = 1;
    }
  }
  if (a4)
    v20 = 4294901759;
  else
    v20 = 0;
  v21 = *(_QWORD *)(a8 + 48);
  if (v21)
  {
    v22 = 0;
    v23 = (a2 >> 1) & 1;
    do
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a8 + 56) + 8 * v22);
      if (v24)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v24, v20, a3, v23, a5, a6, a8);
        v21 = *(_QWORD *)(a8 + 48);
      }
      ++v22;
    }
    while (v22 < v21);
  }
  if (a4)
    adv_service_state_cancel(a8);
  v25 = *(_DWORD *)a8;
  if (!*(_DWORD *)a8)
  {
    v18 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_33;
    v28 = 136447490;
    v29 = "advertising_proxy_browse_callback";
    v30 = 1024;
    *(_DWORD *)v31 = 0;
    *(_WORD *)&v31[4] = 2048;
    *(_QWORD *)&v31[6] = a8;
    *(_WORD *)&v31[14] = 2080;
    *(_QWORD *)&v31[16] = "service";
    *(_WORD *)&v31[24] = 2080;
    *(_QWORD *)&v31[26] = "adv-resolve.c";
    v32 = 1024;
    v33 = 422;
    v19 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_32;
  }
  v18 = advertising_proxy_global_os_log;
  v26 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v25 >= 10001)
  {
    if (!v26)
      goto LABEL_33;
    v28 = 136447490;
    v29 = "advertising_proxy_browse_callback";
    v30 = 1024;
    *(_DWORD *)v31 = v25;
    *(_WORD *)&v31[4] = 2048;
    *(_QWORD *)&v31[6] = a8;
    *(_WORD *)&v31[14] = 2080;
    *(_QWORD *)&v31[16] = "service";
    *(_WORD *)&v31[24] = 2080;
    *(_QWORD *)&v31[26] = "adv-resolve.c";
    v32 = 1024;
    v33 = 422;
    v19 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_32:
    _os_log_impl(&dword_1DEF5C000, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x36u);
LABEL_33:
    abort();
  }
  if (v26)
  {
    v28 = 136447490;
    v29 = "advertising_proxy_browse_callback";
    v30 = 1024;
    *(_DWORD *)v31 = v25;
    *(_WORD *)&v31[4] = 2048;
    *(_QWORD *)&v31[6] = a8;
    *(_WORD *)&v31[14] = 2080;
    *(_QWORD *)&v31[16] = "service";
    *(_WORD *)&v31[24] = 2080;
    *(_QWORD *)&v31[26] = "adv-resolve.c";
    v32 = 1024;
    v33 = 422;
    _os_log_impl(&dword_1DEF5C000, v18, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v28, 0x36u);
    v25 = *(_DWORD *)a8;
  }
  *(_DWORD *)a8 = v25 - 1;
  if (v25 == 1)
  {
    v27 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v28 = 136447234;
      v29 = "advertising_proxy_browse_callback";
      v30 = 2048;
      *(_QWORD *)v31 = a8;
      *(_WORD *)&v31[8] = 2080;
      *(_QWORD *)&v31[10] = "service";
      *(_WORD *)&v31[18] = 2080;
      *(_QWORD *)&v31[20] = "adv-resolve.c";
      *(_WORD *)&v31[28] = 1024;
      *(_DWORD *)&v31[30] = 422;
      _os_log_impl(&dword_1DEF5C000, v27, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v28, 0x30u);
    }
    ++adv_service_state_finalized;
    adv_service_state_finalize(a8);
  }
}

void adv_service_state_cancel(uint64_t a1)
{
  _DNSServiceRef_t *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _DNSServiceRef_t *v7;
  int v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[34];
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_DNSServiceRef_t **)(a1 + 32);
  if (v2)
  {
    DNSServiceRefDeallocate(v2);
    *(_QWORD *)(a1 + 32) = 0;
    v3 = *(_DWORD *)a1;
    if (!*(_DWORD *)a1)
    {
      v4 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        goto LABEL_29;
      v12 = 136447490;
      v13 = "adv_service_state_cancel";
      v14 = 1024;
      *(_DWORD *)v15 = 0;
      *(_WORD *)&v15[4] = 2048;
      *(_QWORD *)&v15[6] = a1;
      *(_WORD *)&v15[14] = 2080;
      *(_QWORD *)&v15[16] = "state";
      *(_WORD *)&v15[24] = 2080;
      *(_QWORD *)&v15[26] = "adv-resolve.c";
      v16 = 1024;
      v17 = 119;
      v11 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_28;
    }
    v4 = advertising_proxy_global_os_log;
    v5 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v3 >= 10001)
    {
      if (!v5)
        goto LABEL_29;
      v12 = 136447490;
      v13 = "adv_service_state_cancel";
      v14 = 1024;
      *(_DWORD *)v15 = v3;
      *(_WORD *)&v15[4] = 2048;
      *(_QWORD *)&v15[6] = a1;
      *(_WORD *)&v15[14] = 2080;
      *(_QWORD *)&v15[16] = "state";
      *(_WORD *)&v15[24] = 2080;
      *(_QWORD *)&v15[26] = "adv-resolve.c";
      v16 = 1024;
      v17 = 119;
      v11 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_28;
    }
    if (v5)
    {
      v12 = 136447490;
      v13 = "adv_service_state_cancel";
      v14 = 1024;
      *(_DWORD *)v15 = v3;
      *(_WORD *)&v15[4] = 2048;
      *(_QWORD *)&v15[6] = a1;
      *(_WORD *)&v15[14] = 2080;
      *(_QWORD *)&v15[16] = "state";
      *(_WORD *)&v15[24] = 2080;
      *(_QWORD *)&v15[26] = "adv-resolve.c";
      v16 = 1024;
      v17 = 119;
      _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x36u);
      v3 = *(_DWORD *)a1;
    }
    *(_DWORD *)a1 = v3 - 1;
    if (v3 == 1)
    {
      v6 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        v12 = 136447234;
        v13 = "adv_service_state_cancel";
        v14 = 2048;
        *(_QWORD *)v15 = a1;
        *(_WORD *)&v15[8] = 2080;
        *(_QWORD *)&v15[10] = "state";
        *(_WORD *)&v15[18] = 2080;
        *(_QWORD *)&v15[20] = "adv-resolve.c";
        *(_WORD *)&v15[28] = 1024;
        *(_DWORD *)&v15[30] = 119;
        _os_log_impl(&dword_1DEF5C000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x30u);
      }
      ++adv_service_state_finalized;
      adv_service_state_finalize(a1);
    }
  }
  v7 = *(_DNSServiceRef_t **)(a1 + 24);
  if (!v7)
    return;
  DNSServiceRefDeallocate(v7);
  *(_QWORD *)(a1 + 24) = 0;
  v8 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    v4 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_29;
    v12 = 136447490;
    v13 = "adv_service_state_cancel";
    v14 = 1024;
    *(_DWORD *)v15 = 0;
    *(_WORD *)&v15[4] = 2048;
    *(_QWORD *)&v15[6] = a1;
    *(_WORD *)&v15[14] = 2080;
    *(_QWORD *)&v15[16] = "state";
    *(_WORD *)&v15[24] = 2080;
    *(_QWORD *)&v15[26] = "adv-resolve.c";
    v16 = 1024;
    v17 = 124;
    v11 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_28;
  }
  v4 = advertising_proxy_global_os_log;
  v9 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v8 >= 10001)
  {
    if (!v9)
      goto LABEL_29;
    v12 = 136447490;
    v13 = "adv_service_state_cancel";
    v14 = 1024;
    *(_DWORD *)v15 = v8;
    *(_WORD *)&v15[4] = 2048;
    *(_QWORD *)&v15[6] = a1;
    *(_WORD *)&v15[14] = 2080;
    *(_QWORD *)&v15[16] = "state";
    *(_WORD *)&v15[24] = 2080;
    *(_QWORD *)&v15[26] = "adv-resolve.c";
    v16 = 1024;
    v17 = 124;
    v11 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_28:
    _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0x36u);
LABEL_29:
    abort();
  }
  if (v9)
  {
    v12 = 136447490;
    v13 = "adv_service_state_cancel";
    v14 = 1024;
    *(_DWORD *)v15 = v8;
    *(_WORD *)&v15[4] = 2048;
    *(_QWORD *)&v15[6] = a1;
    *(_WORD *)&v15[14] = 2080;
    *(_QWORD *)&v15[16] = "state";
    *(_WORD *)&v15[24] = 2080;
    *(_QWORD *)&v15[26] = "adv-resolve.c";
    v16 = 1024;
    v17 = 124;
    _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x36u);
    v8 = *(_DWORD *)a1;
  }
  *(_DWORD *)a1 = v8 - 1;
  if (v8 == 1)
  {
    v10 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v12 = 136447234;
      v13 = "adv_service_state_cancel";
      v14 = 2048;
      *(_QWORD *)v15 = a1;
      *(_WORD *)&v15[8] = 2080;
      *(_QWORD *)&v15[10] = "state";
      *(_WORD *)&v15[18] = 2080;
      *(_QWORD *)&v15[20] = "adv-resolve.c";
      *(_WORD *)&v15[28] = 1024;
      *(_DWORD *)&v15[30] = 124;
      _os_log_impl(&dword_1DEF5C000, v10, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v12, 0x30u);
    }
    ++adv_service_state_finalized;
    adv_service_state_finalize(a1);
  }
}

uint64_t advertising_proxy_resolve_create(int **a1, NSObject *a2, const char *a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t result;
  NSObject *v15;
  int *v16;
  int *v17;
  uint64_t v18;
  DNSServiceRef *v19;
  NSObject *v20;
  int *v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  DNSServiceErrorType v29;
  DNSServiceErrorType v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  DNSServiceRef *v45;
  NSObject *v46;
  int *v47;
  int v48;
  int v49;
  int v50;
  DNSServiceErrorType v51;
  DNSServiceErrorType v52;
  NSObject *v53;
  int v54;
  NSObject *v55;
  _BOOL4 v56;
  NSObject *v57;
  NSObject *v58;
  int v59;
  int v60;
  int v61;
  NSObject *queue;
  int *v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  _BYTE v67[34];
  __int16 v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = 4294901757;
  result = 4294901747;
  if (!a1 || !a3 || !a4 || !a6)
    return result;
  if (a2)
    v15 = a2;
  else
    v15 = MEMORY[0x1E0C80D38];
  v16 = advertising_proxy_subscription_create();
  if (!v16)
    return 4294901757;
  v17 = v16;
  queue = v15;
  v18 = adv_instance_state_create(a3, a4, "local");
  if (v18)
  {
    v19 = (DNSServiceRef *)v18;
    adv_subscriber_add((size_t *)(v18 + 56), (void **)(v18 + 64), v17);
    v63 = v17;
    *((_QWORD *)v17 + 3) = v19;
    v20 = advertising_proxy_global_os_log;
    v21 = (int *)v19;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v22 = *(_DWORD *)v19;
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      v66 = 1024;
      *(_DWORD *)v67 = v22;
      *(_WORD *)&v67[4] = 2048;
      *(_QWORD *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(_QWORD *)&v67[16] = "subscription->local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(_QWORD *)&v67[26] = "adv-resolve.c";
      v68 = 1024;
      v69 = 563;
      _os_log_impl(&dword_1DEF5C000, v20, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      v21 = (int *)*((_QWORD *)v63 + 3);
    }
    v23 = *v21;
    if (*v21)
    {
      v24 = v23 + 1;
      *v21 = v23 + 1;
      if (v23 + 1 >= 10001)
      {
        v25 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_91;
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        v66 = 1024;
        *(_DWORD *)v67 = v24;
        *(_WORD *)&v67[4] = 2048;
        *(_QWORD *)&v67[6] = v21;
        *(_WORD *)&v67[14] = 2080;
        *(_QWORD *)&v67[16] = "subscription->local_instance";
        *(_WORD *)&v67[24] = 2080;
        *(_QWORD *)&v67[26] = "adv-resolve.c";
        v68 = 1024;
        v69 = 563;
        v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_16;
      }
    }
    else
    {
      ++adv_instance_state_created;
      *v21 = 1;
    }
    *((_QWORD *)v63 + 1) = a6;
    *((_QWORD *)v63 + 6) = a7;
    if (a5)
      v28 = a5;
    else
      v28 = "local";
    v29 = DNSServiceResolve(v19 + 6, 0, 0, a3, a4, v28, (DNSServiceResolveReply)advertising_proxy_resolve_callback, v19);
    if (v29)
    {
      v30 = v29;
      v31 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446979;
        v65 = "advertising_proxy_resolve_create";
        v66 = 2081;
        *(_QWORD *)v67 = a3;
        *(_WORD *)&v67[8] = 2082;
        *(_QWORD *)&v67[10] = a4;
        *(_WORD *)&v67[18] = 1024;
        *(_DWORD *)&v67[20] = v30;
        _os_log_error_impl(&dword_1DEF5C000, v31, OS_LOG_TYPE_ERROR, "%{public}s: \"resolve for %{private}s on service %{public}s in the default domains failed with %d\"", buf, 0x26u);
      }
      goto LABEL_27;
    }
    if (DNSServiceSetDispatchQueue(v19[6], queue))
    {
LABEL_27:
      v8 = 4294901759;
      v17 = v63;
      goto LABEL_28;
    }
    v40 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v41 = *(_DWORD *)v19;
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      v66 = 1024;
      *(_DWORD *)v67 = v41;
      *(_WORD *)&v67[4] = 2048;
      *(_QWORD *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(_QWORD *)&v67[16] = "local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(_QWORD *)&v67[26] = "adv-resolve.c";
      v68 = 1024;
      v69 = 584;
      _os_log_impl(&dword_1DEF5C000, v40, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    }
    v42 = *(_DWORD *)v19;
    if (*(_DWORD *)v19)
    {
      v43 = v42 + 1;
      *(_DWORD *)v19 = v42 + 1;
      if (v42 + 1 >= 10001)
      {
        v37 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_91;
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        v66 = 1024;
        *(_DWORD *)v67 = v43;
        *(_WORD *)&v67[4] = 2048;
        *(_QWORD *)&v67[6] = v19;
        *(_WORD *)&v67[14] = 2080;
        *(_QWORD *)&v67[16] = "local_instance";
        *(_WORD *)&v67[24] = 2080;
        *(_QWORD *)&v67[26] = "adv-resolve.c";
        v68 = 1024;
        v69 = 584;
        v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
LABEL_89:
        v27 = v37;
        goto LABEL_90;
      }
    }
    else
    {
      ++adv_instance_state_created;
      *(_DWORD *)v19 = 1;
    }
    v17 = v63;
    if (a5)
    {
LABEL_54:
      result = 0;
      *a1 = v17;
      return result;
    }
    v44 = adv_instance_state_create(a3, a4, "default.service.arpa");
    if (!v44)
      goto LABEL_28;
    v45 = (DNSServiceRef *)v44;
    adv_subscriber_add((size_t *)(v44 + 56), (void **)(v44 + 64), v63);
    *((_QWORD *)v63 + 4) = v45;
    v46 = advertising_proxy_global_os_log;
    v47 = (int *)v45;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v48 = *(_DWORD *)v45;
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      v66 = 1024;
      *(_DWORD *)v67 = v48;
      *(_WORD *)&v67[4] = 2048;
      *(_QWORD *)&v67[6] = v45;
      *(_WORD *)&v67[14] = 2080;
      *(_QWORD *)&v67[16] = "subscription->push_instance";
      *(_WORD *)&v67[24] = 2080;
      *(_QWORD *)&v67[26] = "adv-resolve.c";
      v68 = 1024;
      v69 = 594;
      _os_log_impl(&dword_1DEF5C000, v46, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      v47 = (int *)*((_QWORD *)v63 + 4);
    }
    v49 = *v47;
    if (*v47)
    {
      v50 = v49 + 1;
      *v47 = v49 + 1;
      if (v49 + 1 >= 10001)
      {
        v25 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_91;
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        v66 = 1024;
        *(_DWORD *)v67 = v50;
        *(_WORD *)&v67[4] = 2048;
        *(_QWORD *)&v67[6] = v47;
        *(_WORD *)&v67[14] = 2080;
        *(_QWORD *)&v67[16] = "subscription->push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(_QWORD *)&v67[26] = "adv-resolve.c";
        v68 = 1024;
        v69 = 594;
        v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_16;
      }
    }
    else
    {
      ++adv_instance_state_created;
      *v47 = 1;
    }
    v51 = DNSServiceResolve(v45 + 6, 0, 0, a3, a4, "default.service.arpa", (DNSServiceResolveReply)advertising_proxy_resolve_callback, v45);
    if (v51)
    {
      v52 = v51;
      v53 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446979;
        v65 = "advertising_proxy_resolve_create";
        v66 = 2081;
        *(_QWORD *)v67 = a3;
        *(_WORD *)&v67[8] = 2082;
        *(_QWORD *)&v67[10] = a4;
        *(_WORD *)&v67[18] = 1024;
        *(_DWORD *)&v67[20] = v52;
        _os_log_error_impl(&dword_1DEF5C000, v53, OS_LOG_TYPE_ERROR, "%{public}s: \"resolve for %{private}s on service %{public}s in the push domain failed with %d\"", buf, 0x26u);
      }
    }
    else if (!DNSServiceSetDispatchQueue(v45[6], queue))
    {
      v58 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        v59 = *(_DWORD *)v45;
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        v66 = 1024;
        *(_DWORD *)v67 = v59;
        *(_WORD *)&v67[4] = 2048;
        *(_QWORD *)&v67[6] = v45;
        *(_WORD *)&v67[14] = 2080;
        *(_QWORD *)&v67[16] = "push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(_QWORD *)&v67[26] = "adv-resolve.c";
        v68 = 1024;
        v69 = 605;
        _os_log_impl(&dword_1DEF5C000, v58, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      }
      v60 = *(_DWORD *)v45;
      v17 = v63;
      if (*(_DWORD *)v45)
      {
        v61 = v60 + 1;
        *(_DWORD *)v45 = v60 + 1;
        if (v60 + 1 >= 10001)
        {
          v25 = advertising_proxy_global_os_log;
          if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
            goto LABEL_91;
          *(_DWORD *)buf = 136447490;
          v65 = "advertising_proxy_resolve_create";
          v66 = 1024;
          *(_DWORD *)v67 = v61;
          *(_WORD *)&v67[4] = 2048;
          *(_QWORD *)&v67[6] = v45;
          *(_WORD *)&v67[14] = 2080;
          *(_QWORD *)&v67[16] = "push_instance";
          *(_WORD *)&v67[24] = 2080;
          *(_QWORD *)&v67[26] = "adv-resolve.c";
          v68 = 1024;
          v69 = 605;
          v26 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
          goto LABEL_16;
        }
      }
      else
      {
        ++adv_instance_state_created;
        *(_DWORD *)v45 = 1;
      }
      goto LABEL_54;
    }
    adv_instance_state_cancel((uint64_t)v45);
    v54 = *(_DWORD *)v45;
    if (!*(_DWORD *)v45)
    {
      v25 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        v66 = 1024;
        *(_DWORD *)v67 = 0;
        *(_WORD *)&v67[4] = 2048;
        *(_QWORD *)&v67[6] = v45;
        *(_WORD *)&v67[14] = 2080;
        *(_QWORD *)&v67[16] = "push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(_QWORD *)&v67[26] = "adv-resolve.c";
        v68 = 1024;
        v69 = 622;
        v26 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
LABEL_16:
        v27 = v25;
LABEL_90:
        _os_log_impl(&dword_1DEF5C000, v27, OS_LOG_TYPE_INFO, v26, buf, 0x36u);
        goto LABEL_91;
      }
      goto LABEL_91;
    }
    v55 = advertising_proxy_global_os_log;
    v56 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v54 >= 10001)
    {
      if (v56)
      {
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        v66 = 1024;
        *(_DWORD *)v67 = v54;
        *(_WORD *)&v67[4] = 2048;
        *(_QWORD *)&v67[6] = v45;
        *(_WORD *)&v67[14] = 2080;
        *(_QWORD *)&v67[16] = "push_instance";
        *(_WORD *)&v67[24] = 2080;
        *(_QWORD *)&v67[26] = "adv-resolve.c";
        v68 = 1024;
        v69 = 622;
        v26 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
        v27 = v55;
        goto LABEL_90;
      }
      goto LABEL_91;
    }
    v17 = v63;
    if (v56)
    {
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      v66 = 1024;
      *(_DWORD *)v67 = v54;
      *(_WORD *)&v67[4] = 2048;
      *(_QWORD *)&v67[6] = v45;
      *(_WORD *)&v67[14] = 2080;
      *(_QWORD *)&v67[16] = "push_instance";
      *(_WORD *)&v67[24] = 2080;
      *(_QWORD *)&v67[26] = "adv-resolve.c";
      v68 = 1024;
      v69 = 622;
      _os_log_impl(&dword_1DEF5C000, v55, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      v54 = *(_DWORD *)v45;
    }
    *(_DWORD *)v45 = v54 - 1;
    if (v54 == 1)
    {
      v57 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        v65 = "advertising_proxy_resolve_create";
        v66 = 2048;
        *(_QWORD *)v67 = v45;
        *(_WORD *)&v67[8] = 2080;
        *(_QWORD *)&v67[10] = "push_instance";
        *(_WORD *)&v67[18] = 2080;
        *(_QWORD *)&v67[20] = "adv-resolve.c";
        *(_WORD *)&v67[28] = 1024;
        *(_DWORD *)&v67[30] = 622;
        _os_log_impl(&dword_1DEF5C000, v57, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
      }
      ++adv_instance_state_finalized;
      adv_instance_state_finalize((uint64_t)v45);
    }
    v8 = 4294901759;
LABEL_28:
    adv_instance_state_cancel((uint64_t)v19);
    v32 = *(_DWORD *)v19;
    if (!*(_DWORD *)v19)
    {
      v37 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        goto LABEL_91;
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      v66 = 1024;
      *(_DWORD *)v67 = 0;
      *(_WORD *)&v67[4] = 2048;
      *(_QWORD *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(_QWORD *)&v67[16] = "local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(_QWORD *)&v67[26] = "adv-resolve.c";
      v68 = 1024;
      v69 = 626;
      v26 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_89;
    }
    v33 = advertising_proxy_global_os_log;
    v34 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v32 < 10001)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136447490;
        v65 = "advertising_proxy_resolve_create";
        v66 = 1024;
        *(_DWORD *)v67 = v32;
        *(_WORD *)&v67[4] = 2048;
        *(_QWORD *)&v67[6] = v19;
        *(_WORD *)&v67[14] = 2080;
        *(_QWORD *)&v67[16] = "local_instance";
        *(_WORD *)&v67[24] = 2080;
        *(_QWORD *)&v67[26] = "adv-resolve.c";
        v68 = 1024;
        v69 = 626;
        _os_log_impl(&dword_1DEF5C000, v33, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
        v32 = *(_DWORD *)v19;
      }
      *(_DWORD *)v19 = v32 - 1;
      if (v32 == 1)
      {
        v35 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136447234;
          v65 = "advertising_proxy_resolve_create";
          v66 = 2048;
          *(_QWORD *)v67 = v19;
          *(_WORD *)&v67[8] = 2080;
          *(_QWORD *)&v67[10] = "local_instance";
          *(_WORD *)&v67[18] = 2080;
          *(_QWORD *)&v67[20] = "adv-resolve.c";
          *(_WORD *)&v67[28] = 1024;
          *(_DWORD *)&v67[30] = 626;
          _os_log_impl(&dword_1DEF5C000, v35, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize((uint64_t)v19);
      }
      goto LABEL_36;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136447490;
      v65 = "advertising_proxy_resolve_create";
      v66 = 1024;
      *(_DWORD *)v67 = v32;
      *(_WORD *)&v67[4] = 2048;
      *(_QWORD *)&v67[6] = v19;
      *(_WORD *)&v67[14] = 2080;
      *(_QWORD *)&v67[16] = "local_instance";
      *(_WORD *)&v67[24] = 2080;
      *(_QWORD *)&v67[26] = "adv-resolve.c";
      v68 = 1024;
      v69 = 626;
      v26 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      v27 = v33;
      goto LABEL_90;
    }
LABEL_91:
    abort();
  }
LABEL_36:
  advertising_proxy_subscription_cancel(v17);
  v36 = *v17;
  if (!*v17)
  {
    v37 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_91;
    *(_DWORD *)buf = 136447490;
    v65 = "advertising_proxy_resolve_create";
    v66 = 1024;
    *(_DWORD *)v67 = 0;
    *(_WORD *)&v67[4] = 2048;
    *(_QWORD *)&v67[6] = v17;
    *(_WORD *)&v67[14] = 2080;
    *(_QWORD *)&v67[16] = "subscription";
    *(_WORD *)&v67[24] = 2080;
    *(_QWORD *)&v67[26] = "adv-resolve.c";
    v68 = 1024;
    v69 = 630;
    v26 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_89;
  }
  v37 = advertising_proxy_global_os_log;
  v38 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v36 >= 10001)
  {
    if (!v38)
      goto LABEL_91;
    *(_DWORD *)buf = 136447490;
    v65 = "advertising_proxy_resolve_create";
    v66 = 1024;
    *(_DWORD *)v67 = v36;
    *(_WORD *)&v67[4] = 2048;
    *(_QWORD *)&v67[6] = v17;
    *(_WORD *)&v67[14] = 2080;
    *(_QWORD *)&v67[16] = "subscription";
    *(_WORD *)&v67[24] = 2080;
    *(_QWORD *)&v67[26] = "adv-resolve.c";
    v68 = 1024;
    v69 = 630;
    v26 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_89;
  }
  if (v38)
  {
    *(_DWORD *)buf = 136447490;
    v65 = "advertising_proxy_resolve_create";
    v66 = 1024;
    *(_DWORD *)v67 = v36;
    *(_WORD *)&v67[4] = 2048;
    *(_QWORD *)&v67[6] = v17;
    *(_WORD *)&v67[14] = 2080;
    *(_QWORD *)&v67[16] = "subscription";
    *(_WORD *)&v67[24] = 2080;
    *(_QWORD *)&v67[26] = "adv-resolve.c";
    v68 = 1024;
    v69 = 630;
    _os_log_impl(&dword_1DEF5C000, v37, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    v36 = *v17;
  }
  *v17 = v36 - 1;
  if (v36 == 1)
  {
    v39 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136447234;
      v65 = "advertising_proxy_resolve_create";
      v66 = 2048;
      *(_QWORD *)v67 = v17;
      *(_WORD *)&v67[8] = 2080;
      *(_QWORD *)&v67[10] = "subscription";
      *(_WORD *)&v67[18] = 2080;
      *(_QWORD *)&v67[20] = "adv-resolve.c";
      *(_WORD *)&v67[28] = 1024;
      *(_DWORD *)&v67[30] = 630;
      _os_log_impl(&dword_1DEF5C000, v39, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
    }
    ++advertising_proxy_subscription_finalized;
    advertising_proxy_subscription_finalize(v17);
  }
  return v8;
}

uint64_t adv_instance_state_create(const char *a1, const char *a2, const char *a3)
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  const char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  _BOOL4 v22;
  NSObject *v23;
  int v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[34];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = malloc_type_calloc(1uLL, 0x48uLL, 0x10B004053BFA4E5uLL);
  v7 = advertising_proxy_global_os_log;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
    {
      v25 = 136446723;
      v26 = "adv_instance_state_create";
      v27 = 2081;
      *(_QWORD *)v28 = a1;
      *(_WORD *)&v28[8] = 2082;
      *(_QWORD *)&v28[10] = a2;
      _os_log_error_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_ERROR, "%{public}s: \"no memory for state %{private}s . %{public}s\"", (uint8_t *)&v25, 0x20u);
    }
    return 0;
  }
  v8 = (uint64_t)v6;
  if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
  {
    v9 = *(_DWORD *)v8;
    v25 = 136447490;
    v26 = "adv_instance_state_create";
    v27 = 1024;
    *(_DWORD *)v28 = v9;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = v8;
    *(_WORD *)&v28[14] = 2080;
    *(_QWORD *)&v28[16] = "state";
    *(_WORD *)&v28[24] = 2080;
    *(_QWORD *)&v28[26] = "adv-resolve.c";
    v29 = 1024;
    v30 = 213;
    _os_log_impl(&dword_1DEF5C000, v7, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:  retain at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v25, 0x36u);
  }
  v10 = *(_DWORD *)v8;
  if (*(_DWORD *)v8)
  {
    v11 = v10 + 1;
    *(_DWORD *)v8 = v10 + 1;
    if (v10 + 1 >= 10001)
    {
      v12 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        goto LABEL_38;
      v25 = 136447490;
      v26 = "adv_instance_state_create";
      v27 = 1024;
      *(_DWORD *)v28 = v11;
      *(_WORD *)&v28[4] = 2048;
      *(_QWORD *)&v28[6] = v8;
      *(_WORD *)&v28[14] = 2080;
      *(_QWORD *)&v28[16] = "state";
      *(_WORD *)&v28[24] = 2080;
      *(_QWORD *)&v28[26] = "adv-resolve.c";
      v29 = 1024;
      v30 = 213;
      v13 = "%{public}s: \"ALLOC: retain at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_37;
    }
  }
  else
  {
    ++adv_instance_state_created;
    *(_DWORD *)v8 = 1;
  }
  v14 = strdup(a1);
  *(_QWORD *)(v8 + 24) = v14;
  if (!v14)
  {
    v20 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v25 = 136446723;
    v26 = "adv_instance_state_create";
    v27 = 2081;
    *(_QWORD *)v28 = a1;
    *(_WORD *)&v28[8] = 2082;
    *(_QWORD *)&v28[10] = a2;
    v18 = "%{public}s: \"no memory for name %{private}s . %{public}s\"";
LABEL_31:
    v19 = v20;
    goto LABEL_32;
  }
  v15 = strdup(a2);
  *(_QWORD *)(v8 + 32) = v15;
  if (!v15)
  {
    v20 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v25 = 136446723;
    v26 = "adv_instance_state_create";
    v27 = 2081;
    *(_QWORD *)v28 = a1;
    *(_WORD *)&v28[8] = 2082;
    *(_QWORD *)&v28[10] = a2;
    v18 = "%{public}s: \"no memory for service type %{private}s . %{public}s\"";
    goto LABEL_31;
  }
  if (a3)
  {
    v16 = strdup(a3);
    *(_QWORD *)(v8 + 40) = v16;
    if (!v16)
    {
      v17 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_ERROR))
      {
        v25 = 136446723;
        v26 = "adv_instance_state_create";
        v27 = 2081;
        *(_QWORD *)v28 = a1;
        *(_WORD *)&v28[8] = 2082;
        *(_QWORD *)&v28[10] = a3;
        v18 = "%{public}s: \"no memory for domain %{private}s . %{public}s\"";
        v19 = v17;
LABEL_32:
        _os_log_error_impl(&dword_1DEF5C000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v25, 0x20u);
      }
LABEL_20:
      v21 = *(_DWORD *)v8;
      if (!*(_DWORD *)v8)
      {
        v12 = advertising_proxy_global_os_log;
        if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
          goto LABEL_38;
        v25 = 136447490;
        v26 = "adv_instance_state_create";
        v27 = 1024;
        *(_DWORD *)v28 = 0;
        *(_WORD *)&v28[4] = 2048;
        *(_QWORD *)&v28[6] = v8;
        *(_WORD *)&v28[14] = 2080;
        *(_QWORD *)&v28[16] = "state";
        *(_WORD *)&v28[24] = 2080;
        *(_QWORD *)&v28[26] = "adv-resolve.c";
        v29 = 1024;
        v30 = 236;
        v13 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
        goto LABEL_37;
      }
      v12 = advertising_proxy_global_os_log;
      v22 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
      if (v21 >= 10001)
      {
        if (!v22)
          goto LABEL_38;
        v25 = 136447490;
        v26 = "adv_instance_state_create";
        v27 = 1024;
        *(_DWORD *)v28 = v21;
        *(_WORD *)&v28[4] = 2048;
        *(_QWORD *)&v28[6] = v8;
        *(_WORD *)&v28[14] = 2080;
        *(_QWORD *)&v28[16] = "state";
        *(_WORD *)&v28[24] = 2080;
        *(_QWORD *)&v28[26] = "adv-resolve.c";
        v29 = 1024;
        v30 = 236;
        v13 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_37:
        _os_log_impl(&dword_1DEF5C000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v25, 0x36u);
LABEL_38:
        abort();
      }
      if (v22)
      {
        v25 = 136447490;
        v26 = "adv_instance_state_create";
        v27 = 1024;
        *(_DWORD *)v28 = v21;
        *(_WORD *)&v28[4] = 2048;
        *(_QWORD *)&v28[6] = v8;
        *(_WORD *)&v28[14] = 2080;
        *(_QWORD *)&v28[16] = "state";
        *(_WORD *)&v28[24] = 2080;
        *(_QWORD *)&v28[26] = "adv-resolve.c";
        v29 = 1024;
        v30 = 236;
        _os_log_impl(&dword_1DEF5C000, v12, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v25, 0x36u);
        v21 = *(_DWORD *)v8;
      }
      *(_DWORD *)v8 = v21 - 1;
      if (v21 == 1)
      {
        v23 = advertising_proxy_global_os_log;
        if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        {
          v25 = 136447234;
          v26 = "adv_instance_state_create";
          v27 = 2048;
          *(_QWORD *)v28 = v8;
          *(_WORD *)&v28[8] = 2080;
          *(_QWORD *)&v28[10] = "state";
          *(_WORD *)&v28[18] = 2080;
          *(_QWORD *)&v28[20] = "adv-resolve.c";
          *(_WORD *)&v28[28] = 1024;
          *(_DWORD *)&v28[30] = 236;
          _os_log_impl(&dword_1DEF5C000, v23, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v25, 0x30u);
        }
        ++adv_instance_state_finalized;
        adv_instance_state_finalize(v8);
      }
      return 0;
    }
  }
  return v8;
}

void advertising_proxy_resolve_callback(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t i;
  uint64_t v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  _BYTE v33[34];
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a10)
  {
    v16 = *(_DWORD *)a10;
    if (!*(_DWORD *)a10)
    {
      v25 = advertising_proxy_global_os_log;
      if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
        goto LABEL_39;
      *(_DWORD *)buf = 136447490;
      v31 = "advertising_proxy_resolve_callback";
      v32 = 1024;
      *(_DWORD *)v33 = 0;
      *(_WORD *)&v33[4] = 2048;
      *(_QWORD *)&v33[6] = a10;
      *(_WORD *)&v33[14] = 2080;
      *(_QWORD *)&v33[16] = "instance";
      *(_WORD *)&v33[24] = 2080;
      *(_QWORD *)&v33[26] = "adv-resolve.c";
      v34 = 1024;
      v35 = 514;
      v28 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
      goto LABEL_35;
    }
    v17 = advertising_proxy_global_os_log;
    v18 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
    if (v16 >= 10001)
    {
      if (!v18)
        goto LABEL_39;
      *(_DWORD *)buf = 136447490;
      v31 = "advertising_proxy_resolve_callback";
      v32 = 1024;
      *(_DWORD *)v33 = v16;
      *(_WORD *)&v33[4] = 2048;
      *(_QWORD *)&v33[6] = a10;
      *(_WORD *)&v33[14] = 2080;
      *(_QWORD *)&v33[16] = "instance";
      *(_WORD *)&v33[24] = 2080;
      *(_QWORD *)&v33[26] = "adv-resolve.c";
      v34 = 1024;
      v35 = 514;
      v28 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
      v29 = v17;
LABEL_38:
      _os_log_impl(&dword_1DEF5C000, v29, OS_LOG_TYPE_INFO, v28, buf, 0x36u);
LABEL_39:
      abort();
    }
    if (v18)
    {
      *(_DWORD *)buf = 136447490;
      v31 = "advertising_proxy_resolve_callback";
      v32 = 1024;
      *(_DWORD *)v33 = v16;
      *(_WORD *)&v33[4] = 2048;
      *(_QWORD *)&v33[6] = a10;
      *(_WORD *)&v33[14] = 2080;
      *(_QWORD *)&v33[16] = "instance";
      *(_WORD *)&v33[24] = 2080;
      *(_QWORD *)&v33[26] = "adv-resolve.c";
      v34 = 1024;
      v35 = 514;
      _os_log_impl(&dword_1DEF5C000, v17, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
      v16 = *(_DWORD *)a10;
    }
    *(_DWORD *)a10 = v16 - 1;
    if (v16 == 1)
    {
      v19 = advertising_proxy_global_os_log;
      if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        v31 = "advertising_proxy_resolve_callback";
        v32 = 2048;
        *(_QWORD *)v33 = a10;
        *(_WORD *)&v33[8] = 2080;
        *(_QWORD *)&v33[10] = "instance";
        *(_WORD *)&v33[18] = 2080;
        *(_QWORD *)&v33[20] = "adv-resolve.c";
        *(_WORD *)&v33[28] = 1024;
        *(_DWORD *)&v33[30] = 514;
        _os_log_impl(&dword_1DEF5C000, v19, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
      }
      ++adv_instance_state_finalized;
      adv_instance_state_finalize(a10);
    }
  }
  if (a4)
    v20 = 4294901759;
  else
    v20 = 0;
  v21 = *(_QWORD *)(a10 + 56);
  if (v21)
  {
    for (i = 0; i < v21; ++i)
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a10 + 64) + 8 * i);
      if (v23)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8))(v23, v20, a3, 1, a5, a6, a7, a8, a9, a10);
        v21 = *(_QWORD *)(a10 + 56);
      }
    }
  }
  if (a4)
    adv_instance_state_cancel(a10);
  v24 = *(_DWORD *)a10;
  if (!*(_DWORD *)a10)
  {
    v25 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_39;
    *(_DWORD *)buf = 136447490;
    v31 = "advertising_proxy_resolve_callback";
    v32 = 1024;
    *(_DWORD *)v33 = 0;
    *(_WORD *)&v33[4] = 2048;
    *(_QWORD *)&v33[6] = a10;
    *(_WORD *)&v33[14] = 2080;
    *(_QWORD *)&v33[16] = "instance";
    *(_WORD *)&v33[24] = 2080;
    *(_QWORD *)&v33[26] = "adv-resolve.c";
    v34 = 1024;
    v35 = 529;
    v28 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
LABEL_35:
    v29 = v25;
    goto LABEL_38;
  }
  v25 = advertising_proxy_global_os_log;
  v26 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v24 >= 10001)
  {
    if (!v26)
      goto LABEL_39;
    *(_DWORD *)buf = 136447490;
    v31 = "advertising_proxy_resolve_callback";
    v32 = 1024;
    *(_DWORD *)v33 = v24;
    *(_WORD *)&v33[4] = 2048;
    *(_QWORD *)&v33[6] = a10;
    *(_WORD *)&v33[14] = 2080;
    *(_QWORD *)&v33[16] = "instance";
    *(_WORD *)&v33[24] = 2080;
    *(_QWORD *)&v33[26] = "adv-resolve.c";
    v34 = 1024;
    v35 = 529;
    v28 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_35;
  }
  if (v26)
  {
    *(_DWORD *)buf = 136447490;
    v31 = "advertising_proxy_resolve_callback";
    v32 = 1024;
    *(_DWORD *)v33 = v24;
    *(_WORD *)&v33[4] = 2048;
    *(_QWORD *)&v33[6] = a10;
    *(_WORD *)&v33[14] = 2080;
    *(_QWORD *)&v33[16] = "instance";
    *(_WORD *)&v33[24] = 2080;
    *(_QWORD *)&v33[26] = "adv-resolve.c";
    v34 = 1024;
    v35 = 529;
    _os_log_impl(&dword_1DEF5C000, v25, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", buf, 0x36u);
    v24 = *(_DWORD *)a10;
  }
  *(_DWORD *)a10 = v24 - 1;
  if (v24 == 1)
  {
    v27 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136447234;
      v31 = "advertising_proxy_resolve_callback";
      v32 = 2048;
      *(_QWORD *)v33 = a10;
      *(_WORD *)&v33[8] = 2080;
      *(_QWORD *)&v33[10] = "instance";
      *(_WORD *)&v33[18] = 2080;
      *(_QWORD *)&v33[20] = "adv-resolve.c";
      *(_WORD *)&v33[28] = 1024;
      *(_DWORD *)&v33[30] = 529;
      _os_log_impl(&dword_1DEF5C000, v27, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", buf, 0x30u);
    }
    ++adv_instance_state_finalized;
    adv_instance_state_finalize(a10);
  }
}

void adv_instance_state_cancel(uint64_t a1)
{
  _DNSServiceRef_t *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BYTE v11[34];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_DNSServiceRef_t **)(a1 + 48);
  if (!v2)
    return;
  DNSServiceRefDeallocate(v2);
  *(_QWORD *)(a1 + 48) = 0;
  v3 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    v4 = advertising_proxy_global_os_log;
    if (!os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v8 = 136447490;
    v9 = "adv_instance_state_cancel";
    v10 = 1024;
    *(_DWORD *)v11 = 0;
    *(_WORD *)&v11[4] = 2048;
    *(_QWORD *)&v11[6] = a1;
    *(_WORD *)&v11[14] = 2080;
    *(_QWORD *)&v11[16] = "state";
    *(_WORD *)&v11[24] = 2080;
    *(_QWORD *)&v11[26] = "adv-resolve.c";
    v12 = 1024;
    v13 = 171;
    v7 = "%{public}s: \"ALLOC: release after finalize at %2.2d: %p (%10s): %s:%d\"";
    goto LABEL_15;
  }
  v4 = advertising_proxy_global_os_log;
  v5 = os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO);
  if (v3 >= 10001)
  {
    if (!v5)
      goto LABEL_16;
    v8 = 136447490;
    v9 = "adv_instance_state_cancel";
    v10 = 1024;
    *(_DWORD *)v11 = v3;
    *(_WORD *)&v11[4] = 2048;
    *(_QWORD *)&v11[6] = a1;
    *(_WORD *)&v11[14] = 2080;
    *(_QWORD *)&v11[16] = "state";
    *(_WORD *)&v11[24] = 2080;
    *(_QWORD *)&v11[26] = "adv-resolve.c";
    v12 = 1024;
    v13 = 171;
    v7 = "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"";
LABEL_15:
    _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0x36u);
LABEL_16:
    abort();
  }
  if (v5)
  {
    v8 = 136447490;
    v9 = "adv_instance_state_cancel";
    v10 = 1024;
    *(_DWORD *)v11 = v3;
    *(_WORD *)&v11[4] = 2048;
    *(_QWORD *)&v11[6] = a1;
    *(_WORD *)&v11[14] = 2080;
    *(_QWORD *)&v11[16] = "state";
    *(_WORD *)&v11[24] = 2080;
    *(_QWORD *)&v11[26] = "adv-resolve.c";
    v12 = 1024;
    v13 = 171;
    _os_log_impl(&dword_1DEF5C000, v4, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC: release at %2.2d: %p (%10s): %s:%d\"", (uint8_t *)&v8, 0x36u);
    v3 = *(_DWORD *)a1;
  }
  *(_DWORD *)a1 = v3 - 1;
  if (v3 == 1)
  {
    v6 = advertising_proxy_global_os_log;
    if (os_log_type_enabled((os_log_t)advertising_proxy_global_os_log, OS_LOG_TYPE_INFO))
    {
      v8 = 136447234;
      v9 = "adv_instance_state_cancel";
      v10 = 2048;
      *(_QWORD *)v11 = a1;
      *(_WORD *)&v11[8] = 2080;
      *(_QWORD *)&v11[10] = "state";
      *(_WORD *)&v11[18] = 2080;
      *(_QWORD *)&v11[20] = "adv-resolve.c";
      *(_WORD *)&v11[28] = 1024;
      *(_DWORD *)&v11[30] = 171;
      _os_log_impl(&dword_1DEF5C000, v6, OS_LOG_TYPE_INFO, "%{public}s: \"ALLOC:      finalize: %p (%10s): %s:%d\"", (uint8_t *)&v8, 0x30u);
    }
    ++adv_instance_state_finalized;
    adv_instance_state_finalize(a1);
  }
}

uint64_t advertising_proxy_get_addresses()
{
  return 0;
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x1E0C80420](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, regtype, domain, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x1E0C80490](sdRef);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x1E0C804B8](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x1E0C804C8](service, queue);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x1E0C81098]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1E0C84918](object);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C85EE0](xarray, index, uuid);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}


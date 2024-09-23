void *_mdns_address_copy_description(_QWORD *a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;

  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || mdns_string_builder_append_sockaddr_description(v7, (uint64_t)(a1 + 3), a3))
  {
    v8 = 0;
  }
  else
  {
    v8 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v8;
}

BOOL _mdns_address_equal(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(a1 + 25);
  if (v2 != *(unsigned __int8 *)(a2 + 25))
    return 0;
  if (v2 == 30)
    return *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
        && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)
        && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40);
  return v2 == 2
      && *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
      && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28);
}

uint64_t mdns_address_create_ipv4(unsigned int a1, unsigned int a2)
{
  uint64_t result;

  result = _mdns_address_new();
  if (result)
  {
    *(_WORD *)(result + 24) = 528;
    *(_WORD *)(result + 26) = __rev16(a2);
    *(_DWORD *)(result + 28) = bswap32(a1);
  }
  return result;
}

uint64_t _mdns_address_new()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mdns_address_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_address_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

__n128 mdns_address_create_ipv6(__n128 *a1, unsigned int a2, int a3)
{
  uint64_t v6;
  __n128 result;

  v6 = _mdns_address_new();
  if (v6)
  {
    *(_WORD *)(v6 + 24) = 7708;
    *(_WORD *)(v6 + 26) = __rev16(a2);
    result = *a1;
    *(__n128 *)(v6 + 32) = *a1;
    *(_DWORD *)(v6 + 48) = a3;
  }
  return result;
}

uint64_t mdns_address_create_from_ip_address_string(char *a1)
{
  char *v1;
  int v2;
  _BYTE *v3;
  uint64_t result;
  uint64_t v5;
  unsigned int v6;
  unsigned __int8 *v7;
  char *v8;
  char *v9;
  int64_t v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char v20[128];
  __int128 v21;
  uint64_t v22;

  v1 = a1;
  v22 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v2 = *a1;
  if (v2 == 91)
  {
    v3 = a1 + 1;
    result = (uint64_t)strchr(a1 + 1, 93);
    if (!result)
      return result;
    v5 = result;
    if (_mdns_address_parse_ipv6(v3, (unsigned __int8 *)result, &v21, &v19))
      return 0;
    v6 = *(unsigned __int8 *)(v5 + 1);
    if (v6 == 58)
    {
      v7 = (unsigned __int8 *)(v5 + 2);
      goto LABEL_15;
    }
    if (*(_BYTE *)(v5 + 1))
      return 0;
LABEL_24:
    v14 = v19;
    result = _mdns_address_new();
    if (result)
    {
      *(_WORD *)(result + 24) = 7708;
      *(_WORD *)(result + 26) = bswap32(v6) >> 16;
      *(_OWORD *)(result + 32) = v21;
      *(_DWORD *)(result + 48) = v14;
    }
    return result;
  }
  if (!_mdns_address_parse_ipv6(a1, 0, &v21, &v19))
  {
    v6 = 0;
    goto LABEL_24;
  }
  v8 = strchr(v1, 58);
  if (v8)
  {
    v9 = v8;
    v10 = v8 - v1;
    if ((unint64_t)(v8 - v1) > 0x7F)
      return 0;
    __memcpy_chk();
    v20[v10] = 0;
    v7 = (unsigned __int8 *)(v9 + 1);
    v1 = v20;
  }
  else
  {
    v7 = 0;
  }
  if (inet_pton(2, v1, &v21) != 1)
    return 0;
LABEL_15:
  if (v7)
  {
    v11 = *v7;
    if ((v11 - 48) <= 9)
    {
      v6 = 0;
      v12 = v7 + 1;
      while (1)
      {
        v6 = 10 * v6 + (char)v11 - 48;
        if (HIWORD(v6))
          break;
        v13 = *v12++;
        v11 = v13;
        if ((v13 - 48) >= 0xA)
        {
          if (!v11)
            goto LABEL_23;
          return 0;
        }
      }
    }
    return 0;
  }
  v6 = 0;
LABEL_23:
  if (v2 == 91)
    goto LABEL_24;
  v15 = v21;
  v16 = BYTE1(v21);
  v17 = BYTE2(v21);
  v18 = BYTE3(v21);
  result = _mdns_address_new();
  if (result)
  {
    *(_WORD *)(result + 24) = 528;
    *(_WORD *)(result + 26) = bswap32(v6) >> 16;
    *(_DWORD *)(result + 28) = bswap32((v15 << 24) | (v16 << 16) | (v17 << 8) | v18);
  }
  return result;
}

uint64_t _mdns_address_parse_ipv6(_BYTE *a1, unsigned __int8 *a2, _OWORD *a3, _DWORD *a4)
{
  unsigned __int8 *v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  unint64_t v13;
  char *v14;
  char *p_dst;
  uint64_t result;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  int v19;
  char __dst;
  __int128 v21;
  char v22[128];
  uint64_t v23;

  v6 = a2;
  v23 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v6 = a1 - 1;
    while (*++v6)
      ;
  }
  v8 = v6 - a1;
  if (v6 <= a1)
  {
LABEL_8:
    v9 = 0;
  }
  else
  {
    v9 = (unint64_t)a1;
    while (*(_BYTE *)v9 != 37)
    {
      ++v9;
      if (!--v8)
        goto LABEL_8;
    }
  }
  if (v9)
    v10 = v9;
  else
    v10 = (unint64_t)v6;
  v11 = v10 - (_QWORD)a1;
  if (v10 - (unint64_t)a1 > 0x7F)
    return 4294960554;
  __memcpy_chk();
  v22[v11] = 0;
  if (inet_pton(30, v22, &v21) != 1)
    return 4294960554;
  if (v9)
  {
    v12 = (unsigned __int8 *)(v9 + 1);
    v13 = (unint64_t)&v6[-v9 - 1];
    if (v13 >= 0x11)
    {
      if (v13 == -1 || (v14 = (char *)malloc_type_malloc((size_t)&v6[-v9], 0xA172743EuLL), (p_dst = v14) == 0))
        __break(1u);
    }
    else
    {
      v14 = 0;
      p_dst = &__dst;
    }
    memcpy(p_dst, (const void *)(v9 + 1), (size_t)&v6[-v9 - 1]);
    p_dst[v13] = 0;
    LODWORD(v13) = if_nametoindex(p_dst);
    if (v14)
      free(v14);
    if (!(_DWORD)v13)
    {
      if (v12 >= v6)
        return 4294960554;
      v13 = 0;
      v17 = &v6[~v9];
      v18 = (unsigned __int8 *)(v9 + 1);
      while (1)
      {
        v19 = *v18;
        if ((v19 - 48) > 9)
          break;
        v13 = ((char)v19 - 48) + 10 * v13;
        if (HIDWORD(v13))
          return 4294960554;
        ++v18;
        if (!--v17)
        {
          v18 = v6;
          break;
        }
      }
      if (v18 != v6 || v18 == v12)
        return 4294960554;
    }
  }
  else
  {
    LODWORD(v13) = 0;
  }
  if (a3)
    *a3 = v21;
  result = 0;
  if (a4)
    *a4 = v13;
  return result;
}

uint64_t mdns_address_get_sockaddr(uint64_t a1)
{
  return a1 + 24;
}

uint64_t mdns_address_get_port(uint64_t a1)
{
  int v1;

  v1 = *(unsigned __int8 *)(a1 + 25);
  if (v1 == 30 || v1 == 2)
    return bswap32(*(unsigned __int16 *)(a1 + 26)) >> 16;
  else
    return 0;
}

uint64_t mdns_bpf_open(int a1, int *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  uint64_t v12;
  char __str[32];
  uint64_t v14;

  v4 = 0;
  v14 = *MEMORY[0x24BDAC8D0];
  while (1)
  {
    snprintf(__str, 0x20uLL, "/dev/bpf%d", v4);
    v5 = open(__str, a1);
    if ((v5 & 0x80000000) == 0)
    {
      v6 = 0;
      if (!a2)
        return v5;
      goto LABEL_17;
    }
    if (!*__error())
    {
      v6 = -6700;
      goto LABEL_13;
    }
    v6 = *__error();
    if (v6 != 16)
      break;
    if (++v4 == 100)
    {
      v6 = 16;
      if (!a2)
        return v5;
      goto LABEL_17;
    }
  }
  if (!v6)
    goto LABEL_16;
LABEL_13:
  if (_mdns_bpf_log_s_once != -1)
    dispatch_once(&_mdns_bpf_log_s_once, &__block_literal_global);
  v7 = _mdns_bpf_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mdns_bpf_log_s_log, OS_LOG_TYPE_ERROR))
  {
LABEL_16:
    if (!a2)
      return v5;
    goto LABEL_17;
  }
  *(_DWORD *)buf = 136446466;
  v10 = __str;
  v11 = 2048;
  v12 = v6;
  _os_log_error_impl(&dword_22983F000, v7, OS_LOG_TYPE_ERROR, "Failed to open %{public}s: %{mdns:err}ld", buf, 0x16u);
  if (a2)
LABEL_17:
    *a2 = v6;
  return v5;
}

os_log_t ___mdns_bpf_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "bpf");
  _mdns_bpf_log_s_log = (uint64_t)result;
  return result;
}

void *mdns_cf_callback_retain(int a1, void *object)
{
  os_retain(object);
  return object;
}

void mdns_cf_callback_release(int a1, void *object)
{
  os_release(object);
}

const char *mdns_cf_callback_copy_description(uint64_t a1)
{
  return _mdns_obj_copy_description_as_cfstring(a1);
}

uint64_t mdns_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v4)(uint64_t, uint64_t);

  if (a1 == a2)
    return 1;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16) && (v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 32)) != 0)
    return v4(a1, a2);
  else
    return 0;
}

BOOL mdns_cfarray_enumerate(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  BOOL v6;
  CFIndex i;
  const void *ValueAtIndex;

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
      if (((*(uint64_t (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex) & 1) == 0)
        break;
      ++i;
    }
  }
  return v6;
}

BOOL mdns_cfset_enumerate(const __CFSet *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  void **v6;
  uint64_t v8;
  char v9;
  _BYTE v10[7];
  void *values[2];
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
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  Count = CFSetGetCount(a1);
  if (Count < 1)
    return 1;
  v5 = Count;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
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
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)values = 0u;
  v12 = 0u;
  if ((unint64_t)Count <= 0x40)
  {
    v6 = values;
    CFSetGetValues(a1, (const void **)values);
    while (((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, *v6) & 1) != 0)
    {
      ++v6;
      if (!--v5)
        return 1;
    }
    return 0;
  }
  v8 = a2;
  v9 = 1;
  memset(v10, 0, sizeof(v10));
  CFSetApplyFunction(a1, (CFSetApplierFunction)_mdns_cf_applier_function, &v8);
  return v9 != 0;
}

void _mdns_cf_applier_function(uint64_t a1, _BYTE *a2)
{
  if (a2[8])
    a2[8] = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
}

os_log_t ___mhc_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mDNSResponder", "helper_client");
  _mhc_log_s_log = (uint64_t)result;
  return result;
}

dispatch_queue_t ___mhc_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mhc", 0);
  _mhc_queue_s_queue = (uint64_t)result;
  return result;
}

void ___mhc_create_connection_block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *string;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x22E2D1BFC](a2) == MEMORY[0x24BDACFB8])
  {
    if (_mhc_log_s_once != -1)
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4);
    v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      v9 = 138543618;
      v10 = v7;
      v11 = 2082;
      v12 = string;
      v6 = "Connection received error event -- connnection: %{public}@, error: %{public}s";
      goto LABEL_11;
    }
  }
  else
  {
    if (_mhc_log_s_once != -1)
      dispatch_once(&_mhc_log_s_once, &__block_literal_global_4);
    v4 = _mhc_log_s_log;
    if (os_log_type_enabled((os_log_t)_mhc_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v5;
      v11 = 2112;
      v12 = (const char *)a2;
      v6 = "Connection received unexpected event -- connection: %{public}@, event: %@";
LABEL_11:
      _os_log_debug_impl(&dword_22983F000, v4, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, 0x16u);
    }
  }
}

uint64_t _mhc_set_ip_forwarding(BOOL a1, int a2)
{
  xpc_object_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  _xpc_connection_s *mach_service;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[5];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  _QWORD handler[5];

  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (a2)
    v6 = "set_ipv6_forwarding";
  else
    v6 = "set_ipv4_forwarding";
  xpc_dictionary_set_string(v4, "command", v6);
  xpc_dictionary_set_BOOL(v5, "enable", a1);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = ___mhc_set_ip_forwarding_block_invoke;
  v12[3] = &unk_24F284380;
  v12[4] = &v14;
  v13 = a2;
  if (_mhc_queue_s_once != -1)
    dispatch_once(&_mhc_queue_s_once, &__block_literal_global_12);
  mach_service = xpc_connection_create_mach_service("com.apple.mDNSResponder_Helper", (dispatch_queue_t)_mhc_queue_s_queue, 2uLL);
  handler[0] = v7;
  handler[1] = 0x40000000;
  handler[2] = ___mhc_create_connection_block_invoke;
  handler[3] = &__block_descriptor_tmp_10_15;
  handler[4] = mach_service;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_activate(mach_service);
  v9 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
  ___mhc_set_ip_forwarding_block_invoke((uint64_t)v12, v9);
  if (mach_service)
  {
    xpc_connection_cancel(mach_service);
    xpc_release(mach_service);
  }
  if (v9)
    xpc_release(v9);
  if (v5)
    xpc_release(v5);
  v10 = *((unsigned int *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v10;
}

void ___mhc_set_ip_forwarding_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  int v5;
  _BOOL4 v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  os_log_type_t v12;
  int v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  value = xpc_dictionary_get_value(xdict, "error");
  if (value && (v4 = value, MEMORY[0x22E2D1BFC]() == MEMORY[0x24BDACFD0]))
  {
    v7 = xpc_int64_get_value(v4);
    v5 = v7;
    v6 = v7 != v7;
    if ((int)v7 != v7)
      v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_DWORD *)(v8 + 24))
    v9 = 1;
  else
    v9 = !v6;
  if (!v9)
    *(_DWORD *)(v8 + 24) = -6712;
  if (_mhc_log_s_once != -1)
    dispatch_once(&_mhc_log_s_once, &__block_literal_global_4);
  v10 = _mhc_log_s_log;
  v11 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)v11)
    v12 = OS_LOG_TYPE_ERROR;
  else
    v12 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)_mhc_log_s_log, v12))
  {
    if (*(_BYTE *)(a1 + 40))
      v13 = 6;
    else
      v13 = 4;
    v14[0] = 67109376;
    v14[1] = v13;
    v15 = 2048;
    v16 = v11;
    _os_log_impl(&dword_22983F000, v10, v12, "Set IPv%d forwarding -- error: %{mdns:err}ld", (uint8_t *)v14, 0x12u);
  }
}

void _mdns_client_finalize(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];

  v3 = a1 + 4;
  v2 = a1[4];
  if (v2)
  {
    v4 = a1[5];
    if (v4)
    {
      v5 = a1[3];
      if (v5)
      {
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 0x40000000;
        v7[2] = ___mdns_client_finalize_block_invoke;
        v7[3] = &__block_descriptor_tmp_3_19;
        v7[4] = v4;
        v7[5] = v2;
        dispatch_async(v5, v7);
      }
    }
  }
  *v3 = 0;
  v3[1] = 0;
  v6 = a1[3];
  if (v6)
  {
    dispatch_release(v6);
    a1[3] = 0;
  }
}

uint64_t ___mdns_client_finalize_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

void mdns_client_set_queue(uint64_t a1, dispatch_object_t object)
{
  NSObject *v4;

  if (!*(_BYTE *)(a1 + 49))
  {
    if (object)
      dispatch_retain(object);
    v4 = *(NSObject **)(a1 + 24);
    if (v4)
      dispatch_release(v4);
    *(_QWORD *)(a1 + 24) = object;
  }
}

void mdns_client_activate(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  *(_BYTE *)(a1 + 49) = 1;
  v2 = os_retain((void *)a1);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)(a1 + 16) + 48))(v2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_client_activate_block_invoke;
  block[3] = &__block_descriptor_tmp_21;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __mdns_client_activate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(_QWORD);
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    v2 = *(void (**)(_QWORD))(*(_QWORD *)(v1 + 16) + 64);
    v3 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      v2(*(_QWORD *)(a1 + 32));
      v3 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 48) = 1;
    v1 = v3;
  }
  os_release((void *)v1);
}

void mdns_client_invalidate(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  *(_BYTE *)(a1 + 49) = 1;
  v2 = os_retain((void *)a1);
  v3 = (*(uint64_t (**)(void *))(*(_QWORD *)(a1 + 16) + 48))(v2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_client_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_2;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __mdns_client_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(_QWORD);
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 48) != 2)
  {
    v2 = *(void (**)(_QWORD))(*(_QWORD *)(v1 + 16) + 72);
    v3 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      v2(*(_QWORD *)(a1 + 32));
      v3 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 48) = 2;
    v1 = v3;
  }
  os_release((void *)v1);
}

BOOL mdns_odoh_config_is_valid_inner(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v3;
  _BOOL8 result;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _DWORD v18[7];

  *(_QWORD *)&v18[5] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2 > 0xB)
    {
      v10 = *a1;
      if (v10 == 256 || v10 == 1791)
      {
        v11 = bswap32(a1[1]) >> 16;
        if (v11 + 4 > a2)
        {
          if (_mdns_crypto_log_s_once != -1)
            dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
          v12 = _mdns_crypto_log_s_log;
          result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
          if (result)
          {
            v17 = 67109120;
            v18[0] = v11;
            v5 = "Config length field is too large: %hu";
            v6 = v12;
            v7 = 8;
            goto LABEL_31;
          }
          return result;
        }
        if ((bswap32(a1[5]) >> 16) + 8 != v11)
        {
          if (_mdns_crypto_log_s_once != -1)
            dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
          v15 = _mdns_crypto_log_s_log;
          result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
          if (result)
          {
            v16 = (bswap32(a1[5]) >> 16) + 8;
            v17 = 67109376;
            v18[0] = v11;
            LOWORD(v18[1]) = 2048;
            *(_QWORD *)((char *)&v18[1] + 2) = v16;
            v5 = "Config length does not match: %hu != %zu";
            v6 = v15;
            v7 = 18;
            goto LABEL_31;
          }
          return result;
        }
        if (a1[2] == 0x2000 && a1[3] == 256 && a1[4] == 256)
          return 1;
        if (_mdns_crypto_log_s_once != -1)
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
        v13 = _mdns_crypto_log_s_log;
        result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_INFO);
        if (!result)
          return result;
        LOWORD(v17) = 0;
        v14 = "Config details are not supported";
      }
      else
      {
        if (_mdns_crypto_log_s_once != -1)
          dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
        v13 = _mdns_crypto_log_s_log;
        result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_INFO);
        if (!result)
          return result;
        LOWORD(v17) = 0;
        v14 = "Config version is not supported";
      }
      _os_log_impl(&dword_22983F000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 2u);
      return 0;
    }
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v3 = _mdns_crypto_log_s_log;
    result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      v17 = 134217984;
      *(_QWORD *)v18 = a2;
      v5 = "Config length is too short: %zu";
      v6 = v3;
      v7 = 12;
LABEL_31:
      _os_log_error_impl(&dword_22983F000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v17, v7);
      return 0;
    }
  }
  else
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v8 = _mdns_crypto_log_s_log;
    result = os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      LOWORD(v17) = 0;
      v5 = "Config is NULL";
      v6 = v8;
      v7 = 2;
      goto LABEL_31;
    }
  }
  return result;
}

uint64_t __mdns_encrypt_oblivious_request_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  memcpy((void *)(*(_QWORD *)(a1 + 32) + a3), __src, __n);
  return 1;
}

os_log_t ___mdns_crypto_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "crypto");
  _mdns_crypto_log_s_log = (uint64_t)result;
  return result;
}

dispatch_data_t mdns_decrypt_oblivious_response(NSObject *a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned int v15;
  size_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  size_t v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  unsigned __int16 *v49;
  unsigned __int16 *v50;
  int v51;
  uint64_t v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  size_t v56;
  uint64_t v57;
  dispatch_data_t v58;
  size_t v59;
  size_t v60;
  size_t size;
  _QWORD applier[5];
  uint8_t buf[4];
  unint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  _BYTE v68[18];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  if (!a2 || !a3 || !a4)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v23 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)buf = 0;
    v24 = "Parameters are invalid";
    goto LABEL_21;
  }
  cchpke_params_x25519_AESGCM128_HKDF_SHA256();
  v8 = cchpke_params_sizeof_kdf_hash();
  v9 = cchpke_params_sizeof_aead_tag();
  v10 = cchpke_params_sizeof_aead_key();
  v11 = dispatch_data_get_size(a1);
  if (v11 <= v9 + 5)
  {
    if (_mdns_crypto_log_s_once == -1)
    {
LABEL_19:
      v23 = _mdns_crypto_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
        return 0;
      *(_WORD *)buf = 0;
      v24 = "Invalid encrypted response length";
LABEL_21:
      _os_log_error_impl(&dword_22983F000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
      return 0;
    }
LABEL_80:
    dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    goto LABEL_19;
  }
  v12 = v11;
  v13 = (unsigned __int8 *)malloc_type_calloc(1uLL, v11, 0xF1748037uLL);
  if (!v13)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v14 = v13;
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 0x40000000;
  applier[2] = __mdns_decrypt_oblivious_response_block_invoke;
  applier[3] = &__block_descriptor_tmp_3_33;
  applier[4] = v13;
  dispatch_data_apply(a1, applier);
  if (*v14 != 2)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v25 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    v26 = *v14;
    *(_DWORD *)buf = 67109120;
    LODWORD(v64) = v26;
    v20 = "Invalid message type %u";
LABEL_30:
    v21 = v25;
    v22 = 8;
LABEL_31:
    _os_log_error_impl(&dword_22983F000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
LABEL_70:
    v47 = v14;
LABEL_71:
    free(v47);
    return 0;
  }
  size = v10;
  v15 = *(unsigned __int16 *)(v14 + 1);
  v16 = __rev16(v15);
  if (v12 <= v16 + 5 + v9)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v25 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    *(_DWORD *)buf = 67109120;
    LODWORD(v64) = v16;
    v20 = "Invalid response nonce length %hu";
    goto LABEL_30;
  }
  v60 = v8;
  v17 = bswap32(*(unsigned __int16 *)&v14[v16 + 3]) >> 16;
  if (v12 != v16 + 5 + v17)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v27 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    *(_DWORD *)buf = 134218752;
    v64 = v12;
    v65 = 2048;
    v66 = v16 + 3;
    v67 = 2048;
    *(_QWORD *)v68 = 2;
    *(_WORD *)&v68[8] = 2048;
    *(_QWORD *)&v68[10] = v17;
    v20 = "Invalid ciphertext length: %zu != %zu + %zu + %zu";
    v21 = v27;
    v22 = 42;
    goto LABEL_31;
  }
  v18 = v17 - v9;
  if (v18 <= 3)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v19 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    *(_DWORD *)buf = 134217984;
    v64 = v18;
    v20 = "Invalid plaintext length: %zu";
    v21 = v19;
    v22 = 12;
    goto LABEL_31;
  }
  ccsha256_di();
  if (a5 + v16 == -2)
    goto LABEL_79;
  v59 = v18;
  v28 = (char *)malloc_type_calloc(1uLL, a5 + v16 + 2, 0xF1748037uLL);
  if (!v28)
    goto LABEL_79;
  v29 = v28;
  memcpy(v28, a4, a5);
  *(_WORD *)&v29[a5] = v15;
  memcpy(&v29[a5 + 2], v14 + 3, v16);
  if (!size)
    goto LABEL_79;
  v30 = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
  if (!v30)
    goto LABEL_79;
  v31 = v30;
  if (cchpke_initiator_export())
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v32 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22983F000, v32, OS_LOG_TYPE_ERROR, "cchpke_initiator_export failed", buf, 2u);
    }
    free(v31);
    v33 = v29;
LABEL_69:
    free(v33);
    goto LABEL_70;
  }
  if (!v60)
    goto LABEL_79;
  v34 = malloc_type_calloc(1uLL, v60, 0xF1748037uLL);
  if (!v34)
    goto LABEL_79;
  v35 = cchkdf_extract();
  free(v31);
  free(v29);
  if (v35)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v36 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v64) = v35;
      _os_log_error_impl(&dword_22983F000, v36, OS_LOG_TYPE_ERROR, "Secret extract error: %d", buf, 8u);
    }
    v33 = v34;
    goto LABEL_69;
  }
  v37 = malloc_type_calloc(1uLL, size, 0xF1748037uLL);
  if (!v37)
    goto LABEL_79;
  v38 = v37;
  v39 = cchkdf_expand();
  if (v39)
  {
    v40 = v39;
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v41 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v64) = v40;
      _os_log_error_impl(&dword_22983F000, v41, OS_LOG_TYPE_ERROR, "Secret key expand error: %d", buf, 8u);
    }
    free(v34);
    v33 = v38;
    goto LABEL_69;
  }
  v42 = cchpke_params_sizeof_aead_nonce();
  if (!v42)
    goto LABEL_79;
  v43 = malloc_type_calloc(1uLL, v42, 0xF1748037uLL);
  if (!v43)
    goto LABEL_79;
  v44 = v43;
  v45 = cchkdf_expand();
  free(v34);
  if (v45)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v46 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v64) = v45;
      _os_log_error_impl(&dword_22983F000, v46, OS_LOG_TYPE_ERROR, "Secret nonce expand error: %d", buf, 8u);
    }
    free(v38);
    v33 = v44;
    goto LABEL_69;
  }
  v49 = (unsigned __int16 *)malloc_type_calloc(1uLL, v59, 0xF1748037uLL);
  if (!v49)
    goto LABEL_79;
  v50 = v49;
  ccaes_gcm_decrypt_mode();
  v51 = ccgcm_one_shot();
  free(v38);
  free(v44);
  free(v14);
  if (v51)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v52 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v53 = "Decrypt error: decrypt_error";
    v54 = v52;
    v55 = 2;
LABEL_86:
    _os_log_error_impl(&dword_22983F000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);
LABEL_87:
    v47 = v50;
    goto LABEL_71;
  }
  v56 = bswap32(*v50) >> 16;
  if (v59 < v56 + 4)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v57 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_87;
    *(_DWORD *)buf = 134218752;
    v64 = v59;
    v65 = 2048;
    v66 = 2;
    v67 = 1024;
    *(_DWORD *)v68 = v56;
    *(_WORD *)&v68[4] = 2048;
    *(_QWORD *)&v68[6] = 2;
    v53 = "Invalid plaintext length: %zu < %zu + %hu + %zu";
    v54 = v57;
    v55 = 38;
    goto LABEL_86;
  }
  v58 = dispatch_data_create(v50 + 1, v56, 0, 0);
  free(v50);
  return v58;
}

uint64_t __mdns_decrypt_oblivious_response_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  memcpy((void *)(*(_QWORD *)(a1 + 32) + a3), __src, __n);
  return 1;
}

NSObject *mdns_dispatch_create_oneshot_monotonic_timer(unsigned int a1, unsigned int a2, dispatch_queue_t queue)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  dispatch_time_t v8;

  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, queue);
  if (v5)
  {
    if (a2 >= 0x64)
      v6 = 100;
    else
      v6 = a2;
    v7 = (10000 * v6) * (unint64_t)a1;
    v8 = dispatch_time(0x8000000000000000, 1000000 * a1);
    dispatch_source_set_timer(v5, v8, 0xFFFFFFFFFFFFFFFFLL, v7);
  }
  return v5;
}

__CFString *_mdns_dns_configurator_copy_description(uint64_t a1, int a2, char a3)
{
  __CFString *result;
  __CFString *v6;
  const void *Value;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const __CFString *v13;
  const void *ValueAtIndex;
  const void *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  CFIndex v18;
  const __CFArray *v19;
  CFIndex v20;
  CFIndex v21;
  const __CFString *v22;
  const void *v23;
  const __CFString *v24;
  char *v25;
  const __CFArray *theArray;
  char *v27;

  if ((a3 & 1) != 0)
  {
    v27 = 0;
    asprintf(&v27, "<%s: %p>", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1);
    return (__CFString *)v27;
  }
  else
  {
    result = CFStringCreateMutable(0, 0);
    if (result)
    {
      v6 = result;
      if (a2)
        CFStringAppendFormat(result, 0, CFSTR("<%s: %p>: "), *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8), a1);
      CFStringAppendFormat(v6, 0, CFSTR("id: %@"), *(_QWORD *)(a1 + 32));
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5A68]);
      if (Value)
        CFStringAppendFormat(v6, 0, CFSTR(", interface: %@"), Value);
      v8 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5A90]);
      if (v8)
      {
        v9 = v8;
        CFStringAppend(v6, CFSTR(", server addresses: {"));
        Count = CFArrayGetCount(v9);
        if (Count >= 1)
        {
          v11 = Count;
          v12 = 0;
          v13 = &stru_24F2874F0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v9, v12);
            CFStringAppendFormat(v6, 0, CFSTR("%@%@"), v13, ValueAtIndex);
            ++v12;
            v13 = CFSTR(", ");
          }
          while (v11 != v12);
        }
        CFStringAppend(v6, CFSTR("}"));
      }
      v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5A98]);
      if (v15)
        CFStringAppendFormat(v6, 0, CFSTR(", port: %@"), v15);
      v16 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5AA0]);
      if (v16)
      {
        v17 = v16;
        CFStringAppend(v6, CFSTR(", domains: {"));
        v18 = CFArrayGetCount(v17);
        v19 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5AA8]);
        theArray = v19;
        if (v19)
          v20 = CFArrayGetCount(v19);
        else
          v20 = 0;
        if (v18 >= 1)
        {
          v21 = 0;
          v22 = &stru_24F2874F0;
          do
          {
            v23 = CFArrayGetValueAtIndex(v17, v21);
            v24 = CFSTR("<MISSING ORDER>");
            if (v21 < v20)
              v24 = (const __CFString *)CFArrayGetValueAtIndex(theArray, v21);
            CFStringAppendFormat(v6, 0, CFSTR("%@%@ (%@)"), v22, v23, v24);
            ++v21;
            v22 = CFSTR(", ");
          }
          while (v18 != v21);
        }
        CFStringAppend(v6, CFSTR("}"));
      }
      v25 = mdns_cfstring_to_utf8_cstring(v6);
      CFRelease(v6);
      return (__CFString *)v25;
    }
  }
  return result;
}

void _mdns_dns_configurator_finalize(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 32) = 0;
  }
}

_QWORD *mdns_dns_configurator_create(char *cStr, _DWORD *a2)
{
  CFStringRef v3;
  CFStringRef v4;
  _QWORD *v5;
  int v7;

  v7 = 0;
  v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v3)
  {
    v5 = 0;
    v7 = -6700;
    if (!a2)
      return v5;
    goto LABEL_3;
  }
  v4 = v3;
  v5 = mdns_dns_configurator_create_with_cfstring_id(v3, &v7);
  CFRelease(v4);
  if (a2)
LABEL_3:
    *a2 = v7;
  return v5;
}

_QWORD *mdns_dns_configurator_create_with_cfstring_id(const void *a1, int *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _UNKNOWN **v6;
  void (*v7)(_QWORD *);
  CFMutableDictionaryRef Mutable;
  int v9;
  _QWORD *v10;

  v4 = _os_object_alloc();
  v5 = (_QWORD *)v4;
  if (v4)
  {
    v6 = &_mdns_dns_configurator_kind;
    *(_QWORD *)(v4 + 16) = &_mdns_dns_configurator_kind;
    do
    {
      v7 = (void (*)(_QWORD *))v6[2];
      if (v7)
        v7(v5);
      v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v5[3] = Mutable;
    if (Mutable)
    {
      v5[4] = a1;
      CFRetain(a1);
      v9 = 0;
      v10 = v5;
      v5 = 0;
    }
    else
    {
      v10 = 0;
      v9 = -6729;
    }
  }
  else
  {
    v10 = 0;
    v9 = -6728;
  }
  if (a2)
    *a2 = v9;
  if (v5)
    os_release(v5);
  return v10;
}

uint64_t mdns_dns_configurator_set_interface(uint64_t a1, const char *a2)
{
  CFStringRef v3;
  CFStringRef v4;

  v3 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v3)
    return 4294960596;
  v4 = v3;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5A68], v3);
  CFRelease(v4);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5A78], *(const void **)(a1 + 32));
  return 0;
}

uint64_t mdns_dns_configurator_add_ipv4_server_address(uint64_t a1, unsigned int a2)
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t result;
  unsigned int v7;
  char v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = bswap32(a2);
  v3 = inet_ntop(2, &v7, v8, 0x10u);
  if (v3)
  {
    v4 = v3;
    v5 = a1;
    return mdns_dns_configurator_add_server_address_string(v5, v4);
  }
  if (!*__error())
    return 4294960596;
  result = *__error();
  if (!(_DWORD)result)
  {
    v5 = a1;
    v4 = 0;
    return mdns_dns_configurator_add_server_address_string(v5, v4);
  }
  return result;
}

uint64_t mdns_dns_configurator_add_server_address_string(uint64_t a1, const char *a2)
{
  const void *v4;
  void *Value;
  CFMutableArrayRef Mutable;
  CFStringRef v7;
  CFStringRef v8;

  v4 = (const void *)*MEMORY[0x24BDF5A90];
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5A90]);
  if (!Value)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (!Mutable)
      return 4294960567;
    Value = Mutable;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v4, Mutable);
    CFRelease(Value);
  }
  v7 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v7)
    return 4294960596;
  v8 = v7;
  CFArrayAppendValue((CFMutableArrayRef)Value, v7);
  CFRelease(v8);
  return 0;
}

uint64_t mdns_dns_configurator_add_ipv6_server_address(uint64_t a1, const void *a2, unsigned int a3)
{
  const char *v5;
  uint64_t result;
  size_t v7;
  char *v8;
  size_t v9;
  char v10[17];
  char __s[64];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = inet_ntop(30, a2, __s, 0x40u);
  if (v5)
    goto LABEL_4;
  if (!*__error())
    return 4294960596;
  result = *__error();
  if (!(_DWORD)result)
  {
LABEL_4:
    if (a3)
    {
      v7 = strlen(__s);
      v8 = &__s[v7];
      v9 = 64 - v7;
      if (if_indextoname(a3, v10))
        snprintf(v8, v9, "%%%s");
      else
        snprintf(v8, v9, "%%%u");
    }
    return mdns_dns_configurator_add_server_address_string(a1, v5);
  }
  return result;
}

uint64_t mdns_dns_configurator_add_domain(uint64_t a1, const char *a2, unsigned int a3)
{
  const void *v6;
  void *Value;
  CFMutableArrayRef Mutable;
  const void *v9;
  void *v10;
  CFMutableArrayRef v11;
  CFStringRef v12;
  CFStringRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  uint64_t v16;
  uint64_t valuePtr;

  v6 = (const void *)*MEMORY[0x24BDF5AA0];
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5AA0]);
  if (!Value)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (!Mutable)
      return 4294960567;
    Value = Mutable;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v6, Mutable);
    CFRelease(Value);
  }
  v9 = (const void *)*MEMORY[0x24BDF5AA8];
  v10 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5AA8]);
  if (v10)
    goto LABEL_7;
  v11 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!v11)
    return 4294960567;
  v10 = v11;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v9, v11);
  CFRelease(v10);
LABEL_7:
  v12 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v12)
    return 4294960596;
  v13 = v12;
  valuePtr = a3;
  v14 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v14)
  {
    v15 = v14;
    CFArrayAppendValue((CFMutableArrayRef)Value, v13);
    CFArrayAppendValue((CFMutableArrayRef)v10, v15);
    CFRelease(v13);
    v16 = 0;
    v13 = (CFStringRef)v15;
  }
  else
  {
    v16 = 4294960567;
  }
  CFRelease(v13);
  return v16;
}

uint64_t mdns_dns_configurator_set_port(uint64_t a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v3)
    return 4294960567;
  v4 = v3;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x24BDF5A98], v3);
  CFRelease(v4);
  return 0;
}

uint64_t mdns_dns_configurator_register(uint64_t a1, const __CFString *a2)
{
  SCDynamicStoreRef v3;
  uint64_t v4;
  const __CFString *NetworkServiceEntity;
  uint64_t v6;
  uint64_t v7;

  v3 = SCDynamicStoreCreate(0, a2, 0, 0);
  if (!v3)
  {
    if (!SCError())
      return 4294960596;
    v4 = SCError();
    if ((_DWORD)v4)
      return v4;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x24BDF59B0], *(CFStringRef *)(a1 + 32), (CFStringRef)*MEMORY[0x24BDF59D8]);
  if (!NetworkServiceEntity)
  {
    if (!SCError())
      goto LABEL_14;
    v6 = SCError();
    if ((_DWORD)v6)
      goto LABEL_12;
  }
  if (SCDynamicStoreSetValue(v3, NetworkServiceEntity, *(CFPropertyListRef *)(a1 + 24)))
  {
    v7 = 0;
    if (!v3)
      goto LABEL_16;
LABEL_15:
    CFRelease(v3);
    goto LABEL_16;
  }
  if (!SCError())
  {
LABEL_14:
    v7 = 4294960596;
    if (!v3)
      goto LABEL_16;
    goto LABEL_15;
  }
  v6 = SCError();
LABEL_12:
  v7 = v6;
  if (v3)
    goto LABEL_15;
LABEL_16:
  if (NetworkServiceEntity)
    CFRelease(NetworkServiceEntity);
  return v7;
}

uint64_t mdns_dns_configurator_deregister(uint64_t a1, const __CFString *a2)
{
  return mdns_dns_configurator_deregister_configuration(*(const __CFString **)(a1 + 32), a2);
}

uint64_t mdns_dns_configurator_deregister_configuration(const __CFString *a1, const __CFString *a2)
{
  SCDynamicStoreRef v3;
  uint64_t v4;
  const __CFString *NetworkServiceEntity;
  uint64_t v6;
  uint64_t v7;

  v3 = SCDynamicStoreCreate(0, a2, 0, 0);
  if (!v3)
  {
    if (!SCError())
      return 4294960596;
    v4 = SCError();
    if ((_DWORD)v4)
      return v4;
  }
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x24BDF59B0], a1, (CFStringRef)*MEMORY[0x24BDF59D8]);
  if (!NetworkServiceEntity)
  {
    if (!SCError())
      goto LABEL_14;
    v6 = SCError();
    if ((_DWORD)v6)
      goto LABEL_12;
  }
  if (SCDynamicStoreRemoveValue(v3, NetworkServiceEntity))
  {
    v7 = 0;
    if (!v3)
      goto LABEL_16;
LABEL_15:
    CFRelease(v3);
    goto LABEL_16;
  }
  if (!SCError())
  {
LABEL_14:
    v7 = 4294960596;
    if (!v3)
      goto LABEL_16;
    goto LABEL_15;
  }
  v6 = SCError();
LABEL_12:
  v7 = v6;
  if (v3)
    goto LABEL_15;
LABEL_16:
  if (NetworkServiceEntity)
    CFRelease(NetworkServiceEntity);
  return v7;
}

void *_mdns_push_server_copy_description(uint64_t a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int appended;
  const __CFArray *v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  const char *v15;
  int v16;
  _QWORD v18[7];
  char v19;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
  {
    v11 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  if (a2)
  {
    appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1);
    *((_DWORD *)v22 + 6) = appended;
    if (appended)
      goto LABEL_13;
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 64)) >= 1)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2000000000;
    v20[3] = "addresses: {";
    v9 = *(const __CFArray **)(a1 + 64);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 0x40000000;
    v18[2] = ___mdns_push_server_copy_description_block_invoke;
    v18[3] = &unk_24F284500;
    v18[5] = v20;
    v18[6] = v7;
    v18[4] = &v21;
    v19 = a3;
    mdns_cfarray_enumerate(v9, (uint64_t)v18);
    v10 = mdns_string_builder_append_formatted(v7, "}");
    *((_DWORD *)v22 + 6) = v10;
    _Block_object_dispose(v20, 8);
    v11 = 0;
    if (v10)
      goto LABEL_14;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v12 = mdns_string_builder_append_formatted(v7, "srv name: ");
    *((_DWORD *)v22 + 6) = v12;
    if (v12)
      goto LABEL_13;
    v13 = mdns_string_builder_append_description(v7, *(_QWORD *)(a1 + 48), a3);
    *((_DWORD *)v22 + 6) = v13;
    if (v13)
      goto LABEL_13;
  }
  v14 = mdns_string_builder_append_formatted(v7, ", ");
  *((_DWORD *)v22 + 6) = v14;
  if (v14)
    goto LABEL_13;
  v15 = *(const char **)(a1 + 56);
  if (!v15)
    v15 = "";
  v16 = mdns_string_builder_append_formatted(v7, "interface: %s/%u", v15, *(_DWORD *)(a1 + 96));
  *((_DWORD *)v22 + 6) = v16;
  if (v16)
LABEL_13:
    v11 = 0;
  else
    v11 = mdns_string_builder_copy_string((uint64_t)v7);
LABEL_14:
  os_release(v7);
LABEL_15:
  _Block_object_dispose(&v21, 8);
  return v11;
}

void _mdns_push_server_finalize(_QWORD *a1)
{
  void *v2;
  const void *v3;
  const void *v4;
  void *v5;

  v2 = (void *)a1[6];
  if (v2)
  {
    os_release(v2);
    a1[6] = 0;
  }
  v3 = (const void *)a1[8];
  if (v3)
  {
    CFRelease(v3);
    a1[8] = 0;
  }
  v4 = (const void *)a1[9];
  if (v4)
  {
    CFRelease(v4);
    a1[9] = 0;
  }
  v5 = (void *)a1[7];
  if (v5)
  {
    free(v5);
    a1[7] = 0;
  }
}

BOOL ___mdns_push_server_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

dispatch_queue_t ___mdns_push_notifications_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.push-notifications-queue", 0);
  _mdns_push_notifications_queue_s_queue = (uint64_t)result;
  return result;
}

void __mdns_push_server_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    os_retain(*(void **)(v2 + 40));
    if (_mdns_dso_session_queue_s_once != -1)
      dispatch_once(&_mdns_dso_session_queue_s_once, &__block_literal_global_66);
    block[0] = v4;
    block[1] = 0x40000000;
    block[2] = __mdns_dso_session_invalidate_block_invoke;
    block[3] = &__block_descriptor_tmp_7_647;
    block[4] = v3;
    dispatch_async((dispatch_queue_t)_mdns_dso_session_queue_s_queue, block);
    os_release(*(void **)(*(_QWORD *)(a1 + 32) + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(v2 + 88);
  if (v5)
  {
    v6 = *(NSObject **)(v2 + 80);
    if (v6)
    {
      v7[0] = v4;
      v7[1] = 0x40000000;
      v7[2] = __mdns_push_server_invalidate_block_invoke_2;
      v7[3] = &unk_24F2844B8;
      v7[4] = v5;
      dispatch_async(v6, v7);
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_QWORD *)(v2 + 80))
  {
    dispatch_release(*(dispatch_object_t *)(v2 + 80));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 88))
  {
    _Block_release(*(const void **)(v2 + 88));
    v2 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v2 + 88) = 0;
  }
  os_release((void *)v2);
}

uint64_t __mdns_push_server_invalidate_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void *_mdns_dns_push_service_definition_copy_description(uint64_t a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v12)(void);
  char *v13;
  const char *v14;
  const __CFSet *v15;
  _QWORD v17[6];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
  {
    v8 = 0;
    goto LABEL_28;
  }
  v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1))
  {
    goto LABEL_4;
  }
  v9 = *(const char **)(a1 + 64);
  if (!v9)
    v9 = "";
  if (mdns_string_builder_append_formatted(v7, "interface: %s/%u", v9, *(_DWORD *)(a1 + 72))
    || mdns_string_builder_append_formatted(v7, ", hostname: "))
  {
LABEL_4:
    v8 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      if (a3)
      {
        v11 = (_QWORD *)(v10 + 16);
        while (1)
        {
          v11 = (_QWORD *)*v11;
          if (!v11)
            break;
          v12 = (uint64_t (*)(void))v11[3];
          if (v12)
          {
            v13 = (char *)v12();
            goto LABEL_18;
          }
        }
        v13 = 0;
LABEL_18:
        v14 = "«REDACTED»";
        if (v13)
          v14 = v13;
      }
      else
      {
        v13 = 0;
        v14 = *(const char **)(v10 + 40);
      }
    }
    else
    {
      v13 = 0;
      v14 = "«NO HOSTNAME»";
    }
    if (mdns_string_builder_append_formatted(v7, "%s", v14))
      goto LABEL_29;
    if (mdns_string_builder_append_formatted(v7, ", port: %u", *(unsigned __int16 *)(a1 + 76)))
      goto LABEL_29;
    if (mdns_string_builder_append_formatted(v7, ", domains: {"))
      goto LABEL_29;
    v20[3] = (uint64_t)"";
    v15 = *(const __CFSet **)(a1 + 48);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 0x40000000;
    v17[2] = ___mdns_dns_push_service_definition_copy_description_block_invoke;
    v17[3] = &unk_24F284598;
    v18 = a3;
    v17[4] = &v19;
    v17[5] = v7;
    if (!mdns_cfset_enumerate(v15, (uint64_t)v17) || mdns_string_builder_append_formatted(v7, "}"))
    {
LABEL_29:
      v8 = 0;
      if (!v13)
        goto LABEL_27;
      goto LABEL_26;
    }
    v8 = mdns_string_builder_copy_string((uint64_t)v7);
    if (v13)
LABEL_26:
      free(v13);
  }
LABEL_27:
  os_release(v7);
LABEL_28:
  _Block_object_dispose(&v19, 8);
  return v8;
}

void _mdns_dns_push_service_definition_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  void *v7;

  v2 = (void *)a1[3];
  if (v2)
  {
    os_release(v2);
    a1[3] = 0;
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    os_release(v3);
    a1[4] = 0;
  }
  v4 = (const void *)a1[5];
  if (v4)
  {
    CFRelease(v4);
    a1[5] = 0;
  }
  v5 = (const void *)a1[6];
  if (v5)
  {
    CFRelease(v5);
    a1[6] = 0;
  }
  v6 = (const void *)a1[7];
  if (v6)
  {
    CFRelease(v6);
    a1[7] = 0;
  }
  v7 = (void *)a1[8];
  if (v7)
  {
    free(v7);
    a1[8] = 0;
  }
}

BOOL ___mdns_dns_push_service_definition_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  char *v5;
  const char *v6;
  int appended;
  _BOOL8 result;

  if (*(_BYTE *)(a1 + 48))
  {
    v3 = (_QWORD *)(a2 + 16);
    while (1)
    {
      v3 = (_QWORD *)*v3;
      if (!v3)
        break;
      v4 = (uint64_t (*)(uint64_t, _QWORD, uint64_t))v3[3];
      if (v4)
      {
        v5 = (char *)v4(a2, 0, 1);
        goto LABEL_8;
      }
    }
    v5 = 0;
LABEL_8:
    v6 = "«REDACTED»";
    if (v5)
      v6 = v5;
  }
  else
  {
    v5 = 0;
    v6 = *(const char **)(a2 + 40);
  }
  appended = mdns_string_builder_append_formatted(*(_QWORD **)(a1 + 40), "%s%s", *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v6);
  if (v5)
    free(v5);
  result = appended == 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ", ";
  return result;
}

_QWORD *mdns_dns_push_service_definition_create()
{
  uint64_t v0;
  _QWORD *v1;
  _UNKNOWN **v2;
  void (*v3)(_QWORD *);
  const __CFAllocator *v4;
  CFMutableArrayRef Mutable;
  CFMutableSetRef v6;
  CFMutableArrayRef v7;

  v0 = _os_object_alloc();
  v1 = (_QWORD *)v0;
  if (v0)
  {
    v2 = &_mdns_dns_push_service_definition_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_dns_push_service_definition_kind;
    do
    {
      v3 = (void (*)(_QWORD *))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
    v1[5] = Mutable;
    if (!Mutable
      || (v6 = CFSetCreateMutable(v4, 0, &mdns_domain_name_cf_set_callbacks), (v1[6] = v6) == 0)
      || (v7 = CFArrayCreateMutable(v4, 0, MEMORY[0x24BDBD690]), (v1[7] = v7) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

void mdns_dns_push_service_definition_append_server_address(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
}

uint64_t mdns_dns_push_service_definition_add_domain(uint64_t a1, const void *a2)
{
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 48), a2);
  return 0;
}

char *_mdns_dns_relay_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *result;
  char *v9;
  char __s1[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = __s1;
  __s1[0] = 0;
  if (a2
    && (mdns_snprintf_add(&v9, (uint64_t)&v11, "<%s: %p>: ", a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8)) & 0x80000000) != 0)
  {
    return 0;
  }
  result = strdup(__s1);
  if (!result)
    __break(1u);
  return result;
}

void _mdns_dns_relay_finalize(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    nw_connection_cancel(v2);
    nw_release(*(void **)(a1 + 24));
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void mdns_dns_relay_set_client_connection(uint64_t a1, void *obj)
{
  void *v4;

  if (!*(_BYTE *)(a1 + 72))
  {
    nw_retain(obj);
    v4 = *(void **)(a1 + 24);
    if (v4)
      nw_release(v4);
    *(_QWORD *)(a1 + 24) = obj;
  }
}

__n128 mdns_dns_relay_set_server_address(uint64_t a1, uint64_t a2)
{
  __n128 result;

  if (!*(_BYTE *)(a1 + 72))
  {
    result = *(__n128 *)a2;
    *(_OWORD *)(a1 + 52) = *(_OWORD *)(a2 + 12);
    *(__n128 *)(a1 + 40) = result;
  }
  return result;
}

void mdns_dns_relay_activate(_BYTE *a1)
{
  _QWORD block[5];

  if (!a1[72])
  {
    a1[72] = 1;
    os_retain(a1);
    if (_mdns_dns_relay_queue_s_once != -1)
      dispatch_once(&_mdns_dns_relay_queue_s_once, &__block_literal_global_31);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __mdns_dns_relay_activate_block_invoke;
    block[3] = &__block_descriptor_tmp_104;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_mdns_dns_relay_queue_s_queue, block);
  }
}

void __mdns_dns_relay_activate_block_invoke(uint64_t a1)
{
  nw_connection_t *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD handler[5];

  v2 = *(nw_connection_t **)(a1 + 32);
  v3 = v2[3];
  if (v3)
  {
    if (_mdns_dns_relay_queue_s_once != -1)
      dispatch_once(&_mdns_dns_relay_queue_s_once, &__block_literal_global_31);
    nw_connection_set_queue(v3, (dispatch_queue_t)_mdns_dns_relay_queue_s_queue);
    os_retain(v2);
    v4 = v2[3];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = ___mdns_dns_relay_activate_internal_block_invoke;
    handler[3] = &__block_descriptor_tmp_25_106;
    handler[4] = v2;
    nw_connection_set_state_changed_handler(v4, handler);
    nw_connection_start(v2[3]);
  }
  else
  {
    _mdns_dns_relay_terminate(*(_QWORD *)(a1 + 32));
  }
  os_release(*(void **)(a1 + 32));
}

void ___mdns_dns_relay_activate_internal_block_invoke(uint64_t a1, int a2, nw_error_t error)
{
  uint64_t v3;
  NSObject *secure_tcp;
  NSObject *v5;
  nw_protocol_stack_t v6;
  NSObject *v7;
  NSObject *options;
  NSObject *address;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  _QWORD handler[5];

  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 24))
  {
    if (a2 != 5)
      return;
LABEL_26:
    os_release(*(void **)(a1 + 32));
    return;
  }
  if (a2 == 5)
    goto LABEL_26;
  if (a2 == 4)
  {
    if (error)
      nw_error_get_error_code(error);
    goto LABEL_24;
  }
  if (a2 != 3)
    return;
  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0888], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0878]);
  if (!secure_tcp)
    goto LABEL_28;
  v5 = secure_tcp;
  v6 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  if (!v6)
  {
    nw_release(v5);
LABEL_28:
    *(_QWORD *)(v3 + 32) = 0;
LABEL_24:
    _mdns_dns_relay_terminate(v3);
    return;
  }
  v7 = v6;
  if (_mdns_get_dns_over_bytestream_protocol_definition_s_once != -1)
    dispatch_once(&_mdns_get_dns_over_bytestream_protocol_definition_s_once, &__block_literal_global_945);
  if (!_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def)
  {
    v12 = 0;
    options = 0;
LABEL_31:
    v11 = 0;
    v10 = 0;
    goto LABEL_13;
  }
  options = nw_framer_create_options((nw_protocol_definition_t)_mdns_get_dns_over_bytestream_protocol_definition_s_framer_def);
  if (!options)
  {
    v12 = 0;
    goto LABEL_31;
  }
  nw_protocol_stack_prepend_application_protocol(v7, options);
  address = nw_endpoint_create_address((const sockaddr *)(v3 + 40));
  v10 = address;
  if (address)
  {
    v11 = nw_connection_create(address, v5);
    v12 = v11 != 0;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
LABEL_13:
  nw_release(v5);
  nw_release(v7);
  if (options)
    nw_release(options);
  if (v10)
    nw_release(v10);
  *(_QWORD *)(v3 + 32) = v11;
  if (!v12)
    goto LABEL_24;
  if (_mdns_dns_relay_queue_s_once != -1)
    dispatch_once(&_mdns_dns_relay_queue_s_once, &__block_literal_global_31);
  nw_connection_set_queue(v11, (dispatch_queue_t)_mdns_dns_relay_queue_s_queue);
  os_retain((void *)v3);
  v13 = *(NSObject **)(v3 + 32);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = ___mdns_dns_relay_set_up_server_connection_block_invoke;
  handler[3] = &__block_descriptor_tmp_26;
  handler[4] = v3;
  nw_connection_set_state_changed_handler(v13, handler);
  nw_connection_start(*(nw_connection_t *)(v3 + 32));
}

void _mdns_dns_relay_terminate(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    if (*(_DWORD *)(a1 + 68))
    {
      *(_BYTE *)(a1 + 73) = 1;
    }
    else
    {
      nw_connection_cancel(v2);
      nw_release(*(void **)(a1 + 24));
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
  v3 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    nw_connection_cancel(v3);
    nw_release(*(void **)(a1 + 32));
    *(_QWORD *)(a1 + 32) = 0;
  }
}

void ___mdns_dns_relay_set_up_server_connection_block_invoke(uint64_t a1, int a2, nw_error_t error)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD completion[5];

  v3 = *(_QWORD **)(a1 + 32);
  if (!v3[4])
  {
    if (a2 != 5)
      return;
LABEL_11:
    os_release(*(void **)(a1 + 32));
    return;
  }
  switch(a2)
  {
    case 5:
      goto LABEL_11;
    case 4:
      if (error)
        nw_error_get_error_code(error);
      _mdns_dns_relay_terminate((uint64_t)v3);
      break;
    case 3:
      (*(void (**)(_QWORD, _QWORD, nw_error_t))(v3[2] + 48))(*(_QWORD *)(a1 + 32), v3[3], error);
      v4 = v3[4];
      completion[0] = MEMORY[0x24BDAC760];
      completion[1] = 0x40000000;
      completion[2] = ___mdns_dns_relay_schedule_server_receive_block_invoke;
      completion[3] = &__block_descriptor_tmp_27_108;
      completion[4] = v3;
      nw_connection_receive_message(v4, completion);
      break;
  }
}

void ___mdns_dns_relay_schedule_server_receive_block_invoke(uint64_t a1, uint64_t a2, nw_content_context_t context, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  _BOOL4 is_final;
  uint64_t v10;
  NSObject *v11;
  _QWORD completion[5];

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 32))
  {
    if (a2)
      _mdns_dns_relay_send_dns_message_to_client(v6, a2);
    if (a5)
    {
      _mdns_dns_relay_terminate(*(_QWORD *)(a1 + 32));
      return;
    }
    if (context)
    {
      is_final = nw_content_context_get_is_final(context);
      v10 = *(_QWORD *)(a1 + 32);
      if (is_final)
      {
        _mdns_dns_relay_send_dns_message_to_client(v10, 0);
        return;
      }
    }
    else
    {
      v10 = *(_QWORD *)(a1 + 32);
    }
    v11 = *(NSObject **)(v10 + 32);
    completion[0] = MEMORY[0x24BDAC760];
    completion[1] = 0x40000000;
    completion[2] = ___mdns_dns_relay_schedule_server_receive_block_invoke;
    completion[3] = &__block_descriptor_tmp_27_108;
    completion[4] = v10;
    nw_connection_receive_message(v11, completion);
  }
}

void _mdns_dns_relay_send_dns_message_to_client(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD completion[5];
  void *obj;
  int v10;

  if (!*(_QWORD *)(a1 + 24) || *(_BYTE *)(a1 + 73))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_17;
  }
  v10 = 0;
  if (!a2)
  {
    v4 = *MEMORY[0x24BDE0858];
    obj = v4;
    nw_retain(v4);
    v3 = 0;
LABEL_9:
    v5 = *(NSObject **)(a1 + 24);
    completion[0] = MEMORY[0x24BDAC760];
    completion[1] = 0x40000000;
    completion[2] = ___mdns_dns_relay_send_dns_message_to_client_block_invoke;
    completion[3] = &__block_descriptor_tmp_28_110;
    completion[4] = a1;
    nw_connection_send(v5, v3, v4, 1, completion);
    v6 = *(unsigned int *)(a1 + 68) + 1;
    v7 = v6 << 31 >> 31;
    *(_DWORD *)(a1 + 68) = v6;
    if (v7 == v6 && (v7 & 0x8000000000000000) == 0)
    {
      v10 = 0;
      if (!v3)
        goto LABEL_13;
      goto LABEL_12;
    }
LABEL_17:
    _os_assert_log();
    _os_crash();
    __break(1u);
    return;
  }
  obj = 0;
  v3 = (*(uint64_t (**)(uint64_t, uint64_t, void **, int *))(*(_QWORD *)(a1 + 16) + 56))(a1, a2, &obj, &v10);
  if (!v10)
  {
    v4 = obj;
    goto LABEL_9;
  }
  _mdns_dns_relay_terminate(a1);
  if (v3)
LABEL_12:
    dispatch_release(v3);
LABEL_13:
  if (obj)
    nw_release(obj);
}

void ___mdns_dns_relay_send_dns_message_to_client_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  NSObject *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 68);
  *(_DWORD *)(v2 + 68) = v3 - 1;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 24);
    if (v6)
    {
      if (*(_BYTE *)(v5 + 73) && !*(_DWORD *)(v5 + 68))
      {
        nw_connection_cancel(v6);
        nw_release(*(void **)(*(_QWORD *)(a1 + 32) + 24));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
        if (a2)
          goto LABEL_6;
      }
      else if (a2)
      {
LABEL_6:
        _mdns_dns_relay_terminate(*(_QWORD *)(a1 + 32));
      }
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

dispatch_queue_t ___mdns_dns_relay_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.dns-relay-queue", 0);
  _mdns_dns_relay_queue_s_queue = (uint64_t)result;
  return result;
}

uint64_t mdns_dot_relay_create(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  _UNKNOWN **v4;
  void (*v5)(uint64_t);
  int v6;

  v2 = _os_object_alloc();
  v3 = v2;
  if (v2)
  {
    v4 = &_mdns_dot_relay_kind;
    *(_QWORD *)(v2 + 16) = &_mdns_dot_relay_kind;
    do
    {
      v5 = (void (*)(uint64_t))v4[2];
      if (v5)
        v5(v3);
      v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
  }
  if (a1)
  {
    if (v3)
      v6 = 0;
    else
      v6 = -6728;
    *a1 = v6;
  }
  return v3;
}

void _mdns_dot_relay_schedule_client_receive(uint64_t a1, nw_connection_t connection)
{
  uint32_t v2;
  _QWORD v3[5];
  uint32_t v4;

  if (*(_WORD *)(a1 + 80))
    v2 = *(unsigned __int16 *)(a1 + 80);
  else
    v2 = 2;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___mdns_dot_relay_schedule_client_receive_block_invoke;
  v3[3] = &__block_descriptor_tmp_5;
  v3[4] = a1;
  v4 = v2;
  nw_connection_receive(connection, v2, v2, v3);
}

dispatch_data_t _mdns_dot_relay_handle_dns_message_to_client(int a1, dispatch_data_t data, NSObject **a3, int *a4)
{
  NSObject *v7;
  NSObject *v8;
  dispatch_data_t concat;
  int v10;
  __int16 buffer;

  buffer = bswap32(dispatch_data_get_size(data)) >> 16;
  v7 = dispatch_data_create(&buffer, 2uLL, 0, 0);
  v8 = v7;
  if (v7)
  {
    concat = dispatch_data_create_concat(v7, data);
    dispatch_release(v8);
    if (concat)
    {
      v8 = *MEMORY[0x24BDE0848];
      nw_retain((void *)*MEMORY[0x24BDE0848]);
      v10 = 0;
      if (!a3)
        goto LABEL_5;
      goto LABEL_4;
    }
    v8 = 0;
  }
  else
  {
    concat = 0;
  }
  v10 = -6729;
  if (a3)
  {
LABEL_4:
    *a3 = v8;
    v8 = 0;
  }
LABEL_5:
  if (a4)
    *a4 = v10;
  if (v8)
    nw_release(v8);
  return concat;
}

void ___mdns_dot_relay_schedule_client_receive_block_invoke(uint64_t a1, dispatch_data_t data, NSObject *a3, int a4, uint64_t a5)
{
  uint64_t v5;
  NSObject *v11;
  size_t size;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  int v24;
  unsigned __int16 v25;
  _QWORD v26[4];
  _BYTE completion[24];
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  unsigned __int16 *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 24) || !*(_QWORD *)(v5 + 32))
    return;
  if (!a5)
    goto LABEL_7;
  if (_mdns_dns_relay_log_s_once != -1)
    dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_115);
  v11 = _mdns_dns_relay_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_ERROR))
  {
LABEL_7:
    if (data)
      goto LABEL_8;
LABEL_17:
    size = 0;
    goto LABEL_18;
  }
  *(_DWORD *)completion = 138543362;
  *(_QWORD *)&completion[4] = a5;
  _os_log_error_impl(&dword_22983F000, v11, OS_LOG_TYPE_ERROR, "DoT receive error: %{public}@", completion, 0xCu);
  if (!data)
    goto LABEL_17;
LABEL_8:
  size = dispatch_data_get_size(data);
  if (size != *(_DWORD *)(a1 + 40))
  {
LABEL_18:
    if (_mdns_dns_relay_log_s_once != -1)
      dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_115);
    v18 = _mdns_dns_relay_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)completion = 67109376;
      *(_DWORD *)&completion[4] = v23;
      *(_WORD *)&completion[8] = 2048;
      *(_QWORD *)&completion[10] = size;
      _os_log_error_impl(&dword_22983F000, v18, OS_LOG_TYPE_ERROR, "Expected to receive %u bytes from client, but received %zu bytes instead", completion, 0x12u);
    }
    v16 = 0;
    goto LABEL_23;
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_WORD *)(v13 + 80))
  {
    *(_WORD *)(v13 + 80) = 0;
    v14 = *MEMORY[0x24BDE0848];
    v15 = *(NSObject **)(v13 + 32);
    *(_QWORD *)completion = MEMORY[0x24BDAC760];
    *(_QWORD *)&completion[8] = 0x40000000;
    *(_QWORD *)&completion[16] = ___mdns_dns_relay_send_dns_message_to_server_block_invoke;
    v28 = &__block_descriptor_tmp_12;
    v29 = (_QWORD *)v13;
    v16 = 1;
    nw_connection_send(v15, data, v14, 1, completion);
  }
  else
  {
    v25 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2000000000;
    v26[3] = 0;
    *(_QWORD *)completion = MEMORY[0x24BDAC760];
    *(_QWORD *)&completion[8] = 0x40000000;
    *(_QWORD *)&completion[16] = ___mdns_dispatch_data_memcpy_block_invoke;
    v28 = &unk_24F284640;
    v31 = &v25;
    v29 = v26;
    v30 = 2;
    dispatch_data_apply(data, completion);
    _Block_object_dispose(v26, 8);
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 80) = bswap32(v25) >> 16;
    if (_mdns_dns_relay_log_s_once != -1)
      dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_115);
    v17 = _mdns_dns_relay_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v24 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 80);
      *(_DWORD *)completion = 67109120;
      *(_DWORD *)&completion[4] = v24;
      _os_log_debug_impl(&dword_22983F000, v17, OS_LOG_TYPE_DEBUG, "Received message length %u from client", completion, 8u);
    }
    v16 = 1;
  }
LABEL_23:
  if (data)
    v19 = v16;
  else
    v19 = 1;
  if (a5 || (v19 & 1) == 0)
  {
    _mdns_dns_relay_terminate(*(_QWORD *)(a1 + 32));
  }
  else if (a3 && a4 && nw_content_context_get_is_final(a3))
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *MEMORY[0x24BDE0858];
    v22 = *(NSObject **)(v20 + 32);
    *(_QWORD *)completion = MEMORY[0x24BDAC760];
    *(_QWORD *)&completion[8] = 0x40000000;
    *(_QWORD *)&completion[16] = ___mdns_dns_relay_send_dns_message_to_server_block_invoke;
    v28 = &__block_descriptor_tmp_12;
    v29 = (_QWORD *)v20;
    nw_connection_send(v22, 0, v21, 1, completion);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

BOOL ___mdns_dispatch_data_memcpy_block_invoke(_QWORD *a1, int a2, unint64_t a3, void *__src, size_t a5)
{
  unint64_t v5;
  BOOL v6;
  size_t v7;
  size_t v10;

  v5 = a1[5];
  v6 = v5 > a3;
  v7 = v5 - a3;
  if (!v6)
    return 0;
  if (v7 >= a5)
    v10 = a5;
  else
    v10 = v7;
  memcpy((void *)(a1[6] + a3), __src, v10);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v10 + a3;
  return *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) < a1[5];
}

void ___mdns_dns_relay_send_dns_message_to_server_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 32))
      _mdns_dns_relay_terminate(v2);
  }
}

os_log_t ___mdns_dns_relay_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "dns_relay");
  _mdns_dns_relay_log_s_log = (uint64_t)result;
  return result;
}

uint64_t mdns_doh_relay_create(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  _UNKNOWN **v4;
  void (*v5)(uint64_t);
  int v6;

  v2 = _os_object_alloc();
  v3 = v2;
  if (v2)
  {
    v4 = &_mdns_doh_relay_kind;
    *(_QWORD *)(v2 + 16) = &_mdns_doh_relay_kind;
    do
    {
      v5 = (void (*)(uint64_t))v4[2];
      if (v5)
        v5(v3);
      v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
  }
  if (a1)
  {
    if (v3)
      v6 = 0;
    else
      v6 = -6728;
    *a1 = v6;
  }
  return v3;
}

void _mdns_doh_relay_finalize(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 88);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 88) = 0;
  }
  v3 = *(void **)(a1 + 80);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 80) = 0;
  }
}

void _mdns_doh_relay_schedule_client_receive(uint64_t a1, nw_connection_t connection)
{
  _QWORD completion[5];

  completion[0] = MEMORY[0x24BDAC760];
  completion[1] = 0x40000000;
  completion[2] = ___mdns_doh_relay_schedule_client_receive_block_invoke;
  completion[3] = &__block_descriptor_tmp_14;
  completion[4] = a1;
  nw_connection_receive_message(connection, completion);
}

NSObject *_mdns_doh_relay_handle_dns_message_to_client(uint64_t a1, NSObject *a2, NSObject **a3, _DWORD *a4)
{
  void *v7;
  size_t size;
  NSObject *v9;
  int v11;
  char __str[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v7 = (void *)MEMORY[0x22E2D1248]();
  if (!v7)
  {
    v9 = 0;
    a2 = 0;
    v11 = -6729;
    if (!a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  size = dispatch_data_get_size(a2);
  snprintf(__str, 0x80uLL, "%zu", size);
  nw_http_fields_set_value_by_name();
  nw_http_fields_set_value_by_name();
  v9 = _mdns_create_http_response_context(200, (uint64_t)v7, &v11);
  if (v11)
  {
    a2 = 0;
    if (!a3)
      goto LABEL_7;
LABEL_6:
    *a3 = v9;
    v9 = 0;
    goto LABEL_7;
  }
  dispatch_retain(a2);
  if (a3)
    goto LABEL_6;
LABEL_7:
  if (a4)
    *a4 = v11;
  if (v7)
    nw_release(v7);
  if (v9)
    nw_release(v9);
  return a2;
}

NSObject *_mdns_create_http_response_context(uint64_t a1, uint64_t a2, int *a3)
{
  void *well_known;
  NSObject *metadata_for_response;
  NSObject *v7;
  NSObject *v8;
  int v9;

  well_known = (void *)nw_http_response_create_well_known();
  if (!well_known)
  {
    v8 = 0;
    metadata_for_response = 0;
    goto LABEL_10;
  }
  if (a2)
    nw_http_response_set_header_fields();
  metadata_for_response = nw_http_create_metadata_for_response();
  if (!metadata_for_response)
  {
    v8 = 0;
LABEL_10:
    v9 = -6729;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  v7 = nw_content_context_create("https");
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  nw_content_context_set_metadata_for_protocol(v7, metadata_for_response);
  v9 = 0;
  if (a3)
LABEL_11:
    *a3 = v9;
LABEL_12:
  if (well_known)
    nw_release(well_known);
  if (metadata_for_response)
    nw_release(metadata_for_response);
  return v8;
}

void ___mdns_doh_relay_schedule_client_receive_block_invoke(uint64_t a1, int a2, NSObject *a3, int a4, nw_error_t error)
{
  _QWORD *v5;
  NSObject *v6;
  nw_protocol_metadata_t v9;
  int version;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  const __CFURL *v16;
  const char *v17;
  const __CFString *v18;
  const __CFString *v19;
  char *v20;
  int v21;
  const __CFString *String;
  char *v23;
  char *v24;
  size_t v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  const void *v29;
  NSObject *v30;
  NSObject *v31;
  size_t v32;
  uint64_t v33;
  int v34;
  BOOL v35;
  size_t v36;
  _BYTE *v37;
  uint64_t v38;
  int v39;
  char v40;
  char v41;
  size_t v42;
  _BYTE *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  size_t size;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  int v63;
  uint64_t completion;
  uint64_t p_completion;
  uint64_t v66;
  void *v67;
  _QWORD *v68;
  __int128 buf;
  void *v70;
  void *v71;
  uint64_t *v72;
  uint64_t *v73;
  _QWORD *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD **)(a1 + 32);
  if (!v5[3] || !v5[4])
    return;
  v6 = error;
  if (error)
  {
    nw_error_get_error_code(error);
    if (_mdns_dns_relay_log_s_once != -1)
LABEL_91:
      dispatch_once(&_mdns_dns_relay_log_s_once, &__block_literal_global_115);
    v47 = _mdns_dns_relay_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_relay_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_22983F000, v47, OS_LOG_TYPE_ERROR, "DoH receive error: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v6 = 0;
    v9 = 0;
    goto LABEL_48;
  }
  v6 = nw_protocol_copy_http_definition();
  v9 = nw_content_context_copy_protocol_metadata(a3, v6);
  if (!v9)
  {
LABEL_48:
    _mdns_dns_relay_terminate((uint64_t)v5);
    goto LABEL_54;
  }
  v59 = 0;
  v60 = &v59;
  v61 = 0x2000000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2000000000;
  v58 = 0;
  version = nw_http_metadata_get_version();
  v11 = MEMORY[0x24BDAC760];
  if (version != 4)
  {
    v12 = 0;
    v15 = 0;
    v14 = 505;
    goto LABEL_37;
  }
  v12 = (void *)nw_http_metadata_copy_request();
  if (!v12)
    goto LABEL_27;
  if (!nw_http_request_has_method())
  {
    v15 = 0;
    v14 = 501;
    goto LABEL_37;
  }
  if (v5[11])
  {
    v49 = 0;
    v50 = (uint64_t)&v49;
    v51 = 0x2000000000;
    LOBYTE(v52) = 0;
    completion = 0;
    p_completion = (uint64_t)&completion;
    v66 = 0x2000000000;
    LOBYTE(v67) = 0;
    *(_QWORD *)&buf = v11;
    *((_QWORD *)&buf + 1) = 0x40000000;
    v70 = ___mdns_doh_relay_handle_request_block_invoke;
    v71 = &unk_24F2846A8;
    v72 = &v49;
    v73 = &completion;
    v74 = v5;
    nw_http_request_access_authority();
    if (*(_BYTE *)(v50 + 24))
    {
      v13 = *(_BYTE *)(p_completion + 24) != 0;
      v14 = *(_BYTE *)(p_completion + 24) ? 0 : 404;
    }
    else
    {
      v13 = 0;
      v14 = 400;
    }
    _Block_object_dispose(&completion, 8);
    _Block_object_dispose(&v49, 8);
    if (!v13)
      goto LABEL_36;
  }
  v49 = v11;
  v50 = 0x40000000;
  v51 = (uint64_t)___mdns_doh_relay_handle_request_block_invoke_2;
  v52 = &unk_24F2846D0;
  v53 = &v59;
  v54 = &v55;
  nw_http_request_access_path();
  if (!*((_BYTE *)v60 + 24))
  {
    v15 = 0;
    v14 = 404;
    goto LABEL_37;
  }
  v16 = (const __CFURL *)v56[3];
  if (!v16)
  {
LABEL_27:
    v15 = 0;
LABEL_28:
    v14 = 500;
    goto LABEL_37;
  }
  if (v5[10])
    v17 = (const char *)v5[10];
  else
    v17 = "";
  v18 = CFURLCopyFileSystemPath(v16, kCFURLPOSIXPathStyle);
  if (!v18)
    goto LABEL_25;
  v19 = v18;
  v20 = mdns_cfstring_to_utf8_cstring(v18);
  CFRelease(v19);
  if (!v20)
    goto LABEL_25;
  v21 = strcmp(v20, v17);
  free(v20);
  if (v21)
    goto LABEL_25;
  String = CFURLCopyQueryString((CFURLRef)v56[3], &stru_24F2874F0);
  v15 = String;
  if (!String)
    goto LABEL_26;
  v23 = mdns_cfstring_to_utf8_cstring(String);
  CFRelease(v15);
  if (!v23)
  {
LABEL_25:
    v15 = 0;
LABEL_26:
    v14 = 400;
    goto LABEL_37;
  }
  if (strncmp(v23, "dns=", 4uLL))
    goto LABEL_34;
  v24 = v23 + 4;
  v25 = strlen(v23 + 4);
  if ((v25 & 3) == 1)
    goto LABEL_34;
  v32 = v25;
  if (!v25)
  {
    v44 = MEMORY[0x24BDAC990];
LABEL_83:
    v15 = dispatch_data_create_with_transform();
    free(v23);
    dispatch_release(v44);
    if (v15)
    {
      if (dispatch_data_get_size(v15) >= 0xC)
      {
        v45 = *MEMORY[0x24BDE0848];
        v46 = v5[4];
        completion = v11;
        p_completion = 0x40000000;
        v66 = (uint64_t)___mdns_dns_relay_send_dns_message_to_server_block_invoke;
        v67 = &__block_descriptor_tmp_12;
        v68 = v5;
        nw_connection_send(v46, v15, v45, 1, &completion);
        v28 = 0;
LABEL_42:
        nw_release(v12);
        goto LABEL_43;
      }
      goto LABEL_26;
    }
    goto LABEL_28;
  }
  v33 = 0;
  while (1)
  {
    v34 = v24[v33];
    v35 = (v34 - 48) >= 0xA && (v34 & 0xFFFFFFDF) - 65 >= 0x1A;
    if (v35 && v34 != 95 && v34 != 45)
      break;
    if (v25 == ++v33)
    {
      v36 = (v25 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (v36 < v32)
        break;
      size = (v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      v37 = malloc_type_calloc(v36, 1uLL, 0xF1748037uLL);
      if (!v37)
      {
        __break(1u);
        goto LABEL_91;
      }
      v38 = 0;
      do
      {
        v39 = v24[v38];
        v40 = v24[v38];
        if (v39 == 45)
          v40 = 43;
        if (v39 == 95)
          v41 = 47;
        else
          v41 = v40;
        v37[v38++] = v41;
      }
      while (v32 != v38);
      v42 = (v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (size > v32)
      {
        v43 = v37;
        memset(&v37[v32], 61, size - v32);
        v37 = v43;
        v42 = (v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      }
      v44 = dispatch_data_create(v37, v42, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
      if (!v44)
      {
        v14 = 500;
        goto LABEL_35;
      }
      goto LABEL_83;
    }
  }
LABEL_34:
  v14 = 400;
LABEL_35:
  free(v23);
LABEL_36:
  v15 = 0;
LABEL_37:
  v63 = 0;
  v26 = _mdns_create_http_response_context(v14, 0, &v63);
  if (!v63)
  {
    v27 = v5[3];
    completion = v11;
    p_completion = 0x40000000;
    v66 = (uint64_t)___mdns_dns_relay_send_data_to_client_block_invoke;
    v67 = &__block_descriptor_tmp_22;
    v68 = v5;
    nw_connection_send(v27, 0, v26, 1, &completion);
  }
  if (v26)
    nw_release(v26);
  v28 = v63;
  if (v12)
    goto LABEL_42;
LABEL_43:
  v29 = (const void *)v56[3];
  if (v29)
  {
    CFRelease(v29);
    v56[3] = 0;
  }
  if (v15)
    dispatch_release(v15);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  if (v28)
    goto LABEL_48;
  if (a3 && a4 && nw_content_context_get_is_final(a3))
  {
    v30 = *MEMORY[0x24BDE0858];
    v31 = v5[4];
    *(_QWORD *)&buf = v11;
    *((_QWORD *)&buf + 1) = 0x40000000;
    v70 = ___mdns_dns_relay_send_dns_message_to_server_block_invoke;
    v71 = &__block_descriptor_tmp_12;
    v72 = v5;
    nw_connection_send(v31, 0, v30, 1, &buf);
  }
  else
  {
    (*(void (**)(_QWORD *, _QWORD))(v5[2] + 48))(v5, v5[3]);
  }
LABEL_54:
  if (v6)
    nw_release(v6);
  if (v9)
    nw_release(v9);
}

unint64_t ___mdns_doh_relay_handle_request_block_invoke(unint64_t result, char *__s)
{
  unint64_t v3;
  size_t v4;
  uint64_t v5;
  const char *v6;
  int v7;
  size_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  char __str[32];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (__s)
  {
    v3 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    v4 = strlen(__s);
    v5 = *(_QWORD *)(v3 + 48);
    v6 = *(const char **)(v5 + 88);
    v7 = *(unsigned __int16 *)(v5 + 96);
    result = strlen(v6);
    v8 = v4 - result;
    v11 = 0;
    if (v4 >= result)
    {
      v9 = result;
      result = strncasecmp(__s, v6, result);
      if (!(_DWORD)result)
      {
        v10 = v7 == 443 && v4 == v9;
        if (v10
          || (snprintf(__str, 0x20uLL, ":%u", v7), result = strlen(__str), v8 == result)
          && (result = strncasecmp(&__s[v9], __str, v8), !(_DWORD)result))
        {
          v11 = 1;
        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = v11;
  }
  return result;
}

CFURLRef ___mdns_doh_relay_handle_request_block_invoke_2(CFURLRef result, char *__s)
{
  CFURLRef v3;
  size_t v4;

  if (__s)
  {
    v3 = result;
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 24) = 1;
    v4 = strlen(__s);
    result = CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)__s, v4, 0x8000100u, 0);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 5) + 8) + 24) = result;
  }
  return result;
}

void ___mdns_dns_relay_send_data_to_client_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24) && a2)
  {
    if (*(_QWORD *)(v2 + 32))
      _mdns_dns_relay_terminate(v2);
  }
}

uint64_t mdns_doh_relay_set_request_uri_path(uint64_t a1, char *a2)
{
  if (*(_BYTE *)(a1 + 72))
    return 4294960577;
  mdns_replace_string((void **)(a1 + 80), a2);
  return 0;
}

uint64_t mdns_doh_relay_set_host_and_port(uint64_t a1, char *a2, __int16 a3)
{
  unsigned int v6;
  char *v7;
  void *v8;
  uint64_t result;
  char *v10[3];

  v10[2] = *(char **)MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 72))
    return 4294960577;
  v6 = inet_pton(30, a2, v10);
  if (v6 <= 1)
  {
    if (v6 == 1)
    {
      v10[0] = 0;
      asprintf(v10, "[%s]", a2);
      v7 = v10[0];
      if (!v10[0])
        return 4294960568;
      v8 = *(void **)(a1 + 88);
      if (v8)
      {
        free(v8);
        v7 = v10[0];
      }
      *(_QWORD *)(a1 + 88) = v7;
      goto LABEL_11;
    }
LABEL_10:
    mdns_replace_string((void **)(a1 + 88), a2);
LABEL_11:
    result = 0;
    *(_WORD *)(a1 + 96) = a3;
    return result;
  }
  if (!*__error())
    return 4294960596;
  result = *__error();
  if (!(_DWORD)result)
    goto LABEL_10;
  return result;
}

void *_mdns_dns_service_manager_copy_description(_QWORD *a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int appended;
  int v9;
  int v10;
  void *v11;
  _QWORD v13[7];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  _QWORD v23[5];
  _QWORD v24[5];

  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (a2)
    {
      appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1);
      *((_DWORD *)v20 + 6) = appended;
      if (appended)
        goto LABEL_7;
    }
    v9 = mdns_string_builder_append_formatted(v7, "{");
    *((_DWORD *)v20 + 6) = v9;
    if (v9)
      goto LABEL_7;
    v16[3] = (uint64_t)"\n\t";
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = ___mdns_dns_service_manager_copy_description_block_invoke;
    v13[3] = &unk_24F284FF0;
    v13[4] = &v19;
    v13[5] = &v15;
    v13[6] = v7;
    v14 = a3;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 0x40000000;
    v23[2] = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
    v23[3] = &unk_24F2856A8;
    v23[4] = v13;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 0x40000000;
    v24[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v24[3] = &unk_24F285680;
    v24[4] = v23;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers((uint64_t)a1, (uint64_t)v24);
    if (*((_DWORD *)v20 + 6)
      || (v10 = mdns_string_builder_append_formatted(v7, "\n}"), (*((_DWORD *)v20 + 6) = v10) != 0))
    {
LABEL_7:
      v11 = 0;
    }
    else
    {
      v11 = mdns_string_builder_copy_string((uint64_t)v7);
    }
    os_release(v7);
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

void _mdns_dns_service_manager_finalize(_QWORD *a1)
{
  const void *v2;
  NSObject *v3;
  const void *v4;

  _mdns_dns_service_manager_enumerate_all_service_array_pointers((uint64_t)a1, (uint64_t)&__block_literal_global_103);
  v2 = (const void *)a1[10];
  if (v2)
  {
    CFRelease(v2);
    a1[10] = 0;
  }
  v3 = a1[11];
  if (v3)
  {
    dispatch_release(v3);
    a1[11] = 0;
  }
  v4 = (const void *)a1[13];
  if (v4)
  {
    _Block_release(v4);
    a1[13] = 0;
  }
}

uint64_t _mdns_dns_service_manager_enumerate_all_service_array_pointers(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  char v6;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x24BDAC8D0];
  v7[0] = a1 + 24;
  v7[1] = a1 + 32;
  v7[2] = a1 + 40;
  v7[3] = a1 + 48;
  v7[4] = a1 + 56;
  v7[5] = a1 + 64;
  v7[6] = a1 + 72;
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  if ((_DWORD)result)
  {
    v4 = 1;
    v5 = 6;
    while (v4 != 7)
    {
      v6 = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, v7[v4++]);
      if ((v6 & 1) == 0)
      {
        v5 = v4 - 2;
        return v5 > 5;
      }
    }
    return v5 > 5;
  }
  return result;
}

uint64_t ___mdns_dns_service_manager_finalize_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  if (*a2)
  {
    CFRelease(*a2);
    *a2 = 0;
  }
  return 1;
}

BOOL ___mdns_dns_service_manager_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ",\n\t";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_service_manager_enumerate_all_services_block_invoke(uint64_t a1, const __CFArray *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dns_service_enumerate_array_including_variants_and_discovered_alts_block_invoke;
  v4[3] = &unk_24F2856D0;
  v4[4] = v2;
  return mdns_cfarray_enumerate(a2, (uint64_t)v4);
}

uint64_t ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke(uint64_t a1, _QWORD *a2)
{
  if (*a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return 1;
}

uint64_t ___mdns_dns_service_enumerate_array_including_variants_and_discovered_alts_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const __CFArray *v5;
  const __CFArray *v6;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    v5 = *(const __CFArray **)(a2 + 128);
    if (!v5 || (result = mdns_cfarray_enumerate(v5, *(_QWORD *)(a1 + 32)), (_DWORD)result))
    {
      v6 = *(const __CFArray **)(a2 + 144);
      return !v6 || mdns_cfarray_enumerate(v6, *(_QWORD *)(a1 + 32));
    }
  }
  return result;
}

void *_mdns_dns_service_copy_description(uint64_t a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  int appended;
  int v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  const char *v19;
  int v20;
  int v21;
  const __CFArray *v23;
  int v24;
  int v25;
  uint64_t v26;
  _QWORD *v27;
  const char *v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  char *provider_name_cstr;
  char *v46;
  int v47;
  int v48;
  uint64_t v49;
  char *v50;
  int v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  _QWORD v59[7];
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  int v68;
  char out[72];
  unsigned __int8 uu[8];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v65 = 0;
  v66 = &v65;
  v67 = 0x2000000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2000000000;
  v64 = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (!a2
      || (v8 = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1), (*((_DWORD *)v66 + 6) = v8) == 0))
    {
      appended = mdns_string_builder_append_formatted(v7, "id: %llu", *(_QWORD *)(a1 + 24));
      *((_DWORD *)v66 + 6) = appended;
      if (!appended)
      {
        v10 = mdns_string_builder_append_formatted(v7, ", type: ");
        *((_DWORD *)v66 + 6) = v10;
        if (!v10)
        {
          v11 = *(unsigned __int8 *)(a1 + 281) > 5uLL
              ? mdns_string_builder_append_formatted(v7, "«INVALID %u»")
              : mdns_string_builder_append_formatted(v7, "%s");
          *((_DWORD *)v66 + 6) = v11;
          if (!v11)
          {
            v13 = mdns_string_builder_append_formatted(v7, ", source: ");
            *((_DWORD *)v66 + 6) = v13;
            if (!v13)
            {
              v14 = (*(char *)(a1 + 282) - 1) > 4
                  ? mdns_string_builder_append_formatted(v7, "«INVALID %u»")
                  : mdns_string_builder_append_formatted(v7, "%s");
              *((_DWORD *)v66 + 6) = v14;
              if (!v14)
              {
                v15 = mdns_string_builder_append_formatted(v7, ", scope: ");
                *((_DWORD *)v66 + 6) = v15;
                if (!v15)
                {
                  switch(*(_BYTE *)(a1 + 280))
                  {
                    case 1:
                      v16 = mdns_string_builder_append_formatted(v7, "none", v58);
                      goto LABEL_27;
                    case 2:
                      v16 = mdns_string_builder_append_formatted(v7, "interface", v58);
                      goto LABEL_27;
                    case 3:
                      v16 = mdns_string_builder_append_formatted(v7, "service (%u)");
                      goto LABEL_27;
                    case 4:
                      v17 = mdns_string_builder_append_formatted(v7, "uuid");
                      *((_DWORD *)v66 + 6) = v17;
                      if (v17)
                        goto LABEL_32;
                      if ((a3 & 1) != 0)
                        goto LABEL_28;
                      *(_QWORD *)uu = 0;
                      v71 = 0;
                      nw_resolver_config_get_identifier();
                      memset(out, 0, 37);
                      uuid_unparse(uu, out);
                      v18 = mdns_string_builder_append_formatted(v7, " (%s)", out);
                      v12 = 0;
                      *((_DWORD *)v66 + 6) = v18;
                      if (!v18)
                        goto LABEL_28;
                      goto LABEL_33;
                    case 5:
                      v16 = mdns_string_builder_append_formatted(v7, "none+interface");
                      goto LABEL_27;
                    default:
                      v16 = mdns_string_builder_append_formatted(v7, "«INVALID %d»");
LABEL_27:
                      *((_DWORD *)v66 + 6) = v16;
                      if (v16)
                        goto LABEL_32;
LABEL_28:
                      v19 = *(const char **)(a1 + 104);
                      if (!v19)
                        v19 = "";
                      v20 = mdns_string_builder_append_formatted(v7, ", interface: %s/%u", v19, *(_DWORD *)(a1 + 256));
                      *((_DWORD *)v66 + 6) = v20;
                      if (v20)
                        goto LABEL_32;
                      v21 = mdns_string_builder_append_formatted(v7, ", servers: {");
                      *((_DWORD *)v66 + 6) = v21;
                      if (v21)
                        goto LABEL_32;
                      v62[3] = 0;
                      v23 = *(const __CFArray **)(a1 + 80);
                      if (v23)
                      {
                        v59[0] = MEMORY[0x24BDAC760];
                        v59[1] = 0x40000000;
                        v59[2] = ___mdns_dns_service_copy_description_block_invoke;
                        v59[3] = &unk_24F285340;
                        v59[4] = &v65;
                        v59[5] = &v61;
                        v59[6] = v7;
                        v60 = a3;
                        mdns_cfarray_enumerate(v23, (uint64_t)v59);
                        if (*((_DWORD *)v66 + 6))
                          goto LABEL_32;
                      }
                      v24 = mdns_string_builder_append_formatted(v7, "}");
                      *((_DWORD *)v66 + 6) = v24;
                      if (v24)
                        goto LABEL_32;
                      v25 = mdns_string_builder_append_formatted(v7, ", domains: {");
                      *((_DWORD *)v66 + 6) = v25;
                      if (v25)
                        goto LABEL_32;
                      v62[3] = 0;
                      v26 = *(_QWORD *)(a1 + 136);
                      if (!v26)
                        v26 = a1;
                      v27 = *(_QWORD **)(v26 + 88);
                      if (!v27)
                        goto LABEL_45;
                      v28 = 0;
                      break;
                  }
                  while (1)
                  {
                    v29 = mdns_string_builder_append_description_with_prefix(v7, v28, v27[1], a3);
                    *((_DWORD *)v66 + 6) = v29;
                    if (v29)
                      break;
                    v62[3] = (uint64_t)", ";
                    v27 = (_QWORD *)*v27;
                    v28 = ", ";
                    if (!v27)
                    {
LABEL_45:
                      v30 = mdns_string_builder_append_formatted(v7, "}");
                      *((_DWORD *)v66 + 6) = v30;
                      if (!v30)
                      {
                        v31 = mdns_string_builder_append_formatted(v7, ", attributes: {");
                        *((_DWORD *)v66 + 6) = v31;
                        if (!v31)
                        {
                          v32 = 0;
                          v33 = v62;
                          v62[3] = (uint64_t)"";
                          do
                          {
                            if (((uint64_t)(&off_24F285360)[v32 + 1] & *(_WORD *)(a1 + 276)) != 0)
                            {
                              v34 = mdns_string_builder_append_formatted(v7, "%s%s", (const char *)v33[3], (&off_24F285360)[v32]);
                              *((_DWORD *)v66 + 6) = v34;
                              if (v34)
                                goto LABEL_32;
                              v33 = v62;
                              v62[3] = (uint64_t)", ";
                            }
                            v32 += 2;
                          }
                          while (v32 != 14);
                          if (*(_QWORD *)(a1 + 96) && nw_resolver_config_get_allow_failover())
                          {
                            v35 = mdns_string_builder_append_formatted(v7, "%sallows-failover", (const char *)v62[3]);
                            *((_DWORD *)v66 + 6) = v35;
                            if (v35)
                              break;
                            v62[3] = (uint64_t)", ";
                          }
                          if (!*(_QWORD *)(a1 + 240)
                            || !*(_QWORD *)(a1 + 248)
                            || (v36 = mdns_string_builder_append_formatted(v7, "%sreports-push-connection-error", (const char *)v62[3]), (*((_DWORD *)v66 + 6) = v36) == 0))
                          {
                            v37 = mdns_string_builder_append_formatted(v7, "}");
                            *((_DWORD *)v66 + 6) = v37;
                            if (!v37)
                            {
                              v38 = mdns_string_builder_append_formatted(v7, ", interface properties: {");
                              *((_DWORD *)v66 + 6) = v38;
                              if (!v38)
                              {
                                v39 = 0;
                                v40 = v62;
                                v62[3] = (uint64_t)"";
                                do
                                {
                                  if (((uint64_t)(&off_24F2853D0)[v39 + 1] & *(_WORD *)(a1 + 276)) != 0)
                                  {
                                    v41 = mdns_string_builder_append_formatted(v7, "%s%s", (const char *)v40[3], (&off_24F2853D0)[v39]);
                                    *((_DWORD *)v66 + 6) = v41;
                                    if (v41)
                                      goto LABEL_32;
                                    v40 = v62;
                                    v62[3] = (uint64_t)", ";
                                  }
                                  v39 += 2;
                                }
                                while (v39 != 16);
                                v42 = mdns_string_builder_append_formatted(v7, "}");
                                *((_DWORD *)v66 + 6) = v42;
                                if (!v42)
                                {
                                  if (!*(_QWORD *)(a1 + 96))
                                    goto LABEL_100;
                                  v43 = mdns_string_builder_append_formatted(v7, ", resolver config: {");
                                  *((_DWORD *)v66 + 6) = v43;
                                  if (!v43)
                                  {
                                    v44 = mdns_string_builder_append_formatted(v7, "provider name: ");
                                    *((_DWORD *)v66 + 6) = v44;
                                    if (!v44)
                                    {
                                      provider_name_cstr = _mdns_dns_service_get_provider_name_cstr(a1);
                                      if (!provider_name_cstr)
                                        goto LABEL_102;
                                      v46 = provider_name_cstr;
                                      if (a3)
                                      {
                                        if ((int)DNSMessagePrintObfuscatedString((uint64_t)out, 64, provider_name_cstr) < 0)v46 = "«REDACTED»";
                                        else
                                          v46 = out;
                                      }
                                      v47 = mdns_string_builder_append_formatted(v7, "%s", v46);
                                      *((_DWORD *)v66 + 6) = v47;
                                      if (!v47)
                                      {
LABEL_102:
                                        v48 = mdns_string_builder_append_formatted(v7, ", provider path: ");
                                        *((_DWORD *)v66 + 6) = v48;
                                        if (!v48)
                                        {
                                          v49 = *(_QWORD *)(a1 + 136);
                                          if (!v49 || !*(_QWORD *)(v49 + 96))
                                            v49 = a1;
                                          v50 = *(char **)(v49 + 168);
                                          if (!v50)
                                            goto LABEL_101;
                                          if (a3)
                                          {
                                            if ((int)DNSMessagePrintObfuscatedString((uint64_t)out, 64, v50) < 0)
                                              v50 = "«REDACTED»";
                                            else
                                              v50 = out;
                                          }
                                          v51 = mdns_string_builder_append_formatted(v7, "%s", v50);
                                          *((_DWORD *)v66 + 6) = v51;
                                          if (!v51)
                                          {
LABEL_101:
                                            v52 = mdns_string_builder_append_formatted(v7, "}");
                                            *((_DWORD *)v66 + 6) = v52;
                                            if (!v52)
                                            {
LABEL_100:
                                              if (!*(_QWORD *)(a1 + 176)
                                                || (v53 = mdns_string_builder_append_formatted(v7, ", connection hostname: %s", *(const char **)(a1 + 176)), (*((_DWORD *)v66 + 6) = v53) == 0))
                                              {
                                                if (!*(_WORD *)(a1 + 278)
                                                  || (v54 = mdns_string_builder_append_formatted(v7, ", port: %d", *(unsigned __int16 *)(a1 + 278)), (*((_DWORD *)v66 + 6) = v54) == 0))
                                                {
                                                  v55 = *(_QWORD *)(a1 + 216);
                                                  if (!v55
                                                    || (v56 = mdns_string_builder_append_formatted(v7, ", SRV name: %s", *(const char **)(v55 + 40)), (*((_DWORD *)v66 + 6) = v56) == 0))
                                                  {
                                                    v57 = *(_QWORD *)(a1 + 136)
                                                        ? mdns_string_builder_append_formatted(v7, ", parent: %llu")
                                                        : mdns_string_builder_append_formatted(v7, ", use count: %d");
                                                    *((_DWORD *)v66 + 6) = v57;
                                                    if (!v57)
                                                    {
                                                      v12 = mdns_string_builder_copy_string((uint64_t)v7);
                                                      goto LABEL_33;
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                      break;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_32:
    v12 = 0;
LABEL_33:
    os_release(v7);
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  return v12;
}

uint64_t _mdns_dns_service_equal(uint64_t a1, uint64_t a2)
{
  return _mdns_dns_service_equal_ex(a1, a2, 0);
}

void _mdns_dns_service_finalize(_QWORD *a1)
{
  void (*v2)(void);
  const void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  const void *v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  const void *v15;
  void *v16;
  void *v17;
  const void *v18;

  if (a1[14])
  {
    v2 = (void (*)(void))a1[15];
    if (v2)
      v2();
    a1[14] = 0;
  }
  v3 = (const void *)a1[10];
  if (v3)
  {
    CFRelease(v3);
    a1[10] = 0;
  }
  while (1)
  {
    v4 = (_QWORD *)a1[11];
    if (!v4)
      break;
    a1[11] = *v4;
    _domain_item_free(v4);
  }
  v5 = (void *)a1[6];
  if (v5)
  {
    nw_release(v5);
    a1[6] = 0;
  }
  v6 = (void *)a1[12];
  if (v6)
  {
    nw_release(v6);
    a1[12] = 0;
  }
  v7 = (void *)a1[13];
  if (v7)
  {
    free(v7);
    a1[13] = 0;
  }
  v8 = (const void *)a1[16];
  if (v8)
  {
    CFRelease(v8);
    a1[16] = 0;
  }
  v9 = (void *)a1[17];
  if (v9)
  {
    os_release(v9);
    a1[17] = 0;
  }
  v10 = (const void *)a1[18];
  if (v10)
  {
    CFRelease(v10);
    a1[18] = 0;
  }
  v11 = (const void *)a1[19];
  if (v11)
  {
    CFRelease(v11);
    a1[19] = 0;
  }
  v12 = (void *)a1[20];
  if (v12)
  {
    xpc_release(v12);
    a1[20] = 0;
  }
  v13 = (void *)a1[21];
  if (v13)
  {
    free(v13);
    a1[21] = 0;
  }
  v14 = (void *)a1[22];
  if (v14)
  {
    free(v14);
    a1[22] = 0;
  }
  v15 = (const void *)a1[24];
  if (v15)
  {
    CFRelease(v15);
    a1[24] = 0;
  }
  v16 = (void *)a1[26];
  if (v16)
  {
    nw_release(v16);
    a1[26] = 0;
  }
  v17 = (void *)a1[27];
  if (v17)
  {
    os_release(v17);
    a1[27] = 0;
  }
  v18 = (const void *)a1[29];
  if (v18)
  {
    CFRelease(v18);
    a1[29] = 0;
  }
}

void _domain_item_free(_QWORD *a1)
{
  void *v2;

  v2 = (void *)a1[1];
  if (v2)
    os_release(v2);
  free(a1);
}

uint64_t _mdns_dns_service_equal_ex(uint64_t a1, uint64_t a2, char a3)
{
  int v5;
  const void *v7;
  const void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  int v13;

  if (a1 == a2)
    return 1;
  v5 = *(unsigned __int8 *)(a1 + 280);
  if (v5 != *(unsigned __int8 *)(a2 + 280)
    || *(_DWORD *)(a1 + 256) != *(_DWORD *)(a2 + 256)
    || v5 == 3 && *(_DWORD *)(a1 + 260) != *(_DWORD *)(a2 + 260))
  {
    return 0;
  }
  v7 = *(const void **)(a1 + 80);
  v8 = *(const void **)(a2 + 80);
  if (v7 == v8 || (result = 0, v7) && v8 && (result = CFEqual(*(CFTypeRef *)(a1 + 80), v8), (_DWORD)result))
  {
    if ((a3 & 1) != 0)
      return 1;
    v10 = a1 + 88;
    v11 = a2 + 88;
    while (1)
    {
      v11 = *(_QWORD *)v11;
      v10 = *(_QWORD *)v10;
      if (!v10 || v11 == 0)
        break;
      v13 = _domain_item_compare(v10, v11, 0);
      result = 0;
      if (v13)
        return result;
    }
    return !(v10 | v11);
  }
  return result;
}

uint64_t _domain_item_compare(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  _BYTE *v12;
  _BYTE *v13;
  int v14;
  _BYTE *v15;
  _BYTE *v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned __int8 *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_DWORD *)(v3 + 48);
  v5 = *(_QWORD *)(a2 + 8);
  v6 = v4 - *(_DWORD *)(v5 + 48);
  if (v6)
  {
    if (v6 < 1)
      return 1;
    else
      return 0xFFFFFFFFLL;
  }
  else
  {
    if (v3 != v5 && v4 >= 1)
    {
      v12 = *(_BYTE **)(v3 + 24);
      v13 = *(_BYTE **)(v5 + 24);
      while (1)
      {
        v14 = v4 - 1;
        if (v4 < 1)
          return (a3 & 1) == 0 && *(_DWORD *)(a1 + 16) < *(_DWORD *)(a2 + 16);
        v15 = v12;
        v16 = v13;
        if (v4 != 1)
        {
          v17 = 1;
          v15 = v12;
          do
          {
            if (!*v15)
              break;
            v15 += *v15 + 1;
            ++v17;
          }
          while (v4 != v17);
          v18 = 1;
          v16 = v13;
          do
          {
            if (!*v16)
              break;
            v16 += *v16 + 1;
            ++v18;
          }
          while (v4 != v18);
        }
        v21 = *v15;
        v19 = v15 + 1;
        v20 = v21;
        v24 = *v16;
        v22 = v16 + 1;
        v23 = v24;
        if (v20 >= v24)
          v25 = v23;
        else
          v25 = v20;
        v26 = mdns_memcmp_us_ascii_case_insensitive(v19, v22, v25, v4);
        if (v26)
          return (char)v26;
        if (v20 < v23)
          break;
        v4 = v14;
        if (v20 > v23)
        {
          LOBYTE(v26) = 1;
          return (char)v26;
        }
      }
      LOBYTE(v26) = -1;
      return (char)v26;
    }
    return (a3 & 1) == 0 && *(_DWORD *)(a1 + 16) < *(_DWORD *)(a2 + 16);
  }
}

BOOL ___mdns_dns_service_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

char *_mdns_dns_service_get_provider_name_cstr(uint64_t a1)
{
  uint64_t v1;
  char *result;

  v1 = *(_QWORD *)(a1 + 136);
  if (!v1 || !*(_QWORD *)(v1 + 96))
    v1 = a1;
  result = *(char **)(v1 + 160);
  if (result)
    return (char *)xpc_string_get_string_ptr(result);
  return result;
}

uint64_t mdns_dns_service_manager_create(NSObject *a1, int *a2)
{
  _QWORD *v4;
  uint64_t v5;
  _UNKNOWN **v6;
  void (*v7)(uint64_t);
  CFMutableArrayRef Mutable;
  int v9;

  v4 = (_QWORD *)_os_object_alloc();
  v5 = (uint64_t)v4;
  if (v4)
  {
    v6 = &_mdns_dns_service_manager_kind;
    v4[2] = &_mdns_dns_service_manager_kind;
    do
    {
      v7 = (void (*)(uint64_t))v6[2];
      if (v7)
        v7(v5);
      v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    if (_mdns_dns_service_manager_enumerate_all_service_array_pointers(v5, (uint64_t)&__block_literal_global_138)&& (Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks), (*(_QWORD *)(v5 + 80) = Mutable) != 0))
    {
      *(_QWORD *)(v5 + 88) = a1;
      dispatch_retain(a1);
      v4 = 0;
      v9 = 0;
    }
    else
    {
      v9 = -6729;
      v4 = (_QWORD *)v5;
      v5 = 0;
    }
  }
  else
  {
    v9 = -6728;
  }
  if (a2)
    *a2 = v9;
  if (v4)
    os_release(v4);
  return v5;
}

BOOL __mdns_dns_service_manager_create_block_invoke(uint64_t a1, CFMutableArrayRef *a2)
{
  CFMutableArrayRef Mutable;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
  *a2 = Mutable;
  return Mutable != 0;
}

uint64_t mdns_dns_service_manager_set_report_symptoms(uint64_t result, char a2)
{
  if (!*(_BYTE *)(result + 132))
    *(_BYTE *)(result + 128) = a2;
  return result;
}

uint64_t ___mdns_os_variant_has_internal_diagnostics_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  _mdns_os_variant_has_internal_diagnostics_s_result = result;
  return result;
}

uint64_t mdns_dns_service_manager_enable_problematic_qtype_workaround(uint64_t result, int a2)
{
  if (!*(_BYTE *)(result + 132))
    *(_DWORD *)(result + 120) = a2;
  return result;
}

void mdns_dns_service_manager_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 132))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 104);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 104) = v3;
  }
}

void mdns_dns_service_manager_activate(uint64_t a1)
{
  _QWORD block[5];

  if (!*(_BYTE *)(a1 + 132))
  {
    *(_BYTE *)(a1 + 132) = 1;
    if (_mdns_dns_service_queue_s_once != -1)
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __mdns_dns_service_manager_activate_block_invoke;
    block[3] = &__block_descriptor_tmp_4;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  }
}

void __mdns_dns_service_manager_activate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_source_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD handler[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 131) && !*(_QWORD *)(v1 + 96))
  {
    v2 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, *(dispatch_queue_t *)(v1 + 88));
    *(_QWORD *)(v1 + 96) = v2;
    if (v2)
    {
      os_retain((void *)v1);
      v3 = MEMORY[0x24BDAC760];
      v4 = *(NSObject **)(v1 + 96);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_dns_service_manager_activate_internal_block_invoke;
      handler[3] = &__block_descriptor_tmp_5_141;
      handler[4] = v1;
      dispatch_source_set_event_handler(v4, handler);
      v5 = *(NSObject **)(v1 + 96);
      v6[0] = v3;
      v6[1] = 0x40000000;
      v6[2] = ___mdns_dns_service_manager_activate_internal_block_invoke_2;
      v6[3] = &__block_descriptor_tmp_6_142;
      v6[4] = v1;
      dispatch_source_set_cancel_handler(v5, v6);
      dispatch_activate(*(dispatch_object_t *)(v1 + 96));
    }
    else
    {
      _mdns_dns_service_manager_terminate(v1, -6729);
    }
  }
}

uint64_t ___mdns_dns_service_manager_activate_internal_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 3, 0);
  return result;
}

void ___mdns_dns_service_manager_activate_internal_block_invoke_2(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
}

void _mdns_dns_service_manager_terminate(uint64_t a1, int a2)
{
  NSObject *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  void *ValueAtIndex;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  int v13;
  _QWORD v14[5];
  _QWORD v15[5];

  if (!*(_BYTE *)(a1 + 130))
  {
    *(_BYTE *)(a1 + 131) = 1;
    v4 = *(NSObject **)(a1 + 96);
    if (v4)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
      dispatch_release(v4);
      *(_QWORD *)(a1 + 96) = 0;
    }
    Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
    if (Count >= 1)
    {
      v6 = Count;
      for (i = 0; i != v6; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), i);
        mdns_interface_monitor_invalidate(ValueAtIndex);
      }
    }
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 80));
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 0x40000000;
    v14[2] = ___mdns_dns_service_manager_terminate_block_invoke;
    v14[3] = &__block_descriptor_tmp_110;
    v14[4] = a1;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 0x40000000;
    v15[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v15[3] = &unk_24F285680;
    v15[4] = v14;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(a1, (uint64_t)v15);
    v10 = *(void **)(a1 + 112);
    if (v10)
    {
      mdns_system_remove_network_policy(v10);
      *(_QWORD *)(a1 + 112) = 0;
    }
    os_retain((void *)a1);
    v11 = *(NSObject **)(a1 + 88);
    v12[0] = v9;
    v12[1] = 0x40000000;
    v12[2] = ___mdns_dns_service_manager_terminate_block_invoke_2;
    v12[3] = &__block_descriptor_tmp_111;
    v12[4] = a1;
    v13 = a2;
    dispatch_async(v11, v12);
  }
}

uint64_t ___mdns_dns_service_manager_terminate_block_invoke(uint64_t a1, const __CFArray *a2)
{
  uint64_t v3;
  _QWORD v5[5];

  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = ___mdns_dns_service_manager_terminate_services_block_invoke;
  v5[3] = &__block_descriptor_tmp_112;
  v5[4] = v3;
  mdns_cfarray_enumerate(a2, (uint64_t)v5);
  CFArrayRemoveAllValues(a2);
  return 1;
}

void ___mdns_dns_service_manager_terminate_block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[13];
  if (v3)
  {
    if (*(_DWORD *)(a1 + 40))
      v4 = 1;
    else
      v4 = 2;
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(v2[13], v4);
    v2 = *(_QWORD **)(a1 + 32);
  }
  os_release(v2);
}

uint64_t ___mdns_dns_service_manager_terminate_services_block_invoke(uint64_t a1, uint64_t a2)
{
  _mdns_dns_service_manager_terminate_service(*(_QWORD *)(a1 + 32), a2);
  return 1;
}

void _mdns_dns_service_manager_terminate_service(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  const void *v5;
  const __CFArray *v6;
  const void *v7;
  const __CFArray *v8;
  const void *v9;
  _QWORD v10[5];

  _mdns_dns_service_clear_use_count(a2);
  _mdns_dns_service_make_defunct(a2);
  if (*(_QWORD *)(a2 + 96) && *(_BYTE *)(a2 + 284))
  {
    *(_BYTE *)(a2 + 284) = 0;
    _mdns_dns_service_manager_cancel_resolver_config_updates();
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 0x40000000;
  v10[2] = ___mdns_dns_service_manager_terminate_service_block_invoke;
  v10[3] = &__block_descriptor_tmp_122;
  v10[4] = a1;
  v4 = *(const __CFArray **)(a2 + 128);
  if (v4)
  {
    mdns_cfarray_enumerate(v4, (uint64_t)v10);
    v5 = *(const void **)(a2 + 128);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a2 + 128) = 0;
    }
  }
  v6 = *(const __CFArray **)(a2 + 144);
  if (v6)
  {
    mdns_cfarray_enumerate(v6, (uint64_t)v10);
    v7 = *(const void **)(a2 + 144);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(a2 + 144) = 0;
    }
  }
  v8 = *(const __CFArray **)(a2 + 152);
  if (v8)
  {
    mdns_cfarray_enumerate(v8, (uint64_t)v10);
    v9 = *(const void **)(a2 + 152);
    if (v9)
    {
      CFRelease(v9);
      *(_QWORD *)(a2 + 152) = 0;
    }
  }
}

void _mdns_dns_service_clear_use_count(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 224);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 224));
    dispatch_release(v2);
    *(_QWORD *)(a1 + 224) = 0;
  }
  *(_DWORD *)(a1 + 264) = 0;
}

void _mdns_dns_service_make_defunct(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _BYTE *v5;
  NSObject *v6;
  const void *v7;
  _QWORD block[5];

  *(_WORD *)(a1 + 276) |= 1u;
  v2 = *(NSObject **)(a1 + 200);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 200));
    dispatch_release(v2);
    *(_QWORD *)(a1 + 200) = 0;
  }
  _mdns_dns_service_forget_all_ddr_queriers(a1);
  if (*(_QWORD *)(a1 + 208))
  {
    nw_array_apply();
    v3 = *(void **)(a1 + 208);
    if (v3)
    {
      nw_release(v3);
      *(_QWORD *)(a1 + 208) = 0;
    }
  }
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    mdns_resolver_invalidate(v4);
    os_release(*(void **)(a1 + 64));
    *(_QWORD *)(a1 + 64) = 0;
  }
  v5 = *(_BYTE **)(a1 + 72);
  if (v5)
  {
    v5[103] = 1;
    os_retain(v5);
    if (_mdns_push_notifications_queue_s_once != -1)
      dispatch_once(&_mdns_push_notifications_queue_s_once, &__block_literal_global_35);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __mdns_push_server_invalidate_block_invoke;
    block[3] = &__block_descriptor_tmp_2_77;
    block[4] = v5;
    dispatch_async((dispatch_queue_t)_mdns_push_notifications_queue_s_queue, block);
    os_release(*(void **)(a1 + 72));
    *(_QWORD *)(a1 + 72) = 0;
  }
  v6 = *(NSObject **)(a1 + 240);
  if (v6)
  {
    dispatch_release(v6);
    *(_QWORD *)(a1 + 240) = 0;
  }
  v7 = *(const void **)(a1 + 248);
  if (v7)
  {
    _Block_release(v7);
    *(_QWORD *)(a1 + 248) = 0;
  }
}

uint64_t _mdns_dns_service_manager_cancel_resolver_config_updates()
{
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  return nw_resolver_config_cancel_updates();
}

uint64_t ___mdns_dns_service_manager_terminate_service_block_invoke(uint64_t a1)
{
  _mdns_dns_service_manager_terminate_service(*(_QWORD *)(a1 + 32));
  return 1;
}

void ___mdns_dns_service_manager_cancel_resolver_config_updates_block_invoke(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
  nw_release(*(void **)(a1 + 40));
}

void _mdns_dns_service_forget_all_ddr_queriers(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;

  v2 = *(_QWORD *)(a1 + 184);
  if (v2)
  {
    mdns_client_invalidate(v2);
    os_release(*(void **)(a1 + 184));
    *(_QWORD *)(a1 + 184) = 0;
  }
  v3 = *(const __CFArray **)(a1 + 192);
  if (v3)
  {
    mdns_cfarray_enumerate(v3, (uint64_t)&__block_literal_global_125);
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 192));
  }
}

uint64_t ___mdns_dns_service_forget_all_ddr_connections_block_invoke(int a1, int a2, nw_connection_t connection)
{
  nw_connection_cancel(connection);
  return 1;
}

uint64_t ___mdns_dns_service_forget_all_ddr_queriers_block_invoke(uint64_t a1, uint64_t a2)
{
  mdns_client_invalidate(a2);
  return 1;
}

dispatch_queue_t ___mdns_dns_service_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.dns-service-queue", 0);
  _mdns_dns_service_queue_s_queue = (uint64_t)result;
  return result;
}

uint64_t mdns_dns_service_manager_register_native_service(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __mdns_dns_service_manager_register_native_service_block_invoke;
  v8[3] = &unk_24F284878;
  v8[4] = &v9;
  v8[5] = &v13;
  v8[6] = a1;
  v8[7] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  if (a3)
    *a3 = *((_DWORD *)v14 + 6);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

void __mdns_dns_service_manager_register_native_service_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  __int16 v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  __int128 buf;
  BOOL (*v28)(uint64_t, void *);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = a1[6];
  if (*(_BYTE *)(v2 + 131))
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -6752;
    return;
  }
  v3 = *(__CFArray **)(v2 + 24);
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[5] + 8);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2000000000;
  v26 = 0;
  v6 = *(_DWORD *)(v4 + 48);
  v7 = *(unsigned __int8 *)(v4 + 52);
  if (*(_BYTE *)(v4 + 52))
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8 || v7 > 2)
  {
    v10 = 0;
    v11 = -6705;
LABEL_25:
    *((_DWORD *)v24 + 6) = v11;
    goto LABEL_26;
  }
  v12 = _mdns_dns_service_create(1, 1, (0x50201u >> (8 * v7)) & 7, &v26);
  v10 = v12;
  if (v12)
  {
    v13 = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 0x40000000;
    v28 = ___mdns_dns_service_create_native_source_service_from_definition_block_invoke;
    v29 = &unk_24F284BE8;
    v30 = &v23;
    v31 = v12;
    mdns_cfarray_enumerate(*(const __CFArray **)(v4 + 24), (uint64_t)&buf);
    v14 = *((_DWORD *)v24 + 6);
    if (v14)
      goto LABEL_40;
    v22[0] = v13;
    v22[1] = 0x40000000;
    v22[2] = ___mdns_dns_service_create_native_source_service_from_definition_block_invoke_2;
    v22[3] = &unk_24F284C10;
    v22[4] = &v23;
    v22[5] = v10;
    mdns_cfset_enumerate(*(const __CFSet **)(v4 + 32), (uint64_t)v22);
    v14 = *((_DWORD *)v24 + 6);
    if (v14)
    {
LABEL_40:
      os_release((void *)v10);
      _Block_object_dispose(&v23, 8);
      v19 = 0;
      *(_DWORD *)(v5 + 24) = v14;
      goto LABEL_35;
    }
    *(_DWORD *)(v10 + 256) = v6;
    if (v6)
      *(_QWORD *)(v10 + 104) = mdns_system_interface_index_to_name(v6);
    *(_WORD *)(v10 + 276) = 6;
    v15 = *(unsigned __int8 *)(v4 + 53);
    if (*(_BYTE *)(v4 + 53))
      v16 = 8198;
    else
      v16 = 6;
    *(_WORD *)(v10 + 276) = v16;
    if (*(_BYTE *)(v4 + 54))
    {
      v11 = 0;
      if (v15)
        v17 = 24582;
      else
        v17 = 16390;
      *(_WORD *)(v10 + 276) = v17;
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_25;
  }
  v11 = *((_DWORD *)v24 + 6);
LABEL_26:
  _Block_object_dispose(&v23, 8);
  if (!v11)
  {
    _mdns_dns_service_increment_use_count(v10);
    CFArrayAppendValue(v3, (const void *)v10);
    _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v2, v10);
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v20 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_22983F000, v20, OS_LOG_TYPE_DEFAULT, "Registered native service -- %@", (uint8_t *)&buf, 0xCu);
    }
    v18 = *(_QWORD *)(v10 + 24);
    *(_DWORD *)(v5 + 24) = 0;
    goto LABEL_34;
  }
  v18 = 0;
  v19 = 0;
  *(_DWORD *)(v5 + 24) = v11;
  if (v10)
  {
LABEL_34:
    os_release((void *)v10);
    v19 = v18;
  }
LABEL_35:
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v19;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v21 = *(NSObject **)(a1[6] + 96);
    if (v21)
      dispatch_source_merge_data(v21, 1uLL);
  }
}

uint64_t _mdns_dns_service_create(char a1, char a2, char a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void (*v11)(uint64_t);
  unint64_t v12;
  int v13;

  v8 = _os_object_alloc();
  v9 = v8;
  if (!v8)
  {
    v13 = -6728;
    if (!a4)
      return v9;
    goto LABEL_8;
  }
  v10 = &_mdns_dns_service_kind;
  *(_QWORD *)(v8 + 16) = &_mdns_dns_service_kind;
  do
  {
    v11 = (void (*)(uint64_t))v10[2];
    if (v11)
      v11(v9);
    v10 = (_UNKNOWN **)*v10;
  }
  while (v10);
  do
    v12 = __ldxr(&_mdns_get_next_dns_service_id_s_next_id);
  while (__stxr(v12 + 1, &_mdns_get_next_dns_service_id_s_next_id));
  v13 = 0;
  *(_QWORD *)(v9 + 24) = v12;
  *(_BYTE *)(v9 + 281) = a1;
  *(_BYTE *)(v9 + 282) = a2;
  *(_BYTE *)(v9 + 280) = a3;
  if (a4)
LABEL_8:
    *a4 = v13;
  return v9;
}

BOOL ___mdns_dns_service_create_native_source_service_from_definition_block_invoke(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _mdns_dns_service_append_address(*(_QWORD *)(a1 + 40), a2);
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_service_create_native_source_service_from_definition_block_invoke_2(uint64_t a1, void *a2)
{
  _mdns_dns_service_add_domain(*(_QWORD *)(a1 + 40), a2, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _mdns_dns_service_increment_use_count(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 264);
  v3 = *(NSObject **)(a1 + 224);
  if (v2 == 1)
  {
    if (!v3)
    {
      v2 = 1;
      goto LABEL_7;
    }
    *(_DWORD *)(a1 + 264) = 0;
    goto LABEL_5;
  }
  if (v3)
  {
LABEL_5:
    dispatch_source_cancel(v3);
    dispatch_release(v3);
    *(_QWORD *)(a1 + 224) = 0;
    v2 = *(_DWORD *)(a1 + 264);
  }
LABEL_7:
  result = (v2 + 1);
  *(_DWORD *)(a1 + 264) = result;
  return result;
}

void _mdns_dns_service_manager_update_interface_properties_for_service(CFArrayRef *a1, uint64_t a2)
{
  unsigned int v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  _DWORD *ValueAtIndex;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  NSObject *v15;
  const char *v16;
  int v17;
  _QWORD v18[6];
  _BYTE buf[24];
  void *v20;
  CFArrayRef *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a2 + 256);
  Count = CFArrayGetCount(a1[10]);
  if (Count >= 1)
  {
    v6 = Count;
    v7 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1[10], v7);
      if (ValueAtIndex[34] == v4)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
    v10 = (uint64_t)ValueAtIndex;
    goto LABEL_14;
  }
LABEL_5:
  v9 = mdns_interface_monitor_create(v4);
  if (v9)
  {
    v10 = v9;
    if (_mdns_dns_service_queue_s_once != -1)
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
    mdns_interface_monitor_set_queue(v10, (dispatch_object_t)_mdns_dns_service_queue_s_queue);
    os_retain(a1);
    v11 = MEMORY[0x24BDAC760];
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___mdns_dns_service_manager_get_interface_monitor_block_invoke;
    v20 = &__block_descriptor_tmp_55;
    v21 = a1;
    v22 = v10;
    mdns_interface_monitor_set_update_handler(v10, buf);
    v18[0] = v11;
    v18[1] = 0x40000000;
    v18[2] = ___mdns_dns_service_manager_get_interface_monitor_block_invoke_2;
    v18[3] = &__block_descriptor_tmp_57;
    v18[4] = v10;
    v18[5] = a1;
    mdns_interface_monitor_set_event_handler(v10, v18);
    if (!*(_BYTE *)(v10 + 154))
    {
      if (*(_QWORD *)(v10 + 32))
        _mdns_interface_monitor_activate_async((void *)v10);
      *(_BYTE *)(v10 + 154) = 1;
    }
    CFArrayAppendValue(a1[10], (const void *)v10);
LABEL_14:
    v12 = *(_WORD *)(a2 + 276) & 0xF80F;
    *(_WORD *)(a2 + 276) = v12;
    v13 = *(_DWORD *)(v10 + 144);
    v14 = v12 & 0xFF0F | (16 * (v13 & 0xF));
    if ((v13 & 0xF) != 0)
      *(_WORD *)(a2 + 276) = v14;
    if (*(_BYTE *)(a2 + 282) == 2 && *(_DWORD *)(a2 + 256) && (v13 & 0x10) != 0)
    {
      v14 |= 0x100u;
      *(_WORD *)(a2 + 276) = v14;
    }
    if ((v13 & 0x60) != 0)
      *(_WORD *)(a2 + 276) = (16 * v13) & 0x600 | v14;
    return;
  }
  if (_mdns_dns_service_log_s_once != -1)
    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
  v15 = _mdns_dns_service_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v16 = *(const char **)(a2 + 104);
    if (!v16)
      v16 = "";
    v17 = *(_DWORD *)(a2 + 256);
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v17;
    _os_log_error_impl(&dword_22983F000, v15, OS_LOG_TYPE_ERROR, "Failed to get interface monitor for interface %{public}s/%u", buf, 0x12u);
  }
}

os_log_t ___mdns_dns_service_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "dns_service");
  _mdns_dns_service_log_s_log = (uint64_t)result;
  return result;
}

void ___mdns_dns_service_manager_get_interface_monitor_block_invoke(uint64_t a1, char a2)
{
  _DWORD *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const __CFArray *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  NSObject *v11;
  _QWORD v12[4];
  int v13;
  uint8_t buf[8];
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  CFRange v20;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_DWORD **)(a1 + 40);
    v20.length = CFArrayGetCount(*(CFArrayRef *)(v4 + 80));
    v20.location = 0;
    if (CFArrayContainsValue(*(CFArrayRef *)(v4 + 80), v20, v3))
    {
      if (a2 < 0)
      {
        v5 = v3[34];
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v6 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v5;
          _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_INFO, "Network change event for interface index %u", buf, 8u);
        }
        v7 = MEMORY[0x24BDAC760];
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 0x40000000;
        v12[2] = ___mdns_dns_service_manager_handle_network_change_event_block_invoke;
        v12[3] = &__block_descriptor_tmp_58;
        v13 = v5;
        v8 = *(const __CFArray **)(v4 + 40);
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        v15 = 0x40000000;
        v16 = ___mdns_dns_service_manager_enumerate_service_array_including_variants_block_invoke;
        v17 = &unk_24F284CB8;
        v18 = v12;
        mdns_cfarray_enumerate(v8, (uint64_t)buf);
        v9 = *(const __CFArray **)(v4 + 56);
        *(_QWORD *)buf = v7;
        v15 = 0x40000000;
        v16 = ___mdns_dns_service_manager_enumerate_service_array_including_variants_block_invoke;
        v17 = &unk_24F284CB8;
        v18 = v12;
        mdns_cfarray_enumerate(v9, (uint64_t)buf);
        v10 = *(const __CFArray **)(v4 + 48);
        *(_QWORD *)buf = v7;
        v15 = 0x40000000;
        v16 = ___mdns_dns_service_manager_handle_network_change_event_block_invoke_2;
        v17 = &__block_descriptor_tmp_59;
        LODWORD(v18) = v5;
        mdns_cfarray_enumerate(v10, (uint64_t)buf);
      }
      v11 = *(NSObject **)(v4 + 96);
      if (v11)
        dispatch_source_merge_data(v11, 1uLL);
    }
  }
}

void ___mdns_dns_service_manager_get_interface_monitor_block_invoke_2(uint64_t a1, int a2)
{
  CFIndex FirstIndexOfValue;
  CFRange v4;

  if (a2 == 1)
  {
    v4.length = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 80));
    v4.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 80), v4, *(const void **)(a1 + 32));
    if ((FirstIndexOfValue & 0x8000000000000000) == 0)
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 40) + 80), FirstIndexOfValue);
    mdns_interface_monitor_invalidate(*(void **)(a1 + 32));
  }
  else if (a2 == 2)
  {
    os_release(*(void **)(a1 + 32));
    os_release(*(void **)(a1 + 40));
  }
}

uint64_t ___mdns_dns_service_manager_handle_network_change_event_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 256) == *(_DWORD *)(a1 + 32))
    *(_BYTE *)(a2 + 286) = 1;
  return 1;
}

uint64_t ___mdns_dns_service_manager_enumerate_service_array_including_variants_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const __CFArray *v5;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    v5 = *(const __CFArray **)(a2 + 128);
    return !v5 || mdns_cfarray_enumerate(v5, *(_QWORD *)(a1 + 32));
  }
  return result;
}

uint64_t ___mdns_dns_service_manager_handle_network_change_event_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 256) == *(_DWORD *)(a1 + 32))
    *(_DWORD *)(a2 + 264) = 0;
  return 1;
}

void _mdns_dns_service_add_domain(uint64_t a1, void *a2, unsigned int a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int v10;

  v6 = malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (v6)
  {
    v7 = (uint64_t)v6;
    v6[1] = a2;
    os_retain(a2);
    *(_DWORD *)(v7 + 16) = a3;
    v8 = a1 + 88;
    do
    {
      v9 = (_QWORD *)v8;
      v8 = *(_QWORD *)v8;
      if (!v8)
        goto LABEL_6;
      v10 = _domain_item_compare(v7, v8, 1);
    }
    while (v10 > 0);
    if (v10)
    {
LABEL_6:
      *(_QWORD *)v7 = v8;
      *v9 = v7;
      return;
    }
    if (*(_DWORD *)(v8 + 16) > a3)
      *(_DWORD *)(v8 + 16) = a3;
    _domain_item_free((_QWORD *)v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t _mdns_dns_service_append_address(uint64_t a1, void *value)
{
  __CFArray *Mutable;

  Mutable = *(__CFArray **)(a1 + 80);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
    *(_QWORD *)(a1 + 80) = Mutable;
    if (!Mutable)
      return 4294960567;
  }
  CFArrayAppendValue(Mutable, value);
  return 0;
}

void mdns_dns_service_manager_deregister_native_service(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (a2)
  {
    if (_mdns_dns_service_queue_s_once != -1)
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = __mdns_dns_service_manager_deregister_native_service_block_invoke;
    v4[3] = &__block_descriptor_tmp_8_147;
    v4[4] = a1;
    v4[5] = a2;
    dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
  }
}

void __mdns_dns_service_manager_deregister_native_service_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t service_by_id;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 131))
  {
    service_by_id = _mdns_dns_service_manager_get_service_by_id(*(const __CFArray **)(v1 + 24), *(_QWORD *)(a1 + 40));
    if (service_by_id)
      _mdns_dns_service_manager_deregister_service(v1, service_by_id);
  }
}

uint64_t _mdns_dns_service_manager_get_service_by_id(const __CFArray *a1, uint64_t a2)
{
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
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dns_service_manager_get_service_by_id_block_invoke;
  v4[3] = &unk_24F2850C8;
  v4[4] = &v5;
  v4[5] = a2;
  mdns_cfarray_enumerate(a1, (uint64_t)v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void _mdns_dns_service_manager_deregister_service(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v5;
  NSObject *oneshot_monotonic_timer;
  int v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a2 + 264) - 1;
  *(_DWORD *)(a2 + 264) = v2;
  if (!v2)
  {
    v5 = *(_DWORD *)(a2 + 272);
    if (!v5)
      goto LABEL_13;
    if (_mdns_dns_service_queue_s_once != -1)
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
    oneshot_monotonic_timer = mdns_dispatch_create_oneshot_monotonic_timer(v5, 5u, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
    *(_QWORD *)(a2 + 224) = oneshot_monotonic_timer;
    v7 = *(_DWORD *)(a2 + 264);
    if (oneshot_monotonic_timer)
    {
      *(_DWORD *)(a2 + 264) = v7 + 1;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 0x40000000;
      v14[2] = ___mdns_dns_service_decrement_use_count_block_invoke;
      v14[3] = &__block_descriptor_tmp_72;
      v14[4] = a2;
      v14[5] = a1;
      dispatch_source_set_event_handler(oneshot_monotonic_timer, v14);
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v8 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a2 + 24);
        v10 = *(_DWORD *)(a2 + 272);
        *(_DWORD *)buf = 134218240;
        v16 = v9;
        v17 = 1024;
        v18 = v10;
        _os_log_impl(&dword_22983F000, v8, OS_LOG_TYPE_INFO, "Keeping orphaned DNS service %llu for up to %u milliseconds", buf, 0x12u);
      }
      dispatch_activate(*(dispatch_object_t *)(a2 + 224));
      v7 = *(_DWORD *)(a2 + 264);
    }
    if (!v7)
    {
LABEL_13:
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v11 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a2 + 24);
        *(_DWORD *)buf = 134217984;
        v16 = v12;
        _os_log_impl(&dword_22983F000, v11, OS_LOG_TYPE_INFO, "Deregistered DNS service -- service id: %llu", buf, 0xCu);
      }
      v13 = *(NSObject **)(a1 + 96);
      if (v13)
        dispatch_source_merge_data(v13, 1uLL);
    }
  }
}

void ___mdns_dns_service_decrement_use_count_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 224))
  {
    _mdns_dns_service_clear_use_count(v2);
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v3 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v6 = 134217984;
      v7 = v4;
      _os_log_impl(&dword_22983F000, v3, OS_LOG_TYPE_INFO, "Deregistered orphaned DNS service due to timeout -- service id: %llu", (uint8_t *)&v6, 0xCu);
    }
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 96);
    if (v5)
      dispatch_source_merge_data(v5, 1uLL);
  }
}

BOOL ___mdns_dns_service_manager_get_service_by_id_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 24) == *(_QWORD *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

void mdns_dns_service_manager_apply_dns_config(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __mdns_dns_service_manager_apply_dns_config_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_150;
  v4[4] = a1;
  v4[5] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
}

void __mdns_dns_service_manager_apply_dns_config_block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  CFIndex Count;
  const __CFAllocator *v4;
  CFIndex v5;
  NSObject *v6;
  __CFArray *Mutable;
  __CFArray *MutableCopy;
  unint64_t i;
  const void *ValueAtIndex;
  const void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  int appended;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  uint64_t v18;
  const __CFArray **v19;
  CFIndex FirstIndexOfValue;
  CFIndex v21;
  __int16 v22;
  const __CFArray *v23;
  const void *v24;
  uint64_t v25;
  int v26;
  _QWORD v27[4];
  __int16 v28;
  uint8_t buf[8];
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void *v32;
  uint64_t v33;
  uint64_t v34;
  CFRange v35;
  CFRange v36;

  v34 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 131))
    return;
  v2 = *(unsigned int **)(a1 + 40);
  Count = CFArrayGetCount(*(CFArrayRef *)(v1 + 48));
  if (Count > 3)
  {
    v5 = Count;
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v6 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_DEFAULT, "Purging %u discovered services down to 4", buf, 8u);
    }
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
    MutableCopy = CFArrayCreateMutableCopy(v4, 0, *(CFArrayRef *)(v1 + 48));
    v35.location = 0;
    v35.length = v5;
    CFArraySortValues(MutableCopy, v35, (CFComparatorFunction)_mdns_dns_service_compare_time, 0);
    for (i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, i);
      if (i < 4)
        CFArrayAppendValue(Mutable, ValueAtIndex);
      else
        _mdns_dns_service_manager_terminate_service(v1, (uint64_t)ValueAtIndex);
    }
    if (MutableCopy)
      CFRelease(MutableCopy);
    v11 = *(const void **)(v1 + 48);
    if (v11)
      CFRelease(v11);
    *(_QWORD *)(v1 + 48) = Mutable;
  }
  else
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  }
  v12 = CFArrayCreateMutable(v4, 0, &mdns_cfarray_callbacks);
  if (!v12)
  {
    v26 = -6729;
    goto LABEL_36;
  }
  v13 = v12;
  appended = _mdns_append_dns_service_from_config_by_scope(v12, v2, 1);
  if (appended
    || (appended = _mdns_append_dns_service_from_config_by_scope(v13, v2, 2)) != 0
    || (appended = _mdns_append_dns_service_from_config_by_scope(v13, v2, 3)) != 0)
  {
    v26 = appended;
    CFRelease(v13);
LABEL_36:
    _mdns_dns_service_manager_terminate(v1, v26);
    return;
  }
  v15 = CFArrayGetCount(v13);
  v16 = CFArrayGetCount(*(CFArrayRef *)(v1 + 32));
  if (v16 - 1 >= 0)
  {
    v17 = v16;
    v18 = MEMORY[0x24BDAC760];
    do
    {
      v19 = (const __CFArray **)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 32), --v17);
      v36.location = 0;
      v36.length = v15;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v13, v36, v19);
      if (FirstIndexOfValue < 0)
      {
        _mdns_dns_service_manager_terminate_service(v1, (uint64_t)v19);
      }
      else
      {
        v21 = FirstIndexOfValue;
        v22 = *((_WORD *)CFArrayGetValueAtIndex(v13, FirstIndexOfValue) + 138) & 0xE;
        *((_WORD *)v19 + 138) = *((_WORD *)v19 + 138) & 0xFFF1 | v22;
        v27[0] = v18;
        v27[1] = 0x40000000;
        v27[2] = ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke;
        v27[3] = &__block_descriptor_tmp_65;
        v28 = v22;
        v23 = v19[18];
        if (v23)
          mdns_cfarray_enumerate(v23, (uint64_t)v27);
        CFArraySetValueAtIndex(v13, v21, v19);
      }
    }
    while (v17 > 0);
  }
  v24 = *(const void **)(v1 + 32);
  if (v24)
    CFRelease(v24);
  v25 = MEMORY[0x24BDAC760];
  *(_QWORD *)(v1 + 32) = v13;
  *(_QWORD *)buf = v25;
  v30 = 0x40000000;
  v31 = ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke_2;
  v32 = &__block_descriptor_tmp_66;
  v33 = v1;
  mdns_cfarray_enumerate(v13, (uint64_t)buf);
  _mdns_dns_service_manager_remove_unneeded_interface_monitors(v1);
}

uint64_t _mdns_dns_service_compare_time(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL8 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a2 + 32);
  v4 = v2 > v3;
  v5 = v2 < v3;
  if (v4)
    return -1;
  else
    return v5;
}

uint64_t _mdns_append_dns_service_from_config_by_scope(const __CFArray *a1, unsigned int *a2, int a3)
{
  char v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  unsigned int v16;
  __int16 v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  int *v23;
  uint8_t *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  char *v32;
  CFIndex Count;
  CFIndex v34;
  CFIndex v35;
  const void *ValueAtIndex;
  int v37;
  unsigned int v38;
  char *v39;
  uint64_t v40;
  uint64_t v42;
  unsigned int appended;
  uint8_t v44[16];
  uint64_t v45;
  int v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v3 = a3;
  v55 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 3:
      v5 = (uint64_t *)(a2 + 9);
      a2 += 8;
      break;
    case 2:
      v5 = (uint64_t *)(a2 + 4);
      a2 += 3;
      break;
    case 1:
      v5 = (uint64_t *)(a2 + 1);
      break;
    default:
      return 0;
  }
  v6 = *a2;
  if ((int)v6 < 1)
    return 0;
  v7 = 0;
  v8 = *v5;
  appended = 0;
  v42 = v8;
  v40 = v6;
  while (1)
  {
    v9 = *(_QWORD *)(v8 + 8 * v7);
    if (*(_WORD *)(v9 + 20) == 5353 || !*(_DWORD *)(v9 + 8))
      goto LABEL_64;
    v10 = *(char **)v9;
    if (*(_QWORD *)v9)
    {
      buf[0] = 0;
      if (DomainNameAppendString(buf, v10, 0))
      {
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v11 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v39 = *(char **)v9;
          *(_DWORD *)v44 = 136315138;
          *(_QWORD *)&v44[4] = v39;
          _os_log_error_impl(&dword_22983F000, v11, OS_LOG_TYPE_ERROR, "Encountered invalid dns_config_t resolver domain name: %s", v44, 0xCu);
        }
        v8 = v42;
        goto LABEL_64;
      }
    }
    v12 = _mdns_dns_service_create(1, 2, v3, (int *)&appended);
    result = appended;
    if (appended)
      goto LABEL_68;
    v14 = *(_DWORD *)(v9 + 8);
    if (v14 >= 1)
      break;
LABEL_40:
    *(_DWORD *)(v12 + 256) = *(_DWORD *)(v9 + 64);
    v3 = a3;
    if (a3 == 3)
      v31 = *(_DWORD *)(v9 + 76);
    else
      v31 = 0;
    v6 = v40;
    v8 = v42;
    *(_DWORD *)(v12 + 260) = v31;
    *(_WORD *)(v12 + 276) = 0;
    if (*(_QWORD *)v9)
      v32 = *(char **)v9;
    else
      v32 = ".";
    Count = CFArrayGetCount(a1);
    if (Count < 1)
    {
LABEL_51:
      v37 = *(_DWORD *)(v9 + 68);
      if ((v37 & 2) != 0)
        *(_WORD *)(v12 + 276) |= 2u;
      if ((v37 & 4) != 0)
        *(_WORD *)(v12 + 276) |= 4u;
      if ((*(_BYTE *)(v9 + 74) & 4) != 0)
        *(_WORD *)(v12 + 276) |= 8u;
      v38 = *(_DWORD *)(v12 + 256);
      if (v38)
        *(_QWORD *)(v12 + 104) = mdns_system_interface_index_to_name(v38);
      appended = _mdns_dns_service_add_domain_by_string(v12, v32, *(_DWORD *)(v9 + 60));
      if (appended)
        goto LABEL_69;
      CFArrayAppendValue(a1, (const void *)v12);
    }
    else
    {
      v34 = Count;
      v35 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1, v35);
        if (_mdns_dns_service_equal_ex((uint64_t)ValueAtIndex, v12, 1))
          break;
        if (v34 == ++v35)
        {
          v3 = a3;
          v6 = v40;
          v8 = v42;
          if (!v12)
            goto LABEL_64;
          goto LABEL_51;
        }
      }
      result = _mdns_dns_service_add_domain_by_string((uint64_t)ValueAtIndex, v32, *(_DWORD *)(v9 + 60));
      appended = result;
      if ((_DWORD)result)
        goto LABEL_68;
      v3 = a3;
      v6 = v40;
      v8 = v42;
      if (!v12)
        goto LABEL_64;
    }
    os_release((void *)v12);
LABEL_64:
    if (++v7 == v6)
      return 0;
  }
  v15 = 0;
  v16 = *(unsigned __int16 *)(v9 + 20);
  if (!*(_WORD *)(v9 + 20))
    v16 = 53;
  v17 = __rev16(v16);
  while (1)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(v9 + 12) + 8 * v15);
    v19 = *(unsigned __int8 *)(v18 + 1);
    if (v19 == 30)
      break;
    if (v19 == 2)
    {
      v20 = *(_DWORD *)(v18 + 4);
      v21 = _mdns_address_new();
      if (!v21)
        goto LABEL_67;
      v22 = (void *)v21;
      *(_WORD *)(v21 + 24) = 528;
      *(_WORD *)(v21 + 26) = v17;
      *(_DWORD *)(v21 + 28) = v20;
      goto LABEL_37;
    }
LABEL_39:
    if (++v15 >= v14)
      goto LABEL_40;
  }
  v23 = (int *)(v18 + 24);
  v24 = (uint8_t *)(v18 + 8);
  memset(v44, 0, sizeof(v44));
  v46 = 0;
  v45 = 0;
  if (*(unsigned __int8 *)(v18 + 8) == 254 && (*(_BYTE *)(v18 + 9) & 0xC0) == 0x80)
  {
    v25 = *(_DWORD *)(v9 + 64);
    if (v25)
    {
      if (*v23 != v25)
      {
        *(_OWORD *)v44 = *(_OWORD *)v18;
        v45 = *(_QWORD *)(v18 + 16);
        v46 = v25;
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v26 = _mdns_dns_service_log_s_log;
        v27 = os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT);
        v24 = &v44[8];
        v23 = &v46;
        if (v27)
        {
          v28 = *(_DWORD *)(v18 + 24);
          *(_DWORD *)buf = 68158466;
          v48 = 28;
          v49 = 2096;
          v50 = v18;
          v51 = 1024;
          v52 = v28;
          v53 = 1024;
          v54 = v25;
          _os_log_impl(&dword_22983F000, v26, OS_LOG_TYPE_DEFAULT, "Corrected scope ID of link-local server address %{network:sockaddr}.*P from %u to %u", buf, 0x1Eu);
          v24 = &v44[8];
          v23 = &v46;
        }
      }
    }
  }
  v29 = *v23;
  v30 = _mdns_address_new();
  if (v30)
  {
    v22 = (void *)v30;
    *(_WORD *)(v30 + 24) = 7708;
    *(_WORD *)(v30 + 26) = v17;
    *(_OWORD *)(v30 + 32) = *(_OWORD *)v24;
    *(_DWORD *)(v30 + 48) = v29;
LABEL_37:
    appended = _mdns_dns_service_append_address(v12, v22);
    os_release(v22);
    result = appended;
    if (appended)
      goto LABEL_68;
    v14 = *(_DWORD *)(v9 + 8);
    goto LABEL_39;
  }
LABEL_67:
  result = 4294960568;
  appended = -6728;
LABEL_68:
  if (v12)
  {
LABEL_69:
    os_release((void *)v12);
    return appended;
  }
  return result;
}

uint64_t ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke(uint64_t a1, uint64_t a2)
{
  __int16 v2;

  v2 = *(_WORD *)(a2 + 276) & 0xFFF1;
  *(_WORD *)(a2 + 276) = v2;
  *(_WORD *)(a2 + 276) = *(_WORD *)(a1 + 32) | v2;
  return 1;
}

uint64_t ___mdns_dns_service_manager_apply_dns_config_internal_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 264))
  {
    _mdns_dns_service_increment_use_count(a2);
    _mdns_dns_service_manager_update_interface_properties_for_service(*(CFArrayRef **)(a1 + 32), a2);
  }
  return 1;
}

void _mdns_dns_service_manager_remove_unneeded_interface_monitors(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  uint64_t v4;
  _DWORD *ValueAtIndex;
  int v6;
  _QWORD v7[4];
  int v8;
  _QWORD v9[5];
  _QWORD v10[5];

  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
  if (Count - 1 >= 0)
  {
    v3 = Count;
    v4 = MEMORY[0x24BDAC760];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), --v3);
      v6 = ValueAtIndex[34];
      v7[0] = v4;
      v7[1] = 0x40000000;
      v7[2] = ___mdns_dns_service_manager_uses_interface_block_invoke;
      v7[3] = &__block_descriptor_tmp_118;
      v8 = v6;
      v9[0] = v4;
      v9[1] = 0x40000000;
      v9[2] = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
      v9[3] = &unk_24F2856A8;
      v9[4] = v7;
      v10[0] = v4;
      v10[1] = 0x40000000;
      v10[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
      v10[3] = &unk_24F285680;
      v10[4] = v9;
      if (_mdns_dns_service_manager_enumerate_all_service_array_pointers(a1, (uint64_t)v10))
      {
        mdns_interface_monitor_invalidate(ValueAtIndex);
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v3);
      }
    }
    while (v3 > 0);
  }
}

BOOL ___mdns_dns_service_manager_uses_interface_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a2 + 256) != *(_DWORD *)(a1 + 32);
}

uint64_t _mdns_dns_service_add_domain_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  _QWORD *v5;
  void *v6;
  unsigned int v8;

  v8 = 0;
  v5 = mdns_domain_name_create(a2, (uint64_t)a2, &v8);
  if (v5)
  {
    v6 = v5;
    _mdns_dns_service_add_domain(a1, v5, a3);
    v8 = 0;
    os_release(v6);
  }
  return v8;
}

void mdns_dns_service_manager_register_path_resolver(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __mdns_dns_service_manager_register_path_resolver_block_invoke;
  v4[3] = &__block_descriptor_tmp_13;
  v4[4] = a1;
  v4[5] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
}

void __mdns_dns_service_manager_register_path_resolver_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const unsigned __int8 *v2;
  uint64_t service_by_uuid;
  void *v4;
  char *v5;
  char *v6;
  __CFArray *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[32];
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 131))
  {
    v2 = *(const unsigned __int8 **)(a1 + 40);
    service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v1 + 40), v2);
    if (service_by_uuid)
    {
      v10 = service_by_uuid;
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v11 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(v10 + 24);
        *(_DWORD *)v20 = 134218498;
        *(_QWORD *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 1040;
        *(_DWORD *)&v20[14] = 16;
        *(_WORD *)&v20[18] = 2096;
        *(_QWORD *)&v20[20] = v2;
        _os_log_debug_impl(&dword_22983F000, v11, OS_LOG_TYPE_DEBUG, "Already registered service -- service id: %llu, uuid: %{uuid_t}.16P", v20, 0x1Cu);
      }
    }
    else
    {
      v4 = (void *)nw_resolver_config_create();
      nw_resolver_config_set_identifier();
      os_retain((void *)v1);
      nw_retain(v4);
      if (_mdns_dns_service_queue_s_once != -1)
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
      *(_QWORD *)v20 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v20[8] = 0x40000000;
      *(_QWORD *)&v20[16] = ___mdns_dns_service_manager_register_path_resolver_internal_block_invoke;
      *(_QWORD *)&v20[24] = &__block_descriptor_tmp_69;
      v21 = v1;
      v22 = v4;
      nw_resolver_config_watch_updates();
      v13 = 0;
      v5 = _mdns_dns_service_create_from_resolver_config(v4, 3, 4, &v13);
      if (v5)
      {
        v6 = v5;
        v5[284] = 1;
        v7 = *(__CFArray **)(v1 + 40);
        _mdns_dns_service_increment_use_count((uint64_t)v5);
        CFArrayAppendValue(v7, v6);
        _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v1, (uint64_t)v6);
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v8 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v15 = v6;
          _os_log_impl(&dword_22983F000, v8, OS_LOG_TYPE_DEFAULT, "Registered service -- %@", buf, 0xCu);
        }
        os_release(v6);
      }
      else
      {
        _mdns_dns_service_manager_cancel_resolver_config_updates();
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v9 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158466;
          *(_DWORD *)v15 = 16;
          *(_WORD *)&v15[4] = 2096;
          *(_QWORD *)&v15[6] = v2;
          v16 = 2112;
          v17 = v4;
          v18 = 2048;
          v19 = v13;
          _os_log_error_impl(&dword_22983F000, v9, OS_LOG_TYPE_ERROR, "Failed to register service -- uuid: %{uuid_t}.16P, config: %@, error: %{mdns:err}ld", buf, 0x26u);
        }
      }
      nw_release(v4);
    }
  }
}

uint64_t _mdns_dns_service_manager_get_service_by_uuid(const __CFArray *a1, const unsigned __int8 *a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  __int128 v10;
  int v11;
  uuid_t dst;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v13 = 3;
  memset(dst, 0, sizeof(dst));
  uuid_copy(dst, a2);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___mdns_dns_service_manager_get_service_by_uuid_block_invoke;
  v9[3] = &unk_24F284D60;
  v10 = *(_OWORD *)dst;
  v11 = v13;
  v9[4] = &v5;
  mdns_cfarray_enumerate(a1, (uint64_t)v9);
  v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

void ___mdns_dns_service_manager_register_path_resolver_internal_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t path_service_by_config;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t provider_name;
  uint64_t provider_path;
  uint64_t odoh_config;
  void *v12;
  uint64_t v13;
  void (*v14)(void);
  NSObject *v15;
  const __CFArray *v16;
  const char *string_ptr;
  const char *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  __int128 buf;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    path_service_by_config = _mdns_dns_service_manager_get_path_service_by_config(*(const __CFArray **)(v2 + 40), v3);
    if (path_service_by_config)
    {
      v5 = path_service_by_config;
      _mdns_dns_service_manager_deregister_service(v2, path_service_by_config);
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v6 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_DEFAULT, "Deregistered service -- %@", (uint8_t *)&buf, 0xCu);
      }
    }
    return;
  }
  if (v3)
  {
    if (nw_resolver_config_get_protocol() == 3)
    {
      v7 = _mdns_dns_service_manager_get_path_service_by_config(*(const __CFArray **)(v2 + 40), v3);
      if (v7)
      {
        v8 = v7;
        provider_name = nw_resolver_config_get_provider_name();
        provider_path = nw_resolver_config_get_provider_path();
        odoh_config = nw_resolver_config_get_odoh_config();
        v12 = (void *)nw_resolver_config_copy_proxy_config();
        if (v12)
          nw_proxy_config_set_prohibit_direct();
        v13 = *(_QWORD *)(v8 + 64);
        if (v13)
        {
          v14 = *(void (**)(void))(*(_QWORD *)(v13 + 16) + 96);
          if (v14)
            v14();
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v15 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v8;
            _os_log_impl(&dword_22983F000, v15, OS_LOG_TYPE_DEFAULT, "Updated ODoH config -- %@", (uint8_t *)&buf, 0xCu);
          }
        }
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 0x40000000;
        v23 = ___mdns_dns_service_manager_handle_resolver_config_update_block_invoke;
        v24 = &__block_descriptor_tmp_73;
        v25 = provider_name;
        v26 = provider_path;
        v27 = odoh_config;
        v28 = 0;
        v29 = v12;
        v16 = *(const __CFArray **)(v8 + 128);
        if (v16)
          mdns_cfarray_enumerate(v16, (uint64_t)&buf);
        if (v12)
          nw_release(v12);
        if (*(_QWORD *)(v8 + 96) && !*(_QWORD *)(v8 + 136))
        {
          if (*(_QWORD *)(v8 + 160))
          {
            string_ptr = xpc_string_get_string_ptr(*(xpc_object_t *)(v8 + 160));
            v18 = (const char *)nw_resolver_config_get_provider_name();
            if (string_ptr)
            {
              if (v18 && !strcmp(string_ptr, v18))
              {
LABEL_33:
                v19 = *(const char **)(v8 + 168);
                v20 = (const char *)nw_resolver_config_get_provider_path();
                if (v19)
                {
                  if (v20 && !strcmp(v19, v20))
                    return;
                }
                else if (!v20)
                {
                  return;
                }
              }
            }
            else if (!v18)
            {
              goto LABEL_33;
            }
          }
          else if (!nw_resolver_config_get_provider_name())
          {
            goto LABEL_33;
          }
          v21 = *(NSObject **)(v2 + 96);
          if (v21)
            dispatch_source_merge_data(v21, 1uLL);
        }
      }
    }
  }
}

char *_mdns_dns_service_create_from_resolver_config(void *a1, char a2, char a3, int *a4)
{
  unsigned int protocol;
  char v9;
  uint64_t v10;
  int v11;
  const char *interface_name;
  const char *v13;
  char *result;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = (int *)&v15;
  v17 = 0x2000000000;
  v18 = 0;
  protocol = nw_resolver_config_get_protocol();
  if (protocol < 4)
    v9 = protocol + 1;
  else
    v9 = 0;
  v10 = _mdns_dns_service_create(v9, a2, a3, v16 + 6);
  v11 = v16[6];
  if (!v11)
  {
    nw_resolver_config_enumerate_name_servers();
    v11 = v16[6];
    if (!v11)
    {
      nw_resolver_config_enumerate_match_domains();
      *(_QWORD *)(v10 + 96) = a1;
      nw_retain(a1);
      interface_name = (const char *)nw_resolver_config_get_interface_name();
      if (interface_name)
      {
        v13 = interface_name;
        result = strdup(interface_name);
        if (!result)
        {
          __break(1u);
          return result;
        }
        *(_QWORD *)(v10 + 104) = result;
        *(_DWORD *)(v10 + 256) = if_nametoindex(v13);
      }
      *(_WORD *)(v10 + 276) = 6;
      _mdns_dns_service_update_nw_config_data(v10);
      v11 = 0;
      v16[6] = 0;
    }
  }
  if (a4)
    *a4 = v11;
  _Block_object_dispose(&v15, 8);
  return (char *)v10;
}

BOOL ___mdns_dns_service_create_from_resolver_config_block_invoke(uint64_t a1, char *a2)
{
  void *v3;
  void *v4;
  _BOOL8 result;

  v3 = (void *)mdns_address_create_from_ip_address_string(a2);
  result = 1;
  if (v3)
  {
    v4 = v3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _mdns_dns_service_append_address(*(_QWORD *)(a1 + 40), v3);
    os_release(v4);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      return 0;
  }
  return result;
}

uint64_t ___mdns_dns_service_create_from_resolver_config_block_invoke_2(uint64_t a1, char *a2)
{
  _mdns_dns_service_add_domain_by_string(*(_QWORD *)(a1 + 32), a2, 0);
  return 1;
}

uint64_t _mdns_dns_service_update_nw_config_data(uint64_t a1)
{
  uint64_t result;
  const char *provider_name;
  void *v4;
  const char *string_ptr;
  void *v6;
  xpc_object_t v7;
  const char *v8;
  void *v9;
  void *v10;

  result = *(_QWORD *)(a1 + 96);
  if (result && !*(_QWORD *)(a1 + 136))
  {
    provider_name = (const char *)nw_resolver_config_get_provider_name();
    v4 = *(void **)(a1 + 160);
    if (v4)
    {
      string_ptr = xpc_string_get_string_ptr(v4);
      if (string_ptr)
      {
        if (!provider_name)
        {
          v10 = *(void **)(a1 + 160);
          if (!v10)
            goto LABEL_15;
          xpc_release(v10);
          v7 = 0;
LABEL_14:
          *(_QWORD *)(a1 + 160) = v7;
          goto LABEL_15;
        }
        if (!strcmp(string_ptr, provider_name))
          goto LABEL_15;
      }
      else if (!provider_name)
      {
        goto LABEL_15;
      }
      v6 = *(void **)(a1 + 160);
      if (v6)
      {
        xpc_release(v6);
        *(_QWORD *)(a1 + 160) = 0;
      }
    }
    else if (!provider_name)
    {
LABEL_15:
      result = nw_resolver_config_get_provider_path();
      v8 = (const char *)result;
      v9 = *(void **)(a1 + 168);
      if (v9)
      {
        if (!result)
          goto LABEL_22;
        result = strcmp(*(const char **)(a1 + 168), (const char *)result);
        if (!(_DWORD)result)
          return result;
        free(v9);
        *(_QWORD *)(a1 + 168) = 0;
      }
      else if (!result)
      {
        return result;
      }
      result = (uint64_t)strdup(v8);
      if (result)
      {
LABEL_23:
        *(_QWORD *)(a1 + 168) = result;
        return result;
      }
      __break(1u);
LABEL_22:
      free(v9);
      result = 0;
      goto LABEL_23;
    }
    v7 = xpc_string_create(provider_name);
    goto LABEL_14;
  }
  return result;
}

uint64_t _mdns_dns_service_manager_get_path_service_by_config(const __CFArray *a1, uint64_t a2)
{
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
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_dns_service_manager_get_path_service_by_config_block_invoke;
  v4[3] = &unk_24F284D88;
  v4[4] = &v5;
  v4[5] = a2;
  mdns_cfarray_enumerate(a1, (uint64_t)v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___mdns_dns_service_manager_handle_resolver_config_update_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(void);

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(v2 + 16) + 96);
    if (v3)
      v3();
  }
  return 1;
}

BOOL ___mdns_dns_service_manager_get_path_service_by_config_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 96) == *(_QWORD *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_service_manager_get_service_by_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (_mdns_dns_service_scope_id_match(a2, a1 + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _mdns_dns_service_scope_id_match(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  unsigned __int8 uu1[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  switch(*(_BYTE *)(a1 + 280))
  {
    case 1:
      return !*(_BYTE *)(a2 + 16);
    case 2:
      v3 = *(unsigned __int8 *)(a2 + 16);
      goto LABEL_12;
    case 3:
      if (*(_BYTE *)(a2 + 16) != 2)
        return 0;
      v4 = *(_DWORD *)(a1 + 260);
      return v4 == *(_DWORD *)a2;
    case 4:
      if (*(_BYTE *)(a2 + 16) == 3)
      {
        if (*(_QWORD *)(a1 + 96))
        {
          *(_QWORD *)uu1 = 0;
          v7 = 0;
          nw_resolver_config_get_identifier();
          if (!uuid_compare(uu1, (const unsigned __int8 *)a2))
            return 1;
        }
      }
      return 0;
    case 5:
      v3 = *(unsigned __int8 *)(a2 + 16);
      if (!*(_BYTE *)(a2 + 16))
        return 1;
      if (v3 != 1)
        return 0;
LABEL_12:
      v4 = *(_DWORD *)(a1 + 256);
      return v4 == *(_DWORD *)a2;
    default:
      return 0;
  }
}

uint64_t mdns_dns_service_manager_register_custom_service(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_register_custom_service_block_invoke;
  block[3] = &unk_24F284900;
  block[4] = &v7;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __mdns_dns_service_manager_register_custom_service_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t service_by_uuid;
  _QWORD *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  __CFArray *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  const char *v18;
  int v19;
  uint8_t buf[4];
  _BYTE v21[14];
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v2 = a1[5];
  if (*(_BYTE *)(v2 + 131))
    goto LABEL_21;
  v3 = a1[6];
  v4 = nw_resolver_config_create_with_dictionary();
  if (!v4)
  {
    v16 = (char *)MEMORY[0x22E2D1B48](v3);
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v17 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v18 = "<NO DESC.>";
      if (v16)
        v18 = v16;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v21 = v18;
      _os_log_error_impl(&dword_22983F000, v17, OS_LOG_TYPE_ERROR, "Failed to create nw_resolver_config for dictionary: %s", buf, 0xCu);
      if (!v16)
        goto LABEL_21;
    }
    else if (!v16)
    {
      goto LABEL_21;
    }
    free(v16);
    goto LABEL_21;
  }
  v5 = (void *)v4;
  v26[0] = 0;
  v26[1] = 0;
  nw_resolver_config_get_identifier();
  service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v2 + 56), (const unsigned __int8 *)v26);
  if (!service_by_uuid)
  {
    v19 = 0;
    v11 = _mdns_dns_service_create_from_resolver_config(v5, 5, 4, &v19);
    if (v11)
    {
      v7 = v11;
      v12 = *(__CFArray **)(v2 + 56);
      _mdns_dns_service_increment_use_count((uint64_t)v11);
      CFArrayAppendValue(v12, v7);
      _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v2, (uint64_t)v7);
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v13 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v21 = v7;
        _os_log_impl(&dword_22983F000, v13, OS_LOG_TYPE_DEFAULT, "Registered custom service -- %@", buf, 0xCu);
      }
      os_release(v7);
      goto LABEL_14;
    }
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v15 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68158466;
      *(_DWORD *)v21 = 16;
      *(_WORD *)&v21[4] = 2096;
      *(_QWORD *)&v21[6] = v26;
      v22 = 2112;
      v23 = v5;
      v24 = 2048;
      v25 = v19;
      _os_log_error_impl(&dword_22983F000, v15, OS_LOG_TYPE_ERROR, "Failed to register custom service -- uuid: %{uuid_t}.16P, config: %@, error: %{mdns:err}ld", buf, 0x26u);
    }
    nw_release(v5);
LABEL_21:
    v14 = 0;
    goto LABEL_15;
  }
  v7 = (_QWORD *)service_by_uuid;
  v8 = _mdns_dns_service_increment_use_count(service_by_uuid);
  if (_mdns_dns_service_log_s_once != -1)
    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
  v9 = _mdns_dns_service_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
  {
    v10 = v7[3];
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v21 = v10;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v8;
    _os_log_impl(&dword_22983F000, v9, OS_LOG_TYPE_INFO, "Registered existing custom service -- service id: %llu, use count: %d", buf, 0x12u);
  }
LABEL_14:
  nw_release(v5);
  v14 = v7[3];
LABEL_15:
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v14;
}

void mdns_dns_service_manager_deregister_custom_service(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (a2)
  {
    if (_mdns_dns_service_queue_s_once != -1)
      dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = __mdns_dns_service_manager_deregister_custom_service_block_invoke;
    v4[3] = &__block_descriptor_tmp_15_162;
    v4[4] = a1;
    v4[5] = a2;
    dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
  }
}

void __mdns_dns_service_manager_deregister_custom_service_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t service_by_id;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 131))
  {
    service_by_id = _mdns_dns_service_manager_get_service_by_id(*(const __CFArray **)(v1 + 56), *(_QWORD *)(a1 + 40));
    if (service_by_id)
      _mdns_dns_service_manager_deregister_service(v1, service_by_id);
  }
}

void mdns_dns_service_manager_register_doh_uri(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_register_doh_uri_block_invoke;
  block[3] = &__block_descriptor_tmp_16_163;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
}

void __mdns_dns_service_manager_register_doh_uri_block_invoke(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  const char *v3;
  char *v4;
  char *v5;
  nw_endpoint_t url;
  NSObject *v7;
  const char *url_scheme;
  const char *hostname;
  uint64_t url_path;
  const char *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  uint64_t ValueAtIndex;
  const char *provider_name;
  const char *provider_path;
  NSObject *v18;
  void *v19;
  __CFArray *v20;
  NSObject *v21;
  char *v22;
  int v23;
  _BYTE buf[22];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (!*(_BYTE *)(v2 + 131))
  {
    v3 = (const char *)a1[5];
    if (v3 && (v22 = (char *)a1[6], (v4 = strdup(v3)) != 0))
    {
      v1 = v4;
      v5 = strchr(v4, 123);
      if (v5)
        *v5 = 0;
      url = nw_endpoint_create_url(v1);
      if (url)
      {
        v7 = url;
        url_scheme = (const char *)nw_endpoint_get_url_scheme();
        if (url_scheme && !strcasecmp("https", url_scheme))
        {
          hostname = nw_endpoint_get_hostname(v7);
          url_path = nw_endpoint_get_url_path();
          if (hostname
            && (v11 = (const char *)url_path) != 0
            && (Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 48)), Count >= 1))
          {
            v13 = Count;
            v14 = 0;
            while (1)
            {
              ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 48), v14);
              if (*(_QWORD *)(ValueAtIndex + 96))
              {
                if (nw_resolver_config_get_protocol() == 2)
                {
                  provider_name = (const char *)nw_resolver_config_get_provider_name();
                  provider_path = (const char *)nw_resolver_config_get_provider_path();
                  if (!strcasecmp(hostname, provider_name) && !strcasecmp(v11, provider_path))
                    break;
                }
              }
              if (v13 == ++v14)
                goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
            if (_mdns_dns_service_log_s_once != -1)
              dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
            v18 = _mdns_dns_service_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v1;
              _os_log_impl(&dword_22983F000, v18, OS_LOG_TYPE_DEFAULT, "Registering discovered DoH resolver at %s", buf, 0xCu);
            }
            v19 = (void *)nw_resolver_config_create();
            nw_resolver_config_set_class();
            nw_resolver_config_set_protocol();
            nw_endpoint_get_hostname(v7);
            nw_resolver_config_set_provider_name();
            nw_endpoint_get_url_path();
            nw_resolver_config_set_provider_path();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            MEMORY[0x22E2D1AAC](buf);
            nw_resolver_config_set_identifier();
            v23 = 0;
            ValueAtIndex = _mdns_dns_service_create(3, 4, 4, &v23);
            if (v23)
            {
              if (v19)
                nw_release(v19);
              if (!ValueAtIndex)
                goto LABEL_31;
            }
            else
            {
              *(_QWORD *)(ValueAtIndex + 48) = nw_retain(v7);
              *(_BYTE *)(ValueAtIndex + 56) = 1;
              *(_QWORD *)(ValueAtIndex + 96) = v19;
              *(_WORD *)(ValueAtIndex + 276) = 6;
              _mdns_dns_service_update_nw_config_data(ValueAtIndex);
            }
            v20 = *(__CFArray **)(v2 + 48);
            _mdns_dns_service_increment_use_count(ValueAtIndex);
            CFArrayAppendValue(v20, (const void *)ValueAtIndex);
            _mdns_dns_service_manager_update_interface_properties_for_service((CFArrayRef *)v2, ValueAtIndex);
            os_release((void *)ValueAtIndex);
            _mdns_dns_service_manager_fetch_doh_pvd((_QWORD *)ValueAtIndex);
          }
          if (v22)
          {
            if (_mdns_dns_service_log_s_once != -1)
              dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
            v21 = _mdns_dns_service_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v1;
              _os_log_impl(&dword_22983F000, v21, OS_LOG_TYPE_DEFAULT, "Adding domain %s to DoH resolver at %s", buf, 0x16u);
            }
            _mdns_dns_service_add_domain_by_string(ValueAtIndex, v22, 0);
          }
        }
LABEL_31:
        free(v1);
        nw_release(v7);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    free(v1);
  }
}

void _mdns_dns_service_manager_fetch_doh_pvd(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  const char *hostname;
  uint64_t url_path;
  void *pvd_query;
  void *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  os_retain(a1);
  v2 = a1[6];
  nw_retain(v2);
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v3 = (void *)_mdns_dns_service_queue_s_queue;
  hostname = nw_endpoint_get_hostname(v2);
  url_path = nw_endpoint_get_url_path();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke;
  v8[3] = &unk_24F284E78;
  v8[5] = v2;
  v8[6] = a1;
  v8[4] = &v9;
  pvd_query = http_task_create_pvd_query(v3, (uint64_t)hostname, url_path, v8);
  v10[3] = (uint64_t)pvd_query;
  v7 = (void *)MEMORY[0x22E2D174C]();
  objc_msgSend(pvd_query, "resume");
  objc_autoreleasePoolPop(v7);
  _Block_object_dispose(&v9, 8);
}

void ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  char *v5;
  size_t v6;
  char *v7;
  const char *url;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t uint64;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  xpc_object_t value;
  xpc_object_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD applier[4];
  __int128 v28;
  xpc_object_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (xdict)
  {
    string = xpc_dictionary_get_string(xdict, "dohTemplate");
    if (string)
    {
      v5 = (char *)string;
      v6 = strlen(string);
      v7 = strchr(v5, 123);
      if (v7)
        v6 = v7 - v5;
      url = nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 40));
      if (url && (v9 = url, strlen(url) == v6) && !strncasecmp(v5, v9, v6))
      {
        uint64 = xpc_dictionary_get_uint64(xdict, "secondsRemaining");
        if (uint64 || (uint64 = xpc_dictionary_get_uint64(xdict, "seconds-remaining")) != 0)
        {
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v17 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
          {
            v18 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v31 = v18;
            v32 = 2048;
            v33 = uint64;
            _os_log_impl(&dword_22983F000, v17, OS_LOG_TYPE_INFO, "DoH resolver for %@ will expire in %llu seconds", buf, 0x16u);
          }
          if (_mdns_get_future_continuous_time_onceToken != -1)
            dispatch_once(&_mdns_get_future_continuous_time_onceToken, &__block_literal_global_91);
          v19 = 1000000000
              * uint64
              * *(unsigned int *)algn_255A69CBC
              / _mdns_get_future_continuous_time_time_base;
          v20 = mach_continuous_time() + v19;
        }
        else
        {
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v25 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
          {
            v26 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v31 = v26;
            _os_log_impl(&dword_22983F000, v25, OS_LOG_TYPE_INFO, "DoH resolver for %@ does not specify an expiration", buf, 0xCu);
          }
          v20 = 0;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40) = v20;
        value = xpc_dictionary_get_value(xdict, "dnsZones");
        v22 = xpc_dictionary_get_value(xdict, "trustedNames");
        if (v22)
        {
          v23 = v22;
          if (MEMORY[0x22E2D1BFC]() == MEMORY[0x24BDACF78])
          {
            applier[0] = MEMORY[0x24BDAC760];
            applier[1] = 0x40000000;
            applier[2] = ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke_85;
            applier[3] = &__block_descriptor_tmp_87;
            v28 = *(_OWORD *)(a1 + 40);
            v29 = value;
            xpc_array_apply(v23, applier);
          }
        }
      }
      else
      {
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v10 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v31 = v11;
          v32 = 2080;
          v33 = (uint64_t)v5;
          v12 = "DoH resolver for %@ does not match DoH template %s";
          v13 = v10;
          v14 = 22;
LABEL_29:
          _os_log_error_impl(&dword_22983F000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        }
      }
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v15 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v24 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        v12 = "DoH resolver for %@ missing DoH template";
        v13 = v15;
        v14 = 12;
        goto LABEL_29;
      }
    }
  }
  http_task_cancel(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  os_release(*(void **)(a1 + 48));
  nw_release(*(void **)(a1 + 40));
}

uint64_t ___mdns_dns_service_manager_fetch_doh_pvd_block_invoke_85(_QWORD *a1, uint64_t a2, void *a3)
{
  const char *string_ptr;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  xpc_object_t v12;
  uint64_t v13;
  nw_endpoint_t host;
  void *pvd_query;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD applier[7];
  char *v22;
  _BYTE buf[24];
  void *v24;
  uint64_t *v25;
  nw_endpoint_t v26;
  void *v27;
  xpc_object_t v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x22E2D1BFC](a3) == MEMORY[0x24BDACFF0])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v7 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = string_ptr;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_22983F000, v7, OS_LOG_TYPE_DEFAULT, "Query trusted name %s for DoH resolver for %@", buf, 0x16u);
    }
    v9 = (void *)a1[6];
    if (v9)
    {
      if (string_ptr)
      {
        v10 = (void *)a1[4];
        if (v10)
        {
          v11 = (void *)a1[5];
          if (MEMORY[0x22E2D1BFC](v9) == MEMORY[0x24BDACF78])
          {
            v22 = 0;
            asprintf(&v22, ".%s", string_ptr);
            v12 = xpc_array_create(0, 0);
            v13 = MEMORY[0x24BDAC760];
            applier[0] = MEMORY[0x24BDAC760];
            applier[1] = 0x40000000;
            applier[2] = ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke;
            applier[3] = &__block_descriptor_tmp_93;
            applier[4] = string_ptr;
            applier[5] = v12;
            applier[6] = v22;
            xpc_array_apply(v9, applier);
            if (v22)
            {
              free(v22);
              v22 = 0;
            }
            if (xpc_array_get_count(v12))
            {
              v17 = 0;
              v18 = &v17;
              v19 = 0x2000000000;
              v20 = 0;
              nw_retain(v10);
              os_retain(v11);
              host = nw_endpoint_create_host(string_ptr, "443");
              if (_mdns_dns_service_queue_s_once != -1)
                dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
              *(_QWORD *)buf = v13;
              *(_QWORD *)&buf[8] = 0x40000000;
              *(_QWORD *)&buf[16] = ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_2;
              v24 = &unk_24F284F20;
              v27 = v10;
              v28 = v12;
              v29 = v11;
              v25 = &v17;
              v26 = host;
              pvd_query = http_task_create_pvd_query((void *)_mdns_dns_service_queue_s_queue, (uint64_t)string_ptr, (uint64_t)"", buf);
              v18[3] = (uint64_t)pvd_query;
              v16 = (void *)MEMORY[0x22E2D174C]();
              objc_msgSend(pvd_query, "resume");
              objc_autoreleasePoolPop(v16);
              _Block_object_dispose(&v17, 8);
            }
            else if (v12)
            {
              xpc_release(v12);
            }
          }
        }
      }
    }
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  const char *string_ptr;
  size_t v6;
  size_t v7;

  if (MEMORY[0x22E2D1BFC](a3) == MEMORY[0x24BDACFF0])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (!strcasecmp(*(const char **)(a1 + 32), string_ptr)
      || (v6 = strlen(*(const char **)(a1 + 48)), v7 = strlen(string_ptr), v7 >= v6)
      && !strcasecmp(*(const char **)(a1 + 48), &string_ptr[v7 - v6]))
    {
      xpc_array_append_value(*(xpc_object_t *)(a1 + 40), a3);
    }
  }
  return 1;
}

void ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  const char *v4;
  const char *url;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[6];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (xdict)
  {
    string = xpc_dictionary_get_string(xdict, "dohTemplate");
    if (string)
    {
      v4 = string;
      url = nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 48));
      if (url && !strcasecmp(v4, url))
      {
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v17 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(const char **)(a1 + 40);
          v18 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          v25 = v18;
          v26 = 2112;
          v27 = v19;
          _os_log_impl(&dword_22983F000, v17, OS_LOG_TYPE_DEFAULT, "DoH resolver at %@ is trusted for %@", buf, 0x16u);
        }
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 0x40000000;
        v23[2] = ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_95;
        v23[3] = &__block_descriptor_tmp_96;
        v20 = *(void **)(a1 + 56);
        v21 = *(_QWORD *)(a1 + 64);
        v23[4] = *(_QWORD *)(a1 + 48);
        v23[5] = v21;
        xpc_array_apply(v20, v23);
      }
      else
      {
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v6 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 40);
          v7 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          v25 = v7;
          v26 = 2080;
          v27 = v4;
          v28 = 2112;
          v29 = v8;
          v9 = "DoH resolver for %@ does not match trusted DoH template %s for %@";
          v10 = v6;
          v11 = 32;
LABEL_17:
          _os_log_error_impl(&dword_22983F000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
        }
      }
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v15 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        v9 = "Trusted name %@ missing DoH template";
        v10 = v15;
        v11 = 12;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v12 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v9 = "No PvD file found at %@ for DoH server %@";
      v10 = v12;
      v11 = 22;
      goto LABEL_17;
    }
  }
  http_task_cancel(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  nw_release(*(void **)(a1 + 40));
  nw_release(*(void **)(a1 + 48));
  v22 = *(void **)(a1 + 56);
  if (v22)
    xpc_release(v22);
  os_release(*(void **)(a1 + 64));
}

uint64_t ___mdns_dns_service_manager_fetch_trusted_name_pvd_block_invoke_95(uint64_t a1, int a2, xpc_object_t xstring)
{
  char *string_ptr;
  NSObject *v5;
  uint64_t v6;
  int v8;
  char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  string_ptr = (char *)xpc_string_get_string_ptr(xstring);
  if (_mdns_dns_service_log_s_once != -1)
    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
  v5 = _mdns_dns_service_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = string_ptr;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_22983F000, v5, OS_LOG_TYPE_DEFAULT, "Adding domain %s to discovered DoH resolver for %@", (uint8_t *)&v8, 0x16u);
  }
  _mdns_dns_service_add_domain_by_string(*(_QWORD *)(a1 + 40), string_ptr, 0);
  return 1;
}

uint64_t ___mdns_get_future_continuous_time_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_mdns_get_future_continuous_time_time_base);
}

void mdns_dns_service_manager_invalidate(uint64_t a1)
{
  _QWORD block[5];

  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_19;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
}

void __mdns_dns_service_manager_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 130))
  {
    _mdns_dns_service_manager_terminate(v2, 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 130) = 1;
  }
}

uint64_t _mdns_dns_service_manager_get_service(const __CFArray *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t preferred_encrypted_alt;
  uint64_t v8;
  _QWORD v10[10];
  _QWORD v11[3];
  int v12;
  _QWORD v13[3];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  v14 = -1;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2000000000;
  v12 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 0x40000000;
  v10[2] = ___mdns_dns_service_manager_get_service_block_invoke;
  v10[3] = &unk_24F285078;
  v10[8] = a3;
  v10[9] = a2;
  v10[4] = 0;
  v10[5] = v13;
  v10[6] = v11;
  v10[7] = &v15;
  mdns_cfarray_enumerate(a1, (uint64_t)v10);
  v5 = v16;
  if ((a4 & 1) != 0)
  {
    v6 = v16[3];
    if (v6)
    {
      preferred_encrypted_alt = _mdns_dns_service_get_preferred_encrypted_alt(v6, (a4 & 2) != 0);
      v5 = v16;
      if (preferred_encrypted_alt)
        v16[3] = preferred_encrypted_alt;
    }
  }
  v8 = v5[3];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t _mdns_dns_service_manager_prepare_service(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  _UNKNOWN **v7;
  void (*v8)(_QWORD *);
  const __CFAllocator *v9;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v11;
  const __CFArray *v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex i;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const __CFArray *v20;
  const __CFArray *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t provider_name;
  uint64_t provider_path;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t);
  uint64_t identity_reference;
  uint64_t (*v33)(uint64_t, uint64_t, _QWORD);
  NSObject *v34;
  uint64_t v35;
  uint64_t odoh_config;
  void *v37;
  NSObject *v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, void *);
  void (*v40)(uint64_t);
  void (*v41)(uint64_t);
  _BOOL4 v42;
  int v43;
  int v44;
  int v45;
  int v46;
  const __CFArray *v47;
  CFIndex Count;
  CFIndex v49;
  uint64_t v50;
  const void *ValueAtIndex;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  dispatch_source_t v57;
  unsigned int v58;
  int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const void *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  const void *v69;
  NSObject *v70;
  dispatch_time_t v71;
  NSObject *v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  NSObject *v78;
  uint32_t v79;
  uint64_t v80;
  NSObject *log;
  int v82;
  __int128 aBlock;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE buf[24];
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v2 = a2;
  v93 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return v2;
  v4 = *(unsigned __int8 *)(a2 + 281);
  if (v4 != 5)
  {
    if (*(_QWORD *)(a2 + 64))
      return v2;
    if ((v4 - 3) < 2)
    {
      v4 = 4;
    }
    else
    {
      if (v4 == 1)
      {
        v22 = 0;
LABEL_41:
        v82 = 0;
        v26 = mdns_resolver_create(v4, *(_DWORD *)(a2 + 256), &v82);
        if (!v26)
        {
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v75 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
          {
            v76 = *(_QWORD *)(v2 + 24);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v76;
            v77 = "Failed to create resolver for service -- service id: %llu";
            v78 = v75;
            v79 = 12;
LABEL_158:
            _os_log_error_impl(&dword_22983F000, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);
          }
LABEL_144:
          if (*(_QWORD *)(v2 + 64))
            return v2;
          goto LABEL_145;
        }
        v27 = (uint64_t)v26;
        if (!*(_QWORD *)(v2 + 96))
        {
LABEL_72:
          if (*(_QWORD *)(v2 + 176))
          {
            if (!*(_BYTE *)(v27 + 137))
            {
              v40 = *(void (**)(uint64_t))(*(_QWORD *)(v27 + 16) + 64);
              if (v40)
                v40(v27);
            }
          }
          if (*(_WORD *)(v2 + 278))
          {
            if (!*(_BYTE *)(v27 + 137))
            {
              v41 = *(void (**)(uint64_t))(*(_QWORD *)(v27 + 16) + 72);
              if (v41)
                v41(v27);
            }
          }
          if (!*(_BYTE *)(v2 + 56) || *(_BYTE *)(v27 + 137))
          {
            v42 = *(unsigned __int8 *)(v27 + 137) != 0;
            if (*(_BYTE *)(v27 + 137))
            {
LABEL_95:
              v47 = *(const __CFArray **)(v2 + 80);
              if (v47)
              {
                Count = CFArrayGetCount(v47);
                if (Count < 1)
                {
                  v50 = 0;
                }
                else
                {
                  v49 = 0;
                  v50 = 0;
                  do
                  {
                    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 80), v49);
                    v52 = mdns_resolver_add_server_address(v27, (uint64_t)ValueAtIndex);
                    if (v52)
                    {
                      v53 = v52;
                      if (_mdns_dns_service_log_s_once != -1)
                        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
                      log = _mdns_dns_service_log_s_log;
                      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                      {
                        v54 = *(_QWORD *)(v2 + 24);
                        *(_DWORD *)buf = 134218498;
                        *(_QWORD *)&buf[4] = v54;
                        *(_WORD *)&buf[12] = 2112;
                        *(_QWORD *)&buf[14] = ValueAtIndex;
                        *(_WORD *)&buf[22] = 2048;
                        v90 = (void *)v53;
                        _os_log_error_impl(&dword_22983F000, log, OS_LOG_TYPE_ERROR, "Failed to add address to resolver -- service id: %llu, address: %@, error: %{mdns:err}ld", buf, 0x20u);
                      }
                    }
                    else
                    {
                      ++v50;
                    }
                    ++v49;
                  }
                  while (Count != v49);
                }
                if (Count && v50 < 1)
                {
                  os_release((void *)v27);
                  goto LABEL_144;
                }
              }
              if (_mdns_dns_service_queue_s_once != -1)
                dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
              mdns_resolver_set_queue(v27, (dispatch_object_t)_mdns_dns_service_queue_s_queue);
              os_retain((void *)a1);
              os_retain((void *)v27);
              os_retain((void *)v2);
              v55 = MEMORY[0x24BDAC760];
              *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
              *((_QWORD *)&aBlock + 1) = 0x40000000;
              v84 = ___mdns_dns_service_manager_prepare_resolver_block_invoke;
              v85 = &__block_descriptor_tmp_193;
              v86 = a1;
              v87 = v2;
              v88 = v27;
              mdns_resolver_set_event_handler(v27, &aBlock);
              *(_QWORD *)(v2 + 64) = v27;
              if (*(_BYTE *)(v2 + 283))
              {
                *(_BYTE *)(v2 + 283) = 0;
                v56 = *(NSObject **)(a1 + 96);
                if (v56)
                {
                  dispatch_source_merge_data(v56, 1uLL);
                  v27 = *(_QWORD *)(v2 + 64);
                }
              }
              mdns_resolver_activate((_BYTE *)v27);
              if (*(unsigned __int8 *)(v2 + 281) - 2 >= 4
                && nw_settings_get_ddr_enabled()
                && !*(_QWORD *)(v2 + 200))
              {
                if (_mdns_dns_service_queue_s_once != -1)
                  dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
                v57 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
                *(_QWORD *)(v2 + 200) = v57;
                if (v57)
                {
                  if (_mdns_os_variant_has_internal_diagnostics_s_once != -1)
                    dispatch_once(&_mdns_os_variant_has_internal_diagnostics_s_once, &__block_literal_global_240);
                  if (_mdns_os_variant_has_internal_diagnostics_s_result)
                  {
                    v58 = *(_DWORD *)(a1 + 124);
                    if (v58 <= 0xA)
                      v59 = 10;
                    else
                      v59 = *(_DWORD *)(a1 + 124);
                    if (v58)
                      v60 = v59;
                    else
                      v60 = 1800;
                  }
                  else
                  {
                    v60 = 1800;
                  }
                  v70 = *(NSObject **)(v2 + 200);
                  v71 = dispatch_time(0x8000000000000000, 1000000000 * v60);
                  dispatch_source_set_timer(v70, v71, 1000000000 * v60, 50000000 * v60);
                  v72 = *(NSObject **)(v2 + 200);
                  *(_QWORD *)buf = v55;
                  *(_QWORD *)&buf[8] = 0x40000000;
                  *(_QWORD *)&buf[16] = ___mdns_dns_service_manager_schedule_ddr_probe_block_invoke;
                  v90 = &__block_descriptor_tmp_202;
                  v91 = a1;
                  v92 = v2;
                  dispatch_source_set_event_handler(v72, buf);
                  dispatch_activate(*(dispatch_object_t *)(v2 + 200));
                  _mdns_dns_service_forget_all_ddr_queriers(v2);
                  _mdns_dns_service_manager_start_ddr_querier_ex((void *)a1, v2, 0);
                  goto LABEL_144;
                }
                if (_mdns_dns_service_log_s_once != -1)
                  dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
                v80 = _mdns_dns_service_log_s_log;
                if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v77 = "Failed to create DDR timer";
                  v78 = v80;
                  v79 = 2;
                  goto LABEL_158;
                }
              }
              goto LABEL_144;
            }
          }
          else
          {
            v42 = 0;
            *(_BYTE *)(v27 + 133) = 1;
          }
          if ((*(_WORD *)(v2 + 276) & 8) != 0)
            v43 = 2000;
          else
            v43 = 1000;
          *(_DWORD *)(v27 + 124) = v43;
          *(_BYTE *)(v27 + 132) = *(_BYTE *)(a1 + 128);
          if (((v22 | v42) & 1) == 0)
          {
            *(_BYTE *)(v27 + 138) = 1;
            v44 = *(_DWORD *)(a1 + 120);
            if (v44 >= 0x64)
              v45 = 100;
            else
              v45 = *(_DWORD *)(a1 + 120);
            if (v44 <= 0)
              v46 = 0;
            else
              v46 = v45;
            *(_DWORD *)(v27 + 128) = v46;
          }
          goto LABEL_95;
        }
        provider_name = nw_resolver_config_get_provider_name();
        provider_path = nw_resolver_config_get_provider_path();
        if (!*(_BYTE *)(v27 + 137))
        {
          v30 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 + 16) + 56);
          if (!v30 || (v30(v27, provider_name), !*(_BYTE *)(v27 + 137)))
          {
            v31 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 + 16) + 80);
            if (v31)
              v31(v27, provider_path);
          }
        }
        identity_reference = nw_resolver_config_get_identity_reference();
        if (identity_reference)
        {
          if (*(_BYTE *)(v27 + 137))
          {
            v82 = -6719;
            goto LABEL_52;
          }
          v33 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v27 + 16) + 88);
          if (v33)
          {
            v82 = v33(v27, identity_reference, 0);
            if (v82)
            {
LABEL_52:
              if (_mdns_dns_service_log_s_once != -1)
                dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
              v34 = _mdns_dns_service_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
              {
                v35 = *(_QWORD *)(v2 + 24);
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v35;
                _os_log_error_impl(&dword_22983F000, v34, OS_LOG_TYPE_ERROR, "Failed to set identity reference for service -- service id: %llu", buf, 0xCu);
              }
            }
          }
          else
          {
            v82 = 0;
          }
        }
        if (nw_resolver_config_get_protocol() == 3)
        {
          odoh_config = nw_resolver_config_get_odoh_config();
          v37 = (void *)nw_resolver_config_copy_proxy_config();
          if (v37)
            nw_proxy_config_set_prohibit_direct();
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v38 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v37;
            _os_log_impl(&dword_22983F000, v38, OS_LOG_TYPE_DEFAULT, "Resolver proxy config: %@", buf, 0xCu);
          }
          v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, void *))(*(_QWORD *)(v27 + 16) + 96);
          if (v39)
            v39(v27, provider_name, provider_path, odoh_config, 0, v37);
          if (v37)
            nw_release(v37);
          if (*(_BYTE *)(a1 + 129))
          {
            if (*(_BYTE *)(v2 + 282) != 4)
            {
              *(_WORD *)(v2 + 276) |= 0x1000u;
              if (!*(_BYTE *)(v27 + 137))
                *(_BYTE *)(v27 + 140) = 1;
            }
          }
        }
        goto LABEL_72;
      }
      if (v4 != 2)
      {
LABEL_145:
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v23 = _mdns_dns_service_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
          return 0;
        v74 = *(_QWORD *)(v2 + 24);
        LODWORD(aBlock) = 134217984;
        *(_QWORD *)((char *)&aBlock + 4) = v74;
        v25 = "Failed to prepare resolver -- service id: %llu";
        goto LABEL_153;
      }
      v4 = 3;
    }
    v22 = 1;
    goto LABEL_41;
  }
  if (*(_QWORD *)(a2 + 72))
    return v2;
  v5 = _os_object_alloc();
  if (!v5)
    goto LABEL_35;
  v6 = (_QWORD *)v5;
  v7 = &_mdns_push_server_kind;
  *(_QWORD *)(v5 + 16) = &_mdns_push_server_kind;
  do
  {
    v8 = (void (*)(_QWORD *))v7[2];
    if (v8)
      v8(v6);
    v7 = (_UNKNOWN **)*v7;
  }
  while (v7);
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
  v6[8] = Mutable;
  if (!Mutable || (v11 = CFArrayCreateMutable(v9, 0, MEMORY[0x24BDBD690]), (v6[9] = v11) == 0))
  {
    os_release(v6);
LABEL_35:
    *(_QWORD *)(v2 + 72) = 0;
LABEL_36:
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v23 = _mdns_dns_service_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      return 0;
    v24 = *(_QWORD *)(v2 + 24);
    LODWORD(aBlock) = 134217984;
    *(_QWORD *)((char *)&aBlock + 4) = v24;
    v25 = "Failed to prepare push server -- service id: %llu";
LABEL_153:
    _os_log_error_impl(&dword_22983F000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&aBlock, 0xCu);
    return 0;
  }
  *(_QWORD *)(v2 + 72) = v6;
  v12 = *(const __CFArray **)(v2 + 232);
  if (v12)
  {
    v13 = CFArrayGetCount(v12);
    if (v13 >= 1)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        v16 = CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 232), i);
        v17 = *(_QWORD *)(v2 + 72);
        if (!*(_BYTE *)(v17 + 103))
          CFArrayAppendValue(*(CFMutableArrayRef *)(v17 + 72), v16);
      }
    }
  }
  v18 = *(_QWORD *)(v2 + 72);
  if (!*(_BYTE *)(v18 + 103))
  {
    v19 = *(_DWORD *)(v2 + 256);
    if (*(_DWORD *)(v18 + 96) != v19)
    {
      *(_DWORD *)(v18 + 96) = v19;
      if (*(_QWORD *)(v18 + 56))
      {
        free(*(void **)(v18 + 56));
        *(_QWORD *)(v18 + 56) = 0;
        v19 = *(_DWORD *)(v18 + 96);
      }
    }
    if (v19 && !*(_QWORD *)(v18 + 56))
      *(_QWORD *)(v18 + 56) = mdns_system_interface_index_to_name(v19);
  }
  v20 = *(const __CFArray **)(v2 + 80);
  if (!v20 || CFArrayGetCount(v20) < 1)
  {
    v61 = *(_QWORD *)(v2 + 216);
    v62 = *(_QWORD *)(v2 + 72);
    if (v61)
    {
      if (!*(_BYTE *)(v62 + 103))
      {
        os_retain(*(void **)(v2 + 216));
        v63 = *(void **)(v62 + 48);
        if (v63)
          os_release(v63);
        *(_QWORD *)(v62 + 48) = v61;
      }
      goto LABEL_134;
    }
    if (v62)
      return v2;
    goto LABEL_36;
  }
  v21 = *(const __CFArray **)(v2 + 80);
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 0x40000000;
  v84 = ___mdns_dns_service_manager_prepare_push_service_block_invoke;
  v85 = &__block_descriptor_tmp_232;
  v86 = v2;
  mdns_cfarray_enumerate(v21, (uint64_t)&aBlock);
LABEL_134:
  v64 = *(_QWORD *)(v2 + 240);
  if (v64)
  {
    v65 = *(const void **)(v2 + 248);
    if (v65)
    {
      v66 = *(_QWORD *)(v2 + 72);
      dispatch_retain(*(dispatch_object_t *)(v2 + 240));
      v67 = _Block_copy(v65);
      v68 = *(NSObject **)(v66 + 80);
      if (v68)
        dispatch_release(v68);
      *(_QWORD *)(v66 + 80) = v64;
      v69 = *(const void **)(v66 + 88);
      if (v69)
        _Block_release(v69);
      *(_QWORD *)(v66 + 88) = v67;
    }
  }
  *(_BYTE *)(*(_QWORD *)(v2 + 72) + 103) = 1;
  return v2;
}

void ___mdns_dns_service_manager_prepare_resolver_block_invoke(_QWORD *a1, int a2, xpc_object_t xdict)
{
  uint64_t v3;
  _QWORD *v4;
  char *v5;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  int int64;
  NSObject *v15;
  const char *v16;
  const char *v17;
  char *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)a1[4];
  v3 = a1[5];
  v5 = (char *)a1[6];
  switch(a2)
  {
    case 1:
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v12 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
      {
        v13 = *(const char **)(v3 + 24);
        v29 = 134218242;
        v30 = v13;
        v31 = 2112;
        v32 = v5;
        _os_log_impl(&dword_22983F000, v12, OS_LOG_TYPE_INFO, "Resolver has been invalidated -- service id: %llu, resolver: %@", (uint8_t *)&v29, 0x16u);
      }
      os_release(v5);
      os_release((void *)v3);
      os_release(v4);
      break;
    case 3:
      if (!xdict || *(char **)(v3 + 64) != v5)
        return;
      int64 = xpc_dictionary_get_int64(xdict, "error_code");
      if (*(_BYTE *)(v3 + 282) == 4)
      {
        if (int64 == -6736)
        {
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v15 = _mdns_dns_service_log_s_log;
          if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
            return;
          v22 = *(const char **)(v3 + 24);
          v29 = 134217984;
          v30 = v22;
          v17 = "Received unexpected error for discovered service id: %llu";
        }
        else
        {
          if (int64 != -6776)
            return;
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v15 = _mdns_dns_service_log_s_log;
          if (!os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
            return;
          v16 = *(const char **)(v3 + 24);
          v29 = 134217984;
          v30 = v16;
          v17 = "Received authentication error for discovered service id: %llu";
        }
        _os_log_error_impl(&dword_22983F000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v29, 0xCu);
        return;
      }
      if (!*(_QWORD *)(v3 + 96))
        return;
      if (int64)
      {
        if (int64 == -6736)
        {
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v25 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
          {
            v28 = *(const char **)(v3 + 24);
            v29 = 134217984;
            v30 = v28;
            _os_log_error_impl(&dword_22983F000, v25, OS_LOG_TYPE_ERROR, "Reporting EBADMSG error for service id: %llu", (uint8_t *)&v29, 0xCu);
          }
        }
        else
        {
          if (int64 != -6776)
            return;
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
          v20 = _mdns_dns_service_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
          {
            v27 = *(const char **)(v3 + 24);
            v29 = 134217984;
            v30 = v27;
            _os_log_error_impl(&dword_22983F000, v20, OS_LOG_TYPE_ERROR, "Reporting EAUTH error for service id: %llu", (uint8_t *)&v29, 0xCu);
          }
        }
      }
      else
      {
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v23 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
        {
          v24 = *(const char **)(v3 + 24);
          v29 = 134217984;
          v30 = v24;
          _os_log_impl(&dword_22983F000, v23, OS_LOG_TYPE_INFO, "Reporting success for service id: %llu", (uint8_t *)&v29, 0xCu);
        }
      }
      nw_resolver_config_report_error();
      break;
    case 2:
      if (xdict && *(char **)(v3 + 64) == v5)
      {
        v8 = xpc_dictionary_get_BOOL(xdict, "cannot_connect");
        if (_mdns_dns_service_log_s_once != -1)
          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        v9 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          v10 = "";
          v11 = *(const char **)(v3 + 24);
          v29 = 136446722;
          if (v8)
            v10 = "not";
          v30 = v10;
          v31 = 2048;
          v32 = v11;
          v33 = 2112;
          v34 = v5;
          _os_log_impl(&dword_22983F000, v9, OS_LOG_TYPE_DEFAULT, "Resolver can%{public}s connect -- service id: %llu, resolver: %@", (uint8_t *)&v29, 0x20u);
        }
        if (v8)
        {
          if (*(_BYTE *)(v3 + 283))
            return;
          *(_BYTE *)(v3 + 283) = 1;
        }
        else
        {
          if (!*(_BYTE *)(v3 + 283))
            return;
          *(_BYTE *)(v3 + 283) = 0;
        }
        v19 = v4[12];
        if (v19)
          dispatch_source_merge_data(v19, 1uLL);
      }
      break;
    default:
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEBUG))
      {
        if (xdict)
        {
          v18 = (char *)MEMORY[0x22E2D1B48](xdict);
          if (_mdns_dns_service_log_s_once != -1)
            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
        }
        else
        {
          v18 = 0;
        }
        v21 = _mdns_dns_service_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_DEBUG))
        {
          v26 = "<invalid event value>";
          v29 = 138412802;
          v30 = (const char *)v3;
          if (!a2)
            v26 = "null";
          v31 = 2080;
          v32 = v26;
          v33 = 2082;
          v34 = v18;
          _os_log_debug_impl(&dword_22983F000, v21, OS_LOG_TYPE_DEBUG, "DNS service (%@) got unhandled event: %s info: %{public}s", (uint8_t *)&v29, 0x20u);
          if (!v18)
            return;
        }
        else if (!v18)
        {
          return;
        }
        free(v18);
      }
      break;
  }
}

void ___mdns_dns_service_manager_schedule_ddr_probe_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  _mdns_dns_service_forget_all_ddr_queriers(v2);
  _mdns_dns_service_manager_start_ddr_querier_ex(v1, v2, 0);
}

void _mdns_dns_service_manager_start_ddr_querier_ex(void *a1, uint64_t a2, char *a3)
{
  void *v4;
  CFMutableArrayRef Mutable;
  _QWORD *querier;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  _QWORD aBlock[8];
  __int128 block;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a2 + 64);
  if (v4)
  {
    if (a3 && !*(_QWORD *)(a2 + 192))
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
      *(_QWORD *)(a2 + 192) = Mutable;
      if (!Mutable)
        return;
      v4 = *(void **)(a2 + 64);
    }
    querier = mdns_resolver_create_querier(v4, 0);
    if (querier)
    {
      v15 = (uint64_t)querier;
      ++*(_DWORD *)(a2 + 268);
      mdns_querier_set_log_label((uint64_t)querier, "S%llu.DDR%u", v9, v10, v11, v12, v13, v14, *(_QWORD *)(a2 + 24));
      if (_mdns_dns_service_queue_s_once != -1)
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
      mdns_client_set_queue(v15, (dispatch_object_t)_mdns_dns_service_queue_s_queue);
      if (a3)
        v16 = a3;
      else
        v16 = "\x04_dns\bresolver\x04arpa";
      mdns_querier_set_query(v15, v16, 64, 1);
      if (!*(_BYTE *)(v15 + 49))
        *(_DWORD *)(v15 + 236) = -1;
      if (a3)
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 192), (const void *)v15);
      }
      else
      {
        v17 = *(_QWORD *)(a2 + 184);
        if (v17)
        {
          mdns_client_invalidate(v17);
          os_release(*(void **)(a2 + 184));
        }
        *(_QWORD *)(a2 + 184) = v15;
        os_retain((void *)v15);
      }
      os_retain(a1);
      os_retain((void *)a2);
      v18 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 0x40000000;
      aBlock[2] = ___mdns_dns_service_manager_start_ddr_querier_ex_block_invoke;
      aBlock[3] = &__block_descriptor_tmp_206;
      aBlock[4] = a2;
      aBlock[5] = v15;
      aBlock[6] = a1;
      aBlock[7] = a3;
      mdns_querier_set_result_handler(v15, aBlock);
      os_retain((void *)v15);
      if (_mdns_resolver_queue_s_once != -1)
        dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
      *(_QWORD *)&block = v18;
      *((_QWORD *)&block + 1) = 0x40000000;
      v23 = __mdns_querier_set_time_limit_ms_block_invoke;
      v24 = &__block_descriptor_tmp_7_1389;
      v25 = v15;
      v26 = 15000;
      dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, &block);
      mdns_client_activate(v15);
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v19 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v20 = "alias ";
        if (!a3)
          v20 = "";
        LODWORD(block) = 136446210;
        *(_QWORD *)((char *)&block + 4) = v20;
        _os_log_error_impl(&dword_22983F000, v19, OS_LOG_TYPE_ERROR, "Failed to create DDR %{public}squerier", (uint8_t *)&block, 0xCu);
      }
    }
  }
}

uint64_t ___mdns_dns_service_manager_prepare_push_service_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (!*(_BYTE *)(v2 + 103))
    CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 64), a2);
  return 1;
}

void ___mdns_dns_service_manager_start_ddr_querier_ex_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const __CFArray *v4;
  CFIndex FirstIndexOfValue;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  CFArrayRef *v11;
  unsigned __int16 *v12;
  const void *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  unsigned __int16 *v17;
  unint64_t v18;
  int v19;
  unsigned __int16 *v20;
  _BYTE *v21;
  BOOL v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  unsigned __int16 *v25;
  BOOL v26;
  _BYTE *v27;
  uint64_t v28;
  _BYTE *v29;
  unsigned __int8 *v30;
  unint64_t v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  char *v35;
  int v36;
  int is_empty;
  char *v38;
  const char *p_block;
  int v40;
  size_t v41;
  char *v42;
  char *v43;
  void *v44;
  int v45;
  NSObject *v46;
  const __CFArray *v47;
  const void *v48;
  uint64_t v49;
  const char *v50;
  char *v51;
  NSObject *v52;
  const char *v53;
  NSObject *v54;
  const char *v55;
  char *v56;
  NSObject *v57;
  NSObject *v58;
  unsigned int v59;
  unsigned int v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  void *obj;
  char *v68;
  unsigned int v69;
  nw_endpoint_t endpoint;
  NSObject *endpointa;
  int v72;
  nw_parameters_t parameters;
  NSObject *parametersa;
  void *v75;
  char *__s;
  nw_parameters_configure_protocol_block_t configure_tcp;
  unsigned __int8 *v78;
  NSObject *group;
  NSObject *v80;
  _QWORD v81[5];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  unsigned __int16 *v87;
  int v88[2];
  char *v89;
  int v90[2];
  int AnswerSection;
  _QWORD aBlock[7];
  __int16 v93;
  _QWORD v94[5];
  void *v95;
  _QWORD v96[4];
  _QWORD v97[3];
  char v98;
  _QWORD v99[3];
  char v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  nw_connection_t v104;
  _QWORD v105[3];
  char v106;
  _QWORD v107[4];
  _QWORD v108[4];
  uint64_t block;
  uint64_t v110;
  void *v111;
  void *v112;
  _BYTE *v113;
  CFArrayRef *v114;
  NSObject *v115;
  uint8_t v116[4];
  uint64_t v117;
  _BYTE buf[24];
  __int128 v119;
  _QWORD *p_isa;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD *v123;
  _QWORD *v124;
  _QWORD *v125;
  _QWORD *v126;
  uint64_t v127;
  NSObject *v128;
  char v129;
  char v130[17];
  uint64_t configure_tls;
  uint64_t p_configure_tls;
  uint64_t v133;
  void *v134;
  _QWORD *v135;
  _QWORD *v136;
  _QWORD *v137;
  nw_parameters_t v138;
  char v139;
  uint64_t v140;
  CFRange v141;

  v140 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(a1 + 40);
  if (*(const void **)(v3 + 184) == v2)
  {
    if (v2)
    {
      os_release(*(void **)(a1 + 40));
      *(_QWORD *)(v3 + 184) = 0;
    }
  }
  else
  {
    v4 = *(const __CFArray **)(v3 + 192);
    if (!v4)
      goto LABEL_164;
    v141.length = CFArrayGetCount(v4);
    v141.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(v3 + 192), v141, v2);
    if (FirstIndexOfValue < 0)
      goto LABEL_164;
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v3 + 192), FirstIndexOfValue);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v6 + 248) == 1)
  {
    v7 = *(_QWORD *)(v6 + 136);
    if (v7)
    {
      v8 = *(_QWORD *)(v7 + 32);
      v9 = *(unsigned int *)(v7 + 40);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    if (*(_QWORD *)(a1 + 56))
      v78 = *(unsigned __int8 **)(*(_QWORD *)(*(_QWORD *)(v6 + 88) + 56) + 24);
    else
      v78 = 0;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(CFArrayRef **)(a1 + 48);
    AnswerSection = 0;
    *(_QWORD *)v90 = 0;
    v12 = (unsigned __int16 *)DNSMessageCollapse(v8, v9, v90, (uint64_t *)&AnswerSection);
    if (!AnswerSection)
    {
      v13 = *(const void **)(v10 + 152);
      if (v13)
      {
        CFRelease(v13);
        *(_QWORD *)(v10 + 152) = 0;
      }
      *(_BYTE *)(v10 + 287) = 0;
      if (*(_QWORD *)v90 >= 0xCuLL)
      {
        v14 = __rev16(v12[3]);
        if (v14)
        {
          v89 = 0;
          AnswerSection = DNSMessageGetAnswerSection((unint64_t)v12, *(unint64_t *)v90, &v89);
          if (!AnswerSection)
          {
            group = dispatch_group_create();
            v15 = 0;
            v16 = MEMORY[0x24BDAC760];
            *(_QWORD *)v88 = v89;
            configure_tcp = (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0878];
            while (1)
            {
              v86 = 0;
              v87 = 0;
              AnswerSection = _DNSMessageExtractRecordEx((unint64_t)v12, *(uint64_t *)v90, *(char **)v88, 0, 0, 0, 0, &v87, &v86, 0, 0, 0, 0, v88);
              if (AnswerSection)
                goto LABEL_162;
              v17 = v87;
              if (v87)
              {
                v18 = v86;
                if (v86 >= 2)
                {
                  if (*v87)
                  {
                    *(_QWORD *)buf = 0;
                    *(_QWORD *)&buf[8] = buf;
                    *(_QWORD *)&buf[16] = 0x2000000000;
                    LOBYTE(v119) = 0;
                    block = v16;
                    v110 = 0x40000000;
                    v111 = __dnssd_svcb_is_valid_block_invoke;
                    v112 = &unk_24F2862A8;
                    v113 = buf;
                    _dnssd_svcb_extract_values(v87, v86, 0, (uint64_t)&block);
                    v19 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
                    _Block_object_dispose(buf, 8);
                    if (!v19)
                    {
                      v18 = v86;
                      v17 = v87;
                      if (v86 >= 2)
                      {
LABEL_29:
                        if (!*v17)
                        {
                          if (!v78)
                          {
                            v20 = v17 + 1;
                            if (v17 != (unsigned __int16 *)-2 && (unsigned __int16 *)((char *)v17 + v18) > v20)
                            {
                              v21 = v17 + 1;
                              while (*v21)
                              {
                                v21 += *v21 + 1;
                                if (v21)
                                  v22 = v21 >= (_BYTE *)v17 + v18;
                                else
                                  v22 = 1;
                                if (v22)
                                  goto LABEL_33;
                              }
                              if ((unsigned __int16)((_WORD)v21 - (_WORD)v20 + 1) <= 0x100uLL)
                                _mdns_dns_service_manager_start_ddr_querier_ex(v11, v10);
                            }
                          }
                          goto LABEL_33;
                        }
                      }
                      v82 = 0;
                      v83 = &v82;
                      v84 = 0x2000000000;
                      v85 = 0;
                      v81[0] = v16;
                      v81[1] = 0x40000000;
                      v81[2] = ___mdns_dns_service_manager_process_ddr_response_block_invoke;
                      v81[3] = &unk_24F2854B8;
                      v81[4] = &v82;
                      block = v16;
                      v110 = 0x40000000;
                      v111 = __dnssd_svcb_access_alpn_values_block_invoke;
                      v112 = &unk_24F286348;
                      v113 = v81;
                      _dnssd_svcb_extract_values(v17, v18, 1, (uint64_t)&block);
                      if (!*((_BYTE *)v83 + 24))
                        goto LABEL_32;
                      if (v86 < 2)
                        goto LABEL_32;
                      v23 = v87;
                      v24 = v87 + 1;
                      if (v87 == (unsigned __int16 *)-2 || (unsigned __int16 *)((char *)v87 + v86) <= v24)
                        goto LABEL_32;
                      v25 = v87 + 1;
                      while (*(_BYTE *)v25)
                      {
                        v25 = (unsigned __int16 *)((char *)v25 + *(unsigned __int8 *)v25 + 1);
                        if (v25)
                          v26 = v25 >= (unsigned __int16 *)((char *)v87 + v86);
                        else
                          v26 = 1;
                        if (v26)
                          goto LABEL_32;
                      }
                      if ((unsigned __int16)((_WORD)v25 - (_WORD)v24 + 1) > 0x100uLL)
                        goto LABEL_32;
                      v27 = malloc_type_calloc(1uLL, 0x3F1uLL, 0xF1748037uLL);
                      if (!v27)
                        __break(1u);
                      LODWORD(v28) = *((unsigned __int8 *)v23 + 2);
                      v29 = v27;
                      if (*((_BYTE *)v23 + 2)
                        || (*v27 = 46, v29 = v27 + 1, LODWORD(v28) = *(unsigned __int8 *)v24, *(_BYTE *)v24))
                      {
                        while (v28 <= 0x3F)
                        {
                          v30 = (unsigned __int8 *)v24 + 1;
                          v31 = (unint64_t)v24 + v28 + 1;
                          if (v31 >= (unint64_t)(v23 + 129))
                            break;
                          if ((unint64_t)v30 < v31)
                          {
                            v28 = v28;
                            do
                            {
                              v33 = *v30++;
                              v32 = v33;
                              if (v33 == 92 || v32 == 46)
                              {
                                *v29++ = 92;
                              }
                              else if (v32 <= 0x20)
                              {
                                *(_WORD *)v29 = 12380;
                                v34 = (205 * v32) >> 11;
                                v29[2] = v34 | 0x30;
                                v29 += 3;
                                LOBYTE(v32) = (v32 - 10 * v34) | 0x30;
                              }
                              *v29++ = v32;
                              --v28;
                            }
                            while (v28);
                          }
                          *v29 = 0;
                          v35 = (char *)v24 + *(unsigned __int8 *)v24;
                          *v29++ = 46;
                          v36 = v35[1];
                          v24 = (unsigned __int16 *)(v35 + 1);
                          LODWORD(v28) = v36;
                          if (!v36)
                            goto LABEL_72;
                        }
LABEL_148:
                        free(v27);
LABEL_32:
                        _Block_object_dispose(&v82, 8);
                        goto LABEL_33;
                      }
LABEL_72:
                      *v29 = 0;
                      if (v29 == (_BYTE *)-1)
                        goto LABEL_148;
                      __s = v27;
                      is_empty = dnssd_svcb_service_name_is_empty((uint64_t)v87, v86);
                      v38 = __s;
                      p_block = __s;
                      if (is_empty)
                      {
                        if (!v78)
                          goto LABEL_147;
                        p_block = (const char *)&block;
                        v40 = DomainNameToString(v78, 0, (unsigned __int8 *)&block, 0);
                        v38 = __s;
                        if (v40)
                          goto LABEL_147;
                      }
                      v41 = strlen(p_block);
                      if (v41 && p_block[v41 - 1] == 46)
                        p_block[v41 - 1] = 0;
                      parameters = (nw_parameters_t)p_block;
                      configure_tls = 0;
                      p_configure_tls = (uint64_t)&configure_tls;
                      v133 = 0x2000000000;
                      LOWORD(v134) = 0;
                      *(_QWORD *)buf = v16;
                      *(_QWORD *)&buf[8] = 0x40000000;
                      *(_QWORD *)&buf[16] = __dnssd_svcb_get_port_block_invoke;
                      *(_QWORD *)&v119 = &unk_24F2862D0;
                      *((_QWORD *)&v119 + 1) = &configure_tls;
                      _dnssd_svcb_extract_values(v87, v86, 3, (uint64_t)buf);
                      v69 = *(unsigned __int16 *)(p_configure_tls + 24);
                      _Block_object_dispose(&configure_tls, 8);
                      configure_tls = 0;
                      p_configure_tls = (uint64_t)&configure_tls;
                      v133 = 0x2000000000;
                      v134 = 0;
                      *(_QWORD *)buf = v16;
                      *(_QWORD *)&buf[8] = 0x40000000;
                      *(_QWORD *)&buf[16] = __dnssd_svcb_copy_doh_path_block_invoke;
                      *(_QWORD *)&v119 = &unk_24F2862F8;
                      *((_QWORD *)&v119 + 1) = &configure_tls;
                      _dnssd_svcb_extract_values(v87, v86, 7, (uint64_t)buf);
                      v42 = *(char **)(p_configure_tls + 24);
                      _Block_object_dispose(&configure_tls, 8);
                      if (v42)
                      {
                        v43 = strchr(v42, 123);
                        if (v43)
                          *v43 = 0;
                      }
                      v80 = 0;
                      configure_tls = 0;
                      p_configure_tls = (uint64_t)&configure_tls;
                      v133 = 0x2000000000;
                      v134 = 0;
                      *(_QWORD *)buf = v16;
                      *(_QWORD *)&buf[8] = 0x40000000;
                      *(_QWORD *)&buf[16] = __dnssd_svcb_copy_odoh_config_block_invoke;
                      *(_QWORD *)&v119 = &unk_24F286320;
                      *((_QWORD *)&v119 + 1) = &configure_tls;
                      p_isa = &v80;
                      _dnssd_svcb_extract_values(v87, v86, 32769, (uint64_t)buf);
                      v44 = *(void **)(p_configure_tls + 24);
                      _Block_object_dispose(&configure_tls, 8);
                      v45 = *((unsigned __int8 *)v83 + 24);
                      v46 = v80;
                      if (v45 == 3 && v44 && v80)
                      {
                        v45 = 4;
                        *((_BYTE *)v83 + 24) = 4;
                      }
                      endpoint = v46;
                      v75 = v44;
                      configure_tls = 0;
                      p_configure_tls = (uint64_t)&configure_tls;
                      v133 = 0x2000000000;
                      v134 = 0;
                      *(_QWORD *)buf = v16;
                      *(_QWORD *)&buf[8] = 0x40000000;
                      *(_QWORD *)&buf[16] = ___mdns_dns_service_get_discovered_alt_block_invoke;
                      *(_QWORD *)&v119 = &unk_24F285520;
                      v72 = v45;
                      LOBYTE(v121) = v45;
                      p_isa = &parameters->isa;
                      *((_QWORD *)&v119 + 1) = &configure_tls;
                      v47 = *(const __CFArray **)(v10 + 144);
                      if (v47)
                      {
                        mdns_cfarray_enumerate(v47, (uint64_t)buf);
                        v48 = *(const void **)(p_configure_tls + 24);
                        _Block_object_dispose(&configure_tls, 8);
                        if (v48)
                        {
                          _mdns_dns_service_manager_add_pending_alt(v11, v10, v48);
                          if (!v42)
                            goto LABEL_144;
LABEL_143:
                          free(v42);
                          goto LABEL_144;
                        }
                      }
                      else
                      {
                        _Block_object_dispose(&configure_tls, 8);
                      }
                      if ((v72 - 2) > 2)
                        goto LABEL_107;
                      v68 = v42;
                      v49 = nw_resolver_config_create();
                      nw_resolver_config_set_class();
                      nw_resolver_config_set_protocol();
                      nw_resolver_config_set_provider_name();
                      if (v68)
                        nw_resolver_config_set_provider_path();
                      obj = (void *)v49;
                      if (v75 != 0 && endpoint != 0)
                        nw_resolver_config_set_odoh_config();
                      if (*(_QWORD *)(v10 + 104) || (v59 = *(_DWORD *)(v10 + 256)) != 0 && if_indextoname(v59, buf))
                        nw_resolver_config_set_interface_name();
                      configure_tls = 0;
                      p_configure_tls = 0;
                      MEMORY[0x22E2D1AAC](&configure_tls);
                      nw_resolver_config_set_identifier();
                      v42 = v68;
                      if (obj)
                      {
                        if (nw_resolver_config_get_class() == 4)
                        {
                          LODWORD(configure_tls) = 0;
                          v50 = _mdns_dns_service_create_discovered_alt(v10, obj, v69, 0, 0, &configure_tls);
                          if (v50)
                          {
                            v51 = (char *)v50;
                            LODWORD(configure_tls) = _mdns_dns_service_manager_add_pending_alt(v11, v10, v50);
                            nw_release(obj);
                            os_release(v51);
                          }
                          else
                          {
                            if (_mdns_dns_service_log_s_once != -1)
                              dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
                            v64 = _mdns_dns_service_log_s_log;
                            if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 134217984;
                              *(_QWORD *)&buf[4] = (int)configure_tls;
                              _os_log_error_impl(&dword_22983F000, v64, OS_LOG_TYPE_ERROR, "Failed to create discovered oblivious DNS service -- error: %{mdns:err}ld", buf, 0xCu);
                            }
                            nw_release(obj);
                          }
                          v42 = v68;
                          if (v68)
                            goto LABEL_143;
LABEL_144:
                          if (v75)
                            free(v75);
                          v38 = __s;
LABEL_147:
                          v27 = v38;
                          goto LABEL_148;
                        }
                        if (_mdns_dns_service_log_s_once != -1)
                          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
                        v54 = _mdns_dns_service_log_s_log;
                        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109891;
                          v55 = "";
                          if (v68)
                            v55 = v68;
                          *(_DWORD *)&buf[4] = v72;
                          *(_WORD *)&buf[8] = 2081;
                          *(_QWORD *)&buf[10] = parameters;
                          *(_WORD *)&buf[18] = 1024;
                          *(_DWORD *)&buf[20] = v69;
                          LOWORD(v119) = 2081;
                          *(_QWORD *)((char *)&v119 + 2) = v55;
                          _os_log_impl(&dword_22983F000, v54, OS_LOG_TYPE_INFO, "Verifying discovered service -- type: %{mdns:dns_service_type}d, provider name: %{private}s, port: %d, path: %{private}s", buf, 0x22u);
                        }
                        aBlock[0] = v16;
                        aBlock[1] = 0x40000000;
                        aBlock[2] = ___mdns_dns_service_manager_register_discovered_service_block_invoke;
                        aBlock[3] = &__block_descriptor_tmp_212;
                        aBlock[4] = v10;
                        aBlock[5] = obj;
                        v93 = v69;
                        aBlock[6] = v11;
                        v108[0] = 0;
                        v108[1] = v108;
                        v108[2] = 0x2000000000;
                        v108[3] = 0;
                        v107[0] = 0;
                        v107[1] = v107;
                        v107[2] = 0x2000000000;
                        v107[3] = 0;
                        v105[0] = 0;
                        v105[1] = v105;
                        v105[2] = 0x2000000000;
                        v106 = 0;
                        endpointa = nw_endpoint_create_host_with_numeric_port();
                        configure_tls = v16;
                        p_configure_tls = 0x40000000;
                        v133 = (uint64_t)___mdns_dns_service_manager_probe_discovered_service_block_invoke;
                        v134 = &unk_24F285598;
                        v139 = v72;
                        v135 = v105;
                        v136 = v108;
                        v137 = v107;
                        v138 = parameters;
                        parametersa = nw_parameters_create_secure_tcp(&configure_tls, configure_tcp);
                        v56 = *(char **)(v10 + 104);
                        if (v56 || (v60 = *(_DWORD *)(v10 + 256)) != 0 && (v56 = if_indextoname(v60, v130)) != 0)
                        {
                          if (_mdns_dns_service_log_s_once != -1)
                            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
                          v57 = _mdns_dns_service_log_s_log;
                          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 136446210;
                            *(_QWORD *)&buf[4] = v56;
                            _os_log_impl(&dword_22983F000, v57, OS_LOG_TYPE_INFO, "Scoping discovered service to %{public}s", buf, 0xCu);
                          }
                          v58 = nw_interface_create_with_name();
                          nw_parameters_require_interface(parametersa, v58);
                          if (v58)
                            nw_release(v58);
                        }
                        v101 = 0;
                        v102 = &v101;
                        v103 = 0x2000000000;
                        v104 = 0;
                        v104 = nw_connection_create(endpointa, parametersa);
                        if (endpointa)
                          nw_release(endpointa);
                        if (parametersa)
                          nw_release(parametersa);
                        v61 = v102[3];
                        if (_mdns_dns_service_queue_s_once != -1)
                          dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
                        nw_connection_set_queue(v61, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
                        os_retain((void *)v10);
                        dispatch_group_enter(group);
                        v99[0] = 0;
                        v99[1] = v99;
                        v99[2] = 0x2000000000;
                        v100 = 0;
                        v97[0] = 0;
                        v97[1] = v97;
                        v97[2] = 0x2000000000;
                        v98 = 0;
                        v96[0] = 0;
                        v96[1] = v96;
                        v96[2] = 0x2000000000;
                        v96[3] = 0;
                        v94[0] = 0;
                        v94[1] = v94;
                        v94[2] = 0x3002000000;
                        v94[3] = __Block_byref_object_copy_;
                        v94[4] = __Block_byref_object_dispose_;
                        v95 = 0;
                        v95 = _Block_copy(aBlock);
                        v62 = v102[3];
                        *(_QWORD *)buf = v16;
                        *(_QWORD *)&buf[8] = 0x40000000;
                        *(_QWORD *)&buf[16] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_220;
                        *(_QWORD *)&v119 = &unk_24F2855E8;
                        *((_QWORD *)&v119 + 1) = &v101;
                        p_isa = v99;
                        v129 = v72;
                        v121 = v108;
                        v122 = v107;
                        v123 = v97;
                        v124 = v96;
                        v127 = v10;
                        v128 = group;
                        v125 = v94;
                        v126 = v105;
                        nw_connection_set_state_changed_handler(v62, buf);
                        nw_connection_start((nw_connection_t)v102[3]);
                        if (*(_QWORD *)(v10 + 208) || (v63 = nw_array_create(), (*(_QWORD *)(v10 + 208) = v63) != 0))
                        {
                          nw_array_append();
                        }
                        else
                        {
                          if (_mdns_dns_service_log_s_once != -1)
                            dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
                          v65 = _mdns_dns_service_log_s_log;
                          if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                          {
                            v66 = *(_QWORD *)(v10 + 24);
                            *(_DWORD *)v116 = 134217984;
                            v117 = v66;
                            _os_log_error_impl(&dword_22983F000, v65, OS_LOG_TYPE_ERROR, "Cancelling service's DDR verification connection because of lack of resources -- service id: %llu", v116, 0xCu);
                          }
                          nw_connection_cancel((nw_connection_t)v102[3]);
                        }
                        v42 = v68;
                        _Block_object_dispose(v94, 8);
                        _Block_object_dispose(v96, 8);
                        _Block_object_dispose(v97, 8);
                        _Block_object_dispose(v99, 8);
                        _Block_object_dispose(&v101, 8);
                        _Block_object_dispose(v105, 8);
                        _Block_object_dispose(v107, 8);
                        _Block_object_dispose(v108, 8);
                      }
                      else
                      {
LABEL_107:
                        if (_mdns_dns_service_log_s_once != -1)
                          dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
                        v52 = _mdns_dns_service_log_s_log;
                        if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 67109891;
                          v53 = "";
                          if (v42)
                            v53 = v42;
                          *(_DWORD *)&buf[4] = v72;
                          *(_WORD *)&buf[8] = 2081;
                          *(_QWORD *)&buf[10] = parameters;
                          *(_WORD *)&buf[18] = 1024;
                          *(_DWORD *)&buf[20] = v69;
                          LOWORD(v119) = 2081;
                          *(_QWORD *)((char *)&v119 + 2) = v53;
                          _os_log_error_impl(&dword_22983F000, v52, OS_LOG_TYPE_ERROR, "Failed to create discovered DNS config -- type: %{mdns:dns_service_type}d, provider name: %{private}s, port: %d, path: %{private}s", buf, 0x22u);
                          if (v42)
                            goto LABEL_143;
                          goto LABEL_144;
                        }
                      }
                      if (!v42)
                        goto LABEL_144;
                      goto LABEL_143;
                    }
                  }
                  else if ((dnssd_svcb_service_name_is_empty((uint64_t)v87, v86) & 1) == 0)
                  {
                    goto LABEL_29;
                  }
                }
              }
LABEL_33:
              if (++v15 == v14)
              {
                os_retain(v11);
                os_retain((void *)v10);
                if (_mdns_dns_service_queue_s_once != -1)
                  dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
                block = v16;
                v110 = 0x40000000;
                v111 = ___mdns_dns_service_manager_process_ddr_response_block_invoke_2;
                v112 = &__block_descriptor_tmp_210;
                v113 = (_BYTE *)v10;
                v114 = v11;
                v115 = group;
                dispatch_group_notify(group, (dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
                goto LABEL_162;
              }
            }
          }
        }
        goto LABEL_163;
      }
    }
LABEL_162:
    if (v12)
LABEL_163:
      free(v12);
  }
LABEL_164:
  os_release(*(void **)(a1 + 48));
  os_release(*(void **)(a1 + 32));
  os_release(*(void **)(a1 + 40));
}

uint64_t ___mdns_dns_service_manager_process_ddr_response_block_invoke(uint64_t a1, char *__s1)
{
  char v4;

  if (!strcmp(__s1, "dot"))
  {
    v4 = 2;
    goto LABEL_5;
  }
  if (!strcmp(__s1, "h2"))
  {
    v4 = 3;
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }
  return 1;
}

BOOL ___mdns_dns_service_get_discovered_alt_block_invoke(uint64_t a1, uint64_t a2)
{
  const char *provider_name;

  if (*(_QWORD *)(a2 + 96))
  {
    if (*(unsigned __int8 *)(a2 + 281) == *(unsigned __int8 *)(a1 + 48))
    {
      provider_name = (const char *)nw_resolver_config_get_provider_name();
      if (!strcasecmp(provider_name, *(const char **)(a1 + 40)))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    }
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t _mdns_dns_service_manager_add_pending_alt(CFArrayRef *a1, uint64_t a2, const void *a3)
{
  const __CFArray *Mutable;
  uint64_t result;
  __CFArray *v8;
  _QWORD v9[5];

  Mutable = *(const __CFArray **)(a2 + 152);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
    *(_QWORD *)(a2 + 152) = Mutable;
    if (!Mutable)
      return 4294960567;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___mdns_dns_service_array_contains_service_block_invoke;
  v9[3] = &__block_descriptor_tmp_135;
  v9[4] = a3;
  result = mdns_cfarray_enumerate(Mutable, (uint64_t)v9);
  if ((_DWORD)result)
  {
    v8 = *(__CFArray **)(a2 + 152);
    _mdns_dns_service_increment_use_count((uint64_t)a3);
    CFArrayAppendValue(v8, a3);
    _mdns_dns_service_manager_update_interface_properties_for_service(a1, (uint64_t)a3);
    return 0;
  }
  return result;
}

const char *_mdns_dns_service_create_discovered_alt(uint64_t a1, void *a2, unsigned int a3, int a4, uint64_t a5, _DWORD *a6)
{
  const char *result;
  char *v13;
  char *v14;
  uint64_t v15;
  const void *v16;
  const __CFArray *v17;
  CFIndex Count;
  CFIndex v19;
  CFIndex v20;
  __int16 v21;
  _DWORD *ValueAtIndex;
  _DWORD *v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  int v30;

  result = (const char *)nw_resolver_config_get_provider_name();
  if (a5)
  {
    if (!result || (result = strdup(result)) == 0)
    {
      __break(1u);
      return result;
    }
    v13 = (char *)result;
    nw_resolver_config_set_provider_name();
  }
  else
  {
    v13 = 0;
  }
  v30 = 0;
  v14 = _mdns_dns_service_create_from_resolver_config(a2, 4, *(_BYTE *)(a1 + 280), &v30);
  v15 = (uint64_t)v14;
  if (!v30)
  {
    *((_QWORD *)v14 + 17) = a1;
    os_retain((void *)a1);
    *(_WORD *)(v15 + 276) = *(_WORD *)(a1 + 276) & 0xE;
    *(_WORD *)(v15 + 278) = a3;
    if (v13)
      *(_QWORD *)(v15 + 176) = v13;
    if (a4)
    {
      v16 = *(const void **)(v15 + 80);
      if (v16)
      {
        CFRelease(v16);
        *(_QWORD *)(v15 + 80) = 0;
      }
      v17 = *(const __CFArray **)(a1 + 80);
      if (v17)
      {
        Count = CFArrayGetCount(v17);
        if (Count >= 1)
        {
          v19 = Count;
          v20 = 0;
          v21 = __rev16(a3);
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), v20);
            v23 = ValueAtIndex;
            v24 = *((unsigned __int8 *)ValueAtIndex + 25);
            if (v24 == 30)
              break;
            if (v24 == 2)
            {
              v25 = ValueAtIndex[7];
              v26 = _mdns_address_new();
              if (!v26)
                goto LABEL_24;
              v27 = (void *)v26;
              *(_WORD *)(v26 + 24) = 528;
              *(_WORD *)(v26 + 26) = v21;
              *(_DWORD *)(v26 + 28) = v25;
LABEL_21:
              _mdns_dns_service_append_address(v15, v27);
              os_release(v27);
            }
LABEL_22:
            if (v19 == ++v20)
              goto LABEL_25;
          }
          v28 = ValueAtIndex[12];
          v29 = _mdns_address_new();
          if (!v29)
          {
LABEL_24:
            _mdns_dns_service_append_address(v15, 0);
            goto LABEL_22;
          }
          v27 = (void *)v29;
          *(_WORD *)(v29 + 24) = 7708;
          *(_WORD *)(v29 + 26) = v21;
          *(_OWORD *)(v29 + 32) = *((_OWORD *)v23 + 2);
          *(_DWORD *)(v29 + 48) = v28;
          goto LABEL_21;
        }
      }
    }
LABEL_25:
    v13 = 0;
  }
  if (a6)
    *a6 = v30;
  if (v13)
    free(v13);
  return (const char *)v15;
}

void ___mdns_dns_service_manager_register_discovered_service_block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v6;
  const char *v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint8_t buf[4];
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v6 + 276) & 1) != 0)
  {
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v10 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      v11 = *(char **)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134217984;
      v19 = v11;
      v12 = "Service became defunct before discovered child service could be validated -- service id: %llu";
      v13 = v10;
      v14 = 12;
LABEL_19:
      _os_log_impl(&dword_22983F000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
LABEL_20:
    nw_release(*(void **)(a1 + 40));
    if (!a4)
      return;
    goto LABEL_21;
  }
  if (!a2)
  {
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v15 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v12 = "Failed to validate discovered service, ignoring";
      v13 = v15;
      v14 = 2;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v17 = 0;
  v7 = _mdns_dns_service_create_discovered_alt(v6, *(void **)(a1 + 40), *(unsigned __int16 *)(a1 + 56), a3, (uint64_t)a4, &v17);
  if (!v7)
  {
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v16 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v19 = (char *)v17;
      _os_log_error_impl(&dword_22983F000, v16, OS_LOG_TYPE_ERROR, "Failed to create discovered DNS service -- error: %{mdns:err}ld", buf, 0xCu);
    }
    goto LABEL_20;
  }
  v8 = (char *)v7;
  v17 = _mdns_dns_service_manager_add_pending_alt(*(CFArrayRef **)(a1 + 48), *(_QWORD *)(a1 + 32), v7);
  if (!v17)
  {
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v9 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_22983F000, v9, OS_LOG_TYPE_INFO, "Registered discovered service -- %@", buf, 0xCu);
    }
  }
  nw_release(*(void **)(a1 + 40));
  os_release(v8);
  if (a4)
LABEL_21:
    free(a4);
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke(uint64_t a1, id a2)
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;

  v3 = a2;
  if (!v3)
    return;
  v4 = v3;
  sec_protocol_options_set_tls_server_name(v3, *(const char **)(a1 + 56));
  sec_protocol_options_set_peer_authentication_required(v4, 1);
  v5 = *(unsigned __int8 *)(a1 + 64);
  if (v5 == 2)
  {
    v6 = "dot";
LABEL_6:
    sec_protocol_options_add_tls_application_protocol(v4, v6);
    goto LABEL_7;
  }
  if ((v5 - 3) <= 1)
  {
    v6 = "h2";
    goto LABEL_6;
  }
LABEL_7:
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2;
  v8[3] = &unk_24F285570;
  v7 = *(_OWORD *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 32);
  v10 = v7;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  sec_protocol_options_set_verify_block(v4, v8, (dispatch_queue_t)_mdns_dns_service_queue_s_queue);
  sec_release(v4);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_220(uint64_t a1, int a2)
{
  const void *v4;
  void *v5;
  const void *v6;
  const void *v7;
  NSObject *v8;
  __int128 v9;
  NSObject *v10;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 96) + 208) && nw_array_contains_object())
  {
    switch(a2)
    {
      case 1:
      case 4:
        _mdns_dns_service_forget_ddr_connection(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 208), *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        break;
      case 3:
        v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        if (_mdns_dns_service_queue_s_once != -1)
        {
          v10 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
          v8 = v10;
        }
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 0x40000000;
        v11[2] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2_221;
        v11[3] = &unk_24F2855C0;
        v15 = *(_QWORD *)(a1 + 96);
        v16 = *(_BYTE *)(a1 + 112);
        v9 = *(_OWORD *)(a1 + 48);
        v12 = *(_OWORD *)(a1 + 32);
        v13 = v9;
        v14 = *(_OWORD *)(a1 + 64);
        nw_connection_access_establishment_report(v8, (dispatch_queue_t)_mdns_dns_service_queue_s_queue, v11);
        break;
      case 5:
        goto LABEL_6;
      default:
        return;
    }
  }
  else if (a2 == 5)
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) + 16))();
    v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v4)
    {
      _Block_release(v4);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = 0;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v5)
    {
      nw_release(v5);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
    os_release(*(void **)(a1 + 96));
    v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
}

void ___mdns_dns_service_manager_process_ddr_response_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  CFIndex Count;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 152))
  {
    Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 152));
    v2 = *(_QWORD *)(a1 + 32);
    if (Count >= 1)
    {
      *(_BYTE *)(v2 + 287) = 1;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 96))
      {
        dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 40) + 96), 1uLL);
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
  }
  os_release((void *)v2);
  os_release(*(void **)(a1 + 40));
  v4 = *(NSObject **)(a1 + 48);
  if (v4)
    dispatch_release(v4);
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2_221(CFIndex a1, NSObject *a2)
{
  CFIndex v2;
  uint64_t v4;
  CFIndex v5;
  uint64_t v6;
  const __CFArray *v7;
  void *v8;
  const __CFArray *v9;
  const char *string_ptr;
  BOOL v11;
  NSObject *v12;
  int v13;
  char *v14;
  NSObject *v15;
  const __CFArray *v16;
  _QWORD *ValueAtIndex;
  _QWORD *v18;
  CFIndex v19;
  const __CFString *v20;
  char *v21;
  NSObject *host;
  const sockaddr *address;
  int sa_family;
  NSObject *v25;
  int v26;
  char *v29;
  char v30;
  NSObject *v31;
  CFIndex v32;
  NSObject *v33;
  CFIndex v34;
  unsigned int v35;
  int v36;
  char **v37;
  CFIndex Count;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t v44[4];
  uint64_t v45;
  __int128 buf;
  BOOL (*v47)(uint64_t);
  void *v48;
  uint64_t *v49;
  CFIndex v50;
  uint64_t v51;
  char **v52;
  char v53;
  char v54;
  uint64_t v55;
  CFRange v56;

  v2 = a1;
  v55 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 80) + 208) && nw_array_contains_object())
  {
    v39 = *(_QWORD *)(v2 + 80);
    v4 = *(_QWORD *)(v39 + 136);
    if (!v4 || !*(_QWORD *)(v4 + 96))
      v4 = *(_QWORD *)(v2 + 80);
    v5 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 8);
    v37 = (char **)(*(_QWORD *)(*(_QWORD *)(v2 + 72) + 8) + 24);
    LODWORD(v6) = *(unsigned __int8 *)(v2 + 88);
    v7 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24);
    v8 = *(void **)(v4 + 160);
    if (!v8
      || ((v9 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 24),
           string_ptr = xpc_string_get_string_ptr(v8),
           v9)
        ? (v11 = string_ptr == 0)
        : (v11 = 1),
          v11))
    {
      LODWORD(v14) = 0;
    }
    else
    {
      v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], string_ptr, 0x8000100u);
      v56.length = CFArrayGetCount(v9);
      v56.location = 0;
      v13 = CFArrayContainsValue(v9, v56, v12);
      LODWORD(v14) = v13 != 0;
      if (v13)
      {
        if (_mdns_dns_service_log_s_once != -1)
          goto LABEL_76;
        goto LABEL_15;
      }
LABEL_17:
      if (v12)
        CFRelease(v12);
    }
    v16 = *(const __CFArray **)(v39 + 80);
    if (v16)
    {
      Count = CFArrayGetCount(v16);
      if (Count >= 1)
      {
        v36 = (int)v14;
        v32 = v5;
        v33 = a2;
        v34 = v2;
        v2 = 0;
        v35 = v6 - 3;
        a2 = "0";
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v39 + 80), v2);
          if (v7)
          {
            v18 = ValueAtIndex;
            v19 = CFArrayGetCount(v7);
            if (v19 >= 1)
              break;
          }
          v26 = 0;
LABEL_57:
          if (++v2 >= Count || (v26 & 1) != 0)
          {
            a2 = v33;
            v2 = v34;
            v5 = v32;
            LODWORD(v14) = v36;
            goto LABEL_62;
          }
        }
        v5 = v19;
        v6 = 1;
        while (1)
        {
          v20 = (const __CFString *)CFArrayGetValueAtIndex(v7, v6 - 1);
          v21 = mdns_cfstring_to_utf8_cstring(v20);
          if (v21)
            break;
          v26 = 0;
LABEL_51:
          if (v6++ >= v5)
            goto LABEL_57;
        }
        v14 = v21;
        host = nw_endpoint_create_host(v21, "0");
        if (!host)
        {
          v26 = 0;
          goto LABEL_50;
        }
        v12 = host;
        if (nw_endpoint_get_type(host) == nw_endpoint_type_address)
        {
          address = nw_endpoint_get_address(v12);
          sa_family = address->sa_family;
          if (sa_family == *((unsigned __int8 *)v18 + 25) && address->sa_len == *((unsigned __int8 *)v18 + 24))
          {
            if (sa_family == 30)
            {
              if (*(_QWORD *)&address->sa_data[6] == v18[4] && *(_QWORD *)&address[1].sa_len == v18[5])
                goto LABEL_33;
            }
            else if (sa_family == 2 && *(_DWORD *)&address->sa_data[2] == *((_DWORD *)v18 + 7))
            {
LABEL_33:
              if (_mdns_dns_service_log_s_once != -1)
                dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
              v25 = _mdns_dns_service_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138543362;
                *(_QWORD *)((char *)&buf + 4) = v12;
                _os_log_impl(&dword_22983F000, v25, OS_LOG_TYPE_INFO, "Discovered service verified, address %{public}@ in certificate", (uint8_t *)&buf, 0xCu);
              }
              if ((v36 & 1) == 0 && !*v37)
              {
                if (v35 <= 1 && sa_family == 30)
                {
                  asprintf(v37, "[%s]", v14);
                }
                else
                {
                  v29 = strdup(v14);
                  if (!v29)
                  {
                    __break(1u);
LABEL_76:
                    dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
LABEL_15:
                    v15 = _mdns_dns_service_log_s_log;
                    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
                    {
                      LODWORD(buf) = 138543362;
                      *(_QWORD *)((char *)&buf + 4) = v12;
                      _os_log_impl(&dword_22983F000, v15, OS_LOG_TYPE_INFO, "Discovered service verified, name \"%{public}@\" in certificate", (uint8_t *)&buf, 0xCu);
                    }
                    goto LABEL_17;
                  }
                  *v37 = v29;
                }
              }
              v26 = 1;
              goto LABEL_49;
            }
          }
        }
        v26 = 0;
LABEL_49:
        nw_release(v12);
LABEL_50:
        free(v14);
        if ((v26 & 1) != 0)
          goto LABEL_57;
        goto LABEL_51;
      }
    }
    else
    {
      Count = 0;
    }
    v26 = 0;
LABEL_62:
    v40 = 0;
    v41 = &v40;
    v42 = 0x2000000000;
    v43 = 0;
    if (a2)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 0x40000000;
      v47 = ___mdns_dns_server_validate_discovered_service_connection_block_invoke;
      v48 = &unk_24F285638;
      v49 = &v40;
      v53 = (char)v14;
      v54 = v26;
      v50 = Count;
      v51 = v39;
      v52 = v37;
      nw_establishment_report_enumerate_resolution_reports(a2, &buf);
    }
    if (((v14 | v26) & 1) != 0)
    {
      v30 = 1;
    }
    else if (*((_BYTE *)v41 + 24))
    {
      v30 = 1;
      *(_BYTE *)(v5 + 24) = 1;
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v31 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = v39;
        _os_log_error_impl(&dword_22983F000, v31, OS_LOG_TYPE_ERROR, "Discovered service could not be verified for %@", v44, 0xCu);
      }
      v30 = 0;
    }
    _Block_object_dispose(&v40, 8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = v30;
    _mdns_dns_service_forget_ddr_connection(*(_QWORD *)(*(_QWORD *)(v2 + 80) + 208), *(NSObject **)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24));
  }
}

void _mdns_dns_service_forget_ddr_connection(uint64_t a1, NSObject *a2)
{
  if (a1)
  {
    if (nw_array_remove_object())
      nw_connection_cancel(a2);
  }
}

BOOL ___mdns_dns_server_validate_discovered_service_connection_block_invoke(uint64_t a1)
{
  nw_resolution_report_enumerate_endpoints();
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_server_validate_discovered_service_connection_block_invoke_2(uint64_t a1, nw_endpoint_t endpoint)
{
  const sockaddr *address;
  int v5;
  const sockaddr *v6;
  CFIndex v7;
  _DWORD *ValueAtIndex;
  int sa_family;
  unsigned int v11;
  NSObject *v12;
  _QWORD *v13;
  const char *hostname;
  char *v15;
  uint8_t buf[4];
  nw_endpoint_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (nw_endpoint_get_type(endpoint) == nw_endpoint_type_address)
  {
    address = nw_endpoint_get_address(endpoint);
    v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      if (*(uint64_t *)(a1 + 40) < 1)
      {
        v5 = 0;
      }
      else
      {
        v6 = address;
        v7 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 48) + 80), v7);
          sa_family = v6->sa_family;
          if (sa_family == *((unsigned __int8 *)ValueAtIndex + 25)
            && sa_family == 2
            && v6->sa_len == *((unsigned __int8 *)ValueAtIndex + 24))
          {
            v11 = *(_DWORD *)&v6->sa_data[2];
            if (v11 == ValueAtIndex[7]
              && (vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(bswap32(v11)), (int8x16_t)xmmword_229870A10), (int32x4_t)xmmword_229870A20))) & 1) != 0)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
              if (_mdns_dns_service_log_s_once != -1)
                dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
              v12 = _mdns_dns_service_log_s_log;
              if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v18 = endpoint;
                _os_log_impl(&dword_22983F000, v12, OS_LOG_TYPE_INFO, "Discovered service verified, private address %{public}@ used", buf, 0xCu);
              }
            }
          }
          if (!*(_BYTE *)(a1 + 64) && !*(_BYTE *)(a1 + 65))
          {
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
            {
              v13 = *(_QWORD **)(a1 + 56);
              if (v13)
              {
                if (!*v13)
                {
                  hostname = nw_endpoint_get_hostname(endpoint);
                  if (hostname)
                  {
                    v15 = strdup(hostname);
                    if (!v15)
                      __break(1u);
                    **(_QWORD **)(a1 + 56) = v15;
                  }
                }
              }
            }
          }
          v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
            break;
          ++v7;
        }
        while (v7 < *(_QWORD *)(a1 + 40));
      }
    }
  }
  else
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  return v5 == 0;
}

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_3(_QWORD *a1, SecTrustRef trust, int a3, uint64_t a4)
{
  const __CFArray *v5;
  const __CFArray *v6;
  const void *v7;
  const void *v8;
  NSObject *v10;
  const void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (a3)
    {
      v5 = SecTrustCopyCertificateChain(trust);
      if (v5)
      {
        v6 = v5;
        if (CFArrayGetCount(v5) >= 1)
        {
          CFArrayGetValueAtIndex(v6, 0);
          v7 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
          if (v7)
          {
            CFRelease(v7);
            *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
          }
          v8 = *(const void **)(*(_QWORD *)(a1[7] + 8) + 24);
          if (v8)
          {
            CFRelease(v8);
            *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
          }
          *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = SecCertificateCopyIPAddresses();
          *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = SecCertificateCopyDNSNames();
        }
        CFRelease(v6);
      }
    }
    else
    {
      if (_mdns_dns_service_log_s_once != -1)
        dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
      v10 = _mdns_dns_service_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = a4;
        _os_log_error_impl(&dword_22983F000, v10, OS_LOG_TYPE_ERROR, "Aynchronous trust evaluation failed: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  (*(void (**)(void))(a1[4] + 16))();
  v11 = (const void *)a1[4];
  if (v11)
    _Block_release(v11);
}

BOOL ___mdns_dns_service_array_contains_service_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

uint64_t ___mdns_dns_service_manager_get_service_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v9;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4 || ((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2) & 1) == 0)
  {
    if (_mdns_dns_service_scope_id_match(a2, *(_QWORD *)(a1 + 64)))
    {
      v9 = 0;
      v5 = _mdns_dns_service_handles_domain_name(a2, *(_BYTE **)(a1 + 72), &v9);
      if ((v5 & 0x80000000) == 0)
      {
        v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        if (v5 > v6)
        {
          v7 = v9;
LABEL_7:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
          return 1;
        }
        if (v5 == v6)
        {
          v7 = v9;
          if (v9 < *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            goto LABEL_7;
        }
      }
    }
  }
  return 1;
}

uint64_t _mdns_dns_service_get_preferred_encrypted_alt(uint64_t a1, char a2)
{
  const __CFArray *v3;
  uint64_t v4;
  _QWORD v6[6];
  char v7;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2000000000;
  v9 = 0;
  v3 = *(const __CFArray **)(a1 + 144);
  if (v3 && *(unsigned __int8 *)(a1 + 281) - 2 >= 4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___mdns_dns_service_get_preferred_encrypted_alt_block_invoke;
    v6[3] = &unk_24F2850A0;
    v7 = a2;
    v6[4] = v8;
    v6[5] = &v10;
    mdns_cfarray_enumerate(v3, (uint64_t)v6);
    v4 = v11[3];
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  return v4;
}

BOOL ___mdns_dns_service_get_preferred_encrypted_alt_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  BOOL v7;

  if ((*(_WORD *)(a2 + 276) & 0x801) != 0)
    return 1;
  v4 = *(_QWORD *)(a2 + 96) && nw_resolver_config_get_class() == 4;
  if (*(unsigned __int8 *)(a1 + 48) != v4)
    return 1;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((v5 - 3) >= 2)
  {
    v6 = *(unsigned __int8 *)(a2 + 281);
    if ((v6 - 3) < 2 || v6 == 2 && (v7 = v5 == 2, v5 = 2, !v7))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
      v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
  return (v5 - 5) < 0xFFFFFFFE;
}

uint64_t _mdns_dns_service_handles_domain_name(uint64_t a1, _BYTE *a2, _DWORD *a3)
{
  uint64_t *v5;
  unsigned int v6;
  int v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  unsigned __int8 *v13;

  v5 = (uint64_t *)(a1 + 88);
  while (1)
  {
    v5 = (uint64_t *)*v5;
    if (!v5)
      return 0xFFFFFFFFLL;
    v6 = *a2;
    if (*a2)
    {
      v7 = 0;
      v8 = a2;
      while (v6 <= 0x3F)
      {
        v8 += v6 + 1;
        if (v8 - a2 > 255)
          break;
        ++v7;
        v6 = *v8;
        if (!*v8)
          goto LABEL_10;
      }
      v7 = -1;
    }
    else
    {
      v7 = 0;
    }
LABEL_10:
    v9 = v5[1];
    v10 = *(unsigned int *)(v9 + 48);
    v11 = __OFSUB__(v7, (_DWORD)v10);
    v12 = v7 - v10;
    if (v12 < 0 == v11)
    {
      if (!(_DWORD)v10)
        break;
      v13 = a2;
      if (v12 >= 1)
      {
        v13 = a2;
        do
        {
          if (!*v13)
            break;
          v13 += *v13 + 1;
          --v12;
        }
        while (v12);
      }
      if (DomainNameEqual(v13, *(unsigned __int8 **)(v9 + 24)))
        break;
    }
  }
  if (a3)
    *a3 = *((_DWORD *)v5 + 4);
  return v10;
}

uint64_t mdns_dns_service_manager_get_unscoped_native_service(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_get_unscoped_native_service_block_invoke;
  block[3] = &unk_24F284988;
  block[4] = &v7;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_unscoped_native_service_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t service;
  uint64_t result;
  _QWORD v7[2];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a1[5];
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    v3 = *(const __CFArray **)(v2 + 24);
    v4 = a1[6];
    v7[0] = 0;
    v7[1] = 0;
    v8 = 0;
    service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)v7, 0);
    result = _mdns_dns_service_manager_prepare_service(a1[5], service);
  }
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_interface_scoped_native_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  _QWORD v8[7];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __mdns_dns_service_manager_get_interface_scoped_native_service_block_invoke;
  v8[3] = &unk_24F2849B0;
  v8[4] = &v10;
  v8[5] = a1;
  v8[6] = a2;
  v9 = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_interface_scoped_native_service_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  uint64_t v4;
  int v5;
  uint64_t service;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    v3 = *(const __CFArray **)(v2 + 24);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_DWORD *)(a1 + 56);
    v9 = 0;
    v10 = 0x100000000;
    v8 = v5;
    service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)&v8, 0);
    result = _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 40), service);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_unscoped_system_service(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v6[7];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 0x40000000;
  v6[2] = __mdns_dns_service_manager_get_unscoped_system_service_with_options_block_invoke;
  v6[3] = &unk_24F2849D8;
  v6[4] = &v8;
  v6[5] = a1;
  v6[6] = a2;
  v7 = 0;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_unscoped_system_service_with_options_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  uint64_t v4;
  int v5;
  uint64_t service;
  uint64_t result;
  _QWORD v8[2];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    v3 = *(const __CFArray **)(v2 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_DWORD *)(a1 + 56);
    v8[0] = 0;
    v8[1] = 0;
    v9 = 0;
    service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)v8, v5);
    result = _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 40), service);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_interface_scoped_system_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  _QWORD v8[7];
  int v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __mdns_dns_service_manager_get_interface_scoped_system_service_with_options_block_invoke;
  v8[3] = &unk_24F284A00;
  v8[4] = &v11;
  v8[5] = a1;
  v8[6] = a2;
  v9 = a3;
  v10 = 0;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_interface_scoped_system_service_with_options_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t service;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    v3 = *(const __CFArray **)(v2 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(_DWORD *)(a1 + 56);
    v5 = *(_DWORD *)(a1 + 60);
    v10 = 0;
    v11 = 0x100000000;
    v9 = v6;
    service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)&v9, v5);
    result = _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 40), service);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_service_scoped_system_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  _QWORD v8[7];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __mdns_dns_service_manager_get_service_scoped_system_service_block_invoke;
  v8[3] = &unk_24F284A28;
  v8[4] = &v10;
  v8[5] = a1;
  v8[6] = a2;
  v9 = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_service_scoped_system_service_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  uint64_t v4;
  int v5;
  uint64_t service;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    v3 = *(const __CFArray **)(v2 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_DWORD *)(a1 + 56);
    v9 = 0;
    v10 = 0x200000000;
    v8 = v5;
    service = _mdns_dns_service_manager_get_service(v3, v4, (uint64_t)&v8, 0);
    result = _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 40), service);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_custom_service(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_get_custom_service_block_invoke;
  block[3] = &unk_24F284A50;
  block[4] = &v7;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_custom_service_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t service_by_id;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    service_by_id = _mdns_dns_service_manager_get_service_by_id(*(const __CFArray **)(v2 + 56), *(_QWORD *)(a1 + 48));
    if (service_by_id)
      service_by_id = (uint64_t)_mdns_dns_service_manager_get_usable_service_instance(*(CFArrayRef **)(a1 + 40), service_by_id, 0);
    result = _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 40), service_by_id);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

__CFArray *_mdns_dns_service_manager_get_usable_service_instance(CFArrayRef *a1, uint64_t a2, int a3)
{
  int v5;
  BOOL v6;
  char v7;
  __CFArray *Mutable;
  int v9;
  const __CFArray *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  void *v14;
  unsigned int v15;
  _QWORD v17[5];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_DWORD *)(a2 + 256);
  if (a3)
    v6 = v5 == a3;
  else
    v6 = 1;
  v7 = !v6;
  if (v5 && (v7 & 1) != 0)
    return 0;
  if ((v7 & 1) == 0 && (*(_WORD *)(a2 + 276) & 1) == 0)
    return (__CFArray *)a2;
  if (v5)
    v9 = *(_DWORD *)(a2 + 256);
  else
    v9 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 0x40000000;
  v17[2] = ___mdns_dns_service_get_variant_for_interface_block_invoke;
  v17[3] = &unk_24F285198;
  v18 = v9;
  v17[4] = &v19;
  v10 = *(const __CFArray **)(a2 + 128);
  if (v10)
  {
    mdns_cfarray_enumerate(v10, (uint64_t)v17);
    Mutable = (__CFArray *)v20[3];
    _Block_object_dispose(&v19, 8);
    if (Mutable)
      return Mutable;
  }
  else
  {
    _Block_object_dispose(&v19, 8);
  }
  LODWORD(v17[0]) = 0;
  v11 = _mdns_dns_service_create(*(_BYTE *)(a2 + 281), *(_BYTE *)(a2 + 282), *(_BYTE *)(a2 + 280), (int *)v17);
  v12 = v11;
  if (!LODWORD(v17[0]))
  {
    *(_QWORD *)(v11 + 136) = a2;
    os_retain((void *)a2);
    *(_DWORD *)(v12 + 256) = v9;
    *(_WORD *)(v12 + 276) = *(_WORD *)(a2 + 276) & 6;
    v13 = *(const void **)(a2 + 80);
    *(_QWORD *)(v12 + 80) = v13;
    if (v13)
      CFRetain(v13);
    v14 = *(void **)(a2 + 96);
    *(_QWORD *)(v12 + 96) = v14;
    if (v14)
      nw_retain(v14);
    v15 = *(_DWORD *)(v12 + 256);
    if (v15)
      *(_QWORD *)(v12 + 104) = mdns_system_interface_index_to_name(v15);
    goto LABEL_26;
  }
  if (!v11)
    return 0;
LABEL_26:
  Mutable = *(__CFArray **)(a2 + 128);
  if (Mutable
    || (Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks),
        (*(_QWORD *)(a2 + 128) = Mutable) != 0))
  {
    _mdns_dns_service_increment_use_count(v12);
    CFArrayAppendValue(Mutable, (const void *)v12);
    _mdns_dns_service_manager_update_interface_properties_for_service(a1, v12);
    Mutable = (__CFArray *)v12;
  }
  os_release((void *)v12);
  return Mutable;
}

BOOL ___mdns_dns_service_get_variant_for_interface_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 256) == *(_DWORD *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t mdns_dns_service_manager_get_uuid_scoped_service(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  _QWORD v8[7];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __mdns_dns_service_manager_get_uuid_scoped_service_block_invoke;
  v8[3] = &unk_24F284A78;
  v8[4] = &v10;
  v8[5] = a1;
  v8[6] = a2;
  v9 = a3;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v8);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __mdns_dns_service_manager_get_uuid_scoped_service_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 *v3;
  uint64_t service_by_uuid;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    v3 = *(const unsigned __int8 **)(a1 + 48);
    service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v2 + 48), v3);
    if (service_by_uuid
      || (service_by_uuid = _mdns_dns_service_manager_get_service_by_uuid(*(const __CFArray **)(v2 + 40), v3)) != 0)
    {
      service_by_uuid = (uint64_t)_mdns_dns_service_manager_get_usable_service_instance(*(CFArrayRef **)(a1 + 40), service_by_uuid, *(_DWORD *)(a1 + 56));
    }
    result = _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 40), service_by_uuid);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t mdns_dns_service_manager_get_discovered_service(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_get_discovered_service_block_invoke;
  block[3] = &unk_24F284AA0;
  block[4] = &v7;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_get_discovered_service_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFArray *v4;
  uint64_t v5;
  uint64_t v6;
  __CFArray *usable_service_instance;
  uint64_t result;
  _QWORD v9[7];
  _QWORD v10[3];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 131))
  {
    result = 0;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2000000000;
    v11 = -1;
    v4 = *(const __CFArray **)(v2 + 48);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___mdns_dns_service_manager_get_discovered_service_block_invoke;
    v9[3] = &unk_24F284F48;
    v9[5] = &v12;
    v9[6] = v3;
    v9[4] = v10;
    mdns_cfarray_enumerate(v4, (uint64_t)v9);
    if (v13[3])
    {
      v5 = mach_continuous_approximate_time();
      v6 = v13[3];
      *(_QWORD *)(v6 + 32) = v5;
    }
    else
    {
      v6 = 0;
    }
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(&v12, 8);
    if (v6)
      usable_service_instance = _mdns_dns_service_manager_get_usable_service_instance(*(CFArrayRef **)(a1 + 40), v6, 0);
    else
      usable_service_instance = 0;
    result = _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 40), (uint64_t)usable_service_instance);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t ___mdns_dns_service_manager_get_discovered_service_block_invoke(uint64_t a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = _mdns_dns_service_handles_domain_name((uint64_t)a2, *(_BYTE **)(a1 + 48), 0);
  if (a2[12] && v4 > *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }
  v5 = a2[5];
  if (v5 && v5 < mach_continuous_time())
  {
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v6 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      v7 = a2[6];
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_INFO, "DoH resolver for %@ has passed expiration", (uint8_t *)&v10, 0xCu);
    }
    a2[5] = 0;
    while (1)
    {
      v8 = (_QWORD *)a2[11];
      if (!v8)
        break;
      a2[11] = *v8;
      _domain_item_free(v8);
    }
    _mdns_dns_service_manager_fetch_doh_pvd(a2);
  }
  return 1;
}

void mdns_dns_service_manager_apply_pending_updates(uint64_t a1)
{
  _QWORD block[5];

  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_apply_pending_updates_block_invoke;
  block[3] = &__block_descriptor_tmp_39;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
}

void __mdns_dns_service_manager_apply_pending_updates_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void **v34;
  void *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, _QWORD *);
  void *v38;
  void **v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 131))
  {
    v3 = (void *)MEMORY[0x24BDAC760];
    v30 = (void *)MEMORY[0x24BDAC760];
    v31 = 0x40000000;
    v32 = ___mdns_dns_service_manager_remove_unused_services_block_invoke;
    v33 = &__block_descriptor_tmp_99;
    v34 = (void **)v2;
    v35 = (void *)MEMORY[0x24BDAC760];
    v36 = 0x40000000;
    v37 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v38 = &unk_24F285680;
    v39 = &v30;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v2, (uint64_t)&v35);
    v4 = *(_QWORD *)(a1 + 32);
    v35 = v3;
    v36 = 0x40000000;
    v37 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v38 = &unk_24F285680;
    v39 = (void **)&__block_literal_global_130;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v4, (uint64_t)&v35);
    v5 = *(_QWORD *)(a1 + 32);
    v21 = v3;
    v22 = 0x40000000;
    v23 = ___mdns_dns_service_manager_handle_pending_alts_block_invoke;
    v24 = &__block_descriptor_tmp_134;
    v25 = (uint64_t *)v5;
    v30 = v3;
    v31 = 0x40000000;
    v32 = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
    v33 = &unk_24F2856A8;
    v34 = &v21;
    v35 = v3;
    v36 = 0x40000000;
    v37 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v38 = &unk_24F285680;
    v39 = &v30;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v5, (uint64_t)&v35);
    v6 = *(_QWORD *)(a1 + 32);
    v30 = v3;
    v31 = 0x40000000;
    v32 = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
    v33 = &unk_24F2856A8;
    v34 = (void **)&__block_literal_global_101;
    v35 = v3;
    v36 = 0x40000000;
    v37 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v38 = &unk_24F285680;
    v39 = &v30;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v6, (uint64_t)&v35);
    v7 = *(_QWORD *)(a1 + 32);
    v30 = v3;
    v31 = 0x40000000;
    v32 = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
    v33 = &unk_24F2856A8;
    v34 = (void **)&__block_literal_global_120;
    v35 = v3;
    v36 = 0x40000000;
    v37 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v38 = &unk_24F285680;
    v39 = &v30;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v7, (uint64_t)&v35);
    _mdns_dns_service_manager_remove_unneeded_interface_monitors(*(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(a1 + 32);
    v21 = v3;
    v22 = 0x40000000;
    v23 = ___mdns_dns_service_manager_update_interface_properties_block_invoke;
    v24 = &__block_descriptor_tmp_117;
    v25 = (uint64_t *)v8;
    v30 = v3;
    v31 = 0x40000000;
    v32 = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
    v33 = &unk_24F2856A8;
    v34 = &v21;
    v35 = v3;
    v36 = 0x40000000;
    v37 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v38 = &unk_24F285680;
    v39 = &v30;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v8, (uint64_t)&v35);
    v9 = *(_QWORD *)(a1 + 32);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2000000000;
    v29 = 0;
    v21 = v3;
    v22 = 0x40000000;
    v23 = ___mdns_dns_service_manager_update_policies_block_invoke;
    v24 = &unk_24F2850F0;
    v25 = &v26;
    v30 = v3;
    v31 = 0x40000000;
    v32 = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
    v33 = &unk_24F2856A8;
    v34 = &v21;
    v35 = v3;
    v36 = 0x40000000;
    v37 = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v38 = &unk_24F285680;
    v39 = &v30;
    _mdns_dns_service_manager_enumerate_all_service_array_pointers(v9, (uint64_t)&v35);
    v10 = *(void **)(v9 + 112);
    if (*((_BYTE *)v27 + 24))
    {
      if (!v10)
      {
        v11 = (void *)MEMORY[0x22E2D174C]();
        if (objc_opt_class())
        {
          v12 = (void *)objc_msgSend(objc_alloc((Class)&off_255A73AC0), "initFromPrivilegedProcess");
          objc_msgSend(v12, "setPriority:", 500);
          v13 = objc_alloc((Class)&off_255A73BC0);
          v14 = (void *)objc_msgSend(v13, "initWithUUIDBytes:", MEMORY[0x24BDAF020]);
          unk_255A73E3C(&off_255A742B8, "removeNetworkAgentUUID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc((Class)&off_255A744E0);
          unk_255A74C70(&off_255A75750, "allInterfaces");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v17;
          unk_255A74D54(&off_255A75750, "flowRemoteAddressEmpty");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (uint64_t)v18;
          +[NSArray arrayWithObjects:count:](&off_255A70FF8, "arrayWithObjects:count:", &v35, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v16, "initWithOrder:result:conditions:", 0, v15, v19);
          objc_msgSend(v12, "addPolicy:", v20);

          objc_msgSend(v12, "apply");
        }
        else
        {
          v12 = 0;
        }
        objc_autoreleasePoolPop(v11);
        goto LABEL_9;
      }
    }
    else if (v10)
    {
      mdns_system_remove_network_policy(v10);
      v12 = 0;
LABEL_9:
      *(_QWORD *)(v9 + 112) = v12;
    }
    _Block_object_dispose(&v26, 8);
  }
}

uint64_t ___mdns_dns_service_manager_remove_unused_services_block_invoke(uint64_t a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v5;
  _DWORD *ValueAtIndex;

  Count = CFArrayGetCount(theArray);
  if (Count - 1 >= 0)
  {
    v5 = Count;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, --v5);
      if (!ValueAtIndex[66])
      {
        _mdns_dns_service_manager_terminate_service(*(_QWORD *)(a1 + 32), (uint64_t)ValueAtIndex);
        CFArrayRemoveValueAtIndex(theArray, v5);
      }
    }
    while (v5 > 0);
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_pending_alts_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  uint64_t v5;
  const __CFArray *v6;
  const void *v7;
  _QWORD v9[6];

  if (*(_BYTE *)(a2 + 287))
  {
    *(_BYTE *)(a2 + 287) = 0;
    v4 = *(const __CFArray **)(a2 + 152);
    if (v4)
    {
      if (CFArrayGetCount(v4) >= 1)
      {
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 0x40000000;
        v9[2] = ___mdns_dns_service_manager_handle_pending_alts_block_invoke_2;
        v9[3] = &__block_descriptor_tmp_133;
        v5 = *(_QWORD *)(a1 + 32);
        v9[4] = a2;
        v9[5] = v5;
        v6 = *(const __CFArray **)(a2 + 144);
        if (v6)
        {
          mdns_cfarray_enumerate(v6, (uint64_t)v9);
          v7 = *(const void **)(a2 + 144);
          if (v7)
            CFRelease(v7);
        }
        *(_QWORD *)(a2 + 144) = *(_QWORD *)(a2 + 152);
        *(_QWORD *)(a2 + 152) = 0;
      }
    }
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_update_interface_properties_block_invoke(uint64_t a1, uint64_t a2)
{
  _mdns_dns_service_manager_update_interface_properties_for_service(*(CFArrayRef **)(a1 + 32), a2);
  return 1;
}

BOOL ___mdns_dns_service_manager_update_policies_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t preferred_encrypted_alt;

  preferred_encrypted_alt = _mdns_dns_service_get_preferred_encrypted_alt(a2, 1);
  if (preferred_encrypted_alt)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return preferred_encrypted_alt == 0;
}

uint64_t ___mdns_dns_service_manager_update_nw_config_data_block_invoke(uint64_t a1, uint64_t a2)
{
  _mdns_dns_service_update_nw_config_data(a2);
  return 1;
}

uint64_t ___mdns_dns_service_manager_update_service_usability_block_invoke(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  __int16 v3;

  v2 = *(_WORD *)(a2 + 276);
  if (*(_BYTE *)(a2 + 283))
  {
    if ((*(_WORD *)(a2 + 276) & 0x800) == 0)
    {
      v3 = v2 | 0x800;
LABEL_6:
      *(_WORD *)(a2 + 276) = v3;
    }
  }
  else if ((*(_WORD *)(a2 + 276) & 0x800) != 0)
  {
    v3 = v2 & 0xF7FF;
    goto LABEL_6;
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_pending_alts_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v8;
  BOOL (*v9)(uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 152);
  *(_QWORD *)&v8 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v8 + 1) = 0x40000000;
  v9 = ___mdns_dns_service_array_contains_service_block_invoke;
  v10 = &__block_descriptor_tmp_135;
  v11 = a2;
  if (mdns_cfarray_enumerate(v4, (uint64_t)&v8))
  {
    _mdns_dns_service_manager_terminate_service(*(_QWORD *)(a1 + 40), a2);
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v5 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a2 + 24);
      LODWORD(v8) = 134217984;
      *(_QWORD *)((char *)&v8 + 4) = v6;
      _os_log_impl(&dword_22983F000, v5, OS_LOG_TYPE_INFO, "Deregistered discovered service -- id: %llu", (uint8_t *)&v8, 0xCu);
    }
  }
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_network_changes_block_invoke(uint64_t a1, const __CFArray *a2)
{
  mdns_cfarray_enumerate(a2, (uint64_t)&__block_literal_global_132);
  return 1;
}

uint64_t ___mdns_dns_service_manager_handle_network_changes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  _BYTE *ValueAtIndex;

  if (*(_BYTE *)(a2 + 286))
  {
    *(_BYTE *)(a2 + 286) = 0;
    _mdns_dns_service_make_defunct(a2);
  }
  v3 = *(const __CFArray **)(a2 + 128);
  if (v3)
  {
    Count = CFArrayGetCount(v3);
    if (Count - 1 >= 0)
    {
      v5 = Count;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 128), --v5);
        if (ValueAtIndex[286])
        {
          ValueAtIndex[286] = 0;
          _mdns_dns_service_make_defunct((uint64_t)ValueAtIndex);
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a2 + 128), v5);
        }
      }
      while (v5 > 0);
    }
  }
  return 1;
}

uint64_t mdns_dns_service_manager_enumerate(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_dns_service_manager_enumerate_block_invoke;
  block[3] = &unk_24F284AE8;
  block[5] = &v7;
  block[6] = a1;
  block[4] = a2;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, block);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __mdns_dns_service_manager_enumerate_block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  result = a1[6];
  if (*(_BYTE *)(result + 131))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    v3 = a1[4];
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___mdns_dns_service_manager_enumerate_all_services_block_invoke;
    v4[3] = &unk_24F2856A8;
    v4[4] = v3;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v5[3] = &unk_24F285680;
    v5[4] = v4;
    result = _mdns_dns_service_manager_enumerate_all_service_array_pointers(result, (uint64_t)v5);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  }
  return result;
}

uint64_t mdns_dns_service_manager_get_count(uint64_t a1)
{
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
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __mdns_dns_service_manager_get_count_block_invoke;
  v4[3] = &unk_24F284B60;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __mdns_dns_service_manager_get_count_block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[5];
  _QWORD v4[5];

  result = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(result + 131))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 0x40000000;
    v3[2] = __mdns_dns_service_manager_get_count_block_invoke_2;
    v3[3] = &unk_24F284B38;
    v3[4] = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___mdns_dns_service_manager_enumerate_all_service_arrays_block_invoke;
    v4[3] = &unk_24F285680;
    v4[4] = v3;
    return _mdns_dns_service_manager_enumerate_all_service_array_pointers(result, (uint64_t)v4);
  }
  return result;
}

uint64_t __mdns_dns_service_manager_get_count_block_invoke_2(uint64_t a1, const __CFArray *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __mdns_dns_service_manager_get_count_block_invoke_3;
  v3[3] = &unk_24F284B10;
  v3[4] = *(_QWORD *)(a1 + 32);
  mdns_cfarray_enumerate(a2, (uint64_t)v3);
  return 1;
}

uint64_t __mdns_dns_service_manager_get_count_block_invoke_3(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  CFIndex Count;
  const __CFArray *v6;
  CFIndex v7;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = *(const __CFArray **)(a2 + 128);
  if (v4)
  {
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += Count;
  }
  v6 = *(const __CFArray **)(a2 + 144);
  if (v6)
  {
    v7 = CFArrayGetCount(v6);
    if (v7 >= 1)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v7;
  }
  return 1;
}

void mdns_dns_service_manager_handle_sleep(uint64_t a1)
{
  mdns_dns_service_manager_enumerate(a1, (uint64_t)&__block_literal_global_47);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, &__block_literal_global_1378);
}

uint64_t __mdns_dns_service_manager_handle_sleep_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (*(unsigned __int8 *)(a2 + 281) - 2 <= 2)
  {
    v3 = *(void **)(a2 + 64);
    if (v3)
    {
      mdns_resolver_invalidate(v3);
      os_release(*(void **)(a2 + 64));
      *(_QWORD *)(a2 + 64) = 0;
      *(_BYTE *)(a2 + 285) = 1;
    }
  }
  return 1;
}

uint64_t mdns_dns_service_manager_handle_wake(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 0x40000000;
  v2[2] = __mdns_dns_service_manager_handle_wake_block_invoke;
  v2[3] = &__block_descriptor_tmp_48;
  v2[4] = a1;
  return mdns_dns_service_manager_enumerate(a1, (uint64_t)v2);
}

uint64_t __mdns_dns_service_manager_handle_wake_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 285))
  {
    _mdns_dns_service_manager_prepare_service(*(_QWORD *)(a1 + 32), a2);
    *(_BYTE *)(a2 + 285) = 0;
  }
  return 1;
}

uint64_t mdns_dns_service_set_context(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 112) = a2;
  return result;
}

uint64_t mdns_dns_service_get_context(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

uint64_t mdns_dns_service_set_context_finalizer(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 120) = a2;
  return result;
}

_QWORD *mdns_dns_service_create_querier(uint64_t a1, int *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  if (v2)
    return mdns_resolver_create_querier(v2, a2);
  if (a2)
    *a2 = -6720;
  return 0;
}

uint64_t mdns_dns_service_get_scope(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 280);
}

uint64_t mdns_dns_service_get_interface_index(uint64_t a1)
{
  return *(unsigned int *)(a1 + 256);
}

uint64_t mdns_dns_service_get_id(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t mdns_dns_service_is_defunct(uint64_t a1)
{
  return *(_WORD *)(a1 + 276) & 1;
}

BOOL mdns_dns_service_is_encrypted(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 281) - 2 < 4;
}

uint64_t mdns_dns_service_a_queries_advised(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 1) & 1;
}

uint64_t mdns_dns_service_aaaa_queries_advised(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 2) & 1;
}

uint64_t mdns_dns_service_has_connection_problems(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 11) & 1;
}

uint64_t mdns_dns_service_interface_has_ipv4_connectivity(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 4) & 1;
}

uint64_t mdns_dns_service_interface_has_ipv6_connectivity(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 5) & 1;
}

uint64_t mdns_dns_service_interface_is_cellular(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 3) & 1;
}

uint64_t mdns_dns_service_interface_is_expensive(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 6) & 1;
}

uint64_t mdns_dns_service_interface_is_constrained(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 7) & 1;
}

uint64_t mdns_dns_service_interface_is_clat46(uint64_t a1)
{
  return HIBYTE(*(unsigned __int16 *)(a1 + 276)) & 1;
}

uint64_t mdns_dns_service_interface_is_vpn(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 276) >> 9) & 1;
}

uint64_t mdns_dns_service_get_resolver_type(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 281) - 1) > 3u)
    return 0;
  else
    return dword_229870A30[(*(_BYTE *)(a1 + 281) - 1)];
}

uint64_t mdns_dns_service_allows_failover(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 96);
  if (result)
    return nw_resolver_config_get_allow_failover();
  return result;
}

BOOL mdns_dns_service_is_native(uint64_t a1)
{
  return *(_BYTE *)(a1 + 282) == 1;
}

void *_mdns_dns_service_definition_copy_description(uint64_t a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  const char *v9;
  int appended;
  int v11;
  int v12;
  void *v13;
  int v14;
  const __CFArray *v16;
  uint64_t v17;
  int v18;
  int v19;
  const __CFSet *v20;
  int v21;
  uint64_t v22;
  _QWORD v23[7];
  char v24;
  _QWORD v25[7];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;

  v31 = 0;
  v32 = &v31;
  v33 = 0x2000000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2000000000;
  v30 = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (!a2
      || (v8 = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1), (*((_DWORD *)v32 + 6) = v8) == 0))
    {
      v9 = *(const char **)(a1 + 40);
      if (!v9)
        v9 = "";
      appended = mdns_string_builder_append_formatted(v7, "interface: %s/%u, interface scope: ", v9, *(_DWORD *)(a1 + 48));
      *((_DWORD *)v32 + 6) = appended;
      if (!appended)
      {
        v11 = *(unsigned __int8 *)(a1 + 52);
        if (v11 == 2)
        {
          v12 = mdns_string_builder_append_formatted(v7, "unscoped+scoped", v22);
        }
        else if (v11 == 1)
        {
          v12 = mdns_string_builder_append_formatted(v7, "scoped");
        }
        else
        {
          v12 = *(_BYTE *)(a1 + 52)
              ? mdns_string_builder_append_formatted(v7, "«INVALID %d»")
              : mdns_string_builder_append_formatted(v7, "unscoped", v22);
        }
        *((_DWORD *)v32 + 6) = v12;
        if (!v12)
        {
          v14 = mdns_string_builder_append_formatted(v7, ", addresses: {");
          *((_DWORD *)v32 + 6) = v14;
          if (!v14)
          {
            v28[3] = 0;
            v16 = *(const __CFArray **)(a1 + 24);
            v17 = MEMORY[0x24BDAC760];
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 0x40000000;
            v25[2] = ___mdns_dns_service_definition_copy_description_block_invoke;
            v25[3] = &unk_24F285780;
            v25[4] = &v31;
            v25[5] = &v27;
            v25[6] = v7;
            v26 = a3;
            mdns_cfarray_enumerate(v16, (uint64_t)v25);
            v13 = 0;
            if (*((_DWORD *)v32 + 6))
              goto LABEL_18;
            v18 = mdns_string_builder_append_formatted(v7, "}");
            *((_DWORD *)v32 + 6) = v18;
            if (!v18)
            {
              v19 = mdns_string_builder_append_formatted(v7, ", domains: {");
              *((_DWORD *)v32 + 6) = v19;
              if (!v19)
              {
                v28[3] = 0;
                v20 = *(const __CFSet **)(a1 + 32);
                v23[0] = v17;
                v23[1] = 0x40000000;
                v23[2] = ___mdns_dns_service_definition_copy_description_block_invoke_2;
                v23[3] = &unk_24F2857A8;
                v23[4] = &v31;
                v23[5] = &v27;
                v23[6] = v7;
                v24 = a3;
                mdns_cfset_enumerate(v20, (uint64_t)v23);
                if (!*((_DWORD *)v32 + 6))
                {
                  v21 = mdns_string_builder_append_formatted(v7, "}");
                  *((_DWORD *)v32 + 6) = v21;
                  if (!v21)
                  {
                    v13 = mdns_string_builder_copy_string((uint64_t)v7);
                    goto LABEL_18;
                  }
                }
              }
            }
          }
        }
      }
    }
    v13 = 0;
LABEL_18:
    os_release(v7);
    goto LABEL_19;
  }
  v13 = 0;
LABEL_19:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  return v13;
}

void _mdns_dns_service_definition_finalize(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  void *v4;

  v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  v4 = (void *)a1[5];
  if (v4)
  {
    free(v4);
    a1[5] = 0;
  }
}

BOOL ___mdns_dns_service_definition_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mdns_dns_service_definition_copy_description_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

_QWORD *mdns_dns_service_definition_create()
{
  uint64_t v0;
  _QWORD *v1;
  _UNKNOWN **v2;
  void (*v3)(_QWORD *);
  const __CFAllocator *v4;
  CFMutableArrayRef Mutable;
  CFMutableSetRef v6;

  v0 = _os_object_alloc();
  v1 = (_QWORD *)v0;
  if (v0)
  {
    v2 = &_mdns_dns_service_definition_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_dns_service_definition_kind;
    do
    {
      v3 = (void (*)(_QWORD *))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
    v1[3] = Mutable;
    if (!Mutable || (v6 = CFSetCreateMutable(v4, 0, &mdns_domain_name_cf_set_callbacks), (v1[4] = v6) == 0))
    {
      os_release(v1);
      return 0;
    }
  }
  return v1;
}

void mdns_dns_service_definition_set_interface_index(uint64_t a1, unsigned int a2, char a3)
{
  void *v4;

  *(_BYTE *)(a1 + 52) = a3;
  if (*(_DWORD *)(a1 + 48) != a2)
  {
    *(_DWORD *)(a1 + 48) = a2;
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      free(v4);
      *(_QWORD *)(a1 + 40) = 0;
      a2 = *(_DWORD *)(a1 + 48);
    }
  }
  if (a2)
  {
    if (!*(_QWORD *)(a1 + 40))
      *(_QWORD *)(a1 + 40) = mdns_system_interface_index_to_name(a2);
  }
  else
  {
    *(_BYTE *)(a1 + 52) = 0;
  }
}

uint64_t mdns_dns_service_definition_append_server_address(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 24), a2);
  return 0;
}

uint64_t mdns_dns_service_definition_add_domain(uint64_t a1, const void *a2)
{
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), a2);
  return 0;
}

id _mdns_heuristics_log()
{
  if (_mdns_heuristics_log_s_once != -1)
    dispatch_once(&_mdns_heuristics_log_s_once, &__block_literal_global_36);
  return (id)_mdns_heuristics_log_s_log;
}

void ___mdns_heuristics_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mdns", "heuristics");
  v1 = (void *)_mdns_heuristics_log_s_log;
  _mdns_heuristics_log_s_log = (uint64_t)v0;

}

id getHeuristicsQueue()
{
  if (getHeuristicsQueue_onceToken != -1)
    dispatch_once(&getHeuristicsQueue_onceToken, &__block_literal_global_39);
  return (id)getHeuristicsQueue_queue;
}

void __dns_heuristics_report_resolution_failure_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _mdns_heuristics_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_22983F000, v2, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_failure %@ %d", (uint8_t *)&v6, 0x12u);
  }

  v5 = (void *)MEMORY[0x22E2D174C]();
  +[DNSHeuristics reportResolutionFailure:isTimeout:](DNSHeuristics, "reportResolutionFailure:isTimeout:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  objc_autoreleasePoolPop(v5);
}

void __getHeuristicsQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DNSHeuristicsQueue", 0);
  v1 = (void *)getHeuristicsQueue_queue;
  getHeuristicsQueue_queue = (uint64_t)v0;

}

void __dns_heuristics_report_resolution_success_block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  _mdns_heuristics_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22983F000, v0, OS_LOG_TYPE_DEFAULT, "dns_heuristics_report_resolution_success", v2, 2u);
  }

  v1 = (void *)MEMORY[0x22E2D174C]();
  +[DNSHeuristics updateHeuristicState:isTimeout:](DNSHeuristics, "updateHeuristicState:isTimeout:", 1, 0);
  objc_autoreleasePoolPop(v1);
}

uint64_t DNSMessageExtractDomainName(unint64_t a1, uint64_t a2, char *__src, char *__dst, _QWORD *a5)
{
  char *v6;
  uint64_t result;
  unint64_t v8;
  _BYTE *v10;
  unsigned int v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;

  if (__dst)
    v6 = __dst + 256;
  else
    v6 = 0;
  result = 4294960586;
  if ((unint64_t)__src < a1)
    return result;
  v8 = a1 + a2;
  if (a1 + a2 <= (unint64_t)__src)
    return result;
  v10 = __dst;
  v11 = *__src;
  if (*__src)
  {
    v12 = 0;
    do
    {
      if (v11 > 0x3F)
      {
        if ((~v11 & 0xC0) != 0)
          return 4294960554;
        if ((uint64_t)(v8 - (_QWORD)__src) < 2)
          return 4294960546;
        if (!v12)
        {
          v12 = __src + 2;
          if (!v10)
            goto LABEL_23;
        }
        __src = (char *)(a1 + (__src[1] | ((unint64_t)(v11 & 0x3F) << 8)));
        if ((unint64_t)__src >= v8)
          return 4294960546;
        v11 = *__src;
        if (v11 > 0xBF)
          return 4294960554;
      }
      else
      {
        v13 = &__src[v11 + 1];
        if ((unint64_t)v13 >= v8)
          return 4294960546;
        if (v10)
        {
          v14 = v11 + 1;
          if (v6 - v10 <= v14)
            return 4294960545;
          memcpy(v10, __src, v11 + 1);
          v10 += v14;
        }
        v11 = *v13;
        __src = v13;
      }
    }
    while (v11);
    if (!v10)
      goto LABEL_23;
    goto LABEL_22;
  }
  v12 = 0;
  if (__dst)
LABEL_22:
    *v10 = 0;
LABEL_23:
  result = 0;
  if (a5)
  {
    if (v12)
      v15 = v12;
    else
      v15 = __src + 1;
    *a5 = v15;
  }
  return result;
}

uint64_t DNSMessageExtractDomainNameString(unint64_t a1, uint64_t a2, char *a3, unsigned __int8 *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v8;
  unsigned __int8 __dst[256];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!(_DWORD)result)
  {
    result = DomainNameToString(__dst, 0, a4, 0);
    if (a5)
    {
      if (!(_DWORD)result)
        *a5 = v8;
    }
  }
  return result;
}

uint64_t DomainNameToString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, _QWORD *a4)
{
  uint64_t i;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  char v10;
  char v11;
  uint64_t result;

  if (a2 && (uint64_t)(a2 - (_QWORD)a1) < 1)
    return 4294960546;
  LODWORD(i) = *a1;
  if (*a1)
  {
    v5 = a1;
    do
    {
      if (i > 0x3F)
        return 4294960554;
      v6 = &v5[i + 1];
      if (v6 - a1 > 255)
        return 4294960554;
      if (a2 && (unint64_t)v6 >= a2)
        return 4294960546;
      v7 = v5 + 1;
      if (v7 < v6)
      {
        for (i = i; i; --i)
        {
          v8 = *v7;
          if (((char)*v7 - 32) > 0x5E)
          {
            if ((*v7 & 0x80) == 0)
            {
              *a3 = 92;
              if (v8 <= 0x63u)
                v10 = 48;
              else
                v10 = 49;
              a3[1] = v10;
              if (v8 >= 0x64u)
                v11 = v8 / 0xAu - 10;
              else
                v11 = v8 / 0xAu;
              a3[2] = v11 + 48;
              a3[3] = (v8 % 0xAu) | 0x30;
              a3 += 4;
              goto LABEL_26;
            }
          }
          else if (*v7 - 32 <= 0x3C && ((1 << (v8 - 32)) & 0x1000000000004001) != 0)
          {
            *a3++ = 92;
          }
          *a3++ = v8;
LABEL_26:
          ++v7;
        }
      }
      *a3++ = 46;
      LODWORD(i) = *v6;
      v5 = v6;
    }
    while (*v6);
    if (v6 != a1)
      goto LABEL_30;
  }
  *a3++ = 46;
  v6 = a1;
LABEL_30:
  *a3 = 0;
  result = 0;
  if (a4)
    *a4 = v6 + 1;
  return result;
}

uint64_t DNSMessageExtractQuestion(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _QWORD *a7)
{
  uint64_t result;
  unsigned __int16 *v13;
  unsigned __int16 *v14;

  v14 = 0;
  result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v14);
  if (!(_DWORD)result)
  {
    v13 = v14;
    if (a1 + a2 - (unint64_t)v14 < 4)
    {
      return 4294960546;
    }
    else
    {
      if (a5)
        *a5 = bswap32(*v14) >> 16;
      if (a6)
        *a6 = bswap32(v13[1]) >> 16;
      result = 0;
      if (a7)
        *a7 = v13 + 2;
    }
  }
  return result;
}

uint64_t DNSMessageExtractRecord(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, _QWORD *a10)
{
  return _DNSMessageExtractRecordEx(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0, 0, a10);
}

uint64_t _DNSMessageExtractRecordEx(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, char *a10, unint64_t a11, size_t *a12, unint64_t *a13, _QWORD *a14)
{
  uint64_t result;
  char *v20;
  unsigned __int16 *v21;
  unint64_t v22;
  unint64_t *v23;
  unsigned int v24;
  size_t v25;
  unint64_t v26;
  _WORD *v27;
  _DWORD *v28;
  _BYTE *v29;
  int v30;
  char *v31;
  char *v32;
  int v33;
  char *v34;
  int v35;
  char *v36;
  char *v37;
  int v38;
  int v39;
  char *v40;
  char *v41;
  int v42;
  unint64_t v43;
  int v44;
  char *v45;
  char *v46;
  int v47;
  int64_t v48;
  unint64_t v49;
  size_t v50;
  char *v51;
  char *v52;
  size_t v53;
  char *v54;
  int64_t v55;
  unint64_t v56;
  BOOL v57;
  uint64_t v58;
  int v59;
  char *v60;
  char *v61;
  int v62;
  int64_t v63;
  int v64;
  char *v65;
  char *v66;
  int v67;
  unint64_t v68;
  size_t v69;
  char *v70;
  size_t v71;
  char *v72;
  size_t v73;
  char *v74;
  const void *v75;
  int v76;
  char *v77;
  char *v78;
  int v79;
  char *v80;
  int v81;
  char *v82;
  char *v83;
  int v84;
  size_t v85;
  size_t v86;
  char *v87;
  size_t v88;
  int64_t v89;
  char *v90;
  char *v91;
  char *v92;
  void *v93;
  void *__dst;
  unsigned __int16 **v95;
  __int16 v96;
  _DWORD *v97;
  char *v99;
  void *v100;
  char v101[256];
  char __src[256];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v99 = 0;
  result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v99);
  if (!(_DWORD)result)
  {
    v20 = v99;
    if (a1 + a2 - (unint64_t)v99 < 0xA)
      return 4294960546;
    v21 = (unsigned __int16 *)(v99 + 10);
    v22 = __rev16(*((unsigned __int16 *)v99 + 4));
    if (a1 + a2 - (unint64_t)(v99 + 10) < v22)
    {
      return 4294960546;
    }
    else
    {
      v97 = a7;
      v23 = a13;
      v24 = __rev16(*(unsigned __int16 *)v99);
      if (a11 || a13)
      {
        v100 = 0;
        v96 = v24;
        v29 = (char *)v21 + v22;
        switch(v24)
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 7u:
          case 8u:
          case 9u:
          case 0xCu:
          case 0x27u:
            result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!(_DWORD)result)
            {
              if (v100 != v29)
                goto LABEL_105;
              v30 = __src[0];
              v31 = __src;
              if (__src[0])
              {
                do
                {
                  v32 = &v31[v30];
                  v33 = v32[1];
                  v31 = v32 + 1;
                  v30 = v33;
                }
                while (v33);
              }
              v26 = v31 - __src + 1;
              if (v26 < a11)
                v25 = v31 - __src + 1;
              else
                v25 = a11;
              memcpy(a10, __src, v25);
              v23 = a13;
              goto LABEL_102;
            }
            break;
          case 6u:
            result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!(_DWORD)result)
            {
              result = DNSMessageExtractDomainName(a1, a2, (char *)v100, v101, &v100);
              if (!(_DWORD)result)
              {
                if (v29 - (_BYTE *)v100 != 20)
                  goto LABEL_105;
                v59 = __src[0];
                v60 = __src;
                if (__src[0])
                {
                  do
                  {
                    v61 = &v60[v59];
                    v62 = v61[1];
                    v60 = v61 + 1;
                    v59 = v62;
                  }
                  while (v62);
                }
                v63 = v60 - __src;
                v64 = v101[0];
                v95 = a8;
                v90 = &a10[a11];
                v93 = v100;
                v65 = v101;
                if (v101[0])
                {
                  do
                  {
                    v66 = &v65[v64];
                    v67 = v66[1];
                    v65 = v66 + 1;
                    v64 = v67;
                  }
                  while (v67);
                }
                v89 = v65 - v101;
                v68 = v65 - v101 + 1;
                v26 = v63 + v68 + 21;
                if (v63 + 1 >= a11)
                  v69 = a11;
                else
                  v69 = v63 + 1;
                v51 = a10;
                memcpy(a10, __src, v69);
                v70 = &a10[v69];
                if (v90 - v70 >= v68)
                  v71 = v89 + 1;
                else
                  v71 = v90 - v70;
                memcpy(v70, v101, v71);
                v72 = &v70[v71];
                if ((unint64_t)(v90 - v72) >= 0x14)
                  v73 = 20;
                else
                  v73 = v90 - v72;
                v74 = v72;
                v75 = v93;
                goto LABEL_91;
              }
            }
            break;
          case 0xEu:
          case 0x11u:
          case 0x1Au:
            result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!(_DWORD)result)
            {
              result = DNSMessageExtractDomainName(a1, a2, (char *)v100, v101, &v100);
              if (!(_DWORD)result)
              {
                if (v100 != v29)
                  goto LABEL_105;
                v39 = __src[0];
                v40 = __src;
                if (__src[0])
                {
                  do
                  {
                    v41 = &v40[v39];
                    v42 = v41[1];
                    v40 = v41 + 1;
                    v39 = v42;
                  }
                  while (v42);
                }
                v92 = &a10[a11];
                v43 = v40 - __src + 1;
                v44 = v101[0];
                v95 = a8;
                v45 = v101;
                if (v101[0])
                {
                  do
                  {
                    v46 = &v45[v44];
                    v47 = v46[1];
                    v45 = v46 + 1;
                    v44 = v47;
                  }
                  while (v47);
                }
                v48 = v45 - v101;
                v49 = v45 - v101 + 1;
                v26 = v49 + v43;
                if (v43 >= a11)
                  v50 = a11;
                else
                  v50 = v40 - __src + 1;
                v51 = a10;
                memcpy(a10, __src, v50);
                v52 = &a10[v50];
                if (v92 - v52 >= v49)
                  v53 = v48 + 1;
                else
                  v53 = v92 - v52;
                v54 = v101;
                goto LABEL_100;
              }
            }
            break;
          case 0xFu:
          case 0x12u:
          case 0x15u:
          case 0x24u:
            if (v22 < 3)
              goto LABEL_105;
            result = DNSMessageExtractDomainName(a1, a2, v99 + 12, __src, &v100);
            if (!(_DWORD)result)
            {
              if (v100 != v29)
                goto LABEL_105;
              v34 = a10;
              v35 = __src[0];
              v95 = a8;
              v91 = &a10[a11];
              v36 = __src;
              if (__src[0])
              {
                do
                {
                  v37 = &v36[v35];
                  v38 = v37[1];
                  v36 = v37 + 1;
                  v35 = v38;
                }
                while (v38);
              }
              v55 = v36 - __src;
              v56 = v36 - __src + 1;
              v26 = v36 - __src + 3;
              v57 = a11 >= 2;
              v58 = 2;
              goto LABEL_93;
            }
            break;
          case 0x21u:
            if (v22 < 7)
              goto LABEL_105;
            result = DNSMessageExtractDomainName(a1, a2, v99 + 16, __src, &v100);
            if (!(_DWORD)result)
            {
              if (v100 != v29)
                goto LABEL_105;
              v34 = a10;
              v76 = __src[0];
              v95 = a8;
              v91 = &a10[a11];
              v77 = __src;
              if (__src[0])
              {
                do
                {
                  v78 = &v77[v76];
                  v79 = v78[1];
                  v77 = v78 + 1;
                  v76 = v79;
                }
                while (v79);
              }
              v55 = v77 - __src;
              v56 = v77 - __src + 1;
              v26 = v77 - __src + 7;
              v57 = a11 >= 6;
              v58 = 6;
LABEL_93:
              if (v57)
                v88 = v58;
              else
                v88 = a11;
              v51 = v34;
              memcpy(v34, v20 + 10, v88);
              v52 = &v51[v88];
              if (v91 - v52 >= v56)
                v53 = v55 + 1;
              else
                v53 = v91 - v52;
              v54 = __src;
LABEL_100:
              memcpy(v52, v54, v53);
              v87 = &v52[v53];
              goto LABEL_101;
            }
            break;
          case 0x2Fu:
            result = DNSMessageExtractDomainName(a1, a2, v99 + 10, __src, &v100);
            if (!(_DWORD)result)
            {
              if (v100 <= v29)
              {
                v80 = &a10[a11];
                v81 = __src[0];
                v95 = a8;
                v82 = __src;
                if (__src[0])
                {
                  do
                  {
                    v83 = &v82[v81];
                    v84 = v83[1];
                    v82 = v83 + 1;
                    v81 = v84;
                  }
                  while (v84);
                }
                v85 = v29 - (_BYTE *)v100;
                v26 = v82 - __src + 1 + v29 - (_BYTE *)v100;
                if (v82 - __src + 1 < a11)
                  v86 = v82 - __src + 1;
                else
                  v86 = a11;
                __dst = v100;
                v51 = a10;
                memcpy(a10, __src, v86);
                v72 = &a10[v86];
                if (v80 - v72 >= v85)
                  v73 = v85;
                else
                  v73 = v80 - v72;
                v74 = v72;
                v75 = __dst;
LABEL_91:
                memcpy(v74, v75, v73);
                v87 = &v72[v73];
LABEL_101:
                v25 = v87 - v51;
                a8 = v95;
                goto LABEL_102;
              }
LABEL_105:
              result = 4294960554;
            }
            break;
          default:
            if (a11 >= v22)
              v25 = v22;
            else
              v25 = a11;
            memcpy(a10, v99 + 10, v25);
            v26 = v22;
LABEL_102:
            v28 = v97;
            v27 = a6;
            LOWORD(v24) = v96;
            if (!a5)
              goto LABEL_8;
            goto LABEL_7;
        }
      }
      else
      {
        v25 = 0;
        v26 = 0;
        v28 = a7;
        v27 = a6;
        if (a5)
LABEL_7:
          *a5 = v24;
LABEL_8:
        if (v27)
          *v27 = bswap32(*((unsigned __int16 *)v20 + 1)) >> 16;
        if (v28)
          *v28 = bswap32(*((_DWORD *)v20 + 1));
        if (a8)
          *a8 = v21;
        if (a9)
          *a9 = v22;
        if (a12)
          *a12 = v25;
        if (v23)
          *v23 = v26;
        result = 0;
        if (a14)
          *a14 = (char *)v21 + v22;
      }
    }
  }
  return result;
}

uint64_t DomainNameLength(_BYTE *a1)
{
  int v1;
  _BYTE *v2;
  _BYTE *v3;
  int v4;

  v1 = *a1;
  v2 = a1;
  if (*a1)
  {
    v2 = a1;
    do
    {
      v3 = &v2[v1];
      v4 = v3[1];
      v2 = v3 + 1;
      v1 = v4;
    }
    while (v4);
  }
  return v2 - a1 + 1;
}

uint64_t DNSMessageGetAnswerSection(unint64_t a1, unint64_t a2, char **a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  char *v8;
  unint64_t v10;
  uint64_t result;
  _QWORD v12[9];

  if (a2 < 0xC)
    return 4294960553;
  v12[7] = v3;
  v12[8] = v4;
  v7 = __rev16(*(unsigned __int16 *)(a1 + 4));
  v8 = (char *)(a1 + 12);
  if (v7)
  {
    v10 = a1 + a2;
    while (1)
    {
      v12[0] = 0;
      result = DNSMessageExtractDomainName(a1, a2, v8, 0, v12);
      if ((_DWORD)result)
        break;
      if (v10 - v12[0] <= 3)
        return 4294960546;
      v8 = (char *)(v12[0] + 4);
      if (!--v7)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    result = 0;
    if (a3)
      *a3 = v8;
  }
  return result;
}

uint64_t DNSMessageGetOptRecord(unsigned __int16 *a1, unint64_t a2, char **a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unsigned int v14;
  __int16 v15;
  __int16 v16;
  int v17[2];

  *(_QWORD *)v17 = 0;
  result = DNSMessageGetAnswerSection((unint64_t)a1, a2, (char **)v17);
  if (!(_DWORD)result)
  {
    v9 = __rev16(a1[4]) + (bswap32(a1[3]) >> 16);
    if (v9)
    {
      while (1)
      {
        v16 = 0;
        LODWORD(result) = _DNSMessageExtractRecordEx((unint64_t)a1, a2, *(char **)v17, 0, &v16, 0, 0, 0, 0, 0, 0, 0, 0, v17);
        if ((_DWORD)result || v16 == 41)
          break;
        if (!--v9)
          goto LABEL_6;
      }
      if (v16 == 41)
        v14 = -6742;
      else
        v14 = 0;
      if ((_DWORD)result)
        return result;
      else
        return v14;
    }
    else
    {
LABEL_6:
      v10 = __rev16(a1[5]);
      if (v10)
      {
        v11 = 0;
        v12 = 0;
        while (1)
        {
          v15 = 0;
          v13 = *(char **)v17;
          result = _DNSMessageExtractRecordEx((unint64_t)a1, a2, *(char **)v17, 0, &v15, 0, 0, 0, 0, 0, 0, 0, 0, v17);
          if ((_DWORD)result)
            break;
          if (v15 == 41)
          {
            if (v12 || *v13)
              return 4294960554;
            v11 = *(_QWORD *)v17 - (_QWORD)v13;
            v12 = v13;
          }
          else
          {
            v13 = v12;
          }
          if (!--v10)
          {
            if (!a3)
              goto LABEL_17;
            goto LABEL_16;
          }
        }
      }
      else
      {
        v13 = 0;
        v11 = 0;
        if (a3)
LABEL_16:
          *a3 = v13;
LABEL_17:
        result = 0;
        if (a4)
          *a4 = v11;
      }
    }
  }
  return result;
}

uint64_t DNSMessageWriteQuery(__int16 a1, __int16 a2, _BYTE *__src, __int16 a4, __int16 a5, uint64_t a6, _QWORD *a7)
{
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t result;

  *(_WORD *)(a6 + 10) = 0;
  *(_DWORD *)(a6 + 6) = 0;
  *(_BYTE *)a6 = HIBYTE(a1);
  *(_BYTE *)(a6 + 1) = a1;
  *(_BYTE *)(a6 + 2) = HIBYTE(a2);
  *(_BYTE *)(a6 + 3) = a2;
  *(_WORD *)(a6 + 4) = 256;
  v11 = *__src;
  v12 = __src;
  if (*__src)
  {
    v12 = __src;
    do
    {
      v13 = &v12[v11];
      v14 = v13[1];
      v12 = v13 + 1;
      v11 = v14;
    }
    while (v14);
  }
  v15 = v12 - __src + 1;
  if (v15 > 0x100)
    return 4294960553;
  memcpy((void *)(a6 + 12), __src, v12 - __src + 1);
  v16 = (_BYTE *)(a6 + 12 + v15);
  *v16 = HIBYTE(a4);
  v16[1] = a4;
  v16[2] = HIBYTE(a5);
  v16[3] = a5;
  result = 0;
  if (a7)
    *a7 = v15 + 16;
  return result;
}

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, _QWORD *a3, uint64_t *a4)
{
  int DomainName;
  int v9;
  char *v10;
  char *v11;
  int v12;
  int64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  char v17;
  unsigned int v18;
  char *v19;
  char *v20;
  char *v21;
  char v22;
  unsigned int v23;
  char *v24;
  unsigned int v25;
  char v26;
  unsigned __int16 v27;
  __int16 v28;
  char *v29;
  char *v30;
  int v31;
  char *v32;
  char *v33;
  char v34;
  __int16 v35;
  char *v36;
  uint64_t *v38;
  unint64_t __n;
  char *v40;
  char v41;
  unsigned int v42;
  size_t size;
  unsigned int v44;
  unsigned __int16 v45;
  unsigned int v46;
  uint64_t v47;
  unsigned __int16 v48;
  char *v49;
  int v50;
  int v51[2];
  unsigned __int8 v52[256];
  unsigned __int8 __dst[256];
  char __src[256];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v51 = 0;
  v50 = 0;
  if (a2 < 0xC)
  {
LABEL_69:
    v36 = 0;
    v21 = 0;
    DomainName = -6743;
    goto LABEL_58;
  }
  if (__rev16(*(unsigned __int16 *)(a1 + 4)) != 1)
  {
    v36 = 0;
    v21 = 0;
    DomainName = -6764;
    goto LABEL_58;
  }
  *(_QWORD *)v51 = a1 + 12;
  DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, (_WORD *)&v50 + 1, &v50, v51);
  if (DomainName)
    goto LABEL_63;
  if ((unsigned __int16)v50 != 1)
  {
    v36 = 0;
    v21 = 0;
    DomainName = -6756;
    goto LABEL_58;
  }
  v9 = __src[0];
  v10 = __src;
  if (__src[0])
  {
    do
    {
      v11 = &v10[v9];
      v12 = v11[1];
      v10 = v11 + 1;
      v9 = v12;
    }
    while (v12);
  }
  v13 = v10 - __src;
  __n = v10 - __src + 1;
  v40 = *(char **)v51;
  __memcpy_chk();
  v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
  if (v14)
  {
    v15 = 0;
    v42 = -1;
LABEL_9:
    v16 = 0;
    *(_QWORD *)v51 = v40;
    v17 = 1;
    while (1)
    {
      v49 = 0;
      LODWORD(v47) = 0;
      LOWORD(v46) = 0;
      v48 = 0;
      DomainName = _DNSMessageExtractRecordEx(a1, a2, *(char **)v51, (char *)v52, &v46, &v48, &v47, (unsigned __int16 **)&v49, 0, 0, 0, 0, 0, v51);
      if (DomainName)
        break;
      if ((unsigned __int16)v46 == 5 && v48 == (unsigned __int16)v50 && DomainNameEqual(v52, __dst))
      {
        DomainName = DNSMessageExtractDomainName(a1, a2, v49, (char *)__dst, 0);
        if (DomainName)
          break;
        v17 = 0;
        v18 = v42;
        if (v42 >= v47)
          v18 = v47;
        v42 = v18;
        if (++v16 == v14)
          goto LABEL_22;
      }
      else if (v14 == ++v16)
      {
        if ((v17 & 1) != 0)
          goto LABEL_25;
LABEL_22:
        if (++v15 != v14)
          goto LABEL_9;
        goto LABEL_25;
      }
    }
LABEL_63:
    v36 = 0;
LABEL_57:
    v21 = 0;
    goto LABEL_58;
  }
  v42 = -1;
LABEL_25:
  v38 = a4;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  size = v13 + 17;
  v22 = 1;
  a4 = &v47;
  while (1)
  {
    v41 = v22;
    *(_QWORD *)v51 = v40;
    if (v14)
      break;
    v44 = 0;
    if (v21)
      goto LABEL_52;
LABEL_45:
    if (!size || (v30 = (char *)malloc_type_calloc(1uLL, size, 0xF1748037uLL)) == 0)
    {
      __break(1u);
      goto LABEL_69;
    }
    v21 = v30;
    if (size < 0xC)
      goto LABEL_67;
    v31 = *(_DWORD *)a1;
    *((_WORD *)v30 + 2) = *(_WORD *)(a1 + 4);
    *(_DWORD *)v30 = v31;
    *(_DWORD *)(v30 + 6) = 0;
    *((_WORD *)v30 + 5) = 0;
    if (size - 12 < __n)
      goto LABEL_67;
    v19 = &v30[size];
    v32 = v30 + 12;
    memcpy(v30 + 12, __src, __n);
    v33 = &v32[__n];
    if ((unint64_t)(v19 - &v32[__n]) < 4)
      goto LABEL_67;
    v22 = 0;
    v34 = BYTE2(v50);
    v35 = v50;
    *v33 = HIBYTE(v50);
    v33[1] = v34;
    v33[2] = HIBYTE(v35);
    v33[3] = v35;
    v20 = v33 + 4;
    *((_WORD *)v21 + 2) = 256;
    if ((v41 & 1) == 0)
      goto LABEL_54;
  }
  v44 = 0;
  v23 = v14;
  do
  {
    v49 = 0;
    v47 = 0;
    v46 = 0;
    v48 = 0;
    v45 = 0;
    v24 = *(char **)v51;
    DomainName = _DNSMessageExtractRecordEx(a1, a2, *(char **)v51, (char *)v52, &v48, &v45, &v46, 0, 0, 0, 0, 0, (unint64_t *)&v47, v51);
    if (DomainName)
      goto LABEL_65;
    if (v48 == HIWORD(v50) && v45 == (unsigned __int16)v50 && DomainNameEqual(v52, __dst))
    {
      if (v21)
      {
        if (v19 - v20 < 2)
          goto LABEL_64;
        *(_WORD *)v20 = 3264;
        if ((unint64_t)(v19 - v20 - 2) < 0xA)
          goto LABEL_64;
        v25 = v46;
        if (v46 >= v42)
          v25 = v42;
        v46 = v25;
        v26 = v48;
        v27 = v45;
        v28 = v47;
        v20[2] = HIBYTE(v48);
        v20[3] = v26;
        v20[4] = HIBYTE(v27);
        v20[5] = v27;
        v20[6] = HIBYTE(v25);
        v20[7] = BYTE2(v25);
        v20[8] = BYTE1(v25);
        v20[9] = v25;
        v20[10] = HIBYTE(v28);
        v20[11] = v28;
        v29 = v20 + 12;
        if (v19 - v29 < (unint64_t)v47)
        {
LABEL_64:
          DomainName = -6762;
LABEL_65:
          v36 = 0;
          goto LABEL_66;
        }
        DomainName = _DNSMessageExtractRecordEx(a1, a2, v24, 0, 0, 0, 0, 0, 0, v29, v47, (size_t *)&v49, 0, 0);
        if (DomainName)
          goto LABEL_65;
        v20 = &v49[(_QWORD)v29];
        ++v44;
      }
      else
      {
        size += v47 + 12;
      }
    }
    --v23;
  }
  while (v23);
  if (!v21)
    goto LABEL_45;
LABEL_52:
  if (size >= 0xC)
  {
    *((_WORD *)v21 + 3) = bswap32(v44) >> 16;
LABEL_54:
    a4 = v38;
    DomainName = 0;
    if (a3)
      *a3 = v20 - v21;
    v36 = v21;
    goto LABEL_57;
  }
LABEL_67:
  v36 = 0;
  DomainName = -6762;
LABEL_66:
  a4 = v38;
LABEL_58:
  if (a4)
    *(_DWORD *)a4 = DomainName;
  if (v21)
    free(v21);
  return v36;
}

uint64_t DomainNameEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;

  if (a1 == a2)
    return 1;
  v2 = a2;
  v3 = a1;
  while (1)
  {
    v4 = *v3;
    if (v3 != v2)
    {
      v5 = *v2;
      if ((_DWORD)v4 != v5 || mdns_memcmp_us_ascii_case_insensitive(v3 + 1, v2 + 1, *v3, v5))
        break;
    }
    v3 += v4 + 1;
    v2 += v4 + 1;
    if (!(_DWORD)v4)
      return 1;
  }
  return 0;
}

uint64_t DomainNameAppendDomainName(_BYTE *a1, _BYTE *a2, _QWORD *a3)
{
  int v5;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  unint64_t v9;
  int v10;
  _BYTE *v11;
  _BYTE *v12;
  int v13;
  uint64_t result;
  size_t v15;
  size_t v16;

  v5 = *a1;
  v6 = a1;
  if (*a1)
  {
    v6 = a1;
    do
    {
      v7 = &v6[v5];
      v8 = v7[1];
      v6 = v7 + 1;
      v5 = v8;
    }
    while (v8);
  }
  v9 = v6 - a1;
  v10 = *a2;
  v11 = a2;
  if (*a2)
  {
    v11 = a2;
    do
    {
      v12 = &v11[v10];
      v13 = v12[1];
      v11 = v12 + 1;
      v10 = v13;
    }
    while (v13);
  }
  result = 4294960553;
  if (v9 <= 0x100)
  {
    v15 = v11 - a2 + 1;
    if (v15 <= 0x100)
    {
      v16 = v15 + v9;
      if (v15 + v9 <= 0x100)
      {
        memcpy(&a1[v9], a2, v15);
        result = 0;
        if (a3)
          *a3 = &a1[v16];
      }
    }
  }
  return result;
}

uint64_t DomainNameAppendString(_BYTE *a1, char *a2, _QWORD *a3)
{
  _BYTE *v3;
  uint64_t result;
  int v5;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  int v13;
  char *v14;

  v3 = a1;
  while (*v3)
  {
    v3 += *v3 + 1;
    if (v3 >= a1 + 256)
      return 4294960554;
  }
  v5 = *a2;
  if (*a2)
  {
    if (v5 != 46)
      goto LABEL_9;
    if (a2[1])
    {
      v5 = 46;
LABEL_9:
      v6 = (unint64_t)(a1 + 255);
      do
      {
        if ((unint64_t)(v3 + 64) >= v6)
          v7 = (_BYTE *)v6;
        else
          v7 = v3 + 64;
        v8 = v3 + 1;
        v9 = v3 + 1;
        v10 = (unsigned __int8 *)a2;
        do
        {
          a2 = (char *)(v10 + 1);
          if (v5 == 92)
          {
            v5 = *a2;
            if (!*a2)
              return 4294960546;
            a2 = (char *)(v10 + 2);
            if (v5 - 48 <= 9)
            {
              v11 = *a2;
              if ((v11 - 48) <= 9)
              {
                v12 = v10[3];
                if ((v12 - 48) <= 9)
                {
                  v13 = 100 * v5 + 10 * (char)v11 + (char)v12;
                  v14 = (char *)(v10 + 4);
                  if (v13 < 5584)
                  {
                    a2 = v14;
                    LOBYTE(v5) = v13 + 48;
                  }
                }
              }
            }
          }
          else if (v5 == 46)
          {
            break;
          }
          if (v9 >= v7)
            return 4294960545;
          *v9++ = v5;
          v5 = *a2;
          v10 = (unsigned __int8 *)a2;
        }
        while (*a2);
        if (v9 == v8)
          return 4294960554;
        *v3 = (_BYTE)v9 - (_BYTE)v8;
        *v9 = 0;
        v5 = *a2;
        v3 = v9;
      }
      while (*a2);
      goto LABEL_29;
    }
  }
  v9 = v3;
LABEL_29:
  result = 0;
  if (a3)
    *a3 = v9 + 1;
  return result;
}

_BYTE *DomainNameDupEx(_BYTE *result, int a2, unsigned __int8 **a3, size_t *a4)
{
  const void *v7;
  int v8;
  _BYTE *v9;
  _BYTE *v10;
  int v11;
  size_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;

  v7 = result;
  v8 = *result;
  v9 = result;
  if (*result)
  {
    v9 = result;
    do
    {
      v10 = &v9[v8];
      v11 = v10[1];
      v9 = v10 + 1;
      v8 = v11;
    }
    while (v11);
  }
  v12 = v9 - result + 1;
  if (v9 - result == -1 || (result = malloc_type_malloc(v9 - result + 1, 0xA172743EuLL)) == 0)
  {
    __break(1u);
  }
  else
  {
    v13 = result;
    memcpy(result, v7, v12);
    if (a2)
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v13;
        do
        {
          v16 = v15 + 1;
          v17 = v16;
          v18 = v14;
          do
          {
            v19 = *v17;
            if ((v19 - 65) < 0x1A)
              LOBYTE(v19) = v19 + 32;
            *v17++ = v19;
            --v18;
          }
          while (v18);
          v15 = &v16[v14];
          v14 = *v15;
        }
        while (*v15);
      }
    }
    *a3 = v13;
    if (a4)
      *a4 = v12;
    return 0;
  }
  return result;
}

BOOL DomainLabelEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  int v3;

  if (a1 == a2)
    return 1;
  v2 = *a1;
  v3 = *a2;
  return (_DWORD)v2 == v3 && mdns_memcmp_us_ascii_case_insensitive(a1 + 1, a2 + 1, v2, v3) == 0;
}

uint64_t DomainNameFromString(_BYTE *a1, char *a2, _QWORD *a3)
{
  *a1 = 0;
  return DomainNameAppendString(a1, a2, a3);
}

uint64_t DomainNameLabelCount(uint64_t result)
{
  unsigned int v1;
  uint64_t v2;
  _BYTE *v3;

  v1 = *(unsigned __int8 *)result;
  if (!*(_BYTE *)result)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = (_BYTE *)v2;
  while (v1 <= 0x3F)
  {
    v3 += v1 + 1;
    if ((uint64_t)&v3[-v2] > 255)
      break;
    result = (result + 1);
    v1 = *v3;
    if (!*v3)
      return result;
  }
  return 0xFFFFFFFFLL;
}

const char *DNSRecordTypeValueToString(int a1)
{
  int v1;
  const char *result;

  if (a1 > 248)
  {
    if (a1 >= 0x8000)
    {
      switch(a1)
      {
        case 0x8000:
          return "TA";
        case 0x8001:
          return "DLV";
        case 0xFFFF:
          return "Reserved";
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 249:
          result = "TKEY";
          break;
        case 250:
          result = "TSIG";
          break;
        case 251:
          result = "IXFR";
          break;
        case 252:
          result = "AXFR";
          break;
        case 253:
          result = "MAILB";
          break;
        case 254:
          result = "MAILA";
          break;
        case 255:
          result = "ANY";
          break;
        case 256:
          result = "URI";
          break;
        case 257:
          result = "CAA";
          break;
        case 258:
          result = "AVC";
          break;
        case 259:
          result = "DOA";
          break;
        case 260:
          result = "AMTRELAY";
          break;
        default:
          return 0;
      }
    }
  }
  else
  {
    v1 = a1 - 1;
    result = "A";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        result = "NS";
        break;
      case 2:
        result = "MD";
        break;
      case 3:
        result = "MF";
        break;
      case 4:
        result = "CNAME";
        break;
      case 5:
        result = "SOA";
        break;
      case 6:
        result = "MB";
        break;
      case 7:
        result = "MG";
        break;
      case 8:
        result = "MR";
        break;
      case 9:
        result = "NULL";
        break;
      case 10:
        result = "WKS";
        break;
      case 11:
        result = "PTR";
        break;
      case 12:
        result = "HINFO";
        break;
      case 13:
        result = "MINFO";
        break;
      case 14:
        result = "MX";
        break;
      case 15:
        result = "TXT";
        break;
      case 16:
        result = "RP";
        break;
      case 17:
        result = "AFSDB";
        break;
      case 18:
        result = "X25";
        break;
      case 19:
        result = "ISDN";
        break;
      case 20:
        result = "RT";
        break;
      case 21:
        result = "NSAP";
        break;
      case 22:
        result = "NSAP-PTR";
        break;
      case 23:
        result = "SIG";
        break;
      case 24:
        result = "KEY";
        break;
      case 25:
        result = "PX";
        break;
      case 26:
        result = "GPOS";
        break;
      case 27:
        result = "AAAA";
        break;
      case 28:
        result = "LOC";
        break;
      case 29:
        result = "NXT";
        break;
      case 30:
        result = "EID";
        break;
      case 31:
        result = "NIMLOC";
        break;
      case 32:
        result = "SRV";
        break;
      case 33:
        result = "ATMA";
        break;
      case 34:
        result = "NAPTR";
        break;
      case 35:
        result = "KX";
        break;
      case 36:
        result = "CERT";
        break;
      case 37:
        result = "A6";
        break;
      case 38:
        result = "DNAME";
        break;
      case 39:
        result = "SINK";
        break;
      case 40:
        result = "OPT";
        break;
      case 41:
        result = "APL";
        break;
      case 42:
        result = "DS";
        break;
      case 43:
        result = "SSHFP";
        break;
      case 44:
        result = "IPSECKEY";
        break;
      case 45:
        result = "RRSIG";
        break;
      case 46:
        result = "NSEC";
        break;
      case 47:
        result = "DNSKEY";
        break;
      case 48:
        result = "DHCID";
        break;
      case 49:
        result = "NSEC3";
        break;
      case 50:
        result = "NSEC3PARAM";
        break;
      case 51:
        result = "TLSA";
        break;
      case 52:
        result = "SMIMEA";
        break;
      case 54:
        result = "HIP";
        break;
      case 55:
        result = "NINFO";
        break;
      case 56:
        result = "RKEY";
        break;
      case 57:
        result = "TALINK";
        break;
      case 58:
        result = "CDS";
        break;
      case 59:
        result = "CDNSKEY";
        break;
      case 60:
        result = "OPENPGPKEY";
        break;
      case 61:
        result = "CSYNC";
        break;
      case 62:
        result = "ZONEMD";
        break;
      case 63:
        result = "SVCB";
        break;
      case 64:
        result = "HTTPS";
        break;
      case 98:
        result = "SPF";
        break;
      case 99:
        result = "UINFO";
        break;
      case 100:
        result = "UID";
        break;
      case 101:
        result = "GID";
        break;
      case 102:
        result = "UNSPEC";
        break;
      case 103:
        result = "NID";
        break;
      case 104:
        result = "L32";
        break;
      case 105:
        result = "L64";
        break;
      case 106:
        result = "LP";
        break;
      case 107:
        result = "EUI48";
        break;
      case 108:
        result = "EUI64";
        break;
      default:
        return 0;
    }
  }
  return result;
}

unsigned __int16 *DNSRecordTypeStringToValue(const void *a1)
{
  unsigned __int16 *result;

  result = (unsigned __int16 *)bsearch(a1, &DNSRecordTypeStringToValue_sTable, 0x5AuLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRecordTypeStringToValueCmp);
  if (result)
    return (unsigned __int16 *)result[4];
  return result;
}

uint64_t _DNSRecordTypeStringToValueCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

const char *DNSRCodeToString(int a1)
{
  const char *result;

  result = "NoError";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "FormErr";
      break;
    case 2:
      result = "ServFail";
      break;
    case 3:
      result = "NXDomain";
      break;
    case 4:
      result = "NotImp";
      break;
    case 5:
      result = "Refused";
      break;
    case 6:
      result = "YXDomain";
      break;
    case 7:
      result = "YXRRSet";
      break;
    case 8:
      result = "NXRRSet";
      break;
    case 9:
      result = "NotAuth";
      break;
    case 10:
      result = "NotZone";
      break;
    case 11:
      result = "DSOTYPENI";
      break;
    case 12:
    case 13:
    case 14:
    case 15:
      goto LABEL_5;
    case 16:
      result = "BADVERS";
      break;
    case 17:
      result = "BADKEY";
      break;
    case 18:
      result = "BADTIME";
      break;
    case 19:
      result = "BADMODE";
      break;
    case 20:
      result = "BADNAME";
      break;
    case 21:
      result = "BADALG";
      break;
    case 22:
      result = "BADTRUNC";
      break;
    case 23:
      result = "BADCOOKIE";
      break;
    default:
      if (a1 == 0xFFFF)
        result = "Reserved";
      else
LABEL_5:
        result = 0;
      break;
  }
  return result;
}

uint64_t DNSRCodeFromString(const void *a1)
{
  unsigned int *v1;

  v1 = (unsigned int *)bsearch(a1, &DNSRCodeFromString_sTable, 0x15uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRCodeFromStringCmp);
  if (v1)
    return v1[2];
  else
    return 0xFFFFFFFFLL;
}

uint64_t _DNSRCodeFromStringCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

uint64_t DNSMessageToString(unsigned __int16 *a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  unint64_t v8;
  const char *v9;
  int v10;
  unsigned int v11;
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const char *v17;
  const char *v18;
  unsigned __int8 *v19;
  int v20;
  char *v21;
  _BOOL4 v22;
  int v23;
  char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  int v35;
  _BOOL4 v36;
  int v37;
  char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  int DomainName;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  const char *v50;
  const char *v51;
  int64_t v52;
  char *v53;
  unsigned int v54;
  unint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  unsigned __int8 *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  unsigned int v65;
  uint64_t v66;
  unsigned __int8 *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  unsigned __int8 *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  const char *v93;
  unsigned int v94;
  int v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  void *v99;
  int v100[2];
  _OWORD v101[3];
  uint64_t v102;
  int v103;
  int v104;
  unint64_t v105;
  unsigned __int8 *v106;
  void *v107;
  unsigned __int8 *v108;
  _BYTE v109[256];
  _BYTE v110[256];
  unsigned __int8 v111[1009];
  _BYTE v112[512];
  unint64_t v113[32];
  void *__src[129];

  __src[127] = *(void **)MEMORY[0x24BDAC8D0];
  v99 = 0;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global_338);
  v102 = 0;
  memset(v101, 0, sizeof(v101));
  *(_QWORD *)v100 = 0;
  v98 = 0;
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr)
    goto LABEL_652;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v101, v112, 512, -1);
  if (a2 < 0xC)
  {
LABEL_655:
    v66 = 4294960553;
    goto LABEL_645;
  }
  v8 = *((unsigned __int8 *)a1 + 2);
  v88 = (v8 >> 3) & 0xF;
  v89 = a4;
  v94 = __rev16(a1[2]);
  v92 = __rev16(a1[3]);
  v91 = __rev16(a1[4]);
  v90 = __rev16(a1[5]);
  v9 = "";
  v96 = a2;
  v97 = (unint64_t)a1;
  if ((a3 & 0x20) != 0)
    goto LABEL_75;
  v10 = *((unsigned __int8 *)a1 + 3) | (*((unsigned __int8 *)a1 + 2) << 8);
  v11 = __rev16(*a1);
  if ((a3 & 4) != 0)
  {
    v14 = (v8 >> 3) & 0xF;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v15 = 81;
    if ((v10 & 0x8000u) != 0)
      v15 = 82;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "id: 0x%04X (%u), flags: 0x%04X (%c/", v11, v11, v10, v15);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "ID:               0x%04X (%u)\n", v11, v11);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v13 = 81;
    if ((v10 & 0x8000u) != 0)
      v13 = 82;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Flags:            0x%04X %c/", v10, v13);
    LODWORD(v14) = v88;
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
  }
  if (v14 > 6 || (_DWORD)v14 == 3)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "OPCODE%d");
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
  }
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  for (i = 0; i != 14; i += 2)
  {
    if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v10) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_652;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", %s", (&kDNSHeaderFlagsDescs)[i]);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
    }
  }
  v17 = DNSRCodeToString(v10 & 0xF);
  if (v17)
  {
    v18 = v17;
    a1 = (unsigned __int16 *)v97;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v85 = (uint64_t)v18;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", %s");
  }
  else
  {
    a1 = (unsigned __int16 *)v97;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v85 = v10 & 0xF;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", RCODE%d");
  }
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
  {
LABEL_644:
    v66 = CUSymAddr_DataBuffer_AppendF_sAddr;
    goto LABEL_645;
  }
  if ((a3 & 4) == 0)
  {
    if ((a3 & 0x40) != 0)
      goto LABEL_636;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\n", v85);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Question count:   %u\n", v94);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Answer count:     %u\n", v92);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Authority count:  %u\n", v91);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Additional count: %u\n", v90);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    v9 = "";
LABEL_75:
    if ((a3 & 0x10) == 0)
      goto LABEL_76;
LABEL_636:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
    if (!_GetCUSymAddr_DataBuffer_Append_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v101, "", 1);
    if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    {
      if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
      if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
      {
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Detach_sAddr(v101, v89, &v98);
        goto LABEL_644;
      }
LABEL_652:
      v66 = 4294960561;
      goto LABEL_645;
    }
    goto LABEL_644;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_652;
  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ")", v85);
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  if ((a3 & 0x40) != 0)
    goto LABEL_636;
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_652;
  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", counts: %u/%u/%u/%u", v94, v92, v91, v90);
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  v9 = ", ";
  if ((a3 & 0x10) != 0)
    goto LABEL_636;
LABEL_76:
  v95 = (a3 >> 3) & 1;
  *(_QWORD *)v100 = a1 + 6;
  if (v94)
  {
    v19 = 0;
    v20 = 0;
    v21 = v110;
    while (1)
    {
      LOWORD(__src[0]) = 0;
      LOWORD(v113[0]) = 0;
      CUSymAddr_DataBuffer_AppendF_sAddr = DNSMessageExtractQuestion(v97, v96, *(char **)v100, v21, __src, v113, v100);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
      v22 = SLOWORD(v113[0]) < 0;
      if ((a3 & 1) != 0)
        LOWORD(v113[0]) &= ~0x8000u;
      v23 = a3 & v22;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v19 && DomainNameEqual((unsigned __int8 *)v21, v19))
        {
          v24 = v21;
          v21 = (char *)v19;
        }
        else
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v21, 0, v111, 0);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v95 && _NameIsPrivate((const char *)v111))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s ");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v21 == v110)
            v24 = v109;
          else
            v24 = v110;
          *v24 = 0;
        }
        v28 = "ANY";
        if (LOWORD(v113[0]) != 255)
          v28 = 0;
        if (LOWORD(v113[0]) == 1)
          v29 = "IN";
        else
          v29 = v28;
        if (v29)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "CLASS%u");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if ((a3 & 1) != 0)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v30 = "QM";
          if (v23)
            v30 = "QU";
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", v30);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
        }
        v31 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v31)
        {
          v32 = v31;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = (uint64_t)v32;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s?");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = LOWORD(__src[0]);
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u?");
        }
        v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      else
      {
        if (!v20)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nQUESTION SECTION\n");
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
        }
        CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v21, 0, v111, 0);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v95 && _NameIsPrivate((const char *)v111))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~-30s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%-30s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v25 = "QM";
        if (v23)
          v25 = "QU";
        if ((a3 & 1) == 0)
          v25 = "";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %2s", v25);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        v26 = "ANY";
        if (LOWORD(v113[0]) != 255)
          v26 = 0;
        if (LOWORD(v113[0]) == 1)
          v27 = "IN";
        else
          v27 = v26;
        if (v27)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        v33 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v33)
        {
          v34 = v33;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = (uint64_t)v34;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %-5s\n");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = LOWORD(__src[0]);
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u\n");
        }
        v24 = v21;
        v21 = (char *)v19;
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      v19 = (unsigned __int8 *)v21;
      ++v20;
      v21 = v24;
      if (v94 == v20)
        goto LABEL_202;
    }
  }
  v19 = 0;
  v24 = v110;
LABEL_202:
  if (v91 + v92 + v90)
  {
    v35 = 0;
    while (1)
    {
      __src[0] = 0;
      v113[0] = 0;
      LODWORD(v108) = 0;
      LOWORD(v107) = 0;
      LOWORD(v106) = 0;
      CUSymAddr_DataBuffer_AppendF_sAddr = _DNSMessageExtractRecordEx(v97, v96, *(char **)v100, v24, &v107, &v106, &v108, (unsigned __int16 **)__src, v113, 0, 0, 0, 0, v100);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
      CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v24, 0, v111, 0);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
      v36 = (__int16)v106 < 0;
      if ((a3 & 1) != 0)
        LOWORD(v106) = (unsigned __int16)v106 & 0x7FFF;
      v37 = a3 & v36;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v19 && DomainNameEqual((unsigned __int8 *)v24, v19))
        {
          v38 = v24;
          v24 = (char *)v19;
        }
        else
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v24, 0, v111, 0);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v95 && _NameIsPrivate((const char *)v111))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s ");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v24 == v110)
            v38 = v109;
          else
            v38 = v110;
          *v38 = 0;
        }
        if ((unsigned __int16)v107 == 41)
        {
          if (v37)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "CF ");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_644;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "OPT %u", (unsigned __int16)v106);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if ((_DWORD)v108)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0x%08X");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0");
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%u", (_DWORD)v108);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v37)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CF");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_644;
          }
          v39 = "ANY";
          if ((unsigned __int16)v106 != 255)
            v39 = 0;
          if ((unsigned __int16)v106 == 1)
            v40 = "IN";
          else
            v40 = v39;
          if (v40)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (DNSRecordTypeValueToString((unsigned __int16)v107))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
          }
        }
        v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        goto LABEL_373;
      }
      if (v92 && !v35)
        break;
      if (v91 && v92 == v35)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nAUTHORITY SECTION\n");
        goto LABEL_284;
      }
      if (v90 && v91 + v92 == v35)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nADDITIONAL SECTION\n");
        goto LABEL_284;
      }
LABEL_285:
      if ((unsigned __int16)v107 == 41)
      {
        if (v95 && _NameIsPrivate((const char *)v111))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v41 = "";
        if (v37)
          v41 = " CF";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s OPT %u", v41, (unsigned __int16)v106);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if ((_DWORD)v108)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0x%08X");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0");
        }
      }
      else
      {
        if (v95)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~-42s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%-42s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v42 = "";
        if (v37)
          v42 = "CF";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %6u %2s", (_DWORD)v108, v42);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        v43 = "ANY";
        if ((unsigned __int16)v106 != 255)
          v43 = 0;
        if ((unsigned __int16)v106 == 1)
          v44 = "IN";
        else
          v44 = v43;
        if (v44)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (DNSRecordTypeValueToString((unsigned __int16)v107))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %-5s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
        }
      }
      v38 = v24;
      v24 = (char *)v19;
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
LABEL_373:
      if ((a3 & 2) == 0)
        DNSRecordDataToStringEx((unsigned __int8 *)__src[0], v113[0], (unsigned __int16)v107, v97, v96, v95, (uint64_t)&v99);
      if (v99)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", (const char *)v99);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v99)
        {
          free(v99);
          v99 = 0;
        }
      }
      else
      {
        if (v95)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = v113[0];
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " [%zu B]");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v86 = v113[0];
          v87 = v113[0];
          v84 = (uint64_t)__src[0];
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %#H");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      if ((a3 & 4) != 0)
      {
        if ((unsigned __int16)v107 == 5)
        {
          DomainName = DNSMessageExtractDomainName(v97, v96, (char *)__src[0], v38, 0);
          v46 = v110;
          if (v38 == v110)
            v46 = v109;
          if (!DomainName)
          {
            v24 = v38;
            v38 = v46;
          }
          *v38 = 0;
        }
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\n");
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      ++v35;
      v19 = (unsigned __int8 *)v24;
      v24 = v38;
      if (v92 + v90 + v91 == v35)
        goto LABEL_405;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nANSWER SECTION\n");
LABEL_284:
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    goto LABEL_285;
  }
LABEL_405:
  v47 = v97;
  if ((_DWORD)v88 != 6)
    goto LABEL_636;
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_652;
  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "[");
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  v48 = v97 + v96;
  v49 = *(char **)v100;
  if (*(_QWORD *)v100 >= v97 + v96)
  {
LABEL_629:
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    if (((a3 >> 2) & 1) != 0)
      v82 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "]", v84, v86, v87);
    else
      v82 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\n]", v84, v86, v87);
    v66 = v82;
    if ((_DWORD)v82)
      goto LABEL_645;
    goto LABEL_636;
  }
  if (((a3 >> 2) & 1) != 0)
    v50 = "";
  else
    v50 = "\n\t";
  if (((a3 >> 2) & 1) != 0)
    v51 = ", ";
  else
    v51 = ",\n\t";
  v93 = v51;
  while ((unint64_t)v49 >= v47)
  {
    if (v48 - (unint64_t)v49 < 4
      || (v52 = __rev16(*((unsigned __int16 *)v49 + 1)), v53 = v49 + 4, (uint64_t)(v48 - (_QWORD)(v49 + 4)) < v52))
    {
LABEL_653:
      v66 = 4294960546;
      goto LABEL_645;
    }
    v54 = *(unsigned __int16 *)v49;
    v55 = (unint64_t)&v53[v52];
    *(_QWORD *)v100 = &v53[v52];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s", v50);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    v56 = __rev16(v54);
    v57 = "Reserved";
    switch((int)v56)
    {
      case 0:
        goto LABEL_439;
      case 1:
        v57 = "KeepAlive";
        goto LABEL_439;
      case 2:
        v57 = "Retry Delay";
        goto LABEL_439;
      case 3:
        v57 = "Encryption Padding";
LABEL_439:
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v84 = (uint64_t)v57;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s: ");
LABEL_443:
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        break;
      default:
        switch((int)v56)
        {
          case '@':
            v57 = "SUBSCRIBE";
            goto LABEL_439;
          case 'A':
            v57 = "PUSH";
            goto LABEL_439;
          case 'B':
            v57 = "UNSUBSCRIBE";
            goto LABEL_439;
          case 'C':
            v57 = "RECONFIRM";
            goto LABEL_439;
          default:
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            v84 = v56;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "DSO-TYPE%u: ");
            break;
        }
        goto LABEL_443;
    }
    v107 = 0;
    v108 = (unsigned __int8 *)(v49 + 4);
    switch((int)v56)
    {
      case '@':
        v47 = v97;
        v58 = DNSMessageExtractDomainNameString(v97, v96, v49 + 4, (unsigned __int8 *)__src, &v108);
        if ((_DWORD)v58)
          goto LABEL_527;
        v59 = v108;
        if (v55 - (_QWORD)v108 == 4)
        {
          if (v95 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v68 = __rev16(*((unsigned __int16 *)v59 + 1));
          v69 = "ANY";
          if ((_DWORD)v68 != 255)
            v69 = 0;
          if ((_DWORD)v68 == 1)
            v70 = "IN";
          else
            v70 = v69;
          if (v70)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)v70;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = v68;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v74 = __rev16(*(unsigned __int16 *)v59);
          v75 = DNSRecordTypeValueToString(v74);
          if (v75)
          {
            v76 = v75;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = (uint64_t)v76;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
              goto LABEL_618;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = v74;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
              goto LABEL_618;
            }
          }
          goto LABEL_625;
        }
        v66 = 4294960553;
        goto LABEL_620;
      case 'A':
        if (v55 <= (unint64_t)v53)
          goto LABEL_653;
        v47 = v97;
        while (1)
        {
          v105 = 0;
          v106 = 0;
          v103 = 0;
          v104 = 0;
          v58 = _DNSMessageExtractRecordEx(v97, v96, v53, (char *)v113, (_WORD *)&v103 + 1, &v103, &v104, (unsigned __int16 **)&v106, &v105, 0, 0, 0, 0, &v108);
          if ((_DWORD)v58)
            goto LABEL_527;
          if ((unint64_t)v108 > v55)
            goto LABEL_626;
          v58 = DomainNameToString((unsigned __int8 *)v113, 0, (unsigned __int8 *)__src, 0);
          if ((_DWORD)v58)
            goto LABEL_527;
          if (v95 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_625;
          v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0x%08X", v104);
          if ((_DWORD)v58)
            goto LABEL_527;
          v61 = "ANY";
          if ((unsigned __int16)v103 != 255)
            v61 = 0;
          if ((unsigned __int16)v103 == 1)
            v62 = "IN";
          else
            v62 = v61;
          if (v62)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)v62;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unsigned __int16)v103;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v63 = DNSRecordTypeValueToString(HIWORD(v103));
          if (v63)
          {
            v64 = v63;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)v64;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = HIWORD(v103);
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          DNSRecordDataToStringEx(v106, v105, HIWORD(v103), v97, v96, v95, (uint64_t)&v107);
          if (v107)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", (const char *)v107);
            if ((_DWORD)v58)
              goto LABEL_527;
            if (v107)
            {
              free(v107);
              v107 = 0;
            }
          }
          else
          {
            if (v95)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_625;
              v84 = v105;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " [%zu B]");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_625;
              v86 = v105;
              v87 = v105;
              v84 = (uint64_t)v106;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %#H");
            }
            if ((_DWORD)v58)
              goto LABEL_527;
          }
          v53 = (char *)v108;
          if ((unint64_t)v108 >= v55)
            goto LABEL_619;
        }
      case 'B':
        if ((_DWORD)v52 != 2)
          goto LABEL_655;
        v65 = *((unsigned __int16 *)v49 + 2);
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        v47 = v97;
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_625;
        v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%u", __rev16(v65));
        goto LABEL_527;
      case 'C':
        v47 = v97;
        v58 = DNSMessageExtractDomainNameString(v97, v96, v49 + 4, (unsigned __int8 *)__src, &v108);
        if ((_DWORD)v58)
          goto LABEL_527;
        v67 = v108;
        if (v55 - (unint64_t)v108 >= 4)
        {
          v108 += 4;
          if (v95 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = (uint64_t)__src;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
              goto LABEL_555;
            }
LABEL_625:
            v66 = 4294960561;
            goto LABEL_620;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_625;
          v84 = (uint64_t)__src;
          v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
LABEL_555:
          if ((_DWORD)v58)
            goto LABEL_527;
          v71 = __rev16(*((unsigned __int16 *)v67 + 1));
          v72 = "ANY";
          if ((_DWORD)v71 != 255)
            v72 = 0;
          if ((_DWORD)v71 == 1)
            v73 = "IN";
          else
            v73 = v72;
          if (v73)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (uint64_t)v73;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = v71;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v77 = __rev16(*(unsigned __int16 *)v67);
          v78 = DNSRecordTypeValueToString(v77);
          if (v78)
          {
            v79 = v78;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
LABEL_627:
              v66 = 4294960561;
              goto LABEL_571;
            }
            v84 = (uint64_t)v79;
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = v77;
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
          }
          if ((_DWORD)v60)
          {
LABEL_570:
            v66 = v60;
LABEL_571:
            v47 = v97;
            goto LABEL_620;
          }
          v80 = v108;
          v81 = v55 - (_QWORD)v108;
          DNSRecordDataToStringEx(v108, v55 - (_QWORD)v108, v77, v97, v96, v95, (uint64_t)&v107);
          if (v107)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            v47 = v97;
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", (const char *)v107);
              if ((_DWORD)v58)
                goto LABEL_527;
              if (v107)
              {
                free(v107);
                v107 = 0;
              }
LABEL_619:
              v66 = 0;
              goto LABEL_620;
            }
          }
          else
          {
            if (!v95)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_627;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " '%H'", v80, v81, v81);
              v47 = v97;
              if ((_DWORD)v58)
                goto LABEL_527;
              goto LABEL_619;
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            v47 = v97;
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = v81;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " [%zu B]");
LABEL_618:
              if ((_DWORD)v58)
              {
LABEL_527:
                v66 = v58;
                goto LABEL_620;
              }
              goto LABEL_619;
            }
          }
          goto LABEL_625;
        }
LABEL_626:
        v66 = 4294960546;
LABEL_620:
        if (v107)
          free(v107);
        if ((_DWORD)v66)
          goto LABEL_645;
        v49 = *(char **)v100;
        v50 = v93;
        v48 = v97 + v96;
        if (*(_QWORD *)v100 >= v97 + v96)
          goto LABEL_629;
        break;
      default:
        if (v95)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            v84 = v52;
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "[%u B]");
            goto LABEL_570;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            v86 = v52;
            v87 = v52;
            v84 = (uint64_t)(v49 + 4);
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "'%H'");
            goto LABEL_570;
          }
        }
        goto LABEL_627;
    }
  }
  v66 = 4294960586;
LABEL_645:
  if (v99)
    free(v99);
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
  if (_GetCUSymAddr_DataBuffer_Free_sAddr)
    _GetCUSymAddr_DataBuffer_Free_sAddr(v101);
  return v66;
}

uint64_t _NameIsPrivate(const char *a1)
{
  uint64_t result;

  result = strcasecmp(a1, ".");
  if ((_DWORD)result)
    return strcasecmp(a1, "ipv4only.arpa.") != 0;
  return result;
}

uint64_t DNSRecordDataToStringEx(unsigned __int8 *a1, unint64_t a2, int a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  unint64_t v14;
  uint64_t appended;
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr;
  char *v17;
  unint64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unint64_t v21;
  unsigned __int8 *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  char v33;
  uint64_t v34;
  unsigned int v35;
  char *v36;
  unsigned int v37;
  const char *v38;
  const char *v39;
  unsigned int v40;
  const char *v41;
  const char *v42;
  const char *v43;
  char *v44;
  unint64_t v45;
  const char *v46;
  char v47;
  const char *v48;
  const char *v49;
  char *v50;
  const char *v51;
  char v52;
  unint64_t v53;
  char *i;
  const char *v55;
  unsigned int v56;
  char *v57;
  const char *v58;
  char *v59;
  const char *v60;
  char *v61;
  const char *v62;
  unsigned int *v64;
  const char *v65;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _OWORD v73[3];
  uint64_t v74;
  unsigned __int8 *v75;
  char *v76;
  _BYTE v77[256];
  void *v78[129];

  v78[127] = *(void **)MEMORY[0x24BDAC8D0];
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global_338);
  v74 = 0;
  v75 = 0;
  memset(v73, 0, sizeof(v73));
  v72 = 0;
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr)
    goto LABEL_351;
  v14 = (unint64_t)&a1[a2];
  _GetCUSymAddr_DataBuffer_Init_sAddr(v73, v77, 256, -1);
  if (a3 <= 27)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4)
          goto LABEL_352;
        appended = _AppendIPv4Address((uint64_t)v73, 0, (unsigned int *)a1, a6);
        if ((_DWORD)appended)
          goto LABEL_343;
        goto LABEL_335;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v78, 0);
          if (!(_DWORD)appended)
            goto LABEL_333;
        }
        else
        {
          appended = DomainNameToString(a1, (unint64_t)&a1[a2], (unsigned __int8 *)v78, 0);
          if (!(_DWORD)appended)
            goto LABEL_333;
        }
        goto LABEL_343;
      case 6:
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
          if ((unint64_t)v75 >= v14)
            goto LABEL_352;
          appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v78);
          if ((_DWORD)appended)
            goto LABEL_343;
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v75, (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        else
        {
          appended = DomainNameToString(a1, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
          appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v78);
          if ((_DWORD)appended)
            goto LABEL_343;
          appended = DomainNameToString(v75, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v78);
        if ((_DWORD)appended)
          goto LABEL_343;
        v64 = (unsigned int *)v75;
        if (v14 - (_QWORD)v75 != 20)
          goto LABEL_352;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u %u %u %u %u", bswap32(*v64), bswap32(v64[1]), bswap32(v64[2]), bswap32(v64[3]), bswap32(v64[4]));
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_344;
        goto LABEL_335;
      case 13:
      case 16:
        if (!a2)
          goto LABEL_352;
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "[%zu B]");
        }
        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%#H");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%#{txt}");
        }
        if (!(_DWORD)appended)
          goto LABEL_335;
        goto LABEL_343;
      case 15:
        if ((uint64_t)a2 < 3)
          goto LABEL_352;
        v37 = *(unsigned __int16 *)a1;
        v36 = (char *)(a1 + 2);
        v35 = v37;
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, v36, (unsigned __int8 *)v78, 0);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        else
        {
          appended = DomainNameToString((unsigned __int8 *)v36, v14, (unsigned __int8 *)v78, 0);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(v35));
        if ((_DWORD)appended)
          goto LABEL_343;
        v65 = " ";
        break;
      default:
        goto LABEL_120;
    }
LABEL_334:
    appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)v65, a6, (const char *)v78);
    if ((_DWORD)appended)
      goto LABEL_343;
LABEL_335:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
    if (_GetCUSymAddr_DataBuffer_Append_sAddr)
    {
      appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v73, "", 1);
      if (!(_DWORD)appended)
      {
        if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
        if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
        {
          appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v73, a7, &v72);
          goto LABEL_343;
        }
        goto LABEL_351;
      }
LABEL_343:
      CUSymAddr_DataBuffer_AppendF_sAddr = appended;
      goto LABEL_344;
    }
LABEL_351:
    CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
    goto LABEL_344;
  }
  switch(a3)
  {
    case '+':
      if (a2 < 4)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", __rev16(*(unsigned __int16 *)a1), a1[2], a1[3]);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (a2 == 4)
        goto LABEL_335;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %.4H", a1 + 4, a2 - 4, a2 - 4);
      if ((_DWORD)appended)
        goto LABEL_343;
      goto LABEL_335;
    case ',':
    case '-':
    case '1':
      goto LABEL_120;
    case '.':
      v70 = 0;
      v71 = 0;
      v69 = 0;
      if (a2 < 0x13)
        goto LABEL_352;
      if (DNSRecordTypeValueToString(__rev16(*(unsigned __int16 *)a1)))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s");
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "TYPE%u");
      }
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u %u %u", a1[2], a1[3], bswap32(*((_DWORD *)a1 + 1)));
      if ((_DWORD)appended)
        goto LABEL_343;
      v70 = 0;
      v71 = 0;
      v69 = 0;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr)
        goto LABEL_351;
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 2)) + 0xE77934880, (char *)&v71 + 4, &v71, (char *)&v70 + 4, &v70, (char *)&v69 + 4, &v69);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u%02u%02u%02u%02u%02u", HIDWORD(v71), v71, HIDWORD(v70), v70, HIDWORD(v69), v69);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr)
        goto LABEL_351;
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 3)) + 0xE77934880, (char *)&v71 + 4, &v71, (char *)&v70 + 4, &v70, (char *)&v69 + 4, &v69);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u%02u%02u%02u%02u%02u", HIDWORD(v71), v71, HIDWORD(v70), v70, HIDWORD(v69), v69);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u", __rev16(*((unsigned __int16 *)a1 + 8)));
      if ((_DWORD)appended)
        goto LABEL_343;
      v75 = a1 + 18;
      appended = DomainNameToString(a1 + 18, v14, (unsigned __int8 *)v78, &v75);
      if ((_DWORD)appended)
        goto LABEL_343;
      appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v78);
      if ((_DWORD)appended)
        goto LABEL_343;
      v76 = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v75, v14 - (_QWORD)v75, 0, &v76, 0);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s", v76);
      else
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
      v17 = v76;
      if (v76)
LABEL_58:
        free(v17);
LABEL_59:
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_344;
      goto LABEL_335;
    case '/':
      if (a4)
      {
        appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v78, &v75);
        if ((_DWORD)appended)
          goto LABEL_343;
      }
      else
      {
        appended = DomainNameToString(a1, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v75);
        if ((_DWORD)appended)
          goto LABEL_343;
      }
      if ((unint64_t)v75 >= v14)
        goto LABEL_352;
      appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v78);
      if ((_DWORD)appended)
        goto LABEL_343;
      appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v73, v75, (uint64_t)&a1[a2]);
      if ((_DWORD)appended)
        goto LABEL_343;
      goto LABEL_335;
    case '0':
      if (a2 < 5)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", __rev16(*(unsigned __int16 *)a1), a1[2], a1[3]);
      if ((_DWORD)appended)
        goto LABEL_343;
      v75 = a1 + 4;
      v78[0] = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v75, v14 - (_QWORD)v75, 0, v78, 0);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s", (const char *)v78[0]);
      else
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
      v17 = (char *)v78[0];
      if (v78[0])
        goto LABEL_58;
      goto LABEL_59;
    case '2':
      if (a2 < 5)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", *a1, a1[1], __rev16(*((unsigned __int16 *)a1 + 1)));
      if ((_DWORD)appended)
        goto LABEL_343;
      v75 = a1 + 4;
      if ((uint64_t)(a2 - 4) < 1)
        goto LABEL_352;
      v75 = a1 + 5;
      v18 = a1[4];
      if (a2 - 5 < v18)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %.4H", v75, v18, v18);
      if ((_DWORD)appended)
        goto LABEL_343;
      v19 = &v75[v18];
      v75 = v19;
      if ((uint64_t)(v14 - (_QWORD)v19) < 1)
        goto LABEL_352;
      v20 = v19 + 1;
      v75 = v19 + 1;
      v21 = *v19;
      if (v14 - (unint64_t)(v19 + 1) < v21)
        goto LABEL_352;
      if (!*v19)
        goto LABEL_80;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " ");
      if ((_DWORD)appended)
        goto LABEL_343;
      v20 = v75;
LABEL_80:
      v22 = &v20[v21];
      while (2)
      {
        v23 = v22 - v75;
        if (v22 != v75)
        {
          v24 = 0;
          switch(v23)
          {
            case 1uLL:
              v25 = 0;
              v26 = (unint64_t)*v75++ << 32;
              goto LABEL_99;
            case 2uLL:
              v31 = 0;
              v29 = (unint64_t)v75[1] << 24;
              v26 = v29 | ((unint64_t)*v75 << 32);
              v75 += 2;
              goto LABEL_96;
            case 3uLL:
              v32 = v75[2];
              v29 = ((unint64_t)v32 << 16) | ((unint64_t)v75[1] << 24);
              v26 = v29 | ((unint64_t)*v75 << 32);
              v75 += 3;
              BYTE4(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[2 * (v32 & 0xF)];
              v31 = 5;
              goto LABEL_96;
            case 4uLL:
              goto LABEL_85;
            default:
              v24 = v75[4];
LABEL_85:
              v27 = v75[3];
              v28 = v24 | (v27 << 8);
              v29 = ((unint64_t)v75[1] << 24) | ((unint64_t)v75[2] << 16) | v28;
              v26 = v29 | ((unint64_t)*v75 << 32);
              if (v23 >= 5)
                v30 = 5;
              else
                v30 = v22 - v75;
              v75 += v30;
              if (v23 == 1)
              {
                v25 = 0;
              }
              else
              {
                if (v23 == 4)
                {
                  v31 = 7;
                }
                else
                {
                  HIBYTE(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v24 & 0x1F];
                  v31 = 8;
                }
                v33 = DNSRecordDataToStringEx_kBase32ExtendedHex[(v27 >> 2) & 0x1F];
                BYTE6(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v28 >> 5) & 0x1F];
                BYTE5(v78[0]) = v33;
                BYTE4(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v29 >> 15) & 0x1F];
LABEL_96:
                BYTE3(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v29 >> 20) & 0x1F];
                BYTE2(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v29 >> 25) & 0x1F];
                if (v31)
                  v25 = v31;
                else
                  v25 = 4;
              }
LABEL_99:
              BYTE1(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v26 >> 30) & 0x1F];
              LOBYTE(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v26 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr)
                goto LABEL_351;
              if (v25)
                v34 = v25;
              else
                v34 = 2;
              appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v73, v78, v34);
              if ((_DWORD)appended)
                goto LABEL_343;
              continue;
          }
        }
        break;
      }
      appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v73, v22, v14);
      if ((_DWORD)appended)
        goto LABEL_343;
      goto LABEL_335;
    default:
      if (a3 == 28)
      {
        if (a2 == 16)
        {
          appended = _AppendIPv6Address((uint64_t)v73, 0, (uint64_t)a1, a6);
          if (!(_DWORD)appended)
            goto LABEL_335;
          goto LABEL_343;
        }
        goto LABEL_352;
      }
      if (a3 == 33)
      {
        if (a2 >= 7)
        {
          if (a4)
          {
            appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, (unsigned __int8 *)v78, 0);
            if ((_DWORD)appended)
              goto LABEL_343;
          }
          else
          {
            appended = DomainNameToString(a1 + 6, (unint64_t)&a1[a2], (unsigned __int8 *)v78, 0);
            if ((_DWORD)appended)
              goto LABEL_343;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u ", __rev16(*(unsigned __int16 *)a1), __rev16(*((unsigned __int16 *)a1 + 1)), __rev16(*((unsigned __int16 *)a1 + 2)));
          if ((_DWORD)appended)
            goto LABEL_343;
LABEL_333:
          v65 = 0;
          goto LABEL_334;
        }
LABEL_352:
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960554;
        goto LABEL_344;
      }
LABEL_120:
      if ((a3 & 0xFFFFFFFE) != 0x40)
      {
        if (a3 != 41)
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = 4294960582;
          goto LABEL_344;
        }
        appended = _AppendOPTRDataString((uint64_t)v73, (unsigned __int16 *)a1, (unint64_t)&a1[a2], a6);
        if (!(_DWORD)appended)
          goto LABEL_335;
        goto LABEL_343;
      }
      if (v14 < (unint64_t)a1)
      {
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960586;
      }
      else
      {
        if (a2 < 2)
          goto LABEL_352;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(*(unsigned __int16 *)a1));
        if ((_DWORD)appended)
          goto LABEL_343;
        v76 = (char *)(a1 + 2);
        appended = DomainNameToString(a1 + 2, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v76);
        if ((_DWORD)appended)
          goto LABEL_343;
        v68 = a7;
        appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v78);
        if ((_DWORD)appended)
          goto LABEL_343;
        v38 = v76;
        if ((unint64_t)v76 >= v14)
        {
LABEL_349:
          a7 = v68;
          goto LABEL_335;
        }
        while (2)
        {
          if (v14 - (unint64_t)v38 >= 4)
          {
            v39 = (const char *)__rev16(*(unsigned __int16 *)v38);
            v40 = *((unsigned __int16 *)v38 + 1);
            v41 = _DNSSVCBKeyToString((int)v39);
            if (v41)
            {
              v42 = v41;
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_351;
              v67 = v42;
              appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s=\"");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_351;
              v67 = v39;
              appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " key%u=\"");
            }
            if ((_DWORD)appended)
              goto LABEL_343;
            v43 = (const char *)__rev16(v40);
            v44 = (char *)(v38 + 4);
            v76 = (char *)(v38 + 4);
            if (v14 - (unint64_t)(v38 + 4) >= v43)
            {
              switch((int)v39)
              {
                case 0:
                  if ((v43 & 1) != 0)
                    goto LABEL_352;
                  v45 = (unint64_t)&v43[(_QWORD)v44];
                  if (v44 >= &v43[(_QWORD)v44])
                    goto LABEL_243;
                  v46 = 0;
                  v47 = 1;
                  do
                  {
                    v48 = (const char *)__rev16(*(unsigned __int16 *)v44);
                    v76 = v44 + 2;
                    v49 = _DNSSVCBKeyToString((int)v48);
                    if ((v47 & 1) == 0)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s", v46);
                      if ((_DWORD)appended)
                        goto LABEL_343;
                    }
                    if (v49)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      v67 = v49;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s");
                    }
                    else
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      v67 = v48;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "key%u");
                    }
                    if ((_DWORD)appended)
                      goto LABEL_343;
                    v47 = 0;
                    v44 = v76;
                    v46 = ",";
                  }
                  while ((unint64_t)v76 < v45);
                  goto LABEL_243;
                case 1:
                  v50 = (char *)&v43[(_QWORD)v44];
                  if (v44 >= v50)
                    goto LABEL_243;
                  v51 = 0;
                  v52 = 1;
                  while (1)
                  {
                    v76 = v44 + 1;
                    v53 = *v44;
                    if (v50 - (v44 + 1) < v53)
                      goto LABEL_352;
                    ++v44;
                    if ((v52 & 1) == 0)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s", v51);
                      if ((_DWORD)appended)
                        goto LABEL_343;
                      v44 = v76;
                    }
                    for (i = &v44[v53]; v44 < i; v76 = v44)
                    {
                      v55 = (const char *)*v44;
                      if (((_DWORD)v55 - 32) > 0x5E)
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_351;
                        v67 = v55;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%03d");
                      }
                      else if ((_DWORD)v55 == 92 || (_DWORD)v55 == 44)
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_351;
                        v67 = v55;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%c");
                      }
                      else
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_351;
                        v67 = v55;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%c");
                      }
                      if ((_DWORD)appended)
                        goto LABEL_343;
                      v44 = v76 + 1;
                    }
                    v52 = 0;
                    v51 = ",";
                    if (v44 >= v50)
                      goto LABEL_243;
                  }
                case 2:
                  goto LABEL_168;
                case 3:
                  if ((_DWORD)v43 != 2)
                    goto LABEL_352;
                  v56 = *((unsigned __int16 *)v38 + 2);
                  v76 = (char *)&v43[(_QWORD)v44];
                  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_351;
                  appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(v56));
                  if ((_DWORD)appended)
                    goto LABEL_343;
                  goto LABEL_243;
                case 4:
                  if ((v43 & 3) != 0)
                    goto LABEL_352;
                  v57 = (char *)&v43[(_QWORD)v44];
                  if (v44 >= v57)
                    goto LABEL_243;
                  v58 = "";
                  while (2)
                  {
                    CUSymAddr_DataBuffer_AppendF_sAddr = _AppendIPv4Address((uint64_t)v73, (uint64_t)v58, (unsigned int *)v44, a6);
                    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_344;
                    v44 = v76 + 4;
                    v76 = v44;
                    if (v44 < v57)
                    {
                      v58 = ",";
                      continue;
                    }
                    goto LABEL_243;
                  }
                case 5:
                  goto LABEL_164;
                case 6:
                  if ((v43 & 0xF) != 0)
                    goto LABEL_352;
                  v59 = (char *)&v43[(_QWORD)v44];
                  if (v44 >= v59)
                    goto LABEL_243;
                  v60 = "";
                  while (2)
                  {
                    CUSymAddr_DataBuffer_AppendF_sAddr = _AppendIPv6Address((uint64_t)v73, (uint64_t)v60, (uint64_t)v44, a6);
                    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_344;
                    v44 = v76 + 16;
                    v76 = v44;
                    if (v44 < v59)
                    {
                      v60 = ",";
                      continue;
                    }
                    goto LABEL_243;
                  }
                default:
                  if ((_DWORD)v39 == 32769)
                  {
LABEL_164:
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_351;
                    v67 = v76;
                    appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%.4H");
                  }
                  else
                  {
LABEL_168:
                    if (!a6)
                    {
                      v61 = (char *)&v43[(_QWORD)v44];
                      while (v44 < v61)
                      {
                        v62 = (const char *)*v44;
                        if (((_DWORD)v62 - 33) > 0x5D)
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_351;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%03d");
                        }
                        else if (((_DWORD)v62 - 34) > 0x3A
                               || ((1 << (v62 - 34)) & 0x4000000020000C1) == 0)
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_351;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%c");
                        }
                        else
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_351;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%c");
                        }
                        if ((_DWORD)appended)
                          goto LABEL_343;
                        v44 = ++v76;
                      }
                      goto LABEL_243;
                    }
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_351;
                    v67 = v43;
                    appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "<%u redacted bytes>");
                  }
                  if ((_DWORD)appended)
                    goto LABEL_343;
                  v76 = (char *)&v43[(_QWORD)v76];
LABEL_243:
                  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_351;
                  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\"", v67);
                  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_344;
                  v38 = v76;
                  if ((unint64_t)v76 >= v14)
                    goto LABEL_349;
                  continue;
              }
            }
          }
          break;
        }
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960546;
      }
LABEL_344:
      if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
      if (_GetCUSymAddr_DataBuffer_Free_sAddr)
        _GetCUSymAddr_DataBuffer_Free_sAddr(v73);
      return CUSymAddr_DataBuffer_AppendF_sAddr;
  }
}

uint64_t _AppendIPv4Address(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  unsigned int v4;
  BOOL v5;
  int v6;

  if (a4)
  {
    v4 = bswap32(*a3);
    if (v4)
      v5 = v4 == 2130706433;
    else
      v5 = 1;
    v6 = !v5;
  }
  else
  {
    v6 = 0;
  }
  return _AppendIPAddress(a1, a2, (uint64_t)a3, 4, v6);
}

uint64_t _AppendIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v4;
  int v5;

  if (a4)
  {
    if (*(_QWORD *)a3 | *(_QWORD *)(a3 + 7))
      v4 = 1;
    else
      v4 = *(unsigned __int8 *)(a3 + 15) > 1u;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  return _AppendIPAddress(a1, a2, a3, 16, v5);
}

uint64_t _AppendDomainNameStringEx(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  const char *v5;

  if (a3 && _NameIsPrivate(a4))
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      v5 = "%s%~s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      v5 = "%s%s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  return 4294960561;
}

uint64_t _DNSRecordDataAppendTypeBitMap(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  BOOL v11;
  const char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char __str[32];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      if ((unint64_t)v3 < 3)
        return 4294960554;
      v5 = a2[1];
      if ((v5 - 33) < 0xFFFFFFE0)
        return 4294960554;
      v6 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < v5)
        return 4294960554;
      v14 = a3 - (_QWORD)(a2 + 2);
      v15 = a2[1];
      v7 = 0;
      v8 = 8 * v5;
      v9 = *a2 << 8;
      if ((8 * v5) <= 1)
        v10 = 1;
      else
        v10 = 8 * v5;
      v11 = 1;
      while (1)
      {
        if (((v6[(unint64_t)v7 >> 3] >> (~(_BYTE)v7 & 7)) & 1) != 0)
        {
          v12 = DNSRecordTypeValueToString(v9 + v7);
          if (!v12)
          {
            v12 = __str;
            snprintf(__str, 0x20uLL, "TYPE%u", v9 + v7);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            return 4294960561;
          result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " %s", v12);
          if ((_DWORD)result)
            break;
        }
        v11 = ++v7 < v8;
        if (v10 == v7)
        {
          v6 += v15;
          v3 = a3 - (_QWORD)v6;
          goto LABEL_19;
        }
      }
      v3 = v14;
      if (v11)
        return result;
LABEL_19:
      a2 = v6;
      if (v3 > 0)
        continue;
      break;
    }
  }
  return 0;
}

const char *_DNSSVCBKeyToString(int a1)
{
  const char *result;
  const char *v4;

  result = "mandatory";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "alpn";
      break;
    case 2:
      result = "no-default-alpn";
      break;
    case 3:
      result = "port";
      break;
    case 4:
      result = "ipv4hint";
      break;
    case 5:
      result = "echconfig";
      break;
    case 6:
      result = "ipv6hint";
      break;
    case 7:
      result = "dohpath";
      break;
    default:
      v4 = "odohconfig";
      if (a1 != 32769)
        v4 = 0;
      if (a1 == 0x8000)
        result = "dohuri";
      else
        result = v4;
      break;
  }
  return result;
}

uint64_t _AppendOPTRDataString(uint64_t a1, unsigned __int16 *a2, unint64_t a3, int a4)
{
  unsigned __int16 *v5;
  const char *v7;
  _BYTE *v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t result;
  unsigned int v12;
  unsigned __int16 *v13;
  unsigned int v14;
  unsigned int v15;
  const char *v16;

  if ((unint64_t)a2 > a3)
    return 4294960586;
  v5 = a2;
  v7 = "";
  while (1)
  {
    if ((unint64_t)v5 >= a3)
      return 0;
    if (a3 - (unint64_t)v5 < 4)
      break;
    v8 = v5 + 2;
    v9 = __rev16(v5[1]);
    if (a3 - (unint64_t)(v5 + 2) < v9)
      break;
    v10 = *v5;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return 4294960561;
    result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "%s{", v7);
    if ((_DWORD)result)
      return result;
    v12 = __rev16(v10);
    if (v12 == 12)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "Padding");
    }
    else if (v12 == 15)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "EDE");
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "CODE%u");
    }
    if ((_DWORD)result)
      return result;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return 4294960561;
    result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, ", ");
    if ((_DWORD)result)
      return result;
    v13 = (unsigned __int16 *)&v8[v9];
    if (v12 == 15 && (_DWORD)v9)
    {
      if (v9 < 2)
        return 4294960546;
      v14 = v5[2];
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      v15 = __rev16(v14);
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "code: %u", v15);
      if ((_DWORD)result)
        return result;
      if (v15 <= 0x18)
      {
        v16 = off_24F2861D8[v15];
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          return 4294960561;
        result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " (%s)", v16);
        if ((_DWORD)result)
          return result;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, ", extra-text: ");
      if ((_DWORD)result)
        return result;
      if (!a4 || (_WORD)v13 == (_WORD)v5 + 6)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          return 4294960561;
        result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "'%.*s'");
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          return 4294960561;
        result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "«REDACTED»");
      }
    }
    else if (a4)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "[%u B]");
    }
    else if (v12 == 12 && (_DWORD)v9 && !*v8 && !memcmp(v5 + 2, (char *)v5 + 5, v9 - 1))
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "<%u zero bytes>");
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "'%H'");
    }
    if ((_DWORD)result)
      return result;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return 4294960561;
    result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "}");
    v5 = v13;
    v7 = ", ";
    if ((_DWORD)result)
      return result;
  }
  return 4294960546;
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t result;
  _BYTE v9[33];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a4 != 16 && (_DWORD)a4 != 4)
    return 4294960553;
  if (!a5)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%.*a");
    return 4294960561;
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (!_GetCUSymAddr_SNPrintF_sAddr)
    return 4294960561;
  result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%~s");
    return 4294960561;
  }
  return result;
}

uint64_t DNSComputeDNSKeyTag(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;

  if (a2)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *(unsigned __int8 *)(a1 + v2);
      if ((v2 & 1) == 0)
        v4 <<= 8;
      v3 += v4;
      ++v2;
    }
    while (a2 != v2);
  }
  else
  {
    v3 = 0;
  }
  return (unsigned __int16)(v3 + HIWORD(v3));
}

uint64_t DNSMessagePrintObfuscatedString(uint64_t a1, uint64_t a2, const char *a3)
{
  if (_NameIsPrivate(a3))
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", a3);
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%s");
  }
  return 4294960561;
}

uint64_t DNSMessagePrintObfuscatedIPv4Address(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6;
  unsigned int v7;

  v6 = bswap32(a3);
  v7 = a3;
  if (a3 && a3 != 2130706433)
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, (uint64_t)&v6, 4);
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (_GetCUSymAddr_SNPrintF_sAddr)
    return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%#.4a", COERCE_DOUBLE(&v7));
  else
    return 4294960561;
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  _BYTE v9[33];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a4 != 16 && a4 != 4)
    return 4294960553;
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (!_GetCUSymAddr_SNPrintF_sAddr)
    return 4294960561;
  result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", v9);
    return 4294960561;
  }
  return result;
}

uint64_t DNSMessagePrintObfuscatedIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6;

  if (*(_QWORD *)a3 | *(_QWORD *)(a3 + 7))
    v6 = 1;
  else
    v6 = *(unsigned __int8 *)(a3 + 15) >= 2u;
  if (v6)
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, a3, 16);
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (_GetCUSymAddr_SNPrintF_sAddr)
    return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%.16a", *(double *)&a3);
  else
    return 4294960561;
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

uint64_t __dnssd_svcb_get_port_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a2 && a3 == 2)
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = bswap32(*a2) >> 16;
  return 0;
}

uint64_t __dnssd_svcb_copy_doh_path_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2 && a3)
    asprintf((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "%.*s", a3, a2);
  return 0;
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

  v15 = *MEMORY[0x24BDAC8D0];
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

void *_mdns_domain_name_copy_description(_QWORD *a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  const char *v8;
  void *v9;
  _BYTE v11[64];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
    goto LABEL_9;
  v8 = (const char *)a1[5];
  if (a3)
  {
    if ((int)DNSMessagePrintObfuscatedString((uint64_t)v11, 64, v8) < 0)
      v8 = "«REDACTED»";
    else
      v8 = v11;
  }
  if (mdns_string_builder_append_formatted(v7, "%s", v8))
LABEL_9:
    v9 = 0;
  else
    v9 = mdns_string_builder_copy_string((uint64_t)v7);
  os_release(v7);
  return v9;
}

uint64_t _mdns_domain_name_equal(uint64_t a1, uint64_t a2)
{
  size_t v2;

  if (a1 == a2)
    return 1;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 != *(_QWORD *)(a2 + 32))
    return 0;
  if (*(_BYTE *)(a1 + 61) && *(_BYTE *)(a2 + 61))
    return memcmp(*(const void **)(a1 + 24), *(const void **)(a2 + 24), v2) == 0;
  return DomainNameEqual(*(unsigned __int8 **)(a1 + 24), *(unsigned __int8 **)(a2 + 24)) != 0;
}

void _mdns_domain_name_finalize(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 40) = 0;
  }
}

uint64_t _mdns_domain_name_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  return _mdns_domain_name_equal(a1, a2);
}

uint64_t _mdns_domain_name_cf_callback_hash(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 v6;
  int v7;
  unsigned __int8 v8;

  v2 = (os_unfair_lock_s *)(a1 + 52);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
  if (!*(_BYTE *)(a1 + 60))
  {
    v3 = -2128831035;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(unsigned __int8 **)(a1 + 24);
      do
      {
        v7 = *v5++;
        v6 = v7;
        v8 = v7 + 32;
        if ((v7 - 65) < 0x1A)
          v6 = v8;
        v3 = 16777619 * (v6 ^ v3);
        --v4;
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 56) = v3;
    *(_BYTE *)(a1 + 60) = 1;
  }
  os_unfair_lock_unlock(v2);
  return *(unsigned int *)(a1 + 56);
}

_QWORD *mdns_domain_name_create(char *a1, uint64_t a2, _DWORD *a3)
{
  _QWORD *result;
  int appended;
  _BYTE v6[256];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  appended = DomainNameAppendString(v6, a1, 0);
  if (appended)
  {
    result = 0;
    if (!a3)
      return result;
  }
  else
  {
    result = mdns_domain_name_create_with_labels(v6, &appended);
    if (!a3)
      return result;
  }
  *a3 = appended;
  return result;
}

_QWORD *mdns_domain_name_create_with_labels(_BYTE *a1, int *a2)
{
  _QWORD *v4;
  int v5;
  _QWORD *v6;
  int v8;

  v8 = 0;
  if (!*a1)
  {
    if (_mdns_domain_name_get_root_s_once != -1)
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global_467);
    v4 = (_QWORD *)_mdns_domain_name_get_root_s_root;
    if (_mdns_domain_name_get_root_s_root)
      goto LABEL_7;
  }
  v4 = _mdns_domain_name_create(a1, &v8);
  v5 = v8;
  if (v8)
  {
    v6 = 0;
  }
  else
  {
LABEL_7:
    v5 = 0;
    v6 = v4;
    v8 = 0;
    v4 = 0;
  }
  if (a2)
    *a2 = v5;
  if (v4)
    os_release(v4);
  return v6;
}

_QWORD *_mdns_domain_name_create(_BYTE *a1, int *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _UNKNOWN **v6;
  void (*v7)(_QWORD *);
  int v8;
  char *v9;
  _BYTE *v10;
  unsigned int v11;
  int v12;
  _BYTE *v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  char __s1[1009];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)_os_object_alloc();
  v5 = v4;
  if (v4)
  {
    v6 = &_mdns_domain_name_kind;
    v4[2] = &_mdns_domain_name_kind;
    do
    {
      v7 = (void (*)(_QWORD *))v6[2];
      if (v7)
        v7(v5);
      v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    DomainNameDupEx(a1, 0, (unsigned __int8 **)v5 + 3, v5 + 4);
    v8 = DomainNameToString((unsigned __int8 *)v5[3], 0, (unsigned __int8 *)__s1, 0);
    if (v8)
    {
      v19 = v8;
      v4 = v5;
      v5 = 0;
    }
    else
    {
      v9 = strdup(__s1);
      if (!v9)
        __break(1u);
      v5[5] = v9;
      *((_DWORD *)v5 + 13) = 0;
      v10 = (_BYTE *)v5[3];
      v11 = *v10;
      if (*v10)
      {
        v12 = 0;
        v13 = (_BYTE *)v5[3];
        while (v11 <= 0x3F)
        {
          v13 += v11 + 1;
          if (v13 - v10 > 255)
            break;
          ++v12;
          v11 = *v13;
          if (!*v13)
            goto LABEL_15;
        }
        v12 = -1;
      }
      else
      {
        v12 = 0;
      }
LABEL_15:
      *((_DWORD *)v5 + 12) = v12;
      v14 = v5[4];
      if (v14)
      {
        if (*v10 - 65 >= 0x1A)
        {
          v16 = 1;
          while (v14 != v16)
          {
            v17 = v10[v16++] - 65;
            if (v17 <= 0x19)
            {
              v18 = v16 - 1;
              goto LABEL_24;
            }
          }
          v18 = v5[4];
LABEL_24:
          v15 = v18 >= v14;
        }
        else
        {
          v15 = 0;
        }
      }
      else
      {
        v15 = 1;
      }
      v4 = 0;
      v19 = 0;
      *((_BYTE *)v5 + 61) = v15;
    }
  }
  else
  {
    v19 = -6728;
  }
  if (a2)
    *a2 = v19;
  if (v4)
    os_release(v4);
  return v5;
}

_QWORD *___mdns_domain_name_get_root_block_invoke()
{
  _QWORD *result;
  char v1;

  v1 = 0;
  result = _mdns_domain_name_create(&v1, 0);
  *((_DWORD *)result + 2) = 0x7FFFFFFF;
  *((_DWORD *)result + 3) = 0x7FFFFFFF;
  _mdns_domain_name_get_root_s_root = (uint64_t)result;
  return result;
}

uint64_t mdns_domain_name_get_presentation(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

dispatch_queue_t ___mdns_dso_session_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.dso-session-queue", 0);
  _mdns_dso_session_queue_s_queue = (uint64_t)result;
  return result;
}

os_log_t ___mdns_dso_session_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "dso_session");
  _mdns_dso_session_log_s_log = (uint64_t)result;
  return result;
}

void __mdns_dso_session_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  const void *v9;
  const void *v10;
  uint64_t v11;
  __uint64_t v12;
  unint64_t v13;
  int64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 184))())
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 72);
    if (v3)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 72));
      dispatch_release(v3);
      *(_QWORD *)(v2 + 72) = 0;
    }
    *(_QWORD *)(v2 + 32) = 0;
    *(_QWORD *)(v2 + 104) = 0;
    v4 = *(NSObject **)(v2 + 80);
    if (v4)
    {
      nw_connection_cancel(v4);
      v5 = *(void **)(v2 + 80);
      if (v5)
      {
        nw_release(v5);
        *(_QWORD *)(v2 + 80) = 0;
      }
      v6 = *(void **)(v2 + 88);
      if (v6)
      {
        free(v6);
        *(_QWORD *)(v2 + 88) = 0;
      }
      v7 = *(void **)(v2 + 96);
      if (v7)
      {
        free(v7);
        *(_QWORD *)(v2 + 96) = 0;
      }
      *(_DWORD *)(v2 + 112) = 0;
    }
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v2 + 16) + 176))(v2, 0, 0, 1, 0, 0);
    v8 = *(_QWORD **)(a1 + 32);
    v9 = (const void *)v8[7];
    if (v9)
    {
      _Block_release(v9);
      v8[7] = 0;
    }
    v10 = (const void *)v8[8];
    if (v10)
    {
      _Block_release(v10);
      v8[8] = 0;
    }
    (*(void (**)(_QWORD *))(v8[2] + 192))(v8);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (!v12 && (!*__error() || *__error()))
    v12 = 1;
  v13 = (v12 - v11) / 0xF4240;
  if (__ROR8__(0x790FB65668C26139 * v13, 6) <= 0x10C6F7A0B5EDuLL)
    v14 = (v12 - v11) / 0xF4240;
  else
    v14 = v13 + 1;
  if (_mdns_dso_session_log_s_once != -1)
    dispatch_once(&_mdns_dso_session_log_s_once, &__block_literal_global_553);
  v15 = _mdns_dso_session_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_dso_session_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v17 = 134218496;
    v18 = v16;
    v19 = 2048;
    v20 = (unint64_t)((unsigned __int128)(v14 * (__int128)0x20C49BA5E353F7CFLL) >> 64) >> 7;
    v21 = 2048;
    v22 = v14 - 1000 * v20;
    _os_log_impl(&dword_22983F000, v15, OS_LOG_TYPE_DEFAULT, "[DSO%llu] DSO session invalidated -- duration: %{mdns:time_duration}lld %lldms", (uint8_t *)&v17, 0x20u);
  }
  os_release(*(void **)(a1 + 32));
}

void *_mdns_extended_dns_error_copy_description(uint64_t a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  int appended;
  void *v11;
  uint64_t v13;

  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v7, "code: %u", *(unsigned __int16 *)(a1 + 32))|| (v9 = *(unsigned __int16 *)(a1 + 32), v9 <= 0x18)&& mdns_string_builder_append_formatted(v7, " (%s)", off_24F2861D8[v9])|| mdns_string_builder_append_formatted(v7, ", extra-text: ")|| (!a3? ((v11 = *(void **)(a1 + 24)) == 0 || !xpc_string_get_string_ptr(v11)? (appended = mdns_string_builder_append_formatted(v7, "«EXTRA TEXT»")): (appended = mdns_string_builder_append_formatted(v7, "'%s'"))): (appended = mdns_string_builder_append_formatted(v7, "«REDACTED»", v13)), appended))
  {
    v8 = 0;
  }
  else
  {
    v8 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v8;
}

void _mdns_extended_dns_error_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

xpc_object_t ___mdns_copy_empty_string_block_invoke()
{
  xpc_object_t result;

  result = xpc_string_create("");
  _mdns_copy_empty_string_s_empty_string = (uint64_t)result;
  return result;
}

size_t mdns_snprintf_add(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  size_t v11;
  size_t v12;
  size_t v13;

  if (a1)
    v10 = *a1;
  else
    v10 = 0;
  if (a1)
    v11 = a2 - (_QWORD)v10;
  else
    v11 = 0;
  v12 = vsnprintf(v10, v11, a3, &a9);
  v13 = v12;
  if (a1 && v11 && (v12 & 0x80000000) == 0)
  {
    if (v11 <= v12)
      v12 = strlen(v10);
    else
      v12 = v12;
    *a1 = &v10[v12];
  }
  return v13;
}

void mdns_replace_string(void **a1, char *__s1)
{
  char *v3;

  if (__s1)
  {
    v3 = strdup(__s1);
    if (v3)
      goto LABEL_5;
    __break(1u);
  }
  v3 = 0;
LABEL_5:
  if (*a1)
    free(*a1);
  *a1 = v3;
}

char *mdns_cfstring_to_utf8_cstring(const __CFString *a1)
{
  char *v1;
  const char *CStringPtr;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  UInt8 *v6;
  CFIndex usedBufLen;
  CFRange v9;

  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    v1 = strdup(CStringPtr);
    if (!v1)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
  }
  else
  {
    Length = CFStringGetLength(a1);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    if (MaximumSizeForEncoding == -1)
      goto LABEL_9;
    v6 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0xA172743EuLL);
    if (!v6)
      goto LABEL_9;
    v1 = (char *)v6;
    usedBufLen = 0;
    v9.location = 0;
    v9.length = Length;
    if (CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, v6, MaximumSizeForEncoding, &usedBufLen) != Length)
    {
LABEL_10:
      free(v1);
      return 0;
    }
    v1[usedBufLen] = 0;
  }
  return v1;
}

uint64_t __Block_byref_object_copy__688(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__689(uint64_t a1)
{

}

void __http_task_create_dns_query_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v20;
  BOOL v21;

  v18 = a2;
  v7 = a3;
  v8 = a4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (v8)
    {
      nw_activity_complete_with_reason();
      goto LABEL_5;
    }
    nw_activity_complete_with_reason();
LABEL_10:
    getHeuristicsQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v12, &__block_literal_global_255);
LABEL_17:

    goto LABEL_18;
  }
  if (!v8)
    goto LABEL_10;
LABEL_5:
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD1308];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD1308]))
    v11 = objc_msgSend(v8, "code") == -999 || objc_msgSend(v8, "code") == -1009;
  else
    v11 = 0;

  objc_msgSend(v8, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v10))
    v14 = objc_msgSend(v8, "code") == -1001;
  else
    v14 = 0;

  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    getHeuristicsQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __dns_heuristics_report_resolution_failure_block_invoke;
    block[3] = &unk_24F285800;
    v20 = v15;
    v21 = v14;
    v12 = v15;
    dispatch_async(v16, block);

    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v7, "statusCode");
  v17 = (void *)objc_msgSend(v18, "_createDispatchData");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id _http_task_create_data_task(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a1;
  v4 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__688;
  v12 = __Block_byref_object_dispose__689;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = ___http_task_create_data_task_block_invoke;
  v7[3] = &unk_24F286920;
  v7[5] = v4;
  v7[6] = &v8;
  v7[4] = v3;
  _http_task_shared_session_critical_region(v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_229859ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___http_task_create_data_task_block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)g_shared_session;
  if (!g_shared_session)
  {
    if (_http_task_create_shared_session_s_once != -1)
      dispatch_once(&_http_task_create_shared_session_s_once, &__block_literal_global_126);
    +[NSURLSessionConfiguration ephemeralSessionConfiguration](&off_255A70EE8, "ephemeralSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHTTPCookieStorage:", 0);
    objc_msgSend(v3, "setURLCache:", 0);
    objc_msgSend(v3, "setURLCredentialStorage:", 0);
    +[NSSet setWithObjects:](&off_255A6DB40, "setWithObjects:", CFSTR("User-Agent"), CFSTR("Accept-Language"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_suppressedAutoAddedHTTPHeaders:", v4);

    objc_msgSend(v3, "set_allowsTLSSessionTickets:", 1);
    objc_msgSend(v3, "set_allowsTCPFastOpen:", 1);
    objc_msgSend(v3, "set_disableAPWakeOnIdleConnections:", 1);
    v5 = objc_alloc_init((Class)&off_255A72818);
    if (_mdns_resolver_queue_s_once != -1)
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
    v6 = (id)_mdns_resolver_queue_s_queue;
    objc_msgSend(v5, "setUnderlyingQueue:", v6);

    +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](&off_255A72358, "sessionWithConfiguration:delegate:delegateQueue:", v3, _http_task_create_shared_session_delegate, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)g_shared_session;
    g_shared_session = v7;

    v2 = (void *)g_shared_session;
  }
  objc_msgSend(v2, "dataTaskWithRequest:completionHandler:", a1[4], a1[5]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void _http_task_shared_session_critical_region(void *a1)
{
  void (**v1)(_QWORD);

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_http_task_shared_session_critical_region_s_lock);
  v1[2](v1);

  os_unfair_lock_unlock((os_unfair_lock_t)&_http_task_shared_session_critical_region_s_lock);
}

void ___http_task_create_shared_session_block_invoke()
{
  MDNSHTTPSessionDelegate *v0;
  void *v1;

  +[NSURLSession _disableAppSSO](&off_255A72358, "_disableAppSSO");
  +[NSURLSession _disableATS](&off_255A72358, "_disableATS");
  v0 = objc_alloc_init(MDNSHTTPSessionDelegate);
  v1 = (void *)_http_task_create_shared_session_delegate;
  _http_task_create_shared_session_delegate = (uint64_t)v0;

}

void *http_task_create_pvd_query(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a1;
  v8 = a4;
  v9 = (void *)MEMORY[0x22E2D174C]();
  +[NSString stringWithFormat:](&off_255A6E8D0, "stringWithFormat:", CFSTR("https://%s/.well-known/pvd%s"), a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc((Class)&off_255A6E220);
  v12 = (void *)objc_msgSend(objc_alloc((Class)&off_255A6E430), "initWithString:", v10);
  v13 = (void *)objc_msgSend(v11, "initWithURL:", v12);

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/pvd+json"), CFSTR("accept"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/pvd+json"), CFSTR("content-type"));
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__688;
  v27 = __Block_byref_object_dispose__689;
  v28 = (id)nw_activity_create();
  if (v24[5])
    nw_activity_activate();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __http_task_create_pvd_query_block_invoke;
  v19[3] = &unk_24F286470;
  v14 = v7;
  v20 = v14;
  v22 = &v23;
  v15 = v8;
  v21 = v15;
  _http_task_create_data_task(v13, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && v24[5])
  {
    v17 = (void *)nw_activity_create();
    objc_msgSend(v16, "set_nw_activity:", v17);

  }
  _Block_object_dispose(&v23, 8);

  objc_autoreleasePoolPop(v9);
  return v16;
}

void sub_229859F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __http_task_create_pvd_query_block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[5];
  __int128 v8;

  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __http_task_create_pvd_query_block_invoke_2;
  block[3] = &unk_24F286920;
  block[4] = a2;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v8 = v6;
  v5 = a2;
  dispatch_async(v3, block);

}

void __http_task_create_pvd_query_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    +[NSJSONSerialization JSONObjectWithData:options:error:](&off_255A71108, "JSONObjectWithData:options:error:", v2, 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("expires"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("seconds-remaining"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || v5)
        {
          if (v5)
            xpc_dictionary_set_uint64(v3, "seconds-remaining", objc_msgSend(v5, "unsignedLongLongValue"));
        }
        else
        {
          v6 = objc_alloc_init((Class)&off_255A716F8);
          +[NSTimeZone timeZoneForSecondsFromGMT:](&off_255A71838, "timeZoneForSecondsFromGMT:", 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setTimeZone:", v7);

          +[NSLocale localeWithLocaleIdentifier:](&off_255A71940, "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setLocale:", v8);

          objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
          objc_msgSend(v6, "setFormatterBehavior:", 0);
          objc_msgSend(v6, "dateFromString:", v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timeIntervalSinceNow");
          xpc_dictionary_set_uint64(v3, "seconds-remaining", (unint64_t)v10);

        }
      }
      nw_activity_complete_with_reason();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      nw_activity_complete_with_reason();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    nw_activity_complete_with_reason();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void http_task_cancel(void *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2D174C]();
  objc_msgSend(a1, "cancel");

  objc_autoreleasePoolPop(v2);
}

void __http_task_prepare_for_system_sleep_block_invoke()
{
  void *v0;

  if (g_shared_session)
  {
    objc_msgSend((id)g_shared_session, "invalidateAndCancel");
    v0 = (void *)g_shared_session;
    g_shared_session = 0;

  }
}

char *_mdns_interface_monitor_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *name;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int v18;
  char *result;
  char *v20;
  char __s1[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = __s1;
  __s1[0] = 0;
  if (!a2
    || (mdns_snprintf_add(&v20, (uint64_t)&v22, "<%s: %p>: ", a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8)) & 0x80000000) == 0)
  {
    if (*(_DWORD *)(a1 + 136))
    {
      name = *(NSObject **)(a1 + 80);
    }
    else
    {
      name = *(NSObject **)(a1 + 128);
      if (name)
        name = nw_interface_get_name(name);
    }
    v10 = "";
    if (name)
      LOBYTE(v10) = (_BYTE)name;
    if ((mdns_snprintf_add(&v20, (uint64_t)&v22, "interface %s/%u: ", a4, a5, a6, a7, a8, (char)v10) & 0x80000000) == 0)
    {
      v16 = 0;
      v17 = "";
      while (1)
      {
        if (((uint64_t)(&off_24F286590)[v16 + 1] & *(_DWORD *)(a1 + 144)) != 0)
        {
          v18 = mdns_snprintf_add(&v20, (uint64_t)&v22, "%s%s", v11, v12, v13, v14, v15, (char)v17);
          v17 = ", ";
          if (v18 < 0)
            break;
        }
        v16 += 2;
        if (v16 == 14)
        {
          result = strdup(__s1);
          if (!result)
            __break(1u);
          return result;
        }
      }
    }
  }
  return 0;
}

void _mdns_interface_monitor_finalize(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  const void *v4;
  const void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a1[4];
  if (v2)
  {
    dispatch_release(v2);
    a1[4] = 0;
  }
  v3 = (void *)a1[5];
  if (v3)
  {
    nw_release(v3);
    a1[5] = 0;
  }
  v4 = (const void *)a1[8];
  if (v4)
  {
    _Block_release(v4);
    a1[8] = 0;
  }
  v5 = (const void *)a1[9];
  if (v5)
  {
    _Block_release(v5);
    a1[9] = 0;
  }
  v6 = (void *)a1[10];
  if (v6)
  {
    free(v6);
    a1[10] = 0;
  }
  v7 = (void *)a1[15];
  if (v7)
  {
    nw_release(v7);
    a1[15] = 0;
  }
  v8 = (void *)a1[16];
  if (v8)
  {
    nw_release(v8);
    a1[16] = 0;
  }
  _mdns_interface_monitor_forget_signatures((uint64_t)a1);
}

void _mdns_interface_monitor_forget_signatures(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 88);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 88) = 0;
  }
  *(_QWORD *)(a1 + 96) = 0;
  v3 = *(void **)(a1 + 104);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 104) = 0;
  }
  *(_QWORD *)(a1 + 112) = 0;
  *(_WORD *)(a1 + 152) = 0;
}

uint64_t mdns_interface_monitor_create(unsigned int a1)
{
  uint64_t v2;
  uint64_t v3;
  _UNKNOWN **v4;
  void (*v5)(uint64_t);
  char *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t evaluator_for_endpoint;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  int v21;
  _QWORD v22[5];
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = _os_object_alloc();
  v3 = v2;
  if (!v2)
    return v3;
  v4 = &_mdns_interface_monitor_kind;
  *(_QWORD *)(v2 + 16) = &_mdns_interface_monitor_kind;
  do
  {
    v5 = (void (*)(uint64_t))v4[2];
    if (v5)
      v5(v3);
    v4 = (_UNKNOWN **)*v4;
  }
  while (v4);
  *(_DWORD *)(v3 + 148) = 0;
  *(_DWORD *)(v3 + 136) = a1;
  if (a1)
  {
    v6 = mdns_system_interface_index_to_name(a1);
    *(_QWORD *)(v3 + 80) = v6;
    if (v6)
    {
      v7 = nw_interface_create_with_index();
      if (v7)
      {
        v8 = v7;
        v9 = nw_parameters_create();
        if (v9)
        {
          v10 = v9;
          nw_parameters_require_interface(v9, v8);
          evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
          *(_QWORD *)(v3 + 40) = evaluator_for_endpoint;
          if (evaluator_for_endpoint)
          {
            v12 = nw_path_evaluator_copy_path();
            if (v12)
            {
              v13 = v12;
LABEL_13:
              *(_DWORD *)(v3 + 140) = _mdns_get_interface_flags_from_nw_path(v13, 0);
              goto LABEL_21;
            }
            if (_mdns_ifmon_log_s_once != -1)
              dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
            v19 = _mdns_ifmon_log_s_log;
            if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
            {
LABEL_46:
              os_release((void *)v3);
              v3 = 0;
              v13 = 0;
              if (!v8)
                goto LABEL_23;
              goto LABEL_22;
            }
            *(_WORD *)buf = 0;
            v20 = "Failed to copy path from path evaluator";
          }
          else
          {
            if (_mdns_ifmon_log_s_once != -1)
              dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
            v19 = _mdns_ifmon_log_s_log;
            if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
              goto LABEL_46;
            *(_WORD *)buf = 0;
            v20 = "Failed to create path evaluator";
          }
          _os_log_error_impl(&dword_22983F000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
          goto LABEL_46;
        }
        if (_mdns_ifmon_log_s_once != -1)
          dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
        v18 = _mdns_ifmon_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_22983F000, v18, OS_LOG_TYPE_ERROR, "Failed to create params", buf, 2u);
        }
        v10 = 0;
        goto LABEL_46;
      }
      if (_mdns_ifmon_log_s_once != -1)
        dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
      v17 = _mdns_ifmon_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_DWORD *)(v3 + 136);
        *(_DWORD *)buf = 67109120;
        v24 = v21;
        _os_log_error_impl(&dword_22983F000, v17, OS_LOG_TYPE_ERROR, "Failed to create interface for index %u", buf, 8u);
      }
    }
    v10 = 0;
    v8 = 0;
    goto LABEL_46;
  }
  v8 = nw_path_create_evaluator_for_endpoint();
  if (v8)
  {
    v13 = nw_path_evaluator_copy_path();
    nw_release(v8);
    if (v13)
    {
      v14 = nw_path_copy_interface();
      v8 = v14;
      if (v14)
      {
        *(_QWORD *)(v3 + 120) = v14;
        nw_retain(v14);
        v15 = *(void **)(v3 + 120);
        *(_QWORD *)(v3 + 128) = v15;
        nw_retain(v15);
        nw_release(v8);
        v10 = 0;
        v8 = 0;
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_13;
    }
    v8 = 0;
  }
  else
  {
    v13 = 0;
  }
  v10 = 0;
LABEL_21:
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 0x40000000;
  v22[2] = __mdns_interface_monitor_create_block_invoke;
  v22[3] = &__block_descriptor_tmp_737;
  v22[4] = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  __mdns_interface_monitor_create_block_invoke((uint64_t)v22);
  os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  *(_DWORD *)(v3 + 144) = *(_DWORD *)(v3 + 140);
  if (v8)
LABEL_22:
    nw_release(v8);
LABEL_23:
  if (v10)
    nw_release(v10);
  if (v13)
    nw_release(v13);
  return v3;
}

uint64_t _mdns_get_interface_flags_from_nw_path(NSObject *a1, int a2)
{
  unsigned int v3;

  v3 = a2 & 0xFFFFFFF0 | nw_path_has_ipv4(a1);
  if (nw_path_has_ipv6(a1))
    v3 |= 2u;
  if (nw_path_is_expensive(a1))
    v3 |= 4u;
  if (nw_path_is_constrained(a1))
    return v3 | 8;
  else
    return v3;
}

uint64_t __mdns_interface_monitor_create_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *name;
  NSObject *v4;
  BOOL v5;
  uint64_t ifstate;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 136))
  {
    name = *(const char **)(v2 + 80);
  }
  else
  {
    v4 = *(NSObject **)(v2 + 120);
    if (!v4)
    {
LABEL_10:
      ifstate = 0;
      goto LABEL_11;
    }
    name = nw_interface_get_name(v4);
  }
  if (name)
    v5 = g_nwi_state == 0;
  else
    v5 = 1;
  if (v5)
    goto LABEL_10;
  ifstate = nwi_state_get_ifstate();
LABEL_11:
  _mdns_interface_monitor_update_signatures_from_nwi_state(*(_QWORD *)(a1 + 32), ifstate);
  result = _mdns_get_interface_flags_from_nwi_state(ifstate, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 140));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 140) = result;
  return result;
}

uint64_t _mdns_interface_monitor_update_signatures_from_nwi_state(uint64_t a1, uint64_t a2)
{
  void *signature;
  int v5;
  int updated;
  void *v7;
  int v8;
  _BYTE *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  const char *v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  if (a2)
  {
    signature = (void *)nwi_ifstate_get_signature();
    v5 = v20;
  }
  else
  {
    v5 = 0;
    signature = 0;
  }
  updated = _mdns_interface_monitor_update_signature((const void **)(a1 + 88), (_QWORD *)(a1 + 96), (char *)(a1 + 152), signature, v5 & ~(v5 >> 31));
  v20 = 0;
  if (a2)
  {
    v7 = (void *)nwi_ifstate_get_signature();
    v8 = v20;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = (_BYTE *)(a1 + 153);
  v10 = _mdns_interface_monitor_update_signature((const void **)(a1 + 104), (_QWORD *)(a1 + 112), (char *)(a1 + 153), v7, v8 & ~(v8 >> 31));
  if ((updated & v10 & 1) != 0)
  {
    v11 = 1;
  }
  else if ((updated & 1) != 0)
  {
    v11 = (v10 & 1) == 0 && *v9 == 0;
  }
  else if (*(_BYTE *)(a1 + 152))
  {
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }
  if (_mdns_ifmon_log_s_once != -1)
    dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
  v12 = _mdns_ifmon_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(const char **)(a1 + 80);
    if (!v14)
      v14 = "";
    v15 = *(unsigned __int8 *)(a1 + 152);
    if (*(_BYTE *)(a1 + 152))
      v15 = *(_DWORD *)(a1 + 96);
    v16 = *(_DWORD *)(a1 + 136);
    v17 = *(_QWORD *)(a1 + 88);
    v18 = *v9;
    if (*v9)
      v18 = *(_DWORD *)(a1 + 112);
    v19 = *(_QWORD *)(a1 + 104);
    v20 = 136447746;
    v21 = v14;
    v22 = 1024;
    v23 = v16;
    v24 = 1040;
    v25 = v15;
    v26 = 2096;
    v27 = v17;
    v28 = 1040;
    v29 = v18;
    v30 = 2096;
    v31 = v19;
    v32 = 1024;
    v33 = v11;
    _os_log_debug_impl(&dword_22983F000, v12, OS_LOG_TYPE_DEBUG, "Signature update -- interface: %{public}s/%u, IPv4: %{mdns:base64}.*P, IPv6: %{mdns:base64}.*P, network changed: %{mdns:yesno}d", (uint8_t *)&v20, 0x38u);
  }
  return v11;
}

uint64_t _mdns_get_interface_flags_from_nwi_state(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = a2 & 0xFFFFFFCF;
  if (a1)
  {
    LODWORD(v2) = (nwi_ifstate_get_flags() >> 2) & 0x10 | v2;
    if (nwi_ifstate_get_vpn_server())
      return v2 | 0x20;
    else
      return v2;
  }
  return v2;
}

uint64_t _mdns_interface_monitor_update_signature(const void **a1, _QWORD *a2, char *a3, void *__s2, size_t __n)
{
  void *v10;
  uint64_t result;
  uint64_t v12;
  char v13;

  if (!__n)
  {
    v13 = 0;
    if (*a3)
      goto LABEL_10;
    return 0;
  }
  v10 = (void *)*a1;
  if (*a2 == __n && !memcmp(*a1, __s2, __n))
  {
    if (!*a3)
      goto LABEL_8;
    return 0;
  }
  if (v10)
  {
    free(v10);
    *a1 = 0;
  }
  *a2 = 0;
  result = (uint64_t)malloc_type_malloc(__n, 0xA172743EuLL);
  if (result)
  {
    v12 = result;
    memcpy((void *)result, __s2, __n);
    *a1 = (const void *)v12;
    *a2 = __n;
LABEL_8:
    v13 = 1;
LABEL_10:
    *a3 = v13;
    return 1;
  }
  __break(1u);
  return result;
}

os_log_t ___mdns_ifmon_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "interface_monitor");
  _mdns_ifmon_log_s_log = (uint64_t)result;
  return result;
}

void mdns_interface_monitor_activate(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 154))
  {
    if (*(_QWORD *)(a1 + 32))
      _mdns_interface_monitor_activate_async((void *)a1);
    *(_BYTE *)(a1 + 154) = 1;
  }
}

void _mdns_interface_monitor_activate_async(void *a1)
{
  _QWORD block[5];

  os_retain(a1);
  if (_mdns_internal_queue_s_once != -1)
    dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_7);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___mdns_interface_monitor_activate_async_block_invoke;
  block[3] = &__block_descriptor_tmp_21_745;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_internal_queue_s_queue, block);
}

void ___mdns_interface_monitor_activate_async_block_invoke(uint64_t a1)
{
  uint64_t v2;
  SCDynamicStoreRef v3;
  int v4;
  CFStringRef NetworkInterface;
  int v6;
  const __CFArray *v7;
  const __CFArray *v8;
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  dispatch_source_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  nw_path_monitor_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  const char *notify_key;
  uint32_t v31;
  uint32_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  _QWORD cancel_handler[5];
  _QWORD update_handler[15];
  void *values[5];
  __int128 buf;
  void (*v43)(uint64_t);
  void *v44;
  uint64_t v45;
  uint8_t v46[4];
  uint32_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 155) || *(_BYTE *)(v2 + 156))
    goto LABEL_68;
  *(_BYTE *)(v2 + 155) = 1;
  if (!_mdns_start_interface_availability_monitoring_s_store)
  {
    v3 = SCDynamicStoreCreate(0, CFSTR("com.apple.mdns.interface-monitor"), (SCDynamicStoreCallBack)_mdns_store_changed, 0);
    if (v3)
      goto LABEL_7;
    if (SCError())
    {
      v4 = SCError();
      if (!v4)
      {
LABEL_7:
        NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, (CFStringRef)*MEMORY[0x24BDF59B0]);
        if (NetworkInterface)
          goto LABEL_10;
        if (SCError())
        {
          v6 = SCError();
          if (!v6)
          {
LABEL_10:
            values[0] = (void *)NetworkInterface;
            v7 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x24BDBD690]);
            if (v7)
            {
              v8 = v7;
              if (!SCDynamicStoreSetNotificationKeys(v3, v7, 0))
              {
                if (SCError())
                {
                  v9 = SCError();
                  if (!v9)
                    goto LABEL_14;
                  v15 = v9;
                }
                else
                {
                  v15 = -6700;
                }
                if (_mdns_ifmon_log_s_once != -1)
                  dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
                v16 = _mdns_ifmon_log_s_log;
                if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
                {
LABEL_40:
                  if (!v3)
                    goto LABEL_42;
LABEL_41:
                  CFRelease(v3);
                  goto LABEL_42;
                }
                LODWORD(buf) = 134217984;
                *(_QWORD *)((char *)&buf + 4) = v15;
                v17 = "Failed to set notification keys for interface availability monitoring: %{mdns:err}ld";
LABEL_72:
                _os_log_error_impl(&dword_22983F000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&buf, 0xCu);
                if (!v3)
                  goto LABEL_42;
                goto LABEL_41;
              }
LABEL_14:
              if (_mdns_internal_queue_s_once != -1)
                dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_7);
              if (SCDynamicStoreSetDispatchQueue(v3, (dispatch_queue_t)_mdns_internal_queue_s_queue))
                goto LABEL_19;
              if (SCError())
              {
                v10 = SCError();
                if (!v10)
                {
LABEL_19:
                  _mdns_start_interface_availability_monitoring_s_store = (uint64_t)v3;
LABEL_42:
                  if (NetworkInterface)
                    CFRelease(NetworkInterface);
                  if (v8)
                    CFRelease(v8);
                  goto LABEL_46;
                }
                v18 = v10;
              }
              else
              {
                v18 = -6700;
              }
              if (_mdns_ifmon_log_s_once != -1)
                dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
              v16 = _mdns_ifmon_log_s_log;
              if (!os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
                goto LABEL_40;
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = v18;
              v17 = "Failed to set dispatch queue for interface availability monitoring: %{mdns:err}ld";
              goto LABEL_72;
            }
            if (_mdns_ifmon_log_s_once != -1)
              dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
            v37 = _mdns_ifmon_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              v34 = "Failed to create notification keys array for interface availability monitoring";
              v35 = v37;
              v36 = 2;
              goto LABEL_70;
            }
            goto LABEL_29;
          }
          v13 = v6;
        }
        else
        {
          v13 = -6700;
        }
        if (_mdns_ifmon_log_s_once != -1)
          dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
        v14 = _mdns_ifmon_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v13;
          v34 = "Failed to create interfaces state key for interface availability monitoring: %{mdns:err}ld";
          v35 = v14;
          v36 = 12;
LABEL_70:
          _os_log_error_impl(&dword_22983F000, v35, OS_LOG_TYPE_ERROR, v34, (uint8_t *)&buf, v36);
        }
LABEL_29:
        v8 = 0;
        if (!v3)
          goto LABEL_42;
        goto LABEL_41;
      }
      v11 = v4;
    }
    else
    {
      v11 = -6700;
    }
    if (_mdns_ifmon_log_s_once != -1)
      dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
    v12 = _mdns_ifmon_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_error_impl(&dword_22983F000, v12, OS_LOG_TYPE_ERROR, "Failed to create store for interface availability monitoring: %{mdns:err}ld", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_46:
  v19 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, *(dispatch_queue_t *)(v2 + 32));
  *(_QWORD *)(v2 + 56) = v19;
  if (!v19)
  {
LABEL_82:
    _mdns_interface_monitor_terminate((_QWORD *)v2, -6729);
    goto LABEL_68;
  }
  os_retain((void *)v2);
  v20 = (void *)MEMORY[0x24BDAC760];
  v21 = *(NSObject **)(v2 + 56);
  *(_QWORD *)&buf = MEMORY[0x24BDAC760];
  *((_QWORD *)&buf + 1) = 0x40000000;
  v43 = ___mdns_interface_monitor_activate_internal_block_invoke;
  v44 = &__block_descriptor_tmp_22_752;
  v45 = v2;
  dispatch_source_set_event_handler(v21, &buf);
  v22 = *(NSObject **)(v2 + 56);
  values[0] = v20;
  values[1] = (void *)0x40000000;
  values[2] = ___mdns_interface_monitor_activate_internal_block_invoke_2;
  values[3] = &__block_descriptor_tmp_23_753;
  values[4] = (void *)v2;
  dispatch_source_set_cancel_handler(v22, values);
  dispatch_activate(*(dispatch_object_t *)(v2 + 56));
  if (*(_QWORD *)(v2 + 40))
  {
    os_retain((void *)v2);
    if (_mdns_internal_queue_s_once != -1)
      dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_7);
    update_handler[10] = v20;
    update_handler[11] = 0x40000000;
    update_handler[12] = ___mdns_interface_monitor_activate_internal_block_invoke_3;
    update_handler[13] = &__block_descriptor_tmp_25_754;
    update_handler[14] = v2;
    nw_path_evaluator_set_update_handler();
    update_handler[5] = v20;
    update_handler[6] = 0x40000000;
    update_handler[7] = ___mdns_interface_monitor_activate_internal_block_invoke_4;
    update_handler[8] = &__block_descriptor_tmp_26_755;
    update_handler[9] = v2;
    nw_path_evaluator_set_cancel_handler();
    nw_path_evaluator_start();
    *(_BYTE *)(v2 + 157) = 1;
  }
  if (*(_DWORD *)(v2 + 136))
    goto LABEL_56;
  v23 = nw_path_monitor_create();
  *(_QWORD *)(v2 + 48) = v23;
  if (!v23)
  {
    if (_mdns_ifmon_log_s_once != -1)
      dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
    v38 = _mdns_ifmon_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(update_handler[0]) = 0;
      _os_log_error_impl(&dword_22983F000, v38, OS_LOG_TYPE_ERROR, "Failed to create path monitor", (uint8_t *)update_handler, 2u);
    }
    goto LABEL_82;
  }
  v24 = v23;
  if (_mdns_internal_queue_s_once != -1)
    dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_7);
  nw_path_monitor_set_queue(v24, (dispatch_queue_t)_mdns_internal_queue_s_queue);
  os_retain((void *)v2);
  v25 = *(NSObject **)(v2 + 48);
  update_handler[0] = v20;
  update_handler[1] = 0x40000000;
  update_handler[2] = ___mdns_interface_monitor_activate_internal_block_invoke_27;
  update_handler[3] = &__block_descriptor_tmp_28_757;
  update_handler[4] = v2;
  nw_path_monitor_set_update_handler(v25, update_handler);
  v26 = *(NSObject **)(v2 + 48);
  cancel_handler[0] = v20;
  cancel_handler[1] = 0x40000000;
  cancel_handler[2] = ___mdns_interface_monitor_activate_internal_block_invoke_2_29;
  cancel_handler[3] = &__block_descriptor_tmp_30_758;
  cancel_handler[4] = v2;
  nw_path_monitor_set_cancel_handler(v26, cancel_handler);
  nw_path_monitor_start(*(nw_path_monitor_t *)(v2 + 48));
  *(_BYTE *)(v2 + 157) = 1;
LABEL_56:
  v27 = &g_monitor_list;
  do
  {
    v28 = v27;
    v29 = *v27;
    v27 = (uint64_t *)(*v27 + 24);
  }
  while (v29);
  os_retain((void *)v2);
  *v28 = v2;
  if (_mdns_start_nwi_state_monitoring_s_nwi_notify_token == -1)
  {
    notify_key = (const char *)nwi_state_get_notify_key();
    if (_mdns_internal_queue_s_once != -1)
      dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_7);
    v31 = notify_register_dispatch(notify_key, &_mdns_start_nwi_state_monitoring_s_nwi_notify_token, (dispatch_queue_t)_mdns_internal_queue_s_queue, &__block_literal_global_37);
    if (_mdns_start_nwi_state_monitoring_s_nwi_notify_token == -1)
    {
      v32 = v31;
      if (_mdns_nwi_log_s_once != -1)
        dispatch_once(&_mdns_nwi_log_s_once, &__block_literal_global_40);
      v33 = _mdns_nwi_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_nwi_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v46 = 67109120;
        v47 = v32;
        _os_log_error_impl(&dword_22983F000, v33, OS_LOG_TYPE_ERROR, "Failed to register for NWI state notifications (status %u)", v46, 8u);
      }
    }
    else
    {
      _mdns_nwi_state_update();
    }
  }
  _mdns_interface_monitor_check_nwi_state_for_updates(v2);
LABEL_68:
  os_release(*(void **)(a1 + 32));
}

ifaddrs *_mdns_store_changed()
{
  int v0;
  uint64_t i;
  int v2;
  unsigned int v3;
  ifaddrs *v4;
  sockaddr *ifa_addr;
  int v6;
  int v7;
  NSObject *v8;
  ifaddrs *result;
  ifaddrs *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  if (getifaddrs(&v10))
  {
    if (*__error())
    {
      v0 = *__error();
      if (!v0)
        goto LABEL_4;
    }
    else
    {
      v0 = -6700;
    }
    if (_mdns_ifmon_log_s_once != -1)
      dispatch_once(&_mdns_ifmon_log_s_once, &__block_literal_global_732);
    v8 = _mdns_ifmon_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ifmon_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v0;
      _os_log_error_impl(&dword_22983F000, v8, OS_LOG_TYPE_ERROR, "getifaddrs() failed: %{mdns:err}ld", buf, 0xCu);
    }
    goto LABEL_21;
  }
LABEL_4:
  for (i = g_monitor_list; i; i = *(_QWORD *)(i + 24))
  {
    v2 = *(_DWORD *)(i + 136);
    if (v2)
    {
      v3 = *(_DWORD *)(i + 140);
      v4 = v10;
      if (v10)
      {
        while (1)
        {
          ifa_addr = v4->ifa_addr;
          if (ifa_addr)
          {
            if (ifa_addr->sa_family == 18 && v2 == *(unsigned __int16 *)ifa_addr->sa_data)
              break;
          }
          v4 = v4->ifa_next;
          if (!v4)
            goto LABEL_11;
        }
        v7 = v3 & 0xFFFFFFBF;
        v6 = (v3 >> 6) & 1;
      }
      else
      {
LABEL_11:
        v6 = (*(_DWORD *)(i + 140) & 0x40) == 0;
        v7 = v3 | 0x40;
      }
      _mdns_interface_monitor_trigger_update(i, v7, v6);
    }
  }
LABEL_21:
  result = v10;
  if (v10)
    return (ifaddrs *)MEMORY[0x22E2D0EC4]();
  return result;
}

void ___mdns_interface_monitor_activate_internal_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v2 = *(_QWORD *)(a1 + 32);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2000000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = ___mdns_interface_monitor_update_block_invoke;
  v11[3] = &unk_24F2866E8;
  v11[4] = &v20;
  v11[5] = &v16;
  v11[6] = &v12;
  v11[7] = v2;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 148));
  ___mdns_interface_monitor_update_block_invoke(v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 148));
  v3 = *(_DWORD *)(v2 + 144);
  v4 = *((_DWORD *)v21 + 6);
  *(_DWORD *)(v2 + 144) = v4;
  v5 = *((unsigned __int8 *)v17 + 24);
  if (*(_DWORD *)(v2 + 136))
  {
    v6 = (void *)v13[3];
    if (!v6)
      goto LABEL_8;
    nw_release(v6);
    v7 = v13 + 3;
  }
  else
  {
    v8 = *(void **)(v2 + 128);
    if (v8)
    {
      nw_release(v8);
      *(_QWORD *)(v2 + 128) = 0;
    }
    v7 = v13 + 3;
    *(_QWORD *)(v2 + 128) = v13[3];
  }
  *v7 = 0;
LABEL_8:
  if (v5)
    v9 = v4 ^ v3 | 0x80;
  else
    v9 = v4 ^ v3;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  if ((_DWORD)v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    if (v10)
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v9);
  }
}

void ___mdns_interface_monitor_activate_internal_block_invoke_2(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
}

void ___mdns_interface_monitor_activate_internal_block_invoke_3(uint64_t a1, NSObject *a2)
{
  _mdns_interface_monitor_trigger_update_with_path(*(_QWORD *)(a1 + 32), a2);
}

void ___mdns_interface_monitor_activate_internal_block_invoke_4(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
}

void ___mdns_interface_monitor_activate_internal_block_invoke_27(uint64_t a1, NSObject *a2)
{
  _mdns_interface_monitor_trigger_update_with_path(*(_QWORD *)(a1 + 32), a2);
}

void ___mdns_interface_monitor_activate_internal_block_invoke_2_29(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
}

void _mdns_nwi_state_update()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t i;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v0 = nwi_state_copy();
  if (!v0)
  {
    if (_mdns_nwi_log_s_once != -1)
      dispatch_once(&_mdns_nwi_log_s_once, &__block_literal_global_40);
    v1 = _mdns_nwi_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_nwi_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v3) = 0;
      _os_log_error_impl(&dword_22983F000, v1, OS_LOG_TYPE_ERROR, "Failed to copy NWI state", (uint8_t *)&v3, 2u);
    }
  }
  v3 = 0;
  v4 = &v3;
  v5 = 0x2000000000;
  v6 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  v4[3] = g_nwi_state;
  g_nwi_state = v0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_nwi_locked_s_lock);
  if (v4[3])
    nwi_state_release();
  for (i = g_monitor_list; i; i = *(_QWORD *)(i + 24))
    _mdns_interface_monitor_check_nwi_state_for_updates(i);
  _Block_object_dispose(&v3, 8);
}

void _mdns_interface_monitor_check_nwi_state_for_updates(uint64_t a1)
{
  const char *name;
  NSObject *v3;
  BOOL v4;
  uint64_t ifstate;
  int interface_flags_from_nwi_state;
  int updated;

  if (*(_DWORD *)(a1 + 136))
  {
    name = *(const char **)(a1 + 80);
  }
  else
  {
    v3 = *(NSObject **)(a1 + 120);
    if (!v3)
    {
LABEL_10:
      ifstate = 0;
      goto LABEL_11;
    }
    name = nw_interface_get_name(v3);
  }
  if (name)
    v4 = g_nwi_state == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_10;
  ifstate = nwi_state_get_ifstate();
LABEL_11:
  interface_flags_from_nwi_state = _mdns_get_interface_flags_from_nwi_state(ifstate, *(_DWORD *)(a1 + 140));
  updated = _mdns_interface_monitor_update_signatures_from_nwi_state(a1, ifstate);
  _mdns_interface_monitor_trigger_update(a1, interface_flags_from_nwi_state, updated);
}

void _mdns_interface_monitor_terminate(_QWORD *object, int a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t *v10;
  NSObject *v11;
  _QWORD v12[5];
  int v13;

  v4 = object[7];
  if (v4)
  {
    dispatch_source_cancel((dispatch_source_t)object[7]);
    dispatch_release(v4);
    object[7] = 0;
  }
  v5 = (void *)object[5];
  if (v5)
  {
    if (!*((_BYTE *)object + 157) || (nw_path_evaluator_cancel(), (v5 = (void *)object[5]) != 0))
    {
      nw_release(v5);
      object[5] = 0;
    }
  }
  v6 = object[6];
  if (v6)
  {
    nw_path_monitor_cancel(v6);
    v7 = (void *)object[6];
    if (v7)
    {
      nw_release(v7);
      object[6] = 0;
    }
  }
  v8 = (_QWORD *)g_monitor_list;
  if (g_monitor_list)
  {
    if ((_QWORD *)g_monitor_list == object)
    {
      v10 = &g_monitor_list;
LABEL_16:
      *v10 = object[3];
      object[3] = 0;
      os_release(object);
    }
    else
    {
      while (1)
      {
        v9 = v8;
        v8 = (_QWORD *)v8[3];
        if (!v8)
          break;
        if (v8 == object)
        {
          v10 = v9 + 3;
          goto LABEL_16;
        }
      }
    }
  }
  os_retain(object);
  v11 = object[4];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = ___mdns_interface_monitor_terminate_block_invoke;
  v12[3] = &__block_descriptor_tmp_42_760;
  v13 = a2;
  v12[4] = object;
  dispatch_async(v11, v12);
}

void ___mdns_interface_monitor_terminate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void **v3;
  void (**v4)(const void *, uint64_t, _QWORD);
  uint64_t v5;

  v2 = *(unsigned int *)(a1 + 40);
  v3 = *(const void ***)(a1 + 32);
  v4 = (void (**)(const void *, uint64_t, _QWORD))v3[9];
  if (v4)
  {
    if ((_DWORD)v2)
      v5 = 1;
    else
      v5 = 2;
    v4[2](v3[9], v5, v2);
    v3 = *(const void ***)(a1 + 32);
  }
  if (!(_DWORD)v2 && v3[9])
  {
    _Block_release(v3[9]);
    v3 = *(const void ***)(a1 + 32);
    v3[9] = 0;
  }
  os_release(v3);
}

void _mdns_interface_monitor_trigger_update(uint64_t a1, int a2, int a3)
{
  os_unfair_lock_s *v7;
  NSObject *v8;

  if (*(_DWORD *)(a1 + 140) != a2 || a3 != 0)
  {
    v7 = (os_unfair_lock_s *)(a1 + 148);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 148));
    *(_DWORD *)(a1 + 140) = a2;
    if (a3)
      *(_BYTE *)(a1 + 158) = 1;
    os_unfair_lock_unlock(v7);
    v8 = *(NSObject **)(a1 + 56);
    if (v8)
      dispatch_source_merge_data(v8, 1uLL);
  }
}

os_log_t ___mdns_nwi_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "NWI");
  _mdns_nwi_log_s_log = (uint64_t)result;
  return result;
}

void _mdns_interface_monitor_trigger_update_with_path(uint64_t a1, NSObject *a2)
{
  _DWORD *v4;
  int interface_flags_from_nw_path;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint32_t index;
  NSObject *v10;
  BOOL v11;
  uint64_t ifstate;
  NSObject *v13;
  void *v14;
  _QWORD v15[6];
  int v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  if (*(_DWORD *)(a1 + 136))
    goto LABEL_2;
  v7 = nw_path_copy_interface();
  v19[3] = v7;
  v8 = *(_QWORD *)(a1 + 120);
  if (!v7)
  {
    v4 = (_DWORD *)(a1 + 140);
    interface_flags_from_nw_path = _mdns_get_interface_flags_from_nw_path(a2, *(_DWORD *)(a1 + 140));
    if (!v8)
      goto LABEL_3;
LABEL_10:
    _mdns_interface_monitor_forget_signatures(a1);
    v10 = v19[3];
    if (!v10 || (nw_interface_get_name(v10) ? (v11 = g_nwi_state == 0) : (v11 = 1), v11))
      ifstate = 0;
    else
      ifstate = nwi_state_get_ifstate();
    _mdns_interface_monitor_update_signatures_from_nwi_state(a1, ifstate);
    interface_flags_from_nw_path = _mdns_get_interface_flags_from_nwi_state(ifstate, interface_flags_from_nw_path);
    v6 = 1;
    goto LABEL_18;
  }
  if (!v8
    || (index = nw_interface_get_index(*(nw_interface_t *)(a1 + 120)),
        index != nw_interface_get_index((nw_interface_t)v19[3])))
  {
    interface_flags_from_nw_path = _mdns_get_interface_flags_from_nw_path(a2, *(_DWORD *)(a1 + 140));
    goto LABEL_10;
  }
LABEL_2:
  v4 = (_DWORD *)(a1 + 140);
  interface_flags_from_nw_path = _mdns_get_interface_flags_from_nw_path(a2, *(_DWORD *)(a1 + 140));
LABEL_3:
  if (*v4 == interface_flags_from_nw_path)
    goto LABEL_20;
  v6 = 0;
LABEL_18:
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 0x40000000;
  v15[2] = ___mdns_interface_monitor_trigger_update_with_path_block_invoke;
  v15[3] = &unk_24F286710;
  v16 = interface_flags_from_nw_path;
  v17 = v6;
  v15[4] = &v18;
  v15[5] = a1;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 148));
  ___mdns_interface_monitor_trigger_update_with_path_block_invoke((uint64_t)v15);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 148));
  v13 = *(NSObject **)(a1 + 56);
  if (v13)
    dispatch_source_merge_data(v13, 1uLL);
LABEL_20:
  v14 = (void *)v19[3];
  if (v14)
  {
    nw_release(v14);
    v19[3] = 0;
  }
  _Block_object_dispose(&v18, 8);
}

void ___mdns_interface_monitor_trigger_update_with_path_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(v1 + 140) = *(_DWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 52))
  {
    *(_BYTE *)(v1 + 158) = 1;
    v3 = *(void **)(v1 + 120);
    if (v3)
    {
      nw_release(v3);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120) = 0;
      v1 = *(_QWORD *)(a1 + 40);
    }
    *(_QWORD *)(v1 + 120) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void *___mdns_interface_monitor_update_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *result;

  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = *(_DWORD *)(a1[7] + 140);
  v1 = a1[7];
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(v1 + 158);
  *(_BYTE *)(v1 + 158) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(v1 + 120);
  result = *(void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (result)
    return nw_retain(result);
  return result;
}

dispatch_queue_t ___mdns_internal_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.interface-monitor", 0);
  _mdns_internal_queue_s_queue = (uint64_t)result;
  return result;
}

void mdns_interface_monitor_invalidate(void *a1)
{
  _QWORD block[5];

  os_retain(a1);
  if (_mdns_internal_queue_s_once != -1)
    dispatch_once(&_mdns_internal_queue_s_once, &__block_literal_global_7);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_interface_monitor_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_2_775;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_internal_queue_s_queue, block);
}

void __mdns_interface_monitor_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 156))
  {
    _mdns_interface_monitor_terminate((_QWORD *)v2, 0);
    v2 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v2 + 156) = 1;
  }
  os_release((void *)v2);
}

void mdns_interface_monitor_set_queue(uint64_t a1, dispatch_object_t object)
{
  NSObject *v4;

  if (*(_BYTE *)(a1 + 154))
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      *(_QWORD *)(a1 + 32) = object;
      dispatch_retain(object);
      _mdns_interface_monitor_activate_async((void *)a1);
    }
  }
  else
  {
    dispatch_retain(object);
    v4 = *(NSObject **)(a1 + 32);
    if (v4)
      dispatch_release(v4);
    *(_QWORD *)(a1 + 32) = object;
  }
}

void mdns_interface_monitor_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  v4 = *(const void **)(a1 + 72);
  if (v4)
    _Block_release(v4);
  *(_QWORD *)(a1 + 72) = v3;
}

void mdns_interface_monitor_set_update_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  v4 = *(const void **)(a1 + 64);
  if (v4)
    _Block_release(v4);
  *(_QWORD *)(a1 + 64) = v3;
}

uint64_t mdns_interface_monitor_get_interface_index(uint64_t a1)
{
  return *(unsigned int *)(a1 + 136);
}

uint64_t mdns_interface_monitor_has_ipv4_connectivity(uint64_t a1)
{
  return *(_DWORD *)(a1 + 144) & 1;
}

uint64_t mdns_interface_monitor_has_ipv6_connectivity(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 1) & 1;
}

uint64_t mdns_interface_monitor_is_expensive(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 2) & 1;
}

uint64_t mdns_interface_monitor_is_constrained(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 3) & 1;
}

uint64_t mdns_interface_monitor_is_clat46(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 4) & 1;
}

uint64_t mdns_interface_monitor_is_vpn(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 144) >> 5) & 1;
}

const void *mdns_managed_defaults_create(const char *a1, int *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  const __CFAllocator *v6;
  const __CFURL *v7;
  __CFReadStream *v8;
  __CFReadStream *v9;
  CFPropertyListRef v10;
  const void *v11;
  CFTypeID v12;
  int Code;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  CFErrorRef error;
  _BYTE cStr[12];
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)cStr = 0;
  asprintf((char **)cStr, "/Library/Managed Preferences/mobile/%s.plist", a1);
  if (!*(_QWORD *)cStr)
  {
    Code = -6728;
    goto LABEL_20;
  }
  v4 = CFStringCreateWithCStringNoCopy(0, *(const char **)cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  if (!v4)
  {
    if (*(_QWORD *)cStr)
      free(*(void **)cStr);
    goto LABEL_19;
  }
  v5 = v4;
  *(_QWORD *)cStr = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, kCFURLPOSIXPathStyle, 0);
  CFRelease(v5);
  if (!v7)
  {
LABEL_19:
    Code = -6729;
LABEL_20:
    if (_mdns_managed_defaults_log_s_once != -1)
      dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_799);
    v15 = _mdns_managed_defaults_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cStr = 136446466;
      *(_QWORD *)&cStr[4] = a1;
      v22 = 2048;
      v23 = Code;
      _os_log_error_impl(&dword_22983F000, v15, OS_LOG_TYPE_ERROR, "Failed to create URL -- domain: %{public}s, error: %{mdns:err}ld", cStr, 0x16u);
    }
    v11 = 0;
    if (a2)
      goto LABEL_14;
    return v11;
  }
  v8 = CFReadStreamCreateWithFile(v6, v7);
  v9 = v8;
  if (!v8)
  {
    Code = -6729;
LABEL_34:
    if (_mdns_managed_defaults_log_s_once != -1)
      dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_799);
    v17 = _mdns_managed_defaults_log_s_log;
    if (v9)
      v18 = OS_LOG_TYPE_DEBUG;
    else
      v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, v18))
    {
      *(_DWORD *)cStr = 138543618;
      *(_QWORD *)&cStr[4] = v7;
      v22 = 2048;
      v23 = Code;
      _os_log_impl(&dword_22983F000, v17, v18, "Failed to create read stream -- url: %{public}@, error: %{mdns:err}ld", cStr, 0x16u);
    }
    goto LABEL_41;
  }
  if (!CFReadStreamOpen(v8))
  {
    CFRelease(v9);
    Code = -6755;
    goto LABEL_34;
  }
  error = 0;
  v10 = CFPropertyListCreateWithStream(0, v9, 0, 0, 0, &error);
  if (v10)
  {
    v11 = v10;
    v12 = CFGetTypeID(v10);
    if (v12 == CFDictionaryGetTypeID())
    {
      Code = 0;
    }
    else
    {
      CFRelease(v11);
      v11 = 0;
      Code = -6756;
    }
  }
  else
  {
    if (error)
      Code = CFErrorGetCode(error);
    else
      Code = -6700;
    if (_mdns_managed_defaults_log_s_once != -1)
      dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_799);
    v19 = _mdns_managed_defaults_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cStr = 138543362;
      *(_QWORD *)&cStr[4] = error;
      _os_log_error_impl(&dword_22983F000, v19, OS_LOG_TYPE_ERROR, "CFPropertyListCreateWithStream failed: %{public}@", cStr, 0xCu);
    }
    v11 = 0;
  }
  if (error)
    CFRelease(error);
  CFRelease(v9);
  if (v11)
  {
    Code = 0;
    goto LABEL_13;
  }
  if (_mdns_managed_defaults_log_s_once != -1)
    dispatch_once(&_mdns_managed_defaults_log_s_once, &__block_literal_global_799);
  v16 = _mdns_managed_defaults_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_managed_defaults_log_s_log, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)cStr = 138543618;
    *(_QWORD *)&cStr[4] = v7;
    v22 = 2048;
    v23 = Code;
    _os_log_error_impl(&dword_22983F000, v16, OS_LOG_TYPE_ERROR, "Failed to create dictionary -- url: %{public}@, error: %{mdns:err}ld", cStr, 0x16u);
  }
LABEL_41:
  v11 = 0;
LABEL_13:
  CFRelease(v7);
  if (a2)
LABEL_14:
    *a2 = Code;
  return v11;
}

os_log_t ___mdns_managed_defaults_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "managed_defaults");
  _mdns_managed_defaults_log_s_log = (uint64_t)result;
  return result;
}

unint64_t mdns_managed_defaults_get_int_clamped(const __CFDictionary *a1, const void *a2, unint64_t a3, int *a4)
{
  const __CFNumber *Value;
  const __CFNumber *v7;
  CFTypeID v8;
  int v9;
  int64_t v10;
  uint64_t valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v7 = Value;
    v8 = CFGetTypeID(Value);
    if (v8 != CFNumberGetTypeID() || CFNumberIsFloatType(v7))
    {
      v9 = -6756;
    }
    else
    {
      valuePtr = 0;
      if (CFNumberGetValue(v7, kCFNumberSInt64Type, &valuePtr))
      {
        v9 = 0;
        v10 = valuePtr;
        if (valuePtr >= 0x7FFFFFFF)
          v10 = 0x7FFFFFFFLL;
        if (v10 <= (uint64_t)0xFFFFFFFF80000000)
          a3 = 0xFFFFFFFF80000000;
        else
          a3 = v10;
      }
      else
      {
        v9 = -6700;
      }
    }
  }
  else
  {
    v9 = -6727;
  }
  if (a4)
    *a4 = v9;
  return a3;
}

BOOL mdns_managed_defaults_get_BOOL_easy(const char *a1, const void *a2, _BOOL8 a3, int *a4)
{
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  int v9;
  const void *Value;
  const void *v11;
  CFTypeID v12;
  int v14;

  v14 = 0;
  v7 = (const __CFDictionary *)mdns_managed_defaults_create(a1, &v14);
  v8 = v7;
  v9 = v14;
  if (!v14)
  {
    Value = CFDictionaryGetValue(v7, a2);
    if (Value)
    {
      v11 = Value;
      v12 = CFGetTypeID(Value);
      if (v12 == CFBooleanGetTypeID())
      {
        v9 = 0;
        a3 = v11 == (const void *)*MEMORY[0x24BDBD270];
      }
      else
      {
        v9 = -6756;
      }
    }
    else
    {
      v9 = -6727;
    }
    v14 = v9;
  }
  if (a4)
    *a4 = v9;
  if (v8)
    CFRelease(v8);
  return a3;
}

char *_mdns_obj_copy_description(_QWORD *a1)
{
  char *v2;

  v2 = 0;
  asprintf(&v2, "<%s: %p>", *(const char **)(a1[2] + 8), a1);
  return v2;
}

const char *_mdns_obj_copy_description_as_cfstring(uint64_t a1)
{
  _QWORD *v1;
  uint64_t (*v2)(void);
  const char *result;
  char *v4;

  v1 = (_QWORD *)(a1 + 16);
  do
  {
    v1 = (_QWORD *)*v1;
    if (!v1)
      return 0;
    v2 = (uint64_t (*)(void))v1[3];
  }
  while (!v2);
  result = (const char *)v2();
  if (result)
  {
    v4 = (char *)result;
    result = (const char *)CFStringCreateWithCStringNoCopy(0, result, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
    if (!result)
    {
      free(v4);
      return 0;
    }
  }
  return result;
}

uint64_t mdns_memcmp_us_ascii_case_insensitive@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char a4@<W8>)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  if (a3)
  {
    while (1)
    {
      v5 = *a1++;
      v4 = v5;
      v6 = v5 + 32;
      if (v5 - 65 < 0x1A)
        v4 = v6;
      v8 = *a2++;
      v7 = v8;
      v9 = v8 + 32;
      if (v8 - 65 < 0x1A)
        v7 = v9;
      if (v4 > v7)
        a4 = 1;
      if (v4 < v7)
        a4 = -1;
      if (v4 != v7)
        break;
      if (!--a3)
        return 0;
    }
  }
  else
  {
    return 0;
  }
  return a4;
}

unsigned __int16 *_mdns_message_copy_description(uint64_t a1, uint64_t a2, int a3)
{
  unsigned __int16 *result;
  char v5;
  int v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 *v12;
  unsigned __int8 *v13;
  unsigned __int16 *v14;
  unsigned int v15;
  unsigned __int16 *v16;

  v16 = 0;
  result = *(unsigned __int16 **)(a1 + 32);
  if (result)
  {
    v5 = a3;
    v6 = *(_BYTE *)(a1 + 48) ? 36 : 4;
    v7 = a3 ? v6 | 8 : v6;
    DNSMessageToString(result, *(_QWORD *)(a1 + 40), v7, (uint64_t)&v16);
    result = v16;
    if (!v16 && (v5 & 1) == 0)
    {
      result = 0;
      v8 = *(_BYTE *)(a1 + 48) ? 12 : 0;
      v9 = *(_QWORD *)(a1 + 40);
      if (v9 >= v8)
      {
        v10 = v9 - v8;
        if ((uint64_t)(v9 - v8) < 0)
        {
          return 0;
        }
        else
        {
          v11 = *(_QWORD *)(a1 + 32);
          result = (unsigned __int16 *)malloc_type_malloc((2 * v10) | 1, 0xA172743EuLL);
          if (result)
          {
            v12 = result;
            if (v9 != v8)
            {
              v13 = (unsigned __int8 *)(v11 + v8);
              v14 = result;
              do
              {
                v15 = *v13++;
                *(_BYTE *)v14 = a0123456789abcd[(unint64_t)v15 >> 4];
                v12 = v14 + 1;
                *((_BYTE *)v14++ + 1) = a0123456789abcd[v15 & 0xF];
                --v10;
              }
              while (v10);
            }
            *(_BYTE *)v12 = 0;
          }
          else
          {
            __break(1u);
          }
        }
      }
    }
  }
  return result;
}

void _mdns_message_finalize(uint64_t a1)
{
  NSObject *v2;

  *(_QWORD *)(a1 + 32) = 0;
  v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

_BYTE *mdns_message_create_with_dispatch_data(NSObject *a1)
{
  dispatch_data_t v1;
  NSObject *v2;
  void *v3;
  size_t v4;
  BOOL v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _UNKNOWN **v13;
  void (*v14)(_BYTE *);
  uint64_t v16;
  uint64_t (**v17)();
  uint64_t v18;
  _UNKNOWN ***v19;
  void (*v20)(_BYTE *);
  uint64_t v21;
  _UNKNOWN ***v22;
  void (*v23)(_BYTE *);
  uint64_t v24;
  _UNKNOWN ***v25;
  void (*v26)(_BYTE *);
  uint64_t v27;
  _UNKNOWN ***v28;
  void (*v29)(_BYTE *);
  uint64_t v30;
  _UNKNOWN ***v31;
  void (*v32)(_BYTE *);
  uint64_t v33;
  _UNKNOWN ***v34;
  void (*v35)(_BYTE *);
  uint64_t v36;
  _UNKNOWN ***v37;
  void (*v38)(_BYTE *);
  size_t v39;
  void *buffer_ptr;

  v39 = 0;
  buffer_ptr = 0;
  v1 = dispatch_data_create_map(a1, (const void **)&buffer_ptr, &v39);
  if (!v1)
    return 0;
  v2 = v1;
  v4 = v39;
  v3 = buffer_ptr;
  if (buffer_ptr)
    v5 = v39 >= 0xC;
  else
    v5 = 0;
  if (v5
    && (*((_BYTE *)buffer_ptr + 2) & 0x78) == 0x30
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 2))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 3))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 4))
    && !__rev16(*((unsigned __int16 *)buffer_ptr + 5))
    && ((*((_BYTE *)buffer_ptr + 2) & 0x80) == 0 || __rev16(*(unsigned __int16 *)buffer_ptr)))
  {
    v6 = 0;
    v7 = (char *)buffer_ptr + 12;
    v8 = (char *)buffer_ptr + v39;
    while (v7 < v8)
    {
      if ((unint64_t)(v8 - v7) >= 4)
      {
        v9 = __rev16(*((unsigned __int16 *)v7 + 1));
        v10 = v8 - (v7 + 4);
        v7 += v9 + 4;
        ++v6;
        if (v10 >= v9)
          continue;
      }
      goto LABEL_21;
    }
    if ((*((_BYTE *)buffer_ptr + 2) & 0x80) != 0 || v6)
    {
      v16 = 0;
      v17 = &off_24F286830;
      do
      {
        if ((((uint64_t (*)(void *, size_t))*v17)(v3, v4) & 1) != 0)
        {
          switch(*((_WORD *)&off_24F286830 + 8 * v16 + 4))
          {
            case 0:
              goto LABEL_32;
            case 1:
              v21 = _os_object_alloc();
              v12 = (_BYTE *)v21;
              if (!v21)
                goto LABEL_27;
              v22 = &_mdns_dso_keepalive_message_kind;
              *(_QWORD *)(v21 + 16) = &_mdns_dso_keepalive_message_kind;
              do
              {
                v23 = (void (*)(_BYTE *))v22[2];
                if (v23)
                  v23(v12);
                v22 = (_UNKNOWN ***)*v22;
              }
              while (v22);
              break;
            case 2:
              v24 = _os_object_alloc();
              v12 = (_BYTE *)v24;
              if (!v24)
                goto LABEL_27;
              v25 = &_mdns_dso_retry_delay_message_kind;
              *(_QWORD *)(v24 + 16) = &_mdns_dso_retry_delay_message_kind;
              do
              {
                v26 = (void (*)(_BYTE *))v25[2];
                if (v26)
                  v26(v12);
                v25 = (_UNKNOWN ***)*v25;
              }
              while (v25);
              break;
            case 3:
              v27 = _os_object_alloc();
              v12 = (_BYTE *)v27;
              if (!v27)
                goto LABEL_27;
              v28 = &_mdns_dso_push_message_kind;
              *(_QWORD *)(v27 + 16) = &_mdns_dso_push_message_kind;
              do
              {
                v29 = (void (*)(_BYTE *))v28[2];
                if (v29)
                  v29(v12);
                v28 = (_UNKNOWN ***)*v28;
              }
              while (v28);
              break;
            case 4:
              v30 = _os_object_alloc();
              v12 = (_BYTE *)v30;
              if (!v30)
                goto LABEL_27;
              v31 = &_mdns_dso_subscribe_message_kind;
              *(_QWORD *)(v30 + 16) = &_mdns_dso_subscribe_message_kind;
              do
              {
                v32 = (void (*)(_BYTE *))v31[2];
                if (v32)
                  v32(v12);
                v31 = (_UNKNOWN ***)*v31;
              }
              while (v31);
              break;
            case 5:
              v33 = _os_object_alloc();
              v12 = (_BYTE *)v33;
              if (!v33)
                goto LABEL_27;
              v34 = &_mdns_dso_unsubscribe_message_kind;
              *(_QWORD *)(v33 + 16) = &_mdns_dso_unsubscribe_message_kind;
              do
              {
                v35 = (void (*)(_BYTE *))v34[2];
                if (v35)
                  v35(v12);
                v34 = (_UNKNOWN ***)*v34;
              }
              while (v34);
              break;
            case 6:
              v36 = _os_object_alloc();
              v12 = (_BYTE *)v36;
              if (!v36)
                goto LABEL_27;
              v37 = &_mdns_dso_reconfirm_message_kind;
              *(_QWORD *)(v36 + 16) = &_mdns_dso_reconfirm_message_kind;
              do
              {
                v38 = (void (*)(_BYTE *))v37[2];
                if (v38)
                  v38(v12);
                v37 = (_UNKNOWN ***)*v37;
              }
              while (v37);
              break;
            default:
              goto LABEL_77;
          }
          goto LABEL_26;
        }
        ++v16;
        v17 += 2;
      }
      while (v16 != 6);
LABEL_32:
      v18 = _os_object_alloc();
      v12 = (_BYTE *)v18;
      if (!v18)
        goto LABEL_27;
      v19 = &_mdns_dso_unspecified_message_kind;
      *(_QWORD *)(v18 + 16) = &_mdns_dso_unspecified_message_kind;
      do
      {
        v20 = (void (*)(_BYTE *))v19[2];
        if (v20)
          v20(v12);
        v19 = (_UNKNOWN ***)*v19;
      }
      while (v19);
      goto LABEL_26;
    }
  }
LABEL_21:
  v11 = _os_object_alloc();
  v12 = (_BYTE *)v11;
  if (v11)
  {
    v13 = &_mdns_message_kind;
    *(_QWORD *)(v11 + 16) = &_mdns_message_kind;
    do
    {
      v14 = (void (*)(_BYTE *))v13[2];
      if (v14)
        v14(v12);
      v13 = (_UNKNOWN **)*v13;
    }
    while (v13);
LABEL_26:
    v12[48] = 1;
    if (_mdns_message_set_msg_data(v12, v2))
    {
      os_release(v12);
LABEL_77:
      v12 = 0;
    }
  }
LABEL_27:
  dispatch_release(v2);
  return v12;
}

uint64_t _mdns_message_set_msg_data(_QWORD *a1, dispatch_data_t data)
{
  dispatch_data_t v3;
  uint64_t result;
  NSObject *v5;
  void *v6;
  size_t v7;
  void *buffer_ptr;

  v7 = 0;
  buffer_ptr = 0;
  if (data)
  {
    v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v7);
    if (!v3)
      return 4294960568;
  }
  else
  {
    v7 = 0;
    buffer_ptr = 0;
    v3 = (dispatch_data_t)MEMORY[0x24BDAC990];
  }
  v5 = a1[3];
  if (v5)
    dispatch_release(v5);
  result = 0;
  v6 = buffer_ptr;
  a1[3] = v3;
  a1[4] = v6;
  a1[5] = v7;
  return result;
}

BOOL _mdns_dso_keepalive_message_validator(uint64_t a1, unint64_t a2)
{
  int64_t v2;
  unsigned int v3;
  BOOL v4;
  BOOL v5;

  if (a2 >= 0x18
    && (a2 & 0xFFFFFFFFFFFFFFFCLL) != 0xC
    && (v2 = __rev16(*(unsigned __int16 *)(a1 + 14)), (uint64_t)(a2 - 16) >= v2)
    && ((v3 = __rev16(*(unsigned __int16 *)(a1 + 12)), (_DWORD)v2 == 8) ? (v4 = a1 == -16) : (v4 = 1),
        !v4 ? (v5 = v3 == 1) : (v5 = 0),
        v5))
  {
    return bswap32(*(_DWORD *)(a1 + 20)) >> 4 > 0x270;
  }
  else
  {
    return 0;
  }
}

uint64_t _mdns_dso_retry_delay_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  BOOL v5;
  int64_t v6;
  unsigned int v7;
  _BOOL4 v9;
  _BOOL4 v10;

  v2 = 0;
  if (a1 && a2 >= 0x14)
  {
    v2 = 0;
    v3 = *((char *)a1 + 2);
    v4 = __rev16(*a1);
    v5 = !v4 && v3 < 0;
    if (!v5 && (v3 & 0x80000000) == 0 && !v4)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC || (v6 = __rev16(a1[7]), (uint64_t)(a2 - 16) < v6))
      {
        v10 = 0;
        v9 = 0;
      }
      else
      {
        v7 = __rev16(a1[6]);
        v9 = a1 != (unsigned __int16 *)-16 && v7 == 2;
        v10 = v6 == 4;
      }
      return v10 & v9;
    }
  }
  return v2;
}

BOOL _mdns_dso_push_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;
  int v7;
  unsigned int v8;
  BOOL v9;
  int64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  _QWORD v17[9];

  if (a2 > 0x3FFE)
    return 0;
  v17[7] = v2;
  v17[8] = v3;
  result = 0;
  if (a1 && a2 >= 0xC)
  {
    result = 0;
    v7 = *((char *)a1 + 2);
    v8 = __rev16(*a1);
    v9 = !v8 && v7 < 0;
    if (!v9 && (v7 & 0x80000000) == 0 && !v8)
    {
      if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
        return 0;
      v10 = __rev16(a1[7]);
      if ((uint64_t)(a2 - 16) < v10)
        return 0;
      result = 0;
      v11 = (char *)(a1 + 8);
      if (a1 != (unsigned __int16 *)-16 && __rev16(a1[6]) == 65)
      {
        v12 = &v11[v10];
        v17[0] = a1 + 8;
        if (v11 < &v11[v10])
        {
          v13 = 0;
          while (1)
          {
            v16 = 0;
            v15 = 0;
            v14 = 0;
            if (_DNSMessageExtractRecordEx((unint64_t)a1, a2, v11, 0, (_WORD *)&v16 + 1, &v16, &v15, 0, &v14, 0, 0, 0, 0, v17))return 0;
            v11 = (char *)v17[0];
            if (v17[0] > (unint64_t)v12)
              return 0;
            if ((v15 & 0x80000000) == 0)
              break;
            if (v15 == -2)
            {
              if (v14)
                return 0;
            }
            else if (v15 == -1)
            {
              break;
            }
LABEL_21:
            ++v13;
            if (v17[0] >= (unint64_t)v12)
              return v13 != 0;
          }
          if (HIWORD(v16) == 255 || (unsigned __int16)v16 == 255)
            return 0;
          goto LABEL_21;
        }
        return 0;
      }
    }
  }
  return result;
}

BOOL _mdns_dso_subscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v4;
  int64_t v5;
  char *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  int v13;
  int64_t v14;
  _BOOL4 v16;

  result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      result = 0;
      if (((char)a1[1] & 0x80000000) == 0)
      {
        if (__rev16(*a1))
        {
          if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
            return 0;
          result = 0;
          v4 = a1 + 8;
          if (a1 == (unsigned __int16 *)-16)
            return result;
          v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) < v5)
            return result;
          if (__rev16(a1[6]) != 64)
            return 0;
          v6 = (char *)v4 + v5;
          if (v4 >= (unsigned __int16 *)((char *)v4 + v5))
            return 0;
          v7 = v4;
          while (1)
          {
            v8 = *(unsigned __int8 *)v7;
            if (!*(_BYTE *)v7)
              break;
            if (v8 > 0x3F)
              return 0;
            result = 0;
            v9 = (char *)v7 + v8;
            v12 = __OFSUB__(v6 - (char *)v7, v8);
            v10 = v6 - (char *)v7 == v8;
            v11 = v6 - (char *)v7 - v8 < 0;
            if (v6 - (char *)v7 > v8)
              v7 = (unsigned __int16 *)(v9 + 1);
            if (v11 ^ v12 | v10 || v9 + 1 - (_BYTE *)v4 >= 256)
              return result;
          }
          v13 = (unsigned __int16)((_WORD)v7 - (_WORD)v4) + 1;
          v14 = v5 - (unsigned __int16)((_WORD)v7 - (_WORD)v4 + 1);
          v16 = v5 > (unsigned __int16)v13 && v14 == 4;
          return (v13 & 0x10000) == 0 && v16;
        }
      }
    }
  }
  return result;
}

BOOL _mdns_dso_unsubscribe_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  _BOOL8 result;
  int64_t v4;

  result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      result = 0;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
        {
          return 0;
        }
        else
        {
          result = 0;
          if (a1 != (unsigned __int16 *)-16)
          {
            v4 = __rev16(a1[7]);
            if ((uint64_t)(a2 - 16) >= v4)
              return __rev16(a1[6]) == 66 && (_DWORD)v4 == 2;
          }
        }
      }
    }
  }
  return result;
}

BOOL _mdns_dso_reconfirm_message_validator(unsigned __int16 *a1, unint64_t a2)
{
  _BOOL8 result;
  unsigned __int16 *v4;
  int64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  unsigned __int16 v9;

  result = 0;
  if (a1)
  {
    if (a2 >= 0xC)
    {
      result = 0;
      if (((char)a1[1] & 0x80000000) == 0 && !__rev16(*a1))
      {
        if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0xC)
          return 0;
        result = 0;
        v4 = a1 + 8;
        if (a1 != (unsigned __int16 *)-16)
        {
          v5 = __rev16(a1[7]);
          if ((uint64_t)(a2 - 16) >= v5)
          {
            if (__rev16(a1[6]) == 67 && v4 < (unsigned __int16 *)((char *)v4 + v5))
            {
              v6 = a1 + 8;
              while (1)
              {
                v7 = *v6;
                if (!*v6)
                  break;
                if (v7 > 0x3F)
                  return 0;
                result = 0;
                v8 = &v6[v7];
                if ((char *)v4 + v5 - v6 > v7)
                {
                  v6 = v8 + 1;
                  if (v8 + 1 - (_BYTE *)v4 < 256)
                    continue;
                }
                return result;
              }
              v9 = (_WORD)v6 - (_WORD)v4 + 1;
              if ((_WORD)v6 - (_WORD)v4 != 0xFFFF)
                return v5 > v9 && v5 - v9 > 3;
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdns_query_message_create()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mdns_query_message_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_query_message_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    *(_BYTE *)(v1 + 48) = 1;
    if (_mdns_message_set_msg_data((_QWORD *)v1, 0))
      goto LABEL_11;
    if (_mdns_domain_name_get_root_s_once != -1)
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global_467);
    v4 = _mdns_domain_name_get_root_s_root;
    *(_QWORD *)(v1 + 56) = _mdns_domain_name_get_root_s_root;
    if (!v4)
    {
LABEL_11:
      os_release((void *)v1);
      return 0;
    }
  }
  return v1;
}

void _mdns_query_message_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    os_release(v2);
    *(_QWORD *)(a1 + 56) = 0;
  }
}

void mdns_query_message_set_qname(uint64_t a1, void *object)
{
  void *v4;

  if ((*(_BYTE *)(a1 + 70) & 0x20) == 0)
  {
    if (object)
      os_retain(object);
    v4 = *(void **)(a1 + 56);
    if (v4)
      os_release(v4);
    *(_QWORD *)(a1 + 56) = object;
  }
}

uint64_t mdns_query_message_construct(uint64_t a1)
{
  unsigned int v2;
  __int16 v3;
  uint64_t v4;
  char v5;
  size_t v6;
  size_t v7;
  _BYTE *v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  __int16 v14;
  void *v15;
  size_t v16;
  _BYTE *v17;
  _BYTE *v18;
  size_t v19;
  _BYTE *v20;
  size_t v21;
  NSObject *v22;
  NSObject *v23;
  size_t size;
  _BYTE buffer[6];
  _WORD v27[253];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 70);
  if ((v2 & 1) != 0)
    v3 = 288;
  else
    v3 = 256;
  size = 0;
  v4 = DNSMessageWriteQuery(*(_WORD *)(a1 + 68), v3 & 0xFFEF | (16 * ((v2 >> 1) & 1)), *(_BYTE **)(*(_QWORD *)(a1 + 56) + 24), *(_WORD *)(a1 + 64), *(_WORD *)(a1 + 66), (uint64_t)buffer, &size);
  if ((_DWORD)v4)
    return v4;
  v5 = *(_BYTE *)(a1 + 70);
  if ((v5 & 0x1C) != 0 || *(_BYTE *)(a1 + 71))
  {
    v6 = size;
    if (size <= 0x200)
    {
      v7 = size + 11;
      v8 = &buffer[size];
      *(_QWORD *)v8 = 0;
      *(_DWORD *)(v8 + 7) = 0;
      *(_DWORD *)(v8 + 1) = 141568;
      if ((v5 & 4) != 0)
        v8[7] = 0x80;
      v27[2] = 256;
      size = v6 + 11;
      v9 = *(_BYTE *)(a1 + 71);
      if (v9)
      {
        v10 = *(unsigned __int8 *)(a1 + 72);
        v11 = v6 + ((v10 + 7) >> 3) + 19;
        v12 = 4294960553;
        if (v11 <= v7 || v11 > 0x200)
          return v12;
        v13 = &buffer[v7];
        bzero(&buffer[v7], &buffer[v11] - &buffer[v7]);
        *(_WORD *)(v8 + 9) = bswap32(&buffer[v11] - (_DWORD)v8 - 11) >> 16;
        *(_WORD *)v13 = 2048;
        v13[4] = 0;
        v14 = (unsigned __int16)&buffer[v11] - ((_WORD)v13 + 4);
        v13[2] = HIBYTE(v14);
        v13[3] = v14;
        v13[5] = v9;
        v13[6] = v10;
        v13[7] = 0;
        v15 = v13 + 8;
        if (v10 >= 8)
          memcpy(v15, (const void *)(a1 + 73), v10 >> 3);
        if ((v10 & 7) != 0)
          *((_BYTE *)v15 + (v10 >> 3)) = *((_BYTE *)v15 + (v10 >> 3)) & ~(-1 << (8 - (v10 & 7))) | *(_BYTE *)(a1 + 73 + (v10 >> 3)) & (-1 << (8 - (v10 & 7)));
        size = v6 + ((v10 + 7) >> 3) + 19;
        v7 = size;
      }
      if ((v5 & 0x10) == 0)
        goto LABEL_23;
      if (v7 <= 0x1FA)
      {
        v12 = 4294960554;
        if (v7 <= v6 || v7 - v6 < 0xB)
          return v12;
        v16 = v7 + 6;
        v17 = &buffer[v7];
        v18 = &buffer[v7 + 6];
        bzero(&buffer[v7], (char *)v27 - buffer);
        *(_WORD *)(v8 + 9) = bswap32((_DWORD)v18 - (_DWORD)v8 - 11) >> 16;
        *(_DWORD *)v17 = 33558272;
        *((_WORD *)v17 + 2) = 0;
        size = v16;
        v7 = v16;
LABEL_23:
        if ((v5 & 8) != 0)
        {
          v19 = (v7 + 131) & 0xFFFFFFFFFFFFFF80;
          v12 = 4294960553;
          if (v19 <= v7)
            return v12;
          if (v19 > 0x200)
            return v12;
          v12 = 4294960554;
          if (v7 <= v6 || v7 - v6 < 0xB)
            return v12;
          v20 = &buffer[v7];
          v21 = &buffer[v19] - &buffer[v7];
          bzero(&buffer[v7], v21);
          *(_WORD *)(v8 + 9) = bswap32(&buffer[v19] - (_DWORD)v8 - 11) >> 16;
          *(_WORD *)v20 = 3072;
          v20[2] = (unsigned __int16)(v21 - 4) >> 8;
          v20[3] = v21 - 4;
          size = v19;
          v7 = v19;
        }
        goto LABEL_30;
      }
    }
    return 4294960553;
  }
  v7 = size;
LABEL_30:
  v22 = dispatch_data_create(buffer, v7, 0, 0);
  if (!v22)
    return 4294960568;
  v23 = v22;
  v12 = _mdns_message_set_msg_data((_QWORD *)a1, v22);
  dispatch_release(v23);
  if (!(_DWORD)v12)
    *(_BYTE *)(a1 + 70) |= 0x20u;
  return v12;
}

id _mdns_ne_dns_proxy_state_watch_log()
{
  if (_mdns_ne_dns_proxy_state_watch_log_s_once != -1)
    dispatch_once(&_mdns_ne_dns_proxy_state_watch_log_s_once, &__block_literal_global_10);
  return (id)_mdns_ne_dns_proxy_state_watch_log_s_log;
}

id _mdns_ne_dns_proxy_state_watch_queue()
{
  if (_mdns_ne_dns_proxy_state_watch_queue_s_once != -1)
    dispatch_once(&_mdns_ne_dns_proxy_state_watch_queue_s_once, &__block_literal_global_5);
  return (id)_mdns_ne_dns_proxy_state_watch_queue_s_queue;
}

void _mdns_ne_dns_proxy_state_watch_fetch_manager_status(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend((id)g_managers, "indexOfObjectIdenticalTo:", v1);
  v3 = objc_msgSend((id)g_managers, "count");
  _mdns_ne_dns_proxy_state_watch_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2 >= v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v8 = v1;
      _os_log_impl(&dword_22983F000, v4, OS_LOG_TYPE_INFO, "Not fetching status for stale manager -- address: %p", buf, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v8 = v1;
      _os_log_impl(&dword_22983F000, v4, OS_LOG_TYPE_INFO, "Fetching status for manager -- address: %p", buf, 0xCu);
    }

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke;
    v6[3] = &unk_24F2869D0;
    v6[4] = v1;
    objc_msgSend(v1, "fetchStatusWithCompletionHandler:", v6);
  }

}

void ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _mdns_ne_dns_proxy_state_watch_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (a2 > 4)
      v6 = "«UNKNOWN STATUS»";
    else
      v6 = off_24F286A08[a2];
    *(_DWORD *)buf = 134218498;
    v10 = v5;
    v11 = 2082;
    v12 = v6;
    v13 = 2048;
    v14 = a2;
    _os_log_impl(&dword_22983F000, v4, OS_LOG_TYPE_DEFAULT, "Fetched status for manager -- address: %p, status: %{public}s (%lld)", buf, 0x20u);
  }

  _mdns_ne_dns_proxy_state_watch_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke_23;
  v8[3] = &unk_24F2869A8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = a2;
  dispatch_async(v7, v8);

}

void ___mdns_ne_dns_proxy_state_watch_fetch_manager_status_block_invoke_23(uint64_t a1)
{
  uint64_t v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend((id)g_managers, "indexOfObjectIdenticalTo:", v2);
  if (v3 >= objc_msgSend((id)g_managers, "count"))
  {
    _mdns_ne_dns_proxy_state_watch_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v2;
      _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_DEFAULT, "Not handling status update for stale manager -- address: %p", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    if (v1 == 3)
      v4 = 2;
    else
      v4 = 1;
    +[NSNumber numberWithUnsignedInt:](&off_255A6D228, "numberWithUnsignedInt:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)g_states, "setObject:atIndexedSubscript:", v5, v3);

    _mdns_ne_dns_proxy_state_watch_check_for_collective_state_change();
  }

}

void _mdns_ne_dns_proxy_state_watch_check_for_collective_state_change()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t i;
  int v7;
  int v8;
  char *v9;
  char *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v0 = g_current_state;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v1 = (id)g_states;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, buf, 16);
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
          objc_enumerationMutation(v1);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "unsignedIntValue", (_QWORD)v12);
        if (v7)
        {
          if (v7 == 2)
          {

            v8 = 2;
            goto LABEL_15;
          }
        }
        else
        {
          v4 = 1;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, buf, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  v8 = (v4 & 1) == 0;
LABEL_15:
  if (v8 != (_DWORD)v0)
  {
    g_current_state = v8;
    v9 = off_24F2869F0[v0];
    v10 = off_24F2869F0[v8];
    _mdns_ne_dns_proxy_state_watch_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v17 = v9;
      v18 = 2082;
      v19 = v10;
      _os_log_impl(&dword_22983F000, v11, OS_LOG_TYPE_DEFAULT, "State change: %{public}s -> %{public}s", buf, 0x16u);
    }

  }
}

void ___mdns_ne_dns_proxy_state_watch_queue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.mdns.ne-dns-proxy-state-watch", 0);
  v1 = (void *)_mdns_ne_dns_proxy_state_watch_queue_s_queue;
  _mdns_ne_dns_proxy_state_watch_queue_s_queue = (uint64_t)v0;

}

void ___mdns_ne_dns_proxy_state_watch_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mdns", "ne_dns_proxy_state_watch");
  v1 = (void *)_mdns_ne_dns_proxy_state_watch_log_s_log;
  _mdns_ne_dns_proxy_state_watch_log_s_log = (uint64_t)v0;

}

void ___mdns_ne_dns_proxy_state_watch_load_managers_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = a2;
  _mdns_ne_dns_proxy_state_watch_queue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___mdns_ne_dns_proxy_state_watch_load_managers_block_invoke_2;
  block[3] = &unk_24F2868F8;
  block[4] = v2;
  dispatch_async(v3, block);

}

void ___mdns_ne_dns_proxy_state_watch_load_managers_block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 buf;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = *(id *)(a1 + 32);
  v2 = objc_alloc_init((Class)&off_255A73370);
  v3 = (void *)g_managers;
  g_managers = (uint64_t)v2;

  v4 = objc_alloc_init((Class)&off_255A73370);
  v5 = (void *)g_states;
  g_states = (uint64_t)v4;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)g_managers, "indexOfObjectIdenticalTo:", v11, (_QWORD)v14) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend((id)g_managers, "addObject:", v11);
          objc_msgSend((id)g_states, "addObject:", &unk_24F28B868);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v8);
  }

  _mdns_ne_dns_proxy_state_watch_check_for_collective_state_change();
  v12 = objc_msgSend((id)g_managers, "count");
  _mdns_ne_dns_proxy_state_watch_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_22983F000, v13, OS_LOG_TYPE_DEFAULT, "Updated DNS proxy managers -- count: %llu", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = MEMORY[0x24BDAC760];
  *((_QWORD *)&buf + 1) = 3221225472;
  v19 = ___mdns_ne_dns_proxy_state_watch_handle_new_managers_block_invoke;
  v20 = &__block_descriptor_40_e34_v32__0__NEDNSProxyManager_8Q16_B24l;
  v21 = v12;
  objc_msgSend((id)g_managers, "enumerateObjectsUsingBlock:", &buf);

}

void ___mdns_ne_dns_proxy_state_watch_handle_new_managers_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  _mdns_ne_dns_proxy_state_watch_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 134218754;
    v9 = a3 + 1;
    v10 = 2048;
    v11 = v7;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_DEFAULT, "DNS proxy manager (%llu/%llu) -- address: %p, description: %@", (uint8_t *)&v8, 0x2Au);
  }

  objc_msgSend(v5, "setDelegate:", 0);
  _mdns_ne_dns_proxy_state_watch_fetch_manager_status(v5);

}

nw_protocol_definition_t ___mdns_get_dns_over_bytestream_protocol_definition_block_invoke()
{
  nw_protocol_definition_t result;

  result = nw_framer_create_definition("DNS over bytestream", 0, &__block_literal_global_14_951);
  _mdns_get_dns_over_bytestream_protocol_definition_s_framer_def = (uint64_t)result;
  return result;
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_4(int a1, nw_framer_t framer)
{
  nw_framer_set_input_handler(framer, &__block_literal_global_4_948);
  nw_framer_set_output_handler(framer, &__block_literal_global_10_949);
  return 1;
}

void ___mdns_create_dns_over_bytestream_framer_block_invoke_3(int a1, nw_framer_t framer, uint64_t a3, size_t a4)
{
  uint8_t output_buffer[2];

  if (a4 < 0x10000)
  {
    *(_WORD *)output_buffer = bswap32(a4) >> 16;
    nw_framer_write_output(framer, output_buffer, 2uLL);
    nw_framer_write_output_no_copy(framer, a4);
  }
  else
  {
    nw_framer_mark_failed_with_error(framer, 40);
  }
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke(int a1, nw_framer_t framer)
{
  size_t v3;
  NSObject *v4;
  uint8_t temp_buffer[2];

  do
  {
    if (!nw_framer_parse_input(framer, 2uLL, 2uLL, temp_buffer, &__block_literal_global_7_958))
      break;
    v3 = __rev16(*(unsigned __int16 *)temp_buffer);
    v4 = nw_framer_message_create(framer);
    LODWORD(v3) = nw_framer_deliver_input_no_copy(framer, v3, v4, 1);
    nw_release(v4);
  }
  while ((_DWORD)v3);
  return 2;
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return 2 * (a3 > 1);
}

void *mdns_retain(void *a1)
{
  os_retain(a1);
  return a1;
}

uint64_t mdns_copy_description(uint64_t a1)
{
  _QWORD *v1;
  uint64_t (*v2)(void);

  v1 = (_QWORD *)(a1 + 16);
  while (1)
  {
    v1 = (_QWORD *)*v1;
    if (!v1)
      break;
    v2 = (uint64_t (*)(void))v1[3];
    if (v2)
      return v2();
  }
  return 0;
}

uint64_t mdns_equal(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v4)(void);

  if (a1 == a2)
    return 1;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16) && (v4 = *(uint64_t (**)(void))(v2 + 32)) != 0)
    return v4();
  else
    return 0;
}

void mdns_free_context_finalizer(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t mdns_pf_set_thread_nat64_rules(unsigned __int8 *a1, unsigned int a2, int a3)
{
  uint64_t thread_nat64_rule_user;
  uint64_t v7;
  char v8;
  const char *v9;
  int v10;
  xpc_object_t v11;
  void *v12;
  const char **v13;
  const char *v14;
  int v15;
  xpc_object_t v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  unsigned int v30;
  uint8_t __str[112];
  uint8_t v32[4];
  uint64_t v33;
  uint8_t buf[4];
  _BYTE v35[14];
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  thread_nat64_rule_user = _mdns_pf_create_thread_nat64_rule_user((int *)&v30);
  if (v30)
  {
    v12 = 0;
    v17 = 0;
    v19 = 0;
    goto LABEL_19;
  }
  if (a2 >= 0x81)
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v24 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)v35 = 16;
      *(_WORD *)&v35[4] = 2096;
      *(_QWORD *)&v35[6] = a1;
      v36 = 1024;
      v37 = a2;
      _os_log_error_impl(&dword_22983F000, v24, OS_LOG_TYPE_ERROR, "Invalid IPv6 prefix length: %{network:in6_addr}.16P/%d", buf, 0x18u);
    }
    v10 = -6743;
    goto LABEL_33;
  }
  if ((a2 & 0x80) == 0)
  {
    v7 = a2 >> 3;
    v8 = a2 & 7;
    while (!(a1[v7] << v8))
    {
      v8 = 0;
      if (++v7 == 16)
        goto LABEL_7;
    }
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v23 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)v35 = 16;
      *(_WORD *)&v35[4] = 2096;
      *(_QWORD *)&v35[6] = a1;
      v36 = 1024;
      v37 = a2;
      _os_log_error_impl(&dword_22983F000, v23, OS_LOG_TYPE_ERROR, "Invalid IPv6 prefix: %{network:in6_addr}.16P/%d", buf, 0x18u);
    }
    v10 = -6761;
    goto LABEL_33;
  }
LABEL_7:
  v9 = inet_ntop(30, a1, (char *)v32, 0x2Eu);
  if (!v9)
  {
    if (*__error())
    {
      v10 = *__error();
      if (!v10)
        goto LABEL_10;
    }
    else
    {
      v10 = -6700;
    }
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v21 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v35 = v10;
      _os_log_error_impl(&dword_22983F000, v21, OS_LOG_TYPE_ERROR, "inet_ntop() for IPv6 prefix failed: %{mdns:err}ld", buf, 0xCu);
    }
    goto LABEL_33;
  }
LABEL_10:
  snprintf((char *)__str, 0x6EuLL, "%s/%d", v9, a2);
  v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v25 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22983F000, v25, OS_LOG_TYPE_ERROR, "Failed to create destination XPC dictionary", buf, 2u);
    }
    v10 = -6729;
LABEL_33:
    v12 = 0;
    v17 = 0;
    v19 = 0;
    v30 = v10;
    goto LABEL_19;
  }
  v12 = v11;
  v13 = (const char **)MEMORY[0x24BE6E5F8];
  xpc_dictionary_set_string(v11, (const char *)*MEMORY[0x24BE6E5F8], (const char *)__str);
  v30 = 0;
  *(_DWORD *)buf = a3;
  v14 = inet_ntop(2, buf, (char *)__str, 0x10u);
  if (v14)
    goto LABEL_14;
  if (!*__error())
  {
    v15 = -6700;
    goto LABEL_35;
  }
  v15 = *__error();
  if (v15)
  {
LABEL_35:
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v22 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v32 = 134217984;
      v33 = v15;
      _os_log_error_impl(&dword_22983F000, v22, OS_LOG_TYPE_ERROR, "inet_ntop() for IPv4 address failed: %{mdns:err}ld", v32, 0xCu);
    }
    goto LABEL_39;
  }
LABEL_14:
  v16 = xpc_dictionary_create(0, 0, 0);
  if (!v16)
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v26 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v32 = 0;
      _os_log_error_impl(&dword_22983F000, v26, OS_LOG_TYPE_ERROR, "Failed to create NAT64 XPC dictionary", v32, 2u);
    }
    v15 = -6729;
LABEL_39:
    v17 = 0;
    v19 = 0;
    v30 = v15;
    goto LABEL_19;
  }
  v17 = v16;
  xpc_dictionary_set_string(v16, *v13, v14);
  xpc_dictionary_set_uint64(v17, (const char *)*MEMORY[0x24BE6E608], 0x8000uLL);
  xpc_dictionary_set_uint64(v17, (const char *)*MEMORY[0x24BE6E600], 0xBFFFuLL);
  xpc_dictionary_set_uint64(v17, (const char *)*MEMORY[0x24BE6E610], 0);
  v30 = 0;
  v18 = xpc_dictionary_create(0, 0, 0);
  if (!v18)
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v27 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__str = 0;
      _os_log_error_impl(&dword_22983F000, v27, OS_LOG_TYPE_ERROR, "Failed to create NAT64 rule XPC dictionary", __str, 2u);
    }
    v19 = 0;
    v30 = -6729;
    goto LABEL_19;
  }
  v19 = v18;
  xpc_dictionary_set_uint64(v18, (const char *)*MEMORY[0x24BE6E5A8], 0xDuLL);
  xpc_dictionary_set_uint64(v19, (const char *)*MEMORY[0x24BE6E5C8], 0x1EuLL);
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x24BE6E628], v12);
  xpc_dictionary_set_value(v19, (const char *)*MEMORY[0x24BE6E5E0], v17);
  v30 = 0;
  if (PFUserBeginRules() == -1)
  {
    v30 = -6729;
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v28 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)__str = 0;
    v29 = "PFUserBeginRules() failed to create a valid transaction ID";
LABEL_78:
    _os_log_error_impl(&dword_22983F000, v28, OS_LOG_TYPE_ERROR, v29, __str, 2u);
    goto LABEL_19;
  }
  if ((PFUserAddRule() & 1) == 0)
  {
    v30 = -6700;
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v28 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)__str = 0;
    v29 = "PFUserAddRule() failed";
    goto LABEL_78;
  }
  if ((PFUserCommitRules() & 1) == 0)
  {
    v30 = -6700;
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v28 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__str = 0;
      v29 = "PFUserCommitRules() failed";
      goto LABEL_78;
    }
  }
LABEL_19:
  if (thread_nat64_rule_user)
    PFUserRelease();
  if (v12)
    xpc_release(v12);
  if (v17)
    xpc_release(v17);
  if (v19)
    xpc_release(v19);
  return v30;
}

uint64_t _mdns_pf_create_thread_nat64_rule_user(int *a1)
{
  uint64_t v2;
  int v3;
  NSObject *v5;
  uint8_t v6[16];

  if (_mdns_pf_queue_s_once != -1)
    dispatch_once(&_mdns_pf_queue_s_once, &__block_literal_global_4_1079);
  v2 = PFUserCreate();
  if (v2)
  {
    v3 = 0;
    if (a1)
LABEL_5:
      *a1 = v3;
  }
  else
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v5 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_22983F000, v5, OS_LOG_TYPE_ERROR, "PFUserCreate() failed to create nat64 rule user", v6, 2u);
    }
    v3 = -6700;
    if (a1)
      goto LABEL_5;
  }
  return v2;
}

os_log_t ___mdns_pf_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "pf");
  _mdns_pf_log_s_log = (uint64_t)result;
  return result;
}

dispatch_queue_t ___mdns_pf_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.pf-queue", 0);
  _mdns_pf_queue_s_queue = (uint64_t)result;
  return result;
}

uint64_t mdns_pf_set_thread_pass_all_rule_for_conn_tracking(const char *a1)
{
  uint64_t thread_filter_rule_user;
  xpc_object_t v3;
  void *v4;
  const char **v5;
  const char **v6;
  xpc_object_t v7;
  void *v8;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  unsigned int v14;
  uint8_t buf[16];

  v14 = 0;
  thread_filter_rule_user = _mdns_pf_create_thread_filter_rule_user((int *)&v14);
  if (v14)
  {
    v4 = 0;
    v8 = 0;
    goto LABEL_8;
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v10 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22983F000, v10, OS_LOG_TYPE_ERROR, "Failed to create conn tracking rule XPC dictionary", buf, 2u);
    }
    v4 = 0;
    goto LABEL_25;
  }
  v4 = v3;
  v5 = (const char **)MEMORY[0x24BE6E5A8];
  xpc_dictionary_set_uint64(v3, (const char *)*MEMORY[0x24BE6E5A8], 0);
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x24BE6E5C0], 2uLL);
  v6 = (const char **)MEMORY[0x24BE6E5D8];
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x24BE6E5D8], 1uLL);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BE6E5D0], a1);
  v14 = 0;
  v7 = xpc_dictionary_create(0, 0, 0);
  if (!v7)
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v11 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22983F000, v11, OS_LOG_TYPE_ERROR, "Failed to create pass IGMP rule XPC dictionary", buf, 2u);
    }
LABEL_25:
    v8 = 0;
    v14 = -6729;
    goto LABEL_8;
  }
  v8 = v7;
  xpc_dictionary_set_uint64(v7, *v5, 0);
  xpc_dictionary_set_uint64(v8, (const char *)*MEMORY[0x24BE6E5E8], 2uLL);
  xpc_dictionary_set_uint64(v8, *v6, 1uLL);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BE6E5B0], 1);
  v14 = 0;
  if (PFUserBeginRules() == -1)
  {
    v14 = -6729;
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v12 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v13 = "PFUserBeginRules() failed to create a valid transaction ID";
LABEL_42:
    _os_log_error_impl(&dword_22983F000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_8;
  }
  if ((PFUserAddRule() & 1) == 0)
  {
    v14 = -6700;
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v12 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v13 = "PFUserAddRule() for connection tracking failed";
    goto LABEL_42;
  }
  if ((PFUserAddRule() & 1) == 0)
  {
    v14 = -6700;
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v12 = _mdns_pf_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v13 = "PFUserAddRule() for pass IGMP failed";
    goto LABEL_42;
  }
  if ((PFUserCommitRules() & 1) == 0)
  {
    v14 = -6700;
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v12 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "PFUserCommitRules() failed";
      goto LABEL_42;
    }
  }
LABEL_8:
  if (thread_filter_rule_user)
    PFUserRelease();
  if (v4)
    xpc_release(v4);
  if (v8)
    xpc_release(v8);
  return v14;
}

uint64_t _mdns_pf_create_thread_filter_rule_user(int *a1)
{
  uint64_t v2;
  int v3;
  NSObject *v5;
  uint8_t v6[16];

  if (_mdns_pf_queue_s_once != -1)
    dispatch_once(&_mdns_pf_queue_s_once, &__block_literal_global_4_1079);
  v2 = PFUserCreate();
  if (v2)
  {
    v3 = 0;
    if (a1)
LABEL_5:
      *a1 = v3;
  }
  else
  {
    if (_mdns_pf_log_s_once != -1)
      dispatch_once(&_mdns_pf_log_s_once, &__block_literal_global_1063);
    v5 = _mdns_pf_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_pf_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_22983F000, v5, OS_LOG_TYPE_ERROR, "PFUserCreate() failed to create filter rule user", v6, 2u);
    }
    v3 = -6700;
    if (a1)
      goto LABEL_5;
  }
  return v2;
}

uint64_t mdns_pf_delete_thread_rules()
{
  unsigned int v1;

  v1 = 0;
  if (!_mdns_pf_create_thread_nat64_rule_user((int *)&v1))
    return v1;
  PFUserDeleteRules();
  PFUserRelease();
  return 0;
}

uint64_t mdns_pf_delete_thread_pass_all_rule_for_conn_tracking()
{
  unsigned int v1;

  v1 = 0;
  if (!_mdns_pf_create_thread_filter_rule_user((int *)&v1))
    return v1;
  PFUserDeleteRules();
  PFUserRelease();
  return 0;
}

void mdns_power_cancel_all_events(const void *a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  const __CFString *v9;
  const __CFDate *v10;
  const __CFString *v11;
  IOReturn v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFDate *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = IOPMCopyScheduledPowerEvents();
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, i);
        Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("scheduledby"));
        if (Value)
        {
          v9 = Value;
          if (CFEqual(Value, a1))
          {
            v10 = (const __CFDate *)CFDictionaryGetValue(ValueAtIndex, CFSTR("time"));
            v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("eventtype"));
            v12 = IOPMCancelScheduledPowerEvent(v10, v9, v11);
            if (_mdns_power_log_s_once != -1)
              dispatch_once(&_mdns_power_log_s_once, &__block_literal_global_1093);
            v13 = _mdns_power_log_s_log;
            if (v12)
              v14 = OS_LOG_TYPE_ERROR;
            else
              v14 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled((os_log_t)_mdns_power_log_s_log, v14))
            {
              *(_DWORD *)buf = 134218754;
              v16 = v12;
              v17 = 2112;
              v18 = v9;
              v19 = 2112;
              v20 = v11;
              v21 = 2112;
              v22 = v10;
              _os_log_impl(&dword_22983F000, v13, v14, "IOPMCancelScheduledPowerEvent -- error: %{mdns:err}ld, id: %@, type: %@, time: %@", buf, 0x2Au);
            }
          }
        }
      }
    }
    CFRelease(v3);
  }
}

os_log_t ___mdns_power_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "power");
  _mdns_power_log_s_log = (uint64_t)result;
  return result;
}

uint64_t mdns_power_schedule_wake(void *a1, int a2, int a3)
{
  const __CFAllocator *v5;
  CFAbsoluteTime Current;
  CFDateRef v7;
  CFDateRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  int valuePtr;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  CFDictionaryRef v21;
  void *values[3];
  void *keys[2];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  valuePtr = a3;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Current = CFAbsoluteTimeGetCurrent();
  v7 = CFDateCreate(v5, Current + (double)a2);
  if (!v7)
    return 4294960567;
  v8 = v7;
  v9 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
  if (v9)
  {
    v10 = v9;
    *(_OWORD *)keys = xmmword_24F286BF0;
    v24 = CFSTR("leeway");
    values[0] = a1;
    values[1] = v8;
    values[2] = v9;
    v11 = CFDictionaryCreate(v5, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v11)
    {
      v12 = v11;
      v13 = IOPMRequestSysWake();
      if (_mdns_power_log_s_once != -1)
        dispatch_once(&_mdns_power_log_s_once, &__block_literal_global_1093);
      v14 = _mdns_power_log_s_log;
      if ((_DWORD)v13)
        v15 = OS_LOG_TYPE_ERROR;
      else
        v15 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)_mdns_power_log_s_log, v15))
      {
        *(_DWORD *)buf = 134218242;
        v19 = (int)v13;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_22983F000, v14, v15, "IOPMRequestSysWake -- error: %{mdns:err}ld, request: %@", buf, 0x16u);
      }
      CFRelease(v12);
    }
    else
    {
      v13 = 4294960567;
    }
    CFRelease(v8);
  }
  else
  {
    v13 = 4294960567;
    v10 = v8;
  }
  CFRelease(v10);
  return v13;
}

void *_mdns_resolver_copy_description(uint64_t a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int appended;
  int v9;
  void *v10;
  NSObject *v12;
  const char *name;
  const char *v14;
  uint32_t index;
  int v16;
  int v17;
  const __CFArray *v18;
  int v19;
  _QWORD v20[7];
  char v21;
  _QWORD v22[4];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2000000000;
  v26 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2000000000;
  v22[3] = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (a2)
    {
      appended = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1);
      *((_DWORD *)v24 + 6) = appended;
      if (appended)
        goto LABEL_5;
    }
    v9 = mdns_string_builder_append_formatted(v7, "%s", *(const char **)(*(_QWORD *)(a1 + 16) + 48));
    *((_DWORD *)v24 + 6) = v9;
    if (v9)
      goto LABEL_5;
    v12 = *(NSObject **)(a1 + 48);
    if (v12)
    {
      name = nw_interface_get_name(v12);
      v14 = name ? name : "???";
      index = nw_interface_get_index(*(nw_interface_t *)(a1 + 48));
      v16 = mdns_string_builder_append_formatted(v7, " using interface %s (%u)", v14, index);
      *((_DWORD *)v24 + 6) = v16;
      if (v16)
        goto LABEL_5;
    }
    v17 = mdns_string_builder_append_formatted(v7, " with servers [");
    *((_DWORD *)v24 + 6) = v17;
    if (v17)
      goto LABEL_5;
    v18 = *(const __CFArray **)(a1 + 56);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 0x40000000;
    v20[2] = ___mdns_resolver_copy_description_block_invoke;
    v20[3] = &unk_24F286F30;
    v20[4] = &v23;
    v20[5] = v22;
    v20[6] = v7;
    v21 = a3;
    mdns_cfarray_enumerate(v18, (uint64_t)v20);
    if (*((_DWORD *)v24 + 6)
      || (v19 = mdns_string_builder_append_formatted(v7, "]"), (*((_DWORD *)v24 + 6) = v19) != 0))
    {
LABEL_5:
      v10 = 0;
    }
    else
    {
      v10 = mdns_string_builder_copy_string((uint64_t)v7);
    }
    os_release(v7);
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v23, 8);
  return v10;
}

void _mdns_resolver_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  const void *v4;
  NSObject *v5;
  const void *v6;

  v2 = (void *)a1[6];
  if (v2)
  {
    nw_release(v2);
    a1[6] = 0;
  }
  v3 = (void *)a1[8];
  if (v3)
  {
    free(v3);
    a1[8] = 0;
  }
  v4 = (const void *)a1[7];
  if (v4)
  {
    CFRelease(v4);
    a1[7] = 0;
  }
  v5 = a1[9];
  if (v5)
  {
    dispatch_release(v5);
    a1[9] = 0;
  }
  v6 = (const void *)a1[10];
  if (v6)
  {
    _Block_release(v6);
    a1[10] = 0;
  }
}

BOOL ___mdns_resolver_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

void *_mdns_server_copy_description(uint64_t a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  const sockaddr *address;
  char v9;
  void *v10;
  const char *hostname;
  const char *v12;
  int v13;
  int port;
  _BYTE v16[64];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (!a2
      || !mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1))
    {
      if (nw_endpoint_get_type(*(nw_endpoint_t *)(a1 + 48)) == nw_endpoint_type_address)
      {
        address = nw_endpoint_get_address(*(nw_endpoint_t *)(a1 + 48));
        if (*(_BYTE *)(a1 + 111))
          v9 = a3 | 2;
        else
          v9 = a3;
        if (!mdns_string_builder_append_sockaddr_description(v7, (uint64_t)address, v9))
        {
LABEL_18:
          v10 = mdns_string_builder_copy_string((uint64_t)v7);
          goto LABEL_19;
        }
      }
      else
      {
        hostname = nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 48));
        v12 = "«MISSING HOSTNAME»";
        if (hostname)
        {
          v12 = hostname;
          if (a3)
          {
            v13 = DNSMessagePrintObfuscatedString((uint64_t)v16, 64, hostname);
            v12 = "«REDACTED HOSTNAME»";
            if (v13 >= 0)
              v12 = v16;
          }
        }
        if (!mdns_string_builder_append_formatted(v7, "%s", v12))
        {
          if (*(_BYTE *)(a1 + 111))
            goto LABEL_18;
          port = nw_endpoint_get_port(*(nw_endpoint_t *)(a1 + 48));
          if (!mdns_string_builder_append_formatted(v7, ":%u", port))
            goto LABEL_18;
        }
      }
    }
    v10 = 0;
LABEL_19:
    os_release(v7);
    return v10;
  }
  return 0;
}

void _mdns_server_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = (void *)a1[6];
  if (v2)
  {
    nw_release(v2);
    a1[6] = 0;
  }
  v3 = (void *)a1[7];
  if (v3)
  {
    nw_release(v3);
    a1[7] = 0;
  }
  v4 = (_QWORD *)a1[8];
  if (v4)
  {
    v5 = (_QWORD *)*v4;
    if (*v4)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        _pqw_qname_item_free(v5);
        v5 = v6;
      }
      while (v6);
    }
    free(v4);
    a1[8] = 0;
  }
}

void _pqw_qname_item_free(_QWORD *a1)
{
  void *v2;

  v2 = (void *)a1[1];
  if (v2)
    free(v2);
  free(a1);
}

void *_mdns_session_copy_description(_QWORD *a1, int a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
    v6 = 0;
  else
    v6 = mdns_string_builder_copy_string((uint64_t)v5);
  os_release(v5);
  return v6;
}

void _mdns_session_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    os_release(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_QWORD *)(a1 + 48) = 0;
}

_QWORD *mdns_resolver_create(int a1, int a2, int *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _UNKNOWN **v7;
  void (*v8)(_QWORD *);
  int v9;
  _UNKNOWN **v10;
  void (*v11)(_QWORD *);
  _UNKNOWN **v12;
  void (*v13)(_QWORD *);
  _UNKNOWN **v14;
  void (*v15)(_QWORD *);
  CFMutableArrayRef Mutable;
  uint64_t v17;

  switch(a1)
  {
    case 1:
      v5 = (_QWORD *)_os_object_alloc();
      v6 = v5;
      if (!v5)
        goto LABEL_35;
      v7 = &_mdns_normal_resolver_kind;
      v5[2] = &_mdns_normal_resolver_kind;
      do
      {
        v8 = (void (*)(_QWORD *))v7[2];
        if (v8)
          v8(v6);
        v7 = (_UNKNOWN **)*v7;
      }
      while (v7);
      goto LABEL_26;
    case 2:
      v5 = (_QWORD *)_os_object_alloc();
      v6 = v5;
      if (!v5)
        goto LABEL_35;
      v10 = &_mdns_tcp_resolver_kind;
      v5[2] = &_mdns_tcp_resolver_kind;
      do
      {
        v11 = (void (*)(_QWORD *))v10[2];
        if (v11)
          v11(v6);
        v10 = (_UNKNOWN **)*v10;
      }
      while (v10);
      goto LABEL_26;
    case 3:
      v5 = (_QWORD *)_os_object_alloc();
      v6 = v5;
      if (!v5)
        goto LABEL_35;
      v12 = &_mdns_tls_resolver_kind;
      v5[2] = &_mdns_tls_resolver_kind;
      do
      {
        v13 = (void (*)(_QWORD *))v12[2];
        if (v13)
          v13(v6);
        v12 = (_UNKNOWN **)*v12;
      }
      while (v12);
      goto LABEL_26;
    case 4:
      v5 = (_QWORD *)_os_object_alloc();
      v6 = v5;
      if (v5)
      {
        v14 = &_mdns_https_resolver_kind;
        v5[2] = &_mdns_https_resolver_kind;
        do
        {
          v15 = (void (*)(_QWORD *))v14[2];
          if (v15)
            v15(v6);
          v14 = (_UNKNOWN **)*v14;
        }
        while (v14);
LABEL_26:
        Mutable = CFArrayCreateMutable(0, 0, &mdns_cfarray_callbacks);
        v6[7] = Mutable;
        if (Mutable)
        {
          if (!a2 || (v17 = nw_interface_create_with_index(), (v6[6] = v17) != 0))
          {
            v5 = 0;
            v9 = 0;
            goto LABEL_30;
          }
          v9 = -6700;
        }
        else
        {
          v9 = -6729;
        }
        v5 = v6;
        v6 = 0;
      }
      else
      {
LABEL_35:
        v9 = -6728;
      }
LABEL_30:
      if (a3)
        *a3 = v9;
      if (v5)
        os_release(v5);
      return v6;
    default:
      v5 = 0;
      v6 = 0;
      v9 = -6756;
      goto LABEL_30;
  }
}

void _mdns_https_resolver_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;

  v2 = (void *)a1[18];
  if (v2)
  {
    free(v2);
    a1[18] = 0;
  }
  v3 = (void *)a1[19];
  if (v3)
  {
    free(v3);
    a1[19] = 0;
  }
  v4 = (void *)a1[20];
  if (v4)
  {
    free(v4);
    a1[20] = 0;
  }
  v5 = (void *)a1[21];
  if (v5)
  {
    xpc_release(v5);
    a1[21] = 0;
  }
  v6 = (void *)a1[22];
  if (v6)
  {
    nw_release(v6);
    a1[22] = 0;
  }
  v7 = (void *)a1[23];
  if (v7)
  {
    nw_release(v7);
    a1[23] = 0;
  }
  v8 = (const void *)a1[24];
  if (v8)
  {
    CFRelease(v8);
    a1[24] = 0;
  }
}

uint64_t _mdns_https_resolver_set_provider_name(uint64_t a1, char *a2)
{
  mdns_replace_string((void **)(a1 + 144), a2);
  return 0;
}

uint64_t _mdns_https_resolver_set_connection_hostname(uint64_t a1, char *a2)
{
  mdns_replace_string((void **)(a1 + 152), a2);
  return 0;
}

uint64_t _mdns_https_resolver_set_port(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 228) = a2;
  return result;
}

uint64_t _mdns_https_resolver_set_url_path(uint64_t a1, char *a2)
{
  mdns_replace_string((void **)(a1 + 160), a2);
  return 0;
}

uint64_t _mdns_https_resolver_set_identity(uint64_t a1, UInt8 *bytes, CFIndex length)
{
  CFTypeRef v4;
  uint64_t result;
  const void *v6;
  unsigned int v7;

  v7 = 0;
  if (bytes)
  {
    v4 = _mdns_copy_sec_identity(bytes, length, (int *)&v7);
    result = v7;
    if (v7)
      return result;
  }
  else
  {
    v4 = 0;
  }
  v6 = *(const void **)(a1 + 192);
  if (v6)
    CFRelease(v6);
  result = 0;
  *(_QWORD *)(a1 + 192) = v4;
  return result;
}

uint64_t _mdns_https_resolver_update_odoh_config_async(void *a1, char *__s1, char *a3, const void *a4, size_t a5, void *a6)
{
  xpc_object_t v6;
  char *v10;
  char *v12;
  _QWORD block[9];

  v10 = a3;
  if (__s1)
  {
    v12 = strdup(__s1);
    if (!v12)
      goto LABEL_14;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v10 = strdup(v10);
    if (v10)
      goto LABEL_7;
LABEL_14:
    __break(1u);
LABEL_15:
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
LABEL_13:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___mdns_https_resolver_update_odoh_config_async_block_invoke;
    block[3] = &__block_descriptor_tmp_39_1177;
    block[4] = v12;
    block[5] = a1;
    block[6] = v10;
    block[7] = v6;
    block[8] = a6;
    dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
    return 0;
  }
  v12 = 0;
  if (a3)
    goto LABEL_6;
LABEL_7:
  v6 = 0;
  if (!a4 || !a5 || (v6 = xpc_data_create(a4, a5)) != 0)
  {
    if (a6)
      nw_retain(a6);
    os_retain(a1);
    if (_mdns_resolver_queue_s_once == -1)
      goto LABEL_13;
    goto LABEL_15;
  }
  if (v12)
    free(v12);
  if (v10)
    free(v10);
  return 4294960567;
}

nw_parameters_t _mdns_https_resolver_get_stream_params(_QWORD *a1, int *a2)
{
  nw_parameters_t v3;
  int v4;
  nw_parameters_t tcp;
  int v8;
  const char *v9;
  NSObject *v10;
  char *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = (nw_parameters_t)a1[23];
  if (!v3)
  {
    if (a1[18])
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2000000000;
      v16 = 0;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 0x40000000;
      v12[2] = ___mdns_https_resolver_create_stream_params_block_invoke;
      v12[3] = &unk_24F286E60;
      v12[4] = &v13;
      v12[5] = a1;
      tcp = _mdns_nw_parameters_create_tcp(v12);
      if (!tcp)
      {
        _Block_object_dispose(&v13, 8);
        v4 = -6729;
        goto LABEL_20;
      }
      v3 = tcp;
      v8 = *((unsigned __int8 *)v14 + 24);
      _Block_object_dispose(&v13, 8);
      if (!v8)
      {
        nw_release(v3);
        v4 = -6700;
LABEL_20:
        v3 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v3 = _mdns_nw_parameters_create_tcp((void *)*MEMORY[0x24BDE0878]);
      if (!v3)
      {
        v4 = -6729;
        goto LABEL_17;
      }
    }
    v11 = 0;
    v9 = (const char *)a1[20];
    if (!v9)
      v9 = "";
    asprintf(&v11, "https://%s%s", (const char *)a1[18], v9);
    nw_parameters_set_url();
    if (v11)
      free(v11);
    v10 = a1[6];
    if (v10)
      nw_parameters_require_interface(v3, v10);
    v4 = 0;
LABEL_17:
    a1[23] = v3;
    if (!a2)
      return v3;
    goto LABEL_3;
  }
  v4 = 0;
  if (a2)
LABEL_3:
    *a2 = v4;
  return v3;
}

uint64_t _mdns_https_resolver_get_effective_connection_hostname(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 152);
  if (!result)
    return *(_QWORD *)(a1 + 144);
  return result;
}

uint64_t _mdns_https_resolver_get_custom_port(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 228);
}

uint64_t _mdns_https_resolver_get_client_address(uint64_t a1)
{
  return a1 + 200;
}

void ___mdns_https_resolver_create_stream_params_block_invoke(uint64_t a1, id a2)
{
  NSObject *v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    sec_protocol_options_set_tls_server_name(v3, *(const char **)(*(_QWORD *)(a1 + 40) + 144));
    sec_protocol_options_set_peer_authentication_required(v4, 1);
    sec_protocol_options_add_tls_application_protocol(v4, "h2");
    sec_release(v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

nw_parameters_t _mdns_nw_parameters_create_tcp(void *a1)
{
  nw_parameters_t secure_tcp;

  secure_tcp = nw_parameters_create_secure_tcp(a1, (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0878]);
  if (secure_tcp)
  {
    nw_parameters_set_indefinite();
    nw_parameters_set_no_wake_from_sleep();
  }
  return secure_tcp;
}

void ___mdns_https_resolver_update_odoh_config_async_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 144);
    if (v4)
    {
      free(v4);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144) = 0;
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
    }
    *(_QWORD *)(v3 + 144) = v2;
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 160);
    if (v7)
    {
      free(v7);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160) = 0;
      v6 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
    }
    *(_QWORD *)(v6 + 160) = v5;
  }
  v8 = *(_QWORD **)(a1 + 40);
  v10 = *(void **)(a1 + 56);
  v9 = *(void **)(a1 + 64);
  v11 = (void *)v8[23];
  if (v11)
  {
    nw_release(v11);
    v8[23] = 0;
  }
  v12 = (void *)v8[21];
  if (v12 != v10)
  {
    if (v12)
      xpc_release(v12);
    v8[21] = v10;
    if (v10)
      xpc_retain(v10);
  }
  v13 = (void *)v8[22];
  if (v13 != v9)
  {
    if (v13)
      nw_release(v13);
    v8[22] = v9;
    if (v9)
      nw_retain(v9);
  }
  v14 = *(void **)(a1 + 56);
  if (v14)
    xpc_release(v14);
  v15 = *(void **)(a1 + 64);
  if (v15)
    nw_release(v15);
  os_release(*(void **)(a1 + 40));
}

dispatch_queue_t ___mdns_resolver_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.resolver-queue", 0);
  _mdns_resolver_queue_s_queue = (uint64_t)result;
  return result;
}

CFTypeRef _mdns_copy_sec_identity(UInt8 *bytes, CFIndex length, int *a3)
{
  CFDataRef v4;
  CFDataRef v5;
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  const void *v8;
  OSStatus v9;
  CFTypeID v10;
  CFTypeRef v11;
  NSObject *v12;
  int v13;
  NSObject *v15;
  NSObject *v16;
  CFStringRef v17;
  CFTypeID v18;
  CFTypeRef result;
  uint8_t buf[4];
  CFDataRef v21;
  __int16 v22;
  CFStringRef v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  result = 0;
  v4 = CFDataCreate(0, bytes, length);
  if (!v4)
  {
LABEL_21:
    v11 = 0;
    v13 = -6729;
    if (!a3)
      return v11;
    goto LABEL_14;
  }
  v5 = v4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    CFRelease(v5);
    goto LABEL_21;
  }
  v7 = Mutable;
  v8 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE94D8], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x24BDE9558], v5);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9238]);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x24BDE9538], v8);
  v9 = SecItemCopyMatching(v7, &result);
  if (v9)
  {
    v13 = v9;
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v16 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2048;
      v23 = (CFStringRef)v13;
      _os_log_error_impl(&dword_22983F000, v16, OS_LOG_TYPE_ERROR, "Failed to find identity item -- reference: %@, error: %{mdns:err}ld", buf, 0x16u);
    }
    v11 = 0;
  }
  else if (result && (v10 = CFGetTypeID(result), v10 == SecIdentityGetTypeID()))
  {
    v11 = result;
    result = 0;
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v12 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_debug_impl(&dword_22983F000, v12, OS_LOG_TYPE_DEBUG, "Found identity with reference %@", buf, 0xCu);
    }
    v13 = 0;
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v15 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_FAULT))
    {
      if (result)
      {
        v18 = CFGetTypeID(result);
        v17 = CFCopyTypeIDDescription(v18);
      }
      else
      {
        v17 = CFSTR("none");
      }
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2114;
      v23 = v17;
      _os_log_fault_impl(&dword_22983F000, v15, OS_LOG_TYPE_FAULT, "Unexpected identity item type -- reference: %@, type: %{public}@", buf, 0x16u);
    }
    v11 = 0;
    v13 = -6756;
  }
  CFRelease(v5);
  CFRelease(v7);
  if (result)
    CFRelease(result);
  if (a3)
LABEL_14:
    *a3 = v13;
  return v11;
}

os_log_t ___mdns_resolver_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "resolver");
  _mdns_resolver_log_s_log = (uint64_t)result;
  return result;
}

void _mdns_tls_resolver_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)a1[18];
  if (v2)
  {
    free(v2);
    a1[18] = 0;
  }
  v3 = (void *)a1[19];
  if (v3)
  {
    free(v3);
    a1[19] = 0;
  }
  v4 = (void *)a1[20];
  if (v4)
  {
    nw_release(v4);
    a1[20] = 0;
  }
  v5 = (void *)a1[21];
  if (v5)
  {
    sec_release(v5);
    a1[21] = 0;
  }
}

uint64_t _mdns_tls_resolver_set_provider_name(uint64_t a1, char *a2)
{
  mdns_replace_string((void **)(a1 + 144), a2);
  return 0;
}

uint64_t _mdns_tls_resolver_set_connection_hostname(uint64_t a1, char *a2)
{
  mdns_replace_string((void **)(a1 + 152), a2);
  return 0;
}

uint64_t _mdns_tls_resolver_set_port(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 176) = a2;
  return result;
}

uint64_t _mdns_tls_resolver_set_identity(uint64_t a1, UInt8 *bytes, CFIndex length)
{
  __SecIdentity *v4;
  uint64_t result;
  sec_identity_t v6;
  void *v7;
  unsigned int v8;

  v8 = 0;
  if (bytes)
  {
    v4 = (__SecIdentity *)_mdns_copy_sec_identity(bytes, length, (int *)&v8);
    result = v8;
    if (v8)
      return result;
    v6 = sec_identity_create(v4);
    if (v4)
      CFRelease(v4);
    if (!v6)
      return 4294960567;
  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)(a1 + 168);
  if (v7)
    sec_release(v7);
  result = 0;
  *(_QWORD *)(a1 + 168) = v6;
  return result;
}

nw_parameters_t _mdns_tls_resolver_get_stream_params(_QWORD *a1, int *a2)
{
  nw_parameters_t v3;
  int v4;
  nw_parameters_t tcp;
  int v8;
  NSObject *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = (nw_parameters_t)a1[20];
  if (!v3)
  {
    if (a1[18] || a1[21])
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2000000000;
      v14 = 0;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 0x40000000;
      v10[2] = ___mdns_tls_resolver_create_stream_params_block_invoke;
      v10[3] = &unk_24F286E18;
      v10[4] = &v11;
      v10[5] = a1;
      tcp = _mdns_nw_parameters_create_tcp(v10);
      if (!tcp)
      {
        _Block_object_dispose(&v11, 8);
        v4 = -6729;
LABEL_19:
        v3 = 0;
        goto LABEL_12;
      }
      v3 = tcp;
      v8 = *((unsigned __int8 *)v12 + 24);
      _Block_object_dispose(&v11, 8);
      if (!v8)
      {
        v4 = -6777;
LABEL_18:
        nw_release(v3);
        goto LABEL_19;
      }
    }
    else
    {
      v3 = _mdns_nw_parameters_create_tcp((void *)*MEMORY[0x24BDE0878]);
      if (!v3)
      {
        v4 = -6729;
        goto LABEL_12;
      }
    }
    v9 = a1[6];
    if (v9)
      nw_parameters_require_interface(v3, v9);
    v4 = _mdns_add_dns_over_bytestream_framer(v3);
    if (!v4)
    {
LABEL_12:
      a1[20] = v3;
      if (!a2)
        return v3;
      goto LABEL_3;
    }
    goto LABEL_18;
  }
  v4 = 0;
  if (a2)
LABEL_3:
    *a2 = v4;
  return v3;
}

uint64_t _mdns_tls_resolver_get_effective_connection_hostname(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 152);
  if (!result)
    return *(_QWORD *)(a1 + 144);
  return result;
}

uint64_t _mdns_tls_resolver_get_custom_port(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 176);
}

void ___mdns_tls_resolver_create_stream_params_block_invoke(uint64_t a1, id a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  _QWORD verify_block[5];

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(const char **)(v5 + 144);
    if (v6)
    {
      sec_protocol_options_set_tls_server_name(v3, v6);
      sec_protocol_options_set_peer_authentication_required(v4, 1);
      v5 = *(_QWORD *)(a1 + 40);
    }
    v7 = *(NSObject **)(v5 + 168);
    if (v7)
    {
      sec_protocol_options_set_local_identity(v4, v7);
      v5 = *(_QWORD *)(a1 + 40);
    }
    verify_block[0] = MEMORY[0x24BDAC760];
    verify_block[1] = 0x40000000;
    verify_block[2] = ___mdns_tls_resolver_create_stream_params_block_invoke_2;
    verify_block[3] = &__block_descriptor_tmp_34_1200;
    verify_block[4] = v5;
    if (_mdns_resolver_queue_s_once != -1)
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
    sec_protocol_options_set_verify_block(v4, verify_block, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    sec_release(v4);
  }
}

uint64_t _mdns_add_dns_over_bytestream_framer(NSObject *a1)
{
  nw_protocol_stack_t v1;
  NSObject *v2;
  void *v3;
  nw_protocol_options_t options;
  uint64_t v5;

  v1 = nw_parameters_copy_default_protocol_stack(a1);
  if (!v1)
    return 4294960567;
  v2 = v1;
  if (_mdns_copy_dns_over_bytestream_framer_s_once != -1)
    dispatch_once(&_mdns_copy_dns_over_bytestream_framer_s_once, &__block_literal_global_11);
  if (!_mdns_copy_dns_over_bytestream_framer_s_framer_def
    || (nw_retain((void *)_mdns_copy_dns_over_bytestream_framer_s_framer_def),
        (v3 = (void *)_mdns_copy_dns_over_bytestream_framer_s_framer_def) == 0))
  {
    v5 = 4294960567;
    options = v2;
LABEL_9:
    nw_release(options);
    return v5;
  }
  options = nw_framer_create_options((nw_protocol_definition_t)_mdns_copy_dns_over_bytestream_framer_s_framer_def);
  if (options)
  {
    nw_protocol_stack_prepend_application_protocol(v2, options);
    v5 = 0;
  }
  else
  {
    v5 = 4294960567;
  }
  nw_release(v2);
  nw_release(v3);
  if (options)
    goto LABEL_9;
  return v5;
}

nw_protocol_definition_t ___mdns_copy_dns_over_bytestream_framer_block_invoke()
{
  nw_protocol_definition_t result;

  result = nw_framer_create_definition("DNS over byte-stream", 0, &__block_literal_global_24);
  _mdns_copy_dns_over_bytestream_framer_s_framer_def = (uint64_t)result;
  return result;
}

uint64_t ___mdns_create_dns_over_bytestream_framer_block_invoke_1190(int a1, nw_framer_t framer)
{
  nw_framer_set_input_handler(framer, &__block_literal_global_14_1193);
  nw_framer_set_output_handler(framer, &__block_literal_global_20);
  return 1;
}

void _mdns_normal_resolver_kind_block_invoke_3(int a1, nw_framer_t framer, uint64_t a3, size_t a4)
{
  uint8_t output_buffer[2];

  if (a4 < 0x10000)
  {
    *(_WORD *)output_buffer = bswap32(a4) >> 16;
    nw_framer_write_output(framer, output_buffer, 2uLL);
    nw_framer_write_output_no_copy(framer, a4);
  }
  else
  {
    nw_framer_mark_failed_with_error(framer, 40);
  }
}

uint64_t _mdns_normal_resolver_kind_block_invoke(int a1, nw_framer_t framer)
{
  size_t v3;
  NSObject *v4;
  uint8_t temp_buffer[2];

  do
  {
    if (!nw_framer_parse_input(framer, 2uLL, 2uLL, temp_buffer, &__block_literal_global_17))
      break;
    v3 = __rev16(*(unsigned __int16 *)temp_buffer);
    v4 = nw_framer_message_create(framer);
    LODWORD(v3) = nw_framer_deliver_input_no_copy(framer, v3, v4, 1);
    nw_release(v4);
  }
  while ((_DWORD)v3);
  return 2;
}

uint64_t _mdns_normal_resolver_kind_block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return 2 * (a3 > 1);
}

void ___mdns_tls_resolver_create_stream_params_block_invoke_2(uint64_t a1, int a2, sec_trust_t trust, uint64_t a4)
{
  __SecTrust *v6;
  OSStatus Allowed;
  OSStatus v8;
  OSStatus v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  OSStatus v13;
  uint64_t v14;
  _QWORD result[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = sec_trust_copy_ref(trust);
  Allowed = SecTrustSetNetworkFetchAllowed(v6, 0);
  if (Allowed)
  {
    v9 = Allowed;
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v10 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
    *(_DWORD *)buf = 136315394;
    v17 = v11;
    v18 = 2048;
    v19 = v9;
    v12 = "Failed to disable network fetch for trust evaluation -- provider name: %s, error: %{mdns:err}ld";
LABEL_18:
    _os_log_error_impl(&dword_22983F000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
    goto LABEL_15;
  }
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  result[0] = MEMORY[0x24BDAC760];
  result[1] = 0x40000000;
  result[2] = ___mdns_tls_resolver_create_stream_params_block_invoke_30;
  result[3] = &unk_24F286DD0;
  result[4] = a4;
  v8 = SecTrustEvaluateAsyncWithError(v6, (dispatch_queue_t)_mdns_resolver_queue_s_queue, result);
  if (!v8)
  {
    if (!v6)
      return;
    goto LABEL_6;
  }
  v13 = v8;
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v10 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
    *(_DWORD *)buf = 136315394;
    v17 = v14;
    v18 = 2048;
    v19 = v13;
    v12 = "Failed to start aynchronous trust evaluation -- provider name: %s, error: %{mdns:err}ld";
    goto LABEL_18;
  }
LABEL_15:
  (*(void (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
  if (v6)
LABEL_6:
    CFRelease(v6);
}

uint64_t ___mdns_tls_resolver_create_stream_params_block_invoke_30(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) == 0)
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v6 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = a4;
      _os_log_error_impl(&dword_22983F000, v6, OS_LOG_TYPE_ERROR, "Aynchronous trust evaluation failed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void _mdns_tcp_resolver_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 144);
  if (v2)
  {
    nw_release(v2);
    *(_QWORD *)(a1 + 144) = 0;
  }
}

NSObject *_mdns_tcp_resolver_get_stream_params(uint64_t a1, int *a2)
{
  NSObject *result;
  int v5;
  int v6;

  result = *(NSObject **)(a1 + 144);
  if (!result && (v6 = 0, result = _mdns_create_tcp_parameters(&v6), *(_QWORD *)(a1 + 144) = result, (v5 = v6) != 0))
  {
    result = 0;
    if (!a2)
      return result;
  }
  else
  {
    v5 = 0;
    if (!a2)
      return result;
  }
  *a2 = v5;
  return result;
}

NSObject *_mdns_create_tcp_parameters(int *a1)
{
  NSObject *tcp;
  NSObject *v3;
  int v4;

  tcp = _mdns_nw_parameters_create_tcp((void *)*MEMORY[0x24BDE0888]);
  v3 = tcp;
  if (tcp)
  {
    v4 = _mdns_add_dns_over_bytestream_framer(tcp);
    if (v4)
    {
      nw_release(v3);
      v3 = 0;
    }
    else
    {
      nw_parameters_set_prefer_no_proxy(v3, 1);
    }
  }
  else
  {
    v4 = -6729;
  }
  if (a1)
    *a1 = v4;
  return v3;
}

void _mdns_normal_resolver_finalize(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 144);
  if (v2)
  {
    nw_release(v2);
    *(_QWORD *)(a1 + 144) = 0;
  }
  v3 = *(void **)(a1 + 152);
  if (v3)
  {
    nw_release(v3);
    *(_QWORD *)(a1 + 152) = 0;
  }
}

nw_parameters_t _mdns_normal_resolver_get_datagram_params(uint64_t a1, int *a2)
{
  nw_parameters_t secure_udp;
  int v4;

  secure_udp = *(nw_parameters_t *)(a1 + 144);
  if (secure_udp)
  {
    v4 = 0;
    if (a2)
LABEL_3:
      *a2 = v4;
  }
  else
  {
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0888], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0878]);
    if (secure_udp)
    {
      nw_parameters_set_no_wake_from_sleep();
      v4 = 0;
    }
    else
    {
      v4 = -6729;
    }
    *(_QWORD *)(a1 + 144) = secure_udp;
    if (a2)
      goto LABEL_3;
  }
  return secure_udp;
}

NSObject *_mdns_normal_resolver_get_stream_params(uint64_t a1, int *a2)
{
  NSObject *result;
  int v5;
  int v6;

  result = *(NSObject **)(a1 + 152);
  if (!result && (v6 = 0, result = _mdns_create_tcp_parameters(&v6), *(_QWORD *)(a1 + 152) = result, (v5 = v6) != 0))
  {
    result = 0;
    if (!a2)
      return result;
  }
  else
  {
    v5 = 0;
    if (!a2)
      return result;
  }
  *a2 = v5;
  return result;
}

void mdns_resolver_set_queue(uint64_t a1, dispatch_object_t object)
{
  NSObject *v4;

  if (!*(_BYTE *)(a1 + 137))
  {
    dispatch_retain(object);
    v4 = *(NSObject **)(a1 + 72);
    if (v4)
      dispatch_release(v4);
    *(_QWORD *)(a1 + 72) = object;
  }
}

void mdns_resolver_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 137))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 80);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 80) = v3;
  }
}

uint64_t mdns_resolver_set_provider_name(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (*(_BYTE *)(a1 + 137))
    return 4294960577;
  v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 56);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t mdns_resolver_set_connection_hostname(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (*(_BYTE *)(a1 + 137))
    return 4294960577;
  v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 64);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t mdns_resolver_set_port(uint64_t result)
{
  uint64_t (*v1)(void);

  if (!*(_BYTE *)(result + 137))
  {
    v1 = *(uint64_t (**)(void))(*(_QWORD *)(result + 16) + 72);
    if (v1)
      return v1();
  }
  return result;
}

uint64_t mdns_resolver_set_url_path(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (*(_BYTE *)(a1 + 137))
    return 4294960577;
  v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 80);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t mdns_resolver_set_identity_reference(uint64_t a1)
{
  uint64_t (*v1)(void);

  if (*(_BYTE *)(a1 + 137))
    return 4294960577;
  v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 88);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t mdns_resolver_update_odoh_config(uint64_t a1)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 96);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t mdns_resolver_set_squash_cnames(uint64_t result, char a2)
{
  if (!*(_BYTE *)(result + 137))
    *(_BYTE *)(result + 133) = a2;
  return result;
}

uint64_t mdns_resolver_enable_symptom_reporting(uint64_t result, char a2)
{
  if (!*(_BYTE *)(result + 137))
    *(_BYTE *)(result + 132) = a2;
  return result;
}

uint64_t mdns_resolver_add_server_address(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  int v4;
  nw_endpoint_t address;
  nw_endpoint_t v6;
  uint64_t v7;
  _BYTE v9[28];

  if (*(_BYTE *)(a1 + 137))
    return 4294960577;
  *(_DWORD *)&v9[24] = 0;
  *(_QWORD *)&v9[16] = 0;
  v3 = (_OWORD *)(a2 + 24);
  v4 = *(unsigned __int8 *)(a2 + 25);
  if (v4 == 30)
  {
    *(_OWORD *)v9 = *v3;
    *(_OWORD *)&v9[12] = *(_OWORD *)(a2 + 36);
  }
  else
  {
    if (v4 != 2)
      return 4294960540;
    *(_OWORD *)v9 = *v3;
  }
  if (!*(_WORD *)&v9[2])
    *(_WORD *)&v9[2] = bswap32(*(unsigned __int16 *)(*(_QWORD *)(a1 + 16) + 156)) >> 16;
  address = nw_endpoint_create_address((const sockaddr *)v9);
  if (!address)
    return 4294960596;
  v6 = address;
  if (*(_QWORD *)(a1 + 48))
    nw_endpoint_set_interface();
  v7 = _mdns_resolver_add_server_by_endpoint(a1, v6);
  nw_release(v6);
  return v7;
}

uint64_t _mdns_resolver_add_server_by_endpoint(uint64_t a1, void *a2)
{
  CFIndex Count;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (Count > 31)
    return 4294960532;
  v5 = Count;
  v6 = _os_object_alloc();
  if (!v6)
    return 4294960568;
  v7 = v6;
  v8 = &_mdns_server_kind;
  *(_QWORD *)(v6 + 16) = &_mdns_server_kind;
  do
  {
    v9 = (void (*)(uint64_t))v8[2];
    if (v9)
      v9(v7);
    v8 = (_UNKNOWN **)*v8;
  }
  while (v8);
  *(_QWORD *)(v7 + 48) = a2;
  nw_retain(a2);
  v10 = *(_QWORD *)(a1 + 16);
  if (*(_WORD *)(v10 + 156))
  {
    v11 = *(unsigned __int16 *)(v10 + 156);
    if (nw_endpoint_get_port(*(nw_endpoint_t *)(v7 + 48)) == v11)
      *(_BYTE *)(v7 + 111) = 1;
  }
  *(_DWORD *)(v7 + 100) = v5 + 1;
  v12 = mach_continuous_time();
  if (mdns_mach_ticks_per_second_s_once != -1)
    dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
  v13 = v12 - 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
  *(_QWORD *)(v7 + 80) = v13;
  *(_QWORD *)(v7 + 88) = v13;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), (const void *)v7);
  os_release((void *)v7);
  return 0;
}

uint64_t mdns_resolver_set_initial_datagram_retransmission_interval(uint64_t result, unsigned int a2)
{
  int v2;

  if (!*(_BYTE *)(result + 137))
  {
    v2 = 1000 * a2;
    if (a2 >= 0x418938)
      v2 = -1;
    *(_DWORD *)(result + 124) = v2;
  }
  return result;
}

uint64_t mdns_resolver_disable_connection_reuse(uint64_t result, char a2)
{
  if (!*(_BYTE *)(result + 137))
    *(_BYTE *)(result + 138) = a2;
  return result;
}

uint64_t mdns_resolver_enable_problematic_qtype_workaround(uint64_t result, int a2)
{
  int v2;

  if (!*(_BYTE *)(result + 137))
  {
    if (a2 >= 0x64)
      v2 = 100;
    else
      v2 = a2;
    if (a2 <= 0)
      v2 = 0;
    *(_DWORD *)(result + 128) = v2;
  }
  return result;
}

void mdns_resolver_activate(_BYTE *a1)
{
  _QWORD block[5];

  if (!a1[137])
  {
    a1[137] = 1;
    os_retain(a1);
    if (_mdns_resolver_queue_s_once != -1)
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __mdns_resolver_activate_block_invoke;
    block[3] = &__block_descriptor_tmp_1243;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
  }
}

void __mdns_resolver_activate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  _QWORD *v5;
  uint64_t v6;
  char *ValueAtIndex;
  uint64_t evaluator_for_endpoint;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int v13;
  const char *v14;
  uint64_t (*v15)(uint64_t);
  uint64_t (*v16)(uint64_t);
  uint64_t host_with_numeric_port;
  void *v18;
  NSObject *v19;
  const void *v20;
  _BYTE buf[24];
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 136) && !*(_BYTE *)(v1 + 135))
  {
    *(_BYTE *)(v1 + 135) = 1;
    if (*(_QWORD *)(v1 + 80) && !*(_QWORD *)(v1 + 72))
    {
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v19 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_22983F000, v19, OS_LOG_TYPE_ERROR, "API misuse: an event handler without a queue is useless!", buf, 2u);
      }
      v20 = *(const void **)(v1 + 80);
      if (v20)
      {
        _Block_release(v20);
        *(_QWORD *)(v1 + 80) = 0;
      }
    }
    if (!*(_DWORD *)(v1 + 124))
      *(_DWORD *)(v1 + 124) = 1000;
    if (CFArrayGetCount(*(CFArrayRef *)(v1 + 56)) <= 0)
    {
      v15 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v1 + 16) + 120);
      if (v15)
      {
        if (v15(v1))
        {
          v16 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v1 + 16) + 128);
          if (v16)
            v16(v1);
          host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
          if (host_with_numeric_port)
          {
            v18 = (void *)host_with_numeric_port;
            if (*(_QWORD *)(v1 + 48))
              nw_endpoint_set_interface();
            _mdns_resolver_add_server_by_endpoint(v1, v18);
            nw_release(v18);
          }
        }
      }
    }
    Count = CFArrayGetCount(*(CFArrayRef *)(v1 + 56));
    if (Count >= 1)
    {
      v3 = Count;
      v4 = 0;
      v5 = (_QWORD *)(v1 + 24);
      v6 = MEMORY[0x24BDAC760];
      do
      {
        ValueAtIndex = (char *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 56), v4);
        *((_QWORD *)ValueAtIndex + 3) = 0;
        *v5 = ValueAtIndex;
        if (nw_endpoint_get_type(*((nw_endpoint_t *)ValueAtIndex + 6)) == nw_endpoint_type_address)
        {
          evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
          *((_QWORD *)ValueAtIndex + 7) = evaluator_for_endpoint;
          if (evaluator_for_endpoint)
          {
            if (_mdns_resolver_queue_s_once != -1)
              dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
            nw_path_evaluator_set_queue();
            os_retain((void *)v1);
            os_retain(ValueAtIndex);
            if (_mdns_resolver_queue_s_once != -1)
              dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
            *(_QWORD *)buf = v6;
            *(_QWORD *)&buf[8] = 0x40000000;
            *(_QWORD *)&buf[16] = ___mdns_resolver_set_up_server_path_evaluator_block_invoke;
            v23 = &__block_descriptor_tmp_61_1246;
            v24 = v1;
            v25 = ValueAtIndex;
            nw_path_evaluator_set_update_handler();
            nw_path_evaluator_set_cancel_handler();
            nw_path_evaluator_start();
            v9 = nw_path_evaluator_copy_path();
            if (v9)
            {
              v10 = v9;
              ValueAtIndex[106] = _mdns_get_server_usability_from_path(v9, (*(_DWORD *)(*(_QWORD *)(v1 + 16) + 144) - 3) < 2);
              nw_release(v10);
            }
            goto LABEL_23;
          }
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v11 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = ValueAtIndex;
            _os_log_error_impl(&dword_22983F000, v11, OS_LOG_TYPE_ERROR, "Failed to create path evaluator for %@", buf, 0xCu);
          }
        }
        ValueAtIndex[106] = 2;
LABEL_23:
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v12 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          v13 = ValueAtIndex[106] + 1;
          v14 = "<INVALID USABILITY>";
          if (v13 <= 5)
            v14 = off_24F2872B8[v13];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = ValueAtIndex;
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v14;
          _os_log_impl(&dword_22983F000, v12, OS_LOG_TYPE_DEFAULT, "Server %@ usability is %{public}s", buf, 0x16u);
        }
        ++v4;
        v5 = ValueAtIndex + 24;
      }
      while (v3 != v4);
    }
    _mdns_resolver_check_for_problematic_servers(v1);
    v1 = *(_QWORD *)(a1 + 32);
  }
  os_release((void *)v1);
}

void ___mdns_resolver_set_up_server_path_evaluator_block_invoke(uint64_t a1, NSObject *a2)
{
  char server_usability_from_path;
  uint64_t v4;
  int v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  server_usability_from_path = _mdns_get_server_usability_from_path(a2, (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 144) - 3) < 2);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(char *)(v4 + 106);
  if (server_usability_from_path != *(_BYTE *)(v4 + 106))
  {
    v6 = v5 - 1;
    *(_BYTE *)(v4 + 106) = server_usability_from_path;
    if ((server_usability_from_path - 1) > 3u)
    {
      if (v6 <= 3)
      {
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v11 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 40);
          v14 = 138412290;
          v15 = v12;
          _os_log_impl(&dword_22983F000, v11, OS_LOG_TYPE_DEFAULT, "Server %@ usability is now unusable", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v7 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v9 = *(char *)(v8 + 106) + 1;
        if (v9 > 5)
          v10 = "<INVALID USABILITY>";
        else
          v10 = off_24F2872B8[v9];
        v14 = 138412546;
        v15 = v8;
        v16 = 2082;
        v17 = v10;
        _os_log_impl(&dword_22983F000, v7, OS_LOG_TYPE_DEFAULT, "Server %@ usability is now %{public}s", (uint8_t *)&v14, 0x16u);
      }
      if (v5 == 4 || v6 >= 4)
      {
        _mdns_resolver_unpenalize_server(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
        _mdns_resolver_handle_revived_server(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0);
      }
    }
  }
}

void ___mdns_resolver_set_up_server_path_evaluator_block_invoke_62(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
  os_release(*(void **)(a1 + 40));
}

uint64_t _mdns_get_server_usability_from_path(NSObject *a1, int a2)
{
  nw_path_status_t status;
  char v5;
  NSObject *v6;
  NSObject *v7;
  const sockaddr *address;
  int sa_family;

  status = nw_path_get_status(a1);
  v5 = 1;
  if (status != nw_path_status_satisfied && status != nw_path_status_satisfiable)
  {
    if (status == nw_path_status_unsatisfied)
    {
      if ((nw_path_is_per_app_vpn() & 1) != 0)
        return 3;
      if (nw_path_get_reason() == 2)
        return 4;
      if ((nw_path_has_nat64_prefixes() & 1) != 0 || a2 && nw_path_has_dns(a1))
      {
        v6 = nw_path_copy_endpoint();
        if (v6)
        {
          v7 = v6;
          if (nw_endpoint_get_type(v6) == nw_endpoint_type_address)
          {
            address = nw_endpoint_get_address(v7);
            if (address)
            {
              sa_family = address->sa_family;
              nw_release(v7);
              if (sa_family == 2)
                return 2;
              else
                return -1;
            }
          }
          nw_release(v7);
        }
      }
    }
    return -1;
  }
  return v5;
}

void _mdns_resolver_check_for_problematic_servers(uint64_t a1)
{
  uint64_t v2;
  dispatch_source_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[5];
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 16) + 158) || *(_QWORD *)(a1 + 104))
    return;
  v2 = *(_QWORD *)(a1 + 24);
  if (!v2)
  {
LABEL_8:
    if (!*(_BYTE *)(a1 + 140))
    {
      if (_mdns_resolver_queue_s_once != -1)
        dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
      v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
      *(_QWORD *)(a1 + 104) = v3;
      if (!v3)
      {
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v7 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_22983F000, v7, OS_LOG_TYPE_ERROR, "Failed to create probe timer", buf, 2u);
        }
        return;
      }
      v4 = v3;
      v5 = dispatch_time(0x8000000000000000, 7200000000000);
      dispatch_source_set_timer(v4, v5, 0x68C61714000uLL, 0x53D1AC1000uLL);
      v6 = *(NSObject **)(a1 + 104);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_resolver_check_for_problematic_servers_block_invoke;
      handler[3] = &__block_descriptor_tmp_125;
      handler[4] = a1;
      dispatch_source_set_event_handler(v6, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 104));
      _mdns_resolver_start_probe_querier(a1);
    }
    if (!*(_BYTE *)(a1 + 139))
    {
      *(_BYTE *)(a1 + 139) = 1;
      _mdns_resolver_generate_connection_event(a1);
    }
    return;
  }
  while ((*(char *)(v2 + 106) - 1) > 3 || *(_BYTE *)(v2 + 110) || *(_DWORD *)(v2 + 96) >= 3u)
  {
    v2 = *(_QWORD *)(v2 + 24);
    if (!v2)
      goto LABEL_8;
  }
}

void ___mdns_resolver_check_for_problematic_servers_block_invoke(uint64_t a1)
{
  _mdns_resolver_start_probe_querier(*(_QWORD *)(a1 + 32));
}

void _mdns_resolver_start_probe_querier(uint64_t a1)
{
  uint64_t v2;
  _QWORD *querier;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 112);
  if (v2)
  {
    mdns_client_invalidate(v2);
    os_release(*(void **)(a1 + 112));
    *(_QWORD *)(a1 + 112) = 0;
  }
  querier = mdns_resolver_create_querier((void *)a1, 0);
  *(_QWORD *)(a1 + 112) = querier;
  if (querier)
  {
    v10 = *(_DWORD *)(a1 + 120) + 1;
    *(_DWORD *)(a1 + 120) = v10;
    mdns_querier_set_log_label((uint64_t)querier, "PQ%u", v4, v5, v6, v7, v8, v9, v10);
    v11 = *(_QWORD *)(a1 + 112);
    if (_mdns_resolver_queue_s_once != -1)
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
    mdns_client_set_queue(v11, (dispatch_object_t)_mdns_resolver_queue_s_queue);
    mdns_querier_set_query(*(_QWORD *)(a1 + 112), "\x05apple\x03com", 2, 1);
    mdns_client_activate(*(_QWORD *)(a1 + 112));
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v12 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22983F000, v12, OS_LOG_TYPE_ERROR, "Failed to create probe querier", buf, 2u);
    }
  }
}

void _mdns_resolver_generate_connection_event(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "cannot_connect", *(_BYTE *)(a1 + 139));
  _mdns_resolver_generate_event((NSObject **)a1, 2, v2);
  if (v2)
    xpc_release(v2);
}

void _mdns_resolver_generate_event(NSObject **object, int a2, void *a3)
{
  NSObject *v6;
  _QWORD block[6];
  int v8;

  if (!*((_BYTE *)object + 136))
  {
    if (object[10])
    {
      os_retain(object);
      xpc_retain(a3);
      v6 = object[9];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___mdns_resolver_generate_event_block_invoke;
      block[3] = &__block_descriptor_tmp_108_1251;
      v8 = a2;
      block[4] = object;
      block[5] = a3;
      dispatch_async(v6, block);
    }
  }
}

void ___mdns_resolver_generate_event_block_invoke(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
  os_release(*(void **)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  if (v2)
    xpc_release(v2);
}

_QWORD *mdns_resolver_create_querier(void *a1, int *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _UNKNOWN **v6;
  void (*v7)(_QWORD *);
  uint64_t v8;
  BOOL v9;
  int v10;

  v4 = (_QWORD *)_os_object_alloc();
  v5 = v4;
  if (v4)
  {
    v6 = &_mdns_querier_kind;
    v4[2] = &_mdns_querier_kind;
    do
    {
      v7 = (void (*)(_QWORD *))v6[2];
      if (v7)
        v7(v5);
      v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    *((_DWORD *)v5 + 52) = 0;
    v5[8] = a1;
    os_retain(a1);
    v8 = mdns_query_message_create();
    v5[11] = v8;
    v9 = v8 == 0;
    if (v8)
      v4 = 0;
    else
      v4 = v5;
    if (v9)
    {
      v5 = 0;
      v10 = -6729;
    }
    else
    {
      v10 = 0;
    }
    if (a2)
      goto LABEL_13;
  }
  else
  {
    v10 = -6728;
    if (a2)
LABEL_13:
      *a2 = v10;
  }
  if (v4)
    os_release(v4);
  return v5;
}

uint64_t mdns_querier_set_log_label(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  void *v11;
  uint64_t v12;
  char *v14;
  char *v15[2];

  if (*(_BYTE *)(a1 + 49))
    return 4294960577;
  v15[0] = 0;
  v15[1] = &a9;
  vasprintf(v15, a2, &a9);
  if (!v15[0])
    return 4294960568;
  v14 = 0;
  asprintf(&v14, "[%s] ", v15[0]);
  v10 = v14;
  if (v14)
  {
    v11 = *(void **)(a1 + 128);
    if (v11)
    {
      free(v11);
      v10 = v14;
    }
    v12 = 0;
    *(_QWORD *)(a1 + 128) = v10;
    v14 = 0;
  }
  else
  {
    v12 = 4294960568;
  }
  if (v15[0])
    free(v15[0]);
  return v12;
}

uint64_t mdns_querier_set_query(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  unsigned int v9;

  v9 = 0;
  v7 = mdns_domain_name_create_with_labels(a2, (int *)&v9);
  if (!v9 && !*(_BYTE *)(a1 + 49))
    (*(void (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 16) + 56))(a1, v7, a3, a4);
  if (v7)
    os_release(v7);
  return v9;
}

void *_mdns_querier_copy_description(_QWORD *a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v9;
  int v10;
  const char *v11;

  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
    goto LABEL_18;
  if (mdns_string_builder_append_description(v7, *(_QWORD *)(a1[11] + 56), a3))
    goto LABEL_18;
  if (DNSRecordTypeValueToString(*(unsigned __int16 *)(a1[11] + 64))
     ? mdns_string_builder_append_formatted(v7, " %s")
     : mdns_string_builder_append_formatted(v7, " TYPE%u"))
  {
    goto LABEL_18;
  }
  v10 = *(unsigned __int16 *)(a1[11] + 66);
  v11 = "ANY";
  if (v10 != 255)
    v11 = 0;
  if (v10 == 1)
    v11 = "IN";
  if (v11
     ? mdns_string_builder_append_formatted(v7, " %s")
     : mdns_string_builder_append_formatted(v7, " CLASS%u"))
  {
LABEL_18:
    v9 = 0;
  }
  else
  {
    v9 = mdns_string_builder_copy_string((uint64_t)v7);
  }
  os_release(v7);
  return v9;
}

void _mdns_querier_finalize(_QWORD *a1)
{
  void *v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  a1[9] = 0;
  v2 = (void *)a1[8];
  if (v2)
  {
    os_release(v2);
    a1[8] = 0;
  }
  v3 = (const void *)a1[10];
  if (v3)
  {
    _Block_release(v3);
    a1[10] = 0;
  }
  v4 = (void *)a1[11];
  if (v4)
  {
    os_release(v4);
    a1[11] = 0;
  }
  v5 = (void *)a1[16];
  if (v5)
  {
    free(v5);
    a1[16] = 0;
  }
  v6 = (void *)a1[17];
  if (v6)
  {
    os_release(v6);
    a1[17] = 0;
  }
  v7 = (void *)a1[20];
  if (v7)
  {
    os_release(v7);
    a1[20] = 0;
  }
  v8 = (void *)a1[24];
  if (v8)
  {
    os_release(v8);
    a1[24] = 0;
  }
  _mdns_querier_clear_delegation((uint64_t)a1);
}

uint64_t _mdns_querier_get_internal_queue()
{
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  return _mdns_resolver_queue_s_queue;
}

void _mdns_querier_set_query(uint64_t a1, void *a2, __int16 a3, __int16 a4)
{
  uint64_t v7;

  mdns_query_message_set_qname(*(_QWORD *)(a1 + 88), a2);
  v7 = *(_QWORD *)(a1 + 88);
  if ((*(_BYTE *)(v7 + 70) & 0x20) == 0)
  {
    *(_WORD *)(v7 + 64) = a3;
    *(_WORD *)(v7 + 66) = a4;
  }
}

void _mdns_querier_activate(_BYTE *object)
{
  unsigned int v2;
  uint32_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  int message_construct;
  uint64_t v15;
  const char *v16;
  signed int v17;
  NSObject *oneshot_timer;
  NSObject *v19;
  int v20;
  NSObject *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int128 handler;
  void (*v31)(uint64_t);
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!object[249])
  {
    object[249] = 1;
    if (!object[254])
    {
      os_retain(object);
      object[254] = 1;
    }
    if (*(_BYTE *)(*(_QWORD *)(*((_QWORD *)object + 8) + 16) + 160))
    {
      LOWORD(v2) = 0;
    }
    else
    {
      v3 = arc4random();
      v2 = v3 + v3 / 0xFFFF + 1;
    }
    v4 = *((_QWORD *)object + 11);
    v5 = *(_BYTE *)(v4 + 70);
    if ((v5 & 0x20) == 0)
    {
      *(_WORD *)(v4 + 68) = v2;
      *(_BYTE *)(v4 + 70) = v5 & 0xF7 | (8 * *(_BYTE *)(*(_QWORD *)(*((_QWORD *)object + 8) + 16) + 159));
      v4 = *((_QWORD *)object + 11);
      v5 = *(_BYTE *)(v4 + 70);
    }
    v6 = *((_QWORD *)object + 8);
    if ((v5 & 0x20) == 0)
    {
      *(_BYTE *)(v4 + 70) = v5 & 0xEF | (16 * ((*(_DWORD *)(*(_QWORD *)(v6 + 16) + 144) - 3) < 2));
      v6 = *((_QWORD *)object + 8);
    }
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 16) + 136);
    if (v7)
    {
      v8 = v7();
      if (v8)
      {
        v9 = *(unsigned __int8 *)(v8 + 1);
        if (v9 == 30)
        {
          v12 = *((_QWORD *)object + 11);
          if ((*(_BYTE *)(v12 + 70) & 0x20) == 0)
          {
            *(_WORD *)(v12 + 71) = 14338;
            *(_QWORD *)(v12 + 81) = 0;
            *(_QWORD *)(v12 + 73) = 0;
            v13 = *(_DWORD *)(v8 + 8);
            *(_DWORD *)(v12 + 76) = *(_DWORD *)(v8 + 11);
            *(_DWORD *)(v12 + 73) = v13;
          }
        }
        else if (v9 == 2)
        {
          v10 = *((_QWORD *)object + 11);
          if ((*(_BYTE *)(v10 + 70) & 0x20) == 0)
          {
            v11 = bswap32(*(_DWORD *)(v8 + 4));
            *(_WORD *)(v10 + 71) = 6145;
            *(_QWORD *)(v10 + 76) = 0;
            *(_QWORD *)(v10 + 81) = 0;
            *(_BYTE *)(v10 + 73) = HIBYTE(v11);
            *(_BYTE *)(v10 + 74) = BYTE2(v11);
            *(_BYTE *)(v10 + 75) = BYTE1(v11);
          }
        }
      }
    }
    message_construct = mdns_query_message_construct(*((_QWORD *)object + 11));
    if (message_construct)
    {
      _mdns_querier_conclude_with_error_async(object, message_construct);
      return;
    }
    if (object[249] == 1)
    {
      v15 = *((_QWORD *)object + 8);
      if (*(_BYTE *)(v15 + 136))
      {
        _mdns_querier_conclude_async(object);
        return;
      }
      if (*((_QWORD *)object + 16))
        v16 = (const char *)*((_QWORD *)object + 16);
      else
        v16 = "";
      v17 = *((_DWORD *)object + 59);
      if (v17)
      {
        if (v17 < 1)
        {
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v21 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            LODWORD(handler) = 136446210;
            *(_QWORD *)((char *)&handler + 4) = v16;
            _os_log_impl(&dword_22983F000, v21, OS_LOG_TYPE_INFO, "%{public}sPending querier will start when DNS traffic is observed", (uint8_t *)&handler, 0xCu);
          }
          goto LABEL_37;
        }
        oneshot_timer = _mdns_resolver_create_oneshot_timer(v17, 0);
        *((_QWORD *)object + 19) = oneshot_timer;
        if (oneshot_timer)
        {
          *(_QWORD *)&handler = MEMORY[0x24BDAC760];
          *((_QWORD *)&handler + 1) = 0x40000000;
          v31 = ___mdns_resolver_handle_new_querier_block_invoke;
          v32 = &__block_descriptor_tmp_135_1265;
          v33 = object;
          v34 = v15;
          dispatch_source_set_event_handler(oneshot_timer, &handler);
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v19 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            v20 = *((_DWORD *)object + 59);
            v26 = 136446466;
            v27 = v16;
            v28 = 1024;
            v29 = v20;
            _os_log_impl(&dword_22983F000, v19, OS_LOG_TYPE_INFO, "%{public}sPending querier will start after at most %d ms or when DNS traffic is observed", (uint8_t *)&v26, 0x12u);
          }
          dispatch_activate(*((dispatch_object_t *)object + 19));
LABEL_37:
          v22 = (_QWORD *)(v15 + 40);
          do
          {
            v23 = v22;
            v24 = *v22;
            v22 = (_QWORD *)(*v22 + 56);
          }
          while (v24);
          *v23 = object;
          os_retain(object);
          return;
        }
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v25 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LODWORD(handler) = 136446210;
          *(_QWORD *)((char *)&handler + 4) = v16;
          _os_log_error_impl(&dword_22983F000, v25, OS_LOG_TYPE_ERROR, "%{public}sFailed to create flexible start timer for querier, will start immediately", (uint8_t *)&handler, 0xCu);
        }
      }
      _mdns_resolver_start_querier(v15, object);
    }
  }
}

void _mdns_querier_invalidate(uint64_t a1)
{
  _mdns_querier_conclude_ex(a1, 3, 0, 0);
}

uint64_t _mdns_querier_get_name(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 88) + 56);
}

uint64_t _mdns_querier_get_type(uint64_t a1)
{
  return *(unsigned __int16 *)(*(_QWORD *)(a1 + 88) + 64);
}

uint64_t _mdns_querier_get_class(uint64_t a1)
{
  return *(unsigned __int16 *)(*(_QWORD *)(a1 + 88) + 66);
}

void _mdns_querier_conclude_ex(uint64_t a1, int a2, int a3, _QWORD *a4)
{
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int16 *v14;
  unint64_t v15;
  size_t v16;
  unint64_t v17;
  unsigned __int16 *v18;
  unint64_t v19;
  int64_t v20;
  char v21;
  size_t v22;
  const char *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  _UNKNOWN **v28;
  void (*v29)(uint64_t);
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  unsigned __int16 v40;
  CFStringRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  xpc_object_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  NSObject *v55;
  NSObject *v56;
  _BYTE *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  int v66;
  int v67;
  const char *v68;
  const char *v69;
  NSObject *v70;
  uint64_t v71;
  const char *v72;
  _QWORD block[6];
  char v74;
  int v75;
  size_t size;
  _BYTE buf[12];
  __int16 v78;
  _BYTE v79[14];
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v8 = *(NSObject **)(a1 + 96);
  if (v8)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v8);
    *(_QWORD *)(a1 + 96) = 0;
  }
  v9 = *(NSObject **)(a1 + 120);
  if (v9)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 120));
    dispatch_release(v9);
    *(_QWORD *)(a1 + 120) = 0;
  }
  v10 = *(NSObject **)(a1 + 152);
  if (v10)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 152));
    dispatch_release(v10);
    *(_QWORD *)(a1 + 152) = 0;
  }
  v11 = *(void **)(a1 + 144);
  if (v11)
  {
    os_release(v11);
    *(_QWORD *)(a1 + 144) = 0;
  }
  _mdns_resolver_deregister_querier(*(_QWORD *)(a1 + 64), a1);
  if (*(_BYTE *)(a1 + 249) != 3)
  {
    *(_BYTE *)(a1 + 249) = 3;
    switch(a2)
    {
      case 1:
        if (a4)
          os_retain(a4);
        v12 = *(void **)(a1 + 136);
        if (v12)
          os_release(v12);
        *(_QWORD *)(a1 + 136) = a4;
        v13 = *(void **)(a1 + 160);
        if (v13)
        {
          os_release(v13);
          *(_QWORD *)(a1 + 160) = 0;
          a4 = *(_QWORD **)(a1 + 136);
        }
        v14 = (unsigned __int16 *)a4[4];
        v15 = a4[5];
        size = 0;
        *(_QWORD *)buf = 0;
        if (!DNSMessageGetOptRecord(v14, v15, (char **)buf, &size) && *(_QWORD *)buf && size >= 0xB)
        {
          v16 = *(_QWORD *)buf + size;
          v17 = *(_QWORD *)buf + 11;
          while (v16 > v17)
          {
            if (v16 - v17 < 4)
              break;
            v18 = (unsigned __int16 *)v17;
            v19 = v17 + 4;
            v20 = __rev16(v18[1]);
            if ((uint64_t)(v16 - v19) < v20)
              break;
            v17 = v19 + v20;
            if (__rev16(*v18) == 15)
            {
              if (v20 <= 1)
                break;
              v21 = v17 - ((_BYTE)v18 + 6);
              v22 = (unsigned __int16)(v17 - ((_WORD)v18 + 6));
              if ((_WORD)v17 == (_WORD)v18 + 6)
                v23 = 0;
              else
                v23 = (const char *)(v18 + 3);
              v24 = v18[2];
              v25 = _os_object_alloc();
              v26 = v25;
              if (!v25)
                goto LABEL_78;
              v27 = bswap32(v24) >> 16;
              v28 = &_mdns_extended_dns_error_kind;
              *(_QWORD *)(v25 + 16) = &_mdns_extended_dns_error_kind;
              do
              {
                v29 = (void (*)(uint64_t))v28[2];
                if (v29)
                  v29(v26);
                v28 = (_UNKNOWN **)*v28;
              }
              while (v28);
              if (v22)
              {
                v30 = *(_QWORD *)(v26 + 24);
              }
              else
              {
                if (_mdns_copy_empty_string_s_once != -1)
                  dispatch_once(&_mdns_copy_empty_string_s_once, &__block_literal_global_657);
                if (_mdns_copy_empty_string_s_empty_string)
                {
                  xpc_retain((xpc_object_t)_mdns_copy_empty_string_s_empty_string);
                  v30 = _mdns_copy_empty_string_s_empty_string;
                }
                else
                {
                  v30 = 0;
                }
                *(_QWORD *)(v26 + 24) = v30;
              }
              if (v30
                || (v40 = strnlen(v23, v22),
                    (v41 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v23, v40, 0x8000100u, 0)) != 0)&& (CFRelease(v41), v50 = mdns_xpc_string_create_with_format(v42, v43, v44, v45, v46, v47, v48, v49, v21), (*(_QWORD *)(v26 + 24) = v50) != 0))
              {
                *(_WORD *)(v26 + 32) = v27;
                goto LABEL_78;
              }
              os_release((void *)v26);
              break;
            }
          }
        }
        v26 = 0;
LABEL_78:
        *(_QWORD *)(a1 + 160) = v26;
        LODWORD(v51) = *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + 133);
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 64) + 133))
          goto LABEL_104;
        v51 = *(_QWORD *)(a1 + 136);
        if (!v51)
          goto LABEL_104;
        v52 = *(_QWORD *)(v51 + 32);
        if (!v52)
          goto LABEL_93;
        v75 = 0;
        size = 0;
        v53 = DNSMessageCollapse(v52, *(_QWORD *)(v51 + 40), &size, (uint64_t *)&v75);
        if (!v53)
          goto LABEL_90;
        v54 = v53;
        v55 = dispatch_data_create(v53, size, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
        if (v55)
        {
          v56 = v55;
          v57 = mdns_message_create_with_dispatch_data(v55);
          dispatch_release(v56);
          if (v57)
          {
            os_retain(v57);
            v58 = *(void **)(a1 + 136);
            if (v58)
              os_release(v58);
            *(_QWORD *)(a1 + 136) = v57;
            os_release(v57);
            v59 = *(_QWORD *)(a1 + 136);
            if (v59)
            {
              v60 = *(_QWORD *)(v59 + 32);
              v61 = *(_QWORD *)(v59 + 40);
            }
            else
            {
              v60 = 0;
              v61 = 0;
            }
            if (_mdns_resolver_log_s_once != -1)
              dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
            v63 = _mdns_resolver_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
            {
              v64 = "";
              v65 = *(_QWORD *)(a1 + 136);
              if (*(_QWORD *)(a1 + 128))
                v64 = *(const char **)(a1 + 128);
              v66 = 12;
              *(_DWORD *)buf = 136446978;
              if (v61 < 0xC)
                v66 = v61;
              *(_QWORD *)&buf[4] = v64;
              v78 = 1040;
              *(_DWORD *)v79 = v66;
              *(_WORD *)&v79[4] = 2098;
              *(_QWORD *)&v79[6] = v60;
              v80 = 2112;
              v81 = v65;
              _os_log_impl(&dword_22983F000, v63, OS_LOG_TYPE_DEFAULT, "%{public}sUsing squashed response -- %{public,mdns:dnshdr}.*P, %@", buf, 0x26u);
            }
            LODWORD(v51) = 1;
            goto LABEL_104;
          }
        }
        else
        {
          free(v54);
        }
        v75 = -6729;
LABEL_90:
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v62 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v72 = *(const char **)(a1 + 128);
          if (!v72)
            v72 = "";
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v72;
          v78 = 2048;
          *(_QWORD *)v79 = v75;
          _os_log_error_impl(&dword_22983F000, v62, OS_LOG_TYPE_ERROR, "%{public}sFailed to squash response -- error:%{mdns:err}ld", buf, 0x16u);
        }
LABEL_93:
        LODWORD(v51) = 0;
LABEL_104:
        if (a3 == 1)
          v67 = 1;
        else
          v67 = v51;
        *(_BYTE *)(a1 + 253) = v67;
        if (v67 == 1)
        {
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v31 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            v68 = *(const char **)(a1 + 128);
            if (!v68)
              v68 = "";
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v68;
            v33 = "%{public}sQuerier concluded -- reason: response (fabricated)";
            goto LABEL_120;
          }
        }
        else
        {
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v31 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
          {
            v69 = *(const char **)(a1 + 128);
            if (!v69)
              v69 = "";
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v69;
            v33 = "%{public}sQuerier concluded -- reason: response";
            goto LABEL_120;
          }
        }
LABEL_121:
        v70 = *(NSObject **)(a1 + 24);
        if (v70)
        {
          v71 = *(_QWORD *)(a1 + 80);
          *(_QWORD *)(a1 + 80) = 0;
          os_retain((void *)a1);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = ___mdns_querier_conclude_ex_block_invoke;
          block[3] = &unk_24F286EC8;
          v74 = a2;
          block[4] = v71;
          block[5] = a1;
          dispatch_async(v70, block);
        }
        if (*(_BYTE *)(a1 + 254))
        {
          *(_BYTE *)(a1 + 254) = 0;
          os_release((void *)a1);
        }
        return;
      case 2:
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          v32 = *(const char **)(a1 + 128);
          if (!v32)
            v32 = "";
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v32;
          v33 = "%{public}sQuerier concluded -- reason: timeout";
          goto LABEL_120;
        }
        goto LABEL_121;
      case 3:
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          v34 = *(const char **)(a1 + 128);
          if (!v34)
            v34 = "";
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v34;
          v33 = "%{public}sQuerier concluded -- reason: invalidation";
          goto LABEL_120;
        }
        goto LABEL_121;
      case 4:
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          v35 = *(const char **)(a1 + 128);
          if (!v35)
            v35 = "";
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v35;
          v33 = "%{public}sQuerier concluded -- reason: resolver invalidation";
          goto LABEL_120;
        }
        goto LABEL_121;
      case 5:
        *(_DWORD *)(a1 + 240) = a3;
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v36 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v37 = *(const char **)(a1 + 128);
          if (!v37)
            v37 = "";
          v38 = *(int *)(a1 + 240);
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v37;
          v78 = 2048;
          *(_QWORD *)v79 = v38;
          _os_log_error_impl(&dword_22983F000, v36, OS_LOG_TYPE_ERROR, "%{public}sQuerier concluded -- error: %{mdns:err}ld", buf, 0x16u);
        }
        goto LABEL_121;
      case 6:
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v31 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          v39 = *(const char **)(a1 + 128);
          if (!v39)
            v39 = "";
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v39;
          v33 = "%{public}sQuerier concluded -- reason: connection problem";
LABEL_120:
          _os_log_impl(&dword_22983F000, v31, OS_LOG_TYPE_INFO, v33, buf, 0xCu);
        }
        goto LABEL_121;
      default:
        goto LABEL_121;
    }
  }
}

void _mdns_resolver_deregister_querier(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  BOOL v11;

  v4 = *(NSObject **)(a2 + 96);
  if (v4)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a2 + 96));
    dispatch_release(v4);
    *(_QWORD *)(a2 + 96) = 0;
  }
  _mdns_forget_session_list((uint64_t *)(a2 + 104));
  _mdns_forget_session_list((uint64_t *)(a2 + 112));
  v5 = (_QWORD *)(a1 + 32);
  do
  {
    v6 = v5;
    v7 = *v5;
    v5 = (_QWORD *)(*v5 + 56);
    if (v7)
      v8 = v7 == a2;
    else
      v8 = 1;
  }
  while (!v8);
  if (v7)
    goto LABEL_17;
  v9 = (_QWORD *)(a1 + 40);
  do
  {
    v6 = v9;
    v10 = *v9;
    v9 = (_QWORD *)(*v9 + 56);
    if (v10)
      v11 = v10 == a2;
    else
      v11 = 1;
  }
  while (!v11);
  if (v10)
  {
LABEL_17:
    *v6 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a2 + 56) = 0;
    os_release((void *)a2);
  }
}

void ___mdns_querier_conclude_ex_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 248) = *(_BYTE *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(const void **)(a1 + 32);
    if (v3)
      _Block_release(v3);
  }
  os_release(*(void **)(a1 + 40));
}

void _mdns_forget_session_list(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    do
    {
      v2 = *(_QWORD *)(v1 + 24);
      *(_QWORD *)(v1 + 24) = 0;
      _mdns_session_invalidate((_BYTE *)v1);
      os_release((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
}

void _mdns_session_invalidate(_BYTE *a1)
{
  _QWORD block[5];

  a1[88] = 3;
  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___mdns_session_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_45_1264;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void ___mdns_session_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(_QWORD);

  _mdns_session_invalidate_internal(*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(_QWORD))(*(_QWORD *)(v2 + 72) + 16);
  if (v3)
  {
    v3(*(_QWORD *)(v2 + 48));
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 48) = 0;
  os_release(*(void **)(a1 + 32));
}

void _mdns_session_invalidate_internal(uint64_t a1)
{
  NSObject *v2;
  void (*v3)(uint64_t);

  v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    dispatch_release(v2);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v3 = *(void (**)(uint64_t))(*(_QWORD *)(a1 + 16) + 72);
  if (v3)
    v3(a1);
}

void _mdns_querier_conclude_async(void *a1)
{
  _QWORD v2[5];
  char v3;

  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 0x40000000;
  v2[2] = ___mdns_querier_conclude_async_block_invoke;
  v2[3] = &__block_descriptor_tmp_136_1359;
  v2[4] = a1;
  v3 = 4;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v2);
}

NSObject *_mdns_resolver_create_oneshot_timer(unsigned int a1, unsigned int a2)
{
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  return mdns_dispatch_create_oneshot_monotonic_timer(a1, a2, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
}

void ___mdns_resolver_handle_new_querier_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 152);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 152));
    dispatch_release(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = (_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  do
  {
    v5 = v4;
    v6 = *v4;
    v4 = (_QWORD *)(*v4 + 56);
    if (v6)
      v7 = v6 == v2;
    else
      v7 = 1;
  }
  while (!v7);
  if (v6)
  {
    *v5 = *(_QWORD *)(v2 + 56);
    *(_QWORD *)(v2 + 56) = 0;
    os_release((void *)v2);
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v8 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
    {
      v9 = *(const char **)(*(_QWORD *)(a1 + 32) + 128);
      if (!v9)
        v9 = "";
      v10 = 136446210;
      v11 = v9;
      _os_log_impl(&dword_22983F000, v8, OS_LOG_TYPE_INFO, "%{public}sStarting pending querier because leeway elapsed", (uint8_t *)&v10, 0xCu);
    }
    _mdns_resolver_start_querier(*(_QWORD *)(a1 + 40), *(_BYTE **)(a1 + 32));
  }
}

void _mdns_resolver_start_querier(uint64_t a1, _BYTE *object)
{
  unsigned int v4;
  int v5;

  if (object[249] == 1)
  {
    object[249] = 2;
    v4 = *((_DWORD *)object + 56);
    if (v4 && (v5 = _mdns_querier_reset_time_limit((uint64_t)object, v4)) != 0)
      _mdns_querier_conclude_with_error_async(object, v5);
    else
      _mdns_resolver_register_querier_ex(a1, object, 0);
  }
}

void _mdns_querier_conclude_with_error_async(void *a1, int a2)
{
  _QWORD v4[5];
  int v5;

  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_querier_conclude_with_error_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_66_1269;
  v4[4] = a1;
  v5 = a2;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v4);
}

void ___mdns_querier_conclude_with_error_async_block_invoke(uint64_t a1)
{
  _mdns_querier_conclude_ex(*(_QWORD *)(a1 + 32), 5, *(_DWORD *)(a1 + 40), 0);
  os_release(*(void **)(a1 + 32));
}

uint64_t _mdns_querier_reset_time_limit(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  NSObject *oneshot_timer;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 249) != 2)
    return 0;
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v4 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    v5 = *(const char **)(a1 + 128);
    if (!v5)
      v5 = "";
    *(_DWORD *)buf = 136446466;
    v11 = v5;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_22983F000, v4, OS_LOG_TYPE_INFO, "%{public}sResetting time limit to %u ms", buf, 0x12u);
  }
  v6 = *(NSObject **)(a1 + 120);
  if (v6)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 120));
    dispatch_release(v6);
    *(_QWORD *)(a1 + 120) = 0;
  }
  if (!a2)
    return 0;
  oneshot_timer = _mdns_resolver_create_oneshot_timer(a2, 5u);
  *(_QWORD *)(a1 + 120) = oneshot_timer;
  if (oneshot_timer)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = ___mdns_querier_reset_time_limit_block_invoke;
    handler[3] = &__block_descriptor_tmp_116_1357;
    handler[4] = a1;
    dispatch_source_set_event_handler(oneshot_timer, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 120));
    return 0;
  }
  return 4294960567;
}

uint64_t _mdns_resolver_register_querier_ex(uint64_t a1, _WORD *object, int a3)
{
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  int v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v5 + 158))
    v6 = 0;
  else
    v6 = a3 == 0;
  if (v6)
  {
    if (*(_BYTE *)(v5 + 161) && *(_BYTE *)(a1 + 134))
    {
      v8 = *(_QWORD *)(a1 + 88) - mach_continuous_time();
      if ((v8 & 0x8000000000000000) == 0)
      {
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v9 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
        {
          if (mdns_mach_ticks_per_second_s_once != -1)
            dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
          v15 = 134218240;
          v16 = v8 / mdns_mach_ticks_per_second_s_ticks_per_second;
          v17 = 2048;
          v18 = 1000
              * (v8 % mdns_mach_ticks_per_second_s_ticks_per_second)
              / mdns_mach_ticks_per_second_s_ticks_per_second;
          _os_log_impl(&dword_22983F000, v9, OS_LOG_TYPE_INFO, "Suspicious mode (%lld.%03lld seconds left): forcing query over bytestream", (uint8_t *)&v15, 0x16u);
        }
        object[125] = 259;
        goto LABEL_6;
      }
      *(_BYTE *)(a1 + 134) = 0;
    }
    v7 = 0;
    *((_BYTE *)object + 251) = 0;
    *((_QWORD *)object + 27) = 0;
    *((_DWORD *)object + 53) = 0;
    goto LABEL_20;
  }
  *((_BYTE *)object + 251) = 1;
LABEL_6:
  v7 = 0;
  *((_QWORD *)object + 27) = 0;
  *((_DWORD *)object + 53) = 0;
  if (!*(_BYTE *)(a1 + 138))
    v7 = *(_BYTE *)(*(_QWORD *)(a1 + 16) + 162) ^ 1;
LABEL_20:
  *((_BYTE *)object + 252) = v7;
  v10 = (_QWORD *)(a1 + 32);
  do
  {
    v11 = v10;
    v12 = *v10;
    v10 = (_QWORD *)(*v10 + 56);
  }
  while (v12);
  *v11 = object;
  os_retain(object);
  *((_QWORD *)object + 9) = 0;
  *((_BYTE *)object + 247) = 0;
  if (*((_BYTE *)object + 251))
    v13 = 2000;
  else
    v13 = *(_DWORD *)(*((_QWORD *)object + 8) + 124);
  *((_DWORD *)object + 51) = v13;
  return _mdns_querier_initiate_send(object);
}

void _mdns_querier_initiate_send(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  __objc2_prop_list **p_inst_props;
  uint64_t eligible_server;
  uint64_t v7;
  int v8;
  int v9;
  __objc2_prop_list *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  size_t v15;
  __objc2_prop_list *v16;
  NSObject *v17;
  NSObject *v18;
  _BYTE *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  const char *v23;
  NSObject *oneshot_timer;
  _QWORD *v25;
  _QWORD *v26;
  NSObject *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  unsigned int v35;
  void *v36;
  const char *v37;
  const char *v38;
  int v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  _QWORD handler[5];
  int v44;
  _BYTE buf[24];
  void *v46;
  uint64_t v47;
  void *v48;
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(a1 + 96);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v2);
    *(_QWORD *)(a1 + 96) = 0;
  }
  v3 = (void *)*MEMORY[0x24BDAC980];
  v4 = *(_QWORD *)(a1 + 72);
  p_inst_props = &OBJC_PROTOCOL___OS_mdns_dso_message.inst_props;
  while (1)
  {
    if (v4)
      goto LABEL_8;
    if (*(_QWORD *)(a1 + 144) && !_mdns_resolver_get_server(*(_QWORD *)(a1 + 64), *(_DWORD *)(a1 + 228)))
      break;
    eligible_server = _mdns_querier_get_eligible_server(a1);
    _mdns_querier_set_current_server(a1, eligible_server);
    v4 = *(_QWORD *)(a1 + 72);
    if (!v4)
    {
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v33 = p_inst_props[478];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = *(const char **)(a1 + 128);
        if (!v34)
          v34 = "";
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v34;
        _os_log_debug_impl(&dword_22983F000, v33, OS_LOG_TYPE_DEBUG, "%{public}sNo more eligible servers", buf, 0xCu);
      }
      return;
    }
LABEL_8:
    v7 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(*(_QWORD *)(v7 + 16) + 144) == 1 || *(_DWORD *)(v7 + 128))
    {
      v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 16) + 88))(a1);
      if ((v8 & 0xFFFE) == 0x40)
      {
        v9 = v8;
        if (*(_BYTE *)(v4 + 112))
        {
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v10 = p_inst_props[478];
          if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
          {
            v11 = *(const char **)(a1 + 128);
            if (!v11)
              v11 = "";
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v4;
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v46) = v9;
            v12 = v10;
            v13 = "%{public}sNot sending query to server %@, which mixes up responses of type %{mdns:rrtype}d";
LABEL_18:
            _os_log_impl(&dword_22983F000, v12, OS_LOG_TYPE_INFO, v13, buf, 0x1Cu);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
        if (!*(_BYTE *)(v4 + 107))
        {
          v22 = *(_QWORD *)(v4 + 64);
          if (v22)
          {
            if (*(_DWORD *)(v22 + 8) >= *(_DWORD *)(v22 + 12))
            {
              if (_mdns_resolver_log_s_once != -1)
                dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
              v10 = p_inst_props[478];
              if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
              {
                v23 = *(const char **)(a1 + 128);
                if (!v23)
                  v23 = "";
                *(_DWORD *)buf = 136446722;
                *(_QWORD *)&buf[4] = v23;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v4;
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v46) = v9;
                v12 = v10;
                v13 = "%{public}sNot sending query to server %@, which ignores queries of type %{mdns:rrtype}d";
                goto LABEL_18;
              }
LABEL_19:
              if (!*(_QWORD *)(a1 + 144))
              {
                v14 = *(_QWORD *)(a1 + 88);
                v15 = *(_QWORD *)(v14 + 40);
                if (v15 < 0xD)
                {
                  v39 = -6762;
                }
                else
                {
                  v16 = (__objc2_prop_list *)malloc_type_malloc(*(_QWORD *)(v14 + 40), 0xA172743EuLL);
                  if (v16)
                  {
                    v10 = v16;
                    memcpy(v16, *(const void **)(v14 + 32), v15);
                    HIWORD(v10->entrysize) = -31615;
                    v17 = dispatch_data_create(v10, v15, 0, v3);
                    if (!v17)
                      goto LABEL_90;
                    v18 = v17;
                    v19 = mdns_message_create_with_dispatch_data(v17);
                    dispatch_release(v18);
                    *(_QWORD *)(a1 + 144) = v19;
                    if (!v19)
                    {
                      v39 = -6729;
LABEL_92:
                      v40 = (void *)a1;
LABEL_93:
                      _mdns_querier_conclude_with_error_async(v40, v39);
                      return;
                    }
                    *(_WORD *)(a1 + 244) = -4;
                    p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___OS_mdns_dso_message + 56);
                    goto LABEL_25;
                  }
                  __break(1u);
LABEL_90:
                  free(v10);
                  v39 = -6729;
                }
                *(_QWORD *)(a1 + 144) = 0;
                goto LABEL_92;
              }
LABEL_25:
              v20 = 0;
              if ((*(_DWORD *)(v4 + 100) - 1) >= 0x20)
                v21 = 0;
              else
                v21 = 1 << (*(_BYTE *)(v4 + 100) - 1);
              *(_DWORD *)(a1 + 228) |= v21;
              *(_QWORD *)(a1 + 72) = 0;
              *(_BYTE *)(a1 + 247) = 0;
              goto LABEL_31;
            }
          }
        }
      }
    }
    v20 = *(_QWORD *)(a1 + 72);
LABEL_31:
    v4 = 0;
    if (v20)
    {
      oneshot_timer = _mdns_resolver_create_oneshot_timer(*(_DWORD *)(a1 + 204), 5u);
      *(_QWORD *)(a1 + 96) = oneshot_timer;
      if (!oneshot_timer)
      {
        v40 = (void *)a1;
        v39 = -6729;
        goto LABEL_93;
      }
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_querier_initiate_send_block_invoke;
      handler[3] = &__block_descriptor_tmp_64;
      handler[4] = a1;
      dispatch_source_set_event_handler(oneshot_timer, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 96));
      v25 = *(_QWORD **)(a1 + 72);
      if (*(_BYTE *)(a1 + 252))
      {
        if (!v25)
          return;
        v26 = (_QWORD *)v25[4];
        if (v26)
          goto LABEL_68;
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v27 = p_inst_props[478];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v38 = *(const char **)(a1 + 128);
          if (!v38)
            v38 = "";
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          _os_log_debug_impl(&dword_22983F000, v27, OS_LOG_TYPE_DEBUG, "%{public}sCreating shared session to %@", buf, 0x16u);
        }
        v44 = 0;
        v26 = _mdns_resolver_create_session(*(_QWORD *)(a1 + 64), v25, 1, 0, 0, &v44);
        if (v26)
        {
          os_retain(*(void **)(a1 + 64));
          if (!*((_BYTE *)v26 + 88))
          {
            v26[6] = *(_QWORD *)(a1 + 64);
            v26[9] = _mdns_querier_get_shared_session_s_resolver_callbacks;
            *((_DWORD *)v26 + 20) = 10000;
          }
          _mdns_session_activate((uint64_t)v26);
          v25[4] = v26;
LABEL_68:
          if ((*(_DWORD *)(v26[4] + 100) - 1) >= 0x20)
            v32 = 0;
          else
            v32 = 1 << (*(_BYTE *)(v26[4] + 100) - 1);
          *(_DWORD *)(a1 + 212) |= v32;
          _mdns_querier_send_query(a1, (uint64_t)v26);
          return;
        }
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v41 = _mdns_resolver_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
          goto LABEL_102;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v44;
        v42 = "Failed to create session to %@ for resolver: %{mdns:err}ld";
      }
      else
      {
        if (!v25)
          return;
        v28 = 112;
        if (*(_BYTE *)(a1 + 251))
        {
          v29 = (_QWORD *)(a1 + 112);
        }
        else
        {
          v28 = 104;
          v29 = (_QWORD *)(a1 + 104);
        }
        v30 = *(_QWORD *)(a1 + v28);
        if (v30)
        {
          while (1)
          {
            v26 = (_QWORD *)v30;
            if (*(_QWORD **)(v30 + 32) == v25)
              goto LABEL_68;
            v30 = *(_QWORD *)(v30 + 24);
            if (!v30)
            {
              v29 = v26 + 3;
              break;
            }
          }
        }
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v31 = p_inst_props[478];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v37 = *(const char **)(a1 + 128);
          if (!v37)
            v37 = "";
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          _os_log_debug_impl(&dword_22983F000, v31, OS_LOG_TYPE_DEBUG, "%{public}sCreating session to %@", buf, 0x16u);
        }
        v44 = 0;
        v26 = _mdns_resolver_create_session(*(_QWORD *)(a1 + 64), v25, *(unsigned __int8 *)(a1 + 251), a1 + 168, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 56) + 24), &v44);
        if (v26)
        {
          os_retain((void *)a1);
          if (!*((_BYTE *)v26 + 88))
          {
            v26[6] = a1;
            v26[9] = _mdns_querier_get_unshared_session_s_querier_callbacks;
            if (*(_BYTE *)(a1 + 251))
              *((_DWORD *)v26 + 20) = 10000;
          }
          _mdns_session_activate((uint64_t)v26);
          *v29 = v26;
          goto LABEL_68;
        }
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v41 = _mdns_resolver_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
LABEL_102:
          _mdns_resolver_penalize_server_ex(*(_QWORD *)(a1 + 64), (uint64_t)v25, 0, 0, 0);
          *(_QWORD *)(a1 + 72) = 0;
          *(_BYTE *)(a1 + 247) = 0;
          return;
        }
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v44;
        v42 = "Failed to create session to %@ for querier: %{mdns:err}ld";
      }
      _os_log_error_impl(&dword_22983F000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0x16u);
      goto LABEL_102;
    }
  }
  v35 = *(unsigned __int16 *)(a1 + 244);
  v36 = *(void **)(a1 + 144);
  os_retain((void *)a1);
  os_retain(v36);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 0x40000000;
  *(_QWORD *)&buf[16] = ___mdns_querier_conclude_with_response_async_block_invoke;
  v46 = &__block_descriptor_tmp_65_1271;
  v49 = v35 >> 15;
  v47 = a1;
  v48 = v36;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, buf);
}

uint64_t _mdns_resolver_get_server(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t *v3;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)(a1 + 24);
  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    if (*(_DWORD *)(result + 100) != 1
      || *(_BYTE *)(result + 108)
      || ((*(char *)(result + 106) - 1) <= 3 ? (v5 = (a2 & 1) == 0) : (v5 = 0), !v5))
    {
      v6 = mach_continuous_time();
      v7 = *v3;
      if (*v3)
      {
        v8 = v6;
        v9 = v3;
        do
        {
          if (*(_BYTE *)(v7 + 108) && (v10 = v8 - *(_QWORD *)(v7 + 72), v10 >= 0))
          {
            *v9 = *(_QWORD *)(v7 + 24);
            *(_QWORD *)(v7 + 24) = 0;
            *(_BYTE *)(v7 + 108) = 0;
            v11 = *v3;
            if (*v3 && !*(_BYTE *)(v11 + 108))
            {
              v14 = *(_DWORD *)(v7 + 100);
              v12 = v3;
              if (*(_DWORD *)(v11 + 100) <= v14)
              {
                do
                {
                  v15 = v11;
                  v11 = *(_QWORD *)(v11 + 24);
                }
                while (v11 && !*(_BYTE *)(v11 + 108) && *(_DWORD *)(v11 + 100) <= v14);
                v12 = (uint64_t *)(v15 + 24);
              }
            }
            else
            {
              v12 = v3;
            }
            *(_QWORD *)(v7 + 24) = v11;
            *v12 = v7;
            if (_mdns_resolver_log_s_once != -1)
              dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
            v13 = _mdns_resolver_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
            {
              if (mdns_mach_ticks_per_second_s_once != -1)
                dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
              *(_DWORD *)buf = 138412802;
              v18 = v7;
              v19 = 2048;
              v20 = v10 / (unint64_t)mdns_mach_ticks_per_second_s_ticks_per_second;
              v21 = 2048;
              v22 = 1000
                  * (v10 % (unint64_t)mdns_mach_ticks_per_second_s_ticks_per_second)
                  / mdns_mach_ticks_per_second_s_ticks_per_second;
              _os_log_impl(&dword_22983F000, v13, OS_LOG_TYPE_INFO, "Unpenalizing server %@ (penalty expired %lld.%03lld seconds ago)", buf, 0x20u);
            }
          }
          else
          {
            v9 = (uint64_t *)(v7 + 24);
          }
          v7 = *v9;
        }
        while (*v9);
        for (result = *v3; result; result = *(_QWORD *)(result + 24))
        {
          if ((*(char *)(result + 106) - 1) <= 3)
          {
            v16 = (*(_DWORD *)(result + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(result + 100) - 1);
            if ((v16 & a2) == 0)
              break;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void ___mdns_querier_conclude_with_response_async_block_invoke(uint64_t a1)
{
  _mdns_querier_conclude_ex(*(_QWORD *)(a1 + 32), 1, *(unsigned __int8 *)(a1 + 48), *(_QWORD **)(a1 + 40));
  os_release(*(void **)(a1 + 32));
  os_release(*(void **)(a1 + 40));
}

uint64_t _mdns_querier_get_eligible_server(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 228);
  if (*(_BYTE *)(a1 + 251))
    v2 |= *(_DWORD *)(a1 + 216) | *(_DWORD *)(a1 + 220);
  result = _mdns_resolver_get_server(*(_QWORD *)(a1 + 64), v2);
  if (result)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 112);
    if (v4 && v4 != a1)
    {
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v6 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(const char **)(a1 + 128);
        if (!v7)
          v7 = "";
        v8 = 136446210;
        v9 = v7;
        _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_DEFAULT, "%{public}sBacking off while probe querier is active", (uint8_t *)&v8, 0xCu);
      }
      return 0;
    }
  }
  return result;
}

uint64_t _mdns_querier_set_current_server(uint64_t result, uint64_t a2)
{
  int v2;
  int v3;

  *(_QWORD *)(result + 72) = a2;
  *(_BYTE *)(result + 247) = 0;
  if (a2)
  {
    v2 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(a2 + 100) - 1);
    if ((v2 & *(_DWORD *)(result + 212)) == 0)
    {
      if (*(_BYTE *)(result + 251))
        v3 = 2000;
      else
        v3 = *(_DWORD *)(*(_QWORD *)(result + 64) + 124);
      *(_DWORD *)(result + 204) = v3;
    }
  }
  return result;
}

uint64_t ___mdns_querier_initiate_send_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  _BYTE *v8;
  int v9;
  _QWORD *v10;
  unsigned int v11;
  int v12;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 96);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 96));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
    v1 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(unsigned __int8 *)(v1 + 251);
  if (*(_BYTE *)(v1 + 251))
    v5 = 900000;
  else
    v5 = 30000;
  v6 = *(_DWORD *)(v1 + 204);
  if (v6 <= v5 >> 1)
    v5 = 2 * v6;
  *(_DWORD *)(v1 + 204) = v5;
  v7 = *(_QWORD *)(v1 + 72);
  if (v7)
  {
    if (v4)
    {
      _mdns_resolver_penalize_server_ex(*(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), 0, 0, 0);
      *(_QWORD *)(v1 + 72) = 0;
      v8 = (_BYTE *)(v1 + 247);
LABEL_22:
      *v8 = 0;
      return _mdns_querier_initiate_send(v1);
    }
    v8 = (_BYTE *)(v1 + 247);
    v9 = *(unsigned __int8 *)(v1 + 247);
    if (v9 == 255 || (*v8 = v9 + 1, v9))
    {
      v10 = *(_QWORD **)(v1 + 104);
      if (v10)
      {
        while (v10[4] != v7)
        {
          v10 = (_QWORD *)v10[3];
          if (!v10)
            goto LABEL_21;
        }
        _mdns_resolver_penalize_server_ex(*(_QWORD *)(v1 + 64), v7, 1, v1, v10[8]);
        v11 = *(_DWORD *)(v7 + 100) - 1;
        if (v11 < 0x20)
          v12 = ~(1 << v11);
        else
          v12 = -1;
        *(_DWORD *)(v1 + 200) &= v12;
      }
LABEL_21:
      *(_QWORD *)(v1 + 72) = 0;
      goto LABEL_22;
    }
  }
  return _mdns_querier_initiate_send(v1);
}

_QWORD *_mdns_resolver_create_session(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6)
{
  int v12;
  _QWORD *v13;
  _QWORD *v14;
  _UNKNOWN **v15;
  void (*v16)(_QWORD *);
  _UNKNOWN **v17;
  void (*v18)(_QWORD *);
  int v19;
  _UNKNOWN **v20;
  void (*v21)(_QWORD *);
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t);
  int v24;
  uint64_t (*v25)(_QWORD *);
  char v26;
  uint64_t (*v27)(_QWORD *);
  char v28;

  v12 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 144);
  if ((v12 - 2) < 2)
    goto LABEL_5;
  if (v12 == 4)
  {
    v13 = (_QWORD *)_os_object_alloc();
    v14 = v13;
    if (!v13)
      goto LABEL_38;
    v17 = &_mdns_url_session_kind;
    v13[2] = &_mdns_url_session_kind;
    do
    {
      v18 = (void (*)(_QWORD *))v17[2];
      if (v18)
        v18(v14);
      v17 = (_UNKNOWN **)*v17;
    }
    while (v17);
  }
  else
  {
    if (v12 != 1)
    {
      v13 = 0;
      v14 = 0;
      v19 = -6756;
      goto LABEL_33;
    }
    if ((_DWORD)a3)
    {
LABEL_5:
      v13 = (_QWORD *)_os_object_alloc();
      v14 = v13;
      if (v13)
      {
        v15 = &_mdns_connection_session_kind;
        v13[2] = &_mdns_connection_session_kind;
        do
        {
          v16 = (void (*)(_QWORD *))v15[2];
          if (v16)
            v16(v14);
          v15 = (_UNKNOWN **)*v15;
        }
        while (v15);
        goto LABEL_23;
      }
LABEL_38:
      v19 = -6728;
      goto LABEL_33;
    }
    v13 = (_QWORD *)_os_object_alloc();
    v14 = v13;
    if (!v13)
      goto LABEL_38;
    v20 = &_mdns_udp_socket_session_kind;
    v13[2] = &_mdns_udp_socket_session_kind;
    do
    {
      v21 = (void (*)(_QWORD *))v20[2];
      if (v21)
        v21(v14);
      v20 = (_UNKNOWN **)*v20;
    }
    while (v20);
  }
LABEL_23:
  v14[4] = a2;
  os_retain(a2);
  v22 = v14[2];
  v23 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
  if (v23)
  {
    v24 = v23(v14, a1, a3, a4, a5);
    if (v24)
    {
      v19 = v24;
      v13 = v14;
      v14 = 0;
      goto LABEL_33;
    }
    v22 = v14[2];
  }
  v25 = *(uint64_t (**)(_QWORD *))(v22 + 88);
  if (v25)
    v26 = v25(v14);
  else
    v26 = *(_BYTE *)(v22 + 104) != 0;
  *((_BYTE *)v14 + 89) = v26;
  v27 = *(uint64_t (**)(_QWORD *))(v22 + 96);
  if (v27)
    v28 = v27(v14);
  else
    v28 = *(_BYTE *)(v22 + 105) != 0;
  v13 = 0;
  v19 = 0;
  *((_BYTE *)v14 + 90) = v28;
LABEL_33:
  if (a6)
    *a6 = v19;
  if (v13)
    os_release(v13);
  return v14;
}

void _mdns_session_activate(uint64_t a1)
{
  unsigned int v2;
  NSObject *oneshot_timer;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  int v6;
  int v7;
  _QWORD handler[5];

  if (!*(_BYTE *)(a1 + 88))
  {
    v2 = *(_DWORD *)(a1 + 80);
    if (v2)
    {
      oneshot_timer = _mdns_resolver_create_oneshot_timer(v2, 5u);
      *(_QWORD *)(a1 + 40) = oneshot_timer;
      if (!oneshot_timer)
      {
        v7 = -6729;
        goto LABEL_13;
      }
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_session_activate_block_invoke;
      handler[3] = &__block_descriptor_tmp_117_1294;
      handler[4] = a1;
      dispatch_source_set_event_handler(oneshot_timer, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 40));
    }
    v4 = mach_continuous_time();
    *(_QWORD *)(a1 + 56) = v4;
    if (mdns_mach_ticks_per_second_s_once != -1)
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
    *(_QWORD *)(a1 + 64) = v4 - 3600 * mdns_mach_ticks_per_second_s_ticks_per_second;
    v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 16) + 64);
    if (!v5 || (v6 = v5(a1)) == 0)
    {
      *(_BYTE *)(a1 + 88) = 1;
      return;
    }
    v7 = v6;
LABEL_13:
    *(_BYTE *)(a1 + 88) = 2;
    _mdns_common_session_terminate_async((void *)a1, v7);
  }
}

void _mdns_resolver_penalize_server_ex(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v10;
  int v11;
  int v12;
  uint64_t *v13;
  int v14;
  uint64_t *v15;
  unsigned __int8 *v16;
  int v17;
  void *v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  NSObject *v22;
  const char *v23;
  int v24;
  int v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  const sockaddr *address;
  int v36;
  const char *v37;
  __int16 v38;
  _BYTE v39[10];
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (!a4)
      goto LABEL_25;
    if (!*(_DWORD *)(a1 + 128))
      goto LABEL_25;
    if (*(_BYTE *)(a2 + 107))
      goto LABEL_25;
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a4 + 16) + 88))(a4);
    if ((v10 & 0xFFFE) != 0x40)
      goto LABEL_25;
    v11 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(a2 + 100) - 1);
    if ((v11 & *(_DWORD *)(a4 + 200)) == 0)
      goto LABEL_25;
    v12 = v10;
    v13 = *(uint64_t **)(a2 + 64);
    if (!v13)
    {
      v14 = *(_DWORD *)(*(_QWORD *)(a4 + 64) + 128);
      v15 = (uint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0xF1748037uLL);
      if (!v15)
        goto LABEL_52;
      v13 = v15;
      *((_DWORD *)v15 + 3) = v14;
      *(_QWORD *)(a2 + 64) = v15;
    }
    v16 = *(unsigned __int8 **)(*(_QWORD *)(*(_QWORD *)(a4 + 88) + 56) + 24);
    if (!_pqw_info_can_accept_qname(v13, v16))
      goto LABEL_25;
    v17 = *((_DWORD *)v13 + 3);
    if (*((_DWORD *)v13 + 2) >= (v17 - 1))
    {
      v20 = (_QWORD *)*v13;
      if (*v13)
      {
        do
        {
          v21 = (_QWORD *)*v20;
          _pqw_qname_item_free(v20);
          v20 = v21;
        }
        while (v21);
        *v13 = 0;
        v17 = *((_DWORD *)v13 + 3);
      }
LABEL_20:
      *((_DWORD *)v13 + 2) = v17;
      if (_mdns_resolver_log_s_once == -1)
        goto LABEL_21;
      goto LABEL_53;
    }
    v18 = malloc_type_calloc(1uLL, 0x10uLL, 0xF1748037uLL);
    if (v18)
    {
      v19 = (uint64_t *)v18;
      DomainNameDupEx(v16, 0, (unsigned __int8 **)v18 + 1, 0);
      *v19 = *v13;
      *v13 = (uint64_t)v19;
      v17 = *((_DWORD *)v13 + 2) + 1;
      goto LABEL_20;
    }
LABEL_52:
    __break(1u);
LABEL_53:
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
LABEL_21:
    v22 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(const char **)(a4 + 128);
      if (!v23)
        v23 = "";
      v24 = *((_DWORD *)v13 + 2);
      v25 = *((_DWORD *)v13 + 3);
      v36 = 136447234;
      v37 = v23;
      v38 = 1024;
      *(_DWORD *)v39 = v24;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v25;
      v40 = 2112;
      v41 = a2;
      v42 = 1024;
      v43 = v12;
      _os_log_impl(&dword_22983F000, v22, OS_LOG_TYPE_DEFAULT, "%{public}sNo response (%u/%u) from server %@ for qtype %{mdns:rrtype}d", (uint8_t *)&v36, 0x28u);
    }
LABEL_25:
    if (a5 - *(_QWORD *)(a2 + 80) < 0)
      return;
  }
  v26 = (_QWORD *)(a1 + 24);
  do
  {
    v27 = v26;
    v28 = *v26;
    v26 = (_QWORD *)(*v26 + 24);
    if (v28)
      v29 = v28 == a2;
    else
      v29 = 1;
  }
  while (!v29);
  if (v28)
  {
    *v27 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a2 + 24) = 0;
    v30 = mach_continuous_time();
    if (mdns_mach_ticks_per_second_s_once != -1)
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
    *(_QWORD *)(a2 + 72) = v30 + 60 * mdns_mach_ticks_per_second_s_ticks_per_second;
    *(_BYTE *)(a2 + 108) = 1;
    do
    {
      v31 = v27;
      v32 = *v27;
      v27 = (_QWORD *)(*v27 + 24);
    }
    while (v32);
    *v31 = a2;
  }
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v33 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    v34 = "";
    if (a4 && *(_QWORD *)(a4 + 128))
      v34 = *(const char **)(a4 + 128);
    v36 = 136446466;
    v37 = v34;
    v38 = 2112;
    *(_QWORD *)v39 = a2;
    _os_log_impl(&dword_22983F000, v33, OS_LOG_TYPE_INFO, "%{public}sPenalizing server %@ for 60 seconds", (uint8_t *)&v36, 0x16u);
  }
  if (a3)
  {
    if (!*(_BYTE *)(a2 + 109))
      *(_BYTE *)(a2 + 109) = 1;
    if (*(_BYTE *)(a1 + 132))
    {
      if (nw_endpoint_get_type(*(nw_endpoint_t *)(a2 + 48)) == nw_endpoint_type_address)
      {
        address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 48));
        _mdns_symptoms_report_dns_server_symptom(413697, (uint64_t)address);
      }
    }
  }
}

void _mdns_querier_send_query(uint64_t a1, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)(*(_QWORD *)(a2 + 32) + 100) - 1) >= 0x20)
    v3 = 0;
  else
    v3 = 1 << (*(_BYTE *)(*(_QWORD *)(a2 + 32) + 100) - 1);
  if (*(_BYTE *)(a2 + 88) == 1 && *(_BYTE *)(a2 + 90))
  {
    *(_DWORD *)(a1 + 216) &= ~v3;
    if (!*(_BYTE *)(a2 + 89) || (*(_DWORD *)(a1 + 220) & v3) == 0)
    {
      _mdns_querier_send_query_immediate(a1, a2);
      *(_DWORD *)(a1 + 220) |= v3;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 216) |= v3;
  }
}

void _mdns_querier_send_query_immediate(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  unsigned int *v8;
  unsigned int v9;
  const char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *interface_log_string;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t (*v19)(_QWORD, _QWORD, uint64_t);
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  _QWORD *v30;
  uint64_t (*v31)(_QWORD, _QWORD, uint64_t);
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t *v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint32_t v56;
  __int16 v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  int v62;
  uint64_t v63;
  unint64_t v64;
  _QWORD *v65;
  uint64_t (*v66)(_QWORD, _QWORD, uint64_t);
  uint64_t v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  const char *v76;
  int v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  const char *v86;
  int v87;
  uint64_t v88;
  NSObject *v89;
  const char *v90;
  int v91;
  const char *v92;
  __int16 v93;
  unint64_t v94;
  __int16 v95;
  unsigned int v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  int v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  _BYTE v104[28];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 88) == 1)
  {
    v4 = *(_QWORD *)(a1 + 88);
    v5 = *(unsigned __int16 *)(v4 + 64);
    v6 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(a2 + 64) = mach_continuous_time();
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 + 16) + 80);
    if (v7)
      v7(a2, v6, v5);
  }
  v8 = (unsigned int *)(a1 + 208);
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 + 1, v8));
  if (*(_QWORD *)(a1 + 128))
    v10 = *(const char **)(a1 + 128);
  else
    v10 = "";
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 40);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = 152;
  if (!*(_BYTE *)(a2 + 89))
    v13 = 148;
  v14 = *(_DWORD *)(*(_QWORD *)(v12 + 16) + v13);
  interface_log_string = _mdns_resolver_get_interface_log_string(v12);
  v16 = *(_QWORD *)(a1 + 88);
  if (v11 < 0xC)
  {
    if (*(_BYTE *)(a1 + 255))
    {
      v30 = (_QWORD *)(v16 + 16);
      while (1)
      {
        v30 = (_QWORD *)*v30;
        if (!v30)
          break;
        v31 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))v30[3];
        if (v31)
        {
          v32 = v31(*(_QWORD *)(a1 + 88), 0, 1);
          if (!v32)
            break;
          v21 = (void *)v32;
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v33 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            v34 = *(_DWORD *)(a1 + 208);
            v35 = *(_QWORD *)(a2 + 32);
            v36 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 32);
            v91 = 136448258;
            v92 = v10;
            v93 = 2048;
            v94 = v11;
            v95 = 1024;
            v96 = v34;
            v97 = 2112;
            v98 = v35;
            v99 = 1024;
            v100 = v14;
            v101 = 2082;
            v102 = interface_log_string;
            v103 = 1040;
            *(_DWORD *)v104 = v11;
            *(_WORD *)&v104[4] = 2098;
            *(_QWORD *)&v104[6] = v36;
            *(_WORD *)&v104[14] = 2082;
            *(_QWORD *)&v104[16] = v21;
            v27 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %{public}s";
            v28 = v33;
            v29 = 80;
LABEL_30:
            _os_log_impl(&dword_22983F000, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v91, v29);
          }
LABEL_31:
          free(v21);
          goto LABEL_41;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v45 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v46 = *(_DWORD *)(a1 + 208);
      v47 = *(_QWORD *)(a2 + 32);
      v48 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 32);
      v91 = 136448258;
      v92 = v10;
      v93 = 2048;
      v94 = v11;
      v95 = 1024;
      v96 = v46;
      v97 = 2112;
      v98 = v47;
      v99 = 1024;
      v100 = v14;
      v101 = 2082;
      v102 = interface_log_string;
      v103 = 1040;
      *(_DWORD *)v104 = v11;
      *(_WORD *)&v104[4] = 2098;
      *(_QWORD *)&v104[6] = v48;
      *(_WORD *)&v104[14] = 2112;
      *(_QWORD *)&v104[16] = v16;
      v42 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %@";
      v43 = v45;
      v44 = 80;
      goto LABEL_40;
    }
  }
  else
  {
    v17 = *(_QWORD *)(v16 + 32);
    if (*(_BYTE *)(a1 + 255))
    {
      v18 = (_QWORD *)(v16 + 16);
      while (1)
      {
        v18 = (_QWORD *)*v18;
        if (!v18)
          break;
        v19 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))v18[3];
        if (v19)
        {
          v20 = v19(*(_QWORD *)(a1 + 88), 0, 1);
          if (!v20)
            break;
          v21 = (void *)v20;
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v22 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            v23 = *v8;
            v24 = *(_QWORD *)(a2 + 32);
            v25 = bswap32(*(_DWORD *)v17);
            v26 = bswap64(*(_QWORD *)(v17 + 4));
            v91 = 136448258;
            v92 = v10;
            v93 = 2048;
            v94 = v11;
            v95 = 1024;
            v96 = v23;
            v97 = 2112;
            v98 = v24;
            v99 = 1024;
            v100 = v14;
            v101 = 2082;
            v102 = interface_log_string;
            v103 = 2048;
            *(_QWORD *)v104 = v25;
            *(_WORD *)&v104[8] = 2048;
            *(_QWORD *)&v104[10] = v26;
            *(_WORD *)&v104[18] = 2082;
            *(_QWORD *)&v104[20] = v21;
            v27 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{mdns:dns.idflags}08"
                  "lX, counts: %{mdns:dns.counts}016llX, %{public}s";
            v28 = v22;
            v29 = 84;
            goto LABEL_30;
          }
          goto LABEL_31;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v37 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *v8;
      v39 = *(_QWORD *)(a2 + 32);
      v40 = bswap32(*(_DWORD *)v17);
      v41 = bswap64(*(_QWORD *)(v17 + 4));
      v91 = 136448258;
      v92 = v10;
      v93 = 2048;
      v94 = v11;
      v95 = 1024;
      v96 = v38;
      v97 = 2112;
      v98 = v39;
      v99 = 1024;
      v100 = v14;
      v101 = 2082;
      v102 = interface_log_string;
      v103 = 2048;
      *(_QWORD *)v104 = v40;
      *(_WORD *)&v104[8] = 2048;
      *(_QWORD *)&v104[10] = v41;
      *(_WORD *)&v104[18] = 2112;
      *(_QWORD *)&v104[20] = v16;
      v42 = "%{public}sSent %zu-byte query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{mdns:dns.idflags}08lX, co"
            "unts: %{mdns:dns.counts}016llX, %@";
      v43 = v37;
      v44 = 84;
LABEL_40:
      _os_log_impl(&dword_22983F000, v43, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v91, v44);
    }
  }
LABEL_41:
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 64) + 128))
    goto LABEL_48;
  v49 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v49 + 107))
    goto LABEL_48;
  v50 = *(_QWORD *)(a1 + 88);
  if ((*(_WORD *)(v50 + 64) & 0xFFFE) != 0x40)
    goto LABEL_48;
  v51 = (*(_DWORD *)(v49 + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(v49 + 100) - 1);
  if ((v51 & *(_DWORD *)(a1 + 200)) != 0)
    goto LABEL_48;
  v52 = *(uint64_t **)(v49 + 64);
  if (v52)
  {
    if (!_pqw_info_can_accept_qname(v52, *(unsigned __int8 **)(*(_QWORD *)(v50 + 56) + 24)))
      goto LABEL_48;
  }
  v53 = *(_QWORD *)(a1 + 192);
  if (v53)
    goto LABEL_72;
  v54 = *(_WORD *)(v49 + 104);
  if (!v54)
  {
    if (nw_endpoint_get_type(*(nw_endpoint_t *)(v49 + 48)) == nw_endpoint_type_address)
    {
      if (nw_endpoint_get_address(*(nw_endpoint_t *)(v49 + 48))->sa_family == 30)
        v54 = 28;
      else
        v54 = 1;
    }
    else
    {
      v54 = 1;
    }
    *(_WORD *)(v49 + 104) = v54;
  }
  v55 = mdns_query_message_create();
  if (!v55)
  {
LABEL_107:
    *(_QWORD *)(a1 + 192) = 0;
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v89 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v90 = *(const char **)(a1 + 128);
      if (!v90)
        v90 = "";
      v91 = 136446210;
      v92 = v90;
      _os_log_error_impl(&dword_22983F000, v89, OS_LOG_TYPE_ERROR, "%{public}sFailed to create test query", (uint8_t *)&v91, 0xCu);
    }
    goto LABEL_48;
  }
  v53 = v55;
  mdns_query_message_set_qname(v55, *(void **)(v50 + 56));
  if ((*(_BYTE *)(v53 + 70) & 0x20) == 0)
  {
    *(_WORD *)(v53 + 64) = v54;
    *(_WORD *)(v53 + 66) = *(_WORD *)(v50 + 66);
  }
  v56 = arc4random();
  if ((*(_BYTE *)(v53 + 70) & 0x20) == 0)
  {
    if (v56 % 0xFFFF == 65534)
      v57 = 1;
    else
      v57 = -2 - v56 % 0xFFFF;
    if (v56 % 0xFFFF + 1 == *(unsigned __int16 *)(v50 + 68))
      v58 = v57;
    else
      v58 = v56 % 0xFFFF + 1;
    *(_WORD *)(v53 + 68) = v58;
  }
  if (mdns_query_message_construct(v53))
  {
    os_release((void *)v53);
    goto LABEL_107;
  }
  *(_QWORD *)(a1 + 192) = v53;
LABEL_72:
  if (*(_BYTE *)(a2 + 88) == 1)
  {
    v59 = *(_QWORD *)(v53 + 24);
    v60 = *(unsigned __int16 *)(v53 + 64);
    *(_QWORD *)(a2 + 64) = mach_continuous_time();
    v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 + 16) + 80);
    if (v61)
      v61(a2, v59, v60);
  }
  v62 = *(unsigned __int8 *)(a1 + 246);
  if (v62 != 255)
    *(_BYTE *)(a1 + 246) = v62 + 1;
  v63 = *(_QWORD *)(a1 + 192);
  if (v63)
  {
    v64 = *(_QWORD *)(v63 + 40);
    if (*(_BYTE *)(a1 + 255))
    {
      v65 = (_QWORD *)(v63 + 16);
      while (1)
      {
        v65 = (_QWORD *)*v65;
        if (!v65)
          break;
        v66 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))v65[3];
        if (v66)
        {
          v67 = v66(*(_QWORD *)(a1 + 192), 0, 1);
          if (!v67)
            break;
          v68 = (void *)v67;
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v69 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            if (*(_QWORD *)(a1 + 128))
              v70 = *(const char **)(a1 + 128);
            else
              v70 = "";
            v71 = *(unsigned __int8 *)(a1 + 246);
            v72 = *(_QWORD *)(a2 + 32);
            v73 = *(_QWORD *)(a1 + 64);
            v74 = 152;
            if (!*(_BYTE *)(a2 + 89))
              v74 = 148;
            v75 = *(_DWORD *)(*(_QWORD *)(v73 + 16) + v74);
            v76 = _mdns_resolver_get_interface_log_string(v73);
            v77 = 12;
            v78 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + 32);
            if (v64 < 0xC)
              v77 = v64;
            v91 = 136448258;
            v92 = v70;
            v93 = 2048;
            v94 = v64;
            v95 = 1024;
            v96 = v71;
            v97 = 2112;
            v98 = v72;
            v99 = 1024;
            v100 = v75;
            v101 = 2082;
            v102 = v76;
            v103 = 1040;
            *(_DWORD *)v104 = v77;
            *(_WORD *)&v104[4] = 2098;
            *(_QWORD *)&v104[6] = v78;
            *(_WORD *)&v104[14] = 2082;
            *(_QWORD *)&v104[16] = v68;
            _os_log_impl(&dword_22983F000, v69, OS_LOG_TYPE_DEFAULT, "%{public}sSent %zu-byte test query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %{public}s", (uint8_t *)&v91, 0x50u);
          }
          free(v68);
          goto LABEL_48;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v79 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_QWORD *)(a1 + 128))
        v80 = *(const char **)(a1 + 128);
      else
        v80 = "";
      v81 = *(unsigned __int8 *)(a1 + 246);
      v82 = *(_QWORD *)(a2 + 32);
      v83 = *(_QWORD *)(a1 + 64);
      v84 = 152;
      if (!*(_BYTE *)(a2 + 89))
        v84 = 148;
      v85 = *(_DWORD *)(*(_QWORD *)(v83 + 16) + v84);
      v86 = _mdns_resolver_get_interface_log_string(v83);
      v87 = 12;
      v88 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + 32);
      if (v64 < 0xC)
        v87 = v64;
      v91 = 136448258;
      v92 = v80;
      v93 = 2048;
      v94 = v64;
      v95 = 1024;
      v96 = v81;
      v97 = 2112;
      v98 = v82;
      v99 = 1024;
      v100 = v85;
      v101 = 2082;
      v102 = v86;
      v103 = 1040;
      *(_DWORD *)v104 = v87;
      *(_WORD *)&v104[4] = 2098;
      *(_QWORD *)&v104[6] = v88;
      *(_WORD *)&v104[14] = 2112;
      *(_QWORD *)&v104[16] = v63;
      _os_log_impl(&dword_22983F000, v79, OS_LOG_TYPE_DEFAULT, "%{public}sSent %zu-byte test query #%u to %@ over %{mdns:protocol}d via %{public}s -- %{public,mdns:dnshdr}.*P, %@", (uint8_t *)&v91, 0x50u);
    }
  }
LABEL_48:
  _mdns_resolver_start_pending_queriers(*(_QWORD *)(a1 + 64));
}

const char *_mdns_resolver_get_interface_log_string(uint64_t a1)
{
  char *v1;
  char **v2;
  NSObject *v4;
  const char *name;
  const char *v6;

  v2 = (char **)(a1 + 64);
  v1 = *(char **)(a1 + 64);
  if (!v1)
  {
    v4 = *(NSObject **)(a1 + 48);
    if (v4)
    {
      name = nw_interface_get_name(v4);
      v4 = *(NSObject **)(a1 + 48);
      if (v4)
        LODWORD(v4) = nw_interface_get_index(v4);
    }
    else
    {
      name = "any";
    }
    v6 = "";
    if (name)
      v6 = name;
    asprintf(v2, "%s/%u", v6, (_DWORD)v4);
    v1 = *v2;
  }
  if (v1)
    return v1;
  else
    return "???";
}

BOOL _pqw_info_can_accept_qname(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t **v3;
  _BOOL8 result;

  if (*((_DWORD *)a1 + 2) >= *((_DWORD *)a1 + 3))
    return 0;
  v3 = (uint64_t **)a1;
  while (1)
  {
    v3 = (uint64_t **)*v3;
    result = v3 == 0;
    if (!v3)
      break;
    if (DomainNameEqual((unsigned __int8 *)v3[1], a2))
      return 0;
  }
  return result;
}

void _mdns_resolver_start_pending_queriers(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = *(NSObject **)(a1 + 96);
    if (v2)
    {
LABEL_7:
      dispatch_source_merge_data(v2, 1uLL);
      return;
    }
    if (_mdns_resolver_queue_s_once != -1)
      dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
    v3 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
    *(_QWORD *)(a1 + 96) = v3;
    if (v3)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_resolver_start_pending_queriers_block_invoke;
      handler[3] = &__block_descriptor_tmp_115_1273;
      handler[4] = a1;
      dispatch_source_set_event_handler(v3, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 96));
      v2 = *(NSObject **)(a1 + 96);
      goto LABEL_7;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v4 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22983F000, v4, OS_LOG_TYPE_ERROR, "Failed to create pending querier starter GCD source", buf, 2u);
    }
  }
}

void ___mdns_resolver_start_pending_queriers_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v2 = (_QWORD *)(v1 + 40);
  v3 = v4;
  if (v4)
  {
    do
    {
      *v2 = *(_QWORD *)(v3 + 56);
      *(_QWORD *)(v3 + 56) = 0;
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v6 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
      {
        v7 = *(const char **)(v3 + 128);
        if (!v7)
          v7 = "";
        *(_DWORD *)buf = 136446210;
        v11 = v7;
        _os_log_impl(&dword_22983F000, v6, OS_LOG_TYPE_INFO, "%{public}sStarting pending querier due to observed traffic activity", buf, 0xCu);
      }
      _mdns_resolver_start_querier(*(_QWORD *)(a1 + 32), (_BYTE *)v3);
      os_release((void *)v3);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 40);
      v2 = (_QWORD *)(v8 + 40);
      v3 = v9;
    }
    while (v9);
  }
}

void _mdns_querier_session_handle_event(uint64_t a1, int a2, int a3, uint64_t a4)
{
  NSObject *v8;
  BOOL v9;
  os_log_type_t v10;
  const char *v11;
  int v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  int v21;
  const char *v22;
  char v23;
  int v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v8 = _mdns_resolver_log_s_log;
  if (a3)
    v9 = a2 == 3;
  else
    v9 = 0;
  if (v9)
    v10 = OS_LOG_TYPE_ERROR;
  else
    v10 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v10))
  {
    v11 = *(const char **)(a4 + 128);
    if (!v11)
      v11 = "";
    v25 = 136446722;
    v26 = v11;
    v27 = 1024;
    v28 = a2;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_22983F000, v8, v10, "%{public}sQuerier session event -- type: %{mdns:session_event}d, error: %{mdns:err}ld", (uint8_t *)&v25, 0x1Cu);
  }
  if ((a2 - 3) < 2)
  {
    v12 = *(unsigned __int8 *)(a1 + 89);
    v13 = (_QWORD *)(a4 + 104);
    if (*(_BYTE *)(a1 + 89))
      v13 = (_QWORD *)(a4 + 112);
    do
    {
      v14 = v13;
      v15 = *v13;
      v13 = (_QWORD *)(*v13 + 24);
      if (v15)
        v16 = v15 == a1;
      else
        v16 = 1;
    }
    while (!v16);
    if (!v15)
      return;
    *v14 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;
    _mdns_session_invalidate((_BYTE *)a1);
    os_release((void *)a1);
    if (!v12)
      return;
    v17 = *(_QWORD *)(a1 + 32);
    if (a2 == 3)
    {
      if (a3)
      {
        v18 = *(_QWORD *)(a4 + 64);
        _mdns_resolver_generate_error_event((NSObject **)v18, a3);
      }
      else
      {
        if (*(_BYTE *)(a4 + 249) == 3)
          goto LABEL_44;
        v18 = *(_QWORD *)(a4 + 64);
      }
      if (*(_QWORD *)(a4 + 128))
        v22 = *(const char **)(a4 + 128);
      else
        v22 = "";
      v23 = _mdns_resolver_handle_stream_error(v18, v17, v22);
      v24 = *(unsigned __int8 *)(v18 + 140);
      _mdns_resolver_penalize_server_ex(v18, v17, 0, 0, 0);
      if (v24 && (v23 & 1) != 0)
        goto LABEL_43;
    }
LABEL_44:
    _mdns_querier_handle_stream_termination((int8x8_t *)a4, v17);
    return;
  }
  if (a2 != 2)
  {
    if (a2 == 1)
      _mdns_querier_send_query(a4, a1);
    return;
  }
  if (*(_BYTE *)(a1 + 89))
  {
    v19 = *(_QWORD *)(a4 + 64);
    v20 = *(_QWORD *)(a4 + 128) ? *(const char **)(a4 + 128) : "";
    v21 = _mdns_resolver_handle_stream_lateness(*(_QWORD *)(a4 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v20);
    if (*(_BYTE *)(v19 + 140))
    {
      if (v21)
LABEL_43:
        _mdns_querier_conclude_ex(a4, 6, 0, 0);
    }
  }
}

void _mdns_querier_session_receive(uint64_t a1, NSObject *a2, uint64_t a3)
{
  _BYTE *v5;
  _BYTE *v6;
  int v7;
  BOOL *v8;
  _BOOL4 v9;
  __int16 *v10;
  int is_response_acceptable;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  int is_query_response;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  BOOL (*v26)(int);
  __int16 v27;
  __int16 v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = mdns_message_create_with_dispatch_data(a2);
  if (v5)
  {
    v6 = v5;
    v28 = 0;
    v7 = *(unsigned __int8 *)(a1 + 89);
    if (*(_BYTE *)(a1 + 89))
      v8 = 0;
    else
      v8 = (BOOL *)&v28 + 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a3 + 64) + 16) + 161))
      v9 = *(_BYTE *)(a1 + 89) != 0;
    else
      v9 = 1;
    if (v9)
      v10 = 0;
    else
      v10 = &v28;
    v27 = 0;
    is_response_acceptable = _mdns_querier_is_response_acceptable(a3, (uint64_t)v5, v8, v10, &v27);
    if (*(_QWORD *)(a3 + 128))
      v12 = *(const char **)(a3 + 128);
    else
      v12 = "";
    _mdns_resolver_log_receive(*(_QWORD *)(a3 + 64), a1, v6, is_response_acceptable, v12, *(unsigned __int8 *)(a3 + 255));
    v13 = *(_QWORD *)(a1 + 32);
    if (is_response_acceptable)
    {
      v14 = *(_QWORD *)(a3 + 64);
      v15 = *(_QWORD *)(a1 + 56);
      v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 16) + 88))(a3);
      _mdns_resolver_note_responsiveness(v14, v13, v7 != 0, v15, v16);
      if (v27 > 9 || ((1 << v27) & 0x209) == 0)
      {
        _mdns_querier_handle_bad_rcode(a3, v6, v27, v13);
        goto LABEL_49;
      }
      if (v7 || !HIBYTE(v28))
      {
        _mdns_querier_conclude_ex(a3, 1, 0, v6);
        goto LABEL_49;
      }
      *(_BYTE *)(a3 + 250) = 1;
    }
    else
    {
      if ((_BYTE)v28)
        v17 = v9;
      else
        v17 = 1;
      if ((v17 & 1) != 0)
      {
        v18 = *(_QWORD *)(a3 + 64);
        if (*(_DWORD *)(v18 + 128))
        {
          v19 = *(_QWORD *)(a3 + 192);
          if (v19)
          {
            is_query_response = _mdns_message_is_query_response_ex(*((char **)v6 + 4), *((_QWORD *)v6 + 5), v19, 0, 0, 1);
            v18 = *(_QWORD *)(a3 + 64);
            if (is_query_response)
            {
              if ((*(_DWORD *)(v13 + 100) - 1) >= 0x20)
                v21 = 0;
              else
                v21 = 1 << (*(_BYTE *)(v13 + 100) - 1);
              *(_DWORD *)(a3 + 200) |= v21;
              _mdns_resolver_note_responsiveness(v18, v13, v7 != 0, *(_QWORD *)(a1 + 56), *(unsigned __int16 *)(*(_QWORD *)(a3 + 192) + 64));
              goto LABEL_49;
            }
          }
        }
        if (*(_DWORD *)(*(_QWORD *)(v18 + 16) + 144) == 1 && !*(_BYTE *)(v13 + 112))
        {
          v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 16) + 88))(a3);
          v26 = _mdns_qtype_is_problematic;
          if (v25 != 1 && v25 != 28)
          {
            if ((v25 & 0xFFFE) != 0x40)
              goto LABEL_49;
            v26 = _mdns_qtype_is_address_type;
          }
          *(_WORD *)buf = 0;
          if (_mdns_message_is_query_response_ex(*((char **)v6 + 4), *((_QWORD *)v6 + 5), *(_QWORD *)(a3 + 88), 0, buf, 0)&& v26(*(unsigned __int16 *)buf))
          {
            *(_BYTE *)(v13 + 112) = 1;
          }
        }
LABEL_49:
        os_release(v6);
        return;
      }
      *(_BYTE *)(a3 + 250) = 2;
      v22 = *(_QWORD *)(a3 + 64);
      if (mdns_mach_ticks_per_second_s_once != -1)
        dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
      v23 = mdns_mach_ticks_per_second_s_ticks_per_second;
      *(_QWORD *)(v22 + 88) = mach_continuous_time() + 10 * v23;
      *(_BYTE *)(v22 + 134) = 1;
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v24 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v30 = 10;
        _os_log_impl(&dword_22983F000, v24, OS_LOG_TYPE_INFO, "Got suspicious response, entering suspicious mode for %d seconds", buf, 8u);
      }
    }
    _mdns_resolver_deregister_querier(*(_QWORD *)(a3 + 64), a3);
    _mdns_resolver_register_querier_ex(*(_QWORD *)(a3 + 64), (_WORD *)a3, 1);
    goto LABEL_49;
  }
  _mdns_querier_conclude_ex(a3, 5, -6729, 0);
}

uint64_t _mdns_querier_is_response_acceptable(uint64_t a1, uint64_t a2, BOOL *a3, _BYTE *a4, _WORD *a5)
{
  unint64_t v7;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  __int16 v17;

  v7 = *(_QWORD *)(a2 + 40);
  if (v7 < 0xC)
  {
    result = 0;
LABEL_21:
    v16 = 0;
    if (!a4)
      return result;
    goto LABEL_18;
  }
  v17 = 0;
  v11 = *(_QWORD *)(a2 + 32);
  result = _mdns_message_is_query_response_ex((char *)v11, v7, *(_QWORD *)(a1 + 88), &v17, 0, 0);
  if (!(_DWORD)result)
    goto LABEL_21;
  v13 = *(_QWORD *)(a1 + 88);
  if (v17 == *(_WORD *)(v13 + 68))
  {
    v14 = *(_BYTE *)(v11 + 3);
    if (a3)
    {
      v15 = (*(_BYTE *)(v11 + 2) & 2) != 0
         && ((*(_BYTE *)(v13 + 70) & 4) != 0
          || !__rev16(*(unsigned __int16 *)(v11 + 6))
          || !__rev16(*(unsigned __int16 *)(v11 + 8)) && !__rev16(*(unsigned __int16 *)(v11 + 10)));
      *a3 = v15;
    }
    if (a5)
      *a5 = v14 & 0xF;
    result = 1;
  }
  else
  {
    result = 0;
  }
  v16 = 1;
  if (a4)
LABEL_18:
    *a4 = v16 & (result ^ 1);
  return result;
}

void _mdns_resolver_log_receive(uint64_t a1, uint64_t a2, _QWORD *a3, int a4, const char *a5, int a6)
{
  const char *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  const char *interface_log_string;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v17)(_QWORD *, _QWORD, uint64_t);
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  _QWORD *v27;
  uint64_t (*v28)(_QWORD *, _QWORD, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  _BYTE v56[28];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (a5)
    v10 = a5;
  else
    v10 = "";
  v11 = a3[5];
  v12 = 152;
  if (!*(_BYTE *)(a2 + 89))
    v12 = 148;
  v13 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + v12);
  interface_log_string = _mdns_resolver_get_interface_log_string(a1);
  if (v11 < 0xC)
  {
    if (a6)
    {
      v27 = a3 + 2;
      while (1)
      {
        v27 = (_QWORD *)*v27;
        if (!v27)
          break;
        v28 = (uint64_t (*)(_QWORD *, _QWORD, uint64_t))v27[3];
        if (v28)
        {
          v29 = v28(a3, 0, 1);
          if (!v29)
            break;
          v19 = (void *)v29;
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v30 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            v31 = *(_QWORD *)(a2 + 32);
            v32 = a3[4];
            v43 = 136448258;
            v44 = v10;
            v45 = 1024;
            v46 = a4;
            v47 = 2048;
            v48 = v11;
            v49 = 2112;
            v50 = v31;
            v51 = 1024;
            v52 = v13;
            v53 = 2082;
            v54 = interface_log_string;
            v55 = 1040;
            *(_DWORD *)v56 = v11;
            *(_WORD *)&v56[4] = 2098;
            *(_QWORD *)&v56[6] = v32;
            *(_WORD *)&v56[14] = 2082;
            *(_QWORD *)&v56[16] = v19;
            v24 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s"
                  " -- %{public,mdns:dnshdr}.*P, %{public}s";
            v25 = v30;
            v26 = 80;
LABEL_25:
            _os_log_impl(&dword_22983F000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v43, v26);
          }
LABEL_26:
          free(v19);
          return;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v40 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *(_QWORD *)(a2 + 32);
      v42 = a3[4];
      v43 = 136448258;
      v44 = v10;
      v45 = 1024;
      v46 = a4;
      v47 = 2048;
      v48 = v11;
      v49 = 2112;
      v50 = v41;
      v51 = 1024;
      v52 = v13;
      v53 = 2082;
      v54 = interface_log_string;
      v55 = 1040;
      *(_DWORD *)v56 = v11;
      *(_WORD *)&v56[4] = 2098;
      *(_QWORD *)&v56[6] = v42;
      *(_WORD *)&v56[14] = 2112;
      *(_QWORD *)&v56[16] = a3;
      v37 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s -- %{"
            "public,mdns:dnshdr}.*P, %@";
      v38 = v40;
      v39 = 80;
      goto LABEL_35;
    }
  }
  else
  {
    v15 = a3[4];
    if (a6)
    {
      v16 = a3 + 2;
      while (1)
      {
        v16 = (_QWORD *)*v16;
        if (!v16)
          break;
        v17 = (uint64_t (*)(_QWORD *, _QWORD, uint64_t))v16[3];
        if (v17)
        {
          v18 = v17(a3, 0, 1);
          if (!v18)
            break;
          v19 = (void *)v18;
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v20 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_QWORD *)(a2 + 32);
            v22 = bswap32(*(_DWORD *)v15);
            v23 = bswap64(*(_QWORD *)(v15 + 4));
            v43 = 136448258;
            v44 = v10;
            v45 = 1024;
            v46 = a4;
            v47 = 2048;
            v48 = v11;
            v49 = 2112;
            v50 = v21;
            v51 = 1024;
            v52 = v13;
            v53 = 2082;
            v54 = interface_log_string;
            v55 = 2048;
            *(_QWORD *)v56 = v22;
            *(_WORD *)&v56[8] = 2048;
            *(_QWORD *)&v56[10] = v23;
            *(_WORD *)&v56[18] = 2082;
            *(_QWORD *)&v56[20] = v19;
            v24 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s"
                  " -- %{mdns:dns.idflags}08lX, counts: %{mdns:dns.counts}016llX, %{public}s";
            v25 = v20;
            v26 = 84;
            goto LABEL_25;
          }
          goto LABEL_26;
        }
      }
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v33 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(_QWORD *)(a2 + 32);
      v35 = bswap32(*(_DWORD *)v15);
      v36 = bswap64(*(_QWORD *)(v15 + 4));
      v43 = 136448258;
      v44 = v10;
      v45 = 1024;
      v46 = a4;
      v47 = 2048;
      v48 = v11;
      v49 = 2112;
      v50 = v34;
      v51 = 1024;
      v52 = v13;
      v53 = 2082;
      v54 = interface_log_string;
      v55 = 2048;
      *(_QWORD *)v56 = v35;
      *(_WORD *)&v56[8] = 2048;
      *(_QWORD *)&v56[10] = v36;
      *(_WORD *)&v56[18] = 2112;
      *(_QWORD *)&v56[20] = a3;
      v37 = "%{public}sReceived %{mdns:acceptable}d %zu-byte response from %@ over %{mdns:protocol}d via %{public}s -- %{"
            "mdns:dns.idflags}08lX, counts: %{mdns:dns.counts}016llX, %@";
      v38 = v33;
      v39 = 84;
LABEL_35:
      _os_log_impl(&dword_22983F000, v38, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v43, v39);
    }
  }
}

void _mdns_resolver_note_responsiveness(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  const sockaddr *address;
  unsigned int v9;
  unsigned int v10;
  NSObject *oneshot_timer;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a4 - *(_QWORD *)(a2 + 80) >= 1)
    *(_QWORD *)(a2 + 80) = a4;
  if ((a5 & 0xFFFFFFFE) == 0x40 && !*(_BYTE *)(a2 + 107))
    *(_BYTE *)(a2 + 107) = 1;
  _mdns_resolver_unpenalize_server(a1, a2, 1);
  if (*(_BYTE *)(a2 + 109))
  {
    *(_BYTE *)(a2 + 109) = 0;
    if (*(_BYTE *)(a1 + 132))
    {
      if (nw_endpoint_get_type(*(nw_endpoint_t *)(a2 + 48)) == nw_endpoint_type_address)
      {
        address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 48));
        _mdns_symptoms_report_dns_server_symptom(413698, (uint64_t)address);
      }
    }
  }
  if (!a3)
  {
    if (!*(_QWORD *)(a2 + 40))
    {
      v9 = *(_DWORD *)(a1 + 124);
      if (v9 / 0xA + v9 <= v9)
        v10 = *(_DWORD *)(a1 + 124);
      else
        v10 = v9 / 0xA + v9;
      oneshot_timer = _mdns_resolver_create_oneshot_timer(v10, 5u);
      *(_QWORD *)(a2 + 40) = oneshot_timer;
      if (oneshot_timer)
      {
        v12 = mach_continuous_time();
        v13 = *(NSObject **)(a2 + 40);
        v21 = MEMORY[0x24BDAC760];
        *(_QWORD *)&v22 = 0x40000000;
        *((_QWORD *)&v22 + 1) = ___mdns_resolver_schedule_fast_recovery_check_block_invoke;
        v23 = &__block_descriptor_tmp_114_1281;
        v24 = a2;
        v25 = a1;
        v26 = v12;
        dispatch_source_set_event_handler(v13, &v21);
        dispatch_activate(*(dispatch_object_t *)(a2 + 40));
      }
      else
      {
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v20 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21) = 0;
          _os_log_error_impl(&dword_22983F000, v20, OS_LOG_TYPE_ERROR, "Failed to create fast recovery timer", (uint8_t *)&v21, 2u);
        }
      }
    }
    goto LABEL_31;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 16) + 158))
    goto LABEL_31;
  if (*(_BYTE *)(a2 + 110))
  {
    *(_DWORD *)(a2 + 96) = 0;
    *(_BYTE *)(a2 + 110) = 0;
  }
  else
  {
    v14 = *(_DWORD *)(a2 + 96);
    *(_DWORD *)(a2 + 96) = 0;
    *(_BYTE *)(a2 + 110) = 0;
    if (v14 < 3)
      goto LABEL_25;
  }
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v15 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 152);
    LODWORD(v21) = 67109378;
    HIDWORD(v21) = v16;
    LOWORD(v22) = 2112;
    *(_QWORD *)((char *)&v22 + 2) = a2;
    _os_log_impl(&dword_22983F000, v15, OS_LOG_TYPE_DEFAULT, "Cleared stream problems with %{mdns:protocol}d server %@", (uint8_t *)&v21, 0x12u);
  }
LABEL_25:
  if (*(_BYTE *)(a1 + 139))
  {
    v17 = *(_QWORD *)(a1 + 24);
    if (v17)
    {
      while ((*(char *)(v17 + 106) - 1) > 3 || *(_BYTE *)(v17 + 110) || *(_DWORD *)(v17 + 96) >= 3u)
      {
        v17 = *(_QWORD *)(v17 + 24);
        if (!v17)
          goto LABEL_31;
      }
      *(_BYTE *)(a1 + 139) = 0;
      v18 = *(NSObject **)(a1 + 104);
      if (v18)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 104));
        dispatch_release(v18);
        *(_QWORD *)(a1 + 104) = 0;
      }
      v19 = *(_QWORD *)(a1 + 112);
      if (v19)
      {
        mdns_client_invalidate(v19);
        os_release(*(void **)(a1 + 112));
        *(_QWORD *)(a1 + 112) = 0;
      }
      _mdns_resolver_generate_connection_event(a1);
      os_retain((void *)a1);
      if (_mdns_resolver_queue_s_once != -1)
        dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
      v21 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v22 = 0x40000000;
      *((_QWORD *)&v22 + 1) = ___mdns_resolver_start_serverless_queries_async_block_invoke;
      v23 = &__block_descriptor_tmp_113_1279;
      v24 = a1;
      dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, &v21);
    }
  }
LABEL_31:
  _mdns_resolver_start_pending_queriers(a1);
}

void _mdns_querier_handle_bad_rcode(uint64_t a1, void *object, int a3, uint64_t a4)
{
  int v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD *v12;

  if ((*(_DWORD *)(a4 + 100) - 1) >= 0x20)
    v8 = 0;
  else
    v8 = 1 << (*(_BYTE *)(a4 + 100) - 1);
  *(_DWORD *)(a1 + 228) |= v8;
  v9 = *(__int16 *)(a1 + 244);
  v10 = *(void **)(a1 + 144);
  if (v9 < 0)
  {
    if (v10)
    {
      os_release(v10);
      *(_QWORD *)(a1 + 144) = 0;
    }
    *(_WORD *)(a1 + 244) = 0;
  }
  else if (v10 && (a3 == 5 || v9 != 5))
  {
    goto LABEL_15;
  }
  os_retain(object);
  v11 = *(void **)(a1 + 144);
  if (v11)
    os_release(v11);
  *(_QWORD *)(a1 + 144) = object;
  *(_WORD *)(a1 + 244) = a3;
LABEL_15:
  if (a3 == 5)
    _mdns_resolver_penalize_server_ex(*(_QWORD *)(a1 + 64), a4, 0, 0, 0);
  if (_mdns_resolver_get_server(*(_QWORD *)(a1 + 64), *(_DWORD *)(a1 + 228)))
  {
    if (*(_QWORD *)(a1 + 72) == a4)
    {
      *(_QWORD *)(a1 + 72) = 0;
      *(_BYTE *)(a1 + 247) = 0;
      _mdns_querier_initiate_send(a1);
    }
  }
  else
  {
    v12 = *(_QWORD **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = 0;
    _mdns_querier_conclude_ex(a1, 1, 0, v12);
    os_release(v12);
  }
}

uint64_t _mdns_message_is_query_response_ex(char *a1, unint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5, char a6)
{
  unsigned int v10;
  uint64_t result;
  int v12;
  unsigned __int8 v13[256];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0xC)
    return 0;
  v10 = __rev16(*(unsigned __int16 *)a1);
  if (!a4 && v10 != *(unsigned __int16 *)(a3 + 68))
    return 0;
  if ((a1[2] & 0xF8) != 0x80)
    return 0;
  if (__rev16(*((unsigned __int16 *)a1 + 2)) != 1)
    return 0;
  v12 = 0;
  if (DNSMessageExtractQuestion((unint64_t)a1, a2, a1 + 12, (char *)v13, (_WORD *)&v12 + 1, &v12, 0))return 0;
  if ((a6 & 1) == 0)
  {
    result = DomainNameEqual(v13, *(unsigned __int8 **)(*(_QWORD *)(a3 + 56) + 24));
    if (!(_DWORD)result)
      return result;
  }
  if (!a5 && HIWORD(v12) != *(unsigned __int16 *)(a3 + 64) || (unsigned __int16)v12 != *(unsigned __int16 *)(a3 + 66))
    return 0;
  if (a4)
    *a4 = v10;
  if (a5)
    *a5 = HIWORD(v12);
  return 1;
}

BOOL _mdns_qtype_is_address_type(int a1)
{
  return a1 == 1 || a1 == 28;
}

BOOL _mdns_qtype_is_problematic(int a1)
{
  return (a1 & 0xFFFFFFFE) == 64;
}

void _mdns_resolver_unpenalize_server(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a2 + 108))
    return;
  v4 = (uint64_t *)(a1 + 24);
  v5 = (_QWORD *)(a1 + 24);
  do
  {
    v6 = v5;
    v7 = *v5;
    v5 = (_QWORD *)(*v5 + 24);
    if (v7)
      v8 = v7 == a2;
    else
      v8 = 1;
  }
  while (!v8);
  if (!v7)
    return;
  *v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  *(_BYTE *)(a2 + 108) = 0;
  if (a3)
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v9 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v14 = 138412290;
    v15 = a2;
    v10 = "Unpenalizing responsive server %@";
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v9 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v14 = 138412290;
    v15 = a2;
    v10 = "Unpenalizing server %@";
  }
  _os_log_impl(&dword_22983F000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0xCu);
LABEL_19:
  v11 = *v4;
  if (*v4)
  {
    if (!*(_BYTE *)(v11 + 108))
    {
      v12 = *(_DWORD *)(a2 + 100);
      if (*(_DWORD *)(v11 + 100) <= v12)
      {
        do
        {
          v13 = v11;
          v11 = *(_QWORD *)(v11 + 24);
        }
        while (v11 && !*(_BYTE *)(v11 + 108) && *(_DWORD *)(v11 + 100) <= v12);
        v4 = (uint64_t *)(v13 + 24);
      }
    }
  }
  *(_QWORD *)(a2 + 24) = v11;
  *v4 = a2;
}

void ___mdns_resolver_start_serverless_queries_async_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 136))
  {
    v3 = *(_QWORD *)(v2 + 24);
    if (v3)
    {
      while ((*(char *)(v3 + 106) - 1) > 3)
      {
        v3 = *(_QWORD *)(v3 + 24);
        if (!v3)
          goto LABEL_14;
      }
      v4 = *(_QWORD *)(v2 + 32);
      if (v4)
      {
        do
        {
          if (!*(_QWORD *)(v4 + 72))
          {
            *(_QWORD *)(v4 + 72) = 0;
            *(_BYTE *)(v4 + 247) = 0;
            if (*(_BYTE *)(v4 + 251))
              v5 = 2000;
            else
              v5 = *(_DWORD *)(*(_QWORD *)(v4 + 64) + 124);
            *(_DWORD *)(v4 + 204) = v5;
            _mdns_querier_initiate_send(v4);
          }
          v4 = *(_QWORD *)(v4 + 56);
        }
        while (v4);
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
  }
LABEL_14:
  os_release((void *)v2);
}

void ___mdns_resolver_schedule_fast_recovery_check_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = a1[4];
  v3 = *(NSObject **)(v2 + 40);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 40));
    dispatch_release(v3);
    *(_QWORD *)(a1[4] + 40) = 0;
    v2 = a1[4];
  }
  _mdns_resolver_handle_revived_server(a1[5], v2, 0, a1[6]);
}

void _mdns_resolver_handle_revived_server(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  int v5;
  uint64_t i;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 136) && (*(char *)(a2 + 106) - 5) >= 0xFFFFFFFC)
  {
    v5 = (*(_DWORD *)(a2 + 100) - 1) >= 0x20 ? 0 : 1 << (*(_BYTE *)(a2 + 100) - 1);
    for (i = *(_QWORD *)(a1 + 32); i; i = *(_QWORD *)(i + 56))
    {
      if ((*(_DWORD *)(i + 228) & v5) == 0)
      {
        v8 = *(_QWORD *)(i + 72);
        if (*(_BYTE *)(i + 251))
        {
          if (!v8)
            goto LABEL_22;
        }
        else
        {
          if ((a3 & 1) == 0)
          {
            if (!*(_BYTE *)(a2 + 107)
              && ((*(uint64_t (**)(uint64_t))(*(_QWORD *)(i + 16) + 88))(i) & 0xFFFE) == 0x40)
            {
              continue;
            }
            v9 = *(_QWORD **)(i + 104);
            if (v9)
            {
              while (v9[4] != a2)
              {
                v9 = (_QWORD *)v9[3];
                if (!v9)
                  goto LABEL_19;
              }
              if (v9[8] - a4 > 0)
                continue;
            }
          }
LABEL_19:
          if (!v8 || v8 == a2 || *(_BYTE *)(v8 + 109))
          {
LABEL_22:
            *(_DWORD *)(i + 212) &= ~v5;
            if (_mdns_resolver_log_s_once != -1)
              dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
            v10 = _mdns_resolver_log_s_log;
            if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
            {
              v11 = *(const char **)(i + 128);
              if (!v11)
                v11 = "";
              *(_DWORD *)buf = 136446210;
              v15 = v11;
              _os_log_impl(&dword_22983F000, v10, OS_LOG_TYPE_INFO, "%{public}sRestarting querier", buf, 0xCu);
            }
            *(_QWORD *)(i + 72) = 0;
            *(_BYTE *)(i + 247) = 0;
            if (*(_BYTE *)(i + 251))
              v12 = 2000;
            else
              v12 = *(_DWORD *)(*(_QWORD *)(i + 64) + 124);
            *(_DWORD *)(i + 204) = v12;
            _mdns_querier_initiate_send(i);
          }
        }
      }
    }
  }
}

void _mdns_resolver_generate_error_event(NSObject **a1, int a2)
{
  xpc_object_t v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "error_code", a2);
  _mdns_resolver_generate_event(a1, 3, v4);
  if (v4)
    xpc_release(v4);
}

uint64_t _mdns_resolver_handle_stream_error(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  _BOOL4 v11;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 16) + 158))
  {
    v6 = mach_continuous_time();
    v7 = v6 - *(_QWORD *)(a2 + 88);
    if (mdns_mach_ticks_per_second_s_once != -1)
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
    if (v7 >= mdns_mach_ticks_per_second_s_ticks_per_second)
    {
      v8 = *(_DWORD *)(a2 + 96);
      if (*(_BYTE *)(a2 + 110))
        v9 = 1;
      else
        v9 = v8 >= 3;
      v10 = !v9;
      *(_QWORD *)(a2 + 88) = v6;
      if (v8 == -1)
      {
        v11 = 1;
      }
      else
      {
        *(_DWORD *)(a2 + 96) = v8 + 1;
        v11 = v8 > 1;
      }
      if ((v10 & v11) == 1)
        _mdns_resolver_log_server_problems(a1, a2, a3);
    }
    _mdns_resolver_check_for_problematic_servers(a1);
  }
  return *(unsigned __int8 *)(a1 + 139);
}

void _mdns_querier_handle_stream_termination(int8x8_t *a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int8x8_t v5;
  uint64_t eligible_server;
  uint64_t v7;

  v3 = *(_DWORD *)(a2 + 100) - 1;
  if (v3 < 0x20)
    v4 = ~(1 << v3);
  else
    v4 = -1;
  a1[27] = vand_s8((int8x8_t)vdup_n_s32(v4), a1[27]);
  v5 = a1[9];
  if (*(_QWORD *)&v5 != a2)
  {
    if (*(_QWORD *)&v5 || *(_QWORD *)&a1[12])
      return;
LABEL_14:
    _mdns_querier_initiate_send((uint64_t)a1);
    return;
  }
  eligible_server = _mdns_querier_get_eligible_server((uint64_t)a1);
  if (eligible_server)
  {
    if (*(_BYTE *)(eligible_server + 108))
      v7 = 0;
    else
      v7 = eligible_server;
  }
  else
  {
    v7 = 0;
  }
  _mdns_querier_set_current_server((uint64_t)a1, v7);
  if (a1[9])
    goto LABEL_14;
}

uint64_t _mdns_resolver_handle_stream_lateness(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  unsigned int v5;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 16) + 158) && a3 - *(_QWORD *)(a2 + 80) >= 1)
  {
    if (*(_BYTE *)(a2 + 110))
    {
      *(_BYTE *)(a2 + 110) = 1;
    }
    else
    {
      v5 = *(_DWORD *)(a2 + 96);
      *(_BYTE *)(a2 + 110) = 1;
      if (v5 <= 2)
        _mdns_resolver_log_server_problems(a1, a2, a4);
    }
    _mdns_resolver_check_for_problematic_servers(a1);
  }
  return *(unsigned __int8 *)(a1 + 139);
}

void _mdns_resolver_log_server_problems(uint64_t a1, uint64_t a2, const char *a3)
{
  NSObject *v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v6 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v7 = "";
    v8 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 152);
    if (a3)
      v7 = a3;
    v9 = *(unsigned __int8 *)(a2 + 110);
    v10 = *(_DWORD *)(a2 + 96);
    v11 = 136447234;
    v12 = v7;
    v13 = 1024;
    v14 = v8;
    v15 = 2112;
    v16 = a2;
    v17 = 1024;
    v18 = v9;
    v19 = 1024;
    v20 = v10;
    _os_log_error_impl(&dword_22983F000, v6, OS_LOG_TYPE_ERROR, "%{public}sHaving stream problems with %{mdns:protocol}d server %@ -- lateness: %{BOOL}d, error count: %u", (uint8_t *)&v11, 0x28u);
  }
}

uint64_t ___mdns_session_activate_block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t (**v4)(uint64_t, uint64_t, _QWORD, _QWORD);

  result = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(result + 40);
  if (v3)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(result + 40));
    dispatch_release(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    result = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(result + 88) == 1)
  {
    v4 = *(uint64_t (***)(uint64_t, uint64_t, _QWORD, _QWORD))(result + 72);
    if (*v4)
      return (*v4)(result, 2, 0, *(_QWORD *)(result + 48));
  }
  return result;
}

void _mdns_common_session_terminate_async(void *a1, int a2)
{
  _QWORD v4[5];
  int v5;

  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___mdns_common_session_terminate_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_109;
  v4[4] = a1;
  v5 = a2;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, v4);
}

void ___mdns_common_session_terminate_async_block_invoke(uint64_t a1)
{
  _mdns_common_session_finish(*(_QWORD *)(a1 + 32), 3, *(unsigned int *)(a1 + 40));
  os_release(*(void **)(a1 + 32));
}

void _mdns_common_session_finish(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**v6)(uint64_t, uint64_t, uint64_t, _QWORD);

  if (*(_BYTE *)(a1 + 88) != 3)
  {
    _mdns_session_invalidate_internal(a1);
    *(_BYTE *)(a1 + 88) = 3;
    v6 = *(void (***)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 72);
    if (*v6)
      (*v6)(a1, a2, a3, *(_QWORD *)(a1 + 48));
  }
}

void _mdns_resolver_session_handle_event(uint64_t a1, int a2, int a3, uint64_t a4)
{
  NSObject *v8;
  BOOL v9;
  os_log_type_t v10;
  int v11;
  uint64_t i;
  uint64_t v13;
  int8x8_t *j;
  _DWORD v15[2];
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v8 = _mdns_resolver_log_s_log;
  if (a3)
    v9 = a2 == 3;
  else
    v9 = 0;
  if (v9)
    v10 = OS_LOG_TYPE_ERROR;
  else
    v10 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v10))
  {
    v15[0] = 67109376;
    v15[1] = a2;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_22983F000, v8, v10, "Resolver session event -- type: %{mdns:session_event}d, error: %{mdns:err}ld", (uint8_t *)v15, 0x12u);
  }
  if ((a2 - 3) >= 2)
  {
    if (a2 == 2)
    {
      _mdns_resolver_handle_stream_lateness(a4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0);
    }
    else if (a2 == 1)
    {
      v11 = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 100) - 1) >= 0x20
          ? 0
          : 1 << (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 100) - 1);
      for (i = *(_QWORD *)(a4 + 32); i; i = *(_QWORD *)(i + 56))
      {
        if (*(_BYTE *)(i + 251))
        {
          if ((*(_DWORD *)(i + 216) & v11) != 0)
            _mdns_querier_send_query(i, a1);
        }
      }
    }
    return;
  }
  v13 = *(_QWORD *)(a4 + 24);
  if (!v13)
    return;
  while (*(_QWORD *)(v13 + 32) != a1)
  {
    v13 = *(_QWORD *)(v13 + 24);
    if (!v13)
      return;
  }
  if (a1)
  {
    _mdns_session_invalidate((_BYTE *)a1);
    os_release(*(void **)(v13 + 32));
    *(_QWORD *)(v13 + 32) = 0;
  }
  if (a2 == 3)
  {
    if (a3)
    {
      _mdns_resolver_generate_error_event((NSObject **)a4, a3);
LABEL_33:
      _mdns_resolver_handle_stream_error(a4, v13, 0);
      _mdns_resolver_penalize_server_ex(a4, v13, 0, 0, 0);
      goto LABEL_35;
    }
    if (!*(_DWORD *)(a1 + 84))
      goto LABEL_33;
  }
LABEL_35:
  for (j = *(int8x8_t **)(a4 + 32); j; j = (int8x8_t *)j[7])
  {
    if (j[31].i8[3])
      _mdns_querier_handle_stream_termination(j, v13);
  }
}

void _mdns_resolver_session_receive(uint64_t a1, NSObject *a2, uint64_t a3)
{
  _BYTE *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  __int16 v16;

  v5 = mdns_message_create_with_dispatch_data(a2);
  if (!v5)
    return;
  v6 = v5;
  v7 = *(_QWORD *)(a3 + 32);
  if (!v7)
    goto LABEL_19;
  v8 = 0;
  do
  {
    while (1)
    {
      v9 = v7;
      v7 = *(_QWORD *)(v7 + 56);
      v16 = 0;
      if (_mdns_querier_is_response_acceptable(v9, (uint64_t)v6, 0, 0, &v16))
        break;
LABEL_15:
      if (!v7)
        goto LABEL_18;
    }
    if ((v8 & 1) == 0)
    {
      if (*(_QWORD *)(v9 + 128))
        v10 = *(const char **)(v9 + 128);
      else
        v10 = "";
      _mdns_resolver_log_receive(a3, a1, v6, 1, v10, *(unsigned __int8 *)(v9 + 255));
    }
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(unsigned __int8 *)(a1 + 89);
    v13 = *(_QWORD *)(a1 + 56);
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v9 + 16) + 88))(v9);
    _mdns_resolver_note_responsiveness(a3, v11, v12, v13, v14);
    if (v16 <= 9 && ((1 << v16) & 0x209) != 0)
    {
      v8 = 1;
      _mdns_querier_conclude_ex(v9, 1, 0, v6);
      goto LABEL_15;
    }
    _mdns_querier_handle_bad_rcode(v9, v6, v16, *(_QWORD *)(a1 + 32));
    v8 = 1;
  }
  while (v7);
LABEL_18:
  if ((v8 & 1) == 0)
LABEL_19:
    _mdns_resolver_log_receive(a3, a1, v6, 0, 0, 0);
  os_release(v6);
}

void _mdns_url_session_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[14];
  if (v2)
  {
    nw_release(v2);
    a1[14] = 0;
  }
  v3 = (void *)a1[15];
  if (v3)
  {
    nw_release(v3);
    a1[15] = 0;
  }
  _mdns_url_session_forget_crypto(a1);
  v4 = (void *)a1[23];
  if (v4)
  {
    os_release(v4);
    a1[23] = 0;
  }
}

uint64_t _mdns_url_session_initialize(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t (*v5)(_QWORD *, unsigned int *);
  NSObject *v6;
  uint64_t result;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  if (*(_DWORD *)(a2[2] + 144) == 4)
    v4 = a2;
  else
    v4 = 0;
  *(_QWORD *)(a1 + 184) = v4;
  if (v4)
  {
    os_retain(v4);
    v5 = *(uint64_t (**)(_QWORD *, unsigned int *))(a2[2] + 112);
    if (v5)
    {
      v6 = v5(a2, &v14);
      result = v14;
      if (!v14)
      {
        v8 = nw_parameters_copy_url_endpoint();
        *(_QWORD *)(a1 + 112) = v8;
        if (v8)
        {
          v9 = nw_parameters_copy(v6);
          *(_QWORD *)(a1 + 120) = v9;
          v10 = nw_parameters_copy_default_protocol_stack(v9);
          nw_protocol_stack_clear_application_protocols(v10);
          if (v10)
            nw_release(v10);
          nw_parameters_set_metadata();
          nw_parameters_set_fast_open_enabled(*(nw_parameters_t *)(a1 + 120), 1);
          return v14;
        }
        else
        {
          return 4294960567;
        }
      }
    }
    else
    {
      return 4294960561;
    }
  }
  else
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v11 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_FAULT))
    {
      v12 = *(unsigned int *)(a2[2] + 144);
      if (v12 > 4)
        v13 = "<INVALID RESOLVER TYPE>";
      else
        v13 = off_24F2872E8[v12];
      *(_DWORD *)buf = 136446210;
      v16 = v13;
      _os_log_fault_impl(&dword_22983F000, v11, OS_LOG_TYPE_FAULT, "Trying to initialize an mdns_url_session using a non-https resolver of type %{public}s", buf, 0xCu);
    }
    return 4294960540;
  }
  return result;
}

uint64_t _mdns_url_session_activate(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  if (*(_QWORD *)(a1[23] + 176))
  {
    if ((unint64_t)g_pending_odoh_connection_count >= 0xA)
    {
      v1 = &g_pending_odoh_sessions;
      do
      {
        v2 = v1;
        v3 = *v1;
        v1 = (uint64_t *)(*v1 + 104);
      }
      while (v3);
      *v2 = (uint64_t)a1;
      os_retain(a1);
      _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session();
    }
    else
    {
      _mdns_url_session_activate_for_odoh(a1);
    }
  }
  else
  {
    _mdns_common_session_make_ready_async(a1);
  }
  return 0;
}

void _mdns_url_session_invalidate(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  _QWORD *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = a1[16];
  if (v2)
  {
    if (a1[17])
    {
      nw_connection_end_activity();
      nw_activity_complete_with_reason();
      v2 = a1[16];
    }
    nw_connection_cancel(v2);
    v3 = (void *)a1[16];
    if (v3)
    {
      nw_release(v3);
      a1[16] = 0;
    }
  }
  v4 = (void *)a1[17];
  if (v4)
  {
    nw_release(v4);
    a1[17] = 0;
  }
  v5 = (void *)a1[18];
  if (v5)
  {
    http_task_cancel(v5);
    a1[18] = 0;
  }
  _mdns_url_session_forget_crypto(a1);
  _mdns_url_session_handle_connection_no_longer_pending((uint64_t)a1);
  v6 = &g_active_odoh_sessions;
  do
  {
    v7 = v6;
    v8 = (_QWORD *)*v6;
    v6 = (uint64_t *)(*v6 + 104);
    if (v8)
      v9 = v8 == a1;
    else
      v9 = 1;
  }
  while (!v9);
  if (v8)
  {
    *v7 = a1[13];
    a1[13] = 0;
    os_release(a1);
    --g_active_odoh_session_count;
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v10 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = g_active_odoh_session_count;
      _os_log_debug_impl(&dword_22983F000, v10, OS_LOG_TYPE_DEBUG, "Active ODoH session count decrease: %zu", (uint8_t *)&v18, 0xCu);
    }
    v11 = g_active_odoh_session_interrupt_timer;
    if (g_active_odoh_session_interrupt_timer)
    {
      dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
      dispatch_release(v11);
      g_active_odoh_session_interrupt_timer = 0;
    }
    if (g_pending_odoh_sessions)
      _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session();
  }
  else
  {
    v12 = &g_pending_odoh_sessions;
    do
    {
      v13 = v12;
      v14 = (_QWORD *)*v12;
      v12 = (uint64_t *)(*v12 + 104);
      if (v14)
        v15 = v14 == a1;
      else
        v15 = 1;
    }
    while (!v15);
    if (v14)
    {
      *v13 = a1[13];
      a1[13] = 0;
      os_release(a1);
    }
    if (!g_pending_odoh_sessions)
    {
      v16 = g_active_odoh_session_interrupt_timer;
      if (g_active_odoh_session_interrupt_timer)
      {
        dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
        dispatch_release(v16);
        g_active_odoh_session_interrupt_timer = 0;
      }
    }
  }
  v17 = (void *)a1[23];
  if (v17)
  {
    os_release(v17);
    a1[23] = 0;
  }
}

void _mdns_url_session_send(uint64_t a1, NSObject *a2, int a3)
{
  unint64_t p_applier;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  size_t length;
  unsigned __int16 *bytes_ptr;
  void *options;
  char v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  nw_connection_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  size_t v26;
  void *v27;
  NSObject *metadata_for_request;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  const char *url;
  _QWORD *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  int v46;
  void *v47;
  __CFString *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  _QWORD *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  unsigned __int16 *v67;
  unint64_t v68;
  BOOL v69;
  uint64_t v70;
  NSObject *v71;
  int v72;
  const char *v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  int v78;
  int v79;
  uint64_t v80;
  NSObject *v81;
  uint32_t v82;
  uint64_t v83;
  char *v84;
  int v85;
  void *v86;
  int v87;
  NSObject *v88;
  void *v89;
  int v90;
  int v91;
  NSObject *v92;
  _WORD *v93;
  void *v94;
  int v95;
  int v96;
  NSObject *v97;
  dispatch_data_t v98;
  NSObject *v99;
  NSObject *v100;
  uint32_t v101;
  size_t v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  void *context;
  void *contexta;
  size_t size;
  uint64_t sizea;
  NSObject *v110;
  uint64_t v111;
  int v112;
  id v113;
  _QWORD v114[5];
  BOOL v115;
  _QWORD completion[5];
  BOOL v117;
  char v118;
  _QWORD handler[5];
  __int128 applier;
  void *v121;
  void *v122;
  id v123;
  id v124;
  uint8_t *v125;
  size_t v126;
  uint64_t v127;
  void *v128;
  uint8_t buf[8];
  uint8_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  p_applier = (unint64_t)&applier;
  v7 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    v66 = *(_QWORD *)(a1 + 112);
    LODWORD(applier) = 138412290;
    *(_QWORD *)((char *)&applier + 4) = v66;
    _os_log_debug_impl(&dword_22983F000, v7, OS_LOG_TYPE_DEBUG, "Sending message on URL %@", (uint8_t *)&applier, 0xCu);
  }
  v8 = *(_QWORD *)(a1 + 184);
  if (!v8)
  {
    v103 = 0;
    v105 = 0;
    v10 = 0;
LABEL_44:
    os_retain((void *)a1);
    v31 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    url = nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 112));
    size = *(_QWORD *)(v8 + 192);
    v114[0] = MEMORY[0x24BDAC760];
    v114[1] = 0x40000000;
    v114[2] = ___mdns_url_session_send_block_invoke_104;
    v114[3] = &__block_descriptor_tmp_106;
    v114[4] = a1;
    v115 = v10;
    v113 = v31;
    v110 = a2;
    v33 = v114;
    context = (void *)MEMORY[0x22E2D174C](v33);
    if (v10)
    {
      v34 = objc_alloc((Class)&off_255A6E220);
      v35 = objc_alloc((Class)&off_255A6E430);
      +[NSString stringWithUTF8String:](&off_255A6E8D0, "stringWithUTF8String:", url);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "initWithString:", v36);
      v38 = (void *)objc_msgSend(v34, "initWithURL:", v37);

      objc_msgSend(v38, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v38, "setHTTPBody:", v110);
      v39 = CFSTR("application/oblivious-dns-message");
    }
    else
    {
      -[NSObject base64EncodedStringWithOptions:](v110, "base64EncodedStringWithOptions:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), &stru_24F2874F0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      +[NSString stringWithFormat:](&off_255A6E8D0, "stringWithFormat:", CFSTR("%s?dns=%@"), url, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_alloc((Class)&off_255A6E220);
      v46 = a3;
      v47 = (void *)objc_msgSend(objc_alloc((Class)&off_255A6E430), "initWithString:", v44);
      v38 = (void *)objc_msgSend(v45, "initWithURL:", v47);

      a3 = v46;
      objc_msgSend(v38, "setHTTPMethod:", CFSTR("GET"));

      v39 = CFSTR("application/dns-message");
    }
    v48 = v39;
    objc_msgSend(v38, "setValue:forHTTPHeaderField:", v48, CFSTR("accept"));
    objc_msgSend(v38, "setValue:forHTTPHeaderField:", v48, CFSTR("content-type"));
    v49 = nw_endpoint_copy_interface();
    v50 = v49;
    if (v49)
    {
      +[NSString stringWithUTF8String:](&off_255A6E8D0, "stringWithUTF8String:", nw_interface_get_name(v49));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setBoundInterfaceIdentifier:", v51);

    }
    *(_QWORD *)buf = 0;
    v130 = buf;
    v131 = 0x3032000000;
    v132 = __Block_byref_object_copy__688;
    v133 = __Block_byref_object_dispose__689;
    v134 = 0;
    if (a3 == 28 || a3 == 1)
    {
      v52 = nw_activity_create();
      v53 = (void *)*((_QWORD *)v130 + 5);
      *((_QWORD *)v130 + 5) = v52;

      if (*((_QWORD *)v130 + 5))
        nw_activity_activate();
    }
    *(_QWORD *)&applier = MEMORY[0x24BDAC760];
    *((_QWORD *)&applier + 1) = 3221225472;
    v121 = __http_task_create_dns_query_block_invoke;
    v122 = &unk_24F286470;
    v125 = buf;
    v54 = v38;
    v123 = v54;
    v55 = v33;
    v124 = v55;
    _http_task_create_data_task(v54, &applier);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "set_hostOverride:", v113);
    if (v56 && *((_QWORD *)v130 + 5))
      objc_msgSend(v56, "set_nw_activity:");
    if (size)
    {
      objc_msgSend(v56, "_effectiveConfiguration");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(objc_alloc((Class)&off_255A70EE8), "_initWithConfiguration:", v57);
      v59 = *MEMORY[0x24BDB7638];
      v126 = size;
      v127 = v59;
      +[NSArray arrayWithObjects:count:](&off_255A70FF8, "arrayWithObjects:count:", &v126, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v60;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_255A6D4C0, "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "set_socketStreamProperties:", v61);

      objc_msgSend(v56, "_adoptEffectiveConfiguration:", v58);
    }

    _Block_object_dispose(buf, 8);
    objc_autoreleasePoolPop(context);

    *(_QWORD *)(a1 + 144) = v56;
    if (v56)
    {
      v63 = (void *)MEMORY[0x22E2D174C](v62);
      objc_msgSend(v56, "resume");
      objc_autoreleasePoolPop(v63);
      options = v103;
      v15 = v105;
      if (!v103)
        goto LABEL_61;
      goto LABEL_60;
    }
    os_release((void *)a1);
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    options = v103;
    v15 = v105;
    v100 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(applier) = 0;
      _os_log_error_impl(&dword_22983F000, v100, OS_LOG_TYPE_ERROR, "Failed to create HTTP task", (uint8_t *)&applier, 2u);
    }
    goto LABEL_83;
  }
  v112 = a3;
  v9 = *(_QWORD *)(v8 + 168);
  v10 = v9 != 0;
  if (!v9)
  {
    options = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_23;
  }
  length = xpc_data_get_length(*(xpc_object_t *)(v8 + 168));
  bytes_ptr = (unsigned __int16 *)xpc_data_get_bytes_ptr(*(xpc_object_t *)(v8 + 168));
  if (nw_http_oblivious_config_is_valid())
  {
    *(_QWORD *)&applier = 0;
    if (nw_endpoint_get_port(*(nw_endpoint_t *)(a1 + 112)) == 443)
    {
      nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 112));
      nw_endpoint_get_url_path();
      asprintf((char **)&applier, "/dns-query?targethost=%s&targetpath=%s");
    }
    else
    {
      nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 112));
      nw_endpoint_get_url_path();
      asprintf((char **)&applier, "/dns-query?targethost=%s:%u&targetpath=%s");
    }
    options = (void *)nw_oblivious_http_create_options();
    if ((_QWORD)applier)
    {
      free((void *)applier);
      *(_QWORD *)&applier = 0;
    }
    if (options)
    {
      v15 = 0;
      v14 = 1;
      goto LABEL_23;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v71 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
LABEL_82:
      options = 0;
      v15 = 0;
LABEL_83:
      v72 = -6700;
      goto LABEL_84;
    }
    *(_WORD *)buf = 0;
    v73 = "Failed to create oblivious http options";
    v74 = buf;
LABEL_87:
    _os_log_error_impl(&dword_22983F000, v71, OS_LOG_TYPE_ERROR, v73, v74, 2u);
    goto LABEL_82;
  }
  if (!a2 || !bytes_ptr)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v64 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_78;
    *(_WORD *)buf = 0;
    v65 = "Parameters are NULL";
LABEL_104:
    v81 = v64;
    v82 = 2;
LABEL_105:
    _os_log_error_impl(&dword_22983F000, v81, OS_LOG_TYPE_ERROR, v65, buf, v82);
    goto LABEL_78;
  }
  if (length <= 1)
  {
    if (_mdns_crypto_log_s_once == -1)
    {
LABEL_16:
      v16 = _mdns_crypto_log_s_log;
      if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      {
LABEL_77:
        v64 = _mdns_crypto_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
        {
LABEL_78:
          v70 = _mdns_resolver_log_s_once;
LABEL_79:
          if (v70 != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v71 = _mdns_resolver_log_s_log;
          if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
            goto LABEL_82;
          LOWORD(applier) = 0;
          v73 = "Failed to create oblivious request";
          v74 = (uint8_t *)&applier;
          goto LABEL_87;
        }
        *(_WORD *)buf = 0;
        v65 = "Failed to parse supported config";
        goto LABEL_104;
      }
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)(p_applier + 164) = length;
      _os_log_error_impl(&dword_22983F000, v16, OS_LOG_TYPE_ERROR, "Config length is too short: %zu", buf, 0xCu);
LABEL_75:
      if (_mdns_crypto_log_s_once != -1)
        dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
      goto LABEL_77;
    }
LABEL_138:
    dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    goto LABEL_16;
  }
  p_applier = bswap32(*bytes_ptr) >> 16;
  if (length - 2 == p_applier)
  {
    v67 = bytes_ptr + 1;
    while (!mdns_odoh_config_is_valid_inner(v67, p_applier))
    {
      if (p_applier >= 4)
      {
        v68 = bswap32(v67[1]) >> 16;
        v67 = (unsigned __int16 *)((char *)v67 + v68);
        v69 = p_applier > v68;
        p_applier -= v68;
        if (v69)
          continue;
      }
      goto LABEL_75;
    }
    if (!v67)
      goto LABEL_75;
  }
  else if (!mdns_odoh_config_is_valid_inner(bytes_ptr, length))
  {
    goto LABEL_75;
  }
  v111 = cchpke_params_x25519_AESGCM128_HKDF_SHA256();
  v75 = cchpke_params_sizeof_kdf_hash();
  v76 = ccsha256_di();
  if (!v75)
    goto LABEL_137;
  length = v76;
  v77 = malloc_type_calloc(1uLL, v75, 0xF1748037uLL);
  if (!v77)
    goto LABEL_137;
  p_applier = (unint64_t)v77;
  v78 = cchkdf_extract();
  if (v78)
  {
    v79 = v78;
    free((void *)p_applier);
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v80 = _mdns_crypto_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_78;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v79;
    v65 = "Extract error: %d";
    v81 = v80;
    v82 = 8;
    goto LABEL_105;
  }
  v102 = dispatch_data_get_size(a2);
  v101 = arc4random_uniform(0x10u);
  sizea = v102 + v101 + 4;
  length = v111;
  v104 = cchpke_params_sizeof_aead_tag();
  v83 = sizea + v104 + cchpke_params_sizeof_kem_enc();
  if (v75 + v83 == -5)
    goto LABEL_137;
  length = 1;
  v84 = (char *)malloc_type_calloc(1uLL, v75 + v83 + 5, 0xF1748037uLL);
  if (!v84)
    goto LABEL_137;
  *v84 = 1;
  *(_WORD *)(v84 + 1) = bswap32(v75) >> 16;
  length = (size_t)v84;
  v85 = cchkdf_expand();
  v86 = (void *)p_applier;
  v87 = v85;
  free(v86);
  if (v87)
  {
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v88 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v87;
      _os_log_error_impl(&dword_22983F000, v88, OS_LOG_TYPE_ERROR, "Expand error: %d", buf, 8u);
    }
    goto LABEL_121;
  }
  contexta = (void *)length;
  p_applier = length + v75 + 3;
  *(_WORD *)p_applier = bswap32(v83) >> 16;
  v89 = malloc_type_calloc(1uLL, 0x60uLL, 0xF1748037uLL);
  if (!v89)
    goto LABEL_137;
  length = (size_t)v89;
  LODWORD(v128) = 0;
  ccrng();
  v90 = cchpke_initiator_setup();
  if (v90)
  {
    v91 = v90;
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v92 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v91;
      _os_log_error_impl(&dword_22983F000, v92, OS_LOG_TYPE_ERROR, "Setup error: %d", buf, 8u);
    }
LABEL_120:
    free(contexta);
LABEL_121:
    free((void *)length);
    goto LABEL_78;
  }
  p_applier = v102 + v101 + 4;
  if (v102 + v101 == -4 || (v93 = malloc_type_calloc(1uLL, sizea, 0xF1748037uLL)) == 0)
  {
LABEL_137:
    __break(1u);
    goto LABEL_138;
  }
  v94 = v93;
  *v93 = bswap32(v102) >> 16;
  *(_WORD *)((char *)v93 + v102 + 2) = bswap32(v101) >> 16;
  *(_QWORD *)&applier = MEMORY[0x24BDAC760];
  *((_QWORD *)&applier + 1) = 0x40000000;
  v121 = __mdns_encrypt_oblivious_request_block_invoke;
  v122 = &__block_descriptor_tmp_25;
  v123 = v93 + 1;
  dispatch_data_apply(a2, &applier);
  v95 = cchpke_initiator_encrypt();
  if (v95)
  {
    v96 = v95;
    if (_mdns_crypto_log_s_once != -1)
      dispatch_once(&_mdns_crypto_log_s_once, &__block_literal_global_22);
    v97 = _mdns_crypto_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_crypto_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v96;
      _os_log_error_impl(&dword_22983F000, v97, OS_LOG_TYPE_ERROR, "Encrypt error: %d", buf, 8u);
    }
    free(v94);
    goto LABEL_120;
  }
  *(_QWORD *)(a1 + 152) = length;
  *(_QWORD *)(a1 + 160) = 96;
  *(_QWORD *)(a1 + 168) = v94;
  *(_QWORD *)(a1 + 176) = sizea;
  v98 = dispatch_data_create(contexta, v75 + v83 + 5, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
  v70 = _mdns_resolver_log_s_once;
  if (!v98)
    goto LABEL_79;
  v15 = v98;
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v99 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(applier) = 0;
    _os_log_debug_impl(&dword_22983F000, v99, OS_LOG_TYPE_DEBUG, "Created oblivious request", (uint8_t *)&applier, 2u);
  }
  options = 0;
  v14 = 0;
  a2 = v15;
LABEL_23:
  if (!*(_QWORD *)(v8 + 176))
  {
    v103 = options;
    v105 = v15;
    a3 = v112;
    goto LABEL_44;
  }
  nw_parameters_clear_custom_proxy_configs();
  nw_parameters_add_custom_proxy_config();
  if (options)
  {
    v17 = nw_parameters_copy_default_protocol_stack(*(nw_parameters_t *)(a1 + 120));
    nw_protocol_stack_clear_application_protocols(v17);
    nw_protocol_stack_append_application_protocol();
    if (v17)
      nw_release(v17);
  }
  v18 = nw_connection_create(*(nw_endpoint_t *)(a1 + 112), *(nw_parameters_t *)(a1 + 120));
  *(_QWORD *)(a1 + 128) = v18;
  if (!v18)
  {
    v72 = -6729;
LABEL_84:
    _mdns_common_session_terminate_async((void *)a1, v72);
    if (!options)
      goto LABEL_61;
LABEL_60:
    nw_release(options);
    goto LABEL_61;
  }
  os_retain((void *)a1);
  v19 = *(NSObject **)(a1 + 128);
  v20 = options;
  v21 = v15;
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  nw_connection_set_queue(v19, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  v22 = *(NSObject **)(a1 + 128);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = ___mdns_url_session_send_block_invoke;
  handler[3] = &__block_descriptor_tmp_91;
  handler[4] = a1;
  nw_connection_set_state_changed_handler(v22, handler);
  v24 = (void *)MEMORY[0x22E2D1248](v23);
  if (v9)
    v25 = "Oblivious Message";
  else
    v25 = "HTTP Message";
  nw_http_fields_set_value_by_name();
  nw_http_fields_set_value_by_name();
  v26 = dispatch_data_get_size(a2);
  snprintf((char *)&applier, 0x80uLL, "%zu", v26);
  nw_http_fields_set_value_by_name();
  nw_endpoint_get_url(*(nw_endpoint_t *)(a1 + 112));
  v27 = (void *)nw_http_request_create_from_url();
  nw_http_request_set_header_fields();
  metadata_for_request = nw_http_create_metadata_for_request();
  if (v27)
    nw_release(v27);
  v29 = nw_content_context_create(v25);
  nw_content_context_set_metadata_for_protocol(v29, metadata_for_request);
  if (metadata_for_request)
    nw_release(metadata_for_request);
  v15 = v21;
  if (v24)
    nw_release(v24);
  nw_content_context_set_is_final(v29, 1);
  nw_connection_send(*(nw_connection_t *)(a1 + 128), a2, v29, 1, (nw_connection_send_completion_t)*MEMORY[0x24BDE0838]);
  options = v20;
  if (v29)
    nw_release(v29);
  nw_connection_start(*(nw_connection_t *)(a1 + 128));
  *(_QWORD *)(a1 + 136) = _mdns_create_and_start_connection_activity(*(_QWORD *)(a1 + 128), v112);
  v30 = *(NSObject **)(a1 + 128);
  completion[0] = MEMORY[0x24BDAC760];
  completion[1] = 0x40000000;
  completion[2] = ___mdns_url_session_send_block_invoke_96;
  completion[3] = &__block_descriptor_tmp_103;
  completion[4] = a1;
  v117 = v9 != 0;
  v118 = v14;
  nw_connection_receive_message(v30, completion);
  if (v20)
    goto LABEL_60;
LABEL_61:
  if (v15)
    dispatch_release(v15);
}

void sub_229869774(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void ___mdns_url_session_send_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 128))
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v7 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v8 = nw_connection_state_to_string();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
      v10 = 136315650;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = a3;
      _os_log_debug_impl(&dword_22983F000, v7, OS_LOG_TYPE_DEBUG, "Connection state changed to %s for connection %@ error %@", (uint8_t *)&v10, 0x20u);
    }
    switch(a2)
    {
      case 3:
        _mdns_url_session_handle_connection_no_longer_pending(*(_QWORD *)(a1 + 32));
        break;
      case 4:
        _mdns_common_session_finish(*(_QWORD *)(a1 + 32), 3, 4294960543);
        break;
      case 5:
        v5 = *(_QWORD *)(a1 + 32);
LABEL_10:
        _mdns_url_session_handle_connection_no_longer_pending(v5);
        os_release(*(void **)(a1 + 32));
        break;
    }
  }
  else if (a2 == 5)
  {
    goto LABEL_10;
  }
}

uint64_t _mdns_create_and_start_connection_activity(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2 != 1 && a2 != 28)
    return 0;
  v2 = nw_activity_create();
  if (v2)
    nw_connection_start_activity();
  return v2;
}

void ___mdns_url_session_send_block_invoke_96(uint64_t a1, uint64_t error_code, NSObject *a3, uint64_t a4, NSObject *a5)
{
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  char v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint8_t buf[4];
  _QWORD v29[3];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
    return;
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v9 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v30) = 134217984;
    *(_QWORD *)((char *)&v30 + 4) = error_code;
    _os_log_debug_impl(&dword_22983F000, v9, OS_LOG_TYPE_DEBUG, "Received data %p", (uint8_t *)&v30, 0xCu);
  }
  *(_QWORD *)&v30 = 0;
  *((_QWORD *)&v30 + 1) = &v30;
  v31 = 0x2000000000;
  v32 = 0;
  if (a3)
  {
    v10 = nw_protocol_copy_http_definition();
    a3 = nw_content_context_copy_protocol_metadata(a3, v10);
    if (v10)
      nw_release(v10);
    if (a3)
    {
      v11 = (void *)nw_http_metadata_copy_response();
      nw_release(a3);
      if (v11)
      {
        LODWORD(a3) = nw_http_response_get_status_code();
        v12 = (void *)nw_http_response_copy_header_fields();
        nw_http_fields_access_value_by_name();
        if (v12)
          nw_release(v12);
        nw_release(v11);
      }
      else
      {
        LODWORD(a3) = 0;
      }
    }
  }
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v13 = _mdns_resolver_log_s_log;
  if ((_DWORD)a3 != 200 || error_code == 0)
    v15 = OS_LOG_TYPE_INFO;
  else
    v15 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, v15))
  {
    v16 = "";
    if (!error_code)
      v16 = "out";
    *(_DWORD *)buf = 67109378;
    LODWORD(v29[0]) = (_DWORD)a3;
    WORD2(v29[0]) = 2082;
    *(_QWORD *)((char *)v29 + 6) = v16;
    _os_log_impl(&dword_22983F000, v13, v15, "Received HTTP status %u with%{public}s body", buf, 0x12u);
  }
  if (error_code)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (*(_BYTE *)(a1 + 41))
      {
        v17 = 0;
      }
      else
      {
        error_code = (uint64_t)mdns_decrypt_oblivious_response(error_code, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(const void **)(*(_QWORD *)(a1 + 32) + 168), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v21 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29[0] = error_code;
          _os_log_debug_impl(&dword_22983F000, v21, OS_LOG_TYPE_DEBUG, "Decrypted %@", buf, 0xCu);
        }
        v17 = error_code;
        if (!error_code)
        {
          v19 = 0;
          v18 = 0;
          error_code = 4294960520;
          goto LABEL_47;
        }
      }
      v22 = *(NSObject **)(*((_QWORD *)&v30 + 1) + 24);
      if (v22)
        _mdns_https_resolver_set_client_address(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), v22);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(v23 + 184);
      if (!*(_BYTE *)(v24 + 230))
      {
        *(_BYTE *)(v24 + 230) = 1;
        _mdns_resolver_generate_error_event((NSObject **)v24, 0);
        v23 = *(_QWORD *)(a1 + 32);
      }
      _mdns_common_session_invoke_receive(v23, error_code);
      if (v17)
        dispatch_release(v17);
    }
    else
    {
      v20 = *(NSObject **)(*((_QWORD *)&v30 + 1) + 24);
      if (v20)
        _mdns_https_resolver_set_client_address(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), v20);
      _mdns_common_session_invoke_receive(*(_QWORD *)(a1 + 32), error_code);
    }
    error_code = 0;
    v19 = 1;
    v18 = 1;
  }
  else
  {
    v18 = 0;
    v19 = 1;
  }
LABEL_47:
  v25 = *(void **)(*((_QWORD *)&v30 + 1) + 24);
  if (v25)
  {
    nw_release(v25);
    *(_QWORD *)(*((_QWORD *)&v30 + 1) + 24) = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    nw_connection_end_activity();
    nw_activity_complete_with_reason();
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    if (v26)
    {
      nw_release(v26);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
    }
  }
  if ((v18 & 1) != 0)
  {
    v27 = v19 ^ 1;
    if (!a5)
      v27 = 1;
    if ((v27 & 1) == 0)
      error_code = nw_error_get_error_code(a5);
  }
  else
  {
    if ((_DWORD)a3 == 401)
    {
      error_code = 4294960520;
    }
    else if ((_DWORD)a3)
    {
      error_code = 4294960560;
    }
    else if (a5)
    {
      error_code = nw_error_get_error_code(a5);
    }
    else
    {
      error_code = 4294960543;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) + 230) = 0;
  }
  _mdns_common_session_finish(*(_QWORD *)(a1 + 32), 3, error_code);
  _Block_object_dispose(&v30, 8);
}

void ___mdns_url_session_send_block_invoke_104(uint64_t a1, NSObject *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  unsigned int Code;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 144))
  {
    v9 = *(unsigned __int8 *)(a1 + 40);
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v10 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = (uint64_t)a2;
      _os_log_debug_impl(&dword_22983F000, v10, OS_LOG_TYPE_DEBUG, "Received response %@", (uint8_t *)&v15, 0xCu);
      if (a2)
      {
LABEL_6:
        if (v9)
        {
          v11 = mdns_decrypt_oblivious_response(a2, *(_QWORD *)(v4 + 152), *(_QWORD *)(v4 + 160), *(const void **)(v4 + 168), *(_QWORD *)(v4 + 176));
          if (_mdns_resolver_log_s_once != -1)
            dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
          v12 = _mdns_resolver_log_s_log;
          if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
          {
            v15 = 138412290;
            v16 = (uint64_t)v11;
            _os_log_debug_impl(&dword_22983F000, v12, OS_LOG_TYPE_DEBUG, "Decrypted response %@", (uint8_t *)&v15, 0xCu);
          }
          a2 = v11;
          if (!v11)
          {
            if (a3 == 401)
              a4 = 4294960520;
            else
              a4 = 4294960519;
LABEL_29:
            _mdns_common_session_finish(*(_QWORD *)(a1 + 32), 3, a4);
            v4 = *(_QWORD *)(a1 + 32);
            goto LABEL_30;
          }
        }
        else
        {
          v11 = 0;
        }
        _mdns_common_session_invoke_receive(v4, (uint64_t)a2);
        if (!a4)
        {
LABEL_27:
          if (v11)
            dispatch_release(v11);
          goto LABEL_29;
        }
LABEL_20:
        if (_mdns_resolver_log_s_once != -1)
          dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
        v13 = _mdns_resolver_log_s_log;
        if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v15 = 138412290;
          v16 = a4;
          _os_log_error_impl(&dword_22983F000, v13, OS_LOG_TYPE_ERROR, "Got error %@", (uint8_t *)&v15, 0xCu);
        }
        Code = CFErrorGetCode((CFErrorRef)a4);
        if (Code)
          a4 = Code;
        else
          a4 = 4294960596;
        goto LABEL_27;
      }
    }
    else if (a2)
    {
      goto LABEL_6;
    }
    v11 = 0;
    if (!a4)
      goto LABEL_27;
    goto LABEL_20;
  }
LABEL_30:
  os_release((void *)v4);
}

void _mdns_common_session_invoke_receive(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  void (*v6)(uint64_t, uint64_t, _QWORD);

  if (*(_BYTE *)(a1 + 88) == 1)
  {
    v4 = *(NSObject **)(a1 + 40);
    if (v4)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
      dispatch_release(v4);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v5 = *(_DWORD *)(a1 + 84);
    if (v5 != -1)
      *(_DWORD *)(a1 + 84) = v5 + 1;
    v6 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 72) + 8);
    if (v6)
      v6(a1, a2, *(_QWORD *)(a1 + 48));
  }
}

void ___mdns_url_session_send_block_invoke_98(uint64_t a1, char *hostname)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nw_endpoint_create_host(hostname, "0");
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v3 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_22983F000, v3, OS_LOG_TYPE_DEBUG, "Received client address %@", (uint8_t *)&v5, 0xCu);
  }
}

const sockaddr *_mdns_https_resolver_set_client_address(uint64_t a1, nw_endpoint_t endpoint)
{
  sockaddr *v2;
  const sockaddr *result;
  int sa_family;
  sockaddr v5;

  *(_QWORD *)(a1 + 200) = 0;
  v2 = (sockaddr *)(a1 + 200);
  *(_DWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  result = nw_endpoint_get_address(endpoint);
  if (result)
  {
    sa_family = result->sa_family;
    if (sa_family == 30)
    {
      v5 = *result;
      *(_OWORD *)&v2->sa_data[10] = *(_OWORD *)&result->sa_data[10];
    }
    else
    {
      if (sa_family != 2)
        return result;
      v5 = *result;
    }
    *v2 = v5;
  }
  return result;
}

void _mdns_url_session_handle_connection_no_longer_pending(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  BOOL v3;

  if (*(_BYTE *)(a1 + 192))
  {
    v1 = --g_pending_odoh_connection_count;
    *(_BYTE *)(a1 + 192) = 0;
    v2 = g_pending_odoh_sessions;
    if (g_pending_odoh_sessions)
      v3 = v1 > 9;
    else
      v3 = 1;
    if (!v3)
    {
      g_pending_odoh_sessions = *(_QWORD *)(g_pending_odoh_sessions + 104);
      *(_QWORD *)(v2 + 104) = 0;
      _mdns_url_session_activate_for_odoh((_BYTE *)v2);
      os_release((void *)v2);
    }
  }
}

void _mdns_url_session_activate_for_odoh(_BYTE *object)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  object[192] = 1;
  ++g_pending_odoh_connection_count;
  v2 = &g_active_odoh_sessions;
  do
  {
    v3 = v2;
    v4 = *v2;
    v2 = (uint64_t *)(*v2 + 104);
  }
  while (v4);
  *v3 = (uint64_t)object;
  os_retain(object);
  *((_QWORD *)object + 12) = mach_continuous_time();
  ++g_active_odoh_session_count;
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v5 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = g_active_odoh_session_count;
    _os_log_debug_impl(&dword_22983F000, v5, OS_LOG_TYPE_DEBUG, "Active ODoH session count increase: %zu", (uint8_t *)&v6, 0xCu);
  }
  _mdns_common_session_make_ready_async(object);
}

void _mdns_common_session_make_ready_async(void *a1)
{
  _QWORD block[5];

  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___mdns_common_session_make_ready_async_block_invoke;
  block[3] = &__block_descriptor_tmp_87_1323;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void ___mdns_common_session_make_ready_async_block_invoke(uint64_t a1)
{
  _mdns_common_session_invoke_ready_event_handler(*(_QWORD *)(a1 + 32));
  os_release(*(void **)(a1 + 32));
}

uint64_t _mdns_common_session_invoke_ready_event_handler(uint64_t result)
{
  uint64_t (**v1)(uint64_t, uint64_t, _QWORD, _QWORD);

  if (*(_BYTE *)(result + 88) == 1 && !*(_BYTE *)(result + 90))
  {
    *(_BYTE *)(result + 90) = 1;
    v1 = *(uint64_t (***)(uint64_t, uint64_t, _QWORD, _QWORD))(result + 72);
    if (*v1)
      return (*v1)(result, 1, 0, *(_QWORD *)(result + 48));
  }
  return result;
}

void _mdns_url_session_forget_crypto(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)a1[19];
  if (v2)
  {
    memset_s(v2, a1[20], 0, a1[20]);
    v3 = (void *)a1[19];
    if (v3)
    {
      free(v3);
      a1[19] = 0;
    }
  }
  a1[20] = 0;
  v4 = (void *)a1[21];
  if (v4)
  {
    memset_s(v4, a1[22], 0, a1[22]);
    v5 = (void *)a1[21];
    if (v5)
    {
      free(v5);
      a1[21] = 0;
    }
  }
  a1[22] = 0;
}

void _mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session()
{
  _QWORD *v0;
  BOOL v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD handler[5];

  v0 = (_QWORD *)g_active_odoh_sessions;
  if (g_active_odoh_sessions)
    v1 = g_active_odoh_session_interrupt_timer == 0;
  else
    v1 = 0;
  if (v1)
  {
    v2 = mach_continuous_time() - v0[12];
    if (mdns_mach_ticks_per_second_s_once != -1)
      dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
    if (v2 / mdns_mach_ticks_per_second_s_ticks_per_second > 9)
      v3 = 0;
    else
      v3 = 10000
         - (1000 * (v2 % mdns_mach_ticks_per_second_s_ticks_per_second) / mdns_mach_ticks_per_second_s_ticks_per_second
          + 1000 * (v2 / mdns_mach_ticks_per_second_s_ticks_per_second));
    g_active_odoh_session_interrupt_timer = (uint64_t)_mdns_resolver_create_oneshot_timer(v3, 5u);
    if (g_active_odoh_session_interrupt_timer)
    {
      os_retain(v0);
      v4 = MEMORY[0x24BDAC760];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke;
      handler[3] = &__block_descriptor_tmp_85;
      handler[4] = v0;
      dispatch_source_set_event_handler((dispatch_source_t)g_active_odoh_session_interrupt_timer, handler);
      v5[0] = v4;
      v5[1] = 0x40000000;
      v5[2] = ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke_2;
      v5[3] = &__block_descriptor_tmp_86;
      v5[4] = v0;
      dispatch_source_set_cancel_handler((dispatch_source_t)g_active_odoh_session_interrupt_timer, v5);
      dispatch_activate((dispatch_object_t)g_active_odoh_session_interrupt_timer);
    }
  }
}

void ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = g_active_odoh_session_interrupt_timer;
  if (g_active_odoh_session_interrupt_timer)
  {
    dispatch_source_cancel((dispatch_source_t)g_active_odoh_session_interrupt_timer);
    dispatch_release(v2);
    g_active_odoh_session_interrupt_timer = 0;
  }
  _mdns_common_session_finish(*(_QWORD *)(a1 + 32), 4, 0);
}

void ___mdns_url_session_schedule_interrupt_for_oldest_active_odoh_session_block_invoke_2(uint64_t a1)
{
  os_release(*(void **)(a1 + 32));
}

uint64_t _mdns_udp_socket_session_init(uint64_t result)
{
  *(_DWORD *)(result + 136) = -1;
  return result;
}

uint64_t _mdns_udp_socket_session_finalize(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 136);
  if ((result & 0x80000000) == 0)
  {
    result = close(result);
    *(_DWORD *)(a1 + 136) = -1;
  }
  return result;
}

uint64_t _mdns_udp_socket_session_initialize(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, unsigned __int8 *a5)
{
  const sockaddr *address;
  int sa_family;
  const sockaddr *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
  uint32_t v19;
  int v20;
  unsigned int v21;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  int v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  int v36;
  NSObject *v37;
  const char *v38;
  int v39;
  int v40;
  __int128 v41;
  int v42;
  int v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  size_t v48;
  _DWORD *v50;
  const sockaddr *v51;
  int v52;
  audit_token_t v53[32];
  _QWORD v54[2];
  uint8_t buf[4];
  _BYTE v56[10];
  unsigned int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  address = nw_endpoint_get_address(*(nw_endpoint_t *)(*(_QWORD *)(a1 + 32) + 48));
  sa_family = address->sa_family;
  if (sa_family != 30 && sa_family != 2)
    return 4294960540;
  v12 = address;
  v54[0] = 0;
  v54[1] = 0;
  if (sa_family == 30)
  {
    if (*(_DWORD *)&address->sa_data[6] || *(_DWORD *)&address->sa_data[10])
      goto LABEL_9;
    v35 = *(_DWORD *)&address[1].sa_len;
    if (v35)
    {
      if (v35 == -65536)
      {
        v36 = *(_DWORD *)&address[1].sa_data[2];
LABEL_139:
        LOWORD(v54[0]) = 528;
        WORD1(v54[0]) = *(_WORD *)address->sa_data;
        HIDWORD(v54[0]) = v36;
        v12 = (const sockaddr *)v54;
        sa_family = 2;
        goto LABEL_10;
      }
    }
    else
    {
      v36 = *(_DWORD *)&address[1].sa_data[2];
      if ((v36 | 0x1000000) != 0x1000000)
        goto LABEL_139;
    }
LABEL_9:
    sa_family = 30;
  }
LABEL_10:
  if (sa_family == 2)
    v13 = 2;
  else
    v13 = 30;
  v14 = socket(v13, 2, 17);
  if (v14 < 0)
  {
    if (*__error())
    {
      v16 = *__error();
      if (!(_DWORD)v16)
        goto LABEL_16;
    }
    else
    {
      v16 = 4294960596;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v33 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v53[0].val[0] = 134217984;
      *(_QWORD *)&v53[0].val[1] = (int)v16;
      _os_log_error_impl(&dword_22983F000, v33, OS_LOG_TYPE_ERROR, "Failed to create UDP socket: %{darwin.errno}ld", (uint8_t *)v53, 0xCu);
    }
    return v16;
  }
LABEL_16:
  v52 = 1;
  if (sa_family == 2)
  {
    if (!setsockopt(v14, 0xFFFF, 4226, &v52, 4u))
      goto LABEL_43;
    if (*__error())
    {
      v15 = *__error();
      if (!v15)
        goto LABEL_43;
    }
    else
    {
      v15 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v34 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v53[0].val[0] = 67109120;
      v53[0].val[1] = v15;
      _os_log_error_impl(&dword_22983F000, v34, OS_LOG_TYPE_ERROR, "setsockopt() for SOL_SOCKET/SO_RANDOMPORT failed %{darwin.errno}d", (uint8_t *)v53, 8u);
    }
  }
  else
  {
    v50 = a4;
    v51 = v12;
    v17 = a5;
    v18 = 0;
    *(_QWORD *)&v53[0].val[2] = 0;
    *(_QWORD *)&v53[0].val[4] = 0;
    v53[0].val[6] = 0;
    *(_QWORD *)v53[0].val = 7708;
    *(_OWORD *)&v53[0].val[2] = *MEMORY[0x24BDAE878];
    while (1)
    {
      v19 = arc4random() | 0xFFFFC000;
      HIWORD(v53[0].val[0]) = bswap32(v19) >> 16;
      if (!bind(v14, (const sockaddr *)v53, 0x1Cu))
      {
        v20 = 0;
        goto LABEL_32;
      }
      if (!*__error())
        break;
      v20 = *__error();
      v21 = v18 + 1;
      if (v20 != 48 || v18++ >= 0x270F)
        goto LABEL_33;
    }
    v20 = -6700;
LABEL_32:
    v21 = v18 + 1;
LABEL_33:
    if (v20)
    {
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v23 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v56 = v20;
        *(_WORD *)&v56[8] = 1024;
        v57 = v21;
        _os_log_error_impl(&dword_22983F000, v23, OS_LOG_TYPE_ERROR, "Binding IPv6 socket to random port failed -- error: %{mdns:err}ld, tries: %d", buf, 0x12u);
      }
    }
    else
    {
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v24 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v56 = (unsigned __int16)v19;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v21;
        _os_log_debug_impl(&dword_22983F000, v24, OS_LOG_TYPE_DEBUG, "Binding IPv6 socket to random port succeeded -- port: %u, tries: %d", buf, 0xEu);
      }
    }
    a5 = v17;
    a4 = v50;
    v12 = v51;
  }
LABEL_43:
  if (!setsockopt(v14, 0xFFFF, 4130, &v52, 4u))
    goto LABEL_52;
  if (*__error())
  {
    v25 = *__error();
    if (!v25)
      goto LABEL_52;
  }
  else
  {
    v25 = -6700;
  }
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v26 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v25;
    _os_log_error_impl(&dword_22983F000, v26, OS_LOG_TYPE_ERROR, "setsockopt() for SOL_SOCKET/SO_NOSIGPIPE failed %{darwin.errno}d", (uint8_t *)v53, 8u);
  }
LABEL_52:
  if (setsockopt(v14, 0xFFFF, 0x10000, &v52, 4u))
  {
    if (*__error())
    {
      v27 = *__error();
      if (!v27)
        goto LABEL_61;
    }
    else
    {
      v27 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v28 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v53[0].val[0] = 67109120;
      v53[0].val[1] = v27;
      _os_log_error_impl(&dword_22983F000, v28, OS_LOG_TYPE_ERROR, "setsockopt() for SOL_SOCKET/SO_NOWAKEFROMSLEEP failed %{darwin.errno}d", (uint8_t *)v53, 8u);
    }
  }
LABEL_61:
  v29 = fcntl(v14, 3, 0);
  if (fcntl(v14, 4, v29 | 4u) == -1 && *__error())
    __error();
  v30 = *(NSObject **)(a2 + 48);
  if (v30)
  {
    *(_DWORD *)buf = 0;
    *(_DWORD *)buf = nw_interface_get_index(v30);
    if (sa_family == 2)
    {
      if (!setsockopt(v14, 0, 25, buf, 4u))
        goto LABEL_96;
      if (*__error())
      {
        v31 = *__error();
        if (!v31)
          goto LABEL_96;
      }
      else
      {
        v31 = -6700;
      }
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v37 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v53[0].val[0] = 67109120;
        v53[0].val[1] = v31;
        v38 = "setsockopt() for IPPROTO_IP/IP_BOUND_IF failed %{darwin.errno}d";
        goto LABEL_141;
      }
    }
    else
    {
      if (!setsockopt(v14, 41, 125, buf, 4u))
        goto LABEL_96;
      if (*__error())
      {
        v32 = *__error();
        if (!v32)
          goto LABEL_96;
      }
      else
      {
        v32 = -6700;
      }
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v37 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v53[0].val[0] = 67109120;
        v53[0].val[1] = v32;
        v38 = "setsockopt() for IPPROTO_IPV6/IPV6_BOUND_IF failed %{darwin.errno}d";
LABEL_141:
        _os_log_error_impl(&dword_22983F000, v37, OS_LOG_TYPE_ERROR, v38, (uint8_t *)v53, 8u);
        if (!a4)
          goto LABEL_126;
        goto LABEL_97;
      }
    }
  }
LABEL_96:
  if (!a4)
    goto LABEL_126;
LABEL_97:
  v39 = a4[4];
  if (v39 == 3)
  {
    v41 = *(_OWORD *)(*(_QWORD *)a4 + 40);
    *(_OWORD *)v53[0].val = *(_OWORD *)(*(_QWORD *)a4 + 24);
    *(_OWORD *)&v53[0].val[4] = v41;
    *(_DWORD *)buf = audit_token_to_pid(v53);
    if (!setsockopt(v14, 0xFFFF, 4359, buf, 4u))
      goto LABEL_126;
    if (*__error())
    {
      v42 = *__error();
      if (!v42)
        goto LABEL_126;
    }
    else
    {
      v42 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v44 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_126;
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v42;
    v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED failed %{darwin.errno}d";
LABEL_144:
    _os_log_error_impl(&dword_22983F000, v44, OS_LOG_TYPE_ERROR, v45, (uint8_t *)v53, 8u);
    goto LABEL_126;
  }
  if (v39 == 2)
  {
    if (!setsockopt(v14, 0xFFFF, 4360, a4, 0x10u))
      goto LABEL_126;
    if (*__error())
    {
      v43 = *__error();
      if (!v43)
        goto LABEL_126;
    }
    else
    {
      v43 = -6700;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v44 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_126;
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v43;
    v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED_UUID failed %{darwin.errno}d";
    goto LABEL_144;
  }
  if (v39 != 1 || !setsockopt(v14, 0xFFFF, 4359, a4, 4u))
    goto LABEL_126;
  if (!*__error())
  {
    v40 = -6700;
LABEL_113:
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v44 = _mdns_resolver_log_s_log;
    if (!os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      goto LABEL_126;
    v53[0].val[0] = 67109120;
    v53[0].val[1] = v40;
    v45 = "setsockopt() for SOL_SOCKET/SO_DELEGATED failed %{darwin.errno}d";
    goto LABEL_144;
  }
  v40 = *__error();
  if (v40)
    goto LABEL_113;
LABEL_126:
  if (!a5)
  {
LABEL_133:
    if (sa_family == 2)
      v48 = 16;
    else
      v48 = 28;
    memcpy((void *)(a1 + 104), v12, v48);
    v16 = 0;
    *(_DWORD *)(a1 + 132) = v48;
    *(_DWORD *)(a1 + 136) = v14;
    return v16;
  }
  v46 = DomainNameToString(a5, 0, (unsigned __int8 *)v53, 0);
  if (!(_DWORD)v46)
  {
    if ((ne_session_set_socket_attributes() & 1) == 0)
    {
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v47 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v56 = v53;
        _os_log_error_impl(&dword_22983F000, v47, OS_LOG_TYPE_ERROR, "ne_session_set_socket_attributes() failed for '%s'", buf, 0xCu);
      }
    }
    goto LABEL_133;
  }
  v16 = v46;
  if ((v14 & 0x80000000) == 0)
    close(v14);
  return v16;
}

uint64_t _mdns_udp_socket_session_activate(uint64_t a1)
{
  uintptr_t v2;
  dispatch_source_t v3;

  v2 = *(int *)(a1 + 136);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  v3 = dispatch_source_create(MEMORY[0x24BDACA00], v2, 0, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  *(_QWORD *)(a1 + 96) = v3;
  if (!v3)
    return 4294960567;
  os_retain((void *)a1);
  dispatch_set_context(*(dispatch_object_t *)(a1 + 96), (void *)a1);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 96), (dispatch_function_t)_mdns_udp_socket_session_read_handler);
  dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 96), (dispatch_function_t)_mdns_udp_socket_session_cancel_handler);
  dispatch_activate(*(dispatch_object_t *)(a1 + 96));
  return 0;
}

void _mdns_udp_socket_session_invalidate(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 96);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 96));
    dispatch_release(v1);
    *(_QWORD *)(a1 + 96) = 0;
  }
}

void _mdns_udp_socket_session_send(uint64_t a1, dispatch_data_t data)
{
  dispatch_data_t v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  size_t v8;
  void *buffer_ptr;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  buffer_ptr = 0;
  v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v8);
  if (v3)
  {
    v4 = v3;
    if (sendto(*(_DWORD *)(a1 + 136), buffer_ptr, v8, 0, (const sockaddr *)(a1 + 104), *(_DWORD *)(a1 + 132)) < 0)
    {
      if (*__error())
      {
        v5 = *__error();
        if (!v5)
          goto LABEL_11;
      }
      else
      {
        v5 = -6700;
      }
      if (_mdns_resolver_log_s_once != -1)
        dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
      v6 = _mdns_resolver_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v11 = v7;
        v12 = 1024;
        v13 = v5;
        _os_log_error_impl(&dword_22983F000, v6, OS_LOG_TYPE_ERROR, "sending to %@ failed: %{darwin.errno}d", buf, 0x12u);
      }
    }
LABEL_11:
    dispatch_release(v4);
  }
}

void _mdns_udp_socket_session_read_handler(uint64_t a1)
{
  ssize_t v2;
  uint64_t v3;
  int v4;
  int v5;
  BOOL v6;
  dispatch_data_t v7;
  NSObject *v8;
  socklen_t v9;
  sockaddr v10;
  uint64_t v11;
  int v12;
  _BYTE buffer[512];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v10.sa_len = 0;
  *(_QWORD *)&v10.sa_data[6] = 0;
  v12 = 0;
  v11 = 0;
  v9 = 28;
  v2 = recvfrom(*(_DWORD *)(a1 + 136), buffer, 0x200uLL, 0, &v10, &v9);
  if (v2 < 0)
  {
    if (*__error())
    {
      v3 = *__error();
      if (!(_DWORD)v3)
        goto LABEL_4;
      if ((_DWORD)v3 == 35)
        return;
    }
    else
    {
      v3 = 4294960596;
    }
    _mdns_common_session_finish(a1, 3, v3);
    return;
  }
LABEL_4:
  if (*(_BYTE *)(a1 + 105) == 2)
  {
    if (*(_DWORD *)(a1 + 108) != *(_DWORD *)&v10.sa_data[2])
      return;
    v4 = *(unsigned __int16 *)(a1 + 106);
    v5 = *(unsigned __int16 *)v10.sa_data;
    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 112) == *(_QWORD *)&v10.sa_data[6] && *(_QWORD *)(a1 + 120) == v11;
  if (!v6 || *(unsigned __int16 *)(a1 + 106) != *(unsigned __int16 *)v10.sa_data)
    return;
  if (*(unsigned __int8 *)(a1 + 112) == 254 && (*(_BYTE *)(a1 + 113) & 0xC0) == 0x80)
  {
    v4 = *(_DWORD *)(a1 + 128);
    if (v4)
    {
      v5 = v12;
LABEL_7:
      if (v4 != v5)
        return;
    }
  }
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  v7 = dispatch_data_create(buffer, v2, (dispatch_queue_t)_mdns_resolver_queue_s_queue, 0);
  if (v7)
  {
    v8 = v7;
    _mdns_common_session_invoke_receive(a1, (uint64_t)v7);
    dispatch_release(v8);
  }
}

void _mdns_udp_socket_session_cancel_handler(_DWORD *object)
{
  int v2;

  v2 = object[34];
  if ((v2 & 0x80000000) == 0)
  {
    close(v2);
    object[34] = -1;
  }
  os_release(object);
}

uint64_t _mdns_connection_session_initialize(uint64_t a1, uint64_t a2, int a3, NSObject *a4, unsigned __int8 *a5)
{
  uint64_t v8;
  BOOL v9;
  uint64_t (*v10)(uint64_t, unsigned int *);
  uint64_t v11;
  NSObject *v12;
  char v13;
  uint64_t (*v14)(uint64_t, unsigned int *);
  uint64_t v15;
  nw_parameters_t v16;
  int isa;
  __int128 v19;
  uint64_t v20;
  NSObject *v21;
  const sockaddr *address;
  nw_endpoint_t v23;
  NSObject *v24;
  int v25;
  uint64_t host_with_numeric_port;
  void *v27;
  int v28;
  NSObject *v29;
  nw_connection_t v30;
  unsigned int v32;
  _BYTE buf[992];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  v8 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(v8 + 158))
    v9 = 0;
  else
    v9 = a3 == 0;
  if (v9)
  {
    v14 = *(uint64_t (**)(uint64_t, unsigned int *))(v8 + 104);
    if (v14)
    {
      v15 = v14(a2, &v32);
      v13 = v32;
      if (v32)
        return v32;
      v12 = v15;
      goto LABEL_11;
    }
    return -6735;
  }
  v10 = *(uint64_t (**)(uint64_t, unsigned int *))(v8 + 112);
  if (!v10)
    return -6735;
  v11 = v10(a2, &v32);
  if (v32)
    return v32;
  v12 = v11;
  v13 = 1;
LABEL_11:
  *(_BYTE *)(a1 + 104) = v13;
  if (!a4)
    goto LABEL_25;
  if ((LODWORD(a4[2].isa) - 1) > 2)
  {
    a4 = 0;
    goto LABEL_25;
  }
  v16 = nw_parameters_copy(v12);
  if (!v16)
    return -6729;
  v12 = v16;
  isa = (int)a4[2].isa;
  switch(isa)
  {
    case 3:
      v19 = *(_OWORD *)((char *)a4->isa + 40);
      *(_OWORD *)buf = *(_OWORD *)((char *)a4->isa + 24);
      *(_OWORD *)&buf[16] = v19;
      nw_parameters_set_source_application();
      break;
    case 2:
      nw_parameters_set_e_proc_uuid();
      break;
    case 1:
      nw_parameters_set_pid();
      break;
  }
  a4 = v12;
LABEL_25:
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 48);
  if (a5)
  {
    address = nw_endpoint_get_address(*(nw_endpoint_t *)(v20 + 48));
    v23 = nw_endpoint_create_address(address);
    if (v23)
    {
      v24 = v23;
      v25 = DomainNameToString(a5, 0, buf, 0);
      if (v25)
      {
        v28 = v25;
      }
      else
      {
        nw_endpoint_get_port(v24);
        host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
        if (host_with_numeric_port)
        {
          v27 = (void *)host_with_numeric_port;
          nw_endpoint_set_parent_endpoint();
          nw_release(v27);
          v21 = v24;
          goto LABEL_39;
        }
        v28 = -6729;
      }
      nw_release(v24);
    }
    else
    {
      v28 = -6729;
    }
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v29 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v28;
      _os_log_error_impl(&dword_22983F000, v29, OS_LOG_TYPE_ERROR, "Failed to create domain-attributed endpoint for %@: %{mdns:err}ld", buf, 0x16u);
    }
  }
  v24 = 0;
LABEL_39:
  v30 = nw_connection_create(v21, v12);
  *(_QWORD *)(a1 + 96) = v30;
  if (v30)
  {
    if (!a4)
      goto LABEL_42;
    goto LABEL_41;
  }
  v32 = -6729;
  if (a4)
LABEL_41:
    nw_release(a4);
LABEL_42:
  if (v24)
    nw_release(v24);
  return v32;
}

uint64_t _mdns_connection_session_activate(nw_connection_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v7[5];
  _QWORD completion[5];

  os_retain(a1);
  v2 = a1[12];
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  nw_connection_set_queue(v2, (dispatch_queue_t)_mdns_resolver_queue_s_queue);
  v3 = MEMORY[0x24BDAC760];
  v4 = a1[12];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 0x40000000;
  v7[2] = ___mdns_connection_session_activate_block_invoke;
  v7[3] = &__block_descriptor_tmp_70_1351;
  v7[4] = a1;
  nw_connection_set_state_changed_handler(v4, v7);
  nw_connection_start(a1[12]);
  v5 = a1[12];
  completion[0] = v3;
  completion[1] = 0x40000000;
  completion[2] = ___mdns_connection_session_schedule_receive_block_invoke;
  completion[3] = &__block_descriptor_tmp_72_1352;
  completion[4] = a1;
  nw_connection_receive_message(v5, completion);
  return 0;
}

void _mdns_connection_session_invalidate(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  v2 = *(NSObject **)(a1 + 96);
  if (v2)
  {
    nw_connection_cancel(v2);
    v3 = *(void **)(a1 + 96);
    if (v3)
    {
      nw_release(v3);
      *(_QWORD *)(a1 + 96) = 0;
    }
  }
}

void _mdns_connection_session_send(uint64_t a1, NSObject *a2, int a3)
{
  NSObject *v6;
  uint64_t started;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v6 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 96);
    *(_DWORD *)buf = 138412290;
    v13 = v10;
    _os_log_debug_impl(&dword_22983F000, v6, OS_LOG_TYPE_DEBUG, "Sending message on connection %@", buf, 0xCu);
  }
  started = _mdns_create_and_start_connection_activity(*(_QWORD *)(a1 + 96), a3);
  v8 = *(NSObject **)(a1 + 96);
  v9 = *MEMORY[0x24BDE0848];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = ___mdns_connection_session_send_block_invoke;
  v11[3] = &__block_descriptor_tmp_74;
  v11[4] = started;
  v11[5] = a1;
  nw_connection_send(v8, a2, v9, 1, v11);
}

uint64_t _mdns_connection_session_is_bytestream(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 104);
}

void ___mdns_connection_session_send_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 96))
    {
      nw_connection_end_activity();
      v4 = *(void **)(a1 + 32);
    }
    nw_release(v4);
  }
  if (a2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v5 + 96))
      _mdns_common_session_finish(v5, 3, 4294960543);
  }
}

void ___mdns_connection_session_activate_block_invoke(uint64_t a1, int a2)
{
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[12])
  {
    if (_mdns_resolver_log_s_once != -1)
      dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
    v5 = _mdns_resolver_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_DEBUG))
    {
      v6 = nw_connection_state_to_string();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v8 = 136315394;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_22983F000, v5, OS_LOG_TYPE_DEBUG, "Connection state changed to %s for connection %@", (uint8_t *)&v8, 0x16u);
    }
    switch(a2)
    {
      case 3:
        _mdns_common_session_invoke_ready_event_handler(*(_QWORD *)(a1 + 32));
        break;
      case 4:
        _mdns_common_session_finish(*(_QWORD *)(a1 + 32), 3, 4294960543);
        break;
      case 5:
        v4 = *(_QWORD **)(a1 + 32);
LABEL_10:
        os_release(v4);
        break;
    }
  }
  else if (a2 == 5)
  {
    goto LABEL_10;
  }
}

void ___mdns_connection_session_schedule_receive_block_invoke(uint64_t a1, uint64_t a2, nw_content_context_t context, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  _BOOL4 is_final;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD completion[5];

  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 96))
  {
    if (a2)
      _mdns_common_session_invoke_receive(v6, a2);
    if (context)
      is_final = nw_content_context_get_is_final(context);
    else
      is_final = 0;
    v10 = *(_QWORD *)(a1 + 32);
    if (a5 || is_final)
    {
      if (a5)
        v12 = 4294960543;
      else
        v12 = 0;
      _mdns_common_session_finish(v10, 3, v12);
    }
    else
    {
      v11 = *(NSObject **)(v10 + 96);
      completion[0] = MEMORY[0x24BDAC760];
      completion[1] = 0x40000000;
      completion[2] = ___mdns_connection_session_schedule_receive_block_invoke;
      completion[3] = &__block_descriptor_tmp_72_1352;
      completion[4] = v10;
      nw_connection_receive_message(v11, completion);
    }
  }
}

void ___mdns_querier_reset_time_limit_block_invoke(uint64_t a1)
{
  _mdns_querier_conclude_ex(*(_QWORD *)(a1 + 32), 2, 0, 0);
}

void ___mdns_querier_conclude_async_block_invoke(uint64_t a1)
{
  _mdns_querier_conclude_ex(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0, 0);
  os_release(*(void **)(a1 + 32));
}

void _mdns_querier_clear_delegation(uint64_t a1)
{
  void **v2;
  int v3;

  v2 = (void **)(a1 + 168);
  v3 = *(_DWORD *)(a1 + 184);
  switch(v3)
  {
    case 3:
      if (*v2)
      {
        os_release(*v2);
        *v2 = 0;
      }
      break;
    case 2:
      uuid_clear((unsigned __int8 *)(a1 + 168));
      break;
    case 1:
      *(_DWORD *)v2 = 0;
      break;
  }
  *(_DWORD *)(a1 + 184) = 0;
}

void mdns_resolver_invalidate(void *a1)
{
  _QWORD block[5];

  os_retain(a1);
  if (_mdns_resolver_queue_s_once != -1)
    dispatch_once(&_mdns_resolver_queue_s_once, &__block_literal_global_138_1176);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mdns_resolver_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_4_1374;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mdns_resolver_queue_s_queue, block);
}

void __mdns_resolver_invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 136))
  {
    *(_BYTE *)(v2 + 136) = 1;
    v3 = *(NSObject **)(v2 + 104);
    if (v3)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 104));
      dispatch_release(v3);
      *(_QWORD *)(v2 + 104) = 0;
    }
    v4 = *(_QWORD *)(v2 + 112);
    if (v4)
    {
      mdns_client_invalidate(v4);
      os_release(*(void **)(v2 + 112));
      *(_QWORD *)(v2 + 112) = 0;
    }
    while (1)
    {
      v8 = *(_QWORD *)(v2 + 24);
      if (!v8)
        break;
      *(_QWORD *)(v2 + 24) = *(_QWORD *)(v8 + 24);
      if (*(_QWORD *)(v8 + 56))
      {
        nw_path_evaluator_cancel();
        v5 = *(void **)(v8 + 56);
        if (v5)
        {
          nw_release(v5);
          *(_QWORD *)(v8 + 56) = 0;
        }
      }
      v6 = *(_BYTE **)(v8 + 32);
      if (v6)
      {
        _mdns_session_invalidate(v6);
        os_release(*(void **)(v8 + 32));
        *(_QWORD *)(v8 + 32) = 0;
      }
      v7 = *(NSObject **)(v8 + 40);
      if (v7)
      {
        dispatch_source_cancel(*(dispatch_source_t *)(v8 + 40));
        dispatch_release(v7);
        *(_QWORD *)(v8 + 40) = 0;
      }
    }
    _mdns_resolver_invalidate_and_forget_queriers((_QWORD **)(v2 + 32));
    _mdns_resolver_invalidate_and_forget_queriers((_QWORD **)(v2 + 40));
    v9 = *(NSObject **)(v2 + 96);
    if (v9)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 96));
      dispatch_release(v9);
      *(_QWORD *)(v2 + 96) = 0;
    }
    if (*(_QWORD *)(v2 + 80))
    {
      os_retain((void *)v2);
      v10 = *(NSObject **)(v2 + 72);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___mdns_resolver_invalidate_internal_block_invoke;
      block[3] = &__block_descriptor_tmp_44_1375;
      block[4] = v2;
      dispatch_async(v10, block);
    }
  }
  os_release(*(void **)(a1 + 32));
}

void _mdns_resolver_invalidate_and_forget_queriers(_QWORD **a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    do
    {
      v2 = (_QWORD *)v1[7];
      v1[7] = 0;
      _mdns_querier_conclude_ex((uint64_t)v1, 4, 0, 0);
      os_release(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void ___mdns_resolver_invalidate_internal_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
  os_release(*(void **)(a1 + 32));
}

void __mdns_resolver_prepare_for_system_sleep_block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  if (_mdns_resolver_log_s_once != -1)
    dispatch_once(&_mdns_resolver_log_s_once, &__block_literal_global_48);
  v0 = _mdns_resolver_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_resolver_log_s_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22983F000, v0, OS_LOG_TYPE_INFO, "Preparing for system sleep", v2, 2u);
  }
  v1 = (void *)MEMORY[0x22E2D174C]();
  _http_task_shared_session_critical_region(&__block_literal_global_716);
  objc_autoreleasePoolPop(v1);
}

uint64_t mdns_querier_set_dnssec_ok(uint64_t result, int a2)
{
  uint64_t v2;
  char v3;

  if (!*(_BYTE *)(result + 49))
  {
    v2 = *(_QWORD *)(result + 88);
    if ((*(_BYTE *)(v2 + 70) & 0x20) == 0)
    {
      if (a2)
        v3 = 4;
      else
        v3 = 0;
      *(_BYTE *)(v2 + 70) = *(_BYTE *)(v2 + 70) & 0xFB | v3;
    }
  }
  return result;
}

uint64_t mdns_querier_set_checking_disabled(uint64_t result, int a2)
{
  uint64_t v2;
  char v3;

  if (!*(_BYTE *)(result + 49))
  {
    v2 = *(_QWORD *)(result + 88);
    if ((*(_BYTE *)(v2 + 70) & 0x20) == 0)
    {
      if (a2)
        v3 = 2;
      else
        v3 = 0;
      *(_BYTE *)(v2 + 70) = *(_BYTE *)(v2 + 70) & 0xFD | v3;
    }
  }
  return result;
}

void mdns_querier_set_delegator_pid(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    _mdns_querier_clear_delegation(a1);
    *(_DWORD *)(a1 + 184) = 1;
    *(_DWORD *)(a1 + 168) = a2;
  }
}

void mdns_querier_set_delegator_uuid(uint64_t a1, const unsigned __int8 *a2)
{
  uuid_t dst;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 49))
  {
    memset(dst, 0, sizeof(dst));
    uuid_copy(dst, a2);
    _mdns_querier_clear_delegation(a1);
    *(_DWORD *)(a1 + 184) = 2;
    uuid_copy((unsigned __int8 *)(a1 + 168), dst);
  }
}

uint64_t mdns_querier_set_user_id(uint64_t result, int a2)
{
  if (!*(_BYTE *)(result + 49))
    *(_DWORD *)(result + 232) = a2;
  return result;
}

void mdns_querier_set_result_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 49))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 80);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 80) = v3;
  }
}

void __mdns_querier_set_time_limit_ms_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 249) != 3)
  {
    v3 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(v2 + 224) = v3;
    v4 = _mdns_querier_reset_time_limit(v2, v3);
    if (v4)
      _mdns_querier_conclude_with_error_async((void *)v2, v4);
  }
  os_release(*(void **)(a1 + 32));
}

uint64_t mdns_querier_get_qname(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 56) + 24);
}

uint64_t mdns_querier_get_qtype(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 88))();
}

uint64_t mdns_querier_get_qclass(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 96))();
}

uint64_t mdns_querier_get_resolver_type(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 16) + 144);
}

uint64_t mdns_querier_get_result_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 248);
}

uint64_t mdns_querier_get_send_count(uint64_t a1)
{
  return atomic_load((unsigned int *)(a1 + 208));
}

uint64_t mdns_querier_get_query_length(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 88) + 40);
}

uint64_t mdns_querier_get_response_ptr(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 136);
  if (v1)
    return *(_QWORD *)(v1 + 32);
  else
    return 0;
}

uint64_t mdns_querier_get_response_length(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 136);
  if (v1)
    return *(unsigned int *)(v1 + 40);
  else
    return 0;
}

uint64_t mdns_querier_response_is_fabricated(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 253);
}

uint64_t mdns_querier_get_error(uint64_t a1)
{
  return *(unsigned int *)(a1 + 240);
}

uint64_t mdns_querier_get_dnssec_ok(uint64_t a1)
{
  return (*(unsigned __int8 *)(*(_QWORD *)(a1 + 88) + 70) >> 2) & 1;
}

BOOL mdns_querier_match(uint64_t a1, unsigned __int8 *a2, int a3, int a4)
{
  uint64_t v4;
  unsigned __int8 *v5;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 88);
  result = 0;
  if (*(unsigned __int16 *)(v4 + 64) == a3 && *(unsigned __int16 *)(v4 + 66) == a4)
  {
    v5 = *(unsigned __int8 **)(*(_QWORD *)(v4 + 56) + 24);
    if (v5)
    {
      if (DomainNameEqual(v5, a2))
        return 1;
    }
  }
  return result;
}

BOOL mdns_querier_has_concluded(uint64_t a1)
{
  return *(_BYTE *)(a1 + 248) != 0;
}

uint64_t mdns_querier_get_user_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 232);
}

uint64_t mdns_querier_set_context(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(result + 49))
    *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t mdns_querier_get_context(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t mdns_querier_set_context_finalizer(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(result + 49))
    *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t mdns_querier_set_start_time_leeway(uint64_t result, int a2)
{
  if (!*(_BYTE *)(result + 49))
    *(_DWORD *)(result + 236) = a2;
  return result;
}

uint64_t mdns_querier_enable_sensitive_logging(uint64_t result, char a2)
{
  if (!*(_BYTE *)(result + 49))
    *(_BYTE *)(result + 255) = a2;
  return result;
}

uint64_t mdns_security_create_self_signed_certificate(uint64_t a1, uint64_t a2, void *a3, int a4, int *a5)
{
  CFNumberRef v7;
  CFNumberRef v8;
  void *v9;
  const __CFDictionary *v10;
  SecKeyRef RandomKey;
  int v12;
  int Code;
  uint64_t SelfSignedCertificate;
  const void *v15;
  uint64_t v16;
  const __CFDictionary *v18;
  int valuePtr;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = a4;
  v7 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (!v7)
    goto LABEL_21;
  v8 = v7;
  v9 = (void *)*MEMORY[0x24BDE9048];
  keys[0] = *(void **)MEMORY[0x24BDE9050];
  keys[1] = v9;
  values[0] = a3;
  values[1] = v7;
  v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(v8);
  if (!v10)
  {
LABEL_21:
    v16 = 0;
    v12 = -6729;
    goto LABEL_16;
  }
  keys[0] = 0;
  RandomKey = SecKeyCreateRandomKey(v10, (CFErrorRef *)keys);
  if (RandomKey)
  {
    v12 = 0;
  }
  else
  {
    if (!keys[0])
    {
      v18 = v10;
LABEL_20:
      CFRelease(v18);
      v16 = 0;
      v12 = -6700;
      goto LABEL_16;
    }
    Code = CFErrorGetCode((CFErrorRef)keys[0]);
    if (Code)
      v12 = Code;
    else
      v12 = -6700;
  }
  if (keys[0])
    CFRelease(keys[0]);
  CFRelease(v10);
  if (!RandomKey)
  {
    v16 = 0;
    goto LABEL_16;
  }
  SelfSignedCertificate = SecGenerateSelfSignedCertificate();
  if (!SelfSignedCertificate)
  {
    v18 = RandomKey;
    goto LABEL_20;
  }
  v15 = (const void *)SelfSignedCertificate;
  v16 = SecIdentityCreate();
  if (!v16)
    v12 = -6700;
  CFRelease(RandomKey);
  CFRelease(v15);
LABEL_16:
  if (a5)
    *a5 = v12;
  return v16;
}

uint64_t mdns_security_set_per_user_certificate_trust_settings()
{
  if (SecTrustStoreForDomain())
    return SecTrustStoreSetTrustSettings();
  else
    return 4294960596;
}

uint64_t mdns_security_remove_per_user_certificate_trust_settings()
{
  if (SecTrustStoreForDomain())
    return SecTrustStoreRemoveCertificate();
  else
    return 4294960596;
}

os_log_t ___mdns_signed_result_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "signed_result");
  _mdns_signed_result_log_s_log = (uint64_t)result;
  return result;
}

uint64_t _mdns_necp_validate_result()
{
  uint64_t v0;
  NSObject *v1;
  const char *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
  if (_mdns_necp_get_shared_fd_s_fd < 0)
  {
    _mdns_necp_get_shared_fd_s_fd = necp_open();
    if (_mdns_necp_get_shared_fd_s_fd < 0)
    {
      if (*__error())
      {
        v0 = *__error();
        os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
        if (!(_DWORD)v0)
          goto LABEL_4;
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
        v0 = 4294960596;
      }
      if (_mdns_signed_result_log_s_once != -1)
        dispatch_once(&_mdns_signed_result_log_s_once, &__block_literal_global_1433);
      v1 = _mdns_signed_result_log_s_log;
      if (os_log_type_enabled((os_log_t)_mdns_signed_result_log_s_log, OS_LOG_TYPE_ERROR))
      {
        v4 = 134217984;
        v5 = (int)v0;
        v2 = "Failed to create NECP file descriptor: %{mdns:err}ld";
        goto LABEL_23;
      }
      return v0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_mdns_necp_get_shared_fd_s_lock);
LABEL_4:
  if (!necp_client_action())
    return 0;
  if (*__error())
  {
    v0 = *__error();
    if (!(_DWORD)v0)
      return v0;
  }
  else
  {
    v0 = 4294960596;
  }
  if (_mdns_signed_result_log_s_once != -1)
    dispatch_once(&_mdns_signed_result_log_s_once, &__block_literal_global_1433);
  v1 = _mdns_signed_result_log_s_log;
  if (os_log_type_enabled((os_log_t)_mdns_signed_result_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v4 = 134217984;
    v5 = (int)v0;
    v2 = "Failed to validate data: %{mdns:err}ld";
LABEL_23:
    _os_log_error_impl(&dword_22983F000, v1, OS_LOG_TYPE_ERROR, v2, (uint8_t *)&v4, 0xCu);
  }
  return v0;
}

void *_mdns_signed_browse_result_copy_description(_QWORD *a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  char out[40];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v8 = a1[4];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)(v8 + 32), out);
  v9 = 0;
  if (!mdns_string_builder_append_formatted(v7, "client ID: %s, service instance: ", out))
  {
    if (!_mdns_string_builder_append_domain_name_string(v7, v8 + 58, *(unsigned __int16 *)(v8 + 56), a3))
    {
      v9 = mdns_string_builder_copy_string((uint64_t)v7);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
  os_release(v7);
  return v9;
}

void _mdns_signed_browse_result_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[3];
  if (v2)
  {
    free(v2);
    a1[3] = 0;
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    free(v3);
    a1[4] = 0;
  }
  a1[5] = 0;
}

uint64_t _mdns_signed_browse_result_get_data(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 40);
  return *(_QWORD *)(a1 + 32);
}

uint64_t _mdns_signed_browse_result_get_uuid(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32) + 32;
}

uint64_t _mdns_string_builder_append_domain_name_string(_QWORD *a1, uint64_t a2, unint64_t a3, int a4)
{
  char v7[1009];
  _BYTE v8[64];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3 > 0x3F0)
    return mdns_string_builder_append_formatted(a1, "«TOO LONG: %zu chars»");
  if (!a4)
    return mdns_string_builder_append_formatted(a1, "%.*s");
  __memcpy_chk();
  v7[a3] = 0;
  DNSMessagePrintObfuscatedString((uint64_t)v8, 64, v7);
  return mdns_string_builder_append_formatted(a1, "%s");
}

uint64_t _mdns_signed_result_compute_txt_rdata_24_bit_hash(int a1, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int v3;
  uint64_t v4;
  int v5;

  v3 = 16777619 * ((16777619 * (a1 ^ (a3 >> 8))) ^ a3);
  if (a3)
  {
    v4 = a3;
    do
    {
      v5 = *a2++;
      v3 = 16777619 * (v3 ^ v5);
      --v4;
    }
    while (v4);
  }
  return v3 & 0xFFFFFF ^ HIBYTE(v3);
}

uint64_t mdns_signed_browse_result_create_from_data(uint64_t a1, size_t a2, int *a3)
{
  uint64_t v4;
  unint64_t v5;
  int appended;
  void *v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void (*v11)(uint64_t);
  int v12;
  uint64_t i;
  _BYTE v15[256];
  char v16[1009];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0x3A)
  {
    v4 = 0;
    appended = -6743;
    goto LABEL_16;
  }
  v4 = a1;
  if (*(_DWORD *)(a1 + 48) != 5)
  {
    v4 = 0;
    appended = -6756;
    goto LABEL_16;
  }
  v5 = *(unsigned __int16 *)(a1 + 56);
  if (a2 - 58 < v5)
  {
    v4 = 0;
    appended = -6750;
    goto LABEL_16;
  }
  if (v5 > 0x3F0)
  {
    v4 = 0;
    appended = -6744;
    goto LABEL_16;
  }
  __memcpy_chk();
  v16[v5] = 0;
  v15[0] = 0;
  appended = DomainNameAppendString(v15, v16, 0);
  if (appended || (appended = _mdns_necp_validate_result()) != 0)
  {
    v4 = 0;
    goto LABEL_16;
  }
  v8 = malloc_type_malloc(a2, 0xA172743EuLL);
  if (!v8)
  {
    __break(1u);
    goto LABEL_25;
  }
  v5 = (unint64_t)v8;
  memcpy(v8, (const void *)v4, a2);
  v9 = _os_object_alloc();
  v4 = v9;
  if (!v9)
  {
LABEL_25:
    free((void *)v5);
    appended = -6728;
    goto LABEL_16;
  }
  v10 = &_mdns_signed_browse_result_kind;
  *(_QWORD *)(v9 + 16) = &_mdns_signed_browse_result_kind;
  do
  {
    v11 = (void (*)(uint64_t))v10[2];
    if (v11)
      v11(v4);
    v10 = (_UNKNOWN **)*v10;
  }
  while (v10);
  DomainNameDupEx(v15, 0, (unsigned __int8 **)(v4 + 24), 0);
  v12 = -2128831035;
  for (i = 32; i != 48; ++i)
    v12 = 16777619 * (v12 ^ *(unsigned __int8 *)(v5 + i));
  appended = 0;
  *(_DWORD *)(v4 + 48) = v12;
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = a2;
LABEL_16:
  if (a3)
    *a3 = appended;
  return v4;
}

BOOL mdns_signed_browse_result_contains(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v7;

  if (!a3)
    return DomainNameEqual(*(unsigned __int8 **)(a1 + 24), a2) != 0;
  v3 = 0;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52);
  v5 = *(_DWORD *)(a1 + 48);
  v7 = bswap32(a3);
  do
    LOWORD(v5) = 403 * (v5 ^ *((unsigned __int8 *)&v7 + v3++));
  while (v3 != 4);
  return HIBYTE(v4) == (v5 ^ BYTE1(v5))
      && DomainNameEqual(*(unsigned __int8 **)(a1 + 24), a2) != 0;
}

BOOL mdns_signed_browse_result_covers_txt_rdata(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  int v3;

  if (a3 >> 16)
    return 0;
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52) & 0xFFFFFF;
  return v3 == _mdns_signed_result_compute_txt_rdata_24_bit_hash(*(_DWORD *)(a1 + 48), a2, (unsigned __int16)a3);
}

void *_mdns_signed_resolve_result_copy_description(_QWORD *a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  char v13;
  _QWORD v14[2];
  unsigned __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;
  __int16 v20;
  char out[40];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (!a2 || !mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
    v9 = a1[4];
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)(v9 + 32), out);
    v8 = 0;
    if (mdns_string_builder_append_formatted(v7, "client ID: %s", out))
      goto LABEL_6;
    v11 = 0;
    v14[0] = "service instance";
    v14[1] = v9 + 62;
    v15 = *(_WORD *)(v9 + 56);
    v16 = 0;
    v17 = 0;
    v18 = "hostname";
    v19 = v9 + 62 + v15;
    v20 = *(_WORD *)(v9 + 60);
    v12 = 1;
    while (1)
    {
      v13 = v12;
      if (mdns_string_builder_append_formatted(v7, ", %s: ", (const char *)v14[3 * v11])
        || _mdns_string_builder_append_domain_name_string(v7, v14[3 * v11 + 1], LOWORD(v14[3 * v11 + 2]), a3))
      {
        break;
      }
      v12 = 0;
      v11 = 1;
      if ((v13 & 1) == 0)
      {
        if (mdns_string_builder_append_formatted(v7, ", port: %u", bswap32(*(unsigned __int16 *)(v9 + 58)) >> 16))break;
        v8 = mdns_string_builder_copy_string((uint64_t)v7);
        goto LABEL_6;
      }
    }
  }
  v8 = 0;
LABEL_6:
  os_release(v7);
  return v8;
}

void _mdns_signed_resolve_result_finalize(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[3];
  if (v2)
  {
    free(v2);
    a1[3] = 0;
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    free(v3);
    a1[4] = 0;
  }
  a1[5] = 0;
}

uint64_t _mdns_signed_resolve_result_get_data(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 40);
  return *(_QWORD *)(a1 + 32);
}

uint64_t _mdns_signed_resolve_result_get_uuid(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32) + 32;
}

uint64_t mdns_signed_resolve_result_create_from_data(uint64_t a1, size_t a2, int *a3)
{
  size_t v4;
  uint64_t v5;
  size_t v6;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  int appended;
  void *v12;
  uint64_t v13;
  _UNKNOWN **v14;
  void (*v15)(uint64_t);
  int v16;
  uint64_t i;
  _BYTE v19[256];
  char v20[1009];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a2 - 62;
  if (a2 < 0x3E)
  {
    v5 = 0;
    appended = -6743;
    goto LABEL_18;
  }
  v5 = a1;
  if (*(_DWORD *)(a1 + 48) != 6)
  {
    v5 = 0;
    appended = -6756;
    goto LABEL_18;
  }
  v6 = *(unsigned __int16 *)(a1 + 56);
  v7 = v4 >= v6;
  v8 = v4 - v6;
  if (!v7 || (v9 = *(unsigned __int16 *)(a1 + 60), v8 < v9))
  {
    v5 = 0;
    appended = -6750;
    goto LABEL_18;
  }
  if (v9 > 0x3F0)
  {
    v5 = 0;
    appended = -6744;
    goto LABEL_18;
  }
  __memcpy_chk();
  v20[v9] = 0;
  v19[0] = 0;
  appended = DomainNameAppendString(v19, v20, 0);
  if (appended || (appended = _mdns_necp_validate_result()) != 0)
  {
    v5 = 0;
    goto LABEL_18;
  }
  v12 = malloc_type_malloc(a2, 0xA172743EuLL);
  if (!v12)
  {
    __break(1u);
    goto LABEL_27;
  }
  v9 = (unint64_t)v12;
  memcpy(v12, (const void *)v5, a2);
  v13 = _os_object_alloc();
  v5 = v13;
  if (!v13)
  {
LABEL_27:
    free((void *)v9);
    appended = -6728;
    goto LABEL_18;
  }
  v14 = &_mdns_signed_resolve_result_kind;
  *(_QWORD *)(v13 + 16) = &_mdns_signed_resolve_result_kind;
  do
  {
    v15 = (void (*)(uint64_t))v14[2];
    if (v15)
      v15(v5);
    v14 = (_UNKNOWN **)*v14;
  }
  while (v14);
  DomainNameDupEx(v19, 0, (unsigned __int8 **)(v5 + 24), 0);
  v16 = -2128831035;
  for (i = 32; i != 48; ++i)
    v16 = 16777619 * (v16 ^ *(unsigned __int8 *)(v9 + i));
  appended = 0;
  *(_DWORD *)(v5 + 48) = v16;
  *(_QWORD *)(v5 + 32) = v9;
  *(_QWORD *)(v5 + 40) = a2;
LABEL_18:
  if (a3)
    *a3 = appended;
  return v5;
}

BOOL mdns_signed_resolve_result_covers_txt_rdata(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  int v3;

  if (a3 >> 16)
    return 0;
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52) & 0xFFFFFF;
  return v3 == _mdns_signed_result_compute_txt_rdata_24_bit_hash(*(_DWORD *)(a1 + 48), a2, (unsigned __int16)a3);
}

void *_mdns_signed_hostname_result_copy_description(_QWORD *a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _OWORD v11[2];
  char out[40];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v8 = a1[3];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)(v8 + 32), out);
  v9 = 0;
  if (!mdns_string_builder_append_formatted(v7, "client ID: %s, hostname: ", out))
  {
    if (!_mdns_string_builder_append_domain_name_string(v7, v8 + 88, *(unsigned int *)(v8 + 84), a3)
      && !mdns_string_builder_append_formatted(v7, ", address: "))
    {
      v11[0] = *(_OWORD *)(v8 + 56);
      *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)(v8 + 68);
      if (!mdns_string_builder_append_sockaddr_description(v7, (uint64_t)v11, a3))
      {
        v9 = mdns_string_builder_copy_string((uint64_t)v7);
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_9:
  os_release(v7);
  return v9;
}

void _mdns_signed_hostname_result_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  *(_QWORD *)(a1 + 32) = 0;
}

uint64_t _mdns_signed_hostname_result_get_data(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 32);
  return *(_QWORD *)(a1 + 24);
}

uint64_t _mdns_signed_hostname_result_get_uuid(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) + 32;
}

void *mdns_signed_hostname_result_create_from_data(_DWORD *a1, size_t a2, int *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void (*v10)(uint64_t);
  void *result;
  void *v12;

  if (a2 < 0x58)
  {
    v8 = 0;
    v6 = -6743;
  }
  else if (a1[12] == 4)
  {
    if (a2 - 88 < a1[21])
    {
      v8 = 0;
      v6 = -6750;
    }
    else
    {
      v6 = _mdns_necp_validate_result();
      if (v6)
      {
        v8 = 0;
      }
      else
      {
        v7 = _os_object_alloc();
        v8 = v7;
        if (v7)
        {
          v9 = &_mdns_signed_hostname_result_kind;
          *(_QWORD *)(v7 + 16) = &_mdns_signed_hostname_result_kind;
          do
          {
            v10 = (void (*)(uint64_t))v9[2];
            if (v10)
              v10(v8);
            v9 = (_UNKNOWN **)*v9;
          }
          while (v9);
          result = malloc_type_malloc(a2, 0xA172743EuLL);
          if (!result)
          {
            __break(1u);
            return result;
          }
          v12 = result;
          memcpy(result, a1, a2);
          v6 = 0;
          *(_QWORD *)(v8 + 24) = v12;
          *(_QWORD *)(v8 + 32) = a2;
        }
        else
        {
          v6 = -6728;
        }
      }
    }
  }
  else
  {
    v8 = 0;
    v6 = -6756;
  }
  if (a3)
    *a3 = v6;
  return (void *)v8;
}

void *_mdns_string_builder_copy_description(_QWORD *a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  size_t v9;
  void *result;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || mdns_string_builder_append_formatted(v5, "capacity: %zu, string length: %zu", a1[4], a1[5]))
  {
    goto LABEL_4;
  }
  v7 = (const char *)v5[3];
  if (v7)
  {
    v8 = v5[5];
    v9 = v8 + 1;
    if (v8 == -1)
    {
LABEL_4:
      v6 = 0;
LABEL_12:
      os_release(v5);
      return v6;
    }
  }
  else
  {
    v7 = "";
    v9 = 1;
  }
  result = malloc_type_malloc(v9, 0xA172743EuLL);
  if (result)
  {
    v6 = result;
    memcpy(result, v7, v9);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void _mdns_string_builder_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t mdns_string_builder_create()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mdns_string_builder_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_string_builder_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    *(_QWORD *)(v1 + 32) = 0;
  }
  return v1;
}

uint64_t mdns_string_builder_append_formatted(_QWORD *a1, char *__format, ...)
{
  uint64_t result;
  char i;
  size_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  va_list va;

  va_start(va, __format);
  if (a1[3] || (result = _mdns_string_builder_grow_buffer(a1, a1[4]), !(_DWORD)result))
  {
    for (i = 1; ; i = 0)
    {
      v6 = a1[4] - a1[5];
      v7 = vsnprintf((char *)(a1[3] + a1[5]), v6, __format, va);
      if ((v7 & 0x80000000) != 0)
      {
        *(_BYTE *)(a1[3] + a1[5]) = 0;
        return 4294960596;
      }
      v8 = v7;
      if (v6 > v7)
      {
        result = 0;
        a1[5] += v8;
        return result;
      }
      if ((i & 1) == 0)
        break;
      v9 = a1[5];
      v10 = v7 + 1;
      v11 = __CFADD__(v9, v10);
      v12 = v9 + v10;
      if (v11)
        return 4294960567;
      v13 = a1[4];
      if (v13 < 0)
        return 4294960567;
      if (v12 <= 2 * v13)
        v14 = 2 * v13;
      else
        v14 = v12;
      result = _mdns_string_builder_grow_buffer(a1, v14);
      if ((_DWORD)result)
        return result;
    }
    return 4294960534;
  }
  return result;
}

uint64_t _mdns_string_builder_grow_buffer(_QWORD *a1, unint64_t a2)
{
  size_t v3;
  size_t v4;
  size_t v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  uint64_t result;

  if (a1[3] && a1[4] >= a2)
    return 0;
  if (a2 <= 0x40)
    v3 = 64;
  else
    v3 = a2;
  v4 = malloc_good_size(v3);
  if (v4 < v3)
    return 4294960534;
  v5 = v4;
  v6 = malloc_type_calloc(v4, 1uLL, 0xF1748037uLL);
  if (!v6)
  {
    __break(1u);
    return 0;
  }
  v7 = v6;
  v8 = (const void *)a1[3];
  if (v8)
  {
    memcpy(v6, v8, a1[5] + 1);
    v9 = (void *)a1[3];
    if (v9)
      free(v9);
  }
  result = 0;
  a1[3] = v7;
  a1[4] = v5;
  return result;
}

uint64_t mdns_string_builder_append_description(_QWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD);
  const char *v6;
  char *v7;
  uint64_t appended;

  v4 = (_QWORD *)(a2 + 16);
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    v5 = (uint64_t (*)(uint64_t, _QWORD, _QWORD))v4[3];
    if (v5)
    {
      v6 = (const char *)v5(a2, 0, a3 & 1);
      if (v6)
      {
        v7 = (char *)v6;
        appended = mdns_string_builder_append_formatted(a1, "%s", v6);
        free(v7);
        return appended;
      }
      return 4294960567;
    }
  }
  return 4294960567;
}

uint64_t mdns_string_builder_append_description_with_prefix(_QWORD *a1, const char *a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (!a2)
    return mdns_string_builder_append_description(a1, a3, a4);
  result = mdns_string_builder_append_formatted(a1, "%s", a2);
  if (!(_DWORD)result)
    return mdns_string_builder_append_description(a1, a3, a4);
  return result;
}

uint64_t mdns_string_builder_append_sockaddr_description(_QWORD *a1, uint64_t a2, char a3)
{
  int v6;
  unsigned int *v7;
  uint64_t result;
  char v9;
  unsigned int v10;
  char v11[64];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned __int8 *)(a2 + 1);
  if (v6 != 30)
  {
    if (v6 != 2)
      return mdns_string_builder_append_formatted(a1, "«UNHANDLED ADDRESS FAMILY: %d»");
    v7 = (unsigned int *)(a2 + 4);
    if ((a3 & 1) != 0)
    {
      if ((DNSMessagePrintObfuscatedIPv4Address((uint64_t)v11, 64, bswap32(*v7)) & 0x80000000) != 0)
        v11[0] = 0;
      result = mdns_string_builder_append_formatted(a1, "<IPv4:%s>");
      goto LABEL_14;
    }
    if (inet_ntop(2, v7, v11, 0x10u))
    {
LABEL_5:
      result = mdns_string_builder_append_formatted(a1, "%s");
LABEL_14:
      if ((_DWORD)result)
        return result;
      if ((a3 & 2) == 0 && *(_WORD *)(a2 + 2))
        return mdns_string_builder_append_formatted(a1, ":%d");
      return 0;
    }
    if (*__error())
    {
      result = *__error();
      if ((_DWORD)result)
        return result;
      goto LABEL_5;
    }
    return 4294960596;
  }
  if ((a3 & 2) != 0 || !*(_WORD *)(a2 + 2))
  {
    v9 = 1;
  }
  else
  {
    result = mdns_string_builder_append_formatted(a1, "[");
    if ((_DWORD)result)
      return result;
    v9 = 0;
  }
  if ((a3 & 1) != 0)
  {
    if ((DNSMessagePrintObfuscatedIPv6Address((uint64_t)v11, 64, a2 + 8) & 0x80000000) != 0)
      v11[0] = 0;
    result = mdns_string_builder_append_formatted(a1, "<IPv6:%s>");
  }
  else
  {
    if (!inet_ntop(30, (const void *)(a2 + 8), v11, 0x2Eu))
    {
      if (!*__error())
        return 4294960596;
      result = *__error();
      if ((_DWORD)result)
        return result;
    }
    result = mdns_string_builder_append_formatted(a1, "%s");
  }
  if (!(_DWORD)result)
  {
    v10 = *(_DWORD *)(a2 + 24);
    if (!v10
      || (!if_indextoname(v10, v11)
        ? (result = mdns_string_builder_append_formatted(a1, "%%%u"))
        : (result = mdns_string_builder_append_formatted(a1, "%%%s")),
          !(_DWORD)result))
    {
      if ((v9 & 1) == 0)
        return mdns_string_builder_append_formatted(a1, "]:%d");
      return 0;
    }
  }
  return result;
}

void *mdns_string_builder_copy_string(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  size_t v3;
  void *v4;
  void *result;

  v1 = *(const char **)(a1 + 24);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = v2 + 1;
    if (v2 == -1)
      return 0;
  }
  else
  {
    v1 = "";
    v3 = 1;
  }
  result = malloc_type_malloc(v3, 0xA172743EuLL);
  if (result)
  {
    v4 = result;
    memcpy(result, v1, v3);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t _mdns_symptoms_report_dns_server_symptom(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v4;

  if (_mdns_symptoms_get_reporter_s_once != -1)
    dispatch_once(&_mdns_symptoms_get_reporter_s_once, &__block_literal_global_1486);
  result = _mdns_symptoms_get_reporter_s_reporter;
  if (_mdns_symptoms_get_reporter_s_reporter)
  {
    v4 = *(unsigned __int8 *)(a2 + 1);
    if (v4 == 2 || v4 == 30)
    {
      symptom_new();
      symptom_set_additional_qualifier();
      return symptom_send();
    }
  }
  return result;
}

void ___mdns_symptoms_get_reporter_block_invoke()
{
  if (MEMORY[0x24BEB35B0])
    _mdns_symptoms_get_reporter_s_reporter = symptom_framework_init();
}

os_log_t __mdns_system_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "system");
  mdns_system_log_s_log = (uint64_t)result;
  return result;
}

uint64_t mdns_system_set_computer_name_with_utf8_cstring(char *cStr, const __CFString *a2, char a3)
{
  CFStringEncoding v5;
  CFStringRef v6;
  const __CFString *v7;
  const __SCPreferences *locked_prefs;
  const __SCPreferences *v9;
  CFStringRef v10;
  uint64_t v11;
  NSObject *v13;
  const __SCPreferences *v14;
  unsigned int v15;
  CFStringEncoding nameEncoding;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = 134217984;
  v6 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  if (!v6)
    return 4294960596;
  v7 = v6;
  v15 = 0;
  locked_prefs = _mdns_system_create_locked_prefs(a2, a3 & 1, (int *)&v15);
  v14 = locked_prefs;
  if (!v15)
  {
    v9 = locked_prefs;
    if ((a3 & 2) != 0)
    {
      nameEncoding = 0;
      v10 = SCDynamicStoreCopyComputerName(0, &nameEncoding);
      v5 = v10 ? nameEncoding : 134217984;
      if (v10)
        CFRelease(v10);
    }
    if (SCPreferencesSetComputerName(v9, v7, v5))
    {
      v15 = 0;
LABEL_13:
      v15 = _mdns_system_commit_and_apply_prefs(v9);
      goto LABEL_14;
    }
    if (SCError())
    {
      v15 = SCError();
      if (!v15)
        goto LABEL_13;
    }
    else
    {
      v15 = -6700;
    }
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
    v13 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      nameEncoding = 138412802;
      v17 = v7;
      v18 = 2048;
      v19 = v5;
      v20 = 2048;
      v21 = (int)v15;
      _os_log_error_impl(&dword_22983F000, v13, OS_LOG_TYPE_ERROR, "SCPreferencesSetComputerName failed -- name: '%@', encoding: 0x%lX, error: %{mdns:err}ld", (uint8_t *)&nameEncoding, 0x20u);
    }
  }
LABEL_14:
  _mdns_system_unlock_and_forget_prefs(&v14);
  v11 = v15;
  CFRelease(v7);
  return v11;
}

const __SCPreferences *_mdns_system_create_locked_prefs(CFStringRef name, Boolean a2, int *a3)
{
  const __SCPreferences *v5;
  int v6;
  const __SCPreferences *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x24BDBD240], name, 0, (AuthorizationRef)*MEMORY[0x24BDF5A60]);
  if (!v5)
  {
    if (SCError())
    {
      v6 = SCError();
      if (!v6)
        goto LABEL_4;
      v8 = v6;
    }
    else
    {
      v8 = -6700;
    }
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
    v9 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v12 = 134217984;
      v13 = v8;
      _os_log_error_impl(&dword_22983F000, v9, OS_LOG_TYPE_ERROR, "SCPreferencesCreateWithAuthorization failed: %{mdns:err}ld", (uint8_t *)&v12, 0xCu);
    }
    v7 = 0;
LABEL_23:
    v5 = 0;
    if (!a3)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_4:
  if (SCPreferencesLock(v5, a2))
  {
    v7 = 0;
    v8 = 0;
    if (!a3)
      goto LABEL_25;
LABEL_24:
    *a3 = v8;
    goto LABEL_25;
  }
  if (!SCError())
  {
    v8 = -6700;
    goto LABEL_18;
  }
  v8 = SCError();
  if (v8)
  {
LABEL_18:
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
    v10 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v12 = 134217984;
      v13 = v8;
      _os_log_error_impl(&dword_22983F000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesLock failed: %{mdns:err}ld", (uint8_t *)&v12, 0xCu);
    }
    v7 = v5;
    goto LABEL_23;
  }
  v7 = 0;
  if (a3)
    goto LABEL_24;
LABEL_25:
  if (v7)
    CFRelease(v7);
  return v5;
}

uint64_t _mdns_system_commit_and_apply_prefs(const __SCPreferences *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!SCPreferencesCommitChanges(a1))
  {
    if (SCError())
    {
      v2 = SCError();
      if (!(_DWORD)v2)
        goto LABEL_4;
      v3 = v2;
    }
    else
    {
      v3 = 4294960596;
    }
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
    v4 = mdns_system_log_s_log;
    if (!os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
      return v3;
    v7 = 134217984;
    v8 = (int)v3;
    v5 = "SCPreferencesCommitChanges failed: %{mdns:err}ld";
LABEL_20:
    _os_log_error_impl(&dword_22983F000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0xCu);
    return v3;
  }
LABEL_4:
  if (SCPreferencesApplyChanges(a1))
    return 0;
  if (SCError())
  {
    v3 = SCError();
    if (!(_DWORD)v3)
      return v3;
  }
  else
  {
    v3 = 4294960596;
  }
  if (mdns_system_log_s_once != -1)
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
  v4 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v7 = 134217984;
    v8 = (int)v3;
    v5 = "SCPreferencesApplyChanges failed: %{mdns:err}ld";
    goto LABEL_20;
  }
  return v3;
}

void _mdns_system_unlock_and_forget_prefs(const __SCPreferences **a1)
{
  const __SCPreferences *v1;
  int v2;
  int v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    if (!SCPreferencesUnlock(v1))
    {
      if (!SCError())
      {
        v3 = -6700;
        goto LABEL_7;
      }
      v2 = SCError();
      if (v2)
      {
        v3 = v2;
LABEL_7:
        if (mdns_system_log_s_once != -1)
          dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
        v4 = mdns_system_log_s_log;
        if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
        {
          v5 = 134217984;
          v6 = v3;
          _os_log_error_impl(&dword_22983F000, v4, OS_LOG_TYPE_ERROR, "SCPreferencesUnlock failed: %{mdns:err}ld", (uint8_t *)&v5, 0xCu);
        }
      }
    }
    CFRelease(v1);
  }
}

uint64_t mdns_system_set_local_host_name_with_utf8_cstring(char *cStr, const __CFString *a2, Boolean a3)
{
  CFStringRef v5;
  const __CFString *v6;
  const __SCPreferences *locked_prefs;
  const __SCPreferences *v8;
  uint64_t v9;
  NSObject *v11;
  const __SCPreferences *v12;
  unsigned int v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  if (!v5)
    return 4294960596;
  v6 = v5;
  v13 = 0;
  locked_prefs = _mdns_system_create_locked_prefs(a2, a3, (int *)&v13);
  v12 = locked_prefs;
  if (!v13)
  {
    v8 = locked_prefs;
    if (SCPreferencesSetLocalHostName(locked_prefs, v6))
    {
      v13 = 0;
LABEL_7:
      v13 = _mdns_system_commit_and_apply_prefs(v8);
      goto LABEL_8;
    }
    if (SCError())
    {
      v13 = SCError();
      if (!v13)
        goto LABEL_7;
    }
    else
    {
      v13 = -6700;
    }
    if (mdns_system_log_s_once != -1)
      dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
    v11 = mdns_system_log_s_log;
    if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2048;
      v17 = (int)v13;
      _os_log_error_impl(&dword_22983F000, v11, OS_LOG_TYPE_ERROR, "SCPreferencesSetLocalHostName failed -- name: '%@', error: %{mdns:err}ld", buf, 0x16u);
    }
  }
LABEL_8:
  _mdns_system_unlock_and_forget_prefs(&v12);
  v9 = v13;
  CFRelease(v6);
  return v9;
}

uint64_t mdns_system_set_ipv4_forwarding(BOOL a1)
{
  return _mhc_set_ip_forwarding(a1, 0);
}

uint64_t mdns_system_set_ipv6_forwarding(BOOL a1)
{
  return _mhc_set_ip_forwarding(a1, 1);
}

char *mdns_system_interface_index_to_name(unsigned int a1)
{
  char *v2;
  char *result;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  char v9[17];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = if_indextoname(a1, v9);
  if (v2)
  {
    result = strdup(v2);
    if (result)
      return result;
    goto LABEL_6;
  }
  if (!*__error())
  {
LABEL_7:
    v4 = -6700;
    goto LABEL_8;
  }
  v4 = *__error();
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
LABEL_8:
  if (mdns_system_log_s_once != -1)
    dispatch_once(&mdns_system_log_s_once, &__block_literal_global_1501);
  v5 = mdns_system_log_s_log;
  if (os_log_type_enabled((os_log_t)mdns_system_log_s_log, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109376;
    v6[1] = a1;
    v7 = 2048;
    v8 = v4;
    _os_log_error_impl(&dword_22983F000, v5, OS_LOG_TYPE_ERROR, "if_indextoname() for %u failed: %{darwin.errno}ld", (uint8_t *)v6, 0x12u);
  }
  return 0;
}

uint64_t mdns_system_pid_to_uuid(int a1, unsigned __int8 *a2)
{
  _OWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  if (proc_pidinfo(a1, 17, 1uLL, v4, 56) != 56)
    return 4294960596;
  if (a2)
    uuid_copy(a2, (const unsigned __int8 *)v4);
  return 0;
}

void mdns_system_remove_network_policy(void *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2D174C]();
  if (objc_opt_class())
  {
    objc_msgSend(a1, "removeAllPolicies");
    objc_msgSend(a1, "apply");

  }
  objc_autoreleasePoolPop(v2);
}

id mdns_system_add_net_agent_match_domains(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *context;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22E2D174C]();
  v4 = objc_alloc_init((Class)&off_255A73AC0);
  v25 = (void *)objc_msgSend(objc_alloc((Class)&off_255A73BC0), "initWithUUIDBytes:", a1);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = a2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_alloc((Class)&off_255A744E0);
          unk_255A73E18(&off_255A742B8, "netAgentUUID:", v25, context);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          unk_255A74CF4(&off_255A75750, "domain:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v13;
          +[NSArray arrayWithObjects:count:](&off_255A70FF8, "arrayWithObjects:count:", &v31, 1);
          v14 = v4;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v11, "initWithOrder:result:conditions:", 1, v12, v15);

          v4 = v14;
          objc_msgSend(v14, "addPolicy:", v16);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  v17 = objc_alloc((Class)&off_255A744E0);
  unk_255A73E18(&off_255A742B8, "netAgentUUID:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  unk_255A74CF4(&off_255A75750, "domain:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v20;
  +[NSArray arrayWithObjects:count:](&off_255A70FF8, "arrayWithObjects:count:", &v30, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v17, "initWithOrder:result:conditions:", 1, v18, v21);

  objc_msgSend(v4, "addPolicy:", v22);
  objc_msgSend(v4, "setPriority:", 300);
  objc_msgSend(v4, "apply");

  objc_autoreleasePoolPop(context);
  return v4;
}

uint64_t mdns_tcpinfo_get_ipv4(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  uint64_t info;
  NSObject *v6;
  os_log_type_t v7;
  _OWORD v9[2];
  _DWORD v10[7];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&v10[3] = 0u;
  memset(v9, 0, sizeof(v9));
  WORD2(v9[0]) = 528;
  WORD3(v9[0]) = __rev16(a2);
  DWORD2(v9[0]) = bswap32(a1);
  LOWORD(v10[0]) = 528;
  HIWORD(v10[0]) = __rev16(a4);
  *(_QWORD *)&v10[1] = bswap32(a3);
  info = _mdns_tcpinfo_get_info(v9, a5);
  if (_mdns_tcpinfo_log_s_once != -1)
    dispatch_once(&_mdns_tcpinfo_log_s_once, &__block_literal_global_1530);
  v6 = _mdns_tcpinfo_log_s_log;
  if ((_DWORD)info)
    v7 = OS_LOG_TYPE_ERROR;
  else
    v7 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)_mdns_tcpinfo_log_s_log, v7))
  {
    *(_DWORD *)buf = 67110144;
    v12 = DWORD2(v9[0]);
    v13 = 1024;
    v14 = bswap32(WORD3(v9[0])) >> 16;
    v15 = 1024;
    v16 = v10[1];
    v17 = 1024;
    v18 = bswap32(HIWORD(v10[0])) >> 16;
    v19 = 2048;
    v20 = (int)info;
    _os_log_impl(&dword_22983F000, v6, v7, "TCP info get -- local: %{network:in_addr}d:%d, remote: %{network:in_addr}d:%d, error: %{mdns:err}ld", buf, 0x24u);
  }
  return info;
}

uint64_t _mdns_tcpinfo_get_info(_BYTE *a1, void *a2)
{
  uint64_t result;
  size_t v4;
  _OWORD __src[26];

  *a1 = 6;
  memset(__src, 0, 408);
  v4 = 408;
  if (sysctlbyname("net.inet.tcp.info", __src, &v4, a1, 0x3CuLL) == -1)
  {
    if (!*__error())
      return 4294960596;
    result = *__error();
    if (!a2)
      return result;
  }
  else
  {
    result = 0;
    if (!a2)
      return result;
  }
  if (!(_DWORD)result)
  {
    memcpy(a2, __src, 0x198uLL);
    return 0;
  }
  return result;
}

os_log_t ___mdns_tcpinfo_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "tcpinfo");
  _mdns_tcpinfo_log_s_log = (uint64_t)result;
  return result;
}

uint64_t mdns_tcpinfo_get_ipv6(_OWORD *a1, unsigned int a2, _OWORD *a3, unsigned int a4, void *a5)
{
  uint64_t info;
  NSObject *v6;
  os_log_type_t v7;
  _OWORD v9[4];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  memset(v9, 0, 60);
  WORD2(v9[0]) = 7708;
  WORD3(v9[0]) = __rev16(a2);
  *(_OWORD *)((char *)v9 + 12) = *a1;
  LOWORD(v9[2]) = 7708;
  WORD1(v9[2]) = __rev16(a4);
  *(_OWORD *)((char *)&v9[2] + 8) = *a3;
  info = _mdns_tcpinfo_get_info(v9, a5);
  if (_mdns_tcpinfo_log_s_once != -1)
    dispatch_once(&_mdns_tcpinfo_log_s_once, &__block_literal_global_1530);
  v6 = _mdns_tcpinfo_log_s_log;
  if ((_DWORD)info)
    v7 = OS_LOG_TYPE_ERROR;
  else
    v7 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)_mdns_tcpinfo_log_s_log, v7))
  {
    *(_DWORD *)buf = 68159234;
    v11 = 16;
    v12 = 2096;
    v13 = (unint64_t)v9 | 0xC;
    v14 = 1024;
    v15 = bswap32(WORD3(v9[0])) >> 16;
    v16 = 1040;
    v17 = 16;
    v18 = 2096;
    v19 = (char *)&v9[2] + 8;
    v20 = 1024;
    v21 = bswap32(WORD1(v9[2])) >> 16;
    v22 = 2048;
    v23 = (int)info;
    _os_log_impl(&dword_22983F000, v6, v7, "TCP info get -- local: %{network:in6_addr}.16P.%d, remote: %{network:in6_addr}.16P.%d, error: %{mdns:err}ld", buf, 0x38u);
  }
  return info;
}

uint64_t mdns_mach_ticks_per_second()
{
  if (mdns_mach_ticks_per_second_s_once != -1)
    dispatch_once(&mdns_mach_ticks_per_second_s_once, &__block_literal_global_1540);
  return mdns_mach_ticks_per_second_s_ticks_per_second;
}

void __mdns_mach_ticks_per_second_block_invoke()
{
  unint64_t v0;
  kern_return_t v1;
  BOOL v2;
  NSObject *v3;
  mach_timebase_info info;
  uint8_t buf[4];
  kern_return_t v6;
  __int16 v7;
  uint32_t numer;
  __int16 v9;
  uint32_t denom;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = 1000000000;
  info = 0;
  v1 = mach_timebase_info(&info);
  if (v1 || (info.numer ? (v2 = info.denom == 0) : (v2 = 1), v2))
  {
    if (_mdns_ticks_log_s_once != -1)
      dispatch_once(&_mdns_ticks_log_s_once, &__block_literal_global_2);
    v3 = _mdns_ticks_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_ticks_log_s_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      v6 = v1;
      v7 = 1024;
      numer = info.numer;
      v9 = 1024;
      denom = info.denom;
      _os_log_error_impl(&dword_22983F000, v3, OS_LOG_TYPE_ERROR, "Unexpected results from mach_timebase_info: err %d numer %u denom %u", buf, 0x14u);
    }
  }
  else
  {
    v0 = 1000000000 * (unint64_t)info.denom / info.numer;
  }
  mdns_mach_ticks_per_second_s_ticks_per_second = v0;
}

os_log_t ___mdns_ticks_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "ticks");
  _mdns_ticks_log_s_log = (uint64_t)result;
  return result;
}

const __CFData *mdns_xpc_create_dictionary_from_plist_data(UInt8 *bytes, CFIndex length, int *a3)
{
  const __CFData *v4;
  CFPropertyListRef v5;
  CFTypeID v6;
  int v7;

  v4 = CFDataCreate(0, bytes, length);
  if (v4)
  {
    v5 = CFPropertyListCreateWithData(0, v4, 0, 0, 0);
    CFRelease(v4);
    if (v5)
    {
      v6 = CFGetTypeID(v5);
      if (v6 == CFDictionaryGetTypeID())
      {
        v4 = (const __CFData *)_CFXPCCreateXPCObjectFromCFObject();
        if (v4)
          v7 = 0;
        else
          v7 = -6700;
      }
      else
      {
        v4 = 0;
        v7 = -6756;
      }
    }
    else
    {
      v4 = 0;
      v7 = -6717;
    }
  }
  else
  {
    v5 = 0;
    v7 = -6728;
  }
  if (a3)
    *a3 = v7;
  if (v5)
    CFRelease(v5);
  return v4;
}

xpc_object_t mdns_xpc_string_create_with_format(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return xpc_string_create_with_format_and_arguments("%.*s", &a9);
}

uint64_t mdns_tlv16_get_value(unsigned __int16 *a1, unint64_t a2, int a3, int64_t *a4, unsigned __int16 **a5, _QWORD *a6)
{
  int64_t v6;
  unsigned __int16 *v7;
  unsigned int v8;
  uint64_t v9;

  if ((unint64_t)a1 > a2)
    return 4294960586;
  do
  {
    if ((uint64_t)(a2 - (_QWORD)a1) < 1)
      return 4294960569;
    if (a2 - (unint64_t)a1 < 4)
      return 4294960546;
    v6 = __rev16(a1[1]);
    v7 = a1 + 2;
    if ((uint64_t)(a2 - (_QWORD)(a1 + 2)) < v6)
      return 4294960546;
    v8 = bswap32(*a1);
    a1 = (unsigned __int16 *)((char *)v7 + v6);
  }
  while (a3 != HIWORD(v8));
  if (a4)
    *a4 = v6;
  if (a5)
    *a5 = v7;
  v9 = 0;
  if (a6)
    *a6 = a1;
  return v9;
}

uint64_t mdns_tlv16_set(_BYTE *a1, uint64_t a2, __int16 a3, size_t __n, void *__src, _QWORD *a6)
{
  uint64_t v7;
  _BYTE *v8;
  uint64_t result;

  v7 = __n;
  if (a2 && a2 - (uint64_t)a1 < __n + 4)
    return 4294960533;
  *a1 = HIBYTE(a3);
  a1[1] = a3;
  a1[2] = BYTE1(__n);
  a1[3] = __n;
  v8 = a1 + 4;
  if ((_DWORD)__n)
    memcpy(a1 + 4, __src, __n);
  result = 0;
  if (a6)
    *a6 = &v8[v7];
  return result;
}

uint64_t mdns_tlv16_get_required_length(unsigned int a1)
{
  return a1 + 4;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x24BDBB8A0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
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

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x24BDBC138](number);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x24BDBC418](theSet, values);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x24BDBC7C8](anURL, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC850](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x24BDD8758](time_to_wake, my_id, type);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x24BDD8770]();
}

uint64_t IOPMRequestSysWake()
{
  return MEMORY[0x24BDD8798]();
}

uint64_t PFUserAddRule()
{
  return MEMORY[0x24BE6E578]();
}

uint64_t PFUserBeginRules()
{
  return MEMORY[0x24BE6E580]();
}

uint64_t PFUserCommitRules()
{
  return MEMORY[0x24BE6E588]();
}

uint64_t PFUserCreate()
{
  return MEMORY[0x24BE6E590]();
}

uint64_t PFUserDeleteRules()
{
  return MEMORY[0x24BE6E598]();
}

uint64_t PFUserRelease()
{
  return MEMORY[0x24BE6E5A0]();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x24BDF5648](store, nameEncoding);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return (CFStringRef)MEMORY[0x24BDF56A0](allocator, domain);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreRemoveValue(SCDynamicStoreRef store, CFStringRef key)
{
  return MEMORY[0x24BDF56B8](store, key);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF56C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x24BDF56D8](store, key, value);
}

int SCError(void)
{
  return MEMORY[0x24BDF56E0]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF5858](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF5860](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5870](allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x24BDF5888](prefs, wait);
}

Boolean SCPreferencesSetComputerName(SCPreferencesRef prefs, CFStringRef name, CFStringEncoding nameEncoding)
{
  return MEMORY[0x24BDF58A8](prefs, name, *(_QWORD *)&nameEncoding);
}

Boolean SCPreferencesSetLocalHostName(SCPreferencesRef prefs, CFStringRef name)
{
  return MEMORY[0x24BDF58B8](prefs, name);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF58D0](prefs);
}

uint64_t SecCertificateCopyDNSNames()
{
  return MEMORY[0x24BDE8848]();
}

uint64_t SecCertificateCopyIPAddresses()
{
  return MEMORY[0x24BDE8870]();
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x24BDE8A40]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x24BDE8A60]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x24BDE8D90](trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x24BDE8DE8](trust, queue, result);
}

OSStatus SecTrustSetNetworkFetchAllowed(SecTrustRef trust, Boolean allowFetch)
{
  return MEMORY[0x24BDE8E40](trust, allowFetch);
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x24BDE8E80]();
}

uint64_t SecTrustStoreRemoveCertificate()
{
  return MEMORY[0x24BDE8E98]();
}

uint64_t SecTrustStoreSetTrustSettings()
{
  return MEMORY[0x24BDE8EA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x24BDACBD0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x24BDAD378]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x24BDAD670]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x24BDAD698]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x24BDAD6A0]();
}

uint64_t cchpke_initiator_encrypt()
{
  return MEMORY[0x24BDAD6C8]();
}

uint64_t cchpke_initiator_export()
{
  return MEMORY[0x24BDAD6D0]();
}

uint64_t cchpke_initiator_setup()
{
  return MEMORY[0x24BDAD6D8]();
}

uint64_t cchpke_params_sizeof_aead_key()
{
  return MEMORY[0x24BDAD6E0]();
}

uint64_t cchpke_params_sizeof_aead_nonce()
{
  return MEMORY[0x24BDAD6E8]();
}

uint64_t cchpke_params_sizeof_aead_tag()
{
  return MEMORY[0x24BDAD6F0]();
}

uint64_t cchpke_params_sizeof_kdf_hash()
{
  return MEMORY[0x24BDAD6F8]();
}

uint64_t cchpke_params_sizeof_kem_enc()
{
  return MEMORY[0x24BDAD700]();
}

uint64_t cchpke_params_x25519_AESGCM128_HKDF_SHA256()
{
  return MEMORY[0x24BDAD708]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x24BDADD78](data, buffer_ptr, size_ptr);
}

uint64_t dispatch_data_create_with_transform()
{
  return MEMORY[0x24BDADD88]();
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFA8](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x24BDAEB40]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x24BDAED38](size);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

uint64_t ne_session_set_socket_attributes()
{
  return MEMORY[0x24BDAF068]();
}

uint64_t necp_client_action()
{
  return MEMORY[0x24BDAF0D8]();
}

uint64_t necp_open()
{
  return MEMORY[0x24BDAF0E8]();
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x24BDE0958]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x24BDE0968]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x24BDE0988]();
}

uint64_t nw_array_append()
{
  return MEMORY[0x24BDE0A18]();
}

uint64_t nw_array_apply()
{
  return MEMORY[0x24BDE0A20]();
}

uint64_t nw_array_contains_object()
{
  return MEMORY[0x24BDE0A30]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x24BDE0A40]();
}

uint64_t nw_array_remove_object()
{
  return MEMORY[0x24BDE0A58]();
}

void nw_connection_access_establishment_report(nw_connection_t connection, dispatch_queue_t queue, nw_establishment_report_access_block_t access_block)
{
  MEMORY[0x24BDE0AE0](connection, queue, access_block);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0B00](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B70](endpoint, parameters);
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x24BDE0B90]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C30](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C40](connection, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C50](connection, content, context, is_complete, completion);
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x24BDE0C78]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C90](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CA8](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CC8](connection);
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x24BDE0CE0]();
}

uint64_t nw_connection_state_to_string()
{
  return MEMORY[0x24BDE0CE8]();
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x24BDE0D08](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x24BDE0D18](context_identifier);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return MEMORY[0x24BDE0D28](context);
}

void nw_content_context_set_is_final(nw_content_context_t context, BOOL is_final)
{
  MEMORY[0x24BDE0D30](context, is_final);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
  MEMORY[0x24BDE0D48](context, protocol_metadata);
}

uint64_t nw_endpoint_copy_interface()
{
  return MEMORY[0x24BDE0E40]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E60](address);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E90](hostname, port);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x24BDE0EA0]();
}

nw_endpoint_t nw_endpoint_create_url(const char *url)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0EB0](url);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x24BDE0EC8](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F18](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F38](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F58](endpoint);
}

const char *__cdecl nw_endpoint_get_url(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F60](endpoint);
}

uint64_t nw_endpoint_get_url_path()
{
  return MEMORY[0x24BDE0F70]();
}

uint64_t nw_endpoint_get_url_scheme()
{
  return MEMORY[0x24BDE0F78]();
}

uint64_t nw_endpoint_set_interface()
{
  return MEMORY[0x24BDE0F98]();
}

uint64_t nw_endpoint_set_parent_endpoint()
{
  return MEMORY[0x24BDE0FA0]();
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x24BDE0FC0](error);
}

void nw_establishment_report_enumerate_resolution_reports(nw_establishment_report_t report, nw_report_resolution_report_enumerator_t enumerate_block)
{
  MEMORY[0x24BDE0FE8](report, enumerate_block);
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1100](identifier, *(_QWORD *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x24BDE1108](framer_definition);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x24BDE1120](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
  MEMORY[0x24BDE1138](framer, *(_QWORD *)&error_code);
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x24BDE1148](framer);
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x24BDE1168](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
  MEMORY[0x24BDE1188](framer, input_handler);
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
  MEMORY[0x24BDE1198](framer, output_handler);
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
  MEMORY[0x24BDE11A8](framer, output_buffer, output_length);
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x24BDE11B0](framer, output_length);
}

uint64_t nw_http_create_metadata_for_request()
{
  return MEMORY[0x24BDE11D8]();
}

uint64_t nw_http_create_metadata_for_response()
{
  return MEMORY[0x24BDE11E8]();
}

uint64_t nw_http_fields_access_value_by_name()
{
  return MEMORY[0x24BDE1238]();
}

uint64_t nw_http_fields_create()
{
  return MEMORY[0x24BDE1258]();
}

uint64_t nw_http_fields_set_value_by_name()
{
  return MEMORY[0x24BDE1268]();
}

uint64_t nw_http_metadata_copy_request()
{
  return MEMORY[0x24BDE1278]();
}

uint64_t nw_http_metadata_copy_response()
{
  return MEMORY[0x24BDE1290]();
}

uint64_t nw_http_metadata_get_version()
{
  return MEMORY[0x24BDE1298]();
}

uint64_t nw_http_oblivious_config_is_valid()
{
  return MEMORY[0x24BDE12A0]();
}

uint64_t nw_http_request_access_authority()
{
  return MEMORY[0x24BDE12A8]();
}

uint64_t nw_http_request_access_path()
{
  return MEMORY[0x24BDE12C0]();
}

uint64_t nw_http_request_create_from_url()
{
  return MEMORY[0x24BDE12E0]();
}

uint64_t nw_http_request_has_method()
{
  return MEMORY[0x24BDE12E8]();
}

uint64_t nw_http_request_set_header_fields()
{
  return MEMORY[0x24BDE1310]();
}

uint64_t nw_http_response_copy_header_fields()
{
  return MEMORY[0x24BDE1320]();
}

uint64_t nw_http_response_create_well_known()
{
  return MEMORY[0x24BDE1330]();
}

uint64_t nw_http_response_get_status_code()
{
  return MEMORY[0x24BDE1340]();
}

uint64_t nw_http_response_set_header_fields()
{
  return MEMORY[0x24BDE1350]();
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x24BDE1370]();
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x24BDE1388]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x24BDE13A0](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x24BDE13B8](interface);
}

uint64_t nw_oblivious_http_create_options()
{
  return MEMORY[0x24BDE14F8]();
}

uint64_t nw_parameters_add_custom_proxy_config()
{
  return MEMORY[0x24BDE1500]();
}

uint64_t nw_parameters_clear_custom_proxy_configs()
{
  return MEMORY[0x24BDE1508]();
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x24BDE1510](parameters);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x24BDE1530](parameters);
}

uint64_t nw_parameters_copy_url_endpoint()
{
  return MEMORY[0x24BDE1548]();
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1550]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1590](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1598](configure_dtls, configure_udp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
  MEMORY[0x24BDE1628](parameters, interface);
}

uint64_t nw_parameters_set_e_proc_uuid()
{
  return MEMORY[0x24BDE1668]();
}

void nw_parameters_set_fast_open_enabled(nw_parameters_t parameters, BOOL fast_open_enabled)
{
  MEMORY[0x24BDE1680](parameters, fast_open_enabled);
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x24BDE16A0]();
}

uint64_t nw_parameters_set_metadata()
{
  return MEMORY[0x24BDE16D8]();
}

uint64_t nw_parameters_set_no_wake_from_sleep()
{
  return MEMORY[0x24BDE16F0]();
}

uint64_t nw_parameters_set_pid()
{
  return MEMORY[0x24BDE16F8]();
}

void nw_parameters_set_prefer_no_proxy(nw_parameters_t parameters, BOOL prefer_no_proxy)
{
  MEMORY[0x24BDE1708](parameters, prefer_no_proxy);
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x24BDE1768]();
}

uint64_t nw_parameters_set_url()
{
  return MEMORY[0x24BDE1798]();
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x24BDE17B8]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x24BDE17D0]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x24BDE17F8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x24BDE1810]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x24BDE1820]();
}

uint64_t nw_path_evaluator_set_cancel_handler()
{
  return MEMORY[0x24BDE1838]();
}

uint64_t nw_path_evaluator_set_queue()
{
  return MEMORY[0x24BDE1840]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x24BDE1850]();
}

uint64_t nw_path_evaluator_start()
{
  return MEMORY[0x24BDE1860]();
}

uint64_t nw_path_get_reason()
{
  return MEMORY[0x24BDE1918]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1930](path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return MEMORY[0x24BDE1960](path);
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return MEMORY[0x24BDE1970](path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return MEMORY[0x24BDE1980](path);
}

uint64_t nw_path_has_nat64_prefixes()
{
  return MEMORY[0x24BDE1990]();
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x24BDE1998](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x24BDE19C0](path);
}

uint64_t nw_path_is_per_app_vpn()
{
  return MEMORY[0x24BDE19E8]();
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A00](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A18]();
}

void nw_path_monitor_set_cancel_handler(nw_path_monitor_t monitor, nw_path_monitor_cancel_handler_t cancel_handler)
{
  MEMORY[0x24BDE1A28](monitor, cancel_handler);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A30](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A40](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A58](monitor);
}

uint64_t nw_protocol_copy_http_definition()
{
  return MEMORY[0x24BDE1B48]();
}

uint64_t nw_protocol_stack_append_application_protocol()
{
  return MEMORY[0x24BDE2020]();
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
  MEMORY[0x24BDE2030](stack);
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x24BDE2048](stack, protocol);
}

uint64_t nw_proxy_config_set_prohibit_direct()
{
  return MEMORY[0x24BDE2088]();
}

void nw_release(void *obj)
{
  MEMORY[0x24BDE2388](obj);
}

uint64_t nw_resolution_report_enumerate_endpoints()
{
  return MEMORY[0x24BDE2390]();
}

uint64_t nw_resolver_config_cancel_updates()
{
  return MEMORY[0x24BDE23A0]();
}

uint64_t nw_resolver_config_copy_proxy_config()
{
  return MEMORY[0x24BDE23A8]();
}

uint64_t nw_resolver_config_create()
{
  return MEMORY[0x24BDE23B0]();
}

uint64_t nw_resolver_config_create_with_dictionary()
{
  return MEMORY[0x24BDE23B8]();
}

uint64_t nw_resolver_config_enumerate_match_domains()
{
  return MEMORY[0x24BDE23C0]();
}

uint64_t nw_resolver_config_enumerate_name_servers()
{
  return MEMORY[0x24BDE23C8]();
}

uint64_t nw_resolver_config_get_allow_failover()
{
  return MEMORY[0x24BDE23D0]();
}

uint64_t nw_resolver_config_get_class()
{
  return MEMORY[0x24BDE23D8]();
}

uint64_t nw_resolver_config_get_identifier()
{
  return MEMORY[0x24BDE23E0]();
}

uint64_t nw_resolver_config_get_identity_reference()
{
  return MEMORY[0x24BDE23E8]();
}

uint64_t nw_resolver_config_get_interface_name()
{
  return MEMORY[0x24BDE23F0]();
}

uint64_t nw_resolver_config_get_odoh_config()
{
  return MEMORY[0x24BDE23F8]();
}

uint64_t nw_resolver_config_get_protocol()
{
  return MEMORY[0x24BDE2400]();
}

uint64_t nw_resolver_config_get_provider_name()
{
  return MEMORY[0x24BDE2408]();
}

uint64_t nw_resolver_config_get_provider_path()
{
  return MEMORY[0x24BDE2410]();
}

uint64_t nw_resolver_config_report_error()
{
  return MEMORY[0x24BDE2418]();
}

uint64_t nw_resolver_config_set_class()
{
  return MEMORY[0x24BDE2420]();
}

uint64_t nw_resolver_config_set_identifier()
{
  return MEMORY[0x24BDE2428]();
}

uint64_t nw_resolver_config_set_interface_name()
{
  return MEMORY[0x24BDE2430]();
}

uint64_t nw_resolver_config_set_odoh_config()
{
  return MEMORY[0x24BDE2438]();
}

uint64_t nw_resolver_config_set_protocol()
{
  return MEMORY[0x24BDE2440]();
}

uint64_t nw_resolver_config_set_provider_name()
{
  return MEMORY[0x24BDE2448]();
}

uint64_t nw_resolver_config_set_provider_path()
{
  return MEMORY[0x24BDE2450]();
}

uint64_t nw_resolver_config_watch_updates()
{
  return MEMORY[0x24BDE2458]();
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x24BDE2490](obj);
}

uint64_t nw_settings_get_ddr_enabled()
{
  return MEMORY[0x24BDE24E0]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE25F8](options);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x24BDAF1B0]();
}

uint64_t nwi_ifstate_get_signature()
{
  return MEMORY[0x24BDAF1D8]();
}

uint64_t nwi_ifstate_get_vpn_server()
{
  return MEMORY[0x24BDAF1E0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x24BDAF1E8]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x24BDAF200]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x24BDAF210]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x24BDAF220]();
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x24BDAFAE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x24BDE9580](identity);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x24BDE95D8](options, application_protocol);
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x24BDE9620](options, identity);
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
  MEMORY[0x24BDE9640](options, peer_authentication_required);
}

void sec_protocol_options_set_tls_server_name(sec_protocol_options_t options, const char *server_name)
{
  MEMORY[0x24BDE96A0](options, server_name);
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x24BDE96B0](options, verify_block, verify_block_queue);
}

void sec_release(void *obj)
{
  MEMORY[0x24BDE96B8](obj);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x24BDE96C0](trust);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x24BDAFCF8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x24BEB35B0]();
}

uint64_t symptom_new()
{
  return MEMORY[0x24BEB35C0]();
}

uint64_t symptom_send()
{
  return MEMORY[0x24BEB35D0]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x24BEB35E0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
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

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
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

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
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

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
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

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

xpc_object_t xpc_string_create_with_format_and_arguments(const char *fmt, va_list ap)
{
  return (xpc_object_t)MEMORY[0x24BDB0B98](fmt, ap);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}


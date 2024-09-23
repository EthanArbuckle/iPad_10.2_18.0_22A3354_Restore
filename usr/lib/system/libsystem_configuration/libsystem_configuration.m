void config_agent_free_dns_information(void *a1)
{
  if (a1)
    xpc_release(a1);
  else
    syslog(3, "Attempting to free invalid resolver");
}

dispatch_queue_t ____nwi_client_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.SystemConfiguration.NetworkInformation", 0);
  __nwi_client_queue_q = (uint64_t)result;
  return result;
}

dispatch_queue_t ____dns_configuration_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.SystemConfiguration.DNSConfiguration", 0);
  __dns_configuration_queue_q = (uint64_t)result;
  return result;
}

void __dns_configuration_free_block_invoke()
{
  if (!--dnsinfo_active)
  {
    libSC_info_client_release(dnsinfo_client);
    dnsinfo_client = 0;
  }
}

void libSC_info_client_release(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 8));
}

void dns_configuration_free(void *a1)
{
  if (a1)
  {
    if (__dns_configuration_queue_once != -1)
      dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_15);
    dispatch_sync((dispatch_queue_t)__dns_configuration_queue_q, &__block_literal_global_10);
    free(a1);
  }
}

void libSC_client_dealloc(void **a1)
{
  if (a1)
  {
    free(a1[2]);
    free(a1[3]);
    free(a1);
  }
}

void ___nwi_client_init_block_invoke()
{
  BOOL v1;

  if (nwi_active++)
    v1 = nwi_client == 0;
  else
    v1 = 1;
  if (v1)
  {
    if (nwi_store_force_refresh_block_invoke_once != -1)
      dispatch_once(&nwi_store_force_refresh_block_invoke_once, &__block_literal_global_17);
    if (__nwi_client_queue_once != -1)
      dispatch_once(&__nwi_client_queue_once, &__block_literal_global_22);
    nwi_client = (uint64_t)libSC_info_client_create(__nwi_client_queue_q, "com.apple.SystemConfiguration.NetworkInformation", "Network information");
    if (!nwi_client)
      --nwi_active;
  }
}

void __dns_configuration_copy_block_invoke()
{
  BOOL v1;

  if (dnsinfo_active++)
    v1 = dnsinfo_client == 0;
  else
    v1 = 1;
  if (v1)
  {
    if (_block_invoke_once != -1)
      dispatch_once(&_block_invoke_once, &__block_literal_global_4);
    if (__dns_configuration_queue_once != -1)
      dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_15);
    dnsinfo_client = (uint64_t)libSC_info_client_create(__dns_configuration_queue_q, "com.apple.SystemConfiguration.DNSConfiguration", "DNS configuration");
    if (!dnsinfo_client)
      --dnsinfo_active;
  }
}

_QWORD *libSC_info_client_create(NSObject *a1, const char *a2, const char *a3)
{
  _QWORD *v3;
  _xpc_connection_s *mach_service;
  _QWORD handler[7];

  handler[6] = *MEMORY[0x1E0C874D8];
  if ((_available & 1) != 0)
    return 0;
  v3 = malloc_type_malloc(0x20uLL, 0x103004009027118uLL);
  *(_BYTE *)v3 = 1;
  v3[2] = strdup(a3);
  v3[3] = strdup(a2);
  mach_service = xpc_connection_create_mach_service(a2, a1, 2uLL);
  handler[0] = MEMORY[0x1E0C87450];
  handler[1] = 0x40000000;
  handler[2] = __libSC_info_client_create_block_invoke;
  handler[3] = &__block_descriptor_tmp_1;
  handler[4] = v3;
  handler[5] = mach_service;
  xpc_connection_set_event_handler(mach_service, handler);
  v3[1] = mach_service;
  xpc_connection_set_context(mach_service, v3);
  xpc_connection_set_finalizer_f(mach_service, (xpc_finalizer_t)libSC_client_dealloc);
  xpc_connection_resume(mach_service);
  return v3;
}

uint64_t nwi_state_copy()
{
  unsigned int v0;
  int v1;
  uint32_t v2;
  unsigned int *v3;
  int v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  const void *data;
  const void *v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  int check[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C874D8];
  if (nwi_state_copy_initialized != -1)
    dispatch_once(&nwi_state_copy_initialized, &__block_literal_global_0);
  pthread_mutex_lock(&nwi_store_lock);
  while (1)
  {
    v0 = __ldaxr((unsigned int *)&nwi_store_force_refresh);
    if (v0 != 1)
      break;
    if (!__stlxr(0, (unsigned int *)&nwi_store_force_refresh))
    {
      v1 = 1;
      goto LABEL_8;
    }
  }
  v1 = 0;
  __clrex();
LABEL_8:
  if (!G_nwi_state)
  {
    v3 = 0;
    goto LABEL_18;
  }
  check[0] = 0;
  if (nwi_store_token_valid != 1)
    goto LABEL_17;
  v2 = notify_check(nwi_store_token, check);
  if (v2)
  {
    fprintf((FILE *)*MEMORY[0x1E0C874E0], "nwi notify_check: failed with %u\n", v2);
LABEL_17:
    v3 = (unsigned int *)G_nwi_state;
    G_nwi_state = 0;
    goto LABEL_18;
  }
  if (check[0])
    v4 = 1;
  else
    v4 = v1;
  if (v4 == 1)
    goto LABEL_17;
  v3 = 0;
  v13 = G_nwi_state;
  if (G_nwi_state)
    goto LABEL_34;
LABEL_18:
  if (!libSC_info_available())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(check[0]) = 0;
      _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "*** network information requested between fork() and exec()", (uint8_t *)check, 2u);
    }
    goto LABEL_39;
  }
  _nwi_client_init();
  if (!nwi_client || !*(_BYTE *)nwi_client)
    goto LABEL_39;
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (client_proc_name)
    xpc_dictionary_set_string(v5, "proc_name", (const char *)client_proc_name);
  xpc_dictionary_set_int64(v6, "request_op", 131073);
  v7 = libSC_send_message_with_reply_sync(nwi_client, v6);
  xpc_release(v6);
  if (!v7)
  {
LABEL_39:
    v14 = 0;
    G_nwi_state = 0;
    goto LABEL_40;
  }
  *(_QWORD *)check = 0;
  data = xpc_dictionary_get_data(v7, "configuration", (size_t *)check);
  if (!data || (v9 = data, *(_QWORD *)check < 8uLL))
  {
LABEL_38:
    xpc_release(v7);
    goto LABEL_39;
  }
  v10 = (unsigned int *)malloc_type_malloc(*(size_t *)check, 0xA5BF6884uLL);
  memcpy(v10, v9, *(size_t *)check);
  if (*v10 != 538379777)
  {
    free(v10);
    goto LABEL_38;
  }
  v10[5] = 0;
  v11 = v10 + 5;
  xpc_release(v7);
  G_nwi_state = (uint64_t)v10;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 + 1, v11));
  v13 = G_nwi_state;
  if (!G_nwi_state)
  {
    v14 = 0;
    goto LABEL_40;
  }
LABEL_34:
  v15 = (unsigned int *)(v13 + 20);
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 + 1, v15));
  v14 = G_nwi_state;
LABEL_40:
  pthread_mutex_unlock(&nwi_store_lock);
  if (v3)
  {
    v17 = v3 + 5;
    do
    {
      v18 = __ldaxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
    {
      _nwi_client_release();
      free(v3);
    }
  }
  return v14;
}

_DWORD *dns_configuration_copy()
{
  xpc_object_t v0;
  void *v1;
  void *v2;
  unsigned int *data;
  size_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  _DWORD *v11;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  _DWORD *v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  _QWORD *v51;
  int v52;
  int v53;
  int v54;
  unsigned int *v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  int v62;
  size_t length;
  uint8_t buf[4];
  _BYTE v65[18];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C874D8];
  if (!libSC_info_available())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "*** DNS configuration requested between fork() and exec()", buf, 2u);
    }
    return 0;
  }
  if (__dns_configuration_queue_once != -1)
    dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_15);
  dispatch_sync((dispatch_queue_t)__dns_configuration_queue_q, &__block_literal_global);
  if (!dnsinfo_client || !*(_BYTE *)dnsinfo_client)
    return 0;
  v0 = xpc_dictionary_create(0, 0, 0);
  v1 = v0;
  if (dns_configuration_copy_proc_name)
    xpc_dictionary_set_string(v0, "proc_name", (const char *)dns_configuration_copy_proc_name);
  xpc_dictionary_set_int64(v1, "request_op", 65537);
  v2 = libSC_send_message_with_reply_sync(dnsinfo_client, v1);
  xpc_release(v1);
  if (!v2)
    return 0;
  length = 0;
  data = (unsigned int *)xpc_dictionary_get_data(v2, "configuration", &length);
  if (!data)
    goto LABEL_21;
  v4 = length;
  if (length < 0x38 || length >= 0x100001)
    goto LABEL_21;
  v5 = data;
  v6 = bswap32(data[12]) + 56;
  if (v6 != length)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v65 = v6;
      *(_WORD *)&v65[8] = 2048;
      *(_QWORD *)&v65[10] = v4;
      v8 = MEMORY[0x1E0C88E98];
      v9 = "DNS configuration: size error (%zu != %zu)";
      v10 = 22;
      goto LABEL_20;
    }
LABEL_21:
    xpc_release(v2);
    return 0;
  }
  v7 = bswap32(data[13]);
  if (0x100000 - length < v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v65 = v7;
      *(_WORD *)&v65[4] = 2048;
      *(_QWORD *)&v65[6] = 0x100000 - v4;
      v8 = MEMORY[0x1E0C88E98];
      v9 = "DNS configuration: padding error (%u > %zu)";
      v10 = 18;
LABEL_20:
      _os_log_impl(&dword_1DEEC8000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v11 = malloc_type_malloc(length + v7, 0x158E9C56uLL);
  memcpy(v11, v5, v4);
  bzero((char *)v11 + v4, v7);
  xpc_release(v2);
  if (!v11)
    return v11;
  v13 = v11[12];
  v14 = bswap32(v11[13]);
  v15 = bswap32(*v11);
  *v11 = v15;
  if (v14 < 8 * v15)
    goto LABEL_89;
  v16 = bswap32(v13);
  v17 = 8 * v15;
  v18 = 8 * v15 ? (uint64_t)v11 + v16 + 56 : 0;
  v19 = v14 - v17;
  *(_QWORD *)(v11 + 1) = v18;
  v20 = bswap32(v11[3]);
  v11[3] = v20;
  if (v19 < 8 * v20)
    goto LABEL_89;
  v21 = 8 * v20;
  v22 = (uint64_t)v11 + v16 + v17 + 56;
  v23 = v21 ? v22 : 0;
  v24 = v19 - v21;
  *((_QWORD *)v11 + 2) = v23;
  v25 = bswap32(v11[8]);
  v11[8] = v25;
  if (v24 < 8 * v25)
    goto LABEL_89;
  v26 = 8 * v25;
  v27 = v22 + v21;
  if (8 * v25)
    v28 = v22 + v21;
  else
    v28 = 0;
  *(_QWORD *)(v11 + 9) = v28;
  if (v16 < 8)
  {
    v31 = 0;
    v30 = 0;
    v29 = 0;
    goto LABEL_86;
  }
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v32 = v11 + 14;
  v33 = v24 - v26;
  v34 = v27 + v26;
  do
  {
    v35 = bswap32(v32[1]);
    v36 = bswap32(*v32);
    if (v36 - 1 > 2)
      goto LABEL_83;
    if (v35 - 8 < 0x64)
      goto LABEL_89;
    *((_QWORD *)v32 + 1) = 0;
    v37 = bswap32(v32[4]);
    v32[4] = v37;
    if (v33 < 8 * v37)
      goto LABEL_89;
    v38 = 8 * v37;
    v39 = 8 * v37 ? v34 : 0;
    v40 = v33 - v38;
    *(_QWORD *)(v32 + 5) = v39;
    *((_WORD *)v32 + 14) = bswap32(*((unsigned __int16 *)v32 + 14)) >> 16;
    v41 = bswap32(v32[8]);
    v32[8] = v41;
    if (v40 < 8 * v41)
      goto LABEL_89;
    v42 = 8 * v41;
    v43 = v34 + v38;
    v44 = 8 * v41 ? v43 : 0;
    v45 = v40 - v42;
    *(_QWORD *)(v32 + 9) = v44;
    v46 = bswap32(v32[11]);
    v32[11] = v46;
    if (v45 < 8 * v46)
      goto LABEL_89;
    v47 = 8 * v46;
    v48 = v43 + v42;
    v49 = 8 * v46 ? v48 : 0;
    *((_QWORD *)v32 + 6) = v49;
    *((_QWORD *)v32 + 7) = 0;
    *((int8x16_t *)v32 + 4) = vrev32q_s8(*((int8x16_t *)v32 + 4));
    *((int8x8_t *)v32 + 10) = vrev32_s8(*(int8x8_t *)(v32 + 20));
    v50 = v35 - 108;
    if (v35 - 108 != bswap32(v32[26]))
      goto LABEL_89;
    v51 = v32 + 2;
    if (v50 < 8)
    {
      v54 = 0;
      v53 = 0;
      v52 = 0;
    }
    else
    {
      v52 = 0;
      v53 = 0;
      v54 = 0;
      v55 = v32 + 27;
      do
      {
        v56 = v55[1];
        switch(bswap32(*v55))
        {
          case 0xAu:
            *v51 = v55 + 2;
            break;
          case 0xBu:
            v57 = *(_QWORD *)(v32 + 5);
            if (!v57)
              goto LABEL_89;
            *(_QWORD *)(v57 + 8 * v54++) = v55 + 2;
            break;
          case 0xCu:
            v58 = *(_QWORD *)(v32 + 9);
            if (!v58)
              goto LABEL_89;
            *(_QWORD *)(v58 + 8 * v53++) = v55 + 2;
            break;
          case 0xDu:
            v59 = *((_QWORD *)v32 + 6);
            if (!v59)
              goto LABEL_89;
            *(_QWORD *)(v59 + 8 * v52++) = v55 + 2;
            break;
          case 0xEu:
            *((_QWORD *)v32 + 7) = v55 + 2;
            break;
          case 0xFu:
            *((_QWORD *)v32 + 11) = v55 + 2;
            break;
          case 0x10u:
            *((_QWORD *)v32 + 12) = v55 + 2;
            break;
          default:
            break;
        }
        v60 = bswap32(v56);
        v55 = (unsigned int *)((char *)v55 + v60);
        v50 -= v60;
      }
      while (v50 > 7);
    }
    if (v54 != v37 || v53 != v41 || v52 != v46)
      goto LABEL_89;
    v34 = v48 + v47;
    v33 = v45 - v47;
    switch(v36)
    {
      case 3u:
        v61 = *(_QWORD *)(v11 + 9);
        if (!v61)
          goto LABEL_89;
        v62 = v29++;
        break;
      case 2u:
        v61 = *((_QWORD *)v11 + 2);
        if (!v61)
          goto LABEL_89;
        v62 = v30++;
        break;
      case 1u:
        v61 = *(_QWORD *)(v11 + 1);
        if (!v61)
          goto LABEL_89;
        v62 = v31++;
        break;
      default:
        goto LABEL_83;
    }
    *(_QWORD *)(v61 + 8 * v62) = v51;
LABEL_83:
    v32 = (_DWORD *)((char *)v32 + v35);
    v16 -= v35;
  }
  while (v16 > 7);
  v15 = *v11;
LABEL_86:
  if (v31 != v15 || v30 != v11[3] || v29 != v11[8])
  {
LABEL_89:
    free(v11);
    return 0;
  }
  return v11;
}

void *libSC_send_message_with_reply_sync(uint64_t a1, xpc_object_t message)
{
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  xpc_object_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  uint8_t v21[4];
  _DWORD v22[7];

  *(_QWORD *)&v22[5] = *MEMORY[0x1E0C874D8];
  v4 = (uint64_t *)(a1 + 16);
  v5 = MEMORY[0x1E0C88FE8];
  v6 = (void *)MEMORY[0x1E0C88F98];
  v7 = MEMORY[0x1E0C89000];
  v8 = MEMORY[0x1E0C88E98];
  while (1)
  {
    do
      v9 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 8), message);
    while (!v9);
    v10 = v9;
    v11 = MEMORY[0x1DF0F1630]();
    if (v11 == v5)
      break;
    v12 = v11;
    if (v10 != v6 || v11 != v7)
    {
      v14 = (void *)MEMORY[0x1E0C88FA0];
      v15 = os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT);
      if (v10 == v14 && v12 == v7)
      {
        if (v15)
        {
          v16 = *v4;
          v19 = 136315138;
          v20 = v16;
          _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "%s server not available", (uint8_t *)&v19, 0xCu);
        }
        *(_BYTE *)a1 = 0;
      }
      else
      {
        if (v15)
        {
          v17 = *v4;
          v19 = 136315138;
          v20 = v17;
          _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "%s xpc_connection_send_message_with_reply_sync() with unexpected reply", (uint8_t *)&v19, 0xCu);
        }
        log_xpc_object((uint64_t)"  reply", (uint64_t)v10);
      }
      xpc_release(v10);
      return 0;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      libSC_send_message_with_reply_sync_cold_1(v21, v4, v22);
    xpc_release(v6);
  }
  return v10;
}

BOOL libSC_info_available()
{
  return (_available & 1) == 0;
}

void _nwi_client_init()
{
  if (__nwi_client_queue_once != -1)
    dispatch_once(&__nwi_client_queue_once, &__block_literal_global_22);
  dispatch_sync((dispatch_queue_t)__nwi_client_queue_q, &__block_literal_global_14);
}

void _nwi_client_release()
{
  if (__nwi_client_queue_once != -1)
    dispatch_once(&__nwi_client_queue_once, &__block_literal_global_22);
  dispatch_sync((dispatch_queue_t)__nwi_client_queue_q, &__block_literal_global_12_0);
}

uint64_t config_agent_copy_dns_information(uint64_t a1)
{
  const char *v3;
  const char *v4;

  if (is_config_agent_type_dns(a1))
  {
    if (*(_DWORD *)(a1 + 212))
      return xpc_create_from_plist();
    v3 = (const char *)(a1 + 80);
    if (strncmp(v3, "DNSAgent(p)", 0xBuLL) && strncmp(v3, "DNSAgent(m)", 0xBuLL))
    {
      if (*v3)
        v4 = v3;
      else
        v4 = "DNSAgent";
      syslog(3, "Cannot parse config agent (%s). No data available", v4);
    }
  }
  return 0;
}

BOOL is_config_agent_type_proxy(_BOOL8 result)
{
  _BOOL8 v1;

  if (result)
  {
    v1 = result;
    return !strcmp((const char *)(result + 16), "SystemConfig") && strcmp((const char *)(v1 + 48), "ProxyAgent") == 0;
  }
  return result;
}

BOOL is_config_agent_type_dns(_BOOL8 result)
{
  _BOOL8 v1;

  if (result)
  {
    v1 = result;
    return !strcmp((const char *)(result + 16), "SystemConfig") && strcmp((const char *)(v1 + 48), "DNSAgent") == 0;
  }
  return result;
}

const char *__dns_configuration_copy_block_invoke_2()
{
  const char *result;

  result = getprogname();
  dns_configuration_copy_proc_name = (uint64_t)result;
  return result;
}

uint64_t nwi_state_get_first_ifstate(uint64_t result, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v2 = *(_DWORD *)(result + 4);
    if (v2 < 1)
      return 0;
    v3 = 12;
    if (a2 == 2)
      v3 = 8;
    if (*(int *)(result + v3) < 1)
    {
      return 0;
    }
    else
    {
      if (a2 != 30)
        v2 = 0;
      v4 = result + 112 * v2;
      if ((*(_BYTE *)(v4 + 56) & 8) != 0)
        return 0;
      else
        return v4 + 40;
    }
  }
  return result;
}

void nwi_state_release(unsigned int *a1)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  v2 = a1 + 5;
  do
  {
    v3 = __ldaxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  if (!v4)
  {
    _nwi_client_release();
    free(a1);
  }
}

uint64_t nwi_ifstate_get_flags(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 1;
  if (*(_BYTE *)(a1 + 32) != 2)
    v2 = 2;
  result = *(_QWORD *)(a1 + 16) & 0x44 | v2;
  if (a1)
  {
    v4 = *(_DWORD *)(a1 + 24);
    if (v4)
    {
      v5 = a1 + 112 * v4;
      v6 = 1;
      if (*(_BYTE *)(v5 + 32) != 2)
        v6 = 2;
      return *(_QWORD *)(v5 + 16) & 0x44 | result | v6;
    }
  }
  return result;
}

const char *nwi_state_get_notify_key()
{
  return "com.apple.system.SystemConfiguration.nwi";
}

const char *___nwi_client_init_block_invoke_2()
{
  const char *result;

  result = getprogname();
  client_proc_name = (uint64_t)result;
  return result;
}

uint64_t __nwi_state_copy_block_invoke()
{
  uint64_t result;

  result = notify_register_check("com.apple.system.SystemConfiguration.nwi", &nwi_store_token);
  if ((_DWORD)result)
    return fprintf((FILE *)*MEMORY[0x1E0C874E0], "nwi_state: registration failed (%u)\n", result);
  nwi_store_token_valid = 1;
  return result;
}

void ___nwi_client_release_block_invoke()
{
  if (!--nwi_active)
  {
    libSC_info_client_release(nwi_client);
    nwi_client = 0;
  }
}

const char *dns_configuration_notify_key()
{
  return "com.apple.system.SystemConfiguration.dns_configuration";
}

void _dns_configuration_ack(uint64_t a1)
{
  xpc_object_t v2;

  if (a1 && dnsinfo_client && *(_BYTE *)dnsinfo_client)
  {
    if (__dns_configuration_queue_once != -1)
      dispatch_once(&__dns_configuration_queue_once, &__block_literal_global_15);
    dispatch_sync((dispatch_queue_t)__dns_configuration_queue_q, &__block_literal_global_12);
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v2, "request_op", 65538);
    xpc_dictionary_set_uint64(v2, "generation", *(_QWORD *)(a1 + 24));
    xpc_connection_send_message(*(xpc_connection_t *)(dnsinfo_client + 8), v2);
    xpc_release(v2);
  }
}

void ___dns_configuration_ack_block_invoke()
{
  ++dnsinfo_active;
}

void _nwi_state_force_refresh()
{
  while (!__ldaxr((unsigned int *)&nwi_store_force_refresh))
  {
    if (!__stlxr(1u, (unsigned int *)&nwi_store_force_refresh))
      return;
  }
  __clrex();
}

void *_nwi_config_agent_copy_data(uint64_t a1, _QWORD *a2)
{
  void *v2;
  xpc_object_t v5;
  void *v6;
  const void *data;
  const void *v8;
  size_t v9;
  size_t size[2];

  v2 = 0;
  size[1] = *MEMORY[0x1E0C874D8];
  if (a1 && a2)
  {
    _nwi_client_init();
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "request_op", 131075);
    if (client_proc_name)
      xpc_dictionary_set_string(v5, "proc_name", (const char *)client_proc_name);
    xpc_dictionary_set_uuid(v5, "AgentUUID", (const unsigned __int8 *)a1);
    xpc_dictionary_set_string(v5, "AgentType", (const char *)(a1 + 48));
    v6 = libSC_send_message_with_reply_sync(nwi_client, v5);
    xpc_release(v5);
    if (v6)
    {
      size[0] = 0;
      data = xpc_dictionary_get_data(v6, "AgentData", size);
      v2 = 0;
      if (data)
      {
        v8 = data;
        if (size[0])
        {
          v2 = malloc_type_malloc(size[0], 0xE1DAE2B3uLL);
          v9 = size[0];
          *a2 = size[0];
          memcpy(v2, v8, v9);
        }
      }
      xpc_release(v6);
    }
    else
    {
      v2 = 0;
    }
    _nwi_client_release();
  }
  return v2;
}

void _nwi_state_ack(uint64_t a1)
{
  xpc_object_t v2;

  if (a1 && nwi_client && *(_BYTE *)nwi_client)
  {
    if (__nwi_client_queue_once != -1)
      dispatch_once(&__nwi_client_queue_once, &__block_literal_global_22);
    dispatch_sync((dispatch_queue_t)__nwi_client_queue_q, &__block_literal_global_9);
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v2, "request_op", 131074);
    xpc_dictionary_set_uint64(v2, "generation", *(_QWORD *)(a1 + 32));
    xpc_connection_send_message(*(xpc_connection_t *)(nwi_client + 8), v2);
    xpc_release(v2);
  }
}

void ___nwi_state_ack_block_invoke()
{
  ++nwi_active;
}

uint64_t nwi_state_get_generation(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t nwi_ifstate_get_generation(uint64_t a1)
{
  return *(_QWORD *)(a1 + 52);
}

const char *nwi_state_get_ifstate(_DWORD *a1, char *__s1)
{
  int v4;
  uint64_t v5;
  const char *i;
  int v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v4 = a1[1];
  v5 = a1[2];
  if ((int)v5 >= 1 && (int)v5 <= v4)
  {
    i = (const char *)(a1 + 10);
    while (strcmp(__s1, i))
    {
      i += 112;
      if (!--v5)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    v8 = v4;
    v9 = a1[3];
    if ((int)v9 < 1 || (int)v9 > v8)
      return 0;
    for (i = (const char *)&a1[28 * v8 + 10]; strcmp(__s1, i); i += 112)
    {
      if (!--v9)
        return 0;
    }
  }
  return i;
}

uint64_t nwi_ifstate_get_next(uint64_t a1, int a2)
{
  int v2;

  if (*(unsigned __int8 *)(a1 + 32) != a2)
  {
    v2 = *(_DWORD *)(a1 + 24);
    if (!v2)
      return 0;
    a1 += 112 * v2;
  }
  if ((*(_WORD *)(a1 + 16) & 0x1008) != 0)
    return 0;
  if ((*(_BYTE *)(a1 + 128) & 8) != 0)
    return 0;
  else
    return a1 + 112;
}

uint64_t nwi_ifstate_compare_rank(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  unsigned int v5;

  v2 = *(_DWORD *)(a1 + 28);
  v3 = *(_DWORD *)(a2 + 28);
  v4 = v2 == v3;
  if (v2 < v3)
    v5 = -1;
  else
    v5 = 1;
  if (v4)
    return 0;
  else
    return v5;
}

uint64_t nwi_state_get_reachability_flags(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1)
  {
    if (a2 == 30 || a2 == 2)
    {
      v2 = *(_DWORD *)(a1 + 4);
      if (v2 < 1)
        goto LABEL_14;
      v3 = 12;
      if (a2 == 2)
        v3 = 8;
      if (*(int *)(a1 + v3) < 1)
      {
LABEL_14:
        v5 = 0;
      }
      else
      {
        if (a2 != 30)
          v2 = 0;
        v4 = a1 + 112 * v2;
        if ((*(_BYTE *)(v4 + 56) & 8) != 0)
          v5 = 0;
        else
          v5 = v4 + 40;
      }
      v7 = (unsigned int *)(a1 + 24);
      if (a2 != 2)
        v7 = (unsigned int *)(a1 + 28);
      if (v5)
        v8 = (unsigned int *)(v5 + 60);
      else
        v8 = v7;
      return *v8;
    }
    v10 = *(_DWORD *)(a1 + 4);
    if (v10 >= 1)
    {
      if (*(int *)(a1 + 8) < 1)
      {
        if (*(int *)(a1 + 12) < 1)
          goto LABEL_40;
        v11 = 0;
      }
      else
      {
        v11 = a1 + 40;
        v12 = *(_QWORD *)(a1 + 56);
        if ((v12 & 8) != 0)
          v11 = 0;
        if (*(int *)(a1 + 12) <= 0)
        {
          if ((v12 & 8) != 0)
            goto LABEL_40;
          goto LABEL_37;
        }
      }
      v13 = a1 + 112 * v10;
      v14 = *(_QWORD *)(v13 + 56);
      if ((v14 & 8) != 0)
        v15 = 0;
      else
        v15 = v13 + 40;
      if (v11)
      {
        if ((v14 & 8) != 0 || *(_DWORD *)(v11 + 28) <= *(_DWORD *)(v15 + 28))
        {
LABEL_37:
          v8 = (unsigned int *)(v11 + 60);
          return *v8;
        }
LABEL_39:
        v8 = (unsigned int *)(v15 + 60);
        return *v8;
      }
      if ((v14 & 8) == 0)
        goto LABEL_39;
    }
LABEL_40:
    v6 = *(unsigned int *)(a1 + 24);
    if ((_DWORD)v6)
      return v6;
    v8 = (unsigned int *)(a1 + 28);
    return *v8;
  }
  return 0;
}

uint64_t nwi_ifstate_get_vpn_server(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 65))
    return a1 + 64;
  else
    return 0;
}

uint64_t nwi_ifstate_get_reachability_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 60);
}

uint64_t nwi_ifstate_get_signature(uint64_t a1, int a2, _DWORD *a3)
{
  int v3;
  uint64_t result;

  if (!a2)
    goto LABEL_7;
  if (a2 != 30 && a2 != 2)
    goto LABEL_9;
  if (*(unsigned __int8 *)(a1 + 32) != a2)
  {
    v3 = *(_DWORD *)(a1 + 24);
    if (!v3)
      goto LABEL_9;
    a1 += 112 * v3;
LABEL_7:
    if (a1)
      goto LABEL_8;
LABEL_9:
    result = 0;
    *a3 = 0;
    return result;
  }
LABEL_8:
  if ((*(_BYTE *)(a1 + 16) & 0x10) == 0)
    goto LABEL_9;
  *a3 = 20;
  return a1 + 92;
}

uint64_t nwi_ifstate_get_dns_signature(uint64_t a1, int *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  unint64_t v18;

  v3 = a1;
  *a2 = 0;
  if ((nwi_ifstate_get_flags(a1) & 4) != 0)
  {
    v5 = *(unsigned __int8 *)(v3 + 32);
    v6 = v3;
    if (v5 != 2)
    {
      v7 = *(_DWORD *)(v3 + 24);
      if (!v7)
      {
        v10 = 0;
        v11 = 0;
        goto LABEL_10;
      }
      v6 = v3 + 112 * v7;
    }
    v8 = *(_QWORD *)(v6 + 16);
    v9 = v6 + 92;
    if ((v8 & 0x10) != 0)
      v10 = 20;
    else
      v10 = 0;
    v11 = v9 & (v8 << 59 >> 63);
LABEL_10:
    v12 = v3;
    if (v5 != 30)
    {
      v13 = *(_DWORD *)(v3 + 24);
      if (!v13)
        goto LABEL_14;
      v12 = v3 + 112 * v13;
    }
    if ((*(_BYTE *)(v12 + 16) & 0x10) != 0)
    {
      v4 = v12 + 92;
      v14 = 20;
      goto LABEL_17;
    }
LABEL_14:
    v4 = 0;
    if (!v11)
      return v4;
    v14 = 0;
LABEL_17:
    v15 = v3;
    if (v5 != 2)
    {
      v16 = *(_DWORD *)(v3 + 24);
      if (!v16)
        goto LABEL_21;
      v15 = v3 + 112 * v16;
    }
    if ((nwi_ifstate_get_flags(v15) & 8) == 0)
    {
LABEL_27:
      *a2 = v10;
      return v11;
    }
LABEL_21:
    if (v5 != 30)
    {
      v17 = *(_DWORD *)(v3 + 24);
      if (!v17)
      {
        LOBYTE(v18) = 1;
LABEL_25:
        if ((v18 & (v10 != 0)) == 0)
        {
          v10 = v14;
          v11 = v4;
        }
        goto LABEL_27;
      }
      v3 += 112 * v17;
    }
    v18 = ((unint64_t)nwi_ifstate_get_flags(v3) >> 3) & 1;
    goto LABEL_25;
  }
  return 0;
}

uint64_t nwi_state_get_interface_names(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t result;
  int v5;
  int *v6;
  uint64_t v7;

  if (!a2 || !a3)
    return *(unsigned int *)(a1 + 16);
  result = *(unsigned int *)(a1 + 16);
  if ((int)result >= 1)
  {
    v5 = 2 * *(_DWORD *)(a1 + 4);
    v6 = (int *)(a1 + 224 * *(int *)(a1 + 4) + 40);
    v7 = *(unsigned int *)(a1 + 16);
    while (*v6 < v5)
    {
      *a2++ = a1 + 112 * *v6++ + 40;
      if (!--v7)
        return result;
    }
    return 0;
  }
  return result;
}

uint64_t _libSC_info_fork_child()
{
  uint64_t result;

  result = _dispatch_is_fork_of_multithreaded_parent();
  if ((_DWORD)result)
    _available = 1;
  return result;
}

void __libSC_info_client_create_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *string;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  v4 = MEMORY[0x1DF0F1630](a2);
  if (v4 == MEMORY[0x1E0C88FE8])
  {
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v12 = 136315138;
      v13 = v7;
      _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "%s: unexpected message", (uint8_t *)&v12, 0xCu);
    }
    log_xpc_object((uint64_t)"  dict = ", (uint64_t)a2);
  }
  else
  {
    v5 = v4;
    if (v4 == MEMORY[0x1E0C89000])
    {
      if (a2 == (void *)MEMORY[0x1E0C88FA0])
      {
        if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
          v12 = 136315138;
          v13 = v9;
          _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "%s: server not available", (uint8_t *)&v12, 0xCu);
        }
        **(_BYTE **)(a1 + 32) = 0;
      }
      else if (a2 == (void *)MEMORY[0x1E0C88F98])
      {
        if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEBUG))
          __libSC_info_client_create_block_invoke_cold_1(a1, v10, v11);
      }
      else
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C88FA8]);
        if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEBUG))
          __libSC_info_client_create_block_invoke_cold_2(a1, (uint64_t)string);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v12 = 136315394;
      v13 = v6;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "%s: unknown event type : %p", (uint8_t *)&v12, 0x16u);
    }
  }
}

void log_xpc_object(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  v3 = (void *)MEMORY[0x1DF0F15A0](a2);
  if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = a1;
    v6 = 2080;
    v7 = v3;
    _os_log_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "%s = %s", (uint8_t *)&v4, 0x16u);
  }
  free(v3);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

xpc_object_t config_agent_get_dns_nameservers(void *a1)
{
  if (a1 && MEMORY[0x1DF0F1630]() == MEMORY[0x1E0C88FE8])
    return xpc_dictionary_get_value(a1, "NameServers");
  else
    return 0;
}

xpc_object_t config_agent_get_dns_searchdomains(void *a1)
{
  if (a1 && MEMORY[0x1DF0F1630]() == MEMORY[0x1E0C88FE8])
    return xpc_dictionary_get_value(a1, "SearchDomains");
  else
    return 0;
}

uint64_t config_agent_copy_proxy_information(uint64_t a1)
{
  const char *v3;
  int v4;
  const char *v5;

  if (is_config_agent_type_proxy(a1))
  {
    if (*(_DWORD *)(a1 + 212))
      return xpc_create_from_plist();
    v4 = *(unsigned __int8 *)(a1 + 80);
    v3 = (const char *)(a1 + 80);
    if (v4)
      v5 = v3;
    else
      v5 = "ProxyAgent";
    syslog(3, "Cannot parse config agent (%s). No data available", v5);
  }
  return 0;
}

void *config_agent_update_proxy_information(void *a1)
{
  void *v1;
  xpc_object_t value;
  const unsigned __int8 *bytes_ptr;
  void *v4;
  void *v5;
  _QWORD applier[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uuid_t dst;
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
  uint64_t v25;
  uint64_t v26;

  v1 = a1;
  v26 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    v14 = 0u;
    v15 = 0u;
    *(_OWORD *)dst = 0u;
    v13 = 0u;
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    if (MEMORY[0x1DF0F1630](a1) == MEMORY[0x1E0C88FC0])
    {
      applier[0] = MEMORY[0x1E0C87450];
      applier[1] = 0x40000000;
      applier[2] = __get_agent_uuid_if_OOB_data_required_block_invoke;
      applier[3] = &unk_1EA95CCC8;
      applier[4] = &v8;
      xpc_array_apply(v1, applier);
    }
    else if (MEMORY[0x1DF0F1630](v1) == MEMORY[0x1E0C88FE8])
    {
      value = xpc_dictionary_get_value(v1, "OutOfBandDataUUID");
      v9[3] = (uint64_t)value;
    }
    if (v9[3] && MEMORY[0x1DF0F1630]() == MEMORY[0x1E0C88FD8] && xpc_data_get_length((xpc_object_t)v9[3]) >= 0x10)
    {
      bytes_ptr = (const unsigned __int8 *)xpc_data_get_bytes_ptr((xpc_object_t)v9[3]);
      uuid_copy(dst, bytes_ptr);
    }
    else
    {
      uuid_clear(dst);
    }
    _Block_object_dispose(&v8, 8);
    if (uuid_is_null(dst))
    {
      return 0;
    }
    else
    {
      applier[0] = 0;
      __strlcpy_chk();
      v4 = _nwi_config_agent_copy_data((uint64_t)dst, applier);
      v1 = 0;
      if (v4 && applier[0])
      {
        v5 = v4;
        v1 = (void *)xpc_create_from_plist();
        free(v5);
      }
    }
  }
  return v1;
}

void config_agent_free_proxy_information(void *a1)
{
  if (a1)
    xpc_release(a1);
  else
    syslog(3, "Attempting to free proxy configuration");
}

void __libSC_info_client_create_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1DEEC8000, MEMORY[0x1E0C88E98], a3, "%s: server failed", (uint8_t *)&v4);
}

void __libSC_info_client_create_block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  pid_t pid;
  int v5;
  uint64_t v6;
  __int16 v7;
  pid_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  v5 = 136315650;
  v6 = v3;
  v7 = 1024;
  v8 = pid;
  v9 = 2080;
  v10 = a2;
  _os_log_debug_impl(&dword_1DEEC8000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEBUG, "%s: connection error: %d : %s", (uint8_t *)&v5, 0x1Cu);
}

void libSC_send_message_with_reply_sync_cold_1(uint8_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *a2;
  *(_DWORD *)a1 = 136315138;
  *a3 = v3;
  OUTLINED_FUNCTION_0(&dword_1DEEC8000, MEMORY[0x1E0C88E98], (uint64_t)a3, "%s server failure, retrying", a1);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1E0C86EE0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88E90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB8](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87128](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C871F8](queue, block);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87730](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C877C0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C889E0](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C88A08](name, out_token);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D70](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D80](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C87418](*(_QWORD *)&a1, a2);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C87AE0](uu);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C87AF0](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C87B00](uu);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C89060](xarray, applier);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C890E0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C890E8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C890F0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C89100](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C89110](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C89118](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C89120](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C89128](connection, finalizer);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C89148](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C89158]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C89178](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C89180](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C891D0](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C891E8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C89200](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C89220](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C89230](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C89238](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C89240](xdict, key, uuid);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}


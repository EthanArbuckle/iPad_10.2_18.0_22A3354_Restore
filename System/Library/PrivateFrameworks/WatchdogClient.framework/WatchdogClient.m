__uint64_t __wd_kickoff_ping_block_invoke(uint64_t a1)
{
  __uint64_t result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (unint64_t *)&wd_endpoint[2 * *(int *)(a1 + 40) + 28];
  while (1)
  {
    v5 = __ldaxr(v4);
    if (v5 != v3)
      break;
    if (!__stlxr(result + 1, v4))
      return result;
  }
  __clrex();
  return result;
}

void wd_server_handler(uint64_t a1, uint64_t a2)
{
  mach_msg_header_t *msg;

  if (a2 != 1)
  {
    if (a2 != 2)
      wd_server_handler_cold_1();
    if ((dispatch_mach_mig_demux() & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(msg);
    }
  }
}

uint64_t _XPollIsAlive(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 64)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1179648)
    {
      result = _WDOGClient_PollIsAlive(*(unsigned int *)(result + 12), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), *(_DWORD *)(result + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -300;
  }
  else
  {
    v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _WDOGClient_PollIsAlive(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char **v24;
  unsigned int v25;
  char *v27;
  uint64_t v28;
  char *v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char __str[1024];
  char v40[1024];
  char v41[1024];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  bzero(v41, 0x400uLL);
  bzero(v40, 0x400uLL);
  bzero(__str, 0x400uLL);
  v28 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  v7 = qword_253D1E880;
  if (!qword_253D1E880)
    _WDOGClient_PollIsAlive_cold_1();
  if (dword_253D1E888 < 1)
  {
    v9 = 1;
  }
  else
  {
    v8 = 0;
    v9 = 1;
    v10 = (unint64_t *)&unk_253D1E6E8;
    do
    {
      v11 = atomic_load(v10);
      if (v11 == v7)
      {
        if (v41[0])
          __strlcat_chk();
        dispatch_queue_get_label((dispatch_queue_t)*(v10 - 1));
        __strlcat_chk();
        v9 = 0;
      }
      ++v8;
      v10 += 2;
    }
    while (v8 < dword_253D1E888);
    if (v41[0])
      snprintf(__str, 0x400uLL, "unresponsive dispatch queue(s): %s ", v41);
  }
  if (dword_253D1E88C >= 1)
  {
    v12 = 0;
    v13 = (unint64_t *)&unk_253D1E798;
    do
    {
      v14 = atomic_load(v13);
      if (v14 == v7)
      {
        if (v40[0])
          __strlcat_chk();
        __strlcat_chk();
        v9 = 0;
      }
      v13 += 3;
      ++v12;
    }
    while (v12 < dword_253D1E88C);
  }
  if (v40[0])
  {
    v29[0] = 0;
    asprintf(v29, "unresponsive work processor(s): %s ", v40);
    __strlcat_chk();
    free(v29[0]);
  }
  if (qword_253D1E878)
  {
    v29[0] = 0;
    if (((*(uint64_t (**)(void))(qword_253D1E878 + 16))() & 1) == 0)
    {
      v27 = 0;
      if (v29[0])
      {
        asprintf(&v27, "is_alive_func returned unhealthy : %s", v29[0]);
        free(v29[0]);
      }
      else
      {
        asprintf(&v27, "is_alive_func returned unhealthy");
      }
      __strlcat_chk();
      free(v27);
      v9 = 0;
    }
  }
  wd_kickoff_ping();
  if (byte_253D1E62C && (v15 = dword_253D1E630) != 0)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    *(_OWORD *)v29 = 0u;
    v30 = 0u;
    if (dword_253D1E630 < 1)
    {
      v17 = 0;
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v18 = (const char *)&unk_253D1E634;
      do
      {
        if (v18[32])
        {
          strlcpy((char *)&v29[4 * (int)v17++], v18, 0x20uLL);
          v15 = dword_253D1E630;
        }
        ++v16;
        v18 += 33;
      }
      while (v16 < v15);
    }
    v19 = v28;
    v24 = v29;
    v20 = a4;
    v21 = a2;
    v22 = a3;
    v23 = v9;
    v25 = v17;
  }
  else
  {
    v19 = v28;
    v20 = a4;
    v21 = a2;
    v22 = a3;
    v23 = v9;
    v24 = 0;
    v25 = 0;
  }
  _WDOGClient_ReplyIsAlive(v20, v21, v22, v23, __str, v19, v24, v25);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
  return 0;
}

void wd_kickoff_ping()
{
  __uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t *v7;
  void (*v8)(_QWORD *);
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&dword_253D1E628);
  if (!byte_253D1E890)
    _WDOGClient_PollIsAlive_cold_1();
  v0 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  qword_253D1E880 = v0;
  dword_253D1E888 = dword_253D1E6DC;
  v1 = dword_253D1E780;
  dword_253D1E88C = dword_253D1E780;
  v2 = MEMORY[0x24BDAC760];
  if (dword_253D1E6DC >= 1)
  {
    v3 = 0;
    v4 = (unint64_t *)&unk_253D1E6E8;
    do
    {
      atomic_store(v0, v4);
      v5 = *(v4 - 1);
      block[0] = v2;
      block[1] = 0x40000000;
      block[2] = __wd_kickoff_ping_block_invoke;
      block[3] = &__block_descriptor_tmp;
      block[4] = v0;
      v12 = v3;
      dispatch_async(v5, block);
      ++v3;
      v4 += 2;
    }
    while (v3 < dword_253D1E888);
    v1 = dword_253D1E88C;
  }
  if (v1 >= 1)
  {
    v6 = 0;
    v7 = (unint64_t *)&unk_253D1E798;
    do
    {
      atomic_store(v0, v7);
      v8 = (void (*)(_QWORD *))*(v7 - 2);
      v9[0] = v2;
      v9[1] = 0x40000000;
      v9[2] = __wd_kickoff_ping_block_invoke_2;
      v9[3] = &__block_descriptor_tmp_6;
      v9[4] = v0;
      v10 = v6;
      v8(v9);
      ++v6;
      v7 += 3;
    }
    while (v6 < dword_253D1E88C);
  }
}

uint64_t _WDOGClient_ReplyIsAlive(unsigned int a1, uint64_t a2, uint64_t a3, int a4, char *src, uint64_t a6, const void *a7, unsigned int a8)
{
  int v12;
  uint64_t v13;
  char *v14;
  char *v16;
  mach_msg_size_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[75];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  memset(v21, 0, 464);
  v18 = 0u;
  v19 = 0u;
  *((_QWORD *)&v19 + 1) = *MEMORY[0x24BDAC470];
  *(_QWORD *)&v20 = a2;
  *((_QWORD *)&v20 + 1) = a3;
  LODWORD(v21[0]) = a4;
  if (MEMORY[0x24BDAEF18])
    v12 = mig_strncpy_zerofill((char *)v21 + 12, src, 1024);
  else
    v12 = mig_strncpy((char *)v21 + 12, src, 1024);
  DWORD1(v21[0]) = 0;
  DWORD2(v21[0]) = v12;
  v13 = (v12 + 3) & 0xFFFFFFFC;
  v14 = (char *)&v18 + v13;
  *(_QWORD *)((char *)v21 + v13 + 12) = a6;
  if (a8 > 5)
    return 4294966989;
  v16 = v14 - 1024;
  memcpy(v14 + 72, a7, 32 * a8);
  *((_DWORD *)v16 + 273) = a8;
  v17 = v13 + 32 * a8 + 72;
  LODWORD(v18) = 18;
  *((_QWORD *)&v18 + 1) = a1;
  *(_QWORD *)&v19 = 0x5BB0A800000000;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
  return mach_msg((mach_msg_header_t *)&v18, 1, v17, 0, 0, 0, 0);
}

__uint64_t __wd_kickoff_ping_block_invoke_2(uint64_t a1)
{
  __uint64_t result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  result = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (unint64_t *)&wd_endpoint[3 * *(int *)(a1 + 40) + 50];
  while (1)
  {
    v5 = __ldaxr(v4);
    if (v5 != v3)
      break;
    if (!__stlxr(result + 1, v4))
      return result;
  }
  __clrex();
  return result;
}

char *wd_endpoint_register(const char *a1)
{
  char *result;

  if (!a1)
    _WDOGClient_PollIsAlive_cold_1();
  if (wd_endpoint)
    _WDOGClient_PollIsAlive_cold_1();
  result = strdup(a1);
  wd_endpoint = (uint64_t)result;
  if (!result)
    _WDOGClient_PollIsAlive_cold_1();
  dword_253D1E628 = 0;
  return result;
}

void wd_endpoint_add_queue(NSObject *a1)
{
  const char *label;
  int v3;

  if (!a1)
    _WDOGClient_PollIsAlive_cold_1();
  label = dispatch_queue_get_label(a1);
  if (!label)
    _WDOGClient_PollIsAlive_cold_1();
  if (!*label)
    _WDOGClient_PollIsAlive_cold_1();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  if (!wd_endpoint[0])
    _WDOGClient_PollIsAlive_cold_1();
  v3 = dword_253D1E6DC;
  if (dword_253D1E780 + dword_253D1E6DC >= 10)
    _WDOGClient_PollIsAlive_cold_1();
  wd_endpoint[2 * dword_253D1E6DC + 27] = (uint64_t)a1;
  dword_253D1E6DC = v3 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
}

void wd_endpoint_add_work_processor(uint64_t a1, const char *a2)
{
  int v4;
  uint64_t *v5;
  char *v6;

  if (!a1)
    _WDOGClient_PollIsAlive_cold_1();
  if (!a2)
    _WDOGClient_PollIsAlive_cold_1();
  if (!*a2)
    _WDOGClient_PollIsAlive_cold_1();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  if (!wd_endpoint[0])
    _WDOGClient_PollIsAlive_cold_1();
  v4 = dword_253D1E780;
  if (dword_253D1E780 + dword_253D1E6DC >= 10)
    _WDOGClient_PollIsAlive_cold_1();
  v5 = &wd_endpoint[3 * dword_253D1E780];
  v5[48] = a1;
  v6 = strdup(a2);
  v5[49] = (uint64_t)v6;
  if (!v6)
    _WDOGClient_PollIsAlive_cold_1();
  dword_253D1E780 = v4 + 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
}

void wd_endpoint_set_alive_func(const void *a1)
{
  if (!a1)
    _WDOGClient_PollIsAlive_cold_1();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  if (!wd_endpoint[0])
    _WDOGClient_PollIsAlive_cold_1();
  if (qword_253D1E878)
    _WDOGClient_PollIsAlive_cold_1();
  qword_253D1E878 = (uint64_t)_Block_copy(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
}

uint64_t wd_endpoint_activate()
{
  NSObject *v2;
  int v4;

  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  if (!wd_endpoint[0])
    _WDOGClient_PollIsAlive_cold_1();
  if (byte_253D1E890)
    _WDOGClient_PollIsAlive_cold_1();
  if (dword_253D1E6DC <= 0 && dword_253D1E780 <= 0 && qword_253D1E878 == 0)
    _WDOGClient_PollIsAlive_cold_1();
  byte_253D1E890 = 1;
  wd_kickoff_ping();
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
  if (qword_253D1E620)
    _WDOGClient_PollIsAlive_cold_1();
  if (!wd_endpoint[0])
    _WDOGClient_PollIsAlive_cold_1();
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  qword_253D1E620 = (uint64_t)dispatch_queue_create("com.apple.watchdog.framework", v2);
  if (!qword_253D1E620)
    _WDOGClient_PollIsAlive_cold_1();
  if (bootstrap_check_in(*MEMORY[0x24BDAD2F0], (const char *__attribute__((__org_typedef(name_t))))wd_endpoint[0], (mach_port_t *)&dword_253D1E610))
  {
    _WDOGClient_PollIsAlive_cold_1();
  }
  v4 = 1;
  if (MEMORY[0x20BCF805C](*MEMORY[0x24BDAEC58], dword_253D1E610, 1, &v4, 1))_WDOGClient_PollIsAlive_cold_1();
  qword_253D1E618 = dispatch_mach_create_f();
  return dispatch_mach_connect();
}

void wd_endpoint_set_platform_controller()
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  byte_253D1E62C = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
}

void wd_endpoint_begin_watchdog_monitoring_for_service(const char *a1)
{
  size_t v2;
  int v3;
  size_t v4;
  const char *v5;
  uint64_t v6;

  if (!a1)
    _WDOGClient_PollIsAlive_cold_1();
  v2 = strlen(a1);
  if (!v2)
    _WDOGClient_PollIsAlive_cold_1();
  if (v2 >= 0x20)
    _WDOGClient_PollIsAlive_cold_1();
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&dword_253D1E628);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  if (!byte_253D1E62C)
    _WDOGClient_PollIsAlive_cold_1();
  v3 = dword_253D1E630;
  if (dword_253D1E630 >= 1)
  {
    v4 = strlen(a1);
    v5 = (const char *)&unk_253D1E634;
    v6 = dword_253D1E630;
    do
    {
      if (strlen(v5) == v4 && !strcmp(v5, a1))
      {
        *((_BYTE *)v5 + 32) = 1;
        goto LABEL_13;
      }
      v5 += 33;
      --v6;
    }
    while (v6);
    if (v3 >= 5)
      _WDOGClient_PollIsAlive_cold_1();
  }
  __strlcpy_chk();
  *((_BYTE *)&wd_endpoint[9] + 33 * v3 + 4) = 1;
  ++dword_253D1E630;
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
}

void wd_endpoint_disable_monitoring_for_service(const char *a1)
{
  uint64_t v2;
  size_t v3;
  const char *v4;

  if (!a1)
    _WDOGClient_PollIsAlive_cold_1();
  if (!*a1)
    _WDOGClient_PollIsAlive_cold_1();
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&dword_253D1E628);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253D1E628);
  if (!byte_253D1E62C)
    _WDOGClient_PollIsAlive_cold_1();
  v2 = dword_253D1E630;
  if (dword_253D1E630 >= 1)
  {
    v3 = strlen(a1);
    v4 = (const char *)&unk_253D1E634;
    while (strlen(v4) != v3 || strcmp(v4, a1))
    {
      v4 += 33;
      if (!--v2)
        goto LABEL_11;
    }
    *((_BYTE *)v4 + 32) = 0;
  }
LABEL_11:
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253D1E628);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

uint64_t (*WatchdogServicePing_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 6010000)
    return _XPollIsAlive;
  else
    return 0;
}

uint64_t WatchdogServicePing_server(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  uint64_t result;
  int v5;

  v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = *(_DWORD *)(a1 + 20) + 100;
  *(_QWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (*(_DWORD *)(a1 + 20) != 6010000)
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 64)
  {
    v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    return 1;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1179648)
  {
    v5 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 32) = _WDOGClient_PollIsAlive(*(unsigned int *)(a1 + 12), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 28));
  return 1;
}

void _WDOGClient_PollIsAlive_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_crash();
  __break(1u);
}

void wd_server_handler_cold_1()
{
  const void *v0;

  v0 = (const void *)_os_crash();
  __break(1u);
  _Block_copy(v0);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2D8](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x24BDADE48]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x24BDADE58]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x24BDADE60]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x24BDADE70]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x24BDAEC10](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF10](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF18](dest, src, *(_QWORD *)&len);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}


void *kperf_kdebug_filter_create()
{
  return malloc_type_calloc(1uLL, 0x91uLL, 0x1000040C6B2EAB2uLL);
}

uint64_t kperf_kdebug_filter_add_class(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 0);
}

uint64_t kperf_kdebug_filter_add_internal(uint64_t a1, int a2, char a3)
{
  unint64_t v4;
  uint64_t result;

  if (!a1)
    kperf_kdebug_filter_add_internal_cold_1();
  v4 = *(unsigned __int8 *)(a1 + 144);
  if (v4 < 0x20)
  {
    result = 0;
    *(_BYTE *)(a1 + (v4 >> 1)) = *(_BYTE *)(a1 + (v4 >> 1)) & ~(15 << (4 * (v4 & 1))) | ((a3 & 0xF) << (4 * (v4 & 1)));
    *(_DWORD *)(a1 + 4 * v4 + 16) = a2;
    *(_BYTE *)(a1 + 144) = v4 + 1;
  }
  else
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t kperf_kdebug_filter_add_class_fn(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 1);
}

uint64_t kperf_kdebug_filter_add_class_subclass(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 2);
}

uint64_t kperf_kdebug_filter_add_class_subclass_fn(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 3);
}

uint64_t kperf_kdebug_filter_add_debugid(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 4);
}

uint64_t kperf_kdebug_filter_add_debugid_fn(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 5);
}

uint64_t kperf_kdebug_filter_get_n_filters(uint64_t a1)
{
  if (!a1)
    kperf_kdebug_filter_add_internal_cold_1();
  return *(unsigned __int8 *)(a1 + 144);
}

uint64_t kperf_kdebug_filter_get_filter(uint64_t a1, int a2, _DWORD *a3, int *a4)
{
  uint64_t v4;

  if (!a1)
    kperf_kdebug_filter_add_internal_cold_1();
  if (!a3)
    kperf_kdebug_filter_add_internal_cold_1();
  if (!a4)
    kperf_kdebug_filter_add_internal_cold_1();
  if (*(unsigned __int8 *)(a1 + 144) <= a2)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  else
  {
    v4 = 0;
    *a3 = *(_DWORD *)(a1 + 4 * a2 + 16);
    *a4 = (*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 1)) >> (4 * (a2 & 1))) & 0xF;
  }
  return v4;
}

uint64_t kperf_kdebug_filter_set(unsigned __int8 *a1)
{
  _OWORD v2[9];
  char v3;

  if (a1)
  {
    if (a1[144])
    {
      return sysctlbyname("kperf.kdebug.filter", 0, 0, a1, 4 * a1[144] + 16);
    }
    else
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    v3 = 0;
    memset(v2, 0, sizeof(v2));
    return sysctlbyname("kperf.kdebug.filter", 0, 0, v2, 0x10uLL);
  }
}

_BYTE *kperf_kdebug_filter_get()
{
  _BYTE *v0;
  size_t v1;
  int v2;
  size_t v4;

  v4 = 145;
  v0 = malloc_type_calloc(1uLL, 0x91uLL, 0x1000040C6B2EAB2uLL);
  if (v0)
  {
    if (sysctlbyname("kperf.kdebug.filter", v0, &v4, 0, 0) == -1)
    {
      v2 = *__error();
      goto LABEL_7;
    }
    v1 = v4 - 16;
    if (v4 < 0x10 || (v4 -= 16, v0[144] = v1 >> 2, (v1 & 0x3FC) == 0))
    {
      v2 = 22;
LABEL_7:
      free(v0);
      v0 = 0;
      *__error() = v2;
    }
  }
  return v0;
}

uint64_t kperf_kdebug_filter_add_desc(uint64_t a1, char *a2)
{
  char *v2;
  int v4;
  char v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  NSObject *v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *__endptr;
  uint8_t buf[4];
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  __endptr = 0;
  if (!a1)
    kperf_kdebug_filter_add_internal_cold_1();
  v2 = a2;
  if (!a2)
    kperf_kdebug_filter_add_internal_cold_1();
  do
  {
    v4 = *v2;
    if (!*v2)
      return 0;
    switch(v4)
    {
      case 'S':
        v5 = 2;
        v6 = 16;
        v7 = 0xFFFFLL;
        break;
      case 'D':
        v6 = 0;
        v5 = 4;
        v7 = 0xFFFFFFFFLL;
        break;
      case 'C':
        v5 = 0;
        v6 = 24;
        v7 = 255;
        break;
      default:
        *__error() = 22;
        v32 = kperf_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          kperf_kdebug_filter_add_desc_cold_3((uint64_t)v2, v32, v33, v34, v35, v36, v37, v38);
        return 0xFFFFFFFFLL;
    }
    v8 = strtoul(v2 + 1, &__endptr, 0);
    v9 = __endptr;
    if (__endptr == v2 + 1)
    {
      v18 = kperf_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        kperf_kdebug_filter_add_desc_cold_4((uint64_t)(v2 + 1), v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_36;
    }
    v10 = v8;
    if (v8 > v7)
    {
      v25 = kperf_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        kperf_kdebug_filter_add_desc_cold_5(v10, v25, v26, v27, v28, v29, v30, v31);
LABEL_36:
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
    v11 = (_DWORD)v8 << v6;
    v12 = *__endptr;
    if (v12 <= 0x6D)
    {
      if (!*__endptr || v12 == 44)
        goto LABEL_24;
    }
    else
    {
      switch(v12)
      {
        case 'n':
          v9 = __endptr + 1;
          goto LABEL_23;
        case 'r':
          v9 = __endptr + 1;
          v11 |= 2u;
          goto LABEL_23;
        case 's':
          v9 = __endptr + 1;
          v11 |= 1u;
LABEL_23:
          v5 |= 1u;
          goto LABEL_24;
      }
    }
    v13 = kperf_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *v9;
      *(_DWORD *)buf = 67109120;
      v41 = v14;
      _os_log_error_impl(&dword_2064F6000, v13, OS_LOG_TYPE_ERROR, "unrecognized suffix '%c'", buf, 8u);
    }
LABEL_24:
    if (*v9 == 44)
      v2 = v9 + 1;
    else
      v2 = v9;
  }
  while (!kperf_kdebug_filter_add_internal(a1, v11, v5));
  v15 = *__error();
  v16 = kperf_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    kperf_kdebug_filter_add_desc_cold_6(v11, v16);
  *__error() = v15;
  return 0xFFFFFFFFLL;
}

char *kperf_kdebug_filter_create_desc(uint64_t a1)
{
  int n_filters;
  int v3;
  size_t v4;
  char *v5;
  char *v6;
  int v7;
  size_t v8;
  BOOL v9;
  const char *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  int v14;
  const char *v15;
  unsigned int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  n_filters = kperf_kdebug_filter_get_n_filters(a1);
  if (n_filters)
  {
    v3 = n_filters;
    v4 = (14 * n_filters) | 1u;
    v5 = (char *)malloc_type_calloc(1uLL, v4, 0xD65A408uLL);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      while (1)
      {
        v35 = 0;
        if (kperf_kdebug_filter_get_filter(a1, v7, (_DWORD *)&v35 + 1, (int *)&v35))
          break;
        v9 = v35 > 5 || ((1 << v35) & 0x2A) == 0;
        if (v9)
        {
          v11 = "";
        }
        else
        {
          v10 = "r";
          if ((v35 & 0x200000000) == 0)
            v10 = "n";
          v11 = "s";
          if ((v35 & 0x100000000) == 0)
            v11 = v10;
        }
        if (v35 > 5)
        {
          v28 = kperf_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            kperf_kdebug_filter_create_desc_cold_2((uint64_t)&v35, v28, v29, v30, v31, v32, v33, v34);
          goto LABEL_35;
        }
        if (((1 << v35) & 3) != 0)
        {
          v12 = HIBYTE(HIDWORD(v35));
          HIDWORD(v35) >>= 24;
          v13 = 67;
          v14 = 2;
        }
        else if (((1 << v35) & 0xC) != 0)
        {
          v12 = HIWORD(HIDWORD(v35));
          HIDWORD(v35) >>= 16;
          v13 = 83;
          v14 = 4;
        }
        else
        {
          v12 = HIDWORD(v35) & 0xFFFFFFFC;
          HIDWORD(v35) &= 0xFFFFFFFC;
          v13 = 68;
          v14 = 8;
        }
        if (v8)
          v15 = ",";
        else
          v15 = "";
        v16 = snprintf(&v6[v8], v4 - v8, "%s%c0x%0*x%s", v15, v13, v14, v12, v11);
        if ((v16 & 0x80000000) != 0)
        {
          v26 = kperf_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            kperf_kdebug_filter_create_desc_cold_3(v7, v26);
          goto LABEL_35;
        }
        v8 += v16;
        if (v8 <= v4)
        {
          v9 = v3 - 1 == v7++;
          if (!v9)
            continue;
        }
        return v6;
      }
      v24 = kperf_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        kperf_kdebug_filter_create_desc_cold_4(v7, v24, v25);
LABEL_35:
      free(v6);
    }
    else
    {
      v17 = kperf_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        kperf_kdebug_filter_create_desc_cold_1(v4, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  return 0;
}

uint64_t kperf_kdebug_action_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.kdebug.action", 0, 0, &v2, 4uLL);
}

uint64_t kperf_kdebug_action_get(void *a1)
{
  size_t v2;

  if (!a1)
    kperf_kdebug_filter_add_internal_cold_1();
  v2 = 8;
  return sysctlbyname("kperf.kdebug.action", a1, &v2, 0, 0);
}

uint64_t kperf_kdbg_callstacks_set(int a1)
{
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  int v4;
  _OWORD v6[9];
  char v7;

  if (a1)
  {
    kperf_action_count_set(32);
    v1 = kperf_action_samplers_set(0x20u, 8u);
    if (!(_DWORD)v1)
    {
      v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x91uLL, 0x1000040C6B2EAB2uLL);
      if (v2)
      {
        v3 = v2;
        if (kperf_kdebug_filter_add_internal((uint64_t)v2, 554303488, 2)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 67895298, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 17432578, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 17563650, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 19922946, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 754974720, 0)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, -16777214, 1))
        {
          v1 = 0xFFFFFFFFLL;
        }
        else
        {
          v1 = kperf_kdebug_filter_set(v3);
          if (!(_DWORD)v1)
          {
            LODWORD(v6[0]) = 32;
            v1 = sysctlbyname("kperf.kdebug.action", 0, 0, v6, 4uLL);
          }
        }
        v4 = *__error();
        free(v3);
        *__error() = v4;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
  }
  else
  {
    v7 = 0;
    memset(v6, 0, sizeof(v6));
    v1 = sysctlbyname("kperf.kdebug.filter", 0, 0, v6, 0x10uLL);
    if (!(_DWORD)v1)
    {
      LODWORD(v6[0]) = 0;
      return sysctlbyname("kperf.kdebug.action", 0, 0, v6, 4uLL);
    }
  }
  return v1;
}

uint64_t kperf_kdbg_callstacks_get(_BOOL4 *a1)
{
  uint64_t result;
  _BOOL4 v3;
  int v4;
  uint64_t v5;
  size_t v6;

  v5 = 0;
  v4 = 0;
  result = kperf_action_count_get(&v5);
  if (!(_DWORD)result)
  {
    if ((_DWORD)v5 != 32)
      goto LABEL_7;
    result = kperf_action_samplers_get(0x20u, &v4);
    if ((_DWORD)result)
      return result;
    if (v4 == 8)
    {
      v6 = 8;
      result = sysctlbyname("kperf.kdebug.action", (char *)&v5 + 4, &v6, 0, 0);
      if ((_DWORD)result)
        return result;
      v3 = HIDWORD(v5) == 32;
    }
    else
    {
LABEL_7:
      v3 = 0;
    }
    result = 0;
    *a1 = v3;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

uint64_t kpc_pmu_version()
{
  unsigned int v1;
  size_t v2;

  v1 = 0;
  v2 = 4;
  if (sysctlbyname("kpc.pmu_version", &v1, &v2, 0, 0))
    return 0;
  else
    return v1;
}

uint64_t kpc_cpu_string(char *a1, size_t a2)
{
  uint64_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v6 = 0;
    v7 = 0;
    v5 = 32;
    if (sysctlbyname("hw.cputype", (char *)&v7 + 4, &v5, 0, 0)
      || sysctlbyname("hw.cpusubtype", &v7, &v5, 0, 0)
      || sysctlbyname("hw.cpufamily", (char *)&v6 + 4, &v5, 0, 0))
    {
      return 0xFFFFFFFFLL;
    }
    else if (sysctlbyname("machdep.cpu.model", &v6, &v5, 0, 0))
    {
      return snprintf(a1, a2, "cpu_%x_%x_%x");
    }
    else
    {
      return snprintf(a1, a2, "cpu_%x_%x_%x_%x");
    }
  }
  return result;
}

uint64_t kpc_set_counting(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kpc.counting", 0, 0, &v2, 4uLL);
}

uint64_t kpc_get_counting()
{
  unsigned int v1;
  size_t v2;

  v1 = 0;
  v2 = 4;
  if (sysctlbyname("kpc.counting", &v1, &v2, 0, 0))
    return 0;
  else
    return v1;
}

uint64_t kpc_set_thread_counting(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kpc.thread_counting", 0, 0, &v2, 4uLL);
}

uint64_t kpc_get_thread_counting()
{
  unsigned int v1;
  size_t v2;

  v1 = 0;
  v2 = 4;
  if (sysctlbyname("kpc.thread_counting", &v1, &v2, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return v1;
}

uint64_t kpc_get_config(unsigned int a1, void *a2)
{
  int v3;
  unsigned int v4;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;

  v6 = a1;
  v7 = 0;
  v9 = a1;
  v8 = 4;
  v3 = sysctlbyname("kpc.config_count", &v7, &v8, &v9, 4uLL);
  v4 = v7;
  if (v3 < 0)
    v4 = 0;
  v8 = 8 * v4;
  return sysctlbyname("kpc.config", a2, &v8, &v6, 8uLL);
}

uint64_t kpc_get_config_count(int a1)
{
  unsigned int v2;
  size_t v3;
  int v4;

  v2 = 0;
  v4 = a1;
  v3 = 4;
  if (sysctlbyname("kpc.config_count", &v2, &v3, &v4, 4uLL) >= 0)
    return v2;
  else
    return 0;
}

uint64_t kpc_get_counter_count(int a1)
{
  unsigned int v2;
  size_t v3;
  int v4;

  v2 = 0;
  v4 = a1;
  v3 = 4;
  if (sysctlbyname("kpc.counter_count", &v2, &v3, &v4, 4uLL) >= 0)
    return v2;
  else
    return 0;
}

uint64_t kpc_set_config(unsigned int a1, const void *a2)
{
  uint64_t v4;
  size_t v5;
  _QWORD *v6;
  void *v7;
  int v9;
  size_t v10;
  unsigned int v11;

  v9 = 0;
  v11 = a1;
  v10 = 4;
  v4 = 0xFFFFFFFFLL;
  if ((sysctlbyname("kpc.config_count", &v9, &v10, &v11, 4uLL) & 0x80000000) == 0 && v9)
  {
    v5 = (8 * v9);
    v6 = malloc_type_malloc((v5 + 8), 0x1D543C4AuLL);
    if (v6)
    {
      v7 = v6;
      *v6 = a1;
      memcpy(v6 + 1, a2, v5);
      v4 = sysctlbyname("kpc.config", 0, 0, v7, (v5 + 8));
      free(v7);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v4;
}

uint64_t kpc_get_cpu_counters(int a1, unsigned int a2, _DWORD *a3, void *a4)
{
  int v7;
  int v8;
  int v9;
  size_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  int v17;
  size_t v18;
  unsigned int v19;

  v15 = a2;
  v16 = 1;
  if (a1)
  {
    v15 = a2 | 0x80000000;
    if (kpc_cpu_count(&v16))
      return 0xFFFFFFFFLL;
    v7 = 8 * v16;
  }
  else
  {
    v7 = 8;
  }
  v17 = 0;
  v19 = a2;
  v18 = 4;
  v8 = sysctlbyname("kpc.counter_count", &v17, &v18, &v19, 4uLL);
  v9 = v17;
  if (v8 < 0)
    v9 = 0;
  v10 = (v7 * v9);
  v18 = v10 + 8;
  v11 = malloc_type_malloc(v10 + 8, 0xDE59F4E0uLL);
  if (!v11)
    return 0xFFFFFFFFLL;
  v12 = v11;
  bzero(v11, v10 + 8);
  v13 = sysctlbyname("kpc.counters", v12, &v18, &v15, 8uLL);
  if (a3)
    *a3 = *v12;
  memcpy(a4, v12 + 1, v10);
  free(v12);
  return v13;
}

uint64_t kpc_cpu_count(int *a1)
{
  int v2;
  uint64_t result;

  v2 = kpc_cpu_count_ncpus;
  if (kpc_cpu_count_ncpus)
    goto LABEL_2;
  if (!sysctlbyname("hw.ncpu", &kpc_cpu_count_ncpus, &kpc_cpu_count_ncpus_size, 0, 0))
  {
    v2 = kpc_cpu_count_ncpus;
LABEL_2:
    result = 0;
    *a1 = v2;
    return result;
  }
  return 0xFFFFFFFFLL;
}

uint64_t kpc_get_thread_counters(int a1, unsigned int a2, void *a3)
{
  size_t v4;
  int v5;

  v5 = a1;
  v4 = 8 * a2;
  return sysctlbyname("kpc.thread_counters", a3, &v4, &v5, 4uLL);
}

void *kpc_counterbuf_alloc()
{
  int v0;
  int v1;
  void *result;
  uint64_t v3;
  size_t v4;
  int v5;

  v5 = 3;
  v3 = 0;
  v4 = 4;
  if (sysctlbyname("kpc.counter_count", (char *)&v3 + 4, &v4, &v5, 4uLL) >= 0)
    v0 = HIDWORD(v3);
  else
    v0 = 0;
  v1 = kpc_cpu_count((int *)&v3);
  result = 0;
  if (!v1 && v0 >= 1)
    return malloc_type_calloc((int)v3 * (uint64_t)v0 + 1, 8uLL, 0x100004000313F17uLL);
  return result;
}

uint64_t kpc_set_period(unsigned int a1, const void *a2)
{
  size_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  int v9;
  size_t v10;
  unsigned int v11;

  v9 = 0;
  v11 = a1;
  v10 = 4;
  if (sysctlbyname("kpc.counter_count", &v9, &v10, &v11, 4uLL) >= 0)
    v4 = (8 * v9);
  else
    v4 = 0;
  v5 = malloc_type_malloc((v4 + 8), 0xB84DADB9uLL);
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = v5;
  *v5 = a1;
  memcpy(v5 + 1, a2, v4);
  v7 = sysctlbyname("kpc.period", 0, 0, v6, (v4 + 8));
  free(v6);
  return v7;
}

uint64_t kpc_get_period(unsigned int a1, void *a2)
{
  int v3;
  unsigned int v4;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;

  v6 = a1;
  v7 = 0;
  v9 = a1;
  v8 = 4;
  v3 = sysctlbyname("kpc.counter_count", &v7, &v8, &v9, 4uLL);
  v4 = v7;
  if (v3 < 0)
    v4 = 0;
  v8 = 8 * v4;
  return sysctlbyname("kpc.period", a2, &v8, &v6, 8uLL);
}

uint64_t kpc_set_actionid(unsigned int a1, const void *a2)
{
  size_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  int v9;
  size_t v10;
  unsigned int v11;

  v9 = 0;
  v11 = a1;
  v10 = 4;
  if (sysctlbyname("kpc.counter_count", &v9, &v10, &v11, 4uLL) >= 0)
    v4 = (4 * v9);
  else
    v4 = 0;
  v5 = malloc_type_malloc((v4 + 8), 0x390EE4DAuLL);
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = v5;
  *v5 = a1;
  memcpy(v5 + 1, a2, v4);
  v7 = sysctlbyname("kpc.actionid", 0, 0, v6, (v4 + 8));
  free(v6);
  return v7;
}

uint64_t kpc_get_actionid(unsigned int a1, void *a2)
{
  int v3;
  unsigned int v4;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;

  v6 = a1;
  v7 = 0;
  v9 = a1;
  v8 = 4;
  v3 = sysctlbyname("kpc.counter_count", &v7, &v8, &v9, 4uLL);
  v4 = v7;
  if (v3 < 0)
    v4 = 0;
  v8 = 4 * v4;
  return sysctlbyname("kpc.actionid", a2, &v8, &v6, 8uLL);
}

uint64_t kpc_sw_inc(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kpc.sw_inc", 0, 0, &v2, 4uLL);
}

uint64_t kpc_force_all_ctrs_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kpc.force_all_ctrs", 0, 0, &v2, 4uLL);
}

uint64_t kpc_force_all_ctrs_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kpc.force_all_ctrs", a1, &v2, 0, 0);
}

uint64_t trace_clear()
{
  int v0;
  uint64_t result;
  size_t v2;
  int v3[4];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  *__error() = 0;
  *(_OWORD *)v3 = xmmword_2064FB7F0;
  v4 = 0;
  v0 = sysctl(v3, 3u, 0, &v2, 0, 0);
  result = 0;
  if (v0 < 0)
    return *__error();
  return result;
}

uint64_t trace_bufinit(int a1)
{
  int v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *__error() = 0;
  *(_QWORD *)&v4 = 0x1800000001;
  DWORD2(v4) = 4;
  HIDWORD(v4) = a1;
  v5 = 0;
  if (sysctl((int *)&v4, 4u, 0, 0, 0, 0) < 0)
    return *__error();
  v4 = xmmword_2064FB800;
  v5 = 0;
  v2 = sysctl((int *)&v4, 3u, 0, 0, 0, 0);
  result = 0;
  if (v2 < 0)
    return *__error();
  return result;
}

uint64_t trace_rnginit()
{
  int v0;
  uint64_t result;
  uint64_t v2;
  int v3;
  uint64_t v4;
  size_t v5;
  int v6[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v2 = 0x40000;
  v3 = -1;
  v5 = 20;
  *(_OWORD *)v6 = xmmword_2064FB810;
  v7 = 0;
  if (sysctl(v6, 3u, &v2, &v5, 0, 0) < 0)
    return *__error();
  *(_OWORD *)v6 = xmmword_2064FB800;
  v7 = 0;
  v0 = sysctl(v6, 3u, 0, 0, 0, 0);
  result = 0;
  if (v0 < 0)
    return *__error();
  return result;
}

uint64_t trace_enable(int a1)
{
  int v1;
  uint64_t result;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 0x1800000001;
  v4 = 3;
  v5 = a1;
  v6 = 0;
  v1 = sysctl((int *)&v3, 4u, 0, 0, 0, 0);
  result = 0;
  if (v1 < 0)
    return *__error();
  return result;
}

uint64_t trace_perf_filter()
{
  int v0;
  uint64_t result;
  uint64_t v2;
  int v3;
  uint64_t v4;
  size_t v5;
  int v6[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v2 = 0x2500010000;
  v3 = 38;
  v5 = 20;
  *(_OWORD *)v6 = xmmword_2064FB810;
  v7 = 0;
  v0 = sysctl(v6, 3u, &v2, &v5, 0, 0);
  result = 0;
  if (v0 < 0)
    return *__error();
  return result;
}

uint64_t trace_read(void *a1, size_t *a2)
{
  int v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = xmmword_2064FB820;
  v5 = 0;
  v2 = sysctl((int *)&v4, 3u, a1, a2, 0, 0);
  result = 0;
  if (v2 < 0)
    return *__error();
  return result;
}

uint64_t trace_set_nowrap()
{
  size_t v1;
  int v2[4];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 1;
  *(_OWORD *)v2 = xmmword_2064FB830;
  v3 = 0;
  return sysctl(v2, 4u, 0, &v1, 0, 0) >> 31;
}

uint64_t trace_get_bufinfo(void *a1, size_t a2)
{
  size_t v3;
  int v4[2];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 5;
  v3 = a2;
  *(_QWORD *)v4 = 0x1800000001;
  return sysctl(v4, 3u, a1, &v3, 0, 0);
}

uint64_t trace_read_threadmap(void *a1, size_t a2)
{
  int v2;
  size_t v4;
  int v5[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  *(_OWORD *)v5 = xmmword_2064FB840;
  v6 = 0;
  v2 = sysctl(v5, 3u, a1, &v4, 0, 0);
  return v2 & (v2 >> 31);
}

uint64_t trace_block(unint64_t a1)
{
  uint64_t result;
  BOOL v2;
  NSObject *v3;
  size_t v4;
  int v5[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a1 / 0xF4240;
  *(_OWORD *)v5 = xmmword_2064FB850;
  v6 = 0;
  LODWORD(result) = sysctl(v5, 3u, 0, &v4, 0, 0);
  if ((_DWORD)result || !v4)
  {
    if (v4)
      v2 = 0;
    else
      v2 = (_DWORD)result == 0;
    if (v2)
      return 35;
    else
      return result;
  }
  else
  {
    if (v4 == 1)
      return 0;
    v3 = kperf_log();
    result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      trace_block_cold_1((uint64_t *)&v4, v3);
      return 0;
    }
  }
  return result;
}

uint64_t trace_config_default(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;

  v2 = trace_clear();
  if ((_DWORD)v2)
  {
    v4 = v2;
    v6 = "trace_clear";
LABEL_8:
    perror(v6);
    return v4;
  }
  v3 = trace_bufinit(a1);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v6 = "trace_bufinit";
    goto LABEL_8;
  }
  v4 = trace_rnginit();
  if ((_DWORD)v4)
  {
    v6 = "trace_rnginit";
    goto LABEL_8;
  }
  return v4;
}

uint64_t trace_start()
{
  uint64_t v0;
  uint64_t v2;

  v0 = trace_perf_filter();
  if (!(_DWORD)v0)
    return trace_enable(1);
  v2 = v0;
  perror("trace_perf_filter");
  return v2;
}

uint64_t trace_stop()
{
  return trace_enable(0);
}

uint64_t trace_set_typefilter(void *a1)
{
  int v1;
  size_t v3;
  int v4[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0x2000;
  *(_OWORD *)v4 = xmmword_2064FB860;
  v5 = 0;
  v1 = sysctl(v4, 3u, a1, &v3, 0, 0);
  return v1 & (v1 >> 31);
}

_DWORD *kperf_buffer_create_live()
{
  _DWORD *v0;
  _DWORD *v1;
  void *v2;

  v0 = malloc_type_calloc(1uLL, 0xCF8uLL, 0x10F0040D9A9C70DuLL);
  v1 = v0;
  if (v0)
  {
    *v0 = 1;
    v2 = malloc_type_malloc(0x100000uLL, 0xC03AE367uLL);
    *((_QWORD *)v1 + 3) = v2;
    if (v2)
    {
      *((_QWORD *)v1 + 4) = 0x100000;
      *((_QWORD *)v1 + 9) = v1;
      *((_QWORD *)v1 + 11) = 0;
      *((_QWORD *)v1 + 413) = 0;
      *((_QWORD *)v1 + 23) = 0;
      *((_QWORD *)v1 + 24) = 0;
      v1[828] = -1;
    }
    else
    {
      free(v1);
      return 0;
    }
  }
  return v1;
}

_QWORD *kperf_buffer_create_chunked()
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0xCF8uLL, 0x10F0040D9A9C70DuLL);
  if (result)
  {
    *(_DWORD *)result = 0;
    result[9] = result;
    result[11] = 0;
    result[413] = 0;
    *((_DWORD *)result + 828) = -1;
  }
  return result;
}

uint64_t kperf_buffer_wait(_DWORD *a1, unint64_t a2)
{
  if (*a1 == 1)
    return trace_block(a2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t kperf_buffer_readdata(uint64_t a1)
{
  return kperf_buffer_readdata_withmore(a1, 0);
}

uint64_t kperf_buffer_readdata_withmore(uint64_t a1, _BYTE *a2)
{
  _QWORD *v4;
  unint64_t v5;
  size_t v6;
  unint64_t v7;
  uint64_t *v8;
  int v9;
  int is_64bit;
  int v11;
  int32x2_t v12;
  int64x2_t v13;
  double v14;
  double v15;
  int v16;
  size_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  size_t v30;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;

  if (a2)
    *a2 = 0;
  if (*(_DWORD *)a1 != 1)
    return 0xFFFFFFFFLL;
  v33 = 0;
  if (!*(_BYTE *)(a1 + 176) && !*(_QWORD *)(a1 + 96))
  {
    is_64bit = kperf_kern_is_64bit();
    if (is_64bit)
      v11 = 2;
    else
      v11 = 1;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    *(_DWORD *)(a1 + 4) = v11;
    v12 = vdup_n_s32(is_64bit == 0);
    v13.i64[0] = v12.u32[0];
    v13.i64[1] = v12.u32[1];
    *(int8x16_t *)(a1 + 8) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v13, 0x3FuLL)), (int8x16_t)xmmword_2064FB8B0, (int8x16_t)xmmword_2064FB8A0);
    if (trace_get_bufinfo(&v34, 0x14uLL))
      return 0xFFFFFFFFLL;
    v16 = HIDWORD(v35);
    v17 = *(_QWORD *)(a1 + 16) * SHIDWORD(v35);
    v18 = ((v17 + 288) & 0xFFF) != 0 ? (v17 + 4384) & 0xFFFFFFFFFFFFF000 : v17 + 288;
    if (v18 > *(_QWORD *)(a1 + 32))
      return 0xFFFFFFFFLL;
    v19 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)v19 = 1437204992;
    *(_DWORD *)(v19 + 4) = v16;
    *(_QWORD *)(v19 + 8) = 0;
    *(_DWORD *)(v19 + 16) = 0;
    *(_QWORD *)(v19 + 24) = kperf_tick_frequency(v14, v15);
    if (is_64bit)
      *(_DWORD *)(v19 + 20) |= 1u;
    *(_QWORD *)(a1 + 96) = v19 + 288;
    *(_QWORD *)(a1 + 104) = v17 + v19 + 288;
    if (trace_read_threadmap((void *)(v19 + 288), v17))
      return 0xFFFFFFFFLL;
    *(_QWORD *)(a1 + 40) = v18;
    *(_QWORD *)(a1 + 48) = v18;
  }
  v4 = (_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = v5 - v6;
  if (*(_QWORD *)(a1 + 3288))
  {
    if (*(_QWORD *)(a1 + 8) * (*(_DWORD *)(a1 + 3296) / 4 + 3) > v7)
      return 0xFFFFFFFFLL;
    v8 = inject_kd(a1, (_QWORD *)(a1 + 24));
    v9 = *(_DWORD *)(a1 + 4);
    if (v9 == 1)
      *((_DWORD *)v8 + 7) = 620756993;
    else
      *((_DWORD *)v8 + 12) = 620756993;
    if ((*(_DWORD *)(a1 + 3296) & 0x80000000) == 0)
    {
      v20 = -1;
      v21 = v9;
      v22 = v9;
      while (1)
      {
        v23 = ((_BYTE)v20 + 1) & 3;
        if ((((_BYTE)v20 + 1) & 3) == 0)
          break;
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 3288) + 8 * v20);
        switch(v23)
        {
          case 1:
            if (v21 != 1)
            {
              v8[2] = v24;
              v22 = v21;
              break;
            }
            *((_DWORD *)v8 + 3) = v24;
            goto LABEL_44;
          case 2:
            if (v22 == 1)
              *((_DWORD *)v8 + 4) = v24;
            else
              v8[3] = v24;
            break;
          case 3:
            if (v9 != 1)
            {
              v8[4] = v24;
              goto LABEL_47;
            }
            *((_DWORD *)v8 + 5) = v24;
            goto LABEL_43;
        }
LABEL_50:
        if (++v20 >= *(int *)(a1 + 3296))
          goto LABEL_51;
      }
      v8 = inject_kd(a1, (_QWORD *)(a1 + 24));
      v9 = *(_DWORD *)(a1 + 4);
      if (v9 == 1)
        *((_DWORD *)v8 + 7) = 630784000;
      else
        *((_DWORD *)v8 + 12) = 630784000;
      if (v20 == -1)
        v25 = *(int *)(a1 + 3296);
      else
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 3288) + 8 * v20);
      if (v9 != 1)
      {
        v8[1] = v25;
LABEL_47:
        v21 = v9;
        v22 = v9;
        goto LABEL_50;
      }
      *((_DWORD *)v8 + 2) = v25;
LABEL_43:
      v21 = 1;
LABEL_44:
      v22 = 1;
      goto LABEL_50;
    }
LABEL_51:
    v26 = inject_kd(a1, (_QWORD *)(a1 + 24));
    if (*(_DWORD *)(a1 + 4) == 1)
      *((_DWORD *)v26 + 7) = 620756994;
    else
      *((_DWORD *)v26 + 12) = 620756994;
    *(_DWORD *)(a1 + 3296) = 0;
    free(*(void **)(a1 + 3288));
    *(_QWORD *)(a1 + 3288) = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = v5 - v6;
  }
  if (v7 >> 16)
    goto LABEL_61;
  if (!*v4)
  {
    v28 = malloc_type_malloc(0x100000uLL, 0xC03AE367uLL);
    *v4 = v28;
    if (v28)
    {
      v6 = 0;
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
      v7 = 0x100000;
      *(_QWORD *)(a1 + 32) = 0x100000;
      goto LABEL_61;
    }
    return 0xFFFFFFFFLL;
  }
  v6 = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v7 = v5;
  if (v5 < 0x10000)
    return 1;
LABEL_61:
  LODWORD(v27) = 0;
  do
  {
    v33 = v7;
    v29 = trace_read((void *)(*v4 + v6), &v33);
    if ((_DWORD)v29)
      return v29;
    v30 = v33 * *(_QWORD *)(a1 + 8);
    v33 = v30;
    v27 = (v27 + v30);
    v6 = *(_QWORD *)(a1 + 48) + v30;
    *(_QWORD *)(a1 + 48) = v6;
    *(_QWORD *)(a1 + 56) = v6;
    v7 -= v30;
  }
  while (v30 >= 0x401 && v7 != 0);
  if (a2 && *(_QWORD *)(a1 + 32) - v6 <= 0x3FF)
    *a2 = 1;
  return v27;
}

uint64_t kperf_buffer_set_config(uint64_t a1, int a2, const void *a3)
{
  size_t v6;
  void *v7;
  void *v8;
  uint64_t result;

  if (*(_DWORD *)a1 != 1)
    return 0xFFFFFFFFLL;
  v6 = 8 * a2;
  v7 = malloc_type_malloc(v6, 0x100004000313F17uLL);
  if (!v7)
    return 4294967294;
  v8 = v7;
  memcpy(v7, a3, v6);
  result = 0;
  *(_QWORD *)(a1 + 3288) = v8;
  *(_DWORD *)(a1 + 3296) = a2;
  return result;
}

uint64_t kperf_buffer_getbuf(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  size_t v6;
  uint64_t result;

  if (*(_DWORD *)a1 != 1)
    return 0xFFFFFFFFLL;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    dbglog_log(a1, *(void **)(a1 + 24), v6);
    result = 0;
    *a2 = *(_QWORD *)(a1 + 24);
    *a3 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 88) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    *(_QWORD *)(a1 + 104) = 0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_QWORD *)(a1 + 56) = 0;
    *(_BYTE *)(a1 + 176) = 1;
  }
  else
  {
    result = 0;
    *a2 = 0;
    *a3 = 0;
  }
  return result;
}

ssize_t dbglog_log(uint64_t a1, void *__buf, size_t __nbyte)
{
  const char *v6;
  int v7;
  ssize_t result;

  v6 = *(const char **)(a1 + 3304);
  if (v6)
  {
    if ((*(_DWORD *)(a1 + 3312) & 0x80000000) != 0)
    {
      v7 = open(v6, 1537, 384);
      *(_DWORD *)(a1 + 3312) = v7;
      if (v7 < 0)
      {
        free(*(void **)(a1 + 3304));
        *(_QWORD *)(a1 + 3304) = 0;
      }
    }
  }
  result = *(unsigned int *)(a1 + 3312);
  if ((result & 0x80000000) == 0)
    return write(result, __buf, __nbyte);
  return result;
}

uint64_t kperf_buffer_returnbuf(void *a1)
{
  free(a1);
  return 0;
}

char *kperf_buffer_set_debug_log(char *result, char *__s1)
{
  char *v2;

  if (!*((_QWORD *)result + 413))
  {
    v2 = result;
    result = strdup(__s1);
    *((_QWORD *)v2 + 413) = result;
  }
  return result;
}

void kperf_buffer_free(_QWORD *a1)
{
  void *v2;
  int v3;

  if (*(_DWORD *)a1 == 1)
  {
    v2 = (void *)a1[3];
    if (v2)
      free(v2);
  }
  v3 = *((_DWORD *)a1 + 828);
  if (v3)
    close(v3);
  free(a1);
}

uint64_t kperf_buffer_setchunk(uint64_t a1, void *a2, size_t a3)
{
  uint64_t result;

  if (*(_DWORD *)a1)
    return 0xFFFFFFFFLL;
  if (*(_QWORD *)(a1 + 24))
    return 4294967294;
  dbglog_log(a1, a2, a3);
  result = 0;
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a3;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = a3;
  *(_QWORD *)(a1 + 88) = a2;
  return result;
}

double kperf_buffer_clearchunk(uint64_t a1)
{
  double result;

  if (!*(_DWORD *)a1)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      *(_QWORD *)(a1 + 88) = 0;
      *(_QWORD *)(a1 + 96) = 0;
      *(_QWORD *)(a1 + 104) = 0;
      result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_BYTE *)(a1 + 176) = 1;
    }
  }
  return result;
}

unint64_t *_kperf_buffer_next_kevent(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t *result;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  _DWORD *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;

  if (*(_DWORD *)a1 == 1)
  {
    *(_DWORD *)(a1 + 64) = 1;
    if (!*(_BYTE *)(a1 + 176))
    {
      v6 = *(unsigned int **)(a1 + 96);
      v7 = *(_QWORD *)(a1 + 104);
      if ((unint64_t)v6 < v7)
      {
        v3 = *(unsigned int *)(a1 + 4);
        do
        {
          v8 = (_DWORD)v3 == 1 ? 4 : 8;
          if (*(unsigned int *)((char *)v6 + v8))
            goto LABEL_53;
          v6 = (unsigned int *)((char *)v6 + *(_QWORD *)(a1 + 16));
          *(_QWORD *)(a1 + 96) = v6;
        }
        while (v7 > (unint64_t)v6);
      }
      *(_BYTE *)(a1 + 176) = 1;
    }
    v9 = (uint64_t *)(a1 + 88);
    v10 = *(_QWORD *)(a1 + 88);
    v11 = *(_QWORD **)(a1 + 80);
    if (v10)
    {
      v12 = *(_QWORD *)(a1 + 8);
      if ((unint64_t)(v10 - *v11 + v12) < v11[3])
      {
        *(_QWORD *)(a1 + 88) = v12 + v10;
        return kd32_promote(a1, (unint64_t *)(v12 + v10));
      }
      v14 = 0;
      *v9 = 0;
      *(_QWORD *)(a1 + 96) = 0;
      *(_QWORD *)(a1 + 104) = 0;
      *(_BYTE *)(a1 + 176) = 1;
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
      return (unint64_t *)v14;
    }
    if (!v11)
    {
      v11 = (_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 80) = a1 + 24;
    }
    if (v11[3])
    {
      v14 = *v11 + v11[2];
      *v9 = v14;
      return (unint64_t *)v14;
    }
    return 0;
  }
  if (*(_DWORD *)a1)
    return 0;
  v2 = *(_DWORD **)(a1 + 24);
  if (!v2)
    return 0;
  v3 = *(unsigned int *)(a1 + 4);
  if (!(_DWORD)v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 >= 0x120)
    {
      if (*v2 == 1437204992)
      {
        v15 = v2[5];
        v3 = 1;
        if ((v15 & 1) != 0)
          v16 = 2;
        else
          v16 = 1;
        *(_DWORD *)(a1 + 4) = v16;
        v5 = 72;
        if ((v15 & 1) == 0)
        {
          v17 = 28;
          v18 = 32;
LABEL_33:
          *(_QWORD *)(a1 + 8) = v18;
          *(_QWORD *)(a1 + 16) = v17;
          v19 = v2[1];
          v20 = (v5 * 4 + (int)v17 * (uint64_t)v19 + 4095) & 0xFFFFFFFFFFFFF000;
          *(_DWORD *)(a1 + 64) = 1;
          v21 = v20 | v18;
          v22 = (char *)v2 + v20;
          if (v4 >= v21)
            v23 = v22;
          else
            v23 = 0;
          *(_QWORD *)(a1 + 80) = a1 + 24;
          *(_QWORD *)(a1 + 88) = v23;
          v24 = &v2[v5];
          *(_QWORD *)(a1 + 96) = v24;
          *(_QWORD *)(a1 + 104) = (char *)v24 + (int)v17 * (uint64_t)v19;
          goto LABEL_37;
        }
LABEL_32:
        v3 = 2;
        v17 = 32;
        v18 = 64;
        goto LABEL_33;
      }
      if (*v2 == 1437204737)
      {
        *(_DWORD *)(a1 + 4) = 2;
        v5 = 6;
        goto LABEL_32;
      }
    }
    v3 = 0;
  }
LABEL_37:
  if (!*(_DWORD *)(a1 + 64))
    return 0;
  if (!*(_BYTE *)(a1 + 176))
  {
    v6 = *(unsigned int **)(a1 + 96);
    if (v6)
    {
      v25 = *(_QWORD *)(a1 + 104);
      if ((unint64_t)v6 < v25)
      {
        while (1)
        {
          v26 = (_DWORD)v3 == 1 ? 4 : 8;
          if (*(unsigned int *)((char *)v6 + v26))
            break;
          v6 = (unsigned int *)((char *)v6 + *(_QWORD *)(a1 + 16));
          *(_QWORD *)(a1 + 96) = v6;
          if (v25 <= (unint64_t)v6)
            goto LABEL_46;
        }
LABEL_53:
        v14 = a1 + 112;
        tdmap2kd(v3, a1 + 112, v6);
        *(_QWORD *)(a1 + 96) += *(_QWORD *)(a1 + 16);
        return (unint64_t *)v14;
      }
LABEL_46:
      *(_BYTE *)(a1 + 176) = 1;
    }
  }
  v27 = *(unint64_t **)(a1 + 88);
  if (!v27)
    return 0;
  result = kd32_promote(a1, v27);
  v28 = *(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 88);
  if (**(_QWORD **)(a1 + 80) + *(_QWORD *)(*(_QWORD *)(a1 + 80) + 24) <= v28)
    v28 = 0;
  *(_QWORD *)(a1 + 88) = v28;
  return result;
}

uint64_t kperf_buffer_get_stats(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2 == 1)
  {
    if (*(_DWORD *)(a1 + 64))
      return *(int *)(a1 + 204);
    return -1;
  }
  if (a2 || !*(_DWORD *)(a1 + 64))
    return -1;
  v2 = *(_QWORD *)(a1 + 184);
  if (v2)
    return *(_QWORD *)(v2 + 2536);
  else
    return *(_QWORD *)(a1 + 8) * *(int *)(a1 + 200);
}

uint64_t kperf_buffer_set_debug(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  if (a2)
    return -1;
  result = *(unsigned __int8 *)(a1 + 3300);
  *(_BYTE *)(a1 + 3300) = a3 != 0;
  return result;
}

uint64_t *inject_kd(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1;
  v3 = a2[3];
  v4 = (uint64_t *)(*a2 + v3);
  v5 = *(_QWORD *)(a1 + 8);
  a2[3] = v5 + v3;
  bzero(v4, v5);
  LODWORD(v2) = *(_DWORD *)(v2 + 4);
  v6 = mach_absolute_time();
  v7 = v6 & 0xFFFFFFFFFFFFFFLL;
  if ((_DWORD)v2 != 1)
    v7 = v6;
  *v4 = v7;
  return v4;
}

unint64_t *kd32_promote(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  int v7;

  if (*(_DWORD *)(a1 + 4) != 2)
  {
    v2 = *a2;
    *(_QWORD *)(a1 + 112) = *a2 & 0xFFFFFFFFFFFFFFLL;
    v3 = a1 + 112;
    v4 = a2[1];
    v5 = a2[2];
    *(_QWORD *)&v6 = v4;
    *((_QWORD *)&v6 + 1) = HIDWORD(v4);
    *(_OWORD *)(v3 + 8) = v6;
    *(_QWORD *)&v6 = v5;
    *((_QWORD *)&v6 + 1) = HIDWORD(v5);
    *(_OWORD *)(v3 + 24) = v6;
    v7 = *((_DWORD *)a2 + 7);
    *(_QWORD *)(v3 + 40) = *((unsigned int *)a2 + 6);
    *(_DWORD *)(v3 + 48) = v7;
    *(_DWORD *)(v3 + 52) = HIBYTE(v2);
    return (unint64_t *)v3;
  }
  return a2;
}

uint64_t tdmap2kd(uint64_t result, uint64_t a2, unsigned int *a3)
{
  _OWORD *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 48) = 117506056;
  v3 = (_OWORD *)(a2 + 8);
  if ((_DWORD)result == 1)
  {
    v4 = *(_OWORD *)(a3 + 2);
    *(_DWORD *)(a2 + 24) = a3[6];
    *v3 = v4;
    v5 = *a3;
  }
  else
  {
    v6 = *(_OWORD *)(a3 + 3);
    *(_DWORD *)(a2 + 24) = a3[7];
    *v3 = v6;
    v5 = *(_QWORD *)a3;
  }
  *(_QWORD *)(a2 + 40) = v5;
  return result;
}

uint64_t kperf_logging_start()
{
  uint64_t result;
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = trace_config_default(logging_nbufs);
  if (!(_DWORD)result)
  {
    if (!wrap)
      trace_set_nowrap();
    if (kdebug)
    {
      v1 = has_typefilter;
      v2 = kperf_log();
      v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
      if (v1 == 1)
      {
        if (v3)
          kperf_logging_start_cold_2(v2, v4, v5, v6, v7, v8, v9, v10);
        trace_set_typefilter(&typefilter);
      }
      else if (v3)
      {
        kperf_logging_start_cold_3(v2, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    else
    {
      v11 = kperf_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        kperf_logging_start_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
      trace_perf_filter();
    }
    return trace_enable(1);
  }
  return result;
}

uint64_t kperf_logging_stop()
{
  return trace_enable(0);
}

uint64_t kperf_logging_set_wrap(char a1)
{
  uint64_t v1;

  v1 = wrap;
  wrap = a1;
  return v1;
}

uint64_t kperf_logging_set_kdebug(char a1)
{
  uint64_t v1;

  v1 = kdebug;
  kdebug = a1;
  return v1;
}

void kperf_logging_set_typefilter(void *__src)
{
  if (__src)
  {
    memcpy(&typefilter, __src, 0x2000uLL);
    kperf_typefilter_enable_class((uint64_t)&typefilter, 0x25u);
  }
  else
  {
    bzero(&typefilter, 0x2000uLL);
  }
  has_typefilter = __src != 0;
}

uint64_t kperf_logging_query_size(uint64_t result)
{
  if ((_DWORD)result)
    return result;
  else
    return 1000000;
}

uint64_t kperf_logging_set_size(uint64_t result)
{
  if ((_DWORD)result)
    result = result;
  else
    result = 1000000;
  logging_nbufs = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void kperf_typefilter_clear(void *a1)
{
  bzero(a1, 0x2000uLL);
}

int8x16_t kperf_typefilter_invert(uint64_t a1)
{
  uint64_t i;
  int8x16_t result;

  for (i = 0; i != 0x2000; i += 16)
  {
    result = vmvnq_s8(*(int8x16_t *)(a1 + i));
    *(int8x16_t *)(a1 + i) = result;
  }
  return result;
}

double kperf_typefilter_disable_class(uint64_t a1, unsigned int a2)
{
  _OWORD *v2;
  double result;

  v2 = (_OWORD *)(a1 + 32 * a2);
  result = 0.0;
  *v2 = 0u;
  v2[1] = 0u;
  return result;
}

__n128 kperf_typefilter_enable_class(uint64_t a1, unsigned int a2)
{
  __n128 *v2;
  __n128 result;

  v2 = (__n128 *)(a1 + 32 * a2);
  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  *v2 = result;
  v2[1] = result;
  return result;
}

uint64_t kperf_typefilter_enable_subclass(uint64_t result, unsigned int a2, unsigned int a3)
{
  unint64_t v3;

  v3 = (a3 | ((unint64_t)a2 << 8)) >> 3;
  *(_BYTE *)(result + v3) |= 1 << (a3 & 7);
  return result;
}

uint64_t kperf_typefilter_disable_subclass(uint64_t result, unsigned int a2, unsigned int a3)
{
  unint64_t v3;

  v3 = (a3 | ((unint64_t)a2 << 8)) >> 3;
  *(_BYTE *)(result + v3) &= ~(1 << (a3 & 7));
  return result;
}

uint64_t kperf_timer_period_set(unsigned int a1, uint64_t a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.timer.period", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_timer_period_get(unsigned int a1, _QWORD *a2)
{
  uint64_t result;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 0;
  v4 = 16;
  result = sysctlbyname("kperf.timer.period", &v5, &v4, &v5, 0x10uLL);
  if (!(_DWORD)result)
    *a2 = v6;
  return result;
}

uint64_t kperf_timer_action_set(unsigned int a1, unsigned int a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.timer.action", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_timer_action_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.timer.action", a1, a2);
}

uint64_t kperf_sysctl_get_uint32(const char *a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = 0;
  v5 = 16;
  result = sysctlbyname(a1, &v6, &v5, &v6, 0x10uLL);
  if (!(_DWORD)result)
    *a3 = v7;
  return result;
}

uint64_t kperf_timer_count_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.timer.count", 0, 0, &v2, 4uLL);
}

uint64_t kperf_timer_count_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.timer.count", a1, &v2, 0, 0);
}

uint64_t kperf_timer_pet_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.timer.pet_timer", 0, 0, &v2, 4uLL);
}

uint64_t kperf_timer_pet_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.timer.pet_timer", a1, &v2, 0, 0);
}

uint64_t kperf_timer_lightweight_pet_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.lightweight_pet", 0, 0, &v2, 4uLL);
}

uint64_t kperf_timer_lightweight_pet_get(BOOL *a1)
{
  uint64_t result;
  size_t v3;
  int v4;

  v4 = 0;
  v3 = 4;
  result = sysctlbyname("kperf.lightweight_pet", &v4, &v3, 0, 0);
  if (!(_DWORD)result)
    *a1 = v4 == 1;
  return result;
}

uint64_t kperf_action_samplers_set(unsigned int a1, unsigned int a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.samplers", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_action_samplers_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.samplers", a1, a2);
}

uint64_t kperf_action_userdata_set(unsigned int a1, unsigned int a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.userdata", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_action_userdata_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.userdata", a1, a2);
}

uint64_t kperf_action_filter_set_by_task(unsigned int a1, unsigned int a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.filter_by_task", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_action_filter_set_by_pid(unsigned int a1, int a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.filter_by_pid", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_action_filter_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.filter_by_pid", a1, a2);
}

uint64_t kperf_action_ucallstack_depth_set(unsigned int a1, unsigned int a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.ucallstack_depth", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_action_kcallstack_depth_set(unsigned int a1, unsigned int a2)
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.kcallstack_depth", 0, 0, v3, 0x10uLL);
}

uint64_t kperf_action_ucallstack_depth_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.ucallstack_depth", a1, a2);
}

uint64_t kperf_action_kcallstack_depth_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.kcallstack_depth", a1, a2);
}

uint64_t kperf_action_count_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.action.count", 0, 0, &v2, 4uLL);
}

uint64_t kperf_action_count_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.action.count", a1, &v2, 0, 0);
}

uint64_t kperf_sample_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.sampling", a1, &v2, 0, 0);
}

uint64_t kperf_sample_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.sampling", 0, 0, &v2, 4uLL);
}

uint64_t kperf_sample_on()
{
  int v1;

  v1 = 1;
  return sysctlbyname("kperf.sampling", 0, 0, &v1, 4uLL);
}

uint64_t kperf_sample_off()
{
  int v1;

  v1 = 0;
  return sysctlbyname("kperf.sampling", 0, 0, &v1, 4uLL);
}

uint64_t kperf_bless_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.blessed_pid", 0, 0, &v2, 4uLL);
}

uint64_t kperf_bless_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.blessed_pid", a1, &v2, 0, 0);
}

uint64_t kperf_bless_allow_preemption(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.blessed_preempt", 0, 0, &v2, 4uLL);
}

uint64_t kperf_kdbg_cswitch_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.kdbg_cswitch", 0, 0, &v2, 4uLL);
}

uint64_t kperf_kdbg_cswitch_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.kdbg_cswitch", a1, &v2, 0, 0);
}

uint64_t kperf_kern_is_64bit()
{
  size_t v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v33 = xmmword_2064FB8C8;
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
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  memset(v2, 0, sizeof(v2));
  v1 = 648;
  if (sysctl((int *)&v33, 4u, v2, &v1, 0, 0) == -1)
    return 0;
  else
    return (v3 >> 2) & 1;
}

uint64_t kperf_reset()
{
  int v1;

  v1 = 1;
  return sysctlbyname("kperf.reset", 0, 0, &v1, 4uLL);
}

uint64_t kperf_lazy_wait_time_threshold_set(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return sysctlbyname("kperf.lazy.wait_time_threshold", 0, 0, &v2, 8uLL);
}

uint64_t kperf_lazy_wait_time_threshold_get(void *a1)
{
  size_t v2;

  v2 = 8;
  return sysctlbyname("kperf.lazy.wait_time_threshold", a1, &v2, 0, 0);
}

uint64_t kperf_lazy_wait_action_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.lazy.wait_action", 0, 0, &v2, 4uLL);
}

uint64_t kperf_lazy_wait_action_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.lazy.wait_action", a1, &v2, 0, 0);
}

uint64_t kperf_lazy_cpu_time_threshold_set(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return sysctlbyname("kperf.lazy.cpu_time_threshold", 0, 0, &v2, 8uLL);
}

uint64_t kperf_lazy_cpu_time_threshold_get(void *a1)
{
  size_t v2;

  v2 = 8;
  return sysctlbyname("kperf.lazy.cpu_time_threshold", a1, &v2, 0, 0);
}

uint64_t kperf_lazy_cpu_action_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.lazy.cpu_action", 0, 0, &v2, 4uLL);
}

uint64_t kperf_lazy_cpu_action_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.lazy.cpu_action", a1, &v2, 0, 0);
}

uint64_t kperf_signpost_action_set(int a1)
{
  int v2;

  v2 = a1;
  return sysctlbyname("kperf.signpost_action", 0, 0, &v2, 4uLL);
}

uint64_t kperf_signpost_action_get(void *a1)
{
  size_t v2;

  v2 = 4;
  return sysctlbyname("kperf.signpost_action", a1, &v2, 0, 0);
}

void kperf_buffer_free_record(_QWORD *a1)
{
  void *v2;

  v2 = (void *)a1[311];
  if (v2)
    free(v2);
  free(a1);
}

uint64_t kperf_buffer_next_record(uint64_t a1, _QWORD *a2)
{
  unint64_t *kevent;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  int32x2_t *v7;
  int32x2_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int32x2_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int32x2_t **v18;
  int32x2_t *v19;
  int32x2_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  __int32 v27;
  int v28;
  __int32 v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  float *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int32x2_t *v42;
  unint64_t v43;
  uint64_t v44;
  float32x2x2_t v47;

  while ((record_ready(a1) & 1) == 0)
  {
    kevent = _kperf_buffer_next_kevent(a1);
    if (!kevent)
      break;
    v4 = kevent;
    ++*(_DWORD *)(a1 + 200);
    if (*kevent)
    {
      if (*((_DWORD *)kevent + 12) != 630784000)
      {
        v5 = a1 + 8 * *((int *)kevent + 13);
        v6 = *(_QWORD *)(v5 + 2256) + 1;
        *(_QWORD *)(v5 + 2256) = v6;
        if (v6 > *(_QWORD *)(a1 + 3280))
          *(_QWORD *)(a1 + 3280) = v6;
      }
    }
    v7 = (int32x2_t *)malloc_type_malloc(0x9F0uLL, 0x1030040B65789E5uLL);
    if (!v7)
      return 2;
    v8 = v7;
    v7[313].i32[0] = 0;
    v7[3].i32[0] = 0;
    v7[1] = 0;
    v7[2] = 0;
    *v7 = 0;
    v7[316] = (int32x2_t)0xFFFFFFFF00000000;
    v7[311] = 0;
    v7[271].i32[0] = 0;
    v7[1] = (int32x2_t)*v4;
    v7[317] = (int32x2_t)(*(_QWORD *)(a1 + 8) * *(int *)(a1 + 200));
    if (*(_BYTE *)(a1 + 3300))
    {
      *v7 = (int32x2_t)23;
      v9 = *((unsigned int *)v4 + 13);
      v7[6].i32[0] = *((_DWORD *)v4 + 12);
      v7[7] = (int32x2_t)v4[1];
      v7[8] = (int32x2_t)v4[2];
      v7[9] = (int32x2_t)v4[3];
      v7[10] = (int32x2_t)v4[4];
      v7[2] = (int32x2_t)v4[5];
      v7[3].i32[0] = v9;
      v10 = 65559;
    }
    else
    {
      v9 = *((unsigned int *)v4 + 13);
      v10 = 65539;
    }
    if (v9 > 0x7F)
      goto LABEL_12;
    v12 = *((_DWORD *)v4 + 12);
    if (v12 == 117571592)
    {
      v7[3].i32[0] = v9;
      v13 = (int32x2_t)*v4;
      *v7 = (int32x2_t)v10;
      v7[1] = v13;
      v14 = a1 + 8 * v9 + 72;
      v17 = *(_QWORD *)(v14 + 136);
      v15 = (_QWORD *)(v14 + 136);
      v16 = v17;
      v7[312] = (int32x2_t)v15[128];
      v7[313].i32[0] = 1;
      v15[128] = v13;
      v11 = 0;
      if (v17)
      {
        *(_QWORD *)v16 = 0x8000000000000000;
        *(_DWORD *)(v16 + 2504) = 1;
        *v15 = 0;
      }
      goto LABEL_19;
    }
    v18 = (int32x2_t **)(a1 + 8 * v9 + 208);
    v19 = *v18;
    *(_QWORD *)(a1 + 8 * v9 + 1232) = *v4;
    if (v12 == 620756993)
    {
      if (v19)
      {
LABEL_12:
        v11 = 2;
      }
      else
      {
        v11 = 0;
        *v18 = v7;
        *(_QWORD *)v7 |= 0x2007uLL;
        v7[3].i32[0] = v9;
        v7[307] = vmovn_s64(*((int64x2_t *)v4 + 1));
        v7[2] = (int32x2_t)v4[5];
      }
LABEL_19:
      v20 = *v7;
      if (*v7)
        goto LABEL_20;
      goto LABEL_85;
    }
    v11 = 0;
    if (v19)
    {
      if (v12 <= 620888083)
      {
        if (v12 <= 620822531)
        {
          if (v12 == 620756994)
          {
            v11 = 0;
            v19[313].i32[0] = 1;
            *v18 = 0;
          }
        }
        else
        {
          switch(v12)
          {
            case 620822532:
              v11 = 0;
              *(_QWORD *)v19 |= 0x20uLL;
              v33 = v4[1];
              v19[2] = (int32x2_t)v4[2];
              v34 = v4[4];
              v19[12] = (int32x2_t)v4[3];
              v19[11].i32[0] = v33;
              v19[11].i32[1] = v34;
              break;
            case 620888076:
              if ((v19->i8[0] & 0x40) != 0)
              {
                v11 = 0;
                v35 = v19[315].i32[0];
                v19[v35 + 143] = (int32x2_t)v4[1];
                v19[(int)v35 + 144] = (int32x2_t)v4[2];
                v19[(int)v35 + 145] = (int32x2_t)v4[3];
                v19[(int)v35 + 146] = (int32x2_t)v4[4];
                v19[315].i32[0] = v35 + 4;
                break;
              }
              goto LABEL_77;
            case 620888080:
              v11 = 0;
              v25 = v19[315].i32[1];
              v19[v25 + 14] = (int32x2_t)v4[1];
              v19[(int)v25 + 15] = (int32x2_t)v4[2];
              v19[(int)v25 + 16] = (int32x2_t)v4[3];
              v19[(int)v25 + 17] = (int32x2_t)v4[4];
              v19[315].i32[1] = v25 + 4;
              break;
          }
        }
      }
      else
      {
        if (v12 > 621150223)
        {
          if (v12 == 621150224)
          {
            v11 = 0;
            *(_QWORD *)v19 |= 0x800uLL;
            v36 = (float *)&v19[304];
            v47.val[1] = (float32x2_t)vmovn_s64(*(int64x2_t *)(v4 + 3));
            v47.val[0] = (float32x2_t)vmovn_s64(*(int64x2_t *)(v4 + 1));
            vst2_f32(v36, v47);
            v19[271].i32[0] = 0;
            goto LABEL_83;
          }
          if (v12 != 621150232)
          {
            if (v12 != 630784000)
              goto LABEL_83;
            v26 = (_QWORD *)v19[311];
            v27 = v19[316].i32[1];
            if (v26)
            {
LABEL_50:
              v28 = 0;
              v29 = v19[310].i32[0];
              while (v27 < v29)
              {
                if (v28 | v27)
                {
                  v30 = v4 + 1;
                  switch(v28)
                  {
                    case 0:
                      goto LABEL_57;
                    case 1:
                      v30 = v4 + 2;
                      goto LABEL_57;
                    case 2:
                      v30 = v4 + 3;
                      goto LABEL_57;
                    case 3:
                      v30 = v4 + 4;
LABEL_57:
                      v30 = (_QWORD *)*v30;
                      break;
                    default:
                      break;
                  }
                  v26[v27++] = v30;
                  v19[316].i32[1] = v27;
                }
                v11 = 0;
                if (++v28 == 4)
                  goto LABEL_83;
              }
            }
            else if (v27 == -1)
            {
              v43 = v4[1];
              v19[310].i32[0] = v43;
              v26 = malloc_type_malloc(8 * (int)v43, 0x100004000313F17uLL);
              v19[311] = (int32x2_t)v26;
              v19[316].i32[1] = 0;
              if (v26)
              {
                v27 = 0;
                *(_QWORD *)v19 |= 0x8000uLL;
                goto LABEL_50;
              }
            }
LABEL_77:
            v11 = 0;
            goto LABEL_83;
          }
          v11 = 0;
          *(_QWORD *)v19 |= 0x400uLL;
          v37 = v4[1];
          v38 = *((unsigned int *)v4 + 4);
          v39 = v19[316].i32[0];
          v19[(int)v39 + 273] = (int32x2_t)(*((unsigned int *)v4 + 8) | (v4[3] << 32));
          v19[v39 + 272] = (int32x2_t)(v38 | (v37 << 32));
          v23 = v39 + 2;
          v19[316].i32[0] = v39 + 2;
        }
        else
        {
          if (v12 == 620888084)
          {
            v31 = v4[2];
            if (v31 - 1001 >= 0xFFFFFFFFFFFFFC18)
            {
              v11 = 0;
              *(_QWORD *)v19 |= 0x40uLL;
              v19[142].i32[0] = v4[1];
              v19[142].i32[1] = v31;
              v19[315].i32[0] = 0;
              goto LABEL_83;
            }
            goto LABEL_77;
          }
          if (v12 == 620888088)
          {
            v32 = v4[2];
            if (v32 - 1001 >= 0xFFFFFFFFFFFFFC18)
            {
              v11 = 0;
              *(_QWORD *)v19 |= 0x80uLL;
              v19[13].i32[0] = v4[1];
              v19[13].i32[1] = v32;
              v19[315].i32[1] = 0;
              goto LABEL_83;
            }
            goto LABEL_77;
          }
          if (v12 != 621150220)
            goto LABEL_83;
          *(_QWORD *)v19 |= 0x400uLL;
          if (v19[304].i32[1])
          {
            v22 = v19[316].i32[0];
            v19[v22 + 272] = (int32x2_t)v4[1];
            v19[(int)v22 + 273] = (int32x2_t)v4[2];
            v19[(int)v22 + 274] = (int32x2_t)v4[3];
            v19[(int)v22 + 275] = (int32x2_t)v4[4];
            v23 = v22 + 4;
          }
          else
          {
            v40 = v19[316].i32[0];
            v41 = v4[1];
            if ((_DWORD)v40)
            {
              v42 = &v19[v40];
              v42[272] = (int32x2_t)v41;
              v42[273] = (int32x2_t)v4[2];
              v42[274] = (int32x2_t)v4[3];
              v42[275] = (int32x2_t)v4[4];
              v23 = v40 + 4;
            }
            else
            {
              v19[271].i32[0] = v41;
              v19[272] = (int32x2_t)v4[2];
              v19[273] = (int32x2_t)v4[3];
              v19[274] = (int32x2_t)v4[4];
              v23 = 3;
            }
          }
          v19[316].i32[0] = v23;
          v11 = 0;
        }
        if (v23 >= v19[305].i32[0])
          v23 = v19[305].u32[0];
        v19[271].i32[0] = v23;
      }
    }
    else
    {
      if (v12 <= 620953608)
      {
        if (v12 == 117506056)
        {
          *(_QWORD *)v7 |= 8uLL;
          v7[2] = (int32x2_t)v4[5];
          v7[3].i32[0] = v9;
          strncpy((char *)&v7[3] + 4, (const char *)v4 + 8, 0x14uLL);
          v8[5].i8[7] = 0;
        }
        else
        {
          if (v12 != 620822548)
            goto LABEL_83;
          *(_QWORD *)v7 |= 0x4000uLL;
          v24 = v4[2];
          v7[308] = (int32x2_t)v4[1];
          v7[309].i32[0] = v24;
        }
        goto LABEL_64;
      }
      if (v12 == 620953609 || v12 == 621150209)
      {
        *(_QWORD *)v7 |= 0x100uLL;
        v7[3].i32[0] = v9;
LABEL_64:
        v11 = 0;
        v8[313].i32[0] = 1;
      }
    }
LABEL_83:
    v20 = *v8;
    if (*v8)
    {
      v8[313].i32[0] = 1;
LABEL_20:
      if (*(_QWORD *)(a1 + 3280) <= 0x7FFuLL)
        *v8 = (int32x2_t)(*(_QWORD *)&v20 | 0x20000);
      ++*(_DWORD *)(a1 + 204);
      v8[314] = 0;
      v21 = *(_QWORD *)(a1 + 192);
      if (v21)
        *(_QWORD *)(v21 + 2512) = v8;
      *(_QWORD *)(a1 + 192) = v8;
      if (!*(_QWORD *)(a1 + 184))
        *(_QWORD *)(a1 + 184) = v8;
      goto LABEL_86;
    }
LABEL_85:
    kperf_buffer_free_record(v8);
LABEL_86:
    if ((_DWORD)v11 == 2)
      return v11;
  }
  if (!record_ready(a1))
    return 1;
  v44 = *(_QWORD *)(a1 + 184);
  *a2 = v44;
  --*(_DWORD *)(a1 + 204);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(v44 + 2512);
  if (*(_QWORD *)(a1 + 192) == v44)
    *(_QWORD *)(a1 + 192) = 0;
  v11 = 0;
  *(_QWORD *)(v44 + 2512) = 0;
  return v11;
}

uint64_t record_ready(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned int *)(a1 + 64);
  if ((_DWORD)v1)
  {
    v2 = *(_QWORD *)(a1 + 184);
    if (v2)
    {
      if (*(_DWORD *)(v2 + 2504))
        return 1;
      if (*(int *)(a1 + 204) >= 10001)
      {
        *(_QWORD *)v2 = 0x8000000000000000;
        v1 = 1;
        *(_DWORD *)(v2 + 2504) = 1;
        *(_QWORD *)(a1 + 8 * *(int *)(v2 + 24) + 208) = 0;
        return v1;
      }
    }
    return 0;
  }
  return v1;
}

unint64_t kperf_ns_to_ticks(uint64_t a1)
{
  unsigned int v2;

  v2 = dword_253E3BF04;
  if (!dword_253E3BF04)
  {
    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    v2 = dword_253E3BF04;
  }
  return (unint64_t)v2 * a1 / timebase_info;
}

unint64_t kperf_ticks_to_ns(uint64_t a1)
{
  unsigned int v2;

  v2 = dword_253E3BF04;
  if (!dword_253E3BF04)
  {
    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    v2 = dword_253E3BF04;
  }
  return (unint64_t)timebase_info * a1 / v2;
}

unint64_t kperf_tick_frequency(double a1, double a2)
{
  unsigned int v2;

  v2 = dword_253E3BF04;
  if (!dword_253E3BF04)
  {
    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    v2 = dword_253E3BF04;
  }
  LODWORD(a2) = timebase_info;
  return (unint64_t)((double)v2 / (double)*(unint64_t *)&a2 * 1000000000.0);
}

uint64_t kperf_log()
{
  if (kperf_log_init_once != -1)
    dispatch_once(&kperf_log_init_once, &__block_literal_global);
  return kperf_log_log;
}

os_log_t __kperf_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.libkperf", "log");
  kperf_log_log = (uint64_t)result;
  return result;
}

void kperf_kdebug_filter_add_internal_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_crash();
  __break(1u);
}

void kperf_kdebug_filter_add_desc_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2064F6000, a2, a3, "unrecognized type 0x%hhx in filter description", a5, a6, a7, a8, 0);
}

void kperf_kdebug_filter_add_desc_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2064F6000, a2, a3, "cannot parse '%s' as a debugid integer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void kperf_kdebug_filter_add_desc_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2064F6000, a2, a3, "value %#lx is too large", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void kperf_kdebug_filter_add_desc_cold_6(int a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  v6[0] = 67109376;
  v6[1] = a1;
  v7 = 1024;
  v8 = v4;
  OUTLINED_FUNCTION_4(&dword_2064F6000, a2, v5, "cannot add filter 0x%08x to filter (%{errno}d)", (uint8_t *)v6);
}

void kperf_kdebug_filter_create_desc_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2064F6000, a2, a3, "failed to allocate memory for filter description of size %zu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void kperf_kdebug_filter_create_desc_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2064F6000, a2, a3, "unrecognized kdebug filter type 0x%x", a5, a6, a7, a8, 0);
}

void kperf_kdebug_filter_create_desc_cold_3(int a1, NSObject *a2)
{
  int v4;
  int *v5;
  char *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  v5 = __error();
  v6 = strerror(*v5);
  v7[0] = 67109634;
  v7[1] = a1;
  v8 = 1024;
  v9 = v4;
  v10 = 2080;
  v11 = v6;
  _os_log_error_impl(&dword_2064F6000, a2, OS_LOG_TYPE_ERROR, "failed to write filter %u (%d: %s)", (uint8_t *)v7, 0x18u);
}

void kperf_kdebug_filter_create_desc_cold_4(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = -1;
  OUTLINED_FUNCTION_4(&dword_2064F6000, a2, a3, "failed to get filter %u (%d)", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

void trace_block_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = 0;
  v4 = 2048;
  v5 = v2;
  _os_log_error_impl(&dword_2064F6000, a2, OS_LOG_TYPE_ERROR, "error: block returned unknown error (r = %d, delay = %zu)", (uint8_t *)v3, 0x12u);
}

void kperf_logging_start_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2064F6000, a1, a3, "kperf: setting perf filter", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void kperf_logging_start_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2064F6000, a1, a3, "kperf: setting perf typefilter", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void kperf_logging_start_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2064F6000, a1, a3, "kperf: no perf filter", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}


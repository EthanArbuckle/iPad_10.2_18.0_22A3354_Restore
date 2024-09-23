void sub_215C2B4CC(int a1, UInt8 *a2, uint64_t a3)
{
  CFNumberRef v5;
  const __CFData *Value;
  const __CFData *v7;
  const __CFData *v8;
  _QWORD v9[5];
  int valuePtr;
  CFRange v11;

  valuePtr = a1;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = sub_215C2B5BC;
  v9[3] = &unk_24D464D60;
  v9[4] = a3;
  dispatch_sync((dispatch_queue_t)qword_253F1D088, v9);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_253F1D078, 0xFFFFFFFFFFFFFFFFLL);
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_253F1D080, v5);
  if (Value)
  {
    v7 = Value;
    CFRetain(Value);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_253F1D078);
    CFRelease(v5);
    v11.location = 0;
    v11.length = 40;
    CFDataGetBytes(v7, v11, a2);
    v8 = v7;
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_253F1D078);
    v8 = v5;
  }
  CFRelease(v8);
}

intptr_t sub_215C2B5BC(intptr_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    if ((unint64_t)(v1 - qword_254DFD960) < 0x3B9ACA00)
      return result;
    qword_254DFD960 = *(_QWORD *)(result + 32);
  }
  NStatManagerQueryAllSources();
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_253F1D030, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_215C2B61C(uint64_t a1, int a2)
{
  size_t Count;
  const void **v5;
  uint64_t v6;
  int v7;
  int i;
  const UInt8 *BytePtr;
  int v10;
  CFNumberRef v11;
  CFRange v12;

  NStatManagerQueryAllSources();
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_253F1D030, 0xFFFFFFFFFFFFFFFFLL);
  if (a1)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_253F1D078, 0xFFFFFFFFFFFFFFFFLL);
    Count = CFDictionaryGetCount((CFDictionaryRef)qword_253F1D080);
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_253F1D080, 0, v5);
    qsort_b(v5, Count, 8uLL, &unk_24D464D20);
    if (Count)
    {
      v6 = 0;
      v7 = 0;
      for (i = 0; i < Count; v6 = i)
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v5[v6]);
        if (v7 < a2 && (v10 = *(_DWORD *)(a1 + 440 * v7), *(_DWORD *)BytePtr >= v10))
        {
          if (*(_DWORD *)BytePtr != v10)
          {
            ++v7;
            continue;
          }
          v12.location = 0;
          v12.length = 40;
          CFDataGetBytes((CFDataRef)v5[v6], v12, (UInt8 *)(a1 + 440 * v7++ + 184));
        }
        else
        {
          v11 = CFNumberCreate(0, kCFNumberIntType, BytePtr);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_253F1D080, v11);
          CFRelease(v11);
        }
        ++i;
      }
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_253F1D078);
    free(v5);
  }
}

uint64_t sub_215C2B7B4(uint64_t a1, CFDataRef *a2, CFDataRef *a3)
{
  int v4;

  v4 = *(_DWORD *)CFDataGetBytePtr(*a2);
  return (v4 - *(_DWORD *)CFDataGetBytePtr(*a3));
}

intptr_t sub_215C2B7EC()
{
  qword_253F1D030 = (uint64_t)dispatch_semaphore_create(0);
  qword_253F1D078 = (uint64_t)dispatch_semaphore_create(1);
  qword_253F1D068 = (uint64_t)dispatch_queue_create("netstats sample queue", 0);
  qword_253F1D088 = (uint64_t)dispatch_queue_create("netstats update queue", 0);
  qword_253F1D080 = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  qword_253F1D038 = NStatManagerCreate();
  NStatManagerAddAllTCP();
  NStatManagerAddAllUDP();
  NStatManagerQueryAllSources();
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_253F1D030, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_215C2B8C0()
{
  dispatch_async((dispatch_queue_t)qword_253F1D068, &unk_24D464E00);
}

intptr_t sub_215C2B8D4()
{
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_253F1D030);
}

uint64_t sub_215C2B8E0(int a1, CFTypeRef cf)
{
  CFRetain(cf);
  NStatSourceSetRemovedBlock();
  NStatSourceSetCountsBlock();
  return NStatSourceSetDescriptionBlock();
}

void sub_215C2B9AC(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v3;
  const __CFDictionary *v4;
  const __CFNumber *Value;
  const __CFNumber *v6;
  const __CFData *v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  CFDataRef v12;
  unint64_t valuePtr;
  UInt8 buffer[16];
  __int128 v15;
  unint64_t v16;
  CFRange v17;

  v3 = NStatSourceCopyCounts();
  if (v3)
  {
    v4 = (const __CFDictionary *)v3;
    v16 = 0;
    *(_OWORD *)buffer = 0u;
    v15 = 0u;
    valuePtr = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BE6B7C8]);
    if (Value)
    {
      v6 = Value;
      v7 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_253F1D080, Value);
      if (v7)
      {
        v17.location = 0;
        v17.length = 40;
        CFDataGetBytes(v7, v17, buffer);
      }
      else
      {
        v16 = 0;
        *(_OWORD *)buffer = 0u;
        v15 = 0u;
      }
      CFNumberGetValue(v6, kCFNumberIntType, buffer);
      v8 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE6B7E0]);
      CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > *(_QWORD *)&buffer[8])
        *(_QWORD *)&buffer[8] = valuePtr;
      v9 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE6B7D8]);
      CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > *((_QWORD *)&v15 + 1))
        *((_QWORD *)&v15 + 1) = valuePtr;
      v10 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE6B7F0]);
      CFNumberGetValue(v10, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > (unint64_t)v15)
        *(_QWORD *)&v15 = valuePtr;
      v11 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE6B7E8]);
      CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > v16)
        v16 = valuePtr;
      v12 = CFDataCreate(0, buffer, 40);
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_253F1D078, 0xFFFFFFFFFFFFFFFFLL);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_253F1D080, v6, v12);
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_253F1D078);
      CFRelease(v12);
    }
    CFRelease(v4);
  }
}

void sub_215C2BB7C(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = NStatSourceCopyProperties();
  if (v2)
  {
    v3 = (const void *)v2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease(v3);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_215C2BBC4()
{
  JUMPOUT(0x2199EE874);
}

uint64_t pm_sample_pid_version()
{
  return sub_215C2BBEC();
}

uint64_t sub_215C2BBEC()
{
  char *v0;
  int v1;
  int v2;
  mach_port_name_t *v3;
  mach_port_name_t *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  mach_port_name_t *p_tn;
  uint64_t v15;
  uint64_t v16;
  FILE *v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  FILE *v21;
  uint64_t v22;
  FILE *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  char *v30;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  mach_port_name_t tn;
  char buffer[4096];
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
  _QWORD v56[4];
  __int128 v57;
  __int128 v58;
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
  uint64_t v69;

  v0 = (char *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v69 = *MEMORY[0x24BDAC8D0];
  if (v1 == 1)
    v12 = 408;
  else
    v12 = 440;
  bzero(v0, v12);
  tn = 0;
  *(_OWORD *)task_info_out = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  memset(v56, 0, sizeof(v56));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  task_info_outCnt = 0;
  *(_DWORD *)v11 = v6;
  if ((v8 & 1) != 0)
  {
    if ((_DWORD)v6)
    {
      v13 = (char *)proc_pidpath(v6, buffer, 0x1000u);
      if ((int)v13 <= 0)
      {
        v21 = (FILE *)*MEMORY[0x24BDAC8D8];
        v29 = v6;
        v30 = v13;
        v19 = "proc_pidpath %u failed(%u)\n";
        goto LABEL_30;
      }
      strrchr(buffer, 47);
    }
    __strlcpy_chk();
  }
  if ((v8 & 0x24) != 0)
  {
    p_tn = v4;
    if (!v4)
    {
      p_tn = &tn;
      v22 = task_name_for_pid(*MEMORY[0x24BDAEC58], v6, &tn);
      if ((_DWORD)v22)
      {
        v17 = (FILE *)*MEMORY[0x24BDAC8D8];
        v29 = v22;
        v30 = mach_error_string(v22);
        v19 = "task_name_for_pid failed %u %s\n";
        goto LABEL_24;
      }
    }
    v38 = 0;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    *(_OWORD *)task_info_out = 0u;
    v33 = 0u;
    task_info_outCnt = 26;
    v15 = task_info(*p_tn, 0x1Au, task_info_out, &task_info_outCnt);
    v16 = v15;
    if (v4)
    {
      if ((_DWORD)v15)
      {
LABEL_13:
        v17 = (FILE *)*MEMORY[0x24BDAC8D8];
        v29 = v16;
        v30 = mach_error_string(v16);
LABEL_18:
        v19 = "task_info failed %u %s\n";
LABEL_24:
        v23 = v17;
LABEL_31:
        fprintf(v23, v19, v29, v30);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *p_tn);
      if ((_DWORD)v16)
        goto LABEL_13;
    }
    if ((v8 & 4) != 0)
    {
      v25 = v33;
      *(_OWORD *)(v11 + 132) = *(_OWORD *)task_info_out;
      *(_OWORD *)(v11 + 148) = v25;
      v26 = v37;
      *(_OWORD *)(v11 + 164) = v34;
      *((_OWORD *)v11 + 23) = v26;
      *((_QWORD *)v11 + 48) = v38;
      if ((v8 & 0x20) != 0)
LABEL_33:
        *((_QWORD *)v11 + 42) = v35;
    }
    else if ((v8 & 0x20) != 0)
    {
      goto LABEL_33;
    }
  }
  else
  {
    p_tn = v4;
  }
  if (v8 < 0)
  {
    task_info_outCnt = 8;
    v18 = task_info(*p_tn, 0x19u, (task_info_t)v11 + 56, &task_info_outCnt);
    if ((_DWORD)v18)
    {
      v17 = (FILE *)*MEMORY[0x24BDAC8D8];
      v29 = v18;
      v30 = mach_error_string(v18);
      goto LABEL_18;
    }
  }
  if ((v8 & 0x16) != 0)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    memset(v56, 0, sizeof(v56));
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v20 = (char *)proc_pid_rusage(v6, 6, (rusage_info_t *)&v41);
    if ((_DWORD)v20)
    {
      v21 = (FILE *)*MEMORY[0x24BDAC8D8];
      v29 = v6;
      v30 = v20;
      v19 = "proc_pid_rusage %u failed(%u)\n";
LABEL_30:
      v23 = v21;
      goto LABEL_31;
    }
    if ((v8 & 4) != 0)
    {
      v27 = v52;
      *((_OWORD *)v11 + 16) = v51;
      *((_OWORD *)v11 + 17) = v27;
      *((_OWORD *)v11 + 18) = v53;
      *((_QWORD *)v11 + 38) = v54;
      if (v2 >= 2)
      {
        v28 = v60;
        *(_OWORD *)(v11 + 408) = *(_OWORD *)&v56[1];
        *(_OWORD *)(v11 + 424) = v28;
      }
    }
    if ((v8 & 0x10) != 0)
    {
      *(_OWORD *)(v11 + 312) = v50;
      *((_QWORD *)v11 + 41) = v44;
    }
    if ((v8 & 2) != 0)
    {
      if (!v10)
        v10 = mach_absolute_time();
      *((_QWORD *)v11 + 49) = v10 - v46;
    }
  }
  if ((v8 & 8) != 0)
  {
    if (!v10)
      v10 = mach_absolute_time();
    if (qword_253F1D040 != -1)
      dispatch_once(&qword_253F1D040, &unk_24D464D40);
    sub_215C2B4CC(v6, (UInt8 *)v11 + 184, v10);
  }
  return 0;
}

uint64_t pm_sample_pid()
{
  return sub_215C2BBEC();
}

uint64_t pm_sample_task_and_pid_version()
{
  return sub_215C2BBEC();
}

uint64_t pm_sample_task_and_pid()
{
  return sub_215C2BBEC();
}

uint64_t pm_sample_task_version(mach_port_name_t a1)
{
  int x[2];

  x[0] = 0;
  x[1] = a1;
  if (pid_for_task(a1, x))
    return 0xFFFFFFFFLL;
  else
    return sub_215C2BBEC();
}

uint64_t pm_sample_task(mach_port_name_t a1)
{
  return pm_sample_task_version(a1);
}

_QWORD *pm_samples_init_version(uint64_t a1)
{
  int *v2;
  _QWORD *result;
  _QWORD *v4;
  _QWORD block[5];

  if (geteuid())
  {
    fwrite("pm_samples_init: Must be run as root!\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    v2 = __error();
    result = 0;
    *v2 = 13;
  }
  else
  {
    result = malloc_type_malloc(0x20uLL, 0x1030040C323FB7DuLL);
    if (result)
    {
      *result = 0;
      result[1] = a1;
      result[2] = 0;
      result[3] = 0;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = sub_215C2C1F8;
      block[3] = &unk_24D464EC8;
      block[4] = a1;
      if (qword_254DFD968 != -1)
      {
        v4 = result;
        dispatch_once(&qword_254DFD968, block);
        return v4;
      }
    }
  }
  return result;
}

uint64_t sub_215C2C1F8(uint64_t a1)
{
  host_priv_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  processor_set_t *v11;

  if ((*(_BYTE *)(a1 + 32) & 8) != 0 && qword_253F1D040 != -1)
    dispatch_once(&qword_253F1D040, &unk_24D464D40);
  v1 = MEMORY[0x2199EE9A0]();
  dword_253F1D070 = v1;
  if (!v1)
    abort();
  result = host_processor_sets(v1, (processor_set_name_array_t *)&qword_253F1D060, (mach_msg_type_number_t *)&dword_253F1D048);
  if ((_DWORD)result)
    sub_215C2C2D8(result, v3, v4, v5, v6, v7, v8, v9, result);
  if (dword_253F1D048)
  {
    v10 = 0;
    v11 = (processor_set_t *)&unk_253F1D04C;
    do
    {
      result = host_processor_set_priv(dword_253F1D070, *(_DWORD *)(qword_253F1D060 + 4 * v10), v11);
      if ((_DWORD)result)
        sub_215C2C8CC(result);
      ++v10;
      ++v11;
    }
    while (v10 < dword_253F1D048);
  }
  return result;
}

void sub_215C2C2D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[1024];

  vsnprintf(__str, 0x400uLL, "host_processor_sets returned %u", &a9);
  qword_254DFD928 = (uint64_t)__str;
  abort();
}

void pm_samples_destroy_version(int *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)a1 + 2);
  if (v2)
    free(v2);
  if (a1[1] >= 1)
  {
    v3 = (void *)*((_QWORD *)a1 + 3);
    if (v3)
      free(v3);
  }
  free(a1);
}

uint64_t pm_samples_num_tasks_version(unsigned int *a1)
{
  return *a1;
}

uint64_t pm_samples_num_tasks(unsigned int *a1)
{
  return *a1;
}

uint64_t pm_samples_get_version(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)a1 <= (signed int)a2)
    return 0;
  else
    return *(_QWORD *)(a1 + 16) + 440 * a2;
}

uint64_t pm_samples_get(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)a1 <= (signed int)a2)
    return 0;
  else
    return *(_QWORD *)(a1 + 16) + 440 * a2;
}

void *pm_samples_to_array_version(unsigned int *a1, void *__dst)
{
  return memcpy(__dst, *((const void **)a1 + 2), 440 * *a1);
}

void *pm_samples_to_array(unsigned int *a1, void *__dst)
{
  return memcpy(__dst, *((const void **)a1 + 2), 440 * *a1);
}

uint64_t pm_samples_sample_version(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  mach_msg_type_number_t *v4;
  task_array_t *v5;
  mach_error_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_msg_type_number_t *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  task_array_t task_list[2];
  __int128 v26;
  mach_msg_type_number_t task_listCnt[4];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!dword_253F1D048)
    sub_215C2C904();
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)task_list = 0u;
  v26 = 0u;
  v4 = task_listCnt;
  v5 = task_list;
  do
  {
    v6 = processor_set_tasks_with_flavor(dword_253F1D04C[v2], 2u, v5, v4);
    if (v6)
      sub_215C2C950(v6);
    ++v2;
    v7 = dword_253F1D048;
    ++v4;
    ++v5;
  }
  while (v2 < dword_253F1D048);
  v8 = 0;
  if (dword_253F1D048)
  {
    v9 = task_listCnt;
    do
    {
      v10 = *v9++;
      v8 = (v10 + v8);
      --v7;
    }
    while (v7);
  }
  if (*(_DWORD *)(a1 + 4) < (int)v8)
  {
    v11 = *(void **)(a1 + 16);
    if (v11)
      free(v11);
    v12 = *(void **)(a1 + 24);
    if (v12 && *(_DWORD *)(a1 + 4))
      free(v12);
    v13 = malloc_type_malloc(440 * (int)v8, 0x10800403F4B461DuLL);
    *(_QWORD *)(a1 + 16) = v13;
    if (!v13)
      sub_215C2C92C(0, v14, v15);
    if (*(_QWORD *)(a1 + 24))
    {
      v16 = malloc_type_malloc(4 * (int)v8, 0x100004052888210uLL);
      *(_QWORD *)(a1 + 24) = v16;
      if (!v16)
        sub_215C2C92C(0, v17, v18);
    }
    *(_DWORD *)(a1 + 4) = v8;
  }
  mach_absolute_time();
  if (dword_253F1D048)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      if (task_listCnt[v19])
      {
        v21 = 0;
        do
        {
          if ((pm_sample_task_version(task_list[v19][v21]) & 0x80000000) != 0)
          {
            *(_DWORD *)(*(_QWORD *)(a1 + 16) + 440 * v20) = -1;
            v8 = (v8 - 1);
            mach_port_deallocate(*MEMORY[0x24BDAEC58], task_list[v19][v21]);
          }
          else
          {
            v22 = *(_QWORD *)(a1 + 24);
            if (v22)
            {
              *(_DWORD *)(v22 + 4 * v20) = task_list[v19][v21];
              *(_QWORD *)(*(_QWORD *)(a1 + 16) + 440 * v20 + 400) = v22 + 4 * v20;
            }
            else
            {
              mach_port_deallocate(*MEMORY[0x24BDAEC58], task_list[v19][v21]);
            }
            ++v20;
          }
          ++v21;
          v23 = task_listCnt[v19];
        }
        while (v21 < v23);
      }
      else
      {
        v23 = 0;
      }
      mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)task_list[v19++], 4 * v23);
    }
    while (v19 < dword_253F1D048);
  }
  qsort_b(*(void **)(a1 + 16), (int)v8, 0x1B8uLL, &unk_24D464F28);
  if ((v3 & 8) != 0)
    sub_215C2B61C(*(_QWORD *)(a1 + 16), v8);
  *(_DWORD *)a1 = v8;
  return v8;
}

uint64_t pm_samples_sample(uint64_t a1)
{
  return pm_samples_sample_version(a1);
}

void *pm_samples_copy_version(uint64_t a1, const void **a2)
{
  int v4;
  int v5;
  void *v6;
  void *result;

  v4 = *(_DWORD *)a2;
  v5 = *(_DWORD *)(a1 + 4);
  v6 = *(void **)(a1 + 16);
  if (*(_DWORD *)a2 > v5)
  {
    v6 = malloc_type_realloc(v6, 440 * v4, 0x10800403F4B461DuLL);
    *(_QWORD *)(a1 + 16) = v6;
    if (!v6)
      sub_215C2C988();
    v4 = *(_DWORD *)a2;
    *(_DWORD *)(a1 + 4) = *(_DWORD *)a2;
  }
  result = memcpy(v6, a2[2], 440 * v4);
  *(_DWORD *)a1 = *(_DWORD *)a2;
  return result;
}

int *pm_samples_delta_version(int *result, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v3 = *result;
  v4 = *(_DWORD *)(a3 + 4);
  if (v4 < 0)
    sub_215C2C9B0();
  v7 = result;
  v8 = *result;
  if (v3 > v4)
  {
    result = (int *)malloc_type_realloc(*(void **)(a3 + 16), 440 * v3, 0x10800403F4B461DuLL);
    *(_QWORD *)(a3 + 16) = result;
    if (!result)
      sub_215C2C9D8();
    *(_DWORD *)(a3 + 4) = v3;
    v8 = *v7;
  }
  if (v8 >= 1)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = *((_QWORD *)v7 + 2);
      if (v9 < *(_DWORD *)a2
        && (result = (int *)(v11 + 440 * v10), v12 = *(_DWORD *)(*(_QWORD *)(a2 + 16) + 440 * v9), *result >= v12))
      {
        if (*result == v12)
        {
          result = (int *)pm_task_subtract_version();
          ++v10;
        }
        ++v9;
      }
      else
      {
        result = (int *)memcpy((void *)(*(_QWORD *)(a3 + 16) + 440 * v10), (const void *)(v11 + 440 * v10), 0x1B8uLL);
        ++v10;
      }
    }
    while (v10 < *v7);
  }
  *(_DWORD *)a3 = v3;
  return result;
}

int *pm_samples_delta(int *result, uint64_t a2, uint64_t a3)
{
  return pm_samples_delta_version(result, a2, a3);
}

uint64_t sub_215C2C894(uint64_t a1, int *a2, _DWORD *a3)
{
  int v3;
  int v4;
  unsigned int v5;

  v3 = *a2;
  v4 = *a2 - *a3;
  if (*a3 == -1)
    v4 = -1;
  if (v3 == -1)
    v5 = 1;
  else
    v5 = v4;
  if (v3 == *a3)
    return 0;
  else
    return v5;
}

size_t sub_215C2C8C0(const void *a1, uint64_t a2, uint64_t a3, FILE *a4)
{
  return fwrite(a1, 0xDuLL, 1uLL, a4);
}

void sub_215C2C8CC(mach_error_t a1)
{
  FILE *v1;
  char *v2;

  v1 = (FILE *)*MEMORY[0x24BDAC8D8];
  v2 = mach_error_string(a1);
  fprintf(v1, "Error in host_processor_set_priv(): %s", v2);
  abort();
}

void sub_215C2C904()
{
  __assert_rtn("pm_sample_all_internal_version", "pmsample.c", 239, "pcnt>0");
}

void sub_215C2C92C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_215C2C8C0("malloc failed", a2, a3, (FILE *)*MEMORY[0x24BDAC8D8]);
  abort();
}

void sub_215C2C950(mach_error_t a1)
{
  FILE *v1;
  char *v2;

  v1 = (FILE *)*MEMORY[0x24BDAC8D8];
  v2 = mach_error_string(a1);
  fprintf(v1, "Error in processor_set_tasks_with_flavor(): %s", v2);
  abort();
}

void sub_215C2C988()
{
  __assert_rtn("pm_samples_copy_version", "pmsample.c", 442, "dest_in->tasks");
}

void sub_215C2C9B0()
{
  __assert_rtn("pm_samples_delta_version", "pmsample.c", 469, "delta_samp->max_tasks>=0");
}

void sub_215C2C9D8()
{
  __assert_rtn("pm_samples_delta_version", "pmsample.c", 472, "delta_samp->tasks");
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t NStatManagerAddAllTCP()
{
  return MEMORY[0x24BE6B758]();
}

uint64_t NStatManagerAddAllUDP()
{
  return MEMORY[0x24BE6B760]();
}

uint64_t NStatManagerCreate()
{
  return MEMORY[0x24BE6B768]();
}

uint64_t NStatManagerQueryAllSources()
{
  return MEMORY[0x24BE6B778]();
}

uint64_t NStatSourceCopyCounts()
{
  return MEMORY[0x24BE6B780]();
}

uint64_t NStatSourceCopyProperties()
{
  return MEMORY[0x24BE6B788]();
}

uint64_t NStatSourceQueryDescription()
{
  return MEMORY[0x24BE6B798]();
}

uint64_t NStatSourceSetCountsBlock()
{
  return MEMORY[0x24BE6B7A8]();
}

uint64_t NStatSourceSetDescriptionBlock()
{
  return MEMORY[0x24BE6B7B0]();
}

uint64_t NStatSourceSetRemovedBlock()
{
  return MEMORY[0x24BE6B7B8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

kern_return_t host_processor_set_priv(host_priv_t host_priv, processor_set_name_t set_name, processor_set_t *set)
{
  return MEMORY[0x24BDAE810](*(_QWORD *)&host_priv, *(_QWORD *)&set_name, set);
}

kern_return_t host_processor_sets(host_priv_t host_priv, processor_set_name_array_t *processor_sets, mach_msg_type_number_t *processor_setsCnt)
{
  return MEMORY[0x24BDAE818](*(_QWORD *)&host_priv, processor_sets, processor_setsCnt);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x24BDAEB68]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x24BDAF5B0](*(_QWORD *)&t, x);
}

uint64_t pm_task_subtract_version()
{
  return MEMORY[0x24BEDD620]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x24BDAF6E8](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

kern_return_t processor_set_tasks_with_flavor(processor_set_t processor_set, mach_task_flavor_t flavor, task_array_t *task_list, mach_msg_type_number_t *task_listCnt)
{
  return MEMORY[0x24BDAF768](*(_QWORD *)&processor_set, *(_QWORD *)&flavor, task_list, task_listCnt);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x24BDB0190](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}


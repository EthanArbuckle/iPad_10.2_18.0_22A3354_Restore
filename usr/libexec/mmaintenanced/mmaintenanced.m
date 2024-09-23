void sub_100003124(uint64_t a1@<X8>)
{
  mach_port_t v2;
  mach_port_t v3;
  __uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  mach_port_t port;

  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v2 = mach_host_self();
  port = 0;
  v3 = mach_host_self();
  if (host_get_special_port(v3, -1, 2, &port))
  {
    if (mach_memory_info(v2, (mach_zone_name_array_t *)a1, (mach_msg_type_number_t *)(a1 + 8), (mach_zone_info_array_t *)(a1 + 16), (mach_msg_type_number_t *)(a1 + 24), (mach_memory_info_array_t *)(a1 + 32), (mach_msg_type_number_t *)(a1 + 40)))
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_100017B48();
    }
    else
    {
      v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      if (v4 >= 0x3B9ACA00)
      {
        v5 = v4 / 0x3B9ACA00;
        v6 = -2;
        v7 = v4 / 0x3B9ACA00;
        do
        {
          ++v6;
          v8 = v7 > 9;
          v7 /= 0xAuLL;
        }
        while (v8);
        if ((unint64_t)(v6 + 1) >= 2)
        {
          v9 = v6;
          do
          {
            v5 /= 0xAuLL;
            --v9;
          }
          while (v9);
          do
          {
            v5 *= 10;
            --v6;
          }
          while (v6);
        }
      }
      else
      {
        v5 = 0;
      }
      *(_QWORD *)(a1 + 48) = v5;
      *(_BYTE *)(a1 + 56) = 1;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
  {
    sub_100017B18();
  }
}

uint64_t sub_100003294(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 56))
  {
    vm_deallocate(mach_task_self_, *(_QWORD *)result, 8 * *(unsigned int *)(result + 8));
    vm_deallocate(mach_task_self_, *(_QWORD *)(v1 + 16), 8 * *(unsigned int *)(v1 + 24));
    result = vm_deallocate(mach_task_self_, *(_QWORD *)(v1 + 32), 8 * *(unsigned int *)(v1 + 40));
  }
  *(_BYTE *)(v1 + 56) = 0;
  return result;
}

xpc_object_t sub_100003300(uint64_t a1)
{
  xpc_object_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t xarray;

  if (*(_DWORD *)(a1 + 8) == *(_DWORD *)(a1 + 24))
  {
    result = xpc_array_create_empty();
    if (*(_DWORD *)(a1 + 8))
    {
      xarray = result;
      v3 = 0;
      v4 = 0;
      v5 = 0;
      do
      {
        v6 = xpc_dictionary_create(0, 0, 0);
        v7 = xpc_int64_create((*(_QWORD *)(*(_QWORD *)(a1 + 16) + v3 + 24) * *(_QWORD *)(*(_QWORD *)(a1 + 16) + v3)) >> 10);
        v8 = xpc_int64_create(*(_QWORD *)(*(_QWORD *)(a1 + 16) + v3));
        v9 = xpc_string_create((const char *)(*(_QWORD *)a1 + v4));
        v10 = xpc_int64_create(*(_QWORD *)(a1 + 48));
        v11 = xpc_int64_create(*(_QWORD *)(*(_QWORD *)(a1 + 16) + v3 + 24));
        xpc_dictionary_set_value(v6, "estimated_size_kb", v7);
        xpc_dictionary_set_value(v6, "count", v8);
        xpc_dictionary_set_value(v6, "zone_elem_size_bytes", v11);
        xpc_dictionary_set_value(v6, "zone_name", v9);
        xpc_dictionary_set_value(v6, "clock_uptime_sec", v10);
        xpc_array_append_value(xarray, v6);
        if (v7)
          xpc_release(v7);
        if (v8)
          xpc_release(v8);
        if (v9)
          xpc_release(v9);
        if (v6)
          xpc_release(v6);
        if (v10)
          xpc_release(v10);
        if (v11)
          xpc_release(v11);
        ++v5;
        v4 += 80;
        v3 += 64;
      }
      while (v5 < *(unsigned int *)(a1 + 8));
      return xarray;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100017B78();
    return 0;
  }
  return result;
}

xpc_object_t sub_1000034E8(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t i;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  uint64_t v16;
  xpc_object_t v17;
  const char *Name;
  xpc_object_t v19;
  CFNumberRef v20;
  const __CFDictionary *Value;
  const __CFString *v22;
  const char *CStringPtr;
  uint64_t SymbolWithAddressAtTime;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  const __CFDictionary *theDict;
  xpc_object_t xarray;
  char v32;
  _BYTE v33[15];
  char v34;
  _BYTE v35[15];
  char v36;
  _BYTE v37[15];
  uint8_t buf[16];

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100017BA8();
    return 0;
  }
  v3 = Mutable;
  v4 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0, 0);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100017BD8();
    return 0;
  }
  v5 = v4;
  theDict = v3;
  CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_100003990, v3);
  CFRelease(v5);
  v6 = CSSymbolicatorCreateWithMachKernel();
  v28 = v7;
  v29 = v6;
  if (((uint64_t (*)(void))CSIsNull)())
  {
    v8 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Symbolicator is null, not including VM_KERN_SITE_KERNEL regions", buf, 2u);
    }
  }
  xarray = xpc_array_create_empty();
  if (*(_DWORD *)(a1 + 40))
  {
    v9 = 0;
    for (i = 0; i < *(unsigned int *)(a1 + 40); ++i)
    {
      v11 = xpc_dictionary_create(0, 0, 0);
      v12 = xpc_int64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + v9 + 16) >> 10);
      v13 = xpc_int64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + v9 + 56) >> 10);
      v14 = xpc_int64_create(*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + v9 + 64));
      v15 = xpc_int64_create(*(_QWORD *)(a1 + 48));
      xpc_dictionary_set_value(v11, "size_kb", v12);
      xpc_dictionary_set_value(v11, "peak_kb", v13);
      xpc_dictionary_set_value(v11, "vm_tag_id", v14);
      xpc_dictionary_set_value(v11, "clock_uptime_sec", v15);
      v16 = *(_QWORD *)(a1 + 32);
      if ((*(_QWORD *)(v16 + v9) & 0x400) == 0)
      {
        switch(*(_QWORD *)(v16 + v9))
        {
          case 0u:
            v17 = sub_1000039CC(*(_QWORD *)(v16 + v9 + 8));
            goto LABEL_13;
          case 1u:
            v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, (const void *)(v16 + v9 + 8));
            Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, v20);
            if (!Value)
              goto LABEL_22;
            v22 = (const __CFString *)CFDictionaryGetValue(Value, kCFBundleIdentifierKey);
            if (!v22)
            {
              if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
                sub_100017C34(&v36, v37);
              goto LABEL_24;
            }
            CStringPtr = CFStringGetCStringPtr(v22, 0x8000100u);
            v19 = xpc_string_create(CStringPtr);
            if (v19)
              goto LABEL_14;
            goto LABEL_22;
          case 2u:
            if ((CSIsNull(v29, v28) & 1) != 0)
              goto LABEL_21;
            SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime(v29, v28, *(_QWORD *)(*(_QWORD *)(a1 + 32) + v9 + 8), 0x8000000000000000);
            v26 = v25;
            if (!CSIsNull(SymbolWithAddressAtTime, v25))
            {
              Name = (const char *)CSSymbolGetName(SymbolWithAddressAtTime, v26);
              goto LABEL_12;
            }
            if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
              sub_100017C60(&v34, v35);
            v19 = 0;
            if (!v12)
              goto LABEL_28;
            goto LABEL_27;
          case 3u:
            v17 = sub_100003B04(*(_QWORD *)(v16 + v9 + 8));
            goto LABEL_13;
          default:
LABEL_21:
            v20 = 0;
            goto LABEL_22;
        }
      }
      Name = (const char *)(v16 + v9 + 96);
LABEL_12:
      v17 = xpc_string_create(Name);
LABEL_13:
      v19 = v17;
      v20 = 0;
      if (v17)
      {
LABEL_14:
        xpc_dictionary_set_value(v11, "name", v19);
        xpc_array_append_value(xarray, v11);
        if (!v20)
          goto LABEL_26;
      }
      else
      {
LABEL_22:
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          sub_100017C08(&v32, v33);
LABEL_24:
        v19 = 0;
        if (!v20)
          goto LABEL_26;
      }
      CFRelease(v20);
LABEL_26:
      if (v12)
LABEL_27:
        xpc_release(v12);
LABEL_28:
      if (v13)
        xpc_release(v13);
      if (v14)
        xpc_release(v14);
      if (v15)
        xpc_release(v15);
      if (v19)
        xpc_release(v19);
      if (v11)
        xpc_release(v11);
      v9 += 176;
    }
  }
  CFRelease(theDict);
  if ((CSIsNull(v29, v28) & 1) == 0)
    CSRelease(v29, v28);
  return xarray;
}

void sub_100003990(int a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;

  Value = CFDictionaryGetValue(theDict, CFSTR("OSBundleLoadTag"));
  CFDictionarySetValue(a3, Value, theDict);
}

xpc_object_t sub_1000039CC(unint64_t a1)
{
  NSObject *v3;
  uint8_t buf[4];
  unint64_t v5;

  if (a1 <= 0x24)
    return xpc_string_create_with_format("VM_KERN_MEMORY_%s");
  if (a1 == 256)
    return xpc_string_create("VM_KERN_MEMORY_COUNT");
  if (a1 == 255)
    return xpc_string_create("VM_KERN_MEMORY_ANY");
  v3 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "unrecognized vm kern memory tag %lld", buf, 0xCu);
  }
  return xpc_string_create_with_format("VM_KERN_MEMORY_%lld");
}

xpc_object_t sub_100003B04(unint64_t a1)
{
  NSObject *v3;
  uint8_t buf[4];
  unint64_t v5;

  if (a1 <= 0xD)
    return xpc_string_create_with_format("VM_KERN_COUNT_%s");
  v3 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "unrecognized vm kern count tag %lld", buf, 0xCu);
  }
  return xpc_string_create_with_format("VM_KERN_COUNT_%lld");
}

void sub_100003BD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *sub_100003BF8(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

_QWORD *sub_100003C08()
{
  _QWORD *v0;
  unint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  unsigned int v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  uint64_t v17;

  v0 = 0;
  v1 = 0;
  v2 = 5;
  while (1)
  {
    v3 = memorystatus_control(3, 0, 1, v0, v1);
    if ((v3 & 0x80000000) != 0)
    {
      v10 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        sub_100017C8C(v10);
        if (!v0)
          return v0;
        goto LABEL_27;
      }
LABEL_26:
      if (!v0)
        return v0;
      goto LABEL_27;
    }
    v4 = v3;
    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        sub_100017D00();
        if (!v0)
          return v0;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (v3 <= 0xC7)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        sub_100017D2C();
        if (!v0)
          return v0;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    v5 = v3;
    v6 = v3 - 200;
    v7 = v6 / 0x118;
    if (v6 % 0x118)
      break;
    if (v1 >= v3)
    {
      v8 = v0[24];
      if (v7 == v8)
        return v0;
      v9 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        v13 = v4;
        v14 = 2048;
        v15 = v7;
        v16 = 2048;
        v17 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "memorystatus_control request for on demand snapshot returned snapshot size %d, which is %zd entries, and does not match entry_count of %zu", buf, 0x1Cu);
      }
      v5 = v1;
    }
    else
    {
      if (v0)
        free(v0);
      v0 = malloc_type_malloc(v4, 0x9DB112B1uLL);
    }
    v1 = v5;
    if (!--v2)
      goto LABEL_26;
  }
  if (!os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    goto LABEL_26;
  sub_100017D8C();
  if (v0)
  {
LABEL_27:
    free(v0);
    return 0;
  }
  return v0;
}

vm_size_t sub_100003E40(int a1)
{
  _QWORD *v2;
  vm_size_t v3;

  if (qword_100024F18 != -1)
    dispatch_once(&qword_100024F18, &stru_100020AC0);
  if (dword_1000241F8 < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100017E18();
    v3 = 0;
    v2 = 0;
  }
  else
  {
    v2 = malloc_type_malloc(56 * qword_100024F10, 0x2B762B35uLL);
    if ((ledger(1, a1, v2, &qword_100024F10) & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_100017DEC();
      v3 = 0;
    }
    else
    {
      v3 = v2[7 * dword_1000241F8] / vm_page_size;
    }
  }
  free(v2);
  return v3;
}

void sub_100003F64(id a1)
{
  pid_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  _BYTE v6[40];
  uint64_t v7;

  v1 = getpid();
  if ((ledger(0, v1, v6, 0) & 0x80000000) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100017E44();
    v2 = 0;
  }
  else
  {
    qword_100024F10 = v7;
    v2 = (char *)malloc_type_malloc(96 * v7, 0x411E0BF2uLL);
    if ((ledger(2, v2, &qword_100024F10, 0) & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_100017E44();
    }
    else
    {
      v3 = qword_100024F10;
      if (qword_100024F10 >= 1)
      {
        v4 = 0;
        v5 = v2;
        while (strncmp("neural_nofootprint_total", v5, 0x18uLL))
        {
          ++v4;
          v5 += 96;
          if (v3 == v4)
            goto LABEL_14;
        }
        dword_1000241F8 = v4;
      }
    }
  }
LABEL_14:
  free(v2);
}

uint64_t sub_1000040CC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  int v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *log;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  size_t v41;
  size_t v42;
  uint64_t v43;
  uint8_t buf[4];
  _BYTE v45[10];
  _BYTE v46[10];
  _BYTE v47[12];
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  unint64_t v65;

  v41 = 4;
  v42 = 4;
  if (!a1)
    return -1;
  v1 = a1;
  v43 = 0;
  if (sysctlbyname("kern.memorystatus_level", (char *)&v43 + 4, &v42, 0, 0)
    || sysctlbyname("kern.memorystatus_available_pages", &v43, &v41, 0, 0))
  {
    return -1;
  }
  v4 = v43;
  v5 = *(_QWORD *)(v1 + 192);
  v6 = v43 / HIDWORD(v43);
  if (v5)
  {
    v29 = v43 / HIDWORD(v43);
    v7 = 0;
    v8 = 0;
    v31 = 0;
    v9 = 0;
    v5 = 0;
    v38 = 0;
    v33 = 0;
    v34 = 0;
    v10 = v1 + 204;
    v11 = (_QWORD *)(v1 + 368);
    v32 = v1;
    do
    {
      v39 = v5;
      v36 = v8;
      v12 = *(v11 - 6) - *(v11 - 2) + *(v11 - 4);
      v13 = *((_DWORD *)v11 - 31);
      v14 = *(v11 - 7) - *(v11 - 3) + *(v11 - 1) + *(v11 - 5) + *v11;
      v15 = sub_100003E40(*((_DWORD *)v11 - 42));
      v16 = v15;
      v17 = *((_DWORD *)v11 - 32);
      if (v17 >= 101)
      {
        if ((v13 & 2) != 0)
          v18 = 0;
        else
          v18 = v12;
      }
      else
      {
        v33 += v14;
        if ((v13 & 2) != 0)
          v18 = 0;
        else
          v18 = v12;
        v34 += v18;
        if (v15 >= 1)
        {
          log = qword_100024F80;
          if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEBUG))
          {
            v20 = *((_DWORD *)v11 - 42);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)v45 = v10;
            *(_WORD *)&v45[8] = 1024;
            *(_DWORD *)v46 = v20;
            *(_WORD *)&v46[4] = 1024;
            *(_DWORD *)&v46[6] = v17;
            *(_WORD *)v47 = 2048;
            *(_QWORD *)&v47[2] = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s pid(%d) jetsam priority(%d) | neural_nofootprint_pages = %llu", buf, 0x22u);
          }
          v31 += v16;
        }
      }
      v11 += 35;
      v9 += v16;
      v38 += v14;
      v5 = v18 + v39;
      if ((v13 & 2) != 0)
        v19 = v12;
      else
        v19 = 0;
      v8 = v19 + v36;
      ++v7;
      v1 = v32;
      v10 += 280;
    }
    while (*(_QWORD *)(v32 + 192) > v7);
    v4 = v43;
    v6 = v29;
    v22 = v33;
    v21 = v34;
    v23 = v31;
  }
  else
  {
    v22 = 0;
    v21 = 0;
    v38 = 0;
    v9 = 0;
    v23 = 0;
    v8 = 0;
  }
  v40 = v5;
  v35 = v21;
  v37 = v21 * (unint64_t)*(unsigned int *)(v1 + 60) / v5;
  v24 = v23 + v22 + v37 + v4;
  v2 = v24 / v6;
  v25 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v45 = v2 - (v24 - v23) / v6;
    *(_WORD *)&v45[8] = 2048;
    *(_QWORD *)v46 = v23;
    *(_WORD *)&v46[8] = 2048;
    *(_QWORD *)v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "neural reclaimable impact: %llu | neural reclaimable pages = %llu neural total pages = %llu", buf, 0x20u);
    v25 = qword_100024F80;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(_DWORD *)(v1 + 56);
    v27 = *(_DWORD *)(v1 + 60);
    v28 = *(_QWORD *)(v1 + 80);
    *(_DWORD *)buf = 67112448;
    *(_DWORD *)v45 = v26;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v27;
    *(_WORD *)v46 = 2048;
    *(_QWORD *)&v46[2] = v28;
    *(_WORD *)v47 = 1024;
    *(_DWORD *)&v47[2] = HIDWORD(v43);
    *(_WORD *)&v47[6] = 1024;
    *(_DWORD *)&v47[8] = v43;
    v48 = 1024;
    v49 = v6;
    v50 = 2048;
    v51 = v22;
    v52 = 2048;
    v53 = v35;
    v54 = 2048;
    v55 = v38 - v22;
    v56 = 2048;
    v57 = v40 - v35;
    v58 = 2048;
    v59 = v8;
    v60 = 2048;
    v61 = v37;
    v62 = 2048;
    v63 = v24;
    v64 = 2048;
    v65 = v24 / v6;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "pressure: vmstat anonymous %u compressor %u in_compressor %llu, jetsam level %u available %u p_p_l %u,\n<= FG uncompressed %llu compressed %llu, > FG uncompressed %llu compressed %llu, frozen %llu,\nest reclaimable %llu total_user %llu levels %lld", buf, 0x7Au);
  }
  return v2;
}

void sub_1000044C8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  NSObject *v7;
  void **v8;
  void *__p[2];
  char v10;
  uint8_t buf[4];
  void **v12;
  __int16 v13;
  vm_size_t v14;
  _QWORD v15[211];

  if (a1)
  {
    bzero(v15, 0x698uLL);
    v2 = *(_QWORD *)(a1 + 192);
    if (v2)
    {
      v3 = (_QWORD *)(a1 + 288);
      do
      {
        v4 = *((unsigned int *)v3 - 12);
        if ((v4 - 100) <= 0x6E)
          v15[v4] += *v3;
        v3 += 35;
        --v2;
      }
      while (v2);
    }
    for (i = 100; i != 211; ++i)
    {
      v6 = v15[i];
      if (v6)
      {
        util::stringprintf((util *)"memory_usage.band%d", __p, i);
        v7 = qword_100024F80;
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
        {
          v8 = __p;
          if (v10 < 0)
            v8 = (void **)__p[0];
          *(_DWORD *)buf = 136315394;
          v12 = v8;
          v13 = 2048;
          v14 = vm_kernel_page_size * v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %lld", buf, 0x16u);
        }
        if (v10 < 0)
          operator delete(__p[0]);
      }
    }
  }
}

uint64_t sub_100004658()
{
  io_registry_entry_t v0;
  uint64_t result;
  NSObject *v2;
  uint8_t v3[16];

  v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v0)
  {
    result = (uint64_t)IORegistryEntryCreateCFProperty(v0, CFSTR("stress-rack"), 0, 0);
    if (!result)
      return result;
    CFRelease((CFTypeRef)result);
  }
  else
  {
    v2 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NVRAM is not supported on this system", v3, 2u);
    }
  }
  return 1;
}

uint64_t sub_1000046FC()
{
  NSObject *v0;
  _BOOL4 v1;
  uint64_t result;
  const char *v3;
  uint8_t *p_buf;
  __darwin_time_t tv_sec;
  _BOOL4 v6;
  __int16 v7;
  timeval v8;
  stat buf;

  if (sub_100004658())
  {
    v0 = qword_100024F80;
    v1 = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v1)
    {
      LOWORD(buf.st_dev) = 0;
      v3 = "Device is a stress rack device. Bailing out.";
      p_buf = (uint8_t *)&buf;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, v3, p_buf, 2u);
      return 0;
    }
    return result;
  }
  result = stat("/tmp/mmaintenanced", &buf);
  if (!(_DWORD)result)
    return result;
  if (*__error() != 2)
  {
    result = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_100017F40();
      return 0;
    }
    return result;
  }
  if (stat("/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", &buf))
  {
    if (*__error() != 2)
    {
      result = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_100017EC8();
        return 0;
      }
      return result;
    }
    return 1;
  }
  tv_sec = buf.st_mtimespec.tv_sec;
  if (gettimeofday(&v8, 0))
  {
    result = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_100017E9C();
      return 0;
    }
    return result;
  }
  if (v8.tv_sec < tv_sec)
  {
    result = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_100017E70();
      return 0;
    }
    return result;
  }
  if (v8.tv_sec - tv_sec > 71999)
    return 1;
  v0 = qword_100024F80;
  v6 = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v6)
  {
    v7 = 0;
    v3 = "could not reboot because last reboot was < 20 hours";
    p_buf = (uint8_t *)&v7;
    goto LABEL_4;
  }
  return result;
}

BOOL sub_1000048D8()
{
  int v0;
  _BOOL8 result;

  v0 = open("/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", 513, 438);
  if (v0 == -1)
  {
    result = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100017FB8();
    return 0;
  }
  if (close(v0))
  {
    result = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100017FE4();
    return 0;
  }
  return 1;
}

void sub_100004978()
{
  FILE *v0;
  std::error_code *v1;
  int64_t v2;
  int64_t v3;
  NSObject *v4;
  NSObject *v5;
  xpc_object_t v6;
  int64_t value[2];
  int64_t v8[2];
  int64_t v9[2];
  uint8_t buf[4];
  int64_t v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;

  if (sub_100007E64())
  {
    *(_OWORD *)v8 = 0u;
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)value = 0u;
    v0 = sub_100007F0C(value);
    if (sub_100007EE8((uint64_t)v0, v1))
    {
      v3 = value[1];
      v2 = v8[0];
      v4 = qword_100024F80;
      if (__PAIR128__(v8[0], value[1]) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          sub_100018010();
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219264;
          v11 = value[0];
          v12 = 2048;
          v13 = v3;
          v14 = 2048;
          v15 = v2;
          v16 = 2048;
          v17 = v8[1];
          v18 = 2048;
          v19 = v9[0];
          v20 = 2048;
          v21 = v9[1];
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting system hwm state from previous reboot action: {did_user_space_reboot=%llu user_hwm_level=%llu user_hwm_limit=%llu did_kernel_reboot=%llu kernel_hwm_level=%llu kernel_hwm_limit=%llu}", buf, 0x3Eu);
        }
        v6 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v6, "did_user_space_reboot", value[0] != 0);
        xpc_dictionary_set_int64(v6, "user_hwm_level", value[1]);
        xpc_dictionary_set_int64(v6, "user_hwm_limit", v8[0]);
        if (v9[0] && v9[1])
        {
          xpc_dictionary_set_BOOL(v6, "did_kernel_reboot", v8[1] != 0);
          xpc_dictionary_set_int64(v6, "kernel_hwm_level", v9[0]);
          xpc_dictionary_set_int64(v6, "kernel_hwm_limit", v9[1]);
        }
        analytics_send_event("com.apple.memorytools.stats.systemmemoryreset", v6);
        xpc_release(v6);
      }
    }
    else
    {
      v5 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_10001803C(v5);
    }
  }
}

uint64_t sub_100004B84(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  std::error_code *v13;
  uint64_t *v14;
  std::error_code *v15;
  void *__p;
  void *v17;
  uint64_t v18;

  if (!sub_1000046FC())
    goto LABEL_12;
  if (utimes("/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", 0) && *__error() != 2)
  {
    v9 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018160(v9);
    goto LABEL_12;
  }
  v8 = open("/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", 513, 438);
  if (v8 == -1)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_1000180B0();
    goto LABEL_12;
  }
  if (close(v8))
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100017FE4();
    goto LABEL_12;
  }
  v12 = open("/tmp/mmaintenanced", 513, 438);
  if (v12 == -1)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_1000180DC();
    goto LABEL_12;
  }
  if (close(v12))
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018134();
    goto LABEL_12;
  }
  if (!sub_100004FA0(1))
  {
LABEL_35:
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", v13);
LABEL_12:
    sub_10000807C(0, a3, a4);
    return 0;
  }
  if (!sub_1000048D8())
  {
LABEL_34:
    sub_100004FA0(0);
    goto LABEL_35;
  }
  __p = 0;
  v17 = 0;
  v18 = 0;
  sub_100006F1C(&__p, 0xAuLL);
  if (a2)
    operator new[]();
  if (*((char *)a1 + 23) >= 0)
    v14 = a1;
  else
    v14 = (uint64_t *)*a1;
  if ((WriteSystemMemoryResetReportWithPids(v14, 0, 0) & 1) == 0
    && os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
  {
    sub_100018108();
  }
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  v10 = 1;
  sub_10000807C(1u, a3, a4);
  sync();
  if (reboot3(0x2000000000000000))
  {
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", v15);
    goto LABEL_34;
  }
  return v10;
}

void sub_100004F74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_100004FA0(int a1)
{
  int v1;
  int v3;

  v3 = a1;
  v1 = sysctlbyname("kern.darkboot", 0, 0, &v3, 4uLL);
  if (v1 && os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    sub_1000181E8();
  return v1 == 0;
}

uint64_t sub_10000501C(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  void *__p[2];
  char v10;
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  unint64_t v14;

  if (qword_100024F60 < 1)
  {
    v7 = qword_100024F80;
    v6 = 0;
    if (!os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
      return v6;
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No user reclaimable limit defined", buf, 2u);
    return 0;
  }
  v2 = sub_1000040CC(a1);
  v3 = qword_100024F60;
  v4 = qword_100024F80;
  v5 = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT);
  if (v2 >= v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 134218240;
      v12 = v2;
      v13 = 2048;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User reclaimable limit not crossed; user reclaimable current: %llu%%. User reclaimable minimum: %llu%%",
        buf,
        0x16u);
      v3 = qword_100024F60;
    }
    sub_10000807C(0, v2, v3);
    return 0;
  }
  if (v5)
  {
    *(_DWORD *)buf = 134218240;
    v12 = v2;
    v13 = 2048;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User reclaimable memory dropped below the limit, userspace rebooting the device. User reclaimable current: %llu%%. User reclaimable minimum: %llu%%", buf, 0x16u);
    v3 = qword_100024F60;
  }
  util::stringprintf((util *)"User reclaimable memory dropped below the limit. User reclaimable current: %llu%%. User reclaimable minimum: %llu%%", __p, v2, v3);
  v6 = sub_100004B84((uint64_t *)__p, a1, v2, qword_100024F60);
  if (v10 < 0)
    operator delete(__p[0]);
  return v6;
}

void sub_1000051F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100005214(const char *a1)
{
  char *v2;
  char *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v9;
  const char *v10;
  const char *v11;
  char *v12;
  size_t size;
  int v14[6];

  *(_OWORD *)v14 = xmmword_10001A3A0;
  size = 0;
  if (sysctl(v14, 4u, 0, &size, 0, 0) < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018248();
  }
  else if (size)
  {
    v2 = (char *)malloc_type_malloc(size, 0x2A2AE461uLL);
    if (v2)
    {
      v3 = v2;
      if (sysctl(v14, 4u, v2, &size, 0, 0) < 0)
      {
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          sub_10001830C();
      }
      else if (size > 0x287)
      {
        v9 = size / 0x288;
        v10 = &v3[648 * (size / 0x288) - 1053];
        while (--v9)
        {
          v11 = v10 - 648;
          v12 = strcasestr(v10, a1);
          v10 = v11;
          if (v12)
          {
            v7 = *(unsigned int *)(v11 + 445);
            free(v3);
            return v7;
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        sub_100018338();
      }
      free(v3);
    }
    else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    {
      sub_1000182E0();
    }
  }
  else
  {
    v4 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018274(v4, v5, v6);
  }
  return 0xFFFFFFFFLL;
}

void sub_10000541C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  mach_port_t sp;
  char v9;
  _DWORD v10[4];
  _QWORD v11[2];
  uint8_t buf[8];
  __int16 v13;
  int v14;

  v0 = sub_100005214("SpringBoard");
  if ((_DWORD)v0 == -1)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018364();
  }
  else
  {
    v1 = v0;
    v11[0] = 0;
    v11[1] = 0;
    if ((memorystatus_control(8, v0, 0, v11, 16) & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_100018390();
    }
    else if (sub_100004FA0(1))
    {
      v10[0] = qword_100024F70;
      v10[1] = 1;
      v10[2] = qword_100024F70;
      v10[3] = 1;
      v2 = memorystatus_control(7, v1, 0, v10, 16);
      v3 = qword_100024F80;
      if (v2 < 0 && os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        sub_100018414(v3, buf);
        v3 = *(NSObject **)buf;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Set SpringBoard memory limit to its inactive limit", buf, 2u);
      }
      v9 = 0;
      sp = 0;
      bootstrap_look_up(bootstrap_port, "com.apple.springboard.blockableservices", &sp);
      if (sp)
      {
        SBGetIsAlive();
        if (!v9)
        {
          v4 = qword_100024F80;
          if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SpringBoard is not alive", buf, 2u);
          }
        }
        mach_port_deallocate(mach_task_self_, sp);
      }
      else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        sub_1000183E8();
      }
      v5 = sub_100005214("SpringBoard");
      v6 = qword_100024F80;
      v7 = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT);
      if (v5 == (_DWORD)v1)
      {
        if (v7)
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v1;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SpringBoard was not killed (pid=%d)", buf, 8u);
        }
        if ((memorystatus_control(7, v1, 0, v11, 16) & 0x80000000) != 0
          && os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        {
          sub_1000183BC();
        }
        sub_100004FA0(0);
      }
      else if (v7)
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v1;
        v13 = 1024;
        v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SpringBoard was killed (oldpid=%d newpid=%d)", buf, 0xEu);
      }
    }
  }
}

void sub_100005744(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;

  v1 = sub_1000040CC(a1);
  v2 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Current UserReclaimable: %lld%%", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_1000057E8()
{
  time_t v0;
  size_t v2;
  uint64_t v3;
  time_t v4;

  v4 = 0;
  time(&v4);
  v2 = 16;
  if (sysctlbyname("kern.boottime", &v3, &v2, 0, 0) == -1)
    return -1;
  v0 = ((v4 - v3) / 3600) & 3;
  if ((v4 - v3) / -3600 >= 0)
    v0 = -(((v4 - v3) / -3600) & 3);
  return (v4 - v3) / 3600 - v0;
}

void sub_10000587C()
{
  uint64_t v0;
  NSObject *v1;
  mach_port_t v2;
  kern_return_t v3;
  NSObject *v4;
  NSObject *v5;
  mach_port_t v6;
  kern_return_t v7;
  NSObject *v8;
  mach_msg_type_number_t host_info64_outCnt;
  uint8_t v10[4];
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  host_info64_outCnt = 38;
  v0 = sub_1000057E8();
  v1 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Performing Compressor Sweep: %ld hr", buf, 0xCu);
  }
  v2 = mach_host_self();
  v3 = host_statistics64(v2, 4, (host_info64_t)buf, &host_info64_outCnt);
  v4 = qword_100024F80;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_10001853C();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 134217984;
      v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "swapins (before sweep): %lld", v10, 0xCu);
      v4 = qword_100024F80;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 134217984;
      v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "swapouts (before sweep): %lld", v10, 0xCu);
      v4 = qword_100024F80;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 67109120;
      LODWORD(v11) = v16;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "compressor_page_count (before sweep): %u", v10, 8u);
      v4 = qword_100024F80;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 134217984;
      v11 = v17;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "total_uncompressed_pages_in_compressor (before sweep): %lld", v10, 0xCu);
    }
  }
  if (pid_hibernate(4294967294))
  {
    v5 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_1000184C8(v5);
  }
  else
  {
    v6 = mach_host_self();
    v7 = host_statistics64(v6, 4, (host_info64_t)buf, &host_info64_outCnt);
    v8 = qword_100024F80;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_10001849C();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v10 = 134217984;
        v11 = v14;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "swapins (after sweep): %lld", v10, 0xCu);
        v8 = qword_100024F80;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v10 = 134217984;
        v11 = v15;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "swapouts (after sweep): %lld", v10, 0xCu);
        v8 = qword_100024F80;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v10 = 67109120;
        LODWORD(v11) = v16;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "compressor_page_count (after sweep): %u", v10, 8u);
        v8 = qword_100024F80;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v10 = 134217984;
        v11 = v17;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "total_uncompressed_pages_in_compressor (after sweep): %lld", v10, 0xCu);
      }
    }
  }
}

void sub_100005C20(int a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  size_t v4;
  xpc_object_t value;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  size_t count;
  const char *v10;
  size_t v11;
  xpc_object_t v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  size_t v16;
  const char *v17;
  _OWORD v18[4];
  _OWORD v19[4];
  _OWORD v20[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  size_t v26;
  __int16 v27;
  const char *v28;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  sub_100003124((uint64_t)&v21);
  if (BYTE8(v24))
  {
    v20[0] = v21;
    v20[1] = v22;
    v20[2] = v23;
    v20[3] = v24;
    v2 = sub_100003300((uint64_t)v20);
    v19[0] = v21;
    v19[1] = v22;
    v19[2] = v23;
    v19[3] = v24;
    v3 = sub_1000034E8((uint64_t)v19);
    if (v2)
    {
      if (xpc_array_get_count(v2))
      {
        v4 = 0;
        do
        {
          value = xpc_array_get_value(v2, v4);
          if (a1)
          {
            analytics_send_event("com.apple.memorytools.stats.zoneinfo", value);
          }
          else
          {
            v6 = xpc_copy_description(value);
            v7 = qword_100024F80;
            if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v26 = (size_t)v6;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
            }
            free(v6);
          }
          ++v4;
        }
        while (xpc_array_get_count(v2) > v4);
      }
      v8 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
      {
        count = xpc_array_get_count(v2);
        v10 = "os_log";
        if (a1)
          v10 = "Core Analytics";
        *(_DWORD *)buf = 134218242;
        v26 = count;
        v27 = 2080;
        v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Send %zu zones to %s", buf, 0x16u);
      }
      xpc_release(v2);
      if (!v3)
        goto LABEL_35;
LABEL_21:
      if (xpc_array_get_count(v3))
      {
        v11 = 0;
        do
        {
          v12 = xpc_array_get_value(v3, v11);
          if (a1)
          {
            analytics_send_event("com.apple.memorytools.stats.vmkerninfo", v12);
          }
          else
          {
            v13 = xpc_copy_description(v12);
            v14 = qword_100024F80;
            if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v26 = (size_t)v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
            }
            free(v13);
          }
          ++v11;
        }
        while (xpc_array_get_count(v3) > v11);
      }
      v15 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
      {
        v16 = xpc_array_get_count(v3);
        v17 = "os_log";
        if (a1)
          v17 = "Core Analytics";
        *(_DWORD *)buf = 134218242;
        v26 = v16;
        v27 = 2080;
        v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Send %zu vm regions to %s", buf, 0x16u);
      }
      xpc_release(v3);
      goto LABEL_37;
    }
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    {
      sub_1000185C0();
      if (v3)
        goto LABEL_21;
    }
    else if (v3)
    {
      goto LABEL_21;
    }
LABEL_35:
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018594();
LABEL_37:
    v18[0] = v21;
    v18[1] = v22;
    v18[2] = v23;
    v18[3] = v24;
    sub_100003294((uint64_t)v18);
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    sub_100018568();
}

uint64_t sub_100005FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;
  uint8_t buf[4];
  int v9;

  v3 = *(_DWORD *)(a3 + 20);
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to log error, message not from kernel: audit_pid %d", buf, 8u);
    }
    return 5;
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    v6[0] = *(_OWORD *)a2;
    v6[1] = v5;
    v7 = *(_QWORD *)(a2 + 32);
    return sub_100013C44((uint64_t)v6, 0);
  }
}

uint64_t sub_1000060B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  if (*(_DWORD *)(a3 + 20))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000185EC();
    return 5;
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 16);
    v5[0] = *(_OWORD *)a2;
    v5[1] = v4;
    v6 = *(_QWORD *)(a2 + 32);
    return sub_100014DB4((int *)v5);
  }
}

void *sub_100006120()
{
  unsigned __int8 v0;

  v0 = atomic_load((unsigned __int8 *)&qword_100024E88);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_100024E88))
  {
    sub_100012F74((uint64_t)&unk_100024200);
    __cxa_atexit((void (*)(void *))sub_100013694, &unk_100024200, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100024E88);
  }
  return &unk_100024200;
}

void sub_100006198(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_100024E88);
  _Unwind_Resume(a1);
}

uint64_t sub_1000061B0()
{
  uint64_t v0;
  NSObject *v1;
  _QWORD handler[4];
  mach_port_t v4;
  uint8_t buf[12];
  mach_port_t sp;

  sp = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initialiazing EccDatabase...", buf, 2u);
  }
  sub_10001326C(qword_100024F58);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initializing Memory Error MIG server...", buf, 2u);
  }
  task_get_special_port(mach_task_self_, 4, &bootstrap_port);
  v0 = bootstrap_check_in(bootstrap_port, "com.apple.mmaintenanced.server", &sp);
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, sp, 0, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100006300;
  handler[3] = &unk_100020AE0;
  v4 = sp;
  dispatch_source_set_event_handler(v1, handler);
  dispatch_activate(v1);
  return v0;
}

void sub_100006300(uint64_t a1)
{
  mach_msg_return_t v1;

  v1 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_1000151E8, 0x1000u, *(_DWORD *)(a1 + 32), 50331648);
  if (v1)
    sub_100018654(v1);
}

uint64_t sub_100006334()
{
  uint64_t result;
  size_t v1;
  _OWORD v2[3];

  memset(v2, 0, sizeof(v2));
  v1 = 48;
  result = sysctlbyname("kern.osreleasetype", v2, &v1, 0, 0);
  if (!(_DWORD)result && !(*(_QWORD *)&v2[0] ^ 0x6C616E7265746E49 | BYTE8(v2[0])))
    byte_100024F88 = 1;
  return result;
}

void start(int a1)
{
  unsigned __int8 v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;

  v9 = 0;
  vproc_swap_integer(0, 5, 0, &v9);
  if (!v9 || a1 != 1)
    exit(1);
  qword_100024F80 = (uint64_t)os_log_create("com.apple.mmaintenanced", "Memory Maintenance Daemon");
  sub_100006334();
  if (!mkdir("/private/var/mobile/Library/MemoryMaintenance", 0x1F4u) || *__error() == 17)
  {
    v2 = atomic_load((unsigned __int8 *)&qword_100024F28);
    if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_100024F28))
    {
      qword_100024F20 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
      __cxa_guard_release(&qword_100024F28);
    }
    dispatch_source_set_event_handler((dispatch_source_t)qword_100024F20, &stru_100020B20);
    dispatch_activate((dispatch_object_t)qword_100024F20);
    if ((sub_1000079FC() & 1) == 0)
    {
      v3 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unable to read jetsam properties", buf, 2u);
      }
    }
    sub_100006694();
    sub_100004978();
    xpc_activity_register("com.apple.memory-maintenance.system-hwm", XPC_ACTIVITY_CHECK_IN, &stru_100020B60);
    xpc_activity_register("com.apple.memory-maintenance.ane-abandonment-check", XPC_ACTIVITY_CHECK_IN, &stru_100020BA0);
    xpc_activity_register("com.apple.memory-maintenance.compress", XPC_ACTIVITY_CHECK_IN, &stru_100020BE0);
    xpc_activity_register("com.apple.memory-maintenance.KRExperimentsInit", XPC_ACTIVITY_CHECK_IN, &stru_100020C20);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100020C60);
    xpc_activity_register("com.apple.memory-maintenance.report-mach-memory-info", XPC_ACTIVITY_CHECK_IN, &stru_100020CA0);
    xpc_activity_unregister("com.apple.memory-maintenance.userspace_reboot");
    sub_1000071BC();
    sub_1000061B0();
    xpc_activity_register("com.apple.memory-maintenance.report-ecc-status", XPC_ACTIVITY_CHECK_IN, &stru_100020CE0);
    dispatch_main();
  }
  v4 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    goto LABEL_13;
  while (1)
  {
    v5 = _os_assert_log(0);
    _os_crash(v5);
    __break(1u);
LABEL_13:
    v6 = __error();
    v7 = strerror(*v6);
    v8 = *__error();
    *(_DWORD *)buf = 136315394;
    v11 = v7;
    v12 = 1024;
    v13 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to create data directory: %s %d", buf, 0x12u);
  }
}

void sub_100006684(id a1)
{
  exit(0);
}

void sub_100006694()
{
  FILE *v0;
  FILE *v1;
  std::string v2;
  uint64_t v3;
  stat v4;

  if (access("/var/mobile/Library/Logs/khwm.log", 6) != -1)
  {
    stat("/var/mobile/Library/Logs/khwm.log", &v4);
    v3 = 0;
    v0 = fopen("/var/mobile/Library/Logs/khwm.log", "r");
    if (v0)
    {
      v1 = v0;
      fscanf(v0, "Wired Memory Pages: %llu", &v3);
      util::stringprintf((util *)"Kernel memory has exceeded its limits.\n", &v2);
      fseek(v1, 0, 2);
      ftell(v1);
      rewind(v1);
      operator new[]();
    }
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_1000186B0();
  }
}

void sub_100006980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1000069A0(id a1, _xpc_activity_s *a2)
{
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  if (xpc_activity_get_state(a2) == 2)
  {
    v3 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launched system high water mark activity", buf, 2u);
    }
    sub_100006694();
    sub_100004978();
    sub_1000149B0();
    v4 = sub_100003C08();
    if (v4)
    {
      v5 = v4;
      sub_100005744((uint64_t)v4);
      sub_1000044C8((uint64_t)v5);
      if (xpc_activity_should_defer(a2))
      {
        v6 = qword_100024F80;
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "XPC told us to defer. Deferring", v9, 2u);
        }
        if (!xpc_activity_set_state(a2, 3) && os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          sub_100018824();
      }
      else if ((sub_10000501C((uint64_t)v5) & 1) == 0)
      {
        sub_10000541C();
        v7 = qword_100024F80;
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "System high water mark activity did not do anything", v8, 2u);
        }
        free(v5);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    {
      sub_1000187F8();
    }
  }
}

void sub_100006B34(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
    sub_1000149B0();
}

void sub_100006B5C(id a1, _xpc_activity_s *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (xpc_activity_get_state(a2) == 2)
  {
    if (qword_100024F30 != -1)
      dispatch_once(&qword_100024F30, &stru_100020D20);
    if (byte_100024F38)
    {
      v2 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refusing to run compressor sweep from compress XPC activity on swap-capable device", v3, 2u);
      }
      xpc_activity_unregister("com.apple.memory-maintenance.compress");
    }
    else
    {
      sub_10000587C();
    }
  }
}

void sub_100006C20(id a1, _xpc_activity_s *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (xpc_activity_get_state(a2) == 2)
  {
    v2 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking if device should be enrolled in experiments", v3, 2u);
    }
    KRExperimentsInit();
  }
}

void sub_100006C98(id a1, void *a2)
{
  const char *string;
  NSObject *v3;
  NSObject *v4;
  xpc_object_t v5;
  uint8_t v6[16];
  uint8_t buf[16];

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.trial.NamespaceUpdate.FREEZER_POLICIES"))
  {
    v3 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device experiment state has been updated", buf, 2u);
    }
    if ((KRExperimentsHandleUpdate(0) & 1) == 0)
    {
      v4 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "New experiment state can not be applied. Scheduling deferred application.", v6, 2u);
      }
      v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
      xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
      xpc_dictionary_set_int64(v5, XPC_ACTIVITY_DELAY, 0);
      xpc_dictionary_set_int64(v5, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_activity_register("com.apple.memory-maintenance.KRExperimentsDestructiveUpdate", v5, &stru_100020D60);
      xpc_release(v5);
    }
  }
}

void sub_100006E38(id a1, _xpc_activity_s *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (xpc_activity_get_state(a2) == 2)
  {
    if ((analytics_is_event_used("com.apple.memorytools.stats.zoneinfo") & 1) != 0
      || analytics_is_event_used("com.apple.memorytools.stats.vmkerninfo"))
    {
      sub_100005C20(1);
    }
    else
    {
      v2 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "memorytools.stats events disabled, skipping analytics", v3, 2u);
      }
    }
  }
}

void sub_100006EE0(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (analytics_is_event_used("com.apple.ecc_error"))
      sub_100013F58(0);
  }
}

void sub_100006F1C(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      sub_100006FD0();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_100007058(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t sub_100006FB0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unsigned int v5;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 88);
  v4 = v2 >= v3;
  if (v2 <= v3)
    v5 = 0;
  else
    v5 = -1;
  if (v4)
    return v5;
  else
    return 1;
}

void sub_100006FD0()
{
  sub_100006FE4("vector");
}

void sub_100006FE4(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100007034(exception, a1);
}

void sub_100007020(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100007034(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100007058(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_10000708C();
  return operator new(4 * a2);
}

void sub_10000708C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_1000070B4(id a1)
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  sysctlbyname("kern.memorystatus_swap_all_apps", &v2, &v1, 0, 0);
  byte_100024F38 = v2 != 0;
}

void sub_100007108(id a1, _xpc_activity_s *a2)
{
  KRExperimentsHandleUpdate(1);
}

void sub_100007110(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000712C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100007138(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

char *sub_100007148(int *a1)
{
  return strerror(*a1);
}

int *sub_100007150()
{
  return __error();
}

void sub_100007158(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void *sub_1000071A0()
{
  void *result;

  result = sub_100006120();
  qword_100024F58 = (uint64_t)result;
  return result;
}

void sub_1000071BC()
{
  _xpc_connection_s *mach_service;

  mach_service = xpc_connection_create_mach_service("com.apple.mmaintenanced", 0, 1uLL);
  qword_100024F40 = (uint64_t)mach_service;
  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018850();
    exit(1);
  }
  xpc_connection_set_event_handler(mach_service, &stru_100020DA0);
  xpc_connection_resume((xpc_connection_t)qword_100024F40);
}

void sub_100007230(id a1, void *a2)
{
  xpc_type_t type;
  _BOOL4 v4;
  _QWORD handler[5];

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100007378;
    handler[3] = &unk_100020DC0;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (a2 == &_xpc_error_connection_invalid)
      {
        if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          sub_10001887C();
      }
      else
      {
        v4 = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
        if (a2 == &_xpc_error_termination_imminent)
        {
          if (v4)
            sub_100018900();
        }
        else if (v4)
        {
          sub_100018984(a2);
        }
      }
      exit(1);
    }
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018A00();
  }
}

void *sub_100007378(int a1, xpc_object_t object)
{
  void *result;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  _QWORD *v11;
  char v12;
  _QWORD *v13;
  void *v14;
  _xpc_connection_s *v15;
  _BOOL4 v16;
  void **p_original;
  _xpc_connection_s *v18;
  _xpc_connection_s *v19;
  char v20;
  char v21;
  _xpc_connection_s *remote_connection;
  xpc_object_t original;
  xpc_object_t xdict;
  xpc_object_t message[2];
  char v26;

  result = xpc_get_type(object);
  if (result != &_xpc_type_error)
  {
    result = (void *)xpc_dictionary_get_uint64(object, "cmd");
    switch((unint64_t)result)
    {
      case 1uLL:
        xdict = object;
        if (object)
          xpc_retain(object);
        message[0] = xpc_dictionary_create_reply(object);
        if (!message[0])
          goto LABEL_60;
        goto LABEL_39;
      case 2uLL:
        xdict = object;
        if (object)
          xpc_retain(object);
        message[0] = xpc_dictionary_create_reply(object);
        if (message[0])
        {
          v4 = sub_100003C08();
          v5 = v4;
          if (v4)
          {
            v6 = sub_1000040CC((uint64_t)v4);
            xpc_dictionary_set_uint64(message[0], "UserReclaimableCurrent", v6);
            free(v5);
          }
          else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          {
            sub_100018A58();
          }
          xpc_dictionary_set_uint64(message[0], "UserReclaimableLimit", qword_100024F60);
          LODWORD(original) = 0;
          if (sub_100008450(&original)
            && os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          {
            sub_100018A2C();
          }
          xpc_dictionary_set_uint64(message[0], "KernelHWMCurrent", original);
          xpc_dictionary_set_uint64(message[0], "KernelHWMLimit", qword_100024F68);
          v20 = sub_1000046FC();
          xpc_dictionary_set_BOOL(message[0], "IsEligibleForReboot", v20);
          v21 = sub_100004658();
          xpc_dictionary_set_BOOL(message[0], "IsStressRack", v21);
          remote_connection = xpc_dictionary_get_remote_connection(xdict);
          xpc_connection_send_message(remote_connection, message[0]);
        }
        goto LABEL_60;
      case 3uLL:
        xdict = object;
        if (object)
          xpc_retain(object);
        message[0] = xpc_dictionary_create_reply(object);
        if (message[0])
        {
          v7 = xpc_dictionary_get_remote_connection(xdict);
          xpc_connection_send_message(v7, message[0]);
          xpc_connection_send_barrier(v7, &stru_100020E00);
        }
        goto LABEL_60;
      case 4uLL:
        xdict = object;
        if (object)
          xpc_retain(object);
        v8 = sub_100003C08();
        v9 = v8;
        if (v8)
        {
          v10 = sub_10000501C((uint64_t)v8);
          free(v9);
        }
        else
        {
          v10 = 0;
        }
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0])
        {
          v18 = xpc_dictionary_get_remote_connection(xdict);
          xpc_dictionary_set_BOOL(message[0], "DeviceWillReboot", v10);
          xpc_connection_send_message(v18, message[0]);
        }
        goto LABEL_60;
      case 5uLL:
        original = object;
        if (object)
          xpc_retain(object);
        v11 = sub_100003C08();
        if (v11)
        {
          sub_100007924(message, "memory_maintenance triggered reboot");
          v12 = sub_100004B84((uint64_t *)message, (uint64_t)v11, 0, 0);
          if (v26 < 0)
            operator delete(message[0]);
          free(v11);
        }
        else
        {
          v12 = 0;
        }
        xdict = xpc_dictionary_create_reply(original);
        if (xdict)
        {
          v19 = xpc_dictionary_get_remote_connection(original);
          xpc_dictionary_set_BOOL(xdict, "DeviceWillReboot", v12);
          xpc_connection_send_message(v19, xdict);
        }
        sub_100007888(&xdict);
        p_original = &original;
        goto LABEL_61;
      case 6uLL:
        xdict = object;
        if (object)
          xpc_retain(object);
        sub_10000541C();
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0])
          goto LABEL_39;
        goto LABEL_60;
      case 7uLL:
        xdict = object;
        if (object)
          xpc_retain(object);
        sub_10000587C();
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0])
          goto LABEL_39;
        goto LABEL_60;
      case 8uLL:
        xdict = object;
        if (object)
          xpc_retain(object);
        v13 = sub_100003C08();
        v14 = v13;
        if (v13)
        {
          sub_1000044C8((uint64_t)v13);
          free(v14);
        }
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0])
        {
LABEL_39:
          v15 = xpc_dictionary_get_remote_connection(xdict);
          xpc_connection_send_message(v15, message[0]);
        }
LABEL_60:
        sub_100007888(message);
        p_original = &xdict;
        goto LABEL_61;
      case 9uLL:
        message[0] = object;
        if (object)
          xpc_retain(object);
        v16 = xpc_dictionary_get_BOOL(object, "ca_enabled");
        sub_100005C20(v16);
        goto LABEL_46;
      case 0xAuLL:
        message[0] = object;
        if (object)
          xpc_retain(object);
        sub_1000149B0();
LABEL_46:
        p_original = message;
LABEL_61:
        result = sub_100007888(p_original);
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_1000077E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, void *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  sub_100007888(&__p);
  sub_100007888(&a12);
  _Unwind_Resume(a1);
}

void **sub_100007888(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
    xpc_release(v2);
  return a1;
}

void sub_1000078B8(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1000078C8(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "shutting down at user request", v2, 2u);
  }
  exit(0);
}

_QWORD *sub_100007924(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000079D4();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1000079D4()
{
  sub_100006FE4("basic_string");
}

void sub_1000079E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1000079FC()
{
  void **v0;
  const char *v1;
  void **v2;
  uint64_t v3;
  void *v4;
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  void *v13;
  xpc_object_t v14;
  xpc_object_t xdict;
  void *v16[2];
  uint64_t v17;
  xpc_object_t object[2];
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  size_t v22;
  _QWORD v23[4];

  if (access("/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist", 0))
  {
    LOBYTE(v23[0]) = 0;
    v22 = 32;
    if (sysctlbyname("hw.targettype", v23, &v22, 0, 0))
    {
      sub_100007924(v16, "");
    }
    else
    {
      util::stringprintf((util *)"%s.%s.plist", __p, "/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (v21 >= 0)
        v0 = __p;
      else
        v0 = (void **)__p[0];
      if (!access((const char *)v0, 0))
        goto LABEL_17;
      util::stringprintf((util *)"%s.%s.plist", object, "/System/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (SHIBYTE(v21) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = *(_OWORD *)object;
      v21 = v19;
      v1 = v19 >= 0 ? (const char *)__p : (const char *)object[0];
      if (access(v1, 0))
      {
        sub_100007924(v16, "");
        if (SHIBYTE(v21) < 0)
          operator delete(__p[0]);
      }
      else
      {
LABEL_17:
        *(_OWORD *)v16 = *(_OWORD *)__p;
        v17 = v21;
      }
    }
  }
  else
  {
    sub_100007924(v16, "/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist");
  }
  if (v17 >= 0)
    v2 = v16;
  else
    v2 = (void **)v16[0];
  util::MappedFile::MappedFile((util::MappedFile *)v23, (const char *)v2);
  if (!v23[1] || v23[0])
  {
    v4 = (void *)xpc_create_from_plist(v23[0]);
    __p[0] = v4;
    if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      value = xpc_dictionary_get_value(__p[0], "Version4");
      v22 = (size_t)value;
      if (value)
      {
        xpc_retain(value);
        v6 = (void *)v22;
      }
      else
      {
        v6 = 0;
      }
      object[0] = v6;
      v22 = 0;
      sub_100007888((void **)&v22);
      if (object[0] && xpc_get_type(object[0]) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v7 = xpc_dictionary_get_value(object[0], "System");
        xdict = v7;
        if (v7)
        {
          xpc_retain(v7);
          v8 = xdict;
        }
        else
        {
          v8 = 0;
        }
        v22 = (size_t)v8;
        xdict = 0;
        sub_100007888(&xdict);
        if (v22 && xpc_get_type((xpc_object_t)v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          v9 = xpc_dictionary_get_value((xpc_object_t)v22, "Override");
          v14 = v9;
          if (v9)
          {
            xpc_retain(v9);
            v10 = v14;
          }
          else
          {
            v10 = 0;
          }
          v14 = 0;
          xdict = v10;
          sub_100007888(&v14);
          if (xdict && xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
          {
            v11 = xpc_dictionary_get_value(xdict, "Global");
            v3 = (uint64_t)v11;
            v13 = v11;
            if (v11)
            {
              xpc_retain(v11);
              v13 = 0;
              v14 = (xpc_object_t)v3;
              sub_100007888(&v13);
              if (xpc_get_type((xpc_object_t)v3) == (xpc_type_t)&_xpc_type_dictionary)
              {
                qword_100024F60 = xpc_dictionary_get_int64(v14, "UserReclaimableLimit");
                qword_100024F68 = xpc_dictionary_get_int64(v14, "KernelHighWaterMark");
                qword_100024F70 = xpc_dictionary_get_int64(v14, "DarkBootSystemUIHardLimit");
                v3 = 1;
              }
              else
              {
                v3 = 0;
              }
            }
            else
            {
              v13 = 0;
              v14 = 0;
              sub_100007888(&v13);
            }
            sub_100007888(&v14);
          }
          else
          {
            v3 = 0;
          }
          sub_100007888(&xdict);
        }
        else
        {
          v3 = 0;
        }
        sub_100007888((void **)&v22);
      }
      else
      {
        v3 = 0;
      }
      sub_100007888(object);
    }
    else
    {
      v3 = 0;
    }
    sub_100007888(__p);
  }
  else
  {
    v3 = 0;
  }
  util::MappedFile::~MappedFile((util::MappedFile *)v23);
  if (SHIBYTE(v17) < 0)
    operator delete(v16[0]);
  return v3;
}

void sub_100007DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;

  sub_100007888(&a13);
  sub_100007888(&a14);
  sub_100007888((void **)(v29 - 64));
  sub_100007888(&a21);
  sub_100007888((void **)&a24);
  util::MappedFile::~MappedFile((util::MappedFile *)(v29 - 56));
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

BOOL sub_100007E64()
{
  uint64_t v0;
  BOOL v1;
  std::string __p;
  unsigned __int8 v4;

  sub_1000080EC(&__p, "/private/var/mobile/Library/MemoryMaintenance/system_hwm");
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&__p, 0);
  v0 = v4;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v0)
    v1 = v0 == 255;
  else
    v1 = 1;
  return !v1;
}

void sub_100007ECC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_100007EE8(uint64_t a1, std::error_code *a2)
{
  return !remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/system_hwm", a2);
}

FILE *sub_100007F0C@<X0>(_OWORD *a1@<X8>)
{
  FILE *result;
  FILE *v3;
  int v4;
  int v5;
  char v6[256];

  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "r");
  if (result)
  {
    v3 = result;
    fgets(v6, 256, result);
    v4 = sscanf(v6, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", a1, (char *)a1 + 8, a1 + 1, (char *)a1 + 24, a1 + 2, (char *)a1 + 40);
    v5 = ferror(v3);
    if (v4 != 6 || v5)
    {
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
    return (FILE *)fclose(v3);
  }
  return result;
}

FILE *sub_100007FF8(_QWORD *a1)
{
  FILE *result;
  FILE *v3;
  int v4;

  result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "w");
  if (result)
  {
    v3 = result;
    fprintf(result, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
    v4 = ferror(v3);
    fclose(v3);
    if (v4)
    {
      return 0;
    }
    else
    {
      sync();
      return (FILE *)1;
    }
  }
  return result;
}

FILE *sub_10000807C(unsigned int a1, uint64_t a2, uint64_t a3)
{
  _QWORD v7[6];

  if (sub_100007E64() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100018A84();
  v7[0] = a1;
  v7[1] = a2;
  v7[2] = a3;
  memset(&v7[3], 0, 24);
  return sub_100007FF8(v7);
}

std::string *sub_1000080EC(std::string *this, char *a2)
{
  char *v3;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = a2 - 1;
  while (*++v3)
    ;
  sub_100008144(this, a2, v3);
  return this;
}

void sub_100008128(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

std::string *sub_100008144(std::string *this, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  _BYTE *i;
  char v16;
  std::string::size_type v17;
  void *__p[2];
  unsigned __int8 v20;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v14 = this;
    if ((v6 & 0x80) != 0)
      v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    for (i = (char *)v14 + size; v4 != a3; ++i)
    {
      v16 = *v4++;
      *i = v16;
    }
    *i = 0;
    v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v17;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
  }
  else
  {
    sub_1000082B8(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    if ((v20 & 0x80u) == 0)
      v13 = v20;
    else
      v13 = (std::string::size_type)__p[1];
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0)
      operator delete(__p[0]);
  }
  return this;
}

void sub_10000829C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1000082B8(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000079D4();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

uint64_t sub_10000835C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  const char *i;
  size_t v6;
  int v7;
  int v8;
  int v9;
  void *__p[2];
  _BYTE v12[25];
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  char v19;
  uint64_t v20;

  if (!a2)
    return 0;
  v4 = a2;
  for (i = (const char *)(a1 + 96); ; i += 176)
  {
    v6 = strlen(i);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    *(_OWORD *)__p = 0u;
    memset(v12, 0, sizeof(v12));
    v7 = sub_100008970(a3, (uint64_t)i, (uint64_t)&i[v6], (uint64_t)__p, 4160);
    v8 = v18;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v9 = v8 ? 0 : v7;
    if (v9 == 1)
      break;
    if (!--v4)
      return 0;
  }
  return *((_QWORD *)i - 10);
}

void sub_100008434(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008450(void *a1)
{
  mach_port_t v2;
  std::locale v4;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt;
  mach_zone_info_array_t info;
  mach_msg_type_number_t namesCnt;
  mach_zone_name_array_t names;
  size_t v11;

  v11 = 4;
  if (sysctlbyname("kern.memorystatus_level", a1, &v11, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018BA4();
    return 1;
  }
  else
  {
    names = 0;
    namesCnt = 0;
    info = 0;
    infoCnt = 0;
    memory_info = 0;
    memory_infoCnt = 0;
    v2 = mach_host_self();
    if (!mach_memory_info(v2, &names, &namesCnt, &info, &infoCnt, &memory_info, &memory_infoCnt))
      sub_10000B70C(&v4, "com.apple.driver.AppleH[0-9]+CameraInterface.NonPersistent", 0);
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018B78();
    return 0;
  }
}

void sub_1000088E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_100008918((uint64_t)&a16);
  std::locale::~locale(&a11);
  _Unwind_Resume(a1);
}

uint64_t sub_100008918(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t sub_100008970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  sub_100008B48(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_100008BB8(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
      v10 = (uint64_t *)(a4 + 24);
    else
      v10 = *(uint64_t **)a4;
LABEL_8:
    v11 = *v10;
    *(_QWORD *)(a4 + 56) = *v10;
    *(_BYTE *)(a4 + 64) = *(_QWORD *)(a4 + 48) != v11;
    v12 = v10[1];
    *(_QWORD *)(a4 + 72) = v12;
    *(_BYTE *)(a4 + 88) = v12 != *(_QWORD *)(a4 + 80);
    return 1;
  }
  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    v14 = v9 | 0x80;
    v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_100008BD8((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
        v16 = sub_100008BB8(a1, v15, a3, (uint64_t *)a4, v14, 0);
        v18 = *(_QWORD *)a4;
        v17 = *(_QWORD *)(a4 + 8);
        if (v16)
          break;
        sub_100008BD8((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (__int128 *)(a4 + 24));
        if (++v15 == a3)
          goto LABEL_14;
      }
      if (v17 == v18)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
LABEL_14:
    sub_100008BD8((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
    if (sub_100008BB8(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
  }
  result = 0;
  *(_QWORD *)(a4 + 8) = *(_QWORD *)a4;
  return result;
}

char *sub_100008B48(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  _OWORD *v8;
  char *result;

  *(_QWORD *)(a1 + 24) = a4;
  v8 = (_OWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 32) = a4;
  *(_BYTE *)(a1 + 40) = 0;
  result = sub_100008BD8((char **)a1, a2, (__int128 *)(a1 + 24));
  *(_QWORD *)(a1 + 48) = a3;
  *(_QWORD *)(a1 + 56) = a3;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a1 + 40);
  if ((a5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = a3;
  *(_BYTE *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_100008BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return sub_100008D4C(a1, a2, a3, a4, a5, a6);
  if (*(_DWORD *)(a1 + 28))
    return sub_100009654(a1, a2, a3, a4, a5, a6);
  return sub_100009134(a1, a2, a3, a4, a5, a6);
}

char *sub_100008BD8(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  char *result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    v15 = a1[1];
    v16 = (v15 - result) / 24;
    if (v16 >= a2)
      v17 = a2;
    else
      v17 = (v15 - result) / 24;
    if (v17)
    {
      v18 = result;
      do
      {
        *(_OWORD *)v18 = *a3;
        v18[16] = *((_BYTE *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      v19 = &v15[24 * (a2 - v16)];
      v20 = 24 * a2 - 24 * v16;
      do
      {
        v21 = *a3;
        *((_QWORD *)v15 + 2) = *((_QWORD *)a3 + 2);
        *(_OWORD *)v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL)
      sub_100006FD0();
    v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= a2)
      v9 = a2;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    result = sub_10000A374(a1, v10);
    v11 = a1[1];
    v12 = &v11[24 * a2];
    v13 = 24 * a2;
    do
    {
      v14 = *a3;
      *((_QWORD *)v11 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

uint64_t sub_100008D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v12;
  signed int v13;
  _OWORD *v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t *v36;
  uint64_t v37;
  _BYTE v39[56];
  void *__p[2];
  _QWORD v41[4];
  __int128 v42;
  char v43;
  _OWORD *v44;
  _OWORD *v45;
  unint64_t v46;

  v44 = 0;
  v45 = 0;
  v46 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v42 = a3;
    *((_QWORD *)&v42 + 1) = a3;
    v43 = 0;
    *(_DWORD *)v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v41, 0, 21);
    v45 = (_OWORD *)sub_100009CE0((uint64_t *)&v44, (uint64_t)v39);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v39[32])
    {
      *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
      operator delete(*(void **)&v39[32]);
    }
    v36 = a4;
    v12 = v45;
    *((_DWORD *)v45 - 24) = 0;
    *((_QWORD *)v12 - 11) = a2;
    *((_QWORD *)v12 - 10) = a2;
    *((_QWORD *)v12 - 9) = a3;
    sub_100009BDC((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v42);
    sub_100009C18((uint64_t)v45 - 40, *(unsigned int *)(a1 + 32));
    v37 = a3;
    v13 = a3 - a2;
    v14 = v45;
    *((_QWORD *)v45 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) == 0 && (int)(v15 >> 12) >= v13)
        sub_100009C48();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37)
            goto LABEL_16;
          v27 = *v36;
          *(_QWORD *)v27 = a2;
          *(_QWORD *)(v27 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          v28 = *((_QWORD *)v14 - 8);
          v29 = *((_QWORD *)v14 - 7) - v28;
          if (v29)
          {
            v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            v32 = 1;
            do
            {
              v33 = v27 + 24 * v32;
              *(_OWORD *)v33 = *((_OWORD *)v31 - 1);
              v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }
            while (v30 > v32++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v20 = v45 - 6;
          sub_100009F70((_QWORD *)v45 - 12);
          v45 = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v39 = *v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          sub_10000A2F8(&v39[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v41[0] = 0;
          sub_10000A3C4((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = *v17;
          *(_QWORD *)((char *)&v41[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v41[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v41[1] + 24))(v41[1], 0, v39);
          v23 = v45;
          if ((unint64_t)v45 >= v46)
          {
            v45 = (_OWORD *)sub_100009CE0((uint64_t *)&v44, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v39[16];
            *v45 = *(_OWORD *)v39;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v39[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v39[48];
            memset(&v39[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v41[0];
            __p[0] = 0;
            __p[1] = 0;
            v41[0] = 0;
            v25 = v41[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v41[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v45 = v23 + 6;
          }
          if (*(_QWORD *)&v39[32])
          {
            *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }
LABEL_23:
          v14 = v45;
          ++v15;
          if (v44 != v45)
            continue;
          v6 = 0;
          break;
        default:
          sub_100009C94();
      }
      break;
    }
  }
  *(_QWORD *)v39 = &v44;
  sub_10000A474((void ***)v39);
  return v6;
}

void sub_1000090DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  sub_100009B9C(&a13);
  a13 = v18 - 112;
  sub_10000A474((void ***)&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_100009134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  _BYTE v57[40];
  __int128 v58;
  void *__p[2];
  _QWORD v60[3];
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)v57 = 0;
    memset(&v57[8], 0, 32);
    v58 = 0uLL;
    *(_OWORD *)__p = 0uLL;
    memset(v60, 0, 21);
    sub_10000A4E4(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v51 = a4;
    if (*(_QWORD *)&v57[32])
    {
      *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    v12 = *((_QWORD *)&v61 + 1);
    v13 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v14 = v13 / 0x2A;
    v15 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v13 / 0x2A));
    v16 = 3 * (v13 % 0x2A);
    v17 = v15 + 32 * v16;
    *(_DWORD *)v17 = 0;
    *(_QWORD *)(v17 + 8) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_100009C18(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    v55 = 0;
    v18 = 0;
    v53 = 0;
    v54 = a2;
    v19 = *((_QWORD *)&v63 + 1);
    v20 = *((_QWORD *)&v61 + 1);
    v21 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v22 = v21 / 0x2A;
    v23 = 3 * (v21 % 0x2A);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v22) + 32 * v23 + 80) = v6;
    v24 = *(_QWORD *)(v20 + 8 * v22) + 32 * v23;
    v25 = a3 - a2;
    *(_DWORD *)(v24 + 88) = a5;
    *(_BYTE *)(v24 + 92) = a6;
    v52 = a3;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v25)
        sub_100009C48();
      v27 = v19 + v63 - 1;
      v28 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v27 / 0x2A));
      v29 = v27 % 0x2A;
      v30 = v28 + 96 * (v27 % 0x2A);
      v32 = (_QWORD *)(v30 + 80);
      v31 = *(_QWORD *)(v30 + 80);
      if (v31)
        (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v31 + 16))(v31, v28 + 96 * v29);
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          v33 = *(_QWORD *)(v28 + 96 * v29 + 16);
          v35 = (a5 & 0x1000) == 0 || v33 == v52;
          v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35)
            goto LABEL_37;
          v37 = v33 - *(_QWORD *)(v28 + 96 * v29 + 8);
          v38 = v53;
          if ((v55 & (v53 >= v37)) == 0)
            v38 = v37;
          if (v38 != v25)
          {
            v53 = v38;
            sub_10000A5E4(&v61);
            v55 = 1;
            goto LABEL_38;
          }
          v39 = (void **)*((_QWORD *)&v61 + 1);
          v40 = v62;
          if ((_QWORD)v62 == *((_QWORD *)&v61 + 1))
          {
            v40 = *((_QWORD *)&v61 + 1);
          }
          else
          {
            v41 = (_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            v42 = (_QWORD *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            v43 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) % 0x2AuLL);
            if (v42 != (_QWORD *)v43)
            {
              do
              {
                sub_100009F70(v42);
                v42 += 12;
                if ((_QWORD *)((char *)v42 - *v41) == (_QWORD *)4032)
                {
                  v44 = (_QWORD *)v41[1];
                  ++v41;
                  v42 = v44;
                }
              }
              while (v42 != (_QWORD *)v43);
              v39 = (void **)*((_QWORD *)&v61 + 1);
              v40 = v62;
            }
          }
          *((_QWORD *)&v63 + 1) = 0;
          v47 = v40 - (_QWORD)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              v39 = (void **)(*((_QWORD *)&v61 + 1) + 8);
              *((_QWORD *)&v61 + 1) = v39;
              v47 = v62 - (_QWORD)v39;
            }
            while ((_QWORD)v62 - (_QWORD)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2)
              goto LABEL_53;
            v48 = 42;
          }
          *(_QWORD *)&v63 = v48;
LABEL_53:
          v55 = 1;
          v53 = v25;
LABEL_38:
          v19 = *((_QWORD *)&v63 + 1);
          if (*((_QWORD *)&v63 + 1))
            continue;
          if ((v55 & 1) != 0)
          {
            v49 = *v51;
            *(_QWORD *)v49 = v54;
            *(_QWORD *)(v49 + 8) = v54 + v53;
            v6 = 1;
            *(_BYTE *)(v49 + 16) = 1;
          }
          else
          {
            v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_10000A658((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_10000A5E4(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          v58 = 0uLL;
          *(_QWORD *)&v57[32] = 0;
          sub_10000A2F8(&v57[32], *(__int128 **)(v28 + 96 * v29 + 32), *(__int128 **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 40) - *(_QWORD *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          sub_10000A3C4((char *)__p, *(__int128 **)(v28 + 96 * v29 + 56), *(__int128 **)(v28 + 96 * v29 + 64), (uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 64) - *(_QWORD *)(v28 + 96 * v29 + 56)) >> 4);
          v46 = *v32;
          *(_QWORD *)((char *)&v60[1] + 5) = *(_QWORD *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v60[1] + 24))(v60[1], 0, v57);
          sub_10000A4E4(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(_QWORD *)&v57[32])
          {
            *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          sub_100009C94();
      }
      break;
    }
  }
  sub_10000B278(&v61);
  return v6;
}

void sub_100009604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  sub_10000B278(&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_100009654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  char v42;
  _BYTE v45[56];
  void *__p[2];
  _QWORD v47[4];
  __int128 v48;
  char v49;
  _BYTE v50[40];
  __int128 v51;
  void *v52[6];
  _OWORD *v53;
  _OWORD *v54;
  unint64_t v55;

  v53 = 0;
  v54 = 0;
  v55 = 0;
  *(_DWORD *)v50 = 0;
  memset(&v50[8], 0, 32);
  v51 = 0u;
  memset(v52, 0, 37);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v48 = a3;
    *((_QWORD *)&v48 + 1) = a3;
    v49 = 0;
    *(_DWORD *)v45 = 0;
    memset(&v45[8], 0, 48);
    *(_OWORD *)__p = 0uLL;
    memset(v47, 0, 21);
    v54 = (_OWORD *)sub_100009CE0((uint64_t *)&v53, (uint64_t)v45);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v45[32])
    {
      *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
      operator delete(*(void **)&v45[32]);
    }
    v11 = v54;
    *((_DWORD *)v54 - 24) = 0;
    *((_QWORD *)v11 - 11) = a2;
    *((_QWORD *)v11 - 10) = a2;
    *((_QWORD *)v11 - 9) = a3;
    sub_100009BDC((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v48);
    sub_100009C18((uint64_t)v54 - 40, *(unsigned int *)(a1 + 32));
    v40 = a3;
    v41 = 0;
    v42 = 0;
    v12 = 0;
    v13 = a3 - a2;
    v14 = v54;
    *((_QWORD *)v54 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    do
    {
      v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
      if (!v15)
        sub_100009C48();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v40)
            goto LABEL_19;
          v26 = v19 - *((_QWORD *)v14 - 11);
          v27 = v41;
          if ((v42 & (v41 >= v26)) == 0)
          {
            v28 = *(v14 - 5);
            *(_OWORD *)v50 = *(_OWORD *)v18;
            *(_OWORD *)&v50[16] = v28;
            if (v50 != v18)
            {
              sub_10000B40C(&v50[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
              sub_10000B5C0(v52, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
            }
            v29 = (void *)*v17;
            *(void **)((char *)&v52[3] + 5) = *(void **)((char *)v14 - 11);
            v52[3] = v29;
            v27 = v26;
          }
          v30 = v54;
          if (v27 == v13)
          {
            v31 = (uint64_t)v53;
            while (v30 != (_QWORD *)v31)
            {
              v30 -= 12;
              sub_100009F70(v30);
            }
            v54 = (_OWORD *)v31;
            v42 = 1;
            v41 = v13;
          }
          else
          {
            v41 = v27;
            v32 = v54 - 6;
            sub_100009F70((_QWORD *)v54 - 12);
            v54 = v32;
            v42 = 1;
          }
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          v20 = v54 - 6;
          sub_100009F70((_QWORD *)v54 - 12);
          v54 = v20;
          break;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v45 = *(_OWORD *)v18;
          *(_OWORD *)&v45[16] = v21;
          memset(&v45[32], 0, 24);
          sub_10000A2F8(&v45[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v47[0] = 0;
          sub_10000A3C4((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = (void *)*v17;
          *(_QWORD *)((char *)&v47[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v47[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v47[1] + 24))(v47[1], 0, v45);
          v23 = v54;
          if ((unint64_t)v54 >= v55)
          {
            v54 = (_OWORD *)sub_100009CE0((uint64_t *)&v53, (uint64_t)v45);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v45[16];
            *v54 = *(_OWORD *)v45;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v45[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v45[48];
            memset(&v45[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v47[0];
            __p[0] = 0;
            __p[1] = 0;
            v47[0] = 0;
            v25 = v47[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v47[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v54 = v23 + 6;
          }
          if (*(_QWORD *)&v45[32])
          {
            *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
            operator delete(*(void **)&v45[32]);
          }
          break;
        default:
          sub_100009C94();
      }
      v14 = v54;
    }
    while (v53 != v54);
    if ((v42 & 1) != 0)
    {
      v33 = *a4;
      *(_QWORD *)v33 = a2;
      *(_QWORD *)(v33 + 8) = a2 + v41;
      *(_BYTE *)(v33 + 16) = 1;
      if ((_QWORD)v51 != *(_QWORD *)&v50[32])
      {
        v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - *(_QWORD *)&v50[32]) >> 3);
        v35 = (_BYTE *)(*(_QWORD *)&v50[32] + 16);
        v36 = 1;
        do
        {
          v37 = v33 + 24 * v36;
          *(_OWORD *)v37 = *((_OWORD *)v35 - 1);
          v38 = *v35;
          v35 += 24;
          *(_BYTE *)(v37 + 16) = v38;
          v15 = v34 > v36++;
        }
        while (v15);
      }
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  if (*(_QWORD *)&v50[32])
  {
    *(_QWORD *)&v51 = *(_QWORD *)&v50[32];
    operator delete(*(void **)&v50[32]);
  }
  *(_QWORD *)v50 = &v53;
  sub_10000A474((void ***)v50);
  return v6;
}

void sub_100009B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  sub_100009B9C(&a19);
  sub_100009B9C(&a35);
  a35 = v35 - 120;
  sub_10000A474((void ***)&a35);
  _Unwind_Resume(a1);
}

_QWORD *sub_100009B9C(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_100009BDC(uint64_t a1, unint64_t a2, __int128 *a3)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v4 = a2 >= v3;
  v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_10000A000((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_100009C18(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    sub_10000A1B8((void **)a1, a2 - v2);
  }
}

void sub_100009C48()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_100009C80(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100009C94()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_100009CCC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100009CE0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    sub_100006FD0();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v16[4] = a1 + 2;
  if (v9)
    v10 = (char *)sub_100009EA0(v7, v9);
  else
    v10 = 0;
  v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = 0;
  *((_QWORD *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v11 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *((_QWORD *)v11 + 7) = 0;
  *((_QWORD *)v11 + 8) = 0;
  *((_QWORD *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v11 + 9) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v13 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v11 + 85) = *(_QWORD *)(a2 + 85);
  *((_QWORD *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_100009E2C(a1, v16);
  v14 = a1[1];
  sub_100009FB4((uint64_t)v16);
  return v14;
}

void sub_100009E18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100009FB4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100009E2C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009EE4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *sub_100009EA0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    sub_10000708C();
  return operator new(96 * a2);
}

__n128 sub_100009EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __n128 result;
  uint64_t v12;

  if (a3 != a5)
  {
    v7 = 0;
    do
    {
      v8 = a7 + v7;
      v9 = a3 + v7;
      v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 80) = v10;
      *(_QWORD *)(v8 - 56) = 0;
      *(_QWORD *)(v8 - 48) = 0;
      *(_QWORD *)(v8 - 64) = 0;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(_QWORD *)(v8 - 48) = *(_QWORD *)(a3 + v7 - 48);
      *(_QWORD *)(v9 - 64) = 0;
      *(_QWORD *)(v9 - 56) = 0;
      *(_QWORD *)(v9 - 48) = 0;
      *(_QWORD *)(v8 - 40) = 0;
      *(_QWORD *)(v8 - 32) = 0;
      *(_QWORD *)(v8 - 24) = 0;
      result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 40) = result;
      *(_QWORD *)(v8 - 24) = *(_QWORD *)(a3 + v7 - 24);
      *(_QWORD *)(v9 - 40) = 0;
      *(_QWORD *)(v9 - 32) = 0;
      *(_QWORD *)(v9 - 24) = 0;
      v12 = *(_QWORD *)(a3 + v7 - 16);
      *(_QWORD *)(v8 - 11) = *(_QWORD *)(a3 + v7 - 11);
      *(_QWORD *)(v8 - 16) = v12;
      v7 -= 96;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void sub_100009F70(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

uint64_t sub_100009FB4(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    sub_100009F70((_QWORD *)(i - 96));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10000A000(void **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (_BYTE *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      v15 = &v9[3 * a2];
      v16 = 24 * a2;
      do
      {
        v17 = *a3;
        v9[2] = *((_QWORD *)a3 + 2);
        *(_OWORD *)v9 = v17;
        v9 += 3;
        v16 -= 24;
      }
      while (v16);
      v9 = v15;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (_BYTE *)*a1) >> 3);
    v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_100006FD0();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)sub_10000A174(v6, v13);
    else
      v14 = 0;
    v18 = &v14[24 * v10];
    v19 = &v18[24 * a2];
    v20 = 24 * a2;
    v21 = v18;
    do
    {
      v22 = *a3;
      *((_QWORD *)v21 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v21 = v22;
      v21 += 24;
      v20 -= 24;
    }
    while (v20);
    v23 = &v14[24 * v13];
    v25 = (char *)*a1;
    v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        v26 = *(_OWORD *)(v24 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      v24 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24)
      operator delete(v24);
  }
}

void *sub_10000A174(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_10000708C();
  return operator new(24 * a2);
}

void sub_10000A1B8(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      sub_100006FD0();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)sub_10000A2C4(v4, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v10];
    v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    v16 = &v14[16 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void *sub_10000A2C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_10000708C();
  return operator new(16 * a2);
}

char *sub_10000A2F8(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_10000A374(result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_10000A358(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000A374(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_100006FD0();
  result = (char *)sub_10000A174((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

char *sub_10000A3C4(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_10000A434(result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_10000A418(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000A434(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    sub_100006FD0();
  result = (char *)sub_10000A2C4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_10000A474(void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_100009F70(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

__n128 sub_10000A4E4(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __n128 result;
  uint64_t v11;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_10000A748(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 0;
  *(_QWORD *)(v8 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v8 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_10000A5E4(_QWORD *a1)
{
  unint64_t v2;

  v2 = a1[5] + a1[4] - 1;
  sub_100009F70((_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  --a1[5];
  return sub_10000AEEC(a1, 1);
}

int64x2_t sub_10000A658(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  int64x2_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    sub_10000AF60((void **)a1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (_QWORD *)(v5 + 8 * (v4 / 0x2A));
  v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(_QWORD *)(a1 + 16) == v5)
    v7 = 0;
  if (v7 == *v6)
    v7 = *(v6 - 1) + 4032;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(_QWORD *)(v7 - 56) = 0;
  *(_QWORD *)(v7 - 48) = 0;
  *(_QWORD *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v7 - 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v7 - 40) = 0;
  *(_QWORD *)(v7 - 32) = 0;
  *(_QWORD *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(v7 - 24) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v7 - 11) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v7 - 16) = v9;
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_10001A890);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_10000A748(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_10000AEB8(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFC0uLL);
      sub_10000AA5C(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFC0uLL);
    sub_10000AB70((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_10000AEB8((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = sub_10000AEB8((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFC0uLL);
  sub_10000AC8C(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_10000ADA0((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_10000AA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_10000AA5C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)sub_10000AEB8(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

void sub_10000AB70(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)sub_10000AEB8(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void sub_10000AC8C(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)sub_10000AEB8(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void sub_10000ADA0(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)sub_10000AEB8(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void *sub_10000AEB8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_10000708C();
  return operator new(8 * a2);
}

uint64_t sub_10000AEEC(_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = 42 * ((v2 - v3) >> 3) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A)
    a2 = 1;
  if (v5 < 0x54)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void sub_10000AF60(void **a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *__p;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;

  v2 = a1[1];
  v3 = a1[2];
  v4 = (v3 - v2) >> 3;
  if (v3 == v2)
    v5 = 0;
  else
    v5 = 42 * v4 - 1;
  v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(_QWORD)a1[5]] < 0x2A)
  {
    v7 = (uint64_t)(a1 + 3);
    v8 = a1[3];
    v9 = *a1;
    v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9)
        v11 = 1;
      else
        v11 = v10 >> 2;
      v46 = a1 + 3;
      __p = sub_10000AEB8(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0xFC0uLL);
      sub_10000AC8C(&__p, &v41);
      v13 = (char *)a1[1];
      v14 = v44;
      if (v13 == a1[2])
      {
        v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p)
                v23 = 1;
              else
                v23 = (v14 - (_BYTE *)__p) >> 2;
              v24 = (char *)sub_10000AEB8((uint64_t)v46, v23);
              v26 = v43;
              v14 = &v24[8 * (v23 >> 2)];
              v27 = v44 - v43;
              if (v44 != v43)
              {
                v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                v28 = 8 * (v27 >> 3);
                v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  v30 = *(_QWORD *)v26;
                  v26 += 8;
                  *(_QWORD *)v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              v31 = __p;
              __p = v24;
              v43 = &v24[8 * (v23 >> 2)];
              v44 = v14;
              v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                v14 = v44;
              }
            }
            else
            {
              v16 = v15 >> 3;
              v17 = v15 >> 3 < -1;
              v18 = (v15 >> 3) + 2;
              if (v17)
                v19 = v18;
              else
                v19 = v16 + 1;
              v20 = &v43[-8 * (v19 >> 1)];
              v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                v14 = v43;
              }
              v22 = &v14[-8 * (v19 >> 1)];
              v14 = &v20[v21];
              v43 = v22;
              v44 = &v20[v21];
            }
          }
          v32 = *(_QWORD *)v13;
          v13 += 8;
          *(_QWORD *)v14 = v32;
          v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        v33 = (char *)a1[1];
      }
      v36 = *a1;
      v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      v43 = v33;
      v38 = (char *)a1[3];
      v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      v44 = v13;
      v45 = v38;
      if (v14 - v37 == 8)
        v40 = 21;
      else
        v40 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v40;
      if (v13 != v33)
        v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      if (v36)
        operator delete(v36);
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xFC0uLL);
        sub_10000AA5C(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      sub_10000AB70((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8)
        v35 = 21;
      else
        v35 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    __p = (void *)*((_QWORD *)v3 - 1);
    a1[2] = v3 - 8;
    sub_10000AB70((uint64_t)a1, &__p);
  }
}

void sub_10000B22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B278(_QWORD *a1)
{
  void **v2;
  void **v3;
  _QWORD *v4;
  unint64_t v5;
  void **v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  if (v3 == v2)
  {
    v4 = a1 + 5;
    v3 = (void **)a1[1];
  }
  else
  {
    v4 = a1 + 5;
    v5 = a1[4];
    v6 = &v2[v5 / 0x2A];
    v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_100009F70(v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          v9 = (char *)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      v2 = (void **)a1[1];
      v3 = (void **)a1[2];
    }
  }
  *v4 = 0;
  v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 21;
  }
  else
  {
    if (v11 != 2)
      goto LABEL_16;
    v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    v13 = *v2++;
    operator delete(v13);
  }
  return sub_10000B3C0((uint64_t)a1);
}

uint64_t sub_10000B3C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

char *sub_10000B40C(_QWORD *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  char *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  __int128 v17;
  int64_t v18;
  char *v19;
  unint64_t v20;
  __int128 *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    v19 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v19;
    v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      v25 = result;
      if (a2 != a3)
      {
        v26 = result;
        do
        {
          *(_OWORD *)v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      v18 = v25 - result;
      v13 = result;
    }
    else
    {
      v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      v22 = v13;
      if (v21 != a3)
      {
        v23 = v13;
        do
        {
          v24 = *v21;
          *((_QWORD *)v23 + 2) = *((_QWORD *)v21 + 2);
          *(_OWORD *)v23 = v24;
          v23 += 24;
          v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      sub_100006FD0();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = sub_10000A374(a1, v12);
    v15 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v15;
    v16 = v15;
    if (v6 != a3)
    {
      v16 = v13;
      do
      {
        v17 = *v6;
        *((_QWORD *)v16 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v16 = v17;
        v16 += 24;
        v6 = (__int128 *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    v18 = v16 - v13;
  }
  *v14 = &v13[v18];
  return result;
}

char *sub_10000B5C0(_QWORD *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t *v6;
  uint64_t v8;
  char *result;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    v18 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v18;
    v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      v26 = result;
      if (a2 != a3)
      {
        v27 = result;
        do
        {
          v28 = *v6;
          v29 = v6[1];
          v6 += 2;
          *(_QWORD *)v27 = v28;
          *((_QWORD *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      v17 = (char *)(v26 - result);
      v12 = result;
    }
    else
    {
      v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          v21 = *v6;
          v22 = v6[1];
          v6 += 2;
          *(_QWORD *)result = v21;
          *((_QWORD *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        v24 = v12;
        do
        {
          v25 = *v20++;
          *(_OWORD *)v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (__int128 *)a3);
      }
      v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60)
      sub_100006FD0();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_10000A434(a1, v11);
    v14 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v14;
    v15 = v14;
    if (v6 != a3)
    {
      v15 = v12;
      do
      {
        v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    v17 = (char *)(v15 - v12);
  }
  *v13 = &v17[(_QWORD)v12];
  return result;
}

void sub_10000B70C(std::locale *a1, const char *a2, int a3)
{
  std::locale *v5;

  v5 = sub_10000B79C(a1);
  LODWORD(v5[3].__locale_) = a3;
  *(_OWORD *)((char *)&v5[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[5].__locale_ + 4) = 0u;
  HIDWORD(v5[7].__locale_) = 0;
  strlen(a2);
  sub_10000B7F8();
}

void sub_10000B780(_Unwind_Exception *a1)
{
  std::locale *v1;

  sub_100008918((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::locale *sub_10000B79C(std::locale *a1)
{
  std::locale *v2;

  v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_10000B7E4(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_10000B7F8()
{
  operator new();
}

void sub_10000B94C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_10000B968()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_10000B9A0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000B9B4(uint64_t a1, uint64_t a2)
{
  __int128 v2;

  sub_10000C080(&v2, a2);
}

char *sub_10000BA24(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v6 = a2;
  do
  {
    v7 = v6;
    v6 = sub_10000C3E8(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  if (v7 == a2)
    operator new();
  if (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 == 124)
    {
      v8 = v7 + 1;
      v9 = v7 + 1;
      do
      {
        v10 = v9;
        v9 = sub_10000C3E8(a1, (char *)v9, a3);
      }
      while (v9 != v10);
      if (v10 == v8)
        operator new();
      sub_10000C308();
    }
    return (char *)v7;
  }
  return a3;
}

unsigned __int8 *sub_10000BB6C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v6;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v4 = a3;
  if (*a2 == 94)
    operator new();
  if (a2 != a3)
  {
    do
    {
      v6 = v3;
      v3 = sub_100012338(a1, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36)
        operator new();
      sub_1000122EC();
    }
  }
  return v4;
}

unsigned __int8 *sub_10000BCB8(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  unsigned __int8 *v6;

  v3 = a3;
  v6 = sub_100012930(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
LABEL_8:
    sub_1000122EC();
  if (v6 != (unsigned __int8 *)v3)
  {
    if (*v6 == 124)
    {
      if (sub_100012930(a1, (char *)v6 + 1, v3) != v6 + 1)
        sub_10000C308();
      goto LABEL_8;
    }
    return v6;
  }
  return (unsigned __int8 *)v3;
}

unsigned __int8 *sub_10000BD58(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v6 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v6)
    v7 = v6;
  else
    v7 = a3;
  if (v7 == __s)
    operator new();
  sub_10000BB6C(a1, __s, v7);
  if (v7 == a3)
    v8 = v7;
  else
    v8 = v7 + 1;
  if (v8 != a3)
  {
    v9 = (unsigned __int8 *)memchr(v8, 10, a3 - v8);
    if (v9)
      v10 = v9;
    else
      v10 = a3;
    if (v10 != v8)
    {
      sub_10000BB6C(a1, v8, v10);
      sub_10000C308();
    }
    operator new();
  }
  return a3;
}

char *sub_10000BEB0(uint64_t a1, char *__s, char *a3)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  v6 = (char *)memchr(__s, 10, a3 - __s);
  if (v6)
    v7 = v6;
  else
    v7 = a3;
  if (v7 == __s)
    operator new();
  sub_10000BCB8(a1, __s, v7);
  if (v7 == a3)
    v8 = v7;
  else
    v8 = v7 + 1;
  if (v8 != a3)
  {
    v9 = (char *)memchr(v8, 10, a3 - v8);
    if (v9)
      v10 = v9;
    else
      v10 = a3;
    if (v10 != v8)
    {
      sub_10000BCB8(a1, v8, v10);
      sub_10000C308();
    }
    operator new();
  }
  return a3;
}

void sub_10000C008()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_10000C040(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000C058()
{
  operator delete();
}

void sub_10000C06C(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_10000C080(_QWORD *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_10000C0D8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void sub_10000C0FC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_10000C120(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_10000C138(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_10000C178(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

_QWORD *sub_10000C1C4(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000C208(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000C25C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_10000C270(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000C2B4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

void sub_10000C308()
{
  operator new();
}

unsigned __int8 *sub_10000C3E8(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  unsigned __int8 *v7;

  result = (unsigned __int8 *)sub_10000C47C(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    v7 = sub_10000C724(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
      return sub_10000C92C(a1, v7, (unsigned __int8 *)a3);
  }
  return result;
}

char *sub_10000C47C(uint64_t a1, char *a2, char *a3)
{
  int v6;
  char *v7;
  BOOL v8;
  char *v9;
  int v11;
  int v13;
  std::locale v14[3];
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  if (a2 != a3)
  {
    v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          v13 = a2[1];
          if (v13 == 66 || v13 == 98)
            sub_10000CC2C();
        }
      }
      else if (v6 == 94)
      {
        operator new();
      }
    }
    else
    {
      if (v6 == 36)
        operator new();
      v8 = v6 == 40;
      v7 = a2 + 1;
      v8 = !v8 || v7 == a3;
      if (!v8)
      {
        v8 = *v7 == 63;
        v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          v11 = *v9;
          if (v11 == 33)
          {
            sub_10000B79C(v14);
            v15 = 0u;
            v17 = 0;
            v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_10000B7F8(v14, a2 + 3, a3);
            sub_10000CCB0();
          }
          if (v11 == 61)
          {
            sub_10000B79C(v14);
            v15 = 0u;
            v17 = 0;
            v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_10000B7F8(v14, a2 + 3, a3);
            sub_10000CCB0();
          }
        }
      }
    }
  }
  return a2;
}

void sub_10000C6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100008918((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000C724(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v6;
  _DWORD *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = (char)*a2;
  if (v6 > 62)
  {
    if (v6 > 91)
    {
      if (v6 == 92)
        return sub_10000D448(a1, a2, a3);
      if (v6 != 123)
        return sub_10000D724(a1, a2, a3);
    }
    else
    {
      if (v6 == 91)
        return sub_10000D4E8(a1, a2, a3);
      if (v6 != 63)
        return sub_10000D724(a1, a2, a3);
    }
LABEL_28:
    sub_10000D6D8();
  }
  if (v6 == 40)
  {
    if (a2 + 1 == a3)
      goto LABEL_29;
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)sub_10000BA24(a1, a2 + 3, a3);
      if (v9 == a3)
        goto LABEL_29;
      v10 = v9;
      if (*v9 != 41)
        goto LABEL_29;
    }
    else
    {
      sub_10000D5F8(a1);
      v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v11 = (unsigned __int8 *)sub_10000BA24(a1, v3 + 1, a3);
      if (v11 == a3 || (v10 = v11, *v11 != 41))
LABEL_29:
        sub_10000CD54();
      sub_10000D66C(a1);
    }
    --*v8;
    return v10 + 1;
  }
  if (v6 == 46)
    operator new();
  if ((v6 - 42) < 2)
    goto LABEL_28;
  return sub_10000D724(a1, a2, a3);
}

unsigned __int8 *sub_10000C92C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v11;
  int v12;
  int v13;

  if (a2 == a3)
    return a2;
  v5 = (char)*a2;
  if (v5 <= 62)
  {
    if (v5 == 42 || v5 == 43)
LABEL_18:
      sub_100011C10();
    return a2;
  }
  if (v5 == 63)
    goto LABEL_18;
  if (v5 == 123)
  {
    v6 = a2 + 1;
    v7 = sub_100011D58(a1, a2 + 1, a3, &v13);
    if (v7 == v6)
      goto LABEL_23;
    if (v7 != a3)
    {
      v8 = (char)*v7;
      if (v8 != 44)
      {
        if (v8 == 125)
          goto LABEL_18;
LABEL_23:
        sub_100011DF4();
      }
      v9 = v7 + 1;
      if (v7 + 1 == a3)
        goto LABEL_23;
      if (*v9 == 125)
        goto LABEL_18;
      v12 = -1;
      v11 = sub_100011D58(a1, v9, a3, &v12);
      if (v11 != v9 && v11 != a3 && *v11 == 125)
      {
        if (v12 >= v13)
          goto LABEL_18;
        goto LABEL_23;
      }
    }
    sub_100011E40();
  }
  return a2;
}

void sub_10000CC2C()
{
  operator new();
}

void sub_10000CCB0()
{
  operator new();
}

void sub_10000CD30()
{
  operator delete();
}

void sub_10000CD54()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_10000CD8C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000CDA0(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000CDE4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000CE38(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

_QWORD *sub_10000CE98(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000CEDC(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000CF30(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_10000CF80(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021038;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000CFD8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021038;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000D040(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_10000D154(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)a1 = off_100021080;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 64) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_10000D1E0(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021080;
  v2 = a1 + 2;
  sub_100008918((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000D248(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021080;
  v2 = a1 + 2;
  sub_100008918((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

void sub_10000D2C0(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  char *v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  void *__p;
  char *v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  char v27;
  char v28;
  uint64_t v29;

  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0uLL;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  __p = 0;
  v19 = 0;
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v20 = 0;
  *(_QWORD *)&v21 = v5;
  *((_QWORD *)&v21 + 1) = v5;
  v22 = 0;
  sub_100008BD8((char **)&__p, v4, &v21);
  v23 = v6;
  v24 = v6;
  v25 = 0;
  v26 = v21;
  v27 = v22;
  v29 = v6;
  v28 = 1;
  v7 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(_QWORD *)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_100008D4C(a1 + 16, v7, *(_QWORD *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  v10 = (char *)__p;
  v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (_BYTE *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &v10[24 * v15];
    v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = v16[16];
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  v19 = v10;
  operator delete(v10);
}

void sub_10000D428(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_10000D448(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    sub_10000D82C();
  result = sub_10000D878(a1, a2 + 1, a3);
  if (result == v5)
  {
    result = (unsigned __int8 *)sub_10000D934(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      result = sub_10000DA00(a1, a2 + 1, a3, 0);
      if (result == v5)
        return a2;
    }
  }
  return result;
}

_BYTE *sub_10000D4E8(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3)
      sub_10000E84C();
    sub_10000FAE8();
  }
  return a2;
}

uint64_t sub_10000D5F8(uint64_t result)
{
  if ((*(_BYTE *)(result + 24) & 2) == 0)
    operator new();
  return result;
}

uint64_t sub_10000D66C(uint64_t result)
{
  if ((*(_BYTE *)(result + 24) & 2) == 0)
    operator new();
  return result;
}

void sub_10000D6D8()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_10000D710(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *sub_10000D724(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  int v3;
  BOOL v4;

  if (a2 != a3)
  {
    v3 = (char)*a2;
    v4 = (v3 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v4 && (v3 - 123) >= 3)
      sub_10000DDD4(a1);
  }
  return a2;
}

_QWORD *sub_10000D794(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000D7D8(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

void sub_10000D82C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_10000D864(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000D878(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;

  if (a2 != a3)
  {
    v4 = *a2;
    v5 = v4 - 48;
    if (v4 == 48)
      sub_10000DDD4(a1);
    if ((v4 - 49) <= 8)
    {
      v6 = a2 + 1;
      if (a2 + 1 == a3)
        goto LABEL_12;
      do
      {
        v7 = *v6;
        if ((v7 - 48) > 9)
          break;
        if (v5 >= 0x19999999)
          goto LABEL_14;
        ++v6;
        v5 = v7 + 10 * v5 - 48;
      }
      while (v6 != a3);
      if (v5)
      {
LABEL_12:
        if (v5 <= *(_DWORD *)(a1 + 28))
          sub_10000DF44(a1);
      }
LABEL_14:
      sub_10000DEF8();
    }
  }
  return a2;
}

char *sub_10000D934(uint64_t a1, char *a2, char *a3)
{
  int v3;

  if (a2 == a3)
    return a2;
  v3 = *a2;
  if (v3 > 99)
  {
    if (v3 == 119)
      goto LABEL_12;
    if (v3 == 115)
LABEL_13:
      sub_10000E84C();
    if (v3 != 100)
      return a2;
LABEL_10:
    sub_10000E84C();
  }
  switch(v3)
  {
    case 'D':
      goto LABEL_10;
    case 'S':
      goto LABEL_13;
    case 'W':
LABEL_12:
      sub_10000E84C();
  }
  return a2;
}

unsigned __int8 *sub_10000DA00(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  char v6;
  int v7;
  int v8;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;
  char v14;
  unsigned __int8 v15;
  __int16 v16;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if ((char)v5 > 109)
  {
    v6 = 0;
    switch((char)v5)
    {
      case 'n':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 10;
        goto LABEL_74;
      case 'r':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 13;
        goto LABEL_74;
      case 't':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 9;
        goto LABEL_74;
      case 'u':
        if (a2 + 1 == a3)
          goto LABEL_83;
        v7 = a2[1];
        if ((v7 & 0xF8) != 0x30 && (v7 & 0xFE) != 0x38 && (v7 | 0x20u) - 97 >= 6)
          goto LABEL_83;
        v4 = a2 + 2;
        if (a2 + 2 == a3)
          goto LABEL_83;
        v8 = *v4;
        v9 = -48;
        if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38)
          goto LABEL_28;
        v8 |= 0x20u;
        if ((v8 - 97) >= 6)
          goto LABEL_83;
        v9 = -87;
LABEL_28:
        v6 = 16 * (v9 + v8);
LABEL_29:
        if (v4 + 1 == a3)
          goto LABEL_83;
        v10 = v4[1];
        v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
          goto LABEL_34;
        v10 |= 0x20u;
        if ((v10 - 97) >= 6)
          goto LABEL_83;
        v11 = -87;
LABEL_34:
        if (v4 + 2 == a3)
          goto LABEL_83;
        v12 = v4[2];
        v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
          goto LABEL_39;
        v12 |= 0x20u;
        if ((v12 - 97) >= 6)
          goto LABEL_83;
        v13 = -87;
LABEL_39:
        v14 = v13 + v12 + 16 * (v11 + v10 + v6);
        if (!a4)
          sub_10000DDD4(a1);
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v14;
        *((_BYTE *)a4 + 1) = 0;
        v4 += 3;
        break;
      case 'v':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 11;
        goto LABEL_74;
      case 'x':
        goto LABEL_29;
      default:
        goto LABEL_53;
    }
    return v4;
  }
  if ((char)v5 == 48)
  {
    if (!a4)
      goto LABEL_62;
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    *(_WORD *)a4 = 0;
    return a2 + 1;
  }
  if ((char)v5 != 99)
  {
    if ((char)v5 == 102)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 12;
LABEL_74:
        *(_WORD *)a4 = v16;
        return a2 + 1;
      }
LABEL_62:
      sub_10000DDD4(a1);
    }
LABEL_53:
    if ((char)v5 != 95
      && ((char)v5 < 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 4 * v5) & 0x500) == 0))
    {
      if (!a4)
        goto LABEL_62;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_83:
    sub_10000D82C();
  }
  if (a2 + 1 == a3)
    goto LABEL_83;
  v15 = a2[1];
  if (((v15 & 0xDF) - 65) > 0x19u)
    goto LABEL_83;
  if (!a4)
    sub_10000DDD4(a1);
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((_BYTE *)a4 + 23) = 1;
  }
  *(_BYTE *)a4 = v15 & 0x1F;
  *((_BYTE *)a4 + 1) = 0;
  return a2 + 2;
}

void sub_10000DDD4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0)
      operator new();
    operator new();
  }
  operator new();
}

void sub_10000DED4()
{
  operator delete();
}

void sub_10000DEF8()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_10000DF30(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000DF44(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0)
      operator new();
    operator new();
  }
  operator new();
}

uint64_t sub_10000E040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = off_100021110;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), a3);
  return a1;
}

void sub_10000E0AC(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::locale *v2;
  uint64_t v4;

  std::locale::~locale(v2);
  *v1 = off_100020F78;
  v4 = v1[1];
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  _Unwind_Resume(a1);
}

std::locale *sub_10000E0E4(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021110;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000E13C(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021110;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000E1A4(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_10000E21C(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021158;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000E274(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021158;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000E2DC(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

_QWORD *sub_10000E324(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000E368(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000E3BC(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_10000E404(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000211E8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000E45C(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000211E8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000E4C4(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_10000E5A8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021230;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000E600(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100021230;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000E668(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = *(unsigned __int8 **)(a2 + 16);
      v10 = v6;
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v9++;
        if (v11 != v13)
          break;
        if (!--v10)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

_QWORD *sub_10000E6F8(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000E73C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

unsigned int *sub_10000E790(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    sub_10000DEF8();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

void sub_10000E84C()
{
  operator new();
}

void sub_10000E8C0()
{
  operator delete();
}

void sub_10000E8E4(uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100006FD0();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v19;
}

uint64_t sub_10000EB10(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  std::string::size_type size;
  std::string *v14;
  BOOL v15;
  std::locale v17;
  std::string v18;

  *(_QWORD *)a1 = off_1000212C0;
  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v18.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v18;
    v15 = v14->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v15 = 1;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_10000EC24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  _QWORD *v10;
  std::locale *v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_10000F5B0((void ***)&a10);
  v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  sub_10000F63C((void ***)&a10);
  v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  *v10 = off_100020F78;
  v17 = v10[1];
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  _Unwind_Resume(a1);
}

std::locale *sub_10000ECB0(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  a1->__locale_ = (std::locale::__imp *)off_1000212C0;
  v7 = a1 + 17;
  sub_10000F5B0((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  sub_10000F63C((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

void sub_10000ED64(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v6;

  a1->__locale_ = (std::locale::__imp *)off_1000212C0;
  v6 = a1 + 17;
  sub_10000F5B0((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v6 = a1 + 11;
  sub_10000F63C((void ***)&v6);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100020F78;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  operator delete();
}

void sub_10000EE2C(uint64_t a1, uint64_t a2)
{
  signed __int8 *v4;
  signed __int8 *v5;
  signed __int8 v6;
  signed __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  size_t v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  size_t v40;
  size_t v41;
  uint64_t v42;
  BOOL v43;
  unsigned __int8 **v44;
  unsigned __int8 *v45;
  int v46;
  unsigned __int8 *v47;
  void **v48;
  uint64_t v49;
  size_t v50;
  int v51;
  unsigned int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  size_t v59;
  void *v60;
  size_t v61;
  uint64_t v62;
  BOOL v63;
  unsigned __int8 **v64;
  unsigned __int8 *v65;
  int v66;
  unsigned __int8 *v67;
  void **p_p;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *__p;
  size_t v84;
  char v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  uint64_t v88;

  v4 = *(signed __int8 **)(a2 + 16);
  v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    v18 = 0;
    v16 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_155;
  }
  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5)
    goto LABEL_27;
  v6 = *v4;
  v86 = *v4;
  v7 = v4[1];
  v87 = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    v86 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v6);
    v87 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v7);
  }
  sub_10000F804(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  if ((v85 & 0x80000000) == 0)
  {
    if (v85)
      goto LABEL_8;
LABEL_27:
    v16 = 0;
    v18 = 1;
    goto LABEL_28;
  }
  v19 = v84;
  operator delete(__p);
  if (!v19)
    goto LABEL_27;
LABEL_8:
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 120) - v8;
  if (v9)
  {
    v10 = v9 >> 1;
    if ((unint64_t)(v9 >> 1) <= 1)
      v10 = 1;
    v11 = (_BYTE *)(v8 + 1);
    do
    {
      if (v86 == *(v11 - 1) && v87 == *v11)
        goto LABEL_152;
      v11 += 2;
      --v10;
    }
    while (v10);
  }
  if (!*(_BYTE *)(a1 + 170) || *(_QWORD *)(a1 + 88) == *(_QWORD *)(a1 + 96))
  {
    v16 = 0;
  }
  else
  {
    sub_10000F730(a1 + 16, (char *)&v86, (char *)&v88);
    v13 = *(_QWORD *)(a1 + 88);
    if (*(_QWORD *)(a1 + 96) == v13)
    {
LABEL_24:
      v16 = 0;
      v17 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      while ((int)(sub_10000F7CC((_QWORD *)(v13 + v14), &__p) << 24) > 0xFFFFFF
           || (int)(sub_10000F7CC(&__p, (void **)(*(_QWORD *)(a1 + 88) + v14 + 24)) << 24) >= 0x1000000)
      {
        ++v15;
        v13 = *(_QWORD *)(a1 + 88);
        v14 += 48;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 96) - v13) >> 4))
          goto LABEL_24;
      }
      v16 = 1;
      v17 = 5;
    }
    if (v85 < 0)
      operator delete(__p);
    if ((v16 & 1) != 0)
      goto LABEL_129;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_134;
  sub_10000F9F4(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  v54 = *(_QWORD *)(a1 + 136);
  v55 = v85;
  v56 = *(_QWORD *)(a1 + 144) - v54;
  if (v56)
  {
    v57 = 0;
    v58 = v56 / 24;
    v60 = __p;
    v59 = v84;
    if (v85 >= 0)
      v61 = v85;
    else
      v61 = v84;
    if (v58 <= 1)
      v62 = 1;
    else
      v62 = v56 / 24;
    v63 = 1;
    while (1)
    {
      v64 = (unsigned __int8 **)(v54 + 24 * v57);
      v65 = (unsigned __int8 *)*((unsigned __int8 *)v64 + 23);
      v66 = (char)v65;
      if ((char)v65 < 0)
        v65 = v64[1];
      if ((unsigned __int8 *)v61 == v65)
      {
        if (v66 >= 0)
          v67 = (unsigned __int8 *)(v54 + 24 * v57);
        else
          v67 = *v64;
        if ((v55 & 0x80) == 0)
        {
          if ((_DWORD)v55)
          {
            p_p = &__p;
            v69 = v55;
            do
            {
              if (*(unsigned __int8 *)p_p != *v67)
                goto LABEL_122;
              p_p = (void **)((char *)p_p + 1);
              ++v67;
              --v69;
            }
            while (v69);
            v16 = 1;
            v17 = 5;
            goto LABEL_126;
          }
          v16 = 1;
          if (v63)
            goto LABEL_154;
LABEL_134:
          if ((char)v86 < 0)
          {
            v74 = *(_DWORD *)(a1 + 164);
            goto LABEL_147;
          }
          v71 = *(_DWORD *)(a1 + 160);
          v72 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
          v73 = *(_DWORD *)(v72 + 4 * v86);
          if ((v73 & v71) == 0 && (v86 != 95 || (v71 & 0x80) == 0)
            || (char)v87 < 0
            || (*(_DWORD *)(v72 + 4 * v87) & v71) == 0 && ((v71 & 0x80) == 0 || v87 != 95))
          {
            v74 = *(_DWORD *)(a1 + 164);
            if ((v73 & v74) != 0 || v86 == 95 && (v74 & 0x80) != 0)
            {
LABEL_151:
              v75 = v16;
              goto LABEL_153;
            }
LABEL_147:
            if (((char)v87 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v87) & v74) != 0)
                goto LABEL_151;
              v75 = 1;
              if (v87 == 95 && (v74 & 0x80) != 0)
                goto LABEL_151;
LABEL_153:
              v16 = v75;
LABEL_154:
              v18 = 2;
              goto LABEL_155;
            }
          }
LABEL_152:
          v75 = 1;
          goto LABEL_153;
        }
        v80 = v58;
        v82 = v55;
        v70 = memcmp(v60, v67, v59);
        v58 = v80;
        v55 = v82;
        if (!v70)
          break;
      }
LABEL_122:
      v63 = ++v57 < v58;
      if (v57 == v62)
        goto LABEL_125;
    }
    v17 = 5;
    v16 = 1;
    goto LABEL_127;
  }
  v63 = 0;
LABEL_125:
  v17 = 0;
LABEL_126:
  if ((v55 & 0x80) != 0)
LABEL_127:
    operator delete(__p);
  if (!v63)
    goto LABEL_134;
LABEL_129:
  if (v17)
    goto LABEL_154;
  v18 = 2;
LABEL_28:
  v20 = **(_BYTE **)(a2 + 16);
  v86 = v20;
  if (*(_BYTE *)(a1 + 169))
  {
    v20 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), (char)v20);
    v86 = v20;
  }
  v21 = *(unsigned __int8 **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 48) - (_QWORD)v21;
  if (v22)
  {
    if (v22 <= 1)
      v22 = 1;
    while (1)
    {
      v23 = *v21++;
      if (v23 == v20)
        break;
      if (!--v22)
        goto LABEL_35;
    }
LABEL_46:
    v16 = 1;
    goto LABEL_155;
  }
LABEL_35:
  v24 = *(_DWORD *)(a1 + 164);
  if (v24 || *(_QWORD *)(a1 + 64) != *(_QWORD *)(a1 + 72))
  {
    if ((v20 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v20) & v24) == 0)
      v25 = (v20 == 95) & (v24 >> 7);
    else
      LOBYTE(v25) = 1;
    v26 = *(void **)(a1 + 72);
    v27 = memchr(*(void **)(a1 + 64), (char)v20, (size_t)v26 - *(_QWORD *)(a1 + 64));
    v28 = v27 ? v27 : v26;
    if ((v25 & 1) == 0 && v28 == v26)
      goto LABEL_46;
  }
  v29 = *(_QWORD *)(a1 + 88);
  v30 = *(_QWORD *)(a1 + 96);
  if (v29 != v30)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_10000F730(a1 + 16, (char *)&v86, (char *)&v87);
      v29 = *(_QWORD *)(a1 + 88);
      v30 = *(_QWORD *)(a1 + 96);
    }
    else
    {
      v85 = 1;
      LOWORD(__p) = v20;
    }
    if (v30 == v29)
    {
LABEL_57:
      v33 = 0;
    }
    else
    {
      v31 = 0;
      v32 = 0;
      while ((int)(sub_10000F7CC((_QWORD *)(v29 + v31), &__p) << 24) > 0xFFFFFF
           || (int)(sub_10000F7CC(&__p, (void **)(*(_QWORD *)(a1 + 88) + v31 + 24)) << 24) >= 0x1000000)
      {
        ++v32;
        v29 = *(_QWORD *)(a1 + 88);
        v31 += 48;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 96) - v29) >> 4))
          goto LABEL_57;
      }
      v33 = 1;
      v16 = 1;
    }
    if (v85 < 0)
      operator delete(__p);
    if ((v33 & 1) != 0)
      goto LABEL_155;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_90;
  sub_10000F9F4(a1 + 16, (char *)&v86, (char *)&v87, (uint64_t)&__p);
  v34 = *(_QWORD *)(a1 + 136);
  v35 = v85;
  v36 = *(_QWORD *)(a1 + 144) - v34;
  if (v36)
  {
    v81 = v18;
    v37 = 0;
    v38 = v36 / 24;
    v39 = __p;
    v40 = v84;
    if (v85 >= 0)
      v41 = v85;
    else
      v41 = v84;
    if (v38 <= 1)
      v42 = 1;
    else
      v42 = v36 / 24;
    v43 = 1;
    while (1)
    {
      v44 = (unsigned __int8 **)(v34 + 24 * v37);
      v45 = (unsigned __int8 *)*((unsigned __int8 *)v44 + 23);
      v46 = (char)v45;
      if ((char)v45 < 0)
        v45 = v44[1];
      if ((unsigned __int8 *)v41 == v45)
      {
        if (v46 >= 0)
          v47 = (unsigned __int8 *)(v34 + 24 * v37);
        else
          v47 = *v44;
        if ((v35 & 0x80) != 0)
        {
          v79 = v16;
          v50 = v41;
          v78 = v34;
          v51 = memcmp(v39, v47, v40);
          v34 = v78;
          v41 = v50;
          v16 = v79;
          if (!v51)
          {
            v16 = 1;
            v18 = v81;
            goto LABEL_88;
          }
        }
        else
        {
          if (!(_DWORD)v35)
          {
            v16 = 1;
            v18 = v81;
            if (!v43)
              goto LABEL_90;
            goto LABEL_155;
          }
          v48 = &__p;
          v49 = v35;
          while (*(unsigned __int8 *)v48 == *v47)
          {
            v48 = (void **)((char *)v48 + 1);
            ++v47;
            if (!--v49)
            {
              v16 = 1;
              goto LABEL_85;
            }
          }
        }
      }
      v43 = ++v37 < v38;
      if (v37 == v42)
      {
LABEL_85:
        v18 = v81;
        if ((v35 & 0x80) == 0)
          goto LABEL_89;
        goto LABEL_88;
      }
    }
  }
  v43 = 0;
  if (v85 < 0)
LABEL_88:
    operator delete(__p);
LABEL_89:
  if (!v43)
  {
LABEL_90:
    if ((char)v86 < 0)
      goto LABEL_155;
    v52 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v86) & v52) == 0)
    {
      v53 = (v52 >> 7) & 1;
      if (v86 != 95)
        v53 = 0;
      if (v53 != 1)
        goto LABEL_155;
    }
    goto LABEL_46;
  }
LABEL_155:
  if (v16 == *(unsigned __int8 *)(a1 + 168))
  {
    v76 = 0;
    v77 = -993;
  }
  else
  {
    *(_QWORD *)(a2 + 16) += v18;
    v76 = *(_QWORD *)(a1 + 8);
    v77 = -995;
  }
  *(_DWORD *)a2 = v77;
  *(_QWORD *)(a2 + 80) = v76;
}

void sub_10000F5B0(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_10000F5F0((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_10000F5F0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void sub_10000F63C(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_10000F6AC(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_10000F6AC(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t sub_10000F6F0(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10000F730(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_1000082B8(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_10000F7B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000F7CC(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return sub_10000F998(a1, v2, v5, v6);
}

void sub_10000F804(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  sub_1000082B8(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_10000F964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000F998(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
}

void sub_10000F9F4(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_1000082B8(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_10000FACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000FAE8()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_10000FB20(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_10000FB34(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v4;
  int v5;
  uint64_t v6;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  char *v15;
  int v16;
  char *v17;
  char *v18;
  __int128 *v19;
  int v20;
  _BYTE *v21;
  char *v22;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  void *v29[2];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if (v5 == 93)
    return v4;
  v6 = (uint64_t)a4;
  v9 = 0;
  v10 = 0;
  v31 = 0uLL;
  v32 = 0;
  if (a2 + 1 != a3 && v5 == 91)
  {
    v11 = a2[1];
    switch(v11)
    {
      case '.':
        v4 = (char *)sub_100010198(a1, a2 + 2, a3, (uint64_t)&v31);
        v9 = HIBYTE(v32);
        v10 = *((_QWORD *)&v31 + 1);
        break;
      case ':':
        v12 = sub_1000100E0(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        v12 = sub_10000FF04(a1, a2 + 2, a3, a4);
LABEL_11:
        v6 = v12;
        v13 = 0;
        goto LABEL_44;
      default:
        v10 = 0;
        v9 = 0;
        break;
    }
  }
  v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0)
    v10 = v9;
  if (v10)
  {
    v15 = v4;
    goto LABEL_28;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    v16 = *v4;
    if (v16 == 92)
    {
      v17 = v4 + 1;
      if (v14)
        v18 = sub_1000103E8(a1, v17, a3, (uint64_t *)&v31);
      else
        v18 = (char *)sub_100010284(a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      v15 = v18;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v16) = *v4;
  }
  if ((v9 & 0x80) != 0)
  {
    v19 = (__int128 *)v31;
    *((_QWORD *)&v31 + 1) = 1;
  }
  else
  {
    HIBYTE(v32) = 1;
    v19 = &v31;
  }
  *(_BYTE *)v19 = v16;
  *((_BYTE *)v19 + 1) = 0;
  v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (v20 = *v15, v20 == 93)
    || (v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((_QWORD *)&v31 + 1))
      {
        if (*((_QWORD *)&v31 + 1) != 1)
        {
          v22 = (char *)v31;
LABEL_42:
          sub_100010A98(v6, *v22, v22[1]);
          goto LABEL_43;
        }
        v22 = (char *)v31;
        goto LABEL_40;
      }
    }
    else if (HIBYTE(v32))
    {
      v22 = (char *)&v31;
      if (HIBYTE(v32) != 1)
        goto LABEL_42;
LABEL_40:
      sub_10000E8E4(v6, *v22);
    }
LABEL_43:
    v13 = 1;
    v4 = v15;
    goto LABEL_44;
  }
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    v24 = sub_100010198(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    v4 = (char *)v24;
    goto LABEL_61;
  }
  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if ((_DWORD)v21 == 92)
    {
      if (v14)
        v24 = (uint64_t)sub_1000103E8(a1, v15 + 2, a3, (uint64_t *)v29);
      else
        v24 = (uint64_t)sub_100010284(a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      goto LABEL_60;
    }
  }
  else
  {
    LOBYTE(v21) = *v21;
  }
  HIBYTE(v30) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)v27 = v31;
  v28 = v32;
  v32 = 0;
  v31 = 0uLL;
  *(_OWORD *)__p = *(_OWORD *)v29;
  v26 = v30;
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  sub_1000106D4(v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v28) < 0)
    operator delete(v27[0]);
  if (SHIBYTE(v30) < 0)
    operator delete(v29[0]);
  v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0)
    operator delete((void *)v31);
  if ((v13 & 1) != 0)
    return v4;
  return (char *)v6;
}

void sub_10000FEA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 49) < 0)
    operator delete(*(void **)(v28 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000FF04(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  uint64_t i;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *__p[2];
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_33;
  for (i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_33;
  }
  if (&a2[i] == a3)
LABEL_33:
    sub_10000FAE8();
  sub_100010D4C(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    v8 = v19;
    if (v19)
    {
      v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    sub_100010CC0();
  }
  v8 = v18;
  if (!v18)
    goto LABEL_34;
  v9 = (char *)v17;
LABEL_14:
  sub_100010EE0(a1, v9, &v9[v8], (uint64_t)__p);
  v10 = v16;
  if ((v16 & 0x80u) != 0)
    v10 = (unint64_t)__p[1];
  if (v10)
  {
    sub_100010D0C(a4, (__int128 *)__p);
  }
  else
  {
    v11 = v19;
    if ((v19 & 0x80u) != 0)
      v11 = v18;
    if (v11 == 2)
    {
      v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v13 = (char *)v17;
      sub_100010A98((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1)
        sub_100010CC0();
      v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v12 = (char *)v17;
      sub_10000E8E4((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0)
    operator delete(__p[0]);
  if ((char)v19 < 0)
    operator delete(v17);
  return (uint64_t)&a2[i + 2];
}

void sub_1000100A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000100E0(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  int v7;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_11;
  for (i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_11;
  }
  if (&a2[i] == a3)
LABEL_11:
    sub_10000FAE8();
  v7 = sub_100011438(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7)
    sub_1000113EC();
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_100010198(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  unint64_t v11;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  for (i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_15;
  }
  if (&a2[i] == a3)
LABEL_15:
    sub_10000FAE8();
  sub_100010D4C(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    sub_100010CC0();
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_100010284(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  int v6;
  int v7;
  int v8;

  if (a2 == a3)
    sub_10000D82C();
  v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119)
          return sub_10000DA00(a1, a2, a3, (uint64_t *)a4);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_10000E8E4(a5, 95);
        return a2 + 1;
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v6 != 100)
        return sub_10000DA00(a1, a2, a3, (uint64_t *)a4);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v6 == 68)
    {
      v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }
    return sub_10000DA00(a1, a2, a3, (uint64_t *)a4);
  }
  if (v6 == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }
  if (v6 != 87)
    return sub_10000DA00(a1, a2, a3, (uint64_t *)a4);
  *(_DWORD *)(a5 + 164) |= 0x500u;
  sub_1000114F0(a5, 95);
  return a2 + 1;
}

char *sub_1000103E8(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  int v4;
  char v5;
  char v6;
  char *v7;
  char v8;
  int v9;
  char v10;
  __int16 v11;

  if (a2 == a3)
LABEL_78:
    sub_10000D82C();
  v4 = *a2;
  v5 = *a2;
  if (v4 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 10;
        goto LABEL_75;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 13;
        goto LABEL_75;
      case 't':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 9;
        goto LABEL_75;
      case 'v':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 11;
        goto LABEL_75;
      default:
        if (v4 == 98)
        {
          if (!a4)
            goto LABEL_60;
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v11 = 8;
        }
        else
        {
          if (v4 != 102)
            goto LABEL_25;
          if (!a4)
            goto LABEL_60;
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v11 = 12;
        }
        break;
    }
    goto LABEL_75;
  }
  if (v4 > 91)
  {
    if (v4 == 92)
      goto LABEL_16;
    if (v4 != 97)
      goto LABEL_25;
    if (!a4)
      goto LABEL_60;
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    v11 = 7;
LABEL_75:
    *(_WORD *)a4 = v11;
    return a2 + 1;
  }
  if (v4 == 34 || v4 == 47)
  {
LABEL_16:
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_60:
    sub_10000DDD4(a1);
  }
LABEL_25:
  if ((v5 & 0xF8) != 0x30)
    goto LABEL_78;
  v6 = v4 - 48;
  v7 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_48:
    v7 = a3;
    goto LABEL_49;
  }
  if ((*v7 & 0xF8) == 0x30)
  {
    v6 = *v7 + 8 * v6 - 48;
    if (a2 + 2 != a3)
    {
      v8 = a2[2];
      v9 = v8 & 0xF8;
      v10 = v8 + 8 * v6 - 48;
      if (v9 == 48)
        v7 = a2 + 3;
      else
        v7 = a2 + 2;
      if (v9 == 48)
        v6 = v10;
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (!a4)
    sub_10000DDD4(a1);
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((_BYTE *)a4 + 23) = 1;
  }
  *(_BYTE *)a4 = v6;
  *((_BYTE *)a4 + 1) = 0;
  return v7;
}

void sub_1000106D4(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  unint64_t i;
  unint64_t v7;
  char *v8;
  char v9;
  char *v10;
  unint64_t j;
  unint64_t v12;
  char *v13;
  char v14;
  char *v15;
  uint64_t v16;
  unint64_t k;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t m;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char v31;
  _BYTE *v32;
  char *v33;
  char v34;
  _BYTE *v35;
  void *v36[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void *v40[2];
  uint64_t v41;
  void *__p[2];
  uint64_t v43;

  v3 = a3;
  v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (i = 0; ; ++i)
      {
        v7 = v4[23] < 0 ? *((_QWORD *)v4 + 1) : v4[23];
        if (i >= v7)
          break;
        v8 = v4;
        if (v4[23] < 0)
          v8 = *(char **)v4;
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v8[i]);
        v10 = v4;
        if (v4[23] < 0)
          v10 = *(char **)v4;
        v10[i] = v9;
      }
      for (j = 0; ; ++j)
      {
        v12 = v3[23] < 0 ? *((_QWORD *)v3 + 1) : v3[23];
        if (j >= v12)
          break;
        v13 = v3;
        if (v3[23] < 0)
          v13 = *(char **)v3;
        v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v13[j]);
        v15 = v3;
        if (v3[23] < 0)
          v15 = *(char **)v3;
        v15[j] = v14;
      }
    }
    else
    {
      for (k = 0; ; ++k)
      {
        v18 = a2[23] < 0 ? *((_QWORD *)a2 + 1) : a2[23];
        if (k >= v18)
          break;
        v19 = a2;
        if (a2[23] < 0)
          v19 = *(char **)a2;
        v20 = a2;
        if (a2[23] < 0)
          v20 = *(char **)a2;
        v20[k] = v19[k];
      }
      for (m = 0; ; ++m)
      {
        v22 = a3[23] < 0 ? *((_QWORD *)a3 + 1) : a3[23];
        if (m >= v22)
          break;
        v23 = a3;
        if (a3[23] < 0)
          v23 = *(char **)a3;
        v24 = a3;
        if (a3[23] < 0)
          v24 = *(char **)a3;
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      v26 = v4;
      v4 = *(char **)v4;
      v25 = *((_QWORD *)v26 + 1);
    }
    else
    {
      v25 = v4[23];
    }
    sub_1000118D0(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      v28 = v3;
      v3 = *(char **)v3;
      v27 = *((_QWORD *)v28 + 1);
    }
    else
    {
      v27 = v3[23];
    }
    sub_1000118D0(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)v40 = v38;
    v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    v43 = v37;
    sub_10001171C((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
  else
  {
    if (a2[23] < 0)
      v16 = *((_QWORD *)a2 + 1);
    else
      v16 = a2[23];
    if (v16 != 1 || (a3[23] < 0 ? (v29 = *((_QWORD *)a3 + 1)) : (v29 = a3[23]), v29 != 1))
      sub_10001196C();
    if (*(_BYTE *)(a1 + 169))
    {
      v30 = a2;
      if (a2[23] < 0)
        v30 = *(char **)a2;
      v31 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v30);
      v32 = v4;
      if (v4[23] < 0)
        v32 = *(_BYTE **)v4;
      *v32 = v31;
      v33 = v3;
      if (v3[23] < 0)
        v33 = *(char **)v3;
      v34 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v33);
      v35 = v3;
      if (v3[23] < 0)
        v35 = *(_BYTE **)v3;
      *v35 = v34;
    }
    *(_OWORD *)v40 = *(_OWORD *)v4;
    v41 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *(_QWORD *)v4 = 0;
    *(_OWORD *)__p = *(_OWORD *)v3;
    v43 = *((_QWORD *)v3 + 2);
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    sub_10001171C((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
}

void sub_100010A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  sub_10000F6F0((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void sub_100010A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  __int16 v8;
  _WORD *v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _WORD *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;

  if (!*(_BYTE *)(a1 + 169))
  {
    v18 = a1 + 128;
    v19 = *(_QWORD *)(a1 + 128);
    v10 = (char **)(a1 + 112);
    v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        v21 = v20 >> 1;
        v22 = v19 - (_QWORD)*v10;
        if (v22 <= (v20 >> 1) + 1)
          v23 = v21 + 1;
        else
          v23 = v22;
        if (v22 >= 0x7FFFFFFFFFFFFFFELL)
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)sub_100011A48(v18, v24);
        else
          v25 = 0;
        v27 = &v25[2 * v21];
        v28 = &v25[2 * v24];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v38 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v38)
          goto LABEL_46;
        do
        {
          v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        v33 = v32 >> 1;
        v34 = v19 - (_QWORD)*v10;
        if (v34 <= (v32 >> 1) + 1)
          v35 = v33 + 1;
        else
          v35 = v34;
        if (v34 >= 0x7FFFFFFFFFFFFFFELL)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
          v37 = (char *)sub_100011A48(v18, v36);
        else
          v37 = 0;
        v27 = &v37[2 * v33];
        v28 = &v37[2 * v36];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v40 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v40)
          goto LABEL_46;
        do
        {
          v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_100006FD0();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = v5 | (unsigned __int16)(v6 << 8);
  v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *v9 = v8;
    v26 = v9 + 1;
    goto LABEL_48;
  }
  v10 = (char **)(a1 + 112);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3)
    goto LABEL_49;
  v13 = v12 >> 1;
  v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1)
    v15 = v13 + 1;
  else
    v15 = v14;
  if (v14 >= 0x7FFFFFFFFFFFFFFELL)
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v16 = v15;
  if (v16)
    v17 = (char *)sub_100011A48(a1 + 128, v16);
  else
    v17 = 0;
  v27 = &v17[2 * v13];
  v28 = &v17[2 * v16];
  *(_WORD *)v27 = v8;
  v26 = v27 + 2;
  v30 = *(char **)(a1 + 112);
  v29 = *(char **)(a1 + 120);
  if (v29 == v30)
    goto LABEL_46;
  do
  {
    v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  v29 = *v10;
LABEL_46:
  *(_QWORD *)(a1 + 112) = v27;
  *(_QWORD *)(a1 + 120) = v26;
  *(_QWORD *)(a1 + 128) = v28;
  if (v29)
    operator delete(v29);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v26;
}

void sub_100010CC0()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_100010CF8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100010D0C(uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 17;
  v4 = a1[18];
  if (v4 >= a1[19])
  {
    result = sub_100011030(v3, a2);
  }
  else
  {
    sub_100010FD4(v3, a2);
    result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_100010D4C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  sub_1000082B8(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_100010EAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_100010EE0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_1000082B8(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_100010FB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_100010FD4(_QWORD *result, __int128 *a2)
{
  _QWORD *v2;
  uint64_t v3;
  __int128 v4;

  v2 = result;
  v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    result = sub_100011150((_BYTE *)result[1], *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_100011028(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_100011030(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_100006FD0();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)sub_10000A174(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100011150(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v16 = v11 + 24;
  sub_1000111DC(a1, v15);
  v13 = a1[1];
  sub_100011364((uint64_t)v15);
  return v13;
}

void sub_10001113C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100011364((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_100011150(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_1000079D4();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_1000111DC(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_100011250((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100011250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  sub_1000112EC((uint64_t)v12);
  return a6;
}

uint64_t sub_1000112EC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_100011320(a1);
  return a1;
}

void sub_100011320(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

uint64_t sub_100011364(uint64_t a1)
{
  sub_100011398(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_100011398(uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_1000113EC()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_100011424(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100011438(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  sub_1000082B8(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0)
    operator delete(__p[0]);
  return classname;
}

void sub_1000114D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1000114F0(uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100006FD0();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 64);
  v5 = *(_BYTE **)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 72) = v19;
}

uint64_t sub_10001171C(char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  int64x2_t v24;
  char *v25;
  uint64_t v26;
  int64x2_t v27;
  char *v28;
  uint64_t v29;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (v7 >= v6)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)*a1) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      sub_100006FD0();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (_QWORD)*a1) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    v29 = result;
    if (v14)
      v15 = (char *)sub_1000119B8(result, v14);
    else
      v15 = 0;
    v16 = &v15[48 * v11];
    v17 = *a2;
    *((_QWORD *)v16 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v16 = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)v16 + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v20 = *a1;
    v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      v24 = vdupq_n_s64(v19);
      v21 = &v15[48 * v11];
    }
    else
    {
      v21 = &v15[48 * v11];
      do
      {
        v22 = *(_OWORD *)(v19 - 48);
        *((_QWORD *)v21 - 4) = *(_QWORD *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(_QWORD *)(v19 - 40) = 0;
        *(_QWORD *)(v19 - 32) = 0;
        *(_QWORD *)(v19 - 48) = 0;
        v23 = *(_OWORD *)(v19 - 24);
        *((_QWORD *)v21 - 1) = *(_QWORD *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(_QWORD *)(v19 - 16) = 0;
        *(_QWORD *)(v19 - 8) = 0;
        *(_QWORD *)(v19 - 24) = 0;
        v19 -= 48;
      }
      while ((char *)v19 != v20);
      v24 = *(int64x2_t *)a1;
    }
    v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    v27 = v24;
    v25 = a1[2];
    a1[2] = &v15[48 * v14];
    v28 = v25;
    v26 = v24.i64[0];
    result = sub_1000119FC((uint64_t)&v26);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v9 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v7 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v10 = (char *)(v7 + 48);
  }
  a1[1] = v10;
  return result;
}

void sub_1000118D0(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_1000082B8(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_100011950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10001196C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_1000119A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_1000119B8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    sub_10000708C();
  return operator new(48 * a2);
}

uint64_t sub_1000119FC(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;
    sub_10000F6AC(i - 48);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *sub_100011A48(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    sub_10000708C();
  return operator new(2 * a2);
}

_QWORD *sub_100011A78(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100011ABC(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_100011B10(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_100011B40(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100011B84(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_100011BD8(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_100011C10()
{
  operator new();
}

void sub_100011D30(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100011D58(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  int v4;
  int v5;
  int v6;

  if (a2 != a3)
  {
    v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38)
            break;
          if (v5 >= 214748364)
            sub_100011DF4();
          v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3)
            return a3;
        }
      }
    }
  }
  return a2;
}

void sub_100011DF4()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_100011E2C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100011E40()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_100011E78(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_100011E8C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000213F8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100020F78;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_100011EF4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000213F8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100020F78;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

unsigned int *sub_100011F6C(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return sub_100012130(result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *sub_100012020(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return sub_100012130(result, a3);
  }
  return result;
}

_QWORD *sub_100012050(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000213F8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100020F78;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_1000120B8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000213F8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100020F78;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

unsigned int *sub_100012130(unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(_QWORD *)(v7 - 8) = v5;
      *(_QWORD *)v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_100012188()
{
  operator delete();
}

uint64_t sub_10001219C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_1000121B0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000213F8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100020F78;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_100012218(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000213F8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100020F78;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

void sub_100012290(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_10001229C(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void sub_1000122C4()
{
  operator delete();
}

uint64_t sub_1000122D8(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_1000122EC()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_100012324(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100012338(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v6;

  if (a2 == a3)
    return a2;
  v6 = sub_1000123C0(a1, a2, a3);
  if (v6 == a2)
    return a2;
  else
    return sub_1000124CC(a1, v6, a3);
}

_BYTE *sub_1000123C0(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  int v12;
  uint64_t v13;

  v6 = sub_10001266C(a1, a2, a3);
  v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      v8 = a2[1];
      if (v8 == 40)
      {
        v9 = (uint64_t)(a2 + 2);
        sub_10000D5F8(a1);
        do
        {
          v10 = (_BYTE *)v9;
          v9 = sub_100012338(a1, v9, a3);
        }
        while ((_BYTE *)v9 != v10);
        if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41)
          sub_10000CD54();
        v7 = v10 + 2;
        sub_10000D66C(a1);
      }
      else
      {
        v12 = sub_1000128D4(a1, v8);
        v13 = 2;
        if (!v12)
          v13 = 0;
        return &a2[v13];
      }
    }
  }
  return v7;
}

unsigned __int8 *sub_1000124CC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  int v12;
  int v13;

  if (a2 != a3)
  {
    v4 = *a2;
    if (v4 == 42)
      sub_100011C10();
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      v6 = a2 + 2;
      v13 = 0;
      v7 = sub_100011D58(a1, a2 + 2, a3, &v13);
      if (v7 == v6)
        goto LABEL_16;
      if (v7 != a3)
      {
        v8 = v7 + 1;
        v9 = *v7;
        if (v9 == 44)
        {
          v12 = -1;
          v10 = sub_100011D58(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13)
LABEL_16:
              sub_100011DF4();
LABEL_20:
            sub_100011C10();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_100011E40();
    }
  }
  return a2;
}

_BYTE *sub_10001266C(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  int v6;
  _BYTE *result;

  if (a2 == a3)
  {
    result = sub_100012784(a1, a2, a3);
    if (result != a2)
      return result;
    return sub_10000D4E8(a1, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_10000DDD4(a1);
  }
  result = sub_100012784(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46)
      operator new();
    return sub_10000D4E8(a1, a2, a3);
  }
  return result;
}

_BYTE *sub_100012784(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_10000DDD4(a1);
  }
  return a2;
}

_QWORD *sub_1000127FC(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100020F78;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100012840(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100020F78;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_100012894(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_1000128D4(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28))
      sub_10000DF44(a1);
    sub_10000DEF8();
  }
  return 0;
}

unsigned __int8 *sub_100012930(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = sub_10001298C(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    sub_1000122EC();
  do
  {
    v7 = v6;
    v6 = sub_10001298C(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_10001298C(uint64_t a1, char *a2, char *a3)
{
  char *v6;
  unsigned __int8 *v7;
  int v8;
  char *v9;
  char *v10;

  v6 = sub_100012B3C(a1, a2, a3);
  v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    v8 = *a2;
    if (v8 == 36)
      operator new();
    if (v8 != 40)
    {
      if (v8 == 94)
        operator new();
      return (unsigned __int8 *)a2;
    }
    sub_10000D5F8(a1);
    ++*(_DWORD *)(a1 + 36);
    v9 = (char *)sub_10000BCB8(a1, a2 + 1, a3);
    if (v9 == a3 || (v10 = v9, *v9 != 41))
      sub_10000CD54();
    sub_10000D66C(a1);
    --*(_DWORD *)(a1 + 36);
    v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 != (unsigned __int8 *)a2)
    return sub_10000C92C(a1, v7, (unsigned __int8 *)a3);
  return (unsigned __int8 *)a2;
}

char *sub_100012B3C(uint64_t a1, char *a2, char *a3)
{
  char *result;

  result = sub_100012C04(a1, a2, a3);
  if (result == a2)
  {
    result = sub_100012C8C(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46)
        operator new();
      return sub_10000D4E8(a1, a2, a3);
    }
  }
  return result;
}

char *sub_100012C04(uint64_t a1, char *a2, char *a3)
{
  int v3;
  uint64_t v4;

  if (a2 != a3)
  {
    v3 = *a2;
    v4 = (v3 - 36);
    if (v4 > 0x3A)
      goto LABEL_8;
    if (((1 << (v3 - 36)) & 0x5800000080004D1) != 0)
      return a2;
    if (v4 == 5)
    {
      if (*(_DWORD *)(a1 + 36))
        return a2;
    }
    else
    {
LABEL_8:
      if ((v3 - 123) < 2)
        return a2;
    }
    sub_10000DDD4(a1);
  }
  return a2;
}

char *sub_100012C8C(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  unsigned __int8 *v4;
  int v5;
  BOOL v6;
  int v8;
  uint64_t v9;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = (unsigned __int8 *)(a2 + 1);
  if (v3 + 1 == a3 || *v3 != 92)
    return v3;
  v5 = (char)*v4;
  v6 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v6 || (v5 - 123) < 3)
    sub_10000DDD4(a1);
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    v8 = sub_1000128D4(a1, *v4);
    v9 = 2;
    if (!v8)
      v9 = 0;
    v3 += v9;
    return v3;
  }
  return sub_1000103E8(a1, (char *)v4, a3, 0);
}

BOOL sub_100012D50(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "PRAGMA quick_check", (int (__cdecl *)(void *, int, char **, char **))sub_100012DD0, 0, 0);
  if (v2)
  {
    v3 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018BD0(a1, v3, v4, v5, v6, v7, v8, v9);
  }
  return v2 == 0;
}

BOOL sub_100012DD0(uint64_t a1, int a2, const char **a3)
{
  return a2 < 1 || strcmp(*a3, "ok") != 0;
}

uint64_t sub_100012E08(uint64_t a1)
{
  sqlite3 **v2;
  int v3;
  std::error_code *v4;
  int v5;
  NSObject *v6;
  const std::__fs::filesystem::path *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  const std::__fs::filesystem::path *v21;

  v2 = (sqlite3 **)(a1 + 8);
  v3 = sqlite3_close(*(sqlite3 **)(a1 + 8));
  if (v3)
  {
    v5 = v3;
    v6 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018D30(a1, v5, v6);
    return 0;
  }
  v7 = (const std::__fs::filesystem::path *)(a1 + 100);
  if (remove(v7, v4))
  {
    v8 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018C9C((uint64_t)v7, v8);
    return 0;
  }
  v9 = sqlite3_open((const char *)v7, v2);
  v10 = qword_100024F80;
  if ((_DWORD)v9)
  {
    v11 = v9;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018C38(v11, v10, v12, v13, v14, v15, v16, v17);
    return 0;
  }
  v18 = 1;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_INFO))
  {
    v20 = 136315138;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "recreated %s successfully", (uint8_t *)&v20, 0xCu);
  }
  return v18;
}

uint64_t sub_100012F74(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  memcpy((void *)(a1 + 100), "/var/db/mmaintenanced/memory_errors.db", 0x400uLL);
  memcpy((void *)(a1 + 1124), "/System/Volumes/iSCPreboot/dramecc/dramecc.db", 0x400uLL);
  memcpy((void *)(a1 + 2148), "/System/Volumes/iSCPreboot/dramecc/", 0x400uLL);
  *(_QWORD *)(a1 + 3176) = 0;
  *(_QWORD *)(a1 + 3192) = 0;
  *(_QWORD *)(a1 + 3184) = 0;
  return a1;
}

BOOL sub_100012FE4(uint64_t a1)
{
  sqlite3_stmt **v1;

  v1 = (sqlite3_stmt **)(a1 + 16);
  return !sqlite3_prepare_v2(*(sqlite3 **)(a1 + 8), "CREATE TABLE IF NOT EXISTS ecc_errors_v2 (ID INTEGER PRIMARY KEY,time INT NOT NULL,addr INT NOT NULL,row INT,column INT,bank INT,count INT NOT NULL,correctable INT NOT NULL);",
            -1,
            (sqlite3_stmt **)(a1 + 16),
            0)
      && sqlite3_step(*v1) == 101;
}

BOOL sub_10001303C(sqlite3 **a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = sqlite3_prepare_v2(a1[1], "INSERT INTO ecc_errors_v2('time','addr','row','column','bank','count','correctable') VALUES(?, ?, ?, ?, ?, ?, ?);",
         -1,
         a1 + 3,
         0);
  v3 = sqlite3_prepare_v2(a1[1], "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = ?;", -1, a1 + 6, 0) | v2;
  v4 = sqlite3_prepare_v2(a1[1], "SELECT DISTINCT addr FROM ecc_errors_v2 WHERE correctable = ?;", -1, a1 + 4, 0);
  v5 = v3 | v4 | sqlite3_prepare_v2(a1[1], "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = ? AND time >= ?;",
                   -1,
                   a1 + 7,
                   0);
  v6 = sqlite3_prepare_v2(a1[1], "SELECT DISTINCT addr FROM ecc_errors_v2 WHERE correctable = ? AND time >= ?;",
         -1,
         a1 + 5,
         0);
  v7 = v6 | sqlite3_prepare_v2(a1[1], "SELECT COUNT(DISTINCT correctable) FROM ecc_errors_v2 WHERE addr = ?;",
              -1,
              a1 + 8,
              0);
  v8 = v5 | v7 | sqlite3_prepare_v2(a1[1], "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = 0 AND (addr >> ?) = ?;",
                   -1,
                   a1 + 9,
                   0);
  v9 = sqlite3_prepare_v2(a1[1], "SELECT (addr >> ?) as Page, MAX(time) as Time FROM ecc_errors_v2 WHERE correctable=0 GROUP BY Page ORDER BY Time DESC LIMIT ?;",
         -1,
         a1 + 10,
         0);
  v10 = v8 | v9 | sqlite3_prepare_v2(a1[1], "DELETE FROM ecc_errors_v2 WHERE (addr >> ?) = ?;",
                                  -1,
                                  a1 + 11,
                                  0);
  if ((_DWORD)v10)
  {
    v11 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018DAC(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  return (_DWORD)v10 == 0;
}

uint64_t sub_1000131C4(void *a1)
{
  uint64_t result;
  size_t v2;

  v2 = 4;
  result = sysctlbyname("vm.vm_ecc_max_db_pages", a1, &v2, 0, 0);
  if ((_DWORD)result)
    return *__error();
  return result;
}

void sub_10001320C(uint64_t a1)
{
  _DWORD *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (_DWORD *)(a1 + 96);
  if (sub_1000131C4((void *)(a1 + 96)))
  {
    v2 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018E10(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  if (!*v1)
    *v1 = 1024;
}

void sub_10001326C(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  NSObject *v5;

  v2 = a1 + 100;
  v3 = sqlite3_open((const char *)(a1 + 100), (sqlite3 **)(a1 + 8));
  if (v3)
  {
    v4 = v3;
    v5 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_100018E8C(v2, v4, v5);
  }
  else if ((sub_100012D50(a1) || sub_100012E08(a1)) && sub_100012FE4(a1) && sub_10001303C((sqlite3 **)a1))
  {
    sub_10001320C(a1);
    *(_BYTE *)a1 = 1;
  }
}

uint64_t sub_10001331C(uint64_t a1, int a2, int a3, char a4, sqlite3_int64 a5, _DWORD *a6)
{
  uint64_t v12;
  sqlite3_stmt *v13;
  int v14;
  char v15;
  sqlite3_int64 v16;

  v12 = 32;
  if (a3)
    v12 = 40;
  v13 = *(sqlite3_stmt **)(a1 + v12);
  *a6 = 0;
  sqlite3_reset(v13);
  sqlite3_bind_int(v13, 1, a2);
  if (a3)
    sqlite3_bind_int64(v13, 2, a5);
  v14 = sqlite3_step(v13);
  v15 = a4 ^ 1 | a2;
  while (v14 == 100)
  {
    if ((v15 & 1) != 0)
    {
      ++*a6;
    }
    else
    {
      v16 = sqlite3_column_int64(v13, 0);
      sqlite3_reset(*(sqlite3_stmt **)(a1 + 64));
      sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 64), 1, v16);
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 64)) != 100)
      {
        if (!os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          return 1;
LABEL_21:
        sub_100018F88();
        return 1;
      }
      if (sqlite3_column_int(*(sqlite3_stmt **)(a1 + 64), 0) == 2)
        ++*a6;
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 64)) != 101)
      {
        if (!os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          return 1;
        goto LABEL_21;
      }
    }
    v14 = sqlite3_step(v13);
  }
  if (v14 == 101)
    return 0;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    sub_100018F1C();
  return 1;
}

uint64_t sub_1000134F0(uint64_t a1, int a2, int a3, sqlite3_int64 a4, int *a5)
{
  uint64_t v9;
  sqlite3_stmt *v10;
  int v11;
  uint64_t result;

  v9 = 48;
  if (a3)
    v9 = 56;
  v10 = *(sqlite3_stmt **)(a1 + v9);
  sqlite3_reset(v10);
  sqlite3_bind_int(v10, 1, a2);
  if (a3)
    sqlite3_bind_int64(v10, 2, a4);
  if (sqlite3_step(v10) == 100)
  {
    *a5 = sqlite3_column_int(v10, 0);
    v11 = sqlite3_step(v10);
    result = 0;
    if (v11 == 101)
      return result;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
  }
  else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
  {
LABEL_10:
    sub_100018FF4();
  }
  return 1;
}

uint64_t sub_100013600(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)a1)
  {
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 16));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 24));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 40));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 48));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 56));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 64));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 72));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 80));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 88));
    sqlite3_close(*(sqlite3 **)(a1 + 8));
  }
  v2 = *(void **)(a1 + 3176);
  if (v2)
  {
    *(_QWORD *)(a1 + 3184) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_100013698(uint64_t a1, uint64_t a2)
{
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 24));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 24), 1, *(_QWORD *)a2);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 24), 2, *(_QWORD *)(a2 + 8));
  sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 24), 3);
  sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 24), 4);
  sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 24), 5);
  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 24), 6, *(_DWORD *)(a2 + 28));
  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 24), 7, *(unsigned __int8 *)(a2 + 32));
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 24)) == 101)
    return 0;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    sub_100019060();
  return 1;
}

uint64_t sub_100013770(uint64_t a1, unint64_t a2)
{
  sqlite3_int64 v3;

  v3 = a2 >> vm_page_shift;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 88));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 88), 1, vm_page_shift);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 88), 2, v3);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 88)) == 101)
    return 0;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    sub_1000190CC();
  return 1;
}

BOOL sub_100013818(uint64_t a1, unint64_t a2)
{
  sqlite3_int64 v3;

  v3 = a2 >> vm_page_shift;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 72));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 72), 1, vm_page_shift);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 72), 2, v3);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 72)) == 100)
    return sqlite3_column_int(*(sqlite3_stmt **)(a1 + 72), 0) != 0;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    sub_100019138();
  return 1;
}

void sub_1000138D0(uint64_t a1)
{
  uint64_t v2;
  int v3;
  FILE *v4;
  FILE *v5;
  int v6;
  sqlite3_int64 v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  uint8_t buf[4];
  sqlite3_int64 v12;

  v2 = a1 + 1124;
  v3 = open((const char *)(a1 + 1124), 1537, 384);
  v4 = fdopen(v3, "w");
  if (v4)
  {
    v5 = v4;
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 80));
    sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 80), 1, vm_page_shift);
    sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 80), 2, *(_DWORD *)(a1 + 96));
    v6 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
    if (v6 == 100)
    {
      do
      {
        v7 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 80), 0) << vm_page_shift;
        fprintf(v5, "%llx\n", v7 & ~vm_page_mask);
        if (byte_100024F88)
        {
          v8 = qword_100024F80;
          if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v12 = v7;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "wrote page %llu", buf, 0xCu);
          }
        }
        v9 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
      }
      while (v9 == 100);
      v6 = v9;
    }
    fclose(v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "regenerated the retired page list, rc=%d", buf, 8u);
    }
  }
  else
  {
    v10 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_1000191A4(v2, v10);
  }
}

uint64_t sub_100013AF0(const char *a1)
{
  io_registry_entry_t v2;
  io_registry_entry_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFData *CFProperty;
  const __CFData *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (v2)
  {
    v3 = v2;
    v4 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v4)
    {
      v5 = v4;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, v4, 0, 0);
      if (CFProperty)
      {
        v7 = CFProperty;
        if (CFDataGetLength(CFProperty) == 4)
        {
          v8 = *(unsigned int *)CFDataGetBytePtr(v7);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
            sub_1000192DC();
          v8 = 0;
        }
        CFRelease(v7);
      }
      else
      {
        v8 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_1000192B0();
      v8 = 0;
    }
    IOObjectRelease(v3);
  }
  else
  {
    v9 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_10001924C((uint64_t)a1, v9, v10, v11, v12, v13, v14, v15);
    return 0;
  }
  return v8;
}

uint64_t sub_100013C44(uint64_t a1, time_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _BOOL4 v11;
  uint64_t result;
  uint64_t v13;
  NSObject *v14;
  uint8_t *p_buf;
  os_log_type_t v16;
  uint32_t v17;
  time_t v18[2];
  __int128 buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *(_DWORD *)(a1 + 4);
  if ((v3 & 4) != 0)
  {
    v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
    v13 = *(_QWORD *)(a1 + 8);
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received test event for addr %llx, ignoring", (uint8_t *)&buf, 0xCu);
    return 0;
  }
  v4 = qword_100024F78;
  if (*(_BYTE *)qword_100024F78)
  {
    v20 = 0;
    v21 = 0;
    LOBYTE(v5) = v3;
    v22 = 0;
    if (!a2)
    {
      v18[0] = 0;
      time(v18);
      a2 = v18[0];
      v5 = *(_DWORD *)(a1 + 4);
      v4 = qword_100024F78;
    }
    v6 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)&buf = a2;
    *((_QWORD *)&buf + 1) = v6;
    v7 = v5 & 1;
    LOBYTE(v22) = v5 & 1;
    if (mkdir((const char *)(v4 + 2148), 0x180u) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_100019334();
      return 5;
    }
    if ((v3 & 2) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_100019308();
    }
    else
    {
      v8 = qword_100024F78;
      *(_DWORD *)(qword_100024F78 + 3200) = *(_DWORD *)(a1 + 20);
      if (!v7 && sub_100013818(v8, v6))
        return 0;
      if ((v3 & 0x10) != 0)
      {
        if (sub_100013770(qword_100024F78, v6))
        {
          if (!byte_100024F88)
            return 5;
          v9 = qword_100024F80;
          if (!os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
            return 5;
          LODWORD(v18[0]) = 134217984;
          *(time_t *)((char *)v18 + 4) = v6;
          v10 = "Failed to remove address %llx from database";
LABEL_32:
          p_buf = (uint8_t *)v18;
          v14 = v9;
          v16 = OS_LOG_TYPE_ERROR;
          v17 = 12;
          goto LABEL_19;
        }
      }
      else if (sub_100013698(qword_100024F78, (uint64_t)&buf))
      {
        if (!byte_100024F88)
          return 5;
        v9 = qword_100024F80;
        if (!os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
          return 5;
        LODWORD(v18[0]) = 134217984;
        *(time_t *)((char *)v18 + 4) = v6;
        v10 = "Failed to insert error into database for addr %llx";
        goto LABEL_32;
      }
      if (v7)
        return 0;
    }
    sub_1000138D0(qword_100024F78);
    return 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    v14 = &_os_log_default;
    v10 = "Received a notification, but EccDatabase is not in a valid state";
    p_buf = (uint8_t *)&buf;
    v16 = OS_LOG_TYPE_DEFAULT;
    v17 = 2;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v14, v16, v10, p_buf, v17);
  }
  return 5;
}

BOOL sub_100013F10()
{
  int v0;
  _BOOL8 result;
  int v2;

  v2 = 0;
  v0 = sub_1000131C4(&v2);
  result = 0;
  if (v0 != 2)
    return sub_100013AF0("dram-ecc") != 0;
  return result;
}

void sub_100013F58(time_t a1)
{
  time_t v2;
  int v3;
  sqlite3_int64 v4;
  char v5;
  int v6;
  char v7;
  char v8;
  char v9;
  NSObject *v10;
  int v11;
  char v12;
  int v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  uint8_t v19;
  NSObject *v20;
  char v21;
  time_t v22;
  int v23;
  uint8_t buf[8];
  uint64_t v25;

  if (sub_100013F10())
  {
    v22 = 0;
    if (a1)
      v22 = a1;
    else
      time(&v22);
    if (!*(_DWORD *)(qword_100024F78 + 3200))
      *(_DWORD *)(qword_100024F78 + 3200) = sub_100013AF0("dram-vendor-id");
    v2 = v22;
    if (difftime(v22, qword_100024F48) >= 300.0)
    {
      v3 = 0;
      qword_100024F48 = v2;
      v4 = v2 - 86400;
      v5 = 1;
      do
      {
        v6 = 0;
        v7 = v5;
        v8 = 1;
        do
        {
          v9 = v8;
          v23 = 0;
          if (sub_1000134F0(qword_100024F78, v3 & 1, v6 & 1, v4, &v23))
          {
            v10 = qword_100024F80;
            if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v3;
              LOWORD(v25) = 1024;
              *(_DWORD *)((char *)&v25 + 2) = v6;
              _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get total count for correctable=%d epoch=%d ", buf, 0xEu);
            }
          }
          else
          {
            *(_QWORD *)buf = 0x400000000;
            buf[0] = v3 & 1;
            buf[2] = v6 & 1;
            LODWORD(v25) = *(_DWORD *)(qword_100024F78 + 3200);
            HIDWORD(v25) = v23;
            sub_100014238(buf);
          }
          v8 = 0;
          v6 = 1;
        }
        while ((v9 & 1) != 0);
        v5 = 0;
        v3 = 1;
      }
      while ((v7 & 1) != 0);
      v11 = 0;
      v12 = 1;
      do
      {
        v13 = 0;
        v21 = v12;
        v14 = 1;
        do
        {
          v15 = 0;
          v16 = v14;
          v17 = 1;
          do
          {
            v18 = v17;
            if ((v11 & 1) != 0 && (v15 & 1) != 0)
              break;
            v23 = 0;
            v19 = v15 & 1;
            if (sub_10001331C(qword_100024F78, v11 & 1, v13 & 1, v15 & 1, v4, &v23) == 1)
            {
              v20 = qword_100024F80;
              if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v11;
                LOWORD(v25) = 1024;
                *(_DWORD *)((char *)&v25 + 2) = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to get unique addr count for correctable=%d epoch=%d ", buf, 0xEu);
              }
            }
            else
            {
              *(_QWORD *)buf = v11 & 1;
              buf[1] = v19;
              *(_DWORD *)&buf[2] = v13 & 1;
              LODWORD(v25) = *(_DWORD *)(qword_100024F78 + 3200);
              HIDWORD(v25) = v23;
              sub_100014238(buf);
            }
            v17 = 0;
            v15 = 1;
          }
          while ((v18 & 1) != 0);
          v14 = 0;
          v13 = 1;
        }
        while ((v16 & 1) != 0);
        v12 = 0;
        v11 = 1;
      }
      while ((v21 & 1) != 0);
    }
  }
}

void sub_100014238(unsigned __int8 *a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  _QWORD *v8;
  _OWORD *v9;
  unint64_t v10;
  _OWORD *v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *a1;
    v3 = a1[1];
    v4 = a1[2];
    v5 = *((_DWORD *)a1 + 1);
    v6 = *((_DWORD *)a1 + 2);
    v7 = *((_DWORD *)a1 + 3);
    *(_DWORD *)buf = 67110400;
    v25 = v2;
    v26 = 1024;
    v27 = v3;
    v28 = 1024;
    v29 = v4;
    v30 = 1024;
    v31 = v5;
    v32 = 1024;
    v33 = v6;
    v34 = 1024;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notified CoreAnalytics of ECC error -> correctable: %u, preceded_by_correctable: %u, epoch: %u, uniqueness: %u, vendor: %u, count: %u", buf, 0x26u);
  }
  v8 = (_QWORD *)qword_100024F78;
  if (*(_BYTE *)(qword_100024F78 + 1))
  {
    v9 = *(_OWORD **)(qword_100024F78 + 3184);
    v10 = *(_QWORD *)(qword_100024F78 + 3192);
    if ((unint64_t)v9 >= v10)
    {
      v12 = (void **)(qword_100024F78 + 3176);
      v13 = *(_QWORD *)(qword_100024F78 + 3176);
      v14 = ((uint64_t)v9 - v13) >> 4;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 60)
        sub_100006FD0();
      v16 = v10 - v13;
      if (v16 >> 3 > v15)
        v15 = v16 >> 3;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
        v17 = 0xFFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
        v18 = (char *)sub_10000A2C4(qword_100024F78 + 3192, v17);
      else
        v18 = 0;
      v19 = &v18[16 * v14];
      v20 = &v18[16 * v17];
      *(_OWORD *)v19 = *(_OWORD *)a1;
      v11 = v19 + 16;
      v21 = (char *)v8[398];
      v22 = (char *)v8[397];
      if (v21 != v22)
      {
        do
        {
          *((_OWORD *)v19 - 1) = *((_OWORD *)v21 - 1);
          v19 -= 16;
          v21 -= 16;
        }
        while (v21 != v22);
        v21 = (char *)*v12;
      }
      v8[397] = v19;
      v8[398] = v11;
      v8[399] = v20;
      if (v21)
        operator delete(v21);
    }
    else
    {
      *v9 = *(_OWORD *)a1;
      v11 = v9 + 1;
    }
    v8[398] = v11;
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 0x40000000;
    v23[2] = sub_10001444C;
    v23[3] = &unk_100021538;
    v23[4] = a1;
    analytics_send_event_lazy("com.apple.ecc_error", v23);
  }
}

void *sub_10001444C(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (**(_BYTE **)(a1 + 32))
    v4 = "CE";
  else
    v4 = "UE";
  xpc_dictionary_set_string(v2, "CEorUE", v4);
  xpc_dictionary_set_BOOL(v3, "PrecededByCE", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 2))
    v5 = "Epoch";
  else
    v5 = "Accumulated";
  xpc_dictionary_set_string(v3, "TimePeriod", v5);
  v6 = 0;
  v7 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4);
  if ((int)v7 <= 4)
    v6 = off_100021558[v7];
  xpc_dictionary_set_string(v3, "CountType", v6);
  xpc_dictionary_set_uint64(v3, "Vendor", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  xpc_dictionary_set_uint64(v3, "ErrorCount", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12));
  return v3;
}

void sub_100014554(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100014564(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100014584(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100014594(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void *sub_1000145A0()
{
  void *result;

  result = sub_100006120();
  qword_100024F78 = (uint64_t)result;
  return result;
}

uint64_t sub_1000145BC()
{
  std::locale v1;
  _OWORD v2[3];
  __int128 v3;

  v3 = 0u;
  memset(v2, 0, sizeof(v2));
  sub_100003124((uint64_t)v2);
  if (BYTE8(v3))
    sub_10000B70C(&v1, "com.apple.driver.AppleH[0-9]+ANEInterface[.DMA]*.ane[0-9]*", 0);
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
    sub_100019360();
  return 0;
}

void sub_1000146DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
  uint64_t v17;

  sub_100008918(v17 + 40);
  std::locale::~locale(&a17);
  _Unwind_Resume(a1);
}

void sub_1000146F8(BOOL a1, BOOL a2, uint64_t a3, uint64_t a4, BOOL a5)
{
  xpc_object_t v10;

  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v10, "killed_modelmanagerd", a1);
  xpc_dictionary_set_BOOL(v10, "kill_resolved_abandonment", a2);
  xpc_dictionary_set_int64(v10, "memory_usage_over_threshold", a3 - 1073741825);
  xpc_dictionary_set_int64(v10, "final_memory_usage_over_threshold", a4 - 1073741825);
  xpc_dictionary_set_BOOL(v10, "ended_in_maintenance_error", a5);
  analytics_send_event("com.apple.memorytools.stats.ane_abandonment", v10);
  xpc_release(v10);
}

uint64_t sub_1000147C0()
{
  NSObject *v0;
  dispatch_time_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v0 = dispatch_semaphore_create(0);
  dispatch_retain(v0);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  v7[2] = sub_10001493C;
  v7[3] = &unk_100021588;
  v7[4] = &v8;
  v7[5] = v0;
  mm_swift_are_models_loaded(v7);
  v1 = dispatch_time(0, 3000000000);
  v2 = dispatch_semaphore_wait(v0, v1);
  dispatch_release(v0);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
      sub_1000193B8();
    v3 = 1;
    sub_1000146F8(0, 0, 0, 0, 1);
  }
  else if (*((_BYTE *)v9 + 24))
  {
    v4 = qword_100024F80;
    if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "models loaded, skipping ane abandonment check", v6, 2u);
    }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v3;
}

void sub_100014920(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_10001493C(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;

  v4 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEBUG))
    sub_1000193E4(a2, v4);
  v5 = *(NSObject **)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 != 0;
  dispatch_semaphore_signal(v5);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void sub_1000149B0()
{
  uint64_t v0;
  NSObject *v1;
  _BOOL4 v2;
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  uint64_t v7;

  if ((sub_1000147C0() & 1) == 0)
  {
    v0 = sub_1000145BC();
    v1 = qword_100024F80;
    v2 = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT);
    if (v0 > 1073741825)
    {
      if (v2)
      {
        *(_DWORD *)buf = 134217984;
        v7 = v0 - 1073741825;
        _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "ANE memory usage speculated to be over threshold by %lld bytes", buf, 0xCu);
      }
      if ((sub_1000147C0() & 1) == 0)
      {
        v3 = dispatch_semaphore_create(0);
        dispatch_retain(v3);
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 0x40000000;
        v5[2] = sub_100014B60;
        v5[3] = &unk_1000215A8;
        v5[4] = v3;
        mm_swift_run_with_memory_maintenance_assertion(v5);
        v4 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v3, v4))
        {
          if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
            sub_100019454();
          sub_1000146F8(0, 0, 0, 0, 1);
        }
        dispatch_release(v3);
      }
    }
    else if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "ANE memory clearly not abandonded, skipping further checks", buf, 2u);
    }
  }
}

void sub_100014B60(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;

  v2 = sub_1000145BC();
  if (v2 >= 1073741826)
  {
    if (byte_100024F88 && sub_10001528C())
      sub_100015CC8();
    v9 = sub_100005214("modelmanagerd");
    v10 = qword_100024F80;
    v11 = os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v9 == -1)
    {
      if (v11)
        sub_100019480();
    }
    else
    {
      if (v11)
        sub_1000195C4(v2, v9, v10);
      v12 = terminate_with_reason(v9, 41, 1, "Memory Maintenance kill: ANE memory abandonment", 1);
      if (!v12)
      {
        sleep(6u);
        v15 = sub_1000145BC();
        v16 = qword_100024F80;
        if (v15 >= 1073741826)
        {
          if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
            sub_1000194AC(v15, v16);
        }
        else if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ANE memory usage dropped below threshold after modelmanagerd kill", (uint8_t *)&v17, 2u);
        }
        v5 = v15 < 1073741826;
        v4 = 1;
        v6 = v2;
        v7 = v15;
        goto LABEL_5;
      }
      v13 = v12;
      v14 = qword_100024F80;
      if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_ERROR))
        sub_100019528(v13, v14);
    }
    v4 = 0;
    v5 = 0;
    v6 = v2;
    v7 = 0;
    v8 = 1;
    goto LABEL_18;
  }
  v3 = qword_100024F80;
  if (os_log_type_enabled((os_log_t)qword_100024F80, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ANE memory usage below threshold while no model loaded: size in bytes = %lld", (uint8_t *)&v17, 0xCu);
  }
  v4 = 0;
  v5 = 0;
  v6 = v2;
  v7 = 0;
LABEL_5:
  v8 = 0;
LABEL_18:
  sub_1000146F8(v4, v5, v6, v7, v8);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t sub_100014DB4(int *a1)
{
  int v2;
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;

  v2 = *a1;
  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v2 < 1)
  {
    if (v3)
    {
      v5 = a1[3];
      v6 = a1[4];
      v7 = a1[5];
      v8 = a1[6];
      v9 = a1[7];
      v10 = a1[8];
      v11 = a1[9];
      v13 = a1[1];
      v12 = a1[2];
      *(_DWORD *)buf = 67111424;
      v20 = v12;
      v21 = 1024;
      v22 = v5;
      v23 = 1024;
      v24 = v6;
      v25 = 1024;
      v26 = v7;
      v27 = 1024;
      v28 = v8;
      v29 = 1024;
      v30 = v9;
      v31 = 1024;
      v32 = v10;
      v33 = 1024;
      v34 = v11;
      v35 = 1024;
      v36 = v13 & 1;
      v37 = 1024;
      v38 = (v13 >> 1) & 1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notified CoreAnalytics of MCC error: status(%x) amcc(%x) plane(%x) bank(%x) way(%x) index(%x) bit_off_cl(%x) bit_off_within_hcl(%x) single_bit(%u) multi_bit(%u)", buf, 0x3Eu);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 0x40000000;
    v15[2] = sub_100014F5C;
    v15[3] = &unk_1000215C8;
    v14 = *((_OWORD *)a1 + 1);
    v16 = *(_OWORD *)a1;
    v17 = v14;
    v18 = *((_QWORD *)a1 + 4);
    analytics_send_event_lazy("com.apple.mcc.error", v15);
    return 0;
  }
  else
  {
    if (v3)
    {
      *(_DWORD *)buf = 67109120;
      v20 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown ECC event version %u\n", buf, 8u);
    }
    return 5;
  }
}

xpc_object_t sub_100014F5C(_DWORD *a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", a1[10]);
  xpc_dictionary_set_uint64(v2, "amcc", a1[11]);
  xpc_dictionary_set_uint64(v2, "plane", a1[12]);
  xpc_dictionary_set_uint64(v2, "bank", a1[13]);
  xpc_dictionary_set_uint64(v2, "way", a1[14]);
  xpc_dictionary_set_uint64(v2, "index", a1[15]);
  xpc_dictionary_set_uint64(v2, "bit_off_cl", a1[16]);
  xpc_dictionary_set_uint64(v2, "bit_off_within_hcl", a1[17]);
  xpc_dictionary_set_uint64(v2, "single_bit", a1[9] & 1);
  xpc_dictionary_set_uint64(v2, "multi_bit", ((unint64_t)a1[9] >> 1) & 1);
  return v2;
}

uint64_t sub_10001505C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 5902) >= 0xFFFFFFFE)
    return (uint64_t)*(&off_1000215E8 + 5 * (v1 - 5900) + 5);
  else
    return 0;
}

uint64_t sub_100015098(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  _OWORD v8[2];
  uint64_t v9;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 72)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 72) && *(_DWORD *)(result + 76) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(_OWORD *)(result + 48);
      v8[0] = *(_OWORD *)(result + 32);
      v8[1] = v5;
      v9 = *(_QWORD *)(result + 64);
      v6 = *(_OWORD *)(result + 108);
      v7[0] = *(_OWORD *)(result + 92);
      v7[1] = v6;
      result = sub_100005FF4(v4, (uint64_t)v8, (uint64_t)v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100015140(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  _OWORD v8[2];
  uint64_t v9;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 72)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 72) && *(_DWORD *)(result + 76) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(_OWORD *)(result + 48);
      v8[0] = *(_OWORD *)(result + 32);
      v8[1] = v5;
      v9 = *(_QWORD *)(result + 64);
      v6 = *(_OWORD *)(result + 108);
      v7[0] = *(_OWORD *)(result + 92);
      v7[1] = v6;
      result = sub_1000060B8(v4, (uint64_t)v8, (uint64_t)v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000151E8(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 5902) >= 0xFFFFFFFE
    && (v5 = (void (*)(void))*(&off_1000215E8 + 5 * (v4 - 5900) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100015278()
{
  qword_100024F90 = 0x40F5180000000000;
}

uint64_t sub_10001528C()
{
  return sub_1000152A4() & 1;
}

uint64_t sub_1000152A4()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSString v15;
  id v16;
  double v17;
  id v18;
  id v19;
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  int v22;
  char *v23;
  uint64_t v24;
  double v25;
  id v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  id v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  double v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  double *v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void (*v50)(char *, uint64_t);
  double v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  id v55;
  uint64_t v56;
  double v57;
  uint64_t v58;

  sub_100015A08(&qword_100024E90);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)&v51 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v51 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v51 - v10;
  v12 = type metadata accessor for Logger(0);
  v52 = *(_QWORD *)(v12 - 8);
  v53 = v12;
  __chkstk_darwin(v12);
  v54 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x800000010001E860, 0x522D6F542D706154, 0xEC00000072616461);
  v14 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v15 = String._bridgeToObjectiveC()();
  v57 = 0.0;
  v16 = objc_msgSend(v14, "attributesOfItemAtPath:error:", v15, &v57);

  v17 = v57;
  if (v16)
  {
    v18 = *(id *)&v57;
    v19 = objc_msgSend(v16, "fileModificationDate");
    if (v19)
    {
      v20 = v19;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v21 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
      v21(v1, v9, v2);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
      v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
      v23 = v54;
      if (v22 != 1)
      {
        v24 = ((uint64_t (*)(char *, char *, uint64_t))v21)(v11, v1, v2);
        Date.timeIntervalSinceNow.getter(v24);
        if (qword_100024F50 != -1)
        {
          v51 = v25;
          swift_once(&qword_100024F50, sub_100015278);
          v25 = v51;
        }
        if (v25 < -*(double *)&qword_100024F90)
        {

          (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
          (*(void (**)(char *, uint64_t))(v52 + 8))(v23, v53);
          return 1;
        }
        v46 = (*(uint64_t (**)(char *, char *, uint64_t))(v3 + 16))(v6, v11, v2);
        v47 = Logger.logObject.getter(v46);
        v48 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v47, v48))
        {
          v49 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v49 = 134217984;
          *(_QWORD *)&v51 = v49 + 4;
          v57 = Date.timeIntervalSinceNow.getter(v49) / 60.0 / 60.0;
          v23 = v54;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58, *(_QWORD *)&v51, v49 + 12);
          v50 = *(void (**)(char *, uint64_t))(v3 + 8);
          v50(v6, v2);
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "Time since last TTR less than 24 hours. Last TTR %f hours ago", v49, 0xCu);
          swift_slowDealloc(v49, -1, -1);

        }
        else
        {

          v50 = *(void (**)(char *, uint64_t))(v3 + 8);
          v50(v6, v2);
        }
        v50(v11, v2);
        goto LABEL_15;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
      v23 = v54;
    }
    v34 = sub_100016A0C((uint64_t)v1, &qword_100024E90);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = COERCE_DOUBLE(swift_slowAlloc(32, -1));
      v57 = v38;
      *(_DWORD *)v37 = 136315138;
      v55 = (id)sub_100016308(0xD000000000000041, 0x800000010001E810, (uint64_t *)&v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v37 + 4, v37 + 12);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Failed to get modification date of %s", v37, 0xCu);
      swift_arrayDestroy(*(_QWORD *)&v38, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(*(_QWORD *)&v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);
    }

LABEL_15:
    (*(void (**)(char *, uint64_t))(v52 + 8))(v23, v53);
    return 0;
  }
  v27 = *(id *)&v57;
  v28 = COERCE_DOUBLE(_convertNSErrorToError(_:)(*(_QWORD *)&v17));

  swift_willThrow();
  v57 = v28;
  swift_errorRetain(*(_QWORD *)&v28);
  v29 = sub_100015A08(&qword_100024E98);
  v30 = sub_100015A48();
  if (swift_dynamicCast(&v55, &v57, v29, v30, 0))
  {
    v31 = v55;
    v32 = objc_msgSend(v55, "code");

    v33 = v54;
    if (v32 == (id)260)
    {
      (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v53);
      swift_errorRelease(*(_QWORD *)&v28);
      swift_errorRelease(*(_QWORD *)&v57);
      return 1;
    }
  }
  else
  {
    v33 = v54;
  }
  swift_errorRelease(*(_QWORD *)&v57);
  swift_errorRetain(*(_QWORD *)&v28);
  v39 = swift_errorRetain(*(_QWORD *)&v28);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc(12, -1);
    v43 = (double *)swift_slowAlloc(8, -1);
    *(_DWORD *)v42 = 138412290;
    swift_errorRetain(*(_QWORD *)&v28);
    v44 = COERCE_DOUBLE(_swift_stdlib_bridgeErrorToNSError(*(_QWORD *)&v28));
    v57 = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58, v42 + 4, v42 + 12);
    *v43 = v44;
    v33 = v54;
    swift_errorRelease(*(_QWORD *)&v28);
    swift_errorRelease(*(_QWORD *)&v28);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Failed to get file attributes for last ttr time record with err: %@", v42, 0xCu);
    v45 = sub_100015A08(&qword_100024EA8);
    swift_arrayDestroy(v43, 1, v45);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v42, -1, -1);

    swift_errorRelease(*(_QWORD *)&v28);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)&v28);
    swift_errorRelease(*(_QWORD *)&v28);
    swift_errorRelease(*(_QWORD *)&v28);

  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v33, v53);
  return 0;
}

uint64_t sub_100015A08(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100015A48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024EA0;
  if (!qword_100024EA0)
  {
    v1 = objc_opt_self(NSError);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100024EA0);
  }
  return result;
}

uint64_t sub_100015A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  NSString v5;
  unsigned __int8 v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint32_t v14;
  os_log_type_t v15;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x800000010001E860, 0x522D6F542D706154, 0xEC00000072616461);
  if (utimes("/private/var/mobile/Library/MemoryMaintenance/ane_abandonment_ttr", 0)
    && errno.getter() != 2)
  {
    v7 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v15))
    {
      v9 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v9 = 67109120;
      v18 = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v9 + 4, v9 + 8);
      v10 = "Update last Tap-To-Radar file failed with errno %d";
      v11 = v7;
      v12 = v15;
      v13 = v9;
      v14 = 8;
      goto LABEL_8;
    }
LABEL_9:

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  v4 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v4, "createFileAtPath:contents:attributes:", v5, 0, 0);

  if ((v6 & 1) == 0)
  {
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      v10 = "Failed to update last Tap-To-Radar file, could not create file";
      v11 = v7;
      v12 = v8;
      v13 = v9;
      v14 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, v13, v14);
      swift_slowDealloc(v9, -1, -1);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100015CCC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v19[4];

  v0 = sub_100015A08(&qword_100024EB0);
  __chkstk_darwin(v0);
  v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for TaskPriority(0);
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  v5 = swift_allocObject(&unk_100021668, 32, 7);
  *(_QWORD *)(v5 + 16) = 0;
  v6 = (_QWORD *)(v5 + 16);
  *(_QWORD *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_100016A0C((uint64_t)v2, &qword_100024EB0);
    v7 = 0;
    v8 = 0;
    v9 = 7168;
  }
  else
  {
    v10 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    v9 = v10 | 0x1C00;
    v11 = *v6;
    if (*v6)
    {
      v12 = *(_QWORD *)(v5 + 24);
      ObjectType = swift_getObjectType(*v6);
      swift_unknownObjectRetain(v11);
      v7 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
      v8 = v14;
      swift_unknownObjectRelease(v11);
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
  }
  v15 = swift_allocObject(&unk_100021690, 32, 7);
  *(_QWORD *)(v15 + 16) = &unk_100024EC0;
  *(_QWORD *)(v15 + 24) = v5;
  if (v8 | v7)
  {
    v19[0] = 0;
    v19[1] = 0;
    v16 = v19;
    v19[2] = v7;
    v19[3] = v8;
  }
  else
  {
    v16 = 0;
  }
  v17 = swift_task_create(v9, v16, (char *)&type metadata for () + 8, &unk_100024ED0, v15);
  return swift_release(v17);
}

uint64_t sub_100015E88()
{
  return swift_task_switch(sub_100015E9C, 0, 0);
}

uint64_t sub_100015E9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v14;
  id v15;
  NSString v16;
  unint64_t v17;
  NSString v18;
  id v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  NSString v23;
  NSString v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = swift_task_alloc(v4);
  Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x800000010001E860, 0x522D6F542D706154, 0xEC00000072616461);
  result = _CFCopySystemVersionDictionaryValue(_kCFSystemVersionBuildVersionKey);
  if (result)
  {
    v7 = (void *)result;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = v9;

    if (&class metadata base offset for TapToRadarService)
      v11 = &type metadata accessor for TapToRadarService == 0;
    else
      v11 = 1;
    if (v11 || &type metadata for TapToRadarService == 0 || &nominal type descriptor for TapToRadarService == 0)
    {
      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
      swift_bridgeObjectRelease(v10);
    }
    else
    {
      v30 = v3;
      v31 = v0;
      v14 = objc_msgSend(objc_allocWithZone((Class)RadarDraft), "init");
      v15 = objc_allocWithZone((Class)RadarComponent);
      v16 = String._bridgeToObjectiveC()();
      v17 = v4;
      v18 = String._bridgeToObjectiveC()();
      v19 = objc_msgSend(v15, "initWithName:version:identifier:", v16, v18, 1017196);

      objc_msgSend(v14, "setComponent:", v19);
      _StringGuts.grow(_:)(54);
      v20._countAndFlagsBits = 91;
      v20._object = (void *)0xE100000000000000;
      String.append(_:)(v20);
      v21._countAndFlagsBits = v8;
      v21._object = v10;
      String.append(_:)(v21);
      swift_bridgeObjectRelease(v10);
      v22._countAndFlagsBits = 0xD000000000000033;
      v22._object = (void *)0x800000010001E8A0;
      String.append(_:)(v22);
      v23 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(0xE000000000000000);
      objc_msgSend(v14, "setTitle:", v23);

      objc_msgSend(v14, "setClassification:", 6);
      objc_msgSend(v14, "setReproducibility:", 5);
      v24 = String._bridgeToObjectiveC()();
      objc_msgSend(v14, "setProblemDescription:", v24);

      type metadata accessor for TapToRadarService(0);
      v25 = (void *)static TapToRadarService.shared.getter();
      v26 = swift_task_alloc(v17);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v26, v5, v1);
      v27 = *(unsigned __int8 *)(v2 + 80);
      v28 = (v27 + 16) & ~v27;
      v29 = swift_allocObject(&unk_100021768, v28 + v30, v27 | 7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v29 + v28, v26, v1);
      TapToRadarService.createDraft(_:processName:displayReason:completion:)(v14, 0xD000000000000012, 0x800000010001E9A0, 0xD00000000000003BLL, 0x800000010001E9C0, sub_100016B4C, v29);

      swift_release(v29);
      swift_task_dealloc(v26);
      sub_100015A84();

      v0 = v31;
      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
    }
    swift_task_dealloc(v5);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100016258(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000162BC;
  return v6(a1);
}

uint64_t sub_1000162BC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100016308(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000163D8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100016DA4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100016DA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100016D84(v12);
  return v7;
}

uint64_t sub_1000163D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100016590(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100016590(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100016624(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000167FC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000167FC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100016624(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100016798(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100016798(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100015A08(&qword_100024ED8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000167FC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100015A08(&qword_100024ED8);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100016948()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001696C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100024EBC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000169C4;
  return swift_task_switch(sub_100015E9C, 0, 0);
}

uint64_t sub_1000169C4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100016A0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100015A08(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100016A48()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016A6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100024ECC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000169C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100024EC8 + dword_100024EC8))(a1, v4);
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

uint64_t sub_100016AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100016B4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  NSObject *oslog;
  uint64_t v13;
  uint64_t v14;

  v2 = type metadata accessor for Logger(0);
  if (a1)
  {
    swift_errorRetain(a1);
    swift_errorRetain(a1);
    v3 = swift_errorRetain(a1);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v6 = 138412290;
      swift_errorRetain(a1);
      v8 = _swift_stdlib_bridgeErrorToNSError(a1);
      v13 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v6 + 4, v6 + 12);
      *v7 = v8;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to launch Tap-To-Radar with error: %@", v6, 0xCu);
      v9 = sub_100015A08(&qword_100024EA8);
      swift_arrayDestroy(v7, 1, v9);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
      swift_errorRelease(a1);

    }
    else
    {
      swift_errorRelease(a1);

      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }
  }
  else
  {
    oslog = Logger.logObject.getter(v2);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, (os_log_type_t)v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, (os_log_type_t)v10, "Successfully started Tap-To-Radar", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

  }
}

uint64_t sub_100016D84(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100016DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void mm_swift_are_models_loaded(const void *a1)
{
  sub_1000171A4(a1, (void (*)(void))areModelsLoaded(callback:));
}

uint64_t areModelsLoaded(callback:)(const void *a1)
{
  return sub_1000171F4(a1, (uint64_t)&unk_100021790, (uint64_t)&unk_1000217B8, (uint64_t)&unk_100024EE8, (uint64_t)&unk_100024EF0);
}

uint64_t sub_100016E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[2] = a4;
  v5 = type metadata accessor for Logger(0);
  v4[3] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[4] = v6;
  v4[5] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Query(0);
  v4[6] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[7] = v8;
  v4[8] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100016E9C, 0, 0);
}

uint64_t sub_100016E9C()
{
  uint64_t v0;
  _QWORD *v1;

  Query.init()();
  v1 = (_QWORD *)swift_task_alloc(async function pointer to Query.loadedAssets.getter[1]);
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_100016EF0;
  return Query.loadedAssets.getter();
}

uint64_t sub_100016EF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 72);
  *(_QWORD *)(*(_QWORD *)v2 + 80) = v1;
  swift_task_dealloc(v5);
  v7 = v4[7];
  v6 = v4[8];
  v8 = v4[6];
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v9 = sub_100016FDC;
  }
  else
  {
    v4[11] = a1;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v9 = sub_100016F7C;
  }
  return swift_task_switch(v9, 0, 0);
}

uint64_t sub_100016F7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
  v3 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100016FDC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = Logger.init(subsystem:category:)(0xD000000000000017, 0x800000010001ECC0, 0xD000000000000014, 0x800000010001EC40);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to connect to modelmanagerd", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v0 + 16);
  v8 = *(_QWORD *)(v0 + 24);

  (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  swift_errorRelease(v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v10 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001710C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_100024EE4);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000179CC;
  return sub_100016E14((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100017158(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100015A08(&qword_100024EB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void mm_swift_run_with_memory_maintenance_assertion(const void *a1)
{
  sub_1000171A4(a1, (void (*)(void))runWithMemoryMaintenanceAssertion(block:));
}

void sub_1000171A4(const void *a1, void (*a2)(void))
{
  void *v3;

  v3 = _Block_copy(a1);
  a2();
  _Block_release(v3);
}

uint64_t runWithMemoryMaintenanceAssertion(block:)(const void *a1)
{
  return sub_1000171F4(a1, (uint64_t)&unk_1000217E0, (uint64_t)&unk_100021808, (uint64_t)&unk_100024F00, (uint64_t)&unk_100024F08);
}

uint64_t sub_1000171F4(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t ObjectType;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD v29[4];

  sub_100015A08(&qword_100024EB0);
  __chkstk_darwin();
  v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a1);
  v13 = type metadata accessor for TaskPriority(0);
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v11, 1, 1, v13);
  v15 = (_QWORD *)swift_allocObject(a2, 40, 7);
  v15[2] = 0;
  v16 = v15 + 2;
  v15[3] = 0;
  v15[4] = v12;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) == 1)
  {
    sub_100017158((uint64_t)v11);
    v17 = 0;
    v18 = 0;
    v19 = 7168;
  }
  else
  {
    v20 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    v19 = v20 | 0x1C00;
    v21 = *v16;
    if (*v16)
    {
      v22 = v15[3];
      ObjectType = swift_getObjectType(*v16);
      swift_unknownObjectRetain(v21);
      v17 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v22);
      v18 = v24;
      swift_unknownObjectRelease(v21);
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
  }
  v25 = swift_allocObject(a3, 32, 7);
  *(_QWORD *)(v25 + 16) = a4;
  *(_QWORD *)(v25 + 24) = v15;
  if (v18 | v17)
  {
    v29[0] = 0;
    v29[1] = 0;
    v26 = v29;
    v29[2] = v17;
    v29[3] = v18;
  }
  else
  {
    v26 = 0;
  }
  v27 = swift_task_create(v19, v26, (char *)&type metadata for () + 8, a5, v25);
  return swift_release(v27);
}

uint64_t sub_1000173C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[7] = a4;
  v5 = type metadata accessor for Logger(0);
  v4[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[9] = v6;
  v4[10] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100017424, 0, 0);
}

uint64_t sub_100017424()
{
  uint64_t v0;
  _QWORD *v1;

  Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x800000010001E860, 0xD000000000000014, 0x800000010001EC40);
  type metadata accessor for Assertion(0);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.__allocating_init(policy:description:)[1]);
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_1000174E0;
  return Assertion.__allocating_init(policy:description:)(0xD000000000000011, 0x800000010001EC60, 0xD000000000000031, 0x800000010001EC80);
}

uint64_t sub_1000174E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 88);
  *(_QWORD *)(v3 + 96) = a1;
  *(_QWORD *)(v3 + 104) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_1000176CC;
  else
    v5 = sub_10001754C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001754C(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = Logger.logObject.getter(a1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Acquired MemoryMaintenance assertion in modelmanagerd", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }
  v5 = *(_QWORD *)(v1 + 56);

  (*(void (**)(uint64_t))(v5 + 16))(v5);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  *(_QWORD *)(v1 + 112) = v6;
  *v6 = v1;
  v6[1] = sub_100017620;
  return Assertion.invalidate()();
}

uint64_t sub_100017620()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 112));
  return swift_task_switch(sub_100017674, 0, 0);
}

uint64_t sub_100017674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  swift_release(*(_QWORD *)(v0 + 96));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000176CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 104);
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 104);
    v16 = *(_QWORD *)(v0 + 72);
    v17 = *(_QWORD *)(v0 + 64);
    v18 = *(_QWORD *)(v0 + 80);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v19 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue(v5, v0 + 40, v0 + 16);
    v8 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    v10 = v9;
    *(_QWORD *)(v0 + 48) = sub_100016308(v8, v9, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to acquire MemoryMaintenance assertion in modelmanagerd: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    swift_errorRelease(v5);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 72);
    v12 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 64);
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    swift_errorRelease(v11);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000178BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100024ECC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000179CC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100024EC8 + dword_100024EC8))(a1, v4);
}

uint64_t sub_100017930()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001795C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_100024EFC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000169C4;
  return sub_1000173C4((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_1000179A8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

util::MappedFile *util::MappedFile::MappedFile(util::MappedFile *this, const char *a2)
{
  int v3;
  int v4;
  off_t st_size;
  void *v7;
  void *v8;
  stat v10;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v3 = open(a2, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    if (!fstat(v3, &v10))
    {
      st_size = v10.st_size;
      if ((v10.st_mode & 0xF000) == 0x8000 && v10.st_size > 0)
      {
        *((_QWORD *)this + 1) = v10.st_size;
        v7 = mmap(0, st_size, 1, 1, v4, 0);
        if (v7 == (void *)-1)
          v8 = 0;
        else
          v8 = v7;
        *(_QWORD *)this = v8;
      }
    }
    close(v4);
  }
  return this;
}

void util::MappedFile::~MappedFile(util::MappedFile *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
    munmap(v2, *((_QWORD *)this + 1));
}

_QWORD *util::stringprintf@<X0>(util *this@<X0>, _QWORD *a2@<X8>, ...)
{
  char __str[1024];
  va_list va;

  va_start(va, a2);
  vsnprintf(__str, 0x400uLL, (const char *)this, va);
  return sub_100007924(a2, __str);
}

void sub_100017B18()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100003BEC();
  sub_100003BD8((void *)&_mh_execute_header, v0, v1, "Error: failed (kr != KERN_SUCCESS)", v2);
  sub_100003BE4();
}

void sub_100017B48()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100003BEC();
  sub_100003BD8((void *)&_mh_execute_header, v0, v1, "Error: failed (kr == KERN_SUCCESS)", v2);
  sub_100003BE4();
}

void sub_100017B78()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100003BEC();
  sub_100003BD8((void *)&_mh_execute_header, v0, v1, "Error: failed (info.zone_names_count == info.zone_info_count)", v2);
  sub_100003BE4();
}

void sub_100017BA8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100003BEC();
  sub_100003BD8((void *)&_mh_execute_header, v0, v1, "Error: failed (tag_to_bundle_info != NULL)", v2);
  sub_100003BE4();
}

void sub_100017BD8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100003BEC();
  sub_100003BD8((void *)&_mh_execute_header, v0, v1, "Error: failed (kext_info != NULL)", v2);
  sub_100003BE4();
}

void sub_100017C08(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100003BF8(a1, a2);
  sub_100003BD8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Error: failed (vm_name != NULL)", v3);
}

void sub_100017C34(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100003BF8(a1, a2);
  sub_100003BD8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Error: failed (bundle_id != NULL)", v3);
}

void sub_100017C60(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_100003BF8(a1, a2);
  sub_100003BD8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Error: failed (! CSIsNull(symbol))", v3);
}

void sub_100017C8C(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_100007150();
  sub_100007148(v2);
  sub_10000716C();
  sub_10000712C((void *)&_mh_execute_header, a1, v3, "memorystatus_control request for on demand snapshot failed: %s", v4);
  sub_100007120();
}

void sub_100017D00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "memorystatus_control request for on demand snapshot returned snapshot size of 0", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017D2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007178();
  sub_100007138((void *)&_mh_execute_header, v0, v1, "memorystatus_control request for on demand snapshot returned snapshot size %d, which is too small to be valid", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017D8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007178();
  sub_100007138((void *)&_mh_execute_header, v0, v1, "memorystatus_control request for on demand snapshot returned snapshot size %d, which is not a valid struct size multiple", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017DEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Error: failed (ret >= 0)", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017E18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Error: failed (neural_ledger_index > -1)", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Error: failed (dispatch_ret >= 0)", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017E70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "current time got back in time", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017E9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "gettimeofday failed", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017EC8()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100007150();
  sub_100007148(v0);
  sub_100007184();
  sub_100007158((void *)&_mh_execute_header, v1, v2, "stat on %s returned %s", v3, v4, v5, v6, 2u);
  sub_100007120();
}

void sub_100017F40()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100007150();
  sub_100007148(v0);
  sub_100007184();
  sub_100007158((void *)&_mh_execute_header, v1, v2, "stat on %s returned %s\n", v3, v4, v5, v6, 2u);
  sub_100007120();
}

void sub_100017FB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "could not open or create sysstatus should check file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100017FE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "could not close reboot time file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018010()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Corrupt system hwm state file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_10001803C(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_100007150();
  sub_100007148(v2);
  sub_10000716C();
  sub_10000712C((void *)&_mh_execute_header, a1, v3, "Failed to remove system hwm state file: %s", v4);
  sub_100007120();
}

void sub_1000180B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "could not open reboot time file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000180DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "could not create reboot log once per boot file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018108()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Failed to write SystemMemoryReset report", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018134()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "could not close reboot log once per boot file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018160(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "utimes returned %d", (uint8_t *)v3, 8u);
  sub_100007198();
}

void sub_1000181E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007178();
  sub_100007138((void *)&_mh_execute_header, v0, v1, "Failed to set kern.darkboot: %d", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018248()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Unable to retrieve processes size for retrieving SpringBoard PID", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018274(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = 0;
  sub_10000712C((void *)&_mh_execute_header, a1, a3, "sysctl for retrieving all processes returned a size of %ld", (uint8_t *)&v3);
  sub_100007198();
}

void sub_1000182E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "could not allocate memory for the processes buffer", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_10001830C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Unable to retrieve processes list", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018338()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Got empty process list", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018364()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not find Springboard. Bailing out", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018390()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Unable to get SpringBoard memlimit properties", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000183BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Unable to restore SpringBoard's original memory limits", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000183E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not find SpringBoard watchdog port", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018414(NSObject *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = sub_100007150();
  sub_100007148(v4);
  sub_10000716C();
  sub_10000712C((void *)&_mh_execute_header, a1, v5, "Unable to set temp hard memory limits on SpringBoard: %s", v6);
  *a2 = qword_100024F80;
  sub_100007120();
}

void sub_10001849C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Unable to retrieve vm statistics after compressor sweep", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000184C8(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_100007150();
  sub_100007148(v2);
  sub_10000716C();
  sub_10000712C((void *)&_mh_execute_header, a1, v3, "Unable to perform compressor sweep: %s", v4);
  sub_100007120();
}

void sub_10001853C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Unable to retrieve vm statistics before compressor sweep", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018568()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Error calling mach_memory_info", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Error collecting vm region information", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000185C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Error collecting zone information", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000185EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100007178();
  sub_100007138((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to log error, message not from kernel: audit_pid %d", v1, v2, v3, v4, v5);
  sub_100003BE4();
}

void sub_100018654(int a1)
{
  uint8_t v1[16];

  _os_assumes_log(a1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set context for inbound notifications on the mach port", v1, 2u);
  }
  sub_100003BE4();
}

void sub_1000186B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not open reboot log file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000186DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Failed to write SystemMemoryReset report for KHWM reboot", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018708(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  sub_10000712C((void *)&_mh_execute_header, a2, a3, "Read KHWM reboot file, wired_memory_pages=%llu", (uint8_t *)&v4);
  sub_100007198();
}

void sub_100018774()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not write reboot count", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000187A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Failed to remove /var/mobile/Library/Logs/khwm.log", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000187CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Failed to read from reboot log file", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000187F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not get a jetsam snapshot", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not set the status to DEFER", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018850()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Unable to acquire mach service port, exiting", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_10001887C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
  sub_1000079E8((void *)&_mh_execute_header, v0, v1, "Top level listener XPC_ERROR_CONNECTION_INVALID: %s", v2, v3, v4, v5, 2u);
  sub_100007120();
}

void sub_100018900()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
  sub_1000079E8((void *)&_mh_execute_header, v0, v1, "Top level listener XPC_ERROR_TERMINATION_IMMINENT: %s", v2, v3, v4, v5, 2u);
  sub_100007120();
}

void sub_100018984(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_1000079E8((void *)&_mh_execute_header, v1, v2, "Top level listener error: %s", v3, v4, v5, v6, 2u);
  sub_100007120();
}

void sub_100018A00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Top level event: Unhandled xpc type", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018A2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not get current pressure level", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018A58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Could not get current jetsam snapshot", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018A84()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Warning: writing user hwm state while a system hwm state file exists", v0, 2u);
}

void sub_100018AC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve memory size", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018AF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "no kext info", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018B20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "kext not found", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018B4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve collectable bytes", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018B78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve zone memory info", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018BA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve memory level", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100018BD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014584((void *)&_mh_execute_header, a2, a3, "database %s is corrupted", a5, a6, a7, a8, 2u);
  sub_100007198();
}

void sub_100018C38(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007138((void *)&_mh_execute_header, a2, a3, "failed to recreate database file after deletion, rc: %d", a5, a6, a7, a8, 0);
  sub_100003BE4();
}

void sub_100018C9C(uint64_t a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;

  v4 = *__error();
  v6 = 136315394;
  v7 = a1;
  v8 = 1024;
  v9 = v4;
  sub_100014564((void *)&_mh_execute_header, a2, v5, "failed to remove %s, errno: %d", (uint8_t *)&v6);
}

void sub_100018D30(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 136315394;
  v4 = a1 + 100;
  v5 = 1024;
  v6 = a2;
  sub_100014564((void *)&_mh_execute_header, a3, (uint64_t)a3, "failed to close connection to %s, rc: %d", (uint8_t *)&v3);
  sub_100007198();
}

void sub_100018DAC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007138((void *)&_mh_execute_header, a2, a3, "One of the prepared statement preparations failed, combined rc: %d", a5, a6, a7, a8, 0);
  sub_100003BE4();
}

void sub_100018E10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014554((void *)&_mh_execute_header, a1, a3, "%s: failed to retrieve vm.vm_ecc_max_db_pages, using fallback limit of %d", a5, a6, a7, a8, 2u);
  sub_100007198();
}

void sub_100018E8C(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  int v8;

  v3 = 136315650;
  v4 = "initialize";
  v5 = 2080;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  sub_100014594((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: failed to open database %s, rc: %d", (uint8_t *)&v3);
}

void sub_100018F1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014570();
  sub_100014554((void *)&_mh_execute_header, v0, v1, "%s: failed with rc=%d", v2, v3, v4, v5, 2u);
  sub_100007198();
}

void sub_100018F88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014570();
  sub_100014554((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step(stmt_ue_preceded_by_ce_count) returned %d", v2, v3, v4, v5, 2u);
  sub_100007198();
}

void sub_100018FF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014570();
  sub_100014554((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100007198();
}

void sub_100019060()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014570();
  sub_100014554((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100007198();
}

void sub_1000190CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014570();
  sub_100014554((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100007198();
}

void sub_100019138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014570();
  sub_100014554((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100007198();
}

void sub_1000191A4(uint64_t a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;

  v4 = *__error();
  v6 = 136315650;
  v7 = "regenerate_retired_pages";
  v8 = 2080;
  v9 = a1;
  v10 = 1024;
  v11 = v4;
  sub_100014594((void *)&_mh_execute_header, a2, v5, "%s: Cannot open database file %s, errno %d", (uint8_t *)&v6);
}

void sub_10001924C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014584((void *)&_mh_execute_header, a2, a3, "Unable to open iodevicetree to read %s", a5, a6, a7, a8, 2u);
  sub_100007198();
}

void sub_1000192B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "CFStringCreateWithCString failed", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000192DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Incorrect valueRef's length", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100019308()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Retired database is corrupt. Regenerating it.", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100019334()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "Database directory doesn't exist.", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100019360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "error calling mach_memory_info", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_10001938C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "No ANE tag found", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000193B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "modelmanagerd model count query timeout, skipping ane abandonment check", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000193E4(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "is_model_loaded callback recieved %d", (uint8_t *)v2, 8u);
  sub_100003BE4();
}

void sub_100019454()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "modelmanagerd timeout in aquiring assertion, skipping ane abandonment check", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_100019480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003BEC();
  sub_100007110((void *)&_mh_execute_header, v0, v1, "failed to lookup pid of modelmanagerd", v2, v3, v4, v5, v6);
  sub_100003BE4();
}

void sub_1000194AC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1 - 1073741825;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ANE memory usage remained over threshold by %lld bytes", (uint8_t *)&v2, 0xCu);
}

void sub_100019528(int a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;

  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "terminate_with_reason failed with status = %d and errno %d", (uint8_t *)v5, 0xEu);
}

void sub_1000195C4(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 134218240;
  v4 = a1 - 1073741825;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ANE memory usage above abandonment threshold by %lld bytes, killing modelmanagerd (%d)", (uint8_t *)&v3, 0x12u);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

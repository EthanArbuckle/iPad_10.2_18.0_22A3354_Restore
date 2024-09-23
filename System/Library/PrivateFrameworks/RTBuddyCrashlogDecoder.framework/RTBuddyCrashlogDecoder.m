uint64_t RTK_scrlg_decode(uint64_t a1, _QWORD *a2, unint64_t a3, uint64_t a4, int a5)
{
  unint64_t v8;
  unint64_t v12;
  int v13;
  BOOL v14;
  BOOL v15;
  uint64_t v17;
  int *v18;
  int v19;
  uint64_t v20;
  int *v21;
  int v22;
  unsigned int *v23;
  unint64_t i;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;

  if (a3 < 0x20)
    return 1;
  v8 = *((unsigned int *)a2 + 2);
  if (v8 <= 0x1F)
  {
    RTK_scrlg_section_writer_add_error_string(a1, "Crash with invalid (short) log length.  Log %u bytes, Minimum valid length is %lu");
    return 1;
  }
  if (*(_DWORD *)a2 != 1129072709)
  {
    RTK_scrlg_section_writer_add_error_string(a1, "Crash with invalid header signature: 0x%x, should be 0x%x");
    return 1;
  }
  if (*((_BYTE *)a2 + 5) != 3)
  {
    RTK_scrlg_section_writer_add_error_string(a1, "Crash with unsupported log (major version: %u, should be %u)");
    return 1;
  }
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)a1, CFSTR("crashlog-version"), "%02u.%02u", 3, 3);
  if (*((unsigned int *)a2 + 2) > a3)
  {
    RTK_scrlg_section_writer_add_error_string(a1, "Crash with invalid log length.  Log %u bytes, buffer is %lu", *((_DWORD *)a2 + 2), a3);
    v8 = a3;
  }
  v12 = v8 - 32;
  v13 = *((_DWORD *)a2 + 3);
  if ((v13 & 0x100) != 0)
  {
    RTK_scrlg_section_writer_add_error_string(a1, "Incomplete crash log, IOP crashed during logging (%x)", *((_DWORD *)a2 + 3));
  }
  else if (v12 <= a3)
  {
    v14 = *a2 == *(_QWORD *)((char *)a2 + v12) && a2[1] == *(_QWORD *)((char *)a2 + v12 + 8);
    v15 = v14 && a2[2] == *(_QWORD *)((char *)a2 + v12 + 16);
    if (!v15 || a2[3] != *(_QWORD *)((char *)a2 + v12 + 24))
    {
      RTK_scrlg_section_writer_add_error_string(a1, "End header does not match log header, log might be corrupted (logSize=%zd %p %p)", v8 - 32, a2, (char *)a2 + v12);
      v12 = v8;
    }
  }
  v17 = 0;
  v18 = exception_name_table;
  do
  {
    v19 = *v18;
    v18 += 4;
    if (v13 == v19)
      break;
    ++v17;
  }
  while (v17 != 16);
  RTK_scrlg_section_writer_add_panic_string(a1, "%s", *(const char **)&exception_name_table[4 * v17 + 2]);
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)a1, CFSTR("exception"), "0x%x", v13);
  if ((v13 & 0x200) != 0)
  {
    v20 = 0;
    v21 = exception_name_table;
    do
    {
      v22 = *v21;
      v21 += 4;
      if (*((unsigned __int8 *)a2 + 24) == v22)
        break;
      ++v20;
    }
    while (v20 != 16);
    RTK_scrlg_section_writer_add_panic_string(a1, " nested %s @ 0x%08llx", *(const char **)&exception_name_table[4 * v20 + 2], a2[2]);
    RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)a1, CFSTR("nested-exception"), "0x%x", *((_DWORD *)a2 + 6));
  }
  if (v12 >= 0x21)
  {
    v23 = (unsigned int *)(a2 + 4);
    for (i = 32; i < v12; i += v28)
    {
      if (i + 16 > v12)
      {
        RTK_scrlg_section_writer_add_error_string(a1, "Section size error.  Section Header (%zu bytes) larger than remaining buffer (%lu bytes)");
        break;
      }
      v25 = v23[3];
      if (i + v25 > v12)
      {
        RTK_scrlg_section_writer_add_error_string(a1, "Section size error.  Signature %#0x, version %#0x, section (%u bytes) larger than remaining buffer (%lu bytes)");
        break;
      }
      if (v25 < 0x10)
      {
        RTK_scrlg_section_writer_add_error_string(a1, "Section size too small.  Signature %#0x, version %#0x, section (%u bytes) should be at least %lu bytes");
        break;
      }
      if (a5 >= 1)
      {
        v26 = 0;
        do
          v27 = RTK_scrlg_decoder_decode(*(_QWORD *)(a4 + 8 * v26++), a1, *v23, v23[2], (int)i + 16, (uint64_t)(v23 + 4), v23[3] - 16);
        while (v26 < a5 && (v27 & 1) == 0);
        if ((v27 & 1) != 0)
          goto LABEL_46;
        v25 = v23[3];
      }
      RTK_scrlg_decoder_decode((uint64_t)&rtkit_unknown_section_decoder, a1, *v23, v23[2], i + 16, (uint64_t)(v23 + 4), v25 - 16);
LABEL_46:
      v28 = v23[3];
      v23 = (unsigned int *)((char *)v23 + v28);
    }
  }
  RTK_scrlg_section_writer_add_string_object((CFMutableDictionaryRef *)a1, CFSTR("panic"), *(const void **)(a1 + 24));
  return 0;
}

CFMutableStringRef RTK_scrlg_section_writer_create@<X0>(CFMutableDictionaryRef *a1@<X8>)
{
  const __CFAllocator *v2;
  const CFArrayCallBacks *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFMutableStringRef result;
  char v12;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  *a1 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  a1[1] = CFArrayCreateMutable(v2, 0, MEMORY[0x24BDBD690]);
  a1[2] = CFArrayCreateMutable(v2, 0, v3);
  result = RTK_crashlog_string_create("", v4, v5, v6, v7, v8, v9, v10, v12);
  a1[3] = (CFMutableDictionaryRef)result;
  return result;
}

void RTK_scrlg_section_writer_destroy(CFTypeRef *a1)
{
  CFRelease(*a1);
  CFRelease(a1[2]);
  CFRelease(a1[3]);
  CFRelease(a1[1]);
}

uint64_t RTK_scrlg_section_writer_finalize(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 16)) >= 1)
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)a1, CFSTR("errors"), *(const void **)(a1 + 16));
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 8)) >= 1)
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)a1, CFSTR("sections"), *(const void **)(a1 + 8));
  return *(_QWORD *)a1;
}

void RTK_scrlg_section_writer_add_to_array(uint64_t a1, __CFArray *a2)
{
  const void *v3;

  v3 = (const void *)RTK_scrlg_section_writer_finalize(a1);
  CFArrayAppendValue(a2, v3);
}

void RTK_scrlg_section_writer_add_to_dictionary(uint64_t a1, __CFDictionary *a2, const void *a3)
{
  const void *v5;

  v5 = (const void *)RTK_scrlg_section_writer_finalize(a1);
  CFDictionaryAddValue(a2, a3, v5);
}

void RTK_scrlg_section_writer_add_error_string_object(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 16), a2);
}

void RTK_scrlg_section_writer_add_error_string(uint64_t a1, char *__format, ...)
{
  CFMutableStringRef v;
  va_list va;

  va_start(va, __format);
  v = RTK_crashlog_string_create_v(__format, va);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 16), v);
  CFRelease(v);
}

void RTK_scrlg_section_writer_add_panic_string_object(uint64_t a1, const __CFString *a2)
{
  RTK_crashlog_string_append_object(*(CFMutableStringRef *)(a1 + 24), a2);
}

void RTK_scrlg_section_writer_add_panic_string(uint64_t a1, char *__format, ...)
{
  const __CFString *v;
  va_list va;

  va_start(va, __format);
  v = RTK_crashlog_string_create_v(__format, va);
  RTK_crashlog_string_append_object(*(CFMutableStringRef *)(a1 + 24), v);
  CFRelease(v);
}

void RTK_scrlg_section_writer_add_string_object(CFMutableDictionaryRef *a1, const void *a2, const void *a3)
{
  CFDictionaryAddValue(*a1, a2, a3);
}

void RTK_scrlg_section_writer_add_string(CFMutableDictionaryRef *a1, const void *a2, char *__format, ...)
{
  CFMutableStringRef v;
  va_list va;

  va_start(va, __format);
  v = RTK_crashlog_string_create_v(__format, va);
  CFDictionaryAddValue(*a1, a2, v);
  CFRelease(v);
}

void RTK_scrlg_section_writer_add_string_n(CFMutableDictionaryRef *a1, const void *a2, const char *a3, size_t a4)
{
  CFMutableStringRef n;

  n = RTK_crashlog_string_create_n(a3, a4);
  CFDictionaryAddValue(*a1, a2, n);
  CFRelease(n);
}

void RTK_scrlg_section_writer_add_number(CFMutableDictionaryRef *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(*a1, a2, v5);
  CFRelease(v5);
}

BOOL RTK_scrlg_section_supported_default(uint64_t a1, int a2, int a3)
{
  return *(_DWORD *)(a1 + 8) == a2 && ((*(_DWORD *)(a1 + 12) ^ a3) & 0xFF00) == 0;
}

uint64_t RTK_scrlg_decoder_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  int v10;
  unsigned int v11;
  uint64_t v14;
  const void *v15;
  __int128 v17;
  CFStringRef appendedString[2];

  v10 = a4;
  v11 = a3;
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, a4);
  if ((_DWORD)v14)
  {
    v17 = 0u;
    *(_OWORD *)appendedString = 0u;
    RTK_scrlg_section_writer_create((CFMutableDictionaryRef *)&v17);
    RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)&v17, (const void *)kRTBuddyCrashlogSectionName, "%s", *(const char **)a1);
    RTK_scrlg_section_writer_add_number((CFMutableDictionaryRef *)&v17, (const void *)kRTBuddyCrashlogSectionOffset, a5);
    RTK_scrlg_section_writer_add_number((CFMutableDictionaryRef *)&v17, (const void *)kRTBuddyCrashlogSectionSize, a7);
    RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)&v17, (const void *)kRTBuddyCrashlogSectionSignature, "%c%c%c%c", HIBYTE(v11), BYTE2(v11), BYTE1(v11), v11);
    RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)&v17, (const void *)kRTBuddyCrashlogSectionVersion, "%08x", v10);
    (*(void (**)(uint64_t, __int128 *, uint64_t, uint64_t))(a1 + 24))(a1, &v17, a6, a7);
    v15 = (const void *)RTK_scrlg_section_writer_finalize((uint64_t)&v17);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), v15);
    RTK_crashlog_string_append_object(*(CFMutableStringRef *)(a2 + 24), appendedString[1]);
    RTK_scrlg_section_writer_destroy((CFTypeRef *)&v17);
  }
  return v14;
}

void _rtk_time_section_decode(int a1, CFMutableDictionaryRef *a2, _QWORD *a3)
{
  RTK_scrlg_section_writer_add_string(a2, CFSTR("time"), "0x%016llx", *a3);
}

void _rtk_version_section_decode(uint64_t a1, CFMutableDictionaryRef *a2, uint64_t a3, uint64_t a4)
{
  char out[48];
  unsigned __int8 uu[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  RTK_scrlg_section_writer_add_string_n(a2, CFSTR("version"), (const char *)(a3 + 24), a4 - 24);
  memset(out, 0, 37);
  *(_OWORD *)uu = *(_OWORD *)a3;
  uuid_unparse_lower(uu, out);
  RTK_scrlg_section_writer_add_string(a2, CFSTR("uuid"), "%s", out);
}

void _rtk_product_version_section_decode(uint64_t a1, CFMutableDictionaryRef *a2, const char *a3, uint64_t a4)
{
  int v7;
  const char *v8;
  const char *v9;
  const char *v10;
  size_t v11;

  v8 = a3 + 16;
  v7 = *(unsigned __int8 *)a3;
  v9 = "Other";
  if (v7 == 2)
    v9 = "Debug";
  if (v7 == 1)
    v10 = "Release";
  else
    v10 = v9;
  if (v7 == 1)
    v11 = 7;
  else
    v11 = 5;
  RTK_scrlg_section_writer_add_string_n(a2, CFSTR("Build"), v10, v11);
  RTK_scrlg_section_writer_add_string_n(a2, CFSTR("Machine"), a3 + 1, 0xFuLL);
  RTK_scrlg_section_writer_add_string_n(a2, CFSTR("OS version"), v8, a4 - 16);
}

void _rtk_callstack_section_decode(int a1, CFMutableDictionaryRef *a2, uint64_t a3, uint64_t a4)
{
  if ((*(_BYTE *)(a3 + 7) & 0x10) != 0)
    RTK_scrlg_section_writer_add_string(a2, CFSTR("stack-description"), "Faulting Int Call Stack:");
  else
    RTK_scrlg_section_writer_add_string(a2, CFSTR("stack-description"), "Faulting task %u Call Stack:");
  _rtk_callstack_decode(a2, (_QWORD *)(a3 + 8), (unint64_t)(a4 + 0x7FFFFFFF8) >> 3);
}

void _rtk_string_section_decode(uint64_t a1, CFMutableDictionaryRef *a2, uint64_t a3, uint64_t a4)
{
  CFMutableStringRef n;
  const char *CStringPtr;

  n = RTK_crashlog_string_create_n((const char *)(a3 + 4), a4 - 4);
  RTK_scrlg_section_writer_add_string_object(a2, CFSTR("contents"), n);
  if ((*(_BYTE *)a3 & 1) != 0)
  {
    CStringPtr = CFStringGetCStringPtr(n, 0x8000100u);
    RTK_scrlg_section_writer_add_panic_string((uint64_t)a2, " - %s", CStringPtr);
  }
  CFRelease(n);
}

uint64_t _rtk_unknown_section_supported()
{
  return 1;
}

void _rtk_tasks_section_decode(uint64_t a1, CFMutableDictionaryRef *a2, uint64_t a3, unint64_t a4)
{
  __CFArray *Mutable;
  const __CFString *n;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  const char *CStringPtr;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v18;
  _OWORD v19[2];

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (a4 >= 0x49)
  {
    v18 = (a4 - 72) >> 3;
    do
    {
      memset(v19, 0, sizeof(v19));
      RTK_scrlg_section_writer_create((CFMutableDictionaryRef *)v19);
      n = RTK_crashlog_string_create_n((const char *)(a3 + 44), 0x1CuLL);
      v8 = n;
      if (*(int *)a3 < 0)
        v9 = "*";
      else
        v9 = " ";
      v10 = *(_DWORD *)a3 & 0x7FFFFFFF;
      CStringPtr = CFStringGetCStringPtr(n, 0x8000100u);
      v12 = *(_DWORD *)(a3 + 8);
      if (!v12)
        v12 = *(_DWORD *)(a3 + 4);
      v13 = *(_DWORD *)(a3 + 12);
      if (v13 >= 6)
        v13 = 6;
      RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)v19, CFSTR("description"), "%s%2lu %s | %03d/%03d | %5llu/%-5llu | %s | %#llx", v9, v10, CStringPtr, *(_DWORD *)(a3 + 4), v12, *(_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 24), _rtk_tasks_decode_status_status_map[v13], *(_QWORD *)(a3 + 16));
      CFRelease(v8);
      v14 = *(unsigned int *)(a3 + 40);
      v15 = 8 * v14 + 72;
      if (a4 >= v15)
      {
        if ((_DWORD)v14)
        {
          if (v18 < v14)
          {
            RTK_scrlg_section_writer_add_error_string((uint64_t)v19, "warning: stack truncated, may indicate corruption.");
            LODWORD(v14) = v18;
          }
          _rtk_callstack_decode((CFMutableDictionaryRef *)v19, (_QWORD *)(a3 + 72), v14);
        }
      }
      else
      {
        RTK_scrlg_section_writer_add_error_string((uint64_t)v19, " - Invalid call stack, Depth of %u (%lu bytes) with %zu bytes remaining", v14, 4 * v14, a4);
      }
      if (v15 >= a4)
        v16 = a4;
      else
        v16 = v15;
      a4 -= v16;
      a3 += v16;
      RTK_scrlg_section_writer_add_to_array((uint64_t)v19, Mutable);
      RTK_scrlg_section_writer_destroy((CFTypeRef *)v19);
    }
    while (a4 > 0x48);
  }
  CFDictionaryAddValue(*a2, CFSTR("tasks"), Mutable);
  CFRelease(Mutable);
}

void _rtk_mailbox_section_decode(int a1, CFMutableDictionaryRef *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  unint64_t v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  char v31;
  CFMutableDictionaryRef *v32;
  char __str[16];
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  RTK_scrlg_section_writer_add_string(a2, CFSTR("route-number"), "%d", *(_DWORD *)(a3 + 24));
  RTK_scrlg_section_writer_add_string(a2, CFSTR("mailbox-error"), "%d", *(_DWORD *)(a3 + 16));
  *(_OWORD *)__str = 0u;
  v34 = 0u;
  RTK_scrlg_section_writer_create((CFMutableDictionaryRef *)__str);
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)__str, CFSTR("AKF_KIC_INBOX_CTRL"), "0x%08x", *(_DWORD *)a3);
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)__str, CFSTR("AKF_KIC_MAILBOX_SET"), "0x%08x", *(_DWORD *)(a3 + 4));
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)__str, CFSTR("AKF_AP_OUTBOX_CTRL"), "0x%08x", *(_DWORD *)(a3 + 8));
  if ((*(_BYTE *)(a3 + 16) & 4) == 0)
    RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)__str, CFSTR("AKF_AP_MAILBOX_SET"), "0x%08x", *(_DWORD *)(a3 + 12));
  RTK_scrlg_section_writer_add_to_dictionary((uint64_t)__str, *a2, CFSTR("registers"));
  RTK_scrlg_section_writer_destroy((CFTypeRef *)__str);
  v14 = *(_DWORD *)(a3 + 16);
  if (v14)
  {
    if ((v14 & 1) != 0)
      RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "INBOX not ready");
    if ((v14 & 2) != 0)
      RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "OUTBOX not ready");
    if ((*(_BYTE *)(a3 + 2) & 8) != 0)
    {
      RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "INBOX overflow");
      if ((*(_BYTE *)(a3 + 2) & 8) != 0)
        RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "INBOX underflow");
    }
    v15 = *(_DWORD *)(a3 + 8);
    if ((v15 & 0x40000) != 0)
    {
      RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "OUTBOX overflow");
      v15 = *(_DWORD *)(a3 + 8);
    }
    if ((v15 & 0x80000) != 0)
      RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "OUTBOX under");
  }
  if (a4 > 0x1B)
  {
    v32 = a2;
    v16 = a4 - 28;
    v17 = RTK_crashlog_string_create("    dir   endpoint      epnum timestamp           msg\n    ====  ============  ===== ==================  ==================", v7, v8, v9, v10, v11, v12, v13, v31);
    if ((v16 / 0x18))
    {
      v18 = 0;
      do
      {
        v19 = a3 + 24 * v18;
        v20 = *(_DWORD *)(v19 + 28);
        if ((*(_QWORD *)(v19 + 44) & 1) != 0)
          v21 = "[RX]";
        else
          v21 = "[TX]";
        if ((v20 - 32) >= 0xDF)
        {
          v29 = 0;
          while ((unsigned __int16)mbi_endpoint_names[v29] != v20)
          {
            v29 += 8;
            if (v29 == 96)
            {
              snprintf(__str, 0xCuLL, "unknown%02d");
              goto LABEL_30;
            }
          }
          __strlcpy_chk();
        }
        else
        {
          snprintf(__str, 0xCuLL, "user%02d");
        }
LABEL_30:
        v30 = RTK_crashlog_string_create("\n    %4s %12s %7u 0x%016llx  0x%016llx", v22, v23, v24, v25, v26, v27, v28, (char)v21);
        RTK_crashlog_string_append_object(v17, v30);
        CFRelease(v30);
        ++v18;
      }
      while (v18 != (v16 / 0x18));
    }
    RTK_scrlg_section_writer_add_string_object(v32, CFSTR("log"), v17);
    CFRelease(v17);
  }
  else
  {
    RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "Section size too small.  Got %zu, expected >= %zu", a4, 0x1CuLL);
  }
}

void _rtk_armv8_registers_section_decode(int a1, CFMutableDictionaryRef *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  BOOL v15;
  char v16;
  int *v17;
  int v18;
  int v19;
  uint64_t i;
  char v22;

  if (a4 > 7)
  {
    if (*(_DWORD *)(a3 + 4) == 828)
    {
      if (a4 > 0x343)
      {
        if ((*(_DWORD *)a3 & 0x10000) == 0)
        {
          v10 = *(_DWORD *)a3;
          v11 = *(_DWORD *)(a3 + 832) >> 26;
          v12 = RTK_crashlog_string_create("", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v22);
          v13 = v12;
          v15 = v10 == 4 && v11 == 47 || v10 == 10;
          v16 = v15;
          if (v15 || (RTK_crashlog_string_append(v12, " pc=%#018llx", *(_QWORD *)(a3 + 264)), v10 <= 0x1F))
          {
            v17 = &v8_Exception_class_table;
            do
            {
              v19 = *v17;
              v17 += 4;
              v18 = v19;
            }
            while (v19 != v11 && v18 != -1);
            RTK_crashlog_string_append(v13, " Exception class=%#04x (%s), IL=%u, iss=%#x", v11, *((const char **)v17 - 1), (*(_DWORD *)(a3 + 832) >> 25) & 1, *(_DWORD *)(a3 + 832) & 0x1FFFFFF);
            if ((v16 & 1) == 0)
            {
              RTK_crashlog_string_append(v13, " far=%#018llx", *(_QWORD *)(a3 + 816));
              if (*(_QWORD *)(a3 + 824) != -1)
                RTK_crashlog_string_append(v13, " far_physical=%#018llx", *(_QWORD *)(a3 + 824));
            }
          }
          RTK_scrlg_section_writer_add_panic_string_object((uint64_t)a2, v13);
          RTK_crashlog_string_append(v13, "\n");
          for (i = 0; i != 30; ++i)
          {
            RTK_crashlog_string_append(v13, "  r%02d=%#018llx", i, *(_QWORD *)(a3 + 8 + 8 * i));
            if ((~(_DWORD)i & 3) == 0)
              RTK_crashlog_string_append(v13, "\n");
          }
          RTK_crashlog_string_append(v13, "\n   sp=%#018llx   lr=%#018llx   pc=%#018llx  psr=%#08x\n", *(_QWORD *)(a3 + 256), *(_QWORD *)(a3 + 248), *(_QWORD *)(a3 + 264), *(_DWORD *)(a3 + 272));
          RTK_crashlog_string_append(v13, "  psr=%#08x        cpacr=%#08x           fpsr=%#08x           fpcr=%#08x", *(_DWORD *)(a3 + 272), *(_DWORD *)(a3 + 280), *(_DWORD *)(a3 + 288), *(_DWORD *)(a3 + 296));
          RTK_scrlg_section_writer_add_string_object(a2, CFSTR("registers"), v13);
          CFRelease(v13);
        }
      }
      else
      {
        RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "Not enough data in section for a frame Got %zu bytes, expected %zu\n");
      }
    }
    else
    {
      RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "Wrong frame size for %s. Got %u bytes, expected %lu\n");
    }
  }
  else
  {
    RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "Invalid section size.  Expected >%zu, Got %zu\n");
  }
}

void _rtk_armvxm_registers_section_decode(int a1, CFMutableDictionaryRef *a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  const __CFString *v32;

  v10 = a3[1];
  if ((_DWORD)v10 == 232)
  {
    v17 = a3[4];
    v18 = a3[5];
    v19 = a3[6];
    v20 = a3[7];
    v21 = a3[2];
    v22 = a3[3];
    v23 = RTK_crashlog_string_create("ipsr=0x%08x(%s)", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, a3[5]);
    format_exception_string(v23, v18, v22, v21, v20, v19, v17);
    v24 = a3[33];
    v25 = a3[38];
    v26 = a3[39];
    v27 = a3[40];
    v28 = a3[41];
    v30 = a3[8];
    v29 = a3[9];
    v31 = "\n"
          "                  Faulting pc=0x%08x            \n"
          "  r00=0x%08x  r01=0x%08x  r02=0x%08x  r03=0x%08x\n"
          "  r04=0x%08x  r05=0x%08x  r06=0x%08x  r07=0x%08x\n"
          "  r08=0x%08x  r09=0x%08x  r10=0x%08x  r11=0x%08x\n"
          "  r12=0x%08x   sp=0x%08x   lr=0x%08x xpsr=0x%08x\n"
          "exret=0x%08x            fpscr=0x%08x";
  }
  else
  {
    if ((_DWORD)v10 != 96)
    {
      RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "Wrong frame size for ARMv7m. Got %U bytes, expected %lu or %lu\n", v10, 96, 232);
      return;
    }
    v11 = a3[4];
    v12 = a3[5];
    v13 = a3[6];
    v14 = a3[7];
    v15 = a3[2];
    v16 = a3[3];
    v23 = RTK_crashlog_string_create("ipsr=0x%08x(%s)", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v12);
    format_exception_string(v23, v11, v12, v16, v15, v14, v13);
    v24 = a3[17];
    v25 = a3[22];
    v26 = a3[23];
    v27 = a3[24];
    v28 = a3[25];
    v30 = a3[8];
    v29 = a3[9];
    v31 = "\n"
          "                  Faulting pc=0x%08x            \n"
          "  r00=0x%08x  r01=0x%08x  r02=0x%08x  r03=0x%08x\n"
          "  r04=0x%08x  r05=0x%08x  r06=0x%08x  r07=0x%08x\n"
          "  r08=0x%08x  r09=0x%08x  r10=0x%08x  r11=0x%08x\n"
          "  r12=0x%08x   sp=0x%08x   lr=0x%08x xpsr=0x%08x\n"
          "exret=0x%08x";
  }
  v32 = RTK_crashlog_string_create(v31, v24, v25, v26, v27, v28, v29, v30, v27);
  RTK_crashlog_string_append_object(v23, v32);
  RTK_scrlg_section_writer_add_string_object(a2, CFSTR("registers"), v23);
  CFRelease(v23);
  CFRelease(v32);
}

void _rtk_armv7a_registers_section_decode(int a1, CFMutableDictionaryRef *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFMutableStringRef v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;
  int v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  int *v20;
  int v21;
  int v22;
  int v23;
  char v25;
  char __str[64];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)a3 + 1) != 352)
    RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "Wrong frame size for %s. Got %u bytes (section), expected %lu\n", "ARMv7a", *((_DWORD *)a3 + 1), 352);
  if ((a3[2] & 1) == 0)
  {
    v10 = RTK_crashlog_string_create("", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v25);
    v11 = *a3;
    v12 = v11 > 0x23;
    v13 = (1 << v11) & 0x800000018;
    if (v12 || v13 == 0)
    {
      RTK_crashlog_string_append(v10, " pc=0x%08x ");
    }
    else
    {
      v15 = *((_DWORD *)a3 + 17);
      v16 = *((_DWORD *)a3 + 86);
      if ((v16 & 0x200) != 0)
      {
        v17 = *((_DWORD *)a3 + 86) & 0x3F;
        v19 = 4;
        v20 = &dword_24D5C0658;
        v18 = &fsr_long_descriptor_table;
        while ((*((_DWORD *)a3 + 86) & 0x3C) != v19)
        {
          v21 = *v20;
          v20 += 4;
          v19 = v21;
          if (v21 == -1)
            goto LABEL_13;
        }
        snprintf(__str, 0x40uLL, "%s level %u", *((const char **)v20 - 1), *((_DWORD *)a3 + 86) & 3);
      }
      else
      {
        v17 = *((_DWORD *)a3 + 86) & 0xF | (16 * ((*((_DWORD *)a3 + 86) >> 10) & 1));
        v18 = &fsr_short_descriptor_table;
        do
        {
LABEL_13:
          v23 = *v18;
          v18 += 4;
          v22 = v23;
        }
        while (v17 != v23 && v22 != -1);
        __strlcpy_chk();
      }
      RTK_crashlog_string_append(v10, " pc=%#010x  fsr=%#010x (%s)  far=%#010x ", v15, v16, __str, *((_DWORD *)a3 + 87));
      if (*((_QWORD *)a3 + 44) != -1)
        RTK_crashlog_string_append(v10, "  far_physical=%#018llx ");
    }
    RTK_scrlg_section_writer_add_panic_string_object((uint64_t)a2, v10);
    RTK_crashlog_string_append(v10, "  r00=0x%08x  r01=0x%08x  r02=0x%08x  r03=0x%08x\n  r04=0x%08x  r05=0x%08x  r06=0x%08x  r07=0x%08x\n  r08=0x%08x  r09=0x%08x  r10=0x%08x  r11=0x%08x\n  r12=0x%08x   sp=0x%08x   lr=0x%08x   pc=0x%08x\n  psr=0x%08x\n", *((_DWORD *)a3 + 2), *((_DWORD *)a3 + 3), *((_DWORD *)a3 + 4), *((_DWORD *)a3 + 5), *((_DWORD *)a3 + 6), *((_DWORD *)a3 + 7), *((_DWORD *)a3 + 8), *((_DWORD *)a3 + 9), *((_DWORD *)a3 + 10), *((_DWORD *)a3 + 11), *((_DWORD *)a3 + 12), *((_DWORD *)a3 + 13), *((_DWORD *)a3 + 14),
      *((_DWORD *)a3 + 15),
      *((_DWORD *)a3 + 16),
      *((_DWORD *)a3 + 17),
      *((_DWORD *)a3 + 18));
    RTK_scrlg_section_writer_add_string_object(a2, CFSTR("registers"), v10);
    CFRelease(v10);
  }
}

void _rtk_asc_async_info_registers_section_decode(uint64_t a1, CFMutableDictionaryRef *a2, uint64_t *a3)
{
  uint64_t v6;
  const char *v7;
  const char *v8;

  v6 = *a3;
  if ((*a3 & 0x14) != 0)
  {
    v7 = (const char *)((unint64_t)"single" & (v6 << 61 >> 63));
    v8 = "double and single";
    if ((v6 & 4) == 0)
      v8 = "double";
    if ((v6 & 0x10) != 0)
      v7 = v8;
    RTK_scrlg_section_writer_add_error_string((uint64_t)a2, "ASC L2C %s bit error l2c_err_sts %#018llx, l2c_err_adr %#018llx, l2c_err_inf %#018llx,", v7, v6, a3[1], a3[2]);
    v6 = *a3;
  }
  RTK_scrlg_section_writer_add_string(a2, CFSTR("description"), "l2c_err_sts %#018llx, l2c_err_adr %#018llx, l2c_err_inf %#018llx\nlsu_err_sts %#018llx, fed_err_sts %#018llx, mmu_err_sts %#018llx", v6, a3[1], a3[2], a3[3], a3[4], a3[5]);
  if ((*(_WORD *)(a1 + 12) & 0xFEFF) != 0)
    RTK_scrlg_section_writer_add_string(a2, CFSTR("description"), "\ndpc_err_sts %#018llx", a3[6]);
}

void _rtk_statistics_section_decode(int a1, CFMutableDictionaryRef *a2, uint64_t a3)
{
  RTK_scrlg_section_writer_add_string(a2, CFSTR("contents"), "sleep-count = %llu\nwake-count = %llu\nduty-cycle = %u", *(_QWORD *)a3, *(_QWORD *)(a3 + 8), *(unsigned __int8 *)(a3 + 16));
}

void _rtk_autobkp_section_decode(int a1, CFMutableDictionaryRef *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  RTK_scrlg_section_writer_add_string(a2, CFSTR("size"), "%zu", a4);
  hexDataPrint(a2, a3, a4, v7, v8, v9, v10, v11);
}

void _rtk_spi_flash_section_decode(int a1, CFMutableDictionaryRef *a2, __int128 *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  int v8;
  int v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  if (a4 >= 0x28)
  {
    v15 = v4;
    v16 = v5;
    v11 = *a3;
    v12 = a3[1];
    v7 = a3[3];
    v13 = a3[2];
    v14 = v7;
    v8 = BYTE3(v11) & 1;
    if ((BYTE3(v11) & 2) != 0)
      v8 = 2;
    if ((BYTE3(v11) & 4) != 0)
      v9 = 4;
    else
      v9 = v8;
    RTK_scrlg_section_writer_add_string(a2, CFSTR("manufacturer"), "%02x", v11);
    RTK_scrlg_section_writer_add_string(a2, CFSTR("device"), "%04x", *(unsigned __int16 *)((char *)&v11 + 1));
    RTK_scrlg_section_writer_add_number(a2, CFSTR("size"), SDWORD1(v11));
    if ((BYTE3(v11) & 8) != 0)
      v10 = 4;
    else
      v10 = 3;
    RTK_scrlg_section_writer_add_number(a2, CFSTR("address-length"), v10);
    RTK_scrlg_section_writer_add_number(a2, CFSTR("bus-width"), v9);
    RTK_scrlg_section_writer_add_number(a2, CFSTR("awake"), BYTE8(v11) & 1);
    RTK_scrlg_section_writer_add_number(a2, CFSTR("busy"), (DWORD2(v11) >> 1) & 1);
    RTK_scrlg_section_writer_add_number(a2, CFSTR("polling"), (DWORD2(v11) >> 2) & 1);
    _rtk_spi_flash_operation_decode(a2, CFSTR("last-transaction"), (uint64_t)&v12);
    _rtk_spi_flash_operation_decode(a2, CFSTR("current-transaction"), (uint64_t)&v13);
    _rtk_spi_flash_operation_decode(a2, CFSTR("suspended-transaction"), (uint64_t)&v14);
  }
}

void _rtk_hex_section_decode(int a1, CFMutableDictionaryRef *a2, const char *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  RTK_scrlg_section_writer_add_string(a2, CFSTR("title"), "%.*s", 8, a3);
  hexDataPrint(a2, (uint64_t)(a3 + 8), a4 - 8, v7, v8, v9, v10, v11);
}

void _rtk_callstack_decode(CFMutableDictionaryRef *a1, _QWORD *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFArray *i;
  const char *v14;
  CFMutableStringRef v15;
  CFMutableStringRef v16;

  for (i = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]); a3; --a3)
  {
    if (*(_BYTE *)a2 == 0xFF)
    {
      if (*a2 >= 0x100uLL)
        v14 = "unknown";
      else
        v14 = "ok";
      v15 = RTK_crashlog_string_create("%s", v6, v7, v8, v9, v10, v11, v12, (char)v14);
    }
    else
    {
      v15 = RTK_crashlog_string_create("%#018llx", v6, v7, v8, v9, v10, v11, v12, *a2);
    }
    v16 = v15;
    CFArrayAppendValue(i, v15);
    CFRelease(v16);
    ++a2;
  }
  if (CFArrayGetCount(i) > 0)
    CFDictionaryAddValue(*a1, CFSTR("stack"), i);
  CFRelease(i);
}

void format_exception_string(__CFString *a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, int a7)
{
  __int16 v10;

  switch(a3)
  {
    case 3:
      if (a7 == -559039827)
        break;
      v10 = a5;
      RTK_crashlog_string_append(a1, " hfsr=%#010x cfsr=%#010x", a7, a5);
      if ((v10 & 0xFF00) != 0)
      {
        RTK_crashlog_string_append(a1, " bfar=%#010x");
      }
      else if ((_BYTE)v10)
      {
        RTK_crashlog_string_append(a1, " mmfar=%#010x");
      }
      goto LABEL_13;
    case 4:
      RTK_crashlog_string_append(a1, " cfsr=%#010x mmfar=%#010x");
      break;
    case 5:
      RTK_crashlog_string_append(a1, " cfsr=%#010x bfar=%#010x");
      break;
    case 6:
    case 12:
      RTK_crashlog_string_append(a1, " cfsr=%#010x");
      break;
    default:
      break;
  }
  if (a6 == -559039827 && a7 == -559039827)
    RTK_crashlog_string_append(a1, " control=0x%08x primask=0x%08x");
  else
LABEL_13:
    RTK_crashlog_string_append(a1, " control=0x%08x primask=0x%08x basepri=0x%08x fltmsk=0x%08x");
}

void hexDataPrint(CFMutableDictionaryRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  CFMutableStringRef v11;
  CFMutableStringRef v12;
  uint64_t v13;
  __int128 v14;
  int v15;
  unint64_t v16;
  char *v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  char *v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  const char *v28;
  char v29;
  __CFString *cf;
  uint64_t v31;
  int v32;
  char __str[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];

  v8 = a3;
  v41[0] = *MEMORY[0x24BDAC8D0];
  v11 = RTK_crashlog_string_create("", a2, a3, a4, a5, a6, a7, a8, v29);
  v12 = v11;
  if (v8)
  {
    v13 = 0;
    v14 = 0uLL;
    cf = v11;
    v31 = (uint64_t)a1;
LABEL_3:
    v39 = v14;
    v40 = v14;
    v37 = v14;
    v38 = v14;
    v35 = v14;
    v36 = v14;
    *(_OWORD *)__str = v14;
    v34 = v14;
    v32 = v13;
    v15 = snprintf(__str, 0x80uLL, "%08x", v13);
    if ((v15 & 0x80000000) == 0)
    {
      v16 = 0;
      v17 = &__str[v15];
      while (1)
      {
        v18 = (char *)(__str - v17 + 128);
        v19 = v8 <= v16 ? snprintf(v17, (size_t)v18, "%s   ") : snprintf(v17, (size_t)v18, "%s %02x");
        if ((v19 & 0x80000000) != 0)
          break;
        v17 += v19;
        if (++v16 == 16)
        {
          v20 = snprintf(v17, (char *)v41 - v17, "  |");
          if ((v20 & 0x80000000) != 0)
            break;
          v21 = 0;
          v22 = &v17[v20];
          do
          {
            if (v8 > v21)
            {
              v23 = *(unsigned __int8 *)(a2 + (v32 + v21));
              if (*(char *)(a2 + (v32 + v21)) < 0)
                v24 = __maskrune(*(unsigned __int8 *)(a2 + (v32 + v21)), 0x40000uLL);
              else
                v24 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *(unsigned __int8 *)(a2 + (v32 + v21)) + 60) & 0x40000;
              if (v24)
                v25 = v23;
              else
                v25 = 46;
              v26 = snprintf(v22, (char *)v41 - v22, "%c", v25);
              if ((v26 & 0x80000000) != 0)
                goto LABEL_28;
              v22 += v26;
            }
            ++v21;
          }
          while (v21 != 16);
          v27 = 16;
          if (v8 < 0x10)
            v27 = v8;
          v13 = (v32 + v27);
          v8 -= v27;
          v28 = "\n";
          if (!v8)
            v28 = "";
          v12 = cf;
          RTK_crashlog_string_append(cf, "%s|%s", __str, v28);
          a1 = (CFMutableDictionaryRef *)v31;
          v14 = 0uLL;
          if (v8)
            goto LABEL_3;
          goto LABEL_27;
        }
      }
    }
LABEL_28:
    CFRelease(cf);
    RTK_scrlg_section_writer_add_error_string(v31, "Error encountered while formatting hex data");
  }
  else
  {
LABEL_27:
    RTK_scrlg_section_writer_add_string_object(a1, CFSTR("contents"), v12);
    CFRelease(v12);
  }
}

void _rtk_spi_flash_operation_decode(__CFDictionary **a1, const void *a2, uint64_t a3)
{
  _OWORD v6[2];

  memset(v6, 0, sizeof(v6));
  RTK_scrlg_section_writer_create((CFMutableDictionaryRef *)v6);
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)v6, CFSTR("type"), "%s", (&off_24D5C06E8)[*(_DWORD *)(a3 + 12) & 3]);
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)v6, CFSTR("started"), "0x%llx", *(_QWORD *)a3);
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)v6, CFSTR("address"), "0x%x", *(_DWORD *)(a3 + 8));
  RTK_scrlg_section_writer_add_string((CFMutableDictionaryRef *)v6, CFSTR("size"), "0x%x", *(_DWORD *)(a3 + 12) >> 2);
  RTK_scrlg_section_writer_add_to_dictionary((uint64_t)v6, *a1, a2);
  RTK_scrlg_section_writer_destroy((CFTypeRef *)v6);
}

const void *RTBuddyCrashlogDecode(const __CFData *a1)
{
  return RTBuddyCrashlogDecodeWithDecoders(a1, (uint64_t)RTK_crashlog_default_structured_decoders, 16);
}

const void *RTBuddyCrashlogDecodeWithDecoders(const __CFData *a1, uint64_t a2, int a3)
{
  UInt8 *BytePtr;
  CFIndex Length;
  const void *v8;
  _OWORD v10[2];

  memset(v10, 0, sizeof(v10));
  RTK_scrlg_section_writer_create((CFMutableDictionaryRef *)v10);
  BytePtr = (UInt8 *)CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  RTK_scrlg_decode((uint64_t)v10, BytePtr, Length, a2, a3);
  v8 = (const void *)RTK_scrlg_section_writer_finalize((uint64_t)v10);
  CFRetain(v8);
  RTK_scrlg_section_writer_destroy((CFTypeRef *)v10);
  return v8;
}

const __CFDictionary *RTBuddyCrashlogDecodeFindSectionBySignature(const __CFDictionary *a1, const __CFString *a2)
{
  const __CFArray *Value;
  CFIndex v4;
  unsigned int v5;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v7;

  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("sections"));
  if (CFArrayGetCount(Value) < 1)
    return 0;
  v4 = 0;
  v5 = 1;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v4);
    v7 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("section-signature"));
    if (CFStringCompare(a2, v7, 0) == kCFCompareEqualTo)
      break;
    v4 = v5;
    if (CFArrayGetCount(Value) <= v5++)
      return 0;
  }
  CFRetain(ValueAtIndex);
  return ValueAtIndex;
}

CFMutableStringRef RTK_crashlog_string_create(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return RTK_crashlog_string_create_v(a1, &a9);
}

CFMutableStringRef RTK_crashlog_string_create_v(char *__format, va_list a2)
{
  size_t v3;
  char *v4;
  const __CFAllocator *v5;
  const __CFString *v6;
  CFMutableStringRef MutableCopy;

  v3 = vsnprintf(0, 0, __format, a2) + 1;
  v4 = (char *)malloc_type_malloc(v3, 0x736BD07EuLL);
  vsnprintf(v4, v3, __format, a2);
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  if (!v6)
  {
    v6 = CFSTR("<undecodable>");
    CFRetain(CFSTR("<undecodable>"));
  }
  MutableCopy = CFStringCreateMutableCopy(v5, 0, v6);
  CFRelease(v6);
  return MutableCopy;
}

CFMutableStringRef RTK_crashlog_string_create_n(const char *a1, size_t a2)
{
  char *v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  CFMutableStringRef MutableCopy;

  v2 = strndup(a1, a2);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  if (!v4)
  {
    v4 = CFSTR("<undecodable>");
    CFRetain(CFSTR("<undecodable>"));
  }
  MutableCopy = CFStringCreateMutableCopy(v3, 0, v4);
  CFRelease(v4);
  return MutableCopy;
}

void RTK_crashlog_string_append_v(__CFString *a1, char *__format, va_list a3)
{
  const __CFString *v;

  v = RTK_crashlog_string_create_v(__format, a3);
  CFStringAppend(a1, v);
  CFRelease(v);
}

void RTK_crashlog_string_append(__CFString *a1, char *__format, ...)
{
  const __CFString *v;
  va_list va;

  va_start(va, __format);
  v = RTK_crashlog_string_create_v(__format, va);
  CFStringAppend(a1, v);
  CFRelease(v);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0340](uu, out);
}


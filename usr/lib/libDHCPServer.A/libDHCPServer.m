__CFArray *DHCPSDHCPLeaseListCreate()
{
  __CFArray *Mutable;
  unsigned int *v1;
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  uint64_t v4;
  unint64_t v5;
  __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;
  BOOL v12;
  double Current;
  int Count;
  CFIndex v15;
  __darwin_time_t tv_sec;
  uint64_t v17;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  const __CFString *v20;
  uint64_t v21;
  CFDateRef v22;
  timeval v24;
  CFIndex usedBufLen;
  UInt8 buffer[8];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFRange v30;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)buffer = 0;
  v27 = 0;
  v28 = 0;
  sub_215BA1408(buffer);
  sub_215BA141C((uint64_t)buffer, 104857600);
  if (!sub_215BA14E0((uint64_t)buffer, "/var/db/dhcpd_leases"))
    return 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v1 = *(unsigned int **)buffer;
  if (!*(_QWORD *)buffer)
    goto LABEL_24;
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  do
  {
    if (!*v1)
      goto LABEL_23;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = *((_QWORD *)v1 + 1);
      if (!*(_DWORD *)(v7 + v4 + 8))
        goto LABEL_17;
      if (!v6)
        v6 = CFDictionaryCreateMutable(0, 0, v2, v3);
      v8 = v7 + v4;
      v9 = sub_215BA1330(*(char **)(v7 + v4));
      v10 = sub_215BA1330(**(char ***)(v8 + 16));
      v11 = v10;
      if (v9)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (v12)
      {
        if (!v9)
        {
          if (!v10)
            goto LABEL_17;
LABEL_16:
          CFRelease(v11);
          goto LABEL_17;
        }
      }
      else
      {
        CFDictionarySetValue(v6, v9, v10);
      }
      CFRelease(v9);
      if (v11)
        goto LABEL_16;
LABEL_17:
      ++v5;
      v4 += 24;
    }
    while (v5 < *v1);
    if (v6)
    {
      CFArrayAppendValue(Mutable, v6);
      CFRelease(v6);
    }
LABEL_23:
    v1 = (unsigned int *)*((_QWORD *)v1 + 4);
  }
  while (v1);
LABEL_24:
  if (!CFArrayGetCount(Mutable))
  {
    CFRelease(Mutable);
    sub_215BA14A4((uint64_t *)buffer);
    return 0;
  }
  sub_215BA14A4((uint64_t *)buffer);
  if (Mutable)
  {
    v24.tv_sec = 0;
    *(_QWORD *)&v24.tv_usec = 0;
    gettimeofday(&v24, 0);
    Current = CFAbsoluteTimeGetCurrent();
    Count = CFArrayGetCount(Mutable);
    if (Count >= 1)
    {
      v15 = 0;
      tv_sec = v24.tv_sec;
      v17 = Count;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v15);
        Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("lease"));
        if (Value)
        {
          v20 = Value;
          usedBufLen = 0;
          v30.length = CFStringGetLength(Value);
          v30.location = 0;
          CFStringGetBytes(v20, v30, 0, 0, 0, buffer, 128, &usedBufLen);
          buffer[usedBufLen] = 0;
          v21 = strtol((const char *)buffer, 0, 0);
          v22 = CFDateCreate(0, Current + (double)(v21 - tv_sec));
          CFDictionarySetValue(ValueAtIndex, CFSTR("lease"), v22);
          CFRelease(v22);
        }
        ++v15;
      }
      while (v17 != v15);
    }
  }
  return Mutable;
}

const void *DHCPSCopyDisabledInterfaces()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;
  const void *v3;

  v0 = (const __CFDictionary *)SCDynamicStoreCopyValue(0, CFSTR("com.apple.bootpd.DHCPServer"));
  if (!v0)
    return 0;
  v1 = v0;
  Value = CFDictionaryGetValue(v0, CFSTR("DisabledInterfaces"));
  v3 = Value;
  if (Value)
    CFRetain(Value);
  CFRelease(v1);
  return v3;
}

CFStringRef sub_215BA1330(char *cStr)
{
  CFStringRef result;

  result = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!result)
    return CFStringCreateWithCString(0, cStr, 0);
  return result;
}

_QWORD *sub_215BA1378(unsigned int a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = malloc_type_malloc(0x30uLL, 0x10A0040A76AC297uLL);
  if (v4)
  {
    *v4 = sub_215BA1A30(a1, a2);
    v4[1] = v5;
    v4[4] = 0;
    v4[5] = 0;
  }
  return v4;
}

void sub_215BA13D8(uint64_t a1)
{
  sub_215BA19C8((unsigned int *)a1);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  free((void *)a1);
}

_QWORD *sub_215BA1408(_QWORD *result)
{
  result[1] = 0;
  result[2] = 0;
  *result = 0;
  *((_DWORD *)result + 4) = 256;
  return result;
}

void sub_215BA141C(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (a2 <= 10)
    v2 = 10;
  else
    v2 = a2;
  *(_DWORD *)(a1 + 16) = v2;
  v3 = *(_DWORD *)(a1 + 20);
  v4 = v3 - v2;
  if (v3 > v2)
  {
    if (v4 <= 0)
    {
      *(_QWORD *)(a1 + 8) = 0;
      v8 = (_QWORD *)a1;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 8);
      do
      {
        v7 = v6;
        v6 = *(_QWORD *)(v6 + 40);
        sub_215BA13D8(v7);
        --v4;
      }
      while (v4);
      *(_QWORD *)(a1 + 8) = v6;
      v8 = (_QWORD *)(v6 + 32);
      if (!v6)
        v8 = (_QWORD *)a1;
    }
    *v8 = 0;
    *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 16);
  }
}

uint64_t sub_215BA14A4(uint64_t *a1)
{
  uint64_t result;
  uint64_t v3;

  result = *a1;
  if (result)
  {
    do
    {
      v3 = *(_QWORD *)(result + 32);
      sub_215BA13D8(result);
      result = v3;
    }
    while (v3);
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

uint64_t sub_215BA14E0(uint64_t a1, char *__filename)
{
  FILE *v3;
  FILE *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  int v10;
  int v11;
  char *v12;
  int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  unsigned int v20;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char v29[768];
  char v30[128];
  char __s[2];
  unsigned __int8 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = 0;
  v3 = fopen(__filename, "r");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
LABEL_3:
    v7 = v6;
    while (1)
    {
      v8 = 1023;
      v9 = __s;
      do
      {
        v10 = fgetc(v4);
        if ((v10 + 1) < 2)
          break;
        if (v8 >= 1)
        {
          *v9++ = v10;
          --v8;
        }
      }
      while (v10 != 10);
      if (v9 == __s)
        break;
      *v9 = 0;
      ++v5;
      if (!(*(unsigned __int16 *)__s ^ 0xA7B | v32))
      {
        v6 = 1;
        if (v7 && v7 != 3)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "unexpected '{' at line %d\n");
          goto LABEL_35;
        }
        goto LABEL_3;
      }
      if (!(*(unsigned __int16 *)__s ^ 0xA7D | v32))
      {
        if ((v7 - 3) <= 0xFFFFFFFD)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "unexpected '}' at line %d\n");
          goto LABEL_35;
        }
        v6 = 3;
        if ((_DWORD)v23)
        {
          v17 = sub_215BA1378(v23, v24);
          if (v17)
          {
            v17[4] = 0;
            v18 = *(_QWORD *)(a1 + 8);
            v17[5] = v18;
            v19 = (_QWORD *)(v18 + 32);
            if (!*(_QWORD *)a1)
              v19 = (_QWORD *)a1;
            *v19 = v17;
            *(_QWORD *)(a1 + 8) = v17;
            ++*(_DWORD *)(a1 + 20);
          }
          sub_215BA19C8((unsigned int *)&v23);
          v6 = 3;
        }
        goto LABEL_3;
      }
      bzero(v29, 0x300uLL);
      v11 = strlen(__s);
      v12 = strchr(__s, 61);
      v13 = strspn(__s, " \t\n");
      if (v13 != v11)
      {
        if (v12)
        {
          v14 = (_DWORD)v12 - __s;
          v15 = v14 - v13;
          if (v14 - v13 >= 0x80)
          {
            v15 = 127;
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "property name truncated to %d bytes at line %d\n", 127, v5);
            v14 = (_DWORD)v12 - __s;
          }
          v16 = v11 - v14 - 2;
          if (v16 >= 0x300)
          {
            v16 = 767;
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "value truncated to %d bytes at line %d\n", 767, v5);
          }
          __strncpy_chk();
          v30[v15] = 0;
          __strncpy_chk();
          v29[v16] = 0;
          *((_QWORD *)&v27 + 1) = 0;
          v28 = 0;
          *(_QWORD *)&v27 = v30;
          sub_215BA1BA0((unsigned int *)&v27 + 2, v29, 0);
        }
        else
        {
          v20 = ~v13 + v11;
          if (v20 >= 0x80)
          {
            v20 = 127;
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "property name truncated to %d bytes at line %d\n", 127, v5);
          }
          __strncpy_chk();
          v30[v20] = 0;
          *((_QWORD *)&v27 + 1) = 0;
          v28 = 0;
          *(_QWORD *)&v27 = v30;
        }
        v25 = v27;
        v26 = v28;
        sub_215BA1898((unsigned int *)&v23, (uint64_t)&v25, 0xFFFFFFFFFFFFFFFFLL);
        sub_215BA1B38((_QWORD *)&v27 + 1);
        v6 = 2;
        goto LABEL_3;
      }
    }
    if ((v7 - 1) <= 1)
      fwrite("file ends prematurely\n", 0x16uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
LABEL_35:
    fclose(v4);
  }
  else
  {
    perror(__filename);
  }
  sub_215BA19C8((unsigned int *)&v23);
  return 1;
}

uint64_t sub_215BA1898(unsigned int *a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  unsigned int v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char **v12;
  const char *v13;
  uint64_t v14;
  const char **v15;
  char *v16;
  uint64_t result;
  char *v18;

  v6 = (void *)*((_QWORD *)a1 + 1);
  v7 = *a1 + 1;
  if (v6)
    v8 = (char *)malloc_type_realloc(v6, 24 * v7, 0x1090040D67CC068uLL);
  else
    v8 = (char *)malloc_type_malloc(24 * v7, 0x1090040D67CC068uLL);
  *((_QWORD *)a1 + 1) = v8;
  v9 = *a1;
  if (v9 <= a3)
  {
    a3 = *a1;
  }
  else
  {
    v10 = 24 * v9;
    do
    {
      v11 = *((_QWORD *)a1 + 1) + v10;
      --v9;
      *(_OWORD *)v11 = *(_OWORD *)(v11 - 24);
      *(_QWORD *)(v11 + 16) = *(_QWORD *)(v11 - 8);
      v10 -= 24;
    }
    while (v9 > a3);
    v8 = (char *)*((_QWORD *)a1 + 1);
  }
  v12 = (char **)&v8[24 * a3];
  v13 = *(const char **)a2;
  v14 = *(_QWORD *)(a2 + 8);
  v15 = *(const char ***)(a2 + 16);
  v16 = strdup(v13);
  result = sub_215BA1AC4(v14, v15);
  *v12 = v16;
  v12[1] = (char *)result;
  v12[2] = v18;
  ++*a1;
  return result;
}

void sub_215BA1998(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
  }
  sub_215BA1B38((_QWORD *)(a1 + 8));
}

void sub_215BA19C8(unsigned int *a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  v2 = (void *)*((_QWORD *)a1 + 1);
  if (v2)
  {
    if (*a1)
    {
      v3 = 0;
      v4 = 0;
      do
      {
        sub_215BA1998(*((_QWORD *)a1 + 1) + v3);
        ++v4;
        v3 += 24;
      }
      while (v4 < *a1);
      v2 = (void *)*((_QWORD *)a1 + 1);
    }
    free(v2);
    *(_QWORD *)a1 = 0;
    *((_QWORD *)a1 + 1) = 0;
  }
}

uint64_t sub_215BA1A30(unsigned int a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  const char ***v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v4 = (char *)malloc_type_malloc(24 * a1, 0x1090040D67CC068uLL);
  if (v3)
  {
    v5 = v4 + 16;
    v6 = (const char ***)(a2 + 16);
    v7 = v3;
    do
    {
      *(v5 - 2) = strdup((const char *)*(v6 - 2));
      *(v5 - 1) = sub_215BA1AC4(*(v6 - 1), *v6);
      *v5 = v8;
      v5 += 3;
      v6 += 3;
      --v7;
    }
    while (v7);
  }
  return v3;
}

uint64_t sub_215BA1AC4(unsigned int a1, const char **a2)
{
  uint64_t v3;
  char **v4;
  char **v5;
  uint64_t v6;
  const char *v7;

  v3 = a1;
  v4 = (char **)malloc_type_malloc(8 * a1, 0x10040436913F5uLL);
  if (v3)
  {
    v5 = v4;
    v6 = v3;
    do
    {
      v7 = *a2++;
      *v5++ = strdup(v7);
      --v6;
    }
    while (v6);
  }
  return v3;
}

void sub_215BA1B38(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  unint64_t i;
  uint64_t v5;
  void *v6;

  v2 = (void *)a1[1];
  if (v2)
  {
    v3 = *(unsigned int *)a1;
    if ((_DWORD)v3)
    {
      for (i = 0; i < v3; ++i)
      {
        v5 = a1[1];
        v6 = *(void **)(v5 + 8 * i);
        if (v6)
        {
          free(v6);
          *(_QWORD *)(v5 + 8 * i) = 0;
          v3 = *(unsigned int *)a1;
        }
      }
      v2 = (void *)a1[1];
    }
    free(v2);
    *a1 = 0;
    a1[1] = 0;
  }
}

char *sub_215BA1BA0(unsigned int *a1, const char *a2, unint64_t a3)
{
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *result;

  v6 = (void *)*((_QWORD *)a1 + 1);
  if (v6)
    v7 = malloc_type_realloc(v6, 8 * (*a1 + 1), 0x10040436913F5uLL);
  else
    v7 = malloc_type_malloc(8 * (*a1 + 1), 0x10040436913F5uLL);
  v8 = v7;
  *((_QWORD *)a1 + 1) = v7;
  v9 = *a1;
  v10 = v9;
  if (v9 > a3)
  {
    v11 = *a1;
    do
    {
      *(_QWORD *)(*((_QWORD *)a1 + 1) + 8 * v11) = *(_QWORD *)(*((_QWORD *)a1 + 1) + 8 * v11 - 8);
      --v11;
    }
    while (v11 > a3);
    v8 = (_QWORD *)*((_QWORD *)a1 + 1);
    v10 = a3;
  }
  result = strdup(a2);
  v8[v10] = result;
  *a1 = v9 + 1;
  return result;
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

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5670](store, key);
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x24BDAC920]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x24BDAE368](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
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

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFFC0](__s, __charset);
}


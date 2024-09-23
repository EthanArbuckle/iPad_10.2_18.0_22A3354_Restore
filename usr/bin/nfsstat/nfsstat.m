uint64_t sub_1000027F0(__CFDictionary *a1, const char *a2, const void *a3)
{
  __CFString *v6;
  __CFString *v7;

  if (a1 && a2 && a3)
  {
    v6 = sub_1000028B4(a2);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(a1, v6, a3);
      CFRelease(v7);
      return 0;
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_dict", a2);
      return 12;
    }
  }
  else
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_dict");
    return 22;
  }
}

__CFString *sub_1000028B4(const char *a1)
{
  __CFString *Mutable;
  __CFString *v3;
  CFRange v5;

  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  if (Mutable)
  {
    CFStringAppendCString(Mutable, a1, 0x8000100u);
    v5.length = CFStringGetLength(v3);
    v5.location = 0;
    CFStringFindAndReplace(v3, CFSTR("\n"), CFSTR(" "), v5, 0);
  }
  else
  {
    fprintf(__stderrp, "*** %s: CFStringCreateMutable failed \n", "create_cfstr");
  }
  return v3;
}

uint64_t sub_100002958(__CFDictionary *a1, const char *a2, const void *a3)
{
  __CFString *v6;
  __CFString *v7;

  if (a1 && a2 && a3)
  {
    v6 = sub_1000028B4(a2);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(a1, v6, a3);
      CFRelease(v7);
      return 0;
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_array", a2);
      return 12;
    }
  }
  else
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_array");
    return 22;
  }
}

uint64_t sub_100002A1C(__CFDictionary *a1, const char *a2, const void *a3, uint64_t a4)
{
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  CFNumberRef v12;
  CFNumberRef v13;

  if (!a1 || !a2 || !a3)
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_num");
    return 22;
  }
  v8 = sub_1000028B4(a2);
  if (!v8)
  {
    fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_num", a2);
    return 12;
  }
  v9 = v8;
  v10 = a4 - 1;
  if ((unint64_t)(a4 - 1) >= 8 || ((0x8Bu >> v10) & 1) == 0)
  {
    fprintf(__stderrp, "*** %s: Unsupported size %zu \n", "json_dict_add_num", a4);
    CFRelease(v9);
    return 22;
  }
  v12 = CFNumberCreate(0, qword_10000BD80[v10], a3);
  if (!v12)
  {
    fprintf(__stderrp, "*** %s: CFNumberCreate failed \n", "json_dict_add_num");
    CFRelease(v9);
    return 12;
  }
  v13 = v12;
  CFDictionarySetValue(a1, v9, v12);
  CFRelease(v9);
  CFRelease(v13);
  return 0;
}

uint64_t sub_100002B8C(__CFDictionary *a1, const char *a2, const char *a3)
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  if (a1 && a2 && a3)
  {
    v6 = sub_1000028B4(a2);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000028B4(a3);
      if (v8)
      {
        v9 = v8;
        CFDictionarySetValue(a1, v7, v8);
        CFRelease(v7);
        CFRelease(v9);
        return 0;
      }
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_str", a3);
      CFRelease(v7);
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_str", a2);
    }
    return 12;
  }
  else
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_str");
    return 22;
  }
}

uint64_t sub_100002C98(__CFArray *a1, const char *a2)
{
  __CFString *v4;
  __CFString *v5;

  if (a1 && a2)
  {
    v4 = sub_1000028B4(a2);
    if (v4)
    {
      v5 = v4;
      CFArrayAppendValue(a1, v4);
      CFRelease(v5);
      return 0;
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_arr_add_str", a2);
      return 12;
    }
  }
  else
  {
    fprintf(__stderrp, "*** %s: arr or value is null \n", "json_arr_add_str");
    return 22;
  }
}

uint64_t sub_100002D50(__CFArray *a1, const void *a2)
{
  if (a1 && a2)
  {
    CFArrayAppendValue(a1, a2);
    return 0;
  }
  else
  {
    fprintf(__stderrp, "*** %s: arr or value is null \n", "json_arr_add_dict");
    return 22;
  }
}

uint64_t sub_100002DA4(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v4 = objc_autoreleasePoolPush();
  if (!+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", a1))
  {
    fprintf(__stderrp, "*** %s: Invalid JSON object \n", "json_print_cf_object");
    NSLog(CFSTR("%@"), a1);
    v8 = 0;
    v6 = 0;
    v5 = 0;
    goto LABEL_6;
  }
  if (!a2)
  {
    v16 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a1, 3, &v16));
    v12 = v16;
    if (v12)
    {
      v8 = v12;
      NSLog(CFSTR("*** %s: dataWithJSONObject failed %@"), "json_print_cf_object", v12);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"));
      v15 = 0;
      objc_msgSend(v13, "writeData:error:", v9, &v15);
      v8 = v15;

      if (!v8)
      {
        v6 = 0;
        v5 = 0;
        goto LABEL_12;
      }
      NSLog(CFSTR("*** %s: fileHandleWithStandardOutput failed %@"), "json_print_cf_object", v8);
    }
    v6 = 0;
    v5 = 0;
    goto LABEL_7;
  }
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a2, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOutputStream outputStreamToFileAtPath:append:](NSOutputStream, "outputStreamToFileAtPath:append:", v5, 0));
  objc_msgSend(v6, "open");
  v14 = 0;
  +[NSJSONSerialization writeJSONObject:toStream:options:error:](NSJSONSerialization, "writeJSONObject:toStream:options:error:", a1, v6, 3, &v14);
  v7 = v14;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "close");
    v9 = 0;
LABEL_12:
    v10 = 0;
    goto LABEL_8;
  }
  NSLog(CFSTR("*** %s: writeJSONObject failed %@"), "json_print_cf_object", v7);
LABEL_6:
  v9 = 0;
LABEL_7:
  v10 = 22;
LABEL_8:

  objc_autoreleasePoolPop(v4);
  return v10;
}

uint64_t sub_100002FB8()
{
  return putchar(10);
}

uint64_t sub_100002FC0(uint64_t a1, uint64_t a2)
{
  if (a2)
    return printf("%s%s:\n");
  else
    return printf("%s");
}

uint64_t sub_10000300C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return printf("%s%s: 0x%x");
  else
    return printf("%s%s:");
}

uint64_t sub_100003050(int a1, const char *a2, const char *a3)
{
  return printf("%c%s%s", a1, a2, a3);
}

uint64_t sub_100003080(int a1, const char *a2, uint64_t a3)
{
  return printf("%c%s%ld", a1, a2, a3);
}

uint64_t sub_1000030B0()
{
  return putchar(10);
}

uint64_t sub_1000030B8(const char *a1, const char *a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t result;

  result = printf("%s%s: 0x%x %d %d %d: ", a1, a2, a3, a4, a5, a6);
  if (a7)
    return puts("<invalid>");
  return result;
}

uint64_t sub_100003110(const char *a1, const char *a2, unsigned int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;
  const char *v8;
  const char *v9;

  result = printf("%s @ %s", a1, a2);
  if (a3)
  {
    v7 = 0;
    while (1)
    {
      v8 = *(const char **)(a4 + v7);
      if (!v8)
        break;
      if (v7)
        v9 = ",";
      else
        v9 = " (";
      result = printf("%s%s", v9, v8);
      v7 += 8;
      if (8 * a3 == v7)
        return putchar(41);
    }
  }
  return result;
}

uint64_t sub_1000031C0(const char *a1, const char *a2)
{
  return printf("%s from %s\n", a1, a2);
}

uint64_t sub_1000031E8(unsigned int a1, unsigned __int8 *a2)
{
  uint64_t v4;
  int v5;

  printf("     fh %d ", a1);
  if (a1)
  {
    v4 = a1;
    do
    {
      v5 = *a2++;
      printf("%02x", v5);
      --v4;
    }
    while (v4);
  }
  return putchar(10);
}

uint64_t sub_100003254(uint64_t a1)
{
  return printf("%12llu  %12llu  %12llu  %s\n", *(_QWORD *)(a1 + 1025), *(_QWORD *)(a1 + 1033), *(_QWORD *)(a1 + 1041), (const char *)a1);
}

uint64_t sub_10000328C(uint64_t a1, const char *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  printf("%12llu  %12llu  %12llu  %1ld:%02ld:%02ld  ", *(_QWORD *)(a1 + 133), *(_QWORD *)(a1 + 141), *(_QWORD *)(a1 + 149), a5, a6, a7);
  if (a4)
    printf("%-8u ");
  else
    printf("%-8.8s ");
  return puts(a2);
}

uint64_t sub_100003314(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  int v10;
  uint64_t *v11;
  const char **v13;
  uint64_t *v14;

  v13 = (const char **)&a9;
  if (a1 < 1)
  {
    putchar(10);
  }
  else
  {
    v9 = a1;
    v10 = a1;
    do
    {
      printf("%12.12s ", *v13);
      v13 += 2;
      --v10;
    }
    while (v10);
    putchar(10);
    v14 = &a9;
    do
    {
      v11 = v14;
      v14 += 2;
      printf("%12llu ", v11[1]);
      --v9;
    }
    while (v9);
  }
  return putchar(10);
}

uint64_t sub_1000033E8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  int v10;
  uint64_t *v11;
  const char **v13;
  uint64_t *v14;

  v13 = (const char **)&a9;
  if (a1 < 1)
  {
    putchar(10);
  }
  else
  {
    v9 = a1;
    v10 = a1;
    do
    {
      printf("%20.20s ", *v13);
      v13 += 2;
      --v10;
    }
    while (v10);
    putchar(10);
    v14 = &a9;
    do
    {
      v11 = v14;
      v14 += 2;
      printf("%20llu ", v11[1]);
      --v9;
    }
    while (v9);
  }
  return putchar(10);
}

uint64_t sub_1000034BC()
{
  uint64_t result;

  result = qword_100010058;
  if (qword_100010058)
    return sub_100002DA4((void *)qword_100010058, 0);
  return result;
}

uint64_t sub_1000034D4()
{
  return 0xFFFFFFFFLL;
}

const void *sub_1000034DC(uint64_t a1, const char *a2)
{
  const void *result;
  uint64_t v4;
  const char *v5;
  int v6;

  result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v4 = (uint64_t)result;
  if (dword_100010048 == -1)
  {
    v6 = 0;
  }
  else
  {
    if (a2)
      v5 = a2;
    else
      v5 = (const char *)&unk_10000AAA3;
    result = (const void *)sub_1000027F0((__CFDictionary *)qword_100010058[dword_100010048], v5, result);
    v6 = dword_100010048 + 1;
  }
  dword_100010048 = v6;
  qword_100010058[v6] = v4;
  return result;
}

const void *sub_100003574()
{
  const void *result;
  uint64_t v1;
  int v2;

  result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v1 = (uint64_t)result;
  if (dword_100010048 == -1)
  {
    v2 = 0;
  }
  else
  {
    result = (const void *)sub_100002D50(*((__CFArray **)&unk_1000100F8 + dword_10001004C), result);
    v2 = dword_100010048 + 1;
  }
  dword_100010048 = v2;
  qword_100010058[v2] = v1;
  return result;
}

void sub_100003600()
{
  --dword_100010048;
}

uint64_t sub_100003614(uint64_t a1, const char *a2, _DWORD *a3)
{
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v6;
  __CFDictionary *v7;
  const char *v8;
  uint64_t result;
  uint64_t v10;
  char __str[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v6 = Mutable;
  if (a3)
  {
    sub_1000034DC((uint64_t)Mutable, a2);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_OWORD *)__str = 0u;
    v12 = 0u;
    snprintf(__str, 0x80uLL, "0x%x", *a3);
    sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "Bitmask", __str);
    v7 = (__CFDictionary *)qword_100010058[dword_100010048];
    v8 = "Flags";
  }
  else
  {
    v7 = (__CFDictionary *)qword_100010058[dword_100010048];
    v8 = a2;
  }
  result = sub_100002958(v7, v8, v6);
  v10 = ++dword_10001004C;
  qword_1000100F8[v10] = v6;
  return result;
}

uint64_t sub_100003738(uint64_t a1, const char *a2, const char *a3)
{
  char __str[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)__str = 0u;
  v5 = 0u;
  snprintf(__str, 0x80uLL, "%s%s", a2, a3);
  return sub_100002C98(*((__CFArray **)&unk_1000100F8 + dword_10001004C), __str);
}

uint64_t sub_1000037C4(uint64_t a1, const char *a2, uint64_t a3)
{
  char __str[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)__str = 0u;
  v5 = 0u;
  snprintf(__str, 0x80uLL, "%s%ld", a2, a3);
  return sub_100002C98(*((__CFArray **)&unk_1000100F8 + dword_10001004C), __str);
}

uint64_t sub_100003850(uint64_t result)
{
  --dword_10001004C;
  if ((_DWORD)result)
    --dword_100010048;
  return result;
}

uint64_t sub_100003878(uint64_t a1, const char *a2, int a3, int a4, int a5, int a6, int a7)
{
  const char *v8;
  int v10;
  int v11;
  int v12;
  int v13;

  v12 = a4;
  v13 = a3;
  v10 = a6;
  v11 = a5;
  sub_1000034DC(a1, a2);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Flags", &v13, 4);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Loc", &v12, 4);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Serv", &v11, 4);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Addr", &v10, 4);
  if (a7)
    v8 = "invalid";
  else
    v8 = "valid";
  return sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "Status", v8);
}

uint64_t sub_100003958(const char *a1, const char *a2, int a3, const char **a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t result;

  LODWORD(v5) = a3;
  sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "Export", a1);
  v7 = sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "Server", a2);
  result = sub_100003614(v7, "Locations", 0);
  if ((_DWORD)v5)
  {
    v5 = v5;
    do
    {
      if (!*a4)
        break;
      result = sub_100002C98((__CFArray *)qword_1000100F8[dword_10001004C], *a4++);
      --v5;
    }
    while (v5);
  }
  --dword_10001004C;
  return result;
}

uint64_t sub_100003A18(const char *a1, const char *a2)
{
  sub_1000034DC((uint64_t)a1, a2);
  return sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "Mount Point", a1);
}

uint64_t sub_100003A58(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unsigned int v4;
  uint64_t result;
  unsigned int v6;
  _OWORD v7[16];
  char v8;

  v6 = a1;
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  sub_1000034DC(a1, "filehandle");
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Length", &v6, 4);
  if (v6)
  {
    v3 = 0;
    v4 = 0;
    do
      v4 += snprintf((char *)v7 + v4, 257 - v4, "%02x", *(unsigned __int8 *)(a2 + v3++));
    while (v3 < v6);
  }
  result = sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "Handle", (const char *)v7);
  --dword_100010048;
  return result;
}

uint64_t sub_100003B98(const char *a1)
{
  uint64_t result;

  sub_1000034DC((uint64_t)a1, a1);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Requests", a1 + 1025, 8);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Read Bytes", a1 + 1033, 8);
  result = sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Write Bytes", a1 + 1041, 8);
  --dword_100010048;
  return result;
}

uint64_t sub_100003C30(uint64_t a1, const char *a2, const char **a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v13;
  uint64_t result;
  char __str[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  *(_OWORD *)v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)__str = 0u;
  v16 = 0u;
  if (a4)
  {
    v11 = snprintf(__str, 0x80uLL, "%u@%s", *(_DWORD *)(a1 + 1), a2);
    sub_1000034DC(v11, __str);
    sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Uuid", (const void *)(a1 + 1), 4);
  }
  else
  {
    v13 = snprintf(__str, 0x80uLL, "%s@%s", *a3, a2);
    sub_1000034DC(v13, __str);
    sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "User", *a3);
  }
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Requests", (const void *)(a1 + 133), 8);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Read Bytes", (const void *)(a1 + 141), 8);
  sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], "Write Bytes", (const void *)(a1 + 149), 8);
  snprintf(v23, 0x80uLL, "%1ld:%02ld:%02ld", a5, a6, a7);
  result = sub_100002B8C((__CFDictionary *)qword_100010058[dword_100010048], "Idle", v23);
  --dword_100010048;
  return result;
}

uint64_t sub_100003DF4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  uint64_t *v10;
  const char *v11;
  uint64_t v12;
  uint64_t *v13;

  v13 = &a9;
  if ((int)result >= 1)
  {
    v9 = result;
    do
    {
      v10 = v13++;
      v11 = (const char *)*v10;
      v13 = v10 + 2;
      v12 = v10[1];
      result = sub_100002A1C((__CFDictionary *)qword_100010058[dword_100010048], v11, &v12, 8);
      --v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_100003E78(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 48) = 0;
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_DWORD *)(result + 48) = 1;
  *(_DWORD *)(result + 52) = 1;
  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a3;
  *(_QWORD *)(result + 40) = 512;
  if (a2)
    *(_DWORD *)(result + 52) = 0;
  return result;
}

uint64_t sub_100003EB8(uint64_t a1, char *__dst, unsigned int a3, int a4)
{
  unint64_t v4;
  unsigned int v5;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  size_t v11;

  if (a4)
    v4 = a3;
  else
    v4 = (a3 + 3) & 0xFFFFFFFC;
  if (!(_DWORD)v4)
    return 0;
  v5 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  while (v8)
  {
    if (v8 >= v4)
      v9 = v4;
    else
      v9 = v8;
    v10 = *(char **)(a1 + 24);
    if (v5)
    {
      if (v9 >= v5)
        v11 = v5;
      else
        v11 = v9;
      memmove(__dst, v10, v11);
      v10 = *(char **)(a1 + 24);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v11;
    }
    else
    {
      v11 = 0;
    }
    v8 -= v9;
    *(_QWORD *)(a1 + 24) = &v10[v9];
    *(_QWORD *)(a1 + 32) = v8;
    __dst += v11;
    if (v5)
      v5 -= v9;
    else
      v5 = 0;
    v4 -= v9;
    if (!v4)
      return 0;
  }
  return 12;
}

void start(int a1, char **a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  char *v12;
  uint64_t (**v13)();
  char *v14;
  int v15;
  char *v16;
  int v17;

  v4 = 0;
  v17 = 0;
  v5 = 0;
  v6 = 3;
  v7 = 3;
  while (1)
  {
    v8 = v6;
    v9 = v4;
    v10 = getopt(a1, a2, "w:sce34un:mvzEf:");
    if (v10 <= 68)
    {
      switch(v10)
      {
        case 51:
          v7 = 1;
          break;
        case 52:
          v7 = 2;
          break;
        case -1:
          switch(v5)
          {
            case 1:
              if ((_DWORD)v9)
                sub_10000441C(v9);
              sub_100004564();
              break;
            case 2:
              if ((_DWORD)v9)
                sub_100004658(v9, v17);
              sub_1000047C0(v17);
              break;
            case 3:
              if (optind == a1)
                v16 = 0;
              else
                v16 = a2[optind];
              sub_100004280(v16, v7);
              break;
            case 4:
              if (v8 >= 2)
                sub_100004944();
              if ((v8 & 1) != 0)
                sub_1000049E0();
              break;
            case 5:
              sub_100004A04(v8, v7);
              break;
            default:
              if ((_DWORD)v9)
                sub_100004C04(v9, v8, v7);
              sub_100005000(v8, v7);
              break;
          }
          (*off_100010050)();
          exit(0);
        default:
LABEL_35:
          fwrite("usage: nfsstat [-cse34uvmz] [-f JSON] [-w interval] [-n user|net]\n", 0x42uLL, 1uLL, __stderrp);
          exit(1);
      }
    }
    else
    {
      v11 = v10 - 99;
      v6 = 1;
      v4 = v9;
      switch(v11)
      {
        case 0:
          v6 = 2;
          v4 = v9;
          continue;
        case 1:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
        case 13:
        case 14:
        case 15:
        case 17:
        case 21:
        case 22:
          goto LABEL_35;
        case 2:
          v5 = 1;
          break;
        case 3:
          v12 = optarg;
          if (!strcmp(optarg, "JSON") || !strcmp(v12, "Json") || !strcmp(v12, "json"))
          {
            off_100010050 = off_10000C738;
            v13 = off_10000C738;
          }
          else
          {
            v13 = off_100010050;
          }
          ((void (*)(_QWORD, _QWORD))v13[3])(0, 0);
          break;
        case 10:
          v5 = 3;
          break;
        case 11:
          v14 = optarg;
          if (!strcmp(optarg, "net"))
          {
            v15 = v17 | 1;
          }
          else
          {
            if (strcmp(v14, "user"))
            {
              puts("unsupported 'n' argument");
              break;
            }
            v15 = v17 | 2;
          }
          v17 = v15;
          break;
        case 16:
          continue;
        case 18:
          v5 = 2;
          break;
        case 19:
          ++dword_100010198;
          break;
        case 20:
          v4 = atoi(optarg);
          v6 = v8;
          if ((v4 & 0x80000000) == 0)
            continue;
          printf("unsupported 'w' argument -- %d\n", v4);
          break;
        case 23:
          v5 = 4;
          break;
        default:
          if ((_DWORD)v9 != 69)
            goto LABEL_35;
          v5 = 5;
          break;
      }
    }
    v4 = v9;
    v6 = v8;
  }
}

void sub_100004280(char *a1, char a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  statfs *v7;
  statfs *v8;
  size_t v9;
  void *v10;
  statfs *v11;
  char v12[1024];

  v11 = 0;
  bzero(v12, 0x400uLL);
  v9 = 0;
  v10 = 0;
  if (realpath_DARWIN_EXTSN(a1, v12))
    a1 = v12;
  v4 = getmntinfo(&v11, 2);
  if (!(_DWORD)v4)
    sub_10000A418(v4);
  if ((int)v4 >= 1)
  {
    v5 = 0;
    v6 = 2168 * v4;
    while (1)
    {
      v7 = v11;
      v8 = &v11[v5 / 0x878];
      if (a1)
      {
        if (strcmp(a1, v8->f_mntonname) || !strcmp(v8->f_fstypename, "autofs"))
          goto LABEL_14;
      }
      else if (strcmp(v8->f_fstypename, "nfs") || !strncmp(v8->f_mntfromname, "ftp:", 4uLL))
      {
        goto LABEL_14;
      }
      if (sub_100005F90((unsigned int *)&v7[v5 / 0x878].f_fsid, &v10, &v9))
        warnx("Unable to get mount info for %s", v11[v5 / 0x878].f_mntonname);
      else
        sub_100009238((uint64_t)&v11[v5 / 0x878], (uint64_t)v10, v9, a2);
LABEL_14:
      v5 += 2168;
      if (v6 == v5)
      {
        if (v10)
          free(v10);
        return;
      }
    }
  }
}

void sub_10000441C(unsigned int a1)
{
  uint64_t v2;
  size_t v3;
  int v4;
  uint64_t v5;
  size_t v6;
  sigset_t v7[2];
  size_t v8;
  uint64_t v9;

  *(_QWORD *)v7 = 0;
  v8 = 0;
  v9 = 0;
  signal(14, (void (__cdecl *)(int))sub_10000623C);
  byte_10001019C = 0;
  alarm(a1);
  v2 = 0;
  v3 = 0;
  v4 = 1;
  while (1)
  {
    if (!--v4)
    {
      printf("%12s  %12s  %12s\n", "Requests", "Read Bytes", "Write Bytes");
      fflush(__stdoutp);
      v4 = 20;
    }
    if (!sub_100005CD8((void **)&v9, &v8))
    {
      v5 = v9;
      sub_100009B24(v9, v2);
      v6 = v8;
      v8 = v3;
      v9 = v2;
      v2 = v5;
      v3 = v6;
    }
    fflush(__stdoutp);
    v7[1] = 0x2000;
    if (sigprocmask(1, &v7[1], v7) == -1)
      goto LABEL_11;
    if (!byte_10001019C)
    {
      v7[1] = 0;
      sigsuspend(&v7[1]);
    }
    if (sigprocmask(3, v7, 0) == -1)
LABEL_11:
      err(1, "sigprocmask failed");
    byte_10001019C = 0;
    alarm(a1);
  }
}

void sub_100004564()
{
  char *v0;
  unint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  size_t v6;
  char *v7;

  v6 = 0;
  v7 = 0;
  if (!sub_100005CD8((void **)&v7, &v6))
  {
    v0 = v7;
    v1 = *(_QWORD *)(v7 + 4);
    if (v1)
    {
      ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Exported Directory Info");
      ((void (*)(const char *, ...))off_100010050[1])("%12s  %12s  %12s\n", "Requests", "Read Bytes", "Write Bytes");
      v2 = 0;
      v3 = 1;
      do
      {
        v4 = ((uint64_t (*)(char *))off_100010050[14])(&v0[1049 * v2 + 12]);
        v2 = v3;
      }
      while (v1 > v3++);
      ((void (*)(uint64_t))off_100010050[5])(v4);
    }
    else
    {
      puts("No export stat data found");
    }
    free(v0);
  }
}

void sub_100004658(unsigned int a1, char a2)
{
  uint64_t v4;
  size_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  sigset_t v9[2];
  size_t v10;
  uint64_t v11;

  *(_QWORD *)v9 = 0;
  v10 = 0;
  v11 = 0;
  signal(14, (void (__cdecl *)(int))sub_10000623C);
  byte_10001019C = 0;
  alarm(a1);
  v4 = 0;
  v5 = 0;
  v6 = 1;
  while (1)
  {
    if (!--v6)
    {
      printf("%12s  %12s  %12s  %-7s  %-8s %s\n", "Requests", "Read Bytes", "Write Bytes", "Idle", "User", "IP Address");
      fflush(__stdoutp);
      v6 = 20;
    }
    if (!sub_100005E34((void **)&v11, &v10))
    {
      sub_10000A0C0(v11, v4, a2);
      v8 = v10;
      v7 = v11;
      v10 = v5;
      v11 = v4;
      v4 = v7;
      v5 = v8;
    }
    fflush(__stdoutp);
    v9[1] = 0x2000;
    if (sigprocmask(1, &v9[1], v9) == -1)
      goto LABEL_11;
    if (!byte_10001019C)
    {
      v9[1] = 0;
      sigsuspend(&v9[1]);
    }
    if (sigprocmask(3, v9, 0) == -1)
LABEL_11:
      err(1, "sigprocmask failed");
    byte_10001019C = 0;
    alarm(a1);
  }
}

void sub_1000047C0(char a1)
{
  _DWORD *v2;
  uint64_t **v3;
  uint64_t **v4;
  uint64_t v5;
  uint64_t *i;
  uint64_t v7;
  _QWORD *j;
  void *v9;
  const char *v10;
  size_t v11;
  _DWORD *v12;

  v11 = 0;
  v12 = 0;
  if (!sub_100005E34((void **)&v12, &v11))
  {
    v2 = v12;
    if (v12[1])
    {
      v3 = sub_100009CC0((uint64_t)v12);
      if (v3)
      {
        v4 = v3;
        v5 = ((uint64_t (*)(_QWORD, const char *))off_100010050[3])(0, "NFS Active User Info");
        for (i = *v4; i; i = (uint64_t *)*i)
        {
          ((void (*)(_QWORD, uint64_t))off_100010050[3])(0, i[3] + 1);
          v7 = ((uint64_t (*)(const char *, ...))off_100010050[1])("%12s  %12s  %12s  %-7s  %-8s %s\n", "Requests", "Read Bytes", "Write Bytes", "Idle", "User", "IP Address");
          for (j = (_QWORD *)i[2]; j; j = (_QWORD *)*j)
            v7 = sub_100009E48(j[2], a1);
          v5 = ((uint64_t (*)(uint64_t))off_100010050[5])(v7);
        }
        ((void (*)(uint64_t))off_100010050[5])(v5);
        sub_10000A04C(v4);
        free(v4);
        v9 = v2;
        goto LABEL_12;
      }
      v10 = "Not enough  memory for displaying active user statistics";
    }
    else
    {
      v10 = "No NFS active user statistics found.";
    }
    puts(v10);
    v9 = v2;
LABEL_12:
    free(v9);
  }
}

uint64_t sub_100004944()
{
  uint64_t result;
  vfsconf v1;
  int v2[3];

  memset(&v1, 0, sizeof(v1));
  result = getvfsbyname("nfs", &v1);
  if ((result & 0x80000000) == 0)
  {
    v2[0] = 3;
    v2[1] = v1.vfc_typenum;
    v2[2] = 7;
    result = sysctl(v2, 3u, 0, 0, 0, 0);
    if ((result & 0x80000000) != 0)
      sub_10000A42C(result);
  }
  return result;
}

uint64_t sub_1000049E0()
{
  uint64_t result;

  result = nfssvc(128, 0);
  if ((result & 0x80000000) != 0)
    sub_10000A440(result);
  return result;
}

void sub_100004A04(int a1, int a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[15];
  _OWORD v18[15];
  uint64_t v19;
  _BYTE v20[728];
  uint64_t v21;
  uint64_t v22;

  bzero(v20, 0x510uLL);
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  if ((a1 & 2) != 0)
  {
    sub_100005B6C(v20);
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "NFS Client Errors Info");
    v4 = -4;
    v5 = 30;
    do
    {
      v6 = v5 - 4;
      if (v5 >= 4)
        v7 = 4;
      else
        v7 = v5;
      v4 += 4;
      v8 = sub_100006178((uint64_t)&v21, (uint64_t)&off_10000C2D8, v4, v7);
      v5 = v6;
    }
    while (v4 < 0x1A);
    if ((a2 & 2) != 0)
    {
      ((void (*)(uint64_t))off_100010050[2])(v8);
      ((void (*)(_QWORD, const char *))off_100010050[3])(0, "NFSv4 Client Errors Info");
      v9 = -4;
      do
      {
        v9 += 4;
        v10 = sub_100006178((uint64_t)&v22, (uint64_t)&off_10000C4B8, v9, 4);
      }
      while (v9 < 0x24);
      v8 = ((uint64_t (*)(uint64_t))off_100010050[5])(v10);
    }
    ((void (*)(uint64_t))off_100010050[5])(v8);
  }
  if ((a1 & a2 & 1) != 0)
  {
    v11 = sub_100005C24((uint64_t)v17);
    if ((a1 & 2) != 0)
      ((void (*)(uint64_t))off_100010050[2])(v11);
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "NFS Server Errors Info");
    v12 = -4;
    v13 = 30;
    do
    {
      v14 = v13 - 4;
      if (v13 >= 4)
        v15 = 4;
      else
        v15 = v13;
      v12 += 4;
      v16 = sub_100006178((uint64_t)v18, (uint64_t)&off_10000C2D8, v12, v15);
      v13 = v14;
    }
    while (v12 < 0x1A);
    ((void (*)(uint64_t))off_100010050[5])(v16);
  }
}

void sub_100004C04(unsigned int a1, unsigned __int8 a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  sigset_t v41[2];
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
  __int128 v56;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  _BYTE v73[152];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  bzero(v73, 0x510uLL);
  v72 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
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
  *(_QWORD *)v41 = 0;
  signal(14, (void (__cdecl *)(int))sub_10000623C);
  byte_10001019C = 0;
  v38 = a1;
  alarm(a1);
  v24 = 0;
  v25 = 0;
  v20 = 0;
  v21 = 0;
  v28 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v22 = 0;
  v23 = 0;
  v18 = 0;
  v19 = 0;
  v17 = 0;
  v36 = 0;
  v37 = 0;
  v34 = 0;
  v35 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v30 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v15 = a3 & 1;
  v16 = a3;
  v39 = a3 & 1 & a2;
  v14 = 1;
  while (1)
  {
    if (!--v14)
    {
      sub_10000624C();
      v14 = 20;
    }
    if ((a2 & 2) != 0)
    {
      sub_100005B6C(v73);
      if (v15)
        printf("Client v3: %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu\n", v74 - v24, v75 - v20, v77 - v26, v78 - v25, v79 - v23, v80 - v22, v76 - v28, v81 - (v18 + v21) + v82, v83 - v19, v84 - v17);
      if ((v16 & 2) != 0)
        printf("Client v4: %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu\n", v86 - v34, v89 - v32, v92 - v29, v90 - v31, v94 - v27, v93 - v30, v85 - v37, v91 - v33, v87 - v36, v88 - v35);
      v28 = v76;
      v26 = v77;
      v24 = v74;
      v25 = v78;
      v22 = v80;
      v23 = v79;
      v20 = v75;
      v21 = v81;
      v18 = v82;
      v19 = v83;
      v17 = v84;
      v36 = v87;
      v37 = v85;
      v34 = v86;
      v35 = v88;
      v31 = v90;
      v32 = v89;
      v33 = v91;
      v29 = v92;
      v30 = v93;
      v27 = v94;
    }
    if (v39)
    {
      sub_100005C24((uint64_t)&v42);
      printf("Server v3: %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu\n", *((_QWORD *)&v42 + 1) - v5, *((_QWORD *)&v43 + 1) - v6, *((_QWORD *)&v44 + 1) - v8, (_QWORD)v45 - v9, *((_QWORD *)&v45 + 1) - v10, (_QWORD)v49 - v11, (_QWORD)v44 - v7, (_QWORD)v50 - (v13 + v12) + *((_QWORD *)&v50 + 1));
      v5 = *((_QWORD *)&v42 + 1);
      v6 = *((_QWORD *)&v43 + 1);
      v8 = *((_QWORD *)&v44 + 1);
      v7 = v44;
      v10 = *((_QWORD *)&v45 + 1);
      v9 = v45;
      v11 = v49;
      v13 = *((_QWORD *)&v50 + 1);
      v12 = v50;
    }
    fflush(__stdoutp);
    v41[1] = 0x2000;
    if (sigprocmask(1, &v41[1], v41) == -1)
      goto LABEL_17;
    if (!byte_10001019C)
    {
      v41[1] = 0;
      sigsuspend(&v41[1]);
    }
    if (sigprocmask(3, v41, 0) == -1)
LABEL_17:
      err(1, "sigprocmask failed");
    byte_10001019C = 0;
    alarm(v38);
  }
}

void sub_100005000(int a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[30];
  uint64_t v19;
  uint64_t v20;

  bzero(&v20, 0x510uLL);
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  if ((a1 & 2) == 0)
  {
    if ((a2 & a1 & 1) == 0)
      return;
    sub_100005C24((uint64_t)v18);
    goto LABEL_10;
  }
  sub_100005B6C(&v20);
  ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Client Info");
  if ((a2 & 1) != 0)
  {
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "NFSv3 RPC Counts");
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    v4 = ((uint64_t (*)(uint64_t))off_100010050[16])(4);
    ((void (*)(uint64_t))off_100010050[5])(v4);
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "NLM RPC Counts");
    v5 = ((uint64_t (*)(uint64_t))off_100010050[16])(3);
    ((void (*)(uint64_t))off_100010050[5])(v5);
  }
  if ((a2 & 2) != 0)
  {
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "NFSv4 RPC Counts");
    v6 = ((uint64_t (*)(uint64_t))off_100010050[16])(2);
    ((void (*)(uint64_t))off_100010050[5])(v6);
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "NFSv4 Operation Counts");
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    v7 = ((uint64_t (*)(uint64_t))off_100010050[16])(1);
    ((void (*)(uint64_t))off_100010050[5])(v7);
  }
  ((void (*)(_QWORD, const char *))off_100010050[3])(0, "RPC Info");
  v8 = ((uint64_t (*)(uint64_t))off_100010050[16])(5);
  ((void (*)(uint64_t))off_100010050[5])(v8);
  ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Cache Info");
  ((void (*)(uint64_t))off_100010050[16])(6);
  ((void (*)(uint64_t))off_100010050[16])(6);
  v9 = ((uint64_t (*)(uint64_t))off_100010050[16])(4);
  ((void (*)(uint64_t))off_100010050[5])(v9);
  ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Paging Info");
  v10 = ((uint64_t (*)(uint64_t))off_100010050[16])(2);
  v11 = ((uint64_t (*)(uint64_t))off_100010050[5])(v10);
  ((void (*)(uint64_t))off_100010050[5])(v11);
  if ((a2 & 1 & a1) != 0)
  {
    v12 = sub_100005C24((uint64_t)v18);
    ((void (*)(uint64_t))off_100010050[2])(v12);
LABEL_10:
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Server Info");
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "RPC Counts");
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    v13 = ((uint64_t (*)(uint64_t))off_100010050[16])(3);
    ((void (*)(uint64_t))off_100010050[5])(v13);
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Server Faults");
    v14 = ((uint64_t (*)(uint64_t))off_100010050[16])(2);
    ((void (*)(uint64_t))off_100010050[5])(v14);
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Server Cache Stats");
    v15 = ((uint64_t (*)(uint64_t))off_100010050[16])(4);
    ((void (*)(uint64_t))off_100010050[5])(v15);
    ((void (*)(_QWORD, const char *))off_100010050[3])(0, "Server Write Gathering");
    v16 = ((uint64_t (*)(uint64_t))off_100010050[16])(3);
    v17 = ((uint64_t (*)(uint64_t))off_100010050[5])(v16);
    ((void (*)(uint64_t))off_100010050[5])(v17);
  }
}

uint64_t sub_100005B6C(void *a1)
{
  uint64_t result;
  size_t v3;
  vfsconf v4;
  int v5[3];

  v3 = 1296;
  memset(&v4, 0, sizeof(v4));
  bzero(a1, 0x510uLL);
  result = getvfsbyname("nfs", &v4);
  if ((result & 0x80000000) == 0)
  {
    v5[0] = 3;
    v5[1] = v4.vfc_typenum;
    v5[2] = 1;
    result = sysctl(v5, 3u, a1, &v3, 0, 0);
    if ((result & 0x80000000) != 0)
      sub_10000A42C(result);
  }
  return result;
}

uint64_t sub_100005C24(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  _QWORD v3[4];

  v2 = 488;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_QWORD *)(a1 + 480) = 0;
  v3[0] = a1;
  v3[1] = 488;
  v3[2] = &v2;
  v3[3] = 8;
  result = nfssvc(256, v3);
  if ((result & 0x80000000) != 0)
    sub_10000A440(result);
  return result;
}

uint64_t sub_100005CD8(void **a1, size_t *a2)
{
  void *v4;
  void *v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  void *v11;
  size_t v12;
  size_t *v13;
  uint64_t v14;

  v4 = *a1;
  if (!*a1)
  {
    *a2 = 0x8000;
    v5 = malloc_type_malloc(0x8000uLL, 0x6FDEF3CuLL);
    *a1 = v5;
    if (!v5)
    {
      warnx("No memory for reading export stat data");
      return 1;
    }
    __memset_chk(v5, 0, *a2, 0x8000);
    v4 = *a1;
  }
  v6 = *a2;
  v11 = v4;
  v12 = v6;
  v13 = a2;
  v14 = 8;
  v7 = nfssvc(16, &v11);
  if ((v7 & 0x80000000) != 0)
    sub_10000A440(v7);
  if (v6 <= *a2)
    goto LABEL_8;
  free(*a1);
  *a2 = v6 + 4196;
  v8 = malloc_type_malloc(v6 + 4196, 0x37E98A56uLL);
  *a1 = v8;
  if (!v8)
  {
    warnx("No memory for reading export statistics");
    return 1;
  }
  bzero(v8, *a2);
  v9 = *a2;
  v11 = *a1;
  v12 = v9;
  v13 = a2;
  v14 = 8;
  if (nfssvc(16, &v11) < 0)
    sub_10000A454(a1);
LABEL_8:
  if (*(_DWORD *)*a1 != 1)
    sub_10000A470(*a1);
  return 0;
}

uint64_t sub_100005E34(void **a1, size_t *a2)
{
  void *v4;
  void *v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  void *v11;
  size_t v12;
  size_t *v13;
  uint64_t v14;

  v4 = *a1;
  if (!*a1)
  {
    *a2 = 0x20000;
    v5 = malloc_type_malloc(0x20000uLL, 0xA663E956uLL);
    *a1 = v5;
    if (!v5)
    {
      warnx("No memory for reading active user statistics");
      return 1;
    }
    __memset_chk(v5, 0, *a2, 0x20000);
    v4 = *a1;
  }
  v6 = *a2;
  v11 = v4;
  v12 = v6;
  v13 = a2;
  v14 = 8;
  v7 = nfssvc(32, &v11);
  if ((v7 & 0x80000000) != 0)
    sub_10000A440(v7);
  if (v6 <= *a2)
    goto LABEL_8;
  free(*a1);
  *a2 = v6 + 5130;
  v8 = malloc_type_malloc(v6 + 5130, 0x19A8A49CuLL);
  *a1 = v8;
  if (!v8)
  {
    warnx("No memory for reading active user statistics\n");
    return 1;
  }
  bzero(v8, *a2);
  v9 = *a2;
  v11 = *a1;
  v12 = v9;
  v13 = a2;
  v14 = 8;
  if (nfssvc(32, &v11) < 0)
    sub_10000A454(a1);
LABEL_8:
  if (*(_DWORD *)*a1 != 1)
    sub_10000A48C(*a1);
  return 0;
}

uint64_t sub_100005F90(unsigned int *a1, void **a2, size_t *a3)
{
  void *v6;
  uint64_t v7;
  _DWORD *v8;
  size_t v9;
  void *v10;
  _DWORD *v11;
  size_t size;
  vfsconf v14;
  int v15[3];

  if (!*a2)
  {
    *a3 = 4096;
    v6 = malloc_type_malloc(0x1000uLL, 0xCF470E71uLL);
    *a2 = v6;
    if (!v6)
    {
      warnx("No memory for reading mount information");
      return 12;
    }
    __memset_chk(v6, 0, *a3, 4096);
  }
  memset(&v14, 0, sizeof(v14));
  v7 = getvfsbyname("nfs", &v14);
  if ((v7 & 0x80000000) != 0)
    sub_10000A4A8(v7);
  v15[0] = 3;
  v15[1] = v14.vfc_typenum;
  v15[2] = 6;
  v8 = *a2;
  *v8 = bswap32(*a1);
  v8[1] = bswap32(a1[1]);
  size = *a3;
  if (sysctl(v15, 3u, v8, &size, 0, 0) < 0)
    goto LABEL_12;
  if (size <= *a3)
    goto LABEL_9;
  free(*a2);
  v9 = size;
  *a3 = size;
  v10 = malloc_type_malloc(v9, 0xE958B74DuLL);
  *a2 = v10;
  if (!v10)
  {
    warnx("No memory for reading mount information\n");
    return 12;
  }
  bzero(v10, *a3);
  v11 = *a2;
  *v11 = bswap32(*a1);
  v11[1] = bswap32(a1[1]);
  size = *a3;
  if (sysctl(v15, 3u, v11, &size, 0, 0) < 0)
  {
LABEL_12:
    warn("sysctl failed");
    return *__error();
  }
LABEL_9:
  if (!*(_DWORD *)*a2)
    return 0;
  warnx("NFS mount information version mismatch");
  return 72;
}

uint64_t sub_100006178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t))off_100010050[17])(a4);
}

void sub_10000623C()
{
  byte_10001019C = 1;
}

uint64_t sub_10000624C()
{
  printf("        %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s\n", "Getattr", "Lookup", "Readlink", "Read", "Write", "Rename", "Access", "Readdir", "Lock", "Unlock");
  return fflush(__stdoutp);
}

void sub_1000062E0(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = *(_DWORD *)(a1 + 452);
  v3 = *(_QWORD **)(a1 + 456);
  if (v2)
  {
    v4 = 0;
    while (v3)
    {
      if (LODWORD(v3[3 * v4 + 2]))
      {
        v5 = 0;
        do
        {
          v6 = v3[3 * v4];
          if (!v6)
            break;
          if (*(_DWORD *)(v6 + 24 * v5 + 16))
          {
            v7 = 0;
            do
            {
              v8 = *(_QWORD *)(v6 + 24 * v5 + 8);
              if (v8)
              {
                v9 = *(void **)(v8 + 8 * v7);
                if (v9)
                {
                  free(v9);
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 456) + 24 * v4) + 24 * v5 + 8) + 8 * v7) = 0;
                  v3 = *(_QWORD **)(a1 + 456);
                }
              }
              ++v7;
              v6 = v3[3 * v4];
            }
            while (v7 < *(unsigned int *)(v6 + 24 * v5 + 16));
          }
          if (*(_QWORD *)(v6 + 24 * v5 + 8))
          {
            free(*(void **)(v6 + 24 * v5 + 8));
            v3 = *(_QWORD **)(a1 + 456);
            v6 = v3[3 * v4];
            *(_QWORD *)(v6 + 24 * v5 + 8) = 0;
          }
          v10 = v6 + 24 * v5;
          *(_DWORD *)(v10 + 16) = 0;
          v11 = *(void **)v10;
          if (v11)
          {
            free(v11);
            v3 = *(_QWORD **)(a1 + 456);
            *(_QWORD *)(v3[3 * v4] + 24 * v5) = 0;
          }
          ++v5;
        }
        while (v5 < LODWORD(v3[3 * v4 + 2]));
      }
      if (v3[3 * v4])
      {
        free((void *)v3[3 * v4]);
        v3 = *(_QWORD **)(a1 + 456);
        v3[3 * v4] = 0;
      }
      v12 = (char *)&v3[3 * v4];
      *((_DWORD *)v12 + 4) = 0;
      if (*((_DWORD *)v12 + 5))
      {
        v13 = 0;
        do
        {
          v14 = v3[3 * v4 + 1];
          if (v14)
          {
            v15 = *(void **)(v14 + 8 * v13);
            if (v15)
            {
              free(v15);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 456) + 24 * v4 + 8) + 8 * v13) = 0;
              v3 = *(_QWORD **)(a1 + 456);
            }
          }
          ++v13;
        }
        while (v13 < HIDWORD(v3[3 * v4 + 2]));
      }
      if (v3[3 * v4 + 1])
      {
        free((void *)v3[3 * v4 + 1]);
        v3 = *(_QWORD **)(a1 + 456);
        v3[3 * v4 + 1] = 0;
      }
      HIDWORD(v3[3 * v4++ + 2]) = 0;
      if (v4 >= *(unsigned int *)(a1 + 452))
        goto LABEL_31;
    }
  }
  else if (v3)
  {
LABEL_31:
    free(v3);
    *(_QWORD *)(a1 + 456) = 0;
  }
  *(_DWORD *)(a1 + 452) = 0;
  v16 = *(void **)(a1 + 464);
  if (v16)
  {
    free(v16);
    *(_QWORD *)(a1 + 464) = 0;
  }
  v17 = *(void **)(a1 + 24);
  if (v17)
  {
    free(v17);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v18 = *(void **)(a1 + 32);
  if (v18)
  {
    free(v18);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v19 = *(void **)(a1 + 40);
  if (v19)
  {
    free(v19);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v20 = *(void **)(a1 + 256);
  if (v20)
  {
    free(v20);
    *(_QWORD *)(a1 + 256) = 0;
  }
  v21 = *(void **)(a1 + 264);
  if (v21)
  {
    free(v21);
    *(_QWORD *)(a1 + 264) = 0;
  }
}

uint64_t sub_100006530(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  _DWORD *v26;
  uint64_t v27;
  _DWORD *v28;
  _DWORD *v29;
  _DWORD *v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _DWORD *v36;
  int *v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _DWORD *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  int v50;
  _DWORD *v51;
  uint64_t v52;
  _DWORD *v53;
  _DWORD *v54;
  uint64_t v55;
  _DWORD *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  _DWORD *v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  size_t v66;
  void *v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  unsigned int v74;
  BOOL v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  unsigned int v80;
  void *v81;
  unint64_t v82;
  unsigned int v83;
  BOOL v84;
  char *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unsigned int v89;
  BOOL v90;
  size_t v91;
  void *v92;
  unint64_t v93;
  unsigned int v94;
  BOOL v95;
  char *v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  int v100;
  int v101;
  int *v102;
  int v103;
  _DWORD *v104;
  unsigned int v105;
  char *v106;
  int v107;
  unsigned int v108;
  char *v109;
  int v110;
  unsigned int v111;
  char *v112;
  int v113;
  unsigned int v114;
  char *v115;
  int v116;
  unsigned int v117;
  char *v118;
  int v119;
  int v120;
  unsigned int v121;
  char *v122;
  _DWORD *v123;
  int v124;
  _DWORD *v125;
  uint64_t v126;
  uint64_t v127;
  _DWORD *v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unsigned int v139;
  unsigned int v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unsigned int __dst;

  if (a2 < 9)
    return 72;
  __dst = 0;
  *(_DWORD *)a3 = 0;
  v6 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
  if ((_DWORD)v6)
  {
    if (*(_DWORD *)a3 <= 0x58u)
    {
      v7 = v6;
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
    return 72;
  }
  v8 = bswap32(__dst);
  *(_DWORD *)a3 = v8;
  if (v8 > 0x58)
    return 72;
  __dst = 0;
  v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
  if ((_DWORD)v7)
    goto LABEL_7;
  v9 = bswap32(__dst);
LABEL_8:
  if (v9 != a2)
    return 72;
  __dst = 0;
  if ((_DWORD)v7)
    goto LABEL_11;
  v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
  if ((_DWORD)v7)
    goto LABEL_11;
  if (__dst)
    return 22;
  __dst = 0;
  v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
  if ((_DWORD)v7)
    goto LABEL_11;
  v13 = bswap32(__dst);
  v14 = v13 >= 2 ? 2 : v13;
  if ((_DWORD)v14)
  {
    v7 = 0;
    v15 = (_DWORD *)(a3 + 8);
    v16 = v14;
    do
    {
      __dst = 0;
      *v15 = 0;
      if (!(_DWORD)v7)
      {
        v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
        if (!(_DWORD)v7)
          *v15 = bswap32(__dst);
      }
      ++v15;
      --v16;
    }
    while (v16);
    if ((_DWORD)v7)
      goto LABEL_11;
  }
  if (v14 >= v13)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      if (!(_DWORD)v7)
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = 4;
        while (v17)
        {
          if (v17 >= v18)
            v19 = v18;
          else
            v19 = v17;
          v17 -= v19;
          *(_QWORD *)(a1 + 24) += v19;
          *(_QWORD *)(a1 + 32) = v17;
          v18 -= v19;
          if (!v18)
          {
            v7 = 0;
            goto LABEL_40;
          }
        }
        v7 = 72;
      }
LABEL_40:
      LODWORD(v14) = v14 + 1;
    }
    while ((_DWORD)v14 != (_DWORD)v13);
    LODWORD(v14) = v13;
  }
  if (v14 <= 1)
  {
    v20 = v13;
    do
    {
      v21 = v20;
      *(_DWORD *)(a3 + 4 * v20 + 8) = 0;
      v20 = 1;
    }
    while (!v21);
  }
  __dst = 0;
  if ((_DWORD)v7 || (v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0), (_DWORD)v7))
  {
LABEL_11:
    v10 = a3 + 8;
    if ((*(_BYTE *)(a3 + 8) & 1) == 0)
    {
      LODWORD(v11) = 0;
      goto LABEL_77;
    }
    goto LABEL_76;
  }
  if (bswap32(__dst) > a2 - 4 * (int)v13 - 20)
    return 22;
  v10 = a3 + 8;
  v22 = *(_DWORD *)(a3 + 8);
  if ((v22 & 1) != 0)
  {
    __dst = 0;
    v23 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v23)
    {
      v133 = __dst;
      if (__dst)
      {
        __dst = 0;
        *(_DWORD *)(a3 + 16) = 0;
        v23 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
        if ((_DWORD)v23)
          goto LABEL_75;
        *(_DWORD *)(a3 + 16) = bswap32(__dst);
        v134 = 1;
      }
      else
      {
        v134 = 0;
      }
      v135 = bswap32(v133);
      if (v134 >= v135)
      {
        if (!v133)
          *(_DWORD *)(a3 + 16) = 0;
        __dst = 0;
      }
      else
      {
        v7 = 0;
        do
        {
          if (!(_DWORD)v7)
          {
            v136 = *(_QWORD *)(a1 + 32);
            v137 = 4;
            while (v136)
            {
              if (v136 >= v137)
                v138 = v137;
              else
                v138 = v136;
              v136 -= v138;
              *(_QWORD *)(a1 + 24) += v138;
              *(_QWORD *)(a1 + 32) = v136;
              v137 -= v138;
              if (!v137)
              {
                v7 = 0;
                goto LABEL_512;
              }
            }
            v7 = 72;
          }
LABEL_512:
          ++v134;
        }
        while (v134 != v135);
        __dst = 0;
        if ((_DWORD)v7)
          goto LABEL_76;
      }
      v23 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v23)
      {
        v139 = __dst;
        if (__dst)
        {
          __dst = 0;
          *(_DWORD *)(a3 + 20) = 0;
          v23 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
          if ((_DWORD)v23)
            goto LABEL_75;
          *(_DWORD *)(a3 + 20) = bswap32(__dst);
          v140 = 1;
        }
        else
        {
          v140 = 0;
        }
        LODWORD(v11) = bswap32(v139);
        if (v140 >= v11)
        {
          v7 = 0;
          if (!v139)
            *(_DWORD *)(a3 + 20) = 0;
        }
        else
        {
          v7 = 0;
          do
          {
            if (!(_DWORD)v7)
            {
              v141 = *(_QWORD *)(a1 + 32);
              v142 = 4;
              while (v141)
              {
                if (v141 >= v142)
                  v143 = v142;
                else
                  v143 = v141;
                v141 -= v143;
                *(_QWORD *)(a1 + 24) += v143;
                *(_QWORD *)(a1 + 32) = v141;
                v142 -= v143;
                if (!v142)
                {
                  v7 = 0;
                  goto LABEL_543;
                }
              }
              v7 = 72;
            }
LABEL_543:
            ++v140;
          }
          while (v140 != (_DWORD)v11);
        }
LABEL_77:
        v24 = *(_DWORD *)v10;
        if ((*(_DWORD *)v10 & 2) == 0)
        {
          if ((v24 & 4) == 0)
            goto LABEL_79;
          goto LABEL_95;
        }
        __dst = 0;
        *(_DWORD *)(a3 + 48) = 0;
        v25 = (_DWORD *)(a3 + 48);
        if ((_DWORD)v7)
        {
LABEL_94:
          v24 = *(_DWORD *)v10;
          if ((*(_DWORD *)v10 & 4) == 0)
          {
LABEL_79:
            if ((v24 & 0x8000000) == 0)
              goto LABEL_80;
            goto LABEL_99;
          }
LABEL_95:
          __dst = 0;
          *(_DWORD *)(a3 + 52) = 0;
          v26 = (_DWORD *)(a3 + 52);
          if ((_DWORD)v7)
            goto LABEL_98;
          goto LABEL_96;
        }
LABEL_92:
        v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
        if (!(_DWORD)v7)
          *v25 = bswap32(__dst);
        goto LABEL_94;
      }
    }
LABEL_75:
    v7 = v23;
LABEL_76:
    LODWORD(v11) = 1;
    goto LABEL_77;
  }
  if ((v22 & 2) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 48) = 0;
    v25 = (_DWORD *)(a3 + 48);
    goto LABEL_92;
  }
  if ((v22 & 4) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 52) = 0;
    v26 = (_DWORD *)(a3 + 52);
LABEL_96:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v26 = bswap32(__dst);
LABEL_98:
    v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x8000000) == 0)
    {
LABEL_80:
      if ((v24 & 8) == 0)
        goto LABEL_81;
      goto LABEL_104;
    }
LABEL_99:
    __dst = 0;
    *(_DWORD *)(a3 + 56) = 0;
    if ((_DWORD)v7)
      goto LABEL_102;
    goto LABEL_100;
  }
  if ((v22 & 0x8000000) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 56) = 0;
LABEL_100:
    v27 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v27)
    {
      v39 = bswap32(__dst);
      __dst = 0;
      *(_QWORD *)(a3 + 56) = v39;
      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
        *(_DWORD *)(a3 + 60) = bswap32(__dst);
LABEL_103:
      v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 8) == 0)
      {
LABEL_81:
        if ((v24 & 0x10) == 0)
          goto LABEL_82;
        goto LABEL_108;
      }
LABEL_104:
      __dst = 0;
      *(_DWORD *)(a3 + 64) = 0;
      v28 = (_DWORD *)(a3 + 64);
      if ((_DWORD)v7)
        goto LABEL_107;
      goto LABEL_105;
    }
    v7 = v27;
LABEL_102:
    *(_DWORD *)(a3 + 60) = 0;
    goto LABEL_103;
  }
  if ((v22 & 8) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 64) = 0;
    v28 = (_DWORD *)(a3 + 64);
LABEL_105:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v28 = bswap32(__dst);
LABEL_107:
    v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x10) == 0)
    {
LABEL_82:
      if ((v24 & 0x20) == 0)
        goto LABEL_83;
      goto LABEL_112;
    }
LABEL_108:
    __dst = 0;
    *(_DWORD *)(a3 + 68) = 0;
    v29 = (_DWORD *)(a3 + 68);
    if ((_DWORD)v7)
      goto LABEL_111;
    goto LABEL_109;
  }
  if ((v22 & 0x10) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 68) = 0;
    v29 = (_DWORD *)(a3 + 68);
LABEL_109:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v29 = bswap32(__dst);
LABEL_111:
    v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x20) == 0)
    {
LABEL_83:
      if ((v24 & 0x40) == 0)
        goto LABEL_84;
      goto LABEL_116;
    }
LABEL_112:
    __dst = 0;
    *(_DWORD *)(a3 + 72) = 0;
    v30 = (_DWORD *)(a3 + 72);
    if ((_DWORD)v7)
      goto LABEL_115;
    goto LABEL_113;
  }
  if ((v22 & 0x20) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 72) = 0;
    v30 = (_DWORD *)(a3 + 72);
LABEL_113:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v30 = bswap32(__dst);
LABEL_115:
    v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x40) == 0)
    {
LABEL_84:
      if ((v24 & 0x80) == 0)
        goto LABEL_85;
      goto LABEL_120;
    }
LABEL_116:
    __dst = 0;
    *(_DWORD *)(a3 + 76) = 0;
    v31 = (_DWORD *)(a3 + 76);
    if ((_DWORD)v7)
      goto LABEL_119;
    goto LABEL_117;
  }
  if ((v22 & 0x40) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 76) = 0;
    v31 = (_DWORD *)(a3 + 76);
LABEL_117:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v31 = bswap32(__dst);
LABEL_119:
    v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x80) == 0)
    {
LABEL_85:
      if ((v24 & 0x100) == 0)
        goto LABEL_86;
      goto LABEL_125;
    }
LABEL_120:
    __dst = 0;
    *(_QWORD *)(a3 + 80) = 0;
    if ((_DWORD)v7)
      goto LABEL_123;
    goto LABEL_121;
  }
  if ((v22 & 0x80) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_QWORD *)(a3 + 80) = 0;
LABEL_121:
    v32 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v32)
    {
      v40 = bswap32(__dst);
      __dst = 0;
      *(_QWORD *)(a3 + 80) = v40;
      *(_QWORD *)(a3 + 88) = 0;
      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
        *(_QWORD *)(a3 + 88) = bswap32(__dst);
LABEL_124:
      v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x100) == 0)
      {
LABEL_86:
        if ((v24 & 0x200) == 0)
          goto LABEL_87;
        goto LABEL_130;
      }
LABEL_125:
      __dst = 0;
      *(_QWORD *)(a3 + 96) = 0;
      if ((_DWORD)v7)
        goto LABEL_128;
      goto LABEL_126;
    }
    v7 = v32;
LABEL_123:
    *(_QWORD *)(a3 + 88) = 0;
    goto LABEL_124;
  }
  if ((v22 & 0x100) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_QWORD *)(a3 + 96) = 0;
LABEL_126:
    v33 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v33)
    {
      v41 = bswap32(__dst);
      __dst = 0;
      *(_QWORD *)(a3 + 96) = v41;
      *(_QWORD *)(a3 + 104) = 0;
      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
        *(_QWORD *)(a3 + 104) = bswap32(__dst);
LABEL_129:
      v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x200) == 0)
      {
LABEL_87:
        if ((v24 & 0x400) == 0)
          goto LABEL_88;
        goto LABEL_135;
      }
LABEL_130:
      __dst = 0;
      *(_QWORD *)(a3 + 112) = 0;
      if ((_DWORD)v7)
        goto LABEL_133;
      goto LABEL_131;
    }
    v7 = v33;
LABEL_128:
    *(_QWORD *)(a3 + 104) = 0;
    goto LABEL_129;
  }
  if ((v22 & 0x200) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_QWORD *)(a3 + 112) = 0;
LABEL_131:
    v34 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v34)
    {
      v42 = bswap32(__dst);
      __dst = 0;
      *(_QWORD *)(a3 + 112) = v42;
      *(_QWORD *)(a3 + 120) = 0;
      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
        *(_QWORD *)(a3 + 120) = bswap32(__dst);
LABEL_134:
      v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x400) == 0)
      {
LABEL_88:
        if ((v24 & 0x800) == 0)
          goto LABEL_89;
        goto LABEL_140;
      }
LABEL_135:
      __dst = 0;
      *(_QWORD *)(a3 + 128) = 0;
      if ((_DWORD)v7)
        goto LABEL_138;
      goto LABEL_136;
    }
    v7 = v34;
LABEL_133:
    *(_QWORD *)(a3 + 120) = 0;
    goto LABEL_134;
  }
  if ((v22 & 0x400) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_QWORD *)(a3 + 128) = 0;
LABEL_136:
    v35 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v35)
    {
      v43 = bswap32(__dst);
      __dst = 0;
      *(_QWORD *)(a3 + 128) = v43;
      *(_QWORD *)(a3 + 136) = 0;
      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
        *(_QWORD *)(a3 + 136) = bswap32(__dst);
LABEL_139:
      v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x800) == 0)
      {
LABEL_89:
        if ((v24 & 0x1000) == 0)
          goto LABEL_164;
        goto LABEL_144;
      }
LABEL_140:
      __dst = 0;
      *(_DWORD *)(a3 + 176) = 0;
      v36 = (_DWORD *)(a3 + 176);
      if ((_DWORD)v7)
        goto LABEL_143;
      goto LABEL_141;
    }
    v7 = v35;
LABEL_138:
    *(_QWORD *)(a3 + 136) = 0;
    goto LABEL_139;
  }
  if ((v22 & 0x800) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 176) = 0;
    v36 = (_DWORD *)(a3 + 176);
LABEL_141:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v36 = bswap32(__dst);
LABEL_143:
    if ((*(_DWORD *)v10 & 0x1000) == 0)
      goto LABEL_164;
LABEL_144:
    __dst = 0;
    *(_DWORD *)(a3 + 180) = 0;
    v37 = (int *)(a3 + 180);
    if ((_DWORD)v7)
      goto LABEL_164;
    goto LABEL_145;
  }
  if ((v22 & 0x1000) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 180) = 0;
    v37 = (int *)(a3 + 180);
LABEL_145:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if ((_DWORD)v7)
    {
      v38 = *v37;
    }
    else
    {
      v38 = bswap32(__dst);
      *v37 = v38;
    }
    if (v38 >= 1)
    {
      v44 = 0;
      v45 = a3 + 184;
      do
      {
        __dst = 0;
        *(_DWORD *)(v45 + 4 * v44) = 0;
        if (!(_DWORD)v7)
        {
          v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
          if (!(_DWORD)v7)
            *(_DWORD *)(v45 + 4 * v44) = bswap32(__dst);
        }
        ++v44;
      }
      while (v44 < *v37);
    }
LABEL_164:
    if ((*(_BYTE *)(v10 + 3) & 0x10) == 0)
      goto LABEL_175;
    __dst = 0;
    *(_DWORD *)(a3 + 204) = 0;
    v46 = (_DWORD *)(a3 + 204);
    if ((_DWORD)v7)
      goto LABEL_168;
    goto LABEL_166;
  }
  if ((v22 & 0x10000000) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 204) = 0;
    v46 = (_DWORD *)(a3 + 204);
LABEL_166:
    v47 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v47)
    {
      v62 = bswap32(__dst);
      __dst = 0;
      *(_QWORD *)(a3 + 204) = v62;
      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
        *(_DWORD *)(a3 + 208) = bswap32(__dst);
      goto LABEL_169;
    }
    v7 = v47;
LABEL_168:
    *(_DWORD *)(a3 + 208) = 0;
LABEL_169:
    if (*v46)
    {
      v48 = 0;
      v49 = a3 + 212;
      do
      {
        __dst = 0;
        *(_DWORD *)(v49 + 4 * v48) = 0;
        if (!(_DWORD)v7)
        {
          v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
          if (!(_DWORD)v7)
            *(_DWORD *)(v49 + 4 * v48) = bswap32(__dst);
        }
        ++v48;
      }
      while (v48 < *v46);
    }
LABEL_175:
    v50 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x2000) == 0)
    {
      if ((v50 & 0x4000) == 0)
        goto LABEL_177;
      goto LABEL_188;
    }
    __dst = 0;
    *(_DWORD *)(a3 + 224) = 0;
    v51 = (_DWORD *)(a3 + 224);
    if ((_DWORD)v7)
    {
LABEL_187:
      v50 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x4000) == 0)
      {
LABEL_177:
        if ((v50 & 0x8000) == 0)
          goto LABEL_178;
        goto LABEL_193;
      }
LABEL_188:
      __dst = 0;
      if ((_DWORD)v7)
        goto LABEL_191;
      goto LABEL_189;
    }
LABEL_185:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v51 = bswap32(__dst);
    goto LABEL_187;
  }
  if ((v22 & 0x2000) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 224) = 0;
    v51 = (_DWORD *)(a3 + 224);
    goto LABEL_185;
  }
  if ((v22 & 0x4000) != 0)
  {
    __dst = 0;
LABEL_189:
    v52 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v52)
    {
      LODWORD(v11) = bswap32(__dst);
      if (v11 <= 0xF)
        v7 = sub_100003EB8(a1, (char *)(a3 + 228), v11, 0);
      else
        v7 = 72;
LABEL_192:
      *(_BYTE *)(a3 + v11 + 228) = 0;
      v50 = *(_DWORD *)(a3 + 8);
      if ((v50 & 0x8000) == 0)
      {
LABEL_178:
        if ((v50 & 0x10000) == 0)
          goto LABEL_179;
        goto LABEL_197;
      }
LABEL_193:
      __dst = 0;
      *(_DWORD *)(a3 + 244) = 0;
      v53 = (_DWORD *)(a3 + 244);
      if ((_DWORD)v7)
        goto LABEL_196;
      goto LABEL_194;
    }
    v7 = v52;
LABEL_191:
    LODWORD(v11) = 0;
    goto LABEL_192;
  }
  if ((v22 & 0x8000) != 0)
  {
    LODWORD(v11) = 0;
    __dst = 0;
    *(_DWORD *)(a3 + 244) = 0;
    v53 = (_DWORD *)(a3 + 244);
LABEL_194:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v53 = bswap32(__dst);
LABEL_196:
    v50 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x10000) == 0)
    {
LABEL_179:
      if ((v50 & 0x20000) == 0)
        goto LABEL_180;
LABEL_201:
      __dst = 0;
      *(_QWORD *)(a3 + 272) = 0;
      if ((_DWORD)v7)
        goto LABEL_204;
      goto LABEL_202;
    }
LABEL_197:
    __dst = 0;
    *(_DWORD *)(a3 + 248) = 0;
    v54 = (_DWORD *)(a3 + 248);
    if ((_DWORD)v7)
      goto LABEL_200;
    goto LABEL_198;
  }
  if ((v22 & 0x10000) == 0)
  {
    if ((v22 & 0x20000) == 0)
    {
      if ((v22 & 0x40000) == 0)
      {
        if ((v22 & 0x80000) == 0)
        {
          if ((v22 & 0x100000) == 0)
          {
            if ((v22 & 0x200000) == 0)
            {
              v7 = 0;
              goto LABEL_354;
            }
            LODWORD(v11) = 0;
            __dst = 0;
            v60 = (_DWORD *)(a3 + 452);
            *(_DWORD *)(a3 + 452) = 0;
            goto LABEL_223;
          }
          LODWORD(v11) = 0;
          __dst = 0;
          *(_DWORD *)(a3 + 320) = 0;
          goto LABEL_217;
        }
        LODWORD(v11) = 0;
        __dst = 0;
        *(_QWORD *)(a3 + 304) = 0;
LABEL_212:
        v57 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
        if (!(_DWORD)v57)
        {
          v64 = bswap32(__dst);
          __dst = 0;
          *(_QWORD *)(a3 + 304) = v64;
          *(_QWORD *)(a3 + 312) = 0;
          v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
          if (!(_DWORD)v7)
            *(_QWORD *)(a3 + 312) = bswap32(__dst);
LABEL_215:
          if ((*(_DWORD *)v10 & 0x100000) == 0)
            goto LABEL_220;
LABEL_216:
          __dst = 0;
          *(_DWORD *)(a3 + 320) = 0;
          if ((_DWORD)v7)
            goto LABEL_220;
LABEL_217:
          v58 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
          if (!(_DWORD)v58)
          {
            v59 = bswap32(__dst);
            *(_DWORD *)(a3 + 320) = v59;
            v58 = sub_100003EB8(a1, (char *)(a3 + 324), v59, 0);
          }
          v7 = v58;
          goto LABEL_220;
        }
        v7 = v57;
LABEL_214:
        *(_QWORD *)(a3 + 312) = 0;
        goto LABEL_215;
      }
      LODWORD(v11) = 0;
      __dst = 0;
      v56 = (_DWORD *)(a3 + 288);
      *(_DWORD *)(a3 + 288) = 0;
      goto LABEL_208;
    }
    LODWORD(v11) = 0;
    __dst = 0;
    *(_QWORD *)(a3 + 272) = 0;
LABEL_202:
    v55 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v55)
    {
      v63 = bswap32(__dst);
      __dst = 0;
      *(_QWORD *)(a3 + 272) = v63;
      *(_QWORD *)(a3 + 280) = 0;
      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
        *(_QWORD *)(a3 + 280) = bswap32(__dst);
LABEL_205:
      v50 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x40000) == 0)
      {
LABEL_181:
        if ((v50 & 0x80000) == 0)
          goto LABEL_182;
LABEL_211:
        __dst = 0;
        *(_QWORD *)(a3 + 304) = 0;
        if ((_DWORD)v7)
          goto LABEL_214;
        goto LABEL_212;
      }
      goto LABEL_206;
    }
    v7 = v55;
LABEL_204:
    *(_QWORD *)(a3 + 280) = 0;
    goto LABEL_205;
  }
  LODWORD(v11) = 0;
  __dst = 0;
  *(_DWORD *)(a3 + 248) = 0;
  v54 = (_DWORD *)(a3 + 248);
LABEL_198:
  v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
  if (!(_DWORD)v7)
    *v54 = bswap32(__dst);
LABEL_200:
  v50 = *(_DWORD *)v10;
  if ((*(_DWORD *)v10 & 0x20000) != 0)
    goto LABEL_201;
LABEL_180:
  if ((v50 & 0x40000) == 0)
    goto LABEL_181;
LABEL_206:
  __dst = 0;
  *(_DWORD *)(a3 + 288) = 0;
  if ((_DWORD)v7)
    goto LABEL_210;
  v56 = (_DWORD *)(a3 + 288);
LABEL_208:
  v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
  if (!(_DWORD)v7)
    *v56 = bswap32(__dst);
LABEL_210:
  v50 = *(_DWORD *)v10;
  if ((*(_DWORD *)v10 & 0x80000) != 0)
    goto LABEL_211;
LABEL_182:
  if ((v50 & 0x100000) != 0)
    goto LABEL_216;
LABEL_220:
  if ((*(_BYTE *)(v10 + 2) & 0x20) == 0 || (__dst = 0, *(_DWORD *)(a3 + 452) = 0, (_DWORD)v7))
  {
LABEL_354:
    v103 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x400000) == 0)
      goto LABEL_359;
    __dst = 0;
    *(_DWORD *)(a3 + 4) = 0;
    v104 = (_DWORD *)(a3 + 4);
    if (!(_DWORD)v7)
      goto LABEL_356;
LABEL_358:
    v103 = *(_DWORD *)v10;
LABEL_359:
    if ((v103 & 0x800000) == 0)
      goto LABEL_368;
    __dst = 0;
    if ((_DWORD)v7)
      goto LABEL_362;
    goto LABEL_361;
  }
  v60 = (_DWORD *)(a3 + 452);
LABEL_223:
  v61 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
  if ((_DWORD)v61)
  {
LABEL_224:
    v7 = v61;
    goto LABEL_354;
  }
  v65 = __dst;
  v66 = bswap32(__dst);
  *v60 = v66;
  if (v66 > 0xFF)
  {
    v7 = 22;
    goto LABEL_354;
  }
  if (v65)
  {
    v67 = malloc_type_calloc(v66, 0x18uLL, 0x10A00404E934A1DuLL);
    *(_QWORD *)(a3 + 456) = v67;
    if (!v67)
    {
LABEL_353:
      v7 = 12;
      goto LABEL_354;
    }
  }
  if (!*(_DWORD *)(a3 + 452))
  {
LABEL_340:
    v100 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x400000) == 0)
    {
      if ((v100 & 0x800000) == 0)
      {
        if ((v100 & 0x1000000) == 0)
        {
          if ((v100 & 0x2000000) == 0)
          {
            if ((v100 & 0x4000000) == 0)
            {
              if ((v100 & 0x20000000) == 0)
              {
                if ((v100 & 0x40000000) == 0)
                {
                  if ((v100 & 0x80000000) == 0)
                  {
                    v102 = (int *)(a3 + 12);
                    v101 = *(_DWORD *)(a3 + 12);
                    if ((v101 & 1) == 0)
                    {
                      if ((v101 & 2) == 0)
                      {
                        if ((v101 & 4) == 0)
                        {
                          if ((v101 & 8) == 0)
                            return 0;
                          __dst = 0;
                          v128 = (_DWORD *)(a3 + 296);
                          *(_DWORD *)(a3 + 296) = 0;
LABEL_446:
                          v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                          if (!(_DWORD)v7)
                            *v128 = bswap32(__dst);
LABEL_448:
                          if ((_DWORD)v7)
                            goto LABEL_449;
                          return v7;
                        }
                        __dst = 0;
                        *(_QWORD *)(a3 + 160) = 0;
LABEL_440:
                        v127 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                        if (!(_DWORD)v127)
                        {
                          v130 = bswap32(__dst);
                          __dst = 0;
                          *(_QWORD *)(a3 + 160) = v130;
                          *(_QWORD *)(a3 + 168) = 0;
                          v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                          if (!(_DWORD)v7)
                            *(_QWORD *)(a3 + 168) = bswap32(__dst);
LABEL_443:
                          if ((*v102 & 8) == 0)
                            goto LABEL_448;
LABEL_444:
                          __dst = 0;
                          *(_DWORD *)(a3 + 296) = 0;
                          if ((_DWORD)v7)
                            goto LABEL_448;
                          v128 = (_DWORD *)(a3 + 296);
                          goto LABEL_446;
                        }
                        v7 = v127;
LABEL_442:
                        *(_QWORD *)(a3 + 168) = 0;
                        goto LABEL_443;
                      }
                      __dst = 0;
                      *(_QWORD *)(a3 + 144) = 0;
LABEL_435:
                      v126 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                      if (!(_DWORD)v126)
                      {
                        v129 = bswap32(__dst);
                        __dst = 0;
                        *(_QWORD *)(a3 + 144) = v129;
                        *(_QWORD *)(a3 + 152) = 0;
                        v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                        if (!(_DWORD)v7)
                          *(_QWORD *)(a3 + 152) = bswap32(__dst);
LABEL_438:
                        v124 = *v102;
                        if ((*v102 & 4) == 0)
                        {
LABEL_427:
                          if ((v124 & 8) == 0)
                            goto LABEL_448;
                          goto LABEL_444;
                        }
LABEL_439:
                        __dst = 0;
                        *(_QWORD *)(a3 + 160) = 0;
                        if ((_DWORD)v7)
                          goto LABEL_442;
                        goto LABEL_440;
                      }
                      v7 = v126;
LABEL_437:
                      *(_QWORD *)(a3 + 152) = 0;
                      goto LABEL_438;
                    }
                    __dst = 0;
                    v125 = (_DWORD *)(a3 + 292);
                    *(_DWORD *)(a3 + 292) = 0;
                    goto LABEL_431;
                  }
                  __dst = 0;
                  v123 = (_DWORD *)(a3 + 472);
                  *(_DWORD *)(a3 + 472) = 0;
                  goto LABEL_422;
                }
                __dst = 0;
LABEL_410:
                v120 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                if (!v120)
                {
                  v121 = bswap32(__dst);
                  if (v121 - 105 >= 0xFFFFFF98)
                    LODWORD(v7) = 0;
                  else
                    LODWORD(v7) = 22;
LABEL_413:
                  v122 = (char *)malloc_type_calloc(v121 + 1, 1uLL, 0x100004077774924uLL);
                  *(_QWORD *)(a3 + 264) = v122;
                  if (v122)
                    v7 = v7;
                  else
                    v7 = 12;
                  if (!(_DWORD)v7)
                    v7 = sub_100003EB8(a1, v122, v121, 0);
                  v119 = *(_DWORD *)v10;
LABEL_419:
                  if (v119 < 0)
                  {
                    __dst = 0;
                    *(_DWORD *)(a3 + 472) = 0;
                    if (!(_DWORD)v7)
                    {
                      v123 = (_DWORD *)(a3 + 472);
LABEL_422:
                      v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                      if (!(_DWORD)v7)
                        *v123 = bswap32(__dst);
                    }
                  }
LABEL_424:
                  v102 = (int *)(a3 + 12);
                  v124 = *(_DWORD *)(a3 + 12);
                  if ((v124 & 1) == 0)
                  {
                    if ((v124 & 2) == 0)
                      goto LABEL_426;
                    goto LABEL_434;
                  }
                  __dst = 0;
                  *(_DWORD *)(a3 + 292) = 0;
                  if ((_DWORD)v7)
                  {
LABEL_433:
                    v124 = *v102;
                    if ((*v102 & 2) == 0)
                    {
LABEL_426:
                      if ((v124 & 4) == 0)
                        goto LABEL_427;
                      goto LABEL_439;
                    }
LABEL_434:
                    __dst = 0;
                    *(_QWORD *)(a3 + 144) = 0;
                    if ((_DWORD)v7)
                      goto LABEL_437;
                    goto LABEL_435;
                  }
                  v125 = (_DWORD *)(a3 + 292);
LABEL_431:
                  v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
                  if (!(_DWORD)v7)
                    *v125 = bswap32(__dst);
                  goto LABEL_433;
                }
                LODWORD(v7) = v120;
LABEL_412:
                v121 = 0;
                goto LABEL_413;
              }
              __dst = 0;
LABEL_400:
              v116 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
              if (!v116)
              {
                v117 = bswap32(__dst);
                if (v117 - 105 >= 0xFFFFFF98)
                  LODWORD(v7) = 0;
                else
                  LODWORD(v7) = 22;
                goto LABEL_403;
              }
              LODWORD(v7) = v116;
LABEL_402:
              v117 = 0;
LABEL_403:
              v118 = (char *)malloc_type_calloc(v117 + 1, 1uLL, 0x100004077774924uLL);
              *(_QWORD *)(a3 + 256) = v118;
              if (v118)
                v7 = v7;
              else
                v7 = 12;
              if (!(_DWORD)v7)
                v7 = sub_100003EB8(a1, v118, v117, 0);
LABEL_408:
              v119 = *(_DWORD *)v10;
              if ((*(_DWORD *)v10 & 0x40000000) == 0)
                goto LABEL_419;
              __dst = 0;
              if ((_DWORD)v7)
                goto LABEL_412;
              goto LABEL_410;
            }
            __dst = 0;
LABEL_390:
            v113 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
            if (!v113)
            {
              v114 = bswap32(__dst);
              if (v114 - 1025 >= 0xFFFFFC00)
                LODWORD(v7) = 0;
              else
                LODWORD(v7) = 22;
              goto LABEL_393;
            }
            LODWORD(v7) = v113;
LABEL_392:
            v114 = 0;
LABEL_393:
            v115 = (char *)malloc_type_calloc(v114 + 1, 1uLL, 0x100004077774924uLL);
            *(_QWORD *)(a3 + 40) = v115;
            if (v115)
              v7 = v7;
            else
              v7 = 12;
            if (!(_DWORD)v7)
              v7 = sub_100003EB8(a1, v115, v114, 0);
LABEL_398:
            if ((*(_BYTE *)(v10 + 3) & 0x20) == 0)
              goto LABEL_408;
            __dst = 0;
            if ((_DWORD)v7)
              goto LABEL_402;
            goto LABEL_400;
          }
          __dst = 0;
LABEL_380:
          v110 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
          if (!v110)
          {
            v111 = bswap32(__dst);
            if (v111 - 1025 >= 0xFFFFFC00)
              LODWORD(v7) = 0;
            else
              LODWORD(v7) = 22;
            goto LABEL_383;
          }
          LODWORD(v7) = v110;
LABEL_382:
          v111 = 0;
LABEL_383:
          v112 = (char *)malloc_type_calloc(v111 + 1, 1uLL, 0x100004077774924uLL);
          *(_QWORD *)(a3 + 32) = v112;
          if (v112)
            v7 = v7;
          else
            v7 = 12;
          if (!(_DWORD)v7)
            v7 = sub_100003EB8(a1, v112, v111, 0);
LABEL_388:
          if ((*(_BYTE *)(v10 + 3) & 4) == 0)
            goto LABEL_398;
          __dst = 0;
          if ((_DWORD)v7)
            goto LABEL_392;
          goto LABEL_390;
        }
        __dst = 0;
LABEL_370:
        v107 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
        if (!v107)
        {
          v108 = bswap32(__dst);
          if (v108 - 1025 >= 0xFFFFFC00)
            LODWORD(v7) = 0;
          else
            LODWORD(v7) = 22;
          goto LABEL_373;
        }
        LODWORD(v7) = v107;
LABEL_372:
        v108 = 0;
LABEL_373:
        v109 = (char *)malloc_type_calloc(v108 + 1, 1uLL, 0x100004077774924uLL);
        *(_QWORD *)(a3 + 24) = v109;
        if (v109)
          v7 = v7;
        else
          v7 = 12;
        if (!(_DWORD)v7)
          v7 = sub_100003EB8(a1, v109, v108, 0);
LABEL_378:
        if ((*(_BYTE *)(v10 + 3) & 2) == 0)
          goto LABEL_388;
        __dst = 0;
        if ((_DWORD)v7)
          goto LABEL_382;
        goto LABEL_380;
      }
      __dst = 0;
LABEL_361:
      LODWORD(v7) = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (!(_DWORD)v7)
      {
        v105 = bswap32(__dst);
        v106 = (char *)malloc_type_calloc(1uLL, v105 + 1, 0x6704365AuLL);
        *(_QWORD *)(a3 + 464) = v106;
LABEL_363:
        if (v106)
          v7 = v7;
        else
          v7 = 12;
        if (!(_DWORD)v7)
          v7 = sub_100003EB8(a1, v106, v105, 0);
LABEL_368:
        if ((*(_BYTE *)(v10 + 3) & 1) == 0)
          goto LABEL_378;
        __dst = 0;
        if ((_DWORD)v7)
          goto LABEL_372;
        goto LABEL_370;
      }
LABEL_362:
      v105 = 0;
      v106 = *(char **)(a3 + 464);
      goto LABEL_363;
    }
    __dst = 0;
    *(_DWORD *)(a3 + 4) = 0;
    v104 = (_DWORD *)(a3 + 4);
LABEL_356:
    v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!(_DWORD)v7)
      *v104 = bswap32(__dst);
    goto LABEL_358;
  }
  v68 = 0;
  while (1)
  {
    __dst = 0;
    *(_DWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 16) = 0;
    v69 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (v69)
      goto LABEL_301;
    v70 = bswap32(__dst);
    *(_DWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 16) = v70;
    if (v70 > 0xFF)
    {
      v69 = 22;
      goto LABEL_301;
    }
    if (v70)
    {
      v71 = malloc_type_calloc(v70, 0x18uLL, 0x1090040BD55ACEDuLL);
      *(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68) = v71;
      if (!v71)
      {
        v69 = 12;
        goto LABEL_301;
      }
    }
    v72 = *(_QWORD *)(a3 + 456);
    if (!*(_DWORD *)(v72 + 24 * v68 + 16))
      goto LABEL_291;
    v73 = 0;
    do
    {
      __dst = 0;
      v69 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (v69)
      {
        v79 = *(_QWORD *)(a3 + 456);
        goto LABEL_299;
      }
      v74 = bswap32(__dst);
      if (v74 > 0x400)
        v69 = 22;
      if (v69)
        v75 = 1;
      else
        v75 = __dst == 0;
      if (!v75)
      {
        v78 = (char *)malloc_type_calloc(1uLL, v74 + 1, 0xAC826010uLL);
        v77 = v78;
        v79 = *(_QWORD *)(a3 + 456);
        *(_QWORD *)(*(_QWORD *)(v79 + 24 * v68) + 24 * v73) = v78;
        if (v78)
          goto LABEL_258;
        v69 = 12;
LABEL_299:
        *(_DWORD *)(*(_QWORD *)(v79 + 24 * v68) + 24 * v73 + 16) = 0;
        goto LABEL_300;
      }
      v76 = *(_QWORD *)(a3 + 456);
      if (v69)
        goto LABEL_259;
      v77 = *(char **)(*(_QWORD *)(v76 + 24 * v68) + 24 * v73);
LABEL_258:
      v69 = sub_100003EB8(a1, v77, v74, 0);
      v76 = *(_QWORD *)(a3 + 456);
LABEL_259:
      __dst = 0;
      *(_DWORD *)(*(_QWORD *)(v76 + 24 * v68) + 24 * v73 + 16) = 0;
      if (v69)
        goto LABEL_300;
      v69 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (v69)
        goto LABEL_300;
      v80 = bswap32(__dst);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68) + 24 * v73 + 16) = v80;
      if (v80 > 0xFF)
      {
        v69 = 22;
        goto LABEL_300;
      }
      if (v80)
      {
        v81 = malloc_type_calloc(v80, 8uLL, 0x10040436913F5uLL);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) = v81;
        if (!v81)
        {
LABEL_294:
          v69 = 12;
LABEL_300:
          LODWORD(v11) = 0;
          goto LABEL_301;
        }
      }
      v82 = 0;
      while (v82 < *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68) + 24 * v73 + 16))
      {
        __dst = 0;
        v69 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
        if (v69)
          goto LABEL_300;
        v83 = bswap32(__dst);
        if (v83 > 0xFF)
          v69 = 22;
        if (v69)
          v84 = 1;
        else
          v84 = __dst == 0;
        if (!v84)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) + 8 * v82) = malloc_type_calloc(1uLL, v83 + 1, 0x23AD49A9uLL);
          v85 = *(char **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) + 8 * v82);
          if (!v85)
            goto LABEL_294;
          goto LABEL_277;
        }
        if (!v69)
        {
          v85 = *(char **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) + 8 * v82);
LABEL_277:
          v69 = sub_100003EB8(a1, v85, v83, 0);
        }
        ++v82;
        if (v69)
          goto LABEL_300;
      }
      __dst = 0;
      v69 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
      if (v69)
        goto LABEL_300;
      if (__dst)
      {
        v11 = bswap32(__dst);
        v86 = *(_QWORD *)(a1 + 32);
        v87 = v11;
        while (v86)
        {
          if (v86 >= v87)
            v88 = v87;
          else
            v88 = v86;
          v86 -= v88;
          *(_QWORD *)(a1 + 24) += v88;
          *(_QWORD *)(a1 + 32) = v86;
          v87 -= v88;
          if (!v87)
            goto LABEL_290;
        }
        v69 = 72;
LABEL_301:
        v89 = 0;
LABEL_302:
        *(_DWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 20) = v89;
        goto LABEL_303;
      }
      LODWORD(v11) = 0;
LABEL_290:
      ++v73;
      v72 = *(_QWORD *)(a3 + 456);
    }
    while (v73 < *(unsigned int *)(v72 + 24 * v68 + 16));
LABEL_291:
    __dst = 0;
    *(_DWORD *)(v72 + 24 * v68 + 20) = 0;
    v69 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if (!v69)
    {
      v89 = bswap32(__dst);
      goto LABEL_302;
    }
LABEL_303:
    if (v69)
      v90 = 0;
    else
      v90 = v11 > 0x400;
    if (v90)
      v7 = 22;
    else
      v7 = v69;
    if ((_DWORD)v7)
      goto LABEL_354;
    v91 = *(unsigned int *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 20);
    if ((_DWORD)v91)
    {
      v92 = malloc_type_calloc(v91, 8uLL, 0x10040436913F5uLL);
      *(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 8) = v92;
      if (!v92)
        goto LABEL_353;
    }
    v93 = 0;
    while (2)
    {
      if (v93 < *(unsigned int *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 20))
      {
        __dst = 0;
        v7 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
        if ((_DWORD)v7)
          goto LABEL_354;
        v94 = bswap32(__dst);
        if (v94 <= 0x400)
          v7 = 0;
        else
          v7 = 22;
        if ((_DWORD)v7)
          v95 = 1;
        else
          v95 = __dst == 0;
        if (v95)
        {
          if (!(_DWORD)v7)
          {
            v96 = *(char **)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 8) + 8 * v93);
            goto LABEL_326;
          }
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 8) + 8 * v93) = malloc_type_calloc(1uLL, v94 + 1, 0x5874FC74uLL);
          v96 = *(char **)(*(_QWORD *)(*(_QWORD *)(a3 + 456) + 24 * v68 + 8) + 8 * v93);
          if (!v96)
            goto LABEL_353;
LABEL_326:
          v7 = sub_100003EB8(a1, v96, v94, 0);
        }
        ++v93;
        if ((_DWORD)v7)
          goto LABEL_354;
        continue;
      }
      break;
    }
    __dst = 0;
    v61 = sub_100003EB8(a1, (char *)&__dst, 4u, 0);
    if ((_DWORD)v61)
      goto LABEL_224;
    if (__dst)
      break;
    LODWORD(v11) = 0;
LABEL_339:
    if (++v68 >= (unint64_t)*v60)
      goto LABEL_340;
  }
  v97 = bswap32(__dst);
  LODWORD(v11) = v97;
  v98 = *(_QWORD *)(a1 + 32);
  while (v98)
  {
    if (v98 >= v97)
      v99 = v97;
    else
      v99 = v98;
    v98 -= v99;
    *(_QWORD *)(a1 + 24) += v99;
    *(_QWORD *)(a1 + 32) = v98;
    v97 -= v99;
    if (!v97)
      goto LABEL_339;
  }
  v131 = *(_DWORD *)v10;
  if ((*(_DWORD *)v10 & 0x400000) != 0)
  {
    *(_DWORD *)(a3 + 4) = 0;
    v7 = 72;
    goto LABEL_358;
  }
  if ((v131 & 0x800000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_362;
  }
  if ((v131 & 0x1000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_372;
  }
  if ((v131 & 0x2000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_382;
  }
  if ((v131 & 0x4000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_392;
  }
  if ((v131 & 0x20000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_402;
  }
  if ((v131 & 0x40000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_412;
  }
  if (v131 < 0)
  {
    *(_DWORD *)(a3 + 472) = 0;
    v7 = 72;
    goto LABEL_424;
  }
  v102 = (int *)(a3 + 12);
  v132 = *(_DWORD *)(a3 + 12);
  if ((v132 & 1) != 0)
  {
    *(_DWORD *)(a3 + 292) = 0;
    v7 = 72;
    goto LABEL_433;
  }
  if ((v132 & 2) != 0)
  {
    *(_QWORD *)(a3 + 144) = 0;
    v7 = 72;
    goto LABEL_437;
  }
  if ((v132 & 4) != 0)
  {
    *(_QWORD *)(a3 + 160) = 0;
    v7 = 72;
    goto LABEL_442;
  }
  if ((v132 & 8) != 0)
    *(_DWORD *)(a3 + 296) = 0;
  v7 = 72;
LABEL_449:
  sub_1000062E0(a3);
  return v7;
}

const char *sub_100008010(const char *a1)
{
  const char *v2;

  v2 = "tcp";
  if (strcmp(a1, "tcp"))
  {
    v2 = "udp";
    if (strcmp(a1, "udp"))
    {
      if (!strcmp(a1, "tcp4"))
      {
        return "proto=tcp";
      }
      else if (!strcmp(a1, "udp4"))
      {
        return "proto=udp";
      }
      else if (!strcmp(a1, "tcp6"))
      {
        return "proto=tcp6";
      }
      else if (!strcmp(a1, "udp6"))
      {
        return "proto=udp6";
      }
      else
      {
        v2 = "inet4";
        if (strcmp(a1, "inet4"))
        {
          v2 = "inet6";
          if (strcmp(a1, "inet6"))
          {
            v2 = "inet";
            if (strcmp(a1, "inet"))
            {
              v2 = "ticlts";
              if (strcmp(a1, "ticlts"))
              {
                v2 = "ticotsord";
                if (strcmp(a1, "ticotsord"))
                  return a1;
              }
            }
          }
        }
      }
    }
  }
  return v2;
}

uint64_t sub_100008158(uint64_t a1, unsigned int a2)
{
  int v3;
  char v4;
  char **v5;
  int v6;
  char **v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  const char *v26;
  int v27;
  int v28;
  int v29;
  const char *v30;
  const char *v31;
  int v32;
  int v33;
  uint64_t result;
  uint64_t v35;
  uint64_t (*v36)();
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  int v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t i;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _DWORD *v59;
  int v60;
  int v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  const char *v75;
  const char *v76;
  unsigned int v77;
  const char *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  unsigned int v83;
  const char *v84;
  uint64_t v86;
  int v87;
  char __str[1024];

  bzero(__str, 0x400uLL);
  v87 = *(_DWORD *)(a1 + 4);
  ((void (*)(const char *, const char *, int *))off_100010050[6])("     ", "General mount flags", &v87);
  v3 = v87;
  if (v87)
  {
    v4 = 32;
    v5 = &off_10000C7D0;
    while (1)
    {
      v6 = *((_DWORD *)v5 - 2);
      if (!v6)
        break;
      if ((v6 & v3) != 0)
      {
        ((void (*)(_QWORD, char *, void *))off_100010050[7])(v4, *v5, &unk_10000AAA3);
        v3 = v87 & ~v6;
        v87 = v3;
        v4 = 44;
      }
      v5 += 2;
      if (!v3)
        goto LABEL_13;
    }
    v7 = &off_10000C8D0;
    do
    {
      v8 = *((_DWORD *)v7 - 2);
      if (!v8)
        break;
      if ((v8 & v3) != 0)
      {
        ((void (*)(_QWORD, char *, void *))off_100010050[7])(v4, *v7, &unk_10000AAA3);
        v3 = v87 & ~v8;
        v87 = v3;
        v4 = 44;
      }
      v7 += 2;
    }
    while (v3);
  }
LABEL_13:
  ((void (*)(uint64_t))off_100010050[9])(1);
  ((void (*)(const char *, const char *, _QWORD))off_100010050[6])("     ", "NFS parameters", 0);
  v9 = *(_DWORD *)(a1 + 8);
  if ((v9 & 2) != 0)
  {
    v11 = snprintf(__str, 0x400uLL, "vers=%d", *(_DWORD *)(a1 + 48));
    LODWORD(v12) = v11;
    if ((*(_BYTE *)(a1 + 8) & 4) != 0)
    {
      v13 = snprintf(&__str[v11], 1024 - v11, ".%d", *(_DWORD *)(a1 + 52));
LABEL_22:
      LODWORD(v12) = v13 + v12;
    }
  }
  else
  {
    if ((v9 & 0x8000000) == 0)
    {
      v10 = 32;
      goto LABEL_24;
    }
    v14 = (unsigned __int16)*(_DWORD *)(a1 + 56);
    v15 = snprintf(__str, 0x400uLL, "vers=%d", HIWORD(*(_DWORD *)(a1 + 56)));
    v16 = v15;
    if (v14)
      v16 = snprintf(&__str[v15], 1024 - v15, ".%d", v14) + v15;
    v17 = (unsigned __int16)*(_DWORD *)(a1 + 60);
    v12 = snprintf(&__str[v16], 1024 - v16, "-%d", HIWORD(*(_DWORD *)(a1 + 60))) + (uint64_t)v16;
    if (v17)
    {
      v13 = snprintf(&__str[v12], 1024 - v12, ".%d", v17);
      goto LABEL_22;
    }
  }
  __str[(int)v12] = 0;
  ((void (*)(uint64_t, char *, void *))off_100010050[7])(32, __str, &unk_10000AAA3);
  v10 = 44;
LABEL_24:
  v18 = *(_DWORD *)(a1 + 8);
  if ((v18 & 0x4000) != 0)
  {
    v36 = off_100010050[7];
    v37 = sub_100008010((const char *)(a1 + 228));
    ((void (*)(uint64_t, const char *, void *))v36)(v10, v37, &unk_10000AAA3);
    v18 = *(_DWORD *)(a1 + 8);
    v10 = 44;
    if ((v18 & 0x8000) == 0)
    {
LABEL_26:
      if ((v18 & 0x20000000) == 0)
        goto LABEL_27;
      goto LABEL_111;
    }
  }
  else if ((v18 & 0x8000) == 0)
  {
    goto LABEL_26;
  }
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "port=", *(unsigned int *)(a1 + 244));
  v18 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v18 & 0x20000000) == 0)
  {
LABEL_27:
    if ((v18 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_112;
  }
LABEL_111:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[7])(v10, "port=", *(_QWORD *)(a1 + 256));
  v18 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v18 & 0x10000) == 0)
  {
LABEL_28:
    if ((v18 & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_112:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "mountport=", *(unsigned int *)(a1 + 248));
  v10 = 44;
  if ((*(_DWORD *)(a1 + 8) & 0x40000000) != 0)
  {
LABEL_29:
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[7])(v10, "mountport=", *(_QWORD *)(a1 + 264));
    v10 = 44;
  }
LABEL_30:
  v19 = *(_DWORD *)(a1 + 16);
  if ((v19 & 0x10000) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x10000) != 0)
      v38 = (const char *)&unk_10000AAA3;
    else
      v38 = "no";
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v38, "mntudp");
    v19 = *(_DWORD *)(a1 + 16);
    v10 = 44;
    if ((v19 & 1) == 0)
    {
LABEL_32:
      if ((v19 & 2) == 0)
        goto LABEL_33;
      goto LABEL_122;
    }
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_32;
  }
  if ((*(_DWORD *)(a1 + 20) & 1) != 0)
    v39 = "soft";
  else
    v39 = "hard";
  ((void (*)(uint64_t, const char *, void *))off_100010050[7])(v10, v39, &unk_10000AAA3);
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 2) == 0)
  {
LABEL_33:
    if ((v19 & 4) == 0)
      goto LABEL_34;
    goto LABEL_126;
  }
LABEL_122:
  if ((*(_DWORD *)(a1 + 20) & 2) != 0)
    v40 = (const char *)&unk_10000AAA3;
  else
    v40 = "no";
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v40, "intr");
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 4) == 0)
  {
LABEL_34:
    if ((v19 & 8) == 0)
      goto LABEL_35;
    goto LABEL_130;
  }
LABEL_126:
  if ((*(_DWORD *)(a1 + 20) & 4) != 0)
    v41 = (const char *)&unk_10000AAA3;
  else
    v41 = "no";
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v41, "resvport");
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 8) == 0)
  {
LABEL_35:
    if ((v19 & 0x400) == 0)
      goto LABEL_36;
    goto LABEL_134;
  }
LABEL_130:
  if ((*(_DWORD *)(a1 + 20) & 8) != 0)
    v42 = "no";
  else
    v42 = (const char *)&unk_10000AAA3;
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v42, "conn");
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 0x400) == 0)
  {
LABEL_36:
    if ((v19 & 0x80) == 0)
      goto LABEL_37;
    goto LABEL_138;
  }
LABEL_134:
  if ((*(_DWORD *)(a1 + 20) & 0x400) != 0)
    v43 = "no";
  else
    v43 = (const char *)&unk_10000AAA3;
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v43, "callback");
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 0x80) == 0)
  {
LABEL_37:
    if ((v19 & 0x800) == 0)
      goto LABEL_38;
    goto LABEL_142;
  }
LABEL_138:
  if ((*(_DWORD *)(a1 + 20) & 0x80) != 0)
    v44 = "no";
  else
    v44 = (const char *)&unk_10000AAA3;
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v44, "negnamecache");
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 0x800) == 0)
  {
LABEL_38:
    if ((v19 & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_146;
  }
LABEL_142:
  if ((*(_DWORD *)(a1 + 20) & 0x800) != 0)
    v45 = (const char *)&unk_10000AAA3;
  else
    v45 = "no";
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v45, "namedattr");
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 0x1000) == 0)
  {
LABEL_39:
    if ((v19 & 0x2000) == 0)
      goto LABEL_40;
    goto LABEL_150;
  }
LABEL_146:
  if ((*(_DWORD *)(a1 + 20) & 0x1000) != 0)
    v46 = "no";
  else
    v46 = (const char *)&unk_10000AAA3;
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v46, "acl");
  v19 = *(_DWORD *)(a1 + 16);
  v10 = 44;
  if ((v19 & 0x2000) == 0)
  {
LABEL_40:
    if ((v19 & 0x20) == 0)
      goto LABEL_45;
    goto LABEL_41;
  }
LABEL_150:
  if ((*(_DWORD *)(a1 + 20) & 0x2000) != 0)
    v47 = (const char *)&unk_10000AAA3;
  else
    v47 = "no";
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v47, "aclonly");
  v10 = 44;
  if ((*(_DWORD *)(a1 + 16) & 0x20) != 0)
  {
LABEL_41:
    if ((*(_DWORD *)(a1 + 20) & 0x20) != 0)
      v20 = (const char *)&unk_10000AAA3;
    else
      v20 = "no";
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v20, "callumnt");
    v10 = 44;
  }
LABEL_45:
  if ((*(_BYTE *)(a1 + 9) & 8) != 0)
  {
    v21 = *(int *)(a1 + 176);
    if (v21 <= 2)
    {
      ((void (*)(uint64_t, char *, void *))off_100010050[7])(v10, (&off_10000C948)[v21], &unk_10000AAA3);
      v10 = 44;
    }
  }
  if ((*(_BYTE *)(a1 + 17) & 0x80) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x8000) != 0)
      v22 = "no";
    else
      v22 = (const char *)&unk_10000AAA3;
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v22, "quota");
    v10 = 44;
  }
  v23 = *(_DWORD *)(a1 + 8);
  if ((v23 & 8) != 0)
  {
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "rsize=", *(unsigned int *)(a1 + 64));
    v23 = *(_DWORD *)(a1 + 8);
    v10 = 44;
    if ((v23 & 0x10) == 0)
    {
LABEL_55:
      if ((v23 & 0x40) == 0)
        goto LABEL_56;
      goto LABEL_157;
    }
  }
  else if ((v23 & 0x10) == 0)
  {
    goto LABEL_55;
  }
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "wsize=", *(unsigned int *)(a1 + 68));
  v23 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v23 & 0x40) == 0)
  {
LABEL_56:
    if ((v23 & 0x20) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_157:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "readahead=", *(unsigned int *)(a1 + 76));
  v10 = 44;
  if ((*(_DWORD *)(a1 + 8) & 0x20) != 0)
  {
LABEL_57:
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "dsize=", *(unsigned int *)(a1 + 72));
    v10 = 44;
  }
LABEL_58:
  v24 = *(_DWORD *)(a1 + 16);
  if ((v24 & 0x40) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x40) != 0)
      v25 = (const char *)&unk_10000AAA3;
    else
      v25 = "no";
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v25, "rdirplus");
    v24 = *(_DWORD *)(a1 + 16);
    v10 = 44;
  }
  if ((v24 & 0x10) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x10) != 0)
      v26 = (const char *)&unk_10000AAA3;
    else
      v26 = "no";
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v26, "dumbtimer");
    v10 = 44;
  }
  v27 = *(_DWORD *)(a1 + 8);
  if ((v27 & 0x20000) != 0)
  {
    ((void (*)(uint64_t, const char *, uint64_t))off_100010050[8])(v10, "timeo=", *(_QWORD *)(a1 + 280) % 100000000 + 10 * *(_QWORD *)(a1 + 272));
    v27 = *(_DWORD *)(a1 + 8);
    v10 = 44;
    if ((v27 & 0x40000) == 0)
    {
LABEL_70:
      if ((v27 & 0x2000) == 0)
        goto LABEL_71;
      goto LABEL_161;
    }
  }
  else if ((v27 & 0x40000) == 0)
  {
    goto LABEL_70;
  }
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "retrans=", *(unsigned int *)(a1 + 288));
  v27 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v27 & 0x2000) == 0)
  {
LABEL_71:
    if ((v27 & 0x80) == 0)
      goto LABEL_72;
    goto LABEL_162;
  }
LABEL_161:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "maxgroups=", *(unsigned int *)(a1 + 224));
  v27 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v27 & 0x80) == 0)
  {
LABEL_72:
    if ((v27 & 0x100) == 0)
      goto LABEL_73;
    goto LABEL_163;
  }
LABEL_162:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "acregmin=", *(_QWORD *)(a1 + 80));
  v27 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v27 & 0x100) == 0)
  {
LABEL_73:
    if ((v27 & 0x200) == 0)
      goto LABEL_74;
    goto LABEL_164;
  }
LABEL_163:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "acregmax=", *(_QWORD *)(a1 + 96));
  v27 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v27 & 0x200) == 0)
  {
LABEL_74:
    if ((v27 & 0x400) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_164:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "acdirmin=", *(_QWORD *)(a1 + 112));
  v10 = 44;
  if ((*(_DWORD *)(a1 + 8) & 0x400) != 0)
  {
LABEL_75:
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "acdirmax=", *(_QWORD *)(a1 + 128));
    v10 = 44;
  }
LABEL_76:
  v28 = *(_DWORD *)(a1 + 12);
  if ((v28 & 2) != 0)
  {
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "acrootdirmin=", *(_QWORD *)(a1 + 144));
    v28 = *(_DWORD *)(a1 + 12);
    v10 = 44;
  }
  if ((v28 & 4) != 0)
  {
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "acrootdirmax=", *(_QWORD *)(a1 + 160));
    v10 = 44;
  }
  if ((*(_BYTE *)(a1 + 10) & 8) != 0)
  {
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "deadtimeout=", *(_QWORD *)(a1 + 304));
    v10 = 44;
  }
  v29 = *(_DWORD *)(a1 + 16);
  if ((v29 & 0x100) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x100) != 0)
      v48 = (const char *)&unk_10000AAA3;
    else
      v48 = "no";
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v48, "mutejukebox");
    v29 = *(_DWORD *)(a1 + 16);
    v10 = 44;
    if ((v29 & 0x200) == 0)
    {
LABEL_84:
      if ((v29 & 0x4000) == 0)
        goto LABEL_89;
      goto LABEL_85;
    }
  }
  else if ((v29 & 0x200) == 0)
  {
    goto LABEL_84;
  }
  if ((*(_DWORD *)(a1 + 20) & 0x200) != 0)
    v49 = (const char *)&unk_10000AAA3;
  else
    v49 = "no";
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v49, "ephemeral");
  v10 = 44;
  if ((*(_DWORD *)(a1 + 16) & 0x4000) != 0)
  {
LABEL_85:
    if ((*(_DWORD *)(a1 + 20) & 0x4000) != 0)
      v30 = (const char *)&unk_10000AAA3;
    else
      v30 = "no";
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v30, "nfc");
    v10 = 44;
  }
LABEL_89:
  if (dword_100010198 && (*(_BYTE *)(a1 + 18) & 0x10) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x100000) != 0)
      v31 = (const char *)&unk_10000AAA3;
    else
      v31 = "no";
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v31, "skip_renew");
    v10 = 44;
  }
  v32 = *(_DWORD *)(a1 + 8);
  v86 = a1;
  if ((v32 & 0x1000) == 0)
  {
    if ((v32 & 0x10000000) == 0)
      goto LABEL_97;
    goto LABEL_233;
  }
  v50 = *(_DWORD *)(a1 + 184);
  if (v50 <= 390002)
  {
    if (!v50)
    {
      v51 = "none";
      goto LABEL_216;
    }
    if (v50 == 1)
    {
      v51 = "sys";
      goto LABEL_216;
    }
  }
  else
  {
    switch(v50)
    {
      case 390003:
        v51 = "krb5";
        goto LABEL_216;
      case 390004:
        v51 = "krb5i";
        goto LABEL_216;
      case 390005:
        v51 = "krb5p";
        goto LABEL_216;
    }
  }
  v51 = "?";
LABEL_216:
  v71 = snprintf(__str, 0x400uLL, "sec=%s", v51);
  if (*(int *)(a1 + 180) >= 2)
  {
    v72 = 47;
    v73 = v86;
    while (1)
    {
      v74 = *(_DWORD *)(v73 + 4 * v72);
      if (v74 <= 390002)
      {
        v75 = "none";
        if (v74)
        {
          if (v74 != 1)
          {
LABEL_228:
            v75 = "?";
            goto LABEL_229;
          }
          v75 = "sys";
        }
      }
      else
      {
        switch(v74)
        {
          case 390003:
            v75 = "krb5";
            break;
          case 390004:
            v75 = "krb5i";
            break;
          case 390005:
            v75 = "krb5p";
            break;
          default:
            goto LABEL_228;
        }
      }
LABEL_229:
      ++v72;
      v71 += snprintf(&__str[v71], 1024 - v71, ":%s", v75);
      v73 = v86;
      if (v72 - 46 >= *(int *)(v86 + 180))
        goto LABEL_232;
    }
  }
  v73 = a1;
LABEL_232:
  __str[v71] = 0;
  ((void (*)(uint64_t, char *, void *))off_100010050[7])(v10, __str, &unk_10000AAA3);
  v32 = *(_DWORD *)(v73 + 8);
  v10 = 44;
  a1 = v73;
  if ((v32 & 0x10000000) == 0)
  {
LABEL_97:
    if ((v32 & 0x1000000) == 0)
      goto LABEL_98;
    goto LABEL_250;
  }
LABEL_233:
  if (*(_DWORD *)(a1 + 208))
    v76 = (const char *)&unk_10000AAA3;
  else
    v76 = "*";
  v77 = *(_DWORD *)(a1 + 212) - 16;
  if (v77 > 2)
    v78 = "?";
  else
    v78 = (&off_10000C960)[v77];
  v79 = snprintf(__str, 0x400uLL, "etype=%s%s", v76, v78);
  if (*(_DWORD *)(v86 + 204) < 2u)
  {
    v81 = v86;
  }
  else
  {
    v80 = 54;
    v81 = v86;
    do
    {
      if (v80 - 53 == *(_DWORD *)(v81 + 208))
        v82 = "*";
      else
        v82 = (const char *)&unk_10000AAA3;
      v83 = *(_DWORD *)(v81 + 4 * v80) - 16;
      v84 = "?";
      if (v83 <= 2)
        v84 = (&off_10000C960)[v83];
      ++v80;
      v79 += snprintf(&__str[v79], 1024 - v79, ":%s%s", v82, v84);
      v81 = v86;
    }
    while (v80 - 53 < (unint64_t)*(unsigned int *)(v86 + 204));
  }
  __str[v79] = 0;
  ((void (*)(uint64_t, char *, void *))off_100010050[7])(v10, __str, &unk_10000AAA3);
  v32 = *(_DWORD *)(v81 + 8);
  v10 = 44;
  a1 = v81;
  if ((v32 & 0x1000000) == 0)
  {
LABEL_98:
    if ((v32 & 0x2000000) == 0)
      goto LABEL_99;
    goto LABEL_251;
  }
LABEL_250:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[7])(v10, "realm=", *(_QWORD *)(a1 + 24));
  v32 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v32 & 0x2000000) == 0)
  {
LABEL_99:
    if ((v32 & 0x4000000) == 0)
      goto LABEL_100;
LABEL_252:
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[7])(v10, "sprincipalm=", *(_QWORD *)(a1 + 40));
    v10 = 44;
    if ((*(_DWORD *)(a1 + 8) & 0x80000000) == 0)
      goto LABEL_101;
LABEL_253:
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "owner=", *(unsigned int *)(a1 + 472));
    v10 = 44;
    goto LABEL_101;
  }
LABEL_251:
  ((void (*)(uint64_t, const char *, _QWORD))off_100010050[7])(v10, "principal=", *(_QWORD *)(a1 + 32));
  v32 = *(_DWORD *)(a1 + 8);
  v10 = 44;
  if ((v32 & 0x4000000) != 0)
    goto LABEL_252;
LABEL_100:
  if (v32 < 0)
    goto LABEL_253;
LABEL_101:
  v33 = *(_DWORD *)(a1 + 12);
  if (dword_100010198 && (v33 & 1) != 0)
  {
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "readlink_nocache=", *(int *)(a1 + 292));
    v33 = *(_DWORD *)(a1 + 12);
    v10 = 44;
  }
  if ((v33 & 8) != 0)
    ((void (*)(uint64_t, const char *, _QWORD))off_100010050[8])(v10, "accesscache=", *(int *)(a1 + 296));
  result = ((uint64_t (*)(_QWORD))off_100010050[9])(0);
  if ((*(_BYTE *)(a1 + 10) & 0x20) != 0)
  {
    v35 = ((uint64_t (*)(const char *, const char *, _QWORD))off_100010050[6])("     ", "File system locations", 0);
    ((void (*)(uint64_t))off_100010050[2])(v35);
    if (a2 <= 0x57)
    {
      ((void (*)(const char *, _QWORD))off_100010050[4])("       ", 0);
      if (*(_QWORD *)(a1 + 464))
        v52 = *(const char **)(a1 + 464);
      else
        v52 = "???";
      v53 = ((uint64_t (*)(const char *))off_100010050[11])(v52);
      v54 = ((uint64_t (*)(uint64_t))off_100010050[5])(v53);
      ((void (*)(uint64_t))off_100010050[2])(v54);
    }
    if ((a2 == 88 || dword_100010198) && *(_DWORD *)(a1 + 452))
    {
      for (i = 0; i < *(unsigned int *)(a1 + 452); ++i)
      {
        v56 = ((uint64_t (*)(const char *, _QWORD))off_100010050[4])("       ", 0);
        v57 = *(_QWORD *)(a1 + 456);
        v58 = v57 + 24 * i;
        v60 = *(_DWORD *)(v58 + 20);
        v59 = (_DWORD *)(v58 + 20);
        if (v60)
        {
          v61 = 0;
        }
        else
        {
          strcpy(__str, "/");
          v61 = 1;
          if (!*v59)
            goto LABEL_197;
        }
        v62 = 0;
        do
        {
          v63 = *(_QWORD *)(v57 + 24 * i + 8);
          if (*(_QWORD *)(v63 + 8 * v62) && !strncmp(*(const char **)(v63 + 8 * v62), "ftp:", 4uLL))
            v56 = snprintf(&__str[v61], 1024 - v61, "%s/");
          else
            v56 = snprintf(&__str[v61], 1024 - v61, "/%s");
          v61 += v56;
          ++v62;
          a1 = v86;
          v57 = *(_QWORD *)(v86 + 456);
        }
        while (v62 < *(unsigned int *)(v57 + 24 * i + 20));
LABEL_197:
        __str[v61] = 0;
        if (*(_DWORD *)(v57 + 24 * i + 16))
        {
          v64 = 0;
          v65 = 0;
          do
          {
            v66 = *(_QWORD *)(v57 + 24 * i);
            v67 = *(const char **)(v66 + v64);
            if (v67)
            {
              v68 = v66 + v64;
              v69 = *(unsigned int *)(v68 + 16);
              v70 = *(_QWORD *)(v68 + 8);
            }
            else
            {
              v67 = "<local domaim>";
              v69 = 0;
              v70 = 0;
            }
            v56 = ((uint64_t (*)(char *, const char *, uint64_t, uint64_t))off_100010050[11])(__str, v67, v69, v70);
            ++v65;
            v57 = *(_QWORD *)(a1 + 456);
            v64 += 24;
          }
          while (v65 < *(unsigned int *)(v57 + 24 * i + 16));
        }
        ((void (*)(uint64_t))off_100010050[5])(v56);
      }
    }
    result = ((uint64_t (*)(_QWORD))off_100010050[9])(0);
  }
  if (dword_100010198)
  {
    if ((*(_BYTE *)(a1 + 10) & 0x10) != 0)
      return ((uint64_t (*)(_QWORD, uint64_t))off_100010050[13])(*(unsigned int *)(a1 + 320), a1 + 324);
  }
  return result;
}

void sub_100009238(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  int v8;
  uint64_t v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  const char *v49;
  uint64_t (*v50)();
  _BOOL8 v51;
  uint64_t *p_dst;
  uint64_t v53;
  uint64_t __dst;
  unsigned int v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  _OWORD v60[3];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _OWORD v88[30];
  _WORD v89[512];

  v59 = 0;
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  bzero(v89, 0x400uLL);
  v55 = 0;
  memset(v88, 0, sizeof(v88));
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  memset(v60, 0, sizeof(v60));
  sub_100003E78((uint64_t)&v56, a2, a3);
  LODWORD(__dst) = 0;
  v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
  if (v8)
    goto LABEL_2;
  if ((_DWORD)__dst)
  {
    printf("%s unknown mount info version %d\n\n");
    return;
  }
  LODWORD(__dst) = 0;
  v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
  if (v8)
    goto LABEL_2;
  if (bswap32(__dst) <= a3)
  {
    LODWORD(__dst) = 0;
    v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
    if (v8)
      goto LABEL_2;
    v10 = __dst;
    if ((_DWORD)__dst)
    {
      LODWORD(__dst) = 0;
      v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
      if (v8)
        goto LABEL_2;
      v11 = bswap32(__dst);
      v12 = 1;
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    v13 = bswap32(v10);
    if (v12 >= v13)
    {
      v8 = 0;
    }
    else
    {
      v8 = 0;
      v15 = *((_QWORD *)&v57 + 1);
      v14 = v58;
      do
      {
        if (!v8)
        {
          v16 = 4;
          while (v14)
          {
            if (v14 >= v16)
              v17 = v16;
            else
              v17 = v14;
            v15 += v17;
            v14 -= v17;
            *((_QWORD *)&v57 + 1) = v15;
            *(_QWORD *)&v58 = v14;
            v16 -= v17;
            if (!v16)
            {
              v8 = 0;
              goto LABEL_26;
            }
          }
          v8 = 72;
        }
LABEL_26:
        ++v12;
      }
      while (v12 != v13);
      v12 = v13;
    }
    do
    {
      v18 = v12;
      v19 = v11;
      v12 = 1;
      v11 = 0;
    }
    while (!v18);
    if ((v19 & 1) != 0)
    {
      LODWORD(__dst) = 0;
      if (v8)
        goto LABEL_2;
      v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
      if (v8)
        goto LABEL_2;
      v26 = __dst;
      if ((_DWORD)__dst)
      {
        LODWORD(__dst) = 0;
        v55 = 0;
        v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
        if (v8)
          goto LABEL_2;
        v27 = bswap32(__dst);
        v28 = 1;
      }
      else
      {
        v28 = 0;
        v27 = 0;
      }
      v29 = bswap32(v26);
      if (v28 >= v29)
      {
        v8 = 0;
      }
      else
      {
        v8 = 0;
        v31 = *((_QWORD *)&v57 + 1);
        v30 = v58;
        do
        {
          if (!v8)
          {
            v32 = 4;
            while (v30)
            {
              if (v30 >= v32)
                v33 = v32;
              else
                v33 = v30;
              v31 += v33;
              v30 -= v33;
              *((_QWORD *)&v57 + 1) = v31;
              *(_QWORD *)&v58 = v30;
              v32 -= v33;
              if (!v32)
              {
                v8 = 0;
                goto LABEL_66;
              }
            }
            v8 = 72;
          }
LABEL_66:
          ++v28;
        }
        while (v28 != v29);
        v28 = v29;
      }
      do
      {
        v44 = v28;
        v45 = v27;
        v28 = 1;
        v27 = 0;
      }
      while (!v44);
      v55 = v45;
      if (v8)
        goto LABEL_2;
    }
    else if (v8)
    {
      goto LABEL_2;
    }
    if ((v19 & 2) != 0)
    {
      LODWORD(__dst) = 0;
      v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
      if (!v8)
        v8 = sub_100006530((uint64_t)&v56, bswap32(__dst), (uint64_t)v88);
      if ((v19 & 4) == 0)
      {
        v24 = 1;
        goto LABEL_50;
      }
      LODWORD(__dst) = 0;
      if (v8)
      {
LABEL_49:
        v24 = 0;
LABEL_50:
        if ((v19 & 8) == 0)
        {
          v23 = 0;
          v22 = 0;
          v21 = 0;
          v20 = 0;
          v25 = 1;
          goto LABEL_75;
        }
        LODWORD(__dst) = 0;
        if (v8)
          goto LABEL_70;
        goto LABEL_69;
      }
    }
    else
    {
      if ((v19 & 4) == 0)
      {
        if ((v19 & 8) == 0)
        {
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 1;
          v25 = 1;
LABEL_76:
          if ((BYTE8(v60[0]) & 2) != 0
            && ((a4 & 1) == 0 && v61 < 4 || (a4 & 2) == 0 && v61 > 3))
          {
            goto LABEL_4;
          }
          v34 = ((uint64_t (*)(uint64_t, uint64_t))off_100010050[12])(a1 + 88, a1 + 1112);
          if ((v19 & 2) != 0)
          {
            ((void (*)(const char *, const char *))off_100010050[3])("  -- ", "Original mount options");
            v35 = sub_100008158((uint64_t)v88, v88[0]);
            v34 = ((uint64_t (*)(uint64_t))off_100010050[5])(v35);
            if ((v24 & 1) != 0)
            {
LABEL_79:
              if ((v19 & 1) == 0)
                goto LABEL_119;
LABEL_114:
              ((void (*)(const char *, const char *, unsigned int *))off_100010050[6])("     ", "Status flags", &v55);
              v47 = v55;
              if ((v55 & 1) != 0)
              {
                ((void (*)(uint64_t, const char *, void *))off_100010050[7])(44, "dead", &unk_10000AAA3);
                v47 = v55;
                if ((v55 & 2) == 0)
                {
LABEL_116:
                  if ((v47 & 4) == 0)
                  {
LABEL_118:
                    v34 = ((uint64_t (*)(uint64_t))off_100010050[9])(1);
LABEL_119:
                    v9 = ((uint64_t (*)(uint64_t))off_100010050[5])(v34);
                    goto LABEL_3;
                  }
LABEL_117:
                  ((void (*)(uint64_t, const char *, void *))off_100010050[7])(44, "recovery", &unk_10000AAA3);
                  goto LABEL_118;
                }
              }
              else if ((v55 & 2) == 0)
              {
                goto LABEL_116;
              }
              ((void (*)(uint64_t, const char *, void *))off_100010050[7])(44, "not responding", &unk_10000AAA3);
              if ((v55 & 4) == 0)
                goto LABEL_118;
              goto LABEL_117;
            }
          }
          else if ((v24 & 1) != 0)
          {
            goto LABEL_79;
          }
          ((void (*)(const char *, const char *))off_100010050[3])("  -- ", "Current mount parameters");
          v36 = sub_100008158((uint64_t)v60, v88[0]);
          if ((v25 & 1) == 0
            && (dword_100010198
             || DWORD1(v86) > 1
             || *(_DWORD *)(*((_QWORD *)&v86 + 1) + 16) > 1u
             || *(_DWORD *)(**((_QWORD **)&v86 + 1) + 16) >= 2u))
          {
            if (v22 >= DWORD1(v86)
              || v21 >= *(_DWORD *)(*((_QWORD *)&v86 + 1) + 24 * v22 + 16)
              || v20 >= *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v86 + 1) + 24 * v22)
                                                + 24 * v21
                                                + 16))
            {
              v46 = ((uint64_t (*)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_100010050[10])("     ", "Current location", v23, v22, v21, v20, 1);
            }
            else
            {
              v37 = ((uint64_t (*)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))off_100010050[10])("     ", "Current location", v23, v22, v21, v20, 0);
              ((void (*)(uint64_t))off_100010050[2])(v37);
              ((void (*)(const char *))off_100010050[1])("       ");
              v38 = *((_QWORD *)&v86 + 1);
              if (*(_DWORD *)(*((_QWORD *)&v86 + 1) + 24 * v22 + 20))
              {
                v39 = 0;
                v40 = 0;
                do
                {
                  v41 = *(_QWORD *)(v38 + 24 * v22 + 8);
                  if (*(_QWORD *)(v41 + 8 * v39) && !strncmp(*(const char **)(v41 + 8 * v39), "ftp:", 4uLL))
                    v42 = snprintf((char *)v89 + v40, 1024 - v40, "%s/");
                  else
                    v42 = snprintf((char *)v89 + v40, 1024 - v40, "/%s");
                  v40 += v42;
                  ++v39;
                  v38 = *((_QWORD *)&v86 + 1);
                }
                while (v39 < *(unsigned int *)(*((_QWORD *)&v86 + 1) + 24 * v22 + 20));
                v43 = v40;
              }
              else
              {
                v89[0] = 47;
                v43 = 1;
              }
              *((_BYTE *)v89 + v43) = 0;
              v48 = *(_QWORD *)(v38 + 24 * v22);
              v49 = *(const char **)(v48 + 24 * v21);
              if (v49)
              {
                __dst = *(_QWORD *)(*(_QWORD *)(v48 + 24 * v21 + 8) + 8 * v20);
                v50 = off_100010050[11];
                v51 = __dst != 0;
                p_dst = &__dst;
              }
              else
              {
                v50 = off_100010050[11];
                v49 = "<local domain>";
                v51 = 0;
                p_dst = 0;
              }
              v53 = ((uint64_t (*)(_WORD *, const char *, _BOOL8, uint64_t *))v50)(v89, v49, v51, p_dst);
              v46 = ((uint64_t (*)(uint64_t))off_100010050[2])(v53);
            }
            v36 = ((uint64_t (*)(uint64_t))off_100010050[5])(v46);
          }
          v34 = ((uint64_t (*)(uint64_t))off_100010050[5])(v36);
          if ((v19 & 1) == 0)
            goto LABEL_119;
          goto LABEL_114;
        }
        LODWORD(__dst) = 0;
        v24 = 1;
LABEL_69:
        v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
        if (!v8)
        {
          v23 = bswap32(__dst);
          LODWORD(__dst) = 0;
          v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
          if (!v8)
          {
            v22 = bswap32(__dst);
            LODWORD(__dst) = 0;
            v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
            if (!v8)
            {
              v21 = bswap32(__dst);
              LODWORD(__dst) = 0;
              v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
              if (!v8)
              {
                v20 = bswap32(__dst);
                goto LABEL_74;
              }
LABEL_73:
              v20 = 0;
LABEL_74:
              v25 = 0;
LABEL_75:
              if (!v8)
                goto LABEL_76;
LABEL_2:
              v9 = printf("%s error parsing mount info (%d)\n", (const char *)(a1 + 88), v8);
LABEL_3:
              ((void (*)(uint64_t))off_100010050[2])(v9);
LABEL_4:
              sub_1000062E0((uint64_t)v88);
              sub_1000062E0((uint64_t)v60);
              return;
            }
LABEL_72:
            v21 = 0;
            goto LABEL_73;
          }
LABEL_71:
          v22 = 0;
          goto LABEL_72;
        }
LABEL_70:
        v23 = 0;
        goto LABEL_71;
      }
      LODWORD(__dst) = 0;
    }
    v8 = sub_100003EB8((uint64_t)&v56, (char *)&__dst, 4u, 0);
    if (!v8)
      v8 = sub_100006530((uint64_t)&v56, bswap32(__dst), (uint64_t)v60);
    goto LABEL_49;
  }
  printf("%s bogus mount info length %u > %zu\n\n");
}

uint64_t sub_100009B24(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  const char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (result)
  {
    v2 = *(_QWORD *)(result + 4);
    if (v2)
    {
      v4 = 0;
      v5 = result + 12;
      v6 = 1;
      do
      {
        v7 = sub_100009C4C((char *)(v5 + 1049 * v4), a2);
        v8 = *(_QWORD *)(v5 + 1049 * v4 + 1025);
        if (v7)
        {
          v9 = *(_QWORD *)(v7 + 1025);
          v10 = *(_QWORD *)(v7 + 1033);
          v11 = v9 - v8;
          v12 = v8 >= v9;
          v13 = v8 - v9;
          if (!v12)
            v13 = v11;
          v14 = v5 + 1049 * v4;
          v15 = *(_QWORD *)(v14 + 1033);
          v16 = v10 - v15;
          v12 = v15 >= v10;
          v17 = v15 - v10;
          if (!v12)
            v17 = v16;
          v18 = *(_QWORD *)(v14 + 1041);
          v19 = *(_QWORD *)(v7 + 1041);
          v20 = v19 - v18;
          v12 = v18 >= v19;
          v21 = v18 - v19;
          if (!v12)
            v21 = v20;
          result = printf("%12llu %12llu %12llu %s\n", v13, v17, v21, (const char *)(v5 + 1049 * v4));
        }
        else
        {
          result = printf("%12llu %12llu %12llu %s\n", v8, *(_QWORD *)(v5 + 1049 * v4 + 1033), *(_QWORD *)(v5 + 1049 * v4 + 1041), (const char *)(v5 + 1049 * v4));
        }
        v4 = v6;
      }
      while (v2 > v6++);
    }
    else
    {
      return puts("No exported directories found");
    }
  }
  return result;
}

const char *sub_100009C4C(char *__s1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  const char *v7;

  if (!a2)
    return 0;
  v2 = *(_QWORD *)(a2 + 4);
  if (!v2)
    return 0;
  v4 = 0;
  v5 = a2 + 12;
  v6 = 1;
  while (1)
  {
    v7 = (const char *)(v5 + 1049 * v4);
    if (!strcmp(__s1, v7))
      break;
    v4 = v6;
    if (v2 <= v6++)
      return 0;
  }
  return v7;
}

uint64_t **sub_100009CC0(uint64_t a1)
{
  int v1;
  uint64_t **v3;
  uint64_t **v4;
  int v5;
  uint64_t *v6;
  char *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v1 = *(_DWORD *)(a1 + 4);
  if (!v1)
    return 0;
  v3 = (uint64_t **)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  v4 = v3;
  if (v3)
  {
    v5 = 0;
    v6 = 0;
    *v3 = 0;
    v7 = (char *)(a1 + 8);
    do
    {
      if (*v7)
      {
        if (*v7 != 1)
        {
          printf("nfsstat: unexpected record type 0x%02x in active user data stream\n", *v7);
LABEL_22:
          sub_10000A04C(v4);
          free(v4);
          return 0;
        }
        v8 = (uint64_t *)malloc_type_malloc(0x20uLL, 0xA00404900C826uLL);
        if (!v8)
          goto LABEL_22;
        v6 = v8;
        v8[2] = 0;
        v8[3] = (uint64_t)v7;
        v9 = *v4;
        *v8 = (uint64_t)*v4;
        if (v9)
          v9[1] = (uint64_t)v8;
        *v4 = v8;
        v8[1] = (uint64_t)v4;
        v10 = 1026;
      }
      else
      {
        if (!v6)
          goto LABEL_22;
        v11 = malloc_type_malloc(0x18uLL, 0xA0040A8488062uLL);
        if (!v11)
          goto LABEL_22;
        v11[2] = v7;
        v12 = v6 + 2;
        v13 = (_QWORD *)v6[2];
        if (v13)
        {
          while (1)
          {
            v12 = v13;
            if (*(_QWORD *)(v7 + 165) > *(_QWORD *)(v13[2] + 165))
              break;
            v13 = (_QWORD *)*v13;
            if (!*v12)
            {
              *v11 = 0;
              *v12 = v11;
              v10 = 173;
              goto LABEL_17;
            }
          }
          v14 = v13[1];
          *v11 = v12;
          v11[1] = v14;
          *(_QWORD *)v12[1] = v11;
          v12[1] = v11;
          v10 = 173;
        }
        else
        {
          *v12 = v11;
          v10 = 173;
          *v11 = 0;
LABEL_17:
          v11[1] = v12;
        }
      }
      v7 += v10;
      ++v5;
    }
    while (v5 != v1);
  }
  return v4;
}

uint64_t sub_100009E48(uint64_t a1, char a2)
{
  _OWORD *v4;
  int v5;
  hostent *v6;
  char *h_name;
  char *v8;
  int v9;
  hostent *v10;
  passwd *v11;
  passwd *v12;
  uint64_t v13;
  uint64_t v15;
  timeval v16;
  _OWORD v17[2];
  uint64_t v18;
  char v19[1025];
  __int128 v20;

  v20 = 0uLL;
  memset(v17, 0, 28);
  v16.tv_sec = 0;
  *(_QWORD *)&v16.tv_usec = 0;
  v15 = 0;
  bzero(v19, 0x401uLL);
  v18 = 0x2A202A202A202ALL;
  gettimeofday(&v16, &v15);
  v4 = (_OWORD *)(a1 + 5);
  v5 = *(unsigned __int8 *)(a1 + 6);
  if (v5 == 30)
  {
    v17[0] = *v4;
    *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)(a1 + 17);
    if ((a2 & 1) == 0)
    {
      v10 = gethostbyaddr((char *)v17 + 8, 0x10u, 30);
      if (v10)
      {
        h_name = v10->h_name;
        if (v10->h_name)
          goto LABEL_13;
      }
    }
    v8 = (char *)v17 + 8;
    h_name = v19;
    v9 = 30;
LABEL_11:
    if (!inet_ntop(v9, v8, v19, 0x401u))
      h_name = (char *)&v18;
LABEL_13:
    if ((a2 & 2) != 0)
      goto LABEL_18;
    goto LABEL_16;
  }
  if (v5 == 2)
  {
    v20 = *v4;
    if ((a2 & 1) == 0)
    {
      v6 = gethostbyaddr((char *)&v20 + 4, 4u, 2);
      if (v6)
      {
        h_name = v6->h_name;
        if (v6->h_name)
          goto LABEL_13;
      }
    }
    v8 = (char *)&v20 + 4;
    h_name = v19;
    v9 = 2;
    goto LABEL_11;
  }
  h_name = (char *)&v18;
  if ((a2 & 2) != 0)
  {
LABEL_18:
    v12 = 0;
    v13 = 1;
    return ((uint64_t (*)(uint64_t, char *, passwd *, uint64_t))off_100010050[15])(a1, h_name, v12, v13);
  }
LABEL_16:
  v11 = getpwuid(*(_DWORD *)(a1 + 1));
  if (!v11)
    goto LABEL_18;
  v12 = v11;
  v13 = 0;
  return ((uint64_t (*)(uint64_t, char *, passwd *, uint64_t))off_100010050[15])(a1, h_name, v12, v13);
}

void sub_10000A04C(uint64_t **a1)
{
  uint64_t *i;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  for (i = *a1; *a1; i = *a1)
  {
    v3 = *i;
    if (*i)
      *(_QWORD *)(v3 + 8) = i[1];
    *(_QWORD *)i[1] = v3;
    while (1)
    {
      v4 = (uint64_t *)i[2];
      if (!v4)
        break;
      v5 = *v4;
      if (*v4)
        *(_QWORD *)(v5 + 8) = v4[1];
      *(_QWORD *)v4[1] = v5;
      free(v4);
    }
    free(i);
  }
}

void sub_10000A0C0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t **v5;
  uint64_t **v6;
  uint64_t *i;
  char *v8;
  _QWORD *j;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _OWORD *v14;
  _OWORD v15[11];

  if (a1)
  {
    if (*(_DWORD *)(a1 + 4))
    {
      v5 = sub_100009CC0(a1);
      if (v5)
      {
        v6 = v5;
        memset(v15, 0, 173);
        for (i = *v5; i; i = (uint64_t *)*i)
        {
          v8 = (char *)(i[3] + 1);
          puts(v8);
          for (j = (_QWORD *)i[2]; j; j = (_QWORD *)*j)
          {
            v10 = j[2];
            v11 = sub_10000A28C(v8, v10, a2);
            if (v11)
            {
              v13 = *(unsigned __int8 *)(v10 + 5);
              v12 = v10 + 5;
              *(_DWORD *)((char *)v15 + 1) = *(_DWORD *)(v12 - 4);
              *(_OWORD *)((char *)&v15[9] + 13) = *(_OWORD *)(v12 + 152);
              *(int64x2_t *)((char *)&v15[8] + 5) = vsubq_s64(*(int64x2_t *)(v12 + 128), *(int64x2_t *)(v11 + 133));
              *(_QWORD *)((char *)&v15[9] + 5) = *(_QWORD *)(v12 + 144) - *(_QWORD *)(v11 + 149);
              __memmove_chk((char *)v15 + 5, v12, v13, 168);
              v14 = v15;
            }
            else
            {
              v14 = (_OWORD *)v10;
            }
            sub_100009E48((uint64_t)v14, a3);
          }
        }
        sub_10000A04C(v6);
        free(v6);
      }
      else
      {
        puts("Not enough  memory for displaying active user statistics");
      }
    }
    else
    {
      puts("No NFS active user statistics found.");
    }
  }
}

uint64_t sub_10000A28C(char *__s1, uint64_t a2, uint64_t a3)
{
  int v3;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    v3 = *(_DWORD *)(a3 + 4);
    if (v3)
    {
      v6 = 0;
      v7 = a3 + 8;
      do
      {
        if (*(_BYTE *)v7)
        {
          if (*(_BYTE *)v7 != 1 || v6)
            return 0;
          v6 = strcmp(__s1, (const char *)(v7 + 1)) == 0;
          v8 = 1026;
        }
        else
        {
          if (v6 && !sub_10000A330(a2, v7))
            return v7;
          v8 = 173;
        }
        v7 += v8;
        --v3;
      }
      while (v3);
    }
  }
  return 0;
}

BOOL sub_10000A330(uint64_t a1, uint64_t a2)
{
  int v2;
  BOOL v3;

  if (*(_DWORD *)(a1 + 1) != *(_DWORD *)(a2 + 1))
    return 1;
  if (*(unsigned __int8 *)(a1 + 5) != *(unsigned __int8 *)(a2 + 5))
    return 1;
  v2 = *(unsigned __int8 *)(a1 + 6);
  if (v2 != *(unsigned __int8 *)(a2 + 6))
    return 1;
  if (v2 == 2)
    v3 = HIDWORD(*(_QWORD *)(a1 + 5)) == HIDWORD(*(_QWORD *)(a2 + 5));
  else
    v3 = *(_QWORD *)(a1 + 13) == *(_QWORD *)(a2 + 13)
      && (unint64_t)(*(_OWORD *)(a1 + 17) >> 32) == (unint64_t)(*(_OWORD *)(a2 + 17) >> 32);
  return !v3;
}

void sub_10000A410(uint64_t a1, const char *a2)
{
  err(1, a2);
}

void sub_10000A418(uint64_t a1)
{
  sub_10000A410(a1, "getmntinfo");
}

void sub_10000A42C(uint64_t a1)
{
  sub_10000A410(a1, "sysctl");
}

void sub_10000A440(uint64_t a1)
{
  sub_10000A410(a1, "nfssvc failed");
}

void sub_10000A454(void **a1)
{
  uint64_t v1;

  free(*a1);
  sub_10000A410(v1, "nfssvc failed");
}

void sub_10000A470(void *a1)
{
  free(a1);
  errx(1, "NFS export stat version mismatch");
}

void sub_10000A48C(void *a1)
{
  free(a1);
  errx(1, "NFS user stat version mismatch");
}

void sub_10000A4A8(uint64_t a1)
{
  sub_10000A410(a1, "getvfsbyname: NFS not compiled into kernel");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleWithStandardOutput");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_outputStreamToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputStreamToFileAtPath:append:");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}

id objc_msgSend_writeJSONObject_toStream_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeJSONObject:toStream:options:error:");
}
